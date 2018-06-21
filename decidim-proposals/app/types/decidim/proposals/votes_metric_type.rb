# frozen_string_literal: true

module Decidim
  module Proposals
    VotesMetricType = GraphQL::ObjectType.define do
      interfaces [-> { Decidim::Proposals::VotesMetricInterface }]

      name "votesMetric"
      description "A votes related to proposals of a participatory space."
    end

    module VotesMetricTypeHelper
      include Decidim::Proposals::BaseProposalMetricTypeHelper

      def self.base_scope(organization)
        proposals = super(organization).except_withdrawn
        ProposalVote.joins(:proposal).where(proposal: proposals)
      end
    end
  end
end

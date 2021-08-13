Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10B03EB333
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 11:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhHMJMc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 05:12:32 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:60452 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238739AbhHMJMc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 05:12:32 -0400
X-IronPort-AV: E=Sophos;i="5.84,318,1620658800"; 
   d="scan'208";a="90541556"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Aug 2021 18:12:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C46B54228B65;
        Fri, 13 Aug 2021 18:11:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 0/3] Add RZ/G2L Sound support
Date:   Fri, 13 Aug 2021 10:11:53 +0100
Message-Id: <20210813091156.10700-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add ASoC support on RZ/G2L SoC's.

It is based on the work done by Chris Brandt for RZ/A ASoC driver.

v4->v5
 * Moved validation of sample bits in hw_params
 * Removed validation of frame bits as it is redundant
 * split the rz_ssi_start_stop function into rz_ssi_start and rz_ssi_stop.
 * remove the spin_lock around rz_ssi_stream_init.
 * Updated dmas description and removed fixes as it is an enhancement
   now.
 * updated ssi_start functions with setting fifo thresholds
   and ssi_stop function with cancel all dma txn.
v3->v4:
 * Updated the subject line as per style for the subsystem.
 * Removed select SND_SIMPLE_CARD from Kconfig
 * Added C++ comments for copyright and driver description.
 * Moved validation of channels in hw_params
 * removed asm issue reported by bot as well as Mark
 * replaced master/slave macros with provider/consumer macros
 * Improved locking and added more null pointer checks.
v2->v3:
 * Fixed the dependency on KCONFIG
 * Merged the binding patch with dma feature added
 * Updated dt binding example with encoded #dma-cells value.
 * Improved Error handling in probe function
 * Removed the passing legacy channel configuration parameters from
   dmaengine_slave_config function
 * started using dma_request_chan instead of deprecated
   dma_request_slave_channel
 * Removed SoC dtsi and config patches from this series. Will send it later.
v1->v2:
 * Rebased to latest rc kernel

Biju Das (3):
  ASoC: sh: Add RZ/G2L SSIF-2 driver
  ASoC: dt-bindings: renesas,rz-ssi: Update slave dma channel
    configuration parameters
  ASoC: sh: rz-ssi: Add SSI DMAC support

 .../bindings/sound/renesas,rz-ssi.yaml        |   22 +-
 sound/soc/sh/Kconfig                          |    6 +
 sound/soc/sh/Makefile                         |    4 +
 sound/soc/sh/rz-ssi.c                         | 1063 +++++++++++++++++
 4 files changed, 1093 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sh/rz-ssi.c

-- 
2.17.1


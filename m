Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC233F016A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Aug 2021 12:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhHRKPe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Aug 2021 06:15:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:40091 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230435AbhHRKPe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Aug 2021 06:15:34 -0400
X-IronPort-AV: E=Sophos;i="5.84,330,1620658800"; 
   d="scan'208";a="91022020"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Aug 2021 19:14:56 +0900
Received: from localhost.localdomain (unknown [10.226.93.61])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3B5D1400F783;
        Wed, 18 Aug 2021 19:14:53 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_dma_request function
Date:   Wed, 18 Aug 2021 11:14:50 +0100
Message-Id: <20210818101450.15948-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

dma_request_chan() returns error pointer in case of failures, but
the rz_ssi_dma_request() checked for NULL pointer instead.

This patch fixes the issue by checking for ERR_PTR() instead of
NULL and sets the DMA pointers to NULL in error case so that ssi
can fallback to PIO mode.

Fixes: 26ac471c5354 ("ASoC: sh: rz-ssi: Add SSI DMAC support")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
 * Added Fixes tag
 * For SSI with with full-duplex transmission and reception, 
   Add support for fallback to PIO mode, if both channels are
   not available.

v1->v2:
 * Replaced IS_ERR_OR_NULL with IS_ERR for error pointer check, as the
   dma_request_chan function never returns NULL pointer for error case.
---
 sound/soc/sh/rz-ssi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index f097c773d413..fa0cc08f70ec 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -185,7 +185,7 @@ rz_ssi_stream_get(struct rz_ssi_priv *ssi, struct snd_pcm_substream *substream)
 
 static inline bool rz_ssi_is_dma_enabled(struct rz_ssi_priv *ssi)
 {
-	return (ssi->playback.dma_ch || ssi->capture.dma_ch);
+	return (ssi->playback.dma_ch && (ssi->dma_rt || ssi->capture.dma_ch));
 }
 
 static int rz_ssi_stream_is_valid(struct rz_ssi_priv *ssi,
@@ -676,15 +676,26 @@ static void rz_ssi_release_dma_channels(struct rz_ssi_priv *ssi)
 static int rz_ssi_dma_request(struct rz_ssi_priv *ssi, struct device *dev)
 {
 	ssi->playback.dma_ch = dma_request_chan(dev, "tx");
+	if (IS_ERR(ssi->playback.dma_ch))
+		ssi->playback.dma_ch = NULL;
+
 	ssi->capture.dma_ch = dma_request_chan(dev, "rx");
+	if (IS_ERR(ssi->capture.dma_ch))
+		ssi->capture.dma_ch = NULL;
+
 	if (!ssi->playback.dma_ch && !ssi->capture.dma_ch) {
 		ssi->playback.dma_ch = dma_request_chan(dev, "rt");
-		if (!ssi->playback.dma_ch)
+		if (IS_ERR(ssi->playback.dma_ch)) {
+			ssi->playback.dma_ch = NULL;
 			goto no_dma;
+		}
 
 		ssi->dma_rt = true;
 	}
 
+	if (!rz_ssi_is_dma_enabled(ssi))
+		goto no_dma;
+
 	if (ssi->playback.dma_ch &&
 	    (rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch, true) < 0))
 		goto no_dma;
-- 
2.17.1


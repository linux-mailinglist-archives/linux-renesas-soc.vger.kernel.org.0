Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A381E3ED6F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Aug 2021 15:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhHPNZ1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Aug 2021 09:25:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:16424 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239873AbhHPNVf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Aug 2021 09:21:35 -0400
X-IronPort-AV: E=Sophos;i="5.84,324,1620658800"; 
   d="scan'208";a="90799322"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Aug 2021 22:20:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C55F243028A9;
        Mon, 16 Aug 2021 22:20:52 +0900 (JST)
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
Subject: [PATCH] ASoC: sh: rz-ssi: Fix dereference of noderef expression warning
Date:   Mon, 16 Aug 2021 14:20:49 +0100
Message-Id: <20210816132049.28128-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix following sparse warning:
sound/soc/sh/rz-ssi.c:156:15: sparse: warning: dereference of
noderef expression

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/sh/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index 2f9345415a15..7fa3737b90bf 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -148,7 +148,7 @@ static u32 rz_ssi_reg_readl(struct rz_ssi_priv *priv, uint reg)
 	return readl(priv->base + reg);
 }
 
-static void rz_ssi_reg_mask_setl(struct rz_ssi_priv __iomem *priv, uint reg,
+static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 				 u32 bclr, u32 bset)
 {
 	u32 val;
-- 
2.17.1


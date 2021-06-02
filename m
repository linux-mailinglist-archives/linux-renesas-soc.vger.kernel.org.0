Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4745039830E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jun 2021 09:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhFBHgY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Jun 2021 03:36:24 -0400
Received: from www.zeus03.de ([194.117.254.33]:36376 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231590AbhFBHgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 03:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=unNYibepvut6tLpKDUESbTSD11S
        J/DCM/TpYf8hSBq4=; b=LFCc5FW1XI0Kjxw09UIoxZrlfcf2PA9rRindPHAoFFk
        isbOLkJVkX3p9q13Hl5rRydwxJNllk+/pCY8nUO+9JxYauwolUG1g8xPogXUBnce
        ZXgRgGnYvWxDLeioZPNGEwY3fiPERyFQv/yQCSaGMdBs7yNEXnU2L47AhSMEQWPY
        =
Received: (qmail 594059 invoked from network); 2 Jun 2021 09:34:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2021 09:34:40 +0200
X-UD-Smtp-Session: l3s3148p1@Hl7OfcPDCIcgARa4RcfgAY/i/QRA3j/I
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: abort tuning when timeout detected
Date:   Wed,  2 Jun 2021 09:34:35 +0200
Message-Id: <20210602073435.5955-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We have to bring the eMMC from sending-data state back to transfer state
once we detected a CRC error (timeout) during tuning. So, send a stop
command via mmc_abort_tuning().

Fixes: 4f11997773b6 ("mmc: tmio: Add tuning support")
Reported-by Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Ulf, I'd think that mmc_abort_tuning() should be named
mmc_abort_tuning_cmd() instead. Because we don't actually abort the
tuning as a whole in this function. What do you think? I can prepare a
patch if you agree.

 drivers/mmc/host/renesas_sdhi_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 635bf31a6735..9029308c4a0f 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -692,14 +692,19 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 
 	/* Issue CMD19 twice for each tap */
 	for (i = 0; i < 2 * priv->tap_num; i++) {
+		int cmd_error;
+
 		/* Set sampling clock position */
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % priv->tap_num);
 
-		if (mmc_send_tuning(mmc, opcode, NULL) == 0)
+		if (mmc_send_tuning(mmc, opcode, &cmd_error) == 0)
 			set_bit(i, priv->taps);
 
 		if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP) == 0)
 			set_bit(i, priv->smpcmp);
+
+		if (cmd_error)
+			mmc_abort_tuning(mmc, opcode);
 	}
 
 	ret = renesas_sdhi_select_tuning(host);
-- 
2.30.2


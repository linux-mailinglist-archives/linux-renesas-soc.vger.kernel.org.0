Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7683FC84A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Aug 2021 15:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbhHaNfA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Aug 2021 09:35:00 -0400
Received: from www.zeus03.de ([194.117.254.33]:42306 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229844AbhHaNfA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Aug 2021 09:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=CD21AsswF3LGAHdmViZKHobiAwU
        n1LFzkJV/KSOwL3o=; b=olHZ9iRxQEs4jrnFAbzlqmsyZwt98Z+RhR3XeYZ1Zea
        mmsNRRn9javnZrzNd9vm3JjNhZ8vSD8+PYSoKhzeKPPaylr/7wxdBI3fdZPeSkID
        k9PcnJPU6sop+ZoYl0Qxl04t7jM4V4zGm0EWrUpbebcORguTpfgcKL6lPGJPuPRc
        =
Received: (qmail 2717121 invoked from network); 31 Aug 2021 15:34:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Aug 2021 15:34:02 +0200
X-UD-Smtp-Session: l3s3148p1@SFaFANvKatwgARa4RTxnAQOT/3kqwktG
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC] HACK: mmc: core: also abort tuning with CMD12 for SD
Date:   Tue, 31 Aug 2021 15:33:49 +0200
Message-Id: <20210831133349.18203-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We have various SanDisk cards which fail tuning to SDR104 unless we
allow a CMD12 also to be sent to abort a broken tuning. It is true that
the SD specs do not mention that CMD12 is allowed, but they also don't
say it is forbidden. And now reality tells that it is needed to make
some cards work. Other cards I tried did not regress.

If we can agree to allow this for SD, then the problem is now SDIO which
does not support CMD12. mmc_card_sdio() does not work at this stage
because host->card is still NULL. Is there any other way to distinguish
SD and SDIO here?

Not-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Hey guys,

so, there are two questions here:
1) despite not being mentioned in the spec, do we want to allow CMD12 to
   abort tuning for SD as well?

2) If so, how to make sure not apply it to SDIO but SD only?

Thanks for your input! Kind regards,

   Wolfram


 drivers/mmc/core/mmc_ops.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
index 973756ed4016..02d378255895 100644
--- a/drivers/mmc/core/mmc_ops.c
+++ b/drivers/mmc/core/mmc_ops.c
@@ -704,14 +704,6 @@ int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode)
 {
 	struct mmc_command cmd = {};
 
-	/*
-	 * eMMC specification specifies that CMD12 can be used to stop a tuning
-	 * command, but SD specification does not, so do nothing unless it is
-	 * eMMC.
-	 */
-	if (opcode != MMC_SEND_TUNING_BLOCK_HS200)
-		return 0;
-
 	cmd.opcode = MMC_STOP_TRANSMISSION;
 	cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
 
-- 
2.30.2


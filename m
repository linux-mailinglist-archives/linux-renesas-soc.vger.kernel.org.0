Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F895463554
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 14:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhK3N0g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 08:26:36 -0500
Received: from www.zeus03.de ([194.117.254.33]:37846 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239926AbhK3N0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 08:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=kevkKnStG1oCLnGIIxBhmraeJZ0
        XXWYIfjzozQrJ+uw=; b=evkvPRTfW0Z+uDzYG6mNQbi9PQgM/Xh9y5fXvwtvE35
        ZqvuneqKBluL3rPGfLO6tj2nAslgOpQQAo7CMCcvl1JItF8ePwdnSjrsMLFg24+c
        q0boWYfk3ykmprfIu2DiwnBpwMFVIlOYILN4EqunAa6nVSxncu5yFD6KSabRWaqY
        =
Received: (qmail 3810498 invoked from network); 30 Nov 2021 14:23:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Nov 2021 14:23:15 +0100
X-UD-Smtp-Session: l3s3148p1@aSuwdQHS/OggAwDPXxCYAODRq/Cv/3uh
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] mmc: renesas_sdhi: initialize variable properly when tuning
Date:   Tue, 30 Nov 2021 14:23:09 +0100
Message-Id: <20211130132309.18246-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

'cmd_error' is not necessarily initialized on some error paths in
mmc_send_tuning(). Initialize it.

Fixes: 2c9017d0b5d3 ("mmc: renesas_sdhi: abort tuning when timeout detected")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Salvator-XS (R-Car M3N), tuning still works.

Ulf, this is a bugfix, can you take it via your tree for this cycle
please?

 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a4407f391f66..f5b2684ad805 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -673,7 +673,7 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 
 	/* Issue CMD19 twice for each tap */
 	for (i = 0; i < 2 * priv->tap_num; i++) {
-		int cmd_error;
+		int cmd_error = 0;
 
 		/* Set sampling clock position */
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % priv->tap_num);
-- 
2.30.2


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FC945451F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 11:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbhKQKlz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 05:41:55 -0500
Received: from www.zeus03.de ([194.117.254.33]:45352 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232427AbhKQKlx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 05:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=zHjdCVq+a0PvtblKzK6PT9cMv4X
        +XFtvK67UlQ+b0O4=; b=A4Q8rhG5fgLVzhd4QDEcdUQhd1IGXIlyC9WIdJUnAX1
        vU/c10T5f1UEKZ0JE3IAGLXv0tT6yNbz8m41E3U+U061TnbJtdYRbY9DnuoK0Wlc
        aB5g9YXehxqGGRdJUmhmkbFf1dcY2Q9549+e26ACB9G3QG3fnn1sfMJuYB4bnfBU
        =
Received: (qmail 3058614 invoked from network); 17 Nov 2021 11:38:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Nov 2021 11:38:52 +0100
X-UD-Smtp-Session: l3s3148p1@YUXspfnQ0uwgAwDPXwoaAHKn46ZTsFWo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: simplify an expression
Date:   Wed, 17 Nov 2021 11:38:50 +0100
Message-Id: <20211117103850.28397-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We already have 'quirks', no need to go via 'priv'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a4407f391f66..29bc086f6cb5 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1044,7 +1044,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	     host->mmc->caps2 & (MMC_CAP2_HS200_1_8V_SDR |
 				 MMC_CAP2_HS400_1_8V))) {
 		const struct renesas_sdhi_scc *taps = of_data->taps;
-		bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
+		bool use_4tap = quirks && quirks->hs400_4taps;
 		bool hit = false;
 
 		for (i = 0; i < of_data->taps_num; i++) {
-- 
2.30.2


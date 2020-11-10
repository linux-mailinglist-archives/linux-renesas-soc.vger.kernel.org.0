Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699FF2ADB8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 17:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbgKJQWB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 11:22:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:35262 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729227AbgKJQWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 11:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=E08gAQ9g7L2mVS
        BW50SK/40b7jG9Lr4VHYgUpPCZVQs=; b=vly0EXaxDRCaJBq3EviN7v4YgCEViZ
        0fFP+2n8qwfbnZNgQUpzD51hhDbrpnKrZqQ589zY3gdyJ3xxHTOuje5qF2Rti14T
        PakZxZae0U9tDC3NiAETkDQLJoE3yw55pNBa4heyIELfUx7rb4TNxTSKYP3M5gje
        6OYdrYBYorULM=
Received: (qmail 2226100 invoked from network); 10 Nov 2020 17:21:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 17:21:59 +0100
X-UD-Smtp-Session: l3s3148p1@z20BFMOzTssgAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] mmc: renesas_sdhi: remove superfluous SCLKEN
Date:   Tue, 10 Nov 2020 17:21:51 +0100
Message-Id: <20201110162151.37622-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
References: <20201110162151.37622-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All previously called functions handle SCLKEN on their own, no need to
enable it again in sdhi_reset().

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a77dc9b46041..25c6a1993f8e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -556,9 +556,6 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 		renesas_sdhi_reset_hs400_mode(host, priv);
 		priv->needs_adjust_hs400 = false;
 
-		sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
-				sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
-
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
 			       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
 			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
-- 
2.28.0


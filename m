Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FBF2DE855
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 18:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732342AbgLRRi3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 12:38:29 -0500
Received: from www.zeus03.de ([194.117.254.33]:35734 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732329AbgLRRi2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=EVlZoJIUam2p2G
        71uWZrVr32vMOVka9mDMDxL2BoFEg=; b=xjtOFa5uWqPFcKYHT38tj/QyzcUWyc
        F2lLePqH7PJRrEn+nR1lra5A6+rjBAmMiiLr+AWpCqU8wE5EaL0Ty46BjSi6p+hI
        7phmAb6f/KtxkAbp8m5NyXlj1JaTuda/rr8RnBNxVRJZXsQH13ZuocuyONYQFrXe
        Jaldw1F8KGmYo=
Received: (qmail 3906834 invoked from network); 18 Dec 2020 18:37:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2020 18:37:39 +0100
X-UD-Smtp-Session: l3s3148p1@kzOQkMC2bpggAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] WIP soc: v3u: allow WDT reset
Date:   Fri, 18 Dec 2020 18:37:30 +0100
Message-Id: <20201218173731.12839-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
References: <20201218173731.12839-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Other Gen3 SoCs do this in the bootloader. Maybe V3U will also later?
For now, add it so we can properly reboot via remote.

Not to be applied yet, just for demonstration.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/soc/renesas/rcar-rst.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 8a1e402ea799..d3364fe57150 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,6 +12,13 @@
 
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
+#define V3U_WDTRSTCR		0x0010
+
+static int v3u_rst_enable_wdt_reset(void __iomem *base)
+{
+	iowrite32(WDTRSTCR_RESET, base + V3U_WDTRSTCR);
+	return 0;
+}
 
 static int rcar_rst_enable_wdt_reset(void __iomem *base)
 {
@@ -39,6 +46,7 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
 
 static const struct rst_config rcar_rst_r8a779a0 __initconst = {
 	.modemr = 0x00,		/* MODEMR0 and it has CPG related bits */
+	.configure = v3u_rst_enable_wdt_reset,
 };
 
 static const struct of_device_id rcar_rst_matches[] __initconst = {
-- 
2.29.2


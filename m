Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33FB4544FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 11:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236265AbhKQKcH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 05:32:07 -0500
Received: from www.zeus03.de ([194.117.254.33]:41880 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230266AbhKQKcG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 05:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=FTw0UhxZizLtVDVepjI2HvqrbeF
        rcfInphCq5+idkWA=; b=VvO5q1i13J2QX2/8GhefyWFra8yVMk1K049en1OMJEC
        UufTFIzax4RX1t9PQXdN+wizXWIKR8fdOyuojMEUXbUNVvdTFl8nTf7qd7ifA7KJ
        HSC77pZsRKfTZ0ig3n2vYB1w68UZN8HkbJHlU2yPR8mAhlpVEgUD6lwUw+ph9F7w
        =
Received: (qmail 3055290 invoked from network); 17 Nov 2021 11:29:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Nov 2021 11:29:07 +0100
X-UD-Smtp-Session: l3s3148p1@TY4Cg/nQsuwgAwDPXwoaAHKn46ZTsFWo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT] memory: renesas-rpc-if: simplify register update
Date:   Wed, 17 Nov 2021 11:29:02 +0100
Message-Id: <20211117102902.20062-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

No need to open code regmap_update_bits().

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only build tested as I don't have the G2L hardware.
@Prabhakar: would you also kindly test this patch?

 drivers/memory/renesas-rpc-if.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index a9f3e7bdddf8..0c8f00323a91 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -258,17 +258,14 @@ EXPORT_SYMBOL(rpcif_sw_init);
 
 static void rpcif_rzg2l_timing_adjust_sdr(struct rpcif *rpc)
 {
-	u32 data;
-
 	regmap_write(rpc->regmap, RPCIF_PHYWR, 0xa5390000);
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000000);
 	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000022);
 	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00008080);
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000024);
-
-	regmap_read(rpc->regmap, RPCIF_PHYCNT, &data);
-	regmap_write(rpc->regmap, RPCIF_PHYCNT, data | RPCIF_PHYCNT_CKSEL(3));
+	regmap_update_bits(rpc->regmap, RPCIF_PHYCNT, RPCIF_PHYCNT_CKSEL(3),
+			   RPCIF_PHYCNT_CKSEL(3));
 	regmap_write(rpc->regmap, RPCIF_PHYWR, 0x00000030);
 	regmap_write(rpc->regmap, RPCIF_PHYADD, 0x80000032);
 }
-- 
2.30.2


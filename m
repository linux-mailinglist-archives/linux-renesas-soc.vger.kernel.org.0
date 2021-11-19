Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4743A456DF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Nov 2021 12:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbhKSLHy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Nov 2021 06:07:54 -0500
Received: from www.zeus03.de ([194.117.254.33]:55580 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229521AbhKSLHy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 06:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=Q5hBlseJ4CtxJ5PJ/p/Zakla2XF
        bhRUuAD43AIi09cI=; b=Wv5+MZNFL9VYJ2vN5skrZDSJq9v8+dq5xZYK+YGhncZ
        /PkOh+Jj1IxWR/Rrm6r/pY4x5mGXW/cW/AeoSob+yDzl/13jmHgf6NrBUTMiZlDc
        qldEdwWw71WkUqw32lJEJwkG+GK0a5a2vK3KpFIuaQMToSqOnyxK2JwnNcOizN9M
        =
Received: (qmail 3883871 invoked from network); 19 Nov 2021 12:04:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Nov 2021 12:04:51 +0100
X-UD-Smtp-Session: l3s3148p1@1PpHPiLRPsUgAQnoAEKfAbIul1RxZQ+M
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] memory: renesas-rpc-if: refactor MOIIO and IOFV macros
Date:   Fri, 19 Nov 2021 12:04:42 +0100
Message-Id: <20211119110442.4946-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Don't use _HIZ macros but also provide a val. This is more consistent
with the other macros and, thus, easier to read. Also shorter.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

More readable but otherwise equal. I checked thatthe object files do
match.

 drivers/memory/renesas-rpc-if.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 0c8f00323a91..4fa4e621d41c 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -24,14 +24,13 @@
 #define RPCIF_CMNCR_MOIIO2(val)	(((val) & 0x3) << 20)
 #define RPCIF_CMNCR_MOIIO1(val)	(((val) & 0x3) << 18)
 #define RPCIF_CMNCR_MOIIO0(val)	(((val) & 0x3) << 16)
-#define RPCIF_CMNCR_MOIIO_HIZ	(RPCIF_CMNCR_MOIIO0(3) | \
-				 RPCIF_CMNCR_MOIIO1(3) | \
-				 RPCIF_CMNCR_MOIIO2(3) | RPCIF_CMNCR_MOIIO3(3))
+#define RPCIF_CMNCR_MOIIO(val)	(RPCIF_CMNCR_MOIIO0(val) | RPCIF_CMNCR_MOIIO1(val) | \
+				 RPCIF_CMNCR_MOIIO2(val) | RPCIF_CMNCR_MOIIO3(val))
 #define RPCIF_CMNCR_IO3FV(val)	(((val) & 0x3) << 14) /* documented for RZ/G2L */
 #define RPCIF_CMNCR_IO2FV(val)	(((val) & 0x3) << 12) /* documented for RZ/G2L */
 #define RPCIF_CMNCR_IO0FV(val)	(((val) & 0x3) << 8)
-#define RPCIF_CMNCR_IOFV_HIZ	(RPCIF_CMNCR_IO0FV(3) | RPCIF_CMNCR_IO2FV(3) | \
-				 RPCIF_CMNCR_IO3FV(3))
+#define RPCIF_CMNCR_IOFV(val)	(RPCIF_CMNCR_IO0FV(val) | RPCIF_CMNCR_IO2FV(val) | \
+				 RPCIF_CMNCR_IO3FV(val))
 #define RPCIF_CMNCR_BSZ(val)	(((val) & 0x3) << 0)
 
 #define RPCIF_SSLDR		0x0004	/* R/W */
@@ -304,17 +303,14 @@ int rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
 
 	if (rpc->type == RPCIF_RCAR_GEN3)
 		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
-				   RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_BSZ(3),
-				   RPCIF_CMNCR_MOIIO_HIZ |
+				   RPCIF_CMNCR_MOIIO(3) | RPCIF_CMNCR_BSZ(3),
+				   RPCIF_CMNCR_MOIIO(3) |
 				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
 	else
 		regmap_update_bits(rpc->regmap, RPCIF_CMNCR,
-				   RPCIF_CMNCR_MOIIO_HIZ | RPCIF_CMNCR_IOFV_HIZ |
+				   RPCIF_CMNCR_MOIIO(3) | RPCIF_CMNCR_IOFV(3) |
 				   RPCIF_CMNCR_BSZ(3),
-				   RPCIF_CMNCR_MOIIO3(1) | RPCIF_CMNCR_MOIIO2(1) |
-				   RPCIF_CMNCR_MOIIO1(1) | RPCIF_CMNCR_MOIIO0(1) |
-				   RPCIF_CMNCR_IO3FV(2) | RPCIF_CMNCR_IO2FV(2) |
-				   RPCIF_CMNCR_IO0FV(2) |
+				   RPCIF_CMNCR_MOIIO(1) | RPCIF_CMNCR_IOFV(2) |
 				   RPCIF_CMNCR_BSZ(hyperflash ? 1 : 0));
 
 	/* Set RCF after BSZ update */
-- 
2.30.2


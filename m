Return-Path: <linux-renesas-soc+bounces-25037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C36C7E019
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Nov 2025 12:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D1314E2377
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Nov 2025 11:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B377AB652;
	Sun, 23 Nov 2025 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY+YIp8/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C3B2C21D8
	for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Nov 2025 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763897017; cv=none; b=sIa52aHQe9n/TGviXJw1b+fT+IV8018SGYdQzjUcftzuhX9zVjE0syTe6jfl85fyjN9QAzWy/y+5rzrth31enjePrrbKOtm+sjgMZpLSedNt9vu6o4lUNYsyz3ic2371JZi4IQpJeDr34609DPyc5mV2z2nidQE9ayzhzUpKKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763897017; c=relaxed/simple;
	bh=judJf37ugx+9XxEA6+cURHD2HCi2BGwiplPtaY8oOCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJkS0WKjkEND0nQIdUUQxg5m3V22Uo/Rffe3EAIUzE5WpTF4iljqPjK/M8Qcb/l9ka39SRL5YIlnwosVctEk/BVVkIYK/mKNZpTdcWypGzDcnWaP8t4M1LInCk5D7FySloh0hQH0BSE080QiFWVCgOgRrc8cLkcVhM98Gvhb9mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY+YIp8/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b566859ecso3044122f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Nov 2025 03:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763897010; x=1764501810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emr/+4aLXcwA6DEHvcDwnUuj4foIIDMHEYBSGGBEokE=;
        b=jY+YIp8/cagtNgQnz0l8HNppUimTsVbREcRm6HFrbH11+wJy2+wbl6Zb4JQm8p7v2B
         SdEgXRljd1Mf5jq11TTM/FS+obi17ENWAM1MDkgEzT8w2DW6TUnV2AYC172Jrk0tw5i0
         gQJRcEeZfJOVd7f4MLPjLcfHYqkbVSKd+N38bwpFRzg23WKub6EKkBhlA7tNQmQeF3TQ
         aqIgggQpvm8BfTyH+y8ystpvpAPokNGvr8BhNnyF4etAUwFodMU81t7C0BCsNCqIrXXd
         eNZzG8htzKdr9xQT3nZuSwc/3xm23B5I7iD+Rf6QvLWF8SA9XhJuhdHg6vlbIUEAsMTz
         k8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763897010; x=1764501810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Emr/+4aLXcwA6DEHvcDwnUuj4foIIDMHEYBSGGBEokE=;
        b=uFuO2wcWdLB7JnE6OuAWt2IbN8nuwrmHLRBg8Vp+OD7TY9e/JIv7uE6+QMMOAMogKY
         ZjPiPSwaN8zTroQs+s0Y/yu4BQlPmWj/AhkrTG3JjpLP9VCSTgEE/QYA3nFCXVWfRQIu
         gPLJYwCJFtlUqG1AcW4EdBmwFXk8T2v1SeTmrCZn8Fr//irGFgZthkOvWXV5DL2cBdpA
         WSVBp5Z58TAWO2yxuInW19Vi8Ln8GLeOPlRSrtGdzRzkoJPOMIFjtpX1DQH6/3uqnnqS
         ERaVXJxqI7XXxBZmcvj0qDGIvaCEIRdJcfdbouoruTBzdxnhqv/Ej8LjJMCjqu1sVTXt
         fRaw==
X-Forwarded-Encrypted: i=1; AJvYcCVzlJ+cj+I+X84GeA6Uc1sV0ltu4rBqUif13zuk41FbFX/+iPE32VwdOUxLhcg8klmAWm45IzjBPVgw437yAIJGnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmNVBn/ScX8aEgM0vQ+pWRmPAxwFd39sNxUyrWRSLHRffmKL2Z
	9YJRj4gvE2eM+gOcXkpD98vXAYl/ceahjXy4F6Iq3Ln8FWeGbJuhfQB0
X-Gm-Gg: ASbGncu+4zTF9eyr9eHGadIgsq8QKcgChrN7q26QMW1BygPQsYiki4qTL55rqUR/Tn2
	cKS1rnb9TIs4B8SGeOu4/NgZBK8zHdor+VkTnbjoEYZb1oMNbk3bjH9EXrut8UIFYqlemaGCdql
	v3Qb1I6XXIUdV1CLU6msiVhCf0q/obGAcnRkTwIxrPFTDYNpfrpJ62ceFdBM6e000NE+LuvWHRU
	Gw5SU0Kwd12VNXzeUB7CORoXJmsNV7Ra/GQMio5LzjLNRiR45mOw4tzlhBDDuC+zVWxP6j0+oOQ
	dd1BwS+XCDwrBzlGGWCTR8Sm9HxuhHkBlhN5ZxN0lEb7eKveHCpcQHFqtT9bSYlfh0HB/yHabGq
	imheNE4x7pz3Wj2jOarb2lOpDMhAth1pew9MEopl6h8QranUIyEjoDPMVpupP+UTG/Zq5xTr8Q5
	E1OSAlyqAdd5uujNJyZSJIWlIgAttoulK5eiuDoMxANk28xuM/Mib8QSHejoujilwQNzfJyqI=
X-Google-Smtp-Source: AGHT+IGTTftybiQ2Gt6OA2V2ockpQieSM4HqvkIUoh8tdMLZ7vPfFmd2LOncO8JPMOWOsk/IZByI7w==
X-Received: by 2002:a05:600c:4f48:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-477c01e02e5mr76829755e9.28.1763897010101;
        Sun, 23 Nov 2025 03:23:30 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f49a7bsm21765703f8f.19.2025.11.23.03.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 03:23:29 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/2] can: rcar_canfd: Add support for FD-Only mode
Date: Sun, 23 Nov 2025 11:23:21 +0000
Message-ID: <20251123112326.128448-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251123112326.128448-1-biju.das.jz@bp.renesas.com>
References: <20251123112326.128448-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/{G2L,G3E} and R-Car Gen4 SoCs support additional CAN FD mode called
FD-only mode. In this mode, communication in Classical CAN frame format is
disabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped has_fd_only_mode variable from the struct rcar_canfd_hw_info
   as it is checked by the dt schema validation.
---
 drivers/net/can/rcar/rcar_canfd.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 05dbdf46dd6f..00c3462fc975 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -471,6 +471,7 @@ struct rcar_canfd_global {
 	unsigned long channels_mask;	/* Enabled channels mask */
 	bool extclk;			/* CANFD or Ext clock */
 	bool fdmode;			/* CAN FD or Classical CAN only mode */
+	bool fd_only_mode;		/* FD-Only mode for CAN-FD */
 	struct reset_control *rstc1;
 	struct reset_control *rstc2;
 	const struct rcar_canfd_hw_info *info;
@@ -828,12 +829,20 @@ static int rcar_canfd_reset_controller(struct rcar_canfd_global *gpriv)
 							 RCANFD_GEN4_FDCFG_FDOE);
 				rcar_canfd_set_bit_reg(&gpriv->fcbase[ch].cfdcfg,
 						       RCANFD_GEN4_FDCFG_CLOE);
+			} else if (gpriv->fd_only_mode) {
+				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+							 RCANFD_GEN4_FDCFG_CLOE);
+				rcar_canfd_set_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+						       RCANFD_GEN4_FDCFG_FDOE);
 			} else {
 				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
 							 RCANFD_GEN4_FDCFG_FDOE);
 				rcar_canfd_clear_bit_reg(&gpriv->fcbase[ch].cfdcfg,
 							 RCANFD_GEN4_FDCFG_CLOE);
 			}
+		} else if (gpriv->fd_only_mode) {
+			rcar_canfd_set_bit_reg(&gpriv->fcbase[ch].cfdcfg,
+					       RCANFD_GEN4_FDCFG_FDOE);
 		}
 	}
 
@@ -2041,6 +2050,9 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	gpriv->fdmode = fdmode;
 	gpriv->info = info;
 
+	if (of_property_read_bool(dev->of_node, "renesas,fd-only"))
+		gpriv->fd_only_mode = true; /* FD-Only mode for CAN-FD */
+
 	gpriv->rstc1 = devm_reset_control_get_optional_exclusive(dev, "rstp_n");
 	if (IS_ERR(gpriv->rstc1))
 		return dev_err_probe(dev, PTR_ERR(gpriv->rstc1),
@@ -2190,7 +2202,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gpriv);
 	dev_info(dev, "global operational state (%s clk, %s mode)\n",
 		 gpriv->extclk ? "ext" : "canfd",
-		 gpriv->fdmode ? "fd" : "classical");
+		 gpriv->fdmode ? (gpriv->fd_only_mode ? "fd-only" : "fd") : "classical");
 	return 0;
 
 fail_channel:
-- 
2.43.0



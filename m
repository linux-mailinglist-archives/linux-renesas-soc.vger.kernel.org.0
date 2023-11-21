Return-Path: <linux-renesas-soc+bounces-41-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943DC7F32CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 16:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DF83282E83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 15:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F327D59168;
	Tue, 21 Nov 2023 15:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20230601.gappssmtp.com header.i=@ragnatech-se.20230601.gappssmtp.com header.b="1yBNd35c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C5410CF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:44 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a02c48a0420so81109266b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 07:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700582023; x=1701186823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WnAd+fxIMU0M2YoK/HG0/F62cLWjPueZxjIM5o5heQk=;
        b=1yBNd35cFskuw3LE/vXn+9efY5IynXYRz724nKrvztXx5VVytLQdSquNY/iKObdNuv
         auG/RM7qoCdYCePiE10ydIe9+owgMRGWoOjvp5roFwLCwZGfQrdkrRjX+q8B1azyIh2T
         o9yf6Vi1myH+18o3xaFJwX/NA3tW/8R6I6MK3waAhl5hO0ykCaY1DZfCx58Sabqkk7Rv
         DtXkJ+arzUwApTbxhoE0UbpCkq1xvRouRRtjzXWPHrQRvFEecZ9CoSXpoZlBgIEzDRro
         Q8flOyqNAqhzdOXWW2g8AbfKsxIK9MUv2ZNEWAfzVbCA5EvBujE4lZCdFuPpWCKRQHUF
         AMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582023; x=1701186823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnAd+fxIMU0M2YoK/HG0/F62cLWjPueZxjIM5o5heQk=;
        b=dpd0M23DJ+5X5c/GZNFkCCuKPDNRtBSLIqeRVVbyDoTv7mGLuhjpcWDLhuQnZ6S+wR
         H9PxEm1l2wnak2FH4v22FlINZjrcHohByU68oOgoiSQZg1CK+5OJVivy9UwQgFMZdcyJ
         0KZ08ceKfhqgb802Q2do12RvuIlc3jbbZj7cEXYu/WsIy0obzmjDJf5WiYuG6LJwoJ9r
         EW1rXWSDRxXiqwIHcvLNwE8Bf/3vTclu/VLTiQO4kChnVRWSLoImleOaRc/SChqD4H83
         s+3z5Rrxl27kuBKpYQNqcWKZyRKPVHcPe2DsR6SewTtJAhLoU0RM1PXv8tajN1m3aS4A
         qYLA==
X-Gm-Message-State: AOJu0YwdvV7AvxEWnoFG7yXNao+GSKoa66r1FCosnrw56A4cUTnIU00A
	Kajj4RwOwvDIaTwPQ/3iTBd/Sw==
X-Google-Smtp-Source: AGHT+IHNgT0RSd5XpQjVPdqZAhwakMa7fQmzFVifYxXJ/RQ6Z6jRRjcHep7Irojk4543l/o35jEYOQ==
X-Received: by 2002:a17:906:25a:b0:a02:5bb:5658 with SMTP id 26-20020a170906025a00b00a0205bb5658mr1501587ejl.47.1700582022843;
        Tue, 21 Nov 2023 07:53:42 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8a96.dip0.t-ipconnect.de. [79.204.138.150])
        by smtp.googlemail.com with ESMTPSA id dv8-20020a170906b80800b009fdc15b5304sm2896853ejb.102.2023.11.21.07.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:53:42 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [net-next v3 3/5] net: ethernet: renesas: rcar_gen4_ptp: Prepare for shared register layout
Date: Tue, 21 Nov 2023 16:53:04 +0100
Message-ID: <20231121155306.515446-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231121155306.515446-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All known R-Car Gen4 SoC share the same register layout, rename the
R-Car S4 specific identifiers so they can be shared with the upcoming
R-Car V4H support.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
* Changes since v2
- No change.

* Changes since v1
- Fix spelling in commit message.
- Added review tag from Wolfram.
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c | 6 +++---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h | 4 ++--
 drivers/net/ethernet/renesas/rswitch.c       | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
index 443ca5a18703..59f6351e9ae9 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
@@ -14,7 +14,7 @@
 #include "rcar_gen4_ptp.h"
 #define ptp_to_priv(ptp)	container_of(ptp, struct rcar_gen4_ptp_private, info)
 
-static const struct rcar_gen4_ptp_reg_offset s4_offs = {
+static const struct rcar_gen4_ptp_reg_offset gen4_offs = {
 	.enable = PTPTMEC,
 	.disable = PTPTMDC,
 	.increment = PTPTIVC0,
@@ -133,10 +133,10 @@ static struct ptp_clock_info rcar_gen4_ptp_info = {
 static int rcar_gen4_ptp_set_offs(struct rcar_gen4_ptp_private *ptp_priv,
 				  enum rcar_gen4_ptp_reg_layout layout)
 {
-	if (layout != RCAR_GEN4_PTP_REG_LAYOUT_S4)
+	if (layout != RCAR_GEN4_PTP_REG_LAYOUT)
 		return -EINVAL;
 
-	ptp_priv->offs = &s4_offs;
+	ptp_priv->offs = &gen4_offs;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 9f148110df66..35664d1dc472 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -14,7 +14,7 @@
 #define RCAR_GEN4_GPTP_OFFSET_S4	0x00018000
 
 enum rcar_gen4_ptp_reg_layout {
-	RCAR_GEN4_PTP_REG_LAYOUT_S4
+	RCAR_GEN4_PTP_REG_LAYOUT
 };
 
 /* driver's definitions */
@@ -27,7 +27,7 @@ enum rcar_gen4_ptp_reg_layout {
 
 #define PTPRO				0
 
-enum rcar_gen4_ptp_reg_s4 {
+enum rcar_gen4_ptp_reg {
 	PTPTMEC		= PTPRO + 0x0010,
 	PTPTMDC		= PTPRO + 0x0014,
 	PTPTIVC0	= PTPRO + 0x0020,
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 43a7795d6591..e1e29a2caf22 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1828,7 +1828,7 @@ static int rswitch_init(struct rswitch_private *priv)
 
 	rswitch_fwd_init(priv);
 
-	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT_S4,
+	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
 				     RCAR_GEN4_PTP_CLOCK_S4);
 	if (err < 0)
 		goto err_ptp_register;
-- 
2.42.1



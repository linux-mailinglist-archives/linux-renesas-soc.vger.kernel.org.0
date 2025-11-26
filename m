Return-Path: <linux-renesas-soc+bounces-25213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C8C8ACAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 17:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 768094ED3BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66ED433CE91;
	Wed, 26 Nov 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OgNzWl2I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E51333BBC4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172761; cv=none; b=GIFyJdM5++NEbZFxaf8GQ6jmMJCktfSWuXLZliretzJJgnuCNdQIfZOsGZUHFByJ4a7yWCJYrbWaaIAqBw07kbO+QKa6IVHMJqupnUyJAI5qguzk8kf4cuz68m2Y0q8UyWY43PjrUf3LA6meBrdn9C754+Ydg7f7L/sWJIuAkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172761; c=relaxed/simple;
	bh=ydjOpRaxNg7YwCkCtWQyF8hCOLVtl98EpZSQZcqLxvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIOPHpUeKZABDYQYUUvjWXtGUthEisvLfG/A8vJ4anHJnAXopL1GbchSYbWE6rHg6IM65bh1oVYlG+YtRwdDxDOUwgvcDS9estj+EvTqueM5qAEyYBVuy0BvNkpxhXD1DqK2bNatldLFF4MsyASIAGEvUpRpxEC0XHkMffKHpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OgNzWl2I; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775ae77516so65309505e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 07:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172755; x=1764777555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5fvguYl1zizKX5NssUxSVoIdbxzR3UiqnQ1nTNgMuk=;
        b=OgNzWl2IIZ1ZVOK7VKWsj2mrkmqMgrLr6NfCUDhgjcbIC8eIgCw84dNRjbgNk3D/yN
         30KoONBjYg6nEdik6Yg9qVqnwxtkhUaDq9zGysleCTVqDaQh/tjYZfWhv5DCB5My4tEh
         1E76qEGk84U5Fh3rSiau38jcu4lE0daZ5RlktuSaPhPbPIfYYfwz6ZTsaAQb4otIJtAV
         V5dpqKSuOtZkyqVtV9Nfef/WHVADAmaK2iRftgDc3nbC6571onix35Nd10M8aQw5dk7x
         FjiOnxVG+F23gLh2qayQtXirw9K1Mpl8zv98nqA0ScceC5Zl5eOd0HzSHXD8ZhZGJMcA
         4fOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172755; x=1764777555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l5fvguYl1zizKX5NssUxSVoIdbxzR3UiqnQ1nTNgMuk=;
        b=QGx9WGW+T8l8pJU/EDsnlbyiUDb04PCwwLI1GVlFegYyQd5xk7U0nBKECPihAN+oCE
         y+uyWRHXOPJ7c41+Bpf6B7uJj3XelpaGZAS6LrVb4rOT7bzQpoKKIaBmaWMnaUl/MA9+
         qz1A79qUvOZ3pxusG+h8IyNqyR4g2dIemNQ60iW3wRMu3AIkioxgUN7uZVkdlQF1iXWY
         4WGM2Gire6Uqomsnl/L1dWJHf2C4nzAmonHY1n7PtkDz3LQ2oU19dObjmgdyX76Ptt9n
         csnHbs0MjlVOkEAz0gA13Un0yvlwIBUnp7EcoK5Qj0zNPsaj3Zg3v/gNvG79nP6Wx61d
         cXzg==
X-Forwarded-Encrypted: i=1; AJvYcCV4UPKMI5tralDMJbZrOn5cegGaHD8DD+RVE9qg66YIhh4xjk1ea5GLsA3BpGPFUcHs9jRA+tmGPqI/DYnW2gCOAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59+UxTwXLdfRuDH6t39OH74lmziTcMzDoxSRnnqknnwPy2n4S
	gQa9HsAsRcbKo9Fh+ECQL3LSOCVroSfTwwgzy+jROaOXdozD0T6O5kfw
X-Gm-Gg: ASbGncvnYWRSTy9+ZGtdQlfUX+Dbr2+4qqBri2GO6s8ci0FXQ3Qoy9f0OdZBdB6Qb7Z
	c6fLC17/WRzmxLOs8p9sV1udjs2vm7VWTh3/CJdVoGyV5Ez45LTAWysXTjO/dMSA3Xx/ED/ZQND
	kMNg7AAzdlsBN1vAtpLrSSmLag+Xin/zG8RnZrqfd62FBFP1lPvKFLvNoJpZsKvtZRLU1aT6Y+n
	A6HqW5AyvlvPN82eGercxbUVau83nszgubNLMyMuwruLyn6HhmC7josaabqcAJoBIEab9JHeJNv
	XSUnQNdfbwLM0rrqitilYwKgwsfO7tgDhuxoSkAtyKSsyelwNukzZrh5jktpUxMX7ehxq8iyaLk
	Z4V8HWzY0Mr6ZkN0RY9naryLwLBpEYvAedpifKGzcc3YfyZqsktImRYjrWxjRa7ZTUCEiKdPj3+
	NZbuomjCBYEVJ6vm+e4z2qghWKVku/qhJr1qD1f/RiFxbIoDmsKyFOubbubZnw8n3rdHaLv8U=
X-Google-Smtp-Source: AGHT+IGyt3DEYJ79rUQUGpCk+m0qe0BU3xv0UEECi0UxrG2a3LOAONqj/7nbU56S+XYd/VMVJgekrw==
X-Received: by 2002:a05:600c:46cd:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-477c1136b7fmr186322025e9.34.1764172754641;
        Wed, 26 Nov 2025 07:59:14 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cbd764dbesm38197188f8f.27.2025.11.26.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:59:14 -0800 (PST)
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
Subject: [PATCH v4 2/2] can: rcar_canfd: Add support for FD-Only mode
Date: Wed, 26 Nov 2025 15:59:07 +0000
Message-ID: <20251126155911.320563-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126155911.320563-1-biju.das.jz@bp.renesas.com>
References: <20251126155911.320563-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Dropped has_fd_only_mode variable from the struct rcar_canfd_hw_info
   as it is checked by the dt schema validation.
---
 drivers/net/can/rcar/rcar_canfd.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 7895e1fdea1c..4a653d8978ba 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -472,6 +472,7 @@ struct rcar_canfd_global {
 	unsigned long channels_mask;	/* Enabled channels mask */
 	bool extclk;			/* CANFD or Ext clock */
 	bool fdmode;			/* CAN FD or Classical CAN only mode */
+	bool fd_only_mode;		/* FD-Only mode for CAN-FD */
 	struct reset_control *rstc1;
 	struct reset_control *rstc2;
 	const struct rcar_canfd_hw_info *info;
@@ -829,12 +830,20 @@ static int rcar_canfd_reset_controller(struct rcar_canfd_global *gpriv)
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
 
@@ -2140,6 +2149,9 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	gpriv->fdmode = fdmode;
 	gpriv->info = info;
 
+	if (of_property_read_bool(dev->of_node, "renesas,fd-only"))
+		gpriv->fd_only_mode = true; /* FD-Only mode for CAN-FD */
+
 	gpriv->rstc1 = devm_reset_control_get_optional_exclusive(dev, "rstp_n");
 	if (IS_ERR(gpriv->rstc1))
 		return dev_err_probe(dev, PTR_ERR(gpriv->rstc1),
@@ -2239,7 +2251,7 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gpriv);
 	dev_info(dev, "global operational state (%s clk, %s mode)\n",
 		 gpriv->extclk ? "ext" : "canfd",
-		 gpriv->fdmode ? "fd" : "classical");
+		 gpriv->fdmode ? (gpriv->fd_only_mode ? "fd-only" : "fd") : "classical");
 	return 0;
 
 fail_channel:
-- 
2.43.0



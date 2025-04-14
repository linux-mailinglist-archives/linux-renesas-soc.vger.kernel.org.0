Return-Path: <linux-renesas-soc+bounces-15926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BE0A8867E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B415842CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79E9252285;
	Mon, 14 Apr 2025 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQbZy30O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472602741C8;
	Mon, 14 Apr 2025 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642691; cv=none; b=DlZvEd2rcUemDXN/CZkJU3UA4MII+NRo2it5obx5/x1TBI5qpLvnpKTeVjaXNG8cqYQf0zYe2Cht55wu+vKvuaXkBqTkULs+0gnrobCCGClgovoxb5Bfz37ScBvRdQBwUGf3tYP4yMJi3MtV8xpQVRQ6vcXwgF3GOOMNDEYXAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642691; c=relaxed/simple;
	bh=mAIgbYVtQrRWEeW3B1cYyI9dbCAILwOKyRdFUkNvG28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4b8EWYkYj+jrFkRHyb92fd8kPpRIXRF1n2AKvw3n46vh4qOuu3q9W2B9uPt8SIIY0xN+h0rOxWaX96KHScjqIWDA9yq+vD4/rtX+fxcTnkmt8RGGMJOll/mkbkR3+ns6l4U9D/JipefhPd5aKhBJ6039Jwix/yp011vhxiPNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQbZy30O; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3873504f8f.0;
        Mon, 14 Apr 2025 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642687; x=1745247487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM2NKx8obz4I24MPi7gN8busyEmsDDD7XKGT8uK5+V0=;
        b=mQbZy30OjKvvL/19nKNpWE3moLk40DUBzJW7YnbvUrxyHMz5fBMYL73+BhSIBU6zGe
         Rc9aEURlRqrr5tqs7F+er2UZZNsrfgll+1R2yzHZAMSLvH/qH0vm5WnDPHIsFBWrXkIb
         S/uVbeC5cQsqh92ZzM0fYf/5fpMfuoPsyQCy9NKrmpPPlchEapeAcW6dYGL0cuh0aNxw
         67arAvS3VzEWv8Kq0SiyuB7YxSYA3nKoQz3ciMeE261BzPCKEvzhKtCZOJCiaDF8Tk0W
         Tz2z4GLvMfxhsiLPUlFv212gVDr5EMkk+kGoSaxUg8IflRu4EwEV0n4wASlnLKtsK19+
         zpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642687; x=1745247487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM2NKx8obz4I24MPi7gN8busyEmsDDD7XKGT8uK5+V0=;
        b=u3chGUQAVb84GLov1oCt73mW25efsDmsCnFIJBYmGslrw7c5rKDoydbtNmq0VKB49y
         lHdON+QAlmpZGV6m87GzqDhPM1qx+32Z6fKyH/9y9AVytQLvQQmFBWuS5I8TJ87V1p/R
         CuF8mI1u/5tHFO1QLlEfWp9Ayno070ew0i+rZU2yeeIvPYgB3Bh1zVDGrR617/wBPFER
         ikVAZLQ6DQQLQbX7Tw6g4NF2jqx+2pPwCk8U42ISBPrkfUeDqfHGgcs1D1tXaCtIidj5
         /DVwL8QM13psnMwFqFvcAM6Pb3j4dg83WEmniqZfQtS4Rnsd7O0fE5jt97ntfjEhucc0
         9gpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAg6C6YWgtKL+RwBnBJ6C/f9EmT4g+0jZkmH5NAg7XFqYfOgsZzLRDd5nzqhNFllbwvOJSKX7/jtI/@vger.kernel.org, AJvYcCVQyDxVIhCgOnmArdhHkhnIS0ZyO7VsClYOXinsjG+aS8IjKKJGRzAsHlAqDCuGJrca12h0HTeHXM7sRZF9@vger.kernel.org, AJvYcCVk+LqRy7z9fSg1EhLX/JFZ3AciVf7jNgi+e2hZjE/1k9V3TvDXxcoiNg7VbC/F/aRqXyeSfzdb0iSpz3niWII6fig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpbMVvVqmyb6gDiW1dZz756DGeW7JmdnxhGxYz0UZiAZr/TC2o
	kayfIf97aTc8C71cek8zkGY5wTZ6FaYM3YhlonaAZ5q1rw/nOHG3
X-Gm-Gg: ASbGncuIEiQLnd88GCqX5M15FnvgbAsb1zSpPFQrLy0qzfbCWRYdOslupzNB8nmiCU6
	7yUub8xppJqUGJmYq0V3f8sVyk58qv1yYPP1OuYQ7JrwM/FyAQJFcsBcEjEe6VWeoZEmlrIfGJk
	EcEkoJXAd1yQQZ41yaXd5IsFtP5mVi06Py6UjDALFJ01rlOkdyPrpVOXX46FBBIQRSbid5cBksp
	lYKF4KxLj2dLLrG2LNWPQ+S6u4VNKQBiXpD3jlVGwBq+aPlm4dPJAfRYFBDnvUu226zw6Y6HNk5
	FMODLVwem2IDHFJiHYOu10ai2hMRG5Z6+xMxiXFMmKLEdzsO9MkQNJwg+rhu+oS7Q8OjCqC6FGM
	=
X-Google-Smtp-Source: AGHT+IFRZJWL166MU3lJcPNUXJ4htm76qJh+hKGtgYCkfK0g1Ix3ihH1Xoda33pQ2MGxMW6aQNp/2Q==
X-Received: by 2002:a05:6000:400a:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39ea52017ecmr9812334f8f.18.1744642687246;
        Mon, 14 Apr 2025 07:58:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bdf9sm11067041f8f.22.2025.04.14.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support for RZ/V2H(P)
Date: Mon, 14 Apr 2025 15:57:29 +0100
Message-ID: <20250414145729.343133-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USB2.0 PHY support for RZ/V2H(P) SoC.

On the RZ/V2H(P) SoC we need to configure the UTMI to a specific value
as compared to other SoCs (which doesn't need configuring it).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 10d1a89558be..867f43132b7a 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -28,8 +28,10 @@
 #define USB2_INT_ENABLE		0x000
 #define USB2_AHB_BUS_CTR	0x008
 #define USB2_USBCTR		0x00c
+#define USB2_REGEN_CG_CTRL	0x104	/* RZ/V2H(P) only */
 #define USB2_SPD_RSM_TIMSET	0x10c
 #define USB2_OC_TIMSET		0x110
+#define USB2_UTMI_CTRL		0x118	/* RZ/V2H(P) only */
 #define USB2_COMMCTRL		0x600
 #define USB2_OBINTSTA		0x604
 #define USB2_OBINTEN		0x608
@@ -50,12 +52,18 @@
 #define USB2_USBCTR_DIRPD	BIT(2)
 #define USB2_USBCTR_PLL_RST	BIT(1)
 
+/* REGEN_CG_CTRL*/
+#define USB2_REGEN_CG_CTRL_UPHY_WEN	BIT(0)
+
 /* SPD_RSM_TIMSET */
 #define USB2_SPD_RSM_TIMSET_INIT	0x014e029b
 
 /* OC_TIMSET */
 #define USB2_OC_TIMSET_INIT		0x000209ab
 
+/* UTMI_CTRL */
+#define USB2_UTMI_CTRL_INIT		0x8000018f
+
 /* COMMCTRL */
 #define USB2_COMMCTRL_OTG_PERI		BIT(31)	/* 1 = Peripheral mode */
 
@@ -127,12 +135,14 @@ struct rcar_gen3_chan {
 	bool is_otg_channel;
 	bool uses_otg_pins;
 	bool soc_no_adp_ctrl;
+	bool utmi_ctrl;
 };
 
 struct rcar_gen3_phy_drv_data {
 	const struct phy_ops *phy_usb2_ops;
 	bool no_adp_ctrl;
 	bool init_bus;
+	bool utmi_ctrl;
 };
 
 /*
@@ -472,6 +482,14 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 		rphy->otg_initialized = true;
 	}
 
+	if (channel->utmi_ctrl) {
+		val = readl(usb2_base + USB2_REGEN_CG_CTRL) | USB2_REGEN_CG_CTRL_UPHY_WEN;
+		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
+
+		writel(USB2_UTMI_CTRL_INIT, usb2_base + USB2_UTMI_CTRL);
+		writel(val & ~USB2_REGEN_CG_CTRL_UPHY_WEN, usb2_base + USB2_REGEN_CG_CTRL);
+	}
+
 	rphy->initialized = true;
 
 	return 0;
@@ -589,6 +607,12 @@ static const struct rcar_gen3_phy_drv_data rz_g3s_phy_usb2_data = {
 	.init_bus = true,
 };
 
+static const struct rcar_gen3_phy_drv_data rz_v2h_phy_usb2_data = {
+	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
+	.no_adp_ctrl = true,
+	.utmi_ctrl = true,
+};
+
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 	{
 		.compatible = "renesas,usb2-phy-r8a77470",
@@ -610,6 +634,10 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 		.compatible = "renesas,usb2-phy-r9a08g045",
 		.data = &rz_g3s_phy_usb2_data,
 	},
+	{
+		.compatible = "renesas,usb2-phy-r9a09g057",
+		.data = &rz_v2h_phy_usb2_data,
+	},
 	{
 		.compatible = "renesas,rzg2l-usb2-phy",
 		.data = &rz_g2l_phy_usb2_data,
@@ -763,6 +791,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (phy_data->no_adp_ctrl)
 		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
 
+	channel->utmi_ctrl = phy_data->utmi_ctrl;
+
 	mutex_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
-- 
2.49.0



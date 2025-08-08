Return-Path: <linux-renesas-soc+bounces-20169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F31B1F067
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 23:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66B997ACBD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 21:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A76A28A1D3;
	Fri,  8 Aug 2025 21:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqgIKLMr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1128982E;
	Fri,  8 Aug 2025 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754689943; cv=none; b=u23VVSY/G2yIyCgIKZZzdxKjnQZG4EWoGqq6XKHIzLzjWVYqGyNlBIlgMW3DnaYUrSjb0Zj9gVj5sfbUvftdtT+ncM2Mw0xVhZyV7DRWIye209K+epoZ7rQYz2Oz28QawkPWspk5CkofO4JVlLBoJ3DFEi1sGu3Wz1HZSbIyHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754689943; c=relaxed/simple;
	bh=REXGt5D3mJoURH0SpSfXpzczNu/MGdZm45OZr/3rCfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PK3gVT6+Dik55sbg7zFrCMuD8LBXEOswgDQVRDPrLg59Z9PRz6TCaJgTxUdqhUzUvNZksBOmHRPa9yQ4HHZ9rKnCayuMuGcmZeIgRQkVz4/khQd5uwkMel/nPRymHoaLrrMCC80gdDODi/7KWFcBn7w/cw6p0cjlNgfym6qV6Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqgIKLMr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b7910123a0so2272441f8f.1;
        Fri, 08 Aug 2025 14:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754689937; x=1755294737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17s9GNw67zEnQfKHaORcRfpjJfC82IfymgU9DuBPbGA=;
        b=FqgIKLMrev/hgYnAP59fFOYf51E2sOZdN/zkQ+cNK5AIvnqbQMFQTQSCuGYh6K7UDB
         YKAQP3lO2gsG0pbbk6jyIbSz1l5GT59E0+bSxCvDmi3gzUIl1znc8EbzLTfzY4daXe1p
         2q5FvezLNqTNPzAtb7KpCkU2N40Z4PAbOP0DZYRdbEVAem+QBTPJx6Jb8qlrFDbjm81M
         WePLh3btLldaTh8Wxv3mzA4VTXZ9Ll21S8KuEeMDEc3AGJKcEcdSVdwcLevAqY+QKNrX
         jFw9IWRXY4gBrc7pqcljDrBOfx0xUbaaGf8ARO4iwh8Jrm/0eWgtTfM2KBVLl3xRo+rm
         GhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754689937; x=1755294737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17s9GNw67zEnQfKHaORcRfpjJfC82IfymgU9DuBPbGA=;
        b=eplAe8JK0vLYTRNFHcHL30lLWrWIxyQ/N4vHdm3Wton63qox0oxhaHIoQePs77r3P9
         RMv0TyNuiFW8DxrKovAbvGjkpuNoq3Tjd5p8V4mXfHbQX5q7Kp5jd3eqxhU6fHWWLXnd
         EjvMXFQ8greC85LE1je01u+8Jg+79w0XT2mQrQUIikmHXO+fghUnH5KwCbrd9yh+mLve
         8iSG0jsq9bDwjlZUfpaSQ3Vrdkp1j1RMtcCV7OxxPTX9umcCsqIKmjxJYbFn5/kkt39T
         9rAqOtLP/7qcqEVAOH96kuTOSKHipFGoFd4PpR3V5A9kcldnzTySDKz5yS2Srfre6l2E
         g73g==
X-Forwarded-Encrypted: i=1; AJvYcCVYcoSMBH4BDnHrmqW9KYgMFM18ieWyu6o/PQDJjJ9KCHEWVIUo42QByQEr1pQ/xd3cBsr+1frYj8H2@vger.kernel.org, AJvYcCWDTovSTYWbuJd4sWzAWgSH7ZHU7Q7Kp7qxLANjV/7RYrds4rOWIvT4em8/Mu2ovyDWt2ERQCv46sw5qLft@vger.kernel.org, AJvYcCXatevYsd4O7U4odHyD39mLns619YKC5csfXJR/ZIU9nZ8Smu7aTibRvkAChR8FDjIpUZVrfr2MYh2k5FKD/TRv7eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyghsUE8j8EgwRpc8BW6mKoph+bbgzEv6YgulgzB77LyWyfHkLS
	0yGcHHn9QdMPeMWhfZr0lRNLNRTcn7i9jJkQdDRe7Y7NDOCjkub1hZtOxrUiIqc3
X-Gm-Gg: ASbGncvwbNCovu+35+V9LqW9feylQvuJrGUdZGQCqnxxdTCee1oow3uXww8+/4GoPf5
	dOumVyNZb/IzNhHP2laef9Ud67JsD+RyzqXgt/sCHIXqvVEwz9D4QeYIf8RdGXYjSgcF+6tE7mL
	LU8+trdFGTN99r+lNMaCCihisOucAIee0ciLWLttFAtICywi0kcGT6/TBv1RqwaNJ2RL7gmGWj9
	3eVtCSzw+lDRZoRq5/Oq7IQ5sFbab5vJgv0oGIB0QiD+BcZjoz/vBLcyiIMGVnced9MkK4jZg1d
	UnfN6vo7uKwVD+os17nJ5JpjvcULDfLeQ/tvowFmRQH1oRGuxZILO0nDUsfwR1PLGmce2QZ/gcA
	k5qsBjdxhr8ak9uscnOW6Bzs9sNHUnho95bvMRjVlEMgNqIjtwOBpxKhKQPHxyrjpF5tCRfsG8i
	P3efoCf6Q=
X-Google-Smtp-Source: AGHT+IE+GOceRSOAfa45BZqMkJ6Avuh4YRmhkqoYYcxW3cITtpq11lpt+MxCKB09CYAOA9oejvOCMQ==
X-Received: by 2002:adf:fc87:0:b0:3b7:9aff:db60 with SMTP id ffacd0b85a97d-3b900b4bcccmr2961520f8f.10.1754689937375;
        Fri, 08 Aug 2025 14:52:17 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm5326759f8f.51.2025.08.08.14.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 14:52:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/5] phy: renesas: rcar-gen3-usb2: store drvdata pointer in channel
Date: Fri,  8 Aug 2025 22:52:06 +0100
Message-ID: <20250808215209.3692744-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Store the SoC-specific driver data pointer (struct rcar_gen3_phy_drv_data)
directly in struct rcar_gen3_chan instead of copying individual flags into
separate channel members.

Obtain the drvdata with of_device_get_match_data() in probe and assign it
to channel->phy_data. Update all call sites to reference
`channel->phy_data->*` for SoC-specific behaviour (for example no_adp_ctrl
and utmi_ctrl). Remove the redundant soc_no_adp_ctrl and utmi_ctrl fields
from struct rcar_gen3_chan.

This simplifies the probe path, reduces duplication, and makes it easier
to extend the driver with additional platform-specific fields in the
future.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed drvdata to phy_data.
- Updated commit message to clarify the change.
- Dropped local phy_data variable in probe, using channel->phy_data
  directly.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 27 ++++++++++--------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 47beb94cd424..7ac56102aed0 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -122,6 +122,7 @@ struct rcar_gen3_phy {
 struct rcar_gen3_chan {
 	void __iomem *base;
 	struct device *dev;	/* platform_device's device */
+	const struct rcar_gen3_phy_drv_data *phy_data;
 	struct extcon_dev *extcon;
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
@@ -133,8 +134,6 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
-	bool soc_no_adp_ctrl;
-	bool utmi_ctrl;
 };
 
 struct rcar_gen3_phy_drv_data {
@@ -204,7 +203,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	u32 val;
 
 	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
-	if (ch->soc_no_adp_ctrl) {
+	if (ch->phy_data->no_adp_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
 
@@ -290,7 +289,7 @@ static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 	if (!ch->uses_otg_pins)
 		return (ch->dr_mode == USB_DR_MODE_HOST) ? false : true;
 
-	if (ch->soc_no_adp_ctrl)
+	if (ch->phy_data->no_adp_ctrl)
 		return !!(readl(ch->base + USB2_LINECTRL1) & USB2_LINECTRL1_USB2_IDMON);
 
 	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
@@ -421,7 +420,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	      USB2_LINECTRL1_DMRPD_EN | USB2_LINECTRL1_DM_RPD;
 	writel(val, usb2_base + USB2_LINECTRL1);
 
-	if (!ch->soc_no_adp_ctrl) {
+	if (!ch->phy_data->no_adp_ctrl) {
 		val = readl(usb2_base + USB2_VBCTRL);
 		val &= ~USB2_VBCTRL_OCCLREN;
 		writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
@@ -487,7 +486,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	if (rphy->int_enable_bits)
 		rcar_gen3_init_otg(channel);
 
-	if (channel->utmi_ctrl) {
+	if (channel->phy_data->utmi_ctrl) {
 		val = readl(usb2_base + USB2_REGEN_CG_CTRL) | USB2_REGEN_CG_CTRL_UPHY_WEN;
 		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
 
@@ -730,7 +729,6 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
-	const struct rcar_gen3_phy_drv_data *phy_data;
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
@@ -773,8 +771,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_enable(dev);
 
-	phy_data = of_device_get_match_data(dev);
-	if (!phy_data) {
+	channel->phy_data = of_device_get_match_data(dev);
+	if (!channel->phy_data) {
 		ret = -EINVAL;
 		goto error;
 	}
@@ -782,22 +780,19 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, channel);
 	channel->dev = dev;
 
-	if (phy_data->init_bus) {
+	if (channel->phy_data->init_bus) {
 		ret = rcar_gen3_phy_usb2_init_bus(channel);
 		if (ret)
 			goto error;
 	}
 
-	channel->soc_no_adp_ctrl = phy_data->no_adp_ctrl;
-	if (phy_data->no_adp_ctrl)
+	if (channel->phy_data->no_adp_ctrl)
 		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
 
-	channel->utmi_ctrl = phy_data->utmi_ctrl;
-
 	spin_lock_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
-							phy_data->phy_usb2_ops);
+							channel->phy_data->phy_usb2_ops);
 		if (IS_ERR(channel->rphys[i].phy)) {
 			dev_err(dev, "Failed to create USB2 PHY\n");
 			ret = PTR_ERR(channel->rphys[i].phy);
@@ -808,7 +803,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
-	if (channel->soc_no_adp_ctrl && channel->is_otg_channel)
+	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel)
 		channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
 	else
 		channel->vbus = devm_regulator_get_optional(dev, "vbus");
-- 
2.50.1



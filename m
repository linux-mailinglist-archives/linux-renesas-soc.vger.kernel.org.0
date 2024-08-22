Return-Path: <linux-renesas-soc+bounces-8051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57D95BA6E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48990287660
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C43821D1748;
	Thu, 22 Aug 2024 15:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UCi6OkzB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD0F1D1731
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340530; cv=none; b=odSddxrhBOEbXIYPn9/jbzVf1CQ92qNcu8DYUsUESJL5J2ba0dP0qB4VqBxHQ6/9JQ8ynd1zF3yLb+R9Ea5KuITvS6rI42j04Byv6ACWQv+htQ9m6JK4JRFRI35QImHZoIrrC/HSXd/f8Qd7iq2NHmgreM9aD3vO5W3aVc/mrAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340530; c=relaxed/simple;
	bh=PusSluqZ4VefZMGZNtGaHZ4rDX2ovrpP75F+MreF79w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LCYATbByv730HE0VOHN8zgPqZl8bsSLMs53LegwMPxmyNiPlAZqHHPTiTBQUJ0CTwMh6gecImr2RaVSHhWdIEwKyrlcyMHMCnvgswdlgaKu/VJ8YIP9xt3CynEBjWUQ/ZhfL6figrE3j4nRfb1elwWEjpH7fPojSIhiKuotEB9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UCi6OkzB; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-371941bbfb0so489233f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340528; x=1724945328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHeWW2RAWv56keT/WvGpAcv9ZdqYWF6HJpLE3tjHw58=;
        b=UCi6OkzBgr/KdjK42SoQ6Jp+8eXLRyU+2K91t5be1po6fpawA8PRWcYBIXTwVcIAUP
         kEvOPP1VUirgK+zwLEAXdYUPj/IGw3mWTBCdoRp6+ggsb97EXn1u2cef/BkIGnIJTGeI
         F5FSL0rzZq2ZavUWx36xWfHImCSSO3hHdNWcRRMS3XrnpyoiAPJtk98pFRH47hNvf/P0
         US+C7vheu0VecSdb7m/ZF0VyEMmCWqp9W8oe5JMxI5WnRxziamM9sIKk9BgRAlQb1oGY
         7ZLAWsUjqAZbZmSqpO5OYHgUrbS5CpEkitAg5wEDJf50tXeay46L3dTR/Q/d1FWF1J5z
         YINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340528; x=1724945328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHeWW2RAWv56keT/WvGpAcv9ZdqYWF6HJpLE3tjHw58=;
        b=qzU/qQqEWwuHacACaZkQrFxb5JpmnK0SdoN3nTpJOI2MBYvH3rkVkem2ZmP7+2l4xA
         +fK3OdxehgUys9btOAu6iifd4NwcXk41xX/3aBlCMoY1BuFg4iBjLbmBDYxW6cdM0FSA
         /tSXA3+BuM4n4Q8L0TIFaX1tbVPTKui3wLAogf1e4oVc1uI2yNZlTiLJ7KNeNSbmV0Mf
         fcF35oMJsPiMeDYOAWejXcMlN2NFQtoHINhDVfLSiReaGDfoVouAOd2pvjvdWC+jE72Y
         EBC4L3W1zLwRoCuQoR3el0dlTd00+xdNPCNV1U0FBAFahaAOKXnCtiYPuIj2IQmZ8ncS
         Q/0g==
X-Forwarded-Encrypted: i=1; AJvYcCV6n9iR/t5K8OdhIf0tptVmC1BKpXEi1DUVNrz/LF3RN1zt/Tlyel5FCKWtR6ZVoCLInQF0h+bR52M5OwYhXbqwWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTN2mqqBtUFZwCNAyTXsrQg+jH7UFCrENpTFFpXu0zaL5bBfb+
	1b0JThuIQ9bBQ4WW8pCdvRlDXxb0faPQMoP1QUasxEdVioyuISI0FuIQT6ptH18=
X-Google-Smtp-Source: AGHT+IEpM56P+rOfWzF8q9z39ghmNLCQnzP/RLGHl+du2H4z+ac9zrTbNQqtdYtd7xDVKiZkepmRnQ==
X-Received: by 2002:a05:6000:110b:b0:371:8e50:2d08 with SMTP id ffacd0b85a97d-372fd720340mr3982596f8f.38.1724340527530;
        Thu, 22 Aug 2024 08:28:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 15/16] arm64: dts: renesas: rzg3s-smarc: Enable USB support
Date: Thu, 22 Aug 2024 18:28:00 +0300
Message-Id: <20240822152801.602318-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable USB support (host, device, USB PHYs and sysc).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index deb2ad37bb2e..fd9355936803 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -66,6 +66,29 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &pinctrl {
 	key-1-gpio-hog {
 		gpio-hog;
@@ -124,6 +147,27 @@ cd {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
+
+	usb0_pins: usb0 {
+		peri {
+			pinmux = <RZG2L_PORT_PINMUX(5, 0, 1)>, /* VBUS */
+				 <RZG2L_PORT_PINMUX(5, 2, 1)>; /* OVC */
+		};
+
+		otg {
+			pinmux = <RZG2L_PORT_PINMUX(5, 3, 1)>; /* OTG_ID */
+			bias-pull-up;
+		};
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG2L_PORT_PINMUX(5, 4, 5)>, /* OVC */
+			 <RZG2L_PORT_PINMUX(6, 0, 1)>; /* VBUS */
+	};
+};
+
+&phyrst {
+	status = "okay";
 };
 
 &scif0 {
@@ -144,3 +188,20 @@ &sdhi1 {
 	max-frequency = <125000000>;
 	status = "okay";
 };
+
+&sysc {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.39.2



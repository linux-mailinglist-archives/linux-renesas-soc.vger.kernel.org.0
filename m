Return-Path: <linux-renesas-soc+bounces-10207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6CD9B60DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 12:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2158328278F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 11:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A821E8823;
	Wed, 30 Oct 2024 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qYc+697a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4DF1E7648
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286112; cv=none; b=ZDZO/L7vg/9If3qwJi2fKD4KZg87bZfLgO1wMVwdUz6DJNV7cnxoCWpKzN8Nnjn+MCZM1/qwx2WeQ6uKu8dmMqnO58LFTEXQC6Cnr6gglkOE+vmheXpy3e6KJXFTmJ47Gv11Wqnhua3DjBxMuGqoC2xJVOsfMLpjCh9ts+l6o3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286112; c=relaxed/simple;
	bh=mfKKujpI4Yk4mdg6+t15nnjqJVfhNqwOoY0zzp8KwTk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uMyDKbyWMUf8negFq3QSGIytg+oPd1ZSI4/lTr2F72BVi85aHh1Iow+r1einypPW3gEWGm45CWTV2T7Mz6Lx0qQ4h/uGbYnjUmrGnPDz5SvnLgz0vvzQel3alBWoTwGR32sLoelO0m6d5JW/i1Wa64RGN3cpbETuoZ/ZnFbu/ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qYc+697a; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43155afca99so4570495e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Oct 2024 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286107; x=1730890907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJGzqHo9qrTCAAwlf27yjT302x4NzmzPRcOQ+gtBk24=;
        b=qYc+697aqOs1n3Ry1sQjcjtuzVrBO0fwko+3ya1ZTf32gqlMMbdIYGpPx8q4MNBQTi
         T4sQ4K/u9LcOZjHmRK1QRfXUwLOlH891Mym6eJZzCHF0I0Zh7mehb6ij68qy7Tet14Ba
         XbiH4a77az5USUUixHcVYQfvrdX3DCvq3IvJh7e+xjo90F/31Ohu4hlZrPbLSQVZnPvk
         bBWN1QYjPNY395lu8z8Gbhh14mINhK9BVMwYFlCU9ckwpb/tJh1DIFlIT6PLx+tvzDL4
         A7bfzggXlr071yHn5/tezLVM8TS3j8wsEDOjx9blle2DEmlj+cg6sDL7lMzvOwqlAkW8
         M+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286107; x=1730890907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJGzqHo9qrTCAAwlf27yjT302x4NzmzPRcOQ+gtBk24=;
        b=o4tD7nlOWVJzbHbuuugaRHwyYMNEwUvFvGmk1bh/+0IDEynm3P15bL+gfA8fdw7oD5
         iBvlEzGYfu232n1Azjv36sVtn+IRUHGaBEz7TXoelfE39nAjLZx+5cQBpEOmpVK8IViG
         Od/2A4XRuAk4WqVUqkklH6hKS+qzzU6TyTm1ipwD9/w1qCLZHN1gfYen/YT6WTmTOLyR
         wc4hUKGWFqEI9gH7NfxHdGGqnIrYtZ2uulHEn8yxUwfxBjWtRVjvl7ILP1nvrrOujOem
         Eb1Wmq21uLV84Cy3w/8fib32bCEev5uvcS/G/ChjSljWs/Ud/ftBZQhPf+OVDew3OkHk
         ijfQ==
X-Gm-Message-State: AOJu0Yw6xXPOI4pCIvd/PfbbCQyvbvc3pDLkHZfMkU7Cg9viGMpJxvj6
	EWFiIaZOM0FKXvtzsIX6aEabC7tLZQCkSecNsgI/vnOy0x+uufIT+8o1+gOQ+W4=
X-Google-Smtp-Source: AGHT+IE5VulypisySsncZjnqUpvTj2AV1Yc80jON0brb1Iv05v/0FIWD5VcuOaypPQ/AlZFz+rbyng==
X-Received: by 2002:a05:600c:5253:b0:431:55f3:d34e with SMTP id 5b1f17b1804b1-431b5739d3amr42501345e9.15.1730286107092;
        Wed, 30 Oct 2024 04:01:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 06/10] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Wed, 30 Oct 2024 13:01:16 +0200
Message-Id: <20241030110120.332802-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- dropped the status = "disabled"; for the vbattb-xtal node

Changes in v4:
- used clock-controller for the vbattb node name
- move the node near scif0 for ordering
- set the vbattb_xtal status as disabled to avoid having it exported
  in linux with frequency = 0 in boards that don't use it
- collected tags

Changes in v3:
- dropped the child nodes of vbattb; along with this dropped ranges,
  interrupt-names, #address-cells, #size-cells
- added vbattb_xtal as input clock for vbattb

Changes in v2:
- update compatibles
- updated clocks and clock-names for clock-controller node
- removed the power domain from the clock-controller as this is
  controlled by parent node in v2

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 067a26a66c24..a1d5084b074a 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,18 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		vbattb: clock-controller@1005c000 {
+			compatible = "renesas,r9a08g045-vbattb";
+			reg = <0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+			clock-names = "bclk", "rtx";
+			#clock-cells = <1>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@10090000 {
 			compatible = "renesas,riic-r9a08g045", "renesas,riic-r9a09g057";
 			reg = <0 0x10090000 0 0x400>;
@@ -425,4 +437,11 @@ timer {
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
 };
-- 
2.39.2



Return-Path: <linux-renesas-soc+bounces-1665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03416836CC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 18:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26EA71C25078
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CE53EA84;
	Mon, 22 Jan 2024 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="f26/bgvK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D254D5AF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705939566; cv=none; b=a437lbX6quzFRIJJ1h2wCci+a8CCekVKeSMGQsHO1N2dPUCzSrChMqHIyd33jDaCx/3+1loiArwa3ZwzsKoKWc83/gpUO7BAk1W400WFEB0fc+vhORoeNKZW3/eYomjfAS6aIrcxBlitKwIiQIBPCVNgqYZxfSmXE0FsFvYsRjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705939566; c=relaxed/simple;
	bh=8+Jr9Hsh9KgnYxsoSQDSxqXxI1FhclIeUqpZMIYnqKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVjKAHuAtFpASZF+mcnVawvltMRgWsoJ2NIAGIHYbrC5p/yv6R0lkFgxwb1iDSHTwS+LA5Kv/DNtQVKkK6nfb8lWllZ2bFwNDDUeB2rYOdijKv8bAdrTzB/PTFD7iQ4FkPxfQzGeCMaS53ztPxNij2BKlF73Y0yp8z4GiFBcM7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=f26/bgvK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e9ef9853bso18080235e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 08:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1705939560; x=1706544360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlarwS5ZWGd/b0VwyKRXYjLC1ZJXtKCaEoHcpJgSB1I=;
        b=f26/bgvK1C+9QhOISv03gt4KVa9+/qD3fMcS554BpE8qY1N5Vn8m1K/ieGKEKgtk1r
         F0nZt2fskhEk+4tBltdn4yrSS1SKmOLgWvgFuXe3ONyDuRjfOJTtRr5WTkv8aLB2AnD9
         M+TqLaqTjNMbsLUwo9lPXg2/S1UECjLH3TlpwI6Wok8GA7Xv1AO3r8CgXSi82sQcB22Z
         1EdwbD9vpX+ZBN1s0ixHmJRmDybz620fvbrTFL6Owx7NTpynn/8sT/SPyBpvKQQ6owNQ
         s5ncJQ7Xlf/TrXxqqmzzQT0AP7oM8OtnlTRK4hyHE5XqlDzrshDAZ4+xWT+uCJgoMB8W
         sulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705939560; x=1706544360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlarwS5ZWGd/b0VwyKRXYjLC1ZJXtKCaEoHcpJgSB1I=;
        b=i248+BF4iq64baQcTKEuDFimkoVErP9vbBO8c/KnzmGYSH0TfBxU2spErih3tcciWu
         o4z9A4ryYJCSt6FeAFhON15i3/c4yypVV6gcdnhV5AR52EaLsV8yo6nVGK63fbZ7DLUo
         4liFq5bhbrjk0S77dRWPYcReB0tk8s+v1ydx5NZsEZJJpPVQ/uX66lPQ2PoRIeFo0rXx
         sc7xX6SYT1j5lJUQIJ/wZmfW5y5sw7uPShslyCvGxJENyNsylLPEXwanRVHEldSh34eX
         1c8mrfsgUlBxcaeT3ihd5ajhjnjgg4P4r8YKqOhz1YeyK+xvYSTUio9E3TzeKRg7gdTU
         WTJg==
X-Gm-Message-State: AOJu0YwihwtC2gxxo6HZG3fiCMc5jaM6ZzW/PXrdwBy78n9txb3N26sT
	6JdAGUic9ksTI4BtKYJ9lzhsRViaKMd6Ad5HisicQlXdwnPQVL9l6vYE2hfgoYI=
X-Google-Smtp-Source: AGHT+IFnJN+3OxQxnArgp3IoR1GNOboQMVz5rwH9l+fuJBi30dSZq7sXPsdB9PKZnV/3C0/Mnh0GQg==
X-Received: by 2002:a05:600c:63d1:b0:40d:61bc:cf55 with SMTP id dx17-20020a05600c63d100b0040d61bccf55mr2263823wmb.89.1705939560001;
        Mon, 22 Jan 2024 08:06:00 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id q6-20020a5d6586000000b0033921f48044sm8808860wru.55.2024.01.22.08.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:05:59 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: white-hawk: Add Ethernet TSN overlay
Date: Mon, 22 Jan 2024 17:04:41 +0100
Message-ID: <20240122160441.759620-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122160441.759620-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240122160441.759620-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the white-hawk development board the Ethernet TSN IP can be connected
to one of two different external PHYs. One PHY is located on the
breakout board, and the other on the Ethernet sub-board. Which PHY is
connected depends on what resistors are mounted on the board.

The default white-hawk configuration connect the TSN with the PHY on the
breakout board. Unfortunately the standard breakout board do not
populate the external PHY.

Add an overlay that can be applied to enable Ethernet TSN support for
those boards that do populate the breakout board, or mount the
appropriate resistors to connect TSN with the Ethernet sub-board.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../dts/renesas/r8a779g0-white-hawk-tsn.dtso  | 53 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-tsn.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8ea68d582710..c26047c9f84a 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -84,7 +84,9 @@ dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f4-s4sk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtbo
 r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb r8a779g0-white-hawk-ard-audio-da7212.dtbo
+r8a779g0-white-hawk-tsn-dtbs := r8a779g0-white-hawk.dtb r8a779g0-white-hawk-tsn.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-tsn.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 r8a779m1-salvator-xs-panel-aa104xd12-dtbs := r8a779m1-salvator-xs.dtb salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-tsn.dtso b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-tsn.dtso
new file mode 100644
index 000000000000..d9b6c11c425c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-tsn.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the White Hawk board with connected TSN PHY.
+ *
+ * Copyright (C) 2023 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&pfc {
+	tsn0_pins: tsn0 {
+		mux {
+			groups = "tsn0_link", "tsn0_mdio", "tsn0_rgmii",
+				 "tsn0_txcrefclk";
+			function = "tsn0";
+		};
+
+		pins_mdio {
+			groups = "tsn0_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii {
+			groups = "tsn0_rgmii";
+			drive-strength = <21>;
+		};
+
+	};
+};
+
+&tsn0 {
+	pinctrl-0 = <&tsn0_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii";
+	phy-handle = <&phy3>;
+	tx-internal-delay-ps = <2000>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	phy3: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c45";
+		reg = <0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.43.0



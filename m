Return-Path: <linux-renesas-soc+bounces-18960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44FCAEF67A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 13:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D033A4A40A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 11:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBEA272E57;
	Tue,  1 Jul 2025 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EGt8pr5/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I0cukIrH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1B326F445;
	Tue,  1 Jul 2025 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369201; cv=none; b=eZz4+M1kqI3im4ZsWHnnK16gXxxmf/PpJ1BNsc0x3lCM64SSffP497L1orEi0wsrnk95Eq4CZEbGTClKjua+ZlSEMNz8fNbd3SNLLue4N61BHAgePYZ0+EAZWosxfylF11WSnC/ln2HiRcfSsAvma+0a8TS6C57WTYcy+fP+hiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369201; c=relaxed/simple;
	bh=NOqy+wdMM4plICWibttbNlg46yY4gzH1hRzoRRdYMQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbbD4cY6FBmOKkY962RtvTqnp6o0DFVivpbBsSmMbKr3HGjbOT88g0YdNolrKaQqOOPCT9Qv5J+fzFh2XM8p9ANmSeA3brggilQMbWjUSTd+dCH4yMl/dDf2sZpIeAQi3TZ38ssBd8TKsIw0OLpBq8/+Bvbkr2tTSsMCZsrPxLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EGt8pr5/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I0cukIrH; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 97B1AEC0177;
	Tue,  1 Jul 2025 07:26:37 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 01 Jul 2025 07:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751369197;
	 x=1751455597; bh=YrUwl8fNTNlulE/joBWNz2LHKrr5eGiXGw1wbvCo74I=; b=
	EGt8pr5/5rnHEjv8wIIsbBNCMImiIClqUBqe+qcaxWJm6CuEDO4PhrWTv6pyFciz
	BwDvWm2McjhC7Qr70cEZrqTXdrMGNuEZyjlIE7yYGB9yBOUQ133nRfq6ovrzYMY+
	njayW+gHO56+YP6vW/RAHBMyY0DnTcJ4ROYqchIGNhGS0JJ3XwxZxUds5NzODfS0
	UDFDGXD4dZUwos1bJ4Wsli46qnmP5tfWnJIiloPO2TQ/K9FHz/gLXMAWrH2l1YIZ
	gTunWt7gBgourkJGgbKjxveILy8HuO5Vw7h49OufapZJ9mb94TJ7/FrFxCfhMCGU
	F31UGU+NrrvfPnmmX2caQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751369197; x=
	1751455597; bh=YrUwl8fNTNlulE/joBWNz2LHKrr5eGiXGw1wbvCo74I=; b=I
	0cukIrHOGHqpfrAXZ3sgPLREngg0HveKoiwcoGnlBEvHTbbP/0it/55bw0Cm0VmE
	L18TiWPhHyF65wxzVY5opnqm/9BCinXZJVCQE9XXUQ8nvl0HiHk1KxVZuffaRi17
	AmGv9NO3BI5OMepM0TGyBJBLXdSbDInvxufx3iBdv5MBD3DK+b1ILP/QLoL0g5Kq
	DSjzVfD/TGSEkio/Fu1ecQDABIBgXVpAgail3gx8ybL3n9NfwuPVNUe3432PXlFr
	uJUYhKH3WBr7tpc75GbsNjyscQ//2u4If5zuu/YtB1nSCpoNpF7yF710Zp/ykOZn
	tz7KSpHWaLucdk2o/m9OQ==
X-ME-Sender: <xms:7cVjaEKRsvNTDpJNxvYU4dMB1BLX15Ju9jl-bUcFa2sn-TT7bPbB0Q>
    <xme:7cVjaEJBV54NV9LpNj8cjDpcK4sITTF1179FY-D-cSrmlOupSJqu6zUeyZ33Ar1hp
    F8L2CEjlM6E6SiXu7A>
X-ME-Received: <xmr:7cVjaEttACyCXfl3Y8yf2M7A56xi4svcatdaYwvawDAk2NBRGwmbi1lnCRt36NCqEz2JuhIF04O0PF0oVIBtKI6piw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgs
    vgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehmrghrvghkrdhvrghsuhhtodhrvghnvghsrghsse
    hmrghilhgsohigrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshho
    tgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:7cVjaBZXZy7j1jERdXYB0nL9SYc316nxTyYV1sQrrCdLby0-_rqCXg>
    <xmx:7cVjaLacyTIw-SwwW3lBn45CKCuqOy44CqkEX5-r_HuaS6rpkL7TuA>
    <xmx:7cVjaNDZUY_RsewRBquFSgi7bwtD1-Bs5Fh6l8bZoTAcdV-bQYWz1g>
    <xmx:7cVjaBYv6C10h1xeYMubiUr7_QUl_x-BHA1uY7m_wbjZb9ugED4onA>
    <xmx:7cVjaF_OvQWAFH0BKTYPzsoYaJ-7JLKX5wYA85AuvUhR7ltzhx7Jxsn1>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jul 2025 07:26:36 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/5] arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
Date: Tue,  1 Jul 2025 13:26:10 +0200
Message-ID: <20250701112612.3957799-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an overlay to connect an IMX219 camera sensor to the J2 connector.
The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
pipeline behind the CSI41 Rx to be enabled to process images from the
sensor.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Drop 'status = "okay"' property for the fixed regulators.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 118 ++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 73218f7ec9af..12803c4fbc80 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -97,9 +97,12 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
+r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
new file mode 100644
index 000000000000..ce60689deae5
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for an IMX219 camera sensor in connector J2 on R-Car V4H
+ * ES3.0 Sparrow Hawk board.
+ *
+ * Copyright 2025 Renesas Electronics Corp.
+ * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&{/} {
+	clk_cam_j2: clk_cam_j2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		status = "okay";
+	};
+
+	/* Page 29 / CSI_IF_CN / J2 */
+	reg_cam_j2: reg_cam_j2 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j2";
+		enable-active-high;
+		gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_cam_j2_dummy: reg_cam_j2_dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_cam_j2_dummy";
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx219_j2: imx219@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		status = "okay";
+
+		clocks = <&clk_cam_j2>;
+
+		VANA-supply = <&reg_cam_j2>;
+		VDIG-supply = <&reg_cam_j2_dummy>;
+		VDDL-supply = <&reg_cam_j2_dummy>;
+
+		orientation = <2>;
+		rotation = <0>;
+
+		port {
+			imx219_j2_out: endpoint {
+				clock-noncontinuous;
+				link-frequencies = /bits/ 64 <456000000>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csi41_in>;
+			};
+		};
+	};
+};
+
+/* Page 29 / CSI_IF_CN */
+&csi41 {
+	status = "okay";
+
+	ports {
+		port {
+			csi41_in: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx219_j2_out>;
+			};
+		};
+	};
+};
+
+&isp1 {
+	status = "okay";
+};
+
+&vin08 {
+	status = "okay";
+};
+
+&vin09 {
+	status = "okay";
+};
+
+&vin10 {
+	status = "okay";
+};
+
+&vin11 {
+	status = "okay";
+};
+
+&vin12 {
+	status = "okay";
+};
+
+&vin13 {
+	status = "okay";
+};
+
+&vin14 {
+	status = "okay";
+};
+
+&vin15 {
+	status = "okay";
+};
-- 
2.50.0



Return-Path: <linux-renesas-soc+bounces-7488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F593B3D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 17:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDC701C238C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 15:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0B315CD49;
	Wed, 24 Jul 2024 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NchNTyTs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2815B54A;
	Wed, 24 Jul 2024 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721835311; cv=none; b=qVgunoQqHABJZWnNrpjIQ7undceNmP6MLm01GUSiu5Uv6V81Q7nZQiz80L2iHVdbw4U9KjeUdN1hnYo8b1pKzZZCNMWbs7xuILy1fdhK8vcL8dToyPzDhRIYQ8WhG+ec5BE+lppiFeyZIQk01a39ybqTSNlw91gPlV5a/gnZWL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721835311; c=relaxed/simple;
	bh=HMbBAlsBlLfNp6s+3mb6Iz4p46nLS3zAyrfDbS0MHRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cU1scl9CYqghvVOsjKYYyFnZDT6L4gr6t5JHSnEUwp/MeHahu48XIPLCKpDSPfmipTCc4TnR87mwQOtoXZpagavVrIcxXL2XlPaHGUareL8Jki1t3NbExveUopL3hRNpTRTGM/HKi8OkmycdQXVw4DjDqgZFiJRhylGyuflncaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NchNTyTs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so61176515e9.2;
        Wed, 24 Jul 2024 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835308; x=1722440108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNBCgv+DeR1QoeMqjG6LyKtVIjT7Jz+7LjZOlpfA5ZQ=;
        b=NchNTyTsoaxQb2hkBi2WriH4dTgs9iaRWgcYdwl3qO0YibWkqNbhkNo+xDC3j5EdnJ
         JNg2ypbiQxZxCmXxlPMVNOt0f/CXbUkiwknE3y2MXmZ6u9OtgbwZmIM/7EXK94ghB2RB
         fsR5ODoa4WmSgISazGVSjpLLtIlpvAtR9GyMWswECZ0bF0FnGLmXmNQafOCEPumQY85h
         UMOwwJglXSXeaM7iUjfHzwoXm89XpU0eVnRdPUyiqWSoCxkvqHv0xMr9OYhvlnbqosAc
         gDcaUcUhZdgpEc90O+V7QTmprBcAnQdMRb//3l4Yr8jjYnIZw+8jZKgkQO6HymMOZ3x1
         5eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835308; x=1722440108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNBCgv+DeR1QoeMqjG6LyKtVIjT7Jz+7LjZOlpfA5ZQ=;
        b=G4ap+2vmlqNZRL23MA8SJ7WfmfIoIjWRR2sUc/JRgNITuBvO+gq4YWBZ85/8jTdcK6
         9DM3vbr+USdsM/hhu35nFn/Us0XMKWc2WgejmkUJ78pE4K+7DbkCwc/tZjTNGs05mAVh
         j1g/6TDN5FWpY1yuLLUawlk4GjdH9qykjRyBJJVLvWm9Vk+Gj235VTUBxL9m9TfvSxrB
         TDgwrvY1ac05DHbq/3cDVLqBH2SY+KyW5txcpAKJ6/2xqdkHssb4LZDgI8+prlE1H493
         tE1YMpVdHEODydJVKuLVc2C7NwCr4A/v9rsEv9XCiGXRA5cgnjA36/ntvcuBwnqbXKeE
         iIuA==
X-Forwarded-Encrypted: i=1; AJvYcCVPNbk8VQoVK6VKpUZTchNnGRFhBCQp0hZmQBoZdZlSNxvhcIjGANjd9utta11HDTErak5KdJsJWI2RQ5TLvT5P75mbFz+rRj4qbA7FEHrQ6aMXTQ5KJIr2sQp7U8YYxXVricMEg3gflQ==
X-Gm-Message-State: AOJu0YyW4WHuRvTjnwi4uQhHlYGpEXFhmPs8QMdpYMVz2RiQc6Nmgk6D
	4c4Hyx5Hq1X+mGTbWTIhd1jpdAYVswC1ubGak8PBL21w+/KkNm+x
X-Google-Smtp-Source: AGHT+IE5eQ/VXdwcq5RN4hLwEJw6f87lj9E/TTK5qThwMcWLwxdURfrj3lCx8y0e3LD7OswrIIJuHQ==
X-Received: by 2002:a05:600c:3ac5:b0:426:673a:2904 with SMTP id 5b1f17b1804b1-427f7adf206mr25866645e9.36.1721835308013;
        Wed, 24 Jul 2024 08:35:08 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f9397337sm34609565e9.23.2024.07.24.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 08:35:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: Add initial DTS for RZ/V2H GP-EVK board
Date: Wed, 24 Jul 2024 16:33:39 +0100
Message-Id: <20240724153339.626460-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724153339.626460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240724153339.626460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add initial DTS for RZ/V2H GP-EVK board, adding the below support:
- Memory
- Clock inputs
- PINCTRL
- SCIF

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index fbd214a1a638..b2249a2710aa 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -137,5 +137,7 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-gp-evk.dtb
+
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
new file mode 100644
index 000000000000..593c48181248
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2H GP-EVK board
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a09g057.dtsi"
+
+/ {
+	model = "Renesas GP-EVK Board based on r9a09g057h44";
+	compatible = "renesas,gp-evk", "renesas,r9a09g057h44", "renesas,r9a09g057";
+
+	aliases {
+		serial0 = &scif;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x1 0xF8000000>;
+	};
+
+	memory@240000000 {
+		device_type = "memory";
+		reg = <0x2 0x40000000 0x2 0x00000000>;
+	};
+};
+
+&audio_extal_clk {
+	clock-frequency = <22579200>;
+};
+
+&pinctrl {
+	scif_pins: scif {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		renesas,output-impedance = <1>;
+	};
+};
+
+&qextal_clk {
+	clock-frequency = <24000000>;
+};
+
+&rtxin_clk {
+	clock-frequency = <32768>;
+};
+
+&scif {
+	pinctrl-0 = <&scif_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.34.1



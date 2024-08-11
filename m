Return-Path: <linux-renesas-soc+bounces-7794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C569C94E307
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BD091F21428
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E30615F410;
	Sun, 11 Aug 2024 20:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYA23fvB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACD915C127;
	Sun, 11 Aug 2024 20:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409417; cv=none; b=mrKXTrnf4fg84QNrB0OInkwNCjW786Xh7V1Wnv2cS2IzkgDagXBKINuojX0gU3LT1qIF07UmPCibDgtymOAt55mIdgcdDU7lUaAxBfS/IYQOZ4ebZly6YRIpsGU7zafM4th2kI1WEls6Z24NcgtTpYPoIcbEgznpxDSSeCtoI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409417; c=relaxed/simple;
	bh=wDhQQBlQhWKr1I9SvLwBGX6jSJGZLP64Cd7Lbzx8mOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VtxZb2I84H9ofwlCBqq27xsD6x0vMNOmydoW10LBT4ud0vQh5VM88PS5sqU43Ry4dOCKQXHoAIL10k5fYyV4HT2+2H4Qh0LC6pgArTBiiwbOimo8jjj4GR4Zk3AcxierOXWXOh0N9bO3HAq7wPr9nJZ1SykmItm+uy/vE9/mpzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYA23fvB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4280c55e488so21195725e9.0;
        Sun, 11 Aug 2024 13:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409414; x=1724014214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T54znG/I4+MjB2klDhiQ4C26cVmU4PYoO2XD9TYE+Gc=;
        b=mYA23fvB1WwaTx0yVWyV22SYSjJvx873alJEaELfCQsUhpAWrG2hvX5oRtUHXPtmVF
         wYM77iDwRLKOlsD3lyMJovwpaKbsTGIjRFnZgCqgDVpVFq3vZ4AjXV1x+BRSDNnG44w8
         wvGiZlZB2tI8+4Z33qBDERjAcPj/cwYjkKM7CCX6SG08tOuarzoaBmfQ1eKHgDrbFHYs
         xCx6x0v4lI+B4C7yM+wocoPWog+1sSES2nhkhO60IXrB3yewEONpFM5CCQMt+yF2n94q
         xmCWk37erL91Ea3et9sQmraapK3zErQENT2V50sY2A9ORozow9Ni97bfSkdRpyIJGGud
         UVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409414; x=1724014214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T54znG/I4+MjB2klDhiQ4C26cVmU4PYoO2XD9TYE+Gc=;
        b=MwBqTgaCn5+zT/PV/9y97323REsTujNEO6CjWp/ajtZ5Hbue53Jt15EK63EgWDF2UZ
         uuiJ76Hf+Im9cIw1gb/+CPAds+NOkbrw44RNEcl19vpEw6fVOwPHkNhnx4CQ9IueJwCd
         cAzO4McihuPQoEaXz+ICegZ6sxIVs1KCEdAHxbkjHHYCYXwS0vVZMnSfJmNN1/Vi6o9C
         SWhdiqlUkY9yS5OhTCBDjXxyJZMJelOJSljPZboVUVgRcQ7Yy1VVy39joOKCyz+CIDtA
         D4oGbfNE/nKeG3TeuXmqyViqWQ/2gncvKC8txNc0Ll+nqsw3/5FauTQ7V5AcGgu1yXVb
         yGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN07pPWhMLdP+jFMtbbqWcLADdQ9Wixici4kmm8M0dIxiJRnAt5jLjxb2JvcxDi1sWNZfuM17IeTbPzvlheWZOLyVN5mSkf+coaTT84vGP8Q/IvJQHnAljvuMxweguN3oJ3ENghpPeyA==
X-Gm-Message-State: AOJu0Yxd0m1prKPJlc/aksAhlfiMfuKnvLMUlwbtBaS2PUhEy+rbL9kh
	QZricQF2qDKMD6Ajt2GRu4TTxKYaKBBg71W5Xf4lZ5jW5YI8vMz5
X-Google-Smtp-Source: AGHT+IFyEg4+MF/Ve5JNcixHRc3hdjIBkZRZn6UCZlihyoQ3OwyzJG7Sm93rgnikAedpkjcIkr9Evw==
X-Received: by 2002:a05:600c:3328:b0:426:526f:4a1f with SMTP id 5b1f17b1804b1-429c6391c09mr40775985e9.16.1723409413716;
        Sun, 11 Aug 2024 13:50:13 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:12 -0700 (PDT)
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
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/8] arm64: dts: renesas: Add initial DTS for RZ/V2H GP-EVK board
Date: Sun, 11 Aug 2024 21:49:49 +0100
Message-Id: <20240811204955.270231-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- No change.
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



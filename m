Return-Path: <linux-renesas-soc+bounces-18477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE42ADDA98
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 19:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B971E189B2C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 17:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61942DFF28;
	Tue, 17 Jun 2025 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgJ0wcQl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA428506C;
	Tue, 17 Jun 2025 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180806; cv=none; b=KO7JmDoVpWwJ8KCxsCRT16oxI3iOqu28VXzx2h7/rIQLi2NO9+rst73mnuSrexKcs60Kk607QfZWfzzub0FYwR7IBG/A/8qawmvs34JSbPET99jnb980dLTSu2KYY38KvkQz8+mXu5GbRQo0waOgejHqJMVP0tHedNJgKdUMGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180806; c=relaxed/simple;
	bh=yfl7N15nnnc6f1rOdPVpX1eP8P6OlC+zKJek+HOBI5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UoCyDKDthJRTtVfdnXC806AYK6ZYPCwcm2eP3mDxLncQWLeP5kqNRYiFTKpiHSP4pBukvnBQBvjXAdt5FyW62iCF+L+Q/WaQqIH7uoHdcsKFsa7ZHu/FvLZ1n79jwXLknfamXbJrCIqYfQJsj+5G8Y6uIPKgll7gvl41oZkik08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgJ0wcQl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a510432236so4399735f8f.0;
        Tue, 17 Jun 2025 10:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750180803; x=1750785603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4v+WyWwPdPWEMSJZYSkRHKszCHhMQOWropBjebcwP8k=;
        b=TgJ0wcQlMP+jHOxAphB+V0btFNMrcNOPeLBVVGlCy8JUbl0CguwxvpJ2dgMH4mToPg
         YhbLcWqMxUg39j75YPsyZCt9ZQL6Ze4bJzT8po7hAyfwiYBNd7AWroPHJb9N2v+ioCEi
         GFekNcJrDBRAB8zNac2mnnWS75sexACXl9sQfDbfWkmxMF7lqPdT4CgMW0SghgMwtLjf
         zwNgv3YsScKFJcC238WSBZ2vdQwnfiJtxA49VL8miI222mJqHXs0xywzXshPHifk1bXk
         6S5jqcdQ9PsjIVaxNuKdld/XkFErqGMHO1KsiBX0UuCeodRKxzzNX7J/6hsqOn3NVkTR
         lIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180803; x=1750785603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4v+WyWwPdPWEMSJZYSkRHKszCHhMQOWropBjebcwP8k=;
        b=IggajaQU16FcQzZQpvv77OiEvPxXANRjP1XUY6Kh3MBqO3T/Osv9lxWsPi3FF0BWxD
         EHiFxnY/sCzESWxDWwpcd9sy4E2+CRV3BuyY5dMBlKl+BOl1/iCC904Yt5oAcBNQmoj1
         KYoaVLCIHwq5B4CkwLTn2WY12ZfiMghY5fAqVKkq0ugM9MeinugOcOb64Tzn/2THaNs+
         oJLMkw75rs8//gz7e9iU5+FBZifB5VQR91rR1F7LVtIT79s8ElUCKXZxT+xpevkS7uLx
         KT0+6PEcDfiwb1n+U39PPrBvFMH67PD3RxDNHnGl4z95igfNWFH2VjkTyHi7eQCmgITV
         VtJA==
X-Forwarded-Encrypted: i=1; AJvYcCU8VFpSoaskliu0GTuerRQkDEgVupNX6MufBkxo2C6Yi8XcXHHTFyrRkZK3/B14hYmLXD7F1J1YKicw@vger.kernel.org, AJvYcCVdg5FULr2xUUnOpi8RMY0PX9EwN87S0QXyv360JnJopjRe6DJ59q+d4vIWIj99xA/T8vG4Q4n0UYCIWU1/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3w20S4zhEc19JGfEoeSnjN0NCpVOr4RuVxrx+pzHfZA1QmqPS
	2As4bUcOwEtlAw5G8HxdmaiNFOofu115sAXM2WxhX5c7Z1clCcsGQY/L
X-Gm-Gg: ASbGncsr+3ZNdDKFhEdKXDmhWcWP4FiWAoTus7Gd1LpKNxiOW9lSwCOiGgPBpzJMZnP
	+WEDgols1qFNyIYS/9uPXOe97JMlKIUBGJyqBCklfuSCVBN2Osv/gmEG6y/gVXrnpka1rpqzk2m
	XoNYl1+zJVVfIJvaijhpWki74eQ0pdei7LMwm/ghnPFQkrlBJQX5qd8x+GbaI2r4rjh6FkdFBm/
	AecR5/m3yxRnOf7e/ioTjk6nND70CKL/iEnNywTBR5TOj07ObkAj0E4fvExFydSjWLBrWbACKRt
	6/wlbHYSdvqK/ogADwSpP93GBSM0XIPsu6uv5EGdCfDAOeAhCB5z6k8q41+8OkVWDng1qM6hVVu
	kASsh0Rq0f9c=
X-Google-Smtp-Source: AGHT+IFkM3UnwOFRTcJ6FzNOPlvnaRDdlfcxCs0B5yMtla7zHrPB42hGzQ4V9sFaYxQ+eGzGV4hE1A==
X-Received: by 2002:a05:6000:430c:b0:3a5:3517:de3e with SMTP id ffacd0b85a97d-3a572e6bc97mr12394380f8f.35.1750180802987;
        Tue, 17 Jun 2025 10:20:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm180875415e9.35.2025.06.17.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:20:02 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: renesas: Add initial support for RZ/N2H EVK
Date: Tue, 17 Jun 2025 18:19:57 +0100
Message-ID: <20250617171957.162145-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

Add an initial devicetree file for the Renesas RZ/N2H Evaluation Board
(EVK).

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Updated model string to "Renesas RZ/N2H EVK Board based on r9a09g087m44"
- Added reviewed-by tag from Geert
---
 arch/arm64/boot/dts/renesas/Makefile             |  2 ++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts  | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 52d0488cfee3..2bd5d179f757 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -167,5 +167,7 @@ dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk.dtb
+
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
new file mode 100644
index 000000000000..d6ba14a26f03
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/N2H EVK board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a09g087m44.dtsi"
+#include "rzt2h-n2h-evk-common.dtsi"
+
+/ {
+	model = "Renesas RZ/N2H EVK Board based on r9a09g087m44";
+	compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
+};
-- 
2.49.0



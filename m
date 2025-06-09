Return-Path: <linux-renesas-soc+bounces-17993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA2BAD27BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7CA91893EA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BA6225402;
	Mon,  9 Jun 2025 20:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0qBRsbq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46FB224AE8;
	Mon,  9 Jun 2025 20:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501430; cv=none; b=g6Hy2ejiat7zEZPA/tP5cJD5cA4GGsBAA+xvhpEGZ9OzbLfGmAs7lLxd0IgnKY4GadyIJCCwwGu31GAvB1E5Hi1rmSOLpPFQG+3PLCiqHjs0G9csBaSEkW2hUGRc4qHpXRNHF3M2ZaS7VG3iVnHUP9D1L0uX11IB3SNbjbBqqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501430; c=relaxed/simple;
	bh=KvuvUDLgyYHLgpE9UmWGNQSIJBuryGQY/4wRGNy7hss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYigjKVz/1g2s9Dmw3dS71BwyjtTDqtOSOLBXMtsONqYNQ3awlonQoO+pw1XLzRAcUrVtwvrsMSo0tkxaPv4h4GGC8hTYW1eSVhaZ1ifdzq9hE8VqqbSoXnRhmFVpg/fGaTpIIN1DkP0WMg3W67j143TTRNFLtmxoKIeK/w59Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0qBRsbq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1760290f8f.3;
        Mon, 09 Jun 2025 13:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501427; x=1750106227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ3Vpi1uvyZjd5dmy66W1BcHzbsGAIuuuScuiYd1QP8=;
        b=Q0qBRsbqVJBERcWIR1qIrL6dCdQU0j+vMyzASkvVSX2kDdfoCQk3xrwZMFUbHcGLsT
         Q9ERhBRE6IposDVRc8DIEIEsk1A8z1LkqUio7PNfRkL9ocSop220s8PihB+xw6fSy9tE
         GP7H2w4c6FMwvMrjJTG7E/nowuX0bzqTuveQaGeg/xf2M4WM2s56rSnyfhnbfYnIzsqT
         RNdL2ZgGWd33V5qYPvNfUwfIrLAy85cWf8OoKNcOZU7PVQUzHjF4Vg2x/alre2wxlK/H
         O+FwUVI2u9C65GMpKSMeyLjfKSK5MV4FZca8VvG9JYbi90yl+k1MyOMM8CkofPVB4F3M
         0X1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501427; x=1750106227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQ3Vpi1uvyZjd5dmy66W1BcHzbsGAIuuuScuiYd1QP8=;
        b=QDMvOHZz8jI9teNuQHNfLVdzci+Wn/X5UOcbwDQV4WJpWUGXhQFgzOpbdbmME8+Luq
         ZG4NLJYwR/StfWeLC8GaijOUM0UVYKU09qh5TYdmnt/+VoYB/ZJYDF7u42kHzSjtgQ4S
         zTJU4iFFzyDa03Ypt9a5oZ02XAeT3cfWfltxVlMtd7D/10BRyNB57umxPGgNlmSbhPs8
         u/v9fmcT8qr+LYp5b6uKB9vO0v2gaPstgh9yNgMAK+xHrcLGaqTho5qXeUqREcEXsvNT
         eW3aJpRB+eAuWAxF0effLip96IfNg564JZXEzPK9yQSoJz/bZXMpiL1rntqKiQsG17/r
         A+vA==
X-Forwarded-Encrypted: i=1; AJvYcCW1oRRBU3tu/mjbwOWJIJi+hftV3dK+4m1Qq6v7sCYLwTKDwNtDfkvbVeEkecTRBmmZDvm5NaAdFPeZ3FKi@vger.kernel.org, AJvYcCWUYImwbHBvtkLO4LZGX0E+30yCA0jwaOls86tdwcMOV3CB9Sr22EL8zBDPIM+T5zQ98sKqqpHRkM+a@vger.kernel.org, AJvYcCWpOK+9DeqR7ZypJoGQ3ye+SVg+arSRqsyrJBya9fSuF7J3RaPGfYgmJ5xnhMB44FVyEuban6E0yzw3@vger.kernel.org
X-Gm-Message-State: AOJu0YwaiMf3Ek5xq6s70TM7O9j9TFCVs67tNGP3NNFoHop/xp2gU2E1
	DRJocpXYXFbg6UtEkRFvdkxrSrFa2Q+uARUDkeekSt8fAZVHkSszBcbL
X-Gm-Gg: ASbGncuGxLjsjkstHV2JiZPzYt8lI+eaEAc55KRwcQ+AxAiXqudTkrbE5hEVYtERB6J
	wAddSZCoCg0gwKg/44wIBm8J6Mqv6H9CIvmr3QCvR1ly/R2/TkSJjUulS4xeZOMn2WZCugcQmt9
	OkaPV1VNIkS1HHU9SieXJKghMdYpASYPOxt3DTMVJZVzloU94AFHbLc66sW8PkXb7S42/fcOEmL
	1yYVO9JVOihvATA1wHR+tNkEDI562TOf4bpMi07C1aBXnZFs7ZhXvc0e4DcWzosNgP+/B1qKySv
	tvATgtj46GmDxCxrYXu2NmfL8AmOaCQOwIHkbt2cMFfPqFAsktGH1MO9ycm0PgW3IF4uHG3dPjH
	/Rb6FvJ6Vd4FVZPn/DIKZsaDEKvxqFA==
X-Google-Smtp-Source: AGHT+IHINc1o6jv4ffqqmU8yFsAYQhNGAmETPFAHHNzZBfja7prhumLlBtH4OXbzyi5fMY30ehkgUg==
X-Received: by 2002:a05:6000:188f:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a531cc5c8amr12537033f8f.35.1749501427037;
        Mon, 09 Jun 2025 13:37:07 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:37:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 8/8] arm64: dts: renesas: Add initial support for RZ/N2H EVK
Date: Mon,  9 Jun 2025 21:36:56 +0100
Message-ID: <20250609203656.333138-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 arch/arm64/boot/dts/renesas/Makefile             |  1 +
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 52d0488cfee3..7779e861bb1e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
new file mode 100644
index 000000000000..da0c320a0f35
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/N2H Development EVK board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a09g087m44.dtsi"
+#include "rzt2h-evk-common.dtsi"
+
+/ {
+	model = "Renesas Development EVK based on r9a09g087m44";
+	compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
+};
-- 
2.49.0



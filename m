Return-Path: <linux-renesas-soc+bounces-17992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 720C9AD27BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60B167A623E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEFE224B1C;
	Mon,  9 Jun 2025 20:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsby6S+b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2EA224234;
	Mon,  9 Jun 2025 20:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501429; cv=none; b=T3sWqGshqhEknhjgBAloz/huQMtEpZRugH6AZssqaqLG8Lti9y3PobUIs1aDpnyfDcsEbHNlhyArKKypZT/Pouciu43y4X7R2vAvtkLzgoIvRnjnjwgR1Jsse/cGcLRNYQqUbCVrii/Kasrc4KtsoOirBvcqm67l69yYy92oS+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501429; c=relaxed/simple;
	bh=H2/cW/L4ZEicJe/8cS6tTT/+cU/dDhdXJPugvoPRqF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEv0qcTetMvDySMOCIk9ldiaF8oKV6n5Zd4LP9c+rkGWA8kSLfVtSFqgte5gP6Tpb1eUwNIaZTCmc274XWeUNZuSyq2mIEoERGjIrItjYcUAkgqcltTDmNMzPmynDfXBXQE81yzqs3gMwgakOkj1HvtPoCmdliNTxaN1HvEASjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsby6S+b; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442f9043f56so26227305e9.0;
        Mon, 09 Jun 2025 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501426; x=1750106226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dBJG4jln0HyTz8j4+cWIMxfkSROJhqcTRfuqUg8B1M=;
        b=nsby6S+bCFCAk+6TmrkvjcnbjwP+E/U3a0+U8DCs/EvSXmdVRcPXkpxmfqt3r7SVEx
         oVM3jU5INgEBsuWShG/l3n0ZwZ9siKEia/vGSB5DKk9rrbZURKNQzAjweapeRKk0Jx4f
         KGbPB48fC++f/mf9Tj5l2LeQqDOGuaGSli2tcFM/aEpsRzLgZbGhHyzolT/1IHVgdY6G
         bEXLxwO++lDN5PCc1wTy9wRK+6gcQS2EwnrlQysoc01LzGI6jF6PtJFlzS5tFrqlijUj
         F95/K87j/NE2SG6P1CJrRpcYOz3rWUKlt+Y8q9XfVNNBge0ZwUhVXZ1xxkDdJiASByOC
         UohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501426; x=1750106226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dBJG4jln0HyTz8j4+cWIMxfkSROJhqcTRfuqUg8B1M=;
        b=uvxctA9ao6ex/TZwgu9Xdb3jygf3Sse37r8UY6ODPYVm5GMsPRkl4SXTlzes+bUJTU
         8lTdXPZ/4kMAZ7afRqzjBdCm9hkdvQNj3i9vfG4I9ifINAdfV9392RXPt9SmlQfKSMmR
         QRYorZ9xU80FbHIZf9lLEgxQZQpUvPzliwGrAK/RbzrxcKrx2kakLYF7FM915nLPyS8r
         rfjT9qy66TNLSpftPyG9BF8AG5XM1JJx1Ct9P98S0B75gkZwVqz/95kqCrEvg3V6kucv
         VGm0zuE2NnqkL3d+n937EJ2oOrb1JYAGXCjj0WeqGeOvtDAhApg8kHW8YWRm5VXET52M
         dpKA==
X-Forwarded-Encrypted: i=1; AJvYcCUtcv+t6FsNHEA4R1OuCDGz0i+JELvKWq6XJzG/AP/UfvH5wIB4RsMncbg2C4imREoRDIA1AlMCIXbw@vger.kernel.org, AJvYcCWP0YutV18ZtbPjJSBSNjH4pfYkv/CUpjGP7Fbc3ckSkC3A+rjNmmenWIPHCF1pB/AavjD6QWaTt7PCl1az@vger.kernel.org, AJvYcCWhRTNulMxs0j5/8HxWvMCQNiGMP5k5z6lRxepTmVlY3QQMbKNRs9SrH+GrlgDoyDliZmLExh3FeI/6@vger.kernel.org
X-Gm-Message-State: AOJu0YwkqP7masL4G/LgvvAOo23IgCvYyMhEil3JEMMTij1AB8nl7hkT
	cWWpnxJGMKJ8YY9NAkNZgSDMLUhqNfyeuuUySnhd8M4ThAeSGKhu4WT9
X-Gm-Gg: ASbGncuNRaERAVkQHedWHQ7iFBmcseOKM/LewgNRuDLCVaGQsdBxf2eyL1r4SnPB8IF
	HLqfCcbrjAQf9lqlQsiZqx0zULmiKKtAO3UtaJDDg/MvXDoFwyCS3XYouakobyADHoNMiBdKshb
	PnFcKEtXPPt23OR7HlYzOcEWYbiTJK+Gtf1Or86Ar8i2doWDqpDRMtCtOmmQbbsoPwgLwynhL6T
	38QOa5MYlrNShrxqQxfggifnXwciiD/kPdM/5PS5dbvzBPk2yWbglbSNczYsaXygFwoKJqQ2N43
	TdEUZ8tNdse/niYa9JccuoUOAq8jQUGre17TykSv14s5WqmQ3nBPQAjoqRX5lhdmVLfUa/qgkpo
	2Pp/HHcVY+JgZ0PupWpY=
X-Google-Smtp-Source: AGHT+IGUxiOFz/LzTEM7z413N+WwoxmecBSVBWA5feLOlR73kLS2xByhV+zXtfgWIIYkuQBwb1TBqQ==
X-Received: by 2002:a05:600c:1c14:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-452013bb7c6mr119570825e9.19.1749501426010;
        Mon, 09 Jun 2025 13:37:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:37:04 -0700 (PDT)
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
Subject: [PATCH 7/8] arm64: dts: renesas: Add DTSI for R9A09G087M44 variant of RZ/N2H SoC
Date: Mon,  9 Jun 2025 21:36:55 +0100
Message-ID: <20250609203656.333138-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add the device tree source include file for the R9A09G087M44 variant of the
Renesas RZ/N2H SoC, which features a 4-core configuration.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi
new file mode 100644
index 000000000000..ef0343b53309
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/N2H 4-core SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a09g087.dtsi"
+
+/ {
+	compatible = "renesas,r9a09g087m44", "renesas,r9a09g087";
+};
-- 
2.49.0



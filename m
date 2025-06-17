Return-Path: <linux-renesas-soc+bounces-18467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 421D2ADD4EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E7101947128
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BA82EF657;
	Tue, 17 Jun 2025 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDLVsH4r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5562EF287;
	Tue, 17 Jun 2025 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175886; cv=none; b=tYXfH4SlUF+hziZaLhmgM7sQhqpurG3fIqvlGIHUhPBw4VlHkAvPkTa+Lh9QzRmosOsIolTmpgNL/UDWYGLQdbifXRN/cqdHU3yXRn9dlUurt45o47lcOmeZjUTtFQuxDqxx4Wpcb3BJGQcR0WJ4juxV2tfEMXUIXYmoKEmIOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175886; c=relaxed/simple;
	bh=XQ+K4Hgm+RAl5eNpXO3t38i9G8qkiOHDLlywboP4N8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AuGmJSiV5R+6K/Mwi032mxp0/JMYXt825PgzpWb3C0s9+lEx+UbiKFc/PoC9ps0W3ovpb3lxJfHLwyQGTej+nFgaJeZAWK1UidPlx2ZQi0DkAHMIrCyQ8FHnn7y6AlhpxrzipSB/8snS8kWKfhZ92V8TRBN+zlrzQwy+o3N4VXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDLVsH4r; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4877937f8f.2;
        Tue, 17 Jun 2025 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750175883; x=1750780683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs0MHUSuAqr5lyxntyGuJbGPupqieFmIjeWe0PYiUYk=;
        b=nDLVsH4rTsql+MPkCvs/A5se5Y1akf6zhDVX9yREt30EgCQXhtDQ0BK+4ej1yQ4fkk
         IMan7nkPqdhCbfITq7U8/No+s9Bh4vna7RPpz/niCfi6KV0bib8/9BEUO21kGmz1Dbcj
         n9Y2i0fyHIxlyNJO3s9BI7FI8VGeMGuQ0zY4nlC3XkrYY0eCSEVAvFX5BWdbbvGjEO25
         x7g2c6adFSaIFPA8LwB6ElAFNIrot3IMMt4s8PIU0ZsRhjLOoW8rX/5r9MhcYL+vtNqb
         ucJqPmff+kcgC5Llop8KLsxBpjhcq7ELGOL6c9Cux0ZQHkLtqLw6EN7oD8BYBpnk+/Ni
         3WCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175883; x=1750780683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rs0MHUSuAqr5lyxntyGuJbGPupqieFmIjeWe0PYiUYk=;
        b=weal2naz0SrQyqIjc99Bg7ttxaw1JtKAHAq4YZ/Uc16akOZzW4HRuw1HJLL7kbPTyc
         C46vHwBlx25kL3jptot0/JukgtLkjtNNDQC8rN00zJhtcRSm7NSh/Ez7RIFGV6BP24Es
         8sSBR4qoNahTMklql9oahsoDOUnJifH9OPUi3pOBAAWCTaMvEkw95JdoHsVmIgxc9f6N
         ezhjwrwO2ThBKtKTIyQoFjFJew7tqirj11nNYOcOoH4o46bZ2McSNueUeurn4w2PvCh9
         yOThuEtOEQ2GjCsyq8Gp0GTUC3clMFE4OsYddQnB5suGv4JNtzFKjO9iQHids8qMGKys
         t22A==
X-Forwarded-Encrypted: i=1; AJvYcCW9kknkU39WSATLTS9/JdA7c0Vsw01D/TsORy2EfdW7duHQFzZ836JlVHL+kSq5Xw4u5Vk7PdLRdACM@vger.kernel.org, AJvYcCWXEKU9PYTdUhui2JjvhS7H/FgPyksvATSPzjo1aUphiJCSnvY2/ix79g1KcMGzFOTh4Dz0A9pxbV9l@vger.kernel.org, AJvYcCXzKuY6n022HbSWo72LizH4F1Jmmc4GO0/h8DXF53pg41AdRdDozuVyBLWPxjLgzRNt6yAP8qMzdVF51wu7@vger.kernel.org
X-Gm-Message-State: AOJu0YzR181dV5qN5O1foJrO7EcO18lGgn012jGjttC8iseg6EtQi38a
	aeTmle8dwldhlv8IsEkw07lXsUPvz5+IUXCyymYVrztbF/GfhEEXFDAD
X-Gm-Gg: ASbGncs+rJlESh/vWRjmK/nstjdrbti/m42KmJ0Vow3fWfnpJZg/MG1Hl6oXQTkNHgG
	0JkjXlzcugNSNONCCwSreGhgGPYoCy5UEa3PLT6qnRns6J/ehZLQMkUEB3aU143n2fsU9tNrtWm
	TU/oI0O+l4MfdVTeYckKEKkmJy8THv11imas+l338H/UF1z5wD5OEEapJqUKaOJAqDjp1RgR4Gr
	HuDKM2VLsNEjaU+mrSMNDT/yPVsKbRrTDPs0u9ipIfqXs0b0Q6t99XIKC+ACw90EZbGxs1YMq9o
	AuBjjvT1ki02HVjZ0d4ka2O+RNW4HqF68Z/JRNnzxlTzbYmi20x6X49Rf3mtGFHWc2aMqaKGv4O
	2bmGctykiNre+W9PEY971HQ==
X-Google-Smtp-Source: AGHT+IEB3YjtHrUHum7CUyMSc5dfZuHkuZ3Wku/7rpEGFuQs3VMpmhpSdfzsS+sw6LYDgY1a9WD/sw==
X-Received: by 2002:a05:6000:2582:b0:3a4:eda1:f64f with SMTP id ffacd0b85a97d-3a5723a3b64mr9714289f8f.30.1750175883303;
        Tue, 17 Jun 2025 08:58:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a53f79sm14189115f8f.4.2025.06.17.08.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:58:02 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/4] clk: renesas: Add CPG/MSSR support to RZ/N2H SoC
Date: Tue, 17 Jun 2025 16:57:57 +0100
Message-ID: <20250617155757.149597-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock driver support for the Renesas RZ/N2H (R9A09G087) SoC by reusing
the existing RZ/T2H (R9A09G077) CPG/MSSR implementation, as both SoCs
share the same clock and reset architecture.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Updated commit message
- Added reviewed-by tags
---
 drivers/clk/renesas/Kconfig            | 5 +++++
 drivers/clk/renesas/Makefile           | 1 +
 drivers/clk/renesas/r9a09g077-cpg.c    | 1 +
 drivers/clk/renesas/renesas-cpg-mssr.c | 6 ++++++
 4 files changed, 13 insertions(+)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 45f9ae5b6ef1..6a5a04664990 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -44,6 +44,7 @@ config CLK_RENESAS
 	select CLK_R9A09G056 if ARCH_R9A09G056
 	select CLK_R9A09G057 if ARCH_R9A09G057
 	select CLK_R9A09G077 if ARCH_R9A09G077
+	select CLK_R9A09G087 if ARCH_R9A09G087
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -213,6 +214,10 @@ config CLK_R9A09G077
 	bool "RZ/T2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
 
+config CLK_R9A09G087
+	bool "RZ/N2H clock support" if COMPILE_TEST
+	select CLK_RENESAS_CPG_MSSR
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index d8d894a15d24..d28eb276a153 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_CLK_R9A09G047)		+= r9a09g047-cpg.o
 obj-$(CONFIG_CLK_R9A09G056)		+= r9a09g056-cpg.o
 obj-$(CONFIG_CLK_R9A09G057)		+= r9a09g057-cpg.o
 obj-$(CONFIG_CLK_R9A09G077)		+= r9a09g077-cpg.o
+obj-$(CONFIG_CLK_R9A09G087)		+= r9a09g077-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index b83ef933ae0f..baf917ff4beb 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 
 #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
+#include <dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h>
 #include "renesas-cpg-mssr.h"
 
 #define RZT2H_REG_BLOCK_SHIFT	11
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 4a5ac9eef9cc..5ff6ee1f7d4b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -941,6 +941,12 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.compatible = "renesas,r9a09g077-cpg-mssr",
 		.data = &r9a09g077_cpg_mssr_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A09G087
+	{
+		.compatible = "renesas,r9a09g087-cpg-mssr",
+		.data = &r9a09g077_cpg_mssr_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
-- 
2.49.0



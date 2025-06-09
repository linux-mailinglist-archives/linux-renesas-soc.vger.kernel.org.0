Return-Path: <linux-renesas-soc+bounces-17991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C201AAD27B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BB1217024A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB5E22489A;
	Mon,  9 Jun 2025 20:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqo63M4T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A225223709;
	Mon,  9 Jun 2025 20:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501428; cv=none; b=qp4BSuZ5VFQjeVg0C3v5RY+LiMPLTYA7vm8kwsKRBEtucLsdOUflxQ0m5k1GDuSvpE3ddUQkCwMUfhoIiqD17dRf8yhlA+nxI9Ph7aoyBcEX7b7knfwHQw70T+cyap0zUj3ycdi4MXfLHsPXIvRPKbn6ZfKIlbw6T91NUTAo3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501428; c=relaxed/simple;
	bh=gezkPedkhmmpihJOQU6m0UtqOCtfVVcIy0xXFZnu6Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSxRATBH74FGrnxL8qul8UvFU5COQis+10+8vzwp7MwgF0NMRVmunP0FXVlQuPN6PP/t4JIsr7lwJEXBXvpbtQ+I5E34ybC7LPKOyRB2BYHrDpNGYPftBsuPzePHMQfe3ZWypFFq1tr0dRq1pn0+717eRNWTMqVUVYcNZE9hBZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqo63M4T; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so38907405e9.0;
        Mon, 09 Jun 2025 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501425; x=1750106225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdcQlmu/zaJorwx1Ga8T0Dy7fggbc8JmZs23vgYEJzQ=;
        b=eqo63M4T/XP+zg7cTNoI0s004VBp8wJTHuG9joRptJnBljY5w00TVsSBkGQblfFfxT
         1VK2XlZ24zRtYsEbhdLEmQHS6M13aYmhVrO+LMRgfxm0Io96u6BM7HcoQGDC1q/ZngI7
         H6BXE9frkXP12c8a+gxo/BlZIOorYyItVm17/VSy2QZof6lukJe/96j7f4JU0vhOV6ND
         dggsDimboxrJ9jopGegCZiz4QUnWDKic60Q9fLVjEuMfZJEx3uequ4u3tMh3/qwxkld7
         4HunPyT8+w2OlHKvnGleu4HbkESBlXaUBD9zgNatlpWfnPMx1v/FbDEfO7Lfq2e6wYJd
         hXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501425; x=1750106225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdcQlmu/zaJorwx1Ga8T0Dy7fggbc8JmZs23vgYEJzQ=;
        b=jiGZljoQSS9R+FFR2h0oou07RnCbKMkgRHhJUqQTfIg+huU7+xPtfMejCVTddajUB3
         2gNs0hLrHX4kmL18T5+HOTvSp7jiz9nEnu7rzqnQ2H466l3txAcf3Tv57De0C7vnh2BJ
         tKW+v7IPe3gFtP7FmcwQ9xS9ObgQKC8FdqxCXFaAenBhlG9oYqI4objs7ns8Ap2rfJ1C
         qKS0kn9M6iGdwJIb461+0R8lSdzn0hD5lwNcB4IWeHG7UKtBETWkSEXDj2sjdG7LauLp
         wqOwGD9I6ynlPnrWfbSjukrG1BYwRTIsOlxRa2yFjARbKbFWmFNozyaI3r29+5kbT0YA
         pW0g==
X-Forwarded-Encrypted: i=1; AJvYcCVFlZ0Bp0h3Vhu4Q5YID+SbS103GvXzPx3Di9mW+/KqANnKtJniFVtxHl141Ph3X7TaijscprEOJr4f@vger.kernel.org, AJvYcCWG+hlJKm24k+I4HZTgYVoacV6IF8iPGgdFS9E69jlhD9vCTOZr/gx/hne2RqBYenM5AXwGCLNdpObwCY10@vger.kernel.org, AJvYcCXqllJ0uE/ziI96DN4sewjst9FzYSEA5xMjXePx+sZUEMyE56cjXkts7dVRsvHiZ+Q5w+bY/oPcHq0C@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/nee2QoqWe5+pQ1xqENS9UVYCZd1637eO3XsVOeXlz65mATH9
	cvd6GStc9QcFPPgqhr/785nD3gU+89boAlJh0Yzie2Tl1hRSzrxd+BFv
X-Gm-Gg: ASbGncsOcoCKFG8qo3OQAbuevxubQlsNahjjc6HHQ61Z95MCM+NoEJk69yMaZN99DR2
	2jMX32d46yrd69+XnuuM8S/NYv2AwvA/3jrQmA/utFSfOTAywhUVOo/NtKoX7cEJ/xYiYZHDzlT
	L6fBJzxeKqZeu5rKpIyXgmA+7cgLxpZQI5XOT0JSbcPy4eqW8DHxdGmXonEJW4MxxBTZ9gsd4G/
	vzujwkhX30LI/t6Cwm3PBBwx+AADS+h5LICzIxnj0d/5VPQgVoj4RreCfTZcrjNanrTttucU8oO
	yZvitxvMe5cC9nSCaXm3lZb2ecwoKkitR62pW0mqChbBVnQyKU0wE0XA4iCF/Ksh/W1LURLscgW
	Lj7TOJCaDJZD0clQPsVA=
X-Google-Smtp-Source: AGHT+IGm0LVOHM1XvuAf6SeGUgAG6OjE60Da/pRaIK27NvB5Qn2z21fEwKEXexF13xoNAke99q6v5g==
X-Received: by 2002:a05:600c:c0c2:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-4531ce4f7e9mr6007245e9.0.1749501424577;
        Mon, 09 Jun 2025 13:37:04 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:37:03 -0700 (PDT)
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
Subject: [PATCH 6/8] arm64: dts: renesas: Refactor RZ/T2H EVK device tree
Date: Mon,  9 Jun 2025 21:36:54 +0100
Message-ID: <20250609203656.333138-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/T2H EVK and RZ/N2H EVK are very similar boards. As there is so
much overlap between these parts, common device tree entries are moved
to the new file rzt2h-evk-common.dtsi.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 17 +------------
 .../boot/dts/renesas/rzt2h-evk-common.dtsi    | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-evk-common.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index bbacdca1959e..b5e590be0f95 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -8,24 +8,9 @@
 /dts-v1/;
 
 #include "r9a09g077m44.dtsi"
+#include "rzt2h-evk-common.dtsi"
 
 / {
 	model = "Renesas Development EVK based on r9a09g077m44";
 	compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
-
-	aliases {
-		serial0 = &sci0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
-
-&extal_clk {
-	clock-frequency = <25000000>;
-};
-
-&sci0 {
-	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-evk-common.dtsi
new file mode 100644
index 000000000000..dc386dbd432b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzt2h-evk-common.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Common Device Tree Source for the RZ/T2H and RZ/N2H Development EVK boards.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/ {
+	aliases {
+		serial0 = &sci0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <25000000>;
+};
+
+&sci0 {
+	status = "okay";
+};
-- 
2.49.0



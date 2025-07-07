Return-Path: <linux-renesas-soc+bounces-19338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B133FAFB782
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 17:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0293717C933
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9AE1FAC4E;
	Mon,  7 Jul 2025 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arzjADbG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831C1E230E;
	Mon,  7 Jul 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751902545; cv=none; b=CB8VenwTTXaezpjH1TteE6Kr1OheaEPzJ6A6wAa2aRCbP+vyAx8ix4DFjzbMjZIguhM86Bt43Zh/CWZy7eJxlTtLuJf7Ijv5Txngs69mKX2O48e4tbTRZpbFCdBm7hByqOmZnQL2amGeAR77913ejey/xiOYVfvtScgAVr2d1l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751902545; c=relaxed/simple;
	bh=VqkS8KxlHtDRDftImKs0NMNEGRXqDlSYa+v34mtu/Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pk0zbCraDCTcsqY/+ntn4pX6HuIbL0r4V2ahGn4Vo3QOWm2M5DY+GXGVz3BBuPgG0gBmmwM/l+QJM3njYtpMznp6XYNBpo1P0/4qlY1SzQLK6DIUw80yVGKpnH8oByV8y2abQexclv7ny5DJ115KVaaHsKMvTj4Cc98Dfr7y+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arzjADbG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d3f72391so33547915e9.3;
        Mon, 07 Jul 2025 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751902542; x=1752507342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iM662BR/drEG4acxn/iW2zCix0I+LP9M6Q4T202wfI0=;
        b=arzjADbGJOcy8v98nsK3PlUQ0pPiw9Na/jpSXYA3WneOuoeVEY8O4QQ9XmEKoXllWb
         dE7kgJsu+zGkqk1bqmdsa6xkELdfmE7Fhkd3EuKE0UfaF65uJVFE781wKGs2cYWNIHmn
         IaAOpNd9nL11ehO66Sg7dEUmbrpTMBXKaxN79sNYJoUkq+eCEmVRqRAR0Qar4eZsnQQr
         ikiIZ0HN/UJNiBkO7QQufBpfOkLle2Js/W5WWqCVaYJMkjGNtKBbD3lLlj/U4XwR1UTR
         inpPO5AuJk6so48fwCA2CHOwHgM34s/nZztgBQLC9fCrOSvKCU4SN97RpgTtwueE8kka
         KZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902542; x=1752507342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iM662BR/drEG4acxn/iW2zCix0I+LP9M6Q4T202wfI0=;
        b=YFxl9h8MkYaqfoHALpOBmxOeGauytRC3aBpbGQgQQXXVZecYfRwByiUQ8DNDEdC6C5
         REz4CICE10jJRsG+64XuEnuWOKuRbmBGB/MHM20/mGW5F3bhizlskx27VK7ltVlMwiqq
         v0BssPFXcVk3Rx+O3U5cakLdK2ZRY0skZgYOVXfhf/vhGAkzz/JQGNwefMaoTDVJYweu
         vL8dhigixsUFBgU+uzKkB/P8EexTQztBtJqKo9TMMw9gN0+DMQfvmwkqWoF5BM7I670Q
         ibAKAIdh/oKQYMj+MatCQYV3QB4zGy21tCLWOgLztBRgY719iQoQgi9ptsnEQa7nV0HM
         OqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB2nofdKSKesC/f6aOvaC8Ro5Y8Jy1Tt9vGox2Uz/3Far2lTogDxMP79E4QQiccqJ8bI5U25LGxUJc@vger.kernel.org, AJvYcCVwEobhY6IKFtS3ns4tUF5YpPjeD2nFjz2hplJN7ISt+tm1UoDgQDlIdpER3kGSrBIP1VEMxtdLAWIV9DtG@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWxw/njAja9D0i6IVTrVKck8TjMq8JCn0DPkIzYosuDr9npwD
	vKFWfXZHhThD72+MzcwlCo5IQmNxhKGrpvhSCm+sXcS2kuC8lWwX/WK0DbaISw==
X-Gm-Gg: ASbGnctaeYzeTCnh96pEk23f/iScBSXmAl9flzLoM0uq72+UJNIKw506eUIeeCxnyEW
	mKZhVxxW9hOFlvZcf3JWevbqZw/AItv7woTdLl8hhcoFGhOIFdY7uk7HbTb6BNFR7CmkURrDjUp
	LPO1SHGQRBeAIiqrY68vhiqYtuM9iS6miKXXLiEEBoAD47RrtDR/tJdnte0YPTAWlL1rkdrBhrY
	IDw7dc71/KtqwDOIffKj5bREy//o0z7tMSDdROj76dFQ7BGftlejZg0ehPazz4f9RBlZzZXwwXR
	xxNBrqYOJoYz2JQ2CqSWZvcRoVBMbW98n5CDTACK8Mqo3IWPP4P7WzFxFxIxU16h9xRyJeqnvJe
	B00fjzxj3c5Huk7Hw42Y=
X-Google-Smtp-Source: AGHT+IG8QyCfFd8R0zrTqdbeLDe3uZtWuAFxkW+PH3sMSzqpAn2MzoEfhvXhfXkZLDv/nKofJGY+Pg==
X-Received: by 2002:a05:600c:3493:b0:442:cd03:3e2 with SMTP id 5b1f17b1804b1-454b306a122mr126776285e9.2.1751902541754;
        Mon, 07 Jul 2025 08:35:41 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8fcsm119491735e9.7.2025.07.07.08.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:35:41 -0700 (PDT)
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
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a09g077: Add SDHI nodes
Date: Mon,  7 Jul 2025 16:35:32 +0100
Message-ID: <20250707153533.287832-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add SDHI0-SDHI1 nodes to RZ/T2H ("R9A09G077") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added "Reviewed-by" tag for patch 2/4 and 3/4.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 0583a26ecbc4..b16fd9259d8d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -155,6 +155,46 @@ gic: interrupt-controller@83000000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		sdhi0: mmc@92080000  {
+			compatible = "renesas,sdhi-r9a09g077",
+				     "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x92080000 0 0x10000>;
+			interrupts = <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1212>,
+				 <&cpg CPG_CORE R9A09G077_SDHI_CLKHS>;
+			clock-names = "aclk", "clkh";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi0_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI0-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
+
+		sdhi1: mmc@92090000 {
+			compatible = "renesas,sdhi-r9a09g077",
+				     "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x92090000 0 0x10000>;
+			interrupts = <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1213>,
+				 <&cpg CPG_CORE R9A09G077_SDHI_CLKHS>;
+			clock-names = "aclk", "clkh";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			sdhi1_vqmmc: vqmmc-regulator {
+				regulator-name = "SDHI1-VQMMC";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				status = "disabled";
+			};
+		};
 	};
 
 	timer {
-- 
2.49.0



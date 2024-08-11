Return-Path: <linux-renesas-soc+bounces-7797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9194E30F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C84A11C208DE
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FDE16A92E;
	Sun, 11 Aug 2024 20:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhQo3aEA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BE165F05;
	Sun, 11 Aug 2024 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409420; cv=none; b=Q2kG3yMBY6qtFTZj2agd2ExsHHZrr9cGa+d52k5QMcdQqHF9qQwV/oNwmgCHIzd/EE4riM3yneQEWlxMEv4HHroqDtPO49x5cR064QZsursTyYT01WC+ZUWb2hdTRPNUM6HBCNaOr6gM+skCjn9qt7DUWCYGf2ETdDg6Ddq4dPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409420; c=relaxed/simple;
	bh=TJhHdhzeAgd72A13pmJjnPESAuLLkcZDqzJ+fiti/rA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qlZdakq2fFh6U+7idPYkfSZKf5BmH/dt5I+1fzLyzE3QzpGQpiSxkhkzv+TLN99kF4AvkxrlLRv6btutHLXdRVJFgUOeSbWXX6LG/5JVR1ZoJ44XZ0jFZz2EdH1Lv6ZJ/0oV7FBPDiir8qcZKK1nV88iNariMZcKJ5Tbory/V80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhQo3aEA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280c55e488so21195815e9.0;
        Sun, 11 Aug 2024 13:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409417; x=1724014217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD0zqlGsu/Jb6cN9XoE+F2UGNbml3288z6liB5DfqwI=;
        b=dhQo3aEAHxzC90kj/o5PhxCZjSCK+xRy7OLfEPNAsZtvY1r9taamfWZMhgYH2kPGfl
         Eng21Kh6EalBkQ8ZLX/MP45BVqoYaVT+6QgyPDsrIhpJw61F2yUzXoF7uBScjMs96Vv7
         OF4cH6hmAQdqsSZg2wf8FnBvX31sA3xP5yp3w+Rn9S79ihPe8CfjEH3ZnaIX686uGKMz
         h+12FXv7J5BcBCeoyEf00g1GsHuIxbp8aKp1/IlDmcg0Q4B4dvZEQPB/X8oVsLLNjSUM
         gdIFWhy8GxOtrornhl4BuTL49FW8HzWSOAbRCxFz6AraS83v+ZObua09lCDm9yvECqm3
         Zk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409417; x=1724014217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GD0zqlGsu/Jb6cN9XoE+F2UGNbml3288z6liB5DfqwI=;
        b=rY4y9lxbsoV1VPeAIGQOKE5sTmNtINknXV0Elc/t/5fup0eYTzmw5UW/jehdBpLH5B
         ZO2/+xGEVo4ijMQD4G1diUzDJcoiEfBK5ge5uqJlYv2KxKkANN3DXmYfyq6BvXpJd9ya
         x/tBDpsjX9q/BjHu3nfPW+2iUurogmvL95XhHeqsXnBXMI60FgJL2xuuJWklZfz3i7T/
         KvlNKMKZlPDqouCmq5ZgPSD3WLQI0NxIYxYyhZ1B7SVnoGcp9Bo3s4yYvs0SoJJOVTil
         HyAsSNhbBJTPnjEuZVkwmA0qHZL8PQP41ja+z8Ns+SWJV6bu+Qy0U9mCiWMH04772X6V
         6jVg==
X-Forwarded-Encrypted: i=1; AJvYcCWVEs0GuggRftRy2o4/gSke7e1m+tNkRVV/x9pTj0d5FuINafGZ9s2RxTOD7+IY7GHz1MlT3JXUAgtsjfc7fTuJflUTnjqYS110DNw66tcYNAHZxKQak6+EA0xLqlceySY8Oo8zve/gpA==
X-Gm-Message-State: AOJu0YzJar9W6s9cs2R/BgQiU2P+ql/gxCIL/3TJ/hFbn0MGbcFHiOT3
	zAKGtpAyaY8uq6cmMsuApfIhDfhYnkFOBcvQtYMECHZ6yh3HO0rS
X-Google-Smtp-Source: AGHT+IEDfnZ7/AChKy6JD3n6uv9TPSTMI2UeSoMDCEu1rEQU/ryWW7OGIc6Ahn32+rBd1uZDNidH6g==
X-Received: by 2002:a05:600c:3543:b0:424:a401:f012 with SMTP id 5b1f17b1804b1-429c3abdbcamr54394985e9.3.1723409416670;
        Sun, 11 Aug 2024 13:50:16 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:16 -0700 (PDT)
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
Subject: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
Date: Sun, 11 Aug 2024 21:49:52 +0100
Message-Id: <20240811204955.270231-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add SDHI0-SDHI2 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index c9e1e21b820d..435b1f4e7d38 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -429,6 +429,51 @@ gic: interrupt-controller@14900000 {
 			      <0x0 0x14940000 0 0x80000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		sdhi0: mmc@15c00000  {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c00000 0 0x10000>;
+			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 163>,
+				 <&cpg CPG_MOD 165>,
+				 <&cpg CPG_MOD 164>,
+				 <&cpg CPG_MOD 166>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 167>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sdhi1: mmc@15c10000 {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c10000 0 0x10000>;
+			interrupts = <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 167>,
+				 <&cpg CPG_MOD 169>,
+				 <&cpg CPG_MOD 168>,
+				 <&cpg CPG_MOD 170>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 168>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sdhi2: mmc@15c20000 {
+			compatible = "renesas,sdhi-r9a09g057";
+			reg = <0x0 0x15c20000 0 0x10000>;
+			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 740 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 171>,
+				 <&cpg CPG_MOD 173>,
+				 <&cpg CPG_MOD 172>,
+				 <&cpg CPG_MOD 174>;
+			clock-names = "core", "clkh", "cd", "aclk";
+			resets = <&cpg 169>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.34.1



Return-Path: <linux-renesas-soc+bounces-18742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C73DEAE8829
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8567D3B1044
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E30A2BEFE3;
	Wed, 25 Jun 2025 15:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVZkH6KC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DCE2BDC3F;
	Wed, 25 Jun 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865467; cv=none; b=iFCFllWifA1YpTXj6fjAqJZHJbyKIfgZL0wSpAoAEJ/AY62pO6iQbNvbEdqYBFYsfCoe202BUoyATbxYds77PzSqRGBQch2hG2Ek1apfqRopq9OqHEUBjPK+6vrr3JahqUoQJ4CKxnjfFwPbWCCw7YI/AhvrxhImhl5NSvJOJrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865467; c=relaxed/simple;
	bh=XNYxdKu5jj24+mlpIYHm+HybKIUYNi0kujPPj2/eF8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mteqLyNMnLWUhjJv99qFGGSsgG6edC8SU9oBfsEKqBczKjVWXhZ5+BLcVBs8YvDXWK+x2AIWuVDp1qaGFCmCblkIPfG/nMPjYqM4tZCnst5IpCFB30jiq3i61mVtxC/lkh2cdTNCMkr5UYY9kG3SYSm/ym7cV6Ra/9YhgBiU5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVZkH6KC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so49231f8f.0;
        Wed, 25 Jun 2025 08:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750865464; x=1751470264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlLImq14cA2voaRc2G2bmeXuaGherqmP0Dlv1wdcz7s=;
        b=aVZkH6KC7Ir59mM+iVUR8hkxVbH+GU6vAfzhEXD4NK9lEpeRVDetPhmGpzZdklT2V/
         bqZwPtc31q3Fp2T93kTyMOHRRC9krB004iRO5UnYLg6IRCfVYY2aA9+SmCRxTOdzxNrq
         Y9Q0syukwtC5t9tEfO2oma4qT9LKcqsz6dyWOTw75Nx3/m++r/UT8w0bjYArTZ9A1wAB
         RtXxT51I/aT4PKzWc4qOfCpdPhlvhxW0OFL+wANFuOc58fFWHPsULBD9nywwhZwXwqnP
         RacV3IKICQfSVQSgDnBNvQwDeFE0j0NTsJuSqRa2QScOIJhk4t0cJXLpTNWFW/UEszGe
         /paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865464; x=1751470264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlLImq14cA2voaRc2G2bmeXuaGherqmP0Dlv1wdcz7s=;
        b=QD8e37GaPPfTi3QsstwkTawTJehdgvM8V+V2w5Pw8wGuHhQPJlVMgWjz3UJdDcrSiM
         b5C5RucpK5rmo2Oe1wHGIs/7oMwHXGcutUTyKOIe2zmx+qMkd6COnxj9eY6Tfee2pfVv
         eRqa2pUzL3OWgMWi/uPhtmzSHVdHNIXC97LZZ//QH4HTVfJ3xH/4pD6ug+5JKF2OibeO
         OB8WiJI7WBtY23/K+JV68LIglODqJ/v+Qtiv6//dRhuwakybY2kkDC1D0BOi76D8WLWr
         7Q6YsQfvDnrXVSK579R+12WvV+naPM2gJVuS3Xluafz8saPePBbTc4aJygEHH23O1xfN
         l0+A==
X-Forwarded-Encrypted: i=1; AJvYcCVkZ5SFarDfdpoqkKv/6M2huA0MHvW/zPpjWXRY/jihiXRPVgxmjEf3SMEBsrVusscrqQ5HrXUK/2gH@vger.kernel.org, AJvYcCXIhdBND/FVJqWTO+DSe81diJWgqbI9IfHmEeGYoZY7jjdsHG4TlxzEgIEU3o0IZPc1kUlyDw0bLKG+O1ml@vger.kernel.org
X-Gm-Message-State: AOJu0YyelX8pBjVIvV2VTFMGtHkR2wrRQQ1aK5XeZMHM9yGMij5B+OTx
	AwzSBh0EwR6U7FxK0ymq9iGoDD1lY1tpV/y/dlxfccM/fCDDzlaUr84xl7CnvVoEcKg=
X-Gm-Gg: ASbGncvZrCRQpsKaL8jd9OjuT89PJ+bP2CMtpHGnQYLYS/Q+kPDf3fnDajtAU3IcN1P
	yeJK3DKd6SyiLbmzHPO+BNIt+oADZbuCOOAEu50oKVV+YbfryLhDp7DGbIndRcR0Rd4QXsDYxua
	ASRaA2kc9nIwUrkCgx4OoTVE8GZwUS5jMdlwFv1PX3yqz9lCNKdEcseUt95GedikXfZXGLEnE8T
	3r1bK8vxM3VSJ4iqpIT0K0/7M6lvmAIZ1VOI5Z94UO3cgGtqSUgu4l8S0gVkOt1SfCzIckiCV3O
	LypnjpLUJjTjo/P00xaKcUZhrBDP5YBaHcyNA1EDamJALOSRL9UkTJywodqnlVHRQUpX04LvSpZ
	bY57r00YemQbcdHF/NR5B
X-Google-Smtp-Source: AGHT+IEPC6d8swlby3S1OQslf5+BbITZ5AceSb4A6HAGeKdbNUd8lbpz3k4h1GkKJqNmn5vb4qFvhw==
X-Received: by 2002:a05:6000:98a:b0:3a6:d95e:f39d with SMTP id ffacd0b85a97d-3a6f30ffb54mr16558f8f.4.1750865464350;
        Wed, 25 Jun 2025 08:31:04 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f296bsm4899180f8f.60.2025.06.25.08.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:31:02 -0700 (PDT)
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
Subject: [PATCH 3/6] arm64: dts: renesas: r9a09g077: Add SDHI nodes
Date: Wed, 25 Jun 2025 16:30:39 +0100
Message-ID: <20250625153042.159690-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index eec6fec19944..2949790e39a9 100644
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



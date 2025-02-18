Return-Path: <linux-renesas-soc+bounces-13258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7647CA39B9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 13:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC5FC175A8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F172417F2;
	Tue, 18 Feb 2025 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbo8e/s9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8292417C6;
	Tue, 18 Feb 2025 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879978; cv=none; b=CaFkE8dQA9o6K2yL2ds6cAEXLM400dVT120ro2I76QJn49DToKg3oMY0sL+f6Q8f4GVnxHbnZaBf6XeEtuAOX3dWd1c+5HMVMWMcFRS/1Rn+2KumRbY9mUZ53o7dHZvCqL8V11ozumm78bJ57fs61zZeFOw4/kIqpV/wbdgVg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879978; c=relaxed/simple;
	bh=ZeIe5WQNlMQ8EAqVbN7AtMBzZztpdjAN1WGi4SsaKJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JI9Rqny5egFkfNpM17VZlZLpBB8kGfR2xWu9L4yVnwaHXAnBF3OAO0J+X2wjObQyZZLDtfUM0K3d/UVr7zlAa6qaTRv4eWc2IrWypN21uPptGzXfi66okoYpJoTcqdrB9ldD683PZeJsctRNeofbKsR2+NFyxoLyIwodTZ3RyIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbo8e/s9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43998deed24so264735e9.2;
        Tue, 18 Feb 2025 03:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879975; x=1740484775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJwkMW+fR6PWnrXP7BmklxSTCrFBYNdKFnbyYQvG9uc=;
        b=cbo8e/s9N96ePHPPQfIXzge2CI87zZgkMpXQFDJEreZlVtPi8qrWJCqdpZcg/PPTds
         gVJXCZaMIg/UXztUu0epv9MLIT9s+VUCwNpfi0Vr0UZanQSk3G7vTjlal3azaCj0tSaw
         h/mYPQkrONaZ0DVNN/GC3Ig9NuuylDAJZGIrJbYSY8am54UMZV64pzNkBJd7alU1C9qJ
         +5knA2ZqtKOMYyxTrSAT7i9K/OufShyBVbHSjv3LRoECNyFmdnG6WVDiCJjjRagKZAcZ
         +ucQNgGEZEdtgi8mcrxgTCMu06vzL+jU9/GlZvfROKQkY8Ug2tXCtE/bkfZAPFXhvj4+
         r0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879975; x=1740484775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJwkMW+fR6PWnrXP7BmklxSTCrFBYNdKFnbyYQvG9uc=;
        b=RqqA+wgz4zZukElnnJbhghHOOacLn5ZJXD6ag26RuUqqkh/B1JYyKu7i+/xM3Ty4sY
         TkiNebpU0mZAxJmRvn86MWlF4EcT831zP8NOk5g17gfbX6n2+bvnupgD0oRc7Peck6Fs
         cW+V2lW/Qc1VaJJWWEWWwTvmsghYSJirJBQ82z/NzfRzMlGqiFsuhsIMx3rPuamvT6+h
         q5CU/T/Ija4lNBcri+sKLkyrRF7Q0zKd/Mhm4SWA3oJ515hAT1PLGdo+DGpPGZhKoSSB
         mJB5Mx7NFbVWxmfxw2ic6eREPDiyAhRmwl5eqteZbv2k/pt7DXes+vwnu+0Vs4xJSFoX
         XGLA==
X-Forwarded-Encrypted: i=1; AJvYcCUNAbqGBnzpUojK+/8ixIjiJh+zRSnMxq+k6G2rrjbdcQOU3Bp2GrpRTTQoeK/yTTd/W3d725hb0cE21GGY@vger.kernel.org, AJvYcCVMHMNseUcqihJv0CXvd2Ywq1fAgnlsu6CKxihz6kxdf5okptIqJGfufiR6E1Z6Y6AJzrRRz5uPVu5P@vger.kernel.org, AJvYcCWrMTVgngA2DHSTIOKe8+K91rJkQ7v9LzStHwrUJMVClfiNlmejAHFAzPfIhOzctMtMt5uSlXF0ydKEG4XuAGcDtIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJb6VFJln3b224RYgINIbtWBiR35uoxBleVEWxFXuyJs/8XAfH
	EIYdf9oPsLhljRNJZzwcixfCcGUfRUAhYJtBavHdZnqurO6s3GHe
X-Gm-Gg: ASbGncsNIMCeWZakVtdzyD9pKMfJXdvbVZj6hQjG/ftlz/7922//V1l/rpjTpdtgrqv
	a+EzDPIZX+u1/f6/dQAHU27bM0HOppWWhP5tNUbxl/hxQStfVsKEYPvdp6wtQvgnKVb0xGcAloM
	b0obd8h2BCx80GsiF+04JgKFHEu7xCQknQzfQJB+21TE7gxoBpPSI2heGvqq1P1eQ9EC1pIpkMU
	MDYT+EqLsUDWoQQT/8N/mVhRfZawlp4545RoP+yaG0+Ej3WSpgm0nrgqTplvyrs/SyFVOkB9Snq
	AGNNtCdBzTkfbXPtATqn9DoduEo65ZGtrLLu3NZhKGJq
X-Google-Smtp-Source: AGHT+IEjGEbBg8RaF8tIzRsJYk8CHuKfBdlmsd8Q4ZTgmqFEA6CyOAfWf3dQWOU1FeBi7IN7eMmTOw==
X-Received: by 2002:a05:600c:3b8c:b0:439:3e46:4b1c with SMTP id 5b1f17b1804b1-4396e6d7c2amr106215895e9.2.1739879974689;
        Tue, 18 Feb 2025 03:59:34 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395cf084d5sm123873255e9.1.2025.02.18.03.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:59:34 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
Date: Tue, 18 Feb 2025 11:59:21 +0000
Message-ID: <20250218115922.407816-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Mali-G31 GPU node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 5d4d999b450e..4d5baed02fda 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -105,6 +105,35 @@ L3_CA55: cache-controller-0 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-630000000 {
+			opp-hz = /bits/ 64 <630000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-315000000 {
+			opp-hz = /bits/ 64 <315000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-157500000 {
+			opp-hz = /bits/ 64 <157500000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-78750000 {
+			opp-hz = /bits/ 64 <78750000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-19687500 {
+			opp-hz = /bits/ 64 <19687500>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -585,6 +614,28 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		gpu: gpu@14850000 {
+			compatible = "renesas,r9a09g057-mali",
+				     "arm,mali-bifrost";
+			reg = <0x0 0x14850000 0x0 0x10000>;
+			interrupts = <GIC_SPI 884 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 883 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			clocks = <&cpg CPG_MOD 0xf0>,
+				 <&cpg CPG_MOD 0xf1>,
+				 <&cpg CPG_MOD 0xf2>;
+			clock-names = "gpu", "bus", "bus_ace";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdd>,
+				 <&cpg 0xde>,
+				 <&cpg 0xdf>;
+			reset-names = "rst", "axi_rst", "ace_rst";
+			operating-points-v2 = <&gpu_opp_table>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@14900000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x14900000 0 0x20000>,
-- 
2.43.0



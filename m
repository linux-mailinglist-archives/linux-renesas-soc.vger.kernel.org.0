Return-Path: <linux-renesas-soc+bounces-8448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B62996277F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 225F41F25FDC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313E21891A5;
	Wed, 28 Aug 2024 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leUNCKAG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6882D178CC8;
	Wed, 28 Aug 2024 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848920; cv=none; b=XzhuX1FmsiiADnGjFq2KhDVJsapSNfmO0piI/29yjyONIPaPPknSKl5DegisQ1FU6OslR8LETO+zgbo0Xnw/NGE4RTs/y257RJkKU1+0POgtn0GAnSv5UIj3yVMJ26L/y8rIcY8PepEKD05Pkb+pAW3Ysp+7v0ppTOmme9RAUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848920; c=relaxed/simple;
	bh=YRxnFBhngyuk3jFOMpZtiHd6/Wayl5bSUop/VXJDg2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dzEu+fOf5xxdb5KnmKlb2k8EEVYI0vWyi8voW5ewG1e8vgUZCr9pqALc2YpcZEFa7reoWNlcF2Q7WySIcCMAZBEJWQmInTH/RnDy3+mOhhX+GVdJ/251tgDrKs6S0lADdEpInD0lQMBAPMF7jlaUxxYrruZC1vQ8677GztgPS8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leUNCKAG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4280bca3960so57479345e9.3;
        Wed, 28 Aug 2024 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848916; x=1725453716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+StZE5pis/kK+g+X250S6zm7239Jz6TmOuz0Fq+lLs=;
        b=leUNCKAG5JxRO5cEHR+KohWN7Ia4UaXVTmzw4uD+iKYQ0ZFtOjfRSHPuhIiahuWEWP
         zmtEO4CHKJ1pTnKd7HcZpYYiIErI0lXPayU7fAzJ0MgmKgw7HmSw6BCVIWW2u1jGJlfc
         vDXjpUBWxp+nzydZdujnAPdjgQPvU17C4QVlqU6gL+PekMDjatyqZW8SimkyJqpxt9g6
         xjTtlbKUa0RTqgs+/cn7d8Yt0kyDaWgk2SUjj/t52PCt37ePKgM+3aZurmd6FtM5P+Sf
         8Vz4qnZ7ujYMvI+nBMbnjPkbhTcUsVrR0LR6ym34dC7pAQbDyyCqpqlQMOmhETtwKpnF
         s3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848916; x=1725453716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+StZE5pis/kK+g+X250S6zm7239Jz6TmOuz0Fq+lLs=;
        b=t0cqjnoOZ+gs8z2Q3YLmbKzZf1IoE1a++LfbRDoq2BjuF7JPfEn9G0++q6fFEZ5Ana
         VQ264WjYxxa3jrJU+RPY3twbdPT8VjFJJwBXgJnHhnYnBGt6XOEiJ8SfFLfBz4Th6sZn
         sAql5ytQgbowFWruHHSctULMorqHjfm2WfEgYMGM0cBunD3lF6EatPwwnH7qd/K3LL5a
         JgzuzmAIUOM58bc2/05+PeHfojJxuNDENN+sujAAyu113fnZWwr7YGAMDBkL+NH5k1d1
         gcHHy7WxwH3IAl9m4O7qQWiXYV1JMFFtCj+B1ONRZcuIJCMroBOhC3r3+9uR7RRLEW3a
         HQbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqE7kSsQzlSAuZWBdWxR7MmTBDMYpL7I8oD/0OuDOUsiaAAHWwXRD9SC+4r2paUm/vPI/AADevSNBw@vger.kernel.org, AJvYcCX8G3l3M2nx1VC9+pqnrnmfsUv56FfphxeKwVl7BzhQG+OJFECpSQneeVkqLW8Nr9YxYFnUKFSSxDzwrH8K@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgd+IfJmBrGsF2IEqtHYKQ0XzFQRX3XvcWvv9J/nGpYiiwvRNB
	bHZPQpYQAjrIBN3GElK5zHbEbvP6KIjWplOOkETsnZ8j9IfOXkei
X-Google-Smtp-Source: AGHT+IEL7FojTNvK1V5TgRpT3/Vxq13UvKnysBz2G4V+LIJSQQrFT1gHV+bVYv1Tqhs16nAhOYWtfQ==
X-Received: by 2002:a05:600c:5647:b0:42a:a6d2:328b with SMTP id 5b1f17b1804b1-42acc9fe1a4mr101441585e9.30.1724848915514;
        Wed, 28 Aug 2024 05:41:55 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:54 -0700 (PDT)
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
Subject: [PATCH v4 7/9] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
Date: Wed, 28 Aug 2024 13:41:32 +0100
Message-Id: <20240828124134.188864-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- Used hexadecimal values for clocks and resets
- Sorted nodes based on nodes index

v2->v3
- Grouped WDT nodes

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 7e243c127ec2..4071deabae42 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -201,6 +201,50 @@ ostm7: timer@12c03000 {
 			status = "disabled";
 		};
 
+		wdt0: watchdog@11c00400 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x11c00400 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x4b>,
+				 <&cpg CPG_MOD 0x4c>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x75>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt1: watchdog@14400000 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x14400000 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x4d>,
+				 <&cpg CPG_MOD 0x4e>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x76>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt2: watchdog@13000000 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x13000000 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x4f>,
+				 <&cpg CPG_MOD 0x50>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x77>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		wdt3: watchdog@13000400 {
+			compatible = "renesas,r9a09g057-wdt";
+			reg = <0 0x13000400 0 0x400>;
+			clocks = <&cpg CPG_MOD 0x51>,
+				 <&cpg CPG_MOD 0x52>;
+			clock-names = "pclk", "oscclk";
+			resets = <&cpg 0x78>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@14400400 {
 			compatible = "renesas,riic-r9a09g057";
 			reg = <0 0x14400400 0 0x400>;
-- 
2.34.1



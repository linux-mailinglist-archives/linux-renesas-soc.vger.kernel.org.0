Return-Path: <linux-renesas-soc+bounces-31824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGl2KUpS82lOzgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:59:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E14A3117
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF8EF30A2DDC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0F9413256;
	Thu, 30 Apr 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="andrU4lK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960E40F8D5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553633; cv=none; b=cu4ONFAZXWH61TWAB7n/DbAr07hE9x/vbaw130xPoUH/0vscbu9dL4ZG2dcDkAtZbnjIsAmjjK/E8M9LKOc+Xp+MCrerDVJRxlAX/R+NzLcqjy89UDQZr/HKzl4+FR04rOu6eZ87jmc7VlnMeX2bc1iFuiKEDxFmM2lISFL+XSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553633; c=relaxed/simple;
	bh=jfVeofbM4FsGBMB4nS41bLeAnHwm8WLMQmt6Bs/9Fgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYGUgh/OtDt2KQ3rPNe8h/7uizi1jhyFFVwvbCi7Hmc3tGkoo9flhqpl+cuAGx9PLxIcOeZ41BPK7ujz/2HNQryZt9HfQCIQlYq0Mv5WkYrrgYX1ICfiToo32apcgQ3WqdYFeqR1GxkVoNpxIxSYMxLW2k2mj6t4D693bR1UYv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=andrU4lK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44261378651so1328966f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553628; x=1778158428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTjc6L78xC21KmVadoJAJO3a31crXYGBNgBY8pS3owE=;
        b=andrU4lK8FSutf+BM6AIdFU/S+2zMtWmNzFhWWhoV2rmxu0yeMomfPXQSQr81BLTW5
         JSaIeGvyx5MX6rdxVCQrWujSPfdhzPfikUaOyIcJoK+a9YVWUz+CotPBq9lTcWEbwcT4
         lwrGZQSrHQpEtI2LKkBzeACTpouAvFuBp5sN36pJO0EvpSQTuBeDNdMoGoEoan+53kba
         c89XU33hf4EMMtU18S3XldsH200CGIeYSbUPuKb5iHzxS1vRreT+XqQoxPWRzieO28jb
         Yz4latfVWTLAVRp2iXeL4HXXcLB6Qbyvu1dG1YDyJDwWpp5zzeCc+4eO3NhoLGunxizt
         xbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553628; x=1778158428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gTjc6L78xC21KmVadoJAJO3a31crXYGBNgBY8pS3owE=;
        b=lNpBb59tUmbR/h2ZFCZTElxtz2RpBijGLgLdM6x6NEroxYd05bzLaPfswBRCLwOXof
         8ZVbdT2gv6k0DJRgUfkkGfnhXhisY6KV5WOWaRTmSWGCAYpQz0kmLgGKnnR9sVBrcST1
         2OONMdpt9szWG0RNPPaIyaBemrqpK2HaL6+qmmPEXE3YBTt6s3OtrsF42NnXDlzU87S7
         hdHU0cjoaS16qPZofSRzgUCdvMVam8IFx+44H6xCq9V2Xmp0d7CxEz2voC4jFvCD71SN
         aL87rgm5mmkjgfHNtlCHX/u+inHo2RdwM3MBWp42zPRmRU3gKiu1kHvtTe3IVuPYFJ3C
         UEGA==
X-Forwarded-Encrypted: i=1; AFNElJ+68Uv9wx3yizcv+dwzQYJJw9eydnx0RLJuzZFPwjUT52eiYHBfAm4yKcPOxQ//pjOqEQ1/sD9OFFXG84V6C5+BKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyh+fImmmvzKkwjxwGR53BOjkdFTRlkGL77hidgnsGw2/tYPvg
	YVmcpd3UW7/vRoNnuvvQCH5MSdhtjNe9p7M2KtPAPmiwYjsLvMHoHcQns/58qQ==
X-Gm-Gg: AeBDietamGrTkziguOXXGUE3w8X+PqlCCJtSJmk5TR4GB5gcSQvYyg56SC6YxT3PJDz
	4vom7QtNd0BA8Felu7KOnAC5zzriTEbXD5XF+gS+TsVakrnSbKUJ38lfWR0xf3vaN4OMHjIDrkm
	2rtkSIFqSwhg9LfnpudZke6GWudgrlbqSovFtYPqNdxnbLy6XL/9tbKahXVQ9w7N4o6ElZt8Njg
	sOreab4UJlehjzNZ6mFhUtBkwrD2tiO+M8srbiy1Ef1nx9tphJk/Ak2wAFOacQedbn69GBBzeP5
	fK/n5CwboslGpf8mn/6Ot/4ZrZd3kvLK9dKH7FrNM1M1761nbbY9nNfkc8TD2OxZdwKVLTkf+Hd
	7zxaA10SqXAkAmoRc4gko7uMpGBYkx2sgpZ/Qg2HKtx5/xEJVwZDxwpyc3vMySjAhlEIZda0SA9
	nz+TTwePrCGLXiXcqyAxjttnUjhm9+1e6EzgISaW4=
X-Received: by 2002:a05:600c:3e8e:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a86069e04mr35589725e9.9.1777553628360;
        Thu, 30 Apr 2026 05:53:48 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:48 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 1/6] arm64: dts: renesas: r9a08g046: Add OPP table
Date: Thu, 30 Apr 2026 13:53:05 +0100
Message-ID: <20260430125342.439755-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 030E14A3117
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-31824-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.434];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.100:email,bp.renesas.com:mid,renesas.com:email,0.0.0.200:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.0.1.44:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add OPP table for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 236a675231e5..e52498b3a745 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -14,6 +14,42 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+
+		opp-37500000 {
+			opp-hz = /bits/ 64 <37500000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <300000>;
+			opp-suspend;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -24,6 +60,8 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC0>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@100 {
@@ -32,6 +70,8 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC1>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@200 {
@@ -40,6 +80,8 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC2>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@300 {
@@ -48,6 +90,8 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			next-level-cache = <&L3_CA55>;
 			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A08G046_CLK_IC3>;
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		L3_CA55: cache-controller-0 {
-- 
2.43.0



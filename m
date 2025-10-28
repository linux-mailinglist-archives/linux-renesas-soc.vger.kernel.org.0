Return-Path: <linux-renesas-soc+bounces-23792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E9C1657D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 18:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99B2D505BED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 17:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DD333CEA7;
	Tue, 28 Oct 2025 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5RjJpfA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BBC34E772
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 17:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674121; cv=none; b=FYsFRWtLY/VGcMdKw1JnA4j+HiZa0ZMwcb1BzyitzNDE2yLIu41aWqj5+MPSv+Uq2WpKrljLklgJivetE15cd+5QEaY2qEMjXiOcR6RjCKu0E6cLew5uZPFf98CsJCa8QYTkxrJ6Syhb5eegISg9aM486ooNF2JJlVdUuPGy6Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674121; c=relaxed/simple;
	bh=sk58oMsvqvthp8Sb3XNcmu+ux8iLDsOLB3U0EqxlW+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqLUCaxH7mpC+N2o+iMLkxbF/IqNpenipvBcul9U4RIqnr7rT2hhBBj1+JvC1e+jnHAlMBLJ7F05KbCe2o4yBVsj7Dx3HY6VvDZO4s6eOe/oWUQ48HPRF6g1gNxWgq8Q4bOdpjNk9qWkgB64EUTib1wY7dz/rnIKBs+SPQmOPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5RjJpfA; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b553412a19bso4105587a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 10:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761674119; x=1762278919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHxfmdeCFW0aCq5x00keTOMAkOcoFT2JLV5G6kLYawM=;
        b=k5RjJpfAA+VrI0hnF5DzvOQEUm7po/aE93Ek+zjvQ8RAzuS+HOxl5nyN/EuBiYHH0j
         9Vxi++qffsTJjXm0FyAZ3K6nliJ42nB5fD9wzWnms/yEo6ZS71V/W3HV86Ockc5cRAlp
         0lxAcL9fd1AjYpl4e97PQQlrGtSgJNKgJmB4QISd4zHk8faGfeNFlIHOtxYTF8vo3hOL
         nUkV93urAV/swopsTePIAOehrKxrTU6s+GGX6NX0sFPi3Dr80LV71uvwxetSiA3mpvOZ
         CF0Z+2dD0pYe53ZWSS6ui7eVTnuuO5swTwhdksgMb1JtxaDAE5fbR7rPmD6UDt5kQ4jF
         Dr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674119; x=1762278919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHxfmdeCFW0aCq5x00keTOMAkOcoFT2JLV5G6kLYawM=;
        b=SOqrpjEs8YE2+5eY4gDO0V0xHxvTSAzOn/Wp+NKAVA+1m7Aeq7ZooT/9HrELlxWUJG
         LmS9eJEEo+uiBI82YtfJIXDifrAZ9Fk7WxB95bnZXIQCJKCB7OcMjj7HAyLGzEzeOea2
         hHAEKqpInVUKm86nL3QSBf87rqx7KYYykbZLAL1KJYdrZqS/3lwfnAxERq5c128wuE3t
         ka84ud23JaQvaWcU3XiqkqJcEAUp5LKVtVemzUOW1C54rgiqq01kTHQXWnzaQFkWHaJl
         2SJ4guL5ncCxAJiVXcvuHcHftj7mZj4djg2jweYmV1p6iiyhQbgb2Cn5Lob1jAaD2Bos
         WufA==
X-Gm-Message-State: AOJu0Yxi7Y5jKFZmLninAIbFhvGDeGmIo2WMQVjr9Ier5ly8gBPZzWx3
	s6f4vDXCG7bHDkUQh+Vm0OIiQLLIsGb9uj3gm0XXX8uVAksSUOjQxY58
X-Gm-Gg: ASbGncvXais6RloXJr/LeKOgp85QPAA1pdYMfW6vns+jcTutOVVrdJcVz5Wsy9nIuI8
	zjEQnJBDRQ4q5TkYy06c0oIg5R3cIkba1uKXqRPVP+L6g+EwKVPnT8OewGKA+K+DUUDR9Hz5XhP
	tnI90j3srBmgCJ0sMa6Q2qE8OoYZMVpGWVw8Soc70uB2F4DigeWVuhkgzwqtMecTg1WZZ0WH+FL
	ZE6RroyHKmn/LQlP1Au1VGVkBN6shWTfW2gECPvEKSHGc2fXnToqi/utqp/D/yIS+SymRWWC5ec
	7gZy4kt4tjfa+sX6G8luy8nwtcFfwdOY1gE1eZ++ixOQvzDd3NhoTp8Xrzq/gObK7RKL0ZTg7y3
	lwwgY1Acot1bDqRA/LJvf4cs2m0UFYzQANClVBcU+BIQ1rcP9LPR4pnpCQ+Iqg/g+bLhi0tIRaP
	IfW1a3v/KqEI18jY2ldWxlQA==
X-Google-Smtp-Source: AGHT+IE8fi7wgchyIC2rRpsiOwRv/Y9Zy79HUMma+Z/tBt8eFg9esKKv8OGA2Wlc6IDn+6DYsFdD+w==
X-Received: by 2002:a17:902:cf0e:b0:276:305b:14a7 with SMTP id d9443c01a7336-294deec896fmr406115ad.33.1761674118818;
        Tue, 28 Oct 2025 10:55:18 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3410sm125713005ad.8.2025.10.28.10.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:55:18 -0700 (PDT)
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
Subject: [PATCH v2 2/5] arm64: dts: renesas: r9a09g087: Add ETHSS node
Date: Tue, 28 Oct 2025 17:54:55 +0000
Message-ID: <20251028175458.1037397-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add an Ethernet Switch Subsystem (ETHSS) device node to the RZ/N2H
(R9A09G087) SoC. The ETHSS IP block is responsible for handling MII
pass-through or conversion to RMII/RGMII.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2 changes:
- No changes.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 3ece794fb0a7..fe0087a7d4b4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -270,6 +270,43 @@ i2c2: i2c@81008000 {
 			status = "disabled";
 		};
 
+		ethss: ethss@80110000 {
+			compatible = "renesas,r9a09g087-miic", "renesas,r9a09g077-miic";
+			reg =  <0 0x80110000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G087_ETCLKE>,
+				 <&cpg CPG_CORE R9A09G087_ETCLKB>,
+				 <&cpg CPG_CORE R9A09G087_ETCLKD>,
+				 <&cpg CPG_MOD 403>;
+			clock-names = "mii_ref", "rgmii_ref", "rmii_ref", "hclk";
+			resets = <&cpg 405>, <&cpg 406>;
+			reset-names = "rst", "crst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mii_conv0: mii-conv@0 {
+				reg = <0>;
+				status = "disabled";
+			};
+
+			mii_conv1: mii-conv@1 {
+				reg = <1>;
+				status = "disabled";
+			};
+
+			mii_conv2: mii-conv@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			mii_conv3: mii-conv@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+		};
+
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
 			reg = <0 0x80280000 0 0x1000>,
-- 
2.43.0



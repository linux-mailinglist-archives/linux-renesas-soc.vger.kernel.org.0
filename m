Return-Path: <linux-renesas-soc+bounces-23185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA782BE561B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 22:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7574F1AA08D6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 20:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBC02DCF51;
	Thu, 16 Oct 2025 20:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrTqTzKU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0102DCF41
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760646350; cv=none; b=Bwm1o/rTnI7SYhK1NYC7pDw0y8ExO7UWeAGcugIWJz6YupXMoktH2ixbVoCQfWCdq3m0y3xE6E5fbES6BdKA2g0t2M9azj7Pb53NdHFO3kDxQKdSYJ1uQxDLB9Jng0Wv4Rz6njV0X2HiU3Pe3gv1KwO3ZWqu3P1AsyhLup1sRqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760646350; c=relaxed/simple;
	bh=4MorCO59o4ngT3WTImAyOmAQefEGE/Yx7a5tOnd1kGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtmS9pZhxleCTlEeY7h4Mw61pmfC7ZAqoaIhWUDFud/TNil85s/VMmchFCTY2LjyRiG3Q1Hr0UDKiO13FQrSFXcUJ4Z9yGXxcCcx+qDc8ulBCrYa7vDwGJY5XVGBPVUXYSYaJ7K7jcE8Gy76fL52cdflz0Tw02owU+vcxwXHxrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CrTqTzKU; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b632a6b9effso751187a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760646348; x=1761251148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoRC8rzlOUghjW1nZB0Ysh1s7K2vI38CKjf2YVLdEpk=;
        b=CrTqTzKUqyrRvB90hUC5edlQS9trliF9EWavaGIkxezk7tnM8Ot5Nm+7ZzNw4nrJmE
         0WXt+nnvWW5EmM2OjjFF156X8qj0+FKEoJcCjM+yCbzz8wJKkE7dBsMQ/1Pp8HvTFcur
         +j4Ypq6pWan/CeInJamcXuFuI0nhwSLHzlRr0nZOz3ucZej3Bh3hdKCuyp4pwVwa7UKI
         x2MlLGKOeFp9iqWLkapqUhSGt2aG2k7PybQOt27+JlBVnHXGzzDzliJoicbLDZMXtF0B
         7n1niCa2aAUca+axeBP+lYq8O4GOAYFOKcq1WullApg42ZbVGuoMnhGnC9677rXKI5Hz
         MdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760646348; x=1761251148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoRC8rzlOUghjW1nZB0Ysh1s7K2vI38CKjf2YVLdEpk=;
        b=CyPG7but7V/LDWEWtaeNzGTbrrV1bhFiGH7KHtPiuRy3+0V6vqkXqURpr7a9SbnZIi
         kIdfhNNyu+D8pz7JQA7j+a2CsLFnxtpOdO+3IKZ/KJpzbFGWOoY+Mt2iUFAqSaWIthXB
         /gBE5iQVZ9UupxCl+dO5genpq+rA2/8B09o1bN6TvWOA6JaScQWxN9lekArPUr78FXci
         IPHQhBSfdHXq4p+c7dVnvsK8zUzIlTFrwW+KqbDuQLlzU1G+0QiV0dGjZ8EJY+fS5djA
         x6BlGuzseK9I0/Bez/9Mbr4BrQQVbAXu4upVkaaE6oIzLvfZrbdHKFKhkwG92o99v427
         1skg==
X-Gm-Message-State: AOJu0Yyw4KkUAu8OzHbamQcDbsMPoMXm7CesUUPUJIqWyBGzs4rt1lFg
	KpYzTerxa1ginq4KXLdOCoC8Y/7G0H5/vOdQTwGZbiHuPhAq+HWeYKFA
X-Gm-Gg: ASbGnctLtGgmaw9Rg9Sy6Z/WZI2XibQ9pGTAaMNopsGIE6Ady6+is84sXPIRLS+J0S6
	pDxzJ/Wm7Np/jf/sR36KKXZS6rj66O5rdSeWMapVGcEaDojXagks7D9cVSfW3zn/BvxPKFvjL+p
	iwmSb//+KtmrYkvG8s7tjoUa055XnYGdZo97fY3GJBdbg3Mq5lHYSWoh7w9meECrrHPp7XVFiPu
	rlrpsK4HZDtf3aVHcmMX0gFXmYQy2jSMYwE0vqO3PRL3zBg/Hzi7UEJpJ2PiMgMh0kz5t3ndgLM
	mm+L9fkMcUun/+EKdmJug/8aUTKbmsL9710QBmP/zQU6xsn/Y+RobI9FNwxI7E+VAeqx7eFoivN
	NXX8owrep7+75QM/P0/WixvxsNhTuKmDq8ac1hGwAfMfg2jK8u+hwDq3MysGPgilIihFi8b8V1E
	7AwjwH9E0YVsMze+clVkTxLqklSrwDPwAc
X-Google-Smtp-Source: AGHT+IGU3Gnxzp4j9ETrO7y+Ta4C1JD8pRmYX7qSuu7CWNXyZOpSTIP3EnNE2PmrlvN4UF+sZNpcIw==
X-Received: by 2002:a17:902:f687:b0:290:79ac:a0c3 with SMTP id d9443c01a7336-290ca4f9a89mr15044565ad.23.1760646348049;
        Thu, 16 Oct 2025 13:25:48 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:a396:54ac:a48f:c314])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099af9131sm39577735ad.103.2025.10.16.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:25:47 -0700 (PDT)
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
Subject: [PATCH 1/5] arm64: dts: renesas: r9a09g077: Add ETHSS node
Date: Thu, 16 Oct 2025 21:21:25 +0100
Message-ID: <20251016202129.157614-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016202129.157614-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251016202129.157614-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add an Ethernet Switch Subsystem (ETHSS) device node to the RZ/T2H
(R9A09G077) SoC. The ETHSS IP block is responsible for handling MII
pass-through or conversion to RMII/RGMII.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 0086f7953cdc..e397dd262c76 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -270,6 +270,43 @@ i2c2: i2c@81008000 {
 			status = "disabled";
 		};
 
+		ethss: ethss@80110000 {
+			compatible = "renesas,r9a09g077-miic";
+			reg =  <0 0x80110000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G077_ETCLKE>,
+				 <&cpg CPG_CORE R9A09G077_ETCLKB>,
+				 <&cpg CPG_CORE R9A09G077_ETCLKD>,
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
 			compatible = "renesas,r9a09g077-cpg-mssr";
 			reg = <0 0x80280000 0 0x1000>,
-- 
2.43.0



Return-Path: <linux-renesas-soc+bounces-25392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7836C946AD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 19:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFBD54E2999
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 18:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E6B1FDE39;
	Sat, 29 Nov 2025 18:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePt7KMYK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED22624A06B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764442330; cv=none; b=WLe13CSvJkbMOYZU31daKB9lrhuls2v7Ll0d/ON4XS+APk0wkOxbfvC7ft3j+ntxwyXj4uR+fxBxK+YlAOaXWrZ4BS5rQ3fGH2GwMc93J92CQJpVdvmfeprK8OKxtne8XHQKFk/89b0nRVo9jHU2A1jI53+jahHU7g5jB7F09Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764442330; c=relaxed/simple;
	bh=IVPJc7Na4k+hEHVt472dSJ8HKyj4RuUPWPqoyBR2jZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYvv4zakqx4ykWtADWE5pCx+Bw5/e6FjXmhLjNt2t6utm6qiL+qh6qp0w6eCECAJcC/HwV8LhUwKSowXRDZnvIw6488J5kkhthNfsR3W7Fj0qIhZVxbSlpDVLt6gN9Tgll+mfhCILphW6z0sNGsGDQ/227lDHM/hNmliPw5FCkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePt7KMYK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42e2d5e119fso94724f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 10:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764442327; x=1765047127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPyj12J0dlbZ0LqiMOPkzK41fgfllhho0ny7pa5wjS4=;
        b=ePt7KMYKiMkEt9TOFhQEe57bihnW+2X1h4L6DBdtBBXarONlhbWjiikmDX27bNeBGS
         srpLd0m70anNl58mIdOMFncIJ25ts0dsy0JWeO7txR8p1YX6Bg5NK+u/WQH0L0mOxRj1
         d2oQ8Ii9/TnK3nCVi5C3geNFObRZNlKdOcfjz/QbOepWCBJSlbYdduXap46bXEzxCKSL
         FMuLrS92KFRpi7OmR5pXr0cfRbO7laZlQSq6TxNcH3uBsoaNGF7RyHDkHTThPEvIvFJt
         ZHpPsV1jc/lTgYUNMeJNQTgJ6gOFVhqEt757d6WCOMNagNTgrU/DdksWnKJwZc7Vp29L
         Xw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764442327; x=1765047127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zPyj12J0dlbZ0LqiMOPkzK41fgfllhho0ny7pa5wjS4=;
        b=Qs+dGgYLtritEBpQPb9XlkSmhdz0WrRxeh0o39A9HpaGQqP19q+R67mzURGYiJmcUm
         07oHr2GGo472vGRq4TFc8LQFJwJbeTi9tTfpJCeYQ0BPCfZpJ/gP2l91BxpkIIh3RN9A
         hQNVj0/vMdVOunT/BsyUpOzj47wsdxQxrZbgWLDHyp+ALvprhzpIx+TU+1/gIJMg4k3K
         IkUnX+Z34sO55nU9LNm2VvOOxvN90wLcalSu6RhYHSxB1wYOT0FlZI2sLCJuOi5PgmMo
         kPk0+HCuBKTarAxjOvksymiWZGeujKlrQYOmpu4mJFP/REoUfHpeqAr9zW+JEHF1BJLY
         lf1A==
X-Forwarded-Encrypted: i=1; AJvYcCWsjejSFONUl5vUM3dyV0Rx52lYuwTzRXcN0HZaKvaxx0IaBHAcHVmL5NmklGTbjrJKS+w2uq5p5BYo2Qwi2rZlTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1P8O1LTr0uC1lySrO3buoonVMcbSPm5u8SkeI0C5e4nANgki6
	Rk+01ABNXRwUXMeYGVLrCUlyqkQ8Vc0e7irtZL4hTmK3emYSBsjLSkhh
X-Gm-Gg: ASbGncv02HuSm7z6RTkTcFJBHS7EnfSYISzzOVzPSNCeDMGJZzgOb6e7q5Im6mKc2iY
	aL3q80EcOTNnpdN6mQaRhWqAcjV3qiJM4j3EW88PO4dMmgCvN2TGwv2HF792SkGHxdMW9bpL9MB
	SP9v+YF32CWlwy/swLOVnLNLpuTddj5pv0a6Xh++uNvX7zJXvNXWJMPtasZih3UsBeGXyINJQE4
	+vwzI2Fv9PON2YGFZWWkDyHaX+SRkLluroqKsLB/Gnc0mhBUiWU1ESDnDvcTZMbtthNxARDA5q2
	EEjmmufleXlYgzCOZK824YMfBG3m0/vMgcJR23u/+td3s6TOaCo8hZhZ1jT2dP/83G+cjF32y3C
	LPEthr9h7gFio2EV9w/f4rmv8iNIa1DkOrcxo8v3Pz9El9smiCB5mM2QjMkb75CDJNibOLGMJhP
	+X5jY5pi35iOw1xIJ+siFFJuz8ea45sJ6UFxbv7uY7/7f4RMTl8bDlb/t0BeWnz8gbE6+8zwp0z
	cU/RnhSgCSh7Mam9ivADdY61tc=
X-Google-Smtp-Source: AGHT+IH+FCSNNOvpsqYoqDcvx/cgYbFitbnxpcC7BGBBqaf0NsYNEyr6ZkdYBvzchc0ggfP9bzUAPg==
X-Received: by 2002:a5d:5d10:0:b0:42b:496e:517c with SMTP id ffacd0b85a97d-42cc1ac9146mr33979128f8f.13.1764442327110;
        Sat, 29 Nov 2025 10:52:07 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d613esm17442067f8f.11.2025.11.29.10.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 10:52:06 -0800 (PST)
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
Subject: [PATCH v2 2/4] arm64: dts: renesas: renesas-smarc2: Move aliases to board DTS
Date: Sat, 29 Nov 2025 18:51:57 +0000
Message-ID: <20251129185203.380002-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
References: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

SMARC2 board dtsi is common for multiple SoCs. So Move aliases
to board DTS as SoC may have different IPs for a given alias.
eg: RZ/G3S does not have RSCI interface.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 805c0f67b70d..50e075745474 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -35,6 +35,12 @@ / {
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
 		     "renesas,r9a09g047e57", "renesas,r9a09g047";
 
+	aliases {
+		i2c0 = &i2c0;
+		serial3 = &scif0;
+		mmc1 = &sdhi1;
+	};
+
 	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		compatible = "regulator-gpio";
 		regulator-name = "SD1_PVDD";
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 8b3765b8267d..a6e8eb730096 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -37,12 +37,6 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
-	aliases {
-		i2c0 = &i2c0;
-		serial3 = &scif0;
-		mmc1 = &sdhi1;
-	};
-
 	can_transceiver0: can-phy0 {
 		compatible = "ti,tcan1042";
 		#phy-cells = <0>;
-- 
2.43.0



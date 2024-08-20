Return-Path: <linux-renesas-soc+bounces-7955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E7395842F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 12:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E0731C20D86
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 10:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEB218FDAF;
	Tue, 20 Aug 2024 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fpOt9+iM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF518FC89
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 10:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149190; cv=none; b=hTpE7YVWZgZN1ZUfT3OT9K9yhA1K0epVOttrRMqt7hmgapVPCtXv7L6tHIC4N8L1z6Y8gPyjWtQ1O5GDm3mpLBR9MlE27dF3oZ2jN2m3jJr+SWgT2ajVqfSQ4x//igomDVpFlvsObCK12YmF87pR7iPhA3WJETF3mo3W+EXbgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149190; c=relaxed/simple;
	bh=/tKUzOHrRt266Tu45Ds7SUJPkjzc5fK4AjYP3mwcytU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lenGjjgV6igOTvNWzA9JXnY+Hv7Ju0S9iJgVcDGQawQIBLnXw23RAwwdfneUW+ukNDlqW2OT4vlB6heiXBFu73uMXV+aZ/kjXuinbUxyHzL+3Gdd0O9FQrMRN311u5wHITyw3+v/jwNRqsB9c/fIOAottBvem6JdM7XieOiTKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fpOt9+iM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-371b015572cso2297673f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 03:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724149187; x=1724753987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBK2n6/pFj/ILXvmSt1CdVdmwT9MRszPiHjEVvASYLo=;
        b=fpOt9+iM184UDLNogONTc0yYH4D3mA3PvH0xS4GwinBQmIHiajeq1RH8+EAzVbE9cO
         zgb4UkoqeHrRwl0gIkMW+siHWmU4OEyTZ1LaY8xIytGySFooGUuJVwIyARnXnLACQFDV
         lNJ3aXuZkHTMEHTfV3GskoiPr0T5NlXCIX70AUESMlC45RqI7mD0Z6NK6UfFKuZo2UT8
         NqKK7A9QghRDl5TVjkFk9YsJ5S8rgMSr0lmAqVtbDPH/n76i30la3sOWWXiH6FIco4Dg
         EFVzN6Q6PAZSKT45AiPxJyklaThYvL6PG9egdsKz6MbScB3Qhqm3QiouW2Pq8TUvLkkC
         lQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149187; x=1724753987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBK2n6/pFj/ILXvmSt1CdVdmwT9MRszPiHjEVvASYLo=;
        b=OO/i+2BXCPpp5xkiw4eOtY8oqrwSFp24UjaKIHVSysswD1RQ5cfD03XfwA8/H0fjhH
         559flEBrgBkYvaa/0IlQ37u/ptK/4o8D0K3dLeCe9wvOmeURpAiczbVLUzV4R/szWTY2
         dK3SXoAlE2JNm/Da3aHRpTlq+ejhbP5u8xb4yrAKjggIlQZNxvt081NZ5JXYfA2Lv+Sr
         1MONVcqJwf8z5hxWObCjQ7P1LYJECPp7+SL7MuSnB/Wk4evxWSDpSAn7O+hpiJgEqgd2
         sjJd2y/hgn1cSFAMxpc6Azz/ZgfueNAPampws6iqkkEs+fyyGlxGVYycOWSAWOG+UqA/
         XZ7Q==
X-Gm-Message-State: AOJu0Yyn3Ex/BH9nv5XSWlkP7cUlcta24KtWDJNe+ZBE33US3gx4CsKL
	9pGbd5E4eCK4W0iZQNoXHVYnClIhh+n9k2HV6rRiEsqjHVXnMg1fK5U4uvBpPLA=
X-Google-Smtp-Source: AGHT+IGOhXXhbrXYtNIqlBM6EFLynq9Nkm50wQEMf0Wrby599QYliScoeHDmNCsdfFrFuBUGx/PJKg==
X-Received: by 2002:a5d:43c7:0:b0:368:4c38:a668 with SMTP id ffacd0b85a97d-3719431566fmr11712818f8f.9.1724149186736;
        Tue, 20 Aug 2024 03:19:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839464ebsm734550066b.155.2024.08.20.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:19:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node
Date: Tue, 20 Aug 2024 13:19:18 +0300
Message-Id: <20240820101918.2384635-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable i2c1 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 8a3d302f1535..21bfa4e03972 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -32,6 +32,7 @@ / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
 
 	aliases {
+		i2c1 = &i2c1;
 		mmc0 = &sdhi0;
 #if SW_CONFIG3 == SW_OFF
 		mmc2 = &sdhi2;
@@ -150,6 +151,10 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&i2c1 {
+	status = "okay";
+};
+
 #if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
-- 
2.39.2



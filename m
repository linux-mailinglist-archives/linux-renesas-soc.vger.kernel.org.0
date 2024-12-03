Return-Path: <linux-renesas-soc+bounces-10847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D80109E1B15
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14375B62C82
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F9F1EE02D;
	Tue,  3 Dec 2024 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="It1J3/+s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788641EE001
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224441; cv=none; b=h+kEXpWI+1kiWRsA5zC2mYeS02yFRAq0NLY0IqbxNV73cwyASvU2aLSN+fKyvRVEHTPJEUVb2LvqCdoKqVac4+PrlecDJ5sMP7G4Mxmuy5KJgTEcr1Mz5vh0JJ+HHRyAs+cUwR68rJ5+8+DGUSB3XtRHIjs1XcLNgZyAvXm3pZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224441; c=relaxed/simple;
	bh=hPzvAQBya4lMaHbeDMGEHEu0Sst46VpHxejcDLV1/YY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tiQxXpVIinJFTinnaPz7lX37WRDpUXzSyoNF5mLIicLk2m7BdlRYO4W74LasJMJM6o84cHAy7f/f+PBmdYSPj9h64aXY3JCWMorvgUSie2wbfdQj6rDW0BjwWbLwCyRu71tX9SNNQ18zEUANY4RKMHB1ucOyvgRA7ENP4MpYgzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=It1J3/+s; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso49489525e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 03:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224437; x=1733829237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuYmwt2mwWEd+Tu2KpQNpDTdmewly+5/W4Kvuhh8MtU=;
        b=It1J3/+s9eSfgOa8xL59iWVGv+bPplYPchi3wNeRX2rnrYbTkBFFvQtNbDfm1r41OG
         qgBVYtaUStEnB5rBO3lZRE2JNiqq/BrOXom1WDnToiQxwuP+th0L+oEeaEuz6BZtxlWQ
         GAqrdY74ufxHua152q5gx1h0V/u2yPDuoCozhjPXuFj5YxlLGafPWd1XrJyX7U3nezW5
         CTHDPFT1pdavJiWU2Khk+m6t02EbH9zCCuTWuAmUz4d7Zpo7VwRze2UVDrr6odo25X7T
         GnlaqtR4KRk7r2WiViqaEkG8rJDo49sD7BFGDvlsLGyOUvyr7SOnUSvF/zgT017NrMi5
         avig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224437; x=1733829237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vuYmwt2mwWEd+Tu2KpQNpDTdmewly+5/W4Kvuhh8MtU=;
        b=uv6/DyWVgj65HXEXTYuW2zPOEiVLBbg4S4UKktefo+JiogAEtX+FC0UcBQMMdKpY5X
         bJaxZk9aJyqPnzT+qQIfz2ZeGmWPYHvvLrCZgW4Gu/pKNqXQaBu2mHw8l0GHZqOjbmPV
         /mIanIgob4Nkp6K4boSCYxjq1P1p8qWdzxN/C1/zR1mP2HzJXh5ysy5qUbEtvI6F4cHx
         tQcMgNdaluLh2HQ/RKIMFTxAp/Ev1fT4/e3Gkfn2Cga1OLwCWhITnZJTh2K8eeRq92LW
         wD6YenGCyRbhLiliR6n2pzIftY9CRjzQ63pSelL6yPCkQDvDo8lt2PDdrYWCD5T9BJfd
         /8vA==
X-Forwarded-Encrypted: i=1; AJvYcCXiZZVKABnN6M0MsjvqTtwE1/s5hxSrl0GJhcy5EblLvWRZKzwCGV/5SyGq2FHFy7Kr1RuI61fVzimYJm/5oLC9cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8FXuS+e7pHfYoZJmp3mew/5nFikLESMaoNLthcOI7QrR5xbp
	Nb8PCdMNGZ/COqVBYAc90ScoP2QgIdlbvvJdRLBlH1hQzgbJAIQv/1fwL2EA7Mo=
X-Gm-Gg: ASbGnct6maGRZNhhTyWpGOiYQEeeP97N27ZNOFlV5JXLU2lc1BVDNpOKgYwrPMPs39D
	1NAjI04t7aKOQ7A2kJUHqBEE5Xk6j/AwodhkU8zACQ/RlZaH+ppHPwGT1Jg1a6X3pyxO9rRHxjs
	mf/v2YA45ZcEB1J9fOInrvCLXrKL/ZFKd83QrzGv4sCUGUJS8xaRGJ9KIZ3OF7or74aZ2IMsnj9
	CxOXAAUL746vNE5Vtu6/8zYJ/Sh7ykAAFcQx2CkRveos0CRT9Rk3J2/0ykyg/SjtWu3W7n8OLed
	C+gx
X-Google-Smtp-Source: AGHT+IHOuquR0Z2Y/9RwvEymwXXAAW6Jm4OPLCo5DQNmdYBocmhFqjdVsjkAP+GiCZweMjILCABwxQ==
X-Received: by 2002:a05:600c:4710:b0:434:a30b:5455 with SMTP id 5b1f17b1804b1-434d0a239c3mr16423245e9.27.1733224435487;
        Tue, 03 Dec 2024 03:13:55 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:55 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 14/14] arm64: dts: renesas: rzg3s-smarc-som: Enable ADC
Date: Tue,  3 Dec 2024 13:13:14 +0200
Message-Id: <20241203111314.2420473-15-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable ADC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 2ed01d391554..57ebdfc858eb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -94,6 +94,10 @@ vcc_sdhi2: regulator2 {
 	};
 };
 
+&adc {
+	status = "okay";
+};
+
 #if SW_CONFIG3 == SW_ON
 &eth0 {
 	pinctrl-0 = <&eth0_pins>;
-- 
2.39.2



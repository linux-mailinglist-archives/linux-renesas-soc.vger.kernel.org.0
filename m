Return-Path: <linux-renesas-soc+bounces-18542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D302AE0801
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2FA3BA9B2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 13:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285EA28B7EC;
	Thu, 19 Jun 2025 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6nQw+aV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F92B265281;
	Thu, 19 Jun 2025 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341347; cv=none; b=uQDSmw0CqRlU6fNQ/hQWaGQJL0euUWiqXu48KP8+fmSZqAMjjLlwjaQRnc6N+wUzNwEv1EOJA22/LhOYH7633Rh732j+2f13gdr2bjkNLUWS3Rk6z4baz2e8lRmCIGgE4exc9ZrblGsji3eLlGsCz34IuvK6WVUO5vdqTlumlxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341347; c=relaxed/simple;
	bh=AfbWJ1QYrWIdWUm+zqFmTAoWe/0daohRFtexuFQh1r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sC8uwXA7OOSxBHmU2YwFfRsv2bk/R5iH+3fvYViVtwCESgccHHCNSC9sD+26JnpEdlpdW5lwHOpG75MZaS/7q8ek3d6mnfzwQjNGsP/L/Eaguij2TCGgj7hbolCc2GZUJ3k5hZMESFlrbnSysUqHKS8GmYtBPIKFPjTv3zC0wNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6nQw+aV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441ab63a415so9942505e9.3;
        Thu, 19 Jun 2025 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750341344; x=1750946144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQqexivYz1tr5xz/PUZnOn/rIe1KSYBwakxl7hZDM5E=;
        b=F6nQw+aVvjZTXL8zdBbEPn7mcIV8axUAUSPU2TIeMd7jzh/kX0lyLt3u1u/x67fW38
         PEQreGInYBOY5Bdl2Z/lDoSSPco16jkZGFsuxxJYeIbUd45WPdjQbyQ5JkvjrGM9VS14
         lLQ+RUJks01Zraps2o3IsHNB7xHtmK8xZ4HZz63WD8/llskQ/u7NiuuKJ5X7Eszv+JJS
         UcrP9cmzSNyk9iYuZlFbUhyTds8AYQz+YO04TEJmqdFfsbzua/gv7/czESaG5ZNYgSND
         VK0Z7N415XLe3k7y6Ky9yOXQTTjnTIYWCZCwN8TcA+5Y1xWoBA50jKewPANhecM+m7Ij
         x5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341344; x=1750946144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQqexivYz1tr5xz/PUZnOn/rIe1KSYBwakxl7hZDM5E=;
        b=ofIxDG70lCKAXpPq+lVAJ/eR1gXb71KmEbTJ4Eh+xkzrDASrlsiqHpQYjtuHBmppWD
         LEn8iEPrktuwsEMruk4xsxZPDFDP4oCOuPnU4Vk2qoZNMn8llQeZOeONwsQvvp+lS2IE
         FUAum+Can/ja8wfsGTnwl9xrFg/rHl8enefynFQ+65LKhG1eim3Yu7voeFshrIRTw5Bt
         z5ruzo8pPxcsNmw0SWuV/nfERAou2bEsRNMeVY4n2BJO8gEizN/7MdtpG5ZXAicoHem+
         JkraGLLYIbxkaG7XW5rN/w0u9ZsI6KQU02lXGXwISyiRHU4BZMCq2Uupmb9hHQvECzTx
         Xr1g==
X-Forwarded-Encrypted: i=1; AJvYcCWcAZ0K4NBlZ9YZxQBhE1g5BUUvNVFQQoc9/hCtbJ+lgG9qfQ0RxHKi/CPqGVcD6PpiyUEbA1rrhZJp@vger.kernel.org, AJvYcCWq1j53OZheUCECwqQ3V/NsXCby5e9FreDRx28RvP/R3qjPrx4EaCUOnUzFHhJj7WoksMWTgB9n+9aB2Pn2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuazfk4N584kfvYl6XmhWK09VMbyR1/1tmyTDynySeVkhd0YRr
	QLoTESDKImrTMPOo863CkyS/GeoV1obyib4XUdiycCbKvaXXvcEMQ42A
X-Gm-Gg: ASbGncuNf/Kvfv28K4a128YqtOXeuUiJ1bpLwR/w+qVum8L1m46JQubbL4mrG4Y1aEB
	aBaU1vWEaZkTFsEciZ5iWU6ndnphkpNv4QmZChX5/LgET8j29Q1fN7r+6VrTo5JWZSs8Uj+bK/m
	zdKMKmz6DRHurueX+pH+Hdj58RkiDO83K9CdiqXlwqgwPlZxVFmhPZoW66LVz2zcGj0njs0yXjC
	GEddO8JIaY8LvW6rZg+STBQLxeynppGAaiYHZaFjUMysIqDWYkbLHsJT+MMJITTa7og9uhgyrEw
	CQQDUqSSGbqTDAqsu+FJJn0TBqlW5WpHNSUIin6ddNrXCYqbYpwTfxkk0PvDmBtoqRHvU5dtoq9
	L+XsR44bScuw=
X-Google-Smtp-Source: AGHT+IGH9Pj4/6blhD8mtiN59/Zsv7cF1w2rxk8sjqtgJ6oH48/rgcnL1PGtL2nKz+8So3i1JlsrsQ==
X-Received: by 2002:a05:6000:430c:b0:3a4:f787:9b58 with SMTP id ffacd0b85a97d-3a572e9c412mr18714877f8f.58.1750341343473;
        Thu, 19 Jun 2025 06:55:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:851f:e727:733c:ea8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm29454835e9.27.2025.06.19.06.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:55:42 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add RAA215300 PMIC
Date: Thu, 19 Jun 2025 14:55:38 +0100
Message-ID: <20250619135539.207828-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619135539.207828-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250619135539.207828-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the Renesas RAA215300 PMIC to the RZ/V2H EVK. The PMIC is
connected to I2C8 and uses a 32.768kHz fixed clock source (x6).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index dc80b40061e4..ef3683c8ebde 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -74,6 +74,13 @@ vqmmc_sdhi1: regulator-vccq-sdhi1 {
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
 	};
+
+	/* 32.768kHz crystal */
+	x6: x6-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
 };
 
 &audio_extal_clk {
@@ -169,6 +176,14 @@ &i2c8 {
 	clock-frequency = <400000>;
 
 	status = "okay";
+
+	raa215300: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x6>;
+		clock-names = "xin";
+	};
 };
 
 &mdio0 {
-- 
2.49.0



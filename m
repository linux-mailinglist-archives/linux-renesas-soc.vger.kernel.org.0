Return-Path: <linux-renesas-soc+bounces-20428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C608B239B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CBC76E4FC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22F8311C28;
	Tue, 12 Aug 2025 20:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggzVCvPY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ECC30E839;
	Tue, 12 Aug 2025 20:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029040; cv=none; b=RuNXWzegDOy13W2Ozwov6BMeUbg7sLYWo6UpGI9hwUMlc3OKuQxJcSmCUY/j+YEETlmfqzuxTEY3Zhv2R8MIDzdpS3Ej/4r4IF9i0v3NFMvRtx4FhkrdR8R9Q8XLyNRVHeJ/DVoCGoncDCUNHShr2VCMTkOiPFFKDt3MhScrBek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029040; c=relaxed/simple;
	bh=g4wiYGpgEmnUI/ZtPzN75HRHaSeFu5URHEItanMSWKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfuO2YbmMN1BPMjXBjkTVkE+sn6aap64LbA7hjx4RE0Y61X7EAS3vZzA1j+W138pvkXqpdpQbD5FJy/lrydO5Tj+BRMltvtt4ga4Al4c8p5TV3LbmhFjKQg/JrWOE8k5i/O4nmNb5akVZBxo12wxJWXiLm7UrlL8QZNtGnhbUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggzVCvPY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a15f1a073so1471785e9.0;
        Tue, 12 Aug 2025 13:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029037; x=1755633837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBCZaDfpZ2ZUd60TmU2YwnLWLLZle4M4zDO6fFB9zgc=;
        b=ggzVCvPYZsfUj7EjxUYYnW5qjnguDgO8JXEwWA5EImo4iWsj/UrLkkI7Yj7iLD3BZ5
         eVwDimxHVJuTxZ1M68BPeRKP223BBuuT8NTQyleMj9qjoaIMNc7xXj7sPO9/M7Or2EjS
         3Git5tnhMUsvTZkctdMjeXRXtELKBmxFeRGQbe35JF5Tm9wvGibK6Lcxb1RSyVA5e4ve
         LoFP/cscJLJMQigV+Fc/KgGDGiY3b9sX1xN5OWdBmQ/nqxpbzy6W9OnsgtuTWQrgPY1W
         MLxxjOfRToAreMHk2X96iME+1AqZUf+E1EmPyrf1N1vdcDnl6qjCW9Fe6DYumYvmarBL
         UtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029037; x=1755633837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBCZaDfpZ2ZUd60TmU2YwnLWLLZle4M4zDO6fFB9zgc=;
        b=p44KmbimMG1x73xxRj8RTcOxlFc8j9Ebpr0eNwOE7lJZ2yX5PoUS4BvzffxExIjvtG
         9rTbCkU+qqxN6fpA96V1vNjreIZjg8daRmnwR509ZWrchSuOW8WwoN/c3qaPEBIS/fth
         mJC4Sn15YCdKPVPf6uPQ1/dQDVI914DI7ijmI5BbhUnBRDb1Q9OFiQuOfT7HqNxND/5T
         27AdZ+OabKzKpDJgmLkM8Vd6t17ESncDNEQs5x+/BT/fwRGcm88EZ6EWHfzqBv1+ucgK
         x3nhFX6mUuUsF+XL/sGlzqXHpAxcCaSH0w5oRTo7K3tKgErb/W4LNR9piYqESi1A9ntz
         k5hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSPofcaCDdcGhctwLtyK72wdQVZMjf2ReRx1ozkl1w+rSxNkvLZ0lgd+yzsj8EGWDn3swknOGOyEKK@vger.kernel.org, AJvYcCVP2j0H1xBUGBeYc3GTd9fO2H0jSlEXRlZ4SCaysqff8qPBGGv41nvijk9sKaQv6L3XLsJTpFoSD3hICuEo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2zPpduxkm27Iyw7aNjE2jfTW/dIxNotOLFliz5pFvbZOsYQgT
	oK9FAD/y86905EEKI86ASOUo9Ea7xbH8N9HtPe6p9DJL8TIAzFJBmXrS
X-Gm-Gg: ASbGncvT5/Sv9awP0zqmUJfQ4tfw0yUyQWQqxVAkikK8Hu009qKFay1xPs8h/PgwUim
	mW0d1WPI53mzcQQvA0AhZ6+PX46sVSLxO0djqWu7ew2YOXwHM7o0j+s22rBJkhqKl2MPuhmNJt7
	qhsN0gtknFpIAQBXUM4G7lzdaG/uA/rA6PbVZ4Bm2zfBenw1aUewUs0wmP+g+nOKBXKM4J9hG5v
	tAcrBQxG9cehk7ZC+o577ytgthOd1aFi0r20yp/SnERx9LHN7FGI+plbsXNTKV40V+6XpKAYl40
	NhF/QmK8mtkU1AY1AKAn1LmU/Te1cLMloRSXdYIZ1taVS2G2ipvFtkiWpkgor0oOWkcA8lW429F
	qefX3DZqAvhHsBmb9ui/YkdERybtaRzbfya9PzHwQO1mOfqyuvS+lS7Tdv6sLtwSkIdyTOHwrwj
	pRAPeKFPlB
X-Google-Smtp-Source: AGHT+IHn0MyaYzIo7qxFe4tdGIMP1a//QibQSAdF+3CslGHQUfQe3mS8AeiUVUERQgAhXL7+nyleyA==
X-Received: by 2002:a05:600c:1c86:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-45a1607f069mr6877505e9.10.1755029037081;
        Tue, 12 Aug 2025 13:03:57 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:56 -0700 (PDT)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 10/13] arm64: dts: renesas: rzt2h-evk-common: Enable EEPROM on I2C0
Date: Tue, 12 Aug 2025 21:03:41 +0100
Message-ID: <20250812200344.3253781-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable support for the R1EX24016 EEPROM connected to I2C0 on the
Renesas RZ/T2H and RZ/N2H Evaluation Kits.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 127e96395f8e..1a3d28054bf7 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -23,6 +23,14 @@ &extal_clk {
 	clock-frequency = <25000000>;
 };
 
+&i2c0 {
+	eeprom: eeprom@50 {
+		compatible = "renesas,r1ex24016", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
 &pinctrl {
 	/*
 	 * SCI0 Pin Configuration:
-- 
2.50.1



Return-Path: <linux-renesas-soc+bounces-26112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1589ECDCFA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03C1D305BC47
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526B533F8CE;
	Wed, 24 Dec 2025 17:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cjr7F0Dk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4582D33BBAD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766598745; cv=none; b=uQAUCPUMpSYQqSfw8lW4oPKz/RaoDNIxJoEAb7Kjc4pAv02D/atNZjmu651G9AUxFbWicltjqcrRV7Dc1DNE8YWFlK3q0J3IqzcsZz5KiF2akcikqvboKpywjQideicM9kFRCAX+j5Qk/fcJuIurmJ3w9dadFDw2FDDQ3LSl8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766598745; c=relaxed/simple;
	bh=pOP7sffpPXBBP8XS2tEpqCAXnFXiTDSjJc0vKY9ZMCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxWgM2+ScybpHSwvdwTkmQEJ7Dwf0guqizB606V5Am68Rl7++1ir7xWsok4cuUIDCAFCrH/Cbk97ljLJdeNkl0/xKb55fBijJtCrk3mg9++Ol6eUwKMHNZkd1uUC+tL8m8TpIfOsnc6l3VutieioTIArHo33nDcLB2zkpRVyYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cjr7F0Dk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so35703535e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766598741; x=1767203541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsWjFifWQcsgT/v2qEEgr1GvVwjk6hGvN3mMH9mtFc4=;
        b=Cjr7F0DkAbBIcgOJt5f5cKpCi0jjdENy/XLT65sGN2GFX0HHBkFAx0Jarex1+pGUf5
         YJ8AG091utAl6rw6NkW2rXgvEGRDOx5dmspCaOkPtpCrsFuQqZMz/DT+W+BIHIvx4ArI
         Xb0nNN8b3MJGzln+oYSB0RSjxeXPaqgVlZGDylkod/SSs+PYUHIYhEAkQrsrmWiHK74/
         vNVOpKE87PxVrExI/Buq6C+O4znC9v3rrxjopcOUlf5IRYPcj+G8cUHB/V4RnbaU2Sox
         pyvxEuJW+lE0n1YKxL2AUpOMGFuv8ozmG7Yg5vXGHP6Zvau095zQc7bH+8j9XYO///bS
         5vuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766598741; x=1767203541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsWjFifWQcsgT/v2qEEgr1GvVwjk6hGvN3mMH9mtFc4=;
        b=g2G59OKwa3aEvuwdA3OCDoemQg4KadmEMGznDWz/8DbtyKBFaeeg0VDvZZnqFOqbG3
         yJf7BEgLaQQIS4OjsAerHfmgAvoLKl4syy0CjumHdvvH/yePgzWfwFtrYURunTf91zRt
         9Dwe//ClYQ5kPqWpEMLXfx8WtAumf6yKBBEKb6h3Qqr+CeW3kwIpzdBMMA4OB9a66SjH
         KhQ/bMZ2xOcYQIkRwT77CyvTXHGaJxdweguxBPDLk1YcZkwgZMlv85G1kQJfxHaipwIb
         2vHiiQ5BnyRR5hCfX/NNdflTqCsLYB3KXMJ8s13rXz/3Io2VFJPDGaRQwLcgt36S/c8V
         GI5A==
X-Forwarded-Encrypted: i=1; AJvYcCVklya+E38aC/YDVBLRaIrWcL5AZ+kQs6ewR3pEnWvzoM+tsaX0cNtj/h/X3GGPT5nhsySvQQfC0bLz3Rtj7Ecovg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVR5D/f4SvWw9ROejgloAzRBS2PZypVbfS/LSy9o1KmaAkcbHd
	rljBeMEYNH6nXaI6RNALfD+FXqE/YiZaXptrkmjB1XfUv5BDFGzwNOl1
X-Gm-Gg: AY/fxX57/J0Wq4E3xAU9DKrBY8PGh1E3L21lGkZ2IUa6hQ9ZQJGd7gdo2dpONWgYHT0
	UhOmZ4OrSy/qj5Jk23vYX9XOHaoULOzA3d2v7FgIY8a3HqYjelt0xn1sKfe4x6PzodYZ5qs1uZA
	5+2peD06eGkNwd7apo0R9IbHAvug9hqGVQfU/1WFCjeBuFg2swZWkT/NMtkS8RcX2KaEwrcUE9M
	pxGgnDMe69t7dHXcHfKW3B4qAh0chcWzOwi5llOyXtb10ROtGzSl9dM+hqLCnZ7U20SJu9sZ2q2
	yFKm10fnz7mRSgOoHgitnPYZZSLzvxBMrwiDg8zmo/AMd6dRPF33PJ32UfSQ0bgzhQwQkxZTqPE
	OuRKqRFxrU4jdY8seVZv+HpsnpXayP8bP3H2zPVPEYDJKHvOFgdeVtPKXJUQFcn+yf7+n9WA3+c
	9dGKel3PASpkAVFUBvCXtWl0LYpcvJPDrktORA32mti142YHvveb9eWSfChnyGbZcBOnZHRYCIF
	d94lGBZvvuywXy4TWPnZiwLQnZFIZkACrM=
X-Google-Smtp-Source: AGHT+IFKJQX4SbUcxclmhXncs6UXp3kWhC6qM9fe9GH0ZAUiP9St1bQpdW/PhuLI0D3rfo1ohchEgA==
X-Received: by 2002:a05:600c:46cb:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-47d1953b78cmr207555495e9.1.1766598741250;
        Wed, 24 Dec 2025 09:52:21 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a4651bsm140167935e9.7.2025.12.24.09.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:52:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/6] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable CANFD
Date: Wed, 24 Dec 2025 17:52:01 +0000
Message-ID: <20251224175204.3400062-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable CANFD channel 0, which is available on the CN55 connector.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index d1474f1bd523..e6d6012a5154 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -138,6 +138,16 @@ led-8 {
 	};
 };
 
+&canfd {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	channel0 {
+		status = "okay";
+	};
+};
+
 &i2c0 {
 	pinctrl-0 = <&i2c0_pins>;
 	pinctrl-names = "default";
@@ -166,6 +176,17 @@ &mdio2_phy {
 };
 
 &pinctrl {
+	/*
+	 * CAN0 Pin Configuration:
+	 *
+	 * SW7[1] OFF; SW7[2] ON - Use P24_4 as CANTX0.
+	 * SW7[3] OFF; SW7[4] ON - Use P24_3 as CANRX0.
+	 */
+	can0_pins: can0-pins {
+		pinmux = <RZT2H_PORT_PINMUX(24, 3, 0x19)>, /* CANRX0 */
+			 <RZT2H_PORT_PINMUX(24, 4, 0x19)>; /* CANTX0 */
+	};
+
 	/*
 	 * GMAC2 Pin Configuration:
 	 *
-- 
2.52.0



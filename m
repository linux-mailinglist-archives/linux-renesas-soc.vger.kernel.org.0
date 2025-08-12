Return-Path: <linux-renesas-soc+bounces-20426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3238B239AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD6EC7B7599
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3367630E828;
	Tue, 12 Aug 2025 20:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITbVYtdb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1E82D060B;
	Tue, 12 Aug 2025 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029038; cv=none; b=rzQEN2zvxJTs78AeGkwHCbcgW+e1x0YtF5675geKENFZVILBfpN8CczXoE9BGA/djt2+3qRvp2rLD2+b0lDefwhxtuYhGK1GriT1eiPuqwtNQvclP3L0oPJuECLO8Mkb3Zp0ewlm1kEoAV+xsub3UtFwJiXZPx7ZP/VYii1Dh6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029038; c=relaxed/simple;
	bh=Th8yCgtzsJD+qoJClZr2GxGvroSRhoA5ZjwuC1173VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XAXPuXGF9YpHH9l35UvZncaA4FvzytwKM62JRw1AiXjzTm/xPnoapjwuaAy/w+ohoW9PwIL38CwElvhsDJBxCy74OCK287/lGV//tI7PCGijbv700NErhWudDvgyUkrWOnEYVryBuG945mQzzsMqWztcQXR6XgtbBGdN5g7feHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITbVYtdb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-459ebb6bbdfso36653905e9.0;
        Tue, 12 Aug 2025 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029035; x=1755633835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDn1yNmkmXyZ0pfrkmD89he/utcNO4+B0nFH4A9K5W8=;
        b=ITbVYtdb2HpOEsB/+srEj1iRJWUTesdzsnTiBukKI6UfLdDPwzF7FwVF7eVesqCLeZ
         eaZTjb91y9PgJFNyjPKOh14O7r01WEDCHWeG1nmF6Om3kVAD0XaaTonSXvsw++I69KcL
         i8YXpF6U8Ly73QzF2fff25zZmA5z+r3BM7WdtCtexGunwpflmHVUomT2+Cu3m65ewBSW
         nweshFORYIEtJpkZSw6J6w++tC1E+NnbRwPeYKf/FdOFKcz8jP7C6dmVSplDAHi/T3xV
         EnYEY35gEnA+eYLfgkTggfpvnr9p/DErRzS2s3FvTcGEut7B+15CDeZfZpOeT5Wzv8uf
         6jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029035; x=1755633835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aDn1yNmkmXyZ0pfrkmD89he/utcNO4+B0nFH4A9K5W8=;
        b=lBtvntuGgrRh5UwZOLCNbPWeC2LcByFxlTDhAQFh8eWpKOLJhiaoFmPJdYzBPGe2KH
         QinojAAaAm+zqZ/CDtVEZU9/jnU55z8yXbqKcj6LPnw4sRhnMtaSy09A7OpDwdnV6ImL
         OfmlWA2H4CiH1PgJc6OpSShFIR29RmptRg08QjtIvZVercHrLN5qkLnyBxhRMA66VIPF
         3J+YixyaSuOJ97/ErV52cmQ+j/f7LOvIpU49dsMkaIWX3jKesUBj/5xFOkzMfaBTucyl
         YURwMs+oXK0Ngw0ETpFbzqpjI9Dvwq/Q7me+4ZxMgGZFu9YU3OrFMNXX3SnXxCtH49SP
         Zxjg==
X-Forwarded-Encrypted: i=1; AJvYcCUE4YLFJ9wVL6ceBm5aQ4fpUFzkRDYZPYuVPMl2O/I8LYkx91qCvW9znv6h0cBlQ52zDLn6egd2HVYHQS6Q@vger.kernel.org, AJvYcCUaBvsa2O3poWs20Hr/0TeOsAu8V9npErRshaCNhUbmOrIrt7f0kcBftiLk/jFqDBw5w+QbMK5Sb2uu@vger.kernel.org
X-Gm-Message-State: AOJu0YxtIOGwjnsniT8scHKb2KfGOHF10N35cmaIqr1IcMYQAlWJwhZq
	kbJMkV6zKUN9jWj7i+VJVERCGvZHYLo5ypg2WVFNnyTOc46e/77I9BoE
X-Gm-Gg: ASbGncvoymgHgyDwlEebdU8Jlmkqntm2+bDP0Dso6trzVJmjcWxP7wc5SUUu+wyeJHJ
	C8PC7/WZKQX8TA+KYGPiAZcuruHDPysYBfb36hUh/aomcwmdD6Y0iQLGzGRpIy/Wfn3mYKWCR20
	Cu0N+8dxStrKkHeQdjrB6kE8BWVf+t3jIko9+Bm53byPNz/K5C48zII5GezRMaMtKrSBYkj/r7f
	uTvmwYcsq5VoU61kKlUYFk3gkB8JQoit5g7S2qQXHXvll0CWJ4OEV23v58Bj073JKLtrSckDR2I
	bMz8qjCkYtS75+BSlC4CRjiT5GkvqUktjgmgMglhYbUraMfdWvOdbUk1fJOTJfWSheSUD0PcrmN
	AnCSsEK/KGatwWIM+cbVlN3nfCdU/VK7wvRd4i7aIk8v/8pNHSmZRR1QEhChGm4jxpB2N5usH7Y
	SP5QatVAcR
X-Google-Smtp-Source: AGHT+IFV81RlJDdlS+dHo+B0S33osLdXLg5nMFNeHx+gxwllpt1zu2ZdKWxL7vXD9jW3jLNc8s/7Bw==
X-Received: by 2002:a05:600c:4f51:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45a165e0560mr3703835e9.17.1755029034667;
        Tue, 12 Aug 2025 13:03:54 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:53 -0700 (PDT)
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
Subject: [PATCH 08/13] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable I2C0 and I2C1 support
Date: Tue, 12 Aug 2025 21:03:39 +0100
Message-ID: <20250812200344.3253781-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable I2C0 and I2C1 on the RZ/T2H evaluation board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 34 +++++++++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index a0cf01978f15..36e3b630727a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -65,3 +65,37 @@ led8 {
 		};
 	};
 };
+
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&pinctrl {
+	/*
+	 * I2C0 Pin Configuration:
+	 * ------------------------
+	 * Signal | Pin     | SW6
+	 * -------|---------|--------------
+	 * SCL    | P23_3   | 7: ON, 8: OFF
+	 * SDA    | P23_4   | 9: ON, 10: OFF
+	 */
+	i2c0_pins: i2c0-pins {
+		pinmux = <RZT2H_PORT_PINMUX(23, 3, 0x17)>,
+			 <RZT2H_PORT_PINMUX(23, 4, 0x17)>;
+	};
+
+	i2c1_pins: i2c1-pins {
+		pinmux = <RZT2H_PORT_PINMUX(5, 0, 0x17)>, /* SDA */
+			 <RZT2H_PORT_PINMUX(4, 7, 0x17)>; /* SCL */
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 868abfdfd342..127e96395f8e 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -9,6 +9,8 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
 		serial0 = &sci0;
 	};
 
-- 
2.50.1



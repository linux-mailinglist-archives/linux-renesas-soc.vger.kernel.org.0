Return-Path: <linux-renesas-soc+bounces-18543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B336AE0805
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 15:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1BBC7A9254
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 13:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CADF28C865;
	Thu, 19 Jun 2025 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jE47HHiQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772B27FB0D;
	Thu, 19 Jun 2025 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341348; cv=none; b=as7Py5mevscfKVVGI81PSDNUipkcNRJFNtBO0N3CgzgocmfWk8mrDCHnDComkUzLoUSZeVoUvfd2qyBPgQ4tMV+i5KJr6z51iJKohKuzWguoNkqszpyCfxM2o7g+L55OCp3oO0hqLjn4OmuPXHWOCifTjD0xBWKjb3zjTQxC1Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341348; c=relaxed/simple;
	bh=OGuWlz4kNKOgb2HueMQ/0PM58Nt0kLoicQ+sl/tLXH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPu9Snk+r7c3jJg/ekPW9sm5orv0dDb3DlL5rI/toLm+E+IZmkXtfU6aL86b6N0of4CBKZfJBhBTuSh15hTR54WVoR1anepBoN9JAWo3hEVZ3bXFZGfdpwVk0B8YEwuCrOvBPEV1ulgM/5/xNP6phs+2MZDkNeO6kNe4cVUxAlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jE47HHiQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so6424475e9.1;
        Thu, 19 Jun 2025 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750341345; x=1750946145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLEG/b+IeRhjbnETc9FXsu/s4UOq+mpbqUovm0NpX0k=;
        b=jE47HHiQx7L2/FquY6vGWDWdbCB5IrofU47S5dALW90gqEBO20JmSVtoIWeZitdwKZ
         dxscdIZCb/deKqRoQOzevl37q8G8VOunzsoFBgIW+2+vz/zFkGc8gb80/0E3Ny5uEsss
         zEylwbGHXZQn7f8U2k/iUGFepAYJpkgvJsl1cTd0QTFp3nCcg8MJmuZgx2Ma5piJrXuT
         pLcKVPDguNcU+gT0R9jIrcCtY6IcfUZrMVINSgJ2rTiwxxQ77MLpaQ3YyelqSAYCByvk
         0bstEihDqSyWlCbo9IMSMG9Zxcf10Vl9nsCEq0U1jTljnzPBvETrkMTzq7wcTYel7Y1Q
         ll1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341345; x=1750946145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLEG/b+IeRhjbnETc9FXsu/s4UOq+mpbqUovm0NpX0k=;
        b=cNFZ5LtIcl5pP5BfopjKOfGMXcZiV5pJdnmDLKmC47y/uUOEll2iYPRDZec42SX/62
         a7uhvdq6nlzS/KWaQwxbQhuw74/VL2PAUoLQgsuJgGfZ0BflbWe83PN3jGoWHMkLZbuD
         +UhqJDjkh9FB8+z+jh/8gT/QOqQMACp0Y6WLeQS+LQJtfnwBe+yg83kzY+QO+z8YQgg8
         JoitUduPpjdAab3W0BQInxrezDa8tQUfKMCbt1oLyMSPQqhK5Rqf6tPG+4PMsuRN06uD
         quNoJk6dGuOtxXF41gkz5su1wIc0dhRv2Em74ucQdzXjyR5eatQlB+bq58TkyFW0dEwI
         zVwA==
X-Forwarded-Encrypted: i=1; AJvYcCVOCz9yypsspek1RSkVXWV5dqzJkbWnPKrl5IfEMrYyRZd+xJ/6crEe5oqDz7gfG1YQI0Iz7rYWfN6ek03A@vger.kernel.org, AJvYcCWUyjJEJzjpba2mR0I2oyh/YGKyQ/SimZJ7yzoI3aW4KOQtNNcCdoiJxhnbq9uvyHjId5LWyARqxIdi@vger.kernel.org
X-Gm-Message-State: AOJu0YwAtFElGRSg7DaxbKes50/tAtHgJpYSmZqwRF4ELxcSoEoTSpLg
	7ZMftKk4/lNqu1EwNbZI61oW+0sexGK34EpA3F48K6ANtpzzrHyMjaq8
X-Gm-Gg: ASbGncsdK17jwcu6ABojIIfUoMBhYHqhgBKiLIFJgqqQD1Hcr/tv+PBkQus+hTqV4dM
	Bq0bkc5tEZNbroNOQUYLJKOv0jWMOWD9NGKBWofMYJQbEomQ50Vs+2Sl0GyKyliH/b6cSfEK7He
	fHf3KaMwJD4L3tWxhwPd5JOP9mSSKDJrcFSEZrmvke+U3KUL7v+VIMoq0eMRAZYbGfEJceNNaIL
	RY0lrTuCdX+rIHARZQs5JsN1QMvaQt71o7SMww3cRkumxkKoWpda7mljNLnsegqYvXrXofbkSDX
	KMSdShw5DRq9krnzRdO/wmrW4bEnXEaWCudFoZoiiQF9gZPr6+/XyQqmhgkiiEh4KfokNKlq4VS
	Nna9Slrvb6oI=
X-Google-Smtp-Source: AGHT+IGRX/e/TXfjaLh2Jn7EFKzJ7tb/0bP0AYt5HbTMHfJicXxhZVXh3JRLj3/HQlWX0QV9g+JRjA==
X-Received: by 2002:a05:600c:3d85:b0:450:ce44:b7 with SMTP id 5b1f17b1804b1-4535ec2e9cfmr36356055e9.5.1750341344638;
        Thu, 19 Jun 2025 06:55:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:851f:e727:733c:ea8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm29454835e9.27.2025.06.19.06.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:55:43 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add RAA215300 PMIC
Date: Thu, 19 Jun 2025 14:55:39 +0100
Message-ID: <20250619135539.207828-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for the Renesas RAA215300 PMIC to the RZ/V2N EVK. The PMIC is
connected to I2C8 and uses a 32.768kHz fixed clock source (x6).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index b63ee1ff18d5..40014044bbc7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -66,6 +66,13 @@ vqmmc_sdhi1: regulator-vqmmc-sdhi1 {
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
@@ -150,6 +157,14 @@ &i2c8 {
 	pinctrl-names = "default";
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



Return-Path: <linux-renesas-soc+bounces-20425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E23BB239B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01EBC1889771
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE5430AAC5;
	Tue, 12 Aug 2025 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPuevzxW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86766302CD0;
	Tue, 12 Aug 2025 20:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029037; cv=none; b=ieXAzkgGM1+Xou1he74MoWvxFvUP/cKSCwi1R0CTbOW600KEQYEuNQRLTGaFpgyn70X+gdlTwjYvQIu25giuiP12eOMVNwyGjNCmYuHh3Q4aYzAT5UefG5RPJlVw1h4Q9h4SPKk8IL7M6mJC4fEHGpcoCDS+m6Q0AYRfweuMlMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029037; c=relaxed/simple;
	bh=zRFoW6QZl3+/MpjS38tObrm/MpvzQwKBHtv5CVQc3qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tj+1XHBwS3y86AOcO/Qvq50gJgeh0yRLzcCiRQ9QWuDZhQ/h7yS3vgCxWFzg5qCVrXxjHBvNO7mgpcbBHUGHAzIA8684AxHMbcYQRjeeNmGblYmqbdXd1auMZ4Ag25uw9Tpipp90bl9GHJbtiOizEg9JN3dDeIkSqmD6Sp7bsb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPuevzxW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-459d62184c9so35203385e9.1;
        Tue, 12 Aug 2025 13:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029034; x=1755633834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oq83BVZsk14/EPln3J7N2tsQFs4rDBOjtbjB3yiGXoI=;
        b=aPuevzxWDOqewdbKNsZCSbZ0KuLaBRQAgh490eJn3TUdJsHFm7CZtSC2LUCWg+EXMP
         ItCcobGME6OdbNikj8iaq5FWa3gWXh5AicD6fpQboWub7bi0E2/yIoDJ65+pZXiu4x7U
         g/yzD+rzovKat19/fotuONaR6WYME9xXYjkZ1DNYapyMAfRlDR08kv5tgsyPKgfGMO4R
         3PE/a8NaC90VImtvXkWen7Zb6+R7kYlCmzPjthlbKmjZT5EBsZxw0a/TUUT2JS3uzG+D
         5nvi/qFuH3oAvVHVmm6Us1jjTgfZssLU4GUovOm2VWlELzz5+92FiW7/fGtAvTWMshQs
         uqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029034; x=1755633834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oq83BVZsk14/EPln3J7N2tsQFs4rDBOjtbjB3yiGXoI=;
        b=J4t7BAP4+nlKCmqlN0HhFNvuHobxTicSyjF6DrChaJUwUrzz4C+eTVktzoCkU9ofuQ
         xlwMVv14L84fdeGbvVJ0kc8zeacpl1pdLOS4tTuS8FzL2702Ehb8ftGd7Zc+3ro3n/H3
         grKv6I6iZQB0iriqndm1vORhu0D2gbzLxS8plSxnXVF6VhjfIIpXLuZK4zJSOtgGKqQV
         aK8jdHRYmYK5KqQReJfuhM6lgSAr2RcUmuAh7zLgKa8dFjTnnw5u4s33+kf/ICJhwvud
         FydjVmtz6CeAaMsWMH15LJxB5KHpxH2DWm7BWy+KI2FjlTkBsQ+V8IP6En/kGPc9yJ0E
         Ti1g==
X-Forwarded-Encrypted: i=1; AJvYcCV8UQlv5dTex5GDNZpKecxXFldzapHSPhMWZJxmhwHiDfdyoSbrsAF5Gnxc1+yPvf0hp69yFlqiD0Od@vger.kernel.org, AJvYcCWLOHBOkoZ+j9bc1ywSivF11PymzklB12+7WoVAsGUmIwYo3ivKfFtbPXPN56Ov9bQ/t2SJBxRNOCAWYF8n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0RvOvVlkZTjG9OoTF+HWlShRiKWGASNEMNOEp96GQPUVeTx/k
	njVzjTTXjbEgMte0cHxQrByQJpbtj4Oe7XviILbVT+8CD4C0ydkz4hq3ZxwTyQ==
X-Gm-Gg: ASbGncuPdVejOTZ56xypYMw+fRwLXQrB+4yMKp7BgCOJASMNR+bqfg3OrpS8j4nZmJD
	1ux/sNI6xL1DAZRRHaTyStc6gaCB8lBjyqRmrS0KSPb+eQWmj2By7C9165dQKXm1Bzs/0wFn/eR
	3RaBs4myFN5wKGzkOj0ld7d83bX4fvrUhtobxoHXYSXCa+E5dThcNR8uBnUz717pniApcwZhH6C
	IYGpDU8giw4mzz8/T7WGk4JLXCvxU9j0CsvNkOEuW2fIiIOjGzroFTNP42Q67Jz6WUo18CG5ZiU
	hsGECtEcc9gRCOUKdE5E3jv617Ng+1o7OQpp9IyuUq5wHkUIbmeL3a2RKj2RffmQhw/2I2VsJTQ
	zwOlFNeUhPUlUfokXHz1NyVrLwXHd0Kc3us+g6+J0boFBvWkDcOI8QvLLtAhBlKruMfQqUa39Mg
	==
X-Google-Smtp-Source: AGHT+IE3mG+KkD6sFC45EPjH8A2sn+Xi8OQAUh9LoD67ao5tyBDfFwJ5dFN6G/Brl2sqpUzKN1LVXA==
X-Received: by 2002:a05:600c:450a:b0:459:443e:b177 with SMTP id 5b1f17b1804b1-45a165f7fc5mr3283705e9.25.1755029033586;
        Tue, 12 Aug 2025 13:03:53 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:52 -0700 (PDT)
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
Subject: [PATCH 07/13] arm64: dts: renesas: rzt2h-evk-common: Add pinctrl for SCI0 node
Date: Tue, 12 Aug 2025 21:03:38 +0100
Message-ID: <20250812200344.3253781-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add pinctrl for SCI0 node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 5f17996bcd6b..868abfdfd342 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -5,6 +5,8 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+
 / {
 	aliases {
 		serial0 = &sci0;
@@ -19,6 +21,23 @@ &extal_clk {
 	clock-frequency = <25000000>;
 };
 
+&pinctrl {
+	/*
+	 * SCI0 Pin Configuration:
+	 * ------------------------
+	 * Signal     | Pin     | RZ/T2H (SW4) | RZ/N2H (DSW9)
+	 * -----------|---------|--------------|---------------
+	 * SCI0_RXD   | P27_4   | 5: ON, 6: OFF| 1: ON, 2: OFF
+	 * SCI0_TXD   | P27_5   | 7: ON, 8: OFF| 3: ON, 4: OFF
+	 */
+	sci0_pins: sci0-pins {
+		pinmux = <RZT2H_PORT_PINMUX(27, 4, 0x14)>,
+			 <RZT2H_PORT_PINMUX(27, 5, 0x14)>;
+	};
+};
+
 &sci0 {
+	pinctrl-0 = <&sci0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.50.1



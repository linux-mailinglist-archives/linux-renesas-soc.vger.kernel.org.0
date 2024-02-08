Return-Path: <linux-renesas-soc+bounces-2487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11FD84E2A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 14:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E3692922CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 13:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EF97B3C1;
	Thu,  8 Feb 2024 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OlGpaNXd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456C78B57
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400609; cv=none; b=ExVnXfmRZFjuf/vMgzsEIR6n5PKS0L88cgkuNusyJbgOGNI2KuZGEn0z9fbMexO6wcmKcbQyOYfAzT3J6zb4tkXW4Go5X7duP4So6dcqrGH3JMRR8CZLPGvWw2EJhoqqmlsi13idpgGywHhBImcwrzxCp8m/bIE8dFBtHurMt7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400609; c=relaxed/simple;
	bh=skYPuQdWO1AkU9+D3o2QVU63HV6l2bXIQp429kPeKd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Djadnwu68IlTd5WunfqJ3T1C1HoaJu3tLNTzaAjxfjxH7s1ODEa/zz+YNdBQsjpVjsGrm76TMfYphbasQHrHQO3boNJV3L+jBfMDCvmjuMFdsfSZo2UdBrNLQnkngMsTQ7EhXMNfeAmpvpXAQLHG/yY3cY7nJGSEuwQwfWNS4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OlGpaNXd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4100826df08so15969645e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 05:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707400606; x=1708005406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf3iXA7Keo5roFQt9T7Mh68I9zCAVJX3CMHwvuW41nQ=;
        b=OlGpaNXdVnXcShr3ygBO8XdtaedFddpHg2wdL5N9a6ViwCwNoZaBL7Ci0XFMQ4cLfw
         iCwDSU3sqOT3aquBU6jA/ZoWLL1BJyqCG1ai1f7XuO+Tjpm2JyZOJlQAhYKdc2VhIK1M
         7EXdT3wdEQLC9ubPowquuIu80DgdnenQ2881a/UcAne0OncPqwDIe8sPBGfJHdnnBkty
         bKhAgmxsUBE4tuycsEJgS78C/RvOMqY21B52+VFlX7joJIsr1sPcCdAgC9utSVX8VuCm
         oKU86XNdAhdxxkk031J3lxQDJVEiLycKiNMT9D4c4TRN91ZupcOzvboFlfn06PUT74dF
         zMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400606; x=1708005406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rf3iXA7Keo5roFQt9T7Mh68I9zCAVJX3CMHwvuW41nQ=;
        b=Fc6ABk/jFxAoOyFSsl2kCBQsv8fjFUXSIR+O45QKgkf7yoxUDRC3dQiL3ka4+Sdf4j
         96RhV11OhZ97iKGdoWQKbQdacO3cHvFnNHHmgvWbBhTrTyYcyvRNJtP+Hm3neU4+tQvt
         yFc6IJPdqe+GLroFVjzK60rwIEiw5S0fgQDU5UPoVLmlwf2XBccyMDUOgtAkdTYTVHnh
         2bk+WjmOGmO/ztFc3H9LWSyzbTQQXWeupFCP30U6YCMorsh+cRXx3iTzrWO08Jhd+FOP
         kqy3/QT5/2ysTlLOZ0r1g0TOTSqmaJHJpk+97UViY40O21b1UZSs6T1t3wppjKFtp2ne
         yKHw==
X-Gm-Message-State: AOJu0YwejSw0kcmDEybRNBq2v6jNkahI5AmK3/TkLbaSWG1C33Aq+R3v
	3ijcGYXSyhz7jeMkwBu2DJb7L6PJoIf17+r9JoXXprbN4NobP4UDxjfFYPHn+nY=
X-Google-Smtp-Source: AGHT+IEcOnvELKJtX5OGb3t3vy/9XXEJM6nu2Rc21S/gEbrD5i68oGlfkWJQvZO3eeO3gcnw3ew4gw==
X-Received: by 2002:a05:600c:1c07:b0:410:273:c648 with SMTP id j7-20020a05600c1c0700b004100273c648mr4686357wms.0.1707400606091;
        Thu, 08 Feb 2024 05:56:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVP0VByxBmRXSwDRSjyNM/KONaFZfUmmVOz7EZHhT6QUZkySORR45gVDt/4Xh8qnxTS81pdQsKeVPWNx/+bTAopRQJCNOyk8B/T/Eq6DVR3Z1vdJ1VRqkqMkRuU2hzNRqy16PrszPwQzYQ6MF0+pqBfWluY9vMoTxDKkw+dFnyMBitXm/Wx5VpQKsS+97+b4r9rpxXozKVNBTR8We6fklJkdSRjAap1VbukmhcLLgiwOhGdKJLJWZCxC6C/O8anIf8OD2OlzaLN13Ew2c9WGkKYBs6omzEdJ1Hart/dTPS8hTvmV/8fimZ9pq+ZIYVShHpxVFspEP0dDYreLgJX8p2oVMv5RPEDlzjDpn4FhuSedi0S9+asPn4mDqAlHdf0tsXMrPqOLiDcSpgLPp933DHymXXn2FuWQ89fDw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id iv6-20020a05600c548600b0040ef3ae26cdsm1703058wmb.37.2024.02.08.05.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:56:45 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a08g045: add PSCI support
Date: Thu,  8 Feb 2024 15:56:29 +0200
Message-Id: <20240208135629.2840932-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208135629.2840932-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208135629.2840932-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add PSCI support to enable the suspend/resume with the help of TF-A.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index dfee878c0f49..19bbcae01d80 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -42,6 +42,11 @@ extal_clk: extal-clk {
 		clock-frequency = <0>;
 	};
 
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
-- 
2.39.2



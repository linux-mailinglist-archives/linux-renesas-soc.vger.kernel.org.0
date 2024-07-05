Return-Path: <linux-renesas-soc+bounces-7117-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB87928602
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 11:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95CA82844E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 09:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726A015B56E;
	Fri,  5 Jul 2024 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0Jh4keT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5FB158D91
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173146; cv=none; b=lEAG3KrwRZNTCmVr6jTdyux2sklukhiLnT4boGIjqfji7yld8qamAyriTL9ogZYMkqIQjoTt3TTLynzC+tumrjApd/Tapkny6Giap1dRfhx/ACSsm+DFGVaGZGi3OMyVFgSx3WNGJMWwZQVbX7WIOmF6E9soKX2hvzqucZDZMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173146; c=relaxed/simple;
	bh=/v3DnhzMdOF5SQ9SQNOV6PRSe2c2250eLo+YE94Idow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgLlHDxL3DyBfzE9o21wQ6fWPMszm1Kw2A1LqrQwmIa8nvrHsrvR0WltLjsq/GVB5DxsM/HS0Lylr63e8jEPaazb+ORojL+2ng7dyox8BkxCcekunXWe7hQbTVA0x115uQn4RV/ulGZu9LXECau/A1GQTPSjezzRaI92S2UiqkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0Jh4keT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42565670e20so15711945e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jul 2024 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173142; x=1720777942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3560sIYwPYF1qUJ/9bHKIhK5P6LKddpvgy+hKRw1pU0=;
        b=A0Jh4keTKmFU0fQ9l58IgjvJF99EA88QI2EhkAUAjXozKgYshGU0ikjOMCssL81ovp
         DDmBy4r/4abYm7CnFAxh4c0fuq+eD+SFKxhHxTWr6ZcplewroieB5PSWmN71NuWLZjyA
         As7ZAOi1ZQtMKzJ4kcRo9UO8PGRWF8qgaigpHEparct8jK2tOG2KHj/rB0i7FyviBf52
         Ks/dB95OIUG3/3TRpXw/08k3cXkco7dAaAupq7AdZAO6/Utm9mG3M7w11k+4Froz5W70
         mzffXOyTa6m8aCcPwIKFRZUbaS6qKkUe34gTzS8JMsBNXeW75qshK7nuk3/NqmlRhfC6
         pPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173142; x=1720777942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3560sIYwPYF1qUJ/9bHKIhK5P6LKddpvgy+hKRw1pU0=;
        b=XkKrpPuIj+EqLAw/ebefmQx85Cg1R4Al3KjRTYwb3a/M++zuf3V9K11XaFCiMUaKsW
         V6kJKyHRODlU4972yk928FIsqeSxodJwFMpWrXFHqCHotbSyjOzU3rmBEdcjwlzcpDNX
         lYHIkTP8AQ9ZzySzhkHGaIL0J1Qtb7bp7883Mmt2ARbdhDl/a5Fj2aXPuO7MVuOyLuag
         okZqzOpOPpqw4gPPd1BWImfuxL0qT78JkhwhCN4KQylR5NhTbIEfERvB5chbSMq3OOwh
         qAorG/AaTPg0oftjG4JP77+q5OUCN7tyQZi7oopGnJpCDMfuz1wmwv8XJvIFYgsQvvYH
         Wz1g==
X-Forwarded-Encrypted: i=1; AJvYcCVNbSL3Z/wzBAeikQFqCss5Oe+fP/6zgsx2MOeKpMUu6XE8y6SyVkTGtpsWiFIaoSSjP/g0vOUsRgA2RUJUPozleeIEiK7NYpP5ncIw3D2BIG8=
X-Gm-Message-State: AOJu0YyG/sjHfUwxR+Q/2MEFlizUAPyfkLslaz60RKBqTiq+Og9jV8m2
	ote+hqHeQts4Ul2/qyzaO3y6a1s6ZvbN18qaJzxx+S5FpKa9Za4baawAIPmtvxM=
X-Google-Smtp-Source: AGHT+IGbvLI+7zmqv75BKx3/cT4DQdFw2sCQV0t1yMf1acL+CHxXQXdR9gk09jrAs/6TLJ/GpCm/Gw==
X-Received: by 2002:a05:600c:1f85:b0:424:7871:2e9e with SMTP id 5b1f17b1804b1-4264fc7d970mr15129865e9.6.1720173141847;
        Fri, 05 Jul 2024 02:52:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:34 +0200
Subject: [PATCH RESEND 15/22] dt-bindings: thermal: rzg2l: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-15-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/v3DnhzMdOF5SQ9SQNOV6PRSe2c2250eLo+YE94Idow=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IxKgZOJfR0ZXnugjqEGRImqQD3RqxQZVGYU
 QKEwKmPSoiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMQAKCRDBN2bmhouD
 19iiD/wIEJLzOoplNOyUE8vTIb8jypPs3ZtbRPE3IMr1kWyNV4kkUeioMt3Ymjfg6Yz6a6YL9ZD
 UC7vyu7i23X1HGATIOwuRq68m4T8kLZ00e1WhtExcwWdsJ4x1zwLsJSkusJ97W0rRG6DB8cjogD
 RH97NBKW2ofqZwZSxXAn49w0v9M/LpK1PF0OtBGj6ksr0PnHycXJdKzZeIJSrAtTXUzdhgoOphj
 JGawUElpAsy4+1kwbUxHwsfPW/Q0tjJGF8yYMTyDFlz2DBcqnJsD8XB3MExsIYuZctjCKB6DMdO
 K2C25ZMFWos2IaJ71O6XRLLPfNRW9LLdhmVrU5ckOSXGdVrnAKnN51n7wg09rIWwgUsbQw3uguz
 LROpWUsUjWKfjDB8bNWBzqxhW9XSXkh6dSFHJPngXpzOnZpDroqp9hTT5TbSNsfUpsksKeYH/Jr
 t7UXtuKximIUbkSApKE9jtUNPUjNcDOPMpy+hVxGIdvFN4bblQ4J5aRTBV6i/FTZmIvRSxezrom
 IUC1hX6/nhbptXejc7ePmLvnuCvf2CSdP7urMV3EYncRAsGEK+QT7SZT3S4O0z3fdL/1zj2rOPu
 F9Y+eY0sQqQwkm9q+Qv1JsrcTR2VLfjXslTIam3QHLpSHyI8p8NLaFNremlstKYULsDiRdPT49q
 OXOymlqijKt+JdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
index 03f4b926e53c..2f96c0fe0f75 100644
--- a/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rzg2l-thermal.yaml
@@ -13,6 +13,8 @@ description:
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     items:
@@ -43,9 +45,8 @@ required:
   - clocks
   - power-domains
   - resets
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0



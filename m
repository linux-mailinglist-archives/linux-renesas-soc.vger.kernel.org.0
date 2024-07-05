Return-Path: <linux-renesas-soc+bounces-7111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB09285D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 11:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18D9C2848E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 09:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A871514DE;
	Fri,  5 Jul 2024 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KDWew8uD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB3314C59C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173135; cv=none; b=Aqce2/An9XUH6I4n1O5D8GKKznvFlFUAas19U5kp6ERvNKM0C5fdFFBqUjAuwJWYfZsh9PhGlB060XrhyviFy+p4Q6mM6rH5Ay5dfjMhP7XIiI96hYgK8AgOXiFLyzmQMJBQe0+1OOoufWaN7r4JWaG0pkvcsO3JWRlUzMdmcPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173135; c=relaxed/simple;
	bh=9GRX79mD0Qnp5m87TzZAuzLxfukwJoqm8reUPg+HeMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IG+NFPfZ/e7QNl+OBw+T2PSAx3XBqXOFAgp0nUPURE8ud2Z0kxQIulCDRYrXN2yfULKzESvXUCjqiLSi11Sh92xM7KL1FsLvlJQ0wapk5xfI9eRcmHbV17P4b7prHkqilHVbSI1vfiMEX05VLuiItwQoCsAvC7MCablvMqFLU9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KDWew8uD; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee4ae13aabso15116711fa.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jul 2024 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173131; x=1720777931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpMYuJ0dfGhKXJajPxXWJEOB8SeiMwwjEYPx0ijTq+w=;
        b=KDWew8uD78xFmnNCe/CMXE9uP420IjdZfzHYW77fF7qEE+L102HK1K0Y75Z+sTqGpf
         3LdreEEMT24Y1xEUyPYnPTdD3fP+NrTwb+Ki+YHehMuxzadgxHkmm7Dp8ZjhX+riBhNJ
         sGeVW71G60TqgmX7VTUykNukzwJLtgnw1H5T+6VPHhnBT5/bnRiOLBO+UOyvGs6QIDP1
         WRqxsepF0KO8Y7VVyL1UhL6EU4UxQxGi0dvQ7nv7yRa+cNjCK0EGy5EGv37Ttl6TVi9A
         a4PgjKim1R3iFGy3VnW9XHrqV5V4RZXAZon6nfQo0/Fe0IWD3lOOil81lLuuJv3qmHuV
         nfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173131; x=1720777931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpMYuJ0dfGhKXJajPxXWJEOB8SeiMwwjEYPx0ijTq+w=;
        b=P7qsBxq6D3j9kXv6bJGftw2aE4OdEULmLqjork36/eRjSae3Iebpu9jhzVNfEzFhzl
         6ok4sb77P6M65RYvjIxyG7BrdJjVRqw2zwPCbqUS7LRoE6X8Kt7UeM3DdnQHrEBR+x+s
         /UErlatRMYEdtzz/2/AjO7U4rSyrJgHE6093kuwRhSGAIp9sj0TUtvRuyr5zGF++FJaR
         1CwPLTwe4npcSqhHSJZilSukZF8gLAhngxEUIB6vHh6wnWR8bxmVkZhTODCEc6P5WtuN
         nDB4gCIu2Q/iZ4NbgmA0fNZmklKyspSqe1+sJY1RXRLJP4DdXq7+HEw9vu9OQOtOe3Gq
         3bnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKDhf0UbKHGkjgHX81uyXZD8LdRys7R1jdFDZfxjRwUiANtYKf6LquTNZ/nrLhM670OruX0eLNULxwv10l9uwe1IwxDEjaPS0QqsnJL0tQgac=
X-Gm-Message-State: AOJu0YzqAkOTe4AkfmzpYsnVkci8X4CLn2XnS5DqaPip/0eTZclCj7kx
	spKVIIMpbJD0P6MLQ/1t7TdDkFOa4wanCUwCReKM/IiO5lhAT3J+cTnf3DVWjdY=
X-Google-Smtp-Source: AGHT+IETSHLx2zzowgiEOGpjYLxdVdv6J8fsjUHUvaJDxS3VDywKP7ENhmO8Keeop5zSaLogLiZsxg==
X-Received: by 2002:a2e:a913:0:b0:2ee:81eb:6bd6 with SMTP id 38308e7fff4ca-2ee8eda3d7amr34978111fa.23.1720173130803;
        Fri, 05 Jul 2024 02:52:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:28 +0200
Subject: [PATCH RESEND 09/22] dt-bindings: thermal: qcom-spmi-adc-tm-hc:
 reference thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-9-554061b52fbc@linaro.org>
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9GRX79mD0Qnp5m87TzZAuzLxfukwJoqm8reUPg+HeMU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IraTqSs9zXCQgTjfReqMGMnHrccOsUqjqdv
 h2tuW/AYMiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCKwAKCRDBN2bmhouD
 10Y6D/9oTPxkLaWQSK0Zutky2g8bfWF3Az9HX0SCfqtcHP1CTgFWvKUJ847L7+6zScZ+CkBfFKv
 74RhKFt0yJxG2d3fnk7z8XGYmbGYt4RB5IlopZ8xL5OH2iOJJmqUgNJ9jQokzSn2fivLfETFv2v
 00+6DiAvmoeeQcuZ+T+YRa8k221r07QK8lwh8Q8qNb0J5rbPYV9H7erdx2/zEPuef1LPpjTxvMR
 7efX5o+RlrlMV101gkvXPBFHcwuVvinQti39t8Sqlg8/YZRHhdk6PebYXx6/pekO6RVb5R9RcW1
 9rte7VUPRZT6CF7ILZy7L+fwAzdABfwK5juqSR0moG0u93xOFyTPeHFcP+6EI50hNu9ppYkZwL+
 GCbM8fC78oWlP7PX3CKB7O4GZXibSRrqXOqu34x2Ya8ebcPzwLzeF2cvISfTrx+t+ahXqBzobtg
 OYwxf5+mcHZf3kNRX9SCcNAhxafXerYoic7DFHWiUh48FK66YajdrdSUaArj4cfb3opaG6Rn1Bm
 sXqZqDgDXm5ShGfuiEDgfQLJyUepKi66yBbRCfvtDW/fKh8C8ThwCmUABgYuHRRo0wEXEabBqMq
 0t7TUagrvO/jtIMGA87RSODLPAMc/yPKID9WVovTujYV6RVTkXoz21dYbpnKF095/Vyy5TwKmth
 GnOo7hn3HprgNhw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml          | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
index 7541e27704ca..bfad8130a042 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
@@ -8,6 +8,8 @@ title: Qualcomm's SPMI PMIC ADC HC Thermal Monitoring
 maintainers:
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: qcom,spmi-adc-tm-hc
@@ -20,9 +22,6 @@ properties:
 
   "#thermal-sensor-cells":
     const: 1
-    description:
-      Number of cells required to uniquely identify the thermal sensors. Since
-      we have multiple sensors this is set to 1
 
   "#address-cells":
     const: 1
@@ -106,9 +105,8 @@ required:
   - interrupts
   - "#address-cells"
   - "#size-cells"
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0



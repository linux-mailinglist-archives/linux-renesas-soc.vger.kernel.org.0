Return-Path: <linux-renesas-soc+bounces-7104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E67A92859B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 11:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA747283D14
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 09:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC53E148855;
	Fri,  5 Jul 2024 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t7JpbaUe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC101482E9
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173121; cv=none; b=M9g6UZNyJL+/fivfBq5FzxyL+Tl2LWV9JdwMSPB7NLgu9nEOTbSp1Q/G9ADt+HfUdsWxNnpcgMiJvI1iALekKMSCeUfCk5pJtFSm+LAdaIBjp+Mv9FBO6pUjHQi5uGZ5RwEznp6nBFJqehQqLzEvYalqzAk5qGVaawzQXHp+joE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173121; c=relaxed/simple;
	bh=LeSP685Kq7VRSSmr0/04GPkxgxhjYf+AaH4Aoa6qJmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NK+o+U8W1LEFt4fxa9Ys8JXD0Ui2OmzBndhSeX43X9XKU3BJFJaRORaNWxzr/4ZPcZmP19MDKo3wGgcShLnamsLHDN5tO+XZbKvWpa6M8pk56mygz/lXLk6vRH9GXtLBTdGcZLGQfQ3jO1IXLNCZgZ28hY2g2URGlSp9jS4E1ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t7JpbaUe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4265921b0f6so1454755e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jul 2024 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173118; x=1720777918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=;
        b=t7JpbaUenzmK2O/Riq++n0mqjvZqH9Ix5sJusZtTrTNpIkFrUo9+CK/uWB7udg2enT
         LLJqoUUfUF2rCpDsSMwqSwyA0S5EtTGLBlre1KmjayVu514nYUXa5F4n+7BGldrrh8E7
         wuPdJXw6iIIpGx0+BUCpHgkXN32I1zZB2+8l7WUCU+jbe15dIbbpLd3fXgyoTWEt4DyL
         27wNQJ+dkEkOk43fiQpUYg1z6shKWw/uTB5ZEzvVGnFrMM+xJ5PmQYhTVDGel+NfPvk7
         GCu7Y1X6SqgPFGCY2frZ1CP8UH4qchNvF0D59FYCeW9j49zfGFSD6ScCYAekthaSSnPH
         DBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173118; x=1720777918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8COq06alpIOkksMoTKi/tXV/R1PC4Z5hewvoLdmduzg=;
        b=Hk0tX+CZ4vSAWx4cuZFuH5pASuHtO7sWzpVw5jTCuo5xtWb/zTa4mGtWQaa+5dpWA/
         G4UvajnPPjHw99XnTIO2r/Ol3giR/6nfkFOpCqYVjq27Xhw25vSe82vMzPosivBFLJAh
         2VE6mxfx8ferhUsC+l53e/RR2jEPRhA/OJ9b7ZWr7A+V4oTveCCBCPznWGGFuPmQZDsb
         U/lT8StjkPI+0a9Z19F/izxbsNvv9cN8K3Eqd7mok33uLBkXGp+XiJ61Ronhp9J+hHZG
         Nvp43LBSnAo1YehilDl1OYCm0gSXghPwx3tfKoDFCjRQsJK2g97qpPoTLgbQZAjxxdJJ
         1KPg==
X-Forwarded-Encrypted: i=1; AJvYcCUL+wSwTFdxswYMtqteyUtaImSqEyf00s9QMAoglx8sxGGef5gXfSHie/c9sK7uMfg0Q2BQpFtqwvNZfrET0mWAZSAEzE3s2dM8wUGUGNhiDko=
X-Gm-Message-State: AOJu0Yz4VwbhJxGJ2hbVAMqR/9TeP6L6P4o3V2bwS2+UNH4trW6AChEa
	4i+mubHJFIT2ZcGRuxKOKSxsNep/l8zWQi0U+9BKW8Ty9W07AGLTAXO4VnKBzrk=
X-Google-Smtp-Source: AGHT+IG1gRQHdpu2sW5QFoF1LniSXRvboVCxaOleTK3xsQy/rvilU/vtH+YKOuVGHfgb67tw64B23Q==
X-Received: by 2002:a05:600c:4ca8:b0:426:51d1:63c3 with SMTP id 5b1f17b1804b1-42651d16511mr8916535e9.38.1720173118303;
        Fri, 05 Jul 2024 02:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:21 +0200
Subject: [PATCH RESEND 02/22] dt-bindings: thermal: amlogic: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-2-554061b52fbc@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LeSP685Kq7VRSSmr0/04GPkxgxhjYf+AaH4Aoa6qJmw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IlkQpQruYXCBJmeLjrsSCjy/A96oZulHmNT
 BgmKyLiQHmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJQAKCRDBN2bmhouD
 1ynkD/9TX/+loWJbQv5z+n7E0oNbl34ziXNPnnRwtmKBF+YXd72Utz+bdkjnSJutW6EqAh4i0BA
 MyGzrk7k8ABIGMvBwk8+5HQSlCAsjsRRNaMieuxVnqXzhgfaZlfvUsIyN57KSUpzGmm0xYZYW1O
 TwabUrxmDq49lNhaL1soSHAaKezV8cw8ZjHtnC+6NKewpbW39+ipivJIpNxvTdoMvccHUHadlIO
 IvgdAAL1dGmGkmkl6ARHXH3Agj619JOixf/ylFr965+UxEYWNp1RmeZIVfgAwCA/3LKf7sXSDmP
 PwKgo03lc3yyH74EdnS4hYtIBaZ6OG0jYx6A0W023nSkAmcDxYgAGRnNjKPbEvfEu8fQvOvjrBU
 YUO6B49ZU20YmCkr4fxDJdsEJIDr1aBRhTlf8ek6gwtXqxT35oFEXJVXFa4poX43FH6Oi2PO93m
 w0WE2laiwoSf7AvQtogVWJMfoHY0RNX0lE10j1CoYbz87yVdLjVg0BDNpby3/IUzXrpR9ZfkyqO
 WoFoOk2/daib50kAEnVw/D1FldDWwdUJ5PgCrnJVzAv9FXsKCYFIT9CKQkIu5tueI6e56YOLSrm
 d63rcP+UdVMKyrt1Fj9g67/8DyDGtZOMEn6oUAr+rgqb7HnNpqeGWljv/daZcqYKRwNqJ5cfDjw
 g5lf3f3ssrwlG0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and all in-tree DTS provide
'#thermal-sensor-cells', so reference the thermal-sensor.yaml to
simplify it, bring the common definition of '#thermal-sensor-cells'
property and require it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Guillaume LA ROQUE <glaroque@baylibre.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..e52fc40e215d 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
 
 description: Binding for Amlogic Thermal
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -44,7 +46,7 @@ required:
   - clocks
   - amlogic,ao-secure
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0



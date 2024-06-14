Return-Path: <linux-renesas-soc+bounces-6230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 973B1908874
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A1801F21F5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9171C19EEC8;
	Fri, 14 Jun 2024 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qd2jtjaT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C0319E7FC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358430; cv=none; b=fzPmIifgF1T+ZtS8S7ClQEbQdXtlNT1W1rDGg/5MAGtpTsZmx+9I2opylrZF7zap7BAkUqt6HHUVHj0jePruV2DHkpiXlZU4tmsNZV+WQ2nafuqoWvSVG8xyy9zRHFwMwlszj9DoxjnLUbRs8TrJVuDaXOG5OYyXcr56H2dvJ+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358430; c=relaxed/simple;
	bh=PiKB0wNkfaJ6xvGR1yJNgb5MvS56AdMDq4rywxnekiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOMFe0s4BvRMCdO2JiKbET+45b1oOXyjyZg3DSziMFQ8q5vtNzzKYQST9dP9KBMq7HDvY8WAWYbrywQFVw8j3WS/ABfsoTpSqgclemqVffNhvhG15MAPJcgZ33bZhverIS0Gb2fnw4KipFFrlsHilzYxQvlkEah8uHIQ8HJctKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qd2jtjaT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6f1da33826so297039866b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358427; x=1718963227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ok8Pi/DtgH78hQO+dtYDNBPN0xk3biA8jqOGqPMEdyA=;
        b=Qd2jtjaTP+3eg7J95CooZB4t3Il6YqXJrlf+bwyrK+P97xd8MFSdJsFz6TRW3UQ4FK
         VgXZWOkjiEdb/0bdU8LWvCqAvLXVJalGPbfaHsfGxtXHrmtNMOrgFbS9AVJilQIDKkpd
         63U6JcQYHUrWRROzXZ5WhueJgCSqe/l0kX6EO+3JfEQBDXS01/rw9gLfb3XCN6SKlcJf
         zhPN7w/dALnNe+OA1EIfn9a+bFAh45++hy7b51fShilc3mcjXFsLp2N0ug1siLsE1sMg
         uo1qTC0cITjoxOU26+UPnw+mf2Tn3X0NoMbm3lfsd1m4ANnJsiMl6TNh03IADeYPzc3U
         dNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358427; x=1718963227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok8Pi/DtgH78hQO+dtYDNBPN0xk3biA8jqOGqPMEdyA=;
        b=dB5gaLBhFwsquhYmkEe8an59Z3GX43UFv/v67H9hb1LtvG28LAHVQf1PwEls2H8nsV
         eriIjDXHrRwUXykGdVxLTKvL/c7DUtD4j69egBvFo2DbnBIysoCpdCV3gr/FTTMBDbPC
         /Fj5mLvF2B+vq/KUWS9cxCOgslFFaB6IhF26fao4Kfnn0pFwXPXxCHDtLWHtURS75cQk
         IK3o7G/ArRjLCKlverGyGO0sEXThh+aPKKhkQ8V64qxgnSb30mBmLfs5gAmmZFOn1Sxp
         7EDV1Yho/1Iu/5KL08QYuI3P7w2JTtLMkJVb6F7cjjn+dYOdHmcPRZpzfnwMeRwNl8id
         OZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIPjnYhJ4tNt+VcuDqk4x5ERka4cLNkovfnvgDKVdwjMDYxn76OfVka2B8TbSrF4xIdhmhuklSQRXwwzDxmmTJlcPXkzSh+f58VUnozOdy1sI=
X-Gm-Message-State: AOJu0YyXX8wyik73UID8CoDFzWRT8k0dhqH+GZEf5orhG/W8Vfc9LCTE
	9wRHrRXd6NhP2nK2RlW9RG8K5q6Y4KXArkLPsSUnp5WMyUYKiGzjMwiOHLI3xd61N8UtVdSvC1Q
	y0YI=
X-Google-Smtp-Source: AGHT+IGsBqftnrIXmgc1cHdRR05KgGIYwMeUvi/46uj/kB7DuzduBEC6phd954ouxCnWHDCAo+Ew7A==
X-Received: by 2002:a17:906:354b:b0:a6f:4804:d41a with SMTP id a640c23a62f3a-a6f60dc4f05mr221236366b.55.1718358426682;
        Fri, 14 Jun 2024 02:47:06 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:14 +0200
Subject: [PATCH 15/22] dt-bindings: thermal: rzg2l: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-15-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PiKB0wNkfaJ6xvGR1yJNgb5MvS56AdMDq4rywxnekiM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFtz+IhHo3wCquuWC1ec8/3Jcu/NJS+VuNcz
 b34f6I3E3iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbQAKCRDBN2bmhouD
 1z06D/9PkUWBEfuEdXbJsuS6h77nANSMX4uhMlwoqisgMAkeTMkfGPP98woVm47q95V5Lwg591l
 FAtvbZhqil2JxvjG/5h0ONxSz3tKBDMH0WzOFIDxXm7j1lGjZ3lcvYI2qZRPqk3LMa93vXPcbfP
 p6JzZd8NiLvGfqpeFj4yPmMP5Zjte+hfqtLmWHy+wg9thx2sTsWxGWsblKtvokABQ6PUlVX1Sf4
 s7klRUix8KxwWqbKz3VbVCb1yMmlekTmLucE0NOa72rw3Q0u0skJ+sy6Gu+RAGV26u9KDWtKO9a
 G8AOkKlXsoL1AJO7TnYbE27eoG2nm5Y6aVWmnnIPDSyoR4bRYFoFHbIFYwhyrcoeUhwo1Y27VDf
 P9WPw0AqaEKIKJhbBoGYKwJ0JW7UnjRIx69BZ40rRljeFRvj/rF+LedohR2tQMrdXABedtqVubP
 lQWQnfVmR+K0qRYByRjZdlreodzPd7oGk5mOXs8uBw9iT75K1oEBHBWOu1cxib03+evVg1F/pzH
 wzZKYZ0ZZTiboHc0aZUgYrqQDeHHFsc7z3kYLqmvWHeSYD7Q4D1plbWRYlFiAPB0lefxcrkw0m5
 gqTjrtCXbVzf/rAD8MlTcNiJ4Yz4gh6fOleQtl+zSJusfHYV/Ay442/DcHG5Qn2Louam4zHzBp/
 T09Wn4Iy9v6TVGw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

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



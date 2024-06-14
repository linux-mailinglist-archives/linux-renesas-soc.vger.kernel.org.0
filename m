Return-Path: <linux-renesas-soc+bounces-6234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73272908892
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6B111F21744
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A0B1A0B0C;
	Fri, 14 Jun 2024 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nRNwoTBr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8CB1A01C8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358439; cv=none; b=k7vhIk1FA88WtPDAwsNoWYhjCCVeGdWLJrii3vQSRB6rrIK1/HOTTU83RqbMRThIaFrLS5vtnKKPDdmmqlks4+uxdfJgXPh2to7ueWK7WHv9LNi1sw/2eUNCL6/8Ew2VpaW1+iwUR4/wKUeAYb8a4tLvgT7CE/8fheZKVArPLQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358439; c=relaxed/simple;
	bh=K3V6Xak3YOQEHnMj7SlQYHGX0YMx6fkXwr1FCTF4hC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBo6Vn8iL+rCTj9/2EBJjzm3eZkHGPolYzn67sQ9c+rmObK0uiE/xgs2dCKmozHS9df3yCrozZ745ssv0dR6NyQVGgOiXVhV2FQIsUTvnMBddThfOA5alyXmjLC5PLrQ/iy33VrcHQNFfJ6WBCqvx3gutOwt+oJisVjIF9o/ZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nRNwoTBr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6f09eaf420so228528466b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358436; x=1718963236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=;
        b=nRNwoTBrOsWQD9gwczHLMsUUiID8d/tQ+FjLuiZW1vBCk4TPYJOiyXfkwZ6SmOiqVC
         v28Hr7feemLV+UbZa5UJRMVn1X/IkB/2OkD7a4QLoitwME16MnpF72vUHtop5Z0aII1+
         0PHivIaHGpssU+nhWsTOIdZVUwQtkIp5wYVV3A3FX53nHUmeoJXKZve9wuVuToPJe7v6
         pQcaVJ6V6esL+piuM4PHzaXDvtSSZKZW2YMEyfV5kF5K+GEToyKJlU6riyxAwy9tIJtx
         ISNO5lLvpKTp27eygrkMjgHF5pL/Luxu4Rv/Lb1NQmUuI5PcFIkLhYLt7gi3Fxo858zv
         sgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358436; x=1718963236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHopPI0nIM3Jed8hUXyS5ig9GDwCMsqicv3UZ9klXRA=;
        b=lsw63ggLO81FDLzwJIBJGZkww3+0MgQRIBc9Q91NkuNz6/h7G086knzyT//ge5eHOO
         VdmxgqVpyc9FZStaDp5zVdcEZ5A5wHXdXL/4foUefrefuM2zmKrLHzRdFE3tCbWhmv3q
         0CpXcRB33l/cwJZRR+dbaGPiW6Lgwb54qALYd8z6a87ihOXp5HMATFG9AirCyXwMT7W2
         0kRaFpBqBfamnGY2eg0wsz6jL916OYKLfI4z2kojr2gHYU8bnmUHo8GKmSvvzZh5h0NU
         fsgEQHs2uaUzsyJG1ZmpEOOXVKoNaf43CB4DvBHI7K+rhfcVOlcX7H4kJ2fQD5Zcr1yM
         POrw==
X-Forwarded-Encrypted: i=1; AJvYcCXsZeJnz7AKgV3yBq9sgPjOyXk/GqosC5fwD5uA2wBtB1n7nqLQteTGyIOVdoMzvArnCqYW2tdAbd6wdBcaSliI19HjctQYRcfc5rSwCobRIyM=
X-Gm-Message-State: AOJu0YzwAqoCYKj7AyVcl7+ZmyvONM94VNS1nT6Az/rhR7yyDuwXiGng
	CdZ+zNcCpstXbfeAJTMrgs4x94xZJhznJDPx7WKXXIvNAtjOxYrGm4LPp3Ffka4=
X-Google-Smtp-Source: AGHT+IFYhCUuIW/shPa24Bm16cB64oTNa3LMl0BHr5SyTcIcKZ2BVmCvxjUSzjAK1w5nMGYHiOtHug==
X-Received: by 2002:a17:906:35da:b0:a6e:f6bd:edd9 with SMTP id a640c23a62f3a-a6f60dc51ddmr140028766b.59.1718358436151;
        Fri, 14 Jun 2024 02:47:16 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:18 +0200
Subject: [PATCH 19/22] dt-bindings: thermal: ti,am654: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-19-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=K3V6Xak3YOQEHnMj7SlQYHGX0YMx6fkXwr1FCTF4hC8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFwqmuRGwyBRQ3wR18ecSX6kfmBdIXE+Ent6
 hAKRj/Sko2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcAAKCRDBN2bmhouD
 17hkD/9OxjeCJICdurLShHs5yp7HzuR740CrmJrC7McgPnyp8ztY0sSwbQvwGeRuMsaxGidE0J7
 xqY0L6Ioab0oY31XiF1QnateecuxDA9T1PBUpytt4fbqwY10Qo5yKBPBX4OBCNAvwl6BVE2Me5N
 4t7i4RblHCch1dz5REf2XLI28pklsg0B8zZIVH4GGYVP8w3Zb3cg2gpT8O2XBsi5teF4w2pPjYW
 E+yohdnJv/uikgyAzHZ7gYKicgkaA48sLZKA9i+UyrTEYxz3xdC+qIpl0SHa7U54fKUpvIuL5tA
 1ozQi0DgXwHEMJo7Zxpkx823UnjbRynt7urLGgk2Zr+mNj1itWuyxVMw9uku7tJrSwBAIPgSXnC
 1GWhPTu8jS10dmPcl8LxdQMZzbOSiV1hdWeDFvFxEXkY3DHy7EaGTkRMsSqo9jJzOpLq/OxqFSa
 1Bd+lZllAcbV4piQt3dFG2rqt2/HHqyRzp58F8D/YSexdS8VQ2cU9D+Ibljv/xuvluLhIfuoVzb
 T7/0Whyrz0JrF36X67nkYcnekOy+Htkzl3/sFJ1rj2eXxrAEZeGoootoY8/rwk/+eAUHpRhd1YM
 STNX8eI0cUshXtTfkxs52lVyh6zDP4i0jhk1mN87RJ2/sQgDita8xLImSYHC7tTKXeb/34qVmbe
 OF5UQMHSan3bk9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
index 7ed0abe9290f..16801aa78bc2 100644
--- a/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,am654-thermal.yaml
@@ -9,6 +9,8 @@ title: Texas Instruments AM654 VTM (DTS)
 maintainers:
   - Keerthy <j-keerthy@ti.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: ti,am654-vtm
@@ -26,9 +28,8 @@ required:
   - compatible
   - reg
   - power-domains
-  - "#thermal-sensor-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0



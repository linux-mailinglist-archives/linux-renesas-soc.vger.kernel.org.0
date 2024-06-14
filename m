Return-Path: <linux-renesas-soc+bounces-6236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2319088A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 732031C215F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A831A2C12;
	Fri, 14 Jun 2024 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eGeEvKac"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E361A2576
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358444; cv=none; b=FUQhoMLeQ7trCKBQs74ImsTyx3ux3ErHkf0vRioZKLMffSFChjQ/890ruXQgUNhZ+bTKkLgIYWNNJt9bjkLK96yjCp5FjLMojjpnYv7G/BlRTtAnpIWoJY53UPRac0snqD0RvYx2j8QywJZlbIS1L3Af3NGjB5ueHVVJ9x8Oe2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358444; c=relaxed/simple;
	bh=cnRkmLQXvImOJ6clYhAxknZOfk4WOGw9WYVxljgJNd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCsB8IMmfS8HiZdv/aKZaIKv4MUm/B0XQ0ial1BXxHmmEG48z41yVt7zockW2uz74sHihvh2jMXG80mmt/a0a48xZOaiGYMDDv4CMPH1eMcsMvyUYsjhDXhAdgfEdRi8Uv9Qsus2zMOG2H+bQ3rPVj6J2UGd0kMhHcoVcq1+s2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eGeEvKac; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6ef8bf500dso224525866b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358441; x=1718963241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uodfs//bjqrAe2qZ9kd84WsjVyMmGfcvrKfsL+16kuU=;
        b=eGeEvKacWKDsIaOGZx/25taQ/cS0TViiR7bo5u201IWmwfO9MXmtHLzQCRcGCA5IEL
         oFtAP93ZSYu0rC3OEAwKTsa/nkoQl0VhqqSiLnEsBMn2V+9Jjj8zcGRI+BXkdPAvWteQ
         F4l/ecrbqqfnIb9Z2IIYIkMG3vKXkQa3ruWPdFSr9gIi4axOnHhvM68Vdh1FmnMj9XbC
         wgUOc4Yq5KASi0GdpK4Ny8+geO3eXewrOKeIJ+yN4XrXUiIVjwYmt0IsLN2U0tPGLwMV
         YftWN+cJdddVeMI35v8DZ/XCJGq/a2LO8wPFgNeWGV6Witq3CiUZ5hkNvGwIc42ZKV0t
         FAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358441; x=1718963241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uodfs//bjqrAe2qZ9kd84WsjVyMmGfcvrKfsL+16kuU=;
        b=wxSfF87El51ZX6fBnvWDRfffrE5xm42tarezcZifdXdUpPg6Io65eS9efcEo1VjOlq
         AM5P+Nnv8VQnj6p8o60Et8U3YXsWO/is7OV8ozdO4Bp4Bl4eAz2suwIIzv0ZVfwUESh+
         UqGgo6JEdOayQpWOYPmHMC/RTnUlLbM4CUdiWBV2tvC0Upw/szU6jbqXp6TBhftqNLeJ
         ejPCaRSM/GU4ve/+/fctvuga1BU+xMrxSiHWOvc/JBQo8zlq2eqmRrqw/o6Yc7cKa7Tg
         hL1fbXrS8gudWKopHo032G1GaquGHPKAJhgdAXCVVue0Zdt67Q52eW86I6UNHAV6jBtZ
         1cGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHFQmdZ2MK44f/3ouDceEvy+vaa66nFUBdWG0Dd/EdNVR4sKYgn9SdLBavaWSytyYTYc3mHvUGZT3Nz6terlyDS1sA5xDVpSBUJ0mMJyUy114=
X-Gm-Message-State: AOJu0YypL9u5yrmzoHt7XFwxP7RoLJynDUnDr+8WXc+XqgUckKXdhvR6
	iWq0FADiRvW1Oi89CZskHcGzcEaAXI3XLj8Kt5QQpnBfiprxWAj0ShrSgDzWeq0=
X-Google-Smtp-Source: AGHT+IFLXVZv5XBW+iKZMorDGOlMRZlD+plTHxN5ZcGaV4oaBUeSx4OwwCAW6apvsQZglLUiZLZZUA==
X-Received: by 2002:a17:906:4c58:b0:a68:b49e:4745 with SMTP id a640c23a62f3a-a6f60de6279mr130459866b.70.1718358440945;
        Fri, 14 Jun 2024 02:47:20 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:20 +0200
Subject: [PATCH 21/22] dt-bindings: thermal: simplify few bindings
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-21-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4876;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cnRkmLQXvImOJ6clYhAxknZOfk4WOGw9WYVxljgJNd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFyeLfiWLO3TcJQWHtxyb2jlsrVArsQc5HSM
 Zl8d/bpA9uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcgAKCRDBN2bmhouD
 14q/D/wPchU0i1VJXyIyken/BpDy3CFIoxfe1Lx6ww08lDDBl6vxpB0QaflHSCvUb6oJhYLx5XC
 KQWlbHOynfTXswZGltb7vmbxKtQZKkAuceB/+6DHHkHVvJSfygqXTpFwbERstRbVdvrkm0AAxn6
 c6feUiuenfE5zkU/hdbvkKiJcodB6VehCGu6gcWyxCi66DbLYb2tZeACluumArIm7xZqfogg9CZ
 NAg8xL6WQwY+D0V4zDLageaphLcGdZNLe6M704GpS8vvp3MATTujqASLJDPu3+g5syhZR9Th/+4
 ioQj88CRX4dOOOTFbMLjaHgPb9zbFwilrfsCSQFnjKZk3PoB1IPqoIiPE2hYrbONHxgOIRJfnY0
 oYZ3dksGJEjv6eGF5a3+bWnW9RuFzW3l8M7VY6ZDfUQ1eRLSu8ZR2fCN455j6SSC3M/VioNDPi1
 /NqNoR6pA2KvS5eSU5z/weJ1XMQk7n2xgL2nsrA38ni1ljmOC5Q2oS/jZIzbpHE3Tv6Ud1/DMHv
 XEJ4O/YuwHiNNigQ8l5CgZCER+b0tvL4jTWX2XrLXP7uN4zbEBz+fBrrtWY/5sCM++WwlYKpz09
 VUQcTb1inEie1Ek8CxxovMd9HIe2vrwVJr8D4KDpvt2NCCwln+qHv5tRXUiDeHOwyyVMEf/34tB
 BEM3vs6dT6iX0RQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify few bindings which already reference thermal-sensor.yaml schema
by dropping unneeded requiring of '#thermal-sensor-cells' and dropping
assigned-clocks properties (core schema allows it if 'clocks' are
there).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml          | 1 -
 Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml   | 1 -
 Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml        | 1 -
 Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml  | 1 -
 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml  | 1 -
 .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml         | 1 -
 Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml | 4 ----
 Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml   | 1 -
 8 files changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
index 267a0f423504..32730211e15b 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,avs-tmon.yaml
@@ -42,7 +42,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - "#thermal-sensor-cells"
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
index 2b6026d9fbcf..ddf0f20e5285 100644
--- a/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/brcm,bcm2835-thermal.yaml
@@ -34,7 +34,6 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
index e02d04d4f71e..ceef318668bf 100644
--- a/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/fsl,scu-thermal.yaml
@@ -28,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
index ca81c8afba79..79e691b08341 100644
--- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
@@ -38,7 +38,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 if:
   properties:
diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 331cf4e662e3..0259cd3ce9c5 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -99,7 +99,6 @@ required:
   - resets
   - nvmem-cells
   - nvmem-cell-names
-  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
index b0237d236021..19bb1f324183 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
@@ -197,7 +197,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - "#thermal-sensor-cells"
 
 allOf:
   - $ref: thermal-sensor.yaml
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
index 972d608ddf95..63a29a1f7fe6 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra30-tsensor.yaml
@@ -48,10 +48,6 @@ properties:
   "#thermal-sensor-cells":
     const: 1
 
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-  assigned-clocks: true
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
index 5f08b6e59b8a..30b22151aa82 100644
--- a/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom,spmi-temp-alarm.yaml
@@ -42,7 +42,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - '#thermal-sensor-cells'
 
 additionalProperties: false
 

-- 
2.43.0



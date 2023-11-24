Return-Path: <linux-renesas-soc+bounces-226-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5197F6E56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 09:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD38F281399
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Nov 2023 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B47F4427;
	Fri, 24 Nov 2023 08:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6SvHPkM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59E9D68
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Nov 2023 00:38:08 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9e1021dbd28so216556566b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Nov 2023 00:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815087; x=1701419887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYqzi/+XlQ/s+DJqiECuwYHNpVRCGbZDGfLfIlCHIxk=;
        b=b6SvHPkMkQgell54qC4wOZhJcYM2VQ17kjDJhwTJT0v3CLuGY1+6P9pBlYJjuTARUK
         2nq5tNdbcFez11QXjUa9xbVQyglAiOGlMwIIsfesLy3GX6HoBu1+ECheIN6qRZpLnRyY
         bC+PHSwZRH3xwPF+OgGA5wegoRVf0aCd60fCBUZcdgvDEvfUWEKcdSbUOwvDLR09WgEN
         9kHAbsZdws4NpHRvOtzK0FwPCnh4GW+En4NFITa77WLhRKQP7Qt9CJqNbAORr+zXRJNf
         W1PnlnCRCG3y6WbGgUziDgmPB0h+JAAJK/kK/orsNA2nD4wHIrw+i7TZSxuVbmve5z9k
         A5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815087; x=1701419887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYqzi/+XlQ/s+DJqiECuwYHNpVRCGbZDGfLfIlCHIxk=;
        b=PC9GWjmZlakG2WkibrAXyOT17gU6aR0FvFGsdt+FE4qsK4BTaqBdtKWMUkUtZwWVa+
         NbJ2JEhSFzoJDIEZoUSsO2cC9TzvUaqz75fJp8zT4gVQXQXgm8H1CtGi/hvV9DCs3IcO
         ZsKomYECe/XhgXm7xWNB6hg/jZ6zB9YSjC3MPz99bbCI10sZobT0WruaaixUSc3aCOqA
         j495kukPTnIY7gKLVfOtA7BQwajpkSaZUKZLimPmXQRj9rZ52OfOTREfKWvUWL9x9QsQ
         VMaeewtEQ7CGKW53B73aN7LQ23+uy36Cdam/Tm7SqCyeAtiY4bUzcCpeYbIwvgd99Zhi
         N9+A==
X-Gm-Message-State: AOJu0YxwpljejjLgjWXpq5o+KXenUjaf9VrGzaDWg0ky76euJkWrJT6F
	+deTT1BF9/h0XQ2MlNjzSGEsHw==
X-Google-Smtp-Source: AGHT+IE/6AvzGFpXeoUuooNv8Hkv3iVH5oo4ItGvDeCTDaiH0at3wQHZPjucHgaXdu9YSCtq8CFIyQ==
X-Received: by 2002:a17:906:2756:b0:9bd:9bfe:e40b with SMTP id a22-20020a170906275600b009bd9bfee40bmr1324090ejd.75.1700815087137;
        Fri, 24 Nov 2023 00:38:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id ks20-20020a170906f85400b009db53aa4f7bsm1781574ejb.28.2023.11.24.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:38:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Seven Lee <wtli@nuvoton.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: correct white-spaces in examples
Date: Fri, 24 Nov 2023 09:38:03 +0100
Message-Id: <20231124083803.12773-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use only one and exactly one space around '=' in DTS example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 2 +-
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 4 ++--
 .../devicetree/bindings/sound/qcom,wcd938x-sdw.yaml       | 4 ++--
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 4 ++--
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 8 ++++----
 .../devicetree/bindings/sound/ti,tlv320aic32x4.yaml       | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
index 3380b6aa9542..054b53954ac3 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
@@ -135,7 +135,7 @@ examples:
             nuvoton,jack-insert-debounce = <7>;
             nuvoton,jack-eject-debounce = <0>;
             nuvoton,dmic-clk-threshold = <3072000>;
-            nuvoton,dmic-slew-rate= <0>;
+            nuvoton,dmic-slew-rate = <0>;
             #sound-dai-cells = <0>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index 4df59f3b7b01..beb0ff0245b0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -201,9 +201,9 @@ examples:
   - |
     codec@1,0{
         compatible = "slim217,250";
-        reg  = <1 0>;
+        reg = <1 0>;
         reset-gpios = <&tlmm 64 0>;
-        slim-ifc-dev  = <&wcd9340_ifd>;
+        slim-ifc-dev = <&wcd9340_ifd>;
         #sound-dai-cells = <1>;
         interrupt-parent = <&tlmm>;
         interrupts = <54 4>;
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
index b430dd3e1841..7b31bf93f1a1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
@@ -51,7 +51,7 @@ examples:
         reg = <0x03210000 0x2000>;
         wcd938x_rx: codec@0,4 {
             compatible = "sdw20217010d00";
-            reg  = <0 4>;
+            reg = <0 4>;
             qcom,rx-port-mapping = <1 2 3 4 5>;
         };
     };
@@ -62,7 +62,7 @@ examples:
         reg = <0x03230000 0x2000>;
         wcd938x_tx: codec@0,3 {
             compatible = "sdw20217010d00";
-            reg  = <0 3>;
+            reg = <0 3>;
             qcom,tx-port-mapping = <2 3 4 5>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 018565793a3e..adbfa67f88ed 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -137,7 +137,7 @@ examples:
         reg = <0x03210000 0x2000>;
         wcd938x_rx: codec@0,4 {
             compatible = "sdw20217010d00";
-            reg  = <0 4>;
+            reg = <0 4>;
             qcom,rx-port-mapping = <1 2 3 4 5>;
         };
     };
@@ -148,7 +148,7 @@ examples:
         reg = <0x03230000 0x2000>;
         wcd938x_tx: codec@0,3 {
             compatible = "sdw20217010d00";
-            reg  = <0 3>;
+            reg = <0 3>;
             qcom,tx-port-mapping = <2 3 4 5>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 1174205286d4..0d7a6b576d88 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -497,19 +497,19 @@ examples:
         rcar_sound,dai {
             dai0 {
                 playback = <&ssi5>, <&src5>;
-                capture  = <&ssi6>;
+                capture = <&ssi6>;
             };
             dai1 {
                 playback = <&ssi3>;
             };
             dai2 {
-                capture  = <&ssi4>;
+                capture = <&ssi4>;
             };
             dai3 {
                 playback = <&ssi7>;
             };
             dai4 {
-                capture  = <&ssi8>;
+                capture = <&ssi8>;
             };
         };
 
@@ -523,7 +523,7 @@ examples:
                 frame-master = <&rsnd_endpoint0>;
 
                 playback = <&ssi0>, <&src0>, <&dvc0>;
-                capture  = <&ssi1>, <&src1>, <&dvc1>;
+                capture = <&ssi1>, <&src1>, <&dvc1>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml
index a7cc9aa34468..4783e6dbb5c4 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml
@@ -90,7 +90,7 @@ examples:
         ldoin-supply = <&reg_3v3>;
         clocks = <&clks 201>;
         clock-names = "mclk";
-        aic32x4-gpio-func= <
+        aic32x4-gpio-func = <
           0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
           0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
           0x04 /* MFP3 AIC32X4_MFP3_GPIO_ENABLED */
-- 
2.34.1



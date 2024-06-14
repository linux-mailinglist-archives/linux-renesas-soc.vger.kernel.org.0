Return-Path: <linux-renesas-soc+bounces-6215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36180908806
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D3461C2141E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93E9194132;
	Fri, 14 Jun 2024 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H/IDITRX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9396A1940BC
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358394; cv=none; b=P6wh4G/WEb79DMuItE1noqm8qqyupRmfqmmgmN5Jxildi/t7M0FYb6MIVwSZKOr2AarSc7zF2E0oyb66MbA4vQI7I+rVQlS7Jnej7JXTCwMsk/xshMfkfrHrOZkUbB8vjbUbfF4Gb9ZhE4yF+GNCvymKHlymul31cUr5LskDx9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358394; c=relaxed/simple;
	bh=p3XfyX3kLTCraBOtA3bYk0nZWnKJv6DRa4Xv9JXFZPw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZlScIQj/7eG53p3FvmBtPAPojGZGRNG/lS34nCjUKVVTDUDp5JlDHH1VIJbRCvt7TvLPWcWc6/H9tY2JQit5h3CbCaqEPUYTe5pjAMh16o7co5VIF5y2HQj2N+NyDCrnRgRGgfGeXz3wVL3CixoECtz4ipf2ezF5zSEjaUrvt2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H/IDITRX; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6f0e153eddso266673466b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358391; x=1718963191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3E6JlKgnDrJSPy23T3qrpFv918sUOaM5ecbbXYgrI4=;
        b=H/IDITRXaQ+d+nMKUZhIahWqU7wFlPShChBnHyolqy/0A4DR6DKP8qGMKEa8z7xPFd
         X4DNlSOhzlOhCZPKLcDTpMY7FRSGjT/S8PfYeA8DaxAQDx+OGvLQRfGnCpEuy0xzoaKC
         PmU7d1V2G3++Xx9ZBvl2MF/bsgFFQ1xRl7sx5PlBc8aaRzN73R42efo2j1JtkuL/W02U
         e96jLtvAqwR3CHgJV26N/4Vkxdx44+ArmUH3IOIa/0FL1yN2AJrQ4WIOJE016THppN44
         +QTzw8ehECPICP1BpO49yDuBJ2sJtPHxrVwGHbIWpznQTiTsDI9QTym31DFxi0LENcO7
         rYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358391; x=1718963191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3E6JlKgnDrJSPy23T3qrpFv918sUOaM5ecbbXYgrI4=;
        b=bALsGT0txShdPgsekPpNpmC0pX6/A1X8luDhVz7iNFMfUyzq+AFKgF+R+F62TG70bo
         C/UjxI1rZLecU4sTptupLttYkh0Tjf9vyJ5OHItvBp/dnPLCUe9DjO7sNZk6U3JuNCAX
         HghEFXBoua12EhPwcvx1mv/oa8I2ik9C6nAKWQ6TR50cWTzffqDlMwfFI73UYF94OoDn
         xdeYjH7yZvEDNToO+tomMwqtPI36jAPvzvGFg1z8BE5YuQlpfZkM6z+XnS3x4O0dFYyV
         DH1Jsbb3wby64ZdVrUpRSDxIPM95Vpp3THuEll12GBY8lqIchB3vOt/GrfWgjgIgbObj
         uc3A==
X-Forwarded-Encrypted: i=1; AJvYcCX4fAMG8LQuP2s1qil6v9p1tiia5kNOGlIutYq62VwExt0X3ITIUNOwpu4wBerL3mkkc/KDotoa+90yptI2ADr5r2B4UYtb48165pogsloM/ww=
X-Gm-Message-State: AOJu0YwANjNCT6bCBxkjl7FzubGtI0J1K5mDWjIGpI3Wg9ouYKk2ap04
	hYP4C37RDcCb2fH7c1oM3KW17+LMqIjfRgu73VLf/ICg1kOGJKI/Ykz9hI+azno=
X-Google-Smtp-Source: AGHT+IGov8h4HWz1vwXrMuZx4d9Kl8tLftrHfY/R0lPxIE7iVJTda8tqaONdGVeUAi1qLy3sNijSsQ==
X-Received: by 2002:a17:906:d8b2:b0:a6e:fc0a:efaf with SMTP id a640c23a62f3a-a6f60dc89edmr143181966b.49.1718358390766;
        Fri, 14 Jun 2024 02:46:30 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/22] dt-bindings: thermal: few cleanups
Date: Fri, 14 Jun 2024 11:45:59 +0200
Message-Id: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFcRbGYC/x3MQQqAIBBA0avErBtQsRZdJVqYjjpgFhoRRHdPW
 r7F/w9UKkwVpu6BQhdX3nOD7Duw0eRAyK4ZlFBajFKjO3Hl7DiHimekspmEJqXdoxbSDoJGSV5
 B649Cnu//PS/v+wHlGnZRawAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3782;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=p3XfyX3kLTCraBOtA3bYk0nZWnKJv6DRa4Xv9JXFZPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFZ2k3GJoNNLFeKNDEm6wol3YrFjWScB/fEO
 gMayn0IsTaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRWQAKCRDBN2bmhouD
 1/1iD/0cmbLdy7BRDK+hdAHoMuk7AzFr49JqiJx9VLENFE1VKTi9ZqBN8aDoSCByUeWGR0qU+4q
 KEogi56HJQfUf74TNd3+SnFy0Sn+vjwhHn/CGv+mMBvy+WBQcLFhAVq8OPFrC6ZaHnMw+twYqdZ
 cJztoB4JHHpNSh4utMWjZ/1dCwew1GKPFztUKT8kK4OUhxotGA+oTqFklvuMza1LUOitasdXcWE
 NO5DOwXa3khj+DvmylZwD9aItPM+9lEIrSe1ZI7Im3INY+QlThZu8/jXgvQShu4wMFo6ZiFcGSf
 DZQw22RWE9MZfA5rprvMGcHRONNxt7Bj9+XsmFTvsgLNUMtn/4cgbR+H6XB53fYsCXd/U77WruG
 5FCXdX04NfpF63KybtlPqGyse++v9DRIjDqOl+YaajBVfY5AIWnNtWpkqo0pHDjr8imiQP7O9RM
 uJCHWeyn0PwumkruVCJHJ6atM6UxO20yBQIoccFirseDL9dbds/B7ghSRppjIKrS9caS0Zu+XK/
 i2UMwVJf+O4CyDzjLhIUmKwCDk2jNSqCbmUvcv3F5+o34uhViJYX6Lq22U/Nd7PS7LT1uFK5pNg
 xGjQ4xLDpRUyKC0lPvWUtf8qn7rOAsuoc6ELE0cz7nJbX0rDs1XLZl4fdMI6cRnxhT0CibGBy7L
 6PdmGjRdB0YzBJQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Few cleanups witout practical impact, except maybe the Amlogic schema
(bringing required cells).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (22):
      dt-bindings: thermal: samsung,exynos: specify cells
      dt-bindings: thermal: amlogic: reference thermal-sensor schema
      dt-bindings: thermal: allwinner,sun8i-a83t-ths: reference thermal-sensor schema
      dt-bindings: thermal: brcm,avs-ro: reference thermal-sensor schema
      dt-bindings: thermal: generic-adc: reference thermal-sensor schema
      dt-bindings: thermal: imx8mm: reference thermal-sensor schema
      dt-bindings: thermal: nvidia,tegra186-bpmp: reference thermal-sensor schema
      dt-bindings: thermal: nvidia,tegra30-tsensor: reference thermal-sensor schema
      dt-bindings: thermal: qcom-spmi-adc-tm-hc: reference thermal-sensor schema
      dt-bindings: thermal: qcom-spmi-adc-tm5: reference thermal-sensor schema
      dt-bindings: thermal: qcom-tsens: reference thermal-sensor schema
      dt-bindings: thermal: qoriq: reference thermal-sensor schema
      dt-bindings: thermal: rcar-gen3: reference thermal-sensor schema
      dt-bindings: thermal: rockchip: reference thermal-sensor schema
      dt-bindings: thermal: rzg2l: reference thermal-sensor schema
      dt-bindings: thermal: socionext,uniphier: reference thermal-sensor schema
      dt-bindings: thermal: sprd: reference thermal-sensor schema
      dt-bindings: thermal: st,stm32: reference thermal-sensor schema
      dt-bindings: thermal: ti,am654: reference thermal-sensor schema
      dt-bindings: thermal: ti,j72xx: reference thermal-sensor schema
      dt-bindings: thermal: simplify few bindings
      dt-bindings: thermal: cleanup examples indentation

 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml |  6 +-
 .../bindings/thermal/amlogic,thermal.yaml          | 22 ++---
 .../bindings/thermal/brcm,avs-ro-thermal.yaml      | 22 ++---
 .../devicetree/bindings/thermal/brcm,avs-tmon.yaml | 17 ++--
 .../bindings/thermal/brcm,bcm2835-thermal.yaml     |  1 -
 .../bindings/thermal/fsl,scu-thermal.yaml          |  1 -
 .../bindings/thermal/generic-adc-thermal.yaml      |  5 +-
 .../bindings/thermal/imx8mm-thermal.yaml           |  5 +-
 .../bindings/thermal/loongson,ls2k-thermal.yaml    |  1 -
 .../bindings/thermal/mediatek,lvts-thermal.yaml    |  1 -
 .../bindings/thermal/nvidia,tegra124-soctherm.yaml |  1 -
 .../thermal/nvidia,tegra186-bpmp-thermal.yaml      | 12 +--
 .../bindings/thermal/nvidia,tegra30-tsensor.yaml   |  9 +-
 .../bindings/thermal/qcom,spmi-temp-alarm.yaml     |  1 -
 .../bindings/thermal/qcom-spmi-adc-tm-hc.yaml      |  8 +-
 .../bindings/thermal/qcom-spmi-adc-tm5.yaml        |  8 +-
 .../devicetree/bindings/thermal/qcom-tsens.yaml    | 96 ++++++++++------------
 .../devicetree/bindings/thermal/qoriq-thermal.yaml |  5 +-
 .../bindings/thermal/rcar-gen3-thermal.yaml        | 69 ++++++++--------
 .../devicetree/bindings/thermal/rcar-thermal.yaml  | 60 +++++++-------
 .../bindings/thermal/rockchip-thermal.yaml         |  5 +-
 .../devicetree/bindings/thermal/rzg2l-thermal.yaml | 41 ++++-----
 .../bindings/thermal/samsung,exynos-thermal.yaml   |  3 +-
 .../thermal/socionext,uniphier-thermal.yaml        |  5 +-
 .../devicetree/bindings/thermal/sprd-thermal.yaml  | 47 +++++------
 .../bindings/thermal/st,stm32-thermal.yaml         |  5 +-
 .../bindings/thermal/ti,am654-thermal.yaml         | 15 ++--
 .../bindings/thermal/ti,j72xx-thermal.yaml         |  5 +-
 28 files changed, 230 insertions(+), 246 deletions(-)
---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240614-dt-bindings-thermal-allof-401c50e61ef2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



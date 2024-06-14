Return-Path: <linux-renesas-soc+bounces-6235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A685490889C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26D2D28E31E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDE71A2575;
	Fri, 14 Jun 2024 09:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLj/vCa9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A25192B9D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358442; cv=none; b=sKefgoCPzqRZeUDnSL2zsgYq3Xbg4pZpEQhAy+in/BoPA+ML8ksJYI48I6gfpcLxcDtSm2dvfS1ko/3+g6+u4JYmbYbLzX13eS9OVIldagV+xPVpUGSR6boUwkO7mQzhZY+70XcQdFLIUTij5gGZNN7brANL1KQbjRAOdAvtvwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358442; c=relaxed/simple;
	bh=ag85uAiG2r/HEMDYvaptkcg1a2CH6uLufrgsLuM2IrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeOdZ9XCKxRNZEn3AEr8/YjYJ52zo3lboQ7k5SnGtYwBHX83clqarzeLxDxxTH2d2tgitU4xvUQlGIGeT5TGrZczDPEDZb93bbkJ8d+MLSYu1NeHlnOGPOUFeLwGSXuiVZcQCsAO2FKLeJlh5sKE6I5hvP5ZCCWUAeQEGs2A048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLj/vCa9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57c7ec8f1fcso2254854a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358438; x=1718963238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=;
        b=oLj/vCa9lO7rlupmtYk4EGPzezg17gxQDq5CNCTf+g5BIV0DzU6or3SPtPGoxt9OLf
         Be3ksHWtI3PHqCK/qek7DiXQ8yeojo4qjHrFktwnZrNbFaPz9vIOK8dzaKpbzgx2z0dv
         WjPtub+fGvtwNn5cbslssePDsrGmLkfnx+yvLD6MSHDg3iXe8rx4lwhnU5J14yQTCPwW
         nm35HVkMWr4DsRRijFCPiDs8BewVBK676ZK/aX1i8X0ycxEvRG/FQ8NkUSJsXsYPGnzt
         dryBfHAVR2RVAhHfA0g8Ee3TCnOncgAWxtt+qnGFl3eob++fKz8Y0dKfWhDP3xZTSPDx
         Pe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358438; x=1718963238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2AvwYfuogssIrdqX8bNR92FjKreYxm98m5VAFWq1yo=;
        b=ME38fynm7uz3xl6XDIPrOA1WBSjUSg5uRkzMzsWJ7jwTlcKcTeeLaIssx/RJgFUbAt
         bSrcC0WbJhmnoDhzzQ6NNQKzac7f1bO6QkQSq4MVLCAOdFUqSbBYc2dP2q/9QDXdiTLq
         gBerwIFg8tkPNRi39aNhfKGBWN7PhcWMHtrfc2Q4uW8ewHKQmSTLBoxUKvVhVirR9o72
         RpXtb9S0ZyzSe8BtSHhIx5uNYDw7sbaBo7GaRIqjrxLrm3tNcy+wEtNYEukRxDEh1tTR
         588BcI5MwhNnLVi4PLeWO/ANTH0MoLTedlRsYRncVwhN4AM2CPjM9Ktaaer4FDHpnIVG
         D5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUofBGErhUOwa5EdYVE31vT/XIZE0zZNHsHayuJwGG29gEwCbP0ioCvu+KoHhVG4zkw2g99jRIpf57Uwn4m+5IAtOQ6UueOEiy0lspe2UGS3Oo=
X-Gm-Message-State: AOJu0Yzo7Fk3UADD5aLrGnQMAHk/vgj+r3ilOII4Kcy25G+Am0+2GdeN
	uNAq4USjYdyYaZp21QEvoBSro83HlfaeXe5a+tw4/byGFZWNnvg9YDVYeQr9HX8=
X-Google-Smtp-Source: AGHT+IHImE03me+jBXAaJKDis3LvJaHdcyhORbJZDZPs74Uw4HneHqZI29aXqpZb3jL7FRfyUVcimg==
X-Received: by 2002:a17:906:f74b:b0:a6f:2605:aaaf with SMTP id a640c23a62f3a-a6f60d204a7mr143354066b.22.1718358438479;
        Fri, 14 Jun 2024 02:47:18 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:19 +0200
Subject: [PATCH 20/22] dt-bindings: thermal: ti,j72xx: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-20-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ag85uAiG2r/HEMDYvaptkcg1a2CH6uLufrgsLuM2IrE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFxyygP0KDRWxDno4kM9DyJJF36q0Pj0JLXC
 R5ZthscE++JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRcQAKCRDBN2bmhouD
 10MhD/4/36ep6K9C/2A0+yLh/7h03kLK7tqhV1a2oEMiR/3bLKcpn6umQP6r9gvpMHFlRX5wP7v
 2Qcy7ULesoTVCRfLz4eewatjk+KaHWQsvPJPW3mM0/NcAviaPhVr4Rhx8aGE4qMZvaATX/EFkos
 sdCgL3T2E1K7AQatgcC+1b+PKDToD4VSvpUhUlBzal4f/lh5VFfaPlTkFL2hXw8RqukTXlnjwGV
 Z2dOi+pr+iLn4vPMTgOjHlqHYOY+Fw+LFfy0eGipU38yT3nZhlQ31rsNf3X6DNHQ8N4ZP4JWQfo
 azTKXqmkvo9KhPB1EyU3x1F3/rlnS9RNBFqis1F5jfUByE3A4wy8b3SskCx6A7KcUmHThp5zZey
 +vSWFb21wO7P4/0EM4SrAxnaRrSZ3EcyxVjx5jJlX9gX43bj2stJbhNQXNUKbMAVvz1tlqf8xX3
 GildL9Wcxj8bvNFfcGI6IrozJSx9uVjfA3xFZdHpjC6HD05/qSDT2Rts54sh8RhFhEGpir4fDaC
 gf3Yu6j3t9hhKWwwOaELcEKJw11d8RG23XGWH+voe9MnFlR3dGPlHvIAhq5lvkvvXNc0r9PLnj+
 V4Qlq76yHruzbODm+mWzdVMIu3SBsg1YxnKVpDzMgR9XhgoI0DAS8Kl0elUIaSplgkIG+amxYMv
 ym9A5pI2M7JT22g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
index 171b3622ed84..82b77b9795a3 100644
--- a/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/ti,j72xx-thermal.yaml
@@ -22,6 +22,8 @@ description: |
   Temp(C) = (-9.2627e-12) * x^4 + (6.0373e-08) * x^3 + \
             (-1.7058e-04) * x^2 + (3.2512e-01) * x   + (-4.9003e+01)
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -64,9 +66,8 @@ required:
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



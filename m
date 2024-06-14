Return-Path: <linux-renesas-soc+bounces-6233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA990888F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 746F8B2556A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDD91A0AE4;
	Fri, 14 Jun 2024 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vBmGpj2A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B351A01C8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358437; cv=none; b=YgEKCpk0F2Ngf841FXhxttE5KlxiV551mIlsgUdnYamRUgAaVjt0oiKTXXW5PB9XPUuuW9Db8sSxmJOOiot47gC1VtJFf5CSPvUZs387DmbbvPCWLaVghU2+l6aWuyfwxYBxiNXLVvMqGLeAMtmgHFBSAfG+M71SNjlHEbpt4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358437; c=relaxed/simple;
	bh=3L8KlXex0s7qoR5YcxPA2jc6XZ2NrZwE3MC+jn02OI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5F2noWSGxujwKTM7rXMz2k0MBjVPmMFvxyJF3nnYo79OGuU0jEJZoD2TK2t4oGjted28+DduUkjMgSYMMGh15oOwlLAr1TcCmikTz1q7+x9eoB+cqmKPPt0KLP/1VkOELscWd3ymKORMhP5CF5STYSd/ebA2cx1KeEc+mSyrPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vBmGpj2A; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57c83100bd6so2379212a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358434; x=1718963234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1L1hUKhvb8qMRf1UscQN2W9C1hTFJkKm90Yn4dmB8k=;
        b=vBmGpj2A1v6HxfRSP0T2TNGtzS1gX6yU9usMdhvsMbEbam3UX7YrJU47kvm0+4oqkI
         b2Fzr8YGlBTejYqFvFSk6m8qBCKromLUBjeq0IiljjJ3JIY+x+o5dQX1fdMWYjkNiaS4
         l3rDX70yfVlM7eTwjAgNKxAjuT9cCyhHp0875lVRbHVpSc+qp4bNQZNz9A8ZpXd44FdO
         udRRmoAPmMmVwYfJeF9vjsyBue7sfx/HUn662IuniEp/T4o2woU4kW7iezE/p+yZfwsh
         zfQqjhCjrchW3HdUt+QpwIV5qH5N9ehY6zP60ug1LAqvLTCn2t3zlMzuHDEexZlopeAW
         3USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358434; x=1718963234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1L1hUKhvb8qMRf1UscQN2W9C1hTFJkKm90Yn4dmB8k=;
        b=KI6JtXZEIg5erEvdcD2n7ZNc92meews++2VuMc3Ywucx2ZPxrC9LKOyVYsMwdI64rO
         BjFZEu1xTkHzCxiAqS8zkm4eWLJ0w32Cy+3tnSGCjJBgtGN2yVk0ky/2vxc0aXTjTbQO
         BExxTVmV8KM/3ua+8g+L7Ii96+JkfznKSCvxHyvjMPyxF8uw1uOdgpwlmELgJLw+MkQi
         CIblf83K8eldXrwnd7bWlh67QeZrfpOC6gnAlYHldyeVeTH1gzEChUAnU297jgWflpyc
         FUpoAAeA0aX7/p7AwBfKSzqiuY7BsidUyK847cV5SA3TlQPX05TbHeLh/rlgIvYiO0v2
         XS2A==
X-Forwarded-Encrypted: i=1; AJvYcCUV/GrlX8Ug/drKnBN6LyFw4Nt8LX0AGQOuPTeH25htDrvgA0HEsseIZ8UQTspiwD9/yMzXIDdUFlq/WCsoFcdej/kkCh+Vc7tr/TOlCrNxd4o=
X-Gm-Message-State: AOJu0Yy0tm/LVOySMcmQ6MnAPyZw5MPvu+ToHL1iIH70CECv4MOv665I
	+Uauee9vNUKxSHzAyVpgXxwIz20xXXgOcY6/ZMFtrKbFfJpIhYwFx4ectvwaAp4=
X-Google-Smtp-Source: AGHT+IESUfkXPP4PfG4NWjsxbxp6NlwMJWMU5nP5/by69p2zzzbRxPpfOQIPY19suOJaj0e0fGtyQg==
X-Received: by 2002:a17:906:1c09:b0:a6e:fe97:b33a with SMTP id a640c23a62f3a-a6f60d27c9bmr135962466b.29.1718358433828;
        Fri, 14 Jun 2024 02:47:13 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:17 +0200
Subject: [PATCH 18/22] dt-bindings: thermal: st,stm32: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-18-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3L8KlXex0s7qoR5YcxPA2jc6XZ2NrZwE3MC+jn02OI0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFvVBZGRKV/QP0IvsM9xQ7ICCZWH+Dk9XKXT
 QeAll8jTOyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRbwAKCRDBN2bmhouD
 15jEEACAeCBwooCDdYSgCgknbyYtJysaUKzyYrYH9LKW3iH9vLFvBYECLMzvA/BwOarmAczsVAn
 fTlAGnKMVex9imbHWzOiNhf5ZXJTAyeGmdo63wQlftWI9gXXCb3Xc6Lv4UOwCRCd31OgT7hbyzZ
 wA3bUPn9xpqvEw4ehdlFsQkxanu4ntK1/aFsss1ruH8J6Bwio6yXlukjniaoB4tjPouPwRHLEau
 qnnIw5VWJwicO9aMpZn7cuhafO+WIXlSvQ35WQrlsT0dCdmwWa8ghuHOMX4kCOgVsTlAbsYhZsf
 8TXEFNmKAij2Q0paybkFaDqAUJeLHQ9KpBaZMmCqL2IeRqn8pftQuPiOtLn/g32Nv8ltQ5Wup9B
 FGG02Dke9RBEGHc75ujsQMC6I7TMWUcslAcU0oTczDA1j/7mMe9pym1p1A4OepLhZWuJCOy53kT
 TqXiJ+AGHI7NYE0i1YtdiTME5h5mx4xsV5p4wEgKq83VqZG3f4Um+sQfVhJyPll6dchA1xVh6mn
 UHPg8yItoeRub88Q5cRPGvwDCf9PdtNQIURSCXSK0p8znfBo4uVgVpGj6VLJqFtei3hEw3L/Czi
 WJC6lRFVr4kIKqTKckckW6ov1GA1SzZd+uPLlAWlY1dK7VkzLkh1M3jmGs6xCjm0nsb+xIJ7PKs
 lu9YouNtXcCBKHQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
index ab043084f667..1c01a80a0cdd 100644
--- a/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/st,stm32-thermal.yaml
@@ -9,6 +9,8 @@ title: STMicroelectronics STM32 digital thermal sensor (DTS)
 maintainers:
   - Pascal Paillet <p.paillet@foss.st.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: st,stm32-thermal
@@ -30,14 +32,13 @@ properties:
     const: 0
 
 required:
-  - "#thermal-sensor-cells"
   - compatible
   - reg
   - interrupts
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0



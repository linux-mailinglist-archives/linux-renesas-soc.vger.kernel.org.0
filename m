Return-Path: <linux-renesas-soc+bounces-6241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E086908A14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 12:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936AB1F2103B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 10:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48511922DF;
	Fri, 14 Jun 2024 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="teEWlvVU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97FC193091
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361328; cv=none; b=dFsAf1JzaYuvxwpwXweoPaCvz31Cuh87FKvc6yoG15Vhei5hTe36dIXSKmHRTnQC2H/+EVqD6iY08ZBJ5Ux5qLxxp5gELtFC/3F9yMb8si7ZckYllpCUu45AOvCRURRd54d4GWfPZImIr7IAi7BJdNGE0OmPsNt/E7ineXhrCjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361328; c=relaxed/simple;
	bh=zQTF8f1f4E4offgF6AppLKOcBdlWwKz4eWbWjGZGOSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+1gGGnUCFbelWNzimG8j+xKkePjgJR4SKyEgujep6jSmpaggNDrXy/nFPKE5pugEblHvJqMcap1GPwSQ8Pca2aBq3mvl7WrzvbgVqRidChrH7hPZ4alzM8/G/JAvS2adQfqBMFxtPmpa3VmeF04+/qMCcaCaINLdoyJikcTjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=teEWlvVU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b78ef397bso2885556e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 03:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361324; x=1718966124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gi0zKyxT3hCd9nb/MhrUUh7myaChKF1I5PdBUyc2GXs=;
        b=teEWlvVUTdSj7i/zCVjz2AkzvoRghq+p6jDie657GiaKHfA5G2ESEp0cwqYDYvgxjq
         6Am5IXyt85BaN35MFgVOxdOTJoJ2VmZfWBFFeIPeL7YBZRm4aRuIKrpKS+aoYYCUUHdP
         Y2vHvW5sETuPwhJIzrQusKaEceMr1WfGFkqhrfqv3miZJEumFmj0oKScjz1jsTa8+pEM
         FFYlZgS3DQH5XzcsGK4vpnI50gbD+K6BQ42ml2+4B9oiZRfHLWmKD1IIKPJr/tjwHyyf
         6ubFH+QzWNqNbU7jhqwc/AYEInvFylWg6Fjf/H+4nZGtc7GX+0ZgUoAuURMZuiIkcUwj
         HtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361324; x=1718966124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi0zKyxT3hCd9nb/MhrUUh7myaChKF1I5PdBUyc2GXs=;
        b=NCBOK+Zff63meB9whYujWfaGK+Vt7gx+SdW6vn6HuiprDEu8G0FthYaBJU/Xzdn3bC
         onnFqVKVDfxtnFxgQAWB0usmIBYH0MU0i2F15edlEm2rrwrP0AKGUxIhIReVBXVWGicr
         dYM5+rUq4ODJWGn1aZGRGAyFcM1mPSa78G8gMRXIcbal1cutBIfSR7ODpob2VHfh2DkY
         3L2dCfan1q4gTiUKK5kuaelMGOmzMcxye/caElXb/h8GXcCV7FZ7XqWFyi5SV9XMTCu9
         uz5vAToXSXF3n6lSkJD+1xzM2NwBnziLusHGqR2+hZ3bz3rcfbmjsbxCRT2NVZIHd8P2
         73WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzGUNutIONDy4Mq1ahdAl3V2psi/ij2mdeMm54cuNJkQz/pee3TNRIpscPPYPMpusLuYkQTc2ffGbYbQbRkRzQrVvaanec2gseMRTcKoZwxHE=
X-Gm-Message-State: AOJu0Yx/M0kMt+ZBiJSiev+jA6pvLod3giGeIQ6ven6JPpegCHedsBYH
	lta5xjlKhsudsfdgbWgecd9GV1DXzZlpgDS97Kn1Tlo7Iny1Zhix9UNZNzPpvMs=
X-Google-Smtp-Source: AGHT+IF21atwqR62ijL3XLbekBscy+usmTEKarUelgvxFuWKneWXxFSinPdGquI11kE+MEGG3syk0w==
X-Received: by 2002:ac2:4649:0:b0:52c:94ad:9b26 with SMTP id 2adb3069b0e04-52ca0464493mr1605471e87.30.1718361324088;
        Fri, 14 Jun 2024 03:35:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872578sm468370e87.130.2024.06.14.03.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:23 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Amit Kucheria <amitk@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Heiko Stuebner <heiko@sntech.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>, 
	Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 09/22] dt-bindings: thermal: qcom-spmi-adc-tm-hc:
 reference thermal-sensor schema
Message-ID: <mobms3s3tibh6wljulwr3okof2msvewed55ukecj3bkdfbgech@blk6udpuy5ov>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>

On Fri, Jun 14, 2024 at 11:46:08AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml          | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry


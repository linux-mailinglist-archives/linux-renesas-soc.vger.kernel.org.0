Return-Path: <linux-renesas-soc+bounces-11941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59363A04C28
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 23:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3218A1662E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 22:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C941DF746;
	Tue,  7 Jan 2025 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7TANGwL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F288619DF62
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 22:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736288551; cv=none; b=TgBrzWZ4hqCX3j6jDIlrDKxjTzA0u1Or+oE8/hjHOQg4MlPxj0lEA49lRmxgD4HObLNMwH0XTyGJr0iHfpc4h6Ug2eii9GSmkPzDJle+1JhLDYy9VY8aimBvDeNDzJVVB+9/tKFeujYgk3Dt8NueWiT6tNFYxrFwDT6sB+WJeWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736288551; c=relaxed/simple;
	bh=/C9V9k4oRr9NIMlvxTFyU0lVbVL2D3A5g1PZx/mlgWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVCneRFIKFlYg04krDBg1/RGhyqLE8o3JPRrS09xORpwLVsaHsNQAvG2gKRUn9qzGlkt9NkpmfyN22BfrxiND0c9uVR7Cchzhp4BZynj+xDyGgSxOUUGH0BgZaGH/mMjA/u1jvIvhAx7OqgC+164o3FV+8gtNjDBXuFQfJ9Bavs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P7TANGwL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3c47434eso16464664e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jan 2025 14:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736288546; x=1736893346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
        b=P7TANGwLvo0sqTFQLiFiNOA0Nn2d5Lm5QIT6QW0msF/Inid7SvhhahdWZfpScuLZEI
         VjpZpYW6lRCqc644fGWE3/4If/FZrrc+adPwQvsbqjvZiJhgn07e61x2LBHjWBDrGF/2
         f4OHLIJ1t+5WxdixcC8upYBXUhJHUeCqMZfVq75ep2XgUzSMbKSgIg7YKqKRfO3cKMdK
         Os9DncTRF5vzOrzfDdlIcJ9mH8g27JW5UzpUxS+0kDaLec2tmXmHuKX69013Plg2tnw4
         rVHsO+IFs++qMMOJ3ZtCDVKSSSpfscXu36w3twynW+OdAyMAHo7y7YZv/q8omvmWsBX2
         hEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736288546; x=1736893346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ESQnJJ6RaWplIB/jgPT0AvvoPiUybJLXeZ80lh+Xy4=;
        b=urYHpPFJ7zw3uwwyCPTT7ZGDiYMew3Twl1fMJBFsH5lNrtmfz3sgVHHnlBKKLM4Fs/
         fPOJicP254UsijIJLm3zzcuP1+f1zHpp6s/LzaA2JaDVx/i4UjAxTAVTXmC23wcd7uve
         0TB46xNaK0AH3dRf6GnfKhOQHpZp/EYrTpriZ0UMHLgC7AsY+zuGtqC6NAO9yVhU2Bat
         RuzY8fHTLO+f3sNNI54soQqzyV2d7nbZATqWtqBr5LPucj2ChU3ro7urHlT43IlShgc4
         DTBFJP4tBB8ZXUAUrW+zOY/I5pEk0nd5Rwj+jbVyi3xgn36cEnRo7FKx4wJtvq4KfCTO
         HT+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxMgeUhZKbm8HwNRhCdNerT+wRrwP/t8nAdaus/5tHkEyL5j+fiX4Sj38L8ArtxmZBGus5YROzsMM7Em6qJm3S5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMd3o0qV/N/CRcGZskGTmeXOv0WGFFwABu45GQARxaM/I33qUG
	gjiOMecMjYD4lBZ4QnjWxpFONwY58tr53smilI2QvttLUXaXGnzmU8ouPIVbGbk=
X-Gm-Gg: ASbGncvSE4XU0vlzdA5dV2nR/m3WZJuYY7alZSQwMrQ+8BPoLAnSv6US2kSKCIa3YjB
	X1y/qcey4Y/T60Oa1HYX0EEcD+N14ymv0DuRqGxhfarQ2m4AaYUCaqoVqMShDX0T8ZRnZsa9fap
	74zXE8FP24R90CRPCVrsITKywH5FYH4F85yonz8V2P0XXsro9/CLwx4hgv7UuHGmhYlFHLl/dz8
	4f7I/hLPk6fVPvZYm4AvQ/39nx4YfeyjWwHUDJAiKtYjIm19rKz7zsJt4YKocqhs010209UkHM6
	6TKxlh5fWjF8G2St3/22JM5lSDsgpWCxqueQ
X-Google-Smtp-Source: AGHT+IFnS+89P+R20rxSVwXMFgmVIida5oAviwnvCG7UgPRL6sqycM/IAnw4EINYUJaJOUGjeMeCug==
X-Received: by 2002:a05:6512:23aa:b0:540:358d:d9b5 with SMTP id 2adb3069b0e04-542844ad98bmr149812e87.0.1736288546084;
        Tue, 07 Jan 2025 14:22:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832b6csm5379607e87.273.2025.01.07.14.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 14:22:24 -0800 (PST)
Date: Wed, 8 Jan 2025 00:22:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	Mahadevan <quic_mahap@quicinc.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <g5u4xazpsgoxes3bwowufrdd266uhwqw2qidqs3tm4wq2qbk6h@bpzh4cnwybaj>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>

On Tue, Jan 07, 2025 at 01:58:51PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>  .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>  .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>  .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>  .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>  .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>  .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>  .../bindings/display/renesas,cmm.yaml         | 12 +--
>  12 files changed, 221 insertions(+), 222 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm

I think we can take it through drm-misc-next (or even
drm-misc-next-fixes) once we get acks from Renesas and iMX maintainers.

-- 
With best wishes
Dmitry


Return-Path: <linux-renesas-soc+bounces-23033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ABBBDB5DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 23:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 358523ABB30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 21:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447AD30BF68;
	Tue, 14 Oct 2025 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hGU6+te2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DCC30BF65
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 21:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476234; cv=none; b=YWXlukO70k6/eHW2vR+TDAknNdOfCFytMASWseTOdu2TM5FRJ3inHeMMp7r1WlH5mEoDdifKtjmqyMEUyAg4VcYE3otNFhxz3WJQWeElzBjPmYqqKWppT4XyPVDxiHY2nQckTK1OKawpXKPSHKrifIbvKOmrz+oToXaazLd+N7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476234; c=relaxed/simple;
	bh=EDvODqamZOphTpcYh9B/CCtQYxjXGLO+jG1P52nUNI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgJC7CsFiHEUOBiaDKSB26+XcgCvPYJ2DqFQYG8MR69TfMgeHjm7SIjO5h2+YHmno2d0m/si8iqxZS9FHzw0ZDWMhs6k7C6DLKCmHtrEG8BK13PPylrJumBJT7whxVJDZb9aKo5pM1TQjcQpfXQZsIl+TVrWpzUanJFTumvSy5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hGU6+te2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so46929075e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476230; x=1761081030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=;
        b=hGU6+te2xAvQlu822yEMq8zkxWyDinD9GiurHIO+1OypWjmgpojwuob/jjYZKM9eGC
         xmz8p9Un1JbbfPVQHFfvnI9wk06SPtbNkVHQW3AHSW4HaB3LutNq+dXEv3KOS1F+IKiN
         1Q2xhz8tPwb0rLfbubhuW4e9VGO/3KMV8Zwel3MJk3EmGAfEOED6plYz9L04Xz9DUy0M
         4LLLlhdB8sBryPcpc6xKpTJJdFG+f6SDB9a5Anh0H0gwlipMJeqQhBUKKpEA/ocKvXmc
         XZS26hXvXg+TtFeWpJAW/cB46iRCXSS1bBHjQkkfKrvhZmPlSmFcZ3yXW86S7VPj4Rve
         6YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476230; x=1761081030;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIqDBu+bnb+H785D5/vHRnkCuDzXg4G0wmJXPEv+JqU=;
        b=F8e5I4OpnYT2LZoq29ZaDyWFrx8AjmueLdBPjHNuxr4DsSIwlIMvzxjUuP4OmHRy/K
         OevvpIo+HzE071bb6JITjqFBIev63I7S+4dj00U+u1nnWsuj+G50TAzdyNFFWRfzIEX7
         OaZUbA+CbtDdn4sMT4/r6o9cpsrG5nPVMlLMry2bA2y34AhHsSie/k17SnGYskrcNOdr
         paTZ1g7N+fwSbgTYTLE89wYl1r4PIu0J//ya/lpm0zAyAU7HmymN7su7OqTKs5wC2FrE
         dllQxTgt0TH67uiMWo0f9CjI1OWX5io/FDwW9M6c1ESUzIpyi+eygV3BY7QZARwCOuci
         UG2w==
X-Forwarded-Encrypted: i=1; AJvYcCUAgPIyqj+oGSG8acpC5+Iqp0mr6WpJQ1zkUsWl9s4GJxjx35/0ylIbuhY/GzNUKuiJ81fb4ycuaiOOyu0Ze2aYBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7srIiUVErXL7ESGp2vb7+2lvHTDHwYvjD9hKmDKrfnnZAajDN
	FkvCifl6JAYSml0uNNorI5FoMyVgZ0jRZwkOEDQ6mcn0loejcjJdux7jo1n8WLe5IOc=
X-Gm-Gg: ASbGncvhR9537E0i2g0vzUMm1dMWDex4cePAn6IqCC51q8ERW2q7Em8WxwKp45ryy7w
	BWCzEhS9+Th9RwHl2rjm8vWFeHZ7nnZiRw9aWXBHwg7bxThIlSuhMzpJcCrJlrdfMhobUL8Mw/R
	paOMmlTbrwl9YZ/MFeunXJAw7apNh9//drnkhlaXQ8pP+9CluVcYdCNKa3kz7PEuPeArx6VNnBG
	vvoZJxZxxFxiBi/SBgF6tX1XUFUoyGXCMQ56tn8EVpml6Uvrpm489FA7QGS+zakkQuthx4WmPwN
	Ll+4TPYG55XFZaSFiT8MGpZuIllZaqsE9ZxAiMXoE4/Opl7zjNgmVUQR1l/r48F3JQCiyJO35r1
	EMWCkSvzIblyyqb6XHGKRdTCHghXrCnDD9TekO3uJjmhatRIY/S2Ek+OqdGCUwM1eRCZHWmtv5o
	NsDehF4mFwyY8=
X-Google-Smtp-Source: AGHT+IEbhID2cy30VH28xdYyFKoHwK5zb9GEgSYaTfKLNAL9ivTZVl5Wqfb64+N4E6V8zmftUTcSQw==
X-Received: by 2002:a05:600c:502c:b0:46e:45d3:82fa with SMTP id 5b1f17b1804b1-46fa9aa0eacmr170991135e9.10.1760476230196;
        Tue, 14 Oct 2025 14:10:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe74sm25122327f8f.35.2025.10.14.14.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:29 -0700 (PDT)
Message-ID: <269f3575-b315-4855-a2f8-243a91cd62f4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:27 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/32] media: i2c: ov5675: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>, Jacopo Mondi
 <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <mtwaxgCCtRmzwKQWossgjGCuiRpYsskzaiJXACP41oCx5DY1kIZtPt-agjTCBTTa_kRJb5g4XI-AoGUeIQ8nmQ==@protonmail.internalid>
 <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-16-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov5675.c:1188:9-16: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov5675.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 30e27d39ee445c2603b8fecf7a1107969eb97df3..ea26df328189eef449ce121c0f62a4ef02631830 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1184,8 +1184,8 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
>   	if (IS_ERR(ov5675->xvclk))
>   		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
> -				     "failed to get xvclk: %ld\n",
> -				     PTR_ERR(ov5675->xvclk));
> +				     "failed to get xvclk: %pe\n",
> +				     ov5675->xvclk);
> 
>   	xvclk_rate = clk_get_rate(ov5675->xvclk);
>   	if (xvclk_rate != OV5675_XVCLK_19_2) {
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


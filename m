Return-Path: <linux-renesas-soc+bounces-23032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E6BDB5BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 23:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5159E4E3A15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 21:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D65330BF65;
	Tue, 14 Oct 2025 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVnBbebO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28486305E38
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476198; cv=none; b=Gm0lkeKimj7IgMZqXk0qoLldjA1O3m9iPw9efgVi+/nLnAJpYu87d27ymqfMxP5Vof9uc5jIMNGETyPv6cHgN/k7E/7INd74YLNA2qkSYKpJqY58EB4qHSnMYLeTXsAkHoC/VqQ9G2sbuPT0nmFTIWzB0i8OPwA9Re1sBzIk1hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476198; c=relaxed/simple;
	bh=FEscob/e+90GaHE2E4U+4fd6PQekvU5FL8BnBdihcrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pAC9k+ruuTdvuWJ4m0dtDECu4lbfVt18fC/vzI3jULqMipDq4dfvc4oavjyL7cz+SCZ8/V3dYXFMi0MDWxG2XPzP9mZpr370ptQBzyzhVtLkA+dDRg7MFRWhaq5JfjNIGReMrOeXx36ZqqycxEUOYbKLx9xvF6JiJ2hEfo2eS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVnBbebO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so1806945e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 14:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476194; x=1761080994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=;
        b=OVnBbebOPYmvppTEawHH7DqNLzG9FMcBK6Ik4fk3zeO40bwYGlgf1dTyA+0Q8nU0Wd
         3eImoFfukZ5Yb1ds2vJFpo4fsQMuJx7auuObwTuGbpognVDUC869NUvjkmHj8Z6gDEZc
         7+BA3s2jVFYBVsX+uD6zx34LD7tsZy+WrZ/r710UmV8uBJ4nAw0exnUlJ7oY+kKYLFgy
         CignPqzaZDI4XiymQES4VkJ4GxrkycUXEEBQ9IjLchk7KiITwg99oPcPru7KtrdkcqRy
         NyA0hZe50+GnxctAbjBEpatbXb5E7YaV9/nltPamC8NlatXc+4Am1IefgYWFyME7poa+
         iyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476194; x=1761080994;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAFIy48SiNIefLRd1BAuON2DcAPzB6rd2TTAzyi/zmQ=;
        b=GoOnFTIrVjacKZGVZngkDYDb8aJf68MfsrGCpsgNCX88Bo9dLf7NjbP99R20CfOGmf
         ddzKAuQN+NGdncKiISibOOkcKMimPkw4c6CPnfroo41S1rfF4HeiXOZd3EJwZPgn/tvO
         Y8EaRDYLxMaFgCPb09s8+O/kTXZyOETPNKQqvwjrlLAAjn0+mmXmUTZc9kTMUlh/4cbP
         A1GdXTD1EUgLP1eA/4+QXr15/xSjykeeXpa4xIvJfVATtixoVSdfWtKp0kv5+DPcj64J
         DR5aIX19MyPlygfzqGtmhtV6qj5JEQCokDUNEtSK7pGOdwISLZodMVNpQKTSKXlbZQfo
         yNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvsNBZccPwF+VjxaGECmpB/E54uzVBfYDC/G5sEOax1MdtnE+k+c7viK7Uttj0qyWriSSBCXhzFyKfBQWakL82qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvVHD4V5jrlF+MKIHuiKQp9IHgBPjqf0mp8B8IFKX4I7LkKhX
	GBI4TUlDXlN/a9+bbrwcBkUT9HhXP6ogelGZFYReEKM7cm7XNRqHqmHZdnsrnCCq7HE=
X-Gm-Gg: ASbGncstt02pEYuFSSYioOwlZO/u8qHhdUCjNEWsoZIY+0hxWYo0SaGugLcQdghoGa5
	jeSZ8l1gvzjvY4kQUfDdTn0HHTLVucxnWhdSxcoDIGGcCw19ggsLiFg+SVWrIst0UJEcvmbIAi1
	E4xGvkHvTowZ8U6lmtG027vFhFfIWI7P1zmq/BA7YzyaRWGcXRCcQFONI7xPsrEXD/nmZjbaxOd
	xwCtwNni2KOkdGtK8QQGlfsW0ymo/YoWL2ao+y9RrJM4Ntp+aUwcSpIO7UcJIndvh5xNRPaTJy2
	fWjET+Z+j+hJWBiID4lPi5iwURpVZA3nlgojuyqYYgyQsplEqMUrbsr3WFujM927MJIVYUAJDA+
	OtLx3frUND+MFeiQqh+08zONjkYBIDc48fghZ7ERYEWCIypwCw4qDS3Jq/iTH/TCJCuCvWNAQGB
	78gA+zsLUgzr6Nz20fkKCtdA==
X-Google-Smtp-Source: AGHT+IHMLDEl/2OUqyd6dsVKt1UGXh3BaRNNfQRox5yRqmlsYRCZeNTg0aqnPOJfK+LSUdRcw9kJiQ==
X-Received: by 2002:a05:6000:2389:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-4266e7c7b2fmr20416940f8f.21.1760476194354;
        Tue, 14 Oct 2025 14:09:54 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce582b39sm25169444f8f.15.2025.10.14.14.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:09:53 -0700 (PDT)
Message-ID: <ebc5be79-7184-4a91-92fc-8a181ba096b5@linaro.org>
Date: Tue, 14 Oct 2025 22:09:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/32] media: i2c: imx412: Use %pe format specifier
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
 <U1BUWm68sWNPUXHr6NOsnc48bb6eXIL5tcAzrNijItgutDvPaBTmCI0qf2ERLQB_2BFYEBVNvWTQdmx5z_UU-g==@protonmail.internalid>
 <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-11-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/imx412.c:931:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/imx412.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 7bbd639a9ddfa7fa76d3a4594be1e1c4d002c98a..b3826f80354703b17b416dc233854da3f5736e38 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -927,8 +927,8 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
>   	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(imx412->reset_gpio)) {
> -		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
> -			PTR_ERR(imx412->reset_gpio));
> +		dev_err(imx412->dev, "failed to get reset gpio %pe\n",
> +			imx412->reset_gpio);
>   		return PTR_ERR(imx412->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


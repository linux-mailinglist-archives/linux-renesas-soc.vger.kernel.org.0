Return-Path: <linux-renesas-soc+bounces-23034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E5BDB5EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 23:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B990F4F95FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 21:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBF230C601;
	Tue, 14 Oct 2025 21:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZbJzPl8b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17030BF7A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 21:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476254; cv=none; b=K26f6/upeeDAaaCg8BUmJ76jOCSewYp2M05rOITrwkDMM9GdJR3blYZ48tCUbVFzedZaEwZ/Q3n2XipTYv9/WQOzrKHYMFphvbYTUF+8YBy6K1Jpsk11dxzrRW2Ws/aOJ/7Ns2TBf+8Kg75Vm0UHPY48vYOir6JShfbqwM9fN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476254; c=relaxed/simple;
	bh=BQJLULTT/Wn1VgzHKtiLeywejDNqOrYVAnsXBZ3US70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxKhr1Ej14E91j/PuaOK3ovaxCILNnTZ93Pz7jO0Tyed7cnzfQnP+H6BVf2CyDUiDKkRv1BfwLDzzJ7FcHJ8nS+yYf9PjIAG9f88Wbxw6Koq+sPYerp9C1Patc/1RwEu/8gJ+nH5rJLADlTJkctQquV3H0O3F4KtK8UD/otE7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZbJzPl8b; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42420c7de22so2715069f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 14:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760476250; x=1761081050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=ZbJzPl8bPNCMym5feI7/o2aOEF/tWHhMsATv3KmaMXPx+M444TxSmAwCxW1+XYULAD
         mwu5exkDWQmwduqtokHm7w5lz8SQ8/RoHcZpkgQNML0saav1Qp4pc45eT77MvZdps2fW
         5UF8OWAMWt6mXwnD+n7Pxy3i6vh8oHadLBVcNMW6gKgTwYfS6lFFN37m9L2Y28GR8LwY
         ICkGnUegvjf+0k+6M0EnSuTzj22IcXtI0wv0onIPIQAVlkfpF/Fu6Ppi/mCzfn+yKG+k
         mUd/TTtZKX71n9/u04tArcXcXMscXdj0tWWX9pns/q+QZ9ckqVyDoZbemuvCyxhoPJOk
         mo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476250; x=1761081050;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OU1/mxCO0gs9pfD0TKLeg6fFAQ0zkZSd+iwsC02HbYM=;
        b=b+/M7dLm8ok8NvlYuGcdIM5Z69oA5832ghdjdQcws6maYWCpHhWpQ53Jgregt6hkeg
         bTy823l6ODeXNNGeOjpYgCUFhKE6ePXMNmdwlMS6o41fVOp0hTibrZhttsLMMneyCske
         42/kwaFrJuLFaKJfwKIzp6Ld+WsShxBL4Kpm9MrDoK0krP+1zI7XQ8d15PSwZdYpid3I
         FaIVTclREy99v/1yCDCvHlo5UP+4gMvQCeaFqrz0NXUeiky26dK/xq7DlNWjIDoNOC1c
         XricxomP44ZIE/MzMHvbOZICbg7m1yz8zsYwHgfv19eoYB9lQS06jLT8KDsf3Ny/wH8e
         kpXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlMh0AJSRvrivkRa3Vl76OcVS/yNB/alXpvcEzohnkn1FOn4ywkYDfO6r1f4Y9X5bizyXvetsBef8jWOmGRGJptw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm819ke2PtAgE9877N20pgU9FmOA+KvBh0JJFLmj6JuqBbqKX3
	wyimxQf74QDNooO9WkehkyEhXMwyLXefiAD6HBwEnL32YrZ7yygF0B0xyw+yqF0RjRg=
X-Gm-Gg: ASbGncvhjlTdBGnWuCb/cKGW5EYCj2Hml8OyK09xe8a/SlRogkzXW4i0bGnUR7xs1w5
	NeaqPbk7XRL5KxlHb3hmtz4XozuLcFNwnJB+psWHwtk+wIZZaCUBdl7NsG5TTyszuhJW9ldE13j
	TFcIgzBJRK5L74djGtSi6atKsT4DaGrW9mgkFWTpxhwFyBKYFPWy+mgLeHjD/7eHjq65C8MZ2Hm
	4BHVtU2/qNE3iTlkPvV+rM3nudntf8B/bAMH6JW9T8BJcXge3t+VER79FKUliQWSuZZWFmjyEE1
	RNG5HRaj514WZuJZVqRKfWQ3N51mm7Tbt3w55z1sCjSrkVIpT9XbQEak1si9myPYsSadmbO9S8Y
	ECuZEEEicfkNWtkRSZYxO/NYMPLaqKsbBKaXPaQZIQOg0vZLWZjPv3Tg0qPm6vZb1V536NFVbXk
	nZ+Gud8TvUfdkgqaz9M8cquQ==
X-Google-Smtp-Source: AGHT+IG4aszTNfWkZ+8pnaYDUBRKBttfxEAtdOpVVT5WH4tPRBG36HzZa82lsANKG9dSujuWlON6Tg==
X-Received: by 2002:a5d:64e8:0:b0:426:d71c:9a34 with SMTP id ffacd0b85a97d-426d71ca0b4mr7446024f8f.51.1760476250194;
        Tue, 14 Oct 2025 14:10:50 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3desm25578034f8f.7.2025.10.14.14.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 14:10:49 -0700 (PDT)
Message-ID: <8b64ff99-d3c3-4d5d-ad7e-1d11d0a8fcb4@linaro.org>
Date: Tue, 14 Oct 2025 22:10:46 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/32] media: i2c: ov9282: Use %pe format specifier
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
 <MY_AlfixYZV-8oPbVR2rAt2c2MXqa44vOl4wBVxfvw8IARVU6fXVfIgMIEjDtagmcTUarlGkxLViwG6BYfcSUA==@protonmail.internalid>
 <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-ptr_err-v1-18-2c5efbd82952@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 15:14, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> This patch fixes this cocci report:
> ./i2c/ov9282.c:1133:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/i2c/ov9282.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index a9f6176e9729d500a40004de92c35b9abf89b08c..3e24d88f603c1432865b4d880670e4b67f1b5cec 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1129,8 +1129,8 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>   	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>   						     GPIOD_OUT_LOW);
>   	if (IS_ERR(ov9282->reset_gpio)) {
> -		dev_err(ov9282->dev, "failed to get reset gpio %ld",
> -			PTR_ERR(ov9282->reset_gpio));
> +		dev_err(ov9282->dev, "failed to get reset gpio %pe",
> +			ov9282->reset_gpio);
>   		return PTR_ERR(ov9282->reset_gpio);
>   	}
> 
> 
> --
> 2.51.0.760.g7b8bcc2412-goog
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


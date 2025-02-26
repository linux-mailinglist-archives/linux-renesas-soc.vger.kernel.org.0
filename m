Return-Path: <linux-renesas-soc+bounces-13687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B949A4513A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 01:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E8C7189E6A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 00:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46BC372;
	Wed, 26 Feb 2025 00:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nu1u8jy7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3CD1FAA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Feb 2025 00:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740528550; cv=none; b=OHboiQt4TmuLjyu337MoWG+MZPizvx4Jk37xbrkS/OKeuKSm6upuYLCAaaO2g3C9aV6HgWdN97/ypQAR0lryMFq/ARHQpahfLCyXq8EOOiPsEOWvVOCk3wX1ntrNKNvo7nEKqE7ESLphujoQ+OmNtUOtK894PiaNhG19lFfNqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740528550; c=relaxed/simple;
	bh=h26bDQt1EvZvwSeo1EG9AJe/Hyqmt8BinkNFg5j8KtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=so8o2evdHugFiiUg+0/jxRDJdc5Cy7nS4hC1cxQr4DEv9kV+b16M79mHayen6fPT5rHSiWimcXRHG90hGr/YRGbyXj0qp8fhM3YRN8PHr28GBEu+4A1gSMbjgv5x/eDTW70/fgqUkVCy8w1SBBtQ9GCg2SDdtsF9ftYbNP3XtTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nu1u8jy7; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7271cc3d73eso3328665a34.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Feb 2025 16:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740528547; x=1741133347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juVLmpm4UqW3CDyHjhGjXXzInD2jAOQrY9jRma953QM=;
        b=nu1u8jy7tEcmXzkguzmoirxSZw8jGD9slpgpn1qaBCjkesSUqnJPCxx59MkqdkBAlf
         5cb+PxFJsGKCADh0TacvGS450pNcTR/RtYgwq7hrkyw7h07je3th7VLogBw4zfg2AxcD
         1C00sN+lMFg/1iW94+gtP7tmO+HmoBka5iLWY5FPHvotiHSUnNmB+VQ5HLkV1nwA4keE
         bHMV6p3V3MBLxaSS/C57SxJs+1fQHAkN7Ms+T4F2nHpPRAFTd3yVoUzIFKNKT9qUmIzF
         M5w5VWteRDVIUiFVJ5Hituq+tzHTDlVqvX+b1qm7fJeO4RSZpSA+7+dcNZfIZu1RDUJM
         po5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740528547; x=1741133347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juVLmpm4UqW3CDyHjhGjXXzInD2jAOQrY9jRma953QM=;
        b=gV0+iXxFbPI/PhhLBQIsbQtjTxJiUonHyfFE7/RHI7LV+LlDThINb1x3qYUoVqK3uU
         vOAmtWcmksIokJtn8k5H65DWh+gZmm/CGvi4Uz0h1v2LFmHA3nN4L3c305sqTbJomama
         H3JPexuJDXN1j0fDNrPV5Y1gRqBNDiqQzbd5MbiVZLI4su1vhICmO8AOgJ1PmvmGQpwR
         m2lowc4i1pfS6QMM5+nfSVcaz37GudkltjwT4tGTR6b20IMhGBfgB1lSXpTiKRG5AFUt
         w4deTwM3f5X0y+hRIfAA7//EINGz+N/ax43eOsusokp1b/oKz0t+09dPxkZrQ8iUFK9r
         Bc8A==
X-Forwarded-Encrypted: i=1; AJvYcCX4ZmJZNTEJjRworJUT8bfLDDW9bFLUTQBwvrehiXdSm4hYrAKbKYQRS7HcYVmsjX2JL68LEZDDsuzOvq76PAitDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5+0BDZ1i4w0IBFRrGYStFGmSGjczKhUhB7wnfoTmU6xMNoT1
	uXAIGsQUH5OS3uLlhrG8fFjTL25xAnWOe+DYLBgnnpmgdcaonjAMWH7UZEAmtwZL06BNDI1R/8g
	6
X-Gm-Gg: ASbGncsvU+BjTk4YAiqaUsZlqI1m27hVPBAQi58l+k5pEL3mRk0QmbX8CvAfJ/4LSR2
	b2V93KGrvE6FgBX/ols18dybB95VE9umjxyKLthyhxmnkuv5JHE8s1hIV0UY+XhEuc4w2Td8ifa
	H6cJK5YDJ+ELz3oX5KK6Er15xdK48/FajCeKpaQdNGdrqcEZMiYm93sHBDmEhHPcbLC4Lg9MO0r
	QOzryFDjguOAxVnSfku5Wl6uP88Dq7++1n2LB9F5ORknj99CkRlYsxGlEk/iC7UfEic7xHO16kF
	A3tIvmKMBWM94ZE6fhVpMmRSsB5e3rNR38QV6m8AXR7VkSYPkHFwixQasCdstlk=
X-Google-Smtp-Source: AGHT+IFcLe07eLzlySwjtDU+XuKdCvG3TGM5yw/uZ3tgI0c9sfN55oU4icGBmCi8OdnlyMQtoSSFWg==
X-Received: by 2002:a05:6830:dc3:b0:727:24ab:3e4 with SMTP id 46e09a7af769-7274c1ac6f4mr15683376a34.9.1740528546779;
        Tue, 25 Feb 2025 16:09:06 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289dee9d50sm497552a34.34.2025.02.25.16.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 16:09:06 -0800 (PST)
Message-ID: <f0d0f114-3953-46b5-b9f6-9b35537e6f8e@baylibre.com>
Date: Tue, 25 Feb 2025 18:09:04 -0600
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] iio: adc: ti-ads7924: Respect device tree config
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Nuno Sa <nuno.sa@analog.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Guillaume Stols <gstols@baylibre.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Ramona Alexandra Nechita <ramona.nechita@analog.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <cover.1740421248.git.mazziesaccount@gmail.com>
 <20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20dd0e4ea72fe39b90b611f9c08dbd4bc1d5217f.1740421248.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/25 12:34 PM, Matti Vaittinen wrote:
> The ti-ads7924 driver ignores the device-tree ADC channel specification
> and always exposes all 4 channels to users whether they are present in
> the device-tree or not. Additionally, the "reg" values in the channel
> nodes are ignored, although an error is printed if they are out of range.
> 
> Register only the channels described in the device-tree, and use the reg
> property as a channel ID.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> Revision history:
> v3 => v4:
>  - Adapt to 'drop diff-channel support' changes to ADC-helpers
>  - select ADC helpers in the Kconfig
> v2 => v3: New patch
> 
> Please note that this is potentially breaking existing users if they
> have wrong values in the device-tree. I believe the device-tree should
> ideally be respected, and if it says device X has only one channel, then
> we should believe it and not register 4. Well, we don't live in the
> ideal world, so even though I believe this is TheRightThingToDo - it may
> cause havoc because correct device-tree has not been required from the
> day 1. So, please review and test and apply at your own risk :)

The DT bindings on this one are a little weird. Usually, if we don't
use any extra properties from adc.yaml, we leave out the channels. In
this case it does seem kind of like the original intention was to work
like you are suggesting, but hard to say since the driver wasn't actually
implemented that way. I would be more inclined to actually not make the
breaking change here and instead relax the bindings to make channel nodes
optional and just have the driver ignore the channel nodes by dropping
the ads7924_get_channels_config() function completely. This would make
the driver simpler instead of more complex like this patch does.

> 
> As a side note, this might warrant a fixes tag but the adc-helper -stuff
> is hardly worth to be backported... (And I've already exceeded my time
> budget with this series - hence I'll leave crafting backportable fix to
> TI people ;) )
> 
> This has only been compile tested! All testing is highly appreciated.
> ---

...

> -static int ads7924_get_channels_config(struct device *dev)
> +static int ads7924_get_channels_config(struct iio_dev *indio_dev,
> +				       struct device *dev)

Could get dev from indio_dev->dev.parent and keep only one parameter
to this function.

>  {
> -	struct fwnode_handle *node;
> -	int num_channels = 0;
> +	struct iio_chan_spec *chan_array;
> +	int num_channels = 0, i;

Don't need initialization here.

> +	static const char * const datasheet_names[] = {
> +		"AIN0", "AIN1", "AIN2", "AIN3"
> +	};
>  


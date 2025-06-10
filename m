Return-Path: <linux-renesas-soc+bounces-18011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF06AD2E91
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 09:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63B643B0E25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 07:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFEE27CB38;
	Tue, 10 Jun 2025 07:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdav+lxV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6262C27AC35
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 07:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540243; cv=none; b=c1+5vd/MMUdwrcEk7C9dO+X+/ftMG9Pa7//2eQZxcNG3YlHg/dOBVIVcy8Lwnd6gIqvacsNPG2lWl+SlKrJ50aSCHRkH0LMsv/SjDdrTIPJk46+cr/Dd+6Ab2u5qbZdDdK04t0fvov8ecVfwZqVPjepBt19PtfzK567oUL2bv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540243; c=relaxed/simple;
	bh=/b5Xyw258iapMtG4jORCwU8kRU+ZgOsLTonWUI/+cpA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lozse7/PTdZc9M6G6VTu7Kn4tlWfHvmw4940IIFwz92COH5XCittOHshOY7z4F+lywc2YiUppl2Mgvx3jfGqm8yJvvTvJmeXRqzt8/zoaG3uQW9jmDyj+D1qlWToVwhLPCW3oAyxTXBvYLInqb0NVfuchu3IPi0vy/Q3LMHkcJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zdav+lxV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4179807f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 00:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749540240; x=1750145040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNfpzrOFenW/QLhsdS6ZGajYFLyQXEOSuS4E3749yys=;
        b=zdav+lxVZu372/fis2n0dn+yU3CAVI+uBbrtuz7c9aPaZqkSrbRBZanGqk7XsBpjrh
         LslCpILFsFcvFJNOT1lN73fpZkF6nQXAgy5PdPXZn6Q9g4c0NY6J4AWoT/lCVypsciV/
         l7lyRJIe38MjZXvRO2J+GaV1aCMzhjWAIjPnUxrUayVxfmpk4ds5vc1TId0ZP+tylKa3
         bvxPOSC2fc2pwVc78g4eHhFpYW8hSULHBouYYdeIjA5wHC9r073nLUyLBXnbIpFYjugz
         sVJEUvnLMk3t5J3QWb/sSsywun80kUefZP+XyrzwNpG0aQvLzQoDk2AY6GO/tlIGxTAI
         /njQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540240; x=1750145040;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CNfpzrOFenW/QLhsdS6ZGajYFLyQXEOSuS4E3749yys=;
        b=D4CMpTZTx5ppwhd0O8fkKdBuSWPt8YJCKQOjFf3QdjReMM62DV/UlScvqouvOh2Av4
         +ooxI5HocDlLl/YAcEQFzJ1y5A+ppR6kAcBhPXAm4gfemBxX0LV5KDz3NFpP3kUMPSGF
         j2jpjekSNhNxTjyQumM6N9GH3J8BeIPTYi2WEmGLIO4VJQCQMKP5qCMFwue8s4GOvKAT
         /3+5ajWwyj6YjibSZksHOtB1JKJ95J/vJyUREC2nmbukcFfbjpo91g4U8WyMVgZSdcJw
         mDDQkxQZ8ar+sHMfuqAqLhNm409xov7McFLb5AA11D0hikiZQAHZ5mIpTCG7uqLb+G9B
         TjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCViHUfyV+IV8VrSvHPKKtLCKHg9hPIGsXoZweY6Kka/tLgex9EQqoCMvQPDgrxbn0JBLgultcBKuah8ZKhn1Kdz5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2EQnbri2cnXbaN3H8FKoKhlk1BSZWVUk0yyxT0WBcxfMGNVB+
	End+Q+GrbwuEwEcsOLHCPSk2ynNw+bayZE01Z7jvYkCvl532ddnQCV9pbwKS3scdMyk=
X-Gm-Gg: ASbGncv1PNGdrAfk0MmX421Jll62wjVxLgOiREeebTWd9nAkvnxDemu5jbBaZBWGXQb
	g7jDX1OtUKVGVE3Sf5ty6PYx48hgY5CAJ0G7ZeRHWm6MEIvD9L6ROxIHtwkHubmWCOaj3b2urYL
	LdLXZ5rJ0TyG2f+Whjhr/rzBl+zibjv6kielF9hMpr5kRYLIFTo3GXZalFDMpWFnAreHIIOS1J8
	0NjV1k5W7MsnMLk008zmSJdJNRG+f92ELegunLd3XlwofwqDP1qD46EpLnyIjNSQmTEyud3u2Gz
	ar8fSqNO3kkYrli9w+3VlZOhnIhvg+X7Pu/1cictcHF7gb8nH1uFuWgSodq8wb47yO0XXFtEuSU
	WcAUANLlTOmHFUWnDwMayJeZEhu5dJ3aOhmRr
X-Google-Smtp-Source: AGHT+IH6L020nl91HxJzqBefF4jPmNluzqAmrXBJ2litambE6J99Sh/JVOVprQvJU+1I830E+pK6Qg==
X-Received: by 2002:a05:6000:1acb:b0:3a4:ebc4:45a9 with SMTP id ffacd0b85a97d-3a531ca80ecmr11833618f8f.19.1749540239660;
        Tue, 10 Jun 2025 00:23:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de17sm11773770f8f.18.2025.06.10.00.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:23:59 -0700 (PDT)
Message-ID: <da96ae22-c566-4c4c-ad44-261ea124ab8e@linaro.org>
Date: Tue, 10 Jun 2025 09:23:58 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] drm/panel: ilitek-ili9881c: Allow configuration of
 the number of lanes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
 <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2025 16:28, Marek Vasut wrote:
> Not all panels use all 4 data lanes, so allow configuration based
> on the compatible string.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Based on https://github.com/raspberrypi/linux 0d7ac78a3dd9 ("Extending ili9881c driver support for nwe080 panel")
> by Dave Stevenson <dave.stevenson@raspberrypi.com> and others
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 28cd7560e5db..2f5ae69148cc 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -43,6 +43,7 @@ struct ili9881c_desc {
>   	const struct drm_display_mode *mode;
>   	const unsigned long mode_flags;
>   	u8 default_address_mode;
> +	unsigned int lanes;
>   };
>   
>   struct ili9881c {
> @@ -1549,7 +1550,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>   
>   	dsi->mode_flags = ctx->desc->mode_flags;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->lanes = 4;
> +	dsi->lanes = ctx->desc->lanes;
>   
>   	return mipi_dsi_attach(dsi);
>   }
> @@ -1567,6 +1568,7 @@ static const struct ili9881c_desc lhr050h41_desc = {
>   	.init_length = ARRAY_SIZE(lhr050h41_init),
>   	.mode = &lhr050h41_default_mode,
>   	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.lanes = 4,
>   };
>   
>   static const struct ili9881c_desc k101_im2byl02_desc = {
> @@ -1574,6 +1576,7 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
>   	.init_length = ARRAY_SIZE(k101_im2byl02_init),
>   	.mode = &k101_im2byl02_default_mode,
>   	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.lanes = 4,
>   };
>   
>   static const struct ili9881c_desc kd050hdfia020_desc = {
> @@ -1599,6 +1602,7 @@ static const struct ili9881c_desc w552946aba_desc = {
>   	.mode = &w552946aba_default_mode,
>   	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>   		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.lanes = 4,
>   };
>   
>   static const struct ili9881c_desc am8001280g_desc = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


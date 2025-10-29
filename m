Return-Path: <linux-renesas-soc+bounces-23887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD20C1D3A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 21:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04ABD3AED88
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 20:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE4333A01E;
	Wed, 29 Oct 2025 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gtrEB2PS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BAA334C20
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 20:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761770314; cv=none; b=GsO2lfJj7rwT4Hbm8YKJBfqlC27lAijRA4DBTfxIVk9hh2v7/9WHMecgcgbpHTtFOY1ISfPwLnsBlB7vpjiarHOhLgrtxXlB2SDAO1ZHvt3n1ZVjeKMMjha2/lKEa/W1CC4FUAX7ItL91C0i9EGv5hdQ2CGfedSw49RWAU2iV3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761770314; c=relaxed/simple;
	bh=Kz7/bK+GUbrD9ET+l0rtf7SVykQOK10O8UYp9EWIkfo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oFzkKXcQXkcMJ2O+SdM+PjeW4Z4vN72YjDplm2j+t9M8RM7YzcnYULuBr77cJrCs/0rBBgHeAwnKntlz6jg2FjTnOMpKjEEOVRgezUvZCf8d9yVMb8Mg1nBZsTD5KfiIxf3y0STnPaZDnZQNWHPWB81yWQG5PyjE1YtTNvYD5yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gtrEB2PS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-426fc536b5dso172818f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761770311; x=1762375111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZZWPacVTome8i/td23ATqpr5fxPQl52SGeEOJvaFRk=;
        b=gtrEB2PSAZGKthYwlOJExwwj0oQ3EFOqczjd8//SPQHliCx3njFFSqu0LZXBvrSi8+
         wqMj+l1sttu47PzDCWNMjkmmd8s4tXFXo0fHlmsnheSjfLD/VFLd63lQ4yBIDFSmt8gq
         NNUrUbOsB1uO3Dv4t/qgU3lyAa/xvYghqp2PvGu0HzXFHjaNNWQjtYhWsmLtpgj+Qra+
         EbuIL8LiXLZMLMxTwy2DKKNWAWo752wsiOGnXRJ8fTEnUPTzJSAoO22J4JtNiYBTWa4j
         J0mPQHXYE8wVpQ8D0oz46V1W28zgt7DMvhZJbmtburMXF0oXwFYh2FZHS7VjGN3ZKuAg
         mANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761770311; x=1762375111;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QZZWPacVTome8i/td23ATqpr5fxPQl52SGeEOJvaFRk=;
        b=KcuOnhvlGiCNVbzbkRZgdIyJahgZLX+8Wungm02iwh4qUwATLa+4VXgrVyoeyWCT/Y
         qPSNe+udzqQrpPpuxRpP3772bnFcZqbJg3JpO7P5lG1FUM+jtMcPkOqxgRSnadTdDx3a
         dNZsSnzHz5kjUd171zDAud6yx3wK8mAAoHgLosUDSYVha/Q79gbjPyw28/tNEWofQxzu
         Kxv2uJOUGjzrTkuSylE+djsJajbqdYL7wHdFvQKSfVMQ/XaWRypMgRh7M8SwEGcmAr4k
         bRxeNLbHqQ4U6mJptwWJjm6nev3jzGsuoW8ZM4vDKkXdf/wVZaAjcJxMSPkDE/SKgju1
         HASw==
X-Forwarded-Encrypted: i=1; AJvYcCUO1sFbCOAds6eC3JkjXnoOncBtULzrvvnVyQF/OhcXsYWSqM9/C6Ta8n9Kka+mghfBN81T5AMt1l1uDadlrDrD2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6tr29UsCMJNMRGyiDEkLNstc/1aM40n5Q8gII1TIr0Zzyti0p
	7WFVsqDDs1M9ncxZVf/y04KQjq6ofXZ3yaaKZqG0A4sezT+QiFqRACltwrTyv5+D2As=
X-Gm-Gg: ASbGnctvXJjlwKo2t2ZX82B18xxOyXMdF8kQWDzrw6rlFjMS7zNzB8Okg5siH1+Sb+/
	gEv8H5YMZp5BGUxIh7z3OhtezPsvyCgDrnPf62FzmJeOnKka+aYBWSYpzT+m9Ut3d2jXYFS/IqN
	csT0CcZMEcSncUoJEYZXXblCV9B1XrUfvj/P/BXezrXIDdQ+IXHitSU/+nXbk/qBTcPffNtfC7t
	YcBcAZv8UHr8dH91VcPiD1L6arllKuBpzQfkKNtPec6ruirglrsxjNDhHoRuZXdYfHydR9CSTIB
	NO3yy9rkkMdP8DQY2Hj1HAowZeVDVchpnMJ27oQGKWC5jd0Hfhg6ZLIryg9yDGHetekWlgGV3ql
	sVGhyRDjqMu6B1Jbl9uLQ4A7P9iqoSrICfcGX19BvrCADkZSDZeoAZ84ll9lbfDqVPJY8LRb0uo
	VQNSXMCKfiM7aVmq7VmZUP2I78rULc5MQnfXrSEGqKQWmvLId5Pw==
X-Google-Smtp-Source: AGHT+IEql7WhgFE2ZyhRhdguRGYBWDwfbeIdgbMOHnGRkmwfrCwTcZSg+FoIVVzr5qW+ZqxN0Ht5cw==
X-Received: by 2002:a05:6000:4211:b0:429:8c31:84b7 with SMTP id ffacd0b85a97d-429aefd6aa2mr3537391f8f.39.1761770311185;
        Wed, 29 Oct 2025 13:38:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0? ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289e8139sm2028605e9.15.2025.10.29.13.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:38:30 -0700 (PDT)
Message-ID: <74dbab41-a46a-464f-98ae-c478b4afd6b9@linaro.org>
Date: Wed, 29 Oct 2025 21:38:30 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Align
 panel example with ili9881c binding
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, devicetree@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/25 21:04, Marek Vasut wrote:
> Update the panel example in this DT schema to match requirements in binding
> display/panel/ilitek,ili9881c.yaml . This fixes the following schema check
> warnings:
> 
> "
> /tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch'] is too short
>          from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> /tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
>          from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> "
> 
> Fixes: c376a6943741 ("dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subnode")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> index 51d685ed82891..b95f10edd3a29 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -157,7 +157,8 @@ examples:
>   
>           panel@0 {
>               reg = <0>;
> -            compatible = "raspberrypi,dsi-7inch";
> +            compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
> +            power-supply = <&vcc_lcd_reg>;
>   
>               port {
>                   panel_in: endpoint {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


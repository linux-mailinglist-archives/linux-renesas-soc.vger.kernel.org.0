Return-Path: <linux-renesas-soc+bounces-29127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMBsN/sdsGlBgAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 14:34:51 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D162250708
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 14:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2AD6328C43B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 13:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603413BD244;
	Tue, 10 Mar 2026 13:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="groPjotz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555823BD23F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 13:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148098; cv=none; b=pifNQdFWIhblgO8/u2E/r7lIl2q1ujQ6n3EQ16hp9KPFo2r+gwsWBphyvjzG/r7eo2U9W62bKZCGXdY8VIqRJhh5/tBr0iKmdY+quMm+PdLGmbrVmSCAXzFMiwtw27me4+zdkeDGa8me5GdGgl0ZSsIKrFd4sHfbNXn1UG1uuuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148098; c=relaxed/simple;
	bh=tGacx9f9nn8/Kb38n+62esbGnTy7QeTbvFr7FOVcB9w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Yf3DlTs5DT2YIi+72biesTGQ8VEC25fBBRPjKTbYGBHOMmMF0PgEwHo/nF9Y2JESYT9ue6+6LRp976hvQVjT3n2d3g/FCn2zh3BK5P3BZkvJsAP92/moSeFEbAanArXCo1hoCllPEIkKcIHpftzSOwbBeNgV7YPUTCCV+1aCc28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=groPjotz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so39446135e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 06:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773148095; x=1773752895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+t60HSreamo3MTfDsB2DfhGZzgMQ+QWOm3k6JVhjzQ=;
        b=groPjotzsJgnrZTySd7/H2I/ASz80Kxjr7Lq73NYE8b7wJ60eZ0cp7IlKAdCwqFq/Q
         FMtE/J1s6NlGqWml50v/BCnZu/NnVh79EBX45frRIYsHEVnDgHbEIKT39lgbH3JZWMZE
         Wrz0X7edSYU14af5raoeOnaWr/+23AQtSRNTEwWBnUms0qpvSRKRAXaSDJtpliIVa5PO
         OlsSjTL3usHrtypZ0Y2C6ZCxuf2iN3CrRdGeXf1Nj90eX4AyVcTKk9MbUFqqzTbaDBww
         Qmk+KZwT2q0oE7RZUaOScY6l+vNJbjfb1fab3mCTg+pbvg1/7tStFPlpWZ5F3BhIpIDh
         QTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148095; x=1773752895;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+t60HSreamo3MTfDsB2DfhGZzgMQ+QWOm3k6JVhjzQ=;
        b=Br45PeSN9XcaeRN8EHC6e2wQxbXeL9HzeW83V2o90i2B0C/dCULJzQ2cbBhS1ec0lP
         0N8ssS/aoDuIO3UDAEIqUsizgEgR4YXJlRzmXfCugo0VLzLetrTWGE0jDmaah+TXFfNW
         EkdCs7tYwe6qPvN4S1wvWlgvLlnuKYRJI599pm20kCxS97gkhZkEvcIlcMzSto0IgfcI
         ihdw8+ShRCxrtoo69oGxDVZUolKHrhSotfOiksLOj3gbewN3+tkWx0rAcZmIndj+HZZD
         xZI611wzDt08HYxv8QQAllugTxSwb40fuLUIPFUzpFwgwKtCJMr36uZrWdpiQaZc9FLG
         YLbA==
X-Forwarded-Encrypted: i=1; AJvYcCUbsSy6/UYdmzEy8fKrHwctTyrSGqqKLNSX5+RccycrQV4cLyHKLhDTUfEfZUfYAJxdsyXIKF6Snb5/R1RdcbWwOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37LT8+R+EM6n8fjOrZDK63ZP41/2trHTl2UUCPo7kv/BoQ3E4
	1YbnNna6WrBbGSbmvYbHmEYZgmz3E9tjmhc09ij6QVQyu7W4UPEZRoIxSzVRIyMWnbw=
X-Gm-Gg: ATEYQzxY47d5/K31nYL7ZCT/kDf0frW0RpXbjqSP1wp6G1Q8jKgJrroBrOUs9uLf/+a
	YkIetCdnrLggn7CLImrp/vKx8BR/U8yF11+yu4nAhqoIweaMbm+mJRZ1KnAdt649RVfPtI0urHX
	7LU3F+5Y7bvhy4MWes32zSjV4fmSf6CBGFmwa4YfiCoUf6nfO6H4vaPxnE9ZjDxeQK1icg+3jLd
	u5+a7iU2LPolP1PRG7kbSlfSs+9YRbn3Dq/2EASN5GyY2/ct6Wx8g8wokSrgyLPkEB4dE9msH0C
	UQ9Uv3MrrHI3nwqFLz1ebfSz+jjgkY36ggcqMQ7tAznI/OD9+8RHaSSBE0ln+WRC6ql4uqSFOEJ
	7f8Ng0ji48ULUntjbLuUQiIcaaFofEp5lweMtxDlLoZI5xoupD3XCga2iPc5W2X9HF2sEApJXp/
	XMuL9AxYk7vTC5s7OEo3FXctPX9JmmQiEXv2SXlwzXOUOG5qrilId5SexiiMt+0sdIu15JcEcMk
	Hxqhj+ETtEH/QY=
X-Received: by 2002:a05:600c:8707:b0:485:3ff1:d5c3 with SMTP id 5b1f17b1804b1-4853ff1d6a6mr105483675e9.5.1773148094401;
        Tue, 10 Mar 2026 06:08:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d81:e92:c4c0:3c45? ([2a01:e0a:106d:1080:4d81:e92:c4c0:3c45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm84450595e9.14.2026.03.10.06.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:08:14 -0700 (PDT)
Message-ID: <f502051e-68a8-424c-90bd-a4d4957904f6@linaro.org>
Date: Tue, 10 Mar 2026 14:08:12 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: display: panel: Drop redundant
 properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Artur Weber <aweber.kernel@gmail.com>, Jessica Zhang
 <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dzmitry Sankouski
 <dsankouski@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
 <20260306-dt-bindings-display-panel-clean-v1-3-3086eda1efaf@oss.qualcomm.com>
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
In-Reply-To: <20260306-dt-bindings-display-panel-clean-v1-3-3086eda1efaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8D162250708
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29127-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/6/26 13:02, Krzysztof Kozlowski wrote:
> The purpose of common schemas, like panel-common.yaml, is to list
> applicable properties.  It can list common ABI, e.g. "label" property,
> and pure hardware related properties like power supply or GPIOs.  In the
> second case it means that all panels have these supplies or GPIOs.
> This is the only meaning when hardware property is allowed in common
> schema, because bindings are precise and we do not define common schemas
> for "possible" hardware configurations.
> 
> Following this, all panel bindings which reference common schema and use
> "unevaluatedProperties: false" do not need to list these common parts.
> 
> Simplify such bindings to also reduce copy-paste code and review time
> for new contributions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml | 5 -----
>   Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml | 2 --
>   Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml | 4 ----
>   Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml | 3 ---
>   Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml | 2 --
>   .../devicetree/bindings/display/panel/innolux,ej030na.yaml          | 5 -----
>   .../devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml | 5 -----
>   .../devicetree/bindings/display/panel/lgphilips,lb035q02.yaml       | 4 ----
>   Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml | 4 ----
>   .../devicetree/bindings/display/panel/novatek,nt36523.yaml          | 3 ---
>   .../devicetree/bindings/display/panel/novatek,nt36672a.yaml         | 3 ---
>   .../devicetree/bindings/display/panel/raydium,rm692e5.yaml          | 2 --
>   Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml | 4 ----
>   .../devicetree/bindings/display/panel/samsung,lms380kf01.yaml       | 6 ------
>   .../devicetree/bindings/display/panel/samsung,lms397kf04.yaml       | 6 ------
>   .../devicetree/bindings/display/panel/samsung,s6d27a1.yaml          | 6 ------
>   .../devicetree/bindings/display/panel/samsung,s6e3ha8.yaml          | 4 ----
>   .../devicetree/bindings/display/panel/samsung,s6e63m0.yaml          | 2 --
>   .../devicetree/bindings/display/panel/sitronix,st7701.yaml          | 6 ------
>   .../devicetree/bindings/display/panel/sitronix,st7789v.yaml         | 6 ------
>   Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml | 4 ----
>   Documentation/devicetree/bindings/display/panel/tpo,td.yaml         | 5 -----
>   22 files changed, 91 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
> index 0aa2d3fbadaa..72cbb9ee5eae 100644
> --- a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
> @@ -20,11 +20,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  backlight: true
> -  port: true
> -  power-supply: true
> -  reset-gpios: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> index 56bcd152f43c..2c60d0cd704e 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
> @@ -33,8 +33,6 @@ properties:
>     vsp-supply:
>       description: Negative source voltage rail
>   
> -  port: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
> index ef5a2240b684..cc80d0e90f1a 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml
> @@ -34,10 +34,6 @@ properties:
>       maxItems: 1
>       description: Display data/command selection (D/CX)
>   
> -  backlight: true
> -  reset-gpios: true
> -  rotation: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> index 4bdc33d12306..c97bfd0f2ebc 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> @@ -29,9 +29,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  reset-gpios: true
> -  port: true
> -
>     vcc-supply:
>       description: Core voltage supply
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> index 5f41758c96d5..3cada0f82951 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> @@ -40,8 +40,6 @@ properties:
>     spi-max-frequency:
>       const: 10000000
>   
> -  port: true
> -
>     vci-supply:
>       description: Analog voltage supply (2.5 .. 3.3V)
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
> index c7df9a7f6589..59cc7edb22bb 100644
> --- a/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
> @@ -20,11 +20,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  backlight: true
> -  port: true
> -  power-supply: true
> -  reset-gpios: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
> index d86c916f7b55..fe7ad266e1b0 100644
> --- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.yaml
> @@ -20,11 +20,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  backlight: true
> -  port: true
> -  power-supply: true
> -  reset-gpios: true
> -
>     spi-3wire: true
>   
>   required:
> diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> index 3de17fd8513b..3c8c65c6a869 100644
> --- a/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml
> @@ -20,10 +20,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  label: true
> -  enable-gpios: true
> -  port: true
> -
>     spi-cpha: true
>     spi-cpol: true
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml b/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
> index 1cffe4d6d498..eb9eeba92359 100644
> --- a/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml
> @@ -24,10 +24,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  label: true
> -  port: true
> -  reset-gpios: true
> -
>     spi-max-frequency:
>       maximum: 10000000
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> index c4bae4f77085..b9300a1f2646 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> @@ -37,9 +37,6 @@ properties:
>     vddio-supply:
>       description: regulator that supplies the I/O voltage
>   
> -  rotation: true
> -  backlight: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> index 800a2f0a4dad..5d16d8511725 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> @@ -47,9 +47,6 @@ properties:
>     vddneg-supply:
>       description: phandle of the negative boost supply regulator
>   
> -  port: true
> -  backlight: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
> index 7ad223f98253..616a5f3ec9fc 100644
> --- a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
> @@ -34,8 +34,6 @@ properties:
>     vddio-supply:
>       description: I/O voltage rail
>   
> -  port: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> index bc92b16c95b9..2e64fba472cc 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> @@ -20,10 +20,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  display-timings: true
> -  port: true
> -  reset-gpios: true
> -
>     vdd3-supply:
>       description: core voltage supply
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> index 74c2a617c2ff..828b7d7ba17f 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> @@ -31,8 +31,6 @@ properties:
>         configuration.
>       maxItems: 1
>   
> -  reset-gpios: true
> -
>     vci-supply:
>       description: regulator that supplies the VCI analog voltage
>         usually around 3.0 V
> @@ -41,8 +39,6 @@ properties:
>       description: regulator that supplies the VCCIO voltage usually
>         around 1.8 V
>   
> -  backlight: true
> -
>     spi-cpha: true
>   
>     spi-cpol: true
> @@ -50,8 +46,6 @@ properties:
>     spi-max-frequency:
>       maximum: 1200000
>   
> -  port: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
> index 4cecf502a150..c04d47e59f24 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
> @@ -23,8 +23,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  reset-gpios: true
> -
>     vci-supply:
>       description: regulator that supplies the VCI analog voltage
>         usually around 3.0 V
> @@ -33,8 +31,6 @@ properties:
>       description: regulator that supplies the VCCIO voltage usually
>         around 1.8 V
>   
> -  backlight: true
> -
>     spi-cpha: true
>   
>     spi-cpol: true
> @@ -44,8 +40,6 @@ properties:
>         maximum 300 ns minimum cycle which gives around 3 MHz max frequency
>       maximum: 3000000
>   
> -  port: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
> index d74904164719..0d57f97e8a76 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
> @@ -30,8 +30,6 @@ properties:
>         configuration.
>       maxItems: 1
>   
> -  reset-gpios: true
> -
>     vci-supply:
>       description: regulator that supplies the VCI analog voltage
>         usually around 3.0 V
> @@ -40,8 +38,6 @@ properties:
>       description: regulator that supplies the VCCIO voltage usually
>         around 1.8 V
>   
> -  backlight: true
> -
>     spi-cpha: true
>   
>     spi-cpol: true
> @@ -49,8 +45,6 @@ properties:
>     spi-max-frequency:
>       maximum: 1200000
>   
> -  port: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> index 05a78429aaea..00ce5a4e1c6b 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
> @@ -22,10 +22,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  reset-gpios: true
> -
> -  port: true
> -
>     vdd3-supply:
>       description: VDD regulator
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
> index c47e2a1a30e5..b65f0688bdf0 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml
> @@ -21,8 +21,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  reset-gpios: true
> -  port: true
>     default-brightness: true
>     max-brightness: true
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> index 1e434240ea3f..044b84d8638d 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> @@ -49,12 +49,6 @@ properties:
>         If not set, the controller is in 3-line SPI mode.
>         Disallowed for DSI.
>   
> -  port: true
> -  reset-gpios: true
> -  rotation: true
> -
> -  backlight: true
> -
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> index c35d4f2ab9a4..e4fa05163d2d 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> @@ -24,12 +24,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  reset-gpios: true
> -  power-supply: true
> -  backlight: true
> -  port: true
> -  rotation: true
> -
>     spi-cpha: true
>     spi-cpol: true
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> index 5a8260224b74..12e5ad504001 100644
> --- a/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml
> @@ -20,10 +20,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  label: true
> -  reset-gpios: true
> -  port: true
> -
>   required:
>     - compatible
>     - port
> diff --git a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> index 7edd29df4bbb..855911588d73 100644
> --- a/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/tpo,td.yaml
> @@ -25,11 +25,6 @@ properties:
>     reg:
>       maxItems: 1
>   
> -  label: true
> -  reset-gpios: true
> -  backlight: true
> -  port: true
> -
>     spi-cpha: true
>     spi-cpol: true
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


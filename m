Return-Path: <linux-renesas-soc+bounces-29128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJbwMvIpsGlHgwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:25:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA7251E7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BCE0317D33C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 13:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE6F39BFF7;
	Tue, 10 Mar 2026 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4tQ0F7o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E33BE654
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 13:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148114; cv=none; b=GIgEOi49niR5XeQlBPH5YgbG8Ac19P4bKkFrkgr8dkG8LNldc2Th2SHyNg8Dv9BpCVnMacZkbixfIOC+PxCuedddFEn9MhsFDGh82EsVlWlx3xgdUcm8Aa0H2ISdj8Xg6KmC0yTE8nMrR4rcoPMQxi98RRIMjSre1kEXC/F2Yhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148114; c=relaxed/simple;
	bh=wKVs27EEt0N9M8uATMnOjSiqYHdpeLtqcMeHE7FPGtU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gryr+/gir1mDcztSkCAiLzA832PGQb+6hAu/n4Bhoa0Xx+FCo4645TuV/uY/EXv91Y/aC41jvVWHfAKXVMMJ+l3Ojr1pc9djvdEGgp07eNjcEgtQ1jR392RqXtc4MyYfQE3+BfGuEhDWAit4PSoMoHBItB3gWUKk0LNp307OQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4tQ0F7o; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48539d21b76so18122645e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773148111; x=1773752911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Qwiu5L5HKkB/c02A8Q4VnU+0vuAdi7H59d55yhEY5A=;
        b=c4tQ0F7o1CDCBVY3E4CsXgHbDH5kfWjhJE72kdFVOXs1bQCWwx0uajF9UoUlWS0+uP
         5eKtdPZysVoOf3VStqyVzozMKePwrnPwq7YzFB7HXEmpl+0hN7qh5J6G1cMvlCTaXq6l
         VrNXuM39Wv+Ws6VvcB8Ihe13otXOoVG+ZlDj+7Pf/+2eqlfGKEYyI+KTckkNZ5iqQNWQ
         rwEL4N/qc1kj4fMpk8HibTxN+XRdk5nhcshrQRBmkTLYLS4K9wdqlmfrPrivO0X51SD3
         7PsgxvHr3OAdb/kN7+F42FHevcfwuEDStFSBTeF5O3yeG275OXbUN8yZA8itW5RV3s0c
         L/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148111; x=1773752911;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Qwiu5L5HKkB/c02A8Q4VnU+0vuAdi7H59d55yhEY5A=;
        b=CwpDv6WyY200ty+Z7t2TOvM6ug8iuRlW27I3Ini8O9I3JG58wY5TbzCK+EGnhDdd4n
         euJ8aZPAmCj24Bj4zCZ1jXYGKc4o2liRVLKNHqHJq/5nnL6nYU78x/5AY/yhFBH+3ST3
         hktibs+oEf+siBCoAgrvJ0OJaYyA3TGvT1sdi55AqhUWI/VJjA2cId+ppHgHiYVs+aLv
         vZSIEBsdgVZFN3UPdLXJZpRVtJonZLlNNWFOC4ZHdHa5cqLsJF5f663gPVmGs92o6oYl
         dAsAXzisY9cIrdiAb2/K2yrF3vaeVpuZgEHQ7hhSkjvNzHicYvsSCtUQ1nJcuNwtMNQD
         Ar9A==
X-Forwarded-Encrypted: i=1; AJvYcCW41I7FMF9f3L7Pda/hYU5971nDsXeekrFBRM+s8UPNNWjM7wmKyPD030O0TW+E3VBZkEaIJiRqwNicgJFgQ8LMfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNnUKZP0ria7Jygyqac0uE+TrpdggRhA7/7yHs1PSHL540XO2
	gdh2mbpL3S/rL7qvFlN7oJlbBt88Mbz7Y74GlLfqujjXp6h3RPRQ7XF9MP8+svlP+nk=
X-Gm-Gg: ATEYQzyiklzRRh7aAbBpH8O8vNq2dyzg9Q04m7aAhO/TnmJOXg7utDhAP/ZGJop+9IG
	ULAXrIeQCoTHmbrAD6f+smOucfG2QRPEjohld4YlyRMR7cP1W/3RW6NAo037ABFm14h3SP1lBpM
	A6nBlzUTTCblRPn3Ar+bAZf+fBaXdu1qlFGmf3x6tyRFbzbQVQjmNktQpYOFUN5gbB+uPqHnJMA
	X44i2htUpoVeFrVi/hFv0WbgojziVYqSxchZDInfFydK/ew+cUqNu9w2/wEkVcEKXPQh4k98wNA
	9wDT54qne1cK/ISP4GGa/00+FgYc5NxCcfwmddAKap/26K2P6XpnamsdZ0MqlpOGN3Z/LJqblHz
	lny0r+GCi168lJX2YqoTf10UoL1qehpSDpnKsLUFaVpN7GKjQ7Uca+1R60dj4luEVXfmFfs1hsE
	/ZfvdyHakJUfpNC6PYY4/VdQq2WzS3zaDXpYLYzohE85BN2AZLJCvM/R4y6qzM6Dr4YhNC25BR/
	F3f
X-Received: by 2002:a05:600c:608c:b0:485:419c:4eab with SMTP id 5b1f17b1804b1-485419c50a9mr57466295e9.6.1773148111022;
        Tue, 10 Mar 2026 06:08:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d81:e92:c4c0:3c45? ([2a01:e0a:106d:1080:4d81:e92:c4c0:3c45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237e8095sm216735465e9.2.2026.03.10.06.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:08:30 -0700 (PDT)
Message-ID: <d6ae5f54-1471-4427-a95e-d5c40d2d1d2f@linaro.org>
Date: Tue, 10 Mar 2026 14:08:29 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] dt-bindings: display: panel: Align style of
 additionalProperties
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
 <20260306-dt-bindings-display-panel-clean-v1-4-3086eda1efaf@oss.qualcomm.com>
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
In-Reply-To: <20260306-dt-bindings-display-panel-clean-v1-4-3086eda1efaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 41DA7251E7E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29128-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,qualcomm.com:email,0.0.0.1:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/6/26 13:02, Krzysztof Kozlowski wrote:
> For code readability the bindings are expected to follow order shown in
> example-schema.yaml - put the additionalProperties/unevaluatedProperties
> entry at the end, after listing all required properties and possible
> "allOf:if:then:" conditions.  Meaning of this style is to close the
> schema, after listing what it contains, with final "nothing more is
> allowed".
> 
> Move the code around adjusting it to coding style.  No functional
> impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/display/panel/advantech,idk-1110wr.yaml       | 4 ++--
>   .../devicetree/bindings/display/panel/advantech,idk-2121wr.yaml       | 4 ++--
>   .../devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml     | 4 ++--
>   Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml | 4 ++--
>   Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml     | 4 ++--
>   Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml   | 4 ++--
>   .../devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml       | 4 ++--
>   .../devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml       | 4 ++--
>   .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml         | 4 ++--
>   Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml  | 4 ++--
>   Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml  | 4 ++--
>   .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml         | 4 ++--
>   .../devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml          | 4 ++--
>   .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml      | 4 ++--
>   Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml  | 4 ++--
>   Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 4 ++--
>   .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml          | 4 ++--
>   17 files changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> index f6fea9085aab..76b48836ddf6 100644
> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
> @@ -41,8 +41,6 @@ properties:
>     panel-timing: true
>     port: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - data-mapping
> @@ -51,6 +49,8 @@ required:
>     - panel-timing
>     - port
>   
> +additionalProperties: false
> +
>   examples:
>     - |+
>       panel {
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> index 05ca3b2385f8..c9b066e69e2f 100644
> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> @@ -56,8 +56,6 @@ properties:
>         - port@0
>         - port@1
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - width-mm
> @@ -65,6 +63,8 @@ required:
>     - data-mapping
>     - panel-timing
>   
> +additionalProperties: false
> +
>   examples:
>     - |+
>       panel-lvds {
> diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
> index bbf127fb28f7..46e7cff5b2fa 100644
> --- a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
> @@ -22,10 +22,10 @@ properties:
>     enable-gpios: true
>     port: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - power-supply
>   
> +additionalProperties: false
> +
>   ...
> diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
> index 287e2feb6533..9a2c532dbc92 100644
> --- a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
> @@ -22,10 +22,10 @@ properties:
>     backlight: true
>     port: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - power-supply
>   
> +additionalProperties: false
> +
>   ...
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> index 5725a587e35c..182a2b825e1c 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -54,8 +54,6 @@ required:
>     - vcc-supply
>     - iovcc-supply
>   
> -additionalProperties: false
> -
>   allOf:
>     - $ref: panel-common.yaml#
>     - if:
> @@ -68,6 +66,8 @@ allOf:
>         required:
>           - reset-gpios
>   
> +additionalProperties: false
> +
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> index 3cada0f82951..aeb7cb26c058 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> @@ -49,8 +49,6 @@ properties:
>     vddi-led-supply:
>       description: Voltage supply for the LED driver (1.65 .. 3.3 V)
>   
> -unevaluatedProperties: false
> -
>   required:
>     - compatible
>     - reg
> @@ -66,6 +64,8 @@ then:
>     required:
>       - port
>   
> +unevaluatedProperties: false
> +
>   examples:
>     - |+
>       #include <dt-bindings/gpio/gpio.h>
> diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> index 96621b89ae9e..43e98bb07c38 100644
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
> @@ -47,8 +47,6 @@ properties:
>     panel-timing: true
>     port: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - data-mapping
> @@ -57,6 +55,8 @@ required:
>     - panel-timing
>     - port
>   
> +additionalProperties: false
> +
>   examples:
>     - |+
>   
> diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> index 37f01d847aac..2af993d73619 100644
> --- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
> @@ -44,8 +44,6 @@ properties:
>     panel-timing: true
>     port: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - vcc-supply
> @@ -55,6 +53,8 @@ required:
>     - panel-timing
>     - port
>   
> +additionalProperties: false
> +
>   examples:
>     - |+
>       panel {
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> index 1e4f140f48b8..1f697dab832b 100644
> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> @@ -31,12 +31,12 @@ properties:
>     reset-gpios:
>       maxItems: 1
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - reg
>   
> +additionalProperties: false
> +
>   examples:
>     - |
>       dsi {
> diff --git a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
> index ccd3623b4955..871e4c2d9824 100644
> --- a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
> @@ -21,11 +21,11 @@ properties:
>     backlight: true
>     port: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - power-supply
>     - backlight
>   
> +additionalProperties: false
> +
>   ...
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> index 46fe1014ebc4..8fb7c013dfb8 100644
> --- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> @@ -33,13 +33,13 @@ properties:
>     reset-gpios:
>       maxItems: 1
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - power-supply
>     - reg
>   
> +additionalProperties: false
> +
>   examples:
>     - |
>       dsi {
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> index f1723e910252..1bbe0da3997c 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> @@ -43,13 +43,13 @@ properties:
>     no-hpd: true
>     hpd-gpios: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - enable-gpios
>     - power-supply
>   
> +additionalProperties: false
> +
>   examples:
>     - |
>       #include <dt-bindings/clock/qcom,rpmh.h>
> diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> index e32d9188a3e0..1beb4ba92248 100644
> --- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
> @@ -41,8 +41,6 @@ properties:
>     panel-timing: true
>     port: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - port
> @@ -51,6 +49,8 @@ required:
>     - height-mm
>     - panel-timing
>   
> +additionalProperties: false
> +
>   examples:
>     - |+
>       panel {
> diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
> index d817f998cddc..0819f38a9d2c 100644
> --- a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
> @@ -31,8 +31,6 @@ properties:
>   
>     power-supply: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - enable-gpios
> @@ -42,6 +40,8 @@ required:
>     - port
>     - power-supply
>   
> +additionalProperties: false
> +
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
> index 187840bb76c7..49ef45c03593 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
> @@ -25,8 +25,6 @@ properties:
>     port: true
>     reset-gpios: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - reg
> @@ -35,6 +33,8 @@ required:
>     - reset-gpios
>     - port
>   
> +additionalProperties: false
> +
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> index f0a82f0ff790..f61a528c0413 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -36,8 +36,6 @@ properties:
>     port: true
>     reset-gpios: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - reg
> @@ -46,6 +44,8 @@ required:
>     - reset-gpios
>     - port
>   
> +additionalProperties: false
> +
>   examples:
>     - |
>       dsi {
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> index d5a8295106c1..c99f4146f1bb 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> @@ -26,8 +26,6 @@ properties:
>     port: true
>     reset-gpios: true
>   
> -additionalProperties: false
> -
>   required:
>     - compatible
>     - reg
> @@ -37,6 +35,8 @@ required:
>     - reset-gpios
>     - port
>   
> +additionalProperties: false
> +
>   examples:
>     - |
>       #include <dt-bindings/gpio/gpio.h>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


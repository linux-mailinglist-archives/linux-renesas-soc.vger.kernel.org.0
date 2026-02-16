Return-Path: <linux-renesas-soc+bounces-28261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN7UMHA/k2kg2wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:01:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B3E145DD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 17:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A839B300FEFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 16:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2693331212;
	Mon, 16 Feb 2026 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQSYovJb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694633D544
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257684; cv=none; b=n8VxEKdUWRVZaFN95Tg25CI+V7gNd7/YMjEyKLl5de/3GTrigFn7A7TmRczy+8KD9946hTuFfH5+8AhclX/fBPoDg+XyedE2mgRrZDPS6V7O14SzJn7eC7RvnshXW3+A7Zjk/KFRWc+Ix+AdxaFT3XkgKKAUuV0ByqXZxcjQiSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257684; c=relaxed/simple;
	bh=ICFY/FglSHrH1Z9iGwxybkFrXH6UwDjtopfxEgM4QJI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tdn+6YMJSNxHx93Hg1NYdK9PpWT4Zqu5BpnosY4jLjUMPTd9vY32cqqXRUB8h4okVsgem2YXUSPZejmcNRUXD7LWf+MzaJqQIdF9lOzg6Va6GZ/L0GrtxOwcfQjG8ZNI1wUGCQkyxNcrFfn46zakLDye2RcT0o+LKE5sqT0FxnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQSYovJb; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-65baa72399fso4441435a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771257681; x=1771862481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUAlu6XYigsGBemijuVDswvQMOiLK2+waYYTQNmfMck=;
        b=KQSYovJbrFvfGfe+/I4RIdGB2ze5by2aGkMRCOTmkIU1E2GK/DkJlgvOqcdWlp+lKx
         I3CwujlWny/FR86knWcDUzLMvzOKlkOv3ffXJVLbjFY8/AbPt02Wa1Lw51jhhFmJXPrr
         4nPvJghHaJrky4F8vH0cZk8XUS714mzHApXXUtMMAhwD9mx2+fxZMT+er5LG9LRFZaOn
         hg5xA+RRMMHMV0oroA2f52Z7lm8MhBgX+EEECe69A24TQoMLZM/VvsyJ5U79H+b7vjkk
         k1aJSpfqj8rJV8vxee43wCqLgItb6YkVgfouNKZUUhZVo93bweKeLBN14kIjly3kvZQq
         9DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257681; x=1771862481;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUAlu6XYigsGBemijuVDswvQMOiLK2+waYYTQNmfMck=;
        b=p3LpfMZRXFNHJ/Nz66pswFlbsq0oWOR4yUi+VxLVoBrSnXVbH4FlCJvoeOwAK8fRhA
         TGvs5vuyf1zgCnzyyJsRomTdGS8GBq3Dc/JUuie6i+VEJgaqrT2+FcQ+2KsQsH2JR+pZ
         Nj0uG9w+PzWs417/JKbQmsUeHmH1sDFAWs58yEq2/cawdOcqc/FqypevfqZNDsy9/0fu
         P6fz2WqIj0rKWxBxT0zIDwnahs0CtO53teFYwZxVs1NQWowK7Doyzi/xPzojzf3tk+Tb
         Orz62u/xhub4nM5/ZShIZlLt/Y4rwoWv0TpNqzsVJjZPCPa82umVkj75v41UkefbdJ2h
         r9wA==
X-Forwarded-Encrypted: i=1; AJvYcCUA8uVTl/+4ikbDEsqb7Rp+iXIiy6hGtxZrtWu7YqH/2LhnbNt0uguUl0xwcVKBPkyXdSktRHtZX8HddOa/yIFaJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz31YDQn8yrOEVO13CncHyvH2WO7BdW7VQS4FYnACbbc4MBMKPB
	NPq9Gw6NnDw8uAnzlPTamTQKAuAnhuj7F6IokyP7a/HIYG/2yq3nveQX/XGp4vWH5co=
X-Gm-Gg: AZuq6aJxm6hO1ASaJnAnKirEl2+9I0gun65rifp3014SXzDq1s6QGGvY/5WgHJfy4zE
	IEBhxQEUdByRq5NrN1pBVftJqmFjyO/Bsyefa3/E/SGYOflJFmneLcoRL5/eEWNGhIqwKv1s7ZN
	szlStW7mzAkgMlwlN0o5ezukYXyjqX5wrYO+I3mzoArWdCXtnl5Io8vL8Ak0z8Ic6MYKrNQxTaO
	GwMoCQA22ENEg7sERk9Sg0809lriQnLNYPpRasf826Mi3JqS9u0SL/cD3Bi+lgtyh6cL9iDdpw9
	xegfC76n8wQvPOhhQ2jrXzwWLtA6flw0wj/aT/NdyHlDl3kVyCQ8LR7Odxw/wrcWbx/odN/YlPS
	MxsViS41VQt5T23h9J51a6tiF5lfRfGFGywlJHHPUwPLDW79rF84QSX4L5JRuhQ0saeIXQNJbYn
	E5+UXbCZXcIq60OjFzqoZ5VODlEMHdoGvEKZ5uXm0IXQTO6dmlvUfNZcIAAtQEU/b270ZwqhAbD
	VTlZg==
X-Received: by 2002:a17:907:6d22:b0:b88:505d:2ac with SMTP id a640c23a62f3a-b8fc38f90eamr352340766b.1.1771257680468;
        Mon, 16 Feb 2026 08:01:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a? ([2a01:e0a:106d:1080:80b4:8b51:72a6:9e2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76c7015sm259165666b.66.2026.02.16.08.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 08:01:20 -0800 (PST)
Message-ID: <b10bf126-d664-42e4-a333-10657eca6d94@linaro.org>
Date: Mon, 16 Feb 2026 17:01:18 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,linux.intel.com,ravnborg.org,ffwll.ch,suse.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28261-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 93B3E145DD7
X-Rspamd-Action: no action

On 1/17/26 01:49, Marek Vasut wrote:
> Add WaveShare 13.3inch 1920x1080 DSI Capacitive Touch Display support.
> 
> While the panel is described as DPI panel, it is part of a larger unit
> in non-removable metal casing, so the actual internal configuration is
> not known. The panel is attached to "waveshare,dsi2dpi" bridge via DT.
> It is likely that internally, this panel is an LVDS panel, connected to
> ICN6211 DSI-to-DPI bridge and then another unknown DPI-to-LVDS bridge.
> 
> Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V3: New patch. Note that the compatible string is already part of
>      Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 30 ++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 91ab280869bac..40a73c32b0b17 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 = {
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
>   };
>   
> +static const struct drm_display_mode waveshare_133inch_mode = {
> +	.clock = 148500,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 88,
> +	.hsync_end = 1920 + 88 + 44,
> +	.htotal = 1920 + 88 + 44 + 148,
> +	.vdisplay = 1080,
> +	.vsync_start = 1080 + 4,
> +	.vsync_end = 1080 + 4 + 5,
> +	.vtotal = 1080 + 4 + 5 + 36,
> +	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> +};
> +
> +static const struct panel_desc waveshare_133inch = {
> +	.modes = &waveshare_133inch_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 293,
> +		.height = 163,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +	.bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE,
> +};
> +
>   static const struct drm_display_mode winstar_wf35ltiacd_mode = {
>   	.clock = 6410,
>   	.hdisplay = 320,
> @@ -5598,6 +5625,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "vxt,vl050-8048nt-c01",
>   		.data = &vl050_8048nt_c01,
> +	}, {
> +		.compatible = "waveshare,13.3inch-panel",
> +		.data = &waveshare_133inch,
>   	}, {
>   		.compatible = "winstar,wf35ltiacd",
>   		.data = &winstar_wf35ltiacd,

LGTM


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


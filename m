Return-Path: <linux-renesas-soc+bounces-18264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22BAD87DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 11:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21CDB16C145
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 09:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BDF291C0F;
	Fri, 13 Jun 2025 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3AQDSH0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87B2C159F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 09:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806975; cv=none; b=JZyHRTP2f0p2iqTeCr/IyiSY2SfKuAiHexvv4TFgiRPOfbfoPeYynYqQhpg0+uR6iiKvTcZn8s3tAtyzmFmo4q0KObkVmf1u1Uj14kuqqrUwuNeKKk/VPHhglPT/PO1Fgylk3+89E64cxkBzYtvv1G04RNXkf+YiyPlFHpzqUo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806975; c=relaxed/simple;
	bh=bp8MkveZepRghThB6Wx0XwFx28G0CjBOmYfkM6wef7I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QmJ8RrVDG/ThBUwGJAukrG786IEF6E34BulmXagR4aUpmuJ10p0Tnn7IWrffa7qxZ7yzeaajcIbhPMzxBgnLoP0l2TA/uQfEv2elpy6vD2JcCjVnI9gPhNjMb7Jaaozs8tNGS4sjBSQKG1aljn4ZQQrBBHLmvBOG2CaQ1VQyIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3AQDSH0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so16208105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Jun 2025 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806972; x=1750411772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeL8Qu7sf4nHqQXLmDoMdNP1wTEq9OCx9eW5FTGzoxA=;
        b=I3AQDSH0TxAxJ1kKiqY0tNFEV5WE15QrFckw1cKbnpAZ+ew15oQ4+JcKCa12lZgDVZ
         gLtGzEQzDhbvUNr+F64Xtbyf0AXN6pb1vQn7uJYkVc7yYFgz2F5Dz7UBz6nXURBG11kE
         eQfLG/bd/ZnlB4QDkRJi1egThwDpORTWbEr+QE2obZ3AvTahUVH3PAMFjULVL7koYPU8
         F844oUGFWTdW1Fx41USUGcuSZEMF03fPzMc3MNABk9CKsz60lAUh5JuyMGeJpIDyO2Qr
         t9qqsPOlgH07nuw9DRPt+dRdopGK/RN68lD4ucRwn5ruIlGNNrddSOdmxbSD+4Whr1vX
         ruGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806972; x=1750411772;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KeL8Qu7sf4nHqQXLmDoMdNP1wTEq9OCx9eW5FTGzoxA=;
        b=aGzSkx72zIInEoKRPI1JF99IwVJ7Kka6G313fx9TqxYJydqV2p5BDZIlLmYssRDB+w
         UbLJRqVAcpfDOlr7w1AMuxmUa3orer8HMWtH/eoJFa+CM6mLeoKK8H418qWykqGppeQx
         Zu71LBf1KuY5u5+3bBTprACn7WYj8su48maLJB4Gvhg9L2QT1WMykEElat5NX9GZcKfa
         pL5+6s9BYsXnexwe9IL5hmwrppoHSWmAHM9pgVchJRQQ2/cMl/oiFInEATfdVfjOizNl
         kZYEj47t+1mN9qzuu1Xbv8WR9uZOvC986aeWThOPMqwM6oLj2ygfBlsD7tzuRbY6IB57
         ckNg==
X-Forwarded-Encrypted: i=1; AJvYcCWPy8UUKCjL7LfigfIAKXiEcMQue4FVWcBxGfruApYbmgy4N4BGaQX+9V1t3H9mXAgTFIuiyRovYmneZEWlWjF8/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwe/hUubnuPBhte7pix0RrwadiHxIDSswkvXD3Cof4XvLHocv
	/bGxlUafp8o9ovOQYtb8hBlMt6jnlwQy1pAhBPyEXYO9mZKaopHqXYe+NOaHet5JKBY=
X-Gm-Gg: ASbGncsLllayi6+4lhlgJoYDTW1Zyg3fc0rchpKfnpZG/GXRO+IHhLFRpm5FlZysnZZ
	Ry0EECSy4npUDku88MTliIXLYf0st9pdYCdq1krh0tt6NGP35ehtW4HQECIpNq6NI17wzAGinBi
	FfL1665w2/gzCfsPB9FmOPgQmC+u8sugM68bRBZ4VQ0piiMh6NTV5aLm0nuIaIERXcwlqxwpwCV
	5RydYEZO6oojczEZhpKAUFcVstiNmHxDmoLHQJgHwHNtXP8wzTLARSNLbC9VA9mQ/VPsM2RvbLE
	2ffsoE3e9ese5rJkU6K0OAqpm270TR3fDWeie+WXruYoxMgfmLPbj6Hqz1D1widfzVV6CCHF4VM
	JwxPInd/GGN7L6mS4OecJn/0TgZRbwg5vE+YCJwQ=
X-Google-Smtp-Source: AGHT+IEzzHJggQutbv3FMIU2Sx3ItVvGBq6L+6GRQBSROzILQYMREAdEAhkrfD0tQzijGCqm9DStsg==
X-Received: by 2002:a05:600c:c8d:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-45334af6e5emr19523925e9.30.1749806972208;
        Fri, 13 Jun 2025 02:29:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d014sm46883265e9.24.2025.06.13.02.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:29:31 -0700 (PDT)
Message-ID: <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
Date: Fri, 13 Jun 2025 11:29:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2025 01:49, Marek Vasut wrote:
> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
> alignment gap between default_address_mode and lanes members.
> The ili9881c controller can only operate up to 4 DSI lanes, so
> there is no chance this value can ever be larger than 4. No
> functional change.

The u8 will still take at least 4 bytes and cpu will still
do at least a 32bit memory access, so there's no point to change
it to u8.

Neil

> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index ac433345a179..84927302957a 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -43,7 +43,7 @@ struct ili9881c_desc {
>   	const struct drm_display_mode *mode;
>   	const unsigned long mode_flags;
>   	u8 default_address_mode;
> -	unsigned int lanes;
> +	u8 lanes;
>   };
>   
>   struct ili9881c {



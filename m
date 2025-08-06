Return-Path: <linux-renesas-soc+bounces-20044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198FB1C755
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 16:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1998B18C3917
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 14:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A6B28CF58;
	Wed,  6 Aug 2025 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Delc9JxC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346728934D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Aug 2025 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754489279; cv=none; b=GiTl1xlVuxXCkpiuiEtPqgt1Xy5sAn1UFsL+ylmGoSMfxahHB6ioG17ZoCgbHnYeKdoGqz7pQCuDpuBs6a28a63mE6dChsXIkcF4dUQlfLMRREqxqGc6TuPSUnF7A8rWiB9WU8EBIPncrF4p2Ynm+tRxLcUxbXoDvADIKWDktn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754489279; c=relaxed/simple;
	bh=5ClgcGgo+fcnd+8D57GTJTfiQF9syoEA+kAp4PAKd/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7392a2fB/VOK8vP2qkEZE2SF0rEKsZlAj81lYIGqaAPjZRKGhxWNBxpODLDqdO76lIcMWmRQiXRJAY7ydF2n7EqwQOj/eWeYYNBRHq5o19Apqa4YF9dzmFsswONxmNEOGVrvNXJUEqyOZLBZ8QK504L+6xKKT2uRdW1Ic4ynQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Delc9JxC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-458baf449cbso41638325e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Aug 2025 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754489275; x=1755094075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8Pm5cYrQInMJGl5+hX9jruWqynnloC64HQ1dkE8Byo=;
        b=Delc9JxCsY5eTnL5rNllonFu1BMz9wDykIBaYyBDWyRTMIUsnqWC4HoTyBs1vo0f0e
         WGe1RBieQeT89x8MWTo90Xz1DfgM3Xs7FvnhI2DJ0Amu9yzAVb9eZG6CEmgGEPccJ+ir
         ilwkMHvVBovhhoPLNvI7lS9krjNZNJByKZQwJzLFzK3piBp267c0k8vy40AY1Ig28W2p
         cdCAReIjSg0Geyn2Gr6uMwKv1cSMLgvbbjSGnVzLWk1ZUGqdFg110cYNI54e3fTk1UP+
         GqA4bmnkYLmaGzd/5dAD/mNb6A/fS87tM/lk/sw3LeERlmIxqmp6nZOyu9/YBKlJfyVU
         pO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489275; x=1755094075;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q8Pm5cYrQInMJGl5+hX9jruWqynnloC64HQ1dkE8Byo=;
        b=qSvq3j3wkiXbLNCiO5q2cGyOZ/wpdWJ8bYzMZ1Jt7Pkdwubxj7ohcNyaUBDUMH5cjh
         P9aWQBmsgWYOxXbdCMaGjAJpdw66w8haXQoiFormH1ZhLT2EvtD2lYwM2gQQtDVXcg05
         F2Urksc4VJ4JcwW/HFWFqH056ErehuWoqZZWExiIQJDDH6OGd8MAAMfbdlvJhbATkdzB
         QEJPGVgYm/kK7YMa8d8RYD0/nBOCm1HTWkLuukXaHbhc+zpt8qy6e/43arbToUjnxq8a
         /OzKQn1KNkM+i0xrgq0ETlqHJUq8iFzsEkzuCQNWnmKOklGxUa0hJpHAO5nNyINtzWtl
         k6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWDtC+IW7ey/sKppPM7x6+N+IaMMNE/GUmcpXMqS5Wu5YI5hGG3idM8oTkOGBIgql1or4/aqMOYhWdrFWWzFYyTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweWxXoCaJZYQlJy/Wa9Y6+Ubv4xNbIRtM3lTfbmR48zVm2hE59
	lvzz/WhSAe3ayoMgItXydciOlWqJsQG6sAB/pBfaBEVp8LOy3ZOXn+WkQ/uoJFxrLwY=
X-Gm-Gg: ASbGnct4dRsOhSMAeysHdwe4dwUJzA7KI1dg8HihxbYP5OemsNdgd9G9lFLTXv8umWt
	7lcJ8iTaxtWNqls6Koi/EVPuyA7QTQz+gOvW1a9LvEvZG1NjKUXPTOxt3kE9rdELLTHcMYDp1lb
	T809xEH/okWtMvmy+Njm9CoVAIPs9xNLFjqYjAYMSXdKkkS3AByuJttlJpsCT+tiAD/Rw60RJX0
	t+ezW3ivSV8sGoFm6mpx1eD0JvmlyCJ8mILZfx/XEHBGgQd/7/7k2sDsL0ZnT6Ed1MEIsV62p7Q
	ZIjiMnmmiNaBpN1PjI+FDkeNGReSjHK01Fl68DmcbgI0zNEf5JVPrArjP1R2Tc6+Q18ToI20wXi
	/+YP7bVGEmjWT+44gxmIALJ1jv83M6ZqZPjSOJBWzpJW3ZK8UOnLh1a/L42dIHET4Cbh/XNsZ26
	9dtR4RBoyCEw==
X-Google-Smtp-Source: AGHT+IHyy3f0kKEfQMWCY8d3Nqb03JJf0GPhRnQICd+XwnofzSDkX6gRuK7WSpYOcTRPtt5zNiAXUg==
X-Received: by 2002:a05:600c:a03:b0:458:b068:777a with SMTP id 5b1f17b1804b1-459e9ee8b3bmr23272885e9.30.1754489275136;
        Wed, 06 Aug 2025 07:07:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:96df:e381:55b8:1990? ([2a01:e0a:3d9:2080:96df:e381:55b8:1990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5862fd9sm54780515e9.16.2025.08.06.07.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:07:54 -0700 (PDT)
Message-ID: <6ecd2cac-87cb-4921-8c8c-0f04112dff2d@linaro.org>
Date: Wed, 6 Aug 2025 16:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H
 SoC
To: Prabhakar <prabhakar.csengg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250805122529.2566580-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250805122529.2566580-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 14:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add initial support for the Renesas RZ/T2H SoC to the R-Car Gen3 USB2 PHY
> driver. The RZ/T2H SoC requires configuration of additional
> hardware-specific bits for proper VBUS level control and OTG operation.
> 
> Introduce the `vblvl_ctrl` flag in the SoC-specific driver data to enable
> handling of VBUS level selection logic using `VBCTRL.VBLVL` bits. This is
> required for managing the VBUS status detection and drive logic based on
> SoC-specific needs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 85 ++++++++++++++++++++++--
>   1 file changed, 78 insertions(+), 7 deletions(-)
> 
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


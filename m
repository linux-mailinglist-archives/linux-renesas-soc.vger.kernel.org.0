Return-Path: <linux-renesas-soc+bounces-20043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6654B1C750
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 16:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAE5D166357
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 14:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EE628C87E;
	Wed,  6 Aug 2025 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UbIjdm0N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6434628C5C6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Aug 2025 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754489239; cv=none; b=ijMr/OtIydCKZAzzrd771zAk9CQHSZqQ+OvQ0gfqMWTOXyhNdZ54fFKk9RUUUwUZhi99ROtNXFptHb6eff7CwNjSTpAQ1bpbRMBlbq1Aewb/8ZU4e/XEq+/T9rwL1j/6hxstDQZvNHDFuFZaTX2TtPd82+Ji5Xzk3L7qCE63abA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754489239; c=relaxed/simple;
	bh=2ygqqxsmHHFmnLmk5lallRQIazl1vUOWQZ+uN7OQMfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SrHg2fzMQPlTf+eWC3R6rvB+ykjA46noprPIdlQU2el2Olsbes1djknDakciAGaVKODdKymL/2OviFS+Job25qr9g9JYaJToOrtjoTDdYD9xo1dCcifv0XOkYUtGDICcr8nlonEvZ2B9MupTgRNfmOQiJRHT34rA8u4AQYb4yUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UbIjdm0N; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-458ba079338so7696745e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Aug 2025 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754489236; x=1755094036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhOuthvlT0MlIMDwPnmOSf/FcPP9fX8kIIgrDxRdY5c=;
        b=UbIjdm0NA2hTcPKkMgGZtRVn+EoigKhcsaXOM/8yBtGUf+Xqfi1ANojVFR5htjp5EM
         +9ibwgo9WsHfsyCQ5qdp6lvkHy6Vuzca7bkfdPjN+A9oS8oIvDdTV4jcjUz9GF2/OI1t
         atwmzOt2+aGdabS2Lt/MuFQNyc7i/GBEphX6Iyk7z89GczuqJCKVV8JSfrXDXlDeKY48
         qbQpojaiKrY/+WomvDJ5D2x0pb5SZ7z9GToxtH0fXlyJf4dkrnFh/MZ0epwiLOP+UufX
         AVNmDBSyQFHezFdvKXkcOgNbYaTx8OsYqh+hWMw/WKK0oqUMLAvdY1dS4aZg+IoHogd7
         tbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754489236; x=1755094036;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZhOuthvlT0MlIMDwPnmOSf/FcPP9fX8kIIgrDxRdY5c=;
        b=lf5zd0F+9jcpXjFOShjetGeJd1yWzYCtKdkuwXENPpxbtLxf1h6AfOpwdK2kEKJoMk
         lXWJrsyHutk03+OuETL6iJbmMQfHfdPw+ZcgTMc8F1xtcRs4RUfT3WVOl3BzPZAqwDDc
         97849roE3q03ThKOrdFJJXg6OggGa5HLaEAFmyNDF4P8O/NTt10bV5vtohEyCf3Up+ad
         nCvkIYc+nYR78UmLKHZMQo/t9TsqcJ1V7syuGwVvjjBV7ZoE0dYipjVNzNRuNdRHwMLD
         XWhTOFQQ4gjSQIb+1AEnRA6NadiDTY3SNIQc5kcxGNhCUL+ddyZeBs+vV7ggcwJxCklh
         xjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVVzzEjRW76FrPfSZ9r0wwXaXQpA0WuecL9GcXtAjYcZdOoGGmu2KNm54BKfBwUzNLDj60eSEViHlsihTG6vOGZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxegIlfPXs3AMfGgPnUjTLcB19XqcGNM2kAqS0Qp0TBdtdrA5Bi
	v2iZ39fQskpmzCs5yhxQ7gDPcn3b7z85sLNwU2/nA3bRJ70pQbx30IoZJQzjAWPc3DU=
X-Gm-Gg: ASbGncsxzIp0hp5yZwsilRkQHaBQu755js7c8zNZknbm3vf+KW4B31MtvqgIkGVwXCM
	gMC45tO78aCgeoNdNGenBMFGaO6NcN+WPERLCg/9eNHnUqD6MplXzYxbwx1DZ41/9hfWCIywZrn
	ixFeQMtKswSg/M7LG4U0Za6LqZ2fTaq7iFPmXyX6YMbeLhiGiqzcNmXLHhz4EoCk4OLyFz+hmXW
	cp+xA2eDA3KZSxv5QAIPz9eYAV+Rtb2XxtHKpy+qgscUJOOgMxN6Cj5pTUWDqkgwuRge7gThuHx
	FazfsLDRBFEm/Kh5bW2o79eipbbc4ep8KziLyxBYUMl2/VF+rrsM5LDZptZ7g1sCCCSqzDtSgyU
	yy8mE7eT2762Fki9GHJmfl/KQ/NjbsyUjRymYtzG85PaEYuv4y3qJoKQypW7QAyKjZ77xHDZq4o
	M=
X-Google-Smtp-Source: AGHT+IElAVJ4olKnFDIvp4sfDLerMVOE9QoG+knt1/9TjLViLhJO38zvYugIqzTyvf938YTDn2OM1g==
X-Received: by 2002:a05:600c:1382:b0:456:2139:456a with SMTP id 5b1f17b1804b1-459e70e8ad8mr30258465e9.15.1754489235576;
        Wed, 06 Aug 2025 07:07:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:96df:e381:55b8:1990? ([2a01:e0a:3d9:2080:96df:e381:55b8:1990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e583ff76sm50087565e9.5.2025.08.06.07.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:07:14 -0700 (PDT)
Message-ID: <313c8333-3a02-439f-825f-35ebe0592a4d@linaro.org>
Date: Wed, 6 Aug 2025 16:07:14 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/5] phy: renesas: rcar-gen3-usb2: Allow SoC-specific
 OBINT bits via phy_data
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
 <20250805122529.2566580-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
In-Reply-To: <20250805122529.2566580-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 14:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the PHY driver to support SoC-specific OBINT enable bits by
> introducing the `obint_enable_bits` field in the `rcar_gen3_phy_drv_data`
> structure. This allows each SoC to specify bits required.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 27 ++++++++++++------------
>   1 file changed, 14 insertions(+), 13 deletions(-)
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>



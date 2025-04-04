Return-Path: <linux-renesas-soc+bounces-15383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52259A7B819
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 09:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE85189AD3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 07:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE8418DB0C;
	Fri,  4 Apr 2025 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8c2qPUL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB1A18C034
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Apr 2025 07:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743750694; cv=none; b=NDW5Sgh5XGm3u6GoENnu4VDaN+GlvjQ9vCqyiIaVJzLt5FIXeAcK4cjS+PevJzcyPsYyhFo9mUHSOSjYx4vhYlhdK3f8vsFwiaT8+XXySM0rspinitILB0Q3l2m1xRTf8PtMqSaxIqeTJ9xhuqdsOe8dWcWgoHrfv+igIXsuEiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743750694; c=relaxed/simple;
	bh=zdiAzkyu+5KVG+okVpLVQQM/tIeOYc41kqNg4LiANMs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dLFmfv8xxiIUbpK9DtYYlzFg2xn+bnCdmx+vQx2kidP1KliRL1zBxjDn6iErgij3uZ0htAt6kjGRgtnE3gW/ZvKGAdATc+YA86FK8/qX/6lS/03oRXm+ZFYgSH9p1SY8NvKTLa7e1XnRpI6Ap5RdpYYQlUwg4cJeNB3cUZKqYjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8c2qPUL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso11326345e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Apr 2025 00:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743750690; x=1744355490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQmJkyko0OhYAsknEycSfzYAilGr5w+5CceE9oZdWlA=;
        b=D8c2qPUL2bGn4GUfi2hFXGrOFXP2OdxpwN7AjxeQ6oZdriNYTJhZTfmTW6CK6HABJ5
         sLKeNVFBU489tpLVLfIMEbxiDUUOqe+1piXHsGNkqb4JyB2KARQxzOSqUscxB2hWrUke
         PIA6jTJr80yu1lSJ1Of+04/xOW8U2R3vUp7pgKdyFA4AmRcSpUkB5oK1vMgErAnbK3dp
         wdGzWnhKNL2P3T4YleOfQg5xZXO3zxO1UBLS3ML8wmIzYxjjDNblnR+r/H+HhkF9IsEq
         jQNCdTy3wPbjY0ALjMCso9psPR/Sl8KaE+FIqdlO0Zgia1iREXOwb7xOSV+EUf6WIDiy
         cjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743750690; x=1744355490;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zQmJkyko0OhYAsknEycSfzYAilGr5w+5CceE9oZdWlA=;
        b=lqQw/MmLxOp9Hw6iMh9oOVdObA+i29cMQk5hwed2Wc39WiFcWO/ppgFfBXEcTdT7g6
         qv/D5xe8dqSLAp4g17rQHSrJVMLtRwPVLrcTLz/LysrYOKq76N+5SaUNWXZwH/1J72wx
         KoW1cZqXcmpWTSFWOZGsMPLezG+zhxxEE7U5vvC0b7jU28BDbc176vo6aRgbPT4KTUXG
         wl1kzlpMwJmMTpRGIeRhHwlfSbjOEQ/sVkfpSjJ48Evmpk9i7pyT8FXtuVe6CnveG44f
         3qVRAoTl80BjSUpVgAOYzoE4VP0aYKzgmLtXwniTm4+u1F/hWGeieyBSbjYVcWO1BhTU
         yF2g==
X-Forwarded-Encrypted: i=1; AJvYcCV7j/zOAl9QWDypwD3nI882h6d1YOzCATL7am1RSpL7BIUOMoOGy2HU1XHblw9Lgh7uAzsxMM07IfhaGmxVRskqZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUm7CiItZ4QNThPYoHvDZSs9VH1mBcb2VnEDOt5PtCa6jgbcCH
	k92x7yaEtSmomx279tKInmCLBgUf4eEhcMLQZwZG1GpdY72sa1fTuf0E2hPX6yc=
X-Gm-Gg: ASbGnct5WXfP7sGhnPXl49U6sgGX/zuVZZNqfe9RYvc1GGdsz8zUmVLwqU87upLJZGL
	tN8ROAEiDro23LzlQ603G3Cu4ASyXVsQrsTRaYy1b4Alb8I0WeQDXFat/db5HxVyHT6mTl8/7hT
	ROj3dAfVnK6gPx7pVaTlnPqpLwNJEPb/q5r9YXiJkPpkvK6odAleZbm7H8u24J8Q8Zc0tJLnPiO
	jJzRc2DchlL6v6Yzgb/XKDuGSBEUksXD8ymryCqi/RLpTnE811CojN4D7YQv/yL9pTn9fWQERve
	zovbeM6FiSCI3rQhM62GdI0wZFE6Ara9zzIdAKzs403aww1rZHn4HfndVxdl6mpJtEigvIRYYb5
	RulHx2qZ0R3X/o5oTVjo=
X-Google-Smtp-Source: AGHT+IG26Ht0Wvr3P8so+/2dDR80FrZAL1BgE7LGSLrjdYw0eopIDPkygVwJEE488nCcrn3p7WCN/A==
X-Received: by 2002:a05:600c:224c:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-43ed382b5d7mr5746385e9.2.1743750689853;
        Fri, 04 Apr 2025 00:11:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:19b:8166:6e82:3840? ([2a01:e0a:3d9:2080:19b:8166:6e82:3840])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6608sm3581986f8f.23.2025.04.04.00.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 00:11:29 -0700 (PDT)
Message-ID: <eb7f66b6-1c63-4453-91bb-31d884d2c2d9@linaro.org>
Date: Fri, 4 Apr 2025 09:11:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 13/19] arm64: dts: amlogic: Drop redundant CPU
 "clock-latency"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-13-076be7171a85@kernel.org>
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
In-Reply-To: <20250403-dt-cpu-schema-v1-13-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2025 04:59, Rob Herring (Arm) wrote:
> The "clock-latency" property is part of the deprecated opp-v1 binding
> and is redundant if the opp-v2 table has equal or larger values in any
> "clock-latency-ns". Add any missing "clock-latency-ns" properties and
> remove "clock-latency".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts             | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts         | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts             | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts               | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts            | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                   | 1 +
>   arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts | 6 ------
>   arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi             | 2 ++
>   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi      | 6 ------
>   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi          | 6 ------
>   arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi       | 6 ------
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts    | 6 ------
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi            | 6 ------
>   arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts        | 6 ------
>   arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi             | 2 ++
>   arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi              | 6 ------
>   arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi              | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi           | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts        | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi             | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts              | 4 ----
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                    | 1 +
>   23 files changed, 6 insertions(+), 92 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> index 9aa36f17ffa2..d0a3b4b9229c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> @@ -267,28 +267,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> index 952b8d02e5c2..4353485c6f26 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> @@ -220,28 +220,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index 52fbc5103e45..f39fcabc763f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -314,28 +314,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> index 5407049d2647..b5bf8ecc91e6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -407,28 +407,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &clkc_audio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 01da83658ae3..5ab460a3e637 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -263,28 +263,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index 543e70669df5..deee61dbe074 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -62,6 +62,7 @@ cpu_opp_table: opp-table {
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <731000>;
> +			clock-latency-ns = <50000>;
>   		};
>   
>   		opp-1200000000 {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> index adedc1340c78..415248931ab1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
> @@ -76,42 +76,36 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &pwm_ab {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> index 8e9ad1e51d66..8ecb5bd125c1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> @@ -14,6 +14,7 @@ cpu_opp_table_0: opp-table-0 {
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <761000>;
> +			clock-latency-ns = <50000>;
>   		};
>   
>   		opp-1200000000 {
> @@ -54,6 +55,7 @@ cpub_opp_table_1: opp-table-1 {
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <731000>;
> +			clock-latency-ns = <50000>;
>   		};
>   
>   		opp-1200000000 {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> index 92e8b26ecccc..39011b645128 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> @@ -155,42 +155,36 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> index 54663c55a20e..1b08303c4282 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> @@ -263,42 +263,36 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> index 48650bad230d..fc737499f207 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
> @@ -51,42 +51,36 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &pwm_ab {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index e21831dfceee..d5938a4a6da3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -281,42 +281,36 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   /* RK817 only supports 12.5mV steps, round up the values */
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> index 7e8964bacfce..3298d59833b6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
> @@ -227,42 +227,36 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu_thermal {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> index fc05ecf90714..1e5c6f984945 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -259,42 +259,36 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu_thermal {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> index 44c23c984034..19cad93a6889 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> @@ -14,6 +14,7 @@ cpu_opp_table_0: opp-table-0 {
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <731000>;
> +			clock-latency-ns = <50000>;
>   		};
>   
>   		opp-1200000000 {
> @@ -59,6 +60,7 @@ cpub_opp_table_1: opp-table-1 {
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <771000>;
> +			clock-latency-ns = <50000>;
>   		};
>   
>   		opp-1200000000 {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> index a7a0fc264cdc..9b6d780eada7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> @@ -213,42 +213,36 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table_0>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu100 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu101 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu102 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu103 {
>   	cpu-supply = <&vddcpu_a>;
>   	operating-points-v2 = <&cpub_opp_table_1>;
>   	clocks = <&clkc CLKID_CPUB_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> index a3463149db3d..9be3084b090d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
> @@ -147,28 +147,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU1_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU2_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU3_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cvbs_vdac_port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> index 40db95f64636..538b35036954 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> @@ -185,28 +185,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU1_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU2_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU3_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> index 5d75ad3f3e46..a3d9b66b6878 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> @@ -51,28 +51,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU1_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU2_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU3_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &pwm_AO_cd {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index ad8d07883760..c4524eb4f099 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -250,28 +250,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU1_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU2_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU3_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &ext_mdio {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> index 537370db360f..5daadfb170b4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
> @@ -64,26 +64,22 @@ &cpu0 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU1_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU2_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu_b>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU3_CLK>;
> -	clock-latency = <50000>;
>   };
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 37d7f64b6d5d..024d2eb8e6ee 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -359,28 +359,24 @@ &cpu0 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu1 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU1_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu2 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU2_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &cpu3 {
>   	cpu-supply = <&vddcpu>;
>   	operating-points-v2 = <&cpu_opp_table>;
>   	clocks = <&clkc CLKID_CPU3_CLK>;
> -	clock-latency = <50000>;
>   };
>   
>   &ethmac {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 97e4b52066dc..966ebb19cc55 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -100,6 +100,7 @@ cpu_opp_table: opp-table {
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <770000>;
> +			clock-latency-ns = <50000>;
>   		};
>   
>   		opp-1200000000 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


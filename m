Return-Path: <linux-renesas-soc+bounces-15748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27142A84356
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 14:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4C8F8C6155
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 12:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C328D28540D;
	Thu, 10 Apr 2025 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOV4rMa8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB59285409
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288626; cv=none; b=c4WMaAT/TymgDbMHVXzA5p5alYZTvfwDmJ2MGXlVy5tZ+rIDCtkcwTd7TownUle+uv2iYgmmGjd4fe9gnk98trMbctKs5L19b9wRpUD/Y/C6sBiruFSJABaJiCWhAoPD8KFZfIm4CbTG4jN/wyPyLtvJf5zZ6Cqy/a2uVeASOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288626; c=relaxed/simple;
	bh=ABz4cDqiNS3kQXrpTOAbpSPw5QYVtGShy0gfjNUg76g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4Azi34wMe7djPxAKbVIfnHszqxvtwTnsucLDwyaGr/QopnAIU028+eeA5DqBXXH3JCvEoLERcdx4yQnBRtbF7zQ9C/MZkBH3ltBBSlODSPFKVUJxWlP12eOj2XdQUqwhKqYN6EPri+C9nF2zGvpqHaNKjbxL9CSLCIw/NYcVXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOV4rMa8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso7814735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288623; x=1744893423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=NOV4rMa8QMEc1TVhjAIqYIGZmJEfEaMV0wWzzFFqJUR7uQHKKQPAmse7sK/wo4ukZf
         zedLA1q0E+Lbx94iT6YqFRz6Jnf9BeAb6jxI+nS/ixwcrhNdLWLT+W55WtI/NEKuwzQe
         R3V66jMYVLNQZAM7UPJxpMkNC1KIswxFKbQ813d10tN3xrW5narf7Dzh9AejOS8jLyqP
         NB7KAvFMG9TtUvYkkBALHKB6HzuFS9uiETs7feTiJtuFykGcVbiXfs4NDdO9j6CUohBi
         rPIBWbXOV69V71DmyWEE2rvqbCsBnW2JDSklReyPmD1x2P3wQ8a3GA4Mw8ZNzwY6TwRL
         YaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288623; x=1744893423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=qwzsqe2xZhBCMR86RnMbPppMZeqhUL/wJI/9mM+qJPQEUmcL+8gYiEIbhAFBGhZEX2
         nIFeAn8ZSDMih0ONPQAbFOLfL6hT4rOGU+OFNSsq80qYxsBTxGbwMoOZZ6w8EkuqrOTa
         TNvOpBvjVhLwjyuK1bcztmJtgvYgr70BfHjq/mH5kWhAcLTrkz/AqS3vBUS+V0niQ1LV
         FAAtmVocYxM0RX3Ygmn0Uj6Be8euxG+uKslS1gYSr0pCr/kQBIGf902/AoG0Os/yiakY
         PjyPjOuSu1lKWdPtFzq3LJ+mHcu+VABqH+E6vvy4d6ZBR0ip5+94M+bPGn+MZ0tAPZI5
         zlXg==
X-Forwarded-Encrypted: i=1; AJvYcCVZNTB2Dln6WFE+XA5x1zZDb7JNBCPmINeCP8cLjegyR+Jdx47THuNbj2JmK2oXJqt+gDxrEJsqU4Xd1exDboVlGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLECcfbeOi8RLP7HiogWhqQ2h4f94yG56hdz9ntlonyqlpshuJ
	l57NKTpEefpBzpuUpTtDhRRpRI/moaj756tiZnCpHUlXI3T/uz00zytg8m8w3Oc=
X-Gm-Gg: ASbGnct9b1Cqhxc6UdIKa8k3pm5BLiyIAtM6IPx+J/Bmgof5IIwjb0/rCjgMdFZ6r9M
	Fd1fjDu4F4XQGFPoicx4U/9wFoT4nigo/cXGg0pomWP9GWzfcVdLUwCxWrHuapQkc+eIwX05P/Q
	GsLPssMwOl2KJt3tqMv2QeDMIIdLoAXMKtIG51vR+eXFnCnQkCZIR7BbwkTCpZueEtrW5oNVoJC
	ypcNOclpJLMtgrkxngjXcllYk6pBpXJTHnlNTtNhRD2QraTDGVoeLAgUMUWYUDxuj1JIbw5zYRc
	3TWYjYjEb5KwuKPMIHYD+pHD5jBHvx2n0RneF+Xu43vbwyYVnBAfcnoXIA+PWdzM7uUdHaqEt3M
	J1gTYRyVGwtxdxg==
X-Google-Smtp-Source: AGHT+IGMoIZKu18tKxGlE0nCM035PBeR69RdqmMHuq8h1Eu58CnOlQWvz4UQddkUAElDY1GsfzU8ew==
X-Received: by 2002:a05:600c:348a:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43f2fdceccfmr22721935e9.6.1744288622955;
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb88asm53015095e9.37.2025.04.10.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Message-ID: <20de7ce7-1cfc-40bb-9457-84e462cf4483@linaro.org>
Date: Thu, 10 Apr 2025 14:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] arm64: dts: morello: Fix-up cache nodes
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
 Neil Armstrong <neil.armstrong@linaro.org>,
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
 <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> The L3 cache is not part of cpu@0/l2-cache as it is shared among all
> cores. Move it to /cpus node which is the typical place for shared
> caches.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/arm/morello.dtsi | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



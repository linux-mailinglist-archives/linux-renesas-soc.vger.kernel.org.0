Return-Path: <linux-renesas-soc+bounces-15747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28623A8434C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 14:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5360189DA54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 12:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBD21EA7EC;
	Thu, 10 Apr 2025 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygoG7ksq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F64D277037
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288578; cv=none; b=ShsSubi6Rmrtqp9j6/8BBXtFTuePP41gJ8I1GNSx2RxQo8vLRRHV1+xsq5uxMvmDOwKtReb3DpORzGu5i6RydwXB6O0E6e322U3yt7RuO3HgjMJogh1qiBoD1OW1KhMyJJyvcT1BG47SiWbNzBjZk5nMsj1/NFI11vw4Bb0kC7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288578; c=relaxed/simple;
	bh=H2rAYnbGeFgX5saZ/b7X46QHeJfq5kinlY6BpgEnd3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5ZeAs99Vme+ED8aKRFi2w7h6U+/tj2+Okijn/gRn8xhWAwNSqITSkW2wm6hWCnN3hpbwjTCM3hUBw7fVsais6N4HcDGkf/kgsDM/D1o6JxZ7v8wcebVE0jYJ9tfFEQNg0bK6y2M7WNcBPhq3EN8d1Kg86XSjr4vRWDt600vyK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygoG7ksq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39149bccb69so609811f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288574; x=1744893374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=ygoG7ksqWNg5LSepdZfB/g+GufHjgHmLbB8kRtXYFazeG1EQ3GAs58DYd41HbC4Msf
         v1iNSbVmc5xO6lBOIWnTCRlJWkcgRpmt5QeV9BiPNPNsMtcYBgTYGsphaDyJfbmTlKYx
         OMpfQRnGgVRDKAHzsMoyN25N7RLLB1ecXlr8g8Jg/ZhRGFzxpfsZCT/6bimq+2srOxzH
         z0TYCHmGdssVtMlbzsZa96s1IzN5jZ9C8wrgW6wOmUqjg7bcAkgEqR1sakAYSyUOIdwD
         nTeNLTql2k00gDCHDEwNOhrI4IDG2r/8HIMXola1w5WpOriOqWJ+Ym//XOVvxNzE/v0n
         C6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288574; x=1744893374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ0j7wMSGTmXUuOHtflR052mxHlsC9aOf5SK3WIqsvY=;
        b=t7BUEl4WC7zsegLxt+d/WYh5Gkris3pwPIYL1zsAeUd4D1GfK4xDAtZgd1FVhKrhot
         bZhgPN30j1t8bKm4bVWGZhliuz1qSB5qsD1JRCFH/qMsdWa48AgfIA8c1Kr0/8iZ8BfZ
         jUbXTw6zbzUy16u9qRNMa2IIiroybIWV4v810D1oo+yB4PejplDyiqjZpNuVYH2jzl0e
         7f/yoT/cnjWPCk/upOBYT90OIY/mn+yxFI9se6ha3GV2DkxLXjbf3lhaXfP8qQiUnkKp
         a6ohjaGONyLl1R7F3LUkdsSgKHdz5f1ZdZ4WdRFctjjxY74kdL8+G8iJUaGRIDEEzHJn
         lRog==
X-Forwarded-Encrypted: i=1; AJvYcCWYZLuDKvf7SnWf3oT4GknImJQF5XuqZbfvvMkFuY3EwyFKGQkk8YbXCL63A68qLkENdirXXX1hORaSqAWBrmUN/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyafoQGq7ZjOV2RmcIvS1iOwGkZK/Nf+vXmwTsvsVreRFxHTBXl
	xTEovIbMtgf7noPd1npIFLsaHdKrmrmPBAz3hwrKviRwxoIXLkhBqdI3pHfkNcg=
X-Gm-Gg: ASbGncv28So8qN5KDNeZqcGsD6n1uAKmlxD/q8+AMwuHIfXCVA/k3f0KwQmL8S+GGp1
	1DVsMoVl/Bs4KVKNyhaTfUR+qYkyZxg9mPJkR5AKJUMH/gvIXv8llzN1bRcJj7wz51YvBIZUTHf
	Vr+Ii5dW6VXGBu4jINcqDD0VWvnxJzJ0891xZARI7kEUoN3Tv1FUhZpfjvIMeVu+hWZkFfw931O
	xys7CH9+hBlncXeYbnSSV1z0f44kb7aG1IyMt6VG+0WC1g4UtJ6rLtrArBN7XHCAEyWvhH/WwkD
	dVSPVudCz5AKn2VRO2otBzWOLN6J0W0eWm5grPWNeraSQ41GKcgzaZ4IiP+GvKZLpLL/ocJG2uG
	Ma87iWd5wYgZ+hw==
X-Google-Smtp-Source: AGHT+IFetWy1yp/dwylC0fW3Xc3rkEsOkh6f7DWozfmMsr0xNplY7KcWpRd6urR6Mieq6r6/8yNM9w==
X-Received: by 2002:a05:6000:4285:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39d8f498980mr2285415f8f.31.1744288573720;
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf8fsm4624182f8f.91.2025.04.10.05.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:36:13 -0700 (PDT)
Message-ID: <17b9ff87-899e-44ca-b902-ab965cff0879@linaro.org>
Date: Thu, 10 Apr 2025 14:36:10 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] arm64: dts: broadcom: bcm2712: Use "l2-cache" for
 L2 cache node names
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
 <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-2-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



Return-Path: <linux-renesas-soc+bounces-20172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08DCB1F22A
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 07:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D28CA03631
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 05:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8440D157E6B;
	Sat,  9 Aug 2025 05:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FKaAf2pR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159721DA3D
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Aug 2025 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754715954; cv=none; b=CZi0LPjtW6LtDPivmB9ZD+LfgoykGEU+nImuiUe71nMmMbP68Jp0W2MAoZ705vfK6mSjxqbREeP7qzEUO8QKBpiDSl24e2NmZgo1mC3pQ7rxV9iXoVqm0EtJVm6G1Vdwn9/H9QjVNUuMN0gf7LbKQs1lyJseqweoXslE1BCDRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754715954; c=relaxed/simple;
	bh=nD2fUCFl1N8RjzRUmG5cM0B4T+0OEZT2hR1uuKjG3hI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrV7cfY0/uWk5btPvLxo3U4qlBlr5mAk2QUUHh5EUmO5KAJmHR3yVtdxAGtTPeTy3r/YvhvZup2JkWDB1X1twToENHo2E9lCsflos9zWL1RFgZenwEIuJqkDJkV6F/pUfCFWmQ/vRRj6cvvgvjfF6tryyX0ptSP93oXt4gKjKZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FKaAf2pR; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-af910372ab3so650233466b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Aug 2025 22:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754715950; x=1755320750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oZNLMTxnI0TDk551cIxYEAZPe1K5Q6nT+3NiB2kPJk=;
        b=FKaAf2pR4+kiKIu9UoRXkbcBiYdoNbtjXzGYo50O9zXYpiynC5bM3YZ++8/g6Qaszw
         VfpizB7tkwH4Hm56skzHjhofJ+Cw+VCtZbxBIqq7I3zMNN6DdeZMkCcdLqy/8MTpLIJs
         0M4tQWRh+g1vas/6tZWxErbtW52P61n3u9yvI0eSCkVKbFZBbmbFKlj2wc0XlC5liDaq
         SV+ygU7o5JAUwEePbY8T0T3oZCn5BelSOEOfoD5n6XAvqi3Hsr5rBK9RWlN7r+9qCWfu
         sX7ib4H0UbvxyfbovmaKC1OLGJNI4XMg0ZzUnGMhsZzE2sN6gN/tcOxeGvr02FNrDqtX
         wY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754715950; x=1755320750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oZNLMTxnI0TDk551cIxYEAZPe1K5Q6nT+3NiB2kPJk=;
        b=doY7LlaozwwwTPj8NtpJDNGp4u/wFZboL8bMEzZkZFm2u9TgSQV6S4/CO+SaBuyL4a
         Li2M67xuD6O7eyy95ejFIZHKJixFbR9EGCK6qfqBNkAcsHOBtD3rfKQGFLbN5CYIzU1T
         K866uDCDHaA6pAQOmts7NP/wyDKfWDosDwreHZDJLOppMSsiK9AnffLawtE6zZp033av
         JqgmHRwwB2m1EkPC7H3kP7VXk3+kei6x+yEI5vz+A5t5jPLJLjxp/wrjZaNNXT8pmDJE
         0bnwObMZ5776hPG32iboxEpLye9mo00MiU7o8xM4sBxfMY1F4cm5MahprhidTePzdjkD
         I/dg==
X-Forwarded-Encrypted: i=1; AJvYcCXe3RgkoJRYXy09pJqQJmcJR5kDea4m5gTmA5nu3BB9YVF6waOdNrS6fv4wu3FKgFlyEh8z/J6TnoZB00+8+L834A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLo57kNm4+2fQkqiYLXIv8Bej2OpjP8PMDIBP6U4FJkQvsp+u1
	97m1q49woSoxfGrZD0SJCLvvR78JbAED67xIIf1sciT8Mq8Z9+Sqoj6geakPFud5xt4=
X-Gm-Gg: ASbGncvIriKeAMtj8ouQtNBHOiPFQtaEaU6D70ZuIjo1v++4QZzSjIF2rWQ/bXmnM+t
	lOxiq3+QECVrrrwcRbdMp8gQGdbN9w93Bi5H2muhbUnGoOTMGo5heeh8/bqt9ZUNvFftYY5gjNA
	Z5p9b0UnOMZ7D0Jp0+5rphU2+eeDWEzEzqRVMLzXXkSpGttZZMvU1BqfVbJRoFn7j2SosaxOB07
	0YgjHpECrUcnem6nP8SZZOemxIJlI9LIfsSVmMBmWx0CE8DXTkZc321SbtuWGR085l6S6PyxL3B
	Ge+rMBY8V79w4cP6lGmUoPBf5Y84c1LqA+iq21vzwGXKbwrx9mTvwR7fJQWEyo0KMOQT9eQqc7k
	26Z+9I7aiwS3OiT4GM6gMteg2VgVMoZE=
X-Google-Smtp-Source: AGHT+IFDTVyrR6p3CClA1GWj423Oh6dA8XrJf1oBRsxw+7d+yEEQJwlPV2AJiVzwHAknQVJuKnTVNA==
X-Received: by 2002:a17:907:3ccb:b0:af1:69e3:c074 with SMTP id a640c23a62f3a-af9a3c9c1ddmr1004588666b.8.1754715950241;
        Fri, 08 Aug 2025 22:05:50 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af99518bfacsm629142066b.72.2025.08.08.22.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 22:05:49 -0700 (PDT)
Message-ID: <18e948c8-96ed-4520-b25d-32ed1c845aff@tuxon.dev>
Date: Sat, 9 Aug 2025 08:05:48 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r9a08g045: Add I3C node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Quynh Nguyen <quynh.nguyen.xb@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
 <20250807151434.5241-7-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250807151434.5241-7-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 07.08.2025 18:14, Wolfram Sang wrote:
> From: Quynh Nguyen <quynh.nguyen.xb@renesas.com>
> 
> Add the I3C node to RZ/G3S SoC DTSI.
> 
> Signed-off-by: Quynh Nguyen <quynh.nguyen.xb@renesas.com>
> [wsa: adapted to upstream driver, moved bus frequencies to board file]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> index 0364f89776e6..6e372e222557 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -272,6 +272,41 @@ channel@8 {
>  			};
>  		};
>  
> +		i3c: i3c@1005b000 {
> +			compatible = "renesas,r9a08g045-i3c";
> +			reg = <0 0x1005b000 0 0x1000>;
> +			clocks = <&cpg CPG_MOD R9A08G045_I3C_PCLK>,
> +				 <&cpg CPG_MOD R9A08G045_I3C_TCLK>;
> +			clock-names = "pclk", "tclk";
> +			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 294 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ierr", "terr", "abort", "resp", "cmd",
> +					  "ibi", "rx", "tx", "rcv","st", "sp",

Missing a space before "st".

Other than this:
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu

> +					  "tend", "nack", "al", "tmo", "wu", "exit";
> +			resets = <&cpg R9A08G045_I3C_PRESETN>,
> +				 <&cpg R9A08G045_I3C_TRESETN>;
> +			reset-names = "presetn", "tresetn";
> +			power-domains = <&cpg>;
> +			#address-cells = <3>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		vbattb: clock-controller@1005c000 {
>  			compatible = "renesas,r9a08g045-vbattb";
>  			reg = <0 0x1005c000 0 0x1000>;



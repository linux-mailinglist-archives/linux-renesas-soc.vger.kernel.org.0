Return-Path: <linux-renesas-soc+bounces-2370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4484AFBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 09:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62FF11C2269E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 08:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0308412B16C;
	Tue,  6 Feb 2024 08:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jkQRdDKY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9FB12B14E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Feb 2024 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707207317; cv=none; b=LjkLKDWQ1/Kttc3DkAk6hUd0tf2bJXyvLUoGWG+XUAgz3hxEGP3MZDHQsHhqoLsldK48TDS+h6WxAC4TrBtB7+vej2c9TZsCSIsHC+kLa3AsTxLK4h4L0ClW6HvcvraNsV8e7H8g8AkOY7/JcqqOjFaEpdngnt5ceC1nNbRq3Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707207317; c=relaxed/simple;
	bh=YGLjoL7xChpMneTzTMtDqWunWKFG0vgpgJezm+/b2C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PivP6xIu1J2bnEjc1s/KCRZcVXdTdpN9jmY9ngvq3nzz2rTCdPnTH7kVYKE4cxSrbIoMnUPQFRFmHFPDnENjhL2DQAOzLgMjK1hLt9sOv0eOWuMjqoAW7oqGKiyh4wpkczi3e2MrAGB72eW+w9FczMFVEIh4ryo8+/W/mdgWHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jkQRdDKY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-511206d1c89so7535149e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Feb 2024 00:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707207313; x=1707812113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFH4UTR5EQtsU77bTwpZfCbLoj9097wAjcuQb4s57DM=;
        b=jkQRdDKYVATLpbxxxXU4MUlkMM5Vgu+ItgucBs53q3FSakOchcw+3RlHBJ6vWfCwma
         Vqp3V5llgystAmaURAQmFo0vppL6Mm/o1kO28eI4RXAG0dWnSepixTBsLWIG192d+0p0
         aWpKKe5nsuBMlfzGBjIX9MYb85lCLlXUubEDWVDo5m+l24VDJlcyey15sExlJj2BQpzj
         OkwQCDaGwuETLUVCjUcjUE06ct1c8pJiaw+x6rSdIogVlVuUIJyDzpC8oknOGyxG9edH
         X6ja+DxTHs8KZa1kzPhKjb7/r9HGkdUp6dQ7T1HiHSwHalc2zf5hXqsH084RuSodzDow
         4RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707207313; x=1707812113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFH4UTR5EQtsU77bTwpZfCbLoj9097wAjcuQb4s57DM=;
        b=O9vwFk/CVHCey/zVvrKFfmsWYjuYP3xfpl8mCSc3Ov4PGcoMQjQCE3irw8jkTmF4DR
         1PU5fIssKaZs+72tw7utUnY+akWm3ioZ4SQ248fHwNXosBkDAFo0YUFik+q9u0SFDmYQ
         PdSchUhPoE6YeXaNZ8DHavh6PQsIX2v2IH8Ofn+PlL9LDuHFIRuMW8sEQ3UJW6vrvuvP
         pMOqndX1yDbG8O1qmDH+djiKq3j9onYPLpi5sR2Zq+fiqYjoaxMzPoJrdkAPc25MfJdB
         E9AARc++WhPt4XAe0P5BcV3vkO/ofcgZUIxnn6zmluBKUNB5M3Yr4Z8LwnuY/MhyNN92
         haTw==
X-Gm-Message-State: AOJu0Yx8Wph7mIBQchHmf0vJrBZDAPSHBigJZbxrd4jvSyorDDT3NK7z
	rufa0uIdDj7Y7DA313lIU40AIRJOwn4wIE7UrfSPkbynBCUUodE+r3UrS6R77CM=
X-Google-Smtp-Source: AGHT+IGV8sEmr7N77J+aRgQQzpGjPTzlrlo7HjcwR/Bgb4FUsJSxxWo/HdzuSaPLXR9eLTIaAGDRBw==
X-Received: by 2002:ac2:560f:0:b0:511:51b8:8550 with SMTP id v15-20020ac2560f000000b0051151b88550mr1204378lfd.64.1707207313313;
        Tue, 06 Feb 2024 00:15:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUi7toIeKaV3uLgJTuxPw3z7U8eNW6DzDumx131cwrPzbhdzsJZibYkeod0Qc3WanfpzHoO0L1aZphrmX4m+K907x/AcdO+RlNkgMYdlsvEICpEU9D+2R/mye933qK12DQ+2VRw0e9OSFxb34deX4ecjo2Ugvj21macCRbXpxA9IKX4Q5ZNltEwIpH3ALR3MOCRc/L9rCKrhUU0dRxYlNsS87QJu9ouB3J+bXY4Br+5auH5WmHCJMxkGXYKyebTeloS4LOraVeINeXIoRq414eThNrtidTfAGqKGX1SZ50ehLVfcRzVSpCd2wbFuV/PvPvJkyKmhLAXxTEzpNbinjxayCyzBfc6XfeaRH/lXgqYmvvVt+EC3VJveLVhEhJL5pmLZxRFDXaScEGng++sKQsbJKoI10v0hQJBMnW5G0GzY3BtnuZh/NwUSajQ8XMQGv9FuE7EEN5sWl4jD9nS2pHWEXIVOVILGBgHB6SuNUY8LUWQ6qW8xVioLDQPnsmrqzA=
Received: from [192.168.50.4] ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c358700b0040fe308ff25sm1072787wmq.24.2024.02.06.00.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 00:15:12 -0800 (PST)
Message-ID: <d2b44719-8f68-409e-811f-0cedc34d7f36@tuxon.dev>
Date: Tue, 6 Feb 2024 10:15:10 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r9a08g045: Add missing
 interrupts of IRQC node
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240205144421.51195-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240205144421.51195-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240205144421.51195-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05.02.2024 16:44, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The IRQC block on RZ/G3S ("R9A08G045") SoC supports ECCRAM error
> interrupts too, add those missing interrupts in the IRQC node.
> 
> Fixes: 837918aa3fdd ("arm64: dts: renesas: r9a08g045: Add IA55 interrupt controller node")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> index dfee878c0f49..4aaffd1753c8 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -152,7 +152,10 @@ irqc: interrupt-controller@11050000 {
>  				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "nmi",
>  					  "irq0", "irq1", "irq2", "irq3",
>  					  "irq4", "irq5", "irq6", "irq7",
> @@ -164,7 +167,8 @@ irqc: interrupt-controller@11050000 {
>  					  "tint20", "tint21", "tint22", "tint23",
>  					  "tint24", "tint25", "tint26", "tint27",
>  					  "tint28", "tint29", "tint30", "tint31",
> -					  "bus-err";
> +					  "bus-err", "ec7tie1-0", "ec7tie2-0",
> +					  "ec7tiovf-0";
>  			clocks = <&cpg CPG_MOD R9A08G045_IA55_CLK>,
>  				 <&cpg CPG_MOD R9A08G045_IA55_PCLK>;
>  			clock-names = "clk", "pclk";


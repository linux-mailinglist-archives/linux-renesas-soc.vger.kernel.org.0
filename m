Return-Path: <linux-renesas-soc+bounces-9613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D7A996158
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 09:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57E17281E0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 07:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F761183CA9;
	Wed,  9 Oct 2024 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cHYT4Fab"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB91183CAA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Oct 2024 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460021; cv=none; b=m6q8HrtaWLD7uQXvlnu5YTghJK2tmNsfhxMtfFfFtNPJ/8Pa3LpyXsVKe7lGhZlS1ZIad/wuEA6zHjo6cCBKJbQJF0p6dqijE/oWCcx7qO3DiL6npcCPPpvauFECsKVvDXCtHzlruz77CjmdVFQyr7w8t4ZCv1JffnXjRTQw0YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460021; c=relaxed/simple;
	bh=CJ1mmlRnOVbL7bj7Jzo5Jaxx5QSu/mjo7x9FVjv19I4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoO+Zl6P7QS04X2FSa5NpB5uJR2BWSV2xswOLRfTnkwOR0brS3tBdKmQqFcN7TwgBFEkbsHyv6p3tLE6v50qiQA87WaL1GFi6XynRvqZQIsXt2tpLbNQSYm8PLij9wGktJ0XRoOc1HlrSsAh2sWLYOU/PWgA5HokyI5ByPxs0OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cHYT4Fab; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c8af23a4fcso7996320a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Oct 2024 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728460016; x=1729064816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPaYnchsefJ9+jf5dO/i399ASp7UF5Mjoo2vYC0OZYE=;
        b=cHYT4FabK7HFKyhGAH6CSiFMNIr/D+OAuSN/bGSj2yr57o/rJvZH5xlKvU+X/wihsf
         7ERUShCySM/eLvIlVT7v0wqLqWAXJxjeICF45q9I5n7LmMa4q9nte2VQjj4GMSwqzSdA
         ZVAjltRGoITaFaqJvmOqMaWYmnNMlRMwAFWGK6mR0kjRCDLpbVhEplBhhxwg/xAKx1Ql
         JqfUzSojjXO/X+P7eWTrq9cNdJOGVYIt9lRsvnOJrmWxwQIkFRXcq8pnneP+iDJ+7du+
         05PMf8nwo67Ih1J+3BMQ2ugdFjan7EanSyPROZT7qDtmshw90Ae9r5i3fe3nW3i2CFVK
         Nvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728460016; x=1729064816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPaYnchsefJ9+jf5dO/i399ASp7UF5Mjoo2vYC0OZYE=;
        b=cVwI2xn2ZRPOsr5NuiB9Q60pAqiOreriOE+z0MHCiSm1hZxtPuxBvy7Uu60A4g6d6d
         NZR0kjmV/HOQ+rfm9aKHwYgGfnm4lN1gUlj5iNsWfmbnJzjeZvpwYbkTQRcqDAT4WHLr
         qT3uU2lt8XrRS40hAFP7j3v40MZ+x95BuKNHQaISGRh/2TMDp4CUaUvbpxbNdlVmZcDH
         m8o6Co6e5DuiCfVBMiJgdh1vioHyjIBppe41w/sD1KRvpZ9Ck0F0M9PAKDxQXInQGY6j
         dsTDpwMJXmnYsKXYQusfHBL93mqitB96LgMpRPDCrqvZ0DJArOBQxN5arT2PRfOR6ZIR
         ck7Q==
X-Gm-Message-State: AOJu0Yx0vAJsCkrk9+UkhQCttoVfQDt4uMF1mA1okWSOW05P+KE7OepR
	Ny5AmXdiXeHBkb8lylvEoC8p+sXf39aawSgszI7ikhmEVSYhIo3LYwdxECF43nw=
X-Google-Smtp-Source: AGHT+IFLYpaVa4myK51F5sFrBbzP/gt1vP62hMUZMd44RrtvoA2V5gAZwGoafijwBLPQyY4YuNC+wQ==
X-Received: by 2002:a05:6402:1d53:b0:5c9:1c16:cbff with SMTP id 4fb4d7f45d1cf-5c91d5ac705mr1339513a12.14.1728460016302;
        Wed, 09 Oct 2024 00:46:56 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05eb5f8sm5054521a12.60.2024.10.09.00.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 00:46:55 -0700 (PDT)
Message-ID: <fbe4d99f-92fc-4731-96a8-74b38dace006@tuxon.dev>
Date: Wed, 9 Oct 2024 10:46:53 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] arm64: dts: renesas: rzg3s-smarc: Use
 interrupts-extended for gpio-keys
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <cover.1728045620.git.geert+renesas@glider.be>
 <6214cd8ed068e3fc60a7b972093e4d99cdc0be1a.1728045620.git.geert+renesas@glider.be>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <6214cd8ed068e3fc60a7b972093e4d99cdc0be1a.1728045620.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04.10.2024 15:53, Geert Uytterhoeven wrote:
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> index 7945d44e6ee159f4..4509151344c430de 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -20,8 +20,7 @@ keys {
>  		compatible = "gpio-keys";
>  
>  		key-1 {
> -			interrupts = <RZG2L_GPIO(18, 0) IRQ_TYPE_EDGE_FALLING>;
> -			interrupt-parent = <&pinctrl>;
> +			interrupts-extended = <&pinctrl RZG2L_GPIO(18, 0) IRQ_TYPE_EDGE_FALLING>;
>  			linux,code = <KEY_1>;
>  			label = "USER_SW1";
>  			wakeup-source;
> @@ -29,8 +28,7 @@ key-1 {
>  		};
>  
>  		key-2 {
> -			interrupts = <RZG2L_GPIO(0, 1) IRQ_TYPE_EDGE_FALLING>;
> -			interrupt-parent = <&pinctrl>;
> +			interrupts-extended = <&pinctrl RZG2L_GPIO(0, 1) IRQ_TYPE_EDGE_FALLING>;
>  			linux,code = <KEY_2>;
>  			label = "USER_SW2";
>  			wakeup-source;
> @@ -38,8 +36,7 @@ key-2 {
>  		};
>  
>  		key-3 {
> -			interrupts = <RZG2L_GPIO(0, 3) IRQ_TYPE_EDGE_FALLING>;
> -			interrupt-parent = <&pinctrl>;
> +			interrupts-extended = <&pinctrl RZG2L_GPIO(0, 3) IRQ_TYPE_EDGE_FALLING>;
>  			linux,code = <KEY_3>;
>  			label = "USER_SW3";
>  			wakeup-source;


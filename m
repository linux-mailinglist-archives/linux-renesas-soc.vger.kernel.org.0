Return-Path: <linux-renesas-soc+bounces-20173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C083B1F236
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 07:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A45D566F59
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 05:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE61C1DC994;
	Sat,  9 Aug 2025 05:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dkBQsZDd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034A9125D6
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Aug 2025 05:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754716178; cv=none; b=RRsSa0PezVzV03a7E9NooA81eHv0Cb4s/J/z9xwdCfIki7iPc12Ov78wTxIexP/ik90vQ+KcK9dJQPTro4Kd23Hi0bcrFtazIrdQFoEpspUXOtkgZ782CAR8JAdf0SaSkuvctCfXSyPr1n4Cn/3SAna/EJnjR4Niri+m6iQMrh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754716178; c=relaxed/simple;
	bh=GrglcO3xsVXh3AY4plzNCBO4+hdYcu/Lkn4GpTjSkck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9GpN0KVs2Ip5Bp4CYk5wHh/jWojTkfwcCsHb3vULSjHF/Tt4bV5gydi4LbqWLswr8GqK0+QbZrlqyQzYnBC58vnBfkf2cSl4TK6Qd/CpPbYEuXeS+EVsULHDhg0pb60S8mF4sF27cfHTuRfvyhsWrBWjk372+sDgJwgBnJxsU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dkBQsZDd; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-615622ed70fso4580640a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Aug 2025 22:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754716174; x=1755320974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6HTTOxi4bBvMFIB876AaeWrN83+qUAp0MN7BaBm7MTs=;
        b=dkBQsZDdPJ7iI9FX8dr8/HoxXSSIKFfK2WVvt2hpnzIaLF2wu3JsumnpZR7Xte+rRM
         uzmEJOT1FX2VrPNGfjAVlIy6Pnjy3Z8mOksA1jFHEj1ZxzGKpyAEcbSngYKpFZ6HAw7z
         GARU+9It6aOQCvIXogbMTMQ0g5ozENxDE0T3OiFhGR3nMaae+KzoeI/F0yAimvj2Pdzc
         sQPFnZp6idR1Rq9Jdu9vLju98KiTYWOfz6G7DcdJRCSSJTVUJVMWvC5G9YzysSKlOFFl
         UYIbxtZW5riypcns2QjvG/am7IYj/W+af5VH04szsEB92FiWOdrKKARinvLpUdBBAtDO
         dh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754716174; x=1755320974;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HTTOxi4bBvMFIB876AaeWrN83+qUAp0MN7BaBm7MTs=;
        b=Hbev4mX4vkwfPTndWRpMt/FhFqAQ6hgzvNOKpFSLOBXYSg6Aybpi50BL6xRsqOt4yA
         cR4IvfHDYJYrDHO1s27AkhFn9IUtRLmGESprFevyYBku9kEMyu0r6TtqNU11sBs5EVWA
         ThCJNXt+/7dF/y3DVrrJTqAMjBGpH7HfQb/ivKFXWnCFN2e0R9fxqeNokBz7Qt3reTYO
         +XzmlhE0sOafhzLKK6RXrCd4nxwQ/wBATs7wAa3sNhOx716nTi4S+1xvZ2SOT3e6i3kx
         9utViaosYIyfQX24eyPhL+Kyr3jWz7b8QUsw/Wpbm/4YMP9ro7styqlWPWGRCm/vy9tA
         Fxgw==
X-Forwarded-Encrypted: i=1; AJvYcCWjiiT92WXRZx1EUtszdbaS+YOny8zbuw3Hs+8QKdkiMEnDwmWToLk50j6GzjprcXsa3ApyGNj1crktYk0v1YsTlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCzP60LbDVqQz7/DambV5/CiLBifMDx0AmbsYq9rxaiSrmB5s
	ewV+TXDBqQBJZAyDiqlGKuIzNzMNoyUTdbg1MYehdyDcvbs7z5N1FCLdaUoRXZ2A7eQ=
X-Gm-Gg: ASbGncsF14cHcFLrnGq6ubZ5oumWMCwfENK9mhmXX20qjZP5XxERklZWLcQsaf4BQJp
	h+tefWCTa2MHT+WZ3Cp05UVFn98hXw81csquz5KuPFcj85x+leCqAuQX9fM1FZPFVnyJQsSHyva
	pr/FtzLwuvpboybyz3tpo6bdEQjbybwrZ3YXmkzU0mf07kIxjdRgMkj0jwmDcEWZ+oC3lRV5xog
	T7mzxjIahkV19FjE/CCt7AIWnEtXaQYIra+EyVbt+8Wjk+eds5oD0oRp3qUCbj0utboFlU6r3Fe
	p2rBrA/29C1I+6BySjAafUr92ekyPDPolqUPEC0Hr4BYx7IPZ+AqLmB5SjHlqM0cIvPsf0B1wVE
	Oi8ix79+nL1WOPft2FSoaPD/mxZpyC0Q=
X-Google-Smtp-Source: AGHT+IGXiORpQR5niIwIvpzn+wXs17bnFKeDy0GZ6K5qdZHPo1qcip11Y668BHB3y+3WMDJ6ZtPaMw==
X-Received: by 2002:a05:6402:2101:b0:617:b3e8:97aa with SMTP id 4fb4d7f45d1cf-617e2bf8706mr4793505a12.3.1754716174120;
        Fri, 08 Aug 2025 22:09:34 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f16062sm14421123a12.18.2025.08.08.22.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 22:09:33 -0700 (PDT)
Message-ID: <7737de72-701a-43ce-88a4-90d2d17c48f8@tuxon.dev>
Date: Sat, 9 Aug 2025 08:09:32 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
 <20250807151434.5241-9-wsa+renesas@sang-engineering.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250807151434.5241-9-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 07.08.2025 18:14, Wolfram Sang wrote:
> Enable I3C on the dedicated connector of the RZ/G3S module. Provide
> safe defaults allowing to connect even to slow I2C devices.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> index 39845faec894..17fd30df3432 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/i3c/i3c.h>
>  #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
>  
>  #include "rzg3s-smarc-switches.h"
> @@ -172,6 +173,12 @@ a0 80 30 30 9c
>  	};
>  };
>  
> +&i3c {
> +	i2c-scl-hz = <100000>;
> +	i3c-scl-hz = <12500000>;

I'm not familiar with I3C but from the HW manual it seems there is some
level of control for I3C in pin controller:
- on Input Enable Control Register (IEN_m) there is this note: Note 1. 1b:
  applies to terminals of TMS_SWDIO, I3C_SCL, I3C_SDA, P1_0, P7_0

- there is I3C_SET register (bit POC) which controls the I3C voltage, so, I
  presume, depending on the SW_I3C_VIO_SEL switch on the board (which
  selects the output of VDD_I3C regulator)  the pins would have to be
  configured with proper power-source = <1800> or power-source = <1200>

Thank you,
Claudiu

> +	status = "okay";
> +};
> +
>  #if SW_CONFIG2 == SW_ON
>  /* SD0 slot */
>  &sdhi0 {



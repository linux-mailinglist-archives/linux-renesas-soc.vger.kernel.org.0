Return-Path: <linux-renesas-soc+bounces-12892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83357A2A4BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CD68188A283
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892D1228C84;
	Thu,  6 Feb 2025 09:35:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEF1226546;
	Thu,  6 Feb 2025 09:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834551; cv=none; b=njtMmTsNmvz7i9DgDSwXf3LcnsCxJyOfMQASnBBZvLDB+7ABiFdd7NWVQi6hXN3AgWty8cnGBRbcLUpdEhGqhZnx89ZO76zYF9ysPlSl0b50roB4jEQps6qQFkQANw6G/Cm5HKS9sdfv/N2eTN8kpr8QFtLd9epv3BFX3fvHgkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834551; c=relaxed/simple;
	bh=7sbr5mpVc7+ZBpPtC2uBa0tLEgFgxvnC5+C3UcdMS+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOGuWCPjuRiEL3YNYJBcv+VXGX3BM3vh1auINJeGXIh68quG8hfMItewpZ8f3Arix0aVA/kVh+bYdaBJwcajCukhRHQDwAibFoZPVwCg5mavI+ZRHst7bJFuDljWZhM8glnPHXlkzspjaFKAAFH2T7nn75SwEq+Sfo6srQhLNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5161d5b8650so183255e0c.3;
        Thu, 06 Feb 2025 01:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834547; x=1739439347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23NOCELavLl2Pk+6Vto5vA5OftjS4D9PnflCbYjJqw4=;
        b=iBIBcpkUnnIQgicXq7psgwPS/AGWyADrwTwcNUjUlECMEIyFPhN8fwfQxsve51cBBO
         zzv5cBhjTdCPJzg7U42927BIGnn8T/JhhwMThVKfP0EGG2ZaOo5Bwd+5R1rkh4rgKyHZ
         r4+wSdZWWPU4NErBnvGfFcKjv2qyyoLo2Dv2lm+6QN9LjwOpf91z9N7rlc7WLzGSpjCH
         lsyWc8WtTam8qPlx1RqtdsmJOV9heW/KF1wAwYmcZqMldv7v2cJWhJHXMC3qzkh0q2E9
         nz3qu6s3U3uphUr3rZG8kp9oMwfTDFJoJvmdAxuyObR90K8gE6neHQn4D+Z6sRi9Tvqj
         e7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWPgk7TC/Dsqe1ekw/5IMFZNUFHmR99e7RmzsJdgwjNYhnL1aPJ6AtgRJtFgEez6nFEaIaxNDRTTTih0uQQDbrgY2g=@vger.kernel.org, AJvYcCXtdMddeoDD8UP5Day0rp+w0UczMgb/rFXXmm39//IK5lvWVTeJ6Dt4jszS0sxyfCtqYL9ELCxVFgrs@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5gEnWqQ2Z8k6kYo53usAYIQ44Kpp/MOa+lRsKxBAxdAIHmsq
	yiGdVRUxAg2sgFafCheZNF7+Xaq9vEOGmt6EAaVtneUKB4o7wt7Bsu0gMLGU
X-Gm-Gg: ASbGncs+d0RNA2u6TFpdNHEGUaEjFcRdPMoAzGLbO+SAy2ri2t8qH6KvIMH85R0rRC5
	V67oUDAA+oVWA32NcsYV28csRMGdIFwFt+DrEmn3sTo+8qvdjZqqKwAeEn22tmdFb6/IxyNk6Xn
	RshLiFLhZXO1p0kGY484MfYhhZ8faqF7N27bDFaA16GxG6Q1htpXZVWVdV1QNDg7uCfY88ZuZal
	k/3sHHCnIzePG85F09IJ47k0hx8XuRDImruRF8blFrMvvs0id88sVbx332jzctiFMsmGnk8BhGA
	Jw8snhFC1bt6PjUvzpNb/Ltn9cXY/XEWlep37ytxTnpmbEYvyrtkOg==
X-Google-Smtp-Source: AGHT+IFjndvTNbWlZPPsH6pL2oIzCK/AKcrQKh7VKkmpiCDaXnems8op/RWIDt0+oXaKP9u2NzchNw==
X-Received: by 2002:a05:6122:4004:b0:518:8753:34a6 with SMTP id 71dfb90a1353d-51f0c50a8b0mr3579131e0c.10.1738834547237;
        Thu, 06 Feb 2025 01:35:47 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9804f55sm149579241.32.2025.02.06.01.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:35:46 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so192897137.3;
        Thu, 06 Feb 2025 01:35:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzkKJ5rbec45SM0np9pd5bQZk+VJa54Fm6BZwekjJHFG4+c/+j5dfz7Uy89l2bZJoRfQX4Z+7ZZV4o0HTgXUAx/ms=@vger.kernel.org, AJvYcCXek06tQ6RCKbiDja6zAGtlB6ATkC8RygcuoqmM1FJcEdKP3skBHZZxDk7SYOeJcAgPG5O+GpjUVo5+@vger.kernel.org
X-Received: by 2002:a05:6102:3f07:b0:4b9:b986:591c with SMTP id
 ada2fe7eead31-4ba47ae4de7mr4179283137.22.1738834546541; Thu, 06 Feb 2025
 01:35:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com> <20250131112429.119882-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112429.119882-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 10:35:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSaewfeRkuOqmBYkWPzLr54QM1X7fw0ODOuj-ooucUkw@mail.gmail.com>
X-Gm-Features: AWEUYZnul23HpMeJBr12dVxNrDfppXFBX_BXBZTUPtlXsVts5e1ioiHmigXeIjs
Message-ID: <CAMuHMdXSaewfeRkuOqmBYkWPzLr54QM1X7fw0ODOuj-ooucUkw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 12:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable eMMC on SDHI0 and SD on SDHI2 on RZ/G3E SMARC SoM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Added missing header file gpio.h
>  * Used fixed regulator for eMMC on SD0 and dropped sd0-iovs pins for
>    eMMC.
>  * Sorted pinctrl nodes for sd2
>  * Enabled internal regulator for SD2.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -7,6 +7,7 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/gpio/gpio.h>

Not needed in this patch.

>  #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
>  #include "r9a09g047e57.dtsi"
>  #include "rzg3e-smarc-som.dtsi"

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi

> +&vqmmc_sdhi2 {
> +       regulator-name = "SD2_PVDD";

Why override the name?

> +       status = "okay";
> +};
> +
>  &wdt1 {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


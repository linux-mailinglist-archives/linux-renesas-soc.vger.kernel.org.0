Return-Path: <linux-renesas-soc+bounces-17033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0353AB4FFF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 11:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 122303A3E4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 09:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA34230264;
	Tue, 13 May 2025 09:38:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC6D1E9B20;
	Tue, 13 May 2025 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129119; cv=none; b=CUPWI2mmhZtAMjMdIn4IxgYFSF8edpT5HRjl35hqKIm/8oWRzUFpJwUOz9+zuxOIkDVsIeXxOVSb4lluLy9UsOfxh4AWenkrZe8ak0pVZg2VTBCm+7R5lW+bMIhuIB1grB9ydux7vhevo8G9Wk9ofWglvt7qDdcJ4VR3mpGO3hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129119; c=relaxed/simple;
	bh=kl+ZPdeu5I2yHm1i5u85PzkAjQGJvuytOsT8NxaSgU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmG0SVlRgt95FLMz50aAxZh6ayyhq6CyWpWmVeRzLnbQNZrEFHJvLczSF9PlhUlwHW5seFbDGvkU+nlK0RPxBF4EFrzc8jgLUnFRyT2rHLXWXKymQ8ASz0yuwB2lk/eN7muU0HoxYppq3Uk6V+xchEHk4MICjjRReSeA+BFz9Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-524168b16d3so4095989e0c.0;
        Tue, 13 May 2025 02:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747129115; x=1747733915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4yUsNu9MK40dAHahbaghNZjNLMh96jg0t1dS4WtV4k=;
        b=eIZeClo4y0Vw2WYRVw7tq/sJAbHIC5YJ+2JrHL8gXSkVS7hT84hOElRbYkg4Q9lH3w
         qRYB4pfIMrN9YOpW7VvRTODdjFQnWercIt3W6WJGzi7UC6SMGDS9ghYp3i3iwldLS0yW
         Qcx1JU6OeS/hCZk/MBtSypWQRI7S3rHb/5refVXmc1aEosJQMAmXOHImZBFFxhQtxZpv
         GyDEu+r4KT6/mme9fP2ScCKJ2t6yTZxigVV3H/HJdiPbAOJpZhr0bMeB+kPdh/VsNG1k
         fDinDFsgsX67Dlydhy6APkVhJgSVXa3lP2zjIApVvToDD/a+R/ood4LHOHleDs3AueZ0
         7jnA==
X-Forwarded-Encrypted: i=1; AJvYcCU69SM8axJ9FFo57xrA3beYLh4dbx5xrgqXCGUUrujA6ATn8DVD+gkMXknuoS7KC9jSOB4wF0e+Ark+AQo1@vger.kernel.org, AJvYcCVJ1IwTwZkIj07pM78FzQCjq2aEcIrAdFie6T9nCcT52hvgJET8iJVJK+4mh69BGGQILkbmgJEQU1638cG1@vger.kernel.org, AJvYcCVdNAa/xWEAdZPENMreptgiKszTGFRn0nP6U/x1ITJzGQKzWuT5YvWdLlEi25zltIIJKEtANV7+4750@vger.kernel.org, AJvYcCXkjw/A6K4mH/1ao0LnrkgiNdl8nbJPFTe/ykh/TYFG3EtmbIIAiFmboEG+N6IOS7ON8hqKoivqQ6KtYuHvs/Bbnhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzXrXqHJzr2AKhm4tpo3UiEKyQ7cYuhqRnmai053y5va+Ai34q
	JDCv5F/aiR/8HtxeCUNNng4gtsumdH3cJfObguHF3gDNLXYOxu86gxuUqSR5
X-Gm-Gg: ASbGncsDXqO27i28EN6/7CLkbWBwMiKBxwEL1yAvaGjXLb7o1fWTgcj8EL5efVz1iZN
	n07uBoS8L82ECrmezWPP9mbM8svzN37bXl/uHOJMfxNoxvKBY+VD1DK2h+qJ/likCmoZ2NEpZUF
	d0+MOUMC4eE+1ReKU3VPpsH5Yrz3wp+7pXECvGZvY2YdjRimetH0TA408hcx72gY8nu6EJzKEdx
	MkPh0DS1m90iswkqyq8kOw3LfuxEMx2QrvaGoWdpXsyoD+4hmxaD/oGNxqZM4lmDMaGA8/QuL8X
	PzKHfWQ/I9+wN+yBs3AOvc4S/L8W6kX9japjbfqbU+6Ocu1iMJW63MYEyEHjbtSK2p9iX3ID77k
	PCbT3LPC3LaMa9Q==
X-Google-Smtp-Source: AGHT+IH9lQC8XDAWvRYMD5b77U55oH862rJ3PAM0BUF5N/SveHMoiuGm9wOm9QbzXb3VXgJvrR8V5A==
X-Received: by 2002:a05:6122:45a1:b0:52a:79fd:34bd with SMTP id 71dfb90a1353d-52c53b79005mr13666968e0c.4.1747129115180;
        Tue, 13 May 2025 02:38:35 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c538a7135sm7066015e0c.42.2025.05.13.02.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:38:35 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4ddbb22503bso3913848137.2;
        Tue, 13 May 2025 02:38:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7cJn7NkX/zIjnbG4S2fuuGgRlGcYu4BgThy2XxKcnQnFG5iCLScEHIyLNJ5a1lMDxfCiowFemmZH+PRaK@vger.kernel.org, AJvYcCV9V93aW2IxAj37lrk7u419hPMhdg6r8heOCnbXJR1MwX4AtaP2xGkThTJ4TRviO+iu9atJEq7HRDxFnsaUyw0FsyQ=@vger.kernel.org, AJvYcCW9F8SSExFju+HrBxzy7aDNBAFShNeInnu/Mv3LGRjMTcU0+xTEZnVqqoy5sn1e7Zv8RMDDj8mBR6N0@vger.kernel.org, AJvYcCXYm/vrqx3iuTYtJm1voEWzaJ5u7sM0ycid+XOIFGphZnX2iQAhmwYBoLKn0QJbiYnlyzLJZ9iOkFG9OVaJ@vger.kernel.org
X-Received: by 2002:a05:6102:2c0f:b0:4db:154e:ad1d with SMTP id
 ada2fe7eead31-4deed30e610mr14015694137.2.1747129114823; Tue, 13 May 2025
 02:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 11:38:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_SVtXjQ_c1w0=qcWHqc+68u_EkJuUjm7R+s4fOYoMBg@mail.gmail.com>
X-Gm-Features: AX0GCFsAyfgiEIH1z8bVZTcEBqxdt93Espk-5SgrnQNg0i3hlG0QpBA704ogbD0
Message-ID: <CAMuHMdX_SVtXjQ_c1w0=qcWHqc+68u_EkJuUjm7R+s4fOYoMBg@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> At boot, the default clock is the PCLKM core lock (synchronous
> clock, which is enabled by the bootloader).
> For different baudrates, the asynchronous clock input must be used.
> Clock selection is made by an internal register of RCSI.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

You forgot to CC the serial and DT maintainers.

> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -35,10 +35,14 @@ properties:
>        - const: tei
>
>    clocks:
> -    maxItems: 1
> +    items:
> +      - description: serial functional clock

The Hardware Manual calls this "operation clock".

> +      - description: default core clock

The Hardware Manual calls this "bus clock".

>
>    clock-names:
> -    const: fck # UART functional clock
> +    items:
> +      - const: async

"async" is the name on the producer side, not the consumer side.
"operation"?

> +      - const: bus
>
>    power-domains:
>      maxItems: 1
> @@ -58,11 +62,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> -
> -    aliases {
> -        serial0 = &sci0;
> -    };

While this change is good, it is not mentioned in the commit
description.

> +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>

This has a hard dependency on "[PATCH v8 03/11] dt-bindings: clock:
Add cpg for the Renesas RZ/T2H SoC".  To relax that dependency, you can
s/R9A09G077_CLK_PCLKM/13/ below..

>
>      sci0: serial@80005000 {
>          compatible = "renesas,r9a09g077-rsci";
> @@ -72,7 +72,7 @@ examples:
>                       <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
>                       <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-names = "eri", "rxi", "txi", "tei";
> -        clocks = <&cpg CPG_MOD 108>;
> -        clock-names = "fck";
> +        clocks = <&cpg CPG_MOD 108>, <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;

s/108/8/?

> +        clock-names = "async", "bus";
>          power-domains = <&cpg>;
>      };

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


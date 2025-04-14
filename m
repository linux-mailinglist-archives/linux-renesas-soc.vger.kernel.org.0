Return-Path: <linux-renesas-soc+bounces-15931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFEDA887AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1C901887744
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2D7279905;
	Mon, 14 Apr 2025 15:43:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E42798E6;
	Mon, 14 Apr 2025 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645396; cv=none; b=ZGlWqhtG04qwGZzsYmfIxdsEs+jcQThlTImxWwv2hdmEfzu9pTDLXC6LmFqYmt2v0rPSSmYKCcHWqyTrre7q5kkS8tHDXRh3iZ3IHcIBabcb5wiEV39RQugsv5nVU+JUGBm5khnhmxO213CxHEDo6vX9Pr9bviFyy1et3WPnTH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645396; c=relaxed/simple;
	bh=Bk9sdieVhJvYhNjXyqNHNzdwxanItAh4PQFWYC/DC0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TkOl6H8AE2C3qSNDq+nWdl2SH41MxuDB9ClrTc58/3zVRA0cqp/s1fS2cWDLoEY+Qs/9EAHv8u7UZssWiOKExY2vWS/Qt/c3sSUJjv2ia2bA+oK1vHs1UOiDYGL8kSg46pnKXf0xbjxY6gge2Cz4NSzW8aMKeV2j0LwmpSfV+xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso4927569e0c.1;
        Mon, 14 Apr 2025 08:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645392; x=1745250192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo/5xBg1cgrDSggMEx8ra+sZxxAkZzUw3KFNZtSeNhE=;
        b=b1Zo0D4HfmP9HhAl1v+oIPszx3KeTTjz8BjpezzS7oiHefXxshO0lg4bnqj/je+kWB
         8zqJjsypJX+j0vGZQ8W/1pzAAgyESyxDDeBn2WbzpsaPU5AGrddwcegdaR2/23av9FzA
         9ZU9hednt/eDQy94ywNO5GryXXjV8tCoa5W7CCVb2EdV6Oo5VUWf+b6ZmgqoswtqZihf
         I1z9aw+uyb2qLcVSv0/mtDuC/geJlYKJe3HxbeGPsJsrDOlZWYGLSHquUVkffIQF4plm
         DTJhyS1GVCDCJMHjroVUAgBz8RdcyHwCXWo+chIjJQdeDYuZMv36fdQ0HMsx4RbHBgUk
         Mdtg==
X-Forwarded-Encrypted: i=1; AJvYcCUh9oFHoC3Z6Fcmdvt26oVUQYGWRaq67PDRgwHWodknu4JED5yTpyYYAPBluTMVueT++sPZY4/8EnQKhVYksK2sBPA=@vger.kernel.org, AJvYcCVmrqZ/BmMSCdlA7MIGq63qNaUyidK4hYcykyLQ1OYf1b8n2ZmAJ7DmatKq0iX5Zod7uPJzfB4CTM3c@vger.kernel.org
X-Gm-Message-State: AOJu0YwAi16CNSE5I0HTLWC4Ry7LQ0oMRHIFZjrZm2IPLrKXyr6IHIzo
	rVGNevI16WjxzxBX5cN47ogfCdiEZReBWfndwykaPMfUf0ve4x97Me/Es3Yl
X-Gm-Gg: ASbGnct0Ro/0rZCtoTL7WfCIICVDbs/TbG/b81n/9KMKZJFk/37/Tdm/Xpwvsj9fxqB
	iTYNo7zJfZisCVHRtpxDDFpFtP3i8iZ2c15bfO5J9I9hdgTAEjN7u2AZeiM8lFOAnSSuxY7dAuM
	djYMfWQxvbYUbiC5tIxyGMfu6rRTgqEbWGgeBJiGunVSy/SvqJbxhTZUAqfxjyEI8KC7AiCqsSv
	jsM45fKnzcTeTfu4CU73MX6hvVzAGeAyJ1F8UvyZroa2Lm821Fh9JEQkWFXUywm4BnEwd7U/3sm
	7GK8RnoyMFtLf06fjuFkV06dJ+cZr5CtmRM5Kc/D67Qc9MfjmWWDXam7sJuOSJJeDNuJ2uXJQU3
	hk/fuqT4=
X-Google-Smtp-Source: AGHT+IEWgR2LdmCs084AXJxRJYWF0jxkV8bdYr9/MVy4yTfn0HneeGl3qNK4M0BYnOMGedrOlkRuZg==
X-Received: by 2002:a05:6122:3d0b:b0:526:2356:f3fb with SMTP id 71dfb90a1353d-527c35fa25bmr8593466e0c.11.1744645392331;
        Mon, 14 Apr 2025 08:43:12 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd74722sm2250948e0c.13.2025.04.14.08.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:43:11 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso4927517e0c.1;
        Mon, 14 Apr 2025 08:43:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgthza44a0Mdh9VUWkOX48VqJ99nWo7ICc8S26FV4DR1O3SihJD0KDk9mydFH3pVjjaU7xPA+zHvvC@vger.kernel.org, AJvYcCXpxoJ/YcVNLYJ4OQi/obi15e4kwX+5+/FOQGKGiELLCqSrpvxXQ6XAvAqqL9O3GXHWdXXQyTZStqv50azqo9DkV2U=@vger.kernel.org
X-Received: by 2002:a05:6122:250c:b0:520:6773:e5ba with SMTP id
 71dfb90a1353d-527c348024fmr8745717e0c.2.1744645391547; Mon, 14 Apr 2025
 08:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com> <20250320164121.193857-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250320164121.193857-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Apr 2025 17:42:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSTbVwOzTtTV8DRayvgor52=KwErzhOv2iPJkMy4BXbQ@mail.gmail.com>
X-Gm-Features: ATxdqUElZK_kVrcHg1wLs1acoCCfZ0aqgjdzt8ZQAfeFvk-7Ha_Knq-bR9FuKNo
Message-ID: <CAMuHMdWSTbVwOzTtTV8DRayvgor52=KwErzhOv2iPJkMy4BXbQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CAN Transceiver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 20 Mar 2025 at 17:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable TCAN1046V-Q1 CAN Transceiver populated on RZ/G3E SMARC EVK by
> modelling it as two instances of tcan1042.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced GPIO hog with CAN Transceiver.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -8,6 +8,8 @@
>  /dts-v1/;
>
>  /* Switch selection settings */
> +#define SW_GPIO8_CAN0_STB      0
> +#define SW_GPIO9_CAN1_STB      0
>  #define SW_LCD_EN              0
>  #define SW_PDM_EN              0
>  #define SW_SD0_DEV_SEL         0
> @@ -42,16 +44,36 @@ &canfd {
>  #if (!SW_PDM_EN)
>         channel1 {
>                 status = "okay";
> +#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> +               phys = <&can_transceiver1>;
> +#endif
>         };
>  #endif

Do you need these two levels of #ifdefs?  If CAN-FD doesn't work
without the transceivers, wouldn't you just need a single #ifdef with
the logical AND of all conditions above around the channel1 subnode?

Am I missing something?

>
>  #if (!SW_LCD_EN)
>         channel4 {
>                 status = "okay";
> +#if (SW_GPIO8_CAN0_STB)
> +               phys = <&can_transceiver0>;
> +#endif

Same for the second channel.


>         };
>  #endif
>  };
>
> +#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB)

Related, doesn't this need !SW_PDM_EN, too?

> +&can_transceiver0 {
> +       standby-gpios = <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +};
> +#endif
> +
> +#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> +&can_transceiver1 {
> +       standby-gpios = <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
> +       status = "okay";
> +};
> +#endif
> +
>  &pinctrl {
>         canfd_pins: canfd {
>                 can1_pins: can1 {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


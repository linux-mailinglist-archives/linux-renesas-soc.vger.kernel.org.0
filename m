Return-Path: <linux-renesas-soc+bounces-14016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BAA50467
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 17:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF0A2165DC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Mar 2025 16:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2BE178CF8;
	Wed,  5 Mar 2025 16:19:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30950567D;
	Wed,  5 Mar 2025 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741191552; cv=none; b=I+ceG1yIxu03Fs3WwFs58mrLTsmiN7MkPEDfQTOrIToJn1437sbOWrCWbvaqjmVzH71L9tT4V8wKPhY16VZxt65fXJp3iDfg/hP8Drw0AQgdX8klYx0tVLvJX/P6msdqSOH1NgZQa7ubKPIpMQNgCkDnpzSi4oEvCeOsxib7BHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741191552; c=relaxed/simple;
	bh=oXZOuQ7e410efTsnoAXR4CmjjePyEbd1/L8TIsUkQF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJUK+5hlkyHF8A1y0Z1blNXGjU35NGKjH8483XOiFnOBj94SyWLje8yVnZ3QV9Jw1MXMdbjB2nQQIi2gtTCCSkyLMZYy8klP+7o43NkO8MUgdbsh3e81dZzTYY1HK9V8Owao4qGIseP9c6WpbG0AnnwSL+r9nVvxzDjkSE2kO/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86b6be2c480so1584746241.0;
        Wed, 05 Mar 2025 08:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191548; x=1741796348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wi63vwYnsVd/kjUEEHJ3TuRO7LCCKYr/Y1Etu/O9P5M=;
        b=KbJWWn6ZB4TAkIRE8DNw1Ixpi+I9No5pAle+NXv8bx1FQGOwdaWW25Zn6vvudyqNZo
         NVi8YnbNw2L9AGN2n5jIXKXtLzRfL1JDI9dJfysTj0bLvQ9anps73ciKm7B367cAlbR9
         OpQCyeENCsoC66vUOHonU+ZVjwWVcOQ0Uwm5XFF05nWADcDYFl6AT9nLFJl+2x5R8ahP
         9GLArW1XI3+TYHxZVQuo8h3qnVOdCgElps/QbHk2/LD5J2QnJu11Xl0cOelNwXCEk5Il
         EwWTb5VVV5T6z+D8wtTKz4I6PWTcuZrdzyOcZ3GfIp9cluZv+ahF9uQPMWp3loWbHxet
         0jOA==
X-Forwarded-Encrypted: i=1; AJvYcCUGx/kp4VOw55vvNdHy+2b9XpS28S06Vr8WkVHR7O8gHD2PVDhJf2+gJGcXmvV4BaCBHP+hI1yJwEc=@vger.kernel.org, AJvYcCVKt+T+kTk8k1jc7QD0DoZ46kTGdZcwbn7Z5ctRWPzvHkwxnoB2b0A5Jfthd1AnhhM2CWlTvv9RkVbe5Pr3qGatxDY=@vger.kernel.org, AJvYcCX4TF003Wkk0XonS7uFeQX9Oxed3xD+veINQLoRxu3HUz5CWJzE6suHsT9lTw7I2jc4huQaxX8W4JckVgov@vger.kernel.org
X-Gm-Message-State: AOJu0YwIV6ajOsa8VxCsvpvN6K6VQnJELSmV61V8JoLEMDCOaSCzDJD4
	9zNHNZ8HtE2tMencY64Sziq07lo/coCZXWiJynxSBH41xvluwQdzkEI8MiGv
X-Gm-Gg: ASbGncvAmRImff5Gna3HObKmTCREBdGzJk5i30ark5DggQFsn0iIeGimaPXV+n7Q4Yo
	tRmp6sXzCKXVKWgx0/d560n/EvPYazDLLuRaB723hVAlPmi4hOFn+ekpLbS34rM4brHNV783xrD
	jkRJQ16zNlg7Ivxu9nEnQUWuqPbigWPbnB2jc5EH3XebXo6I0zprC8ZRS+DmbUM6IcNRHBGtnAv
	w1RaRo2Amd+65aRm/QJcys+OxVRmTG4U4A03mw8rG2muany3lzJG0eFLn5rdFOJxrgFyG226jGU
	ZoM8kABqWR6aE3/Gzy0dY/oNxQjrFVMp3jB39pvYMz6R2WL0AKy7k6a693MAr6kuXbSwnK7oqlC
	i/wBus0A=
X-Google-Smtp-Source: AGHT+IHgb0imwLoUbz8McfdQZ1+sQsmP6AtxCqSwKs43kneutG5ToALU24J2Voe9JggMArPqWiNV0g==
X-Received: by 2002:a05:6102:c51:b0:4c1:b0ad:a0bd with SMTP id ada2fe7eead31-4c2e297c3b2mr2361375137.23.1741191548225;
        Wed, 05 Mar 2025 08:19:08 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c182a9697esm1957904137.2.2025.03.05.08.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:19:08 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86b68e51af4so1556094241.1;
        Wed, 05 Mar 2025 08:19:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVao5ASG9UcTMPv0egR6kjVlo1Bkxbt3EYMyhdA8EjKf8ZhWc6UcMgTaJPmJrd3K2sV/svJw22JccyJetQqAaChdE0=@vger.kernel.org, AJvYcCVbQB5k4J8avBvmgXGJLxJCWAjp256NNqSZVLQntYUzuyv4Ljudr7qzKT0PeoLE7xl3P+Ov5vxzYME=@vger.kernel.org, AJvYcCX1/+Q+ARhHFtn7TnC134bq4UOCt77diIdGp93NfHSCoqtYFGLXNskSdnkbEc3SbHQWeehbzzWz7tnvIV9t@vger.kernel.org
X-Received: by 2002:a05:6102:2c14:b0:4bd:22d5:fbd7 with SMTP id
 ada2fe7eead31-4c2e27f531dmr2787137137.11.1741191547750; Wed, 05 Mar 2025
 08:19:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250218114353.406684-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250218114353.406684-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Mar 2025 17:18:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwVemQfrDFH48n9Csp6=KtFs5MpZ6e+wLWSnEuh2gdvg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqot5L6AnvQFJwH0xjAQSlKOAIFmKGOvQsU6p9H0sVtRFCjpq1NVP6okqU
Message-ID: <CAMuHMdVwVemQfrDFH48n9Csp6=KtFs5MpZ6e+wLWSnEuh2gdvg@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: rzv2h-cpg: Move PLL access macros to
 source file
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 18 Feb 2025 at 12:44, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move the `PLL_CLK_ACCESS()`, `PLL_CLK1_OFFSET()`, and `PLL_CLK2_OFFSET()`
> macros from `rzv2h-cpg.h` to `rzv2h-cpg.c`, as they are not intended for
> use by SoC-specific CPG drivers.
>
> Additionally, update `PLL_CLK1_OFFSET()` and `PLL_CLK2_OFFSET()` to use
> the `FIELD_GET()` macro for better readability and simplify the
> `PLL_CLK_ACCESS()` macro.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

The changes look correct to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
but I still have some comments...

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -56,6 +56,10 @@
>
>  #define CPG_CLKSTATUS0         (0x700)
>
> +#define PLL_CLK_ACCESS(n)      (!!((n) & BIT(31)))

OK

> +#define PLL_CLK1_OFFSET(n)     FIELD_GET(GENMASK(15, 0), (n))
> +#define PLL_CLK2_OFFSET(n)     (PLL_CLK1_OFFSET(n) + (0x4))

IMO, the original versions are more readable, as they clearly show
the symmetry between encoding and decoding.

Perhaps a good alternative would be a structure with bitfields and
a PACK() macro, like is used for DDIV and SMUX?

> +
>  /**
>   * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
>   *
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> index fd8eb985c75b..81f44b94f6d5 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -87,9 +87,6 @@ enum clk_types {
>
>  /* BIT(31) indicates if CLK1/2 are accessible or not */
>  #define PLL_CONF(n)            (BIT(31) | ((n) & ~GENMASK(31, 16)))
> -#define PLL_CLK_ACCESS(n)      ((n) & BIT(31) ? 1 : 0)
> -#define PLL_CLK1_OFFSET(n)     ((n) & ~GENMASK(31, 16))
> -#define PLL_CLK2_OFFSET(n)     (((n) & ~GENMASK(31, 16)) + (0x4))
>
>  #define DEF_TYPE(_name, _id, _type...) \
>         { .name = _name, .id = _id, .type = _type }

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


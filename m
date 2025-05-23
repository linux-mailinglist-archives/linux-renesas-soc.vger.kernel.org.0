Return-Path: <linux-renesas-soc+bounces-17420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08011AC1F49
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 11:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D59D16B75B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 09:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FE4224B10;
	Fri, 23 May 2025 09:06:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F550224893;
	Fri, 23 May 2025 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991170; cv=none; b=G99EZBsyvz5z/g6OWY7DXi2fbgO3WXwcZ/t2wstUHanB1IjmLFjhALP4PEuP4G1AfXo8KX2oVqgxqtWUMzKLxspNK34ZrbtmAQ4Cov4mOhiKRVPSk3HH6TyodU2j3dHE84VlK51+2pOahfgjmZ7JT7JLQH598S9gMhOFETWnGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991170; c=relaxed/simple;
	bh=VVV/D4f6NRKqaHsfA+cSsIhG+59Ior9lOaMvD3tFpUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHflXErFFhMEVBmwskwkJV4ynqh7/OSIUqkZgxqBd3FfiUoRoCgxMsV23wMUr/FpZA65M0VkbMtHgeTxEtDEG5217aNRM5uqEHATr0fzyPsBIvRNTUmz05C7DixxDsSi9mHC8IH/NOjJxsZmlG+wppiqXQ/e/+oYloAhRQJ8tJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so3171783137.1;
        Fri, 23 May 2025 02:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747991167; x=1748595967;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty9aWGouOiVBFoMQuvlOoEw/l23pocI0K5ZcrDsahFo=;
        b=oWehFUmYVL8CFulB6qWY9mboA+yLEc1dYs8DS3o81XPZg5A6CPo7Yn0tG5zGmVexaR
         RusrOlpyYgi9io8iE/h8wZ3Tziy3X2IawaNrWJnqp4brJvm0u3tHZiFWkVSdgRQp/y7L
         J94UVWAmRRoYuRlzXx9nmnvh0+gon06VzKDtegtso2b0qPa3M0PL1YSsJT4feoPwcdqo
         RLuFQj4n6f1R8pf2eGFav0FIfp927FcahJ0JzHb8puhJtQLiwVrFkYnWA2WXqh0Y/Bp/
         RhJiwK6PZt0PTxy7z9pTRrwPM3wldKjQe6qcWxaRn69Borve5SmVzDEu2QZRI3m/hhEb
         6N2w==
X-Forwarded-Encrypted: i=1; AJvYcCVug8xzgQYQ3mOXr1Ls4sNyzvBh7dWu4VnKakJqEXzwalhW5Lvkmp+JFtqN5H9g0iGRGZrWBcIg8R/5hfALBlndQSs=@vger.kernel.org, AJvYcCWT7M4bfeOJUocNmVUHNw6Dmv6ZBZBup+3ob0suIHVHBar230uotDYRhKy9y7v73AD6FdCEX89Wvg6EgNL/@vger.kernel.org, AJvYcCWX1PNNnZ5zgqqqignq9fBA67E567nNb4KP54jcnCVgSyiLVcd5ixGgP5A8XkSLl1WOjIbsdm6XhqSA@vger.kernel.org, AJvYcCWxflHJOxwxp/9ZV7qyR0JgXNeztusKDLgwKYtpRG4Q+VeYlkwqA4imD8sktYOACsqorCqAT5PoK2gvdJ9A@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXVt/f651JkUXs7D0Zojc9lAueMBYAoG1gHVVlMV81mVCxScj
	NyO1p5D6h60fOSKVWLMtHNNGAy53xNVNJS7ddAXHSPd4LM+dcN7s9o56J3XqG/wD
X-Gm-Gg: ASbGncsvqADgLLTp6uTtqPGfPdiKV9sN28JgMzvXhTAOlTbWjaQe+MJHVSuFTQHtGUQ
	4mm3JGFZF2IR0rHhIcr1sJZvuq6ah3OpubcYzmcpTG5XGjV9IZjmgljiMziO+4Du9Hiy7v646PP
	leRe5bez336/sJIPwknL3iTuuTYk6uiAJblrUF3DlYx4ExEYxGJzQ/3Up8beYONIvWeMVIfSHbe
	cOh4Ku5OO8vonBuy18eUzUJSBoy2O6m+zgnoXEmuLUMMDg+eYHx96wJOFU5Gjoh2LQRjXry07om
	+EqNOwJKGdCeNgUzPuKUJqvsE/qrZ8tUl6TltLkDercFvxk6QJcfUs5WGdwCVc13cvykCkfYgLa
	w7OA2h/0arpmPxw==
X-Google-Smtp-Source: AGHT+IEi5BaX9kDRRLrkEDsb/qmZ3NOBZam37Z3ceczD2nDMLmWi/Nkbg2h3SAeG8eYnOzUWtDZlHg==
X-Received: by 2002:a05:6102:358c:b0:4dc:9486:b055 with SMTP id ada2fe7eead31-4e2f16bdbfamr1738468137.0.1747991166862;
        Fri, 23 May 2025 02:06:06 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec1eb690sm11473312241.27.2025.05.23.02.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 02:06:06 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso1923075241.2;
        Fri, 23 May 2025 02:06:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOtK1kVGB94bXY6dRbERalIireB57GANn1EkjUZyhxaMnkj1qIfYBmdZjZ9L3MTebyfNTcbnZ51+4/@vger.kernel.org, AJvYcCVCggFViKWkY3ofHbmGKwN7K7u3OfXjsk6wB81mrVUOFxH0JwTM7RR2sUk7rJDSlKlqE1cqVACe2DGZHufTur/5r7o=@vger.kernel.org, AJvYcCVl5ghW0z/M9p4gQ07Xxroxn2EzHDbYiEC5aJE4e24F5KB9qPdlC7rVb2atS9sgk4l+dXMYa3N3aschqjLw@vger.kernel.org, AJvYcCXGhRX4/jyezq3PUuoFcYtZEDckCfKNkFLwwSrRG00RgZR9MgpUyJwJUF8wk0EA2WSNkD3IZ/+sFP3FBYV4@vger.kernel.org
X-Received: by 2002:a05:6102:26d5:b0:4c2:ffc8:93d9 with SMTP id
 ada2fe7eead31-4e2f1981884mr1418602137.9.1747991166469; Fri, 23 May 2025
 02:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com> <20250515141828.43444-2-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250515141828.43444-2-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 11:05:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9A1hoeF4nZ-n1z-SkHhW0Hgrzcqtm9ekF+q0AAuFX+A@mail.gmail.com>
X-Gm-Features: AX0GCFt59dS0qerio6QStqso0o33GqhHlvdCYgG5LoSdgUB0re1hlqC2JQWJaFw
Message-ID: <CAMuHMdW9A1hoeF4nZ-n1z-SkHhW0Hgrzcqtm9ekF+q0AAuFX+A@mail.gmail.com>
Subject: Re: [PATCH v9 01/10] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Thu, 15 May 2025 at 16:18, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> At boot, the default clock is the PCLKM core clock (synchronous
> clock, which is enabled by the bootloader).
> For different baudrates, the asynchronous clock input must be used.
> Clock selection is made by an internal register of RCSI.
>
> Also remove the unneeded serial0 alias from the dts example.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v8->v9:
>  - typo in description
>  - named clocks 'operational' and 'bus', and added optional 'sck' clock
>  - uses value of 2nd core clock in example to break the dependency on cpg patch

Thanks for the update!

> --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> @@ -35,10 +35,17 @@ properties:
>        - const: tei
>
>    clocks:
> -    maxItems: 1
> +    minItems: 2
> +    maxItems: 3
>
>    clock-names:
> -    const: fck # UART functional clock
> +    minItems: 2
> +    maxItems: 3

I think you can drop the maxItems.

> +    items:
> +      enum:
> +        - operation
> +        - bus
> +        - sck # optional external clock input

The addition of this (third) clock is not mentioned in the patch
description.

>
>    power-domains:
>      maxItems: 1
> @@ -58,11 +65,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> -
> -    aliases {
> -        serial0 = &sci0;
> -    };
> +    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>

Now you no longer use any definitions from this header file, please
keep on using <dt-bindings/clock/renesas-cpg-mssr.h> instead, to relax
the dependency on [PATCH v9 02/10].

>
>      sci0: serial@80005000 {
>          compatible = "renesas,r9a09g077-rsci";
> @@ -72,7 +75,7 @@ examples:
>                       <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
>                       <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-names = "eri", "rxi", "txi", "tei";
> -        clocks = <&cpg CPG_MOD 108>;
> -        clock-names = "fck";
> +        clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE 13>;
> +        clock-names = "operation", "bus";
>          power-domains = <&cpg>;
>      };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


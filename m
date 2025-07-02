Return-Path: <linux-renesas-soc+bounces-19020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5637AF108B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 11:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72C9F522D73
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 09:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CC4248F73;
	Wed,  2 Jul 2025 09:47:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D5247297;
	Wed,  2 Jul 2025 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449663; cv=none; b=ZJUu9gprHOKMS5k6jrMHxFiPI/rI8IEmrQXW3xOzE/WU9kU6ws+u3bc4VoO+ydq64TFMB5l0Tn6APzb+2owoN8SVE+bBynEru1a1Jsh63/TqlGbcl7jG2U3g1ABoQnyFtbnKPon7PHKIqOLaGKBRiAbAqQez5gBf8Cy5PNJt9y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449663; c=relaxed/simple;
	bh=Ouh2tjXOCV5J1xbDYQClFn1faPkd4g72dS9hnpcKiwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFBeGQ2O87XNd1SVPY7iQ4lYlGTVKx4jaPiwz1eddJc3D8DC4GIAv7VcYQM+uFTWT4pkgMxJcfl+EkXLwtl+kBjYq+YrSETkL1/LPVIGm1xhsrWFu7fOQ/2omXcfXDlDf7Ny+sU05Kly68QoUXvNHvfrE/VBY7jLdnS/2wdeOsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso1520255241.2;
        Wed, 02 Jul 2025 02:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751449660; x=1752054460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJLSZzMoHvI3XA3eUYjDZLD323ifNHYwsv3Hd6lOZUk=;
        b=K4tw+vOGERB5jPntnu3uo+har3n5vaHjHsUPSpL2Pfl9+WJZKsh5KWnclZAZnGhlZ4
         18Ur3LTdSLko5EojrpqmH20lsYQ7FrAhz1BLGNECRdQZfk/o/A/wBLKdNj6M6Gqyp19e
         GBZJC6zw4N5q55Ld6kfiOR0bc5R0EfUdBWOz/KxGY0YXmQB+Cf0Yi9EdhILS5u7OChIL
         8a7m0TupWLGSZmFxE2gCb2RbwC4qJkFs4grrwc9Xr8hDg6/AS7G0cWVBRwrX9thTU0J2
         NOTvxEpwL6SYDvuBSGPGz9jbZCOqd83ofV8VgrvHAaucpX/BEu2K0/9YaSejh21puuHI
         cCQg==
X-Forwarded-Encrypted: i=1; AJvYcCUa3eAOcq10WMeh5cSjK8KbluyKhOotrUdXNVtqwvZrfh2bVU//hOkC2kQt684Z/9el9v6ohdUj@vger.kernel.org, AJvYcCVhB7i9ygtG4Ops5OiKUZR8esu5wA2/CIkIQeAyuHB3WyZBtb7IJ25DktMipHyM/4wd+Umqekxhpxvm@vger.kernel.org, AJvYcCWiZ7REFq+yVIZFveWXdD5Z8DUbmOTtSS3qZ99oYrT8IqvdFCg1CyvSaMNnUTvmLKyCGnO42C6AU12f@vger.kernel.org, AJvYcCWz6sW6J/ANgmlI9yfOK85B1FWpX2+buXm0ZHiUfclLxeFxBGo/Dj5klPzKsMakpfrH+EtQdulLxFxZBgY+@vger.kernel.org, AJvYcCXU7OaFn459Ei3ytaRzbEM0iqwAq9tl/BeImMx6H+YqMZeYr5u6rSbWZ26kQe3WnLDdcelhiziDxdD+J/fMBfaVVQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZxZ5jOGFWnTE2ifZZKCYIRyr/WcWFpHnh9acTHBs3Tw4zvrHA
	n9b79hTXfb0izTvSRXGU6QAGLt+8eWTGEkxduIO+zQlssBrYfwjKH5+BJHfEKcHo
X-Gm-Gg: ASbGncuTzah0PkjykJNIyHlQdkdryqQ+PVHUY98IQAPmzp/I5ftWX3wq+3d3xnp3hYa
	qk56h3OOVHihMj8KC0Kjnkrzw+kiBM0ctgoTO1zhTrKpiw2JirFXi0qTscxBThelhgJ/ZzWSyzK
	0HxTitq9CK4otFhpLWwShUqTlZz7ZZM1uZu+uPponj4e+0GwU936Vx2H2hCWuF7SC1yKCMGfR6+
	0gszWG/jy9e1MDOWuDwPcOP04eDsR5At9otH0dohVKdnCV3Wtru76XcPf/JRqf73zf17ohsVnRm
	3cRIHiWKR3eRPuWKEBu8j5ONf1dCYSQwnO7izF8TRBwvKJKz0FS4fO2Bv2vxO/joQw8K2M2ut5+
	5ILcbl7AXZPGVj+hKx42E2dyP
X-Google-Smtp-Source: AGHT+IFnbx4WhcjjRJhuYKew+vkIZVG5I7u/AhmG8xwPh273vO3UIHNcJCeZ+stYHAYQZdh042SYNg==
X-Received: by 2002:a05:6102:41ab:b0:4ec:c50c:399f with SMTP id ada2fe7eead31-4f16117a294mr803148137.11.1751449660106;
        Wed, 02 Jul 2025 02:47:40 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4c7ec2cfsm1776243137.7.2025.07.02.02.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:47:39 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7fc3309f2so1584627137.2;
        Wed, 02 Jul 2025 02:47:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG6VowTjowzfY9ejsqrzOa/fvya25urfdq4YVCXg4DAKVURqr5dgWpiErNyrVOBffHGD4e2La+HVcF@vger.kernel.org, AJvYcCUeJHyQAvITNXJKQw4rgKWsdymWqD12UJ+RANqxdVfC9vJMxR6Yw6cHw4EhhpjKCLJPmErJWBRk59V2YT7ua9DwETQ=@vger.kernel.org, AJvYcCVOy0C1N+x1kJ0UsV+eBK5eSDx4QjnolcPpdDKga6/dGOCPJ49aolt6TGQQJQ8+rXIonaMuOpH/@vger.kernel.org, AJvYcCWiCKqTrsptwVvSK7OHrHyD9siyIOiH2GlxaCXg5BGaWhXNgy3VkzkRqvcAt18AMBC1KEEy96ShQO/Lde8Q@vger.kernel.org, AJvYcCXeXhoJRMzpx2OoDbei+oMCH72QpaaJFo8+vjLC3E5f58jgOXf2ySroq5TzirO5yqmm+Ssp80PfYX9/@vger.kernel.org
X-Received: by 2002:a05:6102:b0d:b0:4e7:efa3:6475 with SMTP id
 ada2fe7eead31-4f1614301fdmr617117137.25.1751449659490; Wed, 02 Jul 2025
 02:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com> <20250702005706.1200059-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250702005706.1200059-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jul 2025 11:47:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsvWrTBXkZ4etWy-8sPH4TG7AEyD_Z27RBWutNvpmUHA@mail.gmail.com>
X-Gm-Features: Ac12FXyvUOO4u1emMGsdqUSyi2v-LKjWFuqnGZiY-qtjH2LDcXJWx9ecan2toDc
Message-ID: <CAMuHMdVsvWrTBXkZ4etWy-8sPH4TG7AEyD_Z27RBWutNvpmUHA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: renesas: rzg2l: Pass OEN pin names
To: John Madieu <john.madieu.xa@bp.renesas.com>, prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, netdev@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John, Prabhakar,

On Wed, 2 Jul 2025 at 02:57, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Pass the OEN pin names via the SoC-specific hardware configuration
> structure to allow reuse of rzv2h_oen_read() and rzv2h_oen_write()
> on multiple SoCs.
>
> On the RZ/V2H(P) and RZ/G3E SoCs, the PFC_OEN register is located at the
> same offset. However, the register controls different pins on each SoC.
> Hardcoding the pin names in the common logic prevents reusability.
>
> Extend struct rzg2l_hwcfg to include an array of OEN pin names and its
> length. Use these values in rzv2h_pin_to_oen_bit() to determine the bit
> position dynamically based on the active SoC.
>
> This enables shared handling of OEN register access while accounting for
> SoC-specific pin mappings.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -257,6 +257,8 @@ enum rzg2l_iolh_index {
>   * @func_base: base number for port function (see register PFC)
>   * @oen_max_pin: the maximum pin number supporting output enable
>   * @oen_max_port: the maximum port number supporting output enable
> + * @oen_pin_names: array of pin names for output enable
> + * @oen_pin_names_len: length of the oen_pin_names array
>   */
>  struct rzg2l_hwcfg {
>         const struct rzg2l_register_offsets regs;
> @@ -269,6 +271,8 @@ struct rzg2l_hwcfg {
>         u8 func_base;
>         u8 oen_max_pin;
>         u8 oen_max_port;
> +       const char * const *oen_pin_names;
> +       u8 oen_pin_names_len;

Please exchange the order of the members, so the u8 fits in the
existing hole.

However, I think you better drop this patch, and use the existing
rzg2l_pinctrl_data.oen_{read,write]() abstraction instead.

>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


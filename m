Return-Path: <linux-renesas-soc+bounces-11302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F1D9F1204
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 17:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F059C16A8A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 16:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39981E3DE6;
	Fri, 13 Dec 2024 16:25:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DA91E0B75;
	Fri, 13 Dec 2024 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107111; cv=none; b=kfa/+1wNNhZm0f+of0zJCHwgGM0w1aHF5cn0PSyOzBgzhD7QSVopUNSZLqsOvvtpAFYzsDsqOC2qziJydylMrkFhYZgANb5Y9Y+MsBatFI2fls4If4/HCNr+ELiIIl9aD452/xcSgpy5fZ8DcpIqs6sNp1cwEm1Fc0+OgOGS4QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107111; c=relaxed/simple;
	bh=GdaEFtf35oAxwi3V6z2QVhH0SPE5d+9F58jSl8MPOq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGtmtpaNLx0tWdKSYd5ISeQOO3AMXCiVWcNsajxVLU/JA/KAoxHYoTNDKAYJfRG+ZMj4/jsVJ5WHyIKILV+n/berzg/oLZ7b3Yp47i8ahYeFKa43M9qLlhxhxb5Oh1FL3QKtrfvWqt1dg38PUzMTt3pTGxAy9bc/3c+uffTh8pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4aff1c57377so956334137.0;
        Fri, 13 Dec 2024 08:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107107; x=1734711907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6okyGBltY7nQ9rmbjIajDxk1kGYcMQNirtZDo/5bD9g=;
        b=b2EME+LDvgYfLMhkgp99+rx7m3ak8/atoIBSeQ2v7DYqFLICr8v/CvaMCx4g91I9/z
         1qqjwttmHTP7CwvFY0I3hkXBck+Kh8Xvnoo2TKfqAI/J+HQ2QubNZZWozDXvHVKYUy8Y
         sMIOWzax7sYaGp05xfxEXo7+FxBAfqLdVn5/JJiR6afWFtoNItF9a0MtFti/bokzFFaL
         WL5c/1CMHwH1GD9zPbrBNVUltzx6Ngr28owSYh2D0uxgMNNyMc5maPcYYiigy1Oj4lyZ
         yKgPUt5I+MJff6F2lituJjmLV897JaJrXT50AERzmRmpnrhsRXzRis6VzvNjkmeVcTw6
         slyw==
X-Forwarded-Encrypted: i=1; AJvYcCUombtL9E4W7fSXGPOp1hKAicnRuqC9XcpCk6Y/d/yQ1SjqvRtC9qGkyK8XGB7u5S48Gzlpcx5hs4JfLcwByBwiiKw=@vger.kernel.org, AJvYcCXAArVBzUr/MG6jmlQ6hS7Z7/dQyJW6HUwvtdhS0Q9A6EX2KDwS7FCB/6vo8K4K0NFsJ7ne/RjpKsyZ@vger.kernel.org, AJvYcCXWmXPTFbde6Xdm/3fUhOSDRZJ+QbShAjvcQeLeltOmrkwXxK/VOU+CymYmvbgWDuWe5ixZhtU/Rtf1uA35@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9B9bW2EwiK2sJzGPJGhBjAD1hmzltYJb5v59CYL7RxXdUp4U
	bmTpReP01MFf7q3TXtSYEMf1Vvz2TC5keot81AnYbnhDEJ3ht+zMhFl0JZxS
X-Gm-Gg: ASbGncvCID9C2oHiCEPin0eFGyRpva1sZ+WP125f171sf3kaAjkKN6S+N3efRStm8AZ
	t8IYgBAfI6myGx181ss6q+gjNoObBTQalVeXtL4iE1txwPQcN9oRekhXRoKDPZMz93KSWdt0DxF
	rCPb57c7U92Re0znaRDRLn6nAzFP5vOHN1L/XRytPyciF9xq5xkdW1dDt0Mm9iMKsOvef1pi4CT
	rArUITg3GlveLP3Wp0r6u9eApYHU6Z7XMFo7res+KzX0Kd48HwgtKK3aYsoFtAYnxaV8eNW/CUh
	WVivkKbuxlbt/+P8R9U=
X-Google-Smtp-Source: AGHT+IFXBN7S9sUu3xP/VlrIK+tQJjap3YHMd6COymUYPtv5V/gk0i07vW00BnTnz1YBF2I5RZnrUg==
X-Received: by 2002:a05:6102:41a7:b0:4af:58f7:1aef with SMTP id ada2fe7eead31-4b25f81db8dmr2796074137.1.1734107106981;
        Fri, 13 Dec 2024 08:25:06 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afdae80f4fsm2017558137.31.2024.12.13.08.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:25:06 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so967657241.1;
        Fri, 13 Dec 2024 08:25:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqrR9MjTPv+NonfFvDwecrZCjtbEjP0o02T3gQ8hvzF/PCzRIzQj85SQdqZ9UBVDW0b9BurUd8ESn0fnFgmXKg6ik=@vger.kernel.org, AJvYcCVUGJNuLx9cqfzweNqah+4LupwL/Q0ll/swy6Bh0TFqNeMRxsQaTadeFNMkh1/NfGx5kY+xiGztkXzabU2n@vger.kernel.org, AJvYcCX5QdznGZdueATHwklw0MgkdwWSSEvqaIXWdArZFzrlkfAuoBHNPp7Ws4TZm4FNYt0Snm4mYcaxXz6j@vger.kernel.org
X-Received: by 2002:a05:6122:3d0f:b0:517:e7b7:d04b with SMTP id
 71dfb90a1353d-518c5dc3843mr5887795e0c.5.1734107106425; Fri, 13 Dec 2024
 08:25:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com> <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 17:24:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUK-r1iO1HXVWd_xq7u1wkLZFZ1bHeo-goe2dWY9rfQJA@mail.gmail.com>
Message-ID: <CAMuHMdUK-r1iO1HXVWd_xq7u1wkLZFZ1bHeo-goe2dWY9rfQJA@mail.gmail.com>
Subject: Re: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Fri, Dec 6, 2024 at 10:26=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> Add SoC detection support for RZ/G3E SoC. Also add support for detecting =
the
> number of cores and ETHOS-U55 NPU and also detect PLL mismatch for SW set=
tings
> other than 1.7GHz.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -348,6 +348,7 @@ config ARCH_R9A09G011
>
>  config ARCH_R9A09G047
>         bool "ARM64 Platform support for RZ/G3E"
> +       select SYSC_R9A09G047
>         help
>           This enables support for the Renesas RZ/G3E SoC variants.
>
> @@ -386,9 +387,14 @@ config RST_RCAR
>
>  config SYSC_RZ
>         bool "System controller for RZ SoCs" if COMPILE_TEST
> +       depends on MFD_SYSCON

WARNING: unmet direct dependencies detected for SYSC_RZ
  Depends on [n]: SOC_RENESAS [=3Dy] && MFD_SYSCON [=3Dn]
  Selected by [y]:
  - SYSC_R9A08G045 [=3Dy] && SOC_RENESAS [=3Dy]
  - SYSC_R9A09G047 [=3Dy] && SOC_RENESAS [=3Dy]

So please select MFD_SYSCON instead.

>
>  config SYSC_R9A08G045
>         bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
>         select SYSC_RZ
>
> +config SYSC_R9A09G047
> +       bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
> +       select SYSC_RZ
> +
>  endif # SOC_RENESAS

> --- /dev/null
> +++ b/drivers/soc/renesas/r9a09g047-sysc.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3E System controller driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +
> +#include "rz-sysc.h"
> +
> +/* Register definitions */
> +#define SYS_LSI_DEVID  0x304
> +#define SYS_LSI_MODE   0x300
> +#define SYS_LSI_PRR    0x308
> +#define SYS_LSI_DEVID_REV      GENMASK(31, 28)
> +#define SYS_LSI_DEVID_SPECIFIC GENMASK(27, 0)
> +#define SYS_LSI_PRR_CA55_DIS   BIT(8)
> +#define SYS_LSI_PRR_NPU_DIS    BIT(1)
> +/*
> + * BOOTPLLCA[1:0]
> + *     [0,0] =3D> 1.1GHZ
> + *     [0,1] =3D> 1.5GHZ
> + *     [1,0] =3D> 1.6GHZ
> + *     [1,1] =3D> 1.7GHZ
> + */
> +#define SYS_LSI_MODE_STAT_BOOTPLLCA55  GENMASK(12, 11)
> +#define SYS_LSI_MODE_CA55_1_7GHz       0x3

Please align the second column, and please group register offsets
and bits together.

> +
> +static void rzg3e_extended_device_identification(struct device *dev,
> +                               void __iomem *sysc_base,
> +                               struct soc_device_attribute *soc_dev_attr=
)
> +{
> +       u32 prr_val, mode_val;
> +       bool is_quad_core, npu_enabled;
> +
> +       prr_val =3D readl(sysc_base + SYS_LSI_PRR);
> +       mode_val =3D readl(sysc_base + SYS_LSI_MODE);
> +
> +       /* Check CPU and NPU configuration */
> +       is_quad_core =3D !(prr_val & SYS_LSI_PRR_CA55_DIS);
> +       npu_enabled =3D !(prr_val & SYS_LSI_PRR_NPU_DIS);
> +
> +       dev_info(dev, "Detected Renesas %s Core %s %s Rev %s  %s\n",

There are two spaces before the last %s.
Please drop both spaces...

> +                is_quad_core ? "Quad" : "Dual",
> +                soc_dev_attr->family,
> +                soc_dev_attr->soc_id,
> +                soc_dev_attr->revision,
> +                npu_enabled ? "with Ethos-U55" : "");

... and add one space here, just before "with".

> +
> +       /* Check CA55 PLL configuration */
> +       if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) !=3D SYS_L=
SI_MODE_CA55_1_7GHz)
> +               dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");

Just wondering: is that a problem? Can't it be handled in the clock
driver?

> +}

> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -231,7 +231,7 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, con=
st struct of_device_id *mat
>
>         soc_id_start =3D strchr(match->compatible, ',') + 1;
>         soc_id_end =3D strchr(match->compatible, '-');
> -       size =3D soc_id_end - soc_id_start;
> +       size =3D soc_id_end - soc_id_start + 1;

Unrelated fix?

>         if (size > 32)
>                 size =3D 32;
>         strscpy(soc_id, soc_id_start, size);

> @@ -315,20 +326,25 @@ static int rz_sysc_probe(struct platform_device *pd=
ev)
>                 return ret;
>
>         data =3D match->data;
> -       if (!data->max_register_offset)
> -               return -EINVAL;
> +       if (data->signals_init_data) {

if (!data->signals_init_data)
        return 0;

> +               if (!data->max_register_offset)
> +                       return -EINVAL;
>
> -       ret =3D rz_sysc_signals_init(sysc, data->signals_init_data, data-=
>num_signals);
> -       if (ret)
> -               return ret;
> +               ret =3D rz_sysc_signals_init(sysc, data->signals_init_dat=
a, data->num_signals);
> +               if (ret)
> +                       return ret;
> +
> +               rz_sysc_regmap.max_register =3D data->max_register_offset=
;
> +               dev_set_drvdata(dev, sysc);
>
> -       dev_set_drvdata(dev, sysc);
> -       rz_sysc_regmap.max_register =3D data->max_register_offset;
> -       regmap =3D devm_regmap_init(dev, NULL, sysc, &rz_sysc_regmap);
> -       if (IS_ERR(regmap))
> -               return PTR_ERR(regmap);
> +               regmap =3D devm_regmap_init(dev, NULL, sysc, &rz_sysc_reg=
map);
> +               if (IS_ERR(regmap))
> +                       return PTR_ERR(regmap);
>
> -       return of_syscon_register_regmap(dev->of_node, regmap);
> +               return of_syscon_register_regmap(dev->of_node, regmap);
> +       }
> +
> +       return 0;
>  }
>
>  static struct platform_driver rz_sysc_driver =3D {

> --- a/drivers/soc/renesas/rz-sysc.h
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -42,6 +44,7 @@ struct rz_sysc_signal {
>   * @offset: SYSC SoC ID register offset
>   * @revision_mask: SYSC SoC ID revision mask
>   * @specific_id_mask: SYSC SoC ID specific ID mask
> + * @extended_device_identification: SoC-specific extended device identif=
ication
>   */
>  struct rz_sysc_soc_id_init_data {
>         const char * const family;
> @@ -49,6 +52,9 @@ struct rz_sysc_soc_id_init_data {
>         u32 offset;
>         u32 revision_mask;
>         u32 specific_id_mask;
> +       void (*extended_device_identification)(struct device *dev,
> +               void __iomem *sysc_base,
> +               struct soc_device_attribute *soc_dev_attr);

That's a rather long name...

>  };
>
>  /**

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-12475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E583CA1B7CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32F8B166405
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE8278F4E;
	Fri, 24 Jan 2025 14:21:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0BC86335;
	Fri, 24 Jan 2025 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728491; cv=none; b=bMJrt5uU5U8lLzwH0hq+HmUko6ETWEIVHfN0GDFtyxVHdM7R/p9xYc5rcx9mT6Sycq7M1FvJQlMw1FnCNuk22/9Wf537GC3zXTN51O71qG4z4E9Jf1WIAKCFGuE4A26uGr74aX5owRdfNFVv2OqQbySB8RKYAQTkfBa6Gycp25o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728491; c=relaxed/simple;
	bh=dQu+57gZMYhOQpDnXxQA4LWrrIQNvTctIcBAWInEARY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UucuPSHO51cXWLxql6J+w/gdB4rETWJXOBaRRqd/yXngIvx1hPLiVpI9Ex+yybiEH8+i1wRneYTHNv405F5/P1s1JNSHduIPZJUNjTKjRR4bX8rviX7bIMBuohOekFRFilvKz74jY64LcrJeq+fr5OmmJ1tXwb5UgwX0vreyI0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85c5a91374cso1030735241.3;
        Fri, 24 Jan 2025 06:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728488; x=1738333288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVm/ks76bcp6htWRNX9lZe6vf6EZhQlXorHtSe4Lh4A=;
        b=RYvLY9XKdP1z3d8cFBc3fL++/qzelk3d9TVCOESg0T3mbSz7VLF5W4Pg+zVmp3qKu5
         zUrLI+eNRXJmz5pTipeBhuPrpGmxLCyKiDQpS82JoguBepuTQ2hvcOcxHPVmHN/U2fNj
         Jt/5xpVgWo86ISWjx+YJbP2sGV4B+qp1xZSP6s//tlyx+gOkY04qwNptCFEwha602Rv0
         pOaaRODBMuhM8K9Nm5jAGM+VKhXtHceYgz8uub7Fmfb2AIhiFdBJUNxJmX1nFyj/ot7I
         /qiI3hDe/CEbXTJ+mKWXKJYRDcpmZmIQVMmiPe7AAKTuCMdYkriko3ofy47xRTDHV5Pz
         XafA==
X-Forwarded-Encrypted: i=1; AJvYcCVeQcs2ooF49lBlnrpoySv9bwwfwd13ouWMpNAD85w+c72w5AqGP2enit7RzrjydxNuJ2ArV2Raq8+BCC4h741hQhI=@vger.kernel.org, AJvYcCW5ipJQIkCMHatWIuPSD9hzhYu2hwHgd2pisfhKkvtxmhkTBEF2CDEJHQfUZQVTIW/mArthTi6PEB3riAyh@vger.kernel.org, AJvYcCWko+obicS184/tvGhh730XIUHbMPbjKfHs54plI/403J+GDnaS+L70zq3ojYA8etX9cHS2+lW9taVT@vger.kernel.org
X-Gm-Message-State: AOJu0YwCjZksgbZsEhBkfMroC20juG+HJpc+bT9IQbHdPS+Z8BIeadbF
	TuZG6q4G29rIyj50PyS9M3WwJ5I82ly4mJNfD834ARApDZF/FhsPqTva86DD
X-Gm-Gg: ASbGncts+XB0a5qWIQk+fZu3xOg8pXlKIx+EHEaU8o5GQ3yyNyv4iz9Kh7njQco1nnu
	JXODsBDxkVn2XLptwZ7f+vt6R8TCkic9sFIzflLjktVOFLdLawJ6KumIrBTSIgD5H1v+MQz1jAz
	tz96MVg9Dl4OyLFf/O8UyqKpKD42hWdqlzTxUemObhZ3XLKUyTqb/0FPZxSbEnh1cowi+dTXNlI
	zut+Ao09xVlXRS0HGD1Xo/fTW+oWJAM2OE7g0n6MFtbmekg3UwYHZiz9DGuH9DuDJqgZE4HQTvk
	MZnYRrnZBp3IaobL4eGScplpw8OMOcUNB3SG8qJ8ybCkUkTwYgpB2A==
X-Google-Smtp-Source: AGHT+IGQNABniVPSo0KYzY/w5k/cJTBZHBVEH+7d5DrQ8MnTrbNEWCzLiUxGQMzDdJuveTa2s4bgCQ==
X-Received: by 2002:a05:6122:1998:b0:518:9582:dba2 with SMTP id 71dfb90a1353d-51d5b3b51demr23326061e0c.10.1737728487948;
        Fri, 24 Jan 2025 06:21:27 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebee448sm379297e0c.46.2025.01.24.06.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:21:27 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4affbc4dc74so1273309137.0;
        Fri, 24 Jan 2025 06:21:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUesaRvupNLsQBDp8WYznkQhuV+68zLXH35haPe3vV4lR4hZxXiGyrwYPRp9QZ6FpUI+GF8GNekqqKZ@vger.kernel.org, AJvYcCVCXapeR1bTz5BlDPyn8A15/urADZ29KDjmLs4eVRGN5Fa5CCrGDheDjlK0gP8GaWG6LI98Ln8lj/qcueBK@vger.kernel.org, AJvYcCWghyPS5FSGNBS+OFSGd1K8nQIy26F1n9nQmGH+/ynaYsC2ijgWvRTvjujE74tWCSbKHW2qT0MBaajS7+1Rp5nlD0M=@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:4b2:4877:2de4 with SMTP id
 ada2fe7eead31-4b690c475b4mr26569479137.15.1737728487080; Fri, 24 Jan 2025
 06:21:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-6-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-6-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:21:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2tGHaxzyLU3CLHA61W2mg-L85Gx24TBRMZdUDLNpc-g@mail.gmail.com>
X-Gm-Features: AWEUYZnTgoNc2W_iArRgOIGgqkX6T6xASX1g1FaEGHijaeidQ8XlsC9WOflJKuQ
Message-ID: <CAMuHMdW2tGHaxzyLU3CLHA61W2mg-L85Gx24TBRMZdUDLNpc-g@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] soc: renesas: rz-sysc: Move RZ/V2H SoC detection
 to the SYS driver
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	claudiu.beznea.uj@bp.renesas.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Thu, Jan 23, 2025 at 6:05=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> As per the other SoC variant of the same family, the system controller
> provides SoC ID in its own registers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -355,6 +355,7 @@ config ARCH_R9A09G047
>  config ARCH_R9A09G057
>         bool "ARM64 Platform support for RZ/V2H(P)"
>         select RENESAS_RZV2H_ICU
> +       select SYS_R9A09G057
>         help
>           This enables support for the Renesas RZ/V2H(P) SoC variants.
>
> @@ -395,4 +396,8 @@ config SYSC_R9A08G045
>  config SYS_R9A09G047
>         bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
>         select SYSC_RZ
> +
> +config SYS_R9A09G057
> +       bool "Renesas RZ/V2H System controller support" if COMPILE_TEST
> +       select SYSC_RZ

Please add a blank line here.

>  endif # SOC_RENESAS

> --- a/drivers/soc/renesas/r9a09g047-sys.c
> +++ b/drivers/soc/renesas/r9a09g047-sys.c
> @@ -11,25 +11,11 @@
>  #include <linux/io.h>
>
>  #include "rz-sysc.h"
> +#include "rzg3e-sys.h"
>
> -/* Register Offsets */
> -#define SYS_LSI_MODE           0x300
> -/*
> - * BOOTPLLCA[1:0]
> - *         [0,0] =3D> 1.1GHZ
> - *         [0,1] =3D> 1.5GHZ
> - *         [1,0] =3D> 1.6GHZ
> - *         [1,1] =3D> 1.7GHZ
> - */
> -#define SYS_LSI_MODE_STAT_BOOTPLLCA55  GENMASK(12, 11)
> -#define SYS_LSI_MODE_CA55_1_7GHZ       0x3
> -#define SYS_LSI_DEVID          0x304
> -#define SYS_LSI_DEVID_REV      GENMASK(31, 28)
> -#define SYS_LSI_DEVID_SPECIFIC GENMASK(27, 0)
> -#define SYS_LSI_PRR                    0x308
> -#define SYS_LSI_PRR_CA55_DIS           BIT(8)
> -#define SYS_LSI_PRR_NPU_DIS            BIT(1)
> -
> +/* RZ/G3E-specific feature bits */
> +#define SYS_LSI_PRR_CA55_DIS    BIT(8)
> +#define SYS_LSI_PRR_NPU_DIS     BIT(1)
>
>  static void rzg3e_sys_print_id(struct device *dev,
>                                 void __iomem *sysc_base,
> diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9=
a09g057-sys.c
> new file mode 100644
> index 000000000000..dc7885b340c4
> --- /dev/null
> +++ b/drivers/soc/renesas/r9a09g057-sys.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/V2H System controller (SYS) driver
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +
> +#include "rz-sysc.h"
> +#include "rzg3e-sys.h"

Using definitions for RZ/G3E for RZ/V2H feels wrong to me, as they
are really SoC-specific.
So I think you better keep them in drivers/soc/renesas/r9a09g047-sys.c
and drivers/soc/renesas/r9a09g057-sys.c, even if that means duplication.
RZ/G3S also has them in drivers/soc/renesas/r9a08g045-sys.c

> +
> +static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data =
__initconst =3D {
> +       .family =3D "RZ/V2H",
> +       .id =3D 0x847a447,
> +       .offset =3D SYS_LSI_DEVID,
> +       .revision_mask =3D SYS_LSI_DEVID_REV,
> +       .specific_id_mask =3D SYS_LSI_DEVID_SPECIFIC,

I wouldn't mind just putting the hex constants here, and getting rid
of the SYS_LSI_DEVID* definitions, as the definitions are only used
for populating these structures.

> +};
> +
> +const struct rz_sysc_init_data rzv2h_sys_init_data =3D {
> +       .soc_id_init_data =3D &rzv2h_sys_soc_id_init_data,
> +};

> --- /dev/null
> +++ b/drivers/soc/renesas/rzg3e-sys.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/G3E (SYS) System Controller
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +#ifndef __RZG3E_SYS_H__
> +#define __RZG3E_SYS_H__
> +
> +/* SYS Common Register Offsets */
> +
> +#define SYS_LSI_MODE   0x300
> +/*
> + * BOOTPLLCA[1:0]
> + *         [0,0] =3D> 1.1GHZ
> + *         [0,1] =3D> 1.5GHZ
> + *         [1,0] =3D> 1.6GHZ
> + *         [1,1] =3D> 1.7GHZ
> + */
> +#define SYS_LSI_MODE_STAT_BOOTPLLCA55  GENMASK(12, 11)
> +#define SYS_LSI_MODE_CA55_1_7GHZ       0x3
> +#define SYS_LSI_DEVID  0x304
> +#define SYS_LSI_DEVID_REV      GENMASK(31, 28)
> +#define SYS_LSI_DEVID_SPECIFIC GENMASK(27, 0)
> +#define SYS_LSI_PRR    0x308
> +
> +#endif /* __RZG3E_SYSC_H__ */

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


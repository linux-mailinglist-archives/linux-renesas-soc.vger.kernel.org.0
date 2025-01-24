Return-Path: <linux-renesas-soc+bounces-12471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F025BA1B7B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 15:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DF6416B804
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 14:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A104317E;
	Fri, 24 Jan 2025 14:17:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D482101C8;
	Fri, 24 Jan 2025 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737728244; cv=none; b=dsVjG3CdjONBcWtCU/zHOTfF2z4SAefI4mt8mNfP18RJvpf9lGHg1EVVD5bRJJMIPvgtDMKuxs97XrY+WbZKoTB4cjSj5kMFM/I/5526mOHlgk5ee3nrrvtSylf1WhACeOsVSE7tHw9lE7RRu82LBMEh0mzVxmeEgZtx7GpEsvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737728244; c=relaxed/simple;
	bh=oBmASYAsMk8Pi7Zag7Zd+YSDC4OhRrQGz83bKydv2yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsPb3GJsP+PYsdf8utUmFDgIv7BP8vVwG1cGl97ykFeYm6BrPDyq/ClV/ArmJWW4ykqzBJtGqcVsBlhf537PSBOodu/VvUqMmtEFDXlegS8BbQ/+wVDOfpQAHErNrh8aMKb507dl59FcibkqIecCniIWhnTdQFTIfD2mzS5DJQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so587955241.1;
        Fri, 24 Jan 2025 06:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737728241; x=1738333041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ft11Byvggp+sr7zWhGPa3NPNd/YAHL33TW3Ux8PZbJ4=;
        b=gbV1TGZ0gcf31yeX4tTCXJVaOIgnvt3A8bIlpIV+Xxl60QQEDACZ01uaPB9K1+itOj
         a4wyRZa5XhpHNMHxOudrD/9jEyrSlRgKb+aOMkbcYd8SnW4bNRD4OPfH5X0krQHaHTdt
         c8L7bPHbLn9mZNX+l/3lxNaDiG7AMdfmaeKI5OaaOLhN+4ONZ83b1g9QkR60Iq9SvONM
         KNoJ8tvxuIKVuQVJ7Vx5js/Uj33VfkXJPqLT1wYClZXQubxAFoLmRCGeDNyFntfxLRUV
         D2a13mkqMCuNMGtvVnB8aYAak0e4juxiOhNUxho/cIVhg3O5rnYHf0pmUJA9M8Zhfi8d
         wJxw==
X-Forwarded-Encrypted: i=1; AJvYcCUQag1Phty1GuYkb4hR4lN+0Eq0kkq0XkgWVFiEy3FM1hE+xxpOfsPIZgosahiApc7DJ75JNr3GHBt9cQWs@vger.kernel.org, AJvYcCUhwgHZwpSMgOAKxunItuOJYhPcmCT/kJdsza49Lk8IAY+/F08K0jmqvYvjtyHD/V3Baf73CHaHgfuY@vger.kernel.org, AJvYcCVBBzTzxGHGrL9spg3ACZDYUOf95Qo0HMvWpzlpdYJOrqKy6qvfFTna8jC8sBSN3cn6uwgBLi5TRsD+6WbKLNK/GeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8ymb4HPkOw/xuDpMDyuarztwyNrFowoSVUZ5yUEfzsXtjzEE
	qlW4WYsGFDCBss82jRdNDtm5Fa1iqyvAEiXpr8Ch4a4oo9PVE6R6LKw/K/y2
X-Gm-Gg: ASbGncuynVV/HjG2AXEhZ6b9co9zV9gJ04Xh33kHQfP7hV6MdjGR8CXmVbP/cSw+SoR
	2JVHWtVwjEfhSq2FksHBnU0a9+vsq1lmOUF6Svq6rV6twNWK3YHvpMZjTIKkwQ0XGU4Ghs927ui
	k1wAc+i8NY5XbtAYVmP/GeVlGTrMIHtmX/TUtv6sutlX4tqRoEFy2jB7UbKlNkeTGqZkXruFe/W
	kNhuwP9MK0wXGZn8AfORQPnr96Ks5mrEk2mxSZYYEvETa4yRJDmSLQ3Fkwbxyan3dqA6LjawN5r
	MYd00Ayb7//J2+Mp+/h3grmhbvcEfPZ72sf2Vb3g9bhbBP5aVZFF3Q==
X-Google-Smtp-Source: AGHT+IFsWZGj68978wPVCwHIZk4UJrEJv7Sdpqd39RA0hcThvgRPzC6gmT+XLLBW6bfGUzTshEl1nw==
X-Received: by 2002:a05:6122:438d:b0:518:9dca:f0fb with SMTP id 71dfb90a1353d-51d5b3b3da4mr24845948e0c.11.1737728240865;
        Fri, 24 Jan 2025 06:17:20 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ea34e03sm384448e0c.7.2025.01.24.06.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 06:17:20 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4aff620b232so659004137.0;
        Fri, 24 Jan 2025 06:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUY2/+Df6lQEU62aDjyn6Z7YSwV2y7M69ewHqj07nTfTQtZNJEWo5jrspRCoTTCz/7+KeuOLcR3ebQX@vger.kernel.org, AJvYcCUvftcvJ73SGWjSPRt0/beO0P+wA2JHZX8zKKfz1A+KiGPBgNEEgj/LWIlgpiyVV0BtUoiQ8B/cirdYlmHxPfJ5j3o=@vger.kernel.org, AJvYcCXyLvOhjYjO62bZEUIYxKx6Qp2lOfmqw07Li9iFpdfz97DVtuUJHHKYERIWpvVWuE5eQhjmJ2whEOIXC2Iq@vger.kernel.org
X-Received: by 2002:a05:6102:50a5:b0:4af:e99e:b41b with SMTP id
 ada2fe7eead31-4b690c8894fmr27913583137.19.1737728240360; Fri, 24 Jan 2025
 06:17:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com> <20250123170508.13578-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250123170508.13578-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 15:17:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwSw8Psuqw6enXHjNoeoTq=D0B9ZaKh_X9bHsiOA0z_Q@mail.gmail.com>
X-Gm-Features: AWEUYZnSt-iMxA1Q0xsLxdVVHH8U1wcG2gGGwdSILaZnts8xDpR6T1sCDVMJx4A
Message-ID: <CAMuHMdVwSw8Psuqw6enXHjNoeoTq=D0B9ZaKh_X9bHsiOA0z_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] soc: renesas: Add SYSC driver for Renesas RZ family
To: John Madieu <john.madieu.xa@bp.renesas.com>, claudiu.beznea.uj@bp.renesas.com
Cc: krzk+dt@kernel.org, robh@kernel.org, biju.das.jz@bp.renesas.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, john.madieu@gmail.com, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	magnus.damm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John, Claudiu,

On Thu, Jan 23, 2025 at 6:05=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/G3S system controller (SYSC) has various registers that control
> different functionalities. One of the exposed register offsers informatio=
n
> about the SoC identification.
>
> Add a driver that identifies the SoC. Later the driver will be extended
> with other functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> v4: No changes
> v3: New patch

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/soc/renesas/rz-sysc.c

> +static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device=
_id *match)
> +{
> +       const struct rz_sysc_init_data *sysc_data =3D match->data;
> +       const struct rz_sysc_soc_id_init_data *soc_data =3D sysc_data->so=
c_id_init_data;
> +       struct soc_device_attribute *soc_dev_attr;
> +       const char *soc_id_start, *soc_id_end;
> +       u32 val, revision, specific_id;
> +       struct soc_device *soc_dev;
> +       char soc_id[32] =3D {0};
> +       size_t size;
> +
> +       soc_id_start =3D strchr(match->compatible, ',') + 1;
> +       soc_id_end =3D strchr(match->compatible, '-');
> +       size =3D soc_id_end - soc_id_start + 1;
> +       if (size > 32)
> +               size =3D sizeof(soc_id);
> +       strscpy(soc_id, soc_id_start, size);
> +
> +       soc_dev_attr =3D devm_kzalloc(sysc->dev, sizeof(*soc_dev_attr), G=
FP_KERNEL);
> +       if (!soc_dev_attr)
> +               return -ENOMEM;
> +
> +       soc_dev_attr->family =3D devm_kstrdup(sysc->dev, soc_data->family=
, GFP_KERNEL);

Missing NULL-check

> +       soc_dev_attr->soc_id =3D devm_kstrdup(sysc->dev, soc_id, GFP_KERN=
EL);
> +       if (!soc_dev_attr->soc_id)
> +               return -ENOMEM;
> +
> +       val =3D readl(sysc->base + soc_data->offset);
> +       revision =3D field_get(soc_data->revision_mask, val);
> +       specific_id =3D field_get(soc_data->specific_id_mask, val);
> +       soc_dev_attr->revision =3D devm_kasprintf(sysc->dev, GFP_KERNEL, =
"%u", revision);
> +       if (!soc_dev_attr->revision)
> +               return -ENOMEM;
> +
> +       if (soc_data->id && specific_id !=3D soc_data->id) {
> +               dev_warn(sysc->dev, "SoC mismatch (product =3D 0x%x)\n", =
specific_id);
> +               return -ENODEV;
> +       }
> +
> +       dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_at=
tr->family,
> +                soc_dev_attr->soc_id, soc_dev_attr->revision);
> +
> +       soc_dev =3D soc_device_register(soc_dev_attr);
> +       if (IS_ERR(soc_dev))
> +               return PTR_ERR(soc_dev);
> +
> +       return 0;
> +}

> --- /dev/null
> +++ b/drivers/soc/renesas/rz-sysc.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ System Controller
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#ifndef __SOC_RENESAS_RZ_SYSC_H__
> +#define __SOC_RENESAS_RZ_SYSC_H__
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct rz_syc_soc_id_init_data - RZ SYSC SoC identification initializ=
ation data
> + * @family: RZ SoC family
> + * @id: RZ SoC expected ID
> + * @offset: SYSC SoC ID register offset
> + * @revision_mask: SYSC SoC ID revision mask
> + * @specific_id_mask: SYSC SoC ID specific ID mask
> + */
> +struct rz_sysc_soc_id_init_data {
> +       const char * const family;
> +       u32 id;
> +       u32 offset;

.devid_offset?

> +       u32 revision_mask;
> +       u32 specific_id_mask;
> +};

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


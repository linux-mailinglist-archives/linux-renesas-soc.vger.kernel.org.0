Return-Path: <linux-renesas-soc+bounces-11157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44A9EB420
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CB98280A53
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 14:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BE91B21A0;
	Tue, 10 Dec 2024 14:59:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D461A01D4;
	Tue, 10 Dec 2024 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842773; cv=none; b=E0zoWr25b4dDUGDltrjUcHDENq12H9A6kTKvwVeWQ8U+HUHYGcs5nQlHOwhKf6pABrDsm7ahV9pLddHsuKogP+k6DK457DB6Jzcd65ABMdk9b9BMOCe+UuN0AtzsFHEXT/NSEOTM1oBynXFxTDBvYd0esuxRZxfIEgeaf3vma9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842773; c=relaxed/simple;
	bh=PDyq3QjbNON06ueCsZwu/mHOjWAeMcOexMiBb+pVMeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+JQLCQvZcPgvJf0OKBBCxPvO2lLIY6TGLotLknwpjEhL9IbEhTeLm24RPBI1YLm8RZGY/CjzzrRGBuTCaTjf8pO55e00O6O5If7Ax+k9aEouLh9FgxEL4Q2kcVlocRD18j41m4KUvqfK9POELvr30BSV+I1pzVGYa3Ojhlh78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5160f1870f3so991435e0c.0;
        Tue, 10 Dec 2024 06:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733842770; x=1734447570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faO2LEB4d7HNsohjeHqWigf+jmzDcTwyV5VFG0HOFDw=;
        b=T2cn/1R859Edr7GodRc6m+AN8knzGxWrFGAgTKA/KwrIMdGS3gm3o93Om6/j5vc2yA
         61enQwOFrM+iSQTpv4DRECqs2P3Lj1CprDPd0jTkPl74b8JjQ3tTnqv4Q9Datrpybqj7
         BxCFe3x4X6McRO/tLGTxnxlU5lbegfnpGuzNhgha+Ed1yPuYQ3mHms+WNgkv5MshpRhl
         P/lEwJTzzVZC2t+wgSDw4YiWg08dmg2S915ZDYo5a8zWEJwDx5lUg3eS4VksueaRFx7K
         oPFFS+UmrTEuWkh+a1gWGIKihv9C8P0qGqCTSZE2XjUySGPzxLI72lVYa92SqEbkHJkI
         bp7A==
X-Forwarded-Encrypted: i=1; AJvYcCUO8SsdB7mZDv+Ks7EbX3VWlCi807ExHi2/wf/cxVyLNn9TMcl1+ic0IbFa6iBY4k13wjpjSWRiZfxa@vger.kernel.org, AJvYcCVcjglOqciMdVFW05hVtAk3aJIXTjY/1qgJdXiDB9XO2MTFm1MxSQ4ZfnCMe2ou0woUhGsb8c0tZOhm@vger.kernel.org, AJvYcCWiS088ktIuMBW/aRl2xluGGoHkXkwCKk35Jnh+aagGjUYpvHaL0eKw8Ctz9q+yF/Nt8twqlG3Cnx+SPRql@vger.kernel.org, AJvYcCXd+3mc8m3mSyOXWgj2GV/voCVZVCGYJvyC3YOJs0mOwQYw7Y7I3Roz9Xo6m9kFk+JLATgn4DWybio4sxM4JtjULbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzihLH3tIHa0Hr99p+XJ7qZ+lyFfDRlrxwd7SdbYJ27L16KU2HZ
	qa+57zTj/jI0gStFACpgCaaRkd6AcNQeVL7tqI6xJMZP99eRQ7oxhXnjkj/n
X-Gm-Gg: ASbGncvLfkqRqdEQQu9oC6b1KwU1NUMLQSGTABlBqs7O7V0cYV1rwTg/BCjOOShBBva
	NPRKETu8nWZLMSJnDlFo8DJmTfeWfWjvtVoQtV0l60FL77RYj7QhaLlNKQkvh70JLdVK452uGpA
	CC3cQNgFbvWASOLss9CoFBXWORXxzEi+/M3eEvMmGsoQ7+FZNlKYDHRS8rSv2MaPZsQGdZLgWmX
	OsYGf2w0f/CLMihmO0FnbqH5ZZvL6IJrmp8vkgz0UnBkUGAWBbu9REssyW9Hp4nDF35covaGeGl
	l3Cm6jIVIyA5qxMI
X-Google-Smtp-Source: AGHT+IGF6+9Rultkt9bJpuCmFNR+IDisMr0Y0T6WYAtk9yZ2jbYpsIOQxbZmHIT4zitgqxDvHVoLfw==
X-Received: by 2002:a05:6122:d24:b0:515:e446:b9f2 with SMTP id 71dfb90a1353d-518885725f3mr4839610e0c.12.1733842770062;
        Tue, 10 Dec 2024 06:59:30 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eae68d96sm978323e0c.28.2024.12.10.06.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 06:59:29 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afecb2731dso812273137.3;
        Tue, 10 Dec 2024 06:59:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5/GN0FRmHq7W3m9NukQB4KCbEZeEiyEVaNvvejFHwoucw6ZmrA0+JPiqqCT0bdmaNqaPuE2kjP0Hq@vger.kernel.org, AJvYcCVfvQawlNSrI/adGudzWfLEfXBOlPEJ+C2Pad/dEfVWpFUT0KTb8TVjHwCad4ZwLtvialohRhMzfHd1@vger.kernel.org, AJvYcCX8OKBSo/8XxtG54m74fGth0m8PScb9b/YpxiVybQYhXTKPkbLXaGIcWzNMncfTgczM1FQjlT3qr2d+L6KGcjQ5ESc=@vger.kernel.org, AJvYcCXMFDHyp7Hort+c7sqnB5yx74HGLXkTgWQPQUZvwmne84Ul2YTaPll0GqNVNjkFc78s2wraFNBFmW+GFg6L@vger.kernel.org
X-Received: by 2002:a05:6102:54a3:b0:4af:bda1:8109 with SMTP id
 ada2fe7eead31-4b116250734mr4852879137.21.1733842769143; Tue, 10 Dec 2024
 06:59:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 15:59:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhGvXhjTV+NYzw2WoDuH6BxQWFdUZC_qkon5vSYsjAhg@mail.gmail.com>
Message-ID: <CAMuHMdWhGvXhjTV+NYzw2WoDuH6BxQWFdUZC_qkon5vSYsjAhg@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] soc: renesas: rz-sysc: Add SoC detection support
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com, 
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ SYSC controller has registers that keep the SoC ID data. Add
> driver support to retrieve the SoC ID and register a SoC driver.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - this was patch 05/16 in v1
> - changed patch title and description
> - added SoC initialization code in its own function
> - addressed the review comments
> - introduced struct rz_sysc_soc_id_init_data and adjusted the code
>   accordingly
> - dropped the RZ/G3S SoC detection code (it will be introduced in
>   a separate patch)

Thanks for your patch!

> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -211,6 +214,59 @@ static int rz_sysc_signals_init(struct rz_sysc *sysc=
,
>         return 0;
>  }
>
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
> +       u8 size;

unsigned int (or size_t?)

> +
> +       if (!soc_data || !soc_data->family || !soc_data->offset ||
> +           !soc_data->revision_mask)
> +               return -EINVAL;

Cannot happen?

> +
> +       soc_id_start =3D strchr(match->compatible, ',') + 1;
> +       soc_id_end =3D strchr(match->compatible, '-');
> +       size =3D soc_id_end - soc_id_start;
> +       if (size > 32)
> +               size =3D 32;

sizeof(soc_id) instead of hardcoded 32

> +       strscpy(soc_id, soc_id_start, size);

Doesn't this wipe the last character, as strscpy() always
NUL-terminates the destination buffer?

> +
> +       soc_dev_attr =3D devm_kzalloc(sysc->dev, sizeof(*soc_dev_attr), G=
FP_KERNEL);
> +       if (!soc_dev_attr)
> +               return -ENOMEM;
> +
> +       soc_dev_attr->family =3D soc_data->family;

Shouldn't you duplicate family? It's in __initconst, hence freed later.

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
> +
>  static struct regmap_config rz_sysc_regmap =3D {
>         .name =3D "rz_sysc_regs",
>         .reg_bits =3D 32,
> @@ -235,14 +291,15 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);
>  static int rz_sysc_probe(struct platform_device *pdev)
>  {
>         const struct rz_sysc_init_data *data;
> +       const struct of_device_id *match;
>         struct device *dev =3D &pdev->dev;
> -       struct rz_sysc *sysc;
>         struct regmap *regmap;
> +       struct rz_sysc *sysc;
>         int ret;
>
> -       data =3D device_get_match_data(dev);
> -       if (!data || !data->max_register_offset)
> -               return -EINVAL;
> +       match =3D of_match_node(rz_sysc_match, dev->of_node);
> +       if (!match || !match->data)

!match->data cannot happen

> +               return -ENODEV;
>
>         sysc =3D devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
>         if (!sysc)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


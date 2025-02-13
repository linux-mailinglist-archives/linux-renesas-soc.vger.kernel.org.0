Return-Path: <linux-renesas-soc+bounces-13108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37900A33B54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 10:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7A717A3B5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Feb 2025 09:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E433820D4FC;
	Thu, 13 Feb 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gfk40apN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D120D4EF;
	Thu, 13 Feb 2025 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739439488; cv=none; b=sKDJJwwoKz9BHzuLULpjSCwuV3GHIDIjzSyuJbWk9hCdhd8cjlGNa7EbuaqT+zaVk4Xgal1CU8NST2ExZmSKoYvNsdxGLJQ7jmLYy8OLpflzQzooSlHaFIBzEYqkZFFvKNyovoKfQfstVFTsCCla8zY0fmxTcQuavXSHygKDtqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739439488; c=relaxed/simple;
	bh=OJMyPvJ9Xja01/DX2ZKSXrF1TaukTR4zVn8V8THvDeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BAXF46fsHoW7j3iab0+PuppdroFNzyH/hBtFXUkOaR6xGNtKLgtkG7nB0u8dSg1jFImtlXi0PC3N3MPHoCR9xGp/VF50tfeFl1y4bO/GKLINgG6s+3IKxula7sHoN69/gJJzu+eDLGxEqm6SbcDVkTnbpdALsI7N6tobNu8W2OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gfk40apN; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51faf3342b3so189085e0c.2;
        Thu, 13 Feb 2025 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439485; x=1740044285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Do0/WPilau4ooK+L0ONiTGLsYWj0jYE1EjbzMsQjJp0=;
        b=Gfk40apNiC9pXoLz11Nbiy+Qm83hJM2UdOBW2DllvOn/KFwIDv4pWPxskpy8vFqjxz
         JjLYfY0pZTeduvKLvujF2ShrEvd+G8e68Npn9500FiVeui8e1sGSB20pyYHnqKz7Lk0q
         EYpPii/yol3VZlF94epZ4/SxIeG8W5SVSiSmAPcPlouAeNN1WjPtn01i0Y/gOeQXgGsm
         bUK64MeoZDcewqfvzAy6sjd9EPNd4CmDvTp3msS9mICV/bsmka6rOfZTxkaoP2Uj2Jig
         YLvuj1ypTnDjTaDdLHJLiFPwFWSq+nWUL97PiO7omT5VfemgBmHY4mUYNyDHVvVhyxCu
         Dlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439485; x=1740044285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Do0/WPilau4ooK+L0ONiTGLsYWj0jYE1EjbzMsQjJp0=;
        b=ddST9RRcCw9WTHfydfr6Snjt5tqyZNeC53iCj5n0VpAqRPdFHAXhutx2i9x8q8viU2
         JojxBCeIjWKi8P72AvubIVyMYTZb+JyOfh2K37lunfP1xXPMyIVC0KRPvpeqidMHg6sU
         aEiK+zKEFf1UeJ/ZEsmGcci6frxC2FvcC8d63p3IWVYU/xfuOqdcIN5ZL/XBG+JDKzTS
         yJIL8OdrVzNA253zBReVpyOuNQ7UdNpoIyo+nlHC96ouJ1M2LCYTd2WBi0n+zXmukSxr
         CAwpdyFQsfGWTBeWLAoVL6nLeUKG7rfSJkb7GLZ3ST9dUyvlZeHX5X74XX6/peoKptbx
         4+cg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Hzl1e4+EYJLPMLZg4FyuObNw3EyNeKAIeK7AmaSbFB/p6L9nl+oXBR0g38BY49jYPGD48mO871ASPBkcwwoPFRg=@vger.kernel.org, AJvYcCX5WGbqA2W43tQQgR50yyAr1gHX8VcWTqZO1Xp2GkQfpkqd3CtpS9rP6/nWSzjNTdu40odRkUimVayK/UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhOUmPGc0AMGnlKBlBVMNzLZqvpjN9FxbKgKXtHaJp7yUNSkYv
	jhjm/G0mzknTg4MUcm/7GnJn8zz2B4Q/t5PSZUzvaeSeWv1BLL1l/p+JyQLIFol2ec4g7bVKpG4
	HpDmoV2RMBrWiwyILmXy4NrqG9qk=
X-Gm-Gg: ASbGncsVXc4hgoBgV9LRpob8tsYFxOTDZ/3TeFi+N7yb2BVQg1SyOAp4RdUWpwH7jDP
	XLTAsfLcPdmxHi/I1LSH/IDK2SHus5h/rDcRrivy5Se+buBQfw4b+3PjdUPIGzEukrgdcN99vFm
	2F7+Kwji+4y8TYOvjnKcUHJMsY0uU5/w==
X-Google-Smtp-Source: AGHT+IHFRyFDSjT12HnWSaV6WILkXQSsSuLhFI4b+GzNUMD9PsTnXsgwe8zzsWccRhv4HeiIWGavFLpiIowjhUpYU+w=
X-Received: by 2002:a05:6122:65a2:b0:515:4b68:c37f with SMTP id
 71dfb90a1353d-52067cfe3b1mr6381091e0c.6.1739439484797; Thu, 13 Feb 2025
 01:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212182034.366167-1-fabrizio.castro.jz@renesas.com> <20250212182034.366167-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250212182034.366167-2-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Feb 2025 09:37:38 +0000
X-Gm-Features: AWEUYZnlz0g0E5bM5VdYEG5J3JNA_zClGwtQILbF3AJ345HcSj1jSm26h_tutGE
Message-ID: <CA+V-a8uPQxraOnVnafO-Ovk=inrzJWG+ySK5uO2uBOuXEDx+tA@mail.gmail.com>
Subject: Re: [PATCH 1/6] irqchip/renesas-rzg2l: Use local dev pointer in rzg2l_irqc_common_init()
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 6:22=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> Replace direct references to `&pdev->dev` with the local `dev` pointer
> in rzg2l_irqc_common_init() to avoid redundant dereferencing.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> Hi Geert,
>
> I have taken the liberty of adding your Suggested-by, I hope that's
> okay?
>
> I have also added a few more patches to further tidy up
> rzg2l_irqc_common_init().
>
> Thanks!
>
> Fab
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index 99e27e01b0b1..a7c3a3cc6b9f 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -542,40 +542,40 @@ static int rzg2l_irqc_common_init(struct device_nod=
e *node, struct device_node *
>
>         parent_domain =3D irq_find_host(parent);
>         if (!parent_domain) {
> -               dev_err(&pdev->dev, "cannot find parent domain\n");
> +               dev_err(dev, "cannot find parent domain\n");
>                 return -ENODEV;
>         }
>
> -       rzg2l_irqc_data =3D devm_kzalloc(&pdev->dev, sizeof(*rzg2l_irqc_d=
ata), GFP_KERNEL);
> +       rzg2l_irqc_data =3D devm_kzalloc(dev, sizeof(*rzg2l_irqc_data), G=
FP_KERNEL);
>         if (!rzg2l_irqc_data)
>                 return -ENOMEM;
>
>         rzg2l_irqc_data->irqchip =3D irq_chip;
>
> -       rzg2l_irqc_data->base =3D devm_of_iomap(&pdev->dev, pdev->dev.of_=
node, 0, NULL);
> +       rzg2l_irqc_data->base =3D devm_of_iomap(dev, dev->of_node, 0, NUL=
L);
>         if (IS_ERR(rzg2l_irqc_data->base))
>                 return PTR_ERR(rzg2l_irqc_data->base);
>
>         ret =3D rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
>         if (ret) {
> -               dev_err(&pdev->dev, "cannot parse interrupts: %d\n", ret)=
;
> +               dev_err(dev, "cannot parse interrupts: %d\n", ret);
>                 return ret;
>         }
>
> -       resetn =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +       resetn =3D devm_reset_control_get_exclusive(dev, NULL);
>         if (IS_ERR(resetn))
>                 return PTR_ERR(resetn);
>
>         ret =3D reset_control_deassert(resetn);
>         if (ret) {
> -               dev_err(&pdev->dev, "failed to deassert resetn pin, %d\n"=
, ret);
> +               dev_err(dev, "failed to deassert resetn pin, %d\n", ret);
>                 return ret;
>         }
>
> -       pm_runtime_enable(&pdev->dev);
> -       ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +       pm_runtime_enable(dev);
> +       ret =3D pm_runtime_resume_and_get(dev);
>         if (ret < 0) {
> -               dev_err(&pdev->dev, "pm_runtime_resume_and_get failed: %d=
\n", ret);
> +               dev_err(dev, "pm_runtime_resume_and_get failed: %d\n", re=
t);
>                 goto pm_disable;
>         }
>
> @@ -585,7 +585,7 @@ static int rzg2l_irqc_common_init(struct device_node =
*node, struct device_node *
>                                               node, &rzg2l_irqc_domain_op=
s,
>                                               rzg2l_irqc_data);
>         if (!irq_domain) {
> -               dev_err(&pdev->dev, "failed to add irq domain\n");
> +               dev_err(dev, "failed to add irq domain\n");
>                 ret =3D -ENOMEM;
>                 goto pm_put;
>         }
> @@ -606,9 +606,9 @@ static int rzg2l_irqc_common_init(struct device_node =
*node, struct device_node *
>         return 0;
>
>  pm_put:
> -       pm_runtime_put(&pdev->dev);
> +       pm_runtime_put(dev);
>  pm_disable:
> -       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_disable(dev);
>         reset_control_assert(resetn);
>         return ret;
>  }
> --
> 2.34.1
>
>


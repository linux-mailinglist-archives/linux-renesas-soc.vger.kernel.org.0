Return-Path: <linux-renesas-soc+bounces-11600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2509F8D87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F2251891D5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 07:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A8A1A707D;
	Fri, 20 Dec 2024 07:59:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1541C6A;
	Fri, 20 Dec 2024 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734681582; cv=none; b=GCZdtbDFoOxVJjxEqJJ6kAu/0wn9li/bm7WcBxB3Ikoj7KJ/dvyrrdFK+LkXDaaB7XZYUReyEjePwhRaHDtp1Uc/YX2auUpTfKPTfHzM3d+28G1G1kcmhh4VpmGvr2mLBpczACXdP+LL5dPtsFw587CfGhT2TbaPdi4njOD9Of0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734681582; c=relaxed/simple;
	bh=rRK8vdzk2T00oBXlTaQEzJuE8Aau5JjYRDz6BukhA2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcFN53NW7yCOZJLAAVPy6YgCkBNXg7Eaky5p2zd+i1gKkkVj6GomVIZqV9a1ODQ3eskpHjQbbI82mhg5sKN79oqyEjI3NjxP37lKHxNIrAuxxWXQfxBHDgSZiI2ML0kiO+hgXKuYZj+oJ5k3H7zYwk+18I/IgTZEifcFn78jcSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4aff620b232so478585137.0;
        Thu, 19 Dec 2024 23:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734681578; x=1735286378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQKCf5v8WyFEUzlQoQMHccUlj0SB5zKTak1Ob6poM/Q=;
        b=Jo8lsaTn5ATAPciO6L1TU0JL2aDBRnmFbmKhRhmy1qTiDWp1S5dVoNdqIiXWQDU/b/
         DnX9zZsSAGNX58bR362MvBMSkrip8XJU8R5xdHQB5CxgT9J/HF+MNq0Ont07tee3mc7i
         69qhlQEKVVIbfdG6+omfyRD/pwfL8o5acBtnLQOG6sr0RypnHfrV2F0rwAXMQofSdSpr
         GV+5lA0pn8oPz5wO76yqSXHCuTESXBwgufMpEObHtSYNt+tsTUtUC/Bl7exvP/Gq9agU
         R6ZU3uX0dARDS5J6xvHj4jWrsVCvRygnd4yr4bG7Yoli38xs9TFxO/W8Ix2HbrYh+U8z
         UgJw==
X-Forwarded-Encrypted: i=1; AJvYcCUzZSGjyzrxiO9wTPuXGMF5feIJOtVc7Ta7HIjAWkGwdp7AjffHxbf12Cv4X1RlrqliEbWbYlRa@vger.kernel.org, AJvYcCVD34dUqoCFTxm9FaZKcL5ec9D4rxhwQvyR9PtrRmuK/Lp2ZpFBY88NUei+xtLxrCFJa/CaSBacvr9yG5KlFXxsck8=@vger.kernel.org, AJvYcCX5v251OeI0tqclYKn9TTa9aOTmgVONtgFYpgC9rP1QGozWerbbhqHzliFVAosxBGvHDstLOkDrS+bqCyG/@vger.kernel.org, AJvYcCXhejHPQiz1o/1d5gSFLzOb7ojVQzLhaE5QHoaoqxEThVd5YFz7a/XaAWF9GbZBTfpwTMSzSWOcChYE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy86uii6TcdLrm1KKqhF71mmrJXFnWA+qQdwV1Dho4pvhyjbxk
	VoCgUf2m0dTOlU1Zo+kekMb0rufu8nlBhCtXjMIO18pat0iN2UUmCGatP9E0
X-Gm-Gg: ASbGncvzajO/MubdzTGRfyVkL1V5ZDGegcLaweTSGAn7T2bIlFX64QsAPp+8dZDsm1g
	Nw671QGacDVnIJt6TdqAMOYnh+lORLPjf8Y5AY4gsajsVilM4/4e24Q1/2ww3fOxEB4SvsuSIjl
	F+jcnKbnQ0aw1pazIq8mFW70vB5p7/clFsjUft2rI91s4BZxSruuyKLSAZEN7hW//+mcc998BP+
	g8KWmr4UymJQmrSqquPtQOxAw4xA+gxOEkXCfIVLdhBSGyrnc+0qeBy8sCO8ZIRxOQnOvFSg5mn
	D689BykYvxmaMum1B/8=
X-Google-Smtp-Source: AGHT+IE1v2q6S2CWTn9/LbSTK+mMiQQRRmKUWWKkkut+CmsTlUVReix1ECeW0Yzt8+a1IE3Qsric8Q==
X-Received: by 2002:a05:6102:f10:b0:4af:fa7d:71bd with SMTP id ada2fe7eead31-4b2cc31e70cmr1896581137.3.1734681577778;
        Thu, 19 Dec 2024 23:59:37 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac4bf66sm514261241.8.2024.12.19.23.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 23:59:37 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afe4f1ce18so445081137.3;
        Thu, 19 Dec 2024 23:59:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6KqFLk70A8L5FFXJaeFpJzj8XjrHNqjXOmKAxU5yM42NQPLj32zXakr9qPtz3Vk42/rN4ixP3Act/Koxx81KczKQ=@vger.kernel.org, AJvYcCUIB3kYHWPbnscUoJCajwPGChlq5zmsyvUezqPjD9CNY73dW2taGQRWfdAySJaFviq/y2Rvj+wT@vger.kernel.org, AJvYcCUix33SRPj/JqqlhDltt2VbKZbvRpaGNucp29geZX/Fm8CjkD+QKbXxLrkLcsH5ZrxSJeF8AbW8FAkQ@vger.kernel.org, AJvYcCX0eCne3OUuQEn5cGmcOFyXZkl0c5t92llzZ8UVTh0rOEcTwJDKeg18My/4dgNjCAjS+WZdJIrlKXnu1k4k@vger.kernel.org
X-Received: by 2002:a05:6102:3fa5:b0:4b1:130f:9fbb with SMTP id
 ada2fe7eead31-4b2cc488b98mr2282884137.26.1734681576656; Thu, 19 Dec 2024
 23:59:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220041659.2985492-1-nikita.yoush@cogentembedded.com> <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241220041659.2985492-2-nikita.yoush@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Dec 2024 08:59:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXV-2bdU9Cmk_VHTJ=M3Afg5aTfY=_k=p6v1igzpV5kBA@mail.gmail.com>
Message-ID: <CAMuHMdXV-2bdU9Cmk_VHTJ=M3Afg5aTfY=_k=p6v1igzpV5kBA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: renesas: rswitch: use per-port irq handlers
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Dege <michael.dege@renesas.com>, 
	Christian Mardmoeller <christian.mardmoeller@renesas.com>, 
	Dennis Ostermann <dennis.ostermann@renesas.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nikita,

CC devicetree

Thanks for your patch!

On Fri, Dec 20, 2024 at 5:17=E2=80=AFAM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> Instead of handling all possible data interrupts in the same handler,
> switch to per-port handlers.
>
> This significantly simplifies handling: when the same interrupt is used
> for several ports, system calls all handlers, and each handler only has
> to check interrupts for one port's tx and rx queues.
>
> But it is not required to use the same interrupt for all ports - GWCA
> provides 8 data interrupts and allows arbitrary per-queue assignment
> of those. Support that by reading interrupt index for each port from
> optional 'irq-index' device tree property.

Sorry, but I can't find where this property is documented?

> With per-port interrupts it becomes possible to configure affinity such
> that traffic coming from different ports is serviced simultaneously on
> different CPUs.
>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

> --- a/drivers/net/ethernet/renesas/rswitch.c
> +++ b/drivers/net/ethernet/renesas/rswitch.c

> @@ -1906,6 +1841,34 @@ static void rswitch_etha_init(struct rswitch_priva=
te *priv, unsigned int index)
>         etha->psmcs =3D clk_get_rate(priv->clk) / 100000 / (25 * 2) - 1;
>  }
>
> +static int rswitch_port_get_irq(struct rswitch_device *rdev)
> +{
> +       unsigned int irq_index;
> +       char *name;
> +       int err;
> +
> +       err =3D of_property_read_u32(rdev->np_port, "irq-index", &irq_ind=
ex);
> +       if (err =3D=3D 0) {
> +               if (irq_index < GWCA_NUM_IRQS)
> +                       rdev->irq_index =3D irq_index;
> +               else
> +                       dev_warn(&rdev->priv->pdev->dev,
> +                                "%pOF: irq-index out of range\n",
> +                                rdev->np_port);
> +       }
> +
> +       name =3D kasprintf(GFP_KERNEL, GWCA_IRQ_RESOURCE_NAME, rdev->irq_=
index);
> +       if (!name)
> +               return -ENOMEM;
> +       err =3D platform_get_irq_byname(rdev->priv->pdev, name);
> +       kfree(name);
> +       if (err < 0)
> +               return err;
> +       rdev->irq =3D err;
> +
> +       return 0;
> +}
> +
>  static int rswitch_device_alloc(struct rswitch_private *priv, unsigned i=
nt index)
>  {
>         struct platform_device *pdev =3D priv->pdev;

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


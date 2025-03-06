Return-Path: <linux-renesas-soc+bounces-14075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EFCA54BE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 695DA1631D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 13:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92DF20E338;
	Thu,  6 Mar 2025 13:16:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63E20CCF3;
	Thu,  6 Mar 2025 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267004; cv=none; b=Lh4cidm4pFd/fW6SeVhB1aiHKLUgPK17gqqjexAuwl6Q4xCuaP3uYJvfmmYfOXs+l8xEIAYlyrnpJPstH2TjYm41bS35Sfg9uD/XSbVvmFJ9apZIcK2wn+DYCT6AVDwwAq7TUxKVdpU2U0ylNJm5XZt33aRdmXoNV5NAONUv230=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267004; c=relaxed/simple;
	bh=geJfl6Tjs0ZMZDhgGE556UpvYRQdcEBtOMPHxo+Ic0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/XqBCJcIg+xDVqgnAU4GV0skzAj67GrcFEv2pqKh5DuMEb/shsUhBml8HfxF4ZGaRBFISxoly+EhYljb5KFjliR5tTvQExvnyborjfA7+I/RrzFushhMcCShRJlaz70J5qGsHlpFfVPLYGJ0PO8p4jTotZS8g3Gak679bF9bOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-523658b61a5so252742e0c.2;
        Thu, 06 Mar 2025 05:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267001; x=1741871801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNeHtAW9iePLKHd5cZPEWpcAxe2OAsXb5VCz3ALcxDA=;
        b=e9BFNz+PtUtb6Dwp4X9z0tyVzwjI7URq88te0Jann9JIqJLC4+ky1/d0ObmjvLxpul
         migJMF+DsfMNwXavqTpof1Dbky58Fb5bOPa4I8l3SpLzxDG7bg7Ze5zfdUH5FumIrR3a
         Ru6GMzZk50WuqYNRSM7XKwILyUERrj+tVc9j+7Rmy2NBA+OwMBZkGMtOiv/xSoqUR7oE
         U3RV2Qq5vvxCQSogx3fKDK50DB4iiLvouWA64QQjOgm6aTmlOFza+33gSPkKJFv2rn5+
         Fn8/r1Z00shvBDKUd28Pfv0mql3PpB62OAyYGsDtefqEbomnMf10mw26o8Cvpd/G41Bd
         NZEA==
X-Forwarded-Encrypted: i=1; AJvYcCU4r+kbZ3Oj5AQDZcgiWVsWuUyqjVocQXgB0UrP3p9G8F4a1rZgMpjNAVeQxAsMtxzGBQtBCAA1q08=@vger.kernel.org, AJvYcCWibSA+Zy2l6pi5Ej/GAEvIFeE09jhzWnWHvKggoGj9EP1RCxFMw/HcHwUeLLu6fQW7RLsuE7NJAU4oSL7/KwjFUqE=@vger.kernel.org, AJvYcCWtodKDDgJzZQFUt3E7U9+62K2sQRpp2K1sfukXRUjslt2/papYAyG0Vm3xLzcskcpaDYRJZh4LSO/WbBeJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxBL1dEgvjRyC2fU8vP0qBgvjPS0e6kr141gWU5so1FUH3vYpln
	DpfQ+UHskHlE2BKW3iZj4QZ6d8aygQ3nw8ffeWQ3GM4azei1Sd3R7kfn7u+H
X-Gm-Gg: ASbGncvFX3CiS3sUQ03mxaZ464ELxxncx48s5bUugFR9O06d03CthUESL3G92FWfxl4
	sfsxYt25j5UWjWvh/GeNxCkfl8aanLnDy2sgx3QOjFS/iAuFpcaaHCBN1fG6etSg0ECJ/BkgbqI
	io9VFzvih6uVDz1Ltt2oDZK7o0mFzwg8fA2MLtWN+HFzloVttfpQIbxMLq6O7fi1wwdc/5FUZXQ
	PV1w5IdUBazYEB9U6ZMW2y4zO08P9K8+IB/LozFiTTH24TtTqYhqg6dCtsIepzfPi4Nh8gP1GDj
	BizM6/JtWAJJosWg5IcF4iqLKmcfUVm7aiObETTMYNPeU3SEOWzsSDZVhDHsbahpQRq0sOUXTpm
	CDfNJVEuE2Jo=
X-Google-Smtp-Source: AGHT+IGELfb/Y4vdVdihDGYTOy2cV5i9WIQa/lkI4pfi/bWAl1AP8lHizqJeneckaU6tNBmobAQLlA==
X-Received: by 2002:a05:6122:904:b0:520:5185:1c77 with SMTP id 71dfb90a1353d-523c6262259mr4262457e0c.7.1741267001379;
        Thu, 06 Mar 2025 05:16:41 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8af8d66sm173087e0c.21.2025.03.06.05.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:16:41 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523a6fbf025so258822e0c.0;
        Thu, 06 Mar 2025 05:16:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHH2fu/OsJfHDjp0sEUKhPT3qQCKaQMv5zY8TYagasNQja/fSDjSKJr5he9v/Up/mfe2IbjCfogwU=@vger.kernel.org, AJvYcCUYZ8W2ljqjilVSUzDlv5Y9IIq9MTpqi1KAQaIaOlHkMebXmzmqK6hthtnFPA81z7tVanid1XI9FM9dkxYsV0hn1qI=@vger.kernel.org, AJvYcCVtXfu8MUM6Eg5ZX8jZTROqTgpRedC8FMoT/isTjXKyutteFDfyWLI7i95NPnekYq4y92cSNe7b/bphrGM3@vger.kernel.org
X-Received: by 2002:a05:6122:793:b0:523:dd87:fe86 with SMTP id
 71dfb90a1353d-523dd88050fmr469336e0c.6.1741267000695; Thu, 06 Mar 2025
 05:16:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250218114353.406684-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhZ_qV=16jnWD6cPfuMmZpDUeRMTUgbqy=Mkzp-29=bA@mail.gmail.com> <CA+V-a8uvfb=a=K1YzGNeZdiAzeXWMpdbxj=6UuL_xQfxKmOBZA@mail.gmail.com>
In-Reply-To: <CA+V-a8uvfb=a=K1YzGNeZdiAzeXWMpdbxj=6UuL_xQfxKmOBZA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 14:16:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXermXD2yCJxYjw-bmWKiazF5LVJ8PHoELKEdp_q2UnfQ@mail.gmail.com>
X-Gm-Features: AQ5f1JptUoAeUXz4mTgK7gXoOQkLHMd-qd9V8kXJ1S2BLhS2F8KlZRac5gEhngQ
Message-ID: <CAMuHMdXermXD2yCJxYjw-bmWKiazF5LVJ8PHoELKEdp_q2UnfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rzv2h-cpg: Add support for enabling PLLs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 6 Mar 2025 at 14:04, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Wed, Mar 5, 2025 at 4:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Tue, 18 Feb 2025 at 12:44, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Some RZ/V2H(P) SoC variants do not have a GPU, resulting in PLLGPU be=
ing
> > > disabled by default in TF-A. Add support for enabling PLL clocks in t=
he
> > > RZ/V2H(P) CPG driver to manage this.
> >
> > Does it make sense to enable the GPU PLL if no GPU is present?
> >
> No it doesn't,  PLLGPU is enabled on needs basis ie if GPU node is
> enabled the PLLGPU is enabled, if GPU is disabled the PLLGPU will be
> untouched and will remain OFF. Note I also have a patch which does
> disable the PLL's but I have not added as this isn't tested with the
> full system running and I'm not sure if there will be any radiation if
> we turn ON/OFF PLLs (Im discussing this internally once approved I
> will add support to disable PLLs too).

OK. It just sounded a bit strange in the patch description,

> > > Introduce `is_enabled` and `enable` callbacks to handle PLL state
> > > transitions. With the `enable` callback, PLLGPU will be turned ON onl=
y
> > > when the GPU node is enabled; otherwise, it will remain off. Define n=
ew
> > > macros for PLL standby and monitor registers to facilitate this proce=
ss.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > >  drivers/clk/renesas/rzv2h-cpg.c | 57 +++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 57 insertions(+)
> > >
> > > diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rz=
v2h-cpg.c
> > > index 1ebaefb36133..d7230a7e285c 100644
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c

> > >  #define PLL_CLK_ACCESS(n)      (!!((n) & BIT(31)))
> > >  #define PLL_CLK1_OFFSET(n)     FIELD_GET(GENMASK(15, 0), (n))
> > >  #define PLL_CLK2_OFFSET(n)     (PLL_CLK1_OFFSET(n) + (0x4))
> > > +#define PLL_STBY_OFFSET(n)     (PLL_CLK1_OFFSET(n) - (0x4))
> >
> > Let's subtract 4...
> >
> > > +#define PLL_MON_OFFSET(n)      (PLL_STBY_OFFSET(n) + (0x10))
> >
> > ... and add 0x10. Where are we now? ;-)
> >
> > I think it would be better to store the PLL base offset instead of the
> > PLL CLK1 offset in cpg_core_clk.cfg.conf, and define offsets
> > relative to that:
> >
> You mean PLL_STBY offset in cpg_core_clk.cfg.conf and have the below
> CPG_PLL_XX macros.

Exactly, the PLL_STBY offset is the "base offset" of the various
CPG_PLL_* registers.

> Or maybe instead of using a conf can I add the below?

Sure, sounds fine!

> +/**
> + * struct pll - Structure for PLL configuration
> + *
> + * @offset: STBY register offset
> + * @clk: Flag to indicate if CLK1/2 are accessible or not
> + * @sscen: Flag to indicate if SSCEN bit needs enabling/disabling
> + */
> +struct pll {
> +    unsigned int offset:8;
> +    unsigned int clk:1;
> +    unsigned int sscen:1;

This is a new flag?

> +};
> +
> +#define PLL_PACK(_offset, _clk, _sscen) \
> +    ((struct pll){ \
> +        .offset =3D _offset, \
> +        .clk =3D _clk \
> +        .sscen =3D _sscen \
> +    })
> +
> +#define PLLCA55        PLL_PACK(0x64, 1, 0)

0x60

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


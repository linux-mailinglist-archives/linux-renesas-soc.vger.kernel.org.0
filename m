Return-Path: <linux-renesas-soc+bounces-6821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 735C3919FE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 09:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 975921C21D10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 07:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DE34D8A7;
	Thu, 27 Jun 2024 07:01:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E423482C6;
	Thu, 27 Jun 2024 07:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471662; cv=none; b=U5oPbLPKK8KL2QO+hW4cBweazKUi7zJky6wW9922JLD7voAeyAY0aI6PViuCB3knV8v1cIu5ijAyRl5ABDNVrWveP0u1kifVesx4z5A8P/3T/4QX65czfkkLUNslOyt9Dl6xtnFpwrDAmJbSllvR4wx36ePR2tixcih5JjjHlC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471662; c=relaxed/simple;
	bh=cQTs5obvIz+zbP/bqzVwSgdCDbVf5EHSOMYOzR4h8PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWou1d6YKgNG4+uG6H1ZRS3Zsb39I0GPZE/wuuYHvjfqWGeeW6upb4OnJ1OIO8A+4u2rO6pd/diEeqG0WS76xUsdm4yQsMORdNvFC0gEMivNZynmVD0am2ylZtO8/PX4FVlaENssXUg2jsw5eezhbjiVEMRs2REJl9ymxyZBitI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-63186c222eeso73141587b3.2;
        Thu, 27 Jun 2024 00:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471659; x=1720076459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeSzhEBQcb0vZIx0UKX6NdnnkgY4A2rNCHo2p+fUG8Q=;
        b=K5OeD9srI3qiYe4PczYE+JG330f5kiaCW/lWygvyecxR8FHGOuLAAzYjPrt6G4reyl
         TLoCVcaxZAbBxfg3qiTQNQfoCWC9z4Ke0UogSJgvikHpRMfJVOw+ptjD2cbJmhChCikw
         mPCASyIx5teOZ2XkXQZ24tWNomldLAcB4ePdPHkVlG0p3LXj0WEs9zgoqnYrQIqaO8Li
         Ue31F+8hBx8vLEWaJoB/C8fp24UfBU4I6cSu0dq1nJ73avX9yjPwl3Dsra3MPzVxY8dm
         5/1Bi3TrmtogQg6+/bIwo6vD2lsGj0r5zmzIJwkgqB0cj72CMmytVgN0beMRln0Yrr8u
         wpGg==
X-Forwarded-Encrypted: i=1; AJvYcCW469Cp6ZiJSj9bfDVIiWid+Rv0mb1wRwgzQm1CHhuvNXoh22Z4/q413juV3U2KlPg7SQhXgPUzBE7klzO8E9VHnJTINqEAPeRlxjLC4Cr2hQBbuNmbAka1H2N7kYwuc6vyBDYMDcYdcOWua59GZxqElr2MNVtDNwT5pUf0s/eGAAM9e8+EDHf+OpBh4eISXPRXck0b7+EePxrr2o5mGo3U/1VzZ+CR
X-Gm-Message-State: AOJu0YxNpssNGG9h/jFMsjhRWkVsb/vj5SDVcyL/COA8Ech6Q4TsELuA
	VHb/3SJWouLiPu/yeHWCDb3JJjefpJn9utoBBDMIBsDyBYG7Aq0z7jeQ2/iw
X-Google-Smtp-Source: AGHT+IFRx25U/w0GJx9IFrQAPU/iDv513wydbb3N9qpcHY26IGrTm54XUw1DHgwJsU45qiwx5e/Wbg==
X-Received: by 2002:a81:ad22:0:b0:618:8bd6:abc5 with SMTP id 00721157ae682-643ac9150f5mr121054897b3.34.1719471658639;
        Thu, 27 Jun 2024 00:00:58 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64978a6f451sm1518687b3.14.2024.06.27.00.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 00:00:57 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-63186c222eeso73140737b3.2;
        Thu, 27 Jun 2024 00:00:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2baPSPix2RkrnxtfO0oanX9v84/XiEVaewlR2lA6TY4G4Tq+0RH8kpovUAz3K7L1Axe6RjmRxoxOFTF02BgS2EoAoc+20OMvbdTIUa8IUCP7myo2egsbpkuX9jA/0O9BtPK/Lg4ZErdHuC20nddE9n9M9tAAQUEnubSEd37XqNcQapBaLvN+APMQxzouD79q32qrRBUQpWHhe0mE++RF1AvkeluSY
X-Received: by 2002:a0d:ea0e:0:b0:627:dca5:407b with SMTP id
 00721157ae682-643aaa8604amr111891557b3.13.1719471657173; Thu, 27 Jun 2024
 00:00:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVOvdU4ajB_f9OtQ8ao0Aodg+Rb9eGTmbNGC8o+aW-hzg@mail.gmail.com> <CA+V-a8sqJBo2Q7+-_AYtFkmzYrxAjvJ7mLXgpLcmZNuGWi0BDA@mail.gmail.com>
In-Reply-To: <CA+V-a8sqJBo2Q7+-_AYtFkmzYrxAjvJ7mLXgpLcmZNuGWi0BDA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jun 2024 09:00:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUryuN9xfYEX_eVGp1hV9zzhw5=bjvJBQb1FwcBcrNs4g@mail.gmail.com>
Message-ID: <CAMuHMdUryuN9xfYEX_eVGp1hV9zzhw5=bjvJBQb1FwcBcrNs4g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] clk: renesas: Add family-specific clock driver
 for RZ/V2H(P)
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Jun 26, 2024 at 7:36=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Jun 26, 2024 at 11:07=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Tue, Jun 11, 2024 at 1:32=E2=80=AFAM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> > > +/**
> > > + * struct mod_clock - Module clock
> > > + *
> > > + * @hw: handle between common and hardware-specific interfaces
> > > + * @off: register offset
> > > + * @bit: ON/MON bit
> > > + * @monoff: monitor register offset
> > > + * @monbit: montor bit
> > > + * @priv: CPG private data
> > > + */
> > > +struct mod_clock {
> > > +       struct clk_hw hw;
> > > +       u8 on_index;
> > > +       u8 on_bit;
> > > +       u16 mon_index;

BTW, why is this u16? The corresponding member in rzv2h_mod_clk is u8.

> > > +       u8 mon_bit;

> > > +static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
> > > +{
> > > +       struct mod_clock *clock =3D to_mod_clock(hw);
> > > +       unsigned int reg =3D GET_CLK_ON_OFFSET(clock->on_index);
> > > +       struct rzv2h_cpg_priv *priv =3D clock->priv;
> > > +       u32 bitmask =3D BIT(clock->on_bit);
> > > +       struct device *dev =3D priv->dev;
> > > +       u32 value;
> > > +       int error;
> > > +
> > > +       dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
> > > +               enable ? "ON" : "OFF");
> > > +
> > > +       value =3D bitmask << 16;
> > > +       if (enable)
> > > +               value |=3D bitmask;
> > > +
> > > +       writel(value, priv->base + reg);
> > > +
> > > +       if (!enable)
> > > +               return 0;
> > > +
> > > +       reg =3D GET_CLK_MON_OFFSET(clock->mon_index);
> >
> > What if a clock does not have a clock monitor bit?
> > Clock bits in registers CPG_CLKON_22 and later do not have correspondin=
g
> > clock monitor bits.
> >
> Oops I had missed this case.
>
> I'll introduce a macro (NO_MON_REG_INDEX) for clocks which do not have
> monitor support and add a check above to skip clk monitor operation if
> clock->mon_index =3D=3D NO_MON_REG_INDEX.
>
> /* monitor index for clocks which do not have CLKMON support */
> #define NO_MON_REG_INDEX    0xff
>
> Does this sound OK?

Either that, or make mon_index signed (which would reduce its
effective range by one bit).

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


Return-Path: <linux-renesas-soc+bounces-5665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D468D3B53
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 350692865E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1629C15ADAA;
	Wed, 29 May 2024 15:48:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35FA180A80;
	Wed, 29 May 2024 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997684; cv=none; b=D5QwXfO56qLtznZO7T+00QA0hOszPEMU+NuKBfT2Wr57AOd3DNzxSvbs3TPLpNNsz9VvTFe9RusEaQf9bkgeoPVlRXt2TbRRJ97Swhf68qRs9wH2CovaUOUKSXxCVV3U4ThR+6QtjmCMJyTb0r9Aetfs1a+DAuRQEHMeB49ALbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997684; c=relaxed/simple;
	bh=f0C0B4kzZLIjo6dch1+N9Dgh+xT+IoEGkwIFrOtQWpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWpIn3xy/062jskwBG5HjwE4kSVaHkGLM42bTfvnbduk/FmOJa/ZBulnhBCrJuyC7+bjuedLQ1K7BxHIZItv5U5vBtkf7DtSFTvvJoolgw21Ux/omTS/hC10jF74vGc9waifIsZ/0K4Rm5OzGQA72WCVVmK8sqyiDPkGADerBcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dfa48f505a3so871631276.1;
        Wed, 29 May 2024 08:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716997680; x=1717602480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSxOOa5iWnjtl+pFAwobVJfoHrYpn+lEWj9HAOR4mwE=;
        b=KiLkncgoQ3Y8RL6fGkut9Ng3gx4wrHzkZeVq/p/l+Rb0c5iDLdabiunAGZP0lgeQRB
         9GjXRpXRFbUg6GvGgHC7KvFC3QpQ3o7HcejA+9KCbHWQ5HJHVW6nQkzwFucNTb8QAdv0
         HHxWSqF9Pwanic/ifZK9XzeCNLjILXVflrPMlgKzEP6gBYLcv5hPU4fMcjyj28ooN9hD
         UVspE60yUg5AQz85UQfvqcX+Felofnklsv+rPgZWVA9cvTFm3uG5qXKzmQ3ekfgplNAJ
         ZG8K8vvchEom3dgGQeeCXOh6xbN7g6aop5wRquG2hUpfbJZSQrXlOvLuLQ9u/icoFmSt
         v1VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxenxtrokHpTFREK2JYnAPlbY02ZifcMzdW/6uGfjofuy2pU4SIXOutmuvu3zBF3nPp6CzWGM5s4g7KTf8U8WXtt9HJBeB92Y1
X-Gm-Message-State: AOJu0YwcWb4aRMvVkczZMLTTs91p+CCtEqYkkanmUD8dDObbcPJcts/S
	tcHgA14IondemsS3gmx3xz09QIeTT/TDF5TxWGCJ5K80ULkhse9VDRH7jWji
X-Google-Smtp-Source: AGHT+IFmNUjU1LrF4d6jwNTha7eqJY9wBUdYktZksLghovtuopSU0rrNBDHrivENF2kcf14kSq33mw==
X-Received: by 2002:a25:83c8:0:b0:df4:dff9:6c8c with SMTP id 3f1490d57ef6-df772168069mr14733241276.4.1716997680238;
        Wed, 29 May 2024 08:48:00 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df7746b127esm1447096276.33.2024.05.29.08.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:48:00 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df481bf6680so2209440276.3;
        Wed, 29 May 2024 08:48:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVblRPyA3R0cFDa1qPh153ivfuri80xbTbacs4bPiKMbXrQoqCWR7825sEnQkLJed7C9b6TjqDlyEi0YsO2ZKbIY4lMdtU1Cv80
X-Received: by 2002:a25:ef4a:0:b0:deb:cad4:796c with SMTP id
 3f1490d57ef6-df7721a70d6mr15961345276.22.1716997679843; Wed, 29 May 2024
 08:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527131541.1676525-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527131541.1676525-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVaXhLruaPWBGbpzQds0y03t9UJ-NxEtvtKma-5-WwooQ@mail.gmail.com> <20240529153025.GA710180@ragnatech.se>
In-Reply-To: <20240529153025.GA710180@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 May 2024 17:47:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNLpZ+peJoO9XhBiZKOcV9CHp0RBsU27_QtWR5Q=5=yw@mail.gmail.com>
Message-ID: <CAMuHMdVNLpZ+peJoO9XhBiZKOcV9CHp0RBsU27_QtWR5Q=5=yw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r8a779h0: Add CSI-2 clocks
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Wed, May 29, 2024 at 5:30=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-05-29 17:09:09 +0200, Geert Uytterhoeven wrote:
> > On Mon, May 27, 2024 at 3:16=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Add the CSI40 and CSI41 module clocks, which are used by the CSI-2
> > > interfaces on the Renesas R-Car V4M (R8A779H0) SoC.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > > +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > > @@ -176,6 +176,8 @@ static const struct mssr_mod_clk r8a779h0_mod_clk=
s[] =3D {
> > >         DEF_MOD("avb0:rgmii0",  211,    R8A779H0_CLK_S0D8_HSC),
> > >         DEF_MOD("avb1:rgmii1",  212,    R8A779H0_CLK_S0D8_HSC),
> > >         DEF_MOD("avb2:rgmii2",  213,    R8A779H0_CLK_S0D8_HSC),
> > > +       DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
> > > +       DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),
> >
> > According to the documentation for the Module Stop Control Registers
> > 3 and 4, these are called "csitop[01]".
>
> I noticed that too, the issue is how they are named on V4H and I thought
> aligning the Gen4 board was a good idea. I don't feel strongly about
> this, but before I send a v2.
>
> On V4H the bits are named SRT31 and SRT0, while the "Target Module for
> Software Reset" lists them as "CSI40 (CSI-2-RX0)" and "CSI40
> (CSI-2-RX1)". The later is the same for V4H and V4M, while the bit name
> differs.
>
> Should we rename the V4H modules as well, keep the names for V4M, or do
> we not really care the same modules have different names on V4H and V4M?

We already have other differences due to how the bits are named
in (different revisions of) the different datasheets...
Technically, nobody really cares about these clocks names, they just
must be unique ;-)

And apparently older revisions of the R-Car V4H docs use "csitop[01]", too.
Oh well...

I guess I'll just apply this as-is, unless someone screams...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.11.

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


Return-Path: <linux-renesas-soc+bounces-15206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D36A76B40
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0212D18838C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0041FC3;
	Mon, 31 Mar 2025 15:48:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE35433AD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436101; cv=none; b=WPUXY1m3uqmEsLq74N2R4L64x8uCRR5uuVLQFSQdSzLlW8Vm5AXpMyTacmyKo3hH6IDAp6+5Mj/nPLnsCFJiHuD/j1WbbjRdM3O5OdPgk1Y2BcX9i04LkPmC91/JalBfS4IcHS1EYVFaXG/Aiu4oR8pbKdo798IcOkGsDPtRSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436101; c=relaxed/simple;
	bh=zX5YK4TNtq+J4yE46VRxylZ7dj6slFyhEM6vgeVkap4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEdC5CWmrLqup4ZwEMbdbrYoxTosD97W8EcK/OVl8CWTDeoFOTDztQgOC0uvYkzYoKuDY2ONVodOW0Tk9/2qDCr4lHzXurqMOgB6Q2BZWSJD9nwMpgLlROSVlpdsi72lh1BvOMymVQs6aceCfju6+GZy/FgC6T2xDw9dY5neu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso1991361241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743436098; x=1744040898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCXeHdlyA5qxu7W+VNrpF8H4KbrYJ0xrdxbC7W4twGc=;
        b=h7Yvyh4f3WxOBT4Ynf8/l95H0My/cTvlp0ktfkQZSvTvzXAJR2sBrHGzFCYG4OlTTN
         LiyVeu1HyIhebOGyeT3CpixhOU8pQNdqt2KG2CsiZ80RLyWmvDiWEPZjn6EilrV63mwT
         E6qWSyt4ClR5icAbzldBfTEEkWLC9KdsvDbFVLz0hbbsYThVUX7ZgCb5n4HmfMueCtDa
         zdRbhdptYk23Jtm53W7INNbzDSdRO9QxCst+inl9CQN/YNpjdYGWkotBeSRzEPFqpYxu
         2dV1nAxI3sCQTuaL6Uom8MvaADiWBGctTVJm7DTVY+8bX2kXEHTFl5UPSua1YIS7PUqp
         IxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU44/bfpFX0TpfGjb7vU0Lb969shGpSDOzU4VwnFDrral1JUIAITpIDqH06ELkjB7tOcnSP2C11nB1kuTtQXy2tVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzmukOqeGYN6WtpPNYRs1WBtxcbcSUPhBq+jWQHD24OtAV1DWt
	cp0yz8Gg16puuTfRaJiXMgMDq7XGcILG1z9I6SyfxpFH6rs0rRwZOX87+5n8
X-Gm-Gg: ASbGnctLCmch1CYi7e6zr5lf/nTrIYDKV+OLByoSttqw6eRK6n3IOg1jMIeHkk34n5Z
	JjxCC4Kt9yU3USa/e09q/8Ser5JH8uISb3zJO1KfgcAUw9yW8PX2yJbdkEdqiDe7n/uf+76XRlq
	TmCTUhnXQtVEofIeV9J+EMhawXKfkpj4CceCPyJHRZQPeRreXez111/tC2Y1syDx0GCv181BJ8j
	BWfp685tW7HW8cGbxKg41catpIlUfjGWwb6mV82CYI1jeiRbAldOCTSFWZq7oW6JElfVnjdNGVa
	2sqzgkm4sCdJefyJpFwSHvU7pDSEjuHg9ZwH9+qV8L84lHFUkjvANTnwWj+cphWovLPcAIBanT3
	4NXrU71k=
X-Google-Smtp-Source: AGHT+IG3g3F772ug1kyw7xyAixS53TEsfvTyiT5MzOdT4NoHdaIk/YoUA0eISnH/CbiQAcJdOkr0SQ==
X-Received: by 2002:a05:6102:374f:b0:4bd:22d5:fbd7 with SMTP id ada2fe7eead31-4c6d38bcea0mr6232514137.11.1743436098014;
        Mon, 31 Mar 2025 08:48:18 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfe27fcbsm1615495137.24.2025.03.31.08.48.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:48:17 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86c29c0acdfso1991336241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:48:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAnrWmkmfmSUC1pjDA5mQq7VupIEYra2U2vfy8qYbozeKjm3tv9vw5enZxlA8rSlcyi4GBOgo1cz4irAXVLxl2Lw==@vger.kernel.org
X-Received: by 2002:a05:6102:374f:b0:4bd:22d5:fbd7 with SMTP id
 ada2fe7eead31-4c6d38bcea0mr6232471137.11.1743436096903; Mon, 31 Mar 2025
 08:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com> <CA+V-a8uvetHu1nvigA6s5DNYPKMq5iC6=UEnMLy=z+83nQ8acQ@mail.gmail.com>
In-Reply-To: <CA+V-a8uvetHu1nvigA6s5DNYPKMq5iC6=UEnMLy=z+83nQ8acQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 17:48:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdrJpyABVQPf-QuErPohmxcFPtECW3XW87bNfGVarMDg@mail.gmail.com>
X-Gm-Features: AQ5f1JoBhLOmUgiYMBDQbTbVDTQ3Euy-K6HzQn7sDeXNzFvsqWk84NqK_Ypo4PI
Message-ID: <CAMuHMdVdrJpyABVQPf-QuErPohmxcFPtECW3XW87bNfGVarMDg@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 31 Mar 2025 at 17:37, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Mar 31, 2025 at 4:16=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> > > Adding default y if ARCH_RENESAS to the relevant configurations remov=
es
> > > the need to manually enable individual SoCs in defconfig files.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/soc/renesas/Kconfig
> > > +++ b/drivers/soc/renesas/Kconfig
> > > @@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
> >
> > Note that this whole block already depends on ARCH_RENESAS...
> > I forgot about the reason, but commit 8070ba6348608aa1 ("ARM: shmobile:
> > fix build regressions") reminded me.  This is also the reason why we
> > cannot open the block for COMPILE_TEST in general.
> >
> > >
> > >  config ARCH_EMEV2
> > >         bool "ARM32 Platform support for Emma Mobile EV2"
> > > +       default y if ARCH_RENESAS
> >
> > ... so the "if ..." part is not really needed for arm32 SoCs.
> >
> Ok, got you.
>
> > > @@ -197,6 +216,7 @@ if ARM64
> >
> > Note that unlike on arm32, the arm64 (and riscv) block does not depend
> > on ARCH_RENESAS, so the "if ARCH_RENESAS" part is needed.
> To keep it consistent would you prefer `if ARM64 && ARCH_RENESAS` to
> be added and then all of the SoCs can just have `default y
> ARCH_RENESAS`.

I am still undecided. On one side, I like symmetry; on the other side,
I like opening up as much as possible for compile-testing.

Note that apart from a scary "WARNING: unmet direct dependencies
detected for PM", an m68k allmodconfig kernel builds fine after

    -if ARM64
    +if ARM64 || COMPILE_TEST

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


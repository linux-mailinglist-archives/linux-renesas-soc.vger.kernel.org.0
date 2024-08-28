Return-Path: <linux-renesas-soc+bounces-8427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D247962433
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F34831F25232
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80984168486;
	Wed, 28 Aug 2024 10:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQJpOhGI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E916132A;
	Wed, 28 Aug 2024 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839258; cv=none; b=jiv6xVFxaUaKcqCm1gYIblcm3z1cbnXE52cnrVBFAHcZGwD4BnZzTjK/KmpfLcaPWIGqCHPHnWm/CINgg8OzFgJBLYMHy/frxsT+xTS3kg8ENgKs1NKGEXhQRoy0cBElkkx1iI/Nl79BLJ0Tj/mv1JNmre3PVzz/GKw/ka6LpLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839258; c=relaxed/simple;
	bh=laAMyjgJpnfUiprk+3k3wkXJJvX2MDMF/dJNRJz++fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1le55r5qLVaJ3t4UWGPvuPQGtmhtlnNpXklWQpG5ElRUT0OhD583eENEckRSraQap0fsA90QFqNTGc8sXCPyhB+h3yFA/wgqNyXF0HLfHB0a73c6LPynvWstN3RraqOkcJ+iaU79KzXDuPtAO+vq56b6pHfAaS8/EUwKWQxU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQJpOhGI; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4fcff944d1dso1698399e0c.0;
        Wed, 28 Aug 2024 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724839256; x=1725444056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/+TdeKLMfSOg6u48bTxsn7AtKjKN3QrGBGptv0hiL0=;
        b=dQJpOhGIsHDKcw1xwyzevFyD7uRb49e8xNi4MvcxznXeuMV+fCfqq6MY7o2NqiJxg0
         xXcdv1ufRhIeT0qoXF1auSeCO9HdBZ327vjhY9xn+U34Y0FhcmDWrlLs5xCmxbaUsUiV
         fz5pCoJnKHhRV8a7MojAj0Brr5Xtv3fLwC1LfLtcMHAdPWLiS8BtWuffvjLuR9U7EmX5
         Pzq/RSjtS9JriPknKKELTrALfS8aK5MrsUG9KqcPKcldpFbQoPCqKXfRakxTkmosaSmh
         18Z27cbkfyL7tMQln/U2BfykqWGcPSSlX/bDtgJV992j2TgetOjpJ/lXKuvojQaMy0Hd
         rkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724839256; x=1725444056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/+TdeKLMfSOg6u48bTxsn7AtKjKN3QrGBGptv0hiL0=;
        b=waIHgLd9OKxz09MBsrI+qzTpMRaMLqbYlqrLU7ICoVpQDk2e5qAtglxIDParECvyIO
         Mo/EEmv0avl+2bLj4t5UBXXVI6yU7MnpaDwIvJl+11NevlcERA7qMmAlQoZYQRXVrW+j
         payjWB/p99kggvJg8TmPxxmyfn2Kc6CwpWS6xfabSaFwNzldlGEajY9xNvqQ3Y2OwbNM
         KIFthKVQcEybH5K5EleHvYQjSlgehVP0Fpzvdt1Ju5FSvFmTtu4WH/Vlz82+8885/shU
         +aKoL/V+NpOH8F4POafhaEYj/YW69KkdSZJusqWR6GunGQIRa8tluPwQDKIwD0jWMUlM
         u7NA==
X-Forwarded-Encrypted: i=1; AJvYcCU/OF1t+I1pUATtU2bEtV/akmezWxdbASwnlRb08DG6IVROOOQxixQbHslFY5b7+YHVh4gvfGRr+lcrjoz7@vger.kernel.org, AJvYcCWTmh2IxG9AQ8VZAmvYsATQSHh5cjFDdLFYTFIz9RMwAloqD8x7yLbOcG8silYN1nrnbZ3mz7Usf7w=@vger.kernel.org, AJvYcCX+LYYP5fbC/pHpvhsWNtv9uxUYAaoKMdAX0+2/ES+EP+zVJurblCYCulTU6z9UQQ69mNcyKs3e2Il2KzZpu2FGULc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXCe0r8M8IFkWTdE/Uon/0QSgA93g5TGuUrT2JCAZ//rcU+t2T
	ALHI/zayrBzKlwtDUn8u2Hr+dRIlTiMTJHADGJTiRDrDImpxuf+C5XLYhmKZFl9X99/DNkJEF6w
	CpjGRfRwBIFEfMO+BPsLAoIcGVw4=
X-Google-Smtp-Source: AGHT+IG6yU+6CkVwvbORtvYmt0t4Z9SzF4IWgUJmbzvWIm3Ak8t40PFgpOjHPyWJYigTc58jglsyEM+BVNy6U3nnmJA=
X-Received: by 2002:a05:6122:1d9f:b0:4f2:ec14:3b6 with SMTP id
 71dfb90a1353d-4fd1a72e27cmr15134582e0c.6.1724839255734; Wed, 28 Aug 2024
 03:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346345B7FF1DBD4DA60273286952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346345B7FF1DBD4DA60273286952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 Aug 2024 11:00:29 +0100
Message-ID: <CA+V-a8vPisCVCX0jLYJGrozabRWpBV+xmU5ufu4Ke9Rziis1XQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Aug 28, 2024 at 10:53=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Wednesday, August 28, 2024 10:38 AM
> > Subject: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and rese=
t entries for GTM/RIIC/SDHI/WDT
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for GTM, RIIC, SDHI and WDT IP blocks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Moved DDIV_PACK() macro to patch #1
> >
> > v1->v2
> > - Updated DDIV_PACK macro to accommodate width
> > ---
> >  drivers/clk/renesas/r9a09g057-cpg.c | 84 +++++++++++++++++++++++++++++
> >  drivers/clk/renesas/rzv2h-cpg.h     |  4 ++
> >  2 files changed, 88 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/=
r9a09g057-cpg.c
> > index 9722b810e027..3ee32db5c0af 100644
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > @@ -25,16 +25,31 @@ enum clk_ids {
> >
> >       /* PLL Clocks */
> >       CLK_PLLCM33,
> > +     CLK_PLLCLN,
> >       CLK_PLLDTY,
> >       CLK_PLLCA55,
> >
> >       /* Internal Core Clocks */
> >       CLK_PLLCM33_DIV16,
> > +     CLK_PLLCLN_DIV2,
> > +     CLK_PLLCLN_DIV8,
> > +     CLK_PLLCLN_DIV16,
> > +     CLK_PLLDTY_ACPU,
> > +     CLK_PLLDTY_ACPU_DIV4,
> >
> >       /* Module Clocks */
> >       MOD_CLK_BASE,
> >  };
> >
> > +static const struct clk_div_table dtable_2_64[] =3D {
> > +     {0, 2},
> > +     {1, 4},
> > +     {2, 8},
> > +     {3, 16},
> > +     {4, 64},
> > +     {0, 0},
>
> Is it ok to have {0, 2} first entry and {0, 0} last entry on the same tab=
le?
>
You mean is it prohibited to add (I haven't seen issues)?

Cheers,
Prabhakar


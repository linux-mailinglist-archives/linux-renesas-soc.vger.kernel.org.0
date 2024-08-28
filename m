Return-Path: <linux-renesas-soc+bounces-8431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 503759624A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 083AB2864CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D6016B3BF;
	Wed, 28 Aug 2024 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwLXp1X1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2DA16B3BD;
	Wed, 28 Aug 2024 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840435; cv=none; b=KrjmaRacNavCMzLJpJuk/Moq2fzmWo3D/2294pfeAzOcFx5N2Dykmcsa2U5F5VZPyvgcUi8Gu6fyCZuHD8ef4LNNXAjw/Gzk8yOrBPOCPoWHLspKuahA0gxuhE6spX8yPMN1kTaZbgwp26sDUMDFd5vykt6Ff4rr8W1eCLEVPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840435; c=relaxed/simple;
	bh=eBWk4bTEFR59nYLgwX1f9jQJEeZOcJqHZ7RxVpSw3fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooVNyQmG3C7nuycIo19VxqhV4GBQe7t32dcLz9PVwpAr9eH0IH2hNyI3T9+mk2BLf29xf/4zPXBqz7b4Yoexg8IhPLVEfoej7Ldo4vPAWHyNw69WbuGAC4juyodu5RsTFxmKPrWHo6+AaLzoLSJlHhysGDc/wn5Xpkg4R6r+5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwLXp1X1; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4fd136aac40so1809984e0c.0;
        Wed, 28 Aug 2024 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724840433; x=1725445233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwyHPuKp7P7VCa2X/2i7T//rTfmMw+0gajyxrdfm6hw=;
        b=HwLXp1X1m6MTdsS/8HjmGBSqlXs7eLhxuLDgdx7XTzMMOYUqozkwZR+LVuMwRzFuAz
         S1yD/hmkB6iDhv52arugB5Tcu3fzr8beOjDXRD6HB7H7yJhJdis+7WqgPHWcq7tbL9wp
         Ou8A/lXlhos/Lq1DBf1UqLxrgbDnnkMMRUy5Tk6CyRDEINyRQr753sND2O6ILKQjOkRK
         LUwNDdwLAu2tqmT6Xv4FA2eD/VQl+rzv0/JLOztf06RU05q791eLryz7Z2uWRfklKVmq
         rqRO7dmgNl9rMkcYH2UhmNNdMqFFNXcGvuw2xwgtPHnSSDvkrCyLQViHVLTFZ3J9JDld
         LuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724840433; x=1725445233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwyHPuKp7P7VCa2X/2i7T//rTfmMw+0gajyxrdfm6hw=;
        b=TiFhVF6CmbFvMQsf2YY6iC8Hwtvs6/qeUtb88nxqkUDOFrcn7z4thyZl30js3+Fa1P
         SQRIdFT1KNCZLWnZmjHLe4NwNc6NJvS/CHL/OIn2FfsJuO5MIgM9zFOxsaH9gkvvzl9X
         jW5aewblufLO4P4ytNi+NUyKxfFb3bHslPZbR307oQ9GfdnEuXfXttSgnubz5QlLgMV3
         RboW//cFY/UHshvu1QLonvhDctFTDBeqQyuB+9vrh9Cq2O+EmuhAOGMY4WSB9AZ8Ah0C
         OMU3pb3uq2i5spxsbJI78Mj8j2iPOLN6TwrO3rby5gnzt9Ibs4vFgeGUVvtlRdZmxzQs
         s2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF3DWgI6X69cnstLeaz/ggTtpvnrB7SnJAr9Hipcyr+hD94xrgmx26rqIEqIsXXSoDqIlM9zof0A2ln1bW@vger.kernel.org, AJvYcCWx3Qjp8v3g1Z+3MAOKUF1xnqVn00mr8DlhsSYWDw8yfwqzbVun4TEUue0fN4nlxpx1QcSp03SRrtKFtj1sWQrssa8=@vger.kernel.org, AJvYcCXYLhiIdqjMwVpVfKvnRKibJQ9P19lCKHjbQ+QO4vwZXrrrkqu4k/9VRdqIMPFZWTHgp+LwNiDx9/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8enUQnAZUFvIRdvWK49d/lHnaJwc/tTK6i2O6FonsEjwXJphe
	3y1GChsQcq+xKyRtwGxwkH8DoBQyLh4t1lqmG2WZP0guc8JZ9fRRqb4NK923yjQKyQxqBm4wDDI
	xzaErZMOiCSjYD5CMLmysIWbRcb4=
X-Google-Smtp-Source: AGHT+IFzkoaOKnxUzFeg76w+DuEjB2HxsB8JOcqn6QG8Qe1VSJtBDQNdu6Nxjy+nSL/PbX/oRRgVBCM7owSZ7ERsEe4=
X-Received: by 2002:a05:6122:209f:b0:4f6:b094:80b1 with SMTP id
 71dfb90a1353d-4fef1190cd6mr1370097e0c.11.1724840432732; Wed, 28 Aug 2024
 03:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240828093822.162855-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346345B7FF1DBD4DA60273286952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vPisCVCX0jLYJGrozabRWpBV+xmU5ufu4Ke9Rziis1XQ@mail.gmail.com> <TY3PR01MB113460F2ABA56C89E8E9CF09D86952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460F2ABA56C89E8E9CF09D86952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 Aug 2024 11:20:05 +0100
Message-ID: <CA+V-a8tW0wmpu807Vxi_e49JraoNry1Anb_Ys7rM=CpODkpKeA@mail.gmail.com>
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

On Wed, Aug 28, 2024 at 11:10=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
>
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Wednesday, August 28, 2024 11:00 AM
> > Subject: Re: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and =
reset entries for
> > GTM/RIIC/SDHI/WDT
> >
> > Hi Biju,
> >
> > On Wed, Aug 28, 2024 at 10:53=E2=80=AFAM Biju Das <biju.das.jz@bp.renes=
as.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: Wednesday, August 28, 2024 10:38 AM
> > > > Subject: [PATCH v3 2/2] clk: renesas: r9a09g057-cpg: Add clock and =
reset entries for
> > GTM/RIIC/SDHI/WDT
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add clock and reset entries for GTM, RIIC, SDHI and WDT IP blocks.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v2->v3
> > > > - Moved DDIV_PACK() macro to patch #1
> > > >
> > > > v1->v2
> > > > - Updated DDIV_PACK macro to accommodate width
> > > > ---
> > > >  drivers/clk/renesas/r9a09g057-cpg.c | 84 +++++++++++++++++++++++++=
++++
> > > >  drivers/clk/renesas/rzv2h-cpg.h     |  4 ++
> > > >  2 files changed, 88 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/rene=
sas/r9a09g057-cpg.c
> > > > index 9722b810e027..3ee32db5c0af 100644
> > > > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > > > @@ -25,16 +25,31 @@ enum clk_ids {
> > > >
> > > >       /* PLL Clocks */
> > > >       CLK_PLLCM33,
> > > > +     CLK_PLLCLN,
> > > >       CLK_PLLDTY,
> > > >       CLK_PLLCA55,
> > > >
> > > >       /* Internal Core Clocks */
> > > >       CLK_PLLCM33_DIV16,
> > > > +     CLK_PLLCLN_DIV2,
> > > > +     CLK_PLLCLN_DIV8,
> > > > +     CLK_PLLCLN_DIV16,
> > > > +     CLK_PLLDTY_ACPU,
> > > > +     CLK_PLLDTY_ACPU_DIV4,
> > > >
> > > >       /* Module Clocks */
> > > >       MOD_CLK_BASE,
> > > >  };
> > > >
> > > > +static const struct clk_div_table dtable_2_64[] =3D {
> > > > +     {0, 2},
> > > > +     {1, 4},
> > > > +     {2, 8},
> > > > +     {3, 16},
> > > > +     {4, 64},
> > > > +     {0, 0},
> > >
> > > Is it ok to have {0, 2} first entry and {0, 0} last entry on the same=
 table?
> > >
> > You mean is it prohibited to add (I haven't seen issues)?
>
> 2 different divider values{2, 0) for the value 0 in the table. You maybe =
correct.
>
AFAIK we add sentinel entry at the end of clk_div_table[], see below

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/clk/renesas/rcar-gen4-cpg.c?h=3Dnext-20240828#n415
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/clk/renesas/r9a07g044-cpg.c?h=3Dnext-20240828#n80
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/clk/renesas/rcar-gen2-cpg.c?h=3Dnext-20240828#n202
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/clk/renesas/rcar-gen3-cpg.c?h=3Dnext-20240828#n327

Cheers,
Prabhakar


Return-Path: <linux-renesas-soc+bounces-10033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE409AE450
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 14:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB0D71C214D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2024 12:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC01A1CACE3;
	Thu, 24 Oct 2024 12:00:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AD21C07F8;
	Thu, 24 Oct 2024 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729771230; cv=none; b=GQakFI7+TPrmrl+QSjUqPVEpbF2GH5QiRiTX0Rtm9UTEAfCTioxaV+xEVXljDfHqtedCY0vy4JQKY1bX3cqF1lZ7+52MtFYUvZPmd9HT3NX7P4umo3ZPUwddgNxBtdP5ZcKH8ac4PfRgYdhH5XXSCOx1grfmXFGagOdDdwt96FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729771230; c=relaxed/simple;
	bh=MNbFjLl4TCDql8wmSNEqa4NDfQghSh41C3L9T/e2F6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3vFkrXsq7YrxzXCX7yO11BseQRPq2BTP39TGNsC1otd/2gC5HFremKK5oiNRBTNoHPEGjQ8wIEpEBTp+x+kznQFO4FOYsSMar4CpdjhuecdeEM+2nMnStA38/v/wlE1zGm20/cY71GFYClNtXKYQoTyScoZb1TsxRIIdT6btgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e3c3da5bcdso8808747b3.2;
        Thu, 24 Oct 2024 05:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729771227; x=1730376027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QenuV6rOuGSY28Q2Jle6OVOQgLijNQWzQ+6F4jb61lk=;
        b=nflHHNtekEIMkTUdDTvy11BAsSfJiOlFIVLkUF/5uNFWrT4gPbksofTTGHIsKyOhVt
         imJARimq9qztMaFciAVwinHxr5Q5JlL7odXeJKOCkJcI0hy1bO0hzgtUV+1UVnVPA2T0
         6gBnBb54zS//e8e8oPgTLts/5bVUfOOpdSUf0jGOHvGQi+4iOdQD17LCADu2bgtnYK+1
         NimQglTnR0MkUgzNkj1G0JRt6WG1YIcNRXMBXy92RFx50MukpgcnOWk1okWGES19rVty
         hA/bKWE+msPpJK8pkkI/iZADwdd9tYkCgIclR6DKOvDDYHsQfjkupBFeWF5erJKh1VTS
         nIdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuOQ8Z180ZtX+PzYoKUlavg+dX84mJhHrCXE8/YcMYTyZH4oWxrmX7TbktvXtKJXLVrM2ifLb1ptk=@vger.kernel.org, AJvYcCXakRQtenkoqPbZrjPtu0vshfmfr63Pubj39zwLYrBx2mYIYfrC1ujDJ9zGfwJXowNqj3U3Vh0+oPfCIiI65eDJrCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQZiuR8JEWr5Dokg7YVh/FrL2D4DtBPJxS0suo4iGXD7UzMkH
	OrRdoAVBu5mPW/DOYGaC+JTJxQXQFgQdn8ZRyoo0J2J2DtV/S6XscdwtFqFm
X-Google-Smtp-Source: AGHT+IHpjwzIaZRb1HuldY63oKoBzZgrZN3zrsqakZg5lI2Q24gdPsjocP0M1FCSEQ/oONHMIeXq8g==
X-Received: by 2002:a05:690c:660c:b0:6e7:e92d:6c0c with SMTP id 00721157ae682-6e7f0e3398emr64355887b3.10.1729771226659;
        Thu, 24 Oct 2024 05:00:26 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5a4d30esm19606997b3.54.2024.10.24.05.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 05:00:26 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e3c3da5bcdso8808307b3.2;
        Thu, 24 Oct 2024 05:00:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbFDMOtNEQmJyIHfBLfpeJErrBKszM2LL5XjKzVKhQW9AkcKHKV3PWwJNQ3joYgvgIZf44KG0rnkG+WadoQ4M6OhY=@vger.kernel.org, AJvYcCWch12OwcE4xIJcUNxHvd19uWWK74QlOWB3Dik28ffUauNijXH1K6gzFRnPR1SQrSna1dvVK9DnNMU=@vger.kernel.org
X-Received: by 2002:a05:690c:6c87:b0:6e5:bb93:4322 with SMTP id
 00721157ae682-6e7f0fd850emr68015687b3.38.1729771226021; Thu, 24 Oct 2024
 05:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016101513.39984-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXwxWAm=XiGFw_j+L8ebmAvJx7r8oQ_Bhon6tsWX47yXA@mail.gmail.com> <TY3PR01MB11346AD911CC2A33E02538EC1864E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346AD911CC2A33E02538EC1864E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 14:00:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6-1ptM4nN=rAs58S4Oa-bao6PQ8sLndT5uPAB7na_0Q@mail.gmail.com>
Message-ID: <CAMuHMdX6-1ptM4nN=rAs58S4Oa-bao6PQ8sLndT5uPAB7na_0Q@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, Hien Huynh <hien.huynh.px@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Oct 24, 2024 at 1:51=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, Oct 16, 2024 at 12:15=E2=80=AFPM Biju Das <biju.das.jz@bp.renes=
as.com> wrote:
> > > While computing foutpostdiv_rate, the value of params->pl5_fracin is
> > > discarded, which results in the wrong refresh rate. Fix the formula
> > > for computing foutpostdiv_rate.
> > >
> > > Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk
> > > support")
> > > Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  * Used mul_u32_u32() for 32-bit multiplication.
> >
> > Thanks for the update!
> >
> > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > @@ -557,10 +557,10 @@ rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll=
5_param *params,
> > >         params->pl5_postdiv2 =3D 1;
> > >         params->pl5_spread =3D 0x16;
> > >
> > > -       foutpostdiv_rate =3D
> > > -               EXTAL_FREQ_IN_MEGA_HZ * MEGA / params->pl5_refdiv *
> > > -               ((((params->pl5_intin << 24) + params->pl5_fracin)) >=
> 24) /
> > > -               (params->pl5_postdiv1 * params->pl5_postdiv2);
> > > +       foutvco_rate =3D mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA, (p=
arams->pl5_intin << 24) +
> > > +                                  params->pl5_fracin) /
> > > + params->pl5_refdiv >> 24;
>
> >
> > The division is a 64-by-32 division, so it should use the div_u64() hel=
per.
>
> You mean,
>
> foutvco_rate =3D div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA, (param=
s->pl5_intin << 24) +
>                                 params->pl5_fracin) , params->pl5_refdiv)=
 >> 24; ??

Exactly.

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


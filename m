Return-Path: <linux-renesas-soc+bounces-7336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EC7931211
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 522AE1C225D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 10:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D1A187542;
	Mon, 15 Jul 2024 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuYE3Ukg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A14187351;
	Mon, 15 Jul 2024 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721038479; cv=none; b=I4gJ0Ew6J1u244EnXjTbq1YxyYQJme5EiB9kawUYMD5wfmfEj4egvYddwS+LlcE85Oo7lo7CBJQIZzPHbRiSIM3VxyPIgkhfjdhZAzzNJ9KmLuSTXo00j3Che3Zz1ARMOkvrpc2r0KIRhsbBhLpZZsAH8z6l+rz6QUqHhgkvhU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721038479; c=relaxed/simple;
	bh=cvtskF5eoAnrtbj2ZcVFAWrLxHptMH+5TmjsHrO9TmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVPw2HKqSQO4DLJ1kfLxa1nxCOGGGJqOC8EvFX3ndlLtLIvK8wsZxSYLA2GKYZLKNw8HqdN/hs5U4YbLStWU8pbb9/77zRL/+N6jJNQUX77FDZARBj7oX57uvBYLYGmzHTrkpCkV5IHxtClBmC8USEKUwj80Db7PjTrYvd05Fxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuYE3Ukg; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-48fe86bfde6so1360943137.2;
        Mon, 15 Jul 2024 03:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721038476; x=1721643276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlSTp+gpajOC7P7qdRROMLoOJOppx3av3sxHUMORs44=;
        b=HuYE3UkgegT1s9O3jz2HB4M5v6RwRvnpr6wp2xMv5fiSBiu2NdOE2srp/fRYE6mgrc
         RQ/aZ+fMu3d5n8C6PrSAgH+l/1iiMA4fiYkY/GjAL+fnUGe71jVKj7eT8vecCrmkUzV/
         /XKORNVVAxZjAdGWOmkwdnEiTvKG6g0Ptz5cnsRij+SVbqmmD0NLGthxCZuGXtjOxUAp
         /6Za6WIyMmx/YafVP4QSjIU+SySaEXWy+zMex8RZUFsWlR+UiasF/JrjggvXZRAdXEOi
         nYHRngg/vkgh8k+I7kAKoumd4gWTLW/l2R/+RlaOEb00zZAnyPjTfQIW+yJlrHuNIA5I
         gznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721038476; x=1721643276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlSTp+gpajOC7P7qdRROMLoOJOppx3av3sxHUMORs44=;
        b=OKzmPtaL5TKyPEdZLcHeEjnBpiUq3oqcNDmMEWBmAKbPAmiHM909GVfHQKNJ1uEiM5
         Tm9PQTfY/LLT+/Z+1JROeBgVDkecA7jeHh5ubLZiR2Vn7pR1Vp4gfQ5Y7/MErAI5CoLj
         AiRa28PAodH9DnhGgNCR91sU6eJXnX4FetKNlnoCOgjuDgeMLzhNfLoEwjAq0nv8G1XI
         ektTE4nv8zOY0RCvc/ycmpiYGE6lqA5f2hW7+Lq+IzBenEStBT4RAozIBw0X3b2kFtKe
         8la0+zaS2wfEAq1f8jz0ZgsbgLpple7IQkrn6RNSP+3kowQyl3aLGmR7lLm6oL9mucGT
         7ZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0XE0oXgRIXDq75D/GIDjJXgK287kOCbbkS2EdRU34+o74Dg0iZ3hmI21Jg2a9lnJVIQ5S/tSGnzscvGHM3H1vsSE/aeOJLQ9pjgx1GEJxikgE4xW6tkb3KReKvrTCbhwsX6cNcmeLspTr+V9B6eNy0gAUJ6uuXJpVbIL2ZcY+NMNP9fSXVWZasFY=
X-Gm-Message-State: AOJu0YyNVTyMO5G9/Ehwp4nzm+CyPE+fDM2IFD/4ExDf7V4u4rRgQLf6
	i1drH4kJniRLkMUcPXeqdCJ6cmV4m5iEzuDOyYp8gJE5ssElbpz0g2vhtYOnKJyoh+RPVB/aSN3
	g60SiyPKOdNRCLW1Unz/q8ENeia0=
X-Google-Smtp-Source: AGHT+IG0U9QLP8qK1rfdDJ5nW9FNycPToMaosftpnLhD7NRXfuZKhlNwxlpZ43ZpbXXclARwQLeYaQSZt3tWOCX/4CY=
X-Received: by 2002:a05:6102:3e84:b0:491:110e:cb03 with SMTP id
 ada2fe7eead31-491110ece05mr15481875137.32.1721038476497; Mon, 15 Jul 2024
 03:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240628131021.177866-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW-NUdK23h7_tLe5nfgXHzFmJySFNCNTciZmJeHcxNSKw@mail.gmail.com>
In-Reply-To: <CAMuHMdW-NUdK23h7_tLe5nfgXHzFmJySFNCNTciZmJeHcxNSKw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Jul 2024 11:13:03 +0100
Message-ID: <CA+V-a8tQcO-EK=eHgujaVQ2=ri00JK9d2rde5HZYxc5SSvpASg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: rzg2l-cpg: Refactor to use priv for
 clks and base in clock register functions
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jul 12, 2024 at 3:08=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jun 28, 2024 at 3:11=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Simplify the `rzg2l-cpg` driver by removing explicit passing of `clks` =
and
> > `base` parameters in various clock registration functions. These values
> > are now accessed directly from the `priv` structure.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -400,10 +400,10 @@ rzg3s_cpg_div_clk_register(const struct cpg_core_=
clk *core, struct rzg2l_cpg_pri
> >
> >  static struct clk * __init
> >  rzg2l_cpg_div_clk_register(const struct cpg_core_clk *core,
> > -                          struct clk **clks,
> > -                          void __iomem *base,
> >                            struct rzg2l_cpg_priv *priv)
> >  {
> > +       void __iomem *base =3D priv->base;
> > +       struct clk **clks =3D priv->clks;
>
> If "clks" is used only once in a function, then please use priv->clks[...=
]
> directly instead of adding another local variable.
> This applies to other functions in this patch.
>
Ok, I'll update it.

> BTW, why did you decide to have separate patch [2/4], [3/4],  and [4/4]?
> They all follow the same pattern.
>
I split them up for easier review. But I'll squash them now.

Cheers,
Prabhakar


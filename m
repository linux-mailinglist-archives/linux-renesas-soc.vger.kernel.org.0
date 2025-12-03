Return-Path: <linux-renesas-soc+bounces-25537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B6C9F62D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 15:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 0DAB43007B47
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 14:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABED303C91;
	Wed,  3 Dec 2025 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHyow/kc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97D5303A35
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773741; cv=none; b=QrMloC3sR08nK+79ZJs8nXvlXUay25YK9R9k3zRL3zeEk9X7J20GE2Clue7oUKqAy8pfaqLRSca5MIf2mWqrcqP6mDes8zyXqqouTmiYmr6eCNVo26ClNVU3fPKC/5SYUnW0CjRUVD6NuidMqjGQpqyw8NmB7GxChKQQTbuYIos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773741; c=relaxed/simple;
	bh=Ebi+MnCE/5t0U0PqzYc52NKluRypMQV5WMpgwfOYg44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCY4pglBhrAa+F9Tud3PA/Ct0plqf84gIzMVxl0kfA2QzS5VkkEd+6+dmyz/n5XGDfOVDMiK6UtRR/fiV7NbmeVFWp9UttkiWdfhXuYZe6uaUimuEWiT+tGlWeAVf1VoKj+VzqfxvoswLAegfJekf4aub8xpA4ddABgfmVe2VO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHyow/kc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9169FC2BCB0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764773741;
	bh=Ebi+MnCE/5t0U0PqzYc52NKluRypMQV5WMpgwfOYg44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sHyow/kcHU9zi9/xm2DIveeWdL2rYnmQRcYbGGNz2G9/B+faW2D+JgEe3kL64S8Y3
	 pQ3XMtJdFa70v2a+sQOzkKuebrRiiq+LOEZUo70EGPkhC+Gk3oPmLgYcKWjquFjIgf
	 fOnDG5czwV8Gt144PmUMKfc2KlNvvFiTIHfd2ZxRJ20kzh5EzLtLs29orUNjnnmGWJ
	 /heSScJE+otS2PCX1lKun15iYY89Aq/UvM6TCnRW03fXmop5JOmStEYGSOgbDkfIEj
	 AirdnAKAHKAOXd8LuWKAPRwl0Ty+IOCM+m2WMmbZ20/IVM+OTLCpeTc4bLwuP0RdUx
	 f5GrlnBL0K2Kw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b73b24f1784so39044966b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 06:55:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTni3RUKAw988VI1DoGF+gvCkZVx2tF2xAQfjZWgVB72UEWCuCaadYDZ3sqy44dBsp5MY8skv/WSpG3kJ2IeHvgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8mh+YDZMpIpZvgQxmNBExw3xzN143KIv+prGJ5l95/a0QJ3Op
	I5JHkBAyc2VXfrGV/Z3ZdpTAV5XxAYoAZXOUn9ugXZLyeLQg8rxXwakCWmpfc0ndYjRTcNa5k6S
	2DG1Z+qjWd7b92lUgntAnv+O8N/ef2Q==
X-Google-Smtp-Source: AGHT+IHkCgrvRERrLrFDTeXy1B2qCgUBmqim5+wgRWAkYDlUZ89k6F9UbvOiW59P6qHYFbLLcpAABloypkj46Ps3o1U=
X-Received: by 2002:a17:906:794b:b0:b5c:6e0b:3706 with SMTP id
 a640c23a62f3a-b79d61d25aemr381452566b.13.1764773740087; Wed, 03 Dec 2025
 06:55:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
 <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
 <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
 <5rzkayfk4o37v3xakexmjtkahb4wey2lsaiw2l3qobva5ajhr2@u3lrgkdjgk3x> <CAMuHMdWumcKQaU0hym7xdOzwYZWzhNRtH9RU45ZsLtShkkO53A@mail.gmail.com>
In-Reply-To: <CAMuHMdWumcKQaU0hym7xdOzwYZWzhNRtH9RU45ZsLtShkkO53A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Dec 2025 08:55:28 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL3kON+0p8PeYeAJO2GdW053aYFo2C20SWQSGQTGV5hag@mail.gmail.com>
X-Gm-Features: AWmQ_bmGax5MgQIaT8SmCAenzOsXCBxckgOQYmwDiMak5ftysFm6cL9v1v1yxGU
Message-ID: <CAL_JsqL3kON+0p8PeYeAJO2GdW053aYFo2C20SWQSGQTGV5hag@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 3:58=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Ionana,
>
> On Wed, 3 Dec 2025 at 10:48, Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
> > On Tue, Dec 02, 2025 at 03:19:17PM -0600, Rob Herring wrote:
> > > On Tue, Dec 2, 2025 at 10:36=E2=80=AFAM Ioana Ciornei <ioana.ciornei@=
nxp.com> wrote:
> > > > On Mon, Dec 01, 2025 at 06:09:19AM -0600, Rob Herring wrote:
> > > > > On Fri, Nov 28, 2025 at 10:43=E2=80=AFAM Ioana Ciornei <ioana.cio=
rnei@nxp.com> wrote:
> > > > > > On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wr=
ote:
> > > > > > > The Devicetree Specification states:
> > > > > > >
> > > > > > >     The root of the interrupt tree is determined when travers=
al of the
> > > > > > >     interrupt tree reaches an interrupt controller node witho=
ut an
> > > > > > >     interrupts property and thus no explicit interrupt parent=
.
> > > > > > >
> > > > > > > However, of_irq_init() gratuitously assumes that a node witho=
ut
> > > > > > > interrupts has an actual interrupt parent if it finds an
> > > > > > > interrupt-parent property higher up in the device tree.  Henc=
e when such
> > > > > > > a property is present (e.g. in the root node), the root inter=
rupt
> > > > > > > controller may not be detected as such, causing a panic:
> > > > > > >
> > > > > > >     OF: of_irq_init: children remain, but no parents
> > > > > > >     Kernel panic - not syncing: No interrupt controller found=
.
> > > > > > >
> > > > > > > Commit e91033621d56e055 ("of/irq: Use interrupts-extended to =
find
> > > > > > > parent") already fixed a first part, by checking for the pres=
ence of an
> > > > > > > interrupts-extended property.  Fix the second part by only ca=
lling
> > > > > > > of_irq_find_parent() when an interrupts property is present.
> > > > > > >
> > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > > > > > This change irq-ls-extirq and commit 6ba51b7b34ca ("of/irq: Han=
dle
> > > > > > explicit interrupt parent") does not help with the issue.
>
> > > > I just tried converting ls-extirq to a proper platform driver and i=
t's
> > > > pretty straightforward. The problem is getting that driver to probe=
 on
> > > > the ls-extirq dt node since of_platform_populate() is not called on=
 its
> > > > parent node.
> > > >
> > > > I would avoid changing the DT and adding a "simple-bus" compatible =
to
> > > > the parent nodes. The other option is to add another simple driver =
which
> > > > just calls of_platform_populate() for all compatible strings define=
d in
> > > > fsl,layerscape-scfg.yaml.
> > >
> > > The simplest solution might be adding 'syscon' to the default match
> > > list for of_platform_populate(). That's kind of a big hammer though
> > > and could break something. Not sure, but I'm willing to stick that in
> > > linux-next and see.
> > >
> > > Another option is hijack the simple-pm-bus driver which already does
> > > just what you said.
> >
> > I would prefer the second option since that doesn't impact other
> > platforms.
> >
> > Geert, since you are the module author, are you ok with the following
> > diff?
> >
> > --- a/drivers/bus/simple-pm-bus.c
> > +++ b/drivers/bus/simple-pm-bus.c
> > @@ -142,6 +142,12 @@ static const struct of_device_id simple_pm_bus_of_=
match[] =3D {
> >         { .compatible =3D "simple-mfd",   .data =3D ONLY_BUS },
> >         { .compatible =3D "isa",          .data =3D ONLY_BUS },
> >         { .compatible =3D "arm,amba-bus", .data =3D ONLY_BUS },
> > +       { .compatible =3D "fsl,ls1021a-scfg", },
> > +       { .compatible =3D "fsl,ls1043a-scfg", },
> > +       { .compatible =3D "fsl,ls1046a-scfg", },
> > +       { .compatible =3D "fsl,ls1088a-isc", },
> > +       { .compatible =3D "fsl,ls2080a-isc", },
> > +       { .compatible =3D "fsl,lx2160a-isc", },
> >         { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
>
> Fine for me.
>
> Alternatively, these could be added to the match_table[] in
> drivers/of/platform.c:of_platform_default_populate()?

That would work too, but I think the direction we should go is using a
driver as we've also been discussing on Herve's series.

Rob


Return-Path: <linux-renesas-soc+bounces-25510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCDCC9D0E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 22:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFBBB3A2B17
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 21:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8835F2F7AD6;
	Tue,  2 Dec 2025 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuWVE5xA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB423E350
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764710370; cv=none; b=P2MR0SNT5BbsRkAt8iilS4RsKbHoyv0+1copi0ayeFNKIJili7ikO7Fx3TsPqsiwiHNQvLqfLFMpRvBaZtvbT/OX3yDL/6ottEZaU3C4b7ZWF26Gsz+hPORo/H8QfZ+MeBEXMviIs7K5Q//d01RTiftQ7w/y/eX4A01b/wyTiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764710370; c=relaxed/simple;
	bh=AZASaj5aXBVLP8FVAp2pUANC9RpCBKlvtMSjV9a7KLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdUwfBFWGUtxXOY4KK9ibp32UwkYKSEMQmA0WnKcGwq8Y8tKkWVlDVp+xInR87m62cZCesoX++a+MekBv74V5wnO9yqZke1GeKfYuQAHM34KR14iLShQXSHb49pCSHHjHAmCqXzCW+KmBBMHJ0RLa9Uf9jkprELzSNzOf9+T2yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuWVE5xA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41032C19424
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 21:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764710370;
	bh=AZASaj5aXBVLP8FVAp2pUANC9RpCBKlvtMSjV9a7KLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kuWVE5xAUKf/RoJrUZHluwZNMMyyIOEbqPK1wJPuyFMYKRYusp9GI4o8NFuwoZVmO
	 QvVt9ok0NJiQFISw9ZZDaPsPjH9aStDkI7LjAox9GjKIKPs9orNnuuUsxUrbwgDhiG
	 hR2u1kZy/fe+OvZ9G3gxySVxgXRy8UYMgaaW6iw5UQeRxfMtGr1wytKBoRKT00eLwu
	 dHykF3EJz2qTNpN0cPrq4eoaO/zqenlv6FUzBDdN8ygent2GYGucY9049YsB8gk3Fa
	 8Tao9s1xqW8SCfddD8KKZL1O7+HnnSooIZ3l5b3IBMH4DfLJhqgvYPDTn2In96Fs+J
	 myQTVRC5tvVPQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b736d883ac4so836224066b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Dec 2025 13:19:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdEnokOz3+fveAfIrNVEXNQN0lsrOJJcc+Priru5TgC6Bmu8vB2oDxo/XL3X4AcV8JF2L2Ap8prhdusJjYfuWfPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNCdK8/UPY/3AakYu1mjYZ80/R4YgvJ0RUIZGv/C8CvGFGPw5V
	Ykoy2IZiUxCLpzm0+WPCH5DoFyv2utZmtEXqrvFvly8GqR0q6JqxhhGdcMay6tqyY1JLJhIpJhz
	wA5caFgaoEL5fJHjZ/AJB6XRoJovy7w==
X-Google-Smtp-Source: AGHT+IGSvertTLJx8KV/G+O5qP6vmOOBt66zoC19fcl1TNbrYXNS/rPJp4BO31NUjhkWZrh153Dkp7jy+quBZlZ+Dig=
X-Received: by 2002:a17:906:b84b:b0:b76:7b85:f630 with SMTP id
 a640c23a62f3a-b767b8643d6mr3409596366b.34.1764710368753; Tue, 02 Dec 2025
 13:19:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com> <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
In-Reply-To: <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Dec 2025 15:19:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
X-Gm-Features: AWmQ_bmTQVJ_hL0pc9x1GncG71ibSKGCHF04s-qMqZd6-07jLgk75ahA_73hYM4
Message-ID: <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 10:36=E2=80=AFAM Ioana Ciornei <ioana.ciornei@nxp.co=
m> wrote:
>
> On Mon, Dec 01, 2025 at 06:09:19AM -0600, Rob Herring wrote:
> > On Fri, Nov 28, 2025 at 10:43=E2=80=AFAM Ioana Ciornei <ioana.ciornei@n=
xp.com> wrote:
> > >
> > > On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> > > > The Devicetree Specification states:
> > > >
> > > >     The root of the interrupt tree is determined when traversal of =
the
> > > >     interrupt tree reaches an interrupt controller node without an
> > > >     interrupts property and thus no explicit interrupt parent.
> > > >
> > > > However, of_irq_init() gratuitously assumes that a node without
> > > > interrupts has an actual interrupt parent if it finds an
> > > > interrupt-parent property higher up in the device tree.  Hence when=
 such
> > > > a property is present (e.g. in the root node), the root interrupt
> > > > controller may not be detected as such, causing a panic:
> > > >
> > > >     OF: of_irq_init: children remain, but no parents
> > > >     Kernel panic - not syncing: No interrupt controller found.
> > > >
> > > > Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> > > > parent") already fixed a first part, by checking for the presence o=
f an
> > > > interrupts-extended property.  Fix the second part by only calling
> > > > of_irq_find_parent() when an interrupts property is present.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > v2:
> > > >   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interru=
pt
> > > >     controller handling"[1] to relax dependencies,
> > > >   - Drop RFC.
> > > >
> > > > [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@=
glider.be
> > > > ---
> > > >  drivers/of/irq.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > > > index b174ec29648955c6..5cb1ca89c1d8725d 100644
> > > > --- a/drivers/of/irq.c
> > > > +++ b/drivers/of/irq.c
> > > > @@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_=
id *matches)
> > > >                * are the same distance away from the root irq contr=
oller.
> > > >                */
> > > >               desc->interrupt_parent =3D of_parse_phandle(np, "inte=
rrupts-extended", 0);
> > > > -             if (!desc->interrupt_parent)
> > > > +             if (!desc->interrupt_parent && of_property_present(np=
, "interrupts"))
> > > >                       desc->interrupt_parent =3D of_irq_find_parent=
(np);
> > > >               if (desc->interrupt_parent =3D=3D np) {
> > > >                       of_node_put(desc->interrupt_parent);
> > > > --
> > > > 2.43.0
> > > >
> > > >
> > >
> > > This change irq-ls-extirq and commit 6ba51b7b34ca ("of/irq: Handle
> > > explicit interrupt parent") does not help with the issue.
> > >
> > > This is how the DT node in lx2160a.dtsi looks like:
> >
> > ls-extirq strikes again!
> >
> > I think something like this should fix it:
> >
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index 2271110b5f7c..c06c74aef801 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -593,7 +593,8 @@ void __init of_irq_init(const struct of_device_id *=
matches)
> >                  * are the same distance away from the root irq control=
ler.
> >                  */
> >                 desc->interrupt_parent =3D of_parse_phandle(np,
> > "interrupts-extended", 0);
> > -               if (!desc->interrupt_parent && of_property_present(np,
> > "interrupts"))
> > +               if (!desc->interrupt_parent &&
> > +                   (of_property_present(np, "interrupts") ||
> > of_property_present(np, "interrupt-map"))
> >                         desc->interrupt_parent =3D of_irq_find_parent(n=
p);
> >                 else if (!desc->interrupt_parent)
> >                         desc->interrupt_parent =3D of_parse_phandle(np,
> > "interrupt-parent", 0);
> >
> >
> > But really, at some point it should be converted to a proper driver as
> > there's no reason extirq needs to be initialized early.
> >
>
> I just tried converting ls-extirq to a proper platform driver and it's
> pretty straightforward. The problem is getting that driver to probe on
> the ls-extirq dt node since of_platform_populate() is not called on its
> parent node.
>
> I would avoid changing the DT and adding a "simple-bus" compatible to
> the parent nodes. The other option is to add another simple driver which
> just calls of_platform_populate() for all compatible strings defined in
> fsl,layerscape-scfg.yaml.

The simplest solution might be adding 'syscon' to the default match
list for of_platform_populate(). That's kind of a big hammer though
and could break something. Not sure, but I'm willing to stick that in
linux-next and see.

Another option is hijack the simple-pm-bus driver which already does
just what you said.

Rob


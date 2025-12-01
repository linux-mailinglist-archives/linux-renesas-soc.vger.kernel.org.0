Return-Path: <linux-renesas-soc+bounces-25469-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DE174C97DD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 15:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 552D5343D36
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 14:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4777B31A542;
	Mon,  1 Dec 2025 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l976On9Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211B231A056
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599691; cv=none; b=PhLV0e1zDHF7eXKO6GtCsbHeMs2iLjJ0a3Pym86N4dXSBxioUqtQxIQeWz9td07wDov+YDw6ARsHiEOiSp22MSNS5fWJutCQ4N0nYe/S718LOpZ9e3ptsBJXUeSCtIOUwgLx9b+JDTtnbmos4UOL/4Uny1b0Jm+BeKcz1NAt7J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599691; c=relaxed/simple;
	bh=o3Z6L0iRu7JBb6a+rLYFwtgDizArktN6c8/NKR6sbew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjxGCnKHtZ+3RkFTOOfK9OluW8BOxHUSDcLXc4s3EDo/CtESv97towU8oWCnovX1RVNnoPUdZvZ5az89iePoEJCjOGv7zXLzzqITtTqLMbDkfvSr1Z5sQQMBW72SHNHoWj8VBSnZjl5M23sSuja0bHWudAfD7f4GVJLqT0Ek2s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l976On9Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EB2C4AF09
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764599690;
	bh=o3Z6L0iRu7JBb6a+rLYFwtgDizArktN6c8/NKR6sbew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l976On9QQR85pAQl0obkl9Ctdj7dLR94Mzv/pMSxc/2Juqy4+ASzM/hFJgedWOTLJ
	 Ct2FQ6DLKw6Of/SVMHF4cvRJwqnoIxBanjgiChnjjkhsS27igj1GMBnHHF2oFGop/s
	 LD96vQGZZ9r7oNmG1hBorWlS3QX/FwT27jTGFySSC/9ps9o8b2IpCWExrI6BxNjll0
	 c7/z+nZ++naPZJBS/g1kbUfjWmah/Gq4vcQQHd8WMJXVkTZudLoRVSoiO6fOONVjx1
	 vGcwrFq3/jgT3yUJzoiJfC/1gtU1to+5bNkU6DIZTy7tV2AiiYXniBWk1FF+fY2W79
	 u7tIu5wxke9Uw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so523860866b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Dec 2025 06:34:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7srHMmb+08GLHd4XV943VVGZyxPuaJxdmIVpR9Yus7102Xms4VA7xRF5HwWgVBSikmUD+3kcdWfn14QBX7yJbuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiVxWHm/f0XvTT/6g0rBn/1P2x2jFpMRw9+ZhWuB7UndV4eruL
	WRpzJmTuDvTsyaNWp4N2Ab981BZc2DQ/ldmPEEUs9IxD5Whzc7TsnNF6wwwnpCSmudP2yWa6CsG
	TWeVE10XfEUYU5ADJAlfOwPzAk6V54g==
X-Google-Smtp-Source: AGHT+IGZh9DruSG0PEbPS75zrnc5WGkF/VK+YNeCQb80LR7bexhyB4OvRJ5DQoBp3aPrktG+XBwn8tcbNGl/H/0sW/8=
X-Received: by 2002:a17:907:94c9:b0:b72:9961:dc04 with SMTP id
 a640c23a62f3a-b7671703d94mr4713493666b.28.1764599689008; Mon, 01 Dec 2025
 06:34:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com> <CAMuHMdXsZwDaT8L5z9KzyX0FF4WVbvZhsGAtSK7pJ=nCr4hE4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXsZwDaT8L5z9KzyX0FF4WVbvZhsGAtSK7pJ=nCr4hE4Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Dec 2025 08:34:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKYzWQr7AJFSHj4gJPDtxogFrPk=7NS0HKa-ay00fpV_w@mail.gmail.com>
X-Gm-Features: AWmQ_blyKVkMKCugvCh0EMBfIrbVAJgwbaORavR9EyO3QVbtZQXo5zZRXe74wm0
Message-ID: <CAL_JsqKYzWQr7AJFSHj4gJPDtxogFrPk=7NS0HKa-ay00fpV_w@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 6:52=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Rob,
>
> Thanks, I was just looking into this...
>
> On Mon, 1 Dec 2025 at 13:09, Rob Herring <robh@kernel.org> wrote:
> > On Fri, Nov 28, 2025 at 10:43=E2=80=AFAM Ioana Ciornei <ioana.ciornei@n=
xp.com> wrote:
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
>
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
>
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
> >                 desc->interrupt_parent =3D of_parse_phandle(np, "interr=
upts-extended", 0);
> > -               if (!desc->interrupt_parent && of_property_present(np, =
"interrupts"))
> > +               if (!desc->interrupt_parent &&
> > +                   (of_property_present(np, "interrupts") || of_proper=
ty_present(np, "interrupt-map"))
>
> That should indeed restore the previous behavior, and find again
> "interrupt-parent =3D &gic" in the root node.  However, wouldn't it
> be more correct to follow the approach used for interrupts-extended,
> and use the first interrupt parent from the interrupt-map (which is
> coincidentally &gic, too)?

You might notice this binding is in the interrupt-map abusers list
which is basically the list of cases that the interrupt parsing code
should ignore 'interrupt-map'. So I think the less we look into it,
the better.

I think we should do the above for now and then revert it when the
ls-extirq is converted to a proper driver.

Rob


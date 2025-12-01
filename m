Return-Path: <linux-renesas-soc+bounces-25436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE017C972EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 13:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A3BA3A2A0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 12:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313103093AB;
	Mon,  1 Dec 2025 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l09Kox3u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAE83054E8
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590973; cv=none; b=ONiocSaFgyzO3ctjLQFry6soahLdmkRgFImH5UShunwU7J7NhNKNEMr9UHExx3PiEldBkvgnpK7lbwPtySkgJUnO7wCAmmuQ+7lHjQ3mmAxt61sfsdBnATFkSsjhxLbhw0Ru1RIelbDyBQCwQR7n+FrszJUsWfVu8pOJwzh3XA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590973; c=relaxed/simple;
	bh=V7/+ERyp4pNIFjCspoz+ZgEfK/xlH8w1gbN3iPr+wDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZx4z/3uAoYGXdOkcXHun50gvvho2Q+5KG2KwbGaebdu2eYPq4dQHTFUzIg/lYLSj/hiTzAD7ZOwWRwzXrUG7pOIFImA/19sudFGJgfIX0jjjBmTT6ROOxhj+taYe/EayH7uim3oOGL/V9GxaMFGHnHOzDe/JutaJsj/acP0ZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l09Kox3u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A3BC116D0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Dec 2025 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590972;
	bh=V7/+ERyp4pNIFjCspoz+ZgEfK/xlH8w1gbN3iPr+wDA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l09Kox3uckV32NzqZoBP49CTltrQrS9tJ30UkMTZH+O8lM+1eWB6CQ0blIT6V7l7Z
	 MaxITZEHDLg5JyjbU/IpQMUAultHUHb+MxK+kkivjUBhGUewI3JVhWT1LDzjxfXCvT
	 WIKzzu11+OIJjwiijArJwqX5YWJshASqrYMysX5JZCWmSVTi06+AUMnPmeTq2vHkz3
	 ldQ9sRa5vZHKJmKoy9vwzQzhPg2lVwvRUaJOyWwJZscCVTIfzxRcaGuMuLBZtut9jX
	 T/Y/2rlNSKn2rI18j1DVBqsT3/xUBgDgEGlFHaysvdr74lBh0NHqBQ+WlgAYgdP9QW
	 /suIX4RgjygNA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so438504a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Dec 2025 04:09:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLztL8X83aK2ZizmidYQAh+lBseB+NGp7a0Wk1XSwVmIVeSyd5aL/CCWN7tIIpEGLjOhhLS77eXfOVUDJHe7b5Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFDbzH4/W3WUGZxRuEvK85/dM/waCLsItsGagxTQdeDvbtjN3t
	PNy7e5p3nhmE0KTsut9Dj0fl5XkhBlStIGODdmxQE8tsPOFEdIitMY7m942mjIuclF90TEv8Mdn
	21EEcSbZQ8B9VJfBvvxyvwTmL5/N2jw==
X-Google-Smtp-Source: AGHT+IEcDturveeXbAPOvI03t+2mfqN/gd2vN2Z1+zAFtx92TBPjSq1v9AIskB1QKnZO/wMhbOKRn/nC/N68SlC2IZA=
X-Received: by 2002:a05:6402:24d4:b0:647:550a:2f3a with SMTP id
 4fb4d7f45d1cf-647550a2f6dmr10431326a12.5.1764590971288; Mon, 01 Dec 2025
 04:09:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
In-Reply-To: <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Dec 2025 06:09:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
X-Gm-Features: AWmQ_bll_oC_tgf1b5ZIAhVC1cA-X0XmZsvsQaxWAPl7DDgn0OlVRlT9HA5H8IM
Message-ID: <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
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

On Fri, Nov 28, 2025 at 10:43=E2=80=AFAM Ioana Ciornei <ioana.ciornei@nxp.c=
om> wrote:
>
> On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> > The Devicetree Specification states:
> >
> >     The root of the interrupt tree is determined when traversal of the
> >     interrupt tree reaches an interrupt controller node without an
> >     interrupts property and thus no explicit interrupt parent.
> >
> > However, of_irq_init() gratuitously assumes that a node without
> > interrupts has an actual interrupt parent if it finds an
> > interrupt-parent property higher up in the device tree.  Hence when suc=
h
> > a property is present (e.g. in the root node), the root interrupt
> > controller may not be detected as such, causing a panic:
> >
> >     OF: of_irq_init: children remain, but no parents
> >     Kernel panic - not syncing: No interrupt controller found.
> >
> > Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> > parent") already fixed a first part, by checking for the presence of an
> > interrupts-extended property.  Fix the second part by only calling
> > of_irq_find_parent() when an interrupts property is present.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > v2:
> >   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
> >     controller handling"[1] to relax dependencies,
> >   - Drop RFC.
> >
> > [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glid=
er.be
> > ---
> >  drivers/of/irq.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index b174ec29648955c6..5cb1ca89c1d8725d 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_id *=
matches)
> >                * are the same distance away from the root irq controlle=
r.
> >                */
> >               desc->interrupt_parent =3D of_parse_phandle(np, "interrup=
ts-extended", 0);
> > -             if (!desc->interrupt_parent)
> > +             if (!desc->interrupt_parent && of_property_present(np, "i=
nterrupts"))
> >                       desc->interrupt_parent =3D of_irq_find_parent(np)=
;
> >               if (desc->interrupt_parent =3D=3D np) {
> >                       of_node_put(desc->interrupt_parent);
> > --
> > 2.43.0
> >
> >
>
> This change irq-ls-extirq and commit 6ba51b7b34ca ("of/irq: Handle
> explicit interrupt parent") does not help with the issue.
>
> This is how the DT node in lx2160a.dtsi looks like:

ls-extirq strikes again!

I think something like this should fix it:

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 2271110b5f7c..c06c74aef801 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -593,7 +593,8 @@ void __init of_irq_init(const struct of_device_id *matc=
hes)
                 * are the same distance away from the root irq controller.
                 */
                desc->interrupt_parent =3D of_parse_phandle(np,
"interrupts-extended", 0);
-               if (!desc->interrupt_parent && of_property_present(np,
"interrupts"))
+               if (!desc->interrupt_parent &&
+                   (of_property_present(np, "interrupts") ||
of_property_present(np, "interrupt-map"))
                        desc->interrupt_parent =3D of_irq_find_parent(np);
                else if (!desc->interrupt_parent)
                        desc->interrupt_parent =3D of_parse_phandle(np,
"interrupt-parent", 0);


But really, at some point it should be converted to a proper driver as
there's no reason extirq needs to be initialized early.

Rob


Return-Path: <linux-renesas-soc+bounces-25530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC88C9E9C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 10:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C335E34991D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 09:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097602E093E;
	Wed,  3 Dec 2025 09:58:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4732E041D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 09:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755893; cv=none; b=OBz25tEsyvj/cGWO5f0N9/eOLJqyHfNGvm7987BjNjttccjMFnmzOEdseEHowB/7P3Oy0UNnRanMBAS6ujpk3B0+UWvVurueMv6zJDaleCL1sTnmQ9R8vYZ8VEk2uLkmvtqnHniJcDK9HELJ7B93fZbZZkM/Nci9lZjA4MbWqWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755893; c=relaxed/simple;
	bh=YAFPxdupWUFxop2aj04TfEB6sEAT7or4x1FgdjfuJsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtMhHMuUw1R8JvoElXYH2wA2BljZNoOxPjxYzH+8R4VVxC7cvBoQnT2kBMqhMG0YOoUOa1Gt+2XIR7gvp5DHk9i1dvYVGnnz7CUDvdMo68ah9zEsn+ZyPfKNkbEusqDSMpyiXDwuSsYiacrQ7H+u9AEYgH4rew+RgYys8gi4JWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5deb0b2f685so501342137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 01:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755891; x=1765360691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEiUmc2Mo7T6/EfgHh7KJK7Yklp38OsDecqZ5en7MfQ=;
        b=pYzcKWLitIPMplKBb5gMyC7l8ynivYGYe5hHxoy12BRNLDpi9gHzhz4FteZXoJm6t8
         7ZADBrWBhxnULKWXJaKxLYWG+cJAYFdfhdhnDEJjmaIFUieWpAJ6pdugA6O3XjXOKws/
         cjPB13jWaxixL1Nq0gFbis5Tmoiu6m6c8oaJnkwQ48Hh6oqAI0h8P5zrbkExPJPTWNBt
         fXJg2ppyCGAa9s+kb1epUu9YbEdWboP85aCYXRWiXBVPz7JmG0knNkp5d7MqSeXM4+Hy
         g+Ws7he7zZ9JRaKUoX0xGXTiwu4CHKCVJJ0TcmY0Fzmi7fW6+8/yKJMLkw2WYN6BLwhR
         Ktzw==
X-Forwarded-Encrypted: i=1; AJvYcCVcRJWhic7FJ4b0CRtKRD4/59W4mgd5DC0eKxibBoa4rYV5lWP1C5VSxrb99wThK4GCq9DV+oRrq/HEsCIdrPwWPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxetlH6oKASldCaTJDMi9vFt6a+0JfiPCXesqajH5SjFPmnWmCc
	lXzgoBSaPgJhWephHN8BJc47ZWNdW9Y5jzGw1Vi+KKfUz9/CiT+/LYUalXAdbPhE
X-Gm-Gg: ASbGnct6ZYdOTdqsXg7/dNka+sDpAmgXqcoY/PN0THTofrZ+EMUydNLOMbSDtOBEb5t
	rdKoaz/Zl0ergsQTFVTgpKLlZ2+rXkxEQy7igvJxHCDnU8c1VSDll4adjueTh+aiv+6he+sC6/n
	k0LPQ5zFpQ8GotBUpPMGLJyvozEiw5ICtfciBNbEyuOI29w9zWJiYTXQtGE4iiyehTu8ypZM8ay
	pePLl3hv8IzUKS4bk4fR2izOItoqsOloqdAeb2KK6A42G3sptyHw3qu8N1Z73JUprNm2/OzmDJN
	6eStwAVwsi4H3m6W3EBlnjXRtKBCqxpVIvxTsncVs76Dusplfw8rDGVTx25NtweZaEdKL7UzpbV
	5yX2W6OzyqS9wYAIRJxyCSPRNx5WyWr7/ANwE1NQfJaPR0cjThM/q0a65Di1Y/4yZocllx8UvDr
	9VVjWw4wcxJaFPNDe/dYmlAt+K1jUggWeECn44Phc6+SekGAzS
X-Google-Smtp-Source: AGHT+IEsm8ZcuHdK8c2IM1EDsilOTPDzIaHSz1mkuTRPUq8QxKUJfSmqHOg88+lqyzygtpRETkelSQ==
X-Received: by 2002:a05:6102:a49:b0:5d4:1499:99a4 with SMTP id ada2fe7eead31-5e40c7f3573mr2813646137.13.1764755890807;
        Wed, 03 Dec 2025 01:58:10 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d94f2d2sm7045050137.8.2025.12.03.01.58.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 01:58:10 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9372164d768so519815241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Dec 2025 01:58:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBQGadN4/RrjqTVk7Z5e9hueoNXmASrU6ioRzPuOIikQ83o/khtqi5z1CVCvrEs98O1A8/YwpH4JYI8DXoL8heLA==@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:5d4:1499:99a4 with SMTP id
 ada2fe7eead31-5e40c7f3573mr2813640137.13.1764755889796; Wed, 03 Dec 2025
 01:58:09 -0800 (PST)
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
 <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com> <5rzkayfk4o37v3xakexmjtkahb4wey2lsaiw2l3qobva5ajhr2@u3lrgkdjgk3x>
In-Reply-To: <5rzkayfk4o37v3xakexmjtkahb4wey2lsaiw2l3qobva5ajhr2@u3lrgkdjgk3x>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Dec 2025 10:57:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWumcKQaU0hym7xdOzwYZWzhNRtH9RU45ZsLtShkkO53A@mail.gmail.com>
X-Gm-Features: AWmQ_blCEK01_Lczu_uMObyo4dsIf5LXvG5VyIcPEzsBrrm0vi_AIT5ljCOk_wo
Message-ID: <CAMuHMdWumcKQaU0hym7xdOzwYZWzhNRtH9RU45ZsLtShkkO53A@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
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

Hi Ionana,

On Wed, 3 Dec 2025 at 10:48, Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
> On Tue, Dec 02, 2025 at 03:19:17PM -0600, Rob Herring wrote:
> > On Tue, Dec 2, 2025 at 10:36=E2=80=AFAM Ioana Ciornei <ioana.ciornei@nx=
p.com> wrote:
> > > On Mon, Dec 01, 2025 at 06:09:19AM -0600, Rob Herring wrote:
> > > > On Fri, Nov 28, 2025 at 10:43=E2=80=AFAM Ioana Ciornei <ioana.ciorn=
ei@nxp.com> wrote:
> > > > > On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrot=
e:
> > > > > > The Devicetree Specification states:
> > > > > >
> > > > > >     The root of the interrupt tree is determined when traversal=
 of the
> > > > > >     interrupt tree reaches an interrupt controller node without=
 an
> > > > > >     interrupts property and thus no explicit interrupt parent.
> > > > > >
> > > > > > However, of_irq_init() gratuitously assumes that a node without
> > > > > > interrupts has an actual interrupt parent if it finds an
> > > > > > interrupt-parent property higher up in the device tree.  Hence =
when such
> > > > > > a property is present (e.g. in the root node), the root interru=
pt
> > > > > > controller may not be detected as such, causing a panic:
> > > > > >
> > > > > >     OF: of_irq_init: children remain, but no parents
> > > > > >     Kernel panic - not syncing: No interrupt controller found.
> > > > > >
> > > > > > Commit e91033621d56e055 ("of/irq: Use interrupts-extended to fi=
nd
> > > > > > parent") already fixed a first part, by checking for the presen=
ce of an
> > > > > > interrupts-extended property.  Fix the second part by only call=
ing
> > > > > > of_irq_find_parent() when an interrupts property is present.
> > > > > >
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > > > > This change irq-ls-extirq and commit 6ba51b7b34ca ("of/irq: Handl=
e
> > > > > explicit interrupt parent") does not help with the issue.

> > > I just tried converting ls-extirq to a proper platform driver and it'=
s
> > > pretty straightforward. The problem is getting that driver to probe o=
n
> > > the ls-extirq dt node since of_platform_populate() is not called on i=
ts
> > > parent node.
> > >
> > > I would avoid changing the DT and adding a "simple-bus" compatible to
> > > the parent nodes. The other option is to add another simple driver wh=
ich
> > > just calls of_platform_populate() for all compatible strings defined =
in
> > > fsl,layerscape-scfg.yaml.
> >
> > The simplest solution might be adding 'syscon' to the default match
> > list for of_platform_populate(). That's kind of a big hammer though
> > and could break something. Not sure, but I'm willing to stick that in
> > linux-next and see.
> >
> > Another option is hijack the simple-pm-bus driver which already does
> > just what you said.
>
> I would prefer the second option since that doesn't impact other
> platforms.
>
> Geert, since you are the module author, are you ok with the following
> diff?
>
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -142,6 +142,12 @@ static const struct of_device_id simple_pm_bus_of_ma=
tch[] =3D {
>         { .compatible =3D "simple-mfd",   .data =3D ONLY_BUS },
>         { .compatible =3D "isa",          .data =3D ONLY_BUS },
>         { .compatible =3D "arm,amba-bus", .data =3D ONLY_BUS },
> +       { .compatible =3D "fsl,ls1021a-scfg", },
> +       { .compatible =3D "fsl,ls1043a-scfg", },
> +       { .compatible =3D "fsl,ls1046a-scfg", },
> +       { .compatible =3D "fsl,ls1088a-isc", },
> +       { .compatible =3D "fsl,ls2080a-isc", },
> +       { .compatible =3D "fsl,lx2160a-isc", },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);

Fine for me.

Alternatively, these could be added to the match_table[] in
drivers/of/platform.c:of_platform_default_populate()?

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


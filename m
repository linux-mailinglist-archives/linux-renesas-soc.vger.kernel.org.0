Return-Path: <linux-renesas-soc+bounces-11606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA1B9F8E1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53BF016C365
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973771A83E7;
	Fri, 20 Dec 2024 08:42:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271EF197A8F;
	Fri, 20 Dec 2024 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684129; cv=none; b=IBZlkpFxt+AZyWw50AxKuDn9yZSZioPZcnu44qUrVxMRBVj9kKHXujq+E9BrvkzVfIQgEBKasIcaDt8kjH8syInZXNLuhLcVuCxAsmWssfbcCB/iKCZKegKjj/imYuiMM/P5k7XBnrukaMzxbclZNxnP1Z3oogqnp9nBE0NnVTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684129; c=relaxed/simple;
	bh=xC6OyuU4/k5dcJzQ0dGHNVDdJGFWFi3RraPSZcU9nzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7LscefuAMYjFGtZr0alZVKom/VMZVGbubNoQ+R6PKZY+WID9TgdGdPuw404qxwsHusjPmXOW5Tnxn61+sU+RNOo/0JpPvrjeCz7zSaMJu/cug7AsRw5zv+YPucG4GywJRLBAXg7LzEtvCJ7rQXxM8/1bYgcB7pBjfMDRyQIeGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51619b06a1cso907989e0c.3;
        Fri, 20 Dec 2024 00:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684124; x=1735288924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDMNInSv1RvKE9O+T8QKsBi9B8/JQ3ymFOYC0JdhAao=;
        b=pFbMwewRoy9nKDc99mTq6yr1ZBqWJeR8DKeL0Ea+u7qOwOQHIN1jgjN0eHEAGtrelJ
         sCwtvObPtJj1SwBuNY8votxr/XEpZ/pus7LeN4w07quGQt135XrV50VRTszXcgLCKbzx
         q2gTzJ62DAnLuLUmUtCTcXye/+lrGuu8v0bVik9l43Rt7IbefaPR+euzB9Rhf/wTSkhS
         JJHku2/+BMjuJ3NwgwSTq3yZvR9oermBeb+P2wPHrTPabu38HAohHmugmNw2BMjPTD02
         oTK50OuQHYA8BeDQTTaSc7DlJ7XNrGyuh6Vji77CBhlQ9VxdnPuJ2tLZXDJ2ScuH5U+C
         l7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU71dUy+WPp1VBxJc84QRQV3pjLrW8yiX67El34z8qEWNY2Kz+hBy3cTi28g5wfUGkRbV8TXS81JG2BbXgW@vger.kernel.org, AJvYcCUdSgCW47FeKqrWwcO1TTnljW24on/heNNx8wHOl2E9dP21be2mr71H6og7KKyiovtVyxVe7laK6Bs=@vger.kernel.org, AJvYcCWfnpORALA+Ea9BHX2S6CfSfS9WFtENxE7iL/133VKYWjQdGFqaD+0SiWczDbYB2CwyR4Jl/2v9RNHuaiQsgZzX+zg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3GrMxa7lD1ENnHge7CwbWspr92l2jpaic9Uk5RvS5IOdm95PV
	DWSayAeRDxgUQdNM2Pa5YMPTBsXFRcWHpxeSl4K7O/Ccb0rYMWWNM0j273Y4
X-Gm-Gg: ASbGncswfPCrCAPufUXiqEhEUL7MzoBCzHQH5mtLioCF2aJ8CnPyVefyBR/hG5rCOU3
	ubLu3OShulYITKvbEm7fButRusA+CRupJMCiohHQBLp4tnd23rtxSTu3wsVek/kuBvM6DDQX4u5
	8QCa3w92C5p+ewJ5n4swk7EIAWDa3g8uJsRt6eKQSWGmvDc0Q8Ghdk+RTg660vK3rnbEyDUx6td
	NYJl98eGpXE0KJ1rFRQglbLhasp2MNLdfMYC0pNV43twtXrNzwnHxqLoNpydQ+dNZwUSTufTKeR
	OEp7KpvNMfcWMyf0rZc=
X-Google-Smtp-Source: AGHT+IHIzk/9O/gsMFEzE6nL2yZMrGsPmfTIBg0iUBaBED2I9m3yy/UavQN0s+e6TUjr+kNEjroQRw==
X-Received: by 2002:a05:6122:2490:b0:518:a287:56e3 with SMTP id 71dfb90a1353d-51b75d3cd79mr1499651e0c.7.1734684124327;
        Fri, 20 Dec 2024 00:42:04 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68d08df2sm321008e0c.47.2024.12.20.00.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 00:42:04 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4affbc4dc74so884196137.0;
        Fri, 20 Dec 2024 00:42:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKPi7uh4nXUU+ov8vupa/MWjDJwqkZNdv/+MTj9CKEkb09+iPi6DmtnObSnyD12soMDKKFhYFLBTACe/NvvjjCRiQ=@vger.kernel.org, AJvYcCW+T3EMRMcuKkp3YDZagWWShiz+I2PxQpm9v3d/iP/E9vgF5KPWhkIo0qcOa+szvKKMKS/URfEOzP8=@vger.kernel.org, AJvYcCWSTiAuMEMtixhGTSfU5KSYTvSaoLGI9Nko9vHB2vsDEku+9R0TBYS4oqYDK9oCFt5sbIMxpwreoHuAcD48@vger.kernel.org
X-Received: by 2002:a05:6102:419f:b0:4b1:11c6:d3d2 with SMTP id
 ada2fe7eead31-4b2cc472ec8mr1784780137.27.1734684123793; Fri, 20 Dec 2024
 00:42:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218142045.77269-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVz95gXsYpF57sDJ4Y_by0chEuzgN-Bz-KZpzycZMrtGQ@mail.gmail.com> <CA+V-a8vMYFT6VgCjS-OJnaOON3SOkAhYKN7-RvFqA35se+VUkA@mail.gmail.com>
In-Reply-To: <CA+V-a8vMYFT6VgCjS-OJnaOON3SOkAhYKN7-RvFqA35se+VUkA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Dec 2024 09:41:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUDABcDXRemYLAXEh3cEMQqUrmhdeBCJm4mXhnHGrALKQ@mail.gmail.com>
Message-ID: <CAMuHMdUDABcDXRemYLAXEh3cEMQqUrmhdeBCJm4mXhnHGrALKQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: rzv2h: Fix use-after-free in MSTOP
 refcount handling
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Dec 20, 2024 at 9:24=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Dec 19, 2024 at 4:20=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, Dec 18, 2024 at 3:20=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Avoid triggering a `refcount_t: addition on 0; use-after-free.` warni=
ng
> > > when registering a module clock with the same MSTOP configuration. Th=
e
> > > issue arises when a module clock is registered but not enabled, resul=
ting
> > > in a `ref_cnt` of 0. Subsequent calls to `refcount_inc()` on such clo=
cks
> > > cause the kernel to warn about use-after-free.
> > >
> > > [    0.113529] ------------[ cut here ]------------
> > > [    0.113537] refcount_t: addition on 0; use-after-free.
> > > [    0.113576] WARNING: CPU: 2 PID: 1 at lib/refcount.c:25 refcount_w=
arn_saturate+0x120/0x144
> >
> > [...]
> >
> > > Resolve this by checking the `ref_cnt` value before calling
> > > `refcount_inc()`. If `ref_cnt` is 0, reset it to 1 using `refcount_se=
t()`.
> >
> > Thanks for your patch!
> >
> > > Fixes: 7bd4cb3d6b7c ("clk: renesas: rzv2h: Relocate MSTOP-related mac=
ros to the family driver")
> >
> > The description (from your [PATCH 2/5]?) does not match the commit.
> >
> Ouch!
>
> > Fixes: 7bd4cb3d6b7c43f0 ("clk: renesas: rzv2h: Add MSTOP support")
> >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > > @@ -565,8 +565,12 @@ static struct rzv2h_mstop
> > >                         continue;
> > >
> > >                 if (BUS_MSTOP(clk->mstop->idx, clk->mstop->mask) =3D=
=3D mstop_data) {
> > > -                       if (rzv2h_mod_clock_is_enabled(&clock->hw))
> > > -                               refcount_inc(&clk->mstop->ref_cnt);
> > > +                       if (rzv2h_mod_clock_is_enabled(&clock->hw)) {
> > > +                               if (refcount_read(&clk->mstop->ref_cn=
t))
> > > +                                       refcount_inc(&clk->mstop->ref=
_cnt);
> > > +                               else
> > > +                                       refcount_set(&clk->mstop->ref=
_cnt, 1);
> > > +                       }

Or simply

    do refcount_set(&clk->mstop->ref_cnt,
                    refcount_read(&clk->mstop->ref_cnt) +1);

?

Still, you risk some janitor replacing that by refcount_inc() regardless...

> > >                         return clk->mstop;
> > >                 }
> > >         }
> >
> > This makes me wonder if refcount is the right abstraction?
> >
> You mean as discussed on irc, refcount per mstop bit instead of groups
> is not OK too? Do you have any other better approach in mind?

I mean if you need such silly workarounds to do a simple increment, is
refcount_t the right abstraction, instead of a plain atomic_t?

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


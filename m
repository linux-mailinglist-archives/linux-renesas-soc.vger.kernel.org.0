Return-Path: <linux-renesas-soc+bounces-11624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D69F8F22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECFF17A2C5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAFA1B043C;
	Fri, 20 Dec 2024 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MO6RdnoY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3897C1B21A0;
	Fri, 20 Dec 2024 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687440; cv=none; b=TvErb1G2yP6YEx5R37hGmIrltKdJV0yGfM6P0lLpLL+nBVx3arjdFKQroqXbzgDwBU/2qeH5IN0sZFeGDZrfQctl9APO5iJWXsEszzhHVTe/Ydd1U83Pqu54Kie0XcSAlif6Dook9JFLKHyK+OOh5So4chS+Y8tsBw6mZA/INsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687440; c=relaxed/simple;
	bh=M6vp6o513sej+wtmRd9sn3xUAaosqcRDTsMpj90iJpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFq+D5ud2ZocjgUHMDZ4uHIktW9FndJANFUlt0PgDtZ883XFHe7b//d0ueJf0R8yu6piKot1frgL+HrZ6LNLzlp2JKDN3NEyV5TSBxntcc0cR9Exbz+0xpIc03C0+y5ERp3lb5S4bgv9SVdNWf5PegHewo6lz881uCK4IIHHabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MO6RdnoY; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5188e0c2b52so511665e0c.1;
        Fri, 20 Dec 2024 01:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734687438; x=1735292238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPmnfcpFLsuSaSv65bQoDQp6Z3PFnbR38VLgkD78qdg=;
        b=MO6RdnoYIlHG5PNWWWbVUupojI1M7/XYUT9bmC3480S0B+s63JNcyc0pRzdi0Key5Q
         jH/m7YzM/zEoQ4Gg03C1dJNH696UPfhHOObxYHbejtJu3QwIeoSZX1CjKR3eKSEoDjsT
         LDSRRSLfWFpP36KximzN8QMjzXmNeCf3XSyhs2CZ6MNObOEgEAZY/xi0jlahXMAt7a2y
         te7wXzpY+cE11qjJla3SHSXxDoKFSEOOV5JeDokRIlA+wvuzMMJi1lnW0G8x/aPB+8yw
         l7otjK17hgA3oflBICRKpgPoQobO8EIb0n1PLIvvljtEXchT+J0ANxGY2BW9Sj0oirB5
         ipjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687438; x=1735292238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPmnfcpFLsuSaSv65bQoDQp6Z3PFnbR38VLgkD78qdg=;
        b=bMRTYATXrrLpdP9YDeSWZb1pftYxe+4aqJ0DCDeCUMoYmvpaIWesKu5jyiovKQW9FD
         QcyNKATQ++KQ0mXH5xOQ7U1Zojx4cADZX6J9Q8rY9wc6j9PD2gibhBRJJ1jB3NvT2KLo
         FQMApbaC8WCJTOGP24ikxTh/xBS8UagWykSAUuLYaydsqzfkmoPx6OL+SGJIWW3trdpw
         pfj6SZqmo3X1RxV0/++4HdB+cN0blRPxhQukW62qRlQsBnVN3TRoTjr2duLO5JxRXhmf
         0gyhrEaKpqkesfZjbc9TnF8YiPBhlKYSPvZ0AHK287kamERSlxJ3wgc1mMnWhGTNCAW9
         FVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBYIe6SSHxHJD1pwVgQd0ZLW38+NAnIGEysLsdbcfyKOqDYcDaNZc/awiVtbo3HAisGdFdo8XT3Vo=@vger.kernel.org, AJvYcCW2TlOT1HuTwUBpzv2rgGBcPiAXABYOKjpuelpGE0VfN8CPNqp3aUzGvCjTJC/iqMjwB8VnNwG1mJyk6uWXzB9iYG8=@vger.kernel.org, AJvYcCXRWbghsu//fjtqm2/5i/6Ehm2bxO+6oGKtfsUv146Q+bC2n0gawhI3twBMJPMd660Zd37SS7JhJ930oM6f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy857Ltr0WQL/xzD58sXvNu5STiOuXFfhfrkXW5/smibscO8QXH
	Y61ch/2ood8oHOaZzxzOqjaKB9454YpF/dKi0hvZqxF3gKz9AJAQNRFfDKJjlBdTJS/0ZTf2xUt
	vkO1lTWpjggNramtn9iB/jnS7qZY=
X-Gm-Gg: ASbGncum+2Kljv44FdB60n3IPgiPSwrk8BU44NOwXJ+h1MFk7fKeDfywgvOZtJ39/5H
	R/ZTv1hx9Yuav+nXkoXlHatNo8k/PS3fD/GNOAWk=
X-Google-Smtp-Source: AGHT+IF6nTixpo4pxyLE4uRS9dnOBpuDX62nFXKv29quCn9cPeoQb5nyS/fU/izPgLMe59a2uBsEiCOVt9kIeJIUjjI=
X-Received: by 2002:a05:6122:240a:b0:515:3bfb:d421 with SMTP id
 71dfb90a1353d-51b75c5a219mr1783790e0c.6.1734687437910; Fri, 20 Dec 2024
 01:37:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218142045.77269-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVz95gXsYpF57sDJ4Y_by0chEuzgN-Bz-KZpzycZMrtGQ@mail.gmail.com>
 <CA+V-a8vMYFT6VgCjS-OJnaOON3SOkAhYKN7-RvFqA35se+VUkA@mail.gmail.com> <CAMuHMdUDABcDXRemYLAXEh3cEMQqUrmhdeBCJm4mXhnHGrALKQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUDABcDXRemYLAXEh3cEMQqUrmhdeBCJm4mXhnHGrALKQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Dec 2024 09:36:52 +0000
Message-ID: <CA+V-a8twbRisXD7ThVjpPUR-E7bH+Agqx_OsL34-DqwM=jmSfA@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: rzv2h: Fix use-after-free in MSTOP
 refcount handling
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, Dec 20, 2024 at 8:42=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Dec 20, 2024 at 9:24=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Dec 19, 2024 at 4:20=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Wed, Dec 18, 2024 at 3:20=E2=80=AFPM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Avoid triggering a `refcount_t: addition on 0; use-after-free.` war=
ning
> > > > when registering a module clock with the same MSTOP configuration. =
The
> > > > issue arises when a module clock is registered but not enabled, res=
ulting
> > > > in a `ref_cnt` of 0. Subsequent calls to `refcount_inc()` on such c=
locks
> > > > cause the kernel to warn about use-after-free.
> > > >
> > > > [    0.113529] ------------[ cut here ]------------
> > > > [    0.113537] refcount_t: addition on 0; use-after-free.
> > > > [    0.113576] WARNING: CPU: 2 PID: 1 at lib/refcount.c:25 refcount=
_warn_saturate+0x120/0x144
> > >
> > > [...]
> > >
> > > > Resolve this by checking the `ref_cnt` value before calling
> > > > `refcount_inc()`. If `ref_cnt` is 0, reset it to 1 using `refcount_=
set()`.
> > >
> > > Thanks for your patch!
> > >
> > > > Fixes: 7bd4cb3d6b7c ("clk: renesas: rzv2h: Relocate MSTOP-related m=
acros to the family driver")
> > >
> > > The description (from your [PATCH 2/5]?) does not match the commit.
> > >
> > Ouch!
> >
> > > Fixes: 7bd4cb3d6b7c43f0 ("clk: renesas: rzv2h: Add MSTOP support")
> > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > > > @@ -565,8 +565,12 @@ static struct rzv2h_mstop
> > > >                         continue;
> > > >
> > > >                 if (BUS_MSTOP(clk->mstop->idx, clk->mstop->mask) =
=3D=3D mstop_data) {
> > > > -                       if (rzv2h_mod_clock_is_enabled(&clock->hw))
> > > > -                               refcount_inc(&clk->mstop->ref_cnt);
> > > > +                       if (rzv2h_mod_clock_is_enabled(&clock->hw))=
 {
> > > > +                               if (refcount_read(&clk->mstop->ref_=
cnt))
> > > > +                                       refcount_inc(&clk->mstop->r=
ef_cnt);
> > > > +                               else
> > > > +                                       refcount_set(&clk->mstop->r=
ef_cnt, 1);
> > > > +                       }
>
> Or simply
>
>     do refcount_set(&clk->mstop->ref_cnt,
>                     refcount_read(&clk->mstop->ref_cnt) +1);
>
> ?
>
> Still, you risk some janitor replacing that by refcount_inc() regardless.=
..
>
Agreed.

> > > >                         return clk->mstop;
> > > >                 }
> > > >         }
> > >
> > > This makes me wonder if refcount is the right abstraction?
> > >
> > You mean as discussed on irc, refcount per mstop bit instead of groups
> > is not OK too? Do you have any other better approach in mind?
>
> I mean if you need such silly workarounds to do a simple increment, is
> refcount_t the right abstraction, instead of a plain atomic_t?
>
OK, I'll switch to the atomic_t variant. For this I will still rebase
my work on [0]  along with atomic_t per mstop bit. Is that OK?

[0] https://lore.kernel.org/all/CAMuHMdUEkN6Z7p=3DLspP+npB3xs4ui+D9oGG+Q15k=
Q-mYiaoK-A@mail.gmail.com/

Cheers,
Prabhakar


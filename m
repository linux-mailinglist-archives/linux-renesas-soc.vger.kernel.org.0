Return-Path: <linux-renesas-soc+bounces-11625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 920029F8F60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F46418951EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12561B394E;
	Fri, 20 Dec 2024 09:52:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1335199E84;
	Fri, 20 Dec 2024 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734688322; cv=none; b=Pzet8hiLz5pah3oiPqlInvQQBzVqXC+3JDoudWDoWgxho4AtMjkF0GspfhR4Lm93kgWWIyyUsn/nlTzOydRAHmYYO6u4gZenryXM7C/edobFATnDCa5K8ukfcBGx+3XgCcfBtb0NW0kzXzw7I9spO6U0f2WmNJQ5gaEwVDgSeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734688322; c=relaxed/simple;
	bh=+hK77xrUMVCsZxsbYEFwz0nA5n1eNsLt7BmZcypGbQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B2gsFwIHyU6novQ3G0wTGN6Mxk/tvPhMD7bDRdo3zicI64a1vDfZr63oFfM2HH/Zo9wrt6ju0fI/c9ImCpc0PssQmh88xzhijLicb+tDT3DLrbssVAUAGZQ1XO5/RUvRXi1qRENRKBvGZiuJlEYIblNbiBBF4Nf4TK+8Rieg1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afd68271b6so458079137.0;
        Fri, 20 Dec 2024 01:52:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734688318; x=1735293118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq00fs5CBbSRnZsZTiD7U2bC35Q3DseokpCNwNKL+Aw=;
        b=qUCSMVvKcAxmJ+uDSBFGKhTrHvUKtuiq0dH1xWRrSaY4NjAyTdRy187BmH3Rac4AKD
         OBBYoS67VqQWFwIv6olCOg9AjvS3IYLhtgODoJFCqUY1jJzjmktBHflOjECHbPWQOJrz
         KW1TUECjTkEVOq0JP33m5PmGvl+R5MjPQc84pSsaoZCfC7Z+hIrLIvhziuoss0ordKWn
         9M3V40hgQ+u68lnhVBEyudwUqYKhakajUXo06X95WSjENrg5ojD3OaaY3UO0fY+x4VBS
         T3zZZ+W35AjYzCX+tJqt8EoRbLwXUK3SlSOnCaPRCRtreNPJ2z69Ie/2DgkpdC2txqAB
         4nVA==
X-Forwarded-Encrypted: i=1; AJvYcCV9unGJGnKMqgm2FOtTf7kzG93uTI1ihdIjA/NC1MxT0UoLwozLhQFb7yuK1E4lsjPY4NWnvfx2CsnSCvD7VHUSw8c=@vger.kernel.org, AJvYcCVv5SEHwEWxEnXcJ6LiAJrDhE5KvRPWHI/VWFXGeC8mJczqu2xG6UfHIBK2zZESWpeKX2vqQYz8UOQ=@vger.kernel.org, AJvYcCWIsix4HBFiemjZ0/oy8HOjfBmGsBiEpNHaXl49PP0LkNkNFgd218i1EVTaq09f5PlRTKo7xd6DnN+03hqU@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyL5CX1LdQXogLZCP/iKzQm3uak5N+gpIQ4OW+o0TS7BD5kqU
	xt3UV8vhE3r8+AOWeDxFZ1oV2XiDvZP/32Ad7yXQY1ff1rnhOV1Rtmu5Hj8g
X-Gm-Gg: ASbGncs+SyI0llzgjFD55xmf1PLXJTsNMmURro4l8nX+y1V4AgBus3kQ3UddgmXhFc2
	wdn0izo5lk29KF1sMRIp3zJggz6Ep8eP0CGxwPmUKhknTXwId2DWwML5UlqS8hxNoL4fMJSY+Jr
	Tf0jt0kkBhep3P31KorRwlQkEM+YRsBF7oy2y6WdpNPCASFVi/kmu8pq6HOJ/scZ9hemrDalm8N
	csCMeUJjms2EM/aCpHh1frvrJAD+KfCmDzu0YuG9xm3HkZ++3X7+XBpbbEJa8QEPwoVOA3L82p/
	HBWXrbyzDbAA+SdpaS0=
X-Google-Smtp-Source: AGHT+IGts+1dkmbXdt4wFqStph0VN42fBNf1T/2RTI/t7eUANAuQsPdGOxPoKhHIwbZvofq/GJwxYg==
X-Received: by 2002:a05:6102:dd1:b0:4b2:af3b:90e2 with SMTP id ada2fe7eead31-4b2cc35dd51mr2190285137.8.1734688318313;
        Fri, 20 Dec 2024 01:51:58 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8d62fsm510911137.22.2024.12.20.01.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:51:57 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afdfd3124dso451342137.2;
        Fri, 20 Dec 2024 01:51:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKUtknFXsFG9IxJHA8+w/b66oLlyeWqlJZ481HAi6ZiSDbaYjVjH/XXapKThb4rgy1D/kfmxmFik3Besk3459AmCk=@vger.kernel.org, AJvYcCUlLyJ/f4C9JdesnAWLprKL9BIMLKe0Go+tctNLWx6LBX5fH6+oCLp4ag7yxSienbP3AkPadBRAF48=@vger.kernel.org, AJvYcCW1/fDrHkMCekvOC2GPk2Mi7wmQl1q3PDuPzdLZytrtOAkU6MXnNVLZAnwvFg9zuzIPW3RrAc682Tq8WLpf@vger.kernel.org
X-Received: by 2002:a05:6102:c12:b0:4b2:485b:e151 with SMTP id
 ada2fe7eead31-4b2cc360159mr2265603137.10.1734688317538; Fri, 20 Dec 2024
 01:51:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218142045.77269-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVz95gXsYpF57sDJ4Y_by0chEuzgN-Bz-KZpzycZMrtGQ@mail.gmail.com>
 <CA+V-a8vMYFT6VgCjS-OJnaOON3SOkAhYKN7-RvFqA35se+VUkA@mail.gmail.com>
 <CAMuHMdUDABcDXRemYLAXEh3cEMQqUrmhdeBCJm4mXhnHGrALKQ@mail.gmail.com> <CA+V-a8twbRisXD7ThVjpPUR-E7bH+Agqx_OsL34-DqwM=jmSfA@mail.gmail.com>
In-Reply-To: <CA+V-a8twbRisXD7ThVjpPUR-E7bH+Agqx_OsL34-DqwM=jmSfA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Dec 2024 10:51:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9goPKdSHuk0XuAPvYv7uz9Lbzcy=24RjxWpW38HamLQ@mail.gmail.com>
Message-ID: <CAMuHMdX9goPKdSHuk0XuAPvYv7uz9Lbzcy=24RjxWpW38HamLQ@mail.gmail.com>
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

On Fri, Dec 20, 2024 at 10:37=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Dec 20, 2024 at 8:42=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, Dec 20, 2024 at 9:24=E2=80=AFAM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Thu, Dec 19, 2024 at 4:20=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Wed, Dec 18, 2024 at 3:20=E2=80=AFPM Prabhakar <prabhakar.csengg=
@gmail.com> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Avoid triggering a `refcount_t: addition on 0; use-after-free.` w=
arning
> > > > > when registering a module clock with the same MSTOP configuration=
. The
> > > > > issue arises when a module clock is registered but not enabled, r=
esulting
> > > > > in a `ref_cnt` of 0. Subsequent calls to `refcount_inc()` on such=
 clocks
> > > > > cause the kernel to warn about use-after-free.
> > > > >
> > > > > [    0.113529] ------------[ cut here ]------------
> > > > > [    0.113537] refcount_t: addition on 0; use-after-free.
> > > > > [    0.113576] WARNING: CPU: 2 PID: 1 at lib/refcount.c:25 refcou=
nt_warn_saturate+0x120/0x144
> > > >
> > > > [...]
> > > >
> > > > > Resolve this by checking the `ref_cnt` value before calling
> > > > > `refcount_inc()`. If `ref_cnt` is 0, reset it to 1 using `refcoun=
t_set()`.
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > Fixes: 7bd4cb3d6b7c ("clk: renesas: rzv2h: Relocate MSTOP-related=
 macros to the family driver")
> > > >
> > > > The description (from your [PATCH 2/5]?) does not match the commit.
> > > >
> > > Ouch!
> > >
> > > > Fixes: 7bd4cb3d6b7c43f0 ("clk: renesas: rzv2h: Add MSTOP support")
> > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > >
> > > > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > > > > @@ -565,8 +565,12 @@ static struct rzv2h_mstop
> > > > >                         continue;
> > > > >
> > > > >                 if (BUS_MSTOP(clk->mstop->idx, clk->mstop->mask) =
=3D=3D mstop_data) {
> > > > > -                       if (rzv2h_mod_clock_is_enabled(&clock->hw=
))
> > > > > -                               refcount_inc(&clk->mstop->ref_cnt=
);
> > > > > +                       if (rzv2h_mod_clock_is_enabled(&clock->hw=
)) {
> > > > > +                               if (refcount_read(&clk->mstop->re=
f_cnt))
> > > > > +                                       refcount_inc(&clk->mstop-=
>ref_cnt);
> > > > > +                               else
> > > > > +                                       refcount_set(&clk->mstop-=
>ref_cnt, 1);
> > > > > +                       }
> >
> > Or simply
> >
> >     do refcount_set(&clk->mstop->ref_cnt,
> >                     refcount_read(&clk->mstop->ref_cnt) +1);
> >
> > ?
> >
> > Still, you risk some janitor replacing that by refcount_inc() regardles=
s...
> >
> Agreed.
>
> > > > >                         return clk->mstop;
> > > > >                 }
> > > > >         }
> > > >
> > > > This makes me wonder if refcount is the right abstraction?
> > > >
> > > You mean as discussed on irc, refcount per mstop bit instead of group=
s
> > > is not OK too? Do you have any other better approach in mind?
> >
> > I mean if you need such silly workarounds to do a simple increment, is
> > refcount_t the right abstraction, instead of a plain atomic_t?
> >
> OK, I'll switch to the atomic_t variant. For this I will still rebase
> my work on [0]  along with atomic_t per mstop bit. Is that OK?
>
> [0] https://lore.kernel.org/all/CAMuHMdUEkN6Z7p=3DLspP+npB3xs4ui+D9oGG+Q1=
5kQ-mYiaoK-A@mail.gmail.com/

That's fine. Once all issues are sorted out, I can still squash the fix int=
o
the original commit, to avoid regressions while bisecting.

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


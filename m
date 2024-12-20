Return-Path: <linux-renesas-soc+bounces-11603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C959F8DE7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F3511894EE7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A684F1A4E98;
	Fri, 20 Dec 2024 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSJk99eN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066FA1804A;
	Fri, 20 Dec 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734683070; cv=none; b=hNl35jzCWp0BsTycfmocp1eu+LPL/jZFlohciWiGgKOSRQCGgYwv3Ssrn/3UpRFHbzuv7YM0Zz4DxCSh5S9gbfknKgrL+YDubhcMsTJVCG+hgp0Gjkudrernra9dB2qCT4Kr/gqt9pg6D7CSpG+f/BIH9WW4VKxc660/kDMPDOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734683070; c=relaxed/simple;
	bh=g2ivRmVjBclytEWUEdITLiIdlp+tYqZ4AN31Wyq+lSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOrWng/p5QX9aR7IpZ7SN1Ys9tGrW/MBw6kkkEY4/e1uMFlVPDSsTr3jbsHqvJ3tH83xpT8uWn8Br9IaIPrKmQwsSoWta5m1Gm15zcclO2n7I2pqKvFdJkr3+hD5OJ2QOfbPZK0q1NewlvEwTQ8tzk4Q0ugI9QgJY62ZmV9Cnfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSJk99eN; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5188b485988so508716e0c.3;
        Fri, 20 Dec 2024 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734683068; x=1735287868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKyFlyNK5UBMo7uLDnK/c9yGedR44TZ2Zr2p76TGWKs=;
        b=GSJk99eN31a6qwFm2o1KHf8k+wWe/xcrYJXj0kkcLX6AcK1HqGQTaoAfUdSQbm3m4i
         b98/1z5yvZtI+PRO4YNqcRm/LxCL1Q+K8y/C25pQJ1Ftm2UQYXPlNbRPT7KMutoJl8CE
         I2T890hKGhOFpmriduSjSa3mdNbE2MtNjmKbWurEbxupyel/hhoVvJYeObxV+7oK8Pdg
         b2ryeWOJCljubK7pdw4d15b5Y/0fLtRJGZmFJJABI2784pIAE/OgeGzEFTJ5F2Np0Ezf
         0KWjVQcVu10g7OXFnXd9EIEPMwOJRJIfri38looTK3y+f6UdelQTTDUD/xDvdkKyiz7z
         TVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734683068; x=1735287868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKyFlyNK5UBMo7uLDnK/c9yGedR44TZ2Zr2p76TGWKs=;
        b=Rzu5itOw/5sCUyspygSWzyXFV8rOODXZ6izNQlWSohuDYkyq0Va9/CSrvrb6sGwavA
         BcD5zyhKeeWBvL+OovP6J1q46xTcXUxT9g8YuivF1yHSftRg3D8bGww2PpVIauL8M2om
         r6/XKJs3XySYL9CVN2BgCzOPFZ0TMp2R34ORlH2vwJp1TdF6n/IMIwhaGoMhaV38DCdz
         bmeOukhswvy7wrYY3Kb82PW5DfyEAM4+HSPBaMJUEjRwhlLAiLHX1LwrsMlmtt0ZJrXL
         ZB1yvb8yjnqgHpl0afTsqcwCeHPPirFuc2w9fHJQBj6JRXPbeVZFu8MzLmDERtc7ruBw
         oO7g==
X-Forwarded-Encrypted: i=1; AJvYcCU783u62WdksoEdlvIsAVm6zyJ98JBOW2T84kREdkX+XN3HvfaWh9S4b77wXqeIKOJ2w3uljR2HdY44hlO9FqfnSAs=@vger.kernel.org, AJvYcCX/IylHXyfv9ZyHkGo9FOpm4GkQ795iwnxp+Bm25n4tGsnE7e9ktvJ8tXAc3Ba9Npcp3LQVV7c/q/A=@vger.kernel.org, AJvYcCXQZe8O3KfS4zKgFhUOoO1P4eDNyLLZzMP/i9st0Cxhplfj/hOW8WxTsqH4o3yrD8DoxGSiRFzqhxYcZRF5@vger.kernel.org
X-Gm-Message-State: AOJu0YxznzTzlCKy9hOM4T1HnUCa/pPvz4faEunwH9YjhyUjvq/dZjbr
	ZUIngVeY7kDuRKb9cjyTAY59lZB8da9OCwDmi+fZPVvecj+Fqedgl2MsQEDyIfnr56iyETK42uL
	70jCFEEc6EKMIQSLXnhAqjHtxLl8=
X-Gm-Gg: ASbGnct1rfg9SbpvUjWOKsSm4dqnlc1lP1e+v0nX/T5hDW5T5M+gqfuZtlZSEBsgoU9
	lBsKF89RxjoA3QXBJuewBRbJENCixfh8a/6Jws08=
X-Google-Smtp-Source: AGHT+IF1UV39pKX7PM9xcs62YZrCNRQLA/dyQy5XFvwl/ik38xc+IFRNSpFiGHpjBWV+5QOOAtIgPwuROwj1Ot4Yisg=
X-Received: by 2002:a05:6122:210e:b0:50a:b5a3:e00c with SMTP id
 71dfb90a1353d-51b75c2ac0amr1748696e0c.1.1734683067751; Fri, 20 Dec 2024
 00:24:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218142045.77269-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVz95gXsYpF57sDJ4Y_by0chEuzgN-Bz-KZpzycZMrtGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVz95gXsYpF57sDJ4Y_by0chEuzgN-Bz-KZpzycZMrtGQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Dec 2024 08:24:01 +0000
Message-ID: <CA+V-a8vMYFT6VgCjS-OJnaOON3SOkAhYKN7-RvFqA35se+VUkA@mail.gmail.com>
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

On Thu, Dec 19, 2024 at 4:20=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Dec 18, 2024 at 3:20=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Avoid triggering a `refcount_t: addition on 0; use-after-free.` warning
> > when registering a module clock with the same MSTOP configuration. The
> > issue arises when a module clock is registered but not enabled, resulti=
ng
> > in a `ref_cnt` of 0. Subsequent calls to `refcount_inc()` on such clock=
s
> > cause the kernel to warn about use-after-free.
> >
> > [    0.113529] ------------[ cut here ]------------
> > [    0.113537] refcount_t: addition on 0; use-after-free.
> > [    0.113576] WARNING: CPU: 2 PID: 1 at lib/refcount.c:25 refcount_war=
n_saturate+0x120/0x144
>
> [...]
>
> > Resolve this by checking the `ref_cnt` value before calling
> > `refcount_inc()`. If `ref_cnt` is 0, reset it to 1 using `refcount_set(=
)`.
>
> Thanks for your patch!
>
> > Fixes: 7bd4cb3d6b7c ("clk: renesas: rzv2h: Relocate MSTOP-related macro=
s to the family driver")
>
> The description (from your [PATCH 2/5]?) does not match the commit.
>
Ouch!

> Fixes: 7bd4cb3d6b7c43f0 ("clk: renesas: rzv2h: Add MSTOP support")
>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -565,8 +565,12 @@ static struct rzv2h_mstop
> >                         continue;
> >
> >                 if (BUS_MSTOP(clk->mstop->idx, clk->mstop->mask) =3D=3D=
 mstop_data) {
> > -                       if (rzv2h_mod_clock_is_enabled(&clock->hw))
> > -                               refcount_inc(&clk->mstop->ref_cnt);
> > +                       if (rzv2h_mod_clock_is_enabled(&clock->hw)) {
> > +                               if (refcount_read(&clk->mstop->ref_cnt)=
)
> > +                                       refcount_inc(&clk->mstop->ref_c=
nt);
> > +                               else
> > +                                       refcount_set(&clk->mstop->ref_c=
nt, 1);
> > +                       }
> >                         return clk->mstop;
> >                 }
> >         }
>
> This makes me wonder if refcount is the right abstraction?
>
You mean as discussed on irc, refcount per mstop bit instead of groups
is not OK too? Do you have any other better approach in mind?

Cheers,
Prabhakar


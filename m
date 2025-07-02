Return-Path: <linux-renesas-soc+bounces-19043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23554AF629B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 21:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F2E57B48BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 19:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DE12BE657;
	Wed,  2 Jul 2025 19:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9tFMUej"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D21BD035;
	Wed,  2 Jul 2025 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751484460; cv=none; b=JGaESn0q/yEooSCKtIJqhTT220TzhGaVd22acYZ4Y2coZkQnF38KSRhUnpA81Ss4WpeTWf6WVeUI9U9PbeqKyFm0NJvH+ocNm/BFfXcjM769ZpyafR2CHW+YtBF97gbDF8ELXOerAfAEAAmT6Kizb/2tP68aEQiBaHat0Z1ODOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751484460; c=relaxed/simple;
	bh=n0UITyQBoGg306HFA0v9wSP85e5uGw4HTabhPGTjkGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZDel6FldYy6JhqoWk+2L/GSU0spxMRSEWlSGW0D01YkDV7NTM/jOMruCq5D9GqudLAEDG+WShgMwoENyisTZlM55cEw4tYD/nxwjIgpfFCy+ntE1MtxOE8r3XODH4C/v81e8d7LU82ychgLOlzk6jPN8ll1ZUbBq34LB588bQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9tFMUej; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cf214200so40156755e9.1;
        Wed, 02 Jul 2025 12:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751484456; x=1752089256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPekVT26FDBboWBlCgW3YXhGA0byxnIH9GUwZ26YoIQ=;
        b=a9tFMUejQcVL+tbv76+aSAbuRLuUdvlw/6EDwjGbLmvCELx0EvoByXPzs+THrfmzyv
         QfkiV8Ek9gaJWORZLy4Q2gZ4RMkSACuYXhq65hQ3d4pOaO8cIOevSedVCacBhGrbu/Ic
         TwvlpMiTM0dEJOht0HE+EPEQhWXARkZUperk769nKgJ0Ajj1qn3IFQhQY9qb8uhcjAzc
         CyT5jnTpyxPvk+smIC0QVOvPEGvMRaXTjro6V5vlsBoK34eIPfL6eWPoJewUGsh5zxZK
         to+rMuaS66oR3fuWqVkIcv5GC9Qwnz/WaP3JxbcdzLj0I/oC0HBZaYkED/er0GU0EhQ5
         47fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751484456; x=1752089256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPekVT26FDBboWBlCgW3YXhGA0byxnIH9GUwZ26YoIQ=;
        b=MHI7CkcB6zvvS0d+HY9BUZLdOxbDotm0OYLBM1nPFvRZGTJdNdHMQt9EZDmqMQiRKY
         vaMYvzuE34WLJlbNnRxS/Icxq8HVNk120CRmYK0BPXkH7q82pKvrdPxWJP21yiRCYjNc
         XhSjWCl4etTHbthWvqB9xvwtgPSi4bX32Cvcoi6eUj1cvtT2uE9EC+/VIrLCrpuhVH40
         simFdOEK0tnKT3b7+i3x+W5OBFzzSRpmGy4Vzyoq2NhIy/wcpn8EktWbLCDGQ1oRz43R
         wIA16ahmeE07PAj+BKaFjsEFYRo9wTYKb5Lz5kbGvUlM2IDZzTBs7Lyhg34gOHdYouOC
         xaRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ntb6n9pKIhjDDglNXmeMISfg1pQ5AvVQCNIzcV5iqSDojheoUw5AEV4ms71+DBSuLzvyEKVfIG/AM0gW@vger.kernel.org, AJvYcCURwtkLiCUF9TiAfpo+iJVhV2H0PSGNz/BhOT80kQRKHH8DHDcAko8gwDQ159hwoJMmwWRCXHPPFTMB@vger.kernel.org, AJvYcCVD26Ug4t6vACE6PJd3PS44bFaLd5qTqGLZsld92o8jHKObPCKHEHdp0dDvlla9wb+wrGnRG1LZ/QIOX6ZQHltQLNA=@vger.kernel.org, AJvYcCVnl7+y0Sa/eSruuWf3u+78hd1y+iQ7XonaNGMVg9vBNWVoJkIKMP/R7JkDEjF/7pJq6t8BY+eAr7wt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy63eGEKVTEds9CF0IDAMT+Nc1uxv7o6Tj99UeHiwLm3sGqDQtu
	6Ya8+TZQcyAr9PuCv0BiXdmDxyIUOe4FieWyylLtBYDHRG3qNGViBFkit/IhOMnhJi3Ta7GMAFx
	uYUwJjEhVDpsV2qKQjH1uVxAhARoy7tg=
X-Gm-Gg: ASbGncvN5yq3GnhUKgxuRs/YVqLzrdb8/53c3hvFYb0t1vmc1DJ5ApNUhjtKAHAo6Mz
	l93o0m8f6SsuBNT21sgzWcIb161S6MNoiq2qj8SJlGEkJPIhreGA1i59z/52li6B5lj4vaSgv7Y
	UmznEzdCzrsQFmV/wJeyoXZXBE4PZAC/IjFUmfO4RcsqL+fw==
X-Google-Smtp-Source: AGHT+IE+Ni0yG96ooPG8fYk37TIzS0AI22bGmNHRmObSkI71fnhjBByUd5AmNvlmQ4Z0sKup+pXjunGIqCoLDDZ9scU=
X-Received: by 2002:a05:6000:2004:b0:3b2:fe84:a10 with SMTP id
 ffacd0b85a97d-3b328237c63mr401193f8f.0.1751484456150; Wed, 02 Jul 2025
 12:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625141705.151383-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXbr5Rb7SNzYTQz+rBNuRrLCC4mf+XauTFA8FArFZzfNQ@mail.gmail.com> <CAMuHMdU3H0OqabLneTXeuhN5zUFx2-tq9OZjLbhR3OgLJ22Cdw@mail.gmail.com>
In-Reply-To: <CAMuHMdU3H0OqabLneTXeuhN5zUFx2-tq9OZjLbhR3OgLJ22Cdw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Jul 2025 20:27:08 +0100
X-Gm-Features: Ac12FXx6GkIf_TUCrH45yeiNQvEJOhPX08TZPUXewhIrYBbtNTJ-20k03oR833M
Message-ID: <CA+V-a8uo7NNN-2NuJenYVZX4j2mt1A2zxVzWh-BH8RRBQtQOPw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: renesas,r9a09g077/87: Add
 SDHI_CLKHS clock ID
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jul 2, 2025 at 7:23=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> On Wed, 2 Jul 2025 at 15:37, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> > On Wed, 25 Jun 2025 at 16:17, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add the SDHI high-speed clock (SDHI_CLKHS) definition for the Renesas
> > > RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. SDHI_CLKHS is used as
> > > a core clock for the SDHI IP and operates at 800MHz.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > >  include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
> > >  include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will split, and queue in renesas-r9a09g077-dt-binding-defs resp.
> > renesas-r9a09g087-dt-binding-defs, to be shared by renesas-clk and
> > renesas-devel.
>
> Looks like I can do without the split, as renesas-r9a09g087-dt-binding-de=
fs
> is based on renesas-r9a09g077-dt-binding-defs.
>
Great!

I mainly did this to reduce the load on DT maintainers.

Cheers,
Prabhakar


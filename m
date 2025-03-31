Return-Path: <linux-renesas-soc+bounces-15214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCAA76D55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 21:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4D951886903
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 19:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B7E214A61;
	Mon, 31 Mar 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abO6bhO+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281CC216E24
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 19:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448181; cv=none; b=fRFBMu7fI/mwWFcnXD6qLGh1m0BjDqTb0XCRJmOkxP1oHsmDh+JXxx3zhhUwq+iCnl3zmUNBNTQwJoP2HZXB+XuRHgdmux+Pdmd7x0VZFYlBijufSHbHzMQ+P8lms+PLQuxn2XrBJemerrh15HiOADxkwWtImDnxR9bvHmRy9kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448181; c=relaxed/simple;
	bh=WcyyqTlBd/eDx6M+Bwtq4Xsr9pX3sakHtYw0EVtY1tc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oo3xivPxRFwQnjL3sz06OQmBAb/su0pVKpmlrkRRUYkodvxexp4bP+p+AKTzF9lc0j7R4h5u7d+xiBlIIUi3Quupl1iaGYXtKC5ln5wZzlvctYD4txo33JKBmel27AEdcMDIt+YcQcg74eAS4ugBp3tbWPZjOvs/gklttHQJuls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abO6bhO+; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-523f670ca99so2185254e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743448179; x=1744052979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFSe0pnLfTdTyVh7xqFa9KbPJ4kJc28kAXxRnGwg76o=;
        b=abO6bhO+ne/yYKTfbxGB9QP/hl9ImImUCAP4DHDh6w/OVPGjs1RoC1LKaP7Oq52loW
         1IxEUmzHkMEa8mVBDOz0GAiVu6gNnyrQC+3Ci4T4i0pGWUHoDTZj2/LSojicVquLP9tY
         Kpn8S3x6JwPER/tfCmAUoGzncUAbWS4CLdPafzlGbe64jcLa87Meo9ltXDGIRaratoMA
         ZdYp8zLnqnQ4ooS+f38/0CfRsgmmo1daoe+uXG8z5jcFB2M2npb9XgNPEW01cjhD4QFZ
         u+GtxxAhSoy2Q/LpgTujrEL+ZTvunoE61lerlcue0WU5ipBPyDVocu4haOyUhGCGdMUS
         7wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743448179; x=1744052979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFSe0pnLfTdTyVh7xqFa9KbPJ4kJc28kAXxRnGwg76o=;
        b=PTvMO9QLfm5s3P5x0Yd5B7W7UZnbgvvIXqWuoJeGjWfXZJtJS9cn955mqGNEG8B2Jm
         GFJQPz7LzexfprLXFArN4iGsUUVV2YUkcmlK0iQJtVRTSIlDnNyTc/fSA89tJU22XCa2
         gbkOhLgtQtPoourpwTC9h5vtRphWCZYtV3asd+rt5AjIPjZkjLwgapTCtcaM1965yet/
         6l3ouA3fmxhkHO8Add2jPxXKhCNp5+R0ICUGPuiyj4EZCVLvE5ncOB+uKCxiBvOSw72r
         MsrmUtqpUmOAutZ0E4T4VDswyltqc6REeB1PB1bOB3viqwYXNPom2u7uA4HG2VTsIhZ4
         dD/A==
X-Forwarded-Encrypted: i=1; AJvYcCWmdKeVa5WtCpHwtcN3DD5Wxwy3wSBHAL3hn+IdEJIC98EoqerviPCwDcyS1SumhHoU3MR7g5aSYa/0lETWUGAtXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEToJ1Zyn9XBPPuZK6kIplEe7KdEqLFa7TFWo+sbZsASiTZzzH
	P+XPT+2BDtFrI/Q+vL3gvDYr+Am7ThPLZUP703eRuQ9ooSieZfVdUlAfVoYlirK2qRn+ztHNWMB
	XR+ZVjM1JOEPLLMpXKVi7rW7gTXk+HTKsYfg=
X-Gm-Gg: ASbGncsv2GO6QTJ0TsQqc8tHXEv/qe/QHEOEv2uazUA83f0lWfGFOM0AKWbMxBJh4+z
	PpZQcYxoOmqs2KAYeNEzcqiJiRxWZFWapnTjYkzh3j1uRXayOQjDV0cG7oLE0ltjpnDqJGVU9ya
	YAXn9suLRnEHyI9ukuxkmqR5xRObPNzfJkOeHuAcsfR8Snz4JDIPju16jBH5s=
X-Google-Smtp-Source: AGHT+IGQH+VxN2HH5EHME4xPyb4doW/Fw8uko+EeKzFNddxkqHivCvydQcI7aOhBAen7Q8EG81siTkvKDqGKykC3HsA=
X-Received: by 2002:a05:6122:65a2:b0:520:43e0:8ea0 with SMTP id
 71dfb90a1353d-52642429c82mr183614e0c.11.1743448178841; Mon, 31 Mar 2025
 12:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com>
 <CA+V-a8uvetHu1nvigA6s5DNYPKMq5iC6=UEnMLy=z+83nQ8acQ@mail.gmail.com> <CAMuHMdVdrJpyABVQPf-QuErPohmxcFPtECW3XW87bNfGVarMDg@mail.gmail.com>
In-Reply-To: <CAMuHMdVdrJpyABVQPf-QuErPohmxcFPtECW3XW87bNfGVarMDg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 31 Mar 2025 20:09:13 +0100
X-Gm-Features: AQ5f1JqYKO1uUULMKj9y9U1ywAmyhxYPz5xhlMq34rP-kchWdpHH9u3lhsqY5Fo
Message-ID: <CA+V-a8unH4rjRWuF+fO8DMPDEcTTz+rp0=0QR_k1yDk9VP5HeQ@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Mar 31, 2025 at 4:48=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 31 Mar 2025 at 17:37, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Mar 31, 2025 at 4:16=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Enable various Renesas SoCs by default when ARCH_RENESAS is selecte=
d.
> > > > Adding default y if ARCH_RENESAS to the relevant configurations rem=
oves
> > > > the need to manually enable individual SoCs in defconfig files.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/soc/renesas/Kconfig
> > > > +++ b/drivers/soc/renesas/Kconfig
> > > > @@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
> > >
> > > Note that this whole block already depends on ARCH_RENESAS...
> > > I forgot about the reason, but commit 8070ba6348608aa1 ("ARM: shmobil=
e:
> > > fix build regressions") reminded me.  This is also the reason why we
> > > cannot open the block for COMPILE_TEST in general.
> > >
> > > >
> > > >  config ARCH_EMEV2
> > > >         bool "ARM32 Platform support for Emma Mobile EV2"
> > > > +       default y if ARCH_RENESAS
> > >
> > > ... so the "if ..." part is not really needed for arm32 SoCs.
> > >
> > Ok, got you.
> >
> > > > @@ -197,6 +216,7 @@ if ARM64
> > >
> > > Note that unlike on arm32, the arm64 (and riscv) block does not depen=
d
> > > on ARCH_RENESAS, so the "if ARCH_RENESAS" part is needed.
> > To keep it consistent would you prefer `if ARM64 && ARCH_RENESAS` to
> > be added and then all of the SoCs can just have `default y
> > ARCH_RENESAS`.
>
> I am still undecided. On one side, I like symmetry; on the other side,
> I like opening up as much as possible for compile-testing.
>
> Note that apart from a scary "WARNING: unmet direct dependencies
> detected for PM", an m68k allmodconfig kernel builds fine after
>
>     -if ARM64
>     +if ARM64 || COMPILE_TEST
>
How about with the below:

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index eb5bb6d36899..31f313d90f0a 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -122,7 +122,7 @@ menu "Kernel Features"

 endmenu

-if !MMU
+if !MMU || COMPILE_TEST
 menu "Power management options"

 config PM

Cheers,
Prabhakar


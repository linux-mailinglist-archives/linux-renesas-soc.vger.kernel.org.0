Return-Path: <linux-renesas-soc+bounces-15225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DA1A774EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 09:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90E69167414
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 07:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E06D13AA2F;
	Tue,  1 Apr 2025 07:08:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DFE2111
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491287; cv=none; b=tTWGt+CX0jb04LeKNDtsZ48dTPuhbKB17UYRv45qQX9a82tEJElP7gF86c6/J/KYlPT9/Mp5uwIQ6voNXZ4JDkQbA0C6bjiW4hXOqTMrsBzb1ut8VUGW9xd4/M1GeH/J8IIrYG7hZ7+/aEVBW3GFiqJ9Mjc4j8Q6FufdGSt/x2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491287; c=relaxed/simple;
	bh=o2LZi41QWXvXEzI7BrrPCeD/0Ze1zZ0rO/Bk3p0FTD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7nV8tKCgUGoqe74oiDgtYhWALa4hqsWBIxQsYqij/DZy1SnE0Yt13KKOmRg+Sn3eaACGtAMkm6A0JHnRpBJpyj7iv1vvqj/UN2AYkQAZjkrMsaeAuMpuqU3SIccxv9U165wpJhzfAbaXnlhY8jGjkYgPYZAsPhNmBhDvSA/xhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5241abb9761so2258881e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Apr 2025 00:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743491283; x=1744096083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSs74IFE6akb0M9AwJwX47HPRv6nzmht35hmY25ogwM=;
        b=ecG9H81ohlJBhALZWxDvWgOj9S2NioNfLqbIxrEJI6ctDS+H/X6GKTqvlvCI3qS41H
         5fAPbK2F8OHgEFmh2Y/aCy7zaO215ebSF6KB5qMDAM7/1i29kSKkdqDKaG8XkN9FbwlS
         tftQp8XaRHdFH+jsaSz4CUzwfBROzR/R+fFx2tXxyEazRWtE0CdoewJUEP3o+DtSTRDo
         9+DxGnBp00o2C5mwsOfuarakjY2AzZCRxcJCs2r0+LF8uKV740oB4/GE7OOdZrjR+Hix
         +uubCuqhFXYyFLWxgGvb07XsQ/uRwtTpscscOiP8anUsp0Z8q1Tf/4jUHWK38djJ+Piz
         qn9g==
X-Forwarded-Encrypted: i=1; AJvYcCUVwTAbKcZzvW83wQTuVE8zmEzRLMf96nt/qcKK7nwFUXZXHZEgRS8Lu8wskteoHGhCJE6dQhmmurfwZUlCjV2sdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5JzK9uodZT8wjEdRTzAJi20zhrUMgf0/s6trFrjo4oCtBSRg4
	y+GYrLRWs3Md5/5zSjAYXRl56PQa0s0L/ab/WR/b8UOmLwoQT5vrucLYbcMB
X-Gm-Gg: ASbGncs13DKB8oQWK+LdXNMDFNPEXx5m8Jhin9YG9twM8MM1ZPsxsz9dI1EHCuL27F4
	HtdEq0J0VSqzDuWrr86Rur1WpBc3UXSk77+xnY9mls7wIWtCwGiQTpz8fxbfj3msHhKg+61bZxq
	kR9WEa04cpgxRnIkoOC+JyNABe2NruczeZi0uqPm01NSe1aW0O+1EMSz0jQNWdb5mZwgAjwehK5
	A7G1YBor3lylrVBCcbU2pcrhhSTa5wku1ztc7LM2JnRmLQuz+UQBgkppVqxhr5gEhVQQcKqFyC/
	uddknOPPaz9NbcZCmWToyb1Y3hAtzsDlUVORMTppgiyE0eKfmRkVN9ANOvg57HPe4bTNnPulVcj
	ulO3RmtM=
X-Google-Smtp-Source: AGHT+IEnL0QwqkKKYH/JAHY+x91tgZIVZr7TdcGrmi4QKQsaFpki3qBxxBeDThrjMjL7ZNAzw2ugvQ==
X-Received: by 2002:a05:6122:8c06:b0:51f:3eee:89f2 with SMTP id 71dfb90a1353d-5261d3375f3mr6993230e0c.2.1743491282732;
        Tue, 01 Apr 2025 00:08:02 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5260e6a2cd5sm1911662e0c.2.2025.04.01.00.08.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 00:08:02 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso1985319241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Apr 2025 00:08:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX77brA+TG1JtaX1I9xL0lDIkmmWpMa+8eS7rs6MoiGGr5nzoemJE5qOg5YF63EBJM83wJYHnnVULILUgSeY8l0sQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c12:b0:4c3:9b0:9e6b with SMTP id
 ada2fe7eead31-4c6d384b3d2mr7037506137.10.1743491281933; Tue, 01 Apr 2025
 00:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVC0HzvB9EPKTev8Y6ioB6GfE-axEgzK52+SVj5hGnMUQ@mail.gmail.com>
 <CA+V-a8uvetHu1nvigA6s5DNYPKMq5iC6=UEnMLy=z+83nQ8acQ@mail.gmail.com>
 <CAMuHMdVdrJpyABVQPf-QuErPohmxcFPtECW3XW87bNfGVarMDg@mail.gmail.com> <CA+V-a8u79T3YGFbAdT6vETkCO2sDXHR9e4thXfNjZJR3AYvgmw@mail.gmail.com>
In-Reply-To: <CA+V-a8u79T3YGFbAdT6vETkCO2sDXHR9e4thXfNjZJR3AYvgmw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Apr 2025 09:07:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrQ62f==KHySeQr90tCWCZDStF-b6-KfF_M-ngz847UA@mail.gmail.com>
X-Gm-Features: AQ5f1JoYjoMw_qzeehOdQMBtp0MwXm2xxSuakMNlkXmW7qxVfqZhBs84dRu8WpE
Message-ID: <CAMuHMdVrQ62f==KHySeQr90tCWCZDStF-b6-KfF_M-ngz847UA@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 31 Mar 2025 at 18:57, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Mar 31, 2025 at 4:48=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 31 Mar 2025 at 17:37, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > On Mon, Mar 31, 2025 at 4:16=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com=
> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Enable various Renesas SoCs by default when ARCH_RENESAS is selec=
ted.
> > > > > Adding default y if ARCH_RENESAS to the relevant configurations r=
emoves
> > > > > the need to manually enable individual SoCs in defconfig files.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/drivers/soc/renesas/Kconfig
> > > > > +++ b/drivers/soc/renesas/Kconfig
> > > > > @@ -65,17 +65,20 @@ if ARM && ARCH_RENESAS
> > > >
> > > > Note that this whole block already depends on ARCH_RENESAS...
> > > > I forgot about the reason, but commit 8070ba6348608aa1 ("ARM: shmob=
ile:
> > > > fix build regressions") reminded me.  This is also the reason why w=
e
> > > > cannot open the block for COMPILE_TEST in general.
> > > >
> > > > >
> > > > >  config ARCH_EMEV2
> > > > >         bool "ARM32 Platform support for Emma Mobile EV2"
> > > > > +       default y if ARCH_RENESAS
> > > >
> > > > ... so the "if ..." part is not really needed for arm32 SoCs.
> > > >
> > > Ok, got you.
> > >
> > > > > @@ -197,6 +216,7 @@ if ARM64
> > > >
> > > > Note that unlike on arm32, the arm64 (and riscv) block does not dep=
end
> > > > on ARCH_RENESAS, so the "if ARCH_RENESAS" part is needed.
> > > To keep it consistent would you prefer `if ARM64 && ARCH_RENESAS` to
> > > be added and then all of the SoCs can just have `default y
> > > ARCH_RENESAS`.
> >
> > I am still undecided. On one side, I like symmetry; on the other side,
> > I like opening up as much as possible for compile-testing.
> >
> > Note that apart from a scary "WARNING: unmet direct dependencies
> > detected for PM", an m68k allmodconfig kernel builds fine after
> >
> >     -if ARM64
> >     +if ARM64 || COMPILE_TEST
> >
> So I go ahead with your earlier suggestion for now?

Yes please. Thanks!

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


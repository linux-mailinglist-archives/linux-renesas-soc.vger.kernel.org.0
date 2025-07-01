Return-Path: <linux-renesas-soc+bounces-18944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB2AEF073
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 10:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28F6F189922D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 08:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0354267B95;
	Tue,  1 Jul 2025 08:06:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C364A0C;
	Tue,  1 Jul 2025 08:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357165; cv=none; b=P3mYTMa72HYCQcixB60kSD1pIklUpfA3wSfIxSNLgxsLtSBDR0gNP68ExRml9S4APiaaS50kQgX+M12XnGsZ8okVPn3SLNah/6Tb+w++TOVbvNtuXbq1x8J9eJ4fu5l/+RM+donH9V2NIEE4eUv+ASWD9p/ZpUMQlQ9p+2p2EkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357165; c=relaxed/simple;
	bh=Fg9/wOKd839gSjrSSUAyOaaW+du1KFVWOz1piLBNugA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwNLawQ2DuwDt25WmjFgpS9Tk0UdwTxkIaPbJ7OWNjbAlMoN/cSc+KDTljTgkk42AKlL2FYMCHh9leJ4Ch8KFKa70W+apd3YUsuc4JyFfFC7kxY28Xt952yt1R75Zdq5xZs/LsrsZrLB4yCfsvymdQkc4fPGsC+6nDeGXzX+J1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-528ce9730cfso1006118e0c.3;
        Tue, 01 Jul 2025 01:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751357162; x=1751961962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOPgQPiH0cyH4gfLvX6iKuYNofmLskPWLW/+70n9+4I=;
        b=A1bLhELszWCLWq4fP8U3KC5sY5oHzI46tvwpUBbvCH1dsQw94S/2p1gHA8RsfMGqxU
         cwMcJztV6s8EJycKR5plNkFM4+oS/5Ckbs1aVKE8fGycf/Adhu7QX4s1WaUlD5OZw1bj
         OW/5Fcz4EiCinV0A69tsPTAzjup53FLK+tRDvIf6c/fuahoDQ35Ilmox3xkbvQdnPMTe
         WmcyPFuDnYUTyorPFnZkNoIAvt+xYJ6HvdSXfVZyUvHzyX+/ny+JntB6PyW8TmaMuJw8
         oYOaYa5AxDJ758DQYxbT0sm4iN7/ZIxReD0d0s/k0qW/LOJXJ2SkLttiNitBEgYHVkC7
         7WYg==
X-Forwarded-Encrypted: i=1; AJvYcCUfQeqdqSUzyibsrrTo7MXnKBPI+zPUPzzqWjUeQ2W+Vu2XrLuQEe7VOkCX+oYv7MSs21Hoc252@vger.kernel.org, AJvYcCWDBBsVU3wXofxHi0z3NGgcO1moPFy43OxR8LC7gvH9cCfyz4TgPNLrppGxVgCwbBUAHgEktl7HUl+ajA86@vger.kernel.org, AJvYcCWcjasgFByOheWQlDmmWWF4KwgAL9OqzVe47qZUs5AvZwMxVB2S5KgsnQnQWMOWX+nE0ZovNxNG3XTqUSK9UAlXrlY=@vger.kernel.org, AJvYcCXoKAEETIpCX48twwM2TkW0u5Xb35AGLzqpdnCYjoly7B2pHOPcfuALToaH0wPq02T9/a0gl356qNCI@vger.kernel.org
X-Gm-Message-State: AOJu0Yybgto1sxdts96/KATfoH4v1xnuAsGIUigD02+2Q+nW0gd1q8cw
	pGBci+ndycLfUQfmzgYTMUpbXGDLwJDkdv68IPB1oFoQiN64cvszx5OCj0gHmGly
X-Gm-Gg: ASbGnctIARKSt08uTL7mYJGOkXHpqqJk04mxEb7poeiQzPYD8eFOGrHyyy1ofJ8eOpp
	JojYJUAazxFiKluFs577l63DiPVKLbOy61abFUY7GCWDxVc27GMaG5Bq4hXUHonNk9RAGFjazTU
	Z6Jk7P//kMFgcsst6Q7Ot2Dvnp2Kds0GX3Oyu/88FIJ3XPaOwJvVXWng/AZLc2e0LFTrjIDgKpU
	ko0/NuZEh5+FM2yG/ssqwGj/anZ3/V015/83OLNVyZEOIZVaILt7YJJ2+h4acv8EbG88/aPcs+p
	e1i4THlIKH8SC173AarAkZ3s9sO4mijdjXtWsksQ/2yeohNa+SPS0WTsfOReHvvThamQWS7RNdh
	jzf1Xjhtd2dgqdVG6h/Yh0Jl8
X-Google-Smtp-Source: AGHT+IFkB0H2eiscp0BdbL2ydvtM4ljlUHOIXGfR2eF5qkFcb1G1KMuM+wT599vFU9gKaGdSzEO52A==
X-Received: by 2002:a05:6122:370e:b0:531:2afc:461b with SMTP id 71dfb90a1353d-5330be677a3mr11513303e0c.4.1751357161534;
        Tue, 01 Jul 2025 01:06:01 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53323b0f091sm1017153e0c.0.2025.07.01.01.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:06:01 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87f2170921dso635112241.0;
        Tue, 01 Jul 2025 01:06:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZgmvX7WL7FpiNjQKW4B28tg4kyIdoIsenjcbHkQEH32IFUyvwM4HjShQaYbcPDZIfY+5EnHQu@vger.kernel.org, AJvYcCUm0bXwH8/6RWCsN8ZDWsgwV5D4c2Mb7r149TP+H2hcR/zfzMzzHx6swkdkXhOzhWw/ZsbNdEqQfBysKOwv@vger.kernel.org, AJvYcCUy3WJDYSbCZfzB1CxWWdsIPpURi1joXouN7UdV/ATw6PI9VWY8t2c0KMOohSeL1DCJSkCZgGF2XnPk9ycO+zZZzD0=@vger.kernel.org, AJvYcCXxoQ9EhyHGwAVrOYlkMEUPtcVfIn+blN027k5OSvM33schn/Kz25ivjOZDqN8z3uoBz/Xra9QZdfzI@vger.kernel.org
X-Received: by 2002:a05:6102:5717:b0:4e9:c773:dca1 with SMTP id
 ada2fe7eead31-4ee4f6d96fbmr11242699137.11.1751357161130; Tue, 01 Jul 2025
 01:06:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-2-john.madieu.xa@bp.renesas.com> <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
 <OSCPR01MB14647EFA0DA38119F00DF1D50FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <CAMuHMdWnz3VUeFaJBEgLc0F_gGkdm679H4YqFFuRAEVFKZd8OA@mail.gmail.com>
 <OSCPR01MB1464715327B4DDE8622B9B510FF7DA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <CA+V-a8sF2wmLEAp7uhxhKaNx_u9xTf9SR_y8rafyvYYaUgxYDw@mail.gmail.com>
 <CAMuHMdXdhYJ7ZKVa_f15PMBv7t1_xsDUuwR+uv+bOaHMxtr8Lg@mail.gmail.com> <OSCPR01MB14647AB8B2901DE1EBEB32145FF46A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
In-Reply-To: <OSCPR01MB14647AB8B2901DE1EBEB32145FF46A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 10:05:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMLv6mfKsNfKDgMKqOSf7Nf+FTJcy7M84EN_oeHbzbTA@mail.gmail.com>
X-Gm-Features: Ac12FXyTtjI4YTwpovffxojy8Q1Ejihuqc3wkPKs28S37LOjQ2ir27DL4UhK71w
Message-ID: <CAMuHMdXMLv6mfKsNfKDgMKqOSf7Nf+FTJcy7M84EN_oeHbzbTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"robh@kernel.org" <robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"john.madieu@gmail.com" <john.madieu@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Mon, 30 Jun 2025 at 18:23, John Madieu <john.madieu.xa@bp.renesas.com> w=
rote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 19 Jun 2025 at 10:22, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m>
> > wrote:
> > > On Thu, Jun 19, 2025 at 5:34=E2=80=AFAM John Madieu
> > > <john.madieu.xa@bp.renesas.com> wrote:
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 18 Jun
> > > > > 2025 at 12:04, John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > wrote:
> > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, 11 Ju=
n
> > > > > > > 2025 at 11:02, John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > > > wrote:
> > > > > > > > Add clock and reset entries for the Gigabit Ethernet
> > > > > > > > Interfaces (GBETH
> > > > > > > > 0-1) IPs found on the RZ/G3E SoC. This includes various
> > > > > > > > PLLs, dividers, and mux clocks needed by these two GBETH IP=
s.
> > > > > > > >
> > > > > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > > > > >
> > > > > > > Thanks for your patch!
> > > > > > >
> > > > > > > > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > > > > > > > +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> > >
> > > "The clock gating cells require source clocks to operate correctly. I=
f
> > > the source clocks are stopped, these registers cannot be used."
> >
> > Has this been sorted out yet? I see no change or mention of it in v3.
>
> Yes, it has been sorted out. I mean they operated properly after
> all the tests, even after S2R/wakeup test.
>
> While at it, even with OEN patches applied, I could not reproduce
> the issue known to V2H. That's why I've asked if you'd prefer
> DEF_MOD_EXTERNAL instead of DEF_MOD (which does not work on V2H)
> for consistency with RZ/V2H, I can do that as well.

As DEF_MOD_MUX_EXTERNAL() better matches the undelying
hardware, I prefer that.
Thanks!

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


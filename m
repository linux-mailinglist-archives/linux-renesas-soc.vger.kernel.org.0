Return-Path: <linux-renesas-soc+bounces-22125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98CB8F2FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 08:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F203E1688BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 06:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CD4182B7;
	Mon, 22 Sep 2025 06:45:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513B9478
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758523518; cv=none; b=VANqh9bfJ/i0VDQsb8f6Z4EvEHg+YNe/jpsNoFxr73NENRhHe5xJdSHQd9E5w6/ozLptKaJ0sk/+ilM9UevYxNtlhwoCkJVOoK7SdzL1/nQKRjwc8yAcvblg/2Y0CfIOUPx5Y3LvplFhWqlQWFu8K2yifysD0W/QvEalJ59GkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758523518; c=relaxed/simple;
	bh=WKoNp1m1LguBSPMUxFyssGnY7WelyBSixdM+cHjnGTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Syy4wRtH2o5OmxfTOpTrYYZVjH/3HCP52KaZBOGYGY6Vwi7DTYz0RIO0pQotwhPg2/Nt3L+Yl4Imrz+6++IvPq1WpdBfWsWe+D/q5Z6FosHuzIbOYvvdqoLz6CJeYt4yjtTj3z73m7Pcfb5+4gEKaLS5rNh5CN2/XiWL7PuvG84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-54bbf3329c1so231629e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Sep 2025 23:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758523516; x=1759128316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2pT7nU31KC3yAr9S8YEwrTsIGl6TmmeSEMqmYUADM4=;
        b=qjMLWHYMOD4P6LXDX8zON7/xKf1EXrmCNhuxR8g+TCjxLEnmZwXNx+RX7vrWF18Njj
         NDinp2SC6CTau4lYyZxfHwHYpYWBMUphMnJaYWunbFODxWKAOj5edT5rw3J0P2gmeSTQ
         g+NdCFHsBYUOMjdJqpDT0dlSpoWOYiDiveKzbn/PTsutyszVQqFGGmqfsAnpnhio8482
         EC3sULTT14nw4uOpIZV5Luxg3Q3Z7kjZLG2EByEptoFza2GqZz1haJm7gI6SMV+Py5gD
         ocHCRAWkls8XfxKP8fhO9H+18mE3EJVRC01NJ73qopw5Ni1VrFswghDgfTC9/toV++af
         SXyA==
X-Forwarded-Encrypted: i=1; AJvYcCVD5/q4WnkZPg7iXMp2jVyHPGIPFvUB8IXrsMrqZWMCZZq+sQT0uaNfnMSnAoHhbZ/BMURIXTYfZFo3sgZ/zYd6qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGpWhtTBtbiUxCefivaNSVUH77MpNAtdSi1Ou2j1ZBjnZcr1fC
	V58ZIGyIzf9iTu3TntD3X0ZBgd9DLvV6WxQ0L1pgatx7GM+TqGgCnxHu3aYXzqeH
X-Gm-Gg: ASbGncvzKwnSwHIEneWR1iFBnQTS9QQXCje74P+nUlG/XvOWPUcodZh+WInkO7aXVZV
	ySDhjS02+B1qFHqKqL32kQ2MntwKKqn+i4UQYLMpuu1eRpyg6PniAwVczMPLJUmHEDxuC9LIOqQ
	avNo9ajuQkVyDeJqLEPBU/7xqMOldxNiZ7WJzcDtZ3oPz8A0hmMABGs5lzGeN48iXvWXt4MuxZ/
	3c/jHnugWJvqJ5suW6ZMeHNVm/xAVWakLGGwJfEghmQbFbTDEczlhVcnKOu/n1opyP7TfKotcK1
	yfF3lNOEcVGZ2e2uEpizE7li1fvWSL2gTr6Skte6Qsh26Up2o2hUFwpJnamYF7SAZerAltfM9hh
	ntnMVQF0U0GWhDKFwCw9dCvWx17rPmhKeAGLC74m67Hx7z+Cv1v7qbv8bk5Fe
X-Google-Smtp-Source: AGHT+IEzz7ULBVwiUq5KhR+/HeauaC5BhXZ91gsAMmqD8UJQG5ADUVnDz24PSle/AxyO0EGaJYQIDg==
X-Received: by 2002:a05:6122:511b:20b0:54a:a58f:e989 with SMTP id 71dfb90a1353d-54aa58feb78mr811310e0c.8.1758523515968;
        Sun, 21 Sep 2025 23:45:15 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e4bf0ff3c0sm1603144241.3.2025.09.21.23.45.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 23:45:15 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8e3d93c0626so2574771241.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Sep 2025 23:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8XQ3NE+DNT3cBe5sGld8cYgBOPp6V1faWIMI4k78rsZ2QA0sKQj1HMEA06ntT2nnHi60IO4CmhexZwanNesKT0A==@vger.kernel.org
X-Received: by 2002:a05:6102:6d0:b0:58f:1e8b:a1c1 with SMTP id
 ada2fe7eead31-58f1e8ba864mr2544747137.2.1758523515209; Sun, 21 Sep 2025
 23:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com> <066d5882-89d4-4d10-a054-4d0fdec88cd7@mailbox.org>
In-Reply-To: <066d5882-89d4-4d10-a054-4d0fdec88cd7@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 08:45:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFOfmFn--DygQX+YWCHv-08kzajxy4EW1EE+aJ3s2Dsg@mail.gmail.com>
X-Gm-Features: AS18NWBvewPp6Spu2fbQeSe_GnNCFEAMv65KCUiUm_kJHXIyUoB47n-e3LDoOvs
Message-ID: <CAMuHMdWFOfmFn--DygQX+YWCHv-08kzajxy4EW1EE+aJ3s2Dsg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, 19 Sept 2025 at 14:19, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/19/25 9:21 AM, Geert Uytterhoeven wrote:
> > On Thu, 18 Sept 2025 at 17:05, Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >> On Thu, Sep 18, 2025 at 2:42=E2=80=AFPM Marek Vasut <marek.vasut@mailb=
ox.org> wrote:
> >>> On 9/18/25 1:11 PM, Lad, Prabhakar wrote:
> >>>>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/r=
enesas/renesas-cpg-mssr.c
> >>>>> index 65dfaceea71f..7b52e8235984 100644
> >>>>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> >>>>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> >>>>> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controll=
er_dev *rcdev,
> >>>>>
> >>>>>           /* Reset module */
> >>>>>           writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> >>>>> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> >>>> Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> >>>> to read the reset register `7` times and confirm [0] (as mentioned i=
n
> >>>> the HW manual). So after reading do we want to confirm the bit is
> >>>> set/clear?
> >>> This is interesting, I wonder if the readback is something more commo=
n
> >>> to this reset controller.
> >>>
> >>> Why 7 times ? Is this documented in one of the HW manuals ? Are those
> >>> public and can you share a link to them , with the specific chapter o=
r
> >>> page I should read about this 7 times read requirement ?
> >>>
> >> Yes this is documented in the HW manual [0] section 6.5.1 Notes on
> >> Module Reset Control Register Operation:
> >>
> >> 1. To secure processing after release from a module reset, dummy read
> >> the same register at least seven times except RTC
> >> and LCDC after writing to initiate release from the module reset, and
> >> only then proceed with the subsequent processing.
> >> For RTC, dummy read the same register at least 300 times and for LCDC,
> >> at least 100 times.
> >
> > Ugh, the number of times depends on the module to reset :-(
> > Do we need #reset-cells =3D <2> to encode the number?
>
> This does seem like an reference manual issue and will be updated.
>
> However, it also seems if this encoding of per-reset properties is
> necessary in the future, it would be better to have reset property
> tables (similar to clock property tables) in the kernel instead of
> encoding the per-reset properties in DT?

Yes, the background task running in my brain had come to the
same conclusion ;-)

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


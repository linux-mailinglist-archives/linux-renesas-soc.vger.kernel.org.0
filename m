Return-Path: <linux-renesas-soc+bounces-6797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81784918013
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4A911C23A0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 11:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36C517FAAE;
	Wed, 26 Jun 2024 11:45:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C0139D04;
	Wed, 26 Jun 2024 11:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402340; cv=none; b=rtBGNkGbYgRp8+VCe2Jx6S37/QmvR5qIlggzZaI83w7tsj34OicFe6vZPXHyDnJcXzCmrtpqpAqI4FgHjr7jZZ4XMZP7NCpdF/rHJJWdUAMfcQZTSDYeQQLPUgCM++FoGji5496jXSV5QqF9z6vc8j+nMYVx0ZbBYTsyIQnkQ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402340; c=relaxed/simple;
	bh=LeDGrFkI+ijiHj0b217pMDU6TEehvU6qd7kkT50N7bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGTY9TYT4FN5Fq6zFFC9uTR02/pRd0hOuwxYyuG4gCHXfYKOMLdMBsIqnccHjhvNsgTYxmZG8y74mp4B5ck028t9Yy/YkC2o/k0UKsOWfMHiqPjtwtmndS+lAKrF+T6p8aJF9zv6ELEucSLcd1RqddcX40J2b9PU5g53BhSZJqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-64361817e78so39871357b3.1;
        Wed, 26 Jun 2024 04:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719402336; x=1720007136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zzll0rI5uiXKM5cPyLP5LSOoo7jLrCGbJj/NaLWvAiM=;
        b=Nb6nV2LyYdiFeTyaw5oCCtKWunOVN2xcrgzEua5GEkeeF6JWtdKOerQOwcaWaFlE+L
         w6Gqm6ZHTzFZ0hDPtEXSaUx1VgXFOH8xNULwKRJ6pa0LCtS6GsBN0lA3pS0y/XIyLoql
         TI+qjPzjCZduApjla5SYaFV9iHjqdWqY3AT762oPquZaSkLbBtAWQVk7qrDrNwP+Sk4r
         j26uOyIO+pdz446WLIQkrQgfHHmRwaaMlhEWJVhQML6OQ825eeZjc9nGyW97W6PdZN9j
         e/4j7nijfK26LqpdXgWoGsNNYnRUWTEWmQpUD8uOcGfLtc48YO+bJkqIL0q8IaXarQGN
         44bw==
X-Forwarded-Encrypted: i=1; AJvYcCXwqICVDrNR+1zrp9erI/rvakczSkFHbaUW90fkpLNFm0gimeQUnx6qC7PAOce9VWa/6ldCY8aNtRALyiUQDTZF1u4fNORh8b6HIZ/KG/hXJCaLg6o2Dhi5OPum2+Ou8lugXjYpUDzDCrMTZC4p6o+4z3Ilt1n0HUID4Qzk8LW4s/jJ3bbwFHUH+qtysKV5SQoLGTbmYyfT92DyEEMuc5xwJrlwW6Y3
X-Gm-Message-State: AOJu0YzXaasmUOVl6GHeCP22qU94B/+72EdP/ZnFeC1KkzIYI6M2l6Ut
	gWpNup/DnnYcZXHxkZqJHHjfDpTTJCS48VMr7GcQnrmXG2K5nmRXTNxm0HtX
X-Google-Smtp-Source: AGHT+IFfIaBL/ZPJQ7eDL4Vu8lDuBrjbtiNXSVUuK0ggIKLNWS0Zuxo/1u0SnoQJD/93uEj/eREmgg==
X-Received: by 2002:a81:ad22:0:b0:61b:e643:58c7 with SMTP id 00721157ae682-643aa69ca11mr104475207b3.28.1719402335788;
        Wed, 26 Jun 2024 04:45:35 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-644bb43d712sm19933277b3.136.2024.06.26.04.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 04:45:35 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-648b9d03552so2117407b3.2;
        Wed, 26 Jun 2024 04:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2HWD6DcoHV5gTY3GwmpvyiAqXb+o3ooLpMXgfH4CVOkBtZWHHFdb3wSJz4Vvhfdw9pw/Vq+vKeRyL4Hzh8k3FDgOacQeOK50TFSYVzT/cqXx2thlx95tYA7YkJCxbBLH2IGId0Y+K61xoqryxyvhHYywRCAKGoYYONOjdKa6GbwV6JeVW+Io/wGlVwvy6sv8Ovhrxd5dLEr6MQj38qF91ajDSAy5p
X-Received: by 2002:a05:690c:ecd:b0:632:5b24:c0c with SMTP id
 00721157ae682-643a990bee0mr117158047b3.5.1719402334777; Wed, 26 Jun 2024
 04:45:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <34b21e6f-0896-4691-9b66-d06ef2f44905@kernel.org> <CA+V-a8u6dDpbb5BrQ+ty_RbwcPOF-U6rnJnuASRXEDVdrhrvAA@mail.gmail.com>
 <20438973-d7a1-427f-a2ed-5c5b9f7db872@kernel.org> <CAMuHMdVrXmDBxD4gGkHvs3iUuT6nnzjWzVUme7jH5u=YpyzQuw@mail.gmail.com>
 <214be4bb-3e24-4868-8cb7-db73b6cd4b50@kernel.org>
In-Reply-To: <214be4bb-3e24-4868-8cb7-db73b6cd4b50@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 13:45:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZV0V7St=bXu8Htq40a4qhjMTAV5yP3KYSi6teaQ7ZRQ@mail.gmail.com>
Message-ID: <CAMuHMdXZV0V7St=bXu8Htq40a4qhjMTAV5yP3KYSi6teaQ7ZRQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: clock: renesas: Document
 RZ/V2H(P) SoC CPG
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Jun 26, 2024 at 11:41=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 26/06/2024 11:35, Geert Uytterhoeven wrote:
> > On Thu, Jun 13, 2024 at 2:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >> On 13/06/2024 11:53, Lad, Prabhakar wrote:
> >>> On Tue, Jun 11, 2024 at 8:02=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>> On 11/06/2024 01:32, Prabhakar wrote:
> >>>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>>>
> >>>>> Document the device tree bindings for the Renesas RZ/V2H(P) SoC
> >>>>> Clock Pulse Generator (CPG).
> >>>>>
> >>>>> CPG block handles the below operations:
> >>>>> - Generation and control of clock signals for the IP modules
> >>>>> - Generation and control of resets
> >>>>> - Control over booting
> >>>>> - Low power consumption and power supply domains
> >>>>>
> >>>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> >
> >>>>> +  '#clock-cells':
> >>>>> +    description: |
> >>>>> +      - For CPG core clocks, the two clock specifier cells must be=
 "CPG_CORE"
> >>>>> +        and a core clock reference, as defined in
> >>>>> +        <dt-bindings/clock/r9a09g057-cpg.h>,
> >>>>
> >>>> So second cell is not used?
> >>>>
> >>> It will be used for blocks using core clocks.
> >>>
> >>>>> +      - For module clocks, the two clock specifier cells must be "=
CPG_MOD" and
> >>>>> +        a module number.  The module number is calculated as the C=
LKON register
> >>>>> +        offset index multiplied by 16, plus the actual bit in the =
register
> >>>>> +        used to turn the CLK ON. For example, for CGC_GIC_0_GICCLK=
, the
> >>>>> +        calculation is (1 * 16 + 3) =3D 19.
> >>>>
> >>>> You should not have different values. Make it const: 1 and just use =
IDs.
> >>>>
> >>> Are you suggesting not to differentiate between core/mod clocks. They
> >>> are differentiated because the MOD clocks can turned ON/OFF but where
> >>> as with the core clocks we cannot turn them ON/OF so the driver needs
> >>> to know this, hence two specifiers are used.
> >>
> >> Every driver knows it... I am really, what is the problem here? Are yo=
u
> >> saying the drivers create some unknown clocks?
> >
> > The driver knows for sure which clocks are module clocks, and thus can
> > be used for power management.  To simplify the driver, two separate
> > numbers spaces are used:
> >   1. Core clock numbers come from IDs in the DT binding headers,
> >   2. Module clock numbers come straight[1] from the hardware docs.
> > As the latter are fixed, merging them into a single number space in
> > a future-proof way is hard[2], the bindings use 2 clock cells.
>
> IIUC, your module clock numbers are not DT ABI and should not be put
> into the binding headers. I think that's the case currently, right?

Exactly: they are hardware ABI, just like e.g. GIC interrupt numbers.

> If above is correct, considering your explanation I am fine. Thanks for
> the time to make it clear.

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


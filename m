Return-Path: <linux-renesas-soc+bounces-6785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE600917C9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 11:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A041C208BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 09:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C4C16E867;
	Wed, 26 Jun 2024 09:35:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF416CD1F;
	Wed, 26 Jun 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394538; cv=none; b=Ju7TUPVIHGZQki1rQKqCasADs12otnYHJoQolpB8BwTpB8WjV63648TBTLiFm/93uTxOZbEh8/qw/lkSd1qSwIjGKbuGCyNQLAnf3v5jUKalBIPAqCpOO+uOdEX/BRMJmZPZutTSeSDVTjxBHH9k1YjOQgiI+Q8LZKJlAULEOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394538; c=relaxed/simple;
	bh=mJPHb1h8PtVkohruP9kTZw0RpbsN3fWIjbsowGJOhB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwBZjrJEg8JIlPqTWsH5BDpxeoJe3zw0lFman6rMUl+YyFIwZpJlGNqB4mcGXYf0Dtew5VuiIU2woh43ytG5If6Av+LPT0p3DuFbM/iuDqTOscd1BhmTyMPmjjEGcCyEFkLSRqkcHsswXviLVkpB9jMbVxPqAFcUsK4nNmmGXSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6326f1647f6so60079087b3.0;
        Wed, 26 Jun 2024 02:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719394534; x=1719999334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXYZ7JaFw5Xny2CU1Qww3vsC5MqHS7GWiaZ6UXzK1eQ=;
        b=tPwqKM9oMEOv4PiHNutxalmXqJZvVFWJLauz5S+M438l/Y2J1yxlgYVSWaDQanzoYw
         yHQSP/AnUouOI8EF90b0gYUyu/gism+1fJHRz3hNoNxanXfYMDLMV9hJCU5aAPz3onWr
         aUl/YT3mC52XkLukdBUmVi+yv2ZZn95sZDGo4edlvHJKkEM+AoLoEGWkYBhie9BlHJgz
         n/3ynzUNWrOa7tRt1pHjeT1BFWc0zB2/B/T3FHobgvtKFgQFKWE64NDBZaltURwHPrOX
         jsusVokagVa6yvPZYkApdWa7z8lYtH8o5udIcvpMAn1PhjNHOwPiR5CHwbJm75T/3X52
         UKgw==
X-Forwarded-Encrypted: i=1; AJvYcCX1SJKo3RpQy2idn3K2n5ctaCUlPF95ygC9V8nKtna5m2LZZOlJkOHqBW+CLSNcNlGJg3kzpqKlER+LUxdz/PEf3n5+jlaJop7R/dicwb2SNB6wMIKoq/Etg4ToQKlBG8q4vlFJEj/hcIWA0lE2SOm5h3zBcp5epoVtyEGXzROCPgMrWgiTS8PTZh2GWu3sbdTDxChE/UAblirkDpr1lJducd9kCY4J
X-Gm-Message-State: AOJu0YxdLf6L+WGxbrud+hpldIitpeAtD0WQztbZj1Lc61SCTmyp6oAw
	9ADDy3HGg1Q+HowrFPlyNS7MoSTA3zXwFkp7w6XYBd0T3Ri0+5lEJ8WDN3vR
X-Google-Smtp-Source: AGHT+IF10ois1JaXNgZUnMdqAsjSc5sEBmXo5QKR+U0QqKNnkVc/SCIXI38rXLcv+m3ZiBypHAWyew==
X-Received: by 2002:a0d:e603:0:b0:627:a757:cdfa with SMTP id 00721157ae682-643ac81d382mr93856377b3.38.1719394534188;
        Wed, 26 Jun 2024 02:35:34 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f14e10330sm38247737b3.76.2024.06.26.02.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 02:35:33 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64546605546so32976537b3.1;
        Wed, 26 Jun 2024 02:35:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj1AGAfgHHD56y+dCdVn671LVnEOfsf/EyTjjaAgSnR1U86NDULoJFumBWTySpJeJ6psFSo36ATZ/zh0DWK8ecGbXoIKXAk2cZDELVWm0F83Z3CAcb+yy3dbkOD84eNQDNmofZux25/KeD3KBhwweTrGCla8zFeR5EhqpIMAYTYN2owK812OAkT6k4gTi1g/HEJ49UheiRM5bbVuFr2BJBWGy6SH8r
X-Received: by 2002:a05:690c:4b02:b0:63c:819:2a8f with SMTP id
 00721157ae682-643aa5a1d6fmr113309907b3.4.1719394533239; Wed, 26 Jun 2024
 02:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <34b21e6f-0896-4691-9b66-d06ef2f44905@kernel.org> <CA+V-a8u6dDpbb5BrQ+ty_RbwcPOF-U6rnJnuASRXEDVdrhrvAA@mail.gmail.com>
 <20438973-d7a1-427f-a2ed-5c5b9f7db872@kernel.org>
In-Reply-To: <20438973-d7a1-427f-a2ed-5c5b9f7db872@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 11:35:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVrXmDBxD4gGkHvs3iUuT6nnzjWzVUme7jH5u=YpyzQuw@mail.gmail.com>
Message-ID: <CAMuHMdVrXmDBxD4gGkHvs3iUuT6nnzjWzVUme7jH5u=YpyzQuw@mail.gmail.com>
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

On Thu, Jun 13, 2024 at 2:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 13/06/2024 11:53, Lad, Prabhakar wrote:
> > On Tue, Jun 11, 2024 at 8:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >> On 11/06/2024 01:32, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Document the device tree bindings for the Renesas RZ/V2H(P) SoC
> >>> Clock Pulse Generator (CPG).
> >>>
> >>> CPG block handles the below operations:
> >>> - Generation and control of clock signals for the IP modules
> >>> - Generation and control of resets
> >>> - Control over booting
> >>> - Low power consumption and power supply domains
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> >>> +  '#clock-cells':
> >>> +    description: |
> >>> +      - For CPG core clocks, the two clock specifier cells must be "=
CPG_CORE"
> >>> +        and a core clock reference, as defined in
> >>> +        <dt-bindings/clock/r9a09g057-cpg.h>,
> >>
> >> So second cell is not used?
> >>
> > It will be used for blocks using core clocks.
> >
> >>> +      - For module clocks, the two clock specifier cells must be "CP=
G_MOD" and
> >>> +        a module number.  The module number is calculated as the CLK=
ON register
> >>> +        offset index multiplied by 16, plus the actual bit in the re=
gister
> >>> +        used to turn the CLK ON. For example, for CGC_GIC_0_GICCLK, =
the
> >>> +        calculation is (1 * 16 + 3) =3D 19.
> >>
> >> You should not have different values. Make it const: 1 and just use ID=
s.
> >>
> > Are you suggesting not to differentiate between core/mod clocks. They
> > are differentiated because the MOD clocks can turned ON/OFF but where
> > as with the core clocks we cannot turn them ON/OF so the driver needs
> > to know this, hence two specifiers are used.
>
> Every driver knows it... I am really, what is the problem here? Are you
> saying the drivers create some unknown clocks?

The driver knows for sure which clocks are module clocks, and thus can
be used for power management.  To simplify the driver, two separate
numbers spaces are used:
  1. Core clock numbers come from IDs in the DT binding headers,
  2. Module clock numbers come straight[1] from the hardware docs.
As the latter are fixed, merging them into a single number space in
a future-proof way is hard[2], the bindings use 2 clock cells.

Alternatively, a unified number space using IDs in the DT binding
headers could be used, as you suggest.

[1] "straight" may be a misnomer here, as the DT writer still has to
    calculate the number from register index and bit index:

        n =3D register index * 16 + bit index

    i.e. register index 1 and register bit 3 become 19.

    In the R-Car series, this is handled slightly more elegant
    (IMHO ;-), and easier to the human eye, by using a sparse
    number space:

        n =3D register index * 100 + bit index

    i.e. register index 1 and register bit 3 become 103.
    Which also matches how the bits were named in older SH-Mobile
    hardware docs.

[2] One could use an offset to indicate core or module clocks, but
    future SoCs in the family may have more clocks.

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


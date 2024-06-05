Return-Path: <linux-renesas-soc+bounces-5873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB48FCF3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 15:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21D64B2CF68
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 13:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609B0195810;
	Wed,  5 Jun 2024 12:40:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7A01957FC;
	Wed,  5 Jun 2024 12:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717591247; cv=none; b=mkv/oPb9D6DngXhTCDxISGZ10kywUiBeaVjgmHzU5OC6knmK1C7qPohPVkKddLWXGF44kObADX3zQJEecYNEDoE9k4yr9oFDdQoS1j3RhjhYyyTsBuVXg27+fosbUZ8QnPXRlLjNRBxZ1jb/lgWkmFTPPeU1HUcxO1Gt/TAhQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717591247; c=relaxed/simple;
	bh=L9f0nPu86ClISH3h8JDLKArTlRwI6HQQN1TeZVB8Ql4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aX2t168ba5rLNjPAVGq+05yudDUYD/ESVDHc/A21ivmNlw4Qbr+ko58rOtY9tjuptHC355dozt6YUd6z3ejT36MLuepM6/K1xJAYTJ4EySpkvE6ja9NcRngTYLTbBazLySrGpU3kRkOHsFGXs5JAlR7/jOUB8GYWk8y+IhzZDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-62a2424ec50so71433237b3.3;
        Wed, 05 Jun 2024 05:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717591243; x=1718196043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QA2P5Xr8Q0KSzKZJIkj8jUkBjIWrqYG6SJ0zJfpivIQ=;
        b=M8+ci1mQX+JyvI7/9DGyS2SKkRGVNO8n6MnqDCetO94TRsX6hiPd+os6PnG+MLssoG
         NhHozFQ7XbOjO0X/zvOTpOmmAYMm7DlZOrj9AOWTzDyrgqb+dTZEwickWFC+5eZscFFD
         lbkO5kRWJtcZQF0zw+BQI1ZC6xH583ygRlnZoV0eBLqSy5+5t8pgpWg+yEEpHR9U2cZy
         Nq3zVfVePhvC9EM2t8lKTCpESffBJgGkBYQWFQK4o7nafd7zPsAHjuBIyOUB3n1s7P/0
         gm6FQrGbMq+sYIcJ6mk71B0v5h/oDg89ls8Kvb6Osk1o6iSccF92feYfVpunN+wKw4UE
         mq0g==
X-Forwarded-Encrypted: i=1; AJvYcCUAb7a+UAYeR8JxK5Q8b6p5bgpvitOlySJ9+uFyyWr+6PsowZabRzHlzAQtlLTULnHiHjqBEPVwjrjXvCvVKwnpG13PeNP7XUX9R24IqGXQPN7/ZnYt1WpD8Hc7yHxm2u2knyMa1BZBiO4rLYX/C0bLCHMUys5LRNjetHpEJeTPjb+VlBKKycoZHBVIDzH3aLGHHimRUpN5h3fiUyyJfU8AHHEE+TNC
X-Gm-Message-State: AOJu0YyWoW6448jYaLzHmMABcbLkkzjeIHLk3VIaEkGSLFTnIjo2jobu
	/N/5YqBYLtY9j7/z12JsqIH3sFewwCJB7k/iNIwbX4Zff9FjFFE1rwfx3pJ6
X-Google-Smtp-Source: AGHT+IEeyo/5wHU6sVa9oOhmt9I8O5qBu+xsNVmh3RLnsPOaTESN6RyU2uwVNomGzFmS4jhrfirk0g==
X-Received: by 2002:a81:b717:0:b0:62a:530:1e53 with SMTP id 00721157ae682-62cbb504e14mr21958887b3.30.1717591241387;
        Wed, 05 Jun 2024 05:40:41 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c766850aesm21918417b3.102.2024.06.05.05.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 05:40:41 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfa727d47c1so5171939276.0;
        Wed, 05 Jun 2024 05:40:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9LbJI1sms3UgoOn0dxdCnEpuOw/+h3VmdjpLIgd4hm8a3C4mo6uUsinzrigqiJdscFjMht8KrvSfrjBVjmYAc4DElNfWHCow/GajuMjm52N6o6x87LFfQ4Dk294NDbPw5MwC7ZCEroGjJ1L2SecxPAZxn30fqwNP+VTRlonHP0K2RsrJ2932b1nTxqs2Bz+0h66cPfJCzal8U6Wv/IDwjOsOzj7zm
X-Received: by 2002:a25:b20f:0:b0:dfa:b28b:a0c with SMTP id
 3f1490d57ef6-dfacac53bf8mr2604814276.26.1717591239815; Wed, 05 Jun 2024
 05:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWzZP2d6kRw1oTkMYgzS46J68gR_bg14==HCvVpkp0sJA@mail.gmail.com>
 <CA+V-a8uxwiof-hLPRpYCnDkVs8tj+-+v8GQLSSkMFUP13cuoXQ@mail.gmail.com>
 <CAMuHMdWEKCB3XdwQeK_MOUm3wyrhLtVXE+96vAVLv2iurmGbJQ@mail.gmail.com> <CA+V-a8s3J8PzmA9DqoazdAoC2WRdBASvWTr35FFzfKnJ7yWayA@mail.gmail.com>
In-Reply-To: <CA+V-a8s3J8PzmA9DqoazdAoC2WRdBASvWTr35FFzfKnJ7yWayA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 14:40:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNHSf6fN756GgNqNsYDDm2v6p+KCTZYDBx08M3213kkg@mail.gmail.com>
Message-ID: <CAMuHMdVNHSf6fN756GgNqNsYDDm2v6p+KCTZYDBx08M3213kkg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add R9A09G057 CPG Clock and Reset Definitions
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, May 30, 2024 at 12:00=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, May 30, 2024 at 8:12=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, May 29, 2024 at 11:10=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Mon, May 27, 2024 at 10:18=E2=80=AFAM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.cseng=
g@gmail.com> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock o=
utputs
> > > > > (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registe=
rs)
> > > > > in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the=
 RZ/V2H(P)
> > > > > Hardware User's Manual (Rev.1.01, Feb. 2024).
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > >
> > > > > --- /dev/null
> > > > > +++ b/include/dt-bindings/clock/r9a09g057-cpg.h
> > > > > @@ -0,0 +1,644 @@
> > > > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > + *
> > > > > + * Copyright (C) 2024 Renesas Electronics Corp.
> > > > > + */
> > > > > +#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > > > > +#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > > > > +
> > > > > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > > > +
> > > > > +/* Clock list */
> > > >
> > > > No distinction between Core and Module clocks?
> > > >
> > > I was in two minds here. Would you prefer clocks with no CGC support
> > > to be listed as core clocks?
> >
> > What's CGC support? (Obviously I need some more reading before
> > I can tackle the rest of this series :-)
> >
> I meant the clocks which cannot be controlled by the CPG_CLKON_m
> register. Shall I add them as CORE clocks?

If you don't need to refer to these clocks from DT, there is no need to add
them to the bindings header file.

> > My comments are due to the bindings saying:
> >
> >   '#clock-cells':
> >     description: |
> >       - For CPG core clocks, the two clock specifier cells must be "CPG=
_CORE"
> >         and a core clock reference, as defined in
> >         <dt-bindings/clock/r9a09g057-cpg.h>,
> >       - For module clocks, the two clock specifier cells must be "CPG_M=
OD" and
> >         a module number, as defined in <dt-bindings/clock/r9a09g057-cpg=
.h>.
> >     const: 2
> >
> > while the header file does not make it obvious whether a clock needs
> > CPG_CORE or CPG_MOD.
> >
> I was intending to drop the CPG_CORE description in the next version.

OK.

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


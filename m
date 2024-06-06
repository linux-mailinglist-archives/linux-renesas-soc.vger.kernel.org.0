Return-Path: <linux-renesas-soc+bounces-5921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9568FE58F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 13:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C4CD28729C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 11:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D651F195815;
	Thu,  6 Jun 2024 11:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8M8ZF/+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C1419538A;
	Thu,  6 Jun 2024 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673805; cv=none; b=Taf5Cy6nuai75/yAZFkuOVQraG7rPpmPXoZN+Ti1XN4kDY60Lm9Zj9ASuwWpXEWhxyEhC52jRIGBWlnA/klSZ/6NgS5XIU6jDkg8TNC3QPmfQGqhlxFHl5dUb23ex8wy9//0eLfFKWXIGVqIH1+HxLkbpbn+y65AyIhnDAoIooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673805; c=relaxed/simple;
	bh=BNivUvo0MWg8WrpAftR8nWhdNcYuD+IaXADkEIdXQfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dl3IHqoUfFAJhLpNV7LkhFC5TM9IwETVhABWDLt4ckrH4tW7T9vdtABW4Ax1VzA3lmZ2WQvDntRIeKHu8YVPdrFfE8Iqg5c1t5kK1z4wzrX5Q7ZECp8E+ICaJj0J3vlry4I52ltrzGKLTWfO5CK3AYd7kAxmeoPrI1jvBgGVPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8M8ZF/+; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4eb1d56fcadso311881e0c.1;
        Thu, 06 Jun 2024 04:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717673803; x=1718278603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDJv2Oma+0BuzzGYTy4GUHcJcQy1lEY6HhimPzAvoR8=;
        b=F8M8ZF/+5iH7ungUsj3eDRh/TCDwqUE47RVy7LOOrgxVz1SdwS499EQlJqa3rXEXDO
         bNsPtwPx3gwMQrSCyvPoOMqjXrJ14yURYuWdmhoGsUsOw1/N8GQf2kUNMtx1/bqp3oT1
         iaYWTM9ovTt/3WE3/l2+6aG9lH5n9DwUEpHIEwrnxiKv8gB82dcq+PYSMIDGcmtPGxRe
         Cxf3Vo3SqPsIWSIleIlsnObJ0b0m7dxT0Bm+n5qq9PxOo1gfzZUE5LYSoZpqqsjxWfRy
         lfOFy2ZAybAnNZAiVPegf2AVZ9WatyXqS8VGur1V/Ol6qd5ZsfRbE+P/pp4aL8+HwRFM
         E3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717673803; x=1718278603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDJv2Oma+0BuzzGYTy4GUHcJcQy1lEY6HhimPzAvoR8=;
        b=w9Twx86k/ClL1Mw/PGSeYT1NXS0MuFYWo6XKzsmsusAsN5wJjcWFtKVuIIO3X2yyW8
         QXZ/myDg1bBLA4YqzHTEdCIR1+Kw4wZdCaoLK9EYZnjzwHmY4uul77lrKAjm3wPWLKx7
         ZTFDVm4SWF+W11f7diwYeckfNRgPs0rAyF4sbdhupTvi0KSZ7/aZ0wRI5TTYeh/lcHf0
         rI9mTLC9lvnOTR+bOLBnzMvqh1wPGRKXOLblmwMOlj7UsajmJT3EI5N/kNqVJQ9AX9L9
         rUBdHcPmKe7CjJiLi3L0CYWaQ/LseodgFS4ka1BmP9geLADrJWft5/trj3dckm6GwOKa
         j8NA==
X-Forwarded-Encrypted: i=1; AJvYcCXaalyjDj4i4Imz6b/lTZyECG3mHrU1WIna7Ml5JKY2WlYmlw9nTAmiX13gRHO/DvGpm70vTljqoYafYTd6EygBqpgJg/BQHQtVO5knpSnx2NEHiWemaZZ8lcze6oOLv40oz2i/fMmkEFyt7nquqaddK7JlLo6na0HsQ30FrDGlijQU/kOLextYlnBU1gnrc7PknnGBg982cMTlb9J1JksfbwLhpoh3
X-Gm-Message-State: AOJu0YwnUuHD08EYQ+29JEQx3yCn9qv3Tm4pzlMpaTdwm//DUOC3mPO/
	Zt+XpGvcQAwYZSfPW9JTQTfFUe3fEe5BoCG4SrOFvCBbTs/nmVXUK0LswPITSjG/dWkmQkUQZ3a
	4rR3wz2yavsBWsdcrdPLybXh2vuc=
X-Google-Smtp-Source: AGHT+IGmX/vXqqcbJDok3bmZfA2zsm6PMj+/KTKNDG1N016exsq6IHYwqta73CQHrJyGXmANBw/XqOIOj3QU5fMKlrA=
X-Received: by 2002:a05:6122:1787:b0:4d8:7b33:c624 with SMTP id
 71dfb90a1353d-4eb3a282ceemr7193842e0c.0.1717673803069; Thu, 06 Jun 2024
 04:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWzrEKFHauJ=6UnsufJjDO3LfJ45eJXx1V72AmVzvsjyw@mail.gmail.com> <CAMuHMdXdFM2u5TjRQZCSiigC=uBk1kz6aW6hYTy5Wa=PCgX7yQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXdFM2u5TjRQZCSiigC=uBk1kz6aW6hYTy5Wa=PCgX7yQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 12:36:17 +0100
Message-ID: <CA+V-a8sch-XTk2ByBztEQd3QDef4RbVt7k-k=GnJGd-XvAkAdg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas: Document RZ/V2H(P) SoC
 CPG driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jun 5, 2024 at 10:42=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jun 4, 2024 at 5:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gm=
ail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document the device tree bindings of the Renesas RZ/V2H(P) SoC
> > > Clock Pulse Generator (CPG).
> > >
> > > CPG block handles the below operations:
> > > - Handles the generation and control of clock signals for the IP modu=
les
> > > - The generation and control of resets
> > > - Control over booting
> > > - Low power consumption and the power supply domains
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > > +
> > > +  '#clock-cells':
> > > +    description: |
> > > +      - For CPG core clocks, the two clock specifier cells must be "=
CPG_CORE"
> > > +        and a core clock reference, as defined in
> > > +        <dt-bindings/clock/r9a09g057-cpg.h>,
> > > +      - For module clocks, the two clock specifier cells must be "CP=
G_MOD" and
> > > +        a module number, as defined in <dt-bindings/clock/r9a09g057-=
cpg.h>.
> > > +    const: 2
> >
> > I understand this will be changed to 1, the clock number?
>
> We typically come up with our own definitions in header files if there
> are no suitable module numbers listed in the hardware documentation.
>
Agreed.

> For RZ/V2H, you could use a combination (e.g. concatenation) of the
> column (register) and row (bit) numbers from Tables 4.4-14-19
> ("Specifications of the CPG_CLKON_m Registers") and Tables 4.4-22-25
> ("Specifications of the CPG_RST_m Registers") as the clock resp. reset
> number, like is done on R-Car Gen2+ SoCs (see MOD_CLK_PACK() for
> conversion from sparse to packed module numbers).
>
Thanks for the pointer.

I'll model as per your suggestion (this way we can avoid adding any
macros for module clocks) and dont have to worry about reserved bits.

Cheers,
Prabhakar


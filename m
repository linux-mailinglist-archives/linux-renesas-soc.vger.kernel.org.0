Return-Path: <linux-renesas-soc+bounces-5686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E90C08D45CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 09:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 182441C21B23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 07:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F310C4D8B1;
	Thu, 30 May 2024 07:12:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2994D8A1;
	Thu, 30 May 2024 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717053142; cv=none; b=jNbhOxTGB/S527FLvabvL+ZnV39yDpXnBg9z/DPKPpd7YIsCLISbEO/JpYfSwciN4UMsCCxXOR0mEQ96kjbeUBR57D6ECM02804Rxz7Edb1spzffX3+7rYuMPDv2fgO3CDp1oyK7Cnip13jCvAMdJB2p7cPNjySguKASEUbIhgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717053142; c=relaxed/simple;
	bh=PKz1EZxwe0Xxg+9SZOqevI59oQ7sI56fbUrrtSgK6rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y69DB44LDYgK99vqDGf9I3nrjPUvu/Td1nwfN6AWKwagqpxm9DVjYPIc0rfsN/ouTGjWN6MHH4VIFxcVJ2SI205wsEdli10zYUPSuYVmZQdxxGkOjUUEbNaKCesQOJzCS4InVQYT2JiCgC3faI2BRM9Y8vx4ScyMlFvzzheuyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-627efad69b4so4947227b3.3;
        Thu, 30 May 2024 00:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717053139; x=1717657939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyNSHj0o/RWVtaOY8gZmEcLnBSvcNumfCPoamhSWsi4=;
        b=aeRetxgko57Zk3WkbP6YB+m8Iwap5d6AEOi3xqxfedsv3krTAb6CgWRKq1mCWYB1U9
         Yy+rO+kL6RN5rjAj0aM2EfzrIZPSq4VLLH12MxoicSasrYXI3/RQhcpKnGMnYrZAtTww
         dyxmtvXGirC68UXgEkgc811ArcJNjagFafqTr3e4uWK/gd7T33IjYpLMv09oVJnEL7hR
         sIqbFpWcT+fh2DH79GWmQJdunq7wxIx9EKwVyCwQrBBXhTUyse+nPZs57oZYPmn0LxR8
         JqPirTOSvn0WBM6h2SEClifszqsQoN+DRMVxCORFQTfzYKEwfYmuHfgZh2hC4AFmWfjg
         K14A==
X-Forwarded-Encrypted: i=1; AJvYcCWjNyK5Vg9v1s4S/l/Pe/tcz1V6HUvsjuPA4QyX7ooB2wYCSO6kQ5kpMJxb4trLYtiIhT1vLgEN8APEm2BiOgFYoxFVbIINexwERJINJWMRXN4+eoe1JmRwXyS80BBVZB2WovQ3o8GYTkdeaH0YxREt3RX9bIjbNaeEb778BMYQaYDSdXh2iRD4yDisT9m3GomFyD/t9xOV6Qxt5F5q7BItSehwAmM3
X-Gm-Message-State: AOJu0YyCdVgcycobxrg2dk6W0jn20Ou73W2xbQaWG8jD16hGJtaT3KHZ
	jq3XdEbMQthdUsjROwMF1zohIWPaAxcOX8yuMHhMu18fJ7pI37atHJX8HtO4
X-Google-Smtp-Source: AGHT+IFB9qeO+NXrL5ryUPVnOe/WpYBwOYpUmK240metnJSPPUQLGkfoKGiQu6RXlvek439bEbxW4g==
X-Received: by 2002:a81:8046:0:b0:627:dfbb:9b81 with SMTP id 00721157ae682-62c6bc13543mr13117477b3.24.1717053138615;
        Thu, 30 May 2024 00:12:18 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62a0a56e642sm27077897b3.135.2024.05.30.00.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 00:12:18 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa49a90146so493106276.1;
        Thu, 30 May 2024 00:12:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7c7bDMccFYoG73jvAuG7weDZOJCShw1nBtgjLvzRWbbgZQvyzI8Az185t7VgoM1FlGxgilq2QwJY/7M8lo/3pFpnQgrZ4eOU1BIM2qsmCOYleoac6RPuzVTEeHQllP8oO7nP4bG+9CqMqc0Cw2cgg7MmEhSBbjvS2eskfWSwywnzWb49OtN0pSLOemb7KCW7GUzLGQRPQpfPyrZmmh6i2GT9aoFYd
X-Received: by 2002:a25:b11f:0:b0:de6:17e7:ddd1 with SMTP id
 3f1490d57ef6-dfa5a60f54dmr1404276276.34.1717053137821; Thu, 30 May 2024
 00:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWzZP2d6kRw1oTkMYgzS46J68gR_bg14==HCvVpkp0sJA@mail.gmail.com> <CA+V-a8uxwiof-hLPRpYCnDkVs8tj+-+v8GQLSSkMFUP13cuoXQ@mail.gmail.com>
In-Reply-To: <CA+V-a8uxwiof-hLPRpYCnDkVs8tj+-+v8GQLSSkMFUP13cuoXQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 09:12:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEKCB3XdwQeK_MOUm3wyrhLtVXE+96vAVLv2iurmGbJQ@mail.gmail.com>
Message-ID: <CAMuHMdWEKCB3XdwQeK_MOUm3wyrhLtVXE+96vAVLv2iurmGbJQ@mail.gmail.com>
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

On Wed, May 29, 2024 at 11:10=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, May 27, 2024 at 10:18=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gm=
ail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock outpu=
ts
> > > (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
> > > in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the RZ/=
V2H(P)
> > > Hardware User's Manual (Rev.1.01, Feb. 2024).
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/r9a09g057-cpg.h
> > > @@ -0,0 +1,644 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > + *
> > > + * Copyright (C) 2024 Renesas Electronics Corp.
> > > + */
> > > +#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > > +#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > > +
> > > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +
> > > +/* Clock list */
> >
> > No distinction between Core and Module clocks?
> >
> I was in two minds here. Would you prefer clocks with no CGC support
> to be listed as core clocks?

What's CGC support? (Obviously I need some more reading before
I can tackle the rest of this series :-)

My comments are due to the bindings saying:

  '#clock-cells':
    description: |
      - For CPG core clocks, the two clock specifier cells must be "CPG_COR=
E"
        and a core clock reference, as defined in
        <dt-bindings/clock/r9a09g057-cpg.h>,
      - For module clocks, the two clock specifier cells must be "CPG_MOD" =
and
        a module number, as defined in <dt-bindings/clock/r9a09g057-cpg.h>.
    const: 2

while the header file does not make it obvious whether a clock needs
CPG_CORE or CPG_MOD.

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


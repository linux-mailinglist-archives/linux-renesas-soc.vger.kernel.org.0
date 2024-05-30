Return-Path: <linux-renesas-soc+bounces-5701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C98D490D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 12:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AF801C213A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 10:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59FB15B96B;
	Thu, 30 May 2024 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9em8k9x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392626F2FB;
	Thu, 30 May 2024 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717063221; cv=none; b=XRHNmyr2f9/cIcxxwK5xekWKtPHKTWJGKUAdFBHaKSD9VXkWMhblVL8zgaey8i92slv/WgYJPfuxhU7j/ZIMjKap5LrZO/QGO7Ixr6efhyesI4UWGdITJnW/QBdayFW7WPQ275xuAColcnhdzXi4XXXUUG4GQSUw76yHFTpxRO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717063221; c=relaxed/simple;
	bh=wzG3/oKSlCu97jSI7tiR1af+kcAssbvebzFAiTXOfN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2/OepSNPKXim30Jo0WILBfy85/4bKALTTiEU1tTlwZx05AKWJllD0SdqtRu82kRUMPCfljpcbEGPVf0kNBRSw0On0dVKz/emoxYQ8Z6pNDXtGo2AdVpaKRZFkynVPGu+M5sRH1gZ4kQJi1ImMCHTJISs1PMpJyVhSxv0cEEgyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9em8k9x; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4eaf633e879so117206e0c.3;
        Thu, 30 May 2024 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717063219; x=1717668019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZk2m4t/wZBrewLqNHs/q5cnCydB/XmJjrbH3KZsxkU=;
        b=B9em8k9x7t3ydFRLs/HwevWakKk8S+S8RSo50LEskbfDzIoCtjikI1BUIE5VGwyaU5
         C4Vt09Wt2/MxuQ0hyvtEwJQxXaFdxbwVz/XPi2Tmu/MXH0bW8hbmDDuutPxh9hzz356K
         8wcI2sN9SW16ejXrSyZmKMN2hPk0EdiR+owfNr77AdqRYHkwJPHdjz6+JX+v6lZjfedZ
         seZ/ElUGo2Q9GfImj/oAs1Ufaz17anLxJ54JyWVbwWiZM+kR8vTTcaNd72b1TMkiGxjQ
         AwA8uVzQBWeFjCopomLVPNGzZCll2AMfb8asnZuqeKc2eZhS9XWQK3+b6It79Endmexf
         P0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717063219; x=1717668019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZk2m4t/wZBrewLqNHs/q5cnCydB/XmJjrbH3KZsxkU=;
        b=W5oUUoUQ5aVexr7Sm+aNn9W68Igs5Sw/TiHheV1NDWsJIHqtwruJV+R9ixkepj0ASd
         QoVYpOieWj9rCVzzBfSxUoGtiOXmHycfOIIYVsDYWbTZUF4ZD8INWR/i9eyxYYAvkmpt
         G1YmFwf0C4A7cGCAYgM3W/lDaggJ3ovsMv0xZ9gNGJN6bi+6Xx0ismINpAXimCkc2Kp8
         GDzknWIEEIoC8evG8RpB5ajzBlos3WBeXPNWlY7b2Tf8ipUebHT/3UCbT+KcT60kt2FK
         aMXu9I0KvsDAdabKj6KNxNPbtrnIZqKFjue+BGqCdCKkfedRLxaZqPFveqMHhRbkD/i4
         XvNg==
X-Forwarded-Encrypted: i=1; AJvYcCXruHuFBHRcC5CRLaV3Pt6iFVTOm+5hRGsFlWgeGaQ9zeT0+RmGT/N1/MKi1a6M+9Wx02cOJ3Qy15rVUJDxPOq8XAzkxSzD1yZbht7fgaskAtQKxrfRn3D5YWQvhXs4pXAIh6DCnmcCoPRhm7V522Iyd5QhZhmKXDHnQVGAa/J/EmUhX06YVYugG+DSenxqpqp/GxPNvLJgRKq870CT1lYkFjJ1XIpS
X-Gm-Message-State: AOJu0YxQ3Nsa/AF40igsczWYpSCRQLRl2JsbEvXoLj4gsw1HMOQkNfBT
	+9Q1ywzO4tF+AHgT2PyN6vUXc49ux1k1npAag17kz4oItQDw6W7XW5bwN81rgWgsW/D5H5LUEbU
	38XoTbe1BvwKufZIacoN2IZjn+nY=
X-Google-Smtp-Source: AGHT+IEglIeefJXeLU08NkierhfvMwoJJ0E7IBSSdcCrVBdCPfR/6hJiuJNEUjJWXhADteWxcwZvskB2FK25p5Br2iE=
X-Received: by 2002:a05:6122:319c:b0:4c9:a9c9:4b3b with SMTP id
 71dfb90a1353d-4eaf21bdbcemr1889915e0c.9.1717063219050; Thu, 30 May 2024
 03:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWzZP2d6kRw1oTkMYgzS46J68gR_bg14==HCvVpkp0sJA@mail.gmail.com>
 <CA+V-a8uxwiof-hLPRpYCnDkVs8tj+-+v8GQLSSkMFUP13cuoXQ@mail.gmail.com> <CAMuHMdWEKCB3XdwQeK_MOUm3wyrhLtVXE+96vAVLv2iurmGbJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWEKCB3XdwQeK_MOUm3wyrhLtVXE+96vAVLv2iurmGbJQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 May 2024 10:58:59 +0100
Message-ID: <CA+V-a8s3J8PzmA9DqoazdAoC2WRdBASvWTr35FFzfKnJ7yWayA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add R9A09G057 CPG Clock and Reset Definitions
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

On Thu, May 30, 2024 at 8:12=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, May 29, 2024 at 11:10=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, May 27, 2024 at 10:18=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@=
gmail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock out=
puts
> > > > (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers=
)
> > > > in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the R=
Z/V2H(P)
> > > > Hardware User's Manual (Rev.1.01, Feb. 2024).
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/clock/r9a09g057-cpg.h
> > > > @@ -0,0 +1,644 @@
> > > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > + *
> > > > + * Copyright (C) 2024 Renesas Electronics Corp.
> > > > + */
> > > > +#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > > > +#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > > > +
> > > > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > > +
> > > > +/* Clock list */
> > >
> > > No distinction between Core and Module clocks?
> > >
> > I was in two minds here. Would you prefer clocks with no CGC support
> > to be listed as core clocks?
>
> What's CGC support? (Obviously I need some more reading before
> I can tackle the rest of this series :-)
>
I meant the clocks which cannot be controlled by the CPG_CLKON_m
register. Shall I add them as CORE clocks?

> My comments are due to the bindings saying:
>
>   '#clock-cells':
>     description: |
>       - For CPG core clocks, the two clock specifier cells must be "CPG_C=
ORE"
>         and a core clock reference, as defined in
>         <dt-bindings/clock/r9a09g057-cpg.h>,
>       - For module clocks, the two clock specifier cells must be "CPG_MOD=
" and
>         a module number, as defined in <dt-bindings/clock/r9a09g057-cpg.h=
>.
>     const: 2
>
> while the header file does not make it obvious whether a clock needs
> CPG_CORE or CPG_MOD.
>
I was intending to drop the CPG_CORE description in the next version.

Cheers,
Prabhakar


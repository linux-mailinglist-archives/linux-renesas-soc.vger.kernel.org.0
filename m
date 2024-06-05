Return-Path: <linux-renesas-soc+bounces-5850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D28FC667
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 10:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99A1D1F25B66
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 08:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CA549638;
	Wed,  5 Jun 2024 08:29:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301049629;
	Wed,  5 Jun 2024 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717576141; cv=none; b=JEqelsoNzh+MDwnNyrnJuCXUXb53qfpvrGLRDYvv6yfM6A7Ss0XUnhYxWTw8em4MxeZmL5PyxEk456uer7DG0GGmABmbZh6E614yds0r2HXasewMNEaTrmY6iOsWvlP5twa1Giso/b9S9GHrBPceyndIvgRdQoM6mWf8qCJFfQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717576141; c=relaxed/simple;
	bh=geEdGynOyucE3kHrS5qgwHTeebHnMtwLbCVySSNh2pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyHFDCJn4WHMYfPNVJhgsJx01N14X8FM/KFV+zhCBxgXMKu0N93hvmXySAzkHnUg5fwaeQqfIPt4zE6uakrg4ZgBO1PGuNtaggyNLvahjDSffRHTdwAn86SQLYpiWCpzpJQi5p+dSZ/hnKuqg1SjMQDbleuA8KLAUDfkF6uqeUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-62a2424ed00so70205577b3.1;
        Wed, 05 Jun 2024 01:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717576138; x=1718180938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hfd+FJyK15D+Es2iPmRAY8yc8/FtthQxewg+TITEWvc=;
        b=cNXucTOVa3Uu/jrFsNxJHtk8tgE9LbePs/wUWaLy41Jeurda6Zh8mbunTIRx/SX1ej
         NV++QPYR4Ak/YuGwtqzL77Y/RVS5Jo04f0UX1+NcbbSvRtSUrBrSMR6FLbcaPH8zqPzc
         jfUNCNa6hP3wChcs2lCyHkxVWPkrAqymCmKfSwwDRmOJcWU9hHJF0tIcBApMa6/92za8
         ZuFRFfPfuYZuxM92l9aYlPea30JW+MARLervdneJ/8IXxMskwmifaK/jgewghPGR7ytm
         xalTUaqURCjhQsW8JF0iphrE8o7lWiHUSpqWMRs7aM9JIFv5PeP+fv7wTKkjOxrII0p/
         yP2w==
X-Forwarded-Encrypted: i=1; AJvYcCU8dgsmTwAZuuXg9wfBKEzS4/dyU8e9pYkqHyrrB/KkAvBw2uAHoqxGdZhJ4ZJBTvQypmrxY3OCSn03/xHwBgz/JnVdgpf5IdkvmdNzyzEXK+aYRqT1TLJYs3JsmXmcXrz9m5I9B1iK1bMEbqcy3IsQ/8ubktnma1aqAbSRNn4QGHEZDbaT1a+Amh2C3bHwFHD179V7PHMwoW5dCDfpKZCapvB9jrII
X-Gm-Message-State: AOJu0Yy0Hdd8STxjj8l45GnnQGcmghUKLVUWNLQfEIK065IBhJUaTtdn
	5RM2JPS4vqBuRz+uzoymWvWyznMB0vdcWwDwbejfH8/C3d5pnzb0sLNT+Tbp
X-Google-Smtp-Source: AGHT+IFBf4tLiYdz6BArfyyARKZJ5SLf3QzbTVCrQNpEt950uAcKds0beYnueJOc5BdrnB/LljXMvw==
X-Received: by 2002:a0d:dd88:0:b0:618:1034:f4ef with SMTP id 00721157ae682-62cbb4d6396mr18356797b3.16.1717576138512;
        Wed, 05 Jun 2024 01:28:58 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62c765e715esm21584027b3.56.2024.06.05.01.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 01:28:58 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfa4876a5bbso5981409276.2;
        Wed, 05 Jun 2024 01:28:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWsnEgw+vTQWWRHdYIWA4523CerSrM8Z/n/tIgUggDz2qhjkV1/OgQWdKbtTrfq3DUjmn0swhyeSqbT2wDrEqrE0dNAkkDBG2E+4KSeAkDHjY1KZbNAmSoV9/gYT+b/VMm0+mM21frChtj3GHqwxyB/wKAeU/H46g//lmP0GWJj5D/8eOMEHxjMy3CObsxJ8C87WliTV42X/eJJ0YTCfLQXLWTkyq7e
X-Received: by 2002:a05:6902:4cc:b0:df4:da84:195e with SMTP id
 3f1490d57ef6-dfacac47b76mr1560204276.22.1717576138150; Wed, 05 Jun 2024
 01:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU7+O-+v=2V83AjQmTWyGy_a-AHgU_nPMDHnVUtYt89iQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU7+O-+v=2V83AjQmTWyGy_a-AHgU_nPMDHnVUtYt89iQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Jun 2024 10:28:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVs1SuVeWGWEbkO68pR-ZGjqAhwjLT7UoR85j7udVbb1A@mail.gmail.com>
Message-ID: <CAMuHMdVs1SuVeWGWEbkO68pR-ZGjqAhwjLT7UoR85j7udVbb1A@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add R9A09G057 CPG Clock and Reset Definitions
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

CC Greg

On Tue, Jun 4, 2024 at 5:46=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Define RZ/V2H(P) (R9A09G057) Clock Pulse Generator module clock outputs
> > (CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
> > in Section 4.4.2 and 4.4.3 ("List of Clock/Reset Signals") of the RZ/V2=
H(P)
> > Hardware User's Manual (Rev.1.01, Feb. 2024).
>
> Hmm, I must have a slightly different Rev. 1.01 ;-)
>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/r9a09g057-cpg.h

> > +/* Clock list */
>
> [...]
>
> > +#define R9A09G057_USB30_CLK_RESERVED0                  197
> > +#define R9A09G057_USB30_CLK_RESERVED1                  198
> > +#define R9A09G057_USB30_CLK_RESERVED2                  199
> > +#define R9A09G057_USB30_CLK_RESERVED3                  200

[...]

It has been brought to my attention these had been named *RESERVED*
deliberately, to avoid disclosing their meaning.
As these definitions are part of the DT ABI, and the DTS writer has to
relate the names to the actual clocks in the datasheet, and to the names
used in the DT bindings for the consumer devices (if ever upstreamed),
I find it hard to accept these for upstream inclusion as-is.

What do other people think?
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


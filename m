Return-Path: <linux-renesas-soc+bounces-22525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D63B2BB0726
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 15:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597A21926B76
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 13:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282602ECD2D;
	Wed,  1 Oct 2025 13:17:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3212EAD1C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759324651; cv=none; b=SgJuKtpgzbZarzyWMX14V3R8CCp+fDGeH7G42UqS9lGGjv3hs6719HzutOdGhfakX+MTMPWiDCtazhXrMrpaitqr52812rRCERXIOk0Gel/+8pbjL2HSMNQSME2WxXjxXptSa2d9HGfVfcEg+RD6W1rqv69cK5XnXubhWHg80sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759324651; c=relaxed/simple;
	bh=I05mR9/50DLTEHHaHy45Q5YQgLDEg9VchuCah9dVd2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaHduBjiys6K78X/BPz0EWSWOy7ZRZAaPYdDYUZtBT9WwKnKt/eXe3+HXaS2tfili0bC+scXuWiMmc9UMMonlg+MN70Rb9+AehLQir2GEusIXjmBp7gL86fyaTFrSJ1K49jmiAL04JnRa1/DXCoZgWfDKMGpnMiuY17PlqqRa1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8e364003538so4848776241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 06:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759324648; x=1759929448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYdalTnEkJlTI6nAxkZ1pZoLmc57oQNk8+NRjQz1+SA=;
        b=XTNmnc8xrXtYN813CnO++gTqrlAAjN0dt3dgvIYcqz68Oa9SY9GAgac4wR3TD0G5yd
         gO8mM+lAoop9vdDKi6+TGSLlF5IYoTLxXtVBiNCf+k0dacCvJOvZ8R6xa6Bw3BXxZPad
         THenjVIcPJDFQqzgHSqFWU+H7Qeiynp/EHhHZvyfBXBm945mw8h5o2IdPPtlPfj8jga+
         MaBv4jphJYcUjsSD3k0aKFk3758X8+6YL62MlFYtlln8lRGXZrQU0mQaR2GDXF+YFmiU
         wxoCutbZAMcczqm3Bmf43zgHX6lgCC2wd5mJX7hElqhJoAdDP8pHM6rLIX9m6hZsIn61
         EdWg==
X-Forwarded-Encrypted: i=1; AJvYcCVmhxk3Z/XpoYMCPOtUO6D6No+nb2OUHC2ns4ozQXMVX1alLvPdIjmsooQWwWYO20kj0JVsv3PsAFwovMaX6GoYkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/wi1i0YOyO4yHXfmrC1oRoBX8+rQkO9ukilTOfmwPvRPCvpW9
	URWr1qZ1Ht8P7XVvkSup9Z3l36UpgMvA0d2eyDi6Ob3wTGFSX/x9Rgjt456JfoTb
X-Gm-Gg: ASbGncsMPCcGa4q+SzP9QRchF8fK6cg/9ZQ9I6odjOba6mgM/xIuBMmEkIwpm6MtTCc
	K0GC3jjMJUBFp3yWIjyXMlhAQy9C1lXc8bG6ceOkMvzt2pXoJzj8CXBQ76l5LhNBJoNT6Ggn91w
	yNGbWKHYo/3AyG01bL0vhYeOU7kZlFzlNOl4A40gf4NzAHwWNa23A4aYBBF2Hk5CN5eA6cRSuAg
	zN+/w0Cx/UTiBLVc0gWQZZl61UqN9GAHFvXfZhKbvrP6hBPVPQeAxTQv6cShKUi/vRJCSGM4xXr
	EobbKRkYD8cve79NkvzFsKUnOmM76oXXrvqZ6JbDaOWGJ1rGJdYq+mhzE6L9DTFVAmx4mvi5kFR
	W6F84PyGc8Nzkt46n53GySoJx/tsFVIRFECM4H2dVccMw2XabCVuZdNhKErRWDRYOFrcx6fwrpn
	1Y5+tBE7XM
X-Google-Smtp-Source: AGHT+IGthNUpcFWiAyy+OVdoA5XHqLrdqg6h7fnguLJi/jsBz3B1/rzYG2ExSeTdUZhEhWAomQgZUA==
X-Received: by 2002:a05:6102:50aa:b0:524:c767:f541 with SMTP id ada2fe7eead31-5d3fe6e8f43mr1661221137.35.1759324647962;
        Wed, 01 Oct 2025 06:17:27 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3182cbf0sm5110683137.7.2025.10.01.06.17.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 06:17:26 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5a7b2a6b13bso6365103137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 06:17:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbHmZIxytgzGwK5plqutbNcMq+K0tKXN9QsT2iIEOyDEMQow21gK28fcgFEFCxbC5Q29JZQ1YzsS/SDq/szCi0CA==@vger.kernel.org
X-Received: by 2002:a05:6102:161e:b0:58f:31da:dbd3 with SMTP id
 ada2fe7eead31-5d3fe509ac2mr1393313137.13.1759324645740; Wed, 01 Oct 2025
 06:17:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com> <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
 <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com> <CA+V-a8tosiUkhaWGoZ9yTBe1Kyy0DLUGreqReH2NOWmVeS5_pw@mail.gmail.com>
In-Reply-To: <CA+V-a8tosiUkhaWGoZ9yTBe1Kyy0DLUGreqReH2NOWmVeS5_pw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 15:17:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFSvSGBearGPU61atsHFu7NoDjpbxNNvyGO21j0-_OOQ@mail.gmail.com>
X-Gm-Features: AS18NWDiZs7Ynz61qNNAVC6cUY3oeLbFhcjv_kGBKaaXq5pMP7Ji5m5RgOlqVh8
Message-ID: <CAMuHMdVFSvSGBearGPU61atsHFu7NoDjpbxNNvyGO21j0-_OOQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 1 Oct 2025 at 14:23, Lad, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> On Thu, Sep 11, 2025 at 3:26=E2=80=AFPM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> > I still don't see why all the code here has to be in a header file.
> > Usually headers contain only a few lines of inline code. Is there a
> > reason why it's not in a .c file?
> >
> Ok, I will move the functions to rzv2h-cpg.c and export the symbols
> and have the declarations in include/linux/clk/renesas.h.
>
> Geert are you OK with the above?

Sure. The DRM driver would already have a hard dependency on the
clock header file anyway.

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


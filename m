Return-Path: <linux-renesas-soc+bounces-12370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2ACA1A0E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64A56188E466
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91A620C46F;
	Thu, 23 Jan 2025 09:35:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B391B87C3;
	Thu, 23 Jan 2025 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737624948; cv=none; b=r/ruunYtVeIPbsQ0LUYhGKM88D5GHpUia9SaZsrqCnD3HvaXEEvgaxl/EqWz8YuODfsGLiVzvvWwbf4/JacuY0XZmNdUiVr1a4Wf5wY5e6tqh+qvq471XC8j0WPNwU8IE5jdTcpOz/XEME7OZqI0hY1V3LHN0BrzeFRfk2fwAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737624948; c=relaxed/simple;
	bh=eaJoKzW6wkE6ki/ELC9AQXU7Q4QTLZ+i3pNbEaAN4Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLLqR/klz/Oc5dlKrR0qdViOSXSt2bQXPe8XVlAmbe5aebbRyL79woHsuIy0cJF9Gh3HJ0D2knDOxGPbEwtcWx3GRJZYYz8TZVRVx31hmrFoPs6gKwJYNOGsF4eaI4i9XtysgQFKd4Zyz5AONQ5Rfp0ZpwbUr3FrNw2IMBmzAAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4aff78a39e1so195063137.1;
        Thu, 23 Jan 2025 01:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737624945; x=1738229745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7jYYO+2y1p+BFp6JLhMQ3Tnjo7YEzk0CDOkXbIVVUo=;
        b=oBvWLXi5/T3S9epur2jDNg5WNYopk9/+xWHd4EhaIQQ2XWFUneyV7PAoLckLliEGrn
         yYKBOFt9oLey6iMETBXFN6UHxfJmT3jVyRjCg44wmib+YoSMbpNLHKSpwW9prKOhcz2w
         i1JZiep/pzrpLvtJrgDkKloseHAfBPyfuqWYdZzs0n4SxJoIlcLM/KuvQQc7MY34GVvU
         9mzJI58SpZcI0V1K5oHb5IqKtTt2mB0CG7jaNxoRsfWwUmWVDEWUN4Fh8tLqrPRO+EjV
         2gZ1L17PchxUYReiyjxIBMMs1sc8UGjajwXxdaYl+PJXYKa7bLyzfdIUyYYzPyEo+nza
         X9Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUCjkW1u2GQcuVJhaXSale/Gkv/CUL477NHbosTQr73I21ejVHi4Oog+dFSkXO09rw1/Aq15QgHvdSceJTy@vger.kernel.org, AJvYcCV9PA57MKocrvIZBmcrcm3tZ9+roXgiTLFBLOtWWCLchWeE6uU0pZWVpZMEbpzFs91asOMgKdhVcSg=@vger.kernel.org, AJvYcCXJMzXomoNAT5ZWLDdmTB9TOfTzLLzEhL7IPGXCK7gW/Ae7kgu4U9zJ9uo6+T+XD6pdhUBCANCrJZjsowHpTuHJWB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq/iCKBrJ+d6Tj84gsMSU9IDjmSbQJuohPL45zEU4b5JDA7qo8
	h2yoV86rcdLHBFdzNYlMGE9TKO1WbGPQPsnszDfKCwpzmehYTiWEqTMaPAsF
X-Gm-Gg: ASbGncu0PvhY/NU/XDeTlDJiaBnDtE0tU4tZ7bRuVuHkllafOg4yV/9whpmcUd8izSL
	2meJPQ3ucdsN47i5jmxscZ4UG4nHDo/g+nUMKyIO1lQxOtwlmSR01Wv8WWoxykVv6QUDthasBnd
	KJRTDV/6DdCJbOpiMQTt3/9tpW9DfgTvWBWpzVcm7nR1FkgJBmgdtNFxSvPnYhLxjLFRmLQn7Tz
	mluRmTHdH1qzGTD1ATTXy077PFjPt3WjXh0tbSEY2lzLxjWyL6rta60jugTbTDDDaCFibBbKc39
	tg4um1W2+hi33W66N6+lR9xeJHWQCBd9cKbC7bNjjH/fXXc=
X-Google-Smtp-Source: AGHT+IH3wei3mYrhmg8YznS2lGYmLd7r80U3VDnUsTfHXoFA+Lr/nUb+LICE6AzX38/T5buJf6RK7g==
X-Received: by 2002:a05:6102:5716:b0:4b4:6988:b12b with SMTP id ada2fe7eead31-4b690d3ae95mr20272974137.23.1737624945296;
        Thu, 23 Jan 2025 01:35:45 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a20cbffsm3056061137.12.2025.01.23.01.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 01:35:45 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51cccafb073so314441e0c.1;
        Thu, 23 Jan 2025 01:35:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWK6IFk5LL2jvnQc6mBQfJ/vs9FVld8PnqH0CugLxaI7qVgclc+Gcugf+2v45GhPd79Bbaimmk4ZU8=@vger.kernel.org, AJvYcCWQueAxJHmrSbI4x2Y31j6HGvppQmPKdARpq7RHHhXm6XhAydq+m5jo/PDpau7yK5uMMVcbmvjAJMswpOKHYCNeY0o=@vger.kernel.org, AJvYcCXc+mPdaT75XaRoJ0bCVhornTo5mWjv8bVZBTEYI5QUaKM50hZaavoO1cN0LnGATsQMLI5PuW1JqbYHDWnt@vger.kernel.org
X-Received: by 2002:a05:6122:1682:b0:516:1b30:8797 with SMTP id
 71dfb90a1353d-51d5b377327mr19120555e0c.11.1737624944900; Thu, 23 Jan 2025
 01:35:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106202853.262787-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250106202853.262787-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 10:35:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWFC0Mwaz6UDWRL4bCNF8mgcjNx1g2qps42UsR2F=mkdA@mail.gmail.com>
X-Gm-Features: AWEUYZli1HgEXGfTIJ-8VJRlz6swtgPnZ8drKOA_64sc5EdwBONelvWK8OsBk-w
Message-ID: <CAMuHMdWFC0Mwaz6UDWRL4bCNF8mgcjNx1g2qps42UsR2F=mkdA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 9:29=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the DRP-AI block, which is available only
> on the Renesas RZ/V2L SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - Made dtable_4_32 available only when CONFIG_CLK_R9A07G054 is defined

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.15.

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


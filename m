Return-Path: <linux-renesas-soc+bounces-7689-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A172944F56
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 17:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F78B1F228F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5AC1B011B;
	Thu,  1 Aug 2024 15:32:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F6A135A53;
	Thu,  1 Aug 2024 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526370; cv=none; b=qLfOb/ZKDw4riYJ6aUzzoMkvz2AnYb5L6lqc4ACxUrYRcrKFWEJkK4h1jqJp2mqiRk4V88m95j+ygyJCt+dAbNMoP+4XuIS4PrSvEBF+sSL5eui6T3aNC0zcOcdCUdoXONWUjrblswMLjBB20BexumP2OARxK+AmuImFE4OKL14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526370; c=relaxed/simple;
	bh=8rdm4K1lYpolij7C/7YXxQU7HtPZzydJvLanJUXShDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjaYieS8wF0WX8GmjfQk6/lWQUeKYF1j2kG0Pp6HdF8YlGOrMqe+1kOMJUw1qP5NI1tkV98xq/EfpjAp5I7lzHAsW0y1knlGMs4U3cq2RXLy/U2Wk1Dczrc68KsdGVUW/5Ti6k/nT0oY7Ru4AGtiwaX9eXh1PTy8H8Fi7Ouc4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-66526e430e0so58916997b3.2;
        Thu, 01 Aug 2024 08:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526367; x=1723131167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qylv+7lzkXUQ81Wd98nQB3ERXul2VO4BfkLu0QOTv18=;
        b=DcHpvjPvnOFSsggK3Cd3jMIS+pepR7qmfEmyLgCxvP6b4qFPPFalU8g+xp9ib7sB6v
         DGJC5vUINZ2sFoPSlgNaNDV9ba84G91Rgx6SMc6XZ8mpz7WHA2uj8QxgqxZn5rmEqBO8
         7DnpgbrchguuJqOcJgK4au1NHZ9GIUf5VimUXxWTZh/gcc49OR+v/YPsANhQtv7B3/Eu
         4bNkxBT2TleCmiekcEiaDp/mChne/5gSaN5h3uOg9pRiLrSkwixtJGqPTj+pTCtX6E7r
         04KYQUb7SEIG1ftMQWIUF067in0VmD2tfBQaGK50qSgtQKrT4Ea/AlODrlOYkLiaIKdH
         YmRw==
X-Forwarded-Encrypted: i=1; AJvYcCVulJEZWu8SolZpv8r0GdD+B0z7dusVHjdrdQUXqEGcN6YBVHTQmcsk+lyHVJp670hyc4VZ9RR9CfiaTNfSVDobL7XGBZvq1CXvmOpmYEMFX1E+Nu9TioDfQ4aKhf9ZyTXsnxFs5fVO3xMBN4g9x/T0HpXeIkVjor4C1fH7PLcATUwFPBv4qKv//OsNL5DpnJ1BkIC6WOviZxMaEBz02mKxmYaAIADh
X-Gm-Message-State: AOJu0YyIHWCxn1IILxz1N7JLTl/snhjaR1BQX9gVukbmkh9QK9nA9he1
	ufKUE7AIhMrNonpNQ2LvHE50dXHPgjzU5PSyK/IfhgSnxFZ1NYtFFanwYdxE
X-Google-Smtp-Source: AGHT+IHkt0o6R5MgXid/AJ2rQ8Dcyr/O/7v2Jiz+/OnqSWUFRGBKMOZXbiF/3t6mUKJ9skj/jELeYA==
X-Received: by 2002:a81:778a:0:b0:665:ba2c:2ad6 with SMTP id 00721157ae682-6896351a9a4mr4332457b3.34.1722526366928;
        Thu, 01 Aug 2024 08:32:46 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-675681140f9sm33214707b3.60.2024.08.01.08.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:32:46 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e05f913e382so5472479276.2;
        Thu, 01 Aug 2024 08:32:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF5cu6pXGnvpVRbGhZcv5KEq7YyK5wZRHJvcfl2JOJ8J3DXz11fGkUVGy0KRykD6bSl5maxBw8pHWLl7pr4+28xcUD8dAprQm+Jc//LOc/YEIrRSBZpF5oUHb2nVba16vjpbSUVrnWGOJ+BgrAuVgv1O58O3HQBNw2Z6l22pdfWret5CxymY/ihJhfy9ivTCzLfrRb2WdvVKqUwdH4XzUm2py+N/Up
X-Received: by 2002:a25:d897:0:b0:e08:5d91:d223 with SMTP id
 3f1490d57ef6-e0bde33e88cmr641352276.19.1722526366493; Thu, 01 Aug 2024
 08:32:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240729202645.263525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240729202645.263525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 17:32:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3HVLzVqUu4fS_foe=P-tbNWT37EQvFpqXV-xb3p=sWg@mail.gmail.com>
Message-ID: <CAMuHMdU3HVLzVqUu4fS_foe=P-tbNWT37EQvFpqXV-xb3p=sWg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 10:28=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add family-specific clock driver for RZ/V2H(P) SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5
> - Packed resets array
> - Updated rzv2h_cpg_reset_xlate() to get index
> - Dropped description for info member from struct rzv2h_cpg_priv

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.12.

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


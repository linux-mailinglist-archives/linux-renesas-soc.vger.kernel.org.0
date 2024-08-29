Return-Path: <linux-renesas-soc+bounces-8491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8D9643BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 14:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EB1E1F231B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738541922F2;
	Thu, 29 Aug 2024 12:02:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C00187843;
	Thu, 29 Aug 2024 12:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724932960; cv=none; b=rWi6XFOpqoyf6YZqBTvWH05zVWqqC6ImieiYVMJyyXHmYDgJzD7cZjJgAKIuj1vEk7IRbUgJ0LYFJmqDPqQ6aGN/JjNcbA/jTLvogtg0/j6jSLvjSEjidTuoB5qUdlLLEheipyP399Fwc/BOg+Rku+HPS5lTkXrhY7/9SLCQ2h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724932960; c=relaxed/simple;
	bh=Y5nUbUjMalH6VotuXEHNM1tNzhTITzZqVBTn1I2AqWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5ub4E0WYvUuZ5gjPxzCbpvSTJD3T8/QrpQ7bOq2+Kj879Qp5mpnlXGRBopNBnm4sZ9qJMvaMYMYueZwdOhHmNVH5KrWSlXvZPeLy5Iq/yeyT7ErVrTLyeeNmQTNAyxuPxzgwyGt336whjV/ejfl4w4XwACeVhWv1s0vNgLmmTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1659e9a982so600371276.1;
        Thu, 29 Aug 2024 05:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932957; x=1725537757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ+og7VCPaCJULcp1XnCvlR0l40A7keoK5WWat5G8zA=;
        b=KnFzUKXPrPECAbMbIfnY2jfsnSoiG4P1kL1MGpnwFlpXHdNjMJVizmCDR07dhAkDh4
         87mSvu9AY4T0uFIMvmJEa+FylnIqIcHlyrl33WSt4SrFkYyDfmhHMM9wsJXg1bxOdIsc
         YqM5NqwQwPJhz0qsDKUkvVidByr1lDkY9G9PSBxhsbE91UPrEMhKPHe8+13zmwS8xqNs
         Ebp8ANAgpbxNJT6dWNdYmjvJ4DXCbn1o6ll0rfxoypMnEOJw5/6tclzC3vSLsG04SRiq
         2gg2pRCVgxw6fBrhV28Hc/wF1TgGxzz4OWUm+OR97f3FJuLBQ/M69EiE1R0h473dzevd
         mXfw==
X-Forwarded-Encrypted: i=1; AJvYcCVglK1N6pdW8qjAg3FZGbI/LbWWqoKhj7rOOAbBIQYTWpU+RD/0A56kisFVZc+QYLUuJqSyf0yArKa5E8amLd8yNWA=@vger.kernel.org, AJvYcCXk0V09yyLeybzD7mQAYFmgNUn8r4RHsLWe4P8H5UgoKlBk750ODdr2a8Y82iU1pBWDYR5EsbctOxtVub8s@vger.kernel.org, AJvYcCXtNHPpH3LWpH9Ab6sFIlr8Dt1uXyBicsjXtg0iV4FQFC2GJzPACry4iXK8m6C+5HAsTFy+Drz3XyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15g8cfTHLqWa6h97RYnc/gozsI82amFbkxorX9sG2IG68kHkK
	3QQPCFavNPIO+3WgIOoVgYjcJxgotrzO49n0wUSW34gIFmTeSVGEVdBZH2Ll
X-Google-Smtp-Source: AGHT+IFQZCiqLOtw4LDB5hu5yS595YCFw8UEKI1c9TLL5FI/r82DRu4HUdid5aP1iqZwz6d6oH8W8Q==
X-Received: by 2002:a05:6902:13cf:b0:e1a:3dc9:c422 with SMTP id 3f1490d57ef6-e1a5ab72e26mr2817989276.19.1724932957110;
        Thu, 29 Aug 2024 05:02:37 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d2d5db09desm2109267b3.123.2024.08.29.05.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 05:02:36 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b6b9867faaso5310707b3.2;
        Thu, 29 Aug 2024 05:02:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwu92tlMPfjeqMVaMRXQwAS4wtGi9ge6iBw4i9LibH4jxgxmICKi+8atzvoEReU0YbDs1McEkKSrIunB4k@vger.kernel.org, AJvYcCXM7l2VWRGOX+i6kExboOBW083JdxD58B87VHHLPqrRVXIRrYdFKPaAR27JBvk0wo+4A2ZxVFVJXCkBeZ5WihvLx2w=@vger.kernel.org, AJvYcCXbIa266WjO1opni/lxS8oVAu5fLFJCTLGfncLaSfp3XiaidYES4RH71l73xPKM+RQsxFcGRYz6nZE=@vger.kernel.org
X-Received: by 2002:a05:690c:397:b0:6b1:598e:8cf6 with SMTP id
 00721157ae682-6d2769e44bemr25846117b3.22.1724932954739; Thu, 29 Aug 2024
 05:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828093822.162855-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828093822.162855-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 14:02:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVChW0r5azwy=7Xp8o-ah1L3QC_ec_5mqnwQUL_xOrmBg@mail.gmail.com>
Message-ID: <CAMuHMdVChW0r5azwy=7Xp8o-ah1L3QC_ec_5mqnwQUL_xOrmBg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: renesas: rzv2h-cpg: Add support for dynamic
 switching divider clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:38=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for dynamic switching divider clocks.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Updated DDIV_DIVCTL_WEN() macro
> - Introduced struct ddiv to pass divider config
> - Updated DDIV_PACK() macro

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


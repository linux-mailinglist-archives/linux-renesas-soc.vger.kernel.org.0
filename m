Return-Path: <linux-renesas-soc+bounces-19307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7889AAFB09F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 12:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5157B1893CA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 10:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7E4288C35;
	Mon,  7 Jul 2025 10:02:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A871F8755;
	Mon,  7 Jul 2025 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882543; cv=none; b=ZycrrIo1HvS2Dun6heIggJtt71iGQwcbKtvZBva8jYYIcPqd1ByLvznnfSZT0iqctzuR4ZGqEBoh1op/30b0ZIVjjbsYL44c6ZCnNI25EbXCqS5DR8xr1miFxqUbw5OwnGqF1yzJiMaOaaB85pOSeRB3XDqvjEhOvMFKlF8kFSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882543; c=relaxed/simple;
	bh=vkru9bws1F+ARBeM4YsMUM2st4Em7q8l2KIm2ooe9NA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THiIMeaxtK/lSh1EA8I52DYrUgTzfFnakGwAWGcLxz1ULv1qgmNNlzndGvStLsvpATh6ou5KQxC9M6tVVbKhfuMK9Vpd8RL191+p0mHBOVeNwnX0yrAsdLUOJwKCytAS9EAlSmIBiAB3z8KNjl6jUfka3XzECl9JtPX8pi4sUk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so31870346d6.2;
        Mon, 07 Jul 2025 03:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882540; x=1752487340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAWVxOChxT99brNRnSRvqsjpYCXonES5TnFSFk+0jU8=;
        b=OxTgic+7xpS3J5LJ9sST17zo+TGNRUVtjxnEknVzKQQj8NitzZF40RyMaiYkHnTqB7
         +UdaBI2nhOuQ54tcaLM+K5v+cBph2991JSHfhFMdF/Q3MDxr3t5I4lGj2X+sq2Fsa0dr
         fQ7u7x54NwK856MvYq/G6rsuzo+gWL+xN0w0knKj0396k36BKGLzWLWadlGYUDyJAx0v
         uGpbNFE2eOCg8MWELqdyLowRJ7oGECS9drBHwOP0rC+s9m86tAOiLKZtOt/CAOKdXpSS
         ko5r9CSCXHvJahweEZYFJzmp1eXcVgdSb8XtN/Ai4tpCVnrVGILpidZxx50ZFoHRbUVD
         2Nfg==
X-Forwarded-Encrypted: i=1; AJvYcCU2IC3F146/6N32k7eJ7i3bKbgBEmkgR4R5KPHxsXEZrE0Umh8AgIj809/f9x6bQOOGfIZx1683AmUCwQuWeXOMQNk=@vger.kernel.org, AJvYcCVXXSVDQhzhOGJb8KilIJ1GAT16RHJJHcj95rd0JyE8yoMR4cqnc/hQhgQQzcaNSnC5tqC1K0ENvlM=@vger.kernel.org, AJvYcCX2ZhDx1U6MTJ0AwcaeYp9coiOj/5g2rDDDR8NJt/YX8d1AdAeUMJw6Aia0EwsJ9FbZJdN1ldwe6NKmaiLL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz0WU2A7MGd1vChhrmDygDj6carmJ7B3QuGxvo5KcoLwCHQoic
	AWqLpKUjDYhPR0SpVoBfNWITzj+20i0gMyZWLfbj+1CMO+2+sNVRlL04ee5T1qJw
X-Gm-Gg: ASbGncscxowaB1WpSgvSD1i83v32vdthH/lEHDaeO10ODeAw9OsxEXijKklFlTYp0Da
	nhB/L3SeH3t0hDy+A4wh34sSxBZcFdj0SRE+N46o0RLj0dn1xPPxirdrkorL7mE7TLzhTlZ63qA
	v1LDoZ+7Hljm8hWOhUC4rvfz5FheChHe1wqWqND0VOheONTVrGskdIOwNa+S/xrOGspSzkYT/YL
	ACZxrEENnl1s8PGXj4Qte4xX02yMypJyBO5Z+EcS9X80mabIIFh+pohuIjaijN8M97blOgARo1G
	22ml/XGxdVoD8hFrfonUUnMUraiZYP4jjltIfrJAQB5c4dOsGfCp30CAEB5He3f4ImRW8gHj5+D
	3JrIIyP1P/5pFWoSaqvS0JH/9yCoz
X-Google-Smtp-Source: AGHT+IFVrEDF48C21dZwzvaqbmDGAzgnNksXEM5UZMq1n8w+O8QIG2ddSEEzWxetxnWnXdrVieTXjg==
X-Received: by 2002:a05:6214:2b82:b0:704:79e4:aa4a with SMTP id 6a1803df08f44-70479e4aa8bmr3192066d6.18.1751882539362;
        Mon, 07 Jul 2025 03:02:19 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5aac7sm56081876d6.85.2025.07.07.03.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 03:02:18 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d38ddc198eso346403885a.1;
        Mon, 07 Jul 2025 03:02:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVl8NMpdXTZ6+f/V88vMC+5M1U3l5/ujHRk4dLtC+7aVEmh5omGRI5IM921rZlARzjovrYa648ODHI=@vger.kernel.org, AJvYcCWQQuArJyb//Gp7kUSnQSKlCiw89Z+26tI6gVk2ydc9axbS1eBmR4ShjfZT3C9SeWZmri6zdaML/z4bWntF@vger.kernel.org, AJvYcCXWHmnDVYPjmRlT1jdXmndBG0u1sTE9lZMDCwWKEmUpt7duzpHG0tFsDpLshY3xjvoWsWScl4wv1vdfMJPFKQJfR5A=@vger.kernel.org
X-Received: by 2002:a05:620a:450c:b0:7d5:dc2a:c5f8 with SMTP id
 af79cd13be357-7d5df102f6bmr1328858485a.12.1751882538289; Mon, 07 Jul 2025
 03:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704091009.58821-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250704091009.58821-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 12:02:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVzYBx-5Wfp4k_wUqO3Np6Sc+DB_2htX5uVNOqXnaRXbg@mail.gmail.com>
X-Gm-Features: Ac12FXzx50lwWv0KDbni2_rquPePl51mbuS_ixobvgbkXsfenAFeImeuX7GhpcU
Message-ID: <CAMuHMdVzYBx-5Wfp4k_wUqO3Np6Sc+DB_2htX5uVNOqXnaRXbg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g047: Fix typo
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 4 Jul 2025 at 11:10, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix the typo et0_rxclk->et0_txclk for smux2_gbe0_txclk.
>
> Fixes: 17dc02f7d293 ("clk: renesas: r9a09g047: Add clock and reset signals for the GBETH IPs")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
As the bad commit is only present in renesas-clk, I will fold the
fix into the original commit.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-30590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGCWLvx/ymnX9QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:51:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AF835C5A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3098303A5E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF1A3D5659;
	Mon, 30 Mar 2026 13:43:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2C73D47D2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878231; cv=none; b=kG0AXvxgnQXvu7zMqNu/vP56Q4hSjhrmJ3Si7wl8KmTZggU9JYk7S70JF0wbLhUuZKQGg2UihC4kbog2+5fajwL0tzkzZVj4xfwiCvW1xZHBdECtxbzBdOVO9zK8ycKQUJxRhw2hbtm++7mjPfexPrHhdQJiTCNKvrCW106O2sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878231; c=relaxed/simple;
	bh=LwY5xmZY/IE7X0h8PDYYjDasIhhiQ9s5H+/9EkzpTUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQznK7f1i9wSQlvYgnaXZkLfP124gD4Km1X/Q1en8oU2N/seeJbtp3ekBPmWH75DUaX3D4+AjhCahWOXr73oU7g1dErpUAaPkALYRHvDVqurBUMsStIf432mpDF3jGAuBxqCOOQ2c/HJwmYaYYg73Z6Q3YCcFi8CE9eZ5BSpwDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-953b9fd8ebdso748828241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878227; x=1775483027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zojjIrplT+gpNV1OAKG7fdmSOmBuVtlnIyFAXOobv7A=;
        b=K6+6dFJlJ6UdXVnDmeQF684/3XGjSlmLAj7VcR9OcmuRYicrtVBocNdDWDaqJgKS24
         iznxxkIXQL+3gbimcvnRvsx469XCLjxCx+SbG3EqcYL1xwwzMzWocHT1nakT/dJw1DXU
         nJmmK6YgylIdHka2DbIrsXedY5YS+9WNlg0hhk59OlE+b95Gn3GsoMxBLZs898amsuLU
         2FhIWSsrD10WOrLMH7NB/28wE4TCXfM8ie1kQkHkmqIPhAmPn/AlOvuelR/gp6OIn56y
         SHACVlG/T+xfOun1as0v7c6BePtMrPVUnI2kVFvdk6kPtbazCAjv7kMcoVbiPVJYCA0j
         Xivg==
X-Forwarded-Encrypted: i=1; AJvYcCV4J3CyE9MOfhjT7M3Dp72BHr1p05Ia846xuGkehBtPASGzY15m1TbIjkD51PvSQpI8F54KaZ7U7Htj8g3ivgXcLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSqR6g5b2mAzRjiGlD2X3gJ4tbHZtmiGYi9chSE9QD47ZxN0yI
	zJt/N/UHgaoFv6LPaGKERK/FnLJtMu2B1zkeeGRAmL3SgqMry151qUH3DdFhdKce
X-Gm-Gg: ATEYQzwghxibIHTeLblTCkNYXRhQSldR5PZv1WcLC8TiPlxR57A7RrCR0K6qK0Gmc0l
	D1Ui4/gJnVNY+7ldQL0ARlroKpoGihHtXv50wRlL+Synqqm/ZkbxnUNso5L5kC05cAGOPBkCdb7
	IwMHBbj6ayxX4a4bYEn8IM8RqXe4DHJ937aV/Wd7VKOaDzBNqPQ+GGs4Mvuxex6unBS8Ctf5tY6
	Z1i28K8H4IXNYHuEy5v3RS5ZgLSgYalpEEoNVUtjBUZB2PimENqIj3acLwebPrsh/fpdeugCxzE
	nUYCLqrLK3NFen3utT0UZgCycOQObcQzOWczhBRpA1juD2VkX3Sm8DZ+IUZeNvpsh3pttptNtFi
	sbne9AJDOI0dbQDs2uxwnxUf9cPuD7VlfNYNIq5S7a47smzcXenBwtm1KbIzqwedR/rY7TuUvLV
	6pBDoCU9yjeFukDZATWdTKEEZk0iErVnCZ3r35IL0oJMIBpCicnkQl/VpX18IP
X-Received: by 2002:a05:6102:440c:b0:604:f640:301e with SMTP id ada2fe7eead31-604f90dd722mr4957585137.12.1774878226776;
        Mon, 30 Mar 2026 06:43:46 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e440c5asm6938611241.10.2026.03.30.06.43.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:43:46 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-953b85a10bbso748474241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:43:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPAGjyH+lVvqP1/jsp9TpM8RLRY5P9XvHYWqBFiQjAnCjHWxZLd7UD26kRVpenX/bUNybgZmYieBb4FtEKuFSmpQ==@vger.kernel.org
X-Received: by 2002:a05:6102:26c3:b0:5f7:307e:80d9 with SMTP id
 ada2fe7eead31-604f92dc7e9mr4671146137.28.1774878226000; Mon, 30 Mar 2026
 06:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 15:43:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVo6ypHJi9TVqbc+wAmFDU==HQCCG=hEOXuk-66GPXUhg@mail.gmail.com>
X-Gm-Features: AQROBzBtp_yzyGavzy6mnYDxA573W6U-3D6Ay8n3dxuZTqDsa4ZE-WFADhGn73k
Message-ID: <CAMuHMdVo6ypHJi9TVqbc+wAmFDU==HQCCG=hEOXuk-66GPXUhg@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk: renesas: r9a08g046: Add {GPIO,CA55,WDT,SCIF,I2C} clk/resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30590-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.949];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 12AF835C5A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> This patch series adds support for {GPIO,CA55,WDT,SCIF,I2C} clk/resets for
> RZ/G3L SoC.
>
> This patch series is depend upon [1]
> [1] https://lore.kernel.org/all/20260326110648.29389-1-biju.das.jz@bp.renesas.com/
>
> Biju Das (5):
>   clk: renesas: r9a08g046: Add GPIO clocks/resets
>   clk: renesas: r9a08g046: Add CA55 core clocks
>   clk: renesas: r9a08g046: Add WDT clocks/reset
>   clk: renesas: r9a08g046: Add SCIF{1..5} clocks/reset
>   clk: renesas: r9a08g046: Add I2C clocks/reset

Note that you already have submitted 60% of the patches in this series
as part of other series...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


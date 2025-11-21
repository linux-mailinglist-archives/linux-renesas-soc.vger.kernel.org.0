Return-Path: <linux-renesas-soc+bounces-24949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF62DC7A306
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 7A0AA2DF57
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AF430C353;
	Fri, 21 Nov 2025 14:30:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A4274FCB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735428; cv=none; b=O1EFYJd+0JvSVG2n50sRwvgttESopvGDO4PB0Vof5rMzodFqe/crA6nBDE/VSM7A8tICC9SP9YJSXrRCFLlOy6ChB4g7GoC7eezptelZ8c4CQkAoEy7ee7m0TMKFXOirlfde9N2TrQaqpmy/YmRDdEU+zaEhrIVpMDSUAHb5gKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735428; c=relaxed/simple;
	bh=Vujb9HN9zZcrTEbLtuAm29HUpoeOsJmlSQ2a/MNdF7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duso9p171M9dksdWHr3OOWrZHwKSDxJYd385G5foboV2+U/vRA1u7T0LyosULSxUXj6GYPIPhS8vUBEYCalw+ks08M14N5Dq+YnjO/f/Iee5hr2TqM/N1WaFiyjeiWTuf9T2VXDqKj5pZIOacJF0U9EvzuxSB0gcQeuXUwMyEYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93728bac144so1137216241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:30:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763735425; x=1764340225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPWFRv4FW+wTpiYwHa18G5ivaGAWav/XZVG8NSWKkz0=;
        b=wVpsYiNCZ/gZvxNUb9MQetKeuVI02dn5bzwPtwLIU1wnANDUpo6yAnrWcpvBlxyfaO
         RMmsdNgOKdFUFrrEmnIyBBB3rs63mLR3vAQLQm1kwdb1GY5q+AQQ/FX7Ww8JMdm1TzKe
         dFcOu0tSvGaOCbTQSUniNgndC/3cNINN5VVtc0i0fxnFYhTL+X3HdFqI7gO3ijOT6NqD
         4B15tm44t4J6wwrjTiA3YwF4UgYCO4wkA+m1U17rljBxWqxzZt6nKSfKJ2atXrculbN4
         w0zGjej/kMFszoep/4MO7X7/1KhGNMpyUYDATH7RAUVrZCZ1SwzeiBLUKuEjuv3BuJri
         OBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYRxJMOh1Y8tL2etD79f0JZYlh4iuFNYFt23Fx4fkr1C9nkRxYhqJfscf1lVoLQJJgF15zDv30zv9IVLlmdyffZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUU1nLXDCG/EavGFNA+sB1Z4N8/DGqYMEEOcMoxnZc3fqIw2NS
	hKnhQnB+XOLELjkExOYTPMmk13QM7/PA/5z8K/G7gy1dIo5wAxwUN+F6ZARBlGW1
X-Gm-Gg: ASbGncvuKZ8XLWz02GnBFbqePtJXmQIhuYznGsk2Ed+rDV0Ry8CpqBjRe30s1IS1D0d
	qdeAGNiaK5NWxHvEI/GRYflyLf3MHpUIzk59N0ATwP5kdjvmOnVmHmqNiX1HIcGWuKD4j4pGSJ+
	33xrKqLaODPiY9K6ETameEV8pJAi793zpcs/yF9IHXeMcOYQnwV6ZasjtqXNKwVAM+yLd6c44wh
	onQMHj8FUsUkm9stW1po1HgODBSoL4ool2eaZ+KeAJj8y0SZrkLWVMw8v4/hCtZo3rLdCqlrtgn
	nnQOKLxXF4nJvKTToANwSb+BPVi9l4e61cYdGLpN5Es5zFv0iJUkrRZbID/dkXcNtQLKUskDV2k
	eXgG7X2jr2MAMHFY7K7o++5kojQIcloX3pS4ZagNx/dEjK2S1nDlmmKNgsx+65Bql0IPEn1Xo78
	cafjQhLwsZYjedu8zJWwBJLzpaHM32Z0LjtyEXxuyjE8X61RIs54Uc
X-Google-Smtp-Source: AGHT+IHmkNduXPGtAlVz0Fey9T/OJ+y0v2enPhj5gt6Zsikk8LW0YtNvH9u43RLnpiOS9WayW6mcYQ==
X-Received: by 2002:a05:6102:1629:b0:5db:ef3f:6c7d with SMTP id ada2fe7eead31-5e1de1cbfb9mr762209137.14.1763735424989;
        Fri, 21 Nov 2025 06:30:24 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bdd21e37sm2178486137.11.2025.11.21.06.30.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 06:30:24 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dfc3c7de2dso1270792137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:30:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbjkoLaWkMXDZ5L8acN1aJ9Ap1GGCr6xtmSnNQF4xDWczKGtTyl/z12XVlfw82AvrbmBC7dLyD3+80KSirTtbg8g==@vger.kernel.org
X-Received: by 2002:a05:6102:80a0:b0:5df:c4ec:660e with SMTP id
 ada2fe7eead31-5e1de1669eamr752738137.9.1763735422965; Fri, 21 Nov 2025
 06:30:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114101350.106699-1-biju.das.jz@bp.renesas.com> <20251114101350.106699-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251114101350.106699-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 15:30:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXireT6xVeWBd_OhbhOt8iJceuYCChM8Smd5+msZaxoRg@mail.gmail.com>
X-Gm-Features: AWmQ_bm3gkDU9BNE71_fH23eymrJTQmeODetarHHlTS7DkHzMp75WvH3cD7OwLQ
Message-ID: <CAMuHMdXireT6xVeWBd_OhbhOt8iJceuYCChM8Smd5+msZaxoRg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] serial: sh-sci: Fix deadlock during RSCI FIFO
 overrun error
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 11:13, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> On RSCI IP, a deadlock occurs during a FIFO overrun error, as it uses a
> different register to clear the FIFO overrun error status.
>
> Cc: stable@kernel.org
> Fixes: 0666e3fe95ab ("serial: sh-sci: Add support for RZ/T2H SCI")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Dropped overrun_clr from struct sci_port_params_bits
>  * All of the CFCLR_*C clearing bits match the corresponding
>    CSR_*status bits. So, reused the overrun mask for irq clearing.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


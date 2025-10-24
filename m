Return-Path: <linux-renesas-soc+bounces-23583-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB0C059DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 12:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 014D64FBE74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 10:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263443101B5;
	Fri, 24 Oct 2025 10:38:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716203101AB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302304; cv=none; b=PKcEKokLR++EMg5OjRCQI4TFW7ZogdwQ63WMQRwrWt6/KBp1PcCT+tbYDhqn/59tuTL+HIl9p4qH+evS5vk9CtwP4OExgiOBNgRwcoR3Gs1Vy0aiNDUvPnQqLwpTXTeoLBUY3jVQK9KkeEF3iEeZ5XKalPvvoj5Pa3O/gRZjyBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302304; c=relaxed/simple;
	bh=WB5fApO8+rYBQab5f2Nym5kT+Se3DnyCljE8OKwhP3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4eLhQXJIXJhwajOER3Z+2YPHKr7G0w2eu09cRKOz+Jh55O71N5P1VW6aw7ZfH5Vyb75W1xRnqxwX+3v3N2wbEbjgwbjqo15zquzhwAiWwF8bi8vwNZ9uVV0w91QYCBf0s/EEZvjEMH+bHgbFLbLCATBT8m4fFcPnugcDuhXZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso1165706137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302301; x=1761907101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpq8mZd6yHaCnXYSdFvmX21GokIxR+DEgALaIuhYRgQ=;
        b=YRNo30apwP4WVvpVW7F3FEj3ZEXfLczIYSIs7RQRqVFuP1uk9EUgwEGB/sETEmjLEo
         MinriXK/d2Fv7vBtILtv9IHS6f3Soin/7XIpXRJBbZ44/IGkdFajQhMVlhSl5Jn864d6
         eE9QZAuvBea4kadJu8gxWBzW06uC7gKZYXmdWYzRqZpubSknt2SKFhOo5Z9ek43m+NC/
         b9Ql+fq914sn/H9Mu84SGP4Q467Oh5B5koGU1jG5kpTUjCWprM9v+Dnj3dtADpyYt6L/
         bGhGE8+Towiy9uZYMs9HCYXn9dMXLCpCjURpVsqVDFGo16l9kXBj71KbBNuaQhta7Bho
         Cd3g==
X-Forwarded-Encrypted: i=1; AJvYcCWhophuBkp1VlOwDUyedC8UKhJfmlCeS7TKphlmy10JPL6M/cm2xIQvFqM6Gx3FO++P+AuUVQs9NyHmcNEwcvoheQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRkTAUwkqygTk53ICklmv27dhYteO1+W+I1pYE2fzj5Dz90x0
	nEEBTlAKoo7swuWsWgKpB6IqUY6N4/PZBxLQfURAwaPRBBQH9lqTzkWT5OPOa6Mk
X-Gm-Gg: ASbGnctu2rHL2E5qdTx6pAZ6pyrY8ucR7uaDM5bnoSCu3caIDKoxgr3x2B2Tukdi1ia
	OA8Un7iQYzBU4eHk04Iwz2ju1UFLYQN3uorY/XzmqSH2Zs3HYdvYsbgjWUWq6LBH+hWUjHOlSO1
	0/gnM2iQmAeZlGg09d2WbT8+EzzY7/9cZlQLlEIuTGfavSeD5l83KiBULCHxiTf8w3MC/1s2cJG
	xvAwVEwC9pgS/iL8No7eRf/oKITvNzaC8hLwHqeJom8xO0Fz1rF3i4C0uMOAcVt7BMwUJJ2bsGa
	IaQyiaQDrTU2pspRaEGCCwc9CI7+bMqZEf8tilEFYwhogwbrJTaDQwdOiKWzG72UJ5ZYGFkV9Y3
	tn0ktZX+Q7DSnpEVAgqU8ceKKNG0Y6Kr7WTVdez3h2SPz8zJ3nvRa5otXzpqIZswA5Jl9qmZMUI
	H6pfG42on5Xn4IX9AZkuNPrf1/uuzyfx2E29zHPg==
X-Google-Smtp-Source: AGHT+IHvyg2a9CxI3HwmqHXsmU+UqzK7fzU7sgHIksJ2ICo1IUGLLT537QQbVH8DQXj78qFwpX5Nmg==
X-Received: by 2002:a05:6102:d8e:b0:57d:9305:63db with SMTP id ada2fe7eead31-5db2e479240mr1630208137.15.1761302301133;
        Fri, 24 Oct 2025 03:38:21 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2c56baa7sm1991244137.0.2025.10.24.03.38.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:38:21 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-932cf836259so860485241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Oct 2025 03:38:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKv/hgeH6hK/x/i6Qi/L0vY2eNH708Ys4vKLgSQeVCvI6o4h/iJ1zB+cUpxTh2P+P340+Hk5V2GFvDaJA4A8wlWA==@vger.kernel.org
X-Received: by 2002:a05:6102:1497:b0:521:b9f2:a5ca with SMTP id
 ada2fe7eead31-5db2e4786abmr1811923137.13.1761302300586; Fri, 24 Oct 2025
 03:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023210724.666476-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:38:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXesP=oUwtH+mc8G+5b11hBz7VUdEKrFvAC59F6fRHLWQ@mail.gmail.com>
X-Gm-Features: AS18NWCQuTkOQsnhJUgy2vY_-eHhdBBMmfSA920Vmg-OjJTPAXTEY344anEjiXY
Message-ID: <CAMuHMdXesP=oUwtH+mc8G+5b11hBz7VUdEKrFvAC59F6fRHLWQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a09g056: Add clocks and resets for
 DSI and LCDC modules
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:07, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset definitions required to support the DSI and LCDC
> hardware blocks on the RZ/V2N SoC. This includes new core clocks, clock
> dividers, module clocks, and reset entries, as well as PLL and divider
> configurations specific to these peripherals.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


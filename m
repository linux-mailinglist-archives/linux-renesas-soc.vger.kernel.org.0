Return-Path: <linux-renesas-soc+bounces-26013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBE0CD681C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 16:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2CA3304392B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEAF23A984;
	Mon, 22 Dec 2025 15:15:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AAE33E7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416558; cv=none; b=CNDqXOwnPrdPE4Gnen6JhXjeZ9S7zyda62it1qdVlOQVr7YzZPMg3XUFG+UV89z2AFFQRG8wGHAqUstDWGt5TIPUDJ7XLGM/LGXtlBcwwRg49cReRu5hDg0VJFSGcjxOZO9o80cffJNhYERHsb6zGFqtQTxil8xNxZ/9JGDkBcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416558; c=relaxed/simple;
	bh=O8pZL4NMYK531cx9bv8WY7RNqg2T78nYqG16ntxwKiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZ9Gd/C0grfmWFeRIekJYKNgo+nMdgoVzioxMxDiLK/yF9L3pi5VcSjsKXWrYjNoLJN2yNAMuxtrGdkHrNA57hzg2kIU7Dp3ZID7k/xCJPIXw4qjtAeoZjKMyJ4+X8RLNehwtPY1zJ8TPNuIhfTTdEEojfR0rl6q11ctAw9J6sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9412cb281acso965764241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 07:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416555; x=1767021355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlhlbeiUd/10GzJ3WP3xjFNu241CxnEqVnyuXsgKZIQ=;
        b=DKuO8PlDpzSrEVFJSKAgM6sBp8El+a+YTeLt3zrKC9ivTsp2mkhLYnqme+LVmhuzlO
         Ej7PI7VSV0n78QVGjn7WzYvq+KEHex9QOcco47gRJVb1Q58sxtLsDPAcez9ReKP6cKUQ
         F/wGiSH5PdR7lo5/8CYWEDy/uqlQ8AxCZhQglmnenZEwG07+gSPJTero6ejU3ZG9Slzt
         dqlykXGQyTzqO/dmglt3fFsVCGVs3ybKqfqYD/XxgRpMNX4qZC/AJJh6+d0Y2L3KGXMe
         j5hqd2CFb8twtatK3qYYd8v9TyVmNBqv6JNZVzQptoQh5AJ+SqBv5VJCm69SGowX3V6X
         i8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg81P7yVeV0r9lRcC2rRUNUVk5zZb+mpzEn3RbCjKVLBC00WbJXDZ3RyOD9Fn4I/R4kviZTlJi2F/GIW6aRvFW6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkB0cd1V3Q5BY2dvdjEwVggA9fSFDha3gnz5eGpBg7Zu38KzLh
	AVLRqXuFyIEiSrARUqJfkJJ+4eS5K6GB4viasKrTrvYBxGmzilNrC5snAlYPWI8w
X-Gm-Gg: AY/fxX4JQkts7iOrzP2+f0V78oJFK7P65zBnpICJx0a5tMeuqJkUhW6zxoy6lzmDZXK
	lJKs5OgQ3l/5gJXx5AEk9Q4dnMxrhashPVf4PKkDYPHg95mu7kRv/u5Mnahxuljg3yxBtGXs19r
	i7tAnEhqqdP8vgEdNkSn8ycsZauapODqtbF05xS7jtL91UKRZ/jblAu7QPtoMK/ouTqC3SUJc21
	l83RmA4AxpXmW5SYts8IfCkGfTiEw+ZnEByMpfxbml8HzES7fnLt8BwJKIxvJno4S5wlFSzzY3H
	1MF5jM8Z/MRFo6fkzrAeJs5cmMhvwlxgJOTC6PjP2qRyN+jRwQROEMRd01ryr7+v1Jm/uelEu/T
	tMaKomut5aUJh5lAsjjin/cNBSppxO5GuQoN+HVILOCI9tOghfIKtqJ+MYk3zD2wMvRSdfZAisI
	AYepIZC3LhPaIUXG1o3U4Snk+w8Det/e02KiFmV5FrfCggkSS2hcCc
X-Google-Smtp-Source: AGHT+IGPAMCozFi8gfKd4UQBZbI+vPewNfO4RUgJeRSuM+U+3baUsXHjstFfpY2rttwYiZImSLQRww==
X-Received: by 2002:a05:6102:f86:b0:5de:6dc:22be with SMTP id ada2fe7eead31-5eb1a806721mr3388398137.36.1766416555301;
        Mon, 22 Dec 2025 07:15:55 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aa8c125sm3500566137.6.2025.12.22.07.15.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:15:54 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b26461e78so1017565e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 07:15:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjF0ZF4az6UkO+jD7ZHFqH4HwY0Fb+d7BlKiu18HfCOTA6+GA6hHndDsKK6TyetdUYejalpmFciVV8OhFgDGx+bA==@vger.kernel.org
X-Received: by 2002:a05:6122:919:b0:559:67df:5889 with SMTP id
 71dfb90a1353d-5615bd39a1cmr3491501e0c.6.1766416554473; Mon, 22 Dec 2025
 07:15:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203094147.6429-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251203094147.6429-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251203094147.6429-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 16:15:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgLRdA5j=u5xopiCyd8vYx88yezAU5wd9u75PZWiZaiQ@mail.gmail.com>
X-Gm-Features: AQt7F2r38PXbh8micxeszgW106FS1E00O11X8Kf-sb9w1K_riyWGDkyvjsedcb0
Message-ID: <CAMuHMdXgLRdA5j=u5xopiCyd8vYx88yezAU5wd9u75PZWiZaiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057: Add entries for RSCIs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Dec 2025 at 10:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the RSCI IPs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


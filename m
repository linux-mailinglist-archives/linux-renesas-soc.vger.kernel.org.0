Return-Path: <linux-renesas-soc+bounces-22478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD1BAC740
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 12:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0546B3B149F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Sep 2025 10:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917BF2F9D88;
	Tue, 30 Sep 2025 10:21:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4992F6581
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227673; cv=none; b=VoUVr4czcqB2MK+f49nczpYPUzqlvJuvbwiHZ/iV1AXb/kK9WrMVwJggxwvFLr6M1DH36pO/5EutRWPuko1l8nCVED7brfMSxG+qK1HSsF9COuTQRWQZu/9jly5MroGKL7Il8h8kwGqKpbBiS0B20gYuj4SH8R5YbZrWedj8C4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227673; c=relaxed/simple;
	bh=WQLYqqeVFTfkVzqoUMVRfNAxbGpfZXqrGeHdXR29J2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0wPaDfiruoOpaMJB5WAj9SvR9zv8KCuiCyHCG+y0vMqE3WO48bFfC4elO4NtbXg9W/G6xBqMEbwFNIDPg/YYMSAZQE4McA/cJ9PcTeTacWYyYeiyBRiP3FXrYWtPVwz0IcltsTRjHVkZuzU0wtih4Hm4uf2xBFEspcNBv87DM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso4150694e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 03:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759227670; x=1759832470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auZnMEhGQ1qbaDugOLJ3H3dc2TwXmOwQEh+fyQy4fvU=;
        b=v/XQY6lDMPaaMo1ImbSagHXqrtyIksMS2IXFUo1NJw6tR1LE6hnxAP2+cBLsVRdwtB
         r2sTD8mHArhq/IpjBjEJ5holC9oIsX1bFpUj0xZadkb7Ep5D98Kx0Wwg1DDYEJCPs/3Y
         KVioaZqlid4OV7S2IifO8qehL9PaBpBaYHwmCnii+gAZQZQ7dku89jhJkmv31WzzU2K+
         OnmA+xh/vGmLpV2U81w7mZyBC/18h0aaPh75TGAnzAI9/LrhPeOQHJqQeVlSH12uKXRc
         URrelipE4PVH3c2SPHi1yoNfqkaWtQV2Fyj+9d3yf3xeXwHOV88aQuxvz013gI46Z8kB
         PTFA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Mhb5dQe1cZszNc+q78o/ZzrHFc/IVEQ+YZipHfDEYWJjwj9bxNAJROctMzj5bu375qUvXXleKB/XUzRpIDP+1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTl65fkDFEp/+HfvvUarGanUw7DNbIQeJ+zOpJlwo9VBmoatml
	iL13OL5N7jYCGSwrFf7+LWSaONMVrB9RFWXMJhlmc0TjbBkYtYRqH2e5stJqjVaL
X-Gm-Gg: ASbGnctR7unl4rlmv3ZuXaUmd2UVCakXMz/iH9kp8bUzosUi/2Z/z1qhgiY6dz/8DMe
	7LvAXC5j5LuWwlwoFJLRcTFIet5S6f7JF9BxQngvqZqZMU33FKS8aMIOKSh/ukqWY655yaG84DU
	5iLd/wcrThlUDk5Q+kXsh+A6YgrUirG3V25EPyZILoOzhooDj8rMmK9K8yJO4Qwr1vn+lB5QXMV
	4U7YkHMwpZyDvzaz5W4WnePz++mD9XS6q5vARQ/GiVQugnWueE4IS+2HmAJfEtkE3a+J/Y5Urkj
	h7O+UgkkOtOB0osNsOjKHcE9VqCWCjK0VgkXqEqR8HB10LZd+CFzguflkK0pPzIJUxUwDeLBU5J
	LF1JE+z726/qKbzlzWcKz2869iyqUq2FRBI4ijNvcxWPFMBW+Q2/B2wCcqmrFLC4D7Ou6rVuRvx
	Ktt3cBgf40F0xwTVNOlCg=
X-Google-Smtp-Source: AGHT+IH7seR8G60ttmLboqJPcl1+GrmznG1HE6adUqEv8Stl2L2oMHxqZeyaHYKg0dptb5KP6eJNyg==
X-Received: by 2002:a05:6122:308e:b0:54a:9f40:ac85 with SMTP id 71dfb90a1353d-54bea1ff397mr7657435e0c.5.1759227670004;
        Tue, 30 Sep 2025 03:21:10 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bed8a1775sm2822888e0c.8.2025.09.30.03.21.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 03:21:09 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-50f8bf5c518so4435226137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Sep 2025 03:21:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOP+2j0GTckHDLK9Zq36xFCcOOJuXZg4/zLMN03RXEeE4gtfnhS9f9kQw3ND2l1HzHvRHUzefbji0sWxvW7esvwQ==@vger.kernel.org
X-Received: by 2002:a05:6102:a4e:b0:520:ec03:32e9 with SMTP id
 ada2fe7eead31-5accb9fe470mr8731133137.3.1759227669064; Tue, 30 Sep 2025
 03:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912095308.3603704-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXv1-w0SE7FZy5k3jg2FO-a-RB2w1WB=VM_UFEA9zjWDw@mail.gmail.com>
 <ef82c610-0571-4665-a5d1-07a9ed9fb8d3@tuxon.dev> <2bd09757-cd66-4a2a-8801-0f62dc99b9c8@tuxon.dev>
In-Reply-To: <2bd09757-cd66-4a2a-8801-0f62dc99b9c8@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Sep 2025 12:20:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6TQFZJ_r+XZOuh7yTUKwZxQRCr4Ps-xZ8U702xMd1=w@mail.gmail.com>
X-Gm-Features: AS18NWCkJPBMZWKc2yUGwPw-vQOHjjVBBvrCu5QO61We_9-kmpWet2XbZ5yLDKI
Message-ID: <CAMuHMdW6TQFZJ_r+XZOuh7yTUKwZxQRCr4Ps-xZ8U702xMd1=w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linus.walleij@linaro.org, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 30 Sept 2025 at 07:33, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 9/29/25 15:10, Claudiu Beznea wrote:
> >> This conflicts with commit d57183d06851bae4 ("pinctrl: renesas: rzg2l:
> >> Drop unnecessary pin configurations"), which I have already queued
> >> in renesas-drivers/renesas-pinctrl-for-v6.19.  Hence I am replacing
> >> the above hunk by:
> >>
> >>             /* Switching to GPIO is not required if reset value is
> >> same as func */
> >>             reg = readb(pctrl->base + PMC(off));
> >>     -       spin_lock_irqsave(&pctrl->lock, flags);
> >>     +       raw_spin_lock_irqsave(&pctrl->lock, flags);
> >>             pfc = readl(pctrl->base + PFC(off));
> >>             if ((reg & BIT(pin)) && (((pfc >> (pin * 4)) & PFC_MASK) == func)) {
> >>     -               spin_unlock_irqrestore(&pctrl->lock, flags);
> >>     +               raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >>                     return;
> >>             }
> >>
> >> while applying.
> > This is right. Thank you! I'm going to give it also a try (on actual HW) a
> > bit later. I'll let you know.
>
> Sorry for the delay, all looks good to me (checked on RZ/G3S).

Given this is a fix which will be backported, I will reshuffle both
commits, so your fix is first, and the above no longer applies (here).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


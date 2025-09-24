Return-Path: <linux-renesas-soc+bounces-22314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 207B7B99B28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40CFF1897B9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 11:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33D12FF67C;
	Wed, 24 Sep 2025 11:58:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D102FF16A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715120; cv=none; b=nEbgdmThUd0hKl9DJnvh8H+VfdLKBOU1Pwm8fLpXKkPdt66EZoNosTH529SEpHMcWuvd7r6cqiTm0zLIMaK/1omg6yo0OrCbF9FXBjb3u+SwkOisIX7ncinpXSSPT918h1fGQo71xjrKKMuGiULoKhTJzVKObXCkV1lhm6SjXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715120; c=relaxed/simple;
	bh=CH80Zg8QJziib3a9s+6lE/c7RM05j9no03yn3eyIRBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVZLxvg18DQNYwEgfd63NID6uE49jI3Qv4YgZwWUGaxuhSfMH3dravVyux/drk4vvO8hOUZfVzUZG8bOUqehKMtAVuEas8W7LLiC8jGWEtEMlvvzhB8QVvpp/WuedxuuM+k0KN7XBcphlXhIEumSkETvLeIZUItQEWQ0EW6LS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-904d71faab6so2644555241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715118; x=1759319918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1F+3NjRjW7oCcKmojh3L12WB2Mn5ermgaswG3WtQQkE=;
        b=ibVloFVI5CcdoB6uGppnMQVmpDha8bzte4umMfD/Th7tgbGKlsAts9HrXzU62Um11m
         x3zSMfW4ztc+C13zCLw8DUmwr8jI9/zHbukjncg4CgG3o2aZkoFj8aYW4HiWQtrFEeWw
         ksfq5iw/Elqo8wpvUhP+Atb+6rvh6QAMnGdeUqE0hNuCuoeiWfnIbsWI9RJ/guYvUN9R
         utLeio8+N7osdjF251RUkCSlGIbZ1MO93snk0syXMSE7Qeayp5jH09hX/s9MDRJn4Eqc
         7PJ5PoNJUNhkCTLCSSj+IgdU+iHyH1LN0oYAq+nXM8N3iD/G5G0TM17uvw/TYyklj+DP
         c1LA==
X-Forwarded-Encrypted: i=1; AJvYcCXEHvQWADHPpTTsmF3vbfRGtcqbwZYY90p5ioQtalS6pidTpbVWjBHh/MOBk7y0gBdF/AyJH13HAoT705HbeTlDtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrjZsxrhOmhBjZb+UpNVS1YdvHs/lVhPDlIkN5iEIq3UH09bO
	b1es1x9RtM0hKPPFpb7UIwKwi4Iz6tgoXoi6nNaxrpBbSPH6kj0TZYhmzMnobcEI
X-Gm-Gg: ASbGncsNXB9rvag81yNBZj91Ekjj02A4NyZ3c19fmoGY4n75a9Ijq31/2cNB2ftfrsQ
	6guNWVY8Ml00bJDg95WU7TnsDG/j+/8x/rueQmTUo2Nr4LTYxCW+x+GVFzuKaMgs6JOaPWjRS0p
	B5NtOqvSaNqiv2xAivwvtheoDdboeUIo2pV0VXG7RA/LekYaHIacya/usb5JDsZPRa+0WuRhEnm
	5/hvjwM7GOB1iGya5CYGlgK8EL3+kqZnCMKA60UKw2Nl6IEYyMAK0vpF8KJ867VvTpqH67hqdtt
	81xkbHy5LWij0UYiehUMEEZHu7dQ62lLBsGbGiHYRGe1vcwnaXv8UJMnhvthg8LTSzaMVSljDpr
	OeDxPnEUmkFC8JRm1+/NqebTFsZM9wqfBv6CagEXPvCMR3Nkvu3Kg2gb/VvaB
X-Google-Smtp-Source: AGHT+IEsXE8O23JGnMwx3kaEZR1ZnHOI/x1okH/JR4nx1cqSB3xZDSYSyiepMRwV3gB2v2d1picXog==
X-Received: by 2002:a05:6122:3188:b0:544:4ee5:1334 with SMTP id 71dfb90a1353d-54bcb0792e9mr2204285e0c.2.1758715118356;
        Wed, 24 Sep 2025 04:58:38 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bc0141d54sm1478543e0c.18.2025.09.24.04.58.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 04:58:38 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5a4c7410de9so1372713137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:58:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMvazEgwTnI7PqVypKASuo6lOkr1Y87P9/Afzx2zUZ95NOVHWsYZ3rMPzU3yRVZ/V/gwCdwKan9afJW6yzx4lV5w==@vger.kernel.org
X-Received: by 2002:a05:6102:32d0:b0:515:a84d:45a8 with SMTP id
 ada2fe7eead31-5a5800da2bemr2283926137.20.1758715117607; Wed, 24 Sep 2025
 04:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923174951.1136259-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20250923174951.1136259-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 13:58:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdoJsr_zopj511gx3Gb8e3NmLyG4ge1ReZJG9A2SOXew@mail.gmail.com>
X-Gm-Features: AS18NWCEqlWzRSEZwc-etvpzN2cuJ6XqdlAjQdzvmM1IviyM4O9XNmvx6ad4ciE
Message-ID: <CAMuHMdVdoJsr_zopj511gx3Gb8e3NmLyG4ge1ReZJG9A2SOXew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: remove extra semicolons
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 19:50, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Semicolons after end of function braces are unnecessary, remove them.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


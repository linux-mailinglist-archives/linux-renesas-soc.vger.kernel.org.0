Return-Path: <linux-renesas-soc+bounces-26012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CACCD6816
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 16:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5336C30726C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B7F3218B3;
	Mon, 22 Dec 2025 15:15:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88460320CD1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 15:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416527; cv=none; b=dHH/ri1CyvufU80qr0Pmd1JXHhLj06NcWGOLlAv8FuKUE2B58pxg4GBrQZvjD1qZmT4gWi94/72lZXQYiK3p5WlsQGdtVowVrVIocAel377r8LkenmeH/ZVWQNg5wZ3veyRFAZU2N4Rf1LcI7HjDK9fnSOd4JPYBy+iMFiaY0VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416527; c=relaxed/simple;
	bh=O8pZL4NMYK531cx9bv8WY7RNqg2T78nYqG16ntxwKiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyPW4DNNCeqgxMCYcoPUbF5BRdAp9FjZQtex1vTmg+Gm/FL0ZRB9J8B/VpPJkTEE/4fd7a1GB2ybBT8Ju7S/d7HGVUD0TBySk2v7ehi33qL8iShlRQaabjVApSnj809rJRPxjaNRYVNP213pfLqJigBOg7xVVf+CDOd09y9QJO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5eae7bb8018so1528296137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 07:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416524; x=1767021324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlhlbeiUd/10GzJ3WP3xjFNu241CxnEqVnyuXsgKZIQ=;
        b=g6liIVCwI2BrkXCEztnc349DXwO300nmIDx5zc7/OA7/S++T7rW/Ut6C3O2xI65wSW
         wsEG4n+Copq/l61RUZv+YiWrK1umSvftCDBGnSBdrkwBsSWoaGMrZcRAvHAIv+S75no4
         4Yx+FlBF8g+QdPN/F95x+iK5zruphyywtVbZbPRM7Od85Q0A86zGTLCnk39TWjaNnNw/
         ZE5M26r3YQyk9Jh0G2TiGabzi1DQ+nZEUeB99YC6nvbJu+xqVUJCiiLISCI2Gzkud+EA
         WKhWczQrFCSvo3Tc1TlbrHyaJnlZ7iFwtPCHrkNPM91ih//4tXfLWKtmh/niqBrOhgzi
         h6tw==
X-Forwarded-Encrypted: i=1; AJvYcCXdZtxuHXyO17moTfwv3ODvkKGJAtdKqfB4m3P7lgpg6PuqeHf3grVBDyGHH7UAuN997IWe6FHjZgdqRaFIk9YfCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwe0jP1ROVuNBZ+pUZR1RhlLwy3zUnKeHHZMxJqX4nLPHxR3c
	EH4Z5KbZxKWmV+jzakE/FD7rzpTHYwnGyS1egum3lkRLXMf2Ncy9hzr0+lb+e+0d
X-Gm-Gg: AY/fxX4hwc7lQf04mQDgC3qdumAHCA2TazLB97m5uFMpfXqMIdBbTWGiO8r94qhRBcI
	382ZYCmYywx1/1aKkqvG/Qk/loxryBnjXgFniejKFwFDDlZi7vdH0DqZV/nY2pcnE+9roshLdCJ
	gPPWUXTl1IY3FcRXbjwAbes9376WBDPJT2R03FtwsQTEEhHRlR1KZpkT39jVQkwX8Dd/8qcqhjU
	A7TYu/4nw4xqh/pmZUEtAalI5AN5JSlbNqCWqQJpZUS7xVvlYnXV7ecy7AboIO2Dc2ZYJoQUFNs
	tPmaLHPm6ze2ryURraZhHwFjYhun+6U/kw2IgkBqiTTBgWCVIfdqe5mF2tg5BOx8AyCcU2eAtxI
	X1eH5WwJu14vinbJHphE8PDwT4RSMgngkg+aVPywXcwY1h4lLgW/jr+5ARYK5VmDlRUMOPJ8rGz
	0E0DyHgWkZ2V5UbJ782Zg40Y7olrm1atjPsEDewD++IdQNnrvH
X-Google-Smtp-Source: AGHT+IEqJlTo6Wc/dNJ1B0HfVyA7uCLfUJkjdA/B9BDu6qlUTpeNu/HY9anfeHOSnVufUiVpQTfrvw==
X-Received: by 2002:a05:6102:6447:b0:5db:f9df:34de with SMTP id ada2fe7eead31-5eb1a7cf4f8mr2976072137.23.1766416524327;
        Mon, 22 Dec 2025 07:15:24 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94341797300sm2878776241.13.2025.12.22.07.15.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:15:22 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-93f6bd3a8f4so983117241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 07:15:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYO9tEa2tlBGiR5BnygWIGeWpNDQWis0W1I/asBH4c46UWWcezh1E8T3u0y7HglGpp/WRhFk29gF1oLr6ITYVBzg==@vger.kernel.org
X-Received: by 2002:a05:6102:5124:b0:5dd:b100:47df with SMTP id
 ada2fe7eead31-5eb1a61e6demr3062956137.4.1766416522224; Mon, 22 Dec 2025
 07:15:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203094147.6429-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251203094147.6429-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251203094147.6429-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 16:15:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVZRonj2AuT6fJH+SoA9feGQqr5vtVexqD9zY9Nzymnsw@mail.gmail.com>
X-Gm-Features: AQt7F2r5mBHf69-JyoBoifnBT6a0FoXKbz6Uq0VEUhCo5kqLod-PwGZF8JtWhI4
Message-ID: <CAMuHMdVZRonj2AuT6fJH+SoA9feGQqr5vtVexqD9zY9Nzymnsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g056: Add entries for RSCIs
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


Return-Path: <linux-renesas-soc+bounces-17390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAEBAC0E9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D5A1887CBD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8778528C844;
	Thu, 22 May 2025 14:46:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FBA28C025;
	Thu, 22 May 2025 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925201; cv=none; b=CPPBowhrsEGN09gqNXjes8xI9nsUtx5qFgSE4HIqOQc2QZQj8rQAoQYnSgocUVrP25mOJes5R3w106GL38hcgy6ePBFb+ArH2J2Qfgj9FZC//6PYkbAuwdzN/cY76ImCnqU1RjWtvRafkpyVb1deCzJIrjpTUGWffzB2H3D5ca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925201; c=relaxed/simple;
	bh=tkdNjecwk5czBscvpRc/be7wQ0ftkkenBXvx0D5y+zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uir+EGPpvmupInHSf0xpUM/zzmzSqhYFUcsQbYW8aClMG7I8XQjCSXiTdidQU4jGZcPSa4MWP6jPL+vQ4XVEeJwTlutKIckAPqcWPCZq3zapBy1bIzSPWREkTRpaIb5fcubFNrKjHO4lcxs2F1AjxrX5UjMyuO6V3HF6BC0K1ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e130b8b9acso2406591137.3;
        Thu, 22 May 2025 07:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925198; x=1748529998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y52tezzcpCUVN3gKIUjkdR+er8m1Gq5bInxI/qs2aUI=;
        b=kl3FZpoORw6grFtVbANBMXiwhfWjQYRwwJ5W3cPEm8B2t6uJNvEz/hs965ncJUP1PJ
         3tjt7EOxMfY4YssEs4yL/hLuJMj1m2MqBYflqcaPSLpFy0JKRHftlxNAS+Nu4CBeBXVi
         a492d4Au59gQjNUe6Pge1TOnGstNi2En3m+zdUfP6ZZdoGpvIdaYYdor11GOlZe5qfGJ
         kp4m4/wK7QET1iKd6LyWCHCtHfp63NJtH15HnYj7grNsSnRzLVhEqUn73nxYZZ92c7DU
         EQiblcbGKU5yqo23cSdJILrsneE5wsFZoNfRpDDBneuijAeAsBdKmiinMMcEltyf2HHu
         wFIw==
X-Forwarded-Encrypted: i=1; AJvYcCVWroFlzwXsqrzrUUudpz4dHKYU6Ppgu4jNmGO3nemWEZrnjXGmXTPBXYPBY+OzRRL+E+pEmsDTuJgnT5lfze9y16E=@vger.kernel.org, AJvYcCVbyORhZkEDzPtrhHneaOxzw5ZzE1myIRcoR6wlhcqN9SwivGquDKVzYZFiTlxiacK8WddhpwGuQ50U@vger.kernel.org, AJvYcCWf1QImxXjY6XBYYjXBKhsg+MYnqK2FueNQClpIhw8EOQP2pLt7LYxEZiRp+T8aYtBHs1TDd441JCnWcAmr@vger.kernel.org, AJvYcCXlvQq9x1JGJc3HlCYHto6jgXoW//ZghaJmGfAiZzh4D1+8g21TumEcAsaEwBUSOroghqUYTx1tQZYe@vger.kernel.org
X-Gm-Message-State: AOJu0YxigscEwhV09ApHxmN9DanDG9HQZ30NjQZ9zlwV4/3oZhbjPgyC
	JB6fFBS/cbP48Kl5q4R7+KqwZXZzc5zh8bcfE4n8KPekF5wvlir5dvYVfqVl5/9F
X-Gm-Gg: ASbGncsVCsNaVImL5Eyu1CJLMiLgNCX8ZA0bMSmIUQzha7qSb3n4StC8hX7vbNJszAl
	R7CGfQp37qqBqKt6p8/teDkVybV0ndpylf7P6ok2w+ihYnRjZaa957lil1j43248et0QjNNdWNe
	A4m8OiDYI/kEnJ571sau6sur3G8Tw/1bnYCXxLuz+7g5Ree0YBL6f1Cxfw2+pI+8F5zYzPY0fm+
	BNSWIwiWv2yBCyH4cHT69BqyZ/ggri6rIkCSowY6wMyqe80sJ9EqoqwAZ6P6/76YF8RiCW/n8kr
	8CFOKJzZrPD61uQa+pWfxKQMnaVCwv06twR/KV70/C9YuXW4V3wGEUp3ctybMzzMNiA2+tY1Yke
	5zx765goJtg023359FfUUOyTk
X-Google-Smtp-Source: AGHT+IGx10ive68RO5F6G3nhO42yq//VbGxb2oAQ7SMvRSOrdBWkfxyEr8xzfbnlCmuqZKqN23+q1Q==
X-Received: by 2002:a05:6102:1628:b0:4db:154f:aa02 with SMTP id ada2fe7eead31-4dfa6ac0d8bmr22619868137.1.1747925198445;
        Thu, 22 May 2025 07:46:38 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa682e051sm11134564137.20.2025.05.22.07.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:46:38 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4c32f1f7801so2759356137.2;
        Thu, 22 May 2025 07:46:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOR27lSfVn1sB9NjEwTLGvD35Hk63kOq1DzJ6qjHPYS1ZwNf49RVTR4YGQj9qzpAR279SNZFfT2XRAQqSJwOagXNU=@vger.kernel.org, AJvYcCURqvxkjEkIZiq+/K2uGltdXfNbd/t3sOMUGpoAMtGXMf6tDrI8upsllfj+ALbJ2nobl61bIeMFjL8i3OIm@vger.kernel.org, AJvYcCW+E9AlsmEcJK2+f+Di0lbSw6k2/KLOKmlRRqivMYNPj8XqDddoF7wHnu4jOdZIT7QTo+yPlZH2l/Jz@vger.kernel.org, AJvYcCW14MULY1wOTGzuhodNlw7as/cQ51b8Wm67YWzi8m209Y5vWC4lIsNfCUlcf3n399RgXNqqTqDExzcD@vger.kernel.org
X-Received: by 2002:a05:6102:b15:b0:4b2:c391:7d16 with SMTP id
 ada2fe7eead31-4dfa6b5ff89mr23604430137.7.1747925198122; Thu, 22 May 2025
 07:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com> <20250514090415.4098534-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250514090415.4098534-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 16:46:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0EHrFz9d=QSGAhFeFKPmCX8=ofBLeK98R+MBLZZKJaQ@mail.gmail.com>
X-Gm-Features: AX0GCFt8QyPA7E6eF8bf2pNKmHWl5X4VV9KNcduAM9qHCgrKuZjYWFuc5C3q3D8
Message-ID: <CAMuHMdU0EHrFz9d=QSGAhFeFKPmCX8=ofBLeK98R+MBLZZKJaQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] clk: renesas: r9a08g045: Drop power domain instantiation
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the power
> domain instantiations.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - added RTC MSTOP bit on the VBATB clock; the RTC and VBATTB clock
>   is gated by the same bit (CPG_CLKON_VBAT, BIT 0) but they have
>   different MSTOP bits (bit 8 for VBAT, bit 7 for RTC); this is
>   not described in HW manual ATM.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


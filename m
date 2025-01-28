Return-Path: <linux-renesas-soc+bounces-12672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF96A20C5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55D3F3A6922
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9875E1A8401;
	Tue, 28 Jan 2025 14:56:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D2F9F8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 14:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076163; cv=none; b=bPlvL7ugdi3DplFH7aHP0RmXbSadmAZicvKGZwShM+i2li6bsdJKBoUaxQW3/Gci3oQkI0bDDoYMPzBL8w8JPqYzsV9gn3F/hIf5sPFaXZMuvCz2g1Rkl9r02OGeVPSiVE0NoWyB18xoEelUoEW1EsbAwFOLjgurkCZ1uwJXLWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076163; c=relaxed/simple;
	bh=0Lo4vlsD/7IBqKsV992Nlb5/HfdQhO1vsmixfLTYNTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZkiVQJKpgfFoFFkAfvQj2Jrrn9So7ifDXZdsCJFW9qYa2ZIV1pQqsxm3eQNyXJ93UFRjTBWAiB6WJ2KtePJzcUZMCebOuYzpV6Iyv6KxjEGRATSBgkQFE2jpwHbewTA1FV2fjg4Xm+E1rPdTAzS+S9KqaaVw1m35xQvWlPSbD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5188e0c2b52so1727630e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738076159; x=1738680959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCrHVjrzI+dchLx8ApA3vKvbS8C2z1jPgE2fyYlNFG8=;
        b=L8PjoemAuzPVJ2igeY73+QMSavtiatU0JAKXS8utwcBvJWivIRnjOvw8He3l+TOdMG
         wfL+zVm1oJSkmhpzRU5sQBKWt/S+j6989UlzTaPoNWwXkW904FnxGkOkiMwWQsiDuydi
         hjcj2PDiikdWXyd9oA3oFIl2T09FX00HeMYhEswL7r2rJORsn2m9HyTy6u1lkzfjjVv8
         5jJifFEYWo0Z88xYgYXLvygEuxXYBpHsnuG3qgIXq0sFdjW6eqNIlt0YFc08yXpKKDas
         SZjWA9DlnJervcFF/8U6Q/Veq6ydaM3a7yS5+odWNH1KAjb78NoBIZzV8SYdTB4TlgtB
         6gRw==
X-Forwarded-Encrypted: i=1; AJvYcCUxBWmdokmq4wZ35OzEnNCAECFPfl0LSDdo0WTceEKzn73cuCakxWWMn54eYJCWNvxD5Yo4AjPj0MRt3zmWtVqdWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ITVL3VQMd6Dcvf/lZhOfHxnO3ZIWLAiUat+4v3ntcke8OqM+
	3GSYw06cZ36a5mt7qklLkhcJbxehwhe9Zki9pnWZ3eJgULX7AZOHqDUnmgCs
X-Gm-Gg: ASbGncuBDpFgEIO2+VUasSH6gk2WYFcHuppjNrU+2CoAX+7zx5mX0s4SX8J6AQwMgpq
	wVo6LAkD8fNQ1d2drbugV2LfptVSLtHga6Kywpwb1No9KxpoCKkAm5kTFA23TMqWpjHPqUDnXcv
	R3lcfwaq8FOQ29Nibvmtl1Ept7r0mf698rS6RqaAjqPOMiUccHvk63W7LNJ8BQwN4ZjoOCqlW5b
	ivnmiLxPG0/bflef9vxSBMdvmxhdlufhIC4VEBOBSlrub9yKhly7ZyXHTD7AblNpMiMDbn+zp4t
	MXreNYapOtmOTqWYBnRyYkzAZWYm7pctk1Fe3h+OLxHECanazgts0h5SN/6qL1d3
X-Google-Smtp-Source: AGHT+IEH7+tM8BFOcxXThA7xfogb1hBvx497kDxELRed7Mo4LSVEhq89pjhRdkBjJOptQGRTGK3ppQ==
X-Received: by 2002:a05:6122:29c2:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-51d5b33f6fcmr37902448e0c.9.1738076159613;
        Tue, 28 Jan 2025 06:55:59 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebe9b38sm1800859e0c.39.2025.01.28.06.55.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 06:55:59 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afe1009960so1654801137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 06:55:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX57tV7rK67cQaqFOYu6t4AVRnF1pEprf4X1uY/aKfYbtw42O6Q8wfJxqpXmFSO+QSEW88p8zqsz7SqCOVYllKHGA==@vger.kernel.org
X-Received: by 2002:a67:e715:0:b0:4b2:5ca2:48fe with SMTP id
 ada2fe7eead31-4b690c1bb38mr39085949137.15.1738076159121; Tue, 28 Jan 2025
 06:55:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com> <20250128104714.80807-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250128104714.80807-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 15:55:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVUGjpt6qr3+Q0YvC+X82deH1aT15Zox_XFENtmHKaiJQ@mail.gmail.com>
X-Gm-Features: AWEUYZl-ahACxH1oy-glfrZdpjPfSFStwAm1S4oJ2BxKAp5ydODhafsMWp9ECns
Message-ID: <CAMuHMdVUGjpt6qr3+Q0YvC+X82deH1aT15Zox_XFENtmHKaiJQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] irqchip/renesas-rzv2h: Use devm_reset_control_get_exclusive_deasserted()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Jan 2025 at 11:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Use devm_reset_control_get_exclusive_deasserted() to simplify
> rzv2h_icu_init().
>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Replaced 'goto put_dev' by 'return xxx' as put_device() called by
>    devm_add_action_or_reset().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-1921-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB72E840250
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 10:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423471F226BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 09:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E90A55C2D;
	Mon, 29 Jan 2024 09:57:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C72B2F41
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706522275; cv=none; b=e6/T+NSludXd1FprIRCCHYZavZL1zr0md4bNhyyXWXgrXXP8/5KQRwQ0uz/vcTVcYGXJjuc6aLqd1SRKaf2rqGFQCHiiTncpQXvWX4yEhM6DEyNV2nmELqBmYYMr4SGOfX7nSJ4U6bV1Acm4ckTDJ7WohrwymeAkiAM509AMXXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706522275; c=relaxed/simple;
	bh=d4Icl+5pUIPQJ1fUBXwNA4S2LhfMfSrWPefqx3x6CYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbOa+vY4+0DyCQyHOCgzOyJkDD3RdYnZQrcuX2k/pUZRNLs0NgDD1G3b4ClqjEc6UbFPzLudaoUC0EVPxLmXl/U4vjs1gMYfE+VT2N+KqH3lv5O1n9HCA693gAD5LPgjwYHcW1hzmwqOyNcpdDqIPYHj7u56zNkbx9sQjbl5RRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-603c5d7997aso11650467b3.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 01:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706522272; x=1707127072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzqcm2xJXD7krHm/1vrCd94y8Oa7U+0WqfNMjatQeQc=;
        b=KYU0o/fe71xlHXfgMmwoA8MegQvPpfnPcUOorEMz28TTsRgvYQNoeAEbj72jIThSrH
         Jx6dqWj5RUUT63Ecb+OJxPowvAr5QDesNosScGvqfBmhbHAiZucEoOq2GZEAjy3CpjZi
         ryFXxBGSgJ2LcKgJfqXsx2uQn4eNlXonsyCZLaRcXHPd2nkdzJcCOlc/7XHmAmW9L3F6
         6Rm3RK/K7kUDvf1qcZLNxNtnBQGRQ7r70/sQLnfEV4mFPonpxIBNbrgdxC2lwUU+LWju
         /4V8Xu8mPqoUy6otUKxqp7cnwdCmtv2L4up7MUvuNzjaxUspSSuqD7bbRPwY8t6vepLz
         finQ==
X-Gm-Message-State: AOJu0YxZCLEg6GAU8VXkmdSeOaJqlO5v5Y6TzhP9yI+8rmVfrnDS6NSN
	tzmXONDRzS1dTZjHgqvVy4BG4AQm6freq2MNIBb4BWRc+I8iGdQG94RG4JVopOc=
X-Google-Smtp-Source: AGHT+IESpyfDv8EgmnUho4cA+fD6gb72HnB+UpNPFMOP6yimJbcpoFUOz28xLAfrI5cXk7k0qbuTCA==
X-Received: by 2002:a81:e24c:0:b0:602:a760:8142 with SMTP id z12-20020a81e24c000000b00602a7608142mr3292810ywl.12.1706522272327;
        Mon, 29 Jan 2024 01:57:52 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id be15-20020a05690c008f00b00603cbcbf4casm960083ywb.67.2024.01.29.01.57.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 01:57:52 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6933a46efso47603276.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 01:57:52 -0800 (PST)
X-Received: by 2002:a05:6902:1003:b0:dc2:2d75:5fde with SMTP id
 w3-20020a056902100300b00dc22d755fdemr2026327ybt.29.1706522271978; Mon, 29 Jan
 2024 01:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12ff20eb-d4b5-41f4-a494-cfb6b7abe617@de.bosch.com>
In-Reply-To: <12ff20eb-d4b5-41f4-a494-cfb6b7abe617@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jan 2024 10:57:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=igXesjxvNk=+in62neW=kipnFW2BUH3P7sfDnqXzEQ@mail.gmail.com>
Message-ID: <CAMuHMdW=igXesjxvNk=+in62neW=kipnFW2BUH3P7sfDnqXzEQ@mail.gmail.com>
Subject: Re: rcar-dmac.c: race condition regarding cookie handling?
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dirk,

CC Kees (for the wrap-around in dma_cookie_assign() not handled in [A])

On Wed, Nov 22, 2023 at 8:02=E2=80=AFAM Behme Dirk (CM/ESO2)
<dirk.behme@de.bosch.com> wrote:
> using a rcar-dmac.c on RCar3 being quite similar to the recent mainline
> one [1] we got a BUG_ON() being hit [2].

Thanks for your report!
The side channel info told me this is rcar-3.9.11 based on v4.14.75?

> This is
>
> static inline void dma_cookie_complete(struct dma_async_tx_descriptor *tx=
)
> {
>         BUG_ON(tx->cookie < DMA_MIN_COOKIE);
>          ...

Note that dma_cookie_complete() also resets tx->cookie =3D 0 at the end
of the function, which is also < 1.

> from dmaengine.h. I think DMA_MIN_COOKIE is 1, so it seems that cookie
> becomes < 1.
>
> Looking at rcar-dmac.c, there is one place where cookie is set to a
> negative value [3]
>
> desc->async_tx.cookie =3D -EBUSY;
>
> And it looks like this is not protected by a spin_lock (?).
>
> Could it be that we hit a race condition here?

rcar_dmac_chan_prep_sg() indeed does:

    desc =3D rcar_dmac_desc_get(chan);
    if (!desc)
            return NULL;

    desc->async_tx.flags =3D dma_flags;
    desc->async_tx.cookie =3D -EBUSY;

However, rcar_dmac_desc_get() does hold the spinlock while removing the
descriptor from the free list (chan->desc.free).  So at the time its
cookie is set to -EBUSY, the descriptor is no longer part of any list.
In case of an error, the descriptor is returned to the free list.
In case of success, it is returned to the caller.

When the crash happens, rcar_dmac_isr_channel_thread() is processing
descriptors on the completed list (chan->desc.done).

How do descriptors end up on the completed list?
  - rcar_dmac_tx_submit() fills in a proper cookie (from
    dma_cookie_assign()), and adds the descriptor to the pending list
    (chan->desc.pending), while holding the spinlock,
  - rcar_dmac_issue_pending() moves descriptors on the pending list
    to the active list (chan->desc.active), and, if idle, starts
    the first one, all while holding the spinlock.
  - rcar_dmac_isr_transfer_end() moves the current descriptor (which
    is on the active list) to the completed list, while holding the spinloc=
k
    (by its caller, rcar_dmac_isr_channel()).

None of this looks suspicious to me...

Do you know if any calls to dmaengine_terminate_all() were done before?

Was the system running for a very long time?
dma_cookie_assign() relies on 2-complement signed wrap-around:

        cookie =3D chan->cookie + 1;
        if (cookie < DMA_MIN_COOKIE)
                cookie =3D DMA_MIN_COOKIE;

but given the kernel is compiled with -fno-strict-overflow (which
implies -fwrapv) that should work.

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/dma/sh/rcar-dmac.c
>
> [2]
>
> kernel BUG at drivers/dma/dmaengine.h:54!
> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
> Hardware name: Custom board board based on r8a77990 (DT)
> pc : rcar_dmac_isr_channel_thread+0xc0/0x190
> lr : rcar_dmac_isr_channel_thread+0x84/0x190
> sp : ffff000008b8bd30 pstate : a00001c5
> x29: ffff000008b8bd30 x28: ffffe026daed4298
> x27: dead000000000200 x26: dead000000000100
> x25: ffff158988c28000 x24: ffffe026fb558cc8
> x23: 0000000000000000 x22: ffffe026daed4254
> x21: ffff1589821bd000 x20: ffffe026daed41a8
> x19: ffffe026daed4288 x18: 0000fffff59a0c6a
> x17: 0000ffff94c70f88 x16: ffff158981f3a17c
> x15: 0000000000000000 x14: 0000000000000400
> x13: 0000000000000400 x12: 0000000000000001
> x11: ffffe026fab47000 x10: 0000000000000a10
> x9 : ffff000008b8bd10 x8 : ffffe026fe0f1870
> x7 : 0000000000010000 x6 : 00000000588b0000
> x5 : ffffe026fe5d1410 x4 : 0000000000000000
> x3 : 0000000000000002 x2 : 0000000000000000
> x1 : 0000000000000000 x0 : 00000000e6f90060

Unfortunately this does not show the actual cookie value found.

> Call trace:
>   rcar_dmac_isr_channel_thread+0xc0/0x190
>   irq_thread_fn+0x28/0x6c
>   irq_thread+0x134/0x198
>   kthread+0x120/0x130
>   ret_from_fork+0x10/0x18
> Code: f9407293 b85a8260 7100001f 5400004c (d4210000)
> ---[ end trace 03ab56fc988cadbc ]---
> Kernel panic - not syncing: Fatal exception
>
> [3]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/dma/sh/rcar-dmac.c#n951

[A] https://lore.kernel.org/all/20240122235208.work.748-kees@kernel.org/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


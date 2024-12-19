Return-Path: <linux-renesas-soc+bounces-11579-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8D9F7F40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 17:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1181886B49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 16:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFD8225A3B;
	Thu, 19 Dec 2024 16:20:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D9713A41F;
	Thu, 19 Dec 2024 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734625224; cv=none; b=pnyUt2jpLw212Nq/dCAnt/Td8L4D4RZG0Wb8RqjYoA//Rx4wzeJeRBYb+b2srPSjqALbWKKcI94+xqxM7lzkSfZVIpLIEhfFPkHnf8Rikkn4vHgG9l0l/MhHiA7wNQgzqMG01+92Zj7CMaDvQDMeahgBinLhBcJDZyq6M0byCcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734625224; c=relaxed/simple;
	bh=1FBzNDdddOAjY6CCV/FYaY2O2YDJBnM7zPYDce+orr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G7MotvdQFmO7+ert+oiNHC6AJPiC9YJfZGmBPsYVaadSWrIrUy6fsI2zzyLy3GO2VXk7+n1QaG4MVtDpj0wMMy7T5/H09lLWiNOpFp9B9Zr5NGInGISsEHO8bKXWR6fN9zjKFi/KC6oqb8/3ruldkpmMFnCcSvnPmJkGOMmiZ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6f19a6c04so77185385a.0;
        Thu, 19 Dec 2024 08:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734625220; x=1735230020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0DCle1c4hoD7xrVNaXrgEr8en3HZBbQZppsq8Vm3Bc=;
        b=l4vokiyv86wbVMLn3TH75UQurVvopKqOX/L/aNETnbG0mXpwWJS9gv4QEvMWP3JtHN
         4IlEvImBZEHHVTX6eXbNpGoAuZ996BGY3cO0m2UgMR6/UhK22iTBab3jowlIM2QjH4kP
         VylcP7kDZpB3wGkPKSr+r6OR72Q7HmPTXMooFcJkA6ksMB7JlFubQuUw4WOtl1JZTyZx
         zemapDUdHW8Y3je6DBDsdEypTqsGDmumjocgxUPGow38jyqnY9udNt7126Z2TzKnUWPP
         BsWI+7lW7G0VsFhVI8qACQjGGugrArN3Njzcxka4g510MgP5o4LmbaGF3B8iXr2cjmIo
         8XkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1418MRq3gJ9FGNTAytM+f+sv532cqIltLsLC/PMfmvOOzlQ7gxeIqz0PeCky/6EB2flWn5woBjYc=@vger.kernel.org, AJvYcCVRRx3+iX0NhHPv2kY5s8D8fa4EWmnwZRkSsU9pL0FwTi6RY5RUCHOm043GHzzKpa3KqVdGjnYc4KZQH5/L@vger.kernel.org, AJvYcCWkMMQR68+hn/me2hkdNbcj8OgUOU2SAv/Tog8hyMYM+j9uz0esnrc8kjUNPTxuaItWa1VuzfOzP1JXHgwrYfi7LSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY09AMV2ysa1y0FbvZ06S8oZVv/UjM4Nt58RONQN6P0SW1U1Qj
	NF657op4eG0JN1B3+3DN+YE6UXwbdVjzTcnWhcE+Lih3R/mITn19w6WsAK5l
X-Gm-Gg: ASbGncvNZsBAx5uCSheIJc7TwP1eV2teFTVwdMoOqUaD8Ji86SSAJv3LjTxzbqAT8v+
	GTIMos0tyuIsua2c7SayUiWDsL+f6ew1f8j5zPBmTSdpjlefpXn1fnxHLh9JCMCEo8MYEuoue2Y
	236H8nHtqjOqkcNgXR6KazGC0EB9CkInfnG9AwfcOD9TuljVcftvA5SRMFbnqDc0wEOChI91jkx
	aC7/OBoRH7ZyS6VwoUv0Z1Ax3hXNAWvuo8Ry1b2Rm1b7O77HHlC8Ej0wCjJXpy5gRJO7nEbQ/iu
	qzR5+6El+LIWqqeQoH8=
X-Google-Smtp-Source: AGHT+IH8NFDxYyGZAhrMnYYifFA6k+sm68mmlSOXaVKloxOuNk1zZG5bbnXr2v1hKUCHUGQcielVUw==
X-Received: by 2002:a05:620a:45aa:b0:7b6:f143:44e3 with SMTP id af79cd13be357-7b86375a1b2mr1071793285a.32.1734625220439;
        Thu, 19 Dec 2024 08:20:20 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3e9fesm262398241.25.2024.12.19.08.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 08:20:20 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so220783137.3;
        Thu, 19 Dec 2024 08:20:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCTdQyMKWvxpSwpAz6oN8ZYm4nYI2O7bX7jXKeX6Askx3xHLXtgdulcDs+9tv6lCHtVlSRA1wjqXA=@vger.kernel.org, AJvYcCUofgwTwi8+V5twsCWKDNANizOQzNT0pwHJyoTlyiLsVpHuryvio7dhbwuDCEZ6JuW2volhWPorv+0l7rVUXZwzEJ0=@vger.kernel.org, AJvYcCXHetSJMBG+ENf3rjEtiaVCjDLkDvmdnAheQJX6EX0dwHUMSSso674usCM7oQ5lupt/dhtSMW83SbHaMwwv@vger.kernel.org
X-Received: by 2002:a05:6102:cca:b0:4b2:48ba:9943 with SMTP id
 ada2fe7eead31-4b2ae86db7dmr7436778137.24.1734625220006; Thu, 19 Dec 2024
 08:20:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241218142045.77269-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241218142045.77269-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 17:20:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVz95gXsYpF57sDJ4Y_by0chEuzgN-Bz-KZpzycZMrtGQ@mail.gmail.com>
Message-ID: <CAMuHMdVz95gXsYpF57sDJ4Y_by0chEuzgN-Bz-KZpzycZMrtGQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: rzv2h: Fix use-after-free in MSTOP
 refcount handling
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, Dec 18, 2024 at 3:20=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Avoid triggering a `refcount_t: addition on 0; use-after-free.` warning
> when registering a module clock with the same MSTOP configuration. The
> issue arises when a module clock is registered but not enabled, resulting
> in a `ref_cnt` of 0. Subsequent calls to `refcount_inc()` on such clocks
> cause the kernel to warn about use-after-free.
>
> [    0.113529] ------------[ cut here ]------------
> [    0.113537] refcount_t: addition on 0; use-after-free.
> [    0.113576] WARNING: CPU: 2 PID: 1 at lib/refcount.c:25 refcount_warn_=
saturate+0x120/0x144

[...]

> Resolve this by checking the `ref_cnt` value before calling
> `refcount_inc()`. If `ref_cnt` is 0, reset it to 1 using `refcount_set()`=
.

Thanks for your patch!

> Fixes: 7bd4cb3d6b7c ("clk: renesas: rzv2h: Relocate MSTOP-related macros =
to the family driver")

The description (from your [PATCH 2/5]?) does not match the commit.

Fixes: 7bd4cb3d6b7c43f0 ("clk: renesas: rzv2h: Add MSTOP support")

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -565,8 +565,12 @@ static struct rzv2h_mstop
>                         continue;
>
>                 if (BUS_MSTOP(clk->mstop->idx, clk->mstop->mask) =3D=3D m=
stop_data) {
> -                       if (rzv2h_mod_clock_is_enabled(&clock->hw))
> -                               refcount_inc(&clk->mstop->ref_cnt);
> +                       if (rzv2h_mod_clock_is_enabled(&clock->hw)) {
> +                               if (refcount_read(&clk->mstop->ref_cnt))
> +                                       refcount_inc(&clk->mstop->ref_cnt=
);
> +                               else
> +                                       refcount_set(&clk->mstop->ref_cnt=
, 1);
> +                       }
>                         return clk->mstop;
>                 }
>         }

This makes me wonder if refcount is the right abstraction?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


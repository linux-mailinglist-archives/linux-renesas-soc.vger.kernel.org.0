Return-Path: <linux-renesas-soc+bounces-10622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 009939D362F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ADBCB25FAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A229158DD1;
	Wed, 20 Nov 2024 09:00:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270FF15B115;
	Wed, 20 Nov 2024 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093253; cv=none; b=OZNcSjoYtHB3rZV/sX8nbZdg1rkZa1vv/Cq0z2GczsUTIQJ9aPvX2VJioyZQWiZRF9OCBhwddHSkOTiUeJ0tFSkFdSvFWseuj+N/L8Ay6VsjpyfiSnCqvk/yXWwrHh/5hs6JRIS9I6TtFWz4Iyl4cV/6j6qU558HXKWrjDniUdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093253; c=relaxed/simple;
	bh=RnS1nxxx47MKe6nDW+3RGlGfHUnfrBZzkS/gbMkjHPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AaNBUVZolbaKcjzUorfw8aMYrLmN9HIfSnFHgHYoHu3aWYDV0zJD1w9i/SAEv/7WtlgfsNtQKSZFiz76hPk7/1TRGB2NumikmDvPmGRSgQd5WHaptxTagabiLyMsuGnxvPtITHdM5jNQIcZzqlA+ETXRGI057w0bsthL+JrzxAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e388d853727so3109592276.1;
        Wed, 20 Nov 2024 01:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093250; x=1732698050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcTD2T+WoMDafUSBqhXPFjf0YjyolZ0Nrc1lSsT+7BA=;
        b=RvKC5XEI6uvYRDMn47phCO9f51hnNEuQBn5Nuon33cPNPmjF6wzRccCrtQI1HNOgYW
         AFkicSfVowH9PQ+0ULbxPGpgaxUh2g5rFqcdO+QnlMWtxEhTva8tdrZ+rWIvfXmwt5fo
         NoUjUHxm9toKNIRP+5E8Jv0VBwbCaz3nO1JkpoINO+fhaT0433I8FhKgrHdSbx/zIg5C
         +3CxVeQuHL5RudnXwzfw86wT7o7hgOFEY30ZYDFNeez+JYLcabTPqBfpzoswo8LylBBe
         ONrHWYvz0pGU8I9N9X16FQzPVVyx26OjiAMyqbb0wA4EgvWgqHyHcccCV1uzsotPGRxK
         6epw==
X-Forwarded-Encrypted: i=1; AJvYcCUKOqWn/ku7RnkdK928vIUXH15RsVU0LQC4ItcomXo+U9kOs4vlVHEJftLd5ZnNR5/aynK1EmOQ4dVRluw=@vger.kernel.org, AJvYcCV770W9oxuau7MalyAM4mUMAe39VtVDVK+tXG1FKUg/gfARv+0fQbzUiAxR7NDukr+yG0O6TI7iPlICxcMGuUg1b64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVQyjEQnpyXaZdyQOMtWpbMFUlNG980n5ixn9q1+mqA1uLVSlO
	SXqG6e5Hg96B6gbmYY2eyAi06j0M3Qxyv2m5XHfi0RbrnE9aSIAPIZAt3B6q
X-Google-Smtp-Source: AGHT+IHyR5FDoKKElR9ZlnFKL8HF9wMjJ07vJzpWbtCFMHCN0SWsqeoR0YmC+GK1Jfe/DGoX2CVigA==
X-Received: by 2002:a05:6902:2507:b0:e29:2f58:ffd4 with SMTP id 3f1490d57ef6-e38cb57f020mr1719422276.18.1732093250381;
        Wed, 20 Nov 2024 01:00:50 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e387e7e7357sm3006464276.46.2024.11.20.01.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 01:00:50 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ee9b571665so28043227b3.2;
        Wed, 20 Nov 2024 01:00:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmeUJO4M72BgK6mUSlug4WgppTxdWzDHKLkERwVlNa58SP4z04mmMpYSh8cPFWuKlZSHClsdiv/hi/L5Y=@vger.kernel.org, AJvYcCX1PZnt6QRnwuxxKfj1UVn8LAC1FErxONeo7p3SLtISx6D2CFZj5iMcpDYtoSauzOt4MF5CFg27uXA648RmaxC5efM=@vger.kernel.org
X-Received: by 2002:a05:690c:c15:b0:6ee:7012:d7b with SMTP id
 00721157ae682-6eebd2e3b67mr18972917b3.37.1732093249783; Wed, 20 Nov 2024
 01:00:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108160717.9547-1-00107082@163.com> <4ce18851-6e9f-bbe-8319-cc5e69fb45c@linux-m68k.org>
 <5ed0a36f.1698.1934737447d.Coremail.00107082@163.com> <710d6832.1f29.19347541394.Coremail.00107082@163.com>
In-Reply-To: <710d6832.1f29.19347541394.Coremail.00107082@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Nov 2024 10:00:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUGt-8onJqKbai9Uc+Vb-YHXKx_ggMqyURJp5btuf1v_A@mail.gmail.com>
Message-ID: <CAMuHMdUGt-8onJqKbai9Uc+Vb-YHXKx_ggMqyURJp5btuf1v_A@mail.gmail.com>
Subject: Re: [PATCH 01/13] kernel/irq/proc: use seq_put_decimal_ull_width()
 for decimal values
To: David Wang <00107082@163.com>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Nov 20, 2024 at 3:08=E2=80=AFAM David Wang <00107082@163.com> wrote=
:
> At 2024-11-20 09:37:04, "David Wang" <00107082@163.com> wrote:
> >At 2024-11-20 03:55:30, "Geert Uytterhoeven" <geert@linux-m68k.org> wrot=
e:
> >>On Sat, 9 Nov 2024, David Wang wrote:
> >>> seq_printf() is costy, on a system with m interrupts and n CPUs, ther=
e
> >>> would be m*n decimal values yield via seq_printf() when reading
> >>> /proc/interrupts, the cost parsing format strings grows with number o=
f
> >>> CPU. Profiling on a x86 8-core system indicates seq_printf() takes ~4=
7%
> >>> samples of show_interrupts(), and replace seq_printf() with
> >>> seq_put_decimal_ull_width() could have near 30% performance gain.
> >>>
> >>> The improvement has pratical significance, considering many monitorin=
g
> >>> tools would read /proc/interrupts periodically.
> >>>
> >>> Signed-off-by: David Wang <00107082@163.com>
> >>
> >>Thanks for your patch, which is now commit f9ed1f7c2e26fcd1
> >>("genirq/proc: Use seq_put_decimal_ull_width() for decimal values")
> >>in irqchip/irq/core.
> >>
> >>This removes a space after the last CPU column, causing the values in
> >>this column to be concatenated to the values in the next column.
> >>
> >>E.g. on Koelsch (R-Car M-W), the output changes from:
> >>
> >>             CPU0       CPU1
> >>      27:       1871       2017 GIC-0  27 Level     arch_timer
> >>      29:        646          0 GIC-0 205 Level     e60b0000.i2c
> >>      30:          0          0 GIC-0 174 Level     ffca0000.timer
> >>      31:          0          0 GIC-0  36 Level     e6050000.gpio
> >>      32:          0          0 GIC-0  37 Level     e6051000.gpio
> >>      [...]
> >>
> >>to
> >>
> >>             CPU0       CPU1
> >>      27:       1966       1900GIC-0  27 Level     arch_timer
> >>      29:        580          0GIC-0 205 Level     e60b0000.i2c
> >>      30:          0          0GIC-0 174 Level     ffca0000.timer
> >>      31:          0          0GIC-0  36 Level     e6050000.gpio
> >>      32:          0          0GIC-0  37 Level     e6051000.gpio
> >>      [...]
> >>
> >>making the output hard to read, and probably breaking scripts that pars=
e
> >>its contents.
> >
> >Thanks for reporting this, I was considering the spaces and checked it o=
n my system,
> >I thought "all" descriptions have leading spaces and it's ok to remove t=
he extra one.
> >But I did not check all the "irq_print_chip" codes, now when
> >checking the code, there are many GPIO drivers' implementations with no =
leading spaces.
> >(The behavior is not consistent cross  driver implementations though...)
>
> Several drivers use dev_name as format string for seq_printf,  would this=
 raise security concerns?
>
>        drivers/gpio/gpio-xgs-iproc.c:   seq_printf(p, dev_name(chip->dev)=
);
>         drivers/gpio/gpio-mlxbf2.c:     seq_printf(p, dev_name(gs->dev));
>         drivers/gpio/gpio-omap.c:       seq_printf(p, dev_name(bank->dev)=
);
>         drivers/gpio/gpio-hlwd.c:       seq_printf(p, dev_name(hlwd->dev)=
);
>         drivers/gpio/gpio-aspeed.c:     seq_printf(p, dev_name(gpio->dev)=
);
>         drivers/gpio/gpio-pca953x.c:    seq_printf(p, dev_name(gc->parent=
));
>         drivers/gpio/gpio-tegra186.c:   seq_printf(p, dev_name(gc->parent=
));
>         drivers/gpio/gpio-tegra.c:      seq_printf(s, dev_name(chip->pare=
nt));
>         drivers/gpio/gpio-ep93xx.c:     seq_printf(p, dev_name(gc->parent=
));
>         drivers/gpio/gpio-aspeed-sgpio.c:       seq_printf(p, dev_name(gp=
io->dev));
>         drivers/gpio/gpio-pl061.c:      seq_printf(p, dev_name(gc->parent=
));
>         drivers/gpio/gpio-visconti.c:   seq_printf(p, dev_name(priv->dev)=
);

In theory, yes. But I guess it's hard to sneak a percent sign in these
device names.

But given the above, all of them should probably be updated to print
an initial space?

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


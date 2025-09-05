Return-Path: <linux-renesas-soc+bounces-21422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B12DB44ECB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 09:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0664117D395
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2DA2D249D;
	Fri,  5 Sep 2025 07:12:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A291B85F8;
	Fri,  5 Sep 2025 07:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757056347; cv=none; b=UnT5toJxGltZr6J+BSuvfE1tmuthw2Ui9Yivri3VH6f2sGvljHpppOjQP/9ctY5jvRD8soUY0xMLRyh0IwwoT3PguS5SxKQ1WmoNMxyxXFVtpgpjmOBcKilympQjtrYNtynss2rRw2s5YjMHMfdFnlzg8RNe/DjkieQwRmLY20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757056347; c=relaxed/simple;
	bh=0SPKyS2NdCo/kwVkUkhJNMd186ifgWtnmQVJO7cSles=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2GK2FCm8U5hjUCl4siZz4tDjRgCboDNXA/o3tuBQL9o0TjPpF3KYdt5I454Ice5qSxcYH8f66qmm8xUBvP/7gfdsc4Ep1/U3ZawzW8i03e+4kMw/H5Y9fd09ZeXdb8usiZ9sUajcsnmL6Niobp3yI78BfsNgKC3lAug/0KqID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5300b29615cso1304881137.0;
        Fri, 05 Sep 2025 00:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757056344; x=1757661144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fy7aFzwo8aiVtVpiFccy89wrWv0RXag55wY/aFFDl7w=;
        b=BQ/ptIxqVSKoSORDavZ4hhtmEBZ9DJO3PUR9VWIDZCB72ggw43tE82QzV3hyION8u4
         ZhLR5QeZdTsGzCj2OWxm0bLNRGDuf6oSLENgIbMGqrVYv+Lma+5a7P/6NezQF7XPDlB2
         /pRk5uslZYa5p5UBT4FjQl0h99RNBKjsECIAcL1ypnudurLByjhevfQQCJR7QMftxI70
         +WnCk2nEcydHx/s67worPy9RlPp+7S1cMUh0oF2aYuchmWpwoQtOOyBkkmOVWNiGgtpB
         yZsYcvXw302c3pxiKa6Eaa9dzFpf1qhYpzFoP2bvcrWXJPU9/5cHvIGMxh2D8hWAUl9J
         nOTA==
X-Forwarded-Encrypted: i=1; AJvYcCU/p3cBDsEHBfDKAnBxyBiujnV6//cleN1JLaq0jxZJa8rz4mkatroLb0iNH+ibauIh08l9gpytPJ8BfqbipbbvjQ==@vger.kernel.org, AJvYcCWMLlrDNnublK2dahZzpGRjChv2oqfdWUiIHZUhu/O8UqbrlFo+CFDTRYBztYG0X7vcf+bEw4Yh@vger.kernel.org, AJvYcCXKVPQhPifa8DjrqcHGugSSXKhRkUavM1CNBaDufQuf71iEdsW/s1eCFst1rKP3/fXQq+pqMGYcTN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVoGJTmQoa6QBeJgwP/RUEC675zFyYUxc5KDcD2tJdlEOvN5U
	7J0MVYhTxfCM9LT88HDyezojPZWGyCLgdLDy4Znk2RQONemO6dC6XxDvNS55PgYM
X-Gm-Gg: ASbGncsQGNcV/oQa6Z2ZYSh1VtaVawdoilYObOLRnx5j+aQvoCvdg9ksjmauCJCyK+F
	KswS15lHCtNES9kJzXvbWD9aKyEFBo9Bys2ZUtw8WZQUFD+bL+BA70MLw0CtB4bA6kPHXpkY90V
	xHaojOVJVVxEd47NvEZsjdnQ/MRP9rICm/z4CBSMA6R+f+aua+JAt9XdC7WR+GYEJUz9xHT+D59
	l1uK5JC3RZxwbhF0b3Jsvcj7YD2oGZ/kVMPX2JWxPLcvqzWf0AYKEh5mvXXbtZ4xgFgrmoOlNXs
	U41/JwIvjIkaXdxbUDRxkDVDiRr4YhS3KahyDo2O74LhWgkRfJ9EvrBk1rLd+5fefFq2SDsh/hB
	HctLCbEiB39VV0TMoiqizk4gxaESrJvU+Q+4WWaS2YgLFgp5HZ0/5wbEY9hZvgrrOj+oHkbRwOJ
	cscXaVyg==
X-Google-Smtp-Source: AGHT+IE/QfSTOzvtDZAMVKT1FUNOlogatCo67oik6jA4hyXjJxBSMEwUt2VmmOnSwe0JOfT0pA4zQg==
X-Received: by 2002:a05:6102:5cc2:b0:522:826e:7bfe with SMTP id ada2fe7eead31-52b19430092mr7754010137.5.1757056344645;
        Fri, 05 Sep 2025 00:12:24 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8960ab19f6csm5319352241.8.2025.09.05.00.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:12:24 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-53042807be7so1385831137.3;
        Fri, 05 Sep 2025 00:12:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUivQndrJGjpOZT+zrtTO8Z4fIi8gGnhu/cNhHlPZ7nCug57aAHZmZWKdbLeCqe3zz+gH3TDDQ0@vger.kernel.org, AJvYcCUji6LhjagEVkueewvluFTHGaKZZ3HGko/A1jufjuk4ZhpNSL1ML8+sgBP/xV2s4mSMC6o3fQ7CYoY=@vger.kernel.org, AJvYcCX8ADYU23D02AeZQrdZObVIykGneRp6v0+HCTCJWdC4joySnoRlI/elsCdh/0L2LS3H6BWqsqCrzo0HxwL/xFSz8A==@vger.kernel.org
X-Received: by 2002:a05:6102:4a96:b0:521:615:fc24 with SMTP id
 ada2fe7eead31-52b1b918601mr8277231137.26.1757056344096; Fri, 05 Sep 2025
 00:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756998732.git.geert+renesas@glider.be> <ee4def57eb68dd2c32969c678ea916d2233636ed.1756998732.git.geert+renesas@glider.be>
 <082d5554-7dae-4ff4-bbbe-853268865025@lunn.ch>
In-Reply-To: <082d5554-7dae-4ff4-bbbe-853268865025@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Sep 2025 09:12:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU96u41ESayKOa9Z+fy2EvLCbKSNg256N5XZMJMB+9W6A@mail.gmail.com>
X-Gm-Features: Ac12FXzoJ7CS8SZ1H0nixTnIHsWRKCLQwJJn4_9l2hKhyJ6tJrWpja58kgx-R7I
Message-ID: <CAMuHMdU96u41ESayKOa9Z+fy2EvLCbKSNg256N5XZMJMB+9W6A@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] sh_eth: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thanks for your comments!

On Thu, 4 Sept 2025 at 20:37, Andrew Lunn <andrew@lunn.ch> wrote:
> On Thu, Sep 04, 2025 at 05:18:57PM +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas SuperH Ethernet driver from an open-coded dev_pm_ops
> > structure to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets
> > us drop the checks for CONFIG_PM and CONFIG_PM_SLEEP without impacting
> > code size, while increasing build coverage.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/net/ethernet/renesas/sh_eth.c | 13 ++-----------
> >  1 file changed, 2 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> > index 0516db9dc946fcdb..f16a350736e1aa04 100644
> > --- a/drivers/net/ethernet/renesas/sh_eth.c
> > +++ b/drivers/net/ethernet/renesas/sh_eth.c
> > @@ -3443,8 +3443,6 @@ static void sh_eth_drv_remove(struct platform_device *pdev)
> >       free_netdev(ndev);
> >  }
> >
> > -#ifdef CONFIG_PM
> > -#ifdef CONFIG_PM_SLEEP
> >  static int sh_eth_wol_setup(struct net_device *ndev)
>
> Humm, sh_eth_wol_setup() went from conditional to always available.

Its sole caller is sh_eth_suspend().  If the compiler optimizes away
the latter, it should optimize away the former, too (verified with an
m68k allmodconfig build).

> Can WoL work without PM? Is the current get_wol() and set_wol()
> broken?
>
> Maybe you can take a look at this, do some testing?

You cannot enter system sleep without CONFIG_PM_SLEEP, so enabling
WoL would be pointless.

> It is however not strictly related to this patch, so:
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


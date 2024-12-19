Return-Path: <linux-renesas-soc+bounces-11564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE09F795C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 11:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64727165A09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 10:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F98221DB9;
	Thu, 19 Dec 2024 10:18:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAF54727;
	Thu, 19 Dec 2024 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603503; cv=none; b=c4nFFFJoImiV9RNnFozqaxvdP6d+Drk50fKIn7X5ayv5RiqSe6VpWxBE5DQarFn9/2s8Zh7vCiB8rJ5w7Kw5+HiAm6lob8JZiiGkGzOHnkIbfs5m+8yaMcAPLNMl8T2XbvWCdCYI8BOH4AGhtxx016hbgjMSIs9cslSbe0OtSjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603503; c=relaxed/simple;
	bh=rgtJTe0Gx1RWnBYkBZn7VX6aokSfkyEJO5P9yIF7rvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CP/YvYbiJ7JqdmgNAu44Q7wnw1xWWMJM+hjo24+bCoki/sV7e4WHX/I5Vjs0RzBIv+0+RuwUutiyjdfFZR2HoMxl2ONJCBWMh8rEQfCczMjJKzHvFIG6CHJkQycReJDI9uUMXIAhWpPOhgIvQE8HZATsBLWFxFElW52IWpg2xTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afdd15db60so139747137.1;
        Thu, 19 Dec 2024 02:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734603498; x=1735208298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PqbgKOQH5A5NDiI8YQAoEdcnZj+UHy3o9vys/k/Gqs=;
        b=tg5ksbUm0eH0wgbyH4SqoKtvFispmb1ihisMllvXgx1HLnqFfLiWQXb7o9ZCAxVlQH
         +yxF/kdXi3iBsyHQjVda8KyZmbmxysXn3VfiQ/1b1oFyU1zDNgSBpEq6Qi6ftOV4fbup
         cSZO1Wr5JoKPJA2HnjdpNOC5WeYeqUA52URw/+rVhOMZ4sTwEk21QnFzcBWyWbaBqNUs
         Uih3sodOVDOhLqe0TYNMsF/7bRqQOpos3PyCqIZhSPXNxQRH76gzKYW8GdTG8HK5qkw5
         fqKT3SNgalS2KwpNqt/a8eqXIx3vlKxCrpRrRiTkxbWSUVIC8EtkuMw5S0WHqcyZMA5X
         piQA==
X-Forwarded-Encrypted: i=1; AJvYcCWPGlsOoi8iEeE1pB5JRcDUbAQ3EPPjKF3o6p2RiKGba4Rm8Sqk1S9XBPoJ918J2cTu/3UM/jEsTGYEQJth@vger.kernel.org, AJvYcCWdKz6RZs6uaJy3MnRYrjrh7uEPT8crBTWlVL/z9/roCuO5/Oyijke7o1d0lIG2m6PJsIS15X8ev4wi8pSuTvUbUWg=@vger.kernel.org, AJvYcCXysMio25OyNfN4CSzpq8gQv+Mg1x1kfR8hvgC+RcRbiS8aViKJ1x5oFHh5VUjtWyVSvaQQKGsGGsFhlaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOsr5QNfxea6IwywvXG7FDT5ftTnbRLFt3grehsUr4b8MTW1bn
	1QH8BqiNpRHvB2oVO/CRr6K1datrjkcXdIuglXMM8TK+X3lyTJsSBnUmmYho
X-Gm-Gg: ASbGncuwQFW5BEgcK2gzOWVJh3beYS0JvE+cS2TqoM811fg4ZP4D/2aqMA9t8RNGQC8
	lxRniFHkjOdcts6OCcDmcu6GmO108vyb2xsvuuTCu32yXsf3964U7GM1XsJCHvr6+ditc3KLL7R
	bQXqLJNNdZhMQFUl6BQadCac8T07OCKZZQ8kIKVo4MsPkobp1+m53ReJo69e+I/uRlH1lTe5Zh1
	IqiFLLaC6fnpqK1OD0Y++84mLTceuKYyEKqQ6GQeA4FJ7lI0vEuTiioAYnKiklUf8dfE9JLn6SW
	Lt1CQFgcLmmCWq/qd8Y=
X-Google-Smtp-Source: AGHT+IHgtwIupddj1iDxhBRHHqqeDPSD/f0V4+D9jGi9uHJXODq3f3EIO2vhYGgV8csrhCJ+FSv22w==
X-Received: by 2002:a05:6102:3709:b0:4af:adf8:523f with SMTP id ada2fe7eead31-4b2ae72fd17mr6139801137.9.1734603498340;
        Thu, 19 Dec 2024 02:18:18 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac6dd23sm164135241.19.2024.12.19.02.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 02:18:18 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c5316f15cso163932241.1;
        Thu, 19 Dec 2024 02:18:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUE37T1mn8cw8DbPeIQUp5ll/h5zpZWkWgz90cA3NFGahfa4TpgoHG+5hBrAJO+xPkwKgGquZ1Bwz4iRCU=@vger.kernel.org, AJvYcCUT2DV2YDKN/V63iOx6+KI2gnHWg9fAd5uYWG3b2d3/hLQje8kRhzKriHGPfDArXqn4AhMNvSGawgGoDzw/l59jJt0=@vger.kernel.org, AJvYcCUmWH9OnOLB5rVX5LRW5+qPo8hjVxHVnYn68fEG8o7ofbGg7mXMsNOFzNL7hB+WdzHudIyuYwYQ1gA1d+zH@vger.kernel.org
X-Received: by 2002:a05:6102:2b8d:b0:4af:d487:45ef with SMTP id
 ada2fe7eead31-4b2ae70de4fmr5981814137.5.1734603497927; Thu, 19 Dec 2024
 02:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com> <20241204155806.3781200-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241204155806.3781200-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2024 11:18:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQ_kHd3qi3j4D4keyxbaKE5MS6ZzDwJBaNJ4b5skr1QA@mail.gmail.com>
Message-ID: <CAMuHMdWQ_kHd3qi3j4D4keyxbaKE5MS6ZzDwJBaNJ4b5skr1QA@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] serial: sh-sci: Move runtime PM enable to sci_probe_single()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, groeck@chromium.org, 
	mka@chromium.org, ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Dec 4, 2024 at 4:58=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Relocate the runtime PM enable operation to sci_probe_single(). This chan=
ge
> prepares the codebase for upcoming fixes.
>
> While at it, replace the existing logic with a direct call to
> devm_pm_runtime_enable() and remove sci_cleanup_single(). The
> devm_pm_runtime_enable() function automatically handles disabling runtime
> PM during driver removal.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -3440,7 +3434,6 @@ static int sci_probe_single(struct platform_device =
*dev,
>
>         ret =3D uart_add_one_port(&sci_uart_driver, &sciport->port);
>         if (ret) {
> -               sci_cleanup_single(sciport);
>                 return ret;
>         }

Next line is:

    return 0;

so please just merge that into

    return uart_add_one_port(&sci_uart_driver, &sciport->port);

Actually [PATCH 5/6] makes that change, but there is no reason not
to do that here.

For the logical changes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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


Return-Path: <linux-renesas-soc+bounces-22425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EAABA5C38
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Sep 2025 11:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA82322342
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Sep 2025 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756734A21;
	Sat, 27 Sep 2025 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMuB4BRP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF31EA7EC
	for <linux-renesas-soc@vger.kernel.org>; Sat, 27 Sep 2025 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758964855; cv=none; b=AjPAwZgr1iuSt8LaDT7C/pmjzzmem/SLpN3LAvZl3mW5cOs94C7xPQ5kEu2tKoAMJlz5WB2TcrfW5mYqT/7G/8Xd2WPFrnN/X1n9QOtpv5lqzBXt81r7zMeoHhhcbDrJcvdyDrqXI6LIFEyFuKnsfxWNoVLXzOMM4o4/TE/ztuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758964855; c=relaxed/simple;
	bh=/t3TZT7OJrjKJml8DIU0qxdIMBB5wu0/exPcKbnLXnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cS0yVDg1Js6YXeB2O/3nGuomZUrzbl4A2ltoVmBY7o9BS6/fZHhabgXJOlK1kS/AB2Y+j6ZS15kF/BqpCVPOKMXy6BmVnI0zFyscVezRbPsJ1dzbt2WeuHTimiUzFMSq/J5BLqnejLLCJ7H+lfbZAxc3mcdidHrJDffY7dhO8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMuB4BRP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso2374921f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 27 Sep 2025 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758964852; x=1759569652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K9Vn9bWAnI4BE155GCPvaTjF5XBKFWlh0xk9agIzlA=;
        b=WMuB4BRPUhBt+bNq/DGyqc7vLAb9bi2ccfL3AxOEX6D6TbqIfzp93BoervgD3hu4UC
         XpUR7IHdC1YlskIUJHQd1LtPpsMGLTB2DKwsdlpEhxX8CrVtiGIMX7hZ5KXyeZHOrf9l
         UKyYCSWrhjjDhowJYtOPO9osFRoyjB7kgHJViS45HgTho/8YkbXXMMVouIgoY2mSMP0A
         nU9QX/h7ylR6ll+ex8LUzslz3RFrzGHOAYDR/5hQA36EB+j/6FihbhAs21zWxORcSXXy
         xvA++U3WEuR0U7A9RaCEC4CxgJw0xlLd0BeJdcBqO+Cl214WRd5282hTS/TS6QTQaU0m
         6s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758964852; x=1759569652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+K9Vn9bWAnI4BE155GCPvaTjF5XBKFWlh0xk9agIzlA=;
        b=PjV4SZhDIeW4yTZWPV9ODiFMNvejMQpFeTPabGo4PekV66DR67qtsEsUYq7+vSqyud
         E4p7wFXD/MdQPrZxoOlpb3uEq5NEkrw873Y6aGF0XSshc3IbltuWVQWQHv8Ad4olSxqp
         +FaPD9X1qXbfc6W2jJJn2htNuu4l4t+4aASdc1tnzWA7sin4JC0MQ76RP+ayKFRdxsJJ
         XFfDZwKtCHDe5+s9mN4JR4It/m1HUazoU23/ElW4Xn6gUbMIUB2rDv3PiDZ2p2E+TJ2O
         ShjS6f5qEneq3V6ipnF4PtO9ivQ/YaAwgdG/ycqG2c2nI7FJ/GWU2BwwCgsnpLN5s8lD
         M+LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdtHFiQNmjFBoTqFl0rYq9zWmH7foY49E5vQUwlLwbDC/QG2kLNEChQ50tUt7bUjsLNKSOHzTiarpYD4saL2kayA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySo6l3gC232uF40ds1pFz8CJUBxmiUX5/16UYfQ/Yzo8Z0WybT
	bfhNUSTtkAXh1AbNxpLfN0iRZ01OrT2PoJD5u0aaJMxoUAxD0uls2fokTg6eeg/xMUjJS2w2vuq
	yMS66Ob9Xi1wkDlxb1YepVAhXeCH9HTU=
X-Gm-Gg: ASbGncuWubvVZVzwhdwBkMPISe2c/O82nFMT4zBCg18DVLZXQF7SUc2TF9YiEilqcWx
	QYvD+vBLjVe7LSnHElik7FIo/b5DDqLbGZ8Dd3mibRc30ZReKux9MjhPl6Px8eKmXktI4JSXOP/
	Ha6ZuUpSJJ5E19gNYKpg82m1JxrN4U1aj159FgHY/cmjn3lUfiXrgR+dflzzf1aHK6dG44+/fGg
	GWbQjCEc6LZMkh05rE=
X-Google-Smtp-Source: AGHT+IFrTxM9Q7PDjvaeqtIGpYhacKRy64PKIRSyugqmIbH/nwL4P9ZHMzWlj1q2unq+uw4xc3LL+ZZ5rcx2i+qxmE0=
X-Received: by 2002:a05:6000:420e:b0:3e8:f67:894f with SMTP id
 ffacd0b85a97d-40f65cb098emr8732361f8f.26.1758964851657; Sat, 27 Sep 2025
 02:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81260328acb5c78e915ab04afad3901a31c16128.1758793709.git.geert+renesas@glider.be>
In-Reply-To: <81260328acb5c78e915ab04afad3901a31c16128.1758793709.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 27 Sep 2025 10:20:25 +0100
X-Gm-Features: AS18NWBrfcgOBOZDAaeK8p6RbP_plvyufDtAafY_khBrZmmD6GFm9c13OLsUcRw
Message-ID: <CA+V-a8u-FEfB7WyDRtz_q5ZKKmZMRrNbv6uoBg234ggkVD1BGg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Use IS_ERR() for pointers that cannot be NULL
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 10:53=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The use of IS_ERR_OR_NULL() suggests that "clk" can be a NULL pointer.
> Hence smatch assumes so, and issues a "passing zero to 'PTR_ERR'"
> warning.
>
> At these checkpoints, "clk" always contains either a valid pointer, or
> an error pointer (none of the functions called return NULL pointers).
> Hence replace IS_ERR_OR_NULL() by IS_ERR().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202408032025.ve2JMaoV-lkp@intel.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-clk-for-v6.19.
>
>  drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
>  drivers/clk/renesas/rzg2l-cpg.c        | 2 +-
>  drivers/clk/renesas/rzv2h-cpg.c        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 7d661beb09a0810b..0289a35e4e6a0e59 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -451,7 +451,7 @@ static void __init cpg_mssr_register_core_clk(const s=
truct cpg_core_clk *core,
>                 break;
>         }
>
> -       if (IS_ERR_OR_NULL(clk))
> +       if (IS_ERR(clk))
>                 goto fail;
>
>         dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk)=
);
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c
> index 15b0b96373b03d16..2923961ec001079a 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1177,7 +1177,7 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_c=
lk *core,
>                 goto fail;
>         }
>
> -       if (IS_ERR_OR_NULL(clk))
> +       if (IS_ERR(clk))
>                 goto fail;
>
>         dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk)=
);
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index 0965f3d11213ed22..0509d1e338058f4e 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -591,7 +591,7 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk=
 *core,
>                 goto fail;
>         }
>
> -       if (IS_ERR_OR_NULL(clk))
> +       if (IS_ERR(clk))
>                 goto fail;
>
>         dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk)=
);
> --
> 2.43.0
>
>


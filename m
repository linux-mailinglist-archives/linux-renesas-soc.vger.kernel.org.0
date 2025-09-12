Return-Path: <linux-renesas-soc+bounces-21795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE1B545C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 10:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1D741CC3A91
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 08:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D2728BAA6;
	Fri, 12 Sep 2025 08:43:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C261BBBE5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757666639; cv=none; b=iBmLBn1xCkObloBYXDcYcaWlE53jN0VluekM600VjkwdPPoHfm6kPHYEpiQDVPmMGSHDl/5Ts1G86tqb1YMcArZ7zGhR15/9KopVzAXihEQMupFD1+/fCT0ltGx/j8V4A6tKqr8VO92G8s/QMfzqudwVu4h/3VM+1xLZe4q0F4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757666639; c=relaxed/simple;
	bh=y/jJz2ZusSDybe1iPBMjSqne5ow7NABIzFffczF3yyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYV3raOruDFgtoul6sMV8qEaDnBiGzJmitx+bw+6wqTusoA7vsdZUYt1/EVLfrd0EFkBNSZo/V0XBp/KIqAD4p+eVrEFJwJYmPxaGM5vTaBKNx41UsVPbgER23KDOwsfePiQ0adoKR3EALGNmtLKqZBVSuy+OdwUf0+dag7NszY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5449432a854so774741e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 01:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757666637; x=1758271437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Op91nehv57YfLzGMLGlCp7oEduF1D2i1sngnXjbKPUY=;
        b=W8W5Xu+d0txCyC/jxWPailYra/dwEM+ajYjDjryhl3v70P+VRfAgZxARaln1fTE976
         NS01KdCaBdBCISwIvJWP+SFQ/GMgc0a3oyhbq3LUmz0OAieMD9owD+3LToa21uqsjE6W
         oaLYWniB0pzSlI1OtMBs9zyeWVapZV6z1pcw8NyIpr29636Q0gQicqL/DiXnUwNJQIai
         dnYqGgx37TPviN5uBwcj8KlKAv8hFwkUQ5Jxd1u/0Ckxh6YYsx398B0vhYN9FuLQa6ht
         B0flydDs0M1LQx3lpQNtOf3+GAMAbQLz1noALQ/g84rLgsUPY3zMxgjN2aU/rwVGdrkc
         Spmw==
X-Forwarded-Encrypted: i=1; AJvYcCWtq8dcCv9qw6sJXbIaufafcHzasrUvKY7ubkQoyO6VlTQfvRV0T/BlsDHWMeYUL+GsU1INpTz21NwZpOSRrEOHFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbQSfR2DVNBIvIh4ff/qtLhViWaz6k7k2PPyG96K5nrAMzAe5z
	SCxIM3RFmO8z11jty30VeYcWG/TAd8GGXW0zp7lfr4uC0Vs9QJwp9Ry0w9Js2sTr
X-Gm-Gg: ASbGnctuimJfwSvyp702A5NYI9As62KlGTtXEN8kWPNOABb26LFF5b2vi7geKkDoJDc
	4pxJX+3Du+AKusRM/zc8bogh80pcYi3V1hIBAQzsWI/IFsFtNHaAymwfkqXw/Kazmt8iWVQCZer
	IjECYJvu4PstfKSja7BsqorcBHP3I7bx9xVg7DNtQyaR5isOSTHsAUxMo+IpMg0wpXaqIYIsBc+
	8FW6abKHrEzTKPTgJXXsiL+QGiAc6zC/8D1n6Q8KGn+V0i65abb1IwHJZ3gCysjoQYTruHxnvCg
	Tjqth6F3/Pn4ZwDmQEp5dnOlrwjVcQcuQtbxRs5nXn0Fr0G0WB/bmWU9pAmHqI6uT9c0d3w+CDu
	jUwYG39ygn4D1piB/B6780SItAqDgysB3ccqR1I/4iwiHCuStnSiMDanwoR4z/eZg2UXC8Io=
X-Google-Smtp-Source: AGHT+IFp0mxcBf05zGyZmItTiOnACC7sm65p5ZpR3seK8rP0ZrfKx1nNEFyl3UkJg86sKAwkoEpTgQ==
X-Received: by 2002:a05:6102:5cc6:b0:523:f1b1:87b with SMTP id ada2fe7eead31-5560fd2d8camr855325137.26.1757666636731;
        Fri, 12 Sep 2025 01:43:56 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-553677f3b3esm852183137.0.2025.09.12.01.43.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:43:56 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5330fdb9723so726256137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 01:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnwwhM5Yu7ldAkRqybxbL0EPLSg/ZlV6zdQDJg9+3Sx8QfUuZUZPsW4EK6EEbwr+nJmAAt/FWZouHlf2QRhEI8Qg==@vger.kernel.org
X-Received: by 2002:a05:6102:f07:b0:522:a762:8e5d with SMTP id
 ada2fe7eead31-5560a011ca5mr932894137.13.1757666636265; Fri, 12 Sep 2025
 01:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1755855779.git.geert+renesas@glider.be> <f9198ea3be46f1eb2e27d046e51293df7fb67f46.1755855779.git.geert+renesas@glider.be>
 <TY3PR01MB1134652A3383410EB50783E3A8608A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134652A3383410EB50783E3A8608A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Sep 2025 10:43:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrqqJEM4VWt5KzjPGkTHL4w5Sx9x1gC-yoRW2jEArMiw@mail.gmail.com>
X-Gm-Features: AS18NWCEc9rh7mbV7HZ3dF7nCk5pwoJB5ewSjxEXrkXmJ5-xyFDYhnGln5x6xVo
Message-ID: <CAMuHMdUrqqJEM4VWt5KzjPGkTHL4w5Sx9x1gC-yoRW2jEArMiw@mail.gmail.com>
Subject: Re: [PATCH/RFC 6/6] can: rcar_canfd: Add suspend/resume support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 12 Sept 2025 at 09:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> With adaption to RZ/G3E for ram_clk [1]

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -1983,10 +1984,18 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
>                 goto fail_reset2;
>         }
>
> +       /* Enable RAM clock */
> +       err = clk_prepare_enable(gpriv->clk_ram);
> +       if (err) {
> +               dev_err(dev,
> +                       "failed to enable ram clock, error %d\n", err);
> +               goto fail_clk;
> +       }
> +
>         err = rcar_canfd_reset_controller(gpriv);
>         if (err) {
>                 dev_err(dev, "reset controller failed: %pe\n", ERR_PTR(err));
> -               goto fail_clk;
> +               goto fail_ram_clk;
>         }
>
>         /* Controller in Global reset & Channel reset mode */
> @@ -2026,6 +2035,8 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
>         rcar_canfd_disable_global_interrupts(gpriv);
>  fail_clk:
>         clk_disable_unprepare(gpriv->clkp);
> +fail_ram_clk:
> +       clk_disable_unprepare(gpriv->clk_ram);

Should be inserted above fail_clk.

>  fail_reset2:
>         reset_control_assert(gpriv->rstc2);
>  fail_reset1:
> @@ -2045,6 +2056,7 @@ static void rcar_canfd_global_deinit(struct rcar_canfd_global *gpriv, bool full)
>         }
>
>         clk_disable_unprepare(gpriv->clkp);
> +       clk_disable_unprepare(gpriv->clk_ram);

Wrong order.

>         reset_control_assert(gpriv->rstc2);
>         reset_control_assert(gpriv->rstc1);
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-22869-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ABDBCBFB3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 09:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D29E6353FE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 07:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D08A2749F2;
	Fri, 10 Oct 2025 07:51:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB5D24DD13
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082695; cv=none; b=i0zDsXFbCO0oDlvTZ3EyMMOCRmpYPoYvbkQaIJHfPtt2gLvwmmSkDb8WDNcW3twWiRGxStpmlLbDh1DymuxQKXLxMCyOD7tTH1A2Tm+G/JKnO0sLFsvjXkCBleu4u7fmPrkYd6BQ1sGTpr1XrjWiqa00ndjS43Y8mNwnWqx8oCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082695; c=relaxed/simple;
	bh=tt49xrXtVpFHvrmaE8g0BGY+WJGnGApCCdck7Gjl4Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSH4KGRT3gr7Jb2w5yYEM99PSRPK5/pDn6RcBm9LmHniIiWYUPUpZ/2aidtaxZ/pm2ALyRsGpcEJb+IWZfyLMD05MTljLcRz4b/S8l5NDbLiL/47Q+Hvc3j1P8YN5XV+7zPb0Hd6XlNvUraS7jv17BX403RDW787fyxW/TG/6zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so1426341137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760082693; x=1760687493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tf1CQi/sgE81q0/fyoZiILag+XYr+CL6lgyll+N0TY=;
        b=JjqqujqPE07TZLcV8/2FpMNnqXPtxIuDssw/wjbLd8LACdNTJBETSYSmv+BWn8LHli
         zsWh8NVRoI71YH2PkYL63223GlY8YThKNw6YFeIktJ5MeR+uZH65b0s3fRHDvZASJXGJ
         36u3VQcy/VV5y7gUHYJ/9Mr31BMN2pYP5VizEPDE/R/k0paQ8cFxCc0VcQoGFP+YkKlR
         7SdEgXU1CTm5BHNyyzQAlwPY46RfuRqdv3c8u2y9eqUG90sI3a9f/3/esxFp2MDG0Yb9
         r6eMZZiT6h+W0479DSzc8Hk/ypU6fsqkwG6qGpiJxMFLN+evSG1pE9VMoV+HvyNXVXw3
         iXNA==
X-Forwarded-Encrypted: i=1; AJvYcCWDaHXeyLGw2czZeQ740+HvPBwj2vfxGuTE7BwllRw2Y6bPJ0Hrd8gzVQcELJgv8iuY3j9oAwx14PUS7MftGb4Z8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeqi3H7Il3kAyfBzaaOZzkF4RYJO8VAwrBs6dnoAU2oQ+3T4MV
	lH3wynsqVPsZ6xEXjil+G4XzIXKX5jL12vubyx8FUhhufLOycAdNntG/RaQBaFTo
X-Gm-Gg: ASbGncuUro6jMux+jBJkDsjUBLbT32aCmEKmqFPK/C0bQtcK767qClFfjhLHmuvmXF4
	bP+KHMcYS5iY7Uq0ujfYH6UbVzJ81o65OQYqYLWbxJ6r6F8kiDW9+vhQ5+EmAcd/x5QgNz2ciW/
	Akcmn9cgH7UuuprRz8igLnwQUKX99i4oJw8pqGN6rF04pxN6ntsye3g8tvkYCh/As2QFzCQLM+N
	aOHxKLNQuc20rttZ01r4Wl5Jagjih/wLPLd+1UWa2SMO8EIPzTbqnXVdPcwW6D083W6M3hC2nqv
	gXsSyYMp8Gc56gP+aVTtONrv1vCH+ZWus0uZbcpQg0SFPyWNINDt7t3q0GsZ9HXwOkWZ9Csp690
	Q9hTmmHUtPUu14peg4WtF/NHP1gB/Daez7iHZMwg5L5fFRhQKY7adfOaJbPD44sMZCO1A83cdko
	RkeAE=
X-Google-Smtp-Source: AGHT+IEusyjiLujePnvMv25H566XOfOnG7LrSYKcE0kTbKE64JbsLxmSPgPpNc5AA+exxasRyd+sEA==
X-Received: by 2002:a05:6102:3eca:b0:523:d0d7:b960 with SMTP id ada2fe7eead31-5d5e236156cmr4598976137.29.1760082692644;
        Fri, 10 Oct 2025 00:51:32 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf7ae894sm529986241.18.2025.10.10.00.51.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 00:51:32 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5a0d17db499so1635947137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Oct 2025 00:51:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZ2C1T4i+iNBcKYYb97h2IkjkDn3pAvUO9UVnjAAmPFhu5aXy/d5hx939mnTPmS3YvPQIqhMN5fZZdDmI4ia7ycQ==@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:59c:5e29:dd8d with SMTP id
 ada2fe7eead31-5d5e2357eadmr5268262137.28.1760082692002; Fri, 10 Oct 2025
 00:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com> <20251008042526.3312597-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251008042526.3312597-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Oct 2025 09:51:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW__Nw=oViQSPUb6zKbwRjXC7+6kUevHi1GzTTxrHxKkg@mail.gmail.com>
X-Gm-Features: AS18NWB-cVB-iwvWk7EDZu1kqM52AbtETFWL0OEi3TyJ5GDM7sXgbpoJi74-NbE
Message-ID: <CAMuHMdW__Nw=oViQSPUb6zKbwRjXC7+6kUevHi1GzTTxrHxKkg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: renesas_sdhi: Deassert the reset signal on probe
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, ulf.hansson@linaro.org, 
	p.zabel@pengutronix.de, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 10 Oct 2025 at 07:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Deassert the reset signal of the SDHI controller during probe to avoid
> relying on the previous bootloaders. Without deasserting the reset signal,
> the SDHI controller will not function.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1103,7 +1103,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (IS_ERR(priv->clk_cd))
>                 return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk_cd), "cannot get cd clock");
>
> -       priv->rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +       priv->rstc = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL);

Note that this has the side effect of asserting reset again on probe
failure or unbind.  Also on SoCs that boot with reset already deasserted
(e.g. R-Car).  I don't know if that would be a problem.

>         if (IS_ERR(priv->rstc))
>                 return PTR_ERR(priv->rstc);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


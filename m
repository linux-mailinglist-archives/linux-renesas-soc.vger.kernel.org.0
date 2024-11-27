Return-Path: <linux-renesas-soc+bounces-10737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 558389DAA1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 15:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B22D2824BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 14:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8751FCFEC;
	Wed, 27 Nov 2024 14:48:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FBF1DFD1;
	Wed, 27 Nov 2024 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732718927; cv=none; b=gLxakX8tMpm5vJh0EaNMfdE0grIKcaGS0S1lmsCYRFKE4gCh9d2138CQvEVN1VRNpm25S88IJ0vOTtEkajXJxxh9s0IwC/1ZHh0jdoH60ieDo9bGcj2c26cBY4dQKbWXKa7GA3QPbAP1eHa553q/oFjCq8s36XnSdoaFFbnEQYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732718927; c=relaxed/simple;
	bh=uv9gi5K2udyOY+gnkMFC54S1hyXaWOdi0CE7kSr0vQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjZgMQP0UoSr6j/hS4QbjexwtcSskuv1PW18SuAP0RzwjS7kiht3edoB/G7y7l9Lix/FeGlGrna1WFEJCWg913fvRRvrZncIg8muuzKGilLHxT2vWzkSESCMrvPEo7Cs2ebIdNWHK7bx2IFS0Lw2njJ1tE6PUskmh13veOGBqjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71d4c462ab1so1523454a34.0;
        Wed, 27 Nov 2024 06:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718925; x=1733323725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GshtkU0YrM2h6xqH7al70LL9TIOM+spMMwxpgis0eA=;
        b=AxYvX/Xp2LRAVNlOT33hJpB9Ve3a7lVyy5cBZmT6QqTCjG2WPsubGZBO/3wY73Ee/o
         LABQQQvKeIM2kgcWSXGbyTaat8tFSa8PTMSYjphqu1I1AKbTCaPnAu5XCSuDmp+ewNAb
         q+NK0YJUzlGojAAXKZuvuMCWAol5PiVsrO0nguz/TRtLZNvTYyuRRgEGOsTdRrwN99TH
         rW4yVmuAQhAn9y4BKP3o7CzXsdFVvtzI/zxFv5A62/6Ud1wXF/tyTXcbe/BcJrtn0yX0
         Xd2/4FruOK0T0sv9e8nVTbtBYmGVhlciB+pG+5IwEry9Qs//mCj1JJpsEPyJe70ANSXQ
         4uhg==
X-Forwarded-Encrypted: i=1; AJvYcCUETmOPhTKUvfju7+6MatHzoEDABgj7UOCpwRdpm4ajy7GT0bHoaJjw49kaE5qee5mJzyDQa5f1K8hHmWTR@vger.kernel.org, AJvYcCUGgNh5oUaxXjbC1HZNRgDYZBtD9aGflAPnqOLNFuYJe/jB8Se5Ohn1IQZrQ9kWvEdP7LGqHMIwGxCM+KL/@vger.kernel.org, AJvYcCVv5ylfw/A54zKZV31ctlUD353VjCSfK5bAAqCyMeZBHBb607b79dEMWIgQzZuG8mVhxekl13JF5O6L@vger.kernel.org, AJvYcCX1JgRpg9qTYSK/fq2fj6e3r3SSS0vMhYvwEjhIZNVkS0/dfzZ5Gy205XIgsd19uzcpvRFNSNZbpafV@vger.kernel.org, AJvYcCXb9j/7DaK1LogAMtWh3RQTmrgxh6AXV7U5kW0T891q58zHhlRuiKwTcXzs3eqFgFSwm0a+TZf/dRUe7RUFgbMpW+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6xZ3hZNvf7ZjUbtKPugoDsJGHRYj9AvhEYSojbrxFKKRP2ims
	hhwheswv8y/O8n6VKWHW56IzMLDyeUWmvwY6pSyKY91iezW79hXAf2JKstxDo3g=
X-Gm-Gg: ASbGnctiOXe9jY8eH1h9eJLBgFniwgjKIy6PoHU3vfwd2YnlaX8/7b/YBoXJlsFJ+3p
	j8CdxSbybPl89BP/NAi8nUj58QXI9dPDaCeBsVEZItNHO8MGTGeKfk3bt8rYoBSxYme4b7sdKeE
	zXXgRniGsH1WuFP7GFGIGlFmPIPbo8q/e7GRnMDCACdqx+IQy5XQnf1Dx/99hJnWigNE5lsAbs7
	5zF2XJOodQo1ij6pp7SqYWUUjribT/nAdgL/AiFPrGXURMPCUKOjWao7sTTkQflNY2PJYjAgwxt
	ioYQneqs42Su
X-Google-Smtp-Source: AGHT+IHl7GWJsOmKi9JTX5tfvoD84LU31MSquH3cM9Qn3lJUgqkekRNRF8KGoHcP5w8wFKwQrCGi1Q==
X-Received: by 2002:a05:6830:730a:b0:71d:596d:7deb with SMTP id 46e09a7af769-71d65c740b7mr3681838a34.3.1732718924983;
        Wed, 27 Nov 2024 06:48:44 -0800 (PST)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71d524e70d1sm1878647a34.22.2024.11.27.06.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 06:48:44 -0800 (PST)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f1d1fdb328so1711714eaf.3;
        Wed, 27 Nov 2024 06:48:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3+R7CVOYSQxcQlpNN4XnUAqcdIMtzJjGqEfs1FTX1RxWmd5h0gLpX8I26q3rw/dMjq2Xi5sJiwD+udvDd@vger.kernel.org, AJvYcCUJs0WV3w76pMiSFYFNN+ad3KR2o//h+NKM55t8iBprQIznZjliu+M81bYk4vN6e1oJeToHZp4oLopcr6WZ@vger.kernel.org, AJvYcCWBPD6XMIwagm0YPVUK0ddTsVAYWWHHgB88gxQifxaEnyynugnvFi7bCdWFcUG52lebOyM8/amEqHWK@vger.kernel.org, AJvYcCWv28Hv06ayGUAOGWAgqSl56Kwu6/dcRGp3IGZkGz/C6a9DZUyjk0djW7I7Nnxd8jDRLbm4x8v5WrFG+CGMo1hE0ak=@vger.kernel.org, AJvYcCXz7oEJKjXnEfaO4f+kJnGfUH/v3DIGRg2sLaSP65tc4Sif3f8eISeZxckiG0pwd8DFsyezMB1QpyBA@vger.kernel.org
X-Received: by 2002:a05:6358:5295:b0:1ca:961d:ca10 with SMTP id
 e5c5f4694b2df-1cab1688a38mr202812555d.21.1732718924133; Wed, 27 Nov 2024
 06:48:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com> <20241115134401.3893008-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241115134401.3893008-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 15:48:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUQd6AJe4b7hM_vqfW=NbVmv=zF9yr4bNBjJx05OXnEAA@mail.gmail.com>
Message-ID: <CAMuHMdUQd6AJe4b7hM_vqfW=NbVmv=zF9yr4bNBjJx05OXnEAA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] clk: renesas: r9a08g045: Add clock, reset and
 power domain for the remaining SCIFs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, p.zabel@pengutronix.de, 
	lethal@linux-sh.org, g.liakhovetski@gmx.de, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 2:56=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC has 6 SCIF interfaces. SCIF0 is used as debug
> console and is already enabled. Add the clock, reset and power domain
> support for the remaining ones.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.14.

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


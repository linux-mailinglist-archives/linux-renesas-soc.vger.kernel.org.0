Return-Path: <linux-renesas-soc+bounces-23862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AFFC1B8F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B1C643678
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292AD32ED51;
	Wed, 29 Oct 2025 14:39:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723FE350D47
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748789; cv=none; b=eGevdUJk7EyniedtBn0/TQm5AMb2BMD6EaBnJM+inJ26x5/ZdcqDjEzBdQ5hahDm2uqzIp3T/5GuU8UgDJDQ/KkGnbFk0kqOsYOFudJI79JTmIgbPEKrr2QQr+P8NfndnwuyNAX7SKfk18ZOyY95N7gP9M8iEpV+ycnEiUsDFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748789; c=relaxed/simple;
	bh=FbqavNtq8VJC+dwAXLJIaCG9l+pt4WVO7NOuPi3OYaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUQsOJGY0T6eS7+X55RCnvgv4VV2hah6L/pJwPfwzVuD4PMPaR9V8P/aa2g7NCDd9lPY7cbU0L510f/6bTBS84YmmUx/HCtuHdRwQ26UmC0NJS1tH2V0oNHacDpVAvPfPUTIBCCis+hyvlaVMCFea/rxdvOL7cDX1hi+XmUsmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87dfba1b278so77453006d6.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748786; x=1762353586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNDkhDDabcFgtYSzLRibzijDMaquJ035sDb5A+sIiAE=;
        b=gDrWQDJ/Iu8N6g0cBD0Y5DV9NJq0ZmkuA08/Jixqi4wD2YotlutJH9XBAySze6WdY8
         d2jqchS13b1Sv0+kul6s01nQQXYZli7776dJA4xkVoOhB+cRV4CZDqJK/5KjeJQPi5OK
         D+wm4wospdGjskjhGAaXFkAi6taTubEk4Y58gJRLau1jj0iB5SbMKqjxCu/uwIqMtij6
         rB4TlA5RniVbIzASMLE+0kas+wH9WlHtw9DNDbhX/dD6sFh42LLuxtkGphB8qkGrcibG
         oFr/iQCQgUMGWxKhVArvtfc4fIYbXwgOP8plZVJOR2jGc7RzO7MrClhzytdL17L6kll2
         /MVg==
X-Forwarded-Encrypted: i=1; AJvYcCUAy0GyD0JimPskAG3iGzEfR92eQU1CrCQsCsnrNjZlmeQNwx0WcoEUDBfgj6Tg8YGxE0hqLBRMyL/hOE4dTroeRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP1Dp0OisP+vK90us2SdVrQFzjRHn5bhV68bZDr1ffWovJVS1r
	4yqqB4r1uiD6FqJAudG5maFr9YkcgYTSBt3AFryofZzj6mpjHz4FQNc6Vz0hnd55
X-Gm-Gg: ASbGnct9NwPxfhlOhQnnHS4/e3/TmIpDspwqnZOs73djS/Y0BJ6niX5/ctt2G5Gpmg+
	ZbstqIUiWE9dkBTPofz32r6/cTZIXf3w3d0afGM/Y0lQXwM6sB9oYB4kxJTHs/5M/DgOzBEDfYk
	c34Asvts4kF4v7U0wF9eLdVvxWtWQIKGafuCNraoV954jlrphsL8pghBvOK0MIyRoH2miH/g2cV
	hiuPBKMc4VlODt7TcYXzIG35PwsxiFgZ82WCojKsBw8BrnkUrj1wVHq80QGvu2nSd/6ONi3vb+i
	uQy8DgRMWIp3A3R23wGuAZSxz828XLtcCEsqb9J02rlAr9w6NUf+DsU6BYIGHv7omMdqIIS4i+o
	bHgt+Qmaggo/3q6IcTFBYaj88XU2XIgSpiNMmNucRkMPjlcM9bO5y8ktw7BdOtb8pC4D9agu6Sc
	IsB0H7QFDoi1uHS9M7XWgJf3hT5Fv3BEvKjX7azh8iraZDC/DiIja/1zCJjyApLKcncRc=
X-Google-Smtp-Source: AGHT+IH+ezEORnHWP1phdgztmGohBXG99Z82LlwxFsnHqzrZ7oon8IMR4LlOm1udbUhroqJ4NsKODA==
X-Received: by 2002:a05:6214:c85:b0:7d6:c615:ecd1 with SMTP id 6a1803df08f44-88009c12eaemr37210326d6.61.1761748786207;
        Wed, 29 Oct 2025 07:39:46 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48f64aasm101396306d6.27.2025.10.29.07.39.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:39:46 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-89ead335934so538785285a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:39:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZxtPUIWEsi4V0f9hsECNzOjy9/RdbO7cr/JHW7tzQLf0whFMvc9kpS/hd6spltYUjWF1jjXu4cYnRHRRaUj6Fww==@vger.kernel.org
X-Received: by 2002:a05:6102:26d3:b0:5d6:156f:fedb with SMTP id
 ada2fe7eead31-5db90694687mr933346137.36.1761748440676; Wed, 29 Oct 2025
 07:34:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761588465.git.geert+renesas@glider.be> <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com> <aQIlB8KLhVuSqQvt@yury>
In-Reply-To: <aQIlB8KLhVuSqQvt@yury>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:33:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
X-Gm-Features: AWmQ_blqiXGJheNiHtKi_cJSwq0gfFP8sAonrx_tsjN_f5pUMr0aiWqvAOsiPck
Message-ID: <CAMuHMdUTR2VnQ++j_ccUN3-GzKmSzS3H3QNyYqZNacfOBXD50Q@mail.gmail.com>
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
To: Yury Norov <yury.norov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>, 
	David Laight <david.laight.linux@gmail.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Kim Seer Paller <kimseer.paller@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jianping Shen <Jianping.Shen@de.bosch.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org, qat-linux@intel.com, 
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yury,

On Wed, 29 Oct 2025 at 15:30, Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Oct 29, 2025 at 03:19:45PM +0100, Linus Walleij wrote:
> > On Mon, Oct 27, 2025 at 7:43=E2=80=AFPM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Prepare for the advent of globally available common field_get() and
> > > field_prep() macros by undefining the symbols before defining local
> > > variants.  This prevents redefinition warnings from the C preprocesso=
r
> > > when introducing the common macros later.
> > >
> > > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Do you want me to just merge this patch to the pinctrl tree or do
> > you have other plans?
>
> There's a couple nits from Andy, and also a clang W=3D1 warning to
> address. So I think, v6 is needed.

Indeed....

> But overlall, the series is OK, and I'd like to take it in bitmaps
> branch as it's more related to bits rather than a particular
> subsystem.

OK, fine for me (if I can still get an immutable branch ;-)

Note that as of today there are two more to fix in next:
commit d21b4338159ff7d7 ("mtd: rawnand: sunxi: introduce ecc_mode_mask
in sunxi_nfc_caps") in next-20251029
commit 6fc2619af1eb6f59 ("mtd: rawnand: sunxi: rework pattern found
registers") in next-20251029

Thanks!

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


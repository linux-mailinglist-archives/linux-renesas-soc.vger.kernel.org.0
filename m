Return-Path: <linux-renesas-soc+bounces-28043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8WmzBjKXiWl1/QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 09:13:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF710CCE7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 09:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2FD3300421B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 08:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502AB245019;
	Mon,  9 Feb 2026 08:11:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051D81732
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770624704; cv=none; b=dFOxKiHWq5XP94EJodQ/H9ZbqkTvFDVK7H1NIvFzjEwVkIGiAZWWL2pO01ahUkPdhyzfwEfEM7ZpLtKghkNuTRkqQS5dWuQHPOlzgA3WDInGeysoN3RT+b3G4jX+6xtgL37X3IpRaxmIH2zkv0qnCjYzOqV3lN27QE73QUqzqi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770624704; c=relaxed/simple;
	bh=jGnKFIqAqLu+rNpANBkHFw8kJ3LdtX3G4oazBBlCuPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uncCMvirGbPq+07sOOaobXakRnv1edP37OvOPv9kpNkTxrOoq99nBM9fzgCab7/m0nB+3UBQXe7gpuFUg6/5FU0g/qkxq6TzycFI+zSdXMZewS08yAFG+Sae0ztEe92uTU1ijEciGAIx3piki39n1nFPlkOjQ1RZrMIGLUUgwjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c5386f1c9fso390868385a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 00:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770624703; x=1771229503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9pK4QYIZutXAE3AMWeCiy3lF4Ku+2UbgC78kdie5tY=;
        b=LGCBavc4yEs74lJ72iXz9rTxQWzSukvEUxifSmdysnA5q+7RtnnsSXCf7QRmXhIucG
         B+UX9Ku19bfF13GcxJ+KcdxK9y+nSmxy/c10ZhbA8jCuVWXND4rzPmFHPpm+XkuUwA4p
         15htdfV0+JKi55EF7/IA3MYAKBlyX/6m4ejczRoOMPgHAHSOG4JGC4+3ohdXMCNuXtF9
         +03GXMTjge+hQ0mzCSjtYPGVRboWibn5ZM37iBfKRtqxjsv+zX0hei3X/gNEyxGecyy4
         4sSYnqwpy9/xZKsaY+a/wkI81qVuIKFN73Auc2Ngtzz5AH3yrjkgW/5Vgf0Zax8B1fY4
         kYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBIyBQKPmxaBnHmZ4UBR+dFM5z6Rr3D4S1Irzf3cSIzEJhe4c9uOIxrygXc7oGJ0vIg5vl1qgrhVZAxvZupfAimQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB7Pwr6HUJpHLmq3skZOandxMXOAbUHvZYZi/7gEBukFPhuryM
	C30+6/a++H5/omFOMnH2fy38XgwzwaFtrRSnIAuQrMabv01rkci7VQAEzsqSwfwd
X-Gm-Gg: AZuq6aJh3xBGUlmNGLHPF0r8P+wK7NR1KZgZYi7k0sVpCcT+X84io4wGfcUViq/iT7O
	ULACBqP74UAHf+NvA0S5xCo5XA8RItu2Cwn8WwiEh76J7icKogrc8UI0pB9MgyWNWM7Bem0Z2KO
	tUAJAw2QYm3TXo4vnzgbKl2FWreEZH46SGeWVhe8kiZycWta+U9GN+U3awh8vuTacsTMQj1tUD9
	frxbB5+P9NGwQ/Mrwh+EjNm0TXu9igHxzePomllm3VSCdB9PWUtSE0+elT62RsdLkfclM8WlSUu
	3K5SqZf7aMRju9ijVX0lbXQ0gCys8t/E2JewxxMBncYCV6covUkO/EHd5fXAgNVBz5R0aI6EcuQ
	+E8NtKco322L1JXKR8w25tWmlQTQF5diQLhV+7TI5ba6eAOc9cEwqfOornR3obQqbV6QWt1od9a
	Bjr0/fXzrPfMNQPOxWCJSMZX56Re2aRL/HasVVQ8x3PBZ42BoQom36
X-Received: by 2002:a05:620a:bc5:b0:8bb:26db:e22f with SMTP id af79cd13be357-8caef7e1ca2mr1276190385a.30.1770624703165;
        Mon, 09 Feb 2026 00:11:43 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953bf3814csm71612016d6.2.2026.02.09.00.11.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:11:42 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8c70ab3b5fcso382115685a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 00:11:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVStJCuYDJ/UKLXgl+OD0SvnM2wqN25zQdzEPaQX1GxA9dodFNNkfwJEbGTjRNLUt8lAnNPiLtMIpHN9UpTcB+V+w==@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5f8:e2d3:c463 with SMTP id
 ada2fe7eead31-5fae8a3b31bmr2934943137.3.1770624379360; Mon, 09 Feb 2026
 00:06:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-rz-sdio-mux-v8-0-024ea405863e@solid-run.com>
 <20260203-rz-sdio-mux-v8-3-024ea405863e@solid-run.com> <b7dcb374-b79c-4e9f-ac30-2f507127cfb3@solid-run.com>
In-Reply-To: <b7dcb374-b79c-4e9f-ac30-2f507127cfb3@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Feb 2026 09:06:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU01vwif4H6H-cYUfW0Y56fN6Anp9F4Ru7q3fveNqqoXA@mail.gmail.com>
X-Gm-Features: AZwV_QiiqRuDaFts73-z5beOOIXm-WRqeTDAQV4zcAAegTI5YGKcuRUZfqXMUrE
Message-ID: <CAMuHMdU01vwif4H6H-cYUfW0Y56fN6Anp9F4Ru7q3fveNqqoXA@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] mux: add help text for MULTIPLEXER config option
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-28043-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.926];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,solid-run.com:email]
X-Rspamd-Queue-Id: 3BBF710CCE7
X-Rspamd-Action: no action

Hi Josua,

On Sun, 8 Feb 2026 at 16:16, Josua Mayer <josua@solid-run.com> wrote:
> On 03/02/2026 15:01, Josua Mayer wrote:
> > Add prompt and help text for CONFIG_MULTIPLEXER to allow enabling this
> > option thorugh the kernel configuration without explicit "select" drive=
r
> > dependencies.
> >
> > Select it by default when COMPILE_TEST is set for better coverage.
> >
> > Signed-off-by: Josua Mayer <josua@solid-run.com>
> > ---
> >   drivers/mux/Kconfig | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> > index c68132e38138..e31c46820bdf 100644
> > --- a/drivers/mux/Kconfig
> > +++ b/drivers/mux/Kconfig
> > @@ -4,7 +4,13 @@
> >   #
> >
> >   config MULTIPLEXER
> > -     tristate
> > +     tristate "Generic Multiplexer Support" if COMPILE_TEST
>
> This didn't do what I thought it would.
> It was my intention to allow enabling this through menuconfig / .config.
>
> With the syntax above menuconfig shows:
>
> =E2=94=82 Symbol: MULTIPLEXER [=3Dn]
> =E2=94=82 Type  : tristate
> =E2=94=82 Defined at drivers/mux/Kconfig:6
> =E2=94=82   Prompt: Generic Multiplexer Support
> =E2=94=82   Visible if: COMPILE_TEST [=3Dn]
>
> This means it cannot be selected.

Looks like you haven't enabled COMPILE_TEST first?

> Instead I (think I) should use
> default m if COMPILE_TEST

No, merely enabling COMPILE_TEST must not enable additional
functionality.

> Since my patch-set broke x86_64 allmodconfig and failed merge into
> linux-next,
> this presents an opportunity to change the above as well with v9.

Ulf has already applied this series to mmc/next.

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


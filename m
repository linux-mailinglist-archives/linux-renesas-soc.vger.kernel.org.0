Return-Path: <linux-renesas-soc+bounces-28460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II3yCnXnnmkCXwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 13:13:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECF197185
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 13:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53A7230266C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Feb 2026 12:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1CD281357;
	Wed, 25 Feb 2026 12:13:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265C27703A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772021619; cv=none; b=NSpokUcsuNwKjEFqkqz5bX4Mr2cDjf9foHPmsANQz2JdmC/0SiOSlpXNMinqSPp9ZGM7JY1bfLDDEo9nVyM+Pjx58eCFEDUE0a2B7Y6fbUO4DsuQtH+qUfuDsUbDVWT4wEzbhmlVAvH2fRXqpk4TdHVTSjQQ1VkDtJXOWmE0RAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772021619; c=relaxed/simple;
	bh=b7bATi+E9HIWEWXTAIwNa4451ABKjWAafWaU1v8UUAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjGjbGz2a+jfhO+Apv6lAFOUkgD5LoZV8gSyptHtPje7+vMEJ7o6geE76+HYfv7/APCKClUJG7n01/KDCGycRjOQaU7aUqcgbb4lD0b7PipSG3llxZjXqQ3qayQzQ/jE2U5qKyNzvJFX0wlDAN4beL+uY4iEpFNDseieHbfHemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d18d0e6d71so4681678a34.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 04:13:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772021617; x=1772626417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TQ9plTAtoqFGycuAV6Q4VO2kslCQXeQ3NGwgtKeiuo=;
        b=JONsxLt33vPGhPe55183lA8IQ1srZL6lhfmHGBYjiP5LFdZzjVmnhfi26Xb/sBiXt3
         kPSee+CgKh2r46I8NmmQiSD2jViCx/vgUsUZy4ugmIaGhW7kDO08rum4+9glWckC4Pz1
         NnWAgcXRL3KfcB9KO0GwRQY+d+MtDcp45P39ueQz9/1DxN1xnAYQ4V1mMyRjIh8Gvpq2
         fiS9qORGqZKMU6JSGnrh2geJgeJ1/3f2nOngVyUvouuZYZEy1C2diAS54hvYMlVBMurG
         NxHptMl71JBcWeKkqGHyLp61zgHhG75K8c1QRKnjh0jKV4+8H1LHcBDI8UlH+VEutU5h
         RlEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2jwqMX2L1Z1D8Skb1D8J38MYFTVTfidiGbtKzAvv4tF97Z7lYpbf28IxscC8Blr85I1nrqxInQ4E+iE7NlFAXYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtTsdhgPKLaoW5lG6xATXiK6wbciizjg1Mljl7uwMlF6arKc8
	3ZO1si3BVUHNC22KtkYB2zZooH8I3KcwPjN7TYdUM3/FlFaFFvQKcNb0nP+/h7vw
X-Gm-Gg: ATEYQzwNq6cnx8H296K2bj560eLrrLqeHgEVQLN30Kd3OozRb66pM5LOVJiL/f0G4zq
	mM4aQIkMTWgV8LN2u+HfJkfLs5r6lTrLhAwWt8KWFwOLWpYrlnNLEJYU6j6zfFROapfYMLq+/BX
	DUvc12d1v+Ip357ocCkWoSQd46B/LKIAG+iMuNxymhmT+AaSNF8jnwdOHyMXOymfzNtg+bRqNHl
	h1h60oMgculD2n31il8ukarhbzoFC99L0wz5m/Gva9S6Ix4P46+Ul+W6Y/ujib1Qim9cieC5JTE
	5phLaAXNbQxekHkxKA3ey9EkFPSPtI4DBKH2zW60nMF3XqAjDSY2gM3CXIg2r8IkyQjFLCuj2j0
	bqCkHdCKtNpnK7sPb/mNiCvzTsLf6t4coi7kDckkXfwioOwbFpFkNfAGoaSY5tkEYUpfxG+ShBM
	ZFU1XFOYWnD66ABvcOxuE7Rm3J7xH0L7FH5WjYxaq5j4vZX4Ch5dixxlpGB8JmdBN4nj7XZiLMo
	fY=
X-Received: by 2002:a05:6830:82a2:b0:7d1:8e7c:c54 with SMTP id 46e09a7af769-7d582a6f2ecmr57947a34.21.1772021616705;
        Wed, 25 Feb 2026 04:13:36 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf7c4d5sm12260266a34.4.2026.02.25.04.13.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:13:36 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4638e238094so3307430b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Feb 2026 04:13:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXN8Hk9NeZ69zNUYIO2ZVaTJww8+sjeMMOhaLskKm7vWg4dgmyIJ5Nv5YHF4h9sjbyqKp4UOlYEHc2acVo0+dUYxw==@vger.kernel.org
X-Received: by 2002:a05:6122:8c27:b0:563:702b:e2a7 with SMTP id
 71dfb90a1353d-56a8bcb7a04mr108622e0c.19.1772021289726; Wed, 25 Feb 2026
 04:08:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-rz-sdio-mux-v10-0-1ee44f2ea112@solid-run.com> <20260225-rz-sdio-mux-v10-8-1ee44f2ea112@solid-run.com>
In-Reply-To: <20260225-rz-sdio-mux-v10-8-1ee44f2ea112@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Feb 2026 13:07:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSU8Y9gj5qJ7qNE1UVhp7=HTjAxEsL6uZXPXFgwTd+7Q@mail.gmail.com>
X-Gm-Features: AaiRm538QW2lNPSmHsPdoAK0GxPwumP2I07aJZ0lsRKIlDak2p-vOeVkZ133ww0
Message-ID: <CAMuHMdUSU8Y9gj5qJ7qNE1UVhp7=HTjAxEsL6uZXPXFgwTd+7Q@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] mux: add prompt and help text to
 CONFIG_MULTIPLEXER making it visible
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
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,renesas.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28460-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DCECF197185
X-Rspamd-Action: no action

Hi Josua,

On Wed, 25 Feb 2026 at 12:35, Josua Mayer <josua@solid-run.com> wrote:
> The multiplexer subsystem was initially designed only for use by drivers
> that require muxes, and did in particular not consider optional muxes or
> to compile as a module.
>
> Over time several drivers have added a "select MULTIPLEXER" dependency,
> some of which require a mux and some consider it optional. v7.0-rc1
> shows 15 such occurrences in Kconfig files, in a variety of subsystems.
>
> Further some drivers such as gpio-mux are useful on their own (e.g.
> through device-tree idle-state property), but can not currently be
> selected through menuconfig unless another driver selecting MULTIPLEXER
> symbol was enabled first.
>
> The natural step forward to allow enabling mux core and drivers would be
> adding prompt and help text to the existing symbol.
>
> This violates the general kbuild advice to avoid selecting visible
> symbols.
>
> Alternatively addition of a wrapper symbol MUX_CORE was considered,
> which in turn would "select MULTIPLEXER". This however creates new
> issues and confusion as MULTIPLEXER and MUX_CORE need to share the same
> state, i.e. MUX_CORE in menuconfig must not be set to m while
> MULTIPLEXER was selected builtin. Further confusion occurs with Kconfig
> "depends on" relationships that could reference either MUX_CORE or
> MULTIPLEXER.
>
> It is common across the tree for subsystem symbols to be both visible
> and selected, e.g. I2C & SPI. In the same spirit multiplexer needs to
> ignore this particular kbuild rule.
>
> Add prompt and help text to the existing MULTIPLEXER symbol, making it
> visible in (menu)config without breaking existing "select MULTIPLEXER"
> occurrences in the tree.
>
> Select it by default when COMPILE_TEST is set for better coverage.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -4,7 +4,14 @@
>  #
>
>  config MULTIPLEXER
> -       tristate
> +       tristate "Generic Multiplexer Support"
> +       default m if COMPILE_TEST

Please drop this line.  Merely enabling COMPILE_TEST should not
enable extra functionality.

> +       help
> +         This framework is designed to abstract multiplexer handling for
> +         devices via various GPIO-, MMIO/Regmap or specific multiplexer
> +         controller chips.
> +
> +         If unsure, say no.
>
>  menu "Multiplexer drivers"
>         depends on MULTIPLEXER

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


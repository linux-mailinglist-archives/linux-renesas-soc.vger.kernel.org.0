Return-Path: <linux-renesas-soc+bounces-26020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6CACD6D66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 18:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B890D301103B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 17:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597A533EB0C;
	Mon, 22 Dec 2025 17:27:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C3D33F375
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766424477; cv=none; b=LuHJHOf2wF8MiJS8hyy1S4vpuK1p19Rm27dX3eUUTov7iYoCtnBc1NWRSLU/fx7u3NadPL4p82loFiGeoUQVeQ2dj7nn6fpBjCiOdMcwOWmC70I5GbTg/AOHt5qcqIiYnKx93AW3yX02OTVh8ow02pQM4bqrjM6KOVn+tFz21y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766424477; c=relaxed/simple;
	bh=ARCeP+FjHLyRQ/TFOxypXSIG5GzrN1OmBElkgW/ggfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVDTWdaj/wYe7l2/+zDPl2VkyydSW+iiaXb4ttGwdYqLyImSAwJGUJ/DHzlRd9lNj3WoHMryUJoH6nEAc3BET2SBmYCLy27QBQSAq2NKYUSrfqlYPCqbST1tPJT+bc+0jReHbDQGzZyvB6UnABrmVRP1gKrAOUrNhqvfQYfkAO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c0224fd2a92so3988826a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 09:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766424475; x=1767029275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE9KE2Jyhtg/iXF/CUsw7RlDbWGUrFQq1WT3oqM9mXY=;
        b=dIul+60Je7sa9Klme2KosQGCxHbzFB/pJxRaXrrAkCnKmbEabsurWyzm7sJTebrbTa
         UMyER9zcy/mqiR0PE6g2Ne+m6sOrOac9HGxh6SX6Vm63JtntUbbosU9x32N8O5d9fnsg
         92RIL71eFVTGcALa18olWw8kQYbQyV84S6yoacrsiYz4wRB7NDUfG2xIuf7LK7Df+6L4
         4V8W6HTz9dqB/4E5nTjzj82L4dLOVnSCfFqfskOkT+D90QtArGBOuYvsKXDy6ft+Jmh2
         BYZxXJnyvo7P4Vc4V85pX8WJbbCI8XQnFs+im0SOmON1S0DsinoFBG0oYn/pZ+dEMM2o
         7VPg==
X-Forwarded-Encrypted: i=1; AJvYcCVP99xZRVyz2qZPUhzRtCTJSdrQGncgeXTV+kD2NMt4TZPp4DUrsjiOFk3KRt6Ve4k32y7abZk/OovdBYRch5UfrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoJFSGKSK+MzettRjgEgg/ekBGoPWE3U0CKidMV7DraZ4kKd0O
	HvFAdc9qX4SZonwAW7IjLJ0lNhyi/WEmMGB7Z1tn+rDjn7x7dpnM1hNIlXNnLtq+
X-Gm-Gg: AY/fxX4Qvy9/0sl5JtTSMUabY6MIBYuZPB2aCgL2i3G4yIeD01RKuqlwUdvar/GEfpv
	mMINhcY0nDsaGE5RzsVXJ9UyWTYumQX5WIj5GxgTwnJ5W5Q0TKw3lyLnUwcNzIHwn3VgYLX0tY3
	fWXGvustAj/4+f2BUHZDmQ6IcuYDmAK48/SDHIEL5/AQ3riIzlxx0jzzXn08E8Rersrjxbwqlkd
	Vo5DEDCxmTO2ohA0CKIh4NbKOLwS6sJA/Pi/HRWPJ8V2tGJ03dBID5e551Et3AYDlxqmx81DbfB
	EoJ0Px4qp6JM7ySUVe6EZL6494XzCgXUG0XBdiVxX+GtuUz5kTznUDJ2DPF5x2I3EGJPseDx78m
	Wb/ZtUm2uh5Z5ElMyIF++r9vrlTwQtjWZRD62KYZDxZWylQnVofdYZcbjl1fI3p2DmGhAO34+qG
	+YOn6UOTiuBF7SEJ63cwk4RMt5oTkF119Fyh9kUa05EjVoG7nAqcJf
X-Google-Smtp-Source: AGHT+IHEBtMRYU00J/d6SUanQU6n5XhzApBAZASSyY6I8P/9hQihHFWPw2nMcQUQhe2jHAxI+cTysA==
X-Received: by 2002:a05:6102:cd0:b0:5db:f5d1:5799 with SMTP id ada2fe7eead31-5eb1a816ef0mr4372689137.33.1766417748808;
        Mon, 22 Dec 2025 07:35:48 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1aa4f55dsm3498176137.2.2025.12.22.07.35.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:35:48 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55982d04792so3250295e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 07:35:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHQASJvD1Y/V77EAHoWn/T3G54c34OsrM05zp2Ni5llruSAvjhUnkUsJEkkyolwLXS+23Y2toKdMom9x0c+sLIkQ==@vger.kernel.org
X-Received: by 2002:a05:6122:4f97:b0:557:c697:a30c with SMTP id
 71dfb90a1353d-5615be24746mr3595228e0c.15.1766417747921; Mon, 22 Dec 2025
 07:35:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215142836.167101-1-herve.codina@bootlin.com> <aUZEHSNqiMuHrCWb@shikoro>
In-Reply-To: <aUZEHSNqiMuHrCWb@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 16:35:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXTZ2LDs-nFQRh+Q5YAW_LD+j6j=Mzv0RxyB-1wnJgbuQ@mail.gmail.com>
X-Gm-Features: AQt7F2qPotDDz05zRLM4l-WdqTP8Y-ChrCcklHPqoMfDZgCa2sIooFyMFfI1kSs
Message-ID: <CAMuHMdXTZ2LDs-nFQRh+Q5YAW_LD+j6j=Mzv0RxyB-1wnJgbuQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram, Rob, Thomas,

On Sat, 20 Dec 2025 at 07:37, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > This series adds support for GPIO and GPIO IRQ mux available in the
> > RZ/N1 SoCs.
> >
> > The first patches in this series are related to a new helper introduced
> > to parse an interrupt-map property.
> >   - patch 1: Introduce the helper (for_each_of_imap_item)
> >   - patch 2: Add a unittest for the new helper
> >   - patch 3 and 4: convert existing drivers to use this new helper
> >
> > Patch 5 adds support for GPIO (device-tree description)
> >
> > The last patches (6, 7 and 8) of the series are related to GPIO
> > interrupts and GPIO IRQ multiplexer.
>
> I think this series is ready and I would really like to see it upstream
> soon. I wonder, however, if the path to upstream has already been
> discussed? It touches various subsystems, so I don't see immediately who
> should pick the whole series? Or if parts should go to different
> subsystems offering immutable branches? I bring this up because I want
> to avoid losing a cycle just because this is unclear...

We actually did[1]. Unfortunately that plan was never executed.
The DTS patches I can easily take through renesas-devel, as they have
no hard dependencies.
For the remaining patches, I see two options:
  A. Rob takes the first two patches, and provides an immutable branch.
     Then Thomas takes the irqchip patches, and I take the rest.
  B. Rob and Thomas provide acks, and I take the whole series.

Thanks!

[1] https://lore.kernel.org/20251114124045.16204839@bootlin.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


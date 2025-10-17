Return-Path: <linux-renesas-soc+bounces-23229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB8BE8342
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 13:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD95735C595
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE2532D0F1;
	Fri, 17 Oct 2025 11:00:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D589B32BF54
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698832; cv=none; b=UCa6j7kKaCRyh3lFhf/Sxc/7giFAT3BZtvjuvkPizf7GmWg8Nr3GzIDoyfNfrzG5yE5NbJ1OSeobrAIm2iJS4GS2x4Gp1fsfjb2CAF+nhf4e5mHxmUyGTsEW1AJdD8eT/fo86oOoAe/HvFTN6vbg2QAeuoqjdK5G4lj+QeHQQ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698832; c=relaxed/simple;
	bh=7roeWK5AtO/7ZwDK0dlN3Uu9wiMocaa5toCTUlYqJaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsfN7G6q7onKWq4/2DeQmi71KsmXUa11Xw9F+kpbRoZs69x0t2tsDKw8z1+4/aFoORM3BCwfAT/Pj7nzJhiGrUTlYNPsezYypWTyY62jtH+YAJwspFQOK2ej/or4b4YuJusyaAVAktG4nXZqW8irxRTPCP4F1op15w0xMEaej9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a213c3c3f5so2461737b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 04:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698830; x=1761303630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPE9WHNZsdRI3QmdRcH/wWeYzKksV+R5Ry8aWltKbjU=;
        b=iC/2iZ/HNa6lZFoyEVsB5gfeNYHVor1yOrXyK5JVhMU8OdocBKHvURFGUODiOhrpMh
         udzdIhp937ILglA6eLLTRzsENYoqawSvQ5YHdHGO7++TuaJJkbybmTlSpa9YYY2ClkwK
         rJjR1L5v46ozQk8KxM2nAZXMdgeRolVbBo4mL9f0lzTgfh5Z3wHr7nKcb/oG2jTV4NNs
         +suhvNwTQGmLW97NlxhT277ELdg/EuCJUpanSwZ3N8xae70N+zLU+f2cFW5vOdTrWaDG
         eQfkexZpUcVSTf52GLxMYCBUMoQAIeg3oCEBMd1mW9vnDrmThDRe7OJ+n9uksWsBKJ7h
         yCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv8deXs4E2ReFDpluyU+0U9JI6EI3Emdti6erq7sY64WHXNMn5/SWHs+FPcW2ORxaYz/v25U8D3BJH3rN3PqbQag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+9Mu2QPE6eIPMFyFgg1a5CYHMxitqMrLMLGhBD4ZYXn6f8eh
	VuzLR8fBnpBQix1WblULPh/0mqs9Xnj9O91JHLhONLL6Te/8mc27yuRHcYYhswkG
X-Gm-Gg: ASbGncss1jsIsQaQOqSiZ93rALp4cjk20dG3Je0UcpnR0Vb+ASID6gQekCPzWqPc64w
	pOaIPBTPPDwnWZZ0mP+Da1VaBv+K6zyl1FuQtl56WXmc3ug2+napXHvxTFsE5F11J68vRcFulZL
	zZVUjt61uGgQwH7tUTX5v3LssrktWLHJvck7OcRcLn5sKRWbQu/P8Gias+Hgt1vmppTLgnYELSl
	sRha6Toel5+d4xHCLuqZfQ2QR0LL8yPEMbDm03SvUkFYRGuc0/qLtWRauRmShj6Nu4jrh7KB6nD
	RSvxM4SgqvIyMD59UBxipNACqh5FiwFcw6QRUiw3bWwaBT0QPy0scNIJ5MExSI9pasQmLyymGHJ
	gxIvCjiFTttCf0xmzPsXtfgCVjpPaTiOLxrsNASs+AvuhO6pVAu1TPM606C3z55msLSh6ccHJtR
	LncuegkUC/+BLF1kl0jVXX7YOqSX4y+emutGCklUOuXLM+UCcD0K4d
X-Google-Smtp-Source: AGHT+IFKs0GehquxM4TRZGi596WBKjx8vovfpE5U3ashJ1sx3ihY3pVaR1hsyH80DzLGi3Ms8XS/nw==
X-Received: by 2002:a05:6a20:a11a:b0:2e6:b58a:ddec with SMTP id adf61e73a8af0-334a85a55c9mr4907152637.36.1760698829657;
        Fri, 17 Oct 2025 04:00:29 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bb6298651sm5148454a91.0.2025.10.17.04.00.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:00:29 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7930132f59aso2475028b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 04:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQHTBTalbIhkau0jXVsE2qJ2ShaNeWEjhqCVtpiuOrwlbxG/PCh04Y7cuipzepmsqfwOJhOKRg7qjs5CQCF/0H1A==@vger.kernel.org
X-Received: by 2002:a05:6102:5111:b0:5d5:f766:333e with SMTP id
 ada2fe7eead31-5d7dd5934demr1126362137.15.1760698513447; Fri, 17 Oct 2025
 03:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1739540679.git.geert+renesas@glider.be> <2d30e5ffe70ce35f952b7d497d2959391fbf0580.1739540679.git.geert+renesas@glider.be>
 <20250214073402.0129e259@kernel.org> <20250214164614.29bbc620@pumpkin>
In-Reply-To: <20250214164614.29bbc620@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 12:55:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
X-Gm-Features: AS18NWAcP6voBjoIoEi-7RxJ0pdmzXqhfe5FdHBNP60R0y-DyUBofdEL44euygw
Message-ID: <CAMuHMdXost7vL5uTocMGtrqhEk5AY3QUWvyP5w7_hBtf3MkMfA@mail.gmail.com>
Subject: Re: [PATCH treewide v3 2/4] bitfield: Add non-constant
 field_{prep,get}() helpers
To: David Laight <david.laight.linux@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	David Miller <davem@davemloft.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Crt Mori <cmo@melexis.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alex Elder <elder@ieee.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, qat-linux@intel.com, linux-gpio@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Fri, 14 Feb 2025 at 17:46, David Laight <david.laight.linux@gmail.com> wrote:
> On Fri, 14 Feb 2025 07:34:02 -0800
> Jakub Kicinski <kuba@kernel.org> wrote:
> > On Fri, 14 Feb 2025 14:55:51 +0100 Geert Uytterhoeven wrote:
> > > The existing FIELD_{GET,PREP}() macros are limited to compile-time
> > > constants.  However, it is very common to prepare or extract bitfield
> > > elements where the bitfield mask is not a compile-time constant.
> > >
> > > To avoid this limitation, the AT91 clock driver and several other
> > > drivers already have their own non-const field_{prep,get}() macros.
> > > Make them available for general use by consolidating them in
> > > <linux/bitfield.h>, and improve them slightly:
> > >   1. Avoid evaluating macro parameters more than once,
> > >   2. Replace "ffs() - 1" by "__ffs()",
> > >   3. Support 64-bit use on 32-bit architectures.
> > >
> > > This is deliberately not merged into the existing FIELD_{GET,PREP}()
> > > macros, as people expressed the desire to keep stricter variants for
> > > increased safety, or for performance critical paths.
> >
> > I really really think that people should just use the static inline
> > helpers if the field is not constant. And we should do something like
> > below so that people can actually find them.
>
> Especially since you really don't want to be calling ffs() on variables.

It is not that bad, as most temporary architectures have an instruction
for that.

> Much better to have saved the low bit and field width/mask.

While that would allow some space saving (only 10 or 12 bits needed to
store low + width), gcc would generate quite some code to create the
mask (even on PowerPC, where I expected a single instruction would
do ;-).


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


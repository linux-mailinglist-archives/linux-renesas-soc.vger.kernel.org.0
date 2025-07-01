Return-Path: <linux-renesas-soc+bounces-18953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9FAEF49D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BB86164424
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 10:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F41264F87;
	Tue,  1 Jul 2025 10:12:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510AE1E570D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jul 2025 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364725; cv=none; b=t9DGdi0wQxKP1u/SuZe4vaczgoGlz1hQHXBphDzy03nZ6cHbyHEVJckD5HQjyRY7u2k0HLxtyNiTAVAPRlSFUyssi+iO/JJuE/LqgHpzm6hArck1cD/JwF2i7YjbNUszsuOvwL6YffGq0gX8oDUIOre82H/EJy3yDzbrIRILQRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364725; c=relaxed/simple;
	bh=FPGOOOdTTruvgSXL1eMncjuAIhPpFStaLmGn1UgE6ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYGMzKEbArmooYnjeJsTDzDJPIW6/TDN+V3nGvUj68tnEzYYZ1mYqQ+4P9+6PxkGDRykBbxCNFX346rQFltI57BoVBS5vj0ws1Hk7EHWmXxGyiIqiMK7FzNKAjMrL08udmC/SULCTQN6xmtOkeE32HDoRLd8OiLfnDUf2oEDTZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-532d498eb95so1011848e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jul 2025 03:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364722; x=1751969522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDnbULudUAbSkRGBuzvZxA6DBiiuE+nHHejYc34ENUY=;
        b=tV0e816w2/JUK8e+lMaDjcKJh1s8CoIUP3PccKg7CZNLiZ/lWZ2ftKrWTLnOgugq8t
         Gbpscsfl32M4a83R39IWpF3vm+VnDSL3HEYqosK5Th/DYS0uvtnGikLz7f/MRKLzXfx2
         NsN1XieGnkRxF0RwXHf1rVpZxNOykUtffwj9iOCTv5szlZ86UbJ9Eg3m4qXEiX91x3D/
         XUHTVGa/7RZRJhmf1TnImdod06kpr6RI4R5PeoqHrMaqdu6NlPXzEWH0kkHxOh8ilJwD
         gdi0vHX3jgPJLKx/4PSetjNYwrnurpjn3lWuXE3ltuYpycTqTgGKkkRya4b04mBSwh3M
         DaBg==
X-Gm-Message-State: AOJu0YzjEYuCZK82yMMrbjxSijgytOFsjs1juoPs+kryR1pDic0a9MTF
	Kub1uU+75GhN9ijW5LZBnyn61jgL/MJx/ZMd6lv+AM4NAy3aHRV1x/dNW/93KjVk
X-Gm-Gg: ASbGncv4m/6bwDj5TjwOTRRvZRBoyDmtR5nMh9fSPJ/B+5Gb1ARb76HMYpxKsZEPfcX
	8/fw/rW9F2DjkFcPmaJRc63TgdEnwoqFHbaR5xs83Saz+rCWkA4GMTPqnawAlCmnf4CEBWKM1mZ
	AQiUoPciqX+Z1xcnw1/zZjuULqSwEecwbuq5Ph8KnCtZ2ate7iMHXjVs/I+9ZJ7oabJR7Uq1zcd
	uD1Xf4o5wpEKSjNuo/Pt5fNhkLi93rUzUhKwTzpgUrFy0hQkZZ2RsKiafxDH0qc9TANzySQbf4o
	bX2Eq3XyEH3v9Fu+KraK9RzdEUY85+FfA+co7kksaASK3ofYLrKr/TTZxnKUymgcYlM2gYSAlom
	NKKLy3snruO3cxKdLL/2HWGzKA00giwp8Jmc=
X-Google-Smtp-Source: AGHT+IG0ytA4AMpjpKVXysJFgnaKoNgLmoCZpG6xQ8+m5hWCB0t0KBFBgy9xHKuZpXGMdRFkznH8Yw==
X-Received: by 2002:a05:6122:1aca:b0:531:19ee:93ea with SMTP id 71dfb90a1353d-5330bbd3a5cmr9292572e0c.0.1751364721882;
        Tue, 01 Jul 2025 03:12:01 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533090796e8sm1669285e0c.10.2025.07.01.03.12.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:12:01 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e9c8a2026bso835312137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jul 2025 03:12:01 -0700 (PDT)
X-Received: by 2002:a05:6102:6449:b0:4e5:a6ad:8fee with SMTP id
 ada2fe7eead31-4ee4f89b2c4mr10924185137.19.1751364721442; Tue, 01 Jul 2025
 03:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <877c0xhk3z.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdV6UzMRXHOEEVMe6suybLAy79+fxLTSYW_DRP8k7sfMEg@mail.gmail.com>
In-Reply-To: <CAMuHMdV6UzMRXHOEEVMe6suybLAy79+fxLTSYW_DRP8k7sfMEg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 12:11:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEaW-SZTxyTP8xM81JAycQh2qdWg+pLeJyEVgtAOO88Q@mail.gmail.com>
X-Gm-Features: Ac12FXyZCD-ydDHEM9Jpl9G1U4noaahXyBKEA_KIAfrBZJsisFkyNizOrKc2VQ8
Message-ID: <CAMuHMdVEaW-SZTxyTP8xM81JAycQh2qdWg+pLeJyEVgtAOO88Q@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: sort Renesas Kconfig configs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 12:08, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 27 Jun 2025 at 06:41, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > Renesas Kconfig is using "SoC serial number" for CONFIG symbol, but is
> > using "SoC chip name" for menu description. Because of it, it looks
> > random order when we run "make menuconfig".
> >
> > commit 6d5aded8d57fc ("soc: renesas: Sort driver description title")
> > sorted Renesas Kconfig by menu description title order, but it makes
> > confusable to add new config.
> >
> > Let's unify "ARMxx Platform support for ${CHIP_NUMBER} (${CHIP_NAME}),
> > and sort it again.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/soc/renesas/Kconfig
> > +++ b/drivers/soc/renesas/Kconfig
>
> >  config ARCH_R9A07G043
> > -       bool "ARM64 Platform support for RZ/G2UL"
> > +       bool "ARM64 Platform support for R9A07G043 (RZ/G2UL)"
>
> R9A07G043U
>
> >         default y if ARCH_RENESAS
> >         select ARCH_RZG2L
> >         help
> >           This enables support for the Renesas RZ/G2UL SoC variants.
>
>
> > @@ -413,7 +416,7 @@ endif # ARM64
> >  if RISCV
> >
> >  config ARCH_R9A07G043
> > -       bool "RISC-V Platform support for RZ/Five"
> > +       bool "RISC-V Platform support for R9A07G043 (RZ/Five)"
>
> R9A07G043F
>
> >         depends on NONPORTABLE
> >         depends on !DMA_DIRECT_REMAP
> >         depends on RISCV_ALTERNATIVE
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.17, with the above fixed.

... and with the recently-added SoCs updated, too:

 config ARCH_R9A09G077
-       bool "ARM64 Platform support for RZ/T2H"
+       bool "ARM64 Platform support for R9A09G077 (RZ/T2H)"
        default y if ARCH_RENESAS
        help
          This enables support for the Renesas RZ/T2H SoC variants.

 config ARCH_R9A09G087
-       bool "ARM64 Platform support for RZ/N2H"
+       bool "ARM64 Platform support for R9A09G087 (RZ/N2H)"
        default y if ARCH_RENESAS
        help
          This enables support for the Renesas RZ/N2H SoC variants.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


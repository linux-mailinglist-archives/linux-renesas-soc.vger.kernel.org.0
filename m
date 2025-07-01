Return-Path: <linux-renesas-soc+bounces-18952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A21AEF48B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26628178C8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 10:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BC018DB35;
	Tue,  1 Jul 2025 10:08:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076381E570D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jul 2025 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364538; cv=none; b=UedSFi+2iLWjys1TxDc0ZGpuPBAojlQBoIxUUOT/Hgg4Zr6uaI2Onr43/2au5bpLspaqbf9pvEJktLifLG3sKz5w5KqV/vOXljG40L8/6403UdaUobsGHOJvrgZog7yhKwx1V65bYqDr9xjj8JRUA6KJJCuCB9AgHcuk2cqJBmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364538; c=relaxed/simple;
	bh=vKWyEA4DnusZIds3jfW8a0h0KcUuAUOSUh03CXhR20Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VG23XHT+Bt2XhhmPhBPawcvxxB3SL+DbQuEIjLpQAYoHOaW2zmPf2rFqgmzotS32NDyk3JghxvvBGnKysY8lSL9lY311/ElGPVvUN6gFyVhOBWq93C8Z5DnNlyrORh2Vk+d8LV8NgVfF3awmTCEdDxWtPaQ4jNxrPpSTMxwcPLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e9a7b4a412so2048342137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jul 2025 03:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364535; x=1751969335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zm8iRO4+l8Jdhr0JNh3vbYmlGClYVGUnnsPy6WnZseg=;
        b=b+T8a6t5ziESli6otdfCENvSQDUxXCEnnA8ZOKZNvby5AwOTp8HHXHKLVj5uB3leLG
         a7/duyG4tB9bC4bvqRFakj+2qsWKP+/Xy6H4aCD1trlmE77yT8e0o4p/lpE0vzUyP8v9
         CyaHJ2u2DecI2zEZIRf9hGyVvYNDz4kv2gFRgYDjCTSo3tMMEDvXohfM+MuxLEkY8j3G
         nFEccbTl02B4HFqg4trclIyY5NWkT+Xc6qPbrhgri+KCMEYfVwPe039O6BNI8rHotmft
         6IStrhkO0n14pfBOE85URq/y3UVdljEJ50GVf3EJ6s3f+vUXmrAX1m/vlUc3VQezMUVr
         GE4g==
X-Gm-Message-State: AOJu0Yz7B8zR4j52ZRRh3ma/VSEgFDUZzs+5QxR52jogn7J/qVt8KJVv
	xMLHCr/LJsbMy/kmjReUtwZyDjRv83IrHjVqo6wRHgX1bnhHi8K3BjQ5Ds5EfPZG
X-Gm-Gg: ASbGncuYkszpYFh7kAUNFDRYfe1XO1w3hnnPWB63MFWG/apWsQVo7Meavg1c7AQW6Pi
	T7lIOQ0jL54bvsLeYrypWvpon3TUYa5uJeVuKq2C4CcvQwjMK2LF1GGucHzLPRBmP9anyHjtXdy
	5d/+AczGETaxIJokBYI+jtIV7K12Z4ysWzdTIOuX0v3O4vlkbP7d/VI85yPVkOq6EbgX1JXvVv1
	xL4cEjfQ9BxV8Qk63ZBL+s0fTT1yEh8Uriz6sfRTdSMMCw0MHyhd5pvPD91JXJhTRip4OtE6jYb
	rUyP4YIKp9Iyk65VJKjhWAtjv92Wz3Xi1vg/R3nq116HDIe+QU/Hv9TOLCC1se1aI+HGmQnWImv
	/ScWJitRUxDjODDtZhPQQKftaUyppGvPx6pp67WA=
X-Google-Smtp-Source: AGHT+IFWHON/cJr6ZXlwRSQ3ZAb2OmQQLW8qidmCb/p4ygSzzx9WSqfPaTRJDiUvr44WwsFTQRHzkg==
X-Received: by 2002:a05:6102:1613:b0:4e6:245b:cf57 with SMTP id ada2fe7eead31-4ee4fa05e70mr10561497137.24.1751364535185;
        Tue, 01 Jul 2025 03:08:55 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1c210a5sm2040430241.5.2025.07.01.03.08.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:08:55 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-53140c33563so2166232e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Jul 2025 03:08:55 -0700 (PDT)
X-Received: by 2002:a05:6102:390a:b0:4e9:b66d:3c11 with SMTP id
 ada2fe7eead31-4ee4f8bed59mr11820383137.19.1751364534752; Tue, 01 Jul 2025
 03:08:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <877c0xhk3z.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877c0xhk3z.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 12:08:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6UzMRXHOEEVMe6suybLAy79+fxLTSYW_DRP8k7sfMEg@mail.gmail.com>
X-Gm-Features: Ac12FXxVY7kRUdWfEPEgE_J8oRFSD4095vWD-lSPekspcMShPta32pt2-advCUI
Message-ID: <CAMuHMdV6UzMRXHOEEVMe6suybLAy79+fxLTSYW_DRP8k7sfMEg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: sort Renesas Kconfig configs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Fri, 27 Jun 2025 at 06:41, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Renesas Kconfig is using "SoC serial number" for CONFIG symbol, but is
> using "SoC chip name" for menu description. Because of it, it looks
> random order when we run "make menuconfig".
>
> commit 6d5aded8d57fc ("soc: renesas: Sort driver description title")
> sorted Renesas Kconfig by menu description title order, but it makes
> confusable to add new config.
>
> Let's unify "ARMxx Platform support for ${CHIP_NUMBER} (${CHIP_NAME}),
> and sort it again.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig

>  config ARCH_R9A07G043
> -       bool "ARM64 Platform support for RZ/G2UL"
> +       bool "ARM64 Platform support for R9A07G043 (RZ/G2UL)"

R9A07G043U

>         default y if ARCH_RENESAS
>         select ARCH_RZG2L
>         help
>           This enables support for the Renesas RZ/G2UL SoC variants.


> @@ -413,7 +416,7 @@ endif # ARM64
>  if RISCV
>
>  config ARCH_R9A07G043
> -       bool "RISC-V Platform support for RZ/Five"
> +       bool "RISC-V Platform support for R9A07G043 (RZ/Five)"

R9A07G043F

>         depends on NONPORTABLE
>         depends on !DMA_DIRECT_REMAP
>         depends on RISCV_ALTERNATIVE

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


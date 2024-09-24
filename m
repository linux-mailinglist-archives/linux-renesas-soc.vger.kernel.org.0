Return-Path: <linux-renesas-soc+bounces-9020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CF298482E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2024 17:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DD9F1C219BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2024 15:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0711AB6C4;
	Tue, 24 Sep 2024 15:03:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7601AB6D0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Sep 2024 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727190200; cv=none; b=ps9u8WL0aDzxj8iFaTGiDq5Giab/i1NpqcDnbJ8eeyk9HwimHufd6f5DxfzOsPQfqZVC/HoFCVM+BWcplDvcTfdXTA2v2Yd4NXPk+4uerPBRLLH1RCZ6LRp7bqoJ5NpnrtQVJlZ85QZRe/ZQEL1D6k4PeA7FEnSSy1/Sp9rbKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727190200; c=relaxed/simple;
	bh=lNlwkX9+kOdaf+sxGP5Fh9I6iXVnDauxIC/Gd3wHRgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ionvz6PU0xy5mOUG5iTKDd2TB6OaVBbV7OUA28CJTPvyLGVvNcxjxGwjUbsa6fVmFKR19J9bVkA9iqpYIpK6N5fdXkYMorvMZ0Fiqiu7SQKbd6BxobFbsyWocqTHdf4og5dGZ75qJex3sJIskPZg0llkt4RQ193MM8uqI40VzAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e21ac45b70so1294277b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Sep 2024 08:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727190196; x=1727794996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLHaqLf/EY8f3/+vMPI/5pqaC2tKGbDSsFyNM4RtvRM=;
        b=RJqRsyHjTWdSJAErocAvhyrfZyIkKUxLV7GempyUdPUk6ykPIwzLcOlcTw9HZIbOBs
         QyzbN7BhpFKOpxcuDm4H32gaEQQP3geF6TaaIy3HroZEwzYyX2YBciVv9wbEqQnEM4Ga
         gH2AShNT8ikIu2uA+Zw/COrgr3M+gKN4GAZZ9VuWMhyATdf0fusIp9ENTweLkiVbWnwh
         XgHeXVGEslWWwcCwScVyUYNThYYFH6sVMtJkqRJ7sJVDO7nomutlbg8oGFFGdAOgMAvM
         P46h2NNpNcFn3HpUH8nZSM7jn7T0licl6tu4NmwnvEAyKMXP6fw8VCMThQ4nQ7pfJR9B
         VncA==
X-Forwarded-Encrypted: i=1; AJvYcCVYnhKBzie1LtINra26bC827ByZ3sbzZhP8elIXRP05k5gWkmb5VrV8G1aRq8O7YmPNw1OiTbp70kN5JFEjv6oJiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN6dr73IxWNwbrzPksxhqSe12FuE2t+Z2wU1Jkj0ZKmvnzKflX
	Bqb+H9vqR39QPFqxgC08EqkB8LSXY5fH8taCid2BgptDfq+u8VsvjZCcKoQj
X-Google-Smtp-Source: AGHT+IELrJfA9zbzEDdNZwE/AnVcwHoBGpMkc7whZqctCB95chR8R4b9Yj8s0Oq0yvBMh57MT4TL0g==
X-Received: by 2002:a05:690c:4093:b0:6dd:bd27:8b07 with SMTP id 00721157ae682-6dfeeeec0famr78822857b3.36.1727190195562;
        Tue, 24 Sep 2024 08:03:15 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20cffe3e4sm2655587b3.22.2024.09.24.08.03.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 08:03:15 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6ddcd0b4c59so51703087b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Sep 2024 08:03:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/mgKkx5Htgrf2nnJnULG9MsKILiv5rlR4Ke33Fo99XnvKegWAAQv7N8d0Dhq+xpSBf6Lphpd3Xiu0unxRIazHrQ==@vger.kernel.org
X-Received: by 2002:a05:690c:a84:b0:6ac:d0ac:f74d with SMTP id
 00721157ae682-6dfeeda3f93mr145411787b3.26.1727190194663; Tue, 24 Sep 2024
 08:03:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917131936.18980-1-palmer@rivosinc.com>
In-Reply-To: <20240917131936.18980-1-palmer@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Sep 2024 17:03:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHPMSP6NteQHsK=kwmBknL0dDex5q3YaHBMj3gei62wQ@mail.gmail.com>
Message-ID: <CAMuHMdUHPMSP6NteQHsK=kwmBknL0dDex5q3YaHBMj3gei62wQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: defconfig: Remove ARCH_RENESAS
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: prabhakar.csengg@gmail.com, geert+renesas@glider.be, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Palmer,

On Tue, Sep 17, 2024 at 3:20=E2=80=AFPM Palmer Dabbelt <palmer@rivosinc.com=
> wrote:
> The RZ/Five is gated behind CONFIG_NONPORTABLE because of the DMA pool
> issue.  e36ddf322686 ("riscv: defconfig: Disable RZ/Five peripheral
> support") removes the drivers, so let's remove the rest of the vendor
> support as well -- users of these will already have to play aruond with
> kernel configs, so this shouldn't be much of a burden.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks for your patch!

> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -27,7 +27,6 @@ CONFIG_EXPERT=3Dy
>  # CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_PROFILING=3Dy
>  CONFIG_ARCH_MICROCHIP=3Dy
> -CONFIG_ARCH_RENESAS=3Dy
>  CONFIG_ARCH_SIFIVE=3Dy
>  CONFIG_ARCH_SOPHGO=3Dy
>  CONFIG_SOC_STARFIVE=3Dy

I had planned to send a v2 of the aforementioned commit, including the
above, but didn't get to that. Sorry...

With CONFIG_ARCH_RENESAS=3Dy, you can also drop the following
line:

    # CONFIG_USB_XHCI_RCAR is not set

(USB_XHCI_RCAR depends on and defaults to ARCH_RENESAS)

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


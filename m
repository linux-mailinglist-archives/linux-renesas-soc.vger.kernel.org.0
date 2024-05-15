Return-Path: <linux-renesas-soc+bounces-5371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 481628C69E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 17:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6FA8B2260F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 15:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AEF156221;
	Wed, 15 May 2024 15:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnAKmxkT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E063E155A4F;
	Wed, 15 May 2024 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715787845; cv=none; b=AVvXx12K4ZAf8qP+iNhWuAGZKU20cnqzss+udY0zo0fpjNXgQ2A0DDIpXEUMU2sUPbu2bYynNZfjkEPOKXzjpPyu0V6V2CrHtVrY79DYAncVUv9oN1zrSWyeJIaheTfoTeBn5K3R7K8/qAouVq14nKKK+Rt61h1Xj9Cmei83qT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715787845; c=relaxed/simple;
	bh=VyPLhSs86jn7k0Wyf379x2auUMCzO4Vjfb/ZY9fCbio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5WNNnyjYs3uL9KC61TxvQvh1rBF1hAnfvc0Bsr5AmAvykgKyMsb045bl7PhFatXzMYw4E6OC92CrXLVc93VyzTcpSTrrwRkY/9Nf4aoIzeV+8YPvnwT3NJGn32pIZndBUJdr9s9P76POnsjgFprUrTDjc0QCZEHCOQsB/Zdg/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnAKmxkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F4BC4AF07;
	Wed, 15 May 2024 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715787844;
	bh=VyPLhSs86jn7k0Wyf379x2auUMCzO4Vjfb/ZY9fCbio=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gnAKmxkTzT6ldywcJZfubR1DUiTiM0NOxYrwJhzFxh05H8QOY4OdGrKEIqlIHMqCd
	 /LVt74c1vJnNflQwm2ucYNp5XbVhBA6gmODeNqHQ7jzuDCab+6DIs5xHJnXgmGOT6c
	 YqGndBsR6mlpXiv02X91dy91QLK/luP7FYKBnlDMeYHcr8qPjGndMKN8DC3Dso6EFH
	 lL+/CRVG2BZM8zLpsUF+XdZzyf/djL+l+Ix2ISoeYDNS/SwKR6GsV7mD9HMyIAtWWd
	 4yvOfQed58rvMsn3CX12ytlOj2oImA/p4p4p8R3yh64dCUMRT+6aWvvFlWtWoUg0wS
	 52FA/P7HUkp6w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso104596471fa.2;
        Wed, 15 May 2024 08:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzffVV3smpeS7k5Dm+BeTu50AZ1P+JiGd+CcDEuWMnCacn/LQ5CgRT3iPWDF2VzZfUla0qOOuWBspQWBJwrrd5BtXun5i8TzyOX0hb/OZ37zREqevO40e8WX3duxlVUrg/+BzZHbMX05RWEoXYzm0=
X-Gm-Message-State: AOJu0YzFxwFC/KedqSDgoQnyzL0VOhDYjti2PdzmOzEXyXiG+Sk0f2Rl
	B8Vi5t9K6tUK0rAOk99BrGJvoDHOh6sFbkmW4soEd5JvJMW5KPcnJF49hZDjB0s58tGXj1we/qj
	Yv4SZm67rh+zjTJWexAJ4I+UVnRI=
X-Google-Smtp-Source: AGHT+IEG9Pi5RYQYmU94hJvMF0ljnnODEoOc6w+NP4apBt7czmZrR81mPLVgEe5NETinznGzePpXC2WPrvtBqgmsblE=
X-Received: by 2002:a05:651c:23c:b0:2e0:e470:882f with SMTP id
 38308e7fff4ca-2e51ff5ffebmr112422491fa.28.1715787842865; Wed, 15 May 2024
 08:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <200d273a83906a68a1c4a9298c415980737be811.1715781469.git.geert+renesas@glider.be>
In-Reply-To: <200d273a83906a68a1c4a9298c415980737be811.1715781469.git.geert+renesas@glider.be>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 15 May 2024 17:43:51 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEzmUFmYyHiT5h1ZT8v+nWiP_0_MMdtT0y8vsTC-drjNQ@mail.gmail.com>
Message-ID: <CAMj1kXEzmUFmYyHiT5h1ZT8v+nWiP_0_MMdtT0y8vsTC-drjNQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: Fix userspace enter on LPAE with CC_OPTIMIZE_FOR_SIZE=y
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Russell King <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <keescook@chromium.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 May 2024 at 16:02, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Booting an LPAE-enabled kernel built with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> fails when starting userspace:
>
>     Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
>     CPU: 1 PID: 1 Comm: init Tainted: G        W        N 6.9.0-rc1-koelsch-00004-g7af5b901e847 #1930
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     Call trace:
>      unwind_backtrace from show_stack+0x10/0x14
>      show_stack from dump_stack_lvl+0x78/0xa8
>      dump_stack_lvl from panic+0x118/0x398
>      panic from do_exit+0x1ec/0x938
>      do_exit from sys_exit_group+0x0/0x10
>     ---[ end Kernel panic - not syncing: Attempted to kill init!  exitcode=0x00000004 ]---
>
> Add the missing memory clobber to cpu_set_ttbcr(), as suggested by
> Russell King.
>
> Force inlining of uaccess_save_and_enable(), as suggested by Ard
> Biesheuvel.
>
> The latter fixes booting on Koelsch.
>
> Fixes: 7af5b901e84743c6 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0 page table walks disablement")
> Closes: https://lore.kernel.org/r/CAMuHMdWTAJcZ9BReWNhpmsgkOzQxLNb5OhNYxzxv6D5TSh2fwQ@mail.gmail.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This works around what appears to be a compiler bug (see my reply to
the other thread), and this change (the __always_inline in particular)
seems to work around it, so

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> ---
> Feel free to fold into the original commit.
>
> Apparently the "From: Catalin Marinas <catalin.marinas@arm.com>" in
> https://lore.kernel.org/r/20240312-arm32-lpae-pan-v3-4-532647afcd38@linaro.org
> is not reflected in commit 7af5b901e84743c6?
> ---
>  arch/arm/include/asm/proc-fns.h | 2 +-
>  arch/arm/include/asm/uaccess.h  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/include/asm/proc-fns.h b/arch/arm/include/asm/proc-fns.h
> index 9b3105a2a5e0691e..b4986a23d8528a50 100644
> --- a/arch/arm/include/asm/proc-fns.h
> +++ b/arch/arm/include/asm/proc-fns.h
> @@ -187,7 +187,7 @@ static inline unsigned int cpu_get_ttbcr(void)
>
>  static inline void cpu_set_ttbcr(unsigned int ttbcr)
>  {
> -       asm("mcr p15, 0, %0, c2, c0, 2" : : "r" (ttbcr));
> +       asm volatile("mcr p15, 0, %0, c2, c0, 2" : : "r" (ttbcr) : "memory");
>  }
>
>  #else  /*!CONFIG_MMU */
> diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
> index 25d21d7d6e3efee0..6c9c16d767cfd5df 100644
> --- a/arch/arm/include/asm/uaccess.h
> +++ b/arch/arm/include/asm/uaccess.h
> @@ -47,7 +47,7 @@ static __always_inline void uaccess_restore(unsigned int flags)
>
>  #elif defined(CONFIG_CPU_TTBR0_PAN)
>
> -static inline unsigned int uaccess_save_and_enable(void)
> +static __always_inline unsigned int uaccess_save_and_enable(void)
>  {
>         unsigned int old_ttbcr = cpu_get_ttbcr();
>
> --
> 2.34.1
>


Return-Path: <linux-renesas-soc+bounces-5374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD98C6CE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 21:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4BA31F2337C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 19:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C250C159596;
	Wed, 15 May 2024 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuKus891"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C92A3219F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2024 19:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715801622; cv=none; b=tVzbOcMqQN68BxKdrUwz+rTAJmJB94/IaD8gYMcnoTB43jfQo2K53T9JH8vtmACVrk0GCEcRfbZhB5wMceqU4pkw5gdtZwgWgop+LtVbDjVcMUFCBvXMKtJ8LaIP6EwhZYYD+AViDFFn7bvL9/2gD4DeXPy9iS9UPAlHa2svl4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715801622; c=relaxed/simple;
	bh=G9CWlj5Tr42EbOH2aiKT43kduODZ1s5xduEkYsBbEIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyASrz2g5dgABYy1oCVhe2XViv63YahVvpC3Dl3kBYf22J/dcmyL4Zd8ivxqtvrPdAmE7Bd5lhvzOtWdv5XT2Ah2uEak0pln9xv0OhKtYUlVLEAEJ4P2S8D7VOijFAclC0mBND0CotL7OpU4TAwU7J3vHNv5HLUS9M2U6D5483g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuKus891; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-62027fcf9b1so62136087b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2024 12:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715801620; x=1716406420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAG+GXxkb/D6Wyq71jplqiM6gJpPzZx9qHoI//hR8WQ=;
        b=xuKus891xhZeitoSjPjWsTT7vRP2flJdmm15oI5Vgqh3LoLIVpxZFbM5Xh9tp0RFdX
         sEegDJMNiTAD9/gtdFZtT3UAPZ4jIk1Hx3DHLY6Ejqas2fQVLcBCVToJb1qk8jb4mcyT
         MibAPYMqHdnTgL4euZh2Gpx+kKQHvG0EgiaFpxQhNmQmYqiZOH7lD+wpUewxY5TbE9cG
         GkneNt9pTS3zpTN4dXvMnjG3NqQ5ZFsCdaB3nlwY/XUBuoWJlffN0a0PJQzn/l3cQMwk
         tlEV8ovYHpedupzNoekgKQppB3r30NH4laS5e+O5xHxi1csuCEacb6aHMRItefgF90KP
         yYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715801620; x=1716406420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAG+GXxkb/D6Wyq71jplqiM6gJpPzZx9qHoI//hR8WQ=;
        b=QEGzP/cYNWU4FbxCQ5lX3TQ1QttLk92By4k79OTrOe4paD6SzC4RhhA3HKx1xG6uz5
         T3OtFNHWzNjE8uxgDtwQEZI16E4YEsmtlz+CdvDNTvZFCd2S7CdVxkNDd0VIiEns9e8h
         /vqeKNPVfu8nwfAZ4wmJ2gINXV77gpddJCBGgdG/2Hyqksvvj5yyZHAXEC+nn3A72vnx
         svg527UDze3cPaq9JOgrOXxZ/iHzJQ+ptiF0TtnzUoEsRjy5SrJgH8mHyoMsa5QDLtea
         ctNNu00AX4m0UF/wcGdKeclLI2Z27/F3n9IAVkXkt7bsuVEVSoyLXFo+c1he83x52xr5
         yXKA==
X-Forwarded-Encrypted: i=1; AJvYcCWlGfrv1lB6ntbbGB+PelLXOdv0NMcn8S+IIw9Jj4lTSZeXMuSzVbR0TaXTtEpnJUUDGMD3atrwAaV9tgps9TJo4EZkzpJGjV2f2OyELuG2BIo=
X-Gm-Message-State: AOJu0YxuFYr3BNHyaZ37FwYjmobjfgkfVo17t5ijdIEk3fMPPeJa64jq
	3NFGKzCpr7TP4TsyilVI/ODJqUtP7F3h6aASIW3jFdm4g8T9vF/l42fRsFfWEozECHDSEM6/wGE
	UyFTIFMJRcNivztephd4GpdyrUWf0xLS8QjfFPw==
X-Google-Smtp-Source: AGHT+IETcrsjYwCLM636Rawh4C1Edyk5mMpZTeygu+Uh4izc5MQ1jPqvKnxvey37IVepiy1yULwOr9OxmlrE9kTvVmw=
X-Received: by 2002:a0d:ea4d:0:b0:61b:138c:5357 with SMTP id
 00721157ae682-622af87e4fbmr109080817b3.19.1715801618714; Wed, 15 May 2024
 12:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <200d273a83906a68a1c4a9298c415980737be811.1715781469.git.geert+renesas@glider.be>
In-Reply-To: <200d273a83906a68a1c4a9298c415980737be811.1715781469.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 May 2024 21:33:27 +0200
Message-ID: <CACRpkdZhU=+ZaCw2rmuN2=tCDXWppRtNsfLjfjD505aFJ_Xo2A@mail.gmail.com>
Subject: Re: [PATCH] ARM: Fix userspace enter on LPAE with CC_OPTIMIZE_FOR_SIZE=y
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Kees Cook <keescook@chromium.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 4:02=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Booting an LPAE-enabled kernel built with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> fails when starting userspace:
>
>     Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000=
0004
>     CPU: 1 PID: 1 Comm: init Tainted: G        W        N 6.9.0-rc1-koels=
ch-00004-g7af5b901e847 #1930
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     Call trace:
>      unwind_backtrace from show_stack+0x10/0x14
>      show_stack from dump_stack_lvl+0x78/0xa8
>      dump_stack_lvl from panic+0x118/0x398
>      panic from do_exit+0x1ec/0x938
>      do_exit from sys_exit_group+0x0/0x10
>     ---[ end Kernel panic - not syncing: Attempted to kill init!  exitcod=
e=3D0x00000004 ]---
>
> Add the missing memory clobber to cpu_set_ttbcr(), as suggested by
> Russell King.
>
> Force inlining of uaccess_save_and_enable(), as suggested by Ard
> Biesheuvel.
>
> The latter fixes booting on Koelsch.
>
> Fixes: 7af5b901e84743c6 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0 pa=
ge table walks disablement")
> Closes: https://lore.kernel.org/r/CAMuHMdWTAJcZ9BReWNhpmsgkOzQxLNb5OhNYxz=
xv6D5TSh2fwQ@mail.gmail.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for digging into this, both you and Ard! And we found the root
cause it seems.

Yours,
Linus Walleij


Return-Path: <linux-renesas-soc+bounces-15664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A06A824A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 14:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC1E67B506E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 12:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAF826562F;
	Wed,  9 Apr 2025 12:24:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD57625F782;
	Wed,  9 Apr 2025 12:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201488; cv=none; b=VZqNjvLxLmJ23gNcS6jguEVjZfHVNuYnWUjABt0ACIxeJ2aqwLOk0A3hdz3+9FOrS8XQdv2uoP5PmnhL+TXE1RL70bHmFsVwcpB1r2Rh4GtxmUle6B47OJjhmWMqMHbQHoQu+wJohWVx6Lw4P9/l6a/Z9mCFcJJpEgp9Kgb9HhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201488; c=relaxed/simple;
	bh=EukZBmk3v3ezsiFTo/LdufmPk53turSaEVF0ZzbhKWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G4MZj8WcgYZUzdml/Pvo24+T6GTgAEV+MWXZyPrEgoPq74FcKtw6Jt4SSa6QAvKaMlMPcQlegFef9EJE+Xi/Da+GRYQsSGFbBWRCP4MKMtu+QfX6+67HhafdwjlogP1sBZMlkHLn8GquoE0i17MSceR7jN2/eQk8aW0B1ps05Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5240317b3e0so2508086e0c.0;
        Wed, 09 Apr 2025 05:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744201483; x=1744806283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAy8bA0YlDyP92YSgmPxOzOKGXZiXV73ZeL4JjinSnE=;
        b=jqNYHA0AnZCMg1alRKclC7PIx44wl8Xt0sclPnNFwJDwmFmyWGUdIdtHqIUujKOwhw
         qi+jVjkdLYR208hfpPmckut54kjWckPbjlOAnhNKCbN3APqD+deZbUfsnIHPlNBBvKcI
         qeSU1y0IDxabs1yloj65jMp1uop2G4nbBVidBdkmyCMvxJQgDmCD43xsel/2AOrebN+g
         l4Ssyzk4n83xzMjwYKRZJPOBQlzEFBgAysp9qBglkjPpAttsiN+y3tfTcavhVXlUZ02u
         yYQYbv8WrGpPUOUcHQVATT6hYTQNIS4I7P/y3LyutNLMH+/RxYPCNZzCUCQcKBTINOjL
         4GZw==
X-Forwarded-Encrypted: i=1; AJvYcCU53BKZe9dO1W5fjfvCtbLm+DWwjBofBWiK48Mm+zRBaEmcn60ue3e6O52B/NhGdO2G/vfVqGuKZnzdXB8=@vger.kernel.org, AJvYcCW4m3z01lft2CtHqitTlNHDXuZ68VYD9Ho0nLr2J2lAHvTf6LgYHjMLHWNUv2EodtKqz7rWMehBisi+a2JTfATSPfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQx4KC+pVp2UUh4zGsLTSW17EMb+N8cvDrhH4u+cTDfFgABL0C
	Y4bMJHyXC+Sn0oyUoVqCBk+T4cWmGsfKDzglPVSmgOEGwbk4d3UJ63jtiXibkKI=
X-Gm-Gg: ASbGncvIMZPOZTjO5BEZvFiNIfmdpelj8O/G/KJ9HwSaZhWwjl0XCA/9lu6lfONana0
	+BgrlPfMc9ikY11y+uOd3vMv/GkJg7hRe+zGC8yz1nE3esi2qMLGR3IMn+iqw86/ESKCYQDd6b7
	6bVdrojKJGfZ+asSUltQETKjy59cpuMQKuF5VrPrCsZ0jcu7zeujkcOfAw1uuj2Ay7qM8KKJIN8
	V8T6YMszNw5BUlACviSt1anRS9x06JwtmU3NWZnU+0bYBIOcuYzk7tnR7lN88WoX/x/VvKIrG26
	2tURlYAV+f7iXJxtHxUnO92gc50J2FEonPAKBhotLBCdp1bOwd2bdUEfagvpwYLpgzO9cdgFZiO
	Dyol4brU=
X-Google-Smtp-Source: AGHT+IFy7FNtJfsK/QweTb8vlkPxrnZ/jD7WoQ+1XHufLjM44NufoVEMmCUkoqiDWH3E78NeaXAKvQ==
X-Received: by 2002:a05:6122:d10:b0:520:51a4:b81c with SMTP id 71dfb90a1353d-527a921d717mr1485211e0c.6.1744201483633;
        Wed, 09 Apr 2025 05:24:43 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4cde2sm181770e0c.10.2025.04.09.05.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:24:43 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5259327a93bso2973372e0c.2;
        Wed, 09 Apr 2025 05:24:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkkE1f/MhOxmoPUDwHWDxA+oKWcTy5wbn3tPXqaesKLXmnCEvym7nJXEoQ9TwLMnXByuVrnVMJrOVqcbkqKCfdXOI=@vger.kernel.org, AJvYcCXN+AtU5ZwJgRpRYvcULd+CiBVaKjF0QxVKtg7fbYDcU8CJ53N2LVHybSvWMdsghPrX/V15+rkxCiUrP9c=@vger.kernel.org
X-Received: by 2002:a05:6102:5789:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4c9c41d70f4mr2245717137.15.1744201482657; Wed, 09 Apr 2025
 05:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250401090133.68146-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250401090133.68146-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:24:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbv=ianPwWAUGLjbaZsPzb15TpF3NU5r1o_yALgOQ7Lw@mail.gmail.com>
X-Gm-Features: ATxdqUH5mdFS5u57CgHVhU_OTQk1snKaw6dEmMP86vWw-ROcRNgQWa_pBvQh_X8
Message-ID: <CAMuHMdUbv=ianPwWAUGLjbaZsPzb15TpF3NU5r1o_yALgOQ7Lw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: defconfig: Remove individual Renesas SoC entries
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 11:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove explicit entries for individual Renesas SoCs from the defconfig
> file.  Since all Renesas SoCs are enabled by default when ARCH_RENESAS
> is selected, and ARCH_RENESAS is already enabled in the defconfig,
> listing them separately is redundant.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


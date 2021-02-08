Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA459313FC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 21:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbhBHUBS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 15:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235938AbhBHUBG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 15:01:06 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE11C061786
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Feb 2021 12:00:21 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id f16so237322wmq.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Feb 2021 12:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NQnuO19tXUGZtiOr3UoH1N95z+Bg7lJLf0mHTpRwuhk=;
        b=w5+AHwTRPQjCJGhAGhBihp8G2gsJZVchXK0Ijm5r5vRYXT5MQ1pbxD+oTeJfOqmhQ+
         +OPqSRXt8JYJIXR35hu9XnOu2OBl/x+0Xv35FVL1s/fTyMuTagNLnz5XJ32ZJ4ki+e0F
         g06YhoofFr9E3SJ749C+OvWvyi2WxleREJGiU/sMQ0q9RPVq1Jy03zb2D54kkVmHb1Eo
         ElMvnmJjrjvzlkLDRgUC4IDPZIG5EcrkcHP3+ofDObKWaDPtOB2D1oPOphC0kJ1eLhQW
         jEEV5udISceWinltSkZNMqmtocJin7GAWFXM72xIEv+29PbPvlLhJcDOwTdxWZw3jom0
         Vl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NQnuO19tXUGZtiOr3UoH1N95z+Bg7lJLf0mHTpRwuhk=;
        b=rHrpqPN+nNeVnqA7Q6hus6J5P8KoMKHxYRVEBKbAICnZsLi+uYmAQVCW0i+XkSqmbe
         tSx17PFcpbhaC4ebkzXqa7IR1wRUpP+WQzFVXjf2woLy2i2dcHO9XIDtdfQrzoEAEhXZ
         B/9zXCOvZk8+IPPCBvQs89FUBBmxpWy9VERXm13YW++9RsXJ6Kt42z3aWYhtFe3C28tG
         onayF8Gf6CAyjngRmdtZ/8LIHzck5kreFf2GXTB4B+945G0Be0mVXEEBdDthngCRedCl
         GeKrEl6zqFn+C69q4dZK6g0ubayrULHjU8OweMACVfC0GqI/9RZma8JyY7VxZVxcLELd
         MHMg==
X-Gm-Message-State: AOAM532A13QxJijIVQGsrcRF5eVxQ8qUog9Vdrc+VtmV7oYT8n+jCcOY
        dd5jyimLqkSIVOOFq4mJlJfVtw==
X-Google-Smtp-Source: ABdhPJzT28JKGy0yKjWvWUjpl1Tt70h1fxGn4tZWExmkjYQLjchw+NHGUVrkgY1fQU0i9AQ8M9jznw==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr395683wmc.162.1612814419892;
        Mon, 08 Feb 2021 12:00:19 -0800 (PST)
Received: from localhost (p4fca2458.dip0.t-ipconnect.de. [79.202.36.88])
        by smtp.gmail.com with ESMTPSA id r12sm31735470wrp.13.2021.02.08.12.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 12:00:19 -0800 (PST)
Date:   Mon, 8 Feb 2021 21:00:17 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 0/6] ARM: r8a73a4: Add SMP support
Message-ID: <YCGYURws+hObRzlz@bismarck.dyn.berto.se>
References: <20210204135409.1652604-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204135409.1652604-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2021-02-04 14:54:03 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This RFC patch series leverages the existing APMU support for R-Car Gen2
> and RZ/G1 SoCs to enable SMP support on R-Mobile APE6.  This allows me
> to enjoy the 4 Cortex-A15 CPU cores on the APE6-EVM development board.
> The core APE6-specific code was lifted from an old series by Magnus[1].

I'm also able to enjoy the 4 Cortex-A15 CPU cores, nice :-)

Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> Known issues:
>   - While initial secondary CPU bring-up during boot works, CPU cores
>     fail to come online after offlining/onlining them using the sysfs
>     interface ("echo [01] > /sys/*/*/cpu/cpu[0-9]*{off,on}line").
> 
>   - This breaks detection of the CFI FLASH.  I traced this back to
>     setting the SBAR_BAREN bit in the SYSC.CA15BAR register.
>     Presumably this affects the LBSC in some way?
> 
> To do:
>   - Call into rmobile-sysc instead of hardcoding the SYSC mapping,
>   - Describe CCI-400 in DT and call cci_enable_port_by_index()?
>   - Let pm-rcar-gen2.c call into rcar-rst instead of hardcoding the RST
>     mapping,
>   - Abstract SYSC vs. RST access and merge with pm-rcar-gen2.c?

Some of these to do's sounds rather fun and educational. If you have 
something you want done that is not time critical and does not require a 
100h time investment I would be happy to help out.

> 
> Questions:
>   - Do we want to bring up the Cortex-A7 cores, too? We don't on R-Car
>     H2 neither.
> 
> Thanks for your comments!
> 
> [1] [PATCH 00/02] ARM: shmobile: Initial r8a73a4 APMU SMP code
>     https://lore.kernel.org/linux-arm-kernel/20130807225531.9856.18974.sendpatchset@w520/
> 
> Geert Uytterhoeven (6):
>   soc: renesas: Introduce RENESAS_APMU Kconfig option
>   dt-bindings: power: renesas,apmu: Document R-Mobile APE6 support
>   ARM: dts: r8a73a4: Add secondary CPU nodes
>   ARM: dts: r8a73a4: Add Media RAM for SMP jump stub
>   ARM: dts: r8a73a4: Add APMU nodes
>   [WIP] ARM: shmobile: r8a73a4: Add SMP support
> 
>  .../bindings/power/renesas,apmu.yaml          |   6 +-
>  arch/arm/boot/dts/r8a73a4.dtsi                |  96 +++++++++++
>  arch/arm/mach-shmobile/Makefile               |   6 +-
>  arch/arm/mach-shmobile/platsmp-apmu.c         |  15 +-
>  arch/arm/mach-shmobile/pm-r8a73a4.c           | 152 ++++++++++++++++++
>  arch/arm/mach-shmobile/r8a73a4.h              |   7 +
>  drivers/soc/renesas/Kconfig                   |   5 +
>  7 files changed, 281 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm/mach-shmobile/pm-r8a73a4.c
>  create mode 100644 arch/arm/mach-shmobile/r8a73a4.h
> 
> -- 
> 2.25.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Regards,
Niklas Söderlund

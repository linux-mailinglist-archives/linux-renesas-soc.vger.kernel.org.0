Return-Path: <linux-renesas-soc+bounces-19805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDBB16F3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 12:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CA9E58141D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 10:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E5D19066D;
	Thu, 31 Jul 2025 10:13:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BEA2A8C1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753956822; cv=none; b=rN+CwEjjF6c6tAEsinhJgR4uV8s+Fp1sXwpzJNBjllA36kz5mBgJ2kwX8CjG8IuZ8a0ZcoRUjb3EUdcatBAUtOOcB2hSIXLYJ20orQNLQkpmAZsBky1JcUdv3ltRhfh6e079yvZKgMOi8AdOsAX1WgUpeyO+rbJdqS5JHatyVnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753956822; c=relaxed/simple;
	bh=/t27z0OBAi/T8KZ39M+BuAgSr22SME295d4gqsq7MPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7JPaZ9xtHLyg6p+/KLAeORPtD5ZxECuHG7e79NTI9OGycGvc8KyMAeBz9/JTv2NKC2arG4qhCcBh+ZjJYZ3gzR5gJaTWYgt40rh3UVoNF3zvi7GsIW1eU3FF8GwDAe/nB+m5a3fiRtAm4+QDwBS3srql1SEZcEaxzs7NbcjnLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5347686c12cso256651e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 03:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753956819; x=1754561619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6euOUc1ORsmNipCPoDVBH9wZPlLLkrItqJoQMu6yWKU=;
        b=UFSLzOBlWqs38BcQCWRxDA+y2TAjzMgCOWI5cuaviVnX+2PIdEFDVHzmJikCvovScV
         5hPGA/+wGS8JGZ5J0OyBr8rRa1cYfRIQ2u4ddm8N0FLsfAeZJUS2+9rRT2HTESypftyH
         arGJdMjaEimkURKk7eq5yP5N5vteEnd59tuSlLS6+t/8monmWT5mVYvTPcxjrH47SO6e
         +bOz/0NzMz62aFLtL4wqiEtkjBWTuhsvfXfVG6BMkcH8rT2HqZ9OpXZ/VjZfhSMANg2Y
         LYNbhYdrLwivk87iCa6gPFTpo3J67nHCHC2JjRI1kwh4qeKlBK7f1wVyIZR9cHVZAs7+
         PfnA==
X-Gm-Message-State: AOJu0YwBU5h0KVEeVnS34lA/Y0KAcb57fj4DYkXMKxjQ0huSGIfTOGDw
	zSBBdoI/BHyOZfdNGHI3Oy6k11jdo9U2Wyqj9k/aiCEeTI8vMeI6n7Q5WvQd/7kc
X-Gm-Gg: ASbGncv1BgUUQfYQGNzXxicY537DEqH25b4ddr3alSM1jm8xdGSl3XoLkEwZlAlc6XT
	GWv7wX83ceR4DCimk7zMLMrD6ENF7bXLaarbv+m2VBWrSh5s6vs+XbS553Num59/FH2Xjcpr2ZF
	BDP8d/3VSb2J2SVQMbU03mXhDTGl6aH5KcfYRKl3kX943VW0Xqma62Pi+74gVQJPpBSI5LwF+yG
	W+QU+gZMqUbpWEIg/IjG7rz4G0ADoNKNIFn8d4TPnqjUPGNMTBWkA+dHwGy46VqG6cnEzixzFhF
	wfOkhtZJDfFE+biRSgcwzj9KlxOzmovzkBEY2R2Vh4OOm4JvHbSPVr8cxP0v8wIB7BgRVkrQYrk
	NTQK07Z1cYB4wwKxsUpzLNXxLt/HjZY/aIUVzdJ0Z0WyV+Ay7rqjvlLY6DYZx
X-Google-Smtp-Source: AGHT+IFsEwijHR4/RmYaJUKYGaJg7JCfk5OjY/I5peBhptZxFvyQP1K/x/BN9v8ox240vxI0AqtSyg==
X-Received: by 2002:a05:6122:d98:b0:539:1154:d12d with SMTP id 71dfb90a1353d-5391cfe5b70mr3947303e0c.8.1753956818871;
        Thu, 31 Jul 2025 03:13:38 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936d14c1csm291824e0c.29.2025.07.31.03.13.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 03:13:38 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-88bd5f7e43cso189929241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Jul 2025 03:13:38 -0700 (PDT)
X-Received: by 2002:a05:6102:3e86:b0:4f9:d929:8558 with SMTP id
 ada2fe7eead31-4fbe7f5a8ecmr3974756137.10.1753956818443; Thu, 31 Jul 2025
 03:13:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ple33aar.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ple33aar.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Jul 2025 12:13:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrfGE0+D=1qNMCkupaotZjYHi+X=LU=Lp7You3VpzLxA@mail.gmail.com>
X-Gm-Features: Ac12FXxcjTIVtUbsQtHQ7af9EjUMWEfRmA_JfOO4O514CPUS7DM2S_VTDOdeXtw
Message-ID: <CAMuHMdXrfGE0+D=1qNMCkupaotZjYHi+X=LU=Lp7You3VpzLxA@mail.gmail.com>
Subject: Re: [PATCH v2] soc: renesas: Identify R-Car X5H
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Duy Nguyen <duy.nguyen.rh@renesas.com>, 
	Huy Bui <huy.bui.wm@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Mon, 14 Jul 2025 at 02:06, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Duy Nguyen <duy.nguyen.rh@renesas.com>
>
> Add support for identifying the R-Car X5H SoC.
>
> [Kuninori: tidyup for upstreaming]
>
> Signed-off-by: Duy Nguyen <duy.nguyen.rh@renesas.com>
> Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -39,6 +39,10 @@ config ARCH_RCAR_GEN4
>         bool
>         select ARCH_RCAR_GEN3
>
> +config ARCH_RCAR_GEN5
> +       bool
> +       select ARCH_RCAR_GEN4

Note that this transitively enables four drivers:

        select RENESAS_IRQC
        select RST_RCAR
        select SYS_SUPPORTS_SH_CMT
        select SYS_SUPPORTS_SH_TMU

R-Car X5H does have INTC-EX, CMT, and TMU, so enabling their drivers
is fine.
The registers to read the mode pins (the main functionality of the
RST_RCAR driver) have been moved to a separate block (Operating Mode
(OpeMode)) on R-Car X5H, so my first thought was to drop the RST_RCAR
select.  Fortunately OpeMode shares register space with the Reset
Controller (RTSC) block, so we can keep that select.

> +
>  config ARCH_RMOBILE
>         bool
>         select PM

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -36,6 +36,11 @@ static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
>         .name   = "R-Car Gen4",
>  };
>
> +static const struct renesas_family fam_rcar_gen5 __initconst __maybe_unused = {
> +       .name   = "R-Car Gen5",
> +       .reg    = 0xfff00044,           /* PRR (Product Register) */

Please no hardcoded register addresses for new (DT-only) platforms
(especially if they don't seem to be correct?).
I can drop this line while applying.

> +};
> +
>  static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
>         .name   = "R-Mobile",
>         .reg    = 0xe600101c,           /* CCCR (Common Chip Code Register) */

> @@ -378,6 +388,9 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
>  #ifdef CONFIG_ARCH_R8A779H0
>         { .compatible = "renesas,r8a779h0",     .data = &soc_rcar_v4m },
>  #endif
> +#ifdef CONFIG_ARCH_R8A78000
> +       { .compatible = "renesas,r8a78000",     .data = &soc_rcar_x5h },

scripts/checkpatch.pl:

WARNING: DT compatible string "renesas,r8a78000" appears un-documented
-- check ./Documentation/devicetree/bindings/

> +#endif
>  #ifdef CONFIG_ARCH_R9A07G043
>  #ifdef CONFIG_RISCV
>         { .compatible = "renesas,r9a07g043",    .data = &soc_rz_five },

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


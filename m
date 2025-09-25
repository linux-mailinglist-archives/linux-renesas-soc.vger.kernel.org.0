Return-Path: <linux-renesas-soc+bounces-22379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB5B9FDDC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 16:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F7AF384ADC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 14:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A3C2BD58C;
	Thu, 25 Sep 2025 14:06:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE352857E0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809167; cv=none; b=ut4Zfn3lHbShaZMui5oPpMV7Vsccngz48nDQZBNQDjarPosnKluWd+LsHrykx1+jCde/7TWeuUmewJL3gO3sEXipD8DoJsIMJZ5dyCE3e+wbpfes4gXeDNVaqkuKLbXIkG63arY/Aat2cp2vQWwrJfK84Y+a6Ws15QXa2eU/Apg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809167; c=relaxed/simple;
	bh=J7k8E3Wi1IFScxwNyQM5lJzKmLF1V/K7HCgU5OX1KFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmXroZSaVkhFcnkhNB9meVSKImnFwSnJ0ZKs7NfB1DixQoaOBGKe1XJ9phryNxrcwIK/q8jdalm1QD9C+/H/80sa/moKehTHA+rchpTKYVHPhpJhrrf5dYc3JiIAKPX22myZrZumSUwV2I0LSP1CXK3wi/QDeomckbidnSjIJBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d6014810fso9186007b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 07:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758809164; x=1759413964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fyBko9NuawFAoJizts1IaQaWq9Mvf+zq3p4god2H9Zk=;
        b=vTjSj8lA5NuUQPhmiPr7d1s7tjB/4csv5j13ojSGCooV+ZEgUmuKBDyHCElSc95Alw
         AuRXMPcZmuO1EZynrp0FGAXwGY30gkw0pfIAvFT0p5hLjTvr/Cb5rt1LyANE8zTrPJpE
         mKudHGavoq8fCVIWGN7Vhq5gCVoif4H9ay9jRp+ZalP5AfGePt68qQ1LDBe4nd13Zf3H
         eJ5fkHDl+aEhQWd153oCOuK9l6dfCXsH1ZLjyzEXJvw8rjMp5pd8XSlZQhAebshbg8po
         82+E7kURZIe+dAactkmq/SwCRAud2XWpGot6242wruXpuUguWg3hO7CaNSqrp58CX8Ot
         Jrnw==
X-Forwarded-Encrypted: i=1; AJvYcCUfUwqY7uAsmjM/quh0Qx+qjuVYPdPSt10g3VEdB3qqzbGs5T6yGKEXTx0CNes2Zel5NXLChXZiXNs+zyIgCOTZTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjuGKsr0XjvIk1vTQGl/uZMrxGwF2tbXB7AcQiqhE6tMhFKTTp
	1XJzWLY/k4Y8KYW/gT/sOH/7EobFRc5fFo8wxZnHUQB3q7E3QraX74brI29nF1to
X-Gm-Gg: ASbGncs7y3E4n/YZMcDTiqyE05u3cfGwwG7Pz1e9qdgyNdLFYqRE/JIenJZ3wIhxsuW
	QohrmDn8HyWXZ27Vsp0zY1no5/RXB4usS35YsoE7JVAFQ4GWHX5srSNRPQBpvvjx7yzAw2etd+N
	QDv5DjVNZr+KQnwnSArGl65lk8xRAoaW1h1x046FpIF/neZ+6kW4wwV5GpYNGKNUGnsfmhC22cH
	5lsOxQN8EpIoRKJ/pIqPF1DKG+mIHP6a4V6jT6fk1mz63LojgSv4MUiPyM2fujH/orheueWmC2U
	TaOgA8GE5o5f4wLSjvgy2oBbpWXFb3gel8zMaPXDMZUw6YZeiSRbB2EKQE1pB95sIupmKXBo4nq
	qUWVPSHXEC3r3H9FAkEZZGhXtoWRNo43eyzhENIDPfShE9hlkDf812/H2U4l6
X-Google-Smtp-Source: AGHT+IE8enrZSUVn2lKq5znwr7JLv+3tDYWu4hIkT1CiHGahy17VbSVCBm2t4ND5X0YzuytfQMkSEw==
X-Received: by 2002:a81:8ac2:0:b0:75e:28f2:15cf with SMTP id 00721157ae682-76406af1d83mr20636167b3.43.1758809163631;
        Thu, 25 Sep 2025 07:06:03 -0700 (PDT)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com. [74.125.224.54])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-765be47f630sm5053677b3.29.2025.09.25.07.06.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 07:06:03 -0700 (PDT)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-635355713d9so585134d50.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 07:06:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAYQglAE6CwRoFwmYzHuJHrncq3/OinLYoXPYGs27ZDUk3Jy6kArqGmKm1gWRCEvOLSkvr5z2+iSKhL185Fq2ZsA==@vger.kernel.org
X-Received: by 2002:a05:690e:2508:b0:635:4ecd:75a4 with SMTP id
 956f58d0204a3-6361a8ad38amr1661690d50.50.1758809162976; Thu, 25 Sep 2025
 07:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922074101.2067014-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250922074101.2067014-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 16:05:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV62NUeEYyYgf4LJ2JQLwA-fAzYyA-cy9h_nyYKmtB=1g@mail.gmail.com>
X-Gm-Features: AS18NWBJtjZrCNfYPLsxhmfIYghndnkMeon1y_B0eZWh3VVqWEWRBUD8QBWzeB8
Message-ID: <CAMuHMdV62NUeEYyYgf4LJ2JQLwA-fAzYyA-cy9h_nyYKmtB=1g@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rz-sysc: Populate readable_reg/writeable_reg
 in regmap config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Mon, 22 Sept 2025 at 09:41, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Not all system controller registers are accessible from Linux. Accessing
> such registers generates synchronous external abort. Populate the
> readable_reg and writeable_reg members of the regmap config to inform the
> regmap core which registers can be accessed. The list will need to be
> updated whenever new system controller functionality is exported through
> regmap.
>
> Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/r9a08g045-sysc.c
> +++ b/drivers/soc/renesas/r9a08g045-sysc.c
> @@ -6,10 +6,14 @@
>   */
>
>  #include <linux/bits.h>
> +#include <linux/device.h>
>  #include <linux/init.h>
>
>  #include "rz-sysc.h"
>
> +#define SYS_USB_PWRRDY         0xd70
> +#define SYS_PCIE_RST_RSM_B     0xd74
> +
>  static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initconst = {
>         .family = "RZ/G3S",
>         .id = 0x85e0447,
> @@ -18,7 +22,20 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
>         .specific_id_mask = GENMASK(27, 0),
>  };
>
> +static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       case SYS_USB_PWRRDY:
> +       case SYS_PCIE_RST_RSM_B:

Given upstream has already support for RZ/G3S Ethernet, it may be wise
to add the GEther0/1 Config Registers at 0x380/0x390, too.  That way
you avoid a possible future hard dependency and regression when adding
support for configuring that register from the Ethernet driver.
The same is true for RZ/G3E, RZ/V2H, and RZ/V2N.

> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
>  const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
>         .soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
> +       .readable_reg = rzg3s_regmap_readable_reg,
> +       .writeable_reg = rzg3s_regmap_readable_reg,
>         .max_register = 0xe20,
>  };

> --- a/drivers/soc/renesas/r9a09g056-sys.c
> +++ b/drivers/soc/renesas/r9a09g056-sys.c
> @@ -70,6 +70,13 @@ static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initco
>         .print_id = rzv2n_sys_print_id,
>  };
>
> +static bool rzv2n_regmap_readable_reg(struct device *dev, unsigned int reg)
> +{
> +       return false;

I would already add the TRU trimming registers, also for RZ/V2H, as
they can probably just reuse the RZ/G3E TSU driver.

> +}
> +
>  const struct rz_sysc_init_data rzv2n_sys_init_data = {
>         .soc_id_init_data = &rzv2n_sys_soc_id_init_data,
> +       .readable_reg = rzv2n_regmap_readable_reg,
> +       .writeable_reg = rzv2n_regmap_readable_reg,

Oops, this one does not have ".max_register = 0x170c" yet.
Does this cause any ill effects that warrant an urgent fix?

>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


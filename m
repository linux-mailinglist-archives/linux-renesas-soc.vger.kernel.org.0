Return-Path: <linux-renesas-soc+bounces-19962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E47B19F96
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 12:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB427189A4AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 10:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DFE246766;
	Mon,  4 Aug 2025 10:18:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D691F30BB;
	Mon,  4 Aug 2025 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754302732; cv=none; b=iU6laKDbM7michA1cBffo0+TCWpHXbdw7jCaSmEUFqm0ZThimHWrUnzdmdTSyu9UTmOosCZ4CTv5Wjssm1712mURUJXrct+1wCNr/NW17YgsQocu2W/y5EN2aUQhqVg9/DIrdQtVR3WqGmoS/7Zb2tn07nPdkcVoYpWGsLNlktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754302732; c=relaxed/simple;
	bh=Edyu03zA6kX+GZ7JETsugqJG7N+ZD74ozJ+ugckD4MA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fcntZCT/XxrLRN6RqvVbWKt+OrOjG9F63Se0LksdZzKF4hJRHZPTyIzmURgTUWhHYq10sYozSJ/ykUBlDYi3khiSmt8egWZUapGxJsA4uzAyR11vNnZeFRW/AW4vhgAKhhtl6/ipbAPdKVOjvhlt1Gv+UITOizN5/D6XFFp1XWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4fe7dd45935so653251137.1;
        Mon, 04 Aug 2025 03:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754302729; x=1754907529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=me5NB77V8+KG1kUND+GKU1clCy+piwMeUvhbeEFZ+hs=;
        b=KRpBTfKl3W67siRJqerDXADsxd/NyHBwJqAL2wcI5IquAj1U9RAZaXKRKubhO4d7JK
         rGStzLOCh8AhEJO4rvHdnCK2+aCy4gHdV3ao2aJaaCNSzboQaw4+p+x+ZNzDzxM/3aUd
         xz7L5JOBcifZNYBtOFIeFAjBbytKQjlP/t09WjEVucd9XV6cUkvSF7NeuJoI9gDCixBN
         5+QX+wwXo6jeCDl+7ZZr33dgViiKGITvN1vQeHvVz7WiwT/DlpZ7FeMHYB/LZXIbj9uK
         Fx+ndVi+EU2pCI+ri4r6pNEyFZXgcN2DLIMvzyoYUDh1LMLQCuRX/3Z7GlJRrQ7PhpZa
         Vi3A==
X-Forwarded-Encrypted: i=1; AJvYcCV2Y9Ro17HM3gWUV6Y+vCp4/QkoYmQQf0yAfj2UKT823LdcmnbDQrJWyk0xkDxFfWPF7qbC8VWMzN9UdpQ8@vger.kernel.org, AJvYcCVUEM0ztFuUc4QXNy06HCJz7X49qIvpWY6Vm7/Fg0qGBmL4keRHrFYV4XwM7GtAiTM7ghxCopUZa08=@vger.kernel.org, AJvYcCVr9xyS3i+SSYXdtr919KTUL/Qs6sOxrcHLspXVy43sIDWWdTHxXB2cCY6YSC/+D/ueV7hA/dlGFEX1lXUbKghyVXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdy5xXdFPeAfi9j7dOpGTgFsUPc95KdK9dRPNpC49hneyYK+ln
	tt5L4uSJfa5sGrAVLJL8qLDaWHSxVd1yU5PnD2v42BA9KZLqPCnEuVkn/msu1Yfz
X-Gm-Gg: ASbGncvqyNyv/gk8JUkdRPLM3z3QIk1IyMKaZyya78p+eEcd0A/P2NTdh9q4nXGmF8K
	uvvuPUxMLqJ5ZggThVtmKvrHjIIRREgCFKCoE33pNx2Xov7e6G9Xw02TGxROArC+zZnH3oqyk8D
	lSerrJnwOm9xil6PxscUseEy2Oe1xPPeBRiL7hBM1sFKNhPAq37RBn9NoSBln3JoAXRnMi9HHM7
	IfLBbXDAJmSRH/3DH5kybTFmv/cAKGYdAHQBCgfiAlnWKfmQD7LojlotLxKStTZb6YHVwjdOdhx
	zETDDNpvcGsqqwxuwKSur0EMA/BQG/rrGAU4B+yRrWthgNcbDFjsxFtiww34X7apEdSMDDp189m
	HvyrAxVzX8Iue2/DZj0x3Ati/bOaGSovaR3YJuld0dYn9F63yTecplRopdiVPzv32
X-Google-Smtp-Source: AGHT+IFxKt0wgqrsY8GDR81DIOnEv/4vwImKHsGIHI+ClZ3eo1oqBBOkWtv/g+S7stILZap31OwqIQ==
X-Received: by 2002:a05:6102:54aa:b0:4fd:3b67:4572 with SMTP id ada2fe7eead31-4fdc3638538mr3004472137.15.1754302729312;
        Mon, 04 Aug 2025 03:18:49 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d1c4b98sm2226630137.3.2025.08.04.03.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 03:18:48 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-53924027b19so748042e0c.1;
        Mon, 04 Aug 2025 03:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcM68aJZJrRWtnWoxIX9tctKbaMRveQA7vDJAxv4lObwk4YtXijK+0qk1B8WtOK8NFO0AhmaKIh3U=@vger.kernel.org, AJvYcCWLSX4lKjXy7y7SKmutablISxJM6c7C83uZOuSTF/UUv3verkrQZI1R0AaNCld9fPcxUtfO/J0PiT/wvXTxEKZUS/E=@vger.kernel.org, AJvYcCXAVABbfzEVklRhBIoy2RLxBZI/YbmLzGBjx5DNl+lODMTo5EUoGscbrXKzZCeSz8+49yYArLlI6Hk2diOM@vger.kernel.org
X-Received: by 2002:a05:6122:1821:b0:538:dbd2:2ece with SMTP id
 71dfb90a1353d-5395f37e06emr3171358e0c.11.1754302728529; Mon, 04 Aug 2025
 03:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com> <20250704134328.3614317-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250704134328.3614317-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Aug 2025 12:18:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfGg6KfKt4dGf8NrboEPXF7fnq+dcM=sppYcgcq3csvw@mail.gmail.com>
X-Gm-Features: Ac12FXx7Vhm0XByKZa2yKekC1miTeBva5wEp_EGzUgpOPZHMtMsRux6QxliBBCY
Message-ID: <CAMuHMdXfGg6KfKt4dGf8NrboEPXF7fnq+dcM=sppYcgcq3csvw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 4 Jul 2025 at 15:43, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add MSTOP configuration for all the module clocks on the RZ/G2UL
> based SoCs (RZ/G2UL, RZ/V2L, RZ/Five).
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g043-cpg.c
> +++ b/drivers/clk/renesas/r9a07g043-cpg.c
>         DEF_MOD("canfd",        R9A07G043_CANFD_PCLK, R9A07G043_CLK_P0,
> -                               0x594, 0, 0),
> +                               0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
>         DEF_MOD("gpio",         R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
>                                 0x598, 0, 0),

MSTOP(BUS_PERI_CPU, BIT(6))?

>         DEF_MOD("adc_adclk",    R9A07G043_ADC_ADCLK, R9A07G043_CLK_TSU,
> -                               0x5a8, 0, 0),
> +                               0x5a8, 0, MSTOP(BUS_MCPU2, BIT(14))),

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-20017-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D436BB1C139
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 09:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C6693AA980
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 07:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B341218ABD;
	Wed,  6 Aug 2025 07:23:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612DA20468E;
	Wed,  6 Aug 2025 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754465016; cv=none; b=siIkUjcOjuanyccTSLqC/8J5FfpkZr3uL3DJoudXEfQm7REbZs26/cKIZLun3fNeorW27eaOokkpi+tQSfoaikp8xOEHTt6sCszXe/m12Cw+PKf0172HSv13mNCIL3Q0DszEHExenXzsjcmJlfEwJqa/67gbtcd2VdKsr9NEaew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754465016; c=relaxed/simple;
	bh=1OVyFYazBy3mTM8/c+XNOQe3WMA6ge1WFFWKQ/xYlZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8QX8VMKfwR2Np6I3ggEP0/287NS/5hJ4K/xZ3Ksh6gp1OI2PJg6bKn+XiK+5tFUPf8TdU1tmMlV75PPdW39ZEnXHfRCkxAd/2vx2WYTCRdHmlAcTk6GgtN0Kj3hfn3K+agvwd1OiqwuB61d/C+bpNVOdTcRy4x8QRb3a2EFTWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5397d436dccso468531e0c.0;
        Wed, 06 Aug 2025 00:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754465013; x=1755069813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4U2w+uPhhyU65gDrWXjb3OuYMWWeBivIWfKA+Zrllo=;
        b=HiSWpNn+K9gJ6eLj8rArfr11CwYtgg+GLD0tXT3VaSyRx13UGoZREKBGEcn1rWNaw6
         qJ/9jVLuOqWNPpGI095EM5wW7A3xFqBnf4lBmMTpkFK8ni/51lep2PuL2WwDI7U/TvDh
         JePEpIj9RqWJHy4dPyoyBwli4oEWSZ1/0jUbMCjU2YVQY7yKelU6/p2b/LT7+5thj89X
         Ru4+DCRHIcUMjsVzxMHyp1udJuASO/jK36JvxIZKaEV/BVPQwLPi4E6HyCXtJAlVadVt
         FOMDahIz2rYvFP+A8lV+i407/HNeW1gtZaaYjU1yqFToFyDEqhWXCS1setUuPdY68j50
         O0pw==
X-Forwarded-Encrypted: i=1; AJvYcCV2nCh1/GCA5uKFdumGeZKWXhi5LVdm8ypA7SUDORHc7RTR6+GnYt34aooHcaZUVXasAtCKzzC9kX86yDyi@vger.kernel.org, AJvYcCVKVKe2j9nYJ3Kn9BfiV8xXl/GRs5bkPExVv/3O8ZXD+aq3uVNqWLl8UsouWZZfDW9rKnEe4v+ay/8=@vger.kernel.org, AJvYcCXSV3L6s53W8lUgijLfgr6wIKFg9YDSeHWeSCysDzi2TVtdvZXxspvakyWvQGDxTIOeNpKwfVxguFetNZ5lM6OVPWc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1l61OobDetg5NhbU5mAhY9i0G1EaSwGW5YjtYKM3/4jxXLPqL
	gemc4aWFLm6oqV/f1Pk0Wl2xqUqTd6vv5rWJE7+ki+/nzLDDp3F2TYrdzJz9N2DE
X-Gm-Gg: ASbGncs1bennhTAY5Fn9m3bME/fa0t2fXNEyROkted1LwI+vlNoqZR27jIW2Eb0lDwn
	fymDQ03iFzZu5xFwd/GSyWMoR14k2PokKiHiLqs+NqTCsigZDdc3FQ4mqkPqurbeGxfnN+aS6mU
	a5R58FD6eS4MM0vfO28kPLjqiTg+cDRaT0MWRGHJX1XR35Sul8ft4AE9fJmWn4TfHB44X4Vv5Nr
	PfgvXxwi7xIFkATEEDgVLIcRxMqAPWiOL1IztGNhtjYFcniqzNV6ghbJo8W+SWxrpWj9YJCd9rH
	44ZJTV69iXLGBHsUwsQ5EK2xYOUWp+Tx5YI9vK2li6gvxJAF45aUNdIGsrTkhFz/8FAErBKCicx
	5hXgz/9l3nTJLBNVMfNHLj9dVVABtODzjY1A1B7Tcpg+WOHx5y8T6uA9CeVVwUPzirIzga4M=
X-Google-Smtp-Source: AGHT+IEtgekKqLdZjGLYkHtKNHJtdy5thVPa5+DmTXiYUsY4o8KtBtFsjYPvkVy+EUDYLo4VJrWYEw==
X-Received: by 2002:a05:6122:550:b0:539:299c:8696 with SMTP id 71dfb90a1353d-539a053ab8fmr750788e0c.7.1754465012964;
        Wed, 06 Aug 2025 00:23:32 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b9a5a2sm4077870e0c.15.2025.08.06.00.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 00:23:32 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4febcc4c93dso606590137.0;
        Wed, 06 Aug 2025 00:23:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm0+JefOhsf+iopOJjkZD/v6H/AgSshi85lrb8gxudbFIl7v1aSw+Xc/I7Q6kYpxYs5A+7Og3U+ZKFKqUpQHHuqAs=@vger.kernel.org, AJvYcCWOQ5KJJS96YV99vOL/2wBIJaiCAKgU4A3r3AQNEqzEQ5cDUqk/gu1QYyYv4waDsvtP7br/VA7XNUQ=@vger.kernel.org, AJvYcCXII3R6c0pkDdT3f91WNuDcVqEMgjugkzyvMDa4rZwe7dbPDpgQuTXBhuxJkKdf9Q37wO50+7rVxETzhYOD@vger.kernel.org
X-Received: by 2002:a05:6102:83c2:10b0:4fa:a2f:a20c with SMTP id
 ada2fe7eead31-50367dc2f8dmr500893137.2.1754465012482; Wed, 06 Aug 2025
 00:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704134328.3614317-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXGvNgv9hGhcr5MhTL+X_E2f-2kz2NEqhG1fw_dBC0uBA@mail.gmail.com> <eb7241f5-4b52-4fac-8cb8-07d4a9958cdb@tuxon.dev>
In-Reply-To: <eb7241f5-4b52-4fac-8cb8-07d4a9958cdb@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 09:23:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJNxX3d=Dj5+h6wZQ9Y1-V+U78FMT6LaM_LJf6YdPqhg@mail.gmail.com>
X-Gm-Features: Ac12FXyKnGfs0K0HI-Sbkbogug-3vtG8ZPLLVk1-NlaaIU7ehkdb1fCmLDkckJo
Message-ID: <CAMuHMdVJNxX3d=Dj5+h6wZQ9Y1-V+U78FMT6LaM_LJf6YdPqhg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a07g044: Add MSTOP for RZ/G2L
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 5 Aug 2025 at 21:18, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 04.08.2025 13:00, Geert Uytterhoeven wrote:
> > On Fri, 4 Jul 2025 at 15:43, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Add MSTOP configuration for all the module clocks on the RZ/G2L
> >> based SoCs (RZ/G2L, RZ/G2LC).
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> >> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> >> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> >> @@ -242,163 +242,163 @@ static const struct {
> >>  } mod_clks = {
> >>         .common = {
> >
> >>                 DEF_MOD("gpu_clk",      R9A07G044_GPU_CLK, R9A07G044_CLK_G,
> >> -                                       0x558, 0, 0),
> >> +                                       0x558, 0, MSTOP(BUS_REG1, BIT(4))),
> >>                 DEF_MOD("gpu_axi_clk",  R9A07G044_GPU_AXI_CLK, R9A07G044_CLK_P1,
> >>                                         0x558, 1, 0),
> >>                 DEF_MOD("gpu_ace_clk",  R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
> >>                                         0x558, 2, 0),
> >
> > Perhaps these two should have "MSTOP(BUS_REG1, BIT(4))", too?
>
> According to table "Table 42.3 Registers for Module Standby Mode" only bit
> 0 of CPG_CLKON_3DGE maps to bit 4 of CPG_BUS_REG1_MSTOP. There are no hints

Oh, I had completely forgotten about that table, and only looked at the
*_MSTOP register descriptions.

> in the description of CPG_BUS_REG1_MSTOP neither in the description of
> CPG_CLKON_3DGE registers that leads to having bit 4 of CPG_BUS_REG1_MSTOP
> for AXI or ACE clocks as well.

I just found it strange that the AXI or ACE clocks would be the only
clocks without corresponding *_MSTOP bits...

> I tried to play with MSTOP and clocks at runtime to see if there is any
> relation b/w them but can't establish something.

> From software point of view I can add it, it doesn't harm. With this,
> please let me know if you prefer to have it.

OK, then leave it out.

> >>                 DEF_MOD("canfd",        R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
> >> -                                       0x594, 0, 0),
> >> +                                       0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
> >>                 DEF_MOD("gpio",         R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
> >>                                         0x598, 0, 0),
> >
> > "MSTOP(BUS_PERI_CPU, BIT(6))"?
>
> That was a good catch, thank you!
>
> I played with it at runtime and it seems it should be here. It is not
> present in table "Table 42.3 Registers for Module Standby Mode" either. It
> is also valid for RZ/G3S so I'll add it there, too.

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


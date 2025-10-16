Return-Path: <linux-renesas-soc+bounces-23138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E70EBE2B51
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 12:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 380B334FF1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A4A31C567;
	Thu, 16 Oct 2025 10:15:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405716132F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609714; cv=none; b=CgxmRIV+lRE7kBWC/RkUXsCZBRvenutQ/tv0JZ+OtvtXANn96aLKavZY7L9d0D2TArYflvUTIbRQlGAcfSjfiS53D58S7ZU5XKYnyFY03EGDpJqhtZdBFBkPoEPr8kD67Xd0GykimWpRa9DaaUXJxdCTu+BqOwoZ0WTlP2mm1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609714; c=relaxed/simple;
	bh=8cCj+GODfBXSF8iqNuGUn/XEi7QecPxCp94is9hsjrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewwEsc6oPxLsIX3qJgsiVMJjGXe63nlN74Vwa2wOflGqjDMb/hYpdtsNAsqbKeNGPvHNTmjM0yEFh7N1Oj/FpW4NHP+GPOqcJ+AkO9bWhmiJIVOwuLsJPb4J8Cq7eTKB+rFDI8RVBSKQAYLdfRlq/lmLq3kQ9lYc0yVfN46DYK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-930ff50d181so366730241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 03:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609710; x=1761214510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r1WKEJk9GAlT5x9p34JfYLH5DFWeYxL1lhRGvXGKo5M=;
        b=uZXBEGNMer13yayGuv4uQQXVzXwOJKQVOkFNqkLzPtpGzX7vEeR48Ta6uWwD2XRrto
         pfm3IqBRxpAki3S85rIl6QxgRDe34ewAHSMm5La4BhDI8UO7aIC0BOvsTDf4D76bgpu9
         DTZH44jNGShADFJ9IORFnnmos2C4qZa2muAwd0iafcPPGgCqC7lwVBaTbBID4rN4dqid
         6hpa3V/nIYlcRTQMQ86STSAj1OeKx2Y9zYMSmeTgIGj+wU9QR3S0+4yZ1SxaHpsC/Rki
         4YmXSDFRfUMZFyqUqH51D/QR8HHDHduUGlzxvpKY9w6S8pN1xfZTLyUkeGH3ehRHIEF1
         DrGw==
X-Forwarded-Encrypted: i=1; AJvYcCUyTxr5QpIXwKc94SZv4aMPb+1XNugKm++svdsDqO6NOlb2zlA9+AffwX1VPB3UL5b89VgqSrKSBHuDbFPb9aO2QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx59ITYxN844clsn4aNq07T1Ts+8yuPpTS8i4Z4DRg6eZvE7k6A
	jdaE13WGFbrBEwgRB/c5cZS7tZBakInmfWAHLiTVWSZpZxuvqGMsJ46Hf/ds/Z3+
X-Gm-Gg: ASbGnctz4MTGr9E18xHpQMxMBiCC1MPzHfmUj+YAVjedzKP7352oKLicqFEmlkFyu0l
	3YVT2BB/F0bqngOSrkrlUK3GXqTbYU3Mo4v2lfZCkn9QTblxhJlWJCVIen0MrK73BpnrO4Ch0yL
	e1izaHfu1igXCIOStdkD5HflEEucy271knbK6fx+cFN5uvubwbSSQcMXRjZu193La7xMbD/Ln8U
	9qDTundCUvsxlIhHRBj/YjQgXBxB2Pr5IspBBCil6mnxYLaHq5a6CrXaOy60FGZm103k3Wiz0/F
	p6Tkoul13eBk70BhD2am4Wkyabi2xTk++a2cBZB9wHYjInGNmR8yb+LQ7N1uJjXCEVomlhd3+d7
	wzitrB+rIcUdBmf9tHkzIoqb9XyqPSRkgfzI2jwWbtoLJDhqMK0eXlE2J+gTy2MjAZs8AnobXEZ
	7GIR7kUXtJScXZRziraWNhkTzph9s0j0AI/KXdz/0GIUviLsXN
X-Google-Smtp-Source: AGHT+IH98hazkaIEv1aIA3n+angBMfWuMpXH1uxqpG1zdJNCEpTLrDqvvEJx7MuQp9zwAwEqatjDVg==
X-Received: by 2002:a05:6102:324e:20b0:4fb:de9e:6d87 with SMTP id ada2fe7eead31-5d5ed2f9a49mr9201687137.11.1760609710273;
        Thu, 16 Oct 2025 03:15:10 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc8b1650sm6283434137.10.2025.10.16.03.15.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 03:15:09 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5c7fda918feso477759137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 03:15:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvuIU9hoQIfh4fTgK/VPsTLPj6HxuDNhSV6Hd859ckm3bwoIgIBNc8tYYSR3nXl19kfhtDEmyvdnIZi1GOlCH+0Q==@vger.kernel.org
X-Received: by 2002:a05:6102:1516:b0:59d:2396:18fb with SMTP id
 ada2fe7eead31-5d5e23abc8bmr12255783137.25.1760609708606; Thu, 16 Oct 2025
 03:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org> <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
In-Reply-To: <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 12:14:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
X-Gm-Features: AS18NWDOKj2jdUygVapjf0YY-lv6XkkQZ-xgi_PclRkP3UIDiy1yQHHau3vXzwU
Message-ID: <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 16 Oct 2025 at 11:48, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/25 10:22 AM, Geert Uytterhoeven wrote:
> >> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> >> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
> >>                          resets = <&cpg 408>;
> >>                  };
> >>
> >> +               gpu: gpu@fd000000 {
> >> +                       compatible = "renesas,r8a7796-gpu",
> >> +                                    "img,img-gx6250",
> >> +                                    "img,img-rogue";
> >> +                       reg = <0 0xfd000000 0 0x40000>;
> >> +                       interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks = <&cpg CPG_CORE R8A7796_CLK_ZG>,
> >> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
> >> +                                <&cpg CPG_MOD 112>;
> >> +                       clock-names = "core", "mem", "sys";
> >> +                       power-domains = <&sysc R8A7796_PD_3DG_A>,
> >> +                                       <&sysc R8A7796_PD_3DG_B>;
> >> +                       power-domain-names = "a", "b";
> >> +                       resets = <&cpg 112>;
> >
> > status = "disabled"; ?
>
> The GPU is always present in the SoC, similar to IPMMU/GIC/DMA/VSP/...

These are special, as they are linked from other devices.
And everything needs the GIC.

> which are also never disabled, do we want to disable the GPU by default
> and enable per-board ?

Yes please. We do the same with renesas,*-mali GPU nodes.
The board may not even have graphical output.
Or do you envision using the GPU for more general and headless operation?

> I would argue the GPU should be enabled by default, so the GPU driver
> can do a proper power management of the GPU. If firmware is missing, at
> least power it off on failed probe, if nothing else.

The *_PD_3DG_* domains are powered down anyway when unused.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


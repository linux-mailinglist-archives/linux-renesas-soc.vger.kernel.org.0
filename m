Return-Path: <linux-renesas-soc+bounces-23140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E483BE2DBF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 12:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC6FE4FB9A9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C262E06EF;
	Thu, 16 Oct 2025 10:40:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962322DA769
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611249; cv=none; b=Qeebf0wu2IltcQMaOBeDJOvd/m4Mskpa7N+d4EopQsXg0iIBc/yr3L4avfNLkRQ340S82bm2miYwfEC2hfyvoQBkcCQPKJ6Y9jppFSHiLIkeGsmBB/z7d4zIr10Yep6uTBl1VCEvtV6nPF3X0huFioXO6FN8tuwfEGf/o7y/qoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611249; c=relaxed/simple;
	bh=piuGvvOfHYKguiEZW7O40NVeDxi8MR4Ntno3Ky8oHBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPxhF8YOVh86DiD9LT5RgWFuwAGRkR/Qesf0Mlb/tyebD/TE8CER8K26pckg/JFN/5KbeJ9XhPRmQwQSThJUN2GLumMUS7OYoJgtuw/BySmpQF48woI5OpvY0MjrYIEbTAzPiZp08IeELAiprvT7C6L5eeub3Wm8Xjjktd/NXL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5a2b3bb803bso285626137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 03:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760611245; x=1761216045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knJGO9EraQPquYGUUvWl6Sq1Kcv7y9Q9RdqSweYlpKs=;
        b=TgNj0UTtusk1IrWGOPkDDrtgX2vSEsssZ2n/FE2WCY/6uLIc2I24pV4AN01gYb3NH5
         c/laWG6GNJPHl2ZOGaLhEFeYT4e1sdOaNF2/yHxc8BgCyVl6ZnLbQoPmOvAG2rkhOWVp
         o5jDxNchJzhCsIagaYctddV7jdZIlpW6SCglHLW0tuRjsyK0A4CoL/5oIY0S4rtVAOR6
         0BuZUfvhniOZblIzbl90Vhn+woIq+Z2fCLVsbA1Ml3bwSdpGmL629aEk5uzAVoJNBlER
         Omd1FwBkWIUEx10D+/SHdd3LNR+EExRNuNubrXrwYYrwI7Y/o0WzTSg1/S6GtYgTMIlF
         7xUg==
X-Forwarded-Encrypted: i=1; AJvYcCUA2QZD3KLUVeq8tsaqn3NM7sUgSf4vD14lNfcsMtqT+giot3yCvfVhY4Vp5EBlasV1Ly0Kvd7M+t8HI/qyOhhe9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhag1bnMnF5Cf3IZqMyOTkhUv5eUmSSV15+NC6vx3gvZucAmuo
	c1GrPERQv8nlXs2tWmkC5xvvMYmcxao8jodmkX/xlnMlffr2mfev8KSnQg4cnOU8
X-Gm-Gg: ASbGncvUoVn4hyuHT+ocDKD4HOknaRnLPIzVJNrSf/EwCjcMWX90EOH8AZ+Ad2Y62xF
	bDdVTiwu67X8ySEZJo0A+OHU1UsUDgfR580e5xYE0S7Zw3GipNPq6B86R9k4ekdud4irQSs2Dw4
	l7HrHaG+OoFYd1YBvjJU7y769A2X5u0Vdf+OvRIwEt86T8OJai5YI+ElRoMIP8K4fVu4OMm2O5I
	2nkT9syhOvFII+tEVJHrDGom4YvfT5lAevtg9QOudpAlmVP8Pj8mklikdeld0tGI1HofvtJlGtR
	cQLtudhvcqgrsYstlBAvuNGiPZptH//jDOkBs9Z335HAv4pEadQRurgsOnEGI2Y23WpZH0kPGjW
	U2o9ew+XTGIns5t7p/RzFtfWIP1G8qeDmSmDczo4c51MnMMFMBUVm+mGbjnpI448YG4khT9ptqp
	k93BO1F2cujpCgXpyI6gEVrLQ84ACsPxHa1xEDBw==
X-Google-Smtp-Source: AGHT+IGuNYo1iNottPnKpCPrZP47+AKdIS9Tm3if2QZV0iBlVM/Bo4nu/Wg5ktBpBPPY+OtwuN0pfg==
X-Received: by 2002:a05:6102:621c:10b0:5d5:f786:1eb4 with SMTP id ada2fe7eead31-5d5f78621d2mr7462414137.13.1760611245243;
        Thu, 16 Oct 2025 03:40:45 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf6b1248sm5206582241.2.2025.10.16.03.40.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 03:40:44 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5a2b3bb803bso285614137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Oct 2025 03:40:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLzQoc0ZPayHaXdV8+ekumOuvJiWocvbtevcT96yVWImrYZcLZ0eA/h+r1pDP8eZw/pxBpyHcIUbIvslztk9nwEg==@vger.kernel.org
X-Received: by 2002:a05:6102:c8b:b0:5d5:f6ae:38ff with SMTP id
 ada2fe7eead31-5d5f6ae3e01mr10107830137.44.1760611244201; Thu, 16 Oct 2025
 03:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
 <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com> <bcdc9a86-bda1-4646-9ccc-1dc00a710b44@ideasonboard.com>
In-Reply-To: <bcdc9a86-bda1-4646-9ccc-1dc00a710b44@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 12:40:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDuuXncX4sbd6oa+8KcS8x+1Sp-ahmvyh8fRdQt1GqKA@mail.gmail.com>
X-Gm-Features: AS18NWBFQD_sktM9PiZ_iC8uRHAPFwDek8zekF1FbFM9hBNLqZ_UopO9JosomNU
Message-ID: <CAMuHMdUDuuXncX4sbd6oa+8KcS8x+1Sp-ahmvyh8fRdQt1GqKA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Thu, 16 Oct 2025 at 12:23, Dan Scally <dan.scally@ideasonboard.com> wrote:
> On 15/10/2025 13:32, Geert Uytterhoeven wrote:
> > On Fri, 10 Oct 2025 at 13:11, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> >> Enable the eth0 node and define its phy.
> >>
> >> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >
> >> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> >> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> >> @@ -50,6 +51,33 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
> >>          };
> >>   };
> >>
> >> +&eth0 {
> >> +       pinctrl-0 = <&eth0_pins>;
> >> +       pinctrl-names = "default";
> >> +       phy-handle = <&phy3>;
> >> +       phy-mode = "rgmii-id";
> >> +       status = "okay";
> >> +};
> >> +
> >> +&mdio0 {
> >> +       phy3: ethernet-phy@3 {
> >> +               compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
> >
> > The first compatible value corresponds to a Micrel KSZ9031 Ethernet
> > PHY, but according to the block diagram and the picture in the Kakip
> > H/W Quick Reference, the board has a Microchip LAN8830 instead?
>
> Ah, my bad...I thought it was the same as the EVK so I copied from there. I think then that this
> should be "ethernet-phy-id0022.1652" (based on reading PHY registers 2 and 3 with phytool) and the
> other properties look to be KSZ9031 specific so I'll drop them and re-send

Hmm, include/linux/micrel_phy.h has:

    #define PHY_ID_LAN8841          0x00221650

drivers/net/phy/microchip.c has:

    .phy_id         = 0x0007c132,
    [...]
    .name           = "Microchip LAN88xx",

I haven't found the ID in the LAN8830 datasheet yet, it seems to be
buried deep...

Which PHY is actually mounted on the board you have?
Can you inspect it visually?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


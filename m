Return-Path: <linux-renesas-soc+bounces-12895-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88AA2A514
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F48C7A132A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9C2225A25;
	Thu,  6 Feb 2025 09:49:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809841FDE08;
	Thu,  6 Feb 2025 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835346; cv=none; b=OxGRtzOuLcebmCCkDgB6bnTahf+la5+ypyNeG55+yPIMlFxeq+O9avH5TyxAzj0nZzhy+eRyKoqA4fhVcoiXVCmAF4SCq3bU9QONvPU2mD+pz0YtcHc4UDWAOrZm6SxXg4lNgnhz7VW/rEipfoP7CT9Ymx/VQGT/mo9itCrS1F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835346; c=relaxed/simple;
	bh=FsPnVnRoEYQiom1l4c28DGoECNy1jPyUiOufEmO4w7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5cxllopE2snJtmnjjBaOktS9ykYJWS7KZLGUdjF+bJeoXS+6lCalueLgOrW1pk8yOf4aParLXpQ0n1PvVRrrNy28aeSF+KoL4pkd+sL44TllvItPuatmFZRl0I7gRoL89WlJ6l/L3sv3XJCliLlXzteiHMNu3zIgbr1kewSpjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so178521241.1;
        Thu, 06 Feb 2025 01:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738835343; x=1739440143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFRGrTuirsiDrVdpOVwOJVhyhVOPdLn+lTu9rWG4x2g=;
        b=a1bsv+ZvKJ16p7kqtuWy6wupjq/cRo3R/GmU3qfnhUlH8wCc/XSbSFyWOtcrwPEIpf
         SXn0UrxVVn6ewz9tXL6gM3FOcRrQdbLthd6GX/hbaIZ3xT9Ksm8shvICIY1IdoXq+u8o
         UXHDg25R9q1S1WJmxLnuSz62M3pwPH+5gfY690WBIdqDdH8PClT4uTSsrrw9IZ5Ow8ZR
         Oui8J6Xy5PwnNTZYf1NDIBjiqrjpYaF7fww5dY0BFjbJyMbe0fx/q9KhR0luSsm67qZx
         R5stJ9j9tAeTIbQRPAEOGhENLQejmT1wMhWcNFLy3yjmyCcGs4trL3Ck+pNjPIAGEXez
         utQA==
X-Forwarded-Encrypted: i=1; AJvYcCW5gD8hAUO4NelHyMbGkgxNLX3kHptPoYDElPHcLmp4qTh4lhUfnWfzv5txviqKv84mEpHtMdE2pjFxhBwJ4CkzV2s=@vger.kernel.org, AJvYcCX/3zQ+bcP0+8p6siDmjtmocUKM/SFwSMAkwDR8ezQ52ZZa3rTsJJZVCC0J6EQrxOd0sWXy5wEcA8+M@vger.kernel.org
X-Gm-Message-State: AOJu0YydJoSZZxQG+3hXL1IH0p6fHZR1D0YcMRVHq3qzGJwefCsDMC8Y
	RrhUFmcBlkZ9/m44HlFq1P2Tb8afbt+3B5CwWHJwrckd/ZpJW/942HMXSi3B
X-Gm-Gg: ASbGncvhzEyzh8nSQXnrl6vBy0S1jPoBqQ44Ac6vELgxJ7Ab/BXYMv8gAGr1txdehK1
	vd8r02FloAz7JlPfgBTzY/DBefIGvQvAiRScx0/23xbcyBzWnwe3e+R0PCTWmiG6wBhQVvqOuTx
	Uv3iHQqOJ08sHPGabHI79pJe4fDhMRzuQYt3p7UUN/mJIQmUTy/rFmn48STzia5JkVcEXQtIzMt
	6io6E2w58S7S1bYRuvXdOpsfL9vqRGnuLw5kjYPPXFUU/Je4xl1DKPUSrfi3i6q+OSa3iNDvgM9
	OZ5H9vcZlo0dSzYDP+WAN7Na+sld9y1VZSLfiGsr2PmpiYChXtItWw==
X-Google-Smtp-Source: AGHT+IH1qAnnmG0K1yflRsexMaRQ0XHGoqNr2EXHJ8rsM9sPFgDZg094X0cSl/tUQi/5HrbHIdT9lA==
X-Received: by 2002:a05:6102:3e20:b0:4b2:9eeb:518f with SMTP id ada2fe7eead31-4ba478be07bmr3967965137.10.1738835343083;
        Thu, 06 Feb 2025 01:49:03 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f968dc33sm160112241.16.2025.02.06.01.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:49:02 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-8641bc78952so179924241.0;
        Thu, 06 Feb 2025 01:49:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNwIXlf02M8vhRYvb2jH22ouHGMNmHAlIr6C2zT8aotCb9PDmOyLARPiHC+CeQ8fKfsd8Fnx/9uLHEEodkFczL54g=@vger.kernel.org, AJvYcCUR2NhJge4rXTkaHPROUYPv3E0fWOAfSJjx1UOlQOcXYK4OQR+M9GIsZ8/8v3XulddiNr7w+nqjvlnQ@vger.kernel.org
X-Received: by 2002:a05:6102:3c95:b0:4b2:9f20:51d3 with SMTP id
 ada2fe7eead31-4ba46b617e2mr4400900137.0.1738835342627; Thu, 06 Feb 2025
 01:49:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com> <20250131112429.119882-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250131112429.119882-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 10:48:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWDQ5F69B8HHA+e=0AtGFwaods4oAfsDdEx63KP0-HRow@mail.gmail.com>
X-Gm-Features: AWEUYZlxDiGcphS3ACC4lAFFyl7qotBgDe8xpGU8aIo09k_MgthDZXx4aye02SY
Message-ID: <CAMuHMdWDQ5F69B8HHA+e=0AtGFwaods4oAfsDdEx63KP0-HRow@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 31 Jan 2025 at 12:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable eMMC on SDHI0 and SD on SDHI2 on RZ/G3E SMARC SoM.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi

>
> +&pinctrl {
> +       sdhi0_emmc_pins: sd0emmc {

sdhi0_emmc_pins: sd0-emmc {

> +               sd0-emmc-ctrl {

and drop the "-emmc" here and below, to align with sd0-usd in the next patch.

> +                       pins = "SD0CLK", "SD0CMD";
> +                       renesas,output-impedance = <3>;
> +               };
> +
> +               sd0-emmc-data {
> +                       pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3",
> +                              "SD0DAT4", "SD0DAT5", "SD0DAT6", "SD0DAT7";
> +                       renesas,output-impedance = <3>;
> +               };
> +
> +               sd0-emmc-rst {
> +                       pins = "SD0RSTN";
> +                       renesas,output-impedance = <3>;
> +               };
> +       };
> +


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


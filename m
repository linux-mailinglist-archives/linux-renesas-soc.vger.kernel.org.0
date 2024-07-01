Return-Path: <linux-renesas-soc+bounces-6949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D966591E2D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 16:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16D2A1C20F59
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 14:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61611607BC;
	Mon,  1 Jul 2024 14:53:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5516C69B;
	Mon,  1 Jul 2024 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845582; cv=none; b=O+YVrDDo5Fw/ezIrWsM0Bj4WMSHTWiIuLT5036hf/losv1Ped+GDhp9wxfpeuYX7FJS2+IldNHX2dSDWGr98GMIbQPOUYxCI/oWipzyF5mwDiJ37d91IjTJCEXv2kiCLIgH0st0NnPl/+VhEMIM1NiYG6YNn0arXT8ZbrywRUAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845582; c=relaxed/simple;
	bh=RaEIqBBBlZwZlnjhe9HMUAgwkqCYxlvq/qn3lRGk0AI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMj8G6ETcMRTnLFby2oAQFomsm0yzIc25xStZCZjHk5Em9X7Yl16yZezc1UDRfmh/u4H+4ddo7drxEO2ar/xrRj3iS3XXirt+y3B4ASYnZPJKW2oPvxq93l2fz/yb5Q357l2fftSPMoUsw7v2utF3cY3fDi1a7FsxXkmHmwfyms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64b3655297aso26164857b3.1;
        Mon, 01 Jul 2024 07:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719845578; x=1720450378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP79SDf92bXt2zdoUqVmmj1x8MHK+bQSYpGd6rxMW4U=;
        b=FLlqBcGcsF3p9BflE1IcgxxurI/q/y9ocGLZj7+1vizZEz6j2I6CeiOVCavQtvLyqQ
         JG1N2s2XemE5S+HaAwXY4JaxcQOhQIZLPS/Ks4qCAh8Il9ks0OX21al1txVXQfEsmO8x
         hmM1SwTr9IpPFjglTTzLycJvUWlaSJMb3/xuqFiScbripzss4AH4y6JhtNdFF6DY9HuQ
         0g+U3/u/jxF7KuRNHcsjvvopCwdqHROQ+yoog5Qqben/SNJj5ZrfsJIw1RstS6H1gV15
         I9fJF2Oerp0ZaI98JcKhEFwB2UECj+yI7f9xQBybCLHGnAlc+753dSkscDQQmSPABzOk
         Q2yg==
X-Forwarded-Encrypted: i=1; AJvYcCXn4dhOfMBPWnC65gH42GNC1wVo8oUtGmFSwQPJh06Qz0VfD/IEPKGMPKQ+fdeSO/5rbVK2Z+FVO2Zuc8aClOs9TcDTEN/sqiC0elF/d1h6WOiPdTu0VxhkDJemAnKzE2VI3bJBqYjpA6WD7pYW
X-Gm-Message-State: AOJu0YzsSBNCMZhR0y2b4z3t4XSz1P5RdE74Zl7m/67tEU+aEwLmMn+P
	NxdzGKd8jjzKuUGJITSX/CEvKYP3WofmEyMg9h834xu+t//ZdAhXNMhSlOZ/
X-Google-Smtp-Source: AGHT+IGpxS/ktwqHyYltRFPP9PO97iHGpYLFQ2YKbyFhdKSiP1eRUpfBd0nDOefdzZYma43POaKekw==
X-Received: by 2002:a05:690c:a9e:b0:620:3c10:527a with SMTP id 00721157ae682-64c7268293fmr79021017b3.15.1719845578234;
        Mon, 01 Jul 2024 07:52:58 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a99c71a76sm13983287b3.10.2024.07.01.07.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 07:52:57 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-64b3655297aso26164447b3.1;
        Mon, 01 Jul 2024 07:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWlp2YCYQ3LH7EUS33VYC53XU93UvcvvfWbAGRsEF4PTjR92gOAilcMlCvOmgFsjhNg8EbXGpEl61VtLR5IUl2walW0WJhIi8/jCykjHEDGPsQj1kLUjutvYZI+rAN9bkdX1ZIgshvLJDuxRsx
X-Received: by 2002:a05:690c:d82:b0:62f:2553:d3b3 with SMTP id
 00721157ae682-64c72c4b3a3mr64194377b3.29.1719845577668; Mon, 01 Jul 2024
 07:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630034649.173229-1-marex@denx.de>
In-Reply-To: <20240630034649.173229-1-marex@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jul 2024 16:52:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUMFA-ESPfCbQiddc-Q5bLHaCpMk6fZAf48Aucdg79kGw@mail.gmail.com>
Message-ID: <CAMuHMdUMFA-ESPfCbQiddc-Q5bLHaCpMk6fZAf48Aucdg79kGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, 
	kernel@dh-electronics.com, kernel test robot <lkp@intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Thanks for your patch!

On Sun, Jun 30, 2024 at 5:47=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
> The rtl82xx DT bindings do not require ethernet-phy-ieee802.3-c22
> as the fallback compatible string. There are fewer users of the

Why not?

> Realtek PHY compatible string with fallback compatible string than
> there are users without fallback compatible string, so drop the
> fallback compatible string from the few remaining users:

Ah, the self-fulfilling collection of patches ;-)

Let's move the discussion to the actual patch that causes this
https://lore.kernel.org/all/20240625184359.153423-1-marex@denx.de/

> $ git grep -ho ethernet-phy-id001c....... | sort | uniq -c
>       1 ethernet-phy-id001c.c816",
>       2 ethernet-phy-id001c.c915",
>       2 ethernet-phy-id001c.c915";
>       5 ethernet-phy-id001c.c916",
>      13 ethernet-phy-id001c.c916";
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406290316.YvZdvLxu-lkp@i=
ntel.com/

Hmm, nothing about r7s9210-rza2mevb in that report.

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Khuong Dinh <khuong@os.amperecomputing.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> Note: this closes only part of the report

Please do not use the "Closes" tag if it does not fix everything in
the report. "Link" (pointing to the correct report!) is fine, though.

> --- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
> +++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
> @@ -95,8 +95,7 @@ &ether1 {
>         renesas,no-ether-link;
>         phy-handle =3D <&phy1>;
>         phy1: ethernet-phy@1 {
> -               compatible =3D "ethernet-phy-id001c.c816",
> -                            "ethernet-phy-ieee802.3-c22";
> +               compatible =3D "ethernet-phy-id001c.c816";
>                 reg =3D <0>;
>         };
>  };

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


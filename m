Return-Path: <linux-renesas-soc+bounces-6965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D33923159
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 10:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B492C1F228A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 08:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F2D148847;
	Tue,  2 Jul 2024 08:38:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A41184D39;
	Tue,  2 Jul 2024 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719909512; cv=none; b=OmmP7UM+UhSyXojkD28BEjQ4ScBSFihdSNSCX5C5odawyIN2Psr/bORW3+WJHJWjhHWApDZLd5TzYSi2kyNNBXUWQqyemIp8y8TnquSTvvLgfEXUAyPSOkHc2GwCSD3bQi3h6bffKOJGyOzHbVFThkeYyvcypqIOhAdy4yK4L1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719909512; c=relaxed/simple;
	bh=vQ9vLXsfwASIoBg2fxWzWGeiniYjEW7nyL0C9c6NUMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HevontxGVBrRVGblk0TrwW/pKC9uvZTSMP+76F6BUNHzxL7p4gvawaAuV0VEIrTgnb6jF2B8isTcAiHnGF5eFzCU8TmdTkgm8FlpXBgE5avev8p+9lxRj0cKsurTfRM6wdcCsfD2/Ts6qP5FYJENW2B8ylBkynRrxzb1owfED/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63bca6db118so33955067b3.3;
        Tue, 02 Jul 2024 01:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719909508; x=1720514308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJs76TMyqu/aCK2/4OBJFyZhYlLSVaD5cm918jLLMMI=;
        b=GiGfOjyMCiJPw5uBvD4Vqu2mZMXwOACQDSbovGVIK0USkVnfa2XxyTTfhs5CP6YJQs
         MJ9dSw/LSLLI8a2sNC2+9RATdNnOO6v7M9ELK4ZFdCZFk53eZHJ0RvyBa9+DAaPV776q
         jgk7BP7aCxRsoKhP4EZXQz/fhwycNvEz92PIm4ZIaMjK/LFfdaJXx9Ugq705LGBpl020
         CeTf4iMHFMwyu2ezCq3D1FyEOS0lvhkYLi6FbKiTf5oAlaoGwTXCP9td5Cb+qS+aCGDz
         9Gi00U4FODgNlXbZItOY1U+vyVUM2I4umRwwZsk3yVrApsS7K2uquiVguLT/hiNe3p7w
         P+ew==
X-Forwarded-Encrypted: i=1; AJvYcCWjy0D6++tj63KwW/tAGHLnvdQ+PFN4hglwXXweeHTQFWAVp3iom/Ox7r4E1YOA3kRyq8Dk4g0BQUkA/IS9F/9QP4AgYlTBcAp/0HQ3QvSJy7n9Snn3jNlTL3wPN2NU9QJeOzLGBU0tAlQJt+bt
X-Gm-Message-State: AOJu0Yxb5QIt6mhq+PxR/M5GGO2vaEcyef6KktbyKH1lKDwUHE/7Yctu
	/xdHHQM8IJoNAzwz64o9TL+vdJeyde5T3S2K9uVVmRBUl67ZbEj11aoGA6fV
X-Google-Smtp-Source: AGHT+IFXxWcW0C2ZfL+1Nf7mlIxiJYCvTnMh943f0+x74uNF10/v5e5LS0HqF6gyYEUOkoyvtTGxyQ==
X-Received: by 2002:a81:9154:0:b0:64a:5443:7cbd with SMTP id 00721157ae682-64c71cd9d5amr79892027b3.25.1719909507805;
        Tue, 02 Jul 2024 01:38:27 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9ba5a289sm17292877b3.79.2024.07.02.01.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 01:38:27 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-63bca6db118so33954457b3.3;
        Tue, 02 Jul 2024 01:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4tHhhc3GaLMCvCkx/q87+zBTguRjXRZgMFVYyKiMjTZ2c6rB6J0SH9LOONXNjgXyimJy2s8Pkn5vqK9oqXcri439iOENugpoAtv0E/p+tszNgO+8Q/PamWmArOQphdg6q0lsnhhfgnKUW2EZO
X-Received: by 2002:a0d:e942:0:b0:63c:486a:289e with SMTP id
 00721157ae682-64c72f39767mr78961877b3.32.1719909506702; Tue, 02 Jul 2024
 01:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240630034649.173229-1-marex@denx.de> <20240630034649.173229-2-marex@denx.de>
In-Reply-To: <20240630034649.173229-2-marex@denx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jul 2024 10:38:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
Message-ID: <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
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

On Sun, Jun 30, 2024 at 5:47=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
> The rtl82xx DT bindings do not require ethernet-phy-ieee802.3-c22
> as the fallback compatible string. There are fewer users of the
> Realtek PHY compatible string with fallback compatible string than
> there are users without fallback compatible string, so drop the
> fallback compatible string from the few remaining users:
>
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
> Signed-off-by: Marek Vasut <marex@denx.de>

Thanks for your patch!

> Note: this closes only part of the report

In that case you should use a Link: instead of a Closes: tag?

> --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> @@ -22,8 +22,7 @@ &avb {
>         status =3D "okay";
>
>         phy0: ethernet-phy@0 {
> -               compatible =3D "ethernet-phy-id001c.c915",
> -                            "ethernet-phy-ieee802.3-c22";
> +               compatible =3D "ethernet-phy-id001c.c915";
>                 reg =3D <0>;
>                 interrupt-parent =3D <&gpio2>;
>                 interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;

What about moving the PHYs inside an mdio subnode, and removing the
compatible properties instead? That would protect against different
board revisions using different PHYs or PHY revisions.

According to Niklas[1], using an mdio subnode cancels the original
reason (failure to identify the PHY in reset state after unbind/rebind
or kexec) for adding the compatible values[2].

[1] https://lore.kernel.org/linux-renesas-soc/20240625171445.GF3655345@ragn=
atech.se
[2] commit d45ba2a5f718346e ("arm64: dts: renesas: Add compatible
     properties to RTL8211E Ethernet PHYs").

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


Return-Path: <linux-renesas-soc+bounces-15831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B385AA857EA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 11:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B1F07B8073
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09F2293462;
	Fri, 11 Apr 2025 09:21:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB1020DD47;
	Fri, 11 Apr 2025 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744363317; cv=none; b=BTJHid8bxA84GJl9cRZqc+HpzsmK2B96VhGLqr85zRVZ5ON9N+Zp+yq84lM7D/YURFROo25JNkIpnQjK7ppwFDPMdhRDbx2XuQFjEt1jhLXkzsk7lYE5BPmKOjKz7ZfM3pSNedNvkOfbnjTpa1AL9YArLMTqwVPzRGZ5k7pzupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744363317; c=relaxed/simple;
	bh=H7Yw1Y+MOSxpjEofXf8iXk05fYTb8DcMUYFugSZjra4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OaotKwfViYAnTgnLLAHr9ZxKiIuw/JmKkmozeNILathTR/DWq9Wn9dySM9hJsd4vUm5xBWOQvCp73UGOjxPbxBxGYVYNKEVGAEBZyxkH9qex19ROvrCZjEb1tvy+4U827jWQi3xDh/ZO8qxLBVBw3uEk8zPoZclnSNhs4HXEvv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso730950241.2;
        Fri, 11 Apr 2025 02:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744363313; x=1744968113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjLovJ4FotWvKMcKNs8iHNd5SJQr6b+e5HVgXb4vKfU=;
        b=aewgs97vvOw4s15MxrCXzDSToXYHmrG1vkp/+wdRUXEZN1fhqxfoDy+T1IPdgnfyIv
         GVWyVjYFAl67S1nSuOoffiIBUKRh5M7VfLuN1WM2UO3cPq4wABRIbVVXa8VyfBd0KOmj
         FuXprRRshQerl1lW3B7kAjpeGD6BDaeoMxoOGZWdEAeuJPrwICzQoYCMmiLeetzzOCTs
         faXxM1f/R3iTmzmODsnaqBZCkn8fvfncuVv+YyHB4Uw58SVf3XdDNz1Al04n+WfC1rz7
         ghT162iVOZbNMnClgS2HJO5sMeVadX/AIAmzyEkK2VChD/flFeIvQ7RVgw8THx9inWCm
         egzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz5/CL6W3+7Nau/8gnLQF9eBn8m7YxPeyX1NHRceN9kDpD+abhvX4mylB8EoaOH9QWyIWopxcZYZrOpAKV@vger.kernel.org, AJvYcCVtXjhh+jlw+AQGxF5j+u5sM6W6A1OSyux5aYDvUiKm/1y96tDhprVvWeWbjZGnD0A1mPOfeLN3Eihd@vger.kernel.org, AJvYcCWwxF9D9ms2TsqUcu9Yi+Xdmahifh47z5VVNTdOAYtutJWSlwnHjO+rjf4tgzWwqnVvEabf9eRAk1vGNhobOfFfxps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5qoF8hjyC4nu6QKfqm93KsgxowIYW5gCW/GX6rFeNw8fFbyBY
	FTn8Bq/ECDOtzWeu8rekOcuw11lkirYt33d+02n93Wrc6VT6dBRX67Nn+20NtsM=
X-Gm-Gg: ASbGncucSkcIcWhT3+Yw1oY8IRbMRnUnvpqdGvPBy2et0+oTFfEYX5Ra3mhgSHsu2la
	S1K+1UPamZe3dz5/SVFznStj4KADPrEKu/i8IufBhrzgtnnVey+XF/3YunfNvnMgxFdQZ+yu/BX
	WEl+EfUX/z9LxB0KS32bN/z6JCvZROw2RHduYNREbbkWAsM4NiG4ogewK+hmb7NFPWoysNYdejF
	j5puan94PJiBHYUCc/oW8Xz1xvdlRaHDUS9X0qDAKgYnf+e0hVmv5Izh2dDTtQtx6hXui8HkSxx
	QTr8/7E83OiN2NLMBPJq8TAbf9n+s++2wRneEKOBoKjofKvXm4tZWtNxM+TmvbbCTEm8PVRCz6f
	z748sunc=
X-Google-Smtp-Source: AGHT+IGBldzpFtWbRutMGWHJJZ1hsiVNFLVVS31Km7HgboRxEvmb71xpKV3Xg7EMub/ZPmtVtTkVaw==
X-Received: by 2002:a05:6102:5799:b0:4bb:b589:9d95 with SMTP id ada2fe7eead31-4c9e4ec1211mr871940137.4.1744363313526;
        Fri, 11 Apr 2025 02:21:53 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-875572b2b05sm987524241.30.2025.04.11.02.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:21:52 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5241abb9761so797222e0c.1;
        Fri, 11 Apr 2025 02:21:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBz5j49tAbrFuDCaeD0r9yB3WMWzw1lvB0OD/S29kSiOMN/Z4kT3eSp6NDROGqr+7Ib3onCxnGowQP@vger.kernel.org, AJvYcCVKuK2Qdc67AF3ePAKYr0HQYeGu/i3Tx52h0biDGqKad40wIOb4meTPKvn8Juwe9T/Qip57FJNs2mt2OxEX@vger.kernel.org, AJvYcCXgk+xV1S37l8CnUUVwlv3gXBXt86JMz9llMufiawbgy2OPGsk77Q66Mt7uxNJ6KNIu/3h4rzX6h3FHGb575tdc4fA=@vger.kernel.org
X-Received: by 2002:a05:6102:3c86:b0:4c3:6393:83f4 with SMTP id
 ada2fe7eead31-4c9e4ec451dmr1055040137.2.1744363312253; Fri, 11 Apr 2025
 02:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com>
In-Reply-To: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 11:21:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVM66ni0opbUopt6mCPshoQzO5GPEUZDji39CxtkoFLSA@mail.gmail.com>
X-Gm-Features: ATxdqUGioLDnSMiE5yPECb8cIfInNUgx2SgYqp0ZkBBBnlY32ZnpAxNbFLtbXcM
Message-ID: <CAMuHMdVM66ni0opbUopt6mCPshoQzO5GPEUZDji39CxtkoFLSA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board device-tree
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 24 Mar 2025 at 15:51, Thomas Bonnefille
<thomas.bonnefille@bootlin.com> wrote:
> From: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
>
> The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since thi=
s
> configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-eb.
> It adds support for the 2 additional switch ports (port C and D) that are
> available on that board.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> [Thomas: move the DTS to the Renesas directory, declare the PHY LEDs]
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> This short series adds support for the RZ/N1 Expansion Board. This board
> is a carrier board on which a daughter board (either RZ/N1D or RZ/N1S)
> can be plugged. The device-tree that is added by this series enables the
> use to the 2 external switch ports that are present on this board.
> ---
> V4:
>  - Drop trailing whitespaces
>
> V3:
>  - Drop bindings commit as it was applied to master
>  - Move Makefile modification to arch/arm/boot/dts/renesas/Makefile
>  - Declare LEDs in PHY.
>  - Use the driver default LED configuration as there was no reason to
>    use a different one.

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the RZN1D-EB Board
> + *
> + * Copyright (C) 2023 Schneider-Electric
> + *
> + */
> +
> +#include "r9a06g032-rzn1d400-db.dts"
> +
> +/ {
> +       model =3D "RZN1D-EB Board";
> +       compatible =3D "renesas,rzn1d400-eb", "renesas,rzn1d400-db",
> +                    "renesas,r9a06g032";
> +};
> +
> +&mii_conv2 {
> +       renesas,miic-input =3D <MIIC_SWITCH_PORTD>;
> +       status =3D "okay";
> +};
> +
> +&mii_conv3 {
> +       renesas,miic-input =3D <MIIC_SWITCH_PORTC>;
> +       status =3D "okay";
> +};
> +
> +&pinctrl{

Missing space.

> +       pins_eth1: pins-eth1 {
> +               pinmux =3D <RZN1_PINMUX(12, RZN1_FUNC_CLK_ETH_MII_RGMII_R=
MII)>,
> +                        <RZN1_PINMUX(13, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(14, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(15, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(16, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(17, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(18, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(19, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(20, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(21, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(22, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(23, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>;
> +               drive-strength =3D <6>;
> +               bias-disable;
> +       };
> +
> +       pins_eth2: pins-eth2 {
> +               pinmux =3D <RZN1_PINMUX(24, RZN1_FUNC_CLK_ETH_MII_RGMII_R=
MII)>,
> +                        <RZN1_PINMUX(25, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(26, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(27, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(28, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(29, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(30, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(31, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(32, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(33, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(34, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>,
> +                        <RZN1_PINMUX(35, RZN1_FUNC_CLK_ETH_MII_RGMII_RMI=
I)>;
> +               drive-strength =3D <6>;
> +               bias-disable;
> +       };
> +};
> +
> +&switch {
> +       pinctrl-names =3D "default";

(from v2) No need to specify pinctrl-names, as it is inherited from
r9a06g032-rzn1d400-db.dts.

> +       pinctrl-0 =3D <&pins_eth1>, <&pins_eth2>, <&pins_eth3>, <&pins_et=
h4>,
> +                   <&pins_mdio1>;
> +
> +       mdio {
> +               /* CN15 and CN16 switches must be configured in MDIO2 mod=
e */
> +               switch0phy1: ethernet-phy@1 {
> +                       reg =3D <1>;
> +                       leds {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               led@0 {
> +                                       reg =3D <0>;

color =3D <LED_COLOR_ID_GREEN>;

> +                               };
> +                               led@1 {
> +                                       reg =3D <1>;

color =3D <LED_COLOR_ID_ORANGE>;

> +                               };

The above should also have one of:

    function =3D LED_FUNCTION_LAN;
    function =3D LED_FUNCTION_SPEED_LAN;

I don't know the LED function mapping.

> +                               led@2 {
> +                                       reg =3D <2>;
> +                               };

LED2/_INT is used as an interrupt pin, not as an LED.

> +                       };
> +               };
> +
> +               switch0phy10: ethernet-phy@10 {

Same comments for this one.

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


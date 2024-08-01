Return-Path: <linux-renesas-soc+bounces-7670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9894457A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 09:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6B76283F35
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 07:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B1B1586C0;
	Thu,  1 Aug 2024 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkBM4fIn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA2F22F19;
	Thu,  1 Aug 2024 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722497592; cv=none; b=fEjAPzmdU4Py2Tlmq5kKryiS3LLpKcP7WSRyDe1fmKD9h34e0/JizoeDf74i6+tH4JrV1+NfUhCReMlYoMYdSNFdOmpV1E4htW0yylZa+O2iag5ZOuVTbwEC+cq2apSESI6XVHNNgEHrKLlXVgNxUNog05iwHxKrgB8F35/6pXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722497592; c=relaxed/simple;
	bh=pYhEjzteObRUIuChXy7Zneugb0ShoxV2hznJJYmHCn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Scssy0PVVNQbLjzRsaF8t3zTxy78VajgRzs4F8xF8ouZ3I3gFJMQfRux5252o2L+wCh5o0pjtx4BW+uWOAzc4pvmfZ5QctLA3RmgDZnPYMWXyzbNg3ZtbcknqI9smXJUrFtbTGQOmGhtv+yFpDHR14sJrfGUlzKmfHeR1AD9WSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkBM4fIn; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-825eaedfef3so1736085241.0;
        Thu, 01 Aug 2024 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722497589; x=1723102389; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxR+keK0EoqoxbiDMpzy0xDwZ6lQuLfFwlbPoWTYpLE=;
        b=UkBM4fInuollXmp4eT0maP+iwWjH7gUvrV3bVYfdQXrKS32bEYHr6uSYsR7be9sgBu
         FivCnueade6ze92nn3zu9n4UdhWPBMlP3shr+xOpvrg4gTi32b0w3gD9qeW8mRGIg+LD
         m5h7g3EUR0fIQQS2KpafqcPMw1BtXo6GpcF+ZcLXH5hdaXfHxD2cTpXx0FzylBGY0IiY
         7za61OT24IozzzCDmKuGX+5QvKsMdp9l8dB2RlrCIBSYyoyOXPrZ3dnhqKcYk7wM0Rwu
         5TZuCJxqQsYBo+5hCVkExYtUq2c6TXmXFnPgy+CXxFN0aFn01h9QKBbNBeX4ETND2Vr8
         vk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722497589; x=1723102389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxR+keK0EoqoxbiDMpzy0xDwZ6lQuLfFwlbPoWTYpLE=;
        b=wFDKBGsaRxS9oNBgWFOWxsna/TcnIxnS8y0Es55roxPRKLy5EhtSztPdFx6rumrBg/
         YxK+t8ESd8hLeeJ+xcetT4cQ9wW6Z0h6UCEB+EMhhD7HSAcAixC6pIQsY+YVSPIeg/mj
         v+JTtpuVCejAV6Gr2aRmo8gagbtMEhr/fM5woDgd6a4+ymR6M83X/ThjC5VYYoApBVez
         SgpOTpvKULhvl0Ko1kN4FJc1eYG277vhD27uQiDe/TcWtXOPOq1GlfQhWfaKWXqYVmR7
         0s+njYIfJEJWrxtNT8Y2dy7yE+zTt56MZ9zm5nTpZ2dLnojyxlfinXddJBQ0hcXns68S
         IMBg==
X-Forwarded-Encrypted: i=1; AJvYcCV9+ye1qDfFfUlxWvLhu8tBq0iAzh4vjy5gVDdQ/fEtbO8Pa020RcZoJW7BKydcqTQIUry+/j1x8WD7irfbV686gZIXcD+nJFfXoD/+zGio+WEGHSOfO28WcpMWpc8pEMxjOpFvOFlTNR/vmSDK+OE=
X-Gm-Message-State: AOJu0YwZwpRQDqFAj5ASXA/Keuc0LIQZiLgLxGSU0HBrzuCcaRDMygBY
	5dS1Bq+/CA5avN1VVceuzg8jR/myWGH4Tc92FbsLgUK24NPru62B1aex7nZUmoNc4iLpAZCPtpL
	ZaI8dqKRBRCSwnHd0jvaR87YTXZY=
X-Google-Smtp-Source: AGHT+IEC4F/yNfXSGbEXf6Ys7ewuz6Z6FPtAktCV2Nmk0h8hk03wn2JqMTg2HFgP4Cz1BNs61Ncn+lGomRaLwAS/APc=
X-Received: by 2002:a05:6122:901:b0:4ec:f8f0:7175 with SMTP id
 71dfb90a1353d-4f89654563fmr1999871e0c.11.1722497589401; Thu, 01 Aug 2024
 00:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <89ad70c7d6e8078208fecfd41dc03f6028531729.1722353710.git.geert+renesas@glider.be>
In-Reply-To: <89ad70c7d6e8078208fecfd41dc03f6028531729.1722353710.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Aug 2024 08:32:43 +0100
Message-ID: <CA+V-a8tKdwvDxYqxyf9JwDa4ZPz41=+ecJ5cf7ZO-G_PAk26-Q@mail.gmail.com>
Subject: Re: [PATCH/RFC] riscv: defconfig: Disable RZ/Five peripheral support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Jul 30, 2024 at 4:37=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> There is not much point in keeping support for RZ/Five peripherals
> enabled, as the RZ/Five platform option (ARCH_R9A07G043) is gated behind
> NONPORTABLE.  Hence drop all config options that enable built-in or
> modular support for peripherals found on RZ/Five SoCs.
>
> Disable USB_XHCI_RCAR explicitly, as its value defaults to the value of
> ARCH_RENESAS, which is still enabled.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Questions:
>   1. Perhaps the intention is to keep all RZ/Five peripheral support
>      enabled, so RZ/Five users can start from the defconfig, and
>      "just"[1] enable NONPORTABLE and ARCH_R9A07G043?
>
>      [1] Nope, need to disable RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO
>          (and whatever else in the future?), too.
>
>   2. Perhaps CONFIG_ARCH_RENESAS=3Dy should be dropped, too?
>      In addition to USB_XHCI_RCAR, that would get rid of SOC_BUS,
>      PINCTRL_RENESAS, CLK_RENESAS, and SOC_RENESAS.
>
I think it does make sense if we drop the above configs too as anyway
users will have to select the configs manually to get a bootable image
for RZ/Five.

> ---
>  arch/riscv/configs/defconfig | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0d678325444fccdc..b51ef6cd1e3986ed 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -137,12 +137,10 @@ CONFIG_VIRTIO_NET=3Dy
>  CONFIG_MACB=3Dy
>  CONFIG_E1000E=3Dy
>  CONFIG_R8169=3Dy
> -CONFIG_RAVB=3Dy
>  CONFIG_STMMAC_ETH=3Dm
>  CONFIG_MICREL_PHY=3Dy
>  CONFIG_MICROSEMI_PHY=3Dy
>  CONFIG_MOTORCOMM_PHY=3Dy
> -CONFIG_CAN_RCAR_CANFD=3Dm
>  CONFIG_INPUT_MOUSEDEV=3Dy
>  CONFIG_KEYBOARD_SUN4I_LRADC=3Dm
>  CONFIG_SERIAL_8250=3Dy
> @@ -150,7 +148,6 @@ CONFIG_SERIAL_8250_CONSOLE=3Dy
>  CONFIG_SERIAL_8250_DW=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
>  CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> -CONFIG_SERIAL_SH_SCI=3Dy
>  CONFIG_VIRTIO_CONSOLE=3Dy
>  CONFIG_HW_RANDOM=3Dy
>  CONFIG_HW_RANDOM_VIRTIO=3Dy
> @@ -159,11 +156,9 @@ CONFIG_I2C=3Dy
>  CONFIG_I2C_CHARDEV=3Dm
>  CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
>  CONFIG_I2C_MV64XXX=3Dm
> -CONFIG_I2C_RIIC=3Dy
>  CONFIG_SPI=3Dy
>  CONFIG_SPI_CADENCE_QUADSPI=3Dm
>  CONFIG_SPI_PL022=3Dm
> -CONFIG_SPI_RSPI=3Dm
>  CONFIG_SPI_SIFIVE=3Dy
>  CONFIG_SPI_SUN6I=3Dy
>  # CONFIG_PTP_1588_CLOCK is not set
> @@ -172,7 +167,6 @@ CONFIG_POWER_RESET_GPIO_RESTART=3Dy
>  CONFIG_SENSORS_SFCTEMP=3Dm
>  CONFIG_CPU_THERMAL=3Dy
>  CONFIG_DEVFREQ_THERMAL=3Dy
> -CONFIG_RZG2L_THERMAL=3Dy
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_SUNXI_WATCHDOG=3Dy
>  CONFIG_MFD_AXP20X_I2C=3Dy
> @@ -201,11 +195,11 @@ CONFIG_USB=3Dy
>  CONFIG_USB_OTG=3Dy
>  CONFIG_USB_XHCI_HCD=3Dy
>  CONFIG_USB_XHCI_PLATFORM=3Dy
> +# CONFIG_USB_XHCI_RCAR is not set
>  CONFIG_USB_EHCI_HCD=3Dy
>  CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>  CONFIG_USB_OHCI_HCD=3Dy
>  CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> -CONFIG_USB_RENESAS_USBHS=3Dm
>  CONFIG_USB_STORAGE=3Dy
>  CONFIG_USB_UAS=3Dy
>  CONFIG_USB_CDNS_SUPPORT=3Dm
> @@ -217,7 +211,6 @@ CONFIG_USB_MUSB_HDRC=3Dm
>  CONFIG_USB_MUSB_SUNXI=3Dm
>  CONFIG_NOP_USB_XCEIV=3Dm
>  CONFIG_USB_GADGET=3Dy
> -CONFIG_USB_RENESAS_USBHS_UDC=3Dm
>  CONFIG_USB_CONFIGFS=3Dm
>  CONFIG_USB_CONFIGFS_SERIAL=3Dy
>  CONFIG_USB_CONFIGFS_ACM=3Dy
> @@ -235,7 +228,6 @@ CONFIG_MMC_SDHCI_PLTFM=3Dy
>  CONFIG_MMC_SDHCI_OF_DWCMSHC=3Dy
>  CONFIG_MMC_SDHCI_CADENCE=3Dy
>  CONFIG_MMC_SPI=3Dy
> -CONFIG_MMC_SDHI=3Dy
>  CONFIG_MMC_DW=3Dy
>  CONFIG_MMC_DW_STARFIVE=3Dy
>  CONFIG_MMC_SUNXI=3Dy
> @@ -250,7 +242,6 @@ CONFIG_VIRTIO_INPUT=3Dy
>  CONFIG_VIRTIO_MMIO=3Dy
>  CONFIG_CLK_SOPHGO_CV1800=3Dy
>  CONFIG_SUN8I_DE2_CCU=3Dm
> -CONFIG_RENESAS_OSTM=3Dy
>  CONFIG_SUN50I_IOMMU=3Dy
>  CONFIG_RPMSG_CHAR=3Dy
>  CONFIG_RPMSG_CTRL=3Dy
> @@ -258,7 +249,6 @@ CONFIG_RPMSG_VIRTIO=3Dy
>  CONFIG_PM_DEVFREQ=3Dy
>  CONFIG_IIO=3Dy
>  CONFIG_PHY_SUN4I_USB=3Dm
> -CONFIG_PHY_RCAR_GEN3_USB2=3Dy
>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=3Dm
>  CONFIG_PHY_STARFIVE_JH7110_PCIE=3Dm
>  CONFIG_PHY_STARFIVE_JH7110_USB=3Dm
> --
> 2.34.1
>
>


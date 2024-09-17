Return-Path: <linux-renesas-soc+bounces-8969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8505097B0B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 15:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9EFD1C21A18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 13:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0299D16B38B;
	Tue, 17 Sep 2024 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="rIZ0pqYD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80BA4C66
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2024 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726579255; cv=none; b=AJowKR+vSRachFarFsf3E/YPweXb4m4HiXGOzHoMesAV2VNaHcKRFon6mJf3EQTQBw9jsYcsVShV90lMrTBeD4YHDKYSYOVZsukhwRGe8VAnMQbccI41m98zl03Ai5yxE8q7CuByT8MEY0787P4SzamZNsUjIgWNjzohejc1f8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726579255; c=relaxed/simple;
	bh=Fpm0Y4e07Hw3gcfa0JjfLJNgQcphzoqg/BK3qENdfrY=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=Mqmejsj9nXrqT5sN9IDkTqv2ap0dfP//QOve9DdzGG4FP1bOY9n1Uy6QAzgdLojmXNjwQtosSUb0tztoKb7czNZw4RBtUVl28YvpT/YzmY5+MToBbaTuQLe+C5hvLpjW/M1AgEfQkGHp5n5ms8esiCaEG8WaBzg/eNCEAqfB/As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=rIZ0pqYD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so36584555e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2024 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726579252; x=1727184052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2dLER4hFIewaSVuZKAuDv/8Id6s8izBkR6u+XBoB78=;
        b=rIZ0pqYDu/GtThmFFKcAxUv40XJQtk+rTyLESYXkOdRlbBh4XYtNXp3VHzjlHPalHR
         pDm5ZkG8emIYwi8o2X5qohrfq6AukDGDMJfaYT/87LErAGZAV4GIf0ukYo/uOgCP1WXs
         ofXt+UZVE/HP/f4+Kw5fpwkQgcN6nHoJrVNuA3sycK3IWEsMTcsungHsAvmLz7m4otnV
         3hAHb36G+Bs2+4NI5Vj/++di2oymykvMfacE5aEb2AhzGXfN/S4MyTq7zUW/u9vJohGd
         DUmlJNS2g3LRllXcmSmhtB1pnNPRiMkieg5agVzyWNGelMKF9CHSuqQpxddsChDCvjfV
         0DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726579252; x=1727184052;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2dLER4hFIewaSVuZKAuDv/8Id6s8izBkR6u+XBoB78=;
        b=RZ0mTbkkj9vVYe9FIus5YZHakxALlPBcbf9luJX24WNPz7FgOpJHBYVAfC7VEnBGjb
         4vZVsbsY3yOzptVwyDPlufllh8rFrBgo/+sxm+dVeKXJwh2NCDZus+wOyrYUP1s1ArJl
         0eGXa29LIHi1CUE45D+CTNL4ZbfE84wPsIKlk9ay3xBJdVtc8rsmx3m5lvhSfuG5HUJY
         TgufOM5YzWok2UynPKwnVySAklleHl5dMVzCrIo5zjxlGEZ+jUUJzXwfGqevFZp/mxFt
         t1qXZjaQsHl4dzna+ruj0/AtjZ7lL/d3e/jZfaf2WqAEndHiXKHhN6OMIrgpxFpzVhJl
         eG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVVeR0wzzTLduZmGrdGsOhceucW7drz2maJ8/WIYEsMXxL5dMcote2xrb/ES+dGVLw5ddyMzuoSjxUWKaolf9mHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzcjre2/GNiN7q3We2hLwAUNpL+HbjIUQMxifWrtTZQB0IOZHV
	QLeDFYB+v1OvBzM1GiFvJbDAwX4vKzd+4HvnIOV6qEG5B+ZMsh9XSQe3QO0FGkE=
X-Google-Smtp-Source: AGHT+IEkJo5p9GCz0LoYuqEsugBea6QpohVZTav3exdRbgQ8e5OLK2ugx0SXZ25Eyd1uMg7S70RlkA==
X-Received: by 2002:a05:600c:510a:b0:42c:b58d:98ad with SMTP id 5b1f17b1804b1-42d9081b3a2mr101242645e9.14.1726579251797;
        Tue, 17 Sep 2024 06:20:51 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22d8b22sm102624115e9.12.2024.09.17.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:20:51 -0700 (PDT)
Date: Tue, 17 Sep 2024 06:20:51 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 06:20:20 PDT (-0700)
Subject:     Re: [PATCH/RFC] riscv: defconfig: Disable RZ/Five peripheral support
In-Reply-To: <CA+V-a8tKdwvDxYqxyf9JwDa4ZPz41=+ecJ5cf7ZO-G_PAk26-Q@mail.gmail.com>
CC: geert+renesas@glider.be, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, prabhakar.mahadev-lad.rj@bp.renesas.com,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: prabhakar.csengg@gmail.com
Message-ID: <mhng-b838be82-513e-4403-8746-d6db428bbb1f@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 01 Aug 2024 00:32:43 PDT (-0700), prabhakar.csengg@gmail.com wrote:
> Hi Geert,
>
> On Tue, Jul 30, 2024 at 4:37 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>>
>> There is not much point in keeping support for RZ/Five peripherals
>> enabled, as the RZ/Five platform option (ARCH_R9A07G043) is gated behind
>> NONPORTABLE.  Hence drop all config options that enable built-in or
>> modular support for peripherals found on RZ/Five SoCs.
>>
>> Disable USB_XHCI_RCAR explicitly, as its value defaults to the value of
>> ARCH_RENESAS, which is still enabled.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Questions:
>>   1. Perhaps the intention is to keep all RZ/Five peripheral support
>>      enabled, so RZ/Five users can start from the defconfig, and
>>      "just"[1] enable NONPORTABLE and ARCH_R9A07G043?
>>
>>      [1] Nope, need to disable RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO
>>          (and whatever else in the future?), too.
>>
>>   2. Perhaps CONFIG_ARCH_RENESAS=y should be dropped, too?
>>      In addition to USB_XHCI_RCAR, that would get rid of SOC_BUS,
>>      PINCTRL_RENESAS, CLK_RENESAS, and SOC_RENESAS.
>>
> I think it does make sense if we drop the above configs too as anyway
> users will have to select the configs manually to get a bootable image
> for RZ/Five.

Ya, I agree.  If we end up with another RZ/Five or somone gets rid of 
that DMA pool stuff that's forcing the NONPORTABLE then we can always 
re-add it.

I picked this one up and send the ARCH_RENESAS removal.

>
>> ---
>>  arch/riscv/configs/defconfig | 12 +-----------
>>  1 file changed, 1 insertion(+), 11 deletions(-)
>>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Cheers,
> Prabhakar
>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 0d678325444fccdc..b51ef6cd1e3986ed 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -137,12 +137,10 @@ CONFIG_VIRTIO_NET=y
>>  CONFIG_MACB=y
>>  CONFIG_E1000E=y
>>  CONFIG_R8169=y
>> -CONFIG_RAVB=y
>>  CONFIG_STMMAC_ETH=m
>>  CONFIG_MICREL_PHY=y
>>  CONFIG_MICROSEMI_PHY=y
>>  CONFIG_MOTORCOMM_PHY=y
>> -CONFIG_CAN_RCAR_CANFD=m
>>  CONFIG_INPUT_MOUSEDEV=y
>>  CONFIG_KEYBOARD_SUN4I_LRADC=m
>>  CONFIG_SERIAL_8250=y
>> @@ -150,7 +148,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
>>  CONFIG_SERIAL_8250_DW=y
>>  CONFIG_SERIAL_OF_PLATFORM=y
>>  CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>> -CONFIG_SERIAL_SH_SCI=y
>>  CONFIG_VIRTIO_CONSOLE=y
>>  CONFIG_HW_RANDOM=y
>>  CONFIG_HW_RANDOM_VIRTIO=y
>> @@ -159,11 +156,9 @@ CONFIG_I2C=y
>>  CONFIG_I2C_CHARDEV=m
>>  CONFIG_I2C_DESIGNWARE_PLATFORM=y
>>  CONFIG_I2C_MV64XXX=m
>> -CONFIG_I2C_RIIC=y
>>  CONFIG_SPI=y
>>  CONFIG_SPI_CADENCE_QUADSPI=m
>>  CONFIG_SPI_PL022=m
>> -CONFIG_SPI_RSPI=m
>>  CONFIG_SPI_SIFIVE=y
>>  CONFIG_SPI_SUN6I=y
>>  # CONFIG_PTP_1588_CLOCK is not set
>> @@ -172,7 +167,6 @@ CONFIG_POWER_RESET_GPIO_RESTART=y
>>  CONFIG_SENSORS_SFCTEMP=m
>>  CONFIG_CPU_THERMAL=y
>>  CONFIG_DEVFREQ_THERMAL=y
>> -CONFIG_RZG2L_THERMAL=y
>>  CONFIG_WATCHDOG=y
>>  CONFIG_SUNXI_WATCHDOG=y
>>  CONFIG_MFD_AXP20X_I2C=y
>> @@ -201,11 +195,11 @@ CONFIG_USB=y
>>  CONFIG_USB_OTG=y
>>  CONFIG_USB_XHCI_HCD=y
>>  CONFIG_USB_XHCI_PLATFORM=y
>> +# CONFIG_USB_XHCI_RCAR is not set
>>  CONFIG_USB_EHCI_HCD=y
>>  CONFIG_USB_EHCI_HCD_PLATFORM=y
>>  CONFIG_USB_OHCI_HCD=y
>>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>> -CONFIG_USB_RENESAS_USBHS=m
>>  CONFIG_USB_STORAGE=y
>>  CONFIG_USB_UAS=y
>>  CONFIG_USB_CDNS_SUPPORT=m
>> @@ -217,7 +211,6 @@ CONFIG_USB_MUSB_HDRC=m
>>  CONFIG_USB_MUSB_SUNXI=m
>>  CONFIG_NOP_USB_XCEIV=m
>>  CONFIG_USB_GADGET=y
>> -CONFIG_USB_RENESAS_USBHS_UDC=m
>>  CONFIG_USB_CONFIGFS=m
>>  CONFIG_USB_CONFIGFS_SERIAL=y
>>  CONFIG_USB_CONFIGFS_ACM=y
>> @@ -235,7 +228,6 @@ CONFIG_MMC_SDHCI_PLTFM=y
>>  CONFIG_MMC_SDHCI_OF_DWCMSHC=y
>>  CONFIG_MMC_SDHCI_CADENCE=y
>>  CONFIG_MMC_SPI=y
>> -CONFIG_MMC_SDHI=y
>>  CONFIG_MMC_DW=y
>>  CONFIG_MMC_DW_STARFIVE=y
>>  CONFIG_MMC_SUNXI=y
>> @@ -250,7 +242,6 @@ CONFIG_VIRTIO_INPUT=y
>>  CONFIG_VIRTIO_MMIO=y
>>  CONFIG_CLK_SOPHGO_CV1800=y
>>  CONFIG_SUN8I_DE2_CCU=m
>> -CONFIG_RENESAS_OSTM=y
>>  CONFIG_SUN50I_IOMMU=y
>>  CONFIG_RPMSG_CHAR=y
>>  CONFIG_RPMSG_CTRL=y
>> @@ -258,7 +249,6 @@ CONFIG_RPMSG_VIRTIO=y
>>  CONFIG_PM_DEVFREQ=y
>>  CONFIG_IIO=y
>>  CONFIG_PHY_SUN4I_USB=m
>> -CONFIG_PHY_RCAR_GEN3_USB2=y
>>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m
>>  CONFIG_PHY_STARFIVE_JH7110_USB=m
>> --
>> 2.34.1
>>
>>


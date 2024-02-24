Return-Path: <linux-renesas-soc+bounces-3158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DA86268B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 19:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F15AEB22102
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 18:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0031EB34;
	Sat, 24 Feb 2024 18:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LInfvdsK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2D1E497
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2024 18:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708797641; cv=none; b=AKigvVEv31NKB/yc7xTEfDMb9DdEpJYk1+ODnOfb/gYJjAUa9Q6ao0T3K/xfWjXEaRfA2B9Ft4uEMReDBd4eBDlNd7acmled+zuvISsDOGKjF+J0XcIG3WZQVWGxKEB8RsZ1/GdRyr1hlVC580vkoMMITKHWfdFyk8TnYRXmjgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708797641; c=relaxed/simple;
	bh=G6o2nhUgm+M60WrRR17Vl0CKspbI6aWxwNtinu7O+48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvBacEgIIcT2V8K2xBLVGwUwjUBj/Imay/RhNfYBU48MROarDhMkHzpBVZ+n/SA4KT5kiyxbSWMhenjsEnUUCdnWxtUcAmzmEZo1ZzEAhcLaifb4KI20/uwejgthJvyK6fjus/O5AxGTXBpNRK4J4TO7bnuvRvJeuY3cy3pEkhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LInfvdsK; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-512ab55fde6so1915189e87.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2024 10:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1708797635; x=1709402435; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6Pt7drzHcC4qcVCDkKRpBfvRiZ/Rhfz3OGWDqj6MJo=;
        b=LInfvdsKzgz+PIYaE4emnfUEI44ItxiDMXEcb2o4jbFPBtnIJY9xVtzuY/DOfR5UKK
         BXqrdD6AggK59FkAd4yM2AtRWrkn6F4sMSYKsL1M4yh3vnC4Eo01gqi3aIqGUzR1pQMb
         y2xAL8Thcyr+JCuZWpZd7MhYmnTHIJekhMQq8E8cKxpoXn7dgHp3YgmNvPSmAUJHJ5HK
         xmzliO9ttypbs7WraV+JFO2Tb7kkED5K4gGs2QoyFsxzSDQXBW1bCcHlj0+Z2tSAVG7l
         au2fz67rqa8Qqb5RRRQO9RWG3bUbcki0eT7G2mGq/1NRZMOic3pNphS9hq5MScfAssVN
         sQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708797635; x=1709402435;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6Pt7drzHcC4qcVCDkKRpBfvRiZ/Rhfz3OGWDqj6MJo=;
        b=dEW+rQ9vw3yIPDXDbuqzC58VXNUFi9EXz3vNz8WUM8o8vzxSeRdqLsV5/mMb5K8gdx
         j65ainVat0wF3/NBaGhb5zzyaZARAYvpwh4H0beBZ5CjPYdNc6L4wbZ1Dfbwpya5XBDN
         gSZhBEeK+qvWcZ4hjhsrA4LsNxg2uDwvhTT1R6NfO2HDI3skNOGJT+vUj8kDpAFQQbjo
         SV7vRQNxy8QSQdzSN5/aQxcSdI4Dtf36ziOVzUSYQDkFslPULRQOG8rVBD3xW5UY1CJY
         +J5q4fGgm1MiiQNipEMTRzx32xQVgVfNCSTtWMN/wQfob5go5pJTlp7DI6FR0TQYFFOv
         Fd0A==
X-Gm-Message-State: AOJu0YxcQtRslcY3DRt3AZ/1CNRN61QfBsLBfLV9IJ4v9L3AEBRwvYHM
	a0Dvdyg5jOvYzIBu+6o25IgzvlJGcT0dKFeQnF8kUVRRltnrrm4Yng3xhzTstsUVKqhouEBNdX7
	KUAI=
X-Google-Smtp-Source: AGHT+IFmk5ctBsuNQQySHnPGXSMC165o7rCaDWRdHFwSAQrTzP/fPJctKrDyWJC7uBoKdY985cuNeg==
X-Received: by 2002:a05:6512:1589:b0:512:cc98:99be with SMTP id bp9-20020a056512158900b00512cc9899bemr2163914lfb.0.1708797634796;
        Sat, 24 Feb 2024 10:00:34 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id d20-20020a193854000000b00512e14849b0sm281312lfj.257.2024.02.24.10.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 10:00:34 -0800 (PST)
Date: Sat, 24 Feb 2024 19:00:33 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: eagle: Add capture overlay for
 expansion board
Message-ID: <20240224180033.GA4164129@ragnatech.se>
References: <20240123145354.1571800-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXxA1K7G5a84WkTCqa2WGPp4ZvjOZR_9SBgEkXOUm8f9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXxA1K7G5a84WkTCqa2WGPp4ZvjOZR_9SBgEkXOUm8f9A@mail.gmail.com>

Hi Geert,

Tanks for your feedback.

I have taken all your comments for v2 except the i2c address of adv7126, 
see reason below.

On 2024-02-15 19:32:32 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Jan 23, 2024 at 3:54 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The Eagle board supports an optional expansion board. The expansion
> 
> The title page of the schematics document calls this the "Function
> expansion board".
> 
> > board adds support for HDMI OUT, HDMI capture from two different sources
> > and eMMC.
> >
> > This change only adds support for the two HDMI capture sources.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -62,6 +62,8 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
> >  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
> >
> >  dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
> 
> Please add
> 
>     dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle-expansion.dtbo
> 
> so that the .dtbo is considered for installation, too.
> 
> > +r8a77970-eagle-expansion-dtbs := r8a77970-eagle.dtb r8a77970-eagle-expansion.dtbo
> > +dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle-expansion.dtb
> >  dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-v3msk.dtb
> >
> >  dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
> 
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtso
> 
> This is a rather generic name.
> What about r8a77970-eagle-function-expansion.dtso?
> 
> > @@ -0,0 +1,214 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the Eagle V3M expansion board.
> 
> ... Function expansion board?
> 
> > + *
> > + * Copyright (C) 2024 Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> 
> Please move the includes below the /.../; markers.
> 
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +       /* CN4 */
> > +       /* Eagle: SW18 set to OFF */
> > +       cvbs-in-cn4 {
> > +               compatible = "composite-video-connector";
> > +               label = "CVBS IN CN4";
> > +
> > +               port {
> > +                       cvbs_con: endpoint {
> > +                               remote-endpoint = <&adv7482_ain7>;
> > +                       };
> > +               };
> > +       };
> > +
> > +       /* CN3 */
> > +       /* Eagle: SW18 set to OFF */
> > +       hdmi-in-cn3 {
> 
> Please use alphabetical sort order for nodes without unit addresses.
> 
> > +               compatible = "hdmi-connector";
> > +               label = "HDMI IN CN3";
> > +               type = "a";
> > +
> > +               port {
> > +                       hdmi_in_con: endpoint {
> > +                               remote-endpoint = <&adv7482_hdmi>;
> > +                       };
> > +               };
> > +       };
> > +
> > +       /* CN2 */
> > +       /* Eagle: SW35 set 5, 6 and 8 to OFF */
> > +       hdmi-in-cn2 {
> > +               compatible = "hdmi-connector";
> > +               label = "HDMI IN CN2";
> > +               type = "a";
> > +
> > +               port {
> > +                       hdmi_in_con2: endpoint {
> > +                               remote-endpoint = <&adv7612_in>;
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +/* Disconnect MAX9286 GMSL i2c. */
> 
> I2C
> 
> > +&i2c3 {
> > +       status = "disabled";
> > +};
> > +
> > +/* Connect expansion board i2c. */
> 
> I2C
> 
> > +&i2c0 {
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
> > +
> > +       io_expander_27: gpio@27 {
> > +               compatible = "onnn,pca9654";
> > +               reg = <0x27>;
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +
> > +               vin0_adv7612_en {
> > +                       gpio-hog;
> > +                       gpios = <0x3 0x0>;
> 
> Please use symbolic values for GPIO flags, i.e. GPIO_ACTIVE_HIGH.
> 
> > +                       output-low;
> > +                       line-name = "VIN0_ADV7612_ENn";
> 
> Given this signal is active-low, you probably want:
> 
>     gpios = <3 GPIO_ACTIVE_LOW>;
>     output-high;
> 
> > +               };
> > +       };
> > +
> > +       dmi-decoder@4c {
> 
> hdmi-decoder
> 
> According to the schematics, the primary address is 0x4d?

Indeed it is, but it do not answer at 0x4d but at 0x4c, I do not know 
why, maybe the datasheet is wrong? I have had some version or not of 
this change in my tree for years so I can't remember how I figured this 
out, but I just retested and nothing answers at 0x4d but capture works 
find with 0x4c.

> 
> > +               compatible = "adi,adv7612";
> > +               reg = <0x4c>, <0x50>, <0x52>, <0x54>, <0x56>, <0x58>;
> > +               reg-names = "main", "afe", "rep", "edid", "hdmi", "cp";
> > +               interrupt-parent = <&gpio3>;
> > +               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> > +               default-input = <0>;
> 
> > +       };
> > +
> > +       adv7482_70: video-receiver@70 {
> 
> Do you see a future user for this label?
> Just wondering, as some nodes have labels, others haven't.
> 
> > +               compatible = "adi,adv7482";
> > +               reg = <0x70 0x71 0x72 0x73 0x74 0x75
> > +                      0x60 0x61 0x62 0x63 0x64 0x65>;
> > +               reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
> > +                           "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
> > +               interrupt-parent = <&gpio3>;
> > +               interrupts = <03 IRQ_TYPE_LEVEL_LOW>, <04 IRQ_TYPE_LEVEL_LOW>;
> > +               interrupt-names = "intrq1", "intrq2";
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund


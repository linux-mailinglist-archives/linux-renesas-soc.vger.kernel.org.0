Return-Path: <linux-renesas-soc+bounces-10756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E709DBACF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 16:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221A7281F2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 15:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D420E1A9B28;
	Thu, 28 Nov 2024 15:46:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B864204E;
	Thu, 28 Nov 2024 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808782; cv=none; b=Y0/Ah28HzenDc9XX8O8Nm1iJUVtzWZWw8txVwc8AbWCbIm30A/T+40rVHO7Q+aasZbr2hX0XNQw7svf3hItZEgmeGBU+YIfvs4MbJxz5WWmzOC3qzbolUQzaHb6SLeCyV8+sZccNzwlHPkLHnI5xB3Kr41k/0m4npn1qEdLwEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808782; c=relaxed/simple;
	bh=mD01r/aB7enLSRRFcLlOuUNHuLyHhKDmXn8q67mMQ2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ua2QoSjnPGP28l7wJFs2c0Kjq7aJPLSr5cexpFP/NPftathqPb0yYlGggnrovQdNwR3ED1WeREMfIExDzqE1Ipt/KalbWU9T1tBbZXAKjNvmm6l0bRjUGb42lbCfNTrZFGk2IUl+NI8uD1FRAx7/iLiyVvU1vCL0KbtgB4RKx+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ee676b4e20so11557977b3.3;
        Thu, 28 Nov 2024 07:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808779; x=1733413579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUf/S6ywNh8XAsdHlQGFt6ui0KSpcttBMmgIqMsNTKY=;
        b=q38Ao2adXnIzXW8zuPIl1sjGT+GQV02PUXrmOuJ/HwDqBaveP8nJK2XWgW6+gP0xVi
         MSisozWqBC8eLIqfL7IanN3MMsSK/PH836NWQpp4yYLuly0BrbGiu6r9szlww48QPfc7
         gTwrc8IwMd5ea99lOtpdqz9o24jr1yf5F57a5rJ6CeyDLMTwOf1OQMYZz/kDle+613kK
         NaRRL3hG2itYYdckr86Mj6rsVAFPeBHzNKIy2wtfDdApYvHusqeLIYzxxM6VLqCV2K10
         n5Urw+7q1C0YRIe9FJUmEP9k98XquqwxnKiryfGNlLoU4RjR4RK36BshhrULYJH/eXbq
         dm+w==
X-Forwarded-Encrypted: i=1; AJvYcCW1cpDre1xeRvx/0qM4tXJ8w+3TLkyEE+eE+xcod+JVSJJwqkAUSHTtVST6bVS64GcQwTGdRdY5CymztgEv@vger.kernel.org, AJvYcCWLLLrkIZwYjjOqfU/nuzDPl7frZJxrVBAiljrS5AG/WebTOw3vcMRZNAecZJPENB3b2Ik9CbK3BhtzeCKHQJdHwO4=@vger.kernel.org, AJvYcCX0pXLlCe2cWGTyjWkh8tAbtuoZy9faNieshXfXlxLYNv8w+cN15V+mdMZlt8r36A5+zwB24oygKeMU@vger.kernel.org, AJvYcCXqSqZonsSnlropZwJjr/Q/kEww/3KuTmLcZBWzPr48LR/yp50+ERyDcovizl5d1kAa8ey8XBPNq5Ql@vger.kernel.org
X-Gm-Message-State: AOJu0YwBpfRVg/EAdb8JrOvoHUZdbLL/cGvXziLuG+1fViICVWHdqGA2
	yO1FohAkTVgYU4DDEAwJUI3vMMifZyhz8sEemXU8aURUYsl2jxNtgfPepsJPZFQ=
X-Gm-Gg: ASbGncsgxDpaR1t/25lnhXpfQiviouKthUm3eivvBeOdW3Ln5CNA4k8iG6CVfKgP45w
	gqzBo3cM+z9KYxtAFavVgOrERrE/8IlgTVWdkD7iJeIllsHDfqaKX2xrkTu/oD7UW/qHJB3zD+V
	SQ9pbggXStNJL7h7o4H2lhYSu4t7nz73kHH2pEoLr/dlVfxEbDH/8MeH0uqlMXzlhi/6ssTGSbA
	8WMeyw0Xx5phd3my6V2McRlnKoMvq+G9nVjKZqSCE71lOYihUlV7sZebkx/8O2EyGtlMqpoBAGs
	J2fjtTiJ04CTULzT
X-Google-Smtp-Source: AGHT+IHIPj15bB88efUDPhIepuR9qA5LQ1W4xHde82s4MVua4bX2gKggZut31y+/x91vdjzjd5MNpw==
X-Received: by 2002:a05:690c:a8b:b0:6ea:e967:81da with SMTP id 00721157ae682-6ef3720d0a7mr78206207b3.11.1732808779467;
        Thu, 28 Nov 2024 07:46:19 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ef4dd77220sm3567897b3.74.2024.11.28.07.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 07:46:18 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e388503c0d7so733214276.0;
        Thu, 28 Nov 2024 07:46:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4OLCA0KJvcUdmCxV1aGvVXE5b6bf/ZFGJmqnhXlsumeFh0XuHOzcYtkBjIapKmsy5xtNL07gAICwN@vger.kernel.org, AJvYcCV/cGMf/QjlijXvzkh1U7fmS2jfm/pjGCtaO4AU+WuX9Tp2HItKmF39G07fiNUKIFYWKGMds8am1bVw@vger.kernel.org, AJvYcCWSvZh/Ei5g5q4v3MEc4lfJJb+MjRrQlbrVJsgAn8k0K8M0b2aZvAyw74jVkWQMK98pWAwkxUxbFXkyAjtZ@vger.kernel.org, AJvYcCWeVJhEex7qpHCBld21BcJDwJIUf2DDiex2x0QS0o+zowJfqy9EEMGPiA7uEyuW7EgqsC3Gyr1Z7+Q/6ProhSURhp0=@vger.kernel.org
X-Received: by 2002:a05:6902:154b:b0:e33:14fa:2273 with SMTP id
 3f1490d57ef6-e395b887e90mr6783539276.5.1732808778278; Thu, 28 Nov 2024
 07:46:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2024 16:46:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjzR6vgbr_CfR7r-h1FqWxs1nY0hm274kxFmoHjCtRAA@mail.gmail.com>
Message-ID: <CAMuHMdWjzR6vgbr_CfR7r-h1FqWxs1nY0hm274kxFmoHjCtRAA@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Add #renesas,sysc-signal-cells
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com, 
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

CC Ulf

Thanks for your patch!

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/G3S system controller (SYSC) has registers to control signals that
> are routed to various IPs. These signals must be controlled during
> configuration of the respective IPs. One such signal is the USB PWRRDY,
> which connects the SYSC and the USB PHY. This signal must to be controlle=
d
> before and after the power to the USB PHY is turned off/on.
>
> Other similar signals include the following (according to the RZ/G3S
> hardware manual):
>
> * PCIe:
> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
>   register
> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
>
> * SPI:
> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
>   register
>
> * I2C/I3C:
> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
>   (x=3D0..3)
> - af_bypass I3C signal controlled through SYS_I3C_CFG register
>
> * Ethernet:
> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
>   registers (x=3D0..1)
>
> Add #renesas,sysc-signal-cells DT property to allow different SYSC signal=
s
> consumers to manage these signals.
>
> The goal is to enable consumers to specify the required access data for
> these signals (through device tree) and let their respective drivers
> control these signals via the syscon regmap provided by the system
> controller driver. For example, the USB PHY will describe this relation
> using the following DT property:
>
> usb2_phy1: usb-phy@11e30200 {
>         // ...
>         renesas,sysc-signal =3D <&sysc 0xd70 0x1>;
>         // ...
> };

IIUIC, the consumer driver will  appear to control the SYSC bits
directly, but due to the use of custom validating regmap accessors
and reference counting in the SYSC driver, this is safe?
The extra safety requires duplicating the register bits in both DT
and the SYSC driver.
Both usb-phy nodes on RZG3S use the same renesas,sysc-signal, so the
reference counting is indeed needed.  They are in different power
domains, could that be an issue w.r.t. ordering?

I am not a big fan of describing register bits in DT, but for the other
SYSC users you list above, syscon+regmap seems to be a valid solution.
For USB and PCIe control, the situation is different. I more liked the
approach with "reset IDs" you had in v1, as it abstracts the DT
description from the register bits, and the USB and PCIe reset bits use
a different polarity (on RZ/G3S). If future SoC integration changes
the polarity, you have to handle that in the consumer (USB or PCIe)
driver, too.  Unfortunately such "reset IDs" are only suitable for
use with the reset or pmdomain frameworks, which didn't survive the
earlier discussions.

One other option would be to let SYSC expose regulators?
While that would work for USB and PCIe control, we would still need
syscon+regmap for the other bits.

So the more I think about it, the more I like your (clever) solution...

> Along with it, add the syscon to the compatible list as it will be
> requested by the consumer drivers. The syscon was added to the rest of
> system controller variants as these are similar with RZ/G3S and can
> benefit from the implementation proposed in this series.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


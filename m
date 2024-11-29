Return-Path: <linux-renesas-soc+bounces-10758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B033C9DC098
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 09:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06DB2B20B30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 08:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C6F165F16;
	Fri, 29 Nov 2024 08:38:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AF914B088;
	Fri, 29 Nov 2024 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732869519; cv=none; b=eV1ZiVOiXx6F/7l/HHV0PdspSBWn/iGDTLzPmNwB0q16+8Eeb7JzuVaNzldKN9veCcRLVgBcL2JeFWrH6Nr89bHwlV+nk6dv8T21nDuVkR/ehzYkHEieXS5Bp3yuKrCKDCtgGqcG3TW3lrOXal3pWO3tepS5+EDwIXw8q0WcPSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732869519; c=relaxed/simple;
	bh=Ju86IOAXsUBoLviRwHi0UcSGqBezGuFn7iz5s3yOGmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAO1VAAhd+HNTcPt/iwMQ9j64DvBs7Ma5DY3KPUZFbgSlTtDfsql/dfV0CvKCfJGVORzSE572QWSdbsF016A/yLaWtfsc3Sp1wYJ4AuDe6IKipDZCBPp9MMiWlGP5nISUC8BYfmql7igQnPeTgPGVUvkBepyDSoJRlarzLL9sfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4af122fb98aso372792137.1;
        Fri, 29 Nov 2024 00:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732869515; x=1733474315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31rYWVv+vSkqxkg8+7wc0ozORia4OPKenJ62C4GZjFc=;
        b=n8sW31/0x0CzH4kNZ0jEEPv7CjG9LMFDqIZmhoeqa9fRtALpIECJP/umbmQTVt6DHY
         E5JaTu5EXvgIULeQ8er7m3RebHMdC1rX1ap5oBHLZCEnESXphxI1ji4tWXV0KO2mM9Cn
         hy+qMB0rhX9HtwHZD3mb6UZwu2T+//DZsZEKB2RSlUhkNDk0q5xkDJ6YcARzJsSAEmIl
         DkXwdstbfaT56Zv3CzBC+lEdWj6VTldO+V1L3cFxsHwBBr5D/0UjFoFBGk/wfNxe50Tk
         EIzyUaG5cUhncR9K0CusKS5AM256JZ9yF3tfvzuEQinzpzK7hMBhZWJ+b1lfiDJKHrJV
         vXXA==
X-Forwarded-Encrypted: i=1; AJvYcCUCwJ2koxExmC+n644pkCyQBj3KwmClH/2Q178sh0XSzbEOSEmq/8h7GUE36jRYBIaRci9y5v+mMITn2YsFS9yBjpQ=@vger.kernel.org, AJvYcCVCn+WLbqC8U39kQrNng5zDZsyYIl07J91QHWJ4rLl9RQ8S0a5e7amiPnwF/b4rmQ1hw7TG2zy1htvC@vger.kernel.org, AJvYcCWWzD2zdlrU6wHJt4JKZc7LxWAghRuBtqSIsg53IyS6W92LHwt0DHJJUJa86EjAMu8h5MpYWKdReCL5Ooin@vger.kernel.org, AJvYcCXQvvLbf8jdu5DafdlISWNFCyZ0QRs1Je8vFnvrFHpTF1WsQmEgTQ1/Iu32l69A0xRitrHp/dBaCzR/@vger.kernel.org
X-Gm-Message-State: AOJu0YzATR/e87hAJ8Avp8mSAOKilnrYnbouG2poHRxdWqeQVjWq8DZ+
	yvI1b79F9zUgKs47Hugxc9UyGmAV5xeO5OQYJPX1mv7DdlGrGxdNLIO5rQXpiUI=
X-Gm-Gg: ASbGnctIAAP4n0X4uIIA9MwSPm8GcxM8Ri5xGZyofGssUQ9fyLhlmiDaLMgK41G1ZNR
	5AklsSaO7HBDtSPhPHsIQlkV3z0vHfY6Cyu2gQOy9RUpYATRyQZyQowzyA69WYkJhlmGCWWakNh
	hVfj/g5brIGbmrzEd+Mjh01LriU///1FrmJFmi/UgMwXs+GbmUTUPoV516tvm445SnPY4X32ek+
	wfx3kiIUWaQSwH1IZVZ991S1soVXwvb5Fb7TQpHvJ4m6oYKUoKAw/qw0BClS323W21l+oSOc2Xs
	DAbozm3Tfy5N
X-Google-Smtp-Source: AGHT+IGwg82BtrnCw+DWoavxniD1BK6ZLY6KenYHzYDKRP528ya21H+y1k72oLnWAX7NTzVR/Qfkjg==
X-Received: by 2002:a05:6102:32c3:b0:4ae:3a0e:e11d with SMTP id ada2fe7eead31-4af448c57abmr13691382137.13.1732869514888;
        Fri, 29 Nov 2024 00:38:34 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85b82a0e475sm666151241.7.2024.11.29.00.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 00:38:34 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so159626241.3;
        Fri, 29 Nov 2024 00:38:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/EuqyZDSaZhztLT2azI1HPuaxoWZVUSzESBhfT1KSg7LbZkJBRn58w0ZwSYn0WRXQxtodbwYwZ8RQ@vger.kernel.org, AJvYcCVb+G+E06TRnahkt47kmwgYmVcbqr4V2wNzKOTeJoV0Pfs3bQSFG1kfWWkY/dZkmHCCl9URhM8gtagw@vger.kernel.org, AJvYcCX+UxnMFSJK0fGyJN2cj3nRt1r4fobDQF4chnSoUiBK3Rfg/uRLHC2DhS4GxEmCIhiwfMgiobSVcS2zYTbTFJGcZCE=@vger.kernel.org, AJvYcCXe10vUqrEoFgdxESz1NfQt58OhoFd5/sWmlbqbs6Dv4CW10JlozkDjMGG+GCzlzUvhDbNH2sP0am9OfCK7@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:4af:3de9:b91a with SMTP id
 ada2fe7eead31-4af448f4939mr12764535137.16.1732869514228; Fri, 29 Nov 2024
 00:38:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWjzR6vgbr_CfR7r-h1FqWxs1nY0hm274kxFmoHjCtRAA@mail.gmail.com> <0bb9f461-c7a2-4db0-9492-c04cc298504d@tuxon.dev>
In-Reply-To: <0bb9f461-c7a2-4db0-9492-c04cc298504d@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Nov 2024 09:38:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuRSJu1c2zJvOc8EGrZy1uYcN0aiUG6T7WShawPmCNJg@mail.gmail.com>
Message-ID: <CAMuHMdUuRSJu1c2zJvOc8EGrZy1uYcN0aiUG6T7WShawPmCNJg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Add #renesas,sysc-signal-cells
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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

On Fri, Nov 29, 2024 at 9:21=E2=80=AFAM Claudiu Beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 28.11.2024 17:46, Geert Uytterhoeven wrote:
> > On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.=
dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The RZ/G3S system controller (SYSC) has registers to control signals t=
hat
> >> are routed to various IPs. These signals must be controlled during
> >> configuration of the respective IPs. One such signal is the USB PWRRDY=
,
> >> which connects the SYSC and the USB PHY. This signal must to be contro=
lled
> >> before and after the power to the USB PHY is turned off/on.
> >>
> >> Other similar signals include the following (according to the RZ/G3S
> >> hardware manual):
> >>
> >> * PCIe:
> >> - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> >> - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
> >>   register
> >> - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
> >>
> >> * SPI:
> >> - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
> >>   register
> >>
> >> * I2C/I3C:
> >> - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
> >>   (x=3D0..3)
> >> - af_bypass I3C signal controlled through SYS_I3C_CFG register
> >>
> >> * Ethernet:
> >> - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
> >>   registers (x=3D0..1)
> >>
> >> Add #renesas,sysc-signal-cells DT property to allow different SYSC sig=
nals
> >> consumers to manage these signals.
> >>
> >> The goal is to enable consumers to specify the required access data fo=
r
> >> these signals (through device tree) and let their respective drivers
> >> control these signals via the syscon regmap provided by the system
> >> controller driver. For example, the USB PHY will describe this relatio=
n
> >> using the following DT property:
> >>
> >> usb2_phy1: usb-phy@11e30200 {
> >>         // ...
> >>         renesas,sysc-signal =3D <&sysc 0xd70 0x1>;
> >>         // ...
> >> };
> >
> > IIUIC, the consumer driver will  appear to control the SYSC bits
> > directly, but due to the use of custom validating regmap accessors
> > and reference counting in the SYSC driver, this is safe?
>
> I'm not sure I fully understand the safety concern.

Sorry for my bad expression, this was more like a rhetorical question.
I meant that it is safe because:
  1. Consumers cannot perform arbitrary register accesses,
  2. The reference counting guarantees correct operation, despite
      both usb-phy nodes using the same renesas,sysc-signal.

So everything is fine.

> > The extra safety requires duplicating the register bits in both DT
> > and the SYSC driver.
>
> One other option I saw was to have common defines for registers that coul=
d
> have been shared b/w driver and DTSes. But it looked better to me the way
> it has been presented in this series.
>
> > Both usb-phy nodes on RZG3S use the same renesas,sysc-signal, so the
> > reference counting is indeed needed.  They are in different power
> > domains, could that be an issue w.r.t. ordering?
>
> In chapter "32.4.2.1 USB/PHY related pins", section "When either Port1 or
> Port2 is unused" of the RZ/G3S HW manual it is mentioned "Since USB_VDD18=
 /
> USB_VDD33 are common to 2 Port PHY, it is necessary to supply power even
> when one of the
>  ports is not in use".

Does that mean you have to power the other PHY on through the
CPG_BUS_PERI_COM_MSTOP register, too?
(I know you haven't added R9A08G045_PD_USBx to the USB nodes yet,
 as #power-domain-cells is still 0).

> (From the discussions w/ the internal HW team) The PWRRDY is an (software
> controlled) indicator to the USB PHY that power supply is ready.
>
> From that and [1] I get that both PHYs are powered by the same regulators
> (USB_VDD18/USB_VDD33) and the USB PWRRDY signal need to be set before/aft=
er
> the USB PHY power off/on. Because of this I consider the order doesn't ma=
tter.
>
> [1] https://gcdnb.pbrd.co/images/0a1zYBFZXZVb.png

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


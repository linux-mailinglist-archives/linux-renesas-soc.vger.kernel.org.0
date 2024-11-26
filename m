Return-Path: <linux-renesas-soc+bounces-10709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBD9D98B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 14:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 038CFB21D4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 13:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF051865E3;
	Tue, 26 Nov 2024 13:42:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576271D52B;
	Tue, 26 Nov 2024 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732628541; cv=none; b=Tqy00tEjZU6rfLumsNp8GvOfo6OtAPob6zRCXBMZDM2tvm2FT+1Q3Pw8lsU7/Kc3HfKfGbjyo58NrUWf494Z4dMeYg4BkIaBd4X6WRP7FT1+N1LloogxsN9k/jxI2BvW4Gy+ggdJRSundVfi+6ub7XErlIZp0J5RrXpCpf5Mm0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732628541; c=relaxed/simple;
	bh=Nqp+tSKa5TBc0GFn3kfkMzj6rtuwiH6tAT8BgyAa5Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ly2keNgMp7OCBFEzqqfUp9hQunTq9jFWRrf644MzcKBraVoHK3JpMKmizfe3SHaWBivSGGCHz6Jxndifgo9UlNVHNqikhkvkCv4WK+enMRnF3McwYpeQFRSzEci26UmKOmzih6mvkHdErHDRYfbdoeUw10BcovkIL04aNfed3Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ef0cee54daso22593907b3.3;
        Tue, 26 Nov 2024 05:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732628536; x=1733233336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwzB/qcs+FEe5xmAoaiq0XfbUwF5QZEVDjPtTScGPCA=;
        b=Whv8RJI59/wH5/TUqt1mnhQPZAlZBMH6WTJVqi8nhi0W7iSBe4lsRIkv5XtQXP2n+K
         zmFIWA4mQO95lkkjglh1PXU1s7HBKTy8dWcahbwBTbTCk3T/zUu9SkYGEVw8whJExJKY
         3V43N6Yjg0B+kT5MsdexPJEMeEW38BloMzxmWLHlLr8IYV9gl9hJ26Zja1jGnuN1misi
         PfXtZpd4F5nl7h7eIxddluuZy5hcGdf1U5x1Yd2uqLFq4Vh+diKvkljUr5GZCyORQUFO
         n4qj+Sv27jhq6th0rQyAFtUZJ7AFwMvgBjOhfIy8JCGKCbb17GUtE8y675pRO4c7+uzI
         cE1g==
X-Forwarded-Encrypted: i=1; AJvYcCUeeNfZfrWm5/g2zCqdIVnDyqUWsTiT5stMGyOQRjtRwTqpe5GMZ8a8L4xZDyQ0EMyqiCMH12a6K7eGxndSJsmmeg8=@vger.kernel.org, AJvYcCW5ZDbH1V/0SR9l07C8lArvPiBOeDV1P5IvfkPXIoQ8VmA/6CWbZWLku07u8WCzPTpSE1Z3wp0aFDJg@vger.kernel.org, AJvYcCXRGM07vxbIr4RIxxNcJVzGicwLCBfOKQk+Ncyl7p2OFPJIbHpl817pD484J8BIijZ3ESzN+HRDC6zGrg/Y@vger.kernel.org, AJvYcCXcZIRp6P/g802CWp2mZLV433J2T3QZuD2BSIaAxPuHGieLSnr1doG9KElVq0L5xf+ouOR8B/UqoEUh@vger.kernel.org
X-Gm-Message-State: AOJu0YxwxgPm8cRE+maCnBlTSdSVeI/hodDjxOtv0Zs2OUK+HXHeF+bN
	CBHpf5zrxXZjsRyYcowDSuPQpMX/+bYz7HOr+A6xDuSyaL0VBv9VhS3neobB
X-Gm-Gg: ASbGncvf1gIx3kgvUv6hfAzOy6Nsu/GgoXd49M5ulytcULps/mG+UpHYCSkVxrdfXkZ
	ajJBAVpRY2jUi1trUdFX5+dgLNvmWVXe5YxJphO+BUtY22grN3ZC+jH6yr88OOPeV200fC6jllY
	SEoK9r4SBEdibfjIUDtUtr0n/WIte6eW1plkFHqT8oQUmzGo5ieP6PgD+iTCcTu5n1eWWeyG2Fr
	y15QWQ7yhcHe9EtNigBa5+D118r2GyThT666cjoyE22p218J1jcWnd4ZF2PKIOGwvoHlbhyMdwc
	4ERUw0Js1VZCq4Ly
X-Google-Smtp-Source: AGHT+IFSpRNSa8EM7brwKud9YrFpNQe2U0pZSD52kVm/5mffIyhBE9hZxo8AsuxNu8Uk/bOfv8/zUQ==
X-Received: by 2002:a05:690c:6f81:b0:6e3:32e2:ecbf with SMTP id 00721157ae682-6eee08ea243mr173968207b3.24.1732628536086;
        Tue, 26 Nov 2024 05:42:16 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe2a150sm22445107b3.30.2024.11.26.05.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 05:42:14 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6eeb66727e7so54824267b3.2;
        Tue, 26 Nov 2024 05:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdx5IGn1yfeUul1zcMCHIqyGDosPaOdKp4qDRFgt1OIxzA5CK+tNAp9MdK0EuK0NaDaPy3cbOzD8cc4ESu@vger.kernel.org, AJvYcCVemDdZvTqzVZvxbXe6OB5bPw+CamdLdMzatvoHyBRCEtsqN5IseZ6tDU95pYd+QywR/QGqcA/sm99F@vger.kernel.org, AJvYcCX1e5lZ+8bDFKbZPxDzVJ0Fj0161E3qGR1q6EVHIyPeTAvjiGDKOD0mOyCZGqR6rJAKG/CW7ulRQ5TFamVJ6ERyeEc=@vger.kernel.org, AJvYcCXeaCE9RtmsD0+joMFcBar7DOdb2uuBbeAlU3DpG0HuUkY/QdkI6esY/qSu9u4IhYJ3SswTXgVdDjPg@vger.kernel.org
X-Received: by 2002:a05:690c:67c1:b0:6ea:95f5:2607 with SMTP id
 00721157ae682-6eee08a90a2mr143879177b3.5.1732628534112; Tue, 26 Nov 2024
 05:42:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
 <20241126092050.1825607-3-claudiu.beznea.uj@bp.renesas.com> <TY3PR01MB11346C9A56B483666575EB23A862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C9A56B483666575EB23A862F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Nov 2024 14:42:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkXo=HSqoF2hur8Nvder6yOg_Aqgzq=aFvfti+9=PnJA@mail.gmail.com>
Message-ID: <CAMuHMdVkXo=HSqoF2hur8Nvder6yOg_Aqgzq=aFvfti+9=PnJA@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ family
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, "vkoul@kernel.org" <vkoul@kernel.org>, 
	"kishon@kernel.org" <kishon@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Nov 26, 2024 at 10:28=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > -----Original Message-----
> > From: Claudiu <claudiu.beznea@tuxon.dev>
> > Sent: 26 November 2024 09:21
> > Subject: [PATCH v2 02/15] soc: renesas: Add SYSC driver for Renesas RZ =
family
> >
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The RZ/G3S system controller (SYSC) has various registers that control =
signals specific to individual
> > IPs. IP drivers must control these signals at different configuration p=
hases.
> >
> > Add SYSC driver that allows individual SYSC consumers to control these =
signals. The SYSC driver
> > exports a syscon regmap enabling IP drivers to use a specific SYSC offs=
et and mask from the device
> > tree, which can then be accessed through regmap_update_bits().
> >
> > Currently, the SYSC driver provides control to the USB PWRRDY signal, w=
hich is routed to the USB PHY.
> > This signal needs to be managed before or after powering the USB PHY of=
f or on.
> >
> > Other SYSC signals candidates (as exposed in the the hardware manual of=
 the RZ/G3S SoC) include:
> >
> > * PCIe:
> > - ALLOW_ENTER_L1 signal controlled through the SYS_PCIE_CFG register
> > - PCIE_RST_RSM_B signal controlled through the SYS_PCIE_RST_RSM_B
> >   register
> > - MODE_RXTERMINATION signal controlled through SYS_PCIE_PHY register
> >
> > * SPI:
> > - SEL_SPI_OCTA signal controlled through SYS_IPCONT_SEL_SPI_OCTA
> >   register
> >
> > * I2C/I3C:
> > - af_bypass I2C signals controlled through SYS_I2Cx_CFG registers
> >   (x=3D0..3)
> > - af_bypass I3C signal controlled through SYS_I3C_CFG register
> >
> > * Ethernet:
> > - FEC_GIGA_ENABLE Ethernet signals controlled through SYS_GETHx_CFG
> >   registers (x=3D0..1)
> >
> > As different Renesas RZ SoC shares most of the SYSC functionalities ava=
ilable on the RZ/G3S SoC, the
> > driver if formed of a SYSC core part and a SoC specific part allowing i=
ndividual SYSC SoC to provide
> > functionalities to the SYSC core.
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your review!

> > ---
> >
> > Change in v2:
> > - this was patch 04/16 in v1
> > - dropped the initial approach proposed in v1 where a with a reset
> >   controller driver was proposed to handle the USB PWRRDY signal
> > - implemented it with syscon regmap and the SYSC signal concept
> >   (introduced in this patch)

[...]

When reviewing, please trim your response, so other people don't have
to scroll through hundreds of lines of quoted text, to find any other
comments (if any).

Thanks!

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


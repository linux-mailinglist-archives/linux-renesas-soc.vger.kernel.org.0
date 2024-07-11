Return-Path: <linux-renesas-soc+bounces-7280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F492EB63
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 17:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C59F1B225C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 15:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595AB16B752;
	Thu, 11 Jul 2024 15:14:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A9616B750;
	Thu, 11 Jul 2024 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720710874; cv=none; b=IvmFP4vrtAbd9eKgJrM7hbkNJs+qy2C3jdTGOhq8MwVyzaMhzvSvPvelxEVcSGKcX1vM4DDb5WNSbY/C+9wvP7FtRJ62WhC5zQl1MuTr6zgyo5dPFnLEcBRb4OqjGOpPWn1zqLr9xMnpLAy+nABmccUKfRldxY9SH5oAlkdK3Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720710874; c=relaxed/simple;
	bh=E2/ZGPEcI1Rw3PXVmpTzOifaaKG2qjpVrpRBa1H77OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmVDSqXKEIf8yIFVuyilT9Z6yxQcTBeI28uyl6kJLaZ+396F5vyYCm8sb56dbEoMdfO8jhH1iZTaNq8G8VlO/DBjd+2LsjgNDwkIxICjBqC38EffiGcXu6ojuAT3wNd9ptpQTNt/tqmLvHFRnr7T9g+tMv+qa94WH1TyDXtYX9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64f4c11d2c9so8820887b3.2;
        Thu, 11 Jul 2024 08:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720710870; x=1721315670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG1IUAibKVepFJDLQ5uiThldezvK+l5iRWwuzpOK2ok=;
        b=ILwOi0fcLm7fRXHSZfHr5jMlnNJOdPcbjJLDHxPVxt+plCI0KQEiFlaAbLBK1AVmuD
         T9kW+qJEA4F0c/qcjpuYtFRu0IDrE9AC23e411LoRSrzMtb2WLlpS77vWhVbIA3A1S7E
         kc9trUGqrBAEQDJN9a2XJbC3ZCIb4lAZA/17SMTGdjy+N4tv9pGVCQHGrbs10u/3MM5Y
         dmRWM2i2q0QXjqkffGYDrQyprpsL9ldoCHbwYmEjNlarTR6N+GhqJ02Nwwd6gP5JC8UD
         wgX4z7LJuMAxfM+SIxUTpTSX9Gca/43xJ8mcun1cu0jEk53xytEBjT/00DyyaYRlRVyP
         IBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyTgJ1vOmhLDEOJXZ91/DPDjPqRxcvcb7v/FeKXrDflUFHpG3rCkYOOf86Ef08KFT2oK/1LDKFNWOS5mVb8QrrOzMLsZhz1wbI3Y36YtMaAsV12ot2/9jZnKfDU1BSaf+1EMtwKTLYYfxlO/Yq
X-Gm-Message-State: AOJu0Yyvv1H1yfoqV7txo/KKV75JNEjHzRLgP+weL+Jki6qZ4CW1M+o9
	/w9W8cPoX1zC6q/1dhK2n/05DFYXSez7vzWSuYwYjj8Re02YQwgLDd7vHake
X-Google-Smtp-Source: AGHT+IGIizVSXzstb/zW1oCYPoNHmeMK18xzJuTrvxZBhwfFkCINrREeGE4H7nmIUgB7L5xqo8FKgA==
X-Received: by 2002:a05:690c:d8c:b0:650:9c5e:f6db with SMTP id 00721157ae682-658eed60aabmr115717467b3.18.1720710869993;
        Thu, 11 Jul 2024 08:14:29 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e74919b9sm11074567b3.141.2024.07.11.08.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 08:14:29 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfef5980a69so1049522276.3;
        Thu, 11 Jul 2024 08:14:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXK+ydQfUU02GA7fU7FIEjBdb+bDEd9zx+C9x7fha371qBjLdeUFNhSWmnBrGSS/Dk0N5OaTW1FooBWd/7tZPF6G1MkEQwBx1ZJunBuRkduhYuQaZ0pSUZ4oiOE5zNCAJgvpXZASmRHj23VEL+Q
X-Received: by 2002:a25:c883:0:b0:dff:3308:b921 with SMTP id
 3f1490d57ef6-e041b0f5f31mr9950761276.31.1720710869408; Thu, 11 Jul 2024
 08:14:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
 <20240616105402.45211-5-biju.das.jz@bp.renesas.com> <CAMuHMdX5ayWbLEEa6nAipECVB6H9eCpRg21pu3zYrTdiER0F+Q@mail.gmail.com>
 <TY3PR01MB1134692D0F5D291398FCE5F1086A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134692D0F5D291398FCE5F1086A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jul 2024 17:14:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVc40j9qvmyFpVpKcd_uSrjFj6s5-RmgXZgp2w8HYCGfg@mail.gmail.com>
Message-ID: <CAMuHMdVc40j9qvmyFpVpKcd_uSrjFj6s5-RmgXZgp2w8HYCGfg@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] regulator: Add Renesas RZ/G2L USB VBUS regulator driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Jul 11, 2024 at 4:58=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Thursday, July 11, 2024 3:40 PM
> > Subject: Re: [PATCH v4 4/6] regulator: Add Renesas RZ/G2L USB VBUS regu=
lator driver
> >
> > Hi Biju,
> >
> > On Sun, Jun 16, 2024 at 12:54=E2=80=AFPM Biju Das <biju.das.jz@bp.renes=
as.com> wrote:
> > > As per the RZ/G2L HW manual, VBUSEN can be controlled by the VBOUT bi=
t
> > > of the VBUS Control Register. This register is mapped in the reset
> > > framework. The reset driver expose this register as regmap and
> > > instantiates this driver. The consumer will use the regulator API to
> > > control the VBOUT bit as the control need to be done in the atomic co=
ntext.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch, which is now commit 84fbd6198766336f
> > ("regulator: Add Renesas RZ/G2L USB VBUS regulator driver") in regulato=
r/for-next.

> > > --- a/drivers/regulator/Kconfig
> > > +++ b/drivers/regulator/Kconfig
> > > @@ -1634,6 +1634,15 @@ config REGULATOR_UNIPHIER
> > >         help
> > >           Support for regulators implemented on Socionext UniPhier So=
Cs.
> > >
> > > +config REGULATOR_RZG2L_VBCTRL
> > > +       tristate "Renesas RZ/G2L USB VBUS regulator driver"
> > > +       depends on ARCH_RZG2L || COMPILE_TEST
> > > +       depends on OF
> > > +       select REGMAP_MMIO
> > > +       default ARCH_RZG2L
> >
> > As the "rzg2l-usb-vbus-regulator" platform device is only created by dr=
ivers/reset/reset-rzg2l-
> > usbphy-ctrl.c, perhaps this should be made stricter by using "default R=
ESET_RZG2L_USBPHY_CTRL"?
>
> OK.
> >
> > Alternatively, RESET_RZG2L_USBPHY_CTRL could select RESET_RZG2L_USBPHY_=
CTRL if REGULATOR.  Can
> > RESET_RZG2L_USBPHY_CTRL work without REGULATOR_RZG2L_VBCTRL?  If not, R=
ESET_RZG2L_USBPHY_CTRL should
> > depend on REGULATOR, too.
>
> Yes, from functionality point it works for both host and device mode with=
out REGULATOR_RZG2L_VBCTRL.
> From specification point, some customers reported on device mode, VBUS is=
 showing 5V.
> So, by adding vbus regulator, I am controlling this voltage and forcing t=
o 0 for device mode
> and 5V for host mode.
>
> Please share your input how to proceed.

As it works without, I think changing the default of
REGULATOR_RZG2L_VBCTRL from ARCH_RZG2L to RESET_RZG2L_USBPHY_CTRL is
the most appropriate option.

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


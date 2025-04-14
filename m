Return-Path: <linux-renesas-soc+bounces-15943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC2A88A3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 19:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3745D18993CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706F328B4F1;
	Mon, 14 Apr 2025 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlMmxK+0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C5B18BC3B;
	Mon, 14 Apr 2025 17:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652611; cv=none; b=PRYIo+diWT2BFJASb8uch/9wskoRjjDOdfjBMs8Fr5VEs+BOjh8n4h03bbWfjMxImU7In0srsEDImiJuTMwDIdQgwqGgCMmTP4UWyMBvxsVMqnlK+cjcdBU4CB7CkNUFzEHGixwnKr4WvblIWhi9VovkRjLbjK5WJiDyrXoFkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652611; c=relaxed/simple;
	bh=/GAusDKonHkaX5JIM0jxXotA46d8ZqdLMObqUaMOPX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSO1Sj6yMB8EZwlYF9fv0skCFGt8uArVkqCEwCJWk6hPjhN+ptETiqymhZJrZI9ZOA0lgs4/MozczQDtviEXrswTGMLRbD0AeKeLRXIxu2us/kWQ7N3dqz56qQszEJqhVi9vfrz/Lhv2dzELM50h5Eq9ljYgZcyh6ZwchNiovxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlMmxK+0; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-528ce9731dbso502638e0c.0;
        Mon, 14 Apr 2025 10:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744652608; x=1745257408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH7WH3HsjYW5TTPLagNRBD13zhunmFxlYbALOshn7VE=;
        b=SlMmxK+0yDO8S+7FVjnJnj4M9jccJpNkTfoG/vrETlav3ir2aZs588Ft2n96dEDd8W
         mr9sYlMx7+NYXrdmOf6f5EBYhcLpa2Aia1Judw50Tz3Um1aQ/dfY13KouIjPGedyoS+8
         gnUotgJOy/+DoCBrb4qQHDNb9znjKG33XXXC1PVuA8GC6npHWbwneBkTc1ropoEza9A1
         A+1Z3NeL59klekbgSQSmVHHXExldQKiCJwhoAedq+O+28jRbawfIAKgJCCJqn9gjP/G2
         /YMU0Wh6Kqob5lNqVnQZ6OozrzmZsPe4b0L9NaH5GXCjRhXPzjg9M/+rGSjtY82FCTtR
         mETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652608; x=1745257408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rH7WH3HsjYW5TTPLagNRBD13zhunmFxlYbALOshn7VE=;
        b=rcfP6uhIanOXEFlWQRXfyHuPkfkmZUBD1e8QAx3jixM5d9XYovUoMRqI7NzwQMSJL+
         fMsLqJ9e4P2tgyNnnGYl2BlTP4/WvDUmCvK6pryyONnTLR1JfgdAmPBRf+yxnv6Gffr5
         yR6NTbSvDDEAYhhANT9Hc5z6MQuYL6v9uMJ5dtlmYeBU+X50Lykxe5v9Vzp7yXdvhvi8
         zSkWtmJY5EdwuduvLQ6Wb/46ndEB63p+A2plywEpvpvJdYAxAq8DLA+P3ZF0zgAEIujI
         MEloOdc953vjUrVSQQ86Qp4arHhY+3iuuSZzNhqTo42PBN1sLMxHcY8bW/1g8bdgyLCF
         chIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHWXpYO84CCpaw+AGIaqxondjCVmyK5uSJgLDsz44EqN0VZZQ+QaXgmK9ppICYmXSPbsggo3iNpDO+quU8yBzIOaA=@vger.kernel.org, AJvYcCVQQfKsnMrwB19fzGL1/lEmZPGtaugbCf4CjDtrSuVydAPYKjFaYZMGRkLzWDqCC65zhnu8DAWu+PMVKTDM@vger.kernel.org, AJvYcCX6afre3m38U2kOl/csJzYQyJNCGXU3D3435elvSV9u7TjGf+gYzYimzwHAu5JkpNkFbA0jBFyJF0t6@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/26/JeyW0G5a36UiPMDOM0pQbT7e9h8tE/Ajc5fkBpamagOI
	arl10VEcq1JldTvoYVGLUFZVhAcWKxGFjsh9zhV1lSnHUto1Kf1hApBubrknu2XvxNfnc2D0neE
	AcwCXSPoXjrOZrAYLATe2fYL861g=
X-Gm-Gg: ASbGncskaF1RJLGJ5aX3ma8TRKMsJOezSdJgtZzG4T72/2WgPbsfiyIRVhbRBse77TE
	5iHja72owoYYV5W6uqcfq6hdJhvAOKZC2IXfTzr3yIJnizE6LyPzkNehrtVGC5f3LYUhf7bS7v6
	A5qjKSleEaw7CNKX0XWFZYMp6qgtgOOo0qnFzQT55bsR7jIFBD3EQX6A==
X-Google-Smtp-Source: AGHT+IH/2ShLH6ygnla8obiETi0DL3OWDXWWuqzVvQNeVdlFWV1DXiaR9E/+sLhY2ShC6RZO0XGE9m6pgLB6cJ13UHw=
X-Received: by 2002:a05:6122:2218:b0:518:7ab7:afbb with SMTP id
 71dfb90a1353d-527c35c618cmr8115322e0c.8.1744652608087; Mon, 14 Apr 2025
 10:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB113469552384EB52CED89FDC286B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113469552384EB52CED89FDC286B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 18:43:02 +0100
X-Gm-Features: ATxdqUF--DR9eGbhr3mqR0ytKAIwOyhaD_1ZbdVw5yb_38zz8L0tik_MAKXKxVE
Message-ID: <CA+V-a8uxZRnAC7u2wX10qrQKVVbjJ1yhzN91yQRKQXb=hZWs3A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Mon, Apr 14, 2025 at 2:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 14 April 2025 14:00
> > Subject: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesa=
s RZ/V2H(P)
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement a USB2PHY port reset driver for the Renesas RZ/V2H(P) SoC.
> > Enable control of USB2.0 PHY reset and power-down operations, including=
 assert and deassert
> > functionalities for the PHY.
> >
> > Leverage device tree (OF) data to support future SoCs with similar USB2=
PHY hardware but varying
> > register configurations. Define initialization values and control regis=
ter settings to ensure
> > flexibility for upcoming platforms.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/reset/Kconfig               |   7 +
> >  drivers/reset/Makefile              |   1 +
> >  drivers/reset/reset-rzv2h-usb2phy.c | 241 ++++++++++++++++++++++++++++
> >  3 files changed, 249 insertions(+)
> >  create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig index 99f6f9=
784e68..6c7dbd8ca580 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -225,6 +225,13 @@ config RESET_RZG2L_USBPHY_CTRL
> >         Support for USBPHY Control found on RZ/G2L family. It mainly
> >         controls reset and power down of the USB/PHY.
> >
> > +config RESET_RZV2H_USB2PHY
> > +     tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driv=
er"
> > +     depends on ARCH_RENESAS || COMPILE_TEST
> > +     help
> > +       Support for USB2PHY Port reset Control found on the RZ/V2H(P) S=
oC
> > +       (and similar SoCs).
> > +
> >  config RESET_SCMI
> >       tristate "Reset driver controlled via ARM SCMI interface"
> >       depends on ARM_SCMI_PROTOCOL || COMPILE_TEST diff --git a/drivers=
/reset/Makefile
> > b/drivers/reset/Makefile index 31f9904d13f9..30d0fb4ac965 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -31,6 +31,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
> >  obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
> >  obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
> >  obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
> > +obj-$(CONFIG_RESET_RZV2H_USB2PHY) +=3D reset-rzv2h-usb2phy.o
> >  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
> >  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
> >  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o diff --git a/drivers/=
reset/reset-rzv2h-usb2phy.c
> > b/drivers/reset/reset-rzv2h-usb2phy.c
> > new file mode 100644
> > index 000000000000..737b768829c9
> > --- /dev/null
> > +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> > @@ -0,0 +1,241 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/V2H(P) USB2PHY Port reset control driver
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corporation  */
> > +
> > +#include <linux/cleanup.h>
> > +#include <linux/delay.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > +#include <linux/reset-controller.h>
> > +
> > +struct rzv2h_usb2phy_regval {
> > +     u16 reg;
> > +     u16 val;
> > +};
> > +
> > +struct rzv2h_usb2phy_reset_of_data {
> > +     const struct rzv2h_usb2phy_regval *init_vals;
> > +     unsigned int init_val_count;
> > +
> > +     u16 reset_reg;
> > +     u16 reset_assert_val;
> > +     u16 reset_deassert_val;
> > +     u16 reset_status_bits;
> > +     u16 reset_release_val;
> > +
> > +     u16 reset2_reg;
> > +     u16 reset2_acquire_val;
> > +     u16 reset2_release_val;
> > +};
> > +
<snip>
> > +static const struct reset_control_ops rzv2h_usbphy_reset_ops =3D {
> > +     .assert =3D rzv2h_usbphy_reset_assert,
> > +     .deassert =3D rzv2h_usbphy_reset_deassert,
> > +     .status =3D rzv2h_usbphy_reset_status,
> > +};
> > +
> > +static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *r=
cdev,
> > +                                     const struct of_phandle_args *res=
et_spec) {
> > +     /* No special handling needed, we have only one reset line per de=
vice */
> > +     return 0;
> > +}
> > +
> > +static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev) {
> > +     const struct rzv2h_usb2phy_reset_of_data *data;
> > +     struct rzv2h_usb2phy_reset_priv *priv;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct reset_control *rstc;
> > +     int error;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     data =3D of_device_get_match_data(dev);
> > +     if (!data)
> > +             return dev_err_probe(dev, -ENODEV,
> > +                                  "failed to match device\n");
>
> This check is not needed as there is always data.
>
Agreed, I will drop this.

> > +
> > +     priv->data =3D data;
> > +     priv->dev =3D dev;
> > +     priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(priv->base))
> > +             return PTR_ERR(priv->base);
> > +
> > +     rstc =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> > +     if (IS_ERR(rstc))
> > +             return dev_err_probe(dev, PTR_ERR(rstc),
> > +                                  "failed to get deasserted reset\n");
> > +
> > +     spin_lock_init(&priv->lock);
> > +     dev_set_drvdata(dev, priv);
and this too and send a new version.


Cheers,
Prabhakar


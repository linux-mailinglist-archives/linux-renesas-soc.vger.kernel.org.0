Return-Path: <linux-renesas-soc+bounces-14341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644BA5F240
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 12:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A8D6179115
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Mar 2025 11:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A5A264FBD;
	Thu, 13 Mar 2025 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9cksqnS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA7626618B;
	Thu, 13 Mar 2025 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741865036; cv=none; b=iBCDHg8MEKycgPz4k6NeQlwxoCVSrlXPCqerfXA9rlExsbLaEvGDxmnrvyeTAjChs0fIQPtvWYnsjR9+dJ3ZCqG5nPwLQranE2KWs7yKBNsBGFFniR5oQcHBHRyOajCvUKXDlZux47J3XospotcU0naoWNd12CnBwPSR8ocdvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741865036; c=relaxed/simple;
	bh=iWUTKHkQdZP7BxfZpPp3pCRlDp42MsDNhvhZU3Pus+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOL0fYYGnnZUcx9eCKhIrNfjN6uHucs0/cHdnzmhrEfurIj4Usx9uRJYWylOZUWW3r5QMcQjixn30JLlL9Be9y7jtq08gXRelG0Z9GY+0ZgcxRq0bMl242u3s6/cFr01akTmdwfo76PFxBOxsaz88xS9BIUqs28KtXiBnLfLOS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9cksqnS; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523b8881d31so356175e0c.2;
        Thu, 13 Mar 2025 04:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741865033; x=1742469833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYGHZxrHmGt3tg9UgmmzojVku2KFnrh2OCRVAJ/Cd9g=;
        b=m9cksqnSbMVWlb4atbRewfgZq8baL5EHI1wigq3QiDsdl8lfCxrBRBSKU8nPi61Y+B
         QEr4c4ZU+vtQs6NyEHgpaPuz3HX8cqobevEhuIxIYgXL1rVX6iwWFddj1AIrd4rxFrzn
         xQ5dHyEClVR6oWmC4u9ipesWkDbQ8w/9GzCNqNerOPVzmqFyWtmE0L2P4BJjaJuFIp08
         O7LNRqjtZ4HHzlq8pgmj0l2n2BXTMhF8ZmRlZTitT3AtPdxjcZlusIGcODZvJsNRVV5z
         KUP+tijVWCH7sGVqWXZURed3dRYW2b3QK3WghBfFfaDCvElWnUyITHxXh3l28dprePRI
         rMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741865033; x=1742469833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYGHZxrHmGt3tg9UgmmzojVku2KFnrh2OCRVAJ/Cd9g=;
        b=ujbX/iej6jINGcVklDo3KTuatdHVkLzTlXaLobgVamFAf3p/oaRzfyfXOIjDCv74yb
         LVJEuP3jAlGqprv4iN19EdCPg6dAm7hN4T1GaXlsQj8B2J26Ok6pVxGqSHmrDJupKEg6
         v9Y3OFXFcfhKjckhBN7/mBv7YqnuiqiLhGiEHT1KQbjgmaDjwoX+pwA8ALypZjEE5O10
         KpK1uT39alVAnfr3hPRiqX+0Z0vIGAbgIbuOBd8LpHW4L1HpDPw9LIX+AhTZNmXb2L3i
         o1ekjHVDnugP6RmOkwQRLXOHu+eIPO6xnShtDeHzSh77elq5JeJqQUN6Si63kZFiQQg0
         IkSg==
X-Forwarded-Encrypted: i=1; AJvYcCVyjxazSEawfiotVvwA1ScwSZ1ESZ+ovT4hEtnTCS7QKQjOj3hnec20IItV0TcCo20m9FMqconv2fPFBQKL@vger.kernel.org, AJvYcCWoSyhU8ToUe8v+vBv0++VhDvQDU9Wc1spHE/lWiKsMwZir6ZfcqUMg4TVyUPcm8Zx84HPP1oOf6A0p@vger.kernel.org, AJvYcCXQ+ZWA76oODSYY265geHTCGaAjBLJMePG+VYDRlqRzaMHmVXRr786wYHzUAvYl8ouEGR5u/4LZLqFdiAH2ylL13fg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+1JlYz6Ifvdy0+g8qVQHnyxAvDoB+t4OvK6jIbbYRhWEZAFqP
	RUe3ZHdrnkuGB1L/xW1VE/jJTdMTFRsFqEtgGXgl5uF0lWNJaojoNB31cwkjKRluz/9eeYFEJhI
	10YHIIAppzIbkSeJ2emev46G87P/v1T1CMS8=
X-Gm-Gg: ASbGncvPGoqRAM7eDnHqx1t4jOqwTptC5Jgt+Qtd4K7Fgf97LjUGdRjyCATIojZi+VS
	7gdZcmTjQeDTUeSxRZ3pIEtAfBtd6wXyX7GaertIfs2Nn4WIIy746Se798tfGN1NxmJfzmk+ymw
	+2Rn6l7h6FDqzFg+LoiUZtBzglw+peFqWscW1l1t9n/oaGjC2yYe94/HJxO5OP69N7yhluTg==
X-Google-Smtp-Source: AGHT+IHIsFRe6uzLJ5oS7vz1eOo7Dqc1g2VC3nhojAeGCDWYcNcjn7+Appg+Pjyfr484U4LMnCJJ4jxi4uV1aJAg+B0=
X-Received: by 2002:a05:6122:c86:b0:520:6773:e5bf with SMTP id
 71dfb90a1353d-523e3ff02fcmr17137944e0c.1.1741865033534; Thu, 13 Mar 2025
 04:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <30b6841b3ce199488698ab272f103a0364adb000.camel@pengutronix.de>
In-Reply-To: <30b6841b3ce199488698ab272f103a0364adb000.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Mar 2025 11:23:27 +0000
X-Gm-Features: AQ5f1Jqk_PKanpHcufQJr8175iFxT3WGy7hP1GqX3uhR9SrxujpYuG4THMIQ0Wo
Message-ID: <CA+V-a8s3t7kAGZszmAL+xrsbpdPcstvyJM_CpcpS26Vp16oM8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas RZ/V2H(P)
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

Thank you for the review.

On Thu, Mar 13, 2025 at 8:37=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Mi, 2025-03-05 at 12:39 +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the USB2PHY control driver on the Renesas RZ/V2H(P) SoC=
.
> > Make the driver handle reset and power-down operations for the USB2PHY.
> >
> > Pass OF data to support future SoCs with similar USB2PHY hardware but
> > different register configurations. Define device-specific initializatio=
n
> > values and control register settings in OF data to ensure flexibility
> > for upcoming SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/reset/Kconfig                    |   7 +
> >  drivers/reset/Makefile                   |   1 +
> >  drivers/reset/reset-rzv2h-usb2phy-ctrl.c | 223 +++++++++++++++++++++++
> >  3 files changed, 231 insertions(+)
> >  create mode 100644 drivers/reset/reset-rzv2h-usb2phy-ctrl.c
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 5b3abb6db248..bac08dae8905 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -218,6 +218,13 @@ config RESET_RZG2L_USBPHY_CTRL
> >         Support for USBPHY Control found on RZ/G2L family. It mainly
> >         controls reset and power down of the USB/PHY.
> >
> > +config RESET_RZV2H_USB2PHY_CTRL
> > +     tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY control dr=
iver"
> > +     depends on ARCH_RENESAS || COMPILE_TEST
> > +     help
> > +       Support for USB2PHY Control found on the RZ/V2H(P) SoC (and sim=
ilar SoCs).
> > +       It mainly controls reset and power down of the USB2 PHY.
> > +
> >  config RESET_SCMI
> >       tristate "Reset driver controlled via ARM SCMI interface"
> >       depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index 677c4d1e2632..3cb3df018cf8 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -30,6 +30,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
> >  obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
> >  obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
> >  obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
> > +obj-$(CONFIG_RESET_RZV2H_USB2PHY_CTRL) +=3D reset-rzv2h-usb2phy-ctrl.o
> >  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
> >  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
> >  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
> > diff --git a/drivers/reset/reset-rzv2h-usb2phy-ctrl.c b/drivers/reset/r=
eset-rzv2h-usb2phy-ctrl.c
> > new file mode 100644
> > index 000000000000..a6daeaf37e1c
> > --- /dev/null
> > +++ b/drivers/reset/reset-rzv2h-usb2phy-ctrl.c
> > @@ -0,0 +1,223 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Renesas RZ/V2H(P) USB2PHY control driver
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corporation
> > + */
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
> > +struct rzv2h_usb2phy_data {
> > +     const struct rzv2h_usb2phy_regval *init_vals;
> > +     unsigned int init_val_count;
> > +
> > +     u16 ctrl_reg;
> > +     u16 ctrl_assert_val;
> > +     u16 ctrl_deassert_val;
> > +     u16 ctrl_status_bits;
> > +     u16 ctrl_release_val;
> > +
> > +     u16 ctrl2_reg;
> > +     u16 ctrl2_acquire_val;
> > +     u16 ctrl2_release_val;
> > +};
> > +
> > +struct rzv2h_usb2phy_ctrl_priv {
> > +     const struct rzv2h_usb2phy_data *data;
> > +     void __iomem *base;
> > +     struct device *dev;
> > +     struct reset_controller_dev rcdev;
> > +     spinlock_t lock;
>
> Lock without comment.
>
I will add a comment for it.

> > +};
> > +
> > +#define rcdev_to_priv(x) container_of(x, struct rzv2h_usb2phy_ctrl_pri=
v, rcdev)
>
> I'd prefer this to be an inline function.
>
OK, I'll add a rzv2h_usbphy_rcdev_to_priv() inline function.

> > +
> > +static int rzv2h_usbphy_ctrl_assert(struct reset_controller_dev *rcdev=
,
> > +                                 unsigned long id)
> > +{
> > +     struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> > +     const struct rzv2h_usb2phy_data *data =3D priv->data;
> > +     struct device *dev =3D priv->dev;
> > +     int ret;
> > +
> > +     ret =3D pm_runtime_resume_and_get(dev);
> > +     if (ret) {
> > +             dev_err(dev, "pm_runtime_resume_and_get failed\n");
> > +             return ret;
> > +     }
> > +     scoped_guard(spinlock, &priv->lock) {
> > +             writel(data->ctrl2_acquire_val, priv->base + data->ctrl2_=
reg);
>
> Comparing to deassert, I wonder why is there no ctrl_acquire_val?
>
Based on the HW manual there isn't one.

> > +             writel(data->ctrl_assert_val, priv->base + data->ctrl_reg=
);
> > +     }
> > +
> > +     /* The reset line needs to be asserted for more than 10 microseco=
nds. */
> > +     udelay(11);
>
> Could this be usleep_range() instead?
>
Mostly the consumers wouldn't call the assert operation in an atomic
context, so usleep_range() could be used here.

Cheers,
Prabhakar


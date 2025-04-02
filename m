Return-Path: <linux-renesas-soc+bounces-15330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B42AA79885
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 01:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70B973A9534
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 23:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B021F5425;
	Wed,  2 Apr 2025 23:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7G4Iepl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3781F4187;
	Wed,  2 Apr 2025 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635377; cv=none; b=HxWPN+Lv9lZb0JwcEU4jEIwnAWFyF8A1Jya/WalmtG5bWwczCMj25DkmKA3nihxDGc8P0210/owAAZddtiHUuhZ4Z4pNfV1WGJbQJz2/s6SuzicDedODNHodTWqQZBzKR45u80yqIFxpE9tHsQYFBmmUyA5gERPwZFrrSg5Ehzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635377; c=relaxed/simple;
	bh=GdIGQS4JWH92td0gYbTr53cv3mx+ouGH9iqY3jwxAsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLqDxjBlqXS/Bg9xwhi89b3gySxRYdLZesgusa90wgkafdL2g+QktbAvNvw06LW6lNS6/ia8Ompz6NFc90rXIOIzeRKNaGZDJsySVKE6tTCmjTGCsvp0BljIbqTIuhfwtKirUtLJx7xLWW76UKuYIC56cO7NmD7V3T5JqnDz7zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7G4Iepl; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-525b44ec88aso183617e0c.3;
        Wed, 02 Apr 2025 16:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743635374; x=1744240174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSF8VV4MvAs29o9WCJ7b7nEHXuEuWfcY2dq9tAk4qwg=;
        b=B7G4IepllFqH+anGLiXe45lUP2g5rJPmlQYEb8PEdSMHTmT0eU+tchAxr3lhcGW973
         Pk71xACH/5ojW21QGKW/zgxWdp53UugU6IP5476Nc67tZ/BPjt5fEUILECCG5mJ7Ykcb
         SwyRQq5XRyX19mZAm/1lDstRcoXEIQivjm82TMbVK82GWBmlZxFJbbACGM+XvQEEgHvj
         P7Op+Lf+jmg8BNHMEvheULAzNnC07tl3ChML9Q3GZFUJ7MH9Fc37FB2Q44s1zuK+fVzR
         SSIJlBZUq5NMQ16Me3BMLcs0MQOUouLVs/czEizTrJODzVJJ5jNhXpbHc2QMGog00g47
         M2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743635374; x=1744240174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSF8VV4MvAs29o9WCJ7b7nEHXuEuWfcY2dq9tAk4qwg=;
        b=QrpjDAkwdnxH81oy+/k3g2lZBvpBs63VNKkMr60oZaL+XBl5F2at9rZ9S2OvZ18RFL
         JUx9Wd+2O2mt+N7IE75TS/jNLO+YTvDQFKKn9He6xTryu9POeHNZR/vIHmpGcyJLewx3
         d+Fy8iO3C7pfBQoGMA7munPj5gK+LdD5N2GysWp8L118nxY+RF44r8KZcO1M2JOPt6Sd
         LSlGSl2pZMb6N7MCcxY+jEBeAVqEqChQT0fEP1U2ed1HikLn4BAKSIJtVK60oXhu42gD
         xmym2qHRWX3jVsB8B5zC97XrV7lTQwB4EGk3Ro9xU0naBJ1+NEW0je5xrPDFCG0T/vUR
         cJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVefk0cOLwoF2J4sf87qG14EGbZIBuEHYcL60BBYoOlbMsqQCmh4uTQnOWUmuVQu+7fxLqwtmIwZrgv7L5iq9Rk8R0=@vger.kernel.org, AJvYcCWch3uPK1hABElAAdOwVhtgI5TDOCJLaGhUWeLlvdKWH7gYv5LtZQ2KQo3EXUADs0YLAO+T+XEubUvYHiUo@vger.kernel.org, AJvYcCWlWlHfTX21PnYU2vWdLoPYEy4yxLO0PrUfBpSd7FqrT8DqFqlyLcdf++eql5mncYIW4rLrxB/1Zj/Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvb5btxYdHeCxHey67sAQu0uZhwYuuSro15NOMu9QzRXH0LJMj
	HSW6/eapSYpIWrhQ6rm59EgMrHjTIJAQVDB7cw+cDBQO7Ep1CZ06zWqiOqETwMMACdI44MV+qjt
	0Fmu8p0v1SCAMx+zl/LgMRMXenbQ=
X-Gm-Gg: ASbGnctdbiuYpV7RcNhIif9u3p3+FwVbOwa6ArUmomM8wXmHTojBj4GZmlU1kFM+aob
	+O/MILMjKoRFZo3NaC3XiJ+EsGtBP4/SJZsTuWDWgC94/GbwXYbhlKLv8ufWkkCABwKq2XXKKRv
	HFbqSCEvFdHKLAzOuPAjsYVgfQzvGARTCAtWopKAF+Aw9yzxdCHt/t0HGnJms=
X-Google-Smtp-Source: AGHT+IEDPD65/6nOqaW7JIFFkRiv245SS8Ti1US2KiFtD6WSliXhl469bxj57GU/ZqbUPZ+2u977aiebtOf+6zoyqyc=
X-Received: by 2002:a05:6122:a07:b0:518:a261:adca with SMTP id
 71dfb90a1353d-5261d4759bcmr12276954e0c.8.1743635373876; Wed, 02 Apr 2025
 16:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250402-adamant-myrtle-raptor-40e19f@krzk-bin>
In-Reply-To: <20250402-adamant-myrtle-raptor-40e19f@krzk-bin>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 3 Apr 2025 00:09:07 +0100
X-Gm-Features: AQ5f1JqzXV9YacnNKGchHBfmyOV1CfEocABmajS7J8kE99xY7nSks_VNDWRyPAk
Message-ID: <CA+V-a8vBgnw8nqpG+bOZfABgEUYc+JRxm9qDyexgd+7RSMw_GA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add USB2PHY Port Reset Control driver for Renesas
 RZ/V2H(P) SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Apr 2, 2025 at 7:57=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Tue, Apr 01, 2025 at 06:14:29PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > This patch series adds support for the USB2PHY Port Reset control drive=
r
> > for the Renesas RZ/V2H(P) SoC. The changes include documenting the USB2=
PHY
> > Port Reset control bindings and adding the driver.
> >
> > v2->v3
> > - Dropped Acks from Conor and Fabrizio, due to below changes
> > - Renamed binding renesas,rzv2h-usb2phy-ctrl.yaml to
> >   renesas,rzv2h-usb2phy-reset.yaml
>
> That's not really justifying dropping review.
>
I was in two minds here.

> Still not possible to compare it:
>
> b4 diff '20250401171432.101504-1-prabhakar.mahadev-lad.rj@bp.renesas.com'
> Grabbing thread from lore.kernel.org/all/20250401171432.101504-1-prabhaka=
r.mahadev-lad.rj@bp.renesas.com/t.mbox.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> Nothing matching that query.
I did get the same, does `b4` look for matching subjects, I ask
because I changed between v2 and v3.

Below are the changes from v2 -> v3:
$ b4 diff  -m PATCH-v2-0-2-Add-USB2PHY-control-support-for-Renesas-RZ-V2H-P=
-SoC.mbox
 PATCH-v3-0-3-Add-USB2PHY-Port-Reset-Control-driver-for-Renesas-RZ-V2H-P-So=
C.mbox
Loading 20 messages from
PATCH-v2-0-2-Add-USB2PHY-control-support-for-Renesas-RZ-V2H-P-SoC.mbox
Loading 7 messages from
PATCH-v3-0-3-Add-USB2PHY-Port-Reset-Control-driver-for-Renesas-RZ-V2H-P-SoC=
.mbox
---
Diffing v2 and v3
    Running: git range-diff b88e506a8af0..a85d31383c56
84cdef6f74a8..e90a30abcf89
---
1:  093fce8efcbc ! 1:  73c076c4ea0b dt-bindings: reset: Document
RZ/V2H(P) USB2PHY Control
    @@ Metadata
     Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

      ## Commit message ##
    -    dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control
    +    dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset driver

    -    Add device tree binding document for the Renesas RZ/V2H(P)
USB2PHY Control
    -    Device. It mainly controls reset and power down of the USB2.0 PHY =
(for
    -    both host and function).
    +    Add a device tree binding document for the Renesas RZ/V2H(P)
USB2PHY reset
    +    driver. This driver controls the reset and power-down of the
USB2.0 PHY,
    +    which is used for both host and function modes.

         Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.=
com>

    - ## Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl=
.yaml
(new) ##
    + ## Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-rese=
t.yaml
(new) ##
     @@
     +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
     +%YAML 1.2
     +---
    -+$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-ctrl.y=
aml#
    ++$id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.=
yaml#
     +$schema: http://devicetree.org/meta-schemas/core.yaml#
     +
    -+title: Renesas RZ/V2H(P) USB2PHY Control
    ++title: Renesas RZ/V2H(P) USB2PHY Port reset Control
     +
     +maintainers:
     +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
     +
     +description:
    -+  The RZ/V2H(P) USB2PHY Control mainly controls reset and power
down of the
    ++  The RZ/V2H(P) USB2PHY Control mainly controls Port reset and
power down of the
     +  USB2.0 PHY.
     +
     +properties:
     +  compatible:
    -+    const: renesas,r9a09g057-usb2phy-ctrl  # RZ/V2H(P)
    ++    const: renesas,r9a09g057-usb2phy-reset     # RZ/V2H(P)
     +
     +  reg:
     +    maxItems: 1
    @@ Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-ctrl.y=
aml
(new)
     +  - |
     +    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
     +
    -+    usbphy-ctrl@15830000 {
    -+        compatible =3D "renesas,r9a09g057-usb2phy-ctrl";
    ++    reset-controller@15830000 {
    ++        compatible =3D "renesas,r9a09g057-usb2phy-reset";
     +        reg =3D <0x15830000 0x10000>;
     +        clocks =3D <&cpg CPG_MOD 0xb6>;
     +        resets =3D <&cpg 0xaf>;
2:  a85d31383c56 ! 2:  8c715db41c21 reset: Add USB2PHY control driver
for Renesas RZ/V2H(P)
    @@ Metadata
     Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

      ## Commit message ##
    -    reset: Add USB2PHY control driver for Renesas RZ/V2H(P)
    +    reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)

    -    Add support for the USB2PHY control driver on the Renesas
RZ/V2H(P) SoC.
    -    Make the driver handle reset and power-down operations for the USB=
2PHY.
    +    Implement a USB2PHY port reset driver for the Renesas RZ/V2H(P) So=
C.
    +    Enable control of USB2.0 PHY reset and power-down operations, incl=
uding
    +    assert and deassert functionalities for the PHY.

    -    Pass OF data to support future SoCs with similar USB2PHY hardware =
but
    -    different register configurations. Define device-specific
initialization
    -    values and control register settings in OF data to ensure flexibil=
ity
    -    for upcoming SoCs.
    +    Leverage device tree (OF) data to support future SoCs with
similar USB2PHY
    +    hardware but varying register configurations. Define
initialization values
    +    and control register settings to ensure flexibility for
upcoming platforms.

         Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.=
com>

    @@ drivers/reset/Kconfig: config RESET_RZG2L_USBPHY_CTRL
            Support for USBPHY Control found on RZ/G2L family. It mainly
            controls reset and power down of the USB/PHY.

    -+config RESET_RZV2H_USB2PHY_CTRL
    -+    tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY control dr=
iver"
    ++config RESET_RZV2H_USB2PHY
    ++    tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driv=
er"
     +    depends on ARCH_RENESAS || COMPILE_TEST
     +    help
    -+      Support for USB2PHY Control found on the RZ/V2H(P) SoC
(and similar SoCs).
    -+      It mainly controls reset and power down of the USB2 PHY.
    ++      Support for USB2PHY Port reset Control found on the RZ/V2H(P) S=
oC
    ++      (and similar SoCs).
     +
      config RESET_SCMI
          tristate "Reset driver controlled via ARM SCMI interface"
    @@ drivers/reset/Makefile: obj-$(CONFIG_RESET_QCOM_AOSS) +=3D
reset-qcom-aoss.o
      obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
      obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
      obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
    -+obj-$(CONFIG_RESET_RZV2H_USB2PHY_CTRL) +=3D reset-rzv2h-usb2phy-ctrl.=
o
    ++obj-$(CONFIG_RESET_RZV2H_USB2PHY) +=3D reset-rzv2h-usb2phy.o
      obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
      obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
      obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o

    - ## drivers/reset/reset-rzv2h-usb2phy-ctrl.c (new) ##
    + ## drivers/reset/reset-rzv2h-usb2phy.c (new) ##
     @@
     +// SPDX-License-Identifier: GPL-2.0
     +/*
    -+ * Renesas RZ/V2H(P) USB2PHY control driver
    ++ * Renesas RZ/V2H(P) USB2PHY Port reset control driver
     + *
     + * Copyright (C) 2025 Renesas Electronics Corporation
     + */
    @@ drivers/reset/reset-rzv2h-usb2phy-ctrl.c (new)
     +    u16 val;
     +};
     +
    -+struct rzv2h_usb2phy_data {
    ++struct rzv2h_usb2phy_reset_of_data {
     +    const struct rzv2h_usb2phy_regval *init_vals;
     +    unsigned int init_val_count;
     +
    -+    u16 ctrl_reg;
    -+    u16 ctrl_assert_val;
    -+    u16 ctrl_deassert_val;
    -+    u16 ctrl_status_bits;
    -+    u16 ctrl_release_val;
    ++    u16 reset_reg;
    ++    u16 reset_assert_val;
    ++    u16 reset_deassert_val;
    ++    u16 reset_status_bits;
    ++    u16 reset_release_val;
     +
    -+    u16 ctrl2_reg;
    -+    u16 ctrl2_acquire_val;
    -+    u16 ctrl2_release_val;
    ++    u16 reset2_reg;
    ++    u16 reset2_acquire_val;
    ++    u16 reset2_release_val;
     +};
     +
    -+struct rzv2h_usb2phy_ctrl_priv {
    -+    const struct rzv2h_usb2phy_data *data;
    ++struct rzv2h_usb2phy_reset_priv {
    ++    const struct rzv2h_usb2phy_reset_of_data *data;
     +    void __iomem *base;
     +    struct device *dev;
     +    struct reset_controller_dev rcdev;
    -+    spinlock_t lock;
    ++    spinlock_t lock; /* protects register accesses */
     +};
     +
    -+#define rcdev_to_priv(x) container_of(x, struct
rzv2h_usb2phy_ctrl_priv, rcdev)
    ++static inline struct rzv2h_usb2phy_reset_priv
    ++*rzv2h_usbphy_rcdev_to_priv(struct reset_controller_dev *rcdev)
    ++{
    ++    return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev=
);
    ++}
     +
    -+static int rzv2h_usbphy_ctrl_assert(struct reset_controller_dev *rcde=
v,
    -+                    unsigned long id)
    ++/* This function must be called only after
pm_runtime_resume_and_get() has been called */
    ++static void rzv2h_usbphy_assert_helper(struct
rzv2h_usb2phy_reset_priv *priv)
     +{
    -+    struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
    -+    const struct rzv2h_usb2phy_data *data =3D priv->data;
    ++    const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
    ++
    ++    scoped_guard(spinlock, &priv->lock) {
    ++        writel(data->reset2_acquire_val, priv->base + data->reset2_re=
g);
    ++        writel(data->reset_assert_val, priv->base + data->reset_reg);
    ++    }
    ++
    ++    usleep_range(11, 20);
    ++}
    ++
    ++static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcd=
ev,
    ++                     unsigned long id)
    ++{
    ++    struct rzv2h_usb2phy_reset_priv *priv =3D
rzv2h_usbphy_rcdev_to_priv(rcdev);
     +    struct device *dev =3D priv->dev;
     +    int ret;
     +
    @@ drivers/reset/reset-rzv2h-usb2phy-ctrl.c (new)
     +        dev_err(dev, "pm_runtime_resume_and_get failed\n");
     +        return ret;
     +    }
    -+    scoped_guard(spinlock, &priv->lock) {
    -+        writel(data->ctrl2_acquire_val, priv->base + data->ctrl2_reg)=
;
    -+        writel(data->ctrl_assert_val, priv->base + data->ctrl_reg);
    -+    }
     +
    -+    /* The reset line needs to be asserted for more than 10
microseconds. */
    -+    udelay(11);
    ++    rzv2h_usbphy_assert_helper(priv);
    ++
     +    pm_runtime_put(dev);
     +
     +    return 0;
     +}
     +
    -+static int rzv2h_usbphy_ctrl_deassert(struct reset_controller_dev *rc=
dev,
    -+                      unsigned long id)
    ++static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *r=
cdev,
    ++                       unsigned long id)
     +{
    -+    struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
    -+    const struct rzv2h_usb2phy_data *data =3D priv->data;
    ++    struct rzv2h_usb2phy_reset_priv *priv =3D
rzv2h_usbphy_rcdev_to_priv(rcdev);
    ++    const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
     +    struct device *dev =3D priv->dev;
     +    int ret;
     +
    @@ drivers/reset/reset-rzv2h-usb2phy-ctrl.c (new)
     +    }
     +
     +    scoped_guard(spinlock, &priv->lock) {
    -+        writel(data->ctrl_deassert_val, priv->base + data->ctrl_reg);
    -+        writel(data->ctrl2_release_val, priv->base + data->ctrl2_reg)=
;
    -+        writel(data->ctrl_release_val, priv->base + data->ctrl_reg);
    ++        writel(data->reset_deassert_val, priv->base + data->reset_reg=
);
    ++        writel(data->reset2_release_val, priv->base + data->reset2_re=
g);
    ++        writel(data->reset_release_val, priv->base + data->reset_reg)=
;
     +    }
     +
     +    pm_runtime_put(dev);
    @@ drivers/reset/reset-rzv2h-usb2phy-ctrl.c (new)
     +    return 0;
     +}
     +
    -+static int rzv2h_usbphy_ctrl_status(struct reset_controller_dev *rcde=
v,
    -+                    unsigned long id)
    ++static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcd=
ev,
    ++                     unsigned long id)
     +{
    -+    struct rzv2h_usb2phy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
    ++    struct rzv2h_usb2phy_reset_priv *priv =3D
rzv2h_usbphy_rcdev_to_priv(rcdev);
     +    struct device *dev =3D priv->dev;
     +    int ret;
     +    u32 reg;
    @@ drivers/reset/reset-rzv2h-usb2phy-ctrl.c (new)
     +        return ret;
     +    }
     +
    -+    scoped_guard(spinlock, &priv->lock)
    -+        reg =3D readl(priv->base + priv->data->ctrl_reg);
    ++    reg =3D readl(priv->base + priv->data->reset_reg);
     +
     +    pm_runtime_put(dev);
     +
    -+    return (reg & priv->data->ctrl_status_bits) =3D=3D
priv->data->ctrl_status_bits;
    ++    return (reg & priv->data->reset_status_bits) =3D=3D
priv->data->reset_status_bits;
     +}
     +
    -+static const struct reset_control_ops rzv2h_usbphy_ctrl_reset_ops =3D=
 {
    -+    .assert =3D rzv2h_usbphy_ctrl_assert,
    -+    .deassert =3D rzv2h_usbphy_ctrl_deassert,
    -+    .status =3D rzv2h_usbphy_ctrl_status,
    ++static const struct reset_control_ops rzv2h_usbphy_reset_ops =3D {
    ++    .assert =3D rzv2h_usbphy_reset_assert,
    ++    .deassert =3D rzv2h_usbphy_reset_deassert,
    ++    .status =3D rzv2h_usbphy_reset_status,
     +};
     +
    -+static int rzv2h_reset_of_xlate(struct reset_controller_dev *rcdev,
    -+                const struct of_phandle_args *reset_spec)
    ++static int rzv2h_usb2phy_reset_of_xlate(struct
reset_controller_dev *rcdev,
    ++                    const struct of_phandle_args *reset_spec)
     +{
     +    /* No special handling needed, we have only one reset line
per device */
     +    return 0;
     +}
     +
    -+static int rzv2h_usb2phy_ctrl_probe(struct platform_device *pdev)
    ++static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
     +{
    -+    const struct rzv2h_usb2phy_data *data;
    -+    struct rzv2h_usb2phy_ctrl_priv *priv;
    ++    const struct rzv2h_usb2phy_reset_of_data *data;
    ++    struct rzv2h_usb2phy_reset_priv *priv;
     +    struct device *dev =3D &pdev->dev;
     +    struct reset_control *rstc;
     +    int error;
    @@ drivers/reset/reset-rzv2h-usb2phy-ctrl.c (new)
     +    for (unsigned int i =3D 0; i < data->init_val_count; i++)
     +        writel(data->init_vals[i].val, priv->base +
data->init_vals[i].reg);
     +
    ++    /* keep usb2phy in asserted state */
    ++    rzv2h_usbphy_assert_helper(priv);
    ++
     +    pm_runtime_put(dev);
     +
    -+    priv->rcdev.ops =3D &rzv2h_usbphy_ctrl_reset_ops;
    ++    priv->rcdev.ops =3D &rzv2h_usbphy_reset_ops;
     +    priv->rcdev.of_reset_n_cells =3D 0;
     +    priv->rcdev.nr_resets =3D 1;
    -+    priv->rcdev.of_xlate =3D rzv2h_reset_of_xlate;
    ++    priv->rcdev.of_xlate =3D rzv2h_usb2phy_reset_of_xlate;
     +    priv->rcdev.of_node =3D dev->of_node;
     +    priv->rcdev.dev =3D dev;
     +
     +    return devm_reset_controller_register(dev, &priv->rcdev);
     +}
     +
    ++/*
    ++ * initialization values required to prepare the PHY to receive
    ++ * assert and deassert requests.
    ++ */
     +static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] =3D {
     +    { .reg =3D 0xc10, .val =3D 0x67c },
     +    { .reg =3D 0xc14, .val =3D 0x1f },
     +    { .reg =3D 0x600, .val =3D 0x909 },
     +};
     +
    -+static const struct rzv2h_usb2phy_data rzv2h_of_data =3D {
    ++static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data =
=3D {
     +    .init_vals =3D rzv2h_init_vals,
     +    .init_val_count =3D ARRAY_SIZE(rzv2h_init_vals),
    -+    .ctrl_reg =3D 0,
    -+    .ctrl_assert_val =3D 0x206,
    -+    .ctrl_status_bits =3D BIT(2),
    -+    .ctrl_deassert_val =3D 0x200,
    -+    .ctrl_release_val =3D 0x0,
    -+    .ctrl2_reg =3D 0xb04,
    -+    .ctrl2_acquire_val =3D 0x303,
    -+    .ctrl2_release_val =3D 0x3,
    ++    .reset_reg =3D 0,
    ++    .reset_assert_val =3D 0x206,
    ++    .reset_status_bits =3D BIT(2),
    ++    .reset_deassert_val =3D 0x200,
    ++    .reset_release_val =3D 0x0,
    ++    .reset2_reg =3D 0xb04,
    ++    .reset2_acquire_val =3D 0x303,
    ++    .reset2_release_val =3D 0x3,
     +};
     +
    -+static const struct of_device_id rzv2h_usb2phy_ctrl_match_table[] =3D=
 {
    -+    { .compatible =3D "renesas,r9a09g057-usb2phy-ctrl", .data =3D
&rzv2h_of_data },
    ++static const struct of_device_id rzv2h_usb2phy_reset_of_match[] =3D {
    ++    { .compatible =3D "renesas,r9a09g057-usb2phy-reset", .data =3D
&rzv2h_reset_of_data },
     +    { /* Sentinel */ }
     +};
    -+MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_ctrl_match_table);
    ++MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_reset_of_match);
     +
    -+static struct platform_driver rzv2h_usb2phy_ctrl_driver =3D {
    ++static struct platform_driver rzv2h_usb2phy_reset_driver =3D {
     +    .driver =3D {
    -+        .name        =3D "rzv2h_usb2phy_ctrl",
    -+        .of_match_table    =3D rzv2h_usb2phy_ctrl_match_table,
    ++        .name        =3D "rzv2h_usb2phy_reset",
    ++        .of_match_table    =3D rzv2h_usb2phy_reset_of_match,
     +    },
    -+    .probe =3D rzv2h_usb2phy_ctrl_probe,
    ++    .probe =3D rzv2h_usb2phy_reset_probe,
     +};
    -+module_platform_driver(rzv2h_usb2phy_ctrl_driver);
    ++module_platform_driver(rzv2h_usb2phy_reset_driver);
     +
     +MODULE_LICENSE("GPL");
     +MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>");
-:  ------------ > 3:  e90a30abcf89 MAINTAINERS: Add entry for Renesas
RZ/V2H(P) USB2PHY Port Reset driver



Cheers,
Prabhakar


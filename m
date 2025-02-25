Return-Path: <linux-renesas-soc+bounces-13683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511DA44E88
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 22:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0693A742D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 21:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFED1A3142;
	Tue, 25 Feb 2025 21:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQ9RjXRc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AF19ABAB;
	Tue, 25 Feb 2025 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517992; cv=none; b=sb7WpQMJIK1FQ4X4PKdjvtsak/Src77fLJ2Pj7MiYkuPK92Wx00kwq2p5IBYiZN5jmVxaKmrK3flhcv2hHW4q4PfaTO14tHxfZTX9d1JUnPA81nTb4W2lJgn7waGHOyLhKroxl1DqZpH0vAb0AqiF8Fw2i8FLo1f7bg/6UDHYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517992; c=relaxed/simple;
	bh=rLc/G/sz9aXLCvk2on4SeH6rpdMLKj54Es0o8rPtxrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMRfi2xdRcc6OrVJ/dNG6yP8RRpPn6Ik6+quXR5slJjxr4P77sIXItvmrU2b88wvyzONtcXv27Y+8ZQVWDyQqrNcKemfaRAIBxYME+zKDCi5IuOOGoBpXqlnmlE+6UTJPeQrkI5zoM5dLDqPPKnJ+q6XlBlWTcVb/bcaXCO8t1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQ9RjXRc; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-521b188df16so1442741e0c.2;
        Tue, 25 Feb 2025 13:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740517989; x=1741122789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwozycCBgD0xeQX23dUDR5pYuM/LrBgppJJZms1RsjA=;
        b=jQ9RjXRcfJ8RoqSRFA8OTd4eh5j19SFIbTEWIlC150pyZMXiSUb9ZEfgJiZHRYbFFk
         NSmXnx2S66uBz71cDmMkxBzRck8MJkrBtPvAnqIcYWqqibDw9N/3fHlKq1F79FMMC2nG
         GrbeU3D6r6mPlUiXbP+ygB4J0Dv0O80r88PbV4RwEkHNVjEdV2uxnTL7alsRwO4ZBaoO
         KSiT7KEp0D3lLrCh/obJqVUqQtjbeXmpxd82sJcs84O3uQRAWd77aDgvqaKzLOLopBOO
         mu7r0rradHDox/l+d8gIKVXtVWRvn7LfIcfvrk1O7AJL0qEZuPF6sr1htemzZvWNDZN4
         uKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517989; x=1741122789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwozycCBgD0xeQX23dUDR5pYuM/LrBgppJJZms1RsjA=;
        b=qSHvOrurrFIehHySzcFaFlId8ytlIv/m7oEDODR4jESXsDN3wX5asvoV68HIw4KkhH
         QLCihDWalsdGEj0DcKByO/JsBfsoJ3ltnX1mu1K2n1jX0KYJuwry+u+FI3nZW1Hb1Bm4
         pSCNX6hbbFZdRlByOnA4/tU8n1QvP0MNOsh+uOLpgqQL2AEytdaQKmPgpuezKNLetQRb
         doQeGCKvhXiwWBSWN3FosU8n2wb2NHtifIeI441gu2Op1+MhwNQsy8dV6oAFFzaYF5ob
         BGJX5hgRswtYZqpJAW7aGqdn0DEgdtze6IB26FPv21xKdjzMkkKzF7xpqweWsmfAL2MZ
         L2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWp4cdVLjCagvWqeighNPiMkNFXRhS/1nY7gBezgEgG27e3oicAILSAlUK2evIvAdgVps8tfL0d@vger.kernel.org, AJvYcCWuUX3ALcZ5j8ohqcX0sYRcoTsaL8GwYcyIdsRTm5IwJOVzx/VWZ+aV8iwbk2l/413L0FTOHAejtIQLTgw=@vger.kernel.org, AJvYcCXynzbpDjOdtjOt3H2lYC5Ptel8tAz7AlLg4DCcrjZWQlcnjLGV/ILh+BYcXm2UxM5xf6pkcrH0WC3j7N+9FiwsIb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWUfkf+bRTTJCvI7VFxK3HaQ1au1C1ZrkrYPdwdKyE29ZTtU0r
	6pGvqMk7L2zvbDL3DPe/lzWdEajGs6cHm+eefsrqCEr/OgHjCgtOAHz7lJTvLxTHhpNqbw9Ut4u
	W3ooF4eLw7nijWCVBGNF604xcoBE=
X-Gm-Gg: ASbGncvL829f0VUYpqNA2NlC2o8FawezWe88MwFEbMeY9/0xK7uIfa4DyuuuK2bk80b
	K3JPM1scjl66mMTp0lJHLHHvBuvBhv0vPhpsf3a3rsKzFg8HhOYB9pVjCDEeMKhaINtPnqjSkJy
	zWX9wfyig=
X-Google-Smtp-Source: AGHT+IF1UTWw3BHmvsQ4zJMkCZ0yH7kjtHPIftmSt3e8+WU4NvAt4azBwuSQOwBo9rgAwr15EosciM2rOQsqkptI1R0=
X-Received: by 2002:a05:6122:4882:b0:51f:3ffb:79ab with SMTP id
 71dfb90a1353d-5223cd2dbcemr3099060e0c.8.1740517988608; Tue, 25 Feb 2025
 13:13:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com> <20250225105907.845347-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250225105907.845347-4-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Feb 2025 21:12:42 +0000
X-Gm-Features: AQ5f1JrS8IzFDHFpHMTwsTP4Rrm-IUqyZpbUwVkNV-zsRUHTOua1ibpqXiJGs94
Message-ID: <CA+V-a8v4ZyKE+FmscDTppzqoj+qurBP=NVQqyjLZxf_RDJh96Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] phy: renesas: rcar-gen3-usb2: Lock around hardware
 registers and driver data
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org, kishon@kernel.org, 
	horms+renesas@verge.net.au, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:01=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The phy-rcar-gen3-usb2 driver exposes four individual PHYs that are
> requested and configured by PHY users. The struct phy_ops APIs access the
> same set of registers to configure all PHYs. Additionally, PHY settings c=
an
> be modified through sysfs or an IRQ handler. While some struct phy_ops AP=
Is
> are protected by a driver-wide mutex, others rely on individual
> PHY-specific mutexes.
>
> This approach can lead to various issues, including:
> 1/ the IRQ handler may interrupt PHY settings in progress, racing with
>    hardware configuration protected by a mutex lock
> 2/ due to msleep(20) in rcar_gen3_init_otg(), while a configuration threa=
d
>    suspends to wait for the delay, another thread may try to configure
>    another PHY (with phy_init() + phy_power_on()); re-running the
>    phy_init() goes to the exact same configuration code, re-running the
>    same hardware configuration on the same set of registers (and bits)
>    which might impact the result of the msleep for the 1st configuring
>    thread
> 3/ sysfs can configure the hardware (though role_store()) and it can
>    still race with the phy_init()/phy_power_on() APIs calling into the
>    drivers struct phy_ops
>
> To address these issues, add a spinlock to protect hardware register acce=
ss
> and driver private data structures (e.g., calls to
> rcar_gen3_is_any_rphy_initialized()). Checking driver-specific data remai=
ns
> necessary as all PHY instances share common settings. With this change,
> the existing mutex protection is removed and the cleanup.h helpers are
> used.
>
> While at it, to keep the code simpler, do not skip
> regulator_enable()/regulator_disable() APIs in
> rcar_gen3_phy_usb2_power_on()/rcar_gen3_phy_usb2_power_off() as the
> regulators enable/disable operations are reference counted anyway.
>
> Fixes: f3b5a8d9b50d ("phy: rcar-gen3-usb2: Add R-Car Gen3 USB2 PHY driver=
")
> Cc: stable@vger.kernel.org
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - collected tags
>
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 49 +++++++++++++-----------
>  1 file changed, 26 insertions(+), 23 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 826c9c4dd4c0..5c0ceba09b67 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -9,6 +9,7 @@
>   * Copyright (C) 2014 Cogent Embedded, Inc.
>   */
>
> +#include <linux/cleanup.h>
>  #include <linux/extcon-provider.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -118,7 +119,7 @@ struct rcar_gen3_chan {
>         struct regulator *vbus;
>         struct reset_control *rstc;
>         struct work_struct work;
> -       struct mutex lock;      /* protects rphys[...].powered */
> +       spinlock_t lock;        /* protects access to hardware and driver=
 data structure. */
>         enum usb_dr_mode dr_mode;
>         u32 obint_enable_bits;
>         bool extcon_host;
> @@ -348,6 +349,8 @@ static ssize_t role_store(struct device *dev, struct =
device_attribute *attr,
>         bool is_b_device;
>         enum phy_mode cur_mode, new_mode;
>
> +       guard(spinlock_irqsave)(&ch->lock);
> +
>         if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized=
(ch))
>                 return -EIO;
>
> @@ -415,7 +418,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan =
*ch)
>                 val =3D readl(usb2_base + USB2_ADPCTRL);
>                 writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPC=
TRL);
>         }
> -       msleep(20);
> +       mdelay(20);
>
>         writel(0xffffffff, usb2_base + USB2_OBINTSTA);
>         writel(ch->obint_enable_bits, usb2_base + USB2_OBINTEN);
> @@ -436,12 +439,14 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, =
void *_ch)
>         if (pm_runtime_suspended(dev))
>                 goto rpm_put;
>
> -       status =3D readl(usb2_base + USB2_OBINTSTA);
> -       if (status & ch->obint_enable_bits) {
> -               dev_vdbg(dev, "%s: %08x\n", __func__, status);
> -               writel(ch->obint_enable_bits, usb2_base + USB2_OBINTSTA);
> -               rcar_gen3_device_recognition(ch);
> -               ret =3D IRQ_HANDLED;
> +       scoped_guard(spinlock, &ch->lock) {
> +               status =3D readl(usb2_base + USB2_OBINTSTA);
> +               if (status & ch->obint_enable_bits) {
> +                       dev_vdbg(dev, "%s: %08x\n", __func__, status);
> +                       writel(ch->obint_enable_bits, usb2_base + USB2_OB=
INTSTA);
> +                       rcar_gen3_device_recognition(ch);
> +                       ret =3D IRQ_HANDLED;
> +               }
>         }
>
>  rpm_put:
> @@ -456,6 +461,8 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>         void __iomem *usb2_base =3D channel->base;
>         u32 val;
>
> +       guard(spinlock_irqsave)(&channel->lock);
> +
>         /* Initialize USB2 part */
>         val =3D readl(usb2_base + USB2_INT_ENABLE);
>         val |=3D USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
> @@ -479,6 +486,8 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
>         void __iomem *usb2_base =3D channel->base;
>         u32 val;
>
> +       guard(spinlock_irqsave)(&channel->lock);
> +
>         rphy->initialized =3D false;
>
>         val =3D readl(usb2_base + USB2_INT_ENABLE);
> @@ -498,16 +507,17 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *=
p)
>         u32 val;
>         int ret =3D 0;
>
> -       mutex_lock(&channel->lock);
> -       if (!rcar_gen3_are_all_rphys_power_off(channel))
> -               goto out;
> -
>         if (channel->vbus) {
>                 ret =3D regulator_enable(channel->vbus);
>                 if (ret)
> -                       goto out;
> +                       return ret;
>         }
>
> +       guard(spinlock_irqsave)(&channel->lock);
> +
> +       if (!rcar_gen3_are_all_rphys_power_off(channel))
> +               goto out;
> +
>         val =3D readl(usb2_base + USB2_USBCTR);
>         val |=3D USB2_USBCTR_PLL_RST;
>         writel(val, usb2_base + USB2_USBCTR);
> @@ -517,7 +527,6 @@ static int rcar_gen3_phy_usb2_power_on(struct phy *p)
>  out:
>         /* The powered flag should be set for any other phys anyway */
>         rphy->powered =3D true;
> -       mutex_unlock(&channel->lock);
>
>         return 0;
>  }
> @@ -528,18 +537,12 @@ static int rcar_gen3_phy_usb2_power_off(struct phy =
*p)
>         struct rcar_gen3_chan *channel =3D rphy->ch;
>         int ret =3D 0;
>
> -       mutex_lock(&channel->lock);
> -       rphy->powered =3D false;
> -
> -       if (!rcar_gen3_are_all_rphys_power_off(channel))
> -               goto out;
> +       scoped_guard(spinlock_irqsave, &channel->lock)
> +               rphy->powered =3D false;
>
>         if (channel->vbus)
>                 ret =3D regulator_disable(channel->vbus);
>
> -out:
> -       mutex_unlock(&channel->lock);
> -
>         return ret;
>  }
>
> @@ -750,7 +753,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>         if (phy_data->no_adp_ctrl)
>                 channel->obint_enable_bits =3D USB2_OBINT_IDCHG_EN;
>
> -       mutex_init(&channel->lock);
> +       spin_lock_init(&channel->lock);
>         for (i =3D 0; i < NUM_OF_PHYS; i++) {
>                 channel->rphys[i].phy =3D devm_phy_create(dev, NULL,
>                                                         phy_data->phy_usb=
2_ops);
> --
> 2.43.0
>
>


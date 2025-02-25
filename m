Return-Path: <linux-renesas-soc+bounces-13682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C782A44E66
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 22:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEA03188BC37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 21:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F801A2567;
	Tue, 25 Feb 2025 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXUhKbaU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1301A0BCD;
	Tue, 25 Feb 2025 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517800; cv=none; b=jVS9kQdWXaBXffCuED0xmKZxUg5TfcxU81qeg0rQzcCs2p4Xck3vFqJ8vcJEkn2YTC/RxUBE3HvyLMX6CPiHHR/6cES51ObxjKYErirEXsYFRpWMqVRuFDhgp/idvVHyYuCv0jpCPRzF9QcjPx3JKrNtWTkhSdHyn2pOL21w6UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517800; c=relaxed/simple;
	bh=Z+iaNm/CbiyBgxvdgSxp4XJmuOgH6m9D8eLOzDl2Rxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlQSrt6l4cvluxFxwPc20g2Nys50EjPx5d9fRJtFcT5yGk3Kg0RVe35B+eIRf0bHO6iSWJcvRWsQsFdR79UTnePnWlifWxVii220XtaWJkr93PiRMeKNQJj7kCRuoDINFtbJdoTDjw6i4Ib3dOLFVqZDInUkFSCfkVcoN8d1btc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXUhKbaU; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-521b5bd2268so3480832e0c.0;
        Tue, 25 Feb 2025 13:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740517797; x=1741122597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOR5cTk1MfDjtZsccw3VnmvVGIbB3SXF6xEA02QDYvk=;
        b=MXUhKbaUDuaiT5yr/hIzsKu3eZoJ2Kh8UYM2cnkaKdgt9zXY6b1pC1RqdHFO8/WEsZ
         4DbF6ZDBIR7GHtMEbReOVeuHDtYXxBs6IYfy2TqSOE4k9DE1XHiP3+JzCR+wB0k+KJGy
         8AgvUiybZiwM3AoQj22kWoQlI0iBzadlWUif0LMDWeZA2h+zojNKIJXyHR+wpbxOE3FQ
         eVDmvqRrKipYu28hS921OT6LzjQ3tecXKEN2bEK46PLUvpTC8dS9pkLttGakfRnM2unl
         X/uHiEmd/W2HfBRvwA6/oje/qB8M1XE8Un+QL/vELMq+ufIUdyxs5EBcXONeAq5D94kG
         /AWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517797; x=1741122597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOR5cTk1MfDjtZsccw3VnmvVGIbB3SXF6xEA02QDYvk=;
        b=OLL3gdB8ub1vMU/HPRxL/uQfI0sdmDt1uhuOEWo1NB7a2xXMH8lSvCgjSQnXFy17FC
         h/YAEj2RBa1IoNmKe+cjmfN5ZWoQHp6RcL4U3db4tVx0L1TRbG73z9pmt3ecFrueg/+p
         v6+IIS1MDKnN9yBjwNe1MDy6rJUq9a6lutOwYu2MLx4urAUOHHRt1R/8AUXxVcYASmA4
         gDVOcnBClnm7bjEyus4Og8Bat7W4mLPQ+C32aJ7kbORirTjHGhgwykJzMyGjnZ/U/rPK
         Ql2FoEEvmnCjDEEGJaZTA411Sh0hKNZwKXXm1Brwc1+PcJWBX2oOOB75LEEAF/utTEOO
         JV1g==
X-Forwarded-Encrypted: i=1; AJvYcCU1Yh2q7MFOEFLtDNffcjd0SkjbENwO2xb/s32vTOsAwq3jki21HBQlp6pMhKCkP4OJh4ruMnOf9TE8d4u+LRQwTeM=@vger.kernel.org, AJvYcCU2ZExe4mAAOd66qyHP6cOZRti0O7ciuixW3X5RX6Rat4pyTDTmp/cBFLuyqDrJuGN+yrqxy5j7MB0euRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4wRQ5j+k1rTKEbn+7FDX6F3HH3xfKAicBVt8+/yo7ADTmQNT
	mYfKzq82oDo5PRNzclS1Gq/TLuA3jUvQVqVR7tLJcgxgxi5oyFsI+e+v8C7xz89OqPeBRatbf7K
	OeyE3HfoUs/YlRDPD6GItyX/4ni2Y5ejjGUQ=
X-Gm-Gg: ASbGncujTKvQ5wvmzng7inVCuV4H1Ve+11UJrXJTUyKo+qcczFwTY0ZTr+zdfTWe5hv
	i5YLA3o1pEepaY4u1JtH1I6AWqM/HM2ivInxAECEjsGMbeO7dyz1pvBNM/LDY7drQFR9fYe/0mS
	cBnyGRwKg=
X-Google-Smtp-Source: AGHT+IEZ4n9ZShSdryejSp0Dll4XjthRfrSp33D8IwRdnaU7WcKhyo+/LlXeqV9wsIUpxerFszpgB8+a2mgywwq0ii0=
X-Received: by 2002:a05:6122:4009:b0:520:5a87:66f0 with SMTP id
 71dfb90a1353d-5224ca5f48amr671522e0c.0.1740517797488; Tue, 25 Feb 2025
 13:09:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com> <20250225105907.845347-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250225105907.845347-3-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Feb 2025 21:09:30 +0000
X-Gm-Features: AQ5f1JpQJgx8-n0KxaKQyAOyx625Jj9XjopprYm-sqCSUpMvznb-yaEwd2QYPHs
Message-ID: <CA+V-a8sS5m7jtKj6S3BaPN0f43Q4wCZ8vgMEY+A204HuzhqYgg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org, kishon@kernel.org, 
	horms+renesas@verge.net.au, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

Thank you for the patch.

On Tue, Feb 25, 2025 at 11:00=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Commit 08b0ad375ca6 ("phy: renesas: rcar-gen3-usb2: move IRQ registration
> to init") moved the IRQ request operation from probe to
> struct phy_ops::phy_init API to avoid triggering interrupts (which lead t=
o
> register accesses) while the PHY clocks (enabled through runtime PM APIs)
> are not active. If this happens, it results in a synchronous abort.
>
> One way to reproduce this issue is by enabling CONFIG_DEBUG_SHIRQ, which
> calls free_irq() on driver removal.
>
> Move the IRQ request and free operations back to probe, and take the
> runtime PM state into account in IRQ handler. This commit is preparatory
> for the subsequent fixes in this series.
>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - collected tags
>
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 46 +++++++++++++-----------
>  1 file changed, 26 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 46afba2fe0dc..826c9c4dd4c0 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -120,7 +120,6 @@ struct rcar_gen3_chan {
>         struct work_struct work;
>         struct mutex lock;      /* protects rphys[...].powered */
>         enum usb_dr_mode dr_mode;
> -       int irq;
>         u32 obint_enable_bits;
>         bool extcon_host;
>         bool is_otg_channel;
> @@ -428,16 +427,25 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, =
void *_ch)
>  {
>         struct rcar_gen3_chan *ch =3D _ch;
>         void __iomem *usb2_base =3D ch->base;
> -       u32 status =3D readl(usb2_base + USB2_OBINTSTA);
> +       struct device *dev =3D ch->dev;
>         irqreturn_t ret =3D IRQ_NONE;
> +       u32 status;
>
> +       pm_runtime_get_noresume(dev);
> +
> +       if (pm_runtime_suspended(dev))
> +               goto rpm_put;
> +
> +       status =3D readl(usb2_base + USB2_OBINTSTA);
>         if (status & ch->obint_enable_bits) {
> -               dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
> +               dev_vdbg(dev, "%s: %08x\n", __func__, status);
>                 writel(ch->obint_enable_bits, usb2_base + USB2_OBINTSTA);
>                 rcar_gen3_device_recognition(ch);
>                 ret =3D IRQ_HANDLED;
>         }
>
> +rpm_put:
> +       pm_runtime_put_noidle(dev);
>         return ret;
>  }
>
> @@ -447,17 +455,6 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>         struct rcar_gen3_chan *channel =3D rphy->ch;
>         void __iomem *usb2_base =3D channel->base;
>         u32 val;
> -       int ret;
> -
> -       if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >=
=3D 0) {
> -               INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> -               ret =3D request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
> -                                 IRQF_SHARED, dev_name(channel->dev), ch=
annel);
> -               if (ret < 0) {
> -                       dev_err(channel->dev, "No irq handler (%d)\n", ch=
annel->irq);
> -                       return ret;
> -               }
> -       }
>
>         /* Initialize USB2 part */
>         val =3D readl(usb2_base + USB2_INT_ENABLE);
> @@ -490,9 +487,6 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
>                 val &=3D ~USB2_INT_ENABLE_UCOM_INTEN;
>         writel(val, usb2_base + USB2_INT_ENABLE);
>
> -       if (channel->irq >=3D 0 && !rcar_gen3_is_any_rphy_initialized(cha=
nnel))
> -               free_irq(channel->irq, channel);
> -
>         return 0;
>  }
>
> @@ -698,7 +692,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct rcar_gen3_chan *channel;
>         struct phy_provider *provider;
> -       int ret =3D 0, i;
> +       int ret =3D 0, i, irq;
>
>         if (!dev->of_node) {
>                 dev_err(dev, "This driver needs device tree\n");
> @@ -714,8 +708,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>                 return PTR_ERR(channel->base);
>
>         channel->obint_enable_bits =3D USB2_OBINT_BITS;
> -       /* get irq number here and request_irq for OTG in phy_init */
> -       channel->irq =3D platform_get_irq_optional(pdev, 0);
>         channel->dr_mode =3D rcar_gen3_get_dr_mode(dev->of_node);
>         if (channel->dr_mode !=3D USB_DR_MODE_UNKNOWN) {
>                 channel->is_otg_channel =3D true;
> @@ -784,6 +776,20 @@ static int rcar_gen3_phy_usb2_probe(struct platform_=
device *pdev)
>                 channel->vbus =3D NULL;
>         }
>
> +       irq =3D platform_get_irq_optional(pdev, 0);
You may want to propagate the error and fail in case of errors like below:
            if (irq < 0 && irq !=3D -ENXIO) {
                    ret =3D irq;
                    goto error;
            }

Rest lgtm,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> +       if (irq =3D=3D -EPROBE_DEFER) {
> +               ret =3D -EPROBE_DEFER;
> +               goto error;
> +       } else if (irq >=3D 0) {
> +               INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
> +               ret =3D devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq=
,
> +                                      IRQF_SHARED, dev_name(dev), channe=
l);
> +               if (ret < 0) {
> +                       dev_err(dev, "Failed to request irq (%d)\n", irq)=
;
> +                       goto error;
> +               }
> +       }
> +
>         provider =3D devm_of_phy_provider_register(dev, rcar_gen3_phy_usb=
2_xlate);
>         if (IS_ERR(provider)) {
>                 dev_err(dev, "Failed to register PHY provider\n");
> --
> 2.43.0
>
>


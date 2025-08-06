Return-Path: <linux-renesas-soc+bounces-20070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3ECB1CD2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 22:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A98E67B3665
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 20:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05F72BFC60;
	Wed,  6 Aug 2025 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSvotqkl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05C82BEC2E;
	Wed,  6 Aug 2025 20:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510545; cv=none; b=MXbt6db9i8vBiV5DtxuL/5gmcfYoTOMNTa4P5g3NSVfhHHysknASi3wTJLKUnsKuMUfIthnStrvnsLbgQFfsCwFd4PP4kDHy0oIGRXUomziMP8GS1Wh7Yq/k8ob085fAD7KugqgOefbKL6oFPNQpiZzPMw1P8Q/iVLgfgLCwgyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510545; c=relaxed/simple;
	bh=HB68dt0UNBApLmPyk8LNv/ijQRwis8TVukcoX+6c2wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rU6mL8Tp2xU3+aknzw2I5PtzciUPdI5TJ7VTRjEN1sLU3fMBO+daERgFRJ6TQlCPQNNteRLEbu6SalBZNE8Nop1KuMAP0sUH1CfL50lt2Sfey7EQN8OVcHVuJZ0CroWtss68nHmqYtUpcDqzl4SunWo5apOsi1i8uHt5opinugg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSvotqkl; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af949bdf36cso47030666b.0;
        Wed, 06 Aug 2025 13:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510542; x=1755115342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ8i9DtQoEe2eT1EEyiFMN6m8e12hKDElhMToYg7FsI=;
        b=fSvotqkl/mO9L+h6GsJaph9MXnMAcgghKMb69Xm2fIRWPr27FqLbZCTivp0tuC0ESd
         GrATVsRh+elkUecRWlhQPTC/lWPbAu62oJUBnSkqo4vCUseK0vTqgqybnSrfT0iUbfhX
         Kkh/QF+8Dm+hxl3fi9O66SpouixZiNu387IxH6M9SkIkFRrWFPRWcBK+3X8Hr14c2l2e
         ECSoXqel65pWRsrdzydY6m0iCemTUHc/cAh4ud442mhk0luYtjMCurW/ucppWIg0MBoQ
         d+d5NuqTyOQ9ncmcTTP3lG3AkY0ZRcLOuO4PLSPppgrhK6GIwQGQkJ0mqDz//dag4Ivw
         rX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510542; x=1755115342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ8i9DtQoEe2eT1EEyiFMN6m8e12hKDElhMToYg7FsI=;
        b=IAguX3s6Ef3aqQdmc0GxZrHZKOWXix9k4W9Cylpfz/eyajy1O5arGlpQ+ofGFui+mT
         841yRKxSD8OQUj4UbMIt6w35E99IAxorWYH7MSEnecrIwcMvQx7LokbaYRGuClM3+qNZ
         D5BQN8PKOO3X2WPyUiKgbSD/3pXwCHPoMZPqEBT0tPtnuqw/zVBVf6HXBLESk3SQX3si
         UArme87KZ45QlvMUR2almt2GkUinhsZ95F3pgD6F3gRCRedD+Z0wNgsq/8vS8/NgSiJj
         hCkw2CgnAyKZYZDXQCeqmw2/ZEDtcjcR8ElZbHNc8FNZRD2UdvWNCBRSktDx/UywmoTr
         Ooyw==
X-Forwarded-Encrypted: i=1; AJvYcCUjQOB8AVF9ryvYIgTfDS2avWFXMNcbA37qECD5vGvTl+KcOLthmkxCJ3gORkMd5Ic40MIn2yYzK/dRBH5bvJEUCnA=@vger.kernel.org, AJvYcCXD3W+vIx2Lx6b5489pAEKaWr//iXASgHcUgzID57kcDhixX+g2BiintpPoBuQhywpT5ZSjyHQV1WK4@vger.kernel.org, AJvYcCXeR1XG92JUHb7Q2W/hl5eqpwrwUUlpcy3VIlUWnnEdtM4FWeZ5iKSETvsO3/OoBm5WTXJ1Mu2P8noU3NlC@vger.kernel.org
X-Gm-Message-State: AOJu0YwRQjly8CrTyM3L+NnheOC4UZiTi/2fKK1CUtrn7UMTE/+8MgAA
	etHVspeQF4v//OKf8vNJ7KbFyUZQ7GwMbOSqgoR9KyH0X2rvRPNi6JgmFjJoQUbx/kUDPi1jlh9
	o4uyuS7565GxcLxiZloTnR/7iXfyAptE=
X-Gm-Gg: ASbGncsIl+nfXaRYmCyyHROuctr7XHa0t3v/qUf5T9+LUJPbnQ5dUYhIdWIQA7AvMlP
	fBIDFTIhk+PXKCOKGCEXtCBTEzoHf8xtzEd7x4F5550Wsy/pwvKBNjdTWov9n4PPE9TztdUyHOG
	h3ZB7sQv2T1sImPm1CRDuVdnCIF+N6MbOSurpRAQZiFy0ZEPCSzFhddP2TvUuvKs23ePFktwTum
	xx/Qw==
X-Google-Smtp-Source: AGHT+IGEEo72wmTgZi8BkvIr5ed6oxulOt+2Q25m9dKEM0jScTqzxsk+qtztPutvIV62/H+qWII96q4Up6yQ81TmwmQ=
X-Received: by 2002:a17:907:2d0e:b0:ade:3ce3:15d1 with SMTP id
 a640c23a62f3a-af992aae897mr405082666b.27.1754510541748; Wed, 06 Aug 2025
 13:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250805122529.2566580-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <9549b800-2205-428a-8056-cfc6b5255850@linaro.org>
In-Reply-To: <9549b800-2205-428a-8056-cfc6b5255850@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Aug 2025 21:01:53 +0100
X-Gm-Features: Ac12FXz0dtGGFdr2LTb6pyZSRV-MKBIRDj8BNzlj1AE_Itf4PJ_b1CmIqAS1b7Q
Message-ID: <CA+V-a8s9MzrpyCSQ-nYiX+gDGHWhUONfc=F2Aqh_jAyar4Kceg@mail.gmail.com>
Subject: Re: [PATCH 2/5] phy: renesas: rcar-gen3-usb2: Store drvdata pointer
 in channel
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Thank you for the review.

On Wed, Aug 6, 2025 at 3:06=E2=80=AFPM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> On 05/08/2025 14:25, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Store the SoC-specific driver data pointer (struct rcar_gen3_phy_drv_da=
ta)
> > directly in struct rcar_gen3_chan instead of copying individual flags
> > into separate fields. Update all references to use channel->drvdata->fl=
ags,
> > removing the redundant soc_no_adp_ctrl and utmi_ctrl members from the
> > channel structure.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 17 +++++++----------
> >   1 file changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/ren=
esas/phy-rcar-gen3-usb2.c
> > index 47beb94cd424..cfa9667c7680 100644
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@ -122,6 +122,7 @@ struct rcar_gen3_phy {
> >   struct rcar_gen3_chan {
> >       void __iomem *base;
> >       struct device *dev;     /* platform_device's device */
> > +     const struct rcar_gen3_phy_drv_data *drvdata;
>
> Why not phy_data ?
>
Agreed, I will rename it.

> >       struct extcon_dev *extcon;
> >       struct rcar_gen3_phy rphys[NUM_OF_PHYS];
> >       struct regulator *vbus;
> > @@ -133,8 +134,6 @@ struct rcar_gen3_chan {
> >       bool extcon_host;
> >       bool is_otg_channel;
> >       bool uses_otg_pins;
> > -     bool soc_no_adp_ctrl;
> > -     bool utmi_ctrl;
> >   };
> >
> >   struct rcar_gen3_phy_drv_data {
> > @@ -204,7 +203,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_=
gen3_chan *ch, int vbus)
> >       u32 val;
> >
> >       dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
> > -     if (ch->soc_no_adp_ctrl) {
> > +     if (ch->drvdata->no_adp_ctrl) {
> >               if (ch->vbus)
> >                       regulator_hardware_enable(ch->vbus, vbus);
> >
> > @@ -290,7 +289,7 @@ static bool rcar_gen3_check_id(struct rcar_gen3_cha=
n *ch)
> >       if (!ch->uses_otg_pins)
> >               return (ch->dr_mode =3D=3D USB_DR_MODE_HOST) ? false : tr=
ue;
> >
> > -     if (ch->soc_no_adp_ctrl)
> > +     if (ch->drvdata->no_adp_ctrl)
> >               return !!(readl(ch->base + USB2_LINECTRL1) & USB2_LINECTR=
L1_USB2_IDMON);
> >
> >       return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
> > @@ -421,7 +420,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_cha=
n *ch)
> >             USB2_LINECTRL1_DMRPD_EN | USB2_LINECTRL1_DM_RPD;
> >       writel(val, usb2_base + USB2_LINECTRL1);
> >
> > -     if (!ch->soc_no_adp_ctrl) {
> > +     if (!ch->drvdata->no_adp_ctrl) {
> >               val =3D readl(usb2_base + USB2_VBCTRL);
> >               val &=3D ~USB2_VBCTRL_OCCLREN;
> >               writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBC=
TRL);
> > @@ -487,7 +486,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
> >       if (rphy->int_enable_bits)
> >               rcar_gen3_init_otg(channel);
> >
> > -     if (channel->utmi_ctrl) {
> > +     if (channel->drvdata->utmi_ctrl) {
> >               val =3D readl(usb2_base + USB2_REGEN_CG_CTRL) | USB2_REGE=
N_CG_CTRL_UPHY_WEN;
> >               writel(val, usb2_base + USB2_REGEN_CG_CTRL);
> >
> > @@ -778,6 +777,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform=
_device *pdev)
> >               ret =3D -EINVAL;
> >               goto error;
> >       }
> > +     channel->drvdata =3D phy_data;
>
> Replace the whole block with:
>
>         channel->drvdata =3D device_get_match_data(dev);
>         if (!channel->drvdata) {
>                 ret =3D -EINVAL;
>                 goto error;
>         }
>
> and drop the local phy_data.
>
Ok.

Cheers,
Prabhakar


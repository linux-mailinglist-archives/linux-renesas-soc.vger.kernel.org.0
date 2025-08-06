Return-Path: <linux-renesas-soc+bounces-20071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F73EB1CD35
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 22:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B686C18C5DA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 20:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5372BE7AA;
	Wed,  6 Aug 2025 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUZ6ViRm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C2E2BDC24;
	Wed,  6 Aug 2025 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510831; cv=none; b=lyEPdsAchnz2d1eoXp1U8oho6kCcttbXzjgI7aGE1N4TgBNeveG7p3Tw9J+1eL91rtgqxSCVGq0xqpaHje2MdSug1b7D/uB88WxPwctVqVdAFMi1Y52z+8cviadtBIYnkVhx3MP9HYwHAab0efU5x+B2SaSK9ft4SPvA1rAk1Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510831; c=relaxed/simple;
	bh=F6dBVKNVGW0SVfDm6GCOPGv5own4aunOLuUfzSL0X/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMADfumOJ8uKGkoznuIbqAjE8rioCy/wVD+mToxAsqi5wxkDhbGXRlFzigAL+u+hs1VnniOuo3cFgIbabzZEK0OMoGb5XA2NZ4nWyQvS+GgTiO7PLEX6p056C2GyFaRD0VnJRDdg4XtMsU6FuIyuMxerxvtQSmBMd/ePIAcKt2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUZ6ViRm; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-617b36cc489so528444a12.0;
        Wed, 06 Aug 2025 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510828; x=1755115628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y//2z3GOpDTsyDCJpqXABs/fund7CJdbSsFET0LtjE=;
        b=aUZ6ViRmbfCWxoE754dzV3FsdXwwev/5e7PhN8R2oBKKQfe+256nFzMrvCGGoPSGL6
         mEfnr0LPfzRIcrjZXhzax20ud6n1HIR7VBJJEWaY/I/9C8cnHpQ+dHuLMysmEr3FtljL
         bY542bUBnBGgTH644jRtvT+T3OLZ+bxack0o89ac4FGs41Av0zcplsKm9lri4q6dqiEv
         Tf/9Jo6/F9VeTA59R/0hMu6OFX9PucVJIH+ed1S0Q2VQlJmPI23e0rld4Le8ff4fgL6V
         U/xAR6IrQixsiC/50LWaFrOGwsH4+1uUPVEqcpqYAT+/QzLH7kbnUWNgo5YAanPmNDVo
         we9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510828; x=1755115628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1y//2z3GOpDTsyDCJpqXABs/fund7CJdbSsFET0LtjE=;
        b=FBeVUdmCO7hCWCoLB2uuF6GZUHnYyvowYK2XyewTODmJkNRD5af/KurVHpAyng53mf
         WS8tU7nnLq91NeHh0jChZJlxBfCCXoFK3D22dmeKH1TtQcD4ktrQaM+g26wIrcc++cc3
         sEmJOOUGsF1IDo8pKqTIS7Q2vP5mR+uRorMl5OpTR9pViVZ8BsS/VWji/kiTaZcruC8v
         +LRzLoWm4Qh4vO5/z36L+SDm63tV6HH51Vg+vo1hC1dOuXmZJgnViiE6KBF1jn9kw4Rb
         hPKyMtn3ridvv6PexjM+uHG67FCWT8QNbOgNCtS8xu3ZrIoErWBIrZ+E7zrRyF2mr9Lj
         7/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOw52sSq8Xv3t61EpbtWlbK/PPVRQJQww1S3UU+z1rYePhnOvOv9EJQZQ6LWa/H2Cs1XMm7zmU+lGZVvVswmxE3CA=@vger.kernel.org, AJvYcCVPWasuNZdgFY/cFxHUGjmXi2zJwp/bwlF/xhFq42o2VqTnFj1UaODUo2AGBqPMeDcE3UdAMtDf5nyKt1AL@vger.kernel.org, AJvYcCXWApaMwVpvwEq1AyT7kWGh/n9xisTgZlNDnZoDnI216huTGECHcDTn/ZxmE9CUgJElC59wt9AlCYOI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3QGAY8k4vV3RZw3801suuvInuyZuPE+I4CRjkCHIpbRJ7VMuy
	xdCPF37nzaipaU4rACTSCH40V94An+ZkD9pJdJwk6tQ944xCf/sOasSoIZjycUbhkvGOZrqIUiI
	cTENhDBxCKyvhx9sCEstUWoh/yQM4QdQ=
X-Gm-Gg: ASbGnctpBDx8U4AeCeLyFYlvy2WFElWZYYoOYvZMoKaVplnKfo4rfWAu/nG2ZYFoHx/
	5WkkLTovP4i01hRlyxz/ve8zTCx+6AI+o21xfTStCmvM1giQvajiw1u4f5fZEEnnmxNCmE8Pmil
	uXWvYbKQEIENFMbr6JOZfy6HJXQBAlfjDzJUh8BmV08z5nvxFKc0Pe6nQ0P4iQOJcYyeQH1fZwQ
	D5M0g==
X-Google-Smtp-Source: AGHT+IHhhQEGu5BtXcY7VW+xT3nmIjVY4G2aymShY3a3bD46hWVFOr2Hqt0MPzl3Os8CHo+qZbAd4sJv2gxENx2f08Y=
X-Received: by 2002:a05:6402:1ec6:b0:615:c767:5ba1 with SMTP id
 4fb4d7f45d1cf-61796094c0fmr3817267a12.3.1754510828182; Wed, 06 Aug 2025
 13:07:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250805122529.2566580-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVMKzJtomQzzZaHXbhhEJ_3u71Kj7QcMhRgCXcDWY-Kqw@mail.gmail.com>
In-Reply-To: <CAMuHMdVMKzJtomQzzZaHXbhhEJ_3u71Kj7QcMhRgCXcDWY-Kqw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Aug 2025 21:06:42 +0100
X-Gm-Features: Ac12FXyyRAJ6bblVH7gGupbmqizl2-LRtb7rxFThhwX2ialL0d0fLzcb_vMcqyY
Message-ID: <CA+V-a8tQxJ6y-7odV-V9fZt90v4oiRwvqjcTh8-Fs7xfJAm9fg@mail.gmail.com>
Subject: Re: [PATCH 4/5] phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

Thank you for the review.

On Wed, Aug 6, 2025 at 3:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 5 Aug 2025 at 14:25, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add initial support for the Renesas RZ/T2H SoC to the R-Car Gen3 USB2 P=
HY
> > driver. The RZ/T2H SoC requires configuration of additional
> > hardware-specific bits for proper VBUS level control and OTG operation.
> >
> > Introduce the `vblvl_ctrl` flag in the SoC-specific driver data to enab=
le
> > handling of VBUS level selection logic using `VBCTRL.VBLVL` bits. This =
is
> > required for managing the VBUS status detection and drive logic based o=
n
> > SoC-specific needs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
>
> > @@ -284,6 +293,21 @@ static void rcar_gen3_init_from_a_peri_to_a_host(s=
truct rcar_gen3_chan *ch)
> >
> >  static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
> >  {
> > +       if (ch->drvdata->vblvl_ctrl) {
> > +               bool vbus_valid =3D false;
> > +               bool device =3D false;
>
> No need to preinitialize these two variables.
>
Agreed, I will drop it.

> > +
> > +               device =3D !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADP=
CTRL_IDDIG);
> > +               vbus_valid =3D !!(readl(ch->base + USB2_ADPCTRL) & USB2=
_ADPCTRL_VBUSVALID);
> > +
> > +               if (device && vbus_valid)
> > +                       return true;
> > +               else if (!device && vbus_valid)
>
> No need for else after return, but...
>
> > +                       return false;
> > +
> > +               return !(device && !vbus_valid);
>
> ... all logic above can be simplified to
>
>     return vbus_valid ? device : !device;
>
Ahha thanks for the pointer!

Cheers,
Prabhakar


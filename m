Return-Path: <linux-renesas-soc+bounces-19024-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CFEAF136C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 13:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB7233BFE9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 11:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4511B24DD1E;
	Wed,  2 Jul 2025 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AD/suekz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645ED1C6B4;
	Wed,  2 Jul 2025 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454943; cv=none; b=SXSKyiiNOCEvfdYmpFarZ1HSmYWl/QQAL4eYEx93j/+p3KNPPArpYfxFYtAduY3BRYqEH7NeIILV/K/L/8PE6RS/xOh8es2HfrS+v5Ju6K44DIikICrJbxobeGUWez7HVWg46z5BUtB67oitXI0GBo9MUd3TSIpN2R1CVeJ97dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454943; c=relaxed/simple;
	bh=XHBfs/7WOQ9scU2jSPtKSd9vllzVKRNvz7nUZ1NCE98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNh8e/PLHA/E+GvY0m9/Yb8z0rH0mO5ZGxu9SBz8WCpBTRewVVq2BW/X/oC4jjRhOGdFiXTgV9EtZTXI4ameO4SZqdvNPmNjlgX82dyIa71dqC6tAZvLrAuE0dUC54c6bPL4Tm85PM+faCrBeLIWxG30TLAuKuVgqaJMi12fqYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AD/suekz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453647147c6so71385835e9.2;
        Wed, 02 Jul 2025 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751454940; x=1752059740; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkdySRtSGxI+LD2PLhuDfgWtTtkxYO/qJtJNP0L3PfU=;
        b=AD/suekzVL4tPjszhBn/i4HaUDAUHBy4ABwGqToCIgEjwz+jWZaIlepeDQKXc/GxPn
         XDSwj5jZeFbXUH0IIGNAdFnxiia0JZhbLiaRyhzjuyMzppqOT/xzyCkIVE2nW0jjIwoZ
         zc05AWVouEy49sq16sWOUsdJLgNQOTO35gfatbuIuETvsh3yQXkabwdIu6Ei7CuOjI0k
         2frc3BykNDGpwZTJdk8wm332zIJW08kqHwQHubcjIRnESflcEv5+MV3hxi2+ZdD2JC5Z
         xxD9QwEmEx2xzgJ3ZFPSu/N0CUH5DVK+/LU3JNp04B7PhAe3S9+u53WwwVMHyY8usruI
         xmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751454940; x=1752059740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkdySRtSGxI+LD2PLhuDfgWtTtkxYO/qJtJNP0L3PfU=;
        b=L64VaEaMiPxFS81QQf6Q9wB+DrdVbE6wa0Dhj2QIxGMjppbffdGIJOr0dlEDZjsERi
         wyDwzZ4CQ2U6FGC1xm4xVg++cKAgXDwXrYW4HDWbusAPMaRHmnTykBH+S6pPkueokrn6
         JbqO0X3RO3rY/vfzcaYfUciSA2x9qeWFMDhHZ71Cs/FB5tU4TcUCtqloEVMX8AuMqn76
         1Dsk5B06KlLz8lUGGClOsNucIfIYJqL1IMtb2id4jsjgmKxBDYSqUnIrOHvNvUCoG3vF
         WFSPMit9kk5pcMvM7RuwzeqRCyw8jcjvgsRCeOMGrLl5kTJiT/XnHMZXMdGy9hwvwsPb
         fJhg==
X-Forwarded-Encrypted: i=1; AJvYcCUVo5fIkzT31Q39oT8TvB3CGtuFNbsowyxBce5wW3p8az3ZNevl3g09LUkUe1S8ohc31Ad/Ewan7Fwe@vger.kernel.org, AJvYcCUk8A1C5AGUEMehDZoC+k41srCkW52dlz1TIUJD6i0/wNlaZo8H4oyd7+QIb3FD300eWuUX3TbXJdgw@vger.kernel.org, AJvYcCUn/BzpuA+XG1qLe47JSUxuHCJ5z+JdA119O3WUHlm0OQaIKTqscHO8qbvvs4/dTAbA4bJetPkK@vger.kernel.org, AJvYcCV3A7ekWVk8ejGt+xfcb67v4XzFcrIS2isFOw0Xk+BXjihyGVktYkyEhbeHykjKWF+88DENoibI8PRDMZ/qHNn2oqA=@vger.kernel.org, AJvYcCW2fqxjLPzJXzpHE/vbIpx7DuyiFoJJnHNey2e7jhpm8waEVfBLh7teHkcz9/69VtDEZvqTACPUvgWXaI+a@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyFpOK0U95sVFiinnKdIgH1BUdOU3OpcT4Y+S2doH8EpNcrD3
	s0ZLUAm2pxRs+yUH+j+YiQHRojTTgXcFrqdNug3BJdzH0+fyt9P+lvhXrKnhnAPohMaArf/ruUW
	nVLqG99ZqwmAn8eyQ2jn8N//FLoKs5Og=
X-Gm-Gg: ASbGncvLoUT9p23ueeTy/kzMCDBgDLmTM9+9iqeRBlL2eOhUDTGqqJg59fJ5/dfJVqL
	8owON+c+dSetZapr+OqT+TynCj399XvuexHKLxPhsa3e+V3DztnZIoE5XLfWp0EcvwXIvORqbsj
	Op3UX3+Me/V5Gb3S7Kex+ayp2ykd475nvR/Y3/MQ1+wVNM9Gt2x+XzQJvS8JRigrebAQq9nw2kl
	ojT
X-Google-Smtp-Source: AGHT+IGVdU3EbgW14kmi+l6rweiSFF+JR6bWIZlhS1tOmGLwvf9J6IHUAv3porE4RSNMgnM94zU9E2wUmQHddBSVfH8=
X-Received: by 2002:a05:6000:43d8:b0:3a4:f9e7:2796 with SMTP id
 ffacd0b85a97d-3b2001ac40bmr1421973f8f.35.1751454939432; Wed, 02 Jul 2025
 04:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com>
 <20250702005706.1200059-3-john.madieu.xa@bp.renesas.com> <CAMuHMdVsvWrTBXkZ4etWy-8sPH4TG7AEyD_Z27RBWutNvpmUHA@mail.gmail.com>
In-Reply-To: <CAMuHMdVsvWrTBXkZ4etWy-8sPH4TG7AEyD_Z27RBWutNvpmUHA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Jul 2025 12:15:13 +0100
X-Gm-Features: Ac12FXyoV27N90uiKRpolLpIwAqhAe8ZcyesbtrNWpZW4tvLgY188hwbPdZn7n8
Message-ID: <CA+V-a8sbaFDXMj0fiF=Y9X1kwLHY66qgJz=pOEXHA4f6OGS6GQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: renesas: rzg2l: Pass OEN pin names
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, netdev@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.


On Wed, Jul 2, 2025 at 10:54=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi John, Prabhakar,
>
> On Wed, 2 Jul 2025 at 02:57, John Madieu <john.madieu.xa@bp.renesas.com> =
wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Pass the OEN pin names via the SoC-specific hardware configuration
> > structure to allow reuse of rzv2h_oen_read() and rzv2h_oen_write()
> > on multiple SoCs.
> >
> > On the RZ/V2H(P) and RZ/G3E SoCs, the PFC_OEN register is located at th=
e
> > same offset. However, the register controls different pins on each SoC.
> > Hardcoding the pin names in the common logic prevents reusability.
> >
> > Extend struct rzg2l_hwcfg to include an array of OEN pin names and its
> > length. Use these values in rzv2h_pin_to_oen_bit() to determine the bit
> > position dynamically based on the active SoC.
> >
> > This enables shared handling of OEN register access while accounting fo=
r
> > SoC-specific pin mappings.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -257,6 +257,8 @@ enum rzg2l_iolh_index {
> >   * @func_base: base number for port function (see register PFC)
> >   * @oen_max_pin: the maximum pin number supporting output enable
> >   * @oen_max_port: the maximum port number supporting output enable
> > + * @oen_pin_names: array of pin names for output enable
> > + * @oen_pin_names_len: length of the oen_pin_names array
> >   */
> >  struct rzg2l_hwcfg {
> >         const struct rzg2l_register_offsets regs;
> > @@ -269,6 +271,8 @@ struct rzg2l_hwcfg {
> >         u8 func_base;
> >         u8 oen_max_pin;
> >         u8 oen_max_port;
> > +       const char * const *oen_pin_names;
> > +       u8 oen_pin_names_len;
>
> Please exchange the order of the members, so the u8 fits in the
> existing hole.
>
OK.

> However, I think you better drop this patch, and use the existing
> rzg2l_pinctrl_data.oen_{read,write]() abstraction instead.
>
Ok agreed, I will switch to that.

Cheers,
Prabhakar


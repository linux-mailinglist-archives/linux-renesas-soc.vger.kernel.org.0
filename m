Return-Path: <linux-renesas-soc+bounces-24464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A695C4EC7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 16:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0109D18C1E22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 15:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDFF311959;
	Tue, 11 Nov 2025 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnr41e1e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7AF342506
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874760; cv=none; b=Nu/FGGtcMKJMeLoJiZreNBJfUdYwXO5ndXTXHd6NJbQcvULbMQ6ohFDeDU/dIf3Tp7SRjWgCJn/RCQsWzinee+1lWTygVsRhY4q3QjMTqxQVKxbhLpgWUqxCFjorOQyq9PRRfFIq2IOP+ggaY9LUbisUbAYbQdNl8BHCI+0l9fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874760; c=relaxed/simple;
	bh=GFL/z+mAMfM+rN6KRMvwtyrqWMuq/0oUqc7eMK13QvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHtmHhWsJasHnB2ZFr9uFLVjO2XDRzIX4AWE8+MELzNyQHbtalvMaj8l82haShP1/ZCeNYUBP0/L0IHun3O3F+Pgj30fHYoDT9ga5zIuO16FvBPN2mKnDwyYc8Rui64Lo88vdO9gnQqLWGM9i7yJNght5SaAejnFhd/gtQL1ues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnr41e1e; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775638d819so24715235e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874757; x=1763479557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eIlBlRtrd1p+0MZfDvGmwpPkD/U37bHYUkIvdxe1/E=;
        b=dnr41e1eoXKAK7vbQ4+LuEwBMwsxpqRCK2O9L61dJ0oBeVBN5uSFZ6+TiK21D7fqbW
         73caZyMBgnW/jjQHqKHf2LvSVrGq4UljdzGvsdO2q5s/vpvNu3rKoX3QtFyDbW9twwm7
         tYIGwmKqFILuL7soI1Kc3vq70p0TKZFyP7LgcrJdQcm+kkK4qsOrKq1qosQZk1tjm/pG
         qJ7Z0xyGFrlcqDAUuZlQacpyMlecYjXFd279PwXlov8oh24/UFKWYBy2i9cXHel4s3hu
         8k6QK0bEeqTHoG9TTTqdInZ+2xmpz3/r3WGas7v44jJF4dwa9iA3LpWoNZCwKDCqOaRk
         QqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874757; x=1763479557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+eIlBlRtrd1p+0MZfDvGmwpPkD/U37bHYUkIvdxe1/E=;
        b=NpamuB2NhgbeliL3BZtjrzmcBqDeO375NBLR6vKApF5ptawLz7f5ZsnNU0+nx+U7VL
         johiavBk2HsR95W031Ibiaam4pgiGnRQSRFUoOtr7DFUICCbNTAbMzM81BAiXCKHf+bj
         RzBIY1mOpbkh0EyKYxbC/OnvsGk6yHpSULezBA4FYGTVAOSI7niDHgd9/TD6qhs+f1JS
         laqXUvNgzDylqZ1yr+vOfnW+ekTaLW5sHoPGGaoByQjBPTR8IyzgdzjBNrJ0rEOHTb+w
         QQ9BIOHq1EHyMnSIv0bdPChGvV9kBD2tQWohv9xVF6O7lY9K7Du2kbyYI3oSIoMFq8KN
         AaBw==
X-Forwarded-Encrypted: i=1; AJvYcCXTKxpuyt4y2OtmAnnZAXRBOxFws6pIS5iMXes7v1LXh7spCxEEjWK8k8F0Tiit+jYM+UH4Tg37Wy8jGKqBu7xyBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5pdSeeVMJasdxavjpYQnihkwbYsNBmzqRdDF0+q5K7aqYq18
	r6WSI5HVvJ/7WtdBT3iJdtiJy3XUOHeyCsaTmhA2fgr3WAkinCWSa2Qor/7sxsmGNw6mznCygmo
	qEO6zNDPGMP2dYzKjCtx0UBsYCVGXWVQ=
X-Gm-Gg: ASbGncv/YB4UKG1JgwEfpTu32haY8EE6vmrpE7LnDax3PcCCIAiy1M9VkPJz2IZboDi
	QdVdYkFwAu2cijB0Urveo81D5bhUkl91k/rWT5mVO7kP3TSqIM4Xd+h5dnsmSCg7wsiCld6CGQC
	ac0DLnVZ1YNtrkmz9sAEmQO/TB6zruAeeDo54x8yssNvO+kqg+gs7BaDAYE0Lm1l3pb+rNohvuz
	ScapLjo7+sUcxPXg212xoaqUYD5Lzh5JnJqQD+yJa39JmpWR/ssjtdLn0WQsoMLyge4WNar8Sw9
	gjmwe1G3
X-Google-Smtp-Source: AGHT+IFNVrHlhP0Ql13bgsDdcB8lXgcsY0rs+9SGgl/ejSJ1whACt+m7DGFiuz1nodGFp4dmMelD/JHxBtIkiat016o=
X-Received: by 2002:a05:600c:3552:b0:477:fcb:226b with SMTP id
 5b1f17b1804b1-47773230abbmr107163815e9.2.1762874757383; Tue, 11 Nov 2025
 07:25:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <40e744b5-cc17-4b33-8d0b-1e9987eece7c@microchip.com> <CA+V-a8t5Ac_pb3iUGsQSEiJ_Ji-TrKGr-E6xCJEcx_cK2nKeFA@mail.gmail.com>
 <59e68865-fc18-4180-8e18-91ba78b40118@lunn.ch>
In-Reply-To: <59e68865-fc18-4180-8e18-91ba78b40118@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Nov 2025 15:25:30 +0000
X-Gm-Features: AWmQ_bkAJ4OwXXVvGDL_HW-K6Mcyz8rG5DPp2DppCygHFFbqMH6e7uWDQGK-CEo
Message-ID: <CA+V-a8u1V=vEZz0FVVK6mtN9HyVaDkwdQ7fzFVsoxcbCnLMS0g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
To: Andrew Lunn <andrew@lunn.ch>
Cc: Parthiban.Veerasooran@microchip.com, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, Horatiu.Vultur@microchip.com, 
	geert+renesas@glider.be, vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Nov 11, 2025 at 1:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Nov 11, 2025 at 09:56:12AM +0000, Lad, Prabhakar wrote:
> > Hi Parthiban,
> >
> > Thank you for the review.
> >
> > On Tue, Nov 11, 2025 at 9:50=E2=80=AFAM <Parthiban.Veerasooran@microchi=
p.com> wrote:
> > >
> > > Hi,
> > >
> > > On 11/11/25 2:40 pm, Prabhakar wrote:
> > > > +static int vsc85xx_probe_common(struct phy_device *phydev,
> > > > +                               const struct vsc85xx_probe_config *=
cfg,
> > > > +                               const u32 *default_led_mode)
> > > > +{
> > > > +       struct vsc8531_private *vsc8531;
> > > > +       int ret;
> > > > +
> > > > +       vsc8531 =3D devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531=
), GFP_KERNEL);
> > > > +       if (!vsc8531)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       phydev->priv =3D vsc8531;
> > > > +
> > > > +       /* Check rate magic if needed (only for non-package PHYs) *=
/
> > > > +       if (cfg->check_rate_magic) {
> > > > +               ret =3D vsc85xx_edge_rate_magic_get(phydev);
> > > > +               if (ret < 0)
> > > > +                       return ret;
> > > > +
> > > > +               vsc8531->rate_magic =3D ret;
> > > > +       }
> > > > +
> > > > +       /* Set up package if needed */
> > > > +       if (cfg->use_package) {
> > > > +               vsc8584_get_base_addr(phydev);
> > > > +               devm_phy_package_join(&phydev->mdio.dev, phydev,
> > > > +                                     vsc8531->base_addr, cfg->shar=
ed_size);
> > > Don't you need to check the return value here?
> > >
> > Good point. The orignal code didn't check the return value. Would you
> > prefer a separate patch on top of this series or fix it in this
> > consolidation patch itself?
>
> When refactoring, it is best to not make changed, keep the code
> logically the same. Then add additions afterwards. If something
> breaks, a git bisect then tells you if it was the refactor or the
> additions that broke it.
>
Agreed, I will add a patch on top of this patch (as you have already
reviewed it)

Cheers,
Prabhakar


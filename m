Return-Path: <linux-renesas-soc+bounces-24437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 342F9C4C762
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A4CD64E1F84
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 08:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A0D28505E;
	Tue, 11 Nov 2025 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjSEX8+B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83B238166
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851060; cv=none; b=u+qGCpZIlpxGxFn6eE47HCvWoKehlOJL3kZel5/x1G+fLsqpcXBNzyujldefO3hTXO1PypOUq5zcQvMRfB2hzblIvN6DS7Ji7VbBegJVUeD9GMLVLhVfER1S9f+07RDqEjmdCKtely4lcvZvo4vbSUssgaifwJuimPKX1ZXZprU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851060; c=relaxed/simple;
	bh=0YRsrI6lk/jpE/TQxXFHe1uone6HcJRymeuTM22KPDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YrRzxh5t/Vq2l+bJkrguM8lPW0HLuxX75JxqojuazTIeT0BIhObD4/HuD21Jnvcc/3fjKxCIWCNzvDZHX4HCNDT8lZTdH6ia7I1ZVc90DhZXuAPG/RZfo5uxsIfIjfE0leqq4ujtF9piYYueXR0lAKX7Zbf6CGzXNUtrIs+qlGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjSEX8+B; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so1027524f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 00:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762851057; x=1763455857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AFOtj9BBWikbvrk76I+BOfuLhZBC12T4UuFnubfgtU=;
        b=VjSEX8+Bau2Yqc5otfkaZpmWy+ce/jsNVbJnZj6sY4wpQ/xq83Q5Iu3wDuoUGxbCWX
         rHKBgVT08CtErkBqV+fIvf4d/JYvj3pDyAbltVr+STZ/HgWF6u4LTHx9yfg+HXE2ig+x
         c+fTJA3eFrZpUgphQWqa6o3FwpKKMlGmwKliaKi15QzlC7jiitUSXwRy13x5druPLLrs
         nGlBETdxjtdcBUUrxewtKAFdignBI+oz2B00rBTSpJ1kV4WSIDPWCbYl5ZfpDLYrFvVw
         NgEJ6HfeAEF9kiTAkYuYkSwsK19FogYlgdbNMVyV/Z34ZQRyiOCsl1KTRHmsovFi7mT1
         vFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851057; x=1763455857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4AFOtj9BBWikbvrk76I+BOfuLhZBC12T4UuFnubfgtU=;
        b=qKw802RvyBYAtS99WWkqGVkfv/bTWljSRI+6/Y/v78PmeZG5M8UHwnMuJ3t+xw3DbB
         XPt1NM2aCn1UsGiHOWE5tveC9PjXTQuc0KvSJt1SeFkXYI9ZN7GR09aKUI+R/AjDXzIW
         DNyo+B0XRyYzhV7RYbRPgiL6FbaXT45nlaZSgNaB6MoGrfWEafZ0vqu+j5jy8sqIVcP9
         k6cm4/SS9H4+4BabqSeTe/gAbS8nOJGy/fx+PQ/uAfPK8ZBu2kWyC+5N2DPpxYm9lDLs
         83Cw9UB4FDj2xrQOOYtMXPVet+I9h9EGjiVW88f/DHn4UbF1dzZF1eC/HDjcFeuxOyb3
         YcVg==
X-Forwarded-Encrypted: i=1; AJvYcCVbWQRx/X9pwkzTCd8tq46bqtCyFgVKKK+nPLKHZqmWBMYkeRliFevVOobU5I973MICT7v5apQl7eS/q6mPUu4s/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwxG+w56Jp8e0IMQLFDp04T0j3yGqyz7w1I7DkaQJ2Xhkot9IU
	e4zrvkeA8ZneYHXKFVjs+8U9Kl1IastkzsWCdSVZvlGeASfqCOYAuojSwIoTeZWNQrPORNNk0FU
	zKY+JfN+H33Kmuky4torIV4H4uBTdx64=
X-Gm-Gg: ASbGncu7DJ48svRLkTV7tjCloMcpTk79WuzEOQe9F+J4Khn1Ywd7HIMv8yb7keVIk+E
	4MyK48QFssVYCN2Lgi/nAoARLKyr4bzSj2BOArDAd8is2mJf1CIoVF0yn9JN9GGv4wu+Ls2ayCD
	VIBzlLmRjVkPl7cuVRoDquezmVBNtgdvgORIM7Zh+fQkLnu2CUX8emWzXPLYejhmBzvX8/EAANe
	Lxgf1S5Jv0JzdJEVuKQCUJpXoPb3kZP59v79uwyMo+r6eLa5xx7hr6dMHYswQ==
X-Google-Smtp-Source: AGHT+IE+da+1r+jgi0DXyIDNB8MGdp+Nzp4Lqz4ylhf8uYWKyvAt57QPmxdapcBrV4Tm8KD8ARq3BHLCSjO12/WC1Hc=
X-Received: by 2002:adf:9d83:0:b0:42b:3083:55a2 with SMTP id
 ffacd0b85a97d-42b308356e2mr6996138f8f.63.1762851057106; Tue, 11 Nov 2025
 00:50:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107201232.282152-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251107201232.282152-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <ec28d950-f7ef-4708-88aa-58c2b9b0b92a@lunn.ch>
In-Reply-To: <ec28d950-f7ef-4708-88aa-58c2b9b0b92a@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Nov 2025 08:50:31 +0000
X-Gm-Features: AWmQ_blqCCNNMwhN5TO78-IZrSmoQkRYNb4dIksXog2xpI2Up-_qLjDEx3kShQY
Message-ID: <CA+V-a8uLC5OJ7g1MbJVcJeCS9wPVYDoCDUW7i8keUftQLkmmLg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Thank you for the review.


On Tue, Nov 11, 2025 at 2:50=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> diff(1) has not made this easy...
>
I agree, --diff-algorithm=3Dpatience option for format-patch gives a
better result. I'll send a v3 with this option.

> > +static int vsc85xx_probe_common(struct phy_device *phydev,
> > +                             const struct vsc85xx_probe_config *cfg,
> > +                             const u32 *default_led_mode)
> > +     int ret;
>
> > +     /* Check rate magic if needed (only for non-package PHYs) */
> > +     if (cfg->check_rate_magic) {
> > +             ret =3D vsc85xx_edge_rate_magic_get(phydev);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       vsc8531 =3D devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP=
_KERNEL);
> >       if (!vsc8531)
> >               return -ENOMEM;
>
> > +     /* Store rate magic if it was checked */
> > +     if (cfg->check_rate_magic)
> > +             vsc8531->rate_magic =3D ret;
>
>
> I think we end up with something like the above?
>
> I would move the vsc85xx_edge_rate_magic_get() after kzalloc() just to
> keep it all together.
>
Ok, I will group that under single if.

Cheers,
Prabhakar


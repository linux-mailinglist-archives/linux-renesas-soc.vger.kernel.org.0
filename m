Return-Path: <linux-renesas-soc+bounces-21411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A98AB4481D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 23:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21C525A7A9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 21:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB09299A84;
	Thu,  4 Sep 2025 21:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKeOx47B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFA2951B3;
	Thu,  4 Sep 2025 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757020262; cv=none; b=eDOnVIVMpAURwQlHeUMeViWhHpzCJgKQoBx0GgtLnyK70eyipU/6rRu5LhsgpipbtshzQ2bjsA9tevzjsBNhx2F3cJntgjq3hkNW/CRlhoCasIz+5F9gx7mg6iiv4yC9s3E7DrSfT+PYI58Ro46HEvlWcS5OeQTedsO4EZjJGR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757020262; c=relaxed/simple;
	bh=s41t3tEClIPqImf14G5Umj0Ijc8KfxZHCW8WvoXEJ7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bogd53BTnU9ieT8Gl+l7RkTUAYGbGSe6v+k7qsd1Ao+K2HpBLCzP4P2tkWefmXEhIh4e6+TEw/OCAJqP2NQEHQOnoIyz0VXJH3cLzPPAapbMeDdT+1DQfHC8yCojD1x4jhkh6nEF1FI87meNwgEbL/YPYF89A3LR+6BH/icsaMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKeOx47B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3df2f4aedc7so889363f8f.2;
        Thu, 04 Sep 2025 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757020259; x=1757625059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAUp29zeM6Eea+iEGcle/fQhECh+9aNVpzcpnyZ4uZ4=;
        b=XKeOx47Bcie1rv4SiX4rsu8N8tTKopKElz/Z8HA8lIQ9J2fYLB0xGLypVtIM2K3t+y
         28vgc69PELwuraxGZXYwOpVwOEeZ6QlwR45q2kdjwclX+hnLS9UHEKhFq5Ashs1TYR0l
         mVhCCXTqMbHsOLwct9uR6G3gBBNOqP0nhG9exKnh4QML7ZzpIytmHnfgWOvOZnCODCtl
         GGwsflF9rATEwkYlpqPGbDAYfGGOfESwg4A0RmO9YP4P4F5LVua9fMzPr+S2D10BZKvV
         cDPTWCBsCJ8kitYGLrgXAkCrkp1g7+mSo0K1AvopSEoj5xQP8NKZBAJb131gAcYFe0ZC
         R9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757020259; x=1757625059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAUp29zeM6Eea+iEGcle/fQhECh+9aNVpzcpnyZ4uZ4=;
        b=cOAWW2U4cIeR4dHfCQLe8iCfJEvsTW52WVwmOMGZMFmspjeBTQ6MikJv3NjqjWjG9y
         Vbw7CeCJqoV7We+Y/SeFpf5dHSuqvQ2tXbSkPSDNO+1RK9VJIHFylrHj+rUJF3Vf6wjV
         rkvgJ5Zkqy3ujSWvnoqnqELGk+oJcJfljqT4rDzDFhFmAEcZ5XngVde4JqZ6q+dT04k2
         TqdzYZx9B4JC9G9zH1ILJjt68tMYVcFjVCywa0k/VoKKCWk99hGQ+KKnja4/Nh6h2Qd2
         RpjF7sr6ABVoMdfrgoBpx2WTD1i9VnOBB3Cyu3nUW8uE9t1GMb8+CzOf6TSXzck997H5
         YAVw==
X-Forwarded-Encrypted: i=1; AJvYcCV03P9Ly2MeP81a3yQbGRuweTVmxXxZ9irgm8I/2UepLad7hiTLpL6lz/i5yKTOlgIuHykVnwo5jyL3A/bM@vger.kernel.org, AJvYcCWTXw23PVOFjOEJlP75WRoHDkX2mxsMPUPgA8LsRA6geCMMxkLgVAPFRaAa3MmQPPbA6qsn1eRkbH8JgzpX6mBvpN8=@vger.kernel.org, AJvYcCWof7gexC7cdyOFnA3yq1NKZfYrJNkN00rXFpvgsLLEEovS7GoJwNCyUgagxpBDvLSCKq2mSDRawcia@vger.kernel.org, AJvYcCXSQ3ooeu2Wb0XgZnGlln8gw2UzLGIOCnrPqtKzDmcp/aoPoqWix3whIN1TSHc+mlUeA8EGDfIw@vger.kernel.org
X-Gm-Message-State: AOJu0YxqwmL0pMDco39x2kbix0Bf0CtlOQbPRGuhKytRqBJfGFPDWv2x
	n6IE8W+WVMxWts+iKPwlY/7yqgcbGCkRI+zhBoHFqmHXsm8shIBhD80JOqoL6KqYd28wkH5Bbyu
	kpC9BljClKCnTTeFzcIICv0dlkXBzL3I=
X-Gm-Gg: ASbGncvvg6YbKwmAPHKvHmfea3nA2lYSND2WxL/EGjszdKqkHzTqUeWujiP2KYIsEYO
	YjYkXJE0gsMh6/4wpVbdkWsQBXPsJXXLNWG19mQG0AdXryz5icA/zaZyN+gwfl19XP9NAWqYOfw
	6eMHVboJ8JE6KlvJzWBEl/OwfocLibLw9hgiR0o5A6V4z07DBQ2DeDmfCh4iXR8Pu9k0JhB77dp
	GSMEagfgcr/2YwLL6hUigDzqmJzgm216t9JwJAW
X-Google-Smtp-Source: AGHT+IFl5pt+oDPr0Ohssl2A7YuW3oT77c4wgZ9dmvatNAp/vfqg8+n2yH7G5lllCD1SADyzzMeQZBHdc0g8MZ6xLVk=
X-Received: by 2002:a05:6000:2889:b0:3e3:f89:ea31 with SMTP id
 ffacd0b85a97d-3e30f89f5f4mr720584f8f.61.1757020259089; Thu, 04 Sep 2025
 14:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
In-Reply-To: <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Sep 2025 22:10:32 +0100
X-Gm-Features: Ac12FXzTh_QwLSBZNVL4Qmae4bCfLKKdSn-hnwmDHrHtfF7DVr842_KM4NBa2lw
Message-ID: <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: dwmac-renesas-gbeth: Use OF
 data for configuration
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Thu, Sep 4, 2025 at 9:49=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
> >       plat_dat->init =3D renesas_gbeth_init;
> >       plat_dat->exit =3D renesas_gbeth_exit;
> > -     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > -                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > -                        STMMAC_FLAG_SPH_DISABLE;
> > +     plat_dat->flags |=3D gbeth->of_data->stmmac_flags;
>
> You include the first two flags in your new device. I would like to see
> at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
> reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
> changing existing behaviour and causing regressions. New stuff should
> always set this.
>
Me confused, STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is set in the new
device [0]. The reason STMMAC_FLAG_SPH_DISABLE flag being dropped in
the new device is SPHEN=3D1 in MAC HW feature reg for the new device.

[0] https://lore.kernel.org/all/20250904203949.292066-4-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

> If there is a reason not to have this set (e.g., PCS doesn't support
> it) then we need to make that a PCS property and extend phylink's EEE
> support. If there's something wrong in the setup that stmmac does for
> EEE, then I'd like to hear about it as well.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


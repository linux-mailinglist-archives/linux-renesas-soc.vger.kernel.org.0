Return-Path: <linux-renesas-soc+bounces-13684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2EFA44E93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 22:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E33B33B48BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 21:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE3121148F;
	Tue, 25 Feb 2025 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZF1IjJ2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071B9211486;
	Tue, 25 Feb 2025 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518097; cv=none; b=NWUnKgQ+uZTCIvs/YHDKCs7ucKiupqB2Cg31ZMbez0hwjRjfNbz/E7JhHFNs1YfVw22eq53GPB0mT7El6jesr4fg8mUq2LGX+rKvP8VMQOOX/cIni8X0eaQth59guYVUQ9+5voMuh/5Q7hkfJ0irZUVo5VTiwPERYxZpfw1ah3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518097; c=relaxed/simple;
	bh=iy7RzMcseFqoBKxXRI1szKiJ7QaVa9fG/SmJIRyWj/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMhLbla5g3Ss1JEaUdo+Go8rzILiJXRTNohnbfNo8G/u83/6+FM1fY6+ZmSfMpLplOKLfo2ngcTpjhggXYgYxrNY6Q4VY+9q5nuX92RRYBzOlMGz1lsWlzaleLDR/ujWFPELfJ69vnrdRZHXwLB8xk/trQbct3qqbz4639CULN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZF1IjJ2; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51eb181331bso1805452e0c.0;
        Tue, 25 Feb 2025 13:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740518095; x=1741122895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AW5QcpgIQeo7y06TiRKbv/Zl5iFBz580MvzxJVvIe9c=;
        b=UZF1IjJ2KE3LbKLY00rCLeba9sq4ggApqhuWCqhfvZGGhCzUNx6g6jMKfKaQeg98KP
         qB+QHOU68UkL0u+J3ABHF6DRu10GYHi0lqDw/Vg3Dse6NxiMalIYp5gvn/HEVyM8gFaq
         OleEdJsVdrDpku1U6StjlpahePAe5RVKFv0O4FDgfoOS22Cw/NuI7ljtRN1VMU0e131f
         +sli4cqWBom49j4WlVoODHqIWsaJV/E+KuZmSJlBMPZCjQTFZFY4Ss/NsCYDnozYnW6z
         DCNomcjPNxSNlUBH5d/Bc6LGALyTainrKaEeKi17P0IsU48ws/9eGBTNY8PHfSkwR9Lb
         /H2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518095; x=1741122895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AW5QcpgIQeo7y06TiRKbv/Zl5iFBz580MvzxJVvIe9c=;
        b=FNGEs1S9Bmc0T6V0matSSfeGENGk4rjjiIVwSip8HIKE25wgDRBpeyj64kOibKqS2F
         Q11XYsJOqNkOGEViLIW2erH5dCG9Tk0ZlDuke7rRl/mwzTVod8GCIxJmolSDWtaXK7AM
         s2Br4msxDzRFIeer8a1YlsUmCBOqOhjAPQhX/b+toPYsUjZQKaGlWo5smDQyIZDBkBiJ
         hzUw+pP0t3UZmeT3aOyBvl5aZ46t3I2FwDY6a3G59KGR/71PhOQkolE1VKbZ5kMWOnJb
         zAZCPmHC54+5TETqIpX7l6Y1ORjXRkoWo8JE/kgqRIZqpdoOGTXXGvSRARo9353MgmW8
         14TA==
X-Forwarded-Encrypted: i=1; AJvYcCWkYP3Y89AELLi8WfdqLAXPHfOXyzbAMKIWcbGlrsHfsX7SYmvLZy0I8cKBbbc2k79tSsIyHyaHDIgcBVf6aLvkJeo=@vger.kernel.org, AJvYcCXWLPxuD3kGSJvu+uniaVB5iC7Fl/nfPGlNxwnai/4EUEaZe6h4VpkpRLMcLUPXqoxgvsTZG3HA@vger.kernel.org, AJvYcCXoVdR4JqSmElsboUCZTqYheSMi1gz7pKdQ/ntwTDJh0/lxDTs4Rw6Pz1iSllkWnQnYF1WMhIDe44OL4DQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmm4bgGv/FJh1c00Kc8vKlqrPVT/y2F6PTIB8EIJzPk8SVU2wJ
	j0ti+Hd3yJQJA16SLVQ4VE6vaYZLD+rmXZrg6uCgPWKZnG2DBWL3SKqV+D+u5ob/B9MYe0xek/k
	ukgJR4SjCgClncqcb7hgVylO6xvYUv3JVXIE=
X-Gm-Gg: ASbGncvpg91gjHB67UHKVRBUnCqSPoTI4j2dt8PJelZ2FAjcDKZvNHv/UEGSKhJc+eF
	qr1uvP5tXnoObAlMc3sFbbuDqvlz1yQA2eBjHZByd9/R2QeEo+u3uuC3WuPKx0BodG5Ox8qzxNA
	Wek0FsECA=
X-Google-Smtp-Source: AGHT+IH+22l/nhV/eo+LsoUBWcRRFcH+qjcSVfVQhj06cmg5RN57DPWPOTTnjdaIgqgufqGoSWJZ4zcmh/LpTAenPzM=
X-Received: by 2002:a05:6122:370f:b0:51f:3e67:75df with SMTP id
 71dfb90a1353d-5223cd67f1cmr2916625e0c.10.1740518094826; Tue, 25 Feb 2025
 13:14:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com> <20250225105907.845347-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250225105907.845347-5-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Feb 2025 21:14:28 +0000
X-Gm-Features: AQ5f1JpFrcLSR2PdWwsq0IaFGDrBnxPMoaqIzSsoFrcOvJ3nNscVLCVZEzeeiPI
Message-ID: <CA+V-a8sX4TwV=7rr17_fhaYKQr2cB6nScFgydqdTmb2jVBqaRg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] phy: renesas: rcar-gen3-usb2: Assert PLL reset on
 PHY power off
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
> Assert PLL reset on PHY power off. This saves power.
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
> - add an empty line after definition of val to get rid of
>   the checkpatch.pl warning
>
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 5c0ceba09b67..21cf14ea3437 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -537,9 +537,17 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *=
p)
>         struct rcar_gen3_chan *channel =3D rphy->ch;
>         int ret =3D 0;
>
> -       scoped_guard(spinlock_irqsave, &channel->lock)
> +       scoped_guard(spinlock_irqsave, &channel->lock) {
>                 rphy->powered =3D false;
>
> +               if (rcar_gen3_are_all_rphys_power_off(channel)) {
> +                       u32 val =3D readl(channel->base + USB2_USBCTR);
> +
> +                       val |=3D USB2_USBCTR_PLL_RST;
> +                       writel(val, channel->base + USB2_USBCTR);
> +               }
> +       }
> +
>         if (channel->vbus)
>                 ret =3D regulator_disable(channel->vbus);
>
> --
> 2.43.0
>
>


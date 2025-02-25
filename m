Return-Path: <linux-renesas-soc+bounces-13681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6610AA44E04
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 21:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D76717A82BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 20:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4066F1A2C0E;
	Tue, 25 Feb 2025 20:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTuB6Zg7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DAE19E7ED;
	Tue, 25 Feb 2025 20:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740516294; cv=none; b=KVE1Pvet7bAyDL23w+r5l1TOrAtNHUXASDlf4pp17upj9lMZrJPGt0ze8jjOz+jp9UnwtWI5uqS77yTCs1SbkJAevUNStT1zfUp02MyHz9LtM4Rvs701nSbhzzZf3JNN2c1SWruJvTpW/G8jGfcsDHzj6vDgasrdON7NgdM2vWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740516294; c=relaxed/simple;
	bh=JdaFfeojRgDLnSKCRnP3LQY4obwOcVD+i7u06UObPC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhSpd70zUDe2ASx7Ny/19Gk7487tox13CorPgDlnVA3YHWYdN+vnJaGFF0yQnL5SmnxzXc07M57w4IxLvX9T5dORZmWpnOZKRu8B7EpXmLBoW2cl+YdCH4T740dMUpwDGMwIV1o/szucln3nLbAYnVJtBCfT7CYr5Qk65nEf/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTuB6Zg7; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-520a473d2adso3889319e0c.2;
        Tue, 25 Feb 2025 12:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740516291; x=1741121091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyoYCdijdAcDh+ZcnJz2vFf5VFCyyRpDkibyR777Msc=;
        b=hTuB6Zg7RBi7qu9DmDzrKal977l1mdp+wZRsKrZNXH/U9Kz3/AfXj/clFRYp5iUQ8t
         Caj1tGEUMPyH9t2gWJcMxRqEF+tKqifQcbsIP8JGiMV/N4NV8uODUTE2aJWhRW5HaP8x
         8zpaVNusWbdTV4niJ00nAE5dZTVy7V/DAa2A+L2UN2x0RfbJVs2j2+tLT5qoX6p6BfG9
         qpzi8LKbTkxGidFDbsXqKlyvzYuSCYihBNYTLEcb6ezdOa6HO8K4zkWC42/Nt0lc4zZ+
         BxC047B8KT9GRLQmQtkZbIhtEHDlGEHiF7kc2Zz/fsR2ivo8iMnZwcoVDDvCMMRYSA6I
         TXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740516291; x=1741121091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyoYCdijdAcDh+ZcnJz2vFf5VFCyyRpDkibyR777Msc=;
        b=MdAW8q+qN5R5hI56YlHVXAW6SGdMHOy3lVdBNbzAMnBGjkNBwE2PSEWwsTv2lcsQZy
         Njj8XlRNqmctk3PyLTDrQG64bScvpJtK9gpJ25fHx9R4SWu7OvV7DUTvZ8P4Jbaeh76v
         PBDEn7gEcBulKTGh7tiYtqNzWdxU13E659lPem9hR4MaiEb4gT4fgcyr4xNrB8Wr2mgi
         kzi19JkuzArJjXBmKJBn4uxZqx7TmFAE324G4rIV6fbBISFC2vdEZg/HzI9lP+/ervZS
         JATf7ZvbfkhnVxKZxOP6FUfxlUaROIBgdsJtNKtEiVsRXmbMK97giqqLy4sLLj5ubEln
         ypxA==
X-Forwarded-Encrypted: i=1; AJvYcCV+BbTFOkXm8yUUaC8uf3vsH27SY2jq0YisEsmy8u4LFHXYLEp6Y63tOA+1yF1PRevCMIRhTWRF@vger.kernel.org, AJvYcCWeH4iC0Tl34swvRnsdKOHB36E9rhYsKq6eyigWfUa5bLk1KogS8DSTlPLcpQtb0gWM747tqBMVO6vCX9fUNrF5QGI=@vger.kernel.org, AJvYcCWug61RIVryn/p3r0RtQCmMLfJgNRUk/FHFVVcIRGiKPrPRY97Aav11KSIQCZndTmgZiFMJxFxi1wECid4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbUZ1nUuSxm03lB/phUAMroTlpamnEQxFcK6maIb3nSvVX/Vx7
	OGTuE1/UB6zn9pyt8IkO+hE/ip2kRIrouXFzv58D6WsBvNUanJJ9zEvkhVL9n7zdPdJN+WD3LIq
	IH1c/0YpyVlb/AKV3xOqk7GYloUYkpRVBj0E=
X-Gm-Gg: ASbGnctQ4Q4xHImU+6p6tPbfzfQJZsvMzFs6dFqdah/OtICAppbxlP7E5Rx9dgI+NG8
	4hcwMYBFzpsexCIh/JDlSBIjVd4o4NdWHyfFVhyED1KVAwuzOx2RuNw5tYP/JvmYAzGhRBSUZEi
	ofw0ap3BY=
X-Google-Smtp-Source: AGHT+IHocGgr8LXv5iH+ArhqKv5jV5H0FxchaIRcKB4J5GmBjFqIgnfpzy2JT4VgnnH0wZ35gCW1W5xZpGxQIzs0H+g=
X-Received: by 2002:a05:6122:4009:b0:520:5a87:66f0 with SMTP id
 71dfb90a1353d-5224ca5f48amr622885e0c.0.1740516291172; Tue, 25 Feb 2025
 12:44:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225105907.845347-1-claudiu.beznea.uj@bp.renesas.com> <20250225105907.845347-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250225105907.845347-2-claudiu.beznea.uj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Feb 2025 20:44:25 +0000
X-Gm-Features: AQ5f1JrIlEI9csHkFJEJ6oSQm2qEweelampPKPuX9QpIXSLN_Q21l7vsjhxOkyE
Message-ID: <CA+V-a8tBPHA00n9MyP_PJa8KzTMDNJBoE7n+DzuzT_ObR7SuJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] phy: renesas: rcar-gen3-usb2: Fix role detection
 on unbind/bind
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org, kishon@kernel.org, 
	horms+renesas@verge.net.au, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 10:59=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> It has been observed on the Renesas RZ/G3S SoC that unbinding and binding
> the PHY driver leads to role autodetection failures. This issue occurs wh=
en
> PHY 3 is the first initialized PHY. PHY 3 does not have an interrupt
> associated with the USB2_INT_ENABLE register (as
> rcar_gen3_int_enable[3] =3D 0). As a result, rcar_gen3_init_otg() is call=
ed
> to initialize OTG without enabling PHY interrupts.
>
> To resolve this, add rcar_gen3_is_any_otg_rphy_initialized() and call it =
in
> role_store(), role_show(), and rcar_gen3_init_otg(). At the same time,
> rcar_gen3_init_otg() is only called when initialization for a PHY with
> interrupt bits is in progress. As a result, the
> struct rcar_gen3_phy::otg_initialized is no longer needed.
>
> Fixes: 549b6b55b005 ("phy: renesas: rcar-gen3-usb2: enable/disable indepe=
ndent irqs")
> Cc: stable@vger.kernel.org
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - collected tags
>
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 33 ++++++++++--------------
>  1 file changed, 14 insertions(+), 19 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 775f4f973a6c..46afba2fe0dc 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -107,7 +107,6 @@ struct rcar_gen3_phy {
>         struct rcar_gen3_chan *ch;
>         u32 int_enable_bits;
>         bool initialized;
> -       bool otg_initialized;
>         bool powered;
>  };
>
> @@ -320,16 +319,15 @@ static bool rcar_gen3_is_any_rphy_initialized(struc=
t rcar_gen3_chan *ch)
>         return false;
>  }
>
> -static bool rcar_gen3_needs_init_otg(struct rcar_gen3_chan *ch)
> +static bool rcar_gen3_is_any_otg_rphy_initialized(struct rcar_gen3_chan =
*ch)
>  {
> -       int i;
> -
> -       for (i =3D 0; i < NUM_OF_PHYS; i++) {
> -               if (ch->rphys[i].otg_initialized)
> -                       return false;
> +       for (enum rcar_gen3_phy_index i =3D PHY_INDEX_BOTH_HC; i <=3D PHY=
_INDEX_EHCI;
> +            i++) {
> +               if (ch->rphys[i].initialized)
> +                       return true;
>         }
>
> -       return true;
> +       return false;
>  }
>
>  static bool rcar_gen3_are_all_rphys_power_off(struct rcar_gen3_chan *ch)
> @@ -351,7 +349,7 @@ static ssize_t role_store(struct device *dev, struct =
device_attribute *attr,
>         bool is_b_device;
>         enum phy_mode cur_mode, new_mode;
>
> -       if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch)=
)
> +       if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized=
(ch))
>                 return -EIO;
>
>         if (sysfs_streq(buf, "host"))
> @@ -389,7 +387,7 @@ static ssize_t role_show(struct device *dev, struct d=
evice_attribute *attr,
>  {
>         struct rcar_gen3_chan *ch =3D dev_get_drvdata(dev);
>
> -       if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch)=
)
> +       if (!ch->is_otg_channel || !rcar_gen3_is_any_otg_rphy_initialized=
(ch))
>                 return -EIO;
>
>         return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
> @@ -402,6 +400,9 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan =
*ch)
>         void __iomem *usb2_base =3D ch->base;
>         u32 val;
>
> +       if (!ch->is_otg_channel || rcar_gen3_is_any_otg_rphy_initialized(=
ch))
> +               return;
> +
>         /* Should not use functions of read-modify-write a register */
>         val =3D readl(usb2_base + USB2_LINECTRL1);
>         val =3D (val & ~USB2_LINECTRL1_DP_RPD) | USB2_LINECTRL1_DPRPD_EN =
|
> @@ -465,12 +466,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>         writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET)=
;
>         writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
>
> -       /* Initialize otg part */
> -       if (channel->is_otg_channel) {
> -               if (rcar_gen3_needs_init_otg(channel))
> -                       rcar_gen3_init_otg(channel);
> -               rphy->otg_initialized =3D true;
> -       }
> +       /* Initialize otg part (only if we initialize a PHY with IRQs). *=
/
> +       if (rphy->int_enable_bits)
> +               rcar_gen3_init_otg(channel);
>
>         rphy->initialized =3D true;
>
> @@ -486,9 +484,6 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
>
>         rphy->initialized =3D false;
>
> -       if (channel->is_otg_channel)
> -               rphy->otg_initialized =3D false;
> -
>         val =3D readl(usb2_base + USB2_INT_ENABLE);
>         val &=3D ~rphy->int_enable_bits;
>         if (!rcar_gen3_is_any_rphy_initialized(channel))
> --
> 2.43.0
>
>


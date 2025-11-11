Return-Path: <linux-renesas-soc+bounces-24457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCB9C4CCBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 628D51882D67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CBF4A01;
	Tue, 11 Nov 2025 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUKPSIUM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CB3212560
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762855002; cv=none; b=E5e26lUoVyWQTxJ6rnvJkPSZJvifgpXjFvDmgikrBOUu2TLW7Y7vonuR0naNwvPLhUh4nU90Z/apSu0gr8UIYMSZBcno8gJycuMO/X8h7cMgTVUZjyR6q9KxIBjOHq+AlQRj95Yid43fspvM3TGISXdISP7tOC0S92PutlqNGZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762855002; c=relaxed/simple;
	bh=jkgc5+vd53UiZCxhNe3hI/jvAtzcUQj3f4ZwiPIU3CE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p6QZaVKBDorurPQu4JedVvHW7u2Aa8UGcUti6J4Vs32ehfnPL8TPoP6AE6xl2hh1gd5BxE2Rau9mGnDhh+rtnLxfgqnUFZKZwIt2echqQGPD6m5gQNbe5KRrS5E5cBZPRhKS1LQd227rMAZWz5nHmhpWIa+KW+qXwOYYSgEjK5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUKPSIUM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so29972365e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 01:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854999; x=1763459799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=old4NHpZNRQlq5F/NJ7Wd36OkosNtO/noel5lfu80nM=;
        b=iUKPSIUMbkcVBQ6J9sWiyhEhXn0A4LRUn8lWuQymCcLXcgqBqAxpWaOc5h8AUvmZht
         VcJAs88YIQYae9CXNl14OFoKW8gbFe/J5AXZhB5pZ7sUf9WNKbyCqJ+KsIj9L+qIjqMT
         RMuhxV+3qxWr6kZOHNZsVNhmltHE1U/0PGx9G6aqG1SyHI1wsuhCtDGcDcrhvQhxim3S
         z8m9GdunEecY3xzehoiDUCpN8VUfb1KSD13yiqBxrmsRjwX/NnL6Qmt1252+FOEJ+6n9
         UmP2kWLq97X0tBR7w/0tn28CV8dwK7EZ7OAbGPRwdAfSyW5SCO+lrDnoVeED9ZWFS3aD
         iCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854999; x=1763459799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=old4NHpZNRQlq5F/NJ7Wd36OkosNtO/noel5lfu80nM=;
        b=hsU2wj3TbeUo+Oj2DNXkkJLz0D6dqvkl8VCN736yoouA3NkFURCNuNsZTF7nqDXN1H
         hT/EjqPDFD5VxPuqR/dBZI1vzRTuL4y4gq0BoVQ9gnWy0QznrHuKwxzuXJaZvo6snfTB
         yYk+nkOeFSOnHhoQEfraUutPotlPd7iYRQJfVWkWb96r5PoWvpEE7VrE6r58GwVgLSit
         e9V0PP/lejNWcLhBz/NhoXrKLqSko/KZ+jtA9nG/qcncT5rcu5pkVCqfRiQuAgk6Baxa
         ymcnyhgWq3nC7mnLcuxr2/DHNVelSv1FDCtuIR4cD4yvHaoPLIBjIOyoUX9HypFQG0KX
         2kvw==
X-Forwarded-Encrypted: i=1; AJvYcCWBo9uqxDA53xq+UO5pxmy8T+HEUwWYv0v3C+1QOoFFe38p3zbM7WDXpO+MIw5RRyy8U/gA6bwvdwWB5EzF/vtz+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwptJFHsmHlqORPD/wMKL0701DEYVCktgy/AmnnVrYjdOdie2
	f2/dfiFYFT6zg0JLwwOiF5BgHB+vrUM3gizZq4NugAc+FKAUMQosfOL2DyuXdUv8rPFUU6eIhCW
	ssSjn+0aF7QVI26FIchF0S+A3JsGuMmQ=
X-Gm-Gg: ASbGnctGgY02yciX31Dj21jEe8Xc61AyBJh1L3Y41PbNv5BCmkrCRm30ZZyQWhiSf4g
	clTQ3ps972rRZlbjlFAL62GsHqjWh4OEscTnXcZRBiWjlxbvL3n05X5RDEi/I+ScxhYab3DDppG
	z3Nq6nYZSf9BlrNSeFURUBLA+7Am8kPvkF1VIkWqF9hInIRwUEGicuc4zPBlYSlrbki4AtnEO+z
	kNVhowO17qXLJo6y32nxpdvgbbPfMHlrI50hcToabPnbhwo0+YnFzFiyRnW/L0koNCNJjtJ
X-Google-Smtp-Source: AGHT+IF7qpKo+MsmIWpLUty6mew6BjAdPBm9lIre8k2/Jvv5ZucJOwY+zC+wLimhZNmUnrg5eMJyJxNj/dIokpZI+F0=
X-Received: by 2002:a05:600c:1f1a:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-4777f4a496bmr40099395e9.1.1762854999316; Tue, 11 Nov 2025
 01:56:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <40e744b5-cc17-4b33-8d0b-1e9987eece7c@microchip.com>
In-Reply-To: <40e744b5-cc17-4b33-8d0b-1e9987eece7c@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 11 Nov 2025 09:56:12 +0000
X-Gm-Features: AWmQ_bluZAgbO3v-1VvKVux1F4V0OMKz7MOCbUQ70QEf8OgOn18rDwQSq7RXXHM
Message-ID: <CA+V-a8t5Ac_pb3iUGsQSEiJ_Ji-TrKGr-E6xCJEcx_cK2nKeFA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
To: Parthiban.Veerasooran@microchip.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	Horatiu.Vultur@microchip.com, geert+renesas@glider.be, 
	vladimir.oltean@nxp.com, vadim.fedorenko@linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Parthiban,

Thank you for the review.

On Tue, Nov 11, 2025 at 9:50=E2=80=AFAM <Parthiban.Veerasooran@microchip.co=
m> wrote:
>
> Hi,
>
> On 11/11/25 2:40 pm, Prabhakar wrote:
> > +static int vsc85xx_probe_common(struct phy_device *phydev,
> > +                               const struct vsc85xx_probe_config *cfg,
> > +                               const u32 *default_led_mode)
> > +{
> > +       struct vsc8531_private *vsc8531;
> > +       int ret;
> > +
> > +       vsc8531 =3D devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), G=
FP_KERNEL);
> > +       if (!vsc8531)
> > +               return -ENOMEM;
> > +
> > +       phydev->priv =3D vsc8531;
> > +
> > +       /* Check rate magic if needed (only for non-package PHYs) */
> > +       if (cfg->check_rate_magic) {
> > +               ret =3D vsc85xx_edge_rate_magic_get(phydev);
> > +               if (ret < 0)
> > +                       return ret;
> > +
> > +               vsc8531->rate_magic =3D ret;
> > +       }
> > +
> > +       /* Set up package if needed */
> > +       if (cfg->use_package) {
> > +               vsc8584_get_base_addr(phydev);
> > +               devm_phy_package_join(&phydev->mdio.dev, phydev,
> > +                                     vsc8531->base_addr, cfg->shared_s=
ize);
> Don't you need to check the return value here?
>
Good point. The orignal code didn't check the return value. Would you
prefer a separate patch on top of this series or fix it in this
consolidation patch itself?

Cheers,
Prabhakar


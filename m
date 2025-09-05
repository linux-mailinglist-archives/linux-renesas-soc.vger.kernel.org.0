Return-Path: <linux-renesas-soc+bounces-21481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FCB457D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7E83B63F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 12:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72FE34F49F;
	Fri,  5 Sep 2025 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbX9c/yC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B1A34F483;
	Fri,  5 Sep 2025 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075170; cv=none; b=GDkyiJ4nGZfGgZ5/2CiE/UvS0tHCC9ahppVgm45IsxczrL8PXkbzSvOT0lXb10CYe1bp7M67AdPCqPtcsibF21z16SspCLJLFCyIgQBsKrSd4iKuUR4KbzzZjzYV0vKP5hmdSpVUorZuJcGfw1RPcmZUSOixdTYxZnLeniC4oAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075170; c=relaxed/simple;
	bh=wwFkWJg5HoUk2hSJWBdQjWw9OgX0W1iFKT/qDU1CpZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pl6EAUcVoWz9Bvfk4IrJDFw8KMuz6wyOhsmYYYqjJ5whS0bLluyh2SZJM2VGy7+SShATTonSUZVSoVwrcD80a0kwawxhgEBxNgxlZJzjPz6fI0k9tAsiNprcPGGaa0Wpp6ESNo8wuPXUGLMLhS7UbMORPsaXAMkurRsOCI1h2FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbX9c/yC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3dcce361897so1425172f8f.3;
        Fri, 05 Sep 2025 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757075167; x=1757679967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB7S2EtUpEWZ+xx8MbHke+UE3WWH8zMsnHAoeyZ1ARQ=;
        b=DbX9c/yClCRudfUVRGw0IEporliGe+Ixor7zj/pI6orZYDWc0TlGdWjA0QqdhHURBD
         YJ8SDUpyhUHvEaFqUlOn7Ru02MNuiW0MQgqKq5hZCGV5zBBKtt/r+m/RPFpoGaAbo4B+
         thC1VNgP0rRBVBD+IGJoP3mziOgK3+y3P8nLH2x+dGMG7mibMDlwvRZB92yq9KGAk4ng
         Otx1hCGPuKq/B8B60kNefG/B7/IMZvNnWeaH5LTHhvJ2HrLG7QmA0pm3moI/1rdtX9aW
         RZNR7Vjn7fAIUatpx03Z287HzSTPlW2FoMh60V7oi2zfdCphwqW1vcyZ90MR4QGChitC
         z2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075167; x=1757679967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pB7S2EtUpEWZ+xx8MbHke+UE3WWH8zMsnHAoeyZ1ARQ=;
        b=TSp+YeYD4O8zfWPxLZ2+KGxZ1oI2nGlKAKYZ/RsKF2rQ0cnVZ5logkDSmlj8njOwTM
         lrIC86Heeu3OsmHgpRTD9eO4KUaTy1WI8sdkq1Mp3k3cwGyYT1fc6DRqYc51QSbyPupa
         8t/adFvrRjkZnJy+xFTPZhypKAolrOf4wFonGDbjiMZRQPk7a9FkMoRVwgSVedj8nv0F
         OcOgKQjhaBY5mX4LRSzUvqWxNZqDe2nsR2FkBBfC7m1rCWDJxF+jV3iUfSdBwkwx7lq8
         yZ8w/fvXHcV4MVhI5nW2StnD7RzQiQyPQnNe0Ey4hHPN4AvMSG9Nd+Hr1eJ4Ocm4SF85
         yrbA==
X-Forwarded-Encrypted: i=1; AJvYcCVLZhDWx/MIKuCjNM86kpmibhgS+9u52iDdZUYEFn7iarq55NBOHVrrZ4RDRkTWwuXK7ROqu6wObuSvgK3VS1onfzc=@vger.kernel.org, AJvYcCVbK4R0eq2b8ddILx1X/to940IXd9jlb4yfBjZnkBIRLH4HZ/1b6sYnIbuVKq/59hViK8oGHHPrUcUmASBK@vger.kernel.org, AJvYcCVuip6/gTqmw3nRucsFtcK9dQrK/RV9VLLv8GxaM/YtBbLm/7TOqF+MAJbbO0xD+0kdLMV4jPIFU6KN@vger.kernel.org, AJvYcCXbXdvelBRs7n6l4e9QdrnH7frfu4Hd/RpkiML5tKbLnGhuLAqRVpnwvO+NuTSybx6B527wsCig@vger.kernel.org
X-Gm-Message-State: AOJu0YwknOP+Ql05XZ4ZFJ7mn4W7sOBaSPjgFDLixDmGXdDUmwqkKynJ
	HmdnVEFIGUXeGE9nKNVkyg0EeSmAlIg5rszKb95OpjpSBpfvvJk3XkN2n1tq7g8WW7sMF8v2pJB
	5gEzk8MU3x/YxrU/z+FXurGEZ6N/Aj8A=
X-Gm-Gg: ASbGncs3a0bZ+x/Z9n3V9h/WqGzNs5wv7UVV91WYZi+S0xbGtic4Ld52/0BGcq3BQhd
	mCxh7B4lpuI3xlmTYrjC0WBruXpjdSK4ect59vSkM8KFQzKxFBcQhoekpBU7y3gVghmOK7IVe8v
	2e2dJg+RfhUL5y91KMgadXSVducPRGSaao2fElItThnRUfru18ZjNWmgFnrs2CKgmWIOwIY1UWs
	pO713YX5+GMCqIZjWuWFgqxqRg+1BmSC4PPEr2vSXz4AwAHaSE=
X-Google-Smtp-Source: AGHT+IEu9qio4sf+nY+2VNCn7hdbR1T28beFwadrX0mqCszsq8S28vScNVJA04OVTxp/easlutUPryntBuwX/WyqQQs=
X-Received: by 2002:a05:6000:3111:b0:3dd:6101:4efb with SMTP id
 ffacd0b85a97d-3dd61015026mr8949421f8f.11.1757075167278; Fri, 05 Sep 2025
 05:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLn7XVnWmHv1Bfe2@shell.armlinux.org.uk> <CA+V-a8umpEzwO5XnFVNB-TkDtEh9K48OKqaDE_SwzGfXk+9qEA@mail.gmail.com>
 <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
In-Reply-To: <aLoFIoqT2A2RmrfR@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 5 Sep 2025 13:25:41 +0100
X-Gm-Features: Ac12FXz8sW_rykJvGGWdLFiauLq7H7TD8fJdnQu_wpMQYelqr_sg2nzux9BatIs
Message-ID: <CA+V-a8ssRu=1aX3VkgoRQioewU-VRs-xT6Z=Qp-RknuwJ0o2GQ@mail.gmail.com>
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

On Thu, Sep 4, 2025 at 10:31=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Sep 04, 2025 at 10:10:32PM +0100, Lad, Prabhakar wrote:
> > Hi Russell,
> >
> > On Thu, Sep 4, 2025 at 9:49=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Thu, Sep 04, 2025 at 09:39:48PM +0100, Prabhakar wrote:
> > > >       plat_dat->init =3D renesas_gbeth_init;
> > > >       plat_dat->exit =3D renesas_gbeth_exit;
> > > > -     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > > > -                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > > > -                        STMMAC_FLAG_SPH_DISABLE;
> > > > +     plat_dat->flags |=3D gbeth->of_data->stmmac_flags;
> > >
> > > You include the first two flags in your new device. I would like to s=
ee
> > > at least STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP always being set. The only
> > > reason we have the STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is to avoid
> > > changing existing behaviour and causing regressions. New stuff should
> > > always set this.
> > >
> > Me confused, STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is set in the new
> > device [0]. The reason STMMAC_FLAG_SPH_DISABLE flag being dropped in
> > the new device is SPHEN=3D1 in MAC HW feature reg for the new device.
>
> What I'm saying is I'd like to see:
>
>         plat_dat->flags |=3D STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
>                            gbeth->of_data->stmmac_flags;
>
> iow, it is set unconditionally, even if forgotten in a future patch.
>
Ah got you. Thank you for the clarification.

Cheers,
Prabhakar


Return-Path: <linux-renesas-soc+bounces-14163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D57A57A35
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 13:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E29B188F137
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Mar 2025 12:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7351B4139;
	Sat,  8 Mar 2025 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtohmBtI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B2C189B8D;
	Sat,  8 Mar 2025 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741437879; cv=none; b=spbsZRCp/khzNSGDrjT3TXA02V2sNgCVxqDd2i5MlUQLA26ZDN8DFZjyUt8s4XIcpmR6X61Dl0lHBsPjdGExLcd3hbIImNc2mgCdVyBlCbgYphb/Bce5gTGSS1S9uOe/sBRfIT0X1waTTsIHqRb2MAvs1VI11nwvTI39aHnTgKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741437879; c=relaxed/simple;
	bh=oiZsyTEBTkVmd56xryLqtQyTHZrtzcRyjns0FrCyu2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xw2JCnRYJw6y3FDutUgAmprZSDeGNDWg4AvmZyl0MqCLtEzfADi4VINDEQYfmtRqIIuB4P0yty7YsKozNPse1b+tVnivn5/AS0bFFCLfHbMkxO1j2gLwOKG3hrrlSA16bwvgX6yR62af24oQV3pJIr1pdMMybYCyKSpDqHKrFC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtohmBtI; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-523de538206so977057e0c.2;
        Sat, 08 Mar 2025 04:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741437876; x=1742042676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjLgCbeUZ/6GtTJFrbqbT4FRb08XIwkOPOeiOc9bwgw=;
        b=FtohmBtIQW3R1DN9M6WZfS+NLBjX6BE6/R1o997zEz2i2GkQeHtqDnAA5y+WrKRHRL
         l9iBXBx0rgRTgkAn3P+MxuSi+Z0791vgWam3uMjpSakrBPfgXdLftlnQFU08UHvT1vQG
         uT4ofPZpk6+465FdwQTCe+EzBH5OltejqybKI4ZtadLhlv/AQQ80nheVaALfD2k31dQ8
         IbmEOz4VjzgjuoE8yGPavKCHbsZWhcSNGkGcceGe4hkNenQPB+Tw43RbfCPvBnb9Czh6
         7uCUOTp4z/U/AsytKzZOJzJrCeAzdsVV5enLG8cJSUVrspSZYYjBlSH4NJTpzzP8XnYD
         QKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741437876; x=1742042676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjLgCbeUZ/6GtTJFrbqbT4FRb08XIwkOPOeiOc9bwgw=;
        b=JGrUwFSUcQDNFmPeyEq3Kq6aVZugskHE5loya8ejApP8zLQCZHjaxAibtbEZnx2wEn
         aRC6qwOJG1Cffgm1rQe6YOmt2TVrsTfW1QBCfYNIW8A7Os3+FBeC7gw1KyPulzlKvTLU
         ZrePHI8cD9ZP48d6DRmW1e8I+WUcjMGErAq5Hh2y5tegRZTpnh+8kVSOHu+M5t1Qxf/t
         kZZKNkFoDU2iUo0vwuaxPKZt+8g/Q4eu2YNNV587ZqWh6kHgADyLyZndKnMDi8EkNREt
         uIyECaeekB+TW5aJ0gJzB6/Xxeo9MqJRY5lzo0KwEbVcqXnzphwbVVjvYWnZH5MhF/q4
         ehvA==
X-Forwarded-Encrypted: i=1; AJvYcCV9hjT7lzegY3PsvmXlklpZgBAyJmPxYXNwf3FRhPoUQwmZvbek8Asf2yf5aXXqDPFCxcvvN6p/luswYHc1xhdaHkU=@vger.kernel.org, AJvYcCVldglEA+cdrngudeJdaNZFDAPjQ3v2r5ecCy+byjTZE+WaiBWAzkHnulkrl/M2TrRG0iTW04oueOhf@vger.kernel.org, AJvYcCX3wQHjHocBFiDrqTsM0mqRzCYVhb2TNAGwxLFca9FX+kEB5bkmGY9KihXBZrBQf/DSGS0RG+KGOSR8/ufs@vger.kernel.org, AJvYcCX7s2uyW5vIspsbOI9V0I7zPZUzwu/kaRwxWcG0+xrWr76+ErQzcdTluDF9k6aUvT0gSd6ozUm3@vger.kernel.org
X-Gm-Message-State: AOJu0YyerGMeg2IGvZCJ15B2+mHOWYe+mcwCtxRNho6C19VWnRkVgFdU
	rIXgQp5WYU5wIedeGwFdCbFKCyf+y4sFb3/OiZe4xgCktrfj9VoGoWBabHZI4HHdcGOJUmAUtCs
	0w+j8DXAVutn46dS9RFRFQVzbuEc=
X-Gm-Gg: ASbGnct28LFW6FsmpMaK5JS9g9/+Meq8ScPI74VinSOETwG2j68sD0fSklTEo1vXNZR
	NKLvrrH2n414yZQAyCWXoEIWhUJI9oRcvAYh4+hKuiCGzjfDbs3kScsQszGxf+q61HQ/e9ryUnw
	/JhoFIgtSOJug/i2sgc7u7G63TdQ==
X-Google-Smtp-Source: AGHT+IHJoc+bbVexGMHt3VzRWVQSSRDweRZ7P/5FWPHw6sK7R1mQ7CzHweEAnyKr0rBrEq8ztO703tovvpiwIjC/2QU=
X-Received: by 2002:a05:6122:2011:b0:520:3987:ce0b with SMTP id
 71dfb90a1353d-523e3ff3203mr5408627e0c.2.1741437876356; Sat, 08 Mar 2025
 04:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdX-JwWQfU_hOXY5d_YEzGkyEV-VzFYhrCBFhYtTGEOh1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdX-JwWQfU_hOXY5d_YEzGkyEV-VzFYhrCBFhYtTGEOh1Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 8 Mar 2025 12:44:10 +0000
X-Gm-Features: AQ5f1JoumiVlqVTPutgb-pY-THcOabxSW8grlOJS_j7um8pQjQvrody7mR7Pc-U
Message-ID: <CA+V-a8u8KUgv0xOW9Nf=GFVHw8SibsWjx+ZUZ0Vfq5kjdsMAjw@mail.gmail.com>
Subject: Re: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Mar 6, 2025 at 1:11=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Sun, 2 Mar 2025 at 19:18, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Renesas RZ/V2H(P) SoC is equipped with Synopsys DesignWare Ethernet
> > Quality-of-Service IP block version 5.20. This commit adds DWMAC glue
> > layer for the Renesas GBETH found on the RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> A few early comments...
>
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
> >           This selects the Qualcomm ETHQOS glue layer support for the
> >           stmmac device driver.
> >
> > +config DWMAC_RENESAS_GBETH
> > +       tristate "Renesas RZ/V2H(P) GBETH support"
> > +       default ARCH_RENESAS
>
> This auto-enables DWMAC_RENESAS_GBETH when building a kernel for e.g
> RZ/N1D, which uses stmmac with DWMAC_RZN1.  So I'll have to disable
> this explicitly in shmobile_defconfig.  This is not a big issue,
> we already have similar constructs (DRM_RCAR_USE_MIPI_DSI defaults to
> DRM_RCAR_DU, but is not used on R-Car Gen1/2).
>
I added this based on the recent comments received while add WDT
support for RZ/G3E.

> > +       depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> > +       help
> > +         Support for Gigabit Ethernet Interface (GBETH) on Renesas
> > +         RZ/V2H(P) SoCs.
> > +
> > +         This selects the Renesas RZ/V2H(P) Soc specific glue layer su=
pport
> > +         for the stmmac device driver.
> > +
> >  config DWMAC_ROCKCHIP
> >         tristate "Rockchip dwmac support"
> >         default ARCH_ROCKCHIP
>
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
>
> > +static const char *const renesas_gbeth_clks[] __initconst =3D {
>
> WARNING: modpost: vmlinux: section mismatch in reference:
> renesas_gbeth_probe+0x1e0 (section: .text) -> renesas_gbeth_clks
> (section: .init.rodata)
>
> Please drop the __initconst.
>
Ok, I will drop that.

Cheers,
Prabhakar


Return-Path: <linux-renesas-soc+bounces-25217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49BC8B560
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 18:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10E724EF6F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E1133F381;
	Wed, 26 Nov 2025 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kznkas2i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B35312828
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 17:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179061; cv=none; b=jRQcBOJZ0MLsmgpOm9/ol2/rlophm6B1mAQOe40mlIFUpeY4oWVNYt4C+2tOuI916nljICVHxDKmG3dLiH9p9sNZo72zp9ByowpLvOpARFZjxp+YBtv9x7jyre493TQ0bE+xILPlEjBV8cmJw5GS1arZ78YYl+aC65vbN/SFGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179061; c=relaxed/simple;
	bh=DZmAfxsJe8NvUJeI6S9zqA0WF6pPJRkMTm7r9xT3UrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OK0aAKvxxCui8eX5GWAjefilsk2sA6xaMFjzE1Xg5iRr1M7q8wpsmFF43UJoFTiS1l+JnIdxWIVmjSJS9JflETfWYhnnjyNFRxWk93AaPUZSgazVOsonn8DA/8OPysMt4FrOf3Q/A3DWOdh/YwVBGX6YxY5lCqmTAiBLdR0yyrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kznkas2i; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b47f662a0so620411f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 09:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764179057; x=1764783857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJtndxdQkYWzvy6kDqOv7kQqo1yR4d6wvaKa4OAP+Cc=;
        b=kznkas2iAfgrVPA3BtK/rYtQI3tQp/qqnbkmrolnZncAiTLFIy6RJUwKKFL/66vwQo
         bm2qNK/aO4SMGXzMxzUKyPrSJd2xj/R0XfhtM/AaX8yZJ4AmaYCE6sQjBSySj68Dt2lb
         z/xdc3cFXOap2d6X6dVuQvgxbRT59QMUaOlVMz+hxt8DGVWWHhvVnsMcsps69GwglS2E
         wSS1A/+gvNIk2rUt60QEgFEduhhcQqeHx+KXQHcdAsPHFEgNCFHGizRDNw4M60MDlL7G
         eDwcZ3f0OQAA5Z7jAeQyKcRU52AJ+hfCIIzWnPW4EZTMI18vpJrS4q0kkbwx/dHC6+MF
         1pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764179057; x=1764783857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJtndxdQkYWzvy6kDqOv7kQqo1yR4d6wvaKa4OAP+Cc=;
        b=cu+uP21kfrvUlB5P0AEbJCW9hVhX36MZBMks3E5hnYftxsXbM005kXmwe4pWNoYeo/
         IoE8q82Dkb1wSvzO77oIobCD+anjVo4JCWLGkpJOk2FFEGGZezWaFoZTnjwQ2gd0lRF4
         emC/QpRCp17qAThw9MgwkoWKgJ77GbZsyeCr4HujDO9GiWN+R1NtZHHTjBHcBDeCHG8X
         9njm1iWCsV5wZvV/HGcMCrgcwHd5U1Zb1OuVs41RikMKji9rkaMs/iNIjMxXMGV7IB1d
         l7aS9l8/Y/r3hZiKAXqkarji4uAsXuJauhN4LAb9Z+QC37j7S/iu1G9K//B5fstyusZ9
         0H+A==
X-Forwarded-Encrypted: i=1; AJvYcCWdAZXn7Z427n9H7jOrXg5uGxpmyeEZU9CtYExGsMNcQ7l5d0XYtSDTj2ySdm9fMd+4sUnvZwrd/Jd8drOuwmrJxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWf5ijcgX8qyqLIDX9UhugXUPNW5uUC/itFfq40zas3KpacC/
	+P47PYzlcx+krq3ItmDZxCgWNYXKuDxNsGgsS6G/3tag078ndFCaPWPoiBXiwFrvjy5JFgN7cUw
	7KnyZlwaTf4Tjz2waVvphwNZefytQEJg=
X-Gm-Gg: ASbGncsPJEA+E8H9A0ZxcMRpq1LE2WQXjtwF229vE6TBaFG0vy+n7FXCMXqOAXUTYIT
	llgmLJB8ps3ukByslHH9pGQX7UrMP3M8Lf8asUfeT9SsK/neMtUReWugU7pNlIigC+4XAdItdHU
	Z8Rcl4XHGEAMy4AS0dg1il9KLcB78btxfL1nABJubByOck6049++Zwb3om3mhXeo+ORvagsbe9a
	lnbQaVNYYPq+s+Vv47LPxol00ys3kDhCTAxb2mvgChu3xaswNR4KzWWeZyFrvTwSH/DzdrWXsg7
	/I/XpgqZqLco1i3cU93wUEHEB0aPH9xytDQb/7w=
X-Google-Smtp-Source: AGHT+IEMtnBKL8QKEYTLtiH3Qt1JZUzmDtUchvu2N3MeDZa927dTGr16SXLA5t6Vbu7dxUN21qfwG9K9BwkeddOjilM=
X-Received: by 2002:a05:6000:1a8a:b0:42b:47ef:1d59 with SMTP id
 ffacd0b85a97d-42cba63b5b2mr28905036f8f.4.1764179056932; Wed, 26 Nov 2025
 09:44:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251121113553.2955854-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXrkt0MXOBSvpdJwNVmGrnmt03mSGqj7EhqF16tf4i5Pg@mail.gmail.com>
In-Reply-To: <CAMuHMdXrkt0MXOBSvpdJwNVmGrnmt03mSGqj7EhqF16tf4i5Pg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Nov 2025 17:43:50 +0000
X-Gm-Features: AWmQ_bkhH_0PDV6DBVghT_5kUE0J4e1gar5BbggGmW0QWH2FTGmxRKv3h7arj-0
Message-ID: <CA+V-a8vhTH7qAbrJrqRimiBfwD4K08zK0_yOHHjhCjfufGWQaw@mail.gmail.com>
Subject: Re: [PATCH net-next 06/11] net: dsa: rzn1-a5psw: Add support for
 optional timestamp clock
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Nov 24, 2025 at 12:45=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 21 Nov 2025 at 12:36, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
> > driver. Some SoC variants provide a dedicated clock source for
> > timestamping or time synchronization features within the Ethernet
> > switch IP.
> >
> > Request and enable this clock during probe if defined in the device tre=
e.
> > If the clock is not present, the driver continues to operate normally.
> >
> > This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, whe=
re
> > the Ethernet switch includes a timestamp clock input.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
>
> > --- a/drivers/net/dsa/rzn1_a5psw.c
> > +++ b/drivers/net/dsa/rzn1_a5psw.c
> > @@ -1243,6 +1243,13 @@ static int a5psw_probe(struct platform_device *p=
dev)
> >                 goto free_pcs;
> >         }
> >
> > +       a5psw->ts =3D devm_clk_get_optional_enabled(dev, "ts");
> > +       if (IS_ERR(a5psw->ts)) {
> > +               dev_err(dev, "failed get ts clock\n");
>
> I think the error can be -EPROBE_DEFER, so this should use
> dev_err_probe() instead. Same for the existing calls.
>
Agreed. For the existing calls I'll create a separate patch.

> > +               ret =3D PTR_ERR(a5psw->ts);
> > +               goto free_pcs;
> > +       }
> > +
> >         reset =3D devm_reset_control_get_optional_exclusive_deasserted(=
dev, NULL);
> >         if (IS_ERR(reset)) {
> >                 ret =3D PTR_ERR(reset);
>
> > --- a/drivers/net/dsa/rzn1_a5psw.h
> > +++ b/drivers/net/dsa/rzn1_a5psw.h
> > @@ -236,6 +236,7 @@ union lk_data {
> >   * @base: Base address of the switch
> >   * @hclk: hclk_switch clock
> >   * @clk: clk_switch clock
> > + * @ts: Timestamp clock
> >   * @dev: Device associated to the switch
> >   * @mii_bus: MDIO bus struct
> >   * @mdio_freq: MDIO bus frequency requested
> > @@ -251,6 +252,7 @@ struct a5psw {
> >         void __iomem *base;
> >         struct clk *hclk;
> >         struct clk *clk;
> > +       struct clk *ts;
>
> "ts" is only used inside a5psw_probe(), so it can be a local variable.
>
Agreed, I will create a local variable.

Cheers,
Prabhakar

> >         struct device *dev;
> >         struct mii_bus  *mii_bus;
> >         struct phylink_pcs *pcs[A5PSW_PORTS_NUM - 1];
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds


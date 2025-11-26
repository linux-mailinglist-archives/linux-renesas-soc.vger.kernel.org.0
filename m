Return-Path: <linux-renesas-soc+bounces-25146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A277C88775
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 08:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72EE3B007D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 07:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C632C0F9E;
	Wed, 26 Nov 2025 07:43:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A739218821
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 07:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142996; cv=none; b=qRAPBrc9BKHss7xCszcuE0jKP7QInBHHPyxyfTbh/nJlG0uEYI/5Pq0QshDu4pIFFysaP0Gdgibx48LCFY25ApBB5MaPGMGksZe1WNZ3esjhquxHzxtXOiawXLHJTlgrOQBXZVdZCpoq+LPaMxX149xwInLHxT9JiRrl8wtZ0CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142996; c=relaxed/simple;
	bh=bkzwoUtOm01P65u39y77xFFtdrAg9j2KRw6HRKGjyxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+v3zv8ZMo1lpMlXMrHGoNJXizFRiy0r1ATysaoXcQ497WIUJIO5inivImeLYwHpfO4sN4ecwWb+QDBqyms/ZT52Rq5pcGiVk9hzS1SvcPbc8HbptCrNlDsSDh9tiPfZM2yS4gwSrVGB33uf6yJGjtk7sZG4CKjCSNHhbj2CPi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-937268fe284so3435590241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 23:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142994; x=1764747794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTYhQ3G63lU/atNAXCnWcO1/Wz+JDqjFVpYbXLbGHEE=;
        b=sj+6FSurWGUvCHrprgpfWKbAwFVi66Zk195pskRJc0ggzHly+Q5oaFictLfDKRFmlo
         L/+uMVBgVaCqRu9+xb07mjHp8SM3mE04x5eFTYEnqRr1dJ3wigty5aflgf6B56EIgM40
         JV7znGwSmGaBQ9KsSMff2gKc4UFYNSE4BVMeIPmXhTs2Lb1r++K7hz9oPO+L7OiG8yIK
         AbY/U8PPDNQaZ+mxHk0VMzPSt0iYK9KPc0bMRg7DuluXELHVkuAa1drht1ufDdCglZUx
         e+KsJARH8IRkD5F9tw6H4gGz2zc2jreCEFtGvRaEF0EL9eq9igb+j3fuXod9RhxIsmXb
         9aeg==
X-Forwarded-Encrypted: i=1; AJvYcCVIAnWbZMFjZyIXU6P9IWX4eb4dZLwcMHC4dW4Vf+dvEx86/H8lIvXjiWTmub391YclgddOnYJocVJAONnDq+DMjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5JumtKh26wrkP5UPEzz/gmDr6zEgohR4yuq02as64l+sXbA5s
	cPgz5Qi7fRXmzOLLBqRXSgPACpjcxCs6u30N21mlFv7hg/OYlFhI0M3M2RX7GHz/
X-Gm-Gg: ASbGncvI3cZYlLeSNttlNWlupE+ZZnnDiJzfBrTcAAwABKtsrGs0dDC9bL/3m3pDlQE
	X0gOiPz/hOZYYLMVipTO+SRO+Xbs+TJ+KIPos3XjWFs07nDI2pFn5hxM5+DErmdN+wE1zQ6OAJA
	oTPNhNjb+pa/DfTxwj7C7tzLkYG0wq2gu+EEtKpnhglez4KWmj5JbedAKv3J8xzp1QCa8HHLyYD
	bj3j8lbBwJqaDBAvhIQElKNlvFSW5K0ATfLYLD5l6j6YDe25SDi9VxbKBPIYuYHtkFJQ4MmH15M
	cp0zUp4ajEqc6/xG6uGlYH8+on/bGIbnY4xZYq/hDwR3P4DDa5vwcS5BwdHs1n9vekHTHvKEgUh
	KGFWQIr5fIZPfIw7SP7KZP7revVXHSLCrrJGIUbsfYKoemNedBG3FxLvEZEmLZpWRC+PIR/nHfo
	G5UTQwImAUq31XQzcFSDw8ztoyXRVU2enoRf5DBJyYTPL1OFSaSoM8
X-Google-Smtp-Source: AGHT+IG8Y9CVIo2cWD/xO9/0prnBdZ1Xtf0FrfE31wlijoxspV/4I/5snpk9mlNKndLo8UXgz6TfTQ==
X-Received: by 2002:a05:6102:3f10:b0:5db:d2b7:9518 with SMTP id ada2fe7eead31-5e1de423d78mr7529576137.34.1764142993875;
        Tue, 25 Nov 2025 23:43:13 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bd8eb2afsm7449400137.1.2025.11.25.23.43.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 23:43:12 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5dfc3c7de2dso3923267137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 23:43:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjrsuWpGyQa9vxwk3nRs1nwhC5f+x00ZM5xXBVEesoEoGj3ebeFg8olJ5KfZHKtkwR/EziEz5r1oaOo/rv+fkKYg==@vger.kernel.org
X-Received: by 2002:a05:6102:1484:b0:5db:d07c:218e with SMTP id
 ada2fe7eead31-5e1de4a7207mr6895254137.41.1764142991927; Tue, 25 Nov 2025
 23:43:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
 <89b6d61854e94966fc9781d5832b6c187c35b4de.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXBbzTeiQJQWuUnJ_rRD1Zo=1TBOzrv4WbvC7whL1=E9w@mail.gmail.com> <aSXR2iEAKjxM8VOR@tom-desktop>
In-Reply-To: <aSXR2iEAKjxM8VOR@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Nov 2025 08:43:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVYvV8WXBKmQEMnw_qgMdoUDLreNJM3UqEtoZ29AR6NoA@mail.gmail.com>
X-Gm-Features: AWmQ_bninuJBRTizSxZYPmdtY-ViJHt3X5imX5OlC4FiWsDPZsFKFDX1UIJfnDk
Message-ID: <CAMuHMdVYvV8WXBKmQEMnw_qgMdoUDLreNJM3UqEtoZ29AR6NoA@mail.gmail.com>
Subject: Re: [PATCH v4 11/22] phy: renesas: rcar-gen3-usb2: Use mux-state for
 phyrst management
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Tue, 25 Nov 2025 at 16:57, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Tue, Nov 25, 2025 at 03:10:22PM +0100, Geert Uytterhoeven wrote:
> > On Fri, 21 Nov 2025 at 16:14, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Add support for selecting the phyrst mux-state using the Linux mux
> > > subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
> > > initialization and integration with systems utilizing the mux-state device
> > > tree property.
> > >
> > > A temporary wrapper for optional muxes is introduced until native support
> > > is available in the multiplexer subsystem.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > > @@ -938,11 +939,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
> > >         return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
> > >  }
> > >
> > > +/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
> > > +static inline struct mux_state *
> > > +devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> > > +{
> > > +       if (!of_property_present(dev->of_node, "mux-states"))
> > > +               return NULL;
> > > +
> > > +       return devm_mux_state_get(dev, mux_name);
> > > +}
> > > +
> > > +static void rcar_gen3_phy_mux_state_deselect(void *data)
> > > +{
> > > +       mux_state_deselect(data);
> > > +}
> > > +
> > >  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> > >  {
> > >         struct device *dev = &pdev->dev;
> > >         struct rcar_gen3_chan *channel;
> > >         struct phy_provider *provider;
> > > +       struct mux_state *mux_state;
> > >         int ret = 0, i, irq;
> > >
> > >         if (!dev->of_node) {
> > > @@ -1019,6 +1036,23 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> > >                 phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
> > >         }
> > >
> > > +       mux_state = devm_mux_state_get_optional(dev, NULL);
> > > +       if (IS_ERR(mux_state)) {
> > > +               if (PTR_ERR(mux_state) == -EPROBE_DEFER)
> > > +                       return PTR_ERR(mux_state);
> > > +               mux_state = NULL;
> >
> > No need to set mux_state to NULL, as mux_state is not used below.
> >
> > However, shouldn't you propagate all errors up?
> > If the mux is not present, mux_state should already be NULL,
> > i.e. IS_ERR(mux_state) would be false.
> >
> > > +       } else {
> > > +               ret = mux_state_select(mux_state);
> >
> > This causes a crash on R-Car Gen3 and RZ/Five, as mux_state_select()
> > doesn't handle NULL pointers gracefully yet.
> >
> > Adding a check like
> >
> >     -       } else {
> >     +       } else if (mux_state) {
> >
> > fixes the issue.
>
> Thank you for checking this!
>
> Ack :)
> I will switch to:
>
>         mux_state = devm_mux_state_get_optional(dev, NULL);
>         if (IS_ERR(mux_state)) {
>                 return PTR_ERR(mux_state);
>         } else if (mux_state) {

Please no else after return.

>                 ret = mux_state_select(mux_state);
>                 if (ret)
>                         return dev_err_probe(dev, ret, "Failed to select USB mux\n");
>
>                 ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
>                                                mux_state);
>                 if (ret)
>                         return dev_err_probe(dev, ret,
>                                              "Failed to register USB mux state deselect\n");
>         }
>
> In v5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


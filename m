Return-Path: <linux-renesas-soc+bounces-8644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98AA969A47
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 12:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 658E22829C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 10:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3821B984C;
	Tue,  3 Sep 2024 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sovQNizJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BAB1AD259
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359751; cv=none; b=QKgiOUhsaqr4VK+bp31/kRTRUS5u7ICxNbzMQ9ZcSDiKGbLJ97gSqoZKc9crbc+lxIdwyJ1+z+FIw+X6XwOt0YuoDOegGLDYMFSHpUpjZc25hBSikPAMgNJ4j14jUGWvTMsRFx8/q5cuu/vUfZTqjK1tHVQDTPPg5UDtpCEgmNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359751; c=relaxed/simple;
	bh=YmkObPnyVEltJM+bKrCa4h0N/EDBel+3Kr+3oHWQ2A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcJxwK69tMERIFecaLAX8VYKYsMmYCCj5iWnhRopD5MgcJko80B5Y+iUNUmH6g9udC9BpI7ugSeMWGoS2ikJxD5COwEqL6cz04NYrrCVLmBZUgYK9ENhTUxJUKLpCerejt1M4fac5mA9SDDeyHdVF+ZMKualIrouy5h3RT+Eb9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sovQNizJ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e1a7e54b898so3715222276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Sep 2024 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725359749; x=1725964549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wk8IQrj3Ag1NuoIr8ToTqjuTDbNQapkqLJ16Fkg4zcI=;
        b=sovQNizJxr+0yvKgumskp0xKen9pTaJ8GptymK4oIeq42YTMxsgeCYcG7575+Wb6dZ
         UGtifC4UVeFVq4PFMrcDhsPyqPcsj9miMflt60nthF/GkXBRZYUh1AMUOpdcx7sS5D/q
         ow1NJ1nGolKafoGzEHAEou4VfOJOyRcGXZmL1HYsSefkDf+fYYH3MT6aPh1crSZ6y+sV
         S2kuldHCGyJ70u3sz54wPvNFrTeWKFt/k4PxF7Lt5i+OLJSIa24WR2eExCoRbYnaJ58r
         mS3xkcKpz9v4YbNDRQgea9yxhkEvUyOHZPlwRWjDtUXN/+8tj54bFeXz8eNRp/x13Kv3
         4yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725359749; x=1725964549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk8IQrj3Ag1NuoIr8ToTqjuTDbNQapkqLJ16Fkg4zcI=;
        b=iDBGXDbioR3Nc23m/fPCZYIzByGZ5qrGcOaVpejR/IVHOK9hlH2M34l72fgjjstTFm
         dUy3ER5XnpJMQ+WBJW1LcXPRYB48Pm8voGDEgoeABwLkwPWgeCRn7uQwKW39PkEpWKpb
         edKasJ7T80XBNr1bxzXXdoiJ9uwBD6YOsrOHSPsgXoNoX9fkO0/W8FV0+XpOmm8As/8/
         jfBbeDjCX1ol+uR1YIAe9wIqJLHaXDOelRupNPavmhO//fW30jdEP9ek+APolvIKREqi
         r9xzxvlN3iK+fAna/SgJsYd+xfGEzp9Ghp4bU989KLW1VcOUxcupa9YceZdSSyQNH0yH
         qtvA==
X-Forwarded-Encrypted: i=1; AJvYcCUT6A1m8QO8NSU2Uyhj5v/fFLfUKWqxqFRUN6xcXjSvMpnuXws0D3sBR+YET+xN38Racnq7NUvIjsYpQGJMy7mYrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSeOGVs/UQJbDb5wC0F0u/ZdPsXCRnsFuyShD9NdaUmULqqxdF
	8Fmydc6G3rhl3R876pJLXNgpU4PFBUk6EqK9feN/eX4r7Me3l0wvDxBYm66JOXn6eca+R1vKzMD
	/dMwt8YLthPKcwu05pBzMmRH5Jj//CAcl/tNiRg==
X-Google-Smtp-Source: AGHT+IEptjQ9HnzO7IsNO1D9S4qr5WM4xYdZM3VIT60UnRxgn+glo0EzcUHzkrVnacRkJvKM+kyKu9xW5IsYaduxCjQ=
X-Received: by 2002:a05:6902:120d:b0:e16:55cc:215c with SMTP id
 3f1490d57ef6-e1a79fe3948mr17521678276.6.1725359748806; Tue, 03 Sep 2024
 03:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com>
 <99bef301-9f6c-4797-b47e-c83e56dfbda9@tuxon.dev> <CAPDyKFrVS2vpsJqTvjKCJ7ADqXc4D4k2eeCBsaK4T+=pXDnKUA@mail.gmail.com>
 <fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev> <CAPDyKFrkkASq7rfRN=9sEet-p8T8t+f__PdnSNRN3bMNipnNNw@mail.gmail.com>
In-Reply-To: <CAPDyKFrkkASq7rfRN=9sEet-p8T8t+f__PdnSNRN3bMNipnNNw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Sep 2024 12:35:12 +0200
Message-ID: <CAPDyKFpLnREr4C=wZ7o8Lb-CZbQa4Nr2VTuYdZHZ26Rcb1Masg@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, mturquette@baylibre.com, 
	sboyd@kernel.org, yoshihiro.shimoda.uh@renesas.com, 
	biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Aug 2024 at 12:32, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> [...]
>
> > >
> > > If not, there are two other options that can be considered I think.
> > > *) Using the genpd on/off notifiers, to really allow the consumer
> > > driver of the reset-control to know when the PM domain gets turned
> > > on/off.
> > > **) Move the entire reset handling into the PM domain provider, as it
> > > obviously knows when the domain is getting turned on/off.
> >
> > This option is what I've explored, tested on my side.
> >
> > I explored it in 2 ways:
> >
> > 1/ SYSC modeled as an individual PM domain provider (this is more
> >    appropriate to how HW manual described the hardware) with this the PHY
> >    reset DT node would have to get 2 PM domains handlers (one for the
> >    current PM domain provider and the other one for SYSC):
> >
> > +               phyrst: usbphy-ctrl@11e00000 {
> > +                       compatible = "renesas,r9a08g045-usbphy-ctrl";
> > +                       reg = <0 0x11e00000 0 0x10000>;
> > +                       clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>;
> > +                       resets = <&cpg R9A08G045_USB_PRESETN>;
> > +                       power-domain-names = "cpg", "sysc";
> > +                       power-domains = <&cpg R9A08G045_PD_USB_PHY>, <&sysc
> > R9A08G045_SYSC_PD_USB>;
> > +                       #reset-cells = <1>;
> > +                       status = "disabled";
> > +
> > +                       usb0_vbus_otg: regulator-vbus {
> > +                               regulator-name = "vbus";
> > +                       };
> > +               };
> > +
>
> According to what you have described earlier/above, modelling the SYSC
> as a PM domain provider seems like a better description of the HW to
> me. Although, as I said earlier, if you prefer the reset approach, I
> would not object to that.

Following the discussion I believe I should take this back. If I
understand correctly, SYSC signal seems best to be modelled as a
reset.

 Although, it looks like the USB PM domain provider should rather be
the consumer of that reset, instead of having the reset being consumed
by the consumers of the USB PM domain.

Did that make sense?

[...]

Kind regards
Uffe


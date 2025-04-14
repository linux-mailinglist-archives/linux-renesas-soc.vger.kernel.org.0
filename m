Return-Path: <linux-renesas-soc+bounces-15944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0B1A88A47
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 19:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2805717C2D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7E0261575;
	Mon, 14 Apr 2025 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeawCdJR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC019F416;
	Mon, 14 Apr 2025 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652821; cv=none; b=LRayiuqQi4GjEDs6XxdclY4FGdxgDbyzhWr+rLP+lfhsFt+ynvn5kI82rjJocF3d1GIa6fxDHI+pyemHbkaPkxR8wUVmxBpKfE5qEClf1BkuD/6mVUvMu5XfvS7AprZlRko+ANFZa+8rl6d55MD1M4sz5Jok3Mz3aheY0AIBC9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652821; c=relaxed/simple;
	bh=1Zv8lTmcI/PFiiojhYLcEn53jAUhNU90QYC3xNWV2mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9nlh2AbU4dT/aj3SbGMvnz0aZB/N0eRbCBXMdTIPJoT34PgY7UmyrnWgZsvY+fyPR26KZAZsQQ4KE9Fzc1YZAETKzj60kr2/LT1lXp6gfzxpZE7DSIanv4X1G7JtRc30QA+ir7VdOvbBZK5Dm8PIHEDzVdS4DhaNS6Mkr5Lbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeawCdJR; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5262475372eso1989649e0c.2;
        Mon, 14 Apr 2025 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744652819; x=1745257619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mnOCYFSjWFOoLwt3RQzlywXL3wyhVGlM01HXZ4BM00=;
        b=BeawCdJRArepCrSRFG1uaVMsadZgNDqAh1vtavMEdYcpstpxFvae1MB3Nx7i6FmuT1
         bMaTm9uBtqwl9u70cK4ua9Z80FtWumsXTq+VHyGg3lOvCwNr6Mhp5M5UUCxcqAkFYdaT
         a4qOYiUipdUHej3aEdJQcIqCp4L79AIKNe++IyujdJebeFliZcZ6kSkB20XocMXqrqlG
         uYVhxFohXvXdwqqOXUBGEJ55yzSmz5dUO/JK69lKqXEt/EkMIOmhEZVvOpJXsVVIMItl
         MnFt9hIw3lidsJKRmmodsG+7qqOu+8U4smuyNQklLbmDDD8kQtzU57mWsiRN98Hm4sDg
         JOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744652819; x=1745257619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mnOCYFSjWFOoLwt3RQzlywXL3wyhVGlM01HXZ4BM00=;
        b=rWuqJBTcODBxSc8DESzj4794aRO0W+jFfWnx/khS0Gim2eNYsw20W3LYyaF+dlgEbQ
         RW6dHsk+1ak+FacwOMHnm0tVOmDW6UnjqXd2SJ0V5nixtAtHzdAtvrCayQSATSAkBRhm
         +gaQruGBd8Cdk54/PSjgM2ToyvNqHboLRTOGVjAITu314eHZKzgSjE2Jq5501ySGPDNL
         NRn7FQglRUL9xFy9Pzmvm6FiMdvk71RUaUTKcNvyQCQ5mM8BwA3IfmXQZAabXS7/QfP1
         ULNNO4igqflxS2Bps8K3o1UzmpFOyBQDwM/qgLOqVpW9H3PdVpzsh2ifsPc9E3p1TBvX
         LgrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUla2B1P9vZIWvixVa6u5uiDd+Y1PvolFCfIk9DqjVzCHBRVTmIFYXd4w9LZ+y/TwcQzBRD0DMRX3sf8pML@vger.kernel.org, AJvYcCVFi6MRlA/Ze3MaxcC+IG21ANAunoMc1etDJR1gmR4OYIf7faKofVFGSdCMy/erUoSlL+7nfK8c48aN@vger.kernel.org, AJvYcCWy03jGesHx5lKAZ92Dz27GRcswBkoU1VeIQiSneI48GITVsaX3t77n2cGWGjaZoBnPhBjnVWhUx6GN1GxZvISg2nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfTbfbimNIJRhIHwKuHjlNbjFPoqvI5KdOfgp5hAK9aSLGGNcj
	aN5rrv+XAuklEKSaTFa+yMfzfEJb24Z0yU5/iHzjFq504iD9XPEUzsp89G2tMyO/ToPZa8z5Uel
	UioQj0hn2appXs1wvNJzFMKT+6ig=
X-Gm-Gg: ASbGncv4PGyYQO3qsT2UeFI4xyxl1qBhVJE//+b2tpfzAhE2NCM8XkvlHG0eGs+pb3x
	KlOID4hJwxUaaba6T89gVK5W1FAqawexVUxedwBJM0INQf0ESNMZhOpRyE+pL4QskK4An37/mEN
	AdzszPNlAVd3NktUt6ek3D3hBuTOqNk5OPHEwUz2WoWQYIGpFx1lydPA==
X-Google-Smtp-Source: AGHT+IHG+me+Cap139G7KRdec+4aFe6GDDoeldpdn6aC6YTRk3PACqIlElTLgCQ91Nr/5vmRgW/fw2fjaajOvUpED2Q=
X-Received: by 2002:a05:6122:2521:b0:526:1dde:3613 with SMTP id
 71dfb90a1353d-527c32bb4d3mr7714686e0c.0.1744652818891; Mon, 14 Apr 2025
 10:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <9c32c9aa-3895-4969-8a33-059c4ad93143@oracle.com> <TYCPR01MB1209398B324FDB1691D80545FC2B32@TYCPR01MB12093.jpnprd01.prod.outlook.com>
 <d71cea86-034c-4448-92de-217ea9d1d018@oracle.com>
In-Reply-To: <d71cea86-034c-4448-92de-217ea9d1d018@oracle.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 18:46:33 +0100
X-Gm-Features: ATxdqUHW-vVe9VFrhj0vHaDmswgScuhI_hHpx6AYlPoesNf-zZb2WZLb4ffhwwY
Message-ID: <CA+V-a8tJoBPBBQ+66m1P3fxJfFXsFg0fWajCoG0GOQRwEapqAg@mail.gmail.com>
Subject: Re: RE: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for
 Renesas RZ/V2H(P)
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ALOK,

On Mon, Apr 14, 2025 at 5:51=E2=80=AFPM ALOK TIWARI <alok.a.tiwari@oracle.c=
om> wrote:
>
> Hi Fabrizio,
>
> On 14-04-2025 21:13, Fabrizio Castro wrote:
> > Hi Alok,
> >
> > Thanks for your email.
> >
> >> From: ALOK TIWARI <alok.a.tiwari@oracle.com>
> >> Sent: 14 April 2025 14:46
> >> Subject: Re: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for R=
enesas RZ/V2H(P)
> >>
> >>
> >>> +static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rc=
dev,
> >>> +                                unsigned long id)
> >>> +{
> >>> +   struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_p=
riv(rcdev);
> >>> +   struct device *dev =3D priv->dev;
> >>> +   int ret;
> >>> +
> >>> +   ret =3D pm_runtime_resume_and_get(dev);
> >>> +   if (ret) {
> >>
> >> nit: it will good if we check similar to reset-rzg2l-usbphy-ctrl.c
> >> pm_runtime_resume_and_get -> 0 on success, or a negative error code
> >> otherwise.
> >> 1 =E2=86=92 if the device was resumed and incremented usage count
> >> 0 =E2=86=92 if the device was already active or successfully resumed
> >> if (ret < 0)
> >
> > No.
> >
> > As you can see from:
> > https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/mast=
er/include/linux/pm_runtime.h*L444__;Iw!!ACWV5N9M2RV99hQ!Ly8gpEBQHhYXOeCcKQ=
avVHfM1XUSy1IubKnHjuQAgvfkK0jrMXc0ebBcvFRvNDcpaJwoUOk1JLLuzih2fLd7JReyapWOo=
uY$
> >
> > pm_runtime_resume_and_get returns a negative error code or 0 (when
> > successful).
> >
> > The same explanation applies to your other comments.
> >
>
> Thanks to you for the explanation.
> I got you point.
>
> so We are keeping different styles of error checks:
> In reset-rzv2h-usb2phy.c, we check using if (error),
> Whereas in reset-rzg2l-usbphy-ctrl.c, we use if (error < 0)."
> https://github.com/torvalds/linux/blob/master/drivers/reset/reset-rzg2l-u=
sbphy-ctrl.c#L148
>
Thanks for pointing that out. I'll update reset-rzg2l-usbphy-ctrl.c to
use the same style of error checks for consistency.

Cheers,
Prabhakar


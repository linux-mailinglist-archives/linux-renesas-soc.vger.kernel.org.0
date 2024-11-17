Return-Path: <linux-renesas-soc+bounces-10562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF669D06EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2024 00:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C659BB21481
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 23:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BE01DDC02;
	Sun, 17 Nov 2024 23:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhzEg9ak"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6A11D89E5;
	Sun, 17 Nov 2024 23:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884887; cv=none; b=ZXVok24hhifN/k28bKqX9Ae9eVUGLBWPjQ/4ScFAApFN30fNphW2t4tt0a9K9C+ycY2soFFbPvXIJSzrWttRs8+RSx8SSIze/AiZxD+3jnleSH+3dUAyWMHV3hh8MQWEWsX0O9XX5CdTK+RySvTqWa8D+phQR7XREb0p91so1T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884887; c=relaxed/simple;
	bh=1X/8HfLV4Pk7UniYVWhK6RRymNOkD/WLoHIafDrtilk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVHtnNnnb5pk/Wd6RvwNIFqsZ9yveQjTRnWuR60qvtTusu+gTaNDln32yaM7KA/rVBwzOEfk3Jb7EfLi1j8BK5wzALMqa6ZKM9KxONAk126sjbTp+4GJ06LiGWdKsThFbMnZ0j4fzRWl2CT7b1DkK7feXmoY5+gw4xRb9+fbhcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhzEg9ak; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea339a41f1so20072027b3.2;
        Sun, 17 Nov 2024 15:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731884884; x=1732489684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEZyWH2yk1juDD0j0bMycJzhP5/ewJCEwodH/GfxYu0=;
        b=HhzEg9ak8OhWWTJCbQuuxW7yzWSeTQA539HOhPWpEF4mk5OyiW6Py6yZwrAGwe8w/s
         8YLg0iL3+Ft2RMAzi07F/eek+b0jyngWSAsvksrd6HU64Dsl6h+s05J9E7+RdmnHghAt
         MrsLkj3fe3e9cN8PfGrwECRPMCoeHB5VUZbeFalx05w+juf0nm2Clzkd6dPaN2+9vwyu
         kUA3WVzaLafMflH2kfGIyq2l7feV9EVVZGN4ygWKlmKDSFLdR9GMqpxpu/T1v34jYTYa
         SXzoHmASkeX9ZBQMVWZOdjZ46c2mCJf4ucQtfKHiT0A2HUUmBHSJsaUtxTkO4089pw/g
         3nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731884884; x=1732489684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEZyWH2yk1juDD0j0bMycJzhP5/ewJCEwodH/GfxYu0=;
        b=XpTvIazocujw/wnV070RxQszQGhM76RB/Q0HgZO9ilAzWgwm+suhPprj09DFr19pTN
         mF15b4x4BSwXUYKz2nf64jpVL3j4oUvGoon/runqXkdYD8qVlX/lAnolRMaWHCCVlZ6P
         uAO9aLGR83/aOs2IY7ME8aO1evIDc1tIHdveoG4hxx6VwXowuaLD5yKBwNdP7FiGCetT
         3yLjSsQz9SHjse/RmKJjB+LBXcYue4nx25gtAEbCVQy88CQPzIt+70G5pIVIYjx81XXC
         bzQ+KxZGtkG/AOsP5GaLqpnRQ+1gOcFXE88vZ67nX/MFJ+Pj1zm2kMbPGgg/Jb3x4LM6
         Jfqg==
X-Forwarded-Encrypted: i=1; AJvYcCUfP2bmrFRTf+oVa4tQ/gcmeGryPZVsaSRVmJIwnhWLnKNms6qUg8/WeoeippQaBuQBsFRbBxI4fcUm5TY=@vger.kernel.org, AJvYcCWOCReeK+nsAwUzkFlkC5NJXvds6g2RIe76ZaToeDPbSk5KIYJCgA/Z72muM8psfMTJsUSgZ+lpP/ZjDZPt2ujD5TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIVKtS2f9U1mK05G/IAkVg/NCZyOpE2ahINLOM/8qiPi9CwWXd
	KRcfIAcKW5iRrOjpAKpqVh+JN/uQLYw+yNLetlCozhEn1i1KSy9WJFF/AaseLdcnbO21zKVr+IY
	aQGotDcqhv4Z4OmYhQfvUjxKBli4=
X-Google-Smtp-Source: AGHT+IHDy73B3Eu2odcBEz4FMGMBOLQSAs2ZC8I2RAiMOO8YuCHjJGZQlXeuZPTyuNA9Gg1xDRkSzM+BpdoUgb1b1Kk=
X-Received: by 2002:a05:690c:7246:b0:6e3:34b9:960a with SMTP id
 00721157ae682-6ee55b7e645mr89326377b3.17.1731884884631; Sun, 17 Nov 2024
 15:08:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241117212711.13612-1-rosenp@gmail.com> <20241117223850.GK5315@ragnatech.se>
In-Reply-To: <20241117223850.GK5315@ragnatech.se>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 17 Nov 2024 15:07:53 -0800
Message-ID: <CAKxU2N_VMSEo30u-C1VK4+jBSUBTo6QT1vgd14RQSS=P+g9w+w@mail.gmail.com>
Subject: Re: [PATCHv3 net-next] net: modernize ioremap in probe
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: netdev@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 17, 2024 at 2:38=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hello Rosen,
>
> Thanks for your work.
>
> On 2024-11-17 13:27:11 -0800, Rosen Penev wrote:
>
> > diff --git a/drivers/net/ethernet/renesas/rtsn.c
> > b/drivers/net/ethernet/renesas/rtsn.c
> > index 6b3f7fca8d15..bfe08facc707 100644
> > --- a/drivers/net/ethernet/renesas/rtsn.c
> > +++ b/drivers/net/ethernet/renesas/rtsn.c
> > @@ -1297,14 +1297,8 @@ static int rtsn_probe(struct platform_device *pd=
ev)
> >       ndev->netdev_ops =3D &rtsn_netdev_ops;
> >       ndev->ethtool_ops =3D &rtsn_ethtool_ops;
> >
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp"=
);
> > -     if (!res) {
> > -             dev_err(&pdev->dev, "Can't find gptp resource\n");
> > -             ret =3D -EINVAL;
> > -             goto error_free;
> > -     }
> > -
> > -     priv->ptp_priv->addr =3D devm_ioremap_resource(&pdev->dev, res);
> > +     priv->ptp_priv->addr =3D
> > +             devm_platform_ioremap_resource_byname(pdev, "gptp");
> >       if (IS_ERR(priv->ptp_priv->addr)) {
> >               ret =3D PTR_ERR(priv->ptp_priv->addr);
> >               goto error_free;
>
> You have a similar construct using platform_get_resource_byname() a few
> lines above this one. Please convert both uses, or none, mixing them is
> just confusing IMHO.
that cannot be converted.

devm_platform_ioremap_resource_byname has no res parameter, which is a
problem as there's this lovely line below it.

ndev->base_addr =3D res->start;
>
> --
> Kind Regards,
> Niklas S=C3=B6derlund


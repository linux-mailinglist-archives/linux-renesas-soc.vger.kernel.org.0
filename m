Return-Path: <linux-renesas-soc+bounces-10931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4619E4B92
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 02:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB53F188153D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 01:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7715E2F85C;
	Thu,  5 Dec 2024 01:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aS1YfdXB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD4C16415;
	Thu,  5 Dec 2024 01:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733360783; cv=none; b=nwwPr+w/JfCS4Aqh6Jax/0olqT19SoRIw/EImOBqBIjkahqEtUhbLBOe/GBPEjNJvzw/Ciex+ZyFAG2JF2kaShn+FIwu1FiDiyWom5sxZnSGlx3xZimbJm3NC5ff20GpNdELIS47ei4b7P3oSr/pIOvUMd8pdN5qkAVdpB9Y40M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733360783; c=relaxed/simple;
	bh=QKqR2ZVRmaHoDLx2netLJSiB+3gpaG9hpVtBTEEBqdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TnlsSYn6J4O+prjMHmogGe5ucvYpt1wM/BGF1Lp9ItV4rPaxbJfNkCFYywuxY/cZxHpTzMFWLJsMKX1+Dw2+rjz1fgb9qPef43i+tnHvDDWEXHsoxN6+Qxo0H/P8lHXywf+34yf7ky3Bfy7YKyZJvDOGCcNLcA5XBHQtxR7mcqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aS1YfdXB; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e39f43344c5so584407276.1;
        Wed, 04 Dec 2024 17:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733360780; x=1733965580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNaROx006A92BJIFhAC3avoJJJdYbGXKC07Oc5xhq/Q=;
        b=aS1YfdXBTeiAs8d3uolqou9PljHLUi1jKbErBJU5znpxhCZrTV/8nB46FDfwwz0QpV
         jBRgyq1dRQ4iUjAfynpAtux/kD+C+aBhTBYs7IX01gda+nR2urpIDpuGbtFI9vTOjmk6
         G3rIdJ65C9voocGVV357zHoppMKuWbbP/dL626b2B93sYZ7Mwq0a4e7+FJgT+0nnNlYy
         iZHtWgnPy2+/PutCfCEnGtDXwtTdNQ7eRktRnKtzbhoNe+wCxcGZ9MABIP5l39ujS2Lz
         mWUOOl9eyDCUARCS//QmYW4MJC3Fo8zPo+MlDRRMVe5OMva/MIRy90FzYmrETnlS83M8
         jRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733360780; x=1733965580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNaROx006A92BJIFhAC3avoJJJdYbGXKC07Oc5xhq/Q=;
        b=TQ5g8l0c3w+cZ8HDBY7fw3231aFSKtv/Oza4a2tbrwg/Ztg0Xt32FW/43Wzd7eTrkR
         3KsKDm/9Vo6/Ra9cmTYUduUY6FlQfIWusrhc/0t4FO9pp9lrsvdGjB/TC5oZmg2zt/Al
         wZ15Ryw6Roj3D11jn3Vhlk1gpuqxUXl5NCVQhMcUgMqbDq5dII/mxdg96U0QDTUGgUcE
         VvZLqsQk9q359i00NcQFTyVT3dCLqq5W4cIGy8Z7N8zLCD8uH9+G8O/J5tGjsekovPTi
         bdxPjD5TUPCOGiAmyltugFVvRA8bgg0ELzCpLXWUTNu7/kfndrvCRM4dZGmvQHOJbEWZ
         OTpA==
X-Forwarded-Encrypted: i=1; AJvYcCVw5CILTLNebkEaAId585R2eIcFsL7DnLAA5TuCS+W8Gms/hNWlpbOjcV+4t1ajHj2hI35T3w7LX/k0Na7UBJq2H/k=@vger.kernel.org, AJvYcCWQ8z/+A6Dz/4Cn2VpKp28EFh6/2exzDYX+/LzzLPv3ADeHWpu5iIMnZxiuR6QVRI235jszA7Vkb6yaMSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTwgfUoMMtUWB72kiCYdZsYefWZvWn7Nm8wd3Ogg86Xcez2oiU
	QLjly7F/tGc+BJEehfGfLPCxWpgTOk19DVE4zVxXrXOV0DpAwKDIwWZXDj+yICWRMBdYSTjBKOk
	UxNz2TiUOzeNN4aYD6OEphLd2P+s=
X-Gm-Gg: ASbGnctIJ3UOHnYBccq1BfVccZCPnnwo5sXlzHvU8mGhhDdplEiiKVjkRIG+VFjupa0
	Ro9yPUJF/u9eF24VRXzLgSyXw+S2K0Q==
X-Google-Smtp-Source: AGHT+IER+Xi4ZisxufHbQx8cuMyXEouv70C6SIaLOg/n7VBOcw+yR5wvDbJJeAr7BXkvfySexaX38rdEEG0QNP1YDwA=
X-Received: by 2002:a05:690c:6486:b0:6ef:4cb2:8b4c with SMTP id
 00721157ae682-6efad1bc2cemr106996637b3.23.1733360780634; Wed, 04 Dec 2024
 17:06:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203222750.153272-1-rosenp@gmail.com> <Z0-LgWETqKZe2uyV@shell.armlinux.org.uk>
In-Reply-To: <Z0-LgWETqKZe2uyV@shell.armlinux.org.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 4 Dec 2024 17:06:09 -0800
Message-ID: <CAKxU2N_x+DaoSZykT--94qphbXgLTU=QHSEQ0FO7VH2oPN=kmQ@mail.gmail.com>
Subject: Re: [PATCHv4 net-next] net: modernize ioremap in probe
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Richard Cochran <richardcochran@gmail.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 2:51=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Dec 03, 2024 at 02:27:50PM -0800, Rosen Penev wrote:
> > resource aquisition and ioremap can be performed in one step.
> ...
> > diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/=
net/ethernet/marvell/mvpp2/mvpp2_main.c
> > index 571631a30320..af9291574931 100644
> > --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> > +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
> > @@ -7425,21 +7425,16 @@ static int mvpp2_init(struct platform_device *p=
dev, struct mvpp2 *priv)
> >  static int mvpp2_get_sram(struct platform_device *pdev,
> >                         struct mvpp2 *priv)
> >  {
> > -     struct resource *res;
> >       void __iomem *base;
> >
> > -     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
> > -     if (!res) {
> > +     base =3D devm_platform_ioremap_resource(pdev, 2);
> > +     if (IS_ERR(base)) {
> >               if (has_acpi_companion(&pdev->dev))
> >                       dev_warn(&pdev->dev, "ACPI is too old, Flow contr=
ol not supported\n");
> >               else
> >                       dev_warn(&pdev->dev, "DT is too old, Flow control=
 not supported\n");
> > -             return 0;
> > -     }
> > -
> > -     base =3D devm_ioremap_resource(&pdev->dev, res);
> > -     if (IS_ERR(base))
> >               return PTR_ERR(base);
> > +     }
>
> This is not equivalent. This means if ioremap() fails inside
> devm_platform_ioremap_resource(), we end up printing a message that
> blames the firmware, which is wrong.
>
> It also changes a "resource missing, proceed anyway" situation into
> a failure situation.
>
> Please drop this change, "cleaning" this up is introducing bugs.
Will do in v5.
>
> Thanks.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


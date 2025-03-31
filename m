Return-Path: <linux-renesas-soc+bounces-15194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2F2A76ABF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0501616D85A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E84221566;
	Mon, 31 Mar 2025 15:18:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C22421576C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434305; cv=none; b=tvY+PfwUpMDE9HqkdqP5QKz6G38Gu67Xm8iX8PnO9J7q3LmJEew4nim60RvgNqQlUXjS1kS8BZsWnKddRh2J4zz24XvXNWoEyv3NdzKv/0IMkZ/zL08HsKJLUbMpxCaTB58ZPiXqA6+HgS7KxpYZKMVJRCCT5xBtxRC3GzDy460=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434305; c=relaxed/simple;
	bh=BfMSbS7EP2gycnxkeAjXPBIlgYkvUY0Qk+/MDOq6OdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJoD8+Ret59dQVwt7du5HCMOFC8blFBHteWNl1QwkBB8Q8oYU6qgRDCTgNzTu4RRv6FhrmSfGPU+hYFUvxAup/hRrcOPXVYx/QDxDO1s7mFUUGbx4xHnnPg8GMnPESWuyTI7XSyD/ZR3QSkGVl6nrs7PT+pfDVzB07j0cjjC1c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86b31db3c3bso1885406241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434302; x=1744039102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEiqezeX890b+tGm5W4aY2AkCqMumv/WTIFIkxrBb6k=;
        b=oLH8yQorVWuLl5OpYKmBIHHCHH8sHQMrEDhy5DnQOS8V4Yd/KlXmscpxArFiOGrq18
         5zBBws5v6LygHk0NcRuPSjw+GSRSWPlXyc0CJnASwE05tqNhEWja8ZIUsgKu1HaUmfsU
         crLD2GMrbJEo+Z7fA+jt+T0c8FqciMYsQgSQVKKL9x0xfumUWeSu60uKq+5OzZj6m0F7
         W+ajwKH8mFNF2PeexlZX6Z12CAhmqSp8a+Z13SCGbSnhIR0GDcipn8ZRG2/FWzDfheDb
         XfZU1RpYIbXS/7bxr1aEvhdwpOsVd+fcd1Oiawj1HKzhMSeOLf4wcFr5Ktd7AVJ1W72Z
         20+w==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZPrulM0HOant6OzHS1kbo57TJoHqofST6IcYzMal+COAkMNIACspG1UhVYVJ6c/Gy/vjG11v/mtylmX4xPYLJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ZRa9Yeh9zWXOWDjySGfowBpf67uWGw9yQ/3yjxFv1GEWnYK+
	dAHTAe3DZxv745YCrQ+69gjeb7GVR4HXmn5DAkbtb5NNjH28g/Li+p08el4e
X-Gm-Gg: ASbGncuHs5pqJ8L/L2+s8uV7QV7kXNxP7ngQkWydjLd6mZdHaRT9pbEBhj3cn2cIPJo
	8aAlbvTcwlHHFgGlqlXfp0PoFo6tcw4zYPRQ7B2ZLJKsI1JeK24zPCFpd/i1L/hIdYDmUcMvc+Z
	Db2rH29jNdpV4ctzYx9zRZbm45X8Z/1kv3gBJKJgdMxsjoQeOHQ8VdrvORUmrFt2bLbiTO5TYTC
	HPKmDzKa+0Pa2GkiaMZKcfInAh8ZxgaKmEbcBA4IdP5o6bl/NpuvANa/CvUrX9E2S7trlL67FCY
	KEdq/NQd/ldnupkXJ7sVCU2GvMB7qYDEyd34B0pW8EGs1QxntzlnkOL+KIeeW6xR2IAlqe4+tO4
	UcrQDfDo=
X-Google-Smtp-Source: AGHT+IEs3Wq+Bd2lnUCWvSWKoZXo/Dj3OxRPEMMEi9GtdlvsROgOl/ZH/SZCz9+MhnyT2e1ZC9tZWA==
X-Received: by 2002:a05:6102:304c:b0:4ba:974c:891e with SMTP id ada2fe7eead31-4c6d3960ce5mr5735217137.17.1743434301614;
        Mon, 31 Mar 2025 08:18:21 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c6bfc84381sm1656155137.6.2025.03.31.08.18.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:18:21 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso1684610241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:18:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXl8yXw9npamgtIa0Lz7uBovliRFcTi9/aIKGVu04UKm6oNdSl9+OdJLReWcWR+Yy66PSdcsd0I7GtO0EtIE0jWJQ==@vger.kernel.org
X-Received: by 2002:a05:6102:41aa:b0:4c1:9159:859c with SMTP id
 ada2fe7eead31-4c6d38970c3mr5625379137.15.1743434301203; Mon, 31 Mar 2025
 08:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <TYCPR01MB11332B9F7292BEFFA29547F2586A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332B9F7292BEFFA29547F2586A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 17:18:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyb=iKoRBicAf4J8a3Zk=ciRNTtB_+k60xjciReMuv5Q@mail.gmail.com>
X-Gm-Features: AQ5f1JqA8wqwwzl2_0lipggTwtk93R-uuZk6ApIwn9b4h-Ql1YYlamNvFdmlvG4
Message-ID: <CAMuHMdXyb=iKoRBicAf4J8a3Zk=ciRNTtB_+k60xjciReMuv5Q@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 28 Mar 2025 at 08:15, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> > Adding default y if ARCH_RENESAS to the relevant configurations removes the need to manually enable
> > individual SoCs in defconfig files.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> Can we add this changes to newer devices for eg:RZ/T2H, RZ/V2N?
>
> So that previous devices, they don't need to patch this file:
>
> 1) If they want to do a standalone build for Image size optimization,
>  just remove the unwanted SoCs from defconfig.
>
> 2) Debug some issues, some people just use defconfig from
>    different kernel version to try it out.

While defconfig files need an update, config files do not:
running "make oldconfig" does not enable support for extra SoCs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


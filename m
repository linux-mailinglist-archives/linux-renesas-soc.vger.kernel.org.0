Return-Path: <linux-renesas-soc+bounces-20817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC9B2EF23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371751C22226
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 07:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C647327C162;
	Thu, 21 Aug 2025 07:12:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11561EA7D2;
	Thu, 21 Aug 2025 07:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760365; cv=none; b=FzuuAXR7LSNK69l1BQpJ6l057OJGwqi075THuLtn6VZ039S1y343yw2wPA7KBo2aqHPXgSC1mXH0s3+u6XAIxrYJeWwyMVsHFTeeZB6YtRMHM7KuVgEPno7ikucUQI08s1HxBLQokRdxAB29zVV75PFEjjy1hyBfgSJgtLDWf2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760365; c=relaxed/simple;
	bh=I0BZ/WEff0RkimR1T0MhwO0o6umktB6ZMOOp9QGaa7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaOkjI2EWhycWwBiWIpPgJy5Y+cIWWUh+yVu2sNY8ciAQTRdLCZ9PD8Sc7SPKX7QWlqbZKnQqx0zmujSPGNrY9iHDhfywmz/3QriCGUDpRQ0j5lip2bNd6lR+4ikQAgQcKjfgHoR6v2ZjUpmTbkt83wkYkjkf8SnDZTyyZ8mQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-89021b256d1so160841241.1;
        Thu, 21 Aug 2025 00:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760363; x=1756365163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+XyJvS29M9jObsU5Dm5+mqIU3v/ZCQA9ib8OZRdEvw=;
        b=cRcPhi7tY/sCl58rZ7c42DeUF1PjnAJl5ejur83oKiX11DCmNMrgne5ZAR6XT2y3nX
         Rqa8OzTQYr8/ey8D0RFLdobKusMxJJe3nPW5IurUxlc6CT9ynHmCAdm90lsEho7QOk02
         drNSPvJJpyF6ANAjBVV4dggIaWt5cEZN+oVYF+hUJzO7IKFDworf03JCinnUM7aHHZmp
         SGkEwZRF19E/DceoYgzQfinyaJR+HfXk2M2sHG3EiVjsn9j1bW6HhrCCDDnymhIFk8xs
         i3DIjPlCWZMe3P93TFzfWoIKup0Hl+rdtZRjvqhebFJ4y6lJ6baJt6tfji+9H8i9+Yt1
         GeoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfEbO9qwBoudTtWqG3e9KugHChYp+V7NqTQsi7Si0nUc9lQnkhfQ5ZdBoeFmxDWrnIE/u5Nkt0FIo+HH8=@vger.kernel.org, AJvYcCVjKU8dRveVNzTayWZu9h4lHibyLx9/8WATpESapVHbn4tYJ7g87L6pFTG/bzj85cX/OMRC/t2yKndGcKUHTAC6duY=@vger.kernel.org, AJvYcCW1sCnRdZqryQjWtvdPHVnEV1VzeROdrXa7YBZsAswenMCAPdmLylHPcMlVD7XakGdgdGxxg0V+@vger.kernel.org
X-Gm-Message-State: AOJu0YyVZP4iFjv/5Fwrjp9C4eHc+1k9gb/dfQcei7ka/77pRTDGF3tm
	AXUxwwCVUaE9CyNz4lHdClJ/dpL+d49NOquzUip5lv5/shiDV0/1ZgbNRO7N94Lu
X-Gm-Gg: ASbGncuIdF5YzCxAZkYK+Id+/1KOD7nSlDO4JdHNtxSk4BZR0oo8xNuwwVZFhr3P3NN
	WCOxpQdUTYy0ZRnpe5Ao40z0OgIvqRJfApkxRKI/JBuZwe1B6mxEBq8urbrq2jVdkyNjYZF2qUv
	mEIWtK89f++ASe/8JKBu1YNooqX4hzLekpNcE0Ws1x6sKITwvYSeU7jbt8o9UB6C9ykLlD+RF1/
	MBL4j2fjzyZJS96QwYLmu3HNKgiOA/X/3X/Hkb+MYoNFHlwC83c9jHc0d4xb8YW3DYmuk3aZ89r
	TDNO83wep9GVZwz4OJucHXR0MvA50AuBWwkD5a02DelMCW5vWW+t+OJoK7Nd94FuujOGKK6LQnc
	R0Q/Gwb/pDuMWmaLBNVQCT/GNepymPaZO3GDjscIdHYI0FZ4aBNUTAtRebJfX
X-Google-Smtp-Source: AGHT+IEu1x/ojD8RY/mYRSSla9DhE56VoxavjH5IPOni1i/DXYnWiggK7FCMZEliHu4PKiLT5H+S5g==
X-Received: by 2002:a05:6102:5111:b0:4eb:53ca:3cfb with SMTP id ada2fe7eead31-51be13b5e02mr348729137.25.1755760362683;
        Thu, 21 Aug 2025 00:12:42 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-51c55f1b913sm45765137.5.2025.08.21.00.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 00:12:42 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-89021b256d1so160837241.1;
        Thu, 21 Aug 2025 00:12:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0BDZKCNAsWlhC/Xvdr//HTyT1CMdxq+q2f58YU6S4VsPSjffWZU3W0IxYwptxX/f37pt0KYsFsSEQgcQa77De4MA=@vger.kernel.org, AJvYcCVk5n9idouaOI3d7tQrVP2N2KRdnxThVg20BQix+qosL0AfdnEubCYLlQYjE6f68PUD6LV2EZyrYwE4vGY=@vger.kernel.org, AJvYcCWWlnUXFF2q0gGAd0IGzFDk7JXN7ZUwmfWnHjMlishLSVqrWftbp0hvN7aqKpLXfJ3ypGEvoM/J@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:4f6:25fd:7ed3 with SMTP id
 ada2fe7eead31-51be0c3cb22mr330848137.22.1755760361875; Thu, 21 Aug 2025
 00:12:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250820170913.2037049-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Aug 2025 09:12:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRw4HU+eoO=ttj3YDEbi9UdHKtZqC1UT2E251UMh0WyA@mail.gmail.com>
X-Gm-Features: Ac12FXwXG_8NGNoZINWQzhw9Gs7sTvVLOc6_H3t9avyHMg8cxxSqyey1mBXkMvc
Message-ID: <CAMuHMdXRw4HU+eoO=ttj3YDEbi9UdHKtZqC1UT2E251UMh0WyA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: pcs: rzn1-miic: Correct MODCTRL register offset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 19:09, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
> According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
> [0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offset
> 0x8, not 0x20 as previously defined.
>
> Offset 0x20 actually maps to the Port Trigger Control Register (PTCTRL),
> which controls PTP_MODE[3:0] and RGMII_CLKSEL[4]. Using this incorrect
> definition prevented the driver from configuring the SW_MODE[4:0] bits
> in MODCTRL, which control the internal connection of Ethernet ports. As
> a result, the MIIC could not be switched into the correct mode, leading
> to link setup failures and non-functional Ethernet ports on affected
> systems.
>
> [0] https://www.renesas.com/en/document/mah/rzn1d-group-rzn1s-group-rzn1l-group-users-manual-r-engine-and-ethernet-peripherals?r=1054571
>
> Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
> Cc: stable@kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


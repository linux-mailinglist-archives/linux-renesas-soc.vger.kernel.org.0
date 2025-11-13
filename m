Return-Path: <linux-renesas-soc+bounces-24562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 83992C57E07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 308494EA9CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E8219ABDE;
	Thu, 13 Nov 2025 14:12:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311CE271469
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043145; cv=none; b=iGN/Nq9X5LJ7YzkrUVKgQViA9D26/dPvpxCLyo03DVUDUSHezZucT7mgX40EcD5jTj2E22s04xiU8ymaL3L+C52iQNAA92+HC6zucQuNjw259A6fK3XHvjzq3dVWU7RtXO1/QXFZB0WKEY3Yz/Qx/qhDHUTJgZFlh7cCVjIy/Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043145; c=relaxed/simple;
	bh=comZjXuDIDnizqUYHOKDvMQRgHC3+80Q+P6ov/b0Rc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPT045qUXUgM0Q4Zwg4cPk3sBdy1S5XFRhBO3QMWZxI+dbbDJYVs4sIAaw8LIkspVUsK5K6jKAiRrFdA0r479BlMYvukyleVaCiCo70m5XXj3kYl2ZXaCfP3P2K/m/gn6hWA7KJ/ojiJLEyKMxD1rfV6YdVBNJPM2lHO1SyV7FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so325824137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043140; x=1763647940;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulWJQ4QTuc71083HdY/1CUbZ5xknk1Yhidqn40qfX8s=;
        b=L2Pg37ZoDoCQy9fUQceOwbMKLNb30jZXhGY6iIVv+QH+zG4Dr242eft5rOy/4arJIX
         se81/TcsCTsf12rkv1lL0VAfBC1cxEdV6meUnZ3rk0a5/Zw9mZDoN8umi54zHzoKsDkI
         whdt06JwwZv7CNnGPxxEkJkw3B+xI+nUW4QQ65dNuX9a3iWCBGvUQZih/zXbRG+yPrF1
         sQ0I4ZpvmzUgJUaLegJlWMdy1nNqOOwReiUm1y4eD4YeU7m45sFSvGEdWwiFd1BlPS4w
         uckGAoBlcd+SVGj3RgDmwv5vnHGaysYMiG4LN+3JzIYP408BPqFhz1svL+RHQt3snaCf
         IziA==
X-Forwarded-Encrypted: i=1; AJvYcCVqVPm0WAGQqHIozY0ruF+BJd2hX3YQ2jtVaBNYpKZVxGZxgi3Ni9nEPWeT8hqlqbL9Emqf17k2XwPJVOZQiMcxaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkcxrViE2rAyqDwAhdj30dMuYHOJGIsCej+tQtbH3mIVaAIa/d
	YdGLR89o+/c/1b+deY9rqRQ+Q7NRp2BX67OKpqe/AuMpS+04amwpCvxntyOEPSTYkfQ=
X-Gm-Gg: ASbGncuLmq7QLu7crmsyuK3031aK9l5/HikaKtCYj3CBDc9YglWXMR5KSPZzK/ZWXOW
	ub48R3R7DqqSe3N8riH/sJqSujOMZrE2FOwQPZgawHMqUBnBBXKmnHqOVrjO8fgKYiXhat8Srkd
	YpAYAy55Z5tfS+oaQoHsFGCkeHEvZWzYHxI55+vPefHt/FuDsWZxnJLn60ORDJUmPBtTLMe28zj
	8L2cFAx1Vn+Lhnr41dgCS9TAKg8d33M1rpcZX115gHQNFRO7KDmIXu7qVjOl657a708TSgBd3iY
	tmTnUsYtaRFTTiVgqhNkNP/jeXfIsZpGaYgD06BumEfjurwM+TP1BdbWGo93aeRKe4G/nONJunR
	WKkCwmSrDVKj6Qe0WGZyC783L8R1hGi7LrheqnNBiqwppR5CBAuVJdESI7Og/WpGojVLbKaGcX1
	WDyHu8ZJTsbpTX/aXjjN/qq7BxX8ktvxqYAf3Wbg==
X-Google-Smtp-Source: AGHT+IEYI+bVJ8VSEWkC2BuRmHpbCiPSU2hP8HOgxaWqpb24yfIi2eiG3qsgR43krwgUdS/5x/i4GA==
X-Received: by 2002:a05:6102:54a1:b0:5db:3d11:c8d6 with SMTP id ada2fe7eead31-5de07d0cd46mr2044215137.5.1763043140185;
        Thu, 13 Nov 2025 06:12:20 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9376111f1d8sm591282241.8.2025.11.13.06.12.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:12:19 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93516cbe2bbso254041241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 06:12:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHQ/XBZxTa19+LZRfmqT1U2RcN54NcAOWo+56M0i+I6thyasAdIs2FVAr3Hw7JHAydCLIhvrAKFrxko18tlB6eaA==@vger.kernel.org
X-Received: by 2002:a05:6102:d93:b0:5db:20ea:2329 with SMTP id
 ada2fe7eead31-5de07eaedbdmr1809754137.35.1763043138634; Thu, 13 Nov 2025
 06:12:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210706.45044-1-ovidiu.panait.rb@renesas.com>
 <20251107210706.45044-2-ovidiu.panait.rb@renesas.com> <20251110-hardhead-upside-54baa149f453@spud>
In-Reply-To: <20251110-hardhead-upside-54baa149f453@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 15:12:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUOMYZGF2xJWUnBi8i3eggxi2+j+FB0G-E7bMBwYAGhQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnlPnhXhYldo17YNgMXfp15mj6ryj0q_5g1DZAmmEAVMaJw8DyorslMWa0
Message-ID: <CAMuHMdUUOMYZGF2xJWUnBi8i3eggxi2+j+FB0G-E7bMBwYAGhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
To: Conor Dooley <conor@kernel.org>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, claudiu.beznea.uj@bp.renesas.com, 
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Mon, 10 Nov 2025 at 19:50, Conor Dooley <conor@kernel.org> wrote:
> On Fri, Nov 07, 2025 at 09:07:03PM +0000, Ovidiu Panait wrote:
> > The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> > (r9a08g045), with the following differences:
> > - It lacks the time capture functionality
> > - The maximum supported periodic interrupt frequency is 128Hz instead
> >   of 256Hz
> > - It requires two reset lines instead of one
> >
> > Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
> > the binding accordingly:
> > - Allow "resets" to contain one or two entries depending on the SoC.
> > - Add "reset-names" property, but make it required only for RZ/V2H.
> >
> > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
>
> Didn't Alexandre already apply this? The changed version is
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> in case this replaces the other.

Alexandre dropped it, so it is no longer found in next-20251107
and later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-15840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39CA8599E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 12:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 018537A3C20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 10:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD062111;
	Fri, 11 Apr 2025 10:23:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DBF278E72;
	Fri, 11 Apr 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744366982; cv=none; b=jcGwZcv/7HpSdopSgZr/e9OPnGLuNmZbYIMae5AJEbDs34r2OIvVyH+ZB15ypm8k2i/ONTLgjqiC4/ofAvezjeyLCaWmXMmkOgvbwpEnJYUx9QzvTIadffIIwedxNhmeKFXHCyjwUPpqB6zU/X9y+fnGT7+ZDrdipALriNmKvug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744366982; c=relaxed/simple;
	bh=ur8vAcx6hYQ0BavHC0cVG8s6hFcsm+uO8HkIGWSe1gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtez8utXjxcHqIe+R10cSTOZvdjmwdE3R38WfXpzCu7N7rhF+7oKNcGropj7bILWaz4tDk+mKwyqAIlTkUz/D+jLOiL/RviVC4Cizq0EXTFZ59qOeb3nkgGEmasAeZC7otj4XMz6bk+q63F3SYjfESF2pY1WqMQGF6efk4NZYfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so729368241.2;
        Fri, 11 Apr 2025 03:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744366979; x=1744971779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hRBfUSX1rS8NNY0ZCiVASOpOokUDYJl4Hhtk2fC37Y=;
        b=pUpDS/pAQ6r8KZ6qpFzfLFFhaIldnLNIPNoesUno+NW36SW7UfPNCil5qS1xUO1LrL
         gAQqusDHDnlILIZ6EW3bcPBYANfh6W70FiaIe8eC86IDF81b7b0dGyyB4sKahrhs/cLZ
         pvmndEPVinwA+G1PWCwxCBlQ8ZQFRORfyDUFmJ0ZNqJ/kb+rBRjjQ2AVcs6FDpJ27aQp
         MNQdefrommsskxDV2TdAmXh0K3EIICkVZXF5oyD9/KeiqgjKgKWYc9YfQbJzwfCOb/4C
         +3oyuGQ3lxErVWGJ3+WaXC46KHchsiiRyEN0RM82jF+/pqd/sngxrJx4JwGnJkxEDDug
         hfgg==
X-Forwarded-Encrypted: i=1; AJvYcCVuZyu3K7ML3bYOyCBCXRNuIe1JQaZXi7ytb/hfGtSHPYv8wY3yTd4EdcADDLXI1zU5GLfvEuAuYP0R9IXV@vger.kernel.org, AJvYcCWQ2BlLLs5hhBGHw8iB9FOWR+Wqaa4vmQefxO5TbdYwAkeCg/ieojZOEkWXD0zCSDf4ThkWAchKs2GT@vger.kernel.org, AJvYcCXCPBe15lSkLARiJBR4V+PnigrfcRryRyvvY3LFpOVq63fY+b4TLmhmJeI2xYk1NvuwMMhK0NHIsdPLgN+MStkgStc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuyRaEQg8lc+Bir7o/hy8tc+kMIDn0IaKPzWuMbH+l40Q0SDSQ
	s94nlKdADNwZNbTJESef+1GzM+UMe9VjGpgMwur1eQcLxObJLXtEyJ+oVn9/xik=
X-Gm-Gg: ASbGnct8nd9IFK0pd9IhbpM88DJ/icMz1nAmRUeYvX7kVN5qqb6DyGMjNqNfao1aO10
	VFs1XAuwDqhutCDJ9lOT8zR6V5jhUC9Ycc+acMoiod88dY275/TG/ibK3dcnc+d7jelwJZ62Sro
	t6PXqgGJgjA541ucG43bjFoblSCYPUGt5iqZO/8aNYfw1S3pD/WGWqHLVPfIEBiagK44kgJtSMu
	xMRADrG7SvTcHVwUH0CrabUyuHEmFtyufHRs7ks3ZW8Hrbg2bfUHWf58BH5VKo/0FSD3a5ascTI
	QYB+4HbjVMQ5yeZSt7us055e6K1Jt/s2Vxwb55RLVkW93M5VaNrRH0tqgdcsk/qLegZgQL8jj8Q
	BhQ4eMoA=
X-Google-Smtp-Source: AGHT+IF1RHaCf7nfLZp2YM/Dp6FP9VRaVVJA3YQ1SBYOwg3wlYbjEyl3pgrGDk2gSTkIJXUBy1cK/w==
X-Received: by 2002:a05:6102:a4f:b0:4c4:e21f:6481 with SMTP id ada2fe7eead31-4c9e4ec68cfmr967266137.4.1744366978903;
        Fri, 11 Apr 2025 03:22:58 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c9738859sm1005269137.3.2025.04.11.03.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 03:22:58 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-523f670ca99so849322e0c.1;
        Fri, 11 Apr 2025 03:22:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUG8jk/9j7205DQsrM/e8ItXeJ3YXwPBaqy6HvZFdtD9PzAo0RwD/mtgNLQ3DoxBrjKdJfxqnHcKeMoxY0B@vger.kernel.org, AJvYcCVRVkK4Bode4XASB56wHlar1rEOqPIv6FzZqYjIl+2/TXmEGv8DW6u02qsqZVRHTaW8nB9I9dnSfUp7@vger.kernel.org, AJvYcCWosV47jjH+O88My/iS7evRsS5GAgtHeFO7nJx9xA0bLg1WdkBl4ZThaM0bbfQXnaPIarXWNtOP1hW7ewS6lKGdIiI=@vger.kernel.org
X-Received: by 2002:a05:6102:3c8c:b0:4bb:cf25:c5a7 with SMTP id
 ada2fe7eead31-4c9e4ef1620mr1077568137.7.1744366977634; Fri, 11 Apr 2025
 03:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-rzn1d400-eb-v4-1-d7ebbbad1918@bootlin.com> <CAMuHMdVM66ni0opbUopt6mCPshoQzO5GPEUZDji39CxtkoFLSA@mail.gmail.com>
In-Reply-To: <CAMuHMdVM66ni0opbUopt6mCPshoQzO5GPEUZDji39CxtkoFLSA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 12:22:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVs07oLC=rch8qvgdaLZ9oyPah4UNaXqteAJPpK1G6POg@mail.gmail.com>
X-Gm-Features: ATxdqUGKpC8-zQNdSKej18U7SASPFIdMTPfPOz3AFWTO56Aktkbe-rll8s8Nddg
Message-ID: <CAMuHMdVs07oLC=rch8qvgdaLZ9oyPah4UNaXqteAJPpK1G6POg@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: r9a06g032: add r9a06g032-rzn1d400-eb board device-tree
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Apr 2025 at 11:21, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
> On Mon, 24 Mar 2025 at 15:51, Thomas Bonnefille
> <thomas.bonnefille@bootlin.com> wrote:
> > From: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> >
> > The EB board (Expansion board) supports both RZ/N1D and RZ-N1S. Since t=
his
> > configuration targets only the RZ/N1D, it is named r9a06g032-rzn1d400-e=
b.
> > It adds support for the 2 additional switch ports (port C and D) that a=
re
> > available on that board.
> >
> > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> > [Thomas: move the DTS to the Renesas directory, declare the PHY LEDs]
> > Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> > Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>

> > --- /dev/null
> > +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts

> > +&pinctrl{
>
> Missing space.
>

> > +&switch {
> > +       pinctrl-names =3D "default";
>
> (from v2) No need to specify pinctrl-names, as it is inherited from
> r9a06g032-rzn1d400-db.dts.

I will fix these while folding in "[PATCH] ARM: dts: renesas:
r9a06g032-rzn1d400-eb: correct LAN LED nodes" and queuing in
renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


Return-Path: <linux-renesas-soc+bounces-19326-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0EAFB3F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13BC63BCED9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1038E299952;
	Mon,  7 Jul 2025 13:10:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A725E44D;
	Mon,  7 Jul 2025 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893817; cv=none; b=nN1WDc8OFruIz2IlHE8S6I/+PpBDjSvL1GtHccuh58Be4WPp+uhi9/Ic83z3yYMVAKJsEoRVsTTkE/wvmZpE7luXDyvWviRZPLc6PdCNR0m5DwuZ9du6HtwGDu25beAFy9LSZyA96pprXXjxOtfS5Hxi4KCZUruuLPF0apkVg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893817; c=relaxed/simple;
	bh=61RBaMbea8NRtSu+ZTmspIqUZ9eaxU9e2E5giPGZh4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBLXfu2aQFcDQduLchyZRljYCd2UUNXRt2E3yx+BipDtIqPG+O0QiyFxF90a1N52ZhdbKZRb78nsk2G1JewnvdMBLueQuOL3bSHIN5BREcirhqQVRzPgb0QQBLpwGlkpUCtpS+SDPAmazfOC1KuUxqYQAeBTibWAWAmYriuBm2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fd0a91ae98so21414276d6.1;
        Mon, 07 Jul 2025 06:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751893813; x=1752498613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Euf94tgn/3xSDnyNvltb3qvyn0bNOPjl7Q09Ppxb8q4=;
        b=nKq+lc/Cq7dRG5NrJ97R4rOOtkTS2vjYPZxqedvLOCaHKOzKIgyRvOmt4gvB/2X/B4
         WGahawKoNk9a1q6KaJt7FCwaRiG9jp8f/2HZYaOxhVj9Q3GmTxQIIuAJMSPolkMZB3B3
         9Rb7Q9Y3uRdigih0Ls3tqqJhMrdcHnLMILl80xjrJCIsPOQ/BwQVIKjcBg5PsXuu8YAr
         8RrqFcnuzCbQ3Obi7DhnoKbPj9/5SpJ+ge2Idn2bAYIUE3vpCXyYIRmKNE0u7jq1a+1n
         j0Wf4usKX5UQitUH6LqAQVckxL4lSnouOOkAJwRhZ7SUt83jzJKC2olgSXrxXWorKZjd
         pNaA==
X-Forwarded-Encrypted: i=1; AJvYcCV3QMUXBY5+TJwdPb4+HuoUvoIu9U88JJH15f4/J7rYTPch0flxDv3u1nHgpDBy11ZAQrPOTGbwsqAL@vger.kernel.org, AJvYcCWCpKacvZveg86paaz6tNt1f3xizVlzmd+IENwhOrQkmb9IU/HbCI8ey6aJzUDqOXNLoXM6bZ1amG3eWJenUBnf4B8=@vger.kernel.org
X-Gm-Message-State: AOJu0YymjhuXikA0RjhGVQLXP5tWnVhXJEo8NSj+IUWpVlSHIe+JLcBA
	zb5aVcsOaQ2OiYOuG8LaGqoR2wJKlN/LP0j/JIl5FALUsdYy68bGyPMKyrDq8+S+
X-Gm-Gg: ASbGncs9ot29S5SscBBz2iDSad8vIU57mOhHay9B/9zgmAtFaEpWdjnYoMdBnv6wo4C
	Z2XFT6TSS8YlN+DQYXNQwQTUtBHUNOIYANJTn8YxNxGSvzbJQxuP9m8XTB9u0wFY5z4sO+tO5vg
	3k+h3oQLvCF81BNZc0BLmF000H9h0DhN+C0/iJ1ExbbWRpw2abMDmsdJoGunJSAOfbzgQAdlH9X
	jymktyXOhv8zBdSQLWeDo5sarOBDlCeJO5XOqHnxC5906XRykMCiJ0QY6ZluMKUAGn3R2qRLKIA
	IjV0a6gqjds4EUu/i3Gt0P7WURN52/vmBYnkhpEE7J8u9m3pFc8fE8pBZiXBhUwn/8nB/TPLoab
	GKOoKe81Cs5wQ+OqI85blKxGnWgYa
X-Google-Smtp-Source: AGHT+IH/k0VG8ho4a8wGYhBpr4VelB9UdjqO5RyaR2RI7UI0lPobmklqvLa3wLmnjGRGq+sWDE3T+A==
X-Received: by 2002:a05:6214:1944:b0:702:c124:29bc with SMTP id 6a1803df08f44-702c898f516mr192854316d6.0.1751893813240;
        Mon, 07 Jul 2025 06:10:13 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5af0esm58314376d6.103.2025.07.07.06.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:10:13 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d44c6774e7so190429285a.3;
        Mon, 07 Jul 2025 06:10:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNBz9dHxxQsviXseMH+6stFDMIDdg6+nKFzwOztBCw+Azlw1ST/HaJ9XbLpi4hL+s9IpxDZb7lfTBd@vger.kernel.org, AJvYcCWgBSqiAlx51j9GCNKcbKzBtZeS0Cl57tMg0PridM/bKj4z/lVdzEUMgpb8SCMR1yIvyee7N9bntxzzi+IVu6i3ojM=@vger.kernel.org
X-Received: by 2002:a05:620a:4488:b0:7d4:5802:6b52 with SMTP id
 af79cd13be357-7d5df161a6cmr1265231585a.33.1751893812720; Mon, 07 Jul 2025
 06:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
 <20250704100734.3387856-3-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX-1KJ4yrNeNT1SYqvfrn+XEjWuMxQkNTKJ5j9+fxgDdw@mail.gmail.com> <20250707130435.GA1410739@ragnatech.se>
In-Reply-To: <20250707130435.GA1410739@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 15:09:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVg8pKHF6073Z5SWAzAuRvk_WE34PFdQcecKCyY=LtWqg@mail.gmail.com>
X-Gm-Features: Ac12FXx0KNw0yHzEkykXKzsLWLnUdfvDiKwqlaJs8e4FdctyBTYbK74uok71sfM
Message-ID: <CAMuHMdVg8pKHF6073Z5SWAzAuRvk_WE34PFdQcecKCyY=LtWqg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, 7 Jul 2025 at 15:04, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2025-07-07 13:47:32 +0200, Geert Uytterhoeven wrote:
> > On Fri, 4 Jul 2025 at 12:08, Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Add an overlay to connect an IMX219 camera sensor to the J1 connector=
.
> > > The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video captu=
re
> > > pipeline behind the CSI40 Rx to be enabled to process images from the
> > > sensor.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>

> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx=
219.dtso
> >
> > > +/* Page 29 / CSI_IF_CN */
> > > +&csi40 {
> > > +       status =3D "okay";
> > > +
> > > +       ports {
> > > +               port {
> >
> > The base arch/arm64/boot/dts/renesas/r8a779g0.dtsi has "port@0".
>
> Indeed, this should be port@, will fix.

Thanks!

> > Still, this is applied to the correct node?
>
> As far as I can tell it did, and the cameras worked as expected.

I am just wondering if dynamic overlays behave the same...

> >     $ dtx_diff --color
> > arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk{,-camera-j1-imx219}.d=
tb
> >     [...]
> >
> >                                     port@0 {
> >                                             reg =3D <0x00>;
> >     +
> >     +                                       endpoint {
> >     +                                               bus-type =3D <0x04>=
;
> >     +                                               clock-lanes =3D <0x=
00>;
> >     +                                               data-lanes =3D <0x0=
1 0x02>;
> >     +                                               phandle =3D <0xf2>;
> >     +                                               remote-endpoint =3D=
 <0xf3>;
> >     +                                       };
> >                                     };
> >
> >                                     port@1 {
> >     [...]

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


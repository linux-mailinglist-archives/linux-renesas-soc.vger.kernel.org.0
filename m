Return-Path: <linux-renesas-soc+bounces-12896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15EA2A52C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3BBC3A1AB5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 09:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EF922652D;
	Thu,  6 Feb 2025 09:53:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B512144BE;
	Thu,  6 Feb 2025 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835579; cv=none; b=JKtK4TJ9jkx4JwuIWLvrC6aVmfhvssINIL9vzE98DcYBmnSexr6gK3lYHYsN9mGUo7U26lgakrK0/M/IpMRXrEwN4ERhuqzxyV8bE5oPh0GxVqSFrc08eUUwqxP9q2XoRdwMUsKn8POTTfoifOID8Z37KxgoE3RdpvrWjBYt/+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835579; c=relaxed/simple;
	bh=yQ+oKgF/5p7daP7X7QTGQGxuWGdG1bFn42vO7+kDTWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAAtDGAb49/qJN1T5XyFLZJEV4v8+x//tnOLCiDLokW6+zygMaa0mHFrEJaa79n1K3o3jKI7U/WAvemWr4tg0gUditn3RkgHbvGO29CJiBNVZLzrG+Lh64NrW8I97RsLO7YZCs4WTHcmJ9sPY9yxLBQvooFdD+DrzLKHPCgYpBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4aff31b77e8so232332137.1;
        Thu, 06 Feb 2025 01:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738835577; x=1739440377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/xxK8Fzo5jH5r7FBeA1rpAHKl5wZqdopwzZC+m+L3k=;
        b=VGZ4MkOiOGhilq/OlRdwijIsefh5YcEFRNMVpPAsRmqWT0B4AyBhsUwAzn/Ciz8RO9
         NBZed12P6h3z0w6YOCIN9K0i5ddwKKzSpkJZKUEN0v9NEit9KJo3qvfwcm/IilkA5/Qm
         cjwTJ4pAZG1aaeqb1kYac4HmGl6n+Rpkm6jJyi+JEUoupi3w7MGfpXS4ntr/WTM+g5/l
         GxHCeJ5ZGBnqN6AWYn0M3h8LcbcXGMcv8BVb5VNzKBKi+bWRCX7k5etYnfVVh+4hSnwg
         qPcnzUZsSBfcoQfG+O1HFgnsDbKRONGv4n4rY2f913yj9J3ETznzRoIRwY2jZiJ9Gv0r
         VNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV58jA5XYfkzL99YRJspni2g419I9ij1Ox6pW4s+MuzdHDHsFpRcdRSS4KGt/hcfVHqPGjZWlSAe+N@vger.kernel.org, AJvYcCWxOliXueIHPnx5yEIArU5PiAnXri5CM3Sy6GRX/LP8Eg/+ribqqHGSrlWpYJFTzxXlZRopuw+E6BhoVBQo0CouqiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOY+jGFvgfwpoPpsFk106TDUV1RAwsZLXWGXLjcwCfaYJy9wPs
	9zFJGKIfus1EByzQdE5dA9lQhpJth/M2PvuO5isW32lYjrQ0+IJkOJ9oCycx
X-Gm-Gg: ASbGncsKxl1wupBX94Hh+U0SdODjxuLy50CHWYXTXim3LU5WHLPi76yqPbavZJg55h2
	wUH94u1VPQNbL+Ls6Zr4xV4PVUcgmWGW6GQe9geDbBxg6g8uyI6fbyT8AzbrQKwoyi8N+7O2ShG
	BYFnPSletXRP6ZRjEeMNp/PgCM6r0blLdfTh9kBPIbbASqKTrW2TCL9UCDp4ExnVax8nX/W38v+
	oVmhYNE4BeGAq0x+n12s8Mtk6wGua2nm023UwZYD2aR9jkmAHLLZJp93BH7iBXFGSQ7LRf8h8Wh
	/5p5V7WF7Pxzu+jJXMod3kQYwd5GKVmg7mQKTIA6sPsoSBDm38z4sA==
X-Google-Smtp-Source: AGHT+IEhLtCh68OQ5zd+3uEDEDXsvWJ67GcjHdRfan+wOX1ayH2XvJVFzVYbngq2lK/Y4AAbHeeh2A==
X-Received: by 2002:a05:6102:4a8e:b0:4ba:7f58:d526 with SMTP id ada2fe7eead31-4ba7f58e50amr86959137.17.1738835576800;
        Thu, 06 Feb 2025 01:52:56 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f963682csm149667241.2.2025.02.06.01.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:52:56 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-866def1e9c1so163987241.0;
        Thu, 06 Feb 2025 01:52:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdITs31v7bN8hDlaFaeEXTEhlkg32rR42r3qarh8bDJOp2QZT63gE8A5GVqhCt6t9vzurUR2dR5l5q4TqNrxLniuw=@vger.kernel.org, AJvYcCV8fUJbVQ/kK8KA+tv1gTYpqNTR8r+V7Od9QVsvjn2QM4aFdkxPpjah47Ii7y4Lzsqb2xLc99gosAPT@vger.kernel.org
X-Received: by 2002:a05:6102:3f41:b0:4b9:bf91:a864 with SMTP id
 ada2fe7eead31-4ba478e4191mr3522283137.15.1738835576443; Thu, 06 Feb 2025
 01:52:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <20250131112429.119882-7-biju.das.jz@bp.renesas.com> <CAMuHMdXSaewfeRkuOqmBYkWPzLr54QM1X7fw0ODOuj-ooucUkw@mail.gmail.com>
 <TY3PR01MB11346D27BC2EE65AD29789B0D86F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346D27BC2EE65AD29789B0D86F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Feb 2025 10:52:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-8vEWq2sVBtq2wZ-3msKpNWket88-DDGVNX53U2u4ww@mail.gmail.com>
X-Gm-Features: AWEUYZmRopNh6BKMah2say3nD1SEa6FpeGiJavWv1f51m3GTELDXZi0fwjzIhTc
Message-ID: <CAMuHMdU-8vEWq2sVBtq2wZ-3msKpNWket88-DDGVNX53U2u4ww@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 6 Feb 2025 at 10:47, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 06 February 2025 09:36
> > Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
> >
> > On Fri, 31 Jan 2025 at 12:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Enable eMMC on SDHI0 and SD on SDHI2 on RZ/G3E SMARC SoM.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> >
> > > +&vqmmc_sdhi2 {
> > > +       regulator-name = "SD2_PVDD";
> >
> > Why override the name?
>
> I just used the label used in RZ/G3E SoM Schematics. So that it appears
> as
>
> cat /sys/class/regulator/regulator.4/name
> SD2_PVDD

I think this makes it harder to notice that it uses the internal regulator.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


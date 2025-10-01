Return-Path: <linux-renesas-soc+bounces-22511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43BBB03C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 13:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9444617C863
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 11:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0292E229C;
	Wed,  1 Oct 2025 11:49:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9552E2296
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 11:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759319369; cv=none; b=Ixrg6j1Fv6U95zggtr3hfGiDqG69Syvw+bRiX5rZGbtJDlG/VKT+cDhlx1Pc0FKkDZ2aBXnaQDUrwRT/dLJjSgbj82JaHw1DNmj0zTkknCbEzmQqJM6qfMSK6/4kVt1tSUm9t7x2d4RIRsouLssujrx3k/apw2/8Pwekq2yiNDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759319369; c=relaxed/simple;
	bh=H8+zS/sRVPe61ZpvXMAM9MYNlz8rpJapyLZg66DsQ70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCYtPTJUCXpeKd5kq7t6XdQVBKMiuRfOwuQWLWy1Pt1OWadWPjfcoQdPzgQBJWdEu5vr5OS/OqOrZhft+FZVXzre3Yw+TjYaK0QGZ8BLY5x28iV2FH7jnLPnI27boAYgMDcy9v6WD2xTX9qpIVG4fK4Ga2B/DwHYFlOWm16anqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8e3239afdf2so4192083241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 04:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759319366; x=1759924166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/g40kIFvUrvIf0YJRnutJHF4Olw96C3WYwPcLV8XYQ0=;
        b=J3nLgiJZVPPQiPju5z3y8PEijgZUXzmfazagbQAQWPz0yN520o6PoSNSBjH70rnhMF
         ynaSRAr+K+MDhtFmrWuHakkQHq2vaYk7hdMIZHeWNN4lX0tsuB6Otdu4MVzm48v1mIcm
         0z6Akuz82romletKam2yEQmCdh8OBTuJ+e6O1WHSGyg/XQJ0qe234/vyHGkPOhhyKjNY
         CoRrVnQ+451zoVBP3BGr+tu/2s7UW0V4tFQlUjc/SvFhZtnCQvbu7tApOrDVnAQFvAoI
         iqWX3rOyq1daTLgJLR29QdJNk3U5PRiCj9B3jXSt3Q+i5jqynlUFE1SA/LyQpjcatmRm
         RGxA==
X-Forwarded-Encrypted: i=1; AJvYcCWAnmZWpuyYVNIiKHbmP32310smOMaqbdGf6nxf7+yzVlP84OnnCqBXcr0p67bnqNuvuHhxWfrICElt0Q5f7M1Fow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6R2FawORaTUSXb8f06Z+wVXhkKx9Ecneivt2wJCINh12zWPi
	uE6lB9066y9Bm0UDvgK4Wg1OzBvsRTeRY7MZEC+mvIcQWxvFKRIGWpNQf5vppUEZ
X-Gm-Gg: ASbGncsJqJ26vCG6CAU9yBomUKQjz2nqrdwH1o0lv2LPSltDZPrA7nQEylr1d2+lSvt
	p7LePSthLQgA2/C6avGLF8l1Vw24eEmyaEmwZutnfuA5QQa1G/9y86NXPNICSfsoe+23utJ6Bts
	rGdAupGPuFKoDmPC1gvXcklYst89fvcvEjeIartWGqPRpZ7if0QcVgZz+93cQQoe97wDnraYNKI
	qlh2GnfscfNCpwnI1vdY2kXOnETFZZMlYmWafrZScR3yjMZha0sOHGo1JepCTfhaUg0k2d6LEPc
	fGI2Jdk88A7BASZmyM5u7KTiNuXOyr+0gc0mF+AQorkrWDp9QLrh1ea5ir2KP0o46qSiwJnBr1p
	AQJYRXLPud8Dm3GXEqxIh/xIxdGvVD53AzRemWx6gpPLmxKdIklTWHkNEMtblEjEV/Hp5rFE5V5
	4SniwpCKDX
X-Google-Smtp-Source: AGHT+IEF33lEkyIXjuuVulP6VGJkOc7q4ME4RD1mHK9oLU1R6cdorXxPbxM78+6f0k6UXm95TJTGrg==
X-Received: by 2002:a05:6102:6c6:b0:529:96b9:1fce with SMTP id ada2fe7eead31-5d3fe6de43fmr1302152137.27.1759319365859;
        Wed, 01 Oct 2025 04:49:25 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d8784984sm3374615241.10.2025.10.01.04.49.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 04:49:25 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-89018ec3597so4015927241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 04:49:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3exbW6nIKmP09BteZqJro46ekeqfB7iizblBhStprgCVEt0MaiG/mKkOc9Co9c8lt22KzAno/RjcUB8yD7+wnFg==@vger.kernel.org
X-Received: by 2002:a05:6102:4421:b0:530:f657:c25 with SMTP id
 ada2fe7eead31-5d3fe4f9f2dmr1325072137.5.1759319364716; Wed, 01 Oct 2025
 04:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924134228.1663-1-ilpo.jarvinen@linux.intel.com>
 <20250924134228.1663-3-ilpo.jarvinen@linux.intel.com> <CAMuHMdVtVzcL3AX0uetNhKr-gLij37Ww+fcWXxnYpO3xRAOthA@mail.gmail.com>
 <4c28cd58-fd0d-1dff-ad31-df3c488c464f@linux.intel.com>
In-Reply-To: <4c28cd58-fd0d-1dff-ad31-df3c488c464f@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 13:49:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbaQDXsowZETimLJ-=gLCofeP+LnJp_txetuBQ0hmcPQ@mail.gmail.com>
X-Gm-Features: AS18NWBKGt9F5KUksrguQremVOx7wE8zhiLZILP_32pEjHukGAyY-11nzHTkZUs
Message-ID: <CAMuHMdUbaQDXsowZETimLJ-=gLCofeP+LnJp_txetuBQ0hmcPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: Resources outside their window must set IORESOURCE_UNSET
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Tue, 30 Sept 2025 at 18:32, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:
> > On Fri, 26 Sept 2025 at 04:40, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > > PNP resources are checked for conflicts with the other resource in th=
e
> > > system by quirk_system_pci_resources() that walks through all PCI
> > > resources. quirk_system_pci_resources() correctly filters out resourc=
e
> > > with IORESOURCE_UNSET.
> > >
> > > Resources that do not reside within their bridge window, however, are
> > > not properly initialized with IORESOURCE_UNSET resulting in bogus
> > > conflicts detected in quirk_system_pci_resources():
> > >
> > > pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0x1fffffff 64bit pref]
> > > pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0xdfffffff 64bit pref]: co=
ntains BAR 2 for 7 VFs
> > > ...
> > > pci 0000:03:00.0: VF BAR 2 [mem 0x00000000-0x1ffffffff 64bit pref]
> > > pci 0000:03:00.0: VF BAR 2 [mem 0x00000000-0x3dffffffff 64bit pref]: =
contains BAR 2 for 31 VFs
> > > ...
> > > pnp 00:04: disabling [mem 0xfc000000-0xfc00ffff] because it overlaps =
0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xc0000000-0xcfffffff] because it overlaps =
0000:00:02.0 BAR 9 [mem 0x00000000-0xdfffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xfedc0000-0xfedc7fff] because it overlaps =
0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xfeda0000-0xfeda0fff] because it overlaps =
0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xfeda1000-0xfeda1fff] because it overlaps =
0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xc0000000-0xcfffffff disabled] because it =
overlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xfed20000-0xfed7ffff] because it overlaps =
0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xfed90000-0xfed93fff] because it overlaps =
0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xfed45000-0xfed8ffff] because it overlaps =
0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > pnp 00:05: disabling [mem 0xfee00000-0xfeefffff] because it overlaps =
0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > >
> > > Mark resources that are not contained within their bridge window with
> > > IORESOURCE_UNSET in __pci_read_base() which resolves the false
> > > positives for the overlap check in quirk_system_pci_resources().
> > >
> > > Fixes: f7834c092c42 ("PNP: Don't check for overlaps with unassigned P=
CI BARs")
> > > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> >
> > Thanks for your patch, which is now commit 06b77d5647a4d6a7 ("PCI:
> > Mark resources IORESOURCE_UNSET when outside bridge windows") in
> > linux-next/master next-20250929 pci/next

> > This replaces the actual resources by their sizes in the boot log on
> > e.g. on R-Car M2-W:
> >
> >      pci-rcar-gen2 ee090000.pci: host bridge /soc/pci@ee090000 ranges:
> >      pci-rcar-gen2 ee090000.pci:      MEM 0x00ee080000..0x00ee08ffff ->=
 0x00ee080000
> >      pci-rcar-gen2 ee090000.pci: PCI: revision 11
> >      pci-rcar-gen2 ee090000.pci: PCI host bridge to bus 0000:00
> >      pci_bus 0000:00: root bus resource [bus 00]
> >      pci_bus 0000:00: root bus resource [mem 0xee080000-0xee08ffff]
> >      pci 0000:00:00.0: [1033:0000] type 00 class 0x060000 conventional =
PCI endpoint
> >     -pci 0000:00:00.0: BAR 0 [mem 0xee090800-0xee090bff]
> >     -pci 0000:00:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]
>
> What is going to be the parent of these resources? They don't seem to fal=
l
> under the root bus resource above in which case the output change is
> intentional so they don't appear as if address range would be "okay".

From /proc/iomem:

    ee080000-ee08ffff : pci@ee090000
      ee080000-ee080fff : 0000:00:01.0
        ee080000-ee080fff : ohci_hcd
      ee081000-ee0810ff : 0000:00:02.0
        ee081000-ee0810ff : ehci_hcd
    ee090000-ee090bff : ee090000.pci pci@ee090000
    ee0c0000-ee0cffff : pci@ee0d0000
      ee0c0000-ee0c0fff : 0001:01:01.0
        ee0c0000-ee0c0fff : ohci_hcd
      ee0c1000-ee0c10ff : 0001:01:02.0
        ee0c1000-ee0c10ff : ehci_hcd

> When IORESOURCE_UNSET is set in a resource, %pR does not print the start
> and end addresses.

Yeah, that's how I found this commit, without bisecting ;-)

> >     +pci 0000:00:00.0: BAR 0 [mem size 0x00000400]
> >     +pci 0000:00:00.0: BAR 1 [mem size 0x40000000 pref]
> >      pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310 conventional =
PCI endpoint
> >     -pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x00000fff]
> >     +pci 0000:00:01.0: BAR 0 [mem size 0x00001000]
>
> For this resource, it's very much intentional. It's a zero-based BAR whic=
h
> was left without IORESOURCE_UNSET prior to my patch leading to others par=
t
> of the kernel to think that resource range valid and in use (in your
> case it's so small it wouldn't collide with anything but it wasn't
> properly set up resource, nonetheless).
>
> >      pci 0000:00:01.0: supports D1 D2
> >      pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
> >      pci 0000:00:02.0: [1033:00e0] type 00 class 0x0c0320 conventional =
PCI endpoint
> >     -pci 0000:00:02.0: BAR 0 [mem 0x00000000-0x000000ff]
> >     +pci 0000:00:02.0: BAR 0 [mem size 0x00000100]
>
> And this as well is very much intentional.
>
> >      pci 0000:00:02.0: supports D1 D2
> >      pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot
> >      PCI: bus0: Fast back to back transfers disabled
> >      pci 0000:00:01.0: BAR 0 [mem 0xee080000-0xee080fff]: assigned
> >      pci 0000:00:02.0: BAR 0 [mem 0xee081000-0xee0810ff]: assigned
> >      pci_bus 0000:00: resource 4 [mem 0xee080000-0xee08ffff]
> >
> > Is that intentional?
>
> There's also that pci_dbg() in the patch which would show the original
> addresses (print the resource before setting IORESOURCE_UNSET) but to see
> it one would need to enable it with dyndbg=3D... Bjorn was thinking of
> making that pci_info() though so it would appear always.
>
> Was this the entire PCI related diff? I don't see those 0000:00:00.0 BARs
> getting assigned anywhere.

The above log is almost complete (lacked enabling the device afterwards).

AFAIU, the BARs come from the reg and ranges properties in the
PCI controller nodes;
https://elixir.bootlin.com/linux/v6.17/source/arch/arm/boot/dts/renesas/r8a=
7791.dtsi#L1562

The full related log for this device, for both instances, with the pci_dbg(=
)
changes to pci_info():

     pci-rcar-gen2 ee090000.pci: host bridge /soc/pci@ee090000 ranges:
     pci-rcar-gen2 ee090000.pci:      MEM 0x00ee080000..0x00ee08ffff
-> 0x00ee080000
     pci-rcar-gen2 ee090000.pci: PCI: revision 11
     pci-rcar-gen2 ee090000.pci: PCI host bridge to bus 0000:00
     pci_bus 0000:00: root bus resource [bus 00]
     pci_bus 0000:00: root bus resource [mem 0xee080000-0xee08ffff]
     pci 0000:00:00.0: [1033:0000] type 00 class 0x060000 conventional
PCI endpoint
    -pci 0000:00:00.0: BAR 0 [mem 0xee090800-0xee090bff]
    -pci 0000:00:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]
    +pci 0000:00:00.0: BAR 0 [mem 0xee090800-0xee090bff]: no initial
claim (no window)
    +pci 0000:00:00.0: BAR 0 [mem size 0x00000400]
    +pci 0000:00:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]: no
initial claim (no window)
    +pci 0000:00:00.0: BAR 1 [mem size 0x40000000 pref]
     pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310 conventional
PCI endpoint
    -pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x00000fff]
    +pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x00000fff]: no initial
claim (no window)
    +pci 0000:00:01.0: BAR 0 [mem size 0x00001000]
     pci 0000:00:01.0: supports D1 D2
     pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
     pci 0000:00:02.0: [1033:00e0] type 00 class 0x0c0320 conventional
PCI endpoint
    -pci 0000:00:02.0: BAR 0 [mem 0x00000000-0x000000ff]
    +pci 0000:00:02.0: BAR 0 [mem 0x00000000-0x000000ff]: no initial
claim (no window)
    +pci 0000:00:02.0: BAR 0 [mem size 0x00000100]
     pci 0000:00:02.0: supports D1 D2
     pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot
     PCI: bus0: Fast back to back transfers disabled
     pci 0000:00:01.0: BAR 0 [mem 0xee080000-0xee080fff]: assigned
     pci 0000:00:02.0: BAR 0 [mem 0xee081000-0xee0810ff]: assigned
     pci_bus 0000:00: resource 4 [mem 0xee080000-0xee08ffff]
     pci 0000:00:01.0: enabling device (0140 -> 0142)
     pci 0000:00:02.0: enabling device (0140 -> 0142)
     pci-rcar-gen2 ee0d0000.pci: host bridge /soc/pci@ee0d0000 ranges:
     pci-rcar-gen2 ee0d0000.pci:      MEM 0x00ee0c0000..0x00ee0cffff
-> 0x00ee0c0000
     pci-rcar-gen2 ee0d0000.pci: PCI: revision 11
     pci-rcar-gen2 ee0d0000.pci: PCI host bridge to bus 0001:01
     pci_bus 0001:01: root bus resource [bus 01]
     pci_bus 0001:01: root bus resource [mem 0xee0c0000-0xee0cffff]
     pci 0001:01:00.0: [1033:0000] type 00 class 0x060000 conventional
PCI endpoint
    -pci 0001:01:00.0: BAR 0 [mem 0xee0d0800-0xee0d0bff]
    -pci 0001:01:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]
    +pci 0001:01:00.0: BAR 0 [mem 0xee0d0800-0xee0d0bff]: no initial
claim (no window)
    +pci 0001:01:00.0: BAR 0 [mem size 0x00000400]
    +pci 0001:01:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]: no
initial claim (no window)
    +pci 0001:01:00.0: BAR 1 [mem size 0x40000000 pref]
     pci 0001:01:01.0: [1033:0035] type 00 class 0x0c0310 conventional
PCI endpoint
    -pci 0001:01:01.0: BAR 0 [mem 0x00000000-0x00000fff]
    +pci 0001:01:01.0: BAR 0 [mem 0x00000000-0x00000fff]: no initial
claim (no window)
    +pci 0001:01:01.0: BAR 0 [mem size 0x00001000]
     pci 0001:01:01.0: supports D1 D2
     pci 0001:01:01.0: PME# supported from D0 D1 D2 D3hot
     pci 0001:01:02.0: [1033:00e0] type 00 class 0x0c0320 conventional
PCI endpoint
    -pci 0001:01:02.0: BAR 0 [mem 0x00000000-0x000000ff]
    +pci 0001:01:02.0: BAR 0 [mem 0x00000000-0x000000ff]: no initial
claim (no window)
    +pci 0001:01:02.0: BAR 0 [mem size 0x00000100]
     pci 0001:01:02.0: supports D1 D2
     pci 0001:01:02.0: PME# supported from D0 D1 D2 D3hot
     PCI: bus1: Fast back to back transfers disabled
     pci 0001:01:01.0: BAR 0 [mem 0xee0c0000-0xee0c0fff]: assigned
     pci 0001:01:02.0: BAR 0 [mem 0xee0c1000-0xee0c10ff]: assigned
     pci_bus 0001:01: resource 4 [mem 0xee0c0000-0xee0cffff]
     pci 0001:01:01.0: enabling device (0140 -> 0142)
     pci 0001:01:02.0: enabling device (0140 -> 0142)

> You didn't report any issues beyond textual changes in the log, I suppose
> there were none beyond the log differences?

Sorry, I should have done a little bit more testing.  This is the funny
on-chip Renesas R-Car Gen2 PCI host controller with integrated OHCI/EHCI
PCI devices.  I don't have any USB devices connected, but "lspci -v"
output is the same before/after, and the OHCI/EHCI drivers probe fine.

BTW, I am seeing similar changes on rts7751r2d (qemu SuperH target r2d):

     PCI host bridge to bus 0000:00
     pci_bus 0000:00: root bus resource [io  0x1000-0x3fffff]
     pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfdffffff]
     pci_bus 0000:00: No busn resource found for root bus, will use [bus 00=
-ff]
     pci 0000:00:00.0: [1054:350e] type 00 class 0x060000 conventional
PCI endpoint
     pci 0000:00:00.0: [Firmware Bug]: BAR 0: invalid; can't size
     pci 0000:00:00.0: [Firmware Bug]: BAR 1: invalid; can't size
     pci 0000:00:00.0: [Firmware Bug]: BAR 2: invalid; can't size
     pci 0000:00:02.0: [10ec:8139] type 00 class 0x020000 conventional
PCI endpoint
    -pci 0000:00:02.0: BAR 0 [io  0x0000-0x00ff]
    -pci 0000:00:02.0: BAR 1 [mem 0x00000000-0x000000ff]
    -pci 0000:00:02.0: ROM [mem 0x00000000-0x0007ffff pref]
    +pci 0000:00:02.0: BAR 0 [io  0x0000-0x00ff]: no initial claim (no wind=
ow)
    +pci 0000:00:02.0: BAR 0 [io  size 0x0100]
    +pci 0000:00:02.0: BAR 1 [mem 0x00000000-0x000000ff]: no initial
claim (no window)
    +pci 0000:00:02.0: BAR 1 [mem size 0x00000100]
    +pci 0000:00:02.0: ROM [mem 0x00000000-0x0007ffff pref]: no
initial claim (no window)
    +pci 0000:00:02.0: ROM [mem size 0x00080000 pref]
     pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
     pci 0000:00:02.0: ROM [mem 0xfd000000-0xfd07ffff pref]: assigned
     pci 0000:00:02.0: BAR 0 [io  0x1000-0x10ff]: assigned
     pci 0000:00:02.0: BAR 1 [mem 0xfd080000-0xfd0800ff]: assigned

All of these look legitimate to me, as they all start at zero.

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds


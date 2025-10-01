Return-Path: <linux-renesas-soc+bounces-22529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A237BB0A60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 16:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFE12167BDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 14:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0842430171B;
	Wed,  1 Oct 2025 14:08:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37122AF03
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759327736; cv=none; b=ShQiJ1GwGF0Bv+TAT4g2MX9z3vEAlw/+dYcl5kzZ/CNW9puNECjT8VF0jt9OvHYlJq+42AQkKaTEkHe9aY+HpqjXm19ibv8VMxntF9G76OXyla34VFcsemIJZDB11eyJloz4MKF7Qya/w2J1mhFQ/FSOlqZWzs1HR7K9dvp9U5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759327736; c=relaxed/simple;
	bh=aVjm7nsSk3MpK0Ybz2S8XwhrZGlGiGMKP0ozCtx1Fug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHZlZu+ISLT3Cd+26YnpXC52dUIOukXNIw5cIsY13LzM06zi5uuJRLybKz+9aaRTB7uBVdnn4VIQVuN74TEqdxhqjjgh1cj/D6xLXY15reDXWKLMSniC1OEOToYN2IpXQnUVje/4Ef3+dxzb/vd7JhLLOi7X8fTLB2W7SIz1E3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5a7b2a6b13bso6407010137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 07:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759327734; x=1759932534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz5PdUboJ1NmOVuSbpHG255Mw2uRB3+8MjK6aZSUD/Q=;
        b=eAKQIHE5fTid9tovKT/Jmdr7TymDuDSMlMy+BH7Eu40T6j4IL5awK/oeHZzwvm8AEg
         DDjAOyKeaLoDBGDZ7UJrhm2CQ3VkjfSuxjnGFmZzApqOb7eg3tHS1fINVw5k7GeqFUdR
         6BK27WFpv7iHSvcZeO/BtzmIDnM4wIbjio5ut6LqM6WR/ld/TQptejo/EiJIQ4G89qt6
         EZNDtkpD7qjQnQzUHYAqo0nyAPM0BfQf+ac7kBnlNun9rlmpKQ7vo2QKoai7qmk9QoYe
         gJAdGa7gNGscySoI4DAFDX16EhCBbXCvICkehYPEPeNYMDdYy0gweGzwXYX90coNvp/9
         zYFg==
X-Forwarded-Encrypted: i=1; AJvYcCWSEgnSveghB2qloqxhbN4iW+4NdpSLzStmMgMiUyZelmCZU3t3pTUBLc3iPTgxwrQ2XJ7JwcMJjwMQXKvNfRaOFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRFsWU+I5rtSrQZlMNFxaN+9Jyc/D4WEIp+wPqVG9PbmL6Q4Ag
	9U8TFAxio2uGjnCEP2nzSWGedh4huXwAsfkP7utRPRi8WO3Xsl7OTfQ9BerqPk2o
X-Gm-Gg: ASbGnct4VMn4dhcY9kh1BlI/oJ2izZDJg8mK/JfP97n3Dhekb+QY4nK6XlgqvCLtqM8
	ZToN5zV4r0k3Bd73dCrQtXL0lLXFfYiko16reVULmX376nWmV1iYGARPRE0xCFoctmK8Foyyq5r
	TDS9FftxAaANSqKr9e1L95s0epZwFNppR1lvD1V6DCu0rb8gngfv7tJQYhS7o2C7t9Kl6mMiRfp
	sSngvz0EO6G6/kmzAbn7UZFjZ6gXq5hBXe+/l26EEQP5tevNRShMyZidRDHc3X6eVZa6pSfARNt
	B64d0TRUGBM08j2P7rcfrPhrsAdBU1VYZdA3hq8clkAyFTyBXgLZeUtJq3a9LhVu6ZMaqf4Qh6n
	FdowjcXLCOYHRzJpyaitUKlDORP8RokUMzcy0G4qdpzRp5H+18tcIeHd8/s6RDx8L950LcIfIqM
	uTDo0uGWY1
X-Google-Smtp-Source: AGHT+IFg3KPuIQFVxqS7dF2UezaujFLo7rpfLUoCqHtEDPmaKMbZVtXjWGrcMxeTGEhDV20QZmQPdg==
X-Received: by 2002:a05:6102:3711:b0:5c8:c906:e3c1 with SMTP id ada2fe7eead31-5d3fe69854dmr1598330137.17.1759327733501;
        Wed, 01 Oct 2025 07:08:53 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3182b293sm5505436137.6.2025.10.01.07.08.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 07:08:52 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ce093debf6so2794588137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 07:08:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXD2a0nDMvaxEhtVYXWmQVQJsla7a0tRcRQmrwVic4sJSUFBOOhHVQuXY+jz8HO9e3KaQoDG+oly4ga4/7FubbfmA==@vger.kernel.org
X-Received: by 2002:a05:6102:1629:b0:520:dbc0:6ac4 with SMTP id
 ada2fe7eead31-5d3fe4e4d01mr1726266137.2.1759327732025; Wed, 01 Oct 2025
 07:08:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924134228.1663-1-ilpo.jarvinen@linux.intel.com>
 <20250924134228.1663-3-ilpo.jarvinen@linux.intel.com> <CAMuHMdVtVzcL3AX0uetNhKr-gLij37Ww+fcWXxnYpO3xRAOthA@mail.gmail.com>
 <4c28cd58-fd0d-1dff-ad31-df3c488c464f@linux.intel.com> <CAMuHMdUbaQDXsowZETimLJ-=gLCofeP+LnJp_txetuBQ0hmcPQ@mail.gmail.com>
 <c17c5ec1-132d-3588-2a4d-a0e6639cf748@linux.intel.com>
In-Reply-To: <c17c5ec1-132d-3588-2a4d-a0e6639cf748@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Oct 2025 16:08:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbyKdzbptA10F82Oj=6ktxnGAk4fz7dBLVdxALb8-WWg@mail.gmail.com>
X-Gm-Features: AS18NWDSe69_JEeKgA8QttkxMcLIXMbSn-oNZuqPwYgxLktm1Z3rr1fy86KWDUc
Message-ID: <CAMuHMdVbyKdzbptA10F82Oj=6ktxnGAk4fz7dBLVdxALb8-WWg@mail.gmail.com>
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

On Wed, 1 Oct 2025 at 15:06, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Wed, 1 Oct 2025, Geert Uytterhoeven wrote:
> > On Tue, 30 Sept 2025 at 18:32, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > > On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:
> > > > On Fri, 26 Sept 2025 at 04:40, Ilpo J=C3=A4rvinen
> > > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > > > PNP resources are checked for conflicts with the other resource i=
n the
> > > > > system by quirk_system_pci_resources() that walks through all PCI
> > > > > resources. quirk_system_pci_resources() correctly filters out res=
ource
> > > > > with IORESOURCE_UNSET.
> > > > >
> > > > > Resources that do not reside within their bridge window, however,=
 are
> > > > > not properly initialized with IORESOURCE_UNSET resulting in bogus
> > > > > conflicts detected in quirk_system_pci_resources():
> > > > >
> > > > > pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0x1fffffff 64bit pref]
> > > > > pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0xdfffffff 64bit pref]=
: contains BAR 2 for 7 VFs
> > > > > ...
> > > > > pci 0000:03:00.0: VF BAR 2 [mem 0x00000000-0x1ffffffff 64bit pref=
]
> > > > > pci 0000:03:00.0: VF BAR 2 [mem 0x00000000-0x3dffffffff 64bit pre=
f]: contains BAR 2 for 31 VFs
> > > > > ...
> > > > > pnp 00:04: disabling [mem 0xfc000000-0xfc00ffff] because it overl=
aps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xc0000000-0xcfffffff] because it overl=
aps 0000:00:02.0 BAR 9 [mem 0x00000000-0xdfffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xfedc0000-0xfedc7fff] because it overl=
aps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xfeda0000-0xfeda0fff] because it overl=
aps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xfeda1000-0xfeda1fff] because it overl=
aps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xc0000000-0xcfffffff disabled] because=
 it overlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xfed20000-0xfed7ffff] because it overl=
aps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xfed90000-0xfed93fff] because it overl=
aps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xfed45000-0xfed8ffff] because it overl=
aps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > pnp 00:05: disabling [mem 0xfee00000-0xfeefffff] because it overl=
aps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > >
> > > > > Mark resources that are not contained within their bridge window =
with
> > > > > IORESOURCE_UNSET in __pci_read_base() which resolves the false
> > > > > positives for the overlap check in quirk_system_pci_resources().
> > > > >
> > > > > Fixes: f7834c092c42 ("PNP: Don't check for overlaps with unassign=
ed PCI BARs")
> > > > > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > >
> > > > Thanks for your patch, which is now commit 06b77d5647a4d6a7 ("PCI:
> > > > Mark resources IORESOURCE_UNSET when outside bridge windows") in
> > > > linux-next/master next-20250929 pci/next
> >
> > > > This replaces the actual resources by their sizes in the boot log o=
n
> > > > e.g. on R-Car M2-W:
> > > >
> > > >      pci-rcar-gen2 ee090000.pci: host bridge /soc/pci@ee090000 rang=
es:
> > > >      pci-rcar-gen2 ee090000.pci:      MEM 0x00ee080000..0x00ee08fff=
f -> 0x00ee080000
> > > >      pci-rcar-gen2 ee090000.pci: PCI: revision 11
> > > >      pci-rcar-gen2 ee090000.pci: PCI host bridge to bus 0000:00
> > > >      pci_bus 0000:00: root bus resource [bus 00]
> > > >      pci_bus 0000:00: root bus resource [mem 0xee080000-0xee08ffff]
> > > >      pci 0000:00:00.0: [1033:0000] type 00 class 0x060000 conventio=
nal PCI endpoint
> > > >     -pci 0000:00:00.0: BAR 0 [mem 0xee090800-0xee090bff]
> > > >     -pci 0000:00:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]
> > >
> > > What is going to be the parent of these resources? They don't seem to=
 fall
> > > under the root bus resource above in which case the output change is
> > > intentional so they don't appear as if address range would be "okay".
> >
> > >From /proc/iomem:
> >
> >     ee080000-ee08ffff : pci@ee090000
> >       ee080000-ee080fff : 0000:00:01.0
> >         ee080000-ee080fff : ohci_hcd
> >       ee081000-ee0810ff : 0000:00:02.0
> >         ee081000-ee0810ff : ehci_hcd
> >     ee090000-ee090bff : ee090000.pci pci@ee090000
>
> Okay, so this seem to appear in the resource tree but not among the root
> bus resources.
>
> >     ee0c0000-ee0cffff : pci@ee0d0000
> >       ee0c0000-ee0c0fff : 0001:01:01.0
> >         ee0c0000-ee0c0fff : ohci_hcd
> >       ee0c1000-ee0c10ff : 0001:01:02.0
> >         ee0c1000-ee0c10ff : ehci_hcd
> >
> > > When IORESOURCE_UNSET is set in a resource, %pR does not print the st=
art
> > > and end addresses.
> >
> > Yeah, that's how I found this commit, without bisecting ;-)
> >
> > > >     +pci 0000:00:00.0: BAR 0 [mem size 0x00000400]
> > > >     +pci 0000:00:00.0: BAR 1 [mem size 0x40000000 pref]
> > > >      pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310 conventio=
nal PCI endpoint
> > > >     -pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x00000fff]
> > > >     +pci 0000:00:01.0: BAR 0 [mem size 0x00001000]
> > >
> > > For this resource, it's very much intentional. It's a zero-based BAR =
which
> > > was left without IORESOURCE_UNSET prior to my patch leading to others=
 part
> > > of the kernel to think that resource range valid and in use (in your
> > > case it's so small it wouldn't collide with anything but it wasn't
> > > properly set up resource, nonetheless).
> > >
> > > >      pci 0000:00:01.0: supports D1 D2
> > > >      pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
> > > >      pci 0000:00:02.0: [1033:00e0] type 00 class 0x0c0320 conventio=
nal PCI endpoint
> > > >     -pci 0000:00:02.0: BAR 0 [mem 0x00000000-0x000000ff]
> > > >     +pci 0000:00:02.0: BAR 0 [mem size 0x00000100]
> > >
> > > And this as well is very much intentional.
> > >
> > > >      pci 0000:00:02.0: supports D1 D2
> > > >      pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot
> > > >      PCI: bus0: Fast back to back transfers disabled
> > > >      pci 0000:00:01.0: BAR 0 [mem 0xee080000-0xee080fff]: assigned
> > > >      pci 0000:00:02.0: BAR 0 [mem 0xee081000-0xee0810ff]: assigned
> > > >      pci_bus 0000:00: resource 4 [mem 0xee080000-0xee08ffff]
> > > >
> > > > Is that intentional?
> > >
> > > There's also that pci_dbg() in the patch which would show the origina=
l
> > > addresses (print the resource before setting IORESOURCE_UNSET) but to=
 see
> > > it one would need to enable it with dyndbg=3D... Bjorn was thinking o=
f
> > > making that pci_info() though so it would appear always.
> > >
> > > Was this the entire PCI related diff? I don't see those 0000:00:00.0 =
BARs
> > > getting assigned anywhere.
> >
> > The above log is almost complete (lacked enabling the device afterwards=
).
> >
> > AFAIU, the BARs come from the reg and ranges properties in the
> > PCI controller nodes;
> > https://elixir.bootlin.com/linux/v6.17/source/arch/arm/boot/dts/renesas=
/r8a7791.dtsi#L1562
>
> Thanks, although I had already found this line by grep. I was just
> expecting the address appear among root bus resources too.
>
> Curiously enough, pci_register_host_bridge() seems to try to add some
> resource from that list into bus and it's what prints those "root bus
> resource" lines and ee090000 is not among the printed lines despite
> appearing in /proc/iomem. As is, the resource tree and PCI bus view on th=
e
> resources seems to be in disagreement and I'm not sure what to make of it=
.
>
> But before considering going into that direction or figuring out why this
> ee090000 resource does not appear among root bus resources, could you
> check if the attached patch changes behavior for the resource which are
> non-zero based?

This patch has no impact on dmesg, lspci output, or /proc/iomem
for pci-rcar-gen2.

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


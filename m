Return-Path: <linux-renesas-soc+bounces-22605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B38BB44F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 17:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15DF67A34B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 15:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0E51A23A6;
	Thu,  2 Oct 2025 15:25:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129A1A08A3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759418755; cv=none; b=esPmzM7i+Z9QFv9At7JviXWpSLslU1q42B5CnYdvBqDzxktkQdGd858GpBXUS148q/z+qSe+HctgbJYeiEtyOxtulyj2AhS59RARYL6+0nlKTEidNLSkqAcdXEzzWUg4vcgqqYqxpJENyUtbqDXqwIQXSzfPaUo5Ak4QkM0Uwt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759418755; c=relaxed/simple;
	bh=tuleJSYEZV9H0eGXztkjQNYKmRJsk8ihN1y9jFLlUNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwAydJrMSQhbTlm3dOEwsHCiBi1sy3Wl71tM7ru8y1Di4Hkf5XI6/ywKi3GNWRlLToi5YzowPLoiy+7zheJgP3PUqOtxKmve2cYwINMwpgN/Ft2e1+pvVirylwY5uUXl/gVannTTAXr7rqyGOm5MOt65pYYINRuUrsznxssBxHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5a0d17db499so1053776137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 08:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759418752; x=1760023552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1ZlqKvQIio6X94O+OcI5aT5PJLZzEvKbZn8d+abPTY=;
        b=ZsK5h/EMUnsVS9sKRtB8oTAZYo0mcvB7kj/7rbCLygOBPtb26vSyBc4i4dm9J15/aC
         wmMTBmEn6YdzceNPcRG5Mk0Fdm5u3DDHCosVeI4lee5Rkil9bnYawZaMPmVwTLlkUgWE
         oIXzaCogzj+YJEptWr7ZFJHogfmS+Dpw68HbQlXBy/SSvbvi2F/gfiY+7RAhosLHoVjI
         ce53Jiv7iFGzIZ4bV/sxToPKOqxHKM2mK5jzBLainhPg28XCA5MrCBae1A4bo68KwFUv
         BBz86utCzoYZ3uO2VzTLTmvQ9MrbiwJvb/fJdRXbOtSBn6qweaDsrlhwz3atq8FweH93
         znIw==
X-Forwarded-Encrypted: i=1; AJvYcCU+ldKPT0541U2pOlihxRQxeNMV2Vp+Bw63Lo303X3Rl4FB1mwGBXfWDAgFAaRaEsJ823gwTgPf7qlfkZitkTTdAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPc8KqOj0v/Xe/EUG313NCsGNcNyxeA0ysL0fVtLcTBrpV0hs8
	GZC7PyVoEur94yG0XBL//t1PK0za68UtHeMKQG1ZrdrmgBcOlJLju4E84aXerFwVLUs=
X-Gm-Gg: ASbGncvyxOr0L8unS+QLmoCFuGnbuioGpBcg3bZXU15ofpy3YItk2CCEg5sLiMd7MZ0
	f+J13I3KpZcmPmHbOqM716RozmDA/+qGIpJHOn2NWwTEVKbjBzdQETWqcjFApVnEn7esH9H1T5t
	m7eAyV7bchinUJ8zaRpTz0zsdIgUGJj+T3CiZqGyNfll5FJOJzBW6MlpB0B6W0cNDmJ3lMY4prk
	WRVnC6I+lXEJu7YFbC5SRfeSBdvlTMS53AlozHUmgqMjzQxbP60ZNn70DrLNpFtxU1jxIx09Mco
	IdEZ4omHYCMktwpi3LXcPp67M/WIs6PvzGyZJyoBfaGl6QglUvILCKZcUqb3rZ94pSEqf94tDYX
	3DheWHh+Agd5gUMo+QG6rtK01501f30tqMmjH+WNwbBLdy7ct6kOp4PRYtUgW8P7eocMYOY7Psd
	hRDPmeqUzWO1o+I/l9b3g=
X-Google-Smtp-Source: AGHT+IF0wkmopQhZf0fcLnsrYUouNzxLvuHRsj3DlPQUPI1s6gQgd7bG7/MozOpNTmXDhx8S3SmpYg==
X-Received: by 2002:a05:6102:3051:b0:52a:ce7e:35c1 with SMTP id ada2fe7eead31-5d3fe51f79cmr4007658137.11.1759418751513;
        Thu, 02 Oct 2025 08:25:51 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92eb4ea7e43sm538086241.13.2025.10.02.08.25.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 08:25:50 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8d02f793882so708812241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 08:25:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCURrkFQM0Y7qsy6hIoXzqQBf6Wj7w7HnmJAW3Dn2FToIsFGTIaAS/9a6E2hq9huVjhhF8fSeLhF5MUI/faUp4Zg0g==@vger.kernel.org
X-Received: by 2002:a05:6102:dcf:b0:51a:4916:c5f0 with SMTP id
 ada2fe7eead31-5d3fe737665mr3484996137.32.1759418750151; Thu, 02 Oct 2025
 08:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924134228.1663-1-ilpo.jarvinen@linux.intel.com>
 <20250924134228.1663-3-ilpo.jarvinen@linux.intel.com> <CAMuHMdVtVzcL3AX0uetNhKr-gLij37Ww+fcWXxnYpO3xRAOthA@mail.gmail.com>
 <4c28cd58-fd0d-1dff-ad31-df3c488c464f@linux.intel.com> <CAMuHMdUbaQDXsowZETimLJ-=gLCofeP+LnJp_txetuBQ0hmcPQ@mail.gmail.com>
 <c17c5ec1-132d-3588-2a4d-a0e6639cf748@linux.intel.com> <CAMuHMdVbyKdzbptA10F82Oj=6ktxnGAk4fz7dBLVdxALb8-WWg@mail.gmail.com>
 <2d5e9b78-8a90-3035-ff42-e881d61f4b7c@linux.intel.com>
In-Reply-To: <2d5e9b78-8a90-3035-ff42-e881d61f4b7c@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Oct 2025 17:25:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_tPmQd=9dCzNs+dEt3fHNsYpYPFnT6QZk546o-J-y9g@mail.gmail.com>
X-Gm-Features: AS18NWBx7nn-InGOxzMWXsu2VdqMD1K68JnDmfnpzuUVMgGYCL6YgCGiqChs9kY
Message-ID: <CAMuHMdU_tPmQd=9dCzNs+dEt3fHNsYpYPFnT6QZk546o-J-y9g@mail.gmail.com>
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

On Thu, 2 Oct 2025 at 16:54, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Wed, 1 Oct 2025, Geert Uytterhoeven wrote:
> > On Wed, 1 Oct 2025 at 15:06, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > > On Wed, 1 Oct 2025, Geert Uytterhoeven wrote:
> > > > On Tue, 30 Sept 2025 at 18:32, Ilpo J=C3=A4rvinen
> > > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > > > On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:
> > > > > > On Fri, 26 Sept 2025 at 04:40, Ilpo J=C3=A4rvinen
> > > > > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > > > > > PNP resources are checked for conflicts with the other resour=
ce in the
> > > > > > > system by quirk_system_pci_resources() that walks through all=
 PCI
> > > > > > > resources. quirk_system_pci_resources() correctly filters out=
 resource
> > > > > > > with IORESOURCE_UNSET.
> > > > > > >
> > > > > > > Resources that do not reside within their bridge window, howe=
ver, are
> > > > > > > not properly initialized with IORESOURCE_UNSET resulting in b=
ogus
> > > > > > > conflicts detected in quirk_system_pci_resources():
> > > > > > >
> > > > > > > pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0x1fffffff 64bit p=
ref]
> > > > > > > pci 0000:00:02.0: VF BAR 2 [mem 0x00000000-0xdfffffff 64bit p=
ref]: contains BAR 2 for 7 VFs
> > > > > > > ...
> > > > > > > pci 0000:03:00.0: VF BAR 2 [mem 0x00000000-0x1ffffffff 64bit =
pref]
> > > > > > > pci 0000:03:00.0: VF BAR 2 [mem 0x00000000-0x3dffffffff 64bit=
 pref]: contains BAR 2 for 31 VFs
> > > > > > > ...
> > > > > > > pnp 00:04: disabling [mem 0xfc000000-0xfc00ffff] because it o=
verlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > > > pnp 00:05: disabling [mem 0xc0000000-0xcfffffff] because it o=
verlaps 0000:00:02.0 BAR 9 [mem 0x00000000-0xdfffffff 64bit pref]
> > > > > > > pnp 00:05: disabling [mem 0xfedc0000-0xfedc7fff] because it o=
verlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > > > pnp 00:05: disabling [mem 0xfeda0000-0xfeda0fff] because it o=
verlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > > > pnp 00:05: disabling [mem 0xfeda1000-0xfeda1fff] because it o=
verlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > > > pnp 00:05: disabling [mem 0xc0000000-0xcfffffff disabled] bec=
ause it overlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref=
]
> > > > > > > pnp 00:05: disabling [mem 0xfed20000-0xfed7ffff] because it o=
verlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > > > pnp 00:05: disabling [mem 0xfed90000-0xfed93fff] because it o=
verlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > > > pnp 00:05: disabling [mem 0xfed45000-0xfed8ffff] because it o=
verlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > > > pnp 00:05: disabling [mem 0xfee00000-0xfeefffff] because it o=
verlaps 0000:03:00.0 BAR 9 [mem 0x00000000-0x3dffffffff 64bit pref]
> > > > > > >
> > > > > > > Mark resources that are not contained within their bridge win=
dow with
> > > > > > > IORESOURCE_UNSET in __pci_read_base() which resolves the fals=
e
> > > > > > > positives for the overlap check in quirk_system_pci_resources=
().
> > > > > > >
> > > > > > > Fixes: f7834c092c42 ("PNP: Don't check for overlaps with unas=
signed PCI BARs")
> > > > > > > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.=
com>
> > > > > >
> > > > > > Thanks for your patch, which is now commit 06b77d5647a4d6a7 ("P=
CI:
> > > > > > Mark resources IORESOURCE_UNSET when outside bridge windows") i=
n
> > > > > > linux-next/master next-20250929 pci/next
> > > >
> > > > > > This replaces the actual resources by their sizes in the boot l=
og on
> > > > > > e.g. on R-Car M2-W:
> > > > > >
> > > > > >      pci-rcar-gen2 ee090000.pci: host bridge /soc/pci@ee090000 =
ranges:
> > > > > >      pci-rcar-gen2 ee090000.pci:      MEM 0x00ee080000..0x00ee0=
8ffff -> 0x00ee080000
> > > > > >      pci-rcar-gen2 ee090000.pci: PCI: revision 11
> > > > > >      pci-rcar-gen2 ee090000.pci: PCI host bridge to bus 0000:00
> > > > > >      pci_bus 0000:00: root bus resource [bus 00]
> > > > > >      pci_bus 0000:00: root bus resource [mem 0xee080000-0xee08f=
fff]
> > > > > >      pci 0000:00:00.0: [1033:0000] type 00 class 0x060000 conve=
ntional PCI endpoint
> > > > > >     -pci 0000:00:00.0: BAR 0 [mem 0xee090800-0xee090bff]
> > > > > >     -pci 0000:00:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]
> > > > >
> > > > > What is going to be the parent of these resources? They don't see=
m to fall
> > > > > under the root bus resource above in which case the output change=
 is
> > > > > intentional so they don't appear as if address range would be "ok=
ay".
> > > >
> > > > >From /proc/iomem:
> > > >
> > > >     ee080000-ee08ffff : pci@ee090000
> > > >       ee080000-ee080fff : 0000:00:01.0
> > > >         ee080000-ee080fff : ohci_hcd
> > > >       ee081000-ee0810ff : 0000:00:02.0
> > > >         ee081000-ee0810ff : ehci_hcd
> > > >     ee090000-ee090bff : ee090000.pci pci@ee090000
> > >
> > > Okay, so this seem to appear in the resource tree but not among the r=
oot
> > > bus resources.
> > >
> > > >     ee0c0000-ee0cffff : pci@ee0d0000
> > > >       ee0c0000-ee0c0fff : 0001:01:01.0
> > > >         ee0c0000-ee0c0fff : ohci_hcd
> > > >       ee0c1000-ee0c10ff : 0001:01:02.0
> > > >         ee0c1000-ee0c10ff : ehci_hcd
> > > >
> > > > > When IORESOURCE_UNSET is set in a resource, %pR does not print th=
e start
> > > > > and end addresses.
> > > >
> > > > Yeah, that's how I found this commit, without bisecting ;-)
> > > >
> > > > > >     +pci 0000:00:00.0: BAR 0 [mem size 0x00000400]
> > > > > >     +pci 0000:00:00.0: BAR 1 [mem size 0x40000000 pref]
> > > > > >      pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310 conve=
ntional PCI endpoint
> > > > > >     -pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x00000fff]
> > > > > >     +pci 0000:00:01.0: BAR 0 [mem size 0x00001000]
> > > > >
> > > > > For this resource, it's very much intentional. It's a zero-based =
BAR which
> > > > > was left without IORESOURCE_UNSET prior to my patch leading to ot=
hers part
> > > > > of the kernel to think that resource range valid and in use (in y=
our
> > > > > case it's so small it wouldn't collide with anything but it wasn'=
t
> > > > > properly set up resource, nonetheless).
> > > > >
> > > > > >      pci 0000:00:01.0: supports D1 D2
> > > > > >      pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
> > > > > >      pci 0000:00:02.0: [1033:00e0] type 00 class 0x0c0320 conve=
ntional PCI endpoint
> > > > > >     -pci 0000:00:02.0: BAR 0 [mem 0x00000000-0x000000ff]
> > > > > >     +pci 0000:00:02.0: BAR 0 [mem size 0x00000100]
> > > > >
> > > > > And this as well is very much intentional.
> > > > >
> > > > > >      pci 0000:00:02.0: supports D1 D2
> > > > > >      pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot
> > > > > >      PCI: bus0: Fast back to back transfers disabled
> > > > > >      pci 0000:00:01.0: BAR 0 [mem 0xee080000-0xee080fff]: assig=
ned
> > > > > >      pci 0000:00:02.0: BAR 0 [mem 0xee081000-0xee0810ff]: assig=
ned
> > > > > >      pci_bus 0000:00: resource 4 [mem 0xee080000-0xee08ffff]
> > > > > >
> > > > > > Is that intentional?
> > > > >
> > > > > There's also that pci_dbg() in the patch which would show the ori=
ginal
> > > > > addresses (print the resource before setting IORESOURCE_UNSET) bu=
t to see
> > > > > it one would need to enable it with dyndbg=3D... Bjorn was thinki=
ng of
> > > > > making that pci_info() though so it would appear always.
> > > > >
> > > > > Was this the entire PCI related diff? I don't see those 0000:00:0=
0.0 BARs
> > > > > getting assigned anywhere.
> > > >
> > > > The above log is almost complete (lacked enabling the device afterw=
ards).
> > > >
> > > > AFAIU, the BARs come from the reg and ranges properties in the
> > > > PCI controller nodes;
> > > > https://elixir.bootlin.com/linux/v6.17/source/arch/arm/boot/dts/ren=
esas/r8a7791.dtsi#L1562
> > >
> > > Thanks, although I had already found this line by grep. I was just
> > > expecting the address appear among root bus resources too.
> > >
> > > Curiously enough, pci_register_host_bridge() seems to try to add some
> > > resource from that list into bus and it's what prints those "root bus
> > > resource" lines and ee090000 is not among the printed lines despite
> > > appearing in /proc/iomem. As is, the resource tree and PCI bus view o=
n the
> > > resources seems to be in disagreement and I'm not sure what to make o=
f it.
> > >
> > > But before considering going into that direction or figuring out why =
this
> > > ee090000 resource does not appear among root bus resources, could you
> > > check if the attached patch changes behavior for the resource which a=
re
> > > non-zero based?
> >
> > This patch has no impact on dmesg, lspci output, or /proc/iomem
> > for pci-rcar-gen2.
>
> It would have been too easy... :-(
>
> I'm sorry I don't really know these platform well and I'm currently tryin=
g
> to understand what adds that ee090000 resource into the resource tree
> and so far I've not been very successful.
>
> Perhaps it would be easiest to print a stacktrace when the resource is
> added but there are many possible functions. I think all of them
> converge in __request_resource() so I suggest adding:
>
> WARN_ON(new->start =3D=3D 0xee090000);
>
> before __request_resource() does anything.

    Call trace:
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x7c/0xb0
     dump_stack_lvl from __warn+0x80/0x198
     __warn from warn_slowpath_fmt+0xc0/0x124
     warn_slowpath_fmt from __request_resource+0x38/0xc8
     __request_resource from __request_region+0xc4/0x1e8
     __request_region from __devm_request_region+0x80/0xac
     __devm_request_region from __devm_ioremap_resource+0xcc/0x160
     __devm_ioremap_resource from rcar_pci_probe+0x58/0x350
     rcar_pci_probe from platform_probe+0x58/0x90

I.e. the call to devm_platform_get_and_ioremap_resource() in
drivers/pci/controller/pci-rcar-gen2.c:rcar_pci_probe().

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


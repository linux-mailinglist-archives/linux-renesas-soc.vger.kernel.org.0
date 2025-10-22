Return-Path: <linux-renesas-soc+bounces-23411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557EBFAA7B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 09:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BDD93A2440
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 07:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4493226E71E;
	Wed, 22 Oct 2025 07:45:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6460C2586C8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119141; cv=none; b=T42WKxa+kCfKxSDqXUgBJlx6ozVLURjXM5comKDVXtaipx6PLDrzOLKHxdiphYdAXL6pCI8+VmUamoMJ8yah/NPIDpQDEVxHQ5H+8C16jssIymQluZNs1eXwFvwVly1aj7Om546qcbw486Q0ZJrIjdmF7D/oAN9E2Gu2t0VKigU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119141; c=relaxed/simple;
	bh=a/T04ZkBonHaSj9LogmYs7O4+MD77IySVFh8zs9QLDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPH6TCVOMYVeWy1oUcXdNnuMAbM11IbQ/tjBLCaYcK6XWuhcZJvxmZS4c1t9NytAlofW1Z9G6s3h/nDcVAAJau6sqRuws4lMuiKQvhyw4ZIjy+4BsEdPWYB5MZ2kjrTgf7qWV5Ek4HQm7L3ULxjJ9kIBD0QuuVNMhmlCwESi41o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so2839268e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 00:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761119138; x=1761723938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAdjmTMFvX9GF5gAa+D8JhWfn0fgYJ2cKUltMzt7uhw=;
        b=b/b099tmpW4sJExF1Ayq5338aE6dPxckUQ6RqGCauAW55+b3yPS80CGxSzq/lFQw2E
         PiGyw0Lrj2yCAw0wj8a5ZCYoauV39TnPFQvoWaOTZFi65JLLX7urSDKYn8bPWfl9zCVi
         2uXohp8vh5VRbR5hVIKP5cbk750k5ULy7yFnavrVsYIz3f6RXMN/TNh7FdwRl9SA4mdU
         TqzyRbj1niKiIaQY5EsTi21flOCw4z/BfLLvkz6c52JLcoTSrVmH4MpiFjJQUU02+skv
         bURA7PVZaRbL4FnndKbzKURAgw1wJwd6sU98OMG7FdFO3HDFsKzL4SVHk7Q6ycixMSFf
         6/mA==
X-Forwarded-Encrypted: i=1; AJvYcCXkQAQTxSxR3hAwG6dJa+IuD1h1zHyBxDc+cJABPKgFz8prEU3govKtDJok4LZm+U8seBTyW8U3J1JpH91khaGlqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJTn7mTsQAqB6xmSmS7lbVfk6eirYUIQfNF+wPqVeEom7CIxBd
	dWWc6DdbzRf2l7loE+W2V0XXdjSycbXXmitPKgvOx1g43fAaEJglWnSunMaWRsbo
X-Gm-Gg: ASbGncuGCnuCrawmN237U66g9viVvIkDtJPH+6RcCJhG3iR2ouxnSFKhrNM+XXEg3Jc
	fYTBpaiBbaC2J1+CnrJcdk6T1yZOElMY44k9IClgFuQNzA6Zj/EPbeGzdj//hEazCQKxyowdmL1
	nO80fbRSfJ/hACLHuOgfaH82wp4thkXO6YPH1ZKc4SW39jZB+jYqswnIFMhYtcZbz6ATRTHcb1S
	LBMhPuSBnk0LqqX6KmQL6bOZTpQbifZxcJMJ22BDWtiN9oiehrufLyn7G4m/BVGDwZOU9yjg6/3
	OJqw+vkXaovE5c8gAgSIkv7uPYA7ZGJijPCDPdqelKYGr8b/itqZHKP9YsvXbVY8b8evyC/D0Pz
	zbf6G8C6IbXXbsZzJmVN80yOeJgC9jwwDA9ojLXDVm9lNpHU9ATnj1sMTd2uBHqZo6sCL13lx4Y
	l9e2ytDHW+vuA8Lw8rMWZmtwYuUNG5eKnpkpBiab8CLx15T6Fnvv/K3iMiZg0=
X-Google-Smtp-Source: AGHT+IF8NoxlzVjVx+mJGHpBGFTd7mzYUq86mQhbBkKQvsi7KCxFpwEvwQGhq1Z6N5KF5YgvbWoATA==
X-Received: by 2002:a05:6122:2203:b0:53c:6d68:1cd0 with SMTP id 71dfb90a1353d-5564eedf7cemr5965132e0c.14.1761119138083;
        Wed, 22 Oct 2025 00:45:38 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5568319eb26sm2066547e0c.25.2025.10.22.00.45.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 00:45:37 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-91bdf1a4875so1838170241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 00:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIce3srV7auFB3w1Mp+6NHCElYEqGdHWr9HdNyoK05VvVi/sDo2qmKR4w4IjIOmU5XErpeIKEGmSGgNH6PT4BSng==@vger.kernel.org
X-Received: by 2002:a05:6102:f09:b0:5d5:f6ae:38d1 with SMTP id
 ada2fe7eead31-5db093f61bfmr2258135137.38.1761119137320; Wed, 22 Oct 2025
 00:45:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010144231.15773-1-ilpo.jarvinen@linux.intel.com>
 <CAMuHMdVwAkC0XOU_SZ0HeH0+oT-j5SvKyRcFcJbbes624Yu9uQ@mail.gmail.com>
 <89a20c14-dd0f-22ae-d998-da511a94664a@linux.intel.com> <CAMuHMdUbseFEY8AGOxm2T8W-64qT9OSvfmvu+hyTJUT+WE2cVw@mail.gmail.com>
 <20844374-d3df-cc39-a265-44a3008a3bcb@linux.intel.com>
In-Reply-To: <20844374-d3df-cc39-a265-44a3008a3bcb@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 09:45:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWD_GJ0hpJODBNKeR77UhKMW2CuWWf-xJo2kuL514_Tpw@mail.gmail.com>
X-Gm-Features: AS18NWAyk-xCGiK52nBlQ2ymPt7U7TZu5lcTJpfjk9UqwXEt8Q8nt7D9Ftjb-ak
Message-ID: <CAMuHMdWD_GJ0hpJODBNKeR77UhKMW2CuWWf-xJo2kuL514_Tpw@mail.gmail.com>
Subject: Re: [PATCH 0/3] PCI & resource: Make coalescing host bridge windows safer
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Rob Herring <robh@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Tue, 21 Oct 2025 at 13:54, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Tue, 21 Oct 2025, Geert Uytterhoeven wrote:
> > On Mon, 20 Oct 2025 at 18:20, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > > On Mon, 20 Oct 2025, Geert Uytterhoeven wrote:
> > > > On Fri, 10 Oct 2025 at 16:42, Ilpo J=C3=A4rvinen
> > > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > > > Here's a series for Geert to test if this fixes the improper coal=
escing
> > > > > of resources as was experienced with the pci_add_resource() chang=
e (I
> > > > > know the breaking change was pulled before 6.18 main PR but I'd w=
ant to
> > > > > retry it later once the known issues have been addressed). The ex=
pected
> > > > > result is there'll be two adjacent host bridge resources in the
> > > > > resource tree as the different name should disallow coalescing th=
em
> > > > > together, and therefore BAR0 has a window into which it belongs t=
o.
> > > > >
> > > > > Generic info for the series:
> > > > >
> > > > > PCI host bridge windows were coalesced in place into one of the s=
tructs
> > > > > on the resources list. The host bridge window coalescing code doe=
s not
> > > > > know who holds references and still needs the struct resource it'=
s
> > > > > coalescing from/to so it is safer to perform coalescing into enti=
rely
> > > > > a new struct resource instead and leave the old resource addresse=
s as
> > > > > they were.
> > > > >
> > > > > The checks when coalescing is allowed are also made stricter so t=
hat
> > > > > only resources that have identical the metadata can be coalesced.
> > > > >
> > > > > As a bonus, there's also a bit of framework to easily create kuni=
t
> > > > > tests for resource tree functions (beyond just resource_coalesce(=
)).
> > > > >
> > > > > Ilpo J=C3=A4rvinen (3):
> > > > >   PCI: Refactor host bridge window coalescing loop to use prev
> > > > >   PCI: Do not coalesce host bridge resource structs in place
> > > > >   resource, kunit: add test case for resource_coalesce()
> > > >
> > > > Thanks for your series!
> > > >
> > > > I have applied this on top of commit 06b77d5647a4d6a7 ("PCI:
> > > > Mark resources IORESOURCE_UNSET when outside bridge windows"), and
> > > > gave it a a try on Koelsch (R-Car M2-W).
> > >
> > > So the pci_bus_add_resource() patch to rcar_pci_probe() was not inclu=
ded?
> > > No coalescing would be attempted without that change.
> >
> > Sorry, I didn't realize you wanted that (and anything else) to be
> > included, too.  Please tell me the exact base I should use for testing,
> > and I will give it another run.
>
> I'm sorry, it's indeed a bit confusing as some of these patches never
> have been in Linus' tree.
>
> So I'm interested on what's the result with these changes/series together=
:
>
> [PATCH 1/2] PCI: Setup bridge resources earlier
> [PATCH 2/2] PCI: Resources outside their window must set IORESOURCE_UNSET
> [PATCH 1/1] PCI: rcar-gen2: Add BAR0 into host bridge resources
> [PATCH 1/3] PCI: Refactor host bridge window coalescing loop to use prev
> [PATCH 2/3] PCI: Do not coalesce host bridge resource structs in place
> [PATCH 3/3] resource, kunit: add test case for resource_coalesce()
>
> You might also want to change that pci_dbg() in the IORESOURCE_UNSET patc=
h
> to pci_info() (as otherwise dyndbg is necessary to make it visible).

Thanks, all done:

    $ git cherry -v --abbrev=3D1 v6.18-rc2^
    + 211ddde0 Linux 6.18-rc2
    + 3fdaf2 PCI: Setup bridge resources earlier
    + 5be02e5 PCI: Resources outside their window must set IORESOURCE_UNSET
    + adf6f11 PCI: rcar-gen2: Add BAR0 into host bridge resources
    + eecb500 PCI: Refactor host bridge window coalescing loop to use prev
    + 60470b3 PCI: Do not coalesce host bridge resource structs in place
    + afe3ec resource, kunit: add test case for resource_coalesce()
    + 487c98 Use dev_info() in drivers/pci/probe.c:__pci_read_base()
IORESOURCE_UNSET path

Compared to v6.18-rc2, dmesg changed (for the first PCI/USB instance)
like:

     pci-rcar-gen2 ee090000.pci: host bridge /soc/pci@ee090000 ranges:
     pci-rcar-gen2 ee090000.pci:      MEM 0x00ee080000..0x00ee08ffff
-> 0x00ee080000
     pci-rcar-gen2 ee090000.pci: PCI: revision 11
     pci-rcar-gen2 ee090000.pci: PCI host bridge to bus 0000:00
     pci_bus 0000:00: root bus resource [bus 00]
     pci_bus 0000:00: root bus resource [mem 0xee080000-0xee08ffff]
    +pci_bus 0000:00: root bus resource [mem 0xee090000-0xee090bff]
     pci 0000:00:00.0: [1033:0000] type 00 class 0x060000 conventional
PCI endpoint
     pci 0000:00:00.0: BAR 0 [mem 0xee090800-0xee090bff]
    -pci 0000:00:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]
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
    +pci_bus 0000:00: resource 5 [mem 0xee090000-0xee090bff]
     pci 0000:00:01.0: enabling device (0140 -> 0142)
     pci 0000:00:02.0: enabling device (0140 -> 0142)

> The expected result is that those usb resources are properly parented and
> the ee080000-ee08ffff and ee090000-ee090bff are not coalesced together (a=
s
> that would destroy information). So something along the lines of:
>
>     ee080000-ee08ffff : pci@ee090000
>       ee080000-ee080fff : 0000:00:01.0
>         ee080000-ee080fff : ohci_hcd
>       ee081000-ee0810ff : 0000:00:02.0
>         ee081000-ee0810ff : ehci_hcd
>     ee090000-ee090bff : ee090000.pci pci@ee090000

Compared to v6.18-rc2, the output of "lspci -v" or "cat /proc/iomem"
did not change.  Hence for the two PCI/USB instances:

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
    ee0d0000-ee0d0bff : ee0d0000.pci pci@ee0d0000

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


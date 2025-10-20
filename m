Return-Path: <linux-renesas-soc+bounces-23322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9937BF1A03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 15:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91D9F4F824D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Oct 2025 13:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FBD32AADF;
	Mon, 20 Oct 2025 13:42:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246032AAD2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967767; cv=none; b=DaAZp/JOF7tWf1iEoWXx4vLlMluo/c2h3kd9f0hUObyP0SLgSJpA1KInCBcmpqXqKIgKIPmwoymPXC4oyAmAo5hM6feBYWbgLEPOSPFAyow6QxB+J+hlt/nViYWXYXa9KMxhuuHax6QgQdGYok9gaCzK/i+wm/nD4mhclLlhSLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967767; c=relaxed/simple;
	bh=OBcex5OTPX795T0RzQ28tSO2c+mInHsmWctTSaRbFL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pt3HA3PtOWOAjkOP4z/YRuP/GmBORWb2JWzCnU+pYKtmoJ75BCkB/syTsxZIvWbSehz/vk92LmTWUOfUR3e//vl58ugBEaAC/zzRb2OqpQ8CTKxdHg4B+6egNJMi6aHZPjCKxVuoy4D+UbV2Q5D+Z+JqOkHg3I9iVDNFsiYi5fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so3189937e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967764; x=1761572564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaoJvkckgwvI7BiUEGUU/6/pih+zeGwr4mjBxmqvp+k=;
        b=dcTlFCe1wkMi+IlKj0TWkEEDxwp3TrycdhfV7MlP17BYZEZ9TQQbMTEtt29u4m/n2v
         gljhs6zQAKD04L6H0NFO0AlLGhZfOl9Jt9Kp4KbVSxEfcnwuud7JUygRxqHptwuoomRI
         7fvURa6poOuW6+EYt1tOYTHDT/olx5cLTQXNTOyG322z2D1UlHN4rTl1WCoZMLzsZc0s
         wBuIbkeyFfZ2enndTM3iN8bc/xRfRHXEG3RAez2kgGf+ND1w4aihJG4aPA9Nm0BEmb7Z
         GOThs9pZ/zc1XsXRtU6FnA7p2pDt3dqb6126/cExxNs+bVmg6tZGHXNfW7GKVtRZ57Hw
         +bSg==
X-Forwarded-Encrypted: i=1; AJvYcCVaelpX7IePWvvfcA3i2rHU5j68xxGfyhgN9C39MHsJe4i+S29kxlVBCm/ReSVYzY97n2pXdZoxup76zPz1T1b9lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKtNeFV0u9pB1OanFjy5DnPn+psDYkuXX4RfjAHHfy3Xbu7Bc8
	m0m9Gj3FK3QPd1dShf1ZZL6hwK7kdQvlhK9Z/F4c36NNgjc5hynpCrlRCrmu1Dan
X-Gm-Gg: ASbGncs+vBao9rwjRFVgvDWeqfEg4oNI/xtWjc8o09laQFP93DW7vM1VMx32U8dDHzg
	4Trcmhoy/6giTM+rEKAQR0vsBJ2XiRn6KxZYyaiob3Ub7FSAdw6/0PTZVYlIflZYnQoyoFUURVm
	WWcdoYO7QwUcld6MyeFR9WLL85xK0LzoxoWolFE5vhL0LQD4kSXXyOz+rHo/6D/57Ckan/QzSGT
	pMXtV//BCnDi5e3fMb/yQ2ofOKlnQwq8zDFhn8fKnLwLV0yByG4VrF/ttI3PkUuwCtiHBGsFR/T
	NyUVlLlpHtyB/qRWfZeB86rxjdtYIiPj2sWZMaG5yjLDjaHzr3nJN/XNPCrgIHRrV6uZBzTV6vP
	3qeMSiMA/RXL1KHx70McVjSf0LCEPh6Ft4kS7PtIchb7uCzQGmcLT4Sr2Zx1EGq146VQxnB1VUA
	6xC6e7ba3MU2sxSdLub9XKT/i4S8E1P2btjjQQUL7esxxJ1vjG
X-Google-Smtp-Source: AGHT+IGOT5/5iCVJfYHoALG3uWI1xKnF92eeoK0fUMWjBDSQPGLkEN3s78KCzdjzrOTDHsXXbxJfhg==
X-Received: by 2002:a05:6122:8c0b:b0:54a:70d3:66b0 with SMTP id 71dfb90a1353d-5564ef4fc9cmr4010560e0c.12.1760967764112;
        Mon, 20 Oct 2025 06:42:44 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f6cebdsm2279173e0c.3.2025.10.20.06.42.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:42:43 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-932dfe14b2eso406781241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Oct 2025 06:42:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiQa5V7RJcQ5kawHziecLZEnCzwBMRM13XC/uVZostWz5hzvqYR1Qxvsb3uIdDchn/2XGkfKU1eH8NJXgtilYGwQ==@vger.kernel.org
X-Received: by 2002:a05:6102:30dc:10b0:5d7:e095:9398 with SMTP id
 ada2fe7eead31-5d7e095983dmr2892907137.30.1760967763055; Mon, 20 Oct 2025
 06:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010144231.15773-1-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20251010144231.15773-1-ilpo.jarvinen@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Oct 2025 15:42:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwAkC0XOU_SZ0HeH0+oT-j5SvKyRcFcJbbes624Yu9uQ@mail.gmail.com>
X-Gm-Features: AS18NWAs9KN2FaEXaNCdOiFdwPBQPDTNxUr11vq1wTHrkD5pV6effUucshx_MRw
Message-ID: <CAMuHMdVwAkC0XOU_SZ0HeH0+oT-j5SvKyRcFcJbbes624Yu9uQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] PCI & resource: Make coalescing host bridge windows safer
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.or>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Fri, 10 Oct 2025 at 16:42, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> Here's a series for Geert to test if this fixes the improper coalescing
> of resources as was experienced with the pci_add_resource() change (I
> know the breaking change was pulled before 6.18 main PR but I'd want to
> retry it later once the known issues have been addressed). The expected
> result is there'll be two adjacent host bridge resources in the
> resource tree as the different name should disallow coalescing them
> together, and therefore BAR0 has a window into which it belongs to.
>
> Generic info for the series:
>
> PCI host bridge windows were coalesced in place into one of the structs
> on the resources list. The host bridge window coalescing code does not
> know who holds references and still needs the struct resource it's
> coalescing from/to so it is safer to perform coalescing into entirely
> a new struct resource instead and leave the old resource addresses as
> they were.
>
> The checks when coalescing is allowed are also made stricter so that
> only resources that have identical the metadata can be coalesced.
>
> As a bonus, there's also a bit of framework to easily create kunit
> tests for resource tree functions (beyond just resource_coalesce()).
>
> Ilpo J=C3=A4rvinen (3):
>   PCI: Refactor host bridge window coalescing loop to use prev
>   PCI: Do not coalesce host bridge resource structs in place
>   resource, kunit: add test case for resource_coalesce()

Thanks for your series!

I have applied this on top of commit 06b77d5647a4d6a7 ("PCI:
Mark resources IORESOURCE_UNSET when outside bridge windows"), and
gave it a a try on Koelsch (R-Car M2-W).

Impact on dmesg (for the first PCI/USB) instance:

     pci-rcar-gen2 ee090000.pci: host bridge /soc/pci@ee090000 ranges:
     pci-rcar-gen2 ee090000.pci:      MEM 0x00ee080000..0x00ee08ffff
-> 0x00ee080000
     pci-rcar-gen2 ee090000.pci: PCI: revision 11
     pci-rcar-gen2 ee090000.pci: PCI host bridge to bus 0000:00
     pci_bus 0000:00: root bus resource [bus 00]
     pci_bus 0000:00: root bus resource [mem 0xee080000-0xee08ffff]
     pci 0000:00:00.0: [1033:0000] type 00 class 0x060000 conventional
PCI endpoint
    -pci 0000:00:00.0: BAR 0 [mem 0xee090800-0xee090bff]: no initial
claim (no window)
     pci 0000:00:00.0: BAR 0 [mem size 0x00000400]
    -pci 0000:00:00.0: BAR 1 [mem 0x40000000-0x7fffffff pref]: no
initial claim (no window)
     pci 0000:00:00.0: BAR 1 [mem size 0x40000000 pref]
     pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310 conventional
PCI endpoint
    -pci 0000:00:01.0: BAR 0 [mem 0x00000000-0x00000fff]: no initial
claim (no window)
     pci 0000:00:01.0: BAR 0 [mem size 0x00001000]
     pci 0000:00:01.0: supports D1 D2
     pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
     pci 0000:00:02.0: [1033:00e0] type 00 class 0x0c0320 conventional
PCI endpoint
    -pci 0000:00:02.0: BAR 0 [mem 0x00000000-0x000000ff]: no initial
claim (no window)
     pci 0000:00:02.0: BAR 0 [mem size 0x00000100]
     pci 0000:00:02.0: supports D1 D2
     pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot
     PCI: bus0: Fast back to back transfers disabled
     pci 0000:00:01.0: BAR 0 [mem 0xee080000-0xee080fff]: assigned
     pci 0000:00:02.0: BAR 0 [mem 0xee081000-0xee0810ff]: assigned
     pci_bus 0000:00: resource 4 [mem 0xee080000-0xee08ffff]
     pci 0000:00:01.0: enabling device (0140 -> 0142)
     pci 0000:00:02.0: enabling device (0140 -> 0142)

I.e. the "no initial claim (no window)" messages introduced by commit
06b77d5647a4d6a7 are no longer seen.
The BARs still show "mem size <n>" instead of the "mem <start>-<end>"
before commit 06b77d5647a4d6a7, though.

This series has not impact on /proc/iomem, or on the output of
"lspci -v" (commit 06b77d5647a4d6a7 also had no impact here).
I.e. the part of /proc/iomem related to the first PCI/USB instance
still looks like:

    ee080000-ee08ffff : pci@ee090000
      ee080000-ee080fff : 0000:00:01.0
        ee080000-ee080fff : ohci_hcd
      ee081000-ee0810ff : 0000:00:02.0
        ee081000-ee0810ff : ehci_hcd
    ee090000-ee090bff : ee090000.pci pci@ee090000

I hope this matches your expectation.s

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


Return-Path: <linux-renesas-soc+bounces-23352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA5CBF50B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28F513A693F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 07:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7536D22579E;
	Tue, 21 Oct 2025 07:44:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C128000C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 07:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032687; cv=none; b=SiDmO4+L2KFAELNYRYyxNbs0qLnTc0Ou6DUn8IeDRXp11ybMamrHXoKehSTLXvVvMw+RoAZHDPjDuZuf6k9VnQC1CmeK0LOl8yGvgcjoKn4Rf7m2KK8F1sKc2GcBaUVaeIFHMwUH8e25pa/P2aM/mX8mAtwnm/1oP4TMRW70Xlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032687; c=relaxed/simple;
	bh=IG7tayKRQ/yarsAOMuot2dwGDZWhIk36rza1ofFk6j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rvr3HPZuRISpW947T8PNgLVOK16EVwsQEDWYG7mhByvYFr5ZfLQiRNTtXZPRlMXqEJ1k8lPttWpM9dOlWJS1DSZM+rRQvXI9WIt01UsytDBhaZjxi80T9OUHC/1N9l77WWVZWF9AXeKuVTY93Io60fmt30lHlzGRX4B7H9VzyGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5563c36f5dfso2033192e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032684; x=1761637484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUqrwvpQXr6guDNLgU9SzLdOYzQwJ1tizkmuIUMCSQg=;
        b=Yqyz0SEX7md4rjfRnVWPVnRujFR+8LjiPALvQvJxSVT3gkVHQdfO3LNaJrk9VES71R
         lugC/HIR4cx3fRJX0H8sHkHtb/Sc7/l4stn/zOr8IkT2KFdIDkiFCu89XCAJn4j1YzUQ
         00DlgKnlC9TvscpBuwFWkFEIxBnq5TJm5EM/VdbPjR1x3kKmwFLUMxuPc/VQnSNWy15A
         ttCvzm9o6MAivGH9L7U320bwfPhu1Q3tAEO3Rxqtm9JIvW2uC48XOxtn4fz50UISm3Nx
         vIJtSr/LPWGspkXuIM50m65GxP7vuQE4gJ/TRb1OpuucsR9eWtO3W6E+Mk2PPED4jD8n
         eTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGzz8Ivgc2dM6pw+vxiGsaVozF4cKmuSyW/Re/ab/ZU50+KZ2A/lWxQhWKsgM8IkYad/NPoi9FZbR8rSXNrh9zbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuwGwTGah++0DXzFYLtI0/FnMk58i61p4AgOB8UubUcNz+Kz30
	ZqmZ/hus+vg95/xn42v2JfiY/GHz8/DHa9fJfzRXlrumABkxWDH9Z86OFKJHdR5+
X-Gm-Gg: ASbGncvmOS7zz0dvVQxgD9R3WSPnSFQohPjjaXNUxnB1/u2EkvgKhkFXIwQpUkGnnHt
	0cShH0PQ5yJR5lwWTlh/BRDE9PYN6+RF3xmDpfdQG1VE4TX/HjL69OKW3I4hgqGiS3xYRKiXqvl
	f2lLYvswLVnych/wMX6hiuaLmaptHzu5ChuY8iPdwu4cal3NYaZfEV87gFGZFXC29Wgxba/aXQV
	V4lwEFtm+UDFyG1x6aGRskRwEydH744ZMKRVen5AJNS3sS4/JfBdjy2MBtzSU/dE98uks4d8MnR
	VfO08Au2dHZwhZrjWbkw81H4RxjDeJyhj12WM54UEyKwDK0Vgzr2MYpQG+H9uuwaedzJjSr7TK7
	aHQ2/+bL33Fdq6grLQQ4fNSmDoURyDTUkQwSH4jfPFUBQaPPphxHVqtLV2EhDyJf4Ra57wO00+d
	nAYOHtA87wil2YuNU/m+h/HVcH0HT00Xg6jnssYC/7d3LSz5y3
X-Google-Smtp-Source: AGHT+IFsBDrt2lpIu4Cz3DPHi9EhNAAugijwynvDDQw+W8DalP6yXOfme+uuCyEEM788FujotnZdgg==
X-Received: by 2002:a05:6123:2e6:b0:54b:bf2f:bcd7 with SMTP id 71dfb90a1353d-5564ef63b43mr5044160e0c.11.1761032683796;
        Tue, 21 Oct 2025 00:44:43 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5566211708bsm3111324e0c.22.2025.10.21.00.44.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:44:43 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso2407431137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 00:44:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXKC4KxXWyYAgNgegExT8A1ALLHcTLV6qqqbtuoPcZwIxB2G6GLWp5H8ICQJsGQmEwIErHH8ozgqyY84gCg0G0cQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3a0c:b0:5d5:f6ae:38c8 with SMTP id
 ada2fe7eead31-5d7dd6f48c9mr4413144137.39.1761032683037; Tue, 21 Oct 2025
 00:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010144231.15773-1-ilpo.jarvinen@linux.intel.com>
 <CAMuHMdVwAkC0XOU_SZ0HeH0+oT-j5SvKyRcFcJbbes624Yu9uQ@mail.gmail.com> <89a20c14-dd0f-22ae-d998-da511a94664a@linux.intel.com>
In-Reply-To: <89a20c14-dd0f-22ae-d998-da511a94664a@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 09:44:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbseFEY8AGOxm2T8W-64qT9OSvfmvu+hyTJUT+WE2cVw@mail.gmail.com>
X-Gm-Features: AS18NWDBDpeYkZ3rgn5Tqmr6-1KFQr01Xx8X4chOVFcJI4f9-bqI7eigteiWqww
Message-ID: <CAMuHMdUbseFEY8AGOxm2T8W-64qT9OSvfmvu+hyTJUT+WE2cVw@mail.gmail.com>
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

On Mon, 20 Oct 2025 at 18:20, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Mon, 20 Oct 2025, Geert Uytterhoeven wrote:
> > On Fri, 10 Oct 2025 at 16:42, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > > Here's a series for Geert to test if this fixes the improper coalesci=
ng
> > > of resources as was experienced with the pci_add_resource() change (I
> > > know the breaking change was pulled before 6.18 main PR but I'd want =
to
> > > retry it later once the known issues have been addressed). The expect=
ed
> > > result is there'll be two adjacent host bridge resources in the
> > > resource tree as the different name should disallow coalescing them
> > > together, and therefore BAR0 has a window into which it belongs to.
> > >
> > > Generic info for the series:
> > >
> > > PCI host bridge windows were coalesced in place into one of the struc=
ts
> > > on the resources list. The host bridge window coalescing code does no=
t
> > > know who holds references and still needs the struct resource it's
> > > coalescing from/to so it is safer to perform coalescing into entirely
> > > a new struct resource instead and leave the old resource addresses as
> > > they were.
> > >
> > > The checks when coalescing is allowed are also made stricter so that
> > > only resources that have identical the metadata can be coalesced.
> > >
> > > As a bonus, there's also a bit of framework to easily create kunit
> > > tests for resource tree functions (beyond just resource_coalesce()).
> > >
> > > Ilpo J=C3=A4rvinen (3):
> > >   PCI: Refactor host bridge window coalescing loop to use prev
> > >   PCI: Do not coalesce host bridge resource structs in place
> > >   resource, kunit: add test case for resource_coalesce()
> >
> > Thanks for your series!
> >
> > I have applied this on top of commit 06b77d5647a4d6a7 ("PCI:
> > Mark resources IORESOURCE_UNSET when outside bridge windows"), and
> > gave it a a try on Koelsch (R-Car M2-W).
>
> So the pci_bus_add_resource() patch to rcar_pci_probe() was not included?
> No coalescing would be attempted without that change.

Sorry, I didn't realize you wanted that (and anything else) to be
included, too.  Please tell me the exact base I should use for testing,
and I will give it another run.
Thanks!

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


Return-Path: <linux-renesas-soc+bounces-15245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34437A77D5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 16:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE5277A35D5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 14:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9511C8639;
	Tue,  1 Apr 2025 14:11:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2AE1FAC55
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516691; cv=none; b=Lp/RKycrNsYJSHBcK4MPYDhvwQcK9+5Eq8xIx1/oZiTJqmwF+yMdMWkq+lb4KhBgO2pVrvQ088cJaKW1H1+D/a1M5hqd6yKRj9fCPjnxfmvc++9NKQFgqMJm6IYlkEgGUNxBHhviudKaNpUoJFEo9lZsC4PpiKMgaDjML5v1l7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516691; c=relaxed/simple;
	bh=jQK3cLGftQIeziLsvTcI17ChCJ5qEloH80Od82SzFc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOERD8e5PU2QunVI/3x7uLPbhJHkpZUprWkKpGm8Md70FHi9+57WD28+RhMpl8m2nx90o4uKK8MN6fxzPG4FwXCdImScWJSILDkCkZOzvuSQ22QchJ4Pm2jW7w8SkIapF8pw3qTlDJZg5Nn+SltHKklhY64sGWU1Ay2NwWE/mTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c08fc20194so1084565385a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Apr 2025 07:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516687; x=1744121487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dbXshCLizYzdzsg1zBJcHBo28K7Ezm6HNKb+QYxbz8=;
        b=K4PCUkEztNxJhEJCKX2wq8EYfYI3F4XSNYZtAwJ653nmUVW1rEe/5sbYfMpzBdnRRr
         J0ShxtnS4R+jm0dx00TItWR4WFNGCUT5Gqd8ej4s2aRacUlkFlTWmh8jDLBZWaAJYZCd
         bOJNXTous0N8Fep/5exayoQtkduCOb3YyqdrTDGp9PLB1AtdnuFYUXTNe9RsJOZaW29V
         8V0AlK1bCqxTJvw6zoV3KfT+rwxjgqkgWnaDdBPgWzAyuGdVbkeJDSVp+ptWfwgNeADp
         5pkAgQXFz+BFckt9m9C74X1Ez0wFf0Jm2jV8vyJHrUzRmCt85LwZaGmIk97MzdxP1a1G
         F5eg==
X-Forwarded-Encrypted: i=1; AJvYcCVXSOKzof7lVgX0sIExL9FthlZr+Wq/UM6EP0tjOt3BalX9eJ/dzLAlBs8sxrrD+t6pS+GE2FuXmdurOLilhT6IQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9StB7xYkqeEgaAQEi+FKbgemb1mQnGCaaqqtk/rc2Akmk9sA+
	mv8mbMwDfDR51P/Ec5UqTME6IImh9fqh0Eb5Ptb6oCJAXJsjoA0a+UOKVyFO
X-Gm-Gg: ASbGncsHP9w6QP72RhERlQmlQJ3T68LGqoNCBs4qIL3rgwDCmdYBi8DRsrsH1m0CNch
	ne2B0C9uFlRzyZm0L7+U0+//LuJXhm9dVsZXejghSGbDyQQTREGFrH/7mpdJKCVH1pNjapJte/I
	idczk1iH/j0VU5i3/8SEnevKBZVIJ9EOM+M7Rw3r6YRYg9zWE534hH6M+B9mb6mUWdPdsRghoQf
	X0eNRoEREeDhmvNtvCnyfpFGRRShbt2MadhbXnvmtTs2pBNoQ9scoh0Vn3DyzBZa6HddRmYaeo3
	uZuTO4UKfI3Tut5n48yialktW1Km6fDxnxsXNpeAu4HHTJmn/sfoY/DcLs6IcszWq3yVG9hPe6l
	zEDE+O2I=
X-Google-Smtp-Source: AGHT+IHf1QoWP1mhqNeMIhV/O6nG/SPsXkdg8TTU0/EIMTJNv8H0UpWQdrxbpu0Rgb1Uw15YP5M/QA==
X-Received: by 2002:a05:620a:240d:b0:7c5:4de8:bf65 with SMTP id af79cd13be357-7c690880c87mr1996429185a.36.1743516686721;
        Tue, 01 Apr 2025 07:11:26 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-871a320fce0sm1979088241.5.2025.04.01.07.11.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 07:11:26 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86feb84877aso2318991241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Apr 2025 07:11:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyn3+KPdW8nLzE89B2u1v7MS5AF8oZvAGblr/UZAvBRcQZxhH25n4G0Ahi1QHmlxEC7tQgXGJGDOIOhCiLErHRAg==@vger.kernel.org
X-Received: by 2002:a05:6102:2ad5:b0:4c4:dead:59a3 with SMTP id
 ada2fe7eead31-4c6d3837dfdmr9191881137.2.1743516686211; Tue, 01 Apr 2025
 07:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com>
 <CAMuHMdUtCqwzeWY8G+yHiu4biovymDVb_UtjfYPEQYyYr+dP4Q@mail.gmail.com> <f72bcfb2-e2a1-4dd4-bedf-241b75178958@arm.com>
In-Reply-To: <f72bcfb2-e2a1-4dd4-bedf-241b75178958@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Apr 2025 16:11:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYDLUZGxFf6fnsKXg=EA2YkoNwMe8Uv0+Bo3w+4h-dhA@mail.gmail.com>
X-Gm-Features: AQ5f1JobuqnYTkEVwZcXHOdw8llBj_Ln3GR8mFtvtzuLKH3AKUYuIBQ4wVFH8hQ
Message-ID: <CAMuHMdXYDLUZGxFf6fnsKXg=EA2YkoNwMe8Uv0+Bo3w+4h-dhA@mail.gmail.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Register in a sensible order
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Robin,

On Tue, 1 Apr 2025 at 15:53, Robin Murphy <robin.murphy@arm.com> wrote:
> On 2025-03-25 3:26 pm, Geert Uytterhoeven wrote:
> > On Thu, 20 Mar 2025 at 15:41, Robin Murphy <robin.murphy@arm.com> wrote:
> >> IPMMU registers almost-initialised instances, but misses assigning the
> >> drvdata to make them fully functional, so initial calls back into
> >> ipmmu_probe_device() are likely to fail unnecessarily. Reorder this to
> >> work as it should, also pruning the long-out-of-date comment and adding
> >> the missing sysfs cleanup on error for good measure.
> >>
> >> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
> >> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >
> > Thanks for your patch!
> >
> > This fixes the
> >
> >      sata_rcar ee300000.sata: late IOMMU probe at driver bind,
> > something fishy here!
> >      WARNING: CPU: 1 PID: 13 at drivers/iommu/iommu.c:571
> > __iommu_probe_device+0x208/0x38c
> >
> > I saw on Salvator-XS with R-Car M3-N.
> >
> > It does not fix the second issue reported, so it is indeed too early for a
> > "Closes: https://lore.kernel.org/CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com"
> > tag.
>
> You mean .of_xlate being called multiple times? That's not an issue,
> it's normal and expected. Every time an IOMMU instance registers, it
> triggers a probe of all relevant devices which do not yet have an IOMMU
> - this has never been selective, so if a device is associated with a
> different already-registered IOMMU instance, but does not have a group
> because that instance's .probe_device rejected it, that probe also gets
> tried (and rejected) again.
>
> The core code behaviour has been this way for a very long time, the only
> new thing is that the .of_xlate calls are now in sync with their
> corresponding .probe_device calls (and the latter are also now working
> properly again for fwspec-based ops).

Hmm, I started seeing the extra calls only after bcb81ac6ae3c,
i.e. not since a very long time?

> Was it just that, or is there still something functionally amiss?

That's all for now ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


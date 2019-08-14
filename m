Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8C958D29C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Aug 2019 13:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfHNL7X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Aug 2019 07:59:23 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35566 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfHNL7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 07:59:23 -0400
Received: by mail-lf1-f68.google.com with SMTP id p197so79081660lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Aug 2019 04:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8NHuBBys1AqC0nWO0pn74jgJq6YD6r7LGRtWjE6jmtU=;
        b=ROtozDZuxj6LK6u6rgVDYgC/DC4gD1QJyz7G4Cb3RDmzpLHDmrh3LFdwl53xBj0xj1
         hHZAuer5HFV8N711RSWr+xPlGQU5LH+wPIuCUFb0h5S2jZtS813saYl9LDPMFaDLV4Zh
         5MeC0RbfIY8mD5xCXdX1ViztwAkve3UwmYbF9Q3+rsxi56/c4oxUoGn+3lFdRIUuFL0G
         qMQh8Xzwa4irLT1vyOcPQTrwV5GpjzpL3S9br5YaWsyBLQFNzl7BGlbJObMXu6B229d1
         TtLYG8zwlklOmIwYdfe4b0GHd2/QB8iVLesEJ0BjhHJ2xJn9I5YjC7XejCDpYyOZ5FR6
         RrPQ==
X-Gm-Message-State: APjAAAXyjGG8KKxqD7xijIOZ1nlH/oujNT2cxZ44yFKqO4X557anFVO/
        mu1B0p9m5yn2ngE413w/xTyVpikEv3zzFO/hEY5cQg==
X-Google-Smtp-Source: APXvYqwt29cWpLQGx1e5xNjYiebOwubUJzPfj3n565rGPBKWVO7WzrR+LmQgdrv/ffvPLkVlo11c/UO8AGm+MUsLVgk=
X-Received: by 2002:a19:4aca:: with SMTP id x193mr24921779lfa.146.1565783961175;
 Wed, 14 Aug 2019 04:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190807155524.5112-1-steve.capper@arm.com> <20190809164716.qtt7zizfbqyjukwe@willie-the-truck>
 <CAMuHMdWvkWGoNC5HbWoZwtpg5VXxTZqRZqQy4BLPgQXZJtKnsQ@mail.gmail.com>
 <20190813131013.vpc5a2vlxwghizxa@willie-the-truck> <CAMuHMdXr+S2QeOSEXZoGGDOB_PrgENPbVXFjS=pEfbHfvN2zhw@mail.gmail.com>
 <CACi5LpNhh0a0ktLeDDCO4K3-mBx0D8QZ344juAzbHeP4QFtGDw@mail.gmail.com> <20190814082137.mnk242lp2vw5b4ot@willie-the-truck>
In-Reply-To: <20190814082137.mnk242lp2vw5b4ot@willie-the-truck>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Wed, 14 Aug 2019 17:29:09 +0530
Message-ID: <CACi5LpMNC2h-JAmT3gc8wt6rwPBzQaAUZq_P18D3Atjg9CNS5A@mail.gmail.com>
Subject: Re: [PATCH V5 00/12] 52-bit kernel + user VAs
To:     Will Deacon <will@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Steve Capper <steve.capper@arm.com>,
        Christoph von Recklinghausen <crecklin@redhat.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>, maz@kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 14, 2019 at 1:51 PM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Aug 14, 2019 at 01:34:49PM +0530, Bhupesh Sharma wrote:
> > I still see the following issue on a 48-bit hardware (i.e. _non_
> > ARMv8.2 hardware) with branch 'for-next/52-bit-kva' with commit
> > d2d73d2fef421ca0d4 as the HEAD:
>
> Have you tried the patches I posted here:
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-August/673315.html
>
> ?
>
> Whilst they're being reviewed, I've dropped the 52-bit branch from
> linux-next (for-next/core) so that people don't keep running into this.

Thanks will try the above and get back with my results.

However just to make sure that the 52-bit changes are tested properly
(before landing up linux-next) - as we had issues with the 52-bit User
space VA + PA changes in the past (which broke userspace), I was
wondering if we can have a dedicated branch to have the v5 patches
from Steve + fixes, so that they can be easily tested and issues (if
any) reported with easy reference.

Or, if such a branch already exists, kindly share the pointer to the
same as well.

Thanks,
Bhupesh

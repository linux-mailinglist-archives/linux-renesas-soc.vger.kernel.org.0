Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE219AA75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 10:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388965AbfHWIfY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 04:35:24 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:32824 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388643AbfHWIfX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 04:35:23 -0400
Received: by mail-oi1-f194.google.com with SMTP id l2so6474009oil.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2019 01:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=unheAuDdl4/wWkUa8UrhU8e3stxZhpx9YLspZKHtIg8=;
        b=pkw0PjHEtYkJCNRkHwNtm8ue3f9RVlVyvzerJTWfly/ELn9R+K49YBkTbyrGXRPUQL
         ydS/pogDtz3+1tIOb8QVkmr3Q7+tLWJ/naHFTEQTma3GpyTRXn0ZXoz49azqwHVaCg/W
         LsNUxva7CEQILSbZulrh9jG3ROXlyq+IZaLSmHAbLZqR+mO+7lagz3fvC/FDvmjitSZ+
         xXq0whk7kgRIfDozYXMzuwjWCsW3ZnUG50TupVdn4m1URV+BagMVYpWu0ONKVPw3Sg+6
         5mhBhil6v/dzj5RthWjZ+5/VHTXoIwzTQNuJ2A97FuXW6efJTqPaa9bL3NzoeyzWzNkd
         Yvcg==
X-Gm-Message-State: APjAAAV5yajZyl9ckxP4CZDOK1hYFbGe9upe/E4EdzzvO6ZkxwasWeol
        EEqDO9rtwtYB0tkYO/j8Nt7EbP9/LRA9w305N0Q=
X-Google-Smtp-Source: APXvYqwFzBTDR+im2MPWNkXPKyXvUEDkaDhE0QohZr8jCL8GxjrJrJalE5QzxQSvr+R8FmZddYAIDjND5STAhrCHJf8=
X-Received: by 2002:aca:ea82:: with SMTP id i124mr2204127oih.153.1566549322721;
 Fri, 23 Aug 2019 01:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190821124602.29317-1-geert+renesas@glider.be> <CAMuHMdWj7eCa9URtztqth=fYMn2uTHWDS3WAKnRvxDfMjjBH_A@mail.gmail.com>
In-Reply-To: <CAMuHMdWj7eCa9URtztqth=fYMn2uTHWDS3WAKnRvxDfMjjBH_A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Aug 2019 10:35:11 +0200
Message-ID: <CAMuHMdX6Z9oe3kbkNr00dkfckxBTForrEnOZLWSBE-8EFGtFAw@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: renesas: ARM errata updates
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 23, 2019 at 9:54 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Aug 21, 2019 at 2:46 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series updates the handling of ARM errata for affected
> > Renesas SoCs.
> >
> > The first patch enables the new ARM_ERRATA_814220 for Cortex-A7, using
> > Kconfig logic.
>
> Queuing the first one in renesas-devel for v5.4.
>
> > The second patch moves enablement of ARM_ERRATA_754322 for Cortex-A9
> > from shmobile_defconfig to Kconfig logic, to make sure it's always
> > enabled when needed.
> > The third patch disables PL310_ERRATA_588369, as it doesn't affect any
> > Renesas SoCs.
> >
> > The last patch is marked RFC, as I don't know the revision of PL310 on
> > EMMA Mobile EV2, and cannot test it on EMEV2.
>
> The other 2 are postponed.

Given it untangles dependencies, I'm also queuing the Kconfig part of patch 2.
The defconfig update will happen automatically during the refresh
after v5.4-rc1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

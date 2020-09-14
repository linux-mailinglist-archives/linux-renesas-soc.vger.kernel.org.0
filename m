Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A465268B7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 14:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgINMxp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 08:53:45 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:44566 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgINMqj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 08:46:39 -0400
Received: by mail-ua1-f66.google.com with SMTP id o14so5415546ual.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2020 05:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdE+LuX+2Qm0gSEGuHp+5gVUIvIevbsDt3zyJVz18a8=;
        b=n22uMJVKxD8l6Go1QvUp3fCBwWZ62015Cbqb7/UIewBG9BAKe+y3WGfCpZTIb33waU
         8DUzKiXGYMrOsUVxrgn1PwvKO2Br2LXppmrLfHPzHDFW+wQJgO7pwqq9LKzgRax9T+TQ
         +D9Mtp4VR3QL538ZnNrSyPPIbKpwmArd73ZinORsoWWZQohVEPs5J29I/R6+z2j7hPU3
         bELON1GVbnuQG3nUqGBdS7fzBjx6NzAryHE5ScchBP8MUb++vNF+n6U5/42wUvqsIH3v
         TwtpeTk7AhOgSPg0YKbWQ867kemL3QtEtca+jQrL0hcpMdlzWQ6eAdsYnFJv5YeECUSo
         m/qQ==
X-Gm-Message-State: AOAM532/TKrGFu0//uXEyB8IuSz8qenoaMj/altR1qshj+mEJ73C0OAX
        9X65C8iKcis6FKyuRwb+Vi41Ia84oqDEJAdwueIdAFn6SjY=
X-Google-Smtp-Source: ABdhPJzUxCOjVtmAzH9z/y7jXufNCW8ofbrULZBtHNZfFSSc9+zcC9VH4EYPvpflzezGIBdaiPfjNspKcpw1qV1m7Vc=
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr8304418ooa.1.1600085409099;
 Mon, 14 Sep 2020 05:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200911101912.20701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200911101912.20701-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Sep 2020 14:09:57 +0200
Message-ID: <CAMuHMdU0YuF2DqndABE5RGS1ymK2hqFyim6aYsqnPkW_PHe9xQ@mail.gmail.com>
Subject: Re: [PATCH] iommu: Kconfig: Update help description for IPMMU_VMSA config
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 11, 2020 at 12:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> ipmmu-vmsa driver is also used on Renesas RZ/G{1,2} Soc's, update the
> same to reflect the help description for IPMMU_VMSA config.

... update the help description for the IPMMU_VMSA config symbol to reflect
this?

>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

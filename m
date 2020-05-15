Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1751D4700
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 09:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgEOHWm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 03:22:42 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35860 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726665AbgEOHWm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 03:22:42 -0400
Received: by mail-oi1-f193.google.com with SMTP id x7so1410906oic.3;
        Fri, 15 May 2020 00:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=unTaiYNsyJHNbPep69SOcCNp6Xe5J0UrX0ALNxnvuwk=;
        b=Zw05ORM9aGsyIg1xPhY6VZg2YL7P2ekxY4tDBixtcGO43V2kNlmDyADYX8cERi1fBK
         T1Wx9qjf3IpkZq+lm1dHXe6fdFf6jOrTh9Je3NYQVeg2G0LnyzzjxRYx5nV5P/CKcRb8
         RvVXMmu4jNefCGztbPB/tMEkuNWcD+C+DW1ngnv6u1DLPkyM3a4ocxjzgipl1JYGBCTN
         zonVQPc75/TeYvs2rIRyRdwL3OnXZqxPdDxdsP/1K1oJ0MT70Y41DdJD+sL7WcFhYz0q
         TGxE96sh6wZaDnx+LLkbcCOb9MsP0S25w9EOi08oUx0UuLmP16OEQ0/U81EvLYvRrbUt
         r8ng==
X-Gm-Message-State: AOAM533yiVuBIwzLakpn09amf7b3oeQe+Klbb2zMMh0GuuhsM//SjAcl
        7MD0L842s5R8ZLyVj51enThqRWIHmboho8A9SdI=
X-Google-Smtp-Source: ABdhPJyjJ+/cjMBY1UUSSo3Cxe2NWI07C8OJj+hqOcWICEGnCReUQGucy5vB7JV7cSes4CyFwN+7ATV+zop4u3K0sxQ=
X-Received: by 2002:aca:cd93:: with SMTP id d141mr1113849oig.148.1589527359964;
 Fri, 15 May 2020 00:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <1589494238-2933-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1589494238-2933-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 09:22:28 +0200
Message-ID: <CAMuHMdW8aQyHm7uzOd3cL2kPXc0EZ=DN_MmVa4AVFLqo5PwMKA@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_PCIE_RCAR_HOST
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 15, 2020 at 12:10 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> config option PCIE_RCAR internally selects PCIE_RCAR_HOST which builds the
> same driver. So this patch renames CONFIG_PCIE_RCAR to
> CONFIG_PCIE_RCAR_HOST so that PCIE_RCAR can be safely dropped from Kconfig
> file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I wrote before:

   "I can take patch 2/11 through renesas-devel.
    Probably it's best if I submit it to arm-soc as a fix for v5.8, after
    the driver part has been merged into v5.8-rc1."

so this will have to wait for v5.8-rc1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

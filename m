Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F0E4B0B64
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Feb 2022 11:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240226AbiBJKua (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Feb 2022 05:50:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240220AbiBJKua (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Feb 2022 05:50:30 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572F11008
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Feb 2022 02:50:31 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id i21so8022300pfd.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Feb 2022 02:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pfPmHTNS3kNf2REIYVPxP0rI8dFehD3FUEuoa/nfhmQ=;
        b=LV+Wgp8y3d5XDi3wv3BsyrxVE/eJEg914rTG32ssP43QX2iCrRuh4WUb+6RwJP8n9A
         XKmpvwvmhZnw8XJ21kf3VZH2jlpzWbQqfvtmkYF/0MR3b+qZZv+o6iF3q6JAoarRHqGZ
         o9azkiYLnrXoaq1SASw1qMZ5pFQRTKiWtXzvUBbZBy31W8MslfIfFpoM9K+y9eSGBw+X
         0R4NYYYnq/OSOh15JpFvO9i4lnYSx3CpHXeZgdERKYb2eprNuqRDbD4TYmvvFNbDRDDu
         8gTdmCz3Tg9ewAdRsYcolPHOYiS2PvpRu3SooESMNWcbJGvogpPyZoSZV4/hKLei8tn1
         N3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pfPmHTNS3kNf2REIYVPxP0rI8dFehD3FUEuoa/nfhmQ=;
        b=Vb+KddBnL1rl0+SL8wl/T6VfrutgHjgAhTSIkYpVoDbEbWrL68LjUyuDd0IdM+BZBN
         kG3NPH6WyRnOVi6JM5+VVCkSsG7iKKrW8eXGE9iUTZkHm14F5hPsJ01I5WBjEE6JaWcl
         intr7tGkyqshoIdbGOJA61epXkaL9ldW0ZvWNA3zsL9LZmguGRpyNF1HfycZ0bIgk1wm
         RsLSlU2c5MzHymnwMSkttfC6cMQtq9jPAeY419rub9kgaeJMk0yM0YL/uAE3FYv3duva
         7YmNXfkRKTkQ+P/g85IFw+akQOwxPFf6mX8hMQxwbvSi8tkj7Zyk09q5gM0Il/1uevTk
         tEqg==
X-Gm-Message-State: AOAM530ytHQPcX/YVEmbgs/o9HAAlWQqCKgaV+x/7NC8fnBLKnzuLghF
        jv5/j2kT9J0hpR+Qi72jMcoY
X-Google-Smtp-Source: ABdhPJwX5eFiJ34Kps0Uoal21jJAK99NMgslIAbYgaiigOPC9RkZIznR1OV86VyQA1xPKb9GDAqA6w==
X-Received: by 2002:a63:dd0f:: with SMTP id t15mr5652799pgg.12.1644490230574;
        Thu, 10 Feb 2022 02:50:30 -0800 (PST)
Received: from thinkpad ([27.111.75.88])
        by smtp.gmail.com with ESMTPSA id t9sm1794782pjg.44.2022.02.10.02.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 02:50:30 -0800 (PST)
Date:   Thu, 10 Feb 2022 16:20:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh@kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [RFC PATCH 0/5] PCIe EPF support for internal DMAC handling and
 driver update for R-Car PCIe EP to support DMAC
Message-ID: <20220210105023.GB69529@thinkpad>
References: <20220126195043.28376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220210084052.GA69529@thinkpad>
 <CA+V-a8tivrjPoae69pqH1D+B=_Bd7ZzKjCA0PcfBz7Rpf022mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8tivrjPoae69pqH1D+B=_Bd7ZzKjCA0PcfBz7Rpf022mA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 10, 2022 at 09:24:19AM +0000, Lad, Prabhakar wrote:
> Hi,
> 
> On Thu, Feb 10, 2022 at 8:40 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > Hi,
> >
> > On Wed, Jan 26, 2022 at 07:50:38PM +0000, Lad Prabhakar wrote:
> > > Hi All,
> > >
> > > The current PCIe EPF framework supports DMA data transfers using external
> > > DMA only, this patch series aims to add support for platforms supporting
> > > internal DMAC on PCIe for data transfers.
> > >
> > > R-Car PCIe supports internal DMAC to transfer data between Internal Bus to
> > > PCI Express and vice versa. Last patch fills up the required flags and ops
> > > to support internal DMAC.
> > >
> > > Patches 1-3 are for PCIe EPF core to support internal DMAC handling, patch
> > > 4/5 is to fix test cases based on the conversation [1].
> > >
> >
> > This looks similar to the Synopsys eDMA IP [1] that goes with the Synopsys PCIe
> > endpoint IP. Why can't you represent it as a dmaengine driver and use the
> > existing DMA support?
> >
> Let me have a look. Could you please share a link to the Synopsys PCIe
> endpoint HW manual (the driver doesn't have a binding doc).
> 

I don't think the PCIe reference manual is available publicly. And you are right
that the driver is not tied to devicetree. The reason is, it gets probed using
the PCI ID of the EP and all the resources are defined statically in the driver
itself.

Thanks,
Mani

> Cheers,
> Prabhakar
> 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma/dw-edma
> >
> > > Patches are based on top of [1] next branch.
> > >
> > > [0] https://www.spinics.net/lists/linux-pci/msg92385.html
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git
> > >
> > > Cheers,
> > > Prabhakar
> > >
> > > Lad Prabhakar (5):
> > >   PCI: endpoint: Add ops and flag to support internal DMAC
> > >   PCI: endpoint: Add support to data transfer using internal dmac
> > >   misc: pci_endpoint_test: Add driver data for Renesas RZ/G2{EHMN}
> > >   misc: pci_endpoint_test: Add support to pass flags for buffer
> > >     allocation
> > >   PCI: rcar-ep: Add support for DMAC
> > >
> > >  drivers/misc/pci_endpoint_test.c              |  56 ++++-
> > >  drivers/pci/controller/pcie-rcar-ep.c         | 227 ++++++++++++++++++
> > >  drivers/pci/controller/pcie-rcar.h            |  23 ++
> > >  drivers/pci/endpoint/functions/pci-epf-test.c | 184 ++++++++++----
> > >  drivers/pci/endpoint/pci-epf-core.c           |  32 +++
> > >  include/linux/pci-epc.h                       |   8 +
> > >  include/linux/pci-epf.h                       |   7 +
> > >  7 files changed, 483 insertions(+), 54 deletions(-)
> > >
> > > --
> > > 2.25.1
> > >

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210A94B0E53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Feb 2022 14:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242122AbiBJNWY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Feb 2022 08:22:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242119AbiBJNWX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Feb 2022 08:22:23 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E841001
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Feb 2022 05:22:23 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id c8-20020a17090a674800b001b91184b732so6042538pjm.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Feb 2022 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lmOwrWMBvG/QSqfuMjJnJ7kGjRK9jagfZ0MoGw4iJ8k=;
        b=UjppnTNb82HEctUbBZO6K12OIzgXOTnqDKLtSDd2sA6wa9ybDXORdycoNkVY60QX3z
         lCJS1XOx/McRZcFLUwl4MKVrzJP7HeZqQoa2sXYuPLSyGX9K5Jh7nb/sEcc0DLSnDxia
         qOK5qPKs1GEAtcrhQN0FTTkg7fk4GHSXHQnKAucijTqi18kl9pCxaLlCMAlWFzvdDrzj
         w+r/I9YanmnzSzb6/O0TG7udN2mPltC2EgKUW30CnXC2ATtTxOExyduUtpg08PKigg9x
         vDr9uCrih8Cm5jSRniyOP6VmnH6PC9lO4xX/NmJVrKAngm5NrgibhJ4jzXXPtzE4eTfO
         wjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lmOwrWMBvG/QSqfuMjJnJ7kGjRK9jagfZ0MoGw4iJ8k=;
        b=Kfqmd6knxmnlwprKtEfdIueRzO8jGGVmlHRpW7ZxzY0NOvZ7oE+sf8WUC7IE6NdoEM
         tpnZd2j/ftsXtbOYLl4lYmPAAAboRSk9SZ3yBpHZchKt0kRCN7sqaVi0nlBtdLmx6+jF
         NJWV3UsZytjJXpSu5/X6n6wcdRV3gaDVRq5+MRpOaZwDnklCx1/TZAiBSLzDkV9CY+1e
         OPVogvw8MdaNA4xNNvD3EgRkpzEytmOps2xjPl6za05nnE9OhUGCffsElV0SvjZ7S8pN
         1PFSuJ8TNcLsKRl+uVr6Xz7WsiIEPvDbk+NEo3umhL1Kk+qzJ7ZeoP2CVeOeBqnc6Xh1
         JeWQ==
X-Gm-Message-State: AOAM533etvfg2l532LSoH6P8OoEBvWtYISnwRy+aD2benDFofUonoSyO
        tjgelpICqKfKNTUhdjqb40Bq
X-Google-Smtp-Source: ABdhPJw31or8pz7dzjuhoSiIHSPofndiHPzzKxNU2XV4sjPE/gHq/d1sWMqRkZNI1mdKZE2l0jrPHA==
X-Received: by 2002:a17:902:e781:: with SMTP id cp1mr7342690plb.45.1644499343306;
        Thu, 10 Feb 2022 05:22:23 -0800 (PST)
Received: from thinkpad ([27.111.75.88])
        by smtp.gmail.com with ESMTPSA id u19sm13443711pfi.126.2022.02.10.05.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 05:22:22 -0800 (PST)
Date:   Thu, 10 Feb 2022 18:52:16 +0530
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
Message-ID: <20220210132216.GE69529@thinkpad>
References: <20220126195043.28376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220210084052.GA69529@thinkpad>
 <CA+V-a8tivrjPoae69pqH1D+B=_Bd7ZzKjCA0PcfBz7Rpf022mA@mail.gmail.com>
 <20220210105023.GB69529@thinkpad>
 <CA+V-a8tfUgvzPyMe_FHuz=8mmC6dPHP7E=e+nCzOey04vCcAkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8tfUgvzPyMe_FHuz=8mmC6dPHP7E=e+nCzOey04vCcAkg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 10, 2022 at 11:05:45AM +0000, Lad, Prabhakar wrote:
> On Thu, Feb 10, 2022 at 10:50 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Thu, Feb 10, 2022 at 09:24:19AM +0000, Lad, Prabhakar wrote:
> > > Hi,
> > >
> > > On Thu, Feb 10, 2022 at 8:40 AM Manivannan Sadhasivam
> > > <manivannan.sadhasivam@linaro.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Wed, Jan 26, 2022 at 07:50:38PM +0000, Lad Prabhakar wrote:
> > > > > Hi All,
> > > > >
> > > > > The current PCIe EPF framework supports DMA data transfers using external
> > > > > DMA only, this patch series aims to add support for platforms supporting
> > > > > internal DMAC on PCIe for data transfers.
> > > > >
> > > > > R-Car PCIe supports internal DMAC to transfer data between Internal Bus to
> > > > > PCI Express and vice versa. Last patch fills up the required flags and ops
> > > > > to support internal DMAC.
> > > > >
> > > > > Patches 1-3 are for PCIe EPF core to support internal DMAC handling, patch
> > > > > 4/5 is to fix test cases based on the conversation [1].
> > > > >
> > > >
> > > > This looks similar to the Synopsys eDMA IP [1] that goes with the Synopsys PCIe
> > > > endpoint IP. Why can't you represent it as a dmaengine driver and use the
> > > > existing DMA support?
> > > >
> > > Let me have a look. Could you please share a link to the Synopsys PCIe
> > > endpoint HW manual (the driver doesn't have a binding doc).
> > >
> >
> > I don't think the PCIe reference manual is available publicly. And you are right
> > that the driver is not tied to devicetree. The reason is, it gets probed using
> > the PCI ID of the EP and all the resources are defined statically in the driver
> > itself.
> >
> In R-Car PCIe the internal dmac is part of the PCIe block itself [0]
> and not a separate block. I don't see any drivers implementing the
> internal dmac drivers as a DMA engine driver. For example the Renesas
> SDHI driver has internal dmac too, this is handled in the SDHI driver
> itself [1] and not implemented as DMA engine driver. Let me know if my
> understanding is wrong here.
> 

Okay, thanks for the clarification. I thought that if the IP is same, we could
implement it as a standalone DMA engine driver, but looks like it is customized.
So I guess it is reasonable to have an internal implementation.

Thanks,
Mani

> [0] https://elixir.bootlin.com/linux/v5.17-rc3/source/Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml#L76
> [1] https://elixir.bootlin.com/linux/v5.17-rc3/source/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> 
> Cheers,
> Prabhakar
> 
> > Thanks,
> > Mani
> >
> > > Cheers,
> > > Prabhakar
> > >
> > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/dma/dw-edma
> > > >
> > > > > Patches are based on top of [1] next branch.
> > > > >
> > > > > [0] https://www.spinics.net/lists/linux-pci/msg92385.html
> > > > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git
> > > > >
> > > > > Cheers,
> > > > > Prabhakar
> > > > >
> > > > > Lad Prabhakar (5):
> > > > >   PCI: endpoint: Add ops and flag to support internal DMAC
> > > > >   PCI: endpoint: Add support to data transfer using internal dmac
> > > > >   misc: pci_endpoint_test: Add driver data for Renesas RZ/G2{EHMN}
> > > > >   misc: pci_endpoint_test: Add support to pass flags for buffer
> > > > >     allocation
> > > > >   PCI: rcar-ep: Add support for DMAC
> > > > >
> > > > >  drivers/misc/pci_endpoint_test.c              |  56 ++++-
> > > > >  drivers/pci/controller/pcie-rcar-ep.c         | 227 ++++++++++++++++++
> > > > >  drivers/pci/controller/pcie-rcar.h            |  23 ++
> > > > >  drivers/pci/endpoint/functions/pci-epf-test.c | 184 ++++++++++----
> > > > >  drivers/pci/endpoint/pci-epf-core.c           |  32 +++
> > > > >  include/linux/pci-epc.h                       |   8 +
> > > > >  include/linux/pci-epf.h                       |   7 +
> > > > >  7 files changed, 483 insertions(+), 54 deletions(-)
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >

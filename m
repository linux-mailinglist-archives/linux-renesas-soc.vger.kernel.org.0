Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E4A7CC38C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 14:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbjJQMqR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Oct 2023 08:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234921AbjJQMqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2023 08:46:16 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8704DB;
        Tue, 17 Oct 2023 05:46:14 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 4AE0367373; Tue, 17 Oct 2023 14:46:09 +0200 (CEST)
Date:   Tue, 17 Oct 2023 14:46:08 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Conor Dooley <conor.dooley@microchip.com>,
        Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        arm-soc <soc@kernel.org>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from
 ARCH_R9A07G043
Message-ID: <20231017124608.GA4386@lst.de>
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de> <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de> <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 17, 2023 at 12:44:41PM +0200, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> On Mon, Oct 16, 2023 at 3:17 PM Christoph Hellwig <hch@lst.de> wrote:
> > On Mon, Oct 16, 2023 at 01:52:57PM +0100, Conor Dooley wrote:
> > > > +   select RISCV_DMA_NONCOHERENT
> > > >     select ERRATA_ANDES if RISCV_SBI
> > > >     select ERRATA_ANDES_CMO if ERRATA_ANDES
> > >
> > > Since this Kconfig menu has changed a bit in linux-next, the selects
> > > are unconditional here, and ERRATA_ANDES_CMO will in turn select
> > > RISCV_DMA_NONCOHERENT.
> >
> > Oh, looks like another patch landed there in linux-next.  I had
> > waited for the previous one go go upstream in -rc6.  Not sure
> > how to best handle this conflict.
> 
> I think the easiest is to ask soc to apply this series?

I don't think pulling all the DMA bits into a random other tree
would be a good idea.   I can hand off the first few bits, but I'd
need a stable branch to pull in after that.  Which of the half a dozen
soc trees we have in linux-next is this anyway?

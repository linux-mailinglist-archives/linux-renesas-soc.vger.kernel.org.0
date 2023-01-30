Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373806814F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 16:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238145AbjA3PYw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 10:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjA3PYv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 10:24:51 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D33D30E8;
        Mon, 30 Jan 2023 07:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=l/UE1BohSbsYPSjuqli4vf8tirXZJGoVCmdHLEf4q2s=; b=f8aP+RFjS52Fxxq6I01TNC2w1E
        5jN4u+I+N01Ci4f09xlt4KIJ9tHTmfAO94SuJcbvTn+zcMt2w1+YFr6fZ95HwKKK+UOcnIW3lR/Na
        avmtpoKYS12t4vAMr2NH+kvHUs67h2uIgoj8frrP7vZpAyZvX1vYVex+XFUw+cOybgPPhpLGFmIoi
        R66WcpMp9bytp0uBRp0STXT1B7yS5ICYN4CF/lpMzQVF+sphmviMwklrlVNOWmGNKZth8+B40kAHR
        exuq2dSOhDPlMNBzcyDKhLQ4SOxDXHlREa2CnYup1aWTuoimj2nDXOXIs5hkOeRNUxBuJuqYIgBd3
        Gp0Gi63Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pMW1Q-00ASYH-IK; Mon, 30 Jan 2023 15:24:40 +0000
Date:   Mon, 30 Jan 2023 15:24:40 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [QUERY]: Block region to mmap
Message-ID: <Y9fhOFEV0kS9U06/@casper.infradead.org>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
 <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 30, 2023 at 10:53:28AM +0000, Lad, Prabhakar wrote:
> > > To avoid this the ILM/DLM memory regions are now added to the root
> > > domain region of the PMPU with permissions set to 0x0 for S/U modes so
> > > that any access to these regions gets blocked and for M-mode we grant
> > > full access (R/W/X). This prevents any users from accessing these
> > > regions by triggering an unhandled signal 11 in S/U modes.
> >
> > I have no idea what any of this means.
> >
> Basically we are making use of the memory protection unit (MPU) so
> that only M-mode is allowed to access this region and S/U modes are
> blocked.

This sounds like RISC-V terminology.  I have no idea what M, S or U
modes are (Supervisor and User, I'd guess for the last two?)

> > > This works as expected but for applications say for example when doing
> > > mmap to this region would still succeed and later down the path when
> > > doing a read/write to this location would cause unhandled signal 11.
> > > To handle this case gracefully we might want mmap() itself to fail if
> > > the addr/offset falls in this local memory region.
> >
> > No, that's not what you want.  You want mmap to avoid allocating address
> > space in that virtual address range.  I don't know if we have a good
> > way to do that at the moment; like I said I've never seen such broken
> > hardware before.
> >
> > I'd say the right way to solve this is to add a new special kind of VMA
> > to the address space that covers this range.
> Do you have any pointers where I can look further into this?

Before we go too deeply into it, how much would it cost to buy all of
these parts and feed them into a shredder?  I'm not entirely joking;
if it's less than the software engineering time it'd take to develop
and support this feature, we should do it.


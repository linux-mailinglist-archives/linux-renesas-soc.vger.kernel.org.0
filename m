Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16AD767CE54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 15:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjAZOiI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 09:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbjAZOiH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:38:07 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F734B754
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=v5lRST3UhBT0bHTWLRn+IKxRT3Fm30qCFhm6PJyxMIA=; b=IhoqLpHc6jxkTvFzdHxeJ+ZYim
        1I7vODMn698IB/zXrwXRkm7oe3KykWcJltyUDuClBppjzwKhcKo6mIH8LWoeiZSgTZkh0g8PuPAF7
        SKBjuWJBTQXLU3Nk1yUPafBTBLWwXUXNBoY0VmzPviNIdHxXME070k779dIeTza7UKSsqvSJGUB+O
        RJQ/rF0/HqknHKnfsMJMBwKPysHHE5vMeYZUxmu2n00HzT5xE8UnnHPpOYmdHtS4x2Mpql3O/Pg8q
        I46BNMEwEK19kWHE9UfWLluLiY+PX+a7mCRvFnuwm1My70xy4B2urvXQoH0De/GEAGI5U0eqGvJlK
        CywF3kGg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pL3Nv-006oVa-FN; Thu, 26 Jan 2023 14:37:51 +0000
Date:   Thu, 26 Jan 2023 14:37:51 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        device-tree <devicetree-discuss@lists.ozlabs.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jessica Clarke <jrtc27@jrtc27.com>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Re: [QUERY]: Block region to mmap
Message-ID: <Y9KQPxzHBuZGIN4U@casper.infradead.org>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 25, 2023 at 12:30:13PM +0000, Lad, Prabhakar wrote:
> Renesas RZ/Five RISC-V SoC has Instruction local memory and Data local
> memory (ILM & DLM) mapped between region 0x30000 - 0x4FFFF. When a
> virtual address falls within this range, the MMU doesn't trigger a
> page fault; it assumes the virtual address is a physical address which
> can cause undesired behaviours.

Wow.  I've never come across such broken behaviour before.

> To avoid this the ILM/DLM memory regions are now added to the root
> domain region of the PMPU with permissions set to 0x0 for S/U modes so
> that any access to these regions gets blocked and for M-mode we grant
> full access (R/W/X). This prevents any users from accessing these
> regions by triggering an unhandled signal 11 in S/U modes.

I have no idea what any of this means.

> This works as expected but for applications say for example when doing
> mmap to this region would still succeed and later down the path when
> doing a read/write to this location would cause unhandled signal 11.
> To handle this case gracefully we might want mmap() itself to fail if
> the addr/offset falls in this local memory region.

No, that's not what you want.  You want mmap to avoid allocating address
space in that virtual address range.  I don't know if we have a good
way to do that at the moment; like I said I've never seen such broken
hardware before.

I'd say the right way to solve this is to add a new special kind of VMA
to the address space that covers this range.  We'd want to make sure
it doesn't appear in /proc/*/maps and also that it can't be overridden
with MAP_FIXED.

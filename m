Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32BA1685FC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Feb 2023 07:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjBAGbu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 01:31:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjBAGbu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 01:31:50 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DDA5399E;
        Tue, 31 Jan 2023 22:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=NIMX5QSIbGn/ciAKNOz2rmy7HeSpbQ+nXuu7nkgLD4E=; b=sjvf26aFQaL4P/69Irl3YfBpFi
        awyO6XJ4FbVxIC5FUin3Ls8Oda54wIOMzJnwBM3kknh0h5OFtcqdTBN85dr9dCkTAqXVhZHop3gCA
        0D6xm5Ss5r2V4Unzzx1bRTPSaT8vFOZyqV/j+i8bRGlzlVOQmfurh9XzKDSxKNFhjuKCrcG+30VVc
        LrRSN+UGEOeKmmd6g3LsqQ2wOr+/i6klKYzj1v1mdQPey8WTIqpqPOwtIcgtaweXeWXz4a+3P/Udx
        bMMSwyHh0OWZSS3gGb0FZiMoeKFllEGO/k8thBewlvzews+9Farf2eMQPIsqTO1wvIbh9kRzq0OkV
        YL3EkJrA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pN6el-00ATMB-Va; Wed, 01 Feb 2023 06:31:43 +0000
Date:   Tue, 31 Jan 2023 22:31:43 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Linux-MM <linux-mm@kvack.org>,
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
Message-ID: <Y9oHT1D1X9cdHLr0@infradead.org>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
 <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
 <Y9fhOFEV0kS9U06/@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9fhOFEV0kS9U06/@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 30, 2023 at 03:24:40PM +0000, Matthew Wilcox wrote:
> > Basically we are making use of the memory protection unit (MPU) so
> > that only M-mode is allowed to access this region and S/U modes are
> > blocked.
> 
> This sounds like RISC-V terminology.  I have no idea what M, S or U
> modes are (Supervisor and User, I'd guess for the last two?)


Yes, M = Machine, S = Supervisor, and U = User.
M omde is the absolutele worst idea of RISC-V and basically a mix
of microcode and super-SMM mode.

> Before we go too deeply into it, how much would it cost to buy all of
> these parts and feed them into a shredder?  I'm not entirely joking;
> if it's less than the software engineering time it'd take to develop
> and support this feature, we should do it.

The above suggests this is in no way an actual hardware problem, but the
stupid decision is done in the M-Mode firmware.  I think it is very
reasonable to simply not support the devices in Linux until the firmware
is fixed.

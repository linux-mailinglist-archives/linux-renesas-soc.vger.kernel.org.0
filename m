Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0087CFA6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Oct 2023 15:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345629AbjJSNKQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Oct 2023 09:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345843AbjJSNKE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2023 09:10:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154AF130
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Oct 2023 06:09:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA301C433C8;
        Thu, 19 Oct 2023 13:09:40 +0000 (UTC)
Message-ID: <280c1e25-1848-4369-9d1b-7641d3e954b0@linux-m68k.org>
Date:   Thu, 19 Oct 2023 23:09:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: fix the non-coherent coldfire dma_alloc_coherent v2
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20231016054755.915155-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Christoph,

On 16/10/23 15:47, Christoph Hellwig wrote:
> Hi all,
> 
> this is the next attempt to not return memory that is not DMA coherent
> on coldfire/m68knommu.  The last one needed more fixups in the fec
> driver, which this versions includes.  On top of that I've also added
> a few more cleanups to the core DMA allocation code.
> 
> Jim: any work to support the set_uncached and remap method for arm32
> should probably be based on this, and patch 3 should make that
> selection a little easier.
> 
> Changes since v1:
>   - sort out the dependency mess in RISCV
>   - don't even built non-coherent DMA support for coldfire cores without
>     data caches
>   - apply the fec workarounds to all coldfire platforms with data caches
>   - add a trivial cleanup for m68k dma.c

This looks good to me for the ColdFire changes. I tested it on a 5208
(version 2 core) with all combinations of cache (instruction only,
data only and both) and it worked good in all cases - with the one
configuration fix to patch 9 I sent earlier. So for ColdFire:

Tested-by: Greg Ungerer <gerg@linux-m68k.org>
Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>

I don't have a 532x ColdFire board, so I can't directly test the case
of a version 3 core with the FEC hardware block.

Regards
Greg


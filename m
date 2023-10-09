Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46BAD7BD7E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 12:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345822AbjJIKEV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 06:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346047AbjJIKET (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 06:04:19 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF6EEDB;
        Mon,  9 Oct 2023 03:04:17 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D54BD1FB;
        Mon,  9 Oct 2023 03:04:57 -0700 (PDT)
Received: from [10.57.69.35] (unknown [10.57.69.35])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2CFD3F7A6;
        Mon,  9 Oct 2023 03:04:14 -0700 (PDT)
Message-ID: <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
Date:   Mon, 9 Oct 2023 11:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        arm-soc <soc@kernel.org>
References: <20231009074121.219686-1-hch@lst.de>
 <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de>
 <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de>
 <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Content-Language: en-GB
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2023-10-09 10:51, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> CC soc
> 
> On Mon, Oct 9, 2023 at 11:43 AM Christoph Hellwig <hch@lst.de> wrote:
>> On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
>>> The fix you are referring too is probably commit c1ec4b450ab729e3
>>> ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
>>> on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
>>>
>>> Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
>>> depend on ARCH_R9A07G043.
>>> RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
>>> up being enabled.
>>
>> Ok, so we need to actually fix this properly.  Lad, can you respin
>> the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?
> 
> ARCH_R9A07G043 does not select DMA_DIRECT_REMAP directly,
> RISCV_DMA_NONCOHERENT does.  And there are other users of
> RISCV_DMA_NONCOHERENT (RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO).
> Should the selection of DMA_DIRECT_REMAP moved to their users?

No, the selection of DMA_GLOBAL_POOL should be removed from 
RISV_DMA_NONCOHERENT and selected directly by ARCH_R9A07G043 (along with 
any of the other implied symbols it needs). Or if as suggested this 
physical-attribute-remap wackiness is due to show up on more platforms 
as well, maybe have a common config for that which selects 
DMA_GLOBAL_POOL plus the relevant cache maintenance extensions as an 
equivalent to RISCV_DMA_NONCOHERENT, and can itself explicitly depend on 
NONPORTABLE for clarity.

Thanks,
Robin.

> Note that the fix is already in soc/for-next, so we need coordination
> with the soc people.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

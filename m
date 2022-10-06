Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B315F6AC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 17:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbiJFPgp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 11:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbiJFPgn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 11:36:43 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A363BD070;
        Thu,  6 Oct 2022 08:36:42 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z97so3366499ede.8;
        Thu, 06 Oct 2022 08:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7ij1WCCQpUXsYyNo/gTLQBKpLKbs/NInCL3omH6TN4=;
        b=AStxJReJKtGbdpM90DVM42z0eLLfuuX7blK4mw4EnrdDFcMT9ziUm2VI0+wX378pyW
         ldvnt2pydPwb7wmOXPwXDBobo/LRf995REJIAsJ2F7UvaGkX4GMb0ot2haHf/72p9xOL
         aNpwb+diWIOqsq+lauBoLFFCyupPgr9DWBcc+SkoKCAApio2YYeRP/wB2J1pjmNmIOIP
         1DTasSZZe9lRwshX3Xbj/TkkLicRnAIi73bplCskDnaIPKBqKsW2GAWntdI0BftBnUZd
         ODKN6oU2PPx+0HniRolS49tAm3ABQPBAnvc3EfVe+N+icqh5/TFYLwTlovQ6VGMyIRpX
         krHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ij1WCCQpUXsYyNo/gTLQBKpLKbs/NInCL3omH6TN4=;
        b=qsJBNw9oTbLKamg2YJNEWgFt8pmcr+fQcirsfeJPL1Qw2aZmA0iiePRXJ8+eW+f/P2
         OhdnsuH8NMoepCtjxS99SgbTRHwYlTK0OQzM/hi2sNsQPrlYC9X7LO23bq+gOwfk3CUF
         DSv3oWz5EWjRYzBPXugicSzeNe1RYgjjklleTDGZV+kFieVE6nylaCU4qsdzVPZhPs4R
         seRH9prUz8zNe4xpimvzccL3vbo8nXQ5aa6t5UXdB8kMj2bR4ndxKy4f7PU4eBnn767s
         kCBQLHtHfqwP2Mn/Aeo7f8hcBF5Jmb07TUratt35Mgqh5I9IOzWLWXi4ZUtmNkAbaitT
         Y1gg==
X-Gm-Message-State: ACrzQf0hUZObMAEJoM9qplzwHnHHi3GHAEczZyCstB2MLgseleGa1jKJ
        FbGX7kMjswaMQiIRPav4Z2TV2j5L3ejzs365q8M=
X-Google-Smtp-Source: AMsMyM6nwSRtM/GPtt2WfVe9TT44svJOiDeg4zjZ+walRYPeKF+lutMI1v54pi0t2OL6pe0WhWva5s4c2rIl5KM3SdU=
X-Received: by 2002:a05:6402:5485:b0:459:147a:d902 with SMTP id
 fg5-20020a056402548500b00459147ad902mr329788edb.263.1665070601076; Thu, 06
 Oct 2022 08:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20221003223222.448551-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221003223222.448551-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAJF2gTQuSX9idEyNmGRwpAsSP8V=+QKQ7UAp28T-seM8rbkwOA@mail.gmail.com>
 <CA+V-a8smkDmQbz76sTA5XfUm7bkY4Ee-L5xYW+-xRWkE1TYiAw@mail.gmail.com>
 <CAJF2gTQ4G-j3p_pHvVQ82R2DFQZq70xgE3ZhoRkxiSzrHnU2og@mail.gmail.com>
 <CA+V-a8tLYT0541FNo_o-sTsV7ywwnGTRtv6ropVu+0Wd-PsM6A@mail.gmail.com> <CAJF2gTQ9N5tyYB46eaMJ=Z0V7pm9TxFAXQ1qxLXLqj2C9zP2Ng@mail.gmail.com>
In-Reply-To: <CAJF2gTQ9N5tyYB46eaMJ=Z0V7pm9TxFAXQ1qxLXLqj2C9zP2Ng@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 6 Oct 2022 16:36:14 +0100
Message-ID: <CA+V-a8uThK9a9Y55FDS98PzWes-3=opwBtBe9Mi0aedbRGeYqw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] soc: renesas: Add L2 cache management for
 RZ/Five SoC
To:     Guo Ren <guoren@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Conor Dooley <conor.dooley@microchip.com>,
        Philipp Tomsich <philipp.tomsich@vrull.eu>,
        Nathan Chancellor <nathan@kernel.org>,
        Atish Patra <atishp@rivosinc.com>,
        Anup Patel <apatel@ventanamicro.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Guo,

On Thu, Oct 6, 2022 at 1:59 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, Oct 5, 2022 at 11:03 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Guo,
> >
> > On Wed, Oct 5, 2022 at 3:23 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Wed, Oct 5, 2022 at 8:54 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > >
> > > > Hi Guo,
> > > >
> > > > On Wed, Oct 5, 2022 at 2:29 AM Guo Ren <guoren@kernel.org> wrote:
> > > > >
> > > > > On Tue, Oct 4, 2022 at 6:32 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > >
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > On the AX45MP core, cache coherency is a specification option so it may
> > > > > > not be supported. In this case DMA will fail. As a workaround, firstly we
> > > > > > allocate a global dma coherent pool from which DMA allocations are taken
> > > > > > and marked as non-cacheable + bufferable using the PMA region as specified
> > > > > > in the device tree. Synchronization callbacks are implemented to
> > > > > > synchronize when doing DMA transactions.
> > > > > >
> > > > > > The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> > > > > > block that allows dynamic adjustment of memory attributes in the runtime.
> > > > > > It contains a configurable amount of PMA entries implemented as CSR
> > > > > > registers to control the attributes of memory locations in interest.
> > > > > >
> > > > > > Below are the memory attributes supported:
> > > > > > * Device, Non-bufferable
> > > > > > * Device, bufferable
> > > > > > * Memory, Non-cacheable, Non-bufferable
> > > > > > * Memory, Non-cacheable, Bufferable
> > > > > > * Memory, Write-back, No-allocate
> > > > > > * Memory, Write-back, Read-allocate
> > > > > > * Memory, Write-back, Write-allocate
> > > > > > * Memory, Write-back, Read and Write-allocate
> > > > > Seems Svpbmt's PMA, IO, and NC wouldn't fit your requirements, could
> > > > > give a map list of the types of Svpbmt? And give out what you needed,
> > > > > but Svpbmt can't.
> > > > >
> > > > Sorry I didn't get what you meant here, could you please elaborate.
> > > I know there is no pbmt in AX45MP, I am just curious how many physical
> > > memory attributes you would use in linux? It seems only one type used
> > > in the series:
> > > cpu_nocache_area_set -> sbi_ecall(SBI_EXT_ANDES,
> > > SBI_EXT_ANDES_SET_PMA, offset, vaddr, size, entry_id, 0, 0);
> > >
> > Yes, currently we only use "Memory, Non-cacheable, Bufferable". I was
> > wondering if we could send these options as flags from DT something
> > like below so that it's not hard coded in the code.
> >
> > /* PMA config */
> > #define AX45MP_PMACFG_ETYP                GENMASK(1, 0)
> > /* OFF: PMA entry is disabled */
> > #define AX45MP_PMACFG_ETYP_DISABLED            0
> > /* Naturally aligned power of 2 region */
> > #define AX45MP_PMACFG_ETYP_NAPOT            3
> >
> > #define AX45MP_PMACFG_MTYP                GENMASK(5, 2)
> > /* Device, Non-bufferable */
> > #define AX45MP_PMACFG_MTYP_DEV_NON_BUF            (0 << 2)
> > /* Device, bufferable */
> > #define AX45MP_PMACFG_MTYP_DEV_BUF            (1 << 2)
> > /* Memory, Non-cacheable, Non-bufferable */
> > #define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF    (2 << 2)
> > /* Memory, Non-cacheable, Bufferable */
> > #define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF        (3 << 2)
> > /* Memory, Write-back, No-allocate */
> > #define AX45MP_PMACFG_MTYP_MEM_WB_NA            (8 << 2)
> > /* Memory, Write-back, Read-allocate */
> > #define AX45MP_PMACFG_MTYP_MEM_WB_RA            (9 << 2)
> > /* Memory, Write-back, Write-allocate */
> > #define AX45MP_PMACFG_MTYP_MEM_WB_WA            (10 << 2)
> > /* Memory, Write-back, Read and Write-allocate */
> > #define AX45MP_PMACFG_MTYP_MEM_WB_R_WA            (11 << 2)
> >
> > /* AMO instructions are supported */
> > #define AX45MP_PMACFG_NAMO_AMO_SUPPORT            (0 << 6)
> > /* AMO instructions are not supported */
> > #define AX45MP_PMACFG_NAMO_AMO_NO_SUPPORT        (1 << 6)
> >
> >
> >                 pma-regions = <0x0 0x00000000 0x0 0x10000000 0x0
> > AX45MP_PMACFG_ETYP_NAPOT |  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF |
> > AX45MP_PMACFG_NAMO_AMO_SUPPORT>,
> >                               <0x0 0x10000000 0x0 0x04000000 0x0
> > AX45MP_PMACFG_ETYP_NAPOT |  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF |
> > AX45MP_PMACFG_NAMO_AMO_SUPPORT >,
> >                               <0x0 0x20000000 0x0 0x10000000 0x0
> > AX45MP_PMACFG_ETYP_NAPOT |  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF |
> > AX45MP_PMACFG_NAMO_AMO_SUPPORT>,
> >                               <0x0 0x58000000 0x0 0x08000000 0x0
> > AX45MP_PMACFG_ETYP_NAPOT |  AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF |
> > AX45MP_PMACFG_NAMO_AMO_SUPPORT>;
> >
> > Does the above sound good?
> I've no idea. But for working around, I would give Acked-by.
>
> >
> > > I'm not sure how you make emmc/usb/gmac's dma ctrl desc work around
> > > without pbmt when they don't have cache coherency protocol. Do you
> > > need to inject dma_sync for desc synchronization? What's the effect of
> > > dynamic PMA in the patch series?
> > >
> > Currently we have setup the pma regions as below:
> >
> > l2cache: cache-controller@13400000 {
> >                 compatible = "andestech,ax45mp-cache", "cache";
> >                 cache-size = <0x40000>;
> >                 cache-line-size = <64>;
> >                 cache-sets = <1024>;
> >                 cache-unified;
> >                 reg = <0x0 0x13400000 0x0 0x100000>;
> >                 pma-regions = <0x0 0x00000000 0x0 0x10000000 0x0 0xf>,
> >                               <0x0 0x10000000 0x0 0x04000000 0x0 0xf>,
> >                               <0x0 0x20000000 0x0 0x10000000 0x0 0xf>,
> >                               <0x0 0x58000000 0x0 0x08000000 0x0 0xf>;
> >                 interrupts = <SOC_PERIPHERAL_IRQ(476, IRQ_TYPE_LEVEL_HIGH)>;
> >         };
> >
> > The last pma-regions entry 0x58000000 is a DDR location this memory
> > locations is marked as shared DMA pool with below in DT,
> >
> >     reserved-memory {
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> >         ranges;
> >
> >         reserved: linux,cma@58000000 {
> >             compatible = "shared-dma-pool";
> >             no-map;
> >             linux,dma-default;
> >             reg = <0x0 0x58000000 0x0 0x08000000>;
> >         };
> >     };
> >
> > And for ARCH_R9A07G043 we automatically select DMA_GLOBAL_POOL, so the
> > IP blocks (emmc/usb/gmac's) requesting DMA'able memory will
> > automatically fall into this region which is non-cacheable but
> > bufferable (set in PMA) and rest everything is taken care by clean and
> > flush callbacks. We dont have  inject dma_sync for desc
> > synchronization for existing drivers (which are shared with Renesas
> > RZ/G2L family)
> Better than I thought :). The "non-cacheable but bufferable" is "weak
> order," also raising the bufferable signal of AXI transactions. Right?
I've asked the HW team regarding this to confirm.

> But some drivers think ctrl desc is strong order without bufferable
> and don't put any mb() before/after IO control operations.
>
So far with current testing of suffering block (dmac/emmc/usb/eth)
drivers we have not seen any issues so far.

Cheers,
Prabhakar

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72C5162F1AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 10:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242074AbiKRJqa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 04:46:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241078AbiKRJp5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 04:45:57 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8248FB30
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 01:45:44 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so7822951pjs.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i0aBxW4zoc1DREuFvmE3vtsb+OzQsL7fgKNQoV181Q8=;
        b=b2LtG6VqEaNBuV8pAHM9dhFXmkq89QhvtIFwhy1E8VRQkvbM+ogmxi9JNmfNNzAp1D
         l3euDJLS7zgZYELSNTbSGg921koDiAUCE7qsal9NMIBpgzbPoIhty+ltlliCxiWBLz96
         /EmKIViBSEaB5GdUfb3R2Amfk0rpZWMPkh1t21EI5lZPaYMMOcMhHPhwq2kwTZV9/Gw0
         iOR++nZ5bSoV919LzLaOoguzRntHSOsjgZB23tpCnUVXI/s+eXyjBBDQLOIAo8xIkKLE
         Z1RyrHz3zzyjYgC3sk1rSPUn1M6BqYuPZXIS24xfQyv8Vz/7VtG04/GDqxwAG/5ohrm9
         oILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0aBxW4zoc1DREuFvmE3vtsb+OzQsL7fgKNQoV181Q8=;
        b=3wR1X75BuvdWxrkEaPxZrNEqT8LgN7NFGqAIp/xIsLUiB/FWjnY8bmgiFbwJCMi0Ty
         Hclt7wOb1Up13UHjUZMQVY2iNd/8XhX1XZOOFmyR6qll6sbERGQjlgZiUpOElnnT0mS1
         buTZLhWt86YjY1NnxmG4q8cKYuSi1/rtjl2CeDsWn8SGVEKBJ9BjPQEcKktwun89sBhb
         uA7htLzGp8Z9i8RTPjv5+HQzQHjVlXmOtWtFw3E0XCQuO+zG3YshmlHbFRVZfd150zd/
         hY1uCmUBOK3UNf+OVW7yHnAKthlYkOb8UJo7ixHwFtAOdgp4yY1xi4ZZdDA2C7IRIJNr
         VZ7w==
X-Gm-Message-State: ANoB5pmYemGFnmMA+deEhbxvsX7XHw50v1rEO9URxS9c+THj1tBshmxU
        JZL1L6x0cuoVzKrVItWF1XmL7E8GoG9TlbOZU1M3+g==
X-Google-Smtp-Source: AA0mqf6cto5RcJo40rQ45nO5gwGcHbn55PMhmiSHAFiLSYxRnJu1Bx+Fv6v12UjooN8+e+UXcs8VPbXcU0L4l8HOhBU=
X-Received: by 2002:a17:902:bcc9:b0:186:be05:798e with SMTP id
 o9-20020a170902bcc900b00186be05798emr6760875pls.37.1668764743808; Fri, 18 Nov
 2022 01:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 18 Nov 2022 10:45:06 +0100
Message-ID: <CAPDyKFr3+5SqLPJGikZoFvwupak+xLz_HXSe5ieuWxNX4TN2LA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] mmc: renesas_sdhi: add support for DMA end irqs
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 6 Oct 2022 at 21:05, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Motivation for this series from patch 5:
>
> ===
> So far, we have been relying on access_end interrupts only to mark DMA
> transfers as done implying that DMA end interrupts have occurred by then
> anyhow. On some SoCs under some conditions, this turned out to be not
> enough. So, we enable DMA interrupts as well and make sure that both
> events, DMA irq and access_end irq, have happened before finishing the
> DMA transfer.
> ===
>
> The first two patches are cleanups. For the rest, the basis were BSP
> patches, but they have been refactored heavily, so they look very
> different now:
>
> * self-contained
>   except for the new dma_irq callback which is for the TMIO core, all
>   other code is self-contained in renesas_sdhi_internal_dmac now.
> * concise
>   Less new members for the existing structs, also code duplication was
>   avoided by moving code to more suitable locations
> * replaced the spinlock with atomic bit operators
> * used quirk mechanism for the old INFO1 layout
>
> Tested on a Salvator-X board with M3-W (r8a77960) and a Salvator-XS
> board with M3-N (r8a77965). No regression encountered in functionality
> and performance. A branch can be found here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/upport_dmaend
>
>
> Here are excerpts of a log when booting the M3-N with patch 6 applied to
> show that all combinations of incoming irqs are handled:
>
> === DMA first, Access second ===
>
>           <idle>-0       [000] d.h..     0.505454: renesas_sdhi_internal_dmac_dma_irq: DMA end
>           <idle>-0       [000] d.h..     0.505496: renesas_sdhi_internal_dmac_dataend_dma: Access end: 0
>           <idle>-0       [000] ..s..     0.505498: renesas_sdhi_internal_dmac_complete_tasklet_fn: Tasklet
>
> === Access first, DMA second ===
>
>      kworker/0:2-42      [000] d.h..     0.510603: renesas_sdhi_internal_dmac_dataend_dma: Access end: 0
>      kworker/0:2-42      [000] d.h..     0.510605: renesas_sdhi_internal_dmac_dma_irq: DMA end
>      kworker/0:2-42      [000] ..s..     0.510606: renesas_sdhi_internal_dmac_complete_tasklet_fn: Tasklet
>
> === Access first, Simulated DMA second ===
>
>           <idle>-0       [000] d.H..     0.510635: renesas_sdhi_internal_dmac_dataend_dma: Access end: 0
>           <idle>-0       [000] ..s..     0.510637: renesas_sdhi_internal_dmac_issue_tasklet_fn: Simulated DMA end
>           <idle>-0       [000] ..s..     0.510638: renesas_sdhi_internal_dmac_complete_tasklet_fn: Tasklet
>
> (I have never seen Simulated DMA (= CMD error happened) first, but it
> should be handled like regular DMA end as well(tm).)
>
> === Access first, no DMA end needed because of DATA error (EILSEQ) ===
>
>           <idle>-0       [000] d.H..     0.510894: renesas_sdhi_internal_dmac_dataend_dma: Access end: -84
>           <idle>-0       [000] ..s..     0.510896: renesas_sdhi_internal_dmac_complete_tasklet_fn: Tasklet
>
> ===
>
> I think this is as far as I can reach alone. I'd love to get review
> comments and further testing. Shimoda-san, can you kindly ask the BSP
> team to do further testing?
>
> Thank you everyone and happy hacking,
>
>    Wolfram
>
>
> Wolfram Sang (6):
>   mmc: renesas_sdhi: remove accessor function for internal_dmac
>   mmc: renesas_sdhi: improve naming of DMA struct
>   mmc: tmio: add callback for dma irq
>   mmc: renesas_sdhi: add quirk for broken register layout
>   mmc: renesas_sdhi: take DMA end interrupts into account
>   DEBUG mmc: renesas_sdhi: debug end_flags for DMA
>
>  drivers/mmc/host/renesas_sdhi.h               | 14 ++-
>  drivers/mmc/host/renesas_sdhi_core.c          |  2 +-
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 86 ++++++++++++-------
>  drivers/mmc/host/tmio_mmc.h                   |  1 +
>  drivers/mmc/host/tmio_mmc_core.c              |  3 +
>  5 files changed, 72 insertions(+), 34 deletions(-)
>

Patch 1->5 applied for next, thanks!

Kind regards
Uffe

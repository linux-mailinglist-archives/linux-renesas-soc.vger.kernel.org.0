Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4665F6DDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Oct 2022 21:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbiJFTFd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Oct 2022 15:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232093AbiJFTFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2022 15:05:12 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC40711C18
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Oct 2022 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=eg3lq46r5Z1oVAOyVdCgPqNupNG
        GqPqiJ2NAOmWzYE4=; b=CKiVp7nuR8eANSRLaQWiQL3xICM9Gjji+eu6NHUcbBn
        pQNkVK8RVTdZH542a+hTT86vET3IVmCiGX8NbIg30NlV1c0yYfo/g0+2Mcq2MYn/
        ACuC3flVWla1tOi3XQhef1uwTA6TTKp/dbg0eqJgznS5Qsd00yy7Y501aLfPSOPo
        =
Received: (qmail 1467487 invoked from network); 6 Oct 2022 21:05:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2022 21:05:01 +0200
X-UD-Smtp-Session: l3s3148p1@ZTGNXmLqkO4ucrRL
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFC 0/6] mmc: renesas_sdhi: add support for DMA end irqs
Date:   Thu,  6 Oct 2022 21:04:46 +0200
Message-Id: <20221006190452.5316-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Motivation for this series from patch 5:

===
So far, we have been relying on access_end interrupts only to mark DMA
transfers as done implying that DMA end interrupts have occurred by then
anyhow. On some SoCs under some conditions, this turned out to be not
enough. So, we enable DMA interrupts as well and make sure that both
events, DMA irq and access_end irq, have happened before finishing the
DMA transfer.
===

The first two patches are cleanups. For the rest, the basis were BSP
patches, but they have been refactored heavily, so they look very
different now:

* self-contained
  except for the new dma_irq callback which is for the TMIO core, all
  other code is self-contained in renesas_sdhi_internal_dmac now.
* concise
  Less new members for the existing structs, also code duplication was
  avoided by moving code to more suitable locations
* replaced the spinlock with atomic bit operators
* used quirk mechanism for the old INFO1 layout

Tested on a Salvator-X board with M3-W (r8a77960) and a Salvator-XS
board with M3-N (r8a77965). No regression encountered in functionality
and performance. A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/upport_dmaend


Here are excerpts of a log when booting the M3-N with patch 6 applied to
show that all combinations of incoming irqs are handled:

=== DMA first, Access second ===

          <idle>-0       [000] d.h..     0.505454: renesas_sdhi_internal_dmac_dma_irq: DMA end
          <idle>-0       [000] d.h..     0.505496: renesas_sdhi_internal_dmac_dataend_dma: Access end: 0
          <idle>-0       [000] ..s..     0.505498: renesas_sdhi_internal_dmac_complete_tasklet_fn: Tasklet

=== Access first, DMA second ===

     kworker/0:2-42      [000] d.h..     0.510603: renesas_sdhi_internal_dmac_dataend_dma: Access end: 0
     kworker/0:2-42      [000] d.h..     0.510605: renesas_sdhi_internal_dmac_dma_irq: DMA end
     kworker/0:2-42      [000] ..s..     0.510606: renesas_sdhi_internal_dmac_complete_tasklet_fn: Tasklet

=== Access first, Simulated DMA second ===

          <idle>-0       [000] d.H..     0.510635: renesas_sdhi_internal_dmac_dataend_dma: Access end: 0
          <idle>-0       [000] ..s..     0.510637: renesas_sdhi_internal_dmac_issue_tasklet_fn: Simulated DMA end
          <idle>-0       [000] ..s..     0.510638: renesas_sdhi_internal_dmac_complete_tasklet_fn: Tasklet

(I have never seen Simulated DMA (= CMD error happened) first, but it
should be handled like regular DMA end as well(tm).)

=== Access first, no DMA end needed because of DATA error (EILSEQ) ===

          <idle>-0       [000] d.H..     0.510894: renesas_sdhi_internal_dmac_dataend_dma: Access end: -84
          <idle>-0       [000] ..s..     0.510896: renesas_sdhi_internal_dmac_complete_tasklet_fn: Tasklet

===

I think this is as far as I can reach alone. I'd love to get review
comments and further testing. Shimoda-san, can you kindly ask the BSP
team to do further testing?

Thank you everyone and happy hacking,

   Wolfram


Wolfram Sang (6):
  mmc: renesas_sdhi: remove accessor function for internal_dmac
  mmc: renesas_sdhi: improve naming of DMA struct
  mmc: tmio: add callback for dma irq
  mmc: renesas_sdhi: add quirk for broken register layout
  mmc: renesas_sdhi: take DMA end interrupts into account
  DEBUG mmc: renesas_sdhi: debug end_flags for DMA

 drivers/mmc/host/renesas_sdhi.h               | 14 ++-
 drivers/mmc/host/renesas_sdhi_core.c          |  2 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 86 ++++++++++++-------
 drivers/mmc/host/tmio_mmc.h                   |  1 +
 drivers/mmc/host/tmio_mmc_core.c              |  3 +
 5 files changed, 72 insertions(+), 34 deletions(-)

-- 
2.35.1


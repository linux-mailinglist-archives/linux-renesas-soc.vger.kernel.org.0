Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7CC040886C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 11:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238749AbhIMJj6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 05:39:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:50240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238766AbhIMJjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 05:39:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E632A60F4C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631525913;
        bh=Rl8XMT/pB5YbVatAVka7mW/uh4Quy/cFb4y0V9VSw60=;
        h=Subject:From:Date:To:From;
        b=LILNiZOgnkIi9JbTwcjal7BZLKSoOgOsMzLQfgl/GBGwg2/2dyxJtQg/vjV5Szx4j
         YsmwttBxuT4cqqlqD+ckNYdH+o40l0pasl7acfzt1Rk83NWCMDs0q0kyfndP1xVw2c
         QxjPo2qCgKcHKXubg8IIfMdmjeCVStmRNItuPhofaLTe6jwfwdTJW8dT8G34um9zMV
         MierRdftufCIsJH2T5+GjsyUctJOR8W5NikiKVBRTB+JBDhZfjy71jZWmUxztiLO0v
         aSCf77Nz8kd97DhGeXb9NqG67oSc8KcHswvrp0JHTetrzkQcQsD6v2bsrQzgAPez5+
         8TlSRLqRB6qzA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D7C8F60A6A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Sep 2021 09:38:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163152591382.31672.12824710329996623559.git-patchwork-summary@kernel.org>
Date:   Mon, 13 Sep 2021 09:38:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: drm: rcar-du: lvds: use dev_err_probe()
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=505467
  Lore link: https://lore.kernel.org/r/20210623030646.7720-1-laurent.pinchart+renesas@ideasonboard.com
Series: Add Factorisation code to support Gigabit Ethernet driver
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=536957
  Lore link: https://lore.kernel.org/r/20210825070154.14336-1-biju.das.jz@bp.renesas.com
    Patches: [net-next,01/13] ravb: Remove the macros NUM_TX_DESC_GEN[23]
             [net-next,02/13] ravb: Add multi_irq to struct ravb_hw_info
             [net-next,03/13] ravb: Add no_ptp_cfg_active to struct ravb_hw_info
             [net-next,04/13] ravb: Add ptp_cfg_active to struct ravb_hw_info
             [net-next,05/13] ravb: Factorise ravb_ring_free function
             [net-next,06/13] ravb: Factorise ravb_ring_format function
             [net-next,07/13] ravb: Factorise ravb_ring_init function
             [net-next,08/13] ravb: Factorise ravb_rx function
             [net-next,09/13] ravb: Factorise ravb_adjust_link function
             [net-next,10/13] ravb: Factorise ravb_set_features
             [net-next,11/13] ravb: Factorise ravb_dmac_init function
             [net-next,12/13] ravb: Factorise ravb_emac_init function
             [net-next,13/13] ravb: Add reset support
Patch: arm64: dts: renesas: r8a77961: Add TPU device node
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=538133
  Lore link: https://lore.kernel.org/r/20210827073819.29992-1-wsa+renesas@sang-engineering.com
Patch: ASoC: sh: rz-ssi: Fix wrong operator used issue
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=532229
  Lore link: https://lore.kernel.org/r/20210816182336.29959-1-biju.das.jz@bp.renesas.com
Patch: [v2] staging: board: Fix uninitialized spinlock when attaching genpd
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=515359
  Lore link: https://lore.kernel.org/r/57783ece7ddae55f2bda2f59f452180bff744ea0.1626257398.git.geert+renesas@glider.be
Patch: [RFC] ASoC: sh: rcar: dma: : use proper DMAENGINE API for termination
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=505663
  Lore link: https://lore.kernel.org/r/20210623100545.3926-1-wsa+renesas@sang-engineering.com
Patch: ASoC: sh: rz-ssi: Fix dereference of noderef expression warning
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=532055
  Lore link: https://lore.kernel.org/r/20210816132049.28128-1-biju.das.jz@bp.renesas.com
Patch: mmc: renesas_sdhi: sys_dmac: abort DMA synced to avoid timeouts
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=504095
  Lore link: https://lore.kernel.org/r/20210621070009.13655-1-wsa+renesas@sang-engineering.com
Patch: [v3] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_dma_request function
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=533341
  Lore link: https://lore.kernel.org/r/20210818101450.15948-1-biju.das.jz@bp.renesas.com
Series: arm64: dts: renesas: r8a779a0: Add initial IPMMU support
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=540499
  Lore link: https://lore.kernel.org/r/20210901111305.570206-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [1/2] arm64: dts: renesas: r8a779a0: Add IPMMU nodes
             [2/2] arm64: dts: renesas: r8a779a0: Add iommus into sdhi node
Patch: [v2] can: rcar_canfd: add __maybe_unused annotation to silence warning
  Submitter: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=542789
  Lore link: https://lore.kernel.org/r/20210907064537.1054268-1-mkl@pengutronix.de
Patch: net: renesas: sh_eth: Fix freeing wrong tx descriptor
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=543089
  Lore link: https://lore.kernel.org/r/20210907112940.967985-1-yoshihiro.shimoda.uh@renesas.com
Series: [1/2] drm: rcar-du: Don't put reference to drm_device in rcar_du_remove()
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=453365
  Lore link: https://lore.kernel.org/r/20210323005616.20110-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/2] drm: rcar-du: Don't put reference to drm_device in rcar_du_remove()
             [2/2] drm: rcar-du: Shutdown the display on remove
Patch: drm: rcar-du: lvds: Don't set bridge driver_private field
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=505465
  Lore link: https://lore.kernel.org/r/20210623030545.7627-1-laurent.pinchart+renesas@ideasonboard.com
Patch: drm: rcar-du: Shutdown the display on system shutdown
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=453353
  Lore link: https://lore.kernel.org/r/20210323001246.16182-1-laurent.pinchart+renesas@ideasonboard.com
Patch: PCI: rcar: Fix runtime PM imbalance in rcar_pcie_ep_probe
  Submitter: Dinghao Liu <dinghao.liu@zju.edu.cn>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=463033
  Lore link: https://lore.kernel.org/r/20210408072402.15069-1-dinghao.liu@zju.edu.cn
Patch: drm/bridge: Centralize error message when bridge attach fails
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=467391
  Lore link: https://lore.kernel.org/r/20210415014710.4033-1-laurent.pinchart+renesas@ideasonboard.com
Patch: [v3] drm/shmobile: Convert to Linux IRQ interfaces
  Submitter: Thomas Zimmermann <tzimmermann@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=518135
  Lore link: https://lore.kernel.org/r/20210720080941.23646-1-tzimmermann@suse.de

Total patches: 32

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



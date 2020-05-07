Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E0E1C8B2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2020 14:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgEGMko (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 May 2020 08:40:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:59736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbgEGMki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 May 2020 08:40:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588855238;
        bh=2m1I2kH1mvB2FMQ2n2Dq6RB4YhSkOuGheM/W+uexRBw=;
        h=Subject:From:Date:To:From;
        b=N6MV92YgzBbcvitiic1Bxgph0N6WB+pulLLi0B1uE/9po4c20GBwpltkmpkQxGMRW
         zMRUc/zFwdK/Jkca4G+n3ONytLbkM1CHY9Sf3cnfKE4SfJXlG4Vg4zll2oN5aPOgoa
         BUcan+eH5N5ZdDBvhSM9M1Iv0UJGgT8slsL6C2tU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158885523806.11036.12424754599729552381.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 07 May 2020 12:40:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v10] Add endpoint driver for R-Car PCIe controller (2020-05-07T12:33:11)
  Superseding: [v9] Add endpoint driver for R-Car PCIe controller (2020-04-23T18:22:31):
    [v9,1/8] PCI: rcar: Rename pcie-rcar.c to pcie-rcar-host.c
    [v9,2/8] PCI: rcar: Move shareable code to a common file
    [v9,3/8] PCI: rcar: Fix calculating mask for PCIEPAMR register
    [v9,4/8] PCI: endpoint: Pass page size as argument to pci_epc_mem_init()
    [v9,5/8] PCI: endpoint: Add support to handle multiple base for mapping outbound memory
    [v9,6/8] dt-bindings: PCI: rcar: Add bindings for R-Car PCIe endpoint controller
    [v9,7/8] PCI: rcar: Add endpoint mode support
    [v9,8/8] MAINTAINERS: Add file patterns for rcar PCI device tree bindings


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

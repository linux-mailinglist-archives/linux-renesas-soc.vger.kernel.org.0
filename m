Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB7C1AFAD4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2020 15:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgDSNkj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 Apr 2020 09:40:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:55046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbgDSNki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Apr 2020 09:40:38 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587303638;
        bh=0d+zMDj1vDIQVKCrr8NQt89mqwSvdxPp8QEBTRNQ+M0=;
        h=Subject:From:Date:To:From;
        b=Qk9dB/IObVzywmNS4WDlVPUU2EyXuIcgWgZmx5qF7aa9RTnaCWEJSpL/ev8r6Gabx
         V0XGDYHAxThEwNBlPXFxGoW7Z7idxMTpyOnNgTrGtSc57lwDl+hSTJ1rqtE8EdqRSi
         ToxWxMT9LWdyPCU4wQIjSSyjFqwEz3FFx2VyW7ag=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158730363859.535.5990453612406409242.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 19 Apr 2020 13:40:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v8] Add support for PCIe controller to work in endpoint mode on R-Car/RZ/G2x SoCs (2020-04-19T13:26:55)
  Superseding: [v7] Add support for PCIe controller to work in endpoint mode on R-Car/RZ/G2x SoCs (2020-04-08T15:37:52):
    [v7,1/8] PCI: rcar: Rename pcie-rcar.c to pcie-rcar-host.c
    [v7,2/8] PCI: rcar: Move shareable code to a common file
    [v7,3/8] PCI: rcar: Fix calculating mask for PCIEPAMR register
    [v7,4/8] PCI: endpoint: Add support to handle multiple base for mapping outbound memory
    [v7,5/8] dt-bindings: PCI: rcar: Add bindings for R-Car PCIe endpoint controller
    [v7,6/8] PCI: rcar: Add support for R-Car PCIe controller in endpoint mode
    [v7,7/8] PCI: Add Renesas R8A774C0 device ID
    [v7,8/8] MAINTAINERS: Add file patterns for rcar PCI device tree bindings


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 183E3173C5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2020 17:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgB1QAl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Feb 2020 11:00:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:42492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726951AbgB1QAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 11:00:41 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582905640;
        bh=d4zQ73zhumqJYFD4tJVheMTTReSM3lvnPQqlxbyk3Gw=;
        h=Subject:From:Date:To:From;
        b=ID+MyNlYBa1EIMBFGsiv/1BLcd3PIUttqUkZ2OxIbtXgeYBCHM2HXlFtcidXwus16
         kz1MWH8YAohgcPWs0ivBSn7cr/MUToep4bGFdCmepTN7HoqGq22i6cJvWZkwJ5u9OD
         hSnGu1UtxmIe6hwFCgF6+rdJjdWt+rxuw+lkfd3g=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158290564075.29569.9055219949847644201.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 28 Feb 2020 16:00:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] Add support for PCIe controller to work in endpoint mode on R-Car SoCs (2020-02-28T15:41:15)
  Superseding: [v4] Add support for PCIe controller to work in endpoint mode on R-Car SoCs (2020-02-08T18:36:35):
    [v4,1/6] PCI: rcar: Preparation for adding endpoint support
    [v4,2/6] PCI: rcar: Fix calculating mask for PCIEPAMR register
    [v4,3/6] PCI: endpoint: Add support to handle multiple base for mapping outbound memory
    [v4,4/6] dt-bindings: PCI: rcar: Add bindings for R-Car PCIe endpoint controller
    [v4,5/6] PCI: rcar: Add support for rcar PCIe controller in endpoint mode
    [v4,6/6] misc: pci_endpoint_test: Add Device ID for RZ/G2E PCIe controller


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBBFEBE09
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 07:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfKAGkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 02:40:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:47842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbfKAGkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 02:40:37 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572590437;
        bh=XIMGQG3cEwUHP8nE+KNr9Y5N7qy0OZyPbMLV5f4frbM=;
        h=Subject:From:Date:To:From;
        b=t/zOSsbo/eSKsB5+7pBBM75rET8Ru7qYqaCSVONpe9ilb+8VUCPiOj0ZBSVaVMkeu
         UeLsAc71GIxPo4mackzg0OrT7RIw61sMvJIj/hQ1+DP2pq7f8ZgsYYVNOfyRyNU021
         cX8H5aInCP8mI+zlbIETaSJpjR0seilU2B3142y0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157259043718.9316.956653936339923793.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 01 Nov 2019 06:40:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] PCI: rcar: Fix missing MACCTLR register setting (take2) (2019-11-01T06:31:29)
  Superseding: [v1] PCI: rcar: Fix missing MACCTLR register setting (take2) (2019-10-30T11:27:02):
    [1/2] Revert "PCI: rcar: Fix missing MACCTLR register setting in rcar_pcie_hw_init()"
    [2/2] PCI: rcar: Fix missing MACCTLR register setting in initialize sequence


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

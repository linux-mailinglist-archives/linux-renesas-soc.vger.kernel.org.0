Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E8A23A1B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Aug 2020 11:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgHCJUx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Aug 2020 05:20:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbgHCJUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Aug 2020 05:20:53 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596446452;
        bh=dsa2gYDiEXOWoFxKZEhp64ysKsZwg+hw88VSbZ6cB+4=;
        h=Subject:From:Date:To:From;
        b=Y9NgC6eIseUA9aPDFCwPEtMYAHamOCjIcavWoOsQOKVJ+9j+LUE4eBmKbXXdwrYwF
         1zbZULHnbL7XrJzt0V0VthW9QtGAQsQFXIucr2OF1+CSQDbFjZGl/NBfiSAQuwC3jn
         BYNGVomZW1AmzIbBVjBz3c9SOZL48xe1ZfPs3vJU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159644645257.11858.7008536458210483677.git-patchwork-summary@kernel.org>
Date:   Mon, 03 Aug 2020 09:20:52 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: i2c: rcar: always clear ICSAR to avoid side effects
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=312881
  Link: <20200704133829.7015-1-wsa+renesas@sang-engineering.com>

Patch: serial: sh-sci: Initialize spinlock for uart console
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=311331
  Link: <1593618100-2151-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>

Patch: [v3] net: ethernet: ravb: exit if re-initialization fails in tx timeout
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=321707
  Link: <1595312592-28666-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Patch: drm: of: Fix double-free bug
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323119
  Link: <1595502654-40595-1-git-send-email-biju.das.jz@bp.renesas.com>

Patch: [v2] dmaengine: sh: usb-dmac: set tx_result parameters
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=304951
  Link: <1592482053-19433-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FAA258E27
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 14:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbgIAMXf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 08:23:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:46024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728014AbgIAMUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 08:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598962825;
        bh=L4/ZInsdcadnufdKzNNbnt+6auDQhKMjqhEvDvekB20=;
        h=Subject:From:Date:To:From;
        b=It2pQ39oLNEp9I/vNNlEXs7jZHQLCXmPrJLAUmUbLXAP9Pdlwg+z2iNvwtK46NV2F
         LFx2geMGjEqGmQ+0df0/78oP4ObIHgNwMFGWmpqrVbbZ9KCGayMynXrR0dgCiKlP6M
         cJit2UYjIXZm4BE+AthkpHYgICtZxseZY+hB9u70=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159896282509.29418.15874695880555358031.git-patchwork-summary@kernel.org>
Date:   Tue, 01 Sep 2020 12:20:25 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Series: Enable CONFIG_PCIE_RCAR_HOST
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=338733
  Link: <20200826093220.10266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
    Patches: [1/2] ARM: multi_v7_defconfig: enable CONFIG_PCIE_RCAR_HOST
             [2/2] ARM: shmobile: defconfig: enable CONFIG_PCIE_RCAR_HOST

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

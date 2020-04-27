Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3C41BA0F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2020 12:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgD0KUr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 06:20:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbgD0KUr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 06:20:47 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587982844;
        bh=OMICJ2CLq6phOnWPtM50VjGKAO/aqqWhJTVghmO0j9o=;
        h=Subject:From:Date:To:From;
        b=L1nDq18HUei2XxbZ8xhgTD18a9V3fsRhAy2hK3UWHIDYdwdWT5TPW+WckCV6NXDK5
         ij+7RSodR8jT75QoN/DP/i9sRRxEvIhEfoPpm5/6yE9MMSEIV3Ang56QJISJO3SG6Q
         KkGuKjcntgULG2/IqWMckHXNqGsyJF6McjexgF3A=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158798284437.4547.14705469761223683491.git-patchwork-summary@kernel.org>
Date:   Mon, 27 Apr 2020 10:20:44 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: shmobile: Update CMT1 compatible values
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=274121
  Link: <20200420151553.22975-1-geert+renesas@glider.be>

Patch: ARM: dts: renesas: Fix IOMMU device node names
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=274641
  Link: <1587461756-13317-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Patch: arm64: dts: renesas: Fix IOMMU device node names
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=274643
  Link: <1587461775-13369-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C0E203143
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 10:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgFVIAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 04:00:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgFVIAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 04:00:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592812839;
        bh=xtjW8rjAQyV9Ay7A7Hy6Pv0mIBh6sc+rXHtevzJdoUQ=;
        h=Subject:From:Date:To:From;
        b=b+Niuu/VAtz0AokAgoZYMy1YD22RvF7lea8BeXnNJ0un9CSglmgYDgEMXR3pySsvA
         L1whTtBz51S0WAyPjhlOojMp6bI7mNBVMnPCc22Hkm6djAtSoJtwQI68nGqwb09uMs
         DWtjxFFJ/7fkgJq9BB2AGSw06bzzpEb8yO5uN4F4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159281283972.2881.16476652804372500514.git-patchwork-summary@kernel.org>
Date:   Mon, 22 Jun 2020 08:00:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Series: drm: encoder_slave: some updates
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=257145
  Link: <20200316163907.13709-1-wsa+renesas@sang-engineering.com>
    Patches: [1/2] drm: encoder_slave: fix refcouting error for modules
             [2/2] drm: encoder_slave: use new I2C API

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

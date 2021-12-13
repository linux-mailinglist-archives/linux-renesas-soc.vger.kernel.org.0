Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D90472990
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Dec 2021 11:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbhLMKXZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Dec 2021 05:23:25 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34722 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242167AbhLMKUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 05:20:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 092EDB81015
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF8C3C34603
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639390819;
        bh=HiDgpHPkg93WDB7+9FAMsW636TED6aUy8aIcyJN4T+8=;
        h=Subject:From:Date:To:From;
        b=IhUnsqCXiwncfFSypiJl4xE0mWfVYANvzKg2k+DZW7kFLCp7qZUGSZvK+xzJzFdgN
         Pxh9ISuE/v7sY2BAqjubOWDf6HLgTtOaT7pd5nLC/1VYMa14aI2d3SHQySEe+mKKtH
         vuO54M4cQLMRUGxSwAQmIjtGHYw7VRRvkGHG6LufgSy4x4Byn8Qj6fRDBSld07awve
         9bss86tjCzqPe/kE4h2LZBZeIDCbFlJtF9wZb6+HsEZmwdkRihhHiHTnoCWj491D07
         AseYhk9cmIhVDBxi5iP8mhThw0aBKdkxjG3WsibOJ5fgWa/psYgT86sXH4IZKAvCsM
         6KwloSprwf9Dg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8C293609CD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Dec 2021 10:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163939081951.29760.7748193653364482747.git-patchwork-summary@kernel.org>
Date:   Mon, 13 Dec 2021 10:20:19 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: mmc: renesas_sdhi: initialize variable properly when tuning
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=587847
  Lore link: https://lore.kernel.org/r/20211130132309.18246-1-wsa+renesas@sang-engineering.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



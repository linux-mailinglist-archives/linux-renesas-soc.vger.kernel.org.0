Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437FC442A8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Nov 2021 10:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhKBJmt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Nov 2021 05:42:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:58572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKBJmt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 05:42:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B63760F24
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Nov 2021 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635846014;
        bh=6MgFrpBIas430ZatX8e1q34q05SLPv+uZZ1SL/a8eNA=;
        h=Subject:From:Date:To:From;
        b=DJON5P+4PKMFFrDvaoiz18WMsZn6f/kgUy02SmFTVftxoPzMupIwoSWJ9AIbQYYo6
         5DPAMvqljc6/A1CcoS0E0FYOfEU1sA3nq0aeXNlR7ehwj7scnbfXlY8fV+1AuuK9VN
         Mh4bY3Dk5p4a/8MGdLC88z+tJxONNZ5TNpm5chaXSNeuJGsaTgMRtGDE81vrI7Q2Fy
         tMIefiEjpecQZUfYz4AJAjsCq3sn5u56k60e0+Bu9XUsw9oWMqap1ASRq7D565Ju4O
         ZfiLhkF8S9tw7wn01hGKXOxeQfnDk7eJmHbzR9Tn0dFElJpqdiZuBUQKjy3jM6Eqeq
         wcDPgreJ+NU6A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4022460A90
        for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Nov 2021 09:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163584601420.23689.8868493939635892114.git-patchwork-summary@kernel.org>
Date:   Tue, 02 Nov 2021 09:40:14 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: mmc: tmio: reenable card irqs after the reset callback
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=572109
  Lore link: https://lore.kernel.org/r/20211028195149.8003-1-wsa+renesas@sang-engineering.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



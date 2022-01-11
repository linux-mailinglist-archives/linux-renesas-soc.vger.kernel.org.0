Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E750448AB92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jan 2022 11:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349309AbiAKKkP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jan 2022 05:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349206AbiAKKkN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 05:40:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32A9C06173F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 02:40:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5D8EBB81A0C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 10:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A245C36AE9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 10:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641897610;
        bh=lnC55zU98HeX+8g49EMb0+p6M/HrdGX4WGderQdoDUM=;
        h=Subject:From:Date:To:From;
        b=JKzCmOVlgiUo3DfiKcmbrvx/f2GYGZfJlu5IJs2demVb+28D3fWNd44c3CSw4Djkl
         NrUk66f22pdemAKJXGMDv+tVJrjp7a+FCZFbIGHxBZlm51hobypJ+46Lv1SlXdgFgF
         ZL5VKNa054DGMmcR4mucbogNeb7AEiO48QN89h1Sp0GAdkAh217/CvX6dmf9xzom5F
         62+DC7/rXgZvg2OsWLp4UqqegujmZs41F8M7LPAr7cOLFMZjVllZPPmGVchILXFUkr
         2qDka7gkWQ3X6SDNSKCxfuw4PvOITFTkK6guWtwvz63JXR4HmH6EnH+L5oqAPQxGfL
         IGdLjdLLGAOaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E4856F6078A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jan 2022 10:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164189760987.14245.14421054089773313872.git-patchwork-summary@kernel.org>
Date:   Tue, 11 Jan 2022 10:40:09 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: beacon-renesom-som: Remove the 'pm-ignore-notify' property
  Submitter: Fabio Estevam <festevam@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=592557
  Lore link: https://lore.kernel.org/r/20211208195624.1864654-1-festevam@gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



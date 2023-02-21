Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 821BA69DC73
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Feb 2023 10:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbjBUJAW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Feb 2023 04:00:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbjBUJAV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 04:00:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C42A1BAEE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 01:00:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A01D1B80D5D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 09:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 419F9C4339B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676970018;
        bh=leOSp2MB59fcr14NXuixmtmpc7dHnQE+eaetnbfskIU=;
        h=Subject:From:Date:To:From;
        b=H8bO1Rj1JdWqtLqQ2oh8WwhpG31UMmiRAubnyBP7qFpp6WYbSpAw85VR1lhClhNUV
         VWV+ZUu+cdY78NFR9WmOxnYcxUk4N5leUxTiIIXLIzs9M85nRgcczkZ23Nu3EpPGMX
         B/XvM6EyBngUZkcETx79hsJ50D/irdvMMADBEHTM7CnU4dyQmpbJ3PNS9rEVAzJ0U9
         3Mi1LimHd9SYMpa76PsZNsrJV/dHuADUoYYcRl8y6t3crHSUGa2zwhiFxny2v2yEbe
         pVSJz5CmI9JqbcpN9uvb6gRCB10cmjICp6qixWN8O+ne5PBJGSvzzKSDR7/b4+OPbB
         HbmFhu17qtrgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 27A61C43158
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 09:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167697001809.2324.11073975728139674760.git-patchwork-summary@kernel.org>
Date:   Tue, 21 Feb 2023 09:00:18 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r8a779g0: Add thermal nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=720411
  Lore link: https://lore.kernel.org/r/b92a1a28afb9f75f24f0137af9f77e95d7ebaec3.1675959327.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



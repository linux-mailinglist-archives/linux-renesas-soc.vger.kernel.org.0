Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E17ED631D00
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 10:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiKUJkj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 04:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbiKUJkf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 04:40:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B68B922F4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 01:40:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3719360F7B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 09:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97421C433C1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669023633;
        bh=EyC+Fht8IvhT4Bkd358N6SyjICZbFtB1IeA3reImKWo=;
        h=Subject:From:Date:To:From;
        b=BF+j5W/XsjQKvxXCwxSSlGOOfFNEmjPE4mpFzxvfy/Ms66hWwDE9FO6sfn9JD3yXl
         hRBpiuWJ5GL5reOR9mCsNd61DfcaYt8Lxdpq0fL5TAZFfvknTiHxMM+wEKbantRNBC
         P4dQ2EuSRPoO6D/gmhDp1hg19Wy61THy9ZHCk2ufaaEgS9xbp1sf83bdayNBebtw9C
         ed+Twq0M0l7sR/kUXM5QACsJjRBI6MCVuv8NMFSon6cnTF5SS3apsNnvymi47MrvOL
         LXxOYsaCy9qLuYecFGnHWrWL/7hYF7yAUhIBbmWAz8dYCH2MhGsFZ68YcQwaWyFM6T
         nI9Th4KdmiXzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F230E29F3E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2022 09:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166902363346.31512.3934212316074600880.git-patchwork-summary@kernel.org>
Date:   Mon, 21 Nov 2022 09:40:33 +0000
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

Series: Rename DTB overlay source files
  Submitter: Andrew Davis <afd@ti.com>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688359
  Lore link: https://lore.kernel.org/r/20221024173434.32518-1-afd@ti.com
    Patches: [v2,1/7] kbuild: Allow DTB overlays to built from .dtso named source files
             [v2,2/7] kbuild: Allow DTB overlays to built into .dtso.S files
             [v2,3/7] of: overlay: rename overlay source files from .dts to .dtso
             [v2,7/7] staging: pi433: overlay: Rename overlay source file from .dts to .dtso

Patch: kbuild: Cleanup DT Overlay intermediate files as appropriate
  Submitter: Andrew Davis <afd@ti.com>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=695241
  Lore link: https://lore.kernel.org/r/20221114205939.27994-1-afd@ti.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 378D17E9FE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Nov 2023 16:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjKMP0I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Nov 2023 10:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjKMP0H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2023 10:26:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347C4A4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 07:26:04 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2622C433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699889163;
        bh=AsLiQnCXCT3r+HGcvJIbQ481yNzWaalPVJy6+l6b9Ic=;
        h=Subject:From:Date:To:From;
        b=bTATjImIVt1P/1ARCSbjuPX/Wi59Ucp8mru528a+VFq4iq5GIxq8bR4biWRyeBkKt
         2az+7nHOtmQy3BSfPa5MIT1X3pabY/96uOknh4v3NYTPGLsiNJjJGEfAKM927BIvDj
         xpiohPvvg5OcwGFNj+yBlRj8+wTdFCU398r9gAKRJWKxRs+3Kck4Dqn2mbnSe7GVol
         /lBp9UbglzlYdHQ9ywDBZ/zNdc4La+I6eF940K/XCQUVKPnynNf0Bqf6L6v4H7o3vg
         /mzgfgUOZZGZvUBA4Z/4VlE5/paLeEQgpOgoneQ+L5f4Ou5EvwyYubV9+fYggoxF+4
         ISXI5Y+emwJbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 964F7C4166E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Nov 2023 15:26:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169988916356.10049.852557859744573218.git-patchwork-summary@kernel.org>
Date:   Mon, 13 Nov 2023 15:26:03 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Patch: [GIT,PULL,v2] drm: renesas: shmobile: Atomic conversion + DT support (was: Re: [PATCH v4 00/41] drm: renesas: shmobile: Atomic conversion + DT support)
  Submitter: Geert Uytterhoeven <geert@linux-m68k.org>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=793475
  Lore link: https://lore.kernel.org/r/CAMuHMdUF61V5qNyKbrTGxZfEJvCVuLO7q2R5MqZYkzRC_cNr0w@mail.gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



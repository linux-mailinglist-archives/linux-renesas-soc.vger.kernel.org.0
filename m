Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD684592BA2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Aug 2022 12:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbiHOJgW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Aug 2022 05:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbiHOJgV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Aug 2022 05:36:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001EB1EEC3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 02:36:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BF8060FF6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 09:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC9FDC433C1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660556179;
        bh=58O4fO2stqrF8rGhOQFMMZcN6jkL/9DVxn9irxT/UuU=;
        h=Subject:From:Date:To:From;
        b=OAiPjL95PjvO2n3wB+4eVQ7/shej/jaehNlvJcMyq6TPdiQK1w1Fp70ffQZgfMJmR
         XFXmSLUP/uAT2xrs+VifgYU8RlYUGhIgK0sRZBStLKW00AZg35GpMWzojbJlU8sSVH
         +6EtD5iQeXMOmwmQpVTATfHOnN0ICLf/UwSjrSdTVbOpeomG2W/j+BJC4unegJYttR
         u1j+l3N/uIC6WLdWMB6g5gDp8kqRwIHOCOOZpHZfpBqEEfPyE2x8hKEKkMgR95QGqo
         IOUIeI+cGDYDxpT4xlzIJ6sBZRbY11eyEK066YTLtiZh+wTeXqojBUAWm/FX4ERP3b
         nK+bK211fshMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BF021C43142
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Aug 2022 09:36:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166055617972.18008.3607353022377593640.git-patchwork-summary@kernel.org>
Date:   Mon, 15 Aug 2022 09:36:19 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
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

Patch: [GIT,PULL,FOR,v5.20] Miscellaneous R-Car DU fixes and enhancements
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=660257
  Lore link: https://lore.kernel.org/r/YtIEWkE0nk/8nhUc@pendragon.ideasonboard.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



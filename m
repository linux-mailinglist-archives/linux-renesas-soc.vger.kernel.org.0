Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFD8497D3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jan 2022 11:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbiAXKeY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jan 2022 05:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiAXKeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 05:34:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64592C06173B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 02:34:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0CD21612AC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 10:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78E6BC340E1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 10:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643020463;
        bh=sQ2289ZQNt+ueLySXyVd20bTnbiqq4DHLJPT6EFUlow=;
        h=Subject:From:Date:To:From;
        b=eIyqgdkwJ8llmlTxXwl3+wt9ilPBh6t52c9SdDG0iiT9vn5b0h35+DnqamMrlGXRe
         3oeZAIbuekPuR+/p0HqirwlsEWLBGw0gaddeJVepUvBXnbMb248qymL4FVFlb254fb
         KTkxxBzKzE+aWCjwepkYN/S9bnu6HSU+uueTqIgV4zZ26+eNolXpMXws1eqluGn5JO
         SdmDikO+n7CXw9irjhXNrf6FrxufeRsFuxw4toljFOhlMCLq9nQBtbW3SlOJTKXUyJ
         cqYoIRC3wW3nq73pOcNT88QXpAXEhnZ5Gn8u7w/Z1cDLZksUAhUhi1Gsz+2kv6KpNG
         FCstw9xOsAg/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59EF5F60790
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jan 2022 10:34:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164302046328.4708.15492989460228467247.git-patchwork-summary@kernel.org>
Date:   Mon, 24 Jan 2022 10:34:23 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: dt-bindings: media: renesas,jpu: Convert to json-schema
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=485007
  Lore link: https://lore.kernel.org/r/ded1a61cbaa39fa7a15efdaa2fdfa4fdb307b930.1621429165.git.geert+renesas@glider.be

Patch: media: rcar_fdp1: Fix the correct variable assignments
  Submitter: tangbin <tangbin@cmss.chinamobile.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=567447
  Lore link: https://lore.kernel.org/r/20211021030938.51884-1-tangbin@cmss.chinamobile.com

Patch: [RESEND] drm/rcar: stop using 'imply' for dependencies
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=553531
  Lore link: https://lore.kernel.org/r/20210927142629.2016647-1-arnd@kernel.org

Series: [v9,1/3] media: rcar-csi2: Correct the selection of hsfreqrange
  Submitter: Suresh Udipi <sudipi@jp.adit-jv.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=311107
  Lore link: https://lore.kernel.org/r/1593597181-8296-1-git-send-email-sudipi@jp.adit-jv.com
    Patches: [v9,1/3] media: rcar-csi2: Correct the selection of hsfreqrange
             [v9,2/3] media: rcar-csi2: Add warning for PHY speed less than minimum
             [v9,3/3] media: rcar-csi2: Optimize the selection PHTW register

Patch: [v2] thermal/drivers: Add error check for reset_control_deassert()
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Daniel Lezcano <daniel.lezcano@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=592417
  Lore link: https://lore.kernel.org/r/20211208164010.4130-1-biju.das.jz@bp.renesas.com

Patch: drm: rcar-du: Add DSI support to rcar_du_output_name
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=587283
  Lore link: https://lore.kernel.org/r/20211129170845.2269532-1-kieran.bingham+renesas@ideasonboard.com

Patch: [v2] media: i2c: max9286: Depend on VIDEO_V4L2
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=574063
  Lore link: https://lore.kernel.org/r/20211102110243.1510895-1-kieran.bingham+renesas@ideasonboard.com

Series: drm/cma-helper: Clean up public interface
  Submitter: Thomas Zimmermann <tzimmermann@suse.de>
  Committer: Thomas Zimmermann <tzimmermann@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=580099
  Lore link: https://lore.kernel.org/r/20211115120148.21766-1-tzimmermann@suse.de
    Patches: [1/3] drm/cma-helper: Move driver and file ops to the end of header
             [2/3] drm/cma-helper: Export dedicated wrappers for GEM object functions
             [3/3] drm/cma-helper: Pass GEM CMA object in public interfaces

Patch: drm: rcar-du: crtc: Support external DSI dot clock
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=586271
  Lore link: https://lore.kernel.org/r/20211126093514.927340-1-kieran.bingham+renesas@ideasonboard.com

Patch: drm: rcar-du: Fix CRTC timings when CMM is used
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=587397
  Lore link: https://lore.kernel.org/r/20211129222813.28079-1-laurent.pinchart+renesas@ideasonboard.com

Patch: serdev: BREAK/FRAME/PARITY/OVERRUN notification prototype V2
  Submitter: Magnus Damm <damm@opensource.se>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=594333
  Lore link: https://lore.kernel.org/r/163931528842.27756.3665040315954968747.sendpatchset@octo


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



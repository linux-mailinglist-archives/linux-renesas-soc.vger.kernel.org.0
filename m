Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159884502B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 11:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237632AbhKOKqr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 05:46:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:59134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237657AbhKOKqK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 05:46:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BC91630EF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Nov 2021 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636972995;
        bh=qTLVGQue6WNWcDdD5U71D0eKfMvdVXM9qlOGNjPbtV4=;
        h=Subject:From:Date:To:From;
        b=rvCCqgHGAg51GQn0Y4KUnX9ug86nfx0NY4fjkUXkjsrNTOo2LzsxlBRbaAfipkBDK
         BktGCoXpOPO0dV6RkWysV6c+rhMNNK6XPH+J6SCDFwAQq/kn52dRWFIlicOHv3bHmE
         ExkzRlWaLF9hCGkRrmpvTtdgyq5RyI/oirUjngLmz9o0enC6spKyx/9KM37s4zDlJ2
         r6EpinlYWxK/1AcALffrbVb/fa4RaE5DjgbXCK7ELib6K460oPgADtn113ECCav7ML
         xEp/PuzNF+45IjqDwcxaWLVRtrg1H9JRNP76gijFvxxQIVj/Xaqegbywfpuzv0gLY5
         paMVuCln0t1Iw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F13A860A3B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Nov 2021 10:43:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163697299493.5104.1784869309794563691.git-patchwork-summary@kernel.org>
Date:   Mon, 15 Nov 2021 10:43:14 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Patch: [GIT,PULL,FOR,v5.16] R-Car DU & other misc enhancements
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=558859
  Lore link: https://lore.kernel.org/r/YV5jfi+/qjTJKeb3@pendragon.ideasonboard.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



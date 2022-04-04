Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 796F24F1307
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 12:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357426AbiDDKV6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 06:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345676AbiDDKVy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 06:21:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0824B24BF2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 03:19:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A8209B80A29
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74A0FC2BBE4
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649067596;
        bh=pbd3ZlhfkAAAoFPkPCOKN5e7o+S+J+KienShKEj1PsA=;
        h=Subject:From:Date:To:From;
        b=UiFAy/A/zaon3XgHH+xO/Nd061GmQZoioKtSeBYAjQNiLqW+0zHF9rD+5YgzVnIG6
         3pZ1M9ZlJ8tVz+U4lQvFSPmhCTTnLJ0Tb3H9oa9tuAvGj0DSbqBNR8TC3Xg7qnmDQk
         Ly1o1j2DJvkZ/r6v+Go8MFPKHmjUFSWoWO7sc7e38Ch/SJwMy0f5JgBoyYgY/8lcYF
         roI4xjSLv66VylK4eOUqs7K53zZ5t65ZUmJOxKL4HCdc7t5/UatOrb8F8k++wrPrJA
         hjxxAqj6FjgsYiUVYVDQSiURwv/+GEDIZbh8bA1lQOVjFARue22ngnUllbikcy+6qw
         IyZfhBb57skxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 590C3E85B8C
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:19:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164906759623.4049.14716787140446250981.git-patchwork-summary@kernel.org>
Date:   Mon, 04 Apr 2022 10:19:56 +0000
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

Patch: [GIT,PULL,FOR,v5.18] R-Car DU misc improvements
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Dave Airlie <airlied@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619941
  Lore link: https://lore.kernel.org/r/YiCwy3FR3gPng4dN@pendragon.ideasonboard.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



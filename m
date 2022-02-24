Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542854C2D69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Feb 2022 14:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234830AbiBXNks (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Feb 2022 08:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235206AbiBXNkr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Feb 2022 08:40:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A384FC4C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Feb 2022 05:40:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7CB6CB825CF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Feb 2022 13:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3392EC340E9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Feb 2022 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645710011;
        bh=QiosSst+yAwBGwPoxfuEdeDGa/7OkfLvJen0+DwIJjM=;
        h=Subject:From:Date:To:From;
        b=YfuITP4q1r57wmIHhVmNHssW+ICyhbmIHDYZGXvheL7C7ZJY7hf3bIZX+Vvwtcdxy
         zU60Zx8KqA4sonv0Evdc362t49UrK7DyuWb/3MPQzeO99yFzqJf0jUpyFxR55I4ISr
         VXxIPKox6wYAZrw3yn0Y43qcLAy6wDZ5dsKNmQqWLn5fWrimP8kJkYMAUjZ1OLzudO
         JrD5xrWn2aiMMBG3bCyS8z2zt0a/TxiCcXzNJ+a7QNuKNLGjlk3z6Fbc7M0hLyTxsG
         OZf2J3haj1BLmldz7j4IaJAu/kozSeVEG3Mx5DCxcPVF8mNAvlRJA6ic3N/hvsyWro
         nquCywarGo54w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1652FE5D09D
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Feb 2022 13:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164571001097.10548.16551148370196122823.git-patchwork-summary@kernel.org>
Date:   Thu, 24 Feb 2022 13:40:10 +0000
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

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [LOCAL] arm64: renesas: defconfig: Add DRM_TI_SN65DSI86
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=615800
  Lore link: https://lore.kernel.org/r/20220218150558.1748594-1-kieran.bingham+renesas@ideasonboard.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



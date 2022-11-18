Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEC3B62FA49
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 17:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235270AbiKRQaW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 11:30:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241733AbiKRQaV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 11:30:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FA49370C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 08:30:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 511E2B8246F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 16:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 059A5C433D6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 16:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668789018;
        bh=V+TcakjZwrJ9g/I1nhIT0WeUk8mVLq6qMBfQwbR64DI=;
        h=Subject:From:Date:To:From;
        b=MBZwbf0+r4GyKW70LqTW5gjqWOUMCL65a6ng4tPJjOV3Q8DxyMsy/RUYesXmt9UjP
         pdVk0sL6cuQoEWHYJjUbTmwTX9m7qJi950Hq3FEBcadJNGU/NaS8iVeqHtstofZ2oj
         yhsSpI9KXazuShaVzRM9aaJltugnka8h9f3tmGCNusLzqnyMEx5dR49pwXx1ZG1JEn
         1iB/sLGJGTBG/M2whxsR6l9E0fWfKmG+WwGaYlDN39zXJzKckFcwmjjo95tymXLXny
         SKbEU5ic+HYkboU++5rqRhJMExsewCfWQhk8Qe4aMqiabU8dUEbut0PZhU+8IEKybk
         +nNa7A5jqiabg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7F70E270F6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 16:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166878901778.7631.5464576435276855124.git-patchwork-summary@kernel.org>
Date:   Fri, 18 Nov 2022 16:30:17 +0000
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

Series: arm64: dts: renesas: r8a779f0: Add/Enable Ethernet Switch and SERDES nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=696905
  Lore link: https://lore.kernel.org/r/20221118120953.1186392-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v6,1/3] arm64: dts: renesas: r8a779f0: Add Ethernet Switch and SERDES nodes
             [v6,2/3] arm64: dts: renesas: r8a779f0: spider: Enable Ethernet Switch and SERDES
             [v6,3/3] arm64: configs: Enable Renesas R-Car S4-8 Spider Ethernet devices


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



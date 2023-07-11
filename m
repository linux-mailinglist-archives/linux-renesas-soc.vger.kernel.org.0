Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E733674E8D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jul 2023 10:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjGKIUX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jul 2023 04:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGKIUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2023 04:20:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD430E6B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2023 01:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6EB4A6136C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2023 08:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C647AC433C8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2023 08:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689063620;
        bh=oklfvJqefZLtYziqU7cp4Lf62jyutQm6ZwjjSdbw7nE=;
        h=Subject:From:Date:To:From;
        b=gf40tv+qOQXP8JXlcaiv5+aEcn0d75RRNtDTwa+QtkhiQrDWBAANiHOpbWTreS4iD
         q4uMpCnP6/w+IVv2V9gFBdSfUvErKCtPd/x5ahuvImIMVDZV2VkDF0oi7LG1KD7e2d
         1xhQmG0tz0zUHvtyHg7iGSKHBUv3Thvxs4xPOMTldR+c2phg6kSJZ8pYfvEVweERqn
         Mqro44AAakU8RgDdHmUa5WdxPw5UInR7EYX8Nj18Jsx0WbO9C+seOzdhuWCpQeuFcA
         YtCUpHKilSKHiR/wNyebHCyB0JBetc2HVUPmW16RioCBTEvgJ0E/NpzW43ETWFp1Ep
         AzVy3Anv5NPfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A14CEE5381F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2023 08:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168906362060.30522.8948574039047441379.git-patchwork-summary@kernel.org>
Date:   Tue, 11 Jul 2023 08:20:20 +0000
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

Patch: arm64: dts: renesas: rzg2lc-smarc: Add support for enabling MTU3
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=763504
  Lore link: https://lore.kernel.org/r/20230707155849.86649-1-biju.das.jz@bp.renesas.com

Patch: [v2] arm64: dts: renesas: rzg2l-smarc: Add support for enabling MTU3
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=763174
  Lore link: https://lore.kernel.org/r/20230706153047.368993-1-biju.das.jz@bp.renesas.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



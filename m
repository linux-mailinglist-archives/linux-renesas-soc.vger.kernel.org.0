Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD2C656205
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Dec 2022 11:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiLZKyt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Dec 2022 05:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232030AbiLZKyU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 05:54:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898D826EF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 02:54:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48AE7B80D11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 10:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2089C433EF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672052040;
        bh=+SnQwNi+lMvSOt5nVH7J1SiXJdv0VphJ3jKDVZZbZow=;
        h=Subject:From:Date:To:From;
        b=E92cpeSCXqkbm4cPd3fYpfwRgOSsy/hSoS+tMbXgqrInEZV09dBZqOW5FKbaFsJxP
         tE9r6nonhm/uvwKeDKxGIHzpW9cOcvWWhhO+oWNUbrDziJS32Xp/gNLnW7XmqBPKX7
         a/NcvldB2+hEB3HtgF7DQpwylB/+wRuowsMWLlI42jIddRdtK/dLBsKa5wCHdwg8Dj
         lP0KfOgJSmg08WLc4VwQaJAQ9VcQCpyP/aROHZQR/iqA6LgGnG8BQade/1cIycxX55
         2qw5cKlCtvsolN4Pl/hUhYNFedb8y+JtYuFSr1IDT/Ug7z9ekIsUrmWlJA30fgttS7
         x7pgBh4WOUQzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7752C43159
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Dec 2022 10:54:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167205204062.7269.14037827738945007810.git-patchwork-summary@kernel.org>
Date:   Mon, 26 Dec 2022 10:54:00 +0000
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

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Patch: [GIT,PULL] Renesas ARM DT updates for v6.2 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=698820
  Lore link: https://lore.kernel.org/r/cover.1669283381.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



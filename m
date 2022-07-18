Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF028577DF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jul 2022 10:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbiGRIui (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jul 2022 04:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiGRIuh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jul 2022 04:50:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE1D5F87
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2022 01:50:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5B057B81085
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2022 08:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FBABC341E6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2022 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658134233;
        bh=G5tsPc3FyfNYxlXWjllNplfZInVIo5ZvTN7gwpl1Nt4=;
        h=Subject:From:Date:To:From;
        b=HvF2fQGWMb6QVizCY+ZNzbg2BoGz6mztk5IvLLrHQ9kszgC+0wnn7wuU4QM16PBzF
         finbqaLO455KpNCAuwuPSvS2nYwUgaZIM1zqUEbcYflvF1OK8/TFvjqKWFtsobEklc
         5Eq8oKSvsGOUfZCx5A+b8Tj3VmonXyDQTyGFqFlzuTlUGaUXX/ol8n98GeFkfUwM2S
         PxQG+OT4tTTEykjiHj0BwOIP+GUBxM87gVDZxS++Chx6l7HUOJINsdk8AN+4Ba6aNZ
         QIPRaOGzXFI6TQcZXVxNNq9EQkuP6uumsYWnkDAZAZeyBUJThkjRTb8Ec8IkvlTL35
         AhsG1Br85xRAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2A8FAE45086
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jul 2022 08:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165813423309.12397.13437979313150014246.git-patchwork-summary@kernel.org>
Date:   Mon, 18 Jul 2022 08:50:33 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: serial: 8250: dw: Fix the macro RZN1_UART_xDMACR_8_WORD_BURST
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=655321
  Lore link: https://lore.kernel.org/r/20220630083909.4294-1-biju.das.jz@bp.renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



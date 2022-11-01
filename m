Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52DD614759
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Nov 2022 11:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiKAKAy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Nov 2022 06:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiKAKAw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2022 06:00:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A87AC1C
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 03:00:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8963B81C57
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 10:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 985F5C433D6
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667296849;
        bh=f1dne3FS1HyXN3GM03k2R9nt99nvK0PxO5s6VtnzzkQ=;
        h=Subject:From:Date:To:From;
        b=OxAmbO/SDG4qhu0ioG9s+sbOMhI0LobTnfSrqVO7tL6jmpxlFpAPPSF6BFNYQt2Zf
         DEBAk4wsu7XJP5WV1ZMd0E8neYFxW73na2hWVYqawxDtWe+W+nL4ZtHOsLPhstJe0g
         h/Q3j9fYO9huNuOdrFBcZYLseGgNeVIWIs5bhX4bHxsTThsmLiZaVaJc0PTqNTbUkv
         0VFnq+NkiQdRxlSNjSQtSC6dO14qJflIgQ51fdPigYautX0OtHd2K3kMZgh9gtnqP1
         g4bZUxJWl7ArlMDav+0DYjvNyu10vf4Psr9maJ+0QA6OAUsbJtUL8J35UCJQ02pDyx
         /wVpeliDOAyTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 77AE8E270D3
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Nov 2022 10:00:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166729684941.22390.7627523146991171045.git-patchwork-summary@kernel.org>
Date:   Tue, 01 Nov 2022 10:00:49 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: R-Car CANFD fixes
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688725
  Lore link: https://lore.kernel.org/r/20221025155657.1426948-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/3] can: rcar_canfd: Fix IRQ storm on global fifo receive
             [v2,2/3] can: rcar_canfd: Fix channel specific IRQ handling for RZ/G2L


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



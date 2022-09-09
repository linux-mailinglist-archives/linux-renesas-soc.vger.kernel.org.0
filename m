Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B535B3592
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 12:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiIIKu3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 06:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiIIKuT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 06:50:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB15910B5
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 03:50:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3A8EB824DE
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 10:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53F0BC433D6
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662720615;
        bh=QVthE3kWi1XZCUzmygh1lFZzEMY0yKlCuaSNKty7Dg4=;
        h=Subject:From:Date:To:From;
        b=Ynuk02/WGeMYNUdMYRNoVnVktpM7i5Pk0n1BzyxAPrWn4TYjCh/72envD1fkO5kUH
         xB4pXG+fazjhvFbhNq1KTR+eunjhOBTpLYL7/zTsWg26DQgFEg1fPw5zdpDr20SQ8t
         ocK+v/Gz1/HdDiZGcZR7c7EJFGd66L6GcO8XSRJLenv+y3OPjowFYsPcIaeArJv+6r
         VaOTs3S4B3RwwnFEDbJZGIqihvqlLKK1Ky7mjpNn/xRAOCRuwVsosr033u2jBNt7dk
         a4apQJKKPxQsJOLjtfaHxO3EiDprYl3sXV7i1ojjHiyQH4EWwhX+8l3zgt3Gii187a
         ExLFYEcQyLFtg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 39C9AC4166F
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 10:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166272061518.26556.3239025260590097868.git-patchwork-summary@kernel.org>
Date:   Fri, 09 Sep 2022 10:50:15 +0000
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

Patch: [v5] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN1
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=673476
  Lore link: https://lore.kernel.org/r/20220902062752.56841-1-biju.das.jz@bp.renesas.com

Patch: [PATCH/RFC] MAINTAINERS: Merge ARM/Renesas ARM64 and ARM/SH-Mobile ARM architectures
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=669137
  Lore link: https://lore.kernel.org/r/a869b8afdc47aa637ebeefcc1ca7bc61244f34b9.1660898008.git.geert+renesas@glider.be

Series: Add RZ/N1 CAN support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=672511
  Lore link: https://lore.kernel.org/r/20220830164518.1381632-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/3] dt-bindings: can: nxp,sja1000: Document RZ/N1 power-domains support
             [v3,2/3] ARM: dts: r9a06g032: Add CAN{0,1} nodes


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2C07B4D01
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 10:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjJBIAq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 04:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbjJBIAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 04:00:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E3CD8
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 01:00:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A698C433C8
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696233642;
        bh=qNXTgZqF4QBWwI+Szy2fL/NtkR7KoyJT8hE6gkVq9+s=;
        h=Subject:From:Date:To:From;
        b=VEtjJFug6ziO09nCOCAenp2BgB/B/6YEOGuzYMNVgdga9suOyl0uMqMnB5dVnzc8M
         yWNIa8pywiZgeksRbKqcqAJ+mkQ+DfnnWTI3+oxCUGCAu81iG0VRIb2dgaH07RFI2W
         Fw/PNJU+INUCdvqxsoxnaNRppgfCbAYTClt4iuwzKJJ8VGmtM94o3LEtq/M+anRKgM
         HdwJK40xIqhdmeEllMrMhk0cXrvZEtYXgKsIMaBh8ivlWSafeRaRIrR9lWiEeq4eh1
         5p8y8AbM5ygWoOnb2M5tATGgxeCiZTz+b7pvBihcB+vLRCXTz6L/otb89CerynkCVx
         7ALTHg8DfXokg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC0C3E632CD
        for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Oct 2023 08:00:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169623364183.16591.14338015551672706174.git-patchwork-summary@kernel.org>
Date:   Mon, 02 Oct 2023 08:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Fix Versa3 clock mapping
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Stephen Boyd <sboyd@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=778944
  Lore link: https://lore.kernel.org/r/20230824104812.147775-1-biju.das.jz@bp.renesas.com
    Patches: [v5,1/4] dt-bindings: clock: versaclock3: Add description for #clock-cells property
             [v5,2/4] clk: vc3: Fix 64 by 64 division
             [v5,3/4] clk: vc3: Fix output clock mapping
             [v5,4/4] clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D99758FA99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Aug 2022 12:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbiHKKU0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Aug 2022 06:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbiHKKUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Aug 2022 06:20:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1016C65E3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 03:20:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0F7D6135E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 10:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D521C433D6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660213223;
        bh=I3Qg/IF3Rb+zF/vO58h/9LIORGMI/s3kOYQnWC8Nh50=;
        h=Subject:From:Date:To:From;
        b=jtzBRmjBN8zIngR6Id+aWBCpnfxtBaBrcNOB0BCZMYciPz/9mq9RGvGswPESjicA/
         +BifN6so5MMt5LxkJQ+NoFMz5nqP6gTHktN3cTjmFuJfDO5oSn8jcoI/uKivG15/5N
         HYTbPUO6XWLMXbP3GT+PMiXebNHoniTEZI7HLK4kI77vt0DW/XaTSl6J/2XllgeGge
         ae5lrfcuyMobG+2k0PWlRgxJtxK8L7kTEFyg5oeKOZInbBNqQV+SsXzY3z+Nz8ThL7
         bAg1zXGAszZaZK0h13fyaBNYJAh6XF9b0lpUNC6HHyjCZzXbbjUHhw5z/90xz+d5vT
         ZUBcXtQM5+cQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E01E0C43141
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2022 10:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166021322283.10661.5249342969826470378.git-patchwork-summary@kernel.org>
Date:   Thu, 11 Aug 2022 10:20:22 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: [v3] spi: spi-rspi: Fix PIO fallback on RZ platforms
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=661874
  Lore link: https://lore.kernel.org/r/20220721143449.879257-1-biju.das.jz@bp.renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



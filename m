Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68B38662397
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jan 2023 12:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233808AbjAILAb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Jan 2023 06:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234368AbjAILAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 06:00:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E0211A1D
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 03:00:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B89C60FFD
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 11:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1E31C433D2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673262028;
        bh=AKWUnoWEIa2IGSdzTbGLG++4ChdzwKDdGLcsnMmx0ks=;
        h=Subject:From:Date:To:From;
        b=Gq1B4yR3NUt2sR+RU4wMhk13Z6mGK/Y6lqk41gRp8+l9GMWPwD9w46z2jpDyq0sPu
         22uCfaxyT56bGAXsWtHymyEjuTo++T/FuV3AxK6j0wWsHncCxb9nhD99uECHCG0qbY
         Hvz8vPD8uCUc7kaPupXelkVPjy4RYgtEy+ekejIskfpnLSZVX67GU87vOIcO7jXt7L
         R182fFXpHFGF9H9UHqIs1Jk9Fq5nl9GihzUkUPvgWbAlxiQSM9J4k0FT9eA50WlvAq
         BRznagPaVv2epEmaJalaxpU/LN5lLnRcsYFKdgIobBv8WmAZAk1Ng+NfIHiYnK60C7
         rT6BRUcz8pMhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86913E21EE6
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 11:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167326202848.11222.8568195989975042167.git-patchwork-summary@kernel.org>
Date:   Mon, 09 Jan 2023 11:00:28 +0000
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

Series: net: ethernet: renesas: rswitch: Fix minor issues
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=706975
  Lore link: https://lore.kernel.org/r/20221226071328.3895854-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [net,1/2] net: ethernet: renesas: rswitch: Fix error path in renesas_eth_sw_probe()
             [net,2/2] net: ethernet: renesas: rswitch: Fix getting mac address from device tree


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



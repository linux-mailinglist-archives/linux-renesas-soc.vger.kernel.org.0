Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75AF456D710
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Jul 2022 09:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbiGKHuh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Jul 2022 03:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiGKHug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jul 2022 03:50:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16651CB11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 00:50:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7169DB80DDF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 07:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0086CC341D3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657525827;
        bh=EjWvIMIQseMh/p4OufxETrHeLV5laPX102oEnRB7aXA=;
        h=Subject:From:Date:To:From;
        b=ZDGIIBhxjkuucwcU9KvXe1wJBBpas9VvYpf7dPgyX7QpdkeVXYPDsQVfcqPDAygI3
         usmyWmXIqx+1rdJsc92kSl3VvxuLh/TAVUBbh8Aek54SHW5KDoY6CbkCRV8EAnhKlm
         l/IN0Or5S5pIXh6Nxvq4r3GaxPvSNiyeJ3tb/KIOE3pYHUoHI0cPmyaScZN4LVrxAB
         88bOORWTFTsnCrwLdSpFY/kqvKOLqaVSc/2Uq/2nh2SmRlW40zzhddtjdOXh3DxJwD
         CVRDzzf/qu66+MaiQSrnnI/Ze0KmeON2jvaz4WOrPjdZSVeyvBCDzO4puo1q0IEyAQ
         2O/1h5VaiBtBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D98CBE45222
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jul 2022 07:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165752582682.2237.18132518052790432253.git-patchwork-summary@kernel.org>
Date:   Mon, 11 Jul 2022 07:50:26 +0000
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

Patch: can: rcar_canfd: Fix data transmission failed on R-Car V3U
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=656218
  Lore link: https://lore.kernel.org/r/20220704074611.957191-1-yoshihiro.shimoda.uh@renesas.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



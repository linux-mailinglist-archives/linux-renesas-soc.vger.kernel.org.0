Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26056B7290
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Mar 2023 10:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjCMJag (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Mar 2023 05:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCMJaf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 05:30:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDD71EFE6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2023 02:30:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E7ED961197
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2023 09:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BCADC433EF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2023 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678699833;
        bh=mYogJMi9b02mTr0qjA+E9Unx0aY5ene+BvQQgItdW60=;
        h=Subject:From:Date:To:From;
        b=sqIUEJDCP8jZ0TiPi2fNW/iCTdPSdyyExhHNJNs8lLCyHkp78DrKZ7FA2WIECHvWl
         W+lb7UEv/HX86x9NzlsWnxLXhPmaZjQbk2bRliKuP/VTgluMAM5yJAwqI4R8DAWvOe
         3TyNj/oZD94h6JT9Pk940b3lEd4IQ1nzsPYVBkxP4Mw5ShFDe/Y9OjaQ9PQpDUhtgA
         8hCAA1Z/0gfyyAyLtqR/V+BleWMAZqaHiS2MPzXcS9CZhMqPEXvY0j1BWSQv+opyFq
         R87hsUDILHlW6GiMVCIAHMHKDQDdsZvanbQXw7PjZRCr7cTKt+1e5tBycViD59VPN8
         wvEcGA++azIig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30A92E66CBA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2023 09:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167869983315.8099.8310216325500764174.git-patchwork-summary@kernel.org>
Date:   Mon, 13 Mar 2023 09:30:33 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: i2c: dev: Fix bus callback return values
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=728131
  Lore link: https://lore.kernel.org/r/03a8cd13af352c4d990bc70b72df4915b9fa2874.1678347776.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



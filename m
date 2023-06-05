Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93F487226B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jun 2023 15:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbjFENAq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Jun 2023 09:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbjFENAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Jun 2023 09:00:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980DDC7
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 06:00:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D47160D39
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 13:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C014C433D2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685970043;
        bh=2e9J4wR9kjQCBe0nkeRLa+2guI0wM73Oo4yUrEtB43o=;
        h=Subject:From:Date:To:From;
        b=NvdRcFKKjOzI63Zn3DwpPvHYrhxXy7Au3wuriJ09Gh/7sTgeOsY3IxXf516Ti68/M
         62jJ7NSCwJg/yg2pbwAlWpSw0e4poUDbgc7tVICLIJ7yay5L3fVBRmNOwarXOtFunX
         01/qYJV4wl8L3I1SssKrIpEHpPKKLN7DxSL/FJjxdSxW9PfDIeqcZaIG6G3j0WUslB
         iblhy6jC/hv4K/COfDjinnQ0J9mCj4Eabk5J7R//QGzdLa5XZxNNbNxuzO1mNSvSH8
         AmXg9EhngRU1PalfLCqE8gZ0KQGM0h1hnwBEvGdFw+cwqXWTa+MH4pK7QsM4ymiNMp
         ikSySOmKD7Hrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81142E87231
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jun 2023 13:00:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168597004344.7979.8606512264211832648.git-patchwork-summary@kernel.org>
Date:   Mon, 05 Jun 2023 13:00:43 +0000
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

Patch: [net] net: renesas: rswitch: Fix return value in error path of xmit
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=751767
  Lore link: https://lore.kernel.org/r/20230529073817.1145208-1-yoshihiro.shimoda.uh@renesas.com

Patch: dt-bindings: iio: adc: renesas,rcar-gyroadc: Fix adi,ad7476 compatible value
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=746111
  Lore link: https://lore.kernel.org/r/6b328a3f52657c20759f3a5bb2fe033d47644ba8.1683635404.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



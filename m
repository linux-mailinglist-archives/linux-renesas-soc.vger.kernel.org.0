Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3386D6C9C6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 09:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232740AbjC0Hk7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 03:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbjC0Hkr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 03:40:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44DB26A8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 00:40:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1A14AB80DAE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 07:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA88CC4339B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 07:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679902836;
        bh=vXTgwg7tumK4IUoSAF0v+vgSNyT1oiMirmgsVpxuIC4=;
        h=Subject:From:Date:To:From;
        b=F8zWALzCKwgIR2sJ3g3JF55WljM+Pm3wdi77UKneu36DTVPv2luCu0sAnEju0SJ9S
         zB/Im4yk5Xd0dcj8yR8FWbvGBKkhy94P8zQuLaPYwKkOpYWtFS8yx2dx2AcRNrM0sy
         0SEldyRNdww6w6nj6nkylaFDC1ILdTIXWnq2nGi4wAfIyxO1N+KuY/d7xoLxebjwAw
         xJHoRUCGolqpM6WYv32eksuKanDr7yP0JmU4CZIM0lZd9JLwipEQJ8HPxuRBw4KNdi
         AO8R8e9vgQO6+iuNUF54KrS7SL+YymbRbdNSa3yGjzEZEKdhXCENQaK4Ho/YnTP6Xw
         pfu6J20yh7I/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A4188C41612
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 07:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167990283657.16393.11656064894736023031.git-patchwork-summary@kernel.org>
Date:   Mon, 27 Mar 2023 07:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: lib: dhry: Fix unstable smp_processor_id(_) usage
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=730371
  Lore link: https://lore.kernel.org/r/b0d29932bb24ad82cea7f821e295c898e9657be0.1678890070.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C813F530DE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 May 2022 12:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbiEWJKa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 May 2022 05:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbiEWJK1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 May 2022 05:10:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F1E46675
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 02:10:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D48B60F84
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 09:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BC2CC385A9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653297021;
        bh=ERsLuj0kQtduspuSpHpf247BXXgGca4NPa0cXOxpSaM=;
        h=Subject:From:Date:To:From;
        b=m8kKI90xatrlaXdFkEZMoTncmHnUPdcVQCt5Jvd4vk2YynfDfVQIpBnOlj+0n0QVl
         f8faubXFEdLrOVGkjAizaQ4WnovX6G1DWrf6eTyoObD7QT70To89QbdeZQEBjrKfuK
         k0PTlKeKyl2EXdFeTtTflg/OitqhtFxAZZNNCSowGsipYLh7WVnJEXHDEUM8VYlOx8
         NJgde1pGjWisYaPmclgGC86haEj1Elo/duanwjb6Ic8TY1U+QW/QsutqfDWFnDEgAH
         EQU7liMeS6gbc0Hnz+NWoghXTJQyya0ib1EMtRfWWOBP4zPEL7YW+l7p1U3RiE7IF5
         jzoeCPCNNEtlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 640A4EAC081
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2022 09:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165329702135.13209.7159961872198212695.git-patchwork-summary@kernel.org>
Date:   Mon, 23 May 2022 09:10:21 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: Add Ethernet to RZ/V2M
  Submitter: Phil Edworthy <Phil.Edworthy@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=642251
  Lore link: https://lore.kernel.org/r/20220517081645.3764-1-phil.edworthy@renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a09g011: Add ethernet nodes

Patch: [v3] arm64: dts: renesas: rzv2m evk: Enable ethernet
  Submitter: Phil Edworthy <Phil.Edworthy@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=643542
  Lore link: https://lore.kernel.org/r/20220520100736.15182-1-phil.edworthy@renesas.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



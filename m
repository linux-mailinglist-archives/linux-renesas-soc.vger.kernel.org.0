Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90D35EBBB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Sep 2022 09:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiI0HkT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Sep 2022 03:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbiI0HkS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 03:40:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CD317A8A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 00:40:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8235861651
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 07:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC24AC433D6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 07:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664264415;
        bh=KL9Soh8tG7VmXZtBOxkp0zlUvx8Zcfzd2Wrj2mGC2JY=;
        h=Subject:From:Date:To:From;
        b=eQQPm0y6F48haBYguHrORrS3jnE7o6Lsm0vIAagcWri9Aap5YDs1Em3/neEEdNDF5
         Frb9APktVJDpcoTea18csNqdF+GqFF7fu4tgXRLj/+ldb/56SVBuI5Zq+voZuilk+X
         HXNaRGghLAVDOdHoacaLDlMRf5faMLSk+6/elMv1GzC+xNYlPQoN3fF3OVVi+M2jtb
         GEX9lKJZgOAL1Bn1TY9F0ex4BgygIgHAfJg6h/xBR62YIpRzYNZX+LdwaDri92XUMA
         SC7YI54VG2wzWBJRVgueGAigRaOFYux03tt86sgp7N62oWJ9e0hyIntqRmWLO5AQCv
         SJ2ag4SAIzbPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BB2E7C04E59
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Sep 2022 07:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166426441569.5358.2010000298538446700.git-patchwork-summary@kernel.org>
Date:   Tue, 27 Sep 2022 07:40:15 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: arm64: dts: renesas: rzg2ul-smarc: Move spi1 pinmux to carrier board DTSI
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=678933
  Lore link: https://lore.kernel.org/r/20220921082221.10599-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: soc: renesas: Kconfig: Explicitly select GPIOLIB and PINCTRL config under SOC_RENESAS
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=678142
  Lore link: https://lore.kernel.org/r/20220919104606.96553-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: arm64: dts: renesas: rzg2lc-smarc: Include SoM DTSI into board DTS
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=678107
  Lore link: https://lore.kernel.org/r/20220919092130.93074-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



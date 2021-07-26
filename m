Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C04B3D59F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 15:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbhGZMTq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 08:19:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:51612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234072AbhGZMTq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 08:19:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2A5A9608FB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627304415;
        bh=OwHDYsij3bjTRMrD8y3lzNzhWSSb8QYlfJumZV1X23E=;
        h=Subject:From:Date:To:From;
        b=l9VCUnIy92tapn7j6BC4htRCVPOgls78FEqR9jQ0s3zmOAKaLna+RenQl94TGI39P
         riA5n8MqfziyTkkUa1Mrwvlt0BCgFXOD2y3W0jYMshkSB6HzUUflG1cD/sTYGnZ2pf
         6wfP03vY+X4dHarKTzTAEn/TOu3fumLgrvu9C+N7HD/GhxJM/pWS0/fKMoVFPsiLFg
         G0hOnGGP06kOPANrbiWSd07y4kz4wvokDBFAXR01Ewrp7jco/aDpF8YbxeMwWk7G7y
         B0kSaMVwTfmnuYrzvUcX4aUtR7MYSqO/HwdOyuM1/pN/BFYFZMGyrIZoOaoyIoYhrn
         KYHduj3XMPR2A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1C84360A12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jul 2021 13:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162730441506.8408.8111619393985375035.git-patchwork-summary@kernel.org>
Date:   Mon, 26 Jul 2021 13:00:15 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [PATCH/RESEND] usb: renesas_usbhs: Fix superfluous irqs happen after usb_pkt_pop()
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=506459
  Lore link: https://lore.kernel.org/r/20210624122039.596528-1-yoshihiro.shimoda.uh@renesas.com
Patch: ravb: Fix a typo in comment
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=519187
  Lore link: https://lore.kernel.org/r/20210721181721.17314-1-biju.das.jz@bp.renesas.com
Patch: ravb: Remove extra TAB
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=519193
  Lore link: https://lore.kernel.org/r/20210721182126.18861-1-biju.das.jz@bp.renesas.com
Series: arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=517995
  Lore link: https://lore.kernel.org/r/87fsw9x3zx.wl-kuninori.morimoto.gx@renesas.com
    Patches: [1/2] arm64: dts: renesas: r8a77995: add R-Car Sound support
             [2/2] arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support
Patch: arm64: dts: renesas: rzg2: Add internal rx delay
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=519179
  Lore link: https://lore.kernel.org/r/20210721180632.15080-1-biju.das.jz@bp.renesas.com

Total patches: 6

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



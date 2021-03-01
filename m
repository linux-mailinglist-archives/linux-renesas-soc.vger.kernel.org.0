Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C29932817F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Mar 2021 15:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236702AbhCAOzp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Mar 2021 09:55:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:35510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236689AbhCAOzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 09:55:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 97C2E64E40
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 14:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614610451;
        bh=x6DW3Gt0+UE6H8mbNyBPekkSyorCQkR7yasIksvCc3g=;
        h=Subject:From:Date:To:From;
        b=hb4Nhz/PHTgJuhOPDwxQstqWbI3LmVOd6gL6D/ZvIXtaV/hmEMtA/Q5yzyU+GdRnp
         nYkUz7A1vxlqejWmqzhhTJBZgkh6p+rApoO9D41xi6cwLrxVKZRzvuzdVPOfXxl7Wy
         MGs+NF94RhROgkZrWBHD8pPFmdVJzR0+2/KyGN+K3/UKl1FDao78PogZ695RmY/2Tg
         bGThKRaWMOIKyPJZUTvgq6CNl6AGmF70I0ZH0i1lHjzGy+flaLHvcr5k64nXxZgWGR
         NEkRnkQNLfzQW6VwAanxHeYWaI5UdS7wV48Iw5p2540ffOIdJFblGxYRk0H2MUd4GK
         UKFOpxQGZ7o7g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 88D4B6094E
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Mar 2021 14:54:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161461045150.15822.18212985636457452225.git-patchwork-summary@kernel.org>
Date:   Mon, 01 Mar 2021 14:54:11 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (refs/heads/next):

Series: i2c: improve RECV_LEN documentation & usage
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=411701
  Lore link: https://lore.kernel.org/r/20210109124314.27466-1-wsa+renesas@sang-engineering.com
    Patches: [1/8] i2c: refactor documentation of struct i2c_msg
             [2/8] i2c: remove licence boilerplate from main UAPI header
             [3/8] i2c: remove licence boilerplate from i2c-dev UAPI header
             [4/8] i2c: octeon: check correct size of maximum RECV_LEN packet
             [5/8] i2c: uapi: add macro to describe support for all SMBus transfers
             [6/8] i2c: algo: bit: use new macro to specifiy capabilities
             [7/8] i2c: qup: advertise SMBus transfers using RECV_LEN
             [8/8] i2c: s3c2410: advertise SMBus transfers using RECV_LEN

Total patches: 8

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E74C33D055
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 10:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhCPJKv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 05:10:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232069AbhCPJK0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 05:10:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2BED665006
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615885808;
        bh=jlgJNxF6N02sHwJOpIl9RvjeFMxXUEPNZK0nMAkJ/gA=;
        h=Subject:From:Date:To:From;
        b=BuJwj0hbMOo/yoyRZrmmkDQRgpKDrC42TMDAcQ/aeEeK2PL2ejAmkW5TBE3fW+WYD
         ihhpouN9Y9FELTL1fv3g1B6yt6MHYTXFAml6i8r8V1klC/wYn0i9dBoJebM0/TzqxH
         i//yJDSBmlQJLVL27wXvsgYQqPlgvRsBfX+0UR3p6L5P//JR3zPxpZ15v8mvbICme4
         krkevjp6EA+WdbNFnTU/RLlGU7TIzrPssUw+B3SIpXjP0jL2fHae/2ewwb/06FB3Rt
         Bjwz1Lb9vs++1QV0FqELrnpnrDO3t2TlLMOsNahYQM6TrqPqqAQqyYScNygVeoTtDh
         ujNzesDAuX8/g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 175D260965
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Mar 2021 09:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <161588580803.18137.14154587036682883319.git-patchwork-summary@kernel.org>
Date:   Tue, 16 Mar 2021 09:10:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: r8a77980: fix vin4-7 binding
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=447237
  Lore link: https://lore.kernel.org/r/20210312174735.2118212-1-niklas.soderlund+renesas@ragnatech.se

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



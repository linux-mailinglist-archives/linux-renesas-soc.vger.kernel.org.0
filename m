Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F1F39305B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 16:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235992AbhE0OBn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 10:01:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:49456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235576AbhE0OBm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 10:01:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 72AC4613C5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622124009;
        bh=ere2oLl8AEq5RwUxWMD2w37pHgfGNJP7p9aogoXE9/w=;
        h=Subject:From:Date:To:From;
        b=MXDAeVWZDptPxwbAu2c/FfPh34ZcNEUiKOFm9/EKJzu4c7qFt0gWHr86RXlyO/3dp
         ypEzUvgjBmds/3eRuiIJMzSw64AfHvMz1NCdLdDoU1UOipWW7RmW7ChuAf0WUqyDk/
         hd6KURTPiXT/I3yk2kwCcjC2osuI4mbiNutRo9VpmE+aTB2O7xZEr/LhR69ikoVK6/
         /E4fFoJBZAZZ26GKUPzbEZGnLreU1uv5t8z/FcjNA9q/FzsQBdsSFsUyiwaJNGCqnB
         4gRZp8UUO7mO6TNys4SxnzdF1HeuuEOyCv6hhglD80XD8es2W3tcJuQ0l6yIEzDq0Q
         1Vsv2Nd5O0yZg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 60B0160BCF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 14:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162212400933.31262.18378546576303083346.git-patchwork-summary@kernel.org>
Date:   Thu, 27 May 2021 14:00:09 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: ARM: dts: alt: add SW2 as GPIO keys
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=488011
  Lore link: https://lore.kernel.org/r/20210525091512.29119-1-wsa+renesas@sang-engineering.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



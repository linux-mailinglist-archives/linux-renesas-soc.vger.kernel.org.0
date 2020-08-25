Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D892515E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 12:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbgHYKAx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 06:00:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729741AbgHYKAv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 06:00:51 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598349651;
        bh=oXsNaRSwLTtNJI5cjDjpryeQDD+fJMQGkTGifQ3UxFI=;
        h=Subject:From:Date:To:From;
        b=aTQvmANi/O81yY8Qk9Kz4S1bwiEPV5ITpgzNy3Fk2IDy+9EJpB2/t538TGZNyYeq/
         6p/nnKl0Sm8bdn2UYdNdQBhK//WfOKUAkZbV/ivengQL5SoSgWitIb8FN3rS66HOrf
         JXewr3E4+ZI3KubsD1lizM+dVnuaJ6oASzCC7m6o=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159834965170.20747.16083550937539143991.git-patchwork-summary@kernel.org>
Date:   Tue, 25 Aug 2020 10:00:51 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Series: arm64: renesas: defconfig: Updates
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=335091
  Link: <20200819100952.11913-1-geert+renesas@glider.be>
    Patches: [PATCH/LOCAL,1/2] arm64: renesas: defconfig: Enable RPC-IF support
             [PATCH/LOCAL,2/2] arm64: renesas: defconfig: Refresh for v5.9-rc1

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21CBA168002
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 15:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgBUOUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 09:20:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:42052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727315AbgBUOUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 09:20:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582294835;
        bh=MiqCcd8YdCi4nyUQTmpklJFyE5x/15TYGp75gjO7o4Y=;
        h=Subject:From:Date:References:To:From;
        b=aJ7o6fb4RGokghT68x2F93fJwfXvDln9foCAPifpouh2SiZh6a7ufFdM26tu2VTGR
         DRzsaDewlUY8qTYLGrwbIzk5/rMYQr2lTumHsNaXoP5RtgbNyYp2orUtT6PfyXkuRV
         pfKUjkDWHA2XBh11DSQ89EnmDkOYUy7N3FjoxGww=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158229483571.12219.2446835940062147487.git-patchwork-summary@kernel.org>
Date:   Fri, 21 Feb 2020 14:20:35 +0000
References: <20200217094716.13689-1-geert+renesas@glider.be>,
 <20200217094755.20632-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [LOCAL] arm64: renesas_defconfig: Refresh for v5.6-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=242501

Patch: [LOCAL] arm64: renesas_defconfig: Enable CONFIG_ARCH_R8A7795[01]
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=242503

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

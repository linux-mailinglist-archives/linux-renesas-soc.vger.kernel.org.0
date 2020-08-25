Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BDB2515E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Aug 2020 12:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729723AbgHYKAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Aug 2020 06:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:53830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729754AbgHYKAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Aug 2020 06:00:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598349644;
        bh=flzso0Btvj6fUEjRXQCcTRCwY94qb8gBlDHjQecX8HA=;
        h=Subject:From:Date:To:From;
        b=LZ1q93tXEsNoqUdD6/dYCiBoJUACbFpXHM9m6rskqpL/vaJLt29rXNWefPxAtTY7e
         UH/nPsoogeYT5vp9uwEoNaJ7F+uM2fT0S6isKS+JxYky+lE68SnRO7W3fYjYvsCGkq
         gL/7WMnuooE2QLTC8lOFgzhlHEbhPhp6qq0gQ0vo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159834964465.20747.14638447877534486284.git-patchwork-summary@kernel.org>
Date:   Tue, 25 Aug 2020 10:00:44 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: shmobile: defconfig: Refresh for v5.9-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=335097
  Link: <20200819101125.12113-1-geert+renesas@glider.be>

Patch: arm64: dts: renesas: r8a774e1-hihope-rzg2h: Enable HS400 mode
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=335013
  Link: <20200819080841.3475-1-biju.das.jz@bp.renesas.com>

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

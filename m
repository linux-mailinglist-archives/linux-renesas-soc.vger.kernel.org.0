Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A18C23EA98
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 11:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgHGJkd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 05:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726854AbgHGJkd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 05:40:33 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596793233;
        bh=AhbZhMszLQMVm/aXq5PDpnaRF5zCapAk29zAuNOzB9E=;
        h=Subject:From:Date:To:From;
        b=iYWdkSahoLV3NImclJ9XOqALDR+v2Pj7eFpOSP94vRoOMVTg5BKN/t0shoIGc37Dh
         0R6qI36izhjVIEv6/KGTTsHN8ICJnbQiIjFLmI/sr2Gjg4FT2hVQLXiwbvvpb958Tf
         UBXVAe/CUHmxHOFGha1LS5dNLQks4DFN6aHSjnOM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159679323309.14023.15040405254856838312.git-patchwork-summary@kernel.org>
Date:   Fri, 07 Aug 2020 09:40:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: ARM: shmobile: Enable TOUCHSCREEN_STMPE in shmobile_defconfig
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=329809
  Link: <20200806121704.3192-1-biju.das.jz@bp.renesas.com>

Patch: [v2] ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=329299
  Link: <20200805142634.12252-1-biju.das.jz@bp.renesas.com>

Patch: arm64: dts: renesas: ulcb: add full-pwr-cycle-in-suspend into eMMC nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=320125
  Link: <1594989201-24228-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

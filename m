Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EC21E0ACE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2020 11:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389367AbgEYJkg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 May 2020 05:40:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388437AbgEYJkf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 May 2020 05:40:35 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590399635;
        bh=UdWNmfR+rs3fveN7QXTrUU8sWUJ/W2IPWLnef0hMLXY=;
        h=Subject:From:Date:To:From;
        b=TNhX6xYXSNz7um1OsBjm7dSmWAol8OIrq+FPYiUS+gBltcUd80XD/hYygVABUr3x/
         eShW5wDesUIAKarfXRxrLK5Is23/OnUzHSYMg9ZkUagQYfMsIRSgxFKqkxwZLlPctd
         Xc2mvj9QZfjvuPPZEWfE5Ga0pL/O86IFcwvEtmKM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159039963552.3682.4676267102082961825.git-patchwork-summary@kernel.org>
Date:   Mon, 25 May 2020 09:40:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: ARM: dts: r9a06g032: Correct GIC compatible value order
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=290097
  Link: <20200519095431.5650-1-geert+renesas@glider.be>

Patch: [v2] ARM: dts: r8a7742: Add RWDT node
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=292403
  Link: <1590172641-1556-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

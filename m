Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3209926A16E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Sep 2020 11:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgIOJAe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 05:00:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:48358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgIOJA3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 05:00:29 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600160429;
        bh=2LknT3QIwVrl52nMW1u9Ug3GvShtc5WojmJzXN/L3Gg=;
        h=Subject:From:Date:To:From;
        b=nh5Lmnz8wlFjeoroAIFUBRxBbVKeECm/dK2/gPwdOyFgK3RIcQHNYYmBnioqlwZaj
         xXpC3dJYBjOy2w7vuzg7arPyVfyhHjTKJoc52NSvM9W7Vv+GZ4+CoZqr/QO9hDRCbD
         m0If0dPDkviqN83QqWpAzBhnvI2w4yZWU+WyOT74=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160016042900.2888.4832387644282044327.git-patchwork-summary@kernel.org>
Date:   Tue, 15 Sep 2020 09:00:29 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: r8a7742: Add VSP support
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=347163
  Link: <20200911080929.15058-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Patch: arm64: dts: renesas: Drop superfluous pin configuration containers
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=335229
  Link: <20200819123910.19606-1-geert+renesas@glider.be>

Patch: ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add can0 support to camera DB
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=347179
  Link: <20200911083615.17377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Patch: arm64: dts: renesas: r8a77990: Add DRIF support
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=347359
  Link: <20200911121259.5669-1-fabrizio.castro.jz@renesas.com>

Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

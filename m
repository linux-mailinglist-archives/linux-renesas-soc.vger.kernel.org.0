Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF8A990317
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 15:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbfHPNd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 09:33:27 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55188 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbfHPNd1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 09:33:27 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5E7B625AD7A;
        Fri, 16 Aug 2019 23:33:25 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5A73094057D; Fri, 16 Aug 2019 15:33:23 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Fixes for v5.3
Date:   Fri, 16 Aug 2019 15:33:11 +0200
Message-Id: <cover.1565962268.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC fixes for v5.3.


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes-for-v5.3

for you to fetch changes up to 45f5d5a9e34d3fe4140a9a3b5f7ebe86c252440a:

  arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name (2019-08-09 11:58:17 -0700)

----------------------------------------------------------------
Renesas ARM Based SoC Fixes for v5.3

* R-Car D3 (r8a77995) based Draak Board
  - Correct backlight regulator name in device tree

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

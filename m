Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D81DA9E7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 11:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387503AbfIEJfB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 05:35:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33050 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731084AbfIEJfB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 05:35:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1600525B753;
        Thu,  5 Sep 2019 19:34:59 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 004A6940AC6; Thu,  5 Sep 2019 11:34:56 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Second Round of Renesas ARM Based SoC Fixes for v5.3
Date:   Thu,  5 Sep 2019 11:34:45 +0200
Message-Id: <cover.1567675986.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these second round of Renesas ARM based SoC fixes for v5.3.

This pull request is based on the previous round of
such requests, tagged as renesas-next-20190813-v5.3-rc1,
which you have already pulled.


The following changes since commit 45f5d5a9e34d3fe4140a9a3b5f7ebe86c252440a:

  arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name (2019-08-09 11:58:17 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-fixes2-for-v5.3

for you to fetch changes up to ae688e1720fd387de34f2140a735917411672bf1:

  arm64: dts: renesas: hihope-common: Fix eMMC status (2019-08-31 11:23:18 +0200)

----------------------------------------------------------------
Second Round of Renesas ARM Based SoC Fixes for v5.3

* RZ/G2M based HiHope main board
  - Re-enabled accidently disabled SDHI3 (eMMC) support

----------------------------------------------------------------
Fabrizio Castro (1):
      arm64: dts: renesas: hihope-common: Fix eMMC status

 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

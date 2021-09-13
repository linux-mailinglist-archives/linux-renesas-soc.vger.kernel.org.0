Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9824084FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 08:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237451AbhIMGys (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 02:54:48 -0400
Received: from www.zeus03.de ([194.117.254.33]:37142 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237357AbhIMGyr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 02:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=A5s2UrPBy0sH24XTJhM4ih57TUe
        rPyuMyi2WvFY/jI4=; b=HzdJGD14ZB7IalF8Vb/9uPpmuwfAqW9Yq/l4sgipkLY
        lIbXjR8c1pm/xsAxBzR3p37Bn0VosN5nck+fjajkoCvpfd/klzm6NL4oQ9U1QRps
        kOVfU+nnaAPlPGil1G8iZBn/SBMveYjDQ7Zhr0MrbVndVKdq0NzwlPG8PJtRQWrk
        =
Received: (qmail 2765574 invoked from network); 13 Sep 2021 08:53:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2021 08:53:30 +0200
X-UD-Smtp-Session: l3s3148p1@KqMI7NrL4MsgAwDPXwnUAPbX7otZ63eo
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/4] r8a779a0: add RPC support
Date:   Mon, 13 Sep 2021 08:53:13 +0200
Message-Id: <20210913065317.2297-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is a series with clk and DTS updates to enable the RPC unit on the
R-Car V3U SoC. Important: If you want to test it, please use this
branch because it contains a patch which avoids data corruption!

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/rpc

Because the data corruption fix is still in internal review, this
patchset is RFC only to gather comments. Also, there is a question left
to discuss in patch 1 and some comments to patch 4.


Duc Nguyen (1):
  arm64: dts: renesas: r8a779a0: Add RPC node

Wolfram Sang (3):
  clk: renesas: cpg-lib: move RPC clock registration to the library
  clk: renesas: r8a779a0: Add RPC support
  arm64: dts: renesas: falcon-cpu: add SPI flash via RPC

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 33 +++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 17 ++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 29 ++++++
 drivers/clk/renesas/rcar-cpg-lib.c            | 83 +++++++++++++++++
 drivers/clk/renesas/rcar-cpg-lib.h            |  7 ++
 drivers/clk/renesas/rcar-gen3-cpg.c           | 89 +------------------
 6 files changed, 171 insertions(+), 87 deletions(-)

-- 
2.30.2


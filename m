Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA6741BF4A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Sep 2021 08:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244416AbhI2GvN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Sep 2021 02:51:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:40902 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244342AbhI2GvL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 02:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=BB5VB5NjTqKg8K9UKuQ0UyFgH9s
        BBzjOQiXnaDC4n5A=; b=ZH+i6Y6Yo7RZA0pMA8lXLD+68Bfz/aw/rm357uEgq5q
        +aOm/OLKTpiXT26L0lNTJbHlB7fo532tmShOvD1RL9yt3zFWdsvUF4Gb/A9+mGq5
        C80IT0rfqpTj8suTya+M1+143ntqpNHoaM/zGeLXX/I7Z0jbAfbbQ5TyDgBpwF2g
        =
Received: (qmail 1544751 invoked from network); 29 Sep 2021 08:49:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Sep 2021 08:49:29 +0200
X-UD-Smtp-Session: l3s3148p1@YRopuxzNwNcgAwDPXwj5ACKF5hhAYpZw
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/4] r8a779a0: add RPC support
Date:   Wed, 29 Sep 2021 08:49:20 +0200
Message-Id: <20210929064924.1997-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is a non-RFC series with clk and DTS updates to enable the RPC unit
on the R-Car V3U SoC. Important: If you want to test it, please use this
branch because it contains a patch which avoids data corruption!

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/rpc

The patch fixing the corruption is now applied and in for-next, so this
series dropped RFC status and can be applied, I think.

Changes since RFC:

* added Geert's tags to patches 1-3
* reduced SPI speed to 40Mhz in patch 4
* removed unneeded leading 0s in patch 4

Kind regards,

   Wolfram


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


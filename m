Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2625F423A18
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 10:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237620AbhJFJAh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 05:00:37 -0400
Received: from www.zeus03.de ([194.117.254.33]:47562 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237594AbhJFJAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 05:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=w47o0Or/+5gDnZ2aY7tfyUZ4lfX
        HPSW7fJD5WXhtZkM=; b=v1k+1+OxUk1b7ZA9sbX/UnAWyuYZlCyKjEde2KKhe8d
        f++I9CJQ2aWh8xd408XgxEwHHrFHtvFKjmHrhoib9mOzD1xm/sLLPReT40llt5uX
        JmOZ/BkfyxPsAIBcC0ZnqUc4g0cXAuSkjyqD7Y/jV9U+Q+zJzDORXCak9/5Z6jIs
        =
Received: (qmail 4135805 invoked from network); 6 Oct 2021 10:58:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Oct 2021 10:58:43 +0200
X-UD-Smtp-Session: l3s3148p1@TuthWqvNhLggAwDPXwnIAEWfFJ7Kfqru
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/4] r8a779a0: add RPC support
Date:   Wed,  6 Oct 2021 10:58:32 +0200
Message-Id: <20211006085836.42155-1-wsa+renesas@sang-engineering.com>
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

The patch fixing the corruption is now applied and in for-next, so this
series dropped RFC status and can be applied, I think.

Changes since v1, all in patch 4:
* increased the boot partition size to contain the bootloader
  environment as well
* renamed "boot_partition" to "boot" (Thanks, Sergey!)
* removed leading zeros in reg properties


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


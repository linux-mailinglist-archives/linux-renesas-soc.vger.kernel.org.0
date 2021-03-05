Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBA2332ED30
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhCEOdk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:33:40 -0500
Received: from www.zeus03.de ([194.117.254.33]:42000 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231187AbhCEOdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=IGrir3xhSrUMeq4nxmdRykTAQ7c
        fKjREVDoqH6CmXcM=; b=FOKjI1C1upO8bA/BrizRnCktNCJsFzgJ6NN41oTpPlm
        GnhX4aUw0Q5DwXAkgTVJXGywM035+dxwi7xeGLrkrRxnnbG3s7QctxUn9OXxvn9+
        wRhC3OX69eHCenddjI/HoYRp4gjRrEqDHp+haIbUkCxsF966KUvBSotNWRtEamok
        =
Received: (qmail 2251799 invoked from network); 5 Mar 2021 15:33:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Mar 2021 15:33:04 +0100
X-UD-Smtp-Session: l3s3148p1@GMdA9sq8dplN91Vm
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] v3u: add support for TMU
Date:   Fri,  5 Mar 2021 15:32:56 +0100
Message-Id: <20210305143259.12622-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the series with patches for Geert to enable TMU on V3U. I took
the DTS patches from the BSP, the rest was developed on mainline tree.
Patch 3 is only for testing.

The TMU passed the tests described by Niklas here:
https://elinux.org/R-Car/Tests:timers

Phong Hoang (2):
  arm64: dts: renesas: r8a779a0: Add TMU support
  TEST: arm64: dts: renesas: falcon: Enable TMU

Wolfram Sang (1):
  clk: renesas: r8a779a0: Add TMU clocks

 .../boot/dts/renesas/r8a779a0-falcon.dts      | 20 ++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 65 +++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  6 ++
 3 files changed, 91 insertions(+)

-- 
2.29.2


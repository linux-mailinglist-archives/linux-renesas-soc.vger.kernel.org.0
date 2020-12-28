Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC552E3661
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 12:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgL1L2U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 06:28:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:37426 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727019AbgL1L16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 06:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=GVxhTXLPfgHw1CkQt9T4NPJKwc9
        uEgyIGg6fuAWxXH8=; b=0uz2JgKdg1DMm2gfKLOFm56B0CWCUIgmGbqN4sQpGBK
        bu+SorzTfcR3mrCX9cdo/y7dApOVvi7Fc86XaFhYWY4lz7aR4oN0tFj55ldR2vSj
        J9khEDn1QT0Ht7s7PmmGEk3tKKAqlZag0C4P66Xvc46Q1R2DU6/UPfwftMqpk9fE
        =
Received: (qmail 1738945 invoked from network); 28 Dec 2020 12:27:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 12:27:15 +0100
X-UD-Smtp-Session: l3s3148p1@s1dYjoS3xJQgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 0/6] v3u: add & update (H)SCIF nodes
Date:   Mon, 28 Dec 2020 12:27:07 +0100
Message-Id: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCIF0 already worked because of firmware settings, but let's have a
proper node for it. Also add HSCIF0 because the last patch shows that it
also works. Because these blocks work in general, let's add the other
instances to the DTSI, too.

These additions make me a bit wonder about the 'reg'-based sorting in
our DTSI files. It looks a bit messy to me, but I kept it for
consistency. Same with the (H)SCIF reg sizes which are a tad too large
but in sync with our other DTSI files.

Looking forward to comments!

All the best,

   Wolfram


Linh Phung (1):
  arm64: dts: renesas: r8a779a0: Add HSCIF support

Wolfram Sang (5):
  arm64: dts: renesas: r8a779a0: add & update SCIF nodes
  arm64: dts: renesas: falcon: add SCIF0 nodes
  dt-bindings: serial: renesas,hscif: Add r8a779a0 support
  clk: renesas: r8a779a0: add HSCIF support
  WIP: arm64: dts: renesas: falcon: switch to from SCIF0 to HSCIF0

 .../bindings/serial/renesas,hscif.yaml        |   1 +
 .../boot/dts/renesas/r8a779a0-falcon.dts      |  31 ++++-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 114 ++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |   4 +
 4 files changed, 149 insertions(+), 1 deletion(-)

-- 
2.29.2


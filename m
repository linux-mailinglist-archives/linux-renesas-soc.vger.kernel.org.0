Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C779336EE3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Mar 2021 10:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhCKJ3w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Mar 2021 04:29:52 -0500
Received: from www.zeus03.de ([194.117.254.33]:49070 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232036AbhCKJ3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Mar 2021 04:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=Ifj2TqchcqqidMqvDDDH56XYugj
        YSZ6Mg0AkddJB2bg=; b=bk1l00LOG3aVpsVgXvGFW47UvLI6JzaRiYeTWhZiVK3
        D+fZkfmF8I2E3Qpz3A1hoAsogi5eP/3o7SCY467jpXbS4a/+P0Cp8ZpieVp5riBy
        5VeWcL/wxLmsRZ82nGsE1alrEvvhGYUYOCZNXu/9zWvGzIQPy5ePUpDV690hUV2A
        =
Received: (qmail 4141722 invoked from network); 11 Mar 2021 10:29:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2021 10:29:43 +0100
X-UD-Smtp-Session: l3s3148p1@AsVqbD+9OMwgARa4Rf6LAY0TkMkJSYgM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] v3u: add support for CMT
Date:   Thu, 11 Mar 2021 10:29:36 +0100
Message-Id: <20210311092939.3129-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the series with patches for Geert to enable CMT on V3U. I took
the DTS patches from the BSP, the rest was developed on mainline tree.
Patch 3 is only for testing.

Phong Hoang (2):
  arm64: dts: renesas: r8a779a0: Add CMT support
  TEST: arm64: dts: renesas: falcon: Enable CMT

Wolfram Sang (1):
  clk: renesas: r8a779a0: Add CMT clocks

 .../boot/dts/renesas/r8a779a0-falcon.dts      | 16 +++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi     | 70 +++++++++++++++++++
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |  4 ++
 3 files changed, 90 insertions(+)

-- 
2.30.0


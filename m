Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285112C66B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 14:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgK0NWH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 08:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730213AbgK0NWH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 08:22:07 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08E8C0613D4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 05:22:06 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id xRN32300D4C55Sk01RN3kC; Fri, 27 Nov 2020 14:22:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kidhL-0065FO-Cl; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kidhL-000K9l-0z; Fri, 27 Nov 2020 14:22:03 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL 1/3] Renesas ARM DT updates for v5.11 (take two)
Date:   Fri, 27 Nov 2020 14:21:53 +0100
Message-Id: <20201127132155.77418-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
References: <20201127132155.77418-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 43bba65761952f58e850d918ee43b648427609bb:

  arm64: dts: renesas: hihope-rev4: Add a comment explaining switch SW2404 (2020-11-10 09:29:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.11-tag2

for you to fetch changes up to 0f80b9b8126cf3e352aa6b270ed24c9cd9a6272b:

  arm64: dts: renesas: r8a77951: Add PCIe EP nodes (2020-11-27 09:07:06 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.11 (take two)

  - PCIe endpoint support for the R-Car H3 ES2.0+ SoC.

----------------------------------------------------------------
Yuya Hamamachi (1):
      arm64: dts: renesas: r8a77951: Add PCIe EP nodes

 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 38 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

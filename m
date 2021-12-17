Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D02347897A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 12:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbhLQLHX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 06:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235246AbhLQLHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 06:07:20 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA764C061746
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Dec 2021 03:07:19 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by xavier.telenet-ops.be with bizsmtp
        id XP7H26008250X3001P7HcP; Fri, 17 Dec 2021 12:07:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB52-005Y8S-VH; Fri, 17 Dec 2021 12:07:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1myB52-00AQSN-FV; Fri, 17 Dec 2021 12:07:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.17
Date:   Fri, 17 Dec 2021 12:07:12 +0100
Message-Id: <cover.1639736717.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639736716.git.geert+renesas@glider.be>
References: <cover.1639736716.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.17-tag1

for you to fetch changes up to 44e009607444f64d173f0c884e815edabc093024:

  arm64: defconfig: Enable R-Car S4-8 (2021-12-07 16:56:12 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.17

  - Enable support for the new R-Car S4-8 SoC in the arm64 defconfig.

----------------------------------------------------------------
Yoshihiro Shimoda (1):
      arm64: defconfig: Enable R-Car S4-8

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA983EB3F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 12:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240072AbhHMKXW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 06:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240073AbhHMKXS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 06:23:18 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5246BC0617AE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Aug 2021 03:22:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b151:f011:b544:c545])
        by albert.telenet-ops.be with bizsmtp
        id gyNq2500K1MlFFN06yNq7W; Fri, 13 Aug 2021 12:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mEUKw-002Wov-FB; Fri, 13 Aug 2021 12:22:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mEUKv-007SUy-NJ; Fri, 13 Aug 2021 12:22:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas driver updates for v5.15 (take two)
Date:   Fri, 13 Aug 2021 12:22:36 +0200
Message-Id: <cover.1628849625.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628849621.git.geert+renesas@glider.be>
References: <cover.1628849621.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit bfe6b5590ce6cab81b3ee51b4541bd1d0b18b3b2:

  soc: renesas: Identify R-Car H3e-2G and M3e-2G (2021-07-27 09:27:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.15-tag2

for you to fetch changes up to 148bcca9ad0488d623aa36b21ac152bb056a1ae4:

  soc: renesas: Prefer memcpy() over strcpy() (2021-08-12 12:36:57 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.15 (take two)

  - Prefer memcpy() over strcpy().

----------------------------------------------------------------
Len Baker (1):
      soc: renesas: Prefer memcpy() over strcpy()

 drivers/soc/renesas/r8a779a0-sysc.c | 6 ++++--
 drivers/soc/renesas/rcar-sysc.c     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

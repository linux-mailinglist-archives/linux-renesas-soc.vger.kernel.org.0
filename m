Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678DE41E9F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 11:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353163AbhJAJoj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 05:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353240AbhJAJog (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 05:44:36 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12CCC06177B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Oct 2021 02:42:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
        by albert.telenet-ops.be with bizsmtp
        id 0Ziq2600c1ZoSwU06Ziqjs; Fri, 01 Oct 2021 11:42:51 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF46-000zIl-ED; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF45-00BE6O-Vj; Fri, 01 Oct 2021 11:42:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas driver updates for v5.16
Date:   Fri,  1 Oct 2021 11:42:45 +0200
Message-Id: <cover.1633081156.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633081144.git.geert+renesas@glider.be>
References: <cover.1633081144.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.16-tag1

for you to fetch changes up to 2ed1e4815922a3b22561b6e0e6f6d3d15a4e1007:

  soc: renesas: Identify more R-Car Gen3e SoCs (2021-09-13 10:56:29 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.16

  - Initial support for the new R-Car H3e, M3e, M3Ne(-2G), D3e, E3e, and
    H3Ne SoCs.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Identify more R-Car Gen3e SoCs

 drivers/soc/renesas/Kconfig       | 7 +++++--
 drivers/soc/renesas/renesas-soc.c | 7 +++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

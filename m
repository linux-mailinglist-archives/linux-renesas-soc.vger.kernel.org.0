Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F36825D7C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 13:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbgIDLsj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 07:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbgIDLsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 07:48:32 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D8AC061244
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2020 04:48:31 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id PnoM2300T4C55Sk06noMoL; Fri, 04 Sep 2020 13:48:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0004eP-8C; Fri, 04 Sep 2020 13:48:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0007ss-7F; Fri, 04 Sep 2020 13:48:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas driver updates for v5.10
Date:   Fri,  4 Sep 2020 13:48:19 +0200
Message-Id: <20200904114819.30254-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904114819.30254-1-geert+renesas@glider.be>
References: <20200904114819.30254-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.10-tag1

for you to fetch changes up to 464d9b349be634bd12978f2554b2b0198e56399d:

  soc: renesas: Align driver description titles (2020-09-01 10:22:16 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.10

  - Improve visual Kconfig structure.

----------------------------------------------------------------
Kuninori Morimoto (2):
      soc: renesas: Use menu for Renesas SoC
      soc: renesas: Align driver description titles

 drivers/soc/renesas/Kconfig | 114 ++++++++++++++++++++++----------------------
 1 file changed, 57 insertions(+), 57 deletions(-)

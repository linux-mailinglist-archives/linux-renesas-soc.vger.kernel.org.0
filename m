Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01503EC638
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 16:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfKAP64 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 11:58:56 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:47554 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfKAP64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 11:58:56 -0400
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id Lfyt2100C5USYZQ06fytNC; Fri, 01 Nov 2019 16:58:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZK9-0002rV-4N; Fri, 01 Nov 2019 16:58:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZK9-0008CT-35; Fri, 01 Nov 2019 16:58:53 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/6] Renesas ARM defconfig updates for v5.5
Date:   Fri,  1 Nov 2019 16:58:37 +0100
Message-Id: <20191101155842.31467-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101155842.31467-1-geert+renesas@glider.be>
References: <20191101155842.31467-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.5-tag1

for you to fetch changes up to 51e0f6a1917831373e153eca2fb27902f0f8bc7b:

  ARM: shmobile: defconfig: Refresh for v5.4-rc1 (2019-11-01 14:17:01 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v5.5

  - Refresh shmobile_defconfig for v5.4-rc1.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v5.4-rc1

 arch/arm/configs/shmobile_defconfig | 3 ---
 1 file changed, 3 deletions(-)

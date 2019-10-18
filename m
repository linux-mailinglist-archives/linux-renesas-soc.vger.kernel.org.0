Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48256DC37D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 13:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633582AbfJRLBK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 07:01:10 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:47694 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633622AbfJRLBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 07:01:07 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id Ez142100u05gfCL01z148Q; Fri, 18 Oct 2019 13:01:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLQ0G-0005q3-NO; Fri, 18 Oct 2019 13:01:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLPEt-0006ry-Rb; Fri, 18 Oct 2019 12:12:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 2/5] Renesas ARM64 defconfig updates for v5.5
Date:   Fri, 18 Oct 2019 12:11:33 +0200
Message-Id: <20191018101136.26350-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018101136.26350-1-geert+renesas@glider.be>
References: <20191018101136.26350-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-defconfig-for-v5.5-tag1

for you to fetch changes up to d8b178741e5ba571fbcc187c9e3cf9c0eaebf328:

  arm64: defconfig: Enable R8A774B1 SoC (2019-10-01 09:51:58 +0200)

----------------------------------------------------------------
Renesas ARM64 defconfig updates for v5.5

  - Enable support for the new RZ/G2N (r8a774b1) SoC.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable R8A774B1 SoC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

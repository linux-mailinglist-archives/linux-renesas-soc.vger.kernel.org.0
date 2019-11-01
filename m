Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C80AEC63A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Nov 2019 16:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKAP65 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Nov 2019 11:58:57 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:57998 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfKAP64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Nov 2019 11:58:56 -0400
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id Lfyu210055USYZQ01fyus7; Fri, 01 Nov 2019 16:58:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0002ra-9J; Fri, 01 Nov 2019 16:58:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iQZKA-0008CZ-8b; Fri, 01 Nov 2019 16:58:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/6] Renesas ARM64 defconfig updates for v5.5 (take two)
Date:   Fri,  1 Nov 2019 16:58:39 +0100
Message-Id: <20191101155842.31467-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101155842.31467-1-geert+renesas@glider.be>
References: <20191101155842.31467-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit d8b178741e5ba571fbcc187c9e3cf9c0eaebf328:

  arm64: defconfig: Enable R8A774B1 SoC (2019-10-01 09:51:58 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-defconfig-for-v5.5-tag2

for you to fetch changes up to b13d0e61629b09153ddbc52eb8b57af7805c0851:

  arm64: defconfig: Enable R8A77961 SoC (2019-11-01 14:06:01 +0100)

----------------------------------------------------------------
Renesas ARM64 defconfig updates for v5.5 (take two)

  - Enable support for the new R-Car M3-W+ (r8a77961) SoC.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      arm64: defconfig: Enable R8A77961 SoC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E12AC4E2C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbfFUJMN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:12:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33642 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfFUJMN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:12:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 29ABA25AEE7;
        Fri, 21 Jun 2019 19:12:11 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 309569408C4; Fri, 21 Jun 2019 11:12:09 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Updates for v5.3
Date:   Fri, 21 Jun 2019 11:12:04 +0200
Message-Id: <cover.1561105093.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC updates for v5.3.


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-soc-for-v5.3

for you to fetch changes up to 02af9f90941b6cce5fb672ee058c142adcc11a2f:

  soc: renesas: Enable RZ/A1 IRQC on RZ/A1H and RZ/A2M (2019-06-06 10:37:06 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Updates for v5.3

* Auto-enable RZ/A1 IRQC on RZ/A1H and RZ/A2M
* Don't init CNTVOFF/counter if PSCI is available

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: Enable RZ/A1 IRQC on RZ/A1H and RZ/A2M

Oleksandr Tyshchenko (1):
      ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available

 arch/arm/mach-shmobile/setup-rcar-gen2.c | 17 +++++++++++++++++
 drivers/soc/renesas/Kconfig              |  4 +++-
 2 files changed, 20 insertions(+), 1 deletion(-)

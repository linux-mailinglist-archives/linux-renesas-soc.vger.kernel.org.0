Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195C84E2EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfFUJOV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:14:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfFUJOV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:21 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ABDE025BE7A;
        Fri, 21 Jun 2019 19:14:04 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B06829408C4; Fri, 21 Jun 2019 11:14:02 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v5.3
Date:   Fri, 21 Jun 2019 11:14:01 +0200
Message-Id: <cover.1561101309.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC defconfig updates for v5.3.


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-defconfig-for-v5.3

for you to fetch changes up to b995421faef5b24ee8ec60d66b356b57ca0c8b77:

  ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig (2019-05-20 13:24:06 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC Defconfig Updates for v5.3

* Remove GENERIC_PHY from shmobile_defconfig as it is now selected

----------------------------------------------------------------
Biju Das (1):
      ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig

 arch/arm/configs/shmobile_defconfig | 1 -
 1 file changed, 1 deletion(-)

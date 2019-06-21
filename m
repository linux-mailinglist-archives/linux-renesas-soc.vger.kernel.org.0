Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF8944E339
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfFUJRp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:17:45 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34780 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbfFUJRn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:17:43 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EE83C25BEDD;
        Fri, 21 Jun 2019 19:16:50 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 017549408C4; Fri, 21 Jun 2019 11:16:48 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v5.3
Date:   Fri, 21 Jun 2019 11:16:41 +0200
Message-Id: <cover.1561105600.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM64 based SoC defconfig updates for v5.3.


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v5.3

for you to fetch changes up to c24f6886b2ee321b50543d3683573689a1817336:

  arm64: defconfig: enable TYPEC_HD3SS3220 config option (2019-06-12 13:57:08 +0200)

----------------------------------------------------------------
Renesas ARM64 Based SoC Defconfig Updates for v5.3

Enable as modules:
* TYPEC_HD3SS3220 B Type-C DRP Port controller driver
* TDA19988 HDMI encoder driver

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: enable TYPEC_HD3SS3220 config option

Fabrizio Castro (1):
      arm64: defconfig: Enable TDA19988

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

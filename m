Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAFF96005AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 05:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbiJQDWN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Oct 2022 23:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbiJQDWL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 23:22:11 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982EF4DB00
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665976930; x=1697512930;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sLFiXeuzpBVILHKt2Dl8xMndN8iMH7sUXIAUMWnlnro=;
  b=NOZppjXXCPycjl3MUWhK0OrinZGLod/7evrbDjkXiF+otCmx+DpwKnFa
   F9CfOKIqTv+p3q6CGNDYkTzhMMfaMbnDdO6A9ix3gt7hJzWXk/S2b09RR
   ShrINT24VT6UtF+bW/ltyYaIAc93cVTAAKexRtFVaAPwIEDKBgrZGuaHr
   3EL88w4IibScQPd5i2dhWrK1JJsKxWQmgOoB8W20uoqlCiBqv66ca5z00
   6NxU4XquKX3t7ayzdVexlSBITnhfu7Oa3uVgelB/M7+vBJWOpQr/G4ApW
   M4owXHbOG1H97J9ucwG+7e/nH5ujA9Qg3kSwbP/yjYveXF5Not3BbTmyo
   A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; 
   d="scan'208";a="219134999"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 11:22:09 +0800
IronPort-SDR: BvZrSRdiwtAskfBaBv0FQ+Ij5f/ub1kGUYeQcpUYpKBnOsjBPUCPqmtqzwvr22y8GuurV5N6/V
 W8Yhq7vljAfngauEbgbQj2PB51FuCyYihLnat/x8zzpOQgsR+eLUz9ADFjLKjvasg0a9A+d29Y
 j2pkMrD5fB1az+/0r7z5qOWSa1Krrf0JohnWHI1Elp5WkAmoJlYP3kWPsACegWoL9mwLd5m+vJ
 dvH3LQAVw0laUUDoGXRLKTIaa88yTNnNJPSJj0gPVxA3Nj3gYPH24xWXrDffh2z3EUN+WZ5EVi
 1Vsw77AAsvQCAX9nuWKPGRBv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 19:41:42 -0700
IronPort-SDR: TTZoiQHY8AL1IIS9VMU2gLc3hxhAp9CIG5CSd5I6TFDBnhNYRi0y6VDHhR4aotgaJHDijk1FsR
 U9xnatVXHfEJeBbf8HI9xT3lBHB6MxvqNpsObMUFbXzI30PCwtOY/CXD1eOIpk2C2E9AMZNgqo
 T9s0y36gAkENvV/c+H6xjDohEk4U/DAZtquAH4XwEiuSKpfPrL4X3eKH9ZWNPKhjAZbdi3hh6p
 5peoVu9qfJB7pmoslgNCy6RovEkrY+PAIM6hLahyS4DM7lskpRdIdu0vOBRIQUOgpVnppZns2e
 SrU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 20:22:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrMjs1Ctmz1Rwtl
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :x-mailer:message-id:date:subject:to:from; s=dkim; t=1665976928;
         x=1668568929; bh=sLFiXeuzpBVILHKt2Dl8xMndN8iMH7sUXIAUMWnlnro=; b=
        Zlk8l8gi+Xe7rOn8ZwRo1z7U/eLsXX3QmC3tpMNUAVlpPrFjjY9NRC6Ze0DFKy6T
        Y2bwIXaVlSdZ1WEXPQJvlT3Du0Yb27XVIjNHirwiYSxMAuJrD4s1PLUWLEU790jj
        AfAwaTHRYMLagz8jdDCABZBq6PaJd7CXKGxAk9KN7YSaDfwkedYJJquw8U0xnT/J
        NWOD9+IUNOG+TmJc35hcY2xCiFgKb9iyfxm4MQPj1BYbjKVifcCOw21C7Rx1zhKj
        Q9PFeVn4yHvsA6GMSv1zlDD/gCFpLPQOzqj6eoy3KeBX9pcNbm9boChVAel/J6uY
        tA9OsZ6Tksk2reFNLLU1UQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id jqlx5bEc9WlF for <linux-renesas-soc@vger.kernel.org>;
        Sun, 16 Oct 2022 20:22:08 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrMjq1371z1RvLy;
        Sun, 16 Oct 2022 20:22:07 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        linux-renesas-soc@vger.kernel.org,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/6] Fix compilation warnings
Date:   Mon, 17 Oct 2022 12:21:59 +0900
Message-Id: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Several patches for 6.1-fixes to dwiaddress fix compilation warnings
thrown with CC=3Dclang and W=3D1 and depending on CONFIG_OF settings.

Damien Le Moal (6):
  ata: ahci_st: Fix compilation warning
  ata: sata_rcar: Fix compilation warning
  ata: ahci_brcm: Fix compilation warning
  ata: ahci_xgene: Fix compilation warning
  ata: ahci_imx: Fix compilation warning
  ata: ahci_qoriq: Fix compilation warning

 drivers/ata/ahci_brcm.c  | 2 +-
 drivers/ata/ahci_imx.c   | 2 +-
 drivers/ata/ahci_qoriq.c | 2 +-
 drivers/ata/ahci_st.c    | 2 +-
 drivers/ata/ahci_xgene.c | 2 +-
 drivers/ata/sata_rcar.c  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

--=20
2.37.3


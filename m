Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBADF6005B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 05:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbiJQDWV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Oct 2022 23:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbiJQDWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 23:22:16 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA3D4D83D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665976936; x=1697512936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9oVd3kKUW3BD9R22KKr2B93jbr7Wn+zAbmF4qTKLCcU=;
  b=BeN29Pj2EL3R2FY1G2UXc34fEPysHI034fhMy9o8jLVDLiWw5KdgpYlb
   AjR4pMD0WCBFxQAdqlyZsBe+cShC9FGcXww5rIlexE2r9XgdU/Kcv6DyA
   PMf7czhszZS1QOgGyFyPYs2auktBmAcOZD1aBNrukqOKtFMh1X0ymIe24
   nRePMLvVOHmFKDkXGGVIwebBHhH3OdsiNzyO+xcw0EGexxkH4BZ05ZeIO
   qlv2mEPu9jXV68OfMBq0MAv3gadEEaCGMJiTtyQ7xZ2D1pVbZhOYY+r84
   Xu7li8A9p/4mFf0nCkU05DpUPtujfSM3MBpYkuAMyAK8HXfK0uXM7qdRF
   w==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; 
   d="scan'208";a="219135019"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 11:22:16 +0800
IronPort-SDR: dcBwT2nZlncxcfDEIIQ6Z2IfoF/vv/pCedpPvV7iqxe8fKGEWvGgUjvunTRmiQN/H49KesLHeM
 t1UFCD555GqAmPvxWFxwWK/AD/+m/vy1ZJSSa5DIgBQLvdylNczd3U23uloMLvt4rSxY6mjbhx
 IjrUHka6DWPyqXHbkmyVJ4ZaFE3Wrwkg0AzUTIVImdJJ6KM1yCmnPaUw9T86PflWfuP6dxj7TJ
 atoxsYkJswDpdgfYZ+gGM75E1m1jBk100SMv4r4kzCBIN+Ph3J24dRdnnYbJsYaxI7EjCLTiYT
 HZomrIJZZE07WiivG+7VTnXH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 19:41:48 -0700
IronPort-SDR: r6jjKuusxTZiP3hfwXzvdnpADKgpYC78gPiZRxgaWGwOte43dNAZvQIHMHZEQsWfYh2oCVX+92
 N59F+ne5fmYgSs9OBRoF8fCCJpbSAaMyYfHqckIkMFLcovKxmAQ+yDX65FIA69KbgvjvDqQbEk
 C2XwdvlCo/uaWxvOJubwQrXapEsOACFGBrqnsKBZd6kjzfiUfZ44SJYgkgZX4QHcgohry9WZuv
 xAP94/eR+t+4psUO0JQpzSRaEi1T+keq35P9cSBO7a0r0VYnnuP7fpW2IjtHo5IjBBPrHNixW6
 yiI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 20:22:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrMjz5QRrz1RvTr
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1665976935; x=1668568936; bh=9oVd3kKUW3BD9R22KK
        r2B93jbr7Wn+zAbmF4qTKLCcU=; b=rF2LdUjZnJtL/Exkv3BjRLjLgXR0Qsi2ks
        X839gYzxXeTVjtVrsSqZmVtYhbB3rLOBr8UV2ZaOsW+Mr5lvjm3tHec8Tdqw20ly
        0AdVo87lQxcGX1sUbNLWyYV00uG3MhrBiLRnHLd8v/KAz3nEHd02gYsjKm7S1+ET
        KBEIk8I6iN6fRZUPtkDVRiDlec4Mur3jfSkyXpu0wEvwr+g9attNMVVfR+bqNLCG
        UyrsC6UrC5D/T/lLv+VOnaoX0H95aeoljggjfuPzZ0hzwiOOFs17D8iQJg7pUCRd
        62tyoLb2CWnRD40q9X9NVZwDeis9ij8vcvpRakte5QfxNtTdAwrg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id fQa2XZleIQPm for <linux-renesas-soc@vger.kernel.org>;
        Sun, 16 Oct 2022 20:22:15 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrMjx74PXz1RvLy;
        Sun, 16 Oct 2022 20:22:13 -0700 (PDT)
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
Subject: [PATCH 4/6] ata: ahci_xgene: Fix compilation warning
Date:   Mon, 17 Oct 2022 12:22:03 +0900
Message-Id: <20221017032205.2210188-5-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
References: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When compiling with clang and W=3D1, the following warning is generated:

drivers/ata/ahci_xgene.c:788:14: error: cast to smaller integer type
'enum xgene_ahci_version' from 'const void *'
[-Werror,-Wvoid-pointer-to-enum-cast]
       version =3D (enum xgene_ahci_version) of_devid->data;
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by using a cast to unsigned long to match the "void *" type
size of of_devid->data.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/ahci_xgene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
index 7bb5db17f864..1e08704d5117 100644
--- a/drivers/ata/ahci_xgene.c
+++ b/drivers/ata/ahci_xgene.c
@@ -785,7 +785,7 @@ static int xgene_ahci_probe(struct platform_device *p=
dev)
 	of_devid =3D of_match_device(xgene_ahci_of_match, dev);
 	if (of_devid) {
 		if (of_devid->data)
-			version =3D (enum xgene_ahci_version) of_devid->data;
+			version =3D (unsigned long) of_devid->data;
 	}
 #ifdef CONFIG_ACPI
 	else {
--=20
2.37.3


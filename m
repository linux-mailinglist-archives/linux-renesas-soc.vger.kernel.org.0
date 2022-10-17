Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03EF56005B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 05:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbiJQDWQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Oct 2022 23:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbiJQDWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 23:22:13 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A144DB02
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665976931; x=1697512931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JyUFxOvPYH/k0WxEU3ZawwvhoXKhUga9w0a/EIhr1go=;
  b=nUL3B3DEnLicp65tYuP2VEEhivJZRnFTlTg+budxkcjazUM59OPdhfcp
   pRCr5o2iZVhwHnqjjvGBniLlD+ybwv7HZQYlKT+7iBxZTffjNBAIJG8vf
   NlvXFosmGVTeG81ucM29O55jvzmjzAVZU9Dz8KPmq3WFv8S+mWew6Yjcz
   p8Xz3sv4RSWMtE6v533Ce7xhzpduW67vb1z0dpe/ECiYulK7bpknywfhS
   whfHm/B0ZxlQn0HBhD0KVtjvivrw+Rf6xZJ9YeLsMBq7ySn/+o0bNiBAf
   HpjZySXk4rljeYuWsQIwVmzDdYaVlIDlBb31DWk+UnbwTeEZroLBpOhp2
   A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; 
   d="scan'208";a="219135005"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 11:22:11 +0800
IronPort-SDR: qPn7zi81CVOat9A4J13z8DCf/Xi/et1FT5RtqBIKH3846aLxezAyHoykJFsdbaS0sU3UdH0Ymx
 dkLN4/V5RdfDuF9jEPdAVyYm14MOt/DmixPxblTDRVdmjJcbpoGhICFMw4wseTI8e47CJju8zu
 HxxKmE7OT5JhJDmp09M45rFmnr19pxZ/xTU1VHt4P9JMmIxDnKZrvVu7hZNaCUURbj0O2btrGM
 IBQ/WV322H2TyfcdLZ7Wk+QCFmvvKh9HiZhHgC03LNuKLrmasH3+s1UQSTFvyCdOVByoetSzMb
 jbmOscvICvSSd42qSNu4JDf3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 19:41:44 -0700
IronPort-SDR: sxaP4HpHWXnqnZQBde+bl7fN6nWL5AKnrx/VN6OkePX1D4Fp3PIa0n17snVO7ZyTzELmuv8AiX
 leN7BnGmsBpOEXkuzy5ypLAn4G3dDAzKBwoOvcL4UOSriDlIlz2FDQ1FWqNLbPy4pjUycdLzo9
 AvRZWQMns9gLRtNzZy4TlRGTUvdWnRly5ZsxRDyqnTX2hH8JNxECYYS4Lx+3uosU+RMELxSfIF
 qui4fTSYYr9KQfVjmqjI6HKmul8rFV+ASu/h+SyF2vlZb5rMCHuZG7I9LbjnmsSyMzUKqrmsYC
 Klc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 20:22:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrMjv05rwz1RwvT
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1665976930; x=1668568931; bh=JyUFxOvPYH/k0WxEU3
        ZawwvhoXKhUga9w0a/EIhr1go=; b=WjlQiBdui+TY48sfLGw+1VckJjeCfXyJIl
        TTXweBVIJ0Z+xgP444rNjTwdVF5SYWxVm9GYbeI4NLhHSCyovLKPh8wXs2bJDvqr
        a3IVz38vSGP7z2OZyvzHoIfo8WItAK5WP40xgDXvPEOxlFH8a5Gap+ifL6k37VMN
        /i0//Y8AyfPuMTWJapL3yJL2zSY8RGa49+OKmJUcTwOcs9NvYoAWOlC6h2I6ee5G
        FB6cP0/KhT6H3NadpliRKCac8/Sf8EKQxQUgujPTySZJUqEpBeKVzBpQx53Sfd2/
        ivqoM2gTuYCbKcGshG6WTrxp5QiBizh3XRx3epNYD+fYY/naAbgA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XP0RyTZsrhPc for <linux-renesas-soc@vger.kernel.org>;
        Sun, 16 Oct 2022 20:22:10 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrMjr6sMvz1RvTp;
        Sun, 16 Oct 2022 20:22:08 -0700 (PDT)
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
Subject: [PATCH 1/6] ata: ahci_st: Fix compilation warning
Date:   Mon, 17 Oct 2022 12:22:00 +0900
Message-Id: <20221017032205.2210188-2-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
References: <20221017032205.2210188-1-damien.lemoal@opensource.wdc.com>
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

If CONFIG_OF is disabled and the ahci_st driver is builtin (or
CONFIG_MODULES is disabled), then using the macro of_match_ptr()
results in the st_ahci_match variable being unused, which generates a
compilation warning and a compilation error if CONFIG_WERROR is enabled.

Fix this by directly assigning st_ahci_match to .of_match_table in the
st_ahci_driver platform driver definition.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/ahci_st.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
index 5a2cac60a29a..8607b68eee53 100644
--- a/drivers/ata/ahci_st.c
+++ b/drivers/ata/ahci_st.c
@@ -236,7 +236,7 @@ static struct platform_driver st_ahci_driver =3D {
 	.driver =3D {
 		.name =3D DRV_NAME,
 		.pm =3D &st_ahci_pm_ops,
-		.of_match_table =3D of_match_ptr(st_ahci_match),
+		.of_match_table =3D st_ahci_match,
 	},
 	.probe =3D st_ahci_probe,
 	.remove =3D ata_platform_remove_one,
--=20
2.37.3


Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43C036005B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 05:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbiJQDWX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Oct 2022 23:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiJQDWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 23:22:16 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C9B4DB0D
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665976935; x=1697512935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P/VGei3mXd338tEnTEiU0+WWo95l65D0cCUal/7BcvY=;
  b=GhTgrWY3mFBFLuQnP1kkf5yRJaem5vpHiCFOo+AqoFkvoC2zzlX6uYbh
   drQSOz0XqrY9rKZOwAfluuB+e/1m6fLi+RiU4mPV7JMk00TfPnIw2VKzL
   3YyOAJUQayOpyRkNWNwTZcKA7YP34XAlgRu3eex93MhaDY1CvuOzPkTUT
   qKcLSbl+VRfL+V6Vnv77xsRj1ureh7OEcw5Qy4vxVfwQovd+P8SvSfR+c
   GacZIno2p7x2o28M64j7d8MXvVInyEyzdNTnb483OiWnftCP2w92AdIge
   sJkw/2rdWOFpO1C7lWPyEOsglOtLYkMDLKMsAzCn2hImA8oTZ+ExeS16l
   w==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; 
   d="scan'208";a="219135016"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 11:22:14 +0800
IronPort-SDR: VRakQPEDzmnOp1ekgRZ+aMh0ykGNL29n4QwapaznkYp+P/yomWHLsrmKSQtDbHZBteEoiI4YlE
 VsJHs/Szg9kJzdia8sYWIkU6uy8rWf8/tz9u6PqWIomjhf26x92wnoSV2FTRLYuUDPoWK4t5N9
 daJoIA9N5G2jBUhJ1FHpvHwPHip3RLq4YszR4knGcBO3JjpNhNRtocew52ixRTw2agUqrRHuUQ
 2PqI9hIuAedtflvaYJeIQCB0PqCrjN3OfsGnFdMJN5oC/DdcxgyUOPOM7+rhs8pP3aWoXkkWT7
 jR3tN8oEPKwBd3AtlsTYe5UM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 19:41:47 -0700
IronPort-SDR: PSXj9GhUrdXCZ8fDky1SdLz1uxUZCXgzwHbiZDB570E29axXZaMLfFMldRXwOaYclq/AaGrNy3
 mRQDDJVRA28AsJw589Ryz0QlL1erbA0OfN0n0YowSszfOzmuYVa27snOlwKuaYQOIHlTfHPzzu
 /k8aLh01XO3C50G7mxTFkv/T1aw8uGiEHwu7zgVjFW9CVBZ2JFewPFWDA6H88wn/HkUq329+OI
 hw7CEFhA50xK6qq4dONs/vlhilRgJkqNEFvhhFRd8P6s+NpPSVHIrGsLa4AOR1Fqu6hUWR2cQV
 mmA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 20:22:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrMjy1pPmz1RwtC
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:14 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1665976933; x=1668568934; bh=P/VGei3mXd338tEnTE
        iU0+WWo95l65D0cCUal/7BcvY=; b=iE3onShvPCfj/siEPXRQhrUS73RvlWqKoa
        sA/qAc/XmhHk0gw8di+mBTOxngD9CxgjSn7qhuVP9kSsXtbEHQmQMQKIv9zVD2su
        Et9CM3/roeD07CSf5kIcoMUH64kbtPlvb5aDjAS6m1XxR6JSPtdLqKtvncWA+QsG
        e5FHg6+akc8hsFv4oxeGqtWXU1DoNW4/rYxGwCDh7D39qb7Gy4AUvR+J1tqqsWDE
        SWsTa4wr3OwbpjI6g6TMBHEfADYY+q9FjJ5y5nzyLMS7GCwVp7/tf++61ou47Qgh
        M/XzgzULfo9dFfbU92yX9WD198Ny9sDc3s9pdRXCZYvbqF8Z3apg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id yIqAftFo383A for <linux-renesas-soc@vger.kernel.org>;
        Sun, 16 Oct 2022 20:22:13 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrMjw2TCXz1RvTp;
        Sun, 16 Oct 2022 20:22:12 -0700 (PDT)
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
Subject: [PATCH 3/6] ata: ahci_brcm: Fix compilation warning
Date:   Mon, 17 Oct 2022 12:22:02 +0900
Message-Id: <20221017032205.2210188-4-damien.lemoal@opensource.wdc.com>
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

When compiling with clang and W=3D1, the following warning is generated:

drivers/ata/ahci_brcm.c:451:18: error: cast to smaller integer type
'enum brcm_ahci_version' from 'const void *'
[-Werror,-Wvoid-pointer-to-enum-cast]
        priv->version =3D (enum brcm_ahci_version)of_id->data;
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by using a cast to unsigned long to match the "void *" type
size of of_id->data.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/ahci_brcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index f61795c546cf..6f216eb25610 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -448,7 +448,7 @@ static int brcm_ahci_probe(struct platform_device *pd=
ev)
 	if (!of_id)
 		return -ENODEV;
=20
-	priv->version =3D (enum brcm_ahci_version)of_id->data;
+	priv->version =3D (unsigned long)of_id->data;
 	priv->dev =3D dev;
=20
 	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "top-ctrl");
--=20
2.37.3


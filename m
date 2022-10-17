Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BCC6005B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 05:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbiJQDWT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Oct 2022 23:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbiJQDWO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Oct 2022 23:22:14 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C6C4DB05
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1665976933; x=1697512933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qb90FWiWJqsBiM+rnnLq+ou+II9tNJdbJqeHntpNBfE=;
  b=q3uMJnMuUMPDCnNYfmFfyiFcGP2+knDr34832onjhlnFAp4cpiF+tOAw
   XeN6FooYUBPol2IsX9EdinBUFXWbcDtoOSvMMaSqHhfTxXGYQ7KNESqn+
   WL9+OiRy3ngGgmvKsk0RxiGNYo9avwbDTjCOSwYkBaLtRibZo68ZcH9Jk
   r287Dm+XkiqiecUmpjXosWYlTmwTB3/aQ5aXmvKldgqPbwINntw2eylX6
   sY96QAVuPDYIB4WKUKf+eMHekbVA5xUBmKKufcG6eKCMLvU0NYwQtyvqP
   JD701ZzCHSTjM/Ppde5Xvd6/dQKO+Bn54jEq/M0LbPEHjvr9hHqg0zhLh
   A==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661788800"; 
   d="scan'208";a="219135010"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 17 Oct 2022 11:22:13 +0800
IronPort-SDR: oDfHQDHZy5Y0dOH9Ux5TljU9BEytxKCYs8E/1Fjb9HoZF/YW4dDZvTkBNcSqVpIDbqIEj25jjr
 L5SI398n5qPUwk3H/iQ3/aekm5YY5h7T6MESCk2hnwUnU7OYD6u8VMMUlOiHLyxc9i1BUjEDxS
 OInP5yjEVvH2+ka+piAcB8zfa6RW4hMbxy4dF/NwfGS4EtNwnwROZpme8xyPfBM1x0aIBqazn5
 vRnTt83miYRUNtNstwiLvYyKvQFjUkeMNBPP2z4h/ErdoXK21Uk2UmEesN6wXbQi6k760B0wpk
 TOi8xaLRNbn2nhPrLqfpl82d
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 19:41:45 -0700
IronPort-SDR: iSk/UlNquNyfrBs6zKHu5KJ4HtGpQEIQ2WdU7XjL6clRueT6QZXEuUyAMovA7336SUJjF6C6Jr
 01dTG8w9EDK7ef9eybkiEfkQbxQLpf+ZQPfesRpKxxLTqcbvn58wphtzLJnJrYnw7RSAithS+j
 AKPAkulcReqDN3GykyyPzVQl134TK9ckiBi6Fchd8Cp57wj+eLiZ2ppapBWriEoD5W/5JqnG8M
 /14KJjI8HmqI0P0rdMDCKMTkTDoWHaJZU4+yRN+46ZtZAwb+uDBgwEfLwTf9hSxLiBQpyiZQUu
 mbY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Oct 2022 20:22:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MrMjw4YtXz1RwvL
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Oct 2022 20:22:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1665976931; x=1668568932; bh=qb90FWiWJqsBiM+rnn
        Lq+ou+II9tNJdbJqeHntpNBfE=; b=pX4hETffpYuWnSM4cUy/mzy/YSWqKPaMN+
        Y8s1HK5NKXdW5umftot/90hQibIvG85C/s5zeJYjEkqfDnKJ++WZg0LVqQE8MNK0
        e0rF8aJ0Lfrw0lyfXjkxBcWQvdEg4CLF/b5QCFOH8RJkxAeVxRCg3sWyb8XnfTBj
        qx1Fr2nb5hBXdJ9c6NHU+nSaLg0sx9SUF9iT+qIUIK6wF2zB3luaRbvhc1/0QSW3
        NRGNvl/hSFfynEbO+3JbxNejaNgbjU4ef6rS8x1LFHGHjhQ8OFGvVsa4UICJTc/5
        HeGnQUtTb0Ux9RO0fosA1zThLypoNZvUP8GvViAWgUgLm1y5i2bA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id gLlNEfXRIJzs for <linux-renesas-soc@vger.kernel.org>;
        Sun, 16 Oct 2022 20:22:11 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MrMjt4jtnz1RvLy;
        Sun, 16 Oct 2022 20:22:10 -0700 (PDT)
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
Subject: [PATCH 2/6] ata: sata_rcar: Fix compilation warning
Date:   Mon, 17 Oct 2022 12:22:01 +0900
Message-Id: <20221017032205.2210188-3-damien.lemoal@opensource.wdc.com>
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

drivers/ata/sata_rcar.c:878:15: error: cast to smaller integer type
'enum sata_rcar_type' from 'const void *'
[-Werror,-Wvoid-pointer-to-enum-cast]
        priv->type =3D (enum sata_rcar_type)of_device_get_match_data(dev)=
;
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by using a cast to unsigned long to match the "void *" type
size returned by of_device_get_match_data().

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/sata_rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 590ebea99601..0195eb29f6c2 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -875,7 +875,7 @@ static int sata_rcar_probe(struct platform_device *pd=
ev)
 	if (!priv)
 		return -ENOMEM;
=20
-	priv->type =3D (enum sata_rcar_type)of_device_get_match_data(dev);
+	priv->type =3D (unsigned long)of_device_get_match_data(dev);
=20
 	pm_runtime_enable(dev);
 	ret =3D pm_runtime_get_sync(dev);
--=20
2.37.3


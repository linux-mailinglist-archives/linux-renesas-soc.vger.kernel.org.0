Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456FE500546
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 06:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiDNFCQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Apr 2022 01:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbiDNFCP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Apr 2022 01:02:15 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A13C1D0FC
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 21:59:51 -0700 (PDT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220414045945epoutp01adb0919b532d7ed75ada7785f02e62ab~lqpLF0tmM0676206762epoutp01m
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Apr 2022 04:59:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220414045945epoutp01adb0919b532d7ed75ada7785f02e62ab~lqpLF0tmM0676206762epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1649912385;
        bh=Jbr5q2RUxoKqLFIrxhfdE9bFbtgHMrjASBFDP9c8jLY=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=SM9Zmkzw8r11OjmPJ6sSGBbZnOsUE1qBc2pZ5CD3VpZKIK7m4jF1z8EeXl7di+KMZ
         0xe6fHhPeTy8YNm71DhB/2fziyzOEW7PH66aNX4o4FVlRRtnBi5keBaA1hlzKEwXIj
         EzgCOHIXcb6DB+yfv4bODSNbDzC3q7ltgVn8tOUg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20220414045945epcas5p461fcfa8b41be3afc54e35758b1a4f8d5~lqpKi8YG61614416144epcas5p4Y;
        Thu, 14 Apr 2022 04:59:45 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.182]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Kf6h83d5Sz4x9QJ; Thu, 14 Apr
        2022 04:59:36 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        25.21.06423.43AA7526; Thu, 14 Apr 2022 13:59:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20220414045932epcas5p34468a15fc1c155703f81f3cdb953bb8b~lqo_MItNd0093500935epcas5p3T;
        Thu, 14 Apr 2022 04:59:32 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220414045931epsmtrp1468eb6985fc5a9d5ee3a0a24a4ca81fb~lqo_LQnUT1523915239epsmtrp1Q;
        Thu, 14 Apr 2022 04:59:31 +0000 (GMT)
X-AuditID: b6c32a49-b01ff70000001917-40-6257aa345672
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        BC.0D.03370.33AA7526; Thu, 14 Apr 2022 13:59:31 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220414045928epsmtip1207991b093c77e905977fe80f40baba8~lqo6hqx8-2665626656epsmtip1q;
        Thu, 14 Apr 2022 04:59:27 +0000 (GMT)
From:   "Alim Akhtar" <alim.akhtar@samsung.com>
To:     "'Yoshihiro Shimoda'" <yoshihiro.shimoda.uh@renesas.com>,
        <avri.altman@wdc.com>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
Cc:     <jejb@linux.ibm.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
In-Reply-To: <20220414023115.4190736-5-yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
 UFS controller
Date:   Thu, 14 Apr 2022 10:29:26 +0530
Message-ID: <011701d84fbc$6d8617a0$489246e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJgyUvTt2wt3n6u+7RAigaFBxWiKAJQnDLOAivysaGruf/z0A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNJsWRmVeSWpSXmKPExsWy7bCmpq7pqvAkg45GRouXP6+yWcw/co7V
        YtGNbUwWL2fdY7PY+vIdk0X39R1sFsuP/2OyaN17hN3i697PbA6cHptWdbJ5TFh0gNHj49Nb
        LB7fzkxk8fi8Sc6j/UA3UwBbVLZNRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJC
        XmJuqq2Si0+ArltmDtBVSgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwCkwK94sTc
        4tK8dL281BIrQwMDI1OgwoTsjOkvrzAXPKqp6Dl3kLGBcWlmFyMnh4SAicTdg9OYuhi5OIQE
        djNK/Oxvh3I+MUq8WHicHcL5zCjx5vhbRpiWbSdPM0MkdjFKHG05wwbhvGSUeDt1ClgVm4Cu
        xI7FbWAJEYFGRokPk6aDtTALzAbasukiE0gVp4CHROfmLWAdwgKxEjN2vGADsVkEVCVet/Yz
        g9i8ApYSp5f1s0PYghInZz5hAbGZBeQltr+dwwxxk4LEz6fLWEFsEQEnid8bu9ghasQlXh49
        AvaEhMAODommbV9YIRpcJPZ/ucMGYQtLvDq+hR3ClpJ42d8GZHMA2R4Si/5IQYQzJN4uXw/1
        v73EgStzWEBKmAU0Jdbv0odYxSfR+/sJE0Qnr0RHmxBEtapE87urLBC2tMTE7m6oA4CGt/9j
        m8CoOAvJY7OQPDYLyQOzEJYtYGRZxSiZWlCcm55abFpgmJdaDo/x5PzcTYzgVKvluYPx7oMP
        eocYmTgYDzFKcDArifDe7A9PEuJNSaysSi3Kjy8qzUktPsRoCgzticxSosn5wGSfVxJvaGJp
        YGJmZmZiaWxmqCTOezp9Q6KQQHpiSWp2ampBahFMHxMHp1QD04q3toI8kt/M1BqKUuOr9FWe
        vc+45id5IXvLO6kdxxZNbrdcwC0tceX6+Y2B17c69T+qEY+e/vf8TO5TG/Vqk8Q9b198l+/A
        37DmEXPOBRanQy1Ju6UcLW7YqnSeCty3X9KkOL1RelPjzqKIK8c8w3tNvX99YfR1mLwsda+6
        9X+Gw1ILZZuVb+86osrSsj3UcoP36vCjwi6fv82dfPaZUuIaLtcSo1lnqnmu6dkZMyXJ1XRZ
        Xnj6bm+OyGH2/fUX/t7U7lCwWJt4R/jpncKcLdwLmzd97+b2VJJRCNvBPYmB6XGh/nXVdSse
        HLi9oin6q2NlznfnrrP9DuemGfA/7PkYlLs5QmPGMvsJ8YcOKLEUZyQaajEXFScCACjGqmU+
        BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSnK7xqvAkg8b/phYvf15ls5h/5Byr
        xaIb25gsXs66x2ax9eU7Jovu6zvYLJYf/8dk0br3CLvF172f2Rw4PTat6mTzmLDoAKPHx6e3
        WDy+nZnI4vF5k5xH+4FupgC2KC6blNSczLLUIn27BK6M6S+vMBc8qqnoOXeQsYFxaWYXIyeH
        hICJxLaTp5m7GLk4hAR2MEocevecCSIhLXF94wR2CFtYYuW/5+wQRc8ZJXadusoCkmAT0JXY
        sbiNDSQhItDKKNH8ZgYjiMMsMJ9RYsuuR4wQLVcZJQ6f6wGbxSngIdG5eQsjiC0sEC1xrfkE
        2D4WAVWJ1639zCA2r4ClxOll/ewQtqDEyZlPgNZxAE3Vk2jbCNbKLCAvsf3tHGaI8xQkfj5d
        xgpiiwg4Sfze2MUOUSMu8fLoEfYJjMKzkEyahTBpFpJJs5B0LGBkWcUomVpQnJueW2xYYJSX
        Wq5XnJhbXJqXrpecn7uJERxvWlo7GPes+qB3iJGJg/EQowQHs5II783+8CQh3pTEyqrUovz4
        otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamOqte/jMXH9VqvAksAs8LtOM
        f/lconHBkU+BR/93vN6ueHbdts/LlBZx3RaRvq5euZa1WNhH//ca79KK5LPP9tqqrfhvmyKu
        vvvSt2URU4O3PqoWPjb3LXPeNfNT0o62H95/YVPkaYnQz012M2TTWHLN4ZKjseJT7hvzF/nW
        L34hm5LLvLbQvT78ckzBVy9p5dTFq3S+v+Ld28xbfdj0ncbDxwmnLF+/OLLv49n3U88JfZad
        sf+q27Y3myzPvmY7t7vQ/PteviuXlZX5uZj7fxx5Y9rcuOjN5GTRyXoTpyxsXpChsdhtefDi
        g7oFK9zMIsy25TNdnO/3Ldo+0PrbfNG+O74vmmxNu+8+qo6walNiKc5INNRiLipOBACaxqIJ
        JgMAAA==
X-CMS-MailID: 20220414045932epcas5p34468a15fc1c155703f81f3cdb953bb8b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220414023154epcas5p1433638c52ed3d976882d25a86b9c6182
References: <20220414023115.4190736-1-yoshihiro.shimoda.uh@renesas.com>
        <CGME20220414023154epcas5p1433638c52ed3d976882d25a86b9c6182@epcas5p1.samsung.com>
        <20220414023115.4190736-5-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yoshihiro

>-----Original Message-----
>From: Yoshihiro Shimoda [mailto:yoshihiro.shimoda.uh@renesas.com]
>Sent: Thursday, April 14, 2022 8:01 AM
>To: alim.akhtar@samsung.com; avri.altman@wdc.com; robh+dt@kernel.org;
>krzk+dt@kernel.org
>Cc: jejb@linux.ibm.com; martin.petersen@oracle.com; linux-
>scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-renesas-
>soc@vger.kernel.org; Yoshihiro Shimoda
><yoshihiro.shimoda.uh@renesas.com>
>Subject: [PATCH v2 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
UFS
>controller
>
>Add support for Renesas R-Car UFS controller which needs vender specific
>initialization.
>
>Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>---
> drivers/scsi/ufs/Kconfig       |  12 +
> drivers/scsi/ufs/Makefile      |   1 +
> drivers/scsi/ufs/ufs-renesas.c | 418
>+++++++++++++++++++++++++++++++++
> 3 files changed, 431 insertions(+)
> create mode 100644 drivers/scsi/ufs/ufs-renesas.c
>
>diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig index
>9fe27b01904e..7e7ec1b26537 100644
>--- a/drivers/scsi/ufs/Kconfig
>+++ b/drivers/scsi/ufs/Kconfig
>@@ -136,6 +136,18 @@ config SCSI_UFS_HISI
> 	  Select this if you have UFS controller on Hisilicon chipset.
> 	  If unsure, say N.
>
>+config SCSI_UFS_RENESAS
>+	tristate "Renesas specific hooks to UFS controller platform driver"
>+	depends on (ARCH_RENESAS || COMPILE_TEST) &&
>SCSI_UFSHCD_PLATFORM
>+	help
>+	  This selects the Renesas specific additions to UFSHCD platform
driver.
>+	  UFS host on Renesas needs some vendor specific configuration
>before
>+	  accessing the hardware.
>+
>+	  Select this if you have UFS controller on Renesas chipset.
>+
>+	  If unsure, say N.
>+
> config SCSI_UFS_TI_J721E
> 	tristate "TI glue layer for Cadence UFS Controller"
> 	depends on OF && HAS_IOMEM && (ARCH_K3 || COMPILE_TEST) diff
>--git a/drivers/scsi/ufs/Makefile b/drivers/scsi/ufs/Makefile index
>966048875b50..b7e4a739ea44 100644
>--- a/drivers/scsi/ufs/Makefile
>+++ b/drivers/scsi/ufs/Makefile
>@@ -23,4 +23,5 @@ obj-$(CONFIG_SCSI_UFSHCD_PCI) += ufshcd-pci.o
> obj-$(CONFIG_SCSI_UFSHCD_PLATFORM) += ufshcd-pltfrm.o
> obj-$(CONFIG_SCSI_UFS_HISI) += ufs-hisi.o
> obj-$(CONFIG_SCSI_UFS_MEDIATEK) += ufs-mediatek.o
>+obj-$(CONFIG_SCSI_UFS_RENESAS) += ufs-renesas.o
> obj-$(CONFIG_SCSI_UFS_TI_J721E) += ti-j721e-ufs.o diff --git
>a/drivers/scsi/ufs/ufs-renesas.c b/drivers/scsi/ufs/ufs-renesas.c new file
>mode 100644 index 000000000000..5fb2484ead64
>--- /dev/null
>+++ b/drivers/scsi/ufs/ufs-renesas.c
>@@ -0,0 +1,418 @@
>+// SPDX-License-Identifier: GPL-2.0 OR MIT
>+/*
>+ * Renesas UFS host controller driver
>+ *
>+ * Copyright (C) 2022 Renesas Electronics Corporation  */
>+
>+#include <linux/clk.h>
>+#include <linux/delay.h>
>+#include <linux/err.h>
>+#include <linux/iopoll.h>
>+#include <linux/kernel.h>
>+#include <linux/module.h>
>+#include <linux/of.h>
>+#include <linux/of_device.h>
>+#include <linux/pm_runtime.h>
>+
>+#include "ufshcd.h"
>+#include "ufshcd-pltfrm.h"
>+
>+struct ufs_renesas_priv {
>+	bool initialized;	/* The hardware needs initialization once */
>+};
>+
>+enum {
>+	SET_PHY_INDEX_LO = 0,
>+	SET_PHY_INDEX_HI,
>+	TIMER_INDEX,
>+	MAX_INDEX
>+};
>+
>+enum ufs_renesas_init_param_mode {
>+	MODE_RESTORE,
>+	MODE_SET,
>+	MODE_SAVE,
>+	MODE_POLL,
>+	MODE_WAIT,
>+	MODE_WRITE,
>+};
>+
>+#define PARAM_RESTORE(_reg, _index) \
>+		{ .mode = MODE_RESTORE, .reg = _reg, .index = _index }
>#define
>+PARAM_SET(_index, _set) \
>+		{ .mode = MODE_SET, .index = _index, .u.set = _set } #define
>+PARAM_SAVE(_reg, _mask, _index) \
>+		{ .mode = MODE_SAVE, .reg = _reg, .mask = (u32)(_mask), \
>+		  .index = _index }
>+#define PARAM_POLL(_reg, _expected, _mask) \
>+		{ .mode = MODE_POLL, .reg = _reg, .u.expected = _expected,
>\
>+		  .mask = (u32)(_mask) }
>+#define PARAM_WAIT(_delay_us) \
>+		{ .mode = MODE_WAIT, .u.delay_us = _delay_us }
>+
>+#define PARAM_WRITE(_reg, _val) \
>+		{ .mode = MODE_WRITE, .reg = _reg, .u.val = _val }
>+
>+#define PARAM_WRITE_D0_D4(_d0, _d4) \
>+		PARAM_WRITE(0xd0, _d0),	PARAM_WRITE(0xd4, _d4)
>+
>+#define PARAM_WRITE_800_80C_POLL(_addr, _data_800)		\
>+		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
>+		PARAM_WRITE_D0_D4(0x00000800, ((_data_800) << 16) |
>BIT(8) | (_addr)), \
>+		PARAM_WRITE(0xd0, 0x0000080c),			\
>+		PARAM_POLL(0xd4, BIT(8), BIT(8))
>+
>+#define PARAM_RESTORE_800_80C_POLL(_index)			\
>+		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
>+		PARAM_WRITE(0xd0, 0x00000800),			\
>+		PARAM_RESTORE(0xd4, _index),			\
>+		PARAM_WRITE(0xd0, 0x0000080c),			\
>+		PARAM_POLL(0xd4, BIT(8), BIT(8))
>+
>+#define PARAM_WRITE_804_80C_POLL(_addr, _data_804)		\
>+		PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),	\
>+		PARAM_WRITE_D0_D4(0x00000804, ((_data_804) << 16) |
>BIT(8) | (_addr)), \
>+		PARAM_WRITE(0xd0, 0x0000080c),			\
>+		PARAM_POLL(0xd4, BIT(8), BIT(8))
>+
>+#define PARAM_WRITE_828_82C_POLL(_data_828)			\
>+		PARAM_WRITE_D0_D4(0x0000082c, 0x0f000000),	\
>+		PARAM_WRITE_D0_D4(0x00000828, _data_828),	\
>+		PARAM_WRITE(0xd0, 0x0000082c),			\
>+		PARAM_POLL(0xd4, _data_828, _data_828)
>+
>+#define PARAM_WRITE_PHY(_addr16, _data16)			\
>+		PARAM_WRITE(0xf0, 1),				\
>+		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
>+		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff),
>\
>+		PARAM_WRITE_800_80C_POLL(0x18, (_data16) & 0xff), \
>+		PARAM_WRITE_800_80C_POLL(0x19, ((_data16) >> 8) & 0xff),
>\
>+		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
>+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
>+		PARAM_WRITE(0xf0, 0)
>+
>+#define PARAM_SET_PHY(_addr16, _data16)				\
>+		PARAM_WRITE(0xf0, 1),				\
>+		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
>+		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff),
>\
>+		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
>+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
>+		PARAM_WRITE_804_80C_POLL(0x1a, 0),		\
>+		PARAM_WRITE(0xd0, 0x00000808),			\
>+		PARAM_SAVE(0xd4, 0xff, SET_PHY_INDEX_LO),	\
>+		PARAM_WRITE_804_80C_POLL(0x1b, 0),		\
>+		PARAM_WRITE(0xd0, 0x00000808),			\
>+		PARAM_SAVE(0xd4, 0xff, SET_PHY_INDEX_HI),	\
>+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
>+		PARAM_WRITE(0xf0, 0),				\
>+		PARAM_WRITE(0xf0, 1),				\
>+		PARAM_WRITE_800_80C_POLL(0x16, (_addr16) & 0xff), \
>+		PARAM_WRITE_800_80C_POLL(0x17, ((_addr16) >> 8) & 0xff),
>\
>+		PARAM_SET(SET_PHY_INDEX_LO, ((_data16 & 0xff) << 16) |
>BIT(8) | 0x18), \
>+		PARAM_RESTORE_800_80C_POLL(SET_PHY_INDEX_LO),
>	\
>+		PARAM_SET(SET_PHY_INDEX_HI, (((_data16 >> 8) & 0xff) <<
>16) | BIT(8) | 0x19), \
>+		PARAM_RESTORE_800_80C_POLL(SET_PHY_INDEX_HI),
>	\
>+		PARAM_WRITE_800_80C_POLL(0x1c, 0x01),		\
>+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
>+		PARAM_WRITE(0xf0, 0)
>+
>+#define PARAM_INDIRECT_WRITE(_gpio, _addr, _data_800)		\
>+		PARAM_WRITE(0xf0, _gpio),			\
>+		PARAM_WRITE_800_80C_POLL(_addr, _data_800),	\
>+		PARAM_WRITE_828_82C_POLL(0x0f000000),		\
>+		PARAM_WRITE(0xf0, 0)
>+
>+#define PARAM_INDIRECT_POLL(_gpio, _addr, _expected, _mask)	\
>+		PARAM_WRITE(0xf0, _gpio),			\
>+		PARAM_WRITE_800_80C_POLL(_addr, 0),		\
>+		PARAM_WRITE(0xd0, 0x00000808),			\
>+		PARAM_POLL(0xd4, _expected, _mask),		\
>+		PARAM_WRITE(0xf0, 0)
>+

These above macro gives lot of checkpatch error, please fix the same.

>+struct ufs_renesas_init_param {
>+	enum ufs_renesas_init_param_mode mode;
>+	u32 reg;
>+	union {
>+		u32 expected;
>+		u32 delay_us;
>+		u32 set;
>+		u32 val;
>+	} u;
>+	u32 mask;
>+	u32 index;
>+};
>+
>+/* This setting is for SERIES B */
>+static const struct ufs_renesas_init_param ufs_param[] = {
>+	PARAM_WRITE(0xc0, 0x49425308),
>+	PARAM_WRITE_D0_D4(0x00000104, 0x00000002),
>+	PARAM_WAIT(1),
>+	PARAM_WRITE_D0_D4(0x00000828, 0x00000200),
>+	PARAM_WAIT(1),
>+	PARAM_WRITE_D0_D4(0x00000828, 0x00000000),
>+	PARAM_WRITE_D0_D4(0x00000104, 0x00000001),
>+	PARAM_WRITE_D0_D4(0x00000940, 0x00000001),
>+	PARAM_WAIT(1),
>+	PARAM_WRITE_D0_D4(0x00000940, 0x00000000),
>+
>+	PARAM_WRITE(0xc0, 0x49425308),
>+	PARAM_WRITE(0xc0, 0x41584901),
>+
>+	PARAM_WRITE_D0_D4(0x0000080c, 0x00000100),
>+	PARAM_WRITE_D0_D4(0x00000804, 0x00000000),
>+	PARAM_WRITE(0xd0, 0x0000080c),
>+	PARAM_POLL(0xd4, BIT(8), BIT(8)),
>+
>+	PARAM_WRITE(REG_CONTROLLER_ENABLE, 0x00000001),
>+
>+	PARAM_WRITE(0xd0, 0x00000804),
>+	PARAM_POLL(0xd4, BIT(8) | BIT(6) | BIT(0), BIT(8) | BIT(6) |
BIT(0)),
>+
>+	PARAM_WRITE(0xd0, 0x00000d00),
>+	PARAM_SAVE(0xd4, 0x0000ffff, TIMER_INDEX),
>+	PARAM_WRITE(0xd4, 0x00000000),
>+	PARAM_WRITE_D0_D4(0x0000082c, 0x0f000000),
>+	PARAM_WRITE_D0_D4(0x00000828, 0x08000000),
>+	PARAM_WRITE(0xd0, 0x0000082c),
>+	PARAM_POLL(0xd4, BIT(27), BIT(27)),
>+	PARAM_WRITE(0xd0, 0x00000d2c),
>+	PARAM_POLL(0xd4, BIT(0), BIT(0)),
>+
>+	/* phy setup */
>+	PARAM_INDIRECT_WRITE(1, 0x01, 0x001f),
>+	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0014),
>+	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0014),
>+	PARAM_INDIRECT_WRITE(7, 0x0d, 0x0003),
>+	PARAM_INDIRECT_WRITE(7, 0x0e, 0x0007),
>+	PARAM_INDIRECT_WRITE(7, 0x5f, 0x0003),
>+	PARAM_INDIRECT_WRITE(7, 0x60, 0x0003),
>+	PARAM_INDIRECT_WRITE(7, 0x5b, 0x00a6),
>+	PARAM_INDIRECT_WRITE(7, 0x5c, 0x0003),
>+
>+	PARAM_INDIRECT_POLL(7, 0x3c, 0, BIT(7)),
>+	PARAM_INDIRECT_POLL(7, 0x4c, 0, BIT(4)),
>+
>+	PARAM_INDIRECT_WRITE(1, 0x32, 0x0080),
>+	PARAM_INDIRECT_WRITE(1, 0x1f, 0x0001),
>+	PARAM_INDIRECT_WRITE(0, 0x2c, 0x0001),
>+	PARAM_INDIRECT_WRITE(0, 0x32, 0x0087),
>+
>+	PARAM_INDIRECT_WRITE(1, 0x4d, 0x0061),
>+	PARAM_INDIRECT_WRITE(4, 0x9b, 0x0009),
>+	PARAM_INDIRECT_WRITE(4, 0xa6, 0x0005),
>+	PARAM_INDIRECT_WRITE(4, 0xa5, 0x0058),
>+	PARAM_INDIRECT_WRITE(1, 0x39, 0x0027),
>+	PARAM_INDIRECT_WRITE(1, 0x47, 0x004c),
>+
>+	PARAM_INDIRECT_WRITE(7, 0x0d, 0x0002),
>+	PARAM_INDIRECT_WRITE(7, 0x0e, 0x0007),
>+
>+	PARAM_WRITE_PHY(0x0028, 0x0061),
>+	PARAM_WRITE_PHY(0x4014, 0x0061),
>+	PARAM_SET_PHY(0x401c, BIT(2)),
>+	PARAM_WRITE_PHY(0x4000, 0x0000),
>+	PARAM_WRITE_PHY(0x4001, 0x0000),
>+
>+	PARAM_WRITE_PHY(0x10ae, 0x0001),
>+	PARAM_WRITE_PHY(0x10ad, 0x0000),
>+	PARAM_WRITE_PHY(0x10af, 0x0001),
>+	PARAM_WRITE_PHY(0x10b6, 0x0001),
>+	PARAM_WRITE_PHY(0x10ae, 0x0000),
>+
>+	PARAM_WRITE_PHY(0x10ae, 0x0001),
>+	PARAM_WRITE_PHY(0x10ad, 0x0000),
>+	PARAM_WRITE_PHY(0x10af, 0x0002),
>+	PARAM_WRITE_PHY(0x10b6, 0x0001),
>+	PARAM_WRITE_PHY(0x10ae, 0x0000),
>+
>+	PARAM_WRITE_PHY(0x10ae, 0x0001),
>+	PARAM_WRITE_PHY(0x10ad, 0x0080),
>+	PARAM_WRITE_PHY(0x10af, 0x0000),
>+	PARAM_WRITE_PHY(0x10b6, 0x0001),
>+	PARAM_WRITE_PHY(0x10ae, 0x0000),
>+
>+	PARAM_WRITE_PHY(0x10ae, 0x0001),
>+	PARAM_WRITE_PHY(0x10ad, 0x0080),
>+	PARAM_WRITE_PHY(0x10af, 0x001a),
>+	PARAM_WRITE_PHY(0x10b6, 0x0001),
>+	PARAM_WRITE_PHY(0x10ae, 0x0000),
>+
>+	PARAM_INDIRECT_WRITE(7, 0x70, 0x0016),
>+	PARAM_INDIRECT_WRITE(7, 0x71, 0x0016),
>+	PARAM_INDIRECT_WRITE(7, 0x72, 0x0014),
>+	PARAM_INDIRECT_WRITE(7, 0x73, 0x0014),
>+	PARAM_INDIRECT_WRITE(7, 0x74, 0x0000),
>+	PARAM_INDIRECT_WRITE(7, 0x75, 0x0000),
>+	PARAM_INDIRECT_WRITE(7, 0x76, 0x0010),
>+	PARAM_INDIRECT_WRITE(7, 0x77, 0x0010),
>+	PARAM_INDIRECT_WRITE(7, 0x78, 0x00ff),
>+	PARAM_INDIRECT_WRITE(7, 0x79, 0x0000),
>+
>+	PARAM_INDIRECT_WRITE(7, 0x19, 0x0007),
>+
>+	PARAM_INDIRECT_WRITE(7, 0x1a, 0x0007),
>+
>+	PARAM_INDIRECT_WRITE(7, 0x24, 0x000c),
>+
>+	PARAM_INDIRECT_WRITE(7, 0x25, 0x000c),
>+
>+	PARAM_INDIRECT_WRITE(7, 0x62, 0x0000),
>+	PARAM_INDIRECT_WRITE(7, 0x63, 0x0000),
>+	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0014),
>+	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0017),
>+	PARAM_INDIRECT_WRITE(7, 0x5d, 0x0004),
>+	PARAM_INDIRECT_WRITE(7, 0x5e, 0x0017),
>+	PARAM_INDIRECT_POLL(7, 0x55, 0, BIT(6)),
>+	PARAM_INDIRECT_POLL(7, 0x41, 0, BIT(7)),
>+	/* end of phy setup */
>+
>+	PARAM_WRITE(0xf0, 0),
>+	PARAM_WRITE(0xd0, 0x00000d00),
>+	PARAM_RESTORE(0xd4, TIMER_INDEX),
>+};
>+
>+static void ufs_renesas_dbg_register_dump(struct ufs_hba *hba) {
>+	ufshcd_dump_regs(hba, 0xc0, 0x40, "regs: 0xc0 + "); }
>+
>+static void ufs_renesas_reg_control(struct ufs_hba *hba,
>+				    const struct ufs_renesas_init_param *p)
{
>+	static u32 save[MAX_INDEX];
>+	int ret;
>+	u32 val;
>+
>+	pr_debug("%s: %d %04x %08x, %08x, %d\n", __func__, p->mode, p-
>>reg,
>+		 p->u.val, p->mask, p->index);
>+
>+	BUG_ON(p->index >= MAX_INDEX);

Do you really need a BUG_ON here? May be a WARN_ON?

>+
>+	switch (p->mode) {
>+	case MODE_RESTORE:
>+		ufshcd_writel(hba, save[p->index], p->reg);
>+		break;
>+	case MODE_SET:
>+		pr_debug("%s: %d %x %x\n", __func__, p->index, save[p-
>>index],
>+			 p->u.set);
>+		save[p->index] |= p->u.set;
>+		break;
>+	case MODE_SAVE:
>+		save[p->index] = ufshcd_readl(hba, p->reg) & p->mask;
>+		pr_debug("%s: index = %d, val = %08x\n", __func__,
>+			 p->index, val);
>+		break;
>+	case MODE_POLL:
>+		ret = readl_poll_timeout_atomic(hba->mmio_base + p->reg,
>+						val,
>+						(val & p->mask) == p-
>>u.expected,
>+						10, 1000);
>+		if (ret)
>+			pr_err("%s: poll failed %d (%08x, %08x, %08x)\n",
>+			       __func__, ret, val, p->mask, p->u.expected);
>+		break;
>+	case MODE_WAIT:
>+		if (p->u.delay_us > 1000)
>+			mdelay(p->u.delay_us / 1000);
>+		else
>+			udelay(p->u.delay_us);
>+		break;
>+	case MODE_WRITE:
>+		ufshcd_writel(hba, p->u.val, p->reg);
>+		break;
>+	default:
>+		break;
>+	}
>+}
>+
>+static void ufs_renesas_pre_init(struct ufs_hba *hba) {
>+	const struct ufs_renesas_init_param *p = ufs_param;
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(ufs_param); i++)
>+		ufs_renesas_reg_control(hba, &p[i]);
>+}
>+
>+static int ufs_renesas_hce_enable_notify(struct ufs_hba *hba,
>+					 enum ufs_notify_change_status
>status) {
>+	struct ufs_renesas_priv *priv = ufshcd_get_variant(hba);
>+
>+	if (priv->initialized)
>+		return 0;
>+
>+	if (status == PRE_CHANGE)
>+		ufs_renesas_pre_init(hba);
>+
>+	priv->initialized = true;
>+
>+	return 0;
>+}
>+
>+static int ufs_renesas_setup_clocks(struct ufs_hba *hba, bool on,
>+				    enum ufs_notify_change_status status) {
>+	if (on && status == PRE_CHANGE)
>+		pm_runtime_get_sync(hba->dev);
>+	else if (!on && status == POST_CHANGE)
>+		pm_runtime_put(hba->dev);
>+
>+	return 0;
>+}
>+
>+static int ufs_renesas_init(struct ufs_hba *hba) {
>+	struct ufs_renesas_priv *priv;
>+
>+	priv = devm_kmalloc(hba->dev, sizeof(*priv), GFP_KERNEL);
>+	if (!priv)
>+		return -ENOMEM;
>+	ufshcd_set_variant(hba, priv);
>+
>+	hba->quirks |= UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS |
>+UFSHCD_QUIRK_HIBERN_FASTAUTO;
>+
>+	return 0;
>+}
>+
>+static const struct ufs_hba_variant_ops ufs_renesas_vops = {
>+	.name		= "renesas",
>+	.init		= ufs_renesas_init,
>+	.setup_clocks	= ufs_renesas_setup_clocks,
>+	.hce_enable_notify = ufs_renesas_hce_enable_notify,
>+	.dbg_register_dump = ufs_renesas_dbg_register_dump, };
>+
>+static const struct of_device_id __maybe_unused ufs_renesas_of_match[]
>= {
>+	{ .compatible = "renesas,r8a779f0-ufs" }, };
>MODULE_DEVICE_TABLE(of,
>+ufs_renesas_of_match);
>+
>+static int ufs_renesas_probe(struct platform_device *pdev) {
>+	return ufshcd_pltfrm_init(pdev, &ufs_renesas_vops); }
>+
>+static int ufs_renesas_remove(struct platform_device *pdev) {
>+	struct ufs_hba *hba = platform_get_drvdata(pdev);
>+
>+	ufshcd_remove(hba);
>+
>+	return 0;
>+}
>+
>+static struct platform_driver ufs_renesas_platform = {
>+	.probe	= ufs_renesas_probe,
>+	.remove	= ufs_renesas_remove,
>+	.driver	= {
>+		.name	= "ufshcd-renesas",
>+		.of_match_table	=
>of_match_ptr(ufs_renesas_of_match),
>+	},
>+};
>+module_platform_driver(ufs_renesas_platform);
>+
>+MODULE_AUTHOR("Yoshihiro Shimoda
><yoshihiro.shimoda.uh@renesas.com>");
>+MODULE_DESCRIPTION("Renesas UFS host controller driver");
>+MODULE_LICENSE("Dual MIT/GPL");
>--
>2.25.1



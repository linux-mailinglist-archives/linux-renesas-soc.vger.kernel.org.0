Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B1B45066E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 15:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbhKOOPz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 09:15:55 -0500
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:23680
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233591AbhKOOPZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 09:15:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz0eRds2k204yAjHAVaMO8fEBLzI8ieWHfD3d6vMLJfS8JmL/rBiGxGKy55IFZEhyZ2yEM+dkUfJj5dZp8MXZMxCmMd4MJU//PwUm3hlKvW5wklTxkFOFpywYQoRszG5hnZNiLQ9EDy3MN1W+LxLTDtDVilIlknP4Gip/3NggA2/E1j7SUmKMTHLCdl9IdauaS853vO4sszz6n8I/vPmacGswT3U9LBx5mq4BNBav0RlKKe4nHzqv5yFRYK5RYCmAKna/3z1H5p+Wg4Co6aQWu84jUd6Vor6FD13SGZWzYx2fVkXlbMmmc2g5Jk4EPjPAAxJs7z7BUdZB8ls5aFZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3todiJHm1IhCDZKf42L1K37xO4B8Bmq5tuzwOLLvZqY=;
 b=SsxWJrZ25/4ySpiNX/7VMDPElqdrHYJWLiY1sxGAsdy+FwWvByEh2D/KKNYqMIOqyxYo0gorQmqWxfjZfKNPMDkGQd31nF/6Qkxk5NCJsZwfD+veskvGxr2CUcWm35OeDOfqwL8YkrFNzc0TaVYzOuCbSllmA0c20O66WI0ZUW47w30BPxHU+GCuJhrPnKNcKTcesZOeF88rsGOqg3sYng/6m+Nm/ygVhrBgzTLxFqPMeAwdFDtCrBlkLEGoXXZom4yBaP463N3RIxUWHSsHtRAinXRV1vb2Odjy2GFoh9abgclNphQ44Osecs5n0DSlk8VaKmWnXPYYfpvM6w/qYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3todiJHm1IhCDZKf42L1K37xO4B8Bmq5tuzwOLLvZqY=;
 b=VKuWiwlkZAIl6O6BkcsltNeIp8KObiNmBv7hGxmCYFHRrwcJ8BUVhhW0OB4Izr69N5fDWw1MPVfyIjXCa+SsxRSj+CqYGslRtXppP5MUM9im/pC1VcLyHZTiJ+UaUY9c8+7moFJtuS1qlLmM5yZy3tHt7wTXpzVMFjDwhBoyQrk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB6327.jpnprd01.prod.outlook.com (2603:1096:604:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 14:12:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 14:12:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Julien Massot <julien.massot@iot.bzh>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
Thread-Topic: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
Thread-Index: AQHX2ifxeC/e9Bm+2E2JGBX7Ft2snawEoDGA
Date:   Mon, 15 Nov 2021 14:12:26 +0000
Message-ID: <OS0PR01MB5922D67AEFD75847CE5B0DD586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115135032.129227-1-julien.massot@iot.bzh>
 <20211115135032.129227-4-julien.massot@iot.bzh>
In-Reply-To: <20211115135032.129227-4-julien.massot@iot.bzh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9dcd623-a20f-4d28-0427-08d9a841f426
x-ms-traffictypediagnostic: OSZPR01MB6327:
x-microsoft-antispam-prvs: <OSZPR01MB632772BCC86B88A1FE7D502786989@OSZPR01MB6327.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IT/V+JWJoxa9Vhnw9clKx/FyLSuiMi5wBuCh+gnfl00PolDBwhHuNx8zPtTNEytYdeoRobYzq/LF6+UNw0zegy6Qzz1t+y3GJHpmyUdIYyRWKilUNTzJjTwiKPfk+tddD9L0DmtcSIqPKLZuWV7HHvit+RQLiPAsGpjvldx2kseJuPO8rNeaPXQatLkB8C6s8oTYA/UGjsFdDqBjfDVpzLaS7fvuEiIG7iKIq/uQg3AgGD4/iOYcrj6/AeVA0c8dHpiuzE4PZiTIsrWM7u8OMT4iydaYM0Mh2PCc8l6Tk1u7T0rQ/RiemzTptNwLtH2/443AZThhY/h2Do3FjkzDfEaZFyvhXuhFcAdQwWwfbQRsUiuhJl9Zyp7/bpGIiN8rXOTukmSYBQvBgVJhP0cMC00XIqAguwyQw4VLybtC7mT95djF+Nxx3pvQtEHRBXD2a39QF5dHvfeSVRWegCmogcq+gOWhT42rS5HKJMH0hSZ33UdwQoRdEwAtbGroJ+itsAz1x10GIgLKburWw6u+pEMUjjbSKkgaMOAjfKKonSOCGSYQuglG8h5HQ4ahIGI8DsJrIRwnG3Yun+wLyZSDwmH2eHUxf9Yg+YdFl6FFOdv6+yc8MRX9RYxs9cv604x+nE/C3bXoWQdD5pnrD837E7jYZ9fh4s68gnbuiHIr4MJoNq/nHPZpq1hSGRu37b+eQj6HRFvY/dE7sRPYHnsNug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(8936002)(2906002)(76116006)(33656002)(5660300002)(4326008)(86362001)(186003)(6506007)(52536014)(508600001)(316002)(26005)(71200400001)(38100700002)(55016002)(66946007)(66446008)(64756008)(8676002)(66556008)(66476007)(38070700005)(54906003)(110136005)(83380400001)(122000001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?F+aQRLROx5Zw8/5KNKapbMF1EILV504KeBQte0wwgBAIVL4cdTJ13xc6ESPi?=
 =?us-ascii?Q?rOPyVVbm7eYa8Siif6Z33xYhBbl4UupSwqXZw4lb9EVwMoJnQsl63qK7Hgl3?=
 =?us-ascii?Q?PK88qysg0ypdSjawmNkJpOqtae33wCTthGsEx9SHT/XIgoIkE3yOQoLtMRZV?=
 =?us-ascii?Q?pVCksjBBHHPZEP2DPmomLnOErGVuvPYarm9zS74RzNCqa0ui5/TnSORBjMMG?=
 =?us-ascii?Q?CFhWIKhhAmFcFgj5sGgxaOoP1GSblsdyokiox7GIY9L5DuzavQzn3/08llPL?=
 =?us-ascii?Q?aNXT64BunVwgl8MQHzFPJqUU0vIqAilOKIXZ2gkEL2BH6wnfsI35bZINfjMU?=
 =?us-ascii?Q?dPUL1HtMPUOrGGSVGx6AZQX12CWrEfWBZSp1gC8XLv/B7bl49EwNnVwSo3ZR?=
 =?us-ascii?Q?ENNFlGV3d5WusW/T/Q4+Ouc4TGFXCBlgdp1H4tGC1m1uACZjyb7jBwIwIa5z?=
 =?us-ascii?Q?jSkJOKpR9rDippdY2RFD0HvVEAC07t4RwXVWK1+VYI9QJUJKXkjpaSYYu7wD?=
 =?us-ascii?Q?ajoe3R4yNgOinbyTjOWnJXnv06HkFWn8geF+AE8HpQmTKs/3e7lSEWnq5wHd?=
 =?us-ascii?Q?1tMQrIxz4xbuouITjWwdN6vpHwt+a8u5chUrjGb+FY9in+snFipyZnt8xlUe?=
 =?us-ascii?Q?Jt4J7LZWmbHnFqOXzHpCfSBTckYAhJcYOpvu58srmiCnnYJmo5zxeLWDAYPl?=
 =?us-ascii?Q?4unjiFiRWXMqSjMTfWxtyU1xf/v2q8xUTRpj1dRfq8DEkaaSdvvhSKcaQOk8?=
 =?us-ascii?Q?JJkoNizP6oAhwkWvYZr9YBIuaCfOs2XZyki2t9IAlDH1PUpZKJ4uUQx4PX8m?=
 =?us-ascii?Q?DY2vp+nUem9FkoKKd5KkmTObncGdCxS9em/MAgDNtGX5sudpyKTG6JtzIh9Y?=
 =?us-ascii?Q?7FiWhpNSpnnKmieMVq0x8CsmX7RqLWHfaYg7Qt8UwqUlCB1XtOjbVbr3z9K6?=
 =?us-ascii?Q?0eY0Vd7G5xznnsimBflb5HRG/dNjgTe8MlCLguWBhCDu0I0AoV0uStJjQJz/?=
 =?us-ascii?Q?NkMhjjJ329yeY+pxnsaYIlBtOUkrRVPmVometKm6oefkO5MyZEi65VKqE9xt?=
 =?us-ascii?Q?GBahuRcxczsDRUERa3NYI2XLyGolku7tjJEV+FBnOcWRR2yqYR/ecwFDUT2B?=
 =?us-ascii?Q?Z28pqhb6JFM/Wh3dzM2XKXcuwP1nuCEuxRHuRSNwA5RReXV2M9rW7HymB3YO?=
 =?us-ascii?Q?MznLPceWerBzNExseNJM8Xd/azjk8a0HmpDwyfIcg4foW4m4xa6us8tt9UuJ?=
 =?us-ascii?Q?RV+bGhg14Nof/2w6CyHw8JWHMPtfNbYLoIe+CPTVv4tapERqamWFyBqaToN2?=
 =?us-ascii?Q?i/qt5GmMpJhsr9owtSvSB+DkSxMeH4pjYe4NX2mPUy6aBoRsuIRwC1ntp4I0?=
 =?us-ascii?Q?3fG4NmNUQkFN8iL6afGSnUhiK+CP1WLobU5i6tBuS5RRFxy3XJ4uwr8T2WrZ?=
 =?us-ascii?Q?quVEKC1z3j5Z1BI2f4mfB7/ma+mMHfthDEGcM/dkwPoveMp21sWt1nqGA0eW?=
 =?us-ascii?Q?Y9D1ZW2Vnz+PaAtRGe1D8IhrrWv484Y9/MoFet3h4Xhy7yRI2xrSglsc99AR?=
 =?us-ascii?Q?GaMBjHk3pxg2b3/CT8+7hvRqKFe+mqzcqKr11J0X3wAHgqg3c0LTA5HDN46k?=
 =?us-ascii?Q?EYVNBn7w5n3y+eX8j2n+C8Fpkqc4l+kcdgdpAdd25tze33r/ms19az65BRQy?=
 =?us-ascii?Q?ZMxg1Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dcd623-a20f-4d28-0427-08d9a841f426
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 14:12:27.0077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CnNIvj29of8xaaY5j83ApwAMLtGTjH1MYJLgtes28/Ron4nE4gytBfNoIFnOZaEpiqIs/vbkL5N3b6Dz9LztB0IFNTxnAmR5McByQs/ukEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6327
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

Thanks for the patch.

One question CR7 Can be master boot processor. In that case
How to avoid loading and booting  CR7 processor from Linux?
Reading boot modes??

Regards,
biju


> Subject: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
>=20
> Renesas Gen3 platform includes a Cortex-r7 processor.
>=20
> Both: the application cores (A5x) and the realtime core (CR7) share acces=
s
> to the RAM and devices with the same address map, so device addresses are
> equal to the Linux physical addresses.
>=20
> In order to initialize this remote processor we need to:
> - power on the realtime core
> - put the firmware in a ram area
> - set the boot address for this firmware (reset vector)
> - Deassert the reset
>=20
> This initial driver allows to start and stop the Cortex R7 processor.
>=20
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
> ---
>=20
> Change since RFC:
> - Improve Kconfig description.
> - Use consistent device for pr_* messages.
> - Drop unused dev and rproc member of struct rcar_rproc.
>=20
> ---
>  drivers/remoteproc/Kconfig      |  12 ++
>  drivers/remoteproc/Makefile     |   1 +
>  drivers/remoteproc/rcar_rproc.c | 226 ++++++++++++++++++++++++++++++++
>  3 files changed, 239 insertions(+)
>  create mode 100644 drivers/remoteproc/rcar_rproc.c
>=20
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig inde=
x
> 9a6eedc3994a..5b0c617d45f6 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -261,6 +261,18 @@ config QCOM_WCNSS_PIL
>  	  verified and booted with the help of the Peripheral Authentication
>  	  System (PAS) in TrustZone.
>=20
> +config RCAR_REMOTEPROC
> +	tristate "Renesas R-CAR Gen3 remoteproc support"
> +	depends on ARCH_RENESAS
> +	depends on REMOTEPROC
> +	help
> +	  Say y here to support R-Car realtime processor via the
> +	  remote processor framework. An elf firmware can be loaded
> +	  thanks to sysfs remoteproc entries. The remote processor
> +	  can be started and stopped.
> +	  This can be either built-in or a loadable module.
> +	  If compiled as module (M), the module name is rcar_rproc.
> +
>  config ST_REMOTEPROC
>  	tristate "ST remoteproc support"
>  	depends on ARCH_STI
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index bb26c9e4ef9c..bb290cc08e99 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_QCOM_SYSMON)		+=3D qcom_sysmon.o
>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+=3D qcom_wcnss_pil.o
>  qcom_wcnss_pil-y			+=3D qcom_wcnss.o
>  qcom_wcnss_pil-y			+=3D qcom_wcnss_iris.o
> +obj-$(CONFIG_RCAR_REMOTEPROC)		+=3D rcar_rproc.o
>  obj-$(CONFIG_ST_REMOTEPROC)		+=3D st_remoteproc.o
>  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+=3D st_slim_rproc.o
>  obj-$(CONFIG_STM32_RPROC)		+=3D stm32_rproc.o
> diff --git a/drivers/remoteproc/rcar_rproc.c
> b/drivers/remoteproc/rcar_rproc.c new file mode 100644 index
> 000000000000..795089dc4337
> --- /dev/null
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) IoT.bzh 2021
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/remoteproc.h>
> +#include <linux/reset.h>
> +#include <linux/soc/renesas/rcar-rst.h>
> +
> +#include "remoteproc_internal.h"
> +
> +struct rcar_rproc {
> +	struct reset_control *rst;
> +};
> +
> +static int rcar_rproc_mem_alloc(struct rproc *rproc,
> +				 struct rproc_mem_entry *mem)
> +{
> +	struct device *dev =3D &rproc->dev;
> +	void *va;
> +
> +	dev_dbg(dev, "map memory: %pa+%lx\n", &mem->dma, mem->len);
> +	va =3D ioremap_wc(mem->dma, mem->len);
> +	if (IS_ERR_OR_NULL(va)) {
> +		dev_err(dev, "Unable to map memory region: %pa+%lx\n",
> +			&mem->dma, mem->len);
> +		return -ENOMEM;
> +	}
> +
> +	/* Update memory entry va */
> +	mem->va =3D va;
> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_mem_release(struct rproc *rproc,
> +				   struct rproc_mem_entry *mem)
> +{
> +	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
> +	iounmap(mem->va);
> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_prepare(struct rproc *rproc) {
> +	struct device *dev =3D rproc->dev.parent;
> +	struct device_node *np =3D dev->of_node;
> +	struct of_phandle_iterator it;
> +	struct rproc_mem_entry *mem;
> +	struct reserved_mem *rmem;
> +	u64 da;
> +
> +	/* Register associated reserved memory regions */
> +	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> +	while (of_phandle_iterator_next(&it) =3D=3D 0) {
> +
> +		rmem =3D of_reserved_mem_lookup(it.node);
> +		if (!rmem) {
> +			dev_err(&rproc->dev,
> +				"unable to acquire memory-region\n");
> +			return -EINVAL;
> +		}
> +
> +		/* No need to translate pa to da, R-Car use same map */
> +		da =3D rmem->base;
> +
> +		mem =3D rproc_mem_entry_init(dev, NULL,
> +					   (dma_addr_t)rmem->base,
> +					   rmem->size, da,
> +					   rcar_rproc_mem_alloc,
> +					   rcar_rproc_mem_release,
> +					   it.node->name);
> +
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		rproc_add_carveout(rproc, mem);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_parse_fw(struct rproc *rproc, const struct
> +firmware *fw) {
> +	int ret;
> +
> +	ret =3D rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
> +static int rcar_rproc_start(struct rproc *rproc) {
> +	struct rcar_rproc *priv =3D rproc->priv;
> +	int err;
> +
> +	if (!rproc->bootaddr)
> +		return -EINVAL;
> +
> +	err =3D rcar_rst_set_rproc_boot_addr(rproc->bootaddr);
> +	if (err) {
> +		dev_err(&rproc->dev, "failed to set rproc boot addr\n");
> +		return err;
> +	}
> +
> +	err =3D reset_control_deassert(priv->rst);
> +	if (err)
> +		dev_err(&rproc->dev, "failed to deassert reset\n");
> +
> +	return err;
> +}
> +
> +static int rcar_rproc_stop(struct rproc *rproc) {
> +	struct rcar_rproc *priv =3D rproc->priv;
> +	int err;
> +
> +	err =3D reset_control_assert(priv->rst);
> +	if (err)
> +		dev_err(&rproc->dev, "failed to assert reset\n");
> +
> +	return err;
> +}
> +
> +static struct rproc_ops rcar_rproc_ops =3D {
> +	.prepare	=3D rcar_rproc_prepare,
> +	.start		=3D rcar_rproc_start,
> +	.stop		=3D rcar_rproc_stop,
> +	.load		=3D rproc_elf_load_segments,
> +	.parse_fw	=3D rcar_rproc_parse_fw,
> +	.find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> +	.sanity_check	=3D rproc_elf_sanity_check,
> +	.get_boot_addr	=3D rproc_elf_get_boot_addr,
> +
> +};
> +
> +static int rcar_rproc_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct rcar_rproc *priv;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	rproc =3D rproc_alloc(dev, np->name, &rcar_rproc_ops,
> +			    NULL, sizeof(*priv));
> +	if (!rproc)
> +		return -ENOMEM;
> +
> +	priv =3D rproc->priv;
> +
> +	priv->rst =3D devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->rst)) {
> +		ret =3D PTR_ERR(priv->rst);
> +		dev_err(dev, "fail to acquire rproc reset\n");
> +		goto free_rproc;
> +	}
> +
> +	pm_runtime_enable(dev);
> +	ret =3D pm_runtime_get_sync(dev);
> +	if (ret) {
> +		dev_err(dev, "failed to power up\n");
> +		goto free_rproc;
> +	}
> +
> +	dev_set_drvdata(dev, rproc);
> +
> +	/* Manually start the rproc */
> +	rproc->auto_boot =3D false;
> +
> +	ret =3D rproc_add(rproc);
> +	if (ret) {
> +		dev_err(dev, "rproc_add failed\n");
> +		goto pm_disable;
> +	}
> +
> +	return 0;
> +
> +pm_disable:
> +	pm_runtime_disable(dev);
> +free_rproc:
> +	rproc_free(rproc);
> +
> +	return ret;
> +}
> +
> +static int rcar_rproc_remove(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct rproc *rproc =3D platform_get_drvdata(pdev);
> +
> +	rproc_del(rproc);
> +	pm_runtime_disable(dev);
> +	rproc_free(rproc);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rcar_rproc_of_match[] =3D {
> +	{ .compatible =3D "renesas,rcar-cr7" },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, rcar_rproc_of_match);
> +
> +static struct platform_driver rcar_rproc_driver =3D {
> +	.probe =3D rcar_rproc_probe,
> +	.remove =3D rcar_rproc_remove,
> +	.driver =3D {
> +		.name =3D "rcar-rproc",
> +		.of_match_table =3D rcar_rproc_of_match,
> +	},
> +};
> +
> +module_platform_driver(rcar_rproc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Renesas Gen3 R-Car remote processor control
> +driver"); MODULE_AUTHOR("Julien Massot <julien.massot@iot.bzh>");
> --
> 2.31.1
>=20


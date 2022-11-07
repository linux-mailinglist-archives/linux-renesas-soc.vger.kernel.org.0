Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9BDB61E86C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Nov 2022 02:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiKGBuh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Nov 2022 20:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiKGBug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Nov 2022 20:50:36 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B50D2E5;
        Sun,  6 Nov 2022 17:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiJekHDZDFeaXQlD2LZeiwu3k1q2RVt3GMUDvipkdB/22hEOFKzfhZZNJgzrQ1Rw+Vp1en+x/HsNP5mIU31p/25xKUYsGN28kkmbzg35MRx74gcwf/iyPPZQZMQ5LNTc/Ot43qF+ZyzDV4HAmc4hR9+b0E9imwy3rmknGBry1cs8p0s1+EdZma5tChK27D2etksnpwgiK3U/+Bpu/q0m9pR1X01/WWb5ROkynKEgolpgNphU0D008mqSOUteWaomVgu19OmiRs4Dm3lxqGZIFMn/9e0HN0xEh8K8n0kv/7iTjiRnJVZxjwKMa854Jsd7PH9lfnjjCKk+liKAi5/2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dilOPfMulH2MbT2NVCfdnNb93c0MEsai1/1Md+I1VHU=;
 b=Nt62QRISFIFFoXa3kYQp9a2rA5XmR5wGeYJ70ojE7HpYktS7jmtE7UyZsUNERPNj3cr3iaE7Ard+rxcy8Eboh9tp7MzjarPsFMaVbtbyX8mF/dN171y2pSacS91Pk6FJf8ommvvLj6WZgiXDto0IcawyJJClMUlZo6bvA2aCFSnTxlu5Xm+QDXsMP5uUeRL5GcjaB04O5QEC7y0enxAG8EThNyI9P7Nxh2I37LUK/zRchjsOQri7gkvi936hQi7DVE5QfxiFVU7u9kyYtka0O/Wxpiyfq/9qlCH0humvZqr6O2F0WxV3ETvNTyWVXPw3kATp3pHd4sEQ/Xj7vrWbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dilOPfMulH2MbT2NVCfdnNb93c0MEsai1/1Md+I1VHU=;
 b=itc2TlUH+EFpH2bg6dWmcDLNyKlh9GNiLqHV+Y9IEgxf8DBibchOX+o1mfRdncroMITyYKvGByvr9ubXZNuWrPz22A4wLJwd6QJ932354ldz/WAbdWyODHd90ChIhRK751twBWv7Qit6An15OB1FzX/to4ZmS/pRdO71ANTPnD8=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYBPR01MB5535.jpnprd01.prod.outlook.com
 (2603:1096:404:801e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 01:50:31 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%9]) with mapi id 15.20.5791.025; Mon, 7 Nov 2022
 01:50:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     "kishon@kernel.org" <kishon@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RESEND PATCH v3 2/2] phy: renesas: Add Renesas Ethernet SERDES
 driver for R-Car S4-8
Thread-Topic: [RESEND PATCH v3 2/2] phy: renesas: Add Renesas Ethernet SERDES
 driver for R-Car S4-8
Thread-Index: AQHY6gmjy1WmwAnCP0miHnjYPdIYKq4wcl6AgAJM38A=
Date:   Mon, 7 Nov 2022 01:50:31 +0000
Message-ID: <TYBPR01MB5341DC696FCF3B7D4E139006D83C9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221027134006.2343164-1-yoshihiro.shimoda.uh@renesas.com>
 <20221027134006.2343164-3-yoshihiro.shimoda.uh@renesas.com>
 <Y2ZzowD2eAxBFcwR@matsya>
In-Reply-To: <Y2ZzowD2eAxBFcwR@matsya>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYBPR01MB5535:EE_
x-ms-office365-filtering-correlation-id: 1358a965-9e69-47b1-aa8d-08dac062745d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SmyIQa7i8a7ubxv37P96BsZAJyMwS67YuCquYzUQUj8WfvrDVXQNaBH7edqWMnMks8UkKCuo7eKzC0baxSUXfzFcck/n9OwIu5vPJ8YSHxjmYt8ROXjwY2yvicpylZ+tnRK3fSsVVYOG33gX734tORTqDZ18W8kBKz8dqUr/+mHg4KFU9LyuoxpQkOpVCRp3S3iXx8vRCmrB5BVygulwiox+5uSdLnyEZmIF6YcuiwdcC76XQQTxPt6JsJLCO7i4qtrz/Cutqs8M9cAO0YLyp9nQxgpDSCKE24WBwRFGQ/Kpf7gFLS0ebBM7P2yu7sdnzsf4VUS8aq3aCyuxjjxJuJZGLGeNNVYUyeAZKXYGCfBgDFl+FslRu5m2a+3/E9RMacUZrI273CkEmvo6nU6jLFQrVP5fRc/qTgrRB9B3CxfzwpZP+9ubNY7vUFfSWsV8w7jnn0G6leSlQbOFi3f9PvLh7jXg9Tcmd+1J6ONZMrEjjm39eqTEZfuyzVxQVhMGyScZgKWLz6IHIwUV/4gOFuqeTNg8aOL07Nz9yHBlY+BRwXSICx4zGqKk0P7KhjJ0275Du1o/1HpqnqY7/PzYb/QyMTpL6cNjhS/Ga/MkyIeA8cF0UlHc1k1C/CepfjjUADMm6x4i6TzpjsYB5Ft081Hcp3SFYpwoz7+W1N3EcWp2ttTKzrij7X8SxbaopOtO+Pc12IvNpdpK5ds8nI9g1hqoROx3lifo7iH0+YW3oDeu7Doqv6udN7grU8WA6UWVJmEyulCbg+5Ri0Zra/TD3A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199015)(54906003)(6916009)(316002)(30864003)(5660300002)(55016003)(38070700005)(2906002)(83380400001)(478600001)(76116006)(41300700001)(66446008)(66556008)(4326008)(66946007)(8676002)(64756008)(66476007)(52536014)(71200400001)(8936002)(33656002)(9686003)(186003)(38100700002)(122000001)(53546011)(86362001)(6506007)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PPDsYEjDr7v89SQASjI4re1d+ahQ8AS+vLKinnNDO13HcaZyOkvHcBnBBMgm?=
 =?us-ascii?Q?qXxyzI/jPK6xMjbLxpMpAMJK8juFupQlt3Vn+hBy3jKdfNGqudZu6QQdUQxO?=
 =?us-ascii?Q?9c9kB1KVRdYYmLTldyJjpDcwwrZtJF9Ueg4YRPfRo7PiZtHumDEcMQnCkS+y?=
 =?us-ascii?Q?BlG1XiXiPJpjFMCIH50chCCMbXcIDEmyeJYJThStRKShFCUpK+Ub8SqFU7NF?=
 =?us-ascii?Q?T6GF8+A0euKWMkCShN70lwqysGTJlqpE9gtIGnkEV6YG25LK4fewrmI5xgzk?=
 =?us-ascii?Q?UsodTcvTkBWamyP0nizGNjGpUwjEUlqm0wGGpFzKQWtHkFTkIM/0lMe3R0rk?=
 =?us-ascii?Q?WkAQhEHhndM1N3d8DYYd3KsIDp8ymy/0qQowVnZ4aCG0h4MDmVTqqwq8X4LH?=
 =?us-ascii?Q?NhokXaecqOGgQfJEG4JPzgsAYvPadcWQmLygUv43EC8RnnPcE1hVoylCA0S0?=
 =?us-ascii?Q?tLMMPf0x+1REsMCUdIl1PGiqHvKUp2DW/k3Uc1y/OR5NU6A4bCSH1+c4Ixgl?=
 =?us-ascii?Q?/7mQyPC4g5eLpVAKlZ/ojWsTyDqvth47VudU+r+SiiCMYWxDp90cveboy2Lc?=
 =?us-ascii?Q?WVYtv1Sc/KRgaMsJHE2TD2s8qowB5uLSb9Bk4N9+GPyO1aYXfK8w2GBcXK7a?=
 =?us-ascii?Q?/zR01r9XORcyG2hzPB1vgSdB/5JDKd1FK3qZfxiyNkE2XZnFqxD+FS1YHkbI?=
 =?us-ascii?Q?71aBfVmJck2aoPzXiWQhLUropZnRkmmioNN6Q4QehUo62XvEfiKljisicv4h?=
 =?us-ascii?Q?Yr5iV6uLvWB2YL9UjgVgycx3kv78U7R9xSWpZ77cLCeoze1BkUSDj2ewFmAd?=
 =?us-ascii?Q?czo5mPRGNLWFAQ9jm2p7kI8HJOta9NMLfuMpQMsmiSrcnnlyJl8f5O4NAAze?=
 =?us-ascii?Q?Om/TPD2zkIyoincOC3fmMxkiwYMOi2Dfl9lTcfLUk3m4gRhc871bP1nXhB4j?=
 =?us-ascii?Q?Ux38GY1Page2mzsFSLfx5Bhk+ZIPtHTD7wiPVMSgUcs2ZivEPYfSkiqRyxhj?=
 =?us-ascii?Q?hCAp9hIXQEcOO6saYdVQ+StztEf8t+OqaZTDUgpNU6hmlQuphLSRkllD5sfd?=
 =?us-ascii?Q?GsALoKVIr+uSUa5rCYayqJy6rUWWF90YYifK69WLTuqe8vFygRVN0TJTl8/+?=
 =?us-ascii?Q?/NrO233kXrDG/WnA+O/ur3g0SZvm989mE1PQXzJ1YeM/bG9pM6s94EAlUaz+?=
 =?us-ascii?Q?8HKh+/vhhLokkCjY6siZniqCjxhsU1uA2Vge0OaRqH0jvEmB5avKZtHZGBsP?=
 =?us-ascii?Q?NYqS3WUQl+ShS2vgG6m24kqJ8SVdk0MRghZF2+sVIkIA8P7X/UjfcXYmMLwh?=
 =?us-ascii?Q?1bd1rhsZo6qcLogX7vrFPOb6v2xVnJKTZMaldZopj34lg9Mag6QDnADZx+8/?=
 =?us-ascii?Q?U+A3fc5p3aFjYIpP7DeVTz0j81IhAM2mdzeRuWkEIpiUKbdqsWAZRtvrJXDI?=
 =?us-ascii?Q?afdCkibkPAc/GZwCQWcq/6KP/SHM6O2qDqva7ueBGu8f2RFLkjtrNEo71ixM?=
 =?us-ascii?Q?DkNmoQqNvP2Nd7SvisjrnSB3/OYUxuQKdvQcAOiZqL29LRQ0smWJtbf0Mr2f?=
 =?us-ascii?Q?MwRmz4bAWUNjZFjIslRfnJ8Mj6/6uDWBnZSlJ5sE16Q8toRHfpjRgwNDhiTH?=
 =?us-ascii?Q?J+YAncn2nkfcvW2i7tfsiBJG0nmbQ++Vhu0gLdzNbS6e6eh3+1eatehc5ykY?=
 =?us-ascii?Q?Psaw5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1358a965-9e69-47b1-aa8d-08dac062745d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 01:50:31.7657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k6R9oGWUztV1CVkMhRSlgQP4J+frpUfWJT82asqWltty0Wn7DiwGDle6Go5cj1ZLdriZ8fAmi7yLFRhX47IUmuyLBmudLW/rVMmZYPbdUA8LXRmAb5/Cvqf4t2gVXb/i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5535
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Vinod,

> From: Vinod Koul, Sent: Saturday, November 5, 2022 11:31 PM
>=20
> On 27-10-22, 22:40, Yoshihiro Shimoda wrote:
> > Add Renesas Ethernet SERDES driver for R-Car S4-8 (r8a779f0).
> > The datasheet describes initialization procedure without any informatio=
n
> > about registers' name/bits. So, this is all black magic to initialize
> > the hardware. Especially, all channels should be initialized at once.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/phy/renesas/Kconfig                 |   7 +
> >  drivers/phy/renesas/Makefile                |   1 +
> >  drivers/phy/renesas/r8a779f0-ether-serdes.c | 416 ++++++++++++++++++++
> >  3 files changed, 424 insertions(+)
> >  create mode 100644 drivers/phy/renesas/r8a779f0-ether-serdes.c
> >
> > diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> > index 111bdcae775c..68f160b0e8ef 100644
> > --- a/drivers/phy/renesas/Kconfig
> > +++ b/drivers/phy/renesas/Kconfig
> > @@ -32,3 +32,10 @@ config PHY_RCAR_GEN3_USB3
> >  	select GENERIC_PHY
> >  	help
> >  	  Support for USB 3.0 PHY found on Renesas R-Car generation 3 SoCs.
> > +
> > +config PHY_R8A779F0_ETHERNET_SERDES
> > +	tristate "Renesas R-Car S4-8 Ethernet SERDES driver"
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	select GENERIC_PHY
> > +	help
> > +	  Support for Ethernet SERDES found on Renesas R-Car S4-8 SoCs.
>=20
> Sorted alphabetically please and not at the end

I intended to sort alphabetically about the prompt strings:

<snip>
"Renesas R-Car generation 3 USB 2.0 PHY driver"
"Renesas R-Car generation 3 USB 3.0 PHY driver"
"Renesas R-Car S4-8 Ethernet SERDES driver"

However, IIUC, should we sort alphabetically about the config strings like =
below?

config PHY_R8A779F0_ETHERNET_SERDES
config PHY_RCAR_GEN3_PCIE
<snip>

> > diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefil=
e
> > index b599ff8a4349..8896d1919faa 100644
> > --- a/drivers/phy/renesas/Makefile
> > +++ b/drivers/phy/renesas/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_PHY_R8A779F0_ETHERNET_SERDES)	+=3D r8a779f0-ether-serdes.=
o
> >  obj-$(CONFIG_PHY_RCAR_GEN2)		+=3D phy-rcar-gen2.o
> >  obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+=3D phy-rcar-gen3-pcie.o
> >  obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+=3D phy-rcar-gen3-usb2.o
> > diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/=
renesas/r8a779f0-ether-serdes.c
> > new file mode 100644
> > index 000000000000..38cf6c408cae
> > --- /dev/null
> > +++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
> > @@ -0,0 +1,416 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Renesas Ethernet SERDES device driver
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/kernel.h>
> > +#include <linux/phy.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +#define R8A779F0_ETH_SERDES_NUM			3
> > +#define R8A779F0_ETH_SERDES_OFFSET		0x0400
> > +#define R8A779F0_ETH_SERDES_BANK_SELECT		0x03fc
> > +#define R8A779F0_ETH_SERDES_TIMEOUT_US		100000
> > +#define R8A779F0_ETH_SERDES_NUM_RETRY_LINKUP	3
> > +#define R8A779F0_ETH_SERDES_NUM_RETRY_INIT	3
> > +
> > +struct r8a779f0_eth_serdes_drv_data;
> > +struct r8a779f0_eth_serdes_channel {
> > +	struct r8a779f0_eth_serdes_drv_data *dd;
> > +	struct phy *phy;
> > +	void __iomem *addr;
> > +	phy_interface_t phy_interface;
> > +	int speed;
> > +	int index;
> > +};
> > +
> > +struct r8a779f0_eth_serdes_drv_data {
> > +	void __iomem *addr;
> > +	struct platform_device *pdev;
> > +	struct reset_control *reset;
> > +	struct r8a779f0_eth_serdes_channel channel[R8A779F0_ETH_SERDES_NUM];
> > +	bool initialized;
> > +};
> > +
> > +/*
> > + * The datasheet describes initialization procedure without any inform=
ation
> > + * about registers' name/bits. So, this is all black magic to initiali=
ze
> > + * the hardware.
> > + */
> > +static void r8a779f0_eth_serdes_write32(void __iomem *addr, u32 offs, =
u32 bank, u32 data)
> > +{
> > +	iowrite32(bank, addr + R8A779F0_ETH_SERDES_BANK_SELECT);
> > +	iowrite32(data, addr + offs);
> > +}
> > +
> > +static int
> > +r8a779f0_eth_serdes_reg_wait(struct r8a779f0_eth_serdes_channel *chann=
el,
> > +			     u32 offs, u32 bank, u32 mask, u32 expected)
> > +{
> > +	int ret;
> > +	u32 val;
> > +
> > +	iowrite32(bank, channel->addr + R8A779F0_ETH_SERDES_BANK_SELECT);
> > +
> > +	ret =3D readl_poll_timeout_atomic(channel->addr + offs, val,
> > +					(val & mask) =3D=3D expected,
> > +					1, R8A779F0_ETH_SERDES_TIMEOUT_US);
> > +	if (ret)
> > +		pr_debug("%s: index %d, offs %x, bank %x, mask %x, expected %x\n",
> > +			 __func__, channel->index, offs, bank, mask, expected);
>=20
> 1) why not dev_ variant

Oops. I'll use dev_ variant.

> 2) this should be error log

Sometimes timeout happened, but after retried, the initialization passes.
So, I'd like to avoid the output messages if the log level is lower than KE=
RN_DEBUG.

Best regards,
Yoshihiro Shimoda

> > +
> > +	return ret;
> > +}
> > +
> > +static int
> > +r8a779f0_eth_serdes_common_init_ram(struct r8a779f0_eth_serdes_drv_dat=
a *dd)
> > +{
> > +	struct r8a779f0_eth_serdes_channel *channel;
> > +	int i, ret;
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> > +		channel =3D &dd->channel[i];
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x026c, 0x180, BIT(0),=
 0x01);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	r8a779f0_eth_serdes_write32(dd->addr, 0x026c, 0x180, 0x03);
> > +
> > +	return ret;
> > +}
> > +
> > +static int
> > +r8a779f0_eth_serdes_common_setting(struct r8a779f0_eth_serdes_channel =
*channel)
> > +{
> > +	struct r8a779f0_eth_serdes_drv_data *dd =3D channel->dd;
> > +
> > +	switch (channel->phy_interface) {
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +		r8a779f0_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x0097);
> > +		r8a779f0_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060);
> > +		r8a779f0_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200);
> > +		r8a779f0_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d);
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int
> > +r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_serdes_channel *c=
hannel)
> > +{
> > +	int ret;
> > +
> > +	switch (channel->phy_interface) {
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x0011);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x0540);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x0015);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x0100);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x0002);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x0003);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0100);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0100);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x0007);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x0310);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x380, 0x0101);
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x00c8, 0x0180, BIT(0)=
, 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0101);
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x0148, 0x0180, BIT(0)=
, 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x1310);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x1800);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x0001);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2100);
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x0000, 0x0380, BIT(8)=
, 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (channel->speed =3D=3D 1000)
> > +			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x0140);
> > +		else if (channel->speed =3D=3D 100)
> > +			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x2100);
> > +
> > +		/* For AN_ON */
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0004, 0x1f80, 0x0005);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0028, 0x1f80, 0x07a1);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f80, 0x0208);
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +r8a779f0_eth_serdes_chan_speed(struct r8a779f0_eth_serdes_channel *cha=
nnel)
> > +{
> > +	int ret;
> > +
> > +	switch (channel->phy_interface) {
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +		/* For AN_ON */
> > +		if (channel->speed =3D=3D 1000)
> > +			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x1140);
> > +		else if (channel->speed =3D=3D 100)
> > +			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x3100);
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x0008, 0x1f80, BIT(0)=
, 1);
> > +		if (ret)
> > +			return ret;
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0008, 0x1f80, 0x0000);
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +
> > +static int r8a779f0_eth_serdes_monitor_linkup(struct r8a779f0_eth_serd=
es_channel *channel)
> > +{
> > +	int i, ret;
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM_RETRY_LINKUP; i++) {
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x0004, 0x300,
> > +						   BIT(2), BIT(2));
> > +		if (!ret)
> > +			break;
> > +
> > +		/* restart */
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x0100);
> > +		udelay(1);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x0000);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int r8a779f0_eth_serdes_hw_init(struct r8a779f0_eth_serdes_chan=
nel *channel)
> > +{
> > +	struct r8a779f0_eth_serdes_drv_data *dd =3D channel->dd;
> > +	int i, ret;
> > +
> > +	if (dd->initialized)
> > +		return 0;
> > +
> > +	ret =3D r8a779f0_eth_serdes_common_init_ram(dd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(&dd->channel[i], 0x0000,
> > +						   0x300, BIT(15), 0);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++)
> > +		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d4, 0x380, 0x04=
43);
> > +
> > +	ret =3D r8a779f0_eth_serdes_common_setting(channel);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++)
> > +		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x380, 0x00=
01);
> > +
> > +
> > +	r8a779f0_eth_serdes_write32(dd->addr, 0x0000, 0x380, 0x8000);
> > +
> > +	ret =3D r8a779f0_eth_serdes_common_init_ram(dd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D r8a779f0_eth_serdes_reg_wait(&dd->channel[0], 0x0000, 0x380, =
BIT(15), 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> > +		ret =3D r8a779f0_eth_serdes_chan_setting(&dd->channel[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> > +		ret =3D r8a779f0_eth_serdes_chan_speed(&dd->channel[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++)
> > +		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03c0, 0x380, 0x00=
00);
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++)
> > +		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x380, 0x00=
00);
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> > +		ret =3D r8a779f0_eth_serdes_monitor_linkup(&dd->channel[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int r8a779f0_eth_serdes_init(struct phy *p)
> > +{
> > +	struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
> > +	int i, ret;
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM_RETRY_INIT; i++) {
> > +		ret =3D r8a779f0_eth_serdes_hw_init(channel);
> > +		if (!ret) {
> > +			channel->dd->initialized =3D true;
> > +			break;
> > +		}
> > +		usleep_range(1000, 2000);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static int r8a779f0_eth_serdes_set_mode(struct phy *p, enum phy_mode m=
ode,
> > +					int submode)
> > +{
> > +	struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
> > +
> > +	if (mode !=3D PHY_MODE_ETHERNET)
> > +		return -EOPNOTSUPP;
> > +
> > +	switch (submode) {
> > +	case PHY_INTERFACE_MODE_GMII:
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +	case PHY_INTERFACE_MODE_USXGMII:
> > +		channel->phy_interface =3D submode;
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int r8a779f0_eth_serdes_set_speed(struct phy *p, int speed)
> > +{
> > +	struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
> > +
> > +	channel->speed =3D speed;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct phy_ops r8a779f0_eth_serdes_ops =3D {
> > +	.init		=3D r8a779f0_eth_serdes_init,
> > +	.set_mode	=3D r8a779f0_eth_serdes_set_mode,
> > +	.set_speed	=3D r8a779f0_eth_serdes_set_speed,
> > +};
> > +
> > +static struct phy *r8a779f0_eth_serdes_xlate(struct device *dev,
> > +					     struct of_phandle_args *args)
> > +{
> > +	struct r8a779f0_eth_serdes_drv_data *dd =3D dev_get_drvdata(dev);
> > +
> > +	if (args->args[0] >=3D R8A779F0_ETH_SERDES_NUM)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	return dd->channel[args->args[0]].phy;
> > +}
> > +
> > +static const struct of_device_id r8a779f0_eth_serdes_of_table[] =3D {
> > +	{ .compatible =3D "renesas,r8a779f0-ether-serdes", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, r8a779f0_eth_serdes_of_table);
> > +
> > +static int r8a779f0_eth_serdes_probe(struct platform_device *pdev)
> > +{
> > +	struct r8a779f0_eth_serdes_drv_data *dd;
> > +	struct phy_provider *provider;
> > +	struct resource *res;
> > +	int i;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "invalid resource\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dd =3D devm_kzalloc(&pdev->dev, sizeof(*dd), GFP_KERNEL);
> > +	if (!dd)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, dd);
> > +	dd->pdev =3D pdev;
> > +	dd->addr =3D devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(dd->addr))
> > +		return PTR_ERR(dd->addr);
> > +
> > +	dd->reset =3D devm_reset_control_get(&pdev->dev, NULL);
> > +	if (IS_ERR(dd->reset))
> > +		return PTR_ERR(dd->reset);
> > +
> > +	reset_control_reset(dd->reset);
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> > +		struct r8a779f0_eth_serdes_channel *channel =3D &dd->channel[i];
> > +
> > +		channel->phy =3D devm_phy_create(&pdev->dev, NULL,
> > +					       &r8a779f0_eth_serdes_ops);
> > +		if (IS_ERR(channel->phy))
> > +			return PTR_ERR(channel->phy);
> > +		channel->addr =3D dd->addr + R8A779F0_ETH_SERDES_OFFSET * i;
> > +		channel->dd =3D dd;
> > +		channel->index =3D i;
> > +		phy_set_drvdata(channel->phy, channel);
> > +	}
> > +
> > +	provider =3D devm_of_phy_provider_register(&pdev->dev,
> > +						 r8a779f0_eth_serdes_xlate);
> > +	if (IS_ERR(provider))
> > +		return PTR_ERR(provider);
> > +
> > +	pm_runtime_enable(&pdev->dev);
> > +	pm_runtime_get_sync(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static int r8a779f0_eth_serdes_remove(struct platform_device *pdev)
> > +{
> > +	pm_runtime_put(&pdev->dev);
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	platform_set_drvdata(pdev, NULL);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver r8a779f0_eth_serdes_driver_platform =3D =
{
> > +	.probe =3D r8a779f0_eth_serdes_probe,
> > +	.remove =3D r8a779f0_eth_serdes_remove,
> > +	.driver =3D {
> > +		.name =3D "r8a779f0_eth_serdes",
> > +		.of_match_table =3D r8a779f0_eth_serdes_of_table,
> > +	}
> > +};
> > +module_platform_driver(r8a779f0_eth_serdes_driver_platform);
> > +MODULE_AUTHOR("Yoshihiro Shimoda");
> > +MODULE_DESCRIPTION("Renesas Ethernet SERDES device driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.25.1
>=20
> --
> ~Vinod

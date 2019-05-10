Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E86E019751
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 06:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfEJER0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 00:17:26 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:34976
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725904AbfEJER0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 00:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RXND2+IuFuWwT5dodUEb52GpetEKPD8PHR4xtSEK1Y=;
 b=luRVO4jzhZiP6kQvpzQRXIb439/A7r+ZYZbNejy9hEYwhPqRiUPne57T+bfQ5Wj3UdhViAWftqH6NhLI/SjQK/v1kRQxFIWpfU19cvPJjx9TH0ElIqYS/ocENWWYTiT3ZxjZsU0CQ4HRSee3NS/vni0Qq0BZtEAEVHi4WoshjkE=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB3976.jpnprd01.prod.outlook.com (20.178.5.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Fri, 10 May 2019 04:17:21 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 04:17:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
Subject: RE: [PATCH v2 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
Thread-Topic: [PATCH v2 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1
 clock
Thread-Index: AQHVBqOSn5UdgPq18UyoQRntmZW3xqZjvtPw
Date:   Fri, 10 May 2019 04:17:21 +0000
Message-ID: <OSBPR01MB3174905587AC3953FD2063EBD80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-4-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-4-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b1bcf46-810a-4193-aaa0-08d6d4fe6606
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3976;
x-ms-traffictypediagnostic: OSBPR01MB3976:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB3976D1EA22DD5114B5977AB6D80C0@OSBPR01MB3976.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(39860400002)(376002)(346002)(136003)(189003)(199004)(9686003)(6436002)(6306002)(966005)(14454004)(229853002)(478600001)(8936002)(66556008)(74316002)(55016002)(81166006)(81156014)(8676002)(6636002)(7736002)(305945005)(54906003)(66066001)(6506007)(102836004)(66446008)(64756008)(66476007)(4326008)(3846002)(6116002)(6246003)(316002)(71190400001)(71200400001)(76176011)(6862004)(5660300002)(99286004)(7696005)(86362001)(66946007)(52536014)(446003)(256004)(68736007)(33656002)(25786009)(486006)(476003)(11346002)(186003)(76116006)(73956011)(26005)(2906002)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3976;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WsKUXekGO5qkDJzZR7o7fssYv44OMm/6gpDY0AG+Y2erw8nFB4hODbjYi5ahxs95c7OM64ZE0K1Lx8/UK9soA63nHJq/+UBO9FTYJaSRsMPkKR6bK1ePlSaAOcj/NqLt797aS9lzxcCFK00CadzmSJeD0obCdPXrptJv57KE2L99NvI2mdAVuD58PqYAp9ofBNRLzEuy8m4kahuP1t+S4blZfAn9exuwZNtPPqLQzKNZ3K8qM2JDEUrT3thBAAbNDHl5FNAE+i+wxkIaycNqHywjl7RvhBfA6SUSBsyMonJ/J37BXBYfgqkw9JgysGaj0/6cRCEHACOM/VHvR8B8yPzYnWs4MawWRAl4/KWjvzh5Z7Y7RUFMcj61/pl11cYgvDxeNrLRGOeqU/EbI6PjM0G+emfqe/CJ8QBbWU/1h3Y=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1bcf46-810a-4193-aaa0-08d6d4fe6606
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 04:17:21.3701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3976
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris=1B$B$5$s=1B(B

Thank you for the patch!

> From: Chris Brandt, Sent: Friday, May 10, 2019 5:12 AM
>=20
> The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
> If a clock node named 'usb_x1' exists and set to non-zero, then we can
> assume we want it use it.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * use 'usb_x1' clock node instead of 'renesas,uses_usb_x1' property
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
<snip>
> @@ -582,10 +587,12 @@ static int rcar_gen3_phy_usb2_probe(struct platform=
_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct rcar_gen3_chan *channel;
> +	struct device_node *usb_x1_clk;
>  	struct phy_provider *provider;
>  	struct resource *res;
>  	const struct phy_ops *phy_usb2_ops;
>  	int irq, ret =3D 0, i;
> +	u32 freq_usb =3D 0;
>=20
>  	if (!dev->of_node) {
>  		dev_err(dev, "This driver needs device tree\n");
> @@ -630,6 +637,13 @@ static int rcar_gen3_phy_usb2_probe(struct platform_=
device *pdev)
>  		}
>  	}
>=20
> +	usb_x1_clk =3D of_find_node_by_name(NULL, "usb_x1");
> +	if (usb_x1_clk) {
> +		of_property_read_u32(usb_x1_clk, "clock-frequency", &freq_usb);
> +		if (freq_usb)
> +			channel->uses_usb_x1 =3D true;
> +	}
> +

We need to call of_node_put(usb_x1_clk); here.

By the way, we can also use devm_clk_get() for it like the following driver=
:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/clk/renesas/rcar-usb2-clock-sel.c#n135

Best regards,
Yoshihiro Shimoda
>  	/*
>  	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
>  	 * And then, phy-core will manage runtime pm for this device.
> --
> 2.16.1


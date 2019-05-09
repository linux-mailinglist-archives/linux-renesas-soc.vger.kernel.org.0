Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06004185D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 09:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfEIHOH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 03:14:07 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:12719
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726192AbfEIHOH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 03:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYNBdjAbLSqTj02BpQog5HIsBKzR6YV/Ta3OYJvpKIs=;
 b=bITG2qCg/wiyNl0GEvVGXHOLmgNUKoR4GOgwflh6bQ6lUMdSacvW6yzio1nj4fZt0L7TzVXohiwl9SDYKkfaOCC48ZyKBN5Joxdx5CW1XGnmIuPMfPk/yZV/Yf1C4LJKaJrPBEPFn8klZAm+j9xeDH9AtFfcZrACZkoqag3V2w8=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2503.jpnprd01.prod.outlook.com (52.134.252.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 07:14:02 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562%3]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 07:14:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
Subject: RE: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Thread-Topic: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
Thread-Index: AQHVBGYbIrh0wxuC4UGtA5QdaFMDmqZiYyig
Date:   Thu, 9 May 2019 07:14:02 +0000
Message-ID: <OSBPR01MB3174708A983E7148D0F2F7CCD8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-4-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0513c3df-07c2-427e-fbb2-08d6d44dea17
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2503;
x-ms-traffictypediagnostic: OSBPR01MB2503:
x-microsoft-antispam-prvs: <OSBPR01MB2503085F85855C2DEECDD421D8330@OSBPR01MB2503.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(366004)(376002)(136003)(396003)(199004)(189003)(66066001)(66946007)(66446008)(66476007)(73956011)(64756008)(66556008)(74316002)(54906003)(76116006)(71200400001)(71190400001)(53936002)(316002)(7696005)(14444005)(256004)(4326008)(99286004)(76176011)(446003)(11346002)(476003)(486006)(9686003)(55016002)(26005)(186003)(305945005)(86362001)(6116002)(3846002)(68736007)(25786009)(14454004)(229853002)(7736002)(81156014)(8936002)(81166006)(478600001)(8676002)(6436002)(52536014)(6506007)(6246003)(5660300002)(6862004)(102836004)(6636002)(33656002)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2503;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NXuicrtNpVBMdmkhYndlSDvlguj+s9j7LrwQ33hcoks77l3sQBz7EDWqWsTlDZ6Pi8hhzIETJp1qUhdd1PFCeZfnnbOU89ZhFOFTEsEmAyXFY/GJt4bN2zLKkWzP8Mg4CnYR84Ix5m+M1IRQ19iuiB6/zYacOz5FPlTcoomO87a4MicvFHpEj7+yWh3npx11LUFhiruEKeCAebfkk5LVXsZL/yVGFrGXgDpWVjLstY7hPjwPle+8gy5I7vNVETI1M2PJJB+wwK2aie7Utw33x7fJvFpkSyNHDcHd7UVR9xivOtPL3Cwyn71C170gb27cuoCes9lqrZl3fB7b/1CwJAsfaajKZj+EBYq7zNd/Jj0c2eISSDWouxoqgyf8gUpdv02tk3lqO6PP+R9aGGXrD3/a9qo/ML8tTrBjeXHLAZ8=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0513c3df-07c2-427e-fbb2-08d6d44dea17
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 07:14:02.3073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2503
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris=1B$B$5$s=1B(B

Thank you for the patch!

> From: Chris Brandt, Sent: Tuesday, May 7, 2019 8:46 AM
>=20
> When not using OTG, the PHY will need to know if it should function as
> host or peripheral by checking dr_mode in the PHY node (not the parent
> controller node).
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index 218b32e458cb..4eaa228ebd30 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -408,7 +408,12 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  		if (rcar_gen3_needs_init_otg(channel))
>  			rcar_gen3_init_otg(channel);
>  		rphy->otg_initialized =3D true;
> -	}
> +	} else

As Sergei-san said, this should be "} else {"

> +		/* Not OTG, so dr_mode should be set in PHY node */
> +		if (usb_get_dr_mode(channel->dev) =3D=3D USB_DR_MODE_PERIPHERAL)
> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
> +		else

I would like to add "else if usb_get_dr_mode(channel->dev) =3D=3D USB_DR_MO=
DE_HOST)"
for a PHY node without "dr_mode" property. In other words, if the PHY node
doesn't have dr_mode property like R-Car, this condition can be the same be=
havior as previous.

> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
>=20
>  	rphy->initialized =3D true;
>=20
> @@ -638,6 +643,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_d=
evice *pdev)
>  	if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
>  		channel->uses_usb_x1 =3D true;
>=20
> +

As Sergei-san said, this is not needed :)

Best regards,
Yoshihiro Shimoda


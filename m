Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2BF197B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 06:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfEJEiX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 00:38:23 -0400
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:19728
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726907AbfEJEiX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 00:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmmCiuHxmQA3aRSs3NsS3RfM5Xj+c2AFIirzaDeoOrg=;
 b=muokvj96w0hqkSCCQ8fsVqN9EtHMuGJq9UadH3VLk3poOrycHP3Y6DrdzZbGOmvAnVQr8Z2AM0L6u8NZbf5pnoSb0CsO1h11GbJfLIBywGY9GI1fPRVN5DwzUl10pA3YNRyLkBXcYD4KgWYTvB5jfwgebcac+T86OcYyOnszdl4=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB3720.jpnprd01.prod.outlook.com (20.178.97.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.20; Fri, 10 May 2019 04:38:18 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.022; Fri, 10 May 2019
 04:38:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use of
 usb_x1
Thread-Topic: [PATCH v2 04/15] dt-bindings: rcar-gen3-phy-usb2: Document use
 of usb_x1
Thread-Index: AQHVBqOYCISEYyQKq0WBPURrqMi4qKZjwi9g
Date:   Fri, 10 May 2019 04:38:18 +0000
Message-ID: <OSBPR01MB3174A8008FF1E216893398E8D80C0@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190509201142.10543-1-chris.brandt@renesas.com>
 <20190509201142.10543-5-chris.brandt@renesas.com>
In-Reply-To: <20190509201142.10543-5-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4b0fa50-9173-4905-aa08-08d6d501530b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3720;
x-ms-traffictypediagnostic: OSBPR01MB3720:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB3720FC09A9242FC250DF7405D80C0@OSBPR01MB3720.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(376002)(39860400002)(366004)(136003)(199004)(189003)(5660300002)(52536014)(3846002)(6116002)(8676002)(71200400001)(6506007)(81156014)(81166006)(25786009)(229853002)(2906002)(7696005)(14454004)(71190400001)(66066001)(86362001)(26005)(476003)(8936002)(11346002)(486006)(102836004)(186003)(446003)(966005)(74316002)(478600001)(76116006)(66446008)(256004)(73956011)(14444005)(33656002)(6306002)(55016002)(66556008)(64756008)(66476007)(76176011)(7736002)(4326008)(54906003)(110136005)(99286004)(6246003)(107886003)(53936002)(9686003)(68736007)(6436002)(316002)(66946007)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3720;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: suOPa5EcEJ26K5VNvd12612wvb6VYlENRNrbfoGmsHaeFMlV1lvbkmEQnwdWErgc5WPlyr62ZBHSo8vRPuCwuEZ0i9WEJq6WJCS/PibaAI5NVLxclIa4+X6y38HWn6uFSQPhp4K8VImroE8NgGxb7i+fwBVoVcppL7dcV0qEqYzOhbnX8/jdC4jXeD8kqo22wR3vG6CZXgKQeNAm+4IA7mz3emI4JaAsOiflmi+38xDfpRejrgZX3/HhV1SFaoASi9rCWcW2x0bbUdxm1kIL6fpM4OSn8vKWEAxyEeY1qkSOqeooWVG258TsyMGBqYigtwhyxdgKoWbVrORPy12emwiyV9jd0uJA9EQu5DzngfMvJvftrOEfpGylzfLDEazhfmM2ooc5RZOWRSRmU9yQVWqDRo+Gji09mK9DqhIVlVc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b0fa50-9173-4905-aa08-08d6d501530b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 04:38:18.2591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3720
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

Thank you for the patch!

> From: Chris Brandt, Sent: Friday, May 10, 2019 5:12 AM
>=20
> Document the optional renesas,uses_usb_x1 property.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * removed 'use_usb_x1' option
>  * document that 'usb_x1' clock node will be detected to determine if
>    48MHz clock exists
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index d46188f450bf..79d8360d92e5 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -28,7 +28,9 @@ Required properties:
>  	      followed by the generic version.
>=20
>  - reg: offset and length of the partial USB 2.0 Host register block.
> -- clocks: clock phandle and specifier pair(s).
> +- clocks: clock phandle and specifier pair(s). For SoCs that have a sepa=
rate
> +          dedicated 48MHz USB_X1 input, if a 'usb_x1' clock node exists =
and is
> +          set to non-zero, the PHY will use the 48MHZ input for the PLL.

I think we need to add clock-names property for usb_x1 at least.
I checked the other doc "renesas,du.txt".
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/display/renesas,du.txt#n31

I think we can reuse it like below:

- clock-names: Name of the clocks. This property is model-dependent.
  - R-Car Gen3 SoCs use a single functional clock. The clock doesn't need t=
o be
    named.
  - RZ/A2 uses a single functional clock as a separate dedicated 48MHz
    USB_X1 input. So, the functional clock must be named "???" and
    the USB_X1 input must be named as "usb_x1".

What do you think? I'm not sure how to be named the functional clock so tha=
t
the sample is named as "???".

Best regards,
Yoshihiro Shimoda

>  - #phy-cells: see phy-bindings.txt in the same directory, must be <1> (a=
nd
>  	      using <0> is deprecated).
>=20
> --
> 2.16.1


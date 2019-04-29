Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC42ADF1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfD2JQH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:16:07 -0400
Received: from mail-eopbgr1410104.outbound.protection.outlook.com ([40.107.141.104]:19648
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727811AbfD2JQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktxhMTsqWp4eDOHBG8lCxXy1XCtqMBbRBLr+nJT4DWM=;
 b=oTQ8U0Nsv06CxAYmMLwb8ZATzKGNHygpcRPjR/3rUWxoZE5XFk7qo+F1YuCyONRzj9eUlvLFnxb7LjB7fFDZJhsakq+67yoX0BE/CNjAHgZX8XBxAKXo1d9SOa1tMq1R6457IYzXWYNqon9bknMtMiv8brvHGs/CJ749XM1G+bA=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4424.jpnprd01.prod.outlook.com (20.179.181.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Mon, 29 Apr 2019 09:16:02 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1835.016; Mon, 29 Apr 2019
 09:16:02 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add support for
 r8a77470
Thread-Topic: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add support
 for r8a77470
Thread-Index: AQHU7615caZNSqlYBUuAi+F7WtSCZKZS991g
Date:   Mon, 29 Apr 2019 09:16:01 +0000
Message-ID: <OSBPR01MB2103DD45B93A448E2C8C6911B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
 <1554907730-14792-7-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554907730-14792-7-git-send-email-biju.das@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b08a4447-06de-4217-ba43-08d6cc834cce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4424;
x-ms-traffictypediagnostic: OSBPR01MB4424:
x-microsoft-antispam-prvs: <OSBPR01MB4424FA1A19C1BD416CF976E0B8390@OSBPR01MB4424.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(136003)(346002)(366004)(396003)(376002)(39860400002)(13464003)(189003)(199004)(11346002)(26005)(53936002)(55016002)(8936002)(8676002)(102836004)(81156014)(7736002)(81166006)(9686003)(186003)(2906002)(33656002)(4326008)(256004)(71190400001)(66066001)(446003)(3846002)(6116002)(305945005)(6246003)(25786009)(74316002)(86362001)(316002)(71200400001)(52536014)(14454004)(5660300002)(54906003)(7416002)(478600001)(68736007)(7696005)(76176011)(110136005)(53546011)(6436002)(64756008)(476003)(97736004)(44832011)(66476007)(73956011)(66556008)(6506007)(66446008)(76116006)(66946007)(99286004)(486006)(229853002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4424;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lfv9RUdaPxi1mprHiAXOGxRyQOgECvRZMzPZiuPeRuQDqFtibJ4KAIbP4o5G/a13NS/xYGUo9hn8rNrP+67kHcX+by054z6HKH8m6lFz6qzLaB4+NZZXZ4NhmVFbWijCL1XCuBEfSWlYcauy4NZNhEE3McYi9q1Jn5Ph1PGbRjA9pMVUUWWLD2aGsyqWpIXazNWz3DeUFj8g1uxBDFgZAtNcdt68hBZHn7mqNaNbg4TC3kiL7CRpIXVL1t3uKndx4fN49xNfCeQvUO1T0pwPGl3Zo3ya/u/BBObbO4jHnrMsS5Kru7kE218tnUdbK7CJEM7oUVTjXp5WvJTY2xpMbJjkFyVYlNpRIKfg4iVbwTuHYCQw1tjmivWgyy8ANKR5y+aPScrMssEvmQF6AtojeurPeIWX+/yH3hXFAc6xYNI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08a4447-06de-4217-ba43-08d6cc834cce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 09:16:01.9361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4424
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

Does this patch looks ok to you?=20

Regards,
Biju

> -----Original Message-----
> From: Biju Das <biju.das@bp.renesas.com>
> Sent: 10 April 2019 15:49
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>
> Cc: Biju Das <biju.das@bp.renesas.com>; Simon Horman
> <horms@verge.net.au>; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add support fo=
r
> r8a77470
>=20
> Document support for RZ/G1C (R8A77470) SoC.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v4-->v5
>   * No change
> v3-->v4
>   * No change
> V2-->V3
>   * No change
> V1-->V2
>   * New patch
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index d93b6a1..b8acc2a 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -6,6 +6,7 @@ Required properties:
>  	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
>  	- "renesas,usbhs-r8a7744" for r8a7744 (RZ/G1N) compatible device
>  	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
> +	- "renesas,usbhs-r8a77470" for r8a77470 (RZ/G1C) compatible device
>  	- "renesas,usbhs-r8a774a1" for r8a774a1 (RZ/G2M) compatible
> device
>  	- "renesas,usbhs-r8a774c0" for r8a774c0 (RZ/G2E) compatible device
>  	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
> --
> 2.7.4


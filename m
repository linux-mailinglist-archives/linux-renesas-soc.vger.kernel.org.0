Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF96F1E95C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfEOHsd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:48:33 -0400
Received: from mail-eopbgr1410138.outbound.protection.outlook.com ([40.107.141.138]:35712
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725876AbfEOHsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vSzbLPoBDSgYEH+Mv1tTXXLTs9PS4zgrW2Y3pZUcfg=;
 b=cta3pEguKZgM6siLbY+8XCgK5RhMfDbJQ0fDI5kA2VhBcAuAwciIJ+aJq39qWQoERRS/tmbiRZmUVlQmP3Szmw8P0QBJeqF0rE1waTyoeSm/U3qo7emzYoBV+NIqO9HbWjMuwq0urQWUHDBCtm3sv1LiCP3UKRawqwjucRDT6M8=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB3224.jpnprd01.prod.outlook.com (52.134.252.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Wed, 15 May 2019 07:48:28 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:48:28 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 10/15] usb: renesas_usbhs: support byte addressable
 CFIFO
Thread-Topic: [PATCH v3 10/15] usb: renesas_usbhs: support byte addressable
 CFIFO
Thread-Index: AQHVCmVrG6/X5i7M6EKkoR03gRcoraZr0Dkg
Date:   Wed, 15 May 2019 07:48:28 +0000
Message-ID: <OSBPR01MB3174D47DB6FFCA64733DDFF3D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-11-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-11-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00a60f49-00eb-4d12-73eb-08d6d909b80b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3224;
x-ms-traffictypediagnostic: OSBPR01MB3224:
x-microsoft-antispam-prvs: <OSBPR01MB322464E4927F681218FCA065D8090@OSBPR01MB3224.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(6436002)(81156014)(33656002)(81166006)(6246003)(74316002)(107886003)(8936002)(7416002)(53936002)(229853002)(110136005)(54906003)(316002)(478600001)(2906002)(14454004)(7736002)(102836004)(6506007)(6116002)(3846002)(99286004)(68736007)(25786009)(4326008)(4744005)(7696005)(76176011)(5660300002)(55016002)(9686003)(476003)(486006)(305945005)(66476007)(66556008)(64756008)(66446008)(76116006)(71190400001)(66946007)(73956011)(71200400001)(256004)(86362001)(26005)(186003)(11346002)(8676002)(14444005)(52536014)(66066001)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3224;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rcWTArUwLZfMklM9iiseDy4gitpFWlYVfUzdmKidiVo3uEWDDIQfjFQcjoCoNG7lq8EDdfQHHy3BvqUxlV+fawRj1gD6h6tAo4axAXFZcxHgX83azdr93UqMM4/6YaNRaiK6XrgpE8yIknK7nE6BsBvc9+66mVAPcKWobIYymjWjNVzap3g/3berZF/W8n/HAmL/28RT1QtKHcxpCeomXEqL9oTPRTnPgjMRLw8ChD6/W05i1rw2RAras0YORQc27bo5Cf4j5V3FbbNo2FPBcqtjFrQZll8KFbKfxy1rLSlixxIFsg5/TDM7hBbaRO9+raqHjouAXzEd9IYZBiVJPgrXkhpNL8GmlnGTtB3vfN5g1EYPCBKf1Xqur6JZ1OLP9FOdCmwhfskOKHnJ/4hzFCF9K6cTTzJbsvhTXxRg+5o=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a60f49-00eb-4d12-73eb-08d6d909b80b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:48:28.3666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3224
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> Some SoC have a CFIFO register that is byte addressable. This means
> when the CFIFO access is set to 32-bit, you can write 8-bit values to
> addresses CFIFO+0, CFIFO+1, CFIFO+2, CFIFO+3.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thank you for the patch!

Best regards,
Yoshihiro Shimoda


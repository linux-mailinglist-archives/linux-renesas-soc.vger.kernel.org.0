Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6306512A6F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Dec 2019 10:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbfLYJdK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Dec 2019 04:33:10 -0500
Received: from mail-eopbgr1410099.outbound.protection.outlook.com ([40.107.141.99]:48452
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726106AbfLYJdK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Dec 2019 04:33:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfWrySvvDZT+UxofzGpWLVa/R8waN8XZFixTy5HqC3+b5XPhqAO25HvzdfgmOwK5567JnRKk7qCjla5M8nRf2v5sH1XvEqYIHlC/gipB2T5aXRV1Be1gSciSapiSvb4EqAdKhs+zMwGJxVso3Siv72Vpd5fF10AJo+286iH8c2X6pLfBRPr7D/WHHv3Jod8ZRuqsVRt4B9ogCEkJKvDi9TdXculo16VIVO2E/h+qa6zgjhq58sojHur+67l2SdfGKYqlKbHctc70XQSQvIGjnI1zBzOo+py6nUUW9XxG9/MP1KrChNtNcjl8pj/w2HnC26kNGXtlj+6LvoTfU89pAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8O1GbGQeGaqAKHVhp6sl97HpGBboNyKyyjrgaj0oGg=;
 b=kxm0swbkUwDJZe1daB9w1OTkz1S1bgdXjfy/ZdJKsqp3rKoCgM8j9R+3az8+sMJ3lYdn9CsGLGlT12zFgHJRb9cofY6ZjulzibA9oQbTVLDb7eLSipUH7oDeJUOoZbglHEViCILFDClwl4ZygwwrOh7uiWlJXtme0svPIBWUpnUROQ0VFiVK2SE7CKsOHvUqxdYo/zEpnxF1V4pk6lII45GZJzSjhDcU5/m5ARe6alUbxUzMnE8bnGhbwLAlLHr/CWpV5CSEWjcrut+wXJhF+IyM+eWdUAbN7k6a33jX4ZCCpOcBY7IXY+CUlnrZ1hpJvc030Xhy7FnvzbJ/RtR7rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8O1GbGQeGaqAKHVhp6sl97HpGBboNyKyyjrgaj0oGg=;
 b=bI5sX2XXcLoApijhZ2edbxw3/ZnTsi0bwz1HOuKDGQBSYK6iOxeTqX67rEPbO/faFL8GBrREq1+/k4PYHuI16lzavXCrh4FhJPABEgOZkepvtTNmj+3oKv/RntK458jdKOHwjpSjI7WYdsKYTt/2de7+inGVDx62jf0yUeXUpIs=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB2160.jpnprd01.prod.outlook.com (52.133.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 25 Dec 2019 09:33:03 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::7d2d:4b8a:a48e:d84c%4]) with mapi id 15.20.2559.017; Wed, 25 Dec 2019
 09:33:03 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 0/5] arm64: renesas: Split/rename R-Car H3 support
Thread-Topic: [PATCH 0/5] arm64: renesas: Split/rename R-Car H3 support
Thread-Index: AQHVtQk6r2eVsbXw90yeluKp9FBAqqfKoWWg
Date:   Wed, 25 Dec 2019 09:33:03 +0000
Message-ID: <TYAPR01MB4544C175EED7C9D94168D321D8280@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191217183841.432-1-geert+renesas@glider.be>
In-Reply-To: <20191217183841.432-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4c14199a-2f3f-4b74-0bb8-08d7891d70b9
x-ms-traffictypediagnostic: TYAPR01MB2160:|TYAPR01MB2160:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB2160B98E01ECA57DD5E2208AD8280@TYAPR01MB2160.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02622CEF0A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(53754006)(199004)(189003)(110136005)(6506007)(26005)(186003)(66946007)(33656002)(66476007)(7696005)(64756008)(66556008)(66446008)(86362001)(76116006)(4326008)(8936002)(316002)(54906003)(5660300002)(55016002)(52536014)(8676002)(9686003)(81166006)(478600001)(71200400001)(2906002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2160;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9MgF906jczYg8lal/wJ8zG8V1n6X8Jm7mDLeBXdunYGEUoUMjYzmB/0QEigzYNVpqt7MrqDdrF7S7HPhY1B3Zw67nXU3DDsxXad+CCrVdyt8GgIh93gN3x/OFLuM6T1Ud9HXeEH9BwtNOYge6A+cml+waI/nwRN7itU+C09kgWW4yZM7KiGMkzpmy0369WCkoTOz386pc/dBK1J9yFcnj0ccER4MWjn/STnx+dvHlB6k0l5Udxji9m05+6Op5MtNNBzr+MzuUlWwRjwtmlySlEZLYM9VOERfABEcg6jJeMmqaRSd82hNljJmMfsArbN69CoDQaShGhKVCQzFv/vTwN1K11cv2sSBP2Z01Eh6wfEAh4PKJh20s6VJINJyigzgn1KbntUdsbBZrCuD6pKrsXps3Q2iEIklhTf8DxP0za2HIiXBnyP7Kq1HQzjbFLCWz6RbF0WantAof86LzVUQLZsE3e3kVVOc90Sr9vACDJP/gTpNFv6tPPxkBr9KpCm1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c14199a-2f3f-4b74-0bb8-08d7891d70b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2019 09:33:03.2487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVnwo+bMsfGPHLiSMathwycI1pQc5e7mHZ0dAApVePwA2FaxXuhyolt8Gg8k5w6iL16I6sI5C47Qa/iZg+9Bgz0IgATUjgp+OETX+17AbkxwZer5pCK/cEaqJ1UbjlEG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2160
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, December 18, 2019 3:39 AM
>=20
> 	Hi all,
>=20
> Despite using the same compatible values ("r8a7795"-based) because of
> historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
> (R8A77951) are really different SoCs, with different part numbers.
>=20
> Hence this patch series splits the config symbols for R-Car H3, and
> renames the related DTS files, to maintain a clear separation between
> early (ES1.x) and later (ES2.0+) SoC revisions.  This will pave the way
> for configuring out support for early SoC revisions, which can reduce
> kernel size, especially in the pin control subsystem.
> This is similar to the recent split of R8A7796 symbols for R-Car M3-W
> (R8A77960) and M3-W+ (R8A77961)[1], and the related DTS file renames[2],
> but different due to the sharing of compatible values between R-Car H3
> ES1.x and H3 ES2.0+.
>=20
> This series also includes the rename/cleanup of the ULCB DTS file names,
> as suggested by Eugeniu Rosca.  As DTS files are already being renamed
> for v5.6[2], it makes sense to combine them with other renames, to avoid
> inconveniencing the user with multiple renames in multiple kernel
> versions.
>=20
> The pin control part will be handled in a separate patch.
>=20
> For your convenience, all of this is available in the
> topic/r8a7795-rename-v1 branch of my renesas-drivers git repository at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.
>=20
> Thanks for your comments!

Thank you for the patches!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Also I tested on both R-Car H3 ES1.1 Salvator-X and R-Car H3 ES3.0 Salvator=
-XS,
and the kernel can boot on these boards. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


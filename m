Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F97398071
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jun 2021 06:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhFBEnn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Jun 2021 00:43:43 -0400
Received: from mail-eopbgr1410097.outbound.protection.outlook.com ([40.107.141.97]:6326
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229524AbhFBEnn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 00:43:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfkZG8LG09fUkev9L5xMgubVc6Vs9oUIUqvwM2lnDmQVAIJqZ/mwCyLVtZpLc03qM8fKGoiSzZZ98pq6NjjY/BY9CCLX/e7CY3weJ/jS3EebboiCUr9AT97wyU8N8cppR58ZyfqndXTgpU0wm3hsA1rvECJ0JxMFCtVAQCUQzkPA0zRomtNZtePkl/1GcpnVT35SrFhJeOkJ8EazSkwnEw0gXpqORzCnPeDB2gq/PThC1C1FZVyM6Y3svKe8y//f/kOCBPeQOIYvClJ6DLHnsBQMY76cb4wBpo1BfPlVTPsm49lzWDIgprVur7bu+2b0Hq2bbyBneq/aQxe8Xs4A3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiTLPetYhsqBFYOBS4JPSUUzvhPbBeRGNszEbQsnwQs=;
 b=Us9t7kOQVuHp3XqowJUEcJwlDnlOKTjhdbNkWYPWP5iNPZbSTotxiw4KuKvfIRlpn/4khJIgNfEl1ZseCl6U2T4QwdxZIhOeX1QpISZGr8XFgRAdlx64OJ9qY5tlHPcoIhoqQuvp/8KIzK+/5yHix9lEVg2DnGHgOWX1HdVRMOsGMLhxmJ2YCVcjnsGmwf8m3Crz9K/t0IIWLrdE2k9/MLikUTHxjNZoEkl3qo5go9/25syqerxn4u0SG7OSTwI9+9sXxQR2uMqWQBu0Xp9QF3upFLij29wnxoDFRSSrwR6cOhnXtb3MfLSYjtVqmJZOrE5ABK4VSH3+L0ZJEv9P0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiTLPetYhsqBFYOBS4JPSUUzvhPbBeRGNszEbQsnwQs=;
 b=YMHqinZ8OJHi79qxlD62ZR1jsSaf/S8I2EMUWW4AbPzMpNIrkzVyh4/O2OUud2AFFtjZyutQXi3sfiTOHFL+ZfyIQmB/KXXc8Jw8p4i0Pjr36+LdKotaYOPauig6O0amkzytRSeX3BC5y3bmqRf8FOcm5orQB/TD6blCA8Eh1aQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4304.jpnprd01.prod.outlook.com (2603:1096:404:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Wed, 2 Jun
 2021 04:41:59 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 04:41:58 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a779a0: Drop power-domains
 property from GIC node
Thread-Topic: [PATCH] arm64: dts: renesas: r8a779a0: Drop power-domains
 property from GIC node
Thread-Index: AQHXVviaKxsjRYYrSEyWxhOMEiVrh6sAHXtw
Date:   Wed, 2 Jun 2021 04:41:58 +0000
Message-ID: <TY2PR01MB3692BF6B198BBFCABDC48679D83D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <a9ae5cbc7c586bf2c6b18ddc665ad7051bd1d206.1622560236.git.geert+renesas@glider.be>
In-Reply-To: <a9ae5cbc7c586bf2c6b18ddc665ad7051bd1d206.1622560236.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9db639a8-7226-4bae-4908-08d92580c1f7
x-ms-traffictypediagnostic: TYAPR01MB4304:
x-microsoft-antispam-prvs: <TYAPR01MB4304CEA5F48A811421C45762D83D9@TYAPR01MB4304.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rxSeZOzTQeVA+9FwyzX1KZSSS6SG6RDfbbHiejhC0u0I7LEnYPuJIvgXJhXY2dNGQE5E4XrwmU+J0zKFANABwzsWO2KW5MfMofsdPzbDEYfXIRQkVmPYewpeFRr1IWj9a65BiTwPGyfCrZzTifam8E/nG378cQGGV4qyz5peuKVhhVsjcYfjHPgtEWMSS7Q1VbZDfRF59iUuLIGicJY9CyrVhJ6SRyPueeCQsxYqam7LIDEoxkO8vpItWgxlVKBr2SEzglie2H/biuSOvp4WtYvcFvougl2YlOWmmiR6sF/1OsABt86ucfglnLW/8RQoCnzg4eTtJ5FBVS7fAwtmJ3JwP9PjHTDAdzmX9DuMaj3C/o+fMMQWx5q9nXwWgDOBvxcojzJZnCGIUfV70MKTzoXGYuEM1YfrQyW89ErD17XED18Nb3gEJMfg3Br4YVJXLY50tXMw5xBiyWRrs6QyYDsX9uN/WFnr3kpDSG16vKV7TDrDKPwvp1HbDPRHJ+oBsTW4ZscpIje+FMT1iAEIDdcqIswCNrIYaXJci5cdj81/XT6Kd5o5f4IZv2WlRTm1P2y0BhJyAgq3lV5EPH7dFQS/vq3Yov5rdGrcfmIgvgI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(7696005)(55016002)(71200400001)(66446008)(66946007)(52536014)(316002)(4744005)(55236004)(478600001)(9686003)(76116006)(8676002)(64756008)(54906003)(66556008)(33656002)(110136005)(8936002)(83380400001)(86362001)(6506007)(38100700002)(2906002)(122000001)(5660300002)(26005)(186003)(66476007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?P4bhN1hgwZ7UD089tCqnHOBMovG+BpHDf9If0sOQT7Tt+/1ahYDr5K+Z2cs/?=
 =?us-ascii?Q?mdzFuTRx3nIXgkH4yypcP2nayG075PVT7xMZ+dk+iQTufUn2Qf3GP2ukI4YC?=
 =?us-ascii?Q?aWqO75n8q+okfDsmWX07rN4mqwQpjkr9DmGRvT/I+aO0f1gqxl3KirTat9Wu?=
 =?us-ascii?Q?sUTkXuCon7zfQU3SWuCvq+b5BPABY8Ek6/COpTMHMgPs6dFrpbC3/GHG7XkO?=
 =?us-ascii?Q?WvfXuAT0N/Nn/9Z4QZOuWP39vAX9JmOzFN3XGw4+5+zfaylLUiBwpe4/xyoi?=
 =?us-ascii?Q?egqmLcJCqfuI/UnDtGXKypW7DJ7iZeHSxvpJ6Xy35XnXlS9DdiB8x6vBh3M6?=
 =?us-ascii?Q?z0MlzXzQ+iovqDdYlCvPe/z3b2tjRdcvvVESNs8KSkWLemeg37JgGT9PB7pD?=
 =?us-ascii?Q?3RgKYeB2eiuQpuIiwvZF51Dnnx7V8SedWOk8fw65DiDejNHuoxDoQglKE9A4?=
 =?us-ascii?Q?IXWgB/6LUCgDk8OZ2AKh/EBmYa9wNLHRJOneRyB1ozJk4C77Certl3Yd8sEd?=
 =?us-ascii?Q?BGawwwJjs9RGJp8ZIpowy2YGcSi0GI3R/60ISZFKNXKXMJRftmKmNdT7vRia?=
 =?us-ascii?Q?UydIplUlL2lyrCXOLeixpUoQq/9QeSbsD1SUgjbKMWeUKnmYr/gzGT6cnynL?=
 =?us-ascii?Q?1B14l0dmeD0ZWXa70AxvvAtKWcnz/Y/f4p8nBVk4iUSZEFuGLRwNb755tAnn?=
 =?us-ascii?Q?Iuts743KP6+xMNJbWhzEbrcZsfpjxqRSeL8NcUiTdLihJnO4aNbYZxM0XK+A?=
 =?us-ascii?Q?waiPuMC2AJ7xAWy0fa3SMzoFbVGzmZGUgOdqPG0gGuj5Hnn8OwrI0xitvMHS?=
 =?us-ascii?Q?Efy5VfJFfJhC+1QKPsFtsbsUo4lBf5WkIf8oZMJFRuRptOFTp+j0w1hkBMI+?=
 =?us-ascii?Q?4MdvTpUBK213MiMDXEzFjTs1a5DW+IxPntCgDiKalgo+75ceChxpLIuAelw3?=
 =?us-ascii?Q?rW4335TGxmSwhesPvlsUsYyUb5ZocLbIKXNvIG5JkDaVrZbSjJqLz1xK68PR?=
 =?us-ascii?Q?rAm6CgFJ0E0WrczmX0mvu5peE6WukUxQ7JIfSdojoaI0+6DwLhUeVTSep4Lj?=
 =?us-ascii?Q?H2ICzcuTFQ3A1xx7UM3NZOnogHinZfWQQwlIfRtwtBRDayrJ89MJqEm/7yxa?=
 =?us-ascii?Q?fhxUeXkubhaDt5WRw1rpYHRZ3vY5sY2QWu7qo/aE4wq+Fx7gKMu5e49FhS9Q?=
 =?us-ascii?Q?a+JSoinvrOlRytZ0a8V+tzyUHhnJugnqW0r5fGwAsMkESqKqQImFttKM+VK0?=
 =?us-ascii?Q?/aA4JFtv/NcKeg/NB1KEySLZWrYGpyj47/bVEUrmjBXgsV77OXkeL+jUWM58?=
 =?us-ascii?Q?pUJYhj49DENf68+BtL0VYd/3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db639a8-7226-4bae-4908-08d92580c1f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 04:41:58.8377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tf0xL3TDpvC4V3UVVVWOjZAos7Yfo2nIufLRRFuKs4quy5Eclk89WkCBjh5d5dJfwX7st59RN3GJf/ktSJ0qET1GJn0PCLGU0arQNLk8UbrlVAwPv6Exyk0AYV3pSWJ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4304
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, June 2, 2021 12:13 AM
>=20
> "make dtbs_check":
>=20
>     arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: interrupt-controller@=
f1000000: 'power-domains' does not match any
> of the regexes: '^(msi-controller|gic-its|interrupt-controller)@[0-9a-f]+=
$', '^gic-its@',
> '^interrupt-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 	    From schema: Documentation/devicetree/bindings/interrupt-controller/=
arm,gic-v3.yaml
>=20
> Remove the "power-domains" property, as the GIC on R-Car V3U is
> always-on, and not part of a clock domain.
>=20
> Fixes: 834c310f541839b6 ("arm64: dts: renesas: Add Renesas R8A779A0 SoC s=
upport")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


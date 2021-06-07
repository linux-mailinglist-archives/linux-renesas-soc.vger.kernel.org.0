Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671A939D27F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jun 2021 03:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFGBKi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Jun 2021 21:10:38 -0400
Received: from mail-eopbgr1410090.outbound.protection.outlook.com ([40.107.141.90]:24344
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229884AbhFGBKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Jun 2021 21:10:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzGgH2sTJCgEKFDQRT2eh4kplSWeZLxK3C1JG5q/I4v+PfexNZ60odvMZt7YBZHUOGO3rST8zbJpH/CICZxP9WOmKTjyoQQ68WAmbN2jZon+NmLrMZVc2xeCE0dtuAe8qkh8b1BxnwgNy8MBS+VIHSHDdYGr42iXaTET9GVHveyXatreZyvwRbKqZCBwf74VheRujFYzrmM9JNgrYJLoWaZEgZJOPe0ffcYp0/R6HXVHN9H13LNM0RQs5Fy55tlXV5JEyrTpBFbyEPENUBTUTVEAdaIDnTJJs1lnL33bax6M9TjRM7ASKyUjInvOquUJ06r3CtNS3nJhwhrYWUQetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhZ1cYjEBNFbueQwbLPkts2PBtpp/jhBc7ZmzamQsVI=;
 b=m6SpQVgFcfJiN/DKKsfF87HCiwFfy8w5uOpcnc16jJMo5bD1hkzKDWO4yyBszDVq48QAOO3zMBslUvhtJB2+aC1GAhdV7HOJ4vWreguGycQWKDSToYZ50K/3iFvUibTBjE2YwDdgtDVqt+dtPqNx9RuRm8pXZ4QXU89Ix14W7RNCJvg3lDsMfiH4q7U4Ck4tLv+iXodXkrzlbfoKlzLYs7Blv14x507KJ01ZewgtU2d7CrFmWZdEPAWb3rt8tx6tLfDZ4lCq6EgpGC2tPoVknyLmnR4nywEwx716aCGTHwthRZAq5IZ2Kvpyt7VF0uoTHJMJliUK+QWKE39/Hz8rGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhZ1cYjEBNFbueQwbLPkts2PBtpp/jhBc7ZmzamQsVI=;
 b=gcRNaUBUe6nx0ISq/8T8Pv0H8rFZgbA5+77SxzbxESzS0EuHtUSp2VsQkvebmfAEb+kkeL9U/I+o2iRajNxRz36NYSd4UgGRQhIxuKbop0rPsYAkOykIXq+FMQpdE56CyL7gsyfYtA0zYGk5VX87DFCkUh20Y5EJid4tNTCkGeM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYYPR01MB6826.jpnprd01.prod.outlook.com (2603:1096:400:d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 01:08:45 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 01:08:45 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC:     Takeshi Saito <takeshi.saito.xv@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: Fix HS400 on R-Car M3-W+
Thread-Topic: [PATCH] mmc: renesas_sdhi: Fix HS400 on R-Car M3-W+
Thread-Index: AQHXWUGI3tt4XdiKaEif6PloKqjyDasHwJrw
Date:   Mon, 7 Jun 2021 01:08:44 +0000
Message-ID: <TY2PR01MB36922A503664D1922C5AA92DD8389@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <ee8af5d631f5331139ffea714539030d97352e93.1622811525.git.geert+renesas@glider.be>
In-Reply-To: <ee8af5d631f5331139ffea714539030d97352e93.1622811525.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:1558:d4b0:2481:8988]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd5354bb-d308-425f-4812-08d92950cc56
x-ms-traffictypediagnostic: TYYPR01MB6826:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYYPR01MB682675DA0EFA2F64DE809D3BD8389@TYYPR01MB6826.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zd9VTbhmGBmd1uyVjma+kx1JWWnrLV+lsClkHW/RYLAZO6c8HV7RHpgm5YUWZ2QTHp1hyzGOCzwj354mE7vdmDDqNWm1wqpayolUAKSaWOI6qzaVzGnQ/g+OlxX0wHfu2KuUvDaiqKncNa3Gn7pD17hm/kUH6c85C/6W6OE3xpJ/jFbVWl3r+0rHuPoUuWC7e8hR2YgicUXZloSn1C2ziJlmkHP8kaXtalO5AsMT0Y5t6RC3HWlLEgDmnnzZ2flPsNBLW8Srov5wAOu1Bkq6dPh3CIm62nWPPvra8oWx8Z53rnarjwpYwg449qxP0Cdss4iteLaSF6fQfdmXrucYkS06YuIJc4vPdmD9osGvOiK1PzaBxgwEXTP/6Ihrws2e4BrW5thNJIdE4+c2/zdkFH3FR9evRzKwOTVeHouUo7tlci89CDowKk7O9QVQMsZDHRprXqZwpclnn95Oc3N68Yd7f2+1M19R6T1AtN0RrY1QndMlh8vLHICNXTiFqEIZY6903fHiQk2xOHMy22ePMgOx/7rutrRgiAw9lfJVCJ/41aECqPniSoJU7Pl4EaQRVWHoK0ZmRQeUMngvDLNWKFurLUF8PTqLxC5NTTqk8QU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(2906002)(110136005)(5660300002)(54906003)(4326008)(86362001)(7696005)(8676002)(76116006)(6506007)(122000001)(52536014)(38100700002)(64756008)(66446008)(55016002)(66946007)(316002)(33656002)(71200400001)(8936002)(4744005)(478600001)(186003)(66556008)(9686003)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+X8dibZyWVEK+F3QTcsU9fk3al8fVMbBgZIXINKVnIywxnN4kiFZFlaF1Yy6?=
 =?us-ascii?Q?f22YWe0mMF4fz0RaCNfP+CskJYgcqyqlrS44eMgOvKXXYBC/x4yRJKZiWxO9?=
 =?us-ascii?Q?kXVNLalsSyKaF6IqaCnWTsmZeU/S4wzK5siKDUzuGBAtjgfCHWnePFl4HTno?=
 =?us-ascii?Q?WNvvaDqBNJ08Ip0jX3PJMZKLsboFTO0Xk3v0sB4PLMHpahvSnFPmVHLQ1VSq?=
 =?us-ascii?Q?Pe0rNR5STxfaV03qMAac3f52WGmA34veeP2u/kW6pHe04hWUYsZ6DApb+Lre?=
 =?us-ascii?Q?LiqIIpNqKuU89k9Gsz/xueg4GBp3VdA1sFMDw19nBFqW7XdVQZdr/Nx/Kge3?=
 =?us-ascii?Q?c3NMLk/FDj086fLuIQ5DNVPB/CsZpZ4xtNqBzvBEGa0UgmZRPoo2ZEtXMfm3?=
 =?us-ascii?Q?hVGhtJDRgWchuOXMSy2YRfPY1jGLkR6ZRthu4ETARknJaittiEhGwPyU677W?=
 =?us-ascii?Q?Z1+6s8mEPjSNE/1P/x0YMN9PADqQMWU8nS6WJBWFrOHbUEp252CRg+7QYu8J?=
 =?us-ascii?Q?XHHLFnDBldpkGULoDp/K4z9Hmx8N9DCdXYaNfX16KjlMzWgOTEr1uVg7Ph9i?=
 =?us-ascii?Q?Qx8at/HBKunCbyOtzUGQAdFhppxfzikM9Lex26NpzSe/zLj9yStLkvWvWB95?=
 =?us-ascii?Q?IqoRTYLmViLbZqb8tq/qeuAL/y28u3+KsLCxfWbxyfGrq/KyKWuLA3cAgrvN?=
 =?us-ascii?Q?5UIAiioxIDMlX1zHxclyGYJTEAzpOmY3r4snC+CYPkRGSQtkEwmoDwc6Hpou?=
 =?us-ascii?Q?TSQDBagg3DSdvZNxVX8QqQ7MhvC0RUPOEziYcav8NI1LKbom19+eGV9XGMlC?=
 =?us-ascii?Q?EXC5H+m4zJ3aKW4BY7m2IsmLSGVJ7uoSxauj867Sg1UG3kyW7qs/V2id0/Xe?=
 =?us-ascii?Q?W0K8ZIBmALysLyzvf1FvyDiGOhDPcIzCUIlBkr2Bv5m9J5RQa8TYDMVMgdlk?=
 =?us-ascii?Q?5QeIGfvCHLWmDVwPAzMHysIepdfEXuH0/ITbA3gYTaRtvv4/F/5DM4DYv5Hh?=
 =?us-ascii?Q?9DSgSZJQPcHpBdKDO7BKL6TwmLnxsck/K9eArS3Amj+y5PQzGhOetTWTDbA+?=
 =?us-ascii?Q?fcVMXTU54BnlOKmou6nfot7Ie0xDq6K1DjM1IVm/ofsbMRjuWYRJPanZuuZV?=
 =?us-ascii?Q?AC2WImYmsoj6el3vVT05idD8IGofxp8L9AmtBUnumG3aU1UBrr0FKXOLltWK?=
 =?us-ascii?Q?3HoHQuqnr9y3CaykXt/evSjeJ2MTYav7hr1beLRaIs58FJQ2YFdAx5MOL9f5?=
 =?us-ascii?Q?85gZz2Q4gfSCnmnPi3tYO+RSBH1G8LGUZOw6gOdR7ry8ZTygxqb99rJw6rsu?=
 =?us-ascii?Q?3cUAsiWOnBO+0Ln4gSaXuGw5LUP3x8sDWgJp7kFWzozrvwFX4ohnnvvmzckz?=
 =?us-ascii?Q?B/x7rGY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5354bb-d308-425f-4812-08d92950cc56
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 01:08:45.0016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNgkYuJExGAeNKU/oN29f4ImzlCKlCd2frdQaCt1RlNoTDYGl0TDfJCOg9HvRWErINTD7EPNTz8wJ0niEsfGbzwg89hDDBUNzSp46BQQmNpt6aVHmJvhbikbhAwl8NG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6826
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Friday, June 4, 2021 10:00 PM
>=20
> R-Car M3-W ES3.0 is marketed as R-Car M3-W+ (R8A77961), and has its own
> compatible value "renesas,r8a77961".
>=20
> Hence using soc_device_match() with soc_id =3D "r8a7796" and revision =3D
> "ES3.*" does not actually match running on an R-Car M3-W+ SoC.
>=20
> Fix this by matching with soc_id =3D "r8a77961" instead.
>=20
> Fixes: a38c078fea0b1393 ("mmc: renesas_sdhi: Avoid bad TAP in HS400")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


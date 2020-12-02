Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767C02CBDF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Dec 2020 14:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730201AbgLBNJB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Dec 2020 08:09:01 -0500
Received: from mail-eopbgr1400131.outbound.protection.outlook.com ([40.107.140.131]:25872
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726875AbgLBNI7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Dec 2020 08:08:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKtmsNxKxTtmF/5x13MUZRI8QDyXs3lG83QHT5eonPyLl34LhXN1f60KegqH/BJ/BhgJtZkR/i1ajWFqM36UpV/Lf6vmB567HiwYI9gMs4F3dU4znfRu9qnE3EjHT0ex5AUHkVqoTmBIlYyAwc7maoLVWA8QzQY0H0mcnaFNT2OT0kG94YI46G1uT277R8S2Qbiaz22umXhnwj2iRcCpBxNddpTtXcyPPBpEwyvv8Zs3HXxjhjtI2t/sw8GNFNPWSnAiVfd1+pWsPE2iIIe4bWljEQ95dyOrRYwW9th8wpd/eg42I4Y197A9hUhNC9HW5LBBQyIYrtjhLNkB5hg4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ88iOj8XjUEO58Q5+4hGScqxjgxZkKtYqYhkZ7EDn8=;
 b=m1lmSGmhNx0+BR1MVKOLg4zEPIbXH/ibtS0RUA8EoLnhGvp6cMEvaHHgdhEtrcS3QaAzLJ1taqDJhGFY39kf5RkQnYxNcwJK/aBVzm1KEIbxggtJ0PyA1Jyhfi8ZT/4sXL0x07jWwneejqFhy0VW9LEIg4McHx+VI+HhFFX9epXVT+1MeWyk5fFeCmXM4G17VP/T56UdPvsSrb+YWMTYX2n6S1bRlvZEJCk2Pwmhviah8Tw/eNY5xK8dgBMiIN9ixGOy6id6WG+srKpmZqbmJK08UNVJVquQ14uaIb9uAa3ATfdMMAX1BdQpmyWKXlwXJkp7LwceQE8R7zrz0RRQwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJ88iOj8XjUEO58Q5+4hGScqxjgxZkKtYqYhkZ7EDn8=;
 b=s5o5W8HTrJVj82ZB55t8Wm2SYow5tDrmoUOhxq9xAEzXysaztSSUM708nbLPjYtHxFAaJ7MiC1TZwmleFnc0QnIQg4nRBzBD49wJthyoMB0aqiH1AQEn3vLYjQQCzl2EzBYGh6lDL9oiyuPIqRxAkmYfup0PVs/PXTSLiUE93OM=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5277.jpnprd01.prod.outlook.com (2603:1096:404:c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 13:08:09 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3611.032; Wed, 2 Dec 2020
 13:08:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] tmio: set max_busy_timeout
Thread-Topic: [PATCH 0/3] tmio: set max_busy_timeout
Thread-Index: AQHWw3Itbd0ZmyjsF0mpbnRxkgxzWKnj0DIg
Date:   Wed, 2 Dec 2020 13:08:08 +0000
Message-ID: <TY2PR01MB3692AAE65A75EC48A4CC50E9D8F30@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20201125213001.15003-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201125213001.15003-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:5971:87d:47f0:7231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4990cf90-f8fe-45a6-d0cf-08d896c350e1
x-ms-traffictypediagnostic: TYAPR01MB5277:
x-microsoft-antispam-prvs: <TYAPR01MB5277186B9D8DFAB432D2D157D8F30@TYAPR01MB5277.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LncX1pogUpryzhpLiBnjlmlkc4JDTUdHDFb031K0tLaaFlyIEepJTdtLNboTUPOxis3oS1PNNPKIkSOxT5Lp0ElaNwJOpp+wwYmmmivX1CdcpyCcGQTN4ZfQ1sXjDYRs/DXBSc0kpo8EZmeRWvQ20ffUGzeV2J2lWfjaTQVzfwLQMweZuVIEA5+CkWAsJajhglmmqSUgJZmNLuUbqBXYlrBunMGrIaC40YPUM0GUpfPk5iX02CqzDnKnLQFQYbe5s834d5hkA9qWYGSJvX6wdVIVDEgOlpzQ+JnmcNfFlUG1ov5P1pTIvob62O7m9uJkbEX+v7ODkk8rgTlK+A1x1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(2906002)(66946007)(66476007)(66556008)(52536014)(66446008)(64756008)(5660300002)(86362001)(76116006)(316002)(83380400001)(110136005)(55016002)(9686003)(6506007)(186003)(7696005)(4326008)(33656002)(478600001)(8936002)(8676002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JOg1o5Q3jxcomdzxnzmfgDK9LV6DVDY+SJy3VnAxr4r9grMbXF5Bl/jln3Qd?=
 =?us-ascii?Q?o+AikdmgFqhHRWacBlO+xdrXcSIKvmnxP5GU5gkV2/G3S9SHG+oQNXdbzyoR?=
 =?us-ascii?Q?7WVSNBcp0v4P3ssjzR+tra/i1G7T7hX6jiFjQI7L5odl0dzxvrBEUnldIULf?=
 =?us-ascii?Q?Ejf+YL91KH4rcw0SXpwqTxbqgE+/0WLdzcNbGsYb7OJYfW65U20hns7zvMeo?=
 =?us-ascii?Q?ZgT6sQ50Q7RAJpjnXFAvk3mlKgkZcji6qDynV7cgB4mvt4FWKAyQ2Atc1c3m?=
 =?us-ascii?Q?6jp4II1lKQHhhLp8ySYx2Fqc1VYqWbIa4YLfTFnxRzBsMsMtrge/4jocYX53?=
 =?us-ascii?Q?RmfzqJuVm10LOHmDpPrlGhVFSKZXVWMcd+2GYmDlPkZrbkp8fMvXHQANJOrw?=
 =?us-ascii?Q?Yodn1IKo8JQMFhxBfauE/VR7bA8i71t/tPzgXq09AlMT7Waf6yXPrGXFHWZU?=
 =?us-ascii?Q?X+e2Pm1Y8x6ENX+NYqQd2P5HJw1uCXv8I7Xst99QDs3IGiG2HALAoc8USpty?=
 =?us-ascii?Q?F0zcapCWr6O/ktbPxwKIfOwFS/oYhdFo9Xp1La9MaAIIM7zRQBYWxXbgURdc?=
 =?us-ascii?Q?KXlnf29BOpWOH6IX8PmNp6vcSKewNMTvl2kiYenIHSjmiKR8PVpNtausIwUR?=
 =?us-ascii?Q?9VHxUI2st6ksYEVQRzRQ8Ry4Bgy6kcHuoCLMEBUIqOZNdERzf+tXy2ggEhbA?=
 =?us-ascii?Q?qwHkP2+h/qQzEpzSmS23DDDy8NlXob11sJXZz6mYegKXkW5gQ7GMNqowc6PY?=
 =?us-ascii?Q?X0I9HwzGw95sF76Xeg8gpddO5/UXq0uP4CMF5wNapeIchAQe0cmp7bsLCqhn?=
 =?us-ascii?Q?npuQ518I8TbY/UxgSUvGLh2CrQiHoPfQ4g91sL21SksjnHrFZeg4ooEpZeXB?=
 =?us-ascii?Q?MYRmuFZP1p/e21r4yE5odPf/kzkn55n71KO0bq8YTZBl5cn/Hav16VqUrwMa?=
 =?us-ascii?Q?SaQyMHHeoBgmqYOYD9mnBY0hS4QWcbtNmEU8D6G2SsJcNrQlKf86ukfB4Ve9?=
 =?us-ascii?Q?g4qr9SzqriFBEWK7h2Yiyv8cjh0Dox2AQADatL2+tftkVvk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4990cf90-f8fe-45a6-d0cf-08d896c350e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 13:08:09.1101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YP3LSCWLUTu+mCloBqABIGsaR4YduxqlNyArwKJ+BvoUDd7VNk8VcdCqFvQ9aG4P8tYDqqo4oaazxnZ/2lBxtznni0B44zl3bdgsGPU/n5BKzgPJ9FrCnVc5vSjzCUQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5277
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, November 26, 2020 6:30 AM
>=20
> This is a follow-up to the series "mmc: tmio: honor busy timeouts
> properly" which I sent out a few days ago. One of the patches there
> needs more discussion, so I regrouped the series with another one, and
> this is the first outcome. It is solely about max_busy_timeout:
>=20
> Patch 1 is from the previous series (with the comment from Shimoda-san
> addressed) and sets max_busy_timeout with what TMIO always did. Patch 2
> introduces a hook and a default fallback for extended timeout ranges.
> Patch 3 uses the hook for the extended range of R-Car Gen3 SDHIs.
>=20
> It has been tested that the applied values make sense. I have not
> measured if the MMC core really sends R1 instead of R1B when the desired
> timeout value is exceeded. All on a Salvator-XS with R-Car M3N.

Thank you for the patch! I tested on Salvator-XS with R-Car H3 and
I checked the MMC core use R1 instead of R1B by using an additional
printk on mmc_do_erase().

So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


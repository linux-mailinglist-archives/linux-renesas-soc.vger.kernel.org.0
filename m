Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF822D5EC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Dec 2020 15:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgLJO6S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Dec 2020 09:58:18 -0500
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:11838
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732006AbgLJO6P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 09:58:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNye91TPU5EY1SHAOF/5PFa9JsQNR6camBIDfHyFuDgOsW/KFhPxFTmMt6s7f0rxF1OIv53NwFh0yreQPv53OrtBgvPuRgPZ5ZUx2WxpKHmw5jA5i0Cr3y3E1V1Yali+VX1DydQefGYjxklUjELo0g9pybtu+/wav4paYNLs8MHtOem1KAL8/KyIyopWPRXPxDG7TcziRmxze6DH4k9qtNOX/IF3fwxmrEi91Rq4vgBnfaz8LDO9MokjJgjtjGZQlBNmZa99l4/Ao7CPqu+U7ze2EPoCjckY+BVK2zacF40nkcVZRZWT6/hP/Q45TXbEfT5GoLtX0vxl+UMw5KT8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCDm9bAge9b4Xtgm2RHMWLYzhdUrdllhbe4vI/zcvF4=;
 b=b8rfxVb0zS6KmkRJPrcKEp+5FE6Vi/JGA3mRJflC3ATbJMNvoWC7ItMLAf1PXa2oeG1k9gvErwllsUtQXSshcTpXJ3du5zk6LG4MDhM76kOZaFBj8DfIGP0j9VP2Dq72V+bf0l+EDSfbN1XNC5/4loKBouB/iAeB5F6X+SQRgx3vmwCj2PyzahPBkEDkBTWsZs6bvXkp3AlTIKP+me4C46zQPe/jTqB4AEiuTScgLSAGYVMMDivRo5/9gzZi/UCnzsPL9EXXmzucLFsOexl2lLcJ5og0BvCZxf2Eow58Z2JLpEkXyp/JfhGviMyPGFwEx+u6iwSDNgBAQbYLhmLoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCDm9bAge9b4Xtgm2RHMWLYzhdUrdllhbe4vI/zcvF4=;
 b=fisEBglO2Lk75zH3tRdh419YcOfsI6IjHMZzLR8f01qs2SZFd7KutXTv80OlBJpYQjqi21no6m/0irFnLIAdbBCS0CCd8e1l1NCp2W/CGsnz3ez+KbyvjdJ7C1KmIYoCokcZ6aeKaCmpCDi50P5jEiViYCvO5G+EWYCL3yTeCwE=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB4461.jpnprd01.prod.outlook.com
 (2603:1096:404:120::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 14:57:27 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 14:57:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Julien Massot <julien.massot@iot.bzh>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/5] clk: renesas: Add MFIS clock
Thread-Topic: [PATCH 0/5] clk: renesas: Add MFIS clock
Thread-Index: AQHWzv/z4hXhL9QMDkafPTk9jsvyIqnwal5g
Date:   Thu, 10 Dec 2020 14:57:26 +0000
Message-ID: <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201210142021.163182-1-julien.massot@iot.bzh>
In-Reply-To: <20201210142021.163182-1-julien.massot@iot.bzh>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: iot.bzh; dkim=none (message not signed)
 header.d=none;iot.bzh; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [109.152.167.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a11011d4-8d96-4792-0798-08d89d1be8f9
x-ms-traffictypediagnostic: TYAPR01MB4461:
x-microsoft-antispam-prvs: <TYAPR01MB4461DB43A2DC409033D0AA3B86CB0@TYAPR01MB4461.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tEPQqZhZptQZzsUPoq43qP416BlyBTTd7+RKKATj2PRZ5y6dL0ReJyiKO1+ggPFxrjpYT2O/dyt0wY5ADktIMJrFn9aPON+CjkDGAqlSYGHQ7q3V0hca4bjGB+7x4tyF/0NBAkzJ2oeqNcdoNfhzA2o/cOeMJN0BeSj3JFy92fMGMe7B94kOvmcF2cfS8XCISvn9GTWA6iJ1hpSDcBQn6F+zbrAMBy5DROAE8BrjwdT0B4HW09rBieHG6puIxUrDBBKr1+nDk4lc9vQns/ofNfeItib2KZyA63XHyu/7DgVOUFFSBcl/AE1ICHHnGmyK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(186003)(9686003)(8676002)(2906002)(66446008)(64756008)(66556008)(6506007)(86362001)(55016002)(4744005)(66476007)(110136005)(66946007)(76116006)(508600001)(26005)(83380400001)(52536014)(5660300002)(8936002)(7696005)(71200400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Ib8QVJwmFyKSdIhq0cK8z1beAfCUBu/jqylEX2rXPRMtXaxE6RqevBMK9PiM?=
 =?us-ascii?Q?hMg55iBVA5RJcu0SfaL0nzzEPGZnnY6PhnozM75uEfcpe+eQtcuC5JGvU3z+?=
 =?us-ascii?Q?T2cdf1H2ka1QM1QrIq+6/Sw2exSDwbNBm0CPlFhNhpv5szNO9Vwv8MGXO617?=
 =?us-ascii?Q?bqpoipbvGgPs7LT+a+KAsfr4YaZs1qEGuArd3BjqJHjdduPaaANoSAURE9GJ?=
 =?us-ascii?Q?SfvH4tzGLytVJj2dLkFr2AFuhahgrVWfjac47I1mXqbl0KkM9rB0QJzoDSVA?=
 =?us-ascii?Q?VhMkEasA4VWCxcytAwwd24GtsJP0l7xmyBX2JMMVWf+5uYEGU19xNotEvK4i?=
 =?us-ascii?Q?K15sKttsl3Oi8YqySVFMz5HLfX7XsxomVW5S66FI2YVYPoiqmUJGB4EEe3ZB?=
 =?us-ascii?Q?chvIlmwTxPAgNkuFi1+gXoxoptfCuJYOQq3NMAKTYG90jXMt0VVvWcls9FNE?=
 =?us-ascii?Q?584hkENlwyi9Icyc+yk1a1YfaDQtT1SzQWWtKH6pZyXbKxiXjIN/1CTX0BS+?=
 =?us-ascii?Q?QudAC3N1UBQxCYQdlH2anmlGX4JE37k888+w5LfG7osh2GOhlmj1voqlYZJU?=
 =?us-ascii?Q?U7U9e66tlNyFnLv3KOysC3cRnL7uMc2NQJ4xvfpFA3ApDpbmXh6f5Um9LmAZ?=
 =?us-ascii?Q?z5Y07E1H69qIubQfMubAEOWDXIqh5Z40fWQ8LzSqtCfIO4ZzmmlX3Ys4FjDR?=
 =?us-ascii?Q?zQuymzA/zLQD/8RzzhvPAQ8i/JUpr5gOr0eTpnGn0CpWZKLsRsM4/AVwk/a+?=
 =?us-ascii?Q?6lZD6L3WovZeP6mmx9zC2At5/NcaoSboxpN+JQ8rbMouTt7lkK71XosO+SqX?=
 =?us-ascii?Q?IDqLTMyEri6M7+1w9yZCDiWu8A0GxN7C+9nJt3OPGPC9nCv/NY3tthoCpIp1?=
 =?us-ascii?Q?mALOeo8bsuTCjN1oerpi0QVCnRIqi4OQ+4IU9DN9Gq4ceq0O+63YZga9+DgD?=
 =?us-ascii?Q?AYWYH5G0pmWsRpbYGB3YAgrmZ7GaqOFIto3vPgfPYyU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11011d4-8d96-4792-0798-08d89d1be8f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 14:57:26.9764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxR/8f3h3FW3GQCYg7cmIdt1LgHj78VQ/5Br3FXNhPN29s+mgz8QyjWU77/fc3owuvD/7z/AWqBY1W09vKOG2TOCg2U9tu/8+Mo0kA7DH9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4461
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julian,

Thanks for the patch.

> Subject: [PATCH 0/5] clk: renesas: Add MFIS clock
>=20
> This series adds the missing MFIS clocks for most Reneas R-Car Gen3 SoCs.
> I have tested this series on E3, M3, and H3 based boards, I don't have
> access to D3 nor V3 boards.

Just a question, Can you explain what test have you done with MFIS module?

Cheers,
Biju

>=20
> Julien Massot (5):
>   clk: renesas: r8a7795: Add MFIS clock
>   clk: renesas: r8a7796: Add MFIS clock
>   clk: renesas: r8a77965: Add MFIS clock
>   clk: renesas: r8a77990: Add MFIS clock
>   clk: renesas: r8a77995: Add MFIS clock
>=20
>  drivers/clk/renesas/r8a7795-cpg-mssr.c  | 1 +
> drivers/clk/renesas/r8a7796-cpg-mssr.c  | 1 +
> drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
> drivers/clk/renesas/r8a77990-cpg-mssr.c | 1 +
> drivers/clk/renesas/r8a77995-cpg-mssr.c | 1 +
>  5 files changed, 5 insertions(+)
>=20
> --
> 2.29.2


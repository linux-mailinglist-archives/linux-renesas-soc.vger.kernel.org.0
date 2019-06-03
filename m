Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 952F832AC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 10:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfFCI1f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 04:27:35 -0400
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:64765
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725856AbfFCI1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 04:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuZtJ9kTvrAohTNtcsLfT9xO8MF3a0j1j/5Zh0jY2+s=;
 b=DqpFl/a0jGWmsUOeSzLifBagXKrGGmyMFCruXXam21Z2bXrhWnBjN1HZfvgwiKsI5c3usFXRwRo7NDVIXL7LZGZweaJsu93ccUKt/ZGrrgfVP2hXXJFY6wzI7A3DRN4GRpfnPYiMnwAIR2dADRh/g1VBGUESOB0T/HADLCnW3c8=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1769.jpnprd01.prod.outlook.com (52.133.160.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Mon, 3 Jun 2019 08:27:31 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::8a0:4174:3c3f:f05b%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 08:27:31 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 0/2] Fix SDR50 on iwg20d and iwg23s
Thread-Topic: [PATCH 0/2] Fix SDR50 on iwg20d and iwg23s
Thread-Index: AQHVFr7RxhoCjLXeOEOSJBi97tDQ3aaJngnQ
Date:   Mon, 3 Jun 2019 08:27:30 +0000
Message-ID: <TY1PR01MB177000019AE130363FB65CE4C0140@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1559203675-19675-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1559203675-19675-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d949ad76-28f6-43fe-a12a-08d6e7fd5220
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1769;
x-ms-traffictypediagnostic: TY1PR01MB1769:
x-microsoft-antispam-prvs: <TY1PR01MB17698438E023EAF64DC1D27DC0140@TY1PR01MB1769.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(136003)(366004)(376002)(346002)(189003)(199004)(4744005)(102836004)(6506007)(53546011)(54906003)(76176011)(53936002)(99286004)(44832011)(71190400001)(5660300002)(7696005)(52536014)(71200400001)(26005)(186003)(110136005)(478600001)(4326008)(68736007)(55016002)(25786009)(9686003)(8936002)(6246003)(86362001)(256004)(107886003)(64756008)(74316002)(66946007)(73956011)(66476007)(81166006)(6436002)(81156014)(66556008)(66446008)(76116006)(8676002)(2906002)(316002)(33656002)(7736002)(229853002)(305945005)(14454004)(66066001)(476003)(3846002)(486006)(11346002)(446003)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1769;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4iGv4nw2QJ1ELLkdrchFxNoEWbd4fA9BWOWxRtiajoZ4Cz+bxSrCff1njiyiqIMYeToOIvSSNCfjGMwGrtXiuTxXtnE297ayG1mY+I0aBKA02xJKmkemU7Nw0lradn3ekFszpcTWr0SxcuePSXxiVHUXGIqus1b5UC2HZcXOpVpIHp1+1CzruW+1S9N8Z5zWX/wR/30763xvA7DE/QJ+Zn6m2pV3hBQN7WE+FYFliuRoIRHxfU5vzNkiJuGRCKdHuctw+VVg00qFtbeQ9DvJEOo2DcFq5xynZI4GWzlqrjeY0sYfzZLFrokXARWTKepG5XY17u3ou6puzCckZmQEC2A9pLQ5pI332TLapUm2KxKgw+4+5OVLtiMR2zg9h8yF/msC9LG/fe0YyvqPLPcjpAIPnse7KBKREuoKTorQakI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d949ad76-28f6-43fe-a12a-08d6e7fd5220
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 08:27:30.8407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1769
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Actually, it looks like that since commit
0e7d6f940164 ("gpio: of: Apply regulator-gpio quirk only to enable-gpios")
property enable-active-high is not necessary anymore.
I am going to send a v2 to only flip the polarity of the GPIOs.

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 30 May 2019 09:08
> Subject: [PATCH 0/2] Fix SDR50 on iwg20d and iwg23s
>=20
> Dear All,
>=20
> SDR50 has been broken on both the iwg20d and the iwg23s since
> commit d6cd33ad7102 ("regulator: gpio: Convert to use descriptors").
> Other Renesas' platforms may be affected as well due
> to the lack of property enable-active-high.
> This patch series fixes the problem with the iWave platforms.
>=20
> Thanks,
> Fab
>=20
> Fabrizio Castro (2):
>   ARM: dts: iwg20d-q7-common: Fix SDHI1 VccQ regularor
>   ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator
>=20
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi   | 4 +++-
>  arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> --
> 2.7.4


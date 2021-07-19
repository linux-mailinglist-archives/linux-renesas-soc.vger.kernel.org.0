Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4AE3CD5F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 15:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239846AbhGSNDQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 09:03:16 -0400
Received: from mail-eopbgr1410092.outbound.protection.outlook.com ([40.107.141.92]:59952
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239803AbhGSNDQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 09:03:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itvZdSodVv3qHhSOYxtvpcM+6jfL0xFjs2zGHyKPR7VsFIYtliONhJ1CqGE6P77ieY7zeWrsQi51kPWvenvOMTW0K4hdgu58klbbQSUMi6bMJeOKHMoSqSLHy6WXDd5xB16gmnfweNYv2epCvVcM/Uxv/PjaSgfT5wx9HbGjgXIK8sjy7RY+QDnOydNeFf+SxVnxMRhb1I9RVi9gf8fB7kYYK6oL+6UR1YdiL1VDGMvz/4+oaKLQhmQzs2T8mzKzw80jXzVMPXbKXVD2rXYAymut+UCaKwl8RZj/iebqWTP42GuABTWLAuUbo4ep6t4H+vHxGfDjIbs/+SRHjMWSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A12rGarLxFEQ5kmZ+eb60FqcRLetHTk0NFhky1ChbLc=;
 b=bvJXEy/YsctsVfWC6uJMaFEiza0H0feRE514f3T+NXMjVQt5KoY+ck0nkX3FxpXmq1EAw4LoZzUtJWc3qJZ8yElPNoB+uGvft+iW92mF5jGE8DogkVpBMVFBY0e/TRd0jZJlXoQ/VaD+TGCpGMVzzz+OaQeEV3FXevuWedk8uZ409kg6OFsMqPY/JmFstvIZRg95lKnczGnkqkCeLlpvsgWhRNtfhSmr3cI7VAD/kHdADFVG4gD0Ji+INm3ikoYUs6LpANWaxfV2RzJLjWJtoCstI4qHUS7s+Ank7kkMSZ6bwnOSnn6yvfVkjZFtoJQ9pg2S0iSZLlRLZe4udwWAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A12rGarLxFEQ5kmZ+eb60FqcRLetHTk0NFhky1ChbLc=;
 b=A6yLDE4SaD8aD2/RGIsXl0Zw89uGuLaFeC5FqwU1pTPel35TtrS8Ffai8cynRjRcOtYPgCs4XS/XXxI25tBgDmWWa51dl0bipQVuM+pjKSYGBMuUuIE3y2q8tpwrqUkn//pmG0Q9MUGqoBQb7fkqf6DG2rfEdpPMEkcpqq6Al30=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3480.jpnprd01.prod.outlook.com (2603:1096:604:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Mon, 19 Jul
 2021 13:43:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 13:43:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/9] ASoC: dt-bindings: Document RZ/G2L bindings
Thread-Topic: [PATCH 1/9] ASoC: dt-bindings: Document RZ/G2L bindings
Thread-Index: AQHXb0kzppxELwetQ0i1grZwHUxXfKswMksAgBo3CLA=
Date:   Mon, 19 Jul 2021 13:43:50 +0000
Message-ID: <OS0PR01MB59220B479B4DB8D2C1348CF886E19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
 <20210702135010.5937-2-biju.das.jz@bp.renesas.com>
 <CAL_JsqKWzxVzrK+p3USL_nK28hf1JMq_P=zJmtCD2d+SufTzRA@mail.gmail.com>
In-Reply-To: <CAL_JsqKWzxVzrK+p3USL_nK28hf1JMq_P=zJmtCD2d+SufTzRA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbfe84fd-4615-4765-6f04-08d94abb3e3d
x-ms-traffictypediagnostic: OSBPR01MB3480:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB34800E78D483000E099C956D86E19@OSBPR01MB3480.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mgJ0Hfdi4BBHoxFf6ky4N265MmXTLNoaahTlRwWW3vbppIpbzxuZdP6tsMK2F9UGCejHBXPYJBy0rfFB/MgvAf6UXzqnYsSAvc7kb3X079DNBHPwmBdfZMxABo8ZYrt47ZXXCgmZGbB7D5ZQvpqFn/NwP6wZ4fUS3ARIj5XwfASM4j+1vzk8kiKvGL2DJhx1TFI8w77RPQQpco4yHjCySqZvfVNAJPId4ekMpAztfh9RQBoDQk3l1x9DR3UtavSeEd/8MVcZCIbxsDdEluE0CenxEQ2+lR0acql1d0wQSYtZAbbY44OkUsWlN5299P2SnH0UzOEt2UWzjlSLUvCt/uNB4SSaCobv6hIyPxn6ooB0oYHKjiijAtK8SdFwlRed5NzFuD82F6dpfi3uU7oqKgCLOCgDo+JcRYjyU6Oww1M2BJqnM2wUA1p+gVcNe1Rd/ECJQSt1JlwrYnADoJO7DyVmZ/G20mOd4ppXXNXETsVii3WwXDE9URuMkbto81moEpph4TM1HWsyRpcZNgiPBcFzOgV4Nd2QRY/OpUiFtAqLBibTq+tSTwCEsJvXy0u4r3DFCo4Zx8qB8tvZIs8jjgsZVgxeSZu7x/WfpPOkJ4zVOLcLwGb+L3xmb0ARkr9D7WmRzCnbyCo2ReFu1hHjvmaKA8UiZZfdkjELH++ogzcxpfHhIFyoDJ4QCIXGqNDF9BSjN1H/nPgUQc/DgFhyPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(26005)(66946007)(64756008)(66476007)(53546011)(66556008)(508600001)(5660300002)(186003)(83380400001)(52536014)(2906002)(122000001)(76116006)(66446008)(38100700002)(8676002)(55016002)(71200400001)(9686003)(316002)(4326008)(8936002)(7696005)(4744005)(54906003)(86362001)(33656002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODN2ZTBTQnF2a0dJeXNtTG5XdTVaQTY1UmZMc3k1dVVpaEhFNVhjS1lZZ3ZQ?=
 =?utf-8?B?ZWllM2szeG9qYXlUK2FsUnQydVYwa2pHdWViOTlia0poc3BQNzZ0SXpUYk5x?=
 =?utf-8?B?YlJFQTBwQlFKOTZqTHRCN3hIeFhTb0dNNHowV3JmZlJUamZEYit4WmV5d1I0?=
 =?utf-8?B?YmpveTNoeVVpeStDK0NBSlJzam9OeVhqMkd2V3dvd0xGcHlyQnV5Zm9nTUFD?=
 =?utf-8?B?RTE0RTc5dVRkTG1kK24xdFZuUHVPeGlBVExyOThXZmR1V2tIRVNWRHRvOXpH?=
 =?utf-8?B?M1hhZzI5aUlBRDEyYWp3dldrd0cyL2lVUzh4emxYZjZoaWtMQUEzVmFYeXZq?=
 =?utf-8?B?S2UvT29pMG5iaEN5NzVDdUhiYWhXSnhDMFNib3FwMFQ4NmdYcFBJM2RzazN0?=
 =?utf-8?B?VnJOVTRrYTNQNUVqZjFHZnZMUythN1hPOG5XaEc1NXNBMlZJdHZaUGFTdW4v?=
 =?utf-8?B?R1JWeTNQUVo5QXYvVy82UDgyQlk3TUVGcTNmMDhVNmN5NHBHcm5aOWljTU9X?=
 =?utf-8?B?eXAyNWJUNVVZSWVONTBsN1lqV0psdkorRzNJaGJiNkY2c2RHN2xZV1d2Z0Fp?=
 =?utf-8?B?STBqT0d2VlJxWUo3a0szYXBvK1hYSGJJWldBVlpOU0ZJVWVDQW9MQnk1cnh0?=
 =?utf-8?B?clVZOEttajJDUUdiZ1Zxc3h0WTU5ZFRxVEdTWlB4b1NJZjBGU2d2dWtaYW92?=
 =?utf-8?B?bWZBTlV0UVhCUVphVWdCbEtUb2FOZ3lFSEVrZ3Jmekk3T3V5SW1TWE9aMXBr?=
 =?utf-8?B?ajY4ZEM5dkZuU3F2NThyRTNQRXdYRGd6Q2VRUFVoVlpreE9rZ2hXaW5Jb2dr?=
 =?utf-8?B?SlpZbm5xQXhrVm05OHJ5OU1FK2ZuU3RBN2cwRUZQdWpVZGVuQW43Um1MR25h?=
 =?utf-8?B?UC9XOGdDUkM2Y3FmaDhZNEFJUDZHSUc0Q2hhOHFlWUltdnF4NEdqc09xcW53?=
 =?utf-8?B?dVZlbHlXYzg2QjRpMmxBcHBKUS9qcVNNamZqYitFUUVELzBpME1iRVNVcUwr?=
 =?utf-8?B?eUsyd1ZMZDRpRmdRUEhCdzBBd3BHOE5HakpUNTljUjZVeFpCeFhmKzFnZTVz?=
 =?utf-8?B?NjRFOHRDdGorejFBUlR3TmcwbkVKYld3cStqN3FEUENQOWMwYitNeGZZTkdC?=
 =?utf-8?B?eFpzQW11d2lNaStJUnNpR0k5NDhuRnV4Szd5V25ZUkhoRks5Nnk0Vld3YnVs?=
 =?utf-8?B?eG9wWjhrV3FIcFpJaWo4bmpqK1ovYjRnd2FMTjlyalJlbEJxMFdSbTRYQ1R3?=
 =?utf-8?B?SERWZ0ROOGl4TVJ5NTEyTUNzZXBMY0hJQzFUZlN5NVJTb21GcndkWlc5amFy?=
 =?utf-8?B?K1FkWkZRb0V4SEY5YWxaRmJ2UElNV0RQS1A1SWprOEdlTXEydFJlSU9OT0o2?=
 =?utf-8?B?Zk9oUTB5NFlXZzJIbHZxdHNKUjRBY0wxMUhJc1VJb3NnWnhkZ2ZHaUdURUdy?=
 =?utf-8?B?cThYRGpRWXI0eDA1Q2s3YVREcHRlMWpXbUhteUNnN0xQdTJOY2FsQi9Rdzl0?=
 =?utf-8?B?MzRUVGMvU05rck0ydGtITURISnNPZ3o1cVZTVzBGRENjR1ZoTzA1b216bU1Y?=
 =?utf-8?B?Q0trbGVSTlJYQ29CMkVYYWpSWmR4WC9wcVVwamp0QnVwWGo0ZzJpYlY5WXJv?=
 =?utf-8?B?bnlzM2ZmYkNaUGlDTmVZWkZkay91S2RYVXgvYlJnYWVEcVpzS01sSFFpa1dX?=
 =?utf-8?B?QUdPcnJ2NVAwRmxZMGw3dFZ3WVFWUG1wTUFVTUI3bHM0eFAvUzV2SEdMYmpB?=
 =?utf-8?Q?I39msJn0oesaQhsHmIlcWdlRsaIvMDBW92xG3C6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbfe84fd-4615-4765-6f04-08d94abb3e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 13:43:50.7434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TzjrwB2fZwsLhxyguCDrp1fY6M2jgYMCaTTgkqV0EXY1wjgysqFaQxVNykNNyw+Y9SHDJYvChVj88cME9ddn9/Ddplw5x6kKQ7oXaxknqZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3480
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KPiBT
ZW50OiAwMiBKdWx5IDIwMjEgMjI6MjMNCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gQ2M6IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+OyBN
YXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Ow0KPiBDaHJpcyBCcmFuZHQgPENocmlzLkJy
YW5kdEByZW5lc2FzLmNvbT47IEt1bmlub3JpIE1vcmltb3RvDQo+IDxrdW5pbm9yaS5tb3JpbW90
by5neEByZW5lc2FzLmNvbT47IExpbnV4LUFMU0EgPGFsc2EtZGV2ZWxAYWxzYS0NCj4gcHJvamVj
dC5vcmc+OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgR2VlcnQgVXl0dGVyaG9ldmVuDQo+
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IENocmlzIFBhdGVyc29uIDxDaHJpcy5QYXRlcnNv
bjJAcmVuZXNhcy5jb20+Ow0KPiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+OyBQ
cmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT47IG9wZW4gbGlzdDpNRURJQSBEUklWRVJTIEZPUg0KPiBSRU5FU0FTIC0gRkNQIDxs
aW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MS85XSBBU29DOiBkdC1iaW5kaW5nczogRG9jdW1lbnQgUlovRzJMIGJpbmRpbmdzDQo+IA0KPiBP
biBGcmksIEp1bCAyLCAyMDIxIGF0IDc6NTAgQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IERvY3VtZW50IFJaL0cyTCBBU29DIHNlcmlh
bCBzb3VuZCBpbnRlcmZhY2UgYmluZGluZ3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiAt
LS0NCj4gPiBOb3RlOi0gIFRoaXMgcGF0Y2ggaGFzIGRlcGVuZGVuY3kgb24gI2luY2x1ZGUNCj4g
PiA8ZHQtYmluZGluZ3MvY2xvY2svcjlhMDdnMDQ0LWNwZy5oPiBmaWxlIHdoaWNoIHdpbGwgYmUg
aW4gbmV4dA0KPiA+IDUuMTQtcmMxIHJlbGVhc2UNCj4gDQo+IFRoYXQga2luZCBvZiBtZWFucyB5
b3Ugc2hvdWxkIHdhaXQgYW5kIHNlbmQgdGhpcyBvbmNlIHY1LjE0LXJjMSBpcw0KPiByZWxlYXNl
ZCBhcyBpdCBpcyB0aGUgbWVyZ2Ugd2luZG93IGN1cnJlbnRseS4NCg0KU3VyZS4gV2lsbCBkby4N
Cg0KQ2hlZXJzLA0KQmlqdQ0K

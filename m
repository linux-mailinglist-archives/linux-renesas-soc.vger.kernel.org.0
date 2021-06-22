Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB863B0984
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jun 2021 17:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbhFVPxJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 11:53:09 -0400
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:54400
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231680AbhFVPxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 11:53:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt2KnjDSNTuiKBIHPxsC13pQtNZy92SjKQallSgsF4102Z0/DBamn93rEuZN8JI2VfVM90XEUNn+W9lyGP8e1XxVfZ04UxjWeWhe+XYy4PFoAx9lPN9mrb0kdyz0dL05gKh2LytA2r2pdqtSunCpQEmyQij5lmeIOFwq7Nnk27Tf8ER3+aS80PN8xqgRQ2leZvA1F8eFJaheWWIdBhcXPFF2+ENM04RFfbdA8pyiaRJxJL0c9sducCFSqEsQ1zInkPaoBvuytdjph1tjitZykTcTfXLcYu0fOabJSpr+w1wEtXtzAe8zIi9XfiQbfakB9jawaO3M93pB/vknPWWAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkLpvd/yYAsUDtI0LXpUIUdFbrz04oMFsMow6qZTHy4=;
 b=lxH1+8k+0Bzjl9mm6XZqwKOP+lGDg34uzLVqZ6aTMFXvUkLPvGcduKadcR5IXMZ3nAbS2b++BptqKtgHu9e110ZBDHUlPG1VXDeT8F2w6XikJmk4gGbvJKEJ0upYY8zq695Iawtg4pvjVCN65kBghQn95zieBZN9qsiGu4OmMg5E6rEWZg2moOOKkliOvHCevty1C9YtVVXeAfouMGYSbc+wlwYd3eiprfEWO8rZZiDMGCrTy/+JTlxT9p8yePAu6rV7dhRs0jWnQThE0zm1FhjostGmtxvKQiOGFaBCoB7fXi1cdKGK1nvoFX1xW93u+eewbMYjmWUDH4K2LJeybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkLpvd/yYAsUDtI0LXpUIUdFbrz04oMFsMow6qZTHy4=;
 b=LG0jGMEy7kCGXtMNy2+oG9ptOoFwv1rjrdiJLKwdPNP75SvJElN/ywZuDmNkeRWh4ZfM7mPamvz+UrUOBgtxf1ibqJVmKardgCNEUhX2+YSH86SaGAIERWS4BpyxswPrsmf6FBb66ExKNsf8VbSpJvkrr5hyjpPWvEUw52S//Cs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5441.jpnprd01.prod.outlook.com (2603:1096:604:a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Tue, 22 Jun
 2021 15:50:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:50:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/7] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock entries
Thread-Topic: [PATCH 3/7] drivers: clk: renesas: r9a07g044-cpg: Update
 {GIC,IA55,SCIF} clock entries
Thread-Index: AQHXZCiB0Hvwq+6JGUuL+gSePnDkuKsgKd+AgAAKFFA=
Date:   Tue, 22 Jun 2021 15:50:48 +0000
Message-ID: <OS0PR01MB592209D9B071ADA4ADB80E7A86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
 <20210618095823.19885-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdV77ORDvcQmMUg8FpmyotdiORDSN_J19hqctzZz9g6gUw@mail.gmail.com>
In-Reply-To: <CAMuHMdV77ORDvcQmMUg8FpmyotdiORDSN_J19hqctzZz9g6gUw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9dffcd8-b632-42b6-0c85-08d93595813b
x-ms-traffictypediagnostic: OS0PR01MB5441:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5441FFD4C19D295B3C4B855486099@OS0PR01MB5441.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gcBqZAGuY85lhrpXJ8KHhdhPuLwFk8SkaDGhAhAjQYotJpm4/VnfUjpOVCW3pkZ0Nxs4OAPy0YjO2ARP1HYZ8LJcCK8OdvHreVcCZX08dSmw2ooJRAe3MyYaaIkTrtF94Xda7Fnd2Cca7JzXW5F0tpmp87WXRPJr/mGR1YeNvsi3UZJAfHXbsKRUWgiBTOWt6Le/vKR404kIMHjrWYM8QnjPGtd4WcAC4EFB+vQiMMZhBmZMbdDZWipQP4Yfd/lWoLzQxnHsAVSbeLfDTKdeciWB/ofvfcafTWmfKR6B76ZV72JNpsR/v55lzr4ggj0YKw2jbAfrBdFeTjO/zpfL8pp525bE5QuS2fbTZbavmeph2nBbpGUmKmT89oRaCJSOU9pGBhgA0a0dDIGWUqP6zUxlmc7nC5VTszgEiduTtuOA72fs2dIddREo/2QjljWo0/J4BqwehRVE9SWKVCwur37w9/xrhYe05aws0qhsTE1DKRin+gKz7ywe/Sj19etcrsRC/nhqcuoxKIBWlC+bfYbhoUEfcVI3Yx8RI4YsiX4cawekseRev5j09DYTjQ/XWmmCYWeL+WskySvcbh9dPp+ufxA7dF9ws6UnbRzH12c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(54906003)(316002)(71200400001)(122000001)(2906002)(7696005)(38100700002)(6916009)(107886003)(478600001)(86362001)(8676002)(5660300002)(66446008)(64756008)(66556008)(66476007)(9686003)(33656002)(53546011)(8936002)(83380400001)(52536014)(15650500001)(6506007)(55016002)(66946007)(76116006)(4326008)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmZoL2FzY2svOHpqNmlTRzVJK3cwZVowbmVCb3NXTlRlbGZzay9HTGxZSE04?=
 =?utf-8?B?OXZpUll1WEdMNTJEZzNMSDNXUjJjbjBwUmE2bEs5ZjBZMzh6MitOWGIrQkRp?=
 =?utf-8?B?VVA0ZG1ramROeXBvQ0FsamxKOG8wV1puWm1vMlZSYlBQRG5LMmtoQVc1eG1F?=
 =?utf-8?B?QnJLaVJ1SmY2U21SSlUzbVVZdlVLcllZUkQxTnRNMGtrSDl6eklMYloxTVVI?=
 =?utf-8?B?Z3hyWDBsTm5uelJEalEvdWR6YXIyU0xWdkFsS284b3Q4RlB6MnNaRW9yV2J2?=
 =?utf-8?B?ajVpeWJBSTY4dmVBaGw2b3MzWnQ3SEVsVWNYa0Y3WDFnMnN0cXhZYTh4VHFu?=
 =?utf-8?B?dXVGOFIwaFgvNlZmWVB6dlorSGpCYktnNVBQZ3IzSEJad3BmckQ0UWYxU1JI?=
 =?utf-8?B?bWNGMUZieHlHUnA4cmhSaHBkMkN5eXovTXVGR1ZZWjI4V3NWN3FXMXFnVEF1?=
 =?utf-8?B?d2EzdFFFcjQrN0F5V0ZreTZUb0RjL3lyeURQdFc2bmRCMjRpRncwZ1JMbm9h?=
 =?utf-8?B?YzhtVDBabWJpNVREM0VzMDRSV09MMUVvQ2lRTGdCSWpwbnJYN09GYnAxUURS?=
 =?utf-8?B?UFBMOGkvaHFLSjh1VVRVYmJtbTRoYU15VGZVUWNacmFEZ3AzWlFueEx4dVFJ?=
 =?utf-8?B?WDE4ZjMrcmplM09OU1VpLzZkMlFiQ2pPajV1QjN2NzdKMWNraEE1Z25rKzRC?=
 =?utf-8?B?VXMwSkRzaERrc3drRklrdk1hU1gvT3JicUFhQXA5bk10NWJ4NExDNUhzdU9p?=
 =?utf-8?B?dkJSdFZsb0xZUjA0WmRYak96RFJ1cTVXNnlYTDUwUExkMCs1em5UTkRtSGlJ?=
 =?utf-8?B?WUJPYWE2WlpTTEowWUFNeDV5ZGoxNXVJNjkraGIrTDY0eVNNZ3lqb0ZtQXRz?=
 =?utf-8?B?QlAzMXB4NVNxbDNGcnA5TXg1YUdVbVlrNWllaWR5M3lkRGVJTHkwZVBjZjNl?=
 =?utf-8?B?ZmRUNDMvaWpTV0lhd0w5NjlseFNLUEU1M0FrZFRMR0xhbjJ1NVh4TTVXUXR1?=
 =?utf-8?B?ak1UZUZsMG9IL3hHdnRCTm9hY2V2M2ZaenBKVFVKTzVIZUYvQWNFcXdhYThu?=
 =?utf-8?B?engrbGZzcmVEb2JBTGNuUG5CM3pXQkFCV0pjVDRXWjdIN1M4cklUN1VWS0VF?=
 =?utf-8?B?aGhBT0ZQT01sQWFrWEdHb0hPQlZKSmJMSk4wM1hjdThxVUNuY2FFRzZkNy94?=
 =?utf-8?B?ZGtsNWVEUWU0QzZacEp0UnNTN0U2KzYzVkhSN3dLVTFiQTJqRW4zSnNvY2pF?=
 =?utf-8?B?QUtjYVZDZlYzK0owQ2FzUVg1bUV2MjlINEd3WU5PSTBQSFMyR3M1cXd5QkZ4?=
 =?utf-8?B?MUc3ZXl6MU5Zc0FkV0h6emVvWE5QajBDWEE4L0dhTEtJSi9oUTBlci8vbXFi?=
 =?utf-8?B?V25Ub0x5K0pkMWN5ZHZMYTZwcTBpc0xCdXI5allPUFZMNUg2REtvMmZIREhp?=
 =?utf-8?B?azJOZDBFc0d0cytYc1VuNXl0dWs1cTluUk9TOCt3Q1AybUljZUpob3Jrd3F4?=
 =?utf-8?B?NWJUR2hWQ0JDdVo0R2tJQjVwUmhrWFQzaDZXalY2L2NMZU16RFM0WlZVbTJY?=
 =?utf-8?B?T1ZCOUxJUHdFYXI2SjlRYXp5bG1pMnpaNDFHMmM1NXdWUXFkRW5oNDhDTVpw?=
 =?utf-8?B?T3h3NG84ZVJReVhremN5M1NIakxRY1RaUVpIWElqdGNtOGZWcEx3cko1b21X?=
 =?utf-8?B?Mlo1UnQ3dzVka3BtUUFzVUZiMGJJdVpJWkxzOWRDcmsrTnoxU0JKUVJQWFVT?=
 =?utf-8?Q?k4Eu8iqm/s53YElHtqArrQZ+sprQHPjzVN25Z+q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dffcd8-b632-42b6-0c85-08d93595813b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 15:50:48.2921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84uLKj4WEwTeFcLw2zaxTPA74ax7UDGXPdoNY92n9WaQw8U16Ptm76RuA8GQkP6uj4higEMjVO+raJ3FUqQUd9Zb+Ys845DJHtlBQRklT/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5441
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy83XSBkcml2ZXJzOiBjbGs6IHJlbmVzYXM6IHI5YTA3ZzA0NC1jcGc6IFVwZGF0ZQ0K
PiB7R0lDLElBNTUsU0NJRn0gY2xvY2sgZW50cmllcw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9u
IEZyaSwgSnVuIDE4LCAyMDIxIGF0IDExOjU4IEFNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gVXBkYXRlIHtHSUMsSUE1NSxTQ0lGfSBjbG9jayBl
bnRyaWVzIHRvIENQRyBkcml2ZXIgdG8gbWF0Y2ggd2l0aA0KPiA+IFJaL0cyTCBjbG9jayBsaXN0
IGhhcmR3YXJlIG1hbnVhbChSZXYwLjIpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJh
Ymhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMv
cjlhMDdnMDQ0LWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEwN2cwNDQt
Y3BnLmMNCj4gPiBAQCAtMzIsNiArMzIsNyBAQCBlbnVtIGNsa19pZHMgew0KPiA+ICAgICAgICAg
Q0xLX1BMTDNfRElWMiwNCj4gPiAgICAgICAgIENMS19QTEwzX0RJVjQsDQo+ID4gICAgICAgICBD
TEtfUExMM19ESVY4LA0KPiA+ICsgICAgICAgQ0xLX1BMTDNfRElWMTYsDQo+ID4gICAgICAgICBD
TEtfUExMNCwNCj4gPiAgICAgICAgIENMS19QTEw1LA0KPiA+ICAgICAgICAgQ0xLX1BMTDVfRElW
MiwNCj4gPiBAQCAtNDIsNiArNDMsMTQgQEAgZW51bSBjbGtfaWRzIHsNCj4gPiAgfTsNCj4gPg0K
PiA+ICAvKiBEaXZpZGVyIHRhYmxlcyAqLw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19k
aXZfdGFibGUgZHRhYmxlXzNhW10gPSB7DQo+ID4gKyAgICAgICB7MCwgMX0sDQo+ID4gKyAgICAg
ICB7MSwgMn0sDQo+ID4gKyAgICAgICB7MiwgNH0sDQo+ID4gKyAgICAgICB7MywgOH0sDQo+ID4g
KyAgICAgICB7NCwgMzJ9LA0KPiA+ICt9Ow0KPiANCj4gRGl2aWRlciB0YWJsZXMgaGF2ZSB0byBl
bmQgd2l0aCBhIHNlbnRpbmVsIGVudHJ5IHRoYXQgaGFzIC5kaXYgPSAwLg0KPiBBY3R1YWxseSB0
aGUgc2FtZSBidWcgaXMgcHJlc2VudCBmb3IgZHRhYmxlXzNiW10sIG9vcHMuDQo+IEJvdGggdGFi
bGVzIGFyZSBpZGVudGljYWwsIHBlcmhhcHMgdGhleSBjYW4gYmUgc2hhcmVkPw0KDQpPSy4gV2ls
bCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAr
DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX2Rpdl90YWJsZSBkdGFibGVfM2JbXSA9IHsN
Cj4gPiAgICAgICAgIHswLCAxfSwNCj4gPiAgICAgICAgIHsxLCAyfSwNCj4gDQo+IEdye29ldGpl
LGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0t
DQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4g
QnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

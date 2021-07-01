Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF163B91B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 14:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236366AbhGAMnf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 08:43:35 -0400
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:12849
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236282AbhGAMnd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 08:43:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jM8HzgRKV9RvYD9fq71LTD3YSzZHIsMmKHDap4Um6W+EPCi2Lo2HfIHov30CeoHmNa5RvAHWstVs+I0zwMw90eWk8FYmPrlm01cjo88oXPCurnophlmC1ru5c3Xm4egf2qMYyVMRMCnE+f4lzyHTUyR/3M8uH6eifBIzuntrU/TqJDPtjzE/DuuZ1TixFkwlDUOw40XY+ecnt5ENbpjPeKZsoOvJ/71zMfV12W44mee85vGNoRlnmo7c9DvQZi4MhZCiM5dtcsXzk/tjrn7S+q9eaTyaBMtrX43XQ+BIdcKr22kTi0Ub2Ctmc1IpDe8PydnQ055OwXfN9Y8R8R33RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1jD8vjwtWdbjD3vvnDbx7vHS07IQX0C9w8KlLvSeqI=;
 b=kcLMhUgGohdsxMacTzIcgvAS26qeBnVYmKnfQVUrg0Zr6e+yxr6g9QIe7z1DklMkMtOT4CbPZRhNxwOjlydK0NVUffBI+sURHUmABalHIqFHhQxBeQbqyKaDg4GY7ANHmCqpekcgIixH6mPjhvZLdek8yDNh9/7QeL+LuPBExEVA33znOg+vT/B7/n8VobVnRxt53MTcAkS0jZwOAwKGJTySLZik98Wv0Ss7vmniQ/in0OSRJps7mA+hXMoOr75wrqE+fSI+jVKkTF5ePJBP+sp9PFYIE5w1AV4zd4wCHWwG5ryvTH2EnxfZTsdzlMnAu/MX4wXvXeWn6fDPf/mfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1jD8vjwtWdbjD3vvnDbx7vHS07IQX0C9w8KlLvSeqI=;
 b=KLr+R84xIH5CIcVndlhF2H14pgC+MUOpa3+RVboQXjjkGKYnKH4Mdek6qiCfZAp/PdO4vu8CdlYVLH4fNma5V8Q8BXBLWDDUiKjUp9RrwBz983kgEUPRpTdJmJ68gD8MxBSairldWzck/3VEMGprHaoqeAF+mEbPNIsjebTSy5M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4869.jpnprd01.prod.outlook.com (2603:1096:604:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 12:41:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 12:40:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 04/11] drivers: clk: renesas: r9a07g044-cpg: Add USB
 clocks/resets
Thread-Topic: [PATCH v3 04/11] drivers: clk: renesas: r9a07g044-cpg: Add USB
 clocks/resets
Thread-Index: AQHXbYHc4gWVDHyN2EGEnwoZiVOXCKsuCreAgAAGpgA=
Date:   Thu, 1 Jul 2021 12:40:59 +0000
Message-ID: <OS0PR01MB59223D3E0DA71C15A780BD8086009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdV8sH6LnBXmVWO7ua+bHOqhbvmQ4XUbv-_UGCwfa83WOg@mail.gmail.com>
In-Reply-To: <CAMuHMdV8sH6LnBXmVWO7ua+bHOqhbvmQ4XUbv-_UGCwfa83WOg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7de59398-5241-4cbc-1584-08d93c8d7ad1
x-ms-traffictypediagnostic: OSBPR01MB4869:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB4869977BFF5832D67DE2D27C86009@OSBPR01MB4869.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mCnk56RAvRf/OHI8IcpSH+9AjBHxAGKfL0ao22Lo6ztKDKfjPvJQaesvyAM4cxe+MX+C+lUNAzJz+700+p+6ICYySjrY4EOHurEkUOFZ3Nw0apwP1xOOYa2W2MQajYFImsnXZO6visq7Mx9tVNFk0+liUWGl9uCDjo5LVrglTqm9/eN7pGpTt4P32vwTJypyX9DNDW9myPkH3IIRHzlU7IJ4rd42f5FXMktxg4xOwO1QfDGklfnkYLKfUrjb5e27TuVJl1jPyhJ95WJZDHqiBYyFCCkwqFjNFWZLp0St3SMmXIjTZ6rqRrW42xdbS2LAf3/ZjZ4eVTWAmntOeGq36d+D9mKj65VWZV8zdqOQXKPbdrkVeH0YQ2hRDocgk79Z8yDwQkeY48m1qkMEeJPOGrvd3awNXI7XwqOginGxVOgLvKlU+PGJSxUW5VpAxCj2OZKCETvuKjm1uVKDGNG0i23XuOeoSluauOHWYjDrDi2qDbg2RnGweO2wsn10dzls7KOOLWwTxmGN9Uy3wR5OF8/0rjTwzMS+3j9xKgRG6wHjDeqS0dK6Itcb/ooJFbUfupHTeyEmU0a/Jdf2BIUx69jKPBKxKsKahugl1tHV7B7+oCnIK+h4OS976Z+oP/5+iy1z486p8NY9+mc7aYPFRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39840400004)(376002)(136003)(26005)(7696005)(66946007)(53546011)(9686003)(66476007)(316002)(6506007)(64756008)(66446008)(2906002)(66556008)(4326008)(107886003)(76116006)(122000001)(71200400001)(86362001)(55016002)(8936002)(38100700002)(83380400001)(52536014)(478600001)(54906003)(6916009)(8676002)(186003)(33656002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1JTNHBLZ0ZaSlNHTXRtNys4bWNpc2tUYnBMblg4WE5DSVQ2SDRQeW16QzBV?=
 =?utf-8?B?OWRFQWR0OHlpUVZQbjBnUGNtaTZVVTVoVkVYaUoxUW9ycHNpazBnTkozZXBo?=
 =?utf-8?B?RENSWEtZM3Q2dWxWOW1vY25lQTViaEp1M0JvamltZENTVnF2dzVwVjRzYkZ0?=
 =?utf-8?B?bDgyaTc2V1ZTTHJiZjFUdEJ0WGhQY1RWclVoaVJsMlhaSTB1S2g2WFJwOGZ0?=
 =?utf-8?B?QmRyOVNDalFReVZkSVJGQVAwVGNTNnkvNFNjNjRydTZUcHlqZCtQY3RIQ0Jx?=
 =?utf-8?B?NUVzSitURFdhN0U3ZzVHai9DMytLWXpBTWMzZTBieGpjWVdXbHNIenU1djJP?=
 =?utf-8?B?Y085azl5a0czN3NualRyc1Zwc3ZuN3hOb1FwMGNiaHY1M0ZXUWs2cTZjTE9P?=
 =?utf-8?B?aFAweldUMDFXajRucjUrUE5mbDl6dUNtUC95bGEwZW5uV2RsYXNqYTF3RnVG?=
 =?utf-8?B?eDJVcUlTcStkUDhGQ2pNM3Y1WldMTytNYmZVRnJTcUptNjVhUXo4ajFQa1Nj?=
 =?utf-8?B?dVlGVXpuQVBJTDBpcUt2eUpXRUhKUXdNU1FuLzBoSW9wbWRPOFlRMFdyQnR1?=
 =?utf-8?B?ckp5TkNFQTZCMWI0RkY0MUt2NHVadW0vU1hXMlJpOUtLQ3RsU2NPenJoektj?=
 =?utf-8?B?dmRXbCtRT0IvWEt6NTZRNUFlSldicWVtTkxHbUlKejBnVkxmZEhZbWYwUmwv?=
 =?utf-8?B?SUVaTjc1Nnc5RmM0K0YxVG0xb1pRUm5WalhMQ3NZNGE1akpoVDZBcUFtRS93?=
 =?utf-8?B?UWgzR0dhL3YyTWlRM3cyWmpvdWdiVnhIOHBlbjl5enU4NDhQQ2FhTllhS1RZ?=
 =?utf-8?B?WWJBYUdTQmd0dWRzTUoySUhMMTJGdEY4MmNJMGFSYU96bzJKQkorbUNvVUc3?=
 =?utf-8?B?UkZZQUhpY3I5b1BjUXA4SzF0dDk4dUhJQlZjendEUDI2TitZbUNMZmpvS0lX?=
 =?utf-8?B?aXhOZytvTU5YN0d5RGtjYWtjckswTUtGbnhRZ085NFFadDcvWDZvbTc5UUdH?=
 =?utf-8?B?VDVaeUd1bWdTbXVYSVppMFlYUGRYUUVvc01hYjRva2lXdjIvek54Ykd3MkJF?=
 =?utf-8?B?b1NidC8wSTZXbEtVMHpMT0Ivcll3cTVMenZqd0s0MEdpMTQyaW1OSk96Mi9Y?=
 =?utf-8?B?VU1xOVZPTG1RWDNWUUdsV0lsNGFFK1F5a2V0K004MThUanBPR1BTcGxVaDBq?=
 =?utf-8?B?S2tCYW1zZ1REM2cwMDhjREo0Nkk3Ym9ZdEg5enliWFZ5TDZoM0pPakVFWWY4?=
 =?utf-8?B?SmhwK0VCZUFzWmJWdmFhM0xoN2F0MEJ4bGhIZkF1NG1Pc0JmamxBN2RyeUpm?=
 =?utf-8?B?SE1QakxvL3BsQ1hYTzhlUUdHblpvclVaOUxIVWhZaFFSbStrS3g1dXZlQkxt?=
 =?utf-8?B?ZzZ1ZDJDK3hnRExqZXl2ZUV0Qko1Q3ZFKzB2cHBieUc5ZksrcVFVZUREYXpm?=
 =?utf-8?B?WjBzbEtLVFVpVFhjZGpyNWtmcUFBdGYyYkkvZlVCSjJCVU5KOWdaV1ZYMEtH?=
 =?utf-8?B?UlE0UEE1RVNEYzVBcGN0c2pBU3pKcDBvOG03VHBKOEF5UzlnYldMUm9SN045?=
 =?utf-8?B?VG1pRTdhelZ4WWZGcXZTYkxnZ3cvT3pmbE9VSVV3alFvT0trakc5cUNQQUVZ?=
 =?utf-8?B?VGRYaFdoYmlFellmTGdHRVo5ZTNXYlhtM2VOeXJEc3EvaEZGemRVaHREVXhU?=
 =?utf-8?B?WFMrc21sVGxieXpQbGx1WXM2YkhIcGVEU2ZZSU1UYldqT0JINm1sSTBEUTAv?=
 =?utf-8?Q?EM9PWNqZlzUdpOh1INg0QElEwsYYSPSQnoyOPUN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de59398-5241-4cbc-1584-08d93c8d7ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 12:40:59.6640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0yCpkzT3arWK/MdRUllqHKBMGjmJKz2DcT45TMkiPtQTs168f9phxOegb58olY30F0HiV1jTvJZNihmDlxPjp+hg+/OcF96X6cTtWPbWsFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4869
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMDQvMTFdIGRyaXZlcnM6IGNsazogcmVuZXNhczogcjlhMDdnMDQ0LWNwZzogQWRk
DQo+IFVTQiBjbG9ja3MvcmVzZXRzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBKdW4g
MzAsIDIwMjEgYXQgOTozMCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IHdyb3RlOg0KPiA+IEFkZCBjbG9jay9yZXNldCBlbnRyaWVzIGZvciBVU0IgUEhZIGNvbnRy
b2wsIFVTQjIuMCBob3N0IGFuZCBkZXZpY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiAt
LS0NCj4gPiB2Mi0+VjM6DQo+ID4gICogQWRkZWQgcmVzZXQgZW50cmllcy4NCj4gDQo+IFRoYW5r
cyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEw
N2cwNDQtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0NC1jcGcu
Yw0KPiA+IEBAIC05Niw2ICs5NiwxNCBAQCBzdGF0aWMgc3RydWN0IHJ6ZzJsX21vZF9jbGsgcjlh
MDdnMDQ0X21vZF9jbGtzW10gPSB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAweDUyYywgMCksDQo+ID4gICAgICAgICBERUZfTU9EKCJkbWFjX3BjbGsiLCAgICBSOUEwN0cw
NDRfRE1BQ19QQ0xLLCBDTEtfUDFfRElWMiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDB4NTJjLCAxKSwNCj4gPiArICAgICAgIERFRl9NT0QoInVzYjBfaG9zdCIsICAgIFI5
QTA3RzA0NF9VU0JfVTJIMF9IQ0xLLA0KPiBSOUEwN0cwNDRfQ0xLX1AxLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMHg1NzgsIDApLA0KPiA+ICsgICAgICAgREVGX01PRCgi
dXNiMV9ob3N0IiwgICAgUjlBMDdHMDQ0X1VTQl9VMkgxX0hDTEssDQo+IFI5QTA3RzA0NF9DTEtf
UDEsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDU3OCwgMSksDQo+ID4g
KyAgICAgICBERUZfTU9EKCJ1c2IwX2RldmljZSIsICBSOUEwN0cwNDRfVVNCX1UyUF9FWFJfQ1BV
Q0xLLA0KPiBSOUEwN0cwNDRfQ0xLX1AxLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMHg1NzgsIDIpLA0KPiANCj4gVGhlIG5hbWVzIGFyZSBub3QgcmVhbGx5IHVzZWQsIGJ1
dCB0aGUgbG9jayBsaXN0IHNwcmVhZHNoZWV0IGRlc2NyaWJlcw0KPiB0aGlzIGNsb2NrIGFzIHRo
ZSB1c2IwIGZ1bmN0aW9uIGNsb2NrLCBzbyBwZXJoYXBzICJ1c2IwX2Z1bmMiIGlzIG1vcmUNCj4g
YXBwcm9wcmlhdGU/DQoNCk9LLiBXaWxsIGNoYW5nZSBpdCB0byAidXNiMF9mdW5jIi4NCg0KUmVn
YXJkcywNCkJpanUNCg0KPiANCj4gQXBhcnQgZnJvbSB0aGF0Og0KPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGpl
LGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0t
DQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJz
YXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4g
QnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

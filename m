Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DED23D8B80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 12:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhG1KNw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 06:13:52 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:37050
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231238AbhG1KNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 06:13:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiNGAaasTBdMnWPEusRcjDAhq2hN821cU0KBNi4mrv9c0YOekaR/wJl0JcL3cyj76qekpxGyJiWoVVgkyh/pBZUb8SuKtkiWavjXPsWg7if5UQi5olRY8K8a+QvbV/jvRw54uWDj287+w/A1+qnNguHivnvlrsYFjarQk8f4zHEynlsC4o1YI7YbPgMBRhhvGfh+lvh0s5iIpbdfsJze6R3JBvFC4UfMxHc1TQ6hrYslHBdHt1vfDxz0UkmZkHxasQxf215VhFzvd+Hs2m1LKcOFm2wBKn+RAKYWzG2Xl7vmKX6ENtGyQuoMUgYY11cRaGW5yXDc4CKoBmGMRlEaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl/7SY0qqjYhjuvyCWWbyuCftyroZWwHOopIJA9z+wQ=;
 b=C9yLDpyfX+yjPwcEXXQvdfPqLg3+BgryEPLz0diPFQMu1zQeVIBa9uW8J0qlObLXLrupCVWq/K2XlT6cfCoBtT0yZFixf13REctBlb8lxE6cQKhhD8H1arJeznH8IyJ5C5Cd2ZdGyqMOMQ6vic9TSp5u2U7GmcuwhXH1TIYjGeMVG1svg7k6E9W1Yzzn0XLZKt5VVgjJWETsluXXZIVQJxcfDLdCzYyLTZ1dP+KNCFAp5sGFjw8yikBbSiBbXxjTIEqA5FzXc83hHjH4V91p70kt403dU7azYan5u3Mtp8CzVWaHdF29/uNe/E9SVzW4TJeKEMGlHz1yMpJdK4Tcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl/7SY0qqjYhjuvyCWWbyuCftyroZWwHOopIJA9z+wQ=;
 b=fbMs455lZGlc2DZIYlDkWuLtMqcEEQCv3bFNP14CtgXiMPMecCNUMspMgx71GSKLI6DiIvwdx07V3hpR63cyTEXeY8UkvmxiNo5BHWDFbwcm0KhEx5TlS2lrZfNvlliqqd00Ko/KqKKw4bAZ5I7hyPCtYGHKbCeI0PQttDS2nUU=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYAPR01MB4878.jpnprd01.prod.outlook.com (2603:1096:404:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 28 Jul
 2021 10:13:48 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::1bb:3bd3:f308:a8c7]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::1bb:3bd3:f308:a8c7%5]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 10:13:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Adam Ford <aford173@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Yuusuke Ashizuka <ashiduka@fujitsu.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next 08/18] ravb: Add R-Car common features
Thread-Topic: [PATCH net-next 08/18] ravb: Add R-Car common features
Thread-Index: AQHXfwPhbPRJmcaBiUSgc56SRE5qLKtXU5SAgADbmTA=
Date:   Wed, 28 Jul 2021 10:13:47 +0000
Message-ID: <TYCPR01MB59337E1C3F14B0E15F0626D986EA9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20210722141351.13668-1-biju.das.jz@bp.renesas.com>
 <20210722141351.13668-9-biju.das.jz@bp.renesas.com>
 <d493b1d2-6d05-9eb3-c5f5-f3828938fe56@gmail.com>
In-Reply-To: <d493b1d2-6d05-9eb3-c5f5-f3828938fe56@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1269d2a8-77bc-4743-dd0a-08d951b063dd
x-ms-traffictypediagnostic: TYAPR01MB4878:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB487860C24B37D32FEB67645F86EA9@TYAPR01MB4878.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K2i+wcf7zSNIIIlLr4NUNDP2pgleKThPjDkcG6wMudygT6aADh/zUYe8qvi3NozizTRPJmuKlZ219nsjlu8HZzbD3XsrNrDVcBUgAEAdh7BGFD/m/10rEAVLxS/bXPmE3VyI6ntlA8s0L78TR1qDbsQOhRscBs7B+AKbjV3WDQF7oWfjda1z1J1bW4f5xIB8RxrTSXolguE4g5jAQisz2UfVDsXLvOOrA0y/xUsNot+GpWkl+4Sj+z0ensIY4HSWVAN1KFeQUAgAwAkBndO0Y9mc5wxm3+kZtGmKyWSlCN+1J39qDvGvmbrKYuLPbTARuU/3FnYwzkGOI4CNMBLoMAUJhPwpvrBnYXOMj4R6Vb53UV1+n0C4HjEhH6N+dJBvbZsqwbu47EfBTu8520LKqK565lr9ggXyTszXjpnadUenZEg8pNVOmMtZFkWEGAvrD5CPFkM23+h/EzhsusoF7Pa7acv/QZPXCICRrCxR8bmiq81/HsqQQzLcGCPvwt5AwQWRbE1knjcQpE1WchHrmbAEp9wq36Y/MPxVMTzY7kEV+lugYTGMCzjolJl5STgJurFmmSUMD1egXm2uvYxSHBIaPd/YXnDmxY3KwBteaZmmyvUPScf46njTQLovXTb3GI1KeZBOlsTz2EGYthq7v0Thysl8WaAxzYz4veKBUxqMdFo3RoI922He2obbXo78dVMwZoLPxzkmuUZSlGtR0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(9686003)(7416002)(38100700002)(26005)(5660300002)(6506007)(53546011)(4326008)(55016002)(478600001)(2906002)(8676002)(122000001)(186003)(7696005)(107886003)(8936002)(83380400001)(66946007)(66556008)(66446008)(76116006)(52536014)(110136005)(86362001)(316002)(71200400001)(64756008)(66476007)(54906003)(38070700005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHJ1aUFiMUtlS1dVUFhxc1M2TUxCZWNPdFF4VEFGekQxZ0RDcW5uTzFHMmk4?=
 =?utf-8?B?K1RaWlNCTnBLMis3ZVUrMW9WNVZJRUY4ZGI1UGxqbFE2OUdPNmRYWVMwdVM0?=
 =?utf-8?B?b01JNUZyTytDY3B1NXFjZTk2MDBjSXk1TzhFa0pWR1N6eXJ2cGtSNW5OSzl6?=
 =?utf-8?B?dmlReERFRDROUHdTMXJxSW8rMVJqK2diZE5kZkd6elZHZ24yTStYMXZVdWps?=
 =?utf-8?B?MGVoR3V1YWsvVXhuYTNaYkUwa0daNVA4K1hJTHJwTHVhU3R3aCsva3RINWp3?=
 =?utf-8?B?S3BRRDZkUmVkUHcwbkU5M0M4d0w0ZTI0MUpzQWN5RmtQUVVicUdrMVZUVWlp?=
 =?utf-8?B?aUoxNmdhNERic04rS1ZPREFVKzVCRVhXTVNyVE9VNmtjRTY2K0xxTlpnUVdG?=
 =?utf-8?B?eWJvcDNtYlhUOEZyeHQxVjEwZXZZLzFaRndYdXNzaE5Kd3BPM1g4M29rbURo?=
 =?utf-8?B?b2M2UjdmZTVHL2dCMnVOWk1UTGVEa3RHK0F3MHpqVDJNWHFTaVlUS2xyRzdW?=
 =?utf-8?B?YnExa3N2S25LYitWZFVkUnVlUjROQU0xTURMbG1JRm1uU0g2TEMrZ3IzeU9h?=
 =?utf-8?B?WTdLbURicHh1MDZDZUhUMmdzMkkxOURqTU5LMmZSWWhSQUdnaWNqMU5JRjVC?=
 =?utf-8?B?RS9RQ0hjQ09JNTZhdUpYT3U0eG1scEluTUtGVnFVSzhZUUkwU2V6WXZSWDVX?=
 =?utf-8?B?aHkxdnNQZ09OWER4UG9mTWFpTVM3a0grMy9xc0JRTWp3cWR3SU1YdGtZbytu?=
 =?utf-8?B?eUZaOG5zdmxtcDk1a0ZYQ2ozZTZ0WUVsaFN2a2Q4TE5JNGppNlJuWGVBOGRp?=
 =?utf-8?B?TlVEVDFYekhqc3lDRU5GWTZFYTcrUXM1S0Q2Mk40cTFTRzJZTzhWV2xHY05N?=
 =?utf-8?B?SWNEZEdVUGk0S2hXd2xVSGs0UUlhVW5GN05yMTEzZkFlMlcwWUZ0T21nWFZH?=
 =?utf-8?B?N3FhR08vbHVhS1FrK3BOc0NxMXZsZjdldnV4WnlZRmdmbFRlM21oNzZoWlVW?=
 =?utf-8?B?cThMK2U4QXRaK25yVDZtSXBPSGozMFYyQlQvNjFKZUsyMmpSTGNBekZPWFlm?=
 =?utf-8?B?UlQ0M1JId0hBRU5jMGdtZmxEdFBEL3JXWVhFU0Flb2tETVJGekt2NTJMa3R1?=
 =?utf-8?B?VmUvK21FcXZiZFdrR2NBM3I3Mkd2aWh0cVdGdTNBMkFlbWtBS0g3ZWxEeFdD?=
 =?utf-8?B?N0VqR0poV25SeklZbmwxV0p5OWwzTWE5cWROQkw2d2VYZVcyeWF1TDh6dU1P?=
 =?utf-8?B?NXZHSTU2T2NrU2wrVUcyUUw0UVB1a0R5cVpSKzBPMUIveitqRk1IVWdJYXd3?=
 =?utf-8?B?eWtDaEx1S0JuY0VmMEdiR2Q4bHZQSE9MQlNZNFF4dXlzb0xqYTdMSThnNHJz?=
 =?utf-8?B?MWNicjJudHhOSStPR1QxbzBHSStqTXBaclBRdmtta2NJSXpMQUI0QW0ySVdU?=
 =?utf-8?B?NExNNlBsOWsyR0cvbS9PMGwyTG4rQ2ZOQzdKbTNkTEdoWmhTbEtZa3h3VzV2?=
 =?utf-8?B?ZnhWdFhzWW02bzVuQkJKaUQ1dzY1aU04TE51M1EyM05NR0g2bGtjN0luRldv?=
 =?utf-8?B?T01TTlRCQnNPczlqb2VRZVpVclYxekVtdFk0YlNrcEMxUS9lL3NXU05YWjBi?=
 =?utf-8?B?dittLzk3T1UrZVdxZEpkL2lLc3RLcEZBUkJCZ1N2SnFkbWlBQy9VeTFTVWd2?=
 =?utf-8?B?b1dSelU1a3g1VmlLOGNIVXhyNE4reWJQTUtCTGI3L3E2bjVYeUI3K2I5cWwz?=
 =?utf-8?Q?baK9KNF4ryIyhuU8HeqkpX+a5ePVA7ungJKFKHq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1269d2a8-77bc-4743-dd0a-08d951b063dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 10:13:47.9700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6XOdRXe7qrYWeXHdxSQtpeNrgvF9d8fkfGqTMSpcNps3DR8f9SRwb1JXnyjMHPnnl1tgyRoClaQsHaTxV1kgUI1tOitKPjZHgKE4Od0He4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4878
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIG5ldC1uZXh0IDA4LzE4XSByYXZiOiBBZGQgUi1DYXIgY29tbW9uIGZlYXR1cmVzDQo+
IA0KPiBIZWxsbyENCj4gDQo+IE9uIDcvMjIvMjEgNToxMyBQTSwgQmlqdSBEYXMgd3JvdGU6DQo+
IA0KPiA+IFRoZSBiZWxvdyBmZWF0dXJlcyBhcmUgc3VwcG9ydGVkIGJ5IGJvdGggUi1DYXIgR2Vu
MiBhbmQgR2VuMy4NCj4gPg0KPiA+IDEpIG1hZ2ljIHBhY2tldCBkZXRlY3Rpb24NCj4gPiAyKSBt
dWx0aXBsZSBUU1JRIHN1cHBvcnQNCj4gPiAzKSBleHRlbmRlZCBkZXNjcmlwdG9yIGluIHJ4DQo+
IA0KPiAgICBJIHRoaW5rIHRoaXMgb25lIHNob3VsZCBiZXR0ZXIgYmUgY2FsbGVkIHRpbWVzdGFt
cGluZy4uLg0KDQpPSy4gV2lsbCBjaGFuZ2UgaXQgdG8gdGltZXN0YW1wLg0KDQo+IA0KPiA+IDQp
IE5vIGhhbGYgZHVwbGV4IHN1cHBvcnQNCj4gDQo+ICAgIENvdWxkbid0IHdlIGF2b2lkIHRoZSAi
bmVnYXRpdmUiIGZlYXR1cmVzPw0KDQoxMCBNYnBzL0hhbGYgZHVwbGV4KEFzIHBlciB0aGUgY29t
bWVudCBiZWxvdykgaXMgbm90IHN1cHBvcnRlZCBpbiBSLUNhci4gTWF5IGJlIGl0IHNob3VsZCBi
ZSBhICJwb3NpdGl2ZSIgZmVhdHVyZSBmb3INClJaL0cyTC4gcHJvYmFibHkgd2UgbmVlZCB0byBh
ZGQgdGhpcyBhcyBwYXJ0IG9mIFJaL0cyTCBmZWF0dXJlLg0KDQo+IA0KPiA+IDUpIG92ZXJyaWRl
IG10dSBjaGFuZ2UNCj4gDQo+ICAgIEhtLCBJJ2Qgdm90ZSBmb3IgdGhlIGluZGl2aWR1YWwgcGF0
Y2hlcyBjb3ZlcmluZyBvbmx5IHNpbmdsZSBmZWF0dXJlLi4uDQoNCk9LLiBUaGF0IHdpbGwgbWFr
ZSBwYXRjaGVzIGFnYWluIHNpbXBsZXIuDQoNCj4gDQo+ID4gQWRkIGZlYXR1cmVzIGJpdHMgdG8g
c3VwcG9ydCB0aGUgc2FtZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jIHwgMTEwDQo+ID4gKysrKysr
KysrKysrKysrLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyks
IDM5IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVz
YXMvcmF2Yl9tYWluLmMNCj4gPiBpbmRleCBiM2M5OWY5NzQ2MzIuLjRlZjI1NjU1MzRkMiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+
ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiBbLi4u
XQ0KPiA+IEBAIC02ODAsMTEgKzY5NCwxNCBAQCBzdGF0aWMgdm9pZCByYXZiX3Jjdl9zbmRfZW5h
YmxlKHN0cnVjdA0KPiA+IG5ldF9kZXZpY2UgKm5kZXYpDQo+ID4gIC8qIGZ1bmN0aW9uIGZvciB3
YWl0aW5nIGRtYSBwcm9jZXNzIGZpbmlzaGVkICovICBzdGF0aWMgaW50DQo+ID4gcmF2Yl9zdG9w
X2RtYShzdHJ1Y3QgbmV0X2RldmljZSAqbmRldikgIHsNCj4gPiArCXN0cnVjdCByYXZiX3ByaXZh
dGUgKnByaXYgPSBuZXRkZXZfcHJpdihuZGV2KTsNCj4gPiArCWNvbnN0IHN0cnVjdCByYXZiX2Ry
dl9kYXRhICppbmZvID0gcHJpdi0+aW5mbzsNCj4gPiAgCWludCBlcnJvcjsNCj4gPg0KPiA+ICAJ
LyogV2FpdCBmb3Igc3RvcHBpbmcgdGhlIGhhcmR3YXJlIFRYIHByb2Nlc3MgKi8NCj4gPiAtCWVy
cm9yID0gcmF2Yl93YWl0KG5kZXYsIFRDQ1IsDQo+ID4gLQkJCSAgVENDUl9UU1JRMCB8IFRDQ1Jf
VFNSUTEgfCBUQ0NSX1RTUlEyIHwgVENDUl9UU1JRMywgMCk7DQo+ID4gKwlpZiAoaW5mby0+ZmVh
dHVyZXMgJiBSQVZCX01VTFRJX1RTUlEpDQo+ID4gKwkJZXJyb3IgPSByYXZiX3dhaXQobmRldiwg
VENDUiwNCj4gPiArCQkJCSAgVENDUl9UU1JRMCB8IFRDQ1JfVFNSUTEgfCBUQ0NSX1RTUlEyIHwN
Cj4gVENDUl9UU1JRMywgMCk7DQo+ID4gIAlpZiAoZXJyb3IpDQo+IA0KPiAgICBXaGF0IGlmIHRo
ZSBhYm92ZSAqaWYqIHNraXBzIHRoZSByYXZiX3dhaXQoKSBjYWxsIC0tIGRpZG4ndCB5b3UgZ2V0
IGENCj4gY29tcGxhaW50IGZyb20gZ2NjIGFib3V0IHRoZSB1bm5pbnRpYWxpemVkIHZhcmlhYmxl
Pw0KDQpHb29kIGNhdGNoIHdpbGwgaW5pdGlhbGl6ZSB3aXRoIGVycm9yID0gMCBhbmQgbGF0ZXIg
cGF0Y2ggd2hlbiB3ZSBhZGQgUlovRzJMLCB3aWxsIHJlbW92ZSB0aGlzIHVubmVjZXNzYXJ5IGlu
aXRpYWxpemF0aW9uLg0KDQo+IA0KPiBbLi4uXQ0KPiA+IEBAIC04MDgsMTEgKzgyNiwxNCBAQCBz
dGF0aWMgYm9vbCByYXZiX3F1ZXVlX2ludGVycnVwdChzdHJ1Y3QNCj4gPiBuZXRfZGV2aWNlICpu
ZGV2LCBpbnQgcSkNCj4gPg0KPiA+ICBzdGF0aWMgYm9vbCByYXZiX3RpbWVzdGFtcF9pbnRlcnJ1
cHQoc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYpICB7DQo+ID4gKwlzdHJ1Y3QgcmF2Yl9wcml2YXRl
ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7DQo+ID4gKwljb25zdCBzdHJ1Y3QgcmF2Yl9kcnZf
ZGF0YSAqaW5mbyA9IHByaXYtPmluZm87DQo+ID4gIAl1MzIgdGlzID0gcmF2Yl9yZWFkKG5kZXYs
IFRJUyk7DQo+ID4NCj4gPiAgCWlmICh0aXMgJiBUSVNfVEZVRikgew0KPiA+ICAJCXJhdmJfd3Jp
dGUobmRldiwgfihUSVNfVEZVRiB8IFRJU19SRVNFUlZFRCksIFRJUyk7DQo+ID4gLQkJcmF2Yl9n
ZXRfdHhfdHN0YW1wKG5kZXYpOw0KPiA+ICsJCWlmIChpbmZvLT5mZWF0dXJlcyAmIFJBVkJfRVhf
UlhfREVTQykNCj4gDQo+ICAgIFllYWgsIGRlZmluaXRlbHkgYSBiYWQgZmVhdHVyZSBuYW1lLi4u
DQpPSy4gQVMgeW91IHN1Z2dlc3RlZCwgd2lsbCBjaGFuZ2UgdGhlIG1hY3JvIFJBVkJfRVhfUlhf
REVTQyB0byByYXZiX3RpbWVzdGFtcCBmZWF0dXJlIGJpdCBsaWtlIHNoX2V0aC4NCg0KPiANCj4g
PiArCQkJcmF2Yl9nZXRfdHhfdHN0YW1wKG5kZXYpOw0KPiA+ICAJCXJldHVybiB0cnVlOw0KPiA+
ICAJfQ0KPiA+ICAJcmV0dXJuIGZhbHNlOw0KPiBbLi4uXQ0KPiA+IEBAIC0xMDY5LDE1ICsxMDkx
LDE3IEBAIHN0YXRpYyBpbnQgcmF2Yl9waHlfaW5pdChzdHJ1Y3QgbmV0X2RldmljZQ0KPiAqbmRl
dikNCj4gPiAgCQluZXRkZXZfaW5mbyhuZGV2LCAibGltaXRlZCBQSFkgdG8gMTAwTWJpdC9zXG4i
KTsNCj4gPiAgCX0NCj4gPg0KPiA+IC0JLyogMTBCQVNFLCBQYXVzZSBhbmQgQXN5bSBQYXVzZSBp
cyBub3Qgc3VwcG9ydGVkICovDQo+ID4gLQlwaHlfcmVtb3ZlX2xpbmtfbW9kZShwaHlkZXYsIEVU
SFRPT0xfTElOS19NT0RFXzEwYmFzZVRfSGFsZl9CSVQpOw0KPiA+IC0JcGh5X3JlbW92ZV9saW5r
X21vZGUocGh5ZGV2LCBFVEhUT09MX0xJTktfTU9ERV8xMGJhc2VUX0Z1bGxfQklUKTsNCj4gPiAt
CXBoeV9yZW1vdmVfbGlua19tb2RlKHBoeWRldiwgRVRIVE9PTF9MSU5LX01PREVfUGF1c2VfQklU
KTsNCj4gPiAtCXBoeV9yZW1vdmVfbGlua19tb2RlKHBoeWRldiwgRVRIVE9PTF9MSU5LX01PREVf
QXN5bV9QYXVzZV9CSVQpOw0KPiA+ICsJaWYgKGluZm8tPmZlYXR1cmVzICYgUkFWQl9OT19IQUxG
X0RVUExFWCkgew0KPiA+ICsJCS8qIDEwQkFTRSwgUGF1c2UgYW5kIEFzeW0gUGF1c2UgaXMgbm90
IHN1cHBvcnRlZCAqLw0KPiA+ICsJCXBoeV9yZW1vdmVfbGlua19tb2RlKHBoeWRldiwNCj4gRVRI
VE9PTF9MSU5LX01PREVfMTBiYXNlVF9IYWxmX0JJVCk7DQo+ID4gKwkJcGh5X3JlbW92ZV9saW5r
X21vZGUocGh5ZGV2LA0KPiBFVEhUT09MX0xJTktfTU9ERV8xMGJhc2VUX0Z1bGxfQklUKTsNCj4g
PiArCQlwaHlfcmVtb3ZlX2xpbmtfbW9kZShwaHlkZXYsIEVUSFRPT0xfTElOS19NT0RFX1BhdXNl
X0JJVCk7DQo+ID4gKwkJcGh5X3JlbW92ZV9saW5rX21vZGUocGh5ZGV2LA0KPiBFVEhUT09MX0xJ
TktfTU9ERV9Bc3ltX1BhdXNlX0JJVCk7DQo+ID4NCj4gPiAtCS8qIEhhbGYgRHVwbGV4IGlzIG5v
dCBzdXBwb3J0ZWQgKi8NCj4gPiAtCXBoeV9yZW1vdmVfbGlua19tb2RlKHBoeWRldiwgRVRIVE9P
TF9MSU5LX01PREVfMTAwMGJhc2VUX0hhbGZfQklUKTsNCj4gPiAtCXBoeV9yZW1vdmVfbGlua19t
b2RlKHBoeWRldiwgRVRIVE9PTF9MSU5LX01PREVfMTAwYmFzZVRfSGFsZl9CSVQpOw0KPiA+ICsJ
CS8qIEhhbGYgRHVwbGV4IGlzIG5vdCBzdXBwb3J0ZWQgKi8NCj4gPiArCQlwaHlfcmVtb3ZlX2xp
bmtfbW9kZShwaHlkZXYsDQo+IEVUSFRPT0xfTElOS19NT0RFXzEwMDBiYXNlVF9IYWxmX0JJVCk7
DQo+ID4gKwkJcGh5X3JlbW92ZV9saW5rX21vZGUocGh5ZGV2LA0KPiBFVEhUT09MX0xJTktfTU9E
RV8xMDBiYXNlVF9IYWxmX0JJVCk7DQo+IA0KPiAgICAgTWhtPyBTb21lIG9mIHRoZSBoYWxmLWR1
cGxleCBtb2RlcyBzcmUgdW5zdXBwb3J0ZWQgc3RpbGw/DQo+IA0KPiBbLi4uXQ0KPiA+IEBAIC0x
MzE0LDggKzEzMzgsOSBAQCBzdGF0aWMgdm9pZCByYXZiX2dldF93b2woc3RydWN0IG5ldF9kZXZp
Y2UNCj4gPiAqbmRldiwgc3RydWN0IGV0aHRvb2xfd29saW5mbyAqd29sKSAgc3RhdGljIGludCBy
YXZiX3NldF93b2woc3RydWN0DQo+ID4gbmV0X2RldmljZSAqbmRldiwgc3RydWN0IGV0aHRvb2xf
d29saW5mbyAqd29sKSAgew0KPiA+ICAJc3RydWN0IHJhdmJfcHJpdmF0ZSAqcHJpdiA9IG5ldGRl
dl9wcml2KG5kZXYpOw0KPiA+ICsJY29uc3Qgc3RydWN0IHJhdmJfZHJ2X2RhdGEgKmluZm8gPSBw
cml2LT5pbmZvOw0KPiA+DQo+ID4gLQlpZiAod29sLT53b2xvcHRzICYgfldBS0VfTUFHSUMpDQo+
ID4gKwlpZiAoKHdvbC0+d29sb3B0cyAmIH5XQUtFX01BR0lDKSB8fCAoIShpbmZvLT5mZWF0dXJl
cyAmDQo+ID4gK1JBVkJfTUFHSUMpKSkNCj4gDQo+ICAgIFBhcmVucyBhYm91dCAheCBub3QgbmVl
ZGVkLiBBbmQgSSB0aGluayB0aGUgc2Vjb25kIG9wZXJhbmQgc2hvdWxkIGNvbWUNCj4gZmlyc3Qg
aW5zdGVhZC4uLg0KDQpPSy4NCg0KPiANCj4gPiAgCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4N
Cj4gPiAgCXByaXYtPndvbF9lbmFibGVkID0gISEod29sLT53b2xvcHRzICYgV0FLRV9NQUdJQyk7
DQo+IFsuLi5dDQo+ID4gQEAgLTE1OTUsMjggKzE2MjEsMzAgQEAgc3RhdGljIG5ldGRldl90eF90
IHJhdmJfc3RhcnRfeG1pdChzdHJ1Y3QNCj4gc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2Rldmlj
ZSAqbmRldikNCj4gPiAgCWRlc2MtPmRwdHIgPSBjcHVfdG9fbGUzMihkbWFfYWRkcik7DQo+ID4N
Cj4gPiAgCS8qIFRYIHRpbWVzdGFtcCByZXF1aXJlZCAqLw0KPiA+IC0JaWYgKHEgPT0gUkFWQl9O
Qykgew0KPiA+IC0JCXRzX3NrYiA9IGttYWxsb2Moc2l6ZW9mKCp0c19za2IpLCBHRlBfQVRPTUlD
KTsNCj4gPiAtCQlpZiAoIXRzX3NrYikgew0KPiA+IC0JCQlpZiAobnVtX3R4X2Rlc2MgPiAxKSB7
DQo+ID4gLQkJCQlkZXNjLS07DQo+ID4gLQkJCQlkbWFfdW5tYXBfc2luZ2xlKG5kZXYtPmRldi5w
YXJlbnQsIGRtYV9hZGRyLA0KPiA+IC0JCQkJCQkgbGVuLCBETUFfVE9fREVWSUNFKTsNCj4gPiAr
CWlmIChpbmZvLT5mZWF0dXJlcyAmIFJBVkJfRVhfUlhfREVTQykgew0KPiANCj4gICAgRGVmaW5p
dGVseSBhIGJhZCBuYW1lLi4uDQoNCk9LLg0KDQo+IA0KPiBbLi4uXQ0KPiA+IEBAIC0yMjA1LDgg
KzIyMzUsMTAgQEAgc3RhdGljIGludCByYXZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UN
Cj4gKnBkZXYpDQo+ID4gIAl9DQo+ID4gIAljbGtfcHJlcGFyZV9lbmFibGUocHJpdi0+cmVmY2xr
KTsNCj4gPg0KPiA+IC0JbmRldi0+bWF4X210dSA9IDIwNDggLSAoRVRIX0hMRU4gKyBWTEFOX0hM
RU4gKyBFVEhfRkNTX0xFTik7DQo+ID4gLQluZGV2LT5taW5fbXR1ID0gRVRIX01JTl9NVFU7DQo+
ID4gKwlpZiAoaW5mby0+ZmVhdHVyZXMgJiBSQVZCX09WRVJSSURFX01UVV9DSEFOR0UpIHsNCj4g
DQo+ICAgIFdoeT8gOi0vIENvdWxkIHlvdSB0ZWxsIG1lIG1vcmUgZGV0YWlscz8NCg0KUlggYnVm
ZiBzaXplID0gMjA0OCBmb3IgUi1DYXIgd2hlcmUgYXMgaXQgaXMgOEsgZm9yIFJaL0cyTC4NClNv
IERvIHlvdSB0aGluayB3ZSBzaG91bGQgdXNlIHRoZSBzYW1lIG1heF9tdHUgZm9yIFJaL0cyTCBh
cyB3ZWxsPw0KDQpQbGVhc2UgbGV0IHVzIGtub3cgeW91ciByZWNvbW1lbmRhdGlvbiBoZXJlIGlu
IHRoaXMgY2FzZT8gIFRoZSBvcmlnaW5hbCBic3AgY29kZSB1c2VkIGRlZmF1bHQgImV0aF9tdHVf
Y2hhbmdlIg0Kd2hpY2ggaXMgbm93IGRlcHJlY2F0ZWQuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4g
DQo+ID4gKwkJbmRldi0+bWF4X210dSA9IDIwNDggLSAoRVRIX0hMRU4gKyBWTEFOX0hMRU4gKyBF
VEhfRkNTX0xFTik7DQo+ID4gKwkJbmRldi0+bWluX210dSA9IEVUSF9NSU5fTVRVOw0KPiA+ICsJ
fQ0KPiA+DQo+ID4gIAlwcml2LT5udW1fdHhfZGVzYyA9IGluZm8tPm51bV90eF9kZXNjOw0KPiA+
DQo+IA0KPiBNQlIsIFNlcmdlaQ0K

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447723F4990
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Aug 2021 13:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhHWLTt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Aug 2021 07:19:49 -0400
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:63264
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235083AbhHWLTd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Aug 2021 07:19:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAAXTNrIDxY2ZIqAxcme2FNF/nv1uW6ynvYKD8WTZm09hKWwWb36IekUCnQ6+iAnO0C4DPBLR5tPLlMupJN3jgU2MVJndYbMp3RPl86AfwbaE3Q0EmFmM1cb/rWQ3bb7lThrHNfnwC8EzK+UGz3XFbjK72zDKiYiJIj3SDS6w0YvIxYyZSpwmseMfyYHYQMA6LIweEmMOdQrkeoyOdeo46kT5mvvsbr0T22nKIntfxlPVsSruDGByPZLPEtAM7F8A8aLPORvrs7N1HL3Nvkb2t8IfYmzUkJSLZUROSTOHpwBSFU0YEmbBCmCoWuJWESmiQyo+LDA9vYJLZgHUTZhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPzcmuKITNj4JwGqFnr8WHdeX6PwP+KUL2gr9Hv8D5Q=;
 b=H37G1nP6g693NoN1n52582DuL1/B9ksrHsua4yFL0Z493A6cp9c53qOq5QeZl4aVJxh+hEBmOQxEqSMvMDYjXGazlV5vKkG7r2vJObUR1p4N1YxliPamHy8gRwx6jCgHol4t3MDuyk4OMr/1dQn0zKnkbGJMsvNMIJUu/gbLLj/FiYilmI6/poMT6ymCT3Fv5QIJqUm1nxcWdeo/M0vdwrUYckcBlc0jUN4GzxA5Qcq8YqikB31LtvRT7EOBxzcoyCv8GTTrNPAT2AqYz07U3IT+xZvaKF3XOv7pp6sGDrGkZ1QbORq23THQ7xd67sbiiVLLPSEdbvqH60lzV+GTUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPzcmuKITNj4JwGqFnr8WHdeX6PwP+KUL2gr9Hv8D5Q=;
 b=UKTyqb9MK004HKU9vqz2MF10bOF1a6Lj30pspmrmSQWPxbZ6M3whNQgB4CK1yhosoQ//DmP0t7M9zZH+soJK4Exsf10dCMHu4prF3E8tEAjfDmyCIJqyNGD5DcMC3jKm5X0qY7DFFFvn+fbvGIndpUGUr2H46ErV7GEUr/KkyRE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5432.jpnprd01.prod.outlook.com (2603:1096:604:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 23 Aug
 2021 11:18:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e111:61:43af:3b98]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e111:61:43af:3b98%3]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 11:18:45 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle coupled
 clocks
Thread-Topic: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle
 coupled clocks
Thread-Index: AQHXkcCRmNECTeakTEKTkpDF65Tyd6uA5+UAgAAUm+A=
Date:   Mon, 23 Aug 2021 11:18:44 +0000
Message-ID: <OS0PR01MB592221C0F7BBD92216EDA1B986C49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
 <20210815103014.21208-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdXj8xmJ0ySOJQ74AjkTDJUQwTJ93rYjyRPnJ1dwGfj1xg@mail.gmail.com>
In-Reply-To: <CAMuHMdXj8xmJ0ySOJQ74AjkTDJUQwTJ93rYjyRPnJ1dwGfj1xg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b61ce007-38ce-487e-c42c-08d96627c56f
x-ms-traffictypediagnostic: OSYPR01MB5432:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSYPR01MB5432D89AEB6944A2A2B26E2D86C49@OSYPR01MB5432.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:517;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nTz/Z0/XRED10dYRuJuF41TLEdCC6AoN6dkVf+aPE8gqhS5tZ9y26MM7/pRiESdv6R7p0wrT9BQoxqZBV++E7XJwLQbMrop0ZhRxJd+/uz7K07qEyycuW34g3g4K3b8qm2b9SBVowekL+vgY9n0S4G6KBA8tdNIp2j865cpCQv1KSuOJyNK9PNU8VaNNdWHLRDFIFEwLf7QKNQdtwzDsD+U31vX9VcE1bahKYRDZUYVnuGi1Jp527UbZHwTwe99CvaotQat5y9p0n5sHIUCv3NpQEq0y+51x3wesKq2CaRCV8kTNEEH4al2QdpAAinbSPCq3Yco457d4zjbLvnAp7DRJuHP9pVFU5jRWdhMWNwAn2fEfgudUEUQPBgz2eleYhw/YHBUNfYRGEhTXnVcS1LUhrcBKpXNoHzbQRlOlLej//AuYpZ+7G13S3S6YiMj2L5dICGXqMr2KZv+GoLY5XsuO3r/bHCZM89Wxt95XapeM0EEOEyVO7HmozMYlr3JZCQHdFCVEoM1HFSyMJdX2FTGDaV7pbpc+m5ysZz4HeI3lC9EKtsHD9lX3aaa6rmv4cz9wL3Wgmo4nCqPMYNwtfEjXv4e4KN1IK7JwtEUdOMvAal6hJoyDriSUPIXF7dJqJRzlMPcPcHd5awAC4vmD35oyzbQkI+RHrz+1LcCbA5bDSAF7sI6SOU0f17m03BX7ZvjkEgcWyaooPQiWm1MsNg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(366004)(346002)(396003)(66476007)(66556008)(64756008)(76116006)(4326008)(122000001)(66446008)(8936002)(186003)(9686003)(38070700005)(52536014)(66946007)(107886003)(478600001)(316002)(83380400001)(86362001)(71200400001)(53546011)(55016002)(7696005)(6506007)(5660300002)(26005)(38100700002)(33656002)(8676002)(54906003)(6916009)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NW5VRDJ1K0NTMjVCREdHa2ZFc3NvYXp5ekFERU85Tm1GZnUxRGcyYWw2OHg1?=
 =?utf-8?B?eUJKL1A4c1JkWm1CaWhwMks4VjdoQ1NDc3lSVWcyL0g4eXpTR1QvSjkrSzI3?=
 =?utf-8?B?SStCVGpwM3NrdHJValBEYXBFalByQUxSQzZzVGVZUVBlNDJzTUNFTThDMisv?=
 =?utf-8?B?QVR6dG5hcTdvcUNoQWttSHEwN3NWeFVwSFA3RHExNFdQSFg3cEVlTmxzZzhS?=
 =?utf-8?B?cmVKZzA2Uk5wcjdZenJzWWpBVGxmZjA1MExxcmhoSUN6RGVJOWFoY1UvTGxi?=
 =?utf-8?B?dHdhcEQxL2JIdGR6YThhZWNWc1VEMXRtRFJkaXVJZkZZazQ5TWlCY0daRWM4?=
 =?utf-8?B?cjZESEZ1RHdRa3QwQkdUallwTmN3dExuS0RzVFhRM3F4SWR3UFE1dTdkR1V4?=
 =?utf-8?B?TkN6dmpPcmo0REZjeGQ2bHJkUmZ1YnY5VWhseEZVWjB2UTVrcWhMSW10OERl?=
 =?utf-8?B?dmVuQ2ZrQ2EwMTlMN01GbGFlR2FKUXBhN0dJL0I0U0N2TVhLZ1NPRWFGOXFG?=
 =?utf-8?B?d1h5cHllbjQ3RVROdUs3ejQ3NjR4SU9PV2N5cG4wK3NYQ0hTcUREWXBJNnVK?=
 =?utf-8?B?N01zNEFIRTc0ek1nOG92VXpObVBURmlkaHdrVEEzTm5NVVdCY285elZpYnJF?=
 =?utf-8?B?VlVKQSt0ZEZxMHAxZmJxclFIM3VWK3A5L0xMSlprMU1rL1RQcGlRWG9tb1ow?=
 =?utf-8?B?eU9zeVhlSkxmREV5NXJ5L3owS1MxMDl1Y3lZSm5hSGh5bDhoYWNpcDhaTjEr?=
 =?utf-8?B?Z2hvSktXUnFUcHZPTlN5aWE2VnQxZUpjWVVXcTJXZWRibmZxbmVhQkdLSU1K?=
 =?utf-8?B?MlZRWWh0dUV5d2Q1NXc2ZHRXZThHUFlQekQxUXc5QkdQejV1c0pKbTJ0Y2Zp?=
 =?utf-8?B?SGxjaVREQnRRdjRsaU1IWmNkaElJWWZJdWJsYTZoYWkrVmxNQVo5U1VBL0hD?=
 =?utf-8?B?Z2VxejA2OEtyNWc1RXNrQUNLeWdrbC9EREF3ZDdLZ1MyQWZIUVo1U21rUTcy?=
 =?utf-8?B?RFZNdVo5Mmo5OXM0S3duakdRK0UxcTdNTE5ueWN0VlpkMG1qZ3F3TWIrRVBR?=
 =?utf-8?B?N2psOUZPQmJMQUNHM3lhemFabTdRbTFTY0NIbjg5QXlKNFRjbHpxZ2QxcGYv?=
 =?utf-8?B?UXFlblVUUG5vdmZubnB2ZUV1eWVvSjFiUUtWL0I1YlE3akVPYWJPN1o4MzJZ?=
 =?utf-8?B?NnlqRkpyejhMaG92VDI4b0NSeVRKQTlGTnloMzJNRHJrWTdpZ3JzaTFMR2FL?=
 =?utf-8?B?NXh3bExPay9id2V3djh5bnVFL2RIZlhGSTlSVHJsemhGSjRvdzl6Q0F5eUVD?=
 =?utf-8?B?MklLZGQ4eEJVMjlFYzFXU2lsV3h4WVY1aXdibFNiT2hjRW4rM2ZLSGZpamVy?=
 =?utf-8?B?RHhIOFpLZkJGNnBjQ2F2QW5qSlcwaEpVOWdWQ1IybWJrUkxRT0lXdzlySE1s?=
 =?utf-8?B?TVVkaTAyWlFyM1Fxb0lGVzRINzIyd1lXejRHZ0liU1kzMVpDeDhjcytzOFdW?=
 =?utf-8?B?cGlQQ2lUNFB0ZjNTNmpmaElMSWxBWk52cmgyYjBJSmlMSG9mMTBkWWtZWEtp?=
 =?utf-8?B?dDFqQzhVVklUUDd6RDJjYWZVbk1rRlhIcXJURGRueWlxY2o3NThxekpoWnNW?=
 =?utf-8?B?d2w5WmdvNytOQjY2NWEydkhKUEVWeFhDK29Od1ZOYXdCbnBTMXNuZytsTXIz?=
 =?utf-8?B?dms1WEQzQ2kzaTVrNktzZkJSOFp2V0xDQVFQM2QvSlV1c1JMYVFyRzhnL015?=
 =?utf-8?Q?Alf7HnfE+Y/y6zfmJU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b61ce007-38ce-487e-c42c-08d96627c56f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 11:18:45.0127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZbJyaEB0Xi8/wzsfJ5dyitDDMitPFnZ5C+4j7/eeacTQI72/scY8Ls/gKI//bq/Z5MlKt+2jIUofyl6jWxFNljeZ9pkZQUpDnikMjX7GT6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5432
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMy80XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgc3VwcG9ydCB0byBoYW5kbGUN
Cj4gY291cGxlZCBjbG9ja3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4sIEF1ZyAxNSwg
MjAyMSBhdCAxMjozMCBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IHdyb3RlOg0KPiA+IFRoZSBBWEkgYW5kIENISSBjbG9ja3MgdXNlIHRoZSBzYW1lIHJlZ2lzdGVy
IGJpdCBmb3IgY29udHJvbGxpbmcgY2xvY2sNCj4gPiBvdXRwdXQuIEFkZCBhIG5ldyBjbG9jayB0
eXBlIGZvciBjb3VwbGVkIGNsb2Nrcywgd2hpY2ggc2V0cyB0aGUNCj4gPiBDUEdfQ0xLT05fRVRI
LkNMS1swMV1fT04gYml0IHdoZW4gYXQgbGVhc3Qgb25lIGNsb2NrIGlzIGVuYWJsZWQsIGFuZA0K
PiA+IGNsZWFycyB0aGUgYml0IG9ubHkgd2hlbiBib3RoIGNsb2NrcyBhcmUgZGlzYWJsZWQuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+ID4gICogUmV3b3Jr
ZWQgYXMgcGVyIEdlZXJ0J3Mgc3VnZ2VzdGlvbg0KPiA+ICAqIEFkZGVkIGVuYWJsZWQgZmxhZyB0
byB0cmFjayB0aGUgc3RhdHVzIG9mIGNsb2NrLCBpZiBpdCBpcyBjb3VwbGVkDQo+ID4gICAgd2l0
aCBhbm90aGVyIGNsb2NrDQo+ID4gICogSW50cm9kdWNlZCBzaWJsaW5ncyBwb2ludGVyIHdoaWNo
IHBvaW50cyB0byB0aGUgb3RoZXIgY291cGxlZA0KPiA+ICAgIGNsb2NrDQo+ID4gICogY291cGxl
ZCBjbG9jayBsaW5raW5nIGlzIGRvbmUgZHVyaW5nIG1vZHVsZSBjbGsgcmVnaXN0ZXIuDQo+ID4g
ICogcnpnMmxfbW9kX2Nsb2NrX2lzX2VuYWJsZWQgZnVuY3Rpb24gcmV0dXJucyBzb2Z0IHN0YXRl
IG9mIHRoZQ0KPiA+ICAgIG1vZHVsZSBjbG9ja3MsIGlmIGl0IGlzIGNvdXBsZWQgd2l0aCBhbm90
aGVyIGNsb2NrDQo+ID4gICogVXBkYXRlZCB0aGUgY29tbWl0IGhlYWRlcg0KPiANCj4gVGhhbmtz
IGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJs
LWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+IEBA
IC0zOTIsMTEgKzM5NiwzNSBAQCBzdGF0aWMgaW50IHJ6ZzJsX21vZF9jbG9ja19lbmRpc2FibGUo
c3RydWN0DQo+ID4gY2xrX2h3ICpodywgYm9vbCBlbmFibGUpDQo+ID4NCj4gPiAgc3RhdGljIGlu
dCByemcybF9tb2RfY2xvY2tfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KSAgew0KPiA+ICsgICAg
ICAgc3RydWN0IG1zdHBfY2xvY2sgKmNsb2NrID0gdG9fbW9kX2Nsb2NrKGh3KTsNCj4gPiArICAg
ICAgIHN0cnVjdCBtc3RwX2Nsb2NrICpzaWJsaW5ncyA9IGNsb2NrLT5zaWJsaW5nczsNCj4gPiAr
DQo+ID4gKyAgICAgICBpZiAoc2libGluZ3MpIHsNCj4gPiArICAgICAgICAgICAgICAgaWYgKHNp
YmxpbmdzLT5lbmFibGVkKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stPmVu
YWJsZWQgPSB0cnVlOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+
ICsgICAgICAgICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBjbG9jay0+ZW5h
YmxlZCA9IHRydWU7DQo+IA0KPiBjbG9jay0+ZW5hYmxlZCBpcyBzZXQgdG8gdHJ1ZSByZWdhcmRs
ZXNzIG9mIHRoZSBpZiBjb25kaXRpb24uDQo+IFRoaXMgYWxzbyBuZWVkcyBsb2NraW5nLCBpbiBj
YXNlIGJvdGggY2xvY2tzIGFyZSBjaGFuZ2VkIGNvbmN1cnJlbnRseToNCg0KQWdyZWVkLiBJdCBu
ZWVkcyBsb2NraW5nLg0KDQo+IA0KPiAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnByaXYtPnJtd19s
b2NrLCBmbGFncyk7DQo+ICAgICBlbmFibGVkID0gc2libGluZ3MtPmVuYWJsZWQ7DQo+ICAgICBj
bG9jay0+ZW5hYmxlZCA9IHRydWU7DQo+ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwcml2
LT5ybXdfbG9jaywgZmxhZ3MpOw0KPiAgICAgaWYgKGVuYWJsZWQpDQo+ICAgICAgICAgICAgIHJl
dHVybiAwOw0KPiANCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICByZXR1cm4gcnpn
MmxfbW9kX2Nsb2NrX2VuZGlzYWJsZShodywgdHJ1ZSk7ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZv
aWQgcnpnMmxfbW9kX2Nsb2NrX2Rpc2FibGUoc3RydWN0IGNsa19odyAqaHcpICB7DQo+ID4gKyAg
ICAgICBzdHJ1Y3QgbXN0cF9jbG9jayAqY2xvY2sgPSB0b19tb2RfY2xvY2soaHcpOw0KPiA+ICsg
ICAgICAgc3RydWN0IG1zdHBfY2xvY2sgKnNpYmxpbmdzID0gY2xvY2stPnNpYmxpbmdzOw0KPiA+
ICsNCj4gPiArICAgICAgIGlmIChzaWJsaW5ncykgew0KPiA+ICsgICAgICAgICAgICAgICBpZiAo
c2libGluZ3MtPmVuYWJsZWQpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay0+
ZW5hYmxlZCA9IGZhbHNlOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsNCj4g
PiArICAgICAgICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgY2xvY2stPmVu
YWJsZWQgPSBmYWxzZTsNCj4gDQo+IExpa2V3aXNlLg0KT0suDQoNCj4gDQo+ID4gKyAgICAgICB9
DQo+ID4gKw0KPiA+ICAgICAgICAgcnpnMmxfbW9kX2Nsb2NrX2VuZGlzYWJsZShodywgZmFsc2Up
OyAgfQ0KPiA+DQo+ID4gQEAgLTQxMiw2ICs0NDAsOSBAQCBzdGF0aWMgaW50IHJ6ZzJsX21vZF9j
bG9ja19pc19lbmFibGVkKHN0cnVjdCBjbGtfaHcNCj4gKmh3KQ0KPiA+ICAgICAgICAgICAgICAg
ICByZXR1cm4gMTsNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICsgICAgICAgaWYgKGNsb2NrLT5z
aWJsaW5ncykNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGNsb2NrLT5lbmFibGVkOw0KPiA+
ICsNCj4gPiAgICAgICAgIHZhbHVlID0gcmVhZGwocHJpdi0+YmFzZSArIENMS19NT05fUihjbG9j
ay0+b2ZmKSk7DQo+ID4NCj4gPiAgICAgICAgIHJldHVybiAhKHZhbHVlICYgYml0bWFzayk7DQo+
ID4gQEAgLTQyMywxMSArNDU0LDMzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyByemcy
bF9tb2RfY2xvY2tfb3BzID0NCj4gew0KPiA+ICAgICAgICAgLmlzX2VuYWJsZWQgPSByemcybF9t
b2RfY2xvY2tfaXNfZW5hYmxlZCwgIH07DQo+ID4NCj4gPiArc3RhdGljIHN0cnVjdCBtc3RwX2Ns
b2NrDQo+ID4gKypyemcybF9jcGdfZ2V0X3NpYmxpbmdfY2xrKHN0cnVjdCBtc3RwX2Nsb2NrICpj
bG9jaywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcnpnMmxfY3BnX3By
aXYgKnByaXYpIHsNCj4gPiArICAgICAgIHN0cnVjdCBtc3RwX2Nsb2NrICpzaWJsX2NsayA9IE5V
TEw7DQo+IA0KPiBjbGs/DQo+IEl0J3Mgb25seSBhIHNpYmxpbmcgd2hlbiB0aGUgY29uZGl0aW9u
IGluc2lkZSB0aGUgbG9vcCBpcyB0cnVlLg0KDQpPSywgd2lsbCBkZWNsYXJlICJjbGsiIGluc2lk
ZSBmb3IgbG9vcCB0byBsaW1pdCB0aGUgc2NvcGUuDQoNCj4gDQo+ID4gKyAgICAgICBzdHJ1Y3Qg
Y2xrX2h3ICpodzsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBpOw0KPiA+ICsNCj4gPiArICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBwcml2LT5udW1fbW9kX2Nsa3M7IGkrKykgew0KPiA+ICsgICAg
ICAgICAgICAgICBpZiAocHJpdi0+Y2xrc1twcml2LT5udW1fY29yZV9jbGtzICsgaV0gPT0gRVJS
X1BUUigtDQo+IEVOT0VOVCkpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBodyA9IF9fY2xrX2dldF9odyhwcml2LT5jbGtz
W3ByaXYtPm51bV9jb3JlX2Nsa3MgKyBpXSk7DQo+ID4gKyAgICAgICAgICAgICAgIHNpYmxfY2xr
ID0gdG9fbW9kX2Nsb2NrKGh3KTsNCj4gPiArICAgICAgICAgICAgICAgaWYgKGNsb2NrLT5vZmYg
PT0gc2libF9jbGstPm9mZiAmJiBjbG9jay0+Yml0ID09DQo+IHNpYmxfY2xrLT5iaXQpDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+
ICsgICAgICAgcmV0dXJuIHNpYmxfY2xrOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICBzdGF0aWMgdm9p
ZCBfX2luaXQNCj4gPiAgcnpnMmxfY3BnX3JlZ2lzdGVyX21vZF9jbGsoY29uc3Qgc3RydWN0IHJ6
ZzJsX21vZF9jbGsgKm1vZCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgcnpnMmxfY3BnX2luZm8gKmluZm8sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2KSAgew0KPiA+ICsgICAgICAgc3RydWN0IG1z
dHBfY2xvY2sgKnNpYmxpbmdfY2xvY2sgPSBOVUxMOw0KPiA+ICAgICAgICAgc3RydWN0IG1zdHBf
Y2xvY2sgKmNsb2NrID0gTlVMTDsNCj4gPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IHBy
aXYtPmRldjsNCj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBpZCA9IG1vZC0+aWQ7DQo+ID4gQEAg
LTQ4NCw2ICs1MzcsMTUgQEAgcnpnMmxfY3BnX3JlZ2lzdGVyX21vZF9jbGsoY29uc3Qgc3RydWN0
DQo+ID4gcnpnMmxfbW9kX2NsayAqbW9kLA0KPiA+DQo+ID4gICAgICAgICBkZXZfZGJnKGRldiwg
Ik1vZHVsZSBjbG9jayAlcEMgYXQgJWx1IEh6XG4iLCBjbGssDQo+IGNsa19nZXRfcmF0ZShjbGsp
KTsNCj4gPiAgICAgICAgIHByaXYtPmNsa3NbaWRdID0gY2xrOw0KPiA+ICsNCj4gPiArICAgICAg
IGlmIChtb2QtPmlzX2NvdXBsZWQpIHsNCj4gPiArICAgICAgICAgICAgICAgc2libGluZ19jbG9j
ayA9IHJ6ZzJsX2NwZ19nZXRfc2libGluZ19jbGsoY2xvY2ssIHByaXYpOw0KPiA+ICsgICAgICAg
ICAgICAgICBpZiAoc2libGluZ19jbG9jaykgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNsb2NrLT5zaWJsaW5ncyA9IHNpYmxpbmdfY2xvY2s7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgc2libGluZ19jbG9jay0+c2libGluZ3MgPSBjbG9jazsNCj4gPiArICAgICAgICAgICAg
ICAgfQ0KPiANCj4gWW91IGZvcmdvdCB0byBpbml0aWFsaXplIG1zdHBfY2xvY2suZW5hYmxlZCB0
byBtYXRjaCB0aGUgY3VycmVudCBoYXJkd2FyZQ0KPiBzdGF0ZS4NCg0KT0suIHdpbGwgaW5pdGlh
bGl6ZSBtc3RwX2Nsb2NrLmVuYWJsZWQgdG8gbWF0Y2ggdGhlIGN1cnJlbnQgaGFyZHdhcmUgc3Rh
dGUuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gICAg
ICAgICByZXR1cm47DQo+ID4NCj4gPiAgZmFpbDoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5
dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGgg
dGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K

Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF922E0BA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 15:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgLVO1t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 09:27:49 -0500
Received: from mail-eopbgr1300101.outbound.protection.outlook.com ([40.107.130.101]:33716
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726868AbgLVO1s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 09:27:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aM0dCa3/hVxPLwrF32pMaNs/piJsdfCSh90zf8UUBoPdFLCFQODYYvr6L0JIeeSvaLzJzu3SuSic0uJR/Ue/s7l95Q5bcqPl7kYUOyG3p/sJKtJN48ZqXYe9RNhNxqsJIsBU6vYsLX1lbzM4trPBhiLBeXB7bsOT3Z2GUmR1sHwggDzCZzAigOKuS6jncYlf/sPXc2qYrGUb8u8gGBklMVSelEWbf9VI2ix0pAFYl49iHs46PUXkAB8WmxgsZOk7HHGgvS/oVoA+0JsL1QAicJkwuzlV7a+8tDClP4+6/SP8pizI8deGPxPTAUMajuc9Ov18frfsZdsJKFScUX0Mig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8TYun6A9IzfvlRFWkNpvomIjr4euVp4bOLakLl1lmQ=;
 b=kl7++DbC3eCYskITN7LsWLVEJFO3UFUoKl2utyZ+dkDumOusv4xUGKhE+Tud1FBpcnfjSzYu+2II7kSVE8IcDKd6/acrQs89BSTPmcSvB1yrhSz+KHES5xidbHpkf3jn6or7dbREIjOrxUwMWE9tW+etY9u5DNyESEPgSuQh15OBgAnN5h0kpPm2XsIv85OlWAyUVEVBp2KB9bpxrbS3b5A+mlu9D6CfmRQzHdJpzO0qsP1GVAZqE4zJLD3/ntvdRj/KBFMwCN09Rot2ACj3Dl6YFpVoLmRlqfWnsCdIowfBwzxwOLg/b37E4hTNSIGFKjYFBdBVgD2k/MJoFCHD9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8TYun6A9IzfvlRFWkNpvomIjr4euVp4bOLakLl1lmQ=;
 b=EZuJBGsn+YG1/1ZUEF2q6jcJOa9+n5wNxX+O8MP+/XCWKbHFN5+YfdejiOHGJdWX+99QvNRESVOXDOCLRZioRw8bBjgrTKQmrzxMDTR0LQIKMxM+wBIulxZjgdT3Iah3S1CBlpBBFwOny3gYTQRkghbWuddmfqMh3grO94oVlIA=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB3019.jpnprd01.prod.outlook.com
 (2603:1096:404:76::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Tue, 22 Dec
 2020 14:26:12 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 14:26:12 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 17/18] arm64: dts: renesas: Introduce
 r8a774b1-beacon-rzg2n-kit
Thread-Topic: [PATCH 17/18] arm64: dts: renesas: Introduce
 r8a774b1-beacon-rzg2n-kit
Thread-Index: AQHW0X/yUb2zKQTn3kamQXZEmUfAzKn7MkMAgAf/z4CAAASSIA==
Date:   Tue, 22 Dec 2020 14:26:12 +0000
Message-ID: <TYBPR01MB53093D77544B64F42616615486DF0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20201213183759.223246-1-aford173@gmail.com>
 <20201213183759.223246-18-aford173@gmail.com>
 <CAMuHMdWN91xmx5bVb2ww67iHm+b8umeB3WgBQdnR5M3_WcK=7Q@mail.gmail.com>
 <CAHCN7xKEBUjkgksdqP2V+P9wwC9ZH=EZg7kK=txxTWp8A8=rWA@mail.gmail.com>
In-Reply-To: <CAHCN7xKEBUjkgksdqP2V+P9wwC9ZH=EZg7kK=txxTWp8A8=rWA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16e1a8b1-f08a-4f1d-6c6f-08d8a685886c
x-ms-traffictypediagnostic: TY2PR01MB3019:
x-microsoft-antispam-prvs: <TY2PR01MB30198618CF87E7CEDD2ADFCA86DF0@TY2PR01MB3019.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cxyc+as0e/vCaLWw1LPmiXmNg0iI5x0fs3Ioc7BLWYROGejqglqIo2m4JKk1qSv5JAiX6+MVJmVn2appO5iz4VxevlEwBGQ+YTeX7ERFCnUyne/FpVDO8l0Fm8ODcvMSf2M2rhVYInozjGAxprmClVaG9GWpAWU/DwQZOaG7ybiGFPXX1vtd7RscFmcfOzOgG5388EkuWjGiPRqdmxGkbyPfBO7OUMToTvrh6OUxz2Xs9iUYDK3y9ZxhZFbb7qoNqUKrujt5Jsqf+vhNGTnNcGJYEO+mijCck+I7Yb6bbAyAv3OcsUvrTBBzuogOnvb7GpjN43KvvaBQFFFJASXVt3DPAVEsaO2fmOSMc4KK4GHSRHlsDI8uy8VU6tiOBhyQuaptqOFabvSSrEMryb1FKQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(39850400004)(376002)(64756008)(55016002)(52536014)(83380400001)(4326008)(2906002)(86362001)(71200400001)(7696005)(66946007)(76116006)(478600001)(33656002)(54906003)(26005)(316002)(5660300002)(8676002)(66476007)(186003)(110136005)(66556008)(53546011)(8936002)(66446008)(6506007)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VlVlUGM5WU5iQnMxdGR2UGFzczgyVUNaOXFiZENNcXU2aUNINDBMeFdVOCtC?=
 =?utf-8?B?OFk1YXQ3MWpPQk5hVldvVkdWMUQ4dFZYMTNia21hZ3M4dTdTdEsyc1R2OXZw?=
 =?utf-8?B?dENibzVheGxBanovMTRXZnRlTm01SHE5UGhBY0UvQW5iZnphcGVWV2RLWmg3?=
 =?utf-8?B?eStRS0J4Y1FGYmNsR3pmelNVTGVvWmkyaGFFWlUrRmFzUzJZdDdCTGptUUpi?=
 =?utf-8?B?SlNuWkU3bHVyY0ZuT052dVFtdWxjNGVBZVpkMkZoWHZaajFBQmJEbElsR0hr?=
 =?utf-8?B?RXJKTEJoWUJYUGhvMGppWGgyZXFMaHhTWmptaXppZXp6ajZERlRVaG5Tcmx6?=
 =?utf-8?B?a0pnMmJvZ295c0FlVEIraWtKMnVrd1k2dEdkejdwQ0ZnanVKOVljZmxHTmJl?=
 =?utf-8?B?a3RHcDVtcGNGYlJ3ZnlHUmxraTVrVmlFY2ovQldLbUN2MWl4ck5SN3Z0a1Rt?=
 =?utf-8?B?bzE2Q0xScGw2RUo4TlRIeVhDTHg3d2FyeTRoZy9hQ2lMMGovSnphNjgzRHc3?=
 =?utf-8?B?ZXpOV29GREx6SkJrak5iOTcxSGxKdnpub2srNDFpdkwreW1sNVQrMjB4NktI?=
 =?utf-8?B?OEZwQXJLcVRpYjl2d0kzQ0psVDFUbHJoT0tCa1h6MHJYeFVsQ2ZhSExzcFB6?=
 =?utf-8?B?L0JLVmhJUE5DbDcxWVlMWHNqdXRSUmRsWHdJYWcyRkRxRFJHbEdkMENRTkMv?=
 =?utf-8?B?Y2ZKQm5MbDR3U0Q0L0FLdm1hV0IrN1U4TTJnZnJaSWZJV1hocHp5L1ZDN1kr?=
 =?utf-8?B?cGlEaW1SeUpRajNpWHhEbFk5V0UvM2g5NHRmc2Q0eXlqcVhvWnhtYVZHMWYr?=
 =?utf-8?B?NWUrUi9XRE52T0ZuU09TeE15STR2MEd5d1FUend4WGZQSGFnOHZZZmNDNTNB?=
 =?utf-8?B?R2JBV0UzeTR4M1UxQ05ZckczNk9hUmRmck5wM0NPbTdObS9NY3dNTU5hYm9t?=
 =?utf-8?B?emdhcHNPZzdqNFZYZ1JkSkpycFBiTi9WQXN6R1UrL0k3RjRWR0NJSVkzOEpw?=
 =?utf-8?B?aWRpM0ZGbDhhSElvQm1yRW5NV2E5bStoKzFxU3lRWFFLZ3NNSkpCbng4M2Jh?=
 =?utf-8?B?WVF0dnR3c2pVcGxvWFpXRE9pNytGdThZem5lQS92YVB4dnRBR2tHU1BIZ0Vu?=
 =?utf-8?B?TTNJRTZFcWMzb2tqU1AzMVROS0E3MTg3OXVXWnZrcGhEUnlobEFQM1ZaUS9K?=
 =?utf-8?B?TTNYeDdkcXU3UXNqV3BPK21oRkVOVUxUdmRodWoweUY2R3FZTXQzQkNkWUVy?=
 =?utf-8?B?S2V2OTViUHgzREtDa2NXeW5vQ3ZiTmtsOFVXdWZYUHc1MjY3aU1xNWsxV2Z2?=
 =?utf-8?Q?JniU5p7QHCPo4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e1a8b1-f08a-4f1d-6c6f-08d8a685886c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 14:26:12.1289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQTLrJ2m0r4E7xF6UBnYDsvSCh2xPtO7TWb3jQlv5w52FQVog71qwmUHYDHLfvaGdIZfc4ui4HKRvcf27JNn9qBodbMfQ/XKQmLrb0/FuBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3019
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWRhbSwNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDE3LzE4XSBhcm02NDogZHRzOiByZW5l
c2FzOiBJbnRyb2R1Y2UgcjhhNzc0YjEtYmVhY29uLQ0KPiByemcybi1raXQNCj4gDQo+IE9uIFRo
dSwgRGVjIDE3LCAyMDIwIGF0IDU6NDkgQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4NCj4gd3JvdGU6DQo+ID4NCj4gPiBIaSBBZGFtLA0KPiA+DQo+ID4gT24gU3Vu
LCBEZWMgMTMsIDIwMjAgYXQgNzozOCBQTSBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4g
d3JvdGU6DQo+ID4gPiBCZWFjb24gRW1lYmVkZGVkV29ya3MgaXMgaW50cm9kdWNpbmcgYSBuZXcg
a2l0IGJhc2VkIG9uIHRoZSBSWi9HMk4NCj4gPiA+IFNvQyBmcm9tIFJlbmVzYXMuDQo+ID4gPg0K
PiA+ID4gVGhlIFNPTSBzdXBwb3J0cyBlTU1DLCBXaUZpIGFuZCBCbHVldG9vdGgsIGFsb25nIHdp
dGggYSBDYXQtTTENCj4gPiA+IGNlbGx1bGFyIHJhZGlvLg0KPiA+ID4NCj4gPiA+IFRoZSBCYXNl
Ym9hcmQgaGFzIEV0aGVybmV0LCBVU0IsIEhETUksIHN0ZXJlbyBhdWRpbyBpbiBhbmQgb3V0LA0K
PiA+ID4gYWxvbmcgd2l0aCBhIHZhcmlldHkgb2YgcHVzaCBidXR0b25zIGFuZCBMRUQncywgYW5k
IHN1cHBvcnQgZm9yIGENCj4gPiA+IHBhcmFsbGVsIFJHQiBhbmQgYW4gTFZEUyBkaXNwbGF5LiAg
SXQgdXNlcyB0aGUgc2FtZSBiYXNlYm9hcmQgYW5kDQo+ID4gPiBTT00gYXMgdGhlIFJaL0cyTS4N
Cj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNv
bT4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IFRoYW5rIHlvdSBmb3Ig
dGhlIHJldmlldyENCj4gDQo+ID4NCj4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzRiMS1iZWFjb24tcnpnMm4ta2l0LmR0cw0K
PiA+ID4gQEAgLTAsMCArMSw0MyBAQA0KPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wDQo+ID4gPiArLyoNCj4gPiA+ICsgKiBDb3B5cmlnaHQgMjAyMCwgQ29tcGFzcyBF
bGVjdHJvbmljcyBHcm91cCwgTExDICAqLw0KPiA+ID4gKw0KPiA+ID4gKy9kdHMtdjEvOw0KPiA+
ID4gKw0KPiA+ID4gKyNpbmNsdWRlICJyOGE3NzRiMS5kdHNpIg0KPiA+ID4gKyNpbmNsdWRlICJi
ZWFjb24tcmVuZXNvbS1zb20uZHRzaSINCj4gPiA+ICsjaW5jbHVkZSAiYmVhY29uLXJlbmVzb20t
YmFzZWJvYXJkLmR0c2kiDQo+ID4gPiArDQo+ID4gPiArLyB7DQo+ID4gPiArICAgICAgIG1vZGVs
ID0gIkJlYWNvbiBFbWJlZGRlZCBXb3JrcyBSWi9HMk4gRGV2ZWxvcG1lbnQgS2l0IjsNCj4gPiA+
ICsgICAgICAgY29tcGF0aWJsZSA9ICAgICJiZWFjb24sYmVhY29uLXJ6ZzJuIiwgInJlbmVzYXMs
cjhhNzc0YjEiOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBhbGlhc2VzIHsNCj4gPiA+ICsgICAg
ICAgICAgICAgICBzZXJpYWwwID0gJnNjaWYyOw0KPiA+ID4gKyAgICAgICAgICAgICAgIHNlcmlh
bDEgPSAmaHNjaWYwOw0KPiA+ID4gKyAgICAgICAgICAgICAgIHNlcmlhbDIgPSAmaHNjaWYxOw0K
PiA+ID4gKyAgICAgICAgICAgICAgIHNlcmlhbDMgPSAmc2NpZjA7DQo+ID4gPiArICAgICAgICAg
ICAgICAgc2VyaWFsNCA9ICZoc2NpZjI7DQo+ID4gPiArICAgICAgICAgICAgICAgc2VyaWFsNSA9
ICZzY2lmNTsNCj4gPiA+ICsgICAgICAgICAgICAgICBzZXJpYWw2ID0gJnNjaWY0Ow0KPiA+ID4g
KyAgICAgICAgICAgICAgIGV0aGVybmV0MCA9ICZhdmI7DQo+ID4gPiArICAgICAgIH07DQo+ID4g
PiArDQo+ID4gPiArICAgICAgIGNob3NlbiB7DQo+ID4gPiArICAgICAgICAgICAgICAgc3Rkb3V0
LXBhdGggPSAic2VyaWFsMDoxMTUyMDBuOCI7DQo+ID4gPiArICAgICAgIH07DQo+ID4NCj4gPiBO
byBtZW1vcnkgbm9kZXM/IEFyZSB5b3UgcmVseWluZyBvbiBVLUJvb3QgdG8gZmlsbCB0aGVtIGlu
Pw0KPiA+IElmIHllcywgd2h5IGRvIHlvdSBoYXZlIHRoZW0gaW4gdGhlIG90aGVyIGJvYXJkIERU
UyBmaWxlcz8NCj4gDQo+IFRoZXJlIGlzIGFscmVhZHkgYSBtZW1vcnkgbm9kZSBpbmNsdWRlZCBp
biB0aGUgYmVhY29uLXJlbmVzb20uZHRzaSBmaWxlDQo+IHdoaWNoIGlzIGRlZmluaW5nIG1lbW9y
eUA0ODAwMDAwMCBub2RlIHdoaWNoIGlzIGNvbW1vbiB0byB0aGUgTSwNCj4gTiBhbmQgSC4gICBJ
ZiBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5LCB0aGUgZXh0cmEgbWVtb3J5IG5vZGVzDQo+IGRl
ZmluZWQgaW4gdGhlIGhpZ2hlci1sZXZlbCBkdHMgZm9yIE0gYW5kIEggdmFyaWF0aW9uIGFyZSBu
b3QgYXBwbGljYWJsZQ0KPiBvbiB0aGUgTi4NCg0KSWYgSSBhbSBjb3JyZWN0LCBJdCBpcyBub3Qg
YXBwbGljYWJsZSwgaWYgaXQgaGFzIG9ubHkgMkdCIG1lbW9yeSBmb3IgdGhlIE4gdmFyaWFudC4N
Cg0KQnV0IElmIGl0IGhhcyA0R0IgbWVtb3J5KDFjaCB4NEdCKSwgdGhlbiB0aGUgbWVtb3J5IGlz
IHNwbGl0IGJldHdlZW4gMzJiaXQgc3BhY2UoZmlyc3QgMkdCKSBhbmQgNjQgYml0IHNwYWNlKHJl
bWFpbmluZyAyR0IpLiANCkluIHRoaXMgY2FzZSB5b3UgbmVlZCB0byBkZWZpbmUgZXh0cmEgRFQg
bm9kZSBmb3IgbWVtb3J5IGluIDY0Yml0IHNwYWNlLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg==

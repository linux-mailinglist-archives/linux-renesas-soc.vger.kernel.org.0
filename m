Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF7A44D51C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 11:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhKKKiq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 05:38:46 -0500
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:22064
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230256AbhKKKiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 05:38:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmwOHdZlB2OPusFEiXowfCwtUFFgOR4Y8IqsWHnXu5njbO/YSaZ6Yj+65N5n0DWSqecExv3LctQtt6r3bO8ZXBmjlCO5uDTCwaJ84bc0n+h0v4v9QE3qSILp4amkprn2gDvYx+NdgY5Ra7+qEnSqDyR7XYMSaNMwOPejkPhomLpxsgsRyQ93wEMJMz5PvXHQRvMdij6Sdi3nMRpeeb+xbtgGkYnTAOgGMgk76kgOxMPodLNPs3IdlfoGgaP1Xxcz12CrPQNGvAiQuaMzbOMV7Q2pptQffDEFoc4Nw0CpCrZOumCrZWa+yQbugJ6sQ35gHtZlFWrPkIGZdprcvO5xLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBZQkju2A+fHaMba7qUwlGYC/N+jDgd5AoZPsVuvhlE=;
 b=mghsb+xNkKDdoQgp5RZ5U7yKaPE38GYbcnJVbFdRtHKRudDCWeVRHyGHbXzMtZ5mGevDtKrsZf9k3ZKCOh7G9KKodtasH0kY55N2sTy+y05W3KdGyUEQAl2rv/z42xfjGnJYHXyNBimRNLWmEanNUPf6IbMGLGf3vrMKvUexZKDitTNtRv2LXNf1RQkDwYNRSIOwB6AR/KZ1LU+O+RguBH8GMzdy7UTI5FCuo1F8UMc8uOsl2ysi+UrSgK4+FDrPf2DHKoB8kG/4HAaqnKQEZg3PL84HhSk3ta1hBQkN/wYuz44eUFLTLvp16Q58Lju9KzHhg5QcKr+v+jT8PVNTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBZQkju2A+fHaMba7qUwlGYC/N+jDgd5AoZPsVuvhlE=;
 b=VCtgnIARlHNUblin8LIL6ifWFgVaINNA1a1J58K4aUu/5nkw2iyLBfQO5KwCE7UDEwnR5VCWm4g+jXL9JClS46e9xGlY2bf68kQcI0lIgL2K7kfgQF7XnkRNs66Y5NX2L8Fjn/8r4+zq/w5NIGmRKVHjrSr5dULzwB1SUZKsn8g=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2995.jpnprd01.prod.outlook.com (2603:1096:604:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.18; Thu, 11 Nov
 2021 10:35:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4669.018; Thu, 11 Nov 2021
 10:35:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Topic: [PATCH v1 3/3] watchdog: Add Watchdog Timer driver for RZ/G2L
Thread-Index: AQHX1tl7QLhEj0vVq0e6tkxn8lBWSKv+HhCAgAACUvA=
Date:   Thu, 11 Nov 2021 10:35:53 +0000
Message-ID: <OS0PR01MB5922B2C8928EC22AFF8BF23386949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211111085225.7090-1-biju.das.jz@bp.renesas.com>
 <20211111085225.7090-4-biju.das.jz@bp.renesas.com>
 <7fd9b931-32f1-73a7-7750-a4224cf89500@roeck-us.net>
In-Reply-To: <7fd9b931-32f1-73a7-7750-a4224cf89500@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e520d9eb-7e23-40e9-7609-08d9a4ff09ff
x-ms-traffictypediagnostic: OSAPR01MB2995:
x-microsoft-antispam-prvs: <OSAPR01MB2995165ABDD6F7BA9D1632F286949@OSAPR01MB2995.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qm+SpgiUfd+vhuw195wK3kgHb9BZjLWh+tbjNO9bP7Wleg7MqJxlRUxiQnfucg/Q+sUsvwapzXxIAnmVs+WZuAy2Hqr2IJlhRKz+775MpBmUsWuJIe+kTzEzxYJoTybEvdEq2TZYjfNyCZmrUTX2AxQVAV8t/hUx3WtApdWOh0XFTJ36UHn0Qh/dMn9zfMAM1lmDnLHzjjvXjk5+zSntsaZDHdPtnReMGmn5EAIYwACHFnwGF4lIxUtoR+nLKzwyMbvgNHOm0/rIWPHBibHAUJKA7GG+CTVy1qlWKdvkmQz4JpnvUq7E5f/UOQTdn9V0glKBPiUbWssqFduDdpqVGNHHsLjAyVopoBdX+VnsO4vJyz0MsmhAJywXWkOqu15XlO6EZqgcVNvBDQWXcWeKfnkxvn3jdvcDMzTims1tkYrS1jGjJRovThxVmlMtA4fWhRP40pF/2UQ7Ph8O9WkZ3W/n5E2LbuqZLLtjUkQj90Fv0Lj6GDLzZKorRcedxNY+zj9LWBl4UycmhGBYXWQzMbgVHWIy4bj7bTnLXgYFyDZqn922xM6bkVhgrT+6+R2i8gQUYMBYhuH5BfYT7a5zA5UVak1tbW2aDicNu0snTC//5PQKGwf7Ka14yTVG+nTlL9xPaOSj4WasUSXt+IO7aMSpxAECupr8XsjjPj/sjQT1MncVf7GHcHPR9xdPJhbeZ8Na5H0isCY+IEEbEtPgSAM8WEpRf3ng6zOqIa1lPlcPdyyTSsN8kjg+V+BTa+u+XXQnIsw0MCv0P/vL67vVUo2TKNQ4EUQOvK7ys2A4Jk4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(33656002)(76116006)(86362001)(54906003)(110136005)(7696005)(8676002)(26005)(66946007)(71200400001)(316002)(5660300002)(38070700005)(30864003)(83380400001)(966005)(508600001)(2906002)(9686003)(186003)(52536014)(66476007)(66446008)(55016002)(38100700002)(8936002)(64756008)(66556008)(122000001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZldRdEYxTWRvUUZSL2hpZDJURzU4Yit1YjRVenhyWDZ1MWRhNmdzTDZtSnFv?=
 =?utf-8?B?cEQyRTcxVE1DTWZiZnVEbzR6UHVJKzlSUVcrTWtXVEZMbnl3RTd3d2xGSk9V?=
 =?utf-8?B?VHFXM092OXowYXRLWGtOMHlLSDcwOERPOFZOd211a3h3TUdpbEtXc0dWL1JN?=
 =?utf-8?B?U2JCZWoyaVQrWGlHY3RWS3NScmN4OFVLdmtzQVJpd25tVWJOcHdNUlBSZlJQ?=
 =?utf-8?B?YnJyb3p3VHlmRSt2YVM3MGU0QTkybHNmTWxqYW82NU4xdVlCdkJFNWFtZDVr?=
 =?utf-8?B?NitHYUg0SWxseGhydldYVTB4U2VXVFhMb1pLK0taY1N3KzhkOGJRVkwyNWRq?=
 =?utf-8?B?Um9yY2RJSG56RW5IeDMzeXU1Vy83clFhUXZGMCtNZlBaK0tBUWp6ZFErOHVS?=
 =?utf-8?B?T28rcFBnaEtxeXBiQmoxSFoxc0psczhGSXFnZ2pTMjlRYmdBM1F6a2RzVE5S?=
 =?utf-8?B?eWF5ZDZ1cGxpa1ZCc0lYTkFiNE1oQWZDc0VQUStXeEhJb0l2bit1eDNXanVD?=
 =?utf-8?B?UzJreG00T3YrNmR5WFZXbUNBV2UzQURQSHdoVHpJWFpzcXNaMDVWMldPM3Va?=
 =?utf-8?B?ZmwxUkozOWdKWUR4ZmNWSDdUcUNyZTdPelNzZFllSUlEUnVmS0JJYWNsbGtL?=
 =?utf-8?B?VXhWK2gvbzFzaVU3SGhQSDNlMnBER1FLRUxxQTAwVk1FRzhubS80TEVPV2dw?=
 =?utf-8?B?R2xLMXd6bVVickZockhBMkJqdHA1UlkyQ2ZPVDZ6SVMxZEY3eE4zdVpnVTN0?=
 =?utf-8?B?dlRkRlFwUDVNdzF5RlU2bk4rRG1qZklERWxYZEhMQ3RSVklycVl6M1pqdXFL?=
 =?utf-8?B?M29iK3hhc0JrSFBQQ2ZkK1dFd1hxQThyN3pMZkI1L3B1OHp4L1lzRThmejl3?=
 =?utf-8?B?WFZkMUZ6NkgzeENNK2hLbU00b3F5TFhNYUtVRHl3UjBWZWhBK09ENkpmakYr?=
 =?utf-8?B?MUtqZGg1bFdGNWF3Q2JFK0hSOWdXRENyWHZhaHhST3JlajV0aUJSQmkvbjY3?=
 =?utf-8?B?a0cyaWV0Q0pMMW94dTlaWUJ4V3RiaHUzdFBBdW5tUXZIZ2tFRm83eWVJWFlV?=
 =?utf-8?B?ZmJqeHFZcGZxOU5ZQVlRdXV4MUNmUExwU2hlQ2VoaEJSekIrcld1bjFWZFBL?=
 =?utf-8?B?VzJjdWVnZTdIVmszRGduckFwdUJNbUdNVU1SZVlpUkoySCtxNXFDdjl6cWp4?=
 =?utf-8?B?aWkzVEp3TVhMOUQ4OEErd0dYcnlTMGNKb0tSWmhaRGNVUHpOV0w4RVBWZHBj?=
 =?utf-8?B?MjQwNFJSVlVZUmxHWmFGOGxSUkZDRW55Mnk5ZEFYcDlxVTFlQUNKTE1RWXJW?=
 =?utf-8?B?ZGpLVDYxT25yazFTWmY5SlI3bHRhazIrNFlZckFJSVUzMThGN2ZJVVBoc2Np?=
 =?utf-8?B?bnAydkFJVTBBRWd6cEtHcFBmVFVPSWcwdU9JODlIVEF1SVdQUjczYTlSaDh2?=
 =?utf-8?B?cWdnb2JlQ1VkUEt3OGhyNEZldkNnZEZIZGtRUnhiSzlLMXNYSTFkY3ZWV1lw?=
 =?utf-8?B?RlgyaVh3aDl3L0wySEtLWURjL0FVN0t1bTJWSWJZL3R6TGJmaDJsRDBRbDNF?=
 =?utf-8?B?U3R6bXV1NTlNSmxhaDBDazEvR0ZNWmZMZ2ViVWk2TTZqL29VYTlPV0ZaUi9P?=
 =?utf-8?B?bm1ISHF1QTV0akI5RDI2SS93cExQNCtoVEZBMUptZmtvOEFxcjQyWjI2TndB?=
 =?utf-8?B?UUhmdEg5STFROHR4TTZVQ3VlWVE3bTBSOGgxK1Q5cW5pVTZldXgzKzZ2bFl6?=
 =?utf-8?B?Rzc0UWNzSENkU3I4VWJEWHdYaU1BVSsybFRTc0o0TG9yZGlsYXNDVjN0U3pT?=
 =?utf-8?B?NDVROUVlVlIzcWh6bCtVZVE0aHJTMjQ1b2FJMXArQTFXcHFYQlhHanhQcFRr?=
 =?utf-8?B?UXdJbkFYS1BkVE1pcFBBZzhWT1FxaXEzV09hM3BhUUwwYkJZVXBEQWFRUity?=
 =?utf-8?B?czFKQmpMVkVicVNkM0ErTCt0M3JGNWkrVWo3Vk5uRUxBWGJKVmk1aG5EVGhM?=
 =?utf-8?B?ME9hVG9ic0xqUkwvYnRybjJsSERPTC9qSTdBM29jRTlwTE9MYkw5dUgrT0Fn?=
 =?utf-8?B?WnZGN1pDSkVFcmhvVzFsRlIyR29ObXQ1Z2NRR25MbnRIR3RzckduYmVmVGZZ?=
 =?utf-8?B?Y3hiTnVFR2tHWnRVbEJ6YlJ5aGY1Z1A4YXF6aXBPMVB0SUpkc2g0QzY1TVJk?=
 =?utf-8?B?WVZQeGFRSzJGNHhBVWhRTkQvUE1tdTh4Vm5YOUF3bVdweFY2YlpHSHA5Z2k2?=
 =?utf-8?B?aytCS2FWbUQxaDdWRnRWVUIvcEJ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e520d9eb-7e23-40e9-7609-08d9a4ff09ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 10:35:53.6338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HCEGm/aDQ7gET+i163CHjDlwTRTdVV1s1z4vFAID0pHRzgiCG10wDz8VF15rwTUOrirAMMxDYe79JnaTKn/yvacnkehFdwPu/SmWRum8ZkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2995
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR3VlbnRlciBSb2VjaywNCg0KVGhhbmtzIGZvciBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYxIDMvM10gd2F0Y2hkb2c6IEFkZCBXYXRjaGRvZyBUaW1lciBkcml2ZXIgZm9y
IFJaL0cyTA0KPiANCj4gT24gMTEvMTEvMjEgMTI6NTIgQU0sIEJpanUgRGFzIHdyb3RlOg0KPiA+
IEFkZCBXYXRjaGRvZyBUaW1lciBkcml2ZXIgZm9yIFJaL0cyTCBTb0MuDQo+ID4NCj4gPiBXRFQg
SVAgYmxvY2sgc3VwcG9ydHMgbm9ybWFsIHdhdGNoZG9nIHRpbWVyIGZ1bmN0aW9uIGFuZCByZXNl
dCByZXF1ZXN0DQo+ID4gZnVuY3Rpb24gZHVlIHRvIENQVSBwYXJpdHkgZXJyb3IuDQo+ID4NCj4g
PiBUaGlzIGRyaXZlciBjdXJyZW50bHkgc3VwcG9ydHMgbm9ybWFsIHdhdGNoZG9nIHRpbWVyIGZ1
bmN0aW9uIGFuZA0KPiA+IGxhdGVyIHdpbGwgYWRkIHN1cHBvcnQgZm9yIHJlc2V0IHJlcXVlc3Qg
ZnVuY3Rpb24gZHVlIHRvIENQVSBwYXJpdHkNCj4gPiBlcnJvci4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4g
PiBSRkMtPlYxDQo+ID4gICAqIFJlbW92ZWQgcGNsa19yYXRlIGZyb20gcHJpdi4NCj4gPiAgICog
cnpnMmxfd2R0X3dyaXRlKCkgcmV0dXJucyB2b2lkIGFuZCBSZW1vdmVkIHRpZW1vdXQgcmVsYXRl
ZCB0bw0KPiByZWdpc3RlciB1cGRhdGUNCj4gPiAgICogcnpnMmxfd2R0X2luaXRfdGltZW91dCgp
IHJldHVybnMgdm9pZCBhbmQgcmVtb3ZlZCBkZWxheXMuDQo+ID4gICAqIHJlbW92ZWQgc2V0X2Jp
dChXRE9HX0hXX1JVTk5JTkcsLi4pIGFzIHdlIGNhbiBzdG9wIHdhdGNoZG9nDQo+ID4gICAqIHJl
bmFtZWQgcmVzZXRfYXNzZXJ0X2Nsb2NrX2Rpc2FibGUtPnJlc2V0X2Fzc2VydF9wbV9kaXNhYmxl
X3B1dA0KPiA+ICAgKiBzdGFydGVkIHVzaW5nIGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVz
aXZlKCkNCj4gPiAgICogcmVtb3ZlZCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KSBh
cyB0aGVyZSBpcyBubyB1c2VyDQo+ID4gICAqIHJlbW92ZWQgd2F0Y2hkb2dfc2V0X3Jlc3RhcnRf
cHJpb3JpdHkoJnByaXYtPndkZXYsIDApIGFzIDAgaXMgdGhlDQo+IGRlZmF1bHQuDQo+ID4gICAq
IHJlbW92ZWQgcmVtb3ZlIGNhbGxiYWNrIGFzIGl0IGlzIGVtcHR5Lg0KPiA+IC0tLQ0KPiA+ICAg
ZHJpdmVycy93YXRjaGRvZy9LY29uZmlnICAgICB8ICAgOCArKw0KPiA+ICAgZHJpdmVycy93YXRj
aGRvZy9NYWtlZmlsZSAgICB8ICAgMSArDQo+ID4gICBkcml2ZXJzL3dhdGNoZG9nL3J6ZzJsX3dk
dC5jIHwgMjYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAzIGZp
bGVzIGNoYW5nZWQsIDI3MSBpbnNlcnRpb25zKCspDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvd2F0Y2hkb2cvS2NvbmZpZyBiL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZyBpbmRleA0KPiA+
IGJmNTlmYWViM2RlMS4uMzRkYTMwOWE3YWZkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0
Y2hkb2cvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvS2NvbmZpZw0KPiA+IEBA
IC04OTUsNiArODk1LDE0IEBAIGNvbmZpZyBSRU5FU0FTX1JaQVdEVA0KPiA+ICAgCSAgVGhpcyBk
cml2ZXIgYWRkcyB3YXRjaGRvZyBzdXBwb3J0IGZvciB0aGUgaW50ZWdyYXRlZCB3YXRjaGRvZ3Mg
aW4NCj4gdGhlDQo+ID4gICAJICBSZW5lc2FzIFJaL0EgU29Dcy4gVGhlc2Ugd2F0Y2hkb2dzIGNh
biBiZSB1c2VkIHRvIHJlc2V0IGEgc3lzdGVtLg0KPiA+DQo+ID4gK2NvbmZpZyBSRU5FU0FTX1Ja
RzJMV0RUDQo+ID4gKwl0cmlzdGF0ZSAiUmVuZXNhcyBSWi9HMkwgV0RUIFdhdGNoZG9nIg0KPiA+
ICsJZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09NUElMRV9URVNUDQo+ID4gKwlzZWxlY3Qg
V0FUQ0hET0dfQ09SRQ0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGlzIGRyaXZlciBhZGRzIHdhdGNo
ZG9nIHN1cHBvcnQgZm9yIHRoZSBpbnRlZ3JhdGVkIHdhdGNoZG9ncyBpbg0KPiB0aGUNCj4gPiAr
CSAgUmVuZXNhcyBSWi9HMkwgU29Dcy4gVGhlc2Ugd2F0Y2hkb2dzIGNhbiBiZSB1c2VkIHRvIHJl
c2V0IGENCj4gc3lzdGVtLg0KPiA+ICsNCj4gPiAgIGNvbmZpZyBBU1BFRURfV0FUQ0hET0cNCj4g
PiAgIAl0cmlzdGF0ZSAiQXNwZWVkIEJNQyB3YXRjaGRvZyBzdXBwb3J0Ig0KPiA+ICAgCWRlcGVu
ZHMgb24gQVJDSF9BU1BFRUQgfHwgQ09NUElMRV9URVNUIGRpZmYgLS1naXQNCj4gPiBhL2RyaXZl
cnMvd2F0Y2hkb2cvTWFrZWZpbGUgYi9kcml2ZXJzL3dhdGNoZG9nL01ha2VmaWxlIGluZGV4DQo+
ID4gMWJkMmQ2ZjM3YzUzLi5lN2U4Y2U1NDY4MTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy93
YXRjaGRvZy9NYWtlZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvTWFrZWZpbGUNCj4g
PiBAQCAtODUsNiArODUsNyBAQCBvYmotJChDT05GSUdfTFBDMThYWF9XQVRDSERPRykgKz0gbHBj
MTh4eF93ZHQubw0KPiA+ICAgb2JqLSQoQ09ORklHX0JDTTcwMzhfV0RUKSArPSBiY203MDM4X3dk
dC5vDQo+ID4gICBvYmotJChDT05GSUdfUkVORVNBU19XRFQpICs9IHJlbmVzYXNfd2R0Lm8NCj4g
PiAgIG9iai0kKENPTkZJR19SRU5FU0FTX1JaQVdEVCkgKz0gcnphX3dkdC5vDQo+ID4gK29iai0k
KENPTkZJR19SRU5FU0FTX1JaRzJMV0RUKSArPSByemcybF93ZHQubw0KPiA+ICAgb2JqLSQoQ09O
RklHX0FTUEVFRF9XQVRDSERPRykgKz0gYXNwZWVkX3dkdC5vDQo+ID4gICBvYmotJChDT05GSUdf
U1RNMzJfV0FUQ0hET0cpICs9IHN0bTMyX2l3ZGcubw0KPiA+ICAgb2JqLSQoQ09ORklHX1VOSVBI
SUVSX1dBVENIRE9HKSArPSB1bmlwaGllcl93ZHQubyBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJz
L3dhdGNoZG9nL3J6ZzJsX3dkdC5jIGIvZHJpdmVycy93YXRjaGRvZy9yemcybF93ZHQuYyBuZXcg
ZmlsZQ0KPiA+IG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4uNzUxMDIzMTA3OTZkDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvcnpnMmxfd2R0LmMN
Cj4gPiBAQCAtMCwwICsxLDI2MiBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBSZW5lc2FzIFJaL0cyTCBXRFQgV2F0Y2hkb2cgRHJp
dmVyDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMSBSZW5lc2FzIEVsZWN0cm9u
aWNzIENvcnBvcmF0aW9uICAqLyAjaW5jbHVkZQ0KPiA+ICs8bGludXgvYml0b3BzLmg+ICNpbmNs
dWRlIDxsaW51eC9jbGsuaD4gI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ID4gKyNpbmNsdWRl
IDxsaW51eC9pby5oPiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+ICNpbmNsdWRlDQo+ID4gKzxs
aW51eC9tb2R1bGUuaD4gI2luY2x1ZGUgPGxpbnV4L29mLmg+ICNpbmNsdWRlDQo+ID4gKzxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4gI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4gI2luY2x1
ZGUNCj4gPiArPGxpbnV4L3Jlc2V0Lmg+ICNpbmNsdWRlIDxsaW51eC93YXRjaGRvZy5oPg0KPiA+
ICsNCj4gPiArI2RlZmluZSBXRFRDTlQJCTB4MDANCj4gPiArI2RlZmluZSBXRFRTRVQJCTB4MDQN
Cj4gPiArI2RlZmluZSBXRFRUSU0JCTB4MDgNCj4gPiArI2RlZmluZSBXRFRJTlQJCTB4MEMNCj4g
PiArI2RlZmluZSBXRFRDTlRfV0RURU4JQklUKDApDQo+ID4gKyNkZWZpbmUgV0RUSU5UX0lOVERJ
U1AJQklUKDApDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFdEVF9ERUZBVUxUX1RJTUVPVVQJCTYwVQ0K
PiA+ICsNCj4gPiArLyogU2V0dGluZyBwZXJpb2QgdGltZSByZWdpc3RlciBvbmx5IDEyIGJpdCBz
ZXQgaW4gV0RUU0VUWzMxOjIwXSAqLw0KPiA+ICsjZGVmaW5lIFdEVFNFVF9DT1VOVEVSX01BU0sJ
CSgweEZGRjAwMDAwKQ0KPiA+ICsjZGVmaW5lIFdEVFNFVF9DT1VOVEVSX1ZBTChmKQkJKChmKSA8
PCAyMCkNCj4gPiArDQo+ID4gKyNkZWZpbmUgRjJDWUNMRV9OU0VDKGYpCQkJKDEwMDAwMDAwMDAg
LyAoZikpDQo+ID4gKyNkZWZpbmUgV0RUX0NZQ0xFX01TRUMoZiwgd2R0dGltZSkJKCgxMDI0ICog
MTAyNCAqICgoKHU2NCl3ZHR0aW1lKQ0KPiArIDEpKSAvIFwNCj4gPiArCQkJCQkgKChmKSAvIDEw
MDAwMDApKQ0KPiA+ICsNCj4gPiArc3RhdGljIGJvb2wgbm93YXlvdXQgPSBXQVRDSERPR19OT1dB
WU9VVDsgbW9kdWxlX3BhcmFtKG5vd2F5b3V0LA0KPiA+ICtib29sLCAwKTsgTU9EVUxFX1BBUk1f
REVTQyhub3dheW91dCwgIldhdGNoZG9nIGNhbm5vdCBiZSBzdG9wcGVkIG9uY2UNCj4gPiArc3Rh
cnRlZCAoZGVmYXVsdD0iDQo+ID4gKwkJCQlfX01PRFVMRV9TVFJJTkcoV0FUQ0hET0dfTk9XQVlP
VVQpICIpIik7DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgcnpnMmxfd2R0X3ByaXYgew0KPiA+ICsJdm9p
ZCBfX2lvbWVtICpiYXNlOw0KPiA+ICsJc3RydWN0IHdhdGNoZG9nX2RldmljZSB3ZGV2Ow0KPiA+
ICsJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGM7DQo+ID4gKwl1bnNpZ25lZCBsb25nIG9zY19j
bGtfcmF0ZTsNCj4gPiArCXVuc2lnbmVkIGxvbmcgZGVsYXk7DQo+ID4gK307DQo+ID4gKw0KPiA+
ICtzdGF0aWMgdm9pZCByemcybF93ZHRfd2FpdF9kZWxheShzdHJ1Y3QgcnpnMmxfd2R0X3ByaXYg
KnByaXYpIHsNCj4gPiArCS8qIGRlbGF5IHRpbWVyIHdoZW4gY2hhbmdlIHRoZSBzZXR0aW5nIHJl
Z2lzdGVyICovDQo+ID4gKwluZGVsYXkocHJpdi0+ZGVsYXkpOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgdm9pZCByemcybF93ZHRfd3JpdGUoc3RydWN0IHJ6ZzJsX3dkdF9wcml2ICpwcml2
LCB1MzIgdmFsLA0KPiA+ICt1bnNpZ25lZCBpbnQgcmVnKSB7DQo+ID4gKwlpZiAocmVnID09IFdE
VFNFVCkNCj4gPiArCQl2YWwgJj0gV0RUU0VUX0NPVU5URVJfTUFTSzsNCj4gPiArDQo+ID4gKwl3
cml0ZWxfcmVsYXhlZCh2YWwsIHByaXYtPmJhc2UgKyByZWcpOw0KPiA+ICsJLyogUmVnaXN0ZXJz
IG90aGVyIHRoYW4gdGhlIFdEVElOVCBpcyBhbHdheXMgc3luY2hyb25pemVkIHdpdGgNCj4gV0RU
X0NMSyAqLw0KPiA+ICsJaWYgKHJlZyAhPSBXRFRJTlQpDQo+ID4gKwkJcnpnMmxfd2R0X3dhaXRf
ZGVsYXkocHJpdik7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHJ6ZzJsX3dkdF9p
bml0X3RpbWVvdXQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2Rldikgew0KPiA+ICsJc3RydWN0
IHJ6ZzJsX3dkdF9wcml2ICpwcml2ID0gd2F0Y2hkb2dfZ2V0X2RydmRhdGEod2Rldik7DQo+ID4g
Kwl1MzIgdGltZV9vdXQ7DQo+ID4gKw0KPiA+ICsJLyogQ2xlYXIgTGFwc2VkIFRpbWUgUmVnaXN0
ZXIgYW5kIGNsZWFyIEludGVycnVwdCAqLw0KPiA+ICsJcnpnMmxfd2R0X3dyaXRlKHByaXYsIFdE
VElOVF9JTlRESVNQLCBXRFRJTlQpOw0KPiA+ICsJLyogMiBjb25zZWN1dGl2ZSBvdmVyZmxvdyBj
eWNsZSBuZWVkZWQgdG8gdHJpZ2dlciByZXNldCAqLw0KPiA+ICsJdGltZV9vdXQgPSAod2Rldi0+
dGltZW91dCAvIDIgKiAxMDAwMDAwKSAvIFdEVF9DWUNMRV9NU0VDKHByaXYtDQo+ID5vc2NfY2xr
X3JhdGUsIDApOw0KPiA+ICsJcnpnMmxfd2R0X3dyaXRlKHByaXYsIFdEVFNFVF9DT1VOVEVSX1ZB
TCh0aW1lX291dCksIFdEVFNFVCk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnpnMmxfd2R0
X3N0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkZXYpIHsNCj4gPiArCXN0cnVjdCByemcy
bF93ZHRfcHJpdiAqcHJpdiA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdkZXYpOw0KPiA+ICsNCj4g
PiArCXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocHJpdi0+cnN0Yyk7DQo+ID4gKwlwbV9ydW50aW1l
X2dldF9zeW5jKHdkZXYtPnBhcmVudCk7DQo+ID4gKw0KPiA+ICsJLyogSW5pdGlhbGl6ZSB0aW1l
IG91dCAqLw0KPiA+ICsJcnpnMmxfd2R0X2luaXRfdGltZW91dCh3ZGV2KTsNCj4gPiArDQo+ID4g
KwkvKiBJbml0aWFsaXplIHdhdGNoZG9nIGNvdW50ZXIgcmVnaXN0ZXIgKi8NCj4gPiArCXJ6ZzJs
X3dkdF93cml0ZShwcml2LCAwLCBXRFRUSU0pOw0KPiA+ICsNCj4gPiArCS8qIEVuYWJsZSB3YXRj
aGRvZyB0aW1lciovDQo+ID4gKwlyemcybF93ZHRfd3JpdGUocHJpdiwgV0RUQ05UX1dEVEVOLCBX
RFRDTlQpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0
aWMgaW50IHJ6ZzJsX3dkdF9zdG9wKHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkZXYpIHsNCj4g
PiArCXN0cnVjdCByemcybF93ZHRfcHJpdiAqcHJpdiA9IHdhdGNoZG9nX2dldF9kcnZkYXRhKHdk
ZXYpOw0KPiA+ICsNCj4gPiArCXBtX3J1bnRpbWVfcHV0KHdkZXYtPnBhcmVudCk7DQo+ID4gKwly
ZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5yc3RjKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCByemcybF93ZHRfcmVzdGFydChzdHJ1Y3Qg
d2F0Y2hkb2dfZGV2aWNlICp3ZGV2LA0KPiA+ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgYWN0aW9u
LCB2b2lkICpkYXRhKSB7DQo+ID4gKwlzdHJ1Y3QgcnpnMmxfd2R0X3ByaXYgKnByaXYgPSB3YXRj
aGRvZ19nZXRfZHJ2ZGF0YSh3ZGV2KTsNCj4gPiArDQo+ID4gKwkvKiBSZXNldCB0aGUgbW9kdWxl
IGJlZm9yZSB3ZSBtb2RpZnkgYW55IHJlZ2lzdGVyICovDQo+ID4gKwlyZXNldF9jb250cm9sX3Jl
c2V0KHByaXYtPnJzdGMpOw0KPiA+ICsJcG1fcnVudGltZV9nZXRfc3luYyh3ZGV2LT5wYXJlbnQp
Ow0KPiA+ICsNCj4gPiArCS8qIHNtYWxsZXN0IGNvdW50ZXIgdmFsdWUgdG8gcmVib290IHNvb24g
Ki8NCj4gPiArCXJ6ZzJsX3dkdF93cml0ZShwcml2LCBXRFRTRVRfQ09VTlRFUl9WQUwoMSksIFdE
VFNFVCk7DQo+ID4gKw0KPiA+ICsJLyogRW5hYmxlIHdhdGNoZG9nIHRpbWVyKi8NCj4gPiArCXJ6
ZzJsX3dkdF93cml0ZShwcml2LCBXRFRDTlRfV0RURU4sIFdEVENOVCk7DQo+ID4gKw0KPiA+ICsJ
cmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgd2F0Y2hk
b2dfaW5mbyByemcybF93ZHRfaWRlbnQgPSB7DQo+ID4gKwkub3B0aW9ucyA9IFdESU9GX01BR0lD
Q0xPU0UgfCBXRElPRl9LRUVQQUxJVkVQSU5HIHwNCj4gV0RJT0ZfU0VUVElNRU9VVCwNCj4gPiAr
CS5pZGVudGl0eSA9ICJSZW5lc2FzIFJaL0cyTCBXRFQgV2F0Y2hkb2ciLCB9Ow0KPiA+ICsNCj4g
PiArc3RhdGljIGludCByemcybF93ZHRfcGluZyhzdHJ1Y3Qgd2F0Y2hkb2dfZGV2aWNlICp3ZGV2
KSB7DQo+ID4gKwlzdHJ1Y3QgcnpnMmxfd2R0X3ByaXYgKnByaXYgPSB3YXRjaGRvZ19nZXRfZHJ2
ZGF0YSh3ZGV2KTsNCj4gPiArDQo+ID4gKwlyemcybF93ZHRfd3JpdGUocHJpdiwgV0RUSU5UX0lO
VERJU1AsIFdEVElOVCk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgd2F0Y2hkb2dfb3BzIHJ6ZzJsX3dkdF9vcHMgPSB7DQo+
ID4gKwkub3duZXIgPSBUSElTX01PRFVMRSwNCj4gPiArCS5zdGFydCA9IHJ6ZzJsX3dkdF9zdGFy
dCwNCj4gPiArCS5zdG9wID0gcnpnMmxfd2R0X3N0b3AsDQo+ID4gKwkucGluZyA9IHJ6ZzJsX3dk
dF9waW5nLA0KPiA+ICsJLnJlc3RhcnQgPSByemcybF93ZHRfcmVzdGFydCwNCj4gPiArfTsNCj4g
PiArDQo+ID4gK3N0YXRpYyB2b2lkIHJ6ZzJsX3dkdF9yZXNldF9hc3NlcnRfcG1fZGlzYWJsZV9w
dXQodm9pZCAqZGF0YSkgew0KPiA+ICsJc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RldiA9IGRh
dGE7DQo+ID4gKwlzdHJ1Y3QgcnpnMmxfd2R0X3ByaXYgKnByaXYgPSB3YXRjaGRvZ19nZXRfZHJ2
ZGF0YSh3ZGV2KTsNCj4gPiArDQo+ID4gKwlwbV9ydW50aW1lX3B1dCh3ZGV2LT5wYXJlbnQpOw0K
PiA+ICsJcG1fcnVudGltZV9kaXNhYmxlKHdkZXYtPnBhcmVudCk7DQo+ID4gKwlyZXNldF9jb250
cm9sX2Fzc2VydChwcml2LT5yc3RjKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBy
emcybF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+ICsJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArCXN0cnVjdCByemcybF93ZHRfcHJp
diAqcHJpdjsNCj4gPiArCXVuc2lnbmVkIGxvbmcgcGNsa19yYXRlOw0KPiA+ICsJc3RydWN0IGNs
ayAqd2R0X2NsazsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcHJpdiA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFwcml2KQ0K
PiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCXByaXYtPmJhc2UgPSBkZXZtX3Bs
YXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7DQo+ID4gKwlpZiAoSVNfRVJSKHByaXYt
PmJhc2UpKQ0KPiA+ICsJCXJldHVybiBQVFJfRVJSKHByaXYtPmJhc2UpOw0KPiA+ICsNCj4gPiAr
CS8qIEdldCB3YXRjaGRvZyBtYWluIGNsb2NrICovDQo+ID4gKwl3ZHRfY2xrID0gZGV2bV9jbGtf
Z2V0KCZwZGV2LT5kZXYsICJvc2NjbGsiKTsNCj4gPiArCWlmIChJU19FUlIod2R0X2NsaykpDQo+
ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUih3ZHRfY2xrKSwg
Im5vDQo+IG9zY2NsayIpOw0KPiA+ICsNCj4gPiArCXByaXYtPm9zY19jbGtfcmF0ZSA9IGNsa19n
ZXRfcmF0ZSh3ZHRfY2xrKTsNCj4gPiArCWlmICghcHJpdi0+b3NjX2Nsa19yYXRlKQ0KPiA+ICsJ
CXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIC1FSU5WQUwsICJvc2NjbGsgcmF0ZSBp
cyAwIik7DQo+ID4gKw0KPiA+ICsJZGV2bV9jbGtfcHV0KCZwZGV2LT5kZXYsIHdkdF9jbGspOw0K
PiA+ICsNCj4gDQo+IElmIHRoZSBjbG9ja3MgYXJlIG5vdCBuZWVkZWQgYW55bW9yZSBhdCB0aGlz
IHRpbWUsIHlvdSBzaG91bGQgbm90IHVzZQ0KPiBkZXZtXyBmdW5jdGlvbnMgdG8gZ2V0IHRoZW0u
IFRoZSBpbnRlbnQgZm9yIGRldm1fIGZ1bmN0aW9ucyBpcyBhdXRvbWF0aWMNCj4gcmVsZWFzZSBp
biB0aGUgcmVtb3ZlIGZ1bmN0aW9uLiBJZiB0aGF0IGlzbid0IHVzZWQsIGNsa19nZXQvY2xrX3B1
dCBpcw0KPiBnb29kIGVub3VnaCwgYW5kIHRoZSBvdmVyaGVhZCBvZiBkZXZtXyBmdW5jdGlvbnMg
aXMgbm90IHdvcnRoIHRoZQ0KPiBjb21wbGV4aXR5Lg0KDQpPSy4gV2lsbCB1c2UgImNsa19nZXQv
Y2xrX3B1dCIgaW5zdGVhZC4NCg0KPiANCj4gR3VlbnRlcg0KPiANCj4gPiArCS8qIEdldCBQZXJp
cGhlcmFsIGNsb2NrICovDQo+ID4gKwl3ZHRfY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYs
ICJwY2xrIik7DQo+ID4gKwlpZiAoSVNfRVJSKHdkdF9jbGspKQ0KPiA+ICsJCXJldHVybiBkZXZf
ZXJyX3Byb2JlKCZwZGV2LT5kZXYsIFBUUl9FUlIod2R0X2NsayksICJubyBwY2xrIik7DQo+ID4g
Kw0KPiA+ICsJcGNsa19yYXRlID0gY2xrX2dldF9yYXRlKHdkdF9jbGspOw0KPiA+ICsJaWYgKCFw
Y2xrX3JhdGUpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgLUVJTlZB
TCwgInBjbGsgcmF0ZSBpcyAwIik7DQo+ID4gKw0KPiA+ICsJZGV2bV9jbGtfcHV0KCZwZGV2LT5k
ZXYsIHdkdF9jbGspOw0KPiA+ICsJcHJpdi0+ZGVsYXkgPSBGMkNZQ0xFX05TRUMocHJpdi0+b3Nj
X2Nsa19yYXRlKSAqIDYgKw0KPiA+ICtGMkNZQ0xFX05TRUMocGNsa19yYXRlKSAqIDk7DQo+ID4g
Kw0KPiA+ICsJcHJpdi0+cnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKCZw
ZGV2LT5kZXYsIE5VTEwpOw0KPiA+ICsJaWYgKElTX0VSUihwcml2LT5yc3RjKSkNCj4gPiArCQly
ZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKHByaXYtPnJzdGMpLA0KPiA+
ICsJCQkJICAgICAiZmFpbGVkIHRvIGdldCBjcGcgcmVzZXQiKTsNCj4gPiArDQo+ID4gKwlyZXNl
dF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdGMpOw0KPiA+ICsJcG1fcnVudGltZV9lbmFibGUo
JnBkZXYtPmRldik7DQo+ID4gKwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCZwZGV2
LT5kZXYpOw0KPiA+ICsJaWYgKHJldCA8IDApIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgInBtX3J1
bnRpbWVfcmVzdW1lX2FuZF9nZXQgZmFpbGVkIHJldD0lcGUiLA0KPiBFUlJfUFRSKHJldCkpOw0K
PiA+ICsJCWdvdG8gb3V0X3BtX2dldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXQgPSBkZXZt
X2FkZF9hY3Rpb25fb3JfcmVzZXQoJnBkZXYtPmRldiwNCj4gPiArCQkJCSAgICAgICByemcybF93
ZHRfcmVzZXRfYXNzZXJ0X3BtX2Rpc2FibGVfcHV0LA0KPiA+ICsJCQkJICAgICAgICZwcml2LT53
ZGV2KTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCWdvdG8gb3V0X3Jlc2V0Ow0KPiANCj4g
X29yX3Jlc2V0IGltcGxpZXMgdGhhdCB0aGUgYWN0aW9uIGlzIHRha2VuIG9uIGZhaWx1cmUsIHNv
IHRoZXJlIGlzIG5vdA0KPiBuZWVkIHRvIGRvIGl0IGFnYWluLg0KDQpBcyBwZXIgWzFdLCBpdCBj
YW4gcmV0dXJuIC1FTk9NRU0sIGluIHRoYXQgY2FzZSBJIGRvbid0IGdldCBhY3Rpb24gY2FsbGJh
Y2suIE9uIGEgc2FmZXIgc2lkZQ0KSSB3aWxsIG1vdmUgdGhpcyBjYWxsIGFmdGVyIHdhdGNoZG9n
X3NldF9kcnZkYXRhKCkNCg0KWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xh
dGVzdC9zb3VyY2UvZHJpdmVycy9iYXNlL2RldnJlcy5jI0w3MzQNCg0KPiANCj4gPiArDQo+ID4g
Kwlwcml2LT53ZGV2LmluZm8gPSAmcnpnMmxfd2R0X2lkZW50Ow0KPiA+ICsJcHJpdi0+d2Rldi5v
cHMgPSAmcnpnMmxfd2R0X29wczsNCj4gPiArCXByaXYtPndkZXYucGFyZW50ID0gZGV2Ow0KPiA+
ICsJcHJpdi0+d2Rldi5taW5fdGltZW91dCA9IDE7DQo+ID4gKwlwcml2LT53ZGV2Lm1heF90aW1l
b3V0ID0gV0RUX0NZQ0xFX01TRUMocHJpdi0+b3NjX2Nsa19yYXRlLCAweGZmZik7DQo+ID4gKwlw
cml2LT53ZGV2LnRpbWVvdXQgPSBXRFRfREVGQVVMVF9USU1FT1VUOw0KPiA+ICsNCj4gPiArCXdh
dGNoZG9nX3NldF9kcnZkYXRhKCZwcml2LT53ZGV2LCBwcml2KTsNCj4gPiArCXdhdGNoZG9nX3Nl
dF9ub3dheW91dCgmcHJpdi0+d2Rldiwgbm93YXlvdXQpOw0KPiA+ICsJd2F0Y2hkb2dfc3RvcF9v
bl91bnJlZ2lzdGVyKCZwcml2LT53ZGV2KTsNCj4gPiArDQo+ID4gKwlyZXQgPSB3YXRjaGRvZ19p
bml0X3RpbWVvdXQoJnByaXYtPndkZXYsIDAsIGRldik7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJ
CWRldl93YXJuKGRldiwgIlNwZWNpZmllZCB0aW1lb3V0IGludmFsaWQsIHVzaW5nIGRlZmF1bHQi
KTsNCj4gPiArDQo+ID4gKwlyZXQgPSBkZXZtX3dhdGNoZG9nX3JlZ2lzdGVyX2RldmljZSgmcGRl
di0+ZGV2LCAmcHJpdi0+d2Rldik7DQo+ID4gKwlpZiAocmV0IDwgMCkNCj4gPiArCQlyZXR1cm4g
cmV0Ow0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiANCj4gCXJldHVybiByZXQ7DQo+IA0KPiBp
cyBnb29kIGVub3VnaCwgb3IgZXZlbg0KPiAJcmV0dXJuIGRldm1fd2F0Y2hkb2dfcmVnaXN0ZXJf
ZGV2aWNlKCZwZGV2LT5kZXYsICZwcml2LT53ZGV2KTsNCg0KT0suIFdpbGwgdXNlIHRoZSBsYXRl
ci4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiA+ICsNCj4gPiArb3V0X3Jlc2V0Og0KPiA+ICsJcG1f
cnVudGltZV9wdXQoZGV2KTsNCj4gPiArb3V0X3BtX2dldDoNCj4gPiArCXBtX3J1bnRpbWVfZGlz
YWJsZShkZXYpOw0KPiA+ICsJcmVzZXRfY29udHJvbF9hc3NlcnQocHJpdi0+cnN0Yyk7DQo+ID4g
Kw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgcnpnMmxfd2R0X2lkc1tdID0gew0KPiA+ICsJeyAuY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLHJ6ZzJsLXdkdCIsIH0sDQo+ID4gKwl7IC8qIHNlbnRpbmVsICovIH0NCj4g
PiArfTsNCj4gPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcnpnMmxfd2R0X2lkcyk7DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciByemcybF93ZHRfZHJpdmVyID0g
ew0KPiA+ICsJLmRyaXZlciA9IHsNCj4gPiArCQkubmFtZSA9ICJyemcybF93ZHQiLA0KPiA+ICsJ
CS5vZl9tYXRjaF90YWJsZSA9IHJ6ZzJsX3dkdF9pZHMsDQo+ID4gKwl9LA0KPiA+ICsJLnByb2Jl
ID0gcnpnMmxfd2R0X3Byb2JlLA0KPiA+ICt9Ow0KPiA+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KHJ6ZzJsX3dkdF9kcml2ZXIpOw0KPiA+ICsNCj4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJSZW5l
c2FzIFJaL0cyTCBXRFQgV2F0Y2hkb2cgRHJpdmVyIik7DQo+ID4gK01PRFVMRV9BVVRIT1IoIkJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4iKTsNCj4gPiArTU9EVUxFX0xJQ0VO
U0UoIkdQTCB2MiIpOw0KPiA+DQoNCg==

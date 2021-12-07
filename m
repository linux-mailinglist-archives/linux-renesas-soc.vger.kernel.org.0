Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D388A46BCAF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 14:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237190AbhLGNgH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 08:36:07 -0500
Received: from mail-tycjpn01on2125.outbound.protection.outlook.com ([40.107.114.125]:38382
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237180AbhLGNgG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 08:36:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lC96WDSt2c55jHRR3sAdnyheeD17WyI6OgMqUU1GYa92mNOHrga5OACZJY3nJdMn3htUqCf5sfXircS51UzApc0HEe304TV1yGX/dDKsy64nuKNiGwlsVt7vk047uR4TF2C6aEfQf0HakcsfyjCenLw6lvB1lJeXSATAgDQnVNm8flBUOt3N3EN6fjP+uMnpU3mWESWYV6oFUYm4W6ZpqzyzVS4OyK4kKvhmswJC+0Kk5kyPsZuB550hDv0BgAjMsNRt3MjnXp/2hhSnGNeZIFM2KS49bUgK1SlYiDv0tp9YRzIxB0tWgo0qxfO6KN51/bzcCqzc9hKEejC8FcW9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vec0ePLPFW3HOIy0l5tVgAwH4I6lIPn3462hWECxHpE=;
 b=UNcl4u79UZUgA8UeYxVxz9bPIYQ1L3fjLbjIP9PhpsnJ1C3lLteeadqTeBwQLMzy65T6sjrW5mgrnCKT6nmjtP1F606bLvEbq2fdv6cD188GPRwcEIJ4ovALooa3hV+xzTfFFoqE46YWbJmy9JZQ7B5SWkA7cGY2XvOTj+eZ4Mw6KTqav7CgQD3y9UszOTd1CJvMX1329zS3R4NetN1WH+Z7n12HaN/09IgO9vKUkBKLbzXwNzAJ3a1UWWk/Gi/FkwjkHmFRSttK36vdp59i1b2kp953oaZgQmGJXjI0YKiGw2gRl66bbnLBaS7laApozI6Z5FZGt1gdUxD42zenRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vec0ePLPFW3HOIy0l5tVgAwH4I6lIPn3462hWECxHpE=;
 b=PAh+lLjHuuGlQM0M7Ub6bWn5dk44w9XpGiE7+k0+yMJl1rubbpu5RG2f0kaRk4hzuyGuJDTcLAfCLu2LGf4USjGssD1gmMiOK5bWI7oqx9kjG/JWKyxYyVeUvECNoI6hfoJBMD2pywwHE430nMV97R8RRvfHtY4svr5DJ2O652c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7035.jpnprd01.prod.outlook.com (2603:1096:604:13c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.15; Tue, 7 Dec
 2021 13:32:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 13:32:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Topic: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1/VTNGOVE1u5M0uN8s5g60zIn6waXgOAgAAB8vCAAARVgIAMyDSQ
Date:   Tue, 7 Dec 2021 13:32:30 +0000
Message-ID: <OS0PR01MB5922A0170D05F9930F848C2E866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
 <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
 <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1525354a-b2ae-4feb-3520-08d9b98604e0
x-ms-traffictypediagnostic: OSZPR01MB7035:EE_
x-microsoft-antispam-prvs: <OSZPR01MB7035C7CD668D41569313E4EB866E9@OSZPR01MB7035.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EHCRu+mHuSp6I0cHYOfON6EBS3FXXOno/FaqUK+URhLrzzvv+KuLmgZmINqIAnHD/j8sMf10Y3zSFa6O27LO53KOuOWy2Jgtfte6Xd5IFCp5+WYPIztnEW8fgG2TPTp+fHLEvfbero975HCpwnRdQFzeinA/GDjsyui9zvdLkzG8+GqBsjCgs6FasjKcwQ1szgSuokaiTO3QOqPWUU3T8JLMZmSXerxjK4byoAj4YEFcpNKy4GUoiru2vDZpTQ+DKlp0j/6TZmCgvRczcC631JXvt/769YXaDtj9GC27RXAPj1RVJl6KxFmCcU3QoUqFK/G8p8DFiyXbW3iysLBSSfiajSBzDVBZjWqEyT+K+rcrdZSMxvPHMMpxDoWs4fkWp9Mse+kbiAHEoyd4GIk9rGz+iMCQnH/u8ZyrputbU6WwWwL46rW1aPri1OOHhSwbuNazQsBJP4BoTLhmvE2fv7z4IZWQufmJmNK30ib35KGkf9UGl2q31Wv7+aARRu6+WAfF6Un71ygjqyNG8CDt45ouaTb1/9XDxN7dNegjFRQif3yzdXbMIlDQR/NUoca2lbURmcq299Dh+C5+n8S+xOwTqvcM3EsREYMfqy7iEfg+iDiJkDbmoW6di2j7mA5Ni1UpOUNLilOWPlDszt4GlDDv82sCGsobMvAyDzBjKFS3QvBzMh3GwKZX5ON5jTIUauK4LjiFjYUbRY/YvrS4kOBkLT/hK+iUkN1wHm9c/KClADaQ/lFY34O0mqagHAd85v+ukvzN5rdghXfISmxHAn53lg5OUKgjF54RyBDLF8Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(26005)(508600001)(186003)(52536014)(8936002)(53546011)(122000001)(64756008)(66446008)(9686003)(66946007)(76116006)(66476007)(66556008)(8676002)(5660300002)(71200400001)(6506007)(33656002)(966005)(2906002)(4326008)(316002)(54906003)(110136005)(86362001)(7696005)(83380400001)(55016003)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WURkQ21iK3ozM0VhOGt2QnRHUDU2UWkvRE9YSXdZK1M3ZkhRZGVrZjI2RWs2?=
 =?utf-8?B?NFhwaUYvWi90YW5DSS90K3ZQVmVMUm8xbHF2TjB3MmhUbjkxT3NVNDIwRSsx?=
 =?utf-8?B?elphVG51NVYrL0VVTnlhNFJncTMrNTF0Y2Y1cVQ3ZWJhbHZPSnhwMmtZSzRI?=
 =?utf-8?B?ejNROUlEZ1REQUtyMCtkT08yeEdTamxxS0Q0cFloV09icVNNMDBncDJqaXVD?=
 =?utf-8?B?bFVSUHVGVzJjT3Q0dHo1eHlXelJXRmM5a2JtbWpjZjFobmY1OERlZlYvdmty?=
 =?utf-8?B?eHZFOXo0YjI0KzJsYUlJSC9sNFZLdUpuYWoyZVN3TWpJVmg5Rkp3d21yTXQ3?=
 =?utf-8?B?WlN0bTVjekd6R2VLclR4a1Jtb2hKSTAxTGpiaWR5dVlWUHlWQWZzaWwzYXJQ?=
 =?utf-8?B?RFNHUUFLSVAwWUhoZ2ZKZlY3NlBHZFE1Vjl3L3RDbTZ6VnFUVFRXcExIQjJa?=
 =?utf-8?B?dUxLemdxUURjaG80N0k3M0ttNW9kR1RUREViUkROM2lEai9Uc1hYWGR0TENZ?=
 =?utf-8?B?U2dnZWk4NFRxRU1kSDRWQlZub0lyUHNHOC9oN0lueVRkYzRtdkYrV3UyTHJr?=
 =?utf-8?B?TUh3ck02MVZoNWk0cTBKVmVxeml5VmZ3a2k4S3JXbU1BdGJSajRtQ1dLbFRZ?=
 =?utf-8?B?Yjhic1VHQWZ6M2pObVRCRER0NFljYUdlL2lJcEZpUVpRaEpsbHJoRUV2c1RH?=
 =?utf-8?B?UWllMTNRZ01XSXhubzF6QTVLQTYxMlg3Yk5CVlhOV0dQVXBTRWNnWWJrVThw?=
 =?utf-8?B?N2JWREMzNmhOZVJwemhBRHQvNGNIM0RqeTZQTGRvL013VXNLMlNKYlI1ZnJ3?=
 =?utf-8?B?Nk4vM3ozbkhRaFFCYmhySi9BZ0FyRUd6NVlzZWtIS2Y0R1dEWENCc0w2YzRr?=
 =?utf-8?B?eFZDbGMxL044RnQ4L2p5WW9TenIzKzdwSlV5WjdMcFEvaDlyOFJ5aHRuTzlG?=
 =?utf-8?B?d05jK0dON2VvZk40cmNRRDA4d0tkY2Rxa0puc3hJb3JDRStCbkE1dVFVNTVw?=
 =?utf-8?B?aElHUWJkV0V3M3I1Z1VoQTRVekoxT3pSbk15bERFN3BnWUVzYkgxS1NVUExO?=
 =?utf-8?B?ajZTN1VBUTI4MlBlRzdEbjJETzJUNFJ3U1FOZEhqMDNpV0RWZXZHOHdKMHZG?=
 =?utf-8?B?K2NMNllza0JZQStXZWsrRkYyMGVoV2g4Zm9QdllOczA3cVF6WHcyT0FadFZB?=
 =?utf-8?B?ZWpsWm1DbG4zRk1QRGpLRW1jbGh1RkhwYm05VkVHMmthaERUREZaTys5eE52?=
 =?utf-8?B?SndxellvQkhReHEvSzRnbVNqSVRkU09adVpXZjIvdG5vVDkvcUpTQUhqOXdW?=
 =?utf-8?B?ZHB2S3V5T1pXMGhZWDFFdUJGM0NBY2JLcWpYTC9DeFlxZWhJdDBzTkFFYVFY?=
 =?utf-8?B?U2xkclpOK1MxV1dRSHhXaEk5aUtOUitPNnBaZW9udWM5VjY5Z1hsSWlGYnF1?=
 =?utf-8?B?LzBmNWJWWUNJN1pxNVEzZldqUm9BN1MvbVpMQklzSmJLUnFxNTNwQ1RzNWZi?=
 =?utf-8?B?M3ZhUFNjc2RTR1JxclhWRjVTcms5c2hVZ3JDRitMZXFQZE5taFYxdFpYSkJi?=
 =?utf-8?B?eVBiZExXd2VjZnlUSCs0b3Era0l4ZmpjTVE4MmREN0F3WCtzVlI0dnp1QTdY?=
 =?utf-8?B?RElJSVFCcTQyZzk4eThaWU5lR25PLytNV3ZqZkpDOHpCMUxnWGMwZWRMbjc0?=
 =?utf-8?B?aVlJN3BtZFA5a2lQSGRJck1GSUdISVRrc0hzVFFYT2RpS0VoMVlIRWIvSG1q?=
 =?utf-8?B?cFN1ZXZwd2UzUFN3VWRtTDVOTUl1ejZqQkVOQ1RHTTdPa1ltVVcyaHE2Ylkr?=
 =?utf-8?B?aWI4S2RpWUJ5cW5CV2NvRFpFRGdMZHpPTVdLMnJHTVdqT0cycURueXZ3bUcz?=
 =?utf-8?B?RVZKTHczOVhuRVF6YUs4N3pNc2tqbld4SWFOVjU4RGp1d3FPY3l2YllMRnlI?=
 =?utf-8?B?VVJXSUJNNmNxNXlZZk1qRnp2ZVcrSVhLOHoxSzUyUGY0dWtpaUFpT0poOUZo?=
 =?utf-8?B?MVlwVDZ2TXU4YTFNNGFNWGlRZW1Pa0xSdCsyam9LYUpFbHNtVU96aGFzckpp?=
 =?utf-8?B?UVZKVnJrTDEyQjRNOUduMENjYVJwSU0yWUZBK3kxUENWQWRwR1NEQ0gyVHJ5?=
 =?utf-8?B?MGQyNmY5aEZFdHpBOVBXdU1wc2tVa3ZGdXhMc3ZlbGJRY3o0UHBYb3Z0NENs?=
 =?utf-8?B?b1BEN0hyQlRTWklhSlVxeXBoc2U1SEJ4UXFBelJSUmFiNUVpdytFMGZna2cy?=
 =?utf-8?B?UVRzOFhrY05DM2hsRVBjT3FhRWF3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1525354a-b2ae-4feb-3520-08d9b98604e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 13:32:30.2529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLtmuqaSUp3I7PtLosaS3ZUNolAFMQwhb650bqyo/HN5IZUtRtF2+u4+WQKN3lEfOh/dZp/GzB2EqUkC/a0dh//JEdK+adSMdvIF2ljCF8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7035
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWxsLA0KDQpHZW50bGUgcGluZy4NCg0KQXJlIHdlIGhhcHB5IHdpdGggdGhpcyBwYXRjaD8g
UGxlYXNlIGxldCBtZSBrbm93Lg0KDQpBcyBtZW50aW9uZWQgaW4gWzFdLCBpdCBoYXMgZGVwZW5k
ZW5jeSBvbiByZXNldCBwYXRjaA0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXJlbmVzYXMtc29jL3BhdGNoLzIwMjExMTEyMTg0NDEzLjQzOTEtMi1iaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbS8NCg0KUmVnYXJkcywNCkJpanUNCg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYzIDMvNF0gY2xvY2tzb3VyY2UvZHJpdmVycy9yZW5lc2FzLW9zdG06IEFkZCBS
Wi9HMkwNCj4gT1NUTSBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1LCBEYW5pZWwsDQo+IA0KPiBPbiBN
b24sIE5vdiAyOSwgMjAyMSBhdCAxMTowNiBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAzLzRdIGNs
b2Nrc291cmNlL2RyaXZlcnMvcmVuZXNhcy1vc3RtOiBBZGQNCj4gPiA+IFJaL0cyTCBPU1RNIHN1
cHBvcnQNCj4gPiA+DQo+ID4gPiBPbiAxMi8xMS8yMDIxIDE5OjQ0LCBCaWp1IERhcyB3cm90ZToN
Cj4gPiA+ID4gUlovRzJMIFNvQyBoYXMgR2VuZXJpYyBUaW1lciBNb2R1bGUoYS5rLmEgT1NUTSkg
d2hpY2ggbmVlZHMgdG8NCj4gPiA+ID4gZGVhc3NlcnQgdGhlIHJlc2V0IGxpbmUgYmVmb3JlIGFj
Y2Vzc2luZyBhbnkgcmVnaXN0ZXJzLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMg
YW4gZW50cnkgcG9pbnQgZm9yIFJaL0cyTCBzbyB0aGF0IHdlIGNhbiBkZWFzc2VydA0KPiA+ID4g
PiB0aGUgcmVzZXQgbGluZSBpbiBwcm9iZSBjYWxsYmFjay4NCj4gPiA+DQo+ID4gPiBXaGF0IGlz
IHRoZSBjb25uZWN0aW9uIGJldHdlZW4gYWRkaW5nIHRoZSByZXNldCBsaW5lIGNvbnRyb2wgYW5k
IHRoZQ0KPiA+ID4gcGxhdGZvcm0gZHJpdmVyIGF0IHRoZSBlbmQgb2YgdGhlIGRyaXZlciA/DQo+
ID4NCj4gPiBUaGUgb3JpZ2luYWwgZHJpdmVyIGhhcyBubyBhcm0gYXJjaGl0ZWN0dXJlIHRpbWVy
LCBzbyBpdCBuZWVkcyB0byBiZQ0KPiANCj4gcy9kcml2ZXIvU29DIHVzZWQgd2l0aCB0aGlzIGRy
aXZlci8NCj4gDQo+ID4gY2FsbGVkIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgYW5kIHVzaW5nIG9m
IGNhbGxzIGZvciBoYW5kbGluZyB0aGUNCj4gY2xvY2tzLg0KPiANCj4gSGVuY2UgbXVzdCBiZSBo
YW5kbGVkIGJ5IFRJTUVSX09GX0RFQ0xBUkUoKS4NCj4gDQo+ID4gV2hlcmUgYXMgUlovRzJMIGhh
cyBhcm0gYXJjaGl0ZWN0dXJlIHRpbWVyIGFuZCBpdCBuZWVkcyB0byByZWxlYXNlIHRoZQ0KPiA+
IG1vZHVsZSBSZXNldCBiZWZvcmUgYWNjZXNzaW5nIGFueSByZWdpc3RlcnMuIFNvIGl0IGhhcyB0
byBiZSBidWlsdCBpbg0KPiA+IGFuZCBpdCBuZWVkcyBjcGcgZHJpdmVyIHdoaWNoIGhhcHBlbnMg
YXQgbGF0ZXIgc3RhZ2UgY29tcGFyZWQgdG8gdGhlDQo+IG9yaWdpbmFsIGNhc2UsIGZvciBkZS1h
c3NlcnRpbmcgdGhlIHJlc2V0Lg0KPiA+DQo+ID4gR2VlcnQsIHBsZWFzZSBjb3JyZWN0IG1lIGlm
IEkgYW0gd3JvbmcuDQo+IA0KPiBUaGUgcmVzZXQgZHJpdmVyIGlzIG5vdCBhdmFpbGFibGUgeWV0
IGF0IFRJTUVSX09GX0RFQ0xBUkUoKSB0aW1lLCBzbw0KPiBvZl9yZXNldF9jb250cm9sX2dldF9v
cHRpb25hbF9leGNsdXNpdmUoKSByZXR1cm5zIC1FUFJPQkVfREVGRVIgb24gUlovRzJMLg0KPiBG
b3J0dW5hdGVseSB0aGVyZSBpcyBubyBuZWVkIHRvIGhhdmUgdGhpcyB0aW1lciBhdmFpbGFibGUg
ZWFybHkgb24gUlovRzJMLA0KPiBhcyBpdCB1c2VzIHRoZSBhcm0gYXJjaGl0ZWN0dXJlIHRpbWVy
IGFzIHRoZSBtYWluIGNsb2NrIHNvdXJjZS4gIFN0aWxsLCB0bw0KPiBiZSBhdmFpbGFibGUgYXQg
YWxsLCB0aGUgcGxhdGZvcm0gZHJpdmVyIGlzIG5lZWRlZCB0byBzdXBwb3J0IHJlLXByb2JpbmcN
Cj4gYWZ0ZXIgdGhlIHJlc2V0IGRyaXZlciBoYXMgYmVjb21lIGF2YWlsYWJsZS4NCj4gDQo+IA0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gPiA+IFJldmlld2VkLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+IDxwcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2
Mi0+djM6DQo+ID4gPiA+ICAqIEFkZGVkIHJlc2V0X2NvbnRyb2xfcHV0KCkgb24gZXJyb3IgcGF0
aC4NCj4gPiA+ID4gICogZW5hYmxlZCBzdXBwcmVzc19iaW5kX2F0dHJzIGluIG9zdG1fZGV2aWNl
X2RyaXZlciBzdHJ1Y3R1cmUNCj4gPiA+ID4gdjEtPnYyOg0KPiA+ID4gPiAgKiBBZGRlZCByZXNl
dCBoYW5kbGluZyBpbnNpZGUgb3N0bV9pbml0DQo+ID4gPiA+ICAqIFVzZWQgc2FtZSBjb21wYXRp
YmxlIGZvciBidWlsdGluIGRyaXZlciBhc3dlbGwNCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2
ZXJzL2Nsb2Nrc291cmNlL3JlbmVzYXMtb3N0bS5jIHwgMzkNCj4gPiA+ID4gKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9zdG0uYw0KPiA+ID4gPiBiL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvcmVuZXNhcy1vc3RtLmMNCj4gPiA+ID4gaW5kZXggM2QwNmJhNjYwMDhjLi4yMWQxMzkyNjM3
YjggMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3Rt
LmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9zdG0uYw0KPiA+
ID4gPiBAQCAtOSw2ICs5LDggQEANCj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4g
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9jbG9ja2NoaXBzLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8
bGludXgvaW50ZXJydXB0Lmg+DQo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+ICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4
L3NjaGVkX2Nsb2NrLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ID4g
Pg0KPiA+ID4gPiBAQCAtMTU5LDYgKzE2MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IG9zdG1faW5p
dF9jbGtldnQoc3RydWN0DQo+ID4gPiA+IHRpbWVyX29mDQo+ID4gPiA+ICp0bykNCj4gPiA+ID4N
Cj4gPiA+ID4gIHN0YXRpYyBpbnQgX19pbml0IG9zdG1faW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wKSAgew0KPiA+ID4gPiArICAgc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGM7DQo+ID4gPiA+
ICAgICBzdHJ1Y3QgdGltZXJfb2YgKnRvOw0KPiA+ID4gPiAgICAgaW50IHJldDsNCj4gPiA+ID4N
Cj4gPiA+ID4gQEAgLTE2Niw2ICsxNjksMTQgQEAgc3RhdGljIGludCBfX2luaXQgb3N0bV9pbml0
KHN0cnVjdCBkZXZpY2Vfbm9kZQ0KPiAqbnApDQo+ID4gPiA+ICAgICBpZiAoIXRvKQ0KPiA+ID4g
PiAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiA+ID4NCj4gPiA+ID4gKyAgIHJzdGMg
PSBvZl9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUobnAsIE5VTEwpOw0KPiA+
ID4gPiArICAgaWYgKElTX0VSUihyc3RjKSkgew0KPiA+ID4gPiArICAgICAgICAgICByZXQgPSBQ
VFJfRVJSKHJzdGMpOw0KPiA+ID4gPiArICAgICAgICAgICBnb3RvIGVycl9mcmVlOw0KPiA+ID4g
PiArICAgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICByZXNldF9jb250cm9sX2RlYXNzZXJ0KHJz
dGMpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICAgICB0by0+ZmxhZ3MgPSBUSU1FUl9PRl9CQVNFIHwg
VElNRVJfT0ZfQ0xPQ0s7DQo+ID4gPiA+ICAgICBpZiAoc3lzdGVtX2Nsb2NrKSB7DQo+ID4gPiA+
ICAgICAgICAgICAgIC8qDQo+ID4gPiA+IEBAIC0xNzgsNyArMTg5LDcgQEAgc3RhdGljIGludCBf
X2luaXQgb3N0bV9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZQ0KPiA+ID4gPiAqbnApDQo+ID4gPiA+
DQo+ID4gPiA+ICAgICByZXQgPSB0aW1lcl9vZl9pbml0KG5wLCB0byk7DQo+ID4gPiA+ICAgICBp
ZiAocmV0KQ0KPiA+ID4gPiAtICAgICAgICAgICBnb3RvIGVycl9mcmVlOw0KPiA+ID4gPiArICAg
ICAgICAgICBnb3RvIGVycl9yZXNldDsNCj4gPiA+ID4NCj4gPiA+ID4gICAgIC8qDQo+ID4gPiA+
ICAgICAgKiBGaXJzdCBwcm9iZWQgZGV2aWNlIHdpbGwgYmUgdXNlZCBhcyBzeXN0ZW0gY2xvY2tz
b3VyY2UuIEFueQ0KPiA+ID4gPiBAQA0KPiA+ID4gPiAtMjAzLDkgKzIxNCwzNSBAQCBzdGF0aWMg
aW50IF9faW5pdCBvc3RtX2luaXQoc3RydWN0IGRldmljZV9ub2RlDQo+ID4gPiA+ICpucCkNCj4g
PiA+ID4NCj4gPiA+ID4gIGVycl9jbGVhbnVwOg0KPiA+ID4gPiAgICAgdGltZXJfb2ZfY2xlYW51
cCh0byk7DQo+ID4gPiA+ICtlcnJfcmVzZXQ6DQo+ID4gPiA+ICsgICByZXNldF9jb250cm9sX2Fz
c2VydChyc3RjKTsNCj4gPiA+ID4gKyAgIHJlc2V0X2NvbnRyb2xfcHV0KHJzdGMpOw0KPiA+ID4g
PiAgZXJyX2ZyZWU6DQo+ID4gPiA+ICAgICBrZnJlZSh0byk7DQo+ID4gPiA+ICAgICByZXR1cm4g
cmV0Ow0KPiA+ID4gPiAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgVElNRVJfT0ZfREVDTEFSRShvc3Rt
LCAicmVuZXNhcyxvc3RtIiwgb3N0bV9pbml0KTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArI2lmZGVm
IENPTkZJR19BUkNIX1I5QTA3RzA0NA0KPiA+ID4gPiArc3RhdGljIGludCBfX2luaXQgb3N0bV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gPiA+ICsgICBzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICByZXR1cm4g
b3N0bV9pbml0KGRldi0+b2Zfbm9kZSk7IH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb3N0bV9vZl90YWJsZVtdID0gew0KPiA+ID4gPiArICAg
eyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLG9zdG0iLCB9LA0KPiA+ID4gPiArICAgeyAvKiBzZW50
aW5lbCAqLyB9DQo+ID4gPiA+ICt9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBvc3RtX2RldmljZV9kcml2ZXIgPSB7DQo+ID4gPiA+ICsgICAuZHJp
dmVyID0gew0KPiA+ID4gPiArICAgICAgICAgICAubmFtZSA9ICJyZW5lc2FzX29zdG0iLA0KPiA+
ID4gPiArICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIob3N0bV9vZl90
YWJsZSksDQo+ID4gPiA+ICsgICAgICAgICAgIC5zdXBwcmVzc19iaW5kX2F0dHJzID0gdHJ1ZSwN
Cj4gPiA+ID4gKyAgIH0sDQo+ID4gPiA+ICt9Ow0KPiA+ID4gPiArYnVpbHRpbl9wbGF0Zm9ybV9k
cml2ZXJfcHJvYmUob3N0bV9kZXZpY2VfZHJpdmVyLCBvc3RtX3Byb2JlKTsNCj4gPiA+ID4gKyNl
bmRpZg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+
IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwg
bXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

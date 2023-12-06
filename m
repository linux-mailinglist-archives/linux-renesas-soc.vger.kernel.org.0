Return-Path: <linux-renesas-soc+bounces-780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD0F80739A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 16:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B5E0B210F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 15:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524D43FE32;
	Wed,  6 Dec 2023 15:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bBeQOze7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2126.outbound.protection.outlook.com [40.107.114.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD0BB5;
	Wed,  6 Dec 2023 07:19:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjwDnGSfQQ7okoHOuXVTk2TJEsX3sraJsx3W/pdqItFXboZYduFgg/s6U51Pm5wLkigZD7nWq2rUf1SW2n8aSzgJZwP8yiy0ieM8H2yvSfLZ9r/WLC5fnx5kQSk1m8h2xQ1HN980pc9/FPygtKnlMWv3zSX9q0fySa40DjLv+mPmRMDIu5cMBclwKl5KLrEsXl9DIsSwKw+9iedH33FPyFmNk7VdIlgxuwcZ0onl0IMPtKk7N+hFGaT2SB9HLNsKX6oXpyXGz/u3ForURBWnEGbx1qgnHgMWl1rfuPjBLXKJoBHeJs1Giyc7v/B1pQcU+E8VSu4rvN58bOtMaBa88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UmHcjNBZ72MlIW+e3eLZJ0KIjXkhbiNj77wiqukGUM=;
 b=h6pErlNKzKFlACrZ3q9BIxRukTZ2n70XnF57IFYg2ZVOYMi1N7RC5QdanQWdtlf3A+/nCfKZ/t9FLi/SQZk4DGwLSoIlL3sFat0UErEKsB2nyWe3HrFVD+bP3b1REp4yzlBV4iJWfQmWMRur+y4yVlDIlTLmSEr0SSRB7G+qeA/u7D8tqAJoAjThCRgEkSE3Q5IVxrT/0IJMaXvgKvHhaCqHCo3XozdiMdkhGywe55+vZK//INOUNcn1tYXCspUjP07VE7AxWL+NogiX6oatp1f+iAIt5IRIeh+TUHZ1Re5JLQXbIHFzBOE/rQBPwbij2I0wU2qUf2VY9Rjj5aA2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UmHcjNBZ72MlIW+e3eLZJ0KIjXkhbiNj77wiqukGUM=;
 b=bBeQOze7BbAchm8OhzIUPc4ZR5PpTRL9Oi72G8R0BNneBOjt1Q9emLvZelv5JkAVKXyK0gypyZtcTv8tsscbpc12i9+OuNRcMND7+kSaBrJ9yLtsH716qEPWV4IG9JEz4HjAHPbyCuUtEOJ8b4x5Rb/oh8vM1ex31dELUQzBhWI=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB6085.jpnprd01.prod.outlook.com
 (2603:1096:604:d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 15:19:50 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::4af6:b31a:8826:51ac%6]) with mapi id 15.20.7091.010; Wed, 6 Dec 2023
 15:19:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>
CC: kernel test robot <lkp@intel.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Support
 Opensource <support.opensource@diasemi.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Thread-Topic: [PATCH 4/6] dt-bindings: mfd: Convert da9062 to json-schema
Thread-Index: AQHaJEbLbkLjDyc/Rk+ATYqnJ+1Y7rCbvd2AgABG8QCAAELEgIAAHjdA
Date: Wed, 6 Dec 2023 15:19:50 +0000
Message-ID:
 <TYCPR01MB112691F765724764ED08F7FBB8684A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231201110840.37408-5-biju.das.jz@bp.renesas.com>
 <202312061323.Zk81yCZU-lkp@intel.com>
 <TYVPR01MB11279FA6949EFAE62C70EB2948684A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <20231206132813.GC3375667@google.com>
In-Reply-To: <20231206132813.GC3375667@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB6085:EE_
x-ms-office365-filtering-correlation-id: 59bc927b-01a0-4549-bb2c-08dbf66eca92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 JrD6Bx/SUDCoIzUPPfaL5T9tw+zLyG6aQPYtzjKSddw8glWwshCbRmsFt7h7nC1IFb8J2u+2HHnbp8oXwBpK9HFd2u2f2yvWs5Hbp8frE54WNgHCTv1JFYnrVgo5WWhdID8u7dqLvvhkVNC1Rjltkrk2DVBxZ+UGrI2vEx52ejAioLzAV9ju833ogOWoZPwKOd+UsGClCE7QDvRSXB8U8eawYrMXntIeHkvwzcucAFSJL/iBsx64qCxjhBCuF+KXOOophyU1XMBELLChaErshyDrNH2ERZnUce66wN+U2Nc+ugYjY7kSdVigekpBvOV4Mb9wsyRZOAEaQaZj8MwC9fpQxOyN6PMedpcauh7a2gJAtJmyFgplR4ypMDz2WZNVeplvM5soTbBIwE3ipNyz6xL1ov0yVyhjdK+qwvMlJ9uMcUzUnceS6h37ZCthr5hxDo+oORXNe6WnUIeVdVwAjI+v9BqAX0UHsaiqX21Y+wny4veb2PQTakl86R9P/oUdbQPTB9k0+qfAKTeWRMYxQFkUhcHQPUKXYIeNwvw+aF7u41bHpipUmR37J501vkAWuF19fZbBjFmOnD4yx+VnkxpuyLpEr7dZi9zofFuK4nJ1vzrB+u91cbYqrg8xttYhbhIVlh5AyE3CvizcbEu2lHfdFtgwtZO4McwzF+E+xIY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38070700009)(55016003)(38100700002)(122000001)(7416002)(33656002)(5660300002)(2906002)(9686003)(83380400001)(53546011)(6506007)(71200400001)(7696005)(26005)(478600001)(41300700001)(66946007)(4326008)(54906003)(64756008)(66446008)(66476007)(66556008)(6916009)(316002)(76116006)(52536014)(8676002)(86362001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFFBckRuYkFQdVplM1h0Rkk0R1BrZWtjT2U5VXJodUhQNzhLT3ZnVm8yUG5Z?=
 =?utf-8?B?V1R5WUFBcnpFK3ZoZ2Y1SEptUmlrdGZXNDNoS3RVaWs4cmJEVE1WVGN5cWll?=
 =?utf-8?B?MXRRcWM1SHBGbVpMNG9YQ0lxSFdlY1kyMTZ1aUFrc29KS1JmdXQ0alNDbDhF?=
 =?utf-8?B?bnFBb2ZnYm9XZmdSSlFPUno3aFdOQUJQSHJWN1JOai9lWCtJeGFxMlVPNmZj?=
 =?utf-8?B?Q3pYdnJQMFBqR3ExeHFja2RSY2l2Mkg0MlhRQXVjM1pHaTg1QVRGellpRUpS?=
 =?utf-8?B?bmF1RmpzVFM2V2ZVN1pxWEErNmtNY2JEQ3Zyb0MwVHRlaExvTUs2eTV5VmdW?=
 =?utf-8?B?T1dOcTFNY28rZElTMFJiQVRlUURuOXZkL0RXMkY4RUttOU5iSTVOZGVFYUFZ?=
 =?utf-8?B?VUd0VFgxaXVib1ZzTlRTdWl1QUpYUDZZZXoyaXNxODVxNk9JMDVSUkdiU3dk?=
 =?utf-8?B?b2twL0RFbGtXMmc4aXhxc2RFSmhtNFl2RWdCNERpZG9pTDZCWWJZZ2lsRGpQ?=
 =?utf-8?B?cGxKV0grRlB0MWEwQXhRbjEySnhWaHJPbHNZZDRtSFI4Tzd3VVN4eXNXTXA1?=
 =?utf-8?B?MURQRWk0WHdVa0hrRTJUY3N0d1lZdTZjeWJPVko1N0lOamN4Rmg4c0lhTURQ?=
 =?utf-8?B?bkFUcC9taVFLOFJybjcrV0lZYjV2TTdpUzRySXV5VVBibW1lOFJrNDFQRjFG?=
 =?utf-8?B?VjQwMFV5NlVCaEtzaWRVNTYydW5QaWJTQThpbDlJY3FUc2c1T21BWEVwUEZV?=
 =?utf-8?B?Vm12STU1dEhucEVWUkVmbzZHeGU5RFBnZktUQU10RGFqYmNkZUFmcmxaLzEx?=
 =?utf-8?B?d1JNT3FMN1pQcWlMUWtTUkpXTUkvZjlRdEtubFY5TktnN0tCeHRFVWQzMkRE?=
 =?utf-8?B?bGZBdjJoK3ZIbHdTQVF4cXBqUkNmNTRPODFsMm04LzJWN0N4S3dKT2RsbDVN?=
 =?utf-8?B?bDg4NU9LTXR1bUt5dWs3algySk81VTNkRjBTb0hQdW4zdnQ5M3I3TUxxYTlD?=
 =?utf-8?B?UkJXNkdrMFZzTk43TU5iYWd5SG9MWVhHc003UVFPc0xZL0NNS1hpdlNTWGJ3?=
 =?utf-8?B?NGlCVWRhdU9HdXVLeEFaaityTGFBb0JTM3M1WXRFbDZHZ0ErZ2gvV0syeWlR?=
 =?utf-8?B?c0VIMWpXVkozckFjb2VDMXVoZHJLNUYrd3h1S2lJLzMyejRoZWRNdUMxQmhI?=
 =?utf-8?B?WVh6ajRaVDNhYWFITFBoR1lEaW9aOWVXeHh6TW0wTEdYMjdUWkpHbUhvZ0lR?=
 =?utf-8?B?WmppNWVOSEFnVFB3YVJxYXVPeTVobnMyeUozTjNqNmJPeTVLY29NZzJkRGZ2?=
 =?utf-8?B?K2FlYVN0L3ZTOHo5UmxtaFdEMi84VTcrVytaRzdTWU91c0d2K3NrWFJiMXBJ?=
 =?utf-8?B?V1lpT1k1eHRycjNtOXNnUktMY3VacW9wZ0dqTTkwUHk4RUpqMVhkTkhXa3VW?=
 =?utf-8?B?blI4b3pJM1hYMVh0T0R0UlhJQ1RycDZTSzJkOVR3aGNaL1A5bHNOTEZFN0t3?=
 =?utf-8?B?TnV4M3dPdEtwa1RkZVF4NjQyVVpSL1RNZWVjVlFPZnFoNUlzVEIrN1BjSWJj?=
 =?utf-8?B?a3FwTVBobkxiYkhNSEZXUW5TaHJUclQvSmlrdWtxR1RKNGsxcGRqVXBoWVIx?=
 =?utf-8?B?OWxiYzBxZVRpNmNTd20zak1RK3ptUTF6c3NTcy9mTlNRZHE1akZEL1FCSld2?=
 =?utf-8?B?V0psUUkrL2NFdkV3c0ZiRHI2OHNLU01UY0hiZ0lETERocUxzWFVIN210VDJM?=
 =?utf-8?B?U3VpQzBGOFhFWlFIZUFzaUVpSVlreWYyeDlNYzBkVFBndWpmTmRpeGZqcURz?=
 =?utf-8?B?Vkx4THh0T0N6eVZva2tEWTZoWlpMYWYwbThFQkJpUGhWd2RXV2lndzUwRmxZ?=
 =?utf-8?B?NFdnSXhobEhDUzI2cmFsME5ZVUs0M2RSbTdXS09hS2xPYTllem9FN0VvcVpx?=
 =?utf-8?B?N3BRaEg1N3VtbENLUGtyVTZ2ZEZWNzFXT0V5M0xsaHc3ck1tYUxHcjRoOXFM?=
 =?utf-8?B?MzZMRDBNTkN3bm1QcmhqaVl6ZEFvV0tSQkROV3ExS0d4TWR4bHRHSExXOHcr?=
 =?utf-8?B?NUZEMW1RQTh6WnJhcm53WE9EeHlzdmdTdzFkODZWNDQ4RWJ3eURvMlQxckY5?=
 =?utf-8?B?WkhlY09iVEdSUFE0Wk9ON0N2Tm5jZEdzS2lLZVR3MGdMNlUrOFFSQmQvTmVq?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bc927b-01a0-4549-bb2c-08dbf66eca92
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 15:19:50.8395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /vTug+3SDrkiuvT91QVwJofTEkCDggFaC1Du08VeDXMTjVe5lFXEDG4RkX3QlgmpFnT0T2v3Vyo/PGjb2CTXCb1hkbbfIdyTVooKq//o/Mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6085

SGkgTGVlIEpvbmVzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExl
ZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgNiwg
MjAyMyAxOjI4IFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC82XSBkdC1iaW5kaW5nczogbWZk
OiBDb252ZXJ0IGRhOTA2MiB0byBqc29uLXNjaGVtYQ0KPiANCj4gT24gV2VkLCAwNiBEZWMgMjAy
MywgQmlqdSBEYXMgd3JvdGU6DQo+IA0KPiA+IEhpIGtlcm5lbCB0ZXN0IHJvYm90LA0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNl0gZHQt
YmluZGluZ3M6IG1mZDogQ29udmVydCBkYTkwNjIgdG8NCj4gPiA+IGpzb24tc2NoZW1hDQo+ID4g
Pg0KPiA+ID4gSGkgQmlqdSwNCj4gPiA+DQo+ID4gPiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2Vk
IHRoZSBmb2xsb3dpbmcgYnVpbGQgd2FybmluZ3M6DQo+ID4gPg0KPiA+ID4NCj4gPiA+IElmIHlv
dSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0
IGEgbmV3DQo+ID4gPiB2ZXJzaW9uIG9mIHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBh
ZGQgZm9sbG93aW5nIHRhZ3MNCj4gPiA+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPg0KPiA+ID4gfCBDbG9zZXM6DQo+ID4gPg0KPiA+ID4gQWxsIHdhcm5p
bmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+ID4gPg0KPiA+ID4gPj4gV2FybmluZzog
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2RhOTA2Mi1vbmtleS50eHQN
Cj4gPiA+ID4+IHJlZmVyZW5jZXMgYSBmaWxlIHRoYXQgZG9lc24ndCBleGlzdDoNCj4gPiA+ID4+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvZGE5MDYyLnR4dA0KPiA+ID4g
Pj4gV2FybmluZzoNCj4gPiA+ID4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90
aGVybWFsL2RhOTA2Mi10aGVybWFsLnR4dA0KPiA+ID4gPj4gcmVmZXJlbmNlcyBhIGZpbGUgdGhh
dCBkb2Vzbid0IGV4aXN0Og0KPiA+ID4gPj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21mZC9kYTkwNjIudHh0DQo+ID4gPg0KPiA+DQo+ID4gVGhlcmUgaXMgYW4gdXBkYXRlZCBw
YXRjaCBzZXJpZXMgYXZhaWxhYmxlWzFdIGFuZCBQbGVhc2UgcmV0ZXN0IGFuZA0KPiA+IHByb3Zp
ZGUgZmVlZGJhY2sgaWYgYW55Pw0KPiANCj4gRG8geW91IG9mdGVuIGZpbmQgeW91cnNlbGYgY2hh
dHRpbmcgd2l0aCBpbmFuaW1hdGUvYXV0b21hdGVkIHNlcnZpY2VzPyA6KQ0KDQpGWUksIGJhc2Vk
IG9uIHRoZSBwcmV2aW91cyBleHBlcmllbmNlLCB0aGVyZSBhcmUgc29tZSBwZW9wbGUgdXNlZCB0
byByZXNwb25kDQpldmVuIHRob3VnaCBpdCBpcyBhZGRyZXNzZWQgdG8ga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+Lg0KDQpJIGRvbid0IGtub3cgYWJvdXQgdGhlIGN1cnJlbnQgc2l0
dWF0aW9uLg0KDQpDaGVlcnMsDQpCaWp1DQo=


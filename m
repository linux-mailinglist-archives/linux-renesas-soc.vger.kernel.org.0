Return-Path: <linux-renesas-soc+bounces-494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C2B8007F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 11:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F2B228193C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 10:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E21F168DF;
	Fri,  1 Dec 2023 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CbKkIUFy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F3EBD;
	Fri,  1 Dec 2023 02:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKXd4AZv5ZFQX3CLaqomoYpmdfbksQ9LRkteIxU0DF13pkW1Z5WTAoeIV1M5yJ0bZe9km/yZB/LQltMl41Pl1sOToas1qefY/3w76L8+0AFuUKW4wJWSwSpWVhUM4nKly2Fv6AgvSRSp8B7283iSOvXv1+p/1vPBHN2rAe2aa6JjKCGEn1aoCGd1JCJuCYNpjg62KYvHHLpLLVBYEyQ1dgknA4SCaA1ddsAPOxAEClsmuFqslGDzQktNr+X4H3LpcF4EkcXwAWYs2ScK0iPpnhiU99J2BEtXKwnjx3/XwXrRhRgDf/kdcSCrM/wDCwUpW+fUdzJNbCTLicei+g2Y1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF14b+CCzNYQ0BHoKKdrBY35+wSKSU1HVM0usx26FiM=;
 b=b7SQB2sQN39YqWqAHssYPt3UX6mhsydKlKueVpL7AEbAbbAwHgFLlXDolHRe1QN3V0mjxFRSWohUz91xqZ0tdrSawEDC6WMuKcbqOSiP2IrrNHoov9rxZE6f5bax4eXahxY6ObNDkk4izI2RpaRZlhkIAyywWzN9i70IepmpJrsnIMsRlklXNlDa9pNmWbGm0Yf4UD4hyfSm7TNibuWsJNZ79A+Q1JuWwDi+L6MJkqHEFBGa5JNuArnf8U/BM3k3MSpAZGU0tLiUwif4aN8WwmJPoUJvwEoVewV15LZt06rE6ej73hfuDZApKXYZAyddxoYEVyg972WR6rsyGX5L3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DF14b+CCzNYQ0BHoKKdrBY35+wSKSU1HVM0usx26FiM=;
 b=CbKkIUFyfoYMAkqIfzHKTNOIcg4qEklbdLyMJZ01nuTyRAQiaQAij6SXx/Yp1hnkD1Jt57/qQ4ffLCqx/lXYtPXz38nZwjpmA1yvWKPEuWOh591jGbT+Jzt+dfa/oN7a3iUJkUOfUZixUKqna3bRlqTeBKvF2W/tqJTMYfBPv54=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB7699.jpnprd01.prod.outlook.com
 (2603:1096:604:1b3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Fri, 1 Dec
 2023 10:11:09 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 10:11:09 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next v2 8/9] net: rswitch: Add jumbo frames handling
 for TX
Thread-Topic: [PATCH net-next v2 8/9] net: rswitch: Add jumbo frames handling
 for TX
Thread-Index: AQHaJBnRzzXQJL5VEE6BNIUFx0Xx+bCUH96AgAAUywA=
Date: Fri, 1 Dec 2023 10:11:09 +0000
Message-ID:
 <TYBPR01MB5341B18F5867921CAFC5E24ED881A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com>
 <20231201054655.3731772-9-yoshihiro.shimoda.uh@renesas.com>
 <3d3d27f6-a0ee-993e-f5b8-cd940a5e042f@omp.ru>
In-Reply-To: <3d3d27f6-a0ee-993e-f5b8-cd940a5e042f@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB7699:EE_
x-ms-office365-filtering-correlation-id: a90f1590-68d6-48f2-3d9a-08dbf255d710
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VyrwnxolCJlXbqKWCzLvkY2KjLyeZpAQ5b8/UQtrTAGNRh4n3nhnhi4pguDgqyVhkfBw7zuYgjBDlpEcVNT1ymvzxD+VenjwYL7SdL/UAkaOllcuDerVjHEZWnFTy6suEJ0YlRqHgVPLyfEm76JKXvXUxXYs9AuBzT9wksxNtQx29vjWen7w0WDXhKL5wNGYyOjY/gj95pvm1Z7xX6m7b4d4eGUoIUBm2KleilfeGg120PEzn+0TkNLfaCm0dsH3BOAd08AFFo1QJaHNFWIHNJAtatbSxXU/6sv3y8hz+0dGVfehJw20xBLsAizAHIUupe4tSeJd/3fwfyjeDHVwAi6cNm836JdL3alCvHeuicBM/8EQdg/cuozvEXNChoNz5xp0fR/Zhjr4w7wYtGGM/kCcqfLjg6CuQDN3YxEMEuv2U/WoTTxoUY9TSP8v0F7/Je3CmwK64PqAqTCE/wb3dHDfXZROoHxowXnb6Hq8S+//geM3IZ3Rwg8Z1F//bHy/6ItPT1+RobugH4teuFHmS8gRsHijJ1NzWv94bb/GA+6On3IYJ67MWaHITWjQN67ouTBzsZLqIlCdL0Cmi/c9Ib8NaWwq0Cw4t+gKleVt0tMNcEZ+zERHuoi5C2vCL8gO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(9686003)(41300700001)(38100700002)(6506007)(71200400001)(53546011)(8936002)(8676002)(4326008)(7696005)(52536014)(5660300002)(316002)(110136005)(478600001)(76116006)(66476007)(54906003)(55016003)(66446008)(64756008)(66556008)(66946007)(2906002)(122000001)(86362001)(33656002)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czh2SGhqUzltWHF2MWpwUEFmZSsxbUZnTHRYS2czUlluWVpqc2t5cUtNcm5r?=
 =?utf-8?B?OG9PbE1VazhYalR3ZTllVnZwR29jQ05lbFhIVVpCU0NHTFArMlUyalEwQnVF?=
 =?utf-8?B?YzJGOGhhNWNRaDRpZzBTOGg0NDgrUU9Zc3Bpc1ExZUNBaTR0emUvSURUaWEz?=
 =?utf-8?B?ZmdTWWkxU3NTbEtZRTk3djI4a0F6b0Y2RGRDT21JR2pyeXplcHQ5ZU1wSFpy?=
 =?utf-8?B?aGFJTHRGNE14MVlLZTlMZE1jc2UyVXNqcEI2S3ZIeDJuSnhtdDJxRmpWWkF2?=
 =?utf-8?B?UjBadU5pUStQcXVDMTg4MHFGOHcyM1ZkdXV6Q0d6c3F6U2VaMDUrazNKYUpM?=
 =?utf-8?B?YUxxdWtySVRBOUcvdktFaXVvQ0l4NHhMNGg4eDFScjZxcXpCeWQ5SWttQ0gy?=
 =?utf-8?B?aThoSUI0WC9jWXhabS9xTmV1VkRkdEZ5UG1mNWlzS0RXbkZ6eGpMWTMvM091?=
 =?utf-8?B?czZxcEs1cnhQVTBRTnF3MnVUOW1ZdXVBQklpSFJ1UG5uRkg3UVJJS0ovR0xs?=
 =?utf-8?B?bTkvTzZEMWc3SE9KeFZBLyttd3QxQ1NaM2RzbzRxeHJBMm5nSlc5dUpDcVdW?=
 =?utf-8?B?N25raUlpL3JBZ1NBbE85QXBRODE1Uk5VRWhOUE5qd1NyVlFncnVmREd5aWhr?=
 =?utf-8?B?cE1ZMVQzWncvQnBYWDRzb3Q4dmQ4b0pCQzFrYlY5NFp3NENzNHJDNkl5d2M3?=
 =?utf-8?B?QU9kMWlGVkg4ZWtRdUpwbWp5ejhDRnMvdzAyVk9Oa2NVbnozbmRwT0cvc3pV?=
 =?utf-8?B?ajQzS3U5Rkp1SUVIYm9QWVE4Y214cnp1cnZEZWJWU1FkMmdKbmFXOEJqT3R0?=
 =?utf-8?B?TWNSTDM4dWZNdEhHazg3OGJ1MEhOWmgxcTVUSnFEYVRNWWhXUWtQMTRiQzJq?=
 =?utf-8?B?OTRabHo5d1NqYUpZU0t1YmUyNXFHQ0FTZmZzcFMyVE1VQ2NFRDNnMERrL0xP?=
 =?utf-8?B?bFk0ZmFNaHY1VEx6MGV2MFFEdWZBTHp5eFI1K3lJTTgxRUJZc2hXZDkvSlhj?=
 =?utf-8?B?MnhSMnNOVEd5NGg2WTd1TE1Ra0ZiMnBraTF2U0FLa0N2MUl3MkxpS3ZjeG8y?=
 =?utf-8?B?ZEhQblY3cDFnNG81ZWpvZ0JSeEU3MVNGdC9rRlArc1RuNXViUkRNMTQxWE5O?=
 =?utf-8?B?aXZWTE1SKzlCeWhwaVZoTEhwTEFsNEpPMlhqNkFJbHpJcVZMOHZXbFlwQ05E?=
 =?utf-8?B?ZjN2TVF1bmRFdFlwUzJJVGZ1N2Iwc1cvZk82ckdZbjhUQUdDZ1NDRURmY29j?=
 =?utf-8?B?VWg2WFJ5RDFGYldNbllJMnN0UlIzdEcvdDh5SEFqT1IyNTAxVWZwYUdpQ05n?=
 =?utf-8?B?L1UzRUsxU213RVVEWFV3ZkFjTVJONjhGb0U1VXB0Mm5xemM3ay9QbXBySUZI?=
 =?utf-8?B?SUNBb2RCdHhtMkRZRnFRM2RCaldGemw1RkdRQ3NmU25YK1c3dTlTdWoyNTdH?=
 =?utf-8?B?UUc5R25wTEJQY0RiOGo3QVEyL2xRK3J1UkJlQVZtZUVSSzB0YXJuRnVmVnJT?=
 =?utf-8?B?N0l5YmtmcVgrQVN4QnVLY29saVFZWllFU0RVY1ZPUjFVNWtValNIazY2UVBC?=
 =?utf-8?B?ajFhbUMwdlhTWU9mcXVLR0E0L0hKYmNoeVdtTGlTYUhKUkNTbmIzQXF1d0ti?=
 =?utf-8?B?OTA0UHRVblNtakFEdVNQdGdEZG93WEphM0lFUVJXV3daSVlHTnBRdi9obnY1?=
 =?utf-8?B?dlIzWDdvREJYTlpsbHhXdUl5K2lSbVpnbWZiYnhGSHc5K1ladVJ4VHdUR01E?=
 =?utf-8?B?c1V4UFY1UU5iUEJrOFpBUW55SlNLU1Y5bVBjNWRKbzFLWHQweEhpVDN3cnIz?=
 =?utf-8?B?ZERvWmhTMUpwdEpUNGkvbkVQOWQ4NW8vVFlWS3JBK0lWNEpxcjgzR0VXYjJL?=
 =?utf-8?B?OWFBV2oyVVhXWk1SWDJOK2ZBQk9MYTVVMmtsVHVLQUYxT0NrUEE5dTA4enJN?=
 =?utf-8?B?T1RFTGhGVTgwczUzc0ZLVHl6MXExUUxkQVdrSWVvUE1CSnRUcWFza0p4VFVT?=
 =?utf-8?B?Q0FDZnppNWFmalBjV2dQNXZtL2Jad0JaYkNFa29qV21qV3hrbithbzdIeEZY?=
 =?utf-8?B?SU5ybEp1MnREcisyeDJmeHFYVERHclRoRFJZbjB2QUM2QXgrNlp4emV0SWVW?=
 =?utf-8?B?SXRsNWtvdEdDZENTUW5YQTZ4eUFnZjd0ZHN0MlQ2VklhaFBuRTgyMkE4cHZW?=
 =?utf-8?B?QkhhZ2dsaE82VTAzdHBSTnFFQXgvUkt6Nmc5Z1k1NWRtWGV5VU1LR3JtT2Vq?=
 =?utf-8?B?anB2UlVEVEhOR2N3a0NVSXdBQzB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a90f1590-68d6-48f2-3d9a-08dbf255d710
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 10:11:09.7127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ohcz+sL5krWEQzm8p5NFYM0nIQBl8B0ZXNUVuhPbPGnT5wO/iqq4l8yE8AAaMz/opHoIL9UDHRn+27SDfu30xWYFChk8A8wEhSMAM027Ks7JZM3ffZGcXxSK/Xyl/zIv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7699

SGVsbG8gU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogRnJpZGF5LCBE
ZWNlbWJlciAxLCAyMDIzIDU6NTUgUE0NCj4gDQo+IE9uIDEyLzEvMjMgODo0NiBBTSwgWW9zaGlo
aXJvIFNoaW1vZGEgd3JvdGU6DQo+IA0KPiA+IElmIHRoZSBkcml2ZXIgd291bGQgbGlrZSB0byB0
cmFuc21pdCBhIGp1bWJvIGZyYW1lIGxpa2UgMktpQiBvciBtb3JlLA0KPiA+IGl0IHNob3VsZCBi
ZSBzcGxpdCBpbnRvIG11bHRpcGxlIHF1ZXVlcy4gSW4gdGhlIG5lYXIgZnV0dXJlLCB0byBzdXBw
b3J0DQo+ID4gdGhpcywgYWRkIGhhbmRsaW5nIHNwZWNpZmljIGRlc2NyaXB0b3IgdHlwZXMgRntT
VEFSVCxNSUQsRU5EfS4gSG93ZXZlciwNCj4gPiBzdWNoIGp1bWJvIGZyYW1lcyB3aWxsIG5vdCBo
YXBwZW4geWV0IGJlY2F1c2UgdGhlIG1heGltdW0gTVRVIHNpemUgaXMNCj4gPiBzdGlsbCBkZWZh
dWx0IGZvciBub3cuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IFsuLi5dDQo+IA0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2guYyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaC5jDQo+ID4gaW5kZXggMDA5ZTZiZmRhZDI3Li5j
NWUzZWU4ZjgyYmMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNh
cy9yc3dpdGNoLmMNCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0
Y2guYw0KPiA+IEBAIC0xNjMxLDE1ICsxNjMxLDQ0IEBAIHN0YXRpYyBib29sIHJzd2l0Y2hfZXh0
X2Rlc2Nfc2V0KHN0cnVjdCByc3dpdGNoX2RldmljZSAqcmRldiwNCj4gWy4uLl0NCj4gPiAgc3Rh
dGljIG5ldGRldl90eF90IHJzd2l0Y2hfc3RhcnRfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBz
dHJ1Y3QgbmV0X2RldmljZSAqbmRldikNCj4gPiAgew0KPiA+ICAJc3RydWN0IHJzd2l0Y2hfZGV2
aWNlICpyZGV2ID0gbmV0ZGV2X3ByaXYobmRldik7DQo+ID4gIAlzdHJ1Y3QgcnN3aXRjaF9nd2Nh
X3F1ZXVlICpncSA9IHJkZXYtPnR4X3F1ZXVlOw0KPiA+ICsJZG1hX2FkZHJfdCBkbWFfYWRkciwg
ZG1hX2FkZHJfb3JpZzsNCj4gPiAgCW5ldGRldl90eF90IHJldCA9IE5FVERFVl9UWF9PSzsNCj4g
PiAgCXN0cnVjdCByc3dpdGNoX2V4dF9kZXNjICpkZXNjOw0KPiA+IC0JZG1hX2FkZHJfdCBkbWFf
YWRkcjsNCj4gPiArCXVuc2lnbmVkIGludCBpLCBucl9kZXNjOw0KPiA+ICsJdTggZGllX2R0Ow0K
PiA+ICsJdTE2IGxlbjsNCj4gPg0KPiA+IC0JaWYgKHJzd2l0Y2hfZ2V0X251bV9jdXJfcXVldWVz
KGdxKSA+PSBncS0+cmluZ19zaXplIC0gMSkgew0KPiA+ICsJbnJfZGVzYyA9IChza2ItPmxlbiAt
IDEpIC8gUlNXSVRDSF9ERVNDX0JVRl9TSVpFICsgMTsNCj4gPiArCWlmIChyc3dpdGNoX2dldF9u
dW1fY3VyX3F1ZXVlcyhncSkgPj0gZ3EtPnJpbmdfc2l6ZSAtIG5yX2Rlc2MpIHsNCj4gPiAgCQlu
ZXRpZl9zdG9wX3N1YnF1ZXVlKG5kZXYsIDApOw0KPiA+ICAJCXJldHVybiBORVRERVZfVFhfQlVT
WTsNCj4gPiAgCX0NCj4gPiBAQCAtMTY0NywxOSArMTY3NiwyNiBAQCBzdGF0aWMgbmV0ZGV2X3R4
X3QgcnN3aXRjaF9zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2
aWNlICpuZA0KPiA+ICAJaWYgKHNrYl9wdXRfcGFkdG8oc2tiLCBFVEhfWkxFTikpDQo+ID4gIAkJ
cmV0dXJuIHJldDsNCj4gPg0KPiA+IC0JZG1hX2FkZHIgPSBkbWFfbWFwX3NpbmdsZShuZGV2LT5k
ZXYucGFyZW50LCBza2ItPmRhdGEsIHNrYi0+bGVuLCBETUFfVE9fREVWSUNFKTsNCj4gPiArCWRt
YV9hZGRyX29yaWcgPSBkbWFfbWFwX3NpbmdsZShuZGV2LT5kZXYucGFyZW50LCBza2ItPmRhdGEs
IHNrYi0+bGVuLCBETUFfVE9fREVWSUNFKTsNCj4gPiAgCWlmIChkbWFfbWFwcGluZ19lcnJvcihu
ZGV2LT5kZXYucGFyZW50LCBkbWFfYWRkcikpDQo+IA0KPiAgICBOb3QgZG1hX2FkZHJfb3JpZz8g
ZG1hX2FkZHIgaXNuJ3QgZXZlbiBzZXQgYXQgdGhpcyBwb2ludCwgbm8/DQoNCk9vcHMuIFRoYW5r
IHlvdSBmb3IgeW91ciByZXZpZXchIFlvdSdyZSBjb3JyZWN0LiBJIGFsc28gcmVhbGl6ZWQgdGhl
IGVycm9yIHBhdGggd2FzIHdyb25nIGxpa2UgYmVsb3cuLi4NCj4gICAgICAgIGRtYV91bm1hcF9z
aW5nbGUobmRldi0+ZGV2LnBhcmVudCwgZG1hX2FkZHIsIHNrYi0+bGVuLCBETUFfVE9fREVWSUNF
KTsNCg0KSSdsbCBmaXggdGhlbSBvbiB2My4NCg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNo
aW1vZGENCg0KPiANCg0KPiBbLi4uXQ0KPiANCj4gTUJSLCBTZXJnZXkNCg==


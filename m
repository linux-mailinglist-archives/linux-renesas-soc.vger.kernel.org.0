Return-Path: <linux-renesas-soc+bounces-55-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEAA7F3A5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Nov 2023 00:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9468A28176F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 23:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DF255C2C;
	Tue, 21 Nov 2023 23:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jc1k7dUg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB1E199;
	Tue, 21 Nov 2023 15:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dy7Sdrz105asJP1Hhb1OD1lipjFLdmoRr2o5EUprXubpBuOy7dqWpyD0Q46CQRH9GUFXkC198itJFxdUJTmWO07cFi0UdMu2B9jUq2poXGHzNZirg9XYjkrEEWIYAAzVPIOpBbRuJDgJc7x4RFdoRIGtRd9axUGe1YFTqjViWvLeG3gKyrN7MIIvDle+1yxY64amSs0IcJJ6VABGmq7LHoBsK1wZGlqWxOdTJYA6dieOJH9ssNAVFqrH5uleiDAcflYO6sHDUBW3G9Brq9w6/i5I7JfHSF1eJDgjkgPpPwCYfhwEmtdXWeJ/jvtjraMcnddJKz0lqiYKY2VXZUyw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F79CDaerDUB38HYzeMcf/OhD7uHwhyqr49XYDHE+ZCU=;
 b=Armgr+x0oKEyZOXL3MoVpPKocyC40sOpt7PCSahfN/DdYkWDVfM52Ur3NzsbeLSQ+4UU4v54+EBpjhV53QxgiYSm+s1xCEVGwOTurFRDZ/5OgY3Scs7MtwfGgOidqUJQlIs2x2EKT16pA78EYNR8Yx+PdDco5C3GOxHtKdXlfbDIaSNBPYcN8iCLkP1nbEf35zVIaREJIzGtQoUwjTMaO9OI1mBABtNJTwFA2/KplS8+uIko9Oe95zKHJ7g1KX1MT46y0si9fvghFH1QH1lHPCTzVx06+qGyixu1kz4lMph+Gh5gkK1GgwRqO6hBMzi56nZJlMgmn6fvchcDdTlV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F79CDaerDUB38HYzeMcf/OhD7uHwhyqr49XYDHE+ZCU=;
 b=jc1k7dUg/q7jZmG4aAFPUQDheq46viOzignXtbvYTTW1nWW9VSMmLaCZzUnIWTKnWQBQzQksieWmjV08Pug0b/j3SE3bdq8N2WSyjr8fO99cQXkLviFu2zd4gFRNGUjoWromckg0Izp517MTQJ3Lz6cWjwq++Jj5Sq69VT44Lmc=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB10005.jpnprd01.prod.outlook.com
 (2603:1096:400:1e9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Tue, 21 Nov
 2023 23:41:31 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 23:41:31 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] net: rswitch: Fix error path in rswitch_start_xmit()
Thread-Topic: [PATCH net] net: rswitch: Fix error path in rswitch_start_xmit()
Thread-Index: AQHaHD8D24UP4q7Axkad7pG981SBarCEeISAgAD2gHA=
Date: Tue, 21 Nov 2023 23:41:31 +0000
Message-ID:
 <TYBPR01MB53413AB41FC4BBA5BFA5C325D8BBA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231121055255.3627949-1-yoshihiro.shimoda.uh@renesas.com>
 <7b8197aa-edb8-76ed-57be-6fd8ab247a9c@omp.ru>
In-Reply-To: <7b8197aa-edb8-76ed-57be-6fd8ab247a9c@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB10005:EE_
x-ms-office365-filtering-correlation-id: 249df637-de7a-4f64-9274-08dbeaeb63d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VD0wb1LUKgmUmL9ZH/q52nLbIuWYUrYv9ZuEScOsxS+bTf5UVfMwMb1/qY9byfd6ZF2ilhTp3I3lnApTkoHQNJi2lWwzB523LPfMPBAdBl13qWM4Ymo7JPUVYIXarkIO7Fktr2VGTYb8QIuTT4G0gYtBl6GxhhN98eJwmiEY1TQHPHQohLeWg5P9rzVfvqKm2wNGMd4gaerGemelYPbg5B7m5mDxsjNFOVCLnK6vrPJ8/HSAfHW+48AQ6oPQxrOTwEgMnNppQNmPIdsBsum0we+pk4pesf/huM8C5QVeKADpjS6nSvj1gGWIIwqzEVhvlczdywPPGw+63/W+PT19xGCM3LUkfr58L26KPjfqv4SPD9PL+9WN2FkHKZMyHqhKc/lO4IRrl5jI/GA6nTQZKA3xdWmbaP6HMRX7n+73tROgcCAggxgOOgFFj7TLusikbu7x6LVJZh21t7mdvqpsoHP6GBI8FGaxdhTrAM9NtSw6nq9s7hPFbMyyO8dsUmLT9yiHC4RStFGMNIgyqkGHr7DZYUBAymNEH1mGp2/skqVD8FbKlcxB5kNOunlpTvr+tKlQN2WgscUdkM0Hs6qu+s0KaGrobvcgCfqB6CX1/zBEJhjJ79cZgxL2+RmqZ+Ky
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(55016003)(41300700001)(5660300002)(2906002)(83380400001)(478600001)(8936002)(8676002)(52536014)(76116006)(38070700009)(316002)(66446008)(64756008)(54906003)(66946007)(66476007)(66556008)(4326008)(38100700002)(122000001)(33656002)(53546011)(110136005)(26005)(9686003)(86362001)(6506007)(7696005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2RoOVpWdjBMRUJML0NidG8za1R1d3VZR3ZmaEdMblJTYi9kMSthRWNrSGdj?=
 =?utf-8?B?YzUrMUZ6dFNjc0xJYURKbExETzJuYkhLL25BVW1BU2t1eXYyT01YRUxEYW5i?=
 =?utf-8?B?UEIyZE1UaG54M1U4Wm50MnNqNmowNjlVMzRtUFRnd0c1dUN0cEtkVjFUWXdo?=
 =?utf-8?B?Q0Yrd1NWSUdKRkFrSXhhMU9hMzFUaExSU3RNNlQ4RlBmUUFJNlVQazlQdVl2?=
 =?utf-8?B?em5VVTlPanM3VHFsSUY4VmptQ2RuNXdMbUd1SjFSSTI1MEZaajFKTmhGb3Y4?=
 =?utf-8?B?elhzdWIreHVveWRlRjRmcE5OZVRuMUtHenR3azdLUUszY0s4cVNzU2RCTjBQ?=
 =?utf-8?B?SmEyUnl4UWhRQ09zN3N1Y3BEUkw0bEpMcTlSdnhBTTNZNmpIRXFjMVpHVEVR?=
 =?utf-8?B?cndmajhCNnNrZTN0V3VhZUJxUzliWDZyNTNhaEpJL1haRVYxS3hoV1BCUC80?=
 =?utf-8?B?YWtITHZOdHNNbmtJMEg1QkdNNHlmK3N4T0xSdGhCZ2xzN0tYWmRvdHM5RFZW?=
 =?utf-8?B?SDN0M3phSTgxMDYxbzBxWWZnYllyRnZOdXZab05PS2lmdVJQK0FOUnpXQWUx?=
 =?utf-8?B?VjY5amVtdGFtUVlmU0VoK1hoWVc5MFdLZ25ibTJFRDFWR05SbXk0YXB1bmgr?=
 =?utf-8?B?NTVKaWRuOEJ1enVKOGtKS2R6SzlneE5JWHdpZFFTekpyTjFOOTIzTUVUbHda?=
 =?utf-8?B?TnB6Z1htOFk2U0xFeXVEVTF3VVlsNmlxaUJXZnFtdlJVNDBMQjJoZnVPVFNV?=
 =?utf-8?B?SWZjNzB6emowZGN4KzlJT0grUWNET29SejUvQUZUNnRML0kwcGZ0eWJiTjVY?=
 =?utf-8?B?VzN1RGkwUWl0T1BRL3o5dUNLR0gra0RvRUltV1NaZi9Cb3pEclhFZTZqS2sy?=
 =?utf-8?B?ZzdaU2JkNG5sK3ZrbWR4cFNBQWQrT1ExTElWc0EwK0F2UEE3RTV3dEErZXJT?=
 =?utf-8?B?MkZpMmg1dHZqUXVBd3ZlVy9KRTVHNWFIdnhpdGczaFNHRkxSUUdjTkZ0VXZs?=
 =?utf-8?B?azVkSDNMNFBWVjUwSm1IUEZzOGR2R1g0d3dGKzdkcTZjS2pubXo4MlBPWjZn?=
 =?utf-8?B?QnZyai83aWtUL1FDVUoxNDA1NG4rQlQ1cnNldWFkRHpqV3NtRHMvRUNwM01h?=
 =?utf-8?B?SktYZ1VLYVVyYTAyOXhIcUhWT292MVlNV3B5eUFLNXMwMHlValpnUTFodFFm?=
 =?utf-8?B?RDE2SzN6a0VVTmpKUGt3T2QyZEtyVjJRenhOa1BvK2FsS0E1UE1FQU41VG1t?=
 =?utf-8?B?VTdISnhBVk1HS2MvRWdNY2NoelZqNFZSYXBad200b2s0T3dhdm8wM21ST05E?=
 =?utf-8?B?cW1aYzVhWlFvbDdPQmxSb3V4VUpnMGZjcnFSYTNLdFJ5K1ZGWlFVQ01yeDh4?=
 =?utf-8?B?MUY3VjBTbEx4NkpLL2lzVTExTGZnYnJ2dWRzSmxXdmpQZU04cXZwSDdtOVhB?=
 =?utf-8?B?NmNwWGYvU1hqMFdEb0RqUElvT3NpN2hKRnJpdzE4aExEcEw3RXVSZWZaWEpS?=
 =?utf-8?B?cG5tb2gzUEMxbzI1RGxSYTE3Ymoyby92NnUwQjZRTXVROHlUVEFMNlU1SWJo?=
 =?utf-8?B?N1ZTd0tWYnZDRmYrNkEzeVRKWkZodDczWkxabi8yWDRwR1ZFSGc1THhRbkJS?=
 =?utf-8?B?U0hoQWRrRVpPbUUza3dINEZxb25nRE43dXJRQm90YkJPbXJrSmpBM1RoQjR6?=
 =?utf-8?B?QXRSYlVhZTFCZEtMaEgrL3lzbUUyTk9XbU1xMC9paG9BRWNGdmJ4UWtOQVBk?=
 =?utf-8?B?VnI4NVRER3hiTHF0eTBMZnZoLzM1SDJCeEN1bEUvUHo4YWVvQ1liWWo0TDJt?=
 =?utf-8?B?cWhHUGxudllDYlJuUjBOYndvdTgzY2IxYzRLTzEzazNBYkNCRVh3S2RkT0VR?=
 =?utf-8?B?QUF6cVpUYm9PcHpac2pqbW9iTXlGNHRHZmVpaUMzbWxkQ242eVRnQU9RN0ox?=
 =?utf-8?B?M0dTRTl3MTFKczBaVmNGV2ZuTDlNMWZyWXo5ZWgvQVRxS1poVm5PNjJLbWt6?=
 =?utf-8?B?dVhmcGw2V0N0aEhaRW9PTlF0czhLZGRYVFloYm1ZTGZtOFU0QTFmU3dsM213?=
 =?utf-8?B?UG80MFRKeENIUUlEbXJPbEJuNkduQ0FJaFJXdFBoNkphQnMxM3VETjJTNnk1?=
 =?utf-8?B?cHdpR3R4UUkzTzFNVStaUm0zbjBHK3ZaaytsdVIvZnRVZTdtVTBwUTRqZUhj?=
 =?utf-8?B?OXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 249df637-de7a-4f64-9274-08dbeaeb63d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 23:41:31.6242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DdZZ8Hq1vR58ccRrhZQQ+xjQ+yBwGwQ+eQmqKiwRgQihJTIajFRBVO2Z8ThxpxMDtXfmKBDY5PZYZfFoQFeVTH/Fgx+dyTehVWv0rauNpBh/7ECHyESuYnLekVIKMdes
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10005

SGVsbG8sDQoNCj4gRnJvbTogU2VyZ2V5IFNodHlseW92LCBTZW50OiBUdWVzZGF5LCBOb3ZlbWJl
ciAyMSwgMjAyMyA1OjU2IFBNDQo+IA0KPiBPbiAxMS8yMS8yMyA4OjUyIEFNLCBZb3NoaWhpcm8g
U2hpbW9kYSB3cm90ZToNCj4gDQo+ID4gVGhpcyAubmRvX3N0YXJ0X3htaXQoKSBmdW5jdGlvbiBz
aG91bGQgcmV0dXJuIG5ldGRldl90eF90IHZhbHVlLA0KPiA+IG5vdCAtRU5PTUVNLiBBbHNvLCBi
ZWZvcmUgcmV0dXJuaW5nIHRoZSBmdW5jdGlvbiwgZGV2X2tmcmVlX3NrYl9hbnkoKQ0KPiA+IHNo
b3VsZCBiZSBjYWxsZWQuIFNvLCBmaXggdGhlbS4NCj4gDQo+ICAgIFNvdW5kcyBsaWtlIDIgc2Vw
YXJhdGUgaXNzdWVzIC0tIGVhY2ggbmVlZGluZyBhIHBhdGNoIG9mIGl0cyBvd24uLi4NCg0KVGhh
bmsgeW91IGZvciB5b3VyIHJldmlldyEgSSBnb3QgaXQuDQoNCj4gPiBGaXhlczogMzNmNWQ3MzNi
NTg5ICgibmV0OiByZW5lc2FzOiByc3dpdGNoOiBJbXByb3ZlIFRYIHRpbWVzdGFtcCBhY2N1cmFj
eSIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGlt
b2RhLnVoQHJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9y
ZW5lc2FzL3Jzd2l0Y2guYyB8IDMgKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2guYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMv
cnN3aXRjaC5jDQo+ID4gaW5kZXggNDNhNzc5NWQ2NTkxLi5mYzlkY2Y1ZmExNjYgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoLmMNCj4gPiArKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2guYw0KPiA+IEBAIC0xNTM1LDcg
KzE1MzUsOCBAQCBzdGF0aWMgbmV0ZGV2X3R4X3QgcnN3aXRjaF9zdGFydF94bWl0KHN0cnVjdCBz
a19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZA0KPiA+ICAJCXRzX2luZm8gPSBremFs
bG9jKHNpemVvZigqdHNfaW5mbyksIEdGUF9BVE9NSUMpOw0KPiA+ICAJCWlmICghdHNfaW5mbykg
ew0KPiA+ICAJCQlkbWFfdW5tYXBfc2luZ2xlKG5kZXYtPmRldi5wYXJlbnQsIGRtYV9hZGRyLCBz
a2ItPmxlbiwgRE1BX1RPX0RFVklDRSk7DQo+ID4gLQkJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsJ
CQlkZXZfa2ZyZWVfc2tiX2FueShza2IpOw0KPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiANCj4gICAg
TG9va3MgbGlrZSB3ZSBoYXZlIHRoZSBzYW1lIGVycm9yIHBhdGggYXMgd2hlbiBkbWFfbWFwcGlu
Z19lcnJvcigpDQo+IHJldHVybnMgZXJyb3IuIFNob3VsZG4ndCB3ZSB1c2UgKmdvdG8qPyBBbHRo
b3VnaCBwcm9iYWJseSBjYW4gYmUgZG9uZQ0KPiBsYXRlciwgYXMgYSBjbGVhbnVwLi4uDQoNClRo
YW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uLiBQZXJoYXBzLCB1c2luZyBnb3RvIGlzIGJldHRl
ci4gSSdsbCBtYWtlIGEgc3VjaCBhIHBhdGNoIG9uIHYyLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3No
aWhpcm8gU2hpbW9kYQ0KDQo+IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdleQ0K


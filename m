Return-Path: <linux-renesas-soc+bounces-303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8677FAEC6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 00:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BED1DB21134
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 23:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619CF49F87;
	Mon, 27 Nov 2023 23:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MtWcffnz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CC7101;
	Mon, 27 Nov 2023 15:58:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dA1mMxXjj6QXBVdDwzcGs0/qkXQxRr1ScVTF0nkWk9PMeMVygudCxck4aGji5bv98RjO//K4NKR3VDizRix2SAh3jTjDXr1m1NQwAxXxJPlXmTzy3UONaJ1NEYByMaDzA/bNY6iOjIcJpJpT3r71qJkU+usgXPQDI435ZcrTJe1Kq68wlGACJYCldg+9ZVapEt9FYuNK7VFLIp0wO9ofbj7F36WOIZE063tzPsHoX1EW7HVVymZaQ2OoYlqUQ2bhzt3TSCkD9u7vJ8ghKyn0lci7EYa1MNZMKmIYFId/4r0lVtgmvVOS2PcPoSC3yhaRpuQmcfZfZvC0RNMU4+4K6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w0KhZ/Q8G9+CpxipAVAHIu1FhjazoDy0G1dN9wDg+8=;
 b=M+5RZGSlvaFQr9f+31xiwq3G5Bk2vq5iPsciewjSd171DVlAuWOsils6wlAV5VqYTSy5j9R46rCozuT2vlKR4T9FvWmjduIDS8RUkxQT3C7ih7t1VIZi4X5o6yHeHt4rTLvuDiK5bbrQ8uiDEAFFFXU5HaWJ7U8KmVLpI+XUs0NG1k8j8yWfxWJtzsVdgmb7uXuyn64jiOmix1c3jd46EUtiFCHyfPdOsNSb6l4vnnAAP1qTyQAizqZHTwaPbQRiy0ahFRKRKpgN87eh/n+7G+ovHeiRH4JAw0Qt8eu8qd0Gf4xSTBEMRova3K7w81NbpXAnKAAAUelTPx5ugzclSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w0KhZ/Q8G9+CpxipAVAHIu1FhjazoDy0G1dN9wDg+8=;
 b=MtWcffnzZRW/2deJuM2jwvSH4e3n1we/T7F1Fb+1DAuvYQkb1oV2dlflY1tq3tKPwWZpEmYo7bdlh7ovnQwuHc/W/04SUGFGe2CwO42ycd2r4DJh32vzSY8gogiOXuw7pq8Q/ao+iQl7Rcj9UHqzOYeghLWVZ8QyuCj6XRNYljk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB5877.jpnprd01.prod.outlook.com
 (2603:1096:604:c0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 23:58:23 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 23:58:23 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v4] ravb: Fix races between ravb_tx_timeout_work() and
 net related ops
Thread-Topic: [PATCH net v4] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Thread-Index: AQHaISyornJvQCtBMUOACJkWJQfeX7COWuiAgAB879A=
Date: Mon, 27 Nov 2023 23:58:23 +0000
Message-ID:
 <TYBPR01MB534197A465FC1C229E3B7DFBD8BDA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231127122420.3706751-1-yoshihiro.shimoda.uh@renesas.com>
 <995c2598-294e-3d80-05a8-b79e668fb2de@omp.ru>
In-Reply-To: <995c2598-294e-3d80-05a8-b79e668fb2de@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB5877:EE_
x-ms-office365-filtering-correlation-id: 3ad42793-fc8e-44c0-75f9-08dbefa4bd3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GSZ6Yf3mPsdrxMtJ1uxkgJnleBofI5y1ch34wr85eQrs3YrrsZcZ9nCwvch0qjgmDZIio7GfqOtUwoYYwy6LerXmMZeJ9sBgicv9mSiu/26z2I87MkEeqIKjhPY23AtN7EkliiL+/76XaheKHWdbLeiEW/mJjIpX+LkimjdgxXPtPD+uBqxllRnuH/FDqDyi2M24VLfGCg3iiCQPw5idqJVJK0S7PMM70rIsXjGvH5TBhFuSUKzc9pqbDMRSe1yfdo2L21tE3ZAXjr3YPJtvPdoD17HMSRWhpdKCif/f5EphQgTdw+Ca/iIwupnLASoz5XMcnO4OWDw0p51f3AK5ZYGw3oYAsr14rbWBEkc4kFVUOQccmNUg5tSAW7ofvvD3TzCF2Xh7xlcdstBAp1GdPvDXyoP0zczmDgWloe5Y10yLOuw24LNET96vlgL0gWwuEEGO8vQI9HpWlhOFa3CbQ2hxP8V2S8XfQ/BZiQbC5dUxpa4Bho8vga++14QekghJOlLi2wiO/FTMyBSNtcotFPzcIiK1vLhZ+9hABWf66/vc/gQIDvFZ3aaq015bZ141L2LSbemcUo4dqmwidK5Z6hmhsFCrmoxwzem1nWNK60Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(55016003)(478600001)(53546011)(71200400001)(6506007)(7696005)(9686003)(122000001)(38100700002)(38070700009)(86362001)(33656002)(2906002)(41300700001)(4326008)(83380400001)(5660300002)(110136005)(76116006)(966005)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(52536014)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVY2RDcwVy9OazZlQ3U5UEpjdVVQSGU5bUMzU0RvZUloWUx0UzNLaEZEaXZB?=
 =?utf-8?B?SE9XR3dLQlJxM0gwcHFsbFNVRXR1VmtieUx3eE53bm1wNFF5Y2UycGFidFBU?=
 =?utf-8?B?YXQ4ZjhPL2ptWDhRK2FYalR1UVZQNllLNjAzSmZkSHlDalZFWU1nOFlzRWZq?=
 =?utf-8?B?R09xWERCbkV3MTlZbHdsSDdTRGdiTEp5OUpEVE0rejlySkxIMGRBNjVvZmZh?=
 =?utf-8?B?Y21CdGtoVmtYa3lvRytnRzdJS0ltSGF1d0YxYzFLTWIrSUN6OFpWU3ZZWHNm?=
 =?utf-8?B?VnZ0dWIyTzRMOXJvK2kwUnkyK1dzVFBES0xyc0hDR0p4NjcveVFYQlNueE1G?=
 =?utf-8?B?YlJEYVdHdmx2a0JzQk5qRHAySHR5SFNWcWhtZzZoYnQvKzdFM3NXR1BsekNn?=
 =?utf-8?B?c2ZTSU1sMjZOQ2xGNTZBOTcwc3BoNTR3TzlNYWdNY1B3Q2I1L2YvRk1rZlBS?=
 =?utf-8?B?NG9DZHBWVlM4K1h3dE5tdDRzMVdncHBWb2ZwaENRQmlIREh2amFzajhLRVA3?=
 =?utf-8?B?MGZmNFJ2QjNRUVBmYS9CSHgzYTJ3ZnI1cU9CanhXc2UrYk1qZ29RQ2c0d05U?=
 =?utf-8?B?QlVEcTlHejVTY2xhSlU1WEFudVNGU0Z1SzhONENheTZEdnNJcEFmaW9FRDlQ?=
 =?utf-8?B?U3dEWXNjem9zSWNtVmwzV0o1aDlkN3A5Y0IzWFY3VmdET3AwQ3QwK1FrclRm?=
 =?utf-8?B?RVhUYUVHWngxVlFlUG1vNFh6VDFvaW50ZmI1ZEpwVjdBQ3k4NWs0RnEzQWxs?=
 =?utf-8?B?emt1N2VHSzh0WmNZTFhScGYvZG90eDUzYVNhaGdCZjlBR2NiNTV5STZ2T3Fj?=
 =?utf-8?B?c0F3VUQyVmxlZk1aVnhZZkZUOE5Kc2JNditYekJLSld5d2M5TUQyMHV3OW1I?=
 =?utf-8?B?UC93N2k4QnhPbnBwY3l3ZU5CZEQ1NmRRWC92TkxLTGgxN2RPRGI3bG80YTJR?=
 =?utf-8?B?bGE5bXEvYmsrZm80SmRuVi9vZ1o3d1FaNmdrNnl3ZjFxdTA0WXpmMmlUdHhE?=
 =?utf-8?B?dkQ3ejJoUlEzUElqaXZDY0RXcGp0ZlAwWXBvdWRHOFdFZzFMS0FDQlJ2MDdu?=
 =?utf-8?B?YU45V3E5S1k1N0hZeHZ1dEtSTTJjeXRXT01QRmVkOStwWEdiWFJjOEZHaDFI?=
 =?utf-8?B?MnkxbUM0aHp3QUJrMkdmNGNJMWhKS1pXOWxVWmlGL2JXeElOSVI2L1hFdkZ5?=
 =?utf-8?B?ZTFJbVZ2QncwL2VFUmxTSU5EeXE2V2RxRUE3bTdSTStDMmh1UjVYc0kwWTFB?=
 =?utf-8?B?Z1hFZ3c5VU5aWmtIU3NCWlV5R2VxTFJpQ0x2N3BNMEJxSXAxT3RiRW1lMTl5?=
 =?utf-8?B?d0E3Y01nUlIrSFFiYVlGU1lqd0x1dzZReWhSRExjWkpvS3JsWEJzeWFDTGNw?=
 =?utf-8?B?akpyWnFCemsxR2pCNUErNEdCQktGRk1aZ2FaMkUyQnNXTmdldTkvejUrV0Jv?=
 =?utf-8?B?bTNSc2Q1YnhiLzEvT3FVMW54UlpKenFzei9ncHFHUllURCtxRytwR2RCcitR?=
 =?utf-8?B?V0F6Z2xyL1dxWElDQVZoQ2k3RXg2WXMyUjNHTDN2WkFqWldma212ZGV2SlBN?=
 =?utf-8?B?YitRa0tYbzEvbEN3SVN5MEd6OXZKZlgwYW9oOW1iZkxIYldCWThWMTZ6N2xs?=
 =?utf-8?B?VEcrYmJ5clF4KzhNVnpWZmh4UmhTZEUzaEswS0xUa0VLUW1oYmhpNHZjdk0w?=
 =?utf-8?B?alhZazZUU1VhdjFKUW5CdWxvcFJjWlBlQk1yb0tZQncvdCtNVXFBampyQ2Iy?=
 =?utf-8?B?U1o5azl6MGdab2JHZDhLU1AvTG0rYklRQnM5QlV0L0tmT3h2TXl1ZVNoN0dS?=
 =?utf-8?B?RkhyUklsSXk5SUJiSWJRci9nYktOQ01jN0lXS3Y2aEY5NG5MWGsxWWY0bEI3?=
 =?utf-8?B?d09nL25BWnc5UlMrYlB3Z1BaM1ZtQmRNWjhVbjgrWGFQb3grWXQ1dlFXYktk?=
 =?utf-8?B?Z0ZrczZpMVRZdndVaGV5VmdHcXFIdVM0MmkwdXpRd0tUemVNRlZlWjBKTjlH?=
 =?utf-8?B?UDA0MnpFbEFLMTl5cHlYbGhjbnEweFFWcXkwbnA5UTA1MU5hQnAxT1NCQWox?=
 =?utf-8?B?RnlUbXVQVDZEU255WFdhT2htNnpiOWpxTlc1ZmZaU3BZQ0ZoandiUWNhVEZ6?=
 =?utf-8?B?bmVDaUtFSE52VTJZcUtzcXFLa2ZZUWV1SEpaYWNkNHIxTUpucXlTdS9sOXFv?=
 =?utf-8?B?ZCs5Nm5uQW9IS04yRGpLdzJWV28xclFFN2ZGbjNQMm02dHFFNDAxWU5wVmhV?=
 =?utf-8?B?TEJ4RXY5VE8zeVBnVTNqRUpDeFV3PT0=?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad42793-fc8e-44c0-75f9-08dbefa4bd3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 23:58:23.1363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cUH4tXV54545zQ4Ibn8BwZ9aLlbXRlPH0MkVliXasHVLR5QJp0GJx330k/nBxGf7nT+96V98NUU2yL2Mtfh7QOzaz8fQdVZ5Y/PmCbmom9WyTXJVeyIWiq9BSlB4aNG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5877

SGkgU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogVHVlc2RheSwgTm92
ZW1iZXIgMjgsIDIwMjMgMToyOCBBTQ0KPiANCj4gT24gMTEvMjcvMjMgMzoyNCBQTSwgWW9zaGlo
aXJvIFNoaW1vZGEgd3JvdGU6DQo+IA0KPiA+IEZpeCByYWNlcyBiZXR3ZWVuIHJhdmJfdHhfdGlt
ZW91dF93b3JrKCkgYW5kIGZ1bmN0aW9ucyBvZiBuZXRfZGV2aWNlX29wcw0KPiA+IGFuZCBldGh0
b29sX29wcyBieSB1c2luZyBydG5sX3RyeWxvY2soKSBhbmQgcnRubF91bmxvY2soKS4gTm90ZSB0
aGF0DQo+ID4gc2luY2UgcmF2Yl9jbG9zZSgpIGlzIHVuZGVyIHRoZSBydG5sIGxvY2sgYW5kIGNh
bGxzIGNhbmNlbF93b3JrX3N5bmMoKSwNCj4gPiByYXZiX3R4X3RpbWVvdXRfd29yaygpIHNob3Vs
ZCBjYWxscyBydG5sX3RyeWxvY2soKS4gT3RoZXJ3aXNlLCBhIGRlYWRsb2NrDQo+ID4gbWF5IGhh
cHBlbiBpbiByYXZiX3R4X3RpbWVvdXRfd29yaygpIGxpa2UgYmVsb3c6DQo+ID4NCj4gPiBDUFUw
CQkJQ1BVMQ0KPiA+IAkJCXJhdmJfdHhfdGltZW91dCgpDQo+ID4gCQkJc2NoZWR1bGVfd29yaygp
DQo+ID4gLi4uDQo+ID4gX19kZXZfY2xvc2VfbWFueSgpDQo+ID4gLy8gVW5kZXIgcnRubCBsb2Nr
DQo+ID4gcmF2Yl9jbG9zZSgpDQo+ID4gY2FuY2VsX3dvcmtfc3luYygpDQo+ID4gLy8gV2FpdGlu
Zw0KPiA+IAkJCXJhdmJfdHhfdGltZW91dF93b3JrKCkNCj4gPiAJCQlydG5sX2xvY2soKQ0KPiA+
IAkJCS8vIFRoaXMgaXMgcG9zc2libGUgdG8gY2F1c2UgYSBkZWFkbG9jaw0KPiA+DQo+ID4gSWYg
cnRubF90cnlsb2NrKCkgZmFpbHMsIHJlc2NoZWR1bGluZyB0aGUgd29yayB3aXRoIHNsZWVwIGZv
ciAxIG1zZWMuDQo+ID4NCj4gPiBGaXhlczogYzE1NjYzM2YxMzUzICgiUmVuZXNhcyBFdGhlcm5l
dCBBVkIgZHJpdmVyIHByb3BlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1v
ZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6
IFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAucnU+DQoNClRoYW5rIHlvdSB2ZXJ5IG11
Y2ggZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IFsuLi5dDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+IGluZGV4IGM3MGNmZjgwY2M5OS4uN2MwMDdlY2Qz
ZmY2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9t
YWluLmMNCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5j
DQo+ID4gQEAgLTE4NzQsNiArMTg3NCwxMiBAQCBzdGF0aWMgdm9pZCByYXZiX3R4X3RpbWVvdXRf
d29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gIAlzdHJ1Y3QgbmV0X2RldmljZSAq
bmRldiA9IHByaXYtPm5kZXY7DQo+ID4gIAlpbnQgZXJyb3I7DQo+ID4NCj4gPiArCWlmICghcnRu
bF90cnlsb2NrKCkpIHsNCj4gPiArCQl1c2xlZXBfcmFuZ2UoMTAwMCwgMjAwMCk7DQo+IA0KPiAg
ICBXaHkgbm90IG1zbGVlcCgxKSB0aG91Z2g/DQoNCkl0J3MgZm9yIHRoZSBmb2xsb3dpbmcgZ3Vp
ZGVsaW5lOg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi90aW1lcnMvdGltZXJzLWhvd3Rv
LnJzdD9oPXY2LjctcmMzDQotLS0tLQ0KCVNMRUVQSU5HIEZPUiB+VVNFQ1MgT1IgU01BTEwgTVNF
Q1MgKCAxMHVzIC0gMjBtcyk6DQoJCSogVXNlIHVzbGVlcF9yYW5nZQ0KLS0tLS0NCg0KQmVzdCBy
ZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiA+ICsJCXNjaGVkdWxlX3dvcmsoJnByaXYt
PndvcmspOw0KPiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArDQo+ID4gIAluZXRpZl90eF9z
dG9wX2FsbF9xdWV1ZXMobmRldik7DQo+ID4NCj4gPiAgCS8qIFN0b3AgUFRQIENsb2NrIGRyaXZl
ciAqLw0KPiBbLi4uXQ0KPiANCj4gTUJSLCBTZXJnZXkNCg==


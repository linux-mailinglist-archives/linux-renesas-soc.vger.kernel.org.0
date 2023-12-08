Return-Path: <linux-renesas-soc+bounces-841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1067E809ABC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 04:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A86B32820D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Dec 2023 03:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2204A24;
	Fri,  8 Dec 2023 03:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m9Ny1yQq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2127.outbound.protection.outlook.com [40.107.114.127])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8081708;
	Thu,  7 Dec 2023 19:59:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME1gzUnTzNKMHmtp4uzP6TjZB3ZVeOAt83JYa2Yv8anMe6hnIqZXXaojfs48SmEsRIiN/UhRFqowi0QIrsRq4LR8hkGttlUXRGjWoFdMq9mj6NySmED95R3rFyG6KXo8/94tUnZNo5rqFEhPSq87BSzBnwzyLvG68Im9GcLmsigwggJeo+IXhWvmyQi/14eqCOb501ta9lJWxH5p/jWHPyYoXiabp/wn7n68eMj78yi8jxK8gjcCHOzFl3WllBrxEz4dNhuStMg7g5WXHFCi1PuyQCQ4JyxCphsinDuVzudeqphISdHpIsgqKZc2/T7Kmnx1M3mHo9qxXZoypYbIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Li3A+QdUbz1uZ8UG6uhvHf9q1CCbVHeMUZkML8Q8b+M=;
 b=Yerbu7UiJHq78PIWMAXU5P6p5Fe1G78JvujvEINXsQ211HyC9MKRORotkSIQiHGX3Xq+s2a5ZPb3oG+ZZ6LfLHhZ2Y0g13Fw2h9GIHwEcinUSu4u7ZwP4rLovHR0TgMjVZP0jHhOJAJz63zHcoSlj5PvvVfnSdepvDgOJcKJXt5JRFCL/wjqrcj3+8mFmqLp+VKINaXdHmKQej2lTTTCq6bAxe1cI0ncvSgOfKcbBizlHeEfOvaWuQQiM5fALHqtdK6FOx47TmleVPtFtO/x2VWojPtli1YUN9YAgK/GGEgamLfLYB2F1CE6zc1DQghrhhgdDY+GBDmdD9sHjRBlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Li3A+QdUbz1uZ8UG6uhvHf9q1CCbVHeMUZkML8Q8b+M=;
 b=m9Ny1yQqXuydg5XkUbOtzemWq1OZVxGBCa8Vmt/+0YNsa6DGG0QwdrzAJ7Sb+sSSLo8KcDGSyb/uXB4pXiewX2XjwbBtgD3+NS//Bw/UoONTN/6KTl5v6uaXvuic9tne2hMpunPdNRATvZnv0nCVdICCKnmG0m4sOqz7dfEeoHE=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY1PR01MB10674.jpnprd01.prod.outlook.com
 (2603:1096:400:326::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 03:59:05 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7091.017; Fri, 8 Dec 2023
 03:59:05 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next v4 2/9] net: rswitch: Use unsigned int for desc
 related array index
Thread-Topic: [PATCH net-next v4 2/9] net: rswitch: Use unsigned int for desc
 related array index
Thread-Index: AQHaKOUwSWv68TUbckauCdV/UOADLLCdiE+AgAE7cPA=
Date: Fri, 8 Dec 2023 03:59:05 +0000
Message-ID:
 <TYBPR01MB53417ABE347331BD50264658D88AA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231207081246.1557582-1-yoshihiro.shimoda.uh@renesas.com>
 <20231207081246.1557582-3-yoshihiro.shimoda.uh@renesas.com>
 <2e711f3a-3b0d-c88a-5ee0-16dd398b4d0e@omp.ru>
In-Reply-To: <2e711f3a-3b0d-c88a-5ee0-16dd398b4d0e@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY1PR01MB10674:EE_
x-ms-office365-filtering-correlation-id: 237f0ed9-ed9e-4329-1cab-08dbf7a20584
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GuAh4ihRE1v1sP71i9fT874lu5nDV3BM4fgt7V3EoDD+C/46cPvKRNb319luEQGdcC2h03sqcaMuekwKfZtEDTJxsRxeCZQ5zi2GhjKVpM+4dqj9WvJyCbNrtO9iKldkoO2Wf9toZQUVNV2C1k8aZ2+yYcaUkPK5MyMR9ihGEXe88VQtNmrNLRXk5EvukfgZ0nhkfJ967HfsscTJ4jqs9CH0/CL3lgCzE/W4uNLP504w4+zW6BLkhZgc004TQ3enIVywLS3P1oUJYcyEWEP3G01r4GOPVW6lPGGCLlhO9BQI3J2VB9uWo+vhP71ZfoqRTsGQP4ugQOHhskZ5VhHKCS35mqq8UpQOKlqET4qgQdLFQBVbLxY3MR9YCB1OMWSkVgWSrT5PBvvhdDjy2MRLeWmrfRl8OoQ0vnZJfcGMqpqfBU9QvZezsdpomSofTQxtyHpiNP9O+HdtK3MpCRNYFLznIr3Ns2juuPqwvP4xlJIYycTZppEKnIdXAH0h84GNdBiu3YepaxI+qUTo326ABXiJnXy9SIZP7kTf4QciJkMELopFAz+ekLklnBQpvLcQHZcKyGB9cIZQBbuz6WXvK37iPI3PT1jVnzknRmhDjFC5sjlYh45Tp3dWUfhZHr0o
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(7696005)(53546011)(26005)(9686003)(83380400001)(8676002)(55016003)(8936002)(76116006)(4326008)(71200400001)(110136005)(54906003)(316002)(64756008)(52536014)(66556008)(66446008)(66476007)(66946007)(478600001)(122000001)(38100700002)(86362001)(6506007)(41300700001)(33656002)(5660300002)(38070700009)(4744005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUZES1NkNTR6U1Nod2prVVlnRFVIaFFmM3VLKzVtN1pjM0ZhTkhOdndOdzNS?=
 =?utf-8?B?V0RKa29EcStpVUdFRnJlNy9JSGN2TTRvcG9uNGk1K1lxOU5lOFk1aVltYVgx?=
 =?utf-8?B?bi8vdjFkek5wWEdUeVArU2RHUVk1WDUrUFVRb3ZDb0gra3had0l2QkI2MUsv?=
 =?utf-8?B?aXhCU0t6OG5NMnlKVnNkUUxxTVNtbVE5NFAvazdUS25KckhYSmx4bDZrR1l5?=
 =?utf-8?B?dFZUbnFObVBUaGZjS1pPdkgvVlk1K1dwOXVrMjNodHRIaDR1SGRHdkw4R2Fi?=
 =?utf-8?B?cEtKZnRET0swNUVWT3ltNHh0OHQ2bnFBbFFzSUFKUzRpeWEydTB6ZXNmeGkz?=
 =?utf-8?B?SFo2Mys2bEtoWm5yTE1idG9PVzNUeHl6K2g3YWJKSzlCT3cvcTZJa2IrVVo1?=
 =?utf-8?B?bmdHMStJc1BuMTVJYU4xRGNLdy95Vmp6WHIvd210WGpkRjdGbUxXY2hVdVc2?=
 =?utf-8?B?bUU5d0FsZndPakoxdmlwKzM0TjBXOFE0WWFHSksrWEVGV2ZlNUlud0VmUHBr?=
 =?utf-8?B?V0dSbEYrT3BMdGk0V1NMay9iZXlsOTVxSDhNbjlGSXc1OHhWYXRpNjB4L1Nz?=
 =?utf-8?B?UmpkOGRlS3pwSHl3L3VlZytUSkI0dVlRM3lWQyswb0tVZTFtMzlDamZTNGZv?=
 =?utf-8?B?NHNvbmhDK2F0dTM1bk1vWk9sWW00dmxSQkYzSG9NNXE5V1VuNS8yM3hFZ05W?=
 =?utf-8?B?MElyTTNaVFdqMG5wT2RqSDR1VDBtbVZ0TkpxM29MZXYycDdYaVRWdjI2RzJN?=
 =?utf-8?B?RGpPZXdtWm9VeWV0RmpBK2pwRHVYdUdJSGs3ZHVzQ0NxN3NRcDR5dGwzVitu?=
 =?utf-8?B?MW0wV0RtbVowdG9tUUZ6QWxIdHRZbm5BaUY0OGt3OGdMSEFodjgrclI0Qm1r?=
 =?utf-8?B?WG5qUGl0K3RsZ1ZNVlFUVUp6Zll5SlJoUlU2YkVNUlE3YzJwNWZUVkl1emkx?=
 =?utf-8?B?WWZjOThyZGNETkIyVWZLNlFjdDdhMjE2bkdxNzNoOWpEczB6QkFySGE5VEJr?=
 =?utf-8?B?Y3p1SDBLQ3kydUR3MEVHbzA0a0JTVVlnMXdhRGZJSC9maFBuL0VzblNiSkxE?=
 =?utf-8?B?QUZxZVFaeWZBVXpvcjdFN2RVcWQxRVdTVmx2TDh0R2NFckQwZDFqckY1dXJ3?=
 =?utf-8?B?Z1A0TmhNUnZZYmJIZ1ZGeEsyVFRXd0tvOU5kdHJlKy9tQUdEL2FCNFErM3Rm?=
 =?utf-8?B?cW5yL0pHbzQ1V3NuVnZoNTJmVlJEOEk2eEpBUXBwMHB6Nmg2WXJ3TE50YTZS?=
 =?utf-8?B?VHF1SlVheGlkZ0hIOGxGemRNTkJQcVd5Y2YyR0hUcUhTcUQ2aXYxamFUeWRS?=
 =?utf-8?B?M1ZHakpiZG91dkJ0WmgvYm9RdGZZelFJOWF2Ung2VkxteDZnRW55eUs3d2py?=
 =?utf-8?B?b3VnQWhSdC94WWlxcnpPMXpsNkxLTVZaODhMU3paVXdEb0VMTVhFOU1PVkNl?=
 =?utf-8?B?YlVOaFdGZGVDeHdmTWRETDVCQlZZSFdzYmpwSSsybFIrdnBoY1pJUk05eHJ6?=
 =?utf-8?B?enM1dXBxamg0ZjdwYkVmR3lvYkxrNFZJNTUrNUkvNzlKOUNiR2pCbDUreDY3?=
 =?utf-8?B?QjQ0SWhoKzZ1MzV4U3hvQmI3bzZyVXlIeWhLWXByeUl0UzUwQXVWNnMrUENO?=
 =?utf-8?B?Z3BlNWNiQUhUVUI2bmxzWmozL2hoQ3YyMkE5c3V1SE5IaHh1TEhIa1ptR2NZ?=
 =?utf-8?B?OVlkbE9kbkJiTTlpOUhTT0dTS3JXaitjZzMxOGNxbUExMUMrUTdhelhMRzdS?=
 =?utf-8?B?OWI5SmNiNi9kVDhoMjBSK01nc25mQTFqWjd1QnhRTjU0S0dhMzVUdjQrcmRC?=
 =?utf-8?B?S1dzekJpZnZYckY0YlpMMThxcDRGRVRLVlRla29nWFVCYmFCT1VLTFo2K0hs?=
 =?utf-8?B?T28wZEYzWStWY0JQbzR1NWVESitaWE00UFJYQlZqNmtxM1FkdDJibTJia0tP?=
 =?utf-8?B?a2NDWGVqb1JxTGNlazJ4T1pkSHJXU0xlZVVUZWE3S1VjaHE3QzhKK3NSMC9K?=
 =?utf-8?B?SHE2Y2h5alJVK1NLN2gwWGVoTWNQUXNoVko4bGJkYXlqTmhTLzZsbjJrTUpO?=
 =?utf-8?B?U09XUHNFK3lLNW10eEpHcEFralhwL0U0c09DU1JUdDdoVlJCcFRqRmZ5d093?=
 =?utf-8?B?aTNDUE11Qlk5REpuOU1jRjlMeUw3bjJQRGhXakdURGtqSkwzZ2NzZUxEQ2c5?=
 =?utf-8?B?WHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 237f0ed9-ed9e-4329-1cab-08dbf7a20584
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 03:59:05.1754
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCHOCAicRsKlWTVZETgr6s3VaRap82eLmOKFYRuSEnckzRJVuB3xHjcV5rjdTJgIm72iA7GMcY4/QejIgXniPnaPGTlj+QmiMWL69g69wimlR0+D7hj6k1XX4ybcdw83
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10674

SGVsbG8gU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogVGh1cnNkYXks
IERlY2VtYmVyIDcsIDIwMjMgNjowOSBQTQ0KPiANCj4gT24gMTIvNy8yMyAxMToxMiBBTSwgWW9z
aGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+IA0KPiA+IEFycmF5IGluZGV4IHNob3VsZCBub3QgYmUg
bmVnYXRpdmUsIHNvIHVzZSB1bnNpZ25lZCBpbnQgZm9yDQo+ID4gZGVzY3JpcHRvcnMgcmVsYXRl
ZCBhcnJheSBpbmRleC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2Rh
IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9NYWtlZmlsZSAgfCAgMSAtDQo+ID4gIGRyaXZlcnMvbmV0
L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaC5jIHwgODggKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0NCj4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yc3dpdGNoLmggfCAxNCArKy0t
DQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9NYWtl
ZmlsZSBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvTWFrZWZpbGUNCj4gPiBpbmRleCA5
MDcwYWNmZDZhYWYuLmY5Y2ZkOTc1MGMxYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9yZW5lc2FzL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
cmVuZXNhcy9NYWtlZmlsZQ0KPiA+IEBAIC0yLDcgKzIsNiBAQA0KPiA+ICAjDQo+ID4gICMgTWFr
ZWZpbGUgZm9yIHRoZSBSZW5lc2FzIG5ldHdvcmsgZGV2aWNlIGRyaXZlcnMNCj4gPiAgIw0KPiA+
IC0NCj4gDQo+ICAgIFVucmVsYXRlZCB3aGl0ZXNwYWNlIGNoYW5nZS4gOi0vDQoNCk9vcHMuIEkn
bGwgZHJvcCB0aGlzIG9uIHY1Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0K
DQo+ID4gIG9iai0kKENPTkZJR19TSF9FVEgpICs9IHNoX2V0aC5vDQo+IFsuLi5dDQo+IA0KPiBN
QlIsIFNlcmdleQ0K


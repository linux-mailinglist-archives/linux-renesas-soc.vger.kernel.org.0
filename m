Return-Path: <linux-renesas-soc+bounces-338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E147FB8C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 12:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FCE0B21CAA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88B64A9BE;
	Tue, 28 Nov 2023 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H4AMZkAC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7AD171D;
	Tue, 28 Nov 2023 03:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwvyDqz1mvdVrM/WJxMPz3hYRTI/BrSYIctxwqj1aOTZz9Kls5vihsApbh3K4VabdT2ixwa5ewlN63moZd4X2IpufCfFAM35h1f3xoU6yGKZXCcDjprT0iX0WLJlxqc5exltJI7e82hqr7v/y0fwnce5SA3SqxelOzkCZefUIsaem1BugvtLJXGjY3tzPHOigKxeQ7XDFyHUnA47PmnQhL2KCuEnyKQT3xXz96wH9b/F3QP6grZdTDqUSnVfJE0SdH0IsHAEsPWjAA1bLDOw4NsY2f7pmFuHdJX0ih58NEitN94cpycQFwkpzQOgvUrWkX2Vnryb0t96M2+ujHgHhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lg9jjY3v6dvR6sWftrAQXpquTU4C+EwL1IjfV4jtBw=;
 b=W9+mR+ywhkJooY3q201oTAMZ5k4nkvbUNz6nM/HNPh5+2Ls0OL3kBa+6BklP+cY2OjsGEr3lLaKhtNUUq507tVP51GdfJgX0hl5Ax+u8U5/96UV7ruZTQv9QtOdKtl3rDhkX6Sa4MI3U6o52aaawyo8IjN5aP9+KFBUC2gcpszCFLgGOaQn74pEFBe3rRBrgCijyiB9cbOTfVDxdLYxwhAYjKsMj/uVWU0Pn+lQzl32hpb6ShbCJf90MieRom5jxwxzIYiPOwIpNAYYd0J53nn0Nne3Bn4p4J+WzgeQKHKcdgGGFBLrm0mFaz32hFA++LrngnzfUNLWOa5Of3WDrFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lg9jjY3v6dvR6sWftrAQXpquTU4C+EwL1IjfV4jtBw=;
 b=H4AMZkACBLh0ZAUvuKiJyuR5xNszqocGMycsJWjPIKTvHCBamKxaSApQfB9ACyavWSXzeDPA3Y+OqkPjQeljttcA1F7zZlmVHDGezouNtQQw+aS6L3YPsE38xxxX7E7TZoVNRkUbLh0WtE9kEij5OwIA+SmncZehopBBoOxauY0=
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com (2603:1096:604:8a::15)
 by TY3PR01MB9731.jpnprd01.prod.outlook.com (2603:1096:400:22f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 11:00:25 +0000
Received: from OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::4d3c:5b94:6a0c:7e6]) by OSYPR01MB5334.jpnprd01.prod.outlook.com
 ([fe80::4d3c:5b94:6a0c:7e6%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 11:00:25 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>, "s.shtylyov@omp.ru"
	<s.shtylyov@omp.ru>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next 4/9] net: rswitch: Add unmap_addrs instead of dma
 address in each desc
Thread-Topic: [PATCH net-next 4/9] net: rswitch: Add unmap_addrs instead of
 dma address in each desc
Thread-Index: AQHaISheVgHZpdElSUa/USkDXO1TqLCPchGAgAAfVvA=
Date: Tue, 28 Nov 2023 11:00:24 +0000
Message-ID:
 <OSYPR01MB5334493FEF42CB7D1A3B1598D8BCA@OSYPR01MB5334.jpnprd01.prod.outlook.com>
References: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
 <20231127115334.3670790-5-yoshihiro.shimoda.uh@renesas.com>
 <39248b92-3439-c1ed-e4f5-9f1f61fada34@gmail.com>
In-Reply-To: <39248b92-3439-c1ed-e4f5-9f1f61fada34@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSYPR01MB5334:EE_|TY3PR01MB9731:EE_
x-ms-office365-filtering-correlation-id: 2319bfd4-94a3-4be9-e356-08dbf001394a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 hXMyC+3YAllhlufihEG5tNytUq7TY9IkUvBv22hSDolzsZ5EOBOfJ38gdzzofo0ZTgXDV59PjPqMtE0VC3WFVIOiMqmGMso6xEDiGnc5GP43oXzoJZ2BCql6y9EEsp70GZYhgxwyp+XjjDCy9L3MpNPw+BvFRQIHUri4BX7wPOg4JNDjTXuIGN1VhqN92JMlfUnrbuMO4A053h/3u3d5PILMfEXJdsI+18VnrXOXJw0aFldo0vSbHR/5EWKEfcFZQYlXamCl+KvhDjkOq3cM74CFaXADL5XX0z327UaHNdmlt5cpDZWpPRTN2m7C1Y+ZmjUPtOxNmsPfLpqrynS07+PESsE6XNtZqUQ5fzVtO6Nk0yc0wzkwNtkMq1n/haSV14c7iDK0csNRzbmSkucnpkrzvNx3ZUviuH90c9c+XQ6EQVv8cKD4H9ZAy7oYTqIL6oB9TgUrtweBhVScBgRMxb7/6GiJWjfqbUP5tDGEVMpfFAD34c62HC5R5GcH06RDcFvr0Xs93kd43x6aTf3O26vowcj2unsxO5Vx1O5wvCAlfUa+ya1pZ2e0ccaVoIYnHwaCYsBJJ3SzWz1qacGsdjXWrsPfPU0xBZpUoWntBDHnCR7ocDZHL/zJipzDsPm4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSYPR01MB5334.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(66556008)(66476007)(64756008)(54906003)(66446008)(66946007)(8676002)(76116006)(316002)(110136005)(8936002)(4326008)(4744005)(5660300002)(55016003)(9686003)(2906002)(6506007)(7696005)(86362001)(38100700002)(33656002)(478600001)(71200400001)(53546011)(52536014)(41300700001)(38070700009)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aU5QTmZzZVZJSWs1V2kxQUgzOHlrTjhqcUtOdjBzM29hSFY0WmY1ZjFRbG9Z?=
 =?utf-8?B?cXNJWDJ5UE5oZlVQZmxSNzY1VUp4czR3MXpsSGRzalJmaVBYaGtqOWlrSytM?=
 =?utf-8?B?dHVYSzE2VGZ5dkpXRTJYTjBXWnNJY3cwOFFmMC9OckFUY2w0MEQrWURQQzlN?=
 =?utf-8?B?eEJ2bWVkSkt2VHJwNWdCbURiaFN5RUI4a1dzN3JLYjhSMFVJMnhZN0xuY20z?=
 =?utf-8?B?M3Q3amFialp0dFhyczFqSHVuU2VmeURqckNIWW9CNHRDYnpDdVdVU1R4SFQv?=
 =?utf-8?B?ZlJPV0s2Z0VXalRwYkRGREVPYjZHUG1FUEJRbEg2Z3ZXa0tHcEtPUlNBak83?=
 =?utf-8?B?ZFZyckk1ZVBQOHBQQmh4K1Jnd2YyRlRWMk9qZEJ3S0txUE1PbWEvWGVFaDBY?=
 =?utf-8?B?S1RsNk1oZHFGT0xWMjVVeGpzd0ZMVEU5eHVpTUdPeGo4WWIvVWJKQzViN050?=
 =?utf-8?B?MEhneUlkemoxK1hvcmVPSVc2eE8rOXlNdExvQTg4YmRkQUxkUmdwdWladm00?=
 =?utf-8?B?VUZVd0pXcDRCeEhwOFJYbDZtTGF3MURIWlYrdW1ndWx2VTJJbm4zSWZVZkdq?=
 =?utf-8?B?bjAvK3RoVXRXUHI4bXh3NkJlUmt0KzdpTzVnL3NPNUUwRmtNaU85bkhOOWl6?=
 =?utf-8?B?aGwvcTNsdG5Vb1h2UHVJUDl1aFNoUGQwVitRSWpueXRxdk1QUEhVZFZXLzZO?=
 =?utf-8?B?a2RYbzhvT3RZc3J3MXV0dXdGWDdHRTArenZieDRBZDVDMVJHUTdtcTFFWFA4?=
 =?utf-8?B?ZU9idWkvNVkzRXEwVUw4YkNXWDB3NmlVR3NBbFg5anNZaWRIRVNFTzZWTjB6?=
 =?utf-8?B?UEo4UFNTWVpjc05hRFVLN0RlZXVmZzdWbWc0QlhRVDFQTTBBMWJxTW1UTGRi?=
 =?utf-8?B?cjJFbExxVnVsR1N3MUo0VSswdmlmbVErZ0lyOGdTS3FET1BEVEZSMy83eUxW?=
 =?utf-8?B?bFU3aFppNDczNHloN2xvWFUySXlvNURDOUp5d2lHYUZZaHFuTUM4R2NINHhk?=
 =?utf-8?B?aGRPWmwwK1FpKzV0WitOZkZKby9ib3FTOTBvbnY1b2N4MnpFU2Mvc1UyNHVT?=
 =?utf-8?B?ODUyYlVTWmVWK21BaEZUelZsVkpRUm9KMWV4d0Jxdm5SZ1pqUktONW5ITGRr?=
 =?utf-8?B?ZGdoaHNIQXNORGo1NDNVbGt1S1AvZ1Bybm9lTzVrV1VCL1puekF3VlAzclc3?=
 =?utf-8?B?VTNrTkNoQ1pzbHI1ZnJxR1FLV0NkOTdxL283cGJ2Y2ZrcW1WUVVhbEM4M1JC?=
 =?utf-8?B?OW9oWWpYZE05TVYxcElCTzF0SE9YcE9CYVl3Tm1NS25uYVQ1MnNKZ2I1QTBa?=
 =?utf-8?B?MFllSExJVGNCTEJZc1diZWVPU1g1OWlZRmNhaENFRlRpL2NUMVFpRkdjdWU1?=
 =?utf-8?B?MVF1ZktyTjM4bGJIR0x1dldTZGpsamp2cDV5aGZyNXovM0JOSnpwa0FZK2hh?=
 =?utf-8?B?RCtsYWlMbVpsRExReWV6ZWtiT0NVTkVVY2pjbDJOYitzbk1XcEFvOFFxa1lM?=
 =?utf-8?B?ZGh2LzNCNjMyWHh0RC81NUVLeWpHRXRDalE0eDhYWGQwNmlCL2ZleWVZZm1Q?=
 =?utf-8?B?RWFiSnp6K1pMU01HWXFQVlcrakJFU1Jxb2c2d0Y2ajJlRTFzYmNzUHByVnVQ?=
 =?utf-8?B?Z2c3S3lpT1JJRHVMSVc4eE85TGdjN2JGbHM3U283THJ4MDA4RVJtdVdEUHhY?=
 =?utf-8?B?MnMyTGl3K3J6Q0RjektEaUJQaU9CM1hzV0pLN05oNVYxN0dQVDJ0MmxuTjFr?=
 =?utf-8?B?VlJoNm9Fc3ArQ0tVY0QxWlVMS2p6b1R1UmJRd09WUnlHWnYwMzNwNFRoQ0tP?=
 =?utf-8?B?RDZWTHUwK0lWbEQwOW5uUEJFaURHOFVYN1YxTWUzZ1NmSXBWbWlwYlNiRmgr?=
 =?utf-8?B?WEI4Wi8xenJxMmFhU2Ntc1hYd2R6cFZMTU9LWGpoY1NYT2NWT2VPQmEyTWgx?=
 =?utf-8?B?M0JkNTE4eFJmK2dhUFpESkNHbGQzU3FML2ZrUUJUM3JKTHFGRFlla3pVcHpF?=
 =?utf-8?B?NDhqZU1wYW9nQzRzZDAwUFhxa1BGYmZGUGdCa0hVZ2NvUU14QTdZdjJxRFNx?=
 =?utf-8?B?YmlmQlR6a2l2emh0OUk4RGxHQ252L1RLNnRDdFhNelpiYldva1dXUlVuVGVI?=
 =?utf-8?B?RE5RVUU5TTJveCtSREE2OUhTSDZyS2FGQmlWWHRCRWNnZ3VpNEpSNEtEVkYx?=
 =?utf-8?B?NWZFRnI0aU1hTVFoL2NXRVFsTStyL3VJNGhKK283ZFZScHJJTU5tWEhuSWxF?=
 =?utf-8?B?UnN3cklqaGs5Tlh3STJoRTNBQWJ3PT0=?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSYPR01MB5334.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2319bfd4-94a3-4be9-e356-08dbf001394a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 11:00:24.9642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hth8TTdOvwwboW9m+8NKjDJvD7bwM5e0QHm8XRM1M0F3x1i9YYQACA2Pxrnwk6e96DywrmgcD5l3yN8oJiB1W1NvhXMgMLfIsj0ZOd40byc9GQ5OeWJHqfWKa3VlWPpu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9731

SGVsbG8gU2VyZ2VpLA0KDQo+IEZyb206IFNlcmdlaSBTaHR5bHlvdiwgU2VudDogVHVlc2RheSwg
Tm92ZW1iZXIgMjgsIDIwMjMgNjowNyBQTQ0KPiANCj4gT24gMTEvMjcvMjMgMjo1MyBQTSwgWW9z
aGloaXJvIFNoaW1vZGEgd3JvdGU6DQo+IA0KPiA+IElmIHRoZSBkcml2ZXIgd291bGQgbGlrZSB0
byB0cmFuc21pdCBhIGp1bWJvIGZyYW1lIGxpa2UgMktpQiBvciBtb3JlLA0KPiA+IGl0IHNob3Vs
ZCBiZSBzcGxpdCBpbnRvIG11bHRpcGxlIHF1ZXVlcy4gSW4gbmVhciB0aGUgZnV0dXJlLCB0byBz
dXBwb3J0DQo+IA0KPiAgICBJbiB0aGUgbmVhciBmdXR1cmUsIHlvdSBtZWFuPw0KDQpPb3BzLiBZ
b3UncmUgY29ycmVjdC4gSSdsbCBmaXggaXQgKGFuZCBvdGhlciBwYXRjaGVzIHRvbykgb24gdjIu
DQoNCkJlc3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gPiB0aGlzLCBhZGQgdW5t
YXBfYWRkcnMgYXJyYXkgdG8gdW5tYXAgZG1hIG1hcHBpbmcgYWRkcmVzcyBpbnN0ZWFkIG9mIGRt
YQ0KPiA+IGFkZHJlc3MgaW4gZWFjaCBUWCBkZXNjcmlwdG9yIGJlY2F1c2UgdGhlIGRlc2NyaXB0
b3JzIG1heSBub3QgaGF2ZQ0KPiA+IHRoZSB0b3AgZG1hIGFkZHJlc3MuDQo+ID4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNh
cy5jb20+DQo+IFsuLi5dDQo+IA0KPiBNQlIsIFNlcmdleQ0K


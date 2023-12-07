Return-Path: <linux-renesas-soc+bounces-792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6965A807D02
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 01:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CA951C20BA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 00:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CCB367;
	Thu,  7 Dec 2023 00:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jKVFJSeI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9719A137;
	Wed,  6 Dec 2023 16:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYf8DP49KNNKPCrsYlQYB7RCllGxUvXO47RW0ipMusSPH6MBzIKwl5gMSHwxPA2G6mhyHFAcqvLdqNDKeE9kKPWGShYzyO1VIGWlA7KhxjR5/dH1spgpZqTrmzxkT1IzSIinPbidyXkyLND+kkP1gpjLgGbDNnx0NMcF0qeuZ/2paWwXQwIkSulZ5sFXgmfM2RtVTJItKo3FjCpkkqJBpk8ZrXA8Fbmth6NY1mjR/px1CtGRU+EmVX/W8YkbONEYU3TuYvtfFBumk+Zsz/vJRbUv6hMwOV754UBm+6SPcmHuSPlXyxGAlFkfCsF6umNFmT5rTatXV1HM7gmKvo77Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9AmGJx5kQZ0VM8EZL/sMjCnkDOaQJSJlkgOAbSiE2c=;
 b=ez5th1vR6B+Me3H2fZV4V/qlibrxA5iG5NMyZ94k7K4XU5s5nx7v1PojLOVMnFH6KUq6OU7qtqdLVRSAarTHPRlQ4PTkJ8C3bsNwJ20UZdot7WUWvfb7BVFxgK5tl2Q0B1ZYssz6Bke3HHBwkD7jnhxOugp7Jdm4eJOtPO4LYW2tv/t9X7+ea9VWe1a6z6kb6kEs9UcEtfyi/QHsFLWopAOTTX4InvBk5ce0yOnltztRYIVTFF9r9yd6hGWZHq3XLaEAOfpYnAW0yrIbQRUUrxOFmmNF7Q4hKheXOIXe/4WaaK5uRSHZUNQKk1fgtgLQmOaDxbyzcKqamHPgSIkKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9AmGJx5kQZ0VM8EZL/sMjCnkDOaQJSJlkgOAbSiE2c=;
 b=jKVFJSeIbUZAKHyaUffJo4UiBTxE/S1lqvP2BkHHTAewPvvqBXSyw1hylZJ5wbDF/52zKhzRnPXsBGjDufN9+IlWho1vM9J3J50D7JcGDunfHB3zZJasg7VUWhNOvnV0/k9/4ZRfTHAu4P97GKK/dcnyCcap9Cy7Id+BFJFtGLk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB11431.jpnprd01.prod.outlook.com
 (2603:1096:400:377::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 00:23:56 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 00:23:56 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>, "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next v3 8/9] net: rswitch: Add jumbo frames handling
 for TX
Thread-Topic: [PATCH net-next v3 8/9] net: rswitch: Add jumbo frames handling
 for TX
Thread-Index: AQHaJlAmqZfeRF0QfUeTjOhXVvtkvbCcDzoAgADrJpA=
Date: Thu, 7 Dec 2023 00:23:56 +0000
Message-ID:
 <TYBPR01MB5341A7F036286C8F6F5BFF99D88BA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com>
	 <20231204012058.3876078-9-yoshihiro.shimoda.uh@renesas.com>
 <6d2d35c48875e8881509f94aeb9fb37d32238069.camel@redhat.com>
In-Reply-To: <6d2d35c48875e8881509f94aeb9fb37d32238069.camel@redhat.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB11431:EE_
x-ms-office365-filtering-correlation-id: 81845587-35d0-4433-2b1b-08dbf6bacd2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 e6QK6brW7hDyv67r0lNKSSYXfQovAWNP03w1yLJZa+J79mqro2RVcVXnFhfqMRVNDElnqBI+8/2WUYTGFmrtNUQAEeUxpyhb+DkinDI4W1PSc8+qUK261Z2DtR3cszQQtE9pmX1FclqK8/jYslUKCD1C7wrEPf/+FUxmFkyP/OBYZKxe82Bz//lqksJE9TUeIlnR8V8V1PMGPqI/OLvipRArTrvTrOMBDxaRPt1455/js5CQ+PfPzue05NgZ9iy0Lca3HkzVANZVlda1kWANKElv9jMTEP1GmrNw/wBZUyArpOaqoesXvHFos2o6sR58qpiPocOMhm3C80gT9RNf1lrda48SJtsmumNMKe9iiJnFvXSorn9X0ha5ASY+jy9JtyYHd12mneQJXKDuXmAsUMUeXTeGVetTX1Sv7qUxKFbgxMAR8bnBbxGxiojvjT21PAEJo+r0sn6UYGh7PA/ABl4d2861+0GjA3IqawCXBBL2QyVwc/BGvGDFEW9z3JXddMSUF8DqPsYYfukVv5HKXj//Hk2InUV8LGX3EUHxg+iIYJ42UOjv6rFZLoZL+gaWKn13I3QDTaWF3CQvqLO5C14hC90syLeI6DtNjWAihHLu73bdqzImU0znL2tO3KhY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(55016003)(122000001)(38100700002)(33656002)(4744005)(38070700009)(5660300002)(71200400001)(2906002)(6506007)(7696005)(9686003)(41300700001)(66946007)(4326008)(66446008)(76116006)(478600001)(86362001)(66556008)(54906003)(8676002)(110136005)(52536014)(64756008)(66476007)(8936002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3ZJNWtiQlVGVkZMUmtWRWJrS2JLaVMzYnh3SGNWOFdUUjFPVnFFOFFveDVC?=
 =?utf-8?B?RS9GaW9RWmlheWk4ZERIaFhnekpKTmFFZ2RPSitHdDdjck5saDd3STdCOUJk?=
 =?utf-8?B?SzFnRy90c2ZaL3VIT2dXT2ZwaEhBN1dZTEVZWktyaFdXV0dCMlp1dEVNWm84?=
 =?utf-8?B?VjYyTHZ6anNCTlNBbldXTzJZVE1LN2IxRndZTEZCZlVwOTdLdVB6QTBlaTBC?=
 =?utf-8?B?V25naUFOakpUcVF5RFlJbXpsUnUvOThsekRiVGh2NUQyY3VWTlVIbWlkTlpx?=
 =?utf-8?B?aFplMnpoUG9hMEJMTTdRYnMwbk16ZkEvQjJ4bFVTcTF5ZTI4VHRxUnQycjNw?=
 =?utf-8?B?YkFpbmpiMTh5K0FiNmFaMkNJWFNtQ0JLRHIvK0RiZWFWeFoxMEdFRjNmM3Zn?=
 =?utf-8?B?WDlNbGs1bWROMUo2ZTVEQXltZHVYMkVjcDhwZ3VoNklLcDdOWG9QMkt3cllz?=
 =?utf-8?B?NUNZSU0xb05TVEtpOXB0S0xtdTBoeG5XWWdyRFAvUW9kMG56WHNsSnF2UHpW?=
 =?utf-8?B?SjZBWkNTMHFIcWM3SmR0SjFLRUJzbkNLNXJrOXFYVmxNQ251U1BURUg1TGNh?=
 =?utf-8?B?WTNqTEREY0habGo1dnZDNXZsdXQvQVRGaWpwcTlXU040ejFuNW12dGxIelBI?=
 =?utf-8?B?Smp2TjE5a3FPN3NGOEVRcVduZzU5VzVDYXJCMlRHWmdBWlduMFo2Y1BsekZ6?=
 =?utf-8?B?ZkswS0lZT0dEZkVIbmV4MUlIb0w2b0hXaERYSjFjV0VSTnBuWVVWdHp5dDdJ?=
 =?utf-8?B?UGhNbUcxdjMvcjg2dmZhWTNYYnNEUVQzK3hUOXR4VDhmRUhnS3N4L1dOOFl2?=
 =?utf-8?B?Z3MvNEVRTFg1dWhpZnZoUDFvSDJJd21CT2tkanJEdGF0dDZpa0htT2NHQ0Q1?=
 =?utf-8?B?RGRFTC9WcFc1RGdBUFVKaVN2dlFIYWg3MXA1SXI1YnhzWGdTQXJmMFN3eHov?=
 =?utf-8?B?U2lkU3dLS2FSSFJLQnFpMUR6Y0tNclcxSTNzOGg2dFUwS0hwdEpCd2hPZExx?=
 =?utf-8?B?T3lFbW9lQldCT0dqZ0M1b3pJc0FJN3BIZDArRHUzMVNVbjBTTG9MN2FvR1NS?=
 =?utf-8?B?Rlk1VFBGZTB0MDRiZ1FMYlVRdGtQMmxFbU5YeXBVUE1BVlFqZzJJYTR4OGpC?=
 =?utf-8?B?dW1PNlZFdS9qcW1BeCtCeDNXRXM4VVJOV1NvV3dmMFVQZXd2V3JQWklqd0hB?=
 =?utf-8?B?ZVZmVlY0M2FiWWNublZ6U3lHOFcyc0pNUXJ5TGFVOEJMVGVkOWlueThYeWxS?=
 =?utf-8?B?NnlwQjdXRFJ6bEIrQVczWSt6R3VKVHpBVnhYalEweE8vemFraWsyOGZ3VGZy?=
 =?utf-8?B?MUVYeFFJR0o4TTl2K1lGcy9YUzBKMm9kcTE1T2FtU2VJd0hPdStjS0pGRUs0?=
 =?utf-8?B?RlJuNEhtZ2I4c3k2dzdVK3U3ZXNvV0lkL0xyd0ZneEh0YTl3Vm80d3IrcXBp?=
 =?utf-8?B?QnEvcFhJRFpMU3V2eHozcmNlbkJmNUtLRFpkTmhkNjhDMFByWWxlMHJMdDJW?=
 =?utf-8?B?ZUJ6VFd4QUlOT1FKaEZkYWdBQldZb0J3MS96YktUdWVKUG8vQTFKY0w4S0RN?=
 =?utf-8?B?cW9FOFkwZVR4d3VRbmJoYzhSekU0ajd0RC9ib1lYdGIwMjAzVmZZMTR4emhB?=
 =?utf-8?B?eVQvVUxUTmRqMW8xRUZJNDgzb1I0SWpVUHZtMWVueXg4c0E3RWpyeC9ud1lu?=
 =?utf-8?B?VlZBMC9lQVluazltb2JhWHNSc2dqZjhSV3pQOC9OdHJ2dUdGS3p3MmpHRUVY?=
 =?utf-8?B?UUk3ZkpjQVV6aE1FK0ZuQWk0VWtVTmxJS3daM1Ria0xuU0swb1luWmIxZ0lP?=
 =?utf-8?B?TUVvT0FFVjA2Yy9VYk9rekh3OVpBYmJYTVJQcGtjaDhxN2xyNXA2NC81Wms1?=
 =?utf-8?B?cHV3SEtmOGFDN2RqMzlnZ1RnNDZERlBGZmhsYVY3aXdHVk1jd3dwUFNCZThC?=
 =?utf-8?B?OFZtSGthVjV2SlBZNmNSaEdVR2JQd1B6cFlaM2YxRUZGWDJEWU12Q05LUFhy?=
 =?utf-8?B?b3dBaityZFlEU2VGU2RJbHNWQWtMOHF5TUhscjFhT3RpMFRTYnBJVnRtZ0xQ?=
 =?utf-8?B?WjA5YVJuR2dGWm1RTjNXRHlxQ0lLVTBFZTBjNVZ1ZCt1QUo0Z1NuOGVyUUc2?=
 =?utf-8?B?NDU4cy9VVVRnMXBHY0VLdzBNVU1kTE9XR01URW56c3FUUUxFczVYQVA4TUti?=
 =?utf-8?B?Rk9hbUhoVTBjeDRBSXVPY2x0VTBGSmpuZnNxVmN4YkYwVHphMitMbXlYMUN5?=
 =?utf-8?B?YkxYK3kxTUNMTUNLQ0srQStwMkRBPT0=?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 81845587-35d0-4433-2b1b-08dbf6bacd2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 00:23:56.9424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ilnkUkMUSL763Id4hhWRh4ZzKUeQaVGKFQ6uYqoqwN5b/vsiDQpg1eu5vArvo8g/uI/L+RWUKbXzeGhx3ZQIjvX0Z8nPpHO6sNG/QORqmBzn0Dsrlgr/3HGi42V/UTLv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431

SGVsbG8gUGFvbG8sDQoNCj4gRnJvbTogUGFvbG8gQWJlbmksIFNlbnQ6IFdlZG5lc2RheSwgRGVj
ZW1iZXIgNiwgMjAyMyA3OjIxIFBNDQo+IA0KPiBPbiBNb24sIDIwMjMtMTItMDQgYXQgMTA6MjAg
KzA5MDAsIFlvc2hpaGlybyBTaGltb2RhIHdyb3RlOg0KPiA+IEBAIC0xNjQ3LDI1ICsxNjc2LDMy
IEBAIHN0YXRpYyBuZXRkZXZfdHhfdCByc3dpdGNoX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYg
KnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKm5kDQo+ID4gIAlpZiAoc2tiX3B1dF9wYWR0byhza2Is
IEVUSF9aTEVOKSkNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+DQo+ID4gLQlkbWFfYWRkciA9IGRt
YV9tYXBfc2luZ2xlKG5kZXYtPmRldi5wYXJlbnQsIHNrYi0+ZGF0YSwgc2tiLT5sZW4sIERNQV9U
T19ERVZJQ0UpOw0KPiA+IC0JaWYgKGRtYV9tYXBwaW5nX2Vycm9yKG5kZXYtPmRldi5wYXJlbnQs
IGRtYV9hZGRyKSkNCj4gPiArCWRtYV9hZGRyX29yaWcgPSBkbWFfbWFwX3NpbmdsZShuZGV2LT5k
ZXYucGFyZW50LCBza2ItPmRhdGEsIHNrYi0+bGVuLCBETUFfVE9fREVWSUNFKTsNCj4gPiArCWlm
IChkbWFfbWFwcGluZ19lcnJvcihuZGV2LT5kZXYucGFyZW50LCBkbWFfYWRkcl9vcmlnKSkNCj4g
PiAgCQlnb3RvIGVycl9rZnJlZTsNCj4gPg0KPiA+ICAJZ3EtPnNrYnNbZ3EtPmN1cl0gPSBza2I7
DQo+ID4gIAlncS0+dW5tYXBfYWRkcnNbZ3EtPmN1cl0gPSBkbWFfYWRkcjsNCj4gDQo+IEhlcmUg
J2RtYV9hZGRyJyBpcyBzdGlsbCB1c2VkIHVuaW5pdGlhbGl6ZWQuIEkgZ3Vlc3MgeW91IHNob3Vs
ZCB1c2UNCj4gJ2RtYV9hZGRyX29yaWcnIGV2ZW4gaGVyZS4NCg0KT29wcyEgSSBzaG91bGQgZml4
IGl0LiBJJ2xsIG1ha2UgdjQgcGF0Y2guIFRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXchDQoNCkJl
c3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gQ2hlZXJzLA0KPiANCj4gUGFvbG8N
Cg0K


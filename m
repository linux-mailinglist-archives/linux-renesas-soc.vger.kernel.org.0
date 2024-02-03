Return-Path: <linux-renesas-soc+bounces-2299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F784869E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 15:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 869191F2433F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 14:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B445D906;
	Sat,  3 Feb 2024 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XPPI3Sdj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95F5D90B;
	Sat,  3 Feb 2024 14:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706968926; cv=fail; b=J+gOIKHFBKzDdTkrLt27CZP7EhxIhGtQkijJorD00Tp9TbyhHkju4TPnMsU41UnBZXyVUqnivplA9kJ3hi2/54gK7fImTk6SAyXf/LKOcLmWEXbMkN0i4Y9FDDXx8KPouuE1bwVjROSraYYmvK10koJKVvfjRaGRGqHXTN2Kdrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706968926; c=relaxed/simple;
	bh=cx6Iq5iOFmw33p3jYemrvQ58lmA6Tr8INBN0/Onx4Co=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cwd8l2KK/N1fij0o8Sh5xapFBS+1tmcL1TjGjCvdmbe/moWCGfpMb+czzY8yxYuHF2Wbk9wIxtLeUNgQjrw0p07ZR88L+IyAUaR5Ck/cGTtCC6s/mtiQaPui2Rhyo0JG4d7DMzb2LnIzA8K++pFG8risGomPBTX1Q1vl2kObsbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XPPI3Sdj; arc=fail smtp.client-ip=40.107.113.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBd7DzBwm83Rg3YwD26CPvmd9F3eAtbda9CNH4uSMPjEDAiknsuSGIaRMU4FURhB9xaudrBDhYwU6FoWj2ZK7aUFoOvh7l95Ntq6LigNoI677kXXo0S+OTkZpsPV5Ch/2xJmPA7UYKBTT05c/j3f/659BxvsuHAtSxK1+7yas3xos+2IJp8u1qEc7lQFXVYNVka/bEleALDuU4sXjbSuD4O+qCYobkficxrXuRuf7H3WGqyo/qi/Wcityh8RJlboKdqaxtVNZp2UKDDPJRKujW9+9ui3k41GzbLB7Rq16n37ErkpY+LRBBlzU40QpqpzP9Jwq7Mn5FUYcIxneBYIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx6Iq5iOFmw33p3jYemrvQ58lmA6Tr8INBN0/Onx4Co=;
 b=FADeKXJhLmsFXJ8KqBPCSCU5HK6AM1eZ58PHwoAV/E5Gwd+gaZnGj1+N/JvPcadPXhdm9OAxlOYXzd9it2IsRrd6kYTKeB1i8IXzOhlZlJ3bSQ6LFrKnbJQtOjyx0oyuag8AxvW+XzjNV5Lx7/nI3h37N/hkrJpSzuP+daHJuoW31yHXwDSjgjp5iWfEfGZIZe8R0Q4cbDjJ6srwh1VUx1091p21PYGo3Mf2vGIg0M3YfwPoj497n8WU0a+VD8AsRUQA5TX2TvzH5XPWDwkUT4/NbB3ank0OKrch5qzBARkiMmO3mNL6CT5roy+uRvbXkkGnVe5RLrFkXqGvpSVRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx6Iq5iOFmw33p3jYemrvQ58lmA6Tr8INBN0/Onx4Co=;
 b=XPPI3SdjmwnnfXWuWD0Js6kmowlXPiq0iw3JILE05mM7rF0ZM23wMMiEfCRLu7CeNno78SYUG6NALl/hcN/9TmaPOjfJ7dGapSzmY2iiavPzA0yCe9jE5r6nCz4tQsgF7kTL+7q0PuG4l4iwQyGCmw1HTLz6hZ6hvg9Im8Lodxk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS0PR01MB5332.jpnprd01.prod.outlook.com
 (2603:1096:604:a7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Sat, 3 Feb
 2024 14:01:59 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.027; Sat, 3 Feb 2024
 14:01:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 net-next 1/2] ravb: Add Rx checksum offload support for
 GbEth
Thread-Topic: [PATCH v3 net-next 1/2] ravb: Add Rx checksum offload support
 for GbEth
Thread-Index: AQHaVUc7EpFXt05avkyynkxZYgvBprD3bNqAgAE6f6A=
Date: Sat, 3 Feb 2024 14:01:58 +0000
Message-ID:
 <TYCPR01MB11269DE6466E989CB1DEEE7BF86412@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240201194521.139472-1-biju.das.jz@bp.renesas.com>
 <20240201194521.139472-2-biju.das.jz@bp.renesas.com>
 <422974a5-cbce-50ad-5a8c-7588d5eeebc2@omp.ru>
In-Reply-To: <422974a5-cbce-50ad-5a8c-7588d5eeebc2@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS0PR01MB5332:EE_
x-ms-office365-filtering-correlation-id: 4138f7c1-dc8b-4326-44c9-08dc24c0b02d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SA/zyN6C/cpAa7NSqCgPe+UZC3Lsbu7O2z5tQ/S4UsQEUvoKtZz8OJaFET+vGjsiKgTOYuUUcLKYajTvcifs0I2r9vTBOfgmvpo7tf4jsBUUTYNps0JfKynVbUbh+10iZL516ZTO22wqH09oh5atxEK2Qiqjvzab4VH45spgyEYcr/jt1jdTALZ3bymXpfqpmMYDWCOACwg+Wkz4h9YLkFOZQiLgznp1fbpXBlK5iUsLijtoq29yxO6s30I8T0udLNyijlSF06MpMib0jlCQ4bq+PN+75xccvqiXH1RN+4X/wDwzYqVLO5iGuLlL/uFABT0n7/Wc9Hq2bghAfptv/5hAD4Uhvh4/I0zl0H/ewlfv0KnZI4m5t2iLHX9bYkNu8iQSmFiqfoLi0sOVz3tI6jvnKAOlBQPw0nkvWpm0qGK9fQJlcH6ZI7lW06xMvt7AUKfGC1BBoENjdtWGhLVmofJafwUKMCi7wjwv7Y2XJBG5oIZLoo4nu4n32eHrjopkL7IqMm69WD3f4nLnbXnVmU1h1qmkPSphEC8TGxJkg+NSyTUoROBWRIc4RXocQ2IHKDHi7rdx6iJYtYQx8XjWbtKO2GF5xWOOQV1QPhyXDcPLPaRqcKQloAzuDNCkWCYt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(55016003)(38070700009)(66556008)(7696005)(53546011)(8676002)(478600001)(110136005)(54906003)(26005)(8936002)(64756008)(2906002)(71200400001)(4326008)(55236004)(5660300002)(6506007)(316002)(66446008)(66476007)(9686003)(83380400001)(52536014)(66946007)(76116006)(7416002)(122000001)(86362001)(41300700001)(38100700002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aEtiakd2SHlDTEYwdTgzZUQvMUppT3RYVC9qWUVlRjFlSE0vOGZ2RzFpMjho?=
 =?utf-8?B?cEhhL2VyWkh4bTVSb2duajl0QmRUR3RzUmhla2tjaWJnS2FwdkZHWDdWNXNM?=
 =?utf-8?B?NWlEQTMwRHZMZUZwU0lxS0dscEErNzM0MXhzU20zOXRCSFdUbHI5UjloYWhm?=
 =?utf-8?B?L0xYMzFHUVl4VXg1b3pLLzVLUzlNZEtKRDFLMURZZ3d0SFNRZEI2cng2WUh2?=
 =?utf-8?B?Z3NGSTZBN24yNXh0QzRQMHBoMDRjbURQYkRsb3l4UFNKMWthMUpoVlQrcHlk?=
 =?utf-8?B?bUtwQysvR2NjQ1Y4Z2VKTWRxRXVod3pVV0xRaTkyQUhoRCsyU2tzb2hxeXVk?=
 =?utf-8?B?UTR5Zytub2JSNTdYeVlReFZzNHExSmdLMWsrOXpkdGMyeWZUVWsyL0N2akE0?=
 =?utf-8?B?N0lnZTRkbmJ5RzQyN3hOY0xlNjNoTVBOQUN4ZVhBU1IxOCt0VXdxV2JSZVA0?=
 =?utf-8?B?NzJrWm0xVjlraDRJaGFRTlRQWitJQUNZTndNZVJlRWlXZDNodm1zRVM4NmtM?=
 =?utf-8?B?RHp5Sk0wZEdlclNxYUpYNHNYcWJoMFp2aDBFQld2L1RnNS9BNGVPb1hPTWlJ?=
 =?utf-8?B?Q1ZYRHZwM2I3RkU4bDVyOFFvQkR6ZmE1Q0xMblpZMmVQRFZwbFFHSjI2aDg2?=
 =?utf-8?B?aDErSXdJYW5kdTVJSnBRaDByVFpEZTNLRWtxUUowcEdxNFVwK2FxcUYvS3Q2?=
 =?utf-8?B?VDRnN3lYRjM0YkFVb2lvYmZjUXpYL1I5Tk8xakphWU1PNXpFVEphdWtGNDh3?=
 =?utf-8?B?MlhkdGp3RmVLOTlESFY2Y05ZcmJKNU10UVJ2Qm1Fd1I1MWl4blRwbGZuSjFP?=
 =?utf-8?B?Slg0SDRDSFlyV1Rmakt4eUh0VDNVZitieHpzM2NKaFVveVFUQzFJekJMSmE3?=
 =?utf-8?B?Nm5rc3ZSUGlNZ0xjcFk0RVByc080elUrQ1VCSHF3TE5sYTltMjRibGJUdlBs?=
 =?utf-8?B?cHlQVEFXNFlpUjQzcXowRkRrd0h3S0ZJeld1OGtEeW9mU3JkT2JpRzFpK29V?=
 =?utf-8?B?cmhuNE9reURaUHNmWmRadit5NnNKRHdoM3hyU3FYMDAxK2RvYjkwUDQyUUVF?=
 =?utf-8?B?M3A5a2FjbHZkU2FSMWxmNkY4K2dTT21VTFhLSGRpM1M5MHY5a1dFQkkxNnhI?=
 =?utf-8?B?N20yZzFSVnVLd2RRRzIxWUovSkg5Q0VPVVZ6Q0NmZ25Nd3ZYK21NTmdTYmZv?=
 =?utf-8?B?WXkyaG9nbkp2NWNMY3dUS25BYlFFQVRiL1MwTE5sZlY3a0RMSnUzeVkwZHhp?=
 =?utf-8?B?eXRzZldHSmk0MVUzV3FXTDlkOEsrRFpMUm1lbUJKN1NVSlRML0w2WHpzZFJE?=
 =?utf-8?B?elRsQW9tTUhDL3EvSWtsejNsQnpPcEJiNm1UOWlTNEdUdFNYcWFUaEVmR0tv?=
 =?utf-8?B?aTJtaWdCSEFXU3RtNkx0V1pzdTlwZlpNYTRjajlrNUpjalJnNGFqOHNncXhm?=
 =?utf-8?B?V0NJTjhjS3FocHlCNXAxd3h1VUVpTGl5cFVGSU5FbTRxUXJQNzBsTjRsMkxr?=
 =?utf-8?B?RVFNakliUUlLdVZJTW1TWnBuell1TVR5RUFFT2VOUFpROUdVeGxUYktpaUZY?=
 =?utf-8?B?S0xHYnZTVWJSSG5mQU02d2JUTU94a2lWNzA1Q3p4VjdqYnJGcXJVczhXSDZB?=
 =?utf-8?B?QzlSMWtCSnNQNDhWQ3UzS2xzQjljRlhRWmo2Q2J1VmZnMjFhc09wcnAyanhC?=
 =?utf-8?B?dUYzL2w5Q1lvU0Y4Z21jRVBFcFZ5YmZrWXRJSlUzTDBHLzZpbG05QU93RStL?=
 =?utf-8?B?K3dKcFVVR3F2UjkwY2hUSkxyaElERmFMWDIrWHpsakpScm5OdTNTK056TzVv?=
 =?utf-8?B?cmsvT3lXdDVuSnVsSyszaE5mUTY5aGxHOHN4azBBclNrU3V3STBwVkcwaGpi?=
 =?utf-8?B?ZCtSMWRDcjNXOUNjTURoQVRLWmR0cTRlQTFwSU5WL3lPT3VpQmhveGFYTTNw?=
 =?utf-8?B?eUNlbklqMkJIeUZEeThUWGlOZkJqRGNzTEdWbTdvNEFNK1I1SVJJOEptclRG?=
 =?utf-8?B?MHpYaEhBNmhxMHozd1ZodnRYYW9LeDZCSVUvZzEwZHBMeXdJNDgreGQrRFFK?=
 =?utf-8?B?enBxbzRGVzFaL0YxT0JFTVlVZXcyUUxVRE5MR0lyM2lkT2M0WURHbWJvYkg4?=
 =?utf-8?B?cEo5NmpDL1lEYkRMcEhOMzRlMkYwSUw1M042TUtIM28zaHc2KzMrd2hINFVH?=
 =?utf-8?B?MEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4138f7c1-dc8b-4326-44c9-08dc24c0b02d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2024 14:01:58.7767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MSNqvNHzgT+lfhw93twfIRy3oJ4BrzR1XTxs5zjJV6cxHYM6PZWNQYMx7kKxWqNRdHFMo7CS4ZhEzq48zW5TT5/oQnRdjmKVzPCgd2iadRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5332

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VyZ2V5IFNodHlseW92
IDxzLnNodHlseW92QG9tcC5ydT4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAyLCAyMDI0IDc6
MTIgUE0NCj4gVG86IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IERhdmlk
IFMuIE1pbGxlcg0KPiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IEVyaWMgRHVtYXpldCA8ZWR1bWF6
ZXRAZ29vZ2xlLmNvbT47IEpha3ViIEtpY2luc2tpDQo+IDxrdWJhQGtlcm5lbC5vcmc+OyBQYW9s
byBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+DQo+IENjOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRp
dS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+OyBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+OyBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNh
bmctDQo+IGVuZ2luZWVyaW5nLmNvbT47IG5pa2l0YS55b3VzaCA8bmlraXRhLnlvdXNoQGNvZ2Vu
dGVtYmVkZGVkLmNvbT47DQo+IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMt
c29jQHZnZXIua2VybmVsLm9yZzsgR2VlcnQNCj4gVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT47IFByYWJoYWthciBNYWhhZGV2IExhZA0KPiA8cHJhYmhha2FyLm1haGFkZXYt
bGFkLnJqQGJwLnJlbmVzYXMuY29tPjsgYmlqdS5kYXMuYXUNCj4gPGJpanUuZGFzLmF1QGdtYWls
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyBuZXQtbmV4dCAxLzJdIHJhdmI6IEFkZCBS
eCBjaGVja3N1bSBvZmZsb2FkIHN1cHBvcnQNCj4gZm9yIEdiRXRoDQo+IA0KPiBPbiAyLzEvMjQg
MTA6NDUgUE0sIEJpanUgRGFzIHdyb3RlOg0KPiANCj4gPiBUT0UgaGFzIGhhcmR3YXJlIHN1cHBv
cnQgZm9yIGNhbGN1bGF0aW5nIElQIGhlYWRlciBhbmQgVENQL1VEUC9JQ01QDQo+ID4gY2hlY2tz
dW0gZm9yIGJvdGggSVB2NCBhbmQgSVB2Ni4NCj4gPg0KPiA+IEFkZCBSeCBjaGVja3N1bSBvZmZs
b2FkIHN1cHBvcnRlZCBieSBUT0UgZm9yIElQdjQgYW5kIFRDUC9VRFAgcHJvdG9jb2xzLg0KPiA+
DQo+ID4gRm9yIFJ4LCB0aGUgNC1ieXRlIHJlc3VsdCBvZiBjaGVja3N1bSBjYWxjdWxhdGlvbiBp
cyBhdHRhY2hlZCB0byB0aGUNCj4gPiBFdGhlcm5ldCBmcmFtZXMuRmlyc3QgMi1ieXRlcyBpcyBy
ZXN1bHQgb2YgSVB2NCBoZWFkZXIgY2hlY2tzdW0gYW5kDQo+ID4gbmV4dCAyLWJ5dGVzIGlzIFRD
UC9VRFAvSUNNUCBjaGVja3N1bS4NCj4gPg0KPiA+IElmIGEgZnJhbWUgZG9lcyBub3QgaGF2ZSBj
aGVja3N1bSBlcnJvciwgMHgwMDAwIGlzIGF0dGFjaGVkIGFzDQo+ID4gY2hlY2tzdW0gY2FsY3Vs
YXRpb24gcmVzdWx0LiBGb3IgdW5zdXBwb3J0ZWQgZnJhbWVzIDB4RkZGRiBpcyBhdHRhY2hlZA0K
PiA+IGFzIGNoZWNrc3VtIGNhbGN1bGF0aW9uIHJlc3VsdC4gSW4gY2FzZSBvZiBhbiBJUHY2IHBh
Y2tldCwgSVB2NA0KPiA+IGNoZWNrc3VtIGlzIGFsd2F5cyBzZXQgdG8gMHhGRkZGLg0KPiA+DQo+
ID4gV2UgY2FuIHRlc3QgdGhpcyBmdW5jdGlvbmFsaXR5IGJ5IHRoZSBiZWxvdyBjb21tYW5kcw0K
PiA+DQo+ID4gZXRodG9vbCAtSyBldGgwIHJ4IG9uIC0tPiB0byB0dXJuIG9uIFJ4IGNoZWNrc3Vt
IG9mZmxvYWQgZXRodG9vbCAtSw0KPiA+IGV0aDAgcnggb2ZmIC0tPiB0byB0dXJuIG9mZiBSeCBj
aGVja3N1bSBvZmZsb2FkDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+IFsuLi5dDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmIuaA0KPiA+IGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvcmVuZXNhcy9yYXZiLmgNCj4gPiBpbmRleCBlMGY4Mjc2Y2ZmZWQuLmE3ZmU5ZDhiNmI0MSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmIuaA0KPiA+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yi5oDQo+ID4gQEAgLTIwNiw2
ICsyMDYsNyBAQCBlbnVtIHJhdmJfcmVnIHsNCj4gPiAgCVJGQ1IJPSAweDA3NjAsDQo+ID4gIAlN
QUZDUgk9IDB4MDc3OCwNCj4gDQo+ICAgIFdvdWxkIGJlIGdvb2QgdG8gYWRkIHRoaXMgY29tbWVu
dCBoZXJlOg0KPiANCj4gCS8qIFRPRSByZWdpc3RlcnMgKi8NCg0KT0sgd2lsbCBjaGFuZ2UgYXMg
YmVsb3csIHNvIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byByZXBlYXQgLyogUlovRzJMIG9ubHkgKi8N
CisNCisJLyogUlovRzJMIFRPRSByZWdpc3RlcnMgKi8NCisJQ1NSMCAgICA9IDB4MDgwMCwNCisJ
Q1NSMiAgICA9IDB4MDgwOCwNCg0KPiANCj4gPiAgCUNTUjAgICAgPSAweDA4MDAsCS8qIFJaL0cy
TCBvbmx5ICovDQo+ID4gKwlDU1IyICAgID0gMHgwODA4LAkvKiBSWi9HMkwgb25seSAqLw0KPiA+
ICB9Ow0KPiA+DQo+ID4NCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiA+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiX21haW4uYw0KPiA+IGluZGV4IDBlMzczMWY1MGZjMi4uYzRkYzZlYzU0Mjg3IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMN
Cj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jDQo+ID4g
QEAgLTUyMiw2ICs1MjIsMjMgQEAgc3RhdGljIGludCByYXZiX3JpbmdfaW5pdChzdHJ1Y3QgbmV0
X2RldmljZSAqbmRldiwNCj4gaW50IHEpDQo+ID4gIAlyZXR1cm4gLUVOT01FTTsNCj4gPiAgfQ0K
PiA+DQo+ID4gK3N0YXRpYyB2b2lkIHJhdmJfY3N1bV9pbml0X2diZXRoKHN0cnVjdCBuZXRfZGV2
aWNlICpuZGV2KSB7DQo+ID4gKwlpZiAoIShuZGV2LT5mZWF0dXJlcyAmIE5FVElGX0ZfUlhDU1VN
KSkNCj4gPiArCQlnb3RvIGRvbmU7DQo+ID4gKw0KPiA+ICsJcmF2Yl93cml0ZShuZGV2LCAwLCBD
U1IwKTsNCj4gPiArCWlmIChyYXZiX3dhaXQobmRldiwgQ1NSMCwgQ1NSMF9SUEUsIDApKSB7DQo+
ID4gKwkJbmV0ZGV2X2VycihuZGV2LCAiVGltZW91dCBlbmFibGluZyBoYXJkd2FyZSBjaGVja3N1
bVxuIik7DQo+ID4gKwkJbmRldi0+ZmVhdHVyZXMgJj0gfk5FVElGX0ZfUlhDU1VNOw0KPiA+ICsJ
fSBlbHNlIHsNCj4gPiArCQlyYXZiX3dyaXRlKG5kZXYsIENTUjJfQUxMLCBDU1IyKTsNCj4gDQo+
ICAgIERvZXMgaXQgbWFrZSBzZW5zZSB0byBzZXQgdGhlIElQdjYgc3BlY2lmaWMgYml0cyBpZiB3
ZSBkb24ndCB5ZXQNCj4gc3VwcG9ydCBJUHY2IGNoZWNrc3VtbWluZyBhbnl3YXlzPw0KDQpPSyB3
aWxsIGRyb3AgSVB2NiBiaXRzIG5vdyBhbmQgd2lsbCBhZGQgd2hlbiB3ZSBlbmFibGUgSVB2Ni4N
Cg0KPiANCj4gPiArCX0NCj4gPiArDQo+ID4gK2RvbmU6DQo+ID4gKwlyYXZiX3dyaXRlKG5kZXYs
IENTUjBfVFBFIHwgQ1NSMF9SUEUsIENTUjApOyB9DQo+ID4gKw0KPiA+ICBzdGF0aWMgdm9pZCBy
YXZiX2VtYWNfaW5pdF9nYmV0aChzdHJ1Y3QgbmV0X2RldmljZSAqbmRldikgIHsNCj4gPiAgCXN0
cnVjdCByYXZiX3ByaXZhdGUgKnByaXYgPSBuZXRkZXZfcHJpdihuZGV2KTsNCj4gWy4uLl0NCj4g
PiBAQCAtNzM0LDYgKzc1MiwzMSBAQCBzdGF0aWMgdm9pZCByYXZiX2dldF90eF90c3RhbXAoc3Ry
dWN0IG5ldF9kZXZpY2UNCj4gKm5kZXYpDQo+ID4gIAl9DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0
aWMgdm9pZCByYXZiX3J4X2NzdW1fZ2JldGgoc3RydWN0IHNrX2J1ZmYgKnNrYikgew0KPiA+ICsJ
X193c3VtIGNzdW1faXBfaGRyLCBjc3VtX3Byb3RvOw0KPiA+ICsJdTggKmh3X2NzdW07DQo+ID4g
Kw0KPiA+ICsJLyogVGhlIGhhcmR3YXJlIGNoZWNrc3VtIHN0YXR1cyBpcyBjb250YWluZWQgaW4g
c2l6ZW9mKF9fc3VtMTYpICogMg0KPiA9IDQNCj4gPiArCSAqIGJ5dGVzIGFwcGVuZGVkIHRvIHBh
Y2tldCBkYXRhLiBGaXJzdCAyIGJ5dGVzIGlzIGlwIGhlYWRlciBjc3VtDQo+IGFuZA0KPiA+ICsJ
ICogbGFzdCAyIGJ5dGVzIGlzIHByb3RvY29sIGNzdW0uDQo+IA0KPiAgICBIbSwgbWF5YmUgc3Bl
bGwgb3V0IGNzdW0gYXMgY2hlY2tzdW0/DQoNCk9LLg0KDQo+IA0KPiA+ICsJICovDQo+ID4gKwlp
ZiAodW5saWtlbHkoc2tiLT5sZW4gPCBzaXplb2YoX19zdW0xNikgKiAyKSkNCj4gPiArCQlyZXR1
cm47DQo+ID4gKw0KPiA+ICsJaHdfY3N1bSA9IHNrYl90YWlsX3BvaW50ZXIoc2tiKSAtIHNpemVv
ZihfX3N1bTE2KTsNCj4gPiArCWNzdW1fcHJvdG8gPSBjc3VtX3VuZm9sZCgoX19mb3JjZQ0KPiA+
ICtfX3N1bTE2KWdldF91bmFsaWduZWRfbGUxNihod19jc3VtKSk7DQo+ID4gKw0KPiA+ICsJaHdf
Y3N1bSAtPSBzaXplb2YoX19zdW0xNik7DQo+ID4gKwljc3VtX2lwX2hkciA9IGNzdW1fdW5mb2xk
KChfX2ZvcmNlDQo+IF9fc3VtMTYpZ2V0X3VuYWxpZ25lZF9sZTE2KGh3X2NzdW0pKTsNCj4gPiAr
CXNrYl90cmltKHNrYiwgc2tiLT5sZW4gLSAyICogc2l6ZW9mKF9fc3VtMTYpKTsNCj4gPiArDQo+
ID4gKwkvKiBUT0RPOiBJUFY2IFJ4IGNzdW0gKi8NCj4gPiArCWlmIChza2ItPnByb3RvY29sID09
IGh0b25zKEVUSF9QX0lQKSAmJiAhY3N1bV9pcF9oZHIgJiYgIWNzdW1fcHJvdG8pDQo+ID4gKwkJ
LyogSGFyZHdhcmUgdmFsaWRhdGVkIG91ciBjaGVja3N1bSAqLw0KPiA+ICsJCXNrYi0+aXBfc3Vt
bWVkID0gQ0hFQ0tTVU1fVU5ORUNFU1NBUlk7DQo+IA0KPiAgICBJIHRoaW5rIHlvdSBuZWVkIHt9
IGJlY2F1c2Ugb2YgdGhlIGNvbW1lbnQgKGJ1dCB3b3VsZCBiZSBnb29kIHdpdGhvdXQNCj4gaXQg
YXMgd2VsbCkuLi4NCg0KT0ssIEkgd2lsbCBkcm9wIHRoZSB1bm5lY2Vzc2FyeSBjb21tZW50ICJI
YXJkd2FyZSB2YWxpZGF0ZWQgb3VyIGNoZWNrc3VtIg0KdG8gYXZvaWQgY29uZnVzaW9uIHJlbGF0
ZWQgdG8gbXVsdGktbGluZSBjb21tZW50Lg0KDQo+IA0KPiBbLi4uXQ0KPiA+IEBAIC0yMzM0LDEx
ICsyMzgxLDQ5IEBAIHN0YXRpYyB2b2lkIHJhdmJfc2V0X3J4X2NzdW0oc3RydWN0IG5ldF9kZXZp
Y2UNCj4gKm5kZXYsIGJvb2wgZW5hYmxlKQ0KPiA+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
cHJpdi0+bG9jaywgZmxhZ3MpOyAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgcmF2Yl9lbmRpc2Fi
bGVfY3N1bV9nYmV0aChzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiwgZW51bQ0KPiByYXZiX3JlZyBy
ZWcsDQo+ID4gKwkJCQkgICAgIHUzMiB2YWwsIHUzMiBtYXNrKQ0KPiANCj4gICAgSSdkIHN1Z2dl
c3QgdG8gbWltaWMgcmF2Yl93YWl0KCkgd2l0aCB0aGUgdGhlIG1hc2sgcGFyYW0gZm9sbG93ZWQg
YnkNCj4gdGhlIHZhbFt1ZV0gcGFyYW0uLi4NCj4gDQo+ID4gK3sNCj4gPiArCXUzMiBjc3IwOw0K
PiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwljc3IwID0gcmF2Yl9yZWFkKG5kZXYsIENTUjAp
Ow0KPiANCj4gICAgSG0uLi4gSSB0aGluayB3ZSBhbHJlYWR5IGtub3cgQ1NSMCdzIHZhbHVlIGFz
IHJhdmJfY3N1bV9pbml0X2diZXRoKCkNCj4gc2V0cyBpdCB0byAoQ1NSMF9UUEUgfCBDU1IwX1JQ
RSkgb24gZXhpdC4uLg0KDQpPSyB3aWxsIGRyb3AgcmVnaXN0ZXIgcmVhZC4NCg0KPiANCj4gPiAr
CXJhdmJfd3JpdGUobmRldiwgY3NyMCAmIH5tYXNrLCBDU1IwKTsNCj4gPiArCXJldCA9IHJhdmJf
d2FpdChuZGV2LCBDU1IwLCBtYXNrLCAwKTsNCj4gPiArCWlmICghcmV0KQ0KPiA+ICsJCXJhdmJf
d3JpdGUobmRldiwgdmFsLCByZWcpOw0KPiA+ICsNCj4gPiArCXJhdmJfd3JpdGUobmRldiwgY3Ny
MCwgQ1NSMCk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAg
c3RhdGljIGludCByYXZiX3NldF9mZWF0dXJlc19nYmV0aChzdHJ1Y3QgbmV0X2RldmljZSAqbmRl
diwNCj4gPiAgCQkJCSAgIG5ldGRldl9mZWF0dXJlc190IGZlYXR1cmVzKQ0KPiA+ICB7DQo+ID4g
LQkvKiBQbGFjZSBob2xkZXIgKi8NCj4gPiAtCXJldHVybiAwOw0KPiA+ICsJbmV0ZGV2X2ZlYXR1
cmVzX3QgY2hhbmdlZCA9IG5kZXYtPmZlYXR1cmVzIF4gZmVhdHVyZXM7DQo+ID4gKwlzdHJ1Y3Qg
cmF2Yl9wcml2YXRlICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7DQo+ID4gKwl1bnNpZ25lZCBs
b25nIGZsYWdzOw0KPiA+ICsJaW50IHJldCA9IDA7DQo+ID4gKwl1MzIgdmFsOw0KPiA+ICsNCj4g
PiArCXNwaW5fbG9ja19pcnFzYXZlKCZwcml2LT5sb2NrLCBmbGFncyk7DQo+ID4gKwlpZiAoY2hh
bmdlZCAmIE5FVElGX0ZfUlhDU1VNKSB7DQo+ID4gKwkJaWYgKGZlYXR1cmVzICYgTkVUSUZfRl9S
WENTVU0pDQo+ID4gKwkJCXZhbCA9IENTUjJfQUxMOw0KPiANCj4gICAgQWdhaW4sIGRvZXMgaXQg
bWFrZSBzZW5zZSB0byBzZXQgdGhlIElQdjYgYml0cyBpbiBDU1IyPw0KDQpPSyB3aWxsIGRyb3Ag
aXQuDQoNCkkgYW0gYWdyZWVpbmcgdG8gYWxsIHRoZSBjb21tZW50cyBhbmQgd2lsbCBzZW5kIHY0
Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gKwkJZWxzZQ0KPiA+ICsJCQl2YWwgPSAwOw0K
PiA+ICsNCj4gPiArCQlyZXQgPSByYXZiX2VuZGlzYWJsZV9jc3VtX2diZXRoKG5kZXYsIENTUjIs
IHZhbCwgQ1NSMF9SUEUpOw0KPiA+ICsJCWlmIChyZXQpDQo+ID4gKwkJCWdvdG8gZG9uZTsNCj4g
PiArCX0NCj4gPiArDQo+ID4gKwluZGV2LT5mZWF0dXJlcyA9IGZlYXR1cmVzOw0KPiA+ICtkb25l
Og0KPiA+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcHJpdi0+bG9jaywgZmxhZ3MpOw0KPiA+
ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgaW50IHJhdmJf
c2V0X2ZlYXR1cmVzX3JjYXIoc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYsDQo+IFsuLi5dDQo+IA0K
PiBNQlIsIFNlcmdleQ0K


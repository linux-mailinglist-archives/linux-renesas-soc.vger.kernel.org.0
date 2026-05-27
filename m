Return-Path: <linux-renesas-soc+bounces-33233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG4ZD14kF2qu6wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 19:05:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9B5E824C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 19:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D07A3024611
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 17:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF3944A708;
	Wed, 27 May 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="v1k57m1g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3D444B687;
	Wed, 27 May 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779901531; cv=fail; b=msHwsATS+QcRYKCVcPrI/DdbW7e5ai2BKdYMFQSzbCUjmVQSwewMshNQvNBL8VMXi6GG8JlxDNNAixJuqVPhgOkYOqwK6IQU//GN20WO1iNyKbQe4MoQONCidP4+5nN9qreDT7P4fxZAPIbYRcgbfAgZHm1+b6YYaeM/ea5tKes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779901531; c=relaxed/simple;
	bh=CxPI2o9MJ4Qb8zMH7aZnh5Ycpb1w1Kv0Jak5GMWDfwk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AWbTpIUt/iJCpiMUBbCHZP/jZE/9gMHy5cXpCUzzphP1cVLmssxyCaOT0ZWh2YAlKCLKNpfPyZyMHS+SeIsRIYcI1Slx56ATjzkJYf1FjVWIJAjhpEjvzMqkHRqc9TsJ39I+ufc1JnczXKVvLGeKvLCCLSCuCufVLnzsinzNFzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=v1k57m1g; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGd2s2YdTNszrSCBGLkp+/B0QSC7/ofK4HOWjGc9ns9NTbJn6wcI+g1TG4hbJmkd11hLBufkUixGMtQT6zGTWiH2lLCD7dxVeRj23TOXQL0XpXPdiL7IGKN0Lxz/NPg+NsZK9DlM6SFaWrqL9N+qmux4rT5391p8WyVbmKShrqLRaHJZ/zN/esLDnyn3Jo9uDrPKADuOIv8e/R6EU7MJIh9xP3KqJ5+qfz+TMG6ybC74z5IItVKmJp/qs+idK4cKJDqSkWAwHnc3RmiiB2zbzxbbVQdhMAQXEd0k8ZP1Gof0jvFFS6gDVwasF1f/NAm9IJn/2nmJLwVCvacwyoKsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxPI2o9MJ4Qb8zMH7aZnh5Ycpb1w1Kv0Jak5GMWDfwk=;
 b=YkMEHl0X/iUfjHfNzD/0uFEOVPxHRY2NuKz9pXSsyxPnTlemR7GKJZr8+nGpIKTUhdwZaVq97WYBWhD1mDUasEXHyOXpIPMMFTm4dLXSWdHQlMyKDdM4tP4tBDoKguq881cWd2oyNzcFl/h9EhP/K2vT7JL98WFwZfW2vZKwf7MmidoOQ2krPLewpuUabrk9EYn9wnJzJUIWO6Fw7rR2Y3OZJPdITY5o5vGdWYa0g6rvbLrX2gCWFjOlQk629fG6DLFaLNEYrAWsQUAoVq4CpqHVkJ7LIBcZzRN1fsZx+VojR/3U9V2BrGEBqOv3p3NO2zqiXnVSalURIq+rif+DNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxPI2o9MJ4Qb8zMH7aZnh5Ycpb1w1Kv0Jak5GMWDfwk=;
 b=v1k57m1gv6nfoJLlSQGLcqRZWu0IRcBnlWA9opIG2ztVoQZhCYS2kV3xIe8rZoDbl9uCJeSmWqeQbvGWPtzVuvSk2cwXktJLSULG3C3tVPSPczIW+aWWBZyHYGh4uxnBBtHSLs2WkmNpC0p6sPRm/LWxsCZwpMUsl+ohGUKJp1s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB6648.jpnprd01.prod.outlook.com (2603:1096:604:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:05:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:05:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 4/5] arm64: dts: renesas: rzg3l-smarc-som: Enable versa
 clock generator
Thread-Topic: [PATCH 4/5] arm64: dts: renesas: rzg3l-smarc-som: Enable versa
 clock generator
Thread-Index: AQHc3IvqTeNdpd5Dt0SghVFBc5ji9bYiLqcAgAANbUA=
Date: Wed, 27 May 2026 17:05:25 +0000
Message-ID:
 <TY3PR01MB11346BC25EDE3E973921BED7D86082@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
 <20260505123708.134069-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdUmZuoMaF35wBAtMqB5R7wy6ei2fV=bcvdju3AFQ_DZjg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUmZuoMaF35wBAtMqB5R7wy6ei2fV=bcvdju3AFQ_DZjg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB6648:EE_
x-ms-office365-filtering-correlation-id: f73a173e-a420-4c3c-e1fa-08debc122566
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|3023799007|11063799006|4143699003|18002099003|56012099006|22082099003;
x-microsoft-antispam-message-info:
 2sGb6ucAKcOvai1AnmYL47GbnDUUQQdN+abw111X8rVNBnHk9UlT6/0EXZKPzo0m3ZF3Z3ObP1NAPZNq+aDo/hjHyBrKMOA8A/zQWJzXBag3QMuU/oSOTnhAQY/Pm22aWQKW2juJaOK9vNVLPZCVhCHSSQGanx4fqpS4tzS9A/aiaQCQ5a78AG9ALLt0qdJbE+XU6grKutyzAVKSpGkru8kqHQFutbooacI5Mk48tSMDJyxbp+B9Q+h+M5wwZVLcYFa7e8Ht1EULDwjjwO60KYzML0yMFkkEjoYeCOQV4BcPlruFBWEZ2KaahbqBKjZFbgQ9Q0M9Wz+4vCJcs2hAo0zGjjOGvw2IWrhraFojgooBLqgxjTlZMcmxxmfA0AUnULFCWBb4Lu4iJGlYmc/FrxLahcxRLxneLc7LRcc7HfZTpSwEn/4OhC3dO5WjPh+GuenXCA89vMyA5PSjK7D08rSzxwVPmg/sx5orFBMW7AFkU+o2qH7BjBrN5/hEfIMJnWs6t0OjlS/6tS1lP/+Vb6qTwcNB3wa0is0804ibGI+4bIrCuNfUVfb+lHlJagFyeciUE5P1yAF7ViXd9L1AAzVFry/MeFAtEhpkTldrZmF4UD/ztga+CC8HoQOD/3OCoaBUDiNGu7o+MZijkWSKQ7gLKpegjppeoLWiPOMr7I2UjTWeqH4V1To+qKKuWOsYJIZVg4oeTALkFaN0zsqq/x6t19l4Ym1vvLpKAJyDIE7PkptgK3wXe/tOz5uNZBe6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(3023799007)(11063799006)(4143699003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z1FXbkZuMDQxVWJnejRIanljeVdhcGNVcUw1ZXczTkhNdUVPcURpaHdic3pC?=
 =?utf-8?B?a2pLdmR1SlNUL0NYRHpsYjQzYUwyN2Vtc05EQ2M5ZFlNWnpqM3VpYUdCQzhu?=
 =?utf-8?B?R2M0Vkp4TnhaRk9vNFpFRVdWUGNGdEV5ZjB3SlhncG1sRVAzZHQ2ZkxNbFYz?=
 =?utf-8?B?cDhjdDJJNTlDSVY2algrNnA3N09iaWE4dXJ4enpMNkxpVFJlQjl4cEFxRVVP?=
 =?utf-8?B?WHkxMVhkT1cwUmlwKzZQVlBHaWlqRW96TlpkWHpZcURRT2UrdWV4NmhtL1JV?=
 =?utf-8?B?TkRrSjVBcUQ3Y3hlY2RLSUl1cGZUaUEwU1ovVFpBZDFhUnFHNUMrbW5naTZk?=
 =?utf-8?B?L0pGRk5PTFBMd3RuVUorTjNIQlpPcHE1eTMyUGIyVWRjZUE0cU5HU1VnTll3?=
 =?utf-8?B?dzJ2eEhhVitOM1hOU2Y4WUlsa083ODN5UHlvb0dOY2RhRTM2cFNxTTVCTHRh?=
 =?utf-8?B?bEM5NmlVQVE5bWhiM0xkcHppT1VKL3c5K1AzYkg2OWZNdUJ6eGlsVnBBY2ZD?=
 =?utf-8?B?T0JSSDRSODl0KzB3VnEvdlpRcDUrOUE4Ums4SE5jYnIyUDk4OUkrSk9MczBm?=
 =?utf-8?B?Q1BDZUhjWUdqcUNLR01Sc29seXB4bHQ0MnpKaWRpdFFIQ28rUlZLZFFMM2NQ?=
 =?utf-8?B?RFh6S2dNSDU0VWh5SUo4TmoxTys4S2ZjWnhOZ2hNYnVaOVBWeitiWS9NU1NB?=
 =?utf-8?B?aERrM1VjdzZ0bnFnT3FvNDVXR3RaOHVhQjBiOC9BMlJvY0N5VlMrK3hSaG9Z?=
 =?utf-8?B?U25tZ3lnbFI1SXgvSG0wRGRGSlJpdUx1ZHJtS2NyMGx0TGRzQWxIT29MeE1B?=
 =?utf-8?B?Z0F5dkpVVHpQRUMzd3YrT01UdUcrTDc3VEp5ZFl6NitncFBrcE1JWlVTSWM3?=
 =?utf-8?B?Y3M4N01SRUNlOGtkeWQzZmY3c0UrZFJwNGZLbGhZLy92TERyZUpRVzkzcHM3?=
 =?utf-8?B?T0xUdlFyNGUvOTAyYSthZlpwSFE4eDkwRmovQTBYTFE1WGg1UWhOcm5Xa3E3?=
 =?utf-8?B?Yzk2alJsMFM5Q010ZU1ONFozSzN0cTRiYm55QWxYRnA2R0o5LzRiYTVOL2l1?=
 =?utf-8?B?VDF2NWNnbDE2QVpuZTE1WTBXZ0x5ZnF3NktOQU5hVnovc0ZTeE91MkMrUE13?=
 =?utf-8?B?RGhIS2NVSVdVOE1GcFdhMTJEak1UWnhOT3NLYndzZjloNWttU0hLZlQwYWR3?=
 =?utf-8?B?YkhWbFVmd01wdHlmdkxBU1NSZnR3dThSYlhUZ2NCWU9vTjRjZ1NIdml6M0o4?=
 =?utf-8?B?QUU5eUNzbkRRQ1NDWG5jTGlvbFB2eFlVRFVUelFlM2lSZVFQYnhUcEE3RldC?=
 =?utf-8?B?TEl6M3g1eDNUYnNVNHgvNWljMXZrb3FkVVBjNzJVbG96UGloSHF1Z1I4UGpO?=
 =?utf-8?B?YlQ1MGVveW1iRVhMYnAyRmJpZ3ZpU2VjTTFGb2NZZCtPeFJadkV1azRoakVJ?=
 =?utf-8?B?dmRnNDZoMlcyVjVlTFluMnZXVG4rNXNHYWtMci9aOWh5WE5hTWdXekxUTXRl?=
 =?utf-8?B?MGpkbHNRbWJha3lkS1RtckxnaGp3cWkzb0ZxRHJCa0wwS1gyR2h6UTFaNi9W?=
 =?utf-8?B?UEFrd3FLT3Blb05kZDhLcmZIWWtLR1JrdlhXdjdjaGdDV09MdlpwWkdKZUJi?=
 =?utf-8?B?bFRmR2FRTDMwVXorWkw1K0phS2RzQXZIVTExeGU0dlJSQjJVWGZlY2lqa0FE?=
 =?utf-8?B?K0wwU1dBUEtxRnd6ZWQzNlRYS2Q1eC9mRWd3UUhGZUlubEZ2VFZmVkkveUdU?=
 =?utf-8?B?ZDZxc2RPQ0FQVFI5Q29JQnZudGNlYUgva1JkVU9xNHozQWlnejYweUdmUk4r?=
 =?utf-8?B?ZGpEdm93cGxFeitQNzlKVlJzR3dIbHRrM2NCWWRUVERQS2gwZjE5U28vVC90?=
 =?utf-8?B?c0g0dHYyRnoreSttZDdPNHhKZmlib1JPbXkyVXFvY1R3K3ErMzFuYmJBR1pY?=
 =?utf-8?B?TjZEcHhYUW44MlBHVjdjS2Q1c0Zid0xxRjhQTTVWaTZQT3o2ZXY1ckxvYWFT?=
 =?utf-8?B?bFUrRTAxK2NQTDZ5V1ByMWdKbTQxMDFKOFhWcTZoa1hXT0I3VXc5N3gyOHNE?=
 =?utf-8?B?a3ZwL0JPbmFzdkpuSGZ1YjUzZWxlMTUreGMyTHBPckxBUkpWbXBKeC91THE1?=
 =?utf-8?B?MDNnRVpkQjNBQjB2UWFpS3IwRjlDN3IwdndaTStBTkhaRDQxbzNMWSs5R3ZT?=
 =?utf-8?B?RTNtNjcvcThSK0RldmNvd1lMTzh4dEVkWmNqNzc5SmtnWGo3VEd4ZDExa3F0?=
 =?utf-8?B?OVNMd2ZJYklNbEIxMGdvRk1PcUU3T0FabFNFUHZzOW5Hbys2RUU2elZ4aFZO?=
 =?utf-8?B?ZUtkamNsbXVIdjFIdVBrVjRWbThpUTd2a0hvK290UUdNOVR6TkE4UT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73a173e-a420-4c3c-e1fa-08debc122566
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 17:05:25.0628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oy/TqHG/Nub4e4E63eHMVEv/g7Bs0G4otc+1LL6xPk0GRTxd6llsn2tyf2QovKfmh/9gj3XigCvOzrXwVLpwK4iTj1nrBVgexWZBXDGn7p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6648
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33233-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.68:email,2.220.108.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: B6C9B5E824C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI3IE1heSAyMDI2IDE3OjE0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
NC81XSBhcm02NDogZHRzOiByZW5lc2FzOiByemczbC1zbWFyYy1zb206IEVuYWJsZSB2ZXJzYSBj
bG9jayBnZW5lcmF0b3INCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghDQo+IA0KPiBPbiBUdWUsIDUgTWF5IDIwMjYgYXQgMTQ6MzcsIEJpanUgPGJpanUuZGFzLmF1
QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+DQo+ID4gVGhlIFJaL0czTCBTTUFSQyBTb00gaGFzIHZlcnNhIDVQMzUw
MjNCIGNsb2NrIGdlbmVyYXRvciB0byBnZW5lcmF0ZQ0KPiA+IHRoZSBiZWxvdyBjbG9ja3M6DQo+
ID4gICBzZTE6IEFVRElPX01DSyAoMTEuMjg5NiBvciAxMi4yODgwIE1IeikNCj4gPiAgIHNlMjog
UlpfQVVESU9fQ0xLX0IgKDExLjI4OTYgTUh6KQ0KPiA+ICAgc2UzOiBSWl9BVURJT19DTEtfQyAo
MTIuMjg4MCBNSHopDQo+ID4gICBkaWZmezEsMUJ9OiBFVHswLDF9X1BIWV9DTEsgKDI1IE1IeikN
Cj4gPiAgIGRpZmYyezIsMkJ9OiBOb3QgY29ubmVjdGVkDQo+IA0KPiBBbGwgb2YgdGhlc2UgYXJl
IGxpc3RlZCBpbiBjbG9jayBvdXRwdXQgaW5kZXggb3JkZXIuLi4NCj4gDQo+ID4gICByZWY6IE5v
dCBjb25uZWN0ZWQNCj4gDQo+IC4uLiBleGNlcHQgZm9yICJyZWYiLCB3aGljaCBpcyB0aGUgZmly
c3Qgb3V0cHV0LCBzbyBwbGVhc2UgbW92ZSBpdCB0byB0aGUgdG9wLg0KDQpPSy4NCg0KPiANCj4g
PiBFbmFibGUgdmVyc2EgNVAzNTAyM0IgY2xvY2sgZ2VuZXJhdG9yIG9uIHRoZSBSWi9HM0wgU29N
IERUU0kuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
emczbC1zbWFyYy1zb20uZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yemczbC1zbWFyYy1zb20uZHRzaQ0KPiA+IEBAIC00MCw2ICs0MCwxMiBAQCBtZW1vcnlANDgw
MDAwMDAgew0KPiA+ICAgICAgICAgICAgICAgICAvKiBGaXJzdCAxMjhNaUIgaXMgcmVzZXJ2ZWQg
Zm9yIHNlY3VyZSBhcmVhLiAqLw0KPiA+ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4NDgw
MDAwMDAgMHgwIDB4NzgwMDAwMDA+Ow0KPiA+ICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAg
ICB4Ml9jbGs6IHgyLWNsb2NrIHsNCj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJm
aXhlZC1jbG9jayI7DQo+ID4gKyAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsNCj4g
PiArICAgICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsNCj4gPiArICAg
ICAgIH07DQo+ID4gIH07DQo+ID4NCj4gPiAgJmV0aDAgew0KPiA+IEBAIC03NSw2ICs4MSwyMCBA
QCAmZXh0YWxfY2xrIHsNCj4gPiAgJmkyYzAgew0KPiA+ICAgICAgICAgcGluY3RybC0wID0gPCZp
MmMwX3BpbnM+Ow0KPiA+ICAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiAr
DQo+ID4gKyAgICAgICB2ZXJzYTM6IGNsb2NrLWdlbmVyYXRvckA2OCB7DQo+ID4gKyAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyw1cDM1MDIzIjsNCj4gPiArICAgICAgICAgICAg
ICAgcmVnID0gPDB4Njg+Ow0KPiA+ICsgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47
DQo+ID4gKyAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmeDJfY2xrPjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmdmVyc2EzIDA+LCA8JnZlcnNhMyAxPiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZ2ZXJzYTMgMj4sIDwmdmVy
c2EzIDM+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnZlcnNhMyA0
PiwgPCZ2ZXJzYTMgNT47DQo+ID4gKyAgICAgICAgICAgICAgIGFzc2lnbmVkLWNsb2NrLXJhdGVz
ID0gPDI0MDAwMDAwPiwgPDEyMjg4MDAwPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8MTEyODk2MDA+LCA8MTIyODgwMDA+LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwyNTAwMDAwMD4sIDwyNTAwMDAwMD47DQo+IA0KPiBX
aHkgZG8geW91IHNldCB0aGUgY2xvY2sgcmF0ZSBvZiB0aGUgKHVudXNlZCkgcmVmIG91dHB1dD8N
Cg0KSXQgaXMgYSBtaXN0YWtlLiB3aWxsIGRyb3AgaXQuDQoNCj4gQ29weS1wYXN0ZSBmcm9tIHRo
ZSBEVCBiaW5kaW5ncyBleGFtcGxlPw0KDQpZZXMsIFdpbGwgZHJvcCBib3RoIHRoZSB1bnVzZWQg
cmVmIGFuZCBkaWZmMiBvdXRwdXQuDQoNCkNoZWVycywNCkJpanUNCj4gDQo+ID4gKyAgICAgICB9
Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gICZtZGlvMCB7DQo+IFwNCj4gR3J7b2V0amUsZWV0aW5nfXMs
DQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxr
aW5nIHRvDQo+IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMNCg==


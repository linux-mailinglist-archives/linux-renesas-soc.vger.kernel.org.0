Return-Path: <linux-renesas-soc+bounces-15637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7271BA81A53
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 03:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCCA53A83D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 01:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CA314F121;
	Wed,  9 Apr 2025 01:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ds80blh7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D797130A54;
	Wed,  9 Apr 2025 01:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744161034; cv=fail; b=HSeWrR670SQheKFaAhx9IS/rb+e+nc37YvxS3sz7dp2VGlvM6Vc6aLIEfopQqae0fcvMo655EmrBqWY+dZ0/63ezyNN9FbKlqvQfeDVYppAfmP7C+DVvr97s338pAg42dVN/IKqk2oF/KsYuQ9cWBGwBkaVdseg8uEDgWaqrJGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744161034; c=relaxed/simple;
	bh=v7lPzhHOtUGvERv++L9ktxYxQbE1ut9CRji2cBjPXzk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F6O7NI8pP7joGGOWXHBWCb8pmRgZA7QIkC2zoLzOypfQHVGIivFPv7PJcYJ5maXF4wzVzwGvZyotBwZfgg/m4giNbEyTaT+PeGRsT2YlSuEiwPu3N0+mjPK+u0VqqQTEIrZBc2d8pCSvKrx/kNVFTFEUfP3bbbIr5xFyTbGYFPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ds80blh7; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqasx5kneTP0dvORnp+iRjGwaGywbYEh77ZuR/M/HZ+WWP1lTh/TxPdM0RNHZwjR6yiGrsSgn2S8OTMQgRQIX/KQb178p3AseTSVJOwjgUI0QE+qsLdPoIawVF2+oBD9z4One9CYLvOqZgRO1+C75qoTNrCV1H1CAB+PY/0wswYz7RLocmyb1FB/6gDWBbQa9vlHamnFyKb7k+6EtXuDVQ6pd5EofaICmCOq6O1aJBBS12Q8E0XWVWjY/DYk8lf/nu9FIlk4IXYokLhsKvcAMj0yhMprxgryH5M7fgM0EuWs8ncDPqmWTgpQ59XXqkxXkRIN4b0z7W6YG0Z4UfqJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7lPzhHOtUGvERv++L9ktxYxQbE1ut9CRji2cBjPXzk=;
 b=Hrs4CcLmWWUTBJ4GjPebfestOkvm5yWwD5ZHSIZOjatnIG380r2vEzhjzPxa+XwDt/RG1nEc62aCKwlQsyK8mfemNVzQqjVU7UFR8+/zk5LXhkTCW2S1R8PoBV/52fht+avpDjf+N9njj9V81A4QonxcJWSzNDcxGJ2eMpY+eFifBiHeniDe2LJI8r0SSrcSUkR69H7C+6Amq6M3RIo/v8j/yHPGWsKmsvGX75uHDTDEVamkc3Yc9+kkb7phV6F/ykzHB8P48Fd0xik78SVZv/poALvEP0XU32+8u0gY9+x5P+s/V+PQWlhzZYr/HEA6d8WU332MaiIPZ2TPSibLfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7lPzhHOtUGvERv++L9ktxYxQbE1ut9CRji2cBjPXzk=;
 b=ds80blh7WWo4vuGl4eT7bxFPdq4JiV2TIyqpN+MXRGFfOA8ZbJ+XfpLbKjVzB8NuHFLo9GRNnF3dUtU7W1uXTVEzMsfAgosfha2JNQXDP/Szy9vO+V2fYgfrWjWd3I40iwpKrVOGL7hxst7hn/htI6Zlwt5eMssLxEbBY+pSles=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYYPR01MB13317.jpnprd01.prod.outlook.com (2603:1096:405:164::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 9 Apr
 2025 01:10:29 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 01:10:29 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Prabhakar <prabhakar.csengg@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
Thread-Topic: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
Thread-Index: AQHbp6raLCyMPN3kxkGUjRK8DG3KN7OZk3vAgABW+YCAAJyzEA==
Date: Wed, 9 Apr 2025 01:10:28 +0000
Message-ID:
 <TYCPR01MB110407080D95D7EE14CFDC5A5D8B42@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <CAMuHMdWXid=9NXUULSA-vedZyjvDKJWt2KX8_Y=arMOp_-gFRQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWXid=9NXUULSA-vedZyjvDKJWt2KX8_Y=arMOp_-gFRQ@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYYPR01MB13317:EE_
x-ms-office365-filtering-correlation-id: 9bd3676a-5905-445f-6103-08dd7703515f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?UDVPd1VlRU9OcDJHZWx6NGtiV1V5UXdwRlBTSkRwUHNSSmRsSXlWTGRRdzR1?=
 =?utf-8?B?QTFDTnJFejdqYjdXVzhsNHFrUnAyWHowTE1uaS9xLzhVUWFHcVBvaVNRU1Qx?=
 =?utf-8?B?aHhRbjRvenIwUHp4ZWxiempUVS9USDZZdHRML0ZIdGFuV0hCcE4ySW9Ia1lF?=
 =?utf-8?B?UkZSZGdXMjduejdEckxsVG41TkFhMEtHMm5wWHZ1VHg3cWVHQyttUW9ZSVUv?=
 =?utf-8?B?UXAxSk11bkJ6MHhLaGhLNGlVSmdXaDl0cmprSGI2bFZsRi93M1ZnVjJvTVNk?=
 =?utf-8?B?dlhJNDhac2JaV1VkNXRYTFJ2UnBScytja2xUMytPRW5QT3JvbGJhSEdUekwv?=
 =?utf-8?B?N24xb29NL1l5OTY2UG5UWE1KMXNtbU5qa2orbEZyN2VaeU1nZFBtemd2eDNp?=
 =?utf-8?B?dnhMamlLSFl2VG1rOXdCamJQaHplb2tNWkpyMWU4UXZOdHVwbjB1YWdQSzFH?=
 =?utf-8?B?bmJQMkl3WDRDT2FLREtGZ09kV2NmTHlTd1l2RDVoV1JXdUN3Q1R5aFVGcW5S?=
 =?utf-8?B?TS9CMTRjZUt6RnQ5eUdxd0F2R2x0U25uTlNDT0J0RzRzenFwaXVMbXhmWkFt?=
 =?utf-8?B?MTQxS3JlWU5kRk80Nkg0S1hzSmcwVXdKSHdENUdpbHZpRkdpSWNZMXZOUzBS?=
 =?utf-8?B?a1RwNjJXWEpwRGN6eHdpUlloclpacS9XTzRxcjdBZ1NTTUtUb1NJaG1ibmlM?=
 =?utf-8?B?dUR6SHhSbW5EcEM3L3RUaS9YM2xaR08weW9pYVBWUUREMzlmR0RyNWQwa0V5?=
 =?utf-8?B?b0N0T3J2SFlLc0I1Undjb3BtM0NLU1ZwZmJGS2JhTTJ0eEFLMTY0cURyQWpz?=
 =?utf-8?B?ODhOdmM3R1E1YlVFWUJCVXU1N2RYRHQrME1SZzFnQktGeW9aQndSWFVOZmxJ?=
 =?utf-8?B?QllWQ2lTNWdyUHhXTUE3YnY2NHBUUk9UODhSRnZDR3dQTUVuZ1BqcDZVK1E5?=
 =?utf-8?B?d3Nyam1WZE1LVjhEUkdkTXV0bXlHSWF5SEJWVGpLdGVIRU9TZ0RuTng4MFMw?=
 =?utf-8?B?VGJVTUg4YW43Q3N1VzFuME15OHVKam9MMGcyR0orcVFuQjYxUEpkNFFBYU9R?=
 =?utf-8?B?SzJxczd6ZnN6MWxkWUpXWk1ubXVhR0M2bnBKYm5CR2QvV1IvYVUrVGduNi9p?=
 =?utf-8?B?UkkzOGxvbjZsa0x5NjV0K3lLR29FUXdlcXdCWUVrOEpFY1kvb0QwN1NWU0xv?=
 =?utf-8?B?N3cxOTdEZkd4NUh1bVgzVUZ6VXJsbEllNkthd2l3V0FKalErdEpRTDJ6OTFT?=
 =?utf-8?B?MTZ1c2RCdDdNQVYvQXZ2R0d2SHFnNUNnNVdINVhSUTByOVNGMUljcmIxQXhk?=
 =?utf-8?B?Z2JScHFBd1lIaEpoVWJZMUNtNDNhVk5OUU1xbUhiVFJvMTBodEtSRDhweU5K?=
 =?utf-8?B?SVp1OGJxRkdOMmFudnIrdWdFdDJrOGJEazdSV0U2UmpjTVQyb29QRjRTNDZk?=
 =?utf-8?B?b0ZKbDhSWjJ6RHUyWllFSmUyclZFNEdrdDN4Nlc0SDZDaHVhUjFFd2IzT29B?=
 =?utf-8?B?NDB0ZzVaTlBTQTdNZkpmSG15c3J1Ti80SkhjMDVuN0Z6T1VqdnorQVcybEFm?=
 =?utf-8?B?NWxyT0FDZ1Rta0JKVHNMb3lCY2dDUStONUtmN0dYS0RmQTBrNjczeWJNdTE3?=
 =?utf-8?B?ZHQ4SzRlYVdGZUNCOUx4cnFwdzk5azlnS3kyM1djTHA5U1IrOTUzTTR1TGRo?=
 =?utf-8?B?SmRZVXFITXZyY3VwOGd6UUNRbUQwdHNOQkZiSDNJaDdWc2cvUjVvd1plY0pL?=
 =?utf-8?B?Y2tNdnE3QVY1YTVUUkoxSXJzeHFVSFU0b2RyYjhjQkt5V2xSVFJYQ0lqYnky?=
 =?utf-8?B?dHljK3BkaTA4aGhoK25KdnFubzhGZWh4Zm9taTk4ays5eVZhQkdrVXNPVERx?=
 =?utf-8?B?aHBrTWpUMjN0V0Q1cnJuMzd4NkUvaVVaRlZZcGwrK3lqSVg1U0NNMFdvR2hE?=
 =?utf-8?Q?KC0xyVr22sryl/WnZVig0ejF4z2zOrMg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWlGSXZNOU9WRkluS3FEamk3OEdoKzNYeEk2d3RpYVgxQ3JvM0JaTGNqci9J?=
 =?utf-8?B?TURBVnlWSUtGNGhLMGM1dmZkdEEyRjloRnU1MlBQUFFlRkw2MlR6dFlLV2dR?=
 =?utf-8?B?UkNJNVk5b3RnNTZZZG11TVA1bnBLZ25PcnlQTXhsN3MzY2ZkUGQrdFc2Wnlx?=
 =?utf-8?B?RGEvTGxsSXhYc3lIZnh0SzhpNzZ5SlUzOTVUcllzemxyNEN3RUt0a3hLeDZh?=
 =?utf-8?B?cndJczgxZVh2cER2bmhpRzF4NHpvZVlxUWs1WnRwcjFFakFGaVJRMXV0REV5?=
 =?utf-8?B?TStXZVA1REx6TjFwMjZ6dFBqMWpkMzFlRndsTFhnWHNKTDV3dEFMMlNlRnJy?=
 =?utf-8?B?dXFxS3c5MzVHNWdkbDNmYUZZSmR3VFljMGJpN0xCUDE2SGZaOXBjSjhIbXpl?=
 =?utf-8?B?WXJ6RFJLUUp2L2ZXdTROZmVFMDlYaFlvWjFHQkFHcG9zYXMzc1IxcDBxT3B0?=
 =?utf-8?B?UDU1L1BEY3BGRnRtOVcxNmg5R21DNlFuKzE1eW5mcEJnWnhnVks5ZklZS3dN?=
 =?utf-8?B?bWdSaHJEU2djeUJmVDF5SXU2S1hTOXhzRG16bTdVcjlHOTc4c0NBN01xek1u?=
 =?utf-8?B?WmNkZ1RtOTFzL3pmRitiSG1zZ09LU2E3OXVPdjFvVHEyZWt2TCt4Y3hRaVZH?=
 =?utf-8?B?VllSTE90eWQ3VUEyOWt1WHhKdHNxMWtWaFZiSkVObXZqZlRNTkJMTUtLOUJv?=
 =?utf-8?B?KzdXQjVnanhudWg4QzZkZTVvZFhCaGRscXhwT0x1QW9sL3ZZQ2xOS3dLcThw?=
 =?utf-8?B?Ym1ZKzhvUnMyMVVjUHRQbDNHakVWRzh1dVFFaWU3d1pVeHh4bXJOQ3I0Nmhw?=
 =?utf-8?B?WktOcERGK3dBUXJObml1K1hRd3JTRGxDaXRKZDlHSFF0RTFuVjJkR2JFYmdE?=
 =?utf-8?B?K3N3blpjbWhGRUZGSVhER3pKT2lWVGw5Nm9wNUw5OWpTYTJkRGZRQTNkMDNj?=
 =?utf-8?B?REh6N0pIUkxTRlZlRCs5bEoyWS8rUDAwUmVERU5NNzg0THZWMHZ5Q3ZhS2Mr?=
 =?utf-8?B?OFdhN1BneGhiem9IQmtWRVZIdjFyL2NqVjM2clJRTXlwVkVRQ0x1aFhkNDla?=
 =?utf-8?B?Nkx4NmdWeU4zSHJUclhOaEY0b1N1YW1vQ1RqK1IwWXFIZDVjY2hZeWd2bEFq?=
 =?utf-8?B?RmJyME9qL1N2Z2sxQ1RKa29ocnJFNHZiZFd1ODlwMXh4Ylg2MjM3ZlNIVnNK?=
 =?utf-8?B?S0NFMmRCbWN6Rzg1dElKNjNoZ1ZkQktRTkt1dXJINW16eUJSV05HUDNBZllU?=
 =?utf-8?B?VzRyT0pIRDQzZG1QTlhuaUg4THphNGVBaWExZTR4N3pFRXFZUERUZWJOalYv?=
 =?utf-8?B?QzV2Y01YU252MloySEQ0NmpSNGlsUVpQVDlYTHQ0YUlDZGVmMEMzVXpVTzRW?=
 =?utf-8?B?dzVkRjJ6SGxsRW9aM3N3djNxREhWZUxPS1RrZFNJbDhHNkJUN1lLWHpDUUNs?=
 =?utf-8?B?RXlTdStScUlQcTNwNGdLWDA3eGxDVVh1N0J2OUJCU3JsdmxCSDBNZmpRSTJ1?=
 =?utf-8?B?YTBiUVIyQmhnQkpuSERLSnhlQURzVXJYelJUV0RML1NxeFVHNDBySVpYV1R2?=
 =?utf-8?B?bThxRWdHTWFsYWdFRHhnMDVlNThESmxxNXZST3k1S0pHY2FGcUFwQlduYkph?=
 =?utf-8?B?S1BWZkwwY2pTUFNTUkorTWYxSG1kUGlZYkcrdENmNEtHWEVDWUd5N0w4VktP?=
 =?utf-8?B?UlNTbE9kdDg2cUNJMHB2Wm5teWd1UklZRmJ5VEpCUzZsRzlWVlVnK2VNMU8z?=
 =?utf-8?B?bUY3MlNWOEF2Q2FqQzF3ZkVEUnlVbS94N0Zqa2l0ODdUdDVoLzNLT0o4UnFn?=
 =?utf-8?B?eDIyZXpITDQ3eWxVY3JVOVh1RnNkd0pMVUFyWXRWVkhJbjNBUExIZDc1TGs5?=
 =?utf-8?B?M2N5Q0pLM2NmWnhRMkFNTWgrTmNPYXNRNHNDRW9WNGZaMHpqQ05raVVDdlVN?=
 =?utf-8?B?dzFGU1AyeTJwRm10TXgxQTI3Uk9QSjBvYU1RaDhjVU5sRUsyWXJiS0UxSEIz?=
 =?utf-8?B?SUFpL2pJODhyTURsQm1sdFJvSUJuYlpQRFNwTGJLZUNtWTR3Vm1Za0hTRFB0?=
 =?utf-8?B?dE16L2xmOEhrNXgxWitEVzROcmU5OVpNbGIwK1Z2enhFUVl2eWtIaml6dEJN?=
 =?utf-8?B?UFZOUVZIMmdMcy9pS1gvQUM1akZzTVVUcWJWeEMyZVA1K0hPZUpYaGEzL3dZ?=
 =?utf-8?B?UHc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd3676a-5905-445f-6103-08dd7703515f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 01:10:28.9742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jBR8df+cvTRHFmUF5ZE/O73l8+Jok9Z0KCi0nYhPHbGEGuVRoAMMg6G+np2okCi/iSHMXwkfEXlN/wDbOfTSqNwuHMfIdGAl6kEnc2wDd0MwfMlbnnlBZGcGc72Y15LJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13317

SGVsbG8gR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogV2Vk
bmVzZGF5LCBBcHJpbCA5LCAyMDI1IDEyOjQzIEFNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4g
DQo+IE9uIFR1ZSwgOCBBcHIgMjAyNSBhdCAxMjo0MCwgWW9zaGloaXJvIFNoaW1vZGENCj4gPHlv
c2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IFByYWJo
YWthciwgU2VudDogTW9uZGF5LCBBcHJpbCA3LCAyMDI1IDc6NTAgUE0NCj4gPiA+DQo+ID4gPiBS
ZW9yZGVyIHRoZSBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZSBpbiBgdXNiaHNfcHJvYmUoKWAgdG8g
ZW5hYmxlIHJ1bnRpbWUNCj4gPiA+IFBNIGJlZm9yZSBhY2Nlc3NpbmcgcmVnaXN0ZXJzLCBwcmV2
ZW50aW5nIHBvdGVudGlhbCBjcmFzaGVzIGR1ZSB0bw0KPiA+ID4gdW5pbml0aWFsaXplZCBjbG9j
a3MuDQo+ID4NCj4gPiBKdXN0IGZvciBhIHJlY29yZC4gSSBkb24ndCBrbm93IHdoeSwgYnV0IHRo
ZSBpc3N1ZSBkaWRuJ3Qgb2NjdXIgb24gdGhlIG9yaWdpbmFsIGNvZGUNCj4gPiB3aXRoIG15IGVu
dmlyb25tZW50IChSLUNhciBIMykuIEJ1dCwgYW55d2F5LCBJIHVuZGVyc3Rvb2QgdGhhdCB3ZSBu
ZWVkIHRoaXMgcGF0Y2ggZm9yIFJaL1YySC4NCj4gDQo+IE9uIFItQ2FyIEdlbjMgYW5kIGxhdGVy
LCB0aGUgZmlybXdhcmUgbXVzdCB0cmFwIHRoZSBleHRlcm5hbCBhYm9ydCwNCj4gYXMgdXN1YWxs
eSBubyBjcmFzaCBoYXBwZW5zLCBidXQgcmVnaXN0ZXIgcmVhZHMgcmV0dXJuIHplcm8gd2hlbg0K
PiB0aGUgbW9kdWxlIGNsb2NrIGlzIHR1cm5lZCBvZmYuICBJIGFtIHdvbmRlcmluZyB3aHkgUlov
VjJIIGJlaGF2ZXMNCj4gZGlmZmVyZW50bHkgdGhhbiBSLUNhciBHZW4zPw0KDQpJJ20gZ3Vlc3Np
bmcgdGhhdDoNCi0gRUhDSS9PSENJIGRyaXZlcnMgb24gUi1DYXIgR2VuMyBlbmFibGVkIGJvdGgg
dGhlIFVTQiBjbG9ja3MgKEVIQ0kvT0hDSSBhbmQgVVNCSFMpLg0KLSBSWi9WMkggZGlkbid0IGVu
YWJsZSB0aGUgVVNCSFMgY2xvY2sgb25seS4NCg0KU28sIEknbSBhbHNvIGd1ZXNzaW5nIHRoYXQg
dGhlIFItQ2FyIFYySCBpc3N1ZSBjYW4gYmUgcmVwcm9kdWNlZCBpZiB3ZSBkaXNhYmxlIEVIQ0kv
T0hDSSBvbiBSLUNhciBHZW4zLg0KIyBIb3dldmVyLCBmb3Igc29tZSByZWFzb25zLCBJIGRvbid0
IGhhdmUgdGltZSB0byB0ZXN0IGZvciBpdCB0b2RheS4gKEknbGwgdGVzdCBpdCB0b21vcnJvdyBv
ciBsYXRlci4pDQoNCj4gT24gUi1DYXIgR2VuMiwgeW91IGRvIGdldCBhbiBleHRlcm5hbCBhYm9y
dCB3aGVuIGFjY2Vzc2luZyBoYXJkd2FyZQ0KPiByZWdpc3RlcnMgd2hpbGUgdGhlIG1vZHVsZSdz
IGNsb2NrIGlzIHR1cm5lZCBvZmYuICBIYXMgYW55b25lIHRlc3RlZA0KPiB1c2JocyBvbiBSLUNh
ciBHZW4yIHJlY2VudGx5Pw0KDQpJJ20gYWZyYWlkIGJ1dCwgSSBkaWRuJ3QgdGVzdCBvbiBSLUNh
ciBHZW4yLi4uDQoNCj4gPiAtLS0tLSBJIGFkZGVkIHNvbWUgZGVidWcgcHJpbnRrIC0tLS0tDQo+
ID4gPHNuaXA+DQo+ID4gWyAgICAzLjE5MzQwMF0gdXNiaHNfcHJvYmU6NzA2DQo+ID4gWyAgICAz
LjE5NjIwNF0gdXNiaHNfcHJvYmU6NzEwDQo+ID4gWyAgICAzLjE5OTAxMl0gdXNiaHNfcHJvYmU6
NzE1DQo+ID4gWyAgICAzLjIwMTgwOF0gdXNiaHNfcHJvYmU6NzIwDQo+ID4gWyAgICAzLjIwNDYw
NV0gdXNiaHNfcmVhZDogcmVnID0gMA0KPiANCj4gSG1tLCBkaWQgaXQgcmVhZCBiYWNrIHNlbnNp
YmxlIGRhdGE/DQoNClRoaXMgaXMgbXkgYmFkIHRob3VnaCwgSSBzaG91bGQgaGF2ZSB1c2UgZGV2
X2luZm8oKSBpbnN0ZWFkIG9mIHByaW50aygpIGJlY2F1c2UgUi1DYXIgSDMgaGFzIHR3byBVU0JI
UyBtb2R1bGVzLg0KSSdsbCByZXRlc3QgaXQgdG9tb3Jyb3cgb3IgbGF0ZXIgdG9vLg0KDQpCZXN0
IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiAN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmlj
YWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQo=


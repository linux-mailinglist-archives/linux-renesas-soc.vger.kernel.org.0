Return-Path: <linux-renesas-soc+bounces-25148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F9C88A3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 09:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 521BE3A9EF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7949E3191BE;
	Wed, 26 Nov 2025 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GNBSvoql"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA76315D3E;
	Wed, 26 Nov 2025 08:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145800; cv=fail; b=KyAfjUCyauLjJJX+2WVVaFWgSZL/qfhR8oETzyCBhl21Su7tvGUKtJGT2gZXqGrnmW66N3EQ0mPfSmmgUuJCactcybhlXiYwyV75ZN6X4WV036u1Oca5mI9ENyE6zD2KeBHmeJpi2hOq/BBVp+HxJ3YYeM+6zUULtUq3PTSQUZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145800; c=relaxed/simple;
	bh=iDcDst9BaQBh9Qu8vcJtWp0fn5kuQi8mE7z2Dn6WvX0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ixZfpU1ki8/NZKPgXFeJLyEtC3Oj+C3dLcdA2AMLfoYTG9/jeI+Lrxoz9QMKVTTvUl8Lwxx5qHzF9R9FU9C4oQD3Tjyxc4HZRRueKw3i304EMq5e7N++HPv5ft3czwY7+daWu+X9+GLa2AznAGaAUlHUfgce8orTA39uXeW+KzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GNBSvoql; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHOEV3zgPIuaNM/baC40kyAbnM3+cNFbvXIislGgiSG32SXnNnTQOfA20GNWinU9IjsSqHpcQ8JfHCh1HsPIeCLwX4UhCCccGHmn25OWtsGs9M5N9qvpNXd87SfRME4LmsMXRI8vvjhoe9I7HOZHQlQpeBHaczPMNgq1dTx/Uc24ZOm7FqN03L7tzkYoq7Py7rBGTvZDu7vMWpkRTfAfrNeXrE0WElusXzB1PgNGRn4rlgQqh8/UcfL8x35+EiJxaP2X+Cb0p2cC/AiiO233ArlxkwPuPWsOAkXJkl3b/nCLuNy64rFS8W1vYRpDy97N7V788p8QnjRcByHLRUD7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDcDst9BaQBh9Qu8vcJtWp0fn5kuQi8mE7z2Dn6WvX0=;
 b=jJOW67n1vvNapAtgPm78vGo1Fw8n581MCXpq0ECuB0qo1fFfxFnvGSQhTUaMkJ8ZbZK8BQ/kIs9mx21rMHHaZoilQwtJY7V38HWaIUK2+916LbP93YtaAIJZonyk9ulkiBXAXtd2c78F5NR/I9OwVp6WAMD+ayZRKV82PdYHuOZCv52VIqf5UZZa5+ioiJYVAaYIWTNcZ0sRdsrgbGMcziJjXa7FRt+W6uh5dABXCiodNaVcKYx9TL9IZ0vv9w1icSvKE1W1mIUyIel8j3R8vxv2BMXPOSN4+mRmi08gI1yLqzoelkY5WHXO20kM43v4HVDdmowLhfU1ImE/SN2aDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDcDst9BaQBh9Qu8vcJtWp0fn5kuQi8mE7z2Dn6WvX0=;
 b=GNBSvoql0B+iS0DjLfHNTXa82Q/QQ8NGj3qNMEmRLh6cui0+TQX9Eu9AUgfAAJTXwafybyuH7o8XpSM8G5HIy4Renpln/woaFeadnW8kt9T+F8CPCf7ZNxjY9Ne173DAPmmD8fFHErsxeamJ+N076UWwY6x4by7NXhIlgWpBCXg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9987.jpnprd01.prod.outlook.com (2603:1096:400:1e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:29:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:29:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 02/16] serial: sh-sci: Add sci_is_fifo_type()
Thread-Topic: [PATCH v4 02/16] serial: sh-sci: Add sci_is_fifo_type()
Thread-Index: AQHcXh0be1HrRQijGEmaNKiHeci5PLUEmSSAgAAFkfA=
Date: Wed, 26 Nov 2025 08:29:54 +0000
Message-ID:
 <TY3PR01MB113465BD7729BCD245D7FFF8186DEA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
 <20251125150632.299890-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUVt6usA9DvzpzKz7OHYppuFH=jWGKRMqEPDzeoUyTXSw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUVt6usA9DvzpzKz7OHYppuFH=jWGKRMqEPDzeoUyTXSw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9987:EE_
x-ms-office365-filtering-correlation-id: 933efaaa-67eb-483e-e3ee-08de2cc5f99d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UnI2aVNQdjNVLytCRk5wNGVjdXRRV0FLUUh1WlFmOEs0bGVxRUhiK3Jaakps?=
 =?utf-8?B?bTJIVkEvMFBYeld3ZjR3ZDkzOG9OelAxY2t5aHY5dEZldkJLaUhWVXJlU1BH?=
 =?utf-8?B?aDJrVVNZaGIwZkthcW8xOVdXdUpvb3RpaFQ2cVhTei9vTTRwRXVZR1IwMU93?=
 =?utf-8?B?VkY4alY1V0pnMG01cnAwVnlNMlZQOTdzZ1Nza3VnTnI5UXRBVHNlMjd0ZlRX?=
 =?utf-8?B?UHVQdXc2TUFpZkJJN1pUOHBITGtFVVN2MGhoczNoRGNvc1Q0elFRWXNmSVJB?=
 =?utf-8?B?SzhOV3FyUHlMMFZHc2Jnb05BTlhsOStCeUZ5UDU0STdFSno4RTNSL3RjOE1S?=
 =?utf-8?B?Nlg2a1hHRVlOSHlLMzN2TDNxQXd1NDZ2MTV2NUJtdGIvRFZheklSZGtCNjhx?=
 =?utf-8?B?NXZTcUZpeXVnbTRWd2xibjVGQTdHNVBYNDJHVEJRS3BHTEczc3AwRFJRNjRR?=
 =?utf-8?B?bnhqdjZIWFJPK1I3bjVGNjFndnZTcmE1bnVVNEtFUU5xMEpvbXFqZDh4V0la?=
 =?utf-8?B?aExXL2dHYnVqN285OFFWK29QVjVrWkQ3R1hoeHlkWXV0WW5zMDluL1hWYThZ?=
 =?utf-8?B?cDA4NkxFRkZnZHB5SHZlTWxLRFpDVDhjd1d3Q1ZRVGdiV0JmYk1QUERKbDNw?=
 =?utf-8?B?cGdvajFtSTA4NUdaZ1R5NTdNalNQM29PMFhMN2RxMGgyMGJhbEZQT3RNelZO?=
 =?utf-8?B?ZldCMjhGalRDNU9QMTNBZDJpUkQ1bE1ET1RmQjRUcVoxTXZId3lpY2tNbE5x?=
 =?utf-8?B?YXFMVVNMTnBKVjBya3BldTBJQ29JQmgvcXQvQUcvV2pocEtzQmdhaFpqTkNS?=
 =?utf-8?B?MThqRktvNXNhWUkydnc3UzFCWFFOZmxtS3dveEk2OUJkVDFOdng0c3lYRXlx?=
 =?utf-8?B?VncxVlZUZUpFNkpXZkhudlJLM1o3Smc2SjFSQmE2clYrMUNSeWpvS0s1RDRI?=
 =?utf-8?B?VFE4azJKeUN0b0VmVSt6ZzZpQVlXNng3dEZ3UGl5WG84MkJaQ2p6bzF2Sk9z?=
 =?utf-8?B?S3FDb1ZZZjRQcTdFMkZwY0VvZ0J3T1phU3JPNGhmcVQ0SmtDaUgzU2cySGF2?=
 =?utf-8?B?MndFSDJ2azFvQTlsNnFqL0ZDa2lCQ2xaVVdHYTZESVRXbEk5NFZNNjFZSnhU?=
 =?utf-8?B?T1JHOFYvbE1Bamw4NTBodnUzK0xGcG5XaGlvVjUvUW1QWHZBRSthemZHYWZ4?=
 =?utf-8?B?RmRyNDBpV3UxTWtCaWlXQTBpazBGMU1YSDVyM1Y0RXpqNEMyeXp0SGtxR1hN?=
 =?utf-8?B?VHJiaTQyaStLV1lhcENuSGZrTkhZbzVVUlhkL2QvNjd6WWQ4STczbEFUcUFE?=
 =?utf-8?B?cXBZWjdYcDl2MlVIZzcvWG5tUUQ4Q29kblBoc1NMU0ptVkVUYS9UbmpvYTZ0?=
 =?utf-8?B?S1dhYzRIMC9ZUnBxb2EyNmtBcENzRm8zeHg1cWZ6MHRyMDlEeGE5MEdNeXM3?=
 =?utf-8?B?RlRDNEZ3NWxBYkpxTWtEY1M1ZHVRUHlCTmhKVlFFeEcvT1YrS2Q0dkhuVm5k?=
 =?utf-8?B?RzBnOE5jVUpwQ0ptSjRaRWgyOGMwbjErcXM1SzQ0Y0hFdk9vZjZ3NTFsdndL?=
 =?utf-8?B?U1BxK3JGS2phZGQyd0ZBcVdjdmZZcmE1TUUyWXM4MXNVUC9oM0Z2VXk3Zlg1?=
 =?utf-8?B?dHN4Mm9OalU5dHFTeVBJbnR4ZStyaU5XS3N0S2ZDSFpnVnNzWEUzV3ZjZzFt?=
 =?utf-8?B?cEdQbERVZGlwODI0TlV4eldiSzdZcnFFcVAvMHZXK00vNEdzQUswbncwTmNo?=
 =?utf-8?B?MzkvSmVRZDJUVTRoZ01Id2pJTVZzRXRtK1NWcExnNVJZVTBvOEgwMlZ1aVlv?=
 =?utf-8?B?cklIM2syZ1hpdG4vdlZjTjdVc3dJYTlGWXJLSnVTT3BKbDNNZklBSlFwM3d0?=
 =?utf-8?B?VWZZUURhbCtoVWtWTkJlZ1VVZ2t5TWszMGdDaVMyQWtVSSt3dEwxWTg4cVln?=
 =?utf-8?B?cHRvNWxUV3lKcDIwcm1JajRUWjVxOVFGanREN0xXSmRTaDV1RUw3cElEUWFI?=
 =?utf-8?B?R256TnN1ZXdYV2k0MXBxN3BCVWh6YjhYZG1FaXpuOHNXcWtYY3JPU002MXlK?=
 =?utf-8?Q?0wRcOt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cG5PaWh4UVpKVjJYbWN0b1hXbUdtbGVjZk1UT1JwZ0RwaGo2aTVZU1B0dldI?=
 =?utf-8?B?dldpNXhmcDZXcUNjMERTUEk3OXJxRForUUlMVkJ1S1ZsT0F5N29iNmwwNGg4?=
 =?utf-8?B?SHVUZWM1ckhNb2laUWpIS1AycFZkK2lHWW9oRVRYc0hNdXJwUSt0M3JidGdS?=
 =?utf-8?B?NnFKV0cwcFQwVHNnaGQzd0V5UXdQOHpUSmdnUHRQOTkwUnlUM2Qwb1Mwb09X?=
 =?utf-8?B?R0JyclpQTTZjZlN0S2NHZ2JnNGd4MGpheHhtbnVEMVZjMHZLQ0dZZmt4NTlM?=
 =?utf-8?B?clJBaC9lMHRUaitkcnN2eG9peHo4dXpUdEhrYjNTVXd5ek9vUWlaNTZFcmFa?=
 =?utf-8?B?T3BudEF6Z2k5K0FSWTl3ekRsd3VRbTdtYWFvMWlDQ2pKNDA5VDIzdnBNSElp?=
 =?utf-8?B?dGg0VEU5S2tJVk9Ib3Q1ZWQyZFd2VC9Vdjg0Ujl4TVZIdFQ3WHlvUmZkSWVm?=
 =?utf-8?B?RU9KK2RUdHpnYjQyb0I0a3ZRenpDUlNHWEFlRmR5c25QdDdFaEJJTTFOcTR3?=
 =?utf-8?B?aTcycXI1cGsyN3RLR0JPeXpVVjAyci9XeFBaN3FMSnhlRWQ5VU5CNEN6ZCsz?=
 =?utf-8?B?QnJmaTU0M3dRUTBNbk9IenQ4YW1jOERjYk9KSERwMS9SUGVxZmhiMXRQaDBF?=
 =?utf-8?B?c1p6VXZNWHpZLzhuZmNQemRaYVFaQ1R2NUxWRmp4bFAvL2t1U2tPQURtRFJw?=
 =?utf-8?B?Z045d1ZzbmlrakZLV2VLRWF2aVp4dmNwK0tTekR3QXkrQ3dXaG1RRW9RUFVz?=
 =?utf-8?B?VitaWE84QTNFTzQ0UmFEd1Ewb01wWDVuK2FHSzhHMnFUek9rcUJVTDZhOVZ2?=
 =?utf-8?B?Mk1vUGhzSmtJeHhYNDRIdWhNRFRuRmNJM054cTJtckk5K1NRMm1JOTB5VlRz?=
 =?utf-8?B?Q1VMbXU4M0U2Mml3aUN1L0xUbW1LZXdvMlNydVZHVzB3RTJKOW5BZjl0Z2pR?=
 =?utf-8?B?RFFaM1lFVkhaNVVYVjh4cHJHNXNZS2xySzNNZThxNCtxbFJQKzRNZlRGa0Jh?=
 =?utf-8?B?SUV3dURFVzVDcytDL2JmVXh0KzRnQnpuRFB4VlZidnMwV1RrK2pEc2gwL0RH?=
 =?utf-8?B?WVhHQ0dSUXhvWWg1UTJYR1NDR1Btb3M3bWNkcTRPbDJvaFh6WnNOazV6aHBX?=
 =?utf-8?B?WSs1d0RoOFBNaDBveFRLVnBXalM2bzAvT1Y2V1kvR0RzVzlYRll3RWxuTnJ3?=
 =?utf-8?B?Y29wVllKcVQzR05CNStIcTYyTmE2aGJIOGxiOEt6UVpGRlBZR2xya2dXbmFn?=
 =?utf-8?B?RjJZaS9uT1ZiTG5PcGpNYWxBOXM4eUsvSGdoQkJYN3hhUmpwa1QyWDVFdE96?=
 =?utf-8?B?UWpnSnM0bmYrckN5bFFzWDBHMlhCVlphRDBMRDhyUStHMzM0YmdidzRpZjQv?=
 =?utf-8?B?aGpPUUd0TWZmTUwyNlp5L0hYNHRVREpUVWxvRy9sbXh1ajNOLzdUR0xDQlM2?=
 =?utf-8?B?UytIQjFDRTF6ZmMvLzU3RzFxc1kxTGM0TWhLOE5qaGhjSlRSZUxPS25laEww?=
 =?utf-8?B?NVVkRGE1YS9aaXhFSkRXRkJSNFJBdjVKSzVJazEvL2tiN1g1SVZYS1pjN3hT?=
 =?utf-8?B?TGp6V1NrcWlzeWNwS25RK2RnZS9PalV5NXBCaWNMaWc3VWErVUNmZXVyZTkv?=
 =?utf-8?B?N2xOdkM1TWlWYjF6L1VKbFk1eEdFYTZYb2Fkb2tJSEdkdjBpSlJHejhzc0tO?=
 =?utf-8?B?Wk40OTJMaHBicTlqN1ZFNmc5Mko5TjZQWG9FcS9hOWJOakVQTmZQRGV4U2hC?=
 =?utf-8?B?aTdVeWFvaWljNmp5RDIyVGgyd0lDekVqMTNqNUdKVjdpZlJXVklKV2s5RVMx?=
 =?utf-8?B?UUdyY0g4WHdtVW1aYVM1UXBhTDBVQWF4Qk9jLy9JMXE4KzBaNzQwSUV4Qy93?=
 =?utf-8?B?WlNldVpMWEI2M2o0WjdiekRQcmdpdE0rVHZYWkcrVGdocjZUNHFuaTRPaDg4?=
 =?utf-8?B?SVlaQ1pwWHM0NklGbWloSGhVcWRMRmdXaTZxK3JwU09VOE1vTCtzQm1aeTRP?=
 =?utf-8?B?RXJyc3hTblFxTC9hYWRCeXhsOWQ0eGNySEtCa0gyVWpnZjhKUm1xdGRwaHdD?=
 =?utf-8?B?VEc5QkFaNmpsZnVQYytnU0pjRkNoaGs4NGRDKzFUU1hsVlo5eTliYUU5bzFv?=
 =?utf-8?B?djl1RmdQYVBhYkQ0TTRMb1ZMZ200empwbyswLzJ0VmVRR3MyZTBrZUZOdHNG?=
 =?utf-8?B?REE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 933efaaa-67eb-483e-e3ee-08de2cc5f99d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 08:29:54.0808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28lfbu38SGXHn7UV2Q7q6v+ae1qDLILxt4T9rG2j2GmEBs1tBzZ6sF1TjjloQlz+iZpPpLep84fGD4rFVFTjtpTrPAstMeFBRWJIDI+SIGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9987

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyNiBOb3ZlbWJlciAyMDI1IDA4OjAwDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDIvMTZdIHNlcmlhbDogc2gtc2NpOiBBZGQgc2NpX2lzX2Zp
Zm9fdHlwZSgpDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAyNSBOb3YgMjAyNSBhdCAx
NjowNiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgc2NpX2lzX2Zp
Zm9fdHlwZSgpIGhlbHBlciBmb3IgU0NJIG9wZXJhdGVzIGluIEZJRk8gbW9kZSB0bw0KPiA+IHNp
bXBsaWZ5IHRoZSBjb2RlIGluIHByb2JlKCkgYW5kIHJlbW92ZSgpLg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhh
bmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2gt
c2NpLmMNCj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiBAQCAtMzU0
Niw2ICszNTQ2LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgdWFydF9kcml2ZXIgc2NpX3VhcnRfZHJpdmVy
ID0gew0KPiA+ICAgICAgICAgLmNvbnMgICAgICAgICAgID0gU0NJX0NPTlNPTEUsDQo+ID4gIH07
DQo+ID4NCj4gPiArc3RhdGljIGJvb2wgc2NpX2lzX2ZpZm9fdHlwZSh1OCB0eXBlKQ0KPiANCj4g
c2NpX2hhc19maWZvPw0KDQpPSy4NCg0KPiANCj4gPiArew0KPiA+ICsgICAgICAgcmV0dXJuICh0
eXBlID09IFBPUlRfU0NJRkEgfHwgdHlwZSA9PSBQT1JUX1NDSUZCIHx8DQo+ID4gKyAgICAgICAg
ICAgICAgIHR5cGUgPT0gUE9SVF9IU0NJRiB8fCB0eXBlID09IFNDSV9QT1JUX1JTQ0kpOyB9DQo+
ID4gKw0KPiA+ICBzdGF0aWMgdm9pZCBzY2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KmRldikgIHsNCj4gPiAgICAgICAgIHN0cnVjdCBzY2lfcG9ydCAqcyA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKGRldik7IEBAIC0zNTU2LDgNCj4gPiArMzU2Miw3IEBAIHN0YXRpYyB2b2lkIHNjaV9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQ0KPiA+DQo+ID4gICAgICAgICBpZiAo
cy0+cG9ydC5maWZvc2l6ZSA+IDEpDQo+ID4gICAgICAgICAgICAgICAgIGRldmljZV9yZW1vdmVf
ZmlsZSgmZGV2LT5kZXYsICZkZXZfYXR0cl9yeF9maWZvX3RyaWdnZXIpOw0KPiA+IC0gICAgICAg
aWYgKHR5cGUgPT0gUE9SVF9TQ0lGQSB8fCB0eXBlID09IFBPUlRfU0NJRkIgfHwgdHlwZSA9PSBQ
T1JUX0hTQ0lGIHx8DQo+ID4gLSAgICAgICAgICAgdHlwZSA9PSBTQ0lfUE9SVF9SU0NJKQ0KPiA+
ICsgICAgICAgaWYgKHNjaV9pc19maWZvX3R5cGUodHlwZSkpDQo+ID4gICAgICAgICAgICAgICAg
IGRldmljZV9yZW1vdmVfZmlsZSgmZGV2LT5kZXYsDQo+ID4gJmRldl9hdHRyX3J4X2ZpZm9fdGlt
ZW91dCk7DQo+IA0KPiBJIGFtIHdvbmRlcmluZyBpZiB3ZSBjb3VsZCBqdXN0IGNoZWNrIGZvciBz
LT5wb3J0LmZpZm9zaXplID4gMSBpbnN0ZWFkLCBhbmQgdGh1cyBjb21iaW5lIHdpdGggdGhlDQo+
IGFib3ZlIGNoZWNrPyAgV2UgZG8gaGF2ZSB0byBmaWxsIGluIC5zZXRfcnRnID0gcnNjaV9zY2lm
X3NldF9ydHJnIGZpcnN0LCBidXQgYXJlIHRoZXJlIG90aGVyIGh1cmRsZXMNCj4gdG8gdGFrZT8N
Cg0KDQpUaGUgU0NJRkEgaW50ZXJmYWNlIG9uIFJaL0cyTCB1c2UgUE9SVF9TQ0lGLCBzbyB0aGVz
ZSBkZXZpY2UgZmlsZXMgYXJlIG5vdCBwb3B1bGF0ZWQgb24gdGhvc2UgU29Dcy4NCkJ5IGFkZGlu
ZyBjaGVjayBmb3Igcy0+cG9ydC5maWZvc2l6ZSA+IDEgaXQgd2lsbCBiZSB0YWtlbiBjYXJlLg0K
DQoNCkNoZWVycywNCkJpanUNCg==


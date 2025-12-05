Return-Path: <linux-renesas-soc+bounces-25606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB4CA7D34
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 14:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04CA3311A102
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 13:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B473031A044;
	Fri,  5 Dec 2025 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gRf3E69f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F132F8BD1;
	Fri,  5 Dec 2025 13:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942370; cv=fail; b=fS1Ze+qP/HXvE//Sr6QZ+vUh4m2etDvsDF2I52TbZA7Y5TCKrejTnbcs/j7y79mhK4pIMe9lrgW0hJurc3oPaCTubr0ZX6sVgdh4eCYYt66auxUtQ+f4f3xuvhlSVA2JPwahhU/PCLHEZ/H1nOmmWF7QOLAfXtzNjCJcNTdnBr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942370; c=relaxed/simple;
	bh=kEkxrohf5yxbQUuWfy6omms77AwAnaEB8adQ0L8/5to=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QYWZPneUgpirTOnGwvOsIXs/8a7P7U2luxXRdF40v+u+y8agjNCcAy9SrxEy0r3++v0Mud4UF89DtIT64KD0bnximJ8Kx48J17u+dnndtdfzkBDDgJpWoOYxOesJmQU7QcmKpU5NrH+IQWom2NOZwntQx8CgIB8FEVHXX2G3pcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gRf3E69f; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTjdXKpNSYv7t372QVeuQyqfwBIP44XZu02jH2M4EAT5XfHYyLFA5R7wV5Jlgqnvd9g0Bb/A12kz2IjbAYKaImTZ6e70kApVKeWGY6iqRrXzOM4GjfDcs3Bt1jy3huZOltYjzShwxQfqsWcwmSfNAaWod4+E3RxuDqaR+Mm3FpD37nMolgyAI0D+2C7WsLvfH0rO3fsepG9T1pE0MTTQejtPpQ2httKEoR0nqRYyBWlmpfVcN1/M5YGR3jSDFpFtCFK9BRslgH+0MMZyFKzZMeaPWi4jgH5xBb62Sq9MkJEbG0yDJrr2wSMeeyzBRMcy26heeiyVivq/wMAeSKVt9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEkxrohf5yxbQUuWfy6omms77AwAnaEB8adQ0L8/5to=;
 b=ElHxtQK3tq3FgeV1b37V0843jVRhoSFEEvMn2qYtN6Tb1SMNvLcAwHtsz8RsN6UQfrkpARtFzQ0USvZB2ly5EXnZwN946opCP7P9c5kMMhzH19+aNljzHLdrXJ87jv9dxsbr2/o25K2hZ2eEDgNryNAgYBzDCuUmHuDXOBKSUwU2yYwFGin+LwEA9r8azZg8VnRyGpsaGOZHh9zvaN8m8q+pUvT22Hl+Ojr+Z/4mUBYLp9BoZ7FG7Uar/QXm5TL9ojuqJ63xYbNf9IfP3FgJSP14Z2J5YzTYWapJhCKswGX31IlXZBM7nvDsRO9ACBd7ra4eovXRjth0JBxntpkheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEkxrohf5yxbQUuWfy6omms77AwAnaEB8adQ0L8/5to=;
 b=gRf3E69fA6ShG2KMTicIgsAxkspDqP1yWYyTPzEHuhS9OCOrGbZ9JGmk2EPB0J6KZ7p7Ud10P04sph7267strhoiE3D9LFkTG9DmsTIRyUCdu34cyLH5+zsSwAF8uMZk499rFZ48dUbtVK2JbI+XXSP7AvhlCNfcWjd1gr2fhAM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9414.jpnprd01.prod.outlook.com (2603:1096:604:1cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.3; Fri, 5 Dec
 2025 13:45:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 13:45:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Topic: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Index:
 AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfCAABPzgIAAA2hggAAJoQCAAABcgIAAEgTwgAAbNYCAAAHegA==
Date: Fri, 5 Dec 2025 13:45:56 +0000
Message-ID:
 <TY3PR01MB11346C5EDDE82E779C69566BB86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <da64005a-e6fb-4bbb-a97c-e6c3ada8aff1@tuxon.dev>
 <TY3PR01MB11346820489C604B63A315E8486A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346E629B11BC5F812D32E0086A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <52bf094a-a656-4bef-bb22-f903578ecf9b@tuxon.dev>
In-Reply-To: <52bf094a-a656-4bef-bb22-f903578ecf9b@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9414:EE_
x-ms-office365-filtering-correlation-id: 8c48523d-5cfe-4d4e-3669-08de34049d9d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WTFGMm43ZWIwNWxuQnBId1ozUTZlbU11NVNCRnU3ajdwdzZzWHNkLytUc0VX?=
 =?utf-8?B?bmNIcS80NlQvdm1KSE1RbFB2cm1DNC82eWxSakNqSmFmdklCRFQvTFZ0ejFO?=
 =?utf-8?B?WWU4eFAvSnViVEN4YU9JMUF2eE5BY1V0T09NSnQ3NnltL1F6bnhMRHBBUk9S?=
 =?utf-8?B?RmFNd3dJTU1QRWJyWlBVa2VqRXN4Q29TazVEcCtZRnpjRUlGMkw4bXJwOERk?=
 =?utf-8?B?eXBEdGJxWnN1dEx4R1RoVHc2dGRRWHFoWVk0bDVBbzVERyt5NTE3dFlBWjQ4?=
 =?utf-8?B?d0E4MVNtQ2l3dzNCNjJFMlc5NTZRQzArRTM0MmJKOHVqOTd0aGxUQXlYQVJQ?=
 =?utf-8?B?SkRMRlVQWDFkaWJkN2t0dk9KdzNYamtOMlkyejJUeGgzL3h0YkRzQ01VUzVv?=
 =?utf-8?B?NlFLTDEzZ1F3UXFLcFRSSUpPWko3MnBkektiMTBEVEhkWWwrU01Ca3lCeTBB?=
 =?utf-8?B?UFZBOWxGZ2I3THRPRXN4NGsrd2V5a0NJZmhHMkpPQzZsRWUzWFFUdkkzTFpU?=
 =?utf-8?B?RU1tdnNkQnQxcjVJOHRQbzc0akFwWjU0eE9HV0hKUjV4bHpUOWpvYU5USWZX?=
 =?utf-8?B?cEp6Vi9jOVVJMzd2NDR3aG1yczIyKzA3eDRmblZjWkwvK25jbHJmYjROVmxQ?=
 =?utf-8?B?QzVkWkhnLy9za0w2d1hkRDBLQ2RYNGR0Z3dJSk13S0dWM29mUmNiYkY5aXFt?=
 =?utf-8?B?OXloSGhLbVBCMXkrcThPdFg5NU9wUXNUU29OQkk3NS9CYXJHZUtkRFdGa1pL?=
 =?utf-8?B?YWc5SXk1cUdYQklKZlRaVW1aREgyajhtSEhUUThOSGU5dTI1WFYySXZmdGtY?=
 =?utf-8?B?eFBoazFxRTZEUGdMVWJENFI1elRhWGVTdVVXOUM2bTFYZVRyT05CVHpsOG8r?=
 =?utf-8?B?aWZMcUduaEY1Tm1LVzE0NDZWbzlLSUVSY01mTWxiQk9MUHBoWUVnSWhrUThv?=
 =?utf-8?B?WXFFUlIrZUtqUmdiVGxiL21GYUlRU3ZEM2l3ZFA4UUdEUHprbVI1MzRFZDZl?=
 =?utf-8?B?MVV4Ym5xMlZsMDlYQTc0anp2U015KzZ1UXhUcHBUOGY4aXIzRGZrTkt0WWhH?=
 =?utf-8?B?NDRPRTZFYlV5WkxLRkZQTVFmQ3l0NFNIT25OL2VqVkZaOENLa2NwYUs2M0xm?=
 =?utf-8?B?MUtCTmFVdEdsUm9RWWZYSUZTUjU2Z3I2TDZBNzFseUNxdjZvcW9jQlUvOW0y?=
 =?utf-8?B?d0NiclVSNDdwNDZUeVp5d1JXc0xpTXBlTUF3cTVlUVNwRldDbVdsOTFPVnZa?=
 =?utf-8?B?aVdpdkswczNwVHp3ZVJKSHdMWXg5aE1QV1lBVDM4YVoyd0tHOEhGSTVGbVJV?=
 =?utf-8?B?MUpjblU5UkdaNUw1ay9LZjFJRUV4S0Z2RFJvUFgvaFloTUpIL0tYbUpFcjhR?=
 =?utf-8?B?blNvYUNUOXVSaytXS2xzYXV4Z1RLNTRLR0tDUVBGTXdzdC9iZ3ZSTnpGcy9R?=
 =?utf-8?B?WGdSWHI2TFRjUGx5TW03Z3ZwZ1AxbW5GRzhZNWgvSzg0U3F4ZVhPajIrb09p?=
 =?utf-8?B?ZnhKR0tBZGQzWks5WHllUlIwVXpDWEMvZ3AzVlF1S3FNcDE5UjdWSnRPSFZQ?=
 =?utf-8?B?TGlYQjVaTVduUmYrbTR6cURqb05Vd2tzcnFVZFJhVmRiTkVrZkhRc1dtTUx4?=
 =?utf-8?B?aDM4b0hKMUtQTWZwSmw0S0xseGFNN3VQM3NSb05vY3E3aGxYWm5GVEFzeFZZ?=
 =?utf-8?B?cU03MjZCcWVqZkdhTFlhWk9tUVQ0MXNMRlVJZ3F2MldjSjU5UmpNbER2RG0v?=
 =?utf-8?B?TU9yWmlsdnBsc0dYNmVHK3Q3bEd1Ylg0QlJKSDdRKzQwVjFLV2xsNnFEbk5B?=
 =?utf-8?B?Rzl4dCswMStxUnNVeE93c202UW01ZWVKTExOS0ZlSkNjR3pQbXBoYlpObzV2?=
 =?utf-8?B?SStVWWM3OFozZ1laWi91bHFkZEhaam5UR2IveVFNQmV6S2w4bFZCTm5iZU9M?=
 =?utf-8?B?WC9ZQWFwbXh2ZElXMDhYSjZ6b2hicWdSR3NPTGpaNWxMUGlMdktMNlFjMXhL?=
 =?utf-8?B?a3g3NUdyMmxYendML0Y2d2s5VzVDa2QzdjJwdWozdzVDek1QZFk0cW1udXdT?=
 =?utf-8?Q?QVGb4L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVhBKzRJaGRIbHJpZTdtd3hscFVMMlJ2Z1pPNFVMaVJkbkxTcFM4WWx0YUlO?=
 =?utf-8?B?R3VVdGd6cmJJeW1wT0llcys3N3NTR3M5aExDTStxb2F2aVZaV3krTllCa3VU?=
 =?utf-8?B?Sy9PS2FJTFNITW1mSDBHL3ZyTkVaVzZ1dTBlczNadHo5OWVsOFl6T1FqNWIy?=
 =?utf-8?B?MkN4WmtiVDhRTGFZaHVJVXdHVzZrR3V1aS9yRXdraWJsb3FvT1NzVU40UHpx?=
 =?utf-8?B?aTliY1NBQ2lOZjFyR0dEOHdLekVRNmR4Q0tSOTROYVhUMHdWUDVReGFuTEZF?=
 =?utf-8?B?TlAwcTBLQVhqZHNzNGRnbEJnQ1EyOEs4ZlRvc1dXYnJUTlZjMEE1aGdrV3ll?=
 =?utf-8?B?MTVmUDZncTMrNjlNTTdUeml0cTZkaitZUlFiUHA0UWNKVGt5TXpFd2szdGRl?=
 =?utf-8?B?R0FLcE5KNFZqKzBzeVBkTnVCN3RKRjFlM05sTFZzaVFTdWFFMkpmR3h2YWcw?=
 =?utf-8?B?RzdjMlJESUpoVG1PTnVHQzAzUXV4cUNEb3Q0TW0rZ3ZsdklUR3JieEZqSHdh?=
 =?utf-8?B?VnNGY1dWQlZqcmQweWo2UlpnODVmclFSeWxvZm5uUCtEUnUrMlNwVXlvTk41?=
 =?utf-8?B?QXJCNXd4dGU3L2I4eEVFS1c3bG1tbHFqSkJ0L1cvclF6ZkRzNzNpKzZidzRU?=
 =?utf-8?B?dGZTSHRieHphK2JZQkQxSjJMUjhEWFQzV3IzMXh1aWZMRFE5RnhyL3dEajVk?=
 =?utf-8?B?R09aZXphTFgvS29RUERXYWwwKzdwRDNNK2RpLzN3WmFBNjAzNW5ScGdUdG1u?=
 =?utf-8?B?N3VlOUlnQnJ3LzRXTVhGNVRKcWZLTEFZR2F2NDI5TVB4MWJvWnZVTlF5UDBB?=
 =?utf-8?B?OXp1bG5MY3Q2NmcrdkppT3BqcExWT1dxaEVvcW41UERjNFMrb3hBNGZ5MGdk?=
 =?utf-8?B?ZkZoSHpPay9UOGs1WjBlOFRrS21oRS83K0EwQUlzTTlQbzJLazJCMlQxNVVo?=
 =?utf-8?B?UWdNdE5nQ2pzemFTampzNUhTdllUR0JQcW96L20yeVBEUTFJallCd2ttMktu?=
 =?utf-8?B?OUI4c1RKY081aS9yRzEzM1lYTGtaQmYxWFkwaXJ4NGZIVFovT1liTHBRdjl5?=
 =?utf-8?B?ZDVPczZlY1ZydDJjYjBMRWw0VkcxdkVLZ2wrT2NrT3JQZmhBY2MzeUs5aXAy?=
 =?utf-8?B?Vk5GNjJ4ZHBFVE9aQk5yclpxc0k5K2dEYzg4eVRHb3o5RVM4MEVhSkR1dUJ3?=
 =?utf-8?B?ajFZUVROb05KWjRCWlV4TWZWZ292UmZuM2cxSU1lTkRIc0QvWnRvM1pnYnhT?=
 =?utf-8?B?YTdBcFJHekh4MkpZdTIyWldoRTQzN3duMmtwUVI3RVdiUTBZaStWdVNzUzNy?=
 =?utf-8?B?K0VhdjJjM0pEaFptK21NY281ZEZkbEVDanh5Szlvc3YzeFF6RWZic2VteFpo?=
 =?utf-8?B?dW9oYkYrb1pjcGxvWlNBK202M0xJNVlNbThlOGpQVWpiQmo2bXVpcnlGMHFR?=
 =?utf-8?B?Uy90czludVlpM0ViQVViWHRBYWc0eVhKZ01vUUpFbWZzWVcxL2JxVjE0MTFj?=
 =?utf-8?B?VDgxbjdHWUVRSGZMMFYwVFBOekVsSWZxTUx3MEdjd1lmSERTVGRpVCtDdjlw?=
 =?utf-8?B?RGVEMXlBY3VHS0o0dGJvbnJtOW9pSWlYQVNlaGJmbkNoZFhMbnlVZFpscGpn?=
 =?utf-8?B?M2tnekU5MVBOKzVzMXNDNEdMZ1dKc0NLcU90ajNhMTEzakJHNEpxOGJzLytZ?=
 =?utf-8?B?QXdHb3c4WkMyNVQ3bEt4eXEreXE1UHNpTlltQ2ZFaDFHRHNXTEM5TlFONWNl?=
 =?utf-8?B?WS8wS2hzRytBdjhQTGMxRGRnd2hGUG1QSVI0aGQ0eHhPZk9OL2dTTkdDTFl2?=
 =?utf-8?B?cm16YWc4eG5rbjJLb1ZlL0ZBZUhiU3VWdldEeERDV01zRWxqdm8zOW1IbHJh?=
 =?utf-8?B?MjFXNXVZZ29TNkk3VEhjRkdxdVlVMU9BMmhnOTNBT1JhemdOc004VGdLQmdT?=
 =?utf-8?B?V2ZiTkExZ3VONGRRZ2p4RzFjRE1DbUJFRnhHdFhJWWRJV2cvWTUzT0tIaG9p?=
 =?utf-8?B?WFdvNERHR0ZSdzdDdXZ1UnpQOGw5MG1vQ0xNUTAwT2JrNTJ4Y016S0xaV0dh?=
 =?utf-8?B?WnNxbmhxMTdwcTNQaXBSZDhwdHJoTHJ6Rkp1eStmRzdwaUpCYTZTWVdobCtl?=
 =?utf-8?B?NEN1VmVnYVZwOGE1ckx1Y1AvaTZOQlN4OGFUMzB2bHcyRzVrcUFxQ0xsSllL?=
 =?utf-8?B?Y1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c48523d-5cfe-4d4e-3669-08de34049d9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 13:45:56.1758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D1j664eIAeGBpMjSU32K0Sxs+Sn+OxVsLLuNCfram+WbKahrkaBMJ6Vkjlxh7wIxRJi5o3Qlkl49DwJltxy+PXuoe6H+pDlabVrL/dB/4kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9414

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNSAxMzoz
MA0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgcC56YWJlbEBw
ZW5ndXRyb25peC5kZQ0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgt
cmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBDbGF1ZGl1IEJlem5lYQ0KPiA8Y2xhdWRpdS5i
ZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSBy
ZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+IA0K
PiANCj4gDQo+IE9uIDEyLzUvMjUgMTM6NTUsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIENsYXVk
aXUsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQmlq
dSBEYXMNCj4gPj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNSAxMDo1Nw0KPiA+PiBTdWJqZWN0OiBS
RTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6ZzJsLXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZCB0
bw0KPiA+PiBSQU0gc3VwcG9ydA0KPiA+Pg0KPiA+Pg0KPiA+PiBIaSBDbGF1ZGl1LA0KPiA+Pg0K
PiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+IEZyb206IENsYXVkaXUgQmV6
bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+ID4+PiBTZW50OiAwNSBEZWNlbWJlciAy
MDI1IDEwOjQ3DQo+ID4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6ZzJs
LXVzYnBoeS1jdHJsOiBBZGQgc3VzcGVuZCB0bw0KPiA+Pj4gUkFNIHN1cHBvcnQNCj4gPj4+DQo+
ID4+Pg0KPiA+Pj4NCj4gPj4+IE9uIDEyLzUvMjUgMTI6MTcsIEJpanUgRGFzIHdyb3RlOg0KPiA+
Pj4+DQo+ID4+Pj4NCj4gPj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+Pj4g
RnJvbTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gPj4+Pj4g
U2VudDogMDUgRGVjZW1iZXIgMjAyNSAxMDowMA0KPiA+Pj4+PiBUbzogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgcC56YWJlbEBwZW5ndXRyb25peC5kZQ0KPiA+Pj4+PiBD
YzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPj4+Pj4gbGludXgtcmVuZXNhcy1z
b2NAdmdlci5rZXJuZWwub3JnOw0KPiA+Pj4+PiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpu
ZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8y
XSByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kDQo+ID4+Pj4+IHRvIFJBTSBz
dXBwb3J0DQo+ID4+Pj4+DQo+ID4+Pj4+IEhpLCBCaWp1LA0KPiA+Pj4+Pg0KPiA+Pj4+PiBPbiAx
Mi81LzI1IDEwOjUzLCBCaWp1IERhcyB3cm90ZToNCj4gPj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+
Pj4gSGkgQ2xhdWRpdSwNCj4gPj4+Pj4+DQo+ID4+Pj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4+Pj4+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4
b24uZGV2Pg0KPiA+Pj4+Pj4+IFNlbnQ6IDA0IERlY2VtYmVyIDIwMjUgMTg6MjYNCj4gPj4+Pj4+
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gcmVzZXQ6IHJ6ZzJsLXVzYnBoeS1jdHJsOiBB
ZGQNCj4gPj4+Pj4+PiBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+ID4+Pj4+Pj4NCj4gPj4+DQo+
ID4+PiBGcm9tIG15IHByZXZpb3VzIGV4cGVyaWVuY2Ugd2l0aCBzdXNwZW5kL3Jlc3VtZSBpbXBs
ZW1lbnRhdGlvbnMsIEkNCj4gPj4+IGNhbiBzYXkgcmVzdG9yaW5nIHRoZSBzeXN0ZW0gaW4gZmFp
bHVyZSBjYXNlcyBpbiBzdXNwZW5kL3Jlc3VtZSBvcg0KPiA+Pj4gbm90LCBpcyB1cCB0byB0aGUg
c3Vic3lzdGVtIG1haW50YWluZXIuIFNvLCBJJ2xsIGxldCBQaGlsaXBwIHRvDQo+ID4+PiBkZWNp
ZGUgaG93IGhlIHdhbnRzIHRvIGdvIHdpdGggaXQgaW4gdGhpcw0KPiA+PiBkcml2ZXIuDQo+ID4+
Pg0KPiA+Pg0KPiA+PiBBZ3JlZWQuDQo+ID4+DQo+ID4+PiBUaGV5IGFyZSBzdGlsbCBzdXBwb3J0
aW5nIHN1c3BlbmQgdG8gaWRsZSwgd2hlcmUgcG93ZXIgaXMNCj4gPj4+IG1haW50YWluZWQsIHJp
Z2h0PyBTaG91bGRuJ3Qgd2UgY292ZXIgdGhpcyBjYXNlPw0KPiA+Pg0KPiA+PiBZZXMsIEkgYWdy
ZWUuIFByb2JhYmx5IGJlc3QgdGhpbmcgaXMgemVybyBmYWlsdXJlcywgaWYgdGhlcmUgaXMgYQ0K
PiA+PiBmYWlsdXJlIGluIHN1c3BlbmQgcGF0aCwgdGhlIHNhbWUgZGV2aWNlIHdpbGwgZmFpbCBp
biBzaW1pbGFyIGZhc2hpb24sIGFuZCB0aGUgc3lzdGVtIG5ldmVyIGVudGVycw0KPiBzdXNwZW5k
IHN0YXRlLg0KPiA+Pg0KPiA+PiBTbywgcmVwb3J0IHRoZSBmYWlsdXJlIGFuZCBkZWJ1ZyBhbmQg
Zml4IHRoZSBpc3N1ZS4NCj4gPg0KPiA+IEZZSSwgT24geW91ciByZXN1bWUgcGF0aCwgaWYgdGhl
IGJlbG93IGNhbGwgZmFpbHMsIHRoZW4gdGhlcmUgaXMgYSBwbSBpbWJhbGFuY2UgZm9yIG5leHQg
c3VzcGVuZCgpLg0KPiA+DQo+ID4gcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYp
Ow0KPiA+DQo+ID4gU2ltaWxhcmx5LCBpZiByZXNldF9hc3NlcnQoKSBmYWlscyBmb3IgYSBzaGFy
ZWQgcmVzZXQuDQo+IA0KPiBXb3VsZG4ndCBiZSB0aGUgc2FtZSBpZiB0aGVyZSB3aWxsIGJlIG5v
IGZhaWx1cmUgcGF0aCBjb2RlPw0KDQoNCkVnOg0KcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2Vy
dChwcml2LT5yc3RjKTsNCisJaWYgKHJldCkNCisJCWdvdG8gcHdycmR5X29mZjsNCg0KSGVyZSB5
b3UgYXJlIHNraXBwaW5nIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSwgVGhlIHN1YnNlcXVl
bnQgc3VzcGVuZCgpDQpXaWxsIGxlYWQgdG8gcG0gdW5kZXJmbG93IGVycm9yLg0KDQpTaW1pbGFy
bHksIG9uIHN1c3BlbmQoKSB5b3UgYXJlIGNoZWNraW5nIHRoZSBlcnJvciBjb2RlIG9mIHJlc2V0
X2Fzc2VydCgpLA0KSWYgaXQgZmFpbHMsIHlvdSBkZWFzc2VydCBpdC4gU3VycHJpc2luZ2x5LCB0
aGVyZSBpcyBubyBkZWFzc2VydCBvcGVyYXRpb24NCk9uIHJlc3VtZSgpLg0KDQoNCkNoZWVycywN
CkJpanUNCg0K


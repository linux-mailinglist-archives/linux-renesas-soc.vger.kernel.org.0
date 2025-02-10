Return-Path: <linux-renesas-soc+bounces-12990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A463A2ED64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 162AA3A3A09
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5C4222579;
	Mon, 10 Feb 2025 13:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gg03qg+b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DBD17557;
	Mon, 10 Feb 2025 13:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193546; cv=fail; b=FDH66cerj8DGWj8Z8CaWEcinR+Y5AtJHC8HIc89XXvkfftppTtp+u/VsDtprNpcSwBCgk71TqVMC010E/q9yjZjLwbZIdw3y6eNPEgDK4uHcIeMmk35bWsYySyKhjb5NYdE2vQ7fCKoXb9VLypZISyObAmGJMtmXYPdOczHLMxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193546; c=relaxed/simple;
	bh=dAfQBUgU/1FOw5OIow44/VBx9sQMmKIPnKbTzc0YaJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZtMUYe91OzgDBoq6CzrI6fBk5oAf0NkL1uqljsjkt9zO4VksLEMGT5m3XTyhz2zzCfCk8CTjE3Cj3m2FXYyQYrnRL45F7pszLt1L1fDCWGekmCexR2ZmuFPCVv5aOnv9ypEMQILzhXguUvu+ee6qzEu2Yk4TtcuRJ5zMxmLTiHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gg03qg+b; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wG4e7w0XikBJUVKW7/zy/+2TZsES5+YKkH6NMIbfREY7VRTGvBl9KctfXPoO7i2oLn68ZX0e5OH4a0wr1bm7EZlQ5Ogly9nx2KVKIt4V8BnuMEPsfC9pq/EhxhRyU0AHVGBDgRMqFV2xOT9yZXYO0LoPXole0la+Hoq6hG7ERL+0TfS3TUxGx2TIdje3lT6ii4Q7re/W084nBivzrTNz4zX1MvsOgbIMwc7uk6oii154nh8VQWhztrdTP1T3sUOj4Xh1BUyW+GzoJvu/8vQWNzAKB5YU3FZNMJ775rK6EmhZPrrpHYPC5a1tmS/wt93PtDJGKIanpAAl6DZp3r59TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAfQBUgU/1FOw5OIow44/VBx9sQMmKIPnKbTzc0YaJ4=;
 b=vF1x750zAje4muwaew5WaQTqU3Cv4k3UgrwuCl+peaHO2e2dxyAz70LT5lR5oTUGokF+lIQ9Vky27Acp6UfMLBB9+MIE7ZVdoRFaXioOr260/AtL+N8myvIw4oRNxzglcDQeql9DYGX0c3t6knCsDkrgfBSmLZ2wvaw2Ij+tdrF9bCRatSxcVJfETYeVLTIgciqzxQkTSLEf7zuGcBOW6VKEB1ZzjEhu1ZLP6kNg9s/foBP41zFwLphmv0UcJJVLuj8xuYzFnO1xmsc/WenCvP9YZw1aXt16PP5pFObh7WjWnDZO5+yOJhYogeS9aMmBWHnTFgAqNTrZa1sN2N9z0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAfQBUgU/1FOw5OIow44/VBx9sQMmKIPnKbTzc0YaJ4=;
 b=gg03qg+bYCvpw7byujADOR41fneBacIVpaJSHUwKbeDLNYRGoMYBbxHM/Fj41fgnTIrfeIAF02EOhi0xjUrZeugcHHZBBzt4WThv6vrpVTc/I7pxN4f7GxILeMnpN4R0Ys2JSyUn+p/miR397if/BHVgA3dY8tha9gnw0Pv2G3U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12308.jpnprd01.prod.outlook.com (2603:1096:604:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 13:19:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 13:19:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Thierry Bultel
	<thierry.bultel.yh@bp.renesas.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Thread-Topic: [PATCH 02/14] dt-bindings: serial: Document sci bindings for the
 Renesas RZ/T2H (a.k.a r9a09g077) SoC
Thread-Index: AQHbcm43r4oLrSpVA0ON7evH4m8LNLNAlqCAgAAAnrA=
Date: Mon, 10 Feb 2025 13:19:00 +0000
Message-ID:
 <TY3PR01MB11346D5D895C190EBE8C8A84B86F22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-3-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVB2W6R+xYeTUKSv_dMGruECSft-P19m6nZD61=ROngXw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12308:EE_
x-ms-office365-filtering-correlation-id: 76f464dd-764e-46c3-6860-08dd49d57ba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QmNoRStyU3lqM2RsSUhVZWk3ZUxnUThPaFRTZUoxUUtuVDdDUmVsWFI4ODZK?=
 =?utf-8?B?eVEzM2dDQlBlbVg3TjlZT0tId3JPcDZNQ254YnVTNW5UOEJJY08xWWhBOU9Q?=
 =?utf-8?B?VzNpUUFvTFhSV0VqcnMyWlF3VUw5MVNpY2hzNWZvQjl4QVNLTERmQjdSaWJm?=
 =?utf-8?B?LzBWMDVvNjR3ajF0VU9YeHkvNVJrTVhvNXpXVy9WOXZCeDZHdHE0SVYxUmVr?=
 =?utf-8?B?ZytINVhJai8zYWJuNmdIWFFSN1UvRVFQSE9aUFlIVnVFK2x6d0FTcWVPMUNy?=
 =?utf-8?B?eXMrS1kxRkplM0ordVBHUUJJRkc4RW5FaWZCT29jKzBjUGZJNFlDN2dIS245?=
 =?utf-8?B?dEJuVWp5bXVFR0xzUnU4VFh6Z2hUNlNsWHZidUtGL045dmFuZUlGb2JFdHJV?=
 =?utf-8?B?NDlidEtrVUVuT3VDcjhwVGx1b1NORFE2TlFFN092d1lmK1phZzBDamxQQVdY?=
 =?utf-8?B?WjV3L0xBZTVDVnBraXhrblBVMWV2SDVnVFBIeDdOa1lCU3RvNUIvUEVyYkM3?=
 =?utf-8?B?SDZLNGl1bVkwTEdMdXJadVRiMzM5cngwZHRia2hJQU8wYU1aSU1rT2pzY0ty?=
 =?utf-8?B?TjFsTmVpc21SdVJuYXZ1UzVCcm83Y0V1MHYxNlluemlNMmlwWG1sekczcjdl?=
 =?utf-8?B?NGtZaWxIcGU5dmd6c0lDWDdhbndOcmkzdnVxS2s0dlhxMlRDZHNBWGloSFNz?=
 =?utf-8?B?dFluOHhQazlTWGlYQ0pPdFdGaFU3TkhGSEZnazhzU1dWZEdkTklBL0Y1d05i?=
 =?utf-8?B?U1ZBaC9JOGtTbmhyMUFLZnJjWWtKMTlEbG1HTVBLTjZuOXN5UTI1YmlQRVFl?=
 =?utf-8?B?T1NVL1ZiRlRyK0hxZjFtK2tEYmsra3doV0NRRkZqY1pUUUJxSlBkZk9CUXZ0?=
 =?utf-8?B?eVZKSjZVejFNd0xoUVBoSFFuRmRGWnp2dkROUXRONTVqL0NrS3RpQzJsWm1p?=
 =?utf-8?B?VHZxVnd5bDN6ckNPcUtYQkxZeXNwejl4K2NyMDNBdUliWVJTNGxzRy82dzVq?=
 =?utf-8?B?UzVpQTlTcVpBaEplemV5Rld6UmVoNW1hbTluRHpUWUwvRDNibVlFdS9TUjNl?=
 =?utf-8?B?YXgyQlBPWXVnUm81NlRDc2JFS2JKVUw2RmdsL0o4MDBYSW5NUTZ6QlM2QUQz?=
 =?utf-8?B?cXJpVk9PY2I2ZStiaEVsemZkYVpiRWl1R0ZCeVAxSnI2UW5JSmpFTkh4MEpZ?=
 =?utf-8?B?dzJPRTV3OEZUd1B2cjBmTitHcFlUbXV2UGZjVE1TUW5RYytuS1dTVGdHVnd6?=
 =?utf-8?B?MEx5QS9kd2taMjRyellHWU5ROUFGM0wvYlNoWGp3ZVNBT0oxNUpPL0JRdXBu?=
 =?utf-8?B?NXd2T251OGxPVFdLVGpVdWRFR3p5aHJzWlg5bm9ZYXEyU2lHM01RaUcxNEIz?=
 =?utf-8?B?U3Q2REhPZ1p1SFRtbE5jaWF6SXA1dVRpd1JPb0Jtek51ejBJb3NwVFY3V1ll?=
 =?utf-8?B?ZUdBWVVObXg0RmVHQ212U1RYYzVJM3hBb1ZDdG1acHM1NTVGYWRQQ1ZKWjVl?=
 =?utf-8?B?YUV2U2k0TUxXNlZSYzZzaXloNVdHZFFOUDY2dENLZGtwYUpnMGdOQlhvZ2Q5?=
 =?utf-8?B?TjNZaGY5RFozSDIza1VoVmt2QVdwOUExMlFucm1oTjIvZmVZdkdlSFh5a2xu?=
 =?utf-8?B?ZWtLZjc4WitacXYzTFRxYi83b1EwZlpvTGU1Smk5OUZ0SUdNYTZ3Uk1DbFRD?=
 =?utf-8?B?dy94UHBQT0QxZW1BRWZnSXRGeEVESlpRci9vajMrK1lXVFR4cWxEaVNnVi81?=
 =?utf-8?B?d3prT0tlTjdkUDBWbHJTQWNkRjE3NEZrSVVZYUkrZGR2VXFCV0NJdDdaaHQ5?=
 =?utf-8?B?NXlQL21IaDBvZjI2Sy9Ud0dDcEg0ZGhZbk9qSHVNWXdLdUcrUjZVdG1Ud1dv?=
 =?utf-8?Q?5ugBkq6cb0TOe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0J4eC82UUlJTHZnUlNUb2Z2alJqYUk0UjlBZE1SYytFc3kwZTZNWC9JSzRj?=
 =?utf-8?B?VzJDeEVpYlJQUlhxRExoSzd4VEh1TzdkSTZkU3ZXcmNLTXE1WU1aWHZuTmFv?=
 =?utf-8?B?cDV6c2F1SkZib2dMQjREY3AxeVF4VXJFL0VlVGVSVUIrekRiaEo3dDZJZDRS?=
 =?utf-8?B?K1ZCbVl4WFRndkpEZHIvaHdWODJzTG1iM2RNZ2oySGwzM1RRaGFXVHFTL3FG?=
 =?utf-8?B?UGpmenpLTlJzODZldXI1M0F3NC9zOTJxRGZGaGZ2OHNSSEVibG1Kb2tBdWR1?=
 =?utf-8?B?S0ZsMkdIUXl4bDdxWE85NC9NVHVGcXAxSFRhOXFLVW5OK3ZiUlhKMVgrK09k?=
 =?utf-8?B?SlBVZXlDMFR0T0FvTzNoNHNoVWMybjFBSnJoRisxTVA1dXRwTXlUR2tXR1lH?=
 =?utf-8?B?ZHVTZzBqSEo5djVMRjFtcTlXVjh0SW16a0MyQmpreFFlZXRXMndFQm1nTlp1?=
 =?utf-8?B?dGgrTGVyU2tVNFlCcnBYbm52QStBck16L3FvTk04TmxhUm5nN0thajRxdGto?=
 =?utf-8?B?VVY5SFlnVlJBYlNUK0M1dHJWYVZIK05MUlRzTlZoTUxSQ085MkVWSURQN1p1?=
 =?utf-8?B?YUVwejZLaHB1OFRtRHlpMzNHbUdjZmF3eGFZMnZqalRkcFA3eVBIZE5vbHM3?=
 =?utf-8?B?Ly82NVpUNU95Y0pxd0J6dEhyVXdPMG9RZHlYQkJCTWxGODFnVkE1bFRHRzhN?=
 =?utf-8?B?YzdXbWZPWUtMSXhzVWlQb3l3dExEaFE1bm5qQ24rc0JtQUcxSkg0eXhkZmpV?=
 =?utf-8?B?T0ZvcFp4Q0VqOGoyL0U0MGdvdGo4Nk5WL20rdUpWWGVYMlE1K0Q0NUJFNGx5?=
 =?utf-8?B?UzVkcFRWZHM0ZGNMUWZFTnlueTliZ29GRlI2a1JFYWZmYWJpMXE0WjFyZGhj?=
 =?utf-8?B?MG0rWnMreWVOd3JVN2FGTUdUbUlmZ2s0ZmhEZm9HUENaZ3EyNjlSRTA4T3ht?=
 =?utf-8?B?N1IyazFlT2dpL1hqUzR0dmMwUzBIMnVaMm1IM1N6TXFyNWxxdE9hNXB2ZytP?=
 =?utf-8?B?TTc5bjl4NlZEb3NPbEpicEUwV1I5ZkJaaXlVUXZYeDdQTnN3YlNDMVltN1Jz?=
 =?utf-8?B?YkZhdTJhd1pjMjNpR01RT1ZLaCtrQk9zR1p5N2VVVkZFNWovb0toUmFIM3Ft?=
 =?utf-8?B?SnJ2bHN1Tzh4Y1IxZHhrK3hReWg2M2wxbmJxQ2hLM1FkM013TjdJT0ppdytN?=
 =?utf-8?B?YmR4QXlOdmFQcUpxM3FLMmF2NVFDZzJaMkE5YkhmSWdCRmpyYm5sK1hGdzVJ?=
 =?utf-8?B?SHJtRk5Tdm15aHF1WUE4UnJ5ejRDbUpoMGxERUlyUU4wNWhOMFdDcndqZzJ6?=
 =?utf-8?B?aWVtMHBvMlZzUzE4ampwbXdYTExteElCdzE5ckdVdzV2aXFaVURrNTBKM1l2?=
 =?utf-8?B?YXZZQXlVK2psemErVlh1V3ZVdlpwNW1YVm0ybzlVSWhYaGd6YTYxVmkzdUdV?=
 =?utf-8?B?UytiKzE5ZndnY3d4a2lCMlpoSHNJTi9zaytaK08yWWI4MzUwVVdJK2tvWk9j?=
 =?utf-8?B?RjV4OGI1N3pxZnZaSHd0Sm1QNmVOT2NVSWI0YXozREdJRzhJeXlyZ3VPNHF0?=
 =?utf-8?B?YkVSeWRBcHViLythdjRDOGthUnBxRThXSDhiY2RMS04zRVdEZERMMlVxbk9v?=
 =?utf-8?B?OGFzQVduR0RZRXQvQlZDRjdhT1FEcWRFamJCTzhNSVpLNHpQbzNKaE1hc2ZL?=
 =?utf-8?B?QzZxdktXUVB3Y1FiZGU2dDkraWl3RW1hWnhaeG5mVmNBRmNjWnN4SHVYSGFT?=
 =?utf-8?B?RnZyTitXVm5XV21MdFR3cHNkL0sva1BvNWlVUUVzSjZCVi8yQzRJREZqR0NU?=
 =?utf-8?B?Qlg4d1NrOHl6NXRmVTR0dkNCU2ZHZEJJWThreDZjSHc5bzdTcG5IL0dqbDNI?=
 =?utf-8?B?NnlLUGYrN0IxQXRNMnVrZXJHYjZ2a2I1dTlxVjdEbkVIeUJtMzhhV3ZHNnFn?=
 =?utf-8?B?ZTBvTFJwNFVjeGViNjZWOE1FUXByRjRFaDlCc0duUUYzTE1HRmE3QjZHMStz?=
 =?utf-8?B?STZNeklrUFFpMGxRNUtpakhieHFJNFE0WTlyQXZ4ZC81LzZBNS9MdXN5L0Ry?=
 =?utf-8?B?ZUg4WTBWcTQ0U3BDZWR6Z2FOdDlJTEFqZzdYaU8wdDdHRnh2OWxDd3lrbzlQ?=
 =?utf-8?B?ZnFoTlMxeE9nd1R2bWZVNHJVa29qd0FFR2o5cUdHYUtPUmtuemlqNmFleURC?=
 =?utf-8?B?SFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f464dd-764e-46c3-6860-08dd49d57ba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 13:19:00.7039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7pzILqcEcNM/PugN330GIF7Ke9e/SkPP+0OjDXb5GqwgTUiRFFd0v0r19MDnynZlwPYC5DNf02XzaFAxvMhIaw4XJpUpYbl9ot9A6B8WwDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12308

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTAgRmVicnVhcnkg
MjAyNSAxMzoxNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAyLzE0XSBkdC1iaW5kaW5nczogc2Vy
aWFsOiBEb2N1bWVudCBzY2kgYmluZGluZ3MgZm9yIHRoZSBSZW5lc2FzIFJaL1QySCAoYS5rLmEN
Cj4gcjlhMDlnMDc3KSBTb0MNCj4gDQo+IEhpIFRoaWVycnksDQo+IA0KPiBPbiBXZWQsIDI5IEph
biAyMDI1IGF0IDE3OjUyLCBUaGllcnJ5IEJ1bHRlbCA8dGhpZXJyeS5idWx0ZWwueWhAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+IERvY3VtZW50IFJaL1QySCAoYS5rLmEgcjlhMDlnMDc3KSBp
biBTQ0kgYmluZGluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgQnVsdGVsIDx0
aGllcnJ5LmJ1bHRlbC55aEBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCENCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxyenNjaS55YW1sDQo+ID4gQEAgLTAsMCAr
MSwxMDAgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9zZXJpYWwvcmVuZXNhcyxyenNjaS55YW1sIw0KPiANCj4gInJ6
c2NpIiBpcyBJTUhPIGEgYmFkIG5hbWUsIGFzIFNDSSBvbiBSWi9UMiBkaWZmZXJzIGZyb20gdGhl
IHNpbWlsYXItbmFtZWQgIlNDSSIgKHNvbWV0aW1lcyBjYWxsZWQNCj4gIlJTQ0kiIG9yICJTQ0ln
Iikgb24gUlovQTFILCBSWi9BMk0sIFJaL0cyTCwgUlovVjJMLCBhbmQgUlovRzNTIChhbmQgbW9z
dCBvbGQgU3VwZXJIIFNvQ3MpLg0KPiANCj4gQlRXLCBJIGJlbGlldmUgdGhlIHZhcmlhbnQgb24g
UlovVDIgaXMgYWxzbyB1c2VkIG9uIFJaL04yLCBSWi9WMkgsIGFuZCBSWi9HM0U/DQo+IA0KPiBI
b3dldmVyLCBiaW5kaW5nLXdpc2UsIHRoZXkgYWxsIHNlZW0gdG8gYmUgdmVyeSBzaW1pbGFyLg0K
PiBTbyBwZXJoYXBzIHlvdSBjYW4ganVzdCBhZGQgdGhpcyB0byB0aGUgZXhpc3RpbmcNCj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHNjaS55YW1sPw0K
DQpJdCBpcyBwcmVzZW50IGluIFJaL0czRSBhcyB3ZWxsLg0KUlNDSSBzdXBwb3J0cyBzY2ksIHNj
aWYsIGkyYyBhbmQgc3BpIHRoYXQgaXMgdGhlIHJlYXNvbiByZW5lc2FzLHJ6c2NpLnlhbWwgaW50
cm9kdWNlZC4NCg0KWW91IG1lYW4gYWRkIHRoaXMgaW4gcmVuZXNhcyxzY2kueWFtbCBhbmQgdGhl
biBleHBhbmQ/Pw0KDQpDaGVlcnMsDQpCaWp1DQo=


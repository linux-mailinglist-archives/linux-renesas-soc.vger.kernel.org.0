Return-Path: <linux-renesas-soc+bounces-11954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B10A0593B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 12:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A343A1C39
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 11:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD061F8AC5;
	Wed,  8 Jan 2025 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lgEDphqy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AA21F76C7;
	Wed,  8 Jan 2025 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334510; cv=fail; b=uxcugVQOoKjk+bQ4ctdB6XYeYc7GXX/Z+OP3IcpbR0fyTdhifHle8PszWuEIQ5vOrrf43TA/yAeXvfdmETa8ZAuSq+w3diqcZWjEkin1uxxsQqxjgoOj3K6upk0j0QXdLTsl7rLL9V/+oQe+NqGrhaCLRlLwlPv9Joz/Pq04aIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334510; c=relaxed/simple;
	bh=daOit8cXZ6xFoJy756tKfeSxh0l6R2/pp13baFqynQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FE6IyRDhLvCN2IX2HG+GZ9/ZwzQGIwa7Qn+Y1V1X6KVqVedmRxpHqlNw63izkn5ao8bU4kEJp+BVhiLV2bMo9OROwL7myVfpoevITHLEWic8+loiTem/03majdMZJN40rlJoTlD8owzPycJfQK2BBF7i61xU+OrVm+d3Jv5SHuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lgEDphqy; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGhkNtEcmokb+W2sAuhnq+8+UAPGVJ/1GSf3YltLzXTg89gBVOK/bvEPwZbBod5tyHrF1PfTMYASJbfPd9odm20gERvOYVQe9t1SpDW1aL0+1DIraXk/iU8V4Qg7xmhdSVXCSmT0WIsOIUqzM6Tf5V5+OBtunE4WbrtJ3S8s80k/b/ddTxeFkVBwSm1F5UGRkHZd8pLxXwnrArdyz8X9C8hdELqWuYD++JYS0SJom1CwVNW20Lh8aOdDla7L5jz+CJ68td3WJvkoHMwtn12C0PeaTxkWtR9vswZubcQguPoe+SfGmwPBFnC8NzW+39QSCKyjq5RhI+QLlHQ4sncRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daOit8cXZ6xFoJy756tKfeSxh0l6R2/pp13baFqynQU=;
 b=QHDyXhd7wYQ5ZZHfFiOTciH1Hdzziz0Ncj8bu5lOdeYWqrnIuvfN8TPIx5vf78aeIwgOLP8d3mEIpvYEVnz2TaCvE+X7N6QvJI0PUxNqa7mNZ0FEVg1kNSv54wiDvjHXrwUjqQx3dxxoSMXDTSgHe5XTdB3Z+BzaCBeP4l62bc0QvaQDXupVM6J+F2G5VuJ3o4HFra1cG+SkxBnrE8cPqjzmZZXTkyEbSJogVvYNhEKJQ9tt1Uyfew8LzEFxaBSf7VPfJ8CcMEQVHnh/1i/jWjY1l6u+j1DibzXbc0f/hoy6YMxKLP246lQbkBRyQc/bgQiVu4uhr0s6rA7Du8Hbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daOit8cXZ6xFoJy756tKfeSxh0l6R2/pp13baFqynQU=;
 b=lgEDphqyp0H3QvSu7B9LkBEra/vdgsvTFCuOkxQmh6nNxlEX9G1pRCx2CIWKwkDvQi1+6zwkuHcA2celnMBNECC7QKPV2dxDmr/k61GEfdoIJlPccwKFYp0KCEWdgIdn8hln/MwH18qMZom/k9i3kEZeSAj4k+AmnKrTSzCNdUo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB13801.jpnprd01.prod.outlook.com (2603:1096:405:1f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 11:08:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 11:08:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter
	<dan.carpenter@linaro.org>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] ASoC: renesas: rz-ssi: Add a check for negative
 sample_space
Thread-Topic: [PATCH] ASoC: renesas: rz-ssi: Add a check for negative
 sample_space
Thread-Index: AQHbYa+88XIfPXDPDEG8UbxpkdB4drMMtPgAgAACVZA=
Date: Wed, 8 Jan 2025 11:08:24 +0000
Message-ID:
 <TY3PR01MB113463ACD4D18075A0DCD2F6D86122@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <e07c3dc5-d885-4b04-a742-71f42243f4fd@stanley.mountain>
 <CAMuHMdWRm0UtJ+vZgmizjHW6y7gCfLoWapjC3Hh0w3ABWOG9YA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWRm0UtJ+vZgmizjHW6y7gCfLoWapjC3Hh0w3ABWOG9YA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB13801:EE_
x-ms-office365-filtering-correlation-id: 49b8463e-e089-4e51-4e8a-08dd2fd4c54b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGZXMWlaZHZjcTU0eGZJZnArTkJ6MmRZRHNSZ0dGekpRNDRjbmdkd1d1NjNs?=
 =?utf-8?B?ajVpWUlsUFJ6T3pnVlRWZThCVk9YV1FxOU53bWdIMmxlSFJjd2RINXM1Y2ha?=
 =?utf-8?B?ZkcxK0U3V3VZV3VUNEVuUFNWN0xITjZxU0RNZmNBN1ViZFJyTC9keXk4RnFs?=
 =?utf-8?B?ekFPVFZndzN1L091L25qYVlYaUowMzU3TXdHZHBhNDgxWEFoeWxIa25OZllE?=
 =?utf-8?B?QlppTTJTUnhiNUN0S1dFQXdqK0dVYUNjaVRRUFhCUEtHV0RBbDVqVUdsNnI3?=
 =?utf-8?B?MmpmekwxVjNnVklZdkJ5MFdMT3d6Ymw0TDFvMGI4RXhKMG8rZk16aTlkWE9C?=
 =?utf-8?B?QlcwdE93YTNvTU1SK1dBL2dUUjFZb3dxQkZ2OFFCbTA4Yy9yWVFqeWJOUmhm?=
 =?utf-8?B?UXR4WVdkTUNINTgyRjd6cTUwNVpGa3pzTlpSK0ZOODRIbURoRkRXaFJyblZn?=
 =?utf-8?B?b2I1TE1jeE95SVZDNHZYUUNWZjBUL0NmSEgvR1NPRzlRdUpld2dXa3FzTEla?=
 =?utf-8?B?WDlOazM4c0czMmNwbjNKa21ySGJlUksvZGhnaG5saUFaZWZCQTQ0RDY0Vng4?=
 =?utf-8?B?blFIeGZUMC9KMnJKV1VkMlFwZG1rajMrVzh3ZW82dC9Cc3N2Vi9ERVdtRWha?=
 =?utf-8?B?T0ZmSHVYRkc1L2tFaDhsNzZ6ZTV2ZWFnZzRKUUhvaXYvakUyYUNVbXVaWk5Y?=
 =?utf-8?B?S1dIM25XWEpqdlArOVZ1NTFFZkdObEJKVlBpZjFTQi96Mk9HMTljbXdIWTJn?=
 =?utf-8?B?MXRHakpETURCTFR1TnB2cVRSeTJDSU42Qm9aZjliSkExSk9MMzhqSVpVRlV0?=
 =?utf-8?B?SFBmaVEzOHJqcjlMM2RKay9EZE1DSk84ZXV5T0ZVZmJXdXBjcjUvMlhQYm16?=
 =?utf-8?B?SXM1aElEbFR3U1RtNi9DOC9kUHdiUENocWdvdWdNNHRwdUFxMnBNQzU1NURz?=
 =?utf-8?B?UTVNU2N4TGpXekE2MWh3NWhZQk5GUzhENWJBa1AraWtUZUZmeUQzMTZSNlpk?=
 =?utf-8?B?MWVVN2VIOFdCUEw4Zmc5Qm1VbEkzclBNMlhybWNzVW5ROXBuSGVxbzU3WlZm?=
 =?utf-8?B?cEtWcTdBQXhhUUh0bkttSFlSOGtCSFdKM2lpUGNYMi9zcGxDdS9CSk9tcUw1?=
 =?utf-8?B?UDNkeXpHcUFySTFQWkFtK0puMGxpWGFVRkE3MlpqTnNLd2wwcGJ3YWxpY3NV?=
 =?utf-8?B?NGlzUzBvdWZCa1NoTERJaVNVYzRVTk5LdnlUeWhEV0N3bHBFRXpyeGFwaFpp?=
 =?utf-8?B?V1R4Wlk5WCtTS2VheldUZ1BZZk9rY1VYbnppOTcwRXVmOHo5aTJTTkhDakRF?=
 =?utf-8?B?UXhxNFJLZjNvTjJ6Nk1wdWZ2R2V5TjI4dkRyTWpDeFJqNFRTSThEWXZiNEx4?=
 =?utf-8?B?VmtsZnJVM0k2OTgxa1BRZ1dObTVYcDVPU05HUVJHTUNySUM0Sm1SaUM5R1hH?=
 =?utf-8?B?YzFpMWxHcjZJWVg2YXZkWTJnTDdhcHZuUzVCdG5xOGJZMjFIZmR0QXBVdStx?=
 =?utf-8?B?VWovYjFXZ3FqVmJiTHpXK1NjNWRXenNBang4bnBBcm9kS2t5V1ZyMEViWkQy?=
 =?utf-8?B?UERkb1ZOQlVKbzZsN1pTVkFDQVY0WXU0bHFYSjZiMzBRQ2ZsOVk2SFNka0ZH?=
 =?utf-8?B?R0RIeEhLYm9mdFBDTXFtekFiV2tEQ1ZlSmtWUHo2Zzg1d3JxUVBYUGE3cVJH?=
 =?utf-8?B?RUoxa1piQXhkRDQwcXRSSUp6bTRBZ2dGNGRSWGpnM0oyNXNuNGpYUlV0bWpv?=
 =?utf-8?B?TFUyMlJ3VWhjOVdmczM4UGFhTmNsTEN6UXFMeWhMRlBrUS9ZcnhuQXpxYkNS?=
 =?utf-8?B?ZzZtMnJYS1lOcFJzK0I0cTNZY0VsUkZiMUF5eTZXVm9vL0I5YVZ3dUFxOW5Z?=
 =?utf-8?B?ek9RUFpBVEFKQmZaWFdmcjU2aitmNTAxZjRFaDhXSmdIUFNBWjRGZWFxSjM1?=
 =?utf-8?Q?pkwGJegKAv4rKI19EZXDAwY/IwRQQRCg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UnlieHdCWnJsdzlGUDRFK0hyU29RS0ViOWJqZzNLc1h1QmxqYTRCM0NqTVZx?=
 =?utf-8?B?VTFZajMxK0dIVDhMRG51ckJOKzhOdGhnZWp1MHhYZ2oyN0Ztd3doNmhZbWd4?=
 =?utf-8?B?ekpZdE81cWNkS1EranhmUzlubk0zdkVDVlQ2SlRXWUliQlpPSjJkVHpLMlAv?=
 =?utf-8?B?YmxmUzdsNGJpcFB3d0YrR2tCRk1MNjZhTkxaYjZNMzlKbURDMTBKY3lWZ0ht?=
 =?utf-8?B?eUVxclJ1Rk9iak9XaVdEMEtBb0lhdldwbUV3TUd4azFSOVh3WUUwSEdQcWIw?=
 =?utf-8?B?cUR3Q2tndEs1Q3lld0p0SEZVU0drTVd2K1lxbjhCMWoxL3JhN2VUTEFNenpH?=
 =?utf-8?B?QzBoNFFBdmVrZFhmRmd5QW5BNmU5dytkYXIzQXpONm9pQnZrRTh5NFMyWDdE?=
 =?utf-8?B?WVhCZkQ0OVdMUjVKNE42VWRiYUQ2YXV2cUthcVFJV1VkTFdDc2U3L2VUcEZp?=
 =?utf-8?B?MFpDN1VSN0ZEZXZ1bG5xbE4wNTVVUGdaSmR0S2xBNlovY3pOVy9rcGw0VHJ2?=
 =?utf-8?B?U3NNbWNkb3hteHJLbzY3SEpiNWNQaVhWNE41VlIxUG0yaitycTlDbDhUY250?=
 =?utf-8?B?dXU3MUI4NTh5bkI4WkNLek5uQjVRYjBlckxqRUliTGY2YU10dnlLL0V2Tkc3?=
 =?utf-8?B?ZFRxYmc3a0h2TkFSblpUVXRxUHI4UTQybmJzZnA0ekR1RElVeTI2YnhhbEYw?=
 =?utf-8?B?aXN5Y3dqRCtyK3pTV0xqOVQ4R1BkK3BZcUhTbXFnNGx5bnRLSzgvSlptNWx1?=
 =?utf-8?B?YjcrbUtmTjFiNVlRRVVFU1RIdnZUV2JINWN2TXNDdFFsNWMwekpadk81ZmIr?=
 =?utf-8?B?S0UzMXBsSFZ3NFZKV01sU2VxOHI5TmdDaDM0dURCOEdhUE5yWm5PVzkrUzM1?=
 =?utf-8?B?RGNiSzMzd2dwcVB6RWhDc21adTR3bTFxcktuVWVvNXBRWE1iSFNvcmp1WGtI?=
 =?utf-8?B?ZlNjWks0RisrK2FQMjNLOVlxWDlBRTNWWXdMN0FvU21BalVaUVBtN2pBdlZS?=
 =?utf-8?B?Zi84Y0lacmdqc2JyTU54NW9uQ25FYURPZGhvaUZkdFBwaEFGLzJwL2JnN29G?=
 =?utf-8?B?T0lOOUhNUkJPejBmT3YvaEtwaEpVZkNpRnpzSklscEU2WHZwcEVQZXc1di9K?=
 =?utf-8?B?Yjg5MzJPNHNtL050bW9BaktoY0RJQVRhT2lIVnhuYjUyMktseXRKdkN4clJz?=
 =?utf-8?B?RUErRk5KZWNaSldjMFVIMFBlZWlqM05hVjJNTjdRV0xHUGUyT1N2eDVFNTd6?=
 =?utf-8?B?MGEraEdaMzBsWUVqTU5yNUxsUzF1cFJUUmlkWmNRT1kxbkZESDBUS0cyTmts?=
 =?utf-8?B?SjNwK3l0OG5RaVB5RWU3dmhvZHNzTzN0Zms2RXltdVg4VzVzelRvZ09PMG4y?=
 =?utf-8?B?VXVvTVBFWnpmZS8wOTBQek83N3RnRE1XVitZcE91SkoxdjVYSnFJSVNXNFhC?=
 =?utf-8?B?S1FsbTJCQm1paXBOTFV6RkxLRWVBUTZ5NnRwR2tBQWxhZnVOS1BPTjNDR1Zw?=
 =?utf-8?B?RUwvYmVPS1NtbUhkU1IrYjQwc3lKLzlQZlY3K0hwYVEwb0JNNVNiT2RMWHpm?=
 =?utf-8?B?ZGxnN3dwS3gveGJ6RlluVmQ2ajYrVFh5aEN3WTUrQkU1RHhGNlpvVUlOcFlz?=
 =?utf-8?B?S2V3bmkvUEtMeTVMU1VQRUJPN1VkNnQwcHhzdS9EWjZEOFZ5Yk9meE45WHRL?=
 =?utf-8?B?QzM4QjhuZG9FYXlNRUw3dU9uTDk3QWl6L3kvNFdaOHNQZGYrV1MwdXU2cWlx?=
 =?utf-8?B?bWV6bTM0bU9Uc3pvemNDaVBFMG1KNjd2bTJIZDlIS3k1TXlJNDJsY2lJWWhQ?=
 =?utf-8?B?aWNnMlFTL3R6VmQ0U1BhR2hkeVAwTTBxcGJQU2RzeUJFMEdBMmhuSzNPWWRk?=
 =?utf-8?B?SC9rVVo3RXpkSGFtL01EeUtLejNyQWI0OFNzeTBCZVNTTGsySzNxb0FRcHR1?=
 =?utf-8?B?TWhBOG9vWXdtSnU3akRLVTdHc1k0dUExU3Y2ei9zM3pIMmF3M2JvcFRwOWI3?=
 =?utf-8?B?ZU5MRHJGeWYwczNtZ2dEaGFselRSS0MyNFBzajlKMENsNzRVMGU5UVhBaDdV?=
 =?utf-8?B?dTN0WkFUc2kzOUxxbmlNUDZIekUvclZ6THlaejM0UGJaeGJoQ0EwNnRLS05S?=
 =?utf-8?Q?qS1jgd57piv7re5lwMT7nTv6y?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b8463e-e089-4e51-4e8a-08dd2fd4c54b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 11:08:24.5831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQ8Lkdrjh+mehFd78X8DUeGcGOIUIJtYVaNj+0MFXdsViafYu+GGRs3TzTMW95xLW1oqyETMl3rXi91NxTOJSMqVi7SqgNvly7CBw2vI+HU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13801

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDggSmFudWFyeSAy
MDI1IDEwOjU4DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFTb0M6IHJlbmVzYXM6IHJ6LXNzaTog
QWRkIGEgY2hlY2sgZm9yIG5lZ2F0aXZlIHNhbXBsZV9zcGFjZQ0KPiANCj4gSGkgRGFuLA0KPiAN
Cj4gT24gV2VkLCBKYW4gOCwgMjAyNSBhdCAxMDoyOeKAr0FNIERhbiBDYXJwZW50ZXIgPGRhbi5j
YXJwZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+ID4gTXkgc3RhdGljIGNoZWNrZXIgcnVsZSBj
b21wbGFpbnMgYWJvdXQgdGhpcyBjb2RlLiAgVGhlIGNvbmNlcm4gaXMgdGhhdA0KPiA+IGlmICJz
YW1wbGVfc3BhY2UiIGlzIG5lZ2F0aXZlIHRoZW4gdGhlICJzYW1wbGVfc3BhY2UgPj0gcnVudGlt
ZS0+Y2hhbm5lbHMiDQo+ID4gY29uZGl0aW9uIHdpbGwgbm90IHdvcmsgYXMgaW50ZW5kZWQgYmVj
YXVzZSBpdCB3aWxsIGJlIHR5cGUgcHJvbW90ZWQNCj4gPiB0byBhIGhpZ2ggdW5zaWduZWQgaW50
IHZhbHVlLg0KPiA+DQo+ID4gc3RybS0+Zmlmb19zYW1wbGVfc2l6ZSBpcyBTU0lfRklGT19ERVBU
SCAoMzIpLiAgVGhlIFNTSUZTUl9URENfTUFTSyBpcw0KPiA+IDB4M2YuICBXaXRob3V0IGFueSBm
dXJ0aGVyIGNvbnRleHQgaXQgZG9lcyBzZWVtIGxpa2UgYSByZWFzb25hYmxlDQo+ID4gd2Fybmlu
ZyBhbmQgaXQgY2FuJ3QgaHVydCB0byBhZGQgYSBjaGVjayBmb3IgbmVnYXRpdmVzLg0KPiA+DQo+
ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBGaXhlczogMDNlNzg2YmQ0MzQxICgi
QVNvQzogc2g6IEFkZCBSWi9HMkwgU1NJRi0yIGRyaXZlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPg0KPiANCj4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9zb3VuZC9zb2MvcmVuZXNhcy9yei1zc2kuYw0K
PiA+ICsrKyBiL3NvdW5kL3NvYy9yZW5lc2FzL3J6LXNzaS5jDQo+ID4gQEAgLTUyMSw2ICs1MjEs
OCBAQCBzdGF0aWMgaW50IHJ6X3NzaV9waW9fc2VuZChzdHJ1Y3Qgcnpfc3NpX3ByaXYgKnNzaSwg
c3RydWN0IHJ6X3NzaV9zdHJlYW0gKnN0cm0pDQo+ID4gICAgICAgICBzYW1wbGVfc3BhY2UgPSBz
dHJtLT5maWZvX3NhbXBsZV9zaXplOw0KPiA+ICAgICAgICAgc3NpZnNyID0gcnpfc3NpX3JlZ19y
ZWFkbChzc2ksIFNTSUZTUik7DQo+ID4gICAgICAgICBzYW1wbGVfc3BhY2UgLT0gKHNzaWZzciA+
PiBTU0lGU1JfVERDX1NISUZUKSAmDQo+ID4gU1NJRlNSX1REQ19NQVNLOw0KPiA+ICsgICAgICAg
aWYgKHNhbXBsZV9zcGFjZSA8IDApDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiA+DQo+ID4gICAgICAgICAvKiBPbmx5IGFkZCBmdWxsIGZyYW1lcyBhdCBhIHRpbWUgKi8N
Cj4gPiAgICAgICAgIHdoaWxlIChmcmFtZXNfbGVmdCAmJiAoc2FtcGxlX3NwYWNlID49IHJ1bnRp
bWUtPmNoYW5uZWxzKSkgew0KPiANCj4gSW4gcHJhY3RpY2UgdGhpcyBjYW5ub3QgaGFwcGVuLCBh
cyB0aGUgbWF4aW11bSB2YWx1ZSBvZiB0aGUgZmllbGQgaXMgMHgyMCAoPSBTU0lfRklGT19ERVBU
SCksIGJ1dA0KPiBiZXR0ZXIgc2FmZSB0aGFuIHNvcnJ5LCBzbw0KPiBSZXZpZXdlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEJpanUvUHJh
Ymhha2FyOiBUaGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIFREQyBiaXRzIGluIHRoZSBGSUZPIFN0
YXR1cyBSZWdpc3RlciBzZWVtcyB0byBiZSBpbmNvcnJlY3QNCj4gKGluIGFsbCBvZiB0aGUgUlov
RzJMLCBSWi9HMlVMLCBSWi9HM1MsIGFuZCBSWi9BMk0gZG9jdW1lbnRhdGlvbik6DQo+IA0KPiAg
ICAgVERDWzU6MF0gQml0cw0KPiAgICAgVGhlc2UgYml0cyBpbmRpY2F0ZSB0aGUgbnVtYmVyIG9m
IHZhbGlkIGRhdGEgdGhhdCBhcmUgc3RvcmVkIGluDQo+ICAgICB0aGUgdHJhbnNtaXQgRklGTyBk
YXRhIHJlZ2lzdGVyIChTU0lGVERSKS4gV2l0aCB0aGlzIGZsYWcgYXMgSOKAmTAsDQo+ICAgICB0
aGVyZSBpcyBubyBkYXRhIHRvIGJlIHRyYW5zbWl0dGVkLiBXaXRoIEjigJkxMCwgdGhlcmUgaXMg
bm8gc3BhY2UgdG8NCj4gICAgIHdyaXRlIGRhdGEuDQo+IA0KPiBBcyB0aGUgRklGTyBzaXplIGlz
IDQgYnl0ZXMgeCAzMiBzdGFnZXMgZm9yIGJvdGggdGhlIHRyYW5zbWl0IGFuZCByZWNlaXZlIEZJ
Rk9zLCB0aGUgYWJvdmUgc2hvdWxkIGJlDQo+IEgnMjAgaW5zdGVhZCBvZiBIJzEwLg0KDQpUaGFu
a3MgZm9yIHBvaW50aW5nIGl0IG91dC4gV2lsbCBjaGVjayB0aGlzIHdpdGggSFcgZG9jdW1lbnRh
dGlvbiB0ZWFtIGFib3V0IHRoaXMgaXNzdWUuDQoNCkNoZWVycywNCkJpanUNCg==


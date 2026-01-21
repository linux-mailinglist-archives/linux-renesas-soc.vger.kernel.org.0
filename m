Return-Path: <linux-renesas-soc+bounces-27174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCMoB5OKcGkEYQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 09:13:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCBB534D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 09:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A0BC509C2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 08:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A8E3EDAAE;
	Wed, 21 Jan 2026 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="i02GxQr/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473A43A1A33;
	Wed, 21 Jan 2026 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768983025; cv=fail; b=GWqBPBKNhSm+QImbArEhW9BlNfLz4Ur/NZKMsiFZtJA0+eSiAobQe6sfO+lcje7Luo7DH6B75MMasxTCzCKwSkPz8m2mNML7qdRKYEaBSImejW5qtqnkzoUnl8rONkC18EOjXH9YSfuiXqkTHBkpsNNsuGYF284ibP5lTUpL30I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768983025; c=relaxed/simple;
	bh=EE8e9nBQFvbcZmGauXNJqUNmelOWkyblrzBEuz2S2/w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XZMtdWuAp6z4TPNxTd2ks+3I48BQXUlLVXHc4ULuLwe5cXpkVybT+5LpNREpo+1PYyf+Y6tyTH2t6oD6TuBRZYWC1AHjNIrgiTa0VxOsORXH9AaycC4p1zLbqL+pMuMU5pjXOJAyOPkpx1gEdQ/nRzadIs4B0RhcFSKlGyG+2uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=i02GxQr/; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCAk37OzPykAzK+vtoZYVgJu4L77ELVvdmW6DIwNnpsgXsgwmPcAXyti+9VevxveqtclR01NxiO/WR4cdETYTSM94LAnrH+jMa7Lo3wovtiGfSLhAMLKGWKGtG2ncZEzrC95d5NZX2ilcwaGQp8bbSUsyH4hJ/0d/HDmdCqcZzjfP1K88HHiXPGSAV6jULYopdxrY/jNwyk5kfXCDzXcGzM2APs69ZR/kPZN8W2BqJh0rcTxkBu4P6rGzxsPAlmSWPcuWflWVBQGKlwqAz1M03DfPk93iLD2sE8YUCbVmIW7r9M3f9zLfPihp92R6uEhZAkm17vljiO9bbguVZc/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE8e9nBQFvbcZmGauXNJqUNmelOWkyblrzBEuz2S2/w=;
 b=k5wYiacFxxdXjCn3LoY6gzDHnjvwmpY+cY2OxfIDnj+kI0ExDJYO/4KK+8OVS0Ov7C//UtO4ASr5MuYpqxkZaGn9H+s8fmvDMC9CSfyRPLoLoXwZHONnSMj5/JZZM2GrdjvIvF+56+btSTJ0iuHX7GvCK1mtCRfErRU6MKoVG92GItypc6j7LK1OirMSDe8gQJWYeTgcBSLKU9QnrQ6LQhHVHFtAqb2sJWe7YFUyOsr1YlclaqdqBhl9KJUr3GiVSxGwarI4/vi8FJ0dhnoH0igFUthU4Mdk9Ym/OijYQOKzxOqwT2DOCSZuMDi5MHd9lK1HrAs4lrpIhlChlKcX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE8e9nBQFvbcZmGauXNJqUNmelOWkyblrzBEuz2S2/w=;
 b=i02GxQr/U+1KyyjKCq7AJk9cY8qRs0pWdsUXIVjG+tCJQ7SzKXFUbo41wu6y0zc0bXfKPZhYYTljT4CdxDJBCFwnrTZcOLMSyklT9E6lwvvOA3r4R6Q2izt4dRyyB9EHLHUR7cHicGyUg95dXhj50l1LRx6Qny3MsiGWqYuZV1Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13408.jpnprd01.prod.outlook.com (2603:1096:604:336::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:10:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:10:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 01/16] PCI: rzg3s-host: Fix reset handling in probe error
 path
Thread-Topic: [PATCH 01/16] PCI: rzg3s-host: Fix reset handling in probe error
 path
Thread-Index: AQHchWtza50hYEvYfUylfeKsr29zsLVZjjuAgAH3QQCAAMoAEA==
Date: Wed, 21 Jan 2026 08:10:17 +0000
Message-ID:
 <TY3PR01MB113465421664914635BE612168696A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-2-john.madieu.xa@bp.renesas.com>
 <f6c7cea6-fbd0-4b3a-ab89-a3c26be11ce6@tuxon.dev>
 <TY6PR01MB173777C7DBD6FCAC1C8AF6974FF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY6PR01MB173777C7DBD6FCAC1C8AF6974FF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13408:EE_
x-ms-office365-filtering-correlation-id: 1cbe377d-31bf-4d54-9cf0-08de58c483a3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXV4OXJFanJnY3l1SmQ0QmFub2JPMkM4eWl1TFB5MG8ycUc5Zytaa25ZbXhx?=
 =?utf-8?B?akttUHhrV0creHVLRXVMKzlnTkl2amc4VG9wdG9rcCtGSXUxdFFjdmgxWDZX?=
 =?utf-8?B?bllOcGQrOGhMQStKV2xLWmZ4clI1cVo4NUZtQ2JFbjhPTENQam5LOUsrUUNz?=
 =?utf-8?B?SDZiaXQybzgwNmpvbjRBWld3Nnl1bWsrR0twYzI2TlZOOXFjUWlTc1pMSEts?=
 =?utf-8?B?SW82ckZxWkpueHhGdUx3Ylgwd2ZwRUhoOHo2b2wyVDBiZ0ljZ1E5dWRUcVBY?=
 =?utf-8?B?dGkvSkREcXhMUHhITkMyZnB1MFArcGRpUCtiYkt0UHdjbGsydFplYXh3ZkVu?=
 =?utf-8?B?U3lJOW5pVG1wMGkxSHFYbDd6cHRrdmUwVUgwZ291c3d0NWIxZHMwUTJOTEF5?=
 =?utf-8?B?NTFjNzhzc0hPbWkrbXZNNGpwNjR6TmlxbnhwNnI2d2FLUFFHK21OR3dHUDEy?=
 =?utf-8?B?SmdSeFNpbnpSSUpUQTM4N1pMVzcxM1I0MUY0QXlseTR3RGxUQlVHTUFJdGhw?=
 =?utf-8?B?VFFIeHpvbk9nWEdGbGNza0tsNlZGUTdEVUlOYjk1dW45UU4zQWRqR245YUZh?=
 =?utf-8?B?MWdiMHcvSSs5UDVUZ1NLQjBkdWl3UmxXVGdRbGRQUXZRejlMOUhid1dzNjFJ?=
 =?utf-8?B?ZCtYV1daemRPSC95VFRJVkgyTzJmZjBIZ3dwY0hqQU5RdzRYZEx4c2RodXZC?=
 =?utf-8?B?ZElSUExsekhYT1hqZ3B0cTVXMzBhcVNOcXhqazJBK1h3d0ErUDY2MmswWUo5?=
 =?utf-8?B?WkxBSlYyd3RQaE5JNzdLdVRldmhaR3daWGZEK3Bnd1NZRWd6N3RVSTVCSkxq?=
 =?utf-8?B?R0xZdTY4R2dQZ29RRXVGUm43NTNPT3JpSnVVTnFWQkFWRG1Na20wcHJSQWJJ?=
 =?utf-8?B?UWNhbm9lMGdpcE5HNmVtdG0zZXlGSDJnbGxRUVZUQzVrUFFVRitIYS9EdzV1?=
 =?utf-8?B?SXBtMzhmam5YUmc5NGhkcW5DVTFrcnhFZnozc2dWbUFCb2pMQThZZDVKTlFQ?=
 =?utf-8?B?RDgyS3dsb0ZsU2tGdGc1N3dWaHA0UUxzT3Mzd2dQZCtxbXA4YnRJeCtpR3BE?=
 =?utf-8?B?Q1VKbzBDdGNPYnpiY1JsMGJjNlMvT056TE9HOUJzL0txRmNjd1VpejlQUTNL?=
 =?utf-8?B?aUo1d296VXNHaUx4aUtSdi9YN3dTTjRCRlJCTlkvek5XMVlZSSt1aURDSDlD?=
 =?utf-8?B?V3lwMUl6aFROWllkY1dsd2svd0lNdzhORmh6V0UwckF3UHg2SitoUzlOdmI3?=
 =?utf-8?B?SkovQ0FrN3dFd0FxcW5DRzJOSHF3YnBDek1UcVhFVXFTNmwrWFZ0NnVscEJx?=
 =?utf-8?B?VjZqRDljcXgxbzJTenQ1N1dUYVZNVm9zUGU3V3dxVzBKM2RsdEVYZnl6RVlj?=
 =?utf-8?B?Sm5OS21sUmc2QWxzaGNzcDB3eGQwb1ArT1YwYktWQjM4UkI3bTNhUTFOYzA2?=
 =?utf-8?B?MEUzQmMrMXEvYzBocXJHQVNqYURZN1Zob0pXQzNWd3RjOVlsTEV4Nk5KcEhk?=
 =?utf-8?B?R3dBLzd5emJ2MDhyM09SWHVXRFh6NUpCVjd0K0JFNnJvTHR4V0hLalZZUVlS?=
 =?utf-8?B?VWpyUnM4ZnJsb1RuR2VEc1Foc0ZiemNjS1N5TnIwUkZIYzFaL2xBRy9EWURP?=
 =?utf-8?B?SjBKcUNtWkt4eHZXSjdHN2QweEhobG84QVhIT2FIQWhld3pwTjlEVHJKUXRs?=
 =?utf-8?B?VXhWWHRVcXFlNVRrR2lPdkszd1lCS1V6T0VwVWx6cGlrdnVBVkFVSnNEZnRw?=
 =?utf-8?B?VDZSRGtySzhqU201SUFERmUzYXFLTndCcENLamhNM29mK1BoMjNpYzA5TUYz?=
 =?utf-8?B?U2NER3FIQjllWGI1bjJ2VUd5WWVWL1ZwM2poK09OcEhTaVBDK3pCK1NmdFVw?=
 =?utf-8?B?a0JFWnBocDhUT3A3V3ZiNzA2eG05TnA3NUtSZ2dmV2VlMnN4UHBpcFhOeUFi?=
 =?utf-8?B?MXE4MVRFOTRVbXd2eXlOY1pMaXpnekwwUnU2ZmlydTFVSkkvSysyblJnVmdy?=
 =?utf-8?B?anExdmJRSXFRaU1YQXdzN3c2bWxHVFpHSi9uQjJtMFd5QThCMFpPQUhXc3By?=
 =?utf-8?B?alJOUEdNWmVWRUpLOXZIZEJzcUUrRmF4VVdObzkyYXhLdFUyNVJzUEFLRFd0?=
 =?utf-8?B?K2pvb2hUNkpabko0L2tuRVdweGltdmswMUw0WGtrbWwyYys3UzNyNUFIMjNY?=
 =?utf-8?Q?tuZ9mL1UlXqgg6ekxpQFB0A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGs2REtENnNCSFc3bkVneHcvSGlkTDVFcER5amQzR2NYYXpXTEVSRkhsUWxY?=
 =?utf-8?B?c1d0YnU5V3VtU1hzblJjYUxzOW9lZVF1Y21CN0w2Z3BqTDBiaHFYS0ZsdnpE?=
 =?utf-8?B?dmZPMHBvOGlXRVFMMUI1SXNKejBNbi80d2xzMi81QjlXRWJFWWFxbWQ4Zldo?=
 =?utf-8?B?MkloWDZWY1RkNW52ZmM5YVdyUDBzS3B3KzNvV0htWUdaSFkrZ1NmeGQrQnZM?=
 =?utf-8?B?aVdnOXBHeWVONkd4NVdrajU1Y3haZVVUOWhsQlJHWlJSSkdUcEQwRUFVckVF?=
 =?utf-8?B?dkFxUlh5S2tNOERObjhORSt0MlZiaWpWQ0ZLaU16MmxuTmR1RE1iUW5FR3Aw?=
 =?utf-8?B?ekpjeGFSQTNubUVOLy8yTmpjcEF2bkFMeVNDQjgzWW4wSit3N0d6MmplVUVy?=
 =?utf-8?B?UHN5T1AyYmxubXdNeXVCcmdGOFpOQnBuYTlJUUtnVzZvMHZYRHlzeVR4M2lH?=
 =?utf-8?B?YUMvdkVuQ1NGeEZENlNyZTQxbVRZa2dwcmdTanIxdi9uZDgxK2hKa29Pa0pF?=
 =?utf-8?B?OSsvTzVITDc1a0s0eWI1RkMvMFJmc3d5QzY1SFBIZDJ1WWlQYm9LelZTR3Va?=
 =?utf-8?B?ZkpjSjhBR1NiZTd5b0FVVDFpZEpUUC9EU1M4YjVEUldhampGQ1A4TVJ3NzM4?=
 =?utf-8?B?ellucHl0UmRjUnc4YVNvZGVGZ2I4VjQ2aDZQYmNzbldla3FFUEVNczJnbi85?=
 =?utf-8?B?Z1lJT1dmWndVdER3T3EyTXRvNzV2V3RCWnA2elVmcnNrVTdKaWdFZWN1RDdv?=
 =?utf-8?B?K3VEaVQyY2NxMCtDb0lTYzQrLzdDaTVYWElJb0pHK09xSmVOVnhGekZCS2RB?=
 =?utf-8?B?NkhBanpNdTFlSlB2N2x2Rm5ESEVhMVYyVWloLzE0bEEzRFM4RVVWT3hBQ05q?=
 =?utf-8?B?dURtN1pBcDdWQjNpK2VhK2VNRUxPZnpDS1hwMjdGRkE4dzFMd1MvbllzUmVQ?=
 =?utf-8?B?NElEN1VuZktJZkdUbmtXRjNCRVltcktrbml3U204ZGlDNHV3Rm9JL0lKeUxo?=
 =?utf-8?B?ZzN1SU5xSVp4NE5OWGM2dkhkckhGSDJOUDZKa3VXUlh2YktQQU1YeWZlYUlZ?=
 =?utf-8?B?RXNWYk82aHN1UXd4S1MvWWZROWFKUnp6TXNOd0NNSDhUQ29MSEdUNVNoWlBG?=
 =?utf-8?B?dDhqKzRCZyt4ZVo1c1ExdG5mRDVCSnR1NEZtZ2lNb01JNFNDcUlBMHJYZ3NK?=
 =?utf-8?B?aUJ1dUxqa1pWeFhqd0sxb1YxTFlSYmpsNHBiRnB2NVdMcG9LeDNiT3FpNHd4?=
 =?utf-8?B?VjhvMGd3WTFobUVDaXU3VkVmMHZBeDF3TG1tUzdwOUl5c0NwRzdGVG5WcDFv?=
 =?utf-8?B?VENIVjVmSUkrdWdvSVRmbUFCbkJrYkdDZGh2NGdMMlY1ak1UTzRmR0hna25r?=
 =?utf-8?B?UjczSzdqUlBHci82cVBMNE1jVGNIWE5hRUpCL0o3dkVLQUplcXlCUGkxQkJ6?=
 =?utf-8?B?a1VORFFQNXdmUDBTZzZHNFZtVjJXT0d4WEs0TlorV1htR3ladXJENjRLQXFs?=
 =?utf-8?B?YWRVdjQ0RnU3VXZyTkdPd2haTHRYL1JwVkhVdXNWR3JSNWlGb3RCMGVCWFNk?=
 =?utf-8?B?Q2I4ZFdEdUJzMk1PY2NRSk82dHF6RktYSWIxTzhHYlNFaG01RE83K1YrdGJD?=
 =?utf-8?B?WlNaMEU1SldtODY5YnRPYU4rMk5DZ25lWnJRSDZhU2oyVEFxQk5BeTlIK3Bo?=
 =?utf-8?B?ZXhlWjBJRGx3T2gvanpBN1JjLytuaUU0WnRMNXlmRkxiZTRvaGxtVm5iMWJo?=
 =?utf-8?B?eVp1L29kS3RDSGpHS3lhNG5lVTVZZXZBYzdRYURyclZNSElONS9NS3ROM3ZN?=
 =?utf-8?B?eHY0QzIzVUxCM0ZUTFF6MUFwQnJIbmZmbm9hVTVrNHhMd1lISGJ0RHF6d1dj?=
 =?utf-8?B?dUtoYUMzYW15clFEZGxWRG84RGMwa0xzSjg4OVVpS0xNVEllNFFjREdVSGhr?=
 =?utf-8?B?UFdUR1pXMmpaWlJjYjErS2IzOHFjbnJNWmVES2lwd0FJUGkzZ1BpNGlVZU51?=
 =?utf-8?B?S05aRDJlMi8vamp5WnFDYVdkTUsxL0xlTzBkcGk2Rm1LVnc0Z01SbG5FSWZU?=
 =?utf-8?B?c0hYOVhiV0lxcTJvTEtEekZyN204Mkw5K1R4K1cvNnZsZXM3dWFkOHdBWkNp?=
 =?utf-8?B?bDF3aURJWnl3SE55bVl4MHlJanRkODNvcFBPNzhYMStxSEFBdThxdldoWDN6?=
 =?utf-8?B?WUJZL0ZJbEwzMDVqa3NrWEJ2VThJaGQzOFNZNTl2QnludlVLcGV5dzF6WE5w?=
 =?utf-8?B?N3BEaDFhS0ttaE5IRGZLWTh6OGdhSGNZYklCSURiOXEyVWZ2KzkrTUU4dXVm?=
 =?utf-8?B?UVM5NzcrNm4rNUk0SHZJeTZ5N2UvY3FuUG9sdmZtelRsQzJJTkxvQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbe377d-31bf-4d54-9cf0-08de58c483a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 08:10:17.7932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQwzbaIETnNLQSA0uKJdtbtdEcZr6n6XEfP91hkhvctCQwQb3cM9mk54aFwAayuXz/rKW2j9nggVK3YMnnIbdhwwcKMnJrwt/Ka4BrV8/MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13408
X-Spamd-Result: default: False [2.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27174-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,renesas.com:email,glider.be:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 9BCBB534D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSm9obiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2huIE1h
ZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IFNlbnQ6IDIwIEphbnVhcnkg
MjAyNiAyMDowNg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIDAxLzE2XSBQQ0k6IHJ6ZzNzLWhvc3Q6
IEZpeCByZXNldCBoYW5kbGluZyBpbiBwcm9iZSBlcnJvciBwYXRoDQo+IA0KPiBIaSBDbGF1ZGl1
LA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4
b24uZGV2Pg0KPiA+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAxOSwgMjAyNiAzOjA1IFBNDQo+ID4g
VG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT47IENsYXVkaXUg
QmV6bmVhDQo+ID4gPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPjsgbHBpZXJhbGlz
aUBrZXJuZWwub3JnOw0KPiA+IGt3aWxjenluc2tpQGtlcm5lbC5vcmc7IG1hbmlAa2VybmVsLm9y
ZzsgZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU7DQo+ID4ga3J6aytkdEBrZXJuZWwub3JnDQo+ID4g
U3ViamVjdDogUmU6IFtQQVRDSCAwMS8xNl0gUENJOiByemczcy1ob3N0OiBGaXggcmVzZXQgaGFu
ZGxpbmcgaW4NCj4gPiBwcm9iZSBlcnJvciBwYXRoDQo+ID4NCj4gPiBIaSwgSm9obiwNCj4gPg0K
PiA+IE9uIDEvMTQvMjYgMTc6MzMsIEpvaG4gTWFkaWV1IHdyb3RlOg0KPiA+ID4gRml4IGluY29y
cmVjdCByZXNldF9jb250cm9sX2J1bGtfZGVhc3NlcnQoKSBjYWxsIGluIHRoZSBwcm9iZSBlcnJv
cg0KPiA+ID4gcGF0aC4gV2hlbiB1bndpbmRpbmcgZnJvbSBhIGZhaWxlZCBwY2lfaG9zdF9wcm9i
ZSgpLCB0aGUNCj4gPiA+IGNvbmZpZ3VyYXRpb24gcmVzZXRzIHNob3VsZCBiZSBhc3NlcnRlZCB0
byByZXN0b3JlIHRoZSBoYXJkd2FyZSB0bw0KPiA+ID4gaXRzIGluaXRpYWwgc3RhdGUsIG5vdCBk
ZWFzc2VydGVkIGFnYWluLg0KPiA+ID4NCj4gPiA+IEZpeGVzOiA3ZWY1MDJmYjM1YjIgKCJQQ0k6
IHJ6ZzNzLWhvc3Q6IEFkZCBSZW5lc2FzIFJaL0czUyBTb0MgaG9zdA0KPiA+ID4gZHJpdmVyIikN
Cj4gPg0KPiA+IFRoZSB0aXRsZSBvZiB0aGUgY29tbWl0IHdpdGggU0hBMSA3ZWY1MDJmYjM1YjIg
aXMgIlBDSTogQWRkIFJlbmVzYXMNCj4gPiBSWi9HM1MgaG9zdCBjb250cm9sbGVyIGRyaXZlciIu
DQo+IA0KPiBUaGlzIHBhdGNoIHdpbGwgYmUgZHJvcHBlZCBpbiB2MiBhcyB3ZSdsbCBnbyB3aXRo
IHRoZSBzaW5nbGUgUlovRzNFIGltcGxlbWVudGF0aW9uLg0KDQpUaGlzIGlzIGEgYnVnIGluIGV4
aXN0aW5nIGRyaXZlciwgdGhhdCBuZWVkcyB0byBiZSBmaXhlZCwgZm9yIGJhY2twb3J0aW5nIHRv
IHN0YWJsZS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiBSZWdhcmRzLA0KPiBKb2huDQo+IA0K
PiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAu
cmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9w
Y2llLXJ6ZzNzLWhvc3QuYyB8IDIgKy0NCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvcGNpZS1yemczcy1ob3N0LmMNCj4gPiA+IGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYw0KPiA+ID4gaW5kZXggNWFhNTg2Mzg5MDNmLi5jMTA1
M2Y5NWJjOTUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUt
cnpnM3MtaG9zdC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcnpn
M3MtaG9zdC5jDQo+ID4gPiBAQCAtMTU4OCw3ICsxNTg4LDcgQEAgc3RhdGljIGludCByemczc19w
Y2llX3Byb2JlKHN0cnVjdA0KPiA+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4NCj4g
PiA+ICAgaG9zdF9wcm9iZV90ZWFyZG93bjoNCj4gPiA+ICAgCXJ6ZzNzX3BjaWVfdGVhcmRvd25f
aXJxZG9tYWluKGhvc3QpOw0KPiA+ID4gLQlyZXNldF9jb250cm9sX2J1bGtfZGVhc3NlcnQoaG9z
dC0+ZGF0YS0+bnVtX2NmZ19yZXNldHMsDQo+ID4gPiArCXJlc2V0X2NvbnRyb2xfYnVsa19hc3Nl
cnQoaG9zdC0+ZGF0YS0+bnVtX2NmZ19yZXNldHMsDQo+ID4gPiAgIAkJCQkgICAgaG9zdC0+Y2Zn
X3Jlc2V0cyk7DQo+ID4gPiAgIHJwbV9wdXQ6DQo+ID4gPiAgIAlwbV9ydW50aW1lX3B1dF9zeW5j
KGRldik7DQoNCg==


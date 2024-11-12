Return-Path: <linux-renesas-soc+bounces-10475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C049C6034
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 19:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 784101F2122F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 18:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BECD21767C;
	Tue, 12 Nov 2024 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WGQGdY5Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F87216454
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731435484; cv=fail; b=BIY6UoAbfzEdM8YV8QzeTEp5xORwZaXeMdMq7u0R4LuKnXIw5gTqSINa6VPimtjCuToSQJHA1niASFvjLKCUw3fBwcPi/taSKUc9BcjNfVuAKo68qAO77iUaUfo/Z5/j9TKlRjrMu1IXZ/Oi10QXf7BNoAFEEJwZCTMnqD9rYFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731435484; c=relaxed/simple;
	bh=NwOrEW6PzeBTh4ZVQ8tAwB3aGkJCnfgCm3JQ3cbyHZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ka31hGKvWllk2xYnuHfTR/wJeYD+Qmo/gGK3RcqhLDq5s7dLifO5i7xaURmWzC9tENitRiJEd+G88EG9d8tkT8e3OUDfzMba4ye9WVdy2T0fegB/ehAvrEbkWfBbnxSz/BQgylPRih9UBnK23SeVx3pMwci0CCksjpDbFcwti1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WGQGdY5Z; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPeMbKo65nLumqmQeof2tjyZ2cbSmWarSGh65/wZu4Psq+9Lb5wy1AWilM9NJ1lXV2zTrpd4Ljao4RvaZgaqVueAndevBu2VnVEhEuhB5kUD3zcpf0YkSrPVd8lSyIIfalnp/xMEyuvf/5gR2UU2VuyXRZXAfKD4c34XA8Y18IKjox3a+EQyNw1d4N+EMVxjBVbYw7NjQBgdo71/JXjgXIFI/2E7s4t2seND5s/kaSoVaHS68bPEFYsu5SazX+tBcV6LGJcUXKizWCCr/XQwklztXA1VbLjLer0TjFwBlG+J0m5UuNLVIN8bo+joNEbHhoq9IkLZIbL+zKNP8uAu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwOrEW6PzeBTh4ZVQ8tAwB3aGkJCnfgCm3JQ3cbyHZs=;
 b=o39uo4WwpsvEDfi8RQZT5u3q8deCmabxJSRy/ky4hjkdOND48FI/fLa81dMo/VT87L+S7dpHHfEdnieSqch/vBRH2ud3/ir+wwIqR/Medov2bel/cUxuknu/fI4I3kzY6aqdZP3941izKNCQnyxjBIXp0z1RRTbwr75folkmSa4X6GFuvpDGKVy0x6LsCkYBAeGc9tIXEbimBM+G069cClX542ZjjBCmmwjm5h4nGsfCmQe8A0NtVOK91881L3oTZ6rRgQaPm74I/ddbxD9299/flGpkOgphg7gD1IQYXnHOP+McztLcWQS/cMpZx8UYsy+sTxBht6cmp7v9LdvBfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwOrEW6PzeBTh4ZVQ8tAwB3aGkJCnfgCm3JQ3cbyHZs=;
 b=WGQGdY5ZpyO8rWlITt41FvxrSkYqts8HrtjjiGtMX30JACi1tUF8CjvB1D8KeLBCgA+h9l+4X24mtozo8lG+A1yEjRGbf2/Yrb6/sRaBNzS2PDLyBdEu77/JueqyVM1UpU1gQql8aC/mDZ/na7f1iJQZ7nlOtunUqCXKxoOqssI=
Received: from TYYPR01MB12402.jpnprd01.prod.outlook.com (2603:1096:405:f7::12)
 by TYWPR01MB9324.jpnprd01.prod.outlook.com (2603:1096:400:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 18:17:57 +0000
Received: from TYYPR01MB12402.jpnprd01.prod.outlook.com
 ([fe80::64e8:dbea:c288:5e87]) by TYYPR01MB12402.jpnprd01.prod.outlook.com
 ([fe80::64e8:dbea:c288:5e87%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 18:17:57 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, kernelci.org bot
	<bot@kernelci.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"kernelci-results@groups.io" <kernelci-results@groups.io>
Subject: RE: renesas/master baseline: 33 runs, 1 regressions
 (renesas-devel-2024-11-11-v6.12-rc7)
Thread-Topic: renesas/master baseline: 33 runs, 1 regressions
 (renesas-devel-2024-11-11-v6.12-rc7)
Thread-Index: AQHbNHI97Yc4FHN1dEOn07tn937RWrKzRcIAgACtuHA=
Date: Tue, 12 Nov 2024 18:17:57 +0000
Message-ID:
 <TYYPR01MB124027CBE57B95D8715AA529DB7592@TYYPR01MB12402.jpnprd01.prod.outlook.com>
References: <67325cd5.050a0220.28e0a.76ba@mx.google.com>
 <CAMuHMdV2NcfaGgPYttgVMisOM1Y0ZAPjjTAumk5G6sJFC64zNg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV2NcfaGgPYttgVMisOM1Y0ZAPjjTAumk5G6sJFC64zNg@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB12402:EE_|TYWPR01MB9324:EE_
x-ms-office365-filtering-correlation-id: a917ebb6-17c5-480c-eb87-08dd034655a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SUQ0dCs2NGdtQk1jbHp4Wmt4U0ZINXoreWNQSXNhREUxQVV0c3kyQ3JKdTd4?=
 =?utf-8?B?MS9WU3VRQzdncVVkbFcvS1BzUlgzN1NBOEVrVlRRbmd0cXVBUHpaTHpjSlE3?=
 =?utf-8?B?QXZvQnR0R1BZZUNvdkFjZG14bE9MbGU4SkkyeWlNYVlTOVI3eUNQRnJkbk5x?=
 =?utf-8?B?SjlIN3k0ZUQ1dC9ZUzdRUUNUT2ppS25yVlhxaHpici9pM25qcnpxS0R0MHhr?=
 =?utf-8?B?Mi9iQjluaVVhWHVZOFVuVm9VbElZaGRtNHJYZCtMb0g3KzJjeVJKQ1BWOFJa?=
 =?utf-8?B?NzI0VGpEZWE1M1NvY3V4aS9kNVVZc1hQRHJPZllJNzB1UWFZeEVCM0lKUW1y?=
 =?utf-8?B?SUg2Nm9IaHo0UzFETUVvQVF4QmhDUGQzcVp2YWhhRU9ZbWpvWGloQUFNdU95?=
 =?utf-8?B?RTYwWlNxeUxURjJGaTdMbWVXTngxQTk4UC8zZG9QZTZOblFwWXlxS0JQZHkx?=
 =?utf-8?B?YWxyczVaYkcrbXlNQUhlOHMxYjBVRTB0YXo3ek5rM1BLYjFvZ29zb0FJaGlW?=
 =?utf-8?B?ZHZTcmlUQjJSenBOdThaUmJxbHBvd29GSEl2blYvZENNUTdTUnZTMExsWnpZ?=
 =?utf-8?B?V2pLR2JEZ010dGZFMmhCR2I2UXhMTTdRdUtZUUpCaVduRXNvaHErS3ZtdUVs?=
 =?utf-8?B?aXV1c1N5cHFoKy9PMm1YUy9xTThyMnBiSHorOUtGMVhVWXFGWFdGcjhjZDNT?=
 =?utf-8?B?TldUYXA1SVlRRzdlTUduRUt5bkJKUmZhRmExZWRqSVM0MDdBemc4SnlNUDA2?=
 =?utf-8?B?OVRydlBiTEw2NWpRTU1RSDZSU1NqRVoxSkZlb0FYcGhteGlacW01VjBaTGhR?=
 =?utf-8?B?OGdEZ0kyQUUyRGRBbFR0eTRHRU5mQ1N6dFdkZGRGZVVTQjNPNUR2enZuSTcr?=
 =?utf-8?B?NXIweVowS20yc2Y1cmt3KzJKenQ1dDdGNGhZdjhSVFhZQW95cTlBd1ZCN29n?=
 =?utf-8?B?NWorSU5janVFUTYxeGlJa0NaajJ1bGd4V2FQUkxDdytnbmdzZGQra2VoWVd5?=
 =?utf-8?B?clVqQkpQMEVtUFJQaTdoak1Bc3RFanRUbzdsN0p3Y3NRNEZGU2RkR0xTN3RZ?=
 =?utf-8?B?TWtOLzVyVVJoOFRVMFJSNU9tOHQ1dVNZWGt3L0FBVHpTR0NGQXFDNnliUTlB?=
 =?utf-8?B?anNRaXVUeHU5b092Q2FCZGV0RmxXb1ZPQjZqWjdKL2NyalY4MTFYWlpYMHQ0?=
 =?utf-8?B?RVo2KzcxYlN1S1o2eFVFK1VxeW1Jb1RySW83ellhS0N6Q2I4eTNiTGtvZVZ5?=
 =?utf-8?B?OWVDTGJTUmxhcFNKbnI4YkVKQVFnY0Z1ZTNtSVkxemUyc0xnNjQ3T1FsUDd3?=
 =?utf-8?B?eENoRnk5cXRjTEtZTTE5SnBjTFNRUmdaTk9Xdm00Y1FmcEJmbFpuWUZGN0Fp?=
 =?utf-8?B?NG1mdWJnREJmODlSVk0yMFRqQVFLMkRKdzBlcFdDdUpuWlRabnRBOGtYUTNu?=
 =?utf-8?B?UmRJbmtCNVl4ZVNuUWROVEFIWVByVGIxYzJpUFZJSm9LL1VZbDNCSlltcWFa?=
 =?utf-8?B?S2I5Wm56clJMVjVFSFJlMlhGZnNQREJHWlpMck93TjBBWkh4RjcyWXI1anhV?=
 =?utf-8?B?OUlCZ0tSUU9nbnd6UmZqNjltTysxYTh0Q2J6MWhpZjdyeUNhQktSSzh4TjdM?=
 =?utf-8?B?Q0xIU3lIVGRxYXRFeENTR2hyUC9mUjJucjlKSEtpL2pmRSswcGh5YWtDL2lv?=
 =?utf-8?B?MTUzdlZjTHRTY1BNNFhML1FnaWxEKzJpamVlY0tHOVRCdW1wa0pFMm85T0I4?=
 =?utf-8?Q?N9vIPdzxvv+xD0MwimYZyP5CNnkshUl4VclQ5+x?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB12402.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dCtvcThFYWFlT1FtOWRTWGIwOHZLRFA5UzhOcjVYRkNhVlMrV2VtbVZWSm93?=
 =?utf-8?B?VjUxM2p3eDd1TG1EdVRtdFMyVmZSNm93V1V3K3lCa253Ly9DZmdXbExkUnFK?=
 =?utf-8?B?SXNYNjFkU3M0WWJDcHM3amhxYXlhNmFoSGRRQUYwWng2NCtHRlBMZEpNS2Vj?=
 =?utf-8?B?WlErOUR1WFluWkRycmM2dTUwaHE3N2lwWjcvdlNiSTFkbi9ZdUJCNkxOQkJO?=
 =?utf-8?B?M3lQaXMwblNRZkVpOXp6Y00vUW8wQTJuYzB6dHFFOTdTK2t0YTBmSkEzU3hx?=
 =?utf-8?B?WGRsSXZjWnhjMlhpYXl4dGVHUzMwUHZydlFDYUpUcXRtMm5oUWJZUUFTQ0pJ?=
 =?utf-8?B?OVljcWlGZXZ1RzFVcFF0RFBYWHp1REhEbTZkYjQvZXI0MmxxNlBMLzRUV2hn?=
 =?utf-8?B?N2dGTy9LZkNwV1dwdWc4T0Y3WHVoOFBaT0dXUW9MQ1JYOWlNcHl3S0hqcDUv?=
 =?utf-8?B?UlpyS1VBRW03ZmFQaGY2dHYzd2JxMUh1RXFjYmIxQ1hZRUtJS2ZzQjBVdld5?=
 =?utf-8?B?UWFsQzRlTUlNd3BwcDFhelFyK0dxUmpGVS9OQytUYXlpVnNUSStQaEM0NlBS?=
 =?utf-8?B?QmwzUnZMMmhYWUNMeUVoMzFUcDJFZTYrM2hJS1VMZ1ZTVWZlTnFWK0Vyekds?=
 =?utf-8?B?aHY0Q0NiMjdXNEZNcVcyK3RIOHVmUHBxRUFnOGU3RWYxa2M3QUhMeUJGUmdL?=
 =?utf-8?B?MllJemQzTVNXcDI3aDR4T0tVRXVEOUt5dFhRRE0rNXhoOE85MVhlWFZodXJK?=
 =?utf-8?B?ZnJGOXgrVEJMY0VnNUxZdDRXYWg1S1gvOXN0cGxXVUFxTTg3ZGNDSnNwbm9C?=
 =?utf-8?B?Y3AxaHBTQXlLYXFxSFc0VkRSeVVWNStOQ1NmNlhBMEJFSGlQT1dEbTI4SVlw?=
 =?utf-8?B?YVhpdGhOZXNYdm9kZVdtaEZONCtNNldjdW1WMjJrbks5VlFzOUFCbitUSVox?=
 =?utf-8?B?WUNqS05sdU9mWkRJL0FEaTJ5R3R5QUtYcmdUeFpIL1lsREZKMU9VcUZZNmdi?=
 =?utf-8?B?Sy9HT1hkYWlCV05vSGhxSnJIOTRUU2lFaTRaUncxWWMxTHZjZUYrZ0tBbHd5?=
 =?utf-8?B?QUI0ajRYSUViZ0p5aHVUUThBRGtPcTVHTUsrVHliRzM3OFhuQ3ZRb2JCZ3FT?=
 =?utf-8?B?MkI0YStPSVJvdUdaTk1oUU4xL2Izb0dHVjEwOXYwdDMyd1NuQlNNeXZOakpp?=
 =?utf-8?B?cVRtbFJaSzQrUDhjTllZRFdEU0hORG11ZGY4YVlVMnBvVHNTTVAxeWFnaVhi?=
 =?utf-8?B?czJYWFpVUVd1ZE1WK0k0TmxrdURYUlNhaFVwWjNDL2lkWDhDNllqTGpPZEUv?=
 =?utf-8?B?Uk9oaGt3bFI3Z0haeHlrZm4zWEIwMEVWM0RJdjJ4eWFjckhlLy9qak56U0RI?=
 =?utf-8?B?RWpDSURaM1V5SUpZQnBrcElSUkFSL3o2a3ZGOFV6NFB2SUpEU2NLOUtvbWRE?=
 =?utf-8?B?V1RWSEpLbmovcTNMUTVQWXl4OUcrY2p4RUhVTkRJVWVMbTJOVlR5Y1VIRjlz?=
 =?utf-8?B?NWYvek90NHZPa3I2cW1wN0tmb09UWFh6NjZCZGlGLzFzcjBUemlSK0JOOTJF?=
 =?utf-8?B?S21FNU5aTjR4VjBMenB1Q25zSWlhRUhxMng5MHI2NDBsa3JPWXYrWXFBVUZv?=
 =?utf-8?B?S1Y4SXk0a0VrWFJvV2J3a3hPR01QempseUlIOHcwMmtOZDI0TFMwcnBjVlRF?=
 =?utf-8?B?ZERFbWxRQVRhUzBjRTNZNERGSE90YUlUcm5NL0UzQXZ5Nmw1Z1l5QkNYSG9r?=
 =?utf-8?B?R0luK0kzcXZOazQxS2syRGRhUTlSQ29RNW5aTitVZE9qYTh2dFlHZzJwT3do?=
 =?utf-8?B?bVJLN1FhNWNNcHQzanZvc1FLa004aGhsRVF5OFpmZ1AzV0wzaHpiN25vaU9E?=
 =?utf-8?B?SXB3cHRmbzVjNWlMWXR5MzF3T3BMSnJpbW5sTlNQcW9EVGRoWC9pOVppVUpO?=
 =?utf-8?B?alBqYStibHpsQXVSUkZPcHFLNkRzUjRHSG5hbkJzNUoxeWRGaVN2THdBUGhh?=
 =?utf-8?B?ZlNoN0VCRDhhUzRxME1HZUZldlBoNXR1Z0I5U3RtQ25zWFcyMGtSUHk5ejZu?=
 =?utf-8?B?TXY5YW1FTkNRZDJ6cDZNYkNjTHBueXVrenBLYUNmS3FnUHNIU1hPTDBla08w?=
 =?utf-8?B?Z3Y0cGNkNTJMQTMxeXUzbzlpQXZ1VkZqK0p0NFRid3FUVTZCSnkydFZ5cGFl?=
 =?utf-8?B?R2c9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB12402.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a917ebb6-17c5-480c-eb87-08dd034655a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 18:17:57.6064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8iQPXjDjRyJ9QJA7zgHqXV0QLZp475UqFiJpF3tscH4LG/YhMM8DAZdOpfOEz1sfrxKLCaXdLq4itZRBsWDCekfrVFPp2DqD4AGak3c/oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9324

SGkgR2VlcnQsDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMTIgTm92ZW1iZXIgMjAyNCAwNzo0OQ0KPiANCj4gRGVhciBib3QsDQo+
IA0KPiBPbiBNb24sIE5vdiAxMSwgMjAyNCBhdCA4OjM34oCvUE0ga2VybmVsY2kub3JnIGJvdCA8
Ym90QGtlcm5lbGNpLm9yZz4gd3JvdGU6DQo+ID4gcmVuZXNhcy9tYXN0ZXIgYmFzZWxpbmU6IDMz
IHJ1bnMsIDEgcmVncmVzc2lvbnMgKHJlbmVzYXMtZGV2ZWwtMjAyNC0xMS0NCj4gMTEtdjYuMTIt
cmM3KQ0KPiA+DQo+ID4gUmVncmVzc2lvbnMgU3VtbWFyeQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gPg0KPiA+IHBsYXRmb3JtICAgfCBhcmNoICB8IGxhYiAgICAgICAgIHwgY29tcGlsZXIg
fCBkZWZjb25maWcgfCByZWdyZXNzaW9ucw0KPiA+IC0tLS0tLS0tLS0tKy0tLS0tLS0rLS0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLQ0KPiA+IGlteDhtcC1l
dmsgfCBhcm02NCB8IGxhYi1icm9vbmllIHwgZ2NjLTEyICAgfCBkZWZjb25maWcgfCAxDQo+IA0K
PiBXYXMgdGhpcyByZWdyZXNzaW9ucyBpbnRyb2R1Y2VkIGluIHJlbmVzYXMtZGV2ZWwtMjAyNC0x
MS0xMS12Ni4xMi1yYzc/DQo+IEkgZG91YnQgaXQsIHByb2JhYmx5IGl0J3MgcHJlc2VudCBpbiB2
Ni4xMi1yYzcsIHRvby4NCj4gDQo+ID4gICBEZXRhaWxzOg0KPiBodHRwczovL2tlcm5lbGNpLm9y
Zy90ZXN0L2pvYi9yZW5lc2FzL2JyYW5jaC9tYXN0ZXIva2VybmVsL3JlbmVzYXMtZGV2ZWwtDQo+
IDIwMjQtMTEtMTEtdjYuMTItcmM3L3BsYW4vYmFzZWxpbmUvDQo+IA0KPiA0MDQNCj4gDQo+IFRo
YW5rcyBmb3IgZml4aW5nIQ0KDQpUaGVzZSBlbWFpbHMgYXJlIGNvbWluZyBvdXQgb2YgS2VybmVs
Q0kncyAibGVnYWN5IiBzeXN0ZW0gd2hpY2ggd2FzIG1vdmVkIHRlbXBvcmFyaWx5IHRvIGEgbmV3
IGRvbWFpblswXSwgaGVuY2UgdGhlIGJyb2tlbiBsaW5rcy4NClRoZSBwcm9qZWN0IGlzIGluIHRo
ZSBwcm9jZXNzIG9mIG1vdmluZyB0byBhIG5ldyBzeXN0ZW0gKE1hZXN0cm8pWzFdWzJdLg0KDQpB
IHB1bGwgcmVxdWVzdCBbMl0gd2FzIG1lcmdlZCB0b2RheSB0aGF0IGRpc2FibGVzIHRoZXNlIGVt
YWlscyBmcm9tIHRoZSBsZWdhY3kgc3lzdGVtLg0KU29ycnkgZm9yIHRoZSBub2lzZS4NCg0KWzBd
IGh0dHBzOi8vbGludXgua2VybmVsY2kub3JnLw0KWzFdIGh0dHBzOi8vZG9jcy5rZXJuZWxjaS5v
cmcvbWFlc3Ryby8NClsyXSBodHRwczovL2Rhc2hib2FyZC5rZXJuZWxjaS5vcmcvDQpbM10gaHR0
cHM6Ly9naXRodWIuY29tL2tlcm5lbGNpL2tlcm5lbGNpLWplbmtpbnMvcHVsbC8xNDINCg0KSG9w
ZWZ1bGx5IGVtYWlsIG5vdGlmaWNhdGlvbnMgd2lsbCBiZSBlbmFibGVkIGluIHRoZSBuZXcgc3lz
dGVtIHNvb24uDQoNCktpbmQgcmVnYXJkcywgQ2hyaXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gDQo+IC0tDQo+
IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0
DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UNCj4gdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQo=


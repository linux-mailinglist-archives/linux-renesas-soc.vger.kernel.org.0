Return-Path: <linux-renesas-soc+bounces-12750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18935A22D06
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 13:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D913A5BA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 12:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52ED51D5170;
	Thu, 30 Jan 2025 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pbXnrx8b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D2A1BEF90
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738240913; cv=fail; b=QNlXZ3rcUf0dSQeHGcOpRlbZVDdcClu18ymJb/6K2XhtqxEV7G0nywvW1DnXSt7I2IYvUlaMU99JmKC/Cmg/pdPE0M7ygm7i/xNUU9V3RlrfIKk2k5VqCZssjDmI6rd1mgSluLxPPj4rVtBaO3htL73/z7IcqCEAoUPeX1JejEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738240913; c=relaxed/simple;
	bh=Pn5JxCRViCIKC6tnXug5c+S78kEhwJ5KyNg+z0qiFF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KiC9JqaoOKd6A4cfH4yNr5OzVQRUt4ofILjPBURHgu3MNVHyqddebEA1yEBKpRddHfImB6wdQwZ5SOXpcE23U+o3yUf7nAPCafUL2mXJ0lXHszeloO573gSci/vwkR4U41I2eMnmA8agIsEs9UWSA6wKJZc8xYKMogD/Z2zLoWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pbXnrx8b; arc=fail smtp.client-ip=52.101.125.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThcizNPwXa62+p5esnBaEEnjK9bjocR2R7C3Vjcm81wPTYqzSIgbW4qLzFbnAtWwVuB+xauBIjABDyZKXITeTNs2HkGDaaDiNWHU9LiKohTe/5zFhDwTnRK++Yy9gDSBOHA/XIExR3ivsqWXpa/aqZqzA9K2LCfF62qnjGq4blqhX755qg4gIceD30ECHycQq0lQ2mA8Nen3Vm9gpbnA6CUnaCbwxOnCPk8d7Oky3MXlG0RFjXiCmplLir5YdguikQwvpLI7He/41zJmqzbN5Nbe4H1VHG5mx6OFxu/ivEjEgIkfGICzQhtAFnMqREcrLc33XcyT6maS/CED2D0Mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn5JxCRViCIKC6tnXug5c+S78kEhwJ5KyNg+z0qiFF4=;
 b=HbdZQouq7oq+hBT327MZqcEYItFQgHxt+sFDmvsCcGjAuPoCyQsS3xG05e7cHl4XB1C+gAv1A68+txJvMOSH+eAEESESu/D0gAAGnhTaXUAQGtVL260rby5UINSm3uoYDDvJoKLcHtNUwAJKDRfXxZFFRxOnnebXsLNok1aPq2MpgpNw+CUZFEEKs8ZM1VwKpgw8N7IbU36Dk4Pw0c+ww7UF29Rv02LEoJngid9XZ35SPxVZZFMvQEbHUSWZB6HmSOWh/tJj4juR5pqdKSKn9pNByecYvW7fPbGx4UeS25fcOlWfHEj0xNdBLrN3KW0kgIKm5qvbAHr5D56v9p8+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn5JxCRViCIKC6tnXug5c+S78kEhwJ5KyNg+z0qiFF4=;
 b=pbXnrx8bwIoJXKDGTt3qlRR2/7eNqvDH9f+Ryq7u0U8TPlYDvFnqy9qtqKO1Hfn2mTihcX3rIHZpQdbCGDuM9TaTfdlkwVuAIr1P5VnZa/jf9OcwbzXX0u4UIVmu4lxnySH9hBPRAVTdXdTIvTKMVsOTaVaTe3AlICngGfri0Rw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13112.jpnprd01.prod.outlook.com (2603:1096:405:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 12:41:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 12:41:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v3 12/13] irqchip/renesas-rzv2h: Add RZ/G3E support
Thread-Topic: [PATCH v3 12/13] irqchip/renesas-rzv2h: Add RZ/G3E support
Thread-Index: AQHbcXIfDVU1phM9NEWBj+ARfGpRwLMsYP6AgALkeDA=
Date: Thu, 30 Jan 2025 12:41:47 +0000
Message-ID:
 <TY3PR01MB113467646571C2824D830385086E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
 <20250128104714.80807-13-biju.das.jz@bp.renesas.com>
 <CAMuHMdXUvuned3tS+hxuUpSJTs_iadUjBNa99Nc=-2AgKrZpyQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXUvuned3tS+hxuUpSJTs_iadUjBNa99Nc=-2AgKrZpyQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13112:EE_
x-ms-office365-filtering-correlation-id: 7bfbe716-6953-4612-5a61-08dd412b761c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TFFBSXp4YmkvSXJWNmFDK0dvaVZaVy9FYzVlUDB6aEE4Zkp0UkhtcHY4NjJN?=
 =?utf-8?B?ZkYwZzhFcERCdDhGQjRkU2pMNUtxdEVoSEhRK00rcHNkTDBSakkzQzVtSm5k?=
 =?utf-8?B?citYSDJKbDhwbjJhcnNHQVhwR3lVUmlwL1RhcENoZXpyN3BYMHpPekY3cmRW?=
 =?utf-8?B?WWNXUkVtT0RnTGh5bjF3ZEdYTlloaTBZditUMENpcTJOTzBvTmY2MVhJZjdG?=
 =?utf-8?B?bWhobFVmZFZnSkx5a0k3cnpUc3A1WmdKVXduUTNteS9xenJIS0RpWlVZblJm?=
 =?utf-8?B?RWZ5dUNFaE9kSURaMDYzZ0lob2t5MFRRLy9mY2lUZnA0QWVDT1FPOUtWLzQz?=
 =?utf-8?B?R0h2ZC9xSjU1b0tUeUFWYWEzNEdEUStVdkFTU2pENE5SSXk1YkVEdjlIZ2pO?=
 =?utf-8?B?WXNUTzlCck96NVg1ZUhMM2JZeHhyQUYyREpSK25IbTliQlMrNjc1UEFJUStY?=
 =?utf-8?B?amd6UnpDZGFtWGRrdmEzNGM3ODF4QUZvWnkvcjlPVkxBYU8xMXF3NlVjNlRZ?=
 =?utf-8?B?NkZtdlNmaHBBdC85RG0wVW9zZlNaMS92UHhPMjBMQVd1YThiN2M0WDJWWjVK?=
 =?utf-8?B?VjNYZjBIZFJKb1pzalBHZ2JNbFpQZ1R6ZGJBWENaSWZMTXhYWVRaWXZacDBa?=
 =?utf-8?B?c21qSkN6S2xLVHY0cHZlYTFPM1I3d0hXQSsvL3lycGttbktZRkxCQitDZWpR?=
 =?utf-8?B?ZmZoZk1CVm1jQnlGUGo2T1laWDFiNWFDWXZDR1hkR0gwSXl2Y0hob0dZak0z?=
 =?utf-8?B?NkxQakwwSVFZeExwQURJNUJiakhTSThaV1k3a0svZFczTHU3MkFLN2pidGs3?=
 =?utf-8?B?bmZ1dCtkc2lEbEp5a1FuRkI5SThDQ01hd3djTXMvRDlTeHJ6ZlVSYUdiZit2?=
 =?utf-8?B?Q081MDVqWEoyN1dRYnhjTkp6S0w3NFBwV05KK0RwME1xYVEvd1VmRGx1WHVQ?=
 =?utf-8?B?TmhkVVd4bXBueVdrSENYUDdLczVSQUt0R0hFQko0NVZpenJ5a2JJTGcyUEJy?=
 =?utf-8?B?NndneVNYNE1rQUM4eEUyZWQvRzd3cW50UWtqRjhEQXdEN3NkbVFITEY2by9N?=
 =?utf-8?B?S2VXRUZReWZCLytXTnlVUG1mYk8wMm90ZHBMM0dndTk1RnRULzlDaVpoa0RJ?=
 =?utf-8?B?TkZBWW1ZU2pCanE1K1hDSUdUYTdKSE9jTnlqOTFVRkFHT0hvd3VSZmRnRDEr?=
 =?utf-8?B?d2pUS1R2UnJ2eVlFcmJ6Yi9kSG16Y3RpNTlrSU1HaDQvL2l1dmxhQVUxUEZ0?=
 =?utf-8?B?OUxTNUs1ZFMvVEdjalFvbmNvaS9uN1pPdEp5VEc2SDNTUGhIQ0RmSEkwZ1RN?=
 =?utf-8?B?Qk5LNmd5QWw1dENQMWZKTDFST04xbTVteFJML1VnTHNxaXRzL1VRL0JZcW5R?=
 =?utf-8?B?elFoQ1RPSlFtZVI2UFl0ZFR3aGRFaFBxY2Rocmp3UHBxMEM4RWtib1RoSHBl?=
 =?utf-8?B?Rnl1SnJCSHJ6QlIxbUZjcEt3R2N4RGExRHVtNDZBSThZdnNCaXFhMTYveTRD?=
 =?utf-8?B?YWJXTm9yTHQ3Ym9KS09aTjcvQlV6aGxjME93blFyRm5KaVBUY3FBN0VtTU5B?=
 =?utf-8?B?RTZZMjVFWkxrMUFIQWFQNEgrME91eG5ic0RmcTUyRkhsaEYvZ2JnbnpJQzRk?=
 =?utf-8?B?WktGWk5HVjNGaklzbEQxTURwTGRMbWZsWTFPSy9RV0RIaktKME14VEpteEVB?=
 =?utf-8?B?YWYrMjlCeERYWVQ5SGozQ0w5WllmdU1uYWRmTmFPVGQvbEZrRlZjcnNpRVJM?=
 =?utf-8?B?a0E2SWdtV2VsK0g5cUZ1dDZQMTJZa3poUDMvd3BXR09CSUhneWNZVG9CZENY?=
 =?utf-8?B?cEFtNENFZVlrclZZQS9GU25CdzdNRytOL3pXQ3FpM3h1ZlBUSTVScnRaMGhy?=
 =?utf-8?B?VGt6WkoxeWc4SmVaT3d1Q0JUbFYvUmhiWnBEZGJMcUtmbkFTajJEMXNwc0NL?=
 =?utf-8?Q?hlVUINCL+vJygeqNc3z1KUvIxV1bO3sq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlJJVGxZS0pPMFJVekIvS2hmcGRtbDFRc1VUeGZLQ3VOUkpESWYwWHZOaWcz?=
 =?utf-8?B?RWVEcGJvTlI2ZlV2V2ZLYVFVYlVHendYcmN2RjlDQThoaUdUVE9XVmxvYXZV?=
 =?utf-8?B?V2E3Tk93VUdrTVVNU0JBYUxqOUM4aDVBTnhvU0UwL2ZjWThaMzZTT3J6cUxn?=
 =?utf-8?B?M2tjT25LUWpKM0FUUFJwMGRzTHAwNnBiMW9pZ1FNUzV4Z3VtNFFFOExYTndm?=
 =?utf-8?B?U29ocG5iN28zMzZFdmVMYTUrdUUzUk5Yc2xIbmJXWUpQN1crdmFYdEJBMkZJ?=
 =?utf-8?B?cFNTait3T1E4dEVwVkJqbWZyb1hxYjJ4OGU2UmNTOFc4TGR1MkhtQ3o3M3lw?=
 =?utf-8?B?UVhGMXpTSExMMzhGMXVCck9pZW9Ob2pId1l0ZjdQSG50ZWdPQ1hQOS9NcWR1?=
 =?utf-8?B?NTdoMHVxQVcwaFo0VUU3K2tacXJpckhtcFMyVitpZVl4RXFmSlBKSnRzQms1?=
 =?utf-8?B?Mk5ZUG1QWUFWc1MySENHUlVoK3NUeFp1QmtkQkR6OU41RkZLU2VSSTZxSFBF?=
 =?utf-8?B?ZGxqd1FobzJMbDNZRFNkam50eDF3Y3czTkhaTVhaTnFOaENSVGFFY012c2tw?=
 =?utf-8?B?c3JFZ3BkUnBFbEJaa1ZzOVZJUk9lNkVRd25GcDI2M29ITjBtZGJ0d2REcURa?=
 =?utf-8?B?cGxVRGVCbm10QlNMakROODVkUDU4TWtSb1gwOE42bmExeWxpY1hGM1VoSVg1?=
 =?utf-8?B?NjYrVk9hNk1mSDJzWlJvbXdRT3gveUpDUkRCNFVUS1ZNYlNjcG83VCt6TWtx?=
 =?utf-8?B?UmVRVmFDU2Z6bVRVeEViaWFyR09aRUM2NEFlWklCdWpTbU83RWtFNFcyam1i?=
 =?utf-8?B?c1U1eitZbWN2KzJpVTI3K1pnV0N0QkgwTExLZ3JHeFNVQVZtTHBGTTAreEla?=
 =?utf-8?B?WUdwS2h2OFdGT245MXhnM2ZSeGhySzNIT0xHSFhPREJibHhuL3RFeFpnOFlI?=
 =?utf-8?B?anFrSWIzL0JYS0NSV2Z3dnVrNy9kakFLTUZxZDRlVytrREF0QWJaTXYrZGo1?=
 =?utf-8?B?U3ZzeDAzRHRleXZLUDFraE1ZdFFTZXVONC9YMkthem1rRnVMN0pzR1pFRGds?=
 =?utf-8?B?c0x1dFcrdE9ocHZYV01KNXBvODF1QVQ0Z1JFYWJWNUVHQTdqRDlGMHJoSnhx?=
 =?utf-8?B?M0lVdklQQkRqcFRMRjRYQ0E4OGxjZXg5UUo3eGZTdkhncWtLbUQzUjk3dUEx?=
 =?utf-8?B?a3ovSyttUmc0TUtvR2ZqWGExMFFiNnozdTdheUFFQzlyZDNrUHRLM0FYV0ZY?=
 =?utf-8?B?ci9CM0tEQWlmREI4UkoybmxyYUh6MU5ZTGkyeUR0ZlFja3JRTnNINis1WU9C?=
 =?utf-8?B?eU5HZzU5eGlsVmEwTTRvamIxUGREMERJWi8yMCtLYzdMc1ZRSEU0THVqOHkx?=
 =?utf-8?B?S3c5N09HZk9pbHNXVDlFWGEzZGI3KzI3Y054RUw2TUI2T2ttVFRRUkgxYjFh?=
 =?utf-8?B?YWJDWVVvVDd6UUYrT2NWaUkvZ1k0Q082azdRVUlCNTFuYkxVemVJVHVuc2lx?=
 =?utf-8?B?N2tnekZJZ0s3N0lhekl5a09GT0hsWVJlNmIvbndoSUFLb3p0UnlkNkRJMGlx?=
 =?utf-8?B?NE05czNnWEZieUZyclBvTWhGUGE4NGo5STJQZFNsSDE0RXBZbmkySlppejR3?=
 =?utf-8?B?bVZDNGxna2FycCszUnF6Rm52aTY3a0FHQjUyR2xJZDNHMUZhdHJ3QUg4K3VT?=
 =?utf-8?B?eWdTVGVZWTIxcFpGZnRjVWJ6dGdaTC9QZGNUaFRLNzBRRDA3R2hzYkRiWWIv?=
 =?utf-8?B?dFhVaTBnMXZwRHhBMTh3MjNJQmc0UTFUZnFYQ2VJRnN5Uk1jTTVJdHdEc3dQ?=
 =?utf-8?B?VHAvbXdEYkZ2NW0vMHN6bFRTTlBCQVpvNUk5SUF1Tmg4WERkdEd4MHgyVHFY?=
 =?utf-8?B?eXpaWjFEaDVPQ0Y4M1J0dGpwbFgyWjl4Y0xiU0pMQUVQOGltOU9JdVVibWV5?=
 =?utf-8?B?MWIvNGd5cG15NzZ4QlQ0MUZRZ1lKVjAyeG5QYituNE1tT1V0TDVpSmJDK2Np?=
 =?utf-8?B?WENrYjZpdGcrYVh4bzE5Z2xlcEF0dmtaU0VjZ1Q1dkROY0Z6VGVXYmlLSHAy?=
 =?utf-8?B?Sm51eG1GNWtQVzBDRm9nUDcrRVViMW9adU52VFNsU3d3RnpOVHR6eit3Tzdn?=
 =?utf-8?B?YkJGVWJhOFFzbml2RTlSclpMREVkbWRXcGE3Slo5WWFuTjdkZTR3Rzc3LzZZ?=
 =?utf-8?B?Z2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfbe716-6953-4612-5a61-08dd412b761c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 12:41:47.7252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXa0C2up5YxTzupOukm1jjL6dGUyo8a4AExMtEip3rHuR5mmh6FPbkaDZ+gUatxoF3CzSLPYdx6UQqA/q6Jzdzew0193HPCKbiMGQ4kkaPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13112

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxNjozMA0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHYzIDEyLzEzXSBpcnFjaGlwL3JlbmVzYXMtcnp2Mmg6IEFkZCBSWi9HM0Ugc3VwcG9ydA0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMjggSmFuIDIwMjUgYXQgMTE6NDgsIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIElDVSBibG9j
ayBvbiB0aGUgUlovRzNFIFNvQyBpcyBhbG1vc3QgaWRlbnRpY2FsIHRvIHRoZSBvbmUgZm91bmQN
Cj4gPiBvbiB0aGUgUlovVjJIIFNvQywgd2l0aCB0aGUgZm9sbG93aW5nIGRpZmZlcmVuY2VzOg0K
PiA+ICAtIFRoZSBUSU5UIHJlZ2lzdGVyIG9mZnNldCBzdGFydHMgYXQgMHg4MzAgaW5zdGVhZCBv
ZiAweDMwLg0KPiANCj4gMHg4MDANCg0KT0suDQoNCj4gDQo+ID4gIC0gVGhlIG51bWJlciBvZiBH
UElPIGludGVycnVwdHMgZm9yIFRJTlQgc2VsZWN0aW9uIGlzIDE0MSBpbnN0ZWFkIG9mIDg2Lg0K
PiA+ICAtIFRoZSBwaW4gaW5kZXggYW5kIFRJTlQgc2VsZWN0aW9uIGluZGV4IGFyZSBub3QgaW4g
dGhlIDE6MSBtYXANCj4gPiAgLSBUaGUgbnVtYmVyIG9mIFRTU1IgcmVnaXN0ZXJzIGlzIDE1IGlu
c3RlYWQgb2YgOA0KPiANCj4gMTYNCg0KQWdyZWVkLg0KDQo+IA0KPiA+ICAtIEVhY2ggVFNTUiBy
ZWdpc3RlciBjYW4gcHJvZ3JhbSAyIFRJTlRzIGluc3RlYWQgb2YgNCBUSU5Ucw0KPiA+DQo+ID4g
QWRkIHN1cHBvcnQgZm9yIHRoZSBSWi9HM0UgZHJpdmVyIGJ5IGZpbGxpbmcgdGhlIHJ6djJoX2h3
X2luZm8gdGFibGUNCj4gPiBhbmQgYWRkaW5nIExVVCBmb3IgbWFwcGluZyBiZXR3ZWVuIHBpbiBp
bmRleCBhbmQgVElOVCBzZWxlY3Rpb24gaW5kZXguDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IFRvbW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJlbmVzYXMtcnp2MmguYw0KPiANCj4gPiBAQCAtODQsNiArODcsNyBAQA0KPiA+ICAgKiBAdHNz
cl9rOiAgICAgICAgICAgIFRTU1IgaW5kZXggaw0KPiA+ICAgKi8NCj4gPiAgc3RydWN0IHJ6djJo
X2h3X2luZm8gew0KPiA+ICsgICAgICAgY29uc3QgdTggICAgICAgICp0c3NlbF9sdXQ7DQo+ID4g
ICAgICAgICB1MTYgICAgICAgICAgICAgdF9vZmZzOw0KPiA+ICAgICAgICAgdTE2ICAgICAgICAg
ICAgIHRpZW47DQo+ID4gICAgICAgICB1MTYgICAgICAgICAgICAgdHNzZWxfbWFzazsNCj4gPiBA
QCAtMzA3LDYgKzMxMSw5IEBAIHN0YXRpYyBpbnQgcnp2MmhfdGludF9zZXRfdHlwZShzdHJ1Y3Qg
aXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKQ0KPiA+ICAgICAgICAgaWYgKHRpbnQgPiBw
cml2LT5pbmZvLT5tYXhfdHNzZWwpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiA+DQo+ID4gKyAgICAgICBpZiAocHJpdi0+aW5mby0+dHNzZWxfbHV0KQ0KPiA+ICsgICAg
ICAgICAgICAgICB0aW50ID0gcHJpdi0+aW5mby0+dHNzZWxfbHV0W3RpbnQgJiAweGZmXTsNCj4g
DQo+IE5vIG5lZWQgdG8gbWFzayB3aXRoIDB4ZmYsIGJlY2F1c2Ugb2YgdGhlIGNoZWNrIGFib3Zl
Lg0KDQpPSyB3aWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo=


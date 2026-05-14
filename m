Return-Path: <linux-renesas-soc+bounces-32637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE08Ie4GBmrFdwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 19:31:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3454557E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 19:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EDF430008BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 17:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72B9389454;
	Thu, 14 May 2026 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dzn5zsK9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C469D31E835;
	Thu, 14 May 2026 17:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779883; cv=fail; b=neJuLt6XRciLs2s7VfcUEUeswQgRmysgAEAA61fggi2mEAkJfsFz6rbKf9+/3UTfX1Qs1jxRFUwOhLdqwdG7+o//trgxBGrzqYpogHVqlsg+NIypAWjfPo4+lbfeJQWJk0uXbKf9roUH3KQENZXcNurHCkx4ggXdvXsYgp/4zfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779883; c=relaxed/simple;
	bh=Ow2eCInf+Eeh+4mq3S44URxwUhSDlItLIh6z9/k1t0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qa0DZUSi1FHcuvQonXwX+9RqB45dqO4ANaNbErcANV6wV5CiTbNf/sy2vWWVxHkQOQK7dorqhCIxiSU8jwqSx1IEa9E+RocPN8xRR3SzqDJDPKFEIluqyN2WAz5XVId0vSCzApvjGlGEQVG1SlX7O0NCnz48YDCnNhjo+s5UeF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dzn5zsK9; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htkhx0Jux51CRQEvcycEOKZ3H/RxDRptBReYtQyLKxHdDY3gIZV8NT9Y00gR5JN/56wccDZslpemZrHyrA7Fwwtvs+cwUJgVQoJag9pedfkP33wAD8gp/r8Cq06u+UejEBF+6kw3MLvSsHsb6a5E5mT66Q3SXgl92MERvxkBmRlgV+JIUVyLSXXvaP0qiLbYJ4NS7u6n50s+46z9KLeUmSdfwa4s3uvYohhQZiZumGS/SWJdorkXnWo/2rnNR48+c/Ld/8XWEduwEJ3wuBsj+oIWgCvfotCaXA2FEZopDJOjGe1ZB3ArGZI8BaoQM4GiNcl5pIDCzprfeJnyn8My8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow2eCInf+Eeh+4mq3S44URxwUhSDlItLIh6z9/k1t0Q=;
 b=tlbSqP3raCESKVtbYh3QbFbf9oGi3+M5x2Kz3LXr02n41CtnEKRj3/I/f6/f5rqTYrN/MxzBLd+OqK9m6Z7AtSTnt0QEXgba8fgJUFLYhk1BohyJ3gUhuVe7fJpnQDJAnzG41VmzJozbuJ1WXpcHj+Oue18pNeNemrG/rHOyncu3SxUsnGOMzaLTSN+3CJjWPvIU7SlEQHXOTpJbzgE5z8rXoborg/ZkNpVYrqA6E/Tb/WQKm/hnaFL/biNiqoCAU0V5nKfEQ797rkO65ng146/lb0pSPLJ0Y/3VZnCwnpQBpWPLYz8sqkaAK6EWopBmPYuvvXvH4LCdT/7Edp4FOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ow2eCInf+Eeh+4mq3S44URxwUhSDlItLIh6z9/k1t0Q=;
 b=dzn5zsK9r2JvTg/R4iPITdmqlesbwTZHkT3DXs9QxDewyisP3ZY/46ElKcyBhyGh7rpHdWcj3OIS0Pxal5uyRpjB7EMEzATDGBz4m9z6sfi1g54smm1Iu14hQXEGrMlTBP29STNJb59qXGQ2ZgdToggC4kS95SuePiMLYEYC3Tw=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB12740.jpnprd01.prod.outlook.com (2603:1096:405:1b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 17:31:18 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 17:31:18 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: geert <geert@linux-m68k.org>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI
 pins
Thread-Topic: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI
 pins
Thread-Index: AQHcwR4EFWEDt2xdQkmzwPdsZFWRsLXq+oWAgCMQhxA=
Date: Thu, 14 May 2026 17:31:18 +0000
Message-ID:
 <TYCPR01MB12093EC770044559239236A51C2072@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260331145221.7974-1-fabrizio.castro.jz@renesas.com>
 <CAMuHMdXNwMU-TSOSuHseHN_=TJD8H8ufXbELhw=tbNnEu9fUfA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXNwMU-TSOSuHseHN_=TJD8H8ufXbELhw=tbNnEu9fUfA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB12740:EE_
x-ms-office365-filtering-correlation-id: 46607dd9-0250-44c5-809e-08deb1de9b75
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|11063799003|56012099003|38070700021|4143699003;
x-microsoft-antispam-message-info:
 1PYwYUZBq2divfdnkaHddX6Q4ENs+Z6P9LAUiYYpkDHj+G/LrEH9Tko8UbEr1nA7kLypZViAD8rTn8ifIBHzUXobvc7t+f8S2xLwPEHhcXRhBbzYXtDM8pJuUZFxsLW9zeQBQf7436II9e/yGUbYAxfgENKJoDBPpTGJjfK2tPXrStt+bfXcW1jGzibFkoi2UzeQt0VIkzMhZjvTbjaiuCHTGPymf41d0fZ8V7+rsElJYLlLCqZfBT42Nj7f1GUNJRgss4H8FT3efzlUHC0eUt0M/+UeUMQ7tpaxwDTiacl+pdUysPxZOryMOeENe0fi+pLg8QCDZQP/1EbST9dbvEJjyu06wCKjZdwOFNv/r8W54lLpX589Tjg2kyJXX1mlxPq91tAp4ZC+pkKGCxULGTyoogUZHN+0wJUH2fUfwx1EQvW7FaPjYhCz2/0coipYbcOd05Hq2nYZ6E9MRcbXEIbDwvuUzSy5/dQeDewHQtYlBvnW3RuxpQxtxfQ4iCHje4QsqzCSjvkHGXIHAmWpOO5L+swp7WQcz1C315wvlElvcBHxrsxIa33GZK0We7P5oUtvqHmZu+dlx/m+Xj5J7d7zl2G9jkxDod9oO1BO//jfbGNaPNpYyJLMgwwyq4vWylw50caCmMuqewD5maNfO4Kvvgjbnf+4Qsvosp+qkt8zvN4wrR2iS9xoX+tGlHHOQnnsom3+/9Ob4epGojoHZGrrhz/j/AFAc3yZWoNNwHzaFVt1dhSanFtXaTc4k3e/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799003)(56012099003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czdYcmZ6b0VwRWUwWnQ1YmttVnRSMitUbFJ2OGNrbWtmOTZPbGp4dC9QMXdH?=
 =?utf-8?B?clY3S2l5QjN0VWlwdXM4bWpxZE4zMFlHYkZ5bDdCVVhEUi9DakRKTHFhQU5m?=
 =?utf-8?B?bkFybkVIYjZNam9ERjdWOVhyQXRlZE12THVtVytyM2w3UGdCazR6bitQVkhk?=
 =?utf-8?B?Y2Uzejh0R245SHMzMXN3UDRtcEJOdWNKMmJ3Vlc2c2pUVThQZ0p2UkNOcjZj?=
 =?utf-8?B?TllObDZqMDRIcHhUZjh1WEdSY0FCMTJaTlhDb2pPeGdFM2JRTEduSk9hYVJV?=
 =?utf-8?B?a0xQcEM0UFp2N09vdmhsMGJPc2FwblpUTlZHajdwTFNYbGt3K05oS3ZpaTdV?=
 =?utf-8?B?dngzWXF6K3B5WXBldE9KWEk3aVFHMG4rNjVtUkdvQmVKY1pXcVNXQm9zTmUx?=
 =?utf-8?B?SzNpQ3dKUUVTTVFlWCtwU0NHa0NhVU55NmkxWXZ0SE9kem9ZNEF2US9teVpQ?=
 =?utf-8?B?QncycFQ5Y3pZN0hYSEtLYlFDdm5Kc09HdDQ0RWtCZmJ0NjdmWDA2d3pFNlBP?=
 =?utf-8?B?Ukg0MklRY0JLZWlzcHdZTTNMdWVaOTBaaysvbVN2S2grNm5iMjNzZER2Yk90?=
 =?utf-8?B?NVVGcEJoalorVndyZjRiK3JVdGdONmk3dlR1dFEzcHJocVBTN1dXaHhDbk5y?=
 =?utf-8?B?eHlrbTI2a2NOWWx5QUloMnM4NVFOUlNNL2ovbngzNWQ0ajdXbUdKS2pVR1Ry?=
 =?utf-8?B?bDJKeklrQko2U3pUNk82eFZZbHZCSTVJTGw3alBTVG96empnb3g2dzJ5K2cy?=
 =?utf-8?B?ZDZ3QjBFckZKTFVpU1dld0daaHJZWnFKOGxXamxHMmNmdHVCdDhuanJpUHVi?=
 =?utf-8?B?OEUvTDQ2RFNmZUxMZGR0bkVtRDRvQzYxeTB1NjN5WHpKdU92TnZjZmNuSU5M?=
 =?utf-8?B?emdScGtoQUI1S2pxcW9QTlFhN0FzV3g3TTdpaWVlNHl5bEl3Nm00Qk0vY3lD?=
 =?utf-8?B?YVFsbUtrYzQ3NURBdFlHcFpXQXNNVVI3QzcrdU9XVkJGcENUUW9tdGd6RWY5?=
 =?utf-8?B?RmEyd0Foa2tFeFJnaHF2aG45S0t1MEt2bFF2dWpscFJId3JRakRIOERNM3hR?=
 =?utf-8?B?TUI2TW5MZmlkZlFqcXNZUFVUT1RaR21YK0tCRkNYT3RDMzFvaUdyMllmMnE0?=
 =?utf-8?B?dHRwenZGOUovQld4anlmK2dSemNkczFFRUIvVWZwOVhEYW1nSnpncFJqTy9q?=
 =?utf-8?B?WktrRVVOcjFWVkc4QVRJakJXdGpGazE1ZUVYbG1zL0tsR29hb1llV1VUeU9Q?=
 =?utf-8?B?SUh0b0xFMzdWYWdlaGNlTlpPWGxhQTZ5RHV3YjhveGZOUis3K0k4anVvNjk5?=
 =?utf-8?B?QVJDR1NtTG95d2lzdE1QM0lHb1dVTXhwRDNGUHg4UE9Pa0dqZkZKTzBEZnJJ?=
 =?utf-8?B?N2M1d0x2Y1F5cnpubHBTcFladVpnZkhYdDNkUDNOaGFRczFSRGh0TGdSSkhS?=
 =?utf-8?B?YS9BeTljVlR1UU5ZT1VYRENpOUM1VHR0Ry9lV2hTbGg1Q0FNTzNyek05Qndp?=
 =?utf-8?B?dlVjb1FlMHRLbFhaZmhpQVRlNzVLSjRQbFRFYVpjMVJGSVlXM1kvbVNGRCtk?=
 =?utf-8?B?VXY1VU9wb3ZPOEVoL3p0b0trOUhDYTMzNEZscUNDd2pjNXlBSUdYZFpYQzRN?=
 =?utf-8?B?djl4TzFaWGh0UXMvSEI5RlE5YWp1U0RCNVlsTjJQQXY4L09nZVZjMHpGc044?=
 =?utf-8?B?bDI3a0RYRXhtdU9ySHVJT3RmQ3dpVzNybTVSemFzU1JwRk4zdTlmV1RKYzRL?=
 =?utf-8?B?aFRyQ2hOVDdXVWxoMkREUFJVVlBJUWtIQzFJeWk0SExrWS95bVdmWFJWWFpD?=
 =?utf-8?B?d0RyaXRNaDVHVytTaUU5T1ozenRJNitwbnI0dStaYkJYZzd0S3JIaWJZNm4v?=
 =?utf-8?B?MzhZOThCb1pwSmhLUFRhSzY3RUZRTE41bzhEeGZpU3AxOG4weGVGT3JOek95?=
 =?utf-8?B?SzhaUWkyUUNRZnN1SmFDYVdYYWN2cWluUUdwYXNQOVlEVzVVTzZBQmEyUkE0?=
 =?utf-8?B?alVPdHlMeGNSdDI3M09rMFlvODZXVENtZUlFaitoY1dwMWRWRE00WjZ5eHRM?=
 =?utf-8?B?bE9ZMlVxVXBUd1JKS2tiUzdRQWFzM2Y5NE1tWllZbWtwZWt4YlJNcW1FRVdx?=
 =?utf-8?B?bGJnVHBZMFBTSkVNL3VGNU14ZFJKcTBCL0dDVGZNc3RhYWg2TWpjMjRFN1Bp?=
 =?utf-8?B?NStocUVHV051ei9NejdWT1dhWGdnajFHOGVGRGFSUlBneWxjTkpZY2w2bFNR?=
 =?utf-8?B?Zk15M1lhL1Y2SEZiWUZTWUxGR01JalY4UlB5TlFsc09xUmN6c0V0M0MyRXM5?=
 =?utf-8?B?QUdKVy9nSHBOUUJnc1dnTm5RL2lNZzl4dmVCOFVNbDdMRE1TOG9DNWZxODdv?=
 =?utf-8?Q?8qgDVYic6HbV4JVY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46607dd9-0250-44c5-809e-08deb1de9b75
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 17:31:18.2138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: egv8qoq5hisqjz6YCZXaiuS7zPb7g5H8zuxI5zyE6UOwR3ix2BIbwyyB5W20bP3yFoHi6u2ZHghkZDDbG/sM0+oi/wvlzIha1TMDjwG30xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12740
X-Rspamd-Queue-Id: 1FA3454557E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32637-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXchDQoNCj4gRnJvbTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjIgQXByaWwgMjAyNiAx
MDo1Nw0KPiBUbzogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5j
b20+DQo+IENjOiBtYWdudXMuZGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2Vy
bmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IGxpbnV4LXJlbmVz
YXMtc29jQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT47DQo+IFByYWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiBy
ZW5lc2FzOiByenQyaC1uMmgtZXZrOiBDb25maWd1cmUgZU1NQy9TREhJIHBpbnMNCj4gDQo+IEhp
IEZhYnJpemlvLA0KPiANCj4gT24gVHVlLCAzMSBNYXIgMjAyNiBhdCAxNjo1MiwgRmFicml6aW8g
Q2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRo
ZSBIVyB1c2VyIG1hbnVhbCBmb3IgdGhlIFJlbmVzYXMgUlovVDJIIGFuZCB0aGUgUlovTjJIIHN0
YXRlDQo+ID4gdGhhdCBmb3IgU0RSMTA0LCBTRFI1MCwgYW5kIEhTMjAwIHRvIHdvcmsgcHJvcGVy
bHkgdGhlIGVNTUMvU0RISQ0KPiA+IGludGVyZmFjZSBwaW5zIGhhdmUgdG8gYmUgY29uZmlndXJl
ZCBhcyBzcGVjaWZpZWQgYmVsb3c6DQo+ID4gKiBTRG5fQ0xLIHBpbiAtIGRyaXZlIHN0cmVuZ3Ro
OiBVbHRyYSBIaWdoLCBzbGV3IHJhdGU6IGZhc3QNCj4gPiAqIE90aGVyIFNEbl8qIHBpbnM6IGRy
aXZlIHN0cmVuZ3RoOiBIaWdoLCBzbGV3IHJhdGU6IGZhc3QsDQo+ID4gICBTY2htaXR0IHRyaWdn
ZXI6IGRpc2FibGVkIChub3QgYXBwbGljYWJsZSB0byBTRG5fUlNUIHBpbnMpLg0KPiA+DQo+ID4g
QWRqdXN0IHRoZSBwaW4gZGVmaW5pdGlvbnMgYWNjb3JkaW5nbHkuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4N
Cj4gDQo+IEFjY29yZGluZyB0byBUYWJsZSA1OC4xMSAoIklPIHNldHRpbmcgKERSQ1RMbSByZWdp
c3RlciBzZXR0aW5nKQ0KPiBjb25kaXRpb24iKSwgdGhlIHJlY29tbWVuZGVkIGRyaXZlIHN0cmVu
Z3RoIHZhbHVlIGZvciB0aGUgU0RuX0NMSyBwaW5zDQo+IGRlcGVuZHMgb24gdGhlIHRyYW5zZmVy
IG1vZGUuIFNvIHNob3VsZG4ndCB0aGlzIGJlIGNoYW5nZWQgYXQgcnVudGltZSwNCj4gZGVwZW5k
aW5nIG9uIHRoZSB0eXBlIG9mIFNEIGNhcmQgdGhhdCBpcyBwcmVzZW50LCB1c2luZyBkaWZmZXJl
bnQNCj4gcGluY3RybCBzdGF0ZXM/DQoNCllvdSBhcmUgdG90YWxseSByaWdodC4gQWxzbywgb3Ro
ZXIgcGlucyB3aWxsIG5lZWQgYWRqdXN0aW5nIGFzIHdlbGwuDQoNCkknbGwgc2VuZCBhIHYyIHNo
b3J0bHkuDQoNCkNoZWVycywNCkZhYg0KDQo+IA0KPiBDdXJyZW50bHkgd2UgaGF2ZToNCj4gDQo+
ICAgICAmc2RoaTAgew0KPiAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8JnNkaGkwX3NkX3BpbnM+
Ow0KPiAgICAgICAgICAgICBwaW5jdHJsLTEgPSA8JnNkaGkwX3NkX3BpbnM+Ow0KPiAgICAgICAg
ICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic3RhdGVfdWhzIjsNCj4gICAgICAgICAg
ICAgLi4uDQo+ICAgICB9Ow0KPiANCj4gSS5lLiBpdCB1c2VzIHRoZSBzYW1lIHBpbmN0cmwgc3Rh
dGUgZm9yIGFsbCBtb2Rlcy4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=


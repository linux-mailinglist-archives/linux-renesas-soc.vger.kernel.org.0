Return-Path: <linux-renesas-soc+bounces-14406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04003A62BEC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 12:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20550176E1B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 11:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A591F8670;
	Sat, 15 Mar 2025 11:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c3A8x4B5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577151E7C0A;
	Sat, 15 Mar 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742038644; cv=fail; b=M9jmCLLzjAZoKjz+9AsjfoW1yq1qLs3gbEern5uAhqb7abr2GnsIw3pUYst2LTp1pDQTsIKFuC2e/Qs5Lbv//wTfJAOWfAXItMl0Pd+lfcJjsXeH0ESj5L3ePYqhxDY59W1VEfGKArtIPqzj1NT1CYPiH1pI4v6pva3wWFu5b7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742038644; c=relaxed/simple;
	bh=oeNdljti8TM2Z3F1yE42e7XzSH2ee5zpx5y9cdQhGTo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JAXZI+uW2goP5GPezvYUbrKEYBag8oULcfdzHl5Xd/hJzgke/RxJpjkKnhiKLLGlzCRW0OY+qVUR/tJ2cELXSPs44EEQ4klzgAxMzzFy+KKDHUSeBcR/7fSS1RezFNJfB9ZlPmKz6glHuw7NIldwh7zwOd36R+iK2MeMMRVPLrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c3A8x4B5; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMdn0YrV9qiKXhKXlFKYuZHAfUczqmXxInp1qVCDCthC54NSlcgaWZMdxzQjfnWz7uazHJvxwIlnOW74TZY/6WHWH9vUMyZR4hi8YPNytnvAr5D9narJ1qavRZf9AJIwSsGlcTQGTx6NKYMvx88V2yyxDcnt6bArAG5QEJ3ABwgRL3vVdT47Vq6F+4FlRGsjTAuaPfwHZlOueqzP14b1ewCnnKA+Es4PBLPVQXLF+8phh90DTp2B19H10/zTwkmz6CDuw+rafN80k867es505/CGTAKlDeWz3lmkS10q00+vy6u83vWKKLFwAPlbvLo64S7llHwIm8YPePOWQtCcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeNdljti8TM2Z3F1yE42e7XzSH2ee5zpx5y9cdQhGTo=;
 b=Dypemv1Ws16FURaFB74/GNKCnw6hQNhMkmXOtZLEML/lm7mtA01CmtpOlZZOK+zyf2wcVDH9WWHN/4DaxkWux7zM8AW2doHxhFcuR8DZzmYXgdZDWdVFIZVrI1SNVwIj+hkVmugCTy+3uX2OufLrv8O9IiEZRda3EXXcvqiNoJCTvktTK4MwCfcBV3ZJ8rE9K9mKp4yC8kZpv7s2ERLwq9eqIxkAPSf1OY+KJBjHs8i54Y24vdMthILTpOU96DpoSkY+PGQEwYbm+4srJMhFVbh04jL/NI20pi1Uxn/O2d+vvPC4Y/92aBr5+nWAA5ooot1DZ7dlq6Ak/yIVgRDaEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeNdljti8TM2Z3F1yE42e7XzSH2ee5zpx5y9cdQhGTo=;
 b=c3A8x4B5UCI5GemWrPkWjElMicfPJCHoJT/jzq0dKbj06oIXSh96ujQlH6UZi31iSL2o4h4qlDeGXwtuFsvD6sjs31+peFSFQXocExqwCNw5/2QAa/ajcpbFoR9TnQhk2wJrAwVUi/uQsGoSFOsbXPsytT/uH0DjsurbflM6kQA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSOPR01MB12456.jpnprd01.prod.outlook.com (2603:1096:604:2d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Sat, 15 Mar
 2025 11:37:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.026; Sat, 15 Mar 2025
 11:37:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 10/11] arm64: dts: renesas: r9a09g047: Add CANFD node
Thread-Topic: [PATCH 10/11] arm64: dts: renesas: r9a09g047: Add CANFD node
Thread-Index: AQHbgfL9AlmKuWIwnUKQkhborBB3ZrNy8lYAgAFGmNA=
Date: Sat, 15 Mar 2025 11:37:14 +0000
Message-ID:
 <TY3PR01MB11346DDC1F21121F59B34563F86DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250218105007.66358-1-biju.das.jz@bp.renesas.com>
 <20250218105007.66358-11-biju.das.jz@bp.renesas.com>
 <CAMuHMdUi9_GnTbBwSCyfmEFN-eV1okSBLKNgb7OQ3z7WTb4-Zg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUi9_GnTbBwSCyfmEFN-eV1okSBLKNgb7OQ3z7WTb4-Zg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSOPR01MB12456:EE_
x-ms-office365-filtering-correlation-id: a7a5e2b2-1899-4fd8-6ef8-08dd63b5bbe0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YVhnSXR0TzdPeUJZQmFwK3g4QWFISGpjbEhtV2ZsaFEvM0ZEQk9HT2tPT0dq?=
 =?utf-8?B?eWhFeld4NFJWUEFQUzFNQWxiOHFta3pUQktya2lreXlJQ0tVSHlCdlJSb1Ry?=
 =?utf-8?B?MUtlMk16VVJPQ21DNVRMTkZFakg0SzFML2FtWDFaSGRsSDV0TlNtNUxkcmRR?=
 =?utf-8?B?TzdILzdibCtlbG5YTFZXWUtVQU5Gc3VBS0FqNHNXcWRNK1dwU1FyekJBODIy?=
 =?utf-8?B?L25tdWpSRXhRUFYrUWphV0szWGFhWkp6RVgzcFluV2kzaFNuNkM3eEdqWFNC?=
 =?utf-8?B?bGgwbk1pNFZvenZvaWxnWHF6czNjOFVIRktxVXRScjZsUlNSUHZ2K2Z0NHZp?=
 =?utf-8?B?RFY1Zld0bGQyYlFkN0JabElaVy9MZkx2Vk9XTWJvdTZ6ZnNOT21BYklvM2JM?=
 =?utf-8?B?clRaMVRGb3hrbnJjK1oxREkrZ1pVV1V4aWJma01MaE8rMTdUNEszbkp2Y1M3?=
 =?utf-8?B?NU8wd1pWYkN4TjVZdTZCQ1BwSlg5cTBGbzFNNDZrcnlYeTFwZnlmVzhiSjc0?=
 =?utf-8?B?WnAyVzNBdzBVWUJ5UDVvUnN5T2t0clBSTGVXSXNIVjhtT1VkTDRZU24wbGxP?=
 =?utf-8?B?VkgzWEhwWks1eWpCS0kxMUZhMUx2WUV1aE9mU0l0M0F1bm81M3M1aDg0M042?=
 =?utf-8?B?SVd2eTE3Tk9YZ1hsdWNXUUFMUUk4UDZiMkNIbVJFU3F2KzFaZkdzM25DaTFi?=
 =?utf-8?B?MnJvOVNWM2Eza2dGekIxSnlkSGtNQnRmckwrQjZvdVE3KzdoUmVNZkRvTXhE?=
 =?utf-8?B?K0x3ZSt6MFdtZjlqdHNsWmU3bEpoRnl6OHlnRDB0azVFanAwRE5sZE1kWlIz?=
 =?utf-8?B?bmpwankzY3F4eUtQVHJGV2lHbUdhVWNPZktLcEtvRW92SWEySzA3cVc5Q3Mx?=
 =?utf-8?B?MkFrV3hwMWF6UUpEdXNsMm9kM2JuT1ZaSHNvVXRLamxSbzBGZndXaUpmZWFN?=
 =?utf-8?B?Z3J0S0lKa09mVnc4UmFtNmhxNkFubVpDVjhmTWJlQmIwUGx2Mjk3dkgxSHQv?=
 =?utf-8?B?MVZZRlhRNFQxUk5XR0VRbFV1d0txRGxDN1M5bVp3MmVUOWVXbmZPQVRGY0N3?=
 =?utf-8?B?dVZOdHlheitSWjNCa0x0blR3M2VEaFZYYWJzUHpiSWdQSStNaFVUZE5QYlVl?=
 =?utf-8?B?Q1c0aWhzc3M0SDBtV1pjS0w4NDcxdzJPaGRQemdReHZqWkJrRkJHbWZHa0l4?=
 =?utf-8?B?QndLMGNDY2NZYlBMVFVGMzRZMVhobmUyVlZqaVNNRzl4ZER4cG05NDdCclNt?=
 =?utf-8?B?QUpGNjB0aW1DYXdKVnU0RDB3dVRWM3BHRDlhZ0pUa3pFWmNJSnFQWkd0RnZU?=
 =?utf-8?B?UmFwNC9SeDVIWmFWSkhad0dXcG9wVitjcjJLNUEvNTRqaVdUTE5PNEd4bWFk?=
 =?utf-8?B?YnpTZEpveEs3eExxeGlON2VkWjJCQ1VoUkgrU3A2Vkx4ZzNMWE5KWGdPQWIv?=
 =?utf-8?B?VW5rbDgvY041Vk1ISW80c1kzWlpOSWdsM0puNTZMTUVuTnJnb1M5TklmSnJY?=
 =?utf-8?B?SjJxblpPeEJvY3ZyR1lhMVFkSmF1QmhsRXpyeTBXM0lQazBNMmhFbm91WFZT?=
 =?utf-8?B?d3VnRStoRG5BUnVLenVxblk5dHh5MnI0NFhpM3NYMU1qSll3VG1YZlNsTnN2?=
 =?utf-8?B?WlMzOUNyVkw0QVZMdno5OVFUVGU1TlBYOUdqaUF0dDhsTmRod0V6T2RyWWpM?=
 =?utf-8?B?YmxpMFVsc25CcE1rMUR0Z0ZBNFBpSnF4bmpMR04xZVBzNzkyVmcyc0ZpYmdi?=
 =?utf-8?B?azI0SzZlaGxVQlFCbWRkZGF5N0c3NWt6dXRBLzJLaEhva0pJM1g3MDRwVmZL?=
 =?utf-8?B?SlNtWmVYR1JSdnN3Q0phVkxhb2RnZG90T2IwYnF2VWZ4TURSTXkrN3ZRb3Yz?=
 =?utf-8?B?NzZTVzBCNVFlNk5ubXFEaUFYQ2lOOFdodHZqMUd3dUhub1NTZHRhaVIyMnBW?=
 =?utf-8?Q?q+4Yst+Km7h6jODgOGjD2AEFUjqjxk8P?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dk9BTmh0UHF0SGNCaXRhQ3QwSlBFUmVQTnhLOG5pb2F2UUE2MjZraTA2N3ZT?=
 =?utf-8?B?MzEzMEpIVGRsellyNjFaZDRrdUJVbytVUkpTYnZ6RnZ1L1BrOGlWb0didFJX?=
 =?utf-8?B?amFsTDNpNmVvRUNSbGxwcmZGOGlwSXovNHZxdGVpZWJpWU9JUDE2VDFnYi92?=
 =?utf-8?B?RGtoenZJYnVpYmx2d1daWkg5a3gxMThoWGRlQStibGRyRUdlUEJTditUdUZY?=
 =?utf-8?B?VnBpQ0dJaXh1YVd4N2dkam5tdXJEbE1VK3BZcjZQRi8zTm1OSzF3SUljWnM4?=
 =?utf-8?B?QzVubktvSkxHMUJlTkcrL1diL2tuQlBaV1ptQkhqa0swY0oyQUpITUNsNVVK?=
 =?utf-8?B?WkNkYWZ6TmFYam9KZ0g1aTlxRmh0VzAzS0RLZkM5YWU0ZEFKL25SSmwyTGU1?=
 =?utf-8?B?RnJMM25xVXQ5TFBmT3V6NjY3N2tTcFdyZzcyd2toWk5oNnZjcnlrU3lKQ1Za?=
 =?utf-8?B?dmRGQU1GTmowOHJDV0FyWkJNbGRtT0xvY0tYS0hHeThyMkRibEo0NXQ3UGhk?=
 =?utf-8?B?L2tkclIxTnlrTEpHSDNqOWtUMEl0QzdqMkIwaTZRSTlhT2QyQnZwbjl5WU1s?=
 =?utf-8?B?ek00dWlOOFhxaWtyak9WRXBQL2d4Z3Z4N1g2SVdpN2tDZWNuT1RVUitBUHNx?=
 =?utf-8?B?T21WcjdHb1Jib05DUkZyUGRmVkttN2hUUitPZFJiT0IrZG81OUs5R0xpc2c2?=
 =?utf-8?B?OUdPSTNXdUI4Ynp0alRVdlBCRGlybUdUcGFNaDJzdXJDUDN5WkhFd1VjTERG?=
 =?utf-8?B?NUJsMmJaRGcrdGgwNmhsMEN3bXY0bHp2eW5oVEhmZDlUNGIzOVFsYXp2Z0Nv?=
 =?utf-8?B?cWJDNmE5U3owZTdXQXhpSU9ZYnU0ejI1SnBTVkxWWHI3NWtLTlhzeG9ERXFG?=
 =?utf-8?B?eHUyNmdCZHl5WXdjZDhXQndWMWx0MjNRYzJ5VDc1MWZWRHExVldmTGxpQjNW?=
 =?utf-8?B?OFZybDJWTW9lc3FwWG4zMWt0M2tVamlqWlAva1RWSGlCZ0kxQnZwWGdkU016?=
 =?utf-8?B?SStzR2QxU25RdHhyTUQ0VThFc3BXSmZSei9wTHFHQXllUzR2aSsxU0lHQTU1?=
 =?utf-8?B?Z3h0Um92MnI2Qk94NEtrcGIrZUNNUDJJS2VxTzUyK1kweDhTNlhZYlIrdDNK?=
 =?utf-8?B?VEJHQjlLQ3lmTDBYOHJ0Yms5SzBLeUQ3dE1OYmtIMGd0ejJ6U09VNnJMSHd2?=
 =?utf-8?B?cEFvamdEZU1PcWZJbzZodEZPaUNxdHk5NFREZDNQTkNxbFExQWVZandualgy?=
 =?utf-8?B?ck1yQVptOWdoWmhMQnVxZWZmQVBuOVhWaUJxL3RKL00xVXQxb0JQZFVUWVo2?=
 =?utf-8?B?ZFpIMkd1Q2lVZ0tlbjlVd0FxQlNNZmQvNHBpMDhvak01Z1NsaEFiMTVCa1Q4?=
 =?utf-8?B?dnhzNkFBeUhoRFlMazZpYXprTFRIS3dFOWJsWk94a2pOUW9xR0YvQzBhQTI1?=
 =?utf-8?B?RWtFcHRjSHpkdnZqTW1OUUMwWDV5K1Z6Q3ZIdkgrWTNrQWNrZjEzbkY0NFNY?=
 =?utf-8?B?M0JtQzFJOG9SaUtxd0dyNnVvbHpxVzlmL1VpenlobVZWUWtNV3dkYklPZHA0?=
 =?utf-8?B?S1BuN0ZVaHZKUVBraHVnaFpoYk1YczFEekd1NDBlSS9qVVJWRDZXNE9qUEI4?=
 =?utf-8?B?TDM4NTdhSFJrdldBaW4vb2pzSmF0WnZUM2RFT0ptdGpLT0Y1MXVNMklrL1c2?=
 =?utf-8?B?MGN6byt3ZzNKQ2Q3RVROakp5Q1R6blhBYUM5UHVvVVFOOW9INzZHUVgxUGx0?=
 =?utf-8?B?ZFhYR0pHemxkd00rS3dxSDZqZkZUaVFlcjJldVpPazJQQ3pHNHQvTE5GSkpZ?=
 =?utf-8?B?Y1RhZXFWS2pHd3dWZzJVaXI4Vk41Tk9TQWs4M2RDcHo4R0o2SWYrOFlKWWFK?=
 =?utf-8?B?bnlZT0xtQjJYZGRCRU9UeGVvWFprZU13VGhGMVhHMUlmSVJsZG9mNk55cVV3?=
 =?utf-8?B?ZnlCUlpmS29PRFpoUFMvd0pxaXJ3aFlYbjd6OTVoUlMyZXVGK0V5TWszWHZL?=
 =?utf-8?B?UGNmRTl4eTdiM3JOYUUzdnArbFlTV1krRWZQTktPUnU2b3pWUzFuK1dHb3ZJ?=
 =?utf-8?B?bHFPbktMSDBKQWl6OS93U05XNllqbDBCS0VLK1VoeGx6VGNMeDRnQlY1eExL?=
 =?utf-8?B?NzhaWmRzZWVTd0lmVWVpeDhIWFk5SWc0ZlBaOVFISm9hYjlFTjFLSlRLY2l5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a5e2b2-1899-4fd8-6ef8-08dd63b5bbe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2025 11:37:14.8608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bYjLio5WpVsVi8jiazr6Ryn6jxBIiqI4pbpYtcCFI+QP2IrmSRXndqYNHZg/2Iz1n327QXnvFcaWM1PWNtf004OPRiXVGSnKYN21ok0jRBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12456

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IE1hcmNoIDIwMjUgMTY6MDcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAxMC8xMV0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgQ0FORkQgbm9kZQ0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMTggRmViIDIwMjUgYXQgMTE6NTAsIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIENBTkZEIG5v
ZGUgdG8gUlovRzNFICgiUjlBMDlHMDQ3IikgU29DIERUU0kuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOWEwOWcwNDcuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
OWEwOWcwNDcuZHRzaQ0KPiA+IEBAIC0yNzIsNiArMjcyLDY4IEBAIHNjaWYwOiBzZXJpYWxAMTFj
MDE0MDAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgY2FuZmQ6
IGNhbkAxMjQ0MDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJyZW5lc2FzLHI5YTA5ZzA0Ny1jYW5mZCI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDAgMHgxMjQ0MDAwMCAwIDB4NDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA3MDkgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDcxMCBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PEdJQ19TUEkgNjk3IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MDMgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDcxMSBJUlFf
VFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPEdJQ19TUEkgNjk4IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MDQgSVJRX1RZUEVfTEVWRUxfSElHSD4s
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDcxMiBJ
UlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPEdJQ19TUEkgNjk5IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MDUgSVJRX1RZUEVfTEVWRUxfSElH
SD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDcx
MyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPEdJQ19TUEkgNzAwIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MDYgSVJRX1RZUEVfTEVWRUxf
SElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJ
IDcxNCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPEdJQ19TUEkgNzAxIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MDcgSVJRX1RZUEVfTEVW
RUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNf
U1BJIDcxNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPEdJQ19TUEkgNzAyIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MDggSVJRX1RZUEVf
TEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxH
SUNfU1BJIDcxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiZ19lcnIiLCAiZ19yZWNjIiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY2gwX2VyciIsICJjaDBfcmVjIiwgImNo
MF90cngiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJj
aDFfZXJyIiwgImNoMV9yZWMiLCAiY2gxX3RyeCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgImNoMl9lcnIiLCAiY2gyX3JlYyIsICJjaDJfdHJ4IiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY2gzX2VyciIsICJj
aDNfcmVjIiwgImNoM190cngiLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJjaDRfZXJyIiwgImNoNF9yZWMiLCAiY2g0X3RyeCIsDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNoNV9lcnIiLCAiY2g1X3JlYyIsICJj
aDVfdHJ4IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdf
TU9EIDE1Nj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BH
X01PRCAxNTc+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQ
R19NT0QgMTU4PjsNCj4gDQo+IFBsZWFzZSB1c2UgaGV4YWRlY2ltYWwgbW9kdWxlIGNsb2NrIG51
bWJlcnMuLi4NCg0KT0suDQoNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2st
bmFtZXMgPSAiZmNrIiwgInJhbV9jbGsiLCAiY2FuX2NsayI7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgYXNzaWduZWQtY2xvY2tzID0gPCZjcGcgQ1BHX01PRCAxNTg+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDgwMDAwMDAwPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyAxNjE+LA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIDE2Mj47DQo+IA0KPiAuLi4gYW5kIHJl
c2V0cywgbGlrZSBpcyB1c2VkIGZvciBhbGwgb3RoZXIgbW9kdWxlcy4NCg0KQWdyZWVkLCB3aWxs
IHVzZSBoZXhhIGRlY2ltYWwgbnVtYmVycy4NCg0KQ2hlZXJzLA0KQmlqdQ0K


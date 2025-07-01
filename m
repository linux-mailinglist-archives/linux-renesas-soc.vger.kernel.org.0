Return-Path: <linux-renesas-soc+bounces-18993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2BCAEFCC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 16:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26A7B444A60
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFED27604B;
	Tue,  1 Jul 2025 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lepBG5o8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A3275AFF;
	Tue,  1 Jul 2025 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380743; cv=fail; b=M4ILpQv2e0QkyOU7fPDr0GX8xY/KuNnnzwQ3VSXFVDF8mNQg6QQVVgQs9HqXi5ZAUJjjckA/WBclLTA4ZDBN64jCRutNKDTEiM8RO8R/iRa4YKFVUkUk3kPBhb46V4FGKR2/W9Ux8bgpvHX3YFqnDRhY4Li0oytZxHS/X/gIkuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380743; c=relaxed/simple;
	bh=lwzkZoxs+OOlc7YLbXqabE5emx8YiRKZazafK8LF0vI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ugzKWrWquEYZmYluBxdRDvMP88mn20ZgsGfw17lINktTKJ/z/uku6LJ43QyG3EmDFB2xg04xRS3SGpZAyILLPxdqfIOELfJcn++X7PCoiRIHG+6FkPa8TDZkGkyKRbaqLD2T9/g9Y9jflAt9C0klg6hDorz9HYfHP01ff3uCew4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lepBG5o8; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yij+ClqwzM3Kv1c8og8mcdVd1Cd6O/O0445ssO49ppErO8FvRgilcfNpc65N8goBVUOlkROh3kQ+GuvzyXbvtJIb1V5Itk61tVYH1QibM8S13yXhmCiuSK2Xv3TnqzJsdQA5hQZw3mDrGiq8xXFaH88Y4s1YBQPcgx3svnmUlKQ1mldfKUzI4ZTT8AAexGI+bTc+0hUDGLH1sUJTsTtxWGFL4rQK66z0WKARDsTdGE6yyWK8RzS8w0EW1m0pgtYscDaeRO2PDJyqYde7jeEzf5YoLalvikv20By/ISw3ncnt/siWEPozvmiwCoIRvhttLbI5GedssHZtiU6+wByi3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwzkZoxs+OOlc7YLbXqabE5emx8YiRKZazafK8LF0vI=;
 b=Gik3evNIIh9QpzdXKTCbuUqRz6YP7UoTZ6RjX/fO1olhSjd7qT7RsjwsomM93UbKiUXsMSMB8WO3JejSZ+VpB0wDxzzTZQ4FISy7RxM8yS9DWEff9Jep788v3cLbm7hffCChqTx7mHWwDCVnNggW+SbkgLqGh7yh3PWY2c8OgkfpLOnPDsO0R/CfUj/R6vR146AWiJxk8qJI5HoieW/8bhPVrMUennWtPXN2q/DY8OVRAxIy73YEKiet4cP/I0zA7swzX8guI5ajHLuxIBgGF4oH7NKwMpS7m4H89I1pcA2XA7UpgevBo4UE+ytYkwM7MTgGuZiXGy5w4USzrNfD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwzkZoxs+OOlc7YLbXqabE5emx8YiRKZazafK8LF0vI=;
 b=lepBG5o8jKJa0lYYymem8sWaad2TAFuiHCTt+UBT3VteIbFfH3CJ8WZAJT2sTgJoAoaUOj+lbac93wbBfWmAg5OqAtKOJnDQflcTyJc1zhP+BRXK4vYlbgpAXTN1kHhDoBw253GzGew5ocAbg5U6Ll7RPD6170za41+wVmvTvkQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8542.jpnprd01.prod.outlook.com (2603:1096:400:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 14:38:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 14:38:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Topic: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Index: AQHbrVNDGj8C8kQeE0eZE1bPrrwQPbPEGWSAgFmCYRCAAAYYgIAALWkw
Date: Tue, 1 Jul 2025 14:38:53 +0000
Message-ID:
 <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
 <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8542:EE_
x-ms-office365-filtering-correlation-id: 88c7b9a6-3165-401a-d726-08ddb8ad00b7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NG52ZGtyMGJzT1JJa3l5MkJJZHNwTnN6MGtRcnFQVEwxdFNrNHZ5UkUvLzg4?=
 =?utf-8?B?OTh6eVhhVUV3WUVYazhMckpKNXphQXdaZXFqMTV2NXVWVWs0cHJZNVVZT2Ri?=
 =?utf-8?B?Z3k1UDM3bmFXdXRJS1BnOTZMMUxQVnMrVmsrRTVXaGgySTUvckFQK3FiQ1Zz?=
 =?utf-8?B?UVJxMDhaTzQzNWJtSmJZN3U5bndPSnJWR2ttcWxxa2FtaFFDMEVyenN6aFh0?=
 =?utf-8?B?YjdsTnNPSTc3eFNoemVrek1lOWpPenVpMWNyR3V1bEVtRUxsTnNLeC8zdGtp?=
 =?utf-8?B?OTFyZFg5UmMwd3RMcmphbk5IVDAvTjV4dytiRUNIMzNUeU1BQW84QXpHdExB?=
 =?utf-8?B?WCtRays3N2VvU2hoeUdOUTVJeXJORXMrczdGc2JYMnJBOTNEMXE2U3hEODM1?=
 =?utf-8?B?b2tPNmRKWE9XSWRiSmNPK1VySCtxMS9GUTBJRGJwMVp5cUlHUlpUR2NvUjMw?=
 =?utf-8?B?T3RISjEyOVluaENrWTBSUEJ2TG5CMk9wSGdqRzh2NXlIeEg5Tm9KVGhJM2VQ?=
 =?utf-8?B?bEZQL1VkM09pdVJSandWSUk5cWtvb1BRZ2N2VTJXTG1nQlNObDhlcEFCdzRt?=
 =?utf-8?B?RC9jZUloQkp1VWJaaDdnSFhSZ2F5S3FvaC9MVmhWMTBQN3dIZkpmcDNmTGZo?=
 =?utf-8?B?enFscGsyOGFwSWhwb2ZKbWkrQjFweDQycHJIc2FhMFowdnd1cHpDeGFIVlNp?=
 =?utf-8?B?MUtWM2JDUmhkVkQxWXdiMUZnUVpsRy9iZUcrT3BRUXlRYTJmVWt3STNnZll6?=
 =?utf-8?B?bnNvQnZIVmY1Tjk4S3RWTHBFdFhuZXdSNzk5dWY5U3dHMElpT2JlL0R1Tm5o?=
 =?utf-8?B?TFdRQUlxaXNValpZenJZNU1jTzJXRUZTSEhydSt6S08zeTNZYkZPdEpXdjJP?=
 =?utf-8?B?c3crUk1yNDJlY1VEWkVPeWdnQVh5bW5aVmJmaVUzTUhtdGtsSisrdEhXL1dp?=
 =?utf-8?B?UTZ6bmVkUllTSzVZWmdWRldwQjJzMjlXUHNXeVlLZzhTdmxGZ2FsNjd2czlZ?=
 =?utf-8?B?Z1dxdTNaRHhLdkwzWW1Ub0o5ejZiMzlHVFlzWTV6aVhxV2t3RkRSTEorS0kv?=
 =?utf-8?B?ZG5iSXU3MndNWGFTd25XcktvUlllNXBNaEVONUIyVnh0WWFNc2d1UXVISXg2?=
 =?utf-8?B?L0QyMUhyWkdVTmUyQ2xjSDA2bXV4WkNXNkY5V3l1aVlwYlRiMTVvK2FSVk5a?=
 =?utf-8?B?SVF2YklNa0Mxcjg1c05UWnNRaDdWRG9Ua1RwZFdtMUxFYUZ6Y1grc2p5MFdM?=
 =?utf-8?B?YTZOVnZ5MTlBVlFZV2tTWTY2YUhQR2RpSWFQYjNSVEdGcGdya2YrNFU2TWlz?=
 =?utf-8?B?ZU4vUlI5c2I5aHBrNEd1WGxOM0VnNDAxTnNQb3hUaVlMZ05HN0JmV0RUZ3ha?=
 =?utf-8?B?Ym9oSm94cjF6K2ZLUmtlN2s4d25tSWdoWHZBcnRVZHFVbjcrZmQ3VzBLMUtD?=
 =?utf-8?B?Sm10TVFPNzNLQ3RpbTV5YjJoRXdrOE1iUzVEQW9HdjhITHJJd1hNeUdPcjJn?=
 =?utf-8?B?TXgzbDBpaENHL2V5WTF6cDJteWtjeHd2d0ZMQnF2RnJpU0F5c1huR254YVM2?=
 =?utf-8?B?S2NKTzc4U0RUN1JWMHZyTWlNZWlCVi9NV3pFUXFVSFZFSmN3MUh4ZlV6Q2xn?=
 =?utf-8?B?WjQrVVJpM05OUXJuaTJUS1czN1kwRmc3QUYwUzRaWjdKZUdkT0JKZHR6Lzgy?=
 =?utf-8?B?ZFJxSzltUjRVb3FnM0hVaDBGaEtSaWV6OGtsT1pHVlA0NHUzWHM0L2g4UzM2?=
 =?utf-8?B?TGF2Vk1BUGw0SWJBZGN4SzFnT0RxVk1rQ3B0WWJ1aHRFcWUxbFRobDVaUExa?=
 =?utf-8?B?TzkxdzhCVG8zd3NEb3ZUYnZFUUNaK010S0VaTXBwdzcwaDhtcC9Id3JEMWFi?=
 =?utf-8?B?MzE0ckVYdlNpNlBGUDAvQm9qZVFrdWsxY29NOWtXeGU5NHhGYk4xalgrZm53?=
 =?utf-8?Q?lpLpwfc9O20=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cytmNXVEbmhVUWg3QmdxUFdRUHBPL09zTXJKUHRNN081eVBtb0RLTS9wNGYz?=
 =?utf-8?B?K2FPTk40UUl4TG1sKzNBWExLeWFxTk1kVU1objc0WDhOVjNoNStDc0hLbVF4?=
 =?utf-8?B?Tzg5ZGgzMFdnem5lb1NxeFAxVnYvNTF4Rk9XSWVxWi9LSjRBWlB1Y24xc3Av?=
 =?utf-8?B?L0J1VWJCR3QvZWw3R0x6Ry85NjVoS3VwSS9pYmVRUCtOTDFZcmJnV3doUXk0?=
 =?utf-8?B?NWZYYTVvR1JQcGJCSDhUaHBDVGM4WHdIR1hVRnBIOVdqczd6Z1RBMXJ5bDdS?=
 =?utf-8?B?aldWbmYwUkhxVUwxRy8zTm5ZYzlqUXRTeGs3VkFWRVNjUVJlZzNQeUI4MWtO?=
 =?utf-8?B?MHBERzdpR3lGU3pnQndnL0J5YXRYQ2VtWjZQeDA1ZGx0dVFXZlc4YnNsVndC?=
 =?utf-8?B?anphNXRRNFhLWU1tblA3akJYa0MzdGwwUG9uVkRFbUJ0SlRCT2xlNEd3dTF3?=
 =?utf-8?B?UENlVkRRdE5PNjFjS2ozeU5pTUUxS2ZJVWlObDZNMG94VU9NSzg1VmJjWURq?=
 =?utf-8?B?Q2x1cnoxQldTeFJxWTh5OW1qQytPaktuUDA3eUhsTFpwd0J0ZjVqQlp1MFJn?=
 =?utf-8?B?bEhXc3k0RW1aaGFLcWhIWk1NbXJrMC9MSHFKN09PQ01VMWVaeHVRV3hFVEs0?=
 =?utf-8?B?QS8vWHUxQVJiWStwSmkvakJya2llT0lqcm45VTYwSmRzMmxzTUc2dEhKaEFl?=
 =?utf-8?B?cFQ0dURFdlQrRXgyTDVwT002NERMSm4zUkFMTG1zU3VzRXJFYXpCVWxPNVBL?=
 =?utf-8?B?bm43Y2t4cGhEN0lIWnJNcHhuSjBpL0JoUlg2UzJZY0RyR3Vqc1lJZSs3N3hM?=
 =?utf-8?B?S3cySlZUdWFuY1BTNU1MMHQ2VXNUNEhscTBHK0srRHJOeDJNYXRjdmVVQmJl?=
 =?utf-8?B?amtIUE9rNG5XUi9sKzM4Q0tPU1RLUXVDN3N3SGNIdldvSnl5b1BEVTBlVy81?=
 =?utf-8?B?L04wM1NNdWFiT1M4V1ZVWXBnZFd2TXVIUzYyT3RvVlZ1bTVyaXlERmxMMVRT?=
 =?utf-8?B?cE1BTVlYN1BnWXZHZ0JKdVNGQWs5SDRocTU5d0JNb21mdC8xWGMyLzhMWnpU?=
 =?utf-8?B?VUordDUwOU95OFVhVHVvUWhYQUxRRlpud1JEOWdqd3Z1SlJBV1dmYjZpMGN0?=
 =?utf-8?B?ZkdzUHhOMldEdGg5M3hKR0dxVUlWUGZIYjRaMUlxRjNBT1AvbzRjMzcwSU50?=
 =?utf-8?B?ZTAzdUxNSlJ4bG8zMWNyRTVlclJlb2Y2NWJSQkR1OXNRM2dSY3Q5U1Vud3VJ?=
 =?utf-8?B?dXk4RHU5ZnJwdVJzcFRmTWJOc3R4QmF5VndUOE5sTkhpSUVXQjdMZEJZaWtL?=
 =?utf-8?B?UUVFdFFHWElvY3BNRWZERktlcFZJM1VSczF4VitadVBxTVFXSXhPL0padlFP?=
 =?utf-8?B?TW9Fc1pucld5MXE0VEJnNExoRmo5M3RPN0wwcDRHRlZWTmlXalF6UkRwTVN5?=
 =?utf-8?B?dzNJWXBjdXpYZGp4cXJGSFhzRGVtSnU1YmptaFNMdkNLZFpYMk1LN0p5WHFI?=
 =?utf-8?B?T0kzYWJFTHRPY3Q4MWIzbVpHMWx6b1ZwQ1F6Tk9oUUkvOG9EeG5TZ0lwOTQ0?=
 =?utf-8?B?eENkK1Jwc1BaMnpkM1RHRjlwMEIrRW9hWFczbGd4OEFqTFF2SzdQZnJRSnU2?=
 =?utf-8?B?b1BLNEFhU0xsTStTOVgybnZnY0ZqWnZGYVZWL2RZVk5SS1lrVWtPWGdxNHN1?=
 =?utf-8?B?WXRoTUVIbHc1aSt5TS90Q0FQS2xvVVdMWU90c2Q1ZWU5blZ0TzZXeTNGVjYx?=
 =?utf-8?B?eHZkVzd6TTFxRHJkaVorblFkTnkybzhtNjNXaGJ3cXh6d1NzOFR1NE9WaDh6?=
 =?utf-8?B?QS9RMkJ5OUtpU051MlYvWVJ2L3hCZVRkNzlYTW5EM05wSU1EUU1PN05JZmpn?=
 =?utf-8?B?OXk4K2R3TGlqcVZPbEd1a3BiMzE4a3JQT1MxL0VxUXE3eGd6RjY3VFNiZFBB?=
 =?utf-8?B?TTYrRCtQNlpCQ2p6Z0lFU0k0T3BkelErRUpKcDBGdUhZZFpFNkltM29KT0ky?=
 =?utf-8?B?dUdxSzN1SFJGSFFuVnZyTmNFcW1IQkFnaytuNVdRU1BUZFVWd01USFJZVUhD?=
 =?utf-8?B?Y05RdWY2cW1sbkZ4OTVralk2Uml6MktXbituL2lXaE16Rjh1VWRJV2hKQVRi?=
 =?utf-8?B?QnV6MDd0SEZyOXlKN2tZQkViUFJYUkwxckwxcXNkeFNSNUZsRVVYQTI4V09p?=
 =?utf-8?B?Zmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c7b9a6-3165-401a-d726-08ddb8ad00b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 14:38:53.7133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fas0J8j6zYge4OHhFeMOe0aS+8N3zC7mOJD1q0l9eJye9qWj2uObDKPnaGHojIWfBCbv8hJnf1ekTTf0gHeteW3wyEVEiF6SXGkK7fFWI4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8542

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDEgSnVseSAyMDI1
IDEyOjUwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5
ZzA0N2U1Ny1zbWFyYzogQWRkIGdwaW8ga2V5cw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1
ZSwgMSBKdWwgMjAyNSBhdCAxMzo0MCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+IE9uIE1vbiwgMTQgQXByIDIwMjUNCj4gPiA+IGF0IDE3OjM4LCBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBSWi9HM0UgU01BUkMg
RVZLICBoYXMgMyB1c2VyIGJ1dHRvbnMgY2FsbGVkIFVTRVJfU1cxLCBVU0VSX1NXMiBhbmQNCj4g
PiA+ID4gVVNFUl9TVzMuIEFkZCBhIERUIG5vZGUgaW4gZGV2aWNlIHRyZWUgdG8gaW5zdGFudGlh
dGUgdGhlDQo+ID4gPiA+IGdwaW8ta2V5cyBkcml2ZXIgZm9yIHRoZXNlIGJ1dHRvbnMuDQo+ID4g
PiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gDQo+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9y
ZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4gPiA+IEBAIC0xMiw4ICsxMiwxMyBAQA0KPiA+
ID4gPiAgICogU1dfU0RJT19NMkU6DQo+ID4gPiA+ICAgKiAgICAgMCAtIFNNQVJDIFNESU8gc2ln
bmFsIGlzIGNvbm5lY3RlZCB0byB1U0QxDQo+ID4gPiA+ICAgKiAgICAgMSAtIFNNQVJDIFNESU8g
c2lnbmFsIGlzIGNvbm5lY3RlZCB0byBNLjIgS2V5IEUgY29ubmVjdG9yDQo+ID4gPiA+ICsgKg0K
PiA+ID4gPiArICogR1BJTyBrZXlzIGFyZSBlbmFibGVkIGJ5IGRlZmF1bHQuIFVzZSBQTU9EX0dQ
SU8gbWFjcm9zIHRvDQo+ID4gPiA+ICsgZGlzYWJsZSB0aGVtDQo+ID4gPiA+ICsgKiBpZiBuZWVk
ZWQuDQo+ID4gPiA+ICAgKi8NCj4gPiA+ID4NCj4gPiA+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnB1dC9pbnB1dC5oPg0KPiA+ID4gPiArDQo+ID4gPiA+ICAvIHsNCj4gPiA+ID4gICAgICAg
ICBtb2RlbCA9ICJSZW5lc2FzIFJaIFNNQVJDIENhcnJpZXItSUkgQm9hcmQiOw0KPiA+ID4gPiAg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxzbWFyYzItZXZrIjsgQEAgLTI3LDYgKzMyLDMx
IEBADQo+ID4gPiA+IGFsaWFzZXMgew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgc2VyaWFsMyA9
ICZzY2lmMDsNCj4gPiA+ID4gICAgICAgICAgICAgICAgIG1tYzEgPSAmc2RoaTE7DQo+ID4gPiA+
ICAgICAgICAgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIGtleXM6IGtleXMgew0KPiA+
ID4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJncGlvLWtleXMiOw0KPiA+ID4gPiAr
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBrZXktMSB7DQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JnBpbmN0cmwgS0VZXzFfR1BJTw0KPiA+
ID4gPiArIElSUV9UWVBFX0VER0VfRkFMTElORz47DQo+ID4gPg0KPiA+ID4gU28geW91IGFyZSB1
c2luZyB0aGVtIGFzIGludGVycnVwdHMuIERvbid0IHlvdSBuZWVkIHRvIGNvbmZpZ3VyZSBwaW4N
Cj4gPiA+IGNvbnRyb2wgZm9yIHRoYXQgKGZ1bmN0aW9uIDE1ID0gSVJRMTQpPw0KPiA+DQo+ID4g
VGhlIHNhbWUgcGluIGNhbiBiZSBjb25maWd1cmVkIGFzIFRJTlQgb3IgSVJRMTUsIGN1cnJlbnRs
eSBpdCBpcyBjb25maWd1cmVkIGFzIFRJTlQgSVJRLg0KPiA+IElzIGl0IG9rPw0KPiANCj4gT0su
DQo+IA0KPiA+ID4gQWx0ZXJuYXRpdmVseSwgY2FuJ3QgeW91IHVzZSB0aGVtIGFzIGdwaW9zIHdp
dGggaW50ZXJydXB0IGZhY2lsaXRpZXM/DQo+ID4NCj4gPiBpbnRlcnJ1cHRzLWV4dGVuZGVkID0g
PCZwaW5jdHJsIEtFWV8xX0dQSU8gSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCj4gPg0KPiA+IFRo
ZSBUSU5UIElSUSB3aWxsIHByb3ZpZGUgdGhlIHNhbWUgcmlnaHQ/IEFtIEkgbWlzc2luZyBhbnl0
aGluZyBoZXJlPw0KPiANCj4gV2hlbiB5b3UgdXNlIGludGVycnVwdHMgZGlyZWN0bHksIHRoZSBz
eXN0ZW0gd2lsbCBkZXRlY3Qgb25seSBrZXkgcHJlc3NlcywgYW5kIGZha2UgKHRpbWVyLWJhc2Vk
KSBrZXkNCj4gcmVsZWFzZXMuDQo+IFdoZW4geW91IHVzZSBHUElPcyB3aXRoIGludGVycnVwdC1j
YXBhYmlsaXR5LCB0aGUgc3lzdGVtIGNhbiBkZXRlY3QgYm90aCBrZXkgcHJlc3NlcyBhbmQgcmVs
ZWFzZXMuDQo+IA0KPiBTZWUgYWxzbyBjb21taXQgY2FiMzUxMWVhN2EwYjFmYyAoIkFSTTogZHRz
OiBtYXJ6ZW46IEFkZCBzbGlkZSBzd2l0Y2hlcyIpLg0KDQpBcyBwZXIgWzFdLCBmb3IgR1BJT3Mg
d2l0aCBpbnRlcnJ1cHQtY2FwYWJpbGl0eSwgSVJRIGNvbnRyb2xsZXIgbmVlZHMgdG8gc3VwcG9y
dCBib3RoIGVkZ2VzLg0KQnV0IFRJTlQgc3VwcG9ydHMgUmlzaW5nIG9yIEZhbGxpbmcgZWRnZSwg
YnV0IG5vdCBib3RoLiBTbywgd2UgY2Fubm90IHVzZSB0aGlzLg0KDQpUaGF0IGlzIHRoZSByZWFz
b24gdXNpbmcgaW50ZXJydXB0IGRpcmVjdGx5Lg0KDQpbMV0NCmh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjE2LXJjNC9zb3VyY2UvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9ncGlv
X2tleXMuYyNMOTgwDQoNCg0KQ2hlZXJzLA0KQmlqdQ0K


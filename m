Return-Path: <linux-renesas-soc+bounces-7162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A6929EE8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 11:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49E921C2295B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 09:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052193D0AD;
	Mon,  8 Jul 2024 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hNkvcUeG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EB04D8B6;
	Mon,  8 Jul 2024 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720430275; cv=fail; b=sjXLWgJoW5cSIzPNS6VO2BwYfVCEzmJsb4ECzniRxL790n/8b1ea3SF5WIAgbVvUqJg5DjSPxmY7D28nCoW23S0pkjGVPhoirF8WcB/fHVHBnIymm1LfbiP8dpr4lLeN3jtTFFcwX5uIdMdefl16BpGMqeX7C4D4Hwy5u/3MjIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720430275; c=relaxed/simple;
	bh=+7zm+mqIFMbtSQyVcE2Dbq/LuxYC8zkq7shDGcom4X8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GJNbHYdnB11nlr8Dg3mc6xw9HkqhencOX4M6BTsfETBnL6hCjVTYLdhx+72Kqj2cn9MtauZ6gVB8KZ9tGCrvRsPWbqrFJrGm4ZoagNzV/8s+XninoWz3e1DqO/D8978NBEyT6DSW1XcprkgX44e7rjA8f2oiCABDRSI+d33KivM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hNkvcUeG; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoWlux1r7XuL8wDT5UWB6bsha5OjX9jWyzMIOKV0n2MCnvkNQWyhy5HSX8rl5daULBYX/c5YOOWwabd+jmPqdh8TJspGWN9XcfRPzM864713ojLY9t1GpkcC7NJxy85vlZhfoRjqQmjAfSf4av22FIeEgHbmKPWO+m1gDgX0jtiH/JRGb1AlWR+/Ge461yD8JCYHoaCcVs3YTpNbsOGjTlS5FTVnlyc0V9xJbWvh3wbyy8Xgf8zxtAS3p7lHUGoCmjQrkt+PdCYRYZoFy8TGXjmdovkeEgubL4DLN5QoLstLxpq1e21MHxqzokuRLBVuofAFO23/09Zz0Bn3zHz0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7zm+mqIFMbtSQyVcE2Dbq/LuxYC8zkq7shDGcom4X8=;
 b=ahjkzK85KJlFLPuKMDZNkiipUdnkYlUkk3SOpzRc/84y1SkU3Sgir3geItMwpggHPdRIKwT/FqPjBRZqpscA8VhrajGJDq/ReP393nTHG+oUUB6AOSnFi7p7TlOrvPT8hGEHCiFPvsX7YDQnzOd3ShUZDd0Hh1H3CQ9uNtsg8H+5vTl3G9MPpSETcZxPW3XFA/YlO+RF6SmUebRPva4QKvK5mG1gtrRUE3szVLolL4qiRSJ9CLiTSFWGMLeza/tzrjVMNNWCxsvuww5cav42KfKP30r/H6pwjL8C36r8I+KUJXC7Tx9NIInw3kq4083aOH5kRoNQcjerfzzUaNgQSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7zm+mqIFMbtSQyVcE2Dbq/LuxYC8zkq7shDGcom4X8=;
 b=hNkvcUeGBQ8J5MCEqlSfM63rirlqGMCpa0v8ur7iDgxC4KEpEGWwui85AtjfkiK5gPN5o2+qTCnhPd2FBz2zTv/Khv6jPDkaWulqfl2LyPZ0BY891IkbbcrF9ndeqOw5ww8kHxFoD7l0pe1nnBVpkTIKoyd5zJUiT3ls96EWfqU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12263.jpnprd01.prod.outlook.com (2603:1096:604:2e9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Mon, 8 Jul
 2024 09:17:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 09:17:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: rcar: Fix PM imbalance if RPM_ACTIVE
Thread-Topic: [PATCH] remoteproc: rcar: Fix PM imbalance if RPM_ACTIVE
Thread-Index: AQHa0RHd82aLfV8e4kW1yB1lZz7l+bHsi68AgAABZWA=
Date: Mon, 8 Jul 2024 09:17:50 +0000
Message-ID:
 <TY3PR01MB113460364050C980F6ED5030486DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240708083553.30799-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQD5jdAEzmgzh+TeSfTbHvJTePE6CdcVTLDNMOka-dHQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXQD5jdAEzmgzh+TeSfTbHvJTePE6CdcVTLDNMOka-dHQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12263:EE_
x-ms-office365-filtering-correlation-id: 2427f326-8292-4592-6652-08dc9f2ed707
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ci8wNlJHdWpKRElRa1J2R3FCL0tGNEMrUCsyVHY1OVdZZUZobGZEaVZ5blRL?=
 =?utf-8?B?anU1WWc1ZVBZcVhENzZBSTZkV2owYUkydEIxNldxZjJYdUl2UXEwUkpGbkJB?=
 =?utf-8?B?V3dWdUhteUVLbDdJd0Q5NUJzM0Uwa3YwUmV4UmFlVVR1bm9ndGJwRHVpd2xN?=
 =?utf-8?B?VDEzdlV3cEdRVWhLZGJIVWdIcW05blE2Y1lOSXRkczdmZzlkVW9uR1llRm5v?=
 =?utf-8?B?bVFTUW14MnVCbVMydXVyWHYxd1N1T3lBbGVXeW0xTERHUmZFL252d3IrZW9Y?=
 =?utf-8?B?c2ZuV0tXWDAzSXZiNTcwUk1acTI0Y3V1em5lQWFiR0ZnNE02c21IUGZYa1Vh?=
 =?utf-8?B?SHNUQ2N3U3ZsMFdXcUVUV0hwK2VWZjMxbksvMzEvUjJnWTJUaHdtRkpMNmJL?=
 =?utf-8?B?MzIyaFYwazYzbHNWWVpZcVZNYURBR1R5YVo2MmZmNU9kdjlQekZtWlNuUGNn?=
 =?utf-8?B?eXc3UllJN1hhQ2EvcW55dVFNcThRYkZFZ2FwOHdRZGJJQVQvMFJEKzhRVTV1?=
 =?utf-8?B?NnJXQmZTYnJyd2tVN1E0a0htTnFYekNqTEhQZy84V0V2UUFUM0NDNHkzenc5?=
 =?utf-8?B?dmlSTmgyeG9SVjdHdHJ2a2g4NXBoUWtEdDYxYTIxRnh1NHAvVmtJZWlKem5z?=
 =?utf-8?B?ODVnZHVnVmlmcjFrcWN6d1pJdGY4QUkxdUZHV0l3bVArNmdzUUJaUEpOdlkr?=
 =?utf-8?B?Uzd2bXB3WVhUZER2akp4NW55SDlyV0VqUnJtcHh4ZkwrT3ZaRlBrYkZpYk9w?=
 =?utf-8?B?Yk5BZFVqVFBRR3FmLzZ6RWdPRmR0ZmxRSEVLd1hzTlpCZFF6MnpEZ1lVOG9l?=
 =?utf-8?B?aXYwSmpRcVNIR0ljcU1hSHpvN1NuVnVHdTN4eG94ZVp5SFowV1lLOXJEb3ZL?=
 =?utf-8?B?eklyaVJrQStFcmMvdTBsbXZEMjVITXVOcGgzanppaDdaYTZHRUNmc1E5ZFVR?=
 =?utf-8?B?dlUrbjI4OWY5eWhLOGJQR1NtNUJvOGhZMU56VWNVaFRhNFZ1K01aYWVXSWY3?=
 =?utf-8?B?dEJWTHZzQnBFNWliM2kyUWNncEhtUmdmTHRpdlZxaXBZS3ZicER0dmtPUWdo?=
 =?utf-8?B?ekVENVpKelR5K3lsZ1lMK3piWWRnMTcrNnNIb3pyZFBnK0d1LzQzNEEwaU1B?=
 =?utf-8?B?NUo5MHZvS01uMEkwY041Q1dPZXpSaU1mNGdhVmJ6Q2x2OVB0aUhYZ0RMRkRG?=
 =?utf-8?B?KzhhN0s5ZHU5bEFSZ3BCWmJ5ZXUvTkN1MFV2Z0hmMzQvSmlMWDJWK1ZQKzlS?=
 =?utf-8?B?NVpiYVA1YUxBQldYcTd6bzJEV05GbkprSy9ETm5FNGZ3dUx4eWw0S0dOOTRU?=
 =?utf-8?B?REtkS3kybVorcXdGRytmSEdpMzVIejZEM3RqazVuaHBSWFBTQ2gwcEw5cjNh?=
 =?utf-8?B?UDJEOUR3eFlJQmJGRVI1V2JtdmZncmJwRVdkZmpGYktwdDN4dzUzQkdxMlky?=
 =?utf-8?B?bEtzVWY5QVU0WFR2WFhVdktBMDBDYTFad0oxbXl1MGlBWHRPaVVCY2VxTmdR?=
 =?utf-8?B?bDM0R01MQ2JRREsxRi96K2Iva3ZFUG04VVhwTTZpMitXWWE3bG9XSlEvKzNh?=
 =?utf-8?B?d1lPWkM5UkkvbUdHYjhTbnQydTVzUStoZ3hRblBGV3JqSjN2YTBGYXB5VHEw?=
 =?utf-8?B?YjNXSlFnaXo3SlZvM28vU0U0aU1rRnZiNW12QlFuaWlaYUFNMXdlOTJsM3lP?=
 =?utf-8?B?YXEzVUcxdWIwNithMTh1Q0JzOGJ6cFF0UERZeUlQMkpZbUVUYmtXYktRZXhE?=
 =?utf-8?B?TTJqQmV2ZGQ5MDM4MWxwMWdKWVluejlzQ0xkL3Z1NUpXV2hidWpxcDBLanlI?=
 =?utf-8?Q?zmg36EcMjgY5KqE1nvOa8+zY26N3C1j6KutyM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TXlEZW9HQTUwZjRZdHF2YVNMZmNmS05HcGd2cjVsbkw3RUtkUlhLbEsrWDdz?=
 =?utf-8?B?OFhKbUJFa2tSb3ZZcEQ2aGovM1A4M0U4TEFZc0doVko2Y2pOUUpJY2RQdHpS?=
 =?utf-8?B?MDFyMlMvck5ndDZHRUIyWmh4YlNsMHFxeFg3MC8vNlNUTkJpdmg1MGhYeTJl?=
 =?utf-8?B?a1Ywcjc5Nm1GQ2ZQYTJ3OU05eGxnT2QvVDhSUDFhc2w2ZG9qaGo0bEtuVXdk?=
 =?utf-8?B?YmM0Qk1PdVZibGdmUFg2OVJTMEtkTktJRkVqYzF4blhwKzhzcFFrcUgyZUlB?=
 =?utf-8?B?Skd1dWwvNkZNQkhmZVVJVzFiVE4zL0VzQ2VVVVc2aFJFSDRlUXEzbUk2amZT?=
 =?utf-8?B?OFFrTkFwUGt2ZDNJcm9rYXNoUm56NEM2aVZTZ2hGSy9KSDNHYzdDSHpvNVYz?=
 =?utf-8?B?cE12bzhxZnlxV2xma01ZWFRWZEwrK2ZNcFZqNzVsVE80SlBSdTlZVkFkMXd0?=
 =?utf-8?B?Skt0WFB4UHYzbFZUbWEwcnpwT1NoMXBPS3dEMHFFSG1XOFJhTm5wb21xOTlW?=
 =?utf-8?B?cEM0QTB3aEl6cnpMMkhiZ0lXSFNKeDQ0LzBhVW5oRUFoN0xoQXpra1p6aExL?=
 =?utf-8?B?Q2EvM2FjbHdNTWxIc2MwYm0rMnNtaE0xYlZKZHY5cyt3bUg4b280ZFFFdXFs?=
 =?utf-8?B?WktMWVZ6Qm9kaHhDZHdnRGcxN1BXRnJQTFQ1UDloVXVaaEl6UFdpOHk1c01i?=
 =?utf-8?B?TXpDK1NIV21IWm81cHhKMUlCSG11dVM0bE1neDhMQ2d4V010OVAxN3FIRTFH?=
 =?utf-8?B?UlA3bXZjY1lEajNvU0E2L3BtQU1EbnVraFdrZC8vNHBRd1dzRlJzT0R6YWRY?=
 =?utf-8?B?WlVzQm9YQkd4Mkpxc3dNU0VnQVl6eE1sclZENU51UGdQa3M3R3o1SjU3R2hi?=
 =?utf-8?B?K0xLTFVNTVZ4ZmRNenVma0Jwb3BScjM3T2JDMEhvNUVnSmk0S1BhQVpHU1Mv?=
 =?utf-8?B?NTNqSitMMTY2WUxhbk8rUDdXbUJiM2RjL1RybG5sMFMxSjdvMHpmMGg1S2JF?=
 =?utf-8?B?d3ZnNzFKd0Z4UzczYWNKcUY4R09CODlyT1hyZXZzU3lMRWdFbjhielZaRDVN?=
 =?utf-8?B?M2Y4LzZiSXlZTDFpdjNVLzQ1RkFuSTVpcm0rOGRuWVNYRWs5bnY1SllGK1VJ?=
 =?utf-8?B?RGovUVZyV2RueHFHRm5SYU03ZVBpb0pVb21FMjVoU3VXWkZLdmhVSWZUc3pE?=
 =?utf-8?B?bDFndmNiSXRLb3YwRTZWdkpTSjlFVXNkWE9pUTZjYTF3TElINEczVFlhdWVE?=
 =?utf-8?B?bVNtVVN6ZlhKRkNMV3ZsaFNSMEFuWWl4QzZKSzBuRjkxUExKTHFzckd3bjRh?=
 =?utf-8?B?YWxnRWJBUlRYaGtlS1Q2ZndnZUtuZXk2TkN3VklLcTAyNEVSczNUVnQ2endl?=
 =?utf-8?B?aHJiZmxVVkNReU5ERGd2QnVFNUZDNnhQcEZsd0RVcjBDcSt0SDh1VzRkam5h?=
 =?utf-8?B?YlQyeERxUDVhd3NQRjhLYzRmWlF5UmJDYTEraUJtV21xL1RCMFFPWUNwR0JS?=
 =?utf-8?B?b0FzcUVPaEN3Z3pSd05VSXpFZS9acVoxTlI2dmZZN1BxR1c1TmZUMnl3Ynhs?=
 =?utf-8?B?RFlxeUlDejJGeGdNbHFCa0dUMVZpdllFRWROd29NVGxIekVuWGRqVU1LUEgw?=
 =?utf-8?B?NjBkVXdqNHhMeUxSUGIxTUlkRVo3S0lSbUVnTXd6c1dueGJXekpNTTI0Q0dI?=
 =?utf-8?B?ME92OXRiUnpFQkdkdGNCRGFnRXdkZFdKL040OHJYM0N4NGplS0FBbXBIbjRD?=
 =?utf-8?B?UHh2TzY5Q3dsWGlYNHdMZ1ZPSExOeXhhMjlqWUMxb0IzK1lQWkZMeFVyNlFt?=
 =?utf-8?B?aTFncURjQThZVnhKd0U5TkJmT3N5a3hacUlJMldBdU1CQ2NSUXJQZDFMWEtR?=
 =?utf-8?B?WHF3MFBLZ3JET05OSmNiK0hWZllyZjVWMWVyN0l5TXhETUUvZnJkQUpJM0Np?=
 =?utf-8?B?SVpTZUhxdE5UaWMvUnJiZkFSTzhLUHZJOXBTOXd0YUwweldwOFRxKzdZL0tH?=
 =?utf-8?B?SlpIanpTb2ErbFhab01ibEpxT2hLUklMOWZMZWxUYVZRV21ZR1FZOEVueC8v?=
 =?utf-8?B?Q1YwRnNlVEV6YTBzVVZES0xQSHJZTERubFdGd3BUTlEzVURSdWdobTRhZVN4?=
 =?utf-8?B?cVhTbHkrdEN0dVFIZG9McUkxcHJWNUo2L1hhbDJSSE45VnB2NUFKa1hYM3px?=
 =?utf-8?B?SHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2427f326-8292-4592-6652-08dc9f2ed707
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 09:17:50.4143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zS610ivRlHqSgThiORqi4tHsvQh3CwRzu7SKMRpRr8nt5nVrCVl+/yFNSTsxnbihtUNF82mImRFlZXGAjRhuAG51pewg6o6f9Iz6ZwVRUIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12263

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBKdWx5
IDgsIDIwMjQgMTA6MTIgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gcmVtb3RlcHJvYzogcmNh
cjogRml4IFBNIGltYmFsYW5jZSBpZiBSUE1fQUNUSVZFDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gTW9uLCBKdWwgOCwgMjAyNCBhdCAxMDozNuKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQo
KSByZXR1cm5zIDEgaWYgUlBNIGlzIGFjdGl2ZSwgaW4gdGhpcw0KPiA+IGNhc2UgaXQgd29uJ3Qg
Y2FsbCBhIHB1dC4gVGhpcyB3aWxsIHJlc3VsdCBpbiBQTSBpbWJhbGFuY2UgYXMgaXQgdHJlYXQN
Cj4gPiB0aGlzIGFzIGFuIGVycm9yIGFuZCBwcm9wYWdhdGUgdGhpcyB0byBjYWxsZXIgYW5kIHRo
ZSBjYWxsZXIgbmV2ZXINCj4gPiBjYWxscyBjb3JyZXNwb25kaW5nIHB1dCgpLiBGaXggdGhpcyBp
c3N1ZSBieSBjaGVja2luZyBlcnJvciBjb25kaXRpb24NCj4gPiBvbmx5Lg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoLCBidXQgdGhlIGNvZGUgZm9yIHBtX3J1bnRpbWVfcmVzdW1l
X2FuZF9nZXQoKSBzZWVtcyB0byBkaXNhZ3JlZT8NCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9pbmNsdWRlL2xpbnV4L3BtX3J1bnRpbWUuaCNMNDM2DQoN
Ck9vcHMuIE1pc3NlZCB0aGF0LiBTb3JyeSBmb3IgdGhlIG5vaXN5IHBhdGNoLg0KDQpDaGVlcnMs
DQpCaWp1DQo=


Return-Path: <linux-renesas-soc+bounces-12481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3EA1B9FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 17:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD865165DD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 16:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07EC15C120;
	Fri, 24 Jan 2025 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="w6WBKjrk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1881531EF;
	Fri, 24 Jan 2025 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737734832; cv=fail; b=mtaj9qQAFLlEDbQbzHb+i6nmR6/o43C9OCXNlqJ0z9rgp7ikpQyc6rkCsCmI+JC2ZXMmI0XL0+pngtQFJcCUQiUjlTAWloN8IsbM4vd9uRRR5ZYct7tUm3QxFRZLjLpIsC6HzWOIQXtO9ULrOiTY+opDE9Mc2llxdS3voi8mf0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737734832; c=relaxed/simple;
	bh=671ghp7YO73m/HBHSnl/3nPOCI646NI0ts5jpGyrc0o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AH+wls4iHGGE/DjK6dpBVwSBEsDaTN9/SpLtgOJsxoy8Cmg6Kp3NML5P1lPlFq/ysvwvRs03S0/U0CLTWNz5fzCdmhXZUCCIEc60zdPQ7lDi8lbE5L4LR1wOoTmsTK2QBSBxtfTpXH2cPClZOzqxlHR8v7JTYvKJduqqXH/EiyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=w6WBKjrk; arc=fail smtp.client-ip=52.101.228.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLPLY+eUuT2GeqkS7DGMqf6XQZ9xCEQOXkchJRhvwUr1uV3jw8UK/h7361+JmXnUpnzXmbmYEA06zQlM8z3vfzCWAUdgHZ8bo2SvrAG+yhjrNNs3Uu/kxv79gIMwgE2HIB6iOHIoX6vz7TDEWcC8AmyjNpeOX1v3OWd1unx+rPiBxgBV+ANufmSflq6O2h3RlCrlmZVhD4E/fhAAktV6o7doPzQp1tpQ/mztAQv4s5BbmbTTyiAnSfVz/o6XsRgptp4NVV+0sPG7rBaWT7tIxv5pBKooRCnNE4Mwk3IxbMb2LtFSMyAH+b+djg04cQsUlWobvt2qxng/4oR23+dimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=671ghp7YO73m/HBHSnl/3nPOCI646NI0ts5jpGyrc0o=;
 b=c64JtpvjVDCtnhzAkmORl1zXkFERFDxoBCyzkWcq8UhMUSUCUyruvFphhKmKkFFkMMzCZKkLmgkrFx8wIwegtferoHXbVjroi6hJIFbIlld/OztNcyG3BWxnr6ubDiULtJcO5o/a4IkU7Z2lUrCpKkioJKTZ9LoW+/GSIqqKO1LgC+mKk+Ub+v39GC89oLvaEzbICEO0IEFTOh52hfujKzKkwZrhtcGfaaWPfJAIcjjVuK76hxgDDtxlfZEdFbH8Q4rF6nSlUu2JS8JekQOvKmsY6+jLsbZLHqnIAgZk9gl9H0Ij0+VeQc+A6JzA+AGRrDgiu/+mRGGjvcqoT5qFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=671ghp7YO73m/HBHSnl/3nPOCI646NI0ts5jpGyrc0o=;
 b=w6WBKjrklVLplRnPWeIeKFxvw2E686VXQXHJTMoswycB7tKCtm5uH+ThixnU+Nssl4ekMcbMmfniCx2OUI0pmg5WuZHkxWLldW2RYvcha4ZOsNg7/FYIdXSvWbwqOtwZnTpoSEIS2T4+vcmj5LHAyvKJa5yV4vMo9p3FWWEeLrk=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TYVPR01MB11117.jpnprd01.prod.outlook.com (2603:1096:400:36b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Fri, 24 Jan
 2025 16:07:04 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 16:07:04 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>
Subject: RE: [PATCH v4 3/9] soc: renesas: rz-sysc: Move RZ/G3S SoC detection
 to the SYSC driver
Thread-Topic: [PATCH v4 3/9] soc: renesas: rz-sysc: Move RZ/G3S SoC detection
 to the SYSC driver
Thread-Index: AQHbbbkGDe8bF0Rr+kur3xzaO9y6z7Ml+jgAgAAdt6A=
Date: Fri, 24 Jan 2025 16:07:04 +0000
Message-ID:
 <OSBPR01MB2775EBD7E2A074F8F2CDE8BBFFE32@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
 <20250123170508.13578-4-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWECrWeBkUK6FpT_teJWmE-ifyHiv82OrNU31N9C36VHg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWECrWeBkUK6FpT_teJWmE-ifyHiv82OrNU31N9C36VHg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TYVPR01MB11117:EE_
x-ms-office365-filtering-correlation-id: 3e49b827-d8c6-47ae-7e0c-08dd3c9124e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OGR5OUhDMlpzVjlBOXVEWkJiTlVwdDBlYmZHNnRENGZkMXJQM2MyaHdabUEy?=
 =?utf-8?B?NEEyTXF3YXRVN09ScGlGL1JVcEZJMnNRMTNaY2F1Mis3cmUzWFlueGxLVEJ3?=
 =?utf-8?B?SFBhOWM0REJaZ0g1VmJpTmk4L011aVQyQnc0eHlGTE45Y0ZnV29mTnY3bkc5?=
 =?utf-8?B?Zzg2cmF4UjJLTytpd1N3eitUY1ZJTmF1NWRzU1J5a3F4NTBsWldSVDFvL1Mv?=
 =?utf-8?B?NTNRcHIvOWMwWHIxUUMyL3h6RmFHMzYzSnljZ0lMZmdwM0VnaWx6U1g2R0dE?=
 =?utf-8?B?TW5DaUpWMkdJYjkrd2JmWEgxQkJtcUY1V0VkcWRwdXFTVFFOVVdJeWVxYVlP?=
 =?utf-8?B?aXFISktlUnFZMDVEYnFPYmFLMVFXa1VaZ2lKcFRqWmJLeGE2RjFJekthYWo4?=
 =?utf-8?B?ZFloTXBaWVZob29aRVgwRldUQmNNNG8vN1ppWURYYmVvK3M3bVIraGc0UlVp?=
 =?utf-8?B?NzNRMW9RR1owcmdpLzhwUnFVdS9LNHNvNk9FeUJrbU1IZUZnemJQYnJmaVp3?=
 =?utf-8?B?anV1VkNJRGZsM0VsL3RNZEVJa05kUUNrZm55VlpaOW83K2JHejRuYlBFQldS?=
 =?utf-8?B?RFUwNTdwbWdTeEsveDY1aFMrTTR5Z290cTlEbGlqajJaWVNUTW91OXNpWjY5?=
 =?utf-8?B?ZWp1bG5tRGxMS24yU3AvZzhyeVNuVWhQUDF3OFR1Wkd6aTU5Z280eHQxdm9a?=
 =?utf-8?B?RXMwOHZ1MGhmOFByWjJNcXlERUFkOWFZRVpjL3FoczF2c1FYaU9tU1VicXlo?=
 =?utf-8?B?Y253ZDlmekVjUllScHArYjJ3cGluSEFycVh2UDlDcHo0YkNUSFk3TllydG9j?=
 =?utf-8?B?eU0vY0E3bmRBV0tXSlpVdmczb2xpSXkvK0xGM2tUWmhTVy9jK3JTa3l1TXIz?=
 =?utf-8?B?cjByNkVhdXNXdEdmQXc0b0xMYzZzWVpiKzBLcVZVZUxlSERYeGRycWVtaEhv?=
 =?utf-8?B?M0oyZm80RXhVMjVjWmhNc2YzVDc4VlhDT3QrUEFnOTlsVmgzTnpPOWN4UnBO?=
 =?utf-8?B?ZXRzNnRpaTNtWlUrSlcwbnRuWnl3R0lPR0tJVGRMY08vd3l2Z0ZGV0JLTlFH?=
 =?utf-8?B?TVFLQUxlUkx1Y3Jia1lpMXJEZzRyYnIzWHY5VVBuTnpRc3JLeU9UMWcwcFNo?=
 =?utf-8?B?RDBOQ0FNZDVWSGtoVXUvT2FRYm9vZHorRWxnVkZXaDRUZk91M2VlaVlrSkh4?=
 =?utf-8?B?UENKTmpVaGJKemRvNTFYVnF6bTNTRHhPMTFWY2R0cjdmTDVlNzlXb1Roa0Vp?=
 =?utf-8?B?b0RZa1AzR1hxcXJMTkRDNEZsTkpqSiswMDNHYXdDUHFaTFh6eWJDTkpjbzlx?=
 =?utf-8?B?eGV2SGx5emk3V1hNcWQyZ1pFRzFyNkxBY3VqNk53TGdYYTQ3K1FSREhNZTg5?=
 =?utf-8?B?em8zbXcrZko1YndJbXdZZVFhdDlvamFzTThSOVFza08zT0c0Uks0YUdpQWh0?=
 =?utf-8?B?TXZKbyt6bEFEcU9oUE1OMEZNd29mZCtvRUU0aGhMbzN4VHUwVFFhY1JZRDhQ?=
 =?utf-8?B?WFZSWmdjckN3Vzlkb2QzMnpyV0gxYWZxVjlDTjE0dzkvY2xldUM5NGdXd1F1?=
 =?utf-8?B?bWlWR2dYM1lBRGJySjdSM2JtT29DZllha3hTdnlLL3JjRXBMekNyajFMUUps?=
 =?utf-8?B?c1ZNYzFOMjEyV1VKdEwzUWZjMmF0cktTMHpKT0hKTHpCY3ZTeE95L3pHdUlV?=
 =?utf-8?B?WTVoeW42UlNSbEdQcitCQlIwcEJ1OHRNTWVvVGpxM3BCTjlERGRlRWw2Zm8w?=
 =?utf-8?B?akY2cFVmL1pxeWFvWldYV1JkWjNVVUhDS2tkVjNPSHZCQlRmOUVmbnFWUzBM?=
 =?utf-8?B?MHh5VWhlNi9jZmJDbDErdllZZ0RmMEl1QkNaTm0wSkltRnNyK2s3YXpBQVgv?=
 =?utf-8?B?WHBWdlZUSjdYb2xSd29FQmMxZCtQRDRzbFM4SnhEREZEaVoxWlVna1RUWTFm?=
 =?utf-8?Q?IZ+llMcwaxeeddgOrZIt0zbj/ycuLiVd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0F1bFN4VkdoWmJYUGhJVlY1dlYxZDhwTG5jblF3bWdNTGtGcStEUDQzTFJt?=
 =?utf-8?B?dnhhaTNDQTBzSjNPb2dwQmg1ZStTN2dyRTBBcXJvZVgvUW94NGdiZndBNDRo?=
 =?utf-8?B?Qm5Qdzk4UXN6aW9FOVBRWmVmWVlMaGFWdUQwMUxxT29sd1FCWjc1eFFRVlhK?=
 =?utf-8?B?RVBxdUdYc0xrakpyVmVZaWNWWEhJczdUK0R1Z05nVGxFNkNhTXVvRnFDYTdZ?=
 =?utf-8?B?ekg0TklPVE9pdWNYclRlc1pSU3ZmOEtyZGhuNEt0UGhqdVovMHRGdGExUmxV?=
 =?utf-8?B?R1g3eWFzanFnT1QrdGpKbVNHanFIcVFtQzZOajArc1l3SjZ6NXVlM2ppSTgw?=
 =?utf-8?B?ZmJrMDQvcjExRHlrNkExTE5OaXQxeHFaZHIvbTh5cE94cm5QalZFUEx4ZUhJ?=
 =?utf-8?B?eWhDMEhwYzNGdElSaWY4WDRsci9CQ3BwUm1oYVBiN045eWdNa1M2a3l0cjRy?=
 =?utf-8?B?TVJEZ2dJZU9tenJuV0JwZFhsTzRLZmwrLzRDb1RWQWJkVDhLd2EvdTNYbG4x?=
 =?utf-8?B?cDJnS1hpT0dNNmlyMHRDMFA5NXlDUkZGNTFvaEQ0OURaNGI4L3kra21iUUsx?=
 =?utf-8?B?cFdNdmtZdCtjKzVST2dCdjFjeGxocnJZM3NMd2d5UG96RVd5MitsNzFva3Yr?=
 =?utf-8?B?WkRaWnp6Njh1Ky9aNWFraXJ5dVh3MXZvNjhkNGYzeitmQ1hMa2lPOCtDZHpL?=
 =?utf-8?B?djNRMDVHS290eXkzSjA5bi94SkJiWjlXMnV3SE1haHVhTUlsYkI0aGM4WUJQ?=
 =?utf-8?B?cEF2RGg3Q1o2TEJTMmtsTnJwNzN0eE54Ujg4b0lWSjhWdXNWZXU5MEovUnNJ?=
 =?utf-8?B?bVUxMVRDY2lDdXJlQnpRVk80bUV4NzBMV2QxYnBFaytuWDB2V0FwK3NrY1Iy?=
 =?utf-8?B?N0I0ZkhhbjZMLzNDR1A1b09LYjhQaXJkM2ZkYkFPRGV5QkhuVUl6VW5IMDJC?=
 =?utf-8?B?QndZaW1ZaVdQZVBQN3Rlc2w1RWoyTkhSMmd3RHlucHFGS3RZQ01ncXhFK3dp?=
 =?utf-8?B?ZkxKb01vU1BRdnhjR0xSRGNndE84cm4xNTZWR0xYaS9xZ1l6NXpDYnF5K2Ew?=
 =?utf-8?B?K2pRR09mN1dQMTJwNkNmSnkrbFBtQ1huMjAyT0ZWWUVyK3lWdDdhd2xLWnV5?=
 =?utf-8?B?Ym1aZGpiREd3Sm1pRmorY1dJaFZ6Um91OW42UzJzam5BeklmVEsyVUtYRDls?=
 =?utf-8?B?K2hlb0NBUUl2OURjSjVDU1JXV2lYdzRLSmRmV2lydFlURkIxQnRxM3lxVXk1?=
 =?utf-8?B?TmJkd1NsTU1wbVlySDJBbGhBRGFjY0dEL1NvMitTOUZ3eXJmMU1kWDJxWWR4?=
 =?utf-8?B?UzdoQUg0M0QwNzl1TGhYZVdYZ0ppaUVoL0VTL1pEWDBUTmltZGJwQVUzOUlT?=
 =?utf-8?B?RTJMQ28xQStVTkZNT2lDY0RBQnl6aUkvUXRXdmVSYTRDVjBsajN6T3h0OVhq?=
 =?utf-8?B?S0hnZnpQc0JVcGZISXRuc1dRbGQ3aVFYaDhnNi9COEkzbWZmSlJRdDcwWHQ1?=
 =?utf-8?B?NGpZS0lmcTV6T296NFcyZHJYM1pia0xjQmR6VWptL0hDT1BJWkNJVTZUTHd2?=
 =?utf-8?B?S2NtUTVjbGhUNXJ1RGk1MzhSQ3pNSzhXVkZSVUk4eEpodHhPT1Z3MmtoS0Ur?=
 =?utf-8?B?MDkycTFNUXQxYWdsSVBiV3p0emV3OGowV2tYVHl3L3Y5QmQ3QXBUUkJKRVp4?=
 =?utf-8?B?MU9OR3JPYWROQ1YrQlhha3k2bnVVQVdUaVd4WVBseHhUR1hiYzJHZXZaRWEx?=
 =?utf-8?B?bThyb1hOMjVoMXEwcG1qRCtLNEl1MVFXZHFoREFsUTVOUndOTnJBVXpVVXgr?=
 =?utf-8?B?ekg2TEJLcUVkV0RhQVFuWVI2aHJVVld2TzExZTdIWjBSVlhDUlIreFJaYlo4?=
 =?utf-8?B?SDhzMllIaE0xY1VhVGJkZjBxaGcwTUxXbTM5TjJDTHhlMjJmQ213UzdJdHJ1?=
 =?utf-8?B?STgxaXhCQzc5b1RPci9KekZOSEIwZEY2N3JIaXgwVyt0eTV2OEdPb2IwdStK?=
 =?utf-8?B?Zld0eE5zLzB3YlliTy9SVWdEYkthYmhZQmVqWjk3R0dzWUppbm5PcmQrbmV5?=
 =?utf-8?B?UXFXTG1VUHNjeFBkUjYrM21zK2JNWlhUTG96eWxqOUtIR1pCVTJmMzhJM2po?=
 =?utf-8?B?RkVSS0lNamVpaTFvYldvR0czclZZNm16MW5SYjQ5WDgzbVBmb2xkUThOL0Zo?=
 =?utf-8?B?dlE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e49b827-d8c6-47ae-7e0c-08dd3c9124e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 16:07:04.3199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0MJxTyj0xwjqgLqTnbpMvTEAJ5788tL5jJgVjDJJZ98GKLatc3j7S9BIPriiC03+mf5g6njdZ6u2UHqsgcYa+nAkZH/+uIbXVOK09py58mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11117

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI0LCAy
MDI1IDM6MTggUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAzLzldIHNvYzogcmVuZXNhczog
cnotc3lzYzogTW92ZSBSWi9HM1MgU29DDQo+IGRldGVjdGlvbiB0byB0aGUgU1lTQyBkcml2ZXIN
Cj4gDQo+IEhpIEpvaG4sDQo+IA0KDQpIaSBHZWVydCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmll
dy4NCg0KPiBPbiBUaHUsIEphbiAyMywgMjAyNSBhdCA2OjA14oCvUE0gSm9obiBNYWRpZXUNCj4g
PGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBDbGF1ZGl1
IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBOb3cg
dGhhdCB3ZSBoYXZlIFNvQyBkZXRlY3Rpb24gaW4gdGhlIFJaIFNZU0MgZHJpdmVyLCBtb3ZlIHRo
ZSBSWi9HM1MNCj4gPiBTb0MgZGV0ZWN0aW9uIHRvIGl0LiBUaGUgU1lTQyBwcm92aWRlcyBTb0Mg
SUQgaW4gaXRzIG93biByZWdpc3RlcnMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1
IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiArI2RlZmluZSBTWVNfTFNJX0RFVklEX1NQ
RUNJRklDIEdFTk1BU0soMjcsIDApDQo+ID4gKyNkZWZpbmUgU1lTX01BWF9SRUcgICAgICAgICAg
ICAweGUyMA0KPiANCj4gVW51c2VkLg0KDQpXaWxsIGJlIHJlbW92ZWQgaW4gdjUuDQoNCj4gDQo+
ID4gKw0KPiANCj4gVGhlIHJlc3QgTEdUTSwgc28gd2l0aCB0aGUgYWJvdmUgZml4ZWQ6DQo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0K
PiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KUmVnYXJkcywNCkpvaG4NCg==


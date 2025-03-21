Return-Path: <linux-renesas-soc+bounces-14710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84530A6BCD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 15:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D521D1890359
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 14:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C519B7082D;
	Fri, 21 Mar 2025 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bL3/au2h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7E978F30;
	Fri, 21 Mar 2025 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566896; cv=fail; b=V9+pqXgylzCOwI03A/5cyM0WffY/KHqb09IzbnpVMzEkcOjDu5dK8NTEMngW0D2382jI22DZbXLVQxiE3QzirYxyMGvgnIFarQSt7OPTc9UQZ0nF0bb5lVWB9nFBZyZlaBggE8gHJC0IxUchXGOMjFSxWlBeIsw+KtFGR1U8rCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566896; c=relaxed/simple;
	bh=RCaQITZZzO5wdDXcAJ/XUeYX5Ndohq5R8vIbA/cVip0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MVaI5nqqaI4kmhRBi3xXoZz6PCVj2U67X/xSBsrrgJQArsm3XHHGg4KcJRx4mfTE9KEapAuc4heZ53VXKzvPhkiy0qqVdHMdKeiHH1lRZHgYlfXa8XbHDj4O6tteDMl+452QMRe5zbXHuO6O/G2xYKqxi/qfNW7jQa+WA64u65o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bL3/au2h; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKV0ybTkBD1LpNCLBTIn27swMtwlJC7m8lQqOm7fzHJSLGlOGsuCsRF+LcUQyE8bUb1IIL8WUvZviCepjGbyoNXCKzn9CHWrriThCuf+jxLDDNPA9gLcOwwjwpdRxsmbvrzPtqZCyUA5grkY8gnT8wbW2+0NEdVVqH2nxqVDq/lAqjQziN28vGUiR8r83vZJkw5lMw4Cl+aGtSDGxDQHstpYKjvyp+CXe7vCZUL08kaU9y85wl09cqNLcJ9XXk/66RMR4s0o6YkbMAFh51W+wB8jOvnGdWKGQcYiipHW1EfOZlEjpRHEXdPFI1ON4XAUJRiWUiAqdzlQuaOcj6T/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCaQITZZzO5wdDXcAJ/XUeYX5Ndohq5R8vIbA/cVip0=;
 b=iXxqOEjLz9XbhRUppkacVCtEhV9b3qX0uQa8aKn349F/o/w3avnH3DY64q2KOt3ZlOWaOiPqzqQZTX/M//GjcI86WSP2oo5lV50DcC0rYt4uQfGJfUwL2CzyneQe69c2Xg7/7+cbL85XEiTeBEkAHZx95i+c6HFMpFHXCWC5ekJ2F2KOL4M4rJEfbeVcqxAS1VLtqRJrTzFJD+H3CggpII3G1GAEv6dRPcjmJEpjHmJKDUmScL3rqtAPVxPQiAQtKYJ/KonU6AVeGduzDIQS+p959ipRVq9i8UgvMhPIPAssBFqnSDKKEdth+pljagUoKBxWCtB+2AgCx4uylKEvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCaQITZZzO5wdDXcAJ/XUeYX5Ndohq5R8vIbA/cVip0=;
 b=bL3/au2hV8ossynFpTxMWv2IzlwylVVDToGwelBinMDjp5IYxFvDRzRbpsbu7qz12+pXPb/7VZCG56lLFKnTEmqhsCFa1Ozuklo9vjGKXbF+RrXeky4lyIBXIi9N4fHwslZWxDIwyj/12tul99FXcFXFPO7IwdrsLBCNYY63dvM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15541.jpnprd01.prod.outlook.com (2603:1096:405:270::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 14:21:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 14:21:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Topic: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Index:
 AQHbjCwSQtFnS5HRQ0O4YyzU/N2JT7NlMPsAgAC1N4CAANHqAIAAiUfQgAsHYUCACmTiAIAAsbuw
Date: Fri, 21 Mar 2025 14:21:24 +0000
Message-ID:
 <TY3PR01MB113461FA9BBF036D285AAC8F386DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
 <20250303110433.76576-2-biju.das.jz@bp.renesas.com>
 <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org>
 <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <98c8c1eab30fc333974bd1ad88791356.sboyd@kernel.org>
 <TY3PR01MB113469E04E10E3D14FB3F69F186D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <983e0e616d62f236dcbc3eecbeab5ab4.sboyd@kernel.org>
In-Reply-To: <983e0e616d62f236dcbc3eecbeab5ab4.sboyd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15541:EE_
x-ms-office365-filtering-correlation-id: 87f838f8-c553-48e1-091a-08dd6883a940
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlpQY3JUZXd0MzBZelcrVHhkMHZpYzQrY25IVkpFVjc1QlNONzlINFJmWE9m?=
 =?utf-8?B?cWVkSFJtTUxINzlDcnNVemY4TWsrQnJzVy9udXh4UXlJYy9CZXZpcVBORzMr?=
 =?utf-8?B?Rm5zZEEzN0NZbVdwVzJpV01EMHhtbUZWUXoybGkzT2l4Z29uUmo2NDRXUmlF?=
 =?utf-8?B?SXVla05WOXpleWJSQktwWDZqbk56dXVlWkgxQWVrSW9VNFEvSklleTdVeHh4?=
 =?utf-8?B?dDlyaWtUdmg2NitZUjZEem1IOGhEa1dLcDc4SWFyelBGNEUybExvN2lLMXRZ?=
 =?utf-8?B?ZHJVK1hXL0VOYXlBdVVIUWJMdHBiNmtNT2FZUGo2NWVCbVNYTHJKM1JWa1M1?=
 =?utf-8?B?bjlGWWtGUlJkMWhzN0VGbUNNOVlmWGJRKzltMHlISEh6Sm45M2xUU2xRdDNq?=
 =?utf-8?B?RFllY3AvOE5WaXlvSmdsSnRSa1FreGE1SkdaNG5ZeEdHSGwzT2UxN2pwdmtL?=
 =?utf-8?B?VW9SL2tBcEs5cGMzcjZ5WVV2cnA0WTZ6Tkp1MXNnejNDb3hFdWVnUDlWdUlx?=
 =?utf-8?B?Vk9PUm0yeHRVMHM4ejVCVEhzMjQrc0FPTVBEMkMvQTIyNEZ1azFwUWZNSk9E?=
 =?utf-8?B?RFBpUHZPa05QWUswQlhlaHozVlYrNkd3UnhKWUNHNWdKTFRydFNBM2NNMDVL?=
 =?utf-8?B?UVhZbUJOc2JrLzFNc0ZCaTlWRU5sSnlGYWI2cENWbFdka3k1dTBxaVMybmR4?=
 =?utf-8?B?eVNLdDhnYWhrY2RDeGYrNUw3bE95QlROQmZWMHZ3TDNPZkl5V2YvV2pMcGlC?=
 =?utf-8?B?Z1lIWnJlRHdJVDZ6TnRjVi8yWmtrZi9QbS9YbHBmbkdrbFJOKzd6WVRKNS9o?=
 =?utf-8?B?c2hycVE3YnI4VU9mOFVnaVNmeXoxSTJwTXRtRVRzWWN0ZGRBdHQ5NzN1L3Aw?=
 =?utf-8?B?dkxZR1gyWlZubzFHUkRsZ2tSdXlyaFVGZXJxVG1DWW9iZUhkdTRmdW5ZUkNP?=
 =?utf-8?B?YlhPOVBNdHJrL2lDWm5tUHpRUG5oRzJ3QnhkSUxsRURhc1RTeDltQXdBK1Uv?=
 =?utf-8?B?WDNBdlZTMUVtd0s4RDBmeW9VeDQ1U0ZGWXFleldDU0g0M1U4TlpGRmpla29N?=
 =?utf-8?B?TVgvVDM5V1kxQUZ6bkpIWUJlQ2tUTkVoeWp3UlFLd0kzcXZoTnl4dXNNd2x1?=
 =?utf-8?B?aEcyeTFPdEwzMHpPR0lhN1l4UHRYUUk4eGVHSTZ4ckc3T3ZaSUxxWXUyMEc1?=
 =?utf-8?B?Q1pyWDlNamlXNW5CL2Q0WFNjMHg5UUxTbmFETUwvb0dhUWd6eFM4bGpmK2lp?=
 =?utf-8?B?cjVxR2Erb2RVSkljeThDcVdYU040Q2d1TVV4TTZpV1JvYW80RlNxZjJ2Z2JE?=
 =?utf-8?B?eURTS0VuNVNxVUoxRy9rZE82UTY3Q1ZOdXpaVSt4dGtXcTNtT0NNdmRVUFNT?=
 =?utf-8?B?RWdPVmxDNTlPaTlBZGJtdlljc2U5VVpqRFI2WVZBeE1IODNITDJNdWxYMnBt?=
 =?utf-8?B?M2VkL21nL3FOTTFnQXVtVGdNY2RHdGFWM1RPUkpQZ2NvT0lXOFZwR0VMWEpa?=
 =?utf-8?B?NkpRUXRsZVdPdFVNS0lxR1g3RDVnUjh1dFVteGROamJEZ3lDMEp3Y3BZMngv?=
 =?utf-8?B?c1RqRW5aTDExT2VKOHJiOHhud1h6WTlKUzZEZzF5VEx4SXhRekVlbnhvYnZj?=
 =?utf-8?B?SSs4SzFTTXlOWm9pMW1hQWdkejdoR0FSRXBOODJEZjU2eVpCYiszdHQvdk1w?=
 =?utf-8?B?OC94TjNoUy92Mk1OYVY5UTR6RWNnMCtKNXFFU21yOFhsKzdWSS9mSlM5RzFp?=
 =?utf-8?B?bUcyTDRCMEZIb1FnUDM4REtOcUI5NjFZbWxzUFppWXBrUWlkV1RkQlJ6OU1Y?=
 =?utf-8?B?VE1ORDNGNm92bFlPdUpQSGc5R0RhWkpyMnh5WE5YQmk0eG9EYUh0SVBaR0xG?=
 =?utf-8?B?L1A2UjlKQXlmalZrRDlCU2xLZjVOTDlIQzBYQmdpUytpTG1jMHh5aWg2Q2Zu?=
 =?utf-8?Q?mkAp443/qIwZjogj0ysHZV5fxJf9LT0+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnBER3l1MGtMdnh0cDllRFAyWXMyK01peUdPKy9RM2U5aW95ZVlySXJWOUJj?=
 =?utf-8?B?ZDhaZWtFRDVEbkhxRklJc05iMW5WbHFTaXhKOWtFdyt2TDlibWNGUU45WnJ6?=
 =?utf-8?B?em5PSzliL1k2OXVlclpUeEd4OTBFZXBrSVJqZ0pETUJsOGdkbm1Mb0NiaS9h?=
 =?utf-8?B?WGM0d3FkdGFHVlpBM1lNWUtiSEZVSFZqL1Jpb3dGWS9YNnRvODIrMllrWk5V?=
 =?utf-8?B?WnlSVGtKQWgvTlVTN0RJMlUvVDByMk9hMVlRVjhOd0Nhc2dXSkV3eFQvTFp5?=
 =?utf-8?B?WUdqTVhmL0FWaWNYZDVDc2dUMjJmZWp6NXp2N0l4c1RhcC9BNHlsNUJEeEtW?=
 =?utf-8?B?R2NBalZkNWFza3BQcUxKUEVmM3ZvcWVScFFGVkNpZkhQQitXQlZsZ0pueHB4?=
 =?utf-8?B?Q3EyL3V4WkhvNG5Wd3pHYmZYUzk2c3JpeXBKSDlPUTRIeWNGbjA3TlhTeTdK?=
 =?utf-8?B?dUpoK1llQkNrVTcyU3VIRlcyRkpyb25wbzhjWndVRUxDWlpWR0tTNmpaT3BK?=
 =?utf-8?B?Wll5Z0JBUWdXb01USStOdE9XRXJzL2ZvdzM2M2tjTU5zT3lEMjBFZGNhMUhn?=
 =?utf-8?B?THI1SklSVHIrbVp6YkJIa2dUUlEzakxGb3NKeHpFNm9IT1FWMUtTTzJudmxn?=
 =?utf-8?B?cTRTTGFVOHFCcGF1ZlVoakpDRlhhbTM5aUc0ZHlXVjRvMFZMN04yR1MxcmZX?=
 =?utf-8?B?bHhsTnhCUFJ5bkhkTVZiYVZySE11QU02eFNRTFpIaXZFekNRT0M4cWN0ZzBx?=
 =?utf-8?B?VFFTVDhEWVZuVG5uZE9zMFpNcExUdHRXSUtzUmozV1hUbVdhNzVMK0F5cXVv?=
 =?utf-8?B?bmFhNTZlVEJoZC8xblVIMnR6MDJDajhORTNwRGlVWmhnUU9YS1ZnZXBHdDE2?=
 =?utf-8?B?WGdLMDJDc2RsNU9FRHRXNnlxUEtXckJwc0hxS3ZLMEkwL2ljbUYwcFJFMlFi?=
 =?utf-8?B?a05ESWNraFE1cCt0VlpEbUFqVForWVRQdVNuMXY4MVF3c0dxZmk4SUpwVFNH?=
 =?utf-8?B?dlNnRFFGby9CODloWjg0OGZFdS9yT0tIQkRTbjBUVU42dXpVT00vT2xRdUxv?=
 =?utf-8?B?cnNtd0UwOENFbEQxRDFUSFEwMitvbkdlUXpqSWdLcDNpbVpINkFySXlmSlk0?=
 =?utf-8?B?MDlwNFNZQkVxV1hxZXFpRHJnR0tWV1Z2R0M4TEd4VVFHT3p3bjUzU3BQZXZo?=
 =?utf-8?B?R3VvK1lJcTFhMlNySTRyUUR4MTJrLzNkZUs5WWFTK0NsMWE0aGt0OThTS3k3?=
 =?utf-8?B?ckpwZ0JHM3oyOEJHcW44SWVzMWFIZ3JsNTlCRFVNdGx4WXlWVzFqT3hsVDlR?=
 =?utf-8?B?K3lJbC8vNFB0YU51cnFUZTlIWEo3akcrTkZXUVVrRzhSaXdBenNUak4yRFpJ?=
 =?utf-8?B?c2pyeUlXNDN5WnByc2NtclIxT3ZEUFplS3pHVEhadzJKMlk5VkpVVWJzb3Uz?=
 =?utf-8?B?Szg1OUs1cFZLSGY1ZHRTQXFmTTYwempneU1ZbCsyYkFVUmx5V0w0Q0tBNkRH?=
 =?utf-8?B?b3BjTWp2YUw0eEZXQlh1ekZBSVVHa0NxbEN3dkFqSEtGNm81NXg4VWpYZC85?=
 =?utf-8?B?VFJwU0JiTFl6bFhCMHY5RGF3TFd5OE9ONDN5dlRXNk1xRDRTN3hCYnFMZ3d6?=
 =?utf-8?B?WDNUKzIxd3g5WjBvQ2dLcTU1VXBmNGNmMTRwREhkMnp3S1dJVFBaQndoNmVB?=
 =?utf-8?B?cmZUWE1BRzJSMEV4REdkL1p4S2lMbHpvTlRPT2lwTFJhZXkrTkl1Y0lSc1M3?=
 =?utf-8?B?T1VNK3RuSkVKbXBEV0kwUGRack5jT1ZrdFVWalgrY09TNHVBdFFpT0xZVnhy?=
 =?utf-8?B?UFlNM21zVDNGTmFvTFY2S3FEVmZLbzVkNVAzNXRUMEVYRkxPdXpZbGxGNmxv?=
 =?utf-8?B?THVkQ09wSFNsM1BITjl1bXcyZGF2L1czK1Vhb0dvNjJqMzJDdi9qQnkxWHZt?=
 =?utf-8?B?R21sbEhoR1pFckpOcjlSWW1KY05ROGZNTk5FNzYzd2o4a3FvVkFrZDRLd3Jo?=
 =?utf-8?B?Wm45ZFNCNm1LVTE0bHFjTVdzUTg1SnIzc3lLM2FSNUtXSmg5WUhlRnA0TTFZ?=
 =?utf-8?B?Z2hVdW1NakxONHRBRjVLWU03SVBRaEpaMmRKRk9GdU1PRWJJRkVwSG5RZnhn?=
 =?utf-8?B?U0thU281aXRqUlowYm9aMTh2UitaZHN0bVhsRm16SzlEMy94cHRobEJObWJn?=
 =?utf-8?B?elE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f838f8-c553-48e1-091a-08dd6883a940
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 14:21:24.5615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmPtdYULYw1PSiiEba0wlca1kWAQfHDzqqKt16vRu3c+OYxrVPBAjMxVbwx8JoZzUIlrQFuLtKmtsQ4Q1+CVuLWaSB3KT3F/dhcvs8APDpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15541

SGkgU3RlcGhlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwIE1hcmNoIDIwMjUgMjE6NTcN
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCAxLzRdIGNsazogcmVuZXNhczogcnp2MmgtY3BnOiBBZGQg
c3VwcG9ydCBmb3IgY291cGxlZCBjbG9jaw0KPiANCj4gUXVvdGluZyBCaWp1IERhcyAoMjAyNS0w
My0xNCAwMDoxODozMykNCj4gPiBIaSBTdGVwaGVuLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQmlqdSBEYXMNCj4gPiA+IFNlbnQ6IDA3IE1hcmNo
IDIwMjUgMDc6MDINCj4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMS80XSBjbGs6IHJlbmVzYXM6
IHJ6djJoLWNwZzogQWRkIHN1cHBvcnQgZm9yDQo+ID4gPiBjb3VwbGVkIGNsb2NrDQo+ID4gPg0K
PiA+ID4gSGkgU3RlcGhlbiwNCj4gPiA+DQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gPiA+IEZyb206IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4NCj4gPiA+
ID4gU2VudDogMDYgTWFyY2ggMjAyNSAyMjozNw0KPiA+ID4gPiBTdWJqZWN0OiBSRTogW1BBVENI
IDEvNF0gY2xrOiByZW5lc2FzOiByenYyaC1jcGc6IEFkZCBzdXBwb3J0IGZvcg0KPiA+ID4gPiBj
b3VwbGVkIGNsb2NrDQo+ID4gPiA+DQo+ID4gPiA+IFF1b3RpbmcgQmlqdSBEYXMgKDIwMjUtMDMt
MDYgMDI6MTA6NTApDQo+ID4gPiA+ID4gPiBGcm9tOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+IFF1b3RpbmcgQmlqdSBEYXMNCj4gPiA+ID4gPiA+ICgyMDI1LTAzLTAzDQo+ID4gPiA+
ID4gPiAwMzowNDoxOSkNCj4gPiA+ID4gPiA+ID4gVGhlIHNwaSBhbmQgc3BpeDIgY2xrIHNoYXJl
IHNhbWUgYml0IGZvciBjbG9jayBnYXRpbmcuIEFkZA0KPiA+ID4gPiA+ID4gPiBzdXBwb3J0IGZv
ciBjb3VwbGVkIGNsb2NrIHdpdGggY2hlY2tpbmcgdGhlIG1vbml0b3IgYml0IGZvciBib3RoIHRo
ZSBjbG9ja3MuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQ291bGQgeW91IGFkZCBhbiBpbnRl
cm1lZGlhdGUgcGFyZW50IGNsayBvZiBib3RoIHNwaSBhbmQgc3BpeDINCj4gPiA+ID4gPiA+IHRo
YXQgb25seSBoYW5kbGVzIHRoZSBlbmFibGUgYml0IGZvciBjbG9jayBnYXRpbmc/IFRoZW4gdGhl
DQo+ID4gPiA+ID4gPiBlbmFibGUgY291bnQgaGFuZGxpbmcgd291bGQgYmUgaW4gdGhlIGNvcmUN
Cj4gPiA+ID4gY2xrIGNvZGUuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGUgcGFyZW50IGNsb2Nr
IHJhdGUgb2Ygc3BpIGFuZCBzcGl4MiBhcmUgZGlmZmVyZW50LiBJZiB3ZSB1c2UNCj4gPiA+ID4g
PiBhbiBpbnRlcm1lZGlhdGUgcGFyZW50IGNsaywgV2hhdCBjbGsgcmF0ZSB0aGUgcGFyZW50IHdp
bGwgdXNlPz8NCj4gPiA+ID4NCj4gPiA+ID4gQWxyaWdodCwgZ290IGl0LiBEb2VzIHRoZSBjb25z
dW1lciBjYXJlIGFib3V0IHRoZSBkaWZmZXJlbmNlDQo+ID4gPiA+IGJldHdlZW4gdGhlIHR3byBj
bGtzIGZvciB0aGUgZ2F0aW5nDQo+ID4gPiBwYXJ0Pw0KPiA+ID4NCj4gPiA+IEFsdGhvdWdoIGdh
dGluZyBiaXQgaXMgc2FtZSwgZm9yIHNvbWUgcmVhc29uIHRoZWlyIG1vbml0b3IgYml0IGlzDQo+
ID4gPiBkaWZmZXJlbnQuIFNvLCB0byBjb25maXJtIGNsayBvbiBzdGF0dXMgd2UgbmVlZCB0byBj
aGVjayByZXNwZWN0aXZlDQo+ID4gPiBtb25pdG9yIGJpdHMuIFBhcmFsbGVsbHksIEkgd2lsbCBj
aGVjayB3aXRoIGhhcmR3YXJlIHRlYW0sIGRvZXMgaXQgbmVlZCB0byBtb25pdG9yIGJvdGggdGhl
c2UNCj4gYml0cz8/DQo+ID4NCj4gPiBBY2NvcmRpbmcgdG8gaGFyZHdhcmUgdGVhbSwgdGhlIHNw
aXgyIGNsb2NrIGlzIHR3aWNlIHRoZSBmcmVxdWVuY3kgb2YNCj4gPiB0aGUgc3BpIGNsb2NrLCBh
bmQgdGhlIGNsb2NrIE9OL09GRiBwZXJpb2QgZGlzcGxheWVkIGZvciBlYWNoIGJpdCBpbiB0aGUg
bW9uaXRvciByZWdpc3RlciB2YXJpZXMNCj4gc2xpZ2h0bHkgZHVlIHRvIHRoZSBkaWZmZXJlbmNl
IGluIGZyZXF1ZW5jeS4NCj4gPg0KPiA+IFNvIHRvIGNoZWNrIHRoZSBzdGF0dXMgYWZ0ZXIgY2hh
bmdpbmcgdGhlIGNsb2NrIE9OL09GRiByZWdpc3Rlcg0KPiA+IHNldHRpbmcsIHBsZWFzZSBjaGVj
ayB0aGUgdHdvIG1vbml0b3IgcmVnaXN0ZXIgYml0cyB0b2dldGhlcg0KPiA+DQo+IA0KPiBUaGF0
IGFuc3dlcnMgdGhlIGhhcmR3YXJlIHNpZGUgb2YgdGhlIHF1ZXN0aW9uLiBXaHkgZG9lcyBzb2Z0
d2FyZSBuZWVkIHRvIGNhcmUgdGhhdCB0aGV5J3JlIHR3bw0KPiBkaWZmZXJlbnQgdGhpbmdzIHZz
LiBvbmUgY2xrPw0KDQpGcm9tIHNvZnR3YXJlIHBvaW50LCBDb25zdW1lciBkcml2ZXIgYm90aGVy
IG9ubHkgYWJvdXQgc3BpX2Nsay4NCg0KU28sIHRyZWF0aW5nIGFzIG9uZSBjbGsoc3BpX2Nsaykg
c2hvdWxkIGJlIE9LIGFuZCB3ZSBzaG91bGQgZHJvcA0KaGFuZGxpbmcgc3BpX3gyIG1vZHVsZSBj
bGsgaW4gdGhlIGNsayBkcml2ZXIgaW5zdGVhZCB0cmVhdCB0aGlzIGFzIGFuIGludGVybmFsIGNs
b2NrDQooIi5zcGlfY2xrX3gyIik/Pw0KDQpUaGVuIHdlIHNob3VsZCB1cGRhdGUgdGhlIGJpbmRp
bmcgdG8gaGF2ZSBvbmx5IDMgbW9kdWxlIGNsa3MgaW5zdGVhZCBvZiA0IGJ5IGRyb3BwaW5nDQp0
aGUgc3BpX3gyIG1vZHVsZSBjbGsuDQoNCkdlZXJ0LCB3aGF0IGlzIHlvdXIgb3BpbmlvbiBvbiB0
aGlzPw0KDQpFeGFtcGxlOg0KCURFRl9TRElWKCIuc3BpX2Nsa194MiIsIENMS19QTExDTTMzX1hT
UEksIENMS19TTVVYMl9YU1BJX0NMSzEsIENTRElWMF9ESVZDVEwzLA0KCQkgZHRhYmxlXzJfMTYp
LA0KCURFRl9GSVhFRCgiLnBsbGNtMzNfeHNwaV9kaXYyIiwgQ0xLX1BMTENNMzNfWFNQSV9ESVYy
LCBDTEtfUExMQ00zM19YU1BJLCAxLCAyKSwNCg0KDQoJREVGX01PRCgic3BpX2Nsa19zcGkiLAkJ
ICAgICAgQ0xLX1BMTENNMzNfWFNQSV9ESVYyLCAxMCwgMSwgNSwgMSwNCgkJCQkJCUJVU19NU1RP
UCg0LCBCSVQoNSkpKSwNCg0KTm90ZToNCkN1cnJlbnRseSBJIGFtIGZhY2luZyBhbiBpc3N1ZSB3
aGljaCBpcyBwb3BwZWQgdXAgdXNpbmcgc2luZ2xlIGNsb2NrLA0KSWYgSSB1c2Ugc3BpIGNsb2Nr
IGZvciBycG0sIHRoZW4gZmxhc2ggd3JpdGUgaXMgZmFpbGluZy4gSWYgaXQgaXMgdHVybmVkDQpv
biBwZXJtYW5lbnRseSB0aGVuIHRoZXJlIGlzIG5vIGlzc3VlLg0KDQpDaGVlcnMsDQpCaWp1DQoN
Cg0KDQo=


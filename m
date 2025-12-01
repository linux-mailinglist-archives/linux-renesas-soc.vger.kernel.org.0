Return-Path: <linux-renesas-soc+bounces-25465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77CC97CC6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 15:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 01A63341DB6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 14:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D53F3164D6;
	Mon,  1 Dec 2025 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d5VM+69k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332BC318152;
	Mon,  1 Dec 2025 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764598523; cv=fail; b=nbVmtIlQ6HBFuMPWtpVmIju5vIZWDlU6iYPPvT9kA/uQIalkmTKxAUUKImrmx5GPx1Hg0rj0tcWt+ujBaJhYP1rTAkfYUMf4B2WtIGNf18n0J9nuqZVriMkN88Y+I+Zhdoq7kmV1xCSfHstiqBGGL1IVBS+C0A/vHe+PuAwkVEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764598523; c=relaxed/simple;
	bh=l1QWShYm2SuRf4qvpdsb7aLlwX2XpveM049pYOrc1eU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QaFwt18J1HIXpTxjkMprJeSebWbZre/A61Cfg6neTIrr/lC2k6obR27maNceL43KUxK90qNv7qOxrraLpevoygmOlRk4mlqjbrh3cD1whFqsubiCmoV/Q3uwwdMCYXag6gOcdUCQIr0b8R6xq0X3jnhnekVzxwzD0vs7zax5LMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=d5VM+69k; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sv8qznfsYxScIN9LYjnwcVobyI9kHBm+INXxUneFCSWNRj0d2hONPA1VGYpEUdkbHFn4BHuZa/CnHLaKhdKDeCJQ83gBEjUrJV+ORSvnIEGpC9JPgOTLC8S5TKVvwylYuMTuMdF9afpZdfnNz1bylvMDpixhmEh5Xb2zGXKT5zgzo97wBqdk1k+ZwR1Dg1pyCmxOcvHFh2/AQO+MLMocBLi8+o68Ogxum4VSBVn08haDOa9EX5rFoHFgpIs+iHccFBg12f3TPv58y0Nene07jr0T750LMdJ95yMKvH4cMT4cRtSykAJP3SgVHmqFD2y1UqxoARYkY+EUUO9YDNAvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1QWShYm2SuRf4qvpdsb7aLlwX2XpveM049pYOrc1eU=;
 b=u1YTf6IgnN/f+/dtVeXOIXqRTbSk7WxEu+oJ2kS/zGHcRB+s308+rSsiY1lJHqzceGm6xluXr0QfoTfSVIZchJsJTA5fl6TJ8qz4OAhcCxXes2/Q+pjjGNRR9ALQlekUBKjTsOBXWkl5uC3dUz6NGAUZDjGqTKEeQEHfRUEFH0QWEkYDZjl2lD1pTA76tUdVn64axj+3/rSq5/q2RZ0jFFpabNy4gJ2K/fzW/B1NevfVISwL+LTaVQOwd/GZl7qkfGmkbL0BoFuTnhVLH2SyC+2X1aE5GN5bbAGZige9DyIBn6LzgEmT7CYDt5Opn4MZ9anT88fafzQdXsGotLhQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1QWShYm2SuRf4qvpdsb7aLlwX2XpveM049pYOrc1eU=;
 b=d5VM+69ku3hE9LcDK1tx+EEAe82F+9HYlAAysfRpmFsGQ5BTnK+ysO6ZX7KBGAqx+6rXg8QAZo5vM7P3dDU8iMcWsJzgn/OQOZ0DdV1NeJlcimcvA0naE8vfNS+TFOkO9oWkM0JTUz0Bh2DG8TVTHt0Vdh+GLHzCKnKWSNPkXZk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11523.jpnprd01.prod.outlook.com (2603:1096:604:230::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 1 Dec
 2025 14:15:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Mon, 1 Dec 2025
 14:15:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Josua Mayer <josua@solid-run.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Topic: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Index: AQHcYr6fMjaP0/3KT0Wqx+rUGWyUpLUMuQqggAAXLwCAAAFLoA==
Date: Mon, 1 Dec 2025 14:15:14 +0000
Message-ID:
 <TY3PR01MB1134642684DDFC5D4F1DBA76286DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>
 <TY3PR01MB113465581E5F8BD6C45FB7DCB86DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <7322ce79-4684-4a3e-9637-824b4398b51a@solid-run.com>
In-Reply-To: <7322ce79-4684-4a3e-9637-824b4398b51a@solid-run.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11523:EE_
x-ms-office365-filtering-correlation-id: 4173dfa6-fc14-4a1c-439f-08de30e40bd7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UFpLdWVjdjFjN1pVSHFtN0sxOXlDR2paUXNnZHJja1lBT1dDQTJWSTg5THlG?=
 =?utf-8?B?M0hrREJlVGhUY2pVbWF4dkJTRjR0c0ZSeVkraENCUFg1TnJDMlFoT2dSMmhq?=
 =?utf-8?B?bDJSZysvbFBSWVRSejI2V3YwR3RTaWhrOC8vc0JtZktITmo0OFlKOHJmTElT?=
 =?utf-8?B?TVI5Tkc1b0FUZWZudzhrZUJXVldGdEFQd1h0NStHbjFSdnoyNnNWSm1xNG5T?=
 =?utf-8?B?MzNoblZvME9UQVJ2ZFRCbk9jaUNwNmFjcW5ERG9RNmlld3BjNkZtU0M4UkpW?=
 =?utf-8?B?UlAxUmRBLzk5d3pIeDZwbE9DemdWUGFDK1Mxa1ZIZXFUZXQzSlBySkpTT3U0?=
 =?utf-8?B?cmpiRHRKOVh3bnNTVEFKci9LM2JMbXVNSGw4aUdRSW5Wc0E1WjZIQjB2YU1D?=
 =?utf-8?B?UGlpVGdVRHdwQWxuRUlYVExqYWU5MGJ0eFVINjZoR3N5T09aTVo3NnFwT3d4?=
 =?utf-8?B?bUxUYjZGczVDd3E0bjlGeUdpcWhmUnNRdGZtV0RpR0I3bTFtaEFhS1p1cXZQ?=
 =?utf-8?B?S1BBUHpEblo0cWVKSUEreVZ0a25pQTJYRk9FaktZTFFCVGtxeWdsNE5TUWdW?=
 =?utf-8?B?enk1WlpTV2NwdEcrRk8yN2tJcG12bkZOK3JIQXd0Rmt0eWdScmQyWUFObWR1?=
 =?utf-8?B?REpHSTRxL28wOFhTNCtHZnZKckhldzljQW5iRnovMFlWaWNYM3p4blZzb2JW?=
 =?utf-8?B?OGlMa0NrdndxNUZ5NWtzRGU0U1k2OERZQjZya1pCTVduR2EwOTlLQjdYUHky?=
 =?utf-8?B?YnNKR2YyTE8rOXRqc2daeHQzbG9EbEU0S09HUlczUU1WeTlRMHg2cDRpbGhO?=
 =?utf-8?B?QWV1ci9RNFFJUERyUkVYY21LcUZrR3ZtWTFQVG1iMUR3UVFJbkNFUHE2VFVF?=
 =?utf-8?B?RzB4cWsreDlpMDFFRnFPQ3lRSWg1MVVaQ2Z1bWhNRm56amYzUXcweXZsOFo0?=
 =?utf-8?B?MXkvb0loQk1PT2xyR0N4UmRxSlhOYVF3Rmhvd2xraDZ3YnJ6ZEt0Wk1vL1Vn?=
 =?utf-8?B?dEFtUmZPZmpvZHZ5cWhnbWhOdU14SzZ0TzN4TDBvL01kKzNuVXdDRnRHcC9H?=
 =?utf-8?B?QzRRVFdwK2lVOVpXL2NCVjAvNE5wWHFqRlNFZnhYRmk0VU4rVjJ5NWdYYVM0?=
 =?utf-8?B?Tms1aVV0Z3Q0OHkycHFNU2g5Y2pTVUVIemVIY2RESWZJQVdsODdYc3BGVFd0?=
 =?utf-8?B?S1JURUh2aWhFSW8zd0dVNHNJY0FOSUFMR2xHUFZMNzZmVTc4RzdldTJYVFVB?=
 =?utf-8?B?V1F2clRyOXVRTFlEZkduWUtvT1hidDk1N0RuVisrV3dKYTVlS1VXWklvR2RU?=
 =?utf-8?B?bGFRRjJTc3k2YWhvMnZoQjRPb0lwUStJZE1nOVRsMkxienRHZEpFekVYMlJ4?=
 =?utf-8?B?RFFZc1ZPZ3N2Zk5sQnMzeUowekpEWE1NTTByOUhCZTZIZGpFRnA4MXRtNEhv?=
 =?utf-8?B?aGwxejRscDVkUEsrZVgyMllJdUpFeXVzUmppQjN2MnUzYisrOWZJUHZLdE8x?=
 =?utf-8?B?SUpnUWFqSEFvUVJQbFh3K0Z0Mk9CTHQ0RzM5QXhWcnR4MFB1SUtiUFZwUkR6?=
 =?utf-8?B?K3A5YnhmWXEzRVVLUzJ0UXROODhqYy85Mjc5SmRnTStBQXJGOFJzaitZRVR0?=
 =?utf-8?B?R2hLMVo3cmhmV1ZPYmFSdXkxVUlDSFhpejNiTnZFejYwWHI3ZmluQXppdG00?=
 =?utf-8?B?YkFST3RwM2MvVHFrY0NiL2MwU0h3QTRxYkpGTEtEUVd0MithemlRRE9tVjVG?=
 =?utf-8?B?M01pZjU3UkFhMEUwZThRbTNLYjJxQSt3QzlBbDZqM2pJNzd2SUllOUZNR3lu?=
 =?utf-8?B?dlRCSmpqcXVFdzR6RUUrSmJIeUhLRHFTSXA5bjU0QjdRYXA3SFpnaElWa0Fr?=
 =?utf-8?B?cWgveXhTQ1BnaStzQ3JDWWJFc2F4YmtVc2FyOUxWMEozUWw0SEcvSTlGSnFp?=
 =?utf-8?B?NVdzLy9OSEZ3NnRBR3pFTjRQa3Y2aGRDZGV0Q0hqSWdJcFNsN3k0K1M0Mi8y?=
 =?utf-8?B?WWNTeG91eUkyRzJrWVI5NDNDakRjVlNlOVFtZjBiWXE3SzQ4RDUycFU3ZXlY?=
 =?utf-8?Q?nP4T3h?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2FZVDZwdlB3TDRXOVhSSWdQWitHK29RVHo0TmRnRW9BVDRmTmdONDZmdWdG?=
 =?utf-8?B?dlVVNVR5bHdZZ3ppVGYxMnhNalhyemlZQ3J4ZTN3c25Hak9pTGNTS09BWVpo?=
 =?utf-8?B?ZU9uUXdrek01N2VhTDY3MUtnWjVQUlJ0MGFUWHpOZ0g2ZGIwTGdVajF2UFJu?=
 =?utf-8?B?Nll1cHNkQ3FkbVhQdWlzNVAyRjAwMkpzWURzcG5HZERBUnBnNjNlVXRmWnMx?=
 =?utf-8?B?bHNLMnBob3oyamhJV25ReDhzcjNGY2dPcTNvZWNtTXkrcHpCeWRsWS8ycjJy?=
 =?utf-8?B?TFBIbkRoNUVuSjkzVHJ5cnlNWWhsbERZTGRMUGtBUmxJVFo1RFRGV0dpQkJ0?=
 =?utf-8?B?Q0g3dDJpOHU2WFpRK3M1Myt6aUVGMDdSVGNrWGxKYTk4VWZuVWowNGNZMG9N?=
 =?utf-8?B?UkpuaERjUWZsMGxZdzFKREhCOFlYQ1BtQllVMXdGbkdPTEtpbDVoU0VJcERE?=
 =?utf-8?B?K0o4TjIzM2w0cTNVTEYrWTlqT3k3d1RpV21pd2ltMGxQdkVZdkh1RWF3cUND?=
 =?utf-8?B?Rm1Ca21MalgxY3hvRXI3Y3NQRWluT3JOdDR0SHpJbGFVVnNQMC92MFNMMytF?=
 =?utf-8?B?RzdQeHZJZEk5blhUU0VOT2lyQUhia0d2UGdjayt6c2gzaldhenNmQkxzalcx?=
 =?utf-8?B?ZXJDZUVMZW1zanVsYWc4S1Zkbm9adVVDdHg2d3VSemg5RzN3YktNNXhHT1R5?=
 =?utf-8?B?K2lUYkdIdW1xUWZjVHdNMStIWEJHOGwwVnZKNmFGZkNrTFRndC85czB6c29S?=
 =?utf-8?B?MVJsYWp3b3BZTkNzYkx1VlZpQWIyWjFMWElzaldLc1hwTFM5bk1JUEEzaW9N?=
 =?utf-8?B?YzJZRjRXR3VqZElCNktFZGZ2Vk9udjFjMExlM3o3cDg5SzdXMDlwa3pvY0Rx?=
 =?utf-8?B?NFNUeTU4RE1iNmxUcysxYlFKS3RwZjhIRWx5dEFaY1Z2MVJkaUFuQmhXa3A5?=
 =?utf-8?B?amR1UkhObUVjRXlyNzBFQk5UOTlDMkZKUlJremp5M0Fnc1dYckNSTVRrdWxI?=
 =?utf-8?B?L0I5aVdyM09iSllkUXBOZ0tTMTgyYkdaTGlPaTIrRy9sZHM5N1dJdjQ0UnN0?=
 =?utf-8?B?SThHUTJJOUEwOUZtYUFDKzI4cmNwdjBOejJ0aXZSUjVjOVhYQTBzWWdBelJD?=
 =?utf-8?B?bmdkQkhjWFpBT0liY0tESkhjVzJZY09SL0dqU2Rla0tFNzIrK1dnUnU0Sk8w?=
 =?utf-8?B?eUM5cSs0Y2o0OXFnNUxZZmxLSVl2VnpPcjF2MXVOUVM5VUFuMGRZYUpoODR6?=
 =?utf-8?B?NGVmRkRYbnBYMVVBUGZ1cHhwanE0Nzc2RVk5Q1lVN01DWko4WTBvVXVyd1h0?=
 =?utf-8?B?QXVJVUZYYzIvVU0wck5RUWVKUGIrcGtHa3Vua1JqclJaQzYzMHFqanlUWW5I?=
 =?utf-8?B?OTQrY2VXbUVHVDZtYlcvYXJhL1hPYlk1VEJKa29kc0pLcGZxM0RPckZ4S3Fx?=
 =?utf-8?B?Ti9HSGtKWWk0UFNUOVdpbGdnV09BTmVUNHE2WFU3ejNrUFpSMFB4RElpY2xs?=
 =?utf-8?B?dFZmUGNwamwzS1c4VTY3b0NFQnRPYWFUWHNtZ2dVdW5uQ0VlSFVBUnBLYTRK?=
 =?utf-8?B?UUx3a0NKRGZYUmxUL01vU0JMaklaWThZWmRIYndBVFhuNEV4OW1PNHV0a0Ry?=
 =?utf-8?B?aVVMbTl1NEM3YXgwYkVWa1N2cTBGYjBNd1J4MElOZk5YOHBCenpxakE3bnds?=
 =?utf-8?B?QnJjN3FYaTJDdnN3TFZtZFBQTFJmaElTenhYNWdkN3JUT0xTUDN0OVZBLzds?=
 =?utf-8?B?Ykl0T2pPcjlaeWtiZG8zUVBXV0JFT3Y5L3ZpWFZzOUlkekJnRWxQZUFEWjRV?=
 =?utf-8?B?YTl4S3NJNnhMVWZyVmxsaVcwMDVDMXduekJVcHNpNEN1RnlDUnVzMnhJWmpw?=
 =?utf-8?B?am9OYXBEdW5ZMHhYaXM3cEQrRDZvdmpLalYwQUlzZW1SR0Q4Ylo4TUlkc1Iz?=
 =?utf-8?B?d256SG1KL2ZnRFE5dDFmbEgzdC8xVXgxV0ZpTEVrQTF2WlBxdHM1MkJCbExI?=
 =?utf-8?B?MkRRRk40WnFnK1FYTXJIQ3d3MkVsOEZPdW9NRCthQzJzYzVNbS94TFYzQklM?=
 =?utf-8?B?T2RKME10cHQ3R0ZBSDkyUnB2WWhmNzdCbGdQa3QwQSt0SU9OVTVtUFhHczFD?=
 =?utf-8?B?WEVRMERFcDhsU1JKSVBPNnR2NWZmaHd3Y1dITURieFVuSm1Yc2F3UXlNVENa?=
 =?utf-8?B?akE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4173dfa6-fc14-4a1c-439f-08de30e40bd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 14:15:14.1985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8JesY3QSypYJYXzuJ5S62LKjCPXaPIdh8e+vImgFd2xpDjwirl+rhJxTP/Vz0VzAge5bF8TMc4mIM80Z++hCge3l07Kuc2JIpRsZi/LSXcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11523

SGkgSm9zdWEgTWF5ZXIsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4u
Y29tPg0KPiBTZW50OiAwMSBEZWNlbWJlciAyMDI1IDE0OjAxDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjIgMS8yXSBkdC1iaW5kaW5nczogbW1jOiByZW5lc2FzLHNkaGk6IEFkZCBtdXgtc3RhdGVz
IHByb3BlcnR5DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gQW0gMDEuMTIuMjUgdW0gMTQ6MDIgc2No
cmllYiBCaWp1IERhczoNCj4gPiBIaSBKb3N1YSBNYXllciwNCj4gPg0KPiA+DQo+ID4gVGhhbmtz
IGZvciB0aGUgcGF0Y2guDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+ID4+IFNlbnQ6IDAx
IERlY2VtYmVyIDIwMjUgMTI6MzENCj4gPj4gU3ViamVjdDogW1BBVENIIHYyIDEvMl0gZHQtYmlu
ZGluZ3M6IG1tYzogcmVuZXNhcyxzZGhpOiBBZGQNCj4gPj4gbXV4LXN0YXRlcyBwcm9wZXJ0eQ0K
PiA+Pg0KPiA+PiBBZGQgbXV4IGNvbnRyb2xsZXIgc3VwcG9ydCBmb3Igd2hlbiBzZGlvIGxpbmVz
IGFyZSBtdXhlZCBiZXR3ZWVuIGEgaG9zdCBhbmQgbXVsdGlwbGUgY2FyZHMuDQo+ID4+DQo+ID4+
IFRoZXJlIGFyZSBzZXZlcmFsIGRldmljZXMgc3VwcG9ydGluZyBhIGNob2ljZSBvZiBlTU1DIG9y
IFNEIG9uIGENCj4gPj4gc2luZ2xlIGJvYXJkIGJ5IGJvdGggZGlwIHN3aXRjaCBhbmQgZ3Bpbywg
ZS5nLiBSZW5lc2FzIFJaL0cyTCBTTUFSQyBTb00gYW5kIFNvbGlkUnVuIFJaL0cyTCBTb00uDQo+
ID4+DQo+ID4+IEluLXRyZWUgZHRzIGZvciB0aGUgUmVuZXNhcyBib2FyZHMgY3VycmVudGx5IHJl
bHkgb24gcHJlcHJvY2Vzc29yDQo+ID4+IG1hY3JvcyB0byBob2cgZ3Bpb3MgYW5kIGRlZmluZSB0
aGUgY2FyZC4NCj4gPj4NCj4gPj4gQnkgYWRkaW5nIG11eC1zdGF0ZXMgcHJvcGVydHkgdG8gc2Rp
byBjb250cm9sbGVyIGRlc2NyaXB0aW9uLCBib2FyZHMNCj4gPj4gY2FuIGNvcnJlY3RseSBkZXNj
cmliZSB0aGUgbXV4IHRoYXQgYWxyZWFkeSBleGlzdHMgaW4gaGFyZHdhcmUgLSBhbmQNCj4gPj4g
ZHJpdmVycyBjYW4gY29vcmRpbmF0ZSBiZXR3ZWVuIG11eCBzZWxlY3Rpb24gYW5kIHByb2Jpbmcg
Zm9yIGNhcmRzLg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKb3N1YSBNYXllciA8am9zdWFAc29saWQt
cnVuLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbW1jL3JlbmVzYXMsc2RoaS55YW1sIHwgNiArKysrKysNCj4gPj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4gPj4gYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVzYXMsc2RoaS55YW1sDQo+ID4+IGlu
ZGV4IGM3NTRlYTcxZjUxZjcuLjc1NGNjYjFjMzBlZmIgMTAwNjQ0DQo+ID4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4gPj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNkaGku
eWFtbA0KPiA+PiBAQCAtMTA2LDYgKzEwNiwxMSBAQCBwcm9wZXJ0aWVzOg0KPiA+PiAgICBpb21t
dXM6DQo+ID4+ICAgICAgbWF4SXRlbXM6IDENCj4gPj4NCj4gPj4gKyAgbXV4LXN0YXRlczoNCj4g
Pj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPj4gKyAgICAgIG11eCBjb250cm9sbGVyIG5vZGUgdG8g
cm91dGUgdGhlIFNESU8gc2lnbmFscyBmcm9tIFNvQyB0byBjYXJkcy4NCj4gPiBNYXliZSBkZXNj
cmliZSAwIC0gc3RhdGUgZm9yIFNEIGFuZCAxIC0gc3RhdGUgZm9yIGVNTUMgPz8NCj4gVGhlIHN0
YXRlLW1tYy1zZCBtYXBwaW5nIGRlcGVuZHMgb24gdGhlIHdpcmluZyBhbmQgZGVzY3JpcHRpb24g
b2YgdGhlIG11eCwgc28gd2UgY2Fubm90IGRpZmZlcmVudGlhdGUNCj4gaW4gdGhlIG11eC1zdGF0
ZXMgcHJvcGVydHkuDQoNCk9LLiBBZ3JlZWQuDQoNCj4gDQo+IFRoZSBpZGVhIGlzIHRoYXQgd2hh
dGV2ZXIgbnVtZXJpYyBhcmd1bWVudCB5b3UgYWRkIHRvIHRoZSBwaGFuZGxlIHdpbGwgc2VsZWN0
IGEgcGFydGljdWxhciBzdGF0ZSBmb3INCj4gdGhlIG11eC4NCj4gVGhlIHJlc3Qgb2YgZHQgcHJv
cGVydGllcyBtdXN0IHN0aWxsIGJlIHNwZWNpZmljIHRvIFNEIG9yIGVNTUMsIGUuZy46DQo+IA0K
PiAmc2RoaTAgew0KPiDCoCDCoCBwaW5jdHJsLTAgPSA8JnNkaGkwX3BpbnM+LCA8JnNkaGkwX2Nk
X3BpbnM+Ow0KPiDCoCDCoCBwaW5jdHJsLTEgPSA8JnNkaGkwX3Voc19waW5zPiwgPCZzZGhpMF9j
ZF9waW5zPjsNCj4gwqAgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInN0YXRlX3VocyI7
DQo+IMKgIMKgIHZtbWMtc3VwcGx5ID0gPCZ2bW1jPjsNCj4gwqAgwqAgdnFtbWMtc3VwcGx5ID0g
PCZyZWdfcG1pY19sZG8xPjsNCj4gwqAgwqAgYnVzLXdpZHRoID0gPDQ+Ow0KPiDCoCDCoCBzZC11
aHMtc2RyNTA7DQo+IMKgIMKgIHNkLXVocy1zZHIxMDQ7DQo+IMKgIMKgIGZ1bGwtcHdyLWN5Y2xl
Ow0KPiDCoCDCoCBtdXgtc3RhdGVzID0gPCZzZGhpMF9tdXggMT47DQo+IMKgIMKgIHN0YXR1cyA9
ICJva2F5IjsNCj4gfTsNCj4gDQo+ID4NCj4gPg0KPiA+PiArICAgIG1heEl0ZW1zOiAxDQo+ID4+
ICsNCj4gPj4gICAgcG93ZXItZG9tYWluczoNCj4gPj4gICAgICBtYXhJdGVtczogMQ0KPiA+Pg0K
PiA+PiBAQCAtMjc1LDYgKzI4MCw3IEBAIGV4YW1wbGVzOg0KPiA+PiAgICAgICAgICBtYXgtZnJl
cXVlbmN5ID0gPDE5NTAwMDAwMD47DQo+ID4+ICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnN5
c2MgUjhBNzc5MF9QRF9BTFdBWVNfT04+Ow0KPiA+PiAgICAgICAgICByZXNldHMgPSA8JmNwZyAz
MTQ+Ow0KPiA+PiArICAgICAgICBtdXgtc3RhdGVzID0gPCZtdXggMD47DQo+ID4gT24gUi1DYXIg
bW1jL3NkIG11eCBhdmFpbGFibGUgb25seSBvbiBTRDIvU0QzLCBzbyBJIGd1ZXNzIHlvdSBwaWNr
ZWQgd3Jvbmcgbm9kZSBTRDA/Pw0KPiBBcyB0aGV5IHdlcmUgZXhhbXBsZXMgSSBkaWQgbm90IGdp
dmUgaXQgbXVjaCB0aG91Z2h0LCBXZSBjb3VsZCBldmVuIG9taXQgbXV4LXN0YXRlcyBmcm9tIGV4
YW1wbGVzDQo+IGNvbXBsZXRlbHkgc2luY2UgaXQgaXMgb3B0aW9uYWwuDQoNCk9LLCBJIGd1ZXNz
IHRoYXQgaXMgYWxzbyBmaW5lLCBpbnN0ZWFkIG9mIHRoZSB3cm9uZyB1c2FnZSBpbiBzZDAgZGV2
aWNlIG5vZGUuDQoNCj4gPg0KPiA+IG9yDQo+ID4NCj4gPiBBZGQgc2VwYXJhdGUgZXhhbXBsZSB3
aXRoIFJaL0cyTCwgYXMgdGhlIGJvYXJkcyhSWi9HMkwgU01BUkMgRVZLKSB1c2UNCj4gPiBncGlv
L3N3aXRjaCAoWE9SIGZ1bmN0aW9uKSB0byBzZWxlY3QgdGhlIGVNTUMgb3IgU0Qgc2lnbmFscz8/
DQo+IA0KPiBJIGNhbiBpZiBzbyBkZXNpcmVkIGFkZCB2ZXJib3NlIGV4YW1wbGUgZnJvbSBvdXIg
b3duIEcyTCBiYXNlZCBib2FyZCwgZS5nLjoNCj4gDQo+IHNkaGkwOiBtbWNAMTFjMDAwMDAgew0K
PiDCoCDCoCBjb21wYXRpYmxlID0gInJlbmVzYXMsc2RoaS1yOWEwN2cwNDQiLCAicmVuZXNhcyxy
emcybC1zZGhpIjsNCj4gwqAgwqAgcmVnID0gPDB4MCAweDExYzAwMDAwIDAgMHgxMDAwMD47DQo+
IMKgIMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxMDQgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgPEdJQ19TUEkgMTA1IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0K
PiDCoCDCoCBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA3RzA0NF9TREhJMF9JTUNMSz4sDQo+
IMKgIMKgIMKgIMKgIMKgPCZjcGcgQ1BHX01PRCBSOUEwN0cwNDRfU0RISTBfQ0xLX0hTPiwNCj4g
wqAgwqAgwqAgwqAgwqA8JmNwZyBDUEdfTU9EIFI5QTA3RzA0NF9TREhJMF9JTUNMSzI+LA0KPiDC
oCDCoCDCoCDCoCDCoDwmY3BnIENQR19NT0QgUjlBMDdHMDQ0X1NESEkwX0FDTEs+Ow0KPiDCoCDC
oCBjbG9jay1uYW1lcyA9ICJjb3JlIiwgImNsa2giLCAiY2QiLCAiYWNsayI7DQo+IMKgIMKgIHJl
c2V0cyA9IDwmY3BnIFI5QTA3RzA0NF9TREhJMF9JWFJTVD47DQo+IMKgIMKgIHBvd2VyLWRvbWFp
bnMgPSA8JmNwZz47DQo+IMKgIMKgIHBpbmN0cmwtMCA9IDwmc2RoaTBfcGlucz4sIDwmc2RoaTBf
Y2RfcGlucz47DQo+IMKgIMKgIHBpbmN0cmwtMSA9IDwmc2RoaTBfdWhzX3BpbnM+LCA8JnNkaGkw
X2NkX3BpbnM+Ow0KPiDCoCDCoCBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic3RhdGVfdWhz
IjsNCj4gwqAgwqAgdm1tYy1zdXBwbHkgPSA8JnZtbWM+Ow0KPiDCoCDCoCB2cW1tYy1zdXBwbHkg
PSA8JnJlZ19wbWljX2xkbzE+Ow0KPiDCoCDCoCBidXMtd2lkdGggPSA8ND47DQo+IMKgIMKgIHNk
LXVocy1zZHI1MDsNCj4gwqAgwqAgc2QtdWhzLXNkcjEwNDsNCj4gwqAgwqAgZnVsbC1wd3ItY3lj
bGU7DQo+IMKgIMKgIG11eC1zdGF0ZXMgPSA8JnNkaGkwX211eCAxPjsNCj4gfTsNCj4gDQo+IEkg
ZG8gbm90IGJlbGlldmUgaG93ZXZlciB0aGF0IHRoaXMgaXMgYWRkaW5nIGFueSB2YWx1ZS4NCg0K
TWF5YmUgV29sZnJhbS9HZWVydCBjYW4gY29tbWVudCBvbiB0aGlzLiBMb29rcyBsaWtlIFNEIG11
eCBpcyBhbiBpbXBvcnRhbnQgZmVhdHVyZSBvZiB0aGUgU29DLg0KDQpQcmV2aW91c2x5IEkgZ290
IGZlZWRiYWNrIHRvIHByb3ZpZGUgcmVhbCBleGFtcGxlLiBUaGlzIHJ1bGUgbWlnaHQgaGF2ZSBj
aGFuZ2VkPz8NCg0KQ2hlZXJzLA0KQmlqdQ0K


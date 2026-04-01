Return-Path: <linux-renesas-soc+bounces-30697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKCbCaE4zWnDawYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:24:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EEF37CFF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09BEC302F561
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 15:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E2440B6CA;
	Wed,  1 Apr 2026 15:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rESLSQY2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C247F472790;
	Wed,  1 Apr 2026 15:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056629; cv=fail; b=rJUjK0+V2s4ttgKaIRtRYHi/pO6Cchw5uVzWcpq8qooi98qU0hm2pAfE4gWAT1SeVyfadwBBXnIPMhdsGSWKTw2Tr2WQlyU1AOFAGVJfxdyEbUoTFF5eVu+WklN+vY8Gm42oiYymWzK7EHh3Y59ocuaW4dEyrL7WiLiETMUSgi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056629; c=relaxed/simple;
	bh=mZra4QCcJNS4EQOC9aN09IvjCswVamWD3Ee+He7eNWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kBPYT6ao4+onEjyq+4q/Df9NugrSwxxSBzTreA9GY63A1e3+G5mYHN+A+Lem5cMkyVtKIVCEcp6+r2PRGBNb/ok6NAKe1IG+qtvvAU5OhMRb7r9sEp0ha1k7jnGfsiumZyH7sIYcfY+/BItTCoEBTVHsVzof2mP2BJpUtqZxCHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rESLSQY2; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYrj1a2ziHA6ecgf4LmtHgMQV95kgw+uNM5Vt991PF34gHKEvkPgJtQTxsOqLRsTv6EF89rM86UMBuFTQjpQpCqPcXNctq+QxcBAmn5+lM2l5VFK3U18n0wvLeNySdHhKxWHp9inyV+AOh8iNBbJjfRrLX8fJla74lNNLd9bQTmPGH2E65kCsEUDNpfAtpXLdhAAI6HlSE8CvdPA+l3ybJXdMjNdYkFb5Hivj9ZO6hzTRT8qWH3hfDGTdb9SRAOGAjaj2RVyQeSdXc5RzYCYphiRaqGjiW+oU20rgQCee7EYYjkRCGT6zvHR0z6q6TZSyP2ibRyb87iNWM9c9ZW3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHs14+3baB5K0/J+y4RCkTJEjmnYoxMarfy0brJzU/0=;
 b=b8gX9wUDTknSBZHhB6dPBFjnmI4csQXex84yCpLD62Js2dcy1xv7RDukII39nUiXda33Aq/0f402iPbJ21r34NkQnreBtv7Ie2SmoH0fjwOov1AueuFX96xrzj98MMTwy3wpqcskSBBCvZ3yfy9Emc1sWZ9FTferPJwlXNsbqyUphOCI8paVGbR7Zp51heiCm8pyjMjDg9HVEdTpoPD/qaVNDqsOHBlUcGV6IWBIhegl9UwDNnvUpUoJdvRKnalvtWsxxAprb35CEqFY5HdHFwVoFudrAcdkU2zhKjKqRkQdT6TjRdb88tpdALUpPwPEpUUwW39V5CwikqZtLicwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHs14+3baB5K0/J+y4RCkTJEjmnYoxMarfy0brJzU/0=;
 b=rESLSQY2/n6AmumXApBOvrMbj8eyKgdq7rZ3ncWJQzKQJ4lSXORWuDFN4fHVfEZFLkRcf+Zu6NdZXihAMAsyzMazIAu3X1wRhdD4u3hQET6UNkO2qkWhfl6t0NXGT63imkjiL6PhSEncxKaGApunR+WGFjZ2T8krkJE5RnFH3Sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9993.jpnprd01.prod.outlook.com (2603:1096:604:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:17:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 15:17:05 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/5] reset: rzv2h-usb2phy: Convert to regmap API
Date: Wed,  1 Apr 2026 17:16:10 +0200
Message-ID: <0732e1c53f21671b3a1a78db99fbbe3b78016d52.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 0940fcdc-4540-44bc-cc81-08de9001bb91
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CVAJfKaz5BIkIsHzSDaupnD66BmJmgTPtLtxZpkqQEP3ac+LhbleH3oOdo9ZfZNzilIyu6cDpTWeDclZbEkfmZDSR0byHYKZ0riByoNpGpSv64UMSeyLI02RQEgBBB1ld2ZHOzH/jE7eAcM6iiChZJGw9W9YIv+9B9GYbvvaTAY32AFcH8zPZK2z/SkkTaJQ77gKRd5Z1zdtFxHuL43S5pg0Ljf8K+WrpFrXyyT8R/bPeKDlf3NE0KMTFTybbJz1qlqd8T92aEKQPOdkxDeZLgDk6npPQCYqMIYVx+zzLyKBYT9S3p+/1ez5Nl32l24zKuAQvuGzrGNqcHEaD5pb+8i6SqMBNEWqfaJPALMAmdre59Xvi31F8A5FdqbvEa5MLN0fuKw0eLdo1w9ow5H8YeX0mzlFqG6kKPoLe6te+kDGAlEdtsmzct9nA1I9DysoG+fqNJkp2rXdeJHpyxhR03sqjNz+XNFN8P6L1EomQVp02jBxwPNH+FpAdai8aXch5YSlm4eTzEt9DKjawi6jY0IBi1v7rYIv+yT9C5O/wsAdE6JwjbAQ+sg7VAipusYzu41riwO9h56FF2MN7tK0KVGoYwe7g0KsRukb9KhpEQONgDwdOiYQiYDTMrv2dFCXtO7Nz90iZA6ejFaOYHIMIegd+FhavtUS1SWPhVtg7Hn1uF2TiE513UNohEUzRhyVY6ivVAyYhNwvb+G7yTp2ydsDvp4URjGkaoAFWFblbbtP7SCwczOrrGHAgZVHjl/YX0JvpBJEuTfwbLs3qphIqlmwblDKsySV6JiBVQK9sgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NENvaVYxeSttemQ2Y2sxVzdDc3FnOXZMdzE0TjZpTFQ5QWVDQnNvWlQxZUhy?=
 =?utf-8?B?RHNyWFhDMXV3RXJYRGRqTzRYUy9lTFFsN0d3cnJCVzdQR1pFMkVuUG9zd1BL?=
 =?utf-8?B?OE53aHpNb0pzTHJFbmpTSlA2VTlUY3hDcWx6WFJWS1VMWnZBM01oSk9Ddldy?=
 =?utf-8?B?S0JQbVMyZTZsODVRRGtGRUdLMVFQVis1ekQ5UzA5Q0RFMDFXaWlTOGZVVFdZ?=
 =?utf-8?B?VWVuUzJ0Q2tNWVdVcFVGRTR4d2R3czJpa1BoY0dVREo4SWlLR2Fra25yUWRT?=
 =?utf-8?B?YUh5dkxud2I3M2hLUTRRTEgwelE5NzUrcVVEbDF2MzFvTU1OQjd2OVVDZTMw?=
 =?utf-8?B?dkovZTRQZ1RFQlZ5bWRoZ1hldndrQmpXMlJFQkNnajB3WGdKSk5iUk9YQldQ?=
 =?utf-8?B?TU4vQnoreUtUeDZ6UG90dXBhMnBKOU9oSXU5djZ3aVRtdndqaHQwZmwzNXpB?=
 =?utf-8?B?dm85UkUvTmFuMm9hRVF5UFpEN2Y2ZzU3ZHRhbU5sQVFjb1pJN2N1T2RFMStZ?=
 =?utf-8?B?ZXJFNjFrcGI2RFU1NmRqRmM2SGp2VUxEUC84LzJaQkt0RkhLak1WbGZQcnZQ?=
 =?utf-8?B?d3V6OS9FQ25HQ3pyVFI2QjVCaE93TGhuV1pHM2JaZCtkZXUxM3djQjNvVlZQ?=
 =?utf-8?B?RG9sbWVsTUpEdkhXeEtKRE9POXZqN2lDc2pjU0Y5WXFybDNsYUdHMDgzUHg2?=
 =?utf-8?B?S25OanRvcU1SQmEwWFc5RVNaYSs5SGNWNFkxQ0hJRk5VZFJTNTZMMWk1RGFP?=
 =?utf-8?B?UDgrR0hTeW5TdTF6Q250TjA4QXhqc0YwTURiZk1kWnlNQ1pVWjFyUGt6NW8x?=
 =?utf-8?B?UjlxZmx1eFRhbTkvOGdEZEV6cEFFczVMUDZDc3dMMlJkem4vRDJYMVFqQjJl?=
 =?utf-8?B?c0FsdTlwVGIza0txd2ZXMHdYS1pCc28yK2dVcEdwMzdabjNrUDViditaVWFx?=
 =?utf-8?B?dmdmSG55Z3l4MG1UZFgveHZIaXJZUEkwK1pWcXl4VGpMdjBEZmMrYVVaL2Nk?=
 =?utf-8?B?cTVJL1RJQTZhZ1hhTHpKWkc0clFKRGw5S2twWG1yS3lCYWZLdHUxdW4rTGNi?=
 =?utf-8?B?WVNrVzdvMzBNTDZqVFliVEZ5WUg3VEVhb3F6YVltcDNseHVtbTJ4S3ZuRUd6?=
 =?utf-8?B?UkhEb3gxKzh3YnhUV283S2Q2bFBUdHRIcGpoZ2s0SitlTW0xd0t5ajRNRC9y?=
 =?utf-8?B?amE4M1cwVGZ0MTBrNWs4VVBiVk5TakpteFJyQ3kxdWNGNHgyd215bVByT3dx?=
 =?utf-8?B?Z0p1TEJaMnpHNjR3MkNVeUU4bjZCaHVNN2hvNHVVS0h2elBHSnFSa0tHcmJJ?=
 =?utf-8?B?MnJuT0RWWDZ4OWVRSkt6VUJJa29kcE00Rnl3WnRPTlZBajhxMEZqelJKdmYx?=
 =?utf-8?B?THNWVHRvT050NUR5UzBrZHhjaEdxRUJsZWxFV3JramFuOEs2U3BXMFVXZUY4?=
 =?utf-8?B?SnlPaFpnclhDMjRGYjFrczcwL3FmNFpkY0FHblQzb1JabDNyajU5VzJSMlJX?=
 =?utf-8?B?MVkzNnRCL0NSYVNvY3BGaW0xdExwclBia3dlYWxhQ1dFZ05Vb3AzTUJ2QVY2?=
 =?utf-8?B?d1B5S0tjNHFxcDJ4Z2F5dUZYSEx4djhLeGNHa3c2Y3FINWRqc0JGUmY0YjRr?=
 =?utf-8?B?ZUpwNFdwV3c0Q2F3R3JIZkhBM1laWXo1aGdaMkUwV25IVXlqLzFoREVpc29W?=
 =?utf-8?B?YzZpMFEzTFBhMXgyNHZtZ3JYNDIyQ096dSsrUjV6TlRpS3l2TjVxbTJkVXJT?=
 =?utf-8?B?NFcxTWM1ZG1iRFBEYUllMjJXbVRPdTVQMTJMS29MRTIrM2RWdUttNkd1c1R1?=
 =?utf-8?B?bjRGTVhBQ3ZBOWY4bWpYTWJtd2Erb3liamhTSEhhS0tsY0NJTTFsbnpzd0pN?=
 =?utf-8?B?eWszRnpRMUI1Rk5lUDhkVXg2QXNPZk1ndmM4ZjhndER3aWhqd056Zk5yeVIy?=
 =?utf-8?B?eTBzRWx0QmphUWoxcEI2eWhJZUk2T0JnZXl2OERLZVQwb01KcExMMXVZbjlI?=
 =?utf-8?B?bk9sTFYrTkxBVkFaWis4QkhUKytGK0pEOVV3K1A5NnJzeDQ2STJwS0dYMjUy?=
 =?utf-8?B?NnNveEV5MndsVk1MTGUrVmtJQS9yb0hoTHBRazNSSzFJNitNbEpjUFlvMWFt?=
 =?utf-8?B?VEdzTUlUb0F5OFpNSUtPNDBHMmtjQ0o5aW5qTXNMVDF2cGVCRWFiMzdrcjY1?=
 =?utf-8?B?SWVZdWFJVzg3anUweEdhNlpaanpyTUhoVmZhSC9IYVRhZjJRTUUzK2Izdnow?=
 =?utf-8?B?M2FSczlGNkp3NUdSWVRyamJNaGFGYkFocWtYL0UyaGxCUFBTc2FnOFZtZEJC?=
 =?utf-8?B?Q2NYL0w5cU8rbGtwWjBZaEl6dnY3eFBKNGFRelFFWWY0akNOYlNRc1BRUENG?=
 =?utf-8?Q?KtiVIGFyMtU3pn82buk7azEkAW4QW1p0rziVk?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0940fcdc-4540-44bc-cc81-08de9001bb91
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:17:05.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mo7D37eJJZUR6dWJTjgl6yzBKJmsFFNcMh04fYjHqZ8yzWUq6dhHYCcx7p2T1JAIVgN7qPyTe9jkIh8X0fkBPtXuhYy6DuCqVpP+GqNaWw1QFsrpzUlMEFbYhgaUddNY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9993
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30697-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,arndb.de,linaro.org,solid-run.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5EEF37CFF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace raw MMIO accesses (readl/writel) with regmap_read() and
regmap_multi_reg_write() via devm_regmap_init_mmio().
Drop the manual spinlock as regmap provides internal locking.

Replace the custom rzv2h_usb2phy_regval struct with the standard
reg_sequence, and encode assert/deassert sequences as reg_sequence
arrays rather than individual scalar fields in the of_data
descriptor.

Use the reg_sequence .delay_us field to encode the 11 µs post-assert
delay, replacing the explicit usleep_range(11, 20) call in
rzv2h_usbphy_reset_assert().

Select REGMAP_MMIO in Kconfig.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v9->v10:
 - Use struct reg_sequence and regmap_multi_reg_write() to handle
   initialization, assert and deassert sequences and drop custom struct
   rzv2h_usb2phy_regval.

v8->v9:
 - New patch

 drivers/reset/Kconfig               |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 108 ++++++++++++++--------------
 2 files changed, 55 insertions(+), 54 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5165006be693..c539ca88518f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select REGMAP_MMIO
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..c79bf72602e8 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,42 +5,35 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
-#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 
-struct rzv2h_usb2phy_regval {
-	u16 reg;
-	u16 val;
-};
-
 struct rzv2h_usb2phy_reset_of_data {
-	const struct rzv2h_usb2phy_regval *init_vals;
-	unsigned int init_val_count;
+	const struct reg_sequence *init_seq;
+	unsigned int init_nseq;
+
+	const struct reg_sequence *assert_seq;
+	unsigned int assert_nseq;
+
+	const struct reg_sequence *deassert_seq;
+	unsigned int deassert_nseq;
 
 	u16 reset_reg;
-	u16 reset_assert_val;
-	u16 reset_deassert_val;
 	u16 reset_status_bits;
-	u16 reset_release_val;
-
-	u16 reset2_reg;
-	u16 reset2_acquire_val;
-	u16 reset2_release_val;
 };
 
 struct rzv2h_usb2phy_reset_priv {
 	const struct rzv2h_usb2phy_reset_of_data *data;
-	void __iomem *base;
+	struct regmap *regmap;
 	struct device *dev;
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protects register accesses */
 };
 
 static inline struct rzv2h_usb2phy_reset_priv
@@ -53,31 +46,18 @@ static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
-	scoped_guard(spinlock, &priv->lock) {
-		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
-		writel(data->reset_assert_val, priv->base + data->reset_reg);
-	}
-
-	usleep_range(11, 20);
-
-	return 0;
+	return regmap_multi_reg_write(priv->regmap, priv->data->assert_seq,
+				      priv->data->assert_nseq);
 }
 
 static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 				       unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
-	scoped_guard(spinlock, &priv->lock) {
-		writel(data->reset_deassert_val, priv->base + data->reset_reg);
-		writel(data->reset2_release_val, priv->base + data->reset2_reg);
-		writel(data->reset_release_val, priv->base + data->reset_reg);
-	}
-
-	return 0;
+	return regmap_multi_reg_write(priv->regmap, priv->data->deassert_seq,
+				      priv->data->deassert_nseq);
 }
 
 static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
@@ -86,7 +66,7 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	u32 reg;
 
-	reg = readl(priv->base + priv->data->reset_reg);
+	regmap_read(priv->regmap, priv->data->reset_reg, &reg);
 
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
@@ -104,6 +84,13 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static const struct regmap_config rzv2h_usb2phy_reset_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.can_sleep = true,
+};
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -115,6 +102,7 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	struct rzv2h_usb2phy_reset_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
+	void __iomem *base;
 	int error;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -124,17 +112,19 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	data = of_device_get_match_data(dev);
 	priv->data = data;
 	priv->dev = dev;
-	priv->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &rzv2h_usb2phy_reset_regconf);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
 
 	rstc = devm_reset_control_get_shared_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc),
 				     "failed to get deasserted reset\n");
 
-	spin_lock_init(&priv->lock);
-
 	error = devm_pm_runtime_enable(dev);
 	if (error)
 		return dev_err_probe(dev, error, "Failed to enable pm_runtime\n");
@@ -148,8 +138,9 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "unable to register cleanup action\n");
 
-	for (unsigned int i = 0; i < data->init_val_count; i++)
-		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
+	error = regmap_multi_reg_write(priv->regmap, data->init_seq, data->init_nseq);
+	if (error)
+		return dev_err_probe(dev, error, "failed to initialize PHY registers\n");
 
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
@@ -169,23 +160,32 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
  * initialization values required to prepare the PHY to receive
  * assert and deassert requests.
  */
-static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] = {
-	{ .reg = 0xc10, .val = 0x67c },
-	{ .reg = 0xc14, .val = 0x1f },
-	{ .reg = 0x600, .val = 0x909 },
+static const struct reg_sequence rzv2h_init_seq[] = {
+	{ .reg = 0xc10, .def = 0x67c },
+	{ .reg = 0xc14, .def = 0x01f },
+	{ .reg = 0x600, .def = 0x909 },
+};
+
+static const struct reg_sequence rzv2h_assert_seq[] = {
+	{ .reg = 0xb04, .def = 0x303 },
+	{ .reg = 0x000, .def = 0x206, .delay_us = 11 },
+};
+
+static const struct reg_sequence rzv2h_deassert_seq[] = {
+	{ .reg = 0x000, .def = 0x200 },
+	{ .reg = 0xb04, .def = 0x003 },
+	{ .reg = 0x000, .def = 0x000 },
 };
 
 static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data = {
-	.init_vals = rzv2h_init_vals,
-	.init_val_count = ARRAY_SIZE(rzv2h_init_vals),
+	.init_seq = rzv2h_init_seq,
+	.init_nseq = ARRAY_SIZE(rzv2h_init_seq),
+	.assert_seq = rzv2h_assert_seq,
+	.assert_nseq = ARRAY_SIZE(rzv2h_assert_seq),
+	.deassert_seq = rzv2h_deassert_seq,
+	.deassert_nseq = ARRAY_SIZE(rzv2h_deassert_seq),
 	.reset_reg = 0,
-	.reset_assert_val = 0x206,
 	.reset_status_bits = BIT(2),
-	.reset_deassert_val = 0x200,
-	.reset_release_val = 0x0,
-	.reset2_reg = 0xb04,
-	.reset2_acquire_val = 0x303,
-	.reset2_release_val = 0x3,
 };
 
 static const struct of_device_id rzv2h_usb2phy_reset_of_match[] = {
-- 
2.43.0



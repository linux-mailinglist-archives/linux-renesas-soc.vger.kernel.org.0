Return-Path: <linux-renesas-soc+bounces-12668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5429A20BCE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBA881886A7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5811A8F79;
	Tue, 28 Jan 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bssaX8fC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49FF19DF61;
	Tue, 28 Jan 2025 14:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073694; cv=fail; b=KVWVSY43n52d/EzBTfveajxA34mUfCQMspn5lln/0k5o4prtbAmd5BnPXZ8teka8NL8otNnRNqibQDuaraYn8Lh38saixEVoE9RnEuiXAzE1QR9mob3xw30TulZsJeWGjjZ4CtmypZZacUkZk8dkzOrXK8YWSOrP8i0SlApR7F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073694; c=relaxed/simple;
	bh=6kACOW5FoZlIBT6bRYvmaCuaV0mLrRlHyzRCfM9n8ME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hP7to/IlAxuZXficBdhYqNYhWKlzoMZqBGK3OfyKEcw034uBw0CGvfIFTD7zaN8IPjHR6Lrt/dSrNDBrj4L6GcxNMElRw5f78Q7EsJWP4eR6CDDc3xCD6wAAhQFH7y1iOQj3V2Jf2XGQnu6K7+rPzIhON0nb3v2cK1MOjTeCCiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bssaX8fC; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+Sucx4XdD5b/Rz3aGFOZYFSKuOxt0xeO+WsjF0fJTYTKhcd6HLG1jH669v1Com7w0bUR2MkC61taTYn9pOQvGbsq/8Qb70ay7nj2AIdIUM8VZaQ5MVL7LfYNmoUZhCktBPRrOf3lYaayKpe/AEJ02apzMB2dth513PTzFluaQ6NBCEzKl9LBJdVO2/o4h6iTTRJx1L0HVt+LFcUuOUN4bo1due7u3jPtAX9zgv+8Ioe8/6S0tOTzaY5EdWG54eFaSCdK2spv4ElScy6kDSouSTRQo40JGnVhzv1dlMvLSXrHDeQUsVg6kN9u3bjghoAgVOrNRxxkNZZpYSIqF/zyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kACOW5FoZlIBT6bRYvmaCuaV0mLrRlHyzRCfM9n8ME=;
 b=N4GglDTxxpX9wLREk0yTbaAKrJP9mSVCo8AxplfzB0GG+o1x67t4GbydI//eu68fVjRTFwSIa8vW2f8FSCC+VC4W6Hgx4SeSPfs9VCUAC7K3glkRIzgp3s8EnlvHUOtA1VD1+Oye8LETiCRMJYhL22VbIpveTd+8+kJqAA2Iv9wuMFKs4g7fYsErKXCY3ZhRoNKKfLAtbNZ98mpl0tWgDg4C3H2R1o14s4gi0wZGZW87UJj/nYNlN11gvw4uPFFDAMwANpFB7BlQK1xu+P1V613IXBPYu1tuTfsMQ192PiuAB5uxptpjqXkRrEfynqDGpVHT/78RJDGpeqB2NRNiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kACOW5FoZlIBT6bRYvmaCuaV0mLrRlHyzRCfM9n8ME=;
 b=bssaX8fCivCF7xypzHtKGSX87kgfh0RlhqY2S1NqwrOrro4tbZFkgSD+kkVIHZY1hdhuGodOM+itrnBCsywMr/L+9JmDF9WYyUBJvZy4FqPwQQ3BCATatzsyZDLyCy+4p1R8OIbg0oiPezTYwzO4xnIinwJm/WYqfiZIZtPLnVw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12680.jpnprd01.prod.outlook.com (2603:1096:405:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 14:14:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 14:14:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
Thread-Topic: [PATCH 7/7] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 SDHI1
Thread-Index: AQHbb/jE8FJH5b8cn06xmQGxemva7LMsOykAgAAA8iA=
Date: Tue, 28 Jan 2025 14:14:47 +0000
Message-ID:
 <TY3PR01MB1134636D8D5DC98A2766D735786EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdXQ3t1gNXnc_3gabi7uX6HH6pSf372hrkuq9L=dnhbD7A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXQ3t1gNXnc_3gabi7uX6HH6pSf372hrkuq9L=dnhbD7A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12680:EE_
x-ms-office365-filtering-correlation-id: 6eeea4f1-003c-4bcb-184d-08dd3fa61f42
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SmErTTZRTFhyYXdRRWFiRFd0RkZEZnlqU1FHSmJXUk1XcEsxdDVsb3plVUdS?=
 =?utf-8?B?TTRrV2lpNU9LcmhVN3JUQ2paalNKRjd2WFZzcmNxL1VsNUJuRzE4SGtGcUZO?=
 =?utf-8?B?RHFVRWFkWTJkVG9OR2NublFKaS9JS3dUdnRjSnlDZEV2emdGejBqYnUxZTRr?=
 =?utf-8?B?aG5mZWFHb0pMZjlQdDYrRCtsODNiM1k3ZGVwOVpzVnN2cEZZRlB0NHJyRjBU?=
 =?utf-8?B?eGxIOEwra0Y2L1VvcUJ3Sit2VmhCZlJqZXJYbnVleVVzVkZXaTNCSWVDZERr?=
 =?utf-8?B?MW4vNjNwRWNlQ0xDbWhzeWZiMXVOZGdwQ2E2elExb1pXQm02dFJqYWtPQ1A2?=
 =?utf-8?B?WlhJWXZPRlhUeWlKdFlWT1dYdHNvV0padFc5a0JsMnNWdkN2YVpkUG15SDFZ?=
 =?utf-8?B?dmFVdHVVb29ua043NkJDS1Zab1A5Tk9aOUQ4aStjNTdDcWl1dmVkMGlHblJp?=
 =?utf-8?B?NmkxU2N6YWJja1BPZ0I2TEEva1ZWVXBiaE1wQWJ2bVBKMzZuWWExNVJ2Y1lE?=
 =?utf-8?B?bWFMaVdDclhqS1BBZGV6TUFrREx3L1JqbFRucjg0anlqMGZ2RmRtVlhpUmZk?=
 =?utf-8?B?RnhnakN4N3hTOWhaZWVRbk1kQjZNSC92Y2txMEk4RmZ3dmFLMnYvYjFDQzdt?=
 =?utf-8?B?SlRGS3h3MVhGT1FzQitmdDhuYVArSVlxN1p4MmlDV2RvNGN5SFpDV05wV0N0?=
 =?utf-8?B?VkdHYWtTT3ZjTHdYRnJBRlR1WFJBQ1JZVkNOY3NGMU54cjhhdW9GSHB1ckxH?=
 =?utf-8?B?RUVseVozdmQ0N1lma0E2TUpwZHAzNnR6R0g0SE9RTFViTHZjd1dMQ3RGM0ts?=
 =?utf-8?B?UitjSU5HdFgyV2dvOU9OYUVPNmw0SkV1SnlvL0JKZTBSdjFKbmNaM2p5dnhI?=
 =?utf-8?B?a0cxVkY1M1pxbktPMWVYbnBGMTYyYXFYMFBxaWRwMDJtblNnajMweURjc2ho?=
 =?utf-8?B?UjFHWUQrSy9yZU1ndG44dGcvZk5Kekl6K3RXMUxmTU1rZDY3dHVtWTNzREtp?=
 =?utf-8?B?cFBDdG0vbjgzS2RNaW81UlpydG9BTEVXWkdRWnVkR3E3RDF6Tk9Eei9GTlJ6?=
 =?utf-8?B?b3NETko5SVlzcjNod09oWVB4U0hjZWl6RnhVUjRnYkhEdWJPR3pDQmRKeXN1?=
 =?utf-8?B?YStndjUwMVMwaFlsamRaOFg4UmFnNnEra3RVb3JwKzA1OGF0QXIvTGlTSW9m?=
 =?utf-8?B?amV1MTRyRUd3Z040K0pUYXVBQmo4MHlWL24vNEdnNWUyeUc5eUxYU2xqdlFG?=
 =?utf-8?B?Wk1VUEdOUWVHRWVaVGxTM0htZkJHdUxSb3VTYWlQMk9hYTdGd1Q1d3pUTnJi?=
 =?utf-8?B?MU41cmEwdHJ1QzBWUGhhR0pUTEQyY0M5QnAwWHJaQnFYcUpDSnZManlZT2Jj?=
 =?utf-8?B?WTkxZGdpd1R1VDR0RUh3NWNyR3AwVThDc1RvbERscGEyZEpkRWdDcWZDZitw?=
 =?utf-8?B?RUNnb0dUb3VYZHRCclBTMmloWStlM0UxZTRxSlhFTHNoK2xMMjVpOEhqa2FL?=
 =?utf-8?B?UTJWYmxzTjNWMUx4cTU0eDVFLzB4L0FnNjBqTVZTRWpSTlJxZkd0QlZHZ25F?=
 =?utf-8?B?U0NzSlVXZkt6VTBPWm5PamZqd2x1emZNRngzRTNnV25Rem9aRWJjR3lhZFNu?=
 =?utf-8?B?L3hiOUpNK2FUKzlwQWFjcEtGZmdFQlM4N0VUVCt6UVZLWlJNWXZUcWpNTVpB?=
 =?utf-8?B?U3A5T0hQQXVvMWRHbDcvMlpJalpiSS9IN0NtdEZjN2pjRlFNWmsxeXhkZURx?=
 =?utf-8?B?OVptV05YM1p4K3hRYUx4aDdRWHNJV01vNUZoY3pLcFl3WnpETXJPeDVNeVFH?=
 =?utf-8?B?bGZkb21jMCtLbHYzaGp2d0I0dHhkRS9jdTZrTldNWTk0Zmp3T1YvSXo1VDZn?=
 =?utf-8?B?UzhWWXdZUEh1cmFPTG1LL25lWHNJdVVGNDVENWpSN1Zwc0dTMXBTVVplWXh0?=
 =?utf-8?Q?JNITjurjD4BBkLkBDQI3n6w1Z+AJhjy7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UjJLT3lUc2tIVGtybVV3bTEzQnFvd3pqNkRBanR0NkttdFZUYTRuaXR6ekg1?=
 =?utf-8?B?dEkrK2xBcEt4aEFhUVNCbXM5VUx2eW9FeWEzdUw0bnlRZW9WYlJRQVZaS3FK?=
 =?utf-8?B?Z2NCWkMvdHhVcjJJVXVFMDJBWjlNL2VOTXFEMk5uRVZ3cjJxSXlvV0taZnhE?=
 =?utf-8?B?bm93MGNYYURjVGlMMHlvamZldjhRY0UzRGNiUmIyTk54K0g3WXNlNTlPUFBO?=
 =?utf-8?B?VDk2dSs1ZTZ6OGhkUDdia0pTUjN1Q3dHb3FadUQrclVCZE9XK3NXZFQ4QUts?=
 =?utf-8?B?OUk1czBGVzBiVE8wcnU4ZldRNm41VDlHYTRDRC9SdjlXNWhXMHY1ODYwbHln?=
 =?utf-8?B?MktiTk9sZE5US3FuTEJSRlhnTnlDd3JmcVgyam5CRVVCN1ZkS3RUYWRnYVF2?=
 =?utf-8?B?RWxBUDZjNzZlRlRiQ1BBdmxJcXd4dTVxRTQxakVBbHZZMkpaNVhpanhsVmZm?=
 =?utf-8?B?dzk3ZXZON2h5cUhBM1VBZXR0VlYxWFc5T2N1UE9vZ1dTVFdsdHl5ODZxNTk1?=
 =?utf-8?B?TmxWUXJ5MWtxRUNZTEJzNk1ybWpoSHNCTEo3NzZsVHNXWk1yRFNlK2E1dUQy?=
 =?utf-8?B?bG9ZQzErcUFMWUpPeW01U1o4eFV3V1RkQUN0REsxNHhEaDl2TEJ5aDlnSS9t?=
 =?utf-8?B?dDNjSXdwYTJDbHg0OU9kdUh4WkR2dlJSV0xvamQ5bGxDVkh3bFBxRUZVNmM0?=
 =?utf-8?B?M0szbmd5bGYrNlZjaXZObzAzVlFpamI4SHhxM0x1cnQwMjZMQmk0QU9LSENs?=
 =?utf-8?B?VXBwUEdURG1TWER0eTVVRGdYRGJFWlhjSnMwb3NSRDI3WVoybzdVRTlxb3Nj?=
 =?utf-8?B?M3l1YW0ySXA5SklkMVNGWG43S3NBNHNmaEE0Q21SeWV4ZkR2NXQ1K0xxckpK?=
 =?utf-8?B?OGFaS0o5TUJnQXNnVWZWK0sraWhrbzFxRFJ2WjNKRXdhRzBnMTZkbS9lQ2RE?=
 =?utf-8?B?VlgwVFJXZnkyV2xhaXlaQnp3Q3h3SkQzbFhja1lVSWFSZ0o3RU9qQ3lxVnhx?=
 =?utf-8?B?SVdoTDRGb2lqMC9FZG1MeDVhQTN5TloxZFNUSmtyZ2FDaEd4SHhUcGc0NlFQ?=
 =?utf-8?B?TzdBNVVxYlRkUWszcjhFZVY1eTJsajZsRzRJUnFSZjZLbW9oSmtKWm5VbTNt?=
 =?utf-8?B?NFhLQkZSNlF4czM3K25NNEdVRXhERkJyOE80ZldIdEtEMUhZT2VQSjB0Umpv?=
 =?utf-8?B?UEVCZUFxM1dmRWVOT0t3eW02Q0xiaUxHT0VESWExeG1TSGE0VkhCUkJnMlpW?=
 =?utf-8?B?c3liVVZyaU5iQTgxUXcxcVJka05xbGJnajhadUUxUEh6YUl3elRkL2ZTQlBw?=
 =?utf-8?B?SUMzZHoxQlJ1WEprMk5vMmUycXdGeHhaY2F1eWdWZ1FvZi8yYkFKdHhZTFNv?=
 =?utf-8?B?L2tPT1lSdk5URjloRlVFTVZuT0FrYmlmS21vZ1hPdUVMaGRGbS84TWZPVzBy?=
 =?utf-8?B?a3pSQWg2eDAra3oxNGtMdTN5cEtVcmJCQ25kSFVxRnZndGg3TlZiVlRyRDNI?=
 =?utf-8?B?dzkzTlpRZ3FkWWdHZHh1NlRTZUZYeWRGd3AxbEdSUDF0RTdPVXByRlpCRTdR?=
 =?utf-8?B?Uk81UUh6WE15MEZZeFJVbHJWeTRSVk1jbGVCK0NmU2xZOEVKdE9MVWlHWlFP?=
 =?utf-8?B?RUxaMTBHM1RiMVZYa0J5QUtaUlhGaEhLYVoycUdaUzNNSmd1eFNFbGwyQnAz?=
 =?utf-8?B?OGxYQlpYeVowZE11OFJkY0FYYnJaTjJ6Q3NRKy84TGZwVVpHYlByc1Y0ZVVx?=
 =?utf-8?B?WFlDTy9oOXBNNEQ1eTJGNnp0eTFkQmcrOGIxcThaeDRDZUVHL0ZyNzl1cEZO?=
 =?utf-8?B?aHJvbVB2UTdDKzV5bUJUVi83MXQ4bzFNRWJHYzZxUE5mNnFrNWpnc2hEazZN?=
 =?utf-8?B?czJmQmlkUWQ0MWp0bG95YVFmdkRBS28yOGtxTGgxYkFxdmtwYjlteE01Ny9I?=
 =?utf-8?B?KzliZ2kycVM0K1hiaWFxY1JmdVd3aFpUcUJaQlh3UDJVcENXT1lXWWJ4R3pn?=
 =?utf-8?B?YTZWVzNqcHFiclJuS0dCK29sT1MvcU9OdWhxZjJienRQY0Jkb2ZhelE2MzhC?=
 =?utf-8?B?R1AzanF4SUQyV05UY3JhM01iYTI5TmFLTS93YVpUZXJOMU9yUE1nWHBTU1ZG?=
 =?utf-8?B?RU54V21LVTI5TGJ2WUxqNGJtVXZ3cml5eHBqVmt2STA5WEFyejhLRjZnaEFE?=
 =?utf-8?B?b1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eeea4f1-003c-4bcb-184d-08dd3fa61f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 14:14:47.7879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FVmkmPITovzH8N/H7D3Od9IVb9oGL51gGE8c8fntrvbEdPtQ+7rjEk3PD0t8LyhW3e6kZsDdt+DsVaLAb4ulVM9lznJEdXor43uGKh8WoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12680

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxNDowNQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDcvN10gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3ZTU3LXNtYXJjOiBFbmFibGUg
U0RISTENCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4sIDI2IEphbiAyMDI1IGF0IDE0OjQ2
LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEVuYWJs
ZSBTREhJMSBvbiB0aGUgUlovRzNFIFNNQVJDIEVWSyBwbGF0Zm9ybSB1c2luZyBncGlvIHJlZ3Vs
YXRvciBmb3INCj4gPiB2b2x0YWdlIHN3aXRjaGluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3Ig
eW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5
YTA5ZzA0N2U1Ny1zbWFyYy5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDlnMDQ3ZTU3LXNtYXJjLmR0cw0KPiA+IEBAIC0xMiwxMCArMTIsNDAgQEANCj4gPiAg
I2luY2x1ZGUgInJ6ZzNlLXNtYXJjLXNvbS5kdHNpIg0KPiA+ICAjaW5jbHVkZSAicmVuZXNhcy1z
bWFyYzIuZHRzaSINCj4gPg0KPiA+ICsvKg0KPiA+ICsgKiBUbyBlbmFibGUgdVNEIGNhcmQgb24g
U0RJT19VU0Q6DQo+ID4gKyAqDQo+ID4gKyAqIFN3aXRjaCBiYW5rIC0gU1dfT1BUX01VWC0xIChT
V19TRElPX00yRSk6DQo+ID4gKyAqICAgICAwIC0gU01BUkMgU0RJTyBzaWduYWwgaXMgY29ubmVj
dGVkIHRvIHVTRDENCj4gPiArICogICAgIDEgLSBTTUFSQyBTRElPIHNpZ25hbCBpcyBjb25uZWN0
ZWQgdG8gTS4yIEtleSBFIGNvbm5lY3Rvcg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gIC8gew0KPiA+
ICAgICAgICAgbW9kZWwgPSAiUmVuZXNhcyBTTUFSQyBFVksgdmVyc2lvbiAyIGJhc2VkIG9uIHI5
YTA5ZzA0N2U1NyI7DQo+ID4gICAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMsc21hcmMyLWV2
ayIsICJyZW5lc2FzLHJ6ZzNlLXNtYXJjbSIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgInJl
bmVzYXMscjlhMDlnMDQ3ZTU3IiwgInJlbmVzYXMscjlhMDlnMDQ3IjsNCj4gPiArDQo+ID4gKyAg
ICAgICB1c2RfdmRkXzNwM3Y6IHJlZ3VsYXRvci11c2QtdmRkLTNwM3Ygew0KPiA+ICsgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInJlZ3VsYXRvci1maXhlZCI7DQo+ID4gKyAgICAgICAgICAg
ICAgIHJlZ3VsYXRvci1uYW1lID0gImZpeGVkLTMuM1YiOw0KPiA+ICsgICAgICAgICAgICAgICBy
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAg
cmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAg
IHJlZ3VsYXRvci1ib290LW9uOw0KPiA+ICsgICAgICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlz
LW9uOw0KPiA+ICsgICAgICAgfTsNCj4gDQo+IENhbid0IHlvdSBqdXN0IHJldXNlIHJlZ18zcDN2
IGZyb20gcnpnM2Utc21hcmMtc29tLmR0c2k/DQoNCk9LLg0KDQo+IA0KPiA+ICsNCj4gPiArICAg
ICAgIHZxbW1jX3NkaGkxX2V4dDogcmVndWxhdG9yLXZxbW1jLXNkaGkxLWV4dCB7DQo+ID4gKyAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWdwaW8iOw0KPiA+ICsNCj4gPiAr
ICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiU0RISTEgVmNjUSI7DQo+ID4gKyAgICAg
ICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICAgIGdwaW9zID0gPCZwaW5jdHJsIFJaRzNFX0dQSU8oMSwgNSkgR1BJ
T19BQ1RJVkVfSElHSD47DQo+IA0KPiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDln
MDQ3ZTU3LXNtYXJjLmR0czo0NC4zNy0zOCBzeW50YXggZXJyb3INCj4gDQo+IE1pc3NpbmcgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KDQpPb3BzIG1pc3NlZCBpdC4gSXQgd2Fz
IHBhcnQgb2Ygb3V0IG9mIHRyZWUgZXRoZXJuZXQgcGF0Y2guDQpJIHdpbGwgZml4IGl0Lg0KDQo+
IA0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgZ3Bpb3Mtc3RhdGVzID0gPDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICBzdGF0ZXMgPSA8MzMwMDAwMCAwPiwgPDE4MDAwMDAgMT47DQo+ID4gKyAg
ICAgICB9Ow0KPiANCj4gSXMgdGhlcmUgYSBzcGVjaWZpYyByZWFzb24gd2h5IHlvdSBhcmUgdXNp
bmcgYW4gZXh0ZXJuYWwgcmVndWxhdG9yLi4uDQoNCkkgaGF2ZSB0ZXN0ZWQgYm90aC4gSSBqdXN0
IHdhbnQgdG8gZ2l2ZSBhbiBleGFtcGxlIGZvciB1c2VyLA0KaG93IHRvIGNob29zZSBleHRlcm5h
bCByZWd1bGF0b3IgYW5kIGFsc28sIHByZXZpb3VzbHkgSSB0ZXN0ZWQgU0RJTyB1c2luZw0KTS4y
IEtleSBFIGNvbm5lY3RvcihXTEFOLEJUKSB3aXRoIFJaL0czRSBib2FyZCB0ZXN0aW5nIHNvZnR3
YXJlLg0KU28sIHRob3VnaHQgb2YgdXNpbmcgc2ltaWxhciBjaGFuZ2VzIGhlcmUgaW4gbWFpbmxp
bmUuIA0KDQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4gICZwaW5jdHJsIHsNCj4gPiBAQCAtMjMsOSAr
NTMsNDQgQEAgc2NpZl9waW5zOiBzY2lmIHsNCj4gPiAgICAgICAgICAgICAgICAgcGlucyA9ICJT
Q0lGX1RYRCIsICJTQ0lGX1JYRCI7DQo+ID4gICAgICAgICAgICAgICAgIHJlbmVzYXMsb3V0cHV0
LWltcGVkYW5jZSA9IDwxPjsNCj4gPiAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgc2Qx
LXB3ci1lbiB7DQo+ID4gKyAgICAgICAgICAgICAgIGdwaW8taG9nOw0KPiA+ICsgICAgICAgICAg
ICAgICBncGlvcyA9IDxSWkczRV9HUElPKDEsIDYpIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+ICsg
ICAgICAgICAgICAgICBvdXRwdXQtaGlnaDsNCj4gPiArICAgICAgICAgICAgICAgbGluZS1uYW1l
ID0gInNkMV9wd3JfZW4iOw0KPiA+ICsgICAgICAgfTsNCj4gDQo+IC4uLiBhbmQgZXh0ZXJuYWwg
KGZpeGVkKSBwb3dlciBlbmFibGUsIGluc3RlYWQgb2YgdGhlIGludGVybmFsIHJlZ3VsYXRvciwg
d2hpY2ggdXNlcyB0aGUgc2FtZSB0d28NCj4gcGlucz8NCg0KU2FtZSBhcyBhYm92ZS4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K


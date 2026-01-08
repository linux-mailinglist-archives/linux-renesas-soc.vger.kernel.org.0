Return-Path: <linux-renesas-soc+bounces-26411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F8D02900
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 13:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A40303443C37
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 11:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458E33D6F32;
	Thu,  8 Jan 2026 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wUGpuk30"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9353D6F3F;
	Thu,  8 Jan 2026 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871851; cv=fail; b=Ca7zcVIisaagcRNY2hMY5aOR9Equ/jbaMXLUDmpsI+YUgdqVDPa7NtXX2rs9iTrkUx+mTPbs5UyHW0R8UyPYka5P8LRBXqTcXUPbtz++QcI704JizNNQtSkegOU63SSE/AUbrIaw34nYTQMKX/nJizQJVcaKp2m2pErdl7wS5Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871851; c=relaxed/simple;
	bh=oJAlof0fNUiebzgkRJ9BmALwcYMLFYWPdpcXjmli3+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FNmcFvrCgG5GfeXagvqyJmRm/YugAW+vCeaJl6Eob+3mWGfVPoAN6iFkSEG1asi8WaqNb4poS3Ta3xJwHfBsr8a4tbWETD6jPxQEwK51R6U7Y0Qds8P4ukQxkrveA8HzBA/TjQjw6FY6xPJk8rbsZ+CWfgFQ48eDGPGVlV9d3G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wUGpuk30; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud8XVYLa5YRHlCXeeHP+m5k+rDZ40pAYND3/UAXkOh9bMgn5lxm6GYqMoX/ceMIljlKho+L/cSaZey0JE8lzzIFgd6U99sTqfc5bnRwZcWJivyJWRBG9zzpMAmdhF6YgwiwTPmYKHJnOPCheWcjUGWOXfR2JZSQwOvh8NMJ7xrz4+yv9OzzgM4nhFsxmPPIwEbNUyy+Y0s5T9vQ9rAIBnNZNsX5TiHnn9yH+2x4WlzL8q78x1qt5YrkUgXe7I5E1nVX/CmOMIhaoYSsRWOYdlGuyGEE0bmeEMumlKwqC4ERKLSzQaJ8nolN0wsmziDZxo+wpABQzRu8cb9bOhaTYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJAlof0fNUiebzgkRJ9BmALwcYMLFYWPdpcXjmli3+s=;
 b=cm9a9vKv+W8dJGbLS0BH8KX+DdzjhcOyQ6aL90grhqQMQx3WKx4TrQy4c8VobbNvKSeU4oUIrbag+fhCuzhfVGYSg8neQx1yPDSw2X3W8ao1NU0QCNrgoepEogLcUkb3WQEMsPVWMxbc0f0eYOgH3B+esEabTD8O/+NO2rmI6dLziGFKZwreq5/vUWmXbJHSLUELWkWwQe7fp4igWTkTwnvcsgZ3sB1ZcxHXgxNlEuBLD5QtEH0QRLor69v7UlhbA5fv7qrYf7ptnixTmOCqxxfJhmkgriHRI+DdaQBJBVjJbqe3Pl9znycbYA/wUSMOISsL7SfoLIn8GeRbiNeXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJAlof0fNUiebzgkRJ9BmALwcYMLFYWPdpcXjmli3+s=;
 b=wUGpuk30s9U6DLB/B26NWt+bfQNg6FSsTRfBxZ5D+nr+6Ual8YH+qJwpQaUZ0C+2FTkhZ9E6bFiwhPoQJtDWNjfYSj3iujRRDpKI7BmKl5RJWWFwJTQWFVc7etvbxTIAQd9MCbST6/+hbl+PMhJuOBW56Y+MmdpjQzL2eWKyRsw=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB17397.jpnprd01.prod.outlook.com (2603:1096:604:44c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Thu, 8 Jan
 2026 11:30:40 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%2]) with mapi id 15.20.9520.000; Thu, 8 Jan 2026
 11:30:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
Thread-Topic: [PATCH 1/2] clk: renesas: rzg2l: Deassert reset on assert
 timeout
Thread-Index: AQHcaCthOp37d4SzVUKYeRjGPYgDY7VGvcOAgAGVUoA=
Date: Thu, 8 Jan 2026 11:30:32 +0000
Message-ID:
 <TYCPR01MB11332C28E89179D2E852A31638685A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
 <20251208101356.101379-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWdDQLYHm825t5Z3r2cwhUHAkMdgbhuF4oKhUqvnddHgw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWdDQLYHm825t5Z3r2cwhUHAkMdgbhuF4oKhUqvnddHgw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB17397:EE_
x-ms-office365-filtering-correlation-id: 17ba97bf-2517-4c53-cd24-08de4ea955b6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bjkyUGQxTGhEaTNkcWxxbHdWMzNvMGhTcHZ5RW5HVzZ1U2dJZEFIK2E1Zjl1?=
 =?utf-8?B?eUY5clY4MG9KTHcrS3ZTV3J3WGRTa2QrQVhKM0dMa1AwclZDVmZiSUhCTTBo?=
 =?utf-8?B?TlhRYWhyUzRwS25mSFJsVUdxbHhiYTVzSms1cnFBeFpDcVpGTDRuOGgzLzhI?=
 =?utf-8?B?cnZ3aXdMNWl6UVZwNVhUem9WRmxJQzhOSS9NdDJHTFdRUUFPc1BxaERNQU0y?=
 =?utf-8?B?a2xIM1dHZWdZVElCNm9WK2JoZHJEU01Hb3dOYWhhMU9SQU9kSkNxRUZYK3Y4?=
 =?utf-8?B?bjZQTzBNYlFmY2xNWjJZSHBlUUl6T3phclRQMktJR0sxYjZHbVVEUUFFVHRQ?=
 =?utf-8?B?SFBXTG5WWXRjQXVjTHhDWjZNUFdKSmw2Q2RScHo2eW1XcDJoSFhLY1RGejFa?=
 =?utf-8?B?Q0sxNDJXbXVnbmVsRklXTERzWHJBQTdMQWg5cUlsa2tnSU5MMVRvaVFBRy9k?=
 =?utf-8?B?WVljWWl5dGZLTjBkcGdEa2h6WHA2OTFLLzl2Q0VNZUdzcml3SGtNQ1BVSkha?=
 =?utf-8?B?VThiZEprbjhFdHloY2xSTWt0VnRQcHlBWjZvOGtTNmJrOUt3VVB1SUljWDEr?=
 =?utf-8?B?cGpLRkNIS2R2NGhzL1BxOXZ3YlN2OWp3d3hvQXFldG5LcWIxSWY2U2lieGp3?=
 =?utf-8?B?VXN6QlJaSERGbDJJR1lpbTVhdHBpQVh0TUN3N3J6VGdzczYzR3RVVE9CTW50?=
 =?utf-8?B?WFFDVEtxOTFDdWRVckh6NFREZXhDVE1Zb1BwUkVhY0FFTHoyUjhsalJRQWhH?=
 =?utf-8?B?U2ZwcEFBMldHSm05TlcrdU1uK0gyU2pORUppR0FhY0owN3VjR1hzbmc4MW1H?=
 =?utf-8?B?eHR3RHVERExObXcvN0oxT3JHQ1N3STNYbUEvZVVURTdHekhFenBBTU5YOVQy?=
 =?utf-8?B?SFhUbDBpMk5HVFlLcjFndDEyVmVobjhqaHZndFllYTlMN1dUMkd2SDd1V2Nw?=
 =?utf-8?B?eEdqVTVrVjFiR1AvNHFLOEN2VjQ5SGJ0eUdFcUJacGZQemQwalZkV3Q1cHUx?=
 =?utf-8?B?dXc4SGRwVDh3Q1h5QjluL0lJYUdwUkpMcitiZ3ZuN0FJenQ4TDN6RVd5SmI1?=
 =?utf-8?B?em5Hc0FSblpsV0tMYkFwOUJMcG5YZXNyMWFiNDc4dzRDV1lUQlNONUZSTmxR?=
 =?utf-8?B?WHozbUZWZ290QzEwekFxS1ZJUkh0OUphdGEzSDREbFFYZXZFb3N3d3FMNHh1?=
 =?utf-8?B?cDZLS3BwWDBPNG1lbW9uQlV4TnNsVDhZRElnWS9tbEhOQ2tvUk5FY3gzTzVj?=
 =?utf-8?B?S3dTMjJjeHMyaTNnQnRVNmRDMXMyZk1QY1BhQ3hKRUpPWENWWTNLUmZZZUVX?=
 =?utf-8?B?SGNjUFRTZW5Hb3RldUlxNU9XUzBGcmd0K3dzTWRLb3VRbjVaYU9VckxhN1ov?=
 =?utf-8?B?L2RUc09yVFZJRUhSWHFramRLcHFBc1htS0N4ZktBVVVyNFF3QjRpTHI5MGdF?=
 =?utf-8?B?Z2RvdlRGR1VaZ25QVUVOVmhHeTRiakV2NGVRWHBOSDNtWlVGMW9lTjRSRVhl?=
 =?utf-8?B?NXQ3dHREZ2VCV1B3MXFKSW1pTDFSbjFXNFZRbjNBVi9ubTJtczk1UVF0eUQ1?=
 =?utf-8?B?UFoveFpWbG9RZGRnTGtaaDJRSWFHUVdodkVtOGc4WnVOYitTZy9KTnpQalBu?=
 =?utf-8?B?eGFYTjNhSTA5VXVjM3dtZUQ0KzcyVGwrZ0dIS1FiMVNhWDI0V2V4SEJPRHNX?=
 =?utf-8?B?WlBTT01xOFVYa3BBS3RFWisvSDA2M2NRbWlOVFFpZlBWMlVJUm5VVEFTbWZn?=
 =?utf-8?B?cjl1OC9OZGVNVCtLNFVCVnpNSks2N3VEL1UyQ1R2S21RVTJQWWpPcHlxVjlX?=
 =?utf-8?B?azN6aDBEaS9vT0tKNFpsbjVmOTN0YTNFdXVmQmJvM2VFMklCWGNERXBLZHBW?=
 =?utf-8?B?OUhOK3Q0c01NNStQNmZyYTVXeDh5Q3FXOVREZTFDQ1crRG53YzJyMHdKQ2ZH?=
 =?utf-8?B?TWlLRzErcEhETGpsMkxmWlFBYWVWRm9QM2tMTEhXZktPd29PRFNTZFFaNGZv?=
 =?utf-8?B?dzh1cVJNUTJpNm1QSityQlAwOTlwcUZkSkplMGQyWEZMUHdCcFEzY0Z5SVBK?=
 =?utf-8?Q?cfjew6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bDFJUll0a3lhTTZNaTdKeTBQVzU3bEtPM1BHK1J3ZGtBV2hHLzJJaVlZZjJx?=
 =?utf-8?B?NWowVFhCU3pmaVBtNm1JRnVjUTNoMGhnVzlXSkd2dU1HQVRITjFxYnlsM0V4?=
 =?utf-8?B?VkdranZid08wVEJhUE9mc3dJcVdFemJXYzNod3dWMFcrd3JaU2crdDE2S0pE?=
 =?utf-8?B?V3A2citTVlNwbXlZYnBmWGtTNXBwTVpTdEg2UzE0eXhVRmwrYzFiYVNoNVRy?=
 =?utf-8?B?eUI2OGp5MC9ncHlld1BaOHZSRVpvOEdQQ1BzWUgwNC93elVkaUVYR1BqVjl6?=
 =?utf-8?B?UHcxN0dyZkQyYnVPOXdEWElIbVg4MmJyMjZqUnN0WWpkQTRxTHhDRm04V1Jp?=
 =?utf-8?B?eHpuZnZUaFpHYUJVOVo2dVdTR05EMFZmeWJUelZxVjFnS0gramdhdEx2YUZT?=
 =?utf-8?B?clVEa1crU1NuZExtZ3ZoYWlRbHVkU0xuamxSalY1bzNJaGZEZ3ljeThVSTJy?=
 =?utf-8?B?ckFFZHl2cnVySWNab1VwR0dEek5XWHdzQngyOXJsZzJMNE9kMFBPQlZmY3pS?=
 =?utf-8?B?Tmo1bUV4Y3N3QStXR3FGQ3BCUUZtcnFUY00wUjhnenZzdFJSV0JTUzM2Qkh3?=
 =?utf-8?B?TjhlNDN0YTJtbSsxQjdkTklUS2tWZzdsSkZQK01rc2JlWDJrTm1CK1JmOFBa?=
 =?utf-8?B?Ymw2MlpUdUorZU5QZ0dkb0diSVROZ1d6T1F5aXBCeG9qZU54d1VpeGVxbjYw?=
 =?utf-8?B?MUd5SUZnTjZBOS9JbEwvODhZb1BVdWFSaDFsYXl5MUs5MzkzUkFVZ01BMERn?=
 =?utf-8?B?dzZVRkxJZ2pzYkxyd2JEeWZVVkZxOEQrcktzRmhqZC9VSXc3ZThzWmFESGNo?=
 =?utf-8?B?R3VvdHc4YlR5ZTVqU2lSazgwUmkvQ28zYitzR1F4MERZYlVyVkc4T3VwdnNN?=
 =?utf-8?B?alZJOEliZzYwenQ1bkYrbU9JZ1VNbjRQL1ZaKy9sWWRBdzNaSytVWTRvQ0t4?=
 =?utf-8?B?WkpINHdxdHhmUk5JdWE5TEhKMEVIdjZqQmJ3QjRGUjJNWDFjakNzNHV4RSta?=
 =?utf-8?B?MzMrOW1ISFQza3ZuY1VLM3dpKzJjWWxscGtKN2h0dkdVWkJ0ZnNVeFUvNWgw?=
 =?utf-8?B?Z3d4cUV6cllad3RjK1NvYmtwTXBqTHJ0VStycVZFWXhFaEpnclc1ck1lOXRl?=
 =?utf-8?B?dWJ4M1JiRGNuM1FrK1BYVTRyMit1WlV2QjYrYW80Wm5jeERaTFFBRi9YWGZK?=
 =?utf-8?B?VHgrMU5YQ0VhcVNEZ25SQUY0eGw5bXNDVjFQNDdndGpsamI1MmEwUW04VjZw?=
 =?utf-8?B?Vm9XWCtNNmU4U1l6TWNKUlNKa2Q0Z3lrOXkwS01hK1VFS3VzZWYzVFVKVEdB?=
 =?utf-8?B?ZnNLTlN5S1hBVU9lc3BJekU2MHI3N1A5NHE5eEEzVjE1TUswVHRMN3Ria3hu?=
 =?utf-8?B?cEpONm9MaEMvRkgwU1RhOFlGSXJudG5KNDA2anE4N0VQUkNOd0c3V09lK2tk?=
 =?utf-8?B?NzQ1UENnakcxdTdRell4UGRkT1AzZUsxWjN3N3lad0dTYkt2YWF3S1lncHhn?=
 =?utf-8?B?NXVWaVRRRVovY3k5YmhleEQwbXgwZzJzZEh1YmlpODB2dFRrNXUyM2FJZVVN?=
 =?utf-8?B?bkdpMDJmSk5CbGZwTWw2MWJEalRUMmFqTlc5VEpvOGMzRG5vc1R6RURwNmFS?=
 =?utf-8?B?RWF3aCtXUENFYjZ2bktCeDdnVUZxZlAxeGlMckN4VDg0TUdPVUNLcUhlVldR?=
 =?utf-8?B?d2lzUExkNUFUMzREK2lNcHZESjJKNUJzZ3N4VkFJaSs3VlNhS2pzQkZtakVC?=
 =?utf-8?B?Ukd1V0ZVRGZnU29GUnAvRUhra0JkVStlMTNCaC9MV2hLRm1vdE9PVTZkT1Q5?=
 =?utf-8?B?elN1SkNRaHVKc2pnVVladmZPaks5MUladk9WZE9QOTNmR1U3alFyenIrR2ds?=
 =?utf-8?B?ajVKaFBXYTRwMFNVdUEyK2U2NFZ6NENPUm5mQnl2bE0rWnRUVnhnTnlVSyt5?=
 =?utf-8?B?WTNsTkhDZldTZE8xWTZwRklCU2dqUksvaXozNUJlSHlyb3Ewc2xvMXM0Skcx?=
 =?utf-8?B?ejBzeGZoMmVWRDZYWDJsSlJHYlduUkpVOHdyKzRLVmtWKzRVNGJlUjFpYXNS?=
 =?utf-8?B?SWFwRWJUUnUrRTUzRm5zcWg1UE5oVXNWUUV5amNJWGttTXhDNjZ0SXJoRTVw?=
 =?utf-8?B?eVdQd09tUTJselQvcWhxOEVPbEF3cjNPVGM5bzBxMGVrUEtaN09ENWhLZFVC?=
 =?utf-8?B?VGppNDIxNTR5TDYzTWVYanU2WkxGV3RtN0h3dkE5WW5DY3RqdksxTnBGMGEz?=
 =?utf-8?B?cGswL0JOcXBkQ3JCeUpCalpJUXVFc1VuN01vYmhBdzdraFFrV2ZTemprbXo4?=
 =?utf-8?B?Z3lmTktpQlpmMy84S3YrNDlzM2NXc2R4UE1CbFlLamwyWnlqTXRVZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ba97bf-2517-4c53-cd24-08de4ea955b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 11:30:32.7111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lPcknGAn/YiTWL/Ai9axb7cpyXDXv8Mwd9R/sGQJQJE8BTSjK2J9fgOicLMuQMnf603vChFoKYu7CQWwELp+eUhWXFC/ZS6uEpe6Z8/T7cA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17397

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA3IEphbnVhcnkgMjAyNiAxMToxNg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEvMl0gY2xrOiByZW5lc2FzOiByemcybDogRGVhc3NlcnQgcmVzZXQgb24gYXNzZXJ0IHRp
bWVvdXQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIDggRGVjIDIwMjUgYXQgMTE6MTQs
IEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gSWYgdGhlIGFzc2VydCgpIGZh
aWxzIGR1ZSB0byB0aW1lb3V0IGVycm9yLCBzZXQgdGhlIHJlc2V0IHJlZ2lzdGVyIGJpdA0KPiA+
IGJhY2sgdG8gZGVhc3NlcnRlZCBzdGF0ZS4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVkIGVzcGVjaWFs
bHkgZm9yDQo+ID4gaGFuZGxpbmcgYXNzZXJ0IGVycm9yIGluIHN1c3BlbmQoKSBjYWxsYmFjayB0
aGF0IGV4cGVjdCB0aGUgZGV2aWNlIHRvDQo+ID4gYmUgaW4gb3BlcmF0aW9uYWwgc3RhdGUgaW4g
Y2FzZSBvZiBmYWlsdXJlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiAN
Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+DQo+IA0KPiBIb3dldmVyLCBJIGFtIHdvbmRlcmluZyB3aGF0IHlvdSB0aGluayBhYm91dCB0
aGUgYWx0ZXJuYXRpdmUgYmVsb3c/DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMv
cnpnMmwtY3BnLmMNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+
ID4gQEAgLTE2NjksOCArMTY2OSwxMSBAQCBzdGF0aWMgaW50IF9fcnpnMmxfY3BnX2Fzc2VydChz
dHJ1Y3QNCj4gPiByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsDQo+ID4NCj4gPiAgICAgICAg
IHJldCA9IHJlYWRsX3BvbGxfdGltZW91dF9hdG9taWMocHJpdi0+YmFzZSArIHJlZywgdmFsdWUs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFzc2VydCA9PSAh
ISh2YWx1ZSAmIG1hc2spLA0KPiA+IDEwLCAyMDApOw0KPiANCj4gSWYgdGhpcyBsb29wIHdvdWxk
IHVzZSBpdHMgb3duICJ1MzIgbW9uIiBpbnN0ZWFkIG9mIHJldXNpbmcgInZhbHVlIi4uLg0KT0su
DQoNCj4gDQo+ID4gLSAgICAgICBpZiAocmV0ICYmICFhc3NlcnQpIHsNCj4gPiArICAgICAgIGlm
IChyZXQpIHsNCj4gDQo+IC4uLiB0aGVuICJ2YWx1ZSIgd291bGQgc3RpbGwgaGF2ZSB0aGUgd2Fu
dGVkIHN0YXRlIGhlcmUuLi4NCj4gDQo+ID4gICAgICAgICAgICAgICAgIHZhbHVlID0gbWFzayA8
PCAxNjsNCj4gPiArICAgICAgICAgICAgICAgaWYgKGFzc2VydCkNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICB2YWx1ZSB8PSBtYXNrOw0KPiA+ICsNCj4gDQo+IC4uLiBhbmQgeW91IGNhbiBq
dXN0IHN3aXRjaCBiYWNrIHRvIHRoZSBvbGQgc3RhdGUgdXNpbmc6DQo+IA0KPiAgICAgdmFsdWUg
Xj0gbWFzazsNCg0KQWdyZWVkLiBXaWxsIHNlbmQgdjIgaW5jb3Jwb3JhdGluZyB0aG9zZSBjb21t
ZW50cy4NCg0KQ2hlZXJzLA0KQmlqdQ0K


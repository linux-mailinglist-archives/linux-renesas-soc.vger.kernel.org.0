Return-Path: <linux-renesas-soc+bounces-25647-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E422CACD6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 11:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8036E30038EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 10:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077A02DF125;
	Mon,  8 Dec 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mK51sN2B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678A2E5B27;
	Mon,  8 Dec 2025 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765189029; cv=fail; b=PVsbcwTciAVFLJc4qqrYw4ri2s5tS8PzS2pjolAJIosFzklnRaPQ8Kg0fqHhZez11e9rLUVwKwExzoSL4Dwh8yr0m4Yzg0AjCYglqyOaOjUTX6WxalIVl6XpTtGodoewXkS2z8QypS8yugNpsxS2VjRK27SAuELogh1MltVZ25Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765189029; c=relaxed/simple;
	bh=oW+2EuWdmwlwexjzhD+bYVZPYPb09tj1wgiOTowdhN0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CIYyYyheciHRUTF4JdzvMNzuyXYdECQ8afQ9tHhInGBjxsuLf942NMiqcvofLEa7rOj7Xrd2wHvhsCh307an4coqp1tYFIm+NHtg77KSaiHtvhQGD+OsNzUnbys4dUx2yo4BD2Qo1+cLKXahcaha1MI77XTDb1UsO0Z9/xZCEEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mK51sN2B; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uC+AbHfWCgl5ZE7KSAOGfrRjVwBb3aANwRIKdYNZ3BYi8DPx2J/emujjTYLnNnbl6LYCGiCOfwLaPfAqHtDStG2OmHUn12bJGcVIPjGF9omplP4AIhXJFo4UfomIBlJUGj3EBSpcJTM3hhnjdTheuQh+ucUy1T4lA/PyJ7BVLseSGO+v4XBvwGpnRbOjt5llvg5Pr2cLLYQb6e9Rnn/j77P8IfdbbRgJ2tquf3hFupue6iJqfeX65+MhTIxPOocHPkzPta4BzOoLIXd6feOqY/064HCkYpHilU5Jp+8eNYvQkLBI57yEb+xwOP7QtoUf5nwLVjR7EAzhckJ8VKYrWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oW+2EuWdmwlwexjzhD+bYVZPYPb09tj1wgiOTowdhN0=;
 b=B7DOAmx0ak/BnM8U0N0Gxe0dDL4nbTicowmWU6N7RSUCNzbasJl2PUXK0gnI2mDOwKSYAszemC00UfLw/OHyfLFjhBVzL1R9nsECG3KqCdeqrjRftBusewa8J2MI+KkcFNEgBb3jpq25pQZIU80Ov1kKCvHN3DFjgK8U1sa8Lfvxlweb5Xf5e/5P99jGpyKfEVS1pCOgVkKBQa9bg0fV9kkEe6JexZGMKKtmGmFZtJSbyEbCmZsFZze3oMVxvZloYYxEzN4RXnbKFPoVnRLR11tYHDOGCelyTA5zTEp7h2mGUOjU7diWsLsS8K5lu0Ih1/ruMOJ3itoR+QhCfnh43g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oW+2EuWdmwlwexjzhD+bYVZPYPb09tj1wgiOTowdhN0=;
 b=mK51sN2BJVkxtGXVKIBKDXe1Sz8OQkb0Znq8GGj7raC0Gog+FvE2te6EdoxXo27bonXlxUVlAyHFYYzP1kg+vfinus9csHyxDDk1wxhBj3Wtvq55jxBMZvZqcF7dpQAAfEA9pPNb1tTyXxXofZvoq2xWqUWjAoPmyaaWswfyjnA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB12118.jpnprd01.prod.outlook.com (2603:1096:400:3d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Mon, 8 Dec
 2025 10:16:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9412.005; Mon, 8 Dec 2025
 10:16:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Alan Stern
	<stern@rowland.harvard.edu>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Topic: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Index: AQHcZ3fosvRmsVoD4EmZfZBInM+QcLUWYDsAgAD36rCAABPSAIAAHB+A
Date: Mon, 8 Dec 2025 10:16:55 +0000
Message-ID:
 <TY3PR01MB11346C2B0649321D81E9626B586A2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
	 <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
	 <TY3PR01MB1134603CBC4385178E2E57E3886A2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b417865397822176e83bca6b9d8094fe92ff2451.camel@pengutronix.de>
In-Reply-To: <b417865397822176e83bca6b9d8094fe92ff2451.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB12118:EE_
x-ms-office365-filtering-correlation-id: a3ff1bed-0f5d-4d99-7743-08de3642ea21
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NkVrNm5zQWx0QmRscWdNZjRjUXcvQ1dzdEd6Znh1SEVoVUs4SXFyYWsxVlp1?=
 =?utf-8?B?bzkvd29iT3h4b3hPZmxjb2VndTRUSE9jMWI5NExUVmhhc3FMM0dKekVFN1R2?=
 =?utf-8?B?Snp1Wnpud0xZZ3NZbElzOHc4dXBJWHV5Nlhwa2tJZjh6Y0hxbURlTzJxZnor?=
 =?utf-8?B?aVg3c0J5c05BRW5OblVURWNucEVEeTdKc083cHlFdzZadU02bjAyamRERzF6?=
 =?utf-8?B?K2xRZTRUZjJSeGJkVmF3UHdyWXZLRGY2V0c1RDVlanc2ZXZpalRnNVJqTVNY?=
 =?utf-8?B?MW0rbjhrNXJadTVkUG9jTTJaMW5HMmpLdnovRUQrbnJ4enFTNWdiOTBwTTB0?=
 =?utf-8?B?NVhYZ29KWFR0R3hGMXF6QUhEdG5UdjcxRm9XVUJUWXlYamUwVlFUWm0rY01r?=
 =?utf-8?B?WHU2MktwWjZlZHBVK2IveDZMQUlES3dodXUvL1Y2akJFZHpRakM3V3o3UGd4?=
 =?utf-8?B?V3QvNE1yRjFDUEhXNlp6SFZubTY4MHY1VFp3emRZczI5U3hKaUlSbXpOczhq?=
 =?utf-8?B?bysvU2haaHVtd0lrUGk5UUk5RzZ6bnNFbWdlZnVFVGNUaDk3QkJrV0pqUWJp?=
 =?utf-8?B?aTFFRzFrTWd3TUQxajE2VW5oOFFzK1RRSGhKRUlGYnltZjYvYlpaaS9IeG4y?=
 =?utf-8?B?djViSThBYXFiWWVFeDFMck1pbjNONTI4L1c1a29jZXN2d0RPL0dTSDNJeTdS?=
 =?utf-8?B?YzhEbitXOFVRWEpCU1Z0QXNUWURzcHZldXgrWWROSk44SktQTHJRZ2xZbWI5?=
 =?utf-8?B?UlVEWW9VRTNRWkRGajdlMkIwMlRlWm1zVTdma2xjdmx1bmRaZzhnY2cvWVUy?=
 =?utf-8?B?SGx3cVpHWnBrVHlKa3lhYVU0QnBQUUNWZ3FvU0sxcmtQbGt5OTFlNlZpR0lZ?=
 =?utf-8?B?Tlc3Q3p1U2M1YTRBZVgrTzlQK2h6bXp1WlZVeGZBYitSN2l4a2tCaWVleTF3?=
 =?utf-8?B?Q0Nod1FmNWZOTU52K0MwODA0cStvMXUyejBxNUhqUnFqMVhHUEdIYkhFZCt1?=
 =?utf-8?B?LzRzWi9XZjZRWkhrVE1zdlZpVjB3NGpLT29ianQzYlBVTlJPZ3VnTi9zSHRJ?=
 =?utf-8?B?dVpjb2Ntb25Kem12alZDTUx1VmpCeks4dm12dVhQZ0htcDQrOEJTMVRCK1gz?=
 =?utf-8?B?emRKcjVnaThqM3hKaDdhQU5hOWFjQnFwUTd1bmRSazZFbDh3Z3IreFVaanVC?=
 =?utf-8?B?cFIvZm5sM0dsZVBVNnJrVGRQdVdja1FiaUdtVXNSY2dubnRCblhETTBleXNN?=
 =?utf-8?B?K1ZnS3ZmS3dVaDFHYjJMYjJOZ0lkYUtTL3haQ3NSYzNHOFUrdVJnNlEzbTVJ?=
 =?utf-8?B?MnNQM1FibERLamdDS1R5NHQvSmV5SS9rQzcwcWY0djBxT0VleU1qYUs5S0Uv?=
 =?utf-8?B?SS9HVGNSSkx1Z0RJYWYyMTVJRG5sYVlRUW9NcDVNQzVBVXpocWZ5eHNWTktG?=
 =?utf-8?B?T1VIYTg2T2dxdWFxcFprZUx2OFRmTnR4NWJpT0tXQTdIamdyeXVwcm8wOFVj?=
 =?utf-8?B?Wi81V3lIUitYRFlMSFlYMCtqcE5yaVVDVTJZVDEvc25ZbEFHZzYyemNHaURZ?=
 =?utf-8?B?ZVBXUkRSbTdYZHFaSHc5NkdEcy9jSHFsWTltS0dIOWlYZEU0bHlGOTBTZzZD?=
 =?utf-8?B?V0kvV3ZCNmVhTWpNZWpURGJrMkVoaFJwaEtscWlwUVZDb0JFb2FneHlDeUMz?=
 =?utf-8?B?d0h1anN5L3VBOXlxSTloc0dnSXloL1Uyd1ZoRUFEam8yMmdNRHhzbldYclhC?=
 =?utf-8?B?T1JjVmIzTVhiYjdPcDFFaVBOaEZzQlBjZjFCdy82Y25ucDJ5bVlGdmFWK3M1?=
 =?utf-8?B?a0VFRlJvM1o2UjY0S1ZSQ2JVdTlZb2FNNlEvaHJSWmZ0R3F6bGEzajFYUGJr?=
 =?utf-8?B?MlVHV0hwaW5zWGV5WmN5TzhwdTFINDdlNklha1JJNm1yUUxuOW1GNE1oODBk?=
 =?utf-8?B?TVpOUW8zbGtXQTFndjVHT0M3eVhvb2JCVHhTWDJxY21aamdNY2JGNmQ0SWZZ?=
 =?utf-8?B?TFhMRXROL3lTSGZmdy9LOUY1Uk1SclVYTytjSVBkU0dnY25Zc0dDM1RjYlox?=
 =?utf-8?Q?lJgjQs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SVpsckErVmpsMlFiSmF6ck8razlqSDIyejZ5cThGYnRFMEczKzlXdUxMaE5F?=
 =?utf-8?B?bEh3T3BQdnpodWdYSy96UTNyMk1vUDJudUxzekVCN29iYTAzZ1VUVmhRUjZK?=
 =?utf-8?B?eldTMFBqT1ZuTkoxbEpWbVd1YjcwOVErSWRKbnVVVFR6VFhOaHJXRmk5b1lC?=
 =?utf-8?B?WWp1TVhJeGl0cDdoR3NUbEtKdStoeEZpM3FFNnpONGQ4cXNFeHpld0pnd2ZC?=
 =?utf-8?B?elRhZ2pIdmUrSW9KRkRhNU9lNk0xSWpjOWE3eGZpb3UxRHZWZWxZeHlmNUJB?=
 =?utf-8?B?ZUtScVUwSzFUbEZhcHRJdkFsZWx2NFdGWU1wYzV2YlJqVEdnWXFxWlVTdFZt?=
 =?utf-8?B?Z3JpRHpVYjBublBPWE9YSm0rN1VDcGF1bTlYS0N6V2FyRFRYMXpsaFZ5QnV2?=
 =?utf-8?B?U1VQRkdnYjFHUzZmOGRwRWFNTk0ybkY2Sm8vMmNEb2pzV2hDUEdMZHhSOVNa?=
 =?utf-8?B?U3E4S2p0b1V5YWpDUmRRNG5wbkNEbmNPTTh3VXY2Q0I3UFM4UVdwc3pJeHJh?=
 =?utf-8?B?aG81dC8zd2s2aEtYUlUvK0JBL3hjRE9BdkhGSUlGRTUvMFVieFdhVjJhbW9Y?=
 =?utf-8?B?VGc3WXhENnV0OGJqNS9PVm9lSzJBWnNNR1V1YWt0ZDNxaU1HWUs0WTFIeDRi?=
 =?utf-8?B?WUtUdG9XVlYrVjgwSGFkN3g2YnkvWDNQdjdTNFlWWEZCeDhBWHZBcS84ZWRL?=
 =?utf-8?B?K1gvclZhVUU1M2pTMkNSeS9BMUE2ZDlKNzc2Q0gwWG8xVFdPY3hJaEhrdFRp?=
 =?utf-8?B?ZDAxRFJLUU51NmZpOVZzOWJvYzE4dUJGNzFIRksxTENMZmJ0bytRa1VVenRS?=
 =?utf-8?B?VFpZZElZZDJEK1dSUTNQQndzZXlkN3hSQ2RvSVBMaGd5K2JTZEJyeTFMOGM5?=
 =?utf-8?B?aEp3aU91VDZFOUsyb0tpa2kydW9PK3pVZmRkODU1a2VUU05MSVBzV1MySDZz?=
 =?utf-8?B?S3FIZzR1bitNR0lORk5Id1JidlZwdWV1T0xzNTlSSUo0ZytHY3llZFRhQUxn?=
 =?utf-8?B?TXpGTjRNU2pmcnlTWnhUZ3ZUbHJZWXVQWmdPVUFuL0kzVTROOUVCYkVQTWZE?=
 =?utf-8?B?L2pJNSsvQnAwQVNZcTRYV2hNbVVwZ243RXBaSHFyNXBnQllyd2Q2bVROR1VI?=
 =?utf-8?B?Q09UV1BzRjJUWG1RUkRMU2wraFZHWmJLTW1lSndXVjRHSlQ1TmVPZUk1aDYw?=
 =?utf-8?B?R1F5RTZpOUhMM09aMVdVSVQ4b1RtZmV1N0dLQWFpV1dEYUVwTzZGNFNlN0RH?=
 =?utf-8?B?KzdYWTBBbGxpZ0tmL0hHYUhwMmFJaStrYlBaMzlXeTlzaTBWeFh0b0ZVVmFR?=
 =?utf-8?B?Tm1XdEFPbHFEQzZ1WHc4Wkgxd24za0FPN2ljNWFabUY3RFl1djhONHV5QjVG?=
 =?utf-8?B?WDFFQnBFUTk4K2cvbXUxaHpJWjFKblUzVkp6VHRmT21FRmF0NnJsTnFpM3ls?=
 =?utf-8?B?b09obHJPcWpsUGtEL1BxQ1I0cFo1SnJFTTIzMHdzMUJxYjh4SVZ0TnNYbE04?=
 =?utf-8?B?c2cxYVdYRWJ2RWovdE5ra0l4MDZvcWdyWXNiSU91bDgrWmJJOFpKcEtRaG1a?=
 =?utf-8?B?WnlZTHBUaEhwQWVmZmNDazVjenNZL3lYL3hzeTJhZzNiU2JPVVI0cC9YZ0Vn?=
 =?utf-8?B?Z1V6L1lXNjEzN0xaMHJRK1RhT3NoVDNYclRqRVJjQjR0K1pBQm9BNzlkeGJK?=
 =?utf-8?B?cFRCMllObllhbEdpamMxdmdzVTVXb2ZsZEh0c1gzeXVadnQwSEZBUXBWblpr?=
 =?utf-8?B?YTc2anBDUUhmZHVwMjBWZUdLcUFTcGg4Z1U5eTY2R0JQSTRYLzhxeGtHZ2x4?=
 =?utf-8?B?MEU0OHdmQXdMYXhrbVJodEh0NzZCcjd0NHdjc29zTENzb0hlS29iRy9jTGll?=
 =?utf-8?B?SkpUMDlZd21LbXNQWm81SklZK0Rkc21FYnM5ZHp2M1Z5WHMyM2VRRDJEZ2FB?=
 =?utf-8?B?ZGdQUWZsSXVsSG9ETkVPbS9Qck0vME1ySDYyZVBXdnYxeWhhemxOeExGZU80?=
 =?utf-8?B?QU91bTRnVnpDMUxHTi8xMldrVHduUExhYlVPTjFNNC9CVU93eUlRbFFrTnYx?=
 =?utf-8?B?VzQzYjRMVTBaNERHUGpGcEcrRXIyVlVDdWRDWTRxZmtaaHBtSXFBWWduUng3?=
 =?utf-8?B?N2JkOG0yM1pmUTkxNVpqWUFPNVdPS2ZXcVlOdDY3aFBGTXljeUh4dnk1VkRj?=
 =?utf-8?B?TkE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ff1bed-0f5d-4d99-7743-08de3642ea21
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 10:16:55.6417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ItJ4A/EAAnJxkr8BAcHWV99DyYtu3cgBSSAgK/t55F9koNAi4ALYU9IOniE3parM3UM7h1w+OnP1cjv14Y/58X2pqPir4/wArJDtixMzIjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12118

SGkgUGhpbGlwcCBaYWJlbCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiBTZW50OiAwOCBEZWNl
bWJlciAyMDI1IDA4OjM0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8yXSB1c2I6IGhvc3Q6IERy
b3AgcmVzdW1lIGNhbGxzIG9uIHtlLG99aGNpX3BsYXRmb3JtX3N1c3BlbmQoKQ0KPiANCj4gT24g
TW8sIDIwMjUtMTItMDggYXQgMDc6NTAgKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEFs
YW4gU3Rlcm4sDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBG
cm9tOiBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1Pg0KPiA+ID4gU2VudDog
MDcgRGVjZW1iZXIgMjAyNSAxNjozNg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzJdIHVz
YjogaG9zdDogRHJvcCByZXN1bWUgY2FsbHMgb24NCj4gPiA+IHtlLG99aGNpX3BsYXRmb3JtX3N1
c3BlbmQoKQ0KPiA+ID4NCj4gPiA+IE9uIFN1biwgRGVjIDA3LCAyMDI1IGF0IDEyOjQ3OjI1UE0g
KzAwMDAsIEJpanUgd3JvdGU6DQo+ID4gPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gQXMgcGVyIHRoZSBzdXNwZW5kX2Rldmlj
ZXNfYW5kX2VudGVyKCkgWzFdLCBpZiAuc3VzcGVuZCgpIGZhaWxzLA0KPiA+ID4gPiBpdCBpbnZv
a2UgdGhlIC5yZXN1bWUoKSBjYWxsYmFjay4NCj4gPiA+DQo+ID4gPiBRdWl0ZSB3cm9uZy4gIElm
IC5zdXNwZW5kKCkgZmFpbHMsIHRoZSBjb3JlIGFzc3VtZXMgdGhlIGRldmljZSBpcw0KPiA+ID4g
c3RpbGwgYXQgZnVsbCBwb3dlci4gIEl0IGRvZXMgbm90IHRyeSB0byByZXN1bWUgdGhlIGRldmlj
ZS4NCj4gPg0KPiA+IEJ1dCBub3cgaW4gZWhjaS9vaGNpIHN1c3BlbmQoKSBpcyBjYWxsaW5nIGVo
Y2lfcmVzdW1lIHdpdGhvdXQgY2hlY2tpbmcNCj4gPiB0aGUgc3RhdHVzIG9mIHJlc2V0X2RlYXNz
ZXJ0IHRoYXQgY2FuIGxlYWQgdG8gc3luY2hyb25vdXMgYWJvcnQgYW5kIHJlYm9vdCBpcyB0aGUg
b25seSB3YXkgdG8NCj4gcmVjb3Zlci4NCj4gPg0KPiA+IEZvciB0aGUgcmVzZXRfYXNzZXJ0IGZh
aWx1cmUgY2FzZXMgaW4gc3VzcGVuZCgpLA0KPiA+DQo+ID4gQ2FzZSAxKSBFeGNsdXNpdmUgcmVz
ZXQgYXNzZXJ0LCByZXNldCByZWdpc3RlciBiaXQgc2V0IHRvIGFzc2VydCwgYnV0IHN0YXR1cyBi
aXQgaXMgbm90IHNldCwgc28gd2UNCj4gZ2V0IHRpbWVvdXQgZXJyb3INCj4gPiAJICBUaGUgZm9s
bG93aW5nIGFjY2VzcyB0byBlaGNpIHJlZ2lzdGVycyBjYW4gbGVhZCB0byBzeW5jaHJvbm91cyBh
Ym9ydC4NCj4gDQo+IExldCB0aGUgcmVzZXQgY29udHJvbGxlciBkcml2ZXIgc2V0IHRoZSByZXNl
dCByZWdpc3RlciBiaXQgYmFjayB0byBkZWFzc2VydGVkIHN0YXRlIHdoZW4gcmV0dXJuaW5nIGEN
Cj4gdGltZW91dCBlcnJvciBhZnRlciB3YWl0aW5nIGZvciB0aGUgc3RhdHVzIGJpdCB0byBjaGFu
Z2UuDQo+IA0KPiA+IENhc2UgMikgQXJyYXkgcmVzZXQgYXNzZXJ0LCByZXNldCByZWdpc3RlciBi
aXQgaXMgc2V0IHRvIGRlYXNzZXJ0LCBidXQgd2UgYXJlIG5vdCBjaGVja2luZyB0aGUNCj4gc3Rh
dHVzIGJpdA0KPiA+ICAgICAgICAgYW5kIGlmIHRoZSBkZXZpY2Ugbm90IHRyYW5zaXRpb25lZCB0
byBkZWFzc2VydCBzdGF0ZSwgdGhlbg0KPiA+IHRoYXQgY2FuIGxlYWQgdG8gc3luY2hyb25vdXMg
YWJvcnQNCj4gDQo+IFRoZSBzdGF0dXMgb2YgYXJyYXkgcmVzZXRzIGNhbiBub3QgYmUgY2hlY2tl
ZCB3aXRoIHRoZSBjdXJyZW50IEFQSS4NCj4gDQo+ID4gSSBndWVzcyB3ZSBzaG91bGQgZXhwbGlj
aXJ0bHkgY2FsbCByZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJzdHMpDQo+ID4gdG8gbWFr
ZSBzdXJlIHRoZSBkZXZpY2UgaXMgaW4gZGVhc3NlcnRlZCBzdGF0ZSBiZWZvcmUgY2FsbGluZyBl
aGNpX3Jlc3VtZSgpLg0KPiA+DQo+ID4gSSBtYXkgYmUgd3JvbmcuIFBsZWFzZSBjb3JyZWN0IG1l
IGlmIEkgYW0gd3JvbmcuDQo+IA0KPiBUaGUgcmVzZXQgY29udHJvbGxlciBkcml2ZXIgc2hvdWxk
IGxlYXZlIHRoZSByZXNldCBpbiBhIGRlYXNzZXJ0ZWQgc3RhdGUgd2hlbiByZXR1cm5pbmcgYW4g
ZXJyb3IgZnJvbQ0KPiByZXNldF9jb250cm9sX2Fzc2VydCgpLg0KDQpPSy4gUG9zdGVkIHRoZSBw
YXRjaFsxXQ0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMjA4MTAxMzU2
LjEwMTM3OS0xLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KDQpDaGVlcnMsDQpCaWp1DQo=


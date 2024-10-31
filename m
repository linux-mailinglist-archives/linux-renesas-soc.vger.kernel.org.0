Return-Path: <linux-renesas-soc+bounces-10236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C169B7504
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 08:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E301C21410
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 07:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9C11487FE;
	Thu, 31 Oct 2024 07:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Dr41Q1D6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98E514831D;
	Thu, 31 Oct 2024 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358232; cv=fail; b=RjMSyrVtWCTjepsy8sYGewY/dM/tA+YydUJh5LoudhBgqW+iba/sTju3ntHTXabmAQb8H/19u4rAnRPr9SROEH0bzWO7k4bhAU4GBHol8enTlxX1KDFxq7wa19ccJ08yrWl/WutWkRBNzQxd9+Gq492kfEdy715oHB/0NKX/xCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358232; c=relaxed/simple;
	bh=kxLdPkLJOx9l/+ybOL4YStNU+V5fonqm6t5/cpT8HMU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SMcREZRuuYpmzmbbNTcMqAU+JMuKpbLh+IWrVjr1WaAOxSXH/gbcV+XhKpTNjWqvH03l4NyI8io6x4p7xuw7l6t2BIOCg1vXE2GbYQ61t3A5C9YypPbL++vEQjZtzg5eUUEWYI+DfX4g2MZrmlEnmfwGF6lH4kiL1EeqUPzpW6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Dr41Q1D6; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iRS4434AnUAfqQ+SamhNCO60kQcjsOB3CCGP6qFVhwbQeziRhvr7fx1UOjYjj2KLCqFqG2d5NDY7EoiOp1+BgqWyaP8QMJatbkTLOUJASZH73+VVkYv/hA6oHLXNKGzO5GkWh5lwjzSkwCz4nXfT4nr9xio9f/TqnJrjnsAuDnqOMg1P5kYWqOzVzp9QdVX2hTH0qCSoPNSPzCdG82qzaw4fBdLFskVRvyleZaGb1XcDvWRnTA7sBOxRUzvthZ511EP++fWYrfGzcvdaCRLmYaGIlJYYG1sJjvH05fMQpmhci3ZZJ8YImx0ivaBhjQsnwNZyUlEg7rEQkXHLD95/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxLdPkLJOx9l/+ybOL4YStNU+V5fonqm6t5/cpT8HMU=;
 b=ROVxHJHECziCExovTRk1Z9HG993gbWSB4WZSnokJ9usvQh5nt2ONkzoUHi3KhJHP42GIYO5kybu5hYLA/EPtob6p1ybp0ZzM6EP4YLhxCJs77+49TvouIWWE50OsZGxqJb8+f1bJ/ND9cf6iD6OEMYbcANzCkw/dxMkYkUuDfoEBFxlkDf3nWDZfhfZhmFrLAMm5piMC8w4cYbs8lNxnuAyDVBwqPUnYpLrxS/XnAGbFAwF0VnrJ1KQaZoovXKdJWoLS7E6ysLbNy+RFv47gLzlShfV/Nqyx0H+ioTN8/TU7dMle5/qxUMPZjUTWPBNWeCrB/q+70QvcZF8zCiU3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxLdPkLJOx9l/+ybOL4YStNU+V5fonqm6t5/cpT8HMU=;
 b=Dr41Q1D6s4lEKHtbdyK5ATvsTMtcsKpiz4amk3+3oG1+zIa36y7qpRuVi4WPTSNFf3dhbQn58NEn7W1bhee2jFA06c43UPW0uIH2vC2E+fcwuLER9RveKZpCdytYDUGP6aSGL9jzwZL6nH5hU8mf0rRBKaEq0Q7IdSLc8vZxrJk=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB6749.jpnprd01.prod.outlook.com (2603:1096:604:11b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 07:03:45 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 07:03:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Javier Carrasco
	<javier.carrasco.cruz@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] clk: renesas: cpg-mssr: automate 'soc' node release
 in cpg_mssr_reserved_init()
Thread-Topic: [PATCH 2/2] clk: renesas: cpg-mssr: automate 'soc' node release
 in cpg_mssr_reserved_init()
Thread-Index: AQHbKyMp9H60O77C/0i707NESKfh67Kga7yQgAAD0qA=
Date: Thu, 31 Oct 2024 07:03:45 +0000
Message-ID:
 <TYCPR01MB11332F2156EF1E5C2E04DD9C586552@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References:
 <20241031-clk-renesas-cpg-mssr-cleanup-v1-0-628274ecbfcb@gmail.com>
 <20241031-clk-renesas-cpg-mssr-cleanup-v1-2-628274ecbfcb@gmail.com>
 <TYCPR01MB11332D26ECE798C07B83804CF86552@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11332D26ECE798C07B83804CF86552@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB6749:EE_
x-ms-office365-filtering-correlation-id: 99ae3df0-8e93-477e-9797-08dcf97a2955
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V01KTFR3bWZPaUlidUxzOUVRMnd2MWV0dXZhREkzSlNSd0dSQ05ISVdXMTBo?=
 =?utf-8?B?NWdFTW9HUVFFbklPWHJKazZaR2lIQXMrL2ZoMVFCdkdQaTVFSVFtcnBML3BN?=
 =?utf-8?B?TWFUeVJtK25lYWhlWFBVL3o4V1hsaWg5Uk05QW9xMnZpMWhKUURndVh3bTEy?=
 =?utf-8?B?TW4vR2dScm92RTlYTDhhZm4rQjllMUpIOXE3SXhyNVFYaEZ4MzNnNXRmNTRY?=
 =?utf-8?B?RFRKdjVMWTdidmliQytBWmFGcGcwWmE2WUV2V3M5NG1HM2MrS1BMMWE2K0xD?=
 =?utf-8?B?dm9lcERTVnF4ejRJMHJjYy9SN3IyZHFmazJQSy9kWUwyN3pNQ0RBYTEycGI4?=
 =?utf-8?B?T3pBOUE0bUhieUNXWldwVVpmMDlLTDVrZXRqOUhaVUFhTndHd0dmQzd6ZjNM?=
 =?utf-8?B?SnpWaXlrUDdyRUNKcHZraDdjQ2RydTQwRjd5ekNNbkJpOEYvSVNhMklXc0lD?=
 =?utf-8?B?M2dIaVlZL3gzbm5pbkwyQnZJNDZHNnJZRnJ5WVpCRmhqRjJ3eVdSd0xmQnNK?=
 =?utf-8?B?YitETW1ubXk5dER0Zm5KalVSOUNBZ1Bsd1pIVnVrTTFWNDdFRSs4V2dpVGpI?=
 =?utf-8?B?MXFzMnpkU2hBNjNwMUJCRFZWenhWcnByeHlaOGJYNnRTL1pvdjg0c0RHMGt6?=
 =?utf-8?B?Ukw2UG9iWkdKUk9ZZjVJYlBVR3ozbjFSVkpmM0VMcW1sUGRqR2hnWFZpcFYw?=
 =?utf-8?B?UFkrTk00VmFjMStIR1ZneGF1VVY3Y1VJWlF0SlhhZjNYMkd4eGdlQk5HSGhU?=
 =?utf-8?B?ZnRyMXdNRENkZUorYmhtVjFqelFuSlBqY1ZyQjdvRVN0WFJkVEpDRVhPY2Rh?=
 =?utf-8?B?OW0zWEVzRUJnRGpKcmFuUWIyZyt4KzlSdGVZbjZIaWZxMTFidHlkaExCTTBR?=
 =?utf-8?B?VDhUUW1LbGlsU3JzQnNyZ1JtWjRrekpJT0JGQWFlYW1QMHNPZEZoN0pNRUtU?=
 =?utf-8?B?ZlZGY2Y0Z1loRXBiSmdjVlhKa3hSU2VtSjZ0b1ZsWlF5UnlZVEw5cCtzTDF1?=
 =?utf-8?B?UnlmQ0p5alFmaDBQRGlNMjlOMWJFTmd4U2JhcmI5SjBhWW0rclpucDJzWC9z?=
 =?utf-8?B?K2srbExqNDlUZFVLQUpreXhneGRpZ29MTWNCMkcxYnlkZWJicVJORytlUFR6?=
 =?utf-8?B?MWc0eTJsV0p0YW5wV01nc1VzWWFuaWpRUWowaXJmdjM5bXlsQXpINmQ3d3kx?=
 =?utf-8?B?ODVnczVIejVFOThiREhtNk1yTUo5VlV6WlBPbVhEbWxBZWtvTTFTL0diZXV3?=
 =?utf-8?B?bzMycVBYYlFEYS9IRXZnMjAwR1RoNm10czcvN0FLeXJZUWlmRCttbnJXcWwv?=
 =?utf-8?B?dEk1eGtMVXQvU3BYOTJzU0s3SVF4WXRuT2xuVXRHQy9yOXdHZnI3ZVNzQ2NW?=
 =?utf-8?B?ZTRTN1VOOVA4a1NpSXc5ZWtFMU9NUEN3ejlKWW5KU2JlU2Q0c0ZnM204YVl5?=
 =?utf-8?B?YXh2NU1RV2JtLy9WMnRkbm41T3lVY3llS3hvdWt2a2VFZlZ4UlZlaXBBeUFI?=
 =?utf-8?B?bVM1SDFmSVdXRUxJN1RxbkYyNWxvL3FhRU15c3Y3SUIxWnRSUVAyTmlENGFI?=
 =?utf-8?B?RGh3T1NqU2p5SWloanlHTXdlalprN2gvbkY3Y1IzWlo0cllNK2pUYURvUjhB?=
 =?utf-8?B?TlZ0cFZ1WHl5TTduYTJqVnR0UFdxZjU2Y0ZiUnFMQ3Y0aWxzTjl1WHM5TCtl?=
 =?utf-8?B?Y2hyUjMvLzRrSUFwTU9RVThKREdwcGsrRDRGTUl3RnU3dWxORWVWdGs2eG9l?=
 =?utf-8?Q?zxJJWa2SI1XHP43s3ppQhcCP4X9w/cDueSeNmke?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWxXRmZVTStyK3Vrelpyai8yajNCUkxKSTgyRW40MmpScFpRYzVqMVI1bXdZ?=
 =?utf-8?B?RDhrbWY3SEhSSjB0aURCVlJ0R1pIREJTcVNibm4xZkFGS3ZZNE1PcGxlNDI2?=
 =?utf-8?B?MWd0OCtLV2xvRlcrcmRzRTNGNWRZd0Nlb1lSSmlCazJSSHdjdytHdktJT3Y4?=
 =?utf-8?B?OHo1ajNVdmEwb1RRMjEyODJUbmh3NnBrOXZXUFFka0l3a3FPM0V5QWltMTR1?=
 =?utf-8?B?V2M4OWdrODJFTXpadTF5K0lnbFdIVGlLUXl4dlRManVET3BmU2M4K2NrOVZU?=
 =?utf-8?B?eExqZXhkaXpMTDlvY0JaRU5lLzJNYjJnYzJ6WW5CajJIMHVlWEduVFFRRVZ4?=
 =?utf-8?B?RWt6Mk00dDFvaXpWQzBEU1hMYUpWL3FvK2lFV3ppMEJOUFU5YXpHWnI1Wkt4?=
 =?utf-8?B?ODNQeGpPeFZ6MnhlVmRiY0dOc2hNRW50cnE2WFNKekFXUFgzYWdZWGwzUFF4?=
 =?utf-8?B?MDhjWTlQYVI3NEE5d2dSWGhUODJvZVFUQ3Brd2V1bkNNclBlLy9UeHZ4d04v?=
 =?utf-8?B?cWw3YVE3cTFVTnhhd2tsTWJieUpsSkJVcXNTcUFPQnB5cXpENzBLdVhkQWFv?=
 =?utf-8?B?c0pkM0wwWmdUMExEaXZzcnNvWCtaV3Z0aVBsd2Vtd1VjQS9MU3padEpHQTBi?=
 =?utf-8?B?RTNsRGdnbk9IZ2VQR2RyOVIzVjl6WFFySmpRdUxONVZPTVQ3Y3NjQ3pBVzFp?=
 =?utf-8?B?azdNTVNQc1plSURSVnJoZ3JEUWk1OHpTYnVtaDNpcmlGakYxMWlRNDYvKy92?=
 =?utf-8?B?d0plN2J5UkhjYkZZbGRhZEVINzNXR0lwQzE0dmxDRnd2SW5DamdSU2lUYnRp?=
 =?utf-8?B?MjliQ3JkSFF5SXljQ2FzdG5ZQno4SzFQK0NFTXpXQzIyNjRlUHJsSjZGdUNG?=
 =?utf-8?B?L1ljZ1dxZnRXNVZwKytmWWl5b2xkc1pacXVJVy9HLy9RWnVLMWZtb1pFTHhp?=
 =?utf-8?B?ZzkzZlNCZ2dkdmNVNkVVdjJQcGlTdGZmZGQ3c0hsK2d2VEdySHVjK3BrbWJK?=
 =?utf-8?B?L1R3c3BHQWVVTExZUDRVU3QxTTFtZk5tQmF6WWRJOHI2dzRZSDlzYU5vYUcy?=
 =?utf-8?B?cUx2MDNRMU9JdCtrbC9kd1drZm1YZ3hvRGdGV0drc0hvUmtWaHl2c0haakhu?=
 =?utf-8?B?NUJsa2gwU3FUa2lldG1ZZUVEMndTaTYzakM4V1NSVHJCTHk0bHIwQWtxaEV3?=
 =?utf-8?B?bUdJanpIOHdMUHZud0F1L2cxeXF0aTV3bGx6WlFQZDVpQStkcENxdEx3YWY1?=
 =?utf-8?B?VlNnRkxUZ2RIa2Q4NFBETFlyK1NRYWM4MEV6c2hZcnlHRkVFWFBkNlhEVGdC?=
 =?utf-8?B?NG9RQmd5b3k0TUxmLzBqb2Rua1g1dS8rUllEb21VR29wNjJtd2hhRHNzU2o3?=
 =?utf-8?B?UDN6cHFNa0l3c0ZUWVE4dXlIT1k4S2FTYlJYY3Q0eUlybFNpOWJUUlJpM3lk?=
 =?utf-8?B?SVYvRjZ4cXFPQzZWeVE1bVdkU0JlRitVYnJWMXVjVDNvczQvTXp6YVFxVktt?=
 =?utf-8?B?SzcvZHVuenJ2Q0VjR3htUmJtTlBMTFpwQjh5SENEeGVEK0VNTmZ5ckFDMHhq?=
 =?utf-8?B?R2hBWjliUjYxVGN2bDRvQ2Jodk5zSi9FWW03RlZlRlZxTjMzSkkvZXlaVnVU?=
 =?utf-8?B?T05iUFJRdkpZMEJEWEJtalUveFU3YW9abEpPbWNBcWFYL0lMQURmYitMdjB3?=
 =?utf-8?B?c0V2ZEVKUzdnL0J4TlVnY1ppUGQxVDhYQUI1aHpvdEx5QXJSNjNLZzl6T0I4?=
 =?utf-8?B?M1UxYjNKMmIrN3VicWIrelE3OW94WFhWdmwvZG1FZUVqSmtIRGJhczgvem5Y?=
 =?utf-8?B?eXZUWVhoVkhuTUF1R0tzNVo2Szc1SXJKMXBWNnIxck5UeHRaYXNpeWJ5akxV?=
 =?utf-8?B?U1BzYloxejN3T2lka1FlaTVCMUFBVXlnWUduYXJWQjErQVNmcEU0MjI1Vzc3?=
 =?utf-8?B?ZDhId1RjYlpNb25RbGJBOVVYTW1DaDBtWXJMMDEzMWFYTVpaWjZQK1UyWERY?=
 =?utf-8?B?ZDNGeXdWMWVmTENiQjh2SWJNWWFoOWJWUmFrWEU4UkhyN0dpV0NWa0JtQy95?=
 =?utf-8?B?TzlicEsxTE83Um1VQ3loeFhGc0ZZaHRFUmVsLzhwODFYR2c1aDIrWmNVNXBz?=
 =?utf-8?B?V21pRXYzVXhKNFB1OGR4RitUK242eXRxWWlYQTM3bTFIdE9GdjA0ZDFjbDZT?=
 =?utf-8?B?bmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ae3df0-8e93-477e-9797-08dcf97a2955
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 07:03:45.4528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adgB2c0tuED6gsoYzxBgj4xy2EULKa3WXCRATfESHXVNt7Iy+GtRvLbBudskYcXCbYf8jbZdhbOwC05ZaPttpUbV5I7fBdCZ8ZeYT5S8oGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6749

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiAzMSBPY3RvYmVyIDIwMjQgMDY6NTkN
Cj4gU3ViamVjdDogUkU6IFtQQVRDSCAyLzJdIGNsazogcmVuZXNhczogY3BnLW1zc3I6IGF1dG9t
YXRlICdzb2MnIG5vZGUgcmVsZWFzZSBpbg0KPiBjcGdfbXNzcl9yZXNlcnZlZF9pbml0KCkNCj4g
DQo+IEhpIEphdmllciBDYXJyYXNjbywNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoDQo+IA0K
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSmF2aWVyIENhcnJhc2Nv
IDxqYXZpZXIuY2FycmFzY28uY3J1ekBnbWFpbC5jb20+DQo+ID4gU2VudDogMzAgT2N0b2JlciAy
MDI0IDIzOjI2DQo+ID4gU3ViamVjdDogW1BBVENIIDIvMl0gY2xrOiByZW5lc2FzOiBjcGctbXNz
cjogYXV0b21hdGUgJ3NvYycgbm9kZQ0KPiA+IHJlbGVhc2UgaW4gY3BnX21zc3JfcmVzZXJ2ZWRf
aW5pdCgpDQo+ID4NCj4gPiBTd2l0Y2ggdG8gYSBtb3JlIHJvYnVzdCBhcHByb2FjaCBieSBtZWFu
cyBvZiB0aGUgY2xlYW51cCBhdHRyaWJ1dGUsDQo+ID4gd2hpY2ggYXV0b21hdGVzIHRoZSBjYWxs
cyB0bw0KPiA+IG9mX25vZGVfcHV0KCkgd2hlbiAnc29jJyBnb2VzIG91dCBvZiBzY29wZS4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphdmllciBDYXJyYXNjbyA8amF2aWVyLmNhcnJhc2NvLmNy
dXpAZ21haWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3JlbmVzYXMt
Y3BnLW1zc3IuYyB8IDQgKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcmVuZXNh
cy9yZW5lc2FzLWNwZy1tc3NyLmMNCj4gPiBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmVuZXNhcy1j
cGctbXNzci5jDQo+ID4gaW5kZXggNWRjODliMTAwOWZlLi5iZjg1NTAxNzA5ZjAgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yZW5lc2FzLWNwZy1tc3NyLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2Nsay9yZW5lc2FzL3JlbmVzYXMtY3BnLW1zc3IuYw0KPiA+IEBAIC05NzksNyAr
OTc5LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGNwZ19tc3NyX3Jlc2VydmVkX2V4aXQoc3RydWN0
DQo+ID4gY3BnX21zc3JfcHJpdiAqcHJpdikgIHN0YXRpYyBpbnQgX19pbml0IGNwZ19tc3NyX3Jl
c2VydmVkX2luaXQoc3RydWN0IGNwZ19tc3NyX3ByaXYgKnByaXYsDQo+ID4gIAkJCQkJIGNvbnN0
IHN0cnVjdCBjcGdfbXNzcl9pbmZvICppbmZvKSAgew0KPiA+IC0Jc3RydWN0IGRldmljZV9ub2Rl
ICpzb2MgPSBvZl9maW5kX25vZGVfYnlfcGF0aCgiL3NvYyIpOw0KPiA+ICsJc3RydWN0IGRldmlj
ZV9ub2RlICpzb2MgX19mcmVlKGRldmljZV9ub2RlKSA9DQo+ID4gK29mX2ZpbmRfbm9kZV9ieV9w
YXRoKCIvc29jIik7DQo+IA0KPiBJIGd1ZXNzLiBieSBsb29raW5nIGF0IFsxXSBhbmQgWzJdLCB0
aGUgY2xlYW51cCBmdW5jdGlvbiBzaG91bGQgYmUgb2Zfbm9kZV9wdXQoKSwgd2hpY2ggdHJhbnNs
YXRlcyB0bw0KPiBfX2ZyZWVfb2Zfbm9kZV9wdXQoKSwgdGhhdCBleHRyYWN0cyBvZl9ub2RlX3B1
dCgpIGFuZCBleGVjdXRlIGl0IGZvciBjbGVhbnVwPz8NCj4gDQo+IFsxXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3Ry
ZWUvZHJpdmVycy9pcnFjaGlwL2lycS0NCj4gcmVuZXNhcy1yemcybC5jP2g9bmV4dC0yMDI0MTAz
MCNuNTM1DQo+IA0KPiBbMl0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTIt
cmM1L3NvdXJjZS9pbmNsdWRlL2xpbnV4L2NsZWFudXAuaCNMMTk4DQoNClBsZWFzZSBpZ25vcmUg
bWUuIEkgYW0gd3JvbmcuDQoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEy
LXJjNS9zb3VyY2UvaW5jbHVkZS9saW51eC9vZi5oI0wxMzgNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiBDaGVlcnMsDQo+IEJpanUNCj4gDQo+ID4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7
DQo+ID4gIAl1aW50MzJfdCBhcmdzW01BWF9QSEFORExFX0FSR1NdOw0KPiA+ICAJdW5zaWduZWQg
aW50ICppZHMgPSBOVUxMOw0KPiA+IEBAIC0xMDIyLDcgKzEwMjIsNiBAQCBzdGF0aWMgaW50IF9f
aW5pdCBjcGdfbXNzcl9yZXNlcnZlZF9pbml0KHN0cnVjdA0KPiA+IGNwZ19tc3NyX3ByaXYgKnBy
aXYsDQo+ID4NCj4gPiAgCQkJaWRzID0ga3JlYWxsb2NfYXJyYXkoaWRzLCAobnVtICsgMSksIHNp
emVvZigqaWRzKSwgR0ZQX0tFUk5FTCk7DQo+ID4gIAkJCWlmICghaWRzKSB7DQo+ID4gLQkJCQlv
Zl9ub2RlX3B1dChzb2MpOw0KPiA+ICAJCQkJb2Zfbm9kZV9wdXQoaXQubm9kZSk7DQo+ID4gIAkJ
CQlyZXR1cm4gLUVOT01FTTsNCj4gPiAgCQkJfQ0KPiA+IEBAIC0xMDM3LDcgKzEwMzYsNiBAQCBz
dGF0aWMgaW50IF9faW5pdCBjcGdfbXNzcl9yZXNlcnZlZF9pbml0KHN0cnVjdCBjcGdfbXNzcl9w
cml2ICpwcml2LA0KPiA+ICAJCQludW0rKzsNCj4gPiAgCQl9DQo+ID4gIAl9DQo+ID4gLQlvZl9u
b2RlX3B1dChzb2MpOw0KPiA+DQo+ID4gIAlwcml2LT5udW1fcmVzZXJ2ZWRfaWRzCT0gbnVtOw0K
PiA+ICAJcHJpdi0+cmVzZXJ2ZWRfaWRzCT0gaWRzOw0KPiA+DQo+ID4gLS0NCj4gPiAyLjQzLjAN
Cj4gPg0KDQo=


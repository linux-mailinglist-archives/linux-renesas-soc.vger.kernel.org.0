Return-Path: <linux-renesas-soc+bounces-7812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113894ED2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 14:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 032941F22F8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 12:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2841E17A584;
	Mon, 12 Aug 2024 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vQOZVGiy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D63B7A8;
	Mon, 12 Aug 2024 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466383; cv=fail; b=lL6ULdRKhlPey31CdzaJGMTUq7b52XH0M5NBgk1eMIZVByf7qO/oRkk8okaJrx3th0SzaDtDwepNG8ojIU2x6DNAkuHJUf6Wo30K0e1ma7nvVfZYXhlth2UcqidN8qFtIoo3ChZLS3CKlpc6iktb9pwjbiBurBiOIibDAuN6GwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466383; c=relaxed/simple;
	bh=FWMd0eCzoabcKr9GSq75HpFQ8zNyI16eM6FXMX1LIX8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lpZ2Rg0Vs/wnV4AgcjxT9uPe0Nas2ZlNvSlD+AK3YxUlk/YrMH7aLOf2dVGJ1t3lVXVn4QgzQdl0w2pmj7hNDvW93RipDzvZeOXj5rzFjA1dVIryZnluDyaDeUf/cOF+FB+9Zwx0sVT1k6LlFjR0+ttcfG+2q+ikZRNaLdlrVZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vQOZVGiy; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZdtzzS4eM+UldMODUF4kFf0ZW3upS06sHc8FZXIlb/bzu38L7/sQNGBZpcfq3JvsJ0w3TS4q0Oe5vUHXujRIK1sXtCMmTRUxMC00de/zk9ZKD5CN1B89QDi96FlvI9+TIEjzE9t4mL2xXWo2AnoDf/DTE6Pf1qf7esPS7ripGoMO1qony9UhevWHD4Kk3hjR0AwqL6bNkSgKEeDxGqY1CemlH2tKs7koGqMb4jcmJBgYTbATE0YRlxHOhmk0G251dl3NiifYKsiaJQ99IFEUAO+IYyJgvYcKv6VWZm98yszPYJnEK8MITXwjAV2QOI7bNpFTGEwLB02HRHIGgm35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWMd0eCzoabcKr9GSq75HpFQ8zNyI16eM6FXMX1LIX8=;
 b=kOGo1ffzwrFGsRbs0aHjYx927UIBC4JeGSpdOrCIDmHBUiaMI/3VaKdvV4uEL0jMSllWetix3PwIrREEIQRAmBnNAYTdumtEOpGtZwnqTarYCtVDabC40n01bXrJjE96IZlFTGjSRhJBKNnRHJ4OAmEqZmekXusuah3NZ6VXi+HhJabWjxKfQOly7uQvsL3jT7yPmxJ80DDSHF9FxcLMDCRfgOEjmmUQSaaymYqnQOgC6Kw21FkxWLfAiBTOcqRUU94ZeCvM3MCMIXkAPUOQD2SuIfWIm+kv/718m35tBdtBx4M997rKSDoeN8o0/e9mJmJpwGqxXvobMg74NDlyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWMd0eCzoabcKr9GSq75HpFQ8zNyI16eM6FXMX1LIX8=;
 b=vQOZVGiylesZV1HekS+gfod8kq7KgdgIQP3wDZz1Ar+4t3QI50OxxAAtnqT+Wyk/YH7yI0YWQviBRQQEO5XlKGvxXKP2ODG/dGXanxVoVhc2UoxJ8poCmXlb8mqINCu8vtClwRfQAgz0rBZCZRzwUUGAd2vb8Fb5Yuiv0k2FGc0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB12066.jpnprd01.prod.outlook.com (2603:1096:604:266::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 12:39:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 12:39:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3
 nodes
Thread-Topic: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3
 nodes
Thread-Index: AQHa7DAWZaR6TcoD6kuFkcWuXXMxB7IjjJ6ggAACQACAAAHTIA==
Date: Mon, 12 Aug 2024 12:39:36 +0000
Message-ID:
 <TY3PR01MB11346C6066762B81C1B19848A86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346E95ED1171818488EFEFA86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sR1Lu1FYMQbDXzzi19ShF-RLkwirF-51aWp1bjwG8LXw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8sR1Lu1FYMQbDXzzi19ShF-RLkwirF-51aWp1bjwG8LXw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB12066:EE_
x-ms-office365-filtering-correlation-id: bb087caa-3c37-45cd-a32e-08dcbacbd373
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aUdTVjRPd1lHVy9LQURGdUJsQ0dlLzJGTEhIb1BKUGpOWTkzZlJjS1pmTXFJ?=
 =?utf-8?B?cm45M0NFck5yazk5WURISWFuVjFLOTRFOTdyeFpMdktISUM5TlVkckJocnoy?=
 =?utf-8?B?QzgxaU9PTGY5aSt3RkFoc1JuM05yQVBNUGRzd1kzbURycDVENDNpbHN4Yjdr?=
 =?utf-8?B?Z0FHR1RiQUdSSU9RN0w3eTZXMWx0Nm1yOEdsbVlJTnVCR1lScEt1eXNIM2tU?=
 =?utf-8?B?a1AxeUoxZGFucWl3MzR5Ymt1UG9FZ2lZb0hEZjhqeDNXRHpvckw2RGplTjlz?=
 =?utf-8?B?bkR6RGRCVC8vbGxhaXNydHBPbEdvTElGSG1GTkgvdVVoeStWWThmRFltWEZW?=
 =?utf-8?B?RTBuRCtDUE9EUkFVZlIrdWZCM0NLSGhETGhvSkJoVXJnWno5aWt6M2lHSGsy?=
 =?utf-8?B?MTA5TTBWSGwyL1R3RlNlOEdwV21GZ1M4RHBybDNIVVNLdHAzclY5dTEyc3hK?=
 =?utf-8?B?aFB1M1RQc0lPRlNzWUxvcWR3QnlIRi84YVo1djA2U3dYanR2UGNOcTdKRHB4?=
 =?utf-8?B?alI0Sm4xODdVdU1IRHVRcDg1ZlErWTJ3djdXY1pwNnU5L0VRYWViMG92REs0?=
 =?utf-8?B?U0VCSE9XR2dodVJVTVJUNzEzdXhoeFBjdVprbzgrdWhMVG4wT0NWWVRwUEg3?=
 =?utf-8?B?anhVSHRieGhaYW1sa1RHY01lYUVXVHB6eWNJVG5wVWlCQXdiNGp0aEQyV29R?=
 =?utf-8?B?bFRMQ0hvT2V5QUJwZEYvUUd1UUViUlI3ZXJUL1pVcTdwOGpJSXd6QmdmQzFX?=
 =?utf-8?B?UzhpRzRFejM0NmhtWnBNRWJxUU1PYzd1YkNReWU1VnF0N2IvNW00blB2ZTNC?=
 =?utf-8?B?cW85eDZRUC90VTJCOFRRNUYwdStRV2JsTlVPakxNeXdKRklhTjNzeWhBNm9h?=
 =?utf-8?B?a1pONER3VXhva003aEF6UWJCM2JWVWE1ZWcrZG4vaTIrd0xESzRqbzZHSTBM?=
 =?utf-8?B?NXc5SGhWS2QxQUVzUGk1Sm5iN3VjMWdjSnkrT2FJd0RrYm1aT1o0SWlZT0l5?=
 =?utf-8?B?T1dVZU50TUxGVGNxNXc0Ync5OGZBbDIwNkN1SVUyNE9HeGVNaWNiTHowSndl?=
 =?utf-8?B?RDYyZm1COVNWV2NrSjFoYTgwQlMyTGVZaG03TnY0Z1k3Y3F4RUlqWnVnVEFH?=
 =?utf-8?B?Y3pXSnBnVWJxc2xuVkVZR29ObjIzK3hqQmNVa0hPVTNpeGFFdHVRQnM1MHdK?=
 =?utf-8?B?RnZ3SVQzZ3AxelhmYkxEUWFHRmU2Q1hYT1QrY1hMelFGcncvQVl1WXd1M21v?=
 =?utf-8?B?bDVyZEwzbW9qMGUzSWlsaExwREVXMWxLaUFZRFF2NzRqZEhGdlZKbWp1OWs5?=
 =?utf-8?B?Y0RVRksxU3V0bEJvREp6NVYwL1I1bllCRDlSZVNvL296eldGWDFKbXhCSTZq?=
 =?utf-8?B?YUJKZEdZWTBMeXpWTkJCS0ErRmFDa0pnZ0xxT2lRNFdrbGpDMEt5Y0RWbHZG?=
 =?utf-8?B?YzBZWnlsamdKWTlQc1dnTmpKRHBrNDV3ZDNjdTBaRlZZMFNpVlFsYUxydkJJ?=
 =?utf-8?B?bEl6M25HcS9ocmMrbitVc2R6akNlSEVXczNnQzJrSVZpWUlETmRZdmFIUG8z?=
 =?utf-8?B?Q0hQZHFLLzBJVjhzWUphSU9EcE9TeDV1SW1pZXFIbHozVFVGK1lQaFhqcENI?=
 =?utf-8?B?Rks4eTAwOWtrU0pDMDJIMC84Q3FscEdhdzJ4bzI5UHE1Y0lRcXdydjZJMzQx?=
 =?utf-8?B?czEyTGl2cXkwQ05KWk96UkNpb0poOXdUcGwwWjVvVkY2d25jWG40THFWL3Ez?=
 =?utf-8?B?d2c0MjBQcjhkVWVrbHVYaTlDZ2ZhMzNrcnRzbjBlSE92QWpscHdpeTRQb1Jw?=
 =?utf-8?Q?0T/Aa+4f5oj9kfgta5BxUoKZ2qRTXD6sfCBeg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVNaU2N0c0VrazFkbUhZN0hlTkZKTnI4OC9xVzBSRUYxaTdMNFM2T1hHbzRn?=
 =?utf-8?B?bmVSSmV6WG1NRjF1SGFUR0tWenQ1WDZCNXhVd1Z5OXI5eFN5cXhLSVpTb0VV?=
 =?utf-8?B?UXZabWlCNmZjWkxZem5ucXhTdEtvcWNxVEZ5aUIzZ3dGZVhzR2x3a0VPWk5z?=
 =?utf-8?B?MStxOHNpWGpxR3JBYWtrYkQvQWZxMVpUem16NlR5eEVmdEpiNzQ5eWlTOC9j?=
 =?utf-8?B?a2RINVhQUk9nQWdEYXJTckgrN0dpY2pyZjZFbVVCckZ0MjlzWkhJdGpmSWk3?=
 =?utf-8?B?SFY2cUYvdDY2bnBKWXJpNzc4R3ZIMDc3NGE5ZWYvcFViVjRkN2Z4N1lQcE9B?=
 =?utf-8?B?dTA0eEtRQ1V4SGMxaWFPVGs5c054RHo1dSs0cmtkRW9LVFJtdWRkcG5oaHlL?=
 =?utf-8?B?dEgzV1FMS04xWTRKbjg1MGpKV290dnBhaWVOMkJVZ2tpdnNmNzVpTUQvYUxT?=
 =?utf-8?B?N2pwVzlCNjI3RTJaQWJyT1hlMnZRb0FjZ0NOYWxJaHpOY2J2UWxiQVNMdE8r?=
 =?utf-8?B?dWRRVDI4L1N5THY5VTg1MFJJUzBaRkZHS3NUb01BNytOL0JqUllrSkZwUGZ3?=
 =?utf-8?B?OEs5cXZXampxR0VkTU9lSHZyV3dPbTNQM054d3IxUmxGQkp3Z09kazA0MlNJ?=
 =?utf-8?B?dFU0WUsralZEY0x1bkFtSElya29sTHRzU2hDTHg4YjdQTUZwbDFzeFBKazRC?=
 =?utf-8?B?S0YycTk0WW9haE1VbjVuYkpYOXpVazcxT2pnQmVDUFNoV0ZvcHNWRDdOMUQz?=
 =?utf-8?B?dTRUTE0wNXlPU2l0Um9kNGs1OHQybjFLTGxKS2hucUQzSVJ0Q2xURGRESmlU?=
 =?utf-8?B?ZDNTcnRBaXd2QTEvc014a05PVEZxeGIvQ2pWUHJKamxWQ09HMUUxUmI5dUV1?=
 =?utf-8?B?ekhSVE9HbkhhdHJBelM0RElUYjdOMzUvd3NwVzAwbklWWURqU3VwVVZ1cmcy?=
 =?utf-8?B?czUrR3huVnpmU2tlOEpGQ2xPeGE2S0lCMStacUEvSk9wOGY5THRQVVBRa1hr?=
 =?utf-8?B?Y3dDN1ZwSUJKWE9wRVJWSXozSXAxQk5kUGExbmp5aWhzTEV1ei85cHhhc29Z?=
 =?utf-8?B?cE9SRUpVb3lKNE5XL3BwZjJ6RXdmZFgrb3ZuekwyTXdQT3JhUTNPYXNud01I?=
 =?utf-8?B?WE1rRUNLUVRzZklwVVVBV0NEUGNvUjVCdkFMQUJwY1BCU2ltSTdWcnhOUE5h?=
 =?utf-8?B?a280UzIxNDRrcDhFdzFsNURPRkdPUU5URVFSNzhaeUFIZlUvMERPcnROMHNP?=
 =?utf-8?B?T1JYQm1JdjEySXhseG56RU1VVG9kVkRtR0s4QkExa1VTbTBycmFHQ2x4TFVp?=
 =?utf-8?B?UUFnMEQ1em1Pd0xBVjM3ekxlNjdqREpOK2h0OUV2Y3doV25ZR1dWVUI2V0l5?=
 =?utf-8?B?M3Awb1c2bTRVQnZEK2lTdjZNRzQvSENKODgvNkpRSVExcEdFTzFyam81cU5n?=
 =?utf-8?B?ZVU2MnFVNlpicnZjR3lsVkpCUUJ6ODFMdjlmOFJjdHpueGlJVzRKYXM4Ymlr?=
 =?utf-8?B?RWFZK09BZC83NkFCd1M3RGl5RnlXcjBFaWJPM1NOekZ0ZVc3OUpua0hCN0tk?=
 =?utf-8?B?QzhEeTg0QnVmeWN4TTdFcDdhakgzL085T0l3aVpjVllXNytHTVVWMHBDYnVQ?=
 =?utf-8?B?U2hKT1poZlo5cmJUT3diUFJxaDQvMFBNODhsSkorTnp3bUhKREhJcXpnbVdW?=
 =?utf-8?B?c3VkVGtMMzV4eHQ2SXBpSTU5Z0ZKc1BaMWdRSnVsL2VrV0p2M2RwcEM3NHFj?=
 =?utf-8?B?dk4xSUJ3bXJtcHEzUWFFQkpTL3crdjdOOEgwTnV3Z042QmVaOE5veWdYc3FD?=
 =?utf-8?B?R25nWXJUdS9LY3l1aDArUUlyR0lSS2pFNUk5MmpNSlhHTnlWWGYxU0ROWlhX?=
 =?utf-8?B?a3hGZVpZVFBHZTlPYkN6aDNUUkQyZHVpZUNkdmdrLy9yb1k5dlAwb1REeHNF?=
 =?utf-8?B?MnZTdXhmNEVWWGxCQy9BUFZoRFpaVU1xVEJub0p3aXBmclNZZ3RmeXl6eEpV?=
 =?utf-8?B?MTFjbnlzbXZ1VHFzeUhsblpOd1k2aCtRRW5rNVZ1KzhQYWw1aXlSVmhvRmNp?=
 =?utf-8?B?MVd6OGYycEdJOXFUcDVaRFpvTmhkUURQb1pMZUExVnhQeEtuSFRoWk81TGVQ?=
 =?utf-8?B?SkVGd2xEV3NUekhzcjdOcXdWVTBSWjMyNzNlcEEzMUp3YWt1ODhFd0NZbzBh?=
 =?utf-8?B?NFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bb087caa-3c37-45cd-a32e-08dcbacbd373
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 12:39:36.7879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j42NaUfCcplYtlBVDYWqwLf+q13GSL+F4YLvfyNRk09dXq8l3YxkIn8h0vTg084xwo0WFw3Fk+ejEH6shL6zWB/PLAS1TdyC76fsmKSres0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12066

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAxMiwg
MjAyNCAxOjMyIFBNDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgTWFn
bnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoQGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Ow0KPiBsaW51eC1yZW5lc2FzLXNvY0B2Z2Vy
Lmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBGYWJyaXppbw0KPiBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5l
c2FzLmNvbT47IFByYWJoYWthciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxh
ZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA2LzhdIGFybTY0
OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA1NzogQWRkIFdEVDAtV0RUMyBub2Rlcw0KPiANCj4gSGkg
QmlqdSwNCj4gDQo+IE9uIE1vbiwgQXVnIDEyLCAyMDI0IGF0IDE6MjXigK9QTSBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUHJhYmhha2Fy
LA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUHJh
Ymhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IFN1bmRheSwg
QXVndXN0IDExLCAyMDI0IDk6NTAgUE0NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2MiA2LzhdIGFy
bTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA1NzogQWRkDQo+ID4gPiBXRFQwLVdEVDMgbm9kZXMN
Cj4gPiA+DQo+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gQWRkIFdEVDAtV0RUMyBub2RlcyB0byBS
Wi9WMkgoUCkgKCJSOUEwOUcwNTciKSBTb0MgRFRTSS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2MS0+djINCj4gPiA+IC0gTmV3IHBhdGNoDQo+
ID4gPiAtLS0NCj4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0
c2kgfCA0NA0KPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA0NCBpbnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNTcuZHRzaQ0KPiA+ID4gYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjlhMDlnMDU3LmR0c2kNCj4gPiA+IGluZGV4IDQzNWIxZjRlN2QzOC4u
N2Y0ZThhZDliMGE1IDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVz
YXMvcjlhMDlnMDU3LmR0c2kNCj4gPiA+IEBAIC0xODQsNiArMTg0LDE3IEBAIHNjaWY6IHNlcmlh
bEAxMWMwMTQwMCB7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2Fi
bGVkIjsNCj4gPiA+ICAgICAgICAgICAgICAgfTsNCj4gPiA+DQo+ID4gPiArICAgICAgICAgICAg
IHdkdDA6IHdhdGNoZG9nQDExYzAwNDAwIHsNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInJlbmVzYXMscjlhMDlnMDU3LXdkdCI7DQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDAgMHgxMWMwMDQwMCAwIDB4NDAwPjsNCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDc1PiwNCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIDc2PjsNCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJwY2xrIiwgIm9zY2NsayI7DQo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgMTE3PjsNCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBwb3dlci1kb21haW5zID0gPCZjcGc+Ow0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiArICAgICAgICAgICAgIH07DQo+ID4gPiAr
DQo+ID4gPiAgICAgICAgICAgICAgIG9zdG00OiB0aW1lckAxMmMwMDAwMCB7DQo+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA5ZzA1Ny1vc3RtIiwg
InJlbmVzYXMsb3N0bSI7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAw
eDEyYzAwMDAwIDB4MCAweDEwMDA+OyBAQCAtMjI0LDYNCj4gPiA+ICsyMzUsMjggQEAgb3N0bTc6
IHRpbWVyQDEyYzAzMDAwIHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
ZGlzYWJsZWQiOw0KPiA+ID4gICAgICAgICAgICAgICB9Ow0KPiA+ID4NCj4gPiA+ICsgICAgICAg
ICAgICAgd2R0Mjogd2F0Y2hkb2dAMTMwMDAwMDAgew0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOWcwNTctd2R0IjsNCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MCAweDEzMDAwMDAwIDAgMHg0MDA+Ow0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzk+LA0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgODA+Ow0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInBjbGsiLCAib3NjY2xrIjsNCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyAxMTk+Ow0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JmNwZz47DQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiA+ICsgICAgICAgICAgICAgfTsNCj4g
Pg0KPiA+IEkgZ3Vlc3Mgc2FtZSBncm91cChhbGwgd2R0IHRvZ2V0aGVyKSBhcnJhbmdlZCB0b2dl
dGhlcj8/IE5vdCBzdXJlLg0KPiA+DQo+IEkgdGhpbmsgR2VlcnQgcHJlZmVycyBpdCB0byBiZSBz
b3J0ZWQgYmFzZWQgb24gdW5pdCBhZGRyZXNzLiBTbyBJJ2xsIGxldCBHZWVydCBtYWtlIGEgZGVj
aXNpb24gb24gdGhpcw0KPiAoYW5kIHRoZSByZXN0IG9mIHRoZSBzaW1pbGFyIHBhdGNoZXMgd2hl
cmUgbm9kZXMgYXJlIHNvcnRlZCBiYXNlZCBvbiB1bml0IGFkZHJlc3MgYW5kIG5vdCBncm91cGVk
DQo+IGJhc2VkIG9uIElQKS4NCg0KSSBhZ3JlZS4gSWYgdGhhdCBpcyB0aGUgY2FzZSB3ZSBuZWVk
IHRvIGZpeCBbMV0NClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3RyZWUvYXJjaC9hcm02NC9ib290L2R0cy9yZW5l
c2FzL3I4YTc3NGExLmR0c2k/aD1uZXh0LTIwMjQwODEyI241ODQNCmh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5NjAuZHRzaT9oPW5leHQtMjAyNDA4MTIj
bjYzMw0KDQpDaGVlcnMsDQpCaWp1DQo=


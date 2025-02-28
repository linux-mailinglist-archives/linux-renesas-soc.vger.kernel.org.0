Return-Path: <linux-renesas-soc+bounces-13797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC75A497C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 11:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A984188E4CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 10:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6594254AE6;
	Fri, 28 Feb 2025 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XuhgsPmF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A011B4250;
	Fri, 28 Feb 2025 10:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739829; cv=fail; b=AyMNO78ZMDF+NZpcIGiR1uHJ3ERehWeRPTsXgGQnppo4cUGIuqGXEiwK5CJTlk8w2STWV/avcayN96+g9Ag5DhQ2NEE98HnesC26vw+LrohIYW9N2QwAmvrXstOzAkApolZsVM0cLq/N6QwHgV0uQAWGQ7pmVMe5mxm0kbj2Teg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739829; c=relaxed/simple;
	bh=EEYYkbxiX0jvF8pN+apVJjErCtrcjmrIRgo3qJhNmgI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vi+3gzL4JakjGqX6yqmIr0Qfm0Qy4S+XEc2b2QfcE0dSozlAZRJ+7IpeW1HX+0dVUxo8pVKJQeriR3b5CkyM8fKi1R7MaZ5qTVaW0eKV2qdf0YPlf/ZKAzXW1imawrGrnsKy6vJFoqiaEuxjzyy2kQjYpGoV/ZpmzKmfSji8Pns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XuhgsPmF; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeY0JcRIiA7fGOHQRwiWjuroq49EVmDcO9vOP5XxIog9yMeN0a7mWJz4T/x0C6VNYeOLlFLaobR4WFu3IZsZZ1kdY1tWCuXiCmm/ITyai1V6VP7e2M/oEDOzJn+j/9jeau0v12cJSYvwAPbH4umz+yn2hojtdf2dVwq3vhDeOP5L7rSfVbcJZwwN88+CWjzDOWPv/WR9SpeGW5t84XnhSzaVI5qJcNgqxGQCs5xgOU/9qiNnYsPBtzdmKjxgEydx8Gd6diJdQ1uKhnO1gjcN+n1BK0T79OeV1zvbHXNVYzhiysQIj8OoDKOigSCRs0efAS4E9cgxLHl+0TZB+ZxlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEYYkbxiX0jvF8pN+apVJjErCtrcjmrIRgo3qJhNmgI=;
 b=qg0uFe6+MVaaxaQBFSpsS6U/njkPFOjjem3Nmq42OQoPsOd+QqqKL3hs/89c5oCOzPIcAyGYAlGiPv4JNbJ6+syh1E9P5VujAt/eG/7fXR0mqfLPdlsX208IYb6rduLdX9gLRw2gOoCz+Fy/Xzd4jUJG35vQqbwClDAKqwk2GDmT8Q6ITAaKICCV2rqJO5R4uAqS/gifByXMMzzRohq1kIXw0zxTOA0rHQ5a7sZm7sBJCuWlOm2Q/gxzFWhYUAtUNanthK9LWvcyzPVZQnC9qpMbiA/5XUvLBOlnPUraMq6wPSq3usUFgER0y9efuIKAOpvn2VXRC5ShufizbxC0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEYYkbxiX0jvF8pN+apVJjErCtrcjmrIRgo3qJhNmgI=;
 b=XuhgsPmFsggqoM62EXCjyKHmV9Yy65+MfeChoHf3Aa8rvV/JD1/p0/UF5udLoFB0SssAZ9L3saqu0yqt4CRHaX7jQpoUN9fWJJ45o2sP1ql8sId1SqwS/NVr2+TzL62QiXfZ+CwHy6xYegmRDufmPTNNar2mt+5FR5m1neiRgKo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13528.jpnprd01.prod.outlook.com (2603:1096:405:1c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 10:50:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 10:50:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH v3 3/8] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbeJzJXGThVn8cpEWsdB3fagweKLNcmM0AgAAAieA=
Date: Fri, 28 Feb 2025 10:50:22 +0000
Message-ID:
 <TY3PR01MB1134630BF6DECA7E085D2633B86CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-4-biju.das.jz@bp.renesas.com>
 <Z8GE6G4TXC7dOB6_@shikoro>
In-Reply-To: <Z8GE6G4TXC7dOB6_@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13528:EE_
x-ms-office365-filtering-correlation-id: 2fb9ea18-0d76-474c-a56a-08dd57e5b33e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SENsdW84bHdEZzIxbzM2VFJ4TEhoVmllOG5sMm5wcXBxUW5qbVFPcnZ6ckw3?=
 =?utf-8?B?WDRIUjVld0lBRlFkdXZtYjRCRWpJcjRiZDY0QStKWjV3dEZJRTBFdDdHeWYr?=
 =?utf-8?B?cVVXaU9ubG9pREVjckFzT1daWjFLQkxNZng2YkloTUhkRVFPNTVqREtvajJD?=
 =?utf-8?B?VWtpRC9vZjJOTVhVYnh6N0xBWFZMWXE1MUxRRGdMUUdmUGUyZ2lvUVZ2WFFa?=
 =?utf-8?B?cllrVXRHcUIvK3FUb2VDTFlPMW4yNWk2L1I5dlp4R2FmaW11V0VmMlRhdnFE?=
 =?utf-8?B?QzVtNUxZVUJLQnpPaFovS1NHSml1V1o0QlJqWHJUT25EdWVTT28yRGNaN2Qx?=
 =?utf-8?B?Q1crYWhuYVhNUXZGL09TNGl6YXZyWkh3L1doYUpUMzVCU2YwUnpuNUtPWjcv?=
 =?utf-8?B?UTBIUUxSNlArdkVnS2FCYkl5dnlEaFFNeEFta3llMVNuKyt3WXNkQWtqR0Iv?=
 =?utf-8?B?VVZMMitOeTZHL2grRzhTWXFnR2ZTVFpyTUhVUi9EdXgzbXZiMkx4MnNPQStu?=
 =?utf-8?B?aUpVQ0RSVmszWU1lSGdjcEg5dGNlUEh6KzQ4WWkvdlNCMFlLOEFKNitadjNn?=
 =?utf-8?B?aW1Zemt6eWRyclMwY2NkaDlUd0Y2SDhRRnB1azRJRGZ2UGwxcWg5WU1HdHEw?=
 =?utf-8?B?ZVhJUTc2MXVBKzNtSlEyeXR5d3I0bkpFQ2NLbk9ZeEFEUmFlR1Z1V1BoMjlt?=
 =?utf-8?B?NEpxS3dGNnQ0VnNwQ2c0cVZycHZSRHEwZUNyRjU3ZGxPV29kN3VMSTJkUDFw?=
 =?utf-8?B?dCsvM3hMbnp4aTU1Q1JONE5RRTV3WGE4aXFPNFUrZUxvUzUrRitEZ2JSUmVm?=
 =?utf-8?B?SzRGOWRjZ2crN2o0REc2czVLbmNTMzZFbEZsWUs4dEZiejFxRGFWR01uci9u?=
 =?utf-8?B?STZzcEhpeFlWVE1OSmpYRUVzTGhmNVE5S1lXS2FLamRDd0ZlRWZ1eFZ3UEpo?=
 =?utf-8?B?TWdDK3RYNFRxUDRGSEFqMEZsaGVtZHVsbU1RVGljQ0g5TXJ5SlVqOW5HV2hr?=
 =?utf-8?B?THBQK21tWld4RU41L0N6UjY3YzBWUTVaK3J3ODI5emtiaHVxK2toTld5RDhJ?=
 =?utf-8?B?ZEJPRUZkNGlNNGt2SzRrdUl0clpiMDlVVHpFMEZEclJxby9pY2dINlZSOTB0?=
 =?utf-8?B?ZjJxMnd3VGdWejdrajRsQngycTJRcnpCeGIydEFKanVTZ0NDNVVLSFZFMU5K?=
 =?utf-8?B?NVNJblIyU2Z4eXBSQ0FKYW1aVDFSOUZvdHBESXV3N2RGOGszbEVpaC92RDNx?=
 =?utf-8?B?R3pHZzI5c3RGMzVzUjlrYUZlY2oyT1BDbDdNaUM0Sjgzb3Byb1pQMzlMcUlL?=
 =?utf-8?B?UThpUXpJdzB3TkVrcmk5L1ZyWDgzVW0xcmU2MDdqU3NtV0M4QlNoVzNmVGdr?=
 =?utf-8?B?RTd1ZXFQTGtMajA2SHpHNDNwNVc2aXAzRnZHcUtpY2duQWpVUk1sajdiWEpv?=
 =?utf-8?B?VkhzT2hKYUhEMitiTFc0clBtdmhBdDI2andrVzRLWWpoZTJueTZhSG04b2Nw?=
 =?utf-8?B?bzhmK2VwVmZjbUtEek5EU0NiNVBuU0c3MXNBODVTSXdnck42ckRMSFJXNndE?=
 =?utf-8?B?V2R2a002MVhwUlEyY3g3dGUybml1YllRbkk3NHoxTkVhODJuaXhheHRRY0lj?=
 =?utf-8?B?Mk5OdzcxbEdJWXpUTVQ5MFd3bmdFZldYN21HdC9nclJVeVFyd2VxYWZSTEVu?=
 =?utf-8?B?MExvUXplSFBJK215bmZidmZMb3psbVlYN3hyckpYTEFXOGlrY2QxbjE5SW9E?=
 =?utf-8?B?VGFTTk1IeE5UbFA0YmJnb29PYklveDYyOGt3S0dyV1BHdVVvalIyZnRHUUpy?=
 =?utf-8?B?dXM4YmFONWRSYVpiNnhsSGUxRlRyR2s1bWpENnpib0FYMVpBSnYzU3ZYWVpu?=
 =?utf-8?B?cGttdXoyUFRrR0xmaVRyUUFleGhaMVRMWlpNYnNiUDR2S2d2Wkhzb2ZrcHRY?=
 =?utf-8?Q?Phx5lmZ6jsBHw0YV1QZYLd+I/owSLrCr?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3MyWExKSkNQVjdPWXFzUnVjRkozdDB3VVJHcmFpTy9CWUVHeEVKaDdnQ3VB?=
 =?utf-8?B?Q0ZUK2FyczdyekI4VHdsMmFOcEtPc2dTcis5cTcxaEtDS0hpSGJXQlpvK0FG?=
 =?utf-8?B?Yjl4U2FYY3FkYzdYdGd2WEVCOHdwU29hRVdEdTdLZFhaNm8xLzV3OE8rYjBn?=
 =?utf-8?B?RVZXL3g3aWNZZEMvOGlrajQwWTdnVWVGajd3Z0hMV1dhc3BtTHA3ZnFTZEwx?=
 =?utf-8?B?SkRRVDh5OURNVE1MT1BvZnc3bTdPMkxxaUZJV1dLRFZBS0hmc21TWWZRaElO?=
 =?utf-8?B?Z1dlZmF4QW9zeitublVEQnF0bXYvYzZ5UjRXR0owa29zc2FQUjBoY3Foam9F?=
 =?utf-8?B?QytITS9SODArdEhHdE5Td3BnRUNEejFFb2dNWDZ6bUFiVDJ6U2NSb2l0Z3pL?=
 =?utf-8?B?emVBWHgxbDFwdG5oTWs5My9ZejBacEd1d3FJYWd6NlVKUGI4Qjh0U3F3aE5Y?=
 =?utf-8?B?UVFQb0pRZURqWHUzRlpWVERHclN3ZTRNT0pyS2piNllzeTAyQ1pqNHNFYXM2?=
 =?utf-8?B?YXd5UEpMeXh3aXJYQXdCUHNtS21YL1UzVU1SOEM0dlB0clh2cHhKL1JWSGxT?=
 =?utf-8?B?TC9YeEtwYitRaTBURFgycW5hNTdXSUN4VnZUM2g0eG5RNFJKRllrdDJ0WXgv?=
 =?utf-8?B?bFBCelNtbzh2YVZBYy9NZ1UxN3JScE96eUowbDlmT3lxUCtpSStzdzUrVUN0?=
 =?utf-8?B?SUtnRWQ4T2FqRWtVcERWV0J0Ky9wMFpPOGV4R2gxMS8wUCtLMzhpSlV0U2dw?=
 =?utf-8?B?dm5mbE9heVJoZDhBbkJtUFdTTnlSY3BSTjJselk3RVQ2djRBbkpWaHc4S3Vm?=
 =?utf-8?B?L1NsSUlaQUM0VlJubEE4RklSbHZTVnByWEtGa0xIbjVaUFozQ2dRaW9RMkFv?=
 =?utf-8?B?dHdhZHR4Wlp0YjVNTmMxcG56ZDErcmpGVnJ6c3l0QWlMV3NsdG14T1Z2YTM5?=
 =?utf-8?B?OXE5SGVSU0pZZXM2eGU0TTdUQVMySzhQNXNMY05NMFYvVWdDOXdnd05vNnJF?=
 =?utf-8?B?eExmeGptb09vR1FxR3pla2czNzRHVzdHRHI0Y1JwUUZXY1VVR1diKzVaamh2?=
 =?utf-8?B?bVJVSlBSeWFjc283L0RZODlrbnhaYTlFd2tDMk1oalFhODRYQzFyMU93WFpL?=
 =?utf-8?B?VUZZeVdjcE04a29IN1l5Wlh0M3NuSzJqRi9uM2w3MmpuOG1UZ2lMY2lYMlJv?=
 =?utf-8?B?cmxpRXFmdnEyV3F5eHlmYUdabTdDVXcwNzc3UFc4R3pBYTVvTVQyR1BIN0VI?=
 =?utf-8?B?WmkxdTRKNkdLWHYxMXBvWll5dTVMbWF4V2pDaDN5aVNSU0R2d2NuVVpzMHN4?=
 =?utf-8?B?WTluVnN2NjFTb2RIUFhyUUFtN1VPOUVNbG1velhpUE9jOHFMWVZoU3pkRGlz?=
 =?utf-8?B?bzR4V1Evb2Jhc2g3Rm9LRk5FNWNDaFgvVkdWQld4MnNtSGF3THVuaWM3OG10?=
 =?utf-8?B?ODBtQ1pqSTVaaWNxbVoxVE84NnJtTHlvWXJGK210TTlqanlLWHd6dm9pTHM1?=
 =?utf-8?B?UEtnU2JxcmNrTi8zeGhBa3lmQXRkdGJIcThFZ2xSVDI5WkhOd2xFUWd4ZSt1?=
 =?utf-8?B?WjNRMUFwUmFTR1gvZ0ZaVmxTTEpJRnpoaWxVQWtHN3liOGgyRGx5UnJRa3J0?=
 =?utf-8?B?MFhzZEI5OXNLRUtxdXBQWTR2OUcxekVIekRrSXNyU0NCMS9Ybk5KaCtJeUtQ?=
 =?utf-8?B?YVZGa3A0TnR1dklwSTQwMm93Njh1M1dxbFNxVUpKZnlwdzJHU3hEUXdTL1RO?=
 =?utf-8?B?L01tSlpSTXpRbDhJajg0TG40WkZWdGJWdWNDQXZ3L1pxVS93TlR6MGIySHBj?=
 =?utf-8?B?WWtHQXhtMjR3ODZOaXZ3bWNHQ0EwcDh4WjR0TkowT3pBZGlZWDVlY1ExeXg4?=
 =?utf-8?B?eExMYVJVcEdoYm9uY0hCYjhra2JpOFN1aTdkMjlTTHU2Tlh5dXFNZzlSTFZq?=
 =?utf-8?B?V0xjL05Lejc2TUxDL3FGYW8xbXU3TGZ0Q3BxQWI5dlBNN0hiWTdQQ1dVTGJP?=
 =?utf-8?B?VWZSanY4b0R5Ny92a3RZMTRydnBQVUVaUCtsQ1l1VkRvWXhQZG16QjBjRFh4?=
 =?utf-8?B?MjNwRFRWWEhNRXJUQXlBS2VPRkZZVTdaajA0bXlicVFDQ2YxQjRxZG1iTWdt?=
 =?utf-8?B?bGw4Rlgzd1hweWRGMWNldWFGS1VZUnVQYTc5Q1BtVy9uVXcxS1BMRzdJWW1Q?=
 =?utf-8?B?MUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb9ea18-0d76-474c-a56a-08dd57e5b33e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 10:50:22.2516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBEuYBHFPDRvphXhLS14AUuWhY8nJvyYrb4Lh1PggE1pZbCyi6cCQyG8pyFT/PLeV778RsRlevADzpVNAjgqJycBpPgJAxXMUcgd21LQ3KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13528

SGkgV29sZnJhbSBTYW5nLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNh
bmctZW5naW5lZXJpbmcuY29tPg0KPiBTZW50OiAyOCBGZWJydWFyeSAyMDI1IDA5OjQyDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMy84XSBtbWM6IHJlbmVzYXNfc2RoaTogQWRkIHN1cHBvcnQg
Zm9yIFJaL0czRSBTb0MNCj4gDQo+IE9uIFRodSwgRmViIDA2LCAyMDI1IGF0IDAxOjQwOjI3UE0g
KzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IFRoZSBTREhJL2VNTUMgSVBzIGluIHRoZSBSWi9H
M0UgU29DIGFyZSBzaW1pbGFyIHRvIHRob3NlwqBpbiBSLUNhciBHZW4zLg0KPiA+IEhvd2V2ZXIs
IHRoZSBSWi9HM0UgU0QwIGNoYW5uZWwgaGFzIFZvbHRhZ2UgbGV2ZWwgY29udHJvbCBhbmQgUFdF
TiBwaW4NCj4gPiBzdXBwb3J0IHZpYSBTRF9TVEFUVVMgcmVnaXN0ZXIuDQo+ID4NCj4gPiBpbnRl
cm5hbCByZWd1bGF0b3Igc3VwcG9ydCBpcyBhZGRlZCB0byBjb250cm9sIHRoZSB2b2x0YWdlIGxl
dmVscyBvZg0KPiA+IHRoZSBTRCBwaW5zIHZpYSBzZF9pb3ZzL3NkX3B3ZW4gYml0cyBpbiBTRF9T
VEFUVVMgcmVnaXN0ZXIgYnkNCj4gPiBwb3B1bGF0aW5nIHZxbW1jLXJlZ3VsYXRvciBjaGlsZCBu
b2RlLg0KPiA+DQo+ID4gU0QxIGFuZCBTRDIgY2hhbm5lbHMgaGF2ZSBncGlvIHJlZ3VsYXRvciBz
dXBwb3J0IGFuZCBpbnRlcm5hbA0KPiA+IHJlZ3VsYXRvciBzdXBwb3J0LiBTZWxlY3Rpb24gb2Yg
dGhlIHJlZ3VsYXRvciBpcyBiYXNlZCBvbiB0aGUgcmVndWxhdG9yIHBoYW5kbGUuDQo+ID4gU2lt
aWxhciBjYXNlIGZvciBTRDAgZml4ZWQgdm9sdGFnZSAoZU1NQykgdGhhdCB1c2VzIGZpeGVkIHJl
Z3VsYXRvcg0KPiA+IGFuZA0KPiA+IFNEMCBub24tZml4ZWQgdm9sdGFnZSAoU0QwKSB0aGF0IHVz
ZXMgaW50ZXJuYWwgcmVndWxhdG9yLg0KPiANCj4gT2theSwgc2luY2UgSSBkb24ndCBzZWUgYSBj
b25zdGFudCBzdGF0ZSBvZiB0aGUgcmVndWxhdG9yLCBsZXQncyBqdXN0IHJlc3RvcmUgdGhlIG9y
aWdpbmFsIHZhbHVlIGFzDQo+IHlvdSBkbyBoZXJlLiBJIG1lYW4gaXQgd29ya3MuDQoNCk9LLg0K
DQo+IA0KPiA+ICsJCQlpZiAocHJpdi0+cmRldikNCj4gPiArCQkJCXNkX2N0cmxfcmVhZDMyX3Jl
cChob3N0LCBDVExfU0RfU1RBVFVTLCAmc2Rfc3RhdHVzLCAxKTsNCj4gDQo+IFdoYXQgYWJvdXQg
aW50cm9kdWNpbmcgc2RfY3RybF9yZWFkMzI/DQoNCkFncmVlZCwgd2lsbCBpbnRyb2R1Y2Ugc2Rf
Y3RybF9yZWFkMzIoKS4NCg0KQ2hlZXJzLA0KQmlqdQ0K


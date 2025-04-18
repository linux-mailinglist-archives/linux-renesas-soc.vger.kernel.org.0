Return-Path: <linux-renesas-soc+bounces-16175-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE5A93F6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 23:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 962988E484C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 21:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4A622F155;
	Fri, 18 Apr 2025 21:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ITVmFGiW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9911B6D18;
	Fri, 18 Apr 2025 21:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745011332; cv=fail; b=sr7aoTdTrwaTPcpSa9Jxh/aQCQO/S3noABjOSEgSSOg1JZX5dAVFLTiddxAjVlwLxaD6KsfipHwBOO1Z6R/9Homv0Jj4+XOQ2H6vkWobx7opdEhdu5t/iJxMSeN515AVGlR7s+qODp6e2DPbbCB2pqrfMXdHpjVs0f1S+jpcCEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745011332; c=relaxed/simple;
	bh=fyuwzbu04moTzRgb1M6mhiuHR5H6jGDkF1pGms80fqc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pSAqgjvU6NLrjKR2HFOd4eIQOdMmVYG2cd839Sb837Z4IiIjwjHkRFOTTEeZJOCIHTmKU8hLF5SRhnTHbnJvu96Nk7aiiykoikqGZjetYk3Orjfykmnuvp8aQm52BOg5fRTpPwnR4/uZWTOL1lGFWp0Fcpjga2jP2bO0EHQ131A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ITVmFGiW; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMgYavgSDt2P+5u4Y7KC0bR0UBeljl3Eg/qA5PrrsjWa1vdKR45D/KYWBf8aFC8UjForkxCtRzduZYg5Ez9jc2HWyg1e/K7ClmgTgb0i1g9+bGJjiZR+zkw6lOPgSgcwspjvBN3BR43X12UqFFk5bmHE0Y/W9HD6MRvC7aUA7M8u5e4M/x/iKIB5sfZm1wxCEC14xl3WGW0Y9fFJ0sWEX/dqTE79ochXIvJ/chhZkVITpdYBiR0T+KU+NiICCuYG3Y+VP/4FkZ9Qiz+nVlRsHP/1ln2+oYloN20FPFLSPGjB72ajftYLaIHh5f9l9TBSdLvaNYpyvO6ZoVZmifcJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyuwzbu04moTzRgb1M6mhiuHR5H6jGDkF1pGms80fqc=;
 b=MvoZryQSiwdwyP0sGzOJrrGyzFg+W3WpJA6m1MfHsMxUkj6+WNr3nMRV1D9sSni8nEwv7oLtw0apMngXGCZPKU/Ho4G/Be5T/G3ne6diIFSkUCPcvBm8pQMdLR5s/wd35hyQ0cgBYUdeENbo7zyxnLLQWZdQ7+QyO2WSamze/zO6OI1/Z9H5/E3xoXhPD8NjFX+r7+niPA1Jnlp2NKTkj19YJ058G1Ui7hwm07UOFZWFx47SnUUt9ea6ZjvOMFHbCpAw7YJOK30cOiKYZNFHpsrPFwX3EhquoTXpB7AGfFPkSRlGECxzkCepHqHoAoz1LZM0QdmLB8Tg/kpZDn5iow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyuwzbu04moTzRgb1M6mhiuHR5H6jGDkF1pGms80fqc=;
 b=ITVmFGiWB2/Z5SLO57jAQCO9X8tWr06qVq4KlUpcBKzn1FkQhMxDQVJVFevhJIybLd/xAHZIJo7HdHtHH1rqbZvL08RrxMJppD6f1n6aYujsHzyWX693j6rv0zEdKl7mKeYx6lHqLokcchG0nON4l20Hf5oxGhp17Se3jYlywqc=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by OSOPR01MB12313.jpnprd01.prod.outlook.com (2603:1096:604:2df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Fri, 18 Apr
 2025 21:22:00 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%5]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 21:22:00 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Paul
 Barker <paul.barker.ct@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
Thread-Topic: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
Thread-Index: AQHbpN+aTkZ10KsUDUyuFRr6/dlYB7OoSA2AgAFUOGA=
Date: Fri, 18 Apr 2025 21:22:00 +0000
Message-ID:
 <TYCPR01MB11492BCF416760E978541AFE18ABF2@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
 <20250403212919.1137670-7-thierry.bultel.yh@bp.renesas.com>
 <CAMuHMdVpiZ+F0TMbLm000M_Scwozj2-SHPrUwTHqFKckVcmufQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVpiZ+F0TMbLm000M_Scwozj2-SHPrUwTHqFKckVcmufQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|OSOPR01MB12313:EE_
x-ms-office365-filtering-correlation-id: fe228b50-46fa-468d-c5ac-08dd7ebf0e80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N05aQUdHSmRtUXV2aGVvS0pOcUVtaWhOVTFxeGpZRlNBd2d6TUFiRzZBMWlw?=
 =?utf-8?B?S0tWamt5ampEendKWFZJZXcxb0gyVHd5KzdHeC96QklvSGdoam02MENwU0Zy?=
 =?utf-8?B?eUdDZ0F2bTBHeCtrVkNyU0lYeENSTHlmZm56aVdNQ2Qyc1FTOWk5K015dVZH?=
 =?utf-8?B?VzI5SkVGS1NSdXczMTJxdjVGSWtpT1ljUDR6QU9leG8yY1U1M0RUcGVHMWlm?=
 =?utf-8?B?eW9PLzdzM1JHOWY5OGV6YkFuS3Y2OENoS2NuOWMycUJmNzdFTmh1aXBMVEV2?=
 =?utf-8?B?eFF6NUpxL2x2K2hYWEF1c1JMY3VpdUNncDR5OVdMRmF4VGJPQlB5YUkvVjF5?=
 =?utf-8?B?V1RmNnltcDM4Y0JxQnJqTWhOMXVwdFg4RTVaZHN0UGxZTDQwUmp3b2IreWtx?=
 =?utf-8?B?VGY0YkpPaTV3ZjhobGgzWDhiMmY5QWhhOENlVE5KTlBJbFRlZ004N1k2WVhw?=
 =?utf-8?B?VVl2ejcxRXNjU0Zic2NSZmRuWk1qQStNaW41aXBMeDNvUkppc2RFS1IxbXF4?=
 =?utf-8?B?a2hxUkVVazdaSjluM0lxbmN2SUlZd1Fsd0xvcVliQmo5NWZMeS9MTzduVXk4?=
 =?utf-8?B?eE5hREpTdngzVmtrNk9SQkpFZmt2L0MrT1ovY1NKRmlqelJPL3oxV1N2SWRu?=
 =?utf-8?B?V0JsMTVxaEcrZE9jMEtBN2lSOTN1M0RUbjdYakNIN1g4cWl3Rm1tSlNVNTdF?=
 =?utf-8?B?eERKTGpLTVdCSDE2R1dKMEVkSTVTUjJoa2poUVZZYXMxMVRGTW1MdkE3UVZY?=
 =?utf-8?B?ZDVJaFNpQVJjYkplRWQ2T3BXRnFRU0NPVEIwd2tNMHVYU2d5SURxRjJTbnYw?=
 =?utf-8?B?SG16YmQvYWRJUk5QL2dQbkdxZmM1TzVMeXVXYy9vOUNjU2ZwSG1iTGFyTnYy?=
 =?utf-8?B?czhTalFmSDIvTDdJcS9MOG1XVit1ZjRMaW9mRHVFRkplc0U1UHZyc01qWmJD?=
 =?utf-8?B?aWUvL0FydFB1c2NkU25UZ3pQSXgyMEpGT1Nnd2ZqTmJLd28zWXZDZzV6TThB?=
 =?utf-8?B?VExHd2lYK2dXb3BSM3doRkM5Tm5na2xpaVR6QkxGYXlnMStyUHpnRWhOV0sy?=
 =?utf-8?B?NTZ5WUd1Qm8wTkxCcVc3VS9SeCt1NGFuUUNjcUtKa0tsL2plUFZWQnd6VWU3?=
 =?utf-8?B?VWVTZHNoQ1BjbFZkaU5lWGVDcmgxQ2lUNnNtWUNJbG1YeFd5NEFVeklYYjJL?=
 =?utf-8?B?TzZpUUJESEVMWUZLQ3lWdWtGcEx4VlMzdzJDVm4ycDJrcXoreFVKSzRmMHh5?=
 =?utf-8?B?K092WExON2JxMTJQamxNYWRsSG83eEtUMXlTSkhjWmY2cTNtVVdsTVpDZlRN?=
 =?utf-8?B?R1ZuTEZmZUFPNnE1N1RtSTRFVnp4eEV6NDR3b3lDR1Z3RGFyRWRvOGY4OXpa?=
 =?utf-8?B?aTgwQlRpd0JGejkwTlRCbUdjbzJxQmo4QnpScHNuWHpCMi84UHVBN0ljZ2JI?=
 =?utf-8?B?TlBOY05BZzNXL0dHNUIyaHRNbnF2WUNwKzFlTXBPMk83QWZhSTBnM2F6bU02?=
 =?utf-8?B?bzVoNjYvL3g2ajVNVExwWkx3M08zTHRCSkRicEZiV1pvRDk1akJvSFJUN1JE?=
 =?utf-8?B?aXJWRTVGZUlOeHJMVUlLN0lCUHRYM05VV3FSbURoQ2dnZ0wvVkhXUDBVSlQ2?=
 =?utf-8?B?aXJDa2tYUjRJT0o1SWcyWXRBNjdzRCtTakVHa05lR3pGaHNPMmdKM2d6K1Bv?=
 =?utf-8?B?VVNnVTc0KzA3aTQwUDJGSjc0TjdFRCtnK2hIQ1BEZ1NZNG5kcWkySkpORnNS?=
 =?utf-8?B?NTBqT2hKUXh1YU1EWG5zSlNyZjVDZ3VucVpxVjJXb0RQbzdYMEFpYklsQ01M?=
 =?utf-8?B?UjcrVEd0cmtDd3h1LzQ5V0xtQ0M4cDZtWjBSMTlNQkhSbGx5dkIxOEVQTXlY?=
 =?utf-8?B?cU1SZ1RPdzAycUszVDFnWFpzNGpLUnhqQUxwcW1PYlBhWmZwRGUra3VVSkdl?=
 =?utf-8?B?b3pHWGVsM3drVnpnT1h5K0FCWGlhZzRYa0hUZXY0dExxTHl1R2hmeTlDMW9i?=
 =?utf-8?B?Rkd2Z2FGYWVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzNhOUdLb2tXeUxMMTVtWDh5bFBYMEFxNVc3K1JMd0xCU2VyTkFJMHVSdXQv?=
 =?utf-8?B?YnFDUE1RSXMxZjBpTlFKZjcwUzR0UDdFMVhISXNoVGhwcFFjQ3Z0S3VWYzVG?=
 =?utf-8?B?cGNKbjhFQzkwNTFzaUlSSEdOdzdmQ0lWbEhaRzVMMnlveUtodW5HNnVUVkRn?=
 =?utf-8?B?TzJTMkMrWE9Sa1IwM0xnR2gyazdWOVB0RTFqNUFhWG1rTGRReUtqdHNkL3Ux?=
 =?utf-8?B?a0l0TlgyWWhNL3NBazNXSlRKNVpNeGI3bGRwYXZkT0Y0WUNFcW5iTFRhZFMw?=
 =?utf-8?B?OE5GL1hnNzk0UjVlQTA4SjAzdzNvdVpCZmo1WjMydy9CSG1NMUxUT3pUWXlD?=
 =?utf-8?B?NG1IRnpudk1ZTHFEcHZCbG52WWtPSmN4d1NqL3A2WnlJNG5vS0pFSVNJNEh1?=
 =?utf-8?B?MmtUV0E0NDNBb0VWeDl2S0dybVhoWEVsSHBpOGh5Y0F6ckNhbGlMQXRseFpm?=
 =?utf-8?B?SnorU2pqZHNITTdLdWZUNi92dFFEcmYrUDdCQzIyMTYxVE56emlucVdQZy9V?=
 =?utf-8?B?UCtSYkI5SWxRVXFHcHU2QjhCMk9OVnhpTzQ0Tnc0N01qbTZhWWh5VnNrSTRh?=
 =?utf-8?B?MTdJVlRWd1FhVlBsNWQ2alJPVEp5WFdBY0RxdWlub2ZadkIrRXJ5N2Y4SVBN?=
 =?utf-8?B?bVlpNFlRWlkrcFpCZVNlc1R1cFJzL1lvQi9jRURMT0ZFTUxhVzRSRWU3UXp0?=
 =?utf-8?B?WitBSVNWTEVGTlRzeVVOaytkWFlRMmF1Y0o4eXpGTkRZMTNKSFY1SituMFgr?=
 =?utf-8?B?Y3J0Si9VUkxqRUVwRVluTTA5bEpubWREck9id2xxSmE2WUYvcTVSL0hiL0c3?=
 =?utf-8?B?cEVYYXU5b1lPRS9Hc21veTdUaWlWdk5XRXMwa2taMjZCbUUyVG1BZDVDYmY2?=
 =?utf-8?B?cWtyb3ljUXM4Y0tvaFpmQlpjY2V2S1ljMWNKTzdTME1pQ0NjdFhLRWY0YWE1?=
 =?utf-8?B?ajhmV202cGJaRUNKOFRrN0xVTzFNcjdSWTQ4OVpoNEY3aW1WYk1LZTh1a1g2?=
 =?utf-8?B?Vnc1ZGdsbmJnTXlqT293UEE0VFlUdmRWRXN2N2YrNURBVTBQL2xmekFuVVA1?=
 =?utf-8?B?VU1sY2RjQWZMNXMwblhBUkh6Vld1REI0NEFxVkxFUnI1TVl4YmpvT3ROcUlt?=
 =?utf-8?B?WW5PQ1lxZmJYZFZDMks5V3k1ekVEZFdsbHJrSDdYVjN2Ti95ZS9IRms1blZN?=
 =?utf-8?B?RCsreGpRQnUzVTFXVGd5T3Mvc1FKaEhXTlhoNjBOTWptbGlhM24wUnpoaUZT?=
 =?utf-8?B?OVIreXRPZWhLYmRVdkRSUS9YYU1Vb0dBOTdXT2tRdWVrWlg1bEswMjVZSkp5?=
 =?utf-8?B?RG1KWFN3STZBamNKakx4MGIzYlcvUWxhcG12eGVqRUZVOXUvVjlXN1kxNUNr?=
 =?utf-8?B?Sjk2NklXVmV5cnJrVnBya1RvUm5iZTkrdGxVZmtzMjRkdk4vUThiODI1Yjh2?=
 =?utf-8?B?dXV2WngzSkZsMkRIU1BVTDVLYkVmTTV2R0ZESE9XV2lCV2ZnZTUyelBjWHBj?=
 =?utf-8?B?bmlRaHNzVGNKY3haem5adXY4UmZyb29XZzVVUU9qaW9ySjRzaW5Nbyt5bExP?=
 =?utf-8?B?dUhFamdrT1A1dXMwYzU0TTM4NkJIelBWMHp6WDdsTWtydHhHSGxxeDJ6SlJv?=
 =?utf-8?B?djZIa1B4MllTdXIwSjZpZkQ1NkdCaG9VT2lxTkJlaEhiWkFpV0tTcTRnNExY?=
 =?utf-8?B?TGhJcjBrdUdjTGhEOGRyUVp1TlNvQjRVTVdqbnM2dkp1bmRtZFd4c3Z5MjNz?=
 =?utf-8?B?OWZYSld1YmpVd0drYU5pZWo5YjA5MXp6SVcrUy9qS2o0MzNwNzVHOFROQmVr?=
 =?utf-8?B?bVloY2t6Y01aK0hwSVV5cWswaEVjSklXMlhkRDBZVml2ZHZxVUNCMklMSnNT?=
 =?utf-8?B?VjNNYkpJWkF3dXZFQ0RBV3c0OTBNV1prS0dpL1R5VVJseWJTTy9HMGxHNU5t?=
 =?utf-8?B?M05wYmsvOTd3Si9QRVNrakhTSTNtUlYwOTRsM0FnZDg0SGdXWFBiTi9vWFE4?=
 =?utf-8?B?c2xqK2VhQURVcExoSkxXM2wxQ0d4TzcxMGhmWGpZV0ZPY2ZVVHNQUWFLcVNl?=
 =?utf-8?B?eDFIOFFuY1ZYVEl3TkJIK29aSURYZklkb05ZTzZXcVU5TE1aRlFMcGYzNmw2?=
 =?utf-8?B?ajB3TGxBOWV4aHc5RkVvN1pOdy9jbzZtWGZXRTcrWkpjUlFkNm0rVllDeVZE?=
 =?utf-8?B?dXc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe228b50-46fa-468d-c5ac-08dd7ebf0e80
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 21:22:00.3078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJr+EtuZ3jsgq7PWHfH4fUdPxB1xEeIluacXrIQr5UCLZc51grCEjD1KfUgdC5gj59dMRa4et76YTrA9tcr0DsTbr/sC0Z3Ehq+Xz+JDzDJktmchxiJ1KGmAIB1965ZK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12313

SGkgR2VlcnQsDQoNCltzbmlwXQ0KDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IG1zc3JfbW9kX2NsayByOWEwOWcwNzdfbW9kX2Nsa3NbXSBfX2luaXRjb25zdCA9IHsN
Cj4gPiArICAgICAgIERFRl9NT0QoInNjaTAiLCAxMDgsIFI5QTA5RzA3N19QQ0xLTSksDQo+IA0K
PiBTaG91bGRuJ3QgdGhhdCBiZSA4IGluc3RlYWQgb2YgMTA4Pw0KPiBVc2luZyBSOUEwOUcwNzdf
UENMS00gYXMgdGhlIHBhcmVudCBpcyBhIHRlbXBvcmFyeSBzaW1wbGlmaWNhdGlvbiwgcmlnaHQ/
DQo+IA0KDQpJIGFtIHByb2JhYmx5IG1pc3Npbmcgc29tZXRoaW5nLCBpc27igJl0IFBDS01MIGFj
dHVhbGx5IHRoZSBwYXJlbnQgY2xvY2sgPw0KDQpUaGllcnJ5DQo=


Return-Path: <linux-renesas-soc+bounces-28683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOoLL0qBpmn4QgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 07:35:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1F1E9AC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 07:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9541B301081D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 06:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF923845D1;
	Tue,  3 Mar 2026 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cAcUUDMu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011061.outbound.protection.outlook.com [52.101.125.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DA331D367;
	Tue,  3 Mar 2026 06:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772519749; cv=fail; b=DW65/Dyl4JqJCDICa+iME2yFHC35xDg0niyW4XecboVh0nISEJj8w+KNW4E9yad8lEbO91RRfMSl+fcIOVbMNIMsPAr0VqD3QDUXeOTNDrqL0TLCUdUVw3eLusvHKwalDeBinKVWXWXXZfOJcghRJK/qNFF0Y1S7AuPU/rMoVkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772519749; c=relaxed/simple;
	bh=6gB3Em1Z1xzYljvUkd7eZQjSpfs9YGQCS1OKY091Ix4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CTZgRtQjeWbpXI90qlusBiMUlRnXPBY42xwODQ2KZ7+3Ch3mWtBqQct0xpflvVXfUxtWXPpTqhysRK7OsmJs43F1QO/sWWrFu+bGvhmq8S/59VoqJbZREXII/zgb0955HOzR9PrTAQMKM6RHgod1x/Fp4ITEakgnN++Q+yz9vDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cAcUUDMu; arc=fail smtp.client-ip=52.101.125.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAb8i0sPYCtgxEqowBZGNwUsJFwfgRv0epPXnnVITPjnbKF0pKI7LeTh1eXPrlYFf5uAyfAduX+E+y89CckVWdCsNqb+8uz0TDYULnjAs30BqF6XzMiDKKnYQoONE6Y+vAiUrxugaR1tb/3ZyMgpqxNTp/lbRlkiOqsnuPXvaqT3XBAk/r7PF94JSoaDI8USyxKIsK13+X1LHBR8gzPLDTQS3hxWKRpmJixzeHVGrarZOe2hGHsmLlpZzAsuMg7IbOrUZfoG0o1k1L4fKnayF255nvABtfbil3HL8VIqJXoJlBUoNPIj6e/zi3X6Q/3MIESv9EqkhenVQ8iv5p4kKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gB3Em1Z1xzYljvUkd7eZQjSpfs9YGQCS1OKY091Ix4=;
 b=QUguXJqkmWphPAntGaSuUAbKWJawZo1xtTRQy1ectSnCc2T42K/BL2fSXI1ggEior57BciFUpkKzpppMxDXiEkUyyoCovxHy5Kh3u85lCLH/N+81yjyNIalOkiPLSBDi7oqxLW0QkjO3NYP5qqm9acqNFqTbGm+/C9HzUhHwHEWfDp9bXafCGHa/VvX4R8suvNH1RaHHV5hZuV6vTFqwqyXLezZexGljuSmCEsDfNtVsHOxHL1XdO8IR7gxccC8XHqgqXs/AG/16LL4YXTtRXY3HvIo8dwGnTt6+P1Z2YFC4xB7mjoGvXA/8GROo23J0AP+yH2cn1Zl3sWfi3DWbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gB3Em1Z1xzYljvUkd7eZQjSpfs9YGQCS1OKY091Ix4=;
 b=cAcUUDMuMQFixbavDOAklLTdVpk6EuzfHXZozcaRq1eIuRfJoY9buiaXeurXuf8J+u7IoxB1Y3uDkC7AamPY4DuqsyZf2ncyk6Ti3GMj7V04tGRVOtwBhYsFk3+nn3rbGcVWr4uobo9jvaKJIme/i1M8mMbXDGn62jmmzYyrXjc=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB17219.jpnprd01.prod.outlook.com (2603:1096:604:40d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 06:35:45 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 06:35:44 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v7 11/15] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
Thread-Topic: [PATCH v7 11/15] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link
 speed support
Thread-Index: AQHcp/6HFvMGp9Sx9UuT4qAndDWP9rWbclSAgADtbSA=
Date: Tue, 3 Mar 2026 06:35:44 +0000
Message-ID:
 <TY6PR01MB17377C5D0EF8CBE1C98DD8C32FF7FA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-12-john.madieu.xa@bp.renesas.com>
 <3b30df38-3a68-4d1b-9e61-77a80d3fe8a2@tuxon.dev>
In-Reply-To: <3b30df38-3a68-4d1b-9e61-77a80d3fe8a2@tuxon.dev>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB17219:EE_
x-ms-office365-filtering-correlation-id: b4b98e04-562b-4acb-150d-08de78ef1909
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 SPVc31Po/l4o9GYwxEn+u4CHamzD3FnTHRvmH/WxP0tK1/nzchRwmRmGhpGmi/E8dF4xSV/ERXC8HG1OEup2gcgJkWk/5gdmyFSwChvvydEqPoLDdG+T3p5DoISCgpfojrwXgB2koxCAqZ5HSZYBteItJxYJivg7sTRjWKi+mQbZ/LV/u5NfKcP7YDV635Q8OujbRMNH5nTk+2GsVRXEjpTBGLDzCR9XEn0Zhh6vB3acP4nkWrh4QKVlV/YiJXj0W6Pc/Jv0YZ700IoUab+6590ZahWF6FVVblao+56Cqa94gIcfRQrE9bQwKBoB4jNqSyW141e6bxtkorIaDhFGck1XUXvFku6B9cL6DvFCN8KIzB00VB3hEIqNOW+7ynBqASyHT2/oUEjXeKVo9WW43krlrrtEK0i5TT2kTzAK5i9LbXYkMTcGDpMQ5s+Xyvjzxpr/Ii2Ctpuu/FsCCSz/JpM6e5XSJrvQH+G4fKF0UCJLNUI89YVRTqJEZ+IVtM302NCCVgL257mXwjaiMbSI4k2hqsPc6nfV7BlPPypqRo0z/AqRKFRdtoUilhhrHr9UlYcBJSA4gcvGw1fn13EN1VY4WBKJ/WFgcKNZriBrqpE1tctPIR70qIo8/JpruOKqhVUH0/gpMBTPURX6/hKImayhYranxgRNzejBzfLaqKXDFZ8qZyuT8jSQhnRnh97p8GJJnVsWOZNLGXMR6D9Vp8H3XThSodlEHjig9dFftPGeNTGOX1WbUAaKUWo7PBvxXegFU0OKmepSWfhU4tK96jA4+1zY/8K77H7dwy1l5O8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TjdjZzJDcXgybnZ4MjQ4SmZiblYxM210TXdKZEJMOTk5L2x6YlNnSVdna1BE?=
 =?utf-8?B?WXRQNmtjbVljcmdnc2JYY0FtS1lXRU8wOHJFYnVRQld3emY5eklpRmNsT1RK?=
 =?utf-8?B?U09xQW5Xek0rK0NocGxaNFA1QkZ4Q3NDT2o5WW9WNHNkNElwSmZPbjZmVEhE?=
 =?utf-8?B?QTdUb2doTGVrdm1mbnpuYmdHTjd2dXdNdkxsbEphSFZvaGsrNitZUjRtTzda?=
 =?utf-8?B?eExBUXBXS0IyVk9QdGpROWwyaXdZdnFvVExqMVRUMnVlUkFYQ3krUGJyTGtM?=
 =?utf-8?B?ZkJCenRjN0Zoa3VjTUt6QkpXYkUzeTlQbUVOQWFla3VKcGNmZ1FsN3NIc1NI?=
 =?utf-8?B?cXl5TGdOT0hIRDVFYWk3ekhsQ1dmaTlmRmI3MjJkTlNQVXNKaEZCcjUvZERn?=
 =?utf-8?B?emZhWVJ3ckJzMkhDTTh2dm52YzBFdkRNYVB0U1NUMG1FOE1ZaHJVUi8zVlpp?=
 =?utf-8?B?QXJWSTN3YkRiV1Z2OVpWUXAxWU5vbGd0UWdaWnJHM3NTcjliK1NWT2phZUcz?=
 =?utf-8?B?dlozcWFKeS9lOUo4NGtaV3FhRC9FOHB4Y0pKMlY1ZUNOSndwRThtWnovczAx?=
 =?utf-8?B?bi96LzFCRGx3QlFUeXhxWnRPUWNCQnZsTSszWW9lYTE3Ni80aWtUTzh4Y2Jo?=
 =?utf-8?B?MHNSRzZkUXA1OUkyTm91RnM0OGczTHM1NFhwdFZoTVFUa3BhTGY1QUVWWUZB?=
 =?utf-8?B?eTBoTHg3Nm80WUtCNWd3dmovU0JjdTZJOHUrY3VLMnNLMDUxSTdBZHM4M0dT?=
 =?utf-8?B?RUx4b2piaU5iOWxSSnkvTkxkWVdHbkFYaDVkQ1Z2WE9ITkNOY2Z2djJHdHBF?=
 =?utf-8?B?VlFqQk5DVjZvOFRTcW1QZ1BFS3NubVI5aFE0UjZOdzVXUDY0cFcwY1ZyUHdu?=
 =?utf-8?B?UjloK1Z6dGUyTmpEUVZ6ZE5SdVNObFUrdjliK3ZNVU9Pc2xtMGZqWXlXVWhC?=
 =?utf-8?B?UWRKMGlhWnhEVmJDOVVzV2lIU3JNK2dwT3VKL0xLL1BOajlRME1hcCt1VCts?=
 =?utf-8?B?VEZ3UE9Hay9iNTZvUWJjc3VLMzBxa1UvRXBOb0tNUllVRTQ4amNDMzN6RnJG?=
 =?utf-8?B?YnZ5YXdKdUx3d3dyVG5jVjJ3cnVkTDZLQmZGYll3UnRjdS9wODVVMGZ1V0lq?=
 =?utf-8?B?aE5pU2g2ejlOc1dtbS9xYTkyNCsyOTFYTEp5QUVmL25PVkZSZXBhL0VZZkh4?=
 =?utf-8?B?SjNlYW1vM1RRbTl4dDdWRzFEYk51SC9vYVdVamMzeDNnSmlCWFpvVlh3Y2gx?=
 =?utf-8?B?MGtycHFxbTNYSjFaTTBLM0hxU0l4N0VCY0FxNVlmdzB5Y0xNeHlqcG1majlT?=
 =?utf-8?B?TWJBclpMREZROTBwbEo5cFhYNTloNU9tRiszTVVnNk9oTW1SUUFRR0crdThD?=
 =?utf-8?B?MldHaHFiSEFkeGt3Z29maWZ5SC9iYk9naDZPY0Vrdm5EbFVBdjlZT0Q0Z0d2?=
 =?utf-8?B?UnlPekRGQ1B5eERJZS95RFA0c3U4R0VDb3AzeE85QW1EbjhPZ1RRMVErYXdG?=
 =?utf-8?B?cEZGYTQ5ZmVDLy9WYkQrQWI1V0NRYS9BYk9rdkdGK3U0ekh4N3lqSFl4Nzc0?=
 =?utf-8?B?c0FkcFRHUkpVRTRET1ZhSCt4TEpZR2l2SlhidlQvZDd3VFY2OWJRTml1TUx4?=
 =?utf-8?B?K09kSjk2RlRyQ0VYUEViSGJhRHIxTEVoZ2lzUEJEMitUb3M4UGQ1MXhhZDRn?=
 =?utf-8?B?bzI5S0EwaUQvVTgvUWE2Nklrbi9MaUtlaE1iSzkzTGdvUGQ1cjgwR0Vpbm9H?=
 =?utf-8?B?VnlveE5QeXgxcjh6RnR1R2hFMUpiWEJ6L3doMFE1Y0FmemZKWjJSVVJEL1po?=
 =?utf-8?B?OWxkandScFpoUmEvTGN5ZWtPcDY2TmJEWmNLMG5Xd0czRDBRdDFGa0NJYXF6?=
 =?utf-8?B?UGxvRU9EeVVBQ1pMbTdpSFpESEwxOHBzeGw4bVkvTEltTU5xZkx2RzVaUDNM?=
 =?utf-8?B?QmxhZWxLZTlyMmNIVStYeERvUk9lbW9XbGU2Z1NuR1BNUlpQRnZ0aUduYmhm?=
 =?utf-8?B?Q09ZUHhmZ0IyNnRqL1g0SUVkYXJPVnd1NXJqcnJMNFhRU1ZtVU50N094eXFw?=
 =?utf-8?B?VXg5YTJ6MzFhbW1yOW9WMTY1MmZLQkxwOTc4T21wejQyUlNMTU1BdExJRE5E?=
 =?utf-8?B?V1JRaGtxRVNFYXliMjM3YUs1Tkh1VmlHL1lJOGVPd1Znc2poUzZnaWFHWDNz?=
 =?utf-8?B?TlFJcFVKdTVaUTVPMTAvYmkwZG95VVUxVVlJYkl5d3F1ZHQ4cENyV3NBanZq?=
 =?utf-8?B?NjZEa29MNmNsQ2FoTlNqV2RIU0hNM2xMUEhqTWRWTmNuVWVQRWRCSWx5dTc0?=
 =?utf-8?B?NUxHd1RJdCtiaGNlaWJWbEtuUUNzU3cvZGtIb04vU25Ncm5QNk9BNkwwRU1J?=
 =?utf-8?Q?1fZHLVY3xQn+JGZU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b98e04-562b-4acb-150d-08de78ef1909
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 06:35:44.5633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAjUBbeb+GGlpzFn+4D1TySAHCKT3MJoPiSTZX2hnm/kztxOnmwj8Vf/OlppetwsW0cFxY6vFg08pEBC5piiBZ/+e0TteQ+RpH4npAYlhWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17219
X-Rspamd-Queue-Id: 72F1F1E9AC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28683-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:dkim,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Action: no action

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBNb25kYXksIE1h
cmNoIDIsIDIwMjYgNToyNSBQTQ0KPiBUbzogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJw
LnJlbmVzYXMuY29tPjsgQ2xhdWRpdSBCZXpuZWENCj4gPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJl
bmVzYXMuY29tPjsgbHBpZXJhbGlzaUBrZXJuZWwub3JnOw0KPiBrd2lsY3p5bnNraUBrZXJuZWwu
b3JnOyBtYW5pQGtlcm5lbC5vcmc7IGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlOw0KPiBrcnprK2R0
QGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAxMS8xNV0gUENJOiByemczcy1o
b3N0OiBBZGQgUENJZSBHZW4zICg4LjAgR1QvcykNCj4gbGluayBzcGVlZCBzdXBwb3J0DQo+IA0K
PiBIaSwgSm9obiwNCj4gDQo+IFNvbWV0aGluZyBnb3Qgd3Jvbmcgd2l0aCB0aGUgcGF0Y2ggZGVz
Y3JpcHRpb24gZm9yIHRoaXMgdmVyc2lvbi4gU2VlDQo+IGJlbG93Lg0KPiANCj4gT24gMi8yNy8y
NiAxNzozMiwgSm9obiBNYWRpZXUgd3JvdGU6DQo+ID4gRXh0ZW5kIHRoZSBsaW5rIHNwZWVkIGNv
bmZpZ3VyYXRpb24gdG8gc3VwcG9ydCBHZW4zICg4LjAgR1QvcykgaW4NCj4gPiBhZGRpdGlvbnZ0
byBHZW4yICg1LjAgR1QvcykuIFRoaXMgaXMgcmVxdWlyZWQgZm9yIFJaL0czRSBQQ0llIGhvc3QN
Cj4gDQo+IHMvYWRkaXRpb252dG8vYWRkaXRpb24gdG8NCj4gDQo+ID4gc3VwcG9ydCwgd2hpY2gg
aXMgR2VuMyBjYXBhYmxlLg0KPiA+DQo+ID4gSW5zdGVhZCBvZiByZWx5aW5nIG9uIERUIG1heC1s
aW5rLXNwZWVkIGZvciBjb25maWd1cmF0aW9uLCByZWFkIHRoZQ0KPiA+IGhhcmR3YXJlIGNhcGFi
aWxpdGllcyBmcm9tIHRoZSBQQ0lfRVhQX0xOS0NBUCByZWdpc3RlciB0byBkZXRlcm1pbmUNCj4g
PiB0aGUgbWF4aW11bXZzdXBwb3J0ZWQgc3BlZWQuIFRoZSBEVCBtYXgtbGluay1zcGVlZCBwcm9w
ZXJ0eSBpcyBub3cNCj4gPiBvbmx5IHVzZWQNCj4gDQo+IHMvbWF4aW11bXZzdXBwb3J0ZWQvbWF4
aW11bSBzdXBwb3J0ZWQNCj4gDQo+ID4gYXMgYW52b3B0aW9uYWwgbGltaXQgd2hlbiBleHBsaWNp
dGx5IHNwZWNpZmllZCwgd2hpY2ggYWxpZ25zIHdpdGggUENJZQ0KPiANCj4gcy9hbnZvcHRpb25h
bC9hbiBvcHRpb25hbA0KPiANCj4gPiBzdWJzeXN0ZW12ZXhwZWN0YXRpb25zLg0KPiANCj4gcy9z
dWJzeXN0ZW12ZXhwZWN0YXRpb25zL3N1YnN5c3RlbSBleHBlY3RhdGlvbnMNCj4gDQpXaWxsIGZp
eCB0aGUgYWJvdmUgdHlwb3MgaW4gdjguDQoNClJlZ2FyZHMsDQpKb2huDQoNCj4gVGhhbmsgeW91
LA0KPiBDbGF1ZGl1DQo+IA0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IENsYXVkaXUgQmV6bmVhIDxj
bGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo=


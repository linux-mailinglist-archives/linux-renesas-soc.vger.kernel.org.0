Return-Path: <linux-renesas-soc+bounces-33595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ztNsEc2DIWo2HwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 15:55:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE28640930
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 15:55:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=vIC0qgdm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15DFF30E981B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 13:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EE947DD60;
	Thu,  4 Jun 2026 13:39:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FBB4014A1;
	Thu,  4 Jun 2026 13:39:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580362; cv=fail; b=MLfAImNWQy9cStyG4p8lbgfMVImQK+CaarPq9q1tWMoO7ZFa5vJb6Li5PT/FueswbStFgHmc84iFMo4xDyp3mvCwPdFbkKdiI9qOxAg/gSBgRdOAwUCS1JSpXlnZWUeFif6sQ3Q1Zgorq4Ltdq+w5sswmwylOVBDktJHq+ukHhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580362; c=relaxed/simple;
	bh=aEbO4Q9bffa23+997pzoMk3XQjbc+WxxXFJMWmp0AF0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Es4UWHnQdhOi7hZXJ392orfxD/tTEahKga9FOhv5xse34TPomw1O3SOtnRdG4b533HTgW0UFI2KWBBOey1nq626VYRHUNE1KAq09pqhnOX/SqufuwvT76zoGZZ8zK89LkR0tb+cBpXKsM6J2jQP9GsA8QsAZNlwNfyt4bc14QQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vIC0qgdm; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVGtvowy5Vfn3tUCezzRL27R7Z89rTQDghWIGCgBL+JLsGYLN+I3W6DvdWPD5qF5D0AQ6hIjLQJ0Z7UnQVBUUd7aZarFuOXrz260QPz78+2JxtWVvOGnzFJDwR6W6gRXS/53DXN1D8exK1GWggV3Qqbfjye3feRkGFIIXNU8AkzKOEYF/2UoAe07i9UnzSVoqkTy8i1k8yGeNRXmny4Ys4bn4n4Dh8f/AmfLT90YVuLB7+v1+8uoGtZBM6/U5KRRTRnohEebKrgWJCRCuk4MwoI1aEpt/+6/TIAg/p4fhbGKLtrBRM+kysSZ4qzecrwLoFiLFimH1/axKmdkZcFPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEbO4Q9bffa23+997pzoMk3XQjbc+WxxXFJMWmp0AF0=;
 b=j7QmVwTrokznF11FuWjT/MHOI+44CeJD1aNQ+ZdBAQkyITV+tsv/6Uroo0jLBUBZMI1uXOyGs46LAXV3dXb1XTVM++gTbkd+EDJPOshWygrxpBzhC6oSL/K7Cx6lE7OMAm6vrAM3KhWALUydmcabhbQD+r0N+B59O1GC35M0I4EtYhzb/brrbct2YO4cIQ+J5pUWux+QPFziomx4yhWaNe8DM7V9kMETc8bDpbQvkjk/IDJEZVYmNdgwk/KJUDPOkuZ4rXzOCa1V/3rHwD1afI3AVJkm/AxH3DxLv2WX6yBKgt8HaIpWI7c839QTj5lywzBAhUihG9BBB8Cik9E0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEbO4Q9bffa23+997pzoMk3XQjbc+WxxXFJMWmp0AF0=;
 b=vIC0qgdm1MRTqpbw500EJ+V+9kUK8sMxn5uNpdAeUIkhGcvJ7ehCkxYjseNkALvqfcKurEOqVeJgimqi4hSX97sZXPV8KvCkhK6gNZs554C6fF/3HNznQ79wVLdHlw7uex7pFhrGTWza8lCs1PJDp5A1zE6qGODCWTR8hsujppo=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB12765.jpnprd01.prod.outlook.com (2603:1096:405:1ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 13:39:08 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 13:39:08 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>
Subject: RE: [PATCH] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names list and ports schema
Thread-Topic: [PATCH] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix
 dma-names list and ports schema
Thread-Index: AQHc85eU3NHjY0I8i0G5THlzMCFe7rYuTvuAgAAYdIA=
Date: Thu, 4 Jun 2026 13:39:08 +0000
Message-ID:
 <TY6PR01MB17377755340C075DE87D3F6A7FF102@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
 <CAMuHMdVHSyaD9JBgCuC-saw8SV2WvN2H+hnMX8Nw6LJmoNQmXQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVHSyaD9JBgCuC-saw8SV2WvN2H+hnMX8Nw6LJmoNQmXQ@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB12765:EE_
x-ms-office365-filtering-correlation-id: d8696a16-0dba-4a71-82da-08dec23ea720
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|3023799007|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 EQwSAVUOfKT8OO04xn424LWb41NUizqOqCanQQMR8oQkzOGsOHR0yFfoFrkguFJANylxI7popw970eG0fkEmJMbjSa2HCLbHFjjQdSfJ1tiAvAQRfCZ2hSszzG2603RtnBLWdfq9z+uyfGSasgFPABCESWx+XGiiLT1MixFIGoucXzj7OH8iTvWdc97yCijU7jUmWgBrgVOx3KuITfautQLohy8URc8Jvnf03y/umFO4LUQfKtJN97RDEjWXUCR+GoB8de6h8pQHQdRm2grm/b/YwpR9MpdVodopeRR5oEXPjUD0L2cEgrviQgwbgUlKwxOehh9QnenZapeXv7WaoQEQRYwqVZCxm5AfNDov22un/ZPS+PwGyG0UcUeOjF5yqibdi9z657X9PnLh76lYmplDxSaWxRQDqd0/Kt4HcTVY0m9FVRXXW8znODSoh183UICrU8sGT7MgZrgZ03zCKMuzvpjpJw9RTljk2+CZLZj86Omt9yV5itQ+Fv9BCPJcMgqy/uPysyEKu/DB77W6mPRr6Q/mRyo3R9EJVix19YX4QkyFQGijD3OqJyFhqicUy7dwNPjoHFRZUyP/aLzPwynf8AEVL87yxREH3JvMIG+rRGQJGeeJaV1qsM7qsgbbj6UnofqMv3OIvU9x1X/e/ZADIHed+u/oUTh5syeeCoVsoawu7b4njLQQyQzEzT2fXpB9GOlxj5NPEn+ZcB0dKJh/3QEIBn+zJrb5n6TX2LyiqzLKakm5EQg9ZEKmCjnd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUMvQXFHRzFiUVRSenRyR0wrRGVyOVRHbFFIS0hocUNiUVVFcnF5cnhNWjJB?=
 =?utf-8?B?OVUwWXgrY1lUbmlmYXJmRm9JakcwR1I3cjJNWEdOK2IxR3BvMHJsNjF3SS9H?=
 =?utf-8?B?RUpFU3dlTzNMUzJxRWc1bEVwbGZHcjV0ZU5XdDl3V2x1c3pIQTVIb3duTzA1?=
 =?utf-8?B?ZTlNUFdqbWhDSDRDS0tianRHZVFTL3d0aHdIY2pYT01idmJkMmFoWVBkaklt?=
 =?utf-8?B?V3FlaVRXZE1MODRYelhoUG84akdKazVZOFo2TjlqQXpYaHRjdUFzbG9LSnBF?=
 =?utf-8?B?YUhEbGhTRDRtMytlaXNKWDllOUdiMWw0QjdHb3FkVzJheVNjNkZpbjBBK2pB?=
 =?utf-8?B?b1g3M0NESmR1SXZML25YZ3JnQW45RSs3M293SlR4dDY4cWl2NmhpMVhsTis4?=
 =?utf-8?B?LytMV29JaVI4WUVsMmdWdHg3WW9zRmVUOXhnRlRZenFnNmNqOGtGc0VUQ2tX?=
 =?utf-8?B?ZjBCaHBiWFNaZVlwRDk5bDNseDNYQ0xreG1TSVhJem5rZER0MnFmb2NNSG5p?=
 =?utf-8?B?Y2twNjBpL2toWDIxSVkwQmpYTE9wd1NtM3RhcGgrbVZrTWRIbUdTOUdSM3Z1?=
 =?utf-8?B?QmFFM0NNN2JEUG5mOC8vdW5tUnVwSnhuK1lVR2pKbVg3aTJhY00zZktJSUdC?=
 =?utf-8?B?NkxJcnduRzBWWTYrek9Keno0TjlYNGZCNlBpNnRDTTNFSy80Ly93RHpzUUh0?=
 =?utf-8?B?MXlXNjFQdDFpenNaTE9nazQvcGsxSnp5Y3JmQlZrSFBkaHIrUGxFbXJ3QzlN?=
 =?utf-8?B?bkxYczBINnIzRzZ3bTBqNCsrVHZHeEdIZmpJZWduVFV1QzA1OVJyUDFHL0ti?=
 =?utf-8?B?aUV4akowbGpMOWVma2hxQzF1NjNXai9WaWVvNjZrZ3U1SnhiVG5VQWdFQ0Fa?=
 =?utf-8?B?WDVxazB6T0JuVGpnL0RKblZxbStYaFU2OHVKL2l1THk5S0ZjV3hXZ3dlTVgv?=
 =?utf-8?B?Q0o2WjUraW9KYnM1bzl5ZW5aMGdUNHdMS1FhOEx2aC9zdy9pWWRwNWpPajRy?=
 =?utf-8?B?dXVWQzQ2UjRta056T2dBL1JySEtjTnNOYjY5UTNGVjExRng0SkVVdXJ1eXl6?=
 =?utf-8?B?UWVoa1FoUFg4cFRWSUNhK0ljUEg3WnZqcE1uK1RiaHEzc3VYS3J2S0dLWjY4?=
 =?utf-8?B?TXJHdGRTcUM2dEtUdnBpVHVYTnhoMEM3eWVXU0x3Zno5OEhlYkpzQWVCUFNF?=
 =?utf-8?B?UHBuUVY5UTYvRzM4T2lTc3czaytzTEJPazdNVVRzZ09BNWRHaDFwanRqR1Fq?=
 =?utf-8?B?cnRlNnE4SWdwR1M1YVErMkp1elFyZXBUdThYbGpuOHlyUXVMMnBsL0VxL1Fk?=
 =?utf-8?B?VmNJZ1Z3bVZQMUJtYXhzZ1RSdlRmUStRS2ZWYm04WVFHSVB4VW1RU21oWGdn?=
 =?utf-8?B?WlgwNjBoSWxvd0FoQ0NhOVZkV2VpMEJLK0VzcUVjZ1JLMi9NOFJhK2lXQzlG?=
 =?utf-8?B?RVV6SEI5QnJIaVh0MTZKalp5RzNqOG9DcHFZQTFUSTlpVk54VXE3NlJQUTN6?=
 =?utf-8?B?WmhISGRjUElZOTI0TTkxczVkQUZlcU9SYytFcS9HR2V3ZmJHQmtUaFFDWWFY?=
 =?utf-8?B?bXB3SE5rdHhpOFU5elpDL0kxSi8weFBRUDJEaGdoemtRQ1l5SEdpc216c3gy?=
 =?utf-8?B?ZmdNMU1WN2NIaHM1RTFjRnI2R211YTBLbFdvOERYclJ1QWNGSXRQeXZ4YW8z?=
 =?utf-8?B?djBwcTNaLzZqSFg2S2hJUkE4SUhSM0krMFN6SzMvb2VUY0JPVmp5V0FCV0pE?=
 =?utf-8?B?SGlvZythdCtqamVtMlpvSEY1bGdLZHZOOTFXNlEwc0pBN01HRXk0ZlEycHlC?=
 =?utf-8?B?OEw2cm0rRzJCYmtEN0pGS1FTU0h4aTJyczhDR0pWSDM2YVFlekdRRldpeld5?=
 =?utf-8?B?VC8zelc3MlVia0x1aXp0S2JXNm1WVXFiVHRqcWhBSUxqMUxrcTZwMytyK2lj?=
 =?utf-8?B?alVTaVZYcTlqemQxTHBKcC9XYzRjT3JUS29YTkwrS0doYTh2azUwT3k5Y2M3?=
 =?utf-8?B?TWhOa05NUDNBcy81eHdtYXRON25FVTZrMGpZZ0o0VzlINDVPQ3o0aHJZa3BO?=
 =?utf-8?B?U0loZlV1MFlvN0I5ZUYwZy8xWFFtZ0JtVlpyTnFGMlRkUStRMHEyU2lMRUtW?=
 =?utf-8?B?U3pZNE81b1hGY1o5WHBBT0FuQUZCVGE0cnQ0QUlaeWRqaE0wR1pEcExWUDBq?=
 =?utf-8?B?YUdRR2VEeC9NbWJqY3lVelBhdkhFMUZ6TTdUVXNYS1VwV1R5WEplRDUwMHpq?=
 =?utf-8?B?QzBDZWJEdnAzSDdtM3ZhQ0F3L3pyV2lnTXdzWGhkQmJGbngxb0svQ3VnUzVQ?=
 =?utf-8?B?SDBlelBRSEU1bWVJRHhkYXNuR282SUxvc3U1YzlxQ08wcXdPOGVFUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d8696a16-0dba-4a71-82da-08dec23ea720
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 13:39:08.0651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEdiQm/ZkSzkchxNs31zR8AODKIc/2g5UElApOy+qJNtfQr0etevasrwAmp1sRK6mGv2CChXMyrl6cZbaooG2NUbznrVeDwPMvYd69YP/aQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12765
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33595-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:john.madieu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,renesas.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EE28640930

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4gU2VudDogRG9ubmVyc3RhZywgNC4gSnVuaSAyMDI2IDE0OjEwDQo+IFRvOiBK
b2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IENjOiBsZ2lyZHdv
b2RAZ21haWwuY29tOyBicm9vbmllQGtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsNCj4ga3J6
aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBtYWdudXMuZGFtbQ0KPiA8bWFn
bnVzLmRhbW1AZ21haWwuY29tPjsgS3VuaW5vcmkgTW9yaW1vdG8NCj4gPGt1bmlub3JpLm1vcmlt
b3RvLmd4QHJlbmVzYXMuY29tPjsgbGludXgtc291bmRAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtcmVuZXNhcy0NCj4gc29jQHZnZXIua2VybmVsLm9yZzsgam9obi5tYWRpZXVAZ21haWwuY29t
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFTb0M6IGR0LWJpbmRpbmdzOiBzb3VuZDogcmVuZXNh
cyxyOWEwOWcwNDc6IEZpeCBkbWEtDQo+IG5hbWVzIGxpc3QgYW5kIHBvcnRzIHNjaGVtYQ0KPiAN
Cj4gSGkgSm9obiwNCj4gDQo+IE9uIFdlZCwgMyBKdW4gMjAyNiBhdCAyMjoyOCwgSm9obiBNYWRp
ZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBFeHByZXNz
IHRoZSBkdmMvc3JjL3NzaXUgZG1hLW5hbWVzIGFzIGFuIGl0ZW1zIGxpc3QgcmF0aGVyIHRoYW4g
YW4NCj4gPiBhbGxPZi13cmFwcGVkIHNpbmdsZSBzY2hlbWEsIGFuZCBkcm9wIHRoZSBub3ctcmVk
dW5kYW50IG1heEl0ZW1zLiBGaXgNCj4gPiB0aGUgcG9ydHMgY29udGFpbmVyIHRvIHJlZmVyZW5j
ZSBncmFwaC55YW1sJ3MgcG9ydHMgZGVmaW5pdGlvbiBpbnN0ZWFkDQo+ID4gb2YgcG9ydC1iYXNl
IChhIHBvcnRzIGNvbnRhaW5lciBpcyBub3QgaXRzZWxmIGEgcG9ydCksIGtlZXBpbmcNCj4gPiBw
b3J0LWJhc2Ugb24gdGhlIHBvcnRATiBjaGlsZHJlbiwgYW5kIGNvbnN0cmFpbiBlYWNoIHBsYXli
YWNrL2NhcHR1cmUNCj4gPiBwaGFuZGxlLWFycmF5IGVudHJ5IHRvIGEgc2luZ2xlIHBoYW5kbGUu
DQo+ID4NCj4gPiBXaGlsZSBhdCBpdCwgZHJvcCB0aGUgdW51c2VkIHRvcC1sZXZlbCAjYWRkcmVz
cy1jZWxscy8jc2l6ZS1jZWxscw0KPiA+IHNpbmNlIG5vIGNoaWxkIG5vZGUgdXNlcyBhIHVuaXQg
YWRkcmVzcyBhbmQgdGhlIHBvcnRzIG5vZGUgcHJvdmlkZXMNCj4gPiBpdHMgb3duLCByZXF1aXJl
IGludGVycnVwdHMvZG1hcy9kbWEtbmFtZXMgb24gdGhlIHNyYyBzdWItbm9kZXMgdG8NCj4gPiBt
YXRjaCB0aGUgc3NpL3NzaXUgc3ViLW5vZGVzIGFuZCB0aGUgZHJpdmVyLCBwaW4gY2xvY2tzIGFu
ZCByZXNldHMgdG8NCj4gPiB0aGVpciBmaXhlZCBjb3VudHMgKDQ3IGFuZCAxNCkgdG8gbWF0Y2gg
dGhlIGNsb2NrLW5hbWVzL3Jlc2V0LW5hbWVzDQo+ID4gbGlzdHMsIGFuZCBwdXQgY29tcGF0aWJs
ZSBhbmQgcmVnIGZpcnN0IGluIHRoZSBleGFtcGxlLg0KPiA+DQo+ID4gRml4ZXM6IGE4NmZkM2My
MDIxOCAoIkFTb0M6IGR0LWJpbmRpbmdzOiBzb3VuZDogQWRkIERUIGJpbmRpbmcgZm9yDQo+ID4g
UlovRzNFIHNvdW5kIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIE1hZGlldSA8am9obi5tYWRp
ZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0K
PiA+IC0tLQ0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3Jl
bmVzYXMscjlhMDlnMDQ3LXNvdW5kLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvcmVuZXNhcyxyOWEwOWcwNDctc291bmQuDQo+ID4gKysrIHlh
bWwNCj4gDQo+ID4gQEAgLTMyMCw2ICszMzMsOCBAQCBleGFtcGxlczoNCj4gPiAgICAgICAgICAg
ICAgPDB4MTNjMzEwMDAgMHgxZjAwMD4sDQo+ID4gICAgICAgICAgICAgIDwweDEzYzUwMDAwIDB4
MTAwMDA+Ow0KPiA+ICAgICAgICByZWctbmFtZXMgPSAic2N1IiwgImFkZyIsICJzc2l1IiwgInNz
aSIsICJhdWRtYXBwIjsNCj4gPiArICAgICAgI3NvdW5kLWRhaS1jZWxscyA9IDwxPjsNCj4gPiAr
ICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiA+ICAgICAgICBjbG9ja3MgPSA8JmNwZyAyNDU+
LA0KPiA+ICAgICAgICAgICAgICAgICA8JmNwZyAzODU+LCA8JmNwZyAzODY+LA0KPiA+ICAgICAg
ICAgICAgICAgICA8JmNwZyAzODc+LCA8JmNwZyAzODg+LA0KPiANCj4gV2hhdCBoYXBwZW5lZCB0
byB0aGUgZmlyc3QgY2xvY2sgY2VsbHMgKENQR19NT0QpPw0KDQpNeSBiYWQuIE5leHQgdmVyc2lv
biBvZiB0aGlzIHBhdGNoIHdpbGwgYWxzbyByZS1lc3RhYmxpc2ggaXQuDQoNClJlZ2FyZHMsDQpK
b2huLg0KDQo=


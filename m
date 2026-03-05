Return-Path: <linux-renesas-soc+bounces-28898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHBSJv2fqWnGAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:23:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61A214708
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F05031D1289
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 15:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA213C277B;
	Thu,  5 Mar 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wgwjxtWO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC5F3C6A2E;
	Thu,  5 Mar 2026 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723923; cv=fail; b=utKbS4bNk4JRsE5cc4bt+oJedM7isyg7iMBg3SQDcJVqeRgRyUQmvNsZpwSucsICQlA4ZqZHfYCRqG3zwxU0EK3+4O1Kn57wmRti0du3o4hdmQEV3ue+ttMWvmpI6GXbKNeFN5O/uKxCosstdV0AriFNm2huPFc3WJP4km1cBPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723923; c=relaxed/simple;
	bh=sX/vfjyk3E99kEgRyqWYtW+IpByWN9BBjU6ZiWoKTbM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mj+nSHaY8oc7ZdeW7lXq1Z0rCR8wK3Eo1o8ntFulgBi9ZERbbFSKXmE5hcqNNQgIbYP5C5q2/5nYIa09TN8uIldekM6H2V8Q8uC09I03MPFI3XXs1/Qq+nvfaWZCh9q3Kw+nE64BR7piGK3dEZuNqyRsnW6ZddNtlOjVlhs/85Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wgwjxtWO; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUR3d1qCLtXr1F9n/D7njz9V8NxWRFtoYl5h2qfQSQOFKWbm0et85jypXUm+po5d5IsYRUit2UeDORfJYJumE4I8skVC0V8qeErJiW+y+oUJgbwoQUxw6nIYv3EP2Fr3zRmKOGePZyuZ4guxQchKo9PcXdBg76Hd0Ei9RJAJGcJSjVTsXiBoRFbG1FEHoO27a7R83VcC9lTNax1p32K/BLDPfK2mAwbRrjk8693OflUSV2U5oZ7kEAQ1zvQSPaA8GPdPKLYEodvWMKoxPYclX+tDXTeIAtYuio+b32WcSPEuEL/8uc0eXtFmj+Gw2V/hFRjbJuePlyzDhQ/w9Q6ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sX/vfjyk3E99kEgRyqWYtW+IpByWN9BBjU6ZiWoKTbM=;
 b=ZJ8BqMXNMLrtuiHdhIYK4ZFF+ouEBqzBFQgSjMkB4wXnVMGNVCd0AuHWRqTPzvshGjT2+xH7242SjamMge9uExMGaqXkaplRm3tdsfn57nfNnDyaZmUicErbK5+y7qH+nFDIl1nOSb7jrPbp3afvpWZCMIqex7kLwfszn9doTrIwGbQtUCBYbtPJGM/qEY5j/sXDak9ha72vxH9oxTfyM1DJvqY2m9use3YT6IRD87ivsoIuT+NxM6zFf7NalaPS6gARuLV+yTKa5euZ/9n+7QIr3JiT2Pt2REWgO6QQ9RjuSb0ZLRFICKYs1SnINz0BKw4QqvlV25lkc1yHTl538g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sX/vfjyk3E99kEgRyqWYtW+IpByWN9BBjU6ZiWoKTbM=;
 b=wgwjxtWOA5P0A2j+Emf96cJZwc7UHef5dK8fmeZZCdnET4ngfs1gd9ncUpiYZggOikWK4FOf68p8RgVn/K3buoSYGnJ0i2Fv42LR8Z2/PD89OVFJGgHUtbo8hljyFU2ni0dj99UReP9Z0Zme4jAmE1rS3jp6nvCttsrSq7iJPMA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11706.jpnprd01.prod.outlook.com (2603:1096:400:400::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 15:18:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 15:18:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Topic: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Index: AQHclPgnnEkoF8XdO06GH+Sodqqfy7WgLMSAgAACCtA=
Date: Thu, 5 Mar 2026 15:18:31 +0000
Message-ID:
 <TY3PR01MB113464F7D135B2CB24B91140F867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11706:EE_
x-ms-office365-filtering-correlation-id: 7c947410-513c-4f2f-1921-08de7aca75bf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 m5CpyxXOe8aJe8aqw6usPOR35FAWOk2hNKfGDPpzfvDFACd5/eJeKo1KjlLiEjkfEjILtMJJRuievnG1K2vNgqZAoLJC724k5bOTWJN85x4qMZtOvnARpFInY/BQDfHi4xpBk7BTj4m+sTe5yPYAFdLJL2ggaI+2ooKXUramoNLGYEC1NBsq7a1z1/yqtvo8fuAXNSgSEcGwnbatEFgjSKY/DvDVflyBqpx8+rwBuQoceTnNj5YovjjBHole/PebyCcKejUIQOimSJtAmAAtNoXWhclOwHnrNsYT3Eevy4hKxGe7Mf6oGNWX1p6rcWqXRirj+1GdyVWxejzNGy4k9Pqad/Sje4gceqUIAybOPwoMw+FJYo/CaGbXRhe0I/gzH4dHfV8opMOn619dhaHHTayR5pCQpyYiu3vDGKl9DMFPrmnBZH0lZoRr3TicfiT/KWE1CJ5zjgcrfxw6Fqn0TCjAcxGJljO4g2qaHK6MbCSrJ3n6+PGAmx22aAA96QQDN0RUjvPdbcj7TWlx8ET6vj59tzVr4W6FsnDdSxJv23y+zXPvfmrwFGpcGsxSnaHmS2odDGWPw0yN8+xMZkW54jPA7a5pvUEWMIvWz0iDUkb03qMIXdCc5cbGXEN5aUUhhMNhFAKe8JQAEmuuDssZyCoh5B79U/k1kNzZvXXW9ehgo+03M10M/zS4xohPCCbObZA/9pTdJab4jG9HJq/6S94H0Ityffi6J+/uToAGMaxiA2BsxMBuArcI/plD9pNFY4Ih7mUCMX+A0eh4Uv8O3Qj9hPIjtapG/vttWOo9Frs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGh3SjQ4bmlqOWxHYVRQSkJGODN4b3h0ZWNqbzdtMjdWa1BFYTM3ak1XWHdm?=
 =?utf-8?B?Rk9NVmZUd0tDejVOZkFsdGlEdUlWWTFWWDlHdC9TSTNFaS9sTE5rMWJoN2ZB?=
 =?utf-8?B?QllQYWY3SStPd1p5cDFXTVIvbWFNbGNEUXlXSlZjZGtaTHlFVGJNRUdBYVpz?=
 =?utf-8?B?QlREUlJuRXEwOERUajMxNERvbXg4RjJ3VkkzYTFKWmEweEVNOHNwVzYrT0l1?=
 =?utf-8?B?MHltaVczcVRjZ2FhaHlIQjVKTG9mN2dnS3hLRWlHdDEwWDkydjFuc0RwUFpC?=
 =?utf-8?B?Nkpvd2NORGI5cmRvbC9QOXdKb3pJWmc2TXhpeHhmUHRTSGR3ZllKOVRENXJE?=
 =?utf-8?B?Q0kwLzZzMDFkZklZNmQrMjV6YWJlWDJwVWxKNHFtbWNzS1dxVnZiT2dLM2NE?=
 =?utf-8?B?WFlmMkYvT08zZDBGaHNWYzMzTGhRQjFsOVRZVjZ6TEI1TFpJS0poVUhwVXhP?=
 =?utf-8?B?cWZXQXJIM3crMHBiOTZ1UUZ0L3ZudTlJQ0ZPNWh5WXhRZnF3WWFBSFg5Z3NL?=
 =?utf-8?B?N2JEZkpoNktoVndyeHc5c2pRbU4zZEczdmFvWTNKYkcySEtRVkxHK2U0cFRq?=
 =?utf-8?B?cDRyV29qQlBMdnE2elhvNnBHZXJPSk9pZUkyRTZVUTlPQ2JhUWxobVVGSDkv?=
 =?utf-8?B?dlNFTGJzYllaRlFFMFk4azNFeXJaT2pKM29rZlhhRE9RSXBqeDNEck9qNE4w?=
 =?utf-8?B?Qy9LaTVWNzF2YjU0ZUVOVE9ZSHVoNHRkWlVBdGp4TnAvQ003UVdBNUIwTnRZ?=
 =?utf-8?B?MExhQ3dxZVJCTUI4QWVueEVOVnVuYndreE1wL09tMHVzMzZxWHpaUElKL0c5?=
 =?utf-8?B?bnJZaEord3EvdDhIQ2F0U0ZyMmFuNGgrazNzREh6UzlGRmJCdGd6U1QwQXBz?=
 =?utf-8?B?NWprVnV5Q3pJQTI2anFnOVJEdGhiVS9xaTZLWGpvd290NUdwc25PUUFUVnVP?=
 =?utf-8?B?L1g3S215d2kyTVFvOC9oaGpab1BXWGgzR0c3bzM3RDFjVmcvOWxpRGN4TGg4?=
 =?utf-8?B?VERXVzczbXhqT1Qzdm5kMmFZUDB0WWI5U2NlOHlSM0RsU2FZTGZHeWZ6cmEw?=
 =?utf-8?B?TmtxWXhaQVYzT0pzZStUc1ArbFJmckVKYS91bFRWQ21KMFMwdkFxbDZYdEk3?=
 =?utf-8?B?ZmtWWjl2WE1paDFMc2dXWUFnTWVBdmxQQlB0RXVrNDQ3MjBiWmp1aTA3VEpN?=
 =?utf-8?B?K0FWQnNEMWppclRHNWMvT09oT0ZtOFE5bGFtK2diN1dmOGZJSkh2RGk1MW1J?=
 =?utf-8?B?UUYvN1d2ckIyMGRORjJRbExHc00zc2d1UXpzeFE2TWxyQ29Tc3ZiYmFSMHUx?=
 =?utf-8?B?UWhtNjYvK1pCKzJrczNIb1dMLzRsamtQZ2g1WnlzeVczSXZkelhLcE1nY2V5?=
 =?utf-8?B?R1hTYVRsVDVwc0d4eEhPbXZvNytDR2Y0b0FkV3VxekhsT1Mwak9hRUVVT0ZZ?=
 =?utf-8?B?WVZQYzc4ZGU2eERqMHJUcmlrcWxua2N5bFFocTl3ME5DSGdldk9OZUtFQWtC?=
 =?utf-8?B?SUVCTGt0cUtiRmVRQXlQQ0p4aDY1bU9VNkJnRnhXMndCVXFXTHRpZGdWTzdo?=
 =?utf-8?B?YW5SeGlxQXZjZHVyN2Y3aFZjTEZiWnhLaG14K0luNmd0SXBxcVBMTXdPRXMw?=
 =?utf-8?B?QysyUG9lMzlucDV6WDRHUmlqaGlTTmJMcG5td1hVSk9ZY2N2UlBVSjdwdUdl?=
 =?utf-8?B?eVZyV2NWTWVUdmY2QTdBTU1jekdMbnlNTVpKRXIzRUtkenk3OXM2dUF5eENM?=
 =?utf-8?B?WjM5RHJIM2tJOWl3cjJxZDVST2hTNGV0ZUtOVnE4RVFiRHJBWUNUR1BDU01h?=
 =?utf-8?B?VkNxdGV6bFNveTd3cGZWVkdkR3pUdDgvVVVXemNDMVFIenV6ZkdKYWErMWN3?=
 =?utf-8?B?bTB2U2tidFRMMW9xNHZ4K3l3V01aVUxhWjR2WEVndmNhWVVmWXlkUE80a2ty?=
 =?utf-8?B?K1Q2YUJCeVFiTXl4dUs2TURINlNneGFFdVRmckNLUEhQcUNjUjFtMVVxN05x?=
 =?utf-8?B?Rllha3E4SndXQUVxbUk1ZjBnb1RSYjZ2Nkx5VnVUbmNzdGpnNSsvbzVXNHNv?=
 =?utf-8?B?Y1lnRG9TLzhJWEp0SjVwVEpkSUdqU0RwZTVyUmVIV3dPUzZXS0s0M2NNQVV1?=
 =?utf-8?B?UE1LOE0xanJSaXhyK0JGdlZGL1l2Q2k5cTROM09FRW5VL1pnUjJDcGN2TnhP?=
 =?utf-8?B?ejNRdzkwVUZMVnk5anB0Y3FSR3lIenNmelgvSjhSYjFKb2ZYaTlkdDlGVEtV?=
 =?utf-8?B?SkdSNlR6RFRoUWorNWlJR1dsaytGR2h6Z1AzaWJnWlh2d2pMbWJjejBLcEVU?=
 =?utf-8?B?WEo3SlZoR3dtemVqWitEbFdha1pNOWxtak1ZYWhJVXNTazM0a1BPZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c947410-513c-4f2f-1921-08de7aca75bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 15:18:31.0367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QC450qO0cNJz0XtcZNEyz8fe4slGv+JBnH14R4F6xUw/2awWY46J4Q6V5phFDsDrH5Cbht0120O7cQZ3abznhIRiQU5J4OSPDWGwarXqJtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11706
X-Rspamd-Queue-Id: 8B61A214708
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-28898-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,microchip.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-m68k.org:email,renesas.com:email,microchip.com:email,bp.renesas.com:dkim]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA1IE1hcmNoIDIwMjYgMTQ6MjENCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAwNS8xMF0gZHQtYmluZGluZ3M6IGNsb2NrOiBEb2N1bWVudCBSWi9HM0wgU29DDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gVHVlLCAz
IEZlYiAyMDI2IGF0IDExOjMwLCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0K
PiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IERvY3VtZW50IHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIFJlbmVzYXMgUlovRzNM
IFNvQyBDbG9jaw0KPiA+IFB1bHNlIEdlbmVyYXRvciAoQ1BHKS4gUlovRzNMIENQRyBpcyBzaW1p
bGFyIHRvIFJaL0cyTCBDUEcgYnV0IGhhcyA1DQo+ID4gY2xvY2tzIGNvbXBhcmVkIHRvIDEgY2xv
Y2sgb24gb3RoZXIgU29Dcy4NCj4gPg0KPiA+IEFsc28gZGVmaW5lIFJaL0czTCAoUjlBMDhHMDQ2
KSBDbG9jayBQdWxzZSBHZW5lcmF0b3IgQ29yZSBDbG9jaywNCj4gPiBtb2R1bGUNCj4gDQo+IENv
cmUgQ2xvY2tzLCBhcyBsaXN0ZWQgaW4gc2VjdGlvbiA0LjQuMSAoIkJsb2NrIERpYWdyYW0gb2Yg
dGhlIENsb2NrIFN5c3RlbSIpDQoNCk9LLCB3aWxsIHVwZGF0ZS4NCg0KPiANCj4gPiBjbG9jayBv
dXRwdXRzLCBhcyBsaXN0ZWQgaW4gc2VjdGlvbiA0LjQuMiAoIkNsb2NrIExpc3QgcjEuMDAiKSBh
bmQgYWRkDQo+ID4gUmVzZXQgZGVmaW5pdGlvbnMgcmVmZXJyaW5nIHRvIHJlZ2lzdGVycyBDUEdf
UlNUXyogaW4gU2VjdGlvbiA0LjQuMw0KPiA+ICgiUmVnaXN0ZXIiKSBvZiB0aGUgUlovRzNMIEhh
cmR3YXJlIFVzZXIncyBNYW51YWwgKFJldi4xLjAwIE9jdCwgMjAyNSkuDQo+ID4NCj4gPiBBY2tl
ZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9yZW5lc2FzLHJ6
ZzJsLWNwZy55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL3JlbmVzYXMscnpnMmwtY3BnLnlhbWwNCj4gPiBAQCAtMjgsMTkgKzI4LDMwIEBAIHBy
b3BlcnRpZXM6DQo+ID4gICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDQtY3BnICMgUlovRzJ7TCxM
Q30NCj4gPiAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA1NC1jcGcgIyBSWi9WMkwNCj4gPiAgICAg
ICAgLSByZW5lc2FzLHI5YTA4ZzA0NS1jcGcgIyBSWi9HM1MNCj4gPiArICAgICAgLSByZW5lc2Fz
LHI5YTA4ZzA0Ni1jcGcgIyBSWi9HM0wNCj4gPiAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzAxMS1j
cGcgIyBSWi9WMk0NCj4gPg0KPiA+ICAgIHJlZzoNCj4gPiAgICAgIG1heEl0ZW1zOiAxDQo+ID4N
Cj4gPiAgICBjbG9ja3M6DQo+ID4gLSAgICBtYXhJdGVtczogMQ0KPiA+ICsgICAgbWluSXRlbXM6
IDENCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBDbG9jayBzb3Vy
Y2UgdG8gQ1BHIGNhbiBiZSBlaXRoZXIgZnJvbSBleHRlcm5hbCBjbG9jaw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBpbnB1dCAoRVhDTEspIG9yIGNyeXN0YWwgb3NjaWxsYXRvciAoWElOL1hP
VVQpLg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBFVEgwIFRYQyBjbG9jayBpbnB1dA0KPiA+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBFVEgwIFJYQyBjbG9jayBpbnB1dA0KPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBFVEgxIFRYQyBjbG9jayBpbnB1dA0KPiA+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBFVEgxIFJYQyBjbG9jayBpbnB1dA0KPiA+DQo+ID4gICAgY2xvY2stbmFtZXM6DQo+ID4g
LSAgICBkZXNjcmlwdGlvbjoNCj4gPiAtICAgICAgQ2xvY2sgc291cmNlIHRvIENQRyBjYW4gYmUg
ZWl0aGVyIGZyb20gZXh0ZXJuYWwgY2xvY2sgaW5wdXQgKEVYQ0xLKSBvcg0KPiA+IC0gICAgICBj
cnlzdGFsIG9zY2lsbGF0b3IgKFhJTi9YT1VUKS4NCj4gPiAtICAgIGNvbnN0OiBleHRhbA0KPiA+
ICsgICAgbWluSXRlbXM6IDENCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBl
eHRhbA0KPiA+ICsgICAgICAtIGNvbnN0OiBldGgwX3R4Y190eF9jbGsNCj4gPiArICAgICAgLSBj
b25zdDogZXRoMF9yeGNfcnhfY2xrDQo+ID4gKyAgICAgIC0gY29uc3Q6IGV0aDFfdHhjX3R4X2Ns
aw0KPiA+ICsgICAgICAtIGNvbnN0OiBldGgxX3J4Y19yeF9jbGsNCj4gDQo+IEFyZSB5b3Ugc3Vy
ZSBhYm91dCB0aGVzZSBmb3VyIGNsb2Nrcz8gT24gd2hpY2ggcGlucyBhcmUgdGhleSBpbnB1dD8N
Cg0KRnJvbSBGaWd1cmUgNC40LTUgQmxvY2sgRGlhZ3JhbSBvZiB0aGUgRGVmb3JtZWQgQ2xvY2sg
U3lzdGVtICg0KSwgcGFnZSA3ODkNCg0KVGhlc2UgY2xrcyBhcmUgZXh0ZXJuYWwgc291cmNlIGNs
a3MgY29ubmVjdGVkIHRvIENQR19FVEhfU1NFTCBtdXggZm9yDQpzZWxlY3RpbmcgcngvdHggY2xr
cy4NCg0KSW4gUkdNSUkgY2FzZSwgY3VycmVudGx5IG9uIFJaL0czTCBTTUFSQyBFVks6DQoNCkZv
ciBUeDogd2Ugc2VsZWN0IERJVl9FVEgwX1RSIChTRUxfRVRIMEFfU0VUKQ0KRm9yIFJ4OiB3ZSBz
ZWxlY3QgRVRIMF9SWENfUlhfQ0xLX0lOIChTRUxfRVRIMEJfU0VUKQ0KDQo+IA0KPiA+DQo+ID4g
ICAgJyNjbG9jay1jZWxscyc6DQo+ID4gICAgICBkZXNjcmlwdGlvbjogfA0KPiANCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9yOWEwOGcwNDYt
Y3BnLmgNCj4gPiBAQCAtMCwwICsxLDM0MyBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyAqDQo+ID4gKyAqIENv
cHlyaWdodCAoQykgMjAyNiBSZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAqLw0KPiA+
ICsjaWZuZGVmIF9fRFRfQklORElOR1NfQ0xPQ0tfUjlBMDhHMDQ2X0NQR19IX18NCj4gPiArI2Rl
ZmluZSBfX0RUX0JJTkRJTkdTX0NMT0NLX1I5QTA4RzA0Nl9DUEdfSF9fDQo+ID4gKw0KPiA+ICsj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcmVuZXNhcy1jcGctbXNzci5oPg0KPiA+ICsNCj4g
PiArLyogUjlBMDhHMDQ2IENQRyBDb3JlIENsb2NrcyAqLw0KPiANCj4gWy4uLl0NCj4gDQo+ID4g
KyNkZWZpbmUgUjlBMDhHMDQ2X09TQ0NMSyAgICAgICAgICAgICAgIDUyDQo+ID4gKyNkZWZpbmUg
UjlBMDhHMDQ2X09TQ0NMSzIgICAgICAgICAgICAgIDUzDQo+ID4gKyNkZWZpbmUgUjlBMDhHMDQ2
X0NMS19QNF9ESVYyICAgICAgICAgIDU0DQo+IA0KPiBDTEtfUDRfRElWMiBsb29rcyBsaWtlIGEg
cHVyZWx5IGludGVybmFsIGNsb2NrIHRvIG1lLg0KDQpQYWdlIDM5MTggRmlndXJlIDcuOS0xIEJs
b2NrIERpYWdyYW0gb2YgQ0FOLUZEDQoNClBlcmlwaGVyYWwgY2xrLA0KUkFNIGNsaywNCkNBTiBl
eHRlcm5hbCBjbGsNCg0KVGhlbiwgQ0FORkQgY2xrIHdoaWNoIGlzIERJVjIgY2xrIG9mIFBlcmlw
aGVyYWwgY2xrLCBzbyB0aG91Z2h0IG9mDQptb2RlbGxpbmcgdGhpcyBhcyBDb3JlIGNsay4gSSBt
YXkgYmUgd3JvbmcgaGVyZT8/DQoNCk1heWJlIEkgd2lsbCBkcm9wIHRoaXMgbm93IGFuZCByZXZp
c2l0IGxhdGVyIHdoZW4gd2UgYWRkIHN1cHBvcnQgZm9yIENBTkZEPz8NCg0KPiANCj4gDQo+ID4g
Kw0KPiA+ICsvKiBSOUEwOEcwNDYgTW9kdWxlIENsb2NrcyAqLw0KPiANCj4gWy4uLl0NCj4gDQo+
ID4gKyNkZWZpbmUgUjlBMDhHMDQ2X0NSVV9QQ0xLICAgICAgICAgICAgIDY1DQo+ID4gKyNkZWZp
bmUgUjlBMDhHMDQ2X0NSVV9BQ0xLICAgICAgICAgICAgIDY2DQo+ID4gKyNkZWZpbmUgUjlBMDhH
MDQ2X01JUElfRFNJX1BMTENMSyAgICAgIDY3DQo+IA0KPiBNSVBJX0RTSV9QTExDTEsgaXMgaW5k
ZWVkIG5vdCBhIGdhdGVhYmxlIGNsb2NrLCBzbyBpdCBzaG91bGQgYmUgYSBjb3JlIGNsb2NrLg0K
DQpBZ3JlZWQuDQoNCj4gDQo+ID4gKyNkZWZpbmUgUjlBMDhHMDQ2X01JUElfRFNJX1NZU0NMSyAg
ICAgIDY4DQo+ID4gKyNkZWZpbmUgUjlBMDhHMDQ2X01JUElfRFNJX0FDTEsgICAgICAgICAgICAg
ICAgNjkNCj4gPiArI2RlZmluZSBSOUEwOEcwNDZfTUlQSV9EU0lfUENMSyAgICAgICAgICAgICAg
ICA3MA0KPiA+ICsjZGVmaW5lIFI5QTA4RzA0Nl9NSVBJX0RTSV9WQ0xLICAgICAgICAgICAgICAg
IDcxDQo+ID4gKyNkZWZpbmUgUjlBMDhHMDQ2X01JUElfRFNJX0xQQ0xLICAgICAgIDcyDQo+ID4g
KyNkZWZpbmUgUjlBMDhHMDQ2X0xWRFNfUExMQ0xLICAgICAgICAgIDczDQo+ID4gKyNkZWZpbmUg
UjlBMDhHMDQ2X0xWRFNfQ0xLX0RPVDAgICAgICAgICAgICAgICAgNzQNCj4gPiArI2RlZmluZSBS
OUEwOEcwNDZfTFZEU19QQ0xLICAgICAgICAgICAgNzUNCj4gDQo+IExWRFNfUENMSyBkb2VzIG5v
dCBzZWVtIHRvIGV4aXN0LCB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlIHJlZmVyZW5jZSB0byBpdCAo
YnV0IEkgY2FuIHNlZSB3aGVyZSBpdHMgZ2F0ZQ0KPiBiaXQgdXNlZCB0byBiZSA7LSkNCg0KT0ss
IHdpbGwgZHJvcCB0aGlzIGNsayBhcyB0aGVyZSBpcyBubyBjb250cm9sIGJpdHMgaW4gdGhlIEhX
IG1hbnVhbC4NCg0KPiANCj4gPiArI2RlZmluZSBSOUEwOEcwNDZfTENEQ19DTEtfQSAgICAgICAg
ICAgNzYNCj4gPiArI2RlZmluZSBSOUEwOEcwNDZfTENEQ19DTEtfRCAgICAgICAgICAgNzcNCj4g
PiArI2RlZmluZSBSOUEwOEcwNDZfTENEQ19DTEtfUCAgICAgICAgICAgNzgNCj4gPiArI2RlZmlu
ZSBSOUEwOEcwNDZfU1NJMF9QQ0xLMiAgICAgICAgICAgNzkNCj4gPiArI2RlZmluZSBSOUEwOEcw
NDZfU1NJMF9QQ0xLX1NGUiAgICAgICAgICAgICAgICA4MA0KPiA+ICsjZGVmaW5lIFI5QTA4RzA0
Nl9TU0kxX1BDTEsyICAgICAgICAgICA4MQ0KPiA+ICsjZGVmaW5lIFI5QTA4RzA0Nl9TU0kxX1BD
TEtfU0ZSICAgICAgICAgICAgICAgIDgyDQo+ID4gKyNkZWZpbmUgUjlBMDhHMDQ2X1NTSTJfUENM
SzIgICAgICAgICAgIDgzDQo+ID4gKyNkZWZpbmUgUjlBMDhHMDQ2X1NTSTJfUENMS19TRlIgICAg
ICAgICAgICAgICAgODQNCj4gPiArI2RlZmluZSBSOUEwOEcwNDZfU1NJM19QQ0xLMiAgICAgICAg
ICAgODUNCj4gPiArI2RlZmluZSBSOUEwOEcwNDZfU1NJM19QQ0xLX1NGUiAgICAgICAgICAgICAg
ICA4Ng0KPiA+ICsjZGVmaW5lIFI5QTA4RzA0Nl9VU0JfVTJIMF9IQ0xLICAgICAgICAgICAgICAg
IDg3DQo+ID4gKyNkZWZpbmUgUjlBMDhHMDQ2X1VTQl9VMkgxX0hDTEsgICAgICAgICAgICAgICAg
ODgNCj4gPiArI2RlZmluZSBSOUEwOEcwNDZfVVNCX1UyUDBfRVhSX0NQVUNMSyAgODkgI2RlZmlu
ZQ0KPiA+ICtSOUEwOEcwNDZfVVNCX1UyUDFfRVhSX0NQVUNMSyAgOTANCj4gPiArI2RlZmluZSBS
OUEwOEcwNDZfVVNCX1BDTEsgICAgICAgICAgICAgOTENCj4gPiArI2RlZmluZSBSOUEwOEcwNDZf
VVNCX1NDTEsgICAgICAgICAgICAgOTINCj4gDQo+IFVTQl9TQ0xLIGlzIG5vdCBnYXRlYWJsZSwg
c28gaXQgc2hvdWxkIGJlIGEgY29yZSBjbG9jay4NCg0KT0ssIHdpbGwgYWRkIHRoaXMgYXMgY29y
ZSBjbG9jay4NCg0KPiANCj4gWy4uLl0NCj4gDQo+ID4gKy8qIFI5QTA4RzA0NiBSZXNldHMgKi8N
Cj4gDQo+IFsuLi5dDQo+IA0KPiA+ICsjZGVmaW5lIFI5QTA4RzA0Nl9SU0NJMl9UUkVTRVROICAg
ICAgICAgICAgICAgIDExNA0KPiA+ICsjZGVmaW5lIFI5QTA4RzA0Nl9SU0NJM19UUkVTRVROICAg
ICAgICAgICAgICAgIDExNQ0KPiA+ICsjZGVmaW5lIFI5QTA4RzA0Nl9MVkRTX1JFU0VUX04gICAg
ICAgICAxMTYNCj4gDQo+IE1pc3NpbmcgQlNDX1hfUFJFU0VUX0JTQz8NCj4gSXQgY291bGQgYmUg
YWRkZWQgbGF0ZXIsIGJ1dCB5b3UgZG8gbGlzdCB0aGUgY29ycmVzcG9uZGluZyBtb2R1bGUgY2xv
Y2suDQoNCkkgbWlzc2VkIGl0LiBXaWxsIGFkZCBpdCBpbiBuZXh0IHZlcnNpb24uIA0KDQpDaGVl
cnMsDQpCaWp1DQo=


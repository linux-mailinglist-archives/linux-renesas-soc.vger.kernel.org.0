Return-Path: <linux-renesas-soc+bounces-14891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F7EA71A27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 16:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCF4C18885C4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Mar 2025 15:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E017D14A4C6;
	Wed, 26 Mar 2025 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CIvh0QiL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EE42747B;
	Wed, 26 Mar 2025 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743002256; cv=fail; b=OjOspaxCFKf7DR852kmkNK+Q/Z5mqi39f97MSCOzFzvrY+hI0RZHCO7nylWJ1ZkF1esop5kQKRDpMmXlCBgr7uSP1mYzoflN8bxBbjrE8XfI79NBYtzeZnXCBks4BBB2kfrUKcHIbCPulEk2dpqGT3qpgoapauxf4I97dpXtUkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743002256; c=relaxed/simple;
	bh=V1wKZHyPC1isNj1zOvY5GRoyYkeN43wnpFql16KnTBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CqbVPqj/lcmCu+W4o4SpaCVIxckLmSo95SjzMhlk5hUGlo3rFn2XJOaK8Wjk5ENEOruuJj7mwl+SmMKwpdv3P5cfiBznfCrdzDKZveOQhlGAoVM9hskVP+V4+S6rSRTaMDkM7xCJF4D8LAeDqEr07piR2mIOBdJE3CeyTTdEm2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CIvh0QiL; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SU84GySoy8YUtVyTqMmgKN3R7/18xFZhxeuGx5FEoGh7+RqaPuvZaJ/VAGwgEpBwQD7EgoxpX+LoO9elOLmVPYOPs3ID0zK4OEINiW3VKJeROqqX9w7z9N2cpzxsnv40t+61w99UEUD9zLqEcVVzuud0F5EhGmJixdxLQBKZoXVBx4jZHcr4xES1F0G6H0619gwtpkhh5FsDxGBS2YXqjhfxNIEH4qPmMqYfhfQy5GahAus9C9C79ctXwOF+RrEQMpiFNoIELKneVtY5Crb3hDYAZq/mRGhKMTNkuSfFh3gDkyi3O1M8jsWEiuemFPuS5kreqcQy35Z61FfHk02ZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1wKZHyPC1isNj1zOvY5GRoyYkeN43wnpFql16KnTBM=;
 b=ol+28C79tA0lS8pSuw3waVZTl2aXXOcICmk85o93RnrQQ58AEIHxt4EOSI/P9nImn1q7c+8zJdygBqTE0PP5S6buCKUtat2OFbMPxzhrKl5S+y9QskwUsFF6CnnmWjCR1FH4vm8mBHMLSVYlxlumUbPf5nKzHbpfAj+RS8wtFgrxAzpLmK8VmpDNLFKyUjuNmrPXi4CTXv1vI47wnYzZpm4SXm7wahMvAmT0WywrjI1hgDAxTkq81v2Y+RXHpm4loTLYnsZj4C+YxpP5wlqG0CVkuCMq3QjDkWhQOn8ZSRKWlk2leJpsk0ctj2omUE9Ci7Rd243wC6D+VxgOIuK3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1wKZHyPC1isNj1zOvY5GRoyYkeN43wnpFql16KnTBM=;
 b=CIvh0QiL5RWUdxsoZPvH7FXn1UJ2yMTMS82lvIb6Qw26jS6b9oJxWW9lHqOCjkq1H++roNA0P+V4OMlvW+k0KPRpTTQFiYoKwoR7kCxDrrnUJfTBdIRrgZU3vtpa3RO3HdhMp0xaAK7yYmgpgdVTe6GQJO/0itVv1V2UemqfQfQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11771.jpnprd01.prod.outlook.com (2603:1096:400:376::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 15:17:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 15:17:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Topic: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Index:
 AQHbjCwSQtFnS5HRQ0O4YyzU/N2JT7NlMPsAgAC1N4CAANHqAIAAiUfQgAsHYUCACmTiAIAAsbuwgAW2pQCAALNw8IAB4Q7Q
Date: Wed, 26 Mar 2025 15:17:30 +0000
Message-ID:
 <TY3PR01MB11346B3B6CFF1359411B475A386A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
 <20250303110433.76576-2-biju.das.jz@bp.renesas.com>
 <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org>
 <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <98c8c1eab30fc333974bd1ad88791356.sboyd@kernel.org>
 <TY3PR01MB113469E04E10E3D14FB3F69F186D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <983e0e616d62f236dcbc3eecbeab5ab4.sboyd@kernel.org>
 <TY3PR01MB113461FA9BBF036D285AAC8F386DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <a6bd517263b66bc69a72d74aeb88cbf5@kernel.org>
 <TYCPR01MB113325BE576B7B4D4D3378BC186A72@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB113325BE576B7B4D4D3378BC186A72@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11771:EE_
x-ms-office365-filtering-correlation-id: 86b3a230-46f7-45f8-32b6-08dd6c795390
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d2xpN1BoSjNpNEpIYkJBZFZqU2tPQU4vNUFjNlRLeW9sK0RTQTlpZ2wxRDVV?=
 =?utf-8?B?K1ppelNwU2swckpwMnRKSld3UVlQM1B4NkpFbW5vYVFydjAwMTZya3k1UnE2?=
 =?utf-8?B?SkpneXZ6ZVFtN3lTb1JEa24yNnBRUllQSGRvVWdYNEc5Y2NVVW9tcHcwWlRj?=
 =?utf-8?B?Q3hkMDR6aWlqdStDUFMzWlJCM29VVExzSTZJaFpEWHZCbE5LazAyNVE1MWFt?=
 =?utf-8?B?bGdvRXIySzNkWDlPNFNFU1V1OXZBU0I2M3krMXJKejBFeE1YTDRTT0xGeDFN?=
 =?utf-8?B?dkVnQ0hpTW1SWGNpcWxtbVhEUU5yVXR4T2c2Z0VmRElaVVl1a015bkVMODZp?=
 =?utf-8?B?c2F2YTVQUlpXcXdHQnZrcUdHaThJVzJKdkdsV3lvb0FrZHQ2UDhFcUJhMUhr?=
 =?utf-8?B?Qy94R3FRNE9QaTkycmJBR2pOMUF6WlJMYzFwRWtGR0NSL0dMRUJMRnc0L1dD?=
 =?utf-8?B?b3ZCQy9kckU2YkJvSU8xb3phMkhoblBnM1FIQVhuLzNldWp0UFBWRjQrc0or?=
 =?utf-8?B?empnRHEweDExOFNkb0ZHQUNPQVoveXJuRmwxTyt4K2J1Ymw2cll4aHBPZ1cz?=
 =?utf-8?B?VDVwRmpGUG1nYWNUQzdBWGYrTDRyVU9CdmtMNjZYZGZ1aHd2emYxOXdPYjRO?=
 =?utf-8?B?dlBpNjZFcXNOUWRsVUxsZFVVaVRGVTVkOWRON0JyaFBNbFlhRk9ybGJJVUpJ?=
 =?utf-8?B?MkxBcGdJZEdYcnJBNVRZbnVUVTM4b0xyMUp4ZVlkWTVabkdXaEF1MExUZ3FO?=
 =?utf-8?B?NkdpZXEzd3d5bW9vVEtyZk9VZE5HbTAxb1ZwSE5LbmZrWEowWm15T2I0aVpI?=
 =?utf-8?B?TGFGRGYyV2ExRDdFRjNpTXZuQ3FBNWJmdHovM293U1IrRms4eWFEbHZvdzk4?=
 =?utf-8?B?NEVTK1pSNWk3Sk5WZUZvZWpJR0ZwTXpQRGd5amI2NFM3LzNueGZ0RlExdWR1?=
 =?utf-8?B?ZkZ1VWJhQmhqWm1NYWdNMWRpR1NpbDEzcmQweHdMUUt1aGJkc29iZ1hESG1O?=
 =?utf-8?B?M2xkcUk5RU1VS3VQWk40eXlUbFNSbTlkYlRDbTVGOFVVNGttT0ZWN3VDcnph?=
 =?utf-8?B?Ri9qUERTZEUrTmJqU3M0SU5jUXdveE9QZUsyUEh3SE9xSnlma2tvbjRxeElO?=
 =?utf-8?B?eHZTUDZ1MkNRUUo1NkNrVC9oWEd3bEJST3pxMWtqWmFjWm80bi9MeXU3d1Nn?=
 =?utf-8?B?eFFZeWJHOW9tRGQ0dUZtd3A4WENXbWlOTUR1bEVrYTN4Y01IKzNxZmNPM1A0?=
 =?utf-8?B?SVFSYy95Z0RGczYzQzVFeTJUUHNIcFdlL1p5ZDhLK1Zxb3BHUmN2OFFXUEhS?=
 =?utf-8?B?UUtYdi9Fem5YNFBTNExGNVVwcHZMMTZPcmpDak9RYlJBaS9OM0FkMWdxK3Fh?=
 =?utf-8?B?Rm5ZWU1IWE41UUR2dTJVdnJnMXRrMFlEWndRMkwxemFJeXRLQUcrN1FMZXNY?=
 =?utf-8?B?SHFIY081cjdsR05XTENKTG5Rd0dheTljTGlkaUZrUzBmSk9YYnpxek01ZGJp?=
 =?utf-8?B?WGVtUDd3MDJtQlZ1M2dNdU81TGkvNUx6ZnVuR1JzMnMzZ2Fqc25yenlYakNY?=
 =?utf-8?B?a2Q3clFrczlFVmZwMlIxdXhEMGlaOERCL1dMa2tBZEJLdzFlaHZnRnB0anZk?=
 =?utf-8?B?ODVaSmo2dWNZUE94QWd1U2gwdWsyRWdOMm5tSGFEQnpmd09wRDBTQ2RYYmZH?=
 =?utf-8?B?dXZEQXhTcUcxZ2NyQ1BSVS9zM0RCdmhkMTdzUHdPbkJuaGlwcmRkcVEySk5a?=
 =?utf-8?B?Qk9Kc2E4OC9tUGpkWTZWMXpyT2ltTEZlY0tJeENWSkgwMDhLQ3ZCTGNwSU1a?=
 =?utf-8?B?d3paT09uYmJ5QkE0N21WbE5uVHIySDYydFpKQ2krUkdZZEM1dVFxTXJ3SmZ1?=
 =?utf-8?B?aEZoWE9hVUttcEhkd0MvT3RSOUxEUmkxSTlJTEFpeTArbWNGcGFCK1dDa3Nr?=
 =?utf-8?Q?voqWbR9tiiZaaOol+lWSTc2LSFMFk5f2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0lVZFBsQkswMmRPdmcvWlo2ZHV0STZ0Y1o4RVpKbHh3MldTaURDTFVPMnRQ?=
 =?utf-8?B?QVdTOXppVlVJMktaK3NERkh4VTIrK2RwN2g1MHJCeTJDMjU1WDlRajZabElR?=
 =?utf-8?B?RXB6dTZGek5xSDNyVWpoREhWNWt5NnJTcnZGcUt0dUFlaU52Y0ZZZGtLL2Qz?=
 =?utf-8?B?ckZlN1V2YVZTYlYrLzNWS29VenpaNmtnTjdqMXA3aGhKeUVzWTVLT3lHVkZ0?=
 =?utf-8?B?SVhqVVlQK3VvVWVBMVJKc2xudDYzRjV3T2JZQnp6ZXlhdlNiNHNQZFpTRUNK?=
 =?utf-8?B?eFJTRnhEWFBnRFdLeU1ia01ZeGp5Y1EreU9LRjRkaUFoRXVwRGwxYml2R05K?=
 =?utf-8?B?bFUreUNzak9lc3BidGtDU2pKSUZJTm1VTStpVmQ1QTFtSEhqMnF5SUxhMnBO?=
 =?utf-8?B?WDFtbnJrUHJ4enVCWnJYVFYwRC80ZmEzNUFDUWxTSHNhd1FyUDhjK2xRV3Y0?=
 =?utf-8?B?ZDFDNEVqMDlQS0Y5d2Y0Nm1qS1dUb1poblZVYm56VXdXUWw0eEVsUzdNbm9Y?=
 =?utf-8?B?eDZXeDA4RHdVS0lxUXhBdlhsb24xYWxkMkRHSEs5d01MR2tzSHdobmVObTFF?=
 =?utf-8?B?L0FYQlNaZnZoa2t5dXMrQkk0bER0NlR4eGF3dUJKR2p2c09PMVZkSGpTS2tE?=
 =?utf-8?B?ejhLM1E5U2lwU3l4ZmRrR1VWZTBIaHJMQ1A0ejYvWi9MUFZpYWVwTVNrZzN3?=
 =?utf-8?B?OXBIQUl4a0tISWp3SEd6UWlUeE5BOHVZa0lKcXM5WVd3Q3BUNjRIMFdoR3ZZ?=
 =?utf-8?B?M1BwTTBaWXA5Vy9nd2pEcTQ4QlExMFRmdUJudFFMOEN1WnhmeUttdVdGTnEv?=
 =?utf-8?B?cHdiVFBEOXBwY3N4YlBUUTh1Y2ZrKzdWOTdLMloycmtXTWVpdWhQQlJKSStM?=
 =?utf-8?B?MWZuS1lWWkVvaHZhR1FJY2NqdFJLNkZNakpjQVhoOURLSWE4ZUkyRWlnU0FP?=
 =?utf-8?B?QXd2SkZIV3czQVNCV0tXZEFQQWhoRk1IZmVsMUFCN25hZk4xbEtYdk0xWDYv?=
 =?utf-8?B?YkowUWxIZHhFQXJJRlpXTnFjaEhGY04vZ0FoQUVBc2NkSVhmMWRwd1l5OFlq?=
 =?utf-8?B?c1BMTmxOdU1YWmxxaSswMjh5Q2ZWOFdPK05tZGRoYktyUStmM2VFR2FQeDls?=
 =?utf-8?B?Nyt5WUZLWTZxWlVqMWtKeU5TU1RTU0VESjVoRUpEenZUR1RDd2ZyMHUzQzNu?=
 =?utf-8?B?RG4vUVhYZVlnZHFYcGN2ejBHWFVybGU3WFRtUXQ5azVBTVJpbndzNlVkSVU3?=
 =?utf-8?B?dys2UGFnUW1IclFFQWJydWdBVVZ1cXRtVk04alVxOWRIbldJNWE0RTBuUmlz?=
 =?utf-8?B?WHhKOHZqaU5WMEVIS2pYbHY5NDZzcGpDdWExOFlEUjJvY1doQS9heWd4NTBv?=
 =?utf-8?B?WUNvRGNTSXd4Q2ljcHJWU080T1RuVnZDMEZaZUVidTdiYks3djg4V3liUjZ1?=
 =?utf-8?B?MS9VNEdzRVZURWFXNlVwcHVMc0RnWG5wVjJsMFJqRHRrRzBCZGhoRUxBYzlk?=
 =?utf-8?B?OEFrSU0rbGZlUkRoYXpqenM4emVHM3JTeEprT0NtUmZMeVRERm5QUG4rM29Y?=
 =?utf-8?B?WTdpbDlIMkx2Nnd2SC9yLzc4N05IZzduMmlDMlZPQjc1N1c4ZjBzK0h2M3Ji?=
 =?utf-8?B?RUtSc0dNZnNqQzdRMm82b25KcEZ2MFBaRVJldEpBMnozUVQ1VWNSTWFYTFAx?=
 =?utf-8?B?Sng0cmZEL1JMdFdmblg5NXBCYmtxSURwTllvMHNvRGtnQ2pPQ0FrTWdsZ0M2?=
 =?utf-8?B?cnZmb0JzVXVKcGhUL01la2F3YUdhMWNZMTlpK2pTNElTYmtGWHBjbVNFamNN?=
 =?utf-8?B?U1BaeXhnU044d3JZczhyMk9SNlZDcDJoYnhqVkNSUWMvUmZicWpVTWxpTzdW?=
 =?utf-8?B?aXcvalhkM3dNNDQxVEJwY3loK3J2ampQVWpjVnNpb0FqWlY1azdOOXB2QkNU?=
 =?utf-8?B?cExxTnJScXIvbDVZc3V4YWoyd3EzTy9yKy9RUDZEQWtVcnNDczFMSkVVRS9o?=
 =?utf-8?B?SDRDYXJ2WG1hT2J6T0ExNWlodUo5bzc5VFFJcy9BWGZrRmNLcmZhdm13MGlw?=
 =?utf-8?B?UkZhSWthemNwTkhHUDZxQTlhNDJTR2s1dnVMcGgrVDBqSGhqSHZ5endFc2E5?=
 =?utf-8?B?eFZSakxma3BZeEZQdkxKUmtmS2RNN0V1dys0dGNJZmhuQjluR09CSjg5WXp5?=
 =?utf-8?B?a1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b3a230-46f7-45f8-32b6-08dd6c795390
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 15:17:30.5213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYyO2tfX4Evu+DduFKE3ePk/mP03+PkfC3l8Sz6RHCCmRwSZpRWAzE7LMEcwZqolkMVJX2hrRnIg0e8p6VYIW4n+ZYWzmctrjnVh6AD/vwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11771

SGkgU3RlcGhlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcw0KPiBTZW50OiAyNSBNYXJjaCAyMDI1IDEyOjIzDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0gg
MS80XSBjbGs6IHJlbmVzYXM6IHJ6djJoLWNwZzogQWRkIHN1cHBvcnQgZm9yIGNvdXBsZWQgY2xv
Y2sNCj4gDQo+IEhpIFN0ZXBoZW4sDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gRnJvbTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPg0KPiA+IFNlbnQ6IDI0
IE1hcmNoIDIwMjUgMjM6NDgNCj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIDEvNF0gY2xrOiByZW5l
c2FzOiByenYyaC1jcGc6IEFkZCBzdXBwb3J0IGZvcg0KPiA+IGNvdXBsZWQgY2xvY2sNCj4gPg0K
PiA+IFF1b3RpbmcgQmlqdSBEYXMgKDIwMjUtMDMtMjEgMDc6MjE6MjQpDQo+ID4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IFN0ZXBoZW4gQm95ZCA8c2JveWRA
a2VybmVsLm9yZz4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFRoZSBwYXJlbnQg
Y2xvY2sgcmF0ZSBvZiBzcGkgYW5kIHNwaXgyIGFyZSBkaWZmZXJlbnQuIElmDQo+ID4gPiA+ID4g
PiA+ID4gd2UgdXNlIGFuIGludGVybWVkaWF0ZSBwYXJlbnQgY2xrLCBXaGF0IGNsayByYXRlIHRo
ZSBwYXJlbnQgd2lsbCB1c2U/Pw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBBbHJpZ2h0
LCBnb3QgaXQuIERvZXMgdGhlIGNvbnN1bWVyIGNhcmUgYWJvdXQgdGhlIGRpZmZlcmVuY2UNCj4g
PiA+ID4gPiA+ID4gYmV0d2VlbiB0aGUgdHdvIGNsa3MgZm9yIHRoZSBnYXRpbmcNCj4gPiA+ID4g
PiA+IHBhcnQ/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQWx0aG91Z2ggZ2F0aW5nIGJpdCBp
cyBzYW1lLCBmb3Igc29tZSByZWFzb24gdGhlaXIgbW9uaXRvciBiaXQNCj4gPiA+ID4gPiA+IGlz
IGRpZmZlcmVudC4gU28sIHRvIGNvbmZpcm0gY2xrIG9uIHN0YXR1cyB3ZSBuZWVkIHRvIGNoZWNr
DQo+ID4gPiA+ID4gPiByZXNwZWN0aXZlIG1vbml0b3IgYml0cy4gUGFyYWxsZWxseSwgSSB3aWxs
IGNoZWNrIHdpdGgNCj4gPiA+ID4gPiA+IGhhcmR3YXJlIHRlYW0sIGRvZXMgaXQgbmVlZCB0byBt
b25pdG9yIGJvdGggdGhlc2UNCj4gPiA+ID4gYml0cz8/DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBB
Y2NvcmRpbmcgdG8gaGFyZHdhcmUgdGVhbSwgdGhlIHNwaXgyIGNsb2NrIGlzIHR3aWNlIHRoZQ0K
PiA+ID4gPiA+IGZyZXF1ZW5jeSBvZiB0aGUgc3BpIGNsb2NrLCBhbmQgdGhlIGNsb2NrIE9OL09G
RiBwZXJpb2QNCj4gPiA+ID4gPiBkaXNwbGF5ZWQgZm9yIGVhY2ggYml0IGluIHRoZSBtb25pdG9y
IHJlZ2lzdGVyIHZhcmllcw0KPiA+ID4gPiBzbGlnaHRseSBkdWUgdG8gdGhlIGRpZmZlcmVuY2Ug
aW4gZnJlcXVlbmN5Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU28gdG8gY2hlY2sgdGhlIHN0YXR1
cyBhZnRlciBjaGFuZ2luZyB0aGUgY2xvY2sgT04vT0ZGIHJlZ2lzdGVyDQo+ID4gPiA+ID4gc2V0
dGluZywgcGxlYXNlIGNoZWNrIHRoZSB0d28gbW9uaXRvciByZWdpc3RlciBiaXRzIHRvZ2V0aGVy
DQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhdCBhbnN3ZXJzIHRoZSBoYXJkd2FyZSBz
aWRlIG9mIHRoZSBxdWVzdGlvbi4gV2h5IGRvZXMgc29mdHdhcmUNCj4gPiA+ID4gbmVlZCB0byBj
YXJlIHRoYXQgdGhleSdyZSB0d28gZGlmZmVyZW50IHRoaW5ncyB2cy4gb25lIGNsaz8NCj4gPiA+
DQo+ID4gPiBGcm9tIHNvZnR3YXJlIHBvaW50LCBDb25zdW1lciBkcml2ZXIgYm90aGVyIG9ubHkg
YWJvdXQgc3BpX2Nsay4NCj4gPiA+DQo+ID4gPiBTbywgdHJlYXRpbmcgYXMgb25lIGNsayhzcGlf
Y2xrKSBzaG91bGQgYmUgT0sgYW5kIHdlIHNob3VsZCBkcm9wDQo+ID4gPiBoYW5kbGluZyBzcGlf
eDIgbW9kdWxlIGNsayBpbiB0aGUgY2xrIGRyaXZlciBpbnN0ZWFkIHRyZWF0IHRoaXMgYXMNCj4g
PiA+IGFuIGludGVybmFsIGNsb2NrICgiLnNwaV9jbGtfeDIiKT8/DQo+ID4gPg0KPiA+ID4gVGhl
biB3ZSBzaG91bGQgdXBkYXRlIHRoZSBiaW5kaW5nIHRvIGhhdmUgb25seSAzIG1vZHVsZSBjbGtz
IGluc3RlYWQNCj4gPiA+IG9mIDQgYnkgZHJvcHBpbmcgdGhlIHNwaV94MiBtb2R1bGUgY2xrLg0K
PiA+DQo+ID4gSSBkb24ndCBzZWUgd2h5IHRoZSBiaW5kaW5nIGhhcyB0byBiZSB1cGRhdGVkLiBD
YW4ndCB3ZSByZXR1cm4gYSBOVUxMDQo+ID4gY2xrIHBvaW50ZXIgd2hlbiB0aGUgZHJpdmVyIGNh
bGxzIGNsa19nZXQoKSBvbiB0aGUgc3BlY2lmaWVyIGZvciB0aGUNCj4gPiBzcGlfeDIgY2xrPw0K
PiANCj4gU2FtZSBzcGVjaWZpZXIgaXMgdXNlZCBmb3IgYm90aCBjbG9ja3MuIFNvLCB3ZSBjYW5u
b3QgZGlzdGluZ3Vpc2ggZnJvbSBEVCBlbnRyaWVzLg0KPiANCj4gPiBUaGVuIG5vdGhpbmcgd2ls
bCBoYXBwZW4gZm9yIHRoYXQgY2xrLiBJIGd1ZXNzIHdlIG1heSBuZWVkIHRvIHJldHVybg0KPiA+
IHRoZSByYXRlIG9mIHRoZSBzcGkgY2xrIG11bHRpcGxpZWQgYnkgMiBvciBzb21ldGhpbmcsIGJ1
dCB0aGF0IGlzIGZhcg0KPiA+IHNpbXBsZXIgdG8gaW1wbGVtZW50IHRoYW4gYXJiaXRyYXRpbmcg
dGhlIGhhcmR3YXJlIHdpdGggY3VzdG9tIGxvZ2ljIGFuZCBtZWV0cyB0aGUgc2FtZSByZXN1bHQu
DQo+IA0KPiANCj4gTWF5YmUsIGR1cmluZyByZWdpc3RlcmluZywgdHJlYXQgc3BpeDIgYXMgYW4g
aWdub3JlIGNsb2NrIGFuZCBzdG9yZSBpdHMgcG9pbnRlcihlZzogc2libGluZykuDQo+IA0KPiBE
dXJpbmcgZ2V0KCksIHJldHVybiB0aGUgc3RvcmVkIHBvaW50ZXIoYnkgaW50cm9kdWNpbmcgbmV3
IHR5cGUgQ1BHX01PRF9DT1VQTEVEID0yIGluIERUKSBmb3Igc3BpeDIuDQo+IFRoaXMgbmVlZHMg
YmluZGluZyBtb2RpZmljYXRpb24uDQo+IA0KPiBOb3cgd2UgaGF2ZSBjbGsgYW5kIGNsay0+c2li
bGluZyBmb3Igc3BpIGFuZCBzcGl4Mi4gV2l0aCB0aGlzIHdlIGdldCBwcm9wZXIgcmF0ZS4NCj4g
DQo+IFsgICAgMi45Mjc0ODRdIHJ6djJoLWNwZyAxMDQyMDAwMC5jbG9jay1jb250cm9sbGVyOiBj
bG9jayAoMSwgMTYxKSBpcyBzcGlfY2xrX3NwaSBhdCAyMDAwMDAwMCBIeg0KPiBbICAgIDIuOTQ1
NzA2XSByenYyaC1jcGcgMTA0MjAwMDAuY2xvY2stY29udHJvbGxlcjogY2xvY2sgKDIsIDE2MSkg
aXMgc3BpX2Nsa19zcGl4MiBhdCA0MDAwMDAwMCBIeg0KPiANCj4gRW5hYmxlL2Rpc2FibGUgY2Fs
bHMgaWdub3JlIGZvciBzcGl4Mi4gQnV0IGl0IHJldHVybnMgcHJvcGVyIHJhdGUgZm9yIGJvdGgg
c3BpIGFuZCBzcGl4Mi4NCj4gDQo+IElzIHRoaXMgYXBwcm9hY2gsIG9rPw0KPiANCg0KQW5vdGhl
ciBvcHRpb24gaXMgaGFuZGxlIHRoaXMgYXMgY29yZSBjbG9jaywgY3VycmVudGx5IGNvcmUgY2xv
Y2sgZG9lcyBub3QgZ2F0ZSBpbiB0aGlzIGRyaXZlci4NCldpdGggdGhpcywgY2xvY2sgc3BlY2lm
aWVyIGNhbiBkaXN0aW5ndWlzaCBib3RoIHRoZSBjbG9ja3MuDQoNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMHhhMT4sDQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8JmNwZyBDUEdfQ09SRSBSOUEwOUcwNDdfU1BJX0NMS19TUElYMj47DQoN
Cg0KQ2hlZXJzLA0KQmlqdQ0K


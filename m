Return-Path: <linux-renesas-soc+bounces-14058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CB5A54935
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 12:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECB3B7A600E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 11:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEB7208989;
	Thu,  6 Mar 2025 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nrsJ3bJj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA58D1FC7CC;
	Thu,  6 Mar 2025 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260330; cv=fail; b=pN7TDu6Kz54ypO6oYi6lXtQjykvW1ZCi89TnMRx0dnTo2TBjgiVFXoWEVAWiPOcV1IziUDh+vUtFK2IrtJKs1aAPH9cNyLspPzycOxHq2er5RKzA5n1iKl/mHneDRv7Xq3pZNbkbaTugOTHguGafc986ZgH4g03TktHKBy/0xqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260330; c=relaxed/simple;
	bh=ngtjw8ngmeJcV3ow2YY+n66y5sNAC5I1qFjpQD2KxMw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uX45n0FBYyEIbnzFmYbrTwTS/VMiZMKOqceI7x54hphTzvasC6J4nJ0gB0UnI/XvzArZgkfxpLr8SihiszyrgHJtoLeqb5umaKO1ZuD3jyQ6QNv4+DlXeU/9KNI4I6SL69lzYLfeHAsdSm3yEVawbKGGT3HssRleJ4MXRMVi/6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nrsJ3bJj; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQvFM49t/R11vrVoFARinzIIK7j9x0afTRctEOJbBU25eAOKhlYxyOo6iwz29F1470ctws/JMNIFO4JWUcAk8jBL864roSMCKo5LnkyQqlTnQABvaMbauSuU4Y+2y/u8RJC7uuBXoFgVk20/ZD/nu2DEW2RMSGZ0cKcWq3JwWXbbxMt2Ewy+6Q/wpfq+Vo+5UcFoOStUCnTFnJznKIMlLAkO9KXt1gjIsw6VqwaVpby8LBT5i1abqk4h4PBvisLForyf0OS4Di2vYLK5U9qCy8pMDOqICbQHCZLyHfEr3bwn1qNhgWDYcWpcvDUS/54dF8OJjMMMcKA4s7Ey5T5HXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngtjw8ngmeJcV3ow2YY+n66y5sNAC5I1qFjpQD2KxMw=;
 b=NiaCRQhiBseTauHy8b5NSgKO7xedM4sI1xZVr7OAs5wFy9huWyabnA+vbhHkIjuh+L0J8OfvCD2FS7UNKvyA2lMbvdNx+nTDVETHNuPvC/VU6ISekzGawspvbPpz35TMVopycgYSIBp614l72XbliczPibD3NsDqd7KnWjNk0urwIZVfQLeZjKoWTHiSXV5CqnrNk38S/QYwK5rfPzl+v0p7PT4ePPxsz5/p8IRJz/q+OjhcOdj8QaFehFyvHpkNid3GRnYJPLKFnWu++EV+XJM+wZLkBiaTXJYYdEchEYOotiCtv4Gq0XQqv8hZiIH/bVOXf2nYbFacAthNd7MO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngtjw8ngmeJcV3ow2YY+n66y5sNAC5I1qFjpQD2KxMw=;
 b=nrsJ3bJjGhuYWzwyjH3LSauZac9G8KwkZLXfr7LqXQqk8KJXLHjs3p7iRsu5qj3RDDM03vUvu1iN9o9lBkjBPaqdo9lWhSsiSaHSebKrVJVFrwLQVqSC3sfKoCRnmCEPjenyoqWaDwGOByZ07D527VZ7zDVQVacPZfDOaaZVZW8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15489.jpnprd01.prod.outlook.com (2603:1096:405:287::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Thu, 6 Mar
 2025 11:25:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 11:25:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
Thread-Index: AQHbifr8yhGKdMSrsUi/t69sg72qNLNl9V2AgAADdPCAAAW1AIAAAGYA
Date: Thu, 6 Mar 2025 11:25:24 +0000
Message-ID:
 <TY3PR01MB113462D3DF3056B740D45DAF186CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
 <20250228160810.171413-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXOd0QgnWiptLJ2u8MwgYqw3=UufozdB2Lubt0yGc2BXg@mail.gmail.com>
 <TY3PR01MB11346736FD737998ADB7378E286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUMuCCe-tpkkrPS10o7+kNUUYZ1n89_LLVkJVF5pka3EQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUMuCCe-tpkkrPS10o7+kNUUYZ1n89_LLVkJVF5pka3EQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15489:EE_
x-ms-office365-filtering-correlation-id: 69f0950c-070e-4499-8bb4-08dd5ca196e8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dlBYckF1Tnh5d3VCUW5zMkVFc3BxQVJLaDNzUlVubnZ3cTlVb1FrTURMaUw5?=
 =?utf-8?B?T1R2b0dxUnBqb0tPYmgzUGU4R3FyQkVPdGFFS1JRK2xMWlpTVFRrTSt2dWlx?=
 =?utf-8?B?WnJlek1FajdEZC9CZXlGMklBQlA1U2x4bXRSby9uSFVxRWtXNXdsOE5kS2Nh?=
 =?utf-8?B?L2JKZ0xpTGM4eCt1bU9rRmFyK2xZb1VlSG9ocEo3Q1cvOTZjN3FiK0dwRGZC?=
 =?utf-8?B?U2FabHJsWDBwZVRTNzVZMXZkTng3bkJUUWtHZXpCLzd2MXJITHV4a2J4cDRo?=
 =?utf-8?B?YTYwNVpndHFKQ1BPclFTdTl2dm9pQ3FDQnpGVFpMM3FkT3JYdHhpQ2t2SEJ1?=
 =?utf-8?B?RUhVNkhPaEVodHJTaVdtejh2NG9sR2tzTENsaG5jUTRISkdrZzE3RzNJMldL?=
 =?utf-8?B?ZVUycG5HM05UNVJPMGltWDdacWtNazVOZ2trWXExUEZTaE5VcWNGekVJekJM?=
 =?utf-8?B?U0oxSDdMbHJOK1RxOFp2UGlGKzZkUmFMNVJUZjBvVXRwM3JtbWJkWjZWNWJF?=
 =?utf-8?B?M2JibnVaNlpzeW5iTW0xaXpxRlJhUkdSNU1kQWFybTV0aE80bzBJb3M0WkxS?=
 =?utf-8?B?QjBhZndZU2dBZTBsOS9pN3JUczZTeFRuU2Rlbi9YVVc4b25HdWVRQXBKRWN3?=
 =?utf-8?B?cm0xaXY0SmRmSWxqbExSSjBvVm90MjN1dDF0S1dDeXFUZDM1Nkc5a21LRFlX?=
 =?utf-8?B?MHVwUHRxV3JWYmRkeGh6QkIvc05uV0orcjFycTlzOVNmdkVTQjRBUUs0WFVu?=
 =?utf-8?B?TFQvVVBjc0paaWZrMis1TjNyZmhHdWM1eXJoRmRhR1lOcjVaWVhqS01YZU42?=
 =?utf-8?B?THJ1c3lLeTIrUm1zNlFMaTMvUjU2T2MrVE84Mk9tVjlSMHV3WGtLYncvc3R3?=
 =?utf-8?B?WVlnOFV0cWsrcWY0SFZVbFppUlJUWWtOa2hhUUdVdnl1YnBuUGdOVk1UeU5l?=
 =?utf-8?B?OC9PT2h5ZWU5Q2JFSkJ0V2NsQlI5bDJObVNyc0ZFNjBEWmJFRElPMEhpWTFK?=
 =?utf-8?B?SUNpR3grQUhXUm5qU2w4dDdEZ1BoMVhBWDI4enBJTi9KUGd3U240ck56VTdD?=
 =?utf-8?B?cDhBZ1oyNG5kcWFLNHFRQkRNaFJOQWhIbFRBajNmRjRYdXVFVkhpNnlrYVBL?=
 =?utf-8?B?NjFBSFZFZ1Viakh3dDBHaC9rSmhYYUo3SWozSUdTNlBlRktzUEVPVy85VWRB?=
 =?utf-8?B?ZHpVV2ViODNOeWZkVzI1YW0yZ0JaSXFsYy9JeElBd25nUHEwMmZLemE2MDAw?=
 =?utf-8?B?SGwrVHVjNDZXbnJWT2lZZ2Z4S1ZkT1EwWnZUVzJWMjU3aWt6WVVJemNPWkw1?=
 =?utf-8?B?eXcyV2toSVpRaStvZkRjR2JUTVVMSGxxcjc4dkJqVGNNVGpBaXRCcUJIQlcz?=
 =?utf-8?B?WTRRSEN1UWhuRnJaSjJGck9hdWpDV0t5RzZiZ2RuNnZtay83L2xtVDdlaEtV?=
 =?utf-8?B?Y1p2di9zYkpHODBabjB2bVVJZDZCRkpGdU9NaGNjNnR4UTN6Szk4dkVEQUJo?=
 =?utf-8?B?L1diRkI3WGRPeTU5MW1MNVpSeGRnVnBVMSttS09XTzF3M0FsL2F0SVNTdmhR?=
 =?utf-8?B?ZDFuSm9OSlQwUUd6c1dtR085L2UwcWRmS3ZwRkhTTldXcXJSL1Vza0ZxRmpU?=
 =?utf-8?B?UmlGMDdIWUl1YkNueWxUZUR5S29lNWp6T2JWOVgzV3RyRVg3RGRaTlVpV0hu?=
 =?utf-8?B?dmIwRTNjWFV5WXc5cDBydFJSVWlLdFJjUzJXT1ppWnFuWUU5Z0x3ZTJmeHRX?=
 =?utf-8?B?WWVuOEdjZ0FWWEcrSU1DUjgySTFuOWZzSnV1SStKbWdUZWk1ODhoanVScVNu?=
 =?utf-8?B?VHhGY3ZaakxLME5ST1pnZWwwYlg2UlZuN3orY0hVbnVGdWxXZTk2N2FnS2RX?=
 =?utf-8?B?dDlQR05PQUE3UWVuZEI1VHV4cmVjeVdaNGZOeURPVjZGOU1UUDhBUXpLT0xr?=
 =?utf-8?Q?Q6VaH/yqn895Ts5nmMLcKslcIl9EV3TA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUY4S1QrSnNyWWc5ckhHcTloditSQ3YwcldkK0FZd2ZWNElQTFNXdk12NHpr?=
 =?utf-8?B?NkNYR3h2MHEwMXpNN1lFejFJMnpJejNnUmhVWklSaW95S0tIc1lYV2x1dzZp?=
 =?utf-8?B?TU9iZUY5ZS92Ukx0ODVScWZxU2lDeENJU2JDQ3JibzB1SlhXZU1ZYzlsQ21W?=
 =?utf-8?B?elUrT1d3NmZYZ0NNTC9kaWN1Y3hKWERIKzFSelpZelAwYTI0S25EOWIyamZE?=
 =?utf-8?B?YVNjeHpNZ2VsT1FkeDJwaU93WXlhOTNPNVZWbDBUR2Z6R3AxOUgraGtYOEZS?=
 =?utf-8?B?K25yZ2tNcDlPTDF5bkVnMjJSSzVaVUdGYllpMVl0OS8wS2hVaHZ6M0Q4V3lC?=
 =?utf-8?B?SkFTVXNVL2xmREdtMHlpdzY1OStENEsxT2wzRm9VZGhmV0o1anFQamtNNmo0?=
 =?utf-8?B?MjhRa2R6OWxUOEVKVHRvVVF1RjIxVFVwTnlxVVJwaTV1OFhhY2VNbXlISmtV?=
 =?utf-8?B?cHBkU09vWEs5UklLb2FKMExzUlNadXB5Sk5rNGUyNU4yM0w5TEFSMjhiUTgr?=
 =?utf-8?B?bU8rZFlxZDg2RlVvdnFYUCtPb0RmR0tHSTMzNTNuVVRiY2R6KzBta0NxZkgz?=
 =?utf-8?B?TDdSVU5XbnE3RlpGZVQzcVJsSlRMQW9jL3piWHVwTW1yYU43dStjeFkxZDlx?=
 =?utf-8?B?QzRETSt2VFdJYTZyUTY5T1RvSS9mZURtZFJZaTZkWnFLNTVxc2lmYjh0emFF?=
 =?utf-8?B?QnlnenhxbXh0eW5YbW5xS3RBRXlWRmczVUNtMXFFY2ZIajJCZkxWNWVlakVR?=
 =?utf-8?B?SHFLUVc0OHo2MHhHVlN6MEtBMllHK3JYdEVEMzAyTUs0WEZjVXBETXQ2QlBo?=
 =?utf-8?B?R29Uc1B5SU8yUnF6cGFVTXNKeUJ5cXQ0SEJ2eGx5Z3hHQi9rdzdEb2tCNTRw?=
 =?utf-8?B?dXBxam9rbko0ZVFNT1VwUDkrVEI5eTJmUDlUN0RBdTBkYkF3T2h3L2c4RDZV?=
 =?utf-8?B?aUZXK2JNMTNOQ0MxRzJCd25XRFpscks2RU5INVBIVkFta2p0cVovWVhtRDAv?=
 =?utf-8?B?cWxvOWE3MXVoN3BRbHVmQWhucXo0aDkwUGR2Y1ZjRUdwQVdzYXhtREM4YnNJ?=
 =?utf-8?B?akcwdjVHdlVjMmJvQkRHQUpNNlhJTWVsVTZkRWsybm1jMHM0OWRGd1BNYkp3?=
 =?utf-8?B?cnNBd2swVW5TTkVWUEkzZzk1UnBZOStoNksvTG00S1RWTVpQMTNIejZFRVZv?=
 =?utf-8?B?QndhNXhkY0pjSDJCSXpsNGVFNWN5V0N0WHByVjdROEVoa3ovNkRqTUhGMCtj?=
 =?utf-8?B?ZmpIbzIyZkFXMGlHTWtrVjQ1SkJsSXZVUDlDVFZRNjU3MUV0Vzc4RkxCWXlx?=
 =?utf-8?B?Nkx2VlZoUW96Sm9DWks3YmtnZk1ZWnloL09aL0FyTkMwbWZqZ1RJUXh4aytU?=
 =?utf-8?B?YmlURXJUUFo2dnhubGhRUldTNEZCV3Y0ZjNwZmZrWEVzUjFZMmRvTXM4bHIy?=
 =?utf-8?B?MWZobU1PRDZOWmxDNHpjWko2SG9zTlhBcGtaSHFmRzRDd1grU3BLcGhBRmli?=
 =?utf-8?B?SVl6VnhLL2hrYnY2aWkyd0pNMk96L3F6OE9tejAyQWRDNDQ0WG1JaFNwSXhH?=
 =?utf-8?B?ekNsUmh4MllBSU81U2VxcGZuZ1V4ZThxQWpMTGpkUjhQOTFqQ2h2UHhld1Js?=
 =?utf-8?B?cGw0cUNaSUhINU5uTDZ0c25FS1VMQnZSc2NuUHhjcERqMnE1SFEzYVFYYlJl?=
 =?utf-8?B?WER1Qk12S1pTNHA1b2xQMGZ5ZFp0RlRyVGZ3eXJEL0hqQXVXK3MzK1lhOW5r?=
 =?utf-8?B?ZDJGR2hScVBHK1R4dDlQRUJmQi9vVkVRTENhL2Z5LzJmYTJ6VjRwaFI0ditL?=
 =?utf-8?B?c2N5eDhXUEVJVGtLNFg2UDVCWml3UWNtK0FtSkQrUXY3VUR3eEZyeTFhanlp?=
 =?utf-8?B?NGFiVHBNUzJsWWppQm9nTzllU0pqUmFscFRuVTYrNU5EZjJyQ01EN3duam0v?=
 =?utf-8?B?Yktzd204WVc3MkI4eWZTTksrdnRlVFNETzE5RzRxaE5JZ3ZBNnNaekxNTWRS?=
 =?utf-8?B?UUM1dHhBZTR4Vnl4OVdrZ05hZXk3NDRqTUlqbHBxSlpSejI5dE1zQkJGNlRC?=
 =?utf-8?B?cjBlVS9JS0E0WjczR0ovdkl6aW9wM1lHaERaNUpPbDdLdGVQaHlBMG4yNTdT?=
 =?utf-8?B?ZHdJUlhjK1M2VTFSbHc5U2RiT2J3UVBtZEFjcm16UjBLYy9TNGJPQXF0L0p6?=
 =?utf-8?B?WGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f0950c-070e-4499-8bb4-08dd5ca196e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 11:25:24.7232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eneW5mqwflElXA4AHDm1sfMwTHvn+UDsiRRA7myPKQ3ZdrfbVGmH0kSL4kDKlD+I15NlwtLlQczQVefxQOaJWVSUrwpEnzETzOWyCrGmtfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15489

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDYgTWFyY2ggMjAy
NSAxMToxNw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvOF0gZHQtYmluZGluZ3M6IG1lbW9yeTog
RG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDYg
TWFyIDIwMjUgYXQgMTE6NTksIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiA+IFNlbnQ6IDA2IE1h
cmNoIDIwMjUgMTA6NDQNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS84XSBkdC1iaW5kaW5n
czogbWVtb3J5OiBEb2N1bWVudCBSWi9HM0UNCj4gPiA+IHN1cHBvcnQNCj4gPiA+DQo+ID4gPiBP
biBGcmksIDI4IEZlYiAyMDI1IGF0IDE3OjA4LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBEb2N1bWVudCBzdXBwb3J0IGZvciB0aGUgRXhwYW5k
ZWQgU2VyaWFsIFBlcmlwaGVyYWwgSW50ZXJmYWNlDQo+ID4gPiA+ICh4U1BJKSBDb250cm9sbGVy
IGluIHRoZSBSZW5lc2FzIFJaL0czRSAoUjlBMDlHMDQ3KSBTb0MuDQo+ID4gPiA+DQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPg0KPiA+ID4gPiAtLS0gL2Rl
di9udWxsDQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvcmVuZXNhcw0KPiA+ID4gPiArKysgLHJ6LQ0KPiA+ID4gPiArKysg
eHNwaS55YW1sDQo+ID4gPg0KPiA+ID4gPiArcHJvcGVydGllczoNCj4gPiA+ID4gKyAgY29tcGF0
aWJsZToNCj4gPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHJlbmVz
YXMscjlhMDlnMDQ3LXhzcGkgICMgUlovRzNFDQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiByZW5l
c2FzLHJ6LXhzcGkgICAgICAgICAjIGEgZ2VuZXJpYyBSWiB4U1BJIGRldmljZQ0KPiA+ID4NCj4g
PiA+IElzIHRoaXMgdGhlIHNhbWUgdmFyaWFudCBvZiBSUEMtSUYgYXMgdXNlZCBvbiBvbGRlciAi
UloiIFNvQ3MgbGlrZQ0KPiA+ID4gUlovQTEgYW5kIFJaL0EyPw0KPiA+ID4gSWYgdGhlIGFuc3dl
ciBpcyB5ZXMsIHRoZW4gSSBkbyBub3Qgb2JqZWN0IGFnYWluc3QgaW50cm9kdWNpbmcgcnoteHNw
aS4NCj4gPg0KPiA+IE5vLCBieSBsb29raW5nIGF0IHRoZSByZWdpc3RlcnMsDQo+ID4gSSB0aGlu
ayBvbmUgb24gUlovQTEgYW5kIFJaL0EyIGlzIHNhbWUgYXMgUlovRzJMLiBTbw0KPiA+IHJlbmVz
YXMscnpnMmwtcnBjLWlmIHdpbGwgZml0IHRoZXJlLg0KPiANCj4gSW4gdGhhdCBjYXNlIEkgdGhp
bmsgInJlbmVzYXMscnoteHNwaSIgaXMgYSB0b28gZ2VuZXJpYyBuYW1lLg0KDQppZiByei14c3Bp
IGlzIHRvbyBnZW5lcmljLCB3aGF0IGFib3V0IHVzaW5nIHJ6ZzNlLXhzcGk/DQoNCk5vdGU6DQpS
Wi9HM1MgYW5kIFJaL1YySCBoYXZlIHNpbWlsYXIgSVAncw0KDQpDaGVlcnMsDQpCaWp1DQoNCg0K


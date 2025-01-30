Return-Path: <linux-renesas-soc+bounces-12744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB1A22C5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 12:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C2D93AB36F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 11:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3931C1F05;
	Thu, 30 Jan 2025 11:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UiPFTBH8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA311E47A6;
	Thu, 30 Jan 2025 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235524; cv=fail; b=UhDHH51LH5+508zmBlIlVMNCtqZH+Yz8o45FJS9tgnzZY/w5Cz9vDQ+ZDtRRDhRKHwUbcT0UvzyMb+H7HtREDOAAoZspIIY1hqyVkMYpb4WdcUsmSxm7HVo9xL66skv3qm1aLv1+MfrZKYLvPxvEI1cssLIk1clb0vGromhV+1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235524; c=relaxed/simple;
	bh=pz0tW8rIXJT1CZ/AS7kHAwpM8KbjdQEy0yTefCyy4+g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GRBxQ+o/omtkRQELIDJmWr0bZ0hfrOuixrxk7KwEulBx04b7GLKsk9ZAvTqb/syYUv60DuCDCRxcX4UOltVFeLVoXSlbS8UDRzLpmVx4YuPwJOoa0ycSX1MRAFoj7EUN47ezwu2cDMm++bAwhubo2JDAuvdPgOCR+enhC475hRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UiPFTBH8; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYKgh6780p5+9PqpsiD8M53X5D+CteTQf23MB2hqSbIUG6ne3m1jXFt6x0Lz6ECsbCKqMIBRNRujhRe4RCEwYZDi4z7zIGSJEqcGS0VjdgET2EKU1enrvNTiHsdyCcdBgoN0fplR5hkpzZAvN/+gDEEBzm+lcqg5TTydx1+aQsp6Kihgp59pfNiTqSlEobWQZr2TFVsE4JX/p5de2IfGIBkLg0toxxb2SY+IeW0kDn76nO6WXGVBVFqXlhFfpa0bgayKn6zPVTi7OxMQE31S+lA9FXuBCWtadTlcmIm/Eyr5vGvy2GK2Pjvedo+IZSXshgdIZj8VMTtC8agdHInoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pz0tW8rIXJT1CZ/AS7kHAwpM8KbjdQEy0yTefCyy4+g=;
 b=pbdGEX4FAH0N/4u5gRQhpSbaXFEppViIlpRuEzPugAflggP2H4VkqOqdxxOWWcAPVdx3Z3c8gU4KYW9BGRYTyzIomn+pvGtn4EUqc6mnVbKIDqJYGkxRWS+qzHJEMxPH00Qa0n3MeFKbxkav+f27BCJZE1oWUbtfL6u6xpE8/tLePX7nZqA6bxRU6ICSEYPUfhRRB6tBa0kWWFNGDYe+JitA25Qu0PKlJjJhVc6Xle1YeSk61x4TpwsuzVGRB1ccixTnc5Qx4E7F8p7nvG1PJ5w3kEIBJvpWncSaXmby4jaR0zcukY7bhCDSLH59B8J4DODFobBN9ZpgtF44iVhlTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pz0tW8rIXJT1CZ/AS7kHAwpM8KbjdQEy0yTefCyy4+g=;
 b=UiPFTBH8kwmcJ0UUkqdfwWohFNoN1zps02qUt0nZh04PvjJhTevKJhhdIB89wegISPjTk6JmQjgRJwqoCgO87IpD1FqxzZ7QY73RhyOnRLwXrYT9LgYIeuF3HkGrnDMjdVcCd4Zw1EoGIooIIArhxY6sMNbAS9XMf/N/CRa+o4k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13401.jpnprd01.prod.outlook.com (2603:1096:405:1c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Thu, 30 Jan
 2025 11:11:57 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 11:11:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: RE: [PATCH v3 01/13] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/G3E SoC
Thread-Topic: [PATCH v3 01/13] dt-bindings: interrupt-controller:
 renesas,rzv2h-icu: Document RZ/G3E SoC
Thread-Index: AQHbcXIG/2At43WzHUyaG4fVFrAT5bMsTJSAgALfuPA=
Date: Thu, 30 Jan 2025 11:11:57 +0000
Message-ID:
 <TY3PR01MB1134632919269C67AE2BB120086E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250128104714.80807-1-biju.das.jz@bp.renesas.com>
 <20250128104714.80807-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVwxpK+6fVfwkYWFvRF5kzpY3tp6FH3Or=grJsxojO64w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVwxpK+6fVfwkYWFvRF5kzpY3tp6FH3Or=grJsxojO64w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13401:EE_
x-ms-office365-filtering-correlation-id: 07dc2281-1451-48fa-4707-08dd411ee906
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVZuZEkrenliK3poS0FibmgvN25jdm10YU4vNmlvaG84ajk0bXBVV2NEaWxy?=
 =?utf-8?B?aHRickVmd3JUdUliQmZVbXk4MmZvR0RqdStWbEVRanFZamJpK2FJWE9NQjEy?=
 =?utf-8?B?by9CODlYellZcFg0ZDlrMENqK2R2M0Z4c0wzd2REc2RnNmVRMlEvUG1IVk53?=
 =?utf-8?B?OHNBVDFXL0FFWEVCNDBTdXNOY0FOb1lwaHVuRmVHblpBNHowY2dmVHNPNVhC?=
 =?utf-8?B?VmhzZjBpSW9VMnA0aFNoR2NxMmM2dlBoTlVGdmNENUphRXdzOU43dzR0Mjlq?=
 =?utf-8?B?MDRwMHc5QUhNSG9zNmNZSFRONi8zaHVJZWVNRWx6alNzMExCL0pReFF2d0Nu?=
 =?utf-8?B?a3FaYlJWekcyRFc0NE11YjVWcDBUMCtlMWFIZUJFQXkvMFZkY1pHeUY3aWtv?=
 =?utf-8?B?NzU4QmdpNnBMT2d5SElyclNFbk9RVjhwZTZwSGhzNDhxUm5wWlV4UlZnUDZY?=
 =?utf-8?B?MUlXcGxmZCtrdXkvU3ZBZlIyeXVzMnROSk4vS0kzWXlZSFlia0NNdExqT0dY?=
 =?utf-8?B?M3ZWZDBUNXkzY0JXME1JbWowcmZkeGtzZllwQmk4T2VrVkc4OGV1RDNFM1l4?=
 =?utf-8?B?RWdCOElrWVZwWEVjR3JqMWV6bmJjSGR6Q0paY0tGaytTdExIZDYwclAwV0Jj?=
 =?utf-8?B?UHFUaHdZb3A5Q1dYQWlNMW02NTE2NmFoYTc5TWFSZ2xHZ0RGQzdPUnJsUzI1?=
 =?utf-8?B?SCtjWGZBUEJPa3kvRTNiMG5TOGk4YzdPdU11N0Y1RGdyU0EyMlk3U3I5YTRl?=
 =?utf-8?B?TEJ1cXlsT1haUExkYnJ3WTNMT05wSkRRQVQ2ZFFQY0E1UEVhTlBMREJNaXNK?=
 =?utf-8?B?QzNLM3R3USt6Uk43M2JPNWNxbnpmQnNLa1lXNDVyOExoSzNuVjdybGtycVBw?=
 =?utf-8?B?cVJNUVFFbnNQenczeE01ZzByZ2hIenFZQjNuYnV4OGIvbWs2R1pkLzNBZFV5?=
 =?utf-8?B?RDdoVndma3prem8xUlNpT3VlYmtjRXBwM1ZsbHo4SklRWnJjczNnbVdoNWgx?=
 =?utf-8?B?MWpoOERvbStsbTIyMExZU1lTd2VMeXRMbHV1c3IxbG0ydEI3SmxnQ0JHeDZK?=
 =?utf-8?B?R3dVMGVPdlZRQ01vWUh4M3BzV0dod2xPVjN1U0xpcjErNU1tZ1JMQU5obVVx?=
 =?utf-8?B?RmV5WmJnUTVhdWZaWW95aEc5M0pZVFE3YjFoV0tOT0RDWXlZZS9MRjV6K1ZM?=
 =?utf-8?B?TGNuWVFDVVByODdHY1UvVWtEZU1jUnJnN0pJMFgyVVFxK2xoaXk0V1hjNUps?=
 =?utf-8?B?Vml1T21WcVYwWG5EMExFZU9EVFdJM3l3dUlidFppNURsSE1EZ0FuTnZXVGxL?=
 =?utf-8?B?bmNyUkxBZFMzSUtnRWtMRk1BL1BUbFVkcTlCczFmT0R2NXVGcDZUZUswWE9h?=
 =?utf-8?B?VUNYV2xMNng5d1pUOGxVTE0rMmJnRldXTVlXS3BmeWx2bXFyZmV4RjdyaVlW?=
 =?utf-8?B?d2dLK0RCRmtFN3dYREovMDM2QnY5Q3F1S0RkTFZiWmplOW0zeUF4VUVTU3hh?=
 =?utf-8?B?eWI2SHA4dUl6ZVh1bnZIZzVaL0tMalc4Z2tEN3FpMUxDZm5SV1NlMGV2LzNF?=
 =?utf-8?B?ak9EMmpLNm1SQ1VVNVlzbERicFEzejc5dlNNOG5xSXpkbVVRbFgybHlwQ2Rw?=
 =?utf-8?B?eW1XaWpXWmZ1eTNTR1oxOXA5c1N2eVczeWV4Y1RtKzNSbXNjSmpaMEFsc1JK?=
 =?utf-8?B?eTdGb1c0OUpWR2tkaEw4YkpDQVdXVklpbmR6NkxaOGx6Qkh0SGtJaUoycXI0?=
 =?utf-8?B?QzA1S1hZdGMwVjAyZVRZWGt5U3p5dXhnUkZnWFIwNmpTcno2bTlBUU5Wd3kr?=
 =?utf-8?B?Y2paajFOODRyaE9IZXVlMUZXZm9SNmplU2dmTFJIeGVxOUt1ejZVYWhjMmdK?=
 =?utf-8?B?Z0tHaG43aGpDMmV2QlRaL2NYTDl6Q2ZONWVoR1laY2JyZ3ovSW1YOHpoSzZC?=
 =?utf-8?Q?iKAzFvutCPw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlRmdVlaeklzM3E0aWdrNytJbDQxV1VCYjZvbHRvWUwydUpVV3dBQ1hZcmxE?=
 =?utf-8?B?cVEycVptaVRjK2Y2ekN4UDhiVUJJaSttaWczREIxeHlFZGFKZFlMYzBDTE1N?=
 =?utf-8?B?WDVtLzBmcjRHZU5aQVk1OFk1SmJHOWN4ekt6ZmgxbVRKb09pRjVWQkR0YS9p?=
 =?utf-8?B?THhmd3dna0x5bm83VnN0S3pldUtUQjF5WlBlRmkwOVVMclBIM2xWOTNlOHR5?=
 =?utf-8?B?Zlg3b0ZyUlBwVGlad3pSRTlGd1BYbWlackJQUStFUkFMeVpPTCtpL2hqWmVz?=
 =?utf-8?B?cXRBQmV3ZlMrUXo2UUI3TFNhYXRlRDBZbGFhNHozVHVWenJPbTlRajZaWG1F?=
 =?utf-8?B?eEUxVFZDa0lkM1JhdGs3TDJQM2d6Yi9jbzFGQ2YwODlORlBhRkozZGNSN3Fq?=
 =?utf-8?B?cmgxWGVJMU5ENTFRNEZwTEdHVXVoSUprV3JDUFhJQmM1dlBIMnpFbHBkYWlJ?=
 =?utf-8?B?ZytKbWhUeGRFTnR6eStXd3RiWklCZmNqRnUwaHlEMUswMTYrNGRSNEtuY0sy?=
 =?utf-8?B?a25waUIrVWNIUWNrK0xjK0twbUJJUmYwdVJaREN3MlZwYTh2THB4VFk0MHpV?=
 =?utf-8?B?SmZtWGM4Z2gyaXdrelVGZG9JbHdISGV0Q0dlaGxrcllXYzV4ejc0d0llUWxO?=
 =?utf-8?B?elBEU1kxU1AvNGVqSDZoei9jOFV3Wi9zb2NMSXNSc3FqNEdEcXdpcFdPMno4?=
 =?utf-8?B?ZHcrcldqbTExazcyMzIyTWFWSXU3UFB1OWJjWndSUEIvZlJ0ay9kQlBMOHcz?=
 =?utf-8?B?dTRIVUhFdlBjdGR2aThRSmpMdVA1ZkwvWXhEMGg2NlA1S0t5WDZCeFlMOGg1?=
 =?utf-8?B?N0VaTXZXQzBOYU1nWWdxcktJaHZBazZVK05NdDNQZDJCR09kZ29KMUtnMFAv?=
 =?utf-8?B?MHBZbXQwZHNJOUJIV1NBNjJNbExSejVyR1d5QWJqSXJhc1VQMDFPS2RJc0ZG?=
 =?utf-8?B?NHA2SlNsVTByZW9Ga1hjdDM3MkJDSHBnSTNPZlZ3WVc2aTZ5aVJBUkswTGw4?=
 =?utf-8?B?eURsYUtLalFtVVNobjlQR0tQT3djQjVxVXVPeWFyTHZGTVJMOXo2bUpOWGNX?=
 =?utf-8?B?cFNLdm9JaEhzK3NjS3hGS2trRVZ0c1BsTWdZWEdPVGJUaVZBRW9GVVkvUkxK?=
 =?utf-8?B?UnhMeWVLOFpLWFFPSHBIUi9YRkpxekp1cEpScnVQMnQwN1cvMGJ4UGVEQ3Zk?=
 =?utf-8?B?bWVndCtMbzFMTWtuRmJna0lObjdKSkFITlduQ28reU1sOHFCdm5raFQvVmV2?=
 =?utf-8?B?UFhvTEZya2Q2UHRaU1oyTGZHbGZyTUlmdjBsYmJlM0J2RWNKVml1VldzYU16?=
 =?utf-8?B?NGY3ODJZK09Sa2NKRm0rY1NDVEZHUjV3NTV1SWNzVXlWRFl5T2NUWko5UWJN?=
 =?utf-8?B?Y2ZvNDVTZnZObUxzOWhNTzNJVGpmSjdFZ2QzR2NJNGZTd2FYRGN6ZFp1VFhx?=
 =?utf-8?B?am9KaDQ2WTArUURzaFFtOWhlT0QxZG1BMGxtcnVSOUxDOUN3OVVzeFFCa2cy?=
 =?utf-8?B?MEF5Y1gzMWFiVWJsUXhmMkdrWTV1emFydjE1QTBnM0s2NFNNMThqdGpZYmJM?=
 =?utf-8?B?WlRWbnVORWNIaG9YN25rdkNSNEh3aStpMjRjM1hiNW5JQjBJeWt0bnYxenRp?=
 =?utf-8?B?VXBsSS8yODJYN3A1TXRsanFWU2dlelBDdXZBeWhDaWFwYzducDlHMkhiQW9R?=
 =?utf-8?B?Z0tLK2d4c0hQSHdvRkJGWVZlVGQ3UHBHQmcwcHpzNHRFdHdVZEl0VDVOVVlG?=
 =?utf-8?B?ZlFCSHdRZkRGeTlVYWJHM3NuMk11blZOUUs0aWVmVW9rQzZzckl0MDYxSXUv?=
 =?utf-8?B?bEJrTXRsaGJyNzNQejlzQXQwd1ZJekFnb29wOVU1VnVvcWozVkUrdERNSGRB?=
 =?utf-8?B?U1VtaVFHQUo1SXdPeml6b3Y4SThtOGl5dlRKT3A1ZGhnZ0V0ZGlaWmFXZEcw?=
 =?utf-8?B?Ymh6SUNTMS95WFhsanFjU0k4RUR5bU9uWkMxbEttTUVKL25FWFpjMmU2SzNw?=
 =?utf-8?B?SW81UEtmV3Z4YW1UN3pzcGx1UkRjNDd6M2I4SlZLSm5JeWFEK1dhS0V3L0Ew?=
 =?utf-8?B?ZmRMYURCd2Qydys3WWtOOFpZbHZoYlpDVkdJUlpNU2FJYVVYM0Ywa0gwek5v?=
 =?utf-8?B?YlZubnFjZzk5MFNMdzNPRkpLdEI3ZW4vS0ZrUVhpa3hFVUJSRU9SOWE2ZzNU?=
 =?utf-8?B?V0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 07dc2281-1451-48fa-4707-08dd411ee906
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2025 11:11:57.0299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/9Ss8MBVp3zxrp8Pytj/fCuB60/lTOcwhRzJWCMRTDgxIisgBwtpfvAQIRLXS91+cVHrARzQBeIihUbBv90wynLr+yvDoeZj18akjp3o2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13401

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxNToxNw0KPiBUbzogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAxLzEz
XSBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IHJlbmVzYXMscnp2MmgtaWN1OiBE
b2N1bWVudCBSWi9HM0UNCj4gU29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoIQ0KPiANCj4gT24gVHVlLCAyOCBKYW4gMjAyNSBhdCAxMTo0NywgQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBEb2N1bWVudCBSWi9HM0Ug
KFI5QTA5RzA0NykgSUNVIGJpbmRpbmdzLiBUaGUgSUNVIGJsb2NrIG9uIHRoZSBSWi9HM0UNCj4g
PiBTb0MgaXMgYWxtb3N0IGlkZW50aWNhbCB0byB0aGUgb25lIGZvdW5kIG9uIHRoZSBSWi9WMkgg
U29DLCB3aXRoIHRoZQ0KPiA+IGZvbGxvd2luZyBkaWZmZXJlbmNlczoNCj4gPiAgLSBUaGUgVElO
VCByZWdpc3RlciBvZmZzZXQgaXMgMHg4MzAgY29tcGFyZWQgdG8gMHgzMCBvbiBSWi9WMkguDQo+
IA0KPiBUaGUgZmlyc3QgVElOVCByZWdpc3RlciBpcyBhdCBvZmZzZXQgMHg4MjAgdnMuIDB4MjAu
DQo+IFBlcmhhcHM6DQo+IA0KPiAgICAtIFRoZSBUSU5UIHJlZ2lzdGVyIGJhc2Ugb2Zmc2V0IGlz
IDB4ODAwIGluc3RlYWQgb2YgemVyby4NCg0KT0ssIHdpbGwgZml4IHRoaXMuDQoNCj4gDQo+ID4g
IC0gVGhlIG51bWJlciBvZiBzdXBwb3J0ZWQgR1BJTyBpbnRlcnJ1cHRzIGZvciBUSU5UIHNlbGVj
dGlvbiBpcyAxNDENCj4gPiAgICBpbnN0ZWFkIG9mIDg2Lg0KPiA+ICAtIFRoZSBwaW4gaW5kZXgg
YW5kIFRJTlQgc2VsZWN0aW9uIGluZGV4IGFyZSBub3QgaW4gdGhlIDE6MSBtYXANCj4gPiAgLSBU
aGUgbnVtYmVyIG9mIFRTU1IgcmVnaXN0ZXJzIGlzIDE1IGluc3RlYWQgb2YgOA0KDQpXaWxsIGZp
eCB0aGUgdHlwbyAxNS0+MTYgYXMgeW91IG1lbnRpb25lZCBsYXRlci4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQo=


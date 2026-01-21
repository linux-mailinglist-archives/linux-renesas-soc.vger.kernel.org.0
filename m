Return-Path: <linux-renesas-soc+bounces-27190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFWTK26wcGmKZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 11:54:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2497F5591B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 11:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7E613923C59
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 10:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B8F466B4B;
	Wed, 21 Jan 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fNjzrELH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E4C3563D2;
	Wed, 21 Jan 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991282; cv=fail; b=Uw6cAG6pUnz6ftHBVztLdsmibAbQmg+Zp2UryH/LfmykW1ZZCLgegdhU09DUERQgk7PmkHmrHuywRXMRzHvKv7/FK51fRj7NbU/0Ad4ARk2zvPUsoXHRBIVJ2ccFT0VIhV029U6EvfvOGpPHV5U86D3NeZpRcJsombd5F2Mh7Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991282; c=relaxed/simple;
	bh=FreggnjedBXCDjAF2A/UPzsKenJ0zcGrTlVx84DNwD8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MO1KG5XQ0SiJDB6ekNRhFyOUFXUG4a5+ik9kxQ3tNwaN7vjVzPVKGg7teGNB9RFMvwcasFrmVO1HYwtiTue+itVhi3eMUhBWRrRxn+j9MN5hGsV+ZWsWUHhXavt0DSsbctlTD842dWXixQ+eeOzIm6GHn0cd0JvNNSFU3ZQAOk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fNjzrELH; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDzwK/iVjjfqPrENTCzuDTCUhqo5jydRhiJti17z9xB9QqnegaVDWuLINJh2rgHX5MgqCn1JYcOZsNgcrZUESCiEN+GDFJ9+IoAvW68mNzlIO7gxfR3YpV4ONDCBjZ2aTgb3AOD+/a9595hspmiu43HJC/6i23ad8wzYNZz23btQ4vdV8Mj43uzUXpC5Hiz2h2uIb+Ca2DkCdHqsF/hQONcctFLKBvC/cnW0lLrNxsomcKQN0PjJ40Wa2F83cE0QzMlphSL16GlLLHNCkhBDwXh7Lx41ccy9eJ5YJYc4/hQZqNfA7I10Zy/wBU8ykMTROH6lK2CIx71l2mrwsNUYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FreggnjedBXCDjAF2A/UPzsKenJ0zcGrTlVx84DNwD8=;
 b=CVDpv9ay8mcvhMMUrrSRMqYqNGHHb+Mw6XuQ5PfDRkP8jqo7vR+bpwqT9JrB3PVrjmW+QmJI5CZ9ThFQSUsi1txqRCQntT30VT13LCeOP1/eqjF/N8ffC5Qoz33GQcHQVtGJiM6V2nqw3mzS0hCFrmteTJwXo1kYxd7uu7cpFxxo73yWwkKvlGaXmFgE6khIXDLR6rcGiGjXIHDPWmpCDT7vUCEWqMI3Cp7KKfa9q5RYiAqtG48PVTaheAL2O67fz7VkxROgtoHsxdJ7Fm1j/uQy8cMWGyw8M+G9mTiP14PpREfhaJWR+Gv5JWNN+AtbKl1sGweKAvhRrx/a7w+U9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FreggnjedBXCDjAF2A/UPzsKenJ0zcGrTlVx84DNwD8=;
 b=fNjzrELHvyYVgkXpuu/8yKoNdwqkyVwHhtSleiHXZhc8HSv2MQAy+fkkRWzYutvuQiRLtLATAdTo5g1NooLvgyuoar3591kPp9U6VoXdvlwM8Hz67x9swsW7KOqKQK/F4mQeDCw335dI8ho5hQZW7Y5plC5b/mwpQil0BENJ0Sk=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB17884.jpnprd01.prod.outlook.com (2603:1096:405:34b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 10:27:54 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 10:27:54 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Biju Das <biju.das.jz@bp.renesas.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 16/16] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Topic: [PATCH 16/16] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Index: AQHchWur0QNnJZ0tzEqmzsYZqV6cE7VR2GYAgAAC0JCAAAWwgIAKlMqAgAAAX2A=
Date: Wed, 21 Jan 2026 10:27:54 +0000
Message-ID:
 <TY6PR01MB17377BC69CAC718C373D0E519FF96A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-17-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB11346AE1205D35A8D8BC90B9B868FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY6PR01MB1737773DEF65ABEBEF11D2E96FF8FA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346C084AC2534C52822BC8B868FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWXrYCULkavZGBE2foOh4A7kesda8Be1PfW-rE0WEsjKQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWXrYCULkavZGBE2foOh4A7kesda8Be1PfW-rE0WEsjKQ@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB17884:EE_
x-ms-office365-filtering-correlation-id: 53cbf446-cbbd-4c1c-569f-08de58d7bccd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VkEvUC9mVzg1OFBINmdyWnhxTlRtbGEzNkJ4Q3V1N2tCUTVlbG1YdE9DTDda?=
 =?utf-8?B?Smh1bk01a1MwOW5ncWQ1c0t0SE9uL2l6NlM3K2FnczFHTk9DMWhDcmdsSVgx?=
 =?utf-8?B?UkdwdkcrTUhUaFdYTXpubjhCalpEcnZhUGVXbGNyOGxha1ZSSXVzdVBldXJG?=
 =?utf-8?B?bUpTM20rRVJjWkZ6aGJ0aEhqQUs2WnlvR2FkUVcxL2VNcWdwaTNWM3JDSjJS?=
 =?utf-8?B?TFhWNWtqYnh3RWUwYmswV2NNQmNobXBOSHVGVHMya1ZjRlc5Q1MvUjJFVm9k?=
 =?utf-8?B?TWgvcW4wWFY1cU0xWWJpUHZhUlFnL3RBSktMQjdTczNnSy9oeDByd1pTelFV?=
 =?utf-8?B?UGloZVdOTEpOQVUxN2xWR0R1Rm9tMkJ4NzVLYW1VeEZoZjEyazhjbkNIVElW?=
 =?utf-8?B?TXAyeGJOL3d1dm9Vd1JGOGZwZ28wOUFSVWhYRHU3MStOMThSZ0VXY2VJMW1v?=
 =?utf-8?B?SjZ6eVh6NTl6VzQ4MUg2Sk9qSVVJTGx6ajVUNENaYitTNDJIa01YcTdmaE12?=
 =?utf-8?B?QXljbC9UcFB0dFFZMUQzbFdpU2M5aHRnKytnYURYS2JIaWVzb1VMOHk4cG9G?=
 =?utf-8?B?M1VhUGo1TDlvUXNnWHp0WGRrK0VOVmNxSktBNFNJZ3I3bzZDOVBkbW5PNVl6?=
 =?utf-8?B?YlQrWm5iZU1lVzNPTk9NbjlHS0xIaGxrckdOa1NsRWpSYWJuc3RaanFxRzlG?=
 =?utf-8?B?OW5xVU9jb1EyRWlQeHBnQXhBV3BTcjQwQUQxRVFnY2ROVko5TThwOXByOE85?=
 =?utf-8?B?dDFQbytoVEZzUzZYRm5IQTNqci9taTlycFdMdkJGdEhEUWxBblllSXpjOFFQ?=
 =?utf-8?B?cFMvVTJTdTdpNHRTakx4L09LcTJRVC9xQkRGZHhsU0FkY09qVVZEK1JnRmRq?=
 =?utf-8?B?V0ZyaU1LSXN2QWtlODlGYXo3VndzT0ZNNHpVdFdMMDBnUUVkQkw5NEZUbnRM?=
 =?utf-8?B?bWJGUDVyVUpVcHpoNUdsZm5XdTd0d3M1YStOVWNMK25rM09UYjB4WUgyTXNS?=
 =?utf-8?B?OEFyb2htQWNJQlkwbUYzM1ZGREpMM0pBNlQ2ekx4cFA5Si9FZzZwcHd4cVBh?=
 =?utf-8?B?YUJITEg5OXBIS3R2QUR3NG04dmZjWHJNUlBjSVFmVzRVOFVyd2tzTlN0N1RY?=
 =?utf-8?B?akdhZ0J2MmVKZjg0bTV5OGFjL1NBOFc5WEhYaW1KV2FaLy9LWWhDZUYzTGNh?=
 =?utf-8?B?NmswZStkb2tGaFlINmRnTzExcVk5R1lOUVVpbWhocUxQRDVOVEVyZnIycS9a?=
 =?utf-8?B?akZQcS9EOXlTaFZOK2o2czgyQkJhaFZQRlo2MG11bEt6c0RQNURwQThseTNu?=
 =?utf-8?B?UUllNkhmUzM4c0N2eExsSm9HOW12aVFqTWw3QldIekFRcC83MGszaHRHWVBh?=
 =?utf-8?B?M05vemNDK2NMUEZWc0ZrSC9sWWZUbDRKaS9KRTA2b1NrV2trbm11TG9lQ3V0?=
 =?utf-8?B?dnovem8zSHJURjIxeFh6Q1ZmR2RLdkZqM3gyN2VWUDhpTFdhQUxDN1RjcEJr?=
 =?utf-8?B?TmNtNFV2Y0FBQVN5VDBVYWRXdFcwVnlneXBaSmNWbGZjejFjOEtWR2RlWDVQ?=
 =?utf-8?B?M21UeUErTlZaQ3NoOGNXbDA1SnlJWHNnQzRKdjZEYWdnNEx2Mm40V21pNFpk?=
 =?utf-8?B?Q3FnMFd4UHg5dEViTDVQNk5XTnZwRW9GVWdpZnJzbTU2MDFLbHJlRDR4VnYr?=
 =?utf-8?B?aFB1NTRrMXlGUXNiNHhSbDJCakxVUWdsLzVDUFVjblYzTFduanR0cndST3Qv?=
 =?utf-8?B?bzdXTS9XRm5kR2RTTmQ3K0pwRkFZWE5RODNQQ2x1WTFsa3hGU0h1b1BFMmJu?=
 =?utf-8?B?bG1NQ2tQaFJQK2hiRlFzYXhJWHRHTU90Ny9WVWtBUFloVG9neTd2cmFheFd6?=
 =?utf-8?B?L2N4VVgwTC9nTDFCNWlBMEFiY3pjc3FJR0tUUnVscWVyYjlpNE5sUnd4V244?=
 =?utf-8?B?bDFOMjF4SGxENWN5UmtuRUpnN2JsUFMrNE9qZHlIak9GL0lYVHVXcHp2VzNM?=
 =?utf-8?B?WVp6MDFkVTFEOHMrVnlKbnFBZ0p5bVFVZFNjcVpUK2xTQU1LeWg5NUt4NTVJ?=
 =?utf-8?B?NmNTNFdEbFhlRkhLMTlpemhIN2JURGhaVk1OaytXekEyUW1HdWh6M1RBdThH?=
 =?utf-8?B?dFl1TTk2SjZ0Q2lLcTVOMXFFQVd5UkhlVG1XdWdLd3QzTjBtNjJrNHlWT0Rp?=
 =?utf-8?Q?2gsgmtywg6t6DYi3UIcbao8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXdjdTdSSHdjM05RUW93eEV0U25Pbm5pa3VocnBFZVZGWElGckd6NnU1VWdQ?=
 =?utf-8?B?emNuSkdUZFpva2h1ZWtUNWV3TCthaTNhZ1dCQjZSbWhkQ2xmbjc2aXovVGVF?=
 =?utf-8?B?cEtTcDBBeVFDc2Z0NWhGYnYwSzJKbjQxdGRZZGFhMlIzVEhpTWZNZ2tob1M1?=
 =?utf-8?B?clAxTlNJelNYWnRwcWFxOTBqRVlqOS9qdWpyMXAvd2JUSDRIK2JZOU1PVWJC?=
 =?utf-8?B?Z2Q4dXgvVFB5REtHc3RiS1QzWXRyRGEyYTlvd3VzSTVRcXc2Zmc1SmswN3I2?=
 =?utf-8?B?UTFkQXFKcThFU1pMenFreWtMOXdWaHpVbXEvMHBod1J2Z1FSclpsMkxYdTFt?=
 =?utf-8?B?dW52NGRZMHpVVXZvUWx3M2tNZDY1VXN6K0RscWd1TEJvdnNmd29NSDN3TkV6?=
 =?utf-8?B?b2RZUDI1bTM0eEJnOEhqNWNVZVZTczJYTE90eXFIdC9iOXV1ZENJcTJKRTNR?=
 =?utf-8?B?TjVKam81L2ZSZDgwZmNuWUxPc2J6cm5SSDlheTBlaEJFeUR0SDR1NGZGWDZX?=
 =?utf-8?B?L2h3c0FkWVBtSW5xdm11UElSaE1FUnI1TmEvOWlTYWVvV1o4aTZwUlVoN040?=
 =?utf-8?B?c1VTNklSSkw5cTdaSFZCdi93S1Q1dkUxQ2IxckUrUXg1V2FrNkNnaWVMakpi?=
 =?utf-8?B?R01ObXYyN0V1WGVJZ05ISG9iUkFqcm9hVitGOWxLcW9RbmdscjRWa2pRcVJz?=
 =?utf-8?B?eFZkS0V1QVpObGE5MGR2WFpFdnlDdjV1RG9NbGZvNU1FaFVzS0ZHQ0pkNmk0?=
 =?utf-8?B?MXdlT3lpWVNZSWZTb0hyRDlnNWRnMTd5RHJoWmJ0OHBDeSt6UktnZWM1RHNh?=
 =?utf-8?B?VE80RDZRdXB1aThSZVRVQk44SWFTTHlrYlhPd2xzN3VYaFZPMFdEbGRFVUZz?=
 =?utf-8?B?bWFaa1N4dWxxY1dPWkFicVBLQzNocW9Fam1DcHRWcmVaeFdCb2sySVFpWmVy?=
 =?utf-8?B?cTR2WnJLbGoxQ1QyalA4K3RHS21CclU2azhGWUpVVWpyMnV3MGhURWJ6RDlT?=
 =?utf-8?B?bFNJdUpCZTlSUDF2c3BOM2pRTUd2cERjaWY5Yll5aXUvY2s5MlZOeVh3Q09y?=
 =?utf-8?B?bndIaUFtWXh0V1Q1YXlJdjh4aW5BUHh1dG1CTFRPS2VrM3JjUXRIdEcyWlRy?=
 =?utf-8?B?Yk54T3dpb2IyRlhvNUNCbCsvYmZvQVZqMG9GaGt4MmFEdkpnbDJCTExSbnBi?=
 =?utf-8?B?SGErNFRjNkFwR1RQM1ROcWRzUHpya2FhbXJVVzA0VVl1RjlTR0QvR1JpWktJ?=
 =?utf-8?B?SitSQmhkaWVFMGlDWUZWeUQ1cjJFMm9OdGljUGFrNHVUNUJ3MVU5Wm8vc3Rx?=
 =?utf-8?B?SWlabG1vTHJiZGY2ZDJzTXNPME1Pc05uSGh0Um12UkFlcU1wKzhBODJNMjhB?=
 =?utf-8?B?Tk9WNEdTSW11MW9reDRXbEFQWFhRb2x4aDE5bUhJZXFTaHp5OWV5MmIwOGk3?=
 =?utf-8?B?dnF6RFFJU2xFTG4zdTl5a3p1Z1RzbWUyVFI1SUNOVDcwd1g4c3JMeFp5VDBQ?=
 =?utf-8?B?L21KKzZzTlFLRFJrUUFSaGU0VWJWTXcyNm9aYkd3RnJSdUVjYUQ2aE5zOHBR?=
 =?utf-8?B?YmxOZE91bVhIL1owMjBvczNaVVhOdTh0R3pRN1Z1ZTRpdWUyZG9MNThDWHZX?=
 =?utf-8?B?bDd3UmErOXg0THo4SWRjc2pGMWp5eVdNck9Qc1lGYkpxdUxCbGhBL0tkV0Zj?=
 =?utf-8?B?QjlITHdYWUZadjA4aTExWTVMT3pBWlpMaU5ia24rVU9PZFdxYlF6ekV1T0pR?=
 =?utf-8?B?cDFHMzBGbEdLd2p1N1RoVDVMY2FGWXYxUEZXSGtRTk14TUFRY3ZxT0xONGhS?=
 =?utf-8?B?OVpYRkh2a1A0TEF0RCtkbkk3dkZhYkphL0ZSTXJSMkRndkhmbEFmcSsyMEtD?=
 =?utf-8?B?cEFwL0lxNmI4U2UrY1FtM1VtTEZsZ1QxSmdrSFk1VC9lNWFxcjZJai9ESXV6?=
 =?utf-8?B?dzJZSWlsUmlKZFI1dVFKeW85ODhlRGl5dmw0d3FBUWhBMHoyR3p3NGd1Nkc0?=
 =?utf-8?B?bGJwcFNtV3Q0QXJmbGc1V1dSM2tWaHI1M1ZiRXRZczVrbU94TnFzYW14K3ZD?=
 =?utf-8?B?c29ramxHWlM0M0FMWUhrKzBUTTRoQjZERkxHTnEvQWxqTk91c1l3TlRMc3JE?=
 =?utf-8?B?YUdnYzZWVWN4aU9sZnFEbjFLTXJBcThGMEdSTEk1TndwaUxXQ2cxM0UvTGVL?=
 =?utf-8?B?L3dLYzB0QW04TWMrTDM2T1M5SFRGN1czaVUwSGZYZHZ0MTdPRzdyNWNjb255?=
 =?utf-8?B?UVZ5d3lTYTQyVlRON2VlREdrMW5mT3ZaYzVmRzNDdVlzTkpNNWxrWEZwMUg5?=
 =?utf-8?B?TVlKc0xvdk9hTktIY0ltL0NNN1lCb1M1MFhIUmdMQWtVYThsZmdTQjMyT1ha?=
 =?utf-8?Q?73oX86iooh6hybzA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cbf446-cbbd-4c1c-569f-08de58d7bccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 10:27:54.1412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RyKz1UkbZJ4BK2YSE0Gs7NAxEfiO5/OCLDYDvZy3SQueoitZQgpALQEelNpotPo9+4oiRa8kftQCX/kl2om647tpBtjmGiDErYT65gLJ3dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17884
X-Spamd-Result: default: False [2.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27190-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 2497F5591B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDIxLCAyMDI2IDExOjI1IEFNDQo+IFRv
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBKb2huIE1hZGll
dSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+OyBDbGF1ZGl1IEJlem5lYQ0KPiA8Y2xh
dWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+OyBscGllcmFsaXNpQGtlcm5lbC5vcmc7DQo+
IGt3aWxjenluc2tpQGtlcm5lbC5vcmc7IG1hbmlAa2VybmVsLm9yZzsgZ2VlcnQrcmVuZXNhc0Bn
bGlkZXIuYmU7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOyBiaGVsZ2Fh
c0Bnb29nbGUuY29tOw0KPiBjb25vcitkdEBrZXJuZWwub3JnOyBtYWdudXMuZGFtbSA8bWFnbnVz
LmRhbW1AZ21haWwuY29tPjsgbGludXgtDQo+IHBjaUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJl
bmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGpvaG4ubWFkaWV1QGdtYWlsLmNvbQ0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDE2LzE2XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNDdl
NTctc21hcmM6IEVuYWJsZQ0KPiBQQ0llDQo+IA0KPiBPbiBXZWQsIDE0IEphbiAyMDI2IGF0IDE3
OjUwLCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4g
RnJvbTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
PiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4g
RnJvbTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gVGhlIFJaIFNtYXJjIENyYXJyaWVyLUlJIGJvYXJkIGhhcyBQQ0llIHNs
b3RzIG1vdW50ZWQgb24gaXQuDQo+ID4gPiA+ID4gRW5hYmxlIFBDSWUgc3VwcG9ydC4NCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54
YUBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9yZW5lc2FzL3JlbmVzYXMtc21hcmMyLmR0c2kNCj4gPiA+ID4gPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcmVuZXNhcy1zbWFyYzIuZHRzaQ0KPiA+ID4gPiA+IEBAIC05Niw2
ICs5NiwxMyBAQCAmaTJjMCB7DQo+ID4gPiA+ID4gICBjbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAw
PjsNCj4gPiA+ID4gPiAgfTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICsmcGNpZSB7DQo+ID4gPiA+
ID4gKyBkbWEtcmFuZ2VzID0gPDB4NDIwMDAwMDAgMCAweDQwMDAwMDAwIDAgMHg0MDAwMDAwMCAx
DQo+ID4gPiA+ID4gKzB4MDAwMDAwMDA+Ow0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGVudHJ5IHRv
IGJlIG9ubHkgaW4gU29DIGR0c2kgbGlrZSBSWi9HM1MuDQo+ID4gPiA+DQo+ID4gPiA+ID4gKyBw
aW5jdHJsLTAgPSA8JnBjaWVfcGlucz47DQo+ID4gPiA+ID4gKyBwaW5jdHJsLW5hbWVzID0gImRl
ZmF1bHQiOw0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgcGluY3RybCBlbnRyaWVzIHRvIGJlIG1vdmVk
IHRvIGJvYXJkIHNwZWNpZmljIGZpbGUgYXMgaXQgd2lsbA0KPiA+ID4gPiBiZSB1c2VkIGJ5IFJa
L0czUywgUlovRzNFIGFuZCBVcGNvbWluZyBTb0MgaW4gZnV0dXJlLg0KPiA+ID4NCj4gPiA+IFRv
IHN1bW1hcml6ZSwgeW91IHN1Z2dlc3QgbWUgdG8ga2VlcCBvbmx5IHRoZSBkbWEtcmFuZ2VzIHVw
ZGF0ZSBpbg0KPiA+ID4gdGhpcyBmaWxlIGFuZCBtb3ZlIHBpbmN0cmwgYXNzaWdubWVudCBpbnRv
IHI5YTA5ZzA0N2U1Ny1zbWFyYy5kdHMNCj4gcmlnaHQgPw0KPiA+DQo+ID4gSnVzdCAic3RhdHVz
IiBzaG91bGQgYmUgc3VmZmljaWVudC4gRHJvcCBkbWEtcmFuZ2VzIGFuZCBtb3ZlIHRoZSBwaW5j
dHJsDQo+IGVudHJpZXMgdG8gYm9hcmQgZHRzLg0KPiANCj4gQWdyZWVkLiBBZnRlciB0aGF0LCB0
aGUgZnV0dXJlIFJaL0czTCBEVEIgYnVpbGQgaXNzdWVzIHJlbGF0ZWQgdG8gUENJZSBhcmUNCj4g
Z29uZS4NCldpbGwgYmUgdXBkYXRlZCBpbiB2Mi4NCg0KUmVnYXJkcywNCkpvaG4NCg0KPiANCj4g
R3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0K
PiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=


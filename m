Return-Path: <linux-renesas-soc+bounces-12852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233EA2865B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 10:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C293A75C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 09:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8917622A1CA;
	Wed,  5 Feb 2025 09:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mEUxIGZ4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010050.outbound.protection.outlook.com [52.101.228.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB822205E3C;
	Wed,  5 Feb 2025 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747187; cv=fail; b=I31Pm2pi1QiP4UmSMLMgMEcYTkJwrjnJd1j+yVWpaIZ2/gUZSJGhLw+51zKABFH2ifL55skvZRSQvK3feS8VqJ1VY7xCwTRIH4fMZYIDFYSgbNGIXFNXaD12tIX8ns2bcqo8b7bq4USDLKsnTxI5PJdzvdVzmfoUEqzJkYPZ+as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747187; c=relaxed/simple;
	bh=Ergd6+kJKmF4FdAjWYNj3A6dtLmCmOkvYi2mwgQ0zXo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tP73T4xMR3BImDH+N/XgW/qfySo2z3L9p5+PfgWVJB9ma6bnbTQg+IdQ5Cl29zkLsWv/lpcYvN81F+WGASwbHNdRorXS9Ngm9EslnKBVEE0yl9HDCYCUVUJpefGJ7ni2Bk5diszy9X0PiB9TxBVPejQ2T8BtTz/0sOnh1BZrhOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mEUxIGZ4; arc=fail smtp.client-ip=52.101.228.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KF4XeYV606mV66F+zco73/5WIuOCNy24tndtGDo4atCe4j97nRpsV69/JjKjtc2HrCC4xNvBPPVfrX0jkRWra7aRpjP/PHyli8w1Lpkxkh+47yuudMQN5jShYeAaNiN1t9M6jIBPvYQpMTEhv8gU6K4qJTAqvg0OZqrgL07gOF0Ri7H8IGgH9F8VxSyLQF9S0Vl+CjhaHllfaC7aTN/Coi6ikUW8RPDlq4M81dtV0t+RRADfKSkTxUrtrClI0lg9TzKDtBoXD0VouW8pOOiiB4xZmGLC/dGC4ziFrVwp441VgiVeJ6qeEBf69rkzxNPkOp314RSOhxhexZwfq9a80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ergd6+kJKmF4FdAjWYNj3A6dtLmCmOkvYi2mwgQ0zXo=;
 b=gKYMVUF+0gepuO052gYp//1lyip3lOlTdLKeaKIQ8d46VqizTFr/PwMOoy7Gz1gFnCNPt85y2sxrkI7zaNP6ApKl85Wsck+XdFvIVm3Glri7wgacktdizveA4T9oykm0UYmGIiZIb+YSXqZfizUkZwXMh84RMvhnRQbCpuFo3wVXkFOBoPVL4sN6Xxkb2Yt6FPlC6ijMXkHFH9uPqU4g3vywbPh9ykPQOG5OWmLSYagyl0XThFb07EQVPUzI8z6sPgRSjtVBuB/+ZldkaQo2kC1ppt/VrKaffSn7MHLC+/8xN6fxE3NqoeYwGhUgM5IvvZAlCSOaibRnpLJYgrTLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ergd6+kJKmF4FdAjWYNj3A6dtLmCmOkvYi2mwgQ0zXo=;
 b=mEUxIGZ40R7hMV7VLFb2JSWz/+0Z2NeHXzhuX6w47a+gjMhMpZyCcWbEofegGHRTGJxD1VGZmXvgRiEPC66APBXhXsuqaxeLd3KDtahykX54ovioleEK/Bx7fZNF+qSAMK7TqLTlaLX5CIxUHK4PQIFjEUotOsv3FyKCjK+i29U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12348.jpnprd01.prod.outlook.com (2603:1096:405:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 09:19:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 09:19:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 4/8] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2
 nodes
Thread-Topic: [PATCH v2 4/8] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2
 nodes
Thread-Index: AQHbc9LGzXxVCK4Pn02eIse6cZFbkbM4ZPqAgAARZMA=
Date: Wed, 5 Feb 2025 09:19:40 +0000
Message-ID:
 <TY3PR01MB113461C01CD900DA03E2C628286F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <20250131112429.119882-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdVnEtoWU5_DTmN6WsftPb1pButHfCzpXEjK1w5OUKzsdQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVnEtoWU5_DTmN6WsftPb1pButHfCzpXEjK1w5OUKzsdQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12348:EE_
x-ms-office365-filtering-correlation-id: b300eadd-c34b-4d41-6d52-08dd45c6386b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cGVmZmpLeFhpTVM0V1Rra2sxb3M3ZmtReVYvL0hMc0hnOU5HSnUvb0RUdmYv?=
 =?utf-8?B?dTFUcEttK1gzMUFjWWxDOEhON3FjUHpxOU1OODk2MHMrazhRSFBDN1VyYU9M?=
 =?utf-8?B?RzNNbVNaR2JteTNiUk03U1o4Mzd2a0tuczRpMmpMRFloNkUvTUxra0dFMzdE?=
 =?utf-8?B?Y0hKZE5RSWt6UmlLb3lrMm1oNHEyWmR3b20zbHBuRlhBRjIwOEhIUE16djZK?=
 =?utf-8?B?YVZxckc5WUVtbUo5TXRMNmR0Q0R1bDlqeWJwSzhIUFNxUE1Uc3p2WTN2alkr?=
 =?utf-8?B?ZTR6NFptSllsQm5Ldkd4MEdCa1pHUTQ0V0FDcnh5Q3AyQWJvbEdhNEZ4dGti?=
 =?utf-8?B?M0R2cFUweUloZXlBc0VRdkxEdnMxRU5FZktTY0tFYnVzVldsVDE4TVBla3N4?=
 =?utf-8?B?RWhqMVo5aVFQcjRHT0FxdU0ybmpEZlJsMEVyMW50d0tZMFphQjdOdHB0Vkk3?=
 =?utf-8?B?RUNPUWlNZjUwY1ZSTk02LzJMdnJNZHgzTld2YnBSVjZEdW4vOEI5UXRWdWZx?=
 =?utf-8?B?THJEWTRFa2RZT3A0RUUwV1ZZcWx3MVZtK3hzUWt6T0dXV2lUVWVKcmJua2hi?=
 =?utf-8?B?QlArZGR1TmtqZUZOY1NzL0UvRFZUekdHZHk5OHgva25rREFBbjVBTFd0Q1dP?=
 =?utf-8?B?aFJRQUg0V2t1ZEhNUzFDdVZGL1hrZU1wTmpyeG1qR0E3NFY1NExxamhxMjlB?=
 =?utf-8?B?ZXVhZEZZT1JranVRbmFjbk9kNkdLbXlydTBaMWc1dWZER2dlU1JGU3BTWG14?=
 =?utf-8?B?VC8ycHNoa0Y2VDQ5R084Wkw0TjQ0NVhpUVlaUG9haGJmL3Z6NDFQeCs2YlBn?=
 =?utf-8?B?WVlpUU91bmVUeGJVRHNQYlhuam84UmtHWksyUjJKTHJCZWpnZ1JVRUdlajAr?=
 =?utf-8?B?RmNwa3R4cWlUUjlBWmVPaHpTOXlZYkt6TTJ2RkxIL2R2RDdCckZQS3VtVEJw?=
 =?utf-8?B?L3ZFUDl2Tk16NVo1Y2ozbDlJb3hGTnNKdnN2b2NSUG92UE5WWEhiU0VMSVlT?=
 =?utf-8?B?UktaMFJlNFEybUROMFBQUzcxMEFLSU1EdDVtaE01RVRKUG1FanY4RnhPRktC?=
 =?utf-8?B?VWJVR29wQ1VTWUJ2cEpVcWJVaUo0bXdOZHNLMStYZGZoalViWW1DT0ROajdt?=
 =?utf-8?B?cTFDMjVIaWE1Vzg4TFdMY1JQUndLQVJDRGRibVcyWDJlVXBwc1AxQzJhUnhu?=
 =?utf-8?B?clI4L3BUQVJwM0tQcmxKKzEzTjlGVzJ5TnhLbDc2VFA2c0xLS0xBUmRGZ2VK?=
 =?utf-8?B?ZmdXQUVPV1BIR3ZaeWFuN3dxUGFzSmF5SVNSOUpqNlZFM3o2cXVJb25HZGxM?=
 =?utf-8?B?MlorM3Y3YW5uMDExYmJJcS8zWlo0N3c5UStiN04vbFA5Sk9wMGFtQzNtSnZN?=
 =?utf-8?B?NDloMEpHeVRrUkttR0JNNm01ZEI4QmpJcnZSUnNEd1BMOEpqajJPZDU0SzZs?=
 =?utf-8?B?QVkyREJmanYxVFlFelViYTBLVktkNmRrWnM0UldIRTQ1aXduZk9GOWF1Z0Iw?=
 =?utf-8?B?d01hSFAxeUo3L2lTQTFZNFlsLzNwSjRLRC9wUXFNdWFCTlp6Rmpsa3BBYUdR?=
 =?utf-8?B?YVlkWW1KZ3J4bGUrYmptek0zS1IvSnViVGkzbTE1SUx6cWhNTDkxZTNXQStW?=
 =?utf-8?B?YTJmQWJMY3lZVHpEWG01NXNpUFI2MTVjTDJGVlcwNnNwRGtqUFJBRlZnM21K?=
 =?utf-8?B?UTRFdXloT1ltVStkU1I4TXMrZ0V5Y0ZpUDlpYjE2YVN4UTc5NW11cThhZzVM?=
 =?utf-8?B?akFldlRLdDlsRWVmQ3lTWVNiOVRMK2VBQktMemtnYXgxUG5IRVdXWEdSZWor?=
 =?utf-8?B?WmM1K0tVTVNhbkJsKyt3R0c4dVpBenVzMzNvNEs2ay9CaU8vczBnUCtTdlBD?=
 =?utf-8?B?OE9DMUJsTkRMRDZ4WXAvRHRkLzIyS3BadzY3RVM0ZVFEOHJ2RTN5ODNuVi9u?=
 =?utf-8?Q?OwqMb4sOSWCL7WlcN5DU4yZF3j4D1kwx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anZtSWJmdVBLMU9aUXRvaU1ybUZmUFBhNitQMG4wUnRwMzBUaE9mUnRmeTlM?=
 =?utf-8?B?OGJ1a3ZyTWJrRkVKcjU4Z1N4c1NaZFFZSWdLQVdjcVN2OHhDQXYrd1JhYW1F?=
 =?utf-8?B?S0JBT1YxZjdFbFBCVzdjUU5kS1lhTzUvMDZrZmtzSXFJcUxRWnpWTndRRHhX?=
 =?utf-8?B?ekNsNFlBM0NrdUM3QzBIVTgzRlRJL2NvZE92ekhjNlp2QklQWU1SbjBjNnZs?=
 =?utf-8?B?SHJNaVc5Z2F6bEdtK2x2dVdpWDBNNVR4WU9nczNEZzQyZHB0YnU5aWlZaERo?=
 =?utf-8?B?MzlJRG9KNW1QR1gyMmN5RXVpUEpzUG41VWJKRGxZOUY5OGxQZWcyays1MjRS?=
 =?utf-8?B?S2svVFZqZ0h5VWFBNHZKRjV2RC84T2U1emd2bnhXMkFwQmI4eXFWZ1ZiK2dD?=
 =?utf-8?B?aGp4ZG5zNVRsR3R3b05nUWxhOUFjM2UxS24zNEZtZVBJejhUQ095OFA4bTVn?=
 =?utf-8?B?WFhnRngyN3NpeHB1alEvUmhEdU1ud0p6cy9KOThsbERCQW82U3Z5c0J5S3Ew?=
 =?utf-8?B?clBtZGZJcVBvSlI1N2xhU0wzV01CbWpyblhBMHFqeXY3aUdWeWo3MDJkbll0?=
 =?utf-8?B?UlZlNjhQcTBLRUZtVDFwNnJGTzBhblF4K3ZkcmNpbC9IN2hkNEhUVEM3Nmdk?=
 =?utf-8?B?VEZzcWo3WmY3YUQ5cC9kOHNmZEFZWFp5akwxUlM5aGppVEVQMDRIdTdWQ2lE?=
 =?utf-8?B?T0sxZXk2NXVxazdGYUJUOHVYN0V4UjJCcWRNaHBDVTNLY2hScm1HcWNaUjFk?=
 =?utf-8?B?cHBuOXlQTENxem5vUjBXWThOOURGb1F6NDZKenRxQTR1dFQ5K0tvK1ZoZmhH?=
 =?utf-8?B?Y2dOR0QyZHRWSWNxT3Y3Wi9nTkZwQUQ4enM5Yzg0NExyR1RYQlpvM2J0eGJM?=
 =?utf-8?B?WlA0VEQ5ZGRPMmgxTHE0cVkwUzZWMW9laFdZRXpvSlg4V0NaYjNIelBpVnc4?=
 =?utf-8?B?c1ZhNjMybElzNUp0bXk1aEN6dGpQN1hIS3N4cGJOMUw5cm5CR3lGL1RUUFRu?=
 =?utf-8?B?RkdYVk14T2l5NDFTeFB4WnVhYXVPZ1lQQVdXMnIvNFVyc29tUStYbGJkcEMz?=
 =?utf-8?B?ZTBMSzhDZFpQaGVBZkc5R1RiR3RJKzloVUx4QWREWUcxc2d5WXdMaU5TUGRX?=
 =?utf-8?B?WUZUSUtKdnZRSzlBeG5udFNGWnpLY1dKVy9DSjMyQ1pGemVSaUtTckN3K1Fm?=
 =?utf-8?B?MStUcmFyYkZ1MHArNmZObjQzaWNlTGs1M2hibzdHbGRocGdYeDEyd0ZKUzUv?=
 =?utf-8?B?UUpldFl5UTlRYVVIaTJ2M2RzNG5ybGJFQnZPakszYTBuUHRZeVl2Rm44SVpV?=
 =?utf-8?B?aDFjV01EWmlad1FDbUZScHVkVWRVdGx4N3p5YlNaeDY3dmMvTEF4ODF2M3da?=
 =?utf-8?B?STFOcDRSNGNTTXVjUVM0ZVhDSTlOc0dpcGNvd05WYUpIUCtFMU1pSzFhRU5Z?=
 =?utf-8?B?dnRJbU8zK2t1R2FtMUJwbkhGZ0F5OTNsQWtaR1JrTUh5akQ2NHBQSEc4OUc1?=
 =?utf-8?B?VWRoQzlNOXBLaTdMMjAvaUZUNkQra3FJMFRvc2pMUUdOZjdxeGNmQjd5YUV2?=
 =?utf-8?B?dG9LMkgzbmVRY1BwYjEvbnJ3YXR0akRiNEg2cGdyTk1TMS9tQjFaSnhjUzd6?=
 =?utf-8?B?KzdsVlVhK0pibGhUZC9JNzBzallEMHR0aUR1VFdoT3g0ME1yUTU1dHZ2a2tH?=
 =?utf-8?B?eUxjUlAreEZFK1RNTlZUR01uN1FwMGgyUHYvbmVKNWlNMHNCYnM4bHZLUjFs?=
 =?utf-8?B?dlM1c0lLY1hOYVJSNG9PWCtQcTBhVGNkVWxvcHQ1c25VbzlRQTVYMk0zN2Rz?=
 =?utf-8?B?MWdsdTZ5YlQrOWpOZG1rS2NvaUZ0dTI1NlFiWno3MkJTV0V4TVhrOU9oWkFv?=
 =?utf-8?B?WEJiSTdrR29aYVpSYUw4aXBTY0ZudkNrMDlJYUhJd3N2aDFjYUNKUGgzY090?=
 =?utf-8?B?OW00ajRQWVlRUHAvUXVCdzhnNHN2TFBlK3pjbU5uRCtqQWc1eEljQ09vc1BK?=
 =?utf-8?B?RTdscnJNUWJnaWxQaStSWUV3OXN5M3F0THJpa3ZrRmhYTEF0R2MzaENwdUov?=
 =?utf-8?B?QzlocThPOThuQWE3cmpIdnA5QjFnZER1Z0k5MlgzRi9ObjFMdVEvbXNpUFlt?=
 =?utf-8?B?alF0enVHd3Z3dkVMQ3pYcy9NdytoM2NPamw2NlQ0Y3JuQi9maDRuTUpBYjd1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b300eadd-c34b-4d41-6d52-08dd45c6386b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 09:19:40.8290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /iR+2W0R4LAfV4E1pupktYonfqFmYojHUdfN6EPOilDm/W4xDk5bumcFCmiGDa2aZ0s5l5vk52p6z+hs2nD30E+XPaew6BEiR1UbBJarTDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12348

SGkgR2VlcnQgVXl0dGVyaG9ldmVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IFNlbnQ6
IDA1IEZlYnJ1YXJ5IDIwMjUgMDg6MTcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzhdIGFy
bTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA0NzogQWRkIFNESEkwLVNESEkyIG5vZGVzDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCAzMSBKYW4gMjAyNSBhdCAxMjoyNSwgQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgU0RISTAtU0RISTIg
bm9kZXMgdG8gUlovRzNFICgiUjlBMDlHMDQ3IikgU29DIERUU0kuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+
ID4gdjEtPnYyOg0KPiA+ICAqIFN0YXR1cyBvZiBpbnRlcm5hbCByZWd1bGF0b3IgaXMgZGlzYWJs
ZWQgaW4gdGhlIFNvQyAuZHRzaS4gT3ZlcnJpZGUNCj4gPiAgICB0aGUgc3RhdHVzIGluIHRoZSBi
b2FyZCBEVFMgd2hlbiBuZWVkZWQuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0K
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNDcuZHRzaQ0KPiA+
ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNDcuZHRzaQ0KPiA+IEBA
IC00MTAsNiArNDEwLDY2IEBAIGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTQ5MDAwMDAgew0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1BQSSA5IElSUV9UWVBFX0xF
VkVMX0xPVz47DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAg
ICAgICBzZGhpMDogbW1jQDE1YzAwMDAwICB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLHNkaGktcjlhMDlnMDQ3IiwgInJlbmVzYXMsc2RoaS1yOWEw
OWcwNTciOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgxNWMwMDAw
MCAwIDB4MTAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8
R0lDX1NQSSA3MzUgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDczNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIDB4YTM+LCA8
JmNwZyBDUEdfTU9EIDB4YTU+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwmY3BnIENQR19NT0QgMHhhND4sIDwmY3BnIENQR19NT0QgMHhhNj47DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSIsICJjbGtoIiwgImNkIiwgImFjbGsi
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmY3BnIDB4YTc+Ow0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JmNwZz47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgdnFtbWNfc2RoaTA6IHZxbW1jLXJlZ3VsYXRvciB7DQo+IA0K
PiBzZGhpMF92cW1tYz8gKHNhbWUgZm9yIHRoZSBvdGhlcnMpDQoNCkl0IGlzIG9rIHRvIG1lLg0K
DQpDaGVlcnMsDQpCaWp1DQo=


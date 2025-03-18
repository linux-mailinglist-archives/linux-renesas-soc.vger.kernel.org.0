Return-Path: <linux-renesas-soc+bounces-14588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C55A673ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 13:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 655523BCE3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 12:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7167D20B7F3;
	Tue, 18 Mar 2025 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OcQB5ZUx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9702576;
	Tue, 18 Mar 2025 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742301123; cv=fail; b=pO1/jdRaFa1bHvovEbVVM9Pi/j4zMJncwTB54RfDDWIZzHQAQVxSIXeihMQLiZuLCbVIbWQ7kOasIrJRN2DBrSrcXYk7WdzsjfuMiWgr4HN/s8dIPu1F2KyKa+DSMF/2zHc6utGl4D8nS18YKj03j5C6R8vlFZZcMc/O5HRTjOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742301123; c=relaxed/simple;
	bh=7gCdOMj5BAVxY7y+doW8Yvw+UDqW4c1jFa+XdIADbjA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XlbwZmoI1d2GiMtlTLFC+QwtPAbgjrHFjGD7RfeG9HVz6hzu5WPJBBD4t1WjAJds+VVQ1sXb6CJMCAkBY6D8WTQ7XsSC+UMr6eVGzIlVzUyGUYbt6YUljtLyhf4oN1Uhj7tT8t8xIrOPlvFAjlogTZbWBXFLaNvC7h+gEXFtJi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OcQB5ZUx; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd0ZwCIoaRiHMtOJZ5duu5iplzaItxzjW1mRE2b3fFRG8n4VKOf/QA84tf4oy68AvjpkNoAqDZEFfnzLbUQnf+jf1RyW9CGsgpdWL66yXSC4z4mkCklDLtyWFvCrjr6A/uyCGZ0VwTOEO5eB+rGiGHQpsPqP2zYmqu9jBvBENFqmTyClqmBAlNNp13Blt7rc8iNH9Xjm+hphZtJ4Xij3fxgsJnFYK74Vvm4je64QfFGBbbg5OjSJCaTBkQujbHa159zkW4EnY7FNtwXLAnubsBQFlNSWbiAWO9qzr6Mom7XkRdH2uGUFTfOQ8zDwFkvRxRBiNklHqMZTDSxmd90J8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gCdOMj5BAVxY7y+doW8Yvw+UDqW4c1jFa+XdIADbjA=;
 b=MNDKs+HR2qU4+Zw/IfQLLCzHav+j430zZp5f2isG7+Rgp8n04I9R3ndrHKIcmjiv5xMYUGVdJNJ19K+rsFVJ9tvpU5N1wx158lNxZuqPxsgUz2U7AeAX20URhodqthrsyKvg5NzccbFZReUY3VMJgCtoZR4jsIU+E7D/VbDGyBE//vX4TDeRwzKK9yXb7WkNWx/0bkn+HujPsAqLYvCdA930VOd26Io10JAOoL57cES3K9mZb2h2DTN4Zh78+xfBzT+hDSN8b+1Pw443eO1XqMrl11qL+XUCUviIP9pnfrHw73UhqFkpJvu6PSv5PcRTNZZwwg3LLXA4haHIHc15Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gCdOMj5BAVxY7y+doW8Yvw+UDqW4c1jFa+XdIADbjA=;
 b=OcQB5ZUxnitLSnuuTFoMqJqJtL6Wvk/sEuLQzED35k6U0YvG/i2/YzRdv6eR5fRP3Q9NEGzAN8ZoD3yJYLj0pUDbQ7Fqa9Rf+832XnrWhNh2cjq5r+APvlIc50J9NOUMynl9aX/Ft8uKAhTvRc3Wl5lgDWO4QfS43QCJ3d4x99s=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS3PR01MB9481.jpnprd01.prod.outlook.com (2603:1096:604:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Tue, 18 Mar
 2025 12:31:52 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 12:31:52 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Prabhakar
	<prabhakar.csengg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Chris Paterson
	<Chris.Paterson2@renesas.com>
Subject: RE: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas
 RZ/V2H(P)
Thread-Topic: [PATCH v2 2/2] reset: Add USB2PHY control driver for Renesas
 RZ/V2H(P)
Thread-Index: AQHbjcumAKkaq95VEEiIxX0Tw+LMrrNwypcAgAAaTMCAADDqgIAHvOcQ
Date: Tue, 18 Mar 2025 12:31:52 +0000
Message-ID:
 <TYCPR01MB12093DB963348A8FD58409E5AC2DE2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20250305123915.341589-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <30b6841b3ce199488698ab272f103a0364adb000.camel@pengutronix.de>
	 <TY3PR01MB12089B78E1DE163B740A51134C2D32@TY3PR01MB12089.jpnprd01.prod.outlook.com>
 <c27ab4ca4563d20a73ffc8a577f960fe59ffa88f.camel@pengutronix.de>
In-Reply-To: <c27ab4ca4563d20a73ffc8a577f960fe59ffa88f.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS3PR01MB9481:EE_
x-ms-office365-filtering-correlation-id: 00afb083-ab7c-4378-115b-08dd6618dcd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1U0ZUxOQ1RQejhoOWVES1lJSnJtc3l3YUJ2WGc3N2R1K1pBNmVYZ011SVJW?=
 =?utf-8?B?eCswZUVpQndLdmhUM0MrTDlnYkxTRVM1MUVscnRHa084enlZOERkS2ZFdEk4?=
 =?utf-8?B?Z3I5dUVyVGJmaVFBblBwRUFDZWFHaW1sOFROemwwaHlZWE9OREtGdEFVS0gz?=
 =?utf-8?B?NFIyME1YQnB5UXJPbjVmTng1RkR4TFJrTTl0S3AveDBPY2t5amEzMkFsMENi?=
 =?utf-8?B?RlVDekQ3QjZ0NjB3bU5tTDY5bHdNbXovTmY3ODdjd2hnRmxKU3NLb1E3WEhM?=
 =?utf-8?B?RDZ5bS92MzB6SXVwaEtGY3RLeFMvQ3VIR0ZYd2o1R3JJZXNYTlk5MVZwREN4?=
 =?utf-8?B?dVNET2F6QVgwaVF3NllzZUZzWXNmakV2K282ZU9zMU5vK1BMRzJWSDVqMGNI?=
 =?utf-8?B?dyt6Z2lVbEJVQ3Z0WWZscjcvTWNhM2h6TXliY0VGRGJCcEw2cTRNYlkxeHRy?=
 =?utf-8?B?cW5Cdm8wdzJPU21kWHpUOXQvQmVwdEl5R2Y5REdHMGlXL3F6TU82Y1pNSnNX?=
 =?utf-8?B?Q0tDeVY0aU83emFBaE5tVGtjd3FVelJxaXk1b0xjVWx3MTRSWVdvUmpUYXA2?=
 =?utf-8?B?Tm5OOEN5dEJIOWFGVElGQmxGZm82amF2Zm9HTnFyeDNEZjEwSG51WXFlek9v?=
 =?utf-8?B?Q2VkNmxueGY4MThnREVNL2FXbDk0emxXZUNjbUNmRE5aM2JOWXhjUGxnT2JR?=
 =?utf-8?B?dkZMNzFLNzVLdm54QUxFOTI4WEFzdGVyNGpzQzlEOEI5VWlEZ1VQYWU4cnZw?=
 =?utf-8?B?b08xaW5wdGRPczhhWGtlVHZIRzFGemtyK2wweTZkdGg0T2ZxNEI4SnZiVXZq?=
 =?utf-8?B?ZENYRmVpREtVa3pHeC9ackJuRXN3TEFpanRoa1ZrK1huQng4WThOczBET2Iz?=
 =?utf-8?B?TzhybjFiQS90U29hZ0FCZ0xrMi9OTEppS21VcmZVSjhaS0NBOVlySlNEanla?=
 =?utf-8?B?UWdtVmp5S0FKa2hNMWxSV3hEYmYydWNTRmxlbm1XN3puWmplWGx2SmdVR21B?=
 =?utf-8?B?YlN2T1VuYXU4d1lxNm1SMkhyQ0dqUnluNVU4UkV2SjRpU0pnOGk2emNrenc1?=
 =?utf-8?B?TU0wUWFCZjJFNG0zQUpHazAyT1A0c0N2Wm5TSnJDRURXbVVzWWpSU29tUGxM?=
 =?utf-8?B?QWpJQ1k3L3IrT3Y5cTJYbU5JdlppS1VIV3VaNWFnaHdQQk1WQllTeFNGSEov?=
 =?utf-8?B?djdod2ZkMkJzbzhnMjl4Q2l4dTNhTTlxSnlUc0pURjlZcmd3QlgrdjlFNmJ0?=
 =?utf-8?B?b3MzRHNsL2VqM0s1UTlPcFpaUUdsNS9RckJjOWtWWTZhWStCUU1yZGd4Vnhz?=
 =?utf-8?B?WlJQUkpqeGYrNFF1VkRkN2hMRVB2SkdIMExLbDNoQ1p0TVNKZ2doMlFpTnpw?=
 =?utf-8?B?UDFrSjBXbm9rcFpPaG5kWitJMTJMbFBIRndET3RpMGIrUVR2NU44a3lyVVRz?=
 =?utf-8?B?N1g4ZW4vWmlTTTFHdHNIUnJ5bWludEs3ZDVnS044ZFhweGtJZTBFT1grS3VD?=
 =?utf-8?B?VVBHaU4rOTNmRVpzRDFyN1pydm5QNkRBZ1JPZDNKUlJuTDZ6V3RCRmM1VEZx?=
 =?utf-8?B?cGdYeHd2ejRzN21yUm9jelg4RmtRcVpZYy9KN1hYbjcyNGZhUUNJbkFrSDdE?=
 =?utf-8?B?c0tCVnpHWk8yMzNabXFLY2dFTXRvbWVPYVdxSlNJdklxSVpPU053TTU3aUp5?=
 =?utf-8?B?b0dMbng4NjJkcEpsQlAvQTI1QWN2djdYWm5KaGhTbnJIV2wvMFIweHRrZlIy?=
 =?utf-8?B?RElFdzMxbFczOXBTYkRab1d1YWk3WGtxKzk3c1h4UXNmQWRqcXhRMGNHVFV5?=
 =?utf-8?B?blV1bXdiQmhkZEF6dFhGZDhrN3R3T0JPNHVWVDJveExyaHEvSUgyd0lkT0FG?=
 =?utf-8?B?MUJMc1pwMG5EMjJMNFZTdkFyUEJ0RDUvL0FSdE5aV29FMThQZHZKejQzbDR0?=
 =?utf-8?Q?215rXHNQtc0lGtxEes444OsrJVXd1FtB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlhFT1ZZM0RiZmZTVnFkMXhSOGxHekZpaWZiM2hZV2NSZUJKQldwQkVoNGdn?=
 =?utf-8?B?TDFHbHBFZHFUT0F1b25XazkzSFpCSjJkUTgvejgwdUhWSytOcE53ZnZDeGZG?=
 =?utf-8?B?QzhXQ3hWbjVNOFVhTENsUU8xaVhrZ0pDS0N5WEdodk4xM1lHZzJ5VWVRMFdD?=
 =?utf-8?B?ZS9KclhrckRldFRSWHlxYmU5OUIrSGdOUDBCUlJSVDgwOW9Yc1Radll0QmJm?=
 =?utf-8?B?OEZHYXlUcEJzQmMvbE1rOXRRbm1rWTRBdFFtN2k2QXpyYXJzaXF5cS9heHdr?=
 =?utf-8?B?ODVRTzB5N1dpRTUxbTAwUHdZNU41MHNiSHVjSW1NYXpnVVRYVUUxOXhnZXFk?=
 =?utf-8?B?bnJZUHVJVzFBbnJUVGdTYWtKSjdvUXFtOVBwdEpIZFNodGxDR3d6aS90N1pP?=
 =?utf-8?B?RG9WV3ExcjJSK0hPbmlBbmZaZ0wra3ZITzljVWlVRkM4UURjd2Z0aHZNV1FD?=
 =?utf-8?B?WGZ3VUtwSEZWUEdDcFVwaWZNaWtlczY5Y0RCcnpBc3p3L2pRSURKcmRTbmRk?=
 =?utf-8?B?UFRYL0p4amdiQ1BXclZtRGF5emF3NFo4SWlpZ0dUTkxHSmpJcWpOUGVBVG83?=
 =?utf-8?B?THMyS2Q3blc5Nm8weWZBTGJjM212dE1YeEtZd1FJZUZqN2xoVUxjbGxiWFpY?=
 =?utf-8?B?cTFDU2kydTNaTGUvTEd2NFBwOW00ZGhPamZCZVU0dTVoOGtwZzVqL3VwbGpk?=
 =?utf-8?B?WktrNzVTamJDVDd4SmtIV2VTR0tjVkt3VjB3eUU3aU5iZXpUMEZQaWdWeVla?=
 =?utf-8?B?UFZhMUoycnU2QzR6TVVPMFB1eEh6WmJiZldXRDFVem4yQnN6Y0xBc0t3OVBC?=
 =?utf-8?B?Sm1MQm50ek8rd2REUEFZb1hFY1dVUCtzV291cGZ2NWNPclhQQytsQWVlOGxY?=
 =?utf-8?B?L2Y5SGhHU2dFQWRPT0J2cTY1bUVhemdGblVXMG9IcmxRbzBSK3VOSFdXbElv?=
 =?utf-8?B?WG5ZV2g4cVE2VTI4eXZIamw4SkVIZEYwdlE3OWphNFU3WU1VVnNCL0c0M0Nh?=
 =?utf-8?B?b1JGbDEyby9IVXBIRTZ2MG8xUjhwRFdrVmJMellDNVdvSVNBNFFkd096ajdY?=
 =?utf-8?B?KzdrcUNuQTdBMG0zQ0hzK0xOTDRQSTdnZkJjbWwzdlAyQU03QXY1NXRnMHN2?=
 =?utf-8?B?enpYNWRXU2dtU3ZvdEUwQzB4UG1TQTZ1Y01KdXJ3bkdqUElFcDlwa1l4QzNM?=
 =?utf-8?B?WUkybEQ1MlhEK2NBS1RKVDZkQlRqUXB2OThyeG9CWVBXa3VOSUwrWWZ0K01B?=
 =?utf-8?B?TEk3a3NrM2R6d3Y1ZmNjK2ZpNjdUOUduamZVaHBtTWR6cDYwYXlMRzNmTGNS?=
 =?utf-8?B?cTZnejk4Y2pwZndURk52a1o1NHVLMENwdXlvb3d5Y0twdnZFSStaU3Q5QVdV?=
 =?utf-8?B?SExOUVpqSytQbzYwWE84QnVjbXZZSGgwNnQvZ2lpWHpCRXRMN1AvRUh1Q0Vl?=
 =?utf-8?B?UVREYWRtL1d3ZXY3aFFtYmhTZWxYeUpDenBMUGxidDErSHlzZ2p1MEdVUzBN?=
 =?utf-8?B?K1U0QzV0RGQ2VFI0TzdTSkZPbVBvZUJ0bVZMU1pUQ3ZnTmJTMENYVXdEakdp?=
 =?utf-8?B?QWJ3SFg2RlNsbU5GczVWTEZRWXhPMXBoNndpREowQzZPSC9yZkJtWEZsT0x6?=
 =?utf-8?B?bkJHLy95YjZtSFVBZEpFQTJmRTl4UHAzK3hvMnRGUWwrWThBNkk2VGZRTjJT?=
 =?utf-8?B?cHowWitHUDAxdWZZbEEzU2JFb1ozNGlMTU00NjRVa3RxRGYzOHNuWnR6VnUy?=
 =?utf-8?B?QmNlQ2lZSjAvOWhqdzNGYWZxRERNZWJVWW91UVlKMi9hTFF3RFE3bUNFbDM5?=
 =?utf-8?B?cXNLcEZ6RXZCZ2U0WmhFZE1KOWErNkhhNlc1dEZWbE9LenF4dXVKVVZmWS9j?=
 =?utf-8?B?L2pXSnd2c0lqS0M5Q1didXV2UERMM2dtZlpING9PbzZqWUNYOGJmcFZNeTV4?=
 =?utf-8?B?NDVaZVBUZFg3Y0JScEtXeE9UMmdaN0thM25wTWNOUzgxWFQrbDlVSFRDOVd6?=
 =?utf-8?B?TFVCejM0ZW9DVWNmQ3ROUFQwMnFGQ3VYTFZVOFdmSEJ0WGdvOU9oaGFEbW01?=
 =?utf-8?B?ZkR4c3NxUEtiUlFvSXcxSnVJS3d3NEtGaWRsdCs0WkpWaGIvU0JaeW9ERm03?=
 =?utf-8?B?MWZRZmQrM2luWGNqM25wd0pOREk3SnppWGxpT1FkV1lkSzJGMVlRN1Q3UnIr?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00afb083-ab7c-4378-115b-08dd6618dcd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 12:31:52.6268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WCdgPcbMt3kKxvs8dTLtOJJvT6ITO3qZDhyYLt9xpcegTqNTVQeOjf44gTAHzXibKRYNDkiCiHIo96IfP0lGa+f7iOb/izlty1jqlwjnQLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9481

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIQ0KDQo+IEZyb206IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+IFNlbnQ6IDEzIE1hcmNoIDIwMjUg
MTM6MDYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIHJlc2V0OiBBZGQgVVNCMlBIWSBj
b250cm9sIGRyaXZlciBmb3IgUmVuZXNhcyBSWi9WMkgoUCkNCj4gDQo+IEhpIEZhYnJpemlvLA0K
PiANCj4gT24gRG8sIDIwMjUtMDMtMTMgYXQgMTA6MTQgKzAwMDAsIEZhYnJpemlvIENhc3RybyB3
cm90ZToNCj4gPiBIaSBQaGlsaXBwLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNr
IQ0KPiA+DQo+ID4gPiBGcm9tOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
Pg0KPiA+ID4gU2VudDogMTMgTWFyY2ggMjAyNSAwODozNw0KPiA+ID4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAyLzJdIHJlc2V0OiBBZGQgVVNCMlBIWSBjb250cm9sIGRyaXZlciBmb3IgUmVuZXNh
cyBSWi9WMkgoUCkNCj4gPiA+DQo+ID4gPiBPbiBNaSwgMjAyNS0wMy0wNSBhdCAxMjozOSArMDAw
MCwgUHJhYmhha2FyIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IEFkZCBz
dXBwb3J0IGZvciB0aGUgVVNCMlBIWSBjb250cm9sIGRyaXZlciBvbiB0aGUgUmVuZXNhcyBSWi9W
MkgoUCkgU29DLg0KPiA+ID4gPiBNYWtlIHRoZSBkcml2ZXIgaGFuZGxlIHJlc2V0IGFuZCBwb3dl
ci1kb3duIG9wZXJhdGlvbnMgZm9yIHRoZSBVU0IyUEhZLg0KPiA+ID4gPg0KPiA+ID4gPiBQYXNz
IE9GIGRhdGEgdG8gc3VwcG9ydCBmdXR1cmUgU29DcyB3aXRoIHNpbWlsYXIgVVNCMlBIWSBoYXJk
d2FyZSBidXQNCj4gPiA+ID4gZGlmZmVyZW50IHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb25zLiBEZWZp
bmUgZGV2aWNlLXNwZWNpZmljIGluaXRpYWxpemF0aW9uDQo+ID4gPiA+IHZhbHVlcyBhbmQgY29u
dHJvbCByZWdpc3RlciBzZXR0aW5ncyBpbiBPRiBkYXRhIHRvIGVuc3VyZSBmbGV4aWJpbGl0eQ0K
PiA+ID4gPiBmb3IgdXBjb21pbmcgU29Dcy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
Pg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZlcnMvcmVzZXQvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgfCAgIDcgKw0KPiA+ID4gPiAgZHJpdmVycy9yZXNldC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICB8ICAgMSArDQo+ID4gPiA+ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXJ6djJoLXVz
YjJwaHktY3RybC5jIHwgMjIzICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAzIGZp
bGVzIGNoYW5nZWQsIDIzMSBpbnNlcnRpb25zKCspDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9yZXNldC9yZXNldC1yenYyaC11c2IycGh5LWN0cmwuYw0KPiA+ID4gPg0KPiBb
Li4uXQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9yZXNldC1yenYyaC11c2Iy
cGh5LWN0cmwuYyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtcnp2MmgtdXNiMnBoeS1jdHJsLmMNCj4g
PiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5h
NmRhZWFmMzdlMWMNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9kcml2ZXJz
L3Jlc2V0L3Jlc2V0LXJ6djJoLXVzYjJwaHktY3RybC5jDQo+ID4gPiA+IEBAIC0wLDAgKzEsMjIz
IEBADQo+IFsuLi5dDQo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6djJoX3VzYjJwaHlf
cmVndmFsIHJ6djJoX2luaXRfdmFsc1tdID0gew0KPiA+ID4gPiArCXsgLnJlZyA9IDB4YzEwLCAu
dmFsID0gMHg2N2MgfSwNCj4gPiA+ID4gKwl7IC5yZWcgPSAweGMxNCwgLnZhbCA9IDB4MWYgfSwN
Cj4gPiA+ID4gKwl7IC5yZWcgPSAweDYwMCwgLnZhbCA9IDB4OTA5IH0sDQo+ID4gPg0KPiA+ID4g
V2hhdCBhcmUgdGhlc2UgcmVnaXN0ZXJzIGFuZCB3aGF0IGFyZSB0aG9zZSB2YWx1ZXMgZG9pbmc/
DQo+ID4NCj4gPiBVbmZvcnR1bmF0ZWx5LCB0aGVyZSBhcmUgc29tZSBsaWNlbnNpbmcgcmVzdHJp
Y3Rpb25zIG9uIHRoaXMgSVAsIHRoaXMgaXMNCj4gPiB0aGUgYmVzdCB0aGF0IHdlIGNhbiBkbywg
YXMgcGVyIHRoZSBsaWNlbnNlIGFncmVlbWVudC4NCj4gDQo+IEhvdyBhbSBJIGV4cGVjdGVkIHRv
IHJldmlldyB0aGlzPw0KPiANCj4gRm9yIG5vdywgSSdsbCBhc3N1bWUgdGhhdCB0aGVzZSByZWdp
c3RlcnMgYXJlIG5vdCByZWxhdGVkIHRvIHJlc2V0DQo+IGZ1bmN0aW9uYWxpdHkgYXQgYWxsLCBh
bmQgdGhhdCB0aGlzIGRyaXZlciBzaG91bGQgYmUgYSBwaHkgY29udHJvbGxlcg0KPiBkcml2ZXIg
aW5zdGVhZCBvZiBhIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyLg0KPiANCj4gQ2FuIHlvdSBjb252
aW5jZSBtZSBvdGhlcndpc2Ugd2l0aG91dCBicmVha2luZyBsaWNlbnNlIGFncmVlbWVudHM/DQoN
ClNvcnJ5IGFib3V0IHRoZSBkZWxheSwgYXMgeW91IG1heSBoYXZlIGZpZ3VyZWQgb3V0LCB3ZSBo
YWQgdG8gZG91YmxlIGNoZWNrIHdpdGgNCnRoZSBMU0kgdGVhbSBiZWZvcmUgbWFraW5nIGFueSBz
dGF0ZW1lbnQuDQoNCldlIGNhbiBjb25maXJtIHRoYXQgYHJ6djJoX2luaXRfdmFsc2AgY29udGFp
bnMgdGhlIHJlZ2lzdGVycyBhbmQgY29ycmVzcG9uZGluZw0KaW5pdGlhbGl6YXRpb24gdmFsdWVz
IHJlcXVpcmVkIHRvIHByZXBhcmUgdGhlIFBIWSB0byByZWNlaXZlIGFzc2VydCBhbmQgZGVhc3Nl
cnQNCnJlcXVlc3RzLiBUaGlzIGlzIGEgb25lIHRpbWUgb25seSB0aGluZywgZG9uZSBhdCBwcm9i
ZS4NCg0KQWZ0ZXIgbG9va2luZyBpbnRvIHRoaW5ncyBhZ2FpbiwgSSBoYXZlIG5vdGljZWQgdGhh
dCB0aGUgcHJvYmUgZnVuY3Rpb24gaXMgbWlzc2luZw0KY2FsbGluZyBpbnRvIHRoZSBhc3NlcnQg
c2VxdWVuY2UsIGFuZCB0aGUgc3RhdHVzIG9mIHRoZSByZXNldCBpcyB1bmRlZmluZWQsIHNvDQp0
aGF0J3Mgc29tZXRoaW5nIHRvIGZpeCBmb3IgdjMgdG8gbWFrZSBpdCBpbml0aWFsaXplIGluIGFz
c2VydGVkIHN0YXRlLg0KDQpUaGUgYXNzZXJ0LCBkZWFzc2VydCwgYW5kIHN0YXR1cyBvcGVyYXRp
b25zIGFyZSBvbmx5IHRvdWNoaW5nIHJlc2V0IHJlbGF0ZWQgcmVnaXN0ZXJzLg0KTm90aGluZyBl
bHNlLg0KDQpUaGVyZWZvcmUgd2UgYmVsaWV2ZSB0aGlzIHNob3VsZCBiZSBhIHBvcnQgcmVzZXQg
ZHJpdmVyLg0KDQpUaGFua3MgZm9yIHlvdXIgcGF0aWVuY2Ugc28gZmFyLCBhbmQgc29ycnkgZm9y
IGJlaW5nIGNyeXB0aWMuDQoNCkNoZWVycywNCkZhYg0KDQo+IA0KPiByZWdhcmRzDQo+IFBoaWxp
cHANCg==


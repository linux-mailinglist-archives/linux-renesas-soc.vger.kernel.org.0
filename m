Return-Path: <linux-renesas-soc+bounces-25022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D92C7D0B2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 13:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E19613A1C8A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C21285071;
	Sat, 22 Nov 2025 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NFcZ8jMw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E5720C029;
	Sat, 22 Nov 2025 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815767; cv=fail; b=Q9eBEKo5ko2qomaA6PzGqTxgTkayL/hagX+cB9GViqOD0ta0SAYrJvBusU3YGCP4dz+xUEvp+egbG3WaCq8c8SkVbhnHauRo8aZUvrJqTvwOV0fO/23+z6OQizwbcc4iRkRmILrBYA1WCIWUFi5T0b+ZraKnqDWJFC1X/U2NhAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815767; c=relaxed/simple;
	bh=l2pNiuQISW0nqyDdbX4I1/eRdQCTFwttfrVRTjm6tjs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bW5b8H0jHAVeIJO97ByqNAixR6JuOxKr7aHWiZ7d28E8x3wNgMQ/X99Z4cFRZg5TBs//KnmGhHUke4DsYGzAvZN9pwFzDlb6vn4pOJUfUXNn5mVgy0ZS/pAqX31ntIxJT7oZvdyfR4Hilg4q80Vyi7TGVh0BGu1Jc4vnhYaYunI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NFcZ8jMw; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1mDEMSCtB/jQnTp+GUCwORbQzgLdsWjbBlY/fF161w0GZ8AXtjeAxiG2sjUtncI5exwnBQoMjmCTiO5Q4bjYG6fnR1Wwv/Y1qvvFcHX+EROSxpZ39pyAeQjVScf0yHSB/X4CafdeLmHor8iwKGdmbuewmZsO/IWKzP83wrZ37Q2thcHHdjH4JDwEhbeSI8A2JnK4NshogGSmizB9Vmfa166hiCOMKb1epZAqrpLXM4wNvQov+gDPBCm+aK/YGits4S3jN6Jhsx0m3Ikv4PrMqOcEGQpr4reaZA5paylFHktVfQ1MKY+xaG31LH3Q+FLpEQ9QCpl/FgQaz+B+CZQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2pNiuQISW0nqyDdbX4I1/eRdQCTFwttfrVRTjm6tjs=;
 b=Kv2CoqxaLxYDjjX8oIS93dpy8ERS65dUgEzKZBbEsFnamD469KQx0JD1Pi/NPguK+VOFy9eEXzPiPF5Ac07GusDB6rSgTRdEbuRq+jCANgJob8lEHmZ2lvv8tsyjJTBMfwyTu7y2yhs1BdCFzW323ztrci0bneILq3D+aVeUOhuSAUwALooruflZErpiPfGHiwPfjVHAHv7iRWhZK5pB5QaZL/sm/TULh6SIcOxX76krXtnxEV5R0btuhZsrSbdZ/o3hJRgOZ8YlgtQU3DXUdwd3nbzbzcQSyat0cTYXxbYm6jgXDQn6rbHjM8DG+XoX2R4Sh90J7Qyn286iRoINIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2pNiuQISW0nqyDdbX4I1/eRdQCTFwttfrVRTjm6tjs=;
 b=NFcZ8jMwjEGOGPZC/HivnHJkDdisO3c8zSi+ktQqn4Fu68YSPR8St7OzdBqMEaqouymtGyCj/BUSqk0XIZvEzOjUMiT2egk0PYStGvZIEZTl0dlGWL6/I3OwzDwH7Vb8VMvPstREacIGdhAUCvNoINwnCpl6Jk1ZzKc7tf2amuU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12494.jpnprd01.prod.outlook.com (2603:1096:405:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.6; Sat, 22 Nov
 2025 12:49:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 12:49:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 02/13] serial: rsci: Drop rsci_clear_CFC()
Thread-Topic: [PATCH v3 02/13] serial: rsci: Drop rsci_clear_CFC()
Thread-Index: AQHcVVS6UEGivCY58EypgoQd0iN3m7T9QkqAgAFvmMA=
Date: Sat, 22 Nov 2025 12:49:18 +0000
Message-ID:
 <TY3PR01MB11346856B35E21B24201E95D986D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdV_zCYLTM9gwJJE9nErumC32=2qkfPQDhpDVwKHCsVpYw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV_zCYLTM9gwJJE9nErumC32=2qkfPQDhpDVwKHCsVpYw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12494:EE_
x-ms-office365-filtering-correlation-id: 210c82c9-f12c-4f57-610f-08de29c58d2a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aTlUdGhoT0hLdnhBanFqcHhwMG42eHU1c0dhaVh6TW5CTkZsZldtNGw3MXJi?=
 =?utf-8?B?ZitxU24vd0JiazJTVWZMdVNXVUJuRVZ0S0Y2VDVTRnRzR0lqc0ZOdWN1bW5Z?=
 =?utf-8?B?OWRLeElxUzk3M0xuNTdQZFhKNlFjUEQ2d21EMjJ4RGI5UzhxN2dDek02RW5q?=
 =?utf-8?B?S3J3U3MzUHVKQzBUdUJSYnA4NjNKWDFVdDY0WGZSempXcjZjWVhBK0tVYjVP?=
 =?utf-8?B?M3JraVR4T0tXQjE0eFNtNk8xbDZCakNPUnIrejA0NWlSN01tWG10MWJsN05P?=
 =?utf-8?B?NS82SUtROWJLNEJFOUFPcHhtR3BtWWp3Um5vOE1taXRHQjVLRWFVNngzSVp6?=
 =?utf-8?B?QVlBMzdXQkdndi9abytLYUhXRWhEcituYXkzcDIvM1pEcGR4RjI3cVloeEly?=
 =?utf-8?B?M09XdHlmaEJhY3dMa3FFV3pIdGZqeW1mWXNnT1Uwa3ZDY1lpd1J6eEE3dU5S?=
 =?utf-8?B?ODEyMHNqVXN1djlNYjZpS1psRGlhUnlaenUza0hsTFZoVEREdGpoekFRYlg4?=
 =?utf-8?B?YzNTTWVESTN5U0hMTFEvMWhjS04rbUcrT20vODdscmhKVXRseWdJdHN6MHo2?=
 =?utf-8?B?MTdsQk9GeG1sRmptOW52b3E5SnIzNGMrUUF6OFFpWGV6Ujh5dDBST0psVFVP?=
 =?utf-8?B?bmRHZ2Urdk9zWTJzUy82WkQ2OVEyR3NIRUVjMTQzY1hGT0UySGwxVUdoa1Bw?=
 =?utf-8?B?dTZmeC9GTGcxSHlhS0l1dXc3bk1Bd3FROFRBWEJGWVkwVyszTUtKZ21pc2VK?=
 =?utf-8?B?K3B1cDFJbUNIZHFmQlBTelVOOWJYbWNvNmg1VzJ2cHY0b01SWnU4RnErWEhN?=
 =?utf-8?B?aERMNUpNTWFnMjJxUW5COTBBN2hIYUttSnpKc0h0bVQyMk4wOCtaNjdsUlJk?=
 =?utf-8?B?amk2MlRGNlRJNEtPMGtwRkRCRnY4SXludUtjUFhaZFZVNEVCVTlrSGZxWG16?=
 =?utf-8?B?cUp0NjIzT05IcEZwZEcycWkyOEZmeCtoMVpEV1hNWW9ydCtaRVI3QTF1bEtC?=
 =?utf-8?B?elRLTS9pSFlUbzFVc1NpOEM4WitWdVZEdVRIcnBYSFJBdzlLSHprY1hBalpm?=
 =?utf-8?B?ZFFBVU1vVE81ZnZzNGVuQnkvRHhVYjEyN1F4Nzc1aHNVcVF4S1ZvRFN3YUUr?=
 =?utf-8?B?YjZTZjBHV0VsZFBzMVpXV3BwZmExYkRwVmJsYUppUjFQamI3bHdNWjdHL1F1?=
 =?utf-8?B?d2lVSlVKYnE2b1JGcXRuR2pBZTRSWDRHOXdpaFRxVUdUQXd3ajdkRDhTb1Az?=
 =?utf-8?B?TEZLNVNsMDRJdTlNZkVUbUNoQkdPUmpKdkRkQXVXVVMrRUhvY1p5TG9rWFJQ?=
 =?utf-8?B?RXVIaEpxa2JSSXhtLzBKazRGQlRzd2hqMk5vQUZxc1hiYnVLR0sxbHJpeTc1?=
 =?utf-8?B?NEliOGFyRTBpMzdkdDROL2k4Q0ZwQTRnRGdNbGRmNlhzN0hkVERnNkZ1Y2dl?=
 =?utf-8?B?OGRyaFNYOCtXZVhOdE5YQzBzcDM2NjVnSnRZR3dwQUJQa0Y5RE9qdE1rMDhn?=
 =?utf-8?B?Nk9DaGJ1UDd3c0hwcFNNdzc4ZzZUbThwZ0ZjeDZjbXFybGhsenRTT2ltcGVG?=
 =?utf-8?B?YktKVnZSSEd3MEtPQW5ZSmZuYm5aWTh6dTNRVXlhVG1uWjZ1VlhOWTJSZ0Jt?=
 =?utf-8?B?LzR1dExOUFhBY0hIOEFJZlA0eWhuSlR3REVKUlRBd25UV0dPcUZwMUVGTVlR?=
 =?utf-8?B?cVpsaTNUUjdWeUl1UEhQeXkxTzRkRW43VU5nU2o0cSsvaEx0WGFieGNNdEN2?=
 =?utf-8?B?aExUUzhjZ2JQT3hYM0ltTE4rdERUNEV5N1QvRDJnWnRFZnViSWtpZ0tLbkF0?=
 =?utf-8?B?aXhKNlgxaGdYK0phNFRReGJ4Mk5RYnRIS3VtRUVSaVlFMWJlbENkUGg4NlV1?=
 =?utf-8?B?SkZpc1d3R0RCN3d3Z2NTQVliRVY3NC94NlJ2RmJhYnpkZm4zZ1JWc1pBc0RH?=
 =?utf-8?B?aFozdTlVcStyanZCajB0Y1pGbWRpcXFwNTNZOW1MYkl5VEtLRjBkZjdaeHds?=
 =?utf-8?B?MHMxVmN1N0U5ZjJ2YXljcTJPaEgyMHpFRDh1QXhzWjVObmh0a20yQUZ5UEdj?=
 =?utf-8?Q?B4X96A?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2JYZGRVMVYzdEw4cjEvaWRJOTJnbWgzblF3UExwSFE1QUhBcXQzcEdiTVQr?=
 =?utf-8?B?WXVJcUQwLzVuVktpa1lNNUI1eC9vRjJvU0pzNHFVQzgyNjBVdTVuZ09qY3E1?=
 =?utf-8?B?cWdIcjRRZUExZlhPaXF1a1RqcEYxejJZWHhKRm1OY1pWUklVWXRuUGZMUnc3?=
 =?utf-8?B?dzJFZU1rZ01GMXBnMjF4VzhTQ2hEOEZlY2U2eHBiMkZuSEJUeW5lbmlRU1R4?=
 =?utf-8?B?WDUxMkZ6S3pFNTErT2xKZzZnUXByZUo2bmwrYnZ6cm9qMjhWSFNJZ2NOSFEv?=
 =?utf-8?B?blkrODVCMXlHRjZIRlRJazF1cmpyQTJUdGRvT29ncmtxUXJHVEJYU2dhM28x?=
 =?utf-8?B?bHNpSnhpRzQ0MHZVQ2pCK21qc1orR3RZWk05dmNIS0pKakFsOHR0U2RqVGU2?=
 =?utf-8?B?bVQ5QzJYbUN0cEkzRTRacW5JWnJ3UDlmZWZLTWQxcWsvRjB3bHM1QTRQNU9X?=
 =?utf-8?B?OExrT0wxdnFQQUZwK0hSbW10ME5MLzZSejVoQ09CV1hWYTM0Tmx6RnhwNUth?=
 =?utf-8?B?Q0J1T0pzdUFGelJSTktoK0hsYWQ1d2lqZ0lNa3ZzYWM3dmVucS81amkwZkJ3?=
 =?utf-8?B?UEJ6RVFDcTdiS2tycmphSUdyQjkwd0lzbVpncFA4YytwWkIvMmlTUHN0Ris4?=
 =?utf-8?B?RHdkSVhqc1dlTU5SbThpdWkyM0xOVHk0WUxCZFJJTENQRUgvcG4vdjNCMkd0?=
 =?utf-8?B?aVFjNStKeW5LZFhuRDlhWklsOEJLMHJLdEVnaE9zbXZTRkttWVgyNVpvRk5C?=
 =?utf-8?B?b0NkdFhybjdnRmlKdU9NTmNTQkhpSjhFWjZZSk1uQ2hmR2g5MVlEZFE0WHFv?=
 =?utf-8?B?aWs3OThMWlBmcGl3VDJvOEZzYXJMU1pYS0ZrZmdqRUdXeSs0N1c1VWhHaFFu?=
 =?utf-8?B?UDJ6UnA1dWlkTmRtZUVRdGJvVFBWd1B1MUxZK2tLSnU5OXBtOURCclNEKzhz?=
 =?utf-8?B?VnFZSWVoMThEUlI0THFMcTJFNi9wbElIRVY1bFlsU25JcnkvRkIrTjh4dnRy?=
 =?utf-8?B?UHlTTHpEcUxNWXNPcUQweU5VYlpFb2I1Ykl2MHpzTk9FZVpiNXBZdDVTL1J5?=
 =?utf-8?B?cmEwK3haVEpTeHJMLzNtTWJINW0xT0N4WE9peGd1UzdaZzA5Q0hlQWMvaVd6?=
 =?utf-8?B?WGpOTUY2UkRkUkJTKzFSMmNQZXNKWDY1WnFWK29ITUJvcHEvcEdtVG9VRHlt?=
 =?utf-8?B?RzhTZ2ovc05icGtQQnVyaGc1cUN1elBmS01ldEFsQmtnNDlVVnRZTU04eWMz?=
 =?utf-8?B?TGgwT1pHQVBCMXRoSXlzamFmTW11UHptY09rMzNzTHJSNnlQSTQrQ01FbGpL?=
 =?utf-8?B?blFCdTlxa3NFa0VRWEV6YWVEM0FPako0MmY0WkVlSU9HdlVEWUJuOU9hL1Jr?=
 =?utf-8?B?ZGtUMTA2dDFNRHg1TnVBV05GQTBmcDlQT0RNTWF1MXNUMTRFeFMrTUJBeVFE?=
 =?utf-8?B?dlFYdW8xdGRqbFNtNWlUdENyQUdheTR4SzRoWEtwRE5ER0tiNmgxRmFyM2tK?=
 =?utf-8?B?NiszWlRuK3NoUlNPcjBCbWJZa0xiVitDdEs4KzlLNDVYUnNaMkVUN0pKcGNy?=
 =?utf-8?B?T2JZRTNML2lLRXpWVWdQSEZMcU1ONzNoUFA2dlN2ZjBhazZsWnV0K3VhRVE4?=
 =?utf-8?B?ZTFxQk9RTkViSXR0SmUyK0o1eWlWRThnMG16ZlU5aFZZSnlJUXRPaWp1TE53?=
 =?utf-8?B?RVZmdWliamxaV1RIZFgxZFBsU21ZWEF4MFU2QUllbk40WCsxTXZ2Uzl4eDZj?=
 =?utf-8?B?RCtORm5oaFhzQlZNYitQNEVscEF6QWpNYzByYytuM3pLbVJiencvRHRKd2lT?=
 =?utf-8?B?TDYvWWxielZDOHR0NmEzQnlnUGJOUDNTbUFBb0tKaU9WK1graklFVHF4NC9U?=
 =?utf-8?B?c05Ma2pPTDRzT3RJUFhtdkxyc1VtQVowYUJRVU5oaStUMWdwQmNXdTc4SHFs?=
 =?utf-8?B?bTlqK0JRRXcvK0FyZS81SEs4WVFtL1JtWE1tYWttaGxEblVwYWlVQ3NscU1D?=
 =?utf-8?B?bmpBaUlDeUcya3lDWEZqc2pwS1JrYUFWekpoaXJBTXEzM2hzdWVEQ2R1RE0r?=
 =?utf-8?B?eFRiRFRHeDFGTlNZRlk5N2VzRTRMblRYQTV0VjVTUithVFBoRDNaeEhvTHM4?=
 =?utf-8?B?QzBJRU84dG1tRTRCWnNET2V2dVUrLzBqRDZER3lVOVU4QTRvYnpITXJyaExS?=
 =?utf-8?B?QXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 210c82c9-f12c-4f57-610f-08de29c58d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 12:49:18.6542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHd1aY0eOS4dlPy0tXAr1dEidCe2iWpRgcHATacpOFqDmZtUXpHnrr5yCSjtpiJZLsDVj63IrYedL8nkkgCMas+MAk+WdQ3vfbRY0FA9CT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12494

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDIxIE5vdmVtYmVyIDIwMjUgMTQ6NTMNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwMi8xM10gc2VyaWFsOiByc2NpOiBEcm9wIHJzY2lfY2xlYXJfQ0ZDKCkNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIDE0IE5vdiAyMDI1IGF0IDExOjUyLCBCaWp1IDxiaWp1
LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IERyb3AgcnNjaV9jbGVhcl9DRkMoKSBieSByZXVz
aW5nIHJzY2lfY2xlYXJfU0N4U1IoKSBhcyB0aGUgY29udGVudHMgb2YNCj4gPiBib3RoIGZ1bmN0
aW9ucyBhcmUgdGhlIHNhbWUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+
IA0KPiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9yc2NpLmMNCj4gPiArKysgYi9kcml2ZXJz
L3R0eS9zZXJpYWwvcnNjaS5jDQo+ID4gQEAgLTE5OSwxMSArMTk5LDYgQEAgc3RhdGljIHVuc2ln
bmVkIGludCByc2NpX2dldF9tY3RybChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQ0KPiA+ICAgICAg
ICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCByc2NpX2NsZWFyX0NG
QyhzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LCB1bnNpZ25lZCBpbnQgbWFzaykNCj4gPiAtew0KPiA+
IC0gICAgICAgcnNjaV9zZXJpYWxfb3V0KHBvcnQsIENGQ0xSLCBtYXNrKTsNCj4gPiAtfQ0KPiA+
IC0NCj4gDQo+IFRoaXMgZnVuY3Rpb24gaXMgaW5kZWVkIGlkZW50aWNhbCB0byByc2NpX2NsZWFy
X1NDeFNSKCksIHNvDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gSG93ZXZlciwgd2hpbGUgdGhlIHNjaV9wb3J0X29wcyBt
ZXRob2QgaXMgaW5kZWVkIGNhbGxlZCAuY2xlYXJfU0N4U1IoKSwgSSB0aGluayBpdCBtYWtlcyBt
b3JlIHNlbnNlIHRvDQo+IGRyb3AgcnNjaV9jbGVhcl9TQ3hTUigpIGluc3RlYWQsIGFzIHRoaXMg
ZnVuY3Rpb24gdG91Y2hlcyB0aGUgQ0ZDIHJlZ2lzdGVyLi4uDQoNCk9LLCB3aWxsIGNoYW5nZSB0
aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=


Return-Path: <linux-renesas-soc+bounces-24563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185EC57E3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D51704E8EC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F4827467B;
	Thu, 13 Nov 2025 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IVWoi6R0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33823D7C4;
	Thu, 13 Nov 2025 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043302; cv=fail; b=aQFIRr6LAUHH+sjBKvK218PhhnWtaV1KYIK0xvS/GDV0KiRp/Ux8BSnmAoXCIz1nbv8xIy3lh62aN4xpLKJH7TN2oDWUjhUe1BzQ8TdjfdCKex4YWAus41gst5OAFUM0myyqWDMDts+qrob2KqrfFgJhckvjpU1/GuUVHAxiYQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043302; c=relaxed/simple;
	bh=PWVY3nlglT3FADvMYavKmvnqs6nBVDlkPrvXCUfNP3c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fOy2F/MRfPQNPAheNGLrdgHvrAHEtwUMvHbp2KIRoLF1VkxSZb6qRvBiJAu6ANmEOrNdFcjRv/iu5ddo0wjfM3/8gDK64DxRAEQYxgk9TNa0q8LCPS0ofSe1MU3Zn+ML+tGmGO78SdeqnskzLKFGmumnYCarm3w2Y8qzH8bsh/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IVWoi6R0; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WN7rMAf4bfiQT6aV0AIlt090AMFjg3Y3V5HxAdet0WQ18XFpOGtobiTcuA8AeEn1rYwfMLllIyMV4bwrSPh1cJSkVVGTaH6W4f0EWBbt182aA9Y5RvuAumC++3n48Cvz08G/cry1Dl4L1bFRI4vYc+mQWdTkWVfuPieP461QNh9FJWB8Bx5KrJCqMa6JUbWK11485GNxAPCPUbEt4s/PLX17hietE3Gf+k+OjF0xZNqzzXIhqiKsg5DooLkmJtIUnofsvGLi+RwoF+5l21EvDc7LcfB6QCcrEOQCXl09VAuZ8keKJsc8hJZwlvDnr629U0OIcCcFq7PisoqMjuC/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWVY3nlglT3FADvMYavKmvnqs6nBVDlkPrvXCUfNP3c=;
 b=XpoMg4M7NqaX9/UYuNS4SxQhC36ztSYMK+penzkAIvhjOPuobHZpRnqfkj+3A5VAtke4WqyVXDdj+oI/fYWaGy4ukD6c9NX2tNhSkRqudj2YuJjd5m8GAUi9JtoYCGZF5IpkYZ1j22fOyBCg462bftz/oXk5uQ8P5UoJChiD/PegO3wrXVQYOinwDtDncmSjKN7goZ4zxNF+gEGYMy10LDCa0esGsqY8zeGiaK4S8y7piPP/mJRTN3STCUqkDay8XTqy1laSyEKuWWhB3Vej8lBvKMf4gDF19G1SYchM/u4TNv/mMGAhVR/HUNR+YoH6+yHSu1Jl4y3A/ODRCNTzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWVY3nlglT3FADvMYavKmvnqs6nBVDlkPrvXCUfNP3c=;
 b=IVWoi6R0gPjkN1cdOu/100wneHbq0HeNPSREelgUYyPWyGUT0Scgx0k7NOWzDD9e11yvpriQPjddNJlmdwQSRfCIv4gGjGXgQxOt95P7GXRuNpau445hQ327/QqG7Hrx9sCfza8fY7ppaBCGKzHNeXKiZfwnPBqZOB//MI/B7fE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9745.jpnprd01.prod.outlook.com (2603:1096:400:22e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 14:14:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 14:14:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Cosmin-Gabriel Tanislav
	<cosmin-gabriel.tanislav.xa@renesas.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Nam Cao <namcao@linutronix.de>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: fix RSCI FIFO overrun handling
Thread-Topic: [PATCH] tty: serial: sh-sci: fix RSCI FIFO overrun handling
Thread-Index: AQHcTz8cfx1vy1NnNUOs8zb/7KkaqbTwsFqg
Date: Thu, 13 Nov 2025 14:14:55 +0000
Message-ID:
 <TY3PR01MB11346FE3D3B81E983DB3B9EAD86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250923154707.1089900-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdWRCGYLRK_WBmbB0cRP7PHiGPSi3U1jdWSVKaTSweruUw@mail.gmail.com>
 <CAMuHMdXb0hPPR9feTVrHDvyzEbiOEG7Vy5ec_bnwdXTZ=9Cg8Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXb0hPPR9feTVrHDvyzEbiOEG7Vy5ec_bnwdXTZ=9Cg8Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9745:EE_
x-ms-office365-filtering-correlation-id: 0e22916f-09e6-415b-1fa2-08de22bf0584
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dGxhUlJyNWxXYysySEtFcVlmdzg2ZkhUaDVycS81YzVrcGwyOTA2Yk1aQVBx?=
 =?utf-8?B?c1BLVndhVVhBZzNnQjkzaVZMMVArdUNiaWdJdFNkRDFCMHFyemhYNG5pYUZ6?=
 =?utf-8?B?SUU4b0RPZ3VmckQ1K1NGNnJrQjlXK1UrQ05maTRFOHAyYW43RS9VY2IxVU5i?=
 =?utf-8?B?U1Jkd2pPRlpBZEJBL1FIUlVqZ3N1eXRxTDE3UldpUTZyQWEyVWZZTGJ4czhr?=
 =?utf-8?B?UXh4N0d2Vm5RaWtsNENaYjRlc2oxQ2NGTjYrZlR3MytsRWs2MjZnZFRNYlJ1?=
 =?utf-8?B?SXZRZHJreVI4VDdZSitNSFBvZzhTVlM1UURtUmUvTUFReStsM0xSeWgvMWlG?=
 =?utf-8?B?SGVlZzBuZThSODAwNmh6NlVMczA2QStNL29uc3g3WFlicGpmZUI5VDVZQ2dK?=
 =?utf-8?B?bTQ1RTBXN3g4cHNjNXJjcWt0NndiVXZXc294QTFhZUl0eUdzTlZFWHdPcTBa?=
 =?utf-8?B?UzlLVUNzNEF4RkV5aEttWW5vR3Zkc21FaXZrSVlWbU5PdDRzRGM0RHUwUGpI?=
 =?utf-8?B?WTJDL2lWdFdhSStzRXVLT1FTRXYwYlVEa202cG1lUHN0Nkpmb245ZytERWMy?=
 =?utf-8?B?YkZkbmRuZEJ0djROeUFxODZSZ1JHcjRoU1E0TE1FU3NROUVFZjlnR00vMXll?=
 =?utf-8?B?WENUL2hRdEJnUUxmUk1qS3VRZjJjZTN4Q0pyZFFxSzZDSEhIRFRrZFBQRnZG?=
 =?utf-8?B?VWV0ZVVGajFLYjh3d01YbkRTc2VZOEozbWNzdzFydFdzb0RWbXBBajF2Y29p?=
 =?utf-8?B?Sm5GYXBCeUl4NlZVaWVRL3MxemJaaWZUdm05aDJxMjU1RW5UV2t0RUdrOVhu?=
 =?utf-8?B?Z1BRZ0Y0VlpyT1F4RVAxUjlYaDUyK05FSlRxTnRGanNYSzJsVXduSVZ5djln?=
 =?utf-8?B?VVNlRDZYRlVveFMvK2oxMENDZXY1RGdsK3ZDTUFMZ1NMY0wyWWdFNVpKd2Yy?=
 =?utf-8?B?alBKUHVYaXlXMHBiK3JPRHJIeVdDSjdvWm5XRHVCYXNJZE0zS3VVUGVIdHlm?=
 =?utf-8?B?NG81S0dzcjZhZUNQLzFsRFdZMDNRSlJVb1F3cGN2MkNpeEgwQmw0SXNoSFNY?=
 =?utf-8?B?d0IvSCtSOGN0aUJ4V3Y5V1FkeCtVeFZDWTFWSWtCSFcxUXFYckIzTUlDdHkw?=
 =?utf-8?B?Z1B6N2Y0dTg2OHZLWjJFWHlUcDMvNzF4KzVQeTRrd0o0SlNBM3VIWWRGWEN4?=
 =?utf-8?B?MzRmcW5IWU5jYXVtYWUxcUVySGhUdE5iZ216Rk1EdmloL1BZUnU2R0JVY3JJ?=
 =?utf-8?B?S2IwS25ZOXkvYndRVytwN3pTQmJvd3lwcWFOMnRvOWtXdVlQK0dJUG5XWGZT?=
 =?utf-8?B?VHRFYWp6MmUxTWJhUUYrOVZVZzBNZmMyQUdWTFpnbUJ0T3BIbHpWTDFtK1Fj?=
 =?utf-8?B?bFZoR0dNU2RVbTd5QWhYVHJCajllYmVTeFJpeDY1WjVzd2pKaXJXOVFpdmNK?=
 =?utf-8?B?NWJtV1poNTg4aTZ2Q0pYZ09jTzJDZDhOVkRaTTlZb2VpTUpucTU4Zy9yWXFj?=
 =?utf-8?B?aUNwODVDdGl4NllXRnpDamZuejJ2U1FyMzFRbngyTEJIVmFPSVhURXFYdk9n?=
 =?utf-8?B?ejliVU9YZnZRZFlBdGJRQ2dQc0llMGlzN1NsYUV6cllIS3c0OGFHVmlHckxq?=
 =?utf-8?B?dExyM0J1Ym1rQUxBWlFMU0JiN2QzRThoT2tFOTUvV01jR0JES0dTUzBjNzdo?=
 =?utf-8?B?bGhjOXJ1cEs5ZU95Z1ZqZHlNSFJ0Z2F1Y2lIbGc3N1F1VmQ5cC9nRGhOWmgx?=
 =?utf-8?B?VGRaYjVWdmFTVWpRYWZySm00QXFHU0FGeTBRcXl2SDdJR0xrRjVBdDJEZXlq?=
 =?utf-8?B?bDBBdm1WRk5VMHZYQTJSYW5SckFYczhEVE1jdlRPUzNOQ2dWbmgybk1aY1JP?=
 =?utf-8?B?aEJVc3FXUXF4MURKdzdKdXR5L2NvekNSQXArNEJsQmgzQUdWdWsybmMwNFAr?=
 =?utf-8?B?ZmZuT0JBcXUyVzAwYlZwWjM0OTJsVjJxaFBpN3czNkgzVDk4eXFNcGt0QU5Y?=
 =?utf-8?B?UWJIVUlwdGc3MFI2VU5SSzVvL25ONlk4dDlqM1duZE9DYXZCOEVodEQ4Z1Jt?=
 =?utf-8?Q?sVlsRY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QU5Dd1V1Q25LK0lqQ1dRVGpKSWJXQXhCY1Y1amMwWlN4T001bVFWbkcydmcw?=
 =?utf-8?B?OCtZYlZVUFBtVUkvYktOOVkrdGN2ejdaVG9CNGFtVEhocDBTWTVzOHZzaTVs?=
 =?utf-8?B?dVFQYWZNelpFV3l5Z28vYTFFZVl5M0tOWmxXZnhzbU1yR0Vwc09xUzhrUnUx?=
 =?utf-8?B?aVpjTkpjSHRJTytjWmJXRWJydkpMaHJtRG9CbTdUQ2xjc2xuZ3o5ZTB4M3Qy?=
 =?utf-8?B?d1JaU0tPZWFTbk9ZZEYwWjBuMHBXT05jaWJ4K2ZlaFJ1ekZwS1l5WDFWVTlL?=
 =?utf-8?B?eitqSUl5TFFYUW8rN01mTUpwbXpyckZYWTBEZFBUSWZVS2ZVdkk4cXVKRlJp?=
 =?utf-8?B?MjhBR1lld2FmK2IyRTdVQU80eHhUZy8wUHhyQWJ5a2djMSszTWcxYnN4Zklj?=
 =?utf-8?B?TzBuMmJIeERNUHB2bEVoMkoxQTlIbEVBWEJ2ak9haVNiVFFML2pnamhEb1hR?=
 =?utf-8?B?dFpTbkFxb1B2eDN2MDNRb1N2aTZpOEV1UUpUSHFYTkpRblozNUlTL1BXL0lS?=
 =?utf-8?B?UDFqdDgzZmR5OUlUaFFUam5zR0MzaVVmMzdRTHlvVGtJNnkxRmh5MzVjQVk3?=
 =?utf-8?B?dmRJUDNETnh1anNrUWJoTkNsTzZCblIzd3JHR2JYMWlPNTVUdXFKckVsV0Ur?=
 =?utf-8?B?Z1B2WU1oQVI1L1dVa1pNNzA5dnBqSnNrU2h1cy9BSHBTOE5LRmZJZ1JRMWtm?=
 =?utf-8?B?Y1BkczhyWHVMVHFKS05GMGg3ei9hWE1NdXhMSTdXQXlLYnpxWEZnWDI1ZGRJ?=
 =?utf-8?B?RlpFU01KMHVrTXp0Mkt0SGp2VWo5aGZOSDFaSWdwRlBEWk1iNGkyaDMyUVUz?=
 =?utf-8?B?WTdzbDNzUkQ2MHlpdUJQYWZqVmIzYUd4WlNtRjdYUGVOdHFWdU5tQ1VkSEZI?=
 =?utf-8?B?Rlo2a01HbUhwcExmMDhvTnZlYk56bVhPVmVKMS9UdmlpMjdncmRLcDhyWk4x?=
 =?utf-8?B?bWd4QjRiQVlkU0thMVVkcjZ4ZDFsZkdZTTEwT0YybHk1OGdmU0VZSGw2L2E5?=
 =?utf-8?B?bWJPT2JWTHZtcTIrTlVzVUR0UXhRNTlFZVRXOUl0cmlvekR2VkROVzZGN0gr?=
 =?utf-8?B?VFdCREpJMHFtMXRoS01GVEtOSG0xN3JsUER5Z2NJVWs4NWk2YnZoYjNjS2Vy?=
 =?utf-8?B?MHpxYjhZRUh5NXdzYmNRc0ZjOU5CZEZtMDlObEVEZXhKaXFZNzBiQ3hzUWZx?=
 =?utf-8?B?M0hxNjZmcWo2Y2doY2kwNnhjZjBOT0hZVlRhcXpMdlJjeFdvRGhuL0Y2cVVJ?=
 =?utf-8?B?bmZuVFh0SGVBL2o1S3FOTVVyOEhZYWhjMkRFNkV0RHEvTkFYdUYwanRFRlFj?=
 =?utf-8?B?TzNuRmJ3cEM3SnM2bmh1U0VHRUFtV0pHNC9ZYnpObnFoQktTT1hWVVBkUm9E?=
 =?utf-8?B?RzlueEVLS1NiQjF2dXNqQkxxS29VOCt1MmFjcCthLzZZMFZqdVlSVUh5aWJD?=
 =?utf-8?B?L1BNazdXZnlEeFB2amVBVzF0RmxQT1l6djF3YUlQcGhIa0tpQzlhN012RGtC?=
 =?utf-8?B?WHd1akl4RHdvWnF4QWg2THRoT0d5YXVJV3c1ejVaUk5QQTc3ODdMMGdYWWpP?=
 =?utf-8?B?LzNrNUJLdlgwOHV4c3JsZm5SNUdUdG8zbjVuMW90ZHNidDZ4MjEvczNpWTlu?=
 =?utf-8?B?YWFQRFowME1teUtsdDA1dW1zR1lkYXFJUk5keDZZOXVULzZCOVlzTE5FVXhv?=
 =?utf-8?B?UXd0NTJsQUZ5elhvdkJwcm1vS1B1Nk5YamFZK3NPZWxRMjNtOGhhMVljWXRI?=
 =?utf-8?B?dWFNUGtpWEFxN0JDcEpWd1V5RGUrc1JhT2J6cDVVdy9TNk1VU3U0Wng2Y2JB?=
 =?utf-8?B?S1E4dlFHcllnbUpFSlRHNUt5bUdPZWNmNEUyQTVCbjQzc3BPWXNDZTF2QUdO?=
 =?utf-8?B?YlNPczRWcjBWckxCbWlOQldWQW5oMUI1ZWJaWUdPL052YVVocStHamsyQ29X?=
 =?utf-8?B?NFBVUVNBajduKzdxRTRHcXI3MjBLU2hLcWkwdkVGSDVybk81aisrVVBRdkFr?=
 =?utf-8?B?eWg3SjBudS9WZmFpdGRqQXdqTGI3bUN5NnhWZG01VXliSjJqZUh4MTJFdkhU?=
 =?utf-8?B?M3VoYkZHbWxXK0hnTFV5aFRxRTgrM1EzdDdZamN0UVVGQTlxS1gwZHUvS2pw?=
 =?utf-8?B?YUYrcnNWZU1jcUh2b2hqeGg3L2dpMnE5KzRvODVONzd1dXdDUzNUbXprdHZh?=
 =?utf-8?B?WEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e22916f-09e6-415b-1fa2-08de22bf0584
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 14:14:55.9572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJXeJp/DYkXLGz8hWbpZr7LEgekXZ4ErUortdQLEbnNaCaIlCj/2k6dhGUOB2aEEG6mCL4+P6+3fu+p3N5MRApdxxjmwvgi0L2IcMKMid3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9745

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IE5vdmVtYmVyIDIwMjUgMTc6MDINCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gdHR5OiBzZXJpYWw6IHNoLXNjaTogZml4IFJTQ0kgRklGTyBvdmVycnVuIGhhbmRsaW5n
DQo+IA0KPiBDQyBCaWp1LCBsaW51eC1yZW5lc2FzLXNvYyAobGV0J3MgaG9wZSBmb3IgcmVhbCkN
Cj4gDQo+IE9uIFRodSwgNiBOb3YgMjAyNSBhdCAxNzo1NCwgR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBIaSBDb3NtaW4sDQo+ID4NCj4g
PiBPbiBUdWUsIDIzIFNlcHQgMjAyNSBhdCAxNzo0NywgQ29zbWluIFRhbmlzbGF2DQo+ID4gPGNv
c21pbi1nYWJyaWVsLnRhbmlzbGF2LnhhQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IFRoZSBy
ZWNlaXZlIGVycm9yIGhhbmRsaW5nIGNvZGUgaXMgc2hhcmVkIGJldHdlZW4gUlNDSSBhbmQgYWxs
IG90aGVyDQo+ID4gPiBTQ0lGIHBvcnQgdHlwZXMsIGJ1dCB0aGUgUlNDSSBvdmVycnVuX3JlZyBp
cyBzcGVjaWZpZWQgYXMgYSBtZW1vcnkNCj4gPiA+IG9mZnNldCwgd2hpbGUgZm9yIG90aGVyIFND
SUYgdHlwZXMgaXQgaXMgYW4gZW51bSB2YWx1ZSB1c2VkIHRvIGluZGV4DQo+ID4gPiBpbnRvIHRo
ZSBzY2lfcG9ydF9wYXJhbXMtPnJlZ3MgYXJyYXksIGFzIG1lbnRpb25lZCBhYm92ZSB0aGUNCj4g
PiA+IHNjaV9zZXJpYWxfaW4oKSBmdW5jdGlvbi4NCj4gPiA+DQo+ID4gPiBGb3IgUlNDSSwgdGhl
IG92ZXJydW5fcmVnIGlzIENTUiAoMHg0OCksIGNhdXNpbmcgdGhlIHNjaV9nZXRyZWcoKQ0KPiA+
ID4gY2FsbCBpbnNpZGUgdGhlIHNjaV9oYW5kbGVfZmlmb19vdmVycnVuKCkgZnVuY3Rpb24gdG8g
aW5kZXggb3V0c2lkZQ0KPiA+ID4gdGhlIGJvdW5kcyBvZiB0aGUgcmVncyBhcnJheSwgd2hpY2gg
Y3VycmVudGx5IGhhcyBhIHNpemUgb2YgMjAsIGFzDQo+ID4gPiBzcGVjaWZpZWQgYnkgU0NJX05S
X1JFR1MuDQo+ID4gPg0KPiA+ID4gQmVjYXVzZSBvZiB0aGlzLCB3ZSBlbmQgdXAgYWNjZXNzaW5n
IG1lbW9yeSBvdXRzaWRlIG9mIFJTQ0kncw0KPiA+ID4gcnNjaV9wb3J0X3BhcmFtcyBzdHJ1Y3R1
cmUsIHdoaWNoLCB3aGVuIGludGVycHJldGVkIGFzIGENCj4gPiA+IHBsYXRfc2NpX3JlZywgaGFw
cGVucyB0byBoYXZlIGEgbm9uLXplcm8gc2l6ZSwgY2F1c2luZyB0aGUgZm9sbG93aW5nDQo+ID4g
PiBXQVJOIHdoZW4NCj4gPiA+IHNjaV9zZXJpYWxfaW4oKSBpcyBjYWxsZWQsIGFzIHRoZSBhY2Np
ZGVudGFsIHNpemUgZG9lcyBub3QgbWF0Y2ggdGhlDQo+ID4gPiBzdXBwb3J0ZWQgcmVnaXN0ZXIg
c2l6ZXMuDQo+ID4gPg0KPiA+ID4gVGhlIGV4aXN0ZW5jZSBvZiB0aGUgb3ZlcnJ1bl9yZWcgbmVl
ZHMgdG8gYmUgY2hlY2tlZCBiZWNhdXNlDQo+ID4gPiBTQ0l4X1NIM19TQ0lGX1JFR1RZUEUgaGFz
IG92ZXJydW5fcmVnIHNldCB0byBTQ0xTUiwgYnV0IFNDTFNSIGlzIG5vdA0KPiA+ID4gcHJlc2Vu
dCBpbiB0aGUgcmVncyBhcnJheS4NCj4gPiA+DQo+ID4gPiBBdm9pZCBjYWxsaW5nIHNjaV9nZXRy
ZWcoKSBmb3IgcG9ydCB0eXBlcyB3aGljaCBkb24ndCB1c2Ugc3RhbmRhcmQNCj4gPiA+IHJlZ2lz
dGVyIGhhbmRsaW5nLg0KPiA+ID4NCj4gPiA+IFVzZSB0aGUgb3BzLT5yZWFkX3JlZygpIGFuZCBv
cHMtPndyaXRlX3JlZygpIGZ1bmN0aW9ucyB0byBwcm9wZXJseQ0KPiA+ID4gcmVhZCBhbmQgd3Jp
dGUgcmVnaXN0ZXJzIGZvciBSU0NJLCBhbmQgY2hhbmdlIHRoZSB0eXBlIG9mIHRoZSBzdGF0dXMN
Cj4gPiA+IHZhcmlhYmxlIHRvIGFjY29tbW9kYXRlIHRoZSAzMi1iaXQgQ1NSIHJlZ2lzdGVyLg0K
PiA+ID4NCj4gPiA+IHNjaV9nZXRyZWcoKSBhbmQgc2NpX3NlcmlhbF9pbigpIGFyZSBhbHNvIGNh
bGxlZCB3aXRoIG92ZXJydW5fcmVnIGluDQo+ID4gPiB0aGUNCj4gPiA+IHNjaV9tcHhlZF9pbnRl
cnJ1cHQoKSBpbnRlcnJ1cHQgaGFuZGxlciwgYnV0IHRoYXQgY29kZSBwYXRoIGlzIG5vdA0KPiA+
ID4gdXNlZCBmb3IgUlNDSSwgYXMgaXQgZG9lcyBub3QgaGF2ZSBhIG11eGVkIGludGVycnVwdC4N
Cj4gPiA+DQo+ID4gPiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0gSW52YWxp
ZCByZWdpc3RlciBhY2Nlc3MNCj4gPiA+IFdBUk5JTkc6IENQVTogMCBQSUQ6IDAgYXQgZHJpdmVy
cy90dHkvc2VyaWFsL3NoLXNjaS5jOjUyMg0KPiA+ID4gc2NpX3NlcmlhbF9pbisweDM4LzB4YWMg
TW9kdWxlcyBsaW5rZWQgaW46IHJlbmVzYXNfdXNiaHMgYXQyNA0KPiA+ID4gcnp0MmhfYWRjIGlu
ZHVzdHJpYWxpb19hZGMgc2hhMjU2IGNmZzgwMjExIGJsdWV0b290aCBlY2RoX2dlbmVyaWMNCj4g
PiA+IGVjYyByZmtpbGwgZnVzZSBkcm0gYmFja2xpZ2h0IGlwdjYNCj4gPiA+IENQVTogMCBVSUQ6
IDAgUElEOiAwIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA2LjE3LjAtcmMxKyAjMzANCj4g
PiA+IFBSRUVNUFQgSGFyZHdhcmUgbmFtZTogUmVuZXNhcyBSWi9UMkggRVZLIEJvYXJkIGJhc2Vk
IG9uDQo+ID4gPiByOWEwOWcwNzdtNDQgKERUKQ0KPiA+ID4gcHN0YXRlOiA2MDQwMDBjNSAoblpD
diBkYUlGICtQQU4gLVVBTyAtVENPIC1ESVQgLVNTQlMgQlRZUEU9LS0pIHBjIDoNCj4gPiA+IHNj
aV9zZXJpYWxfaW4rMHgzOC8weGFjIGxyIDogc2NpX3NlcmlhbF9pbisweDM4LzB4YWMgc3AgOg0K
PiA+ID4gZmZmZjgwMDA4MDAwM2U4MA0KPiA+ID4geDI5OiBmZmZmODAwMDgwMDAzZTgwIHgyODog
ZmZmZjgwMDA4MjE5NWI4MCB4Mjc6IDAwMDAwMDAwMDAwMDAwMGQNCj4gPiA+IHgyNjogZmZmZjgw
MDA4MjE5NTZkMCB4MjU6IDAwMDAwMDAwMDAwMDAwMDAgeDI0OiBmZmZmODAwMDgyMTk1YjgwDQo+
ID4gPiB4MjM6IGZmZmYwMDAxODBlMGQ4MDAgeDIyOiAwMDAwMDAwMDAwMDAwMDEwIHgyMTogMDAw
MDAwMDAwMDAwMDAwMA0KPiA+ID4geDIwOiAwMDAwMDAwMDAwMDAwMDEwIHgxOTogZmZmZjAwMDE4
MGU3MjAwMCB4MTg6IDAwMDAwMDAwMDAwMDAwMGENCj4gPiA+IHgxNzogZmZmZjgwMDJiY2VlNzAw
MCB4MTY6IGZmZmY4MDAwODAwMDAwMDAgeDE1OiAwNzIwMDcyMDA3MjAwNzIwDQo+ID4gPiB4MTQ6
IDA3MjAwNzIwMDcyMDA3MjAgeDEzOiAwNzIwMDcyMDA3MjAwNzIwIHgxMjogMDcyMDA3MjAwNzIw
MDcyMA0KPiA+ID4geDExOiAwMDAwMDAwMDAwMDAwMDU4IHgxMDogMDAwMDAwMDAwMDAwMDAxOCB4
OSA6IGZmZmY4MDAwODIxYTZhNDgNCj4gPiA+IHg4IDogMDAwMDAwMDAwMDA1N2ZhOCB4NyA6IDAw
MDAwMDAwMDAwMDA0MDYgeDYgOiBmZmZmODAwMDgyMWZlYTQ4DQo+ID4gPiB4NSA6IGZmZmYwMDAz
M2VmODg0MDggeDQgOiBmZmZmODAwMmJjZWU3MDAwIHgzIDogZmZmZjgwMDA4MjE5NWI4MA0KPiA+
ID4geDIgOiAwMDAwMDAwMDAwMDAwMDAwIHgxIDogMDAwMDAwMDAwMDAwMDAwMCB4MCA6IGZmZmY4
MDAwODIxOTViODANCj4gPiA+IENhbGwgdHJhY2U6DQo+ID4gPiAgc2NpX3NlcmlhbF9pbisweDM4
LzB4YWMgKFApDQo+ID4gPiAgc2NpX2hhbmRsZV9maWZvX292ZXJydW4uaXNyYS4wKzB4NzAvMHgx
MzQNCj4gPiA+ICBzY2lfZXJfaW50ZXJydXB0KzB4NTAvMHgzOWMNCj4gPiA+ICBfX2hhbmRsZV9p
cnFfZXZlbnRfcGVyY3B1KzB4NDgvMHgxNDANCj4gPiA+ICBoYW5kbGVfaXJxX2V2ZW50KzB4NDQv
MHhiMA0KPiA+ID4gIGhhbmRsZV9mYXN0ZW9pX2lycSsweGY0LzB4MWEwDQo+ID4gPiAgaGFuZGxl
X2lycV9kZXNjKzB4MzQvMHg1OA0KPiA+ID4gIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgx
Yy8weDI4DQo+ID4gPiAgZ2ljX2hhbmRsZV9pcnErMHg0Yy8weDE0MA0KPiA+ID4gIGNhbGxfb25f
aXJxX3N0YWNrKzB4MzAvMHg0OA0KPiA+ID4gIGRvX2ludGVycnVwdF9oYW5kbGVyKzB4ODAvMHg4
NA0KPiA+ID4gIGVsMV9pbnRlcnJ1cHQrMHgzNC8weDY4DQo+ID4gPiAgZWwxaF82NF9pcnFfaGFu
ZGxlcisweDE4LzB4MjQNCj4gPiA+ICBlbDFoXzY0X2lycSsweDZjLzB4NzANCj4gPiA+ICBkZWZh
dWx0X2lkbGVfY2FsbCsweDI4LzB4NTggKFApDQo+ID4gPiAgZG9faWRsZSsweDFmOC8weDI1MA0K
PiA+ID4gIGNwdV9zdGFydHVwX2VudHJ5KzB4MzQvMHgzYw0KPiA+ID4gIHJlc3RfaW5pdCsweGQ4
LzB4ZTANCj4gPiA+ICBjb25zb2xlX29uX3Jvb3RmcysweDAvMHg2Yw0KPiA+ID4gIF9fcHJpbWFy
eV9zd2l0Y2hlZCsweDg4LzB4OTANCj4gPiA+IC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAw
MDAgXS0tLQ0KPiA+ID4NCj4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gPiBG
aXhlczogMDY2NmUzZmU5NWFiICgic2VyaWFsOiBzaC1zY2k6IEFkZCBzdXBwb3J0IGZvciBSWi9U
MkggU0NJIikNCj4gPiA+IFNpZ25lZC1vZmYtYnk6IENvc21pbiBUYW5pc2xhdg0KPiA+ID4gPGNv
c21pbi1nYWJyaWVsLnRhbmlzbGF2LnhhQHJlbmVzYXMuY29tPg0KPiA+DQo+ID4gVGhhbmtzIGZv
ciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IGVmOGZlZjQ1Yzc0YjVhMDAgKCJ0dHk6
DQo+ID4gc2VyaWFsOiBzaC1zY2k6IGZpeCBSU0NJIEZJRk8gb3ZlcnJ1biBoYW5kbGluZyIpIGlu
IHY2LjE4LXJjMy4NCj4gPg0KPiA+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5j
DQo+ID4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiA+IEBAIC0xMDE0
LDE2ICsxMDE0LDE4IEBAIHN0YXRpYyBpbnQgc2NpX2hhbmRsZV9maWZvX292ZXJydW4oc3RydWN0
IHVhcnRfcG9ydCAqcG9ydCkNCj4gPiA+ICAgICAgICAgc3RydWN0IHNjaV9wb3J0ICpzID0gdG9f
c2NpX3BvcnQocG9ydCk7DQo+ID4gPiAgICAgICAgIGNvbnN0IHN0cnVjdCBwbGF0X3NjaV9yZWcg
KnJlZzsNCj4gPiA+ICAgICAgICAgaW50IGNvcGllZCA9IDA7DQo+ID4gPiAtICAgICAgIHUxNiBz
dGF0dXM7DQo+ID4gPiArICAgICAgIHUzMiBzdGF0dXM7DQo+ID4gPg0KPiA+ID4gLSAgICAgICBy
ZWcgPSBzY2lfZ2V0cmVnKHBvcnQsIHMtPnBhcmFtcy0+b3ZlcnJ1bl9yZWcpOw0KPiA+ID4gLSAg
ICAgICBpZiAoIXJlZy0+c2l6ZSkNCj4gPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gMDsNCj4g
PiA+ICsgICAgICAgaWYgKHMtPnR5cGUgIT0gU0NJX1BPUlRfUlNDSSkgew0KPiA+ID4gKyAgICAg
ICAgICAgICAgIHJlZyA9IHNjaV9nZXRyZWcocG9ydCwgcy0+cGFyYW1zLT5vdmVycnVuX3JlZyk7
DQo+ID4gPiArICAgICAgICAgICAgICAgaWYgKCFyZWctPnNpemUpDQo+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiA+ICsgICAgICAgfQ0KPiA+ID4NCj4gPiA+IC0g
ICAgICAgc3RhdHVzID0gc2NpX3NlcmlhbF9pbihwb3J0LCBzLT5wYXJhbXMtPm92ZXJydW5fcmVn
KTsNCj4gPiA+ICsgICAgICAgc3RhdHVzID0gcy0+b3BzLT5yZWFkX3JlZyhwb3J0LCBzLT5wYXJh
bXMtPm92ZXJydW5fcmVnKTsNCj4gPiA+ICAgICAgICAgaWYgKHN0YXR1cyAmIHMtPnBhcmFtcy0+
b3ZlcnJ1bl9tYXNrKSB7DQo+ID4gPiAgICAgICAgICAgICAgICAgc3RhdHVzICY9IH5zLT5wYXJh
bXMtPm92ZXJydW5fbWFzazsNCj4gPiA+IC0gICAgICAgICAgICAgICBzY2lfc2VyaWFsX291dChw
b3J0LCBzLT5wYXJhbXMtPm92ZXJydW5fcmVnLCBzdGF0dXMpOw0KPiA+ID4gKyAgICAgICAgICAg
ICAgIHMtPm9wcy0+d3JpdGVfcmVnKHBvcnQsIHMtPnBhcmFtcy0+b3ZlcnJ1bl9yZWcsDQo+ID4g
PiArIHN0YXR1cyk7DQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgIHBvcnQtPmljb3VudC5v
dmVycnVuKys7DQo+ID4gPg0KPiA+DQo+ID4gT3VjaCwgdGhpcyBpcyByZWFsbHkgYmVjb21pbmcg
ZnJhZ2lsZSwgYW5kIHRodXMgaGFyZCB0byBtYWludGFpbi4NCj4gPiBTZWUgYWxzbyAiW1BBVENI
IHYyIDIvMl0gc2VyaWFsOiBzaC1zY2k6IEZpeCBkZWFkbG9jayBkdXJpbmcgUlNDSSBGSUZPDQo+
ID4gb3ZlcnJ1biBlcnJvciIuDQo+ID4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgdGhlIG9ubHkgcGxh
Y2Ugd2hlcmUgdGhhdCBjYW4gaGFwcGVuPw0KPiA+IHNjaV9nZXRyZWcoKSBhbmQgc2NpX3Nlcmlh
bF97aW4sb3V0fSgpIGFyZSB1c2VkIGFsbCBvdmVyIHRoZSBwbGFjZS4NCg0KSSB0aGluayBzbywg
YXMgdGhlIGNvZGUgaXMgdGVzdGVkIHdpdGggUlovVDJIKGRlYnVnIHRlcm1pbmFsKSBhYm5kIFJa
L0czRSAoc2VyaWFsIGxvb3BiYWNrLCBwbW9kIHNlcmlhbA0KYW5kIEJsdWV0b290aCkuDQoNCkNo
ZWVycywNCkJpanUNCg==


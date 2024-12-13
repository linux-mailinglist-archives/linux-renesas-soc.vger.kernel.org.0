Return-Path: <linux-renesas-soc+bounces-11278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 845229F06F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 09:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4971188B21C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 08:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAE21ABEC7;
	Fri, 13 Dec 2024 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vxVmuIkb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA6D1AB6FF;
	Fri, 13 Dec 2024 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734079986; cv=fail; b=mB8yh66yVHSbcZ/VboF4CWLVCcapZToNfRgR6CE1mdoMvm6G+B+Bls4yLOuRuWyIc19n5kuSc3pAwPyfcBLlR4TxrIydtzRTajM1xLD4r/evYMkrUncGnh5Zv/eUvfvc7dJboRKzC+F+8+nyVaR/McOSFmIaFEZ4faGl7poWz+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734079986; c=relaxed/simple;
	bh=cwz1AVju2bcpcwqrdR6Ey1vFUBin4meWr35+ASYWRYU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I1V5DDA4FV9xygiQU7yng8JHQ7K7Z1pBNp1Jg1fFUuIf183awfvVYbWDw91OLSbD8BYfVynIlY1OI/8eckE2tXWlBDZLk7bHs416CfmWhxh7c2ueELxlzSz8w7gywpaUc+WQYQwWZOmQsRnjBXEzii9gvTDZmcKGTlDDiNoE7Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vxVmuIkb; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7Z3YMKZ4rqK0EKPydnd4Xr/z66HH6+6aEFJ41OaCmP7oWFxpd1I24fCMxRSLIxNNOrPZmPHu9z/rGpl3ytCzEEW1nYYPl2czgwC/g35g51DkWt9FfVI18w9HDzwbdA3UUEskPlWb7XEV9ptQFHr0SboGXpYjbwO6VctraHaYY2uvkTUR29vhs0Hdn9JvuyVlkLI8gS9EQrVsTY/8xW2umK05UROy/azAjrL9hR2ZXRPcgejnZC0PzOOwZ8imHum8E6aIL7n1eMsu67i8/ly4vc88SfLVP5x6lZZR0azrsxaX1HqUgFNCzCwWbzFNAIY5OOcZXB1L4vO8mG+DXuX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwz1AVju2bcpcwqrdR6Ey1vFUBin4meWr35+ASYWRYU=;
 b=nL2Hg0WwKetOmgFWyMg8xNvkPquYd0Fz27Vs04/nxzipPYTDoEwtBDHzDqY21SLwDMe3VuvLzL2zBiE29WYkM5YgD+lu40r6x4BT+Cmjw+jE4C8HRizw9xmv61nv/fRKTxiXFRjkWUjheQL4a+Ubomta3Jmn6kNm018LoyIpOmagfmmqsJ0d5230Hvs1rUZwKS77URqfZ/N7t6gYO69z26S05GWAJccuwVQyoHRPSSwlEuwZdKa8v5aagCMB5Y430zCW2rk5nKmlkfn+tyY9S/yTJ9KAPaUQHBFqCzm4QyEw711sKF1uKs2r5AwkSBO4/Tk4Pc0u4y1r6qFn8UiyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwz1AVju2bcpcwqrdR6Ey1vFUBin4meWr35+ASYWRYU=;
 b=vxVmuIkbHPlwcPypbqhFGtgcjXi2W39ckFRZra8i3Q42vmddjqrM+K+OuM96ddmAj1InxRtJ0Ka+VO90RryaEsbYZhHXZpuRnYa9zHSoXqBiE/2uBm1mTCzMIuMUeS1ebkr/uVSYbEN8zCo3ibQuGhm0MgfP1rzDJm8QD3kbjFQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYYPR01MB8151.jpnprd01.prod.outlook.com (2603:1096:400:fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 08:53:01 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 08:53:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 11/13] arm64: dts: renesas: Add initial support for
 RZ/G3E SMARC SoM
Thread-Topic: [PATCH v2 11/13] arm64: dts: renesas: Add initial support for
 RZ/G3E SMARC SoM
Thread-Index: AQHbRXE9a+5UO5StRE6PmIvgoclt4bLizEGAgAEhaQA=
Date: Fri, 13 Dec 2024 08:53:01 +0000
Message-ID:
 <TYCPR01MB11332ACB858BAB5C66FC4539286382@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
 <20241203105005.103927-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdWG6-7dvEYYZzmsprCGDAsgCqP62Us6OdoPLQVnhk3CgA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWG6-7dvEYYZzmsprCGDAsgCqP62Us6OdoPLQVnhk3CgA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYYPR01MB8151:EE_
x-ms-office365-filtering-correlation-id: c9be5152-8e9f-47eb-7dff-08dd1b538cbf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dUQ3L0swMG1xbzRySFFQUlQzVTllNWtORHF2NWVWT3I0THBFZktCMnRHSnBR?=
 =?utf-8?B?bGRqV2lMTDhhNkhFbHJqbGVRZ2NIbE5wQVBMMVo5SG1zUVYvRmhsLzI3a3k1?=
 =?utf-8?B?cjM0VkFyNS9VeEx4dGdQZmZJTTk2elJlaGsrVzRnd3ZKMmNYM3FDNndYZm5t?=
 =?utf-8?B?VzVmTXgra0lTSmNSRFVZNmE3K3NqL2g5UUIwRzM2akdOM3NjdHV4Wlk4Ri9P?=
 =?utf-8?B?aGxlaVpFb3h3K1ZKT3JaQzdaRmRBbjRCSG95U0VzR1pocGI2MWJFUDc5UFpO?=
 =?utf-8?B?YzhrMzdHK1k2c1ZFN1RGSE0vbzZZcHhpS0FNcHU0dzJSUjhSL0xnanU3T1V4?=
 =?utf-8?B?Z0tYVkNsUlBCcDM1azg2blQyRVNtRFhpS3VuNjJvQWEzOXkzZWlFSm9LZTB0?=
 =?utf-8?B?T3VicXJJaGMxVzEyOVVZQm5LYzBrd3gzeU1tRXpkeXJiZHR4REx5Z0owcy9U?=
 =?utf-8?B?N2s3MnRNT2NCQlZnd1lDR2lXeFBaTFJTQWxVaVA3YjlCbHRCN2Yyc0RpQ2F5?=
 =?utf-8?B?a1IrQ2hWV3h2aGNBR3B6RmR6aWk4a1Q1K25jNElxSHMvOGZ5bUFxcXd6dnpJ?=
 =?utf-8?B?d3BrZjJmVlBTcVFwVW12dzVlenBNVCtXMUEwQzhyMEovNUQ2aW54U0ZOd1RR?=
 =?utf-8?B?WHJqRTlmRi9pdUxtWm4rcGR1QkFqNmNjR0NoOG50bDR1TmhKMGUwTnlTemFn?=
 =?utf-8?B?S3F4RGhMcFhaVkFZbkRVcDlQZDEzTEF2U3VsTFV1dFFsOW1zaDFGVGR5aDdG?=
 =?utf-8?B?UXF2U21UY2VncGxOL3dmYk1tM3lVTHlranQzb2hzdmFGN0JET3JvdTFrYlR6?=
 =?utf-8?B?aXpheDQycC9FNXB3ZGhFeWpCS3RWNWdEVE5RMVJaZlU3RDd5Vk16U0NjL1Ir?=
 =?utf-8?B?dWd2RWpBS3J0czFPSnpmY1dscThFSTc0RmtoVXEvcWlQSDhkYUdoSm52cEJi?=
 =?utf-8?B?N0RmVkdCclN5UC9qazkyaDZPeEZZN0hrNjl4NEJBWmVHOVlVS0dDSlNxZ1Ro?=
 =?utf-8?B?dStMTWJCN3FTZWJBalRLajMxNUUrbHNwci9QbVNuNEMzQ2pCQ21WYm5XUFpz?=
 =?utf-8?B?UXNqRHk2WTR6Ykt1R2hueXRMQi8zRkt5Z25Sb3VHZjZNRVI3WVduMkRqYzRW?=
 =?utf-8?B?b0ZUSEt0ZFdMYkJzaTRkSnk4Q1p1Ymo5WUpESVk3NHhTT2ZhT29iUnFMUjdO?=
 =?utf-8?B?WWhOUDhJeUQ1QlBWaTVKa1lOYnk4blpBUlNhTGorK0d6YmpMbmc1NmJGYTM3?=
 =?utf-8?B?M25Wb05JdlJZbDZya3UzYnVCK083R0cwLzhEV2VzNmFRNTk2RGlLR1RpVE95?=
 =?utf-8?B?QlY4eWgxSUNjUXo2MUtQQmR2YnZYSmlMQ0tQYXZNNW81cFI1a3FpYVY1dFMx?=
 =?utf-8?B?ZUQxVlBmVkhFR213Qk5idnRkVUNiM2lVQStxeWU0cVc1US8xVnlXN3MxN3Jz?=
 =?utf-8?B?RWI4KzVFRk9sdWpDd0xMY2s5bVhmTXhvMC9RZS9VK3M4Q1VtMG82a3FGSVV2?=
 =?utf-8?B?UWlJeTZQbFNDekRXZ2x5MG85VDk5clJQanFXZ2VEeW1qYTV6bFVXQmdPMHBj?=
 =?utf-8?B?UVlkT29KcVdUY2loOHZzbmRKMWF6NmtZV1RSdEpWMzc5VE55YTJiUVJ1LzBH?=
 =?utf-8?B?a282cjZRaFRWOTgweDJnVFBlVG1TZ2JNQTM2aGhVS1U4cFRFa3hvU3dOK3c5?=
 =?utf-8?B?dDVEQld0c2Z2cnByZUFjdHRqN1Y5MFBVLzYwbGFjdFd3VkQ5Q2tkZVBHTTEv?=
 =?utf-8?B?dmJEeXRpS3hQUHJISE1LL3daWnhGODg3UGxsWFBzREl5S2F6YlNSYzBPNmQw?=
 =?utf-8?B?MkdPTTRtN244TUdDSERucXdURjcyckM3T3ppZkdQZkR5YlpSVnMrWW52RDdh?=
 =?utf-8?B?OC9pUCtIVzF0RDluaWZGZHJpdkErT3AxSEgwQ210Vk4raGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TnBhOFpQbEd3M1JMb0tnQ0Fpb2F0SkxLeklqMXhGN2tYV3RvME1vL09JWHpl?=
 =?utf-8?B?VnI5R2c3YzM0TjVOa1g0cFNxem9XQy9aQzhPblNveURldXRNd3VWd3hKUDh3?=
 =?utf-8?B?cTFrUDdRNk9kSzJFSnhJM1MwS3Zzem9UWjVLRmdsSkJ4NHlhNWNFV2h2cHo1?=
 =?utf-8?B?MnNBbVBIa3VTNCttNStDenZGSDg5U3Z1eTM2YlMzeC9Ldm1YZ0kvT2RhUUpO?=
 =?utf-8?B?dHNQeGk1NUFsdnZSYXYra01kS3Qyc0pTSWJUQXZEOG9VUlRXWmVXVTh3SVMy?=
 =?utf-8?B?YUQrTnFBZ2dHSjdOUHFXOU95UnFtUGVlL2FKWVRnWGFhbzlYdVZwV1NzaXVh?=
 =?utf-8?B?cFhxWldnT3JJSStSd3NnQWdIM29FMU5ERTJWMTR2Si9rWGxKeDRNSFN5UjM2?=
 =?utf-8?B?N0lDNnduMHlmaVBIUStacTlHN1J1SmY4RllyajE0aTU2bjhLZ2xUL3phZUhh?=
 =?utf-8?B?WXNaaEZoSFBNMm02aUpXUUxDWnVPcmJhMldGc25Zd0g1UXR0Z05ia040Q1Y0?=
 =?utf-8?B?a1NCVFg1c1l5RDRraHUrVTBVZDh4TDhoNGMrVDRzN0tXTm1SWEk4OXI3Sklr?=
 =?utf-8?B?Qm5EOWdxYlFDR3ZOSTRwT09BSHptVmhSVHp1dU1Cc1RJY1R3QStGYk85cDIx?=
 =?utf-8?B?b3IzOWJkVjdIOE5ITmtlZUl3ME8wRWxHRzJLaTl3djhOeC9jTG5HWHJ5MTRH?=
 =?utf-8?B?Y3Fsamw1ZlpLeFZYb053azJoVjZZMXhyK0VPSS9wakl5OGFhaVdJL0p6bHd4?=
 =?utf-8?B?dGlGNUNFa3lvQlB4NFVkUWdWSnJEL0g2UmFDblBEU2dMTXBVeS9ZeWJ0KzVp?=
 =?utf-8?B?eEhVNlJpT0wrS3NyMG5PdlVHQVpRWVlhOWkycy9ndXFCOFA4K1NvZy9ycUNL?=
 =?utf-8?B?eWEyR01hRUNnRUg4ejdqak9KdHI4MGhFNndXS3YvUnhVemlPWHB0bDNMZ3RG?=
 =?utf-8?B?K214T2xLeGJYQU1wcTVjbTgxRUpqYnB5SWU2bFNoRlVWdFMrV1piQzdDVWgz?=
 =?utf-8?B?bVdJTkFFR2hLMFRMcjJwK0dhT3pVNkdIdmJsT2Nhak9YaXgxWWNOcHB4em9E?=
 =?utf-8?B?WnFJNXV5d0MzL0xvWnhzK284MzVkK1kvK1d2d0dpSHBBK3VrOHJCSzJrT1Nn?=
 =?utf-8?B?aWs5Qlc5OFoyZXdiSUIzYVB2K20rT3QrWHBENlFhTk1lN3hiM01teVNaV3RN?=
 =?utf-8?B?YnB5VjArNzRreVR5S3NCSFFxTEUrMGdmSE12MmpSd1RYNGtpYTlnZW1zOERz?=
 =?utf-8?B?ZXZJUWVMN2dqQXBZMkp3QmxZRU9kY1BxYTAxM2VZVFZMV3JtVUdNZXpBc3Ay?=
 =?utf-8?B?ZnVRTzF3bFNaOXBsMHh3UDlPYnNkQWMyNWVkSkNHWTd4dXRpcW4zWGR6anMy?=
 =?utf-8?B?aUV1ZmlPbm9RSkxaUG5hU2NyelAraXNSNXd4N2ptbUJHVksyeGFPdDFQN0V4?=
 =?utf-8?B?VVcyRUFSSS9JWFFSZVJGeEF5YlJpTWhVTkRHRmNqNEVKNFZxREI3SmNNZUtN?=
 =?utf-8?B?QWtoaDVMSlhEcXFzVjE1Nk9reTlsOUkrQ0xzNHhDSG84YWxkZWo0Z0V1SEpY?=
 =?utf-8?B?Vk56VDRtdUpXc3BIcUVzbjVPejAreDU5ajJILzZPd29UTVhFQk5rN2dvNFNV?=
 =?utf-8?B?MnVXRDRWZHZJQ09RTzIrcmkrdFVvVTN6dlVVZUI4WmtOTXBKR1FIT2dVWGNK?=
 =?utf-8?B?VTFxS08za0tHSlJ2UVdKdXNxRVJpM3ZWWk91cEladzFCaGJWd2t4RXN0VkRx?=
 =?utf-8?B?R3hRTUFTUmc2RkhHS2EyYVVZV2tQS0tJY3d2Wmx1KzZsV0FCSUh6bGxCR09m?=
 =?utf-8?B?UmpvYTJSZWhMN2JWaXF4ZnVqSGpBQU5mS0JDellpUjhQOEpXSnoxMFhwS2Zn?=
 =?utf-8?B?N0lxSkY4TTNnL25oNzNTOWlMMFJSNXBLcmZNT1Y2b2NoUFJxQUd6c2VYRmRK?=
 =?utf-8?B?SEdUcFFtNXJya25sVnB5Z2FoQ2RlOER6ayt2VEloNFJjeERMWnM2Q1Z1MGI0?=
 =?utf-8?B?WDNKa0wyWHd6dWV3WlZYU3RaWnljSlpRdkhFOU9zVlY4VEVoVkxvQ1NXZ2hU?=
 =?utf-8?B?QXYyc0VuLzYxZGZyL3hzUTV1S2FWTzIveGlzeXhLTmNhVTYwVkRtZmdwZkhM?=
 =?utf-8?B?T0tTWVNjcTgvWjZNQkEwZEovMitxK3BwekkwRWgvbEhNTzh3Y3F1ZmNJYnZS?=
 =?utf-8?B?QkE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9be5152-8e9f-47eb-7dff-08dd1b538cbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 08:53:01.3814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8bQIoE/NKEnquvxrxdiFQgVYomtlghAgBNUIOo6uAJYBtXt1d2a8X7UI7oSa7xzTKu9KtX2LxtxP64pZzzEcBuuTMg7j2e/gfIv5kWvha40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8151

SGkgR2VlcnQgYW5kIFBhdWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTIg
RGVjZW1iZXIgMjAyNCAxNTozNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDExLzEzXSBhcm02
NDogZHRzOiByZW5lc2FzOiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBSWi9HM0UgU01BUkMgU29N
DQo+IA0KPiBPbiBUdWUsIERlYyAzLCAyMDI0IGF0IDExOjUw4oCvQU0gQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZv
ciB0aGUgUlovRzNFIFNNQVJDIFNvTSB3aXRoIDRHQiBtZW1vcnksDQo+ID4gYXVkaW9fZXh0YWws
IHFleHRhbCBhbmQgcnR4aW4gY2xrcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6DQo+ID4g
ICogTm8gY2hhbmdlLg0KPiA+IC0tLQ0KPiA+ICAuLi4vYm9vdC9kdHMvcmVuZXNhcy9yemczZS1z
bWFyYy1zb20uZHRzaSAgICAgfCAyOCArKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kN
Cj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemczZS1zbWFyYy1zb20uZHRzaQ0K
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jOGNmNjE1
NDVhNWYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9y
ZW5lc2FzL3J6ZzNlLXNtYXJjLXNvbS5kdHNpDQo+ID4gQEAgLTAsMCArMSwyOCBAQA0KPiA+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
DQo+ID4gKy8qDQo+ID4gKyAqIERldmljZSBUcmVlIFNvdXJjZSBmb3IgdGhlIFI5QTA5RzA0N0U1
NyBTTUFSQyBTb00gYm9hcmQuDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBS
ZW5lc2FzIEVsZWN0cm9uaWNzIENvcnAuDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArLyB7DQo+ID4g
KyAgICAgICBjb21wYXRpYmxlID0gInJlbmVzYXMscnpnM2Utc21hcmMiLCAicmVuZXNhcyxyOWEw
OWcwNDdlNTciLA0KPiA+ICsicmVuZXNhcyxyOWEwOWcwNDciOw0KPiANCj4gUmV2aWV3ZWQtYnk6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBx
dWV1ZSBpbiByZW5lc2FzLWRldmVsIGZvciB2Ni4xNCwNCj4gd2l0aCBzL3NtYXJjL3NtYXJjbS8s
IGFzIHBvaW50ZWQgb3V0IGJ5IFBhdWwuDQoNClBhdWw6IFRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0
Lg0KR2VlcnQ6IFRoYW5rcyBmb3IgZml4aW5nIHRoaXMuDQoNCkNoZWVycywNCkJpanUNCg0K


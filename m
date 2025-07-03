Return-Path: <linux-renesas-soc+bounces-19065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A19AF6BD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 09:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B34B4E24A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 07:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28850299955;
	Thu,  3 Jul 2025 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Sd9Ryp49"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B51299A85;
	Thu,  3 Jul 2025 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528586; cv=fail; b=kz8pPy5aA6lA3O4OPqMXm1xYHcawp2uoe88yh7WISIOuK++SG/SKEbwrycuSIEHh3s+NL62ZXAxtANJ7/uvBM0kBdp/IfDZsb8H8saiz8y2DVKAATnSkVhcpncnY8eTCT32BFpkHcyFqfc7E7QAIQf61NiJmfT08DgLfgh7Shbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528586; c=relaxed/simple;
	bh=geBeueNRqrCxYRUbdXwQl7GFaY+DCm18ju2pMGkKH5o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BlwVknzuMBI+Amze8fDT6OaeH1cKrIVe1DEfVIRtirW6DInRcipdbUFEn/7nYxHI3NKXB6Nxrir9cMwhhQEFVeaV0ces5t4jzW03iRckrvKS38TFMH4auU1hEfNREED0KXK1uSLqihonwfn0qcXMbgM+HjbDufpyBdhojCNn+Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Sd9Ryp49; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjgmFJhQp+M6qPBHINVHlh+xnOcFK/2hK7/9apo8UoLUV5I2cT91WAeEcWFPAx2XD6/xsjTGL9cGQAmGdCLaeo7+k2XyQUWFHXxfo/BeRY03GUdm1gH0ws6kI0tFgnpDAto/UjR5gyIaXRxXQBug5WccJeBe5guBgiFW+dLb+9icSjjxnrwkwYpOpeoxrxgK8jr9PxuS47wWWRf6h5LqOKp/LoRHm6K3JQ1OXheiv9xxTt/Tphq12SIfCRsC+Tg7CYMmUBngJs2cPvgB8EIbZZEgYC2vfRr0+54HME4Kdp3itaXZGebXp2mvQhmeQbS6j2tkxdZbastPJ5AA9jFnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geBeueNRqrCxYRUbdXwQl7GFaY+DCm18ju2pMGkKH5o=;
 b=khLP4F3xIEGYRK/PDnm6IJKcWtkQZ2ddzol37F37CuWNwLRTphW7LqS86y+ecZQ8q8AypOVhhG3+lkfaChAFxjRL8fgiRgZPdKGb23+njr/+KDtvDzDgoqoSCnGXg7EsnWQhkVb/jH6dpDg5Ix0Bnjuk6UFDH7NrEZZo9DpDBv1QufGH8w+HpH8kacuomP6EYQvuNsgrcw1yMPMcmWli2DtdJ2kBDxFnrBriZttzGnJCdiHxqsI7wYpznTO5a8FywaGxLVrLCPkrQyG6uu5wSLwK3Ry3KMwfJUFozU87RZvkqKEnwLKOCeSOdile43QM0ubRvJcpF3VDHK/EvfOvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geBeueNRqrCxYRUbdXwQl7GFaY+DCm18ju2pMGkKH5o=;
 b=Sd9Ryp49XrtvJs7bGf3Bv2KO1oMnQmPf7/sG3eyxWrCj3UAu3eaSm8gRE7UY+JO1f4CgwdYPlqA1cA2LflUspq/ZsHmEem0s7HIo2kU3j4BdAcPVURcRHfhhgGpfTgddsSXmh1+zfC3/ZdB/tJa1WzRuYqzTJxKaat+B+bNJc9s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB14262.jpnprd01.prod.outlook.com (2603:1096:405:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 07:42:57 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 07:42:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Topic: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Index:
 AQHbrVNDGj8C8kQeE0eZE1bPrrwQPbPEGWSAgFmCYRCAAAYYgIAALWkwgAKrHQCAAAVb4A==
Date: Thu, 3 Jul 2025 07:42:56 +0000
Message-ID:
 <TY3PR01MB113467E8D43A07ECDE07D12648643A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
 <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
 <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <25a4e9bc-4c96-4c9c-880f-e67223662f56@tuxon.dev>
In-Reply-To: <25a4e9bc-4c96-4c9c-880f-e67223662f56@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB14262:EE_
x-ms-office365-filtering-correlation-id: 87832ef7-d4df-4965-2b8d-08ddba053a21
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VEVvaVZMakd5OTRBVFVGR3NYTE9QTG0wT0pmK290VXdxOVcrQlB6T3VyL1lR?=
 =?utf-8?B?M0RmZVU5WnRnMU9EQVdGRWRPZDNwU0pSdHUzcFNLRkt0dWtHOGRWQnRRNEFs?=
 =?utf-8?B?TklGWGNQa2IvYnp6SjZPWVArY01hTFZ2OEhQMHFvbm1qYjlzazE2WkpzRVE3?=
 =?utf-8?B?S25TOXZQTUtZVXF4YjlMOUlIWW1ueXo1T1dxRkVEaTRzZUNnVkdVYVF6ajRN?=
 =?utf-8?B?TmpyRGJQTlAwTE1SN2szd2FrSlZ1Tnl2U05oQTFPOFY4NUdQOWNUelo0RlNh?=
 =?utf-8?B?a0VRV0IrUjFIVCtveXVWV0pXaDJSUm9ZeFlMSWUzOVgyeUFxWHd1dms2ZG4r?=
 =?utf-8?B?OGwyQ1U4S1lrVmJGa2h5ZDBkdGI5TGhMTC84VWsveEd0WWtYUzFRZWpFVWdD?=
 =?utf-8?B?ZFNJR0pnNlo3RGh1UVZLTEJ3c1FkWWtnOU5rc3kwbmYxR2JoUStob2lKLzZp?=
 =?utf-8?B?M1l5Yk5FKytYL2RtZTZZVlZpUG10NEFPbXR6YUhNdHFpWHdZV2VMRUFGS3RH?=
 =?utf-8?B?MWowN2xHZUc5dUl3aStpSGt3aWFyWXNydXpHZEJSU3A2cTROekZFYS82WGh6?=
 =?utf-8?B?UlN1dWRNUXZxZnJQSzl5a0FqV0dPTUltNElFWmwxZVFyczZvL1lHTmRmdGg0?=
 =?utf-8?B?M3NlNVR1VEd0OWxUdGNnRXJ0QzNpYkEycWY5YVZMWDFwbUkvU1RjeHRHZ0lI?=
 =?utf-8?B?TXVPMFVDZ21IMHFVYjlpUzZvMmlLa2NwcW1vNmdPNUNuNGRJSUh3WDNIV3BV?=
 =?utf-8?B?SER4dllZMzZLQzBjOGhtZlZBNDlkZHRVbEdqbU5ESFlFa1RTS2Z1b1hST2VK?=
 =?utf-8?B?citpMUNiZXc3YU1pR2pNcGlCbGs3RmtENm9rMzVkUXQ4VE5EVDdDM2g3U2Zt?=
 =?utf-8?B?Z2hxdmRqY2FORGhiaGxJbFEvdEFnR1FsRkEvK0t3K0lRTS9IKy9PVnAvNHYr?=
 =?utf-8?B?VTZYN2dLdHdxbVo2QzlKNkx3cStBUWpDL1hHR1QvSWd1cW5wN0Z1dmN2dkJI?=
 =?utf-8?B?bkJRZFN6UnkxNmZZZzgyakg4aHQxRUlCZHNXUFZSU1VMbjFRdmVoVGlsenBK?=
 =?utf-8?B?amowR3lqRFIyS0xPL2FBUnJrQlFKeDBWTmxQdXNXT0J1RWtobXA0Q0ZLdnoz?=
 =?utf-8?B?cFE0NUdMVFNCT0JzSkZiY29LSTV6YmtVbS94cnN6MWkyaEhxT3djcitRM3g2?=
 =?utf-8?B?ejhySzNMVW5wVFlnUFZpeXpBa2RpcStyS1l0aXRPNGZjRnQ2MEp2MFFZUVVQ?=
 =?utf-8?B?azJNMGQ5M3daWXkyL3lWakNDVVFDR1cxeEQvVDRLWEp0aFJ6KzNPd1A5bzNs?=
 =?utf-8?B?Yk41SVgxMWFxT3U4TDM2MW5LcEM5eUdRVjltL3AwTXRUSkc3Vk1oaVdDODUy?=
 =?utf-8?B?ZTl4TURkQThhMG05MFRPalJ3V28rVEI3NGZDbTEyN0dIbGxyS2pzWDBxMzNI?=
 =?utf-8?B?dDEycXUvQ2Z0TmQrQ0REQUZpMmc2U0ZQZU04NzBJRmNaK0RaWC9aT0tOb1cx?=
 =?utf-8?B?SHd1d05oVHQvM1RaTU1nWVlrNFVYRGZqdnA0UjFOSkRmRmJZM3ZPZzdEL1ph?=
 =?utf-8?B?L0g2cGtaNnFxeEMvRmQrRmM0L01ORWpIdlU2cUFLZFMrK2dNVlZpbnhTUDlL?=
 =?utf-8?B?NWV2RDZmVVpHT0liMk9kVkxicWd5dm1jMHY5MUNYc0l0MldGTWJRcmxLUEtX?=
 =?utf-8?B?ejZlRlV3bUI0UnhlWGZTQUoxWXVpdkk4WHZQcFJaZll6cVpuVzV6aFhENzVE?=
 =?utf-8?B?dWIzTFpMUi9TU3BCOEl5OHZ3eGRIVmwzMkFFcDJlc2JsK1JFRTZNeU1oelhm?=
 =?utf-8?B?alJxdjB3WFJzZGx4YTdsOEdMclFieC9tdU56dnlMcHRSSlE3QzNTZUFLSlN4?=
 =?utf-8?B?aGVudXZyeVZhRGVYRXhWMnZjbGVIMDFjcDA1MDV1QmtQNCs4VHNtN1RpVmhN?=
 =?utf-8?Q?ZcsXBfpzYMs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ak4vS0NRRkdaMmdCQUJLRExlRWpjMldOR2NVU2hta0lqWHdseC9TRktZZTFl?=
 =?utf-8?B?TzE1RURJY1E0alZWRWtjL1FValpWVjdYMHdyWDFDZTNMb0p5MlpackIzNEN6?=
 =?utf-8?B?aVJiWDhPYkhTVWZIbW5hekdEc1ZNM2hpejRMQ2wrelo3UUZ4eW5VbldYSXRx?=
 =?utf-8?B?cDJWNzFmUS82TmFER1FhOEJQSjNFMVJYeXhibEhtY3FpWDNoNkY3NUhtQ2E0?=
 =?utf-8?B?TUU0OE1hVm5RNys4L1NTQW5xT21NZUZzNFlSMmFXUW1ZUHVlSmpGb3c2U0ZD?=
 =?utf-8?B?VUdUcDZ2REpYSEpJQTI0UUxOZUM3b2dnZTVIU1VWNng4N2ZpalJQbjNjYjJj?=
 =?utf-8?B?NExuZ2tCREl2RzEwR0ZSd0o0NE9MNXIrZDRaSHVRS2dYSWErSk9NYXEwakZp?=
 =?utf-8?B?ZjRuc2gzZUwzdjAxZllBdXE4aktGOFdLUlp4UHgyZjYzaXFETXNPQ1hYczRN?=
 =?utf-8?B?d1E5eE9TWEovUGx0YndLSGdIb1NNT2JQMFRNZXRJaUxvdnkwZHg3SFdnRUtq?=
 =?utf-8?B?cGtFZnhTT1J6SEY0TXZXUlRZRENBWGVwSzhnWWhxbjhyYklKYTFXZlhCQnVK?=
 =?utf-8?B?SUE2bFd1bSswK3dBSVlQSWV5RVg2TE5SNjJKdHRYZzFBaVdvR2swOGxZWWpq?=
 =?utf-8?B?RmdPRlptUGpZS1U5UmZQZ3hqNHVqZnRpY2RCcEVsVWJFa2JTU0gvVWN2SWdz?=
 =?utf-8?B?dnR1c21kcDlyRk0yU3VzNEk0UXZLV3pWMUxVVmltbUZhTVJFNEJaejYxb2Vy?=
 =?utf-8?B?RExCcGxldEpRK3ZLdllCRUxUUWRpTGJGVmFtOEpUek4yWkNtMlg3ejlJL1ZW?=
 =?utf-8?B?cWd1MEhySVhnaHFTVmVkcW5tdjZoYlV1ZndoejFHNFhISmFxbUo1UEF5K05T?=
 =?utf-8?B?azE0bDNZczIzRXh0NDZCcHlwbWhqQ2tZRUVid3hNRVIwRlNNT3FUMlQ5eWtW?=
 =?utf-8?B?ZlFBVSt1QW9EanlKdWV5L3I1OUFGbmZlRDBHK0dDNUsycHlWNS9OcUNaUElR?=
 =?utf-8?B?cFB4WGJGVlpJeUFxaW9RelZNczlNTVdzOEZlYmk0dFhMRmlVSHhNZjhFbURv?=
 =?utf-8?B?YTZZM3RnUHI0TWRIbW9DZVJjdzZMQnNMcHBXTVNyRWd2Q25rMFZiTlVnck5u?=
 =?utf-8?B?bW1QNU8yQnMrY3IxcE9iLzlhclhJaCs5ZWRQdENPb21HNTJKTUVoR24yU2Q0?=
 =?utf-8?B?TkhzZXNpWHB3d1JWU0Vpcis1WFppSVZEeVltaXBkQ3ZrOXllK05GMDgzRlUr?=
 =?utf-8?B?Q1BGUnFtcGtyOU9DVjBSd2ZaN1BRUkFPak1tVEo1d3hKcmsvenNiVThpNWM0?=
 =?utf-8?B?VlVNU2RSaTlscG14cFFjS2wvSGlMN1JSbWpKQ1BJano4QnpIRG5pVzl4VTJl?=
 =?utf-8?B?UGFhSE9TRW9Dd3hEb1BzeUp6QjlzQmIycTVIaVk4a0tlWnlwMytuMDdVZjUr?=
 =?utf-8?B?bWIvRWRwV3U1MkZYTmlNUEYwdmc3STk1MHBkTjVvV0hiYmU4S09JMk5mVVpW?=
 =?utf-8?B?aEVqTmdlaGNnZHFwOUxmL21OV2R2Zi9VbG11cjE1dXZHZVRRNG85a3FkNVVP?=
 =?utf-8?B?OHVhZ2lBUjJzK2ErZ01tYWYxdnlzK3F2bVBNRnJQUnBiZkdnSWRZN0ZXR2xV?=
 =?utf-8?B?bFIwdEJHTzRtV0VIMzN4bW1ib3c1ZFNNVWlaYUlXbWV3VVhHK3RPY1VzcmVy?=
 =?utf-8?B?QkZTMm50eVBjUjBYWUMycjh5QTNuUmlDVnkxVm9PZXVDVGV4ZitXZ3I2U3pn?=
 =?utf-8?B?NlVBSVg3SWp1V1Q2WW1VUEp3TnM1cGM4eFdtQ1ZiVHBFeDA2TlF3alZLQXJv?=
 =?utf-8?B?TlEzUzBDdGdncU9uaktXVmlZRlJHOTBsQ2IwTkdGSVNWdTFyZlEzVkF4OWNY?=
 =?utf-8?B?amIvYWhoanU5NXptbHBKOXJ6ZVRzMkkreVpUTjM3ZGJkNTdhZmdBaVpzbEhO?=
 =?utf-8?B?QVpMM0MzRDFMcXBJTEwxM2Q4TnFTanNTeGl6ZkVuNGlxaExCd200Sm5oN1NV?=
 =?utf-8?B?U1ZmUkJ3VHZORTJyZFo0YlBDN2RFUmZKek1WeHpxNStaR1ZCblJPOEl2bklX?=
 =?utf-8?B?bTBhSm1YYUVxU01sTGtmMnZnMVNLQmxBS2lRWkxtd3RhUlBLaDJ1alVIMHY3?=
 =?utf-8?B?ak9DNnlNeXJZWVRha3VDWTIraGE4QVEwNTkzK1pYeEhSWGo0bzB0VnlTY2lq?=
 =?utf-8?B?ekE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 87832ef7-d4df-4965-2b8d-08ddba053a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 07:42:56.9291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2gtVnxDoNYeVcqjdKTDAxRVvu65dkAzaI2dySrxmDdHS/Lx1jMXI68wSuHIKpa/G1lgymGtulza5fDdG7maCNdYZoZEva9Jz1qzgzTyaK34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14262

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAwMyBKdWx5IDIw
MjUgMDg6MTcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNhczogcjlh
MDlnMDQ3ZTU3LXNtYXJjOiBBZGQgZ3BpbyBrZXlzDQo+IA0KPiBIaSwgQmlqdSwNCj4gDQo+IE9u
IDAxLjA3LjIwMjUgMTc6MzgsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIEdlZXJ0LA0KPiA+DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4+IFNlbnQ6IDAxIEp1bHkgMjAyNSAxMjo1
MA0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcw
NDdlNTctc21hcmM6IEFkZA0KPiA+PiBncGlvIGtleXMNCj4gPj4NCj4gPj4gSGkgQmlqdSwNCj4g
Pj4NCj4gPj4gT24gVHVlLCAxIEp1bCAyMDI1IGF0IDEzOjQwLCBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+Pj4+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IE9uIE1vbiwgMTQgQXByIDIwMjUNCj4gPj4+PiBhdCAx
NzozOCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPj4+
Pj4gUlovRzNFIFNNQVJDIEVWSyAgaGFzIDMgdXNlciBidXR0b25zIGNhbGxlZCBVU0VSX1NXMSwg
VVNFUl9TVzIgYW5kDQo+ID4+Pj4+IFVTRVJfU1czLiBBZGQgYSBEVCBub2RlIGluIGRldmljZSB0
cmVlIHRvIGluc3RhbnRpYXRlIHRoZQ0KPiA+Pj4+PiBncGlvLWtleXMgZHJpdmVyIGZvciB0aGVz
ZSBidXR0b25zLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4+DQo+ID4+Pj4+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4+Pj4+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4+Pj4+IEBAIC0x
Miw4ICsxMiwxMyBAQA0KPiA+Pj4+PiAgICogU1dfU0RJT19NMkU6DQo+ID4+Pj4+ICAgKiAgICAg
MCAtIFNNQVJDIFNESU8gc2lnbmFsIGlzIGNvbm5lY3RlZCB0byB1U0QxDQo+ID4+Pj4+ICAgKiAg
ICAgMSAtIFNNQVJDIFNESU8gc2lnbmFsIGlzIGNvbm5lY3RlZCB0byBNLjIgS2V5IEUgY29ubmVj
dG9yDQo+ID4+Pj4+ICsgKg0KPiA+Pj4+PiArICogR1BJTyBrZXlzIGFyZSBlbmFibGVkIGJ5IGRl
ZmF1bHQuIFVzZSBQTU9EX0dQSU8gbWFjcm9zIHRvDQo+ID4+Pj4+ICsgZGlzYWJsZSB0aGVtDQo+
ID4+Pj4+ICsgKiBpZiBuZWVkZWQuDQo+ID4+Pj4+ICAgKi8NCj4gPj4+Pj4NCj4gPj4+Pj4gKyNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9pbnB1dC9pbnB1dC5oPg0KPiA+Pj4+PiArDQo+ID4+Pj4+ICAv
IHsNCj4gPj4+Pj4gICAgICAgICBtb2RlbCA9ICJSZW5lc2FzIFJaIFNNQVJDIENhcnJpZXItSUkg
Qm9hcmQiOw0KPiA+Pj4+PiAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxzbWFyYzItZXZr
IjsgQEAgLTI3LDYgKzMyLDMxIEBADQo+ID4+Pj4+IGFsaWFzZXMgew0KPiA+Pj4+PiAgICAgICAg
ICAgICAgICAgc2VyaWFsMyA9ICZzY2lmMDsNCj4gPj4+Pj4gICAgICAgICAgICAgICAgIG1tYzEg
PSAmc2RoaTE7DQo+ID4+Pj4+ICAgICAgICAgfTsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArICAgICAg
IGtleXM6IGtleXMgew0KPiA+Pj4+PiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJncGlv
LWtleXMiOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgICAgICAgICAgICBrZXktMSB7DQo+ID4+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JnBpbmN0
cmwgS0VZXzFfR1BJTw0KPiA+Pj4+PiArIElSUV9UWVBFX0VER0VfRkFMTElORz47DQo+ID4+Pj4N
Cj4gPj4+PiBTbyB5b3UgYXJlIHVzaW5nIHRoZW0gYXMgaW50ZXJydXB0cy4gRG9uJ3QgeW91IG5l
ZWQgdG8gY29uZmlndXJlDQo+ID4+Pj4gcGluIGNvbnRyb2wgZm9yIHRoYXQgKGZ1bmN0aW9uIDE1
ID0gSVJRMTQpPw0KPiA+Pj4NCj4gPj4+IFRoZSBzYW1lIHBpbiBjYW4gYmUgY29uZmlndXJlZCBh
cyBUSU5UIG9yIElSUTE1LCBjdXJyZW50bHkgaXQgaXMgY29uZmlndXJlZCBhcyBUSU5UIElSUS4N
Cj4gPj4+IElzIGl0IG9rPw0KPiA+Pg0KPiA+PiBPSy4NCj4gPj4NCj4gPj4+PiBBbHRlcm5hdGl2
ZWx5LCBjYW4ndCB5b3UgdXNlIHRoZW0gYXMgZ3Bpb3Mgd2l0aCBpbnRlcnJ1cHQgZmFjaWxpdGll
cz8NCj4gPj4+DQo+ID4+PiBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwaW5jdHJsIEtFWV8xX0dQ
SU8gSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCj4gPj4+DQo+ID4+PiBUaGUgVElOVCBJUlEgd2ls
bCBwcm92aWRlIHRoZSBzYW1lIHJpZ2h0PyBBbSBJIG1pc3NpbmcgYW55dGhpbmcgaGVyZT8NCj4g
Pj4NCj4gPj4gV2hlbiB5b3UgdXNlIGludGVycnVwdHMgZGlyZWN0bHksIHRoZSBzeXN0ZW0gd2ls
bCBkZXRlY3Qgb25seSBrZXkNCj4gPj4gcHJlc3NlcywgYW5kIGZha2UgKHRpbWVyLWJhc2VkKSBr
ZXkgcmVsZWFzZXMuDQo+ID4+IFdoZW4geW91IHVzZSBHUElPcyB3aXRoIGludGVycnVwdC1jYXBh
YmlsaXR5LCB0aGUgc3lzdGVtIGNhbiBkZXRlY3QgYm90aCBrZXkgcHJlc3NlcyBhbmQgcmVsZWFz
ZXMuDQo+ID4+DQo+ID4+IFNlZSBhbHNvIGNvbW1pdCBjYWIzNTExZWE3YTBiMWZjICgiQVJNOiBk
dHM6IG1hcnplbjogQWRkIHNsaWRlIHN3aXRjaGVzIikuDQo+ID4NCj4gPiBBcyBwZXIgWzFdLCBm
b3IgR1BJT3Mgd2l0aCBpbnRlcnJ1cHQtY2FwYWJpbGl0eSwgSVJRIGNvbnRyb2xsZXIgbmVlZHMg
dG8gc3VwcG9ydCBib3RoIGVkZ2VzLg0KPiA+IEJ1dCBUSU5UIHN1cHBvcnRzIFJpc2luZyBvciBG
YWxsaW5nIGVkZ2UsIGJ1dCBub3QgYm90aC4gU28sIHdlIGNhbm5vdCB1c2UgdGhpcy4NCj4gDQo+
IElmIEkgY2xlYXJseSB1bmRlcnN0YW5kIGl0LCB0aGlzIGhhcyBiZWVuIHNvbHZlZCBvbiBSWi9H
M1MgU01BUkMgQ2Fycmllci1JSSBieSBkZWZpbmluZyB0aGVzZSBwaW5zIGFzDQo+IGdwaW8gaG9n
czoNCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3J6DQo+IGcz
cy1zbWFyYy5kdHNpI24xNDENCg0KTG9va3MgbGlrZSBpdCBpcyByZWR1bmRhbnQsIHlvdSBtYXkg
bmVlZCB0byB0YWtlIG91dCB0aGUgZ3BpbyBob2cgbm9kZSBhcyANCnBpbmN0cmwgZHJpdmVyIGFs
cmVhZHkgY29uZmlndXJlIHRoZSBwaW4gYXMgaW5wdXQgcGluWzFdLg0KDQpBcyBwZXIgWzJdLCBz
dGlsbCBpdCBpcyBub3QgR1BJT3Mgd2l0aCBpbnRlcnJ1cHQtY2FwYWJpbGl0eS4NCg0KWzFdDQpo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xNi1yYzQvc291cmNlL2RyaXZlcnMv
cGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYyNMMjUzNA0KWzJdDQpodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92Ni4xNi1yYzQvc291cmNlL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yemczcy1zbWFyYy5kdHNpI0wzMA0KDQoNCkNoZWVycywNCkJpanUgDQo=


Return-Path: <linux-renesas-soc+bounces-25028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB0C7D269
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 15:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E238A34A83C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Nov 2025 14:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF75242D84;
	Sat, 22 Nov 2025 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UEJYyqZr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A344A35;
	Sat, 22 Nov 2025 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763820932; cv=fail; b=WF5RIBLWp6cYss+6Cfhy/dJV3u/TkbDNg6mTujx3TVQ90bqV9+o1hr1u1tBHgRzuwOyG1nUv62dCXXUCk/l2jXEMS+jyhuZqGADk0GF0W0ynRPgfwFB/8svhTy4yuODaQtqG9YlnD7Nekilhldv936/Zp8yQknoUFziJ7yRe17o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763820932; c=relaxed/simple;
	bh=HiaJzWv1/yRt5vE/fvZmPrg3E/0Q2SNctGpu9VjUqM4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ahiKucNZT6Z2erFD+EjBfAYqSyzqcpphjUPsSqdqwuHHPPZ2LOltbsLgDD/XjyOfsNM+1DUEs2X7W7+wcZHlUIyFIeUWnGrsqKzARbGyk3zCHRt0r+EaHv+38ZjQAqEsy7m2+SwCaveq9uRGWrea0KR9G8xIqtInwBoQg3UXN24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UEJYyqZr; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjbOgBdC6kvAHBirzB2lLRdbiC30HO741uolotMC3KrigXMTrwfH+jd6i2aB8XLjcsGyp4LzC6YzFyPDqIOds+RrcXLJbzUa0cEpLO0ekMyaDiILJ60+Qfy25WWR5+hixgO03Yu8avjcVIuluzYuaZag8V3tW+DrnQ44xK3QHn68VIGgOOCJtCampKpcpqGXkkedBURgwypVY2cQ+9jZleXOi5gNM2QcraV9ddfVocaGQ2QkBx13PzaR/DX+b0c22z9fuxd8/OM5q7+f9YoenTbWyRMRcIAm13by+1nfUrOVgdi8v9iWM8JHyjhl+BjlV4XDAq9oAsDcWiJKWwYgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiaJzWv1/yRt5vE/fvZmPrg3E/0Q2SNctGpu9VjUqM4=;
 b=icrsXAe1ss1Y/eVujYhThtyH6sDuIvwNNINYMjXpWpwZZklaDlJVdDObrLOCAguzY8Zv5aXl7K3R9A/rLd3Zxny7iFN4W4czsZjj7J0OCqELoROdwIXAq5GnL8qQDJ+BvlCSnUAHuYjtz8lBrGUB+7xpdFE9Im71ndkUFXdeVfs/IzjKykQJLbDRJcCLImLKzjLqjIpSfEQYdOGlUM+EQ+8wL50QgzSLDobMi+xjBHiqhnX9qdmcVDNjO5CkaIxH0BPEeiVIGK3vbCk2v8xmkDEqDyo07ArdV4+XSFtI7lJu2k+eD7/9Mmf6G5iK948ZGSPGrMxNOzDv5YPlpUK05Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HiaJzWv1/yRt5vE/fvZmPrg3E/0Q2SNctGpu9VjUqM4=;
 b=UEJYyqZro6Xnf65958pjBIi+CkVp/9pFMe5/ira6stKJUtFHOMjNX0jxlebdohi5KiNR9zC39+RdbZaJLxZfj/pSfXhDL7Mb7ADDihb6ckL6R9oCrmGN01D7sLra1QDW2PeH/sJMaWn8lZMPeWi+Sa/rmUmU8aLSf06U6JqfDA8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15616.jpnprd01.prod.outlook.com (2603:1096:405:29c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.6; Sat, 22 Nov
 2025 14:15:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9366.005; Sat, 22 Nov 2025
 14:15:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, geert <geert@linux-m68k.org>,
	biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, magnus.damm
	<magnus.damm@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Topic: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Index: AQHcVVS6OMCUOoA+JkaffOYYEa9gA7T9XSMAgAFhEuCAAAs2IA==
Date: Sat, 22 Nov 2025 14:15:25 +0000
Message-ID:
 <TY3PR01MB11346A0864AF1CC5A3807E40C86D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
 <20251114105201.107406-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdX41rq-sd6_g1oCrQVPpgb-MXakpJ9mEbS0K+FY8Q7NDg@mail.gmail.com>
 <TY3PR01MB11346D401362BE3B37564C28586D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346D401362BE3B37564C28586D2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15616:EE_
x-ms-office365-filtering-correlation-id: 4dada796-2fa6-407a-e1ab-08de29d194a2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U09WNnNINzJubmFaUjdiZlYwa2xwVXpxdzhEWFVhTlhwTHpSZzJWLzBlOW4y?=
 =?utf-8?B?RDBCK05BaE1LRVozWWNFY2NmcXA2aFlLZW8weWVWY2dsTXFvQ3p3VzJOb0kr?=
 =?utf-8?B?NjQvRmM1citSSUg2b2ZBV1hRWlRhY1NRVHU3SVNWN1JFWjlDZ0t4VEJ0b01q?=
 =?utf-8?B?YWZETERLcG5uNmRjaFFac1BJc3ZUWTVJSlkrNnZaY2VIbmFQeXBGZDFBSXBr?=
 =?utf-8?B?bHhuN0NPdHVjUXVIRmx6TW00Z0lDVU9aTkU4S1FQa0gxMTVYZTVZQUpwRjly?=
 =?utf-8?B?VFNLQktWWTkyT2huK29HVC9FNmppODRSNnVKLzhLVjV2eHc0QVYxK0MvRG9n?=
 =?utf-8?B?NGRNVzF5UzNLVmliaS9UL0U4L3Y1S2NvNDVyM3JJbnZabkdrdVhXanY4aVZU?=
 =?utf-8?B?TytONjNiWGtrQ3h5Rys1T3g0RzUyVDAwUGpybVlYdUQrRUdJN1k0cmdjNG02?=
 =?utf-8?B?VzJiMldxQytOVmxSaWUyUFE5TWFNNFQwR0MrTEZoMWpOZVRBTmlSMlAraitW?=
 =?utf-8?B?ZVk5bllJZkZBc1RKMGpYS1JtMnVmMHZHQzRReEhsb3dtSnBoUENZZnlMem1D?=
 =?utf-8?B?NHVGNXBUYk5mYmVwV1Y5a0VwenhYNWpXaGRNTTdHbkNPRDFHanU5b05jcUgr?=
 =?utf-8?B?dHhVMXo5bWZZUFVDS2xZNjNSbE1OdXBNYkRJWHBsMXA3blI5ZFk5YmdOMFgz?=
 =?utf-8?B?dVB4NFhZSVpmc29UZFJKY3E4T3A1ckdzYktNV1FWM3NXaGRSK1FaV0VhWHVK?=
 =?utf-8?B?bExxdE4yOFIxclFvSXdhMklGOXFJTUxraEpRSHpkWFJtb0paYmN5VTA3VERS?=
 =?utf-8?B?Wm1aek50L1IrQmdvWjl0cms5d1NSL042NDl3aVVXcEFPRjlZeTMwMGVOVkhr?=
 =?utf-8?B?WEpkWXdFczFCU1lsZnd0dWJjWUpBT3lRUkpMZVMzVVpMTWsrNjR1aEZSZDk2?=
 =?utf-8?B?UVRxZ2k5bHhzcysvVzFQNDJpQk12c0J1NktiWFRQMTdZM21yYlU2T0tISjBy?=
 =?utf-8?B?ZlpRYlcydHpIbGJIN1p5cy82eHpNRCtsMlFxT2IrK29CaHEwRlVuQ1hIOXpP?=
 =?utf-8?B?ak0vU0pnTUNuWG92VjdxODl4aTRzaFpiYVRNWHNPOGRlSFhXb3A1T2FoVXBN?=
 =?utf-8?B?YUJnQWhCNi8zUU1XMXNMNnY1YXRjTmoyamU1VUJiN1l5VmFxYkVmU3poS1pw?=
 =?utf-8?B?blVJY2ZHZjc4MFQvU3BGN2dlRjhNZmhxU29VdzhESXNaWTJOd0twSW1mRVJF?=
 =?utf-8?B?bWtLQWhlbklSQlNCMUtESkR2c1BURWE2VkxCekphZlJNd0MyWEhQdlJPSzZZ?=
 =?utf-8?B?a1VmaEtrMU5rSVJ2YlNHV3k2ZXl6UUJ2VXNGZFAxUW0xV1U1REVNMkVDa1Ex?=
 =?utf-8?B?WmtyejlxWm96SUJsaGVlNXVIdENUeWRTS1pyQ2tmeUZURkkzRzR3TTgvY2dJ?=
 =?utf-8?B?andrcUxFcEloTFkwdnVGc3ZDQmEzTkwvWG9LdUIyTldwS2FybjZEVERCZGJl?=
 =?utf-8?B?SjUyTnZlYnJQSnB4dCsxUFVDamlERlRvbUJjY0R3Qlo5VzFBejJrdjQyOXdG?=
 =?utf-8?B?WUloYzZ6R0ZsaEg0RVoxVnkwVGJ5ZDFLM0NJU1drVFRGMXVCSUJRYUF5b0pz?=
 =?utf-8?B?RmVlWUhXMm9BRWh4cjc1dWFRNDh6d1dUN25yWWtWcWVtV1ZGV1F1L21tcTFr?=
 =?utf-8?B?S1VTUEFrWTdxVUhjS0V6MjV0azEyQ2t6eHdBRnpFOVNYclM5eFYvRS93cmtn?=
 =?utf-8?B?WDBFSWxkc0tpMEhoZWVCQ3N1enhaSllwV1hQYjBiTHB0ZTdzakJOMUgxU0w3?=
 =?utf-8?B?M3ZxYm10NnpLSmc5MkwzSkVuY1ZuVkZ6a1VyNEFYNnRvajlVazB4YzJrNWVx?=
 =?utf-8?B?dkEwVzVmd2JhMnk1SVhTWWtqMGpIOCtMMzUxKzNBaG5QaEdoN0VxR1ZqT2Jz?=
 =?utf-8?B?WlQxRm0ybDdYeElxdkF5elNKaUFLWEk0L3JackFpK3JBbWF0amxkUUcxMlNS?=
 =?utf-8?B?aDU1TFp3TGl0UVM4T2diU0o4eGlWWnBiZ2hYcmYvY0ltU0hkMmN5M1dOYXo1?=
 =?utf-8?Q?e6svAP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SEFDeWVBUXcxVEJlNXlEaXM3cDdjbjZYS1BKdGFFeUNmT1krNmQ0V3h4WlAw?=
 =?utf-8?B?b2hlRUZ0ZkNmL2RwbFc0SkhOOWV6RkdSTnlrUlQ2TDgrWDFzOEcwMEgrZEJ5?=
 =?utf-8?B?SUU3c0RWSlNSck9Nay9iSmY1V0UrMmcrdEd6VS9qeUNybUIzdWJPUS8wNzNl?=
 =?utf-8?B?eVNKVUNUclprbjl4V28xTnpaK0ZJL0ZrMk5KaHRzanovTW5ERDlzMXhIWXVm?=
 =?utf-8?B?ejNYU2tkRWt1ZWFvNVZTKzdPQmdqclNwY0t1ZGpaSFd3TFV0Zkc0SU5oRW9D?=
 =?utf-8?B?cFVRNTk0RDRWNi8xaXpqUmlnRm15UG94YjFlck1tVjF4YVcweGJwSUhsZDRI?=
 =?utf-8?B?bUZUdTZjNlJ6SnBXT1ZTQ2hHRW92UDJuWlFQSkZIcWNkSXVNRTdMVjF3Uzl4?=
 =?utf-8?B?VW5rSjRoUXBGL2V0ZFZHNU5LUi8waDh0QW1GNTJIRE55RDBuOEQ5WWtacXVn?=
 =?utf-8?B?RHlLaUg0MjJIQ0Y5R1F1TFdjS2NWU2VhejNKcUtDdVU2bW9HMk13ZmluSWJt?=
 =?utf-8?B?bzNQSjZ4eXludlpmZlhaR0xyTXZ3TkVPNlNhbHlGcDBhbFNRYkN1UDFxMzhP?=
 =?utf-8?B?d3AvK08xbGoyNys2ZEtaaitUdE1BY0QyYjVFUnFZTUt5dC9oSjVKT1E3L1M2?=
 =?utf-8?B?MDhGYU9PazNET3ovSXdDOE5mVjcvZmZ6MXZHVURFYTRxOG5vR3pTb2VsUWY3?=
 =?utf-8?B?NDc3S1BiWm90RVVHSmNCbG9TdkJtWTlPUzdWK1ZCc1oraTEyRUNXS1FrYWNm?=
 =?utf-8?B?Q2w2QkF0WUFpQ1RMQmovbWJoalhxVUgyVE0vZHBLR0o3Z2ZUMi9BSnYxZ1ZR?=
 =?utf-8?B?NWhzRnhVTGV5Vmpuci9BT1VEWEE2ZHlKMzVvQVZ4eEpDakl6MEg2NFMvZk8w?=
 =?utf-8?B?SEMzN2p2aHBxRFR2Qm96RkFaY0VlK2M3QmlYYjZkMHV1U01pWml2L1lCZnZX?=
 =?utf-8?B?ellUeUdaNHJqUEFmTzV4aTRXNWZSajVXcTNoV3g5OWt2dGZaRVlmS0U0cVY4?=
 =?utf-8?B?YXZaaDA2ZGhHWllkRkdRaERjSkxCNTVwM21qbTZ4ZXd2d09vQXNwcE9wS1lw?=
 =?utf-8?B?dXlVWEdkS200aTExWDN2dlY0SS9ncDc5R3RjMzYvWStkT1NsZlZsdGhnTDNt?=
 =?utf-8?B?ZkwxSGt3WFFMYzNDNzlncFAwQUlZTVdGc2pkcFE2UWd4SnVIa29acGYrQXo2?=
 =?utf-8?B?UE9HcTFUTVlHL1oxeU1JblJaQ01zMHQxaVNsUmVlQUwzVkk4TGdRNW8vZEkz?=
 =?utf-8?B?eUZOVG1ndjhGb1Y3bDBaZXhmWXhId1RGbzdhTEhseUpsR0pWNmIvYkFwRnVY?=
 =?utf-8?B?bUpyaWEwZ0FYbWZpamhVZTAzNVBVQW9QUStHcElpdERMT01HRGJ0R3lzVndF?=
 =?utf-8?B?WXZpM0phK1VsM1pwZ1JvR0JtTzZEalZjYWRkdkRYaFBPRXdzenVLdWs2dThQ?=
 =?utf-8?B?VFhQUUkwNnNTdFdLRmw0UHVIK0tGOVhUN1hnOElXaTdjMWF2TmtSNjhEQjBR?=
 =?utf-8?B?MmNIalUxQjF1MGN3am5lbytpazdkdkw5VU5ZZ3IwSktsL1ZaZllVbzl6cWl2?=
 =?utf-8?B?OTM0NWFhMTJnc085ZCtTVlZnZ2tsUFI1UVFXaUVvZXFvWW9CdU9sWEIyY0NM?=
 =?utf-8?B?U21mQ053dDNYbndSbGFLeWxQWkdhVUlOcnAvTzZINW5mSmtKbUNmNVJ3dHhY?=
 =?utf-8?B?azBsOE9HU0ZQeHNIR1pEajJOUXlISTU4UyttbmFhakZ6VHdOdXZIWDZBak1Z?=
 =?utf-8?B?VXdHQkJqMEdzcnVaY2UybTdpcGE0M2hGakU3d0hHUG4xUkdPUE0vUmd1NEZo?=
 =?utf-8?B?WXpoUFpSbXZKWlhmKzR0U1ZsRWFnVnNlQi9hWVJoMkVjSFhwWS9lZHNqQU9q?=
 =?utf-8?B?Q1dON2dXc0pDYktlYXF1dmE3ZXZ1dHZqUFl6N0VWWU1RSlcwNkJLYk9DaE1U?=
 =?utf-8?B?eWRwdm85UWJ2NDhGdTQyZXVqM29XOEZSdWJzbkNqYVFIcmNlWUZLb3JGeG5Y?=
 =?utf-8?B?NjdXQjByK2ZwNHd6SEZUTlJFelNsSDN3ZCtoUEdBQVhuMC8yWVlYbElJNmFI?=
 =?utf-8?B?KzFMdUg4NlNrcmVBNHpmcVQ1TmJsSVZkc3Q1cmZFRmhSRitHakFlYWtGdnJi?=
 =?utf-8?B?dkx0dlhpUXpPTUU5VXlvMTc1QUhwYmUrbjNib0p0bzJqQXFoYk9DMTlBVEkz?=
 =?utf-8?B?cVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dada796-2fa6-407a-e1ab-08de29d194a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 14:15:25.1750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnf/ixz1Kuh5khyHASJscaRqxLQGOFDVF/2gd3C9ZN5BoI7Dus+fvWmM0OEMIktIg2kTHTY9okiGbxdM8QiXMoVivNMGsdvdEdAq3fmcWr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15616

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiAyMiBOb3ZlbWJlciAyMDI1IDEzOjQ5DQo+
IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjMgMDEvMTNdIGR0LWJpbmRpbmdzOiBzZXJpYWw6IHJlbmVz
YXMscnNjaTogRG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IEhpIEdlZXJ0LA0KPiANCj4g
VGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4N
Cj4gPiBTZW50OiAyMSBOb3ZlbWJlciAyMDI1IDE2OjI5DQo+ID4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAwMS8xM10gZHQtYmluZGluZ3M6IHNlcmlhbDogcmVuZXNhcyxyc2NpOg0KPiA+IERvY3Vt
ZW50IFJaL0czRSBzdXBwb3J0DQo+ID4NCj4gPiBIaSBCaWp1LA0KPiA+DQo+ID4gT24gRnJpLCAx
NCBOb3YgMjAyNSBhdCAxMTo1MiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToN
Cj4gPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+
DQo+ID4gPiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIHNlcmlhbCBjb21tdW5pY2F0aW9uIGlu
dGVyZmFjZSAoUlNDSSkNCj4gPiA+IGZvdW5kIG9uIHRoZSBSZW5lc2FzIFJaL0czRSAoUjlBMDlH
MDQ3KSBTb0MuIFRoZSBSU0NJIElQIG9uIHRoaXMgU29DDQo+ID4gPiBpcyBpZGVudGljYWwgdG8g
dGhhdCBvbiB0aGUgUlovVDJIIChSOUEwOUcwNzcpIFNvQywgYnV0IGl0IGhhcyBhDQo+ID4gPiAz
Mi1zdGFnZSBGSUZPIGNvbXBhcmVkIHRvIDE2IG9uIFJaL1QySC4gSXQgc3VwcG9ydHMgYm90aCBG
SUZPIGFuZA0KPiA+ID4gbm9uLUZJRk8gbW9kZSBvcGVyYXRpb24uIFJaL0czRSBoYXMgNiBjbG9j
a3MoNSBtb2R1bGUgY2xvY2tzICsgMQ0KPiA+ID4gZXh0ZXJuYWwgY2xvY2spIGNvbXBhcmVkIHRv
IDMgY2xvY2tzDQo+ID4gPiAoMiBtb2R1bGUgY2xvY2tzICsgMSBleHRlcm5hbCBjbG9jaykgb24g
UlovVDJILCBhbmQgaXQgaGFzIG11bHRpcGxlIHJlc2V0cy4NCj4gPiA+DQo+ID4gPiBBY2tlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPg0KPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHJzY2kueWFtbA0KPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHJzY2kueWFt
bA0KPiA+ID4gQEAgLTEwLDE3ICsxMCwxNiBAQCBtYWludGFpbmVyczoNCj4gPiA+ICAgIC0gR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+ICAgIC0gTGFk
IFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+
ID4NCj4gPiA+IC1hbGxPZjoNCj4gPiA+IC0gIC0gJHJlZjogc2VyaWFsLnlhbWwjDQo+ID4gPiAt
DQo+ID4gPiAgcHJvcGVydGllczoNCj4gPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gPiAgICAgIG9u
ZU9mOg0KPiA+ID4gLSAgICAgIC0gaXRlbXM6DQo+ID4gPiAtICAgICAgICAgIC0gY29uc3Q6IHJl
bmVzYXMscjlhMDlnMDg3LXJzY2kgIyBSWi9OMkgNCj4gPiA+IC0gICAgICAgICAgLSBjb25zdDog
cmVuZXNhcyxyOWEwOWcwNzctcnNjaSAjIFJaL1QySA0KPiA+ID4gKyAgICAgIC0gZW51bToNCj4g
PiA+ICsgICAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzA0Ny1yc2NpICMgUlovRzNFIG5vbiBGSUZP
IG1vZGUNCj4gPiA+ICsgICAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzA0Ny1yc2NpZiAjIFJaL0cz
RSBGSUZPIG1vZGUNCj4gPg0KPiA+IEkgY2FuJ3QgZmluZCB0aGUgbm9uLUZJRk8gcG9ydHMgaW4g
dGhlIGRvY3VtZW50YXRpb24/DQo+ID4gRG8geW91IG1lYW4gIlNlbGVjdGFibGUgdG8gMS1zdGFn
ZSByZWdpc3RlciBvciAzMi1zdGFnZSBGSUZPIj8NCj4gPiBJc24ndCB0aGF0IHNvZnR3YXJlIGNv
bmZpZ3VyYXRpb24gaW5zdGVhZCBvZiBoYXJkd2FyZSBkZXNjcmlwdGlvbj8NCj4gDQo+IEJhc2lj
YWxseSwgaXQgaGFzIDIgbW9kZXMuIEZJRk8gbW9kZShDQ1IzLkZNPTFiKSBhbmQgTm9uLUZJRk8g
bW9kZSAoQ0NSMy5GTT0wYikuDQo+IERNQUMgY2FuIGJlIHVzZWQgb25seSBpbiBGSUZPIG1vZGUg
YW5kIHRoZXJlIGFyZSBzb21lIGhhcmR3YXJlIGRpZmZlcmVuY2VzIGJldHdlZW4gdHdvIGFzIEZJ
Rk8gcmVnDQo+IGJsb2NrIGlzIGFwcGxpY2FibGUgb25seSBmb3IgRklGTyBtb2RlLg0KPiANCj4g
SXQgaGFzIHRvIGJlIGVpdGhlciBhIGNvbXBhdGlibGUgb3IgYSBib29sZWFuIHByb3BlcnR5ICJy
ZW5lc2FzLCByc2NpLW5vbi1maWZvIg0KPiBPciBzb21ldGhpbmcgZWxzZQ0KDQpJIGJlbGlldmUg
aXQgbXVzdCBiZSBhIGNvbXBhdGlibGUgdG8gc3VwcG9ydCBub24tRklGTyBtb2RlIGZyb20gYm9v
dC4NCg0KSSBtYXliZSB3cm9uZy4gUGxlYXNlIGNvcnJlY3QgbWUsIGlmIGl0IEkgYW0gd3Jvbmcu
DQoNCkNoZWVycywNCkJpanUNCg0K


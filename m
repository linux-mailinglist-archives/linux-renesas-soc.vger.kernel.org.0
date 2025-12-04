Return-Path: <linux-renesas-soc+bounces-25549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B60CCA2D15
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 09:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B740305D1CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 08:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1573346A0;
	Thu,  4 Dec 2025 08:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FyK17dnF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0683321D9;
	Thu,  4 Dec 2025 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836595; cv=fail; b=gFsDYkBqt7uLrXMbVSXoWGJMWsC5g6vDO6OHUVymS0gq1PNkWJzhl3PycGAoQsKGs0Hc16ZUJ0pC6EEZcGVzxyBhA6mBLNxquZrGlozkYAhRHgF6b1A5yASni+nOalA5c3S86L6hOBSNHdzOBFwkoUnBzQY6uAJuMq2BnM1MKmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836595; c=relaxed/simple;
	bh=OuJGFsPMWv+OwvTZPGO00ZDvusDYbQnxGv4pTs9BZ8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z0vOdXRVO8/W3NYSi2rc6UdKfHMwyXDxOVMS1b0lkGfWnR8qfr28/e428IvlyBrnj4cTfNnjKKZMkoMONRQNzdtt7Gmse532ZO4kxvvYTjZHD/0QT8tBW5zvCgQoQMAHI23Fh2NING+jxNqsNZo7GL01mE7h3aeYY9NfuOy5iHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FyK17dnF; arc=fail smtp.client-ip=52.101.228.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0AZgAUeYkCKCHC/gtZpUuAKmR9kiJR4crOrO1Rjlzktz7tuvRx6z3ukebQP9TFw5QAYA0vAveMMxmMZFXP32enNq08oM8W8BzOi0Ik3ooJpplRVLyFyEqrLiDIsLrj7OpOeYTF+ay/4bhlXwa+U/tOTw+2pblsWVruYDXakd0EIA9ZFIFjklKxwd7NhmdQkFqeZ0HUNMXkL8kKz1g3mBkPf+tPbeSo4tWnBbncQSMYUe82zCBQ6P60P29cH37UMixUQzCPzSZC0s1ecRnETC0vaLqsn0hj07izBd168Iz0KLEPsP3yActkLjZvmLgqM35eFj64hTdgRZ+UMIulXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuJGFsPMWv+OwvTZPGO00ZDvusDYbQnxGv4pTs9BZ8U=;
 b=F+XozVO7yZv9k5+ffmrZKjvlmg4LpvyXbzjG1jUXL8NuveujdtLI7jagfE76QAVKRRsJvKmRQU3XvuWuMFD7CNNesCf0xyNbup9PkKHG2XZxUQQvLlzn+OUsvHFBFlueHAEZGrvaeu3UuiV34yyHZp/JP4TYTOffn5OAanco2yM462tIFWBqpetajYDFu0mN8bPGRveOi+UJlEEi4mUIxszGpOvmz735OZqvp51HUOAD/AjrlS0dT8KWR2Uz1bNqD+uL4sAfG6Y3Fls/wnuJgcfnZaIGZmFFRtxv+mGzVfk2QXhD+sNjg+ZHB0llxbAvToU659bUnxnrdt5gzbe+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuJGFsPMWv+OwvTZPGO00ZDvusDYbQnxGv4pTs9BZ8U=;
 b=FyK17dnFr4femtiWZ53akbR3lcN6odLZBZShIAu94Jzg9iqq1vUSF5uVGBtHXOTwFqWiHpeF+A3K5n1NnSuLFeqghoNbpYf9F40bjEvnv33uu7Sb6vu6STamzP3ZVA9ZkTX5B/E5Hk2aARZZYZ7XnKLBxmn1/1gzfStAE4prwm4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11857.jpnprd01.prod.outlook.com (2603:1096:604:22e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Thu, 4 Dec
 2025 08:23:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 08:23:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Topic: [PATCH v5 01/17] dt-bindings: serial: renesas,rsci: Document
 RZ/G3E support
Thread-Index: AQHcYU9OIzH/bfLdDU2wN2SL4FuR27URJjOAgAADsQA=
Date: Thu, 4 Dec 2025 08:23:06 +0000
Message-ID:
 <TY3PR01MB11346AB991A69C28F3D7D512286A6A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251129164325.209213-1-biju.das.jz@bp.renesas.com>
 <20251129164325.209213-2-biju.das.jz@bp.renesas.com>
 <20251204-cute-slim-husky-aa4dc4@quoll>
In-Reply-To: <20251204-cute-slim-husky-aa4dc4@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11857:EE_
x-ms-office365-filtering-correlation-id: 42af960e-c779-4ff0-c570-08de330e59c5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dFNjSDN1eFo5c0podGxhN0czS1BhV3cyRk9FejE5dy9qRjhiQjlsc2J2RjIx?=
 =?utf-8?B?Y1JlbVlxMkRwbkw0b29xZFJSeUNhUzE4RnB3YzhUeDNod1hHNUVKV1AySjhX?=
 =?utf-8?B?ZEprRVNLbW9ONVFnNHZTTllxRWFsOTlNOTRUZXl2SnhKbk54dXR4WGgrL3lP?=
 =?utf-8?B?OWNNS3FQSUR5cWJFQjdlWHlRS2pqTldUYStrN0ovSGM4VnF5K2NaZlluZ2lR?=
 =?utf-8?B?cHNzTTdpYW9tV1lVYmF0aWNycHFOSk41MTJteitjQXNpYjYzWU9sOWVxcTNa?=
 =?utf-8?B?S1c5L0NNRW5TbzYrM1FyVVR5VHF5blBsUU5xazVNNE9EMTkvWnRJSzVjSTJ6?=
 =?utf-8?B?T1Ewb2pNK3hYUThveE0yQzUzZ2swcTdRTUt0dS9tVk9xM0VCTDlONEhMaHU3?=
 =?utf-8?B?cWlVcTE0NzZQRHNheVBlVWRqWDdJWWpnSEI4WUQ1UEZrTEVodHFWMERudW1H?=
 =?utf-8?B?NnlBZ3QrcytzK0V2RE9FMXYxemJTTFp4S3VGdmZCT3JIYytvOFBOcU1uajZZ?=
 =?utf-8?B?NVN5U1pBamdBa3Zya3hha01nZFhtaGVQOUFXaXZjNzdqRUZpYTdEYzYzdjdE?=
 =?utf-8?B?b1IzUEcrM2s3clQxOUpGQ3kzazR0OWhjd2srZmpRb3JTSUNzNVhQakpTZEw5?=
 =?utf-8?B?ZDh3QWlNOFhMdThxSllqV1ZvODk4bFhHTEZDdVp0U0Jud1kzM3NTZVFSaVMy?=
 =?utf-8?B?QXlXUEl1T3ZkVGlnYWJPLzJGUm85WElkYTk3cmJZdUR5ZU5YLzk5azVRVUpk?=
 =?utf-8?B?WHJqYVo4MytPOTY2aGg2Q04rbzM2SGc5c1V0THJjSjZuWGpOcHQxQ2tTcVRF?=
 =?utf-8?B?RXB2b3FRa2VZdUdQdnliN0dWMDhpcFh3MzU5ekN2VUZWN3VuQ2VIejFwRVdl?=
 =?utf-8?B?ckNqTjVzdnIzSUYwVVl2eVBFY3pENDlNdjU2anZnblc2OVlQL3ppYS9Ya3hs?=
 =?utf-8?B?ZzdLLzFrSjZ4WmVMYzByTjlrSW5MTWwxbjN1b1pqOVJzWjQ4azVROUk1WEhU?=
 =?utf-8?B?eVl4S2dTczlIVlZyc0pISU5lU2xYSTgzdDNNaXRScFQxMkU2Z1NBVW9LWGpp?=
 =?utf-8?B?RFFDT1h0UGlYWVFKTDVlUGRxZ2tHNk05K0VGdEp5Uk9yZVd0eDhYclZyUzNW?=
 =?utf-8?B?QjUvVmhmQUJsc3hwQWFsQnFsV3ovN2tIWm03ZERzeXpVNzltVGZua0ZBUWp5?=
 =?utf-8?B?c2lPRjVPbDE0UGZ0SEVJaEFKZEVRSW1ONXByREs5ZUlHWFZYRUR3dlUwdFRB?=
 =?utf-8?B?b05KbnJ1LzJrdjRSd0RqOTU2Qk5ZRlAzZEdaK3Jqb0dhaTN4Ujk3VWNmSkNo?=
 =?utf-8?B?WUtHQksyRUw5QTlEZGd2SEpMaVduZ2FkOURHSlBlN0FCdjJrdnJ5UEdHay9W?=
 =?utf-8?B?ckhzNkZOazV6TFBLN21nbmF1eDZWY1NYQ2NuQVYwekhOUEVMejFvTWwvaGNV?=
 =?utf-8?B?SkhWU3F1UElpN3V0amZWMEhFbnpNcFlzdjR4YUtnQ3E5Z3ZnRU1nTVVuNU9l?=
 =?utf-8?B?VE5SdkZzOE9PT0JFUnNPQTRQU0k4VXM1WkQ2ZlcvRnFUZzJQYURiSWczS3lt?=
 =?utf-8?B?OXJ6ZTNDZHRVS2FmVUJwV1pOUytrRzhaYjlVbG9tYXdPNVBLSDlURVRuMmR4?=
 =?utf-8?B?cjFFRXNVbFMxb3VzVDRQU2NLSXlMaTFkNXhEaDNIOHZUZnlDZWhHZFdVaS8w?=
 =?utf-8?B?RzlONWs3Z3hzcXlTclgvVUFKMG1PVG5lLzV4NE9QKytmNVR0VHEvZXZLejNy?=
 =?utf-8?B?MXJ0QWNKc1JpQkQ3aG84RjVVcFdTQXJXemdPV0FpZ3c3VEowZW8wcENaNWJB?=
 =?utf-8?B?b1Q5Sm1ZL1hLekxHV1FLQkJESkszWHdFTGtrVU05c25xT3ZsM0Ird2xUZDdi?=
 =?utf-8?B?Z0xBazN2K3hrRElFNUY1bUFiZnRzMW8wS1EwaG5XbjBOdElLTm1QVWNwRmxx?=
 =?utf-8?B?U05vZWFwZFdGK0k0WnpndEVLV3BWYzJ6VGduY3NCYjExMGd2eVpNVko3ZjF0?=
 =?utf-8?B?N2xYd2ZEOWxWQUdMcXJlRVEzT0VjZzIyNWw4QzFWUU5nSHZ2NHNoSVBCMlNS?=
 =?utf-8?Q?Mdamce?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTQ2TVNORXNSdnNoYVE4b2p6VHFnYjRscmVsTGFzOFpCNVdRa1RQMGIwQTNo?=
 =?utf-8?B?UVNIdld5U1dSa0h2MXMwYWJjeG1IdGpyYVBXak5hWWxpbnNLUGdPOUpzY29R?=
 =?utf-8?B?cnFoaTdPMmU3M090WTFTUWpsSyt2c0JGaW05SjN6U3o3MS8yVmxaWkZXMnRP?=
 =?utf-8?B?Vm5rODZ0M1g1L2N6ZG9kcHNIUjR5RHhwN2hUclpyL1M0TkRFbnFUUksydER6?=
 =?utf-8?B?NnJSQU1mRVVLaDFJSERQK1BIM1NBdWxQVXl0WFdDajZhaS9VeFF6ZDg1b1hv?=
 =?utf-8?B?Ui8xa1d0SUZLZStXQVh6S2l0K3hZZVBTVFo5VktzcDNFa3VVemJuai9WQmVS?=
 =?utf-8?B?SkhDOVJDMTNGNWZWcURSaEhOSkF1N1ZiTjlOZVhGWHdhUHFEWk1QeXZRYXd0?=
 =?utf-8?B?VlJrUG95VjVKQmJUVXRUS1l6VFBPckI4cC9JSTRQaGhLbi84Z0JnNUp5dmxS?=
 =?utf-8?B?S1dZVTVWMEcxYjFQNUFXcmU2SHdMQjhibGs0WEF2VGY2WlZaVlovZ3J5NDhP?=
 =?utf-8?B?aEdUZXhwaENZS0YxT0pyOXBkbWs0RXF3WFFXS2xZRnZMbDVJVzVPM0wyUnUw?=
 =?utf-8?B?Rm8vci9MaTZjWkJpakZSaTl0NktwMyt5blVoZFJVMlU5LzNMSzhBc2JLWXBL?=
 =?utf-8?B?VWRnTC80REU0K2ovQXMrc2ZlVVRqSnlxSlZTQi9pZnlkaXV2TThQMzgwb3ZB?=
 =?utf-8?B?MTFnbEhYWmh2K25YVFkrL2dFNjlOdWcwVmxYZ1ZjZ3VuZ3o5TXdRcm43dFNt?=
 =?utf-8?B?THpDYUtLd0NSN1NsdERIS2M1RzV0OGtZd0YyUnhCVEcreTJBY21PNlFoSHBD?=
 =?utf-8?B?SmsvK21SZFJKazBHQStxL05DU293dVpMV1pOQS9tYTNOSkM2T2lEY1JHUjZn?=
 =?utf-8?B?WFpJdlNjc0dSMk84aUl4a0Y4Lzl1VlVTQnFuZTRUMWZ5SXhUaUVRcmtWdlN1?=
 =?utf-8?B?c09WUnZUOFVXajRCYTViWGZUOUNMWjJ5K2NWSTNobkdsM2JvZDBiNjZyUEJF?=
 =?utf-8?B?Njl4bFhSelpsZHR2MnJWTlJxaGZkSVBLUVlJNHh5VFptbTlEaHF3SkVEbkU4?=
 =?utf-8?B?R1lyWWFhTzl4Vzk5Zk94UDZIZUtGYVlLbTBLRnNERG0rMVNsMVlrSkhZK1VK?=
 =?utf-8?B?OG5qZFhsWnV6Y2EySjRsTnA1b2dFQmh6c3ZGV3VyYmhINmM4QVVMZkxKS3g1?=
 =?utf-8?B?cGsrZUFIM1VUYjJkNWI2aXFjb1VMbktzeXlYeVR2U2IwUjdOT2R3b0RhTjd5?=
 =?utf-8?B?cVlMYzE4OXFXWGJJMWNVOE9pMjNReEphdVZvVVhxcndVQ1hPRTBaNTk5NUxj?=
 =?utf-8?B?cTl1d2VsQ3ArSm9nYTljRmt0Qk9QWTVqaFg1ZFVrOFFjZndjMVR6cXIyR25J?=
 =?utf-8?B?WHE1elowUkc1bkhEdGpDSUxVaWdPeWd5cEtGVjBMWE5qaEhtbWN3VllXdFQy?=
 =?utf-8?B?b0dSWWRhR1dvazFwNlN1bVdsdlBKKy9XbnIzUGt1eUxreGVlNFdrc1ZiMXpP?=
 =?utf-8?B?YVBiMDgzR3FuT2t5UzM1Tlh5Zm9RWnRickY2NUNScEdxeFhPQmdwWk5VR2Jr?=
 =?utf-8?B?S0Y4R0xQSzQvNUhCRWgxQSsxNklwRmRpa09EYVZtNFptNUo1QnZkYlN1V1RU?=
 =?utf-8?B?cHM4d1pXV0taY0g0ZW9XWXh1RVFiMThISWF3ZXpkMGFBMkNuNnhZc2lpSVBJ?=
 =?utf-8?B?TzJuY1pSK0JzSm9ZY1ZsVldGeVlYTzkxNnFDRnRCcFhFRkZTT3Q1bEU4K3BV?=
 =?utf-8?B?elJ3cWZjVTdGbHhuakNwSXQwV1k2VVlacXJFQVpxWDBVbDFFbWFMMzFYYjI3?=
 =?utf-8?B?b0JHajNJQUh2MWdkSEJLSDE1RVVIcHpkK2l1OFc0aW9IZGxKNUtmMEJZU3hI?=
 =?utf-8?B?ZW12QlhQcE03MDNBb2ZSSUpWOWRWZlRpM0ZsSUJkM0R0T1kwSUxsTWpOeXlp?=
 =?utf-8?B?WXNjaFhNL1QzMkpLdVc1R1lqUEN5SmR3TXBJdC92SmpycVBmbGdFYnpvZ0lx?=
 =?utf-8?B?VlI1QjR3UVlNOEZjeEI4NWc3TVB0WTFOVkl4WmhiRjlpcWlRdGxkdlJZeHhy?=
 =?utf-8?B?MmJFNjMreWl2bGdMekMwTFdCUmVQRURBRStpMS9FWHJ6ZzJTb3RTbVc3Zkt0?=
 =?utf-8?B?MmdYOFBYeFVIanBMUGtoMjlVemhKdjgrcHRBS3UyZVlJOWdGbkdacDVPZERO?=
 =?utf-8?B?eGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 42af960e-c779-4ff0-c570-08de330e59c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 08:23:06.1352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5M3doPEpAlc9in63iMz3jgphDqAJ/Jvf6rnDVbUDKeU9Bq7kvm7ARiady0SJ1+6gZxo3ZLA042CTRJW9Jx5e6PM3o+OolCtBD1zB0jZLuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11857

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwNCBEZWNlbWJlciAyMDI1IDA4OjAzDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjUgMDEvMTddIGR0LWJpbmRpbmdzOiBzZXJpYWw6IHJlbmVzYXMscnNj
aTogRG9jdW1lbnQgUlovRzNFIHN1cHBvcnQNCj4gDQo+IE9uIFNhdCwgTm92IDI5LCAyMDI1IGF0
IDA0OjQyOjU3UE0gKzAwMDAsIEJpanUgd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIGRvY3VtZW50YXRpb24gZm9yIHRo
ZSBzZXJpYWwgY29tbXVuaWNhdGlvbiBpbnRlcmZhY2UgKFJTQ0kpIGZvdW5kDQo+ID4gb24gdGhl
IFJlbmVzYXMgUlovRzNFIChSOUEwOUcwNDcpIFNvQy4gVGhlIFJTQ0kgSVAgb24gdGhpcyBTb0Mg
aXMNCj4gPiBpZGVudGljYWwgdG8gdGhhdCBvbiB0aGUgUlovVDJIIChSOUEwOUcwNzcpIFNvQywg
YnV0IGl0IGhhcyBhIDMyLXN0YWdlDQo+ID4gRklGTyBjb21wYXJlZCB0byAxNiBvbiBSWi9UMkgu
IEl0IHN1cHBvcnRzIGJvdGggRklGTyBhbmQgbm9uLUZJRk8gbW9kZQ0KPiA+IG9wZXJhdGlvbi4g
UlovRzNFIGhhcyA2IGNsb2Nrcyg1IG1vZHVsZSBjbG9ja3MgKyAxIGV4dGVybmFsIGNsb2NrKQ0K
PiA+IGNvbXBhcmVkIHRvIDMgY2xvY2tzDQo+ID4gKDIgbW9kdWxlIGNsb2NrcyArIDEgZXh0ZXJu
YWwgY2xvY2spIG9uIFJaL1QySCwgYW5kIGl0IGhhcyBtdWx0aXBsZSByZXNldHMuDQo+ID4gSXQg
aGFzIDYgaW50ZXJydXB0cyBjb21wYXJlZCB0byA0IG9uIFJaL1QySC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0N
Cj4gPiB2NC0+djU6DQo+ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24gcmVsYXRlZCB0
byBJUlEgZGlmZmVyZW5jZQ0KPiA+ICAqIEFkZGVkIGFlZCBhbmQgYmZkIGlycXMgZm9yIFJaL0cz
RS4NCj4gPiAgKiBNb3ZlZCByZXNldDogZmFsc2UgdG8gUlovVDJIIFNvQyBhbmQgZHJvcHBlZCB0
aGUgZWxzZSBwYXJ0IGZvciBSWi9HM0UuDQo+ID4gICogVXBkYXRlZCBjb25kaXRpb25hbCBzY2hl
bWEgd2l0aCBpbnRlcnJ1cHRzIGFuZCBpbnRlcnJ1cHRzLW5hbWVzLg0KPiA+ICAqIERyb3BwZWQg
dGhlIHRhZyBhcyB0aGVyZSBhcmUgbmV3IGNoYW5nZXMuDQo+ID4gdjMtPnY0Og0KPiA+ICAqIERy
b3BwZWQgc2VwYXJhdGUgY29tcGF0aWJsZSBmb3Igbm9uLUZJRk8gbW9kZSBhbmQgaW5zdGVhZCB1
c2luZyBzaW5nbGUNCj4gPiAgICBjb21wYXRpYmxlICJyZW5lc2FzLHI5YTA5ZzA0Ny1yc2NpIiBh
cyBub24tRklGTyBtb2RlIGNhbiBiZSBhY2hpZXZlZA0KPiA+ICAgIGJ5IHNvZnR3YXJlIGNvbmZp
Z3VyYXRpb24uDQo+ID4gICogUmVuYW1lZCBjbG9jay1uYW1lcyBidXMtPnBjbGsNCj4gPiAgKiBS
ZWFycmFuZ2VkIGNsb2NrLW5hbWVzIHRjbGt7NCwgMTYsIDY0fQ0KPiA+ICAqIFJldGFpbmVkIHRo
ZSB0YWcgYXMgdGhlIGNoYW5nZXMgYXJlIHRyaXZpYWwuDQo+ID4gdjItPnYzOg0KPiA+ICAqIERy
b3BwZWQgMXN0IGFuZCAzcmQgaXRlbXMgZnJvbSBjbGstbmFtZXMgYW5kIGFkZGVkIG1pbkl0ZW1z
IGZvciB0aGUNCj4gPiAgICByYW5nZS4NCj4gPiAgKiBBZGRlZCBtaW5JdGVtcyBmb3IgY2xrIGFu
ZCBjbGstbmFtZXMgZm9yIFJaL1QySCBhcyB0aGUgcmFuZ2UgaXMgMi0zDQo+ID4gICogQWRkZWQg
bWF4SXRlbXMgZm9yIGNsayBhbmQgY2xrLW5hbWVzIGZvciBSWi9HM0UgYXMgdGhlIHJhbmdlIGlz
IDUtNg0KPiA+ICAqIFJldGFpbmVkIHRoZSB0YWcgYXMgaXQgaXMgdHJpdmlhbCBjaGFuZ2UuDQo+
ID4gdjEtPnYyOg0KPiA+ICAqIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UNCj4gPiAgKiBBZGRlZCBy
ZXNldHM6ZmFsc2UgZm9yIG5vbiBSWi9HM0UgU29Dcy4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRp
bmdzL3NlcmlhbC9yZW5lc2FzLHJzY2kueWFtbCAgICAgICAgIHwgOTkgKysrKysrKysrKysrKysr
Ky0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMscnNjaS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMscnNjaS55YW1sDQo+ID4gaW5kZXggNmIx
ZjgyN2EzMzViLi4xZjhjZWU4MTcxZGUgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9yZW5lc2FzLHJzY2kueWFtbA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxyc2NpLnlhbWwN
Cj4gPiBAQCAtMTAsNDYgKzEwLDcyIEBAIG1haW50YWluZXJzOg0KPiA+ICAgIC0gR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiAgICAtIExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IC1h
bGxPZjoNCj4gPiAtICAtICRyZWY6IHNlcmlhbC55YW1sIw0KPiA+IC0NCj4gPiAgcHJvcGVydGll
czoNCj4gPiAgICBjb21wYXRpYmxlOg0KPiA+ICAgICAgb25lT2Y6DQo+ID4gLSAgICAgIC0gaXRl
bXM6DQo+ID4gLSAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA5ZzA4Ny1yc2NpICMgUlov
TjJIDQo+ID4gLSAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA5ZzA3Ny1yc2NpICMgUlov
VDJIDQo+ID4gKyAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgIC0gcmVuZXNhcyxyOWEwOWcw
NDctcnNjaSAjIFJaL0czRQ0KPiA+ICsgICAgICAgICAgLSByZW5lc2FzLHI5YTA5ZzA3Ny1yc2Np
ICMgUlovVDJIDQo+ID4NCj4gPiAgICAgICAgLSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gY29u
c3Q6IHJlbmVzYXMscjlhMDlnMDg3LXJzY2kgIyBSWi9OMkgNCj4gPiAgICAgICAgICAgIC0gY29u
c3Q6IHJlbmVzYXMscjlhMDlnMDc3LXJzY2kgIyBSWi9UMkgNCj4gPg0KPiA+ICAgIHJlZzoNCj4g
PiAgICAgIG1heEl0ZW1zOiAxDQo+ID4NCj4gPiAgICBpbnRlcnJ1cHRzOg0KPiA+ICsgICAgbWlu
SXRlbXM6IDQNCj4gPiAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBFcnJv
ciBpbnRlcnJ1cHQNCj4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjogUmVjZWl2ZSBidWZmZXIgZnVs
bCBpbnRlcnJ1cHQNCj4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjogVHJhbnNtaXQgYnVmZmVyIGVt
cHR5IGludGVycnVwdA0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBUcmFuc21pdCBlbmQgaW50
ZXJydXB0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEFjdGl2ZSBlZGdlIGRldGVjdGlvbiBp
bnRlcnJ1cHQNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogQnJlYWsgZmllbGQgZGV0ZWN0aW9u
IGludGVycnVwdA0KPiA+DQo+ID4gICAgaW50ZXJydXB0LW5hbWVzOg0KPiA+ICsgICAgbWluSXRl
bXM6IDQNCj4gPiAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAtIGNvbnN0OiBlcmkNCj4gPiAgICAg
ICAgLSBjb25zdDogcnhpDQo+ID4gICAgICAgIC0gY29uc3Q6IHR4aQ0KPiA+ICAgICAgICAtIGNv
bnN0OiB0ZWkNCj4gPiArICAgICAgLSBjb25zdDogYWVkDQo+ID4gKyAgICAgIC0gY29uc3Q6IGJm
ZA0KPiA+DQo+ID4gICAgY2xvY2tzOg0KPiA+ICAgICAgbWluSXRlbXM6IDINCj4gPiAtICAgIG1h
eEl0ZW1zOiAzDQo+ID4gKyAgICBtYXhJdGVtczogNg0KPiA+DQo+ID4gICAgY2xvY2stbmFtZXM6
DQo+ID4gLSAgICBtaW5JdGVtczogMg0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAgIC0gaXRl
bXM6DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBvcGVyYXRpb24NCj4gPiArICAgICAgICAgIC0g
Y29uc3Q6IGJ1cw0KPiA+ICsgICAgICAgICAgLSBjb25zdDogc2NrICMgb3B0aW9uYWwgZXh0ZXJu
YWwgY2xvY2sgaW5wdXQNCj4gPiArDQo+ID4gKyAgICAgICAgbWluSXRlbXM6IDINCj4gPiArDQo+
ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBwY2xrDQo+ID4gKyAg
ICAgICAgICAtIGNvbnN0OiB0Y2xrDQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiB0Y2xrX2RpdjQN
Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IHRjbGtfZGl2MTYNCj4gPiArICAgICAgICAgIC0gY29u
c3Q6IHRjbGtfZGl2NjQNCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHNjayAjIG9wdGlvbmFsIGV4
dGVybmFsIGNsb2NrIGlucHV0DQo+ID4gKw0KPiA+ICsgICAgICAgIG1pbkl0ZW1zOiA1DQo+ID4g
Kw0KPiA+ICsgIHJlc2V0czoNCj4gPiAgICAgIGl0ZW1zOg0KPiA+IC0gICAgICAtIGNvbnN0OiBv
cGVyYXRpb24NCj4gPiAtICAgICAgLSBjb25zdDogYnVzDQo+ID4gLSAgICAgIC0gY29uc3Q6IHNj
ayAjIG9wdGlvbmFsIGV4dGVybmFsIGNsb2NrIGlucHV0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IElucHV0IGZvciByZXNldHRpbmcgdGhlIEFQQiBjbG9jaw0KPiA+ICsgICAgICAtIGRlc2Ny
aXB0aW9uOiBJbnB1dCBmb3IgcmVzZXR0aW5nIFRDTEsNCj4gPiArDQo+ID4gKyAgcmVzZXQtbmFt
ZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25zdDogcHJlc2V0bg0KPiA+ICsg
ICAgICAtIGNvbnN0OiB0cmVzZXRuDQo+IA0KPiBZb3UgZGlkIG5vdCBpbmNsdWRlIGxvcmUgbGlu
a3MsIHNvIEkgY2Fubm90IGNoZWNrIHdoZXRoZXIgd2UgYWxyZWFkeSB0YWxrZWQgYWJvdXQgdGhp
cyAod2h5IHlvdSBzdGlsbA0KPiBkbyBub3Qgc2VuZCBiaWcgcGF0Y2hzZXRzIGxpa2UgdGhpcyB3
aXRoIGI0PyksIGJ1dCB5b3UgYXJlIG1peGluZyBoZXJlIGRldmljZXMgd2l0aCBjb21wbGV0ZWx5
DQo+IGRpZmZlcmVudCBpbm5wdXRzLiBUaGlzIGRvZXMgbm90IG1ha2UgdGhlIGJpbmRpbmcgcmVh
ZGFibGUuDQoNClNlZSB0aGUgbGlua3MuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI1MTAzMTAwMDAxMi5HQTQ2NjI1MC1yb2JoQGtlcm5lbC5vcmcvDQoNCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJlbmVzYXMtc29jLzIwMjUxMDMwLXJlZ3JvdXAtZ2FydGVyLWM3MGM3
ZmM2YTcxYUBzcHVkLw0KDQpJIHVzZSB0aGUgYmVsb3cgY29tbWFuZCB0byBzZW5kIHRoZSBwYXRj
aGVzLCBpcyBpdCB3cm9uZz8gSSB3aWxsIHRyeSBiNCBuZXh0IHRpbWUuDQoNCmdpdCBzZW5kLWVt
YWlsIC0tYW5ub3RhdGUgKi5wYXRjaA0KDQo+IA0KPiBTcGxpdCB0aGUgYmluZGluZy4NCg0KSSBj
YW4gc3BsaXQgdGhlIGJpbmRpbmcsIGlmIFJvYi9Db25vci9HZWVydCBpcyBPSyB3aXRoIGl0Lg0K
DQpJZSwgQWx3YXlzIHB1dCBwZXIgU29DIGNoYW5nZXMgaW4gbmV3IGR0IGJpbmRpbmdzIGZpbGVz
IHRvIG1ha2UgaXQgbW9yZSByZWFkYWJsZSB3aXRob3V0IGFueSBjb21wbGV4IGlmDQpzdGF0ZW1l
bnRzLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg==


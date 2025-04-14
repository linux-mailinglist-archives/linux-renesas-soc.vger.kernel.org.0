Return-Path: <linux-renesas-soc+bounces-15930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3EEA887A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A663A9505
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709F92798F2;
	Mon, 14 Apr 2025 15:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h4zHbAMn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1241F92E;
	Mon, 14 Apr 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645393; cv=fail; b=bexGMlP391LBRHnkh5ZPw+pBLGuohAARf+lzqioNVPY2NUP01mehfts4KOekRDSjmINgnJyPd/IpAGo68UZOKXw6GiK+06ll+iLD/K289Sn62M8gaxf3rTT+9xqLxrKyjldZ6Mfy1JTiiudEkX/xljHQ13koYV0Ep2G6VJMxn3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645393; c=relaxed/simple;
	bh=a02VrPOPlFkIoP1Z6o7V8RVsTYtGaQholXnP3UK9n34=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h5/NFz8a+o5HuZXJtgGDz4PSeorDFj1civW8rBem50SSj9kUJQ7pdC3KLHu//y7ayoFxteR333FbmTtoL+ze0hGecz/m9GLv1DcNCa0JAGuUl1AN4jgelLSq0msDAq1vKYaAm7DbLdK3bZLa+6XEgN1FDSYMobVvlOpwN5Z1fjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h4zHbAMn; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfWJ/xbFf/pHYayWbZsaeTtGuxwe3D32TOZSCYIobIPVvPyoUWDn+RQmkw4ow+BI5jY7v8M/0iSlWmnByWVY7CnE5n1FghZHAxPuRoblviH52sdHRWljupZyVxmVgejP1P+8CpjIjkyI3il+WGeJumeeHDTPsDFZ/CvI35HOMtHmcBqmI83ke8jB5dCm6i1i3wqLUxXk8p9/Pb8zWqtdh5+0Ruirg+fF4LnjXTquJFEhLWXY+WEB99s0qMH53J8wEJQEx4H/exxWv8EqqWOB6pXnVXoL3lYHrEK3xp5rHZWou1dpBf/pCK4+zl+FArXuHd+JqHytV+Fk4fTdlTwMVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a02VrPOPlFkIoP1Z6o7V8RVsTYtGaQholXnP3UK9n34=;
 b=fKvQCBUUw7Nw4LjcMkN3ZD4W6YHNZjRWed9z1GsH0waWGMrOvRjpKsIdNkxjm37+3Fu0UcHVa8V53brtQmUCH7rHwDvuN8T5wg4PR7phFI0912T4c8n46FkgZ0qnK+joOjosqhMRAb9Y14hTbfRDaTeYyro7mMb29GLlRXL6llwvGuh9PipIwH1MCjxacNHRbBAT/l4uUGHQ2waNoLNdYeiRJRmGwbB9C+rAHUUoy+J4/4Uozvn68Zb9wB7mNvq0AGhMnlfZgVJ7FLdLh1cXKjtAMhcZSqnhXGzTUQdvJQ3jv6gxM7cYYN6doKa9DTEKVl1IaOBI/iDHM9dkpMjv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a02VrPOPlFkIoP1Z6o7V8RVsTYtGaQholXnP3UK9n34=;
 b=h4zHbAMnnYmXV8iPK/MINyclABKmBbgOWWvHe672X/DnTFSyOGrUrnUg26mWoENBBuvcsWBTDA0g6ZpE4d/LLAZSRUje2V7bsFspsHje+eIX3fdk7GeHGyG3ldMvYIU0RT5RaBV5Ce4pNSCPHiPNS3NkxT0u1Cl4gMqJrRNAVDA=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYCPR01MB6381.jpnprd01.prod.outlook.com (2603:1096:400:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 15:43:03 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:43:03 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Prabhakar
	<prabhakar.csengg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
Thread-Topic: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
Thread-Index: AQHbrT005dasSsHT6kW78z74+eEwybOjLLSAgAAfPBA=
Date: Mon, 14 Apr 2025 15:43:02 +0000
Message-ID:
 <TYCPR01MB1209398B324FDB1691D80545FC2B32@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <9c32c9aa-3895-4969-8a33-059c4ad93143@oracle.com>
In-Reply-To: <9c32c9aa-3895-4969-8a33-059c4ad93143@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYCPR01MB6381:EE_
x-ms-office365-filtering-correlation-id: 83e527de-6459-4f17-c9c3-08dd7b6b0ae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MlBPSnZET0RKSGgwTmZVbHRuMzZxQnZiVFR4aGEwTXBwSUFxQlkrRnVBcEZU?=
 =?utf-8?B?ZmJTNlVVT0xGbHZBakRpcVBSOGtseEptRWx0amhCeDhkbWYxYit2cm1sVG1N?=
 =?utf-8?B?TS90SDlRazFQY01TQkZZVVF3UktWcCtpUkMwcS94cE5ZeHE1TjJXVzdWNVBz?=
 =?utf-8?B?cHRHK2VoYXljT3BsU1ZzOFlVa3FJNFR2Q1dFRWNNNGk5dGhiZmZUdk1vcFdr?=
 =?utf-8?B?QzQzYVZJVnFidUNDTnVtcHV3UU5CZDJ2ZHNtRmRqSkhFL1dFSGdvN0JlWk5x?=
 =?utf-8?B?U1Y0cTlWRVlVbVFSTUJ0dzNYdDRmSzBEMEg3RmFCQjRkdFhEV0dHZXhPMHU5?=
 =?utf-8?B?aFRPZGk5TW51dndyUHJWSktkN3lWUE9wdHJyY0hjN2t4UWk2bVBQQlAxS00w?=
 =?utf-8?B?U3EzQVJ3SVd5NFdoY29haWI5SGVXYldLRDBFWHdWV3pXN1lnekxpWHVEUUJj?=
 =?utf-8?B?WEJySUdOa1hDNnBlWWdJbU01VWt3VjZiUE9GRGsybXorelRZQVNPdFRNcXBW?=
 =?utf-8?B?L1lib3RxN1g5MVZkVUFnRytrRGJnZG82MTlJRDZ3UlRTb0ltcnZiNzlaTXli?=
 =?utf-8?B?T3Fkc1FzckF4Zng5cXNkakV4ckZoeGdMQWNpZ0wxL2QrWHRTaHJTeWtMYmdC?=
 =?utf-8?B?MUsyOXJZT2ZLNy9ONU1wQUVxSkovc0V4ZFNoWU9oeEZGRXhINkx2bkpnWEJF?=
 =?utf-8?B?ZTFJVDVnRWQvV0kzNmlUaWs2K2U4TjZhVnFwMC9zU1psakdqbWEwN2VHK0dp?=
 =?utf-8?B?ekwxQlBjUlVTdkhNc2hTVjlWaDJ4b0dQWGxCaXdvbjNRbHJBUEp6WjFOc3Zw?=
 =?utf-8?B?SjZCb1lrM1Q3ald3M0JZZmE2THVZYkw5LzdWYVJhSVp2WlhiL09ETDVzUXJy?=
 =?utf-8?B?SzNyUm02Zmx5b1NiNTVqbnduVXVDeHNsQkgyMGdxK0ovU0VZQWd0STBFZ2JO?=
 =?utf-8?B?Tk9mT2J2VzdxODduVDFWYThxaTVGWHJPRUxtdFBMclRoMTRIRFBlckRabTJ1?=
 =?utf-8?B?SEtSU1ZUelZONHV2VGRINlBFU2I5dVJjM0tUVVloa1VFTnFaeFRkZkUycHRq?=
 =?utf-8?B?Z3hIWkVmZ0RmQXJ1Z1lXTDJ6ejJsYWtIWWtyUHhBMWJJUGdKaUE3cGcrQ3NU?=
 =?utf-8?B?NEh0QkpnSEcwM0drbC9jcDNXV2MxQitIVzZNWFIvYTRZbmdDdTgzZzAvU28z?=
 =?utf-8?B?aGJWTWR6OUFXdlR2VHBqWERFSnV3QVMyZHgxZlg4ZEJDcHlUYlp2ZFhDTXJX?=
 =?utf-8?B?a0hKQU5JUUljWEdjWVdtZ01ZZVlNc0NPdTNCWkxhaVMxYUkxM3pZeTNDRlRI?=
 =?utf-8?B?WGRVTjFpUzRYK05DMmZhUXNkaWdvWkdlenNpRzRiaHVXZTJXTUREOFRIT1RO?=
 =?utf-8?B?Yk9QSmd4TGQ2UkN0QlE3VEc3OG5NZkpWUXJWWGNBVldIZVAyME1VRGJteXJ5?=
 =?utf-8?B?b0RrVG0yODV1UXlQbFAxOFR4QW5DQnZvOVRNNzBxa0hHVVE4enJoZkFMV2hD?=
 =?utf-8?B?dGplaVFCU0xMYThhNVZOQXFPYnJlR2xiUzBtcGM3WDFSYjdESHdaL0lGOEhO?=
 =?utf-8?B?eVQyZVI0WWc4RGtGb1dzWjVkaHhqdkdRZVBhUERtZXJoT1pYSjhlVzIvNWlN?=
 =?utf-8?B?WldEUTRQVGltdmhMRkVHdEpBbTJadWZBRTlVNUNrRkFyUlFrSlBNcmpHY3dC?=
 =?utf-8?B?RmlGd2Y3SkRKSktTclVRV1NwUXdDbzNNUWE2RGVDVGlWN3A1YkdERkxnNHA4?=
 =?utf-8?B?dGhoYU5nNjdra0EzZEFKbTJ5aEZjbURNTjk5K212YzUraEJXNHYwUXlCdWJo?=
 =?utf-8?B?dnB2dkV2TW5IV0JJSXY2bVQ2UjN2R2s3RlJzVHFhU2ZDSzZDMFNacS9nRUJv?=
 =?utf-8?B?NEUwR0Q1WGs0YkdSQ2tCNjQwdXZaUktySG5PY0ljVmw3Y0oyNDVGcEtQVEFx?=
 =?utf-8?Q?EB7+grVfZTc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MER0RU43b2NiVkxwb3M2dG93UzBOYTBlZzU0MUk4bkljcTdHQTY4NERIUTV5?=
 =?utf-8?B?R0JqTllCQm10SUZyRlRaR2N1OE4yZm9FMkJ0OCtHT1JTZ1ZhUkNIN1lHTTFG?=
 =?utf-8?B?eUowcHhSS1JmLzlVcDNFZXFHYVJyeEpIekJqcDhISmtObzBXdFFla1ZFUVIv?=
 =?utf-8?B?R0FLb2hJU1o3d2E5aTRHdWk4N24vN0cxNFdXNnhDbHFJZi96K1cxWnRxdzJm?=
 =?utf-8?B?c2dHWFdFY2pyTzhNVEdOR2VJbnJvVkYzMDV0ajBlaEthbzFEY2VQOEJEVWgx?=
 =?utf-8?B?RGdHUERiUjh0RytlWmh5Ti9Cc3FNZzZOdjl5VnZaM2ZlZ0R6bHZ5Nk5NN29S?=
 =?utf-8?B?dmcwZ0hDNGZnY0Q1dFh2YU5hR2VzSFJKUlBCSmdWM1NjVllmNFoxQ3EvSUI5?=
 =?utf-8?B?eDhzdkoxUy9hVTZCUWdjSkQxQ2V6T1g2My9VbDl6SCswVDI2MmFQdWZwOXpR?=
 =?utf-8?B?NFg4ckNTcVc5SzNpalVGcjdjNVBkaHA4akV2QStVL3pEVUZZNk5ETzdhc3A1?=
 =?utf-8?B?eGwrKzhJdHNLdXp4KzhKUkczSU1PUTNnWVBLWXZzOWtiK25sTnBtSkZiamF6?=
 =?utf-8?B?bklpZjgxdUNwdmZjMmQ1cVNGV05oZDZaMHE5cmZXREgvK3B5cEw2ZE9vYTYw?=
 =?utf-8?B?anlrVHNDQmNqN3lKbDQvZXI0T0hMbzJwQW5lalpSUE9yVjZBMTVYcDJBOWwv?=
 =?utf-8?B?ZnZCVXdKSzM5OWlYMXFNQlFvV0ZndmtyLzZKbU1wdHlIOTN1aDdUVWcwVlM2?=
 =?utf-8?B?dlppRXpHVWNVbDkrcVdrOTdhK0pjeFg0elp0ZzJCWkZxS05KRzl0MWZ6Z1NG?=
 =?utf-8?B?dkhpZmc0M1M5OWt4N1BvbmtVSnFyTFdvMkhxUDIxVkF1OFJ5QXNzMEZmNU5k?=
 =?utf-8?B?cEVIVmVvSDNYMjROMk9WSER1RFppYmNXb2Z6SXEyVS9BZjZvRkFtdnRmOTl1?=
 =?utf-8?B?YzdQa2JPdGdqdjdjeWV2ekV6eFo1WVk1Qkx0aUxBS3VMMW4ydWJvMGxDWmV5?=
 =?utf-8?B?VXpEQzh1eUpicW9iUFFFUnFjVkttUkVod1U5eWhOUHM0L2NmNElDS3ZOSnNJ?=
 =?utf-8?B?RmZqOFlKYzNOK3VLOEJOY2FDNFNVKzdzZytDRDBFR0dVQVM0dlZCbFc0REpR?=
 =?utf-8?B?YnhtQ0IzazBMRHRBbm9zcDlWV3pRZGlHQkoyYmJOVlNycS9JK0d4bGJtQ1Q3?=
 =?utf-8?B?cE9wUnU3Y1Z4L1RFbGZqTXdLTjdzMlBMQnNiZ3YyK1RzWjJVQk5UbUV3QjY2?=
 =?utf-8?B?TzRSL2cycUJJM1pKdWRLQXUrVUVhK3k2cTBEdkcxcEdrRndJMEY2dFdCTnFm?=
 =?utf-8?B?THZpanJ4c25yZW8wVzUzTm03UVkrMkJobGIxd3UzZ1lyK0RaQU5Oa3ZJbHlG?=
 =?utf-8?B?T1p1MGJYSjUxZDJvajRTUHk3S1JTQ3hwd0RleVMxbWZDVi9EdTFiTEl4ODdv?=
 =?utf-8?B?d0NHc3VXSzZURllPV25MdjFBQ00wTFIxVFAzYkhQc0dacmI4b0dVbWpmNDho?=
 =?utf-8?B?QWVISmc0TVZIUUhxTjlrM0xQWFpYczlUbjRSQVk5TjA0SmtlcG1XNy81eFgx?=
 =?utf-8?B?UzVhM0E1eTRvWGZmSE1MUnZCQXBqdisxaVdYMXVleENFUjhmSVc1ZmVVQ0Jx?=
 =?utf-8?B?VE1SMjhFRTcvZHd3L1huZUhaK3hvTUYxUExLYVpmY090UjNkQkhWdHVtbkpq?=
 =?utf-8?B?SlBGb3RkYllJcDk4V3FVSzlLZDNCTDZZOVNQWVY3L3k1UE1YVEd2bTBkR3E1?=
 =?utf-8?B?RUlSRkdha3ZmZjVOTU9mQ2lUVFNLTEhLSDE0T2pkL2xlMVFIc1NrODNocGFo?=
 =?utf-8?B?NGN0bnZ1akRrdUJNSFNhV1dkUDJuUnRMODRTSVRLN3lhanZlU3JrNHBEYmQy?=
 =?utf-8?B?Ky9TeUF4MGVFZ1Q1WkJMM1doZTkwaytLZWpQdldwNmtBWGlzb2ZWa1VjN2M2?=
 =?utf-8?B?bkdaa3dKU01jdW4zZVhLWlNXYVVDYVdqcjk0MjNTL1UvazZYK2hDK1JBQmpW?=
 =?utf-8?B?UTIyanBybXVSRm41bU9MN2c4WTFzOVBXY0RFME81SS9ZV2J0djB5b3ErMGZU?=
 =?utf-8?B?SkUxVVp5cmwxMmxiMjlVclRYZTVGZ2I0WDhWcWpBUDNhVm9Jc1VlbzRZWmpm?=
 =?utf-8?B?K0k3ejQ1R1ltS0xLZWhwaU1CaTNKNGp6ZXkrWTZocG9xc3JCc2IzY3hGaXVh?=
 =?utf-8?B?ZWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e527de-6459-4f17-c9c3-08dd7b6b0ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 15:43:03.0514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/bAZTciYzsF9uAy4H5YZUoWAXSdja/0bfnggA9APh+c4RSRpHETj5Fz2d4azZOPBv+k474fh7/8jayUs7A1ew6TP3UM3egqn2zHV/KfrSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6381

SGkgQWxvaywNCg0KVGhhbmtzIGZvciB5b3VyIGVtYWlsLg0KDQo+IEZyb206IEFMT0sgVElXQVJJ
IDxhbG9rLmEudGl3YXJpQG9yYWNsZS5jb20+DQo+IFNlbnQ6IDE0IEFwcmlsIDIwMjUgMTQ6NDYN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzNdIHJlc2V0OiBBZGQgVVNCMlBIWSBwb3J0IHJl
c2V0IGRyaXZlciBmb3IgUmVuZXNhcyBSWi9WMkgoUCkNCj4gDQo+IA0KPiA+ICtzdGF0aWMgaW50
IHJ6djJoX3VzYnBoeV9yZXNldF9hc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpy
Y2RldiwNCj4gPiArCQkJCSAgICAgdW5zaWduZWQgbG9uZyBpZCkNCj4gPiArew0KPiA+ICsJc3Ry
dWN0IHJ6djJoX3VzYjJwaHlfcmVzZXRfcHJpdiAqcHJpdiA9IHJ6djJoX3VzYnBoeV9yY2Rldl90
b19wcml2KHJjZGV2KTsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IHByaXYtPmRldjsNCj4g
PiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dl
dChkZXYpOw0KPiA+ICsJaWYgKHJldCkgew0KPiANCj4gbml0OiBpdCB3aWxsIGdvb2QgaWYgd2Ug
Y2hlY2sgc2ltaWxhciB0byByZXNldC1yemcybC11c2JwaHktY3RybC5jDQo+IHBtX3J1bnRpbWVf
cmVzdW1lX2FuZF9nZXQgLT4gMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUN
Cj4gb3RoZXJ3aXNlLg0KPiAxIOKGkiBpZiB0aGUgZGV2aWNlIHdhcyByZXN1bWVkIGFuZCBpbmNy
ZW1lbnRlZCB1c2FnZSBjb3VudA0KPiAwIOKGkiBpZiB0aGUgZGV2aWNlIHdhcyBhbHJlYWR5IGFj
dGl2ZSBvciBzdWNjZXNzZnVsbHkgcmVzdW1lZA0KPiBpZiAocmV0IDwgMCkNCg0KTm8uDQoNCkFz
IHlvdSBjYW4gc2VlIGZyb206DQpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxv
Yi9tYXN0ZXIvaW5jbHVkZS9saW51eC9wbV9ydW50aW1lLmgjTDQ0NA0KDQpwbV9ydW50aW1lX3Jl
c3VtZV9hbmRfZ2V0IHJldHVybnMgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9yIDAgKHdoZW4NCnN1
Y2Nlc3NmdWwpLg0KDQpUaGUgc2FtZSBleHBsYW5hdGlvbiBhcHBsaWVzIHRvIHlvdXIgb3RoZXIg
Y29tbWVudHMuDQoNCg0KS2luZCByZWdhcmRzLA0KRmFiDQoNCj4gDQo+ID4gKwkJZGV2X2Vycihk
ZXYsICJwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0IGZhaWxlZFxuIik7DQo+ID4gKwkJcmV0dXJu
IHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyenYyaF91c2JwaHlfYXNzZXJ0X2hlbHBlcihw
cml2KTsNCj4gPiArDQo+ID4gKwlwbV9ydW50aW1lX3B1dChkZXYpOw0KPiA+ICsNCj4gPiArCXJl
dHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJ6djJoX3VzYnBoeV9yZXNl
dF9kZWFzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LA0KPiA+ICsJCQkJ
ICAgICAgIHVuc2lnbmVkIGxvbmcgaWQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCByenYyaF91c2Iy
cGh5X3Jlc2V0X3ByaXYgKnByaXYgPSByenYyaF91c2JwaHlfcmNkZXZfdG9fcHJpdihyY2Rldik7
DQo+ID4gKwljb25zdCBzdHJ1Y3Qgcnp2MmhfdXNiMnBoeV9yZXNldF9vZl9kYXRhICpkYXRhID0g
cHJpdi0+ZGF0YTsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IHByaXYtPmRldjsNCj4gPiAr
CWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChk
ZXYpOw0KPiANCj4gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCAtPiAwIG9uIHN1Y2Nlc3MsIG9y
IGEgbmVnYXRpdmUgZXJyb3IgY29kZQ0KPiBvdGhlcndpc2UuDQo+IGlmIChyZXQgPCAwKQ0KPiAN
Cj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgInBtX3J1bnRpbWVfcmVzdW1l
X2FuZF9nZXQgZmFpbGVkXG4iKTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiA+ICsN
Cj4gPiArCXNjb3BlZF9ndWFyZChzcGlubG9jaywgJnByaXYtPmxvY2spIHsNCj4gPiArCQl3cml0
ZWwoZGF0YS0+cmVzZXRfZGVhc3NlcnRfdmFsLCBwcml2LT5iYXNlICsgZGF0YS0+cmVzZXRfcmVn
KTsNCj4gPiArCQl3cml0ZWwoZGF0YS0+cmVzZXQyX3JlbGVhc2VfdmFsLCBwcml2LT5iYXNlICsg
ZGF0YS0+cmVzZXQyX3JlZyk7DQo+ID4gKwkJd3JpdGVsKGRhdGEtPnJlc2V0X3JlbGVhc2VfdmFs
LCBwcml2LT5iYXNlICsgZGF0YS0+cmVzZXRfcmVnKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlw
bV9ydW50aW1lX3B1dChkZXYpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgaW50IHJ6djJoX3VzYnBoeV9yZXNldF9zdGF0dXMoc3RydWN0IHJlc2V0
X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwNCj4gPiArCQkJCSAgICAgdW5zaWduZWQgbG9uZyBpZCkN
Cj4gPiArew0KPiA+ICsJc3RydWN0IHJ6djJoX3VzYjJwaHlfcmVzZXRfcHJpdiAqcHJpdiA9IHJ6
djJoX3VzYnBoeV9yY2Rldl90b19wcml2KHJjZGV2KTsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRl
diA9IHByaXYtPmRldjsNCj4gPiArCWludCByZXQ7DQo+ID4gKwl1MzIgcmVnOw0KPiA+ICsNCj4g
PiArCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoZGV2KTsNCj4gDQo+IHBtX3J1bnRp
bWVfcmVzdW1lX2FuZF9nZXQgLT4gMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZlIGVycm9yIGNv
ZGUNCj4gb3RoZXJ3aXNlLg0KPiBpZiAocmV0IDwgMCkNCj4gDQo+ID4gKwlpZiAocmV0KSB7DQo+
ID4gKwkJZGV2X2VycihkZXYsICJwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0IGZhaWxlZFxuIik7
DQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZWcgPSByZWFkbChw
cml2LT5iYXNlICsgcHJpdi0+ZGF0YS0+cmVzZXRfcmVnKTsNCj4gPiArDQo+ID4gKwlwbV9ydW50
aW1lX3B1dChkZXYpOw0KPiA+ICsNCj4gPiArCXJldHVybiAocmVnICYgcHJpdi0+ZGF0YS0+cmVz
ZXRfc3RhdHVzX2JpdHMpID09IHByaXYtPmRhdGEtPnJlc2V0X3N0YXR1c19iaXRzOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlc2V0X2NvbnRyb2xfb3BzIHJ6djJo
X3VzYnBoeV9yZXNldF9vcHMgPSB7DQo+ID4gKwkuYXNzZXJ0ID0gcnp2MmhfdXNicGh5X3Jlc2V0
X2Fzc2VydCwNCj4gPiArCS5kZWFzc2VydCA9IHJ6djJoX3VzYnBoeV9yZXNldF9kZWFzc2VydCwN
Cj4gPiArCS5zdGF0dXMgPSByenYyaF91c2JwaHlfcmVzZXRfc3RhdHVzLA0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArc3RhdGljIGludCByenYyaF91c2IycGh5X3Jlc2V0X29mX3hsYXRlKHN0cnVjdCBy
ZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsDQo+ID4gKwkJCQkJY29uc3Qgc3RydWN0IG9mX3Bo
YW5kbGVfYXJncyAqcmVzZXRfc3BlYykNCj4gPiArew0KPiA+ICsJLyogTm8gc3BlY2lhbCBoYW5k
bGluZyBuZWVkZWQsIHdlIGhhdmUgb25seSBvbmUgcmVzZXQgbGluZSBwZXIgZGV2aWNlICovDQo+
ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCByenYyaF91c2Iy
cGh5X3Jlc2V0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gK3sNCj4g
PiArCWNvbnN0IHN0cnVjdCByenYyaF91c2IycGh5X3Jlc2V0X29mX2RhdGEgKmRhdGE7DQo+ID4g
KwlzdHJ1Y3Qgcnp2MmhfdXNiMnBoeV9yZXNldF9wcml2ICpwcml2Ow0KPiA+ICsJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArCXN0cnVjdCByZXNldF9jb250cm9sICpyc3Rj
Ow0KPiA+ICsJaW50IGVycm9yOw0KPiA+ICsNCj4gPiArCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2
LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghcHJpdikNCj4gPiArCQly
ZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKwlkYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKGRldik7DQo+ID4gKwlpZiAoIWRhdGEpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUo
ZGV2LCAtRU5PREVWLA0KPiA+ICsJCQkJICAgICAiZmFpbGVkIHRvIG1hdGNoIGRldmljZVxuIik7
DQo+ID4gKw0KPiA+ICsJcHJpdi0+ZGF0YSA9IGRhdGE7DQo+ID4gKwlwcml2LT5kZXYgPSBkZXY7
DQo+ID4gKwlwcml2LT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYs
IDApOw0KPiA+ICsJaWYgKElTX0VSUihwcml2LT5iYXNlKSkNCj4gPiArCQlyZXR1cm4gUFRSX0VS
Uihwcml2LT5iYXNlKTsNCj4gPiArDQo+ID4gKwlyc3RjID0gZGV2bV9yZXNldF9jb250cm9sX2dl
dF9zaGFyZWRfZGVhc3NlcnRlZChkZXYsIE5VTEwpOw0KPiA+ICsJaWYgKElTX0VSUihyc3RjKSkN
Cj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocnN0YyksDQo+ID4gKwkJ
CQkgICAgICJmYWlsZWQgdG8gZ2V0IGRlYXNzZXJ0ZWQgcmVzZXRcbiIpOw0KPiA+ICsNCj4gPiAr
CXNwaW5fbG9ja19pbml0KCZwcml2LT5sb2NrKTsNCj4gPiArCWRldl9zZXRfZHJ2ZGF0YShkZXYs
IHByaXYpOw0KPiA+ICsNCj4gPiArCWVycm9yID0gZGV2bV9wbV9ydW50aW1lX2VuYWJsZShkZXYp
Ow0KPiA+ICsJaWYgKGVycm9yKQ0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgZXJy
b3IsICJGYWlsZWQgdG8gZW5hYmxlIHBtX3J1bnRpbWVcbiIpOw0KPiA+ICsNCj4gPiArCWVycm9y
ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiANCj4gbml0OiBpdCB3aWxsIGdv
b2QgaWYgd2UgY2hlY2sgc2ltaWxhciB0byByZXNldC1yemcybC11c2JwaHktY3RybC5jDQo+IHBt
X3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQgLT4gMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZlIGVy
cm9yIGNvZGUNCj4gb3RoZXJ3aXNlLg0KPiBpZiAoZXJyb3IgPCAwKQ0KPiANCj4gPiArCWlmIChl
cnJvcikNCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIGVycm9yLCAicG1fcnVudGlt
ZV9yZXN1bWVfYW5kX2dldCBmYWlsZWRcbiIpOw0KPiA+ICsNCj4gPiArCWZvciAodW5zaWduZWQg
aW50IGkgPSAwOyBpIDwgZGF0YS0+aW5pdF92YWxfY291bnQ7IGkrKykNCj4gPiArCQl3cml0ZWwo
ZGF0YS0+aW5pdF92YWxzW2ldLnZhbCwgcHJpdi0+YmFzZSArIGRhdGEtPmluaXRfdmFsc1tpXS5y
ZWcpOw0KPiA+ICsNCj4gPiArCS8qIGtlZXAgdXNiMnBoeSBpbiBhc3NlcnRlZCBzdGF0ZSAqLw0K
PiA+ICsJcnp2MmhfdXNicGh5X2Fzc2VydF9oZWxwZXIocHJpdik7DQo+ID4gKw0KPiA+ICsJcG1f
cnVudGltZV9wdXQoZGV2KTsNCj4gPiArDQo+ID4gKwlwcml2LT5yY2Rldi5vcHMgPSAmcnp2Mmhf
dXNicGh5X3Jlc2V0X29wczsNCj4gPiArCXByaXYtPnJjZGV2Lm9mX3Jlc2V0X25fY2VsbHMgPSAw
Ow0KPiA+ICsJcHJpdi0+cmNkZXYubnJfcmVzZXRzID0gMTsNCj4gPiArCXByaXYtPnJjZGV2Lm9m
X3hsYXRlID0gcnp2MmhfdXNiMnBoeV9yZXNldF9vZl94bGF0ZTsNCj4gPiArCXByaXYtPnJjZGV2
Lm9mX25vZGUgPSBkZXYtPm9mX25vZGU7DQo+ID4gKwlwcml2LT5yY2Rldi5kZXYgPSBkZXY7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIGRldm1fcmVzZXRfY29udHJvbGxlcl9yZWdpc3RlcihkZXYsICZw
cml2LT5yY2Rldik7DQo+ID4gK30NCj4gPiArDQo+IA0KPiANCj4gVGhhbmtzDQo+IEFsb2sNCg0K


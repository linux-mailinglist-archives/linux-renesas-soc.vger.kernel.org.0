Return-Path: <linux-renesas-soc+bounces-13713-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798E1A462FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 15:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C07947A7B14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFB2221F3B;
	Wed, 26 Feb 2025 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EKIewDmZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24ED192B77;
	Wed, 26 Feb 2025 14:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740580379; cv=fail; b=MZqSn7oS3pY5KbRi3dgNtEyXQLo3GqQ+NIpMpz/zuvgUrAid12gLj+OtDp/VUj/tRHNR1CslldoBqNVQuolU0NpjD4MeF+YCN8+Rgc3ARRUFKPdK3e5/tiwVL5hMzMX6numNaa2aqquCSbL1Pp4QTmwicQhD7GkxGiiLG2Xc1X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740580379; c=relaxed/simple;
	bh=bxsxCCLK0OXxBS/JDJ+Yw9W6GBhlK9gvyABYWkzvnV4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DZalA7AUfiuCWKgWgMdNhcg/YDSUj1O5TTLm5YlHQ7Dbe2FAc8RIQbcZqtaURZGcvDRcvq8zvIgcGex0bgK8JHpYd80jumPTNx8YP/sB3GmgUku+DZ9ezDAmjkoURSGCRyW7eijbz3dJokHj9QPxepR7hVsclsDzhtCABVkPG8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EKIewDmZ; arc=fail smtp.client-ip=52.101.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1uIhdmpz98ah/9fXefpp2v1L1Ec67zhtXTmf5thxsQvy67KhRnP649aoJGZPcuM7DVZ/o8PQw94Xv548kU7zdzDBWvY0vNFSMquwuhASykKsuaccsVXmKOGOK7fl4lJSVre2FSm2LIN0w73nzJbmz9ToXiZeH7bck96jew/l33aRc4kJxqhY9hAoTBIf5yfduTWfFJigktfOVfKK7R8HcfKfuSEf4HzpoW7NrmR8+3Vyl0L/a517N3CAMlsSGZYbJN/RL/Bq+m/6DkK7ooCXLlf/8qIMsRIFPWsZKzIdnR98gkbtz2P8zhpuFMb/tC5um9fmwX2tNP+FrfnWNqPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxsxCCLK0OXxBS/JDJ+Yw9W6GBhlK9gvyABYWkzvnV4=;
 b=aMaShOzGOTKlrgR8R5nStZXLa2gThRmi7OFgjCLoVV4KL1jdaf0H8EzKjl6qxn0GmVWGSEFr4BcX+f5MBmQ3EapI04IPNO0er/YPjWXLmq+8i7LIh7J4IytuJK81QUOUAF+HwabWz8Gp1HKUTOF0/ne2BemcamCPVT/8UzxYejfr30FUHTNaVU3tWgZ3hW+Yilg9cff/3cgEWYqqVBY24NnhIxoQPPyxTxwNyMN2lQOuMBJUEFQZGTBcs9nu8Sa12VIcVQcxaOo9ZNqumqcAnDrNWcw0f/bmpOhyQtsNFUbUiI9qnrzETfxLWj81td5s+I+KirQ1cBeFkVRlJMdqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxsxCCLK0OXxBS/JDJ+Yw9W6GBhlK9gvyABYWkzvnV4=;
 b=EKIewDmZ9y59+alx9sBN/Zd1MIOo2dJkDYEloKdRYwV0CgV/6zFSjFN7uI5trcJGRPkbrv4/C1wudUUvG3x2gC+rp1hiPi2ceLimSjs93P5YOx4/7mX/JpU4M2kohbqxq2K/zR3m5YMDEbCyJTpR1lPDZS4KPqt5kwEwK8Xod3Q=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by TYWPR01MB9939.jpnprd01.prod.outlook.com (2603:1096:400:237::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 14:32:52 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%4]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 14:32:52 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "thierry.bultel@linatsea.fr"
	<thierry.bultel@linatsea.fr>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC
 option
Thread-Topic: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC
 option
Thread-Index: AQHbiE/a4G/Z4/2QWkiecfuwWl+1JrNZow+AgAAA7rA=
Date: Wed, 26 Feb 2025 14:32:52 +0000
Message-ID:
 <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org>
In-Reply-To: <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|TYWPR01MB9939:EE_
x-ms-office365-filtering-correlation-id: 9b884b29-5f1a-49ab-af33-08dd567273e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?x9/5bNxwxaDn5EvJ5oyUU6bbKmz+OBdWsMMJkdTLdqq0CKnGgcTLjckn8/?=
 =?iso-8859-1?Q?z6PSHOzXohk1P8gttuQ6mCr3/YIo5T60L06D1nHH78Or881Q3EHFA5NudG?=
 =?iso-8859-1?Q?Q7xSoIAB08mOog4ySZcep/5rBTLG6kDGFbaI1yOPaJxq2p9A8qWazDnVxi?=
 =?iso-8859-1?Q?1gPTL3vFzhR10cQKzFCWbi+HzOHvm6UPmk3r/RbgP4NAqCf3E0BLkK2F9O?=
 =?iso-8859-1?Q?CCywl76SPQpLnrFAotkZMAu6IsC07gPIgIRGdYus48283A84mCY7UOEKK7?=
 =?iso-8859-1?Q?PkKwo6MrNQF4916+JRw4hK6sC75CrLSFe7+P+YR9Zt5RTLa0nOmWkNNadq?=
 =?iso-8859-1?Q?ViQSmpuSto6+0oQjlCzliDCLhPdAnYwfha/ltosX9I65u/doW6KHen2gR6?=
 =?iso-8859-1?Q?PIW1syT9GcAg2MombL2vG+XvJC4y1iLfaMhG1Az1O4Zjhr25Vfow3uERL/?=
 =?iso-8859-1?Q?fw/ekE7T2D9rWJK1H7zC9n3sSb9LuaWD4h28/MdP4mtRmE6o6wIye5x6dx?=
 =?iso-8859-1?Q?PFr7xd+s02DK2VO3GEUkqY9IqwRip3M18JJO75PxpAjt60tjnWZahG1HYO?=
 =?iso-8859-1?Q?oyYmG+tBgFfm0Jluagf2r/kBMB+ct34J4uZXixZ1Tav5ms5v56RIMmSMeF?=
 =?iso-8859-1?Q?sZkv0D7eBIVR86+P0hoF2gV5KTf6pOwUa/u65OcV3bDJusR7ZoW+aTZJN5?=
 =?iso-8859-1?Q?HzCPW1tRhIFtguKcoLhEyYUPF0zfjpCNYt30Eet+SuvwqVBS7it65cN11t?=
 =?iso-8859-1?Q?UTMv8w/C7SQUXMYPfTvFpLaPyhzfdj9oTstNFuJrSwKnOyhhAHsv32PHpi?=
 =?iso-8859-1?Q?gIlWQrzMDsU1DucY/ZzlebCLJmREZqxmqZfG2+dRykI6drrFe75rZtr6t/?=
 =?iso-8859-1?Q?4tmI8uI3f60Svk0CPmzonVosIXeGyD9MNxHJjwsBq3JJV0pmTE5ICioECJ?=
 =?iso-8859-1?Q?u56aLbxS5zpAUR+dsJKT3U/CesrLmTcMKVdejQnebv/HoGvX91wUkS2ICS?=
 =?iso-8859-1?Q?OR5BV0nsXfxqJyHfcUm51X8lRt+T/wMqM3s6QxGEtkz7yKI/ifV2+35sKk?=
 =?iso-8859-1?Q?elliePYHtCUGl/X9RTD2XCO8mR3K5uYdXCsorufdCOBFvZDhLv4DO0G7lz?=
 =?iso-8859-1?Q?J9UkmuL2bxY6ELE6qyKvAWJv9y6ESTmi8l4gLSH8HhIWantBeeyQ3bAPHB?=
 =?iso-8859-1?Q?njK7yZF303JL7/6Qus+HrVKXKObq4XqxwbthEax3KZ+FEn1luxoY3KvOjD?=
 =?iso-8859-1?Q?BvBlvLFwyOnJtUJk3MBZWgO5uVp0HMXGyrsyWwU/oLDLGt4zrwxt3pI7xl?=
 =?iso-8859-1?Q?RSbTDF0eF8r5pwDlSuGsdHh0e6Kyw9o8hAQFtq9gCl/qr7G0ql+qSwcmTH?=
 =?iso-8859-1?Q?/1rfqSU6U+q0C0LLwwgfGxsQ03avzvk5twOrLA8mcE+xftl0Xq77hFNRpL?=
 =?iso-8859-1?Q?jXhM/+x9Sr7/qiWdJI3o3o2gy4DqXcnOR+yJesKiLee2MPoLRnuR/3C+1c?=
 =?iso-8859-1?Q?/FejjVc/oxo/lltBCiBjLv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Hl4Tof2nAFcN443myx8TXrkT9nabTZuLwfRn/L9LqxnacUt4zX3TFMnk6D?=
 =?iso-8859-1?Q?eABJMSs8hpiyw9Ah/W4RSxmpsMqI+WKisDEQ0mhbkFgeO9Q7F885nczXXN?=
 =?iso-8859-1?Q?939p/LTCvAtUkCCel/sC1ik8aGEVg95oWQJGzlHHym3/LPyF29W/b9wwOR?=
 =?iso-8859-1?Q?DmFhqBFwpNanJXeHEVlntGsdxo1jj+HS0bpWv/arLviMXsPyD/CEw5VDIu?=
 =?iso-8859-1?Q?9j8YVkI3qXPCTX7WIYLO5wdlzC1tFYOYL9bvaL/8MIN9Lxf4gPGhNPvIF5?=
 =?iso-8859-1?Q?aA9mBijvz4eLInX+34RPk5/VrGugGimZS08QHtY6wjdlRSMAKgfQJl6JTg?=
 =?iso-8859-1?Q?4deChCCrr9ZVZg1lHJskyUPu8TIb5webNNa737Gfw8iATvc0ATyIB6J495?=
 =?iso-8859-1?Q?WHQ8SbP+QyqcyG8qioEYgKrRuJpCO/k0JnsV6lCZv1RAGn5/nO+AmkMimy?=
 =?iso-8859-1?Q?U0/PPYTPJKBWCjfrY/MR7n7kUMOYc7jdDKlNgoZjU0l6SqBEYLnzyK+2s2?=
 =?iso-8859-1?Q?WY12DZRUtO60uVsoOO0jXDa7sATR+NPck7IZYSmXzPRDHBhyREYoma5gzG?=
 =?iso-8859-1?Q?9x3w1BMfCvg8pZFiJdDOrpkQJe1XDaZ7AYl8xFygyi3fpybUiO8Vzz0QOk?=
 =?iso-8859-1?Q?dqSdQADtuZvg5BoWNn99eNweUENTNXmv6ed/Qr2RUlrzeB8fswFqzK8FgW?=
 =?iso-8859-1?Q?Fq1gapLhyep3a5l0nSNKYm+LhYzI4ossC0rHWoDysc0ze9dTlsMjQO3urW?=
 =?iso-8859-1?Q?/UNvKyllb4bo2m4cUCuatoDr3G/XOJiKVsQ6FjA6Z2IJZ2g7MJPyMikD5o?=
 =?iso-8859-1?Q?5NVDPHlv6XGNgVL3peClxOIGo2JbW3sHxboT5H9oZV2iaCNcnzGao/BhC9?=
 =?iso-8859-1?Q?fagN8SCJWbbXMWfdON/v4E0VvM+p9m8wObBuS/JuUYZ2OGFe/vhgC6vnhF?=
 =?iso-8859-1?Q?7fDFEuFopHfbX5ojtbpgxG7xE1Tj4a19DznYq3Yr7sslpHMTK+Xd3XEHQm?=
 =?iso-8859-1?Q?YGjfkg9z/2s7hvqIU8Krty22eggeMuPFsrnfyXrABRaRUO7T+cImbGKYo8?=
 =?iso-8859-1?Q?NyBcPrLY5X3S2GiXGpB++a8ejBjsKU/+Q1mWFMdwgXamhb7dkjwnbWwFbm?=
 =?iso-8859-1?Q?Gb4kLc5AFD896Diepnz+Xcd58sRYyzv3GDWo1TrPSTAmwd/kzP1fBOmlb9?=
 =?iso-8859-1?Q?XsNh3OBGx0QNbfs+hr4Md7bQax8whtA/lTkrjpmGhfUQEtrjk5uDIcdfGN?=
 =?iso-8859-1?Q?0FHfCioMbGrZC93CDOu8d3uTJ3q1W6if2Q8L29Z/gvyDJsHjbyNz7wZU36?=
 =?iso-8859-1?Q?xwezSaxelvezhJvHeswy0Q09jYh8xy7caXuTXbyzQvFXVT/tD4EM6pv1xo?=
 =?iso-8859-1?Q?IeWqHsnGBOJvoS9ffJax0OnRu/IocY0RNj9EmRbv77jZFOd1BF+uRHIBYv?=
 =?iso-8859-1?Q?aCfQ2mO6hQKmtuzvC7bonnUWSX+zmeWXR6t6kdAtwOlWspChwQYAjW8b2b?=
 =?iso-8859-1?Q?DT2UIofm53SIQar72fZcDx2I91qvsfSWKEX+4+nMl9veKjhr/aHJrdWu/l?=
 =?iso-8859-1?Q?FnNoQSJZMq5H9tp2INGdrWRLJH7uyAKmZoC2YpjZIN54tIC7jX4P45c4F3?=
 =?iso-8859-1?Q?sHmI3sLTV7PVJ7I3s9lhRI5OpGx007fjEmZ3isK/4h5agDznbp9gyyRg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b884b29-5f1a-49ab-af33-08dd567273e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 14:32:52.6845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4XYkuFPqe2TqQ+ehlWlAPomTwXnAruAF15gE5B3VZMbAHwrncg8y7P0ij9L4rIHxLuIOYSzKi4BHrF3UTN1IAp5L7pG55FNs6c6o5HWJ4Tp31/v1myp9poeKUxlrjGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9939

Hi Krysztof,

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>=20
>Sent: mercredi 26 f=E9vrier 2025 15:22
>To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>; thierry.bultel@lina=
tsea.fr
>Cc: linux-renesas-soc@vger.kernel.org; geert@linux-m68k.org; Paul Barker <=
paul.barker.ct@bp.renesas.com>; linux-arm->kernel@lists.infradead.org; linu=
x-kernel@vger.kernel.org
>Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC =
option
>
>On 26/02/2025 14:09, Thierry Bultel wrote:
>> Selects support for RZ/T2H (aka r9a09g077), and SCI (serial) specific=20
>> code for it.
>>=20
>> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
>> ---
>
>You never responded to my comments at v1. So I asked at v2. Still no answe=
r.
>
>That's v3 and still silence from your side.

Yes, I understand your position and have added a paragraph=20
at the end of the cover letter about this point.

Best regards
Thierry

>
>NAK
>
>Best regards,
>Krzysztof


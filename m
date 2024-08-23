Return-Path: <linux-renesas-soc+bounces-8128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0821D95C968
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 11:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DEDB1F23CF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C51114A092;
	Fri, 23 Aug 2024 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GZO9/N06"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856920DF4;
	Fri, 23 Aug 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724406118; cv=fail; b=mUUdhWGsj0o5hW7tydCdD/kOfvDnmv8sqvNTaMSUDE9koguRD8o7kP91AXFapWY9LgtQirHymVJ+oEDkgU/DpB5lzJRZW4yCkehg+KiJHCo1W9AKHvN4sjTUgSRwNQwniyfIPI6SwEizFcctN3za9NjBXHn0rK4BrlemmQNhN58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724406118; c=relaxed/simple;
	bh=oeu2fnE6cyGXnfp361TgMRKvRYiH+mfGRCtxzmusbWg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KGNRnpM7TrRjfkONxfkE76J26VigsOk01II3HmZvYS/Z9w/LuVytIcl+NPDBKD1XakOVmKpwoYSdD87TWlJ8UgPN98i2m/MMaaFOtLySU+CkZDWGDL7Xt/+HJnCuP+RMzNwYWHbKIPZoI7U64bXsliG2QL90yoiGKgnaOPhy9NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GZO9/N06; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/5qgSMmdt3kNlEZpQthWe2S7aS/EeF/EBGU14f9P01D4t3oM6t5mL/iTpjBZZMB/MQ2ocJaYC8+LKA5AHvh2XIA5DMpDxip5R3Sa/RH8lYk7clalkwVo1TFbI58geT0EkXl1VG4kPq2MIphFzumpFLBvldHsf0eTG3QURp/eGZpiBC4Wd59q6Q/l70mx+AVEEZwQ8ZtSqndrW+/0fkULqXTyM+Yq65N9Q+vs8OmH8J9cgJLkuCgLfIWTt0bcDJldn5Gwx0w1gGehsxnvhQ9VCuoeXzcT/H6YEFeSHJz9+CXnK3QY861CTdi4XjojwU5oYDP+AWaxGYz9LRjpE6a9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DL9kpuyl+sEwbYgcTnjrx2uKqxa3xECf3XEXw1ud3F0=;
 b=tRNFiHsftMhk0tTCjBsrphSVQGH1ZakmqRDrlgbQqhHGDUPtXCj4Ywu+CwvnYKz7BIUav9AXYzHe7I6SmYB0IniPjoko3F9NYaWzSE51p4mlVOGL5vDXfgwOu9ZUqYiGDrGEYnhSYT0OK9oBHW1zoETZlme+O+2kz8FqIkeZC4b26qW+yQS5HKORDivXVM3t1YfVaqtdjcJR3XZ8qdpXOA5o8BejSm91G+j5RtCQuTt3cak4CutZ0g8X8s6xx2gLnwe8MumWY8t9kv/8SuM/qoApK2vgFN9aU/JiUkVt/bpB7qpYPNW5y4hBcd3w02IMnkkh3amspfmixd8NtPkpaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL9kpuyl+sEwbYgcTnjrx2uKqxa3xECf3XEXw1ud3F0=;
 b=GZO9/N06ycbvx3xioj795sFov1SWY2KoYzHNvZTKdpRR8iPG+pTtu/I+MhsMNonu0adnBq/qioCJ/WHoUoKXt7EXIxjevmlLs7/9gPIbP8gtvTl7FpaT0DXiPwkL0la3oeWi+Q2na9BiQgld21He4SUsxTC1LqL0fmqADoWQ94c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10715.jpnprd01.prod.outlook.com (2603:1096:400:297::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 09:41:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 09:41:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Serge Semin <fancer.lancer@gmail.com>
CC: Yangtao Li <frank.li@vivo.com>, "clement.leger@bootlin.com"
	<clement.leger@bootlin.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "olteanv@gmail.com"
	<olteanv@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"ulli.kroll@googlemail.com" <ulli.kroll@googlemail.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"marcin.s.wojtas@gmail.com" <marcin.s.wojtas@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"joabreu@synopsys.com" <joabreu@synopsys.com>, "mcoquelin.stm32@gmail.com"
	<mcoquelin.stm32@gmail.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"kees@kernel.org" <kees@kernel.org>, "justinstitt@google.com"
	<justinstitt@google.com>, "u.kleine-koenig@pengutronix.de"
	<u.kleine-koenig@pengutronix.de>, "horms@kernel.org" <horms@kernel.org>,
	"sd@queasysnail.net" <sd@queasysnail.net>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>
Subject: RE: [net-next v2 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Thread-Topic: [net-next v2 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Thread-Index: AQHa9Tx0ywHLxX1O1U+AWstZvr6hCrI0jxTggAAGi4CAAAEcgA==
Date: Fri, 23 Aug 2024 09:41:51 +0000
Message-ID:
 <TY3PR01MB113460A7A4FCC4715108CF2A886882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-3-frank.li@vivo.com>
 <qx4k2xehasda7zj6vt3bygdh3scehiiwniqvljj4b4rjde25a5@ys4oqsithhwi>
 <TY3PR01MB11346C33198DE80DD9DD1CC3C86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <zxfzr5s3hpmn5nkhjess5w2ruozdsco3lcakhfid67qeld2lpi@foykn7w4ltd3>
In-Reply-To: <zxfzr5s3hpmn5nkhjess5w2ruozdsco3lcakhfid67qeld2lpi@foykn7w4ltd3>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10715:EE_
x-ms-office365-filtering-correlation-id: 760765f2-361c-4bef-48a3-08dcc357d0ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qgqLNKshLy0RRwTnC295nasZLo33dEJ6BDr1M/wU1ZAPwjBXHUDBoNjH6fjB?=
 =?us-ascii?Q?AawCznjaCOHzDU0fGRl3ZtvyDLszUGa/s2I+VwqF46H12a9FAMyRwZiMKxFZ?=
 =?us-ascii?Q?sOPq0AUuSd2LKmt7twu2wjTcTg1p4nBOdbajkyr0gzJOY2uqGWaVVeFqtdXQ?=
 =?us-ascii?Q?Ms4pjaK8gfX7+yE/mz1VtBZkevi8kAtUh4OhgiuFjoZ5hCTwX83Eh02UF1r2?=
 =?us-ascii?Q?DPDFbnH2loW61d9I1+SrodYuWE5W9B0z6XKNQQLsRhMFtT9q8VHvvI3uZ8fi?=
 =?us-ascii?Q?uK2/jGs0TyWfQkZGClLvTcZBClkBbjf7UdrPjflgWHkZPZ32NQsu0HatvuvN?=
 =?us-ascii?Q?xVCUzQ5ZIZTt39hhHcN66DlFSVha8tuVb0QF5zOeeX+g5iLztwvhXrDj7dMR?=
 =?us-ascii?Q?FDwpPjHk/1Jq6ZFSoTUiq361CH6U+QTtJ/fG0D++OyBHYHXIq4FCo1iML60i?=
 =?us-ascii?Q?63Y8mYuQ+HVv09PuxvYGxsx9gHSVjI8wZWzTmgvSA5vVqZYGOaQObHDU6aNj?=
 =?us-ascii?Q?S/7y6tt2b3R3zNI8XqQ4GVMu4uOj/jhgzecTek1LSSJyeH3EfcR6UvW/hwv8?=
 =?us-ascii?Q?vFL9RvPbdLjGVqig9WSrekxIY617LNj0dbkqRqk7Cxo8BL4nJDFf2XrHy+8U?=
 =?us-ascii?Q?9tQdcBU2MJgL4kfJnShsTMOdeV+8NaQwVSbKTGtT9WRGq3LVdC+3vKqQbFTm?=
 =?us-ascii?Q?B05TFLvrmA4PzhNbvkSMtCGn3pjptLnRO/YS7efE2VpY1kSSFNd6P49R968o?=
 =?us-ascii?Q?a5VD8csmNFMV/SDuuW2Hk/P4FEZjEc+aqL11r10Bn/vnaNuHpe0kpDFjpBI9?=
 =?us-ascii?Q?GLdMEgQ01+NStMHJtdLmsBnTvlwgJRvJEZFu+M6NggrsitOcSA15XeXmGa4E?=
 =?us-ascii?Q?3N2A3K+ogQPIMbBXgtOpVkbPbEZ/Jji3xFIqIVELV29dBbQgx1aHc53opjrw?=
 =?us-ascii?Q?ez+7A2U6mzP+1QRseardqB9oIDRoz/4x5ulexJWjJzXVjBD/N2ZhIAQkRUSI?=
 =?us-ascii?Q?HMxDL09RhzU5TonOmJhzgSm0o5aOXN2pZ4UT/rKVpArmqVOFLizezPLAmjqA?=
 =?us-ascii?Q?8vIs+QJlrtILsqXoFm76tuJWG4WQBmGJ/ppGWnoGBiQFVJVa+VA0MA0AzKwT?=
 =?us-ascii?Q?UxUwp7+xuLmCglFXC8Cgen8g+UTryAA2EmJI4JZDt+F257XhBJ86u+/XSCWG?=
 =?us-ascii?Q?7aR1n9NaB963hcDYuwI+Nw3ArcmjC/1QKaj3V0G40tzR5wPPaUV01F2y8IdL?=
 =?us-ascii?Q?BWBjhjM+VhMDcQ81Ar8eOXw66/1lCc2hkmxFIJBIt+0PI7bccyT0xFpwOtCE?=
 =?us-ascii?Q?6PukhfPFpm0DOKirTIboEGr8lEF54goqrdFPhMTLe1hPf/WWwBYAAxcf3DiN?=
 =?us-ascii?Q?sHTl1cTZ11CTwMixzUjfev7EICYjhBH2F9FNKy6i7TkNdHiucQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JRpQTCTB7yG7Xxy7q7jMoqN/Bu7bCDW0f9Ac2VYvfKzIfDBeeaWu/GMn6Uu4?=
 =?us-ascii?Q?Rl0ITZjf6rvsWPvyodhZTcslu1ubkpRRCSoIidolnblb9wh22UQNdknG31v3?=
 =?us-ascii?Q?98ENLiR2KgdeYWzdtsdHKL37RmzkUTLbXqaZONpkgPkV68u0/5704HXiC7nV?=
 =?us-ascii?Q?SmBA7N+udEqrIjWpds6vfNmvXNRXBq275XVM68vWOnypTlfzBPUebdOQTx7u?=
 =?us-ascii?Q?5cbppX1BbZY9mm2XRA9wZykl+mYKxm5IGWiGXEdSsKAstegnoMpbdlKzEbYA?=
 =?us-ascii?Q?2byxXdfK9XB2i3HZ7LAaNtamqOynKkeVhg2t8ox3rT8uCk5m1ZL/UyjU0RLS?=
 =?us-ascii?Q?jHdg8VAXKAR10nlbv+WoRsRlyQdOkNKHDEKvptHXT4TrUwjLFU2YUuKUTAC3?=
 =?us-ascii?Q?3I0rsyqHGyLL5WK9CLIvOSde3N1+6xHJfBv4V4gq3SZrLLgGLXd9a258+OYe?=
 =?us-ascii?Q?ZJnVxDUjcY8xAnn8/GQadtS+86TWyjCgdQZ8XUsZTTCaS4rOFEvg837UlYSZ?=
 =?us-ascii?Q?Zj/hUhTudXXOY36WLfD0q4hPSnLywDlek3PJQxL3OnozoLXA1WrdnSH+Uvf8?=
 =?us-ascii?Q?qCwKsxF0YCPm/erUKfyN1VHeFrZZD4kDrFhnWgWGXA4+arp7sWDbYD58pLPJ?=
 =?us-ascii?Q?iRYNOB0MEfh0+42FZYj25AhfbUQS2xAeLsRAqMmoeE4Dobo598H3iKsLdf5C?=
 =?us-ascii?Q?xzimoQ7WNno94nKy3A+4P6rR7sXt2J+K0uvdjVBT4wuCV8djYJLiwB0VxdCE?=
 =?us-ascii?Q?7AxR5+enJR+/+4SvHqhcvDb/omr+z1hkwEofFNtbTM4YLgfKsDIXZtwMUkrG?=
 =?us-ascii?Q?6SVmtJZvfbtNXr0w5gAuZTTyGFB9qt1AOmUq43xZNmSfVEUHs2n3wg0tMw4h?=
 =?us-ascii?Q?apbIqT786jHXy6PRqfNAeZrB4GXezqA0GEh3z+GLskf7aCbyjBZXRbC9DsP5?=
 =?us-ascii?Q?3FwXQAU+JapNPS5s1BIbVil/0ot9TGuSLVtxI9dYqqLHZD1NjwTlynejyUH8?=
 =?us-ascii?Q?6sShQNo8EQifAZJ8HUvYxbjKVFRzK+FK7+9GC96mwrp/j+N5kNH3xWwOk6oD?=
 =?us-ascii?Q?qs/3K08kgS7+vp3ILNO0BiU+S5gPVgbce0883kAxf84Em+ntMMBQeVvoKS8q?=
 =?us-ascii?Q?nrkW2PYam0E0SWMVgJk42Hq/CW9JV0NdzI3JNYIJfBzCvZlkNXQhyvddhMa9?=
 =?us-ascii?Q?pZOvk1M0VWBzJOGOmuIp3G9Tt8AG3wgKq9eWfT2+bUOXjNRM9bkAoVanbbl7?=
 =?us-ascii?Q?09Mtp47NPmSzMY/rC3ZkhIQjfpbnFPj8ikiOSDDIaPT/ZBNPs7XAnrC0Flw/?=
 =?us-ascii?Q?qrB5owulYYOkolkN7uiXPdsvTU1iGyYMHUfXv26+8DWW/U0trnmB4URU8IAT?=
 =?us-ascii?Q?T9qSaTHDHamujoOOdn0JkyNBG6RbxKmW/xud2xlMOqMZ3rr00nV7PFUSLJK/?=
 =?us-ascii?Q?sFzSzSPf+1y9/oM87+dNbQYYTX5p+SBEysh12YoJeoyk6DjAz69wgerCSKJ9?=
 =?us-ascii?Q?7zR8p4wn98gTdmQBBRYLalWEfs63rcMhIGBwag1yXohPWlw354v83gZt6KG4?=
 =?us-ascii?Q?RePsJM5KAdLIzYbFVNyZ6qmI/9NYE05tACGSQXU7ZTEe3kPTe0c74oMQc1oQ?=
 =?us-ascii?Q?VQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 760765f2-361c-4bef-48a3-08dcc357d0ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 09:41:51.1862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ge0eg4aHfjFCeOrrIkUtPWM/JXQ0e2KKYCUUJeh0Inx2Gric0vXMEyNmOP4lCKcRl8N0ywzvMBUdHnuYz5hAh2XQOsRP2iKjwWNTWh1aCg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10715



> -----Original Message-----
> From: Serge Semin <fancer.lancer@gmail.com>
> Sent: Friday, August 23, 2024 10:37 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Yangtao Li <frank.li@vivo.com>; clement.leger@bootlin.com; andrew@lun=
n.ch; f.fainelli@gmail.com;
> olteanv@gmail.com; davem@davemloft.net; edumazet@google.com; kuba@kernel.=
org; pabeni@redhat.com;
> ulli.kroll@googlemail.com; linus.walleij@linaro.org; marcin.s.wojtas@gmai=
l.com; linux@armlinux.org.uk;
> alexandre.torgue@foss.st.com; joabreu@synopsys.com; mcoquelin.stm32@gmail=
.com; hkallweit1@gmail.com;
> kees@kernel.org; justinstitt@google.com; u.kleine-koenig@pengutronix.de; =
horms@kernel.org;
> sd@queasysnail.net; linux-renesas-soc@vger.kernel.org; netdev@vger.kernel=
.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-stm32=
@st-md-
> mailman.stormreply.com; Maxime Chevallier <maxime.chevallier@bootlin.com>
> Subject: Re: [net-next v2 2/9] net: stmmac: platform: Convert to devm_clk=
_get_enabled() and
> devm_clk_get_optional_enabled()
>=20
> Hi Biju
>=20
> On Fri, Aug 23, 2024 at 09:15:06AM +0000, Biju Das wrote:
> > Hi Serge Semin,
> >
> > > -----Original Message-----
> > > From: Serge Semin <fancer.lancer@gmail.com>
> > > Sent: Friday, August 23, 2024 10:11 AM
> > > Subject: Re: [net-next v2 2/9] net: stmmac: platform: Convert to
> > > devm_clk_get_enabled() and
> > > devm_clk_get_optional_enabled()
> > >
> > > Hi Yangtao
> > >
> > > On Fri, Aug 23, 2024 at 01:21:14AM -0600, Yangtao Li wrote:
> > > > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled() to
> > > > simplify code.
> > > >
> > > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > > ---
> > > > v2:
> > > > -remove unused 'ret'
> > > > -fix incompatible-pointer-types
> > > >
> > > >  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35
> > > > +++++--------------
> > > >  1 file changed, 8 insertions(+), 27 deletions(-)
> > > >
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > > index ad868e8d195d..1a66baaa4081 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > > @@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct
> > > > device_node *np)  static void stmmac_remove_config_dt(struct platfo=
rm_device *pdev,
> > > >  				    struct plat_stmmacenet_data *plat)  {
> > > > -	clk_disable_unprepare(plat->stmmac_clk);
> > > > -	clk_disable_unprepare(plat->pclk);
> > > >  	of_node_put(plat->phy_node);
> > > >  	of_node_put(plat->mdio_node);
> > > >  }
> > > > @@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *=
pdev, u8 *mac)
> > > >  	struct plat_stmmacenet_data *plat;
> > > >  	struct stmmac_dma_cfg *dma_cfg;
> > > >  	int phy_mode;
> > > > -	void *ret;
> > > >  	int rc;
> > > >
> > > >  	plat =3D devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL); @@
> > > > -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device
> > > > *pdev, u8 *mac)
> > > >
> > > >  	/* clock setup */
> > > >  	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
> > > > -		plat->stmmac_clk =3D devm_clk_get(&pdev->dev,
> > > > -						STMMAC_RESOURCE_NAME);
> > > > +		plat->stmmac_clk =3D devm_clk_get_enabled(&pdev->dev,
> > > > +STMMAC_RESOURCE_NAME);
> > > >  		if (IS_ERR(plat->stmmac_clk)) {
> > > >  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
> > > >  			plat->stmmac_clk =3D NULL;
> > > >  		}
> > > > -		clk_prepare_enable(plat->stmmac_clk);
> > > >  	}
> > > >
> > > > -	plat->pclk =3D devm_clk_get_optional(&pdev->dev, "pclk");
> > > > -	if (IS_ERR(plat->pclk)) {
> > > > -		ret =3D plat->pclk;
> > > > -		goto error_pclk_get;
> > > > -	}
> > > > -	clk_prepare_enable(plat->pclk);
> > > > +	plat->pclk =3D devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> > > > +	if (IS_ERR(plat->pclk))
> > >
> > > > +		return (void *)plat->pclk;
> > >
> > > Use the ERR_CAST() macro instead of the open coded void type cast.
> >
>=20
> > Which is better ERR_PTR or ERR_CAST in this case?
>=20
> The only correct macro in this case is ERR_CAST() which implies one error=
-pointer cast to another.
> Open-coding the pointers cast is discouraged.
>=20
> The ERR_PTR() macro is utilized to cast an _integer-error_ to an error-po=
inter.

Thanks for the clarification. Make sense.

Cheers,
Biju


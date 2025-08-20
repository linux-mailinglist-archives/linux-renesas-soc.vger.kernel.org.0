Return-Path: <linux-renesas-soc+bounces-20740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF98CB2D3EA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 08:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31F831C4149D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 06:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E72E2836AF;
	Wed, 20 Aug 2025 06:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NPJdafik"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0801A1F4606;
	Wed, 20 Aug 2025 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755670460; cv=fail; b=dFNIIboG/5UsOl2KpXM+tW3JZP2xxyI4mzZRydH995SpzrizNE8Rdbbw3zfnplit7biBMDUhob45Q6KAKKoP9pFX3ILsxeoo/HYi+1DHhLBA5EcFKcwk2r52afpkUtunmwTQUBGAqC/gk+TwZ11W1pzk3zvEnxxXgyR9AoFCjDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755670460; c=relaxed/simple;
	bh=YCqLBHT//KxXILB/EJOR0B9jXhMKGQ2a9AmK/+7XP3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p3wSyM9nWQS3MT6wYYKQ/jlRX5V3+n9C6ktmh41q9X4twUX2OiQ41ksfS9tmCO4fRwdzTIzd/r7oKVhoK0db4biVrB0nW9fbTHHonR/oHrVoxzFG4H7SV+uK5EhimWWignqMuxdOAc59/wJAOPIJ1b0FabzLyqt8QvOd3VcenJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NPJdafik; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5ZgpGe5w6MdkWTRPf32Ik+UclXk65kekcDvF1XercLuEinxu8nEf7sVVS3S7IMYAvVer9OzZ19HZgstZojHg+YKCv0onR6eEoghTF36He0QIDEik6V9Nf38Pj+0Yo6eFC4LYCpz5MIqFzQnMw9mtZU1snj3dHYxZnmIAhVvq8/BFvsbhX9EQjqQncvxCnmX22c/XE6eWpeBKEyOx17H0XqEVpkezFMYsuwn/fWbiBtwBS9K4vvayD3xkRnzf+NnAjgf+eKmP+4KMBp+4mfPyhxNsp+IqK669WOEP+MwacNepgxBTPTnQWdW2NWCu9e0DrF3/PTLwst9W5yJnJE0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTK+6mULbUrrWHs1K99cEUHQpJO8D+cUp4q7g9Qu3+s=;
 b=Ma8xgh8J12gj0uJfftbHsFiMxRsttZAWVucIQvwwVCJPyDHAmAAnZLOYa1RgeqWxvFzT6n+SWEyzCTHPrVp9kVREBMTBRaymdjzhiw60RGogeCcH8psh5VG0pjS37hgC36XMmzNHfDh+jaBz21aq3DcG/9FNiNvtG6dlMWCjf8jxHF6RM/VWxFBXhRx76ojPo3h15zgzgYqdWP495UKYju6Ydg2Nfj2vt/81CBUTWFNmaE7EK+Ku4X/N8/Jm243d+AkG1LyVwt6ps/wX7mPb22tecp2UlUXlu29CjUajsbQ5U/pAPER3NN6JEOChyCXj1wdw7Et/QvHL6k4qHhycXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTK+6mULbUrrWHs1K99cEUHQpJO8D+cUp4q7g9Qu3+s=;
 b=NPJdafikx7/4Udhw/yRbKLgIwhDK7m2pJC9oCi5e3kTGHx+pF6J87ku7/BVTzAAsqbuD6AvFEIalehy4saKtHgmvfkOBrcqpDbmRy7OfjWQi6EuxuKFHOZJlVR3b5bWNATb7Dj5oC+MxD2aJa9JaaK/nQkG2MJzO/86m6y5KKms=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15046.jpnprd01.prod.outlook.com (2603:1096:405:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 06:14:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 06:14:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>, biju.das.au <biju.das.au@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mod
 clocks
Thread-Topic: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mod
 clocks
Thread-Index: AQHcDRnDguIrfslfREyvEDEISi1yTLRlFs2AgAYBbYA=
Date: Wed, 20 Aug 2025 06:14:13 +0000
Message-ID:
 <TY3PR01MB113460C30E29F6BE3F52EA85E8633A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250814124832.76266-3-biju.das.jz@bp.renesas.com>
 <202508160958.ounSAlER-lkp@intel.com>
In-Reply-To: <202508160958.ounSAlER-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15046:EE_
x-ms-office365-filtering-correlation-id: 5dffaeff-6ef2-4d9b-6e8b-08dddfb0c8bc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tj6/KprS0pcRanMMHDHv/psRZG4S276AAtMzHrWS31VjvIbR0CmvygEJbCxZ?=
 =?us-ascii?Q?QeGbTcSXqH/Ixe1LsyJySRovhvhEUehjEQSlmaTD8AFATp/g8FcH4hB0P+Cx?=
 =?us-ascii?Q?s+DMfHDZqZxQSEBslpt8bdZNP7gAn2XexVlQbmgKniKEAgLhnnOTLS+CQUYw?=
 =?us-ascii?Q?R+K6gMm8g/o4awBwUnNq+/wK3WimjJ0GENCOzt50Ho/cyWzkfKJnVk9QsJr2?=
 =?us-ascii?Q?vzEkGa8ChQtErjnZWybCy63Q45STDjOqnzWwdox1hhTL/LcFioGnlJOpSQFJ?=
 =?us-ascii?Q?BiKhF2TSrPRwc9NRoyyyNeE7F6oNslMZLU44IjRVj1h/7ANrJweV8kmXQxGT?=
 =?us-ascii?Q?LwasAOJYUnUbhDr6BMIfZP9eQ+P4G3Y4s5AdCz4ASQZB3hb9i1CZGZ0uxpL7?=
 =?us-ascii?Q?cSe4Ep6vNJt22mZyAzkJkCI7jiv/q1ytBDLf2UD2lUxQL6yIT8VUQ0hm1hSP?=
 =?us-ascii?Q?NfSwcogA06ljJiaka6X8TY4Jyn9+dBhgvwHK037BszuV5Zfb/RgzEvEtvgpW?=
 =?us-ascii?Q?JxVdPY/qLyqcgWM6UScZfVVMnq38X6VUd/Rbawl8GgQoZ88+TE9/eyIVsO4d?=
 =?us-ascii?Q?1RNOPBce7JfZDL5Zy0bMeOQ3AJ4eASF+jrFQEcta8XcoXhQrginW5I67C6r6?=
 =?us-ascii?Q?Ey6VorTIApjiksolQ7FJNk8Wf4qGEb4M/YzBFpcJX1PTrMI3Icyvsz5jheUh?=
 =?us-ascii?Q?Md13r7mncVY+d2hcaHtX0+CDncwYXCnsFnqsPV2bSKk5/SbDqMP7GJ6B1TrN?=
 =?us-ascii?Q?gbwDJroq+xVYkTlvVSXf0Es5X9QLM1ViAHFLNfIMTGZow0ZjGNjeXA61McC5?=
 =?us-ascii?Q?YOQ8pLujBCiL6A+IY82W18KIlJmlEJbtz6V+ARW99WGJqrQe60hbGokidB31?=
 =?us-ascii?Q?ctZl1/ILPTupCZU03t6SSmp+YOws2dp8vEh5j3Xyt4OrFlbPr2nYUEys9Ki3?=
 =?us-ascii?Q?L76KfmPDHTfRz6GAin7bxghN+EbiPWlBf1SOGq98Pcj88N0cFP6+dmeJvK8J?=
 =?us-ascii?Q?Dru9LSAa5aEhOPA32SuyODVdblK9H1Dso7TiY4RtdN6nZYDpWCHJSF9RjWor?=
 =?us-ascii?Q?LaqncNbX8XbcYMpZA1uYjHVX8YQzX7f2ow7me0qZrEKyVuyRoYC3GEQ2zhWK?=
 =?us-ascii?Q?klyt93DpPQL6I2/1iNhQgjlGzRytEBirWrt5gIpjByLg+RUUtRvSpJE9swNS?=
 =?us-ascii?Q?tsUos5jn2Efm089ygqcbsOLv/RZX9wD5r6PmpAud6/TqO6LNWfDfIx/00tqh?=
 =?us-ascii?Q?lViRygyINzT/DXizrJJKVRcl9+ielSGVW5/3qDKM7cGErIyJNvHswT2Qida4?=
 =?us-ascii?Q?pQnv48/CtRo4tAeiNt+BF9fS/6JY2xImzGPhejs/1NKR0g8KixagYY04gSsC?=
 =?us-ascii?Q?yQbzCXtkQhZ5gJ7N+UUeNZRfb98APcf9Ne1rQ89Kl/ISPNGk3e0+cUJYTsGk?=
 =?us-ascii?Q?5C3x+GAa0EeOp81A86AaqkoN0DX414qC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DvzRRjXOWJ+5bX13BTMCeFATkrdUsBTHfKp1yL9EQu7IpwYvTFVZqv3hDaSg?=
 =?us-ascii?Q?QJJLsAPBjKKBIknx/eUu80NAt6xB0I+o7A8CD+c6CubDT8fjDujHmZifrn2L?=
 =?us-ascii?Q?0ypaDe2dwqzmFgj2jnri+85k789GhhmquJYXDktkpl8ZkNhpiZslM2BVVjwZ?=
 =?us-ascii?Q?qW5eRD4QJBxQGeVqkAmmZOPT+RhN+fduJr0Dw9Oh9SNpI2EBVnE6H+m0j/mI?=
 =?us-ascii?Q?+fwoFCZxJ5/VHuQcqTkVTYywZMbgUCvdD9g0Nz2jjo1xzkLm+Ac8T2wfPxAx?=
 =?us-ascii?Q?Njh4JcOD771kiCiFP22m86KaUpvNLhpY7p5z93O3IF8Q64d6KMoWgA7DdKCw?=
 =?us-ascii?Q?AA7uEXceJKu3mdeEjrhYdeMxOCiLtGF5MS+QKioNcD9vjSe/DT2wkrg9MdFK?=
 =?us-ascii?Q?tmWRASA2moJlHOcrGpSJSj4vgo0qpAF/IJkDukbmjXhC9JKe0C7k4iwk8ebt?=
 =?us-ascii?Q?ApPSwdWDucXz7dvI0dw8mPg0D6r2SYvGZe7ktXzgZCKpYNj1HQnb3qSUinWC?=
 =?us-ascii?Q?wwNpAKKMREu60fwv5ZhUuIDdY4D9zWGS8ap9bJYre9GrijBCRftmoBBsGVQ3?=
 =?us-ascii?Q?Ih6Fy8VhM6eZmNnKSgW4CS+IBWBtVd8H+yuLCxoHwCKf33A7hKnxy9UVQN+y?=
 =?us-ascii?Q?3sLXDlATjzhlUwZ4p+O/HBbl5/AE72VeHiDh9YVTyH4XfsSJfChkYgMa8WBU?=
 =?us-ascii?Q?DoKMRGOwt2EBJRG6tQnf1eRz+0pN2zVO1AebJbWTgpRdrzMnX8uLny7Ni4Db?=
 =?us-ascii?Q?tafRmwql68qU04CyrBld3DsQSYAszPxjci2lXYjx4GdOHNMNKBCLq7q3qAbS?=
 =?us-ascii?Q?kd8JgD1poo8u3f2LARFmK1ZgKUpkZBZ/izgELi5TNMT+1Zra/zuYrQFD0xdW?=
 =?us-ascii?Q?2G2er4MQTaSRtGA+xR+1eUUQRvIPkqTvAM4W++gjBfuWerVniidQjzxGzB1l?=
 =?us-ascii?Q?Pu8rhx4CHFPJfuc4LTmTabAiw9WUr03MptyPJXC40exowBnmimikLnJqi2AY?=
 =?us-ascii?Q?XQhWXLxecHzzs0ORlhJgVNgcDuvU/zrHZeKkBq7khJbQFtuu1ekqa2ZObtq5?=
 =?us-ascii?Q?Lhvje/r7eKboN8A9bNoB6M2HrooYBmEUl4Q68bs8bCSIrotLXORgPznSuz+E?=
 =?us-ascii?Q?H6sBo6eafQrYM7cWpps5g25rkFEF7t9LoRyRtD59Htwiky68KCb+3nCxJuFG?=
 =?us-ascii?Q?RfYyYTYIyxxCwDFq5/Eyj3KwbPHbXyV1KE6twCL020miK3EuagHR7jPfo/iQ?=
 =?us-ascii?Q?mb89btUeTJXd70DHkJPOPZEsvGI/tJ36SJ58iTsx5L/QccoGjGNUvR8BmZ+3?=
 =?us-ascii?Q?q/11ZWk1vr220MiwomtKPhS9VcWEVYQY/09ahf7IKMnOgqiVu+e3J7MH4UAR?=
 =?us-ascii?Q?43zmZYD9jzGgMS9muorQNJpR49xFL+B3ugX4E0OvT9EYGyWpTNGwXsUJbNhv?=
 =?us-ascii?Q?qwT0QaVJOMAz6mbj2YP597dTnYky/R1qKfkLtklitbOAZiSUY3iWn49S0nwl?=
 =?us-ascii?Q?qofKzLevZh/hBUbNXyVKhC9e8PCxmhBrI9Q6d6fe/gEEoLlUSf6FR0oeVxpB?=
 =?us-ascii?Q?RUU2E7HXEKT/eywTYT+VEioO9lOAnF5peC+euOsqiSp8rq5Wnu4gEbXNW7eR?=
 =?us-ascii?Q?LA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dffaeff-6ef2-4d9b-6e8b-08dddfb0c8bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 06:14:13.1194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IthuegWSk69SXDmsxfpsZ5H0pXA2bTLEmKtuxhLhGygqJpDhfLJg/gOLYNaOAH3K4ehMtBK7tbk9VW0KkVFD3ztZDwVhHhVgfmtpNofAch4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15046

Hi Dan Carpenter,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: 16 August 2025 11:28
> Subject: Re: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mod =
clocks
>=20
> Hi Biju,
>=20
> kernel test robot noticed the following build warnings:
>=20
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Biju/clk-renesas-r=
zv2h-Refactor-
> rzv2h_cpg_fixed_mod_status_clk_register/20250814-205111
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git renesas-clk
> patch link:    https://lore.kernel.org/r/20250814124832.76266-3-biju.das.=
jz%40bp.renesas.com
> patch subject: [PATCH 2/4] clk: renesas: rzv2h: Add support for parent mo=
d clocks
> config: hexagon-randconfig-r072-20250815 (https://download.01.org/0day-
> ci/archive/20250816/202508160958.ounSAlER-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project
> 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit),
> kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202508160958.ounSAlER-lkp@intel.com/
>=20
> New smatch warnings:
> drivers/clk/renesas/rzv2h-cpg.c:875 rzv2h_cpg_register_mod_clk() warn: pa=
ssing zero to 'PTR_ERR'
>=20
> vim +/PTR_ERR +875 drivers/clk/renesas/rzv2h-cpg.c
>=20
> dd22e56217495e Lad Prabhakar 2024-07-29  770  static void __init dd22e562=
17495e Lad Prabhakar 2024-07-
> 29  771  rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
> dd22e56217495e Lad Prabhakar 2024-07-29  772  			   struct rzv2h_cpg_priv=
 *priv)
> dd22e56217495e Lad Prabhakar 2024-07-29  773  {
> dd22e56217495e Lad Prabhakar 2024-07-29  774  	struct mod_clock *clock =
=3D NULL;
> dd22e56217495e Lad Prabhakar 2024-07-29  775  	struct device *dev =3D pri=
v->dev;
> dd22e56217495e Lad Prabhakar 2024-07-29  776  	struct clk_init_data init;
> dd22e56217495e Lad Prabhakar 2024-07-29  777  	struct clk *parent, *clk;
> dd22e56217495e Lad Prabhakar 2024-07-29  778  	const char *parent_name;
> dd22e56217495e Lad Prabhakar 2024-07-29  779  	unsigned int id;
> dd22e56217495e Lad Prabhakar 2024-07-29  780  	int ret;
> dd22e56217495e Lad Prabhakar 2024-07-29  781
> dd22e56217495e Lad Prabhakar 2024-07-29  782  	id =3D GET_MOD_CLK_ID(priv=
->num_core_clks, mod-
> >on_index, mod->on_bit);
> dd22e56217495e Lad Prabhakar 2024-07-29  783  	WARN_DEBUG(id >=3D priv->n=
um_core_clks + priv-
> >num_mod_clks);
> dd22e56217495e Lad Prabhakar 2024-07-29  784  	WARN_DEBUG(mod->parent >=
=3D priv->num_core_clks + priv-
> >num_mod_clks);
> dd22e56217495e Lad Prabhakar 2024-07-29  785  	WARN_DEBUG(PTR_ERR(priv->c=
lks[id]) !=3D -ENOENT);
> dd22e56217495e Lad Prabhakar 2024-07-29  786
> dd22e56217495e Lad Prabhakar 2024-07-29  787  	parent =3D priv->clks[mod-=
>parent];
> dd22e56217495e Lad Prabhakar 2024-07-29  788  	if (IS_ERR(parent)) {
> dd22e56217495e Lad Prabhakar 2024-07-29  789  		clk =3D parent;
> dd22e56217495e Lad Prabhakar 2024-07-29  790  		goto fail;
> dd22e56217495e Lad Prabhakar 2024-07-29  791  	}
> dd22e56217495e Lad Prabhakar 2024-07-29  792
> dd22e56217495e Lad Prabhakar 2024-07-29  793  	clock =3D devm_kzalloc(dev=
, sizeof(*clock), GFP_KERNEL);
> dd22e56217495e Lad Prabhakar 2024-07-29  794  	if (!clock) {
> dd22e56217495e Lad Prabhakar 2024-07-29  795  		clk =3D ERR_PTR(-ENOMEM);
> dd22e56217495e Lad Prabhakar 2024-07-29  796  		goto fail;
> dd22e56217495e Lad Prabhakar 2024-07-29  797  	}
> dd22e56217495e Lad Prabhakar 2024-07-29  798
> dd22e56217495e Lad Prabhakar 2024-07-29  799  	init.name =3D mod->name;
> dd22e56217495e Lad Prabhakar 2024-07-29  800  	init.ops =3D &rzv2h_mod_cl=
ock_ops;
> dd22e56217495e Lad Prabhakar 2024-07-29  801  	init.flags =3D CLK_SET_RAT=
E_PARENT;
> dd22e56217495e Lad Prabhakar 2024-07-29  802  	if (mod->critical)
> dd22e56217495e Lad Prabhakar 2024-07-29  803  		init.flags |=3D CLK_IS_CR=
ITICAL;
> dd22e56217495e Lad Prabhakar 2024-07-29  804
> dd22e56217495e Lad Prabhakar 2024-07-29  805  	parent_name =3D __clk_get_=
name(parent);
> dd22e56217495e Lad Prabhakar 2024-07-29  806  	init.parent_names =3D &par=
ent_name;
> dd22e56217495e Lad Prabhakar 2024-07-29  807  	init.num_parents =3D 1;
> dd22e56217495e Lad Prabhakar 2024-07-29  808
> dd22e56217495e Lad Prabhakar 2024-07-29  809  	clock->on_index =3D mod->o=
n_index;
> dd22e56217495e Lad Prabhakar 2024-07-29  810  	clock->on_bit =3D mod->on_=
bit;
> dd22e56217495e Lad Prabhakar 2024-07-29  811  	clock->mon_index =3D mod->=
mon_index;
> dd22e56217495e Lad Prabhakar 2024-07-29  812  	clock->mon_bit =3D mod->mo=
n_bit;
> 03108a2614ecab Lad Prabhakar 2024-12-02  813  	clock->no_pm =3D mod->no_p=
m;
> 899e7ede4c19c6 Lad Prabhakar 2025-05-09  814  	clock->ext_clk_mux_index =
=3D mod->ext_clk_mux_index;
> dd22e56217495e Lad Prabhakar 2024-07-29  815  	clock->priv =3D priv;
> dd22e56217495e Lad Prabhakar 2024-07-29  816  	clock->hw.init =3D &init;
> 9b6e63a777ea5f Biju Das      2024-12-13  817  	clock->mstop_data =3D mod-=
>mstop_data;
> dd22e56217495e Lad Prabhakar 2024-07-29  818
> dd22e56217495e Lad Prabhakar 2024-07-29  819  	ret =3D devm_clk_hw_regist=
er(dev, &clock->hw);
> dd22e56217495e Lad Prabhakar 2024-07-29  820  	if (ret) {
> dd22e56217495e Lad Prabhakar 2024-07-29  821  		clk =3D ERR_PTR(ret);
> dd22e56217495e Lad Prabhakar 2024-07-29  822  		goto fail;
> dd22e56217495e Lad Prabhakar 2024-07-29  823  	}
> dd22e56217495e Lad Prabhakar 2024-07-29  824
> dd22e56217495e Lad Prabhakar 2024-07-29  825  	priv->clks[id] =3D clock->=
hw.clk;
> 18610e6bf54faa Biju Das      2025-08-14  826  	if (mod->child_name) {
> 18610e6bf54faa Biju Das      2025-08-14  827  		WARN_DEBUG(mod->child >=
=3D priv->num_core_clks);
> 18610e6bf54faa Biju Das      2025-08-14  828  		WARN_DEBUG(PTR_ERR(priv->=
clks[mod->child]) !=3D -
> ENOENT);
> 18610e6bf54faa Biju Das      2025-08-14  829
> 18610e6bf54faa Biju Das      2025-08-14  830  		clk =3D rzv2h_cpg_mod_sta=
tus_clk_register(priv,
> mod->child_name, mod->name, 1, 1,
> 18610e6bf54faa Biju Das      2025-08-14  831
> 	FIXED_MOD_CONF_PACK(mod->mon_index,
> 18610e6bf54faa Biju Das      2025-08-14  832
> mod->mon_bit));
> 18610e6bf54faa Biju Das      2025-08-14  833  		if (IS_ERR_OR_NULL(clk))
> 18610e6bf54faa Biju Das      2025-08-14  834  			goto fail;
>=20
> This isn't how IS_ERR_OR_NULL() is supposed to work...  :(  The NULL shou=
ld be treated like success, it
> shouldn't print an error message, unless it's something like:

OK.
>=20
> 	WARN_ON_ONCE(!clk); // rzv2h_cpg_mod_status_clk_register() is buggy
>=20
> I have written a blog about how how IS_ERR_OR_NULL() is supposed to work:
> https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and=
-null/

Thanks for the link. Will take care next time.

I would like to drop this patch as Geert provided some
feedback to remodel the clocks[1].

[1] https://lore.kernel.org/all/CAMuHMdXJBL_uJ=3D2v0aKJaSf45070yP=3DZ_kPe-9=
uSyE1P0QeiJQ@mail.gmail.com/

Cheers,
Biju


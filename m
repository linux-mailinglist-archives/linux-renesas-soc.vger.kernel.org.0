Return-Path: <linux-renesas-soc+bounces-11376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508289F2FD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 12:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C837E1888761
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 11:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CEA204564;
	Mon, 16 Dec 2024 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hKZ4RkXE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20B20012C;
	Mon, 16 Dec 2024 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734350073; cv=fail; b=ZAJ2udAdjVLsMCnsCjgABKDLdsNoRU5p2CsOz8svCn6/MydNlKCxB1i8t6D4LXyd7BEtlafjSNKgaEfidJymrlue1ijI4giW0skwPc0UuNJaq2aRO1Awk1dZqnyMaCzZw+3UUURucbUXlL/WULJ0T9/ov/5VvmsrXAjcFEsiyjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734350073; c=relaxed/simple;
	bh=9nSSpFwc/jgpvNjS/5NuJ+htczUwrcSRnggsM1O/Pmk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZX3ZH+lRF/CpisBLWI0LlqO3xfuvGL9am2PMSdKwJ18PRhw8pZk2sLumHZAGF7Z+1fiCUJ03gTRUevEMWJ4fzcvUpxDpHBW5Ku8S0BFGodTufMlAhmpfaF1zb9GzuKyrSv2EAVBEOHck/S+My91GQcoKDvvfv+E3+sPvisp6STM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hKZ4RkXE; arc=fail smtp.client-ip=52.101.125.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKyiKDeQQZp0pYDM+WEzyt5lXjPzns6IToy5jXZlLF4LaEn34YDGG76rmZjIF0QyW5fKiQdi+PpYfkjgS/3XKNDs/25aOhnxR8/IIO/5hsygjeSvwqyZy9Ef6uwgPHJj1zcGPay7pB5F32EDiXblJt09BRbxSAVaUhlVzJp0V96a1rPI5IYJqWA/TmSHfrUSnM925rRJsT1H1Lg9kRUUJbstkN5pZMhnd/KIsvDvKxbBj2wtgqLYwRc+4P+43oCZh7Ncmr64nzZW3esK1dOySnfwoFYNDkWmmS/fmblf8tciszKwAxxyMGycvnrIqtV6CYDX/m3NROSKlYV5J4xWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m2M8MdO0004lksXzeL3XpoiA5cnuGumZhJAES/Srdk=;
 b=UApW3w1+Hj4Lu7hlPzm9zNeLRsXKPq7wAUR/OePawPcPKssO68/TPedtryUNpEUiFoZqmaPTc6k2QvjbFzR76kgJY+yTCvTb9GmsofAEhOSZDRryimz0tYtFdHwHALnv3GJynE0XGWny1mnarrONWOIl5X9pjMdWzRX3K7lNm7ZV8+ndjmfZGTLdPqpCpkGvOdtLdDVhOd+S7PEXFOdlzpTl7GqDR1DjE9gA/vIhGsV+RcLlF7QAGZmtlRd+A913KCPJ0F2alnNZJQUIW3r1sSnaGXfAOctEK7k4SN2aRTEyAS3UCEXFeyZGYsX7mVCqzShf9iO4HdO2C92XjNTqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m2M8MdO0004lksXzeL3XpoiA5cnuGumZhJAES/Srdk=;
 b=hKZ4RkXECwFPTS/1jpv7BaGdWOavyvaZ9ATCR8AYn2xxK4HjsBl2FUSMbAL90GvlPRUvQI768Dg5W1t2+cb1PVYpULLnpKMXY52YQY2WsGuWEneCzi0Oz/gfKrVlfObzCB0okpVQQOGLVrPP6QYkIK5/v7SN+C5oeOwiXYX5VE0=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYAPR01MB5785.jpnprd01.prod.outlook.com (2603:1096:404:8052::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 11:54:26 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 11:54:26 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: nikita.yoush <nikita.yoush@cogentembedded.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH net-next v2 0/5] mdio support updates
Thread-Topic: [PATCH net-next v2 0/5] mdio support updates
Thread-Index: AQHbT4rv4wDaxpNFok24j9ZGFrEo8rLowJ6w
Date: Mon, 16 Dec 2024 11:54:26 +0000
Message-ID:
 <TYCPR01MB110403F3DA55EB4C832BBA55FD83B2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYAPR01MB5785:EE_
x-ms-office365-filtering-correlation-id: c9f8a375-8a3e-48a3-4c73-08dd1dc86439
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?96RR9feGTx7uD875DUCs6CvMf5X2omf54Yw9oR1Mw1zRGGQ2juPQnYwcz7Uf?=
 =?us-ascii?Q?0lrpG9L89cYbqYUVQKK+z5nEfwgM/7TewDY1rDPIwibgQfzUDnI9Cs7kseDx?=
 =?us-ascii?Q?EOh/QJk2Hh1G9i1bS4kOLAovfHgFTUjBx9l4qVr+I6S5L7EpY7oOs7F+3XUW?=
 =?us-ascii?Q?1dNBwsq8vHqaRrf8D9gLz8dvd7X6wFsMJKVv1rbv0oWlatKw9uuW2/ehVjWO?=
 =?us-ascii?Q?ST2M6GXBNQ2CZFCFuKDrXoV12zxfCoTOhiV848Tfn0mLHlVR+UNFCmVDB9gw?=
 =?us-ascii?Q?Mkk2OuMsm35ruIoXz/9dhBPsO8q674rJ0Fip5BPLfSoH7FGw94f9qpZ5ncYN?=
 =?us-ascii?Q?yZRX0rWf0uRmPwPMLhr7AuSoe+VDA5yEl9MeK3JB81C5CqYFndtq8ILKZpUR?=
 =?us-ascii?Q?JeJNKT8HPsTz+yM4AMBSZxK1QtRjM8kwN6Lk1ruYhKOeQk4rbkkR8NvfVpya?=
 =?us-ascii?Q?/44Mf6HeSuWpzmbP6dvfeGVdFThK5gi+bgcGw+dSZVo5rjY/dqpzdeUYF87h?=
 =?us-ascii?Q?LE5V3/p36aMuX24B8EKoeNHJe4H3MhgcyLwGXct/S//q9JAz5qEkBnccYiZ3?=
 =?us-ascii?Q?J5h0OvLD1uT3kVwqr8pL7B7ycAs8qk8aTcZBF62QwGazFwd61O6vP6d/EfhR?=
 =?us-ascii?Q?Oyefg+CTGNGwpIj6Vh2txhEJfdo6CYSikr54S5yVL8dPOxSqtft/C3IMIuuO?=
 =?us-ascii?Q?D0XVkoh6dRahYbGQYadEfeY0IEO5cTh/wCfy2ZkvyTGFpJqgNqNhINdaMl59?=
 =?us-ascii?Q?orc5bgiZEdYp9suIeI8fKBl/NQXgfKXsFf5xY2OiZqW3t04seDO2JmoRGE3i?=
 =?us-ascii?Q?pvIMOWFj2X+ug2fxXcbmxzcdKnrvNz/sX8nzeKxmjHHBY3/5EcGkSyMKnhj0?=
 =?us-ascii?Q?bdonIk7K4wOwHfT1dX49dw/YLAl/yh2MQUj92I4qk8RF8byPDoRDhuNy6DN0?=
 =?us-ascii?Q?ssg8OLaEyvgvLbPlNqwIWyoC9VSGPgVkkAwItzB6U83TefF5X6RP7ZjDfpSZ?=
 =?us-ascii?Q?ZedUw555jZC/4LldFG/3w6RvR8fU/lBAHcOXyeDHV2rhO0auzQJFuEhjz0a+?=
 =?us-ascii?Q?gO5liv0nukfd5BLGXE6zjz8EcAQUG0tEAdvf2rfB2XCN8CnSbuIGC1kz2UQ6?=
 =?us-ascii?Q?lY5YB3Mci0l9cuwPWwJkq3zB3THlNNMNDDkezDxML54dHNSQORhBwv6v6+69?=
 =?us-ascii?Q?RhBUpO5Ynau1As5jfp3BOhz2ATMcHQ38M+jVgCpCtbVFpcd/BWV5cnvXe4gt?=
 =?us-ascii?Q?/z7f7OF+M5eokr4T6frjHDFh7YNcLbbqylDf4y6O0wfaxZD6/ghbgh12ywaY?=
 =?us-ascii?Q?Sj+ZO54jL8w5+saywzyEu7CjAafuUz3wBRfxMIL9Xtpw+npS+4gZpGTLyXYz?=
 =?us-ascii?Q?A130v53S2S/v1/yFai4W2sKSeyugluxrP7jS5D+XrKWX5uRDlc18hZS5vL/c?=
 =?us-ascii?Q?kNtoh7yu+m96HQ2K9dHDJ7NPuBHm6SGT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3W1fOV7shdxbSBhWvozmVhTdIY7vTXYfTpAT/qgdrgXVUb8MbOypSMUVEcDK?=
 =?us-ascii?Q?dCLF+pQyxgzrl+rvRSq1XdaYLSKtZf0T5NG93J52LSCdB3eswXbiDL1gEwN/?=
 =?us-ascii?Q?FVJz5BDsnZRJZm1G9Arb0UY7n51EE566sIGpmjTMQbCAKIMqYuHf7ZFjuhJJ?=
 =?us-ascii?Q?9X26HDrNmF+Bpq84c+/GPh7Q5C1U2763JFUNkZip+VoW4jmPLcc2g3MtRSxq?=
 =?us-ascii?Q?rYbpIK96tFmKW5rNvEwb5R6+ti7ml7upMyDRMJ5mdqSXv0R4WmblPWSrVJ16?=
 =?us-ascii?Q?mOhmLg3clRF14ZP4n/6jd57Oc/cECAVpiu7mGgGQn3PtKBOhW4unCDamnJyH?=
 =?us-ascii?Q?DDnpjLS/fIHHoWZmJCHO1uTaadE5IpqMySuJj4e5B95pOsnT7x82njEWEve0?=
 =?us-ascii?Q?EmTPZi3TjirG05XiulP5fOjbiBqJGTARNk0l3L2HCiXEhV603o9Dj3R1FFiq?=
 =?us-ascii?Q?XQ70siyMmbVU637S30mkj4cSGxuDPY4WZaq6iBn3SmpIqhlpxuwAjbypVUc+?=
 =?us-ascii?Q?6AnEXvaz7d2XZjrRIl9bHUikos23ue5zWHtLUipv6NkQLMvSGDsSzbWqE8iE?=
 =?us-ascii?Q?NBNI6qvRjlNiEN5XybbfVzo3Pc63dIfKwG+7fSBopKdYwlh1lnLBpB6w+MAs?=
 =?us-ascii?Q?wAg6slohFwJJ3qgcw2rguRy1fp7my+gf9Yg9o44oM+EyJSLpXYWqonfjU/O/?=
 =?us-ascii?Q?O+iyUk1OpEQEpCqYXORssbiw8xCekXx6fSAPcaTsUkvXaZw0GDYzqlNtxJi5?=
 =?us-ascii?Q?8nfAnKJDkW31TCDc3X2E9vxQXI/N72hUhWO0A1+jiOhic/u+gHBiH4Q+Tyq7?=
 =?us-ascii?Q?5fmDDI8HQeIeZETjUIF3t5Z1ZzHOpMQ3kLtPOwS5vl6ed/lh7pavtloCXuGy?=
 =?us-ascii?Q?VFL11ICu6oEjo6elZc0vQNdwyFvOPwLe21czb4OPYv+RTyB4W5sM+W33Auei?=
 =?us-ascii?Q?eS1nWg5BfN0NPUWltF28mBMHsq5C0H6em46P1k0RyCHs7OM4PDKLS3AwzBv3?=
 =?us-ascii?Q?txSdN4A+k4EelteZUr5mlHJv0hmRH8JIBuLcAUfb7iNpCMPAkrLPXLVZIyBx?=
 =?us-ascii?Q?q2PPIpFkRVDkhMzsNPFj+W2uYaKvAcwbyZnFc6CMR0P6TcXVYrNBp6xC16UH?=
 =?us-ascii?Q?Puzqcpf7p/hnkbztzjiwt0hm5hR0ubq1do7MVdkZpBXTA88q/B7BX9mTS2Ya?=
 =?us-ascii?Q?87LhZ9EUjD8T2uxhDfk6tS/KHFUK4cyeQ30vRrn6bb8Lkx++mP9DQkGVT136?=
 =?us-ascii?Q?+id0IX1HComwjH4QQwKtvB3+ai4nBglqWfJthb+0BXbh9QGwhxkg17KO0f00?=
 =?us-ascii?Q?LVeMLJQuOhFPv2mQR6JmF8J4zaemJpCJDj0oENNwS2blCs8eZFeTk4c2WkyQ?=
 =?us-ascii?Q?fpR4zZ4bKMgxXNNPM7dC24if7Sy5s6npulUHYNwQQpicTiVbGHbCCBIPehaI?=
 =?us-ascii?Q?u7gZbwrtJ8zXJRAPM7yLAxSCKB2mpr0mIbO0n0L9djesgPlZYTSUYlLQHk8O?=
 =?us-ascii?Q?ILgTgcd2kJibGfHAw0wqXVW9QGbVisJAw397c/zHHmOdXicMlYWjZiolXjTv?=
 =?us-ascii?Q?rNt9yrp+bpmCHiJEHtEjFmH535j9iH1ujjy5aNjwlszEWmd49bpuxPTlRKUc?=
 =?us-ascii?Q?1NgDXDOEFkLxbT0Fyj1aLn+yMQoQDfW/mcOsMgr8CeKojEYS8gyFCM8eXI1A?=
 =?us-ascii?Q?P1v/yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f8a375-8a3e-48a3-4c73-08dd1dc86439
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 11:54:26.8261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3VCOjllWW7GH0gX661kS+aqTq97IhoSRiJzaW2mVYcG0QD8TtOPR9cggrIFsum9moUe2OR+GMC4TN4Qno797/Bu5oa6Ul4IVr5iTYVJ+6V8pNGJZBP92s5Vwxs3MUHq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5785

Hello Nikita-san,

> From: Nikita Yushchenko, Sent: Monday, December 16, 2024 4:20 PM
>=20
> This series cleans up rswitch mdio support, and adds C22 operations.
>=20
> Nikita Yushchenko (5):
>   net: renesas: rswitch: do not write to MPSM register at init time
>   net: renesas: rswitch: use FIELD_PREP for remaining MPIC register
>     fields
>   net: renesas: rswitch: align mdio C45 operations with datasheet
>   net: renesas: rswitch: use generic MPSM operation for mdio C45
>   net: renesas: rswitch: add mdio C22 support

Thank you for the patches. The patches look good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested the patches on my environment (R-Car S4 Spider), and
it worked without any regression. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
> v1:
<snip URL>
>=20
> changes since v1:
> - rebase against net-next/main as of commit 92c932b9946c ("Merge branch
>   'mptcp-pm-userspace-misc-cleanups'"),
> - remove no longer used definitions for MMIS1 register bits,
> - add patch to use FIELD_PREP for MPIC register fields, to keep the same
>   style as in already merged patch.
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 84 ++++++++++++++++----------
>  drivers/net/ethernet/renesas/rswitch.h | 33 ++++------
>  2 files changed, 65 insertions(+), 52 deletions(-)
>=20
> --
> 2.39.5



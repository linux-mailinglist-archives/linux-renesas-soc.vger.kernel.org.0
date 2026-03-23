Return-Path: <linux-renesas-soc+bounces-30099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J8WKy4mwWmbRAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 12:38:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A992F2F1515
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 12:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 867753009E1F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 11:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ECA38D008;
	Mon, 23 Mar 2026 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jJqqIK43"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202138C403;
	Mon, 23 Mar 2026 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265830; cv=fail; b=lG9+n9GBU6eKSi26h79FevsjO1v5gZgcN7EgbryacQmzdi1bLVUiQx/v1XUkjVsWAB1SlIO+amO9AWbRbH2Wx8z6p6mv7H4Z6YZKJ1cgHTVjffDv1ZsCcJYpHmOM5ifBHVgh/XqwuiwkwEIJt226Ok2W5gsEzsOX+XfVxalo6oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265830; c=relaxed/simple;
	bh=njZg9D60pj2CMo77tpuqvVvCc457x1Ei4PGcPuCf41s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FTc6v7Itppv3wPdO2GhmwGssBYDvxqN3qLD9dqNK1QOVCwF6K+NhXVTwqFSAFlcBrk3/9GAix1dw05EKwZ/SwlDnOF4jADMZ+74u1g5vfaBhfdgIWGgOLOLt2noe1dJwbWkajkXr1b3oOFRQ0xW8MUxx7tQBcPus88AWKQTjf74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jJqqIK43; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ty3nKygghXiB/jU8oQMvMOoOYLQbKjERFHkGcKjy5qKDhFk36NNLhK/dHKatyGBPCUvLqApGYgrqaLOKST4LhaC7Oc29jNSu0PCL1NbhBZR/UJLPKDH7M8KEJzJjydmA4sioOpWfUnfBiiz00Q/I4+WLq+NLCTFEfNUH2yFXLFnxSmG1DZWnE+xN0SLcH9qxA4/tf6WOcV44H7UM0+sXXBlddIE3vSnEmEFDVbJLFz0kn7H9RxGAPtE+0MgE7Pwatb8dm8Y+CD09ULChKyxuC/biTLW/4fG6XLF1l1+PzH+rVGRUPlOgiZisgkghL0enO3ijcC/hirhqOp6wdkkZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7xr1ALDrAEzj2lHhXU4xtcCVFQ1pboJJpBa+0Vmc7A=;
 b=GS39764HRO15acQNpXev9HnrQNf6XvWlVExvR+ewblAcs32F/mjSFcURNjKRDJwxVI78e7pyEEOxVTPRC97qc52wK1pxqjsbNc5SSQ71TZUeFlSErkQt0uapgXpvqrR6JqLcbUc7brKHw3c83M/SndiP5DXCzaKwBvBSxRxW4JueM+PUwmL/fYo4bUVMwEH11/jZ8iVIRe/lEJqvw8Za7oxmE5bIyXlbpgfMnDfdQlwIGKSuQBbkpqPMll5iy5Fs/VKMny+JRDttGIVenX7KmCM03ICxcH5THaBBTsR06MVWNpFyXcWcO9v2huwmPzAAuso2vE0VTPDa1sAZZ+5NsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7xr1ALDrAEzj2lHhXU4xtcCVFQ1pboJJpBa+0Vmc7A=;
 b=jJqqIK43ry11/Rl1/+wgaEQiH2t2ZuR9dFu1nyl0qcQ8mKJUKVXqxMWusgG3wdjL8uWgW8QJ4zRF3Y/3G6NgAqtB9fDpEA3cJPZkzVz3ZdmnC33RFnDrffDhxajOZcSzFx8BQE0OxuJVXVAoG/LOwp0jA0asOT1tTrkP8ZP85M8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13180.jpnprd01.prod.outlook.com (2603:1096:604:354::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 11:37:04 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 11:36:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Thomas Gleixner <tglx@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 14/15] irqchip/renesas-rzg2l: Add RZ/G3L support
Thread-Topic: [PATCH v6 14/15] irqchip/renesas-rzg2l: Add RZ/G3L support
Thread-Index: AQHcufbVwVbSeM7fbEy0Nih9n1Xt37W7/lzA
Date: Mon, 23 Mar 2026 11:36:50 +0000
Message-ID:
 <TY3PR01MB1134679795DEF5E068641388D864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260322122421.132474-1-biju.das.jz@bp.renesas.com>
 <20260322122421.132474-15-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260322122421.132474-15-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13180:EE_
x-ms-office365-filtering-correlation-id: ef7be86a-4a62-40a5-c8f0-08de88d07943
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 vLy3UkJ82wM2kterH82EWYtDkKGiV8EIXkVufHedrbFLfiVhu+9rWL3H99vDBuxM4VfeK2Xh36zkWhgirj0SJqfnvl3tCnyfftfKqydF5ZzYcOMvjgs/U4cW7VovPf8ansGpVmOFICo4mqxi3I6+mRCVIza4uVCGUk+UhRoZuIpRIvL3+D5zKG/u/cXa9oaji6M8IjNyuVVJFMmChO1sTUwrx/zEapxEjDPn07WJGAWHviwIwOBSBxu0qOklkcYRpjL3yzE5OUNd8hCmKsaYHbubskkGqc1sySAOhbVLuX3w9X+BA1S4RREfCjYiC109McqfELiUc2E3mWLVa7vmjLh1B4C7Ilkq1VaSZcr3cpTQEvRBqkAPGf2H+8mgZtOEsVVNyPZj+iWKeUoXiT/fuoJbCDiAhhc3lFJMsd7XNXAqKyLSI3Xr3lsvPJiHUIAzTjfS/m+yVHWxdkR5ryWFkkpwl87DsHWH/xHKYf6ltZMCZBKZQ3EiH+TWEWFHRkmgw8EQJjEOJMff8ivYzzJ8tHZj/q7cHon4GyUcVKnLjFSWcrl1v2D/yOl6zXtM47PxC/dHFqmwxWbd/+0M3veqLgfgXvhSZuXVRpE2QxHsX2gpY2LKkpjT9iTdOFRJu6USLMvxnjIVzn6nl8jcvrunYOrV64Tvs03bLHdOkzG67ILWoTnne/p6kKwL3H3+gXDGLkkjcsPNGr6dcidZaft4q4tD2ZVxRQ7tVPEd5CelbmdiXQonlyvaZ2sFP7TTxoP5iQ4Ls4/AgnqY8fEFgxI8RLjv2K5viaPRfffsEteXU+M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?em/NYLTLv/Mm7k6JHp6kOTOlWssCLmvpXX6U/RmXHAU7Gs3MxzpBQU1bbAFX?=
 =?us-ascii?Q?HZUZB3dG2G69NuW4dLKbmmV8BBz1ONgWl4dhoEgWUuhVjRFt9mDnIwwIjYa4?=
 =?us-ascii?Q?HbPnD9QFO2jSveiY3AcFk/kFvnXqmR6YL6SxuxfSWXmnx0wACRNrj1/kOXy/?=
 =?us-ascii?Q?SXmexCasmHwZdC7jJSKc7BloB5nmqNoiM0pEtCOGSMO1Lqy53vvo1tRogvyY?=
 =?us-ascii?Q?lAehlS27QMJn+z0W788MghQbvFgmhqov1YD3jEgvmj9Gcy6KwITH4vSfc2xO?=
 =?us-ascii?Q?OHVm7Ou0+4SQQqQdH1kui1g1eaiJk4M9iir5Pjb3x6DGV3QP2pkh3uWaH5n0?=
 =?us-ascii?Q?IhhQF/ReXKWVwU0pjQUxIRB4omH5GKgvp7G2c3Bpap3LMd1OTEUdSq5E0qM2?=
 =?us-ascii?Q?rTmxCIXOGrdu8APcmgYEN96YYSsOO8JqBRh0/5tMWEWUv8O1Am3I0FrfJXWU?=
 =?us-ascii?Q?ROYYLQw4Mse4CqWLvLROyttHmkRpZCTWduhg8PGphQBZFOLZ8kcbIxPEwR89?=
 =?us-ascii?Q?eNvN5l3/Xj+c5QLDSqaYYZ4RvyHkgYKXhUruRHLf95vLiKmWIreESD4d2axU?=
 =?us-ascii?Q?+RS3mTeeb4bv7w5DCzFiXh+iUGU3ni7e6JBl2yC004yWXgUpCkYNst+UfVMx?=
 =?us-ascii?Q?gSyBDzLizmvGMAvoc6XXau8P841vdAkJl/Fr1GZ08hbgnbQ6lT074VFMMCvF?=
 =?us-ascii?Q?sWa0FYLTJOwf98Hhvbi7l6TLqcJtLDePXM/FT98coLJiFx+u5rNmP8HYa7l2?=
 =?us-ascii?Q?+Hzbf0bQZa9h+FEnh+xyWpL/784tV0bIqOrmNemdz5vPcmpQsuIS0lC222g3?=
 =?us-ascii?Q?bEC7QApBXyJzndXbGv5m+u8IMCLCjziiw++P215oRB7EqjoNr/KwR6AGF9gR?=
 =?us-ascii?Q?UsiUCTN7gkV9FfuIASXQcMVYXVJTnSMjar5/YNfr6rG+mmhquEb2wg9imOyE?=
 =?us-ascii?Q?uTUNs8DAV9RxbdAYSLnVfbv0WwgQ53lbqgKuK5EPSBp6vUqY48dUSamrXXrz?=
 =?us-ascii?Q?gNBcksoVx0tCr9yv9fZbmFycgN/oSfQyzk49ZRGlJePUGI2MlW04YADiTeJP?=
 =?us-ascii?Q?l6NSL2mQkjOwmKk0ARVDSvZT0s2na/5fg9iH+lYHEZnNdSE0EUPqJP2DCeTc?=
 =?us-ascii?Q?k6od7cxogLZ/lpt42EWz/BmuHMPbS1a62fWkrhwVBTp9dcaY/IfPIY2glUDT?=
 =?us-ascii?Q?sk/gVEzLBHfZwl4YTFAkvQy3hAS8230Njyvnxw8KfPX6D6YboYUjp/RKbtKR?=
 =?us-ascii?Q?n2wmr8YrWL5RaaO0Zi+BGskvZyrSFUYkGG0t7ycKhiYqkCKUZ+3eOX/9IDtR?=
 =?us-ascii?Q?CTbvwXr3Stre22jaOd48ke4B4q9Jchu4rna6Hs12U5ldd+9VZZKZnp9xVOra?=
 =?us-ascii?Q?HvxrAyPNkJk49DhNwqbd3FA1AOIVVUG+DM1uGBPNo+131XTdfrnMEyjdXIQc?=
 =?us-ascii?Q?REwUsaVM4PanF/qaG3saXW4sxVc1/Dch0SyVG79XzxiMH6Ofms6EOEISDjoV?=
 =?us-ascii?Q?l9Vk5q+89rxFON/DBxMy4kw4ibJYwjiRUCf+z9l/piqJl0dvYREYe3oYhRcu?=
 =?us-ascii?Q?ihWT7WpJKKR63U4No/+G2Wc/w/h0F5FERcF7Xl9p2jVoG2rDAB8P67S41x3+?=
 =?us-ascii?Q?R853TaFqGGWLKwFMwb966RyJGrZ3puWpMfJihZnuoMUfTqz/jpoY157ldJTT?=
 =?us-ascii?Q?wqR6NngraUbWyUAIOf5KHpzVYUaw+qh7QpbGKj2waJ6Iy11k0VZkXn4vbPff?=
 =?us-ascii?Q?La8p7N2TsA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7be86a-4a62-40a5-c8f0-08de88d07943
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 11:36:50.1992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuSb7kBwAgqMMfuREG/f8FRuxQeNgqFhFZy++DujtBF5ZbvHmL0GWd/vroQ+ETpu4xizUkqrFs2PgyW2moy4BhK2wKvrXqswYc93+miB524=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13180
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30099-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c15:e001:75::12fc:5321:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2603:1096:400:3d0::7:received,100.90.174.1:received];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: A992F2F1515
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 22 March 2026 12:24
> Subject: [PATCH v6 14/15] irqchip/renesas-rzg2l: Add RZ/G3L support
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The IRQC block on the RZ/G3L SoC is almost identical to the one found on =
the RZ/G2L SoC, with the
> following differences:
>=20
>  - The number of GPIO interrupts for TINT selection is 113 instead of 123=
.
>  - The pin index and TINT selection index are not in the 1:1 map.
>  - The number of external interrupts are 16 instead of 8, out of these
>    8 external interrupts are shared with TINT.
>=20
> Add support for the RZ/G3L driver by filling the rzg2l_hw_info table and =
adding LUT for mapping
> between pin index and TINT selection index.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
>  * No change.
> v4->v5:
>  * Updated rzg3l_irqc_probe() for supporting separate interrupt chips.
> v3->v4:
>  * Updated commit description IRQs->interrupts.
>  * Updated rzg2l_disable_tint_and_set_tint_source() for making
>    tint assignment very clear in the code.
>  * Formatted rzg3l_tssel_lut as table format.
> v2->v3:
>  * No change
> v1->v2:
>  * No change
> ---
>  drivers/irqchip/irq-renesas-rzg2l.c | 44 +++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-re=
nesas-rzg2l.c
> index 8aff8b9d49c9..1ff1c0efed66 100644
> --- a/drivers/irqchip/irq-renesas-rzg2l.c
> +++ b/drivers/irqchip/irq-renesas-rzg2l.c
> @@ -67,11 +67,13 @@ struct rzg2l_irqc_reg_cache {
>=20
>  /**
>   * struct rzg2l_hw_info - Interrupt Control Unit controller hardware inf=
o structure.
> + * @tssel_lut:		TINT lookup table
>   * @irq_count:		Number of IRQC interrupts
>   * @tint_start:		Start of TINT interrupts
>   * @num_irq:		Total Number of interrupts
>   */
>  struct rzg2l_hw_info {
> +	const u8	*tssel_lut;
>  	unsigned int	irq_count;
>  	unsigned int	tint_start;
>  	unsigned int	num_irq;
> @@ -377,6 +379,11 @@ static u32 rzg2l_disable_tint_and_set_tint_source(st=
ruct irq_data *d, struct rzg
>  	u32 tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
>  	u32 tien =3D reg & (TIEN << TSSEL_SHIFT(tssr_offset));
>=20
> +	if (priv->info.tssel_lut)
> +		tint =3D priv->info.tssel_lut[tint];
> +	else
> +		tint =3D (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
> +
>  	/* Clear the relevant byte in reg */
>  	reg &=3D ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
>  	/* Set TINT and leave TIEN clear */
> @@ -683,6 +690,36 @@ static int rzg2l_irqc_common_probe(struct platform_d=
evice *pdev, struct device_n
>  	return 0;
>  }
>=20
> +/* Mapping based on port index on Table 4.2-1 and GPIOINT on Table
> +4.6-7 */ static const u8 rzg3l_tssel_lut[] =3D {
> +	 83,  84,					/* P20-P21 */
> +	  7,   8,   9,  10,  11,  12,  13,		/* P30-P36 */
> +	 85,  86,  87,  88,  89,  90,  91,		/* P50-P56 */
> +	 92,  93,  94,  95,  96,  97,  98,		/* P60-P66 */
> +	 99, 100, 101, 102, 103, 104, 105, 106,		/* P70-P77 */
> +	107, 108, 109, 110, 111, 112,			/* P80-P85 */
> +	 45,  46,  47,  48,  49,  50,  51,  52,		/* PA0-PA7 */
> +	 53,  54,  55,  56,  57,  58,  59,  60,		/* PB0-PB7 */
> +	 61,  62,  63,					/* PC0-PC2 */
> +	 64,  65,  66,  67,  68,  69,  70,  71,		/* PD0-PD7 */
> +	 72,  73,  74,  75,  76,  77,  78,  79,		/* PE0-PE7 */
> +	 80,  81,  82,					/* PF0-PF2 */
> +	 27,  28,  29,  30,  31,  32,  33,  34,		/* PG0-PG7 */
> +	 35,  36,  37,  38,  39,  40,			/* PH0-PH5 */
> +	  2,   3,   4,   5,   6,			/* PJ0-PJ4 */
> +	 41,  42,  43,  44,				/* PK0-PK3 */
> +	 14,  15,  16,  17,  26,			/* PL0-PL4 */
> +	 18,  19,  20,  21,  22,  23,  24,  25,		/* PM0-PM7 */
> +	  0,   1					/* PS0-PS1 */
> +};
> +
> +static const struct rzg2l_hw_info rzg3l_hw_params =3D {
> +	.tssel_lut	=3D rzg3l_tssel_lut,
> +	.irq_count	=3D 16,
> +	.tint_start	=3D IRQC_IRQ_START + 16,
> +	.num_irq	=3D IRQC_IRQ_START + 16 + IRQC_TINT_COUNT,
> +};
> +
>  static const struct rzg2l_hw_info rzg2l_hw_params =3D {
>  	.irq_count	=3D 8,
>  	.tint_start	=3D IRQC_IRQ_START + 8,
> @@ -695,6 +732,12 @@ static int rzg2l_irqc_probe(struct platform_device *=
pdev, struct device_node *pa
>  				       rzg2l_hw_params);
>  }
>=20
> +static int rzg3l_irqc_probe(struct platform_device *pdev, struct
> +device_node *parent) {
> +	return rzg2l_irqc_common_probe(pdev, parent, &rzg2l_irqc_irq_chip, &rzg=
2l_irqc_tint_chip,
> +				       rzg3l_hw_params);
> +}
> +
>  static int rzfive_irqc_probe(struct platform_device *pdev, struct device=
_node *parent)  {
>  	return rzg2l_irqc_common_probe(pdev, parent, &rzfive_irqc_irq_chip, &rz=
five_irqc_tint_chip, @@ -
> 703,6 +746,7 @@ static int rzfive_irqc_probe(struct platform_device *pdev=
, struct device_node *p
>=20
>  IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
>  IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_probe)
> +IRQCHIP_MATCH("renesas,r9a08g046-irqc", rzg3l_irqc_probe)
>  IRQCHIP_MATCH("renesas,r9a07g043f-irqc", rzfive_irqc_probe)
>  IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
>  MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>")=
;


I need to update rzg2l_irq_set_type() replacing
u16-> unsigned int.

I will fix this in next version.

Cheers,
Biju


Return-Path: <linux-renesas-soc+bounces-29463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJJzLiDFt2m1VAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:53:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D912D2967EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF555300A527
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 08:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF275382298;
	Mon, 16 Mar 2026 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F4fQ2JEB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5C91E7660;
	Mon, 16 Mar 2026 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651228; cv=fail; b=Q5LgvGg28Hm9ZSM5DybEWKLXHxOHJBoVKV0Il/6TmMYnnuId5es5PQx689iNV2cZXhTVJ9MIgxkAIAGkLE1zoF/SJqhwpnW2mvdm7w53B96PSnFqt16k0iyJuujNcRImUMYu+SYFKiPbqlR0YdfFUVbfxvTzf8HwLVpjBIo9ZSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651228; c=relaxed/simple;
	bh=XigAJqYopWEwkgIYucPRGnw/KfJJ8JwX2Ptc4SH/0AE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H92f4K7ePJ3DdCmJ4u4l3LEGe3ZWr0nJk99ZYh5Dmm1wVMpKaIfWuxmcGqxhtM2GJ0NgNA4aiyZQ+2k1HXIW4XjQf3sx7+YL+Wkf2e9P8TdFS4wNOBgl1Q0WEhMwZP28mtIEsAmRl53cKMl4DOXuqdLqNQVIWdsykxzKUMCnHtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F4fQ2JEB; arc=fail smtp.client-ip=52.101.125.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mj1eTPD6PBIXTTbO/+1bm0c/5RRlwYMJnw0wS5h6SL31L5C2MklG62Qw33LY1gR4y6Cr6RdlldgdnsZ++dLNf5LQ+Kyv3TF+W5UqlYR6JEpHZsK4A42FR5Iam+SURKbWOWlPEuMWLrVhB2uPaDNRVbEJQB4wZD7U4k5D0UbxlEOY6JS1MBXY8Xfsj9qcmNEszBeiT7UbZW6Y7XAZnDovQBGHK6sR00GQwIS1qDoGDmVzDxyCRaZljh0gx88DhSJ9ZUfT+wYRC92QmPblvimZ42akwb06gzITBpPLQa2pSk+1moVRMGPsJKBx9r2+LLmc7a0KuItSymLKqMmg94irEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtnhPIOgK+qIAwgSJkS/dQbZEwaMjEmbrnXQxtP7IW8=;
 b=ggfC6YAkVTUX5hEWYVkBYduwyO3QS0qS9Lukiby0i/cQBgLl0eCgHIUmeHxM0BahvhGvpXrY3YCdGvE4GC/jZJUoR/3RHYnY2z5yfbeIo2+7bXJ97GhXUQhlJlEfwv+bUKu7OzXuz9Lmn5ZGkB3NSgXA4kf6QIU1tu3XGmgINFHmo2yNBSIokDL+TAX27+JcZ0GsXPoW/SZ8su5SPuZRFqnKQyDieObdUxTqhdNgUPV0Rn4TJTr86gkIGPOmyLuYP62fAtp1pf5vYWYOoN8/+8RLYbGbeP3mZzDj2Ke3iNSVUVQJJmjl3+uTAhCZN5mrsZ9rgzfsTanmjc25w4ltzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtnhPIOgK+qIAwgSJkS/dQbZEwaMjEmbrnXQxtP7IW8=;
 b=F4fQ2JEBheaywJ79HtVPasmmmsS2gT2p6riDExuhmS9SvggF75PLqbwGaH8s0TQhie8gP+SOLOgJ56SsMrUOrrNHqcEzHeM66iUEpMFVHMa4CSSSXpXpb41B7Lp4OufEp19LLy/pwKfS7Pu8mW+CCXTl93+RcoMKSISItwmqlVg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9351.jpnprd01.prod.outlook.com (2603:1096:604:1cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 08:53:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 08:53:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Topic: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Index: AQHcrXaXFSCFgrJqX02ubyFs95kWArWw6YBg
Date: Mon, 16 Mar 2026 08:53:21 +0000
Message-ID:
 <TY3PR01MB1134624DB226AA539692AD0F18640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
 <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260306143423.19562-16-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9351:EE_
x-ms-office365-filtering-correlation-id: 04e22a4b-c92e-4053-8262-08de833979ca
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 CcPSjTpwdNaBh+mxooK+PllSi/IPy2eNKtvHw7KARMPPfT4MzHWetjYIes9gmuOaNpac4y5Nrajifs75tE+7D2jYeWNHcaLC2FtJC95a4kSCG+WL2HobPmvpf+jS1Zl+fnQd040JVv0uNt1/oM0dLuGzK8rsnXCS2y7XYEm/uywabojy37C/CdbcQ48TjVo6tzEChNKsWJZcg53FJKBdFSzz/8923YgXBDpjHh/DopYSRmbyM4N9rngrAvjbeo0S9oMOf0wuPKMFfhzNTe9U9KBFknRh2eakFfgMPZn/mrGSUP0X208ETXTuEVckOO15cXjZCPuFnKKMGgMjt4PWxv3iCQy9zgElVFxd+Gn9q7+7UfKuXvLGPTgmTNowzc/W1P4LaAzeikep+DDEjKBUGReEUi9MoA3xUPaWHR20Am/0yhI/24G8lxFMYhzBNR2LZAEmys4K2tD21NcZQT4x7d5cNE0F3h+4Dz79CG1Pxt3CPgPvT+zRxgijqHRQgF1VUKry9rhysp/UtwMB2ChOpX1OR7ZaweZa5MRXQ5ImT7XN4WiaFUG56ZPI073sRZNaT74WfpgO8+ru7+Eg7PFdH5TQJ1P3I/CLPd03wciqgbwfIogDvUyUlLCLxF0gB5mEuymoiEN5ZA3uHhl3GmRHvYSffa+NJHTsQlWYuqT/Ag5ZttS4k32NOq8xkRHAfxAQWwTELjJm+8WxREV2SB4GenBjLZM2BIoACyv9N7WG69MqstJYKMrznwKJlm6jjSN28mgpkh5o+RbTBzVa3oXX3c1gDbN2iJ0ABpKHDpDX8DQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kvoc+dy9hg2HyW6ybXRTdU5aS16lA5TUtT9gen0keQnjSLR/f8YkuLCHHvI0?=
 =?us-ascii?Q?OK/ytoyLyfdVJGD4CzZGfSvgory0mHdndtNfe4kAUMtisnlWa0/IM3Torpla?=
 =?us-ascii?Q?G/OavQbgg+JvCicPqcflbYNMvmWIO9E1ut5NGoZLxcb5VfVE6XYXQjKZ7Cre?=
 =?us-ascii?Q?s5tlUBOH5fQ2w0d0GMNdvUm0urqYgWiaIuPL9WIOtZWSkWhVys4vChRFHEwD?=
 =?us-ascii?Q?hnVpYRNshHYcuMFmYcJa3rW+JqMQl6anBGD2LLgAlHVV4cptLTubLN+7jEHq?=
 =?us-ascii?Q?xcDj1camefCvtXdleNnuIxLfFJAx4JDQsy5d9okov/+Tmks8/wJ3bffW0vIC?=
 =?us-ascii?Q?E4zQiCQGldxw5+6p1MB+TFF//FldCr7aH7RzQ1TbBGmBLZ5f7nF5aQE59XV0?=
 =?us-ascii?Q?vMmPCbyqSyWstzEPeYiaJCjI+ybWVa7gbl7chzAgdmkOZKyo/Dpj4B4Nynh+?=
 =?us-ascii?Q?U7sZ/GZ9725rUWgX26lGgYek/somMBrAEaQIA2bhm+IG/zkWni6COgv1o1X6?=
 =?us-ascii?Q?LAEK2Rus4XK9RA4a/KCp5qQXIAOMtuWjU3LcPSuC78pAMsymliE2RKYlB/v9?=
 =?us-ascii?Q?cFO/I62MaYeayEnixPCfTdjc9Qv5UK+lA8yT2uyVkqoTk3wL8/IL0KaE6qqO?=
 =?us-ascii?Q?fsRJdVjV4GMiZqBEBLLMky2vdqYm1IRhhDsmJc2cg4p29ZUhPQQr1T2IJpWU?=
 =?us-ascii?Q?pcKdBjOPct1kbYvi2PbpdDvLvTT2QQ6Z+euxoy4N0dmDROe1Gc8OFP/V1p7E?=
 =?us-ascii?Q?wXOkE0fkA/QI81fH2qCsILyHtNPjW424jK2e06v6FVSnVAXXQTLfGI+7508r?=
 =?us-ascii?Q?fcutWZrh00z+WsTa7FVw6+c8oozHYzAGSwHfG823De/iQsYxUnszbzxDFeft?=
 =?us-ascii?Q?PRGlD3MRUL/2kX7oKepw99aTTP1ETjXMC4HWIZUb2NI/28pL7c4G3irxuAGz?=
 =?us-ascii?Q?O64AT8HdD0exV+e8PuXKmCZPP3CZR7WM146FFicKjx6MOYSYVxhl7EuQZkqq?=
 =?us-ascii?Q?QllMMp71DOYfASRP9QnGZ+ecTOlfKDf8kIZslJu+N0oyxHi5CiSlLxA67BE4?=
 =?us-ascii?Q?wzTZT/xRp0+NiJPBj8ZPPuISm516yQsD5e9SyDSTH3GZCTuBw0sdjYp6OpIx?=
 =?us-ascii?Q?jyjdfOyYftbDe2XwYCnig5zkN0omJTPGTHhFRfTBwrEvzCu/dIJtriuYyzTK?=
 =?us-ascii?Q?RUkF+9Dwz0UZtqRclnpAkwmcd+M0Hr/pkYKeJTzRlQhkKp7GWM/VLYMClYSK?=
 =?us-ascii?Q?Z1q2R9BTzsgvTVVshZKM53XhwaQXTWmVFBUkC9HmlBG223BICFu36ilKpset?=
 =?us-ascii?Q?H/rpGHrPUgdE7Kl7tl82x0PavsYptx7o6UD3mcYlUvULfVpJanNTPEkddJY/?=
 =?us-ascii?Q?yh6jI8D0oCE59go7ej9qnJYb7toJ+RPgIU0A5XNG/kHawc77jbt7X9BSuFur?=
 =?us-ascii?Q?b1lvQNFKRfoZ+TOq6Vrz/nSzTkEDUGqpoius4EjPysoXy1uaaLC1GAeXLOLR?=
 =?us-ascii?Q?uufRTUifeu9XnaFs1F0pEbpIwTMw9XQwAPDkc0XLYGphpRKutNkCdwjTwII5?=
 =?us-ascii?Q?gMYhyAbsBeTtVEkGIUKm5xI9E+bLZFJBVGPzA/kDyjNuSpDZPaLhQ1kK2ttj?=
 =?us-ascii?Q?emRbBcQYRXbUER05C/KheFqvQHf31SAo+/KKW5+YkpFnWIxQjq5eZbeQEGoS?=
 =?us-ascii?Q?7GDf1ExQS/N2VPhmeOGfpVdlnPWAYew+tAwuxNRCNz3/iyKTP/Vq5+2wNEQ2?=
 =?us-ascii?Q?9j5UzXGhGw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e22a4b-c92e-4053-8262-08de833979ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 08:53:21.2843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SNCXluTRLrnYwXgAXQoqSk9P8JlYnJeDSFitoGn40iI9ZmkaVuw9rfZhgr9eKiKWrcJ5+QwVzKkYAjWqfm1EDrU0VJOyeYHaeAZ8F+BlzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9351
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29463-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: D912D2967EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 06 March 2026 14:34
> Subject: [PATCH v8 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable=
 PCIe
>=20
> The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> Enable PCIe support.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Changes:
>=20
> v8: No changes
> v7: No changes
> v6: No changes
> v5: No changes
> v4: No changes
>=20
> v3:
>  - Splitted enablement into common carrier dtsi and board dts
>=20
> v2:
>  - Removed board-specific dma-ranges.
>  - Merged enablement and pinmux assignment in same file
>=20
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts      | 16 ++++++++++++++++
>  arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi  |  4 ++++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 696903dc7a63..1ba50512f4ef 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -122,6 +122,11 @@ key-sleep {
>  #endif
>  };
>=20
> +&pcie {
> +	pinctrl-0 =3D <&pcie_pins>;
> +	pinctrl-names =3D "default";
> +};
> +
>  &pinctrl {
>  	canfd_pins: canfd {
>  		can1_pins: can1 {
> @@ -167,6 +172,17 @@ rsci9_pins: rsci9 {
>  		bias-pull-up;
>  	};
>=20
> +	pcie-clkreq-n {
> +		gpio-hog;
> +		gpios =3D <RZG3E_GPIO(4, 5) GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name =3D "pcie_clkreq_n";
> +	};

Dtbs check is triggering the below warning.

arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: pcie-clkreq-n: $nodenam=
e:0: 'pcie-clkreq-n' does not match '-hog(-[0-9]+)?$'

Cheers,
Biju


> +
> +	pcie_pins: pcie {
> +		pinmux =3D <RZG3E_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
> +	};
> +
>  	scif_pins: scif {
>  		pins =3D "SCIF_TXD", "SCIF_RXD";
>  		renesas,output-impedance =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64=
/boot/dts/renesas/renesas-
> smarc2.dtsi
> index b607b5d6c259..e2a34577a1a1 100644
> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -96,6 +96,10 @@ &i2c0 {
>  	clock-frequency =3D <400000>;
>  };
>=20
> +&pcie {
> +	status =3D "okay";
> +};
> +
>  &scif0 {
>  	status =3D "okay";
>  };
> --
> 2.25.1



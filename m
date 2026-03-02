Return-Path: <linux-renesas-soc+bounces-28631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJYvFEiFpWl+DAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:40:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4971D8D3F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 13:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58E943057E9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 12:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF6236C9E1;
	Mon,  2 Mar 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FZwfxpCs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BEA36C9D9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454750; cv=fail; b=Qekuz+nsGyBFp5VPezVoQD5Z3bxefNWV87pTow7To/INIB5+QDtUC4GPlX0C9o9yUdsh4+eYu/LgzGv+4U8D7sB4b5Xjq3kYdaMIF0pyj1FMB6HwPPlrdEvWvDpYmG7j4vc5uGpghPHXHeR6xq6e05M4lCnWs45G+NF58SioCy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454750; c=relaxed/simple;
	bh=uIjdJhJdE5w5stkJpBqZ9EsCItaBhS9ThlRUGL1pMgI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SOuZKE0BmIoSyQQ7BFEACnbQpJQyxui5i79iTDr6Ly5/C4Kz2418cGEx07Gk+zWmc92+XTG2HXAE6NTU+0Kkvz2lEX1fn4Z5EG93iS7jEZaGq6sP60Deo0z7tvScwqfHlRrFde4wrAgrhMSXtwY/O1vK7BIKwa/xbBHzqYoF1/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FZwfxpCs; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzOi0Dt4MzUsoBuXxXvPF+vKLWUgC1nhQiwuFfRMOC+397eglJmlt93bbdRwL98PZusD7M1NMQG52u3V7C9pSnRovB3rRZ5iTxIKigYcbGHxJzsOTOKv2JiY72BpuVublsewrG+FKMcWzklNCGhgrfCoSIbELN6+nRXp310s2jWx4tfpOBaiiD6FvgRHebTbGIrGBpHyaRn5P44QpSdYh1GPVtHaD5dqxhqNV/iPOGyV34ZS18TRmJwOP8QjjHh01V1klETIgwH8v3pjBVq4kokB+7Jjel2fw5tGc/rCJcg5nJJbg8Vjbe4k/47QGkbm27uBi80fQrd5wVLZKO7zyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWqqa3ukQF4emSxzD5jQdzguZuuAKgq3h9LMhAEiU4c=;
 b=Z/oQA2v7pnwXWvsMBshDR+Zg1vX8RXDBffPpJ4kw23EX+ror/rdvVVxsjDM7VAaYv58mCpEe3VNwad1T9JN4AhZA+8jz4UpV7IfpLepfdCqgZ1IFw0ahC7ghikl7S8BWnK1Z3JCzCVj7QsVtP8XTehhPJMpN5y1O5wwdiO+6Nl4jLhJPPJ87YT5SIzJdMPEIRbUpRgat4S7q7LOgTAWPqJl/Y9rHn8GQDCuCEOOagLu6+345A3mXdVRgr7497jn1cmKEzxgDbacFI6KkPWqV/F9DNI9xZJZObLCNvhjw2OKmhLCF797vI9WDgZnth5kIhA4qhGwwlAYxhE3QZBTBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWqqa3ukQF4emSxzD5jQdzguZuuAKgq3h9LMhAEiU4c=;
 b=FZwfxpCsBYX6YMqgp4mdZU3WtdXG8vtRrE75M4LeyyVG3NfPTkEB7OmqJ9JFoNEeY9XQ/rCysFOjTsbMV3ZCFW/rzYR1AfUzI3xg4zur5hCJFdNct5udSXjOoXxfWh2Z3iFeMW/+wI6zcVpbx9te35uYHssUB0/VzQvD4AqI7rM=
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com (2603:1096:604:39f::5)
 by TYWPR01MB9838.jpnprd01.prod.outlook.com (2603:1096:400:234::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 12:32:24 +0000
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796]) by OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 12:32:24 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] riscv: rzfive: defconfig: Refresh for v7.0-rc1
Thread-Topic: [PATCH] riscv: rzfive: defconfig: Refresh for v7.0-rc1
Thread-Index: AQHcqjSV/0CkK1U7g02xgZpihM27l7WbLIDg
Date: Mon, 2 Mar 2026 12:32:24 +0000
Message-ID:
 <OSCPR01MB143157CC213EE77764BB43015AA7EA@OSCPR01MB14315.jpnprd01.prod.outlook.com>
References:
 <a7fdd607fafd2215c862e0750e7cafedd672e78d.1772449522.git.geert+renesas@glider.be>
In-Reply-To:
 <a7fdd607fafd2215c862e0750e7cafedd672e78d.1772449522.git.geert+renesas@glider.be>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14315:EE_|TYWPR01MB9838:EE_
x-ms-office365-filtering-correlation-id: 061466d7-0857-4bbe-0de5-08de7857c206
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 uJpYWexh9kdIFlwyGuXFYmeuf8+yuwCZcuH8JBZbYQpzsdRYwMaeLCTtGKY6QdAaCbQkplb/OzY/C6MPv7CDBzesn0qBo5IgugxbZDDx1o52UdU83Z/Z5Y48WNRTJ0OTFtkwGcGU88m2gaAmV43suRcJpQsfF/0UXCXO6pESiOhfciqsMgGgnNcB1My0QvuUB0yNLJh4+kwQMQGBcKM5mQNdY30ydhSK3sxXMjc9MYt+j2oLMD9qt+OGMN6jw8y4/0x3vTRhlztZySLhaSHtkdutluZ73Q8Aqi5Qn72pP4/P6fDedoDRd5FMT3ts76w8IzymvWJ2F01BFyne5NNja+SPZmbRbbGSEq40Z3W+O3Uz4utdpXkEJJ1MH15il1R8xeomZ6SRim1IfgipI78trRRiloBuyKOKWsrpCpa3jyso95V1pdMeP4Sn7xtE4+PgisidLDVDN5w3Apybd4tr6Ce+gfCdLA7wXJX6FMlm2KSeMgmTWO0HjfB6ZmC6tBg3Fak0jHjZW3H1Cwa6Cm6ivPnVedfJthCbFBW8bROCuuo/AonXupeo5kUmOaV7yKMpSBZUdW3WlMIHuPMdZ5BLyvmbKM6nGI7Y7InU1FwYyDaPJe9BgJyh629hYKqRtQZJ6R/PIBQatTMSw2uO/5LwxjuX43FP/mg5oJh5TZRJGejWK98iyWCq6pqfey+Slu6UxBd8UXL96Rfw4TofOao3jdaYkuixVu9dRQStp5uj23pkfEv/rWVD+M4XPfGEVDofYJDtTm+wl8X7tlo+JTFwrGaTdJHFkWoM3OdG5TByY9A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14315.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kI3lPnAq4ikB9gqOzwy5aQ+toKY8eI1lS7xU8/D/kezmVruTNZeC5pfMQ1sK?=
 =?us-ascii?Q?aPE27W50FOXkROtfNVCWNMn9mnuiAarYmt0OW2ahq8oJUeTnVCBcgqCoa3i+?=
 =?us-ascii?Q?ukiSUKsqphSaKsrngjesvoS/PDEwP/XGDYgmn/WdWUZqfCeXlSEccpWJ4wyQ?=
 =?us-ascii?Q?K23lSP7JYTtUjha/XK1mmlNqAhLflFkAxsfBPMc1UvIHCKLTztjLoSUUpY24?=
 =?us-ascii?Q?Rt6Ee7l+GFWLQUps3K1l+vOPUFW5T9v5ASXf9kKWFgTwg9GDqdju76fhSUBE?=
 =?us-ascii?Q?cDeuEG98WbPqYkG/xssNeQ/VWaPQoNYpPVQIMlDU24xejF3aG6cBxYFTX4Q5?=
 =?us-ascii?Q?o3zFG7Vc7RNPPp1mEbbS6p4AClsNNA/cyV3314cOacvobpzIFqXkLE80VxbC?=
 =?us-ascii?Q?fIVLpH00krpOFAKhwTfW2Z4ItjIaR/l/cUOY/wgB5SJMy1N4GW8vEeFM8Jv4?=
 =?us-ascii?Q?DPKwfkrA6ef/Ra19rHnR1YPz5VWMALjTUGmO6qjaVmxL/nhGuAmRPpHkixq8?=
 =?us-ascii?Q?wncjfKbtUFFWX3GjCF0BPK4KqVdPfATXs4oiU5+Ky9cq83lCLF0ZaToVXmMw?=
 =?us-ascii?Q?ZuMwBOVTiHr4PAOM61eX5RyNikBNCQf7tbLV1k34W/BCP6Hm9tVqR0Yfg7xJ?=
 =?us-ascii?Q?2R4G8+0d3HIoUcp8lxnPDTSokEmKTshMESv07lG4Dtwhs0umRrykfezOSqTu?=
 =?us-ascii?Q?OUw80mvT5fmjAvMuSVDWLMfehGGfGmnaSVdUPtnzDp7Qiyfcy6+iGM8AAzvD?=
 =?us-ascii?Q?W7eMf2TA8vXxQkWsS4q5Lxbf5/zv+i1NgU3F5QYhaF1/07p24J6fYnTf+shY?=
 =?us-ascii?Q?W/Yo9N8I2dzIj3KpVh/Mt/I3Pv9Lf0iLCwb1ksqB5pEm7wpwfok15IbXMBDj?=
 =?us-ascii?Q?Z7Goin0ORbKdQtDgO8ZMbIrD7n5GN52KC6AwjNk8St1YH/mN27oRxltKmu1v?=
 =?us-ascii?Q?rg47OV5vNzHkt45DYLYC5YB9LvzgvhR8Dm7CRw4HZfH4ZIyCarb9iAM3aCQV?=
 =?us-ascii?Q?ELmTMdIHfaL/F1fhhABCIxXkRd18qUahr6hp6JP3pr+ZFKeqTpyjXXolzf6q?=
 =?us-ascii?Q?c1aNUsd1XVoWy2VnRmPqAD2+3a3bl/VXlffB6sTQ3iGPh03/eE9MFW6zOUTB?=
 =?us-ascii?Q?DPyQqT64nJuf/BgfwMPKU5ZWIcbydRtEs15upGnICn/eeYLwAyXyoCZvuTFt?=
 =?us-ascii?Q?fTjjzBKQK0rzhJGrNcKJMPJhF/VCaxhhynjfmSnqvtp/4N4wD+2BHtAVTMrG?=
 =?us-ascii?Q?ZhV+O0HqXfhlV891abBHC7aTOBFOWXylSTr+jv8C8gB7P0MxiPvn1Nqj2+a7?=
 =?us-ascii?Q?9SU6bzByk32BFZYSZfjUV2eR3/zCWS7fQBGLcfR69x1dBbgG+ZM28PtU07kd?=
 =?us-ascii?Q?LaSGlRQbc+09iPNW+I0wtKYBZFeByrvm+ICO4+xFJHQ3AzZ67lqujOcdSb+w?=
 =?us-ascii?Q?FmOK4Fi2Wt7vZ0K/Ve+pOx6xd2X2PwfOficsxiJ11Hww/Yh1CPUc3kHdFZjM?=
 =?us-ascii?Q?sSO19UUIwMHTf+J17boY7YDCVpjgkW5tQycwUDJxQdunuQJk5LZ3om3lfiBJ?=
 =?us-ascii?Q?k4KW9sdvussPH6BaDbVMugOxQc2SEY6shvefF77kg4mSDab0MfMA20vHidFm?=
 =?us-ascii?Q?YqLw5rh1fwyvvgOzCgqfvbwmSIGKW2tW+ZMyMqbVa9dHCCqDqDuceaERSY9f?=
 =?us-ascii?Q?YzdlvvtSotsNeop1oA5e+cnOi2iJBZh0GK+V9aOeG52LwMhCyUk8xsVAn50A?=
 =?us-ascii?Q?rI5l16pd7nlnMy8ED1yojJJJvKb902dbX9eaWj9DatiPSlTsilxm?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14315.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061466d7-0857-4bbe-0de5-08de7857c206
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 12:32:24.5464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pD/yAzfpVqDRl1FHVQ4ULHD81NnX6UvHZxz6F188aUPYp4vQjdegQgUiXmPU8Bvn4EZxINZVAEH5PxQj5PoqcWlrTx8NFD1YpykxGFgAfzC0WLU350rGpT3TkCV8lBSL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28631-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakar.mahadev-lad.rj@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 4E4971D8D3F
X-Rspamd-Action: no action

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 02 March 2026 11:06
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH] riscv: rzfive: defconfig: Refresh for v7.0-rc1
>=20
> Refresh the defconfig for Renesas RZ/Five systems:
>   - Drop CONFIG_NFS_V4_1=3Dy (removed in commit 7537db24806fdc3d ("NFS:
>     Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")).
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
> To be applied to the topic/renesas-defconfig branch.
> ---
>  arch/riscv/configs/rzfive_defconfig | 1 -
>  1 file changed, 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
=20
> diff --git a/arch/riscv/configs/rzfive_defconfig
> b/arch/riscv/configs/rzfive_defconfig
> index 35a672805fb0eb74..a07c75d5f5aea719 100644
> --- a/arch/riscv/configs/rzfive_defconfig
> +++ b/arch/riscv/configs/rzfive_defconfig
> @@ -193,7 +193,6 @@ CONFIG_HUGETLBFS=3Dy
>  CONFIG_NFS_FS=3Dy
>  CONFIG_NFS_V2=3Dy
>  CONFIG_NFS_V4=3Dy
> -CONFIG_NFS_V4_1=3Dy
>  CONFIG_NFS_V4_2=3Dy
>  CONFIG_ROOT_NFS=3Dy
>  # CONFIG_NFS_V4_2_READ_PLUS is not set
> --
> 2.43.0



Return-Path: <linux-renesas-soc+bounces-30446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PAZLg/Jxmn5OgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:14:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 162AA348E78
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACAB630825C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4243834F24B;
	Fri, 27 Mar 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aHSSxYhx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D2933260F;
	Fri, 27 Mar 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634990; cv=fail; b=Kw1xWAUEO9b8Qnf8K+w/FJIH92PssjZ3Cxg0z7WxfjqBol1dEVedKhrR6ouJdXo4T5bLCIMqDeJZNGu3465384Hahjh25WQdS2GF90gwFsTqDzjzCYUKKCCFQs6j6dUftEveOQ8HDjC7Awx95q7sf5gbhVi1MpV5xCIg84FF9jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634990; c=relaxed/simple;
	bh=uksNAMd0c65RZAG9rrjZvKw8sbLnYn6IgbXzD8JWk5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c/mFOGd8IFZpSkV1hlO0bmmIJOhZIy/IjhDz4lHVCdEopiG4FhRB/xBvgxLE8LZ3oWrwF425maTnavOA0piKSD3Cps99/dNAT+TK4oTyaq2iGe41lTIeoIzymEEP4L14dvs7/ohl9aLZhlBQt8hZkq3LiOsRYiq7ZSEUCojCvEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aHSSxYhx; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=do5REuRsLJSfYosefxp/RlclOdUbyHvprOhKZKFKzOzkF8G/q2nuARyKDTC9Sydp3+U4fAokDRzmezGslJTRxCnGl8omPyxPmFa86UchzIdJ5vm1TVKzAFqGyZ8gdtHTp+ovFypdbnQ4ZXqahWR2CX9W3s4iFUq3Sikb/QuyZMOD0uvdPntCaqvUjBFVMujQRv9QBXkp1mUnQ7s2FuMIEQUloduP/1nkOf5AnCf/DS8sUYXcQKxlpPA7qvOnbxoJpOYR8m+/jdYN7abgqoPiVH+Vlws3DVmP9Fquot016ype3FIquixKI0c8n/hJf6qCb0pHzXBBrGp2ZebQu70oWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHXb7+soJHTQuUHPjWApw9N0qlbwW6U93SZe6yaVzfE=;
 b=Hk7emEXeeRU9rCfltO1BqZ/yEWISy429zZr00WdzVziCBfQYNR/xlcFdEVrc+/ozTkBzaj+9Ta/5nlFfWnioUg96r4D9ryqb8zXi4jufxoOdNwk/0cULftYTdxTh0bE5rDR4oh06Ve+5EOqkGnntCXb7gSYQ0/A7225W8Qz+K4m3NXVNB0wDCNXmOTkjQo0fTHU2NO7yc898z/rg0p09FKRCzLka0rT5O+zu0J21IaWwaGS2E3WAYGg1kGoNpt++BcnW5ebvR0k3+ucuU6BumzP7TXOQES2lWwyJUtaoIgPYqmqqOIzurDHFqclu1tjCmdQYXwWqWQjDYDuI7XzfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHXb7+soJHTQuUHPjWApw9N0qlbwW6U93SZe6yaVzfE=;
 b=aHSSxYhxmdr0GXzXl775VLcIWLahtzRHJYRQth0i1Xvz3IewWi5UNjmA3PXwAxtnOr+55W2fj8ZkRI0akXR8p/D7e5TKy0+P46TJxQGDrMSNoPNIVNCUP3cACKR/Q+QjowpG8NejYlJEBj9wCS2NXUrXcE5EubNTrDXRXk/IgxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSRPR01MB11662.jpnprd01.prod.outlook.com (2603:1096:604:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:09:44 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 18:09:44 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/6] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
Date: Fri, 27 Mar 2026 19:08:48 +0100
Message-ID: <2b98798fda67e1cfcb7b4df80097c98a148f22c9.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To TYWPR01MB11940.jpnprd01.prod.outlook.com
 (2603:1096:400:3fd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OSRPR01MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ce05ca-0a43-4cf8-c82a-08de8c2c061d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HN2Zpya+lbaREr6K5dm1r7m+MWDxBE0v72aKAXQrPIWjN5nH0aGMbRR0BiAXSqkdBdgN/RY8pUTBRrGpMgbddCJgwFG0rB3UVRmvT9a4Vk2OpCIruXvhzOvPTHagJXJGEFO0KWhfow0gJ1m8yAeLv1bwiizEHfjm2c6qGB/vs10Xsnw5E08qF8KkSguc3lytfAMioqXUANS3X+NS/YcPdA2hVMG/ujsPm7i/Gxg0JHItb+yhK1Te8+OvmRMkuz9NcZ16Iaa9/d4DR6kCu+1tvmbXf6ipfjFXHa0pBusatbWbzS/QJXg9nHTfwF1RIL/b5cIj9OpFNFbau7R8gfKUVrmQA+VAfQHqRchxBA7+Vw8ShWDr0ddUMWKuHmP512IeVgiFafNq5Ny+WrMI+dpP16IqRx/OXZbhG5bqk6f63ctlDM9oLG3wcgtjLRJnrJzfKIXenUlkcvQU1zJIExqXDmNcZQpSmi3572O0gbkStLL30kyB25wKieIebH7lb6rdwnzQ2UHXeiZoUOoGryxCQ+0RiRIwKhGF7+apgCtWlFe1/AS4EhG2PIvmQOEW48qALP9JAiVAuGEPKYCfUq5zMvtiCX5RrWilIHO6LDQUeSi7MaDQPIQOOtX0Kbp+hqB6GuvsqD9BhTW0BjOzeJhPvUjCMRUFEQv7QT0srp6Grmm8U93M/ABd/jMxbVrSIxE2uPGvlrYe9w8vki2KWlahWZyYNWmEnIL94DQOfujXiYO9fz1fhHgXim/yz4H48tM6uPXAxcAwuZRgpJ3lrUDvkQSpy2pLgYDa4YJqHptKuY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1K7tV3mqKH5q53/CeZGqlPla19I7QJREkUtNFr4//4BJNZWfpBEjEVIQPi9g?=
 =?us-ascii?Q?S/IZiyBJ1cjVHw/EJ7X/QwIVFchHEZay9Y9x/S8rzlddKmaaTRCH6P1Dy4Zi?=
 =?us-ascii?Q?80yrL1NOhuLO7OwnghUYjivUk9Y/N1l4qa6ld0B3S/nqcz2R2tr8Hd2sJ15u?=
 =?us-ascii?Q?ksuWhbiodtl5k99IjVWW0s3B2BNTl9TVfkp2vcEkTl+ZRlIBi2SoOiWuKPPw?=
 =?us-ascii?Q?sTj3nShWqXv5oNyz7ri5EBzMtjNc3fSoPeyXnXEJvAJlg19cxDxfWSDqnF2z?=
 =?us-ascii?Q?MBWEyszbhhyvR6Ec+HbdUxZCfP4ZPxMvQbaLPgAiasShEtQZA8UsI1Zuq/Og?=
 =?us-ascii?Q?A0upkd3Ebwcbs15ypfpjeWS4fwuX+RCEZgtH1lCYQs+RNZ8NtGRoBjmF+YD+?=
 =?us-ascii?Q?Jrjo7qfEPSKrrDYSR4INeWXCYZJqrvGcBDq021WVBDMW+nj6ecMTwQr8WFTt?=
 =?us-ascii?Q?XuR2AzGlJHxNLxfP0yACrdxZIwliZLohfSNgnq95yFYB2sVMii4hgdurCN9v?=
 =?us-ascii?Q?17miq/ovXtCnI87aoZX0L0+p32myC90SeFoHYUpmZ4JLcF+xNyl5esQAfp0W?=
 =?us-ascii?Q?Khu4qbVX5NRk1tT6On+okcQGhnu2b37FLfQoKaAV+To5ofufzrfnPRERZlq7?=
 =?us-ascii?Q?gK6NtSw54Hd/xRtpTsmDQOXO3Cxyd+6fAI+5zqImIm64/bKrpOhH9eEmmZKe?=
 =?us-ascii?Q?4i2k0Lbf/KKAgz89DwgsAbfPvzsOO+ya3yExrlHs9s2VxBvamCqo7IqzeH18?=
 =?us-ascii?Q?HBsYAcI6fnw3IQbl03r8uQA7hLnWqxh48SXYFI1sU6euR73wE9rNIWfe1Hb+?=
 =?us-ascii?Q?jvxK5M+hHvpC9RYMCXzpRV3eQbyI2uX7MEGb4vF+gPp+C6GLp9WJ67gj9zUl?=
 =?us-ascii?Q?nPX+TXbhYOGxEkLl4HHyBMRSgF6sCl9DWpBtWOcuOSAz6uy2XXIJifeA08fP?=
 =?us-ascii?Q?ulg07yTT2lFAhmecAj9Lqc4ylL+02n/Q4GP74xSV4C+ZqRsUgOi7oDQ1kcYp?=
 =?us-ascii?Q?TrdBGJZWlEYoRPTIdj8hJDw4HY9Fw6GUPLRQOrlfpzajFAoN8gNw3GVSANLm?=
 =?us-ascii?Q?XS3vMehgUFXjabrCbRLeD2r1La6vbancKarlcs2pIAky5liEnT0/viq1+SHX?=
 =?us-ascii?Q?kQ42YGov1h+xYxAEyTzYMJsUlix60/0E/wjIrz/Fc3a3e092cnhWFRoYeYQY?=
 =?us-ascii?Q?d38mPHiGz0SHtwAbsEQsdLjNCEnoiC/5NHClggP9hzsaZhEK6ACrI/sXcmvB?=
 =?us-ascii?Q?dxFsdqzTrapDTV9pETZGlYUdSQO8OKxt5fmCwJbQDC4yjOQ6U1e9jFyYFfyr?=
 =?us-ascii?Q?/DBJx04D5EhZCGl8QTKO9oM+959sv8Gi0bLMX/63ocdATYkH4RcIXbkegva0?=
 =?us-ascii?Q?y3nR+viPeleXwj9sDD0rkmEwGi5FubQd+nOGWFV72yvNoOen77aI3JyubBZU?=
 =?us-ascii?Q?nEjPLIPSVRgt+5S+XCUtk/MkPHjNYCeIuP0lqS3lAe3+vokiwc9FpgKIkBYC?=
 =?us-ascii?Q?08JwvdHWXlMeDzX0TCMvGCq7CyzveEx/n4Al9WLO9w3mfRpIJx/kHRzuBNfn?=
 =?us-ascii?Q?O+CSR8wEaJWyHin6MzucJVB0YkfAYv7LI8XmgWe4AmQevgMn8HfrhwBrV2Ca?=
 =?us-ascii?Q?DY0cc+BEd1F4kNWhYu7au9+hkuMLJul0W4mwZH0Ym9fKJxomxB2FY3OLaWB8?=
 =?us-ascii?Q?CLTv5wF59YP0HU74++Odl2cL8PgfAGUNxpitXYrTWCi/ft9xCZCqtRBS4eEB?=
 =?us-ascii?Q?phTeq+78j9qz4hlcZCDhl3S4lCZvV3T1uzXNCoF38SdsbuxrF2F2?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ce05ca-0a43-4cf8-c82a-08de8c2c061d
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11940.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:09:44.6433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTHi3K3fTznNzJPTuJ9gTXnXzI8Yl+FnAJi6y7ncMoQcKB3D6/wChnCATORAk0JE6IXVq9XorfVDfFmdkjVvnGSBhR/jQI234ARwaclJ0dl3fq376XvDUgC+VVA21Qj0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11662
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30446-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linuxfoundation.org,solid-run.com,linaro.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 162AA348E78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v8->v9:
 - Fixed driver comment year (2025 -> 2026)
 - Switch from devm_regmap_init_mmio() to dev_get_regmap().
 - Drop unnecessasry include bitops.h, of.h, property.h and
   drivers/reset/reset-rzv2h-usb2phy.h headers, driver is now based on regmap.
 - Collected PZabel tag.

v7->v8:
 - No changes.

v6->v7:
 - No changes.

v5->v6:
 - No changes.

v4->v5:
 - Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
 - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
 - Updated commit msg.

v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig             | 11 +++++
 drivers/mux/Makefile            |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c | 85 +++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 6d17dfa25dad..7f334540c189 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -70,6 +70,17 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_USB_VBENCTL
+	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
+	  RZ/V2H SoCs.
+
 endmenu
 
 endif # MULTIPLEXER
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..3bd9b3846835 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
new file mode 100644
index 000000000000..79197fddbf74
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbenctl.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/regmap.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbenctl_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
+	.set = mux_rzv2h_usb_vbenctl_set,
+};
+
+static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
+				       const struct auxiliary_device_id *id)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = dev_get_regmap(adev->dev.parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
+	.name		= "vbenctl",
+	.probe		= mux_rzv2h_usb_vbenctl_probe,
+	.id_table	= mux_rzv2h_usb_vbenctl_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0



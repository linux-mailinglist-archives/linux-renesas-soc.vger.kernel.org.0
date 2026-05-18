Return-Path: <linux-renesas-soc+bounces-32760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDXXGMPfCmqR8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:45:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB2569FDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 11:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A77363004F29
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 09:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7627531A7F6;
	Mon, 18 May 2026 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pZ9sI8Al"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B876317176;
	Mon, 18 May 2026 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097526; cv=fail; b=Fi/1rrI8ZEJj18obzesc0f7W1cmLiaH6H7puJldsegkePHNHeqaUbzK62SMb3YfeaPeNh6MQRq5CnNeRarp9nGfRevioxX/lKO/p1FmWgwZ6dnwYwdtHAIAEmwDxIjcYXQWW1dfsTJjxtADeu0SFU4dFcGSxma1BW0NTUta99kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097526; c=relaxed/simple;
	bh=EEkwAX9IiBA2XOYbT/mmrTD8gFN3tKZEw0EzlyzAbD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P3g+lwPWeN5F+/+oJ29UI3zkeQL27aBrnXMKzEPYTx3AMsgr6xIKuV5JapA72PKJwrFyiZKtUje/t6wmlCAB662V5xgskJ0NzV2MB6lc0J5UYmV3/A7k9jWYDBfPKgYI077XrHuODg7uO7mc+1QDDCwnMLPUAnaABo1K1xpNdBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pZ9sI8Al; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxM9VFPMbbCx3jjGaJHtwav4U5Bw93y3Mgp1vNX8OOWyhTDJwHX791EIdk3IWEBkDXTKNJU5+ubanx5edw1qpIC9KRhPur8qNv+pHHhWe1lwBtvXH5K2oIXJdLhzwbHqMK9xEHpAoBRs7D9VI2x//lH/lfvHWzWw4aH2MO/nzKtRhazDqaKojctAUKEpCtumkBXwIo1m1m3JJkOn+HAk8l4DugosgleqtVf2moMolKFL7NKotIBbLHhz65hyCb/EJHQUzjZZ+/1XmhaGDwMdCogAfnJePUjvE5JR7xTffBmoyvStlf2r3n5BSl1hmi74IYnRwe2KLxgxJ4bPxJZeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xO+m+RF3ePbfI9hl+48V1BxTZl/xVrqDxCQ8Vd5b2mY=;
 b=CvRWZMOfbER2CZUTmiUSuY2vZ/u+kT+W5XOz2RWUION1jOpozTpUHTmdPC5jMgJmimDy9Wfe2kg4CGch7zwD8v71O4RE4FWDjLTjy8h0KPt016KUbcTL6RONDdgp55weCa1Y2wfNutUJZhCWVEVFPyMbcNZG1si/FOl9553yMnKknwJThmQ8PBtU5kZXu2A245gDBQ3YC2dFqih3IDZYtA6eNhkke1hxWvGfEx3Gj+LhAIbz1Rb/jqMwdvUGyM6M4HoRSebx/j4VZ6ji0x8eDxWqKSLxIamVZWL8YzBwAgpvO/D6cPSyR/N4LzftfUAQViwjvaLRx7AqTm76+ZeABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xO+m+RF3ePbfI9hl+48V1BxTZl/xVrqDxCQ8Vd5b2mY=;
 b=pZ9sI8Alh6FzCV6whNfz4eLc75NYAV1j9XO6QZVksNUQJDzsB779d2EfK9QWitOuBc34YCy0UBmLAlh/jdUTNS+Vc9Ey/Ok0OLGYtP7rbNX5jSGuGCstH4frjV3mUu2WRG3rv+oDrYSxKVT1bibUYaoWwNskqNJ4yqKP0ongjSM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9696.jpnprd01.prod.outlook.com (2603:1096:400:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 09:45:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 09:45:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Neil Cheng <neilcheng0417@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC
Thread-Topic: [PATCH 2/2] ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC
Thread-Index: AQHc5p+gMk0WyxLys0m0/DDMzSF5GbYTh/bw
Date: Mon, 18 May 2026 09:45:18 +0000
Message-ID:
 <TY3PR01MB11346E0609A730371D53A404A86032@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
 <afee3ea3d6d697d039ce97cc7add47e97bbdab4e.1779088499.git.neilcheng0417@gmail.com>
In-Reply-To:
 <afee3ea3d6d697d039ce97cc7add47e97bbdab4e.1779088499.git.neilcheng0417@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9696:EE_
x-ms-office365-filtering-correlation-id: 1ad9c8b1-dd77-4391-eb45-08deb4c22c29
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003|3023799003|4143699003|11063799003;
x-microsoft-antispam-message-info:
 ZWn9pPca0dH5oF1MaViVzy/tuMaaK4h5ec9mjS0rsh6ZR1rWEnheI/PCpNFOJpd8QbE/LImm353ilxOh/KSdCFgk8TKgJcYfDM/CZIkTXB6kvlex8eo5mGCgaTvz7DZ7ysf0ZAaUbF0tDRApA/zt145hY+PtuohJMzAIyr8hiv3/osmCYOICq4d11JwuBOmVmGxR6wg+uCdjG5Cp1sSkmUI022AqTOBZ78r0XY3pTunxC9AqR/7W0RiYgkcDdkZfmdjG7Yc5g9pWgmFQFZ6uepp1TQExfuwXZ8kVkOGSnAPp6jfYaf07HufFiBcpt5M3TfEjNHD2mwmK9eHCcbgHpk/ZckJiTOCfaw54JSCHVBgldB93DfHHAH4UBvb56WNykwsnc2aL2VhyLn3fWFcYgPBUNmQY6xayIb+RzrkGnuyPdu0uP4ElYA3Ifb+wWXchkTnPitihu+0QmRc3dD0ib/bj6S0m6dOyPAuaDqg/jqPLEwT3QZ3hOa+o0l2K8KoOukO2f+N4077U/Vdhqg0lpwXV3LTk8Y3RV5LDosJL2Q8e+ufCwjBEoSivW/nPDGeXl/mZ5HO9Ss3SaArbmXGKEfyrvf4yrtv95NGM+tLz2mRDAres1uJFZohzlViEpAnuUv8naeubEh+lWQ3U8pSyorPoOC1jzTyzfYuJAp9QgXG6N/2khJqmB8nMI3uHwtxqtwzUfgWrZq4V2jzbK/FQBtKa+46dVBAYmmIO+fz0Qf0rp3XUUAFqf49KgNptroZc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003)(3023799003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?djg9+jR/mxbNYmMwHLVNURPuHTSaIjXPiosyEUq0VzC2SOl/MzrsDtoSje5m?=
 =?us-ascii?Q?OpUf/BKkQ+eU1FnCJwFMtMuUAqkRzGeAxbmAfDtT4mEcNyq5X5njzh1i1uoE?=
 =?us-ascii?Q?BBoqu39jrP+sMnzciRuP2bwSuKOv0A5Y3qBaZi5cwQIiw6AX6bwF4Qwb9gtm?=
 =?us-ascii?Q?2EeBZoPESbvjbDy0rcW7Sl99Z3qX8N8tzrOHJ2niXf/UeJTXJbIhddAn2TUA?=
 =?us-ascii?Q?Gq3D3VnvgMYAwTY7m8VEOTakN5r/qjlK4V1zN0dXfg3Cf4hIpx+o7aTkwAJ+?=
 =?us-ascii?Q?fyQL3MaFuZTZH47DaCgrmpNcYt4uIIPbbrWXiIxeuJ3ESJ8SBZS8GVkB0FQh?=
 =?us-ascii?Q?O/MVzwOJZEWw3D44jviz2xhi1VbeAHRVZOrlCCG+xsbsbr4aafpJb5qj39od?=
 =?us-ascii?Q?ZNAXY9eKhSvKlwiRK8i56Y70LdLor7qz3BLh/HC0Bb8ZgX9EpY275Xow0dqk?=
 =?us-ascii?Q?ghKnsvk/+tq373o7Gk35lrHFfQ4bkai5AKBryx59SEBTe8I91bQv0VWubtLQ?=
 =?us-ascii?Q?P9ljShSeaYOnu+xLBvjWE86dB7A5A8yikuV1QVaQmSmJefE0VF98W07dAmpp?=
 =?us-ascii?Q?O+imaLIds/ywcXCyDczJegEjxGpRB5hSRVnQCXSjTbPUvKSa5FiZVHUbvY01?=
 =?us-ascii?Q?QcdHlCPI6cT70nCiqLR0U0rMtZlBIo1ecfQH9SPLhIZfp0n4FupC8mtFRq7K?=
 =?us-ascii?Q?g+55W3XwI6pqQtHeFP8NWEAp11DhaNC6xi8t0HM+3wNzUs5uPrUMV6JACAlC?=
 =?us-ascii?Q?MWPDt/8P4Mu2mWCM7/Y0crkQp+kOwFdY6dm3iARpWCHif767GkCU3OubcYKb?=
 =?us-ascii?Q?Ij3f4543GF3dA+tHLdKfGMXSKyziaJ5BZOfaSShTIMJMANcVhntaNlOSG9Cf?=
 =?us-ascii?Q?uaLFZFosHulQq4/LjqBRrm6sxtf3s+iCWGyjdecLkmFGsBMuji9PhYqMh28U?=
 =?us-ascii?Q?mul5uNHFlIR3pm6zm1U6Ma0Txcm27BziCDrPXln30s3eOr5sZK6OLFoG5lft?=
 =?us-ascii?Q?rHbiPmRn2lXNhQBiPsruO1wVHDuGfj7ZpH+MfLXuG4ej2ThmpjdRLuxduADt?=
 =?us-ascii?Q?e86ku+ezJhMuobRRfp5MICjYyMD+ysK6ytmTO2qPj76mTnPaTmYQmGWLgDL7?=
 =?us-ascii?Q?Q1/32Bp6WYrzaLFkL5CUD86InKSVD3B+GI9dRx1phIL4AnZv/1UoCHZZVz8k?=
 =?us-ascii?Q?zw5nBCdocgKxaOHgcdgVoQNUgyZOjxI7DVdnGyAkJu7WFoswQXB8Hge+svfB?=
 =?us-ascii?Q?F2QKRuUnfWlxwTCq2EFoYC/+2hNPHjJAnewBINl0x2FiIhLkNCSoDPmQDnEQ?=
 =?us-ascii?Q?COutHSAGM/x+uL5fgoZJIfKOPM+/d6Y+5ja4OWWSjAtmrUdqyiT2ETnpAS74?=
 =?us-ascii?Q?yU2gNsOh3MdjSMZVkQ0aXe9Qaua2QdFICQLh6eW70oV8/4dD85Q0ouzNqSyP?=
 =?us-ascii?Q?kurATQigEYOUr8pTRkJLppR8TeAUyoRf2heJ8dHG7YqIx+6OgtzxrQT982+Y?=
 =?us-ascii?Q?IQO6KKItv3xQcCCxHFTMZ1bOH7PsfJCvIDSvuTCO4p4jffL0otxBtnLURxvc?=
 =?us-ascii?Q?qss8DaoWS36WD+iZUn59pQX/6EvqphF+E0BxnKcwy/s6mDEbebopsuy0vXcI?=
 =?us-ascii?Q?BHEVfUsJpeca7T1o1xJVPc+zJTfgFNf2+U+yCj/CGn/YFEcRzOqcFW/QBPgz?=
 =?us-ascii?Q?SI29M770/dJjBUULZkHt41Owychm6CUYOPzdSR2hICu+OIkWgGWpISAXarLz?=
 =?us-ascii?Q?IwUSyG8oyw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad9c8b1-dd77-4391-eb45-08deb4c22c29
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 09:45:19.0230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s92fKfgkxl4cGz9STVX0ILKLN5UCbw/uUilTF+vDlMx8WA/Kcs6cMmZjceuYDyBcq4JqfRmExK/tkmY79YW7yDhhfjlaoxYobmiSO/gDLPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9696
X-Rspamd-Queue-Id: 18DB2569FDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32760-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au,codeconstruct.com.au,glider.be];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Neil Cheng,=20

> -----Original Message-----
> From: Neil Cheng <neilcheng0417@gmail.com>
> Sent: 18 May 2026 09:13
> Subject: [PATCH 2/2] ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC
>=20
> [You don't often get email from neilcheng0417@gmail.com. Learn why this i=
s important at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Add device tree for the Meta (Facebook) Rainiera6 compute node, based on
> AST2600 BMC.
>=20
> Signed-off-by: Neil Cheng <neilcheng0417@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |    1 +
>  .../aspeed/aspeed-bmc-facebook-rainiera6.dts  | 1012 +++++++++++++++++
>  2 files changed, 1013 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera=
6.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 767f7c7652d5..215429af1135 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -34,6 +34,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         aspeed-bmc-facebook-harma.dtb \
>         aspeed-bmc-facebook-minerva.dtb \
>         aspeed-bmc-facebook-minipack.dtb \
> +       aspeed-bmc-facebook-rainiera6.dtb \
>         aspeed-bmc-facebook-santabarbara.dtb \
>         aspeed-bmc-facebook-tiogapass.dtb \
>         aspeed-bmc-facebook-wedge40.dtb \ diff --git a/arch/arm/boot/dts/=
aspeed/aspeed-bmc-facebook-
> rainiera6.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dt=
s
> new file mode 100644
> index 000000000000..2c8c983db677
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dts
> @@ -0,0 +1,1012 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2026 Facebook Inc.
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h> #include
> +<dt-bindings/i2c/i2c.h>
> +
> +/ {
> +       model =3D "Facebook Rainier BMC";
> +       compatible =3D "facebook,rainiera6-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               i2c16 =3D &i2c5mux0ch0;
> +               i2c17 =3D &i2c5mux0ch1;
> +               i2c18 =3D &i2c5mux1ch0;
> +               i2c19 =3D &i2c5mux1ch1;
> +               i2c20 =3D &i2c6mux0ch0;
> +               i2c21 =3D &i2c6mux0ch1;
> +               i2c22 =3D &i2c6mux0ch2;
> +               i2c23 =3D &i2c6mux0ch3;
> +               i2c24 =3D &i2c8mux0ch0;
> +               i2c25 =3D &i2c8mux0ch1;
> +               i2c26 =3D &i2c8mux0ch2;
> +               i2c27 =3D &i2c8mux0ch3;
> +               i2c28 =3D &i2c26mux0ch0;
> +               i2c29 =3D &i2c26mux0ch1;
> +               i2c30 =3D &i2c26mux0ch2;
> +               i2c31 =3D &i2c26mux0ch3;
> +               serial0 =3D &uart1;
> +               serial2 =3D &uart3;
> +               serial3 =3D &uart4;
> +               serial4 =3D &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path =3D "serial4:57600n8";
> +       };
> +
> +       iio-hwmon {
> +               compatible =3D "iio-hwmon";
> +               io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3=
>,
> +                                         <&adc0 4>, <&adc0 5>, <&adc0 6>=
, <&adc0 7>,
> +                                         <&adc1 2>;
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               led-0 {
> +                       label =3D "bmc_heartbeat_amber";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_L=
OW>;
> +                       linux,default-trigger =3D "heartbeat";
> +               };
> +
> +               led-1 {
> +                       label =3D "fp_id_amber";
> +                       default-state =3D "off";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_H=
IGH>;
> +               };
> +
> +               led-2 {
> +                       label =3D "power_fault_amber";
> +                       default-state =3D "off";
> +                       gpios =3D <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_H=
IGH>;
> +               };
> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x80000000>;
> +       };
> +
> +       p1v8_adc_vref: regulator-p1v8-aux {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "p1v8_adc_vref";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +               regulator-always-on;
> +       };
> +
> +       spi_gpio: spi {
> +               compatible =3D "spi-gpio";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               sck-gpios =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>=
;
> +               mosi-gpios =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH=
>;
> +               miso-gpios =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH=
>;
> +               cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +               num-chipselects =3D <1>;
> +               status =3D "okay";
> +
> +               tpm@0 {
> +                       compatible =3D "infineon,slb9670", "tcg,tpm_tis-s=
pi";
> +                       spi-max-frequency =3D <33000000>;
> +                       reg =3D <0>;
> +               };
> +       };
> +};
> +
> +&adc0 {
> +       vref-supply =3D <&p1v8_adc_vref>;
> +       status =3D "okay";

Maybe status after pinctrl entries to consistent with wdt1 and spi2 below??

Cheers,
Biju

> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_adc0_default &pinctrl_adc1_default
> +                                &pinctrl_adc2_default &pinctrl_adc3_defa=
ult
> +                                &pinctrl_adc4_default &pinctrl_adc5_defa=
ult
> +                                &pinctrl_adc6_default
> +&pinctrl_adc7_default>; };
> +
> +&adc1 {
> +       aspeed,int-vref-microvolt =3D <2500000>;
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_adc10_default>; };
> +
> +&ehci0 {
> +       status =3D "okay";
> +};
> +
> +&ehci1 {
> +       status =3D "okay";
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +
> +       flash@0 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "bmc";
> +               spi-max-frequency =3D <50000000>; #include
> +"openbmc-flash-layout-128.dtsi"
> +       };
> +
> +       flash@1 {
> +               status =3D "okay";
> +               m25p,fast-read;
> +               label =3D "alt-bmc";
> +               spi-max-frequency =3D <50000000>;
> +       };
> +};
> +
> +&gpio0 {
> +       gpio-line-names =3D
> +       /*A0-A7*/       "","","","","","","","",
> +       /*B0-B7*/       "BATTERY_DETECT","","BMC_I2C1_FPGA_ALERT_L","BMC_=
READY_R",
> +                               "IOEXP_INT_3V3_L_R1","FM_ID_LED","","",
> +       /*C0-C7*/       "BMC_GPIOC0","","","","PMBUS_REQ_N","PSU_FW_UPDAT=
E_REQ_N","",
> +                               "BMC_I2C_SSIF_ALERT_L",
> +       /*D0-D7*/       "","","","","BMC_GPIOD4","","","",
> +       /*E0-E7*/       "BMC_GPIOE0","BMC_GPIOE1","","","","","","",
> +       /*F0-F7*/       "","","","","","","","",
> +       /*G0-G7*/       "FM_BMC_MUX1_SEL_R","","","","","","FM_DEBUG_PORT=
_PRSNT_R1_N",
> +                       "FM_BMC_DBP_PRESENT_R_N",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","FLASH_WP_STATUS_R1","BMC_JTAG_MUX=
_SEL","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "PCIE_EP_RST_EN","BMC_FRU_WP","SCM_HPM_STBY_RST_N=
",
> +                               "SCM_HPM_STBY_R_EN","STBY_POWER_PG_3V3_R"=
,"TH500_SHDN_OK_L","","",
> +       /*N0-N7*/       "LED_POSTCODE_0","LED_POSTCODE_1","LED_POSTCODE_2=
",
> +                               "LED_POSTCODE_3","LED_POSTCODE_4","LED_PO=
STCODE_5",
> +                               "LED_POSTCODE_6","LED_POSTCODE_7",
> +       /*O0-O7*/       "RUN_POWER_PG","PWR_BRAKE_L","CHASSIS_AC_LOSS_L",
> +                               "BSM_PRSNT_R_N","PSU_SMB_ALERT_L","FM_TPM=
_PRSNT_0_N",
> +                               "PSU_FW_UPDATING_N","DEBUG_CARD_BYPASS",
> +       /*P0-P7*/       "PWR_BTN_BMC_R1_N","IPEX_CABLE_PRSNT_L","ID_RST_B=
TN_BMC_R_N",
> +                               "RST_BMC_RSTBTN_OUT_R_N","BMC_PWR_LED","R=
UN_POWER_EN",
> +                               "SHDN_FORCE_L","BMC_HEARTBEAT_N",
> +       /*Q0-Q7*/       "IRQ_PCH_TPM_SPI_LV3_N","USB_OC0_REAR_R_N","UART_=
MUX_SEL",
> +                               "I2C_MUX_RESET_L","RSVD_NV_PLT_DETECT","S=
PI_TPM_INT_L",
> +                               "CPU_JTAG_MUX_SELECT","THERM_BB_OVERT_L",
> +       /*R0-R7*/       "THERM_BB_WARN_L","SPI_BMC_FPGA_INT_L","CPU_BOOT_=
DONE",
> +                               "PMBUS_GNT_L","CHASSIS_PWR_BRK_L","PCIE_W=
AKE_L","PDB_THERM_OVERT_L",
> +                               "SHDN_REQ_L",
> +       /*S0-S7*/       "","","SYS_BMC_PWRBTN_R_N","FM_TPM_PRSNT_1_N",
> +                               "FM_BMC_DEBUG_SW_N","UID_LED_N","SYS_FAUL=
T_LED_N",
> +                               "RUN_POWER_FAULT_L",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "L2_RST_REQ_OUT_L","L0L1_RST_REQ_OUT_L","BMC_ID_B=
EEP_SEL_R1",
> +                               "BMC_I2C0_FPGA_ALERT_L","SMB_BMC_TMP_ALER=
T","PWR_LED_N",
> +                               "SYS_RST_OUT_L","IRQ_TPM_SPI_N",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","FM_DBP_CPU_PREQ_GF_N_R1","","","","","","",
> +       /*Y0-Y7*/       "","RST_BMC_SELF_HW_R1","FM_FLASH_LATCH_N_R1","",
> +                               "BMC_GPIOY4_R","BMC_GPIOY5_R","","",
> +       /*Z0-Z7*/       "","","","","","","BMC_GPIOZ6_R","BMC_GPIOZ7_R";
> +};
> +
> +&gpio1 {
> +       gpio-line-names =3D
> +       /*18A0-18A7*/   "","","","","","","","",
> +       /*18B0-18B7*/   "","","","","FM_BOARD_BMC_REV_ID0","FM_BOARD_BMC_=
REV_ID1",
> +                       "FM_BOARD_BMC_REV_ID2","",
> +       /*18C0-18C7*/   "","","SPI_BMC_BIOS_ROM_IRQ0_R_N","","","","","",
> +       /*18D0-18D7*/   "","","","","","","","",
> +       /*18E0-18E3*/   "FM_BMC_PROT_LS_EN","AC_PWR_BMC_BTN_R_N","","";
> +};
> +
> +/* Rainiera6 SoC SSIF */
> +&i2c1 {
> +       status =3D "okay";
> +
> +       ssif_bmc: ssif-bmc@10 {
> +               compatible =3D "ssif-bmc";
> +               reg =3D <0x10>;
> +               status =3D "okay";
> +       };
> +};
> +
> +/* MCIO 2A I2C */
> +&i2c2 {
> +       status =3D "okay";
> +};
> +
> +&i2c4 {
> +       multi-master;
> +       mctp-controller;
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +       mctp@10 {
> +               compatible =3D "mctp-i2c-controller";
> +               reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +       };
> +
> +       /* OCP NIC TEMP */
> +       temperature-sensor@1f {
> +               compatible =3D "ti,tmp421";
> +               reg =3D <0x1f>;
> +       };
> +
> +       /* OCP NIC FRU EEPROM */
> +       eeprom@50 {
> +               compatible =3D "atmel,24c64";
> +               reg =3D <0x50>;
> +       };
> +};
> +
> +&i2c5 {
> +       status =3D "okay";
> +
> +       gpio-expander@22 {
> +               compatible =3D "nxp,pca9535";
> +               reg =3D <0x22>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               gpio-line-names =3D
> +                       "JTAG_BMC_IOEXP_MUX_OE", "JTAG_BMC_MCIO_MUX_S1",
> +                       "JTAG_BMC_MCIO_MUX_S0", "JTAG_IOEXP_BMC_MUX_SEL",
> +                       "FM_USB_MUX_1_OE_N", "FM_USB_MUX_2_OE_N",
> +                       "PROGRAMN_CPLD", "",
> +                       "", "",
> +                       "", "",
> +                       "", "",
> +                       "", "";
> +       };
> +
> +       /* I2C MUX for MCIO 1A */
> +       i2c-mux@70 {
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x70>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c5mux0ch0: i2c@0 {
> +                       reg =3D <0>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               i2c5mux0ch1: i2c@1 {
> +                       reg =3D <1>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +       };
> +
> +       /* I2C MUX for MCIO 0A */
> +       i2c-mux@77 {
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x77>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c5mux1ch0: i2c@0 {
> +                       reg =3D <0>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               i2c5mux1ch1: i2c@1 {
> +                       reg =3D <1>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +       };
> +};
> +
> +&i2c6 {
> +       status =3D "okay";
> +
> +       /* I2C MUX for PWRPIC #13 ~ #16 */
> +       i2c-mux@77 {
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x77>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               i2c-mux-idle-disconnect;
> +
> +               /* PWRPIC #13 */
> +               i2c6mux0ch0: i2c@0 {
> +                       reg =3D <0>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               /* PWRPIC #14 */
> +               i2c6mux0ch1: i2c@1 {
> +                       reg =3D <1>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               /* PWRPIC #16 */
> +               i2c6mux0ch2: i2c@2 {
> +                       reg =3D <2>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               /* PWRPIC #15 */
> +               i2c6mux0ch3: i2c@3 {
> +                       reg =3D <3>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +       };
> +};
> +
> +&i2c7 {
> +       multi-master;
> +       status =3D "okay";
> +
> +       ipmb@10 {
> +               compatible =3D "ipmb-dev";
> +               reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
> +&i2c8 {
> +       status =3D "okay";
> +
> +       power-monitor@14 {
> +               compatible =3D "infineon,xdp710";
> +               reg =3D <0x14>;
> +       };
> +
> +       adc@1d {
> +               compatible =3D "ti,adc128d818";
> +               reg =3D <0x1d>;
> +               ti,mode =3D /bits/ 8 <1>;
> +       };
> +
> +       /* PDB IOEXP0 */
> +       pdb_io_expander0: gpio-expander@24 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x24>;
> +               interrupt-parent =3D <&sgpiom0>;
> +               interrupts =3D <92 IRQ_TYPE_LEVEL_LOW>;
> +               interrupt-controller;
> +               #interrupt-cells =3D <2>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               gpio-line-names =3D
> +                       "FM_P52V_AUX_FLT_N","FM_P12V_AUX_ALERT_N",
> +                       "FM_SLOT1_HSC_FAULT","FM_SLOT2_HSC_FAULT",
> +                       "FM_SLOT3_HSC_FAULT","FM_SLOT4_HSC_FAULT",
> +                       "FM_SLOT5_HSC_FAULT","FM_SLOT6_HSC_FAULT",
> +                       "PRSNT_FAN0","PRSNT_FAN1",
> +                       "PRSNT_FAN2","PRSNT_FAN3",
> +                       "","",
> +                       "","INT_SLOT";
> +       };
> +
> +       /* PDB IOEXP1 */
> +       gpio-expander@25 {
> +               compatible =3D "nxp,pca9555";
> +               reg =3D <0x25>;
> +               interrupt-parent =3D <&pdb_io_expander0>;
> +               interrupts =3D <15 IRQ_TYPE_LEVEL_LOW>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               gpio-line-names =3D
> +                       "SLOT1_CM_UPDATE","SLOT2_CM_UPDATE",
> +                       "SLOT3_CM_UPDATE","SLOT4_CM_UPDATE",
> +                       "SLOT5_CM_UPDATE","SLOT6_CM_UPDATE",
> +                       "","",
> +                       "","",
> +                       "","",
> +                       "","",
> +                       "","";
> +       };
> +
> +       power-sensor@40 {
> +               compatible =3D "ti,ina238";
> +               reg =3D <0x40>;
> +               shunt-resistor =3D <1000>;
> +       };
> +
> +       /* PADDLE BD IOEXP */
> +       gpio-expander@41 {
> +               compatible =3D "nxp,pca9536";
> +               reg =3D <0x41>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               gpio-line-names =3D
> +                       "HSC_OC_GPIO0", "HSC_OC_GPIO1",
> +                       "HSC_OC_GPIO2", "HSC_OC_GPIO3";
> +       };
> +
> +       power-sensor@42 {
> +               compatible =3D "ti,ina238";
> +               reg =3D <0x42>;
> +               shunt-resistor =3D <1000>;
> +       };
> +
> +       power-monitor@43 {
> +               compatible =3D "lltc,ltc4287";
> +               reg =3D <0x43>;
> +               shunt-resistor-micro-ohms =3D <100>;
> +       };
> +
> +       power-sensor@44 {
> +               compatible =3D "ti,ina238";
> +               reg =3D <0x44>;
> +               shunt-resistor =3D <1000>;
> +       };
> +
> +       power-sensor@45 {
> +               compatible =3D "ti,ina238";
> +               reg =3D <0x45>;
> +               shunt-resistor =3D <1000>;
> +       };
> +
> +       power-monitor@46 {
> +               compatible =3D "mps,mp5998";
> +               reg =3D <0x46>;
> +       };
> +
> +       power-monitor@47 {
> +               compatible =3D "ti,tps25990";
> +               reg =3D <0x47>;
> +               ti,rimon-micro-ohms =3D <430000000>;
> +       };
> +
> +       temperature-sensor@48 {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x48>;
> +       };
> +
> +       temperature-sensor@49 {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x49>;
> +       };
> +
> +       /* PDB FRU */
> +       eeprom@56 {
> +               compatible =3D "atmel,24c128";
> +               reg =3D <0x56>;
> +       };
> +
> +       /* Paddle BD FRU */
> +       eeprom@57 {
> +               compatible =3D "atmel,24c128";
> +               reg =3D <0x57>;
> +       };
> +
> +       power-monitor@58 {
> +               compatible =3D "renesas,isl28022";
> +               reg =3D <0x58>;
> +               shunt-resistor-micro-ohms =3D <10000>;
> +       };
> +
> +       power-monitor@59 {
> +               compatible =3D "renesas,isl28022";
> +               reg =3D <0x59>;
> +               shunt-resistor-micro-ohms =3D <10000>;
> +       };
> +
> +       power-monitor@5a {
> +               compatible =3D "renesas,isl28022";
> +               reg =3D <0x5a>;
> +               shunt-resistor-micro-ohms =3D <10000>;
> +       };
> +
> +       power-monitor@5b {
> +               compatible =3D "renesas,isl28022";
> +               reg =3D <0x5b>;
> +               shunt-resistor-micro-ohms =3D <10000>;
> +       };
> +
> +       psu@5c {
> +               compatible =3D "renesas,raa228006";
> +               reg =3D <0x5c>;
> +       };
> +
> +       fan-controller@5e{
> +               compatible =3D "maxim,max31790";
> +               reg =3D <0x5e>;
> +       };
> +
> +       /* I2C MUX for PWRPIC #1, #2, #11, #12 */
> +       i2c-mux@77 {
> +               compatible =3D "nxp,pca9546";
> +               reg =3D <0x77>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               i2c-mux-idle-disconnect;
> +
> +               /* PWRPIC #1 */
> +               i2c8mux0ch0: i2c@0 {
> +                       reg =3D <0>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               /* PWRPIC #2 */
> +               i2c8mux0ch1: i2c@1 {
> +                       reg =3D <1>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +
> +               /* PWRPIC #12 (Connector to CXL BD) */
> +               i2c8mux0ch2: i2c@2 {
> +                       reg =3D <2>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       i2c-mux@70 {
> +                               compatible =3D "nxp,pca9546";
> +                               reg =3D <0x70>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               i2c-mux-idle-disconnect;
> +                               i2c26mux0ch0: i2c@0 {
> +                                       reg =3D <0>;
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                               };
> +                               i2c26mux0ch1: i2c@1 {
> +                                       reg =3D <1>;
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                               };
> +                               i2c26mux0ch2: i2c@2 {
> +                                       reg =3D <2>;
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       /* CXL FRU */
> +                                       eeprom@50 {
> +                                               compatible =3D "atmel,24c=
64";
> +                                               reg =3D <0x50>;
> +                                       };
> +                               };
> +                               i2c26mux0ch3: i2c@3 {
> +                                       reg =3D <3>;
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                               };
> +                       };
> +               };
> +
> +               /* PWRPIC #11 */
> +               i2c8mux0ch3: i2c@3 {
> +                       reg =3D <3>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +               };
> +       };
> +};
> +
> +&i2c9 {
> +       status =3D "okay";
> +
> +       temperature-sensor@4b {
> +               compatible =3D "ti,tmp75";
> +               reg =3D <0x4b>;
> +       };
> +
> +       /* SCM FRU */
> +       eeprom@51 {
> +               compatible =3D "atmel,24c128";
> +               reg =3D <0x51>;
> +       };
> +
> +       /* BSM FRU */
> +       eeprom@56 {
> +               compatible =3D "atmel,24c64";
> +               reg =3D <0x56>;
> +       };
> +};
> +
> +/* MCIO 0A I2C */
> +&i2c10 {
> +       status =3D "okay";
> +};
> +
> +&i2c11 {
> +       status =3D "okay";
> +
> +       /* I2C11_IOEXP_3 */
> +       gpio-expander@20 {
> +               compatible =3D "nxp,pca9535";
> +               reg =3D <0x20>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               gpio-line-names =3D
> +                       "IRQ_INA230_FAN0_ALERT_N_CPLD", "IRQ_INA230_FAN1_=
ALERT_N_CPLD",
> +                       "IRQ_INA230_FAN2_ALERT_N_CPLD", "IRQ_INA230_FAN3_=
ALERT_N_CPLD",
> +                       "IRQ_INA230_P12V_DIMM_0_ALERT_N", "IRQ_INA230_P12=
V_DIMM_1_ALERT_N",
> +                       "IRQ_P3V3_E1S_0_FLT_N", "P12V_E1S_0_FAULT_R_N",
> +                       "IRQ_P3V3_E1S_1_FLT_N", "P12V_E1S_1_FAULT_R_N",
> +                       "IRQ_P3V3_NIC_FLT_N", "P12V_NIC_FAULT_R_N",
> +                       "SMB_SENSOR_ALERT_N", "FW_CPLD_RST_RTC_RST_R1",
> +                       "RTC_CLR", "RTC_U11_ALRT_N";
> +       };
> +
> +       /* I2C11_IOEXP_2 */
> +       gpio-expander@21 {
> +               compatible =3D "nxp,pca9535";
> +               reg =3D <0x21>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               gpio-line-names =3D
> +                       "FAN_0_PRESENT_CPLD", "FAN_1_PRESENT_CPLD",
> +                       "FAN_2_PRESENT_CPLD", "FAN_3_PRESENT_CPLD",
> +                       "FAN_FAIL_L_CPLD", "FULL_SPEED_N_R_CPLD",
> +                       "P12V_FAN0_PWRGD_CPLD", "P12V_FAN1_PWRGD_CPLD",
> +                       "P12V_FAN2_PWRGD_CPLD", "P12V_FAN3_PWRGD_CPLD",
> +                       "FM_P12V_FAN0_FLTB_N_CPLD", "FM_P12V_FAN1_FLTB_N_=
CPLD",
> +                       "FM_P12V_FAN2_FLTB_N_CPLD", "FM_P12V_FAN3_FLTB_N_=
CPLD",
> +                       "P12V_FAN_EN_R_CPLD", "";
> +       };
> +
> +       /* I2C11_IOEXP_1 */
> +       gpio-expander@27 {
> +               compatible =3D "nxp,pca9535";
> +               reg =3D <0x27>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +               gpio-line-names =3D
> +                       "PWRGD_P12V_SCM", "PWRGD_P5V_STBY",
> +                       "PWRGD_P3V3_STBY", "PWRGD_P1V8_STBY",
> +                       "PWRGD_P1V2_STBY", "PWRGD_P1V1_STBY",
> +                       "PWRGD_P1V0_STBY", "",
> +                       "", "",
> +                       "", "",
> +                       "", "",
> +                       "", "";
> +       };
> +
> +       power-sensor@40 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x40>;
> +               shunt-resistor =3D <1000>;
> +       };
> +
> +       power-sensor@41 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x41>;
> +               shunt-resistor =3D <1000>;
> +       };
> +
> +       power-sensor@42 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x42>;
> +               shunt-resistor =3D <2000>;
> +       };
> +
> +       power-sensor@43 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x43>;
> +               shunt-resistor =3D <2000>;
> +       };
> +
> +       power-sensor@44 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x44>;
> +               shunt-resistor =3D <2000>;
> +       };
> +
> +       power-sensor@45 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x45>;
> +               shunt-resistor =3D <2000>;
> +       };
> +
> +       adc@49 {
> +               compatible =3D "ti,ads7830";
> +               reg =3D <0x49>;
> +       };
> +
> +       adc@4a {
> +               compatible =3D "ti,ads7830";
> +               reg =3D <0x4a>;
> +       };
> +
> +       adc@4b {
> +               compatible =3D "ti,ads7830";
> +               reg =3D <0x4b>;
> +       };
> +       rtc@6f {
> +               compatible =3D "nuvoton,nct3018y";
> +               reg =3D <0x6f>;
> +               status =3D "okay";
> +       };
> +};
> +
> +/* MCIO 4A I2C */
> +&i2c12 {
> +       multi-master;
> +       mctp-controller;
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +       mctp@10 {
> +               compatible =3D "mctp-i2c-controller";
> +               reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +       };
> +};
> +
> +&i2c13 {
> +       status =3D "okay";
> +
> +       fan-controller@20 {
> +               compatible =3D "maxim,max31790";
> +               reg =3D <0x20>;
> +       };
> +
> +       power-sensor@40 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x40>;
> +               shunt-resistor =3D <2000>;
> +       };
> +
> +       power-sensor@41 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x41>;
> +               shunt-resistor =3D <2000>;
> +       };
> +
> +       power-sensor@44 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x44>;
> +               shunt-resistor =3D <2000>;
> +       };
> +
> +       power-sensor@45 {
> +               compatible =3D "ti,ina230";
> +               reg =3D <0x45>;
> +               shunt-resistor =3D <2000>;
> +       };
> +
> +       temperature-sensor@48 {
> +               compatible =3D "national,lm75b";
> +               reg =3D <0x48>;
> +       };
> +
> +       temperature-sensor@49 {
> +               compatible =3D "national,lm75b";
> +               reg =3D <0x49>;
> +       };
> +
> +       /* MB FRU */
> +       eeprom@51 {
> +               compatible =3D "atmel,24c128";
> +               reg =3D <0x51>;
> +       };
> +};
> +
> +/* PROT reserve */
> +&i2c14 {
> +       status =3D "okay";
> +};
> +
> +/* MCIO 3A I2C */
> +&i2c15 {
> +       status =3D "okay";
> +};
> +
> +&mac2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_ncsi3_default>;
> +       use-ncsi;
> +       status =3D "okay";
> +};
> +
> +&pinctrl {
> +       pinctrl_ncsi3_default: ncsi3_default {
> +               function =3D "RMII3";
> +               groups =3D "NCSI3";
> +       };
> +};
> +
> +&sgpiom0 {
> +       status =3D "okay";
> +       ngpios =3D <128>;
> +       bus-frequency =3D <2000000>;
> +       gpio-line-names =3D
> +       /*"input pin","output pin"*/
> +       "SOC_ERROR_N_CPLD","RST_SOC_SRST_N_CPLD",
> +       "SOC_ELASTOPCLK_N","SOC_BMC_READY_CPLD",
> +       "SOC_LINKSTOP_N","wIBB_BMC_SRST_OUT",
> +       "SOC_POST_COMPLETE_CPLD","I3C_MUX_SEL_DIMM_C0_024",
> +       "SOC_RESETREQ","I3C_MUX_SEL_DIMM_C0_135",
> +       "SOC_SYS_PWRDN_CPLD","I3C_MUX_SEL_DIMM_C1_024",
> +       "SOC_PORQ","I3C_MUX_SEL_DIMM_C1_135",
> +       "SOC_HOT_N_CPLD","BOOT_PWRDIS_CPLD",
> +       // IOB0-IOB7 bit8-15
> +       "PWRGD_V1P8_CPU","HDD0_PERST_N_CPLD",
> +       "PWRGD_V1P26_CPLD","HDD1_PERST_N_CPLD",
> +       "PWRGD_V1P2","MCIO_1A_PWRDIS_R",
> +       "","",
> +       "FM_CONFIG_ID","P3V_BAT_SCALED_EN",
> +       "wALL_POWER_OK","PERST_CEM0_N_CPLD",
> +       "wANDGATE_ALL_POWER_GD","PERST_CEM1_N_CPLD",
> +       "wAC_CYCLE_12V","PERST_PLD_TUSB7340_N",
> +       // IOC0-IOC7 bit16-23
> +       "wAC_CYCLE_54V","FM_USB_MUX_SEL_CPLD",
> +       "FM_PLD_CLKS_DEV_EN","SMB_BOOT_RST_N_CPLD",
> +       "PWRGD_P1V2_STBY","SMB_MCIO_0A_RST_R_N",
> +       "wIBB_BMC_SRST","RST_SMB_NIC_R_N",
> +       "PWRGD_P12V_E1S_0","FM_PPS_NIC_IN_BUF_OE_N_R",
> +       "PWRGD_P12V_E1S_1","FM_BUF_PPS_NIC_IN_EN_CPLD",
> +       "","FM_NIC_PPS_IN_OE_CPLD",
> +       "PWRGD_P12V_NIC","FM_PPS_NIC_IN_S0_CPLD",
> +       // IOD0-IOD7 bit24-31
> +       "wALL_POWER_OK_1","FM_NIC_PPS_IN_S1",
> +       "wALL_POWER_OK_2","FM_PPS_NIC_OUT_CPU_OE_N",
> +       "PWRGD_EAST_DIMM_CPLD","",
> +       "PWRGD_WEST_DIMM_CPLD","FM_BUF_PPS_NIC_OUT_EN_CPLD",
> +       "PWRGD_NIC_CPLD","",
> +       "","PMBUS_MUX_SEL_C0",
> +       "PHOENIX_PWRBTN_N_CPLD","PMBUS_MUX_SEL_C1",
> +       "IRQ_INA230_E1S_0_ALERT_N","",
> +       // IOE0-IOE7 bit32-39
> +       "IRQ_INA230_E1S_1_ALERT_N","PWR_ON_RST_TUSB7340_CPLD",
> +       "","RST_PCIE_BOOT_PERST_N_CPLD",
> +       "FM_NIC_WAKE_N_CPLD","RST_PCIE_CPLD_NIC_N_CPLD",
> +       "FM_TPM_CONN_PRSNT_N","RST_PCIE_MCIO_0A_PERST_N_CPLD",
> +       "HDD0_PRSNT_N_CPLD","RST_PCIE_MCIO_0B_PERST_N_CPLD",
> +       "IRQ_INA230_P12V_NIC_ALERT_N","RST_PCIE_MCIO_1A_PERST_N_CPLD",
> +       "IRQ_INA230_P12V_SCM_ALERT_N","RST_PCIE_MCIO_1A_SA_PERST_N_CPL",
> +       "IRQ_PMBUS_ALERT_PWR11_R_N","RST_PCIE_MCIO_1B_PERST_N_CPLD",
> +       // IOF0-IOF7 bit40-47
> +       "CHASSIS_LEAK_2A_R_N","RST_PCIE_MCIO_2A_PERST_N_CPLD",
> +       "CHASSIS_LEAK_3A_R_N","RST_PCIE_MCIO_2B_PERST_N_CPLD",
> +       "CHASSIS_LEAK_4A_R_N","RST_PCIE_MCIO_3A_PERST_N_CPLD",
> +       "OC_ALERT_PADDLE_R_N","RST_PCIE_MCIO_3B_PERST_N_CPLD",
> +       "OC_ALERT_PWR2_R_N","RST_PCIE_MCIO_4A_PERST_N_CPLD",
> +       "OC_ALERT_PWR11_R_N","RST_PCIE_MCIO_4B_PERST_N_CPLD",
> +       "FM_IOE_ALT_N","RST_PERST1_N_CPLD",
> +       "LEAK_DETECT_1_PWR14_R_N","RST_PERST2_N_CPLD",
> +       // IOG0-IOG7 bit48-55
> +       "LEAK_DETECT_2_PWR14_R_N","RST_PERST3_N_CPLD",
> +       "LEAK_DETECT_1_PWR15_R_N","RST_SMB_MUX_MCIO_0A_R_N",
> +       "LEAK_DETECT_2_PWR15_R_N","RST_SMB_MUX_MCIO_1A_R_N",
> +       "MCIO_0A_SMB_ALERT_N","RST_SOC_EXTWARMRESET_CPLD",
> +       "MCIO_1A_SMB_ALERT_N","RST_SOC_PORESET_N_BMC",
> +       "MCIO_2A_SMB_ALERT_N","RST_USB_HUB_R_N",
> +       "MCIO_2B_SMB_ALERT_N","SMB_MM7_MUX_RESET_N",
> +       "MCIO_3A_SMB_ALERT_N","SMB_MUX_RESET_N_CPLD",
> +       // IOH0-IOH7 bit56-63
> +       "MCIO_3B_SMB_ALERT_N","SOC_I2C_0_ALERT_CPLD",
> +       "MCIO_4A_SMB_ALERT_N","SOC_LINKSTOP_OUT_N",
> +       "MCIO_4B_SMB_ALERT_N","SPI_TPM_RST_R_N",
> +       "MCIO_1A_THERMTRIP_N","",
> +       "MCIO_2A_THERMTRIP_N","",
> +       "MCIO_3A_THERMTRIP_N","",
> +       "MCIO_4A_THERMTRIP_N_CPLD","",
> +       "UV_ALERT_PADDLE_R_N","wFM_USB_MUX_OE_N",
> +       // IOI0-IOI7 bit64-71
> +       "UV_ALERT_PWR2_R_N","wFM_USB_MUX_SEL",
> +       "UV_ALERT_PWR11_R_N","",
> +       "SOC_PMBUS_0_ALERT_R_CPLD","FM_BIOS_DEBUG_MODE_N",
> +       "HDD1_PRSNT_N_CPLD","",
> +       "","",
> +       "SOC_DRAM_0_HOT_N_CPLD","",
> +       "SOC_DRAM_1_HOT_N_CPLD","RST_PLTRST_PLD_B_N",
> +       "SOC_DRAM_2_HOT_N_CPLD","FM_TPM_MUX6_SEL",
> +       // IOJ0-IOJ7 bit72-79
> +       "SOC_DRAM_3_HOT_N_CPLD","CPLD_MUX6_EN_N",
> +       "IRQ_P3V3_NIC_FLT_MOS_N_CPLD","",
> +       "VRHOT_V0P75_PCIE_VDDQ_N","",
> +       "P12V_SCM_FAULT_R_N","",
> +       "SOC_I2C_1_ALERT_CPLD","",
> +       "","",
> +       "SOC_PLATHOT_N_CPLD","",
> +       "SOC_THRMTRIP_N_CPLD","",
> +       // IOK0-IOK7 bit80-87
> +       "VRHOT_VCPUC1_VCPUMC1_N","",
> +       "VRHOT_VSYSC0_VSOCC0_N","",
> +       "VRHOT_VSYSC1_VSOCC1_N","",
> +       "VRHOT_VCPUC0_VCPUMC0_N","",
> +       "","",
> +       "INT_IOEXP_N","",
> +       "RSVD_IOEXP_0A_SB1_R","",
> +       "RSVD_IOEXP_0A_SB2_R","",
> +       // IOL0-IOL7 bit88-95
> +       "IRQ_PMBUS_PWR2_ALERT_R_N","",
> +       "FM_BORD_REV_ID0","",
> +       "FM_BORD_REV_ID1","",
> +       "FM_BORD_REV_ID2","",
> +       "FM_VR_TYPE_0","",
> +       "FM_VR_TYPE_1","",
> +       "","",
> +       "MCIO_0B_SMB_ALERT_N","",
> +       // IOM0-IOM7 bit96-103
> +       "MCIO_1B_SMB_ALERT_N","",
> +       "PRSNT_BOOT_N","",
> +       "PRSNT_MCIO_1A_N","",
> +       "wPRSNT_NIC_N","",
> +       "","",
> +       "SOC_TEST_MODE0","",
> +       "PWRGD_V0P75_PCIE","",
> +       "PWRGD_VDDQ","",
> +       // ION0-ION7 bit104-111
> +       "PWRGD_VCPUC0","",
> +       "PWRGD_VCPUMC0","",
> +       "PWRGD_VCPUMC1","",
> +       "PWRGD_VCPUC1","",
> +       "PWRGD_VSYSC0","",
> +       "PWRGD_VSOCC0","",
> +       "PWRGD_VSYSC1","",
> +       "PWRGD_VSOCC1","",
> +       // IOO0-IOO7 bit112-119
> +       "SOC_PMBUS_1_ALERT_R_CPLD","",
> +       "SOC_GPIO_15","",
> +       "C0_POSTCODE_0_CPLD","",
> +       "C0_POSTCODE_1_CPLD","",
> +       "C0_POSTCODE_2_CPLD","",
> +       "C0_POSTCODE_3_CPLD","",
> +       "C0_POSTCODE_4_CPLD","",
> +       "C1_POSTCODE_0_CPLD","",
> +       // IOP0-IOP7 bit 120-127
> +       "C1_POSTCODE_1_CPLD","",
> +       "C1_POSTCODE_2_CPLD","",
> +       "C1_POSTCODE_3_CPLD","",
> +       "C1_POSTCODE_4_CPLD","",
> +       "","",
> +       "SOC_GPIO_17","",
> +       "SOC_GPIO_18","",
> +       "SOC_GPIO_37","";
> +};
> +
> +/* BIOS Flash */
> +&spi2 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_spi2_default>;
> +       status =3D "okay";
> +
> +       flash@0 {
> +               m25p,fast-read;
> +               label =3D "pnor";
> +               spi-max-frequency =3D <12000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +               status =3D "okay";
> +       };
> +};
> +
> +&uart1 {
> +       status =3D "okay";
> +};
> +
> +&uart2 {
> +       status =3D "okay";
> +};
> +
> +/* SOL */
> +&uart3 {
> +       status =3D "okay";
> +};
> +
> +&uart4 {
> +       status =3D "okay";
> +};
> +
> +/* BMC Console */
> +&uart5 {
> +       status =3D "okay";
> +};
> +
> +&wdt1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_wdtrst1_default>;
> +       aspeed,reset-type =3D "soc";
> +       aspeed,external-signal;
> +       aspeed,ext-push-pull;
> +       aspeed,ext-active-high;
> +       aspeed,ext-pulse-duration =3D <256>;
> +       status =3D "okay";
> +};
> --
> 2.25.1
>=20



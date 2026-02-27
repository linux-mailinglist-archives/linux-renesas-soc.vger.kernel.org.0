Return-Path: <linux-renesas-soc+bounces-28575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAh5DjC9oWmswAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:50:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A22811BA46C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A57A231374C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298B643E9CC;
	Fri, 27 Feb 2026 15:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mYL0PoVz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3DD43E487;
	Fri, 27 Feb 2026 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206910; cv=fail; b=LeIfHXR8iXeH5cR0zTuyvGgKGdsiGIKcsZZ6WCmjYW/QYTGz+Im8ezMgN8c/zaZtqVpYkET0dat7UcdkYn8YuHcVNM8ZXcGyO0me+pc4yG1yUm15508yG6WAPfWwaqrezOOCcdB+xe4ETtzpNyuE0Z21+fmiFoE77wossLzLmZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206910; c=relaxed/simple;
	bh=SdfW0GRvtIgKN0lXnKwe/XVERDKzmGZNPNjaQuCjPtA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FVv63dQy/SpnRNy0OoKep8LAQOtgNQu1KPOZRMx2r4qqNH4CwhjjOe5eP9zl2FEJEZF+vVOe7A7WqeP7Bs1EZjXO2FTjACjYwyN7Vkdg/UA8BUf+7bnp2FM4tmbpEwlZI9RfG3PqSDM4JdEQejIHSM1HTHJySbTMjZ0rN8Lf+9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mYL0PoVz; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls9i4IOMCmrkysyWv1JrytTYjD5Sh3H726bmi+Ewnh8YX0awORm2OJWl1sawuUn7jC2aJZ/37sQLnQnLlGY1oE8+jBP08yIu2JWY7/SpE/eZ9LTIUUAdPR3PHVuQLsnWtbehhqRorlMQIBdX77t00Dc8S89oQheWlUsuO3Ra2jB9vvru9xTiEGMPT59FW5PvaLPCilqwL2AZJfFVs2N86lTOYcBQuOgYOmmquWnoz0stdweqKi74rkKbJbDzyWRg5dhwkjQdxIvVcX6r2kC0swoXH9oaxBqKDFkSOPErirIfHJgNLiGjjfEjL874JRhqdiskZ6i7iJ2CxCMsfis1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHckkYWGeO9lwCJpFN0r7RB69gmA7IFHuiW/sjJEP54=;
 b=k+hkYWDEU54lIlG+SVtLpwZc/JWnK2jkcyBoPl8VYkn0XnprFmlEwz1a6zqytvY53HEa1RTmvdOawIXkz/GxzTyRFDKI45Bh2a/oPIel1P6bVS6HTO8uOtyxAiTK8zWVrE1uLyGpFX+f/MOI7azvUo45dInn64Y1OJh1aJL0obQPyjzPOplhzSR2jDV8gaH5yZtDMreqbuE4x/NgIBJ1gpmouyiOjkrfkfQ1IKCuouLe1ofMU+nuCAzCZIbRGITP3D4J1O++E1tnweXxqJNQmpX0ZazYAqlRGha5gAACPAlcsZltZjw5e619C/s3lKxAhVKygYBCShnrknngP6XEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHckkYWGeO9lwCJpFN0r7RB69gmA7IFHuiW/sjJEP54=;
 b=mYL0PoVzsPBKnvnhEaEK9CUaGqzUdEdeoCrQKQnhYcWTa8fS9gUTwj8prkAykbM3nJPGsCL5yfpLOO/r6vg3JLA+aTtLMsyjlAqrAjO1wlZTZUM95+sAsOk7Yuz6olsoy/JerHM7QizzhJye/1aF0yMA3FgY/jIjO3wHbhVti5g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14524.jpnprd01.prod.outlook.com (2603:1096:405:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 15:41:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:41:43 +0000
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
Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Thread-Topic: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Thread-Index: AQHcp/6Mgy22Z/aR3kizuyWQZDnsmrWWrjEA
Date: Fri, 27 Feb 2026 15:41:43 +0000
Message-ID:
 <TY3PR01MB11346B9FB9B0FE7BA3B82D6378673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14524:EE_
x-ms-office365-filtering-correlation-id: b7b85447-9cbe-496a-4e8b-08de7616b529
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 931veSIc37A4cP3oWwCOVTN5tR15IZvcrmPiE9RlpxRYlUVWN8j6bvGYiqutMaBxWLYn8kOeU33Or7TCMTWrDF2xoZuEnw0TTKrQi8uFigPUS+WLZrGBSipRskATnbRaLnHg9pAi2LfIsYwcWLod2wUTUmVDoRtvv7eD767rQdjOgmaHQiIcI7iywney0pQr+y83q+j4FnkYhYkf2Oq/0vzcmu6lbWOjpaJeVPRE08sxtnpMUsPjZe1355AXc9oPl59mo5O9xBx2LBR0DlxtmPNgjqK4FZGZ+vG5veHkSMG3YCVN9fKzlXmaWHY8fbtSldSGJoamUmAA3BlP5YWtXob3lrlSanmfX1o0irpsf+TTcFp17GG11351oMmbVtSMybg1r0IP7uM0ASQ+xTgn3O6NJ9tlRt+2iVPVpVC3fX6i2YYf4CTvtKGelLAcQiWFxGhmUgR4Iia7BkXqk6ytf1MCgKFqOU579LfwNU4E3kpc7mxUycnsVSgbbM6N75sl5sVal4L4Emwmyu3+1zEe7gz5mz91fnVXtvkVvTyW5lbJvyyVV7+YzNTXGNQ20V8k9Lrwewu+Sj9BYm8tGhv63iX1/fvE1yZxt9F/4Z218I3em25A5jJTaK/ItaEDv4nbKc99d7kA3dB5vlx5ybmrzA3NHp0Tu+mR7HTFjGvVGklF52yCdjF2ZH2ljyc/kjViG5PTV/2l3YGgNaPHGhf7um1o/+egftmcUX+DHWMz3RvfPPlSZkMMTc5l9g1T3oDvEyh29Wl8FSB2Cnf67w8u0+JpdEnaNQMq7D48tpEmPwA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Oc49UxbwXQO5kZir5jC3KKaJEFZ4SpgdWZ6xn080bguAPGlSR+0tRYazZtCN?=
 =?us-ascii?Q?9RIMJetJgrfpOBQ18HFbZpal6N1q6h4q9fUngPMf6WBGahRXMs8AID9Bre4W?=
 =?us-ascii?Q?oxaApTkdh4WngTMjQMVYPD2jy+eqY7XMqFFfdddCQCLKotIrD9pnFU5tFV7n?=
 =?us-ascii?Q?PJAkg5nJjpUoJa+N1AVpP/7mwbQMnwK9Gohq4lL8qyfOJo/hDMbsaQ3jFubY?=
 =?us-ascii?Q?ikiyoYMoDtvEYB4qMkNFpKlblA13Wq8+93MZjdIGTMtk0pmGPwpXuJ1VKdKw?=
 =?us-ascii?Q?YQfXsLAggIfAzPJ4a73AphVooMIUr2iWZQ0t3w2dDQCt3IJ+2JK8o9ATyZfc?=
 =?us-ascii?Q?GuIqu/OvO6iN6aPf76WYxjkxprlGwT7GSpfr8m0svGNQSSo8MiaEcOOWgPXl?=
 =?us-ascii?Q?nZhRoH8EnrUg1llI/Rv0oqrQVNIY8BaOwGPN0/vOQWhwF7iXs0PwGrQvZ8iS?=
 =?us-ascii?Q?YLHhoXeDmZmU3wdQXB/tizPsR7VB+rGEZ9+p1yTgtQD3ygi+awDjcIVlyLu1?=
 =?us-ascii?Q?/940AFn4c7jl7i17nrKBqcOveGGwI3vlZfRwpbw8EpQZqX+uRg3h0niIgtm+?=
 =?us-ascii?Q?UwwRvHIUYlLAUi4B6Dcq8sPHZ0Ed/NdshFac/gS5GjXNZ6MVH9OC3HP1iiNe?=
 =?us-ascii?Q?gH8XkLV+piVVjiU9Hc5nkU9HIvO4mHTunXLM+Pras1U+gF/bx6CYn1MGbphx?=
 =?us-ascii?Q?kizhHiMYjZ3t3SW/57Kfi7OSoL2EMgod98UGNWnUNl2ZCOGLigX0Q4IZbGAN?=
 =?us-ascii?Q?yRyP8Bw+nGQ2ALnPbfXFz85uJARjAOqyVvq09PAbxAy1dmPnUHhmymfZtbAQ?=
 =?us-ascii?Q?62klc1QIQ73eryYQ6lLUv+GhPyqJkJkQL3whFhm04DlIz50TY3KsT4kj5a36?=
 =?us-ascii?Q?v56ExhsfIix+71sMsNGS8mrdUjgsQOQwn2+it7Fb2evWum4S5nYUP713hCRW?=
 =?us-ascii?Q?1an+HehT8GBLaro02SRsMzFqrHz6HCXa7Lepds04RCPrfMXLENs9SRdchIM9?=
 =?us-ascii?Q?OkevdD1n9JucMYzSrmN4i97VKelEZ+1GQJ3KQBj4LVF6Hrn0l+qYNrKm61EX?=
 =?us-ascii?Q?B2uwNNtP5C1obh45DFcgB3afxFahSmPtsvfKSrIvHln2lECGrCOyGSUeD9Ra?=
 =?us-ascii?Q?DvSBtvSOhNvuetIadyVEOXI+badnx94zacCsPberM0h1ON5ARyngFYycHkv9?=
 =?us-ascii?Q?Yv5VvlKQ5PK+QS1K15mRHouKfGlYHQQAh4BZ6OAwB9q65aRq/DCl5qMsnBZn?=
 =?us-ascii?Q?S27SMhnWn9V3xLFVu4alnZA9EV7aWWj0kfdMaaL/niIU0zkuOLStEp7qfLvA?=
 =?us-ascii?Q?KTRTWibjivjo8t2AHQKgj+C0AFFK4mmMKFzFKEiwUTQ8dedQxPqJ+6wRRv/L?=
 =?us-ascii?Q?yilpEO0odmni/pgMtNplOXqm0yRaREt1P7oY78W5d2EvIeu+ho6pbepthOzv?=
 =?us-ascii?Q?j4x/gO4PlG5IR5EgXkIEJPB6phnGbWD2fXmpdPbx5WVQSZ/XUOPQKSg7dXXD?=
 =?us-ascii?Q?nAWHQHz78gMbr+2H3yniMxaHyvwSSyQv0wXGHKzP8mRUN+CIokl8iuzgGZ1g?=
 =?us-ascii?Q?Ah6wKlfsAraMHdkBz6Y4+blKdHkJ7VrVER3FIcs03vyD8X0zgTSb1Xof3zXg?=
 =?us-ascii?Q?MIkehVMezv8ZrmOu2LMrebXSzd2yuVaDRxx0URlDdaPHfJot3lIRlarz5gg8?=
 =?us-ascii?Q?vj0pDDcnj24sDYcSmLfiVx1KObCAdb1/JG/bCp7BzDMqC5DEfVH6jRFQVhEz?=
 =?us-ascii?Q?RTjO93YuQg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b85447-9cbe-496a-4e8b-08de7616b529
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 15:41:43.3609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2qIPgo2JK8gIJO4dUP2eiWbFFWJFAhZ4cRxxSXsY7/2vZAUThdMLmhFGDFW85fELekzUB0KHC8MiYZF2PtofXV1S7LByLzl1JFujrYVrAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14524
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28575-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: A22811BA46C
X-Rspamd-Action: no action

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 27 February 2026 15:33
> Subject: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe co=
ntroller
>=20
> Add support for the PCIe controller found in RZ/G3E SoCs to the existing =
RZ/G3S PCIe host driver. The
> RZ/G3E PCIe controller is similar to the RZ/G3S's, with the following key=
 differences:
>=20
>  - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
>  - Uses a different reset control mechanism via AXI registers instead
>    of the Linux reset framework
>  - Requires specific SYSC configuration for link state control and
>    Root Complex mode selection
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Changes:
>=20
> v7:
>  - Renamed RZG3E_PCI_RESET* defines to RZG3S_PCI_RESET* as these
>    registers are shared with upcoming SoCs (RZ/V2H, RZ/T2N, RZ/N2H),
>    dropped associated "RZ/G3E specific registers" comment
>  - Dropped "RZ/G3E SoC-specific config implementations" comment
>  - Unified function naming to rzg3e_pcie_config_{pre_init,post_init,
>    deinit}() and rzg3s_pcie_config_{post_init,deinit}()
>  - Simplified comments as per Claudiu's suggestions
>  - Used local mask variables for compactness within 80-char limit
>  - Fixed L1_ALLOW error path: goto config_deinit_and_refclk since
>    port refclk is already enabled
>  - Fixed resume: reordered MODE before RST_RSM_B to match probe
>    sequence, fixing error path handling
>=20
> v6:
>   - Use rzg3s_sysc_config_func() with per-function calls instead of
>     rzg3s_sysc_config() with -1 skip pattern, as suggested by Claudiu
>   - Extend enum rzg3s_sysc_func_id with L1_ALLOW and MODE entries
>   - Use regmap_update_bits() consistently for all SYSC accesses
>   - Shorten comment to "Put controller in RC mode and de-assert RST_RSM_B=
."
>   - Drop "Enable ASPM L1 transition" comment (function ID is self-documen=
ting)
>=20
> v5:
>   - Introduce rzg3s_sysc_config() helper for sys configuration
>=20
> v4: No changes
> v3: No changes
>=20
>  drivers/pci/controller/pcie-rzg3s-host.c | 90 ++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index 44ce056d62c6..b7f92f5aee4a 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -111,6 +111,15 @@
>  #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
>  #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
>=20
> +#define RZG3S_PCI_RESET				0x310=20

If there is any new version of the series, please put a comment

+#define RZG3S_PCI_RESET				0x310 # Only for RZ/G3E

Cheers,
Biju


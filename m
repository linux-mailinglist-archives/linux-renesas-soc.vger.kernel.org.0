Return-Path: <linux-renesas-soc+bounces-30700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gnMDBYFlzWmMdAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 20:35:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFBE37F501
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 20:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C97683001871
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 18:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DA531985D;
	Wed,  1 Apr 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CaviN60M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669338F934;
	Wed,  1 Apr 2026 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068172; cv=fail; b=YhHd0oUgLU52ffcrAnenvjSSoku6alnuwBWJny3bx7qYkjPjdS/EHBlTYOybkMWRCP3IcKx/EIuk3fgDBUJ0gKbgYj+tRvsHdyq6ytWxOWdpO0MFEWAKEZ1APehSKV33BNicozZcsxB/ULBuuGHo+CT7HcLlLyXn+Eb0otD7GqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068172; c=relaxed/simple;
	bh=NZ5dPpi3UtqPbT8tT7tzy6ubHYWTACu0MHZy+EKqVpE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mzh2honLkDJOJ0y8OaWs03T+fHzR+dpSou6WPyjIBvL2W5OqglXpu8RWTwcdh4VUo+QrgcZDdwJfwwOwJ+6mk6b20QTtYeEv+lyQY22g6JrU4YXYMgIgzP/RMm8MiDrXkeRLWwxXEtt1MeaH6zjIS3fExqs1FlhLTw/JVD1Psho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CaviN60M; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsiM7+2lKjKULnhpX2yy/8uTS2LUMtihwn16R+vzqPu+uwiOLcvC43s6z+Sp2oCtWWkgpzRJnEzzcKUzoPNJ5iYnzlG7UHs9XXXxZxqOQpXbWMbADWtFJl7mXxgxxgDX/lcEi0dSEuu9+MLauIddofp3PUYb6hmtse0aorVurTZ14d47DwRCXaP8g/NDjVdhvG/GufPzt7Xa/iG7w2N9DWxYAX2VvNjQowkCtUt6/+AhhJqh+d3Cmz4yDJ+foNmz1B2cgIXYRarKQJTUXqlEHficr1qkfNFbHJvldJMLtrl0s/HFwLNFPCVOPk5qBUrPq82uLm8T595Pnjrk6R2HFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoVTF3kOA/zS4nG+xLJycQq7pwcXlk1wWKu0a/Yp+Us=;
 b=qxnbn96RBueNbDEaB0T1hcPpB+6aHQjyBwbenmK2r23123AosMoRUGZ0xe+bgl2bQ5tuz/9KplMvHulgJYLuJy0S0C+OZzvSwoTomxLF8bblxu24BCBUt1EpLfeCzrzhTvHTzdWDE00iLuHKPvVhpEw1OSxw32qAZe338pgSCcnaXHUXO6Vza6X4gaJuZgcGQ3DZe2d+8patvIrJt7Pb6jqMj29j6BhZJaTQiBb9J/pts9HoT3uAttFJ4GAVprER31DVGaVrjyHGyPXAqmEz318FBc3kz4R/ZE+KXMm3y7G40tSyD4sVVrsUvBjbK0DXPV8WjbOWKlk5apuQX10ojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoVTF3kOA/zS4nG+xLJycQq7pwcXlk1wWKu0a/Yp+Us=;
 b=CaviN60M/f73y4NdCYB91aN8cAXMsldM+pQ+zEkakBVv7QumqpTNH+/09hUOaXdN17VDq4SVDvdtOavPyVaR/tN3e313+yORnKnSBIFbUdGmbrInev8TYbn1wBu8zWL+PQ1s/VDyqT2TjBZ82RpKVbtWAXjOqR3LB20aP4aCyd4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12984.jpnprd01.prod.outlook.com (2603:1096:405:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 18:29:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 18:29:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "john.madieu@gmail.org"
	<john.madieu@gmail.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Madieu
	<john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH] PCI: rzg3s-host: Treat link-down as -ENODEV instead of
 error
Thread-Topic: [PATCH] PCI: rzg3s-host: Treat link-down as -ENODEV instead of
 error
Thread-Index: AQHcweZBux1sLiRDzkaoKwze9+QwXLXKhacg
Date: Wed, 1 Apr 2026 18:29:25 +0000
Message-ID:
 <TY3PR01MB1134689F2B702CCDF52AFDD808650A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260401143347.8463-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260401143347.8463-1-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12984:EE_
x-ms-office365-filtering-correlation-id: 8c4fbc0d-720e-4b1f-46a2-08de901c9a3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 gX1n0BjgD+qmEeTX8KV4aoW8oRnDj7CKwki2ikg7vWZR+GKhLaE6uclpZhgmZuEh1HSRgwFQECnaM3n06KeD9W53dJBkHjUdLtr6kepw2wfhJ6yq3Edt15//SQIJP4/5xMpS+Igi4YMoYLsvSFrqHJyWG+PyoHXSeN9VeGNhlMkZu8PQAziJW+2L5zidDqdKVhuIg8IiakLG88AS7IGwnct+4r8+uOLp30x6W1q/teU5BRzxbyMEE3KdkVOlQhAVMnvmMQK7fhFCGGWlMy4NDHbrm6h6YAkcVo6puEKOpbcaM+nQoTlF73QHBuuHwwcWANzqeqJwg4t5zA21h5/xknwY0cvUuelfRt2oY5Q6FeKECXi1nsCSpTWqzc6rhbh+o6HNLBE6Vr0jXUZdBr4eKC+bGk9aCKAnSK8OV61cWPO3zU4qFbL2cWD96+sWKvhoKSkUiptuW+x5pnd42G2bhplVT+XlenGFibQZDc0SP7xv3rhEW6Dn2TqVadhqTXkeZWSfc7S1L0uN6HS2TAoRkWi/mWmKFk+M/DOmsy5iuVPRbaMdJzDdaWJLlfvKEtsdnDldN8DcNP/t/ccMUX9+y8B3ZfC0HYwqsuIELxIpf5ffZTnUYClXE1NttAVIBXlHohQb1T4/dORud5KzEgpfOsHYxiRFfkAU3nWHsrGH/pj0WGgqWT/qheMdLf9a9TQGtzQn812Rf39VavIY301qJ2/c7JoSvFAOsA5lg3t3RbDG5fbKMA7nn5YNvFuOPIFXbeAxoo8davy1Woxg5KyKQ5tsVDgs55WqA3cA5NRGFFw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DGbVEbg1PRQjfPdCwHVJgbaKcoDMWIvZ6pm6EZgdWe8AUJffXjndXMbzDOup?=
 =?us-ascii?Q?Nka1u7B5/RMTdDt+yGLYVeewzjo+aUW22VOKu9jrydZY71xpWkRuKyTF37HN?=
 =?us-ascii?Q?m6odPjl88ezEf4v44W6fz3WSPzC6gNEGP5HKdovrcdYbRl408k+38M2Pt8O7?=
 =?us-ascii?Q?9N1DwVPTTDJMo3We1JvT2v9UQMDv1nDs5Zx5wq4NCleimMVPbvJAdHzlr3HD?=
 =?us-ascii?Q?bcAcDLAC5bkDAX6V4zZ99ji0uX3krU62MmqJOTCU11tF2uSz02Fc8q45LW47?=
 =?us-ascii?Q?g16rvin+sgAhSj+AzUJ7ZJfFHD7pJUQmBI0zjWwQ5PcE8nuJRGw8yHK+jDA0?=
 =?us-ascii?Q?rsb78MJzIExDt0Ny1xuIplDoT9NK/AXSjAEavRjUvewJfgnaT2EBxLNHdgKy?=
 =?us-ascii?Q?YgTYHYWopG7k7GcIzEuMyZSe7d4fZBlT56Xad5tZLO6to1YEyYt+6GuRnpmo?=
 =?us-ascii?Q?VYo9eMTuDn/V+IRuTgfpTbMwVuMiF9BoNByANivXn7GYD2+2mMZGyKDqQ9YQ?=
 =?us-ascii?Q?RQYIEAvq/dLDkwePdxB1qHiali9GikUAMU4GGrvQK9QDzehB2Ru8yf6C3TcB?=
 =?us-ascii?Q?SMt3AaVrtkHbgfhJ+Vu2TkarEplJKJo17U1QbJmTI5eq9NoQXZexszvz/3RK?=
 =?us-ascii?Q?FdljOLyRM4Du9uXF7vabJ+aYHg4Lo13hB5gLIii6/Djq0XCfAI+SHZPvHfzx?=
 =?us-ascii?Q?0Sukg789ORW9F7Z1IZdQ+FvqfIx5E2DQT/e30+vMutV4McdOYH7i6GDT3WlS?=
 =?us-ascii?Q?gOc/pF2ZCFBSoIBXJ5QcP2vJlNa6R+wz9o5GCZEaBjMp1zy5XndLHusggTDK?=
 =?us-ascii?Q?fNqJBX7bwotFahSOeyb3/3OrTb7opUPVC1Tdit2r06SV/cwGGKL/QMDPn+yK?=
 =?us-ascii?Q?5Uyln1Amtr25dD8FimnqZbZHTc8LQb0vtq1Je9x6VcsmanCzBWUv+kheEOWA?=
 =?us-ascii?Q?EJJK1cv5mEiJODZW4M1Z1WMvp5MpA+P/GoJ6MEeoPK2yyDbkv9Dt75L3j8wV?=
 =?us-ascii?Q?uDfkCHAOIO1fZWXsnBZJQBtcuOnLHFXNzxmPOUsKTQ21eN/UixX/VU5hOlt/?=
 =?us-ascii?Q?tHDTQCnlmV7ThEL3Jx3LrDd9WWWJQp6wJSww+Neuim256MrRh44SNupaql38?=
 =?us-ascii?Q?B30+K58KxK52Iu0yqyaWHfP92BVjIlylgWWh8RlpAq7I2QBuLtIoryflvUWW?=
 =?us-ascii?Q?zE31HBGvEy8gmhsy73GfK+GLOuQ/GBXNh06nhNBNBiRCnNUg3ibxOX3d9zm/?=
 =?us-ascii?Q?kLvh8HfmZEHazb60UbkE4d41GZStg6MjeyXUkEkBl8CHrQepqZzAxiNPvf1x?=
 =?us-ascii?Q?miMjrw8MaLU5YNKi41gGdsyeHwT4npTeGRsB7F3LIEMQsL4Jn7PlJykX3bsx?=
 =?us-ascii?Q?QFFHek0Wc8ULszqre97c3BYev7fGocAp/lGoUocY4l/bbibQUjK86UYcEIPX?=
 =?us-ascii?Q?kcu8xqdsPf+3p2MU5c288QT17HIvMsZDtsVqLE1QolClO6WNhXj1Kmi9ZH4p?=
 =?us-ascii?Q?qQSPojDvwfkuaFXiymFKtzaGUMU2oIBr8+lDuTBD9xsFRRRuvwNRExwAbsSK?=
 =?us-ascii?Q?iFE/BfDV81KyxfBojTSA2rHgu1214vkTM/PWaCepkdynRy7wkANWbvIpeju+?=
 =?us-ascii?Q?Zca5fSpurFAi9sarRii/UASRYdc0xD+cZSwVMgsKet54aaeJH3bi5LsIiPdL?=
 =?us-ascii?Q?73Yxi+KM94rdoa7kl0p9V14Fp8AvTp9b7M7WDBsmmLdUVBx4ntzP8R8WtAb2?=
 =?us-ascii?Q?smazYgN8gw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4fbc0d-720e-4b1f-46a2-08de901c9a3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 18:29:25.3795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zBjnqskwd7BybyWPXwvwtFiaiUPQpJe5M9xFUjY8mMJFs2VI7aheE/PdNjYWsgnbnzazhAB9/62m0WzdviPl3ZDrBQYjd5J29EKxK1td8k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12984
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30700-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 4DFBE37F501
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 01 April 2026 15:34
> Subject: [PATCH] PCI: rzg3s-host: Treat link-down as -ENODEV instead of e=
rror
>=20
> rzg3s_pcie_host_init() failing to establish a PCIe link does not necessar=
ily indicate a hardware or
> driver error; it may simply mean no card is inserted. Demote the message =
from dev_err_probe() to
> dev_info() and return -ENODEV so the driver defers gracefully rather than=
 printing a spurious error.

Good catch. I am seeing the below error when the Pcie cards not inserted.

    2.424257] rzg3s-pcie-host 13400000.pcie: error -ETIMEDOUT: Failed to in=
itialize the HW!
  [    2.432695] rzg3s-pcie-host 13400000.pcie: probe with driver rzg3s-pci=
e-host failed with error -110

>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  drivers/pci/controller/pcie-rzg3s-host.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index bfc210e696ed..03be10aa5b54 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1653,9 +1653,10 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host=
,
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to init IRQ domain\n");
>=20
> -	ret =3D rzg3s_pcie_host_init(host);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "Failed to initialize the HW!\n");
> +	/* Failure to get a link might just be that no cards are inserted */
> +	if (rzg3s_pcie_host_init(host)) {
> +		dev_info(dev, "PCIe link down!\n");
> +		ret =3D -ENODEV;
>  		goto teardown_irqdomain;
>  	}

Based on the error,

    2.424257] rzg3s-pcie-host 13400000.pcie: error -ETIMEDOUT: Failed to in=
itialize the HW!

	/* Wait for link up */
	ret =3D readl_poll_timeout(host->axi + RZG3S_PCI_PCSTAT1, val,
				 !(val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS),
				 PCIE_LINK_WAIT_SLEEP_MS * MILLI,
				 PCIE_LINK_WAIT_SLEEP_MS * MILLI *
				 PCIE_LINK_WAIT_MAX_RETRIES);
	if (ret)
		goto cfg_resets_deassert;

We need to capture this error for link up/down.

Cheers,
Biju

>=20
> --
> 2.25.1
>=20



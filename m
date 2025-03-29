Return-Path: <linux-renesas-soc+bounces-15041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831E4A754D9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 08:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22B143AF41E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 07:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AB9487BE;
	Sat, 29 Mar 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gAsHjNAG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A903A189B80;
	Sat, 29 Mar 2025 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743234607; cv=fail; b=cRvDIrcnYNeCKjjQiQJDm04K+UDm1E392Le7xLA6YEm5Ey6/N64k5MomvEG2TLDADUkj0gbw67LX5sVW04pU2So/0gxIIZKbCINfrUyqwtvoB6dZdGY94+dP4qIK1NtlNK4rmi6Bcvs4uaU+K6n8iumLl5J5Wd93YKiMg9vLlKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743234607; c=relaxed/simple;
	bh=J+DEi+uJczgiHNQ6vnoIuT+td7OzEf9fFv95oNxDjFU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HSTfhy/6vZNfx2YIBfwwTDtEUgaQi/6iLh0ayrcffNZWQEOBfWQFpbXJYPGyEQSyOFzLH+PJ810+dW+mMipUHd/WUnPNdI0Rkn4py+iq6gTWcC+/G1xUFnHK/EfqheXWBITaZYiuC1p2pZ5fDpfpvPs8ChwQchIJACCl5d8gLVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gAsHjNAG; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/+sMAh37wwfM8QPyeyMU69rbEvuM6PwvGfcVis/HUsfXsLMVqh0MTRtt8I03C5h8MPsnIhQzqmT3sZl6PW+tJ6XxdHOBRq0epKpakKfJOa7rfur8r6jK2nZGy1nO310qeYNTxaj+JRrQHjwUhs+vY0lZga3j7rDkJwGFyMU2jZbwHplRfo2ixSVT/j/uzBOHgn7GGPDS/5an7H89r1TGiFWA9ElV6AGHBwACjV97Cqi+9Y8qFo7Yt5iXk55xO7uoAWc77/0TXhmSCsWONaXc2kFhsvLj5sbniEg2WxhfRs8/jh+sVEEQWMvCi0ha+kAXQKwuZeiAH7bbIFGdy2SPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+DEi+uJczgiHNQ6vnoIuT+td7OzEf9fFv95oNxDjFU=;
 b=XMmsi9mrLv4xzAuu80pbUgOVxALMyo9WiytVWjqmrrbXpwiQXuGtaN4H7tPcAU8gwwvaJJRYiJXKfyWoJqYKlq7qyN3+kZGp4vk18InjMgiPfwdg+mskexWhZf2my8KQ0bZw+A1dQMStcI4FXl/g08woI2YqNUPOLjGlP23/bxF8zMxFH6wUanyASbRWQftPSqn1aMeF6eQjNs/u0jXWRB8k9quw9PI6qY8zrBTPvbBsca9WRFoO1hYU7qd2lahF2q7uxVqE4eKmE6+uvCS4YGFNXlK66SY4ElMGDbaP3sg+1CRPclb/qNkbQAe5cPgo2eyjAIW0mUU1ZlLyx5fHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+DEi+uJczgiHNQ6vnoIuT+td7OzEf9fFv95oNxDjFU=;
 b=gAsHjNAGk+AbEdCRQpae5pd8orIeqISCo4H1lDWeTFg5iMndBntHXYV0ncfonuZfxz3Gy/Oo0P2JSfMdDEmIyFHwC9MKW4gX99EcggY3eI/cUbils+Fx4c88I5CgQAuX14RRlxwqEAaWlYuPjt8qfgcpV8iUBmP+MPNF0wxbTWc=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY3PR01MB11986.jpnprd01.prod.outlook.com (2603:1096:400:409::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.28; Sat, 29 Mar
 2025 07:50:01 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8583.028; Sat, 29 Mar 2025
 07:49:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Ben Chuang
	<ben.chuang@genesyslogic.com.tw>, Victor Shih
	<victor.shih@genesyslogic.com.tw>, Sergey Khimich <serghox@gmail.com>,
	Shan-Chun Hung <shanchun1218@gmail.com>, Peter Robinson
	<pbrobinson@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH] mmc: host: Kconfig: Fix undefined reference to
 rdev_get_drvdata()
Thread-Topic: [PATCH] mmc: host: Kconfig: Fix undefined reference to
 rdev_get_drvdata()
Thread-Index: AQHboHiycauZA5+Yq0iFBNsI2620LrOJtH8AgAAEhoCAAAQnEA==
Date: Sat, 29 Mar 2025 07:49:57 +0000
Message-ID:
 <TYCPR01MB113326A91EABE8284EB2A11C486A32@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250329070329.32562-1-biju.das.jz@bp.renesas.com>
 <Z-eesJwwOTN5qMoj@shikoro> <Z-eie0KfAFFNl4nh@shikoro>
In-Reply-To: <Z-eie0KfAFFNl4nh@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY3PR01MB11986:EE_
x-ms-office365-filtering-correlation-id: f6c6141e-cee6-4e0d-f587-08dd6e964cf0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wFhDLBf5NpWvJtRwdUGmL9cZFjhisO+sJ8LUiK/Q870f2NPpt6pzZAUA7xxr?=
 =?us-ascii?Q?Y7eS1iTyfpr+OveTU1rXxt9/Uhp092AhwvehUJ5URAS9CjRM1oP9cfkR3pRd?=
 =?us-ascii?Q?TLDQ5El7IOf1nG2osumx/uUbWF+Kuo/syPop9gTIHfa6nVDpAnvG6VNFfXXv?=
 =?us-ascii?Q?t/NInND+DmLqv9pLUfC11yEZwYpiiLwFOVtqSB9zUb0fNthCq3yNAWS4HfIC?=
 =?us-ascii?Q?ZtCSK4/KPrRscbrBHxPMkzGQ5HQXq6s12bOg1Zuzvn2opZC8Vg5WmPJIh75x?=
 =?us-ascii?Q?2PrM7S3Jm+fzpGXm0e2d7QRB8gz2fYdFmC/o0FPJnX0x9wUJzQBgpXcmKs3L?=
 =?us-ascii?Q?USOiGR/vd0uYvExAM4CN1uaaD67PsbCnzuRtWdCNPQe5BVqi2v8NiY1HnAxv?=
 =?us-ascii?Q?buGDJXbuDA0+81NKxNG/SCX2jQGbeI84rIIH8iwKHyQrkImvOEFLjmPZH7jM?=
 =?us-ascii?Q?IS/RhX49zUITyedabPvXst6FEJ9VjMXyu5aQGzObp5rLgaKRTu44WwT3SG81?=
 =?us-ascii?Q?VA+GSflH78zJdOSqqqajcfdkda+ycpvdJ5I2DpdtXd/s23JYJaNm9FVttn1N?=
 =?us-ascii?Q?reyVuuBarkMlNdGzUzBw4GRKvhB5oMCr4a085vSSx+6MHtbe7rWETYzUdq/j?=
 =?us-ascii?Q?7M1mZSnGPZSF/k+phADNjl0uajP9VCmvbTMKuJcWDKQsVebrMkKBcM7GukSa?=
 =?us-ascii?Q?9xrsZ04i/R+nOQK/ExyVRLTgbmzkrn8UL++ON3xOmZo9yrQbUuZ828JTqnFP?=
 =?us-ascii?Q?KjU+Jq5KMfDQVQYll9gtjPi4rFeS4Tpv14ALcfg5PpSQYNwB+pN8PBETzQRG?=
 =?us-ascii?Q?l8JudsgvyUyccKVa9mbaV9ez4uq7ji2QdcIbs4viipeAsmM5GSxidxuF2RxP?=
 =?us-ascii?Q?i3DQJdatuXTShaaF6qifUyeMAz86c4z9enGVzPsTO5JrQ6pDUj6RyKd4H+4m?=
 =?us-ascii?Q?Nc+Yfy3S9R17ctlQPpRoqjZ5s0ltHMU/cTuHy13sSDUn/Yv8ije9HW5J5jrn?=
 =?us-ascii?Q?1BVWbWPGdchixQu6sJ1KLHo4eTjrPuYgMJc+0TWjwMIm5ksc95IkDKHj7iZm?=
 =?us-ascii?Q?GHx35aW/8Z6i2erMs6e00fgkHizf8FVdqIwbiFtt22sDKml+2uzGvc5ObqoR?=
 =?us-ascii?Q?eGMVFw/pZ3BH6Bmsq/Jzh2uF00wISix3mnYsBMcKI7k5b12HADIGd7u5q/Xj?=
 =?us-ascii?Q?6VGsIbb0vaI9q3OYg3RkZtnX+VMXZP0o2996ZLpCcUwoiutYXVKtEVB4WLtC?=
 =?us-ascii?Q?2IpQDyoicuprFi3MPAazuw8JBPXJdDcHYoVswEJShmMyQs2Xu63v2dlIbBtF?=
 =?us-ascii?Q?qY/Zre0EjLuSxaH3+/fe1F3OB+K/7m38IkdDg8MSJIuXv/6q6s1DH/ml9M45?=
 =?us-ascii?Q?H1YogMK6e35EzMbEQHLkWaZqbXB16RtOAC/TrAMAzLOrguygCYQZYx3wmhpm?=
 =?us-ascii?Q?FGt7hb5DpqUdbQWFqFdLgEsZ/tne7mkTPylAWcnn4kurq10XfuSgiA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?07fR11DqCmPTv+dr3W37mtWQ+oYZ4FKszSSRzS09dSsmbyjhnDpO1jLoj2Nm?=
 =?us-ascii?Q?zCk3/0v6u83gRLXa24tRx59r2BFb4EJIqhEYlSvFmASiQpYvx0kQvIy5HLg3?=
 =?us-ascii?Q?xDEDye2Ka1j5EaMV6lKwNvH2Gdmxj1Oz/3PLrWNuneReTD1gZ6P31icQnBOM?=
 =?us-ascii?Q?A+cWcG4xz/xST4FAB/LLQh5ZoNOoH0C+Em/RkgyXCnv2KomGe1dXmpTOlMHy?=
 =?us-ascii?Q?tJWJC4gdWrhClNqMux45Bhf1GePSulafZZCx4bKBUt25R3EkWZv15I4KUTJp?=
 =?us-ascii?Q?5dNgBnU8RbsQ7hX2esvYeHEwpa09ZHlE9kmH7CnxBBvblMwRcT81gNUJTiPG?=
 =?us-ascii?Q?UrERXgsixmzYGxoRpR2SMerdwLtBBAoa1ial6/XcG1f5gZ/WGf9hwmzYBdb8?=
 =?us-ascii?Q?NLgATd/0hzMsD20s+U7PO3XCERbnd7aqwGDSnybMsUbLU/dg/uXDBrtUkJBf?=
 =?us-ascii?Q?smTkfbYtxbUzSv8E9aDu5JXM2N15nhS1lIyIUxa49B6lVf/Wcs3525YtDLmL?=
 =?us-ascii?Q?Uy2wNuLLaP5mE5AtuqeV9hDU+K/U4Da7rtw9Px32YuDH99cif2h8uvzwg4Qh?=
 =?us-ascii?Q?LhIaFKJF/qjY+N+9igiYxeN5QvRMJlCr95LcgF/WPAEIKhMubfU28m3VBu2k?=
 =?us-ascii?Q?XopM9cnU40ipd/Mor7Lj9pZLwFXZ+lf38G43jVkrZcyWjNaRJhobF0kYGNeS?=
 =?us-ascii?Q?I38IlDv8mZ66oHxjSfSPHhoG1t7Q6z/DXLovKHcxGJVZq+e3Q6qtQJxGbaNt?=
 =?us-ascii?Q?OPQW3OFqg4KcPQ6otCIaZvs8vD1MlHL27SvrF3ZThDEN/XWgdZkgvOdsarIF?=
 =?us-ascii?Q?oWbk9+42ytzJzezDIEx1s6PjBmZMFLcuiCW7euCwdG6wIGfGQmBCBlUT0Q8S?=
 =?us-ascii?Q?4Im9rwuPzNy87tSEbNMXDHpGg/1U8cejfVJh7Qf8aa/FBQYs3Hi81Mn0gBh7?=
 =?us-ascii?Q?E+TLbIhNEjMorKbNM5eetqjf5cFRKAZc6zjnc//vhbqZSQL2jFrogNzbLX8v?=
 =?us-ascii?Q?VbJQvFoXH9UWe7mzv/y069vuwMsOmVLnye2HgGyCk6g2OYH5V1kzBYXK0+Gj?=
 =?us-ascii?Q?Hy/s2kdKQCz5X6SM7bPyyJIGSOpPM/LK4yxA+mCUtuLIX0b2KVsAfnOF0i9p?=
 =?us-ascii?Q?2sXfg+/NGvmz4fZWfjCn11WbPAzFBOHWLCJ7EML3K556A26j8GDXB3zUk12r?=
 =?us-ascii?Q?uYuEZkmiIkHqApRDXyTl2cbLJ75sbnTAKv86KSRz78tmVquFS85DEizBnIKT?=
 =?us-ascii?Q?op7Cg9AbVGOmhD6Cps9dCNJS4gDU1Idndku3p8GYqGZPzZwd0ef5TdICr7GI?=
 =?us-ascii?Q?IWIBCasZLfDkHC09BcJtgb5qUBdhDajALrLIsIsC7Bq5SSKSfnE2vfbLYGnC?=
 =?us-ascii?Q?8c4K+7njjoj65TkAWHRCNYaW3SeTZyRffpBzUpuifOQV/0RL9UyytB5w62Fu?=
 =?us-ascii?Q?aR51GtOhf+NslDiYz8Y4aFOztme5s6/Se6AhF+EQGqoB6PRR6Ossz81sfCue?=
 =?us-ascii?Q?fuTiqcA3bjghYON1xuCbqtxAtdfw4c3j4fPJi0K5ROBm0wSCEnpc5rURLMPd?=
 =?us-ascii?Q?6d/pAFph+3bDdQKxVfVz2qAxLk9ZuNavknYHcsRdLtfUuRU/CLOyQcGNE9Lo?=
 =?us-ascii?Q?bg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c6141e-cee6-4e0d-f587-08dd6e964cf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2025 07:49:57.1251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxlYr1pXzNeK1n8qK6b9mP9vIjQ0PxSrmpJso+W4dYu7mGppwRwacGHjue4q4R2jmJZymzBzLq9Hv8N8AbB8SL+xyFNtMGa7eD3z9I5Uxso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11986

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 29 March 2025 07:34
> Subject: Re: [PATCH] mmc: host: Kconfig: Fix undefined reference to rdev_=
get_drvdata()
>=20
> On Sat, Mar 29, 2025 at 08:18:08AM +0100, Wolfram Sang wrote:
> > On Sat, Mar 29, 2025 at 07:03:24AM +0000, Biju Das wrote:
> > > The driver no longer builds when regulator support is unavailable.
> > > Fix the build error undefined reference to rdev_get_drvdata() by
> > > selecting the REGULATOR in config MMC_SDHI.
> >
> > As said in a previous mail: I'd suggest MMC_SDHI_INTERNAL_DMAC.
>=20
> But let's add 'if ARCH_RENESAS' to leave at least SUPERH out?

Sure. Will send V2 with 'if ARCH_RENESAS'

Cheers,
Biju



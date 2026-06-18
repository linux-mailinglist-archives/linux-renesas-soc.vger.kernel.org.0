Return-Path: <linux-renesas-soc+bounces-34198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +5yVMyTfM2onHgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 14:05:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B1869FE9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 14:05:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=qLGEcTgP;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38A1E301E75F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9E93BF68F;
	Thu, 18 Jun 2026 12:04:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F702C236B;
	Thu, 18 Jun 2026 12:04:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784293; cv=fail; b=SK2kNm5TQBJyamO8pjsZxDx364b+iDKMvilsaQauTuww/iKGJmJb+3cJPiGlrq0zNBS0eJ2Zol570nkhcDzDDzo8ihyEcCnrXM2mWXKGCJjxfmKTAzO0bwn71pJucvxrJ19qNO+O2ENjXuDdfagZ3Amc7JZAI/NoO0ZLCODshGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784293; c=relaxed/simple;
	bh=P1qoN96L0c7AZdDLfjOWgDp3diLiehO5QNOioro/PtA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SxHTToSMkgn9d029W170ATQQFKwod+5R058+fofyWX+NrKz070qqghp0neFu5UduiWOcKWQ2rNK1vikCo4JDgzNwp0CCxAzw3cIyEN/9Tgj8YWrnZvDkSwBFiuyVeER9OxtTyCkROdB/yQrHi7dmEiKeKb3W6n7AMedgYWfVmSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qLGEcTgP; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXZpxDNbBhhQR++pT7yaw7J9iqjD+83MLf3zCp1PJ6Kg7f+3Llb1JMkXVTDssAX/4SV5ai/PPw2pd4/SujeA3UdXoi4/jbXm6JTUkR56F8Xkn0aNtl0yOd7KnODPfWXR3eIr7eXKmGcQgyXUZD3GHgzgeEIyoDOJt783ZG4yVWUSJUEG8L0VkiEQolmZAElqPdGY1W3i1b6HM52V9fLDVhx/yfh15j/tfMVv9r5Q4SBfQUZJTku1cHUK+Kt2sAGFMRtO7Q2kxuh/p5Yr8xOM6mgqTnX65M6uZs5H54QSRspeOA1RdlqE/J1yUr9drmQ9pY5UAgPuCQtS9oVXjw3Ycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOLetwxHExF87FtIUFrKxC+EBvmdJjFszP8w+jjf6QM=;
 b=qIopxjCwiVVmlkgJ3DHO/QuLVfGZLGhgMI9xBVbkpPi1YTmN/tPuxzHtOh4Hct1og2cwDUwZ0RuZ5qzYrPwX4sNGSxFVVoq+gvQl4/cdFGpoMKK6X2BbIQhleOEPviH5yZnCfYgWkAozt5goLF8M/loYWsnpg4GUqLiJzHHsSZCtlxCtmoZn6+QhKtB0C6VypptqawCphCkmLy1e3wHOwjG/3FYYtIvVFoTOuGRIBYEX787l1lu4ghAAeO/uQkzbDnkdcr/C5ytB8h5uO1dtJXXVPqI8p4l6PCRFxuNIZvlQtCGzG3qAmTtS1FCMPELlYcBqoTkD9BnpF6Qc5f0rqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOLetwxHExF87FtIUFrKxC+EBvmdJjFszP8w+jjf6QM=;
 b=qLGEcTgPd4z8jl9VHfHUCoXINMYrBrIG7eM3L/m/ZyHN63XJ3htnVdPHi2DHlmWtDenxPu4hYR151uD1awIXqk912OZUpVvtVtB0cMWnqQLKHdxbRCMm7NtfOsGvdZ522ZssH10IamI6bzWcTDfLnXfRhEmkQ6mGPrtjD6icICM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6564.jpnprd01.prod.outlook.com (2603:1096:604:10a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 12:04:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 12:04:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Ulf Hansson <ulfh@kernel.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v17 06/17] mmc: renesas_sdhi: Introduce
 renesas_sdhi_hw_info to abstract clock mask
Thread-Topic: [PATCH v17 06/17] mmc: renesas_sdhi: Introduce
 renesas_sdhi_hw_info to abstract clock mask
Thread-Index: AQHc8yZLw+3qaj4210WwTP4P6hczb7ZCxVkAgAAJQjA=
Date: Thu, 18 Jun 2026 12:04:42 +0000
Message-ID:
 <TY3PR01MB113467337ECB82BCD7E812DD286E32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-7-biju.das.jz@bp.renesas.com>
 <ajKUpOHCaufy42NH@shikoro>
In-Reply-To: <ajKUpOHCaufy42NH@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6564:EE_
x-ms-office365-filtering-correlation-id: c40a99ab-dae9-4e1e-eb88-08decd31c811
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|22082099003|18002099003|11063799006|3023799007|4143699003|56012099006;
x-microsoft-antispam-message-info:
 WE/ZTkOdEmTNGzTmeaLqzsD2Mh8QL+T0AV73q5JngTYc7PHneDVe8W4lXkUzLaZistF45ZOr+O+Vvrcp6IaXAG2hrav6dW6pMhI9d2idnhgEIutrI4pkiRjM+SMdhaMWHyOCRibZ/J7AirTScoIp3tzyS0rNclFlxXQQwPtews6FpYWbLgFv6IHJ6hZyANUjTOphWJbf8Gx9d8vhEn/zITb+oAHxkUkP4SDLQNvl8uZVRV33pHUSYzWa4wpqvxKrqEnH3uHW6UxxTndQjFkt6iWWw9rO+kTZNsDeD6HVfSraJDjD0OZx8YKqhixB1bPXAvoKH7tshXOhdTALs/ytD4/7tuglcUiBA/6D4xwQgjcbbp1DcMMThZRAqe6LOm/wKpTbypA8pa5Ke/n8u7zS75zxlht5UEx9fiPf08p3r9m+7B37j4DutqjMKBl6Z9fEjDDCMWf4yHOcNH29pkATsqmx5Q0TsD21aQ/Be9J6Vp0yczWVezlvJpFPNRaji41mYwpS0F9iK95dz7IsbM2pmL0QjzyCjb6jGUfQYUUxN4VlCIsc/PS2twe3M1zkQi3M2w1/DVxjm/FImAA47PklrznlJLiPDMD5lN1XYUCpR3m2yLsA0OcPiG94SiOTa/1Pmch4nShJKQVkgSXpxtPCBbRXuJtHg6g4DrxmZPA0R6KSpJR3UUPP74W4gwsEBYZLYd+I9zXlxSgZJ4XeQzHCqp6Pp5l6RslqyC3Fsc253iYD4l2LTtfXZbcpHX5h7xDF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(22082099003)(18002099003)(11063799006)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?56qb/1M5yfPu04qkWPMsiPQYaZWzLUaxuNOgXi7J/6nO/YFI8RTXYG9XfUcJ?=
 =?us-ascii?Q?BctGeb2ClWO8k65xmdRdNyMGzUHEmoyd8Gf6ZapQT40bGcWrrZ8ISvF80Kv6?=
 =?us-ascii?Q?WyCCP7bqauDc+9oQjEga/iJjc+WWx7dfvo62apDpaba4oFYngHvQrLERJdWp?=
 =?us-ascii?Q?FmdapK+b8UFesChMjjiQp3PkPwPtuLup0Od55raMvsPKyrBUIH0X9mSSGcfk?=
 =?us-ascii?Q?cfivAaN0rJh0MKU80PhCMA5dVKnEBWYv4D1GvPX/A5NyHUuyvc7JJj6OGVM9?=
 =?us-ascii?Q?Bcabf8aEw6n688x6tjlL23YH8dV7YNQm83l6A38NTOlKEAIQLa88m4FL7wiv?=
 =?us-ascii?Q?7bA3v+BCHjDsoI8OP0ddzSPZ1OmOWEXlTqL/yTLs6EDqA6LjDAvtJIHzg3ti?=
 =?us-ascii?Q?FdayMyfHbVBwJPxR58FxCzDuZUb6utPugcicQG3wayQxetXfhUEhNQ3PGjkZ?=
 =?us-ascii?Q?tbk1lu45jrlnmHdxfirJSfCOdZ9tC3RKriXECOXsJNsYdcNfSvnhqQbpY8kS?=
 =?us-ascii?Q?slS2CBOs8y9IAOhRuAoIoxI9qavcf8wGrju7XP5EUrgfjf7boVBgnPZlcZD2?=
 =?us-ascii?Q?qVqplNHt01ICkue9eb0QsmgX/M4Vh1zmD7EludDtz7P2Dwvs1Ost0QJwb1g2?=
 =?us-ascii?Q?FwsHcnjV54nUHOQp4iZM3hMMA4cbEC0zw+o/2NgCkWoEgXANrWwnZl906QD7?=
 =?us-ascii?Q?FOcKQmBjkpT1zU72We9Es/0nUm6/FPJNanfHsnSAsVpqXLn577/uzV7r03ci?=
 =?us-ascii?Q?fZNwObaFx4bJl8TG1ZPmXWKdcBhewaV3SgHE5iFYOJRGDJM1i0gVB/F4OPyO?=
 =?us-ascii?Q?3zn01SmCFX9E3XI6LuztNgl/e7lgR6okao/Xm6eYW8y5MGp0Ap5ix2de1o9s?=
 =?us-ascii?Q?6y96Dwu3vjM5zYOOQRspXCAd87+E0hj2GXoLrrxIpGIwlWol7FSS6gg+GFp2?=
 =?us-ascii?Q?cJIUjGHoyAH1GeYFFp8SFSD3YVhxnv395raQA3VcJgF6tSQLTQJMBdOUFNK7?=
 =?us-ascii?Q?kginuaAxFtHdtyRtRr/yBoq+jSar0MNbWTCyNi+jMzBvzP0zTYs0QrwzzaZD?=
 =?us-ascii?Q?ascoHgnXtVD+iO6BtiweqPPLFj1gApnOao4BSKQ12JDsLB2r1wNXuTvrh8uo?=
 =?us-ascii?Q?uhXkAeE7zeAD7qBmR4prhGthxOwkxNRYwqF4uCBhOr1pWzoKovpIpHGycqMM?=
 =?us-ascii?Q?WmLEo+KhZzlBpEaI/ijFI3CnI1fMOXigtdOPTPYjqS1HyYMjMhc4aCkrnR1D?=
 =?us-ascii?Q?1bwY9lxVMOt34Z3MicTQtPgY7u2up//G72LdfIMIhXVwCbuzyXZ/zM6TkwuI?=
 =?us-ascii?Q?9j3eGViciDx8Q5ud9UPLVZWIaBUlabq4ZiVd+X6muUVvxCcabcrdc711vsbA?=
 =?us-ascii?Q?d9sgAtAgtnC/5X5vRVwVziOP8z5G7zhFU3cnVXFnb5lBbTnX+ZuQG5K2NQ6b?=
 =?us-ascii?Q?6dIffuzIt/0UH8JLX3np2jit4Ml+Vzt5NowY/Em84Qxat6958cmFdoc0WZWS?=
 =?us-ascii?Q?uuNDJ+t93Ej+39czoGGL+a9Pc4AQq+2fecSAnsYql81/bJurcBLSTFUMLgLK?=
 =?us-ascii?Q?Co/3FMJSoSyC7rrtUPT1PkEYqGZM5caNTXFAAKivXsRlUYH23urla0A3meSd?=
 =?us-ascii?Q?7ycrK02S3y40pF79bbXh2sEhuEYBTv0S37Ml27vLQABEkFImWjNYuBhQox2y?=
 =?us-ascii?Q?gOo3pZkx4IVSUGwBntY1NS7ZxfvMKgvrPQDMmTo92dgc/eRWdfNLOgFFYxzO?=
 =?us-ascii?Q?Rg1RB/KLuw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c40a99ab-dae9-4e1e-eb88-08decd31c811
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 12:04:42.6307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clE6MjD4iYbjo4IyRj9mgjcFAuiD7kQI2dAAtwvLzfwxVUZ0QGYGXcTYgUaW/YRr3WFGApGqzIi6iGv/f4S6GKlaN8kBJxnPUVonqXeWre4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6564
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34198-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:from_mime,sang-engineering.com:email,vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 42B1869FE9E

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 17 June 2026 13:36
> Subject: Re: [PATCH v17 06/17] mmc: renesas_sdhi: Introduce renesas_sdhi_=
hw_info to abstract clock mask
>=20
> On Wed, Jun 03, 2026 at 07:57:06AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The RZ/G3L SoC has 11 divider bits and requires a different clock mask
> > in renesas_sdhi_set_clock().
> >
> > Add a new renesas_sdhi_hw_info struct to hold hardware-specific
> > parameters, starting with clk_mask. This replaces the hardcoded
> > constant in renesas_sdhi_set_clock() with a value sourced from the
> > per-device hw_info, and widens the clk variable from u32 to u64
> > accordingly, as clk_mask for RZ/G3L exceeds 32 bits.
> >
> > Wire hw_info through renesas_sdhi_of_data_with_quirks (internalDMAC
> > path) and a new renesas_sdhi_of_data_with_info wrapper (sysDMAC path),
> > and plumb it into renesas_sdhi_probe() so it is stored in the
> > per-instance renesas_sdhi struct.
> >
> > All existing users are assigned sdhi_hw_info_generic, preserving
> > current behaviour. No functional change.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * No change.
> > ---
> >  drivers/mmc/host/renesas_sdhi.h               | 12 ++++
> >  drivers/mmc/host/renesas_sdhi_core.c          |  7 +-
> >  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 16 ++++-
> >  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 66 ++++++++++++++-----
> >  4 files changed, 81 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/mmc/host/renesas_sdhi.h
> > b/drivers/mmc/host/renesas_sdhi.h index 09bf9b24a8c3..a7fc525b7218
> > 100644
> > --- a/drivers/mmc/host/renesas_sdhi.h
> > +++ b/drivers/mmc/host/renesas_sdhi.h
> > @@ -41,6 +41,15 @@ struct renesas_sdhi_of_data {
> >
> >  #define SDHI_CALIB_TABLE_MAX 32
> >
> > +struct renesas_sdhi_hw_info {
> > +	u64 clk_mask;
> > +};
> > +
> > +struct renesas_sdhi_of_data_with_info {
> > +	const struct renesas_sdhi_of_data *of_data;
> > +	const struct renesas_sdhi_hw_info *info; };
>=20
> ? Why don't you put it in renesas_sdhi_of_data and tmio_mmc_data instead?

Ok, I have prototyped with renesas_sdhi_of_data and tmio_mmc_data as per yo=
ur=20
suggestion

The below variables[1] added to struct tmio_mmc_data and
the feature flags[2]. Please let me know is it ok or not?

[1]
	u64				clk_mask;
	unsigned int 		max_divider;
	u32				osel_tmpout;

[2]
 /* Some controllers have tuning delay */
#define TMIO_MMC_TUNING_DELAY		BIT(13)

/* Some controllers have internal divider */
#define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)

/* Some controllers have hw adjustment delay */
#define TMIO_MMC_HWADJ2			BIT(15)

/* Some controllers have HS400mode2  */
#define TMIO_MMC_HS400MODE2		BIT(16)

/* Some controllers have HS400ES  */
#define TMIO_MMC_HS400ES		BIT(17)

>=20
> You wouldn't even need to put the default value in all other of_data by
> using:
>=20
> In the 'if (of_data)' block of probe():
>=20
> 	mmc_data->clk_mask =3D of_data->clk_mask
>=20
> and outside of this block:
>=20
> 	if (!mmc_data->clk_mask) mmc_data->clk_mask =3D <default>;
>=20
> or something similar.

OK.

>=20
> The main thing is that we don't need a hw_info struct IMO. It should be a=
lready all there...
>=20
> Same for everything which gets added later to hw_info.

Agreed, it now works without hw_info struct.

Cheers,
Biju



Return-Path: <linux-renesas-soc+bounces-26276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E01CF2CC5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 10:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37E3C3029C0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 09:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062FD30F545;
	Mon,  5 Jan 2026 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fOSkgbz9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EB632D0C3;
	Mon,  5 Jan 2026 09:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605758; cv=fail; b=AL9mB45SG3qL1o1okq6aKGvcuOdtq88ejzEzAdXdaFbpiboICZGxgrx6wanoaqbt3wb7lFGEFs8Ir4odVYiQCNNT7Mw5QLwYEyK2ah5icaB6ZyBgJ7jsVknL9Sv96/WE1obKOtjqSUwFbbE+nv0Og+j6l4BtjYWmGlLwUTGWSSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605758; c=relaxed/simple;
	bh=IdSXKrlwVlM6+HKDKuDUepDL3EtBQZwYIghHp4DJST0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E6S2PN+qJB6aIQvS5jOQotSJLUYAr8ERC56b8j8AHGqR9gU16Ko0Rho7yo9AEKVxbL2Ds+cM742He+lNloY6kWC2d6dF/jM/Wx5tfhvU5JUEYYf4k3FCMPO/IaE+iLTtywRtTSGYd+fdkoHnS4aLmhSFWVut0x8rXIkxxPc97CY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fOSkgbz9; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2MOcu4X9B3qbTwnGOL0IbyofodQx+OWlgf3TEc8r3FPHKN1P8a88roVT4ruLiy4Icxq/o+Mewwls4vdrKSescoq7kUWpg6icIvCb2EknmpEqP0Ekrp6sBXy/DW0UhMZGZqzzaUoQlJ3tePYXPfwOkkNPo2+dsm5HGwEbXsJ3vVPAyhU4+3uLdOwIEcvd5HMFcuGRU7J6cWx8egNnOXYdfLOKWICs4mLsTSE3o9MHHPj4lXLk9PQmAVSRastnF1rQEPWn4hdz5ahPOjiDY5oSWFl6FzpKyZJwR1HAJZw7CsI0YIk9ph6DbD3WBJTh/fIjjR91qdaHi+48ugT85j+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQGYfpc4iVRZSVee9p5jKZz+6V6KqP7Yb1Ug8GGz2PU=;
 b=dXOsb6tSx7rGz2rqlcUPeiozP9IZRIJBr8EW/r9V2CjYdnpYoYwPVkr4WV1pbMrSiqobmMUezNjE8fzMq0JlIjsUVeNejCGA8cU5zdP2Ewg0RG8iedTdxdvQNcgI4WZK6/AyBxjvRNS4s9BX4xvx0FTd04tZMlMkB36ufW1E2oY5qw3hLSBdVgZJrXY0126Nl/0ckmPDfHNLhZ6UxeKcQJuCDZOp2kN9Qgs43uDqlv26HDYmGqa8jwplcP4WtgRMqXXLvjI/foGviRNU3VYWtgMubsc6BVHXymQ7rjPp9Dn5PDR3yPc0YJ/TLbwr/fF1TCFLKQdAPlIuwKKzc6Qf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQGYfpc4iVRZSVee9p5jKZz+6V6KqP7Yb1Ug8GGz2PU=;
 b=fOSkgbz9Myy+iA5doc3eQjRl40fUbV9eb7zx9SFQTOiN30owhbyOCbVk/novpxchMD+nmlL7kFO2bALfCe7F0QY9eZ+spZuEjUSgf66nv44ZEtdvJldu5UrYsAm9rN7Rmx7Y6GQayVCD3G61jjjFEdx5voRbayYagGItM5bdK6s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB16053.jpnprd01.prod.outlook.com (2603:1096:405:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 09:35:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 09:35:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Thread-Topic: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Thread-Index: AQHcei7JxBZxwv/PikKoXTQSaVLoTbU7c6sQgAfkdoCAAABPkA==
Date: Mon, 5 Jan 2026 09:35:46 +0000
Message-ID:
 <TY3PR01MB11346A08B97503E899897CFA98686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <bccb1a911e76d771dc457012bcc1b943a8c1cdf5.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113467FFD21E457C2B06EC8EC86BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aVuFPf7lyG4dQvWw@tom-desktop>
In-Reply-To: <aVuFPf7lyG4dQvWw@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB16053:EE_
x-ms-office365-filtering-correlation-id: 51e57cc3-9cb1-45bd-74e8-08de4c3dcddd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1tAafDNpjWZqH9LH1OilQGl7eenWhSvt10qEYMmMXA+hoqnpM7Jgrn9m6w1T?=
 =?us-ascii?Q?QQ0uaPNjCObc4cQviFM3WvvUxNK01e3bmfB1yD53OQZZLFgeFEJ22ZsL3my6?=
 =?us-ascii?Q?LHqFgHJ8OBRlmRnVwzBnFI3JDl9mIcN2SkCFym7aD4nQVsOKDvdCxv73p3h6?=
 =?us-ascii?Q?/YzUlDCn6CkFAvydj4RGkEvSHZ368YglJSEswtRtkrg31aV75VK9k3RwbDeM?=
 =?us-ascii?Q?gw+8XcqvF/DG+eO6hxBrqu6qTN41nERj2T/GZOCIEImYd/F1R4mJZe/XWRwH?=
 =?us-ascii?Q?GIW+mOzOnDq61UqWcVRSfd9GF94GUymEg4rL1n7ESVxIZ8W3OYXoP2GIN0Y1?=
 =?us-ascii?Q?QHoYjbkxIIJ9odA9EzD98ouBsX4HERX0/rlM1CQ2JBlwrdAXggCj9qfEka9u?=
 =?us-ascii?Q?DFg5OTOyggEL5140FCcyI45oMjz6prlFISyMsOIQeXLR+4X5ZbwYZId3kw8v?=
 =?us-ascii?Q?6C7wW52vt8Ui2SXYbgIZHRSf5GHzqAABx6UoaVHGUz388v70wTrBZvfAOnZY?=
 =?us-ascii?Q?/fiLxVpXdGzqCKveBEEKMWsToK6n18xRpylhplOhuuy/4ATK4YQA5KD5C2uu?=
 =?us-ascii?Q?HCL1Uuz2emkUkMJJe184dOwtirC+yMO1I5UCuXTmGEpFAQr27fX3G8aUnuh2?=
 =?us-ascii?Q?ai1LwQLQx3q/HpXtpXcwv+bHqJyvFuLypY0V0ww8UlEB5UG04tbGdAh7tOgt?=
 =?us-ascii?Q?BSQ4hND7tUMIGOeAcqV5AC8k4tT3GGqKDZ7xON8uYL1m2+oMjUgTQ6Esn+gX?=
 =?us-ascii?Q?HOx3LPpYVku6H1dlrYrH2o/ih1o3BYyY0sFCMQOqbBT7ZfNBEE5iuoi8E8iT?=
 =?us-ascii?Q?YinxLutIxFTZCflCmCDScz3H1pspz82FYZFMHALOY+dvP3Uz+mIIC9/NrdZs?=
 =?us-ascii?Q?+ocuDFiYhfDwsQoXc7tbe8xIwNOzy3PE3c3CshwrAdwGomGpW2qcsBeprMUQ?=
 =?us-ascii?Q?pXrsK9vMj3W0SNEIcTQYNJkPYgNSEZk7oq0j7Kcd1eSL9vDzk1bVPPqNvQnA?=
 =?us-ascii?Q?t9Sf5uyqtBZ8wMlRgaafhi/yv81tOLUicJp+81PQUPY+tzRPy/FP/9KWjfCa?=
 =?us-ascii?Q?eCSi5C4IMUf0W0Ll6KfX0KXZuSlnTUGmwa4pYy430jIK93RNfbJrjTD2zlzo?=
 =?us-ascii?Q?qcLRG5f5XW3VezLlx33HKsYTeQI3Y5UIXamCoO1a+rWX6bYsG8aMSf7xxhWF?=
 =?us-ascii?Q?T0W/uoYaQOtRTFKNtUt26No+RZ62Bmue4id/9wb+yD1gmvsWnQLe+Tb3R+Of?=
 =?us-ascii?Q?bRWWlCseBRIWNJFsKGnVq4S01xQycQQoPn9ky4kx2/TFpyRqa3zYKgl8O9xE?=
 =?us-ascii?Q?x1epNMcjGmGMZu1VQQRtQ5J8xZXX9NWyKU70cgoS9saRfIjL/A3cfT2dx81z?=
 =?us-ascii?Q?Wgjn7k2VM4JhuW5qVfAOffbUploa3bhFJhu0NkqRMs2glEUrzsNmbCO1iTOA?=
 =?us-ascii?Q?XNJPBbjbKt0N1CVPq1rh1jptnfewAMCb473VvJeSPdA0czQjDHLFO4TtiYcD?=
 =?us-ascii?Q?xiali8WkomtD6rtKw1qg5B/uIVtQcPQM1yTh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?56jSU4dQjhDEeSGcy+xgsrRxBPbIXsc567BTtnB7nl/jB92x5UuOuSuqbFCC?=
 =?us-ascii?Q?UO/1KZ0cnhn98zIo/p62fAQ65+ZzWmbQoISiqi6N12A0GTmL+GJZIfCLoAfe?=
 =?us-ascii?Q?DLfqiURu2pqJIA4Iz2Nc9PLD+1VKdbXikfedxpzGsQHFT5kTF02E59M0YK5U?=
 =?us-ascii?Q?1thmT6Zswtkylq2OzeoNvfUbMi2mwIm/xMg3cU2IBMGskil261tQM5P9FZHH?=
 =?us-ascii?Q?6T3D739v6VASus+YoB//H69m22wT01AX4jTfxUUvXy5JEhGAIFgQOpO4djfH?=
 =?us-ascii?Q?+8YIhw/hvUonr+hwyXaI8fbt9d6h0SeiEy8+UgLHreoPXL9r4lcGP1hAIaUf?=
 =?us-ascii?Q?UTJBO/QsBne4LZTgStL6zebhphNZJEJ3DZpPDZlyvUpljO7Wz5NL49B4oKdf?=
 =?us-ascii?Q?nwqfGyjtMjaNichC+Qv9opFufmssfjJPkaHqGX2H8DnPZGm3IGGMZ3bpVE5Q?=
 =?us-ascii?Q?1z9yFG0A5C/CLvwxOrr6wsMt/3Su345V+l1UvDfXYJVaGmNzJ5sAe3+ST1Pk?=
 =?us-ascii?Q?7ABJjTPvn9t79ZxLm0fInf4gjEoqyOH/Ne1s4k4X/GsRyO7pY8Zc8VSYx2rt?=
 =?us-ascii?Q?IG6UJffnxjPKVHn5bHC06GXWdL6Ry7yNBKXtQ/Frm6PIcyxIaGH0TcQu7FH2?=
 =?us-ascii?Q?Is+bJvmsnZ53ByrtkPHGHOPL5q6s+pTPzppUwUT6aXFTIxGIPpBZZaRG5eaQ?=
 =?us-ascii?Q?4znoTTvBkYoizJ1yudLJTHYpk5T29vIKHuznErZjBU5llteQ9Ht8UyJP/FbV?=
 =?us-ascii?Q?Yj1t+f/zN0NvX/vnWSYCDxVfp9sxxqKtcPQwDKPS9Q9qBcevPat7ZROK9CJs?=
 =?us-ascii?Q?QyNFfMnYYAtm6vbUT0Ll5H6PgaD3RMFILTX7LM14Rok+oR3TH7K0r2OmrLrN?=
 =?us-ascii?Q?S37rUR+tDtEljEoM9YX/5ByqfJJSol4+VNOPbQoQpTQoRhybPqw27Vvm+wR2?=
 =?us-ascii?Q?Y8PpjZrc2u+SN0MbcqWMGoh11mIDoLsoz8C9POgNBO7ztIEcnyacsVTNoLZC?=
 =?us-ascii?Q?WTI5moaP2pZFqr+v+ZhjB2hCU1GpxR7WZvGFyJscqCpxv+cWQitFc5Bucl4C?=
 =?us-ascii?Q?3wMl8n6Avi4fU5HGp7AV0QSChz/03z4bWMekLlaKXaZprlSrs77ymdRAZj+l?=
 =?us-ascii?Q?kdjXo4CCtEdBP3JoEdS1E+eINWrMQXNDVIFDaEwxpNocl4gDkJNnK0UEPe49?=
 =?us-ascii?Q?1QrQz9lweg7KFS3+nJJyF3kuzhU0ofunxgkOMPftIKnSccNO7o8E3RncTt33?=
 =?us-ascii?Q?dflzqfAKrCGKTxFs5XKGyO8vMVbD4Fj3mZwJFNh+N9qrEbE3wniYPzLIpQ7i?=
 =?us-ascii?Q?SDu0OzsoLTtaGz/wCt+SBuPE1mTZcRbW5WKLtBlAfzVaWyljg0BU56Ok2x4j?=
 =?us-ascii?Q?yEkIqifBtDALBOT3MAVPw9S79WKIRlIxnDH7MqujyQAXCNPPUN4uQuAn+N5k?=
 =?us-ascii?Q?4r7QwOvFWqobaLnqOrg7CHH3gjGCU1UPel4vHNEzXW/TOp3lNfWVZO6YbRJI?=
 =?us-ascii?Q?oeNV0PHPN2WnElPzs4REsONxuyguiowsx0Yt80hrJRFwlX0k1v1mGGGukrKS?=
 =?us-ascii?Q?4i8cCEb63bk//EuxuGqe1+Hu8Z9ohFKihj3lnP/3Y5p9fK/21limg+i8aWyM?=
 =?us-ascii?Q?wzLvZpL2b2FVYSXRkIueeW5xawfF/lp+y2b6uLGpqfJK5wS/9j9eXJ/eWtnI?=
 =?us-ascii?Q?kcdNUGMg68hPkTq6X+/UXNK7Tlh9OGuMdTEJmDOZeDHG7VHwuxzQX8MRkKUl?=
 =?us-ascii?Q?63jGxp5EdQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e57cc3-9cb1-45bd-74e8-08de4c3dcddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:35:46.3131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iHnVOsDQDX0WWHpkl+oKRafDywC306RbuEifhQjP0BWIfO7NcjOdO7dZL2CXBk0BXCRc6jg0iKk0Oqah/WoK10rp+oDj8yXmxbn1WlCSfPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16053



> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 05 January 2026 09:33
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Tommaso Merciai <tomm.merciai@gmail.com>; linux-renesas-soc@vger.kern=
el.org; wsa+renesas
> <wsa+renesas@sang-engineering.com>; Alexandre Belloni <alexandre.belloni@=
bootlin.com>; Frank Li
> <Frank.Li@nxp.com>; Philipp Zabel <p.zabel@pengutronix.de>; Geert Uytterh=
oeven
> <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; linux-i3c=
@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
>=20
> Hi Biju,
> Thanks for your review!
>=20
> On Wed, Dec 31, 2025 at 09:04:16AM +0000, Biju Das wrote:
> >
> >
> > > -----Original Message-----
> > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > Sent: 31 December 2025 08:23
> > > To: Tommaso Merciai <tomm.merciai@gmail.com>
> > > Cc: linux-renesas-soc@vger.kernel.org; Biju Das
> > > <biju.das.jz@bp.renesas.com>; Tommaso Merciai
> > > <tommaso.merciai.xr@bp.renesas.com>; wsa+renesas
> > > <wsa+renesas@sang-engineering.com>; Alexandre Belloni
> > > <alexandre.belloni@bootlin.com>; Frank Li <Frank.Li@nxp.com>;
> > > Philipp Zabel <p.zabel@pengutronix.de>; Geert Uytterhoeven
> > > <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>;
> > > linux- i3c@lists.infradead.org; linux-kernel@vger.kernel.org
> > > Subject: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
> > >
> > > The Renesas I3C controller does not retain its register state across
> > > system suspend, requiring the driver to explicitly save and restore h=
ardware configuration.
> > >
> > > Add suspend and resume NOIRQ callbacks to handle system sleep transit=
ions.
> > >
> > > During suspend, save the Device Address Table (DAT) entries, assert
> > > reset lines, and disable all related clocks to allow the controller t=
o enter a low-power state.
> > >
> > > On resume, re-enable clocks and reset lines in the proper order.
> > > Restore the REFCKCTL register, master dynamic address, and all DAT en=
tries, then reinitialize the
> controller.
> > >
> > > Store the REFCLK divider value, and the master dynamic address to
> > > restore timing and addressing configuration after resume.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > > v2->v3:
> > >  - Fixed error path into renesas_i3c_resume_noirq() and
> > >    renesas_i3c_suspend_noirq() function.
> > >  - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() c=
all.
> > >
> > > v1->v2:
> > >  - Updated commit as v1 has been split into smaller patches.
> > >  - Use clock bulk API into renesas_i3c_suspend_noirq() and
> > >    renesas_i3c_resume_noirq().
> > >
> > >  drivers/i3c/master/renesas-i3c.c | 89
> > > ++++++++++++++++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >
> > > diff --git a/drivers/i3c/master/renesas-i3c.c
> > > b/drivers/i3c/master/renesas-i3c.c
> > > index b065b8d4b138..e33ff16efdb3 100644
> > > --- a/drivers/i3c/master/renesas-i3c.c
> > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > @@ -256,16 +256,19 @@ struct renesas_i3c {
> > >  	enum i3c_internal_state internal_state;
> > >  	u16 maxdevs;
> > >  	u32 free_pos;
> > > +	u32 dyn_addr;
> > >  	u32 i2c_STDBR;
> > >  	u32 i3c_STDBR;
> > >  	unsigned long rate;
> > >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> > >  	struct renesas_i3c_xferqueue xferqueue;
> > >  	void __iomem *regs;
> > > +	u32 *DATBASn;
> > >  	struct clk_bulk_data *clks;
> > >  	u8 num_clks;
> > >  	struct reset_control *presetn;
> > >  	struct reset_control *tresetn;
> > > +	u8 refclk_div;
> > >  };
> > >
> > >  struct renesas_i3c_i2c_dev_data {
> > > @@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master=
_controller *m)
> > >  					   EXTBR_EBRHP(pp_high_ticks));
> > >
> > >  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> > > +	i3c->refclk_div =3D cks;
> > >
> > >  	/* I3C hw init*/
> > >  	renesas_i3c_hw_init(i3c);
> > > @@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master=
_controller *m)
> > >  	if (ret < 0)
> > >  		return ret;
> > >
> > > +	i3c->dyn_addr =3D ret;
> > >  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) |
> > > MSDVAD_MDYADV);
> > >
> > >  	memset(&info, 0, sizeof(info));
> > > @@ -1362,6 +1367,12 @@ static int renesas_i3c_probe(struct platform_d=
evice *pdev)
> > >  	i3c->maxdevs =3D RENESAS_I3C_MAX_DEVS;
> > >  	i3c->free_pos =3D GENMASK(i3c->maxdevs - 1, 0);
> > >
> > > +	/* Allocate dynamic Device Address Table backup. */
> > > +	i3c->DATBASn =3D devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdev=
s,
> > > +				    GFP_KERNEL);
> > > +	if (!i3c->DATBASn)
> > > +		return -ENOMEM;
> > > +
> > >  	return i3c_master_register(&i3c->base, &pdev->dev,
> > > &renesas_i3c_ops, false);  }
> > >
> > > @@ -1372,6 +1383,83 @@ static void renesas_i3c_remove(struct platform=
_device *pdev)
> > >  	i3c_master_unregister(&i3c->base);
> > >  }
> > >
> > > +static int renesas_i3c_suspend_noirq(struct device *dev) {
> > > +	struct renesas_i3c *i3c =3D dev_get_drvdata(dev);
> > > +	int i, ret;
> > > +
> > > +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> > > +
> > > +	/* Store Device Address Table values. */
> > > +	for (i =3D 0; i < i3c->maxdevs; i++)
> > > +		i3c->DATBASn[i] =3D renesas_readl(i3c->regs, DATBAS(i));
> > > +
> > > +	ret =3D reset_control_assert(i3c->presetn);
> > > +	if (ret)
> > > +		goto err_mark_resumed;
> > > +
> > > +	ret =3D reset_control_assert(i3c->tresetn);
> > > +	if (ret)
> > > +		goto err_presetn;
> > > +
> > > +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
> >
> > Why can't you use unlocked version clk_bulk_disable/enable(num_clks,
> > clks); for suspend()/resume()?
>=20
> I'm seeing the same calls into:
>=20
>  - svc_i3c_runtime_suspend()


Are they doing in  suspend_noirq callback(), if yes you could fix that driv=
er as well.

Cheers,
Biju

>=20
> Into drivers/i3c/master/svc-i3c-master.c
>=20
> >
> > > +
> > > +	return 0;
> > > +
> > > +err_presetn:
> > > +	reset_control_deassert(i3c->presetn);
> > > +err_mark_resumed:
> > > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int renesas_i3c_resume_noirq(struct device *dev) {
> > > +	struct renesas_i3c *i3c =3D dev_get_drvdata(dev);
> > > +	int i, ret;
> > > +
> > > +	ret =3D reset_control_deassert(i3c->presetn);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D reset_control_deassert(i3c->tresetn);
> > > +	if (ret)
> > > +		goto err_presetn;
> > > +
> > > +	ret =3D clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
> >
> > Same here.
>=20
> Same here.
>=20
>=20
> Thanks & Regards,
> Tommaso
>=20
> >
> > > +	if (ret)
> > > +		goto err_tresetn;
> > > +
> > > +	/* Re-store I3C registers value. */
> > > +	renesas_writel(i3c->regs, REFCKCTL,
> > > +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> > > +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> > > +		       MSDVAD_MDYAD(i3c->dyn_addr));
> > > +
> > > +	/* Restore Device Address Table values. */
> > > +	for (i =3D 0; i < i3c->maxdevs; i++)
> > > +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > > +
> > > +	/* I3C hw init. */
> > > +	renesas_i3c_hw_init(i3c);
> > > +
> > > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > > +
> > > +	return 0;
> > > +
> > > +err_tresetn:
> > > +	reset_control_assert(i3c->tresetn);
> > > +err_presetn:
> > > +	reset_control_assert(i3c->presetn);
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct dev_pm_ops renesas_i3c_pm_ops =3D {
> > > +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> > > +				  renesas_i3c_resume_noirq)
> > > +};
> > > +
> > >  static const struct of_device_id renesas_i3c_of_ids[] =3D {
> > >  	{ .compatible =3D "renesas,r9a08g045-i3c" },
> > >  	{ .compatible =3D "renesas,r9a09g047-i3c" }, @@ -1385,6 +1473,7 @@
> > > static struct platform_driver renesas_i3c =3D {
> > >  	.driver =3D {
> > >  		.name =3D "renesas-i3c",
> > >  		.of_match_table =3D renesas_i3c_of_ids,
> > > +		.pm =3D pm_sleep_ptr(&renesas_i3c_pm_ops),
> > >  	},
> > >  };
> > >  module_platform_driver(renesas_i3c);
> > > --
> > > 2.43.0
> >


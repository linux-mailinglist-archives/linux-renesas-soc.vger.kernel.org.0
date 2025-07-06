Return-Path: <linux-renesas-soc+bounces-19281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61869AFA42F
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 11:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8D316C3BC
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Jul 2025 09:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7C21FCD1F;
	Sun,  6 Jul 2025 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d06xB1vq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011036.outbound.protection.outlook.com [52.101.125.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5E1FCFF1;
	Sun,  6 Jul 2025 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751795739; cv=fail; b=U+ojLN8v0VTaWdGY5NCdj1jMnH0ecHU5YbRe7ck1ntQ1i4U5riqcV20alIAd7xiwrgwHl3GKFXzWd4/TazKDWV01QARh15guZrLfkG2dlarhc3olRmzUU5/S6eijTaLIuq90xk3gpVk68BshWFzTTS1lQbq6C+XTGoOXbP8p6F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751795739; c=relaxed/simple;
	bh=2J7IdFj7MoJ53SgBVn5mTh2dfEit1RjrDM52in8K+bI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T7Z8Xflw1w6MI6PDjgNgde5/fryu40KxLYL0iRV2oEO0ogqAPiSVG3dF4zrWm8FAhmVDL9ratkgzC8BE6VxsKTmxS5YyrqBFeEhbdHJMmqK4HzLuw5sJQnhh5dw+x7Gn3YyON8X3NfFSv/OI5VZMWHxYxN2BFZCEZz3XJTR0V0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=d06xB1vq; arc=fail smtp.client-ip=52.101.125.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k249yJdQM3LYzdPvbzqZkC8fZozZNlxb/shzl3JlmNFdKGlbpCHsKDPKkGhkchHI0Y5JVn2Eb95HJCudwcjDEuE+TGdLnkTc2WxM64HR4KUw8vHy1DaqC6rntVj/seHMkdxxVv+2pZGbjgC7R7abanMZANA1QxXjq8aMxNgkTAUG/yrrm4+RfBlxLEIjq2R0KJ9nhyS8Wf0QFVcRmvU+BeSQYSLcv5211G7wKOIpnRpX5HkCxYkeo8OF8YBBeX90BqVa2WLTEBqyzhawt1qn8+2IrwOrqtIe3q1TwoogsWJspDcyg/p3wJ409oBfdYt7tLjdLmyjws98pj7vA4nsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IU9o3XtFSiHAf3YplcEFylLccAenT7hihG9anHdPBcU=;
 b=a6r6NTjQaqngTGK8YaNAXD6SaQF17HVZgDZk5OtQAP5+I14RjtGmvwRL9c9w0n59sxXT7OztN+5gsYG1TCyGYiXJClbUIicT0qnV5la2MljphkeNVw39WY9a2qQJzqiHyGZucDdyLQ1c3VLfj85OfssX2cbD7zjMJ/MIGvtctmBaRreAc9Y7ieaDUxlMhN8p/LWtcP5oiO0i5LQFqrH7060RMEE2YHHjzzNnUYHJmobt8mmjSUe6B6HObWMwBAx2Nn6anPXUsnqblzWR7P/CiVx3/V4Y1/gOJvcovhU4PTfLiW3Dg9ExppwVjXgtZoez7j7bGDPZqUTKV+iJjKvPzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU9o3XtFSiHAf3YplcEFylLccAenT7hihG9anHdPBcU=;
 b=d06xB1vqomynKg96FodQB3pIpyQT+TC3Guv2v5KklUh7tp8f5d4Rza06bMEQaU8sScCHRrZAmU8ZX6oLzI+8K+z0J5ASlbAnPn+vF7QGUkVpwGubwHK3Aj9RCkn3dGtULfUNli3SCNqIUJlkSRS7eOc8Ysu26atPQwNXNGY5QYY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12348.jpnprd01.prod.outlook.com (2603:1096:405:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Sun, 6 Jul
 2025 09:55:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Sun, 6 Jul 2025
 09:55:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Topic: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Thread-Index: AQHb7c6+F2cIzXpCE0eHQabSLpoq6LQj6xeAgAALbTCAANFSwIAAEXhA
Date: Sun, 6 Jul 2025 09:55:28 +0000
Message-ID:
 <TY3PR01MB113467D8E13143E412B119270864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12348:EE_
x-ms-office365-filtering-correlation-id: 45e5bf55-a643-4eb0-a66c-08ddbc733d0d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gmqTwNTyR+FQeT8yiLISxbPzoqMbcXJOzxQtFgSNnymMaOEU1Lg8pu5G86hC?=
 =?us-ascii?Q?YuTKdj7teuzjnYluesCSJCBnlupnG8i4Mz/gpWzfMOtDNxy0q767qxnnV9K9?=
 =?us-ascii?Q?O1CoU2VU666+Zf7CCZ9fJz07VHrdWk2Ga6alXCz8UteqPSVn5L6zQ46KmD/U?=
 =?us-ascii?Q?qrG7Rwf+3HJmOiJd7wJvmP/lVWgTB4bx3/WLlw29HxFXQK/QJ1BJVcN/FmCh?=
 =?us-ascii?Q?Vf0eA33h6mCLkDJ2AswbOP18TtbykSGzMQcLq/6RoiCpHfoIMghj62BAh8r9?=
 =?us-ascii?Q?vRjODhyltdqOCjGz0trP2YgOXf8/wksT465X6TG9BZFbGS3blW8MuRoMZbd4?=
 =?us-ascii?Q?47evbV5vu5ylmnfiOE4G4XTqz/3sz+p86p4oK63R6Aw61OqQnbLnXwLRTnhO?=
 =?us-ascii?Q?IoMBrTgiXd+ZLYEnjJ5G0liY7jaEqbEuCmTTg/tJHNH1kUlAHQOR63hEqZao?=
 =?us-ascii?Q?uZ8DLZlskbg6QtWIb6+U8gNMQ3lIjo7GBRO4nruvK7Ah03KmNdiGPwgly1tn?=
 =?us-ascii?Q?Sr3FmUPW4HkzVDa1U55j0dYAE5gm+VUamIsLO2ZmO3LePfX82w1hg3Qa/372?=
 =?us-ascii?Q?EtNXAEr9QhZeJVpSlH+m1IWfj7vzNKu/WkaVl1Ix/AHzI9Kqcr0pM3Yw7kLy?=
 =?us-ascii?Q?l8TC77F/+pHkLNAcCoYlPxB2JsHpz/pZZn10qnElgvlJfrGR3JG6YfKxh+Se?=
 =?us-ascii?Q?HI/vqmZyQH1doZ4TivZQQyEkatXJwtMuxY2kji/PnKhd5HwpWDGg+BpwCFM9?=
 =?us-ascii?Q?YQ05cdFSvLAJtjaNWVAtlyUxN+1nOdRPAJO+ugbDcR5645iS7zMUwSLR8FCb?=
 =?us-ascii?Q?QhBLb6LC41L/gTKTucw1LYSnUNRsC5bMQ5Z5q0MaxDwivzXkcxMULNC7rJru?=
 =?us-ascii?Q?tR4mpCshMh1Lrbj1K42PuJhsYhCZEzhCCw7537Wd+baPL6B81eGvyAoCyent?=
 =?us-ascii?Q?HiT9R/j5DFmxPBeu4qwo8+XR+GWOSQEb1W174L7yTcgjx6zqZyVdHFn3GJBm?=
 =?us-ascii?Q?pAPF4vdGV0eeGf/YdtB0rrfAJlh2KFeoQxiTFlwjF9GknD2qAM3eESoFqV9Q?=
 =?us-ascii?Q?vW3Eyawcc9Z17abj8mJtefa10h0j6/7LA9JET1KQ+wvmtHfj+5c4kx+sxx1h?=
 =?us-ascii?Q?MoFoyhNRvZYlSRfJGe1XiiLonwkrUs6jQITEtJ06t2ASBAne6acUQz7p7SRC?=
 =?us-ascii?Q?GuUaG/JbRy9HsQBRS/nMGJgfB4m9XI5OoObH30MJK1hr+rBpWCyvEJ1HQUOy?=
 =?us-ascii?Q?jFnOGdydb5Z2za+DvX2sUOBgWDBlNx8rfyi1Wteh2FlYh7UQ+9YO9UGFWtMA?=
 =?us-ascii?Q?jDJ4avyB23JXNC+cmutgeaRX9I1x9kcKnmx8TKW4qDI5xVy9rrvjz/LXqBfy?=
 =?us-ascii?Q?pwBuHruHWBj4tqsUV097iJT+jayAKD5obwhtW8ZpFlFEikb2BJy3RLavi/tG?=
 =?us-ascii?Q?/UEqVTZohvReEQnKKkXrOm5+l+orhnew1cUVZxlrVuYXuLpHtto+FpuL/Arv?=
 =?us-ascii?Q?yuVB/yk4Ban2zfY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?bqifNkobdWMiO0JHNFSvdBV9a6z4oSlRy3iw3s5gIQSEB7aDYuxmYoNohvY/?=
 =?us-ascii?Q?MhHHDi554M9aF+K24wiZEvYtnspzOUotGA/SUVCXaILyKLt9WkFuOvrmrg09?=
 =?us-ascii?Q?JjjrsOeK8j3sC+M9KA59mLXUANd/OWtQ9TCrXcCqG6/Ey4QYsLdn+lGMwYrL?=
 =?us-ascii?Q?KxMVqXdBq5ZU10jSCyka+JjFa9T5Fipp9thaLMNGICT6PNd+oDZF5h29dkJF?=
 =?us-ascii?Q?yV428Bo/oEck870/dv0jZb/YaYKBL4gh4VtkMpwp6zeKhXIfKPOEbZsl9mNr?=
 =?us-ascii?Q?eagrCg9gZBRs+85pDZGHg4khadCXPPc4ZzM/3MGihRbGoidxXuJeLG3Qfdi8?=
 =?us-ascii?Q?xUl53A43+uNXXTDbXTPQxjrCPV594yiK4pToK6E5sTQ7WYPgLpzOMaELkg5w?=
 =?us-ascii?Q?FECC4TsRaONBy4IVwNbSXL11C2aAG7m24zgZ3fIBCC3DOJ80OkqAXRh8qNQ9?=
 =?us-ascii?Q?2jnjLDQk0vYH4ChO/5pCgWF2OwVrKHJ0EwZE6oIz8fSJyzfCWFkKs5/SPRFV?=
 =?us-ascii?Q?tz7iwUT0ZlezGIWABRBDSyOtjPI8PH9zW83tfqQOeuCFUKhD/sYMK/C9z+i1?=
 =?us-ascii?Q?27w5BBIJcDroUpLLJ8DztRXIjtDEXcsTsIultVwisNN0wiWgFLlKAE5fyHJ8?=
 =?us-ascii?Q?qSuXBP0WU9VZ7axp+6izVNQ5ovCe50UjJ/E8DUYdP7P7Fz8E1oj4SDpOD7i0?=
 =?us-ascii?Q?fCVYHE16NgxSshiaEkokPyotncdmj61aGe/riJ38rb6D71QfITKyblGT/jvA?=
 =?us-ascii?Q?//VFSriS0Ti6BYn7KE5eOd25Z3+Bx222J+EkjEioLVnw4bjlbvi0OCqw7p/a?=
 =?us-ascii?Q?Cy6UZ/lWqt1soO2gv7GJAdpLvX2Ji4BBjqgzy23X4QbP16upVf6CrTuMFZEt?=
 =?us-ascii?Q?m5gTxSw/AZc/tfSeT112gBvlt0y93ormX8951m8ppb1wgoJrxwL4wVX/rLav?=
 =?us-ascii?Q?CqUb3RUtZLkRkd+0M70Vm5BPZz047ooEO+fvOXXB9iE8bEj7S3PsIg37qp53?=
 =?us-ascii?Q?8NRXJNl/oV2bekwYVwCdUNXOdiV6gqP/ULTPAF1XrqQyIohVy9ApDVP67dHj?=
 =?us-ascii?Q?mAtkRckst36n3aOzHXryZ7R19IR+p5oHJ9wD9Csgkrhd2QBtFQ5x82VP9rDC?=
 =?us-ascii?Q?KZgWHhddReIpJfyKZkIOtnkSzkuUuU/P0Vv1fnvqe5apr11jwqe4hWfmajQi?=
 =?us-ascii?Q?ICxdk9KJN4SxWhMs+3l2v/V10WgmyybciMenF3/+LLfdmKTefq/JVHvXpUsD?=
 =?us-ascii?Q?i3y0KMQ+xfq1gCL/C5N0qRmo/F30r8PobtYb6cq89PiiU+1o4E4V4qemR1DM?=
 =?us-ascii?Q?ESU+/xhq7slPBD30KeBIG0iBPNbjxzmiQVk8MKD2s0aC8Xdd1G8DVD+98nIV?=
 =?us-ascii?Q?hwf9TpyBdeST3if3wV+ZSvWUG3FnAdEB02mqP7zetWbmlQR9z4kSCPy56Pq4?=
 =?us-ascii?Q?3fuvCzybVJGB2oFFcV1LVJuvfoR5X1voXZHc8TPAjadKtL9y4rjeECkQMj2k?=
 =?us-ascii?Q?IO/9F458opia6sh8G0cqRKa+iqOJxnQTVoida8dxTppX1OlXUaxR/wb529tQ?=
 =?us-ascii?Q?8vHB3iemPMszuv28u5wY0EbMXRub7ROvRKYpSaWHQUFsN81R1CCv3iABnlRV?=
 =?us-ascii?Q?yQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e5bf55-a643-4eb0-a66c-08ddbc733d0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2025 09:55:28.7430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/9Olcdsv0/RRtPF1KV+aayNR0xrhIxq9B6iEUqT0uIzC2RdBo6kNIc8vRAcJnyEuYRKweYwFodeTLkfmEo18KsyOHhoLvZsSu7vrjKF1ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12348



> -----Original Message-----
> From: Biju Das
> Sent: 06 July 2025 09:45
> Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM su=
spend/resume callbacks
>=20
> Hi Russell King,
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: 05 July 2025 21:27
> > Subject: RE: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
> > suspend/resume callbacks
> >
> >
> >
> > > -----Original Message-----
> > > From: Russell King <linux@armlinux.org.uk>
> > > Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add
> > > PM suspend/resume callbacks
> > >
> > > On Sat, Jul 05, 2025 at 06:03:24PM +0100, Biju Das wrote:
> > > > Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
> > > >
> > > > The PM deep entry is executed by pressing the SLEEP button and
> > > > exit from entry is by pressing the power button.
> > > >
> > > > Logs:
> > > > root@smarc-rzg3e:~# PM: suspend entry (deep) Filesystems sync:
> > > > 0.115 seconds Freezing user space processes Freezing user space
> > > > processes completed (elapsed 0.002 seconds) OOM killer disabled.
> > > > Freezing remaining freezable tasks Freezing remaining freezable
> > > > tasks completed (elapsed 0.001 seconds)
> > > > printk: Suspending console(s) (use no_console_suspend to debug)
> > > > NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> > > > NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> > > > NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> > > > NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> > > > NOTICE:  BL2: SYS_LSI_PRR: 0x0
> > > > NOTICE:  BL2: Booting BL31
> > > > renesas-gbeth 15c30000.ethernet end0: Link is Down Disabling
> > > > non-boot CPUs ...
> > > > psci: CPU3 killed (polled 0 ms)
> > > > psci: CPU2 killed (polled 0 ms)
> > > > psci: CPU1 killed (polled 0 ms)
> > > > Enabling non-boot CPUs ...
> > > > Detected VIPT I-cache on CPU1
> > > > GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> > > > CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> > > > CPU1 is up
> > > > Detected VIPT I-cache on CPU2
> > > > GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> > > > CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> > > > CPU2 is up
> > > > Detected VIPT I-cache on CPU3
> > > > GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> > > > CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> > > > CPU3 is up
> > > > dwmac4: Master AXI performs fixed burst length 15c30000.ethernet en=
d0:
> > > > No Safety Features support found 15c30000.ethernet end0: IEEE
> > > > 1588-2008 Advanced Timestamp supported 15c30000.ethernet end0:
> > > > configuring for phy/rgmii-id link mode
> > > > dwmac4: Master AXI performs fixed burst length 15c40000.ethernet en=
d1:
> > > > No Safety Features support found 15c40000.ethernet end1: IEEE
> > > > 1588-2008 Advanced Timestamp supported 15c40000.ethernet end1:
> > > > configuring for phy/rgmii-id link mode OOM killer enabled.
> > > > Restarting tasks: Starting
> > > > Restarting tasks: Done
> > > > random: crng reseeded on system resumption
> > > > PM: suspend exit
> > > >
> > > > 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control
> > > > rx/tx root@smarc-rzg3e:~# ifconfig end0 192.168.10.7 up
> > > > root@smarc-rzg3e:~# ping 192.168.10.1 PING 192.168.10.1
> > > > (192.168.10.1) 56(84) bytes of data.
> > > > 64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D2.05 ms
> > > > 64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.928 ms
> > >
> > > You should also test with the interface configured before
> > > suspend/resume and confirm that it continues working afterwards witho=
ut being reconfigured.
> >
> > Yes, I confirm it works without reconfiguration.
> >
> > Please see the logs:
> > root@smarc-rzg3e:~# ifconfig
> > eth0: flags=3D-28605<UP,BROADCAST,RUNNING,MULTICAST,DYNAMIC>  mtu 1500
> >         inet 192.168.10.7  netmask 255.255.255.0  broadcast 192.168.10.=
255
> >         ether 00:11:22:33:44:55  txqueuelen 1000  (Ethernet)
> >         RX packets 35  bytes 2208 (2.1 KiB)
> >         RX errors 0  dropped 0  overruns 0  frame 0
> >         TX packets 27  bytes 5368 (5.2 KiB)
> >         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> >         device interrupt 20
> >
> > root@smarc-rzg3e:~# ping 192.168.10.1
> > PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
> > 64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D0.866 ms
> > 64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.900 ms
> > 64 bytes from 192.168.10.1: icmp_seq=3D3 ttl=3D64 time=3D0.938 ms
> > 64 bytes from 192.168.10.1: icmp_seq=3D4 ttl=3D64 time=3D0.929 ms
> > 64 bytes from 192.168.10.1: icmp_seq=3D5 ttl=3D64 time=3D0.890 ms
> > 64 bytes from 192.168.10.1: icmp_seq=3D6 ttl=3D64 time=3D1.02 ms
> > [   75.812501] PM: suspend entry (deep)
> > [   75.849939] Filesystems sync: 0.033 seconds
> > [   75.855680] Freezing user space processes
> > [   75.861550] Freezing user space processes completed (elapsed 0.001 s=
econds)
> > [   75.868559] OOM killer disabled.
> > [   75.871788] Freezing remaining freezable tasks
> > [   75.877342] Freezing remaining freezable tasks completed (elapsed 0.=
001 seconds)
> > [   75.884724] printk: Suspending console(s) (use no_console_suspend to=
 debug)
> > NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> > NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> > NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> > NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> > NOTICE:  BL2: SYS_LSI_PRR: 0x0
> > NOTICE:  BL2: Booting BL31
> > [   75.939455] renesas-gbeth 15c30000.ethernet eth0: Link is Down
> > [   75.948464] Disabling non-boot CPUs ...
> > [   75.952584] psci: CPU3 killed (polled 0 ms)
> > [   75.957722] psci: CPU2 killed (polled 0 ms)
> > [   75.963385] psci: CPU1 killed (polled 4 ms)
> > [   75.967815] Enabling non-boot CPUs ...
> > [   75.968025] Detected VIPT I-cache on CPU1
> > [   75.968069] GICv3: CPU1: found redistributor 100 region 0:0x00000000=
14960000
> > [   75.968107] CPU1: Booted secondary processor 0x0000000100 [0x412fd05=
0]
> > [   75.968786] CPU1 is up
> > [   75.968882] Detected VIPT I-cache on CPU2
> > [   75.968902] GICv3: CPU2: found redistributor 200 region 0:0x00000000=
14980000
> > [   75.968922] CPU2: Booted secondary processor 0x0000000200 [0x412fd05=
0]
> > [   75.969351] CPU2 is up
> > [   75.969446] Detected VIPT I-cache on CPU3
> > [   75.969466] GICv3: CPU3: found redistributor 300 region 0:0x00000000=
149a0000
> > [   75.969486] CPU3: Booted secondary processor 0x0000000300 [0x412fd05=
0]
> > [   75.969980] CPU3 is up
> > [   75.987181] dwmac4: Master AXI performs fixed burst length
> > [   75.988097] renesas-gbeth 15c30000.ethernet eth0: No Safety Features=
 support found
> > [   75.988117] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Adv=
anced Timestamp supported
> > [   75.991717] renesas-gbeth 15c30000.ethernet eth0: configuring for ph=
y/rgmii-id link mode
> > [   76.007851] dwmac4: Master AXI performs fixed burst length
> > [   76.008761] renesas-gbeth 15c40000.ethernet eth1: No Safety Features=
 support found
> > [   76.008777] renesas-gbeth 15c40000.ethernet eth1: IEEE 1588-2008 Adv=
anced Timestamp supported
> > [   76.012353] renesas-gbeth 15c40000.ethernet eth1: configuring for ph=
y/rgmii-id link mode
> > [   76.204477] OOM killer enabled.
> > [   76.207609] Restarting tasks: Starting
> > [   76.212024] Restarting tasks: Done
> > [   76.215550] random: crng reseeded on system resumption
> > [   76.220909] PM: suspend exit
> > [   78.612495] renesas-gbeth 15c30000.ethernet eth0: Link is Up - 1Gbps=
/Full - flow control rx/tx
> > From 192.168.10.7 icmp_seq=3D7 Destination Host Unreachable From
> > 192.168.10.7 icmp_seq=3D8 Destination Host Unreachable From 192.168.10.=
7
> > icmp_seq=3D9 Destination Host Unreachable
> > 64 bytes from 192.168.10.1: icmp_seq=3D11 ttl=3D64 time=3D0.663 ms
> > 64 bytes from 192.168.10.1: icmp_seq=3D12 ttl=3D64 time=3D1.19 ms
> >
>=20
> FYI, The above testing is done with rootFS mounted on SD card.
>=20
> But when I mount rootFS on NFS, after wakeup, I am not able to contact th=
e NFS server.
>=20
> The below patch makes it to work[1].
> Not sure, why the original code is failing if the rootFS is mounted on NF=
S?
>=20
> Cheers,
> Biju
>=20
> [1]
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> index df4ca897a60c..434ef1802195 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -25,6 +25,8 @@ struct renesas_gbeth {
>         struct plat_stmmacenet_data *plat_dat;
>         struct reset_control *rstc;
>         struct device *dev;
> +
> +       bool suspend;
>  };
>=20
>  static const char *const renesas_gbeth_clks[] =3D { @@ -50,6 +52,13 @@ s=
tatic int
> renesas_gbeth_init(struct platform_device *pdev, void *priv)
>         if (ret)
>                 reset_control_assert(gbeth->rstc);
>=20
> +       if (gbeth->suspend) {
> +               struct net_device *ndev =3D platform_get_drvdata(pdev);
> +
> +               gbeth->suspend =3D false;
> +               phy_init_hw(ndev->phydev);
> +       }
> +
>         return ret;
>  }
>=20
> @@ -66,6 +75,8 @@ static void renesas_gbeth_exit(struct platform_device *=
pdev, void *priv)
>         ret =3D reset_control_assert(gbeth->rstc);
>         if (ret)
>                 dev_err(gbeth->dev, "Reset assert failed\n");
> +
> +       gbeth->suspend =3D true;
>  }

Just adding some logs:
Currently PHY resume is called twice
[   35.754933]  kszphy_resume+0x3c/0xf0
[   35.754940]  phy_resume+0x3c/0x74
[   35.754949]  phylink_prepare_resume+0x58/0xa0
[   35.754957]  stmmac_resume+0x90/0x2a0
[   35.771296]  stmmac_pltfr_resume+0x3c/0x4c

and

[   35.771258]  kszphy_resume+0x3c/0xf0
[   35.771263]  __phy_resume+0x28/0x54
[   35.771270]  phy_start+0x7c/0xb4
[   35.771275]  phylink_start+0xb8/0x210
[   35.771282]  phylink_resume+0x7c/0xc4
[   35.771288]  stmmac_resume+0x1ec/0x2a0
[   35.771296]  stmmac_pltfr_resume+0x3c/0x4c

With patch[1], there is only one kszphy_resume() call.

1) Detailed logs working case RootFS mounted on SD:

root@smarc-rzg3e:~# [   35.599061] PM: suspend entry (deep)
[   35.635942] Filesystems sync: 0.033 seconds
[   35.642070] Freezing user space processes
[   35.647741] Freezing user space processes completed (elapsed 0.001 secon=
ds)
[   35.654826] OOM killer disabled.
[   35.658042] Freezing remaining freezable tasks
[   35.663649] Freezing remaining freezable tasks completed (elapsed 0.001 =
seconds)
[   35.671047] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[   35.722047] libphy: #######phy_suspend 1908
[   35.722082] ########kszphy_suspend 2350
[   35.722142] renesas-gbeth 15c30000.ethernet eth0: Link is Down
[   35.722823] ########kszphy_suspend 2356
[   35.723183] ########kszphy_generic_suspend 2343
[   35.723215] libphy: #######phy_suspend 1925
[   35.730939] Disabling non-boot CPUs ...
[   35.734909] psci: CPU3 killed (polled 4 ms)
[   35.741526] psci: CPU2 killed (polled 0 ms)
[   35.746911] psci: CPU1 killed (polled 4 ms)
[   35.749344] Enabling non-boot CPUs ...
[   35.749557] Detected VIPT I-cache on CPU1
[   35.749601] GICv3: CPU1: found redistributor 100 region 0:0x000000001496=
0000
[   35.749639] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[   35.750293] CPU1 is up
[   35.750385] Detected VIPT I-cache on CPU2
[   35.750406] GICv3: CPU2: found redistributor 200 region 0:0x000000001498=
0000
[   35.750427] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[   35.750879] CPU2 is up
[   35.750973] Detected VIPT I-cache on CPU3
[   35.750993] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a=
0000
[   35.751015] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   35.751483] CPU3 is up
[   35.754875] ########kszphy_resume 2389
[   35.754887] CPU: 1 UID: 0 PID: 281 Comm: systemd-sleep Not tainted 6.16.=
0-rc4-next-20250703-gf2ebaf5365aa-dirty #63 PREEMPT
[   35.754895] Hardware name: Renesas SMARC EVK version 2 based on r9a09g04=
7e57 (DT)
[   35.754898] Call trace:
[   35.754902]  show_stack+0x18/0x24 (C)
[   35.754917]  dump_stack_lvl+0x78/0x90
[   35.754927]  dump_stack+0x18/0x24
[   35.754933]  kszphy_resume+0x3c/0xf0
[   35.754940]  phy_resume+0x3c/0x74
[   35.754949]  phylink_prepare_resume+0x58/0xa0
[   35.754957]  stmmac_resume+0x90/0x2a0
[   35.754967]  stmmac_pltfr_resume+0x3c/0x4c
[   35.754974]  device_resume+0x108/0x1ec
[   35.754983]  dpm_resume+0x198/0x1b8
[   35.754990]  dpm_resume_end+0x20/0x38
[   35.754996]  suspend_devices_and_enter+0x4a8/0x58c
[   35.755006]  pm_suspend+0x180/0x20c
[   35.755011]  state_store+0x80/0xec
[   35.755017]  kobj_attr_store+0x18/0x2c
[   35.755023]  sysfs_kf_write+0x7c/0x94
[   35.755031]  kernfs_fop_write_iter+0x120/0x1ec
[   35.755037]  vfs_write+0x238/0x370
[   35.755045]  ksys_write+0x6c/0x100
[   35.755051]  __arm64_sys_write+0x1c/0x28
[   35.755056]  invoke_syscall+0x48/0x110
[   35.755065]  el0_svc_common.constprop.0+0xc0/0xe0
[   35.755072]  do_el0_svc+0x1c/0x28
[   35.755078]  el0_svc+0x34/0xf0
[   35.755086]  el0t_64_sync_handler+0xa0/0xe4
[   35.755093]  el0t_64_sync+0x198/0x19c
[   35.755099] ########kszphy_generic_resume 2328
[   35.757673] ########kszphy_resume 2413
[   35.766674] dwmac4: Master AXI performs fixed burst length
[   35.767591] renesas-gbeth 15c30000.ethernet eth0: No Safety Features sup=
port found
[   35.767611] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advance=
d Timestamp supported
[   35.771205] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rg=
mii-id link mode
[   35.771221] ########kszphy_resume 2389
[   35.771227] CPU: 1 UID: 0 PID: 281 Comm: systemd-sleep Not tainted 6.16.=
0-rc4-next-20250703-gf2ebaf5365aa-dirty #63 PREEMPT
[   35.771234] Hardware name: Renesas SMARC EVK version 2 based on r9a09g04=
7e57 (DT)
[   35.771236] Call trace:
[   35.771238]  show_stack+0x18/0x24 (C)
[   35.771245]  dump_stack_lvl+0x78/0x90
[   35.771252]  dump_stack+0x18/0x24
[   35.771258]  kszphy_resume+0x3c/0xf0
[   35.771263]  __phy_resume+0x28/0x54
[   35.771270]  phy_start+0x7c/0xb4
[   35.771275]  phylink_start+0xb8/0x210
[   35.771282]  phylink_resume+0x7c/0xc4
[   35.771288]  stmmac_resume+0x1ec/0x2a0
[   35.771296]  stmmac_pltfr_resume+0x3c/0x4c
[   35.771303]  device_resume+0x108/0x1ec
[   35.771309]  dpm_resume+0x198/0x1b8
[   35.771316]  dpm_resume_end+0x20/0x38
[   35.771322]  suspend_devices_and_enter+0x4a8/0x58c
[   35.771329]  pm_suspend+0x180/0x20c
[   35.771334]  state_store+0x80/0xec
[   35.771340]  kobj_attr_store+0x18/0x2c
[   35.771345]  sysfs_kf_write+0x7c/0x94
[   35.771351]  kernfs_fop_write_iter+0x120/0x1ec
[   35.771356]  vfs_write+0x238/0x370
[   35.771363]  ksys_write+0x6c/0x100
[   35.771368]  __arm64_sys_write+0x1c/0x28
[   35.771374]  invoke_syscall+0x48/0x110
[   35.771381]  el0_svc_common.constprop.0+0xc0/0xe0
[   35.771388]  do_el0_svc+0x1c/0x28
[   35.771394]  el0_svc+0x34/0xf0
[   35.771401]  el0t_64_sync_handler+0xa0/0xe4
[   35.771407]  el0t_64_sync+0x198/0x19c
[   35.771412] ########kszphy_generic_resume 2328
[   35.773979] ########kszphy_resume 2413
[   36.018701] SDHI2-VQMMC: disabling
[   36.228208] OOM killer enabled.
[   36.231349] Restarting tasks: Starting
[   36.235635] Restarting tasks: Done
[   36.239154] random: crng reseeded on system resumption
[   36.244473] PM: suspend exit

root@smarc-rzg3e:~# [   38.520643] renesas-gbeth 15c30000.ethernet eth0: Li=
nk is Up - 1Gbps/Full - flow control rx/tx

2) Detailed logs NON working case RootFS mounted on NFS:
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[   21.156070] libphy: #######phy_suspend 1908
[   21.156109] ########kszphy_suspend 2350
[   21.156161] renesas-gbeth 15c30000.ethernet eth0: Link is Down
[   21.156788] ########kszphy_suspend 2356
[   21.157144] ########kszphy_generic_suspend 2343
[   21.157174] libphy: #######phy_suspend 1925
[   21.165512] Disabling non-boot CPUs ...
[   21.169679] psci: CPU3 killed (polled 4 ms)
[   21.180952] psci: CPU2 killed (polled 0 ms)
[   21.188027] psci: CPU1 killed (polled 0 ms)
[   21.190677] Enabling non-boot CPUs ...
[   21.190883] Detected VIPT I-cache on CPU1
[   21.190929] GICv3: CPU1: found redistributor 100 region 0:0x000000001496=
0000
[   21.190967] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[   21.191653] CPU1 is up
[   21.191748] Detected VIPT I-cache on CPU2
[   21.191769] GICv3: CPU2: found redistributor 200 region 0:0x000000001498=
0000
[   21.191789] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[   21.192225] CPU2 is up
[   21.192321] Detected VIPT I-cache on CPU3
[   21.192341] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a=
0000
[   21.192362] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   21.192879] CPU3 is up
[   21.197553] ########kszphy_resume 2389
[   21.197566] CPU: 3 UID: 0 PID: 288 Comm: systemd-sleep Not tainted 6.16.=
0-rc4-next-20250703-gf2ebaf5365aa-dirty #63 PREEMPT
[   21.197574] Hardware name: Renesas SMARC EVK version 2 based on r9a09g04=
7e57 (DT)
[   21.197578] Call trace:
[   21.197581]  show_stack+0x18/0x24 (C)
[   21.197595]  dump_stack_lvl+0x78/0x90
[   21.197606]  dump_stack+0x18/0x24
[   21.197612]  kszphy_resume+0x3c/0xf0
[   21.197619]  phy_resume+0x3c/0x74
[   21.197628]  phylink_prepare_resume+0x58/0xa0
[   21.197636]  stmmac_resume+0x90/0x2a0
[   21.197646]  stmmac_pltfr_resume+0x3c/0x4c
[   21.197653]  device_resume+0x108/0x1ec
[   21.197663]  dpm_resume+0x198/0x1b8
[   21.197669]  dpm_resume_end+0x20/0x38
[   21.197675]  suspend_devices_and_enter+0x4a8/0x58c
[   21.197684]  pm_suspend+0x180/0x20c
[   21.197689]  state_store+0x80/0xec
[   21.197695]  kobj_attr_store+0x18/0x2c
[   21.197702]  sysfs_kf_write+0x7c/0x94
[   21.197709]  kernfs_fop_write_iter+0x120/0x1ec
[   21.197714]  vfs_write+0x238/0x370
[   21.197723]  ksys_write+0x6c/0x100
[   21.197729]  __arm64_sys_write+0x1c/0x28
[   21.197735]  invoke_syscall+0x48/0x110
[   21.197743]  el0_svc_common.constprop.0+0xc0/0xe0
[   21.197749]  do_el0_svc+0x1c/0x28
[   21.197756]  el0_svc+0x34/0xf0
[   21.197763]  el0t_64_sync_handler+0xa0/0xe4
[   21.197770]  el0t_64_sync+0x198/0x19c
[   21.197776] ########kszphy_generic_resume 2328
[   21.200350] ########kszphy_resume 2413
[   21.209338] dwmac4: Master AXI performs fixed burst length
[   21.210253] renesas-gbeth 15c30000.ethernet eth0: No Safety Features sup=
port found
[   21.210273] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advance=
d Timestamp supported
[   21.213870] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rg=
mii-id link mode
[   21.213886] ########kszphy_resume 2389
[   21.213891] CPU: 3 UID: 0 PID: 288 Comm: systemd-sleep Not tainted 6.16.=
0-rc4-next-20250703-gf2ebaf5365aa-dirty #63 PREEMPT
[   21.213897] Hardware name: Renesas SMARC EVK version 2 based on r9a09g04=
7e57 (DT)
[   21.213900] Call trace:
[   21.213902]  show_stack+0x18/0x24 (C)
[   21.213909]  dump_stack_lvl+0x78/0x90
[   21.213917]  dump_stack+0x18/0x24
[   21.213922]  kszphy_resume+0x3c/0xf0
[   21.213928]  __phy_resume+0x28/0x54
[   21.213935]  phy_start+0x7c/0xb4
[   21.213940]  phylink_start+0xb8/0x210
[   21.213948]  phylink_resume+0x7c/0xc4
[   21.213955]  stmmac_resume+0x1ec/0x2a0
[   21.213962]  stmmac_pltfr_resume+0x3c/0x4c
[   21.213969]  device_resume+0x108/0x1ec
[   21.213976]  dpm_resume+0x198/0x1b8
[   21.213982]  dpm_resume_end+0x20/0x38
[   21.213988]  suspend_devices_and_enter+0x4a8/0x58c
[   21.213995]  pm_suspend+0x180/0x20c
[   21.214001]  state_store+0x80/0xec
[   21.214006]  kobj_attr_store+0x18/0x2c
[   21.214011]  sysfs_kf_write+0x7c/0x94
[   21.214018]  kernfs_fop_write_iter+0x120/0x1ec
[   21.214023]  vfs_write+0x238/0x370
[   21.214030]  ksys_write+0x6c/0x100
[   21.214035]  __arm64_sys_write+0x1c/0x28
[   21.214041]  invoke_syscall+0x48/0x110
[   21.214048]  el0_svc_common.constprop.0+0xc0/0xe0
[   21.214055]  do_el0_svc+0x1c/0x28
[   21.214062]  el0_svc+0x34/0xf0
[   21.214068]  el0t_64_sync_handler+0xa0/0xe4
[   21.214074]  el0t_64_sync+0x198/0x19c
[   21.214080] ########kszphy_generic_resume 2328
[   21.216646] ########kszphy_resume 2413
[   22.661587] OOM killer enabled.
[   22.668623] Restarting tasks: Starting

[   22.673694] Restarting tasks: Done
[   22.677226] random: crng reseeded on system resumption
[   22.682799] PM: suspend exit
root@smarc-rzg3e:~# [   23.801866] renesas-gbeth 15c30000.ethernet eth0: Li=
nk is Up - 1Gbps/Full - flow control rx/tx

3) Detailed logs working case RootFS mounted on NFS with patch[1] above:

root@smarc-rzg3e:~# [   20.859463] PM: suspend entry (deep)
[   20.863297] Filesystems sync: 0.000 seconds
[   20.870616] Freezing user space processes
[   20.876719] Freezing user space processes completed (elapsed 0.001 secon=
ds)
[   20.883685] OOM killer disabled.
[   20.886912] Freezing remaining freezable tasks
[   20.892475] Freezing remaining freezable tasks completed (elapsed 0.001 =
seconds)
[   20.899863] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[   20.953817] libphy: #######phy_suspend 1908
[   20.953853] ########kszphy_suspend 2350
[   20.953912] renesas-gbeth 15c30000.ethernet eth0: Link is Down
[   20.954530] ########kszphy_suspend 2356
[   20.954880] ########kszphy_generic_suspend 2343
[   20.954911] libphy: #######phy_suspend 1925
[   20.963329] Disabling non-boot CPUs ...
[   20.967649] psci: CPU3 killed (polled 0 ms)
[   20.975948] psci: CPU2 killed (polled 0 ms)
[   20.984986] psci: CPU1 killed (polled 0 ms)
[   20.990162] Enabling non-boot CPUs ...
[   20.990375] Detected VIPT I-cache on CPU1
[   20.990419] GICv3: CPU1: found redistributor 100 region 0:0x000000001496=
0000
[   20.990456] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[   20.991154] CPU1 is up
[   20.991248] Detected VIPT I-cache on CPU2
[   20.991269] GICv3: CPU2: found redistributor 200 region 0:0x000000001498=
0000
[   20.991289] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[   20.991736] CPU2 is up
[   20.991833] Detected VIPT I-cache on CPU3
[   20.991854] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a=
0000
[   20.991875] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   20.992378] CPU3 is up
[   21.068746] dwmac4: Master AXI performs fixed burst length
[   21.069681] renesas-gbeth 15c30000.ethernet eth0: No Safety Features sup=
port found
[   21.069701] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advance=
d Timestamp supported
[   21.073298] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rg=
mii-id link mode
[   21.073315] ########kszphy_resume 2389
[   21.073325] CPU: 1 UID: 0 PID: 285 Comm: systemd-sleep Not tainted 6.16.=
0-rc4-next-20250703-gf2ebaf5365aa-dirty #64 PREEMPT
[   21.073332] Hardware name: Renesas SMARC EVK version 2 based on r9a09g04=
7e57 (DT)
[   21.073336] Call trace:
[   21.073340]  show_stack+0x18/0x24 (C)
[   21.073354]  dump_stack_lvl+0x78/0x90
[   21.073364]  dump_stack+0x18/0x24
[   21.073370]  kszphy_resume+0x3c/0xf0
[   21.073377]  __phy_resume+0x28/0x54
[   21.073385]  phy_start+0x7c/0xb4
[   21.073390]  phylink_start+0xb8/0x210
[   21.073398]  phylink_resume+0x7c/0xc4
[   21.073404]  stmmac_resume+0x1ec/0x2a0
[   21.073413]  stmmac_pltfr_resume+0x3c/0x4c
[   21.073420]  device_resume+0x108/0x1ec
[   21.073429]  dpm_resume+0x198/0x1b8
[   21.073435]  dpm_resume_end+0x20/0x38
[   21.073441]  suspend_devices_and_enter+0x4a8/0x58c
[   21.073450]  pm_suspend+0x180/0x20c
[   21.073456]  state_store+0x80/0xec
[   21.073462]  kobj_attr_store+0x18/0x2c
[   21.073469]  sysfs_kf_write+0x7c/0x94
[   21.073476]  kernfs_fop_write_iter+0x120/0x1ec
[   21.073481]  vfs_write+0x238/0x370
[   21.073489]  ksys_write+0x6c/0x100
[   21.073496]  __arm64_sys_write+0x1c/0x28
[   21.073502]  invoke_syscall+0x48/0x110
[   21.073510]  el0_svc_common.constprop.0+0xc0/0xe0
[   21.073517]  do_el0_svc+0x1c/0x28
[   21.073523]  el0_svc+0x34/0xf0
[   21.073531]  el0t_64_sync_handler+0xa0/0xe4
[   21.073537]  el0t_64_sync+0x198/0x19c
[   21.073543] ########kszphy_generic_resume 2328
[   21.076110] ########kszphy_resume 2413
[   22.393352] OOM killer enabled.
[   22.400389] Restarting tasks: Starting

[   22.405808] Restarting tasks: Done
[   22.409360] random: crng reseeded on system resumption
[   22.414809] PM: suspend exit
root@smarc-rzg3e:~# [   23.786523] renesas-gbeth 15c30000.ethernet eth0: Li=
nk is Up - 1Gbps/Full - flow control rx/tx
[   24.929734] 8021q: 802.1Q VLAN Support v1.8
[   24.934021] 8021q: adding VLAN 0 to HW filter on device eth0


Cheers,
Biju



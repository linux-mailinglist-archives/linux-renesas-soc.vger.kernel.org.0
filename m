Return-Path: <linux-renesas-soc+bounces-25641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E4CAC6DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 08:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6093F304FFCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 07:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD7E2D7395;
	Mon,  8 Dec 2025 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CPpYUgjc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FEC2D5C8E;
	Mon,  8 Dec 2025 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765180229; cv=fail; b=Dr0C1OP3A26zEvkvZe0NoVX8K9BIF/+7kpqb1IA9gMK0nRwYmP2y8+UjiZlzi3lNbermE7ed+W6vcBjqhsDEFtEE8n00yQQoOIBKy5BgivaroJcUamN54JjhVdfRTFS9mj0n1+73lAtk2rG2Ch4+BFXVSVh8wlcuSsgYUkEw2ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765180229; c=relaxed/simple;
	bh=8iKjf2Zikpdrr1jes6MH850BbUa+avTk+X2qpyGpsU0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oxICnRUh+cDgs6BoaPCqCWM/L7tYVDlP3VcJpqaT4uUwSzcF/hVO+8nRLQ/WKA2OaydClTwiZReemumhw5es+Q0cBW7H76peWLa3iZcQMEmt/M3zzC0/o8y2PysPPci6451PAwvPs4gffFnYcWG5PEuAvw4zi7xNKNQ2VCACoAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CPpYUgjc; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOexyaPudZgyuy6D5qG+ZI2pGhU4LBomXy6zNptR5MIGRl5nr92avSpzUIj6GKcgSRWhV1UT/nyoNb4QSnorFAMSKJP6oYYpdQEW9zJ6JB1f2o3dPSiFOuGD04RVlpCUgu1ioBHWXvTzMzdsAPVtF6yzfmcXw+ZufDFbj4fY8P5zti767UKM2PrFrOefLk/SoyWP9lhuruIyigmBZfCyCGHlqz7i51ljtO9zOpl1AZa7xZJeFLrRppOU+MVEDa8Dd6SMpZYr7aq/fFbz6bUPcxxqQcqbBx97EGyJstTuM2Gr3JVYYSe8RyaYl6eUZvaX5NMUFeKczijMhttOiDmsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkMpUXYq5alm/DdLFF18n3p7pfhwYvD8pY6SkQ1BmS4=;
 b=OBKG0lNVqgHcpGJ5G0Kh22OlmIQlvILdOjj+p3pGIeetVarwjAfB1mDHLHSU2BOo5+0H//EyHzveGCDeuY1FOSn6XZzAbrQ/uKveHv+fbWIRi/5mvP78H6UDgEuzNaQVhzWwpa7ZyA6m9nuV1I+WBarnram50H96UgtofTaUo5rkQ/Wy6jE6spP0++7L9skStsuUbgay9dEqjnj1mY0YElGm2+LjlmEdQJK5PcYnXwBcda7c73Ck8zGw88wWuqodp+mp6bK2CTcwsPgRYcsta5KreV8dhQK6QmxHRYQTIH5DRANwhNdH1TdgHq1WHNbkn4C2S4trrd5CgzZ7NArWyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkMpUXYq5alm/DdLFF18n3p7pfhwYvD8pY6SkQ1BmS4=;
 b=CPpYUgjc9Ts6e2cF2on217lyV+aEmKVOXVKjfrYp+ogUGRjbykr/ckqzMfGdjrEVyKRQP1iq+I28CexzCmDotC3cQlX9sb/9eYR9zNfh8sOTMUpiT5foO9UX1FFu/2cCB7sk7PTypsZxEseZ/efyNwiO3pxGzfeuKmzWjeifF/w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11655.jpnprd01.prod.outlook.com (2603:1096:400:3dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Mon, 8 Dec
 2025 07:50:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9412.005; Mon, 8 Dec 2025
 07:50:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>, biju.das.au
	<biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Topic: [PATCH 0/2] usb: host: Drop resume calls on
 {e,o}hci_platform_suspend()
Thread-Index: AQHcZ3fosvRmsVoD4EmZfZBInM+QcLUWYDsAgAD36rA=
Date: Mon, 8 Dec 2025 07:50:18 +0000
Message-ID:
 <TY3PR01MB1134603CBC4385178E2E57E3886A2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
 <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
In-Reply-To: <db985cbf-4813-44d1-a4c6-16826f935c17@rowland.harvard.edu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11655:EE_
x-ms-office365-filtering-correlation-id: 25c1d35e-30b6-4789-c97d-08de362e6ee7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?twf//p8WVreN88fIufINI8TJSrwPQaR+1prKTa/4mgghOXrFuF+JrwTaK0+8?=
 =?us-ascii?Q?Xabls/522XZmX7gK/Vi0Ztj9atGjjnnXwzU7WhtCtm1fKRdzFSDy56+gjkAo?=
 =?us-ascii?Q?fBRUsoaju2fIg3C1sm0982a2o1vM4UG1OMdgoUVXBJo8CKgcVtgEaRJ8OeOa?=
 =?us-ascii?Q?AHuWtDDUoKIu847ambQcuvysGq8TvR4QcHOU8zOxbVJKOae9BboaRdlVWh2A?=
 =?us-ascii?Q?nzs0CJe0rh3v0xj3Iqu2TxuihbRVhU0AYdq9P1sfHEj2yAjdLoF9LLtMjgGE?=
 =?us-ascii?Q?jT3iCZIiVdU9ebV3TpM4Ro4m76r2cUbiQJ6OyjvryhKyWvdOa+krUJUPXrzE?=
 =?us-ascii?Q?eNBa5IOwFl1m8JzLXBPfeFPG0LBm5kL9QCQPqXaZ9RUip4REC09QcHb3/7uG?=
 =?us-ascii?Q?0OT79fLaMpmGlLBpC93KjKyHkkKdfNz+gerunNGGGJAzr3hUB21gMc+LkPSg?=
 =?us-ascii?Q?1gsViW6urFvYc6nc3/Rt8Vgs/tkantbzaIVdZ+9PCZQA3nRs+fgnoSsWizLe?=
 =?us-ascii?Q?mLKItqNhiOHwqXoyN5vVNKlX5SVklgpeMre3IR4gM1og3SzxKy/Iaww39q2d?=
 =?us-ascii?Q?GFZKeGQQBfkH5It2VYHHrZY3TnbQQa7yz+8Vi7zhlNp1fAnN2pIsdJ/UL2bZ?=
 =?us-ascii?Q?csyC2aIazilCjsolsLukixMIAsdSW8Y9OnQy46hsrLXGRnYSRm0A7ZfVkYkm?=
 =?us-ascii?Q?gls5HUiNZfO9JnTq9PheF2lAtGdzME+U+/r5r0xgWiUiD6IQQQaOXZwoXvAk?=
 =?us-ascii?Q?DMmVRcfNxGUxPtF4YGgMzfGZeyX4RhZhiFK89eZG5BNcpu06XeD3xLBKQazG?=
 =?us-ascii?Q?T/EdllK8cw7bOfhfBfsaqRfBqFAd09LUy5kbzMWmvgDdWEiq3iXWf5AMFvhw?=
 =?us-ascii?Q?AWHsO205EjbzViAqMYlDPErlLBAsnbfIFxofnJjJX4Te2eawugoAxKDKkXcU?=
 =?us-ascii?Q?4A1oJ2nxC+r+hDL/znxNb+GC3sfQy8v6mOtb4hASjYpL7Xyfkph9EUp5dxvw?=
 =?us-ascii?Q?zrAfWIT01sFGoVxDc0StDgv9uQRjLu9XqUEw0MDENQZdHMOboMQ0BpTBizPG?=
 =?us-ascii?Q?4JpknhjKlVnAuaxpWVmSA4ejUl2LbZ1DSZ7va2NtzNK4Ie/OQohGyF2gI8Fi?=
 =?us-ascii?Q?E5xgxNQxMiE/oL92qklo+ltoPM9r8Zka33nKvNXFuBJRxx+0geViRnQr2Edx?=
 =?us-ascii?Q?3LWqODpr3DwQ7MFI+gciYlkJmdY7GXte8BDfvROw/hrmlADwrIrRAG4mCquT?=
 =?us-ascii?Q?WniAaZNji/X7Dj2OrpuweL2AqBLAwvw3E+5Vx0Bl7U43z/NTPgx+iPn45gta?=
 =?us-ascii?Q?DuFtiYxXtIe3ndg2ZKFWCbNcGsqE+APo8xdddWaY/BnCNNB0w6cpE9Gm22aB?=
 =?us-ascii?Q?VKdBJVsyF9Nmjwot/riJkHrSMQz1Gdw7caLc44LZvU/amWtMW1tBx6OY8l01?=
 =?us-ascii?Q?hs9gqdotVIqUnNA4mStd8ucD4cX4bUAM7WL8Rg9FHYbmxbOdd/9HhlNDGR8g?=
 =?us-ascii?Q?vWtUXZXwgepllI/Fjpd58+S39uwKVkcDOoMo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9CLmavZgVYTx+dAmBPeRrZrubQxkExV2wsrEZqVHVq8BrmukeeHEc3cRv9K9?=
 =?us-ascii?Q?bkXYhf1MwmTgfkHXVyilyZK/pKaoC0wNwE5a0pkXTkydLfmR9uqrUiH8qkSC?=
 =?us-ascii?Q?I6sKa7TqN+3pyaRBunOMjbS/TSkSGLOW5+sVDZwRETRoLTx5zOFc4OiuMZH0?=
 =?us-ascii?Q?Ew5tipserfboKwASkkmG8b32LtvdbWobDD4HjLyTCpK/LutbAKYM7bFduRuO?=
 =?us-ascii?Q?cZsQH6Il5kGhzHVFSGu05lOYka+/GehYATY1i5OHT0io4gyHw/U1ugGhSHnu?=
 =?us-ascii?Q?VWcKl1cfSdkx9BK7+OdYm0nl1sNEf8CchtZ7RGQd1e83eDl0WAfXcWg6MzL2?=
 =?us-ascii?Q?bnHN3lIBcnbPUZ/YOuJtpI/OBggGEN8p6EhMFTNbgE+FWYg8m/PQlReJRAtC?=
 =?us-ascii?Q?N5EqK0HyK4WZcb6QTy4tN53Qy5hWHuURM1kJ1Yu3MRoYpe7t8Jz7ceFuCjKS?=
 =?us-ascii?Q?TbFVcjs1S9SpopyLeTM05s8r7Q00t9DJWfbWfP9w+4rRI6z7fqEGpgA5n5Ea?=
 =?us-ascii?Q?mjMqm5x4g5R45B3OcZg73W8WVrCV/oT1KdlPocixQLJBjNh8IVgIaRlN/RXi?=
 =?us-ascii?Q?gIbAILPMhxgoTM44QDaKha+nc0TgrQpP7QlOoy0Atnre6js/txGR/nPanpyP?=
 =?us-ascii?Q?TNe/Sfvo+9R70H4mVbQlyPvKvLECdXQEmaDcrGBsWSEIlk0+mo0c6TreT9Rg?=
 =?us-ascii?Q?ZytMBQ8IomkZXxV4VuTNCdmGOAN5SzK04IGxyn9KGrf7x58gDLc9EGMnVEnc?=
 =?us-ascii?Q?KCBqt7sR+tvga0qAzsUHg3ZV0EI5IIBDcgKgZQVSQWc6CkfXlL74OweNGooe?=
 =?us-ascii?Q?nNFi5/v72VrlONUgiBj3BU7J0CJCjGUS73/p3wR3yGZbhkcwx/aWRoNnbEu3?=
 =?us-ascii?Q?VldBF8+prdgmKabmXJRu2te2Lki4e76GZuJImGprPD61ia9PGHDR+jCDaIcq?=
 =?us-ascii?Q?bhEp7JKZzIwErNlKc08NUUO3qoqTgl67c7LZOpsB1gu1gtuDQSt/aNwNBErP?=
 =?us-ascii?Q?OhApBXuAxteoeijy3TzgTJFFH6BNGDGRIlpcPNEu0Cuv0tUjGplB3fiX87Jb?=
 =?us-ascii?Q?3X/TchFXdfTgESQgXmQpy9vloQSQfFgYUsZfjDZ8Ux5hDh1AoMW0FpCCmhch?=
 =?us-ascii?Q?jW1u8wrm8hWzYXFzisZHrSKKC7nS12kSJDR4m6CZV+EwXPYP0FlanX7HCbE7?=
 =?us-ascii?Q?SYWWHcV053GYNp8fIISOP9fZL9/ye7tQneKfRPS1C7LcQcrwo1FaD1pwdZC3?=
 =?us-ascii?Q?S8FfiDN91/3GO9tOOLkXzNgz54V+2vHD8sexwo5T0MHzUys28vxTa7y23bHq?=
 =?us-ascii?Q?BN2YNYy04G+bG3UmwmLSYThh+Ij/601arXcWPF+YFuDhIMPsTdMJdDQPn27L?=
 =?us-ascii?Q?Xmpal+YZH3d5y+/jxiJWgZHqlu+em+R38koogeyKdkB747qcncL7KAeZTk/5?=
 =?us-ascii?Q?bG/f5y45mZURuoKse2+uMrKVDxz5zrUUB3n1FUM/CB3cgZkrI2cyOj0DomdW?=
 =?us-ascii?Q?976dbdyisqBpMRSAZ+s8lBFWk2qKuOPnFkkeIlV1VMDcpqIWKMkaf8Bwn82w?=
 =?us-ascii?Q?vWe5t4WjTzCOYg+4RWHuHgvpGeIYwQIIKTUpVEYVkDAjjTRoTRSmeAOURZeL?=
 =?us-ascii?Q?1Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c1d35e-30b6-4789-c97d-08de362e6ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 07:50:19.0114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4uAym/o8eJp9T78QL3eFO4FV/uWYztjoS1HZi2KNPMfB52UwsrJ+BRdYkYDllOJREKDkHQtfDBEYHqRnDZ1zUXbB51LWpsAswbP9bSHOeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11655

Hi Alan Stern,

> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: 07 December 2025 16:36
> Subject: Re: [PATCH 0/2] usb: host: Drop resume calls on {e,o}hci_platfor=
m_suspend()
>=20
> On Sun, Dec 07, 2025 at 12:47:25PM +0000, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > As per the suspend_devices_and_enter() [1], if .suspend() fails, it
> > invoke the .resume() callback.
>=20
> Quite wrong.  If .suspend() fails, the core assumes the device is still a=
t full power.  It does not
> try to resume the device.

But now in ehci/ohci suspend() is calling ehci_resume without checking the =
status of reset_deassert
that can lead to synchronous abort and reboot is the only way to recover.

For the reset_assert failure cases in suspend(),

Case 1) Exclusive reset assert, reset register bit set to assert, but statu=
s bit is not set, so we get timeout error
	  The following access to ehci registers can lead to synchronous abort.

Case 2) Array reset assert, reset register bit is set to deassert, but we a=
re not checking the status bit
        and if the device not transitioned to deassert state, then that can=
 lead to synchronous abort

I guess we should explicirtly call reset_control_deassert(priv->rsts) to ma=
ke sure
the device is in deasserted state before calling ehci_resume().

I may be wrong. Please correct me if I am wrong.

Cheers,
Biju





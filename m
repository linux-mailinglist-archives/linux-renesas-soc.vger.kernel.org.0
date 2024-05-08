Return-Path: <linux-renesas-soc+bounces-5223-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA728BF6D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 09:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9961F22837
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2024 07:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81DF1F937;
	Wed,  8 May 2024 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RGLREkv4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2D717C72
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 May 2024 07:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715152582; cv=fail; b=k7rnPGls8M9dEbaQC4U8An7AHbA3bT1V/N8ha2f2YO1rlGS/PRjb0X9aNQfeB1W8AbgPfIudSjkSTekqCcP3ubdKcMRUMdXFQHur2/vLTLa5UY8kU127+3UJ6BvrxHkYzfLinyfvjq7lgvJZbrcjY+Y3qeu82Di6TeH+EcCLEbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715152582; c=relaxed/simple;
	bh=tOyNdtMjmTICaIkZhVwzJc+leTkAaVo1NGDue8Gw5u0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K1FuY+YqxMZJsnLHF/eYEja+C4F2WCql7eP2TpxLZ6gFf0LbpRA9e0hHIkuhB8RA7YaoxhSRFqVVk6/Zglr97E/kRuDAxwXjPYi22Iit/NvJPQvkkddhMXERbwDBDCApAJrIVv2GKmXV4yuPRyhWeim/8f/u8VUKZ9duEwuTBvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RGLREkv4; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCQuAlWitfIEkCMqbgUmIUynlzyVCUH7s0lV2hNvwBJs8gYic6zloHfwbybOmE8JTT8mmMKycqytHlqE4TKHmDyDfAlQuhhA+kLu19OybLBJYle3wigTT1h5cwA5AUPUm6lpPG2/MRwDgWNkE5yp6X+jmnw0xbjIA06SPiH6mo0B+NcJxZvUA/L8lrSJFdsGL46E6GbvRiLmo4bXu+06OLpcAYw++pEUTzhGA1O9pDRd0589Jjsm6LPrJkyPXyNkabD+ahAAwUiFeyNbUSM7fLwSwl4bpieNAceJZnLFzvxTmjBhGrI39TlRmomn49V9sT+ad3Bl65s9YO0vzQ7pNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3AhjM1dvPHBVUSln/p67qI4hdRpoxuDpmisjMB7les=;
 b=l/4GPZGFNegGuNfIAc1qUa1E2yWL6XKY/DHF3OvW/4AJYHqV8NKiknkGzVQcTAWRnnnoyzE+ESpcvHQ3QDI8i392Cp6dspphvhrqwIfBlp7F7Feib/h+7yzQKBCO0FIYXcEFwoisniHEw5RNIaQ/xX7opEtMWW3pxRrAUGReOzkJ4huAo8CnHoefciFq8dNNsXORcmJI6UUvNCoHE+OFB9Y9rRffNnCpIFCbY7xj8zXldQ+u7japUDWpuIcKQixd45P8uMRqUd2y1UC0wKBjYuqI1vNKI9CCuXwX+OmI1KM1fP95NMfGvrB0USV37WtwLIiYYAFYO1/YDr2KBfmh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3AhjM1dvPHBVUSln/p67qI4hdRpoxuDpmisjMB7les=;
 b=RGLREkv42HEaUqGbacIYibDQpR6oxPV7lkV8mD9I3TAjFwfQWDunX+E1GKpYBmqmOEAfSdJ6i/fwbd4+DAbrv0ThLn83y/Q7TAIQ5pnZiNMKTYZrbRtafEZvvwIor+HssFdlN65WGbVQCSrrFd4rJd0TOa/J0JLaHeuY4U+LKW4=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYAPR01MB5513.jpnprd01.prod.outlook.com (2603:1096:404:803f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 07:16:15 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::11c0:4ed:1ee4:d774]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::11c0:4ed:1ee4:d774%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 07:16:15 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC 0/8] Add R-Car fuse support
Thread-Topic: [PATCH/RFC 0/8] Add R-Car fuse support
Thread-Index: AQHanHcdVChXo0xnuEyxLpC3DsPj2bGM8hXA
Date: Wed, 8 May 2024 07:16:15 +0000
Message-ID:
 <TYCPR01MB110401C5A8E83DF946DA83760D8E52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <cover.1714642390.git.geert+renesas@glider.be>
In-Reply-To: <cover.1714642390.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYAPR01MB5513:EE_
x-ms-office365-filtering-correlation-id: 241f3158-010b-4020-aafe-08dc6f2ebfdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JGYhm9uOMzmjjKAxfz6d504AdXKGk68Sxk7mP+EqZ+pwhe2UDd9dsNbeK+yL?=
 =?us-ascii?Q?e7BYUtttjXhqGIqBVww07onNY3elgSywUxD/qaO+MVp3mML7SYd6qF+DhDzy?=
 =?us-ascii?Q?WNnEWgWGCv+xo1pvnrQ3R+SN/w0x5YzzdvdtWk1CKqOsUw/wqhpvv3nrFZf1?=
 =?us-ascii?Q?Anw4foOdP+mFHJUHS888oJeUAun5Ru3Rq27q684Hr21YNwtrIT9hDH70Lhvl?=
 =?us-ascii?Q?1PL5dFNb591a3fDcztbruM+0MfLTHBi6gJbnkuOT1l5hjzrns+mHF0qVVAgw?=
 =?us-ascii?Q?dBrau8jkWdCR3zLWCNcPF7AkOsU0G16qTIUtuyMLdfpLhRlBzWlwXnIFCtjy?=
 =?us-ascii?Q?ufOhJzz4nRBH2mn1bf65OtA4noeZo4Z/gLkWfMTOAlsUvXCOBbVbL3ZK2JMC?=
 =?us-ascii?Q?pRfSoIRg2POQ/fnrcvnahmJolNuED8MDeH6+vugXar9+kQVlUptsf0Afejgh?=
 =?us-ascii?Q?g8dmvS5ePwWg7FWpvnHxRfNUj39ZT8OLeZDVCRZ6e/Q/2Vk67wJzl7g1H7b8?=
 =?us-ascii?Q?zrziLmCUTSYSDQR8UTZn8D1oL6WwOvvafwcIeGAjvLQnbVxasV9lgGhD6Wt7?=
 =?us-ascii?Q?LDyDri2ge//KoQPiiJ/B2mHa/np3SLSDGQffWbTi1VRNPZEnCctYeBZq4ETP?=
 =?us-ascii?Q?TrCO5+PQdGFDA8FcP1aLuro+DCsIsRlxqrKBgFZt/Bsi59Nv17ZNb3R+legI?=
 =?us-ascii?Q?wWYMmzqNwbZjNCdH7+0aNeIF3YLH65rH0QPb7XGHxnb5jYN8DOOtwvU8I59w?=
 =?us-ascii?Q?oiz1GZK/eXAAQ5q8LM1AdlNdoBfAy2KtK+ST0dRz7eE/p3KMHoKRZyqUWpqy?=
 =?us-ascii?Q?n3k8vPBIIcP+jIn2nYO1LJUN//uLFIwvQ+635Ey3tAv5gfyNlxvf+nplU44Y?=
 =?us-ascii?Q?qDpBHQ8Ap6ynZb1fYR42iUZP93lXMkmqhjnW6dU9YRE0dulEC8oBTMOmAIAq?=
 =?us-ascii?Q?dIX5Ofe9z/mdcArT7K6nEqhZHBfw6zKfGN/jQneCHYqvzVB+ej7jd4/cPgfH?=
 =?us-ascii?Q?gJM7yPVywsR5DLmOpVyMKYiU7R51DWmFRu26m9kbBghmKjBkIFg2Xf5vyZ4y?=
 =?us-ascii?Q?S81Mh7Ir1b9X1uQMGOnwdGvFcdOISPh4HLhFmKtOrqaVBqnuErNVZlKbmrSh?=
 =?us-ascii?Q?mdYyFcFOUCChM4IbGSxj4BJq4DN2Ctb4HvLgT2QvWn/gd/XYdZWPkJTyN/T5?=
 =?us-ascii?Q?+AlAW9Q+DGXLMpPXbiApVKecTcvl0O+GDmZcshxyPN23FWRToB6IWuYjc+I2?=
 =?us-ascii?Q?Z3TdHmS1Uv2BbZduhXIvhSI5yyW6rk9jM/kz/w9b2vI+AyA+FUc9KVbLv4cK?=
 =?us-ascii?Q?1Riyd/owcemWYquP5c8GcZumffiMZid43Zm/K1MuJTJzpg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fHhiGnOJqVgZJwms//m7qwGrFFhdCi1yiaMrY2ihArRHyz9xMz2CnAn107TV?=
 =?us-ascii?Q?jP2C914oBy0SAlbBUxe0HpyTFf8XVORsat7xQH1rT5pxWvNkzy8E0UHDVHcj?=
 =?us-ascii?Q?f3IRkRJ4cGwaYUegKLsK1LqxI0ZsoFaykT5bpdmdlmzktGt3mH9HndL1+Yqj?=
 =?us-ascii?Q?qYX7QsV57oEvCToyNNJdu/r+IQCb1Vi33H5Ekpal9eAFH25Zh80CeDYuvjor?=
 =?us-ascii?Q?dmU5AGSk74eA4aXCGa4ev3QynhWPVGlxB1j04GOZxkof05a8Rq8uABLGLNMg?=
 =?us-ascii?Q?P8iMhZhmcx6UOHSIDl7YRfON5j2R2XxCIjmVSSms9Rpb6lHTnY18ZSBjH+tI?=
 =?us-ascii?Q?Z6YAkrMNPvn9/F/DYlyYhl58mcbMbPork+YZlGW4RQn6hk5EJyJo8VbYPkZb?=
 =?us-ascii?Q?4OIVKPhKAMuwQxKZPSpMdF1n5Zc+UrvAVas3Mv/wEujwx5JQmO0bFy3g92ki?=
 =?us-ascii?Q?RhGeTNN18nwEs9WX3Z1JgjkyEs2QyJ3QoBTmwp0M1xIFP/fSmv94gC1uJOYo?=
 =?us-ascii?Q?q9iI+5/rHGNfEq1PEhvrv38dMHuRhmQ29uzsiTcgBel7epUfDfnJCgzP62oX?=
 =?us-ascii?Q?dWLwXgAmLzsztEDkhxE73fXIwWZTZ2UVQTjStklNdUCLdSz6VvDhz/O6KPAR?=
 =?us-ascii?Q?PH+NIYGCe7t+O1CR1sjVHSfmMbSXKhzHabcba8IbLigLbtyFmlDS4+q6pqXX?=
 =?us-ascii?Q?Cp1mwR22ptyEDChXCf9wNTDmK8awUbyQNNV824KjGb/1XeQE/ayMfDKFErF1?=
 =?us-ascii?Q?V+ND0pNA7KMQJqXlKWuRogXL0qE6BQ7jkPnOY8ODTq+NS7M1vgMq/nmnMW9w?=
 =?us-ascii?Q?kOGLclqCgZozdHW8QPUU65+rnxVBdREgf/2wogxIe2qa2dix0k8r+c4UBFa1?=
 =?us-ascii?Q?izzn49iYLh4LofQL2hAEB3cGD8IHNYFUQ98jkQOEIptRwecVxj5oG8/PKLls?=
 =?us-ascii?Q?g4U1faCoSsu4V7rbyhYQMU9/hakgJh4DMdZEBv0KHtcxH6dLmrSOTcBs9a1A?=
 =?us-ascii?Q?1UC4YgKZDMS9WXss22VgwhmXazzM43qFZHjNgid58fb/HsWdX/5vTm/wvIlb?=
 =?us-ascii?Q?81daJNT6WhgzoB0JY8D4utBa5tsEEv1fysd80fKPWY1u7Xh3TWVBHeVJ26CE?=
 =?us-ascii?Q?rPkttexxkPX6P6Dn6p9VVK9ip/jjmRj4F9hn+5SWQZPkgop8j5iK2VoXpwUq?=
 =?us-ascii?Q?SeiBCTdm/asAZ0ifyJ8d8P+1YY9BiHWWx8TEd40HlCKlRbx7p1nPYhsBVyZ7?=
 =?us-ascii?Q?9RlQt0MKWKVysqGpHbdpquF3ZjC28PmloZuWgyhQaDLit4BBsGe0vdwbJZZ3?=
 =?us-ascii?Q?y4fKXnMFTp6rp1NarpjmmVaxCwH7g6swqH2Ewwoqd94rPIGm+KdENS1KNczS?=
 =?us-ascii?Q?AVHSEscAz1Y8ClQLuRanKVQg86jzM5htRA2AIoOct15JbBXsP5GoQBcpgCAp?=
 =?us-ascii?Q?cAGhmw812AeuvVY3T/imPO0iRAOwayP3tbcz3vwa7dRJjcjzSkZBSM4a5q40?=
 =?us-ascii?Q?ytOOAjhX3ytgDoBTsMHlD/BBuo6IlgGvQAnNJapCZewnkdtnAxEZkDBPpLsv?=
 =?us-ascii?Q?jEoMR/D1ebk9C23Ze1HHyQ3yJ9lu1SWmIr3FQCmtqTJJGMcpnNykbsZ5fh+w?=
 =?us-ascii?Q?BgAmnl44vAZF2Xj71LYEeTDB+DQo4pSAS77gy9Dv9TJ10tTNCl9MhYLi0Hbf?=
 =?us-ascii?Q?0GEaxA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 241f3158-010b-4020-aafe-08dc6f2ebfdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2024 07:16:15.7221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4IGmSjGMD5pkTnaGy+ZhZ58qFKNNFTCYQbGfgs26DLXo1Rva2/ss8KQn+/RRBoHR3KmSvce3MXwY/kajykt/OBCdGpjy/CPQis7CFoJlZgTVVZii0Mpw5iiHm3LuTOq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5513

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, May 2, 2024 6:57 PM
>=20
> 	Hi all,
>=20
> R-Car Gen3/Gen4 SoCs contain fuses indicating hardware support or
> hardware parameters.  Unfortunately the various SoCs require different me=
chanisms to read the state of the fuses:
>   - On R-Car Gen3, the fuse monitor registers are in the middle of the
>     Pin Function Controller (PFC) register block,
>   - On R-Car V3U and S4-8, the E-FUSE non-volatile memory is accessible
>     through a separate register block in the PFC,
>   - On R-Car V4H and V4M, the E-FUSE non-volatile memory is accessible
>     through the second register block of OTP_MEM.
>=20
> This RFC patch series adds support for all 3 variants.  It provides an
> in-kernel API to read the fuses' states, as well as userspace access
> through the nvmem subsystem and sysfs:
>   - R-Car Gen3:    /sys/bus/platform/devices/rcar_fuse/fuse/nvmem
>   - R-Car V3U/S4:  /sys/bus/platform/devices/e6078800.fuse/fuse/nvmem
>   - R-Car V4H/V4M: /sys/bus/platform/devices/e61be000.otp/fuse/nvmem
>=20
> This has been tested on R-Car H3 ES2.0, M3-W and M3-W+, M3-N, V3M, V3H
> and V3H2, D3, E3, V3U, S4-8 ES1.0 and ES1.2, V4H, and V4M.
>=20
> For SoCs where E-FUSE is accessed through the PFC, it is not clear from
> the documentation if any PFC module clock needs to be enabled for fuse
> access.  According to experiments on R-Car S4-8, the module clock and
> reset only impact the GPIO functionality of the PFC, not the pinmux or
> fuse monitor functionalities.  So perhaps the clock/power-domains/resets
> properties should be dropped from the DT bindings and DTS, as well as
> the Runtime PM handling from the driver?
>=20
> Thanks for your comments!

Thank you for the patches! I could read the values from sysfs, and rcar_fus=
e_read()
from ufs driver on R-Car S4 Ver.1.2.

> Geert Uytterhoeven (8):
>   dt-bindings: fuse: Document R-Car E-FUSE / PFC
>   dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
>   soc: renesas: Add R-Car fuse driver
>   pinctrl: renesas: Add R-Car Gen3 fuse support
>   arm64: dts: renesas: r8a779a0: Add E-FUSE node
>   arm64: dts: renesas: r8a779g0: Add E-FUSE node

s/r8a779g0/r8a779f0/

Almost all patches except this look good to me. So, after fixed this,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

>   arm64: dts: renesas: r8a779g0: Add OTP_MEM node
>   arm64: dts: renesas: r8a779h0: Add OTP_MEM node
>=20
>  .../bindings/fuse/renesas,rcar-efuse.yaml     |  55 +++++
>  .../bindings/fuse/renesas,rcar-otp.yaml       |  38 ++++
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi     |   8 +
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi     |   8 +
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |   5 +
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |   5 +
>  drivers/pinctrl/renesas/core.c                |  18 ++
>  drivers/pinctrl/renesas/pfc-r8a77951.c        |   2 +
>  drivers/pinctrl/renesas/pfc-r8a7796.c         |   4 +
>  drivers/pinctrl/renesas/pfc-r8a77965.c        |   2 +
>  drivers/pinctrl/renesas/pfc-r8a77970.c        |   2 +
>  drivers/pinctrl/renesas/pfc-r8a77980.c        |  14 +-
>  drivers/pinctrl/renesas/pfc-r8a77990.c        |   2 +
>  drivers/pinctrl/renesas/pfc-r8a77995.c        |   2 +
>  drivers/pinctrl/renesas/sh_pfc.h              |   4 +-
>  drivers/soc/renesas/Kconfig                   |   8 +
>  drivers/soc/renesas/Makefile                  |   1 +
>  drivers/soc/renesas/rcar-fuse.c               | 201 ++++++++++++++++++
>  include/linux/platform_data/rcar_fuse.h       |  11 +
>  include/linux/soc/renesas/rcar-fuse.h         |  41 ++++
>  20 files changed, 429 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-e=
fuse.yaml
>  create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-o=
tp.yaml
>  create mode 100644 drivers/soc/renesas/rcar-fuse.c
>  create mode 100644 include/linux/platform_data/rcar_fuse.h
>  create mode 100644 include/linux/soc/renesas/rcar-fuse.h
>=20
> --
> 2.34.1
>=20
> Gr{oetje,eeting}s,
>=20
> 						Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
> 							    - Linus Torvalds


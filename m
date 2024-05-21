Return-Path: <linux-renesas-soc+bounces-5421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB418CAC3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2024 12:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02EA41C21169
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2024 10:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91E22E859;
	Tue, 21 May 2024 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KnyzRvX0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2082.outbound.protection.outlook.com [40.107.114.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F321350
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 May 2024 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716287416; cv=fail; b=C0t2bNAqWUDvro1nvU33XkzugVX8KEfBhtkV0twyvMFCkGGLW0MRz0FLrWlu9vmoBM8VJOnumZ6K4X7Y+Y46EBSuB4SyeSNuYB1LwZOS4uUwxqRZEftTnIR1nwztTLwlUDEkIrl9XGW6k6Q8/oNMYvdhl37OzXGN1bLVDKbkwYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716287416; c=relaxed/simple;
	bh=3/gqhY0WUsJqLegk6uVO689NFM7zXVsypY95BoOedZw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=osA8tCUCtpBxMV7AvSwLWZL40oHEQxSPRvU7Q+Ig5jVzQU9oilf0XFzrUjCI6bTPTApTSMJ8eSYHmlCd5D8MRehR/jXjFjDI2yb80hqsayk2gX9KW14KFRvMr1uTQTgYoCXM9y8qqVm3XLGt5HjmCWUxsfumPzFxPDmNgqV/pLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KnyzRvX0; arc=fail smtp.client-ip=40.107.114.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pkf3ZbHJFzkNPJZIp2rVyw6HlKZKcSCHzvn6+QbLlDHC/rp0Qu7Aj+cgMKbROmyolBZnO5gu4CF37h954VfvGNai9d/Jeupwp5DC1UZ34J4bruvtSEhLh/akP7mNDDejClsg2pOCsITw3F+yf4uwDHm+yw/l2Y4sfFRJprS78iUNPEaLJAieDIPm3P7l2WWBMATd41pnzl/n2a59z4UlHrB7Q1lwmAmmNPCRvhxgMJ4ChOHr7Ncrh3WOmxI28C8ufvA5ZdStR2rMvWkVMVjof5duKUS3Mic3es9rofV/sv48l/qRuNgLxYqXOeeRefHmftaZ4wPOdy6qYjOASp1/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/gqhY0WUsJqLegk6uVO689NFM7zXVsypY95BoOedZw=;
 b=VSObbrj5AsZ9M8pg5GDCbiR+qeT7TmhKbG24bJFkJyoPieSLLa5zBa1soWwVcuEr4xpmmr2VYAozmY+dZ1CTWkc9/M6lLrV73sOJpZMe8c94YP+1VAn3SVRN4NnfCQ+A4OwWCHiacDWHGYmuYnDLf7D01B4FaxLeLHaG1d3Cq4MlGYW5Wuslsg/APM9fiaYsEu7nM064yJ918JXFR9hbB7qhF79bcyLnB6HLrIMUJBeJ6juGHUusoiNywVtwLADc7psaJlSBUQhmmy9v58h15FqM6hvFv7yIYk7b5eHDIyG+ya/gobLc/p90mvmqe6VE5RkxKBYyHg/dw6CAM2I6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/gqhY0WUsJqLegk6uVO689NFM7zXVsypY95BoOedZw=;
 b=KnyzRvX04mbUTs8RWl1OnIv+Wl8X4oAm80bUHI3NpmH4OXiE4pPNtgXNsGLhC2Uxysyff1XGIA+UKLK9AzQb6g3GQHot/AJOC1wSoqUeagD86qJNolSHnt/Mb2eOzmll2OdKp6HpvwheleLb0apXpIbOQ+52e6iEBC5MDPoCFYk=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYWPR01MB7356.jpnprd01.prod.outlook.com (2603:1096:400:eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 10:30:10 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 10:30:10 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe
 controller
Thread-Topic: [PATCH] arm64: defconfig: Enable Renesas R-Car Gen4 PCIe
 controller
Thread-Index: AQHaq0te4mP9QhW9TkSpjpHIUzSjtbGhRnIAgAA2LoA=
Date: Tue, 21 May 2024 10:30:10 +0000
Message-ID:
 <TYCPR01MB11040E4C3EC3280AA907796FFD8EA2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240521065136.7364-2-wsa+renesas@sang-engineering.com>
 <lcbvbogpsvia5c2rpsedu4mjvzjht4cfqds7zwmzyghqmdlnbg@xzyogkjl53dv>
In-Reply-To: <lcbvbogpsvia5c2rpsedu4mjvzjht4cfqds7zwmzyghqmdlnbg@xzyogkjl53dv>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYWPR01MB7356:EE_
x-ms-office365-filtering-correlation-id: ffb13cf4-b401-43f4-2410-08dc7980fde1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VYCLcqBI8xbDi2chT21DqIw8aoTWGFgoo0715uyUpVjLQZMeCNf72QEzTDtR?=
 =?us-ascii?Q?R0xcb+k4XM5yCsO1R85+XCCwWLYUiczP6tjBNAXThrWW1+zCEl5f9BJ8PgeR?=
 =?us-ascii?Q?NSmJU1icugQsfjLCOkfGnvrPoTOXCP5/AvI1K0zILzBm+tCuO9dAmRhiBenq?=
 =?us-ascii?Q?AHAI6vfc9KfyrHAco9VE5vykuouVOHlKbjHcEECCCnwJ245MKmDGjN6LlyL3?=
 =?us-ascii?Q?OwTwlo+nOFDG+C4//rFr0aTS5phTm3/9Quo5XR8keFIdlvE60z9clTBZ0rHr?=
 =?us-ascii?Q?1ya2Ah9jaiw5uJooAf4v+Y4/w4qwdnWgK1u3g0mEu2qMId9HiRAdZTaAW5tY?=
 =?us-ascii?Q?ARF+dzHs/mPso1LdE00kvCNdmgnnD1yWWCLdoyBtuZVGvLZb9mG4bZXLS1lS?=
 =?us-ascii?Q?vjCQTVqmmxKDS3qQxg4V6JrYDibDhcc18zP4Ex91kQ/4eeDkEy75kqnMRqS/?=
 =?us-ascii?Q?mmU3S6BzsiniW+uR/gKTxgBqeJvQ8eT5NBIr7LaR0NUz1O16RGllEdGTeTd5?=
 =?us-ascii?Q?xdvbTf5xHOk0dEpIi6oLzk7PapyorW73FqZtwnpOaIuBbrGxiQAWG1QeZw17?=
 =?us-ascii?Q?Gt8k2bYu/Q0tlCrboHvUoTcEW+cPBjOV4ddRYSSKigHXoKjVPq3Eg9t7CFSJ?=
 =?us-ascii?Q?gOQXR3vw3yURSOv5MJ98TOPRTjgUfBBI6/olCXrLq5cTcX8uPpo8wJ8auL0I?=
 =?us-ascii?Q?zCpAl7URqR9ciOm5rpB+eyuh9TPOg5x36Q+FAMpOsRoZfJBZrT5De9Kmuxlf?=
 =?us-ascii?Q?m9W1XuPo8/2gHahQoG5jSmR7hpEwxaw/CCtA6rTOCPJcL5ilcRNQ8zskwM1I?=
 =?us-ascii?Q?vVOwfxzZGQU70WfiOu0OdV5MGzZo40TqAiZYHv1u24DjVO5pvFGQf1CLfMVc?=
 =?us-ascii?Q?3NE5fQ9gTW49c3BLQeljjhuPJNZpsq22Tj90XdbxzOJtOwClH9DKiHlDu9yL?=
 =?us-ascii?Q?QJAIls4z5bxXjcjQG23MjIXWTqaToQykbYsTr7smLaFJW16YGt3OEXcrNNIH?=
 =?us-ascii?Q?r6DJAPiSmb93k/f5vIJWNbql1Cij+VxW/OmcpYzEHCg4C0Yjr9PGW/513JBB?=
 =?us-ascii?Q?SJEek7GaKTSIZbtUEbS9TSVhYMfmYQbn/VtDGdjgXAH9SUXZEmJ2kt6TgLE2?=
 =?us-ascii?Q?Mb6HlMM5dt502VA3wvea7koDLIUpI1bNwi7fWeBls9ROb7AHFQZqzfhQKxGx?=
 =?us-ascii?Q?tPZW+iUhZ5n7dGyd/tj46fyl9dsRBDJugXrI2RWN3mYQmaGt4Lp8j2BfA5JA?=
 =?us-ascii?Q?WI5+/2xFd/gZRyBlD0LmmhxySl8Gk737YsY7mGx9PAOP2kZtXbw8ikgdk8E5?=
 =?us-ascii?Q?O2zxINFiWY/MWvrKaSBdYF/qjQ3NQ5Gv4DbnqQ3uiLSg+g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yQv9UcQ0oRbzH1KmzbfKIoeDyQ9jdCfpKNSsgVJ5vw9boNH0OhanxeXBF8nc?=
 =?us-ascii?Q?swm4oJc4dXwc6yLwFdd+tro2owJ+qldyM4kmxD4/98vUP6i8zJfTRm8rXRND?=
 =?us-ascii?Q?Q1eLXQlnpDjL1+ZC/Um7QSbkObPqnsauoJayLLOTDRUJL2MbqCMG2Auw3XBq?=
 =?us-ascii?Q?6Vqk/487C4Pe23sTPesftCysaBLRzn4e6SWXWRW3ofiG0ufL0iBk1ZAjsK97?=
 =?us-ascii?Q?4RXguj6MRxHq1j8ZYuoxIRzZarjYM/dDaFuXcMZ32K/XAnfyr+/nqpWcQqbT?=
 =?us-ascii?Q?od5aDCZcA/HCz+2F8lzCF48cphqXkEN4bKr7ZkSacivH/UGY9ICJHQSjm6uW?=
 =?us-ascii?Q?AP+3KtdHIzu2sjuzv+TOFQIVFRgxQgzJKDDpts9VEj+pb49Xl9+dtOvcrpot?=
 =?us-ascii?Q?j29cwyL33HFdTlhGZrXtyTIZduSKzy0Kw9j8R4UV6xqq02Z1SO3cBTqO2j2F?=
 =?us-ascii?Q?Ja8fzrqZl9ayhbFqWSctXTbeuL8+S5lq43Vygiu3h/C1ZVPpLrT1Ltvo0Cjk?=
 =?us-ascii?Q?DBK6U0NqsT/SbdwJHbv191n2KWICgvA0zlgI6OJMDdpdmMhMqU3YB8a3ARuJ?=
 =?us-ascii?Q?rMTs4FZwc6NkUlWQz7PqV4bS1KdPJ/Nr7cO28WFVdzTtiWva22nmtOaRxhE4?=
 =?us-ascii?Q?7Vh/bg8WJw3e6SQ4OBYwm3viDwnO5BiP4G5NWrud/mLarcKzSwPyHu/2g28Y?=
 =?us-ascii?Q?ZpPLy4e0yYujcyobsr5QxMP/X8oshsmwDV460Bpo6/HPeAAUOLUY/EBLr6l5?=
 =?us-ascii?Q?mOa+OrBfYzN3qWK+x8TY4De2wp6BfdKe2DJhXumk1uanJvR2hhqAM/nFZVF0?=
 =?us-ascii?Q?HNKqu+6UEziNfYkQIdCVcFODZlkPNW2nP+vWuHis4CylO0mcILxsM2WBkZvz?=
 =?us-ascii?Q?zjmx+N0Q+hgVEdIma3JnF7DlEa7zurr5VePaNvpE1lCAlmzoSXi+h4xTznFA?=
 =?us-ascii?Q?n/AhesZwzT5BZkQzlPP9f7v3G5aMPYfd1Zj7buaZ3BHbc1ymfHBQ1J5ScYLV?=
 =?us-ascii?Q?e0qPt7vTI/vbw32UHhNOvoTcn3+5WSgsTemc8jzqY+RTBIk1jfFmpD1t3d+6?=
 =?us-ascii?Q?yf7dv8IA/XWdEZgnqlrPCveGUXFVwWizFjBMTzS26Km4nvmewg3ezA8jJNlH?=
 =?us-ascii?Q?2i/k3u1yQJgPFSG43S0aYRmWN8WvyC9KmDT5BapI75Os7+8B0BZMfLGwH7Ox?=
 =?us-ascii?Q?Lj/Rp2mQ7uwqCIu1MWUTCXloFdb5hWD6CeK2N8XXYY8LEXhGYjZI1E0Sq9hI?=
 =?us-ascii?Q?bJPxfBBcFrIn02bIgs2S6NBE+7dz9qGI34hxxiLNcxOEGvRX9izjUup0uUJp?=
 =?us-ascii?Q?PGcvNWUSA5tBnT3qmic1cCP3NYYvxRJ6WtogASkED5HgPUht209A3F/tCZyp?=
 =?us-ascii?Q?BiEXDOpUOwkPPsF1gVqFT+F2qHwF9EL33CJynaIn59AzHVol4fjXjnd43Sax?=
 =?us-ascii?Q?fP+7s++E7NzPxuL/m4m2S83dF+2snzbxI7TXux+b9KoMZseJ88cnZAWPZBTz?=
 =?us-ascii?Q?c7oPwacKv2hV5eh4AFZ+U+Reb4GJaXjPTO/wiWV9/fIbtM16jMRjqgO9LKYg?=
 =?us-ascii?Q?PtH5JMMxwnMbcmfNtSs+gSGjF1Fcb1vGSVe7UL7+CJz3QpUuxe81H+3fu65O?=
 =?us-ascii?Q?DA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb13cf4-b401-43f4-2410-08dc7980fde1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 10:30:10.1648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thj1mPLJ94IwRvD/N48Dw8hZBPoD90LVbSORv/iudUMraq1EAIWCtfIjaGU23zhditQwSspJHnEcEpNEa6b5yI9A0f+r7zPVUOpb5waL5zpGP8hCiw+yOut2semomc3U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7356

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, May 21, 2024 4:14 PM
>=20
> > +CONFIG_PCIE_RCAR_GEN4_HOST=3Dm
> > +CONFIG_PCIE_RCAR_GEN4_EP=3Dm
>=20
> Shimoda-san, do we also need 'CONFIG_DW_EDMA' for endpoint mode? There
> is a BSP patch suggesting that: cda3dd982572 ("arm64: defconfig: Updated
> for RCAR_GEN4 PCIe driver")

Thank you for asking me about this. Yes, since enabling the config improves
the performance in endpoint mode, I would like to enable the config.

Best regards,
Yoshihiro Shimoda



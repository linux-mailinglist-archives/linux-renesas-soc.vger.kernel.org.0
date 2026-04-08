Return-Path: <linux-renesas-soc+bounces-31013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ENyLF1a1mk1EggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:38:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9213BD0BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 15:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BD5330097CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 13:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F733CF057;
	Wed,  8 Apr 2026 13:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OiUIqmgF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E8C33D4E1;
	Wed,  8 Apr 2026 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655227; cv=fail; b=E8gSp81U8MN83IO13LytxLwnuJPBRRAWL4OPXxInle6K6AvlNpIIKH6rqpCC054PMIksZjelqNGqecNRPn/yO+r6/AZ4eNpiXcsZqh5OK9GeUEW/7hRljpY+6BXwr/6GX9GdV/yC6jHmMjLaep6+p7aQLNAEQ3crC/MwKfm+g+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655227; c=relaxed/simple;
	bh=aQ1mzM30xbYtMcRiCP2Wr4V78i3g8M98HSVnyJYKzLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mjaZ9gusroSI4ri22snhA4PAVtXpG9Dl7uP979FCgHqN0W9CqcHOhcsSmiMv1EEDXhcb0MUhMGZo1IPdKpsHY3WLtq7Vq1m+nD91o7GwcIJOxyg4CaeezFW6WixNIwI6lp5PywCIVaGUMTmrA5F3S8ftfiGa/ux3vHDQSLjDFyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OiUIqmgF; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+DPO/wMOrOZ+J+LbzvtAbFPFtQRATZT5VKwKvRZvwHjhaCLvXgCAHWNTQbw7PqzjKoFIEKTlwczgq7KhDcE8lIH0TL4Foym7VXObtfNU2dX6JCFOCKbrRfkuySNxbR3l0w9ztgBa2GNARbwQcC7BaLsUm/cdgwFne2WtuJq49+sGZKShWyZQJDmNClQ3BDJtij0/FU5rcdHQlbTSmQDlDR/W5ofa3gZSzl+FdJmm0yhe9UHbMs9+PUOfeGwUbFv3ixk/wWi26cYedUob0pJ4bXe5iXmWo66eqou6nojq8qVN8R1iKHdTpSLwdU3jUpM1V4FOPnoOeZJEEKkfcxhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ1mzM30xbYtMcRiCP2Wr4V78i3g8M98HSVnyJYKzLw=;
 b=VZIezvra08ssn4KEPUYvKK0Y+MaZXGtgJ3bRYOmNyCNWR1Wt5bonax3JLUgcvdbmeQU5eB2TDpJ/5JHn8uT4bnHk269IcjCVwMBALaS5POJwqZxAfd+cAwlaIu/H+YxOzL45vkbzrKJ4h05oEOadUXDI1OWiRSxhd5HehJ50VdRVecOF31F0PrsQXPi2MgAyNKFkc/RACFH/Hmu9FRoQ3Bmi85MPZxChIBINTDUwOdznS2H0FgFSywAx1F9yU1EhJ630FnlyIpccHmbbIBL8kGPWk+GzScJcdgepYx+wcJHOZZBqhWkx5gK6dHOXHvWvoYwSo4O/rwerrKvMOT3OCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ1mzM30xbYtMcRiCP2Wr4V78i3g8M98HSVnyJYKzLw=;
 b=OiUIqmgF0dc70x1v0Qv2mk3gzmdIvMhfgUkyuMCUjs7CC8Zg5YUZYdrmuNU24neN9t19yrq2jn+FNkXrxx86kz6LMmNcSsnUhvtn03m4FYUgZ5oJkyO8RVpFcFnGodpY8y96jMHHWLHcpEz4EfVLgmx4Jm9sQNakNWNwiqv0Ym4=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB17386.jpnprd01.prod.outlook.com (2603:1096:604:43d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 13:33:42 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 13:33:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH v4 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Topic: [PATCH v4 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Index: AQHcxzVPCqSge39jhkO/xrBr1DQBDrXVEfgAgAAXbwA=
Date: Wed, 8 Apr 2026 13:33:41 +0000
Message-ID:
 <TYCPR01MB11332EFF243FE27F91A7088C2865BA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408085418.18770-1-biju.das.jz@bp.renesas.com>
 <20260408085418.18770-2-biju.das.jz@bp.renesas.com>
 <b36fa28f-4885-433b-bc5b-c0069636663c@sirena.org.uk>
In-Reply-To: <b36fa28f-4885-433b-bc5b-c0069636663c@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB17386:EE_
x-ms-office365-filtering-correlation-id: 71bb052b-c3e4-4758-0a13-08de957372be
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 aDFW4ao16HOtPqm7PXpdoiZMGayaIz9EEB4r8mEQ8Jd1WsSi4FXsyGa5vXeTIqCNGUde4UF8Afc0HNV70StKj6mlpEPHhzPxsuQceNFhVUT8R3+D1Wq3AJJ/HKRU/xI/GSdC7qrTrYKud2oyC51Y9oIUIjAu1yLz1qPipzQNm2tV7rD2EaUyakcodZTJp8nLLwLmYZRCMzESpaY2FlaQvjqxAX47VtcfDi0PSDQa0uspi/D8VH04fmMC5wg6x70WYsR4B5hWGzY45tHXLnDttl5nkTekJJ7YDx+dBbdSgLyDFekipdkJkv1SVon3xMqBlVxGZlBCN2rrPU0J3sUE7KibPhjXJJ+u/Yms3N3fW0yjvupWJBLlg2JpdDK2YsXXipcnlFO7FrM+EIuMgjx3P8Xx3NYON/uSw5V2ZmnM98wDgU1mSKiEfmmyiJLSNXDi0hYMYN6pjS3Q+Vm4HZ9PY7NJ+Nm86097eO3QYGdGbrPcDoXFIeraSV5wR5by4dM8/9P9aK7LFH2bp40Us67kqkZFwydStp9lRvl9CJJ2GCNyLzEMKREi/AVsfPKyfU2q9bvyfJqaD9sp/nDunS9UYCFuGur0xCDH3gMJ+Ky3Q/l68Bgyc07k89XsfKjDFNFvCVr8G001zfQvtCYdkL04qLwUA76oH2WyMksDeN3CPh8nhBW9cj03sxQngSKyN+rc1CAb6/h0NtF8uIV0JkvhzPWjHV/ltYF1da3+ehEZD3b9oFTtweg6bOftD2QozdkP0o2pn8uT2r8N6MhY/ed5SrkdLjZIKL/U+S89MaxhyKQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8Ne9rlmwnqZt/vfEOMfrhCYVYI2jP1OXxtbAWPPLUAhYDBhGS/EjosjHOWgM?=
 =?us-ascii?Q?k0FgiBJNtEpxb5/5CBxFBz1dkmivmfvn0mEVZPRvsCoir6dZ4l7EbYWNRJkD?=
 =?us-ascii?Q?NtoIrk9XZ1FwnZPkvXUJkZzQS7OEnjiX9DyvhDicNS6lr2WTajV4JDxnfyME?=
 =?us-ascii?Q?beU2YjyICky7pcBvO/CbPMOrIYFx/dDF+Gf007+avHV8+crdlIb8PesRXguU?=
 =?us-ascii?Q?gusOZTPrepOUDjqN3QPNrQuxtqgOpukeHr64c65AzzIHT/A241UJjVMbCGFZ?=
 =?us-ascii?Q?PzWL4+Y3D96EIZ/PApqitrtXiLulZ4WUHLGJ05T1JHeBVD/KMYCLFvYZhNP0?=
 =?us-ascii?Q?veBoclPA+US5cVxYJ3P0XxqYQ5eCz2NeVn7JWza0D+piZ1Ks3EEKjFaTi2Gq?=
 =?us-ascii?Q?LjeVAHMPHPYS/P7w6suZhZmrGNAmZpAX1W1yAghKRuQf7NWEG8sGLw5bfiVs?=
 =?us-ascii?Q?u6/QySIHiNQI52cEaNRi/sm2DANucXGQVerLJtwkjbovIABiDokTQPpbwzp0?=
 =?us-ascii?Q?Ta+uoRGKugHegfFuuVdGR3RhXGzwA3lj1a6HCBkx9DS3ZTdfySVBFux9u4Td?=
 =?us-ascii?Q?FFobc2Qh8O9Z2SWaWbvFQwnUI0neZ2j3SE2E2XkDoxDdkVzMVRK5+aJmOWWj?=
 =?us-ascii?Q?C7GCrDDk+0He78HP/DLH2Blkb75upJEqvWylfUjX8/ftPN+i+IYmylAbev0d?=
 =?us-ascii?Q?8UNwjm+6mXdbiMRb46BPSUhUvcq6xYib+RGwyUc43gRMZAWxemA4NTQU7uo3?=
 =?us-ascii?Q?o+FgSd7YudbQsjeb/ZvsaVtY5wBjYE8tv9hFSvXeDf5Z4RWsG8Erbbpr9OZr?=
 =?us-ascii?Q?vAPXsb8UUYVZuJuHcnGA1/96LSymW01h+JAKJ+9aSaigeyRGQhBaCQEtPc8N?=
 =?us-ascii?Q?acdr2lov0ocUbvLySzrQEvE5DQtvaDu16NAdXTPh/YSp9UE0AyBt/avugrOM?=
 =?us-ascii?Q?HNQmoBKzClHH2EdvuNLxVHFx2aY55iPd0w/sz05bhgyzWMMEJ6f4AlloOC4E?=
 =?us-ascii?Q?XsmaB1lCBafkZQYfRb9bMeWaVvkpl+qA7d0DFq1CHNKwsZcslDPEt9BtjZzj?=
 =?us-ascii?Q?73klA2a9onRPd5FswljYvsrUH3FsxXUfyzOVN9XYDBLBzrjRSvOUhb50uiEV?=
 =?us-ascii?Q?h0tCqr2TAx/HAyhQewdDCtf+8r2tK0zRAprY9vhpaQHdMqKDRHNbCdEvtWzA?=
 =?us-ascii?Q?O2kUeX+MGy6XLoqSjJbg+v5C2+ryYt1ZCulMuX6J56zv8nNkRdpZvOc5AJ8x?=
 =?us-ascii?Q?MFybNh4Ax2yPM72Jul5oMJR2hULWppNyKMfvCqYcfNerHvnMYTBm2Lm3oCEb?=
 =?us-ascii?Q?qRdy9eYf5fyxvwUl3LU2Gti4aVT8WsG/qsgCRzLgJIr8L0dndvTRMG5H20cR?=
 =?us-ascii?Q?dH4VmkrrwYl0I5WFTnUNTc6PRQ7MGZQyGcEaOMAD+Tn+2Wo6ZKQymb8CDHVE?=
 =?us-ascii?Q?CLzaiWX4QU6/Vj2udSpIibmpMznYLexSNyDRN/VFLGkIhP5V8OgwQTwgeep4?=
 =?us-ascii?Q?dxOMEkIn3IYqsV0hPuMmKQJW1UdMyehqgrZ3zkdipE8QEKlidlt+twAM+3tw?=
 =?us-ascii?Q?YUyE5sndXh9aawKiMF3l1LY+4lw6jxdgROsSWhUHdqn5yzEuXZY3IBOMsknE?=
 =?us-ascii?Q?7AyDiUZScwwz80hKVFCOeKUqbJYqzg6ENA4g2KC2xtCSnQoN1RxvI2T0gzyR?=
 =?us-ascii?Q?IJkA6SIavBfrKIDfT7fCQ9AbtpIsge3VgxXz/RKXonW1Qg0WUjo6PtEoMrPc?=
 =?us-ascii?Q?xri0ZHPI3g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bb052b-c3e4-4758-0a13-08de957372be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 13:33:41.1823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hvgGAvA6FtkmsZtSKipIztZff7obMYYIbA5Bfim5hStJe7j3jglw0sk8ON2RvZfhYK4kDfwOiZdqTaeLYMgbnJFrFUgx4PRTk0v1fnYkF+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17386
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31013-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D9213BD0BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

Thanks for the feedback.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: 08 April 2026 13:07
> Subject: Re: [PATCH v4 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Documen=
t RZ/G3L SoC
>=20
> On Wed, Apr 08, 2026 at 09:54:14AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible
> > with the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.
>=20
> Please submit patches using subject lines reflecting the style for the su=
bsystem, this makes it easier
> for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and m=
ake sure your subject lines
> visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Oops, I missed it, it supposed to be "spi: dt-bindings: renesas,rzv2h-rspi"
I will take care next time.

Cheers,
Biju


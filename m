Return-Path: <linux-renesas-soc+bounces-27925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFUpGN68g2kgtwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 22:40:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A33ECCDF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 22:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5796D3012BC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 21:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9657D395D85;
	Wed,  4 Feb 2026 21:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ViqWA0j/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87D3395D80;
	Wed,  4 Feb 2026 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770241243; cv=fail; b=OUuINjPLpdpAU7Q9S7UPUGczxl2kcDvqvfxZeeWBBGk4h6lSTVEEVRyxCSLgMgKU8qUb6AOZphBznU8pFmLBJQ8FSotfBMMHPf6Ulhh/uZ9YKsR1oHCL0bCSxpSQTqXhsIMEAr/Sqi3rzfd1tcScSVYTpHSiPMBdz9ivpAIXLt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770241243; c=relaxed/simple;
	bh=fcDEv03JVXcA6WTExnX8X/TG3irn1jyEFSUaidCN2m0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YAhk2aVGgtfupaYkx9855iTWEvCrCCHUwCFMnt4VJlra8tNLz/eQe5whj8IAlvCtdI5Gj2BEs4f1HcvpwiikPaL1JInR9uKlQydapZU8QoyAh4MxoY4DQL2F8jNC3MPMF/FHh7Qfmv0DE3xZaEvpanNrFgpiF5Fe0YgIR2XxehY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ViqWA0j/; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hvl+uWfBGWq8aO3CgQnRGmgwahMcetghtu/0sQ6dtbW/q+FziM1t22ZTt+LIdA1ppc8NfDyEferE93GTmPt7vTvcuuyCkoLbmTk+KZYNHyL+SoOahzCOY2N1rRk0ZAxFXvzsVo2vgQ+cqhySFgCnoc67mPR7kETLoj/u/j2wX/Hbz2Ii7FY5MaQD57fThhChQP5RST+u5cYCbMIfbf89oJdSqYXBOUDhcpOAYFLWtLYtx4824FaJdBOzTdSukLTSC5z5za8UBNBfCxT0F/ApCG1zlzHLAmM85F0tQ7EpCed1ql/+loqVUFRkwFx33YzqIqHaPO8Bz9eOU9qXd31IrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7HR0VxQaf8+xsGz7qvMiTsMmMljQXWq1Syiy1sYmz0=;
 b=RuE8PFBz88lmWaJ9zTnFObdJyOdjb4WVexvRAzN5oT0edawqz+CoUvcugiNkZGhkppG7pxjZyS2eBulXX/VrvQTY2Cxguvxe3iqnMReTFZsCVk1EKMyoA0B6SG/2r3B38F5PgHykhRxXJXPGIW5GyS9PtjqI/89eYBtRLH7JgjIpI8zGS/GE6geXLdCKpaFBwT8QHvMqJvJxYStC1zBOWZTkmTyWMwnS+KntqgDp4wknVwvyVoV3aRUUQzpuTVYqLcaoA6Ph5IwEjMNOgkf4/IEoFB01ciDQsu4nRHphvFhi9cqBfBCfnMvJvzY1T7WD0dl/kUKm/2z3JJJn7Ry/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7HR0VxQaf8+xsGz7qvMiTsMmMljQXWq1Syiy1sYmz0=;
 b=ViqWA0j/NT7CXmpDTtop8o3+0CE9GOkdIaUBxYkAYO9zqHi0eqGInROxP3JgcxBHVlbjoYD2XY0RobgOqiMFgy6JuVCZfgwRn3fj/iWcLZbdutY2LzmGi0orsfP+J37IoRmU6czjareNhYpPN3mzxP9Me1Myeq+fx/piG6evshI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9733.jpnprd01.prod.outlook.com (2603:1096:400:20b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.17; Wed, 4 Feb
 2026 21:40:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 21:40:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v2] dt-bindings: net: renesas,rzv2h-gbeth: Document
 Renesas RZ/G3L RMII{tx,rx} clocks To: Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <eduma
Thread-Topic: [PATCH v2] dt-bindings: net: renesas,rzv2h-gbeth: Document
 Renesas RZ/G3L RMII{tx,rx} clocks To: Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <eduma
Thread-Index: AQHclh7jpsUI1oQF8U6XxX1zmukRgA==
Date: Wed, 4 Feb 2026 21:40:31 +0000
Message-ID:
 <TY3PR01MB11346D903D0F00F167DE25FE58698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260204212541.4870-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260204212541.4870-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9733:EE_
x-ms-office365-filtering-correlation-id: 5570b614-5253-44b4-d224-08de643605a6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Mz+aFiX8hBjl9yIP91weBJo/tN6TraT8G/KAUypcaP70oin84n875/MyYc+m?=
 =?us-ascii?Q?QIEvxF5/8S+29pVfl85C5HsJJ4yjE5ofSYtZz/B4x5daFodN80VWRMIhLMNL?=
 =?us-ascii?Q?T1HfIhVioZKOLwpG73B1VdYLR1UBi6/8NRP5nG2HQOTXNzi+fknmr+SptlQF?=
 =?us-ascii?Q?PsKWEN1pKzCjqbidlTtLUlW4rQ7Z7Aufb7ja76SLUuZBuQSG9hP/eCzbJSRL?=
 =?us-ascii?Q?nbQGL4xBvydexTlhv6o9vUockem05VA8OSHoknJJLEOGzuUL6G4cO3TNSj61?=
 =?us-ascii?Q?tf85aoYvCh271vAXW+oG6SDCmHUowq/V/EWDZyorA1uvFpI44gHjWS35Ztwn?=
 =?us-ascii?Q?ViFGpWs6HKTllYL/h+TixmykiFc8gGPQ/Do1vwO/y6A3CmqXwntSwD1M80Wz?=
 =?us-ascii?Q?rQ1DxpGmlKCpF7L1TBYS54wB1opNfd65Tdb1NkoTDuwv17CQdXKA+0/Y9I1X?=
 =?us-ascii?Q?DTqQ6JmGbKMvGhfrEW7tODugkj09iqGeLGX0bpm6EyaORL6tQ2sE7LUQimr7?=
 =?us-ascii?Q?38487CfsjqUVMmZ8Mxc6gonojM8bfdO1gSrVurScy/KCnNQhiAl9Anr2J8IS?=
 =?us-ascii?Q?WzaOBANuc1qr3lJ9KhWMWWS0wGfDHHmw3qDJ5sKsZ4JMKQMRmOBu/20agGfT?=
 =?us-ascii?Q?9PXMTAxMC1NhfQLQnUyLrb+2TDbsoRrPI3RMeLQB/p5TP/Oo1UXLssaAavUW?=
 =?us-ascii?Q?1rigq9xBofvdT26yIze0VKdgMGW1lBFzRcA6OWPKW485HmExc6bTf+cvHvjp?=
 =?us-ascii?Q?LPOAaXNYsRSoBzvjYy38q7wT3Rm6Xh/ZarrtYzXNTbs4MkUsjfVJ+slDSdwN?=
 =?us-ascii?Q?gEyVoub2mgT+8X5DphTkojY7F0yaBmfaGlZ0FeLZwUG4EaEndvdRmiz8J4Wx?=
 =?us-ascii?Q?vpzjyUtgOJCTeORv3VDP/n1CBsAxG1oPKNU8UaGUSRmgF5qv4plX+wcA/VT+?=
 =?us-ascii?Q?ugAvOgy8rB8W4siptASIAk8uNPFtHhqxdBDIvz8RdWf6amHWZOOfbAlpANFQ?=
 =?us-ascii?Q?c/XV2LRmgaa3TJ2jHSrqRQg3lI6COc6F4ap4QM6aZguCUfdv3yyipla49WPh?=
 =?us-ascii?Q?zWZQSthtBFsgfYoZ4WZ5qcZuPx1yr05UCmINisqtuLeH2dg+IGIKNInx1jGM?=
 =?us-ascii?Q?esZrbYZCSBeTz2GWIauT6aA/O58c01xhW1sFDohJKWGngNkBPS85cwrUbB3K?=
 =?us-ascii?Q?cPW+1jtX60MYnp4rVpc2xrRgo8hWL979MjK+N7v0mUZS2dXdHIfkhjj/u13+?=
 =?us-ascii?Q?wuP07g0GvnM2NNskzcDf7xZBpcFoCd9Gp8531pQ2T1uAXjFi757j7SW058EL?=
 =?us-ascii?Q?UZkroUix4Qv6+COLMWAOuKg1+6w5ILIn1Ozphg/BayaG1ovG1+umTEMFr7pL?=
 =?us-ascii?Q?DE65Skg8hlfGDhEiu662HVf83WUdeXxeuqD40IXAZaBOPxuWLiFnrMk2Qf45?=
 =?us-ascii?Q?yeZerhmht+qkB+5P6pidUWSIjPHfPKm8v+371S4wioSCWuJ/grkmKBjdYTF5?=
 =?us-ascii?Q?gpzTTZwLJBWAHT/nliV0fcWIdxMPTlH/PXLP1JXyYtj1T8IAFxqDDeplgy/N?=
 =?us-ascii?Q?H4mD+L8hC4c0wJMixuVJq+z4bIPYr7V/zlvB2+17kforiUpUN6zk4uqznrfC?=
 =?us-ascii?Q?bUr+91Gx2i5W6JJKubXo0UQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?V6SaHbbOZsUpE/Is1q/ijPx0iupzq6067vC/pr10hwHgzVMssEXOJ2jMokM1?=
 =?us-ascii?Q?ziLY2XJUtgQYkWltjGyAi3CdUZ6KussJwC8pfz9NR/ZyhgWAnJJuQOEQR5Qu?=
 =?us-ascii?Q?Dq6Y13EEkg8w2DoZEXF0bgqNxZTFVURDRqQF9s0IuZvjq88yahqaPS64rJBj?=
 =?us-ascii?Q?0Ky+wOhbOvdj3dCwLMyj07+m8EUeHIBpofsbjxZmHYJ3KRb0ILLFsFLiVJvi?=
 =?us-ascii?Q?TdVN1ty5DHOFe1dYGS9U7w//0DJcuKy92warJBom0c41MO8H+N/FpT0Ttjut?=
 =?us-ascii?Q?lmD5uwz3x8pZv5gBsAzUzEmwPS7r4AnKZeQRN8FWASls1uGxCRekYegn1TkE?=
 =?us-ascii?Q?A/ehhRKUuhbFsUUti4HylaeCcfA45Fc44qBx+UzMjjwcbI4VrQEeslbeV4bf?=
 =?us-ascii?Q?xgctiFBMF0zPiZR2rd5Fvjh/PedAt95B5jiW3tuzGC9JHcL/34G+FQIh5L7B?=
 =?us-ascii?Q?Fad6ZZyazSvNlmJ3dglvWGztAepnp8E3a8H6mm4kO+istU2qQNi9SOiSvkS1?=
 =?us-ascii?Q?YxlG6ngPZURPsqAA6mYscIu3BNHkmkUJbMyBAgrFAdUbK5htNpd0boRpXnJd?=
 =?us-ascii?Q?wCqtD8lNEz+jq45Iic91f99Z0vEj4YMSw9AFUgsJd6LJsfAPxAxFDj9mlo5a?=
 =?us-ascii?Q?gRgD20xmIUqsbTqeNWQYCIN5KGsVGCx27kJ1FQXSIpx507jy7oWbUXTXJVLT?=
 =?us-ascii?Q?rFdt9XyLbSDBKx4Eyuybs5eAITAidhj+RTZ/JpfdPIobMVrCA6YKN0ISpmEE?=
 =?us-ascii?Q?+tfijVsHxiiwwnmdmgNKPfhgcMNQvaJ54w3CwwqEEF+cVyOVMkicj/nFHGtc?=
 =?us-ascii?Q?mDCgS8pljHL3qQ9ROOkyRPYsCD1Xijvros+20Jq1zy0DN/KsM9ig/syRbSu/?=
 =?us-ascii?Q?rEqenHgx2AaSXmzu/IeiJJ3zngGdTnmk/1ZszP9WW62PSKq+22uvrZG/TqzL?=
 =?us-ascii?Q?KjmdzomfAiCqei+8zrlLOWY12iq4181pv2PHhw8zHr77Vg+qIHPtpI7Uxue/?=
 =?us-ascii?Q?xM5IH07fVflm5dkp/vAVwu2BZ8RTAlllUpH8Klw98OtdcyP8vTUMrpkUu9a+?=
 =?us-ascii?Q?yLxZF9rbL6+9xg3XmWblVR+WWMu0T1l+Q/O7vylI/G3fnrCWiEg4iXJ8dDzM?=
 =?us-ascii?Q?QNYqaPi61vq/BwHTfKCqpktXBL7NMIK4Wj5qnvCyxfPVSEtXxxei7OC/8aHb?=
 =?us-ascii?Q?04GGj2L5GMdzoOZ8yhImmCRJ+PEbBjjRNz7iI85E0rTEkQ/ZDE6vQac+ZvDW?=
 =?us-ascii?Q?DTZmfl/6XNIsprNo/ZuIM4J3XQIIS6Mp0CuKKUkTWzihh0A+BZnmOy+wfy2G?=
 =?us-ascii?Q?8llZPULZSsaC4/5aJTSeMBNum3759GN5tZlee9NhCTmD7SZkkzcI6sdiEmVx?=
 =?us-ascii?Q?5b6p/htXtzKoWccmS1O+KEjgylwCMDLwd1c02V7PQ8n7wu5y3l7vD4PRxWGl?=
 =?us-ascii?Q?4TYXXFThm2d5qGv27Lk62KMXcygKTDzHy+uKNaIpUWG7qI3xwZy3Mc54R9vH?=
 =?us-ascii?Q?J4I6+AQjADezQRJNvGgf82x/h8R3yPxTxEee41LqdwBDpMK/wxp8NlgZmOeP?=
 =?us-ascii?Q?PeHARXSv98i+QjYROKfLZZ1w/om3+w0BxVQVMmAUlPf+JTPv30fCvIXFRCw6?=
 =?us-ascii?Q?YBndJ8iemrqEBdaHRzhBhVukBlXWDxJy99aIppjikZTEY+pJXIVObPHbzKqd?=
 =?us-ascii?Q?QdjIP7I3vLVrEHojalx096yejwZ6UDh6EAqL8jXUqLlejBf4/NTBj++8b4J5?=
 =?us-ascii?Q?6thiRQUP4Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5570b614-5253-44b4-d224-08de643605a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 21:40:31.8159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A1EObf7I7VWhL7uEbEjwilWFNE522VgndJ2fEpWP9uvSxzoT/c4LZAz4vA05alUp4q/Wx6l0WXeIAJkTwOqQbwFAHt2qo7vtkQTkdu6nUWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9733
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.22 / 15.00];
	LONG_SUBJ(1.88)[251];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-27925-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,microchip.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,davemloft.net:email,renesas.com:email,lunn.ch:email,bp.renesas.com:dkim,microchip.com:email,das.au:url]
X-Rspamd-Queue-Id: 59A33ECCDF
X-Rspamd-Action: no action

Hi all,

Please ignore this patch, as the patch header got corrupted.

I have sent another patch fixing this[1]. Sorry for the noise.

[1] https://lore.kernel.org/all/20260204213524.3437-1-biju.das.jz@bp.renesa=
s.com/

Cheers,
Biju

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 04 February 2026 21:26
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; netdev@vger.kernel.org; linux-=
renesas-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; biju.das.au <bi=
ju.das.au@gmail.com>; Conor
> Dooley <conor.dooley@microchip.com>
> Subject: [PATCH v2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renes=
as RZ/G3L RMII{tx,rx} clocks
> To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn =
<andrew+netdev@lunn.ch>,
> "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumaz...
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> As per the RZ/G3L Hardware manual, CPG_CLKON_ETH register bits{12,13} are=
 to control the RMII{tx, rx}
> clocks. Document the RMII{tx, rx} clocks for RZ/G3L SoC.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Fixes: 3ac2aa31b489eb4e ("dt-bindings: net: renesas,rzv2h-gbeth: Document=
 Renesas RZ/G3L SoC")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag
>  * Added Fixes tag
>  * Fixed typo {tx.rx}->{tx, rx} in xommit description.
> ---
>  .../devicetree/bindings/net/renesas,rzv2h-gbeth.yaml      | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.ya=
ml
> b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> index fb60f745a1ff..2125b5ddf73d 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> @@ -58,6 +58,8 @@ properties:
>            - description: TX clock phase-shifted by 180 degrees
>            - description: RX clock phase-shifted by 180 degrees
>            - description: RMII clock
> +          - description: RMII TX clock
> +          - description: RMII RX clock
>=20
>          minItems: 7
>=20
> @@ -77,6 +79,8 @@ properties:
>            - const: tx-180
>            - const: rx-180
>            - const: rmii
> +          - const: rmii_tx
> +          - const: rmii_rx
>=20
>          minItems: 7
>=20
> @@ -170,10 +174,10 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          minItems: 8
> +          minItems: 10
>=20
>          clock-names:
> -          minItems: 8
> +          minItems: 10
>=20
>          interrupts:
>            minItems: 15
> --
> 2.43.0



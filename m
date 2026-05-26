Return-Path: <linux-renesas-soc+bounces-33134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIfBCSZIFWqLUAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:13:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E1C5D18F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 09:13:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9AE33004211
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 07:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178C13B4E81;
	Tue, 26 May 2026 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hwmq2jjV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011012.outbound.protection.outlook.com [40.107.74.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDEA3A83B1;
	Tue, 26 May 2026 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779441; cv=fail; b=blIRJBju0W25/UDjXSPOmKXemEuZ+1ef0C6lS4zWjmxCq9yPQx0UAGtvZcRoTMoQ1Mp/PX6oYNmNHtgh+ECgDtqgWYLXZCsfXEiTbkjqYlllToof0DQk5uFPop1mUrc2CzSzvT3dllSR1/7PaXVz4ISPPmBtRQ4GV3CAjQCo9e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779441; c=relaxed/simple;
	bh=QhFk3jBTeZ8CVcFqzKjwcNdZGJ8ECl8ng/Ja08JUjCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mpG1785H7tVrE1dsZwh6FXO6iDwNIC0ifpOAISD+5c5moZe+2z4e/RDu+dxPoSfY9qCnEtMcNhyxNLKTZ99VqK27GcZmos5oXr68ldV50uFY9iyAeNvsO3YCWmCzq2cH7L72JBizhXtnpwL/LnLYDuK5AQYLtRcAhmhFE/Vg7tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hwmq2jjV; arc=fail smtp.client-ip=40.107.74.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tg8N0dDKQvfLvztVEeYLJ/Hd3OuC4gnRAgbMXRrhd6XYDaFawUiMBM9UWrtQhzfc8AKS5rIJeDoiu6eC2ZDZRSuZ5asI/tuwYydsUZC1Iqbi26LuFmY2UAPIeU2NDqeVJHZDHO80H6Y+pENt+CxydPRL8CI6XteRS10ejUYo+cIxf/rbdoR1yQzrhrM5CS+jPiqL9JCOBoeluX6I6DH1tBg1nrFNrThK2HY7HJQOIg5DN49O0UBk3qAff1pyGK7lOmpJ5jKQfOlFvuTmtfPMwGKK4lLoLaGzVQDYTanOooiHvTWdJXMNUvG/o8jEba4pHCgiBMpvE/GNnJ6tWnUe/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ru95XIWdaAYDG2JSDUBBng2Dxfkf0RMwN0krD/UlGtc=;
 b=MvJCmJof7QCw1lE42is/qSlBhXH3rm95wFrM6OywYWmXvQLHyaHZAbZpCkFTlQ5dCtZbKuQ0rr9xCNaiiVjsZ8drZFo9EA+c3oAlBUg1Nt20/+0uRTZhv44oltb5L9ojYvBB3ivQsjNWFfR7D+dnNf+LJO8DXHAVUBWVV5AA0VkT2sHARdRMkXf5H12e5WwLCIDlTb1bvnIAvq7B3Dbn9T4w5kfbz5wb/55T7qMbiaa4vc+hM/Q0pvGq+Umtzap+poruP+2J4PdvxFY4jhtpdwWPa6wovl7Kf5QF+eATS+imT/43oV1XU/J9PUDF5yBmGTo30GXRpQlFfeuF5wHEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ru95XIWdaAYDG2JSDUBBng2Dxfkf0RMwN0krD/UlGtc=;
 b=hwmq2jjVqsMVmZl86ljO0UJjypDrmPeAB9N3d78Lrkj1LUNVDhaHyezlXbcKIl+K+EwzhdDQmuMtwh8SGd3QvJ2DhJiJrzXOz90syXYyT7HvgxnH+cyVZsgP1DgQxU5UFqQlByDNizQcLvtPby599l6pUIwisLyHO/rZ43Hsl6k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB14166.jpnprd01.prod.outlook.com (2603:1096:405:21d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 07:10:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 07:10:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Thread-Topic: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
Thread-Index: AQHc67XSOXReT+gxn06RqQ9MqkvErbYf5RAAgAAAvHA=
Date: Tue, 26 May 2026 07:10:32 +0000
Message-ID:
 <TY3PR01MB11346D70EE900B94D60F70D98860B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260524194457.479681-1-biju.das.jz@bp.renesas.com>
 <20260524194457.479681-2-biju.das.jz@bp.renesas.com>
 <ahVGkvLudN2c7VM7@tom-desktop>
In-Reply-To: <ahVGkvLudN2c7VM7@tom-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB14166:EE_
x-ms-office365-filtering-correlation-id: 1dbf1d8c-0b8f-49c2-269b-08debaf5e021
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|18002099003|22082099003|56012099003|11063799006|3023799007|4143699003;
x-microsoft-antispam-message-info:
 PS57cDy3kJ+EIM11DyhkXIaJNF6VEzvU0JvW6MXSMudd/DneE/h6nOlauWijvkbKR6Fbbmi6N74NDATrqu3yK7M3861SdsKXJLgtCaMFAoT3kqN5gxdi8HUEHUwEyES8OePCYqvXk2at9xHMbRCyk1SIolTQd73MHv0NPDQlqcZd1z/5zYbDbDhPAAvcz/Fq2x/3BIFqhSGnVoLhzSsHvOQh/7aUwa79gr8ZW88MZ1W1NFWif9K8mbymdhnC5oRX99PSi3TBFVmQfVo/1yKgqQ2mZpOv/v4Q7xZwR8bpqOWAMkDLvzC4ntDKCK+fi60CKFRHOuiuYt0j4IuLRsrr8QbwkLV7h8I2aLVPnuvthbgsquoQu0OEC9309W5qswYp6cpyZfTPYGIww/nXKrKLbpxCPuaItIq/29fffl6+E1bRh6dF7xaOiLSh03fqkrWKGR4TceOlhqcOAQm/PBB3Z0h6WzTpOwjmdOEE7BENOnQrRrTRenwUbvoXsrAz7c49mzL7rrBOyxwInCrDn7+KhHV2q/0HEls7c9zcZiDv2uH5CYgVyaCcD+KpOKtjs7xnK42wrmsZnEFaSLBLHE9p53wRkuQjmJvHj7oZ4IQC9LInE3lJ2hxvL2OynTvIqju2KZeV5O+YGN+OPT88r3zP8XrT26wWYq+L+j2TiS1k5XMfW+Y/fbEk54GmpO2X43ufYVZmKpc6oHV/ITdYKGiglA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(18002099003)(22082099003)(56012099003)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p4yhsOxT3MbYSPtbv9vA9TqD8phbHWUJqJvPiRgxsNaLhdI/jRetwFnsNeG9?=
 =?us-ascii?Q?rXDF21+E0p1VSu2VCuILmsNxkZ8oFUA3kEzJqo/WBbCOX+DghsUlodp994oj?=
 =?us-ascii?Q?ev7UHEk2pvT1/E9mSdSTqapxz+ZQSkP1UeMtVE4mTUQoDYRr83/SlWfnnJQf?=
 =?us-ascii?Q?GTaJM8OwLohIs9juRv0qSpv6h+pEdOWOgzO1ZmIqb/jDKAgcrgbMcPFkU/D4?=
 =?us-ascii?Q?NKq/vbrRh2fjTEZ0QO4xWlFo0MK5EWbqSIDcDgTsoJY6tnlVXCCP6HmcV6w2?=
 =?us-ascii?Q?2rgPV0uGPBnWmnlQMi3PvrzkassxjRj4tM7iHeEuWbgdd0m6tT0BowOpmPnl?=
 =?us-ascii?Q?qvq6HUinD2UO44fj5nfoT9WkzJJaWQXw39V0XMbsFndMnpCj1G6uc1E9LDBZ?=
 =?us-ascii?Q?+6KxYIhQPpc82cNR/Wzv4Jd1nmQ0wMb9rgg9php4HtKCeazZ1eAmEI50YdL5?=
 =?us-ascii?Q?GsBcB2L0XGN1Ku0+JxAfbwuY2Y1mRloigg7snLM6LTTX5ich3vEWFU68XUBw?=
 =?us-ascii?Q?zjuT8ryu4n/+GP/KswrLc5d3af6LCbLg4IjJ+mWvxZL0pgNiIQlmI+PmGf/R?=
 =?us-ascii?Q?7Tqy/nIJHes//+WdTe52KDa5TSlEoMkV3yZbknsUt3SrOkigsS2Bx3GZJd0n?=
 =?us-ascii?Q?txh3Nw4/j6wxCOGSSeIQEfUFcgc2QF87Okq0GicvmVk+qzX4QOeAqiKbWR5w?=
 =?us-ascii?Q?Q/UD+wcixWbRnCyHZf9Yi8f2jii2L0dik1UqfgUgLu1PX1CncPsO6Aczn4u3?=
 =?us-ascii?Q?XYy/GL9vub5NHXvdhCVJwsi9W5njPPlNSjlZ/DGsR90fLVbgxr7awPcLS3Dx?=
 =?us-ascii?Q?6i9594B98FBqxUmTUA1slKhV2T+TPDHgPlZvP+OK7BHshF11AkhU8yAiCQwk?=
 =?us-ascii?Q?/sh8dXzBLB1WzdPqvdFkmy4u2Z+j5PZk+hr853wKwvx4JWvWsUKq7erAL1eb?=
 =?us-ascii?Q?kxOWzuLnj4pTX907PKr5cXepGmsB9H9xtM92OSZlWJAY3ff7ZZGizBF6jkSD?=
 =?us-ascii?Q?nAmbVRWgY1e0V3ZTms0qzm+QcGeLuvKB0vQ5eOeKQzPF5VDy6wL9LWUillX0?=
 =?us-ascii?Q?okvDtkO+PUm6i03xCETdau00QE10xNHdxWNrN058J2m77bS2lQtSNO+sMMyc?=
 =?us-ascii?Q?M94D6eqoT5IrxWdUgjoopon+obtCgxM4yLmrJ8pBmqCp7NaI+FczVagnPfcS?=
 =?us-ascii?Q?cx7cnNDvE0Cf6I6z86KBOm3PmejKWO69UuHIK6+86hqm4I6PKQHr8YA85Qvf?=
 =?us-ascii?Q?6GjAned1Qp37UyRNn6KpIXZUtF/CJCGa2aGCE45nX6f/Q5ud9/xMmuDuLkcX?=
 =?us-ascii?Q?Zs5jci1scc39gbOvyP7zJVwjsLvP0Fov7erS8+Ro8nBEeN+KVLLHthJynPpk?=
 =?us-ascii?Q?ml9r32O3/95bcRsuuh0MKEN2HCo1HMEKCLjL9PQkrU+uF9Th0Iiu4WfpHZnC?=
 =?us-ascii?Q?g3g8B2BLFO2gcEE1xUsxKy5Y6RVGumMV8RY+xRLwE4FWb7kF4jxmQlEaSpa+?=
 =?us-ascii?Q?zEkqnQDyDHHu+vHHs7GGlEu5sm96qgtJ8dgUQB/opVW5fSsJ9RE6cLBDfPE9?=
 =?us-ascii?Q?HqD8UqyKcImc025jA5hb4T7uxe1sXZeb8LfbRrrW1/Wa2tB1f/dQQJElWBd1?=
 =?us-ascii?Q?kbaAcMrgPiPKsq8AXE4hBmhXz4y1UDVzEcymyv8WXRXXf09loojnwFRuGCLd?=
 =?us-ascii?Q?pBoHOML8zzYD+VTwB1TQf/wUGzmUGHdB7sqOz36IpMPOVlNbkbGozz+CQYar?=
 =?us-ascii?Q?1cAoJFWa5A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbf1d8c-0b8f-49c2-269b-08debaf5e021
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 07:10:32.2882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01Q68T1BvbwXv6hJGCtm0gbx4GNOks3Ve22K91eZjXQu5eUer0qHuWooa97uLbAiB6l12qUPRZEIuR3KcQxJJW0AxU4FJfaPNPIHOqMND88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14166
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33134-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,glider.be,ideasonboard.com,kwiboo.se,bootlin.com,lists.freedesktop.org,vger.kernel.org,bp.renesas.com,microchip.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email,108a0000:email,0.0.0.10:email,0.0.0.0:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,devicetree.org:url,0.0.0.1:email]
X-Rspamd-Queue-Id: 72E1C5D18F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tommaso,

Thanks for the feedback.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 26 May 2026 08:07
> Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesa=
s RZ/G3L LVDS encoder
>=20
> Hi Biju,
> Thanks for your patch.
>=20
> On Sun, May 24, 2026 at 08:44:50PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document the LVDS encoder IP found on the RZ/G3L SoC. It supports
> > single-link mode. LVDS and the DSI interface share a peripheral clock
> > and the MIPI_DSI_PRESET_N reset signal. However, the LVDS module
> > cannot be used at the same time as MIPI-DSI.
> >
>=20
> Same here, this should be v3 instead of v2.

Will send this as v3.

Cheers,
Biju

> Apart from that patch LGTM.
>=20
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>=20
> Kind Regards,
> Tommaso
>=20
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * No change.
> > v1->v2:
> >  * Collected tag.
> > ---
> >  .../bridge/renesas,r9a08g046-lvds.yaml        | 128 ++++++++++++++++++
> >  1 file changed, 128 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvd
> > s.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-l
> > vds.yaml
> > b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-l
> > vds.yaml
> > new file mode 100644
> > index 000000000000..b1f6d020ae7b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g0
> > +++ 46-lvds.yaml
> > @@ -0,0 +1,128 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/display/bridge/renesas,r9a08g046-lvds.y
> > +aml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/G3L LVDS Encoder
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > +
> > +description: |
> > +  This binding describe the LVDS encoder embedded in the Renesas
> > +RZ/G3L
> > +  SoC. The encoder can operate in LVDS Single-link mode with 4 lanes
> > +  (Data) + 1 lane (Clock).
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a08g046-lvds
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral clock
> > +      - description: PHY clock
> > +      - description: Dot clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +      - const: phyclk
> > +      - const: dotclk
> > +
> > +  resets:
> > +    items:
> > +      - description: LVDS_RESET_N
> > +      - description: MIPI_DSI_PRESET_N
> > +      - description: MIPI_DSI_CMN_RSTB
> > +      - description: MIPI_DSI_ARESET_N
> > +
> > +  reset-names:
> > +    items:
> > +      - const: lvdrst
> > +      - const: prst
> > +      - const: rst
> > +      - const: arst
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Input channel, directly connected to the Display =
Unit.
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: |
> > +          Output channel, directly connected to the LVDS panel or brid=
ge.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
> > +
> > +    lvds-cmn@108a0000 {
> > +        compatible =3D "renesas,r9a08g046-lvds-cmn",
> > +                     "simple-mfd", "syscon";
> > +        reg =3D <0x108a0000 0x10000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        lvds0: lvds@10 {
> > +            compatible =3D "renesas,r9a08g046-lvds";
> > +            reg =3D <0x10 0x8>;
> > +            clocks =3D <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
> > +                     <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
> > +                     <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
> > +            clock-names =3D "pclk", "phyclk", "dotclk";
> > +            resets =3D <&cpg R9A08G046_LVDS_RESET_N>,
> > +                     <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
> > +                     <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
> > +                     <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
> > +            reset-names =3D "lvdrst", "prst", "rst", "arst";
> > +            power-domains =3D <&cpg>;
> > +
> > +            ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                port@0 {
> > +                    reg =3D <0>;
> > +                    lvds0_in: endpoint {
> > +                        remote-endpoint =3D <&du_out_lvds0>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg =3D <1>;
> > +                    lvds0_out: endpoint {
> > +                        remote-endpoint =3D <&panel_in>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > --
> > 2.43.0
> >


Return-Path: <linux-renesas-soc+bounces-31080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGfeDJKL12k3PggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:20:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3F3C9991
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 13:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FD0230087FB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 11:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5E93A0B26;
	Thu,  9 Apr 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K+IXn1SK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE48C3C0638;
	Thu,  9 Apr 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733334; cv=fail; b=Hysrn5N6bD69svBkchaNgnZXIeALtVtviVzjqtSdn5gUNyEd/8ARMsILje9kwX81Id0zY6dIq+liR+pSjVifZq30JwjE0wUxY43UAOOK2naiDX7N8cnwTI1BMmOdUs+bSjxTz6fM9EL6FpwrcyeXCHX0NvFooR3vtl121RnCQnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733334; c=relaxed/simple;
	bh=cxDRSFiuZpvpJRiZuT3AiOLLGyeOw6vTPZrAhMDnzls=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oNh/xFqy+4Vj72r7xYPaeHR5mCO1wkr72sW9YTrO4X4MCrGGMbun0TQzHE52jwngev5lbS+EINlZOexBvuG8FOvVM1hpkY5AtN4j03YRHWc/aEsbHLub/iOsD4jWJfMm99uzCWUzfh9ArVfXhh1QxhPaQio1yehLbHUtVAQIOcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K+IXn1SK; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkYBsrP9CMszfV0aiZGN8TM7XD3FtjxkIdELsJbkspxQgQIBF2cMRGFzB5sXFZO0phCreK74B2OIj6U6EfZAT6K/qh/Il2LC9iasFfB/pm3eI0zb8QyxqU5NNr4TPOrFOJvrfSzqpxxJ1OoZ+wgGUim8CsfEdHFkJjx8KwYSmYQKnMdBo4UuYBh73hwemHLeWgH0G+PCb10PIKwCIvWcvwkWVY238UUrpAxmJTOJ2OMn8aaNBqfr+QiErcAswEBs97mPK9Ri6y8RKTN0UY6KDDfqjOlgPhyT9a5mgRuoy/+4498kx/h/2StQ2W1+b6iKqJoSfEVNNuiIikHS3V9H7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvwiYnz6iaNNCx8n9/4y+CjV5bD4vZ5izpQA3J63g8g=;
 b=MkQYs9phPANZKbn3HFQ+uWXH8/aqjnDQSoGrP4DC0RKrEeQROUV1rzbmYbBMHDCT/FSbn2HmVzsFefxRAXnwqy+Hj4aEKUKHHWB5nXD/epe6tEjPREWLWK1ugZO07LNwuIaBQ170V4x8ZszsTHKlNx/4WNu914AimqLiAJjMiIz8hRu/B5WCc0HrnQ+J4gJTZELy3X3vxXV/mnxwkY/kzuexb1lzOG+//2zzXIai4tb1ZonFU6Akl6i7TiRjcOfr3eI7wAqu2uWUJfm4Pib4Wz97K+WMN+0XlbhCCs1L9jJWKP+TRjRIZl65byV+fv/lshVS7cJIHlicqEPgHk+lDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvwiYnz6iaNNCx8n9/4y+CjV5bD4vZ5izpQA3J63g8g=;
 b=K+IXn1SKIgUHlshUF573plVJRzTDNkp/Ag6aUtPCg8T6oVJYcF30IZCrdMkzTb/kJrblrpSNQ+VCabzgHhEpt1i5gTo6lMmDONRC4SA6lFYsTZcgVtAgviVOXGXq4QBKINPIIF38xNDWSMDjNhH2SUoc6dkUc9hUfnMYBPKpjVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15925.jpnprd01.prod.outlook.com (2603:1096:604:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 11:15:30 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Thu, 9 Apr 2026
 11:15:30 +0000
Message-ID: <61f294e8-f9ae-4868-8dba-60250279ef21@bp.renesas.com>
Date: Thu, 9 Apr 2026 13:15:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/21] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408122436.GH1928916@killaraus.ideasonboard.com>
 <dafdbdcf-98db-473c-8122-296af1922e6c@bp.renesas.com>
 <20260408141638.GA1965119@killaraus.ideasonboard.com>
 <87a18664-d19e-4434-8f92-1c7ce4f3a131@bp.renesas.com>
 <20260408150053.GC1965119@killaraus.ideasonboard.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260408150053.GC1965119@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::10) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15925:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ab0709-492a-4238-e336-08de96294f28
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 xGotiDuy1d9aO0QkCdoqQB2UojAkdMR3ikhHPb52fzf9I1ajA0p9sV0w73xMXGKND6UzjdHSULR8y8i53S4DbRS+zxYWImzs4G+Y+4GBKBxVravduIaQKvpkkE82YvGMq3kkhhxO/xP+loSyA9b6zFhRipS5bRG9yCZYDwMO5XtjWShS1x/09LBgedugJODO7uD9QaN8mHMkTZhXW+l28KfbPNwc1cyT5bOfvzEY19xwmmmdnKwyeZCpbmQrB+Zmz0oYF5KsA5udWJT4RO2hX73tXIVdiuJM/ISqloepjaLS87UOujl5JA6UBebVquyK0JHE/jmKfGXqngml877xkPBGAXGbXsCg/s0WDYnghJylsY85M2Z0J5vbd6JE/0k1KrRttWIImY5YYz95i7BHopVq/hb3oGFRqdDWIEFD2Gv48iERLUVuMBr2GHKSLowVZ1O9kStYbkgi5OxWvUdQKKXV78FbM6WG9vKCByYnmkur2T64g2Jfr4UF76kAKxhfVmAoLy1QRlDcCWR4UkSBd1C1pRWtIz02f/vK5DFOyNJhWPLZKB91FwIG4KwOtIUcTCipO54s0o2d/rUzk/rUjsVmouiulIoDFrS8lWglmiYlunfRXE9RekuPVmGRTxUFUF3wgAQTVs/RUh3UuW6U9P9SXHU3iSYgBUL7yGiaeqtMPkA4V9/v0zqydY4q92uacpvC4sM1HXOqcFpnPvNp7Rm2WpbW34/OHpOMBv1kEH8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NTRqVmI4Uy8xY004K0picm0zcEw0ZHRMUzZWWnBOTUtZdUhRbjBWZjczY1E4?=
 =?utf-8?B?RGliUkxwQ1hDY2FPNDBuMmJuYjROb0EyWTh2cy94QWQ3Y21SMjVFbnZuSlNY?=
 =?utf-8?B?LzZyMFVndTByWVBSMEJ0RXdYU3l0QloxdkNDaU9jWFY3aVJWRGVKWmh3bEox?=
 =?utf-8?B?eC9pUmVvaTZmbE02WkFsd0dLdi82ejcwVFNVblJBZVg5TGllVlhDMitrSURP?=
 =?utf-8?B?Z2FiRDhXMlZ2Z3Y0cUNXaENvOEtOS3BFRUZxQkdwT1lOR0ZHR0JtY21qZkZn?=
 =?utf-8?B?cUtKSTQreHN6ZUs5c0xjNmgvS3p6KzNmWW8rV3Z3VDJReGRLVnAxM0x5OTF0?=
 =?utf-8?B?bjlzY2N1TzNBVEt5aDcvTm1Bckg0bTRlamhXbmpyUnVYaWpEdDJDdjBoa0M3?=
 =?utf-8?B?eEdVSDVUWGI4QVJ6RDhUQU9qeXdNaW1laUVwR3ZWemp4dm9iZmtZbk0xRkNJ?=
 =?utf-8?B?alZ5M3NKeGRPSDlpdm4xNnV5VGpIN2JNYTFSSXhvQUxRNEt1YW1lV3Ixb01G?=
 =?utf-8?B?cGpBa0dtVEZjaFdobGN3dGpJaTRHMjQrdWhiZFIvSUlUOGxITXJMeVBRWVdJ?=
 =?utf-8?B?ODV2L09hdkdQUDdNTFhzOVhCN2xlajk0ejlFTm9IaExtWTBlZVBsVE1aSnMz?=
 =?utf-8?B?V1J4WmpTYlBpc1lRNjZmSHlTYThqUmtKZG1Ub1ovVXNhWnNCNnREUGJPaXM0?=
 =?utf-8?B?Q3hvNTR4RGdSVlhBNlQ0Y3ZGM01WSFdoYjl3WnVDVG9LdlhCaHBGNFJlNmQ0?=
 =?utf-8?B?Q0tLZDNMcGI2a0tLQmJLdmt3elVMUXliNUtwREt5cFQ4THROa1IySHBXeUxV?=
 =?utf-8?B?UnhOcnRLQTloRlRXanRzSVM5NExZRUlkdEVZVWJ5L3pUYWROMjFXRXhycEZw?=
 =?utf-8?B?OVZXc0FWSzN2WjVCa0F1MStPdUpyZlNMWFNySE5kTkVxUWJuZFhoMkZCdDdr?=
 =?utf-8?B?aVVqS1IzMlNBR2pXaDlKN28waTdtcnZhTHRZWkMwRitPQ2hBMHJJZ2hTZFRl?=
 =?utf-8?B?eGNCaDhhUTBUeExIWG54THJXeEUrQ3dwaStEMFlSVHVBS2tMRlBVWUp3clVj?=
 =?utf-8?B?UmtOaXd3aS8wVEdwaDBHdUV2YkdNaVYrTnlQOERQQ2lQM3c2NjdhNVFCVXg0?=
 =?utf-8?B?Y0RQVFE0VEtqNVhEZ0JHT2ttRnBmTDRQZ0p3VnRCcklQVlRTOCtXUVl6RHBB?=
 =?utf-8?B?SU8zTnQyNUphbmFLUVFEeVBhcmQ0elNVWVpWVUl1WXVGUTlZQURoazN5eUxQ?=
 =?utf-8?B?WW0yZWROT0FWaklkdTgxSFVaTmhlOVpzOEVhMDArTy9TbUtkcVlrTnlYVXpu?=
 =?utf-8?B?N0Jxd0ZMSlZOOGxFbVAzMVBTakdmSXlXYmJsMnA5aVpzcUduV25tNndsU2NI?=
 =?utf-8?B?UFgvU0tQL2RLSnVpaDh3YW5xeWNzd25mb2NMYmtpeC9lN3EyWVNCbUJiSTRj?=
 =?utf-8?B?Rlk3RHJTSlcrRFJQQWd5S1dyalFDK2poanozdkZJbVZURVFhTUF0MU5zUkM4?=
 =?utf-8?B?Smd2Z1lveXN4eTRSNk0vRWRPTUJ2NW14M2dZZHFVaVlpWmhsT3c3YmZ6T2tP?=
 =?utf-8?B?TWJqVXRFcG10TWh2WjRlQWtwcHBlc1ZCeUViSklDQVR4N3JwRUY1NEFSSjJl?=
 =?utf-8?B?cFFETFZDSCt6SEw5RHB5RXQxM3laREZ6Z25iUWNzSDVpQnBjcFlGZHBnRlFh?=
 =?utf-8?B?ZEpORUNlYW9JTWd5OG1leGFtRVFoK0VOdFZEMWFLUzRvWHo1Y1JWWG1YS0x2?=
 =?utf-8?B?N1ZlVVdndGFQbk9KOCtobkxJb0paL0p5ZGUvN3A4YmRqRXhZdHYwb25JUXR5?=
 =?utf-8?B?eUZUem51UkVyaS9KY0h4MFV2MGE0WGVuOXNpMlNxWXFXbGhncGxrN1BzRVNY?=
 =?utf-8?B?ZVF6ZEpPZC84djJyWTdUOHlPQzJUN2toS1hkSUpMdmJBMyswdU9GS2orSzV4?=
 =?utf-8?B?MDBMckJPTS80blBKK3psMlV5MzQ3RXZXUnpCTU5CVTlyVE9OQ1hici9mbDdE?=
 =?utf-8?B?eGFITmd1ZzltY3MwRUtrM0NBQWkyTGtob2ZrbGh0SnlTVWR2NFpqY2hYNU5P?=
 =?utf-8?B?OG9QOUo4aFB6b1M4TThYL3hSVXMrTjFidkp0UG4wT0drMllCVkIzRTlZZjJ4?=
 =?utf-8?B?RnNjbnpOUEg0aG4rSUl3a2JIa2N2OVlYd1hibVlweG45NE5UYklaUzg1Y1lu?=
 =?utf-8?B?VndQM0dWcGt0WVN2bkRDQ1VXMllWSXpKcXhUQWRLQWpqeDBBS29XVlV1VnA4?=
 =?utf-8?B?Vmd3ZGtwWTRhcVpIa2ZpcVR0a1RBcTBjS2p6bllPY1BmRHdoMG8xWUluNk5N?=
 =?utf-8?B?THVGZHIzTElTUStEejVPZGNUcmFFNlhaT3pqdElUYVNvQVRKRmU0amFTOXpj?=
 =?utf-8?Q?mXtcvMaAYgYdHVE7Gxyf8oumbQXz6UXwjPBbv?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ab0709-492a-4238-e336-08de96294f28
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:15:30.0266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4CeegvYzZaIvAQdKBKYAt079rOzh8uQQg2DnImEhh6/etdTqKrz44VUhpfxR71EnfDQh/c8yvhcGoR2cN9FiJnTe1OysJrHmvA6Dq6rcc/cNbnUR6LQvw2D3wqQaU4u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15925
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31080-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALLOW(0.00)[bp.renesas.com:s=selector1];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.3:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_SPAM(0.00)[0.996];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,0.0.0.1:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: C8C3F3C9991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,
Thanks for your comments.

On 4/8/26 17:00, Laurent Pinchart wrote:
> On Wed, Apr 08, 2026 at 04:44:48PM +0200, Tommaso Merciai wrote:
>> On 4/8/26 16:16, Laurent Pinchart wrote:
>>> On Wed, Apr 08, 2026 at 04:02:14PM +0200, Tommaso Merciai wrote:
>>>> On 4/8/26 14:24, Laurent Pinchart wrote:
>>>>> On Wed, Apr 08, 2026 at 12:36:55PM +0200, Tommaso Merciai wrote:
>>>>>> The RZ/G3E SoC has 2 LCD controllers (LCDC), each containing a Frame
>>>>>> Compression Processor (FCPVD), a Video Signal Processor (VSPD), and a
>>>>>> Display Unit (DU).
>>>>>>
>>>>>>     - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>>>>>>     - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>>>>>>
>>>>>> Add a new SoC-specific compatible string 'renesas,r9a09g047-du'.
>>>>>>
>>>>>> Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" to
>>>>>> allow up to four output ports, and explicitly disable port@2 and port@3
>>>>>> for existing SoCs that do not expose them.
>>>>>>
>>>>>> Describe the four output ports of the RZ/G3E DU:
>>>>>>
>>>>>>     - port@0: DSI (available on both LCDC instances)
>>>>>>     - port@1: DPAD / parallel RGB (LCDC1 only)
>>>>>>     - port@2: LVDS channel 0 (LCDC0 only)
>>>>>>     - port@3: LVDS channel 1 (available on both LCDC instances)
>>>>>>
>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>>> ---
>>>>>> v5->v6:
>>>>>>     - Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" and
>>>>>>       explicitly disable port@2 and port@3 for existing SoCs that do not expose
>>>>>>       them.
>>>>>>     - Reworked ports numbering + improved/fixed ports descriptions in the
>>>>>>       bindings documentation.
>>>>>>     - Improved commit body.
>>>>>>
>>>>>> v4->v5:
>>>>>>     - Dropped renesas,id property and updated bindings
>>>>>>       accordingly.
>>>>>>
>>>>>> v2->v3:
>>>>>>     - No changes.
>>>>>>
>>>>>> v2->v3:
>>>>>>     - No changes.
>>>>>>
>>>>>> v1->v2:
>>>>>>     - Use single compatible string instead of multiple compatible strings
>>>>>>       for the two DU instances, leveraging a 'renesas,id' property to
>>>>>>       differentiate between DU0 and DU1.
>>>>>>     - Updated commit message accordingly.
>>>>>>
>>>>>>     .../bindings/display/renesas,rzg2l-du.yaml    | 30 ++++++++++++++++++-
>>>>>>     1 file changed, 29 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>>>> index 5add3b832eab..32da0b5ec88c 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>>>> @@ -20,6 +20,7 @@ properties:
>>>>>>           - enum:
>>>>>>               - renesas,r9a07g043u-du # RZ/G2UL
>>>>>>               - renesas,r9a07g044-du # RZ/G2{L,LC}
>>>>>> +          - renesas,r9a09g047-du # RZ/G3E
>>>>>>               - renesas,r9a09g057-du # RZ/V2H(P)
>>>>>>           - items:
>>>>>>               - enum:
>>>>>> @@ -61,7 +62,7 @@ properties:
>>>>>>           model-dependent. Each port shall have a single endpoint.
>>>>>>     
>>>>>>         patternProperties:
>>>>>> -      "^port@[0-1]$":
>>>>>> +      "^port@[0-3]$":
>>>>>>             $ref: /schemas/graph.yaml#/properties/port
>>>>>>             unevaluatedProperties: false
>>>>>>     
>>>>>> @@ -103,6 +104,8 @@ allOf:
>>>>>>                 port@0:
>>>>>>                   description: DPI
>>>>>>                 port@1: false
>>>>>> +            port@2: false
>>>>>> +            port@3: false
>>>>>>     
>>>>>>               required:
>>>>>>                 - port@0
>>>>>> @@ -119,6 +122,8 @@ allOf:
>>>>>>                   description: DSI
>>>>>>                 port@1:
>>>>>>                   description: DPI
>>>>>> +            port@2: false
>>>>>> +            port@3: false
>>>>>>     
>>>>>>               required:
>>>>>>                 - port@0
>>>>>> @@ -135,9 +140,32 @@ allOf:
>>>>>>                 port@0:
>>>>>>                   description: DSI
>>>>>>                 port@1: false
>>>>>> +            port@2: false
>>>>>> +            port@3: false
>>>>>>     
>>>>>>               required:
>>>>>>                 - port@0
>>>>>> +  - if:
>>>>>> +      properties:
>>>>>> +        compatible:
>>>>>> +          contains:
>>>>>> +            const: renesas,r9a09g047-du
>>>>>> +    then:
>>>>>> +      properties:
>>>>>> +        ports:
>>>>>> +          properties:
>>>>>> +            port@0:
>>>>>> +              description: DSI
>>>>>> +            port@1:
>>>>>> +              description: DPAD
>>>>>> +            port@2:
>>>>>> +              description: LVDS, Channel 0
>>>>>> +            port@3:
>>>>>> +              description: LVDS, Channel 1
>>>>>> +
>>>>>> +          required:
>>>>>> +            - port@0
>>>>>> +            - port@3
>>>>>
>>>>> Why are ports 1 and 2 not required ?
>>>>
>>>> About this we had a similar discussion on v5[0]
>>>> We are using the same compatible and:
>>>>
>>>> - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>>>> |
>>>> --> then has:
>>>> 	port@0
>>>> 	port@2
>>>> 	port@3
>>>> 	
>>>>
>>>>     - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>>>> |
>>>> --> then has:
>>>> 	port@0
>>>> 	port@1
>>>> 	port@3
>>>
>>> Ah yes, I forget there are two LCDC instances with different output
>>> configurations.
>>>
>>> Something still looks a bit weird to me though. For LCDC1, which
>>> supports a single LVDS channel, you use the port described as the second
>>> LVDS channel. Is there a reason not to use port@2 ?
>>
>> 9.11 Low Voltage Differential Signaling (LVDS)
>> 9.11.1.2 Block Diagram
>> Figure 9.11-1 shows a block diagram of LVDS.
>>
>> LCDC1 is connected to LVDS, Channel 1
>> For this reason I'm using port@3.
> 
> Re-reading that, I think I've misinterpreted the hardware architecture.
> Doesn't the DU have a single output, that is connected the multiple
> encoders (LVDS and DSI for LCDC0 and LVDS, DSI and DPI for LCDC1) ? It
> seems modelling it with a single port and multiple endpoints would
> better match the device.
> 
> For LVDS in particular, I see a single LVDS encoder with two channels,
> so there should not be two LVDS output ports in the DU. The two ports
> should be on the output of the LVDS device.


You are suggesting the following dt architecture:

du0: display@16460000 {
	compatible = "renesas,r9a09g047-du";
	reg = <0 0x16460000 0 0x10000>;
	interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&cpg CPG_MOD 0xed>,
			<&cpg CPG_MOD 0xee>,
			<&cpg CPG_MOD 0xef>;
	clock-names = "aclk", "pclk", "vclk";
	power-domains = <&cpg>;
	resets = <&cpg 0xdc>;
	renesas,vsps = <&vspd0 0>;
	status = "disabled";

	port {
		du0_out_dsi: endpoint@0 {
			reg = <0>;
		};

		du0_out_lvds0: endpoint@2 {
			reg = <2>;
		};

		du0_out_lvds1: endpoint@3 {
			reg = <3>;
		};
	}
};

du1: display@16490000 {
	compatible = "renesas,r9a09g047-du";
	reg = <0 0x16490000 0 0x10000>;
	interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&cpg CPG_MOD 0x1a8>,
			<&cpg CPG_MOD 0x1a9>,
			<&cpg CPG_MOD 0x1aa>;
	clock-names = "aclk", "pclk", "vclk";
	power-domains = <&cpg>;
	resets = <&cpg 0x11e>;
	renesas,vsps = <&vspd1 0>;
	status = "disabled";

	port {
		du1_out_dsi: endpoint@0 {
			reg = <0>;
		};

		du1_out_rgb: endpoint@1 {
			reg = <1>;
		};

		du1_out_lvds1: endpoint@3 {
			reg = <3>;
		};
	}
};


Please correct me if I'm wrong.

Kind Regards,
Tommaso

> 
>>>> Then port@1 is required for DU1 but not for DU0.
>>>> Same port@2 is required for DU0 but not for DU1.
>>>>
>>>> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com/
>>>>
>>>>>>
>>>>>>     examples:
>>>>>>       # RZ/G2L DU
> 



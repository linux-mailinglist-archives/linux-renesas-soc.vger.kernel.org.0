Return-Path: <linux-renesas-soc+bounces-24754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58277C6BDDA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 23:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id EECC72A80D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 22:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 760DA2EA46B;
	Tue, 18 Nov 2025 22:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="voD37ouD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F23702F8;
	Tue, 18 Nov 2025 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763504933; cv=fail; b=efyDDemc/IDnAgbNmP1UX1L215ZNL+F8BRQ0ZmYFpdt46xBAa+l+I7yv7XPyI2Dw/jaksbEPY15aHj/ZyA5A0t6E6aTXtZbtV5bT58ZxuGEqYoveVBsk/IsbOCYIPi+1RX0Fy72n3UaLxmWx4ZZ1LrPe5Gx7fuMg4aPU5EQd210=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763504933; c=relaxed/simple;
	bh=XONlN9qJXeqX7Wvl7+lW02IWpePk0qzGcKIXGztksrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rq/vv7IQknPH5ptFc6KR1DH+xLcRaSBSIICpLXVj8alN3YrbGVfj5QqfuDbakcwCKZR9oRS7qIlguXFXiRlS4JlBHU3A9t/4iPkU1hWaxH7QFrm5ew0EBKfCoHjKLZhWw3nPl7BSTCmQfrpUQNR4jaHAc+nlUxMRS5hHuP27FqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=voD37ouD; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wnH2oohxm3BTUojCRD/dA32wUVjcQLnW1zKt6TlfD+zbmHAqsnY5+asoJ6KVZh9w52POPuuY4Njsy+UG3STFEmx8lCSJ5YC8lq8F7cmS5sNR8NNX028RuqdMopB+NEWEnEZha5waJz/C9AGpVVssE1ygZd+naJkJIKTWO73ciuSP8yh36MEDI29Lea50WpqV37Ub2up/Irkp1Z1CBdU1gMT7HkjR4Ve31Pd2toF+x7FRD8Tq9DMR/jYWFNgLgcrFo1Qa2RZ9UsW9AaCFegcjqD27I70zPvr3uy9OT1L4ytY/v+EPmKo/HnKxIORGjkofxdEi6cZUB2SaLsVD3xmybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4rOd/nrcBsXpo5KtsbU5Zl9jC04Y7/6Q0YrBsPsG9w=;
 b=agdQsZzfdAo+bBGh0gqmh1FSF3dt1k9aKogr1myX8CwL9n49VwwxnLwie1OD3fGfpnrAx1xmsZDFD4XalrELbmvdwIBGruBvi5Z8zrfS1WcTZzKPcOung3cmwh43/C96ZM250hjAYX0+4gGxdQ48BEe89aQFiDTZSeAFdzj5ZFmCppj8XzF6YLJy7QYlr6uyFwK0QsJKC9uFwfBcK/SoyiPPvz5ADDtDWTcq+zhd4qs41Auo/NSxp4LfcKRV7IH0dFUTzKqjYgt8szi6pWvofUKiVPURwBoogTTKYIqrq14enlF8h3FR4CeBCMEYsL1fG1kuan+0kQPfhnlcKJpeiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4rOd/nrcBsXpo5KtsbU5Zl9jC04Y7/6Q0YrBsPsG9w=;
 b=voD37ouDpSduksbaHMWx8MvuGlDTxN6cXRSUaXfHhCm8CiBHGSmopawZvP9nejR73KCeCuIkCTh2Oei3nviwvGBYKCAN3NPairO0b2FIEj1F0BpLD4tU0jDpG/4Poz3FVPdl2ng+OvqUNIBu3zh/MX8mwRXE3dePFWNXKmOivZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB7132.jpnprd01.prod.outlook.com (2603:1096:604:11a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 22:28:46 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 22:28:46 +0000
Date: Tue, 18 Nov 2025 23:28:34 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Add overlay
 for P3T1085UK-ARD
Message-ID: <aRzzEgeetDFlE3YC@tom-desktop>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <0babc991d3b2163200bc083ef80563931d4b639a.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <aRyiQJsu6gob3Gf9@shikoro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRyiQJsu6gob3Gf9@shikoro>
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: c5bc5f80-d89b-497c-d50d-08de26f1d68d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SOsKT7fQ4XeCAka9dKhR7NJRkRzV0i7yyWtALMWy4D2Z57oYWQLolAT40iZF?=
 =?us-ascii?Q?SV88MW/DcP8z+KDIKC94XM8tuk3oSr9GpVS7/N9/PAgd+SKlR0eGPvbfWaVp?=
 =?us-ascii?Q?kgQF4m1Thyp024/F6ubpzRovvb7WATeTi9tHzHjkQnoNrRzG6Eh6E1O6CQQ6?=
 =?us-ascii?Q?IZN/u18CDXE/hYwJ+N8yTA5nRpoyCvsOu23QWleUtGAD/WZT0rMa4djeYS+V?=
 =?us-ascii?Q?Wl38NPhQ8lzEBp9Xwn9wYNLb86JyEz9SDQj1et5n9WAM3piaHryxj8E1VnwN?=
 =?us-ascii?Q?kJxKIyoW8EzoUCu3xj7nfq6zQVj11ya0HmGhcl4yLYT9QVKx8e3Giw1f6hRK?=
 =?us-ascii?Q?wYrroL2V7010qoutQ6RnfiSzVdmLxka+xuhLHcmiMSwq1fqSaVfF9xXn0eKm?=
 =?us-ascii?Q?e97N4m4kcDwgxoB+F8OE3ZtX9q+l7rw57nXNp4444BSFCTw5sLR10B6K7sLd?=
 =?us-ascii?Q?Y02sqaUkIQhQoWGlmgNk34R6zC2HgGI2E3WlKEJ3ao/8hWjGWW66bHNfei5R?=
 =?us-ascii?Q?ksuZayl0/Xjuh/jtP56E+mP38X2kpoRc080DczjkMQGoy8CXkIrDVBmFZd+g?=
 =?us-ascii?Q?R80DimQFaOWS6Tq8apGhjqDkX1kc0Gsw2+pxq2ihqbqyH97sZmcoF2dl/sgZ?=
 =?us-ascii?Q?acPCTWfEJKU5uzn+qsDSRCZWOzbWGt8/OdFUoebpf3mpT3cebFWs3ryYzS86?=
 =?us-ascii?Q?+1sLDiJWjmonP4OY/aJqavQ+jmBi5YnVpOozTdJLVQqxfxmHCPobHWIMXsEY?=
 =?us-ascii?Q?+DFp8FqK+eA1l6qvH0bb6n2DNyg7vqXq9CiMtnI3huMNzVoix6yfmMva/Qcq?=
 =?us-ascii?Q?1t+BfYX7i+/ta53beHh8q9cgDYTLFuEd4uRorTxIhivvDCq6a6fDoBQwuxz9?=
 =?us-ascii?Q?zvbZ/y7LGsuhcwgq7LoR5zwx4nhVGMRQh3KuDy6o5eDAIYFGCfW4Z5aGiiiW?=
 =?us-ascii?Q?bN0koEr+LcAgshLdiHzZmPtqcw6m+0qXz/8r6em1if9pIwqV6hSi40VDbiN8?=
 =?us-ascii?Q?rY1TiuM/rhekDSdX0unvGhfoSYFKtjnqZobsjGQDnbU/7oiCdZfydP3trHzP?=
 =?us-ascii?Q?47FAdVOF2urYjJmSKnRo17dOXkfnfydDQSJNrZPNyRqzSXriZa/qZ4m9mzmt?=
 =?us-ascii?Q?b5VJ3WXO1MmpI+mUV2wKGQhryfrHBhhhsDl9Od2DI4RetdvN2RzSMTSiwZM0?=
 =?us-ascii?Q?LiH5ZTmEP7ImAYOpyeHDdbEHamFm8JgHUTewyxqIeKGlVY5w02LTBI4kF1l+?=
 =?us-ascii?Q?OMulxhcWiiwLJTWtBhrD42bML7NM/Dp5bWOHU2cHt/itU0lxmJ9InISmwnFP?=
 =?us-ascii?Q?k+zDofwHVeBkKTmXRNvPVkewkg4AkSzyz36k8fI0fbPBKKIQNrHjUf5Ox1c8?=
 =?us-ascii?Q?H6asqCK7cnWYe7cQd60P8qES1iQnAY6iyaY7zRWWIu6WGIS0eyH1Bu8sM/PS?=
 =?us-ascii?Q?lncH40JZulS40WsoqK4b06YTNVDjUnxWTsf+8App+8oYI7I5FyIJBkcIa+hr?=
 =?us-ascii?Q?CxfYKSqTd9G5Mu82jKl2WT9YoyGR8EAJB+PQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y3muyQ/rBVpRFTZFVf5yUdvNfkBMYqUxZT9UWFppa3mjmH6hbIRFlakGpHcm?=
 =?us-ascii?Q?uGQieCQa+VDh2or17QhEl+1WDcn2n5NF0z+HDjM29ezG+8pB0F/nSicuryhN?=
 =?us-ascii?Q?SGCAls9NSVSqEmw+l3HkpJmu5hZD3ZEwWKkz6LiZvXcPZR/x31/jJfXzIlN+?=
 =?us-ascii?Q?HbPH7kG9oGRTnkSltq33EEZARFwY114Nu/IiY1EzKLF+ZGEGz5xOJ18fLBeN?=
 =?us-ascii?Q?Z0dPzw4auZHq5mFX8Xaj6qmLZ+e4AXwpYCr8P1uKbwAf1/I2WqK8vLwy7zeT?=
 =?us-ascii?Q?Wlf4C1bS7Ci0Nzp+AxxXjbUg5fVol9bc/pvKO3qvpHsnmmioXDdQmLK7xP0Q?=
 =?us-ascii?Q?5YWdpvG19dKhxj4Yf2RATqvCmB7SOL34lczd5u2V5wqXjD3q0KfdAtDxXeFO?=
 =?us-ascii?Q?F7SaviWsMgcbsLGYco9fNFSmcL/T1s+SlZJhS6e2ngjpAx00KqgYH0z4snjr?=
 =?us-ascii?Q?ogcQttA8rV4vQhPwrmUubu/evxGMJSvPreIrpr/0egd1/TaazzSRRbGkg5VX?=
 =?us-ascii?Q?g0xGwY0TdWtzDDJtdxiRyl8OhOlz+oiQ3oy5GW7dqBrZuu6gpo8cqQ2G4ZP8?=
 =?us-ascii?Q?yHkahnZaDQa9B/13/3xgFLwHxVsgF839XwKDWbFMWnHkU9n4oDoMfuJQiX9W?=
 =?us-ascii?Q?KdlsqESWvg5IAkSHt3UhE/1Z/hTy3aorTsyW+L79YGiTNzgup7ztzkcK1mar?=
 =?us-ascii?Q?hKq8s1bC/AUahpJr+0JzbvQHXRZ8+X9xc9g9KWXTfLOcdSkPpJjnkSAuxaol?=
 =?us-ascii?Q?WaU48B5n9Mmw6IdLps555GiCDqcZ0tpDHir3QIsQTmZsJW4Inq0GmeDLBljD?=
 =?us-ascii?Q?IiBuszopuNgiyjxvFFM5vOu75GxKwt8z4luhhjbGHAKMsPkiLuFsJSrWlo2r?=
 =?us-ascii?Q?ORcr8E9BORh6svRk6nesn6PZErYQGBWEPKbVFdcmxjK50oEsEyMBbVBUY3Jf?=
 =?us-ascii?Q?cU2CM44oJtBWnGFmnmKvLxBPyw7SkDCMnJb3sQZ7O2R2efBiNnr0GAVs77Xa?=
 =?us-ascii?Q?5U4A5KFFCCp78w28CSyIy9kprTyCbXpHkZeDHX3hqqglpPxfnqmY2N3KzPVZ?=
 =?us-ascii?Q?Fl6TBqbTDMWOHu2y7HzHml38XazxKJ7+SoUoQSbMBZMImXrzDeSYoVbxCANG?=
 =?us-ascii?Q?PfIWJhMv4NCDzpGzvLNeZRLDfNMGk0wY82d6oHM9WDQTM5GQMdkFeLK4X33q?=
 =?us-ascii?Q?C+ArNppaI9xk8xcYqNO+wC/xlk9ytWMFzU1ACSfk17W8moCtWma00gDeSmix?=
 =?us-ascii?Q?KhX+SlJca98imW9xMWihOCCkCRWiAkzmyIQhGvmJK6rkUCiopdOGLNViEoTV?=
 =?us-ascii?Q?d8Gbj0rEwcNr4Qh1Ab79YCrxD4GyEKC5hbFKDpaLucrHhTM+84ItnpvHEPnD?=
 =?us-ascii?Q?9mXIDdJ5l3nrNPny5+PTe9ou37X5a/9dtsRL9b2kF1JLUhae6iWtXRLsILch?=
 =?us-ascii?Q?+DYvEJuOaUI/vXFcr9s/S83uC6+d7oVjCeWdF3kOiuOZoLubVz8JubrkHJaU?=
 =?us-ascii?Q?XoJc+oolocsW5ZZo1t+/JA2Pf1mvEqffUP1I0S1ZQYABzKyOzZeM7uOl4qM9?=
 =?us-ascii?Q?parX8XNSth/a7ZWnXCqjGXs5XcoEKNdX+Nzk1J3aaWdAyJmRygSuLIFNRWgS?=
 =?us-ascii?Q?d9HRgWApT8XsoRG3+xYSRv8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bc5f80-d89b-497c-d50d-08de26f1d68d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 22:28:46.5246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Km5q6TOg0KVAK1AcahvQej9U582AfnZDVRle6R0pIPOrP0LosItTQOJcYks0m7Tu7MahcVK+hCOhcE7jnkomw0z8clNAahaWiwOsaHt3ewoz92nVd3OIEHx/SN+cVYR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7132

Hi Wolfram,
Thank you for your review!

On Tue, Nov 18, 2025 at 05:43:44PM +0100, Wolfram Sang wrote:
> Hi Tommaso,
> 
> > +/*
> > + * #define I3C_BUS_MODE_PURE 1 (for I3C bus mode pure - default)
> > + * #define I3C_BUS_MODE_PURE 0 (for I3C bus mode mixed-fast)
> > + */
> > +#define I3C_BUS_MODE_PURE	1
> 
> Sorry, but I really think this is configuration and not hardware
> description. The board has only I3C capable devices, so unless you
> connect more devices externally, you can always use pure-i3c-mode.
> Enforcing mixed-mode is only for debugging.
> 
> > +
> > +#if I3C_BUS_MODE_PURE
> > +&i3c {
> > +	i2c-scl-hz = <400000>;
> > +	i3c-scl-hz = <12500000>;
> > +	status = "okay";
> > +};
> 
> So, the above is all that is needed. Which is the basic enablement for
> the I3C bus in general. I mean, auto-detecting devices is a key feature
> of I3C :) Which basically means IMHO that this overlay is superfluous.
> 
> 
> > +#else /* I3C_BUS_MODE_MIXED_FAST */
> > +&i3c {
> > +	status = "okay";
> > +
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	i2c-scl-hz = <400000>;
> > +	i3c-scl-hz = <12500000>;
> 
> Despite this else block being debug only...
> 
> > +
> > +	eeprom@1a {
> > +		compatible = "atmel,24c02";
> > +		reg = <0x1a 0 (I2C_FM | I2C_FILTER)>;
> > +	};
> 
> ... there is no device listening to 0x1a on this board? What do you see
> there? Did I forget something?

Ouch :'(
Sorry, my bad I forgot to remove this 0x1a (audio codec)
device from the bring-up/testing session.

> 
> > +
> > +	/* U2 */
> > +	temperature-sensor@48 {
> > +		compatible = "nxp,p3t1085";
> > +		reg = <0x48 0 (I2C_FM | I2C_FILTER)>;
> > +	};
> > +
> > +	/* U1 NOT MOUNTED as default */
> > +	temp-sense@4c {
> > +		status = "disabled";
> > +		compatible = "national,lm75";
> 
> Yes, mounting U1 is a hack I introduced. The compatible should be
> "nxp,p3t1755" BTW. But as said, the whole MIXED_MODE block is not
> hardware description, I'd say.

Ack, thanks.

Please correct me if I'm wrong.
Your suggestion is to keep only Patch 1/2 dropping alias line right?
Thanks in advance.

> 
> Happy hacking,
> 
>    Wolfram
> 

Kind Regards,
Tommaso




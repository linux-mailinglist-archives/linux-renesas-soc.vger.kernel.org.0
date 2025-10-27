Return-Path: <linux-renesas-soc+bounces-23618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08BC0BCB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 05:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBECB189DD9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 04:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E583423EA98;
	Mon, 27 Oct 2025 04:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WrkJnSjQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5371DB377;
	Mon, 27 Oct 2025 04:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761541032; cv=fail; b=tc0oaogbEywfjalc/yGJrm/jrFo7TsIh/aFNUjaSfNzOI2IcG+DMrrgYazp61hkh0AtVOM5HhzSR//lw7IuMZ3/al19huojZ7CLmTuq8uOH4zRpfLLlqtxK8T7NFZFtktvzdzJuijsvzeLnusn0wb2ZuDowMQ6HRO0bwUdOnuQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761541032; c=relaxed/simple;
	bh=7ix2P9Nx7gSchIPp3/aFXNxPZLlq8pWcTAXmBt+lOWM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p1oSbQuBC2Ys4hVtSAVrtg0NsNrwtZB2XzfNL36wjghR3Xm3hurS/zYzSyiuM8508n1dTwTMQ/wpKsU8wxkcfnFWmzd3epypPE02x45mBGIjb/3JYTF9SLHcT86ndpdRiWPXTEpY1YuJ+wh7KMMEKlqHoRxBqEvjQBDLmQZlH9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WrkJnSjQ; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGNW383ekIdswCc0BDF6T7Xdl1AMkw/wrp2VuPEfrRdiha4qZI48N3w3/PoStPBCcxw9pD3B7wIhN7zxuQe4WznGDv9MzQaBqmtOfdXXfBwFJ4+J2P/UjGDYoDeP02XzVM97ATrNqrYCanxvt+6lBHnF3IvbQE12+LJ1Ijrfk3TlmYX1smDkoFRuMR5JyielGeH6/p12wXs+Y6goKWO7QKCmdcaYppD+XxYUm2Wn/YpkMIZMoc0b0WyHxnDe8IBEFYARtY966GfGchsf+E9divltj/zPnGgYmeYVSdKdXPi8j9jPx3TGpGKn/aTeD/JM+3JqkIynN+TMoDSGSL/ILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCpocTVcgRt/hAOArY8ARub0lK99fOyqrr0Pjm9BrI4=;
 b=oGRXMlabgpebxpv1U1uZzOrWfO98X3M8SKMFIak8B4S9Yvb9sfjzdvTnXydhdpWHub0snWx+1yXpXF2GPlVbqOLBxP2a82HT3Ld4A5ahUVa/Vl6Z58LVo1XzNNS8IwCjkkCtUZYvlQDgQPcUW75YjPRkLRgNX5hseh4zrSPVCLRFfFoWqnjQ4zT1INX1fMkrF/CJS7RMiopLq1BATP5SYKHXaiFtnxe73LrR8JNo9EmU3SefU/mG7O8CkfYQqiUe005PpIU2s5LWEBItmdkQCls+ip+0EcCN4qF13QYv4UMro9tGHFJxxH5Nw96Jb9MSiEqRVDJnYAywhGzTKl7p3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCpocTVcgRt/hAOArY8ARub0lK99fOyqrr0Pjm9BrI4=;
 b=WrkJnSjQ3NNPA4jHzHa/wiTl3ZQ7om5ulbwOLXbOQYEyOOKOB+9XYC7CZbmbnNfrICv8rihDxkLrEG1A+NfGtv0d7b+BbkwUYumFHeo1bdIMJG44KW2Gok7o7dGAyuMGvbMp/rWoFB6VsJ2pye8nRThfl+PhogtQqmW2q7Y1pbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8555.jpnprd01.prod.outlook.com
 (2603:1096:604:19f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Mon, 27 Oct
 2025 04:57:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Mon, 27 Oct 2025
 04:57:03 +0000
Message-ID: <87ikg1gcwx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <176129066419.661728.14767654389778601283.robh@kernel.org>
References: <87frb8n7kl.wl-kuninori.morimoto.gx@renesas.com>
	<87bjlwn7j9.wl-kuninori.morimoto.gx@renesas.com>
	<176129066419.661728.14767654389778601283.robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Oct 2025 04:57:03 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: fae6dc4e-05e6-488f-de19-08de15154528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QExHfsB/MtvKhtuwHc7t1M0rWg2R7wTWL5RRxIJFGVH2bCYaXPiwZi7ayTAx?=
 =?us-ascii?Q?+/AZPEQ/Z5+TO5G2hH3nmyPWHSAUdWzF7P9Pvloxd3bJzf8vawDdhZ4QX8o5?=
 =?us-ascii?Q?DkWdTDz8CDtmYssg1cK9u88HMWUTk1NMPQr0XjxFguQ9FPDFEycRXzmrf7yN?=
 =?us-ascii?Q?v/oGrbX0UoWazJJodg50MFOAjuynhzsY8GNxvmjkehArNFLLLTtYol4kwz3c?=
 =?us-ascii?Q?0Wgyl06j92AyWZueOQc4sZYZsCOtIcRAGtYNLFTMxEMtlsNz100DbZBhQUoB?=
 =?us-ascii?Q?mpXvPc7pLJjcck36o75UrkJuPgNlCjlf9suK8nWz1EyZ7TPQd9tD8es40v7E?=
 =?us-ascii?Q?YM62L18KirAmxep3M1ZET4WC5W3/HPY9kwQdt/3G1YSMpiNL81AjQ4/SqE4e?=
 =?us-ascii?Q?BNsgVEfuFgnMxcuVNIsRe34Xhr49OSJ8s8hno4WIBmiLhC76VXFVYUDW2K3r?=
 =?us-ascii?Q?YA58yA4PUqVemWRm8PNz0nPNaw45gKfvrO9t/GWf/+20A5kvRfwXEj8iNKd5?=
 =?us-ascii?Q?tYVEpW86YDq1+Nhmcwjac2Ub1ut1YUifv/cY3jjeH92uFAuD9rxRTaqy+Z5i?=
 =?us-ascii?Q?mXDQcDu2I5Qcy2oISHs0zaQuU9mJgAhJJagzN1JNMuTFivDlXTSkNePiKlPx?=
 =?us-ascii?Q?514S8E4C0ld0FQCdYIwib0bxj1CIp90lijplj+ljlf8NsR0XBYoVhqmoDPqW?=
 =?us-ascii?Q?CxrWtMMS7d2Ta21H0EfGuK9FryPZW/2aQ0GEzAjgEgyVqQVnPTx/npPLk1Ce?=
 =?us-ascii?Q?zWuQjIRt5biFdjJ9gqR3yKGH7oFVo1PDu1hjgA/2jMo50o3tdYxwYZnj+sOY?=
 =?us-ascii?Q?5zMJ+N+edltm1COkcaHkkhMhmrjRQszKW6IwIv5L4kdgyTvWBmM2zKQmrNLa?=
 =?us-ascii?Q?h5LIJA9x9Q6Pm8n+l06ryKxbd+pnXkcDGi5YzPw11fBIPi4zmFPfbKMeuX8G?=
 =?us-ascii?Q?ANSp2qYzyXqLfPUCzx3xrvXGHMOVi8mSZMsys+5ZlXQsdDeyicvQTFO9qd7V?=
 =?us-ascii?Q?U1NIp+cgtVqQS1mN+jS8DUkkamXDoXB9P7QOqP0l9v94zC7aUB3UhAlvksug?=
 =?us-ascii?Q?KJ+RyGugkLMIzvdsyG2oqe8ikgrJjAAvtEKGbXyLOCWtDOpU7B2U7hyVe0rp?=
 =?us-ascii?Q?aJcwet2iN5t19V78azsxRs9R/0RnPlcD8NkSO9a2mAiu3F5T+HUullbGPlPl?=
 =?us-ascii?Q?kkDktK+noWhx/FYZwhWCHf8tV7H7OZVBqX2HmAYeP0DZEfvL9Q5GvbPUf38D?=
 =?us-ascii?Q?hOh+JFxXP55+8AoWo5EHv+IRVEWvPlZybhSernQWb5aTZZ0+BwLyqwjh6oaz?=
 =?us-ascii?Q?4MXYddWel2sUUq231SWb2Rg66H5MW6y1xoitSnUfJROAtN9c0kvpulrpqAyD?=
 =?us-ascii?Q?Sdg5Wm8tRG3VEc5EeeKP4uBiR5/2ss1HXQQgIXwj342QyxejdQblG64it4Li?=
 =?us-ascii?Q?dkjtw0SWjlv6gS7DwXqfVrnLk8qLsybWNFA2XJuZvFjXF80jNbziHncC6nUr?=
 =?us-ascii?Q?Yfj8vCsmFzEAKUT9eBZvm1yyc3amtIUQcn8O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qbXnPRg6Srd/HqoFm+C2HSAukAgHtUiUGBWhDKhLRLx7ItJTIB8t0ldPiO9D?=
 =?us-ascii?Q?Q8Iqu5sF2hR3Ghv6gAnU9KtX91omxnm3WPbpEesu3pgw4WeT1Rxx+qB4+Fdf?=
 =?us-ascii?Q?T+K5bsUhk3KbtcBz2BZj0tELtTUQL/3gTSrPDQoRkdwItDEFcYJjNKaR+0yN?=
 =?us-ascii?Q?i8lvME3ciLwRGMQoEyxAyDDiAZYyxmj6QospGWz2s2L17GkvmT24lFeh06He?=
 =?us-ascii?Q?API4WmGOiSlhnxzWwRnv2kqp6WlEOLKZlfW7IyMl6JWXC+4gZvtbyQNlVjsq?=
 =?us-ascii?Q?Oa0nkzOHsBxo2RPa4Q9VMW/0TjPQLkvjLt6lAGi3g4ZWZK5gEXX/OLSAGhzX?=
 =?us-ascii?Q?viL6wggXllw9e0IMu1uJQEM5+3gg2roGKa6bPqveMAF9pW9kF1JrHi72iYWZ?=
 =?us-ascii?Q?e4kvLaqEAvDCmyv5xGtQv1dPAWr1REFwuOyKXvFGoLs8SCGWHIv5X1HRKogP?=
 =?us-ascii?Q?WhnQkgZx2EoTjc7EYc1o6+2i2MjD+I/g9ob1X3oNNL5tXnTrtTgO5LTboyKd?=
 =?us-ascii?Q?x8CO3gkQRJIl1dSumQNWrN5TjC9qZLdbTwf1cdGhDQlKfR3u05/V73AaM0DJ?=
 =?us-ascii?Q?hw7stavkVALujSbsqpLsfshteX4My7FxkCt6+kKM9wXr2wX6MxkK65ndYExW?=
 =?us-ascii?Q?nlfXsDsWeORMadEpmC50uTgpv2hg68lE271HMZb+pZD+drgOmDng0OJxmsoH?=
 =?us-ascii?Q?dJCeNaCqKiF9ZPq4i7PkZP1qqFG2XNHMWD6xHarLiMeVFB4AZG7kSFgSxB/a?=
 =?us-ascii?Q?i3B4t4L/cDRXkqqFdfNkMyRv/s3/q7k0mWIMXhbYgFxkxICNOLcqAL/55c95?=
 =?us-ascii?Q?dakE5FhMTzmWnYiOAbK/3M8ARrrOfTIB4hqRZ4iY5MiIXYrKR/xSBo+Tg5tb?=
 =?us-ascii?Q?q8k47VeylTkWs50iNErJC0S2o7KOca3arUJThw07Dt7qXfRneI8EpzvnjP9N?=
 =?us-ascii?Q?c1iandJzXViLKSSenKSdmfeNpKl2AuL7J5knKqnZW6nig2ireJ6dbS9eu5qb?=
 =?us-ascii?Q?h3NAqZw5G6ud0FUVArJxL9gv0Xxeuu3BxzV/uRAKd6MerR1dldwSrGBaNHrM?=
 =?us-ascii?Q?Yi+CgkhvLf3jyV7D4r2OCbhfVOEiKb2Tz95XKpUY8dsSdcJshrlPaxJpnnpN?=
 =?us-ascii?Q?8Z0lt+qQf4xrLyVz2hmubgB6iuZu+xlCjD4gvBgrnzfTpI5mncZi1darohi+?=
 =?us-ascii?Q?lpl0uFl4M4BqQYey9nTqYYS1A5o1UODMr0QcisSmKEmyb51R+yX0MMcC+EKe?=
 =?us-ascii?Q?sSkQz1oodcZe/IwDBWd0BMH4qSEOVlBexBcjZdmLKV0DiUauHrON47MADCKY?=
 =?us-ascii?Q?rW/AUGaG2NjTxCXETsC/5N21zQIoJAY33WxO5pfM+EeqoDdQUCOg0c0LnaIt?=
 =?us-ascii?Q?01zwekYTYEVzGb6KylDggBAjyaCpLCShFJCHFhsDkZZIHOmNNQGbbvoR5SKP?=
 =?us-ascii?Q?Fg6vviR6w07CdZKgfyWFXsnEHUCPAwNumC4W3avJ55CiTDokzWvOFTv9eQKG?=
 =?us-ascii?Q?SSAMT6sXDC9IQVqOd0WcBvyYZ7+CibG5ZJBsEzByr3t6R/+DhMVgFvVavZDy?=
 =?us-ascii?Q?HqbAtshpJxPv9oENGOUX3EKfTY5DeuEWBHeH8YirOEobRYEhIHw1eAqKWMio?=
 =?us-ascii?Q?4I37ssFVn5dYg4av/KsFx6o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae6dc4e-05e6-488f-de19-08de15154528
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 04:57:03.4505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCVkycfOjfVqX5eBd+8WTcUOxIbKewZ1ca8O84LuZ9+PTyETpcskzavufpoumfEUIN9tn5Q+POUYZFpAzKH2pCmLUJRG5ydODhAb/erB9xJK4jhX2iCwipRZuFhKZQIE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8555


Hi Rob

> > Add device tree bindings for the Renesas Multifunctional Interface
> > (MFIS) a mailbox controller.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  .../mailbox/renesas,mfis-mailbox.yaml         | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:

Hmm... I can't reproduce the issue. What I'm missing ??

	> pip show dtschema
	Name: dtschema
	Version: 2025.8
	...

	> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.yaml
	SCHEMA  Documentation/devicetree/bindings/processed-schema.json
	CHKDT   /home/morimoto/.mydata/linux/Documentation/devicetree/bindings
	LINT    /home/morimoto/.mydata/linux/Documentation/devicetree/bindings
	DTEX    Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.example.dts
	DTC [C] Documentation/devicetree/bindings/mailbox/renesas,mfis-mailbox.example.dtb
	>

Thank you for your help !!

Best regards
---
Kuninori Morimoto


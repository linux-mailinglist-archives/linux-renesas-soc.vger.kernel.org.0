Return-Path: <linux-renesas-soc+bounces-24531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6653FC55D92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 06:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11AAA3A8200
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 05:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08B33009F1;
	Thu, 13 Nov 2025 05:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eGyss15r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F12512E6;
	Thu, 13 Nov 2025 05:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763013026; cv=fail; b=JbPmVB+N4IBstncDGzMa8moiyGkp1BxminPgXIHhUOzjjbs065ZYw4qSv90PwXvpRTdQ9KbmAxeQ3pfmjS77U5Kg5yR2bNeNUBDPCR3hRI8pDPls3qbltODF94GilrAPUtpR41mXntXrOYGVR5fr6bslGl6Jgn5YwWZqU7k/aZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763013026; c=relaxed/simple;
	bh=tAMLl+ptJ1UBokBmgliehBb1q+IxezD10bJGhVoGUi4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nVwg9lNxaEFJy4d2gb+5Ii77A8x5JF1Mjl7HKkLCe/R9voVeqIWNHfmbfdZ39ZVu3UdB1B6KD2jzoEBXs35K5QA7qp4Tr8DbLRsW7LV2H8gogcXJywScFp3lFA6IWeQMocZj3cLzDB70ZaB6QtxtKzOBvRzPMaysl8dIT+xRdww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eGyss15r; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJkltfjMnInKWdAsdz0RpquWaw4x7ncVuN5j43Tue9z8UCYSWyvbXZ/gsuV+5WyAPJM4RivV+R1qX82E/ccq0+edxv4K7e1R7lDnSgwAEjWiuKXY2GHxIi8EtRtzm5Y3uQgHsJ92wRBI4EMo4NqbEigsPciQHFx7XYBPFw3n54lrfCOvVmRhBA9FyEwMGMMhIm6LQb7OiKufivoa3DIxsit20e2HQT+nn6f3qxqsMk5FpuF/K+WlGaeixh58y9tKFMLHaw1FLAPtY7vCNITNe1zj0n9qBPctsoJNm+Cvxe4q4LWn9Eh3b2wwTsNPFcSUqPefhqpVa7RnvmM0DRT7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZ9p7G/j5OGy5aIiexU8cNIADTxb3Jjya6xzlgieAXg=;
 b=MH7YQIIkvZpB5z3/h2ntiOdlXyo1be/xFJcuY2qLnKvW7yWEgoi5TPwyiEYijKVdSL4P0G4S8odphOzuimb69/wkgZmbxEqzZlvb9pmgUZP/yqbBKmMpEQmF/bkSdUg+/RfC5AZL4nCmxGxmhK0PeQ/9k/1XvsMxn31tHDs5+j6VpeelAEZa9w6vhY9/hvRmns0N9m1KxTwY8YrZvero7jdGA1nKIemZBWGNGFi2P1qYs+Yk5tMIc0B7b4g+D2vcWFtuPEpBFPrRfOaTobMcdweYwX2lWXDBIjY7862O/rkZaRXh2OxYA6O8UNt2NOL3PHHnZBUGwVdnohSK0bKzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZ9p7G/j5OGy5aIiexU8cNIADTxb3Jjya6xzlgieAXg=;
 b=eGyss15ryXs29aU8BXT0F2pA7MmDnXy5nsj8dZNEIHY267A9f1n9ved9wvK9f27FNJ4mHbKSdywYW26tbLnS59MIz/A72ZLs3z1vcpMvpa9Ls9GfKEzucUDnrffxmexrgt+lZqd2o0YA51VIPBvbCxXpkF7kHBuYqdT/8c2Y49U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11731.jpnprd01.prod.outlook.com
 (2603:1096:604:248::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:50:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:50:22 +0000
Message-ID: <87bjl6wkf6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe()
In-Reply-To: <20251112154115.1048298-4-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
	<20251112154115.1048298-4-biju.das.jz@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 13 Nov 2025 05:50:22 +0000
X-ClientProxiedBy: TY4P301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11731:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5a6fc9-a400-48f0-c491-08de227888fe
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A4YZT5rQ8fYvYfLCxRYC2wd4xfXNwWDOBGVtcVg0JmyvAQCWe9pZm9Dzvag6?=
 =?us-ascii?Q?4XQFuJIFUYOOwtzCE7V4IdD0NiVLSwjCJuW5mNdaof5OrGhux1AlhVh06rmZ?=
 =?us-ascii?Q?NuXN3AsYuQl8CnqtKCR630XzmrwE1IX2c8vndATjm20zcUa/5Sbm0aAUDH/0?=
 =?us-ascii?Q?3MT0fMJorEpas9vjTvIJpI0i3AY4CXn16u/hI2WgHsXyPZfvsD2zdanYBI/r?=
 =?us-ascii?Q?+yEsn6q0xtqkQrjyWRdpO+flDW5+6ih8bcYN6dk54CV7LgTUbBHz8OtAZXPX?=
 =?us-ascii?Q?Ze78oDjzBNH8HTKkjNv9QtyUIj015gZiSp2mMFr6RTIbTAcL7x8v/o4JjRdp?=
 =?us-ascii?Q?iOUBFp6EQ93PRftUHMLuLVyTNvz0sDEXcP0iFNDbevbSC3OQpZY+lSgEzfKn?=
 =?us-ascii?Q?x3pEDJjdOsgptxEYFHRoBJsiyRKZjEVmSw1KVM3TOzCSHD734/NNis5RIIWy?=
 =?us-ascii?Q?xqXyCUEZtYzuaMnB42mOXWvdzcyoBvZGv0Q1/HVDF6UYzXgWLY1ZbASGDdmB?=
 =?us-ascii?Q?uRN0TipUq5Tql0Cxjp2zRGY3X98KJaxKs5EJDgh0azypauls9xv0qxSYN2W6?=
 =?us-ascii?Q?3pCyT36AX+a6z17U5qudpJPcCzhpeyXo2EXKLrJeq6kzp0B5FYn1TXv0AqbG?=
 =?us-ascii?Q?3TlYaK1xSh5FFPmZEN4nICwe4KapkePAc8xLlB2wJAALxLd3BgUlYb9Z8cO6?=
 =?us-ascii?Q?G7NcxGiVSkFHS5fXUx/0dQbESTCl1L24/2S47Uk7IXn9hYtdZ/9YIRz/ohL4?=
 =?us-ascii?Q?DTgETND8q/9eIF/Tfaz+0LJK6HR85NXmk0MuP/9QAVnhGxf6pX5A6RkvU+NM?=
 =?us-ascii?Q?fzEzj53aI+XlEyspunGbJzGWylEG1OkfbeSEpydvqXQluhm9iHN2CGmuvfeW?=
 =?us-ascii?Q?q5Aphqlycf2xZ+RljuWt2mZV+qXCOhpU9wcSnWQX3sDo16FWPpiOe4xsR+MW?=
 =?us-ascii?Q?O5lq/ypk8/rzt3UmFSnHdSWnF+Nw4ikPOsc3x7Itv8cR+H8skS1C3YcRSgXW?=
 =?us-ascii?Q?pMO/Z2z43gxNmdRrZEWhsw0WmKnCwLCFpNmJcttomhgcn3QFf7pEztVALzv6?=
 =?us-ascii?Q?iwBmnRY4HMFFUaVXQ+/PyRzZ+DOJ3FFnPY79JZiiULhXjsrUji23R9tKUVO7?=
 =?us-ascii?Q?eaUq3dPxpb3fxs/scDDF1jFY03WDHbhHTypnKzu5zxFb86c2vl1Io1srMQZ/?=
 =?us-ascii?Q?SYRpIleUgXORme3wjPlKwYuUBheOAcU8f1/eBMBnufxl+Qcs/FJRqfIfXVok?=
 =?us-ascii?Q?Fx4fyPTEcwlj4KWmTO7DGN8M8c0n9D/4D0Rx7BNi0BOcsO50D9DLfYkAiA3Z?=
 =?us-ascii?Q?ihmAlPk6amTI54NgJ4uO+Rv5boMkJUfmbvUUxrIcgJ8iHW0/33vXJ/OxfC1r?=
 =?us-ascii?Q?FBbtW5vaDsIFBi5tf0TuaWDfnc+hLQK8HSYu3lyLw0kjnLLfhr3PPacO3EZI?=
 =?us-ascii?Q?6M879uR3NLVQMU/GM02osUM/cUN9bO8RlwI3pjHoGgpXvAT1SG7QL41JP8lD?=
 =?us-ascii?Q?RFxarNb2/WWGf7QycVanusj7poeBmFuQka3x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ebebCaWwy/YLsj30yty4wEUAVz4kAF7rGOgffy9szjolbMLJIMBktkI4cy2p?=
 =?us-ascii?Q?aCQKTsXigpC7Q/zW+vzYb3t4SBFkkZWcl1yMln39fdffsc4Jr8W6NN9Gc7ZF?=
 =?us-ascii?Q?xSXxKuUuRRpulqatituq4TuBC+8ctErkNdhAf3iBPbQl36orWAgDJw4QKIjC?=
 =?us-ascii?Q?eOWaCem84w+KlgzeVnOeWPWPy9EaQIWTrhIfdSZnrbCl56frszKUYPKWi8Tm?=
 =?us-ascii?Q?ih4cmT7r3dFB+3uExngO2I3qLzNM/hDIzTRX+1ZJ10gP4bA1PY+QK2Hx7u5I?=
 =?us-ascii?Q?D8liyxn8sbHxcZLaCRJCcgZmQEFZm4Wrv5sJgrO4MC9ffJT4pD6wYMl/8tYT?=
 =?us-ascii?Q?PBocX/Ot05w31p48Lf2UIZbZg7CRvsH5G94Ad0cQSPV+f9E83lcw+qMW4yt9?=
 =?us-ascii?Q?B3zPmgjz2iJG0yMDmRy8OCCJle6cC9nD9JChZGYGs3HLTKpQn1IiDrsmbl8c?=
 =?us-ascii?Q?WwwavmYpSQxm3VGo8hrDG7yicZPvaTmRXJaYzjynw30TZSCJv1vvfgwzo22h?=
 =?us-ascii?Q?YdtTFef9mRvaJmaQGNuh1mBFHbn1E9lWb3oGAUJGvmQoAazVVcV6adsadVuy?=
 =?us-ascii?Q?eQwkorZEsBOaGewydDYrOXYjDny9/Bkb+TgPAmu3reKfNXec9/LjfM2xoFOG?=
 =?us-ascii?Q?8UCTVSyFtnfm+IQM0HDpIVOSbMfaUXg6957wmcVfKFbYtJ2yFiBHFjJ7TOsT?=
 =?us-ascii?Q?oa+P14Kn5nmZupyrKURmhI5kRnVYWYYMJuu0T/ZFVM0BY7fIHLHZWTARKjeN?=
 =?us-ascii?Q?y8pQBqTJStJyFtGleTrHFsRBmfs3b7Pa/Wqx8VWgrrP+LSbISoPH6NQ6sap4?=
 =?us-ascii?Q?XBVrnPL66CIQi/+uJw6ZHlLebvzwt5lR/NGVsvI0tE/CLexejCeQ+xsH3yc9?=
 =?us-ascii?Q?jPolbRkOFnf9Rn36i/GBV2tYkLutW84cJmu52HnrtiKJlqiDXzGfOFCwrD/8?=
 =?us-ascii?Q?tmJ8SVAiYXYBWJHKZN1RwKh5zCmRGbBkQR0FGrq4nz+TaSIBhL/4Xliwye+e?=
 =?us-ascii?Q?L6TLdM1j7/r1qAJV18NfHO5QF+vFKi/KohLNrzwPGq/rT3fa1DfleNZt/aRl?=
 =?us-ascii?Q?Uy2Y8Kks8xW+xpnNE6tO+mlWteXLtB3js11ouHEygNjvXhlhYnRt3B39tiKo?=
 =?us-ascii?Q?KtywOzDstowefm+hmhuux/e+5WbCxEuAj99k9O7TU+GRt6rgtTnBdz3jQ0Xx?=
 =?us-ascii?Q?HLHNhpEWV580tUoieRObBQzBYWGPcSk66l4449gIq5fLwzbQZjuyxstYMNaZ?=
 =?us-ascii?Q?0kixbJOTg5jb6gjEYxuSdf+J6wC2fW3HQfZvwIDkJOH41fK9wxBhHap9amam?=
 =?us-ascii?Q?CwEzq5kIr9q1B8s0p4PtnNolJX/xKe+29uflipeixofODkW+dD35ygUZvrdb?=
 =?us-ascii?Q?P9ANbOJQFnhaSOiDUZH71riL44U01VnZgtgFp1YAIlB8140kn5iei4MUSt8r?=
 =?us-ascii?Q?6DcTdfTByhTyZLMMwjKP0mZ9CZd6dZE8A6e+I/u/pg/++YVrAX6eE0FlH70d?=
 =?us-ascii?Q?GwbM9Zpfn84ynExDn9slrt7UNP+M0YDrQ2LTQWFDWFmNUrM9OoFe52cCkNPn?=
 =?us-ascii?Q?LKeAiH/nPIO2rvc0zv2O4FRIQo+NYjUEpLcwXVs+VyVLusj7lfOfswwvs/0f?=
 =?us-ascii?Q?mYoNP4lkMd6y33UyRlec4AY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5a6fc9-a400-48f0-c491-08de227888fe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:50:22.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnA28hSeqZXmtNiDHGErwoqanmBb8s59mFR3/UYkBrcuYjkbqD6GHTGx8XXXgNN/LcpAKMSsvgPOWlf3Q3ORRpVbIWXSGPChzC9hg0Oaw8y9bBVejUOFndHi/NEABqfR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11731


Hi Biju

> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Replace '&pdev->dev'->dev in probe(), this makes few error paths shorter.

nitpick

'&pdev->dev'->'dev' ?

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Best regards
---
Kuninori Morimoto


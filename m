Return-Path: <linux-renesas-soc+bounces-23896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D72ACC1E73B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 06:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F0394E33F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 05:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB042F618C;
	Thu, 30 Oct 2025 05:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZTj3xkm5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B2228CA9;
	Thu, 30 Oct 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761803065; cv=fail; b=AW2h0e6Ou3z04Ly1285WEzBlQMtkNMc7yBOqe65Nv2vQx449jwANbZmEQ4kTinf73G+CGW28eY/NRM2UVam8o8z3J4QMLISyDT9uGbShJk6X6o3HckdWVH0B8yAK5TI91gMJxYZmLK33pwJ4oZ98s3v+vYSdO813iEswOOxw51E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761803065; c=relaxed/simple;
	bh=KZb0j0GN/DNI5WAqOQ2Vhs3jCMV66CiZlbCH7U5BwNw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rnXmdpBy2TjhTwtOoqw9MxjTDvSUVfTphCCjAeGdDd8gdUo6yxiVZruc3EZdnUY2vdSRfWq8sWhDqpkkvtO2rhw0JhuVWZvYYMGhX2rb6rOMxyV4Cb3v+4ycuPQvjumW/cc+LSih9fvTEmIz1TherwYjONXk9xPZycp7i2veRP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZTj3xkm5; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICV4zyMcZMsBPpfQ4Nw9MSO6M6FlklNwEVLkwqIGQm6gW4pUUOxW3GyuXwX3oEIj5WG+irQIl68ktOF6oCjV8AoPToC8Hvmd4Umur+7ejNwgOLQJtsWcOBRcZGoE1U3VC9xOlSV8Gw0e6AiFeH152dEhW25HlUkOhDPNu/ZCzrDCWdkfodG1lYwqhBWg2y/AfYeP6uV1RQXMTfM6q1YWAKzAdRK9ZyggKINxLVyXPHvRLtcVFDAGXbaZ09uGS/LZ2V4/WqMOLC3LrWZnuXoe4Q2dY1GYqQpNwTQtSq9SpPvRG49EL6RWx6YfW1GMe2a0PyOwmcxZEwEtTHEyAagQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTUYoRjUqqrMix9F88N1SGAGsvGQkC3nhlAXQjxbBBs=;
 b=CY9NgWl7+11kRnGTDaZyZvNI7ZXRh/ULxuku0COxVYHRlIGmx5f2+vSCxz0iQCfUT/iSyAr7qQZ3Cs07RqcNLCvGAJkFUi1qeqHG+wwIdsn2E9bHL+1YwQRB01V/EM2L0bbDmuUE9CJlxqc1Wk0qJUm+bDlj9wfBPrYHAYNlnCMS5ShaPWQWigwWSpURTGL/nYAxv7TMIjWsTMi5AP0tBP3LZ1xONmtrtnoWXCySCtHIvNCwt2rCZNlvb6w98TYRhyBmI7z5bs9r1K+2x5dzhmVtYv9aSfg6gBdtNFDXKZIqb4+QfAjZ68BfqenuAnmYC0s/2ggdnj5SkBKBReNRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTUYoRjUqqrMix9F88N1SGAGsvGQkC3nhlAXQjxbBBs=;
 b=ZTj3xkm5cFhj3SFSTkh3H+algj4zqoc+OP/Lzp1AY4FkrCEoSdcTqUgolVqp42/4W+9hgqgj6tKO8jml+/fLGybekPMdJ2QXfipGzpz44wcpeAjEkWhtMEHb0ZwJ2/VQ90P+kWKxv04kzk+ezZMyoOM1qYRopUImLxbUvYJt0LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16171.jpnprd01.prod.outlook.com
 (2603:1096:604:3db::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 05:44:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 05:44:14 +0000
Message-ID: <87a5192bbm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mailbox: Add Renesas MFIS Mailbox
In-Reply-To: <5dd02143-861e-4b2c-af1b-79e6c57de076@kernel.org>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87jz0fsl0u.wl-kuninori.morimoto.gx@renesas.com>
	<20251028-pastoral-efficient-mandrill-c4e9ca@kuoka>
	<878qguv8fh.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdW9sEcKprPjiA50QOWm7b_fwoEkuJcLLKg-srQxwJX43A@mail.gmail.com>
	<87v7jx2t7s.wl-kuninori.morimoto.gx@renesas.com>
	<5dd02143-861e-4b2c-af1b-79e6c57de076@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 Oct 2025 05:44:14 +0000
X-ClientProxiedBy: TYCP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16171:EE_
X-MS-Office365-Filtering-Correlation-Id: dee6ecff-2c09-4015-30b9-08de17775bc9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q2FhjO4e7DnDiTQXTFTshwtCvRnPoAQHlBgAkS9McfEdCh6mh5hANuS/5+uj?=
 =?us-ascii?Q?59O8rkeU3LubsS46OQuMIHJh4h10CcLpA1bGm+XbWqn7Tw7BRd1WmTcZOfu7?=
 =?us-ascii?Q?1qcLdszA/gerAOAvkMaVmLHUoZpL2oSpX/0RHYtrK5+d+zfE4a5dOz6El9uG?=
 =?us-ascii?Q?5BWdpmrtfpeDwZxZy1hcmkp7kGilodGsp9AYjJW/CI8JAMG3AfKded63V/16?=
 =?us-ascii?Q?vlFrb/e0j9sR7bC2c2ylnQmZA8FXHGzZrMQIRDPW626Z1AFyWcbmT17DiRMW?=
 =?us-ascii?Q?J7ckUBmm1RyaYaaoiG/To8CXDcL4C2zch7gsQX+lLHYm1xKIPA4vW1ULC1Zp?=
 =?us-ascii?Q?X0ggBVQoiT7VXz6hsOwujo4zqN/thUIP1lKFJOpP5A0Z1NImoc+hgm2hOXIs?=
 =?us-ascii?Q?UxSwfUs36Lb3xSVvtKyY/NrSCklSX754mngaHVvT7OhGAJIs6T9q+wcyADjT?=
 =?us-ascii?Q?UVrwERIdb3sU5BZzpHg1lUHKFs+lw5/UlrvWx8SjurldVFZ9J1kzI1GaT5/d?=
 =?us-ascii?Q?20Mx/hyTV43Mzy/JNwy9498gOglv7zylQWvGNu/XmxJEGpzNUUCRbVReGWgv?=
 =?us-ascii?Q?vROW2QilqPYVMGgpdeuAeBCxgQ7ytxadtEGTWuMJMd4dbuDhHpXIBNbMiaed?=
 =?us-ascii?Q?vdg7IaXcI7u4DB4iVurIUSeoLzJ6V08cE1PHDeg1+dl2J3IDUWGvhLrFA13K?=
 =?us-ascii?Q?1ixcDz294LCE5cj8AhBhb6sbSrHbghkuxe/XKkOOyzy4/GqJ01xzW1OoHTiI?=
 =?us-ascii?Q?/GPjQw03rZjrBwDZRd7nEGxb8WAKLT80kXnmnORreIpWu6NLos7Ss/gHUgz4?=
 =?us-ascii?Q?gkLtz9QW9SAhDgHAPXVEFmr5Jo7w0tBllk5Hc8/2GvodTI46VtbAqBxNFvJw?=
 =?us-ascii?Q?T6opQ4u6ft8zoiCRn3AaIFQl30dybtOjNR/vvQlRZsY5g6iSjvIOCRnLgyXC?=
 =?us-ascii?Q?vr+Mm5Epc0fa8OnIiJ8iDhEg08hOgxO2ClyLj+NOeDjHa7a7x507eurQYPb1?=
 =?us-ascii?Q?pj+Z3fNh/aIgN/Yd6rvt/eBaRpczt7fYDtMZso1y9Ksgkgs6ex4902Bx7zRf?=
 =?us-ascii?Q?S7PxhjD/a6cFWn2EKdwzNPMWstSXFsis9si5r3tXX7E1x7dx4MmH+25Idt5y?=
 =?us-ascii?Q?9Vp0PvBJeR0DvXR0IgltKTTRKzuPEzGw64eDwmQkK/iQuZutf9Wvnxa0/x6Z?=
 =?us-ascii?Q?wSzel67stmAgy0H/93F1VwtexEKqtKb2rVmMndBbAj0FWfTHmWloLPRS1dEI?=
 =?us-ascii?Q?hse7j1CZTqbQmOPpfWlMEj0YIW8IoVozH+16swewJTjxBd1Hu5xaRufGfeIX?=
 =?us-ascii?Q?IB+sSIPGF3lw8UbxGQ+hhaLOkz2JRmVkqIuJvZtu7tc/Ba51iqYTY4nrOo52?=
 =?us-ascii?Q?eaGRJ9p2O76NUzqjmhOrBh2bURl+7yXYbF+j83+rIgxl863+jkFckr9QxrXX?=
 =?us-ascii?Q?9V70KF09cpZUUi3f2CEidg7nfJCtgavKdYxmq81NWP6DNfTvb3c9bckmt9Q8?=
 =?us-ascii?Q?96iOAu+zFt/0PUt3VihYtqWcbpXtWKK9tx1k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tSTyxZhoW574ShvXDzlklvjomIAARs3ZI9wZVDuDxw1g/qUVjFmsMaFUjPLb?=
 =?us-ascii?Q?Z/Va7l4UdZw03Jk/88FTRDI+bR6Q1m1rvZo5WYvo7wdQI0NZA/obLuIgl5Kd?=
 =?us-ascii?Q?HslRgfGZMGJVWTuOAXNm1+vcjWs0TTtHZTbQlkbQP2alzVusT9vBx6VG5lZm?=
 =?us-ascii?Q?rc1bCj2ZEVQomrxKL9sZAyWq0UYyI8+JROZfxnfk6ANVAOqxxr++t5ffVaV7?=
 =?us-ascii?Q?LVPQ22ExtXxhWta8cRTKJQjQQsod9btesifAFYGMkvNMIlFWqCqvym5ECsFB?=
 =?us-ascii?Q?rT2yXMcJFY+jfy1Ht6ieSphme0fqqpMB58TAFxsibsgGBdYEvpsu2sjXel2s?=
 =?us-ascii?Q?hFy2xa8mKJ5hRuoAKwqDRQpILvHEtnZAB3TprSFPHND7jCaMABJYLqu8+Rha?=
 =?us-ascii?Q?j0jn9tk/hG0t8EUtMRcKBB1HB7gHH19+N7PzpRicNpGMY2oNQeFwpVDcp2vS?=
 =?us-ascii?Q?cYyK5rN8aryyxTOmnM73zgkNMEoR5NRll6XjzMipbFwi/CKCvUhZy6cLx5ph?=
 =?us-ascii?Q?MBiQ8hsYYLX5IIPnL74aRUv+o3ca2CZ2hgNxiQzOQ20db4snppvD6NPcLjRy?=
 =?us-ascii?Q?nAJfxikXoDYL1QdDrhEMkUmKWgoH6bk4fegfGMK0H+xjqvd0J1bNYq5oD0Rz?=
 =?us-ascii?Q?ET5g8CEECjE5izPTSXUMeCXFWbrXLXT7eC/YvpzJr+x9muCtEuAE1NiNV2lo?=
 =?us-ascii?Q?xD/H9xTxBLjwDSQWBMHXTAws6ss3eOlfqk4Hvc0MrypTEBlo/7veNvSsCKWx?=
 =?us-ascii?Q?okXhwAp4RWDcXV+Pe0SZzyps7NPdUkmY6f49HhucsYsXveOeU365i4FawEoT?=
 =?us-ascii?Q?AnX/HczFNdyItByugOB/DGZbhAO4fafeFc1OM34zpcJLNDiAtbb5HlwxG8vD?=
 =?us-ascii?Q?i95Rw4JVOS4k87VGH50C/b1wNYiWmdYnI6bpF42tjoSWgpT/Mz6cxHKtkQXT?=
 =?us-ascii?Q?0D5n6OkFARz+wWno2t5XTyHhimBk9QeUkUtg2hUgXsYzqcMIfjmlXmCNpCN2?=
 =?us-ascii?Q?sJtTWEWBIudLYWaYw4bDH0wifXhNDQDpQs9qMcOlYB2HakDhhttL101alsJA?=
 =?us-ascii?Q?emvDejMb69ss01UN00k2ArBNIi/aGcof+9089i+EWFb/MKqgquRgPrD/f980?=
 =?us-ascii?Q?E/KxEZJiJLs9yaS1UFW1LHho/sXv7l3G9uuk30MlPcsRVNdZj55e4Hgvc9tM?=
 =?us-ascii?Q?nTqYockutKcN0Z+a2hy1sON/nrXdarng3EbMCB08gZNu5ETPFedaqtaWDc39?=
 =?us-ascii?Q?rNx5dbcGmJZW7HF+kae/Do/ZEz9ZuvzB5Wegw2PKok7a65V/TFhMX0mPSLdK?=
 =?us-ascii?Q?ki8LvTF944DdCt8YJKVPRjARSr19pouUwS4Fkhs5J3lV6py6dNQgxlnyahav?=
 =?us-ascii?Q?4pogRzuero/8ZGysPzroPbKPf2UGIRbWXoeeW4mSKzfsGI81/ArI339XfxC0?=
 =?us-ascii?Q?8F69CsmwiVVZk2I4wm/pPSJL4nzEl7v7PWPa0wE4Per5rpcY6VgZ41OnZy+r?=
 =?us-ascii?Q?vD0wDYa5n0aAC0ynViJ8h9Pl7eypkHkL8jyosm4I+im3tgwDExeBE2nl9Ch9?=
 =?us-ascii?Q?txNnSVIY4yQ+atB47hQStkN9q1JQtKTxGua44zpu17EZGaYmga6rNjrV3NMN?=
 =?us-ascii?Q?YBWiOT+9dvX8AVacldILZWQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee6ecff-2c09-4015-30b9-08de17775bc9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 05:44:14.3101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhzqdDOaErhAbFI8zZRFa9qTBeY78lzTr2drNQ5hRpJ715T0ZCJdSos4dyQ/KxvDinUEPeyVk+RsRo1xTB/k4UKnAG1K3fNWMGOeMGfbojeJm5+gkw/4C/SLwgAcme8c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16171


Hi Krzysztof

> >> Please no more generic compatible values like "renesas,mfis-mailbox".
> >> Especially in this case, as we know the MFIS mailbox on e.g. R-Car
> >> Gen3 is not compatible with the one on R-Car Gen5.
(snip)
> > 	compatible = "rcar,r8a78000-mfis-mailbox",
> > 		     "rcar,gen5-mfis-mailbox",
> > 		     "rcar,mfis-mailbox";
(snip)
> You changed nothing. Please read again Geert answer.

I guess you mentioned about generic compatible "rcar,mfis-mailbox".
I didn't mention in this mail thread (?), but 1) we can keep compatible
with Gen3/Gen4 and Gen5, 2) we don't support Gen3/Gen4.

Thank you for your help !!

Best regards
---
Kuninori Morimoto


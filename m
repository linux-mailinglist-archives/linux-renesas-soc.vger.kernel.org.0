Return-Path: <linux-renesas-soc+bounces-30898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ALPOSD70ml7cwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 02:15:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 603583A0D7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Apr 2026 02:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 261E63002E56
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2026 00:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A071B13AA2D;
	Mon,  6 Apr 2026 00:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JVRIqapK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D66823DD;
	Mon,  6 Apr 2026 00:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775434526; cv=fail; b=mRKubKGJw5tM/qpmzezUEmcje41gAUEyuS2bGjkMO4gCFJu0YQViiZMacS1UuZe++8vTYAv2lUUVOvrJF2ytdsXtSFcHmYUpUo9UTTTcdRq5B34gm/yfPxDPVNnG3Hqnur58Dgo1dybvNW9877muKCYH9uFuR4S/9jgtfKjIB9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775434526; c=relaxed/simple;
	bh=PEo1xLSzoH25JS7RAqLFWy6/OvLWnbSOQe+bLH5HfGs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ph23iskDrGc9zZKM/s4dUyFbhZ9eVcrzirG8zDoPbLHOvNLTMmwUKmgxwo6Gv38sYOau5JgAZLLHOtN88jjZ3OtzNCshecDD3UhtKn3lBGX/8oyuWZ0ui95CS5BQ6rAePHdQndiJWoBtciZ59s3LNSVrWVYotUSI3xl/wx25dSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JVRIqapK; arc=fail smtp.client-ip=40.107.74.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKJ6Gq0V/UrM+wcBOfJbYSxb5CQYM7u/BqcZC10U1MQ3eYWwqHoqdpT3xtUXROmkYJEKAvQKTG6MKOVsid9shiQx1TLHnNWnyBk9D9V4GHGnlAMhtsaVW4YnSyIi9Uc2WhBXXNeuWkpgs4mJCcuCfGEcIFTjFE5Az2OO0PT0iDhwV1wyXJeoQuFbtbJd1bARk8BsHYgH2btJqahHEfWy8E5gQMYhT5MbpwCKVTj7Kc9u6oo3CPjf8nQckAdWksFR/FAkhJ8uTiDZ2AIvIerW8QgHLnTWtkrSXYX82CLPpCqGmsPh+HfVn2NmbvGkd3hEPzuPbfZ7kapQZ6TJbVtCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1DzB1tEv6KVUBWdW8HEXCOGM3blM7s9EU0AZSA2moo=;
 b=ifRBl13YJO4l6X655o2NaNdMblBJVr367XnKKGWtA7jT7VUK9tEFrnzIhmee0YcpODOCMDwC8DydbPfYThywZ7Yb5p02P+/GGqKG2HVAm6hIWwcPhCcC8oA+QxMjBa415KWMg1raXSqJyF4N/f6Fb+IGT4ObLhsxd9iI/P7oGKtSAevL/KyPKGmRD5toRtRFRZKkujgZiq3rtBsVuARkcD78ar+4FJNrfX2EuUA0rqSgsGzSHaECoiGConYLtNcy+tP5us4W/7ularOMWyQH6X0XY2Z2qdfW0LYEPHTBUtqyuneN+AgOj6Ii0apDjaWl5CWXnqYOswjhkb6cHnfhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1DzB1tEv6KVUBWdW8HEXCOGM3blM7s9EU0AZSA2moo=;
 b=JVRIqapKwO3XXkf62ImMcKuLrDRVf60uvLMCoGA9fFD1I8kqflTayHvZ6qSAJ+0mFz77qXSmzzcMdK2iQnCJErNgoRvs9pNiyOfWglkDD2t4sGNxi1qTA5NFOz4IQH9oUc1y1ZIsOMOdzUut+JNb2NayFmnUfaH5nX2qPm0kWvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB14123.jpnprd01.prod.outlook.com (2603:1096:604:360::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Mon, 6 Apr
 2026 00:15:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Mon, 6 Apr 2026
 00:15:22 +0000
Message-ID: <87se99t04m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	magnus.damm
	<magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das
	<biju.das.jz@bp.renesas.com>,
	"john.madieu@gmail.com"
	<john.madieu@gmail.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
In-Reply-To: <TY6PR01MB173772234146C4A8970EE404EFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
	<87h5psg6w9.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB173772234146C4A8970EE404EFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Apr 2026 00:15:21 +0000
X-ClientProxiedBy: TY4P301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB14123:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8643ee-51a0-41e6-f2f5-08de937197c2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	M84pSgELqLL3z4zksTu4GD7wDseIJ+H4GR9NC3o269eVxpZj3lrV0YEYHVaCdjZxPyDsGGOnxZz3/hWCPLLVz5TEAophACyoMlXJCmtn9GoWRH5hxG3FKQZbl4owToTYi31bIFv9SSyDpE05dbChRb5J/nWnD4yLw6dU6kOVfqz/XnhOQAAR7ehvOhojSw+bbiPF5b7Zx/MfBNPUgQ7JxQO446XDifqxgQLitZmkqcHf/9NjBN0kqkU/hF5qVnuvAFxkpB11SHkRcz7zGKsZi9iscvDGs4FngA2Ffu1vQNoRkaSyK3VSFrNbcENx2Rpq/joQd4+yXYVFKh2yvptSjmqO+Y8qsZOuOzddR1Ldd7fJTWKRw/BXC85mtazS6LTDdeWTNBeaqTA3JYV2eYrhc12KfwXSTuQIo8htdshfhxz4GU3r7t525WXz5ea79BjfdzvxWpkdrt2bhWIQHUVyvjT3c2l1DP01xzgoLQDm7sHFglYxtuifRVgP90c9CxgCKbQtcUhNr52Hxu6mbqbROg8MTdE6HD8+ZzdllGFz+srhLDN48sHSyW6SThe7gi3Dz1M4Xj87+7mKf4qZjRLFlSqz0zb56ioEMw5xLc1i7xDmL6RCjXxhZQiCGEInzce4W3RzSJfpQS7Q7Cd4mujbgFPFbN2HumCUmgpg/djmfL77+5Iyj/BFm8aBR0tDR2+bfNcksZ22fDjTb9DWF55oa3OTeFa5cL9gaD/Ls2eY01FVH9GO+cXWRa6Q17hQifjku6swzENnTGJiHsplbHLdDtheLLYajfi7E/v+5wWL6Y4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KRrW2CYObn99hWKm6FmzywUwyXR51EcLLj8zPSxBHlOyV8dkgOiKC/tGhJkJ?=
 =?us-ascii?Q?74CMQDR78vr/3LnmiQ8it5jD8FmhO1jWyOWhZvM05We3sTzv9vTgqTfiJLxH?=
 =?us-ascii?Q?o6jJFX3IaWydhjkRcGisvz8TQTPS7k9yb7z3y85+vP2GWGbthdgYNrUENPlx?=
 =?us-ascii?Q?uVccmiPKtEj7c9I4bFdt02q9RX/xHeMXDxEFFcs43JorztiXKxN2Wid2bklJ?=
 =?us-ascii?Q?TfjWg6eF6iyqi6yebwyUxJUiSobuvpwO0cCwomWLq4U+eU42VggXOH9AyqCr?=
 =?us-ascii?Q?785zQHhuJrNXkIJvoMt2WLcdJF0Xl3kE3F5vGEsXcWoAHVkkyZdErclZbPFr?=
 =?us-ascii?Q?9AOHamZ5DLdvowaJZ4K7kzwUBAlZKTXrPu0zHAUQdbZ56p0MImc21emu7kWU?=
 =?us-ascii?Q?5SoaKpPVF7C5crzKW84OPt58o4DMyLM/O3cjyXavo8Kx0vfXL6DeKMjW0ml1?=
 =?us-ascii?Q?ChC578cyZ5oC78TNoavC39L8qc1ONXFtp5xwk8xqDbjby/XwCPDGIPdqIjOx?=
 =?us-ascii?Q?ZpF/KkvrZcdPiZBsgONg7mD8DYZ/mToXKS3uISmvBi6Fj8rGADDlmZXFIG99?=
 =?us-ascii?Q?7JC09nDUHU6PVbPfTunW8+yoHpDkc+dKs1I1WU5jS3H7XdhkNUR5a98nlbRw?=
 =?us-ascii?Q?FFjhvcNcqOc4aSkRtnMxS1T9fVoHWngc5yLzDRNSvBw3VR2FMRtzsYjmGQ19?=
 =?us-ascii?Q?tfbapHbQBb9L8xvOIIOYLMLCR1i0pO00R3NawPjR3C1o1NfKOAF9kX34h0UK?=
 =?us-ascii?Q?8URysyl2vLFXAi+iNsWcyt4KXisyRTMYUFKcBIF23JkgtXp1EdNLGzsdweYU?=
 =?us-ascii?Q?4A4qxTCY5mfvVx9I+Kubav13jQwmpR1nF6TqaopZ0ME9hePDKVC5Uezktz79?=
 =?us-ascii?Q?jrZv34UVwIHwTfn0LYlqmk6EIAlst23wP+4LQ7BNesrsIcdY7RWXWPHhkMPf?=
 =?us-ascii?Q?/3VRVjx5bJshDSMbIA1yMC8mR8Me4Nx3GaW8sGMRrwg42OnU1KiW8aZCsZDW?=
 =?us-ascii?Q?jdLUX6kMBD5pbt+wNTBg570jKm/YsB6k0g82bNWw3HVzDxcJSNWiVmtWJmVu?=
 =?us-ascii?Q?bsdISMlTbdvxqq/MOGLqy3Xcqu8dYfifQWlDTLAhRRajLiuVwWVG1sTN0NQl?=
 =?us-ascii?Q?4Hg7zbAmPCH6vVc/Wq9SO6oBXTULnC+pQg0bnF4R5TKTlKeG6UAXZSTjicJb?=
 =?us-ascii?Q?AIvL9KXRRFfGX1uzmb4H/Hu5dPmxmGmVrVmZaSWApUnCwjo0PYYusxHNXI3S?=
 =?us-ascii?Q?tCBZssMzy2OTo8iKmHUedR+Phe9zK7K21ncjARxhR9joNZzKlYpvLnfk4H9+?=
 =?us-ascii?Q?wyciFmY8YEGX5Vk8j93SWKPeyn3MNdWz42AfzWk+qi1DwCrrzEUIeuJgKa9U?=
 =?us-ascii?Q?J/d6gzC8Ve8PvXfpV4AD737Q9ZKjDVnBvEwEqugh5PVd1S1MPvrHdGFC9OZT?=
 =?us-ascii?Q?cQlE3z83EVi649SiOi+616mgu9YGiTqFgA0xSIrkDpRt3LaOOFQBKndplTTQ?=
 =?us-ascii?Q?Uouw5hls9SEL2SJDRTThxad4RDSDVulJrIgcXRERBp/BU/SnGxZ5rf5LmFKr?=
 =?us-ascii?Q?0aZXMk9siKElXJ8yR2QFiBdxfjkR15AYHr6uoWZJoDQODTpqbEd5iHz1skn9?=
 =?us-ascii?Q?kYQzUkGINkFX5wAR4mz81QHrysqUm9c/bMuLd4NfAvsAlMAprFIHMWShoQo7?=
 =?us-ascii?Q?Zksp8AWXMEiG8+3IQ5CGmoTFse9wQmx5QzWXqx2DFRa/ttRZlZvfs8+DIHa1?=
 =?us-ascii?Q?RXGB0a4aQtyVXGc6f9W2JRC8srO+yaxmrpmYFrwIx4Gnz/ZQOvHl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8643ee-51a0-41e6-f2f5-08de937197c2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:15:22.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tOUqEp0yV+D4Viy59rcdLg8Qh1lZbsyfIEmF6+k4agCUX+PoZuwQ0o4P7sacuGoM3kR/ORRnW1WlGWidaZR5eYvAC2PeSkhV7+RHtD+jQaNp3/SnQz2H7xvVmXdr1q6y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14123
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30898-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:mid]
X-Rspamd-Queue-Id: 603583A0D7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> > > +	/*
> > > +	 * Below values will be filled in rsnd_src_probe()
> > > +	 */
> > > +	struct clk *clk_scu;
> > > +	struct clk *clk_scu_x2;
> > > +	struct clk *clk_scu_supply;
> > 
> > It is SRC specific.
> > Please move it to rsnd_src instead of rsnd_priv.
> 
> Agreed. However, since rsnd_src is a per-SRC instance structure,
> I'll rather have these variables static in src.c, as the clocks
> are shared across all SRC instances but used only in that file.
> I hope this is fine for you ?

Ah, OK.
So how about to create new struct rsnd_src_clk or something,
and has above clocks, instead of using file-static, like below.

	struct rsnd_priv {
		...
+		void *src_clk; // I'm not sure the name ;)
		void *src;
		int src_nr;
		...
	};

+	struct rsnd_src_clk { // I'm not sure the name :)
+		struct clk *scu;
+		struct clk *scu_x2;
+		struct clk *scu_supply;
+	};
+	#define rsnd_priv_to_src_clk(priv) ((struct rsnd_src_clk *)(priv)->src_clk)

	if (rsnd_priv_to_src_clk(priv))
		...


Thank you for your help !!

Best regards
---
Kuninori Morimoto


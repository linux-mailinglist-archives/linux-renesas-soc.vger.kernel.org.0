Return-Path: <linux-renesas-soc+bounces-22704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B04BBBE193
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 14:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C89901895506
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 12:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF88280CC8;
	Mon,  6 Oct 2025 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fhS1/M3C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAC9149C6F;
	Mon,  6 Oct 2025 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755254; cv=fail; b=QdeqrSGDcQFe4WOLqrtmYWA89C2VA9djkGhY8N2Gg/NgtedppzEpoNN9QTtnnwxSMq4MXcoT0/8BopcHCHD59B4D091MlcIsE9Vp677w1yPn097eCH48rq2e58y1Frd78SBxDNvPuSOFIeAukcvuH4gSyMTiLMTnSq8/+SqyvXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755254; c=relaxed/simple;
	bh=rqQ5NQL0tbu22Hfxuiw2lRGfYAf9W315jqD4xTvxDD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oAxvWYem3knjYcij/MeJstQZwcztur9c8I/P4jSryKbPqNKuVG4Sci1OvGiw/KSi1Cx1PpGIjfyKqkRm3prm74Je49TlqPliUNIRbGvKxdcThyzsbFqYWBRUEFfguCPltjy409Y7K9TAz7ist21M2SRQSqSFNFbEcHe/LlfHQpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fhS1/M3C; arc=fail smtp.client-ip=52.101.229.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhNcK+i4uB4CXThCPdwF5rsgvENco20/S0gpIzNO50zt23BwtKoCuUSWiOyEykUg0fjUG4FVRnQ3Fe1i3jF4HubxRYyK2aV+8ebJo7WJSbcu0UKIJxUF9LUNBa3DbrENlfWWMdzQ72ZKsRBfFjGbd5DVuQCEshtB8oY2HCS9QNfdjzMVaOHgRGPE3UPS76UdpS8qoC4deSMMRrfbHEgh5u6vJSZeNUJz6uANJ3beIFOfBxzOZ9mMKyfVT6/7tR2jDBMvzANMugY8T6Y6WwU3ooH2nzDZq9xP3ROG3/r4d2DtAEBavwK4ZUjcMIVQc86N/fu6sii4WaqMk6DyOzm2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io/ywwOlAJqMrUgfmFOpG0fSxbZiMbXf9La/wbKHCa4=;
 b=kD/PxWYahoJHku4QoAWlImjzWrR4uUl2IBiXKMeoqu10KEVOMZPxkGXlWL8YAkTM2mH2sGE/BMenMJP9HA20rtn+9UVdsPt+b5IeN2+H86m9t9BekeHvN1yU4n/7LV2K9O7asAjWhjAGxkLpJa/1tjl2VEyJEPedbvGSz1HDbWK9NhqKjhzwisft38u7tMKCJy8qhBR4dFLzefFO3hM+V2QYNXtR0h9tSHEcU/n9e3gKbR+7twBWHrEu6upUJBbvO7JirvkGZTYHyeQZ0xGZqoigNornur8u8S1adUr0lH+0izGPFOcmjB7JpE8OG30bLuxMYDg+voeLD0o0coqc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io/ywwOlAJqMrUgfmFOpG0fSxbZiMbXf9La/wbKHCa4=;
 b=fhS1/M3C61COkVKcadPGp58VFkH3HYUMJyuf7M7B4i5WIVhshDWiLnEIFPIsZpKFdMdhM/FMLn4CgnCUCvex0rlE+1dRx0xpHhfuCDjwnJ1YRMQMBmEBI0HfKDs5H504CsJyVAR1/uvwV1y0RsBfU0GAEf4JK0b6Wc+c46HnJvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13126.jpnprd01.prod.outlook.com (2603:1096:604:353::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.8; Mon, 6 Oct
 2025 12:54:07 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9203.007; Mon, 6 Oct 2025
 12:54:07 +0000
Date: Mon, 6 Oct 2025 14:53:52 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] regulator: devres: Disable exclusive regulator
 before releasing
Message-ID: <aOO74D2XW47aDZlg@tom-desktop>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
 <20251001212709.579080-8-tommaso.merciai.xr@bp.renesas.com>
 <ae2701a5-8662-47d3-81fa-30e832600423@sirena.org.uk>
 <aOAI5cfA1HmEc7Rv@tom-desktop>
 <ffc7b0f7-edc0-4e26-ab43-e2010ec58819@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffc7b0f7-edc0-4e26-ab43-e2010ec58819@sirena.org.uk>
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13126:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b3d057-d51b-4f2c-804e-08de04d76f88
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rqB8jUr1UqqJ47z5Jzeid9Fxy9jIMdasEvYqtk4iu34H8cSMoYeW5KhWKorK?=
 =?us-ascii?Q?xX6Q4I1O3QiA/mGLTBAXq1PxsmpSK0qQ04S7qsp6Bsc2XvmvQiFemUpMvSnp?=
 =?us-ascii?Q?qGwzu2/uSWBIpbx9RL0anUxNmqUl7ytOyut4H+S54Pi+wRO08tiZXsjLqEhP?=
 =?us-ascii?Q?boN3wlhH2DCLDVfdKcXuehXW6G32Qpzs183HOJ631SNQ4rSCPviEsdCSLS7i?=
 =?us-ascii?Q?TiJDoUWfiyaMAugvdjnGrdNwRikH/LSFah1+Dii6F1/XLuhGdLEsrCkOZUo4?=
 =?us-ascii?Q?XeXCXIkTXTBLKLEpvUwfuCgRp6Ag+5HW3fktQbRTWfTlwsMgeHNOwAadUPQb?=
 =?us-ascii?Q?5zZL0pnZkTqdMOK0qNL+P1IafZbV1E36jXop+xMCJmDNe1H70MvAava9Z5fg?=
 =?us-ascii?Q?IgYG4hY/WUgJZz5vactRi3Dp8sXU67H/MNE1BD5B1VHWeG+1fWS1l/VRLqZj?=
 =?us-ascii?Q?p2i8GBVixzyeG/OZF4nzvpdDzvrIzfJ1D2+0eDElGdMrcrDAkOk0yN18dn9Y?=
 =?us-ascii?Q?YrSUKztRxpY8aCsagx2YR54JzUFOrAA/1g5YCxBcr8cJXQBhCdSwF+ya9sqA?=
 =?us-ascii?Q?G3ywoYyLYEMDB6YvvvQRLkpTiHHBeX8lBM4kvsOllr6NFK22XjbRMEFN98Zd?=
 =?us-ascii?Q?ze7qzPqPYK3C6kGS7r2mZl1SVB5ojkD0BnAyKdUBZgescebo+2A345J36Lom?=
 =?us-ascii?Q?YtOgXutrd2YTSTxZS7JMAzn2rJG9TXLMxqMACk38EQDSaRWbvlNN+5qM6z35?=
 =?us-ascii?Q?Z8vALHYEidactWOblAzDvTFfojOtT79ymO2qJ25Uvf99AAt/0SFgLZBz8e7K?=
 =?us-ascii?Q?MhkdlopOWc+DK70DBlD3wWpYby/qeM946SA8pWjkmjTwnXZNaTT2/+FPcwZB?=
 =?us-ascii?Q?5pKihav3sx32tuAbdgUCwsU1dbeuciJIX41lc0MZKm1MJ0Qil8uJvWSwFb10?=
 =?us-ascii?Q?c4FB69xDFiqhDCBfkv8ACFeFgVptD2FDsWAtXJBywUGFczXfMqlPISKDnsg7?=
 =?us-ascii?Q?/Qzge5hE+NH1DMO8dw0Dp3Ezi69HZhD8v0FZYo1uu3ZT2JK1hQvDlJvwmeN8?=
 =?us-ascii?Q?Bu0XNyKwujImD9Y0xQh8FKpR8DUvDqewACQ87tRPihz2ZZD2lpT+STfZeo4p?=
 =?us-ascii?Q?Lo+8q7Qiu/nfUguhqJTZAQRWP7teUM24u+QRrqlzD+8YGQha5yWR6CDc0gwr?=
 =?us-ascii?Q?YU3lKdrPVoHDAjDzrS56871aYyrDdo4FL8/3oHnEr4LKhEI7u42zb7mtc9KN?=
 =?us-ascii?Q?o77ivGXqcaSxXCvdLbuKO9HJIosI0vqGsM5TniZ7SYbJmziNo4a4w3zFUL3q?=
 =?us-ascii?Q?hxTK8SJ6mBJiavERD0OdTeMJSUiYPkJ+aglDVrLyNyhH+z7Zx/y+KibfM1ci?=
 =?us-ascii?Q?nBGWq9yR49qd8Q13R1cYJahkfYk10Z8nqzdmcSI3MXaxpThrPC8clRpIGi4Y?=
 =?us-ascii?Q?FYGzyO+ka76eTd8ljw924MA3DHbycDsWJLHrtrteb0SKd6Df1JQMI8Ijl17B?=
 =?us-ascii?Q?SEPt92TTQV3AEgBaIC3hYxVz2sAJgfpqE48P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HACQghFq3IXmS2g4HCyKQRtnEApsvUO8k1O4fLrlNfijCB3r2DxCB0M8oIam?=
 =?us-ascii?Q?IxZZRnhV8IOLX7N2V/1VCAm4rv0klRmAeQM8yrnDH0xwQDmFTUHGn1l1PIn/?=
 =?us-ascii?Q?z6B+GkpwVWfGQ222tmpRCFM3Qvnye0cecWu/w18mfL+pPoydIewUWx7NdhNE?=
 =?us-ascii?Q?iek9E2bvg53O3+jZJFFfYoGg/8m62mbXkKqm560uXUwH7arAxtd0v85gET07?=
 =?us-ascii?Q?Y5e28xkDhD1yZPBzuEqhTbwv4HqLK6Q/9zpoMmuKuAcxkF6U5nWGmVSDueFO?=
 =?us-ascii?Q?HMKEf4qPWOkI6kqDS8C2PhdRzFEdvCPvuEiwMGpiBQTFHhG9twC/12Mv6K90?=
 =?us-ascii?Q?cw/d/b4nMoC3xBqNpRG4KwegB7SZzrayH+d4vbOO6Uf6aRVNvm7BlC6KesgR?=
 =?us-ascii?Q?vb1cAoMvmyvUG+ubeEwGKmJac9bznwy2tMyu+cTfn/cQUIMcAIc626qEY7ai?=
 =?us-ascii?Q?tnC42+VpBAnV/iDlP0p4YBAr/XortPHDX+6aAEo+TXF7YywAbVAKzvgROid2?=
 =?us-ascii?Q?KStwaE2Gvjn3calvLdIMR8eDP6AdE1T3Aryl6BoEaiK93kWWXSOJ2D6cCjKD?=
 =?us-ascii?Q?FnO8LIPHRqUQylNeoFpaSpSgHp76LqiFTt6gKUR/nk0CVGZuTUlhDK+y3Qlf?=
 =?us-ascii?Q?hMPnMo6PR4ha9ezyHCdDb70oS1xoMNHKBtDztjkauKPOK+V0Y8tunSPwxMEl?=
 =?us-ascii?Q?j1o4aKAJoKrovZn9fRlRznVaXAuFoiN1HtdpMX0mwOd+9USFKRewgWD9J5UB?=
 =?us-ascii?Q?/odzSGaLaongfLebikb7MKVpoPcYeBKn+TVOE/9A5tndYdfGKRc4t8q+TQ4w?=
 =?us-ascii?Q?LM6VOc2iEBtkziWvh58yZQnj3E46qIi03AmfK1fS/P2W4NaGWgY5LOYYjgf+?=
 =?us-ascii?Q?zxRh0r82reL1684DsGMGIjVj4IWg8lJPLZ+VPhzPJUlNXYnlz3ajqchSf/4t?=
 =?us-ascii?Q?ugXeukx77DNB1JLx9DdZRuYlepWm5/fsuQLVwjTwEL3J8rUg2euj8zNIkNCa?=
 =?us-ascii?Q?LttLp9fXX1l8t7OoITCT44NTw6chkyzyit7CMeWeLnToUmvbsWffjiOJHI0D?=
 =?us-ascii?Q?FHML2/ZwyYi+xAh1YbVQZdt6rS+0nyAkNRs1ugZwuoO2fTniUBfaqssJ+Eo1?=
 =?us-ascii?Q?rIQaiWPjwC98erwr9X7i57ZIyN3RdJVftIK2j4Ewa2cOJqEtLH7A5u6wVOb1?=
 =?us-ascii?Q?MtTg4UjnnNV7zFTC2ERMqXShzPRaShNnFe3xMs1AtTUmePRsYoa563X5d+1D?=
 =?us-ascii?Q?F1wb8RhLvSqeOS8OCImDHJtbcFF0nWofkRxNCH+oy0XUuqZ683eeoESHBI1x?=
 =?us-ascii?Q?fq0Jbq6+RMPHLtrQVU9WMfbodxRgdtx1MuzfR5XDyl/D2yciF0LO1MIM9iNF?=
 =?us-ascii?Q?KPjPwG25Y1E67TRQMBqQRKbQoPdIuWDKpr29uKd4/PhReGyTZRDl2QyI/bpM?=
 =?us-ascii?Q?a/1mlrgKTuNHpTCdjmfAsjO21z6L3u1s75ApVaGTkio1VG0Yc90ctNa/cGuR?=
 =?us-ascii?Q?RWddAfyH+J+Wa3t5lcu3Wu9vrIa5IjINzIFwQsfonabEYU6/8piVw3QizBy3?=
 =?us-ascii?Q?f33TQPyoHAWZCOU/5q94DNnP76P4VN6OXeZeff5Ds8pzK54i1Tb7zqfH/3Am?=
 =?us-ascii?Q?CMbpPg3g/Z8/VgCys31/S+8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b3d057-d51b-4f2c-804e-08de04d76f88
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 12:54:07.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0L43HNLWvUgyTECEZsuiN5s2VU8bqScZdWqSAVw5zNQsGBB3G3VvPvGJOPGkjbK2cN5NEAkG0IOFNYjs343EHYiKPzKT4krYeQCIEL2w3WbilBIn/nQOhC52oQGUU7Tv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13126

Hi Mark,
Thanks for your comment.

On Mon, Oct 06, 2025 at 12:52:29PM +0100, Mark Brown wrote:
> On Fri, Oct 03, 2025 at 07:33:25PM +0200, Tommaso Merciai wrote:
> > On Thu, Oct 02, 2025 at 05:29:19PM +0100, Mark Brown wrote:
> 
> > I will need to move the refcounting handlingfor the exclusive regulator
> > at USB driver lvl.
> > The drivers/phy/renesas/phy-rcar-gen3-usb2.c is using
> > regulator_hardware_enable() for some USB otg channel. I think this is
> > the reason why I need this patch to handle multiple unbind/bind.
> > Without this I'm getting some WARN_ON(regulator->enable_count) doing
> > multiple unbind/bind.
> 
> Are you sure it's not just that the driver doesn't always disable the
> regulator before unbinding?  It only disables in the power off callback
> so might leave a dangling reference behind.

Yep you are right.
I will fix that in v2 dropping this unnecessary patch.

Thanks & Regards,
Tommaso



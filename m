Return-Path: <linux-renesas-soc+bounces-25124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F9C85D97
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7391B4E217E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783571F5820;
	Tue, 25 Nov 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PkworHLl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011015.outbound.protection.outlook.com [40.107.74.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60371D8DFB;
	Tue, 25 Nov 2025 15:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764086268; cv=fail; b=uHrMkIbt0YpOjFWF6pjgLpBm/U5t6L7f9qJZoB2C3gqfZcf6JYimGReU0amaqF4cP09tJowXSU5gtR/gmgOHpw61neIQIvONXBHAPcIQo9kGfRmoBz0BsEhZGFYg9cSyia1co9pH9hPkQkKwCm5RU5bJFOcDrfTj69Bsj59cuAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764086268; c=relaxed/simple;
	bh=SjLHkLCD702JI6A3bM2gI4AzmYWPQEf7l+5zfkCn6g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jjYRTQvr6g/UBEYPiwFv64c8a5y48jFiGhBC8IFKMChsNN1iW0x3s5iZlwvQf3DtSg9Lr+pqmVGKMcBL0oUAfPS4Ely3BCmPcayN379ZNRP7KZfTpCJwWZLlzDOObyMFPXPg80t6SMQ0I0CUZIBzZSXQxyvstM5K96tOWg+BM5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PkworHLl; arc=fail smtp.client-ip=40.107.74.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZIMKjeCF7cymk/atsAyvumS/pRu9yy7egFWvAVbQPo1ktpE/0hIPj6pzxWIJ4CHj2zCxoBBaJqKK20ruOXVVXAxf9DIkxB9PDVUDSHOdTXzuX//BCAP21EciyL+N5YOmxgUnLlLCWA+gKJ2R+PRkbo9zj0oZS0uOcwEBX1vWLh1i6f1UQ82Gp6bUAVR7WrEWKDnDvR1SPtJDS5xUSyGFqAZCHwhI9Y0Wu/4R8WRvsP8/zJt1Hn7dlrmbjhLeezpdykKIjtafkBt9q/7JVKtNmjeRbMzA5CkTi89ePaJ2w6FjZCVahlLbfqmeb+k6DMqMOjdr7w1aseZ+oB8Jqm9UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITzL/VDq8d6r6XtiQu4T3w5kjKHLR+Y4t446d/0g0i8=;
 b=lTo/Awaxc+dfzI+VJass9fGqXUBhIY9mxiJ3wYwrY3VWbvj/gPgEBl4az/7/mOlqFSeRoyIeW0rX85SwbEaagm4dAJ9Qe5ElBbziC1bycENBKUlinRcsYvNzAlZEiv+/t0H5Z6wF7UIqQvsX3caWN7zYpEBEtw3w/aRNjWL8CeV0hQS6ZO4RvJG/x8WjmQU3uLpV6LrJRnPmCqtQCZC6vQE/Q9n+etk0iupxaYdYdNi3/rn3rjU+fw5MKOy3M89oYKkJ2zf1ZovLnM+wBSsVF7g1+q4Wv54t+CNbaw4Dmp0go634jZt9PghAZdYgfCQ49K8N927CFPxdoijHpRRg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITzL/VDq8d6r6XtiQu4T3w5kjKHLR+Y4t446d/0g0i8=;
 b=PkworHLl/15NSeoeHvEfCsWa46YB9xEjNi78J7ZXt4/0eotTiPJR1mnKl/2iBRuPNfSlBeNk66EVoMMURD+Xs0SRgAlLEFLAvsYT+WE6itmmyV9bFB+S9Y5QIbv2mxRsOaeDc3FF1yOvEmhnRsVMw0ZnkjRci20JYhjBAjySnlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by TYRPR01MB16003.jpnprd01.prod.outlook.com (2603:1096:405:2ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 15:57:41 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 15:57:35 +0000
Date: Tue, 25 Nov 2025 16:57:14 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 11/22] phy: renesas: rcar-gen3-usb2: Use mux-state for
 phyrst management
Message-ID: <aSXR2iEAKjxM8VOR@tom-desktop>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
 <89b6d61854e94966fc9781d5832b6c187c35b4de.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXBbzTeiQJQWuUnJ_rRD1Zo=1TBOzrv4WbvC7whL1=E9w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXBbzTeiQJQWuUnJ_rRD1Zo=1TBOzrv4WbvC7whL1=E9w@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|TYRPR01MB16003:EE_
X-MS-Office365-Filtering-Correlation-Id: c7207627-9c77-4b20-24f7-08de2c3b59a4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A3lYOceJrvw9fVTBcqtIUErde9Xp7Ii8uk133qhHIdxDh9rusWp238nZkQr7?=
 =?us-ascii?Q?dSGmchts/2OS4mENS8KdfRU21577W3Bpnul3u3GuGx0QWci6tC3GpgaasUBN?=
 =?us-ascii?Q?Ej6Ws/N9v6UACnMD+FnxxaWvXDsSQsho62aYS1zIZ/RnkmaTYInex2wq28uW?=
 =?us-ascii?Q?ynyQCfJIMfzFvnrILySVGHsEc9xaDh3d0s+IgGvgk+OTo3wsr2Y83rU1A2Q9?=
 =?us-ascii?Q?yIMltIP9JHcWXYCpDNeW+4e4uqpQ2vml4Egk1PsiGrE7VazRnJHj4ds9iGOW?=
 =?us-ascii?Q?nWwwAMV9/HnjutcXIXPStq4LMygRAi9CEEtnck0VjBBaJGOt7ysBEUUEQEru?=
 =?us-ascii?Q?c31lvgveSlj/XEKaGVDxo8hgeg9bOxPlkcWTbh60LHceMq08Y3WC5BJOcY1U?=
 =?us-ascii?Q?Y3gy2VPFCOAGlaTNwD7xQGMScDbzAL7jO5jkn+C/54KkX+ZiEECzCHUStzSR?=
 =?us-ascii?Q?nCWFJM0mZLUpcZtwFQgpKs9M3GsNz7r6QWKF/ZHf0+M/kdb5/M+93ouxqM2q?=
 =?us-ascii?Q?AhEZOAubxbQKMGK1S1ZAYLLFYu+Eijsx1PMDXHM/wG7C5lysODhJbZVA9CBM?=
 =?us-ascii?Q?VxCaAMdLajNmt3Uq3ODfrrauX8r3EnyCJvTumhf8+xIvBeBDbFoVkrD9DUGu?=
 =?us-ascii?Q?4gA9Xl0lkj0UPu5Ux+wGW6SLT8dkEM5yuceibplR8B6MNp0vVzeFpYfCQ+od?=
 =?us-ascii?Q?5Ha2L5ftIdbDlvd/l/KoInT5+m5+9lfyyyxvZWEMWET4D7PhE++6KE6w8aD6?=
 =?us-ascii?Q?n4DO+MtcUwxseGcc3nMnO4w4askntc66y7hYiz0jKN7cc2ffCw99QBH08TQY?=
 =?us-ascii?Q?VTP4m/zT7VPcxz9EJkXYZSaMtynlaAm1DiwwwLCrGTJeQjvAvu/PGp9G322o?=
 =?us-ascii?Q?BUEFNKsfArYGkBOV9jvn9GIO7UDT4q+3TpG1/bVYayQ8HUc3KzlTs0A9seP6?=
 =?us-ascii?Q?gauWblCJf5cd85E95ByEI5/MgcAcFiEmrclpAqLzcWGVMx7oQb1ssg8oVpqm?=
 =?us-ascii?Q?zKzuY3qJ1P2uLR1wMOH9EmLhmXfX9+Py/2uTTc80ttkjCMQcjEKDWhKRsijU?=
 =?us-ascii?Q?LMMiyqEd4eF785XhAK3VKIjmb7lNDTtZIp2RMC4DoD8TGJwGlBS2q6D3ke4b?=
 =?us-ascii?Q?OrqSfOQmdyvnRWGXJzGwqUjhrFTt45qG2S0oR+KJAqaFvPkqMOmyAOyyrp+y?=
 =?us-ascii?Q?SGuHX9pXddTi/8PMbWKqpA0F0wEptoptg3FM6ZWtP+nJasje9SL+0aG1GP1l?=
 =?us-ascii?Q?WLfyDNQDl9CZKVl51JLCQ6izFXaJyd5zBdu991VcVI1WZuERrAb8AFzR2R7a?=
 =?us-ascii?Q?WTQNcwRMu9KHFkTx+wDaCK8dw63Dm+3HdNrnUysWjgzPc9cvbQ8pn+3kh18h?=
 =?us-ascii?Q?MZT2538mDlLq6Jti19AaLNIppZ6wxEl5pQPGXFDBtHGi8igq6vQ3cKq4tfLr?=
 =?us-ascii?Q?C6FjMflqdZ4qtKf4VQCIj6d+ClUUamlyBGfE3YqGpYIxvXEy3lGNPSdtQHs0?=
 =?us-ascii?Q?GKP6dAiCZDBWcl0i6aXVHIIfcwut025gb6dN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mwn3nhVfGqyI2eSRCwv3hUhCjT3XqJ8cmqmbGiWbNj//u/iRuuxsrgS9kmj9?=
 =?us-ascii?Q?NUgM/s86Wtf9pO3wUZ20UDTLWTIb8cV6uBvmXdE/BGgk8JEozUahUaYbeLT6?=
 =?us-ascii?Q?x6hVhpeKEAITT1AUNr1PxWjy6rie1+5jO39Zbb8+FSB+Naf/I+z24Nk8+oiC?=
 =?us-ascii?Q?tHgC1I4/WUkfg3VBDjLrJhve5HRuty+loYCkY/uVWLhG/QOc7/H8s13QvOsM?=
 =?us-ascii?Q?xXQ18yjUOtAQPuioMPBertA9LR7hVJ4HPgniG9iYjUzVDKv4QjiEA8SQeSvL?=
 =?us-ascii?Q?zTwVPOo0jz6xTS7p+h5RbbzNv0/Q8cLww7pZj86mkfPeQFRA+AVcwhS/pfsQ?=
 =?us-ascii?Q?vM+EmvXWXRjx+45+NAOb7LzMFgA7yqDphatkdaX8ZFnJjgAXmxTlth7LgZ7s?=
 =?us-ascii?Q?VBdH3XSGMY2hlKP21bGWy0cr38Z3BUBjDmDIiW8RCYoN+UOYozsbsVEK8yRy?=
 =?us-ascii?Q?3fPApoiNgdB2akgiucvPFFmGm1oL18cMjIGWG3v1qMimo24+zp7ocyIHKzeI?=
 =?us-ascii?Q?/cB1ng+BlSKhAfTjWC8C3IMgwqeKhaHSZjekaz3S927gQRe7l+DOdEQRcTed?=
 =?us-ascii?Q?d70Gt9ONdCs3B6GStE8HDVmUrAZOdUUpnZWlL6RZZks6KFbBNIjx1T5ewGtz?=
 =?us-ascii?Q?jLwPcWvLPKI1okENzj/0bn9bvdyLBOOXfM2prDo05BrQAevqLhUGUYnpILKq?=
 =?us-ascii?Q?BvDSVCyoG/CNlYvuAbiLsiXeCIrmhC5XJQu7umKmjKVizWJreNAlnNqnxHuc?=
 =?us-ascii?Q?yFtn1mz5mlXp948IJCAGFc+3Y7evqVo9La2rSLksPLJ7BguCotyxnF1R4na/?=
 =?us-ascii?Q?c/2Y/Msc/R0M8LZNDM/1MDEjRDjIlwmf0ntC8a/9ixPlhsQhAC/u7C6mF0WY?=
 =?us-ascii?Q?I3+y/Xo1k2UPFBn+2k7cgbwgU0ceguowd7FRJFnRPrmEwVYupETlh4hFCHM1?=
 =?us-ascii?Q?mqUiifZx+7D+ddDEUccw1rneYhoaQuuqJuOqv/Y2pg68FwYOmwsFpog99Ci4?=
 =?us-ascii?Q?5W9EDGr4oqgI0a0+bJSLSisBUbnXak+4Jjarjbuuw6O0EvQb/MKnLaey2WAj?=
 =?us-ascii?Q?txaseeWyLzg6hfly6f8Pz82f1JLD58HtOdlFHVuz4IWChiQTh3S4oj4Q6VDB?=
 =?us-ascii?Q?77yxV5hGaMEf5dr2IKUNYN+X2chb4KpXveQfwWzsiIOypZ43f4JuHtgZllPU?=
 =?us-ascii?Q?OqdMdcO2axVshccYI+1Y0iWo6NGNm4C0n52xNWtBQFTd0vopfqL8ETx/TK/8?=
 =?us-ascii?Q?ObiGxhs5vJBPPoofTc+KSs+4c9RO6U+jzeVnnVAyQ2GXzXHEtsxRgG4Q0+ya?=
 =?us-ascii?Q?ggPFWz+WYgPOTfik8NcHTzSe4l6NcKCoh8f7VE6Ly2F70eBG3XoTxtd6CY31?=
 =?us-ascii?Q?RsTPWL4d/Av/et38aawVB/dJkzO2u+kiUmCqdURV7mvCF9vWyM5hLir1aWJK?=
 =?us-ascii?Q?UDaNlF/lK5EnjrKxSAJ3u4Sq4VqBj5vVungxFVAE6TBcv4Jtxxb1N4oqcUmN?=
 =?us-ascii?Q?n8xMyzQVwX6GqlBqTXruTTfIqe07o64WvkHHGNaNhiYFru5ON4gOKPLEz9FV?=
 =?us-ascii?Q?xqHpq/ubGVa+z6d0isQ/Ji7yrHYgNIKs8TMVGvhP7pgrwkf0bA/7AhTZ/G36?=
 =?us-ascii?Q?qwaUZpDNGGhuNMyuozaJEQc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7207627-9c77-4b20-24f7-08de2c3b59a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 15:57:35.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDFFI2Ex/5Hr9lOEqHCBf4BVQ4xBSgBdEHSbzJ/h0wggHQ/r6TJG5vrbxG4S9BTzujB/1ZaC/9pRbT63q4ZI2rJkt3DTwwVBI7vhI7/riXIjhvIsUDaQmaVvAM5+Fxmd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16003

Hi Geert,
Thanks for your review!

On Tue, Nov 25, 2025 at 03:10:22PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Fri, 21 Nov 2025 at 16:14, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > Add support for selecting the phyrst mux-state using the Linux mux
> > subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
> > initialization and integration with systems utilizing the mux-state device
> > tree property.
> >
> > A temporary wrapper for optional muxes is introduced until native support
> > is available in the multiplexer subsystem.
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@ -938,11 +939,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
> >         return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
> >  }
> >
> > +/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
> > +static inline struct mux_state *
> > +devm_mux_state_get_optional(struct device *dev, const char *mux_name)
> > +{
> > +       if (!of_property_present(dev->of_node, "mux-states"))
> > +               return NULL;
> > +
> > +       return devm_mux_state_get(dev, mux_name);
> > +}
> > +
> > +static void rcar_gen3_phy_mux_state_deselect(void *data)
> > +{
> > +       mux_state_deselect(data);
> > +}
> > +
> >  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> >  {
> >         struct device *dev = &pdev->dev;
> >         struct rcar_gen3_chan *channel;
> >         struct phy_provider *provider;
> > +       struct mux_state *mux_state;
> >         int ret = 0, i, irq;
> >
> >         if (!dev->of_node) {
> > @@ -1019,6 +1036,23 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> >                 phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
> >         }
> >
> > +       mux_state = devm_mux_state_get_optional(dev, NULL);
> > +       if (IS_ERR(mux_state)) {
> > +               if (PTR_ERR(mux_state) == -EPROBE_DEFER)
> > +                       return PTR_ERR(mux_state);
> > +               mux_state = NULL;
> 
> No need to set mux_state to NULL, as mux_state is not used below.
> 
> However, shouldn't you propagate all errors up?
> If the mux is not present, mux_state should already be NULL,
> i.e. IS_ERR(mux_state) would be false.
> 
> > +       } else {
> > +               ret = mux_state_select(mux_state);
> 
> This causes a crash on R-Car Gen3 and RZ/Five, as mux_state_select()
> doesn't handle NULL pointers gracefully yet.
> 
> Adding a check like
> 
>     -       } else {
>     +       } else if (mux_state) {
> 
> fixes the issue.

Thank you for checking this!

Ack :)
I will switch to:

	mux_state = devm_mux_state_get_optional(dev, NULL);
	if (IS_ERR(mux_state)) {
		return PTR_ERR(mux_state);
	} else if (mux_state) {
		ret = mux_state_select(mux_state);
		if (ret)
			return dev_err_probe(dev, ret, "Failed to select USB mux\n");

		ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
					       mux_state);
		if (ret)
			return dev_err_probe(dev, ret,
					     "Failed to register USB mux state deselect\n");
	}

In v5.


Kind Regards,
Tommaso

> 
> > +               if (ret)
> > +                       return dev_err_probe(dev, ret, "Failed to select USB mux\n");
> > +
> > +               ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
> > +                                              mux_state);
> > +               if (ret)
> > +                       return dev_err_probe(dev, ret,
> > +                                            "Failed to register USB mux state deselect\n");
> > +       }
> > +
> >         if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
> >                 ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
> >                 if (ret)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


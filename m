Return-Path: <linux-renesas-soc+bounces-32097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1IO7N08h+mlvKAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 18:56:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA5E4D1B24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 18:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87072300ED91
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 16:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A334963B8;
	Tue,  5 May 2026 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GxPvklzL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4654949E8;
	Tue,  5 May 2026 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778000203; cv=fail; b=gViSmhU71idKVc5yaovZnEQ7ZbHapq6wtg4xPEVyNH1t2W4KzzRAX9VO4jvJiTW2RX0Yu9GloV3vcPlTznX96vkQcGZDU1qe3224dP1WkPlN9IFY22gqW1gS89aC16UGscgCu7hoc581QfLvCpS0pDZuB1PTWt4xtrEvNPhUFE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778000203; c=relaxed/simple;
	bh=7B+/wHFXTiv0fKg/ds7aKVKtdtNXWbPgsB9jq7E/v6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=miSOZydxT9vwvbszpb+qRe3yW5nMasSA4El/AnH0lahOX3AyTPM4zagmsDE2EQCfVcGn0ipr0uavUba7vjSq/pynurajqR7hjbZoAHgnOZfFl3iKbNOo9OQ6/mHvxZDA2MV6SyAJ9CC4B+4eVkSUj+tLjkWs+isuakSsXamcgZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GxPvklzL; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq0FcehP+iYLZW8dFaY+uQBKG7moqY2jQouVpkh99xQ24xzUAUb9xV8+3h9HAHoC7k9sx+yAdARpope4NP9C52QQH+a7C5oZfYK/Eh9fZjBITXyo6w63EHR9IHPzz/ThkJ4D7HmzJ05wIZs1QE0z6q+SeCGRcntjkLRmF25wKVhr6g6T/sFxt42UipIC24ncp2G9lBuwnFn3TXeFB+wzaHNxtw0+1csVo5BCDdn1ZFUBrnEYBSStCgFrb09hpmlmoevGgi+o8pjTZCTFcElguxUszmcun6PhL416KCkYz5grIikE5Rcvt2djN96icI8SuGKaollhAPDn4KC7Nl8jTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2J1AMgA7SjZ3FmZG9nyi5KjZQ5Tt/H93SCPy5yc1cU=;
 b=OoCO/hY06UrcfWpZvumRo1w138Ej14DoFBiPjjtqjb7iBEHAfRzZTzJWouQHAGeIqfbR1KoYeghNHgvx43I/ShVhBEEy9nN969CpjxlmqEifJBGyM+Rq/Bm1aSBuauNPYyMrr2Oyt5vVJz5savx66Z6KIPhbn0xLHuncQQMoTwRIBYWF0ysUlirwIEvzBu9YHLiMqtuPJjs+L8iRt9on7fawa9NuhJEF1cyXTbYATDVFNdln51LiCODD3XQM7AMiKgBrGujbz2qRA2aYnZUsLC17L99PFGuVrwgCOe5AnpwiyfcPMSv6ihB7lXU6tYO72AHYpGcKrj/Ilqm8UjCtcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2J1AMgA7SjZ3FmZG9nyi5KjZQ5Tt/H93SCPy5yc1cU=;
 b=GxPvklzL90KH/gWR7mveChcIwY0cLySA1u7DVuGbcehOqWRpa5TnJSmhg8U6ulkCFu8XG5uDm4J31LGrzWZTK/VOsGqlzKBUWNwPRR2gmq2SGKgs8AKozp3p5JQAOH1NRL+YKDE7vG4r1Zd8fVLoQvpv3hdv42SwpwfTNcx1tncIJ8QGJ9yymE8kxXo/PJ/vpBt5WWpfiSw6hCNmr+DrfD8AMuOJpkLTaS9ep3LC200kvzSmpQsKDtVbLgEsQDa1Bum0vkKyKPXK11rgHXi7Z1B3wIA1BA6C0+Z6UqM2M9Dz/916PAJaKFkfBf/e8nDj1QZ48rtD671WCP0Ch955CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10491.eurprd04.prod.outlook.com (2603:10a6:150:1eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:56:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 16:56:36 +0000
Date: Tue, 5 May 2026 12:56:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <afohObxES9nIQla2@lizhi-Precision-Tower-5810>
References: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
 <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
 <5988897.DvuYhMxLoT@steina-w>
 <20260422114213.GA68897@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422114213.GA68897@francesco-nb>
X-ClientProxiedBy: SJ0PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:a03:331::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10491:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc6f58d-e3de-4020-de65-08deaac7448b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DLUWygGrNpqYR9K/XxIGt9iyo68D4XrHgxpF0A+etpU287YiI/180vXWB3GkhxzL8H0QN+Wlcq4pAQlPqua8EBoDq8v7hNKNeUPXv6bjsZn/QaaoNdJZlA9tz1ltIfbpD8FWV5eE7BVCvtazQ1DWke5n0AnE8KwCC5JThMYjlacc8ZarDOWkki904k6dHyeVuEfMTSebpwsCki1OeAdGTeYDGZNbTvUOHuozLJxrVyfRI//Zj9U0Wiuq9kQ8Hj8ZwFc/uKF0HLtGwRt5Hrj86XjE9pEW+KfJy69BeKl8wWj9qp+W7CCbnFFPhRSPxSrdFWV3JaEVdBZfAbrWvVzANYcGGqYZp6ZHCMoIgJMV73ZnT8OVaddWquFJY5ITJj8TbQQtIKcpc5Wc5SHbTvRVCdFiifMLQNVVvwehSfrPPhYJqIhNnFYweEW1RvZH12YN9dfeCF7coKi/21duOuHMP5uD1PGgKPpAio9fuDxuprDYSiAbWr6n3+qvt32FfmUjxzxgbo3gyqDsrP3AnJ5wDlGFVWAPXM3psZgaariUW72M0z8c/mPhuTttMw3RdXW3hHwsrXgXKS6oDh+SvohHIDZ5ee69YK6hhrB6+IZvwDt3A4peTx+BfCWoDcWwTWtMIEo7u3uaFPyOlaVIHwBsouZ/58DYdHK/ghwKeTXqyYgzrqI1txSXcCvgy1hhvTgi8J9fa9ukgCfyMt8Msz0hzEuAOSrTmI8QrVXOkSiSjsf1S78/u6RVb4z4Hly90AHf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ghd0gR4qTVaD6D27AZR2m9CIrtgr7vU+9XRU22auEmCR9T2lAKK9tPI761s5?=
 =?us-ascii?Q?Sk4/niIIKEah8YB5N4XxE00ppaATdsjlDkxVSZ068WjeoqtCrsn2jlav6fx3?=
 =?us-ascii?Q?C5vW11QNAL1YuJhSNPlRGn7AAfluuylJLuRYBbnzgmA7btzTMBOfU1uTtB6g?=
 =?us-ascii?Q?AhxU6g+m8R7YypwNdgky1jKdWcLgNp6Ks6YosZgGyB3tHZonH/WoUhR0jUAL?=
 =?us-ascii?Q?ZwIdLdui9kokl+F4KWSK0NM2jFoGIPgrL3ssQJ83L8tasGZdUflyNQDtO4eV?=
 =?us-ascii?Q?yxij7PZoWCu9YZC3ZRlpWjiAZhfIF7Yd2Kk9ugfs2pBBJqDi4cmMiKjA8bs4?=
 =?us-ascii?Q?NMNXsNcAgXvUPt9pGCE6IYUYPqdUjy9LRIXnrKl6/dQ6jMQeOv7EVKvqoPH6?=
 =?us-ascii?Q?a/0lowfP4AeOeV0jxI55By4Unefd9rWsYBSphtzNui6XdldwK1AYEcsd8+s+?=
 =?us-ascii?Q?Qd50Jdp/UxlOpUr0B7RzG0eeBA7+9hERt51bzMMrr7/Y5/o4bBqFcdoQQ3L8?=
 =?us-ascii?Q?CeHktxz4GGGUjQc4d3ZT1sueXcLkfRrJArAldjKns5/0Pjt9vsfK6SfEKIMZ?=
 =?us-ascii?Q?blwEULEOY/yaFfI7BX//KuNHXfZKftlVDW3rl5/LIVsYIWcJR1/NVcTVh199?=
 =?us-ascii?Q?3BAgOFuBB04nuZTVyxY+ubl/itUMf0AxxVxC35CwszRMMnWB9tOXTmqz6L37?=
 =?us-ascii?Q?jybfHOubKSOD+7uum4g2gLaQshIYBgOtZsPY1RRhYfNgHVWavpfhN7EcJqng?=
 =?us-ascii?Q?2vMc0n4sJptGDtciU/5hSxKSZSQ1iQhWREAcp+ndhtVBXQdo3sNdT+VmBQL+?=
 =?us-ascii?Q?ZiLlOwREuw8sUBP45mvyWs+IZyFL0llSyYyeN4OXk1OoMYW5ArYYlLFrKRkK?=
 =?us-ascii?Q?CCg+5UXBn+3HIezzIzgsP0MzLPVNJh/phgdzquSym0qI01RKUjVpS4LVhSfL?=
 =?us-ascii?Q?EbgoU2QQxW8Hm5qFa6KTgVadmO0UuFXTukRwrhspfvaREPyasf5LLjJnW4EA?=
 =?us-ascii?Q?DnGKGrSWRWBpho6PKilN92x9wfXaHCpqPPFYy3X7IzlGIR3oKKLST/VCVOKt?=
 =?us-ascii?Q?a4yx8+IwD2Yg5S7kzAzF51/mddoVD9FErSHFOk37gVvc3lNmutmNUCfYV0eO?=
 =?us-ascii?Q?5P4SPVwqvBwdo2gAQEJ2LNV0PqYBercu7VSBeMigtRl/av2mHHaDJ8tZK5T5?=
 =?us-ascii?Q?XOG1VqMQaJEWRIKV5Un1CJhqoy4VptxNhzet6JEG9HvXVD4rjTemSNfhyVvD?=
 =?us-ascii?Q?BhR6kwcBSxaqvLtcZU6+zV7WyJ9JqaPexQbPnQVK1liKtAC0Cx+Cf9C4j1US?=
 =?us-ascii?Q?AaP448NFIjy4v5gGEmsa51mKAm8Ar7MJp3Ed8hE02eebGdK+v7H5SODvS8dD?=
 =?us-ascii?Q?MD5CdtI5+4fAEj32NmNFMeNZUP6tqOv/ykJbhSXeo7ztVjFez5juLXZCX7tQ?=
 =?us-ascii?Q?cUxxjLxKG5y1nF7gFxJGG2+1QVD5PgVFVifm69hDEkcd2aTlZ8T+JOh+0uit?=
 =?us-ascii?Q?dYqQNF4+m3QJZBBfJWK3wwAqr36w9qVr0xfpsxM1dVS097YHvALJZ+kbOd+r?=
 =?us-ascii?Q?l91tCNJOhE4wluRZhWarvg0Iy5b4Lu2kaYf/xx4EUTWLBxVH4VsX08p+bvt/?=
 =?us-ascii?Q?qxCRqsM41LEPqwNUD6tc1eBxH0XuyIl2hG3bITwEo9Qc8mxqrtkH4cdQwJPb?=
 =?us-ascii?Q?HrtiXOTgr2jPgCsnrGjJ+75erPdoT5hvj+2CdOzOMVB0YfFMX64H7YToje30?=
 =?us-ascii?Q?c0oiq65b0Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc6f58d-e3de-4020-de65-08deaac7448b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:56:36.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+KcYRPh+AQURRvXBINxwc/50o34bTYk0BKXJXZBfFGZYf2ONNYE/TKLSSSePhjSJyKAUmCaSjLqZ/CZ2LaktQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10491
X-Rspamd-Queue-Id: 7DA5E4D1B24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32097-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[ew.tq-group.com,oss.nxp.com,kernel.org,pengutronix.de,gmail.com,glider.be,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,a0000000:email]

On Wed, Apr 22, 2026 at 01:42:13PM +0200, Francesco Dolcini wrote:
> On Wed, Apr 22, 2026 at 07:58:11AM +0200, Alexander Stein wrote:
> > Am Dienstag, 21. April 2026, 16:48:25 CEST schrieb Daniel Baluta:
> > > [..]
> > >
> > > > +
> > > > +	reserved-memory {
> > > > +		#address-cells = <2>;
> > > > +		#size-cells = <2>;
> > > > +		ranges;
> > > > +
> > > > +		linux_cma: linux,cma {
> > > > +			compatible = "shared-dma-pool";
> > > > +			reusable;
> > > > +			size = <0 0x28000000>;
> > > > +			alloc-ranges = <0 0x80000000 0 0x80000000>;
> > > > +			linux,cma-default;
> > > > +		};
> > > > +
> > > > +		vpu_boot: vpu_boot@a0000000 {
> > >
> > > Should this be memory@a0000000 ?
> >
> > According to schema in dt-schema repository [1] the node name should
> > describe the purpose, so I would keep that.
>
> See this question on the topic, and the related answer from Rob,
> https://lore.kernel.org/all/88456d17c91737cfc09af46673b49bb9a9d36dc0.camel@gmail.com/

At least, need change to vpu-boot for node name. label already indicate
purpose,  memory@a0000000 should be also okay.

Frank

>
> Francesco
>


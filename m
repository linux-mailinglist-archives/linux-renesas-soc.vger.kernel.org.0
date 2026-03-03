Return-Path: <linux-renesas-soc+bounces-28679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHoCA1dNpmlCNwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 03:54:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FAF1E83E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 03:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04092307015B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 02:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E389379ED1;
	Tue,  3 Mar 2026 02:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d5pc458p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEECE2F851;
	Tue,  3 Mar 2026 02:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772506451; cv=fail; b=j6OXkge+oBrMxrMij80Ito3Z/p2F8hLqfZKkV98NtbQ6CP3fvVxkdXT2qACFIbdtTjNT/GgAr0cNawrpCiciVFNtnLq9D4p4ZUIPy1BLiewjJ1nD/x5DlyL2kU3bT4ais1+z7jE8LMSoMyfkZlmH0Py1bawO8+caHSf2S/wQH6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772506451; c=relaxed/simple;
	bh=9Jaj3nDI7bqfc6sd9aKwzkhUAeHqU8R0eXD8V5U9PmM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qT576FCofVFpYCgzzD9gbdwpFFAuIzKS7oVNMDt9MCOJCUN+826GtbpxtkIDlsw2yLK+uCgnH+sN6B4w6mEL1SZiIhAPXuWyDUFk4q+GB5r64LcjrEs6+XMhdUsXeoy5Ck/60ybD1BA52a9b5U6FrfkDMn/MPzTIi8k9KIVG8k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d5pc458p; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llUQnmc+K1Ctrazmc9XP+as1q0p2QtEjfFWR0q+nMLqrTPRa3Uted3b61oMKiVX84Pjh2oG+sWdMoHTIfb5rcyLZcrBgdCEHucxFZlBmJixb4x9HnnyWzUrJTyI3lFunrBf+EqiPT8Azi3n0BAWnjhiw32dnE8AoCEfO8NEUBdWtY5Sczp6tS2q/VqJhbT7M/QVbZkwDpIZNBdoz5YlnZF3U1CoPYvn/6JTu4OukWhx0gal2D/xDF+0zdUzmQ4k7I1rpDESHIMUcCcapAgdDbpJCLryAkOHrKxnGP9lkskJexcBHs6bAvqbi68zYtwZJXBXwdpx7Yi/WdfiNATChvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShPey4FUZ9lXgah50KcLPGfsWtPDOBgekggZmtB8wCE=;
 b=vTFo1Qo7DAoEEO+ttNdkBHJtqHPZn5kqhPvUag5nMr0lUOvRHeiPuSY2daZ+V+zEOUnb9dSU4FeuPKOt3s+Oz0MREz7dgQVspKnNSQzEHgtZ82j+yY0HeLtavC+1nrVFFougkfljgc4exbyfNNIlkkZQqGPJeE4g3DbeBtWVd4OHymC6t7PhDK8uWdkYxe4CNT/br2bwTIGhxkY/dPfKaCo/WvuTWY0s8mNHdr5tvbXd1bSvVaQ488nFEs5KZpl30/TDenSpr08iFpza7O5GHOEbk99ISTxRh4iSwrTCkzI7uPaPYSLUFvSGcRoQIKucqVf+ZwkkBFKektgWPe5nPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShPey4FUZ9lXgah50KcLPGfsWtPDOBgekggZmtB8wCE=;
 b=d5pc458pjK7PXCrNzSB94ZfTgfTlQtuiG/bTznc84aFkf8nDgJyQjDM0MkQcH4mavc/CPRRsBsJWPc/fCPe033vXx7vDTBeIP8KoouiruFnRf8fxlsv5J79zlby0zINLtzIEE2vNCt61QJlh/EE2N8sZOLcfKVuKAABSNd0+UQh15fFqFqZS52shoUCLsKy/LQOpjbVwhmHLwAPD0VJtgbWvpM/gUNLQbvPvdpRcM360x8P8jt9GS9recPwPs33AZdmzRZXtpNiQE6HFIjumURTfi7Luxcb4NoNlVWLYoZRP6KIUs3EJ0pnElr8oUBAByJziGO0SGKuse1s8IDFVeA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB8013.eurprd04.prod.outlook.com (2603:10a6:102:c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 02:54:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Tue, 3 Mar 2026
 02:54:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Brian Masney <bmasney@redhat.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "sudeep.holla@arm.com"
	<sudeep.holla@arm.com>, "philip.radford@arm.com" <philip.radford@arm.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>, "etienne.carriere@foss.st.com"
	<etienne.carriere@foss.st.com>, "michal.simek@amd.com"
	<michal.simek@amd.com>, "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "kuninori.morimoto.gx@renesas.com"
	<kuninori.morimoto.gx@renesas.com>, "marek.vasut+renesas@gmail.com"
	<marek.vasut+renesas@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Thread-Topic: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Thread-Index: AQHcp/9lAoUMJunS2UiMm4HYHJF3xLWXSggAgAQ1IQCAAKK28A==
Date: Tue, 3 Mar 2026 02:54:05 +0000
Message-ID:
 <PAXPR04MB84592B666C8A19994C2903C2887FA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89> <aaXEtNilpRYhwmYc@redhat.com>
In-Reply-To: <aaXEtNilpRYhwmYc@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA4PR04MB8013:EE_
x-ms-office365-filtering-correlation-id: 6acc58d7-ebb7-4ac8-f887-08de78d0226b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 TuI2bVkxIc6f59hF3h+1K7QvmrIMT82qkERaIOTyInkj+sVoNXGRw/PHMmBS/jVPpXWKPiCVyuxJSWZ5DTQ+ZMUQB+rc3hNvEL7FYR/Ph9d9h3XK1rzCFLCxdtpCN16JmDdD7uAQC9Q+9wUGuPNUG22/9JOSwDXAP460S2x5MHn8hXPfa7JeyB13+HD63z9RcVXGUeFMM63As/GfRYDSoEkI3c9w2El3Lv1fE2wFoplS2WwOrTdKkytt4Pg8VmWhXzuHc7SCqNvQfbkq5hlPYvAn2ZPIAY58Z+AbQdqPUifpfGuNQkaFLB44kUvAuRk3VPYaIsAWFyfj/8B7kqB66YIWmjWMs+85dapXTkZELoytBBMHDBRpo1rGZVXrDBi3Rshg9YnOPToEFU654+viVzCqa4f+ZUJIf9PA+cvWuHWkuEfkSqj9KmLUYK39crYEYYFWG5DZtxT5vqQpeM6h4saOqKXLaj8a/LE3SlcCPrLdppaSpsuG2giZfxhNU6sCB8ybT9UU5edjbUVDKsZnzqwZX2mUQgonoV0VmqyLciA/jNZNNaZ/axuraC8l9rx58O5Ridc6kfP5vMOpGLORBD5XuupPaBLqBZD9TcU5k/KdNIyfN4R883MKVGXKGpXo9NSRvq8s9Xn0crNKz2cMZTOq+y1E6TW8cwnFWIARTz28SAxMkksvPi1Fs+mQYXsbip5TQB4imFWKgAojiv1+NX215foI/UNxIE9DfknCohdD9rg8gCfJE3a3dbdtClwNURQ1ir+tOTUKTauqQVibQ6nGFOn0Xu6PYtOkSHzTMGY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GjHJQQesRzSPc7AkaT9F+q3C7BlJtEqatstoVwdcyaIP12yJVLrtjDXzaQKO?=
 =?us-ascii?Q?430CMCuOWz1ACOm4dukrQIWH6lJHI1hhazhyn6PENxomGOq1gmpRmbDDrS7+?=
 =?us-ascii?Q?SqJSeibx8P0s/GmC57Izff3vg8kdGdcAR9J7mmESRGDCqLl4jdidP8Kr/6gR?=
 =?us-ascii?Q?RhFEk1S4/zz9WwbUADlLOJi+LHm/hEsMi4soLex4vhxbMrI68bOhCX10Oye9?=
 =?us-ascii?Q?dtFkvNGSmyGJQN88SunzlHYprrKkj8+x/i3avnSmo76PeSHl/9jLzxLuQaHT?=
 =?us-ascii?Q?yucIx1+j84pf24dC0WvP790+5UC+A15lMzrRa/RAVUuJhLGsjgCsqXuClMv2?=
 =?us-ascii?Q?tFTt3Nlgk2X+uXSnikpvR7r+L5XH7XWk+9IVHV3K+bytj7olf+y9kD1tldSJ?=
 =?us-ascii?Q?FUMXFRT8KRNfptADif8mSvPSSDTWg09cXGh+PKLIlgbTyvrw6KAduL1sN0ok?=
 =?us-ascii?Q?RTYUbXQ4JpSlGdeFdP0wTdRdohE6q7MXpk1TvIJP/nuyk9Xoj4T8K22Ku+fr?=
 =?us-ascii?Q?nOxdF1j2zY4eilBohZTQuZUCRM2mVAuf4OicVfhmUt35x/2dPBshO+xcCS0W?=
 =?us-ascii?Q?CHtKmCrzFOnyQuu3z49BlD/R/kmrggs0FfevOFbs1yHVRvwqE2ty9cGplmf6?=
 =?us-ascii?Q?1T2gbCwp+r1m0uF1MXX6En3WE6Oy4oh3caEBdMmdr9gRDjUproigqvkddOU8?=
 =?us-ascii?Q?kv7gpZT4wRk43ulFImrc70JGfakUt448Kge/Znjs4J/UUzK8rCa2ORhv0X5n?=
 =?us-ascii?Q?DHS1XSVK9Txobegs7y8OIFokvmaQRWLWogpigOFk5kPMHOlGYhKR5Vz9ZWGl?=
 =?us-ascii?Q?XN+RB3vWwOry4fwm3bCXnbZ8Y5hAzK7a40onjUpSP5lsJEnQOAM1o3x2H5+W?=
 =?us-ascii?Q?ZvnH4Rw8x3KtpziXundOGGbHYvmgC+T8eTkq//IRvLbUtGaq/P1l93kdRlxK?=
 =?us-ascii?Q?VbfWarRxMFbI0koMVxsQKkegA+tviqhkKxQjs8BckhLo3mRj3IOWreQQEbPq?=
 =?us-ascii?Q?363dbslMl96Mkb1YRwsQSxL26nYE2LLO4obTL/KCUvzvaMJS7f8sHrRHAvsS?=
 =?us-ascii?Q?Nfv80VgvrztlxAdzEeg2enpwFQYD3BngImtQ4EtacaFeY4ZbVWNKFWJoN9MV?=
 =?us-ascii?Q?C4aR5k9ppKw4VR6BY7WdinWNbxtOHFjoEqalLSZtKekP7/EVZac/6uCYHpgT?=
 =?us-ascii?Q?KLDmOj0+zsfPgjUvH+BT3tVwg90hBThHzQZqWDOBMmAgtSb8141sUTIwR9PH?=
 =?us-ascii?Q?UDjevGXL3/YNU+zVjs0QiskmiBLYh+lsu7Y/9I+J6ICLzQKZn3qnFVf3NJ4x?=
 =?us-ascii?Q?rRw8qrKoZnFC3VHEDgcZWkWftxvXVv32GaqnBsbTUB8KHxDbWHAQkGXh3yPj?=
 =?us-ascii?Q?vICdCXAk4L0zIG9WrXxEXTrexnviiUc35xhKF2mN2nW+CWsNGcFuLLBAcV9u?=
 =?us-ascii?Q?sKb0exQrrcG14ikjcpj3kIO31YC0ocoppd+C1mzMeJDU4SkUpmdDrG+WPM9j?=
 =?us-ascii?Q?mzHVfNUssGWELb4vN7N8y3ob54BOZKKkiyxqw4Z/iKiP5Vm2WTZjorzWtNqw?=
 =?us-ascii?Q?Vr8PQ+8x3ykeeLG3SHePAVgH3uowrFhxZ1fiKQ+KeWD/muxt1DZoXyeRoByF?=
 =?us-ascii?Q?rve5Fi1I2Qyjb8Vo8/3OZQSlrzIKJD8ol0O9toAb/yEXpcUJ3Y03JyNA5eGX?=
 =?us-ascii?Q?3CiltPd5Bvc7WynvbZ1eRzB6fKf65DP5iOFWi5ucdrabXTc0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acc58d7-ebb7-4ac8-f887-08de78d0226b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 02:54:05.8855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uIWwEQeRMf+5a74ozPODPa0jpUZ1tdZCG3vM1bx1kb9WznucwkVGCbhAwvlD92PV4DqftvO2XRt6oMpHxcTlCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8013
X-Rspamd-Queue-Id: A0FAF1E83E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28679-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,lists.infradead.org,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[PAXPR04MB8459.eurprd04.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

> Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock
> operation
>=20
> On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> > On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> > >Use the Clock protocol layer determine_rate logic to calculate the
> > >closest rate that can be supported by a specific clock.
> > >
> > >No functional change.
> > >
> > >Cc: Brian Masney <bmasney@redhat.com>
> > >Cc: Michael Turquette <mturquette@baylibre.com>
> > >Cc: Stephen Boyd <sboyd@kernel.org>
> > >Cc: linux-clk@vger.kernel.org
> > >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >---
> > >Note that the calculation logic in the protocol layer is exactly the
> > >same as it wes here.
> > >
> > >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis
> is merged I
> > >can flag such SCMI clocks.
> >
> > Per my reading of Brain's thread, if ->determine_rate exists,
> > ->determine_rate() will be used.
> >
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> >
> > So unless update scmi_clk_determine_rate() to something:
> > --------
> > if (clk & CLK_ROUNDING_FW_MANAGED)
> > 	return 0;
> >
> > return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id,
> > &req->rate);
> > --------
> >
> > It maybe better to update Brain's patch to move
> > clk_is_rounding_fw_managed() above the check of core->ops-
> >determine_rate().
>=20
> The clk framework has some basic sanity checks in place that are called
> during device probe to ensure that various ops are configured properly.
> I could add a check that if CLK_ROUNDING_FW_MANAGED [*] is set,
> and a
> determine_rate() op is set, then it gives an error.

Sounds good to me.

Thanks
Peng.

>=20
> [*] Note: I am tentatively planning to rename that to
> CLK_ROUNDING_NOOP in v2 in about a week.
>=20
> Brian
>=20



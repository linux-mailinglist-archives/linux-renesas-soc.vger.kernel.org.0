Return-Path: <linux-renesas-soc+bounces-26279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 618BBCF30EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 11:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B726B30245F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 10:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8223F316195;
	Mon,  5 Jan 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bBp+w/CB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1110D31619B;
	Mon,  5 Jan 2026 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610233; cv=fail; b=Vu2VzZIKhqVorq5p5cVyfJp56skB43Y1k0H+uTqJeOI3Y6xtHJPzO5400TZeiQQk52dvs/EpclbfDKlMH5iJ3KaApF3UMrbfOOKnQaYVKeWGMNG8ZACWJ45Y4Czck4jFqlIFuMib181z8gjir03FpgQ2RfXCSnT5QOcbcuwJvxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610233; c=relaxed/simple;
	bh=w/HrJMztr1em3nn0zcZDTDUVX7/LojFdZj/0RMHSbpc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kZ1xiXx0DTOtidMRMQmcK20JddJWAOv6DM1ipu2NQDFsLIvraXBRKwRoSPpDRJ429JMTnsYA+Ps6F7i+Et12ydTL0quA1xqRmGgCFizq05FmCd6VcfIVk+/qEKodc6HNZCQhp0UmHQIfrjeUWA2WRZgVpVjRx1lGM606DlAieHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bBp+w/CB; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+bgXg+R8nZOLkuVgbONKZ5AMfNrlHIoTDQJiCA8bAMKlThNOg6jCsk3ohPh0oKw7GcmqIwy5PKiy4/2SPl0rTikKupTqjXsGsRUR+q8RXraC4QbB+EYwmqLgQuUrqQEGWn+/HSnIaFu9CQueOjlgUPFTDfDRrNDvSXNbTv11Ui+LkWYjmOZ346qhzPA84Klstgu5VxRMiqFF1vPO22mrnOGYZCaj6V5EVtAIu9mUUPeb/9Tj+1T1odA6ZdtadkSwhc66Xvx6KqXXSjBXqzUC5uqr+8Jy+LG3KbTBHpzEoHpOkUDKEpbr3AZL9wlaVhWctaYvnvYlzBRYh8DdC3YHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4V868OQ7KSsvp7uYJiUCd+hxZdfZVe/t7GNyrgUSN0=;
 b=mMFu9O01hZI6rh7dCNFy5SRO+ORknPRno+cRaZsRw+GpNS5i2B7KqoDQmoYAPTWbFmMyJ8tz1nabbCLgCq+M8TeNXYz5rkkLUJwAhNIUaTAYYcPazPLxoOYv/dNBddrHRVBS2vz2GyR0U/n49vwzKL6GNQuWSsUPZSOxNqJnbDUd2l2s8qmNy5A4tOJwKAaG4CHTGUMpEQ4hXtBz8ZrqKWFLkvtJLUs4pdrcP+V5ZxeCi+o2kQqXJJKqL2GZ82bvTF9RB7rEceHk0EesJ+0az4YyIx/3Lb/mjTOlmqM8+ES9g0YDgUX5G6d64nGp/rX4LLbAfJfui/hj4JDBFajLeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4V868OQ7KSsvp7uYJiUCd+hxZdfZVe/t7GNyrgUSN0=;
 b=bBp+w/CB2HbYEISE5ZDnqmanL+qowt/3oJEYtqZlXHKQU+GvFvavRt4R1YB98Lz+qmWqQQzpM0CXPVs8Sm6fiNMI8NRY6eloyVpB6M3TftHNAdGOgMOvwXgWzPs9KrspOyNQDWzAlEMDHQ/fZERBLOglA7vO+qjX6a9jtx/CfNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15540.jpnprd01.prod.outlook.com (2603:1096:405:274::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 10:50:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 10:50:26 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] i3c: renesas: Add suspend/resume support
Date: Mon,  5 Jan 2026 11:49:58 +0100
Message-ID: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15540:EE_
X-MS-Office365-Filtering-Correlation-Id: a94c3e0e-f4c7-4f62-4c4a-08de4c483be7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bhGDWrzYq9Y/fqg0ZVX8MetOVIKc3d/M6BcJShCf2WRy5ZC6zs2ylH092/NK?=
 =?us-ascii?Q?2QlV+UKCXA/Js9fLfj3/dEmS9RxymPWv39TUQLbkuGFDx7ZkPMyG3Na0QJFX?=
 =?us-ascii?Q?2FGgm9Vfh0ehDeQZsDXR5K32gL4vkhY3WUq6ymUd8vT8QIDvZfg/fps4AHUi?=
 =?us-ascii?Q?XuiPwUotJtWfiDl8eNCIL75D0AyAerWJaQkCd9TfHynwJQ07nK/Cqoqqxto0?=
 =?us-ascii?Q?iJrhVjt82GMabGstNE8nxsIqMWTTF/Vu7CZ4NoHBye9MKlcMWtKkKnXs4Epz?=
 =?us-ascii?Q?kVLft96kn7yllEP5sA0ac09pNROdADPLFC2wZNJbmd6v23ZF72SurQoiAlHa?=
 =?us-ascii?Q?lwC0ZDj7e7jkk7gBN4Bq/k5PinEqTdXpXWWL5v3O5rr267w3yuSP0n4vGops?=
 =?us-ascii?Q?Zk+lSEtgk6+Egb0NAu5W9aBIXtkyg9qQy8X3QuX0cjZ4dd1l6eAusb5F5PWV?=
 =?us-ascii?Q?z6fI9kmQdt7o/aEFA890YMkcEvZKpg85ALjKP0nRHNKKlF2djYmGYSUZkqLb?=
 =?us-ascii?Q?M3c4OxthYLn6xkHuEZ+LN9NbcFa5+KmrXqq181Ds4ZLIUv8/C9ZsLn6aEltE?=
 =?us-ascii?Q?lK6anGY6jEtx7azH4I5H05vDeqOZaUZRh5Z+q4Y8f4uyf7baYsjpMDqcWJIr?=
 =?us-ascii?Q?HkAN2zAGYVQ6njXzQsd7eySIb2+4GEAxSmhxfKCM+Xgu6+3fXEu4PRpudM7F?=
 =?us-ascii?Q?9o+Mxz6A4NMXW5liTVv8xP1OWHQs778XAhMWXfDiv2RsFt7B2e23JwvQNFAQ?=
 =?us-ascii?Q?ahDbjFzLAV081r0vUO3AuJpe72Zyszjj/eV1q9Wqp1vBAMPjlbvRFiqEyuSc?=
 =?us-ascii?Q?qBASixtZALxiBn/AXY13iy+HodkbrDK5ODND5pUhlZ6rdl9luh9dnVHod/O8?=
 =?us-ascii?Q?AJtehdz9h8nrEReM+fRQe5/SrNNTX0/W0GcHPQb8F8912f3n9NHzDd7k5cqz?=
 =?us-ascii?Q?hGCkXSeYQNmze4VzVdwyIExVkRIBkvNjQWeSEzI/Ea7FfMr7UsCoj+M+TwmI?=
 =?us-ascii?Q?cvIeSUmD8FvA924R/ELkmKybGmp9KLFP8TKHy3y79iKdZ9psLcI6CTLfIkqU?=
 =?us-ascii?Q?oe8BfemjzunidIv2qhu6Ei4S98N7zeYg2Noq6TOu4Al8CFY+QxQ29qdqX5u2?=
 =?us-ascii?Q?qSnkENnaKGlydzwWkFsaUlh6GCdo5pC4PzXgp+yP6TpyeyFIGMj8z+bfcwFv?=
 =?us-ascii?Q?hEpgIUj2mT4GiAFB9l5PNWkx/3UdC/Bxlm1cPu/UeUnriGU8AId261BHCxZj?=
 =?us-ascii?Q?KalLvk8u3DulGioELQiNMB3O9mXmTzS4FnLmsqF1q2coHFLe2rLVvW8Yt19G?=
 =?us-ascii?Q?Jz3O//UTo0MZUNahva0df7ANx8uaaN+vSSBaxzrZn3+olGoNuTue4qiDNySw?=
 =?us-ascii?Q?JoWkkLnmG6kkqKJ/gM3k5cXiizPCQ7IHR3FxANjweWA+78DiCPDjwl0bPxoz?=
 =?us-ascii?Q?x+1ADrn4Ub/4oKTq7qWPxpK4LC3ybW5R8WkSCY4FptumUh6k/YPeZiF1178r?=
 =?us-ascii?Q?tkTvm2qpaaZaXxdPeeyUgoChFWKlCQEVjdu9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?voQjvjlofwhwGTMlRPPZ5uJLoml6fPKJkQ+Q9/EA8NpzXzWXXH1kJMeid1K0?=
 =?us-ascii?Q?XSK10E2Sr1wX+psFDYmGt076PEz/wqwdjljfY+O5Pe2/SlwAINvalrDAp9H7?=
 =?us-ascii?Q?GBJSOhuQI934y2MJJiJucoWg1zNyKI3zgOMbfZ07R9DoDDSKAY9VuslYFHN2?=
 =?us-ascii?Q?40X8bZE2mt4+EtX56Wti9XDnT0AA5lV2RMuoN4oUS21MirgMmwIIXaEcQ4D9?=
 =?us-ascii?Q?QiHGWxqjhzZ17TOucJE0+67Nw8vJM3JbF/xaWY45rukfgVjXgnNcPeJuUmm4?=
 =?us-ascii?Q?feZeR6OtvLGSfoIxqzdMseU2MMCE7QF2SBwUMq15m9ybXGxSrPk7mDpcC4Dh?=
 =?us-ascii?Q?3NVFpd96i++saZlyhW9bxSKGAJETo1oob9mmHF1XAaB48Yo/rFeQEBMfmoAZ?=
 =?us-ascii?Q?3xUMIuxdcd0MyRZ9bSAZANSleWKsO49fvBx2w4DnEPwl9TrA96dcnDRJFdG8?=
 =?us-ascii?Q?h2FuC59jKncTcn2H8UkZyLlO6rAHG455EWyzXzC+QcDCBK4vyJZx7QhOuy94?=
 =?us-ascii?Q?9wSB5ZXsQFIHOZ1v9+FMSl4lfrMe5XoEb96fYW+Tq2tUKlxLwzOExwJ+eIOK?=
 =?us-ascii?Q?qRvXz0v0dUoJLw0QUHcZ0M/fkroI8GlbNsdQZBr2EYTTLa+2eLedCl/gWcMd?=
 =?us-ascii?Q?yGxFGjYApPTfCW+Sxetp6VunI5IuF+KjVJy4RyXYMS2+X6WHpbCq8ko60Pe/?=
 =?us-ascii?Q?zjefozhDok1UkxJWzdkArRKc3C6IV3F367EJ33CiwA9gogrkL7gzfXmpi0aq?=
 =?us-ascii?Q?ipTAdPdhOSVHi4J8IG8gt5lfYk4oHTFFRwwoFD0VlfcRiqPXHeP3j67/rLMp?=
 =?us-ascii?Q?2I5gxBRKxrO8292MtAEqabyo0xvzfGf56DZWJECCaRRxG2P3fi2DyYWfCi/h?=
 =?us-ascii?Q?qJH6Lfj7U1vSo9lpkjJgDwZZszC0DETkPAwlmOizwl3PO1SN5kJlunSMKmMv?=
 =?us-ascii?Q?qJtVw86GfudI2ck99tr3kTVSH5cTZdwMgfnGyIYoWWEApfFXhGF0yMwjcfgC?=
 =?us-ascii?Q?R65ZT+XS0om+1Sr9EgwgD0oqvf0znL1JfUFKscL0uxrbOYM5Th5L1zrHr7ZT?=
 =?us-ascii?Q?rw8sUtI5odkyRHC/pBiYTXl7+0T9CNfeaTfJXJCuxshSle99hUSTnTkydmo9?=
 =?us-ascii?Q?Wqwy7ArK+mtxF2i9/9AzOivkgrQThqCcS7cWlQ45UV9rDB6LIX+DDcibAAAO?=
 =?us-ascii?Q?t9NL+AK6qYjqvmv3xzTl+0mQ8nGIGmH3kKrZr6N7lx78tftpEAr1AnU1/bA2?=
 =?us-ascii?Q?tVZqc3xkIqcTOFse2PdfW41n8HNsDrW1zXoAV15sQmx9mOIK1Pkn9ICPXQNj?=
 =?us-ascii?Q?7SUO88GQOL+a9iAB05Qk+m83Z+OWtjUwonXM9JR8GvvcaP6dpOMQvRzZI3dm?=
 =?us-ascii?Q?u7mYBv8vC1K5f8Eacca+KbrHJWv5gyrDqbG5sD0Ix3TO4c6jYT/B8FQcO7TJ?=
 =?us-ascii?Q?xQz9iP53OEeFxlQBLOaWpIeckNzB1wBL7dXU8dr2uflANUaoI1bLyOpWXS1Y?=
 =?us-ascii?Q?TmUQfuP2E0Pr0kqz/H9WzvjfU2iL4OPCKNW5rb3sHBw+Y7XeyImjYZNOtpXq?=
 =?us-ascii?Q?B0b+cfKokx3pzjJoW2oUXHlkQRpDiUWaih/5t+SLqITAPLXJe9bE/A4ibQHv?=
 =?us-ascii?Q?CVAr+myQFPAPv9N3BXlAxDguZFIolLR+Y7gzOU9UJQIeyUuaUy2WI7ZEdEyB?=
 =?us-ascii?Q?ucpxDeJ1d7rlwa40z0hVyZzQBpOoeg9KIZcIJCwFhzUgE0HBzzljmvcGZQuy?=
 =?us-ascii?Q?RIA6HuHyoRUDw4ibIk8naWotjXf3FufbPr2KAMIoLcMnmrbq9evJ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a94c3e0e-f4c7-4f62-4c4a-08de4c483be7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 10:50:26.1248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOeaGhlDmqnhC8aniqqMeXj5f+NAmjvqjcaZ3bHjZltOWLqK8+IV/wCQKWiqqNI9pGmuwBBNn3hTshcnGhi9VwWvpgY+AZSHPUbLVNEEzm/7QHDlu1LJQZZFIq0Cz/2d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15540

Dear All,
This series adds suspend/resume support to the Renesas I3C controller driver.

Thanks & Regards,
Tommaso

v3->v4:
 - Rebased on top of next-20260105
 - PATCH 1/4:
     - Collected tag.
 - PATCH 4/4:
     - Use clk_bulk_disable/enable() into renesas_i3c_suspend/resume_noirq()
       instead of clk_bulk_prepare_enable()/clk_bulk_disable_unprepare()

v2->v3:
 - PATCH 1/4:
     - Added define for TCLK index.
     - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
     - Improved commit body.
     - Dropped unnecessary static const char * const renesas_i3c_clks[].
     - Removed the need for per-SoC clock handling and the renesas_i3c_config data.
 - PATCH 2/4:
     - Collected FLi tag.
     - Improved commit body.
 - PATCH 3/4:
     - Collected FLi tag.
     - Improved commit body.
 - PATCH 4/4:
     Fixed error path into renesas_i3c_resume_noirq() and
     renesas_i3c_suspend_noirq() function.

v1->v2:
 - Split patches into smaller chunks.
 - Use clock bulk API.
 - Update patch 4/4 accordingly.

Tommaso Merciai (4):
  i3c: renesas: Switch to clk_bulk API and store clocks in private data
  i3c: renesas: Store clock rate and reset controls in struct
    renesas_i3c
  i3c: renesas: Factor out hardware initialization to separate function
  i3c: renesas: Add suspend/resume support

 drivers/i3c/master/renesas-i3c.c | 256 ++++++++++++++++++++-----------
 1 file changed, 168 insertions(+), 88 deletions(-)

-- 
2.43.0



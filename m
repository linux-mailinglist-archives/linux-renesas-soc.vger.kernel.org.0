Return-Path: <linux-renesas-soc+bounces-29289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GqFIhDTsmnrPwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:52:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F174273A73
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FF67302446A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF86379EF1;
	Thu, 12 Mar 2026 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FuGDY13u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3E036E46C;
	Thu, 12 Mar 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327103; cv=fail; b=QWRW5aJZfyM8hSjQ4b7TAHvKZ1yS+XKvhmk1q/FLI1zCyFLbaHNlpyMSuc7tD2GjyXlN9dxdSMFRTJ7BB7eBXGkQgaMTZ6J9wmuPJ3ifL/ukD1nDwh1jNJXVgvBP9I4Goa5mZla2p8zD5XyvZ07ogSlylnrFiZjwwzLkdP2DwMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327103; c=relaxed/simple;
	bh=yk06Jg1EHhJWexoU7sL8bCjJ2UrD2OvOL5+bZfArT88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UOztIj3LRAhXxYvn+1aij6WgO9PF/61arY/vsXE5bjHykkWphCSUEWclkYb7LGhfEphrQ3bHQXsyg8I8OwcBlfj+behfjcfFXi21ghnUQFmxuTWUWk/Fxe0PzkZmmP+9yueXTyJjun1D6fARUax5K3y7ll2yKqH5mLF6bmUi7AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FuGDY13u; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLeI967WafychIiQqm6uoiBGo3PC89vGpQUcaxcM5ufbQLJrJZNB5mQMqlaTgL6XBDK0+v5+31sBkjOkTB3mtvKB8sYYIyUijz85okKvaXlJP6pcuvDo+xNBFKea4862CScvj3cSZNW5RrKjmRtT3kinp/lI5OfTwZFcKqC6y/AETz++1Hga7MOv3rlXeytkemth5KeRFsAvHxvlK9mntr2yPYnFZbBWs0Au3jYe218ymoD8qS484O/RlF+ZwtoS4OaWMELpZ9B9oq2Fdr+aA19uYvpIks6Lka9WpM7WK6Xq0KGtEe47v83Xh8FqwUpBLZa7nXKBmNQBu5CT+HiK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezPAJaxNO9ROhzpsG9qWPeFzD3khVsPjgaj2Y958Mxg=;
 b=UMxWfnpizImNoI6VjoigHUL+Zev4ikOmvC5fe5Fvyx2oRuyO2fYiZvDc0LIqNDelL0Y9hO1k5sdFmsJXB8vLLynTAcBSl05vuJ61O/y+K0drXfpLPWJdA+ktIIXukl+D7gVfwOeubG2BRD4okX/mTaA3OAjpHkr6wLLqfjH91TF7X5yW7hO+H4+KSGor4HhS3I3aY6CxCB8/mV+VHWhKqaAkkvA4EU7co2Y9fvT7Z/3a5q+Nt6nyX4+NFQoCpz+aMgU6NeR2P0hqCGRpAW3r04a+DAmwcZOOHHbbIPkMuw/TzId+IK0BWZNdX7dcLYpeqeOGSd73HujTJ8u+PL/Bqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezPAJaxNO9ROhzpsG9qWPeFzD3khVsPjgaj2Y958Mxg=;
 b=FuGDY13ueVLjI1SPFEUSQCL+ru6dFkhyh1AgGhA8xbFrGuPJLSKLDYW3yyuK/E2Jy71b9iGVs5AkhFgat56kBLuZaayjQ811jmH47o7+a/xdsPcn4dcRwh8J4dOMD4VTzWnO23Njcy044SXjRJ/mFiLEnvcDFsa+nrp8X/ihFgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13770.jpnprd01.prod.outlook.com (2603:1096:405:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 14:51:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 14:51:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v8 4/5] reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
Date: Thu, 12 Mar 2026 15:50:38 +0100
Message-ID: <6584aed8dc4fddb28c2184c83b92b4f3b419bc31.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13770:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eecc38b-ae46-4fb9-5829-08de8046daac
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VJXAOjgqU+cicwbvgPTeUfNu/kBFXrGBddIwo8VszdOljQVgrM2Qd2UcmcESIMjinqwsBOqjX5KfzZUsIWj80vIKL5k+KyjfsdjiT5lVBI0A6Qaj6pVjAlmf1IR1K+lp+9QAGDcpWDBmBWHkEO4CaUPtTSNwm5j7rklRzfmrgvpx11ICjliKQB9uJJ2CutVVLgcJMr+S2+bOkRE0iIXtZDsMr8IVYd/46senz0tn5o/ULnF/VOq9qYtdklr2ddMrkU1qaueoXSkASXyKmHbObMs9i48BXFHGQGl0prdEhHiqRR+J7ajB/AZF3N4KSS3S8GQmSQKZisWu+Xo1u2Yt8/rLUrfh1HRsn5d6mls2hBK6Afm4GUm//qt8eG66+i1McBrKNU4sgOPxfCQ4Izzt3iB7//7bMAO578as/7ZGWS7Qajp1FCR+4+upA1wTywGt3Lfegcfo2vaUoYdLDfSMqpYMa0NWx1hzv86Yr1L/ztRtzhFLMMzcrYgLB9/A62Akar4BDLnab4QhSwPbozb7o7la0+8J0pKZD9UxSzgnw55pkIAE8mM7I5NuC2U3CKesqXAe+xXWO9lF+qI20OikFpZW9qoHv+d4w2y253M7FVtX/zLJc3rDlk9LH7tR8y3lQxGpa9tCOvQflwSYG0qsNjgMFWdTfAorOXE3GTsnzAPLJfV/MH4O8t+HcyHw65OQ2Zd2NSpV4077m1QvHe7thSmMbUMuB50sE277m2b7P+BpSgPT1GHNU6GzgpDWzQJjhHBn2DEnF1qyxiU8au/O6bGvLBmBFdq50Y8nu/RDySM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AfHwc4nHQQpA7f45x8qoSv3+9aOAT3sAWJk66Cfhoes/BudUAH22inFjf1jt?=
 =?us-ascii?Q?diaXBQp6o8ALf/gKUdDR+limfpgc0fCH3d0BBmg8f/5LdkOHeY0y1D7gtp3Y?=
 =?us-ascii?Q?JhvWLC7g0AL4evKPHI2SQxKhWhsGHyiu6gl6DxdUYNmkOYsQA9TqU8ZJazuP?=
 =?us-ascii?Q?fl2zOSU+mDJBrsZvoPh4DB7N5fuZPRkkQ9nHiS9GIcwylCPv+lgYizdafnfU?=
 =?us-ascii?Q?UteHavFYVJy3R27Tbl89na/vR1qduuTv3XnH7DHbt6dQnfjhJx88WAX3lWCC?=
 =?us-ascii?Q?9R5ooIDApA2HByGY7jgMb4ephcMGi36KeQgCqc9u4fLmh3AJYP+AGSkwQzgM?=
 =?us-ascii?Q?HJPDycMQNGJO9LP9BuaFcnxoIYpdPQ00Lj9lE8DUfFAXv920KAoOgOXDAmGe?=
 =?us-ascii?Q?7oA1UnwRy4qB3UQiYJ38cNUsFupY2hZ1WWEoZXTEV778RtNAVyX3YJiBTV/c?=
 =?us-ascii?Q?2wW03mKK6QprPynHhkjCEuZ7BAZQH7+ySGX30L6dc4rUVXerPwPYfYjW5t+Y?=
 =?us-ascii?Q?wfjMWdWidMzGWZmbSYDGqr303BuqwQeMPmSTCiZzcZdrVOzH1EwVwjq+d+o2?=
 =?us-ascii?Q?r5k+oTdLdsUaRdOFxemUqtTBmWFFYPBvfvvAeeQ+xeuW0G61Qa1hxWvDp7yI?=
 =?us-ascii?Q?WmO8fKK/G8YRE7JjsPoHx/Gl7kj5yIhErDJh7GSU9TT9fc+vf78E4u1MpxpA?=
 =?us-ascii?Q?lVFV01xGPNLHoB/sHeA0kzBcXmaNGAUYFnMOcNVj+Xa9WyhoD1pdMCUkyvwS?=
 =?us-ascii?Q?07G5pCMsgbHwct0+5lJPy0AlU+jCyrv+GhJr6lTCTLWFA8+jbgxhPimxH3H2?=
 =?us-ascii?Q?aetoqaDB7G9RXzRfBqdxyCjNDpRxGaVP7e3n9BCdTRykrLQ6R3S3/2ju6p8O?=
 =?us-ascii?Q?kjFxfWXNyTG49HoXaYtSBU/TGi4kA0dJcRa2wTaOzsrPSmf1GUM+YWmJ3Q6m?=
 =?us-ascii?Q?UnjvFM68CMt11Qdj7q1thR66aVdKn4pLCRW1WRzJZGGzkVxeARxEpslWbLeq?=
 =?us-ascii?Q?JSUBLZ4XGMH+kteHiZ6hZaFqmRTcu5IhZWI0hVEsL+dwz7N2J2gmU5LaFvul?=
 =?us-ascii?Q?ME6K9jUUkd+LSSXcyy0obDihhtakrUQGnWup9G5769ZbVAcZrAxk9aJbRrIH?=
 =?us-ascii?Q?nxYAB9fNfqaDtqOf/oBacqOJbY3HFt2ioVKgwB//2zI8jXMsFVaSe0GWzrWD?=
 =?us-ascii?Q?9e9+5Klx0x8pdOshN7bC52/GJu84A5ocNJoz3xdbpd89J3TbouWmf+G6cQnI?=
 =?us-ascii?Q?wt75r3s1clP2EW7LXBhXmG72I+fXkugQ2C0hEFNHTFh5TfSsgi2dGOL+4Dvz?=
 =?us-ascii?Q?qE62GAmKBZ8JJ8LKPalIA5xNu3rS3zryKWbDaN7+fCa1J3Je5NDh1aIDlg+l?=
 =?us-ascii?Q?RGIZtA4k2uE/4RMQ+Ba9hXtAr2oUA1P0q8Vke0Ozkdp8sd0Lyie9sTU3tN7r?=
 =?us-ascii?Q?1PFV+Ju2ksx/FwfxZlwJ0Lf+JBZ2z7qRvKDLmrBd5j0D6u6HRvJA+j3HlcSW?=
 =?us-ascii?Q?nQNLIQhdperJRrLa39J+veZXbTevQp1LF5RXoVPytJP/xI6PglV4+qQgL7to?=
 =?us-ascii?Q?lEQBjfQS+jlFXX36vuMNqFFM+FcBj9tx9Shb+oJlPraQZF3vADa7lOklpzdL?=
 =?us-ascii?Q?RwpQvaimvmc7EMXG9PM8WJ9ExeyyMlml2o/t9YkD+gdn21TLouexTjI0wi4C?=
 =?us-ascii?Q?1nPIj5+t3xRQa2SEfy+gcFJxTRBBsX+2IUDPVpVWRqf77qqNRnlILu7OsF3I?=
 =?us-ascii?Q?jAnkmo3sXZCWMvpdt1aHhvC7iDotCVTOBB4vj6N3+JGmMgIK7BUE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eecc38b-ae46-4fb9-5829-08de8046daac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:51:34.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvtNgVgdNlZ3MG4hRyqhulvCJKEM7OsWOjYcdzgdaBbnqvRpubqEGP0szTNhbBOUQJ88SdW0sOX6nCNmKOdVaBmnJfR0QneS/dKBC0exhCoeNAtGEdkgYtOR111OktUM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13770
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29289-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linaro.org,linuxfoundation.org,solid-run.com,arndb.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1F174273A73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver was disabling the USB2 PHY clock immediately after register
initialization in probe() and after each reset operation. This left the
PHY unclocked even though it must remain active for USB functionality.

The behavior appeared to work only when another driver
(e.g., USB controller) had already enabled the clock, making operation
unreliable and hardware-dependent. In configurations where this driver
is the sole clock user, USB functionality would fail.

Fix this by:
- Enabling the clock once in probe() via pm_runtime_resume_and_get()
- Removing all pm_runtime_put() calls from assert/deassert/status
- Registering a devm cleanup action to release the clock at removal
- Removed rzv2h_usbphy_assert_helper() and its call in
  rzv2h_usb2phy_reset_probe()

This ensures the PHY clock remains enabled for the entire device lifetime,
preventing instability and aligning with hardware requirements.

Cc: stable@vger.kernel.org
Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v7->v8:
 - No changes

v6->v7:
 - No changes

v5->v6:
 - No changes

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - Added missing Cc: stable@vger.kernel.org
 - Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().

v1->v2:
 - Improve commit body and commit msg
 - Added Fixes tag
 - Dropped unnecessary rzv2h_usbphy_assert_helper() functio

 drivers/reset/reset-rzv2h-usb2phy.c | 64 ++++++++---------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index ae643575b067..5bdd39274612 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -49,9 +49,10 @@ static inline struct rzv2h_usb2phy_reset_priv
 	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
 }
 
-/* This function must be called only after pm_runtime_resume_and_get() has been called */
-static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
+static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
 {
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
 	scoped_guard(spinlock, &priv->lock) {
@@ -60,24 +61,6 @@ static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
 	}
 
 	usleep_range(11, 20);
-}
-
-static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
-				     unsigned long id)
-{
-	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
 
 	return 0;
 }
@@ -87,14 +70,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
 
 	scoped_guard(spinlock, &priv->lock) {
 		writel(data->reset_deassert_val, priv->base + data->reset_reg);
@@ -102,8 +77,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 		writel(data->reset_release_val, priv->base + data->reset_reg);
 	}
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -111,20 +84,10 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
 	u32 reg;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
 	reg = readl(priv->base + priv->data->reset_reg);
 
-	pm_runtime_put(dev);
-
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
 
@@ -141,6 +104,11 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
+{
+	pm_runtime_put(data);
+}
+
 static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 {
 	const struct rzv2h_usb2phy_reset_of_data *data;
@@ -175,14 +143,14 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
 
+	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
+					 dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register cleanup action\n");
+
 	for (unsigned int i = 0; i < data->init_val_count; i++)
 		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
 
-	/* keep usb2phy in asserted state */
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
-
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
 	priv->rcdev.nr_resets = 1;
@@ -190,7 +158,11 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	priv->rcdev.of_node = dev->of_node;
 	priv->rcdev.dev = dev;
 
-	return devm_reset_controller_register(dev, &priv->rcdev);
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		return dev_err_probe(dev, error, "could not register reset controller\n");
+
+	return 0;
 }
 
 /*
-- 
2.43.0



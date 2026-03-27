Return-Path: <linux-renesas-soc+bounces-30449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHkIH5vIxmniOgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30449-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:12:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D8C348DE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13E0E306B3AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4E235A390;
	Fri, 27 Mar 2026 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uEzI99Kk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5233D6E3;
	Fri, 27 Mar 2026 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635011; cv=fail; b=sFaQ1YHLXPfzYupbc7J8Ko1BTaYj076qjDY5Xu9Z5n4P406G5XmznKXp/Ib5GR82TS6l4Q3FC1L4LqZOpSIR5ePtIRgnEbodH1Tr2mN7YpCtsRkI18IeX9Hb/Z1RfcgEab9X22aheFSEh5iDPcAwLdxjMk033SyjJY0i0AtfL80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635011; c=relaxed/simple;
	bh=vNbndE+aZJV3IXUIStfB3bS+Ecdi3wBG0qw2spACxhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PEjGUB6oORlPCsf+UeaIIDvCzocKo++xNWnxPijJxePoVRRd2skhs+gt2yAQaw60i/nicGryqxaH2qnIA6P9663SGalOtOcGCTJ4tZPn8GfzVD3nPZ1aDXvE0je59cHOajhVD2glimz2TudaPv4qaIKtT0FhUF3jYGv2mvPNd6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uEzI99Kk; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hl3sDHOOKn7zlM77ii+qCVYUo9lNZrC08TE7gEjzz6cCgtQrEH13Uw89BWERJNkaiIVheQHUmqbLZRivnDc+kCeomDMF5skIAksj17L6q84vOOl4ebUzxB6NIxg/yjEtyrDPOh4X2sUEDV9hHdW14JkJkvnQle5kepAkPLmqXB0o+L9FjK19svPdviACjxBsKW006ng9GfpS/OO6Gnqynk64F7rE149NT7m+xnqpoTlH0a8fZJzx3vFUNGbnc9cYfnqWZg1pyqQ0Teusy+5xFnCjhQ+q3dshQ1XFwxphyxhPQ6N70xsCfUh6wypFEhBIt6sCnX2WGyYcYEZNu8PR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Sc1xVZ0xkSQd7oYxrg8pcvFKoBrRVtE49OQXEGFRNg=;
 b=vceL5hGFJBPLEB0yYB9elyPgsSblUXwdDm87UfeOYFDuXgfPpxhvtPLoVdyQRrKsyuNzsU8RCHHj69DFUtRfMMGfMcurOEoBfi2pLJZ4eHTGP8dmKz0P36+f9JYTDujnSgOiW9udzlEh9Y0UfDHOP2NopOwZNYiSQLCUIGV6vWoNnN13gCXG6PIfaSI7iGZ7LOKd7J2+7fn8RCiXJEOYleDLDH4X8WQkaRWjUTvt9YN2T3TjheONxsxti3k7QsDEB1PzFv8TFymVFjz8gFkMuKes5+Xv9RWuIq2qjdc7aBpcxPL88PcG9HnhdL1oBUSyYFj/VQvNXMdX4zjPqAJ4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Sc1xVZ0xkSQd7oYxrg8pcvFKoBrRVtE49OQXEGFRNg=;
 b=uEzI99KkO17C6nh19nl5mrniFDF8wiT1JsxX+gU3r2Iquk14mAKisYdLFSyRxaNvKmQlOskjXY2DsTIjACxsaCKbQzGcfNyWEDuWGXA/X0eGDHm+EfwjF/shHiFyljzoBKKXOpVwfD7MEJhoIFI9ze3Cc+of7/sJr16WeKzAI4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSRPR01MB11662.jpnprd01.prod.outlook.com (2603:1096:604:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:10:06 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 18:10:06 +0000
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v9 4/6] reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
Date: Fri, 27 Mar 2026 19:08:51 +0100
Message-ID: <7b7a2f95169742d800828b8fd8575d4ff5614268.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To TYWPR01MB11940.jpnprd01.prod.outlook.com
 (2603:1096:400:3fd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OSRPR01MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d355c4-066f-485a-c6b8-08de8c2c12e0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OC45q9JeX1tDF5KN6Gm60Q3+XtoHZDKRnmUlJAE7EVu77nUBcfmjtkUZSaSA8vYecPdNAJV5IqW4c6fHfwncufnOLM8DVpltT+gXxh5iFutFZ5aQhkkFnd/rw4Lj8/86bAYPx1CHTggKo5gOmPM7YkBkbDUkYO7tK541OpvQcqWMTH8I1ZBvEiZDgj9ejuw89282bbGwh0+d6fwDyGckk6iooJA6fC4hunkqV0IAe9VR7wmemHvIisbEAlqHbagTgCg9888oIPDXMWrdpp4mP5cQt3BDJsz21Fvqhmxe1z1vkDI9eeHEC3AlSH6o/sZ8y8K1bEi8LGc1q7FoBG/rjEzKh0X6OPVTpi/1O2Xoshee1ljdYzd5BzzWUjVEulhbjgwy5SARU/VANqMbAyfcVoCYuWY1bwJvZ0Sk5FAMjQJJf8kWj+5QIGNosX4CXSujucvWRp3KqgoBjInnjbGFkByW3kU41lQWq3L6eODJTjbneRt4kE8ZsmFLV40dWb0GrLJXoohLyVEkgDKS0nBEuV9GJS87gmgmFDikXpsJtrwPboi3kGPDcZJ1pcq1LoHyROaIGjPO6n+bnjKJdDBH5E+oEbx0A4d5i0m7UCigu92xrDRF0eI8+1mVqF/V1he3sTrREdaww0LpvFCRKTw3HSmF/J4soamfh2G4NuYMT/LkIOVQW4sKiMtM7wVkti44i66XHSGYQFbFcecpWDTkcRcs5+yDfCVdusG9FNCO9q0hMq+TCeMU/RiR9VmWrqUPIwnIQlkhL4niyCs/EunhhcugtaeCFX4Sx/xDUEb3/7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hgStZVTsbq11pXSAUXIsxKXdcqG7whiXz6/fynhdzi4pMIAZTnAT5m90c3yN?=
 =?us-ascii?Q?sAZODqYl7El/VoOZslABdh0iPs0jHpvCbsusEQZFHGX4t9JsH73rJDcGnq3X?=
 =?us-ascii?Q?J2VCNMLhTec2z0THaE2b/ns3ApSecdUtL3Lu2/Ah+mxHd+14tYIr4LkN6kGd?=
 =?us-ascii?Q?UG9va3B6C6InXcB4po1wl4pDAcfsubga/T/kM8yKbXcagD4v1S9Rp4/iiWIU?=
 =?us-ascii?Q?iKAUMrscZstB0H2qlwHM/scztN5uqmSeMhPr9xlxf4ZB1Tmi21w0yDw3EJCl?=
 =?us-ascii?Q?bATdvnubBMRsfmyhtmKUwnoWcDWOqbs3GrR8MTo9XmVt7JtJJnzuLWZlngzS?=
 =?us-ascii?Q?ffH+HNIAiRS3sR3xMCv+uGWEo0a4obmc3Hx8W5XJONtIw3vGvrrEkk7pkmjb?=
 =?us-ascii?Q?FKrWfEQskG3rcKt9s1y2zvTzYtgYt9/RcMd6gFVD56pje9KH2yHray/0AOoG?=
 =?us-ascii?Q?op2ILnJnMGrRQCDyPDt00BmI8YlFKrw60ONvyJ7GWYW6Q3QoF45u/2DIRPPW?=
 =?us-ascii?Q?zv6COksHuoIYjuTp8IjBpU78rT0TQ2IyUk1+FN6JTMq5WkUxAXHaD1lxg5nV?=
 =?us-ascii?Q?Se2BnE0bwhTFSaMDHTLWM0GPYErcNy/Y0mxpysd8xljtzr8AJPJZxC84r/uk?=
 =?us-ascii?Q?O4MqDz1PzFte9h3/8GZOfw15NpUuYUwS9NTLHpO6ffC1zsPj0JlVMA4DMVDd?=
 =?us-ascii?Q?OMSbpP1NreXM4g4Pl0zz8OZ+0NSdNn0IzYrqd/s8V7X032u1snnrzTzn5FqJ?=
 =?us-ascii?Q?tBi0oVAilNDJeaBCSLn/s/viLXEwyozxLWaMw7syhg4oQL+wpsapEOI93B/I?=
 =?us-ascii?Q?1mgXTs5TQRRRVvhfjx7IvAH3KRId3W3+G71wonMaMjk5G+cYaK0V6iVEOsqb?=
 =?us-ascii?Q?jBcUpCDdZ66kCGPFU+njCI4KQ+HR1VvZFi8Orc77/ow67Le2pb39o7HL7h3T?=
 =?us-ascii?Q?Wl30Z90O+5kioVrcqM9NrKI3Ij9ZzzLNKibOAQrILWLMNjEs/twOkDehgtRb?=
 =?us-ascii?Q?EjhJIrhTiak5j/83qLjbzJ0aDZgX5GE37aHOYCW8yZ5f/iIzL7lIdkFmYuvY?=
 =?us-ascii?Q?X+SztCTclw9fzBLTbn+KIJvBq8xzCV5pQB9wPOAwEPI8Lwx1/WTDUNItj/cd?=
 =?us-ascii?Q?JWGDSrzzvK3ruBdsV+SbU9Ax0grPOBELrG1rFxWXc6ZCoM4fITd2bYOUFnQ2?=
 =?us-ascii?Q?zKAW6EKifTC8BAgAPt7U0w2fYW5BiupAU8SrneGiO8t65j6eQSIF/vwHs4fi?=
 =?us-ascii?Q?RtVxYg/wJQ7cB1aYJI/OozTSvLaoZdd2WzPVRkjCPTB7Kq8u2+tW+c/iqvow?=
 =?us-ascii?Q?wuX5ARb66ydcXazSCfbcBGrYhopRbg+OQa9lTvxh1OJj1PBqs7kk7rjIsJz5?=
 =?us-ascii?Q?IHTNUoV2DPtLRqnistWzBh2DGCmqJF17ljLgk7SGR0opZcLb3K4n/RrT8RS0?=
 =?us-ascii?Q?GAA+vV9BkebipIXgJ4rJeMncQyDjdynR5+iCbsLwls5y5XchpXIR1y/N5Ok0?=
 =?us-ascii?Q?VmSiy8aRQw/YSCc9EkMFGuf3qy4H1qjUw+MKxAA74MBlV72opFybhvtAPPSA?=
 =?us-ascii?Q?EhOoaHiLP9U9QeASuYmnsJ9li7MGP7CZchLg1oROMcneDVsD63ZJ0JgwFaF8?=
 =?us-ascii?Q?UTkGj6XrMna74vuhObBf2B+DkZ2iW72ezN78kSvAf5Tri6jn8itEAarMIWv2?=
 =?us-ascii?Q?Ko1CoV/Upinpk2OZ+nnwCZB24u/Vvx1ahAqvxnGHqFPrCg8VJXhOjoDuVrIc?=
 =?us-ascii?Q?4jWnXLCgNVN/oD3uCKqCAeAdvS5gmu73txu5fbhzI7mbjOlSrQJn?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d355c4-066f-485a-c6b8-08de8c2c12e0
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11940.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:10:06.0267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvkC2GcS5k09Q5zdguPlbPO14iCRUFb2oWDAcrskCxJJRIltrdsPWOLbm+Bzjq7g8JeCDzCT3hFBbfkrDuV9X197ttM6l2l8gabr/76Sdhs/BBuwIoEo70k04sGwqWQI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11662
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30449-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linuxfoundation.org,solid-run.com,linaro.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: B3D8C348DE3
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

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Cc: stable@vger.kernel.org
Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v8->v9:
 - Collected PZabel tag.

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



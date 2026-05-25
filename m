Return-Path: <linux-renesas-soc+bounces-33088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFOfOg8uFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:10:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 669965C9B3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E719A302D198
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BE337D11B;
	Mon, 25 May 2026 11:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P6Dr/e42"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB625B085;
	Mon, 25 May 2026 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707235; cv=fail; b=av+MAbxi7BC0uqn6rSX3H6Lz3socN60lO0Wc4t50GmnXPEOwYdipOhy/tOimtp7EoNmttV/RlsvnaeFO+mJ28Ii9PCQhEWsKx9I8VVmAt7UMaKIX6yQ1bTH8Ij/004J+c3dOT0eGtr7qw5ZDmuEat0kCYGmRJY0lGsym+pLtgpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707235; c=relaxed/simple;
	bh=XApYwC1BLwOshDuBTtVvtPtSaH0aoG86Cw0kxZSaOdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rKoppGAgXLJJBea6RbxWys5+EhDA3oxTDfv9QLEB2wjeeXsUQBskY6d3RZs6HsnVV9gCAWUyAllRXpCzVmdDcxYIw7je+pDpBeTPgF+5hb+ua+TBENLD7STIjmEE4stvktJ3h6nuHbEEOHfhGg681aiS40PnSNXfMetPmFFai+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=P6Dr/e42; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUBivuLyWy9fKKNK3DufNPRh+AcdyEDivm5bXbLA4O3WbtUkEhotoFHexc7enzVo1O+NLouhQPwNdxnInlPU+MdklT8/BD/EsmPeJV/TXrqbH85ZHHHs5T/XkWATbNo2vE8xgTKCo6pwC779DqgZ6ARSvClpgDPvIHdgddoGLXWs3FjKJf4E76m3YpHyZOw4acLgEQaqTUyxB07ekeu9bgry+RgJE2eSOTfWiAKntcDBRuTe8u6/SDtEdtcWTgjtus6xG6ZYAHk6NXPfJapY8/hwlWOC0KSbNVb/90K6w199PeXCrRjE/R8W51OkhxYcR5GJE4m8jCrbX9LGakVsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivHJdvlmpaPA8hn/cCkhwsipdTaCwEmTAJAZ/gKkBeg=;
 b=QPuJaBvgIu8/hnSIADnctd3c5Rvra/piIMqjys4M86qvE6PmcoRN7VQ+gd1LvhRKp4Sjy3H1zCFTh7VfmcnTewttpM8Zs1R3ACwblpx1t1qRqLe9ME95lqflA9tc/plM2MqK830YFKsD+4n7W/I7AZufXV77e+aMUhJuQOCseRY9Y+kQ53rwzL+dpZSKWIQHF7ByL+JxOV/K8c7KNY2rj4qJHx6oG02if2rqOjQu/hBK6ej5L17JghQffwhjAxQ3puV0H9QDLlvuJAfMMzR2k0CwvPmMlftV87zDSHqwfWJOdbwooAyhiRhU0kHsAO07sDKE7/cwSLpv8c+qpa49lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivHJdvlmpaPA8hn/cCkhwsipdTaCwEmTAJAZ/gKkBeg=;
 b=P6Dr/e42G+pAyerUA/1uqY0UWc4SeD4LRL6WIT14fZAcjFtZ4YsqZk9kvP3c7Yw5e4gxImnwhHQFR+n7v7rV7DYXWgTKgGtkElNtjnAvd/nJMK+QZQDvesY67PvMEOrHJ2rIi5nH5JUbWEO62NWMpkUM4JT19I0G1807iDFgIaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:10 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:07:10 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: bmasney@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 2/8] clk: renesas: r9a09g047: Add audio clock and reset support
Date: Mon, 25 May 2026 11:05:57 +0000
Message-Id: <20260525110603.4018170-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::11) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 2049d4de-4e35-450b-cd2b-08deba4dc483
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|5023799004|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E6CjavkVYXc8gH6mOx9lFgHMvhTnmsxTHDCFid4QTEdHQDA0G4lHOC0MjKqWhq8x0gF/dnAW7lv+Zdi99p/7ScUe5j2UCjvgOK0OQeVZMcXWP/Iit8Uz7ohvEti8QG8X75ltxFpXWckLXnBl6EWJuS4R6M+CFbQZfPG6+9TOlsL6MVM2h9HR6A6Nl4c9g0qpy9Xa90PRKBX1UyN1ClIgUFQ7k9p8ozWRjuiuFi+NdCzQvwVV+BcHZAeFfcwKwnbfa99rLcvC+KSi9yOkh1yCMQnw5z/3FparMfdUBGbnNZ3L5Zfm7mN5Fzqf9EbN4F2wtjr5NaTUGFwVznnllRRRFBXqAW21vXN7ib3imKtBb0iAXoID7Enj7Ssy8sOIclbLQ1978xe8NFh6hNJZeTlrx8KwL82oBN1b/nqClfyvC6/kYT1dg3axcHBUkaj1ZFn72RMAgChAnqbgtAWMiPa/alxWO79kG1WDzxK346UyNhQgipuvUzDtYlTuVxHTh/0vrjIdt37jLzR5pPft+lqHyezeNk1t6DlkzusBLBOcTyJer/c0Dtx4wRuwZzvQqs+pjTo1xl6BCIo4XvsWvmJMgQIxjex3MBkDVH7VpCYX0YfGsB3mJMW7FCNgYANSI4rF8qhQtP3WPL19wNafPQw5QQg59Y+kYM4YHbIwXpgiBwgG/1luJ2M4cGgzuMf9PHIgGqmCjpbk0A+LWC1FaE642VAHE3M/lZCAfPLYJ/4Dhucsi+y4JtUeqnyEnJJYrr7T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(5023799004)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sS8XAsX3H4GXM8Q91ppwYOIqrirORJ8P/PzRHiN3ymYUvwQEs4kmuEh77bwg?=
 =?us-ascii?Q?Sboz7rZwVHGS6zAxqTbtuAp1CNyCguh2OzJjuKEdSaVNVi3AHbi9yFO6gBaN?=
 =?us-ascii?Q?UQ9/ZWY/lq95ph89LTve2oFLJRNpUovlOLmtCXIR5u+PfidMHC7PkFJrPFtd?=
 =?us-ascii?Q?N3ctPNR03Wr8kCH7ZZVEZ6xiqnQ5KJIxfpNucALsdDj6NVdZTD6Ni6JPfcsf?=
 =?us-ascii?Q?5qt5ut9cOWUsrh9Cls/NC6lVrX7HBCypMKE73VJHLJMvcMrTMo0V8GJbz92y?=
 =?us-ascii?Q?q8KiqT6/OuEsihRGC/wK7+ddz393m7rd0tddR2+TeTv235KVasqQP4DUnZmn?=
 =?us-ascii?Q?P5mD+3Sz3mHcWAqCCS9J5tS/r6D20FOgiAycXiMZS44EAbP4azvaxcdS0PWa?=
 =?us-ascii?Q?Lf7xBlEIRehPyd1dTfQnHGbAT6aPFVAYHWmHCSitJhZWrzHD8gzEGeeSarc0?=
 =?us-ascii?Q?7D+/Jlj0WkVyk6bks+OzX/iHNx5C8JB3qOXCm9ftPK4WAWM3/6vPWNIoov+M?=
 =?us-ascii?Q?zr9raASxpZD08rcACwvfnplpzIajPHSlTZVhquqVB4F56Xu0eKCfzid5GPpx?=
 =?us-ascii?Q?RBAXNhO/YEOEKtfeVCYmZ7wFL1vVomhKNdvYUgblv7HcYddjsJlq/lQ3yuid?=
 =?us-ascii?Q?3Rpit0fRZxDCXVWPJN2vHu7d2I0tI6L+16GNTSQ4rZY6oANZXnsyqhSBti9T?=
 =?us-ascii?Q?rTzNqUt4naloa0PM1yTJvjMW+iwnYLs+yH9oWiYI5IV8cclyo1oFxvJJvoEx?=
 =?us-ascii?Q?JRNkWP3TjA9mxoSjqkbLQn8KDAUZ6QQr0goW7WoT+XN4adyIExmPQjxeP1xg?=
 =?us-ascii?Q?Egt4ogjjOa4AtWTo3uZH8biT0hqhsTH7Xm7YLAWQ8QUa+aUQJGfMMo+UiUzE?=
 =?us-ascii?Q?XPe7lYaYA80IFN9mSsGVkZQ8jqNEQ0vyoDt+U6hUQS7LEjaw7B5M21P/W4nL?=
 =?us-ascii?Q?QAfVKlqgB0PPWrXuauW/0jXOQNAko0RmaOKv2Ebmd0hy62C0HPpqRBP7CsoT?=
 =?us-ascii?Q?sZJPB4eBQqSWEMab/jlaRzGIOJDhrJ8huH9uCVBR7oL0Kkvz8xN3OGUgRHn5?=
 =?us-ascii?Q?sc5vQLtaloCYfz9zDZ+HbwSFEzlEigrBxiwQ/Ipq97QycN91zNqAFMOGMG4H?=
 =?us-ascii?Q?bu0H40kXl7SLglstXq6aFfqXKNB5LSi4U8DLV4/YjklBsvXZ8UJ1j/PN69CD?=
 =?us-ascii?Q?rKTvcDQTfKYfTq+HHqzeXjPm8Xg1vYyxlsoJj1faDr2+y1wrAfpUSeJC4ijz?=
 =?us-ascii?Q?W2b+zQzMRUwjm2IB/CK3o2axqs0OyZGVjeSYFXSiz4r9NQPSJL0y0piqbjek?=
 =?us-ascii?Q?84Tr+ZiWk+hKqT/SVITYUz/O/fZurQfjGxHxX53M6hmAvTrNy4LCnb1CEtUX?=
 =?us-ascii?Q?tQoURspEm8Ef6lVI51lXiS5ElOGSySg+BZjRf+OIGouPhX4zQzNbGpXnVHC3?=
 =?us-ascii?Q?88CzBDdkaClKbPZCqicj2FZtYSjYoLYGODftnnwv/pDCotL7XR8enMmmBKmj?=
 =?us-ascii?Q?BwIKbyxETrwDzBBKlKHrqLF8Uxq+LIiIu+NY99brv2NLikUcmtPhyxMXUa8b?=
 =?us-ascii?Q?P7EwSOfxKNqg4a4JVwPdI6dv68Gz0NUnaBIhV0/jz7M02p/VBRBl4oXR4lXl?=
 =?us-ascii?Q?nNyNVMVIGyCE+mrhAxNy9LQxxCmtbJZUtIRO8269hp5GWkIqDc2O0cw3li1t?=
 =?us-ascii?Q?Xerzelpa7RrgCymNzvYTuEzhylBC2Q2gT8MnhYju00ugt8drcIaYjlsFpUs5?=
 =?us-ascii?Q?kabxp2szbLBnTqL7MWBPAbgaaWv9mzQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2049d4de-4e35-450b-cd2b-08deba4dc483
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:07:10.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAl/ktYoXiWXIgDZhy6uzs7ySOc6V9nX3HKbjQs1e68u+HrS2DsB+vtuL5IEMhjDBWD61LIpIl7I3e90DpzHkQJs1/IdEEOTdJxV4P0j0pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33088-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[redhat.com,bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 669965C9B3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock and reset entries for audio-related modules on the RZ/G3E SoC.

Target modules are:
 - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
 - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
   CTU/MIX ch0-ch1
 - DMACpp (Audio DMA Controller)
 - ADG (Audio Clock Generator) with divider input clocks and audio
   master clock outputs

The ADG SSI clock outputs (adg_ssi[0-9]_clk) are parented on
CLK_PLLCLN_DIV8 as a deliberate simplification: the ADG dynamically
muxes each output between adg_0_clk_195m and audio_clk[a,b,c] at
runtime via ADG_AUDIO_CLK_SEL{0,1,2}, owned by the rsnd-adg driver.

While at it, reorder plldty_div16 to group it with the other plldty
fixed dividers.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v4:
 - Drop CLK_AUDIO_CLKA and its DEF_INPUT("audio_clka") entry, and
   reparent adg_0_audio_clka on CLK_AUDIO_EXTAL, since AUDIO_CLKA is
   provided by the existing AUDIO_EXTAL pin (Geert Uytterhoeven).
 - Drop the internal core clocks Geert flagged as unused:
   pllcm33_div4_ddiv2, pllcm33_div4_ddiv2_div2, pllcln_div32,
   plldty_div2, plldty_div4 and cdiv5_mainosc. pllcln_div4 is kept,
   as scu_0_clkx2 is parented on it.
 - Rename the audio module clocks as suggested by Geert: ssif_clk ->
   ssif_0_clk, scu_clk -> scu_0_clk, scu_clkx2 -> scu_0_clkx2,
   admac_clk -> dmacpp_0_clk, adg_clks1 -> adg_0_clks1, adg_clk_200m
   -> adg_0_clk_195m, adg_audio_clk{a,b,c} -> adg_0_audio_clk{a,b,c},
   ssif_supply_clk -> ssiu_supply_clk. Update the target-module list
   in the commit message (ADMAC -> DMACpp) to match.
 - Rename the audio reset entries as suggested by Geert: SCU_RESET_SRU
   -> SCU_0_RESET_SRU, ADMAC_ARESETN -> DMACpp_0_ARST,
   ADG_RST_RESET_ADG -> ADG_0_RST_RESET_ADG.
 - The adg_ssi[0-9]_clk parent is left unchanged as CLK_PLLCLN_DIV8.
   Geert questioned whether this is correct, since these clocks are
   ADG-generated. The parent is not changed; instead the commit
   message now documents that the ADG muxes each output between
   adg_0_clk_195m and audio_clk[a,b,c] at runtime via
   ADG_AUDIO_CLK_SEL{0,1,2}, which no static parent can describe.

v3: No changes
v2: No changes

 drivers/clk/renesas/r9a09g047-cpg.c | 112 +++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 94158b6834e6..c410a5d6a955 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -23,6 +23,8 @@ enum clk_ids {
 	CLK_AUDIO_EXTAL,
 	CLK_RTXIN,
 	CLK_QEXTAL,
+	CLK_AUDIO_CLKB,
+	CLK_AUDIO_CLKC,
 
 	/* PLL Clocks */
 	CLK_PLLCM33,
@@ -44,6 +46,7 @@ enum clk_ids {
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
 	CLK_PLLCLN_DIV2,
+	CLK_PLLCLN_DIV4,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
 	CLK_PLLCLN_DIV20,
@@ -159,6 +162,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
 	DEF_INPUT("rtxin", CLK_RTXIN),
 	DEF_INPUT("qextal", CLK_QEXTAL),
+	DEF_INPUT("audio_clkb", CLK_AUDIO_CLKB),
+	DEF_INPUT("audio_clkc", CLK_AUDIO_CLKC),
 
 	/* PLL Clocks */
 	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
@@ -183,6 +188,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
 		  dtable_2_16),
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
+	DEF_FIXED(".pllcln_div4", CLK_PLLCLN_DIV4, CLK_PLLCLN, 1, 4),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
 	DEF_FIXED(".pllcln_div20", CLK_PLLCLN_DIV20, CLK_PLLCLN, 1, 20),
@@ -194,6 +200,7 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
 	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
+	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 
 	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
 	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
@@ -205,7 +212,6 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
-	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 	DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
 
@@ -532,6 +538,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
 						BUS_MSTOP(2, BIT(15))),
+	DEF_MOD("ssif_0_clk",			CLK_PLLCLN_DIV8, 15, 5, 7, 21,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("scu_0_clk",			CLK_PLLCLN_DIV8, 15, 6, 7, 22,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("scu_0_clkx2",			CLK_PLLCLN_DIV4, 15, 7, 7, 23,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("dmacpp_0_clk",			CLK_PLLCLN_DIV8, 15, 8, 7, 24,
+						BUS_MSTOP(2, BIT(5))),
+	DEF_MOD("adg_0_clks1",			CLK_PLLCLN_DIV8, 15, 9, 7, 25,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_0_clk_195m",		CLK_PLLCLN_DIV8, 15, 10, 7, 26,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_0_audio_clka",		CLK_AUDIO_EXTAL, 15, 11, 7, 27,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_0_audio_clkb",		CLK_AUDIO_CLKB, 15, 12, 7, 28,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_0_audio_clkc",		CLK_AUDIO_CLKC, 15, 13, 7, 29,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi0_clk",			CLK_PLLCLN_DIV8, 22, 0, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi1_clk",			CLK_PLLCLN_DIV8, 22, 1, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi2_clk",			CLK_PLLCLN_DIV8, 22, 2, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi3_clk",			CLK_PLLCLN_DIV8, 22, 3, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi4_clk",			CLK_PLLCLN_DIV8, 22, 4, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi5_clk",			CLK_PLLCLN_DIV8, 22, 5, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi6_clk",			CLK_PLLCLN_DIV8, 22, 6, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi7_clk",			CLK_PLLCLN_DIV8, 22, 7, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi8_clk",			CLK_PLLCLN_DIV8, 22, 8, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi9_clk",			CLK_PLLCLN_DIV8, 22, 9, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("dvc0_clk",			CLK_PLLCLN_DIV8, 23, 0, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("dvc1_clk",			CLK_PLLCLN_DIV8, 23, 1, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("ctu0_mix0_clk",		CLK_PLLCLN_DIV8, 23, 2, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("ctu1_mix1_clk",		CLK_PLLCLN_DIV8, 23, 3, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src0_clk",			CLK_PLLCLN_DIV8, 23, 4, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src1_clk",			CLK_PLLCLN_DIV8, 23, 5, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src2_clk",			CLK_PLLCLN_DIV8, 23, 6, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src3_clk",			CLK_PLLCLN_DIV8, 23, 7, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src4_clk",			CLK_PLLCLN_DIV8, 23, 8, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src5_clk",			CLK_PLLCLN_DIV8, 23, 9, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src6_clk",			CLK_PLLCLN_DIV8, 23, 10, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src7_clk",			CLK_PLLCLN_DIV8, 23, 11, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src8_clk",			CLK_PLLCLN_DIV8, 23, 12, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src9_clk",			CLK_PLLCLN_DIV8, 23, 13, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("scu_supply_clk",		CLK_PLLCLN_DIV8, 23, 14, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("ssiu_supply_clk",		CLK_PLLCLN_DIV8, 24, 0, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi0_clk",			CLK_PLLCLN_DIV8, 24, 1, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi1_clk",			CLK_PLLCLN_DIV8, 24, 2, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi2_clk",			CLK_PLLCLN_DIV8, 24, 3, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi3_clk",			CLK_PLLCLN_DIV8, 24, 4, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi4_clk",			CLK_PLLCLN_DIV8, 24, 5, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi5_clk",			CLK_PLLCLN_DIV8, 24, 6, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi6_clk",			CLK_PLLCLN_DIV8, 24, 7, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi7_clk",			CLK_PLLCLN_DIV8, 24, 8, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi8_clk",			CLK_PLLCLN_DIV8, 24, 9, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi9_clk",			CLK_PLLCLN_DIV8, 24, 10, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
 	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("lcdc_1_clk_a",			CLK_PLLDTY_ACPU_DIV2, 26, 8, 10, 30,
@@ -621,6 +717,20 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
+	DEF_RST(14, 1, 6, 18),		/* SSIF_0_ASYNC_RESET_SSI */
+	DEF_RST(14, 2, 6, 19),		/* SSIF_0_SYNC_RESET_SSI0 */
+	DEF_RST(14, 3, 6, 20),		/* SSIF_0_SYNC_RESET_SSI1 */
+	DEF_RST(14, 4, 6, 21),		/* SSIF_0_SYNC_RESET_SSI2 */
+	DEF_RST(14, 5, 6, 22),		/* SSIF_0_SYNC_RESET_SSI3 */
+	DEF_RST(14, 6, 6, 23),		/* SSIF_0_SYNC_RESET_SSI4 */
+	DEF_RST(14, 7, 6, 24),		/* SSIF_0_SYNC_RESET_SSI5 */
+	DEF_RST(14, 8, 6, 25),		/* SSIF_0_SYNC_RESET_SSI6 */
+	DEF_RST(14, 9, 6, 26),		/* SSIF_0_SYNC_RESET_SSI7 */
+	DEF_RST(14, 10, 6, 27),		/* SSIF_0_SYNC_RESET_SSI8 */
+	DEF_RST(14, 11, 6, 28),		/* SSIF_0_SYNC_RESET_SSI9 */
+	DEF_RST(14, 12, 6, 29),		/* SCU_0_RESET_SRU */
+	DEF_RST(14, 13, 6, 30),		/* DMACpp_0_ARST */
+	DEF_RST(14, 14, 6, 31),		/* ADG_0_RST_RESET_ADG */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
 	DEF_RST(17, 14, 8, 15),		/* LCDC_1_RESET_N */
 };
-- 
2.25.1



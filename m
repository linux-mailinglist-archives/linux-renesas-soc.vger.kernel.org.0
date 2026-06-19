Return-Path: <linux-renesas-soc+bounces-34233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ceOYNIMBNWqulwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:44:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E36A4AF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:44:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=cnMbMNGz;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9407E303E20E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 08:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F0536073E;
	Fri, 19 Jun 2026 08:40:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E5835EDA4;
	Fri, 19 Jun 2026 08:40:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858453; cv=fail; b=WzxZmnRKhIbENiSrLeNDBJnm01KMQrNUAKqacwIrxSJAmOXzIy28zwLf9gheyOwXa6JUxACm7WrND9eheLY2nld9X6g0P2OWzjkhWUsDIgjbRDF5Ze7ly+nJMnokx29k7ExbovxgnnU+btm9qChhM9caBmffgsIw1yTLlL22C64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858453; c=relaxed/simple;
	bh=G7nwhYCpWXDproXoVYqKiwf1JM1cnBZ27KYb7zykaWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UkQLrCiBYy1a0Po4xpjuL7e/N1xqgOkOvKllR0eODbAfoctPx84r70kP1iOV32OSQcFqpyIvHJYJEmPoH0JlL5kEa5xElJ4lKlcYkOfvFhH6QErL+oreXEo6zmlR5Jk2+ACmyPihwS5NfysPTGHUa0InjOKZGPJYwSxJIm1cius=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cnMbMNGz; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru2KmrHSj5P3glQtAa96ULKCgmbwcil0px0zCCAWgK4CYuMfLXB0P794cOYxOJAkXZY0FEzu2PeBgO6vS3zyVtnLMqqtjofr5VIvjKuGameU0D6NU/+L2QmBpfI9tHG9nw2YGpq6MdFh82N/4YcfwWhq6z4xgU2INXpoaCTdyWk8a2/METM2WkWZ/n9hWQDbnluxPALMuRGIBGQw2TG85cF4qSF2+Q3ZPHZSAafdBLIjimiPYXJ37zutF8qksutyNmq1n0zmu2GI1yG9gTzkV7aCg8n3b+q4OhSgGdlQlnPLetQpaIKUpkikccHdmU1sQGsZh99q7cjESxpkdZD5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqfnN9frJ5dJx+7V0Y0TseDUs3RB11dAfWK5/OhOT5Q=;
 b=KcHqqxK9zi9eJYJX/Bwnv2DcqhQn47fKD+wZ8ajhuJOSelmBiyIBDr/KDUammUThLTPWlWzUtMYsi70RcbjuM3+oJGroGhKEMsF4IwDhPhrDwVaUe4g5XmfCqRPBqNIh5qEf+Vejgbg5dEMfGHv1l2qVzIo1c7dKqVFSQw4GnLQq2uUD4Wrx9quiubXwYSolr8jmQzku/1P2H3RO23byxUYlAGsIqcoqJRz2n41g4vKEuMkRPig443iR4kK05kpxaYUvhI4663vjMbcuoEJ8Oj07BGoBOJ1NcuXk9UZnE2oscK9CcjVdn0WiEg6RWtKECbGfrRLf+aJOWddrsgx5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqfnN9frJ5dJx+7V0Y0TseDUs3RB11dAfWK5/OhOT5Q=;
 b=cnMbMNGz44C2LlyQfwNjWQEwsmSzMTrGpTMYkBTt1pE+aB/FiT8iIfmvS34IrGhExpwMmyW5GEgWa+kvY1OHEuM7awqJl/cAAm8TMv5KtkPznwn5JpS2KwjdAbvWLbuuCFNgCZOe4oBDoYsA70HRngC6FQsQg2OeSEiGAdiiIJA=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB13920.jpnprd01.prod.outlook.com (2603:1096:405:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 08:40:49 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 08:40:49 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
Date: Fri, 19 Jun 2026 08:39:49 +0000
Message-Id: <20260619083951.3777556-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::20) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TY4PR01MB13920:EE_
X-MS-Office365-Filtering-Correlation-Id: 894b60f1-945e-4199-f928-08decdde76c5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|18002099003|22082099003|3023799007|38350700014|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	UH1xC+E+zgLvhrXGLpOaGNPUhprs+sEzlKzP6olot3EBj7l7JyHfsSFM76+O1KGOOuMlwythGps3Z+LfxPWoasHsm+JPK9CzHpUV+gmqIoj7uZmfZ1GH7YhFNOUwS4fZxr02ItdzmewaWXxJWDpuusncV7FBY4s9qN0MhNZzTD0/ramUuwk3ZGtJY8uWzzZjascNGCHfZ/M2TDq+a/75dTplH0e+VvNc2st3mOB3fa3NDQJry2WeAoGTXNpwBNKbHsVJpzHJl7MYwNgAwYojwrVEIgjySMCWZzSKJHqLp/IgfqQSaLNKz5ZORy7GMfHJC20XmWAsRxmSKQuiYq+qe/RGdCG0rkgVSQEJfWafpupBHdKcutDW1JXUKpoylikrH8t6YM2uZkKRm8UqugvyYD57RcujrFEeQziiF5RnMZ0v+3QXoefpuZ62VhpiAQU1vm/LYOwZ3lZssa9ipH/8zetPUF8i5vPsMmtGRsL7CbWWs4Bi2Qn3poAnUrkQ6VvqocdePqfIcxazRnWqd9mZyqsFQbUSlHi4mGM5GY4hn5qxQL00XFsjnSNgcn1NNnni/vGD1xe8YQnlhmlGUWO5qYsNZVkuSE3cRxYR66idfdoa6E83wOWdQzc9Y1UIjGACaxQxiPgbyoqWOUttTm9fMCHWu8nYnW3cCLq89W023L8Mhmnn9FDxJ45h0Fr9ExZDDTKy5sEBvFDksypR6XyxZj093eMgYMkR2lfjNSlL0no=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(18002099003)(22082099003)(3023799007)(38350700014)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L0ePsYEuauFm9l+QUKI7bMYOOmkj/hK/zvIjEHFMyg7674igDaPITSs7EuR7?=
 =?us-ascii?Q?JkqrDJ2RMuCipPPqH9haa0rPxWTXZzT9oQvMRim0XXVwUqaO5ksFy829TMGS?=
 =?us-ascii?Q?xnY/KzkZvyNgwoBsrWc861dH/Y1eWGAmSHQdB7e0jA0/H2w/FqqwIsdpEENg?=
 =?us-ascii?Q?BEwqQbLZe5c/v+nHduDRjn167VHIFJ5QA+c3s/YZeqsP0e9CYWTW7fWTOSRL?=
 =?us-ascii?Q?dvid6NEuyqTXysUg0LDGVmQv2SQ54vHq0tcNXDKVBoWw4drjzwOVX49tDfTb?=
 =?us-ascii?Q?IYAH2+HvhIusYyPxQXwGqlsymRM3icYtlj8EkkQIZIrIVRRNuWgdTpzng1f4?=
 =?us-ascii?Q?3iqMsaEd9/ItsPiP9DAxAAEAxanc4azhZ0wXNRFy0yMxYEYRvEUDnYRA+qYz?=
 =?us-ascii?Q?5dPwM0KtmF/Sjh7tTMlXGQrBiOFcQye18krfL+x8sWgB1OVm5i01PG1TlzS/?=
 =?us-ascii?Q?Lk0DgkPP0lbJfA8SahL2q4+Acphpdk68cVR168TEydQPFX/qRM6VqEoAF+jQ?=
 =?us-ascii?Q?LljkLGxT4yIFKbZYgVk1A0pN+3pGsdDiRIEXqHmERhWFg9JSJeOqKht8BKZk?=
 =?us-ascii?Q?2bEwt6pcpSo3wJq795z9aWR3CI+oZXFjSQBq9Do+HFV+sO+h2QBRAZd5kiH1?=
 =?us-ascii?Q?VK3BjNd70paZEdlBmD3VrwrUHf+N8E2xVKkQVs68bQu3BrECnyOR3K/6Oi7X?=
 =?us-ascii?Q?HuUeojF0dlhWSAevMWvBLHM5CW/40N2xbHdUOQXH8ON4LG+GsAwy3IPihsXB?=
 =?us-ascii?Q?JMW6IhDj+yEetKOZNWHhDcEiapAyl+eWogpBRk1zPyLPUyEzELsJDkz0ceVN?=
 =?us-ascii?Q?WDDewnFDaa8AarrFKA3oDmB/pcI640f1LH85KruqHvFFvw+SefgBLMsyA2hx?=
 =?us-ascii?Q?iQGxN1+Imyf+/zvKlp65IHJnHi1OiPneJwGq3VIt1EAhxIVMXlKm0zOvDcfu?=
 =?us-ascii?Q?dAp1oXonprdipnDoarUDxgnjKWX4cGidDERp4BYE90Q04GjG5jgLXFH/YvIf?=
 =?us-ascii?Q?jjdKHlrhPPxlSv+xK+1fJsEfz1QmQTsSUIKk6FYh/zbR3DGV3K8xEGiRTinU?=
 =?us-ascii?Q?bvM2YurE9rqfpOQY6BFCDpPfvpFiZ+5CCPtIx5x+iHMUvGoxeSXAo8ukPqOr?=
 =?us-ascii?Q?GRKZllAy2l5yOs0iHnz/YL4lskdRyKym91wKWpMvlVPqr5qTa2KBou8t8Tu0?=
 =?us-ascii?Q?V11BIcH8UNVeMeypsXJV19kNC9T5H/vj7hcv3ROJnocXNuk2jEIADtDYlKuD?=
 =?us-ascii?Q?iEMZS/D5ogIdyHu5dVEO13acBIZ0cGM5i+UHvzBaNMgSXdrvuu+E2v7w5hoI?=
 =?us-ascii?Q?J/49vkBoqeamEpbey7WlNRp83ayp0370BnzHx68SM6fe+6tOYQsRvXt+ZIS+?=
 =?us-ascii?Q?JAKVvXmqcK/aFxl79WPUf6zMboO5dbNClEgnLtgPkUux97Z2PoUwuzSm7ktJ?=
 =?us-ascii?Q?Nd2vN6JLCw0y5quInebDZyLri1rRoM4iejQKRdJcaIQHmb9SkbGK3La8h0Ge?=
 =?us-ascii?Q?xd1bOoH9is3kz/XTrEF1Ygjl3JQaJIWdmbnioxa57eyGZ5UIoB+3fZ1NQDYL?=
 =?us-ascii?Q?IjbEG0Jdar/c7Or6ss7w932gdgStFYIYAesGmpfnXNRFRBt8QCPU2j+BFR8D?=
 =?us-ascii?Q?S9zT25usnlZ1SuYdWw8tQn0GDxFrAYSh3kkiOpJ69EnB6bdfkzDCXm1YSSiu?=
 =?us-ascii?Q?qgB+M+G2li/eCw2oeglzN8pt+lvjr/nIuDzeYuxBKEouudth8NK7K+ex4NRF?=
 =?us-ascii?Q?/mopYrKhHgu3hcaSx29JG8mupPWEcfI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894b60f1-945e-4199-f928-08decdde76c5
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 08:40:49.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/uS2sYxeUuESp5ilkwIoKJhG7b5w5h0IndzZum753jzT78Y/t8hyIELnJ0Qbsy1JeL0UY1nUa76Q/FxvIZjcoP3eiKeZGzOUKWzFkh0o08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13920
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-34233-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 849E36A4AF5

Add the Renesas 5P35023 (Versa3) programmable clock generator on the
I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
audio subsystem.

The Versa3 provides the following clock outputs:
- Output 0: 24MHz (reference)
- Output 1: 12.288MHz (audio, 48kHz family)
- Output 2: 11.2896MHz (audio, 44.1kHz family)
- Output 3: 12.288MHz (audio)
- Output 4: 25MHz (DIFF1, Ethernet)

These clocks are required for the audio codec and the Ethernet
controller found on the RZ/G3E SMARC EVK.

Output 5 (DIFF2) is left out, as it is not connected on this board.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6:
 - Actually drop Versa3 output 5 (DIFF2) from assigned-clocks and
   assigned-clock-rates; v5 documented the removal in the commit
   message but left the entry in the DTS.
v5:
 - Document output 4 (DIFF1) in the commit message; it is needed for
   Ethernet.

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 15c22dbf0ad3..455ed35ae5d3 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -78,6 +78,12 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
@@ -137,6 +143,20 @@ raa215300: pmic@12 {
 
 		interrupts-extended = <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x2>;
+
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>;
+		assigned-clock-rates = <24000000>, <12288000>,
+				       <11289600>, <12288000>,
+				       <25000000>;
+	};
 };
 
 &i3c {
-- 
2.25.1



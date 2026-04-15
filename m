Return-Path: <linux-renesas-soc+bounces-31277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MgjMkga32mJOwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31277-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 06:55:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86242400457
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 06:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9214B302FDED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 04:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A92330B0B;
	Wed, 15 Apr 2026 04:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RnVy93lH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FC729E0E5;
	Wed, 15 Apr 2026 04:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776228933; cv=fail; b=THZBe8PW3xjU25+8++fyzC+fy2vtDEEI7N1v2KhiPGvRYCjAuENiFDCrj4ujDaoLymnV5r4OFeeKDqRji57kTv8YjCMLBALmsTW5qwxgRU5mnMw+XytqCEzqe9cFj6jZ5quEUH6m9sjtVP580BOJ1N3RaASL4V9z24007RGPZKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776228933; c=relaxed/simple;
	bh=8J3wYHT5i7ueYMtomfVKTw/1Y2/esIgFaLnxO55p0Pk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fC4pRS6w/IJFvKmIy+KsM541bY2/fldCzBX81uW0zSyPndPg5R1O/h2qMtpqGbGx7fJqlraR/whEZf2cujLpuvZTqDAlgHJZ8A4XD59DUVZJUj8a6t+c5Y25lYlMOpLc1MoOtym7jrIU8CrpCTacVqR31F1zME5QGejlKIjFpDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RnVy93lH; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzHBVeNjMiwmQgJ/lIsnUjC829yyhg2I3WnwPugmgBvpSaEm+AttBGG4Ux8LfCTqmrPktfS6JOafHhkPKPl24R767KaEY64MPZCH+j0UzLO473AryRzVHqpQ41X8BD8EsXSg/xELjkNU69OJ9NjqBZ0JKZWCL1nIV/KXE82mRmy2prvMdLlqvkR6Y9+VzHgMF3cS/yuCfHH1bHBN+5Rr3abKpcd5dplRbgb6ItmCh68Tbrshqu162vhE7wApFAGGw0AGhcbNGHA/cTqTWQ+x+G6ei2fcm2O99QsV74XtZqg1WbkQYGCDNUcZJ8ZkOs0TYlJC9yHsE0mlgVX8wWLtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxK1LkTNOU2uxjodhqdmaa6VuE7Z68aYPNOPhLIDcK8=;
 b=cQ3y6mdIKLDBwEfBN07DCcux755Zo4WgHm+8S9vPgcEIQli9fwukrE4VnvxEQYoqBP20F5W3wRRgIV7OSIO2mw4OHM1uET6PNcl7XlQXtWE2QS3GhRhxE03OQ/0glLLduLgT/Mvu9/4VCg4I6tYzMSKK9KZ+iykt/jWMoq7AGBBJEHLeGZB4sr4Bx0bcBsz7B5wci4jLFQyIF6hHkGDRO3sAyv+1htoKJfVRID5YpyNw64z90QuPWMFmR/XQrgs7t7NvhR3l8ckPvKpYj2e3ZbmyZnL6ftlykQvbqZlLKOwOm8j4XbKCbqp/Y9Fp5nzhd6DJrtHbFLEMB6lMoVge7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxK1LkTNOU2uxjodhqdmaa6VuE7Z68aYPNOPhLIDcK8=;
 b=RnVy93lHat7AGDa+kWr91RXDSudzaP99QpBcxTnOEPnOoZef4+TCRFZaiuvZIXNSTAMY48nG/l5Pt2uh/UlOu0UXgMBbjXJng97A/HBobGDqP2d14U5ELPScp2UFhlvfxtXl7oAdD0Kpdt0au45enJucGWV08FK4PqCvy/Ynh/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB9856.jpnprd01.prod.outlook.com (2603:1096:400:22a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 04:55:28 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.048; Wed, 15 Apr 2026
 04:55:28 +0000
Message-ID: <87wly87rgg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
In-Reply-To: <CAABR9nERzKW=2vZTWNuTcjz4KuVyc+eaCKBNP6ZGb4UAYw3qUQ@mail.gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
	<20260413100700.30995-5-phucduc.bui@gmail.com>
	<87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com>
	<CAABR9nERzKW=2vZTWNuTcjz4KuVyc+eaCKBNP6ZGb4UAYw3qUQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Apr 2026 04:55:27 +0000
X-ClientProxiedBy: TY4PR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB9856:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1346b8-f0ee-4ec7-dfc8-08de9aab36b2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|366016|376014|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	lm3DDOmpw/juqDeT/pC7cldVWPXLkBIHiNENAsWR6RqU6HwZwRAyjPcCFymvifUoLhyu6cwpqmw7ahVn/cwBqc+AFSVQQH6QVopK55s+0vhZ9WAfXGcTDasGNoIdkn5h1P5zR51I4011reVuJkpYuXp9WbGE5H6gpaqeKYWj34m27/s/iwnDNamUwLi3kJF/PJZ7WWMmyD6n6kPtRL0Ri709cvCOHG7WpdloQoPX9fTZ0QcAPY0OFh4geyOTov+Ayu9LapaqTzglVxI79jIIYgG2Uu5euaUIv3Tb0y09sgyPGv8HfYfKf2E8zgoPhBZ9sp3wxdbTkp/8q7bQohZVu1+gQnboxYjiFabQXMNmqsy7/llm1viReRsbIz+coFhxSUF/GcwH+P34Y941haEi9aigiBHY4CF2K88pn1fg5WM/FGRKSj0rVHrW2EEphmE6nAaD7XHeZ73uQM/TGiEDruru0bP+Zkv832AyzrS7FpKDPns9iAeg5eDIfjnf/L/RE0BtQOQKfF2Qy7qdm6QMJQEIZ+xo69Fl6hFLuA8IcfLZmkIBcW+lOhwdt3VExBPs3mPQ82FouURxWMIMtkrRr3A+wpiVbvopghvqgFW9Ag7EYgUGd+kG8TVQiO40XkEZEx7FhRiAT/iDiRV4m8eYhEgvtX5Brg7HADDElfyIN+2kD5QTjwscYedPHYzcHI4wQ71IWTu8Z/OsOAexmNa2z1YJEyMr8lhZhqjBCMniFoX+dj2n4PAzEX0vFjh2O8H93wIFiP6DdwFgoQl7WcMCS3vwdJ79LNGh8N7VpfSGN54=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(366016)(376014)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KEXkdkauvnChlyaf+ctUNMq/twxJ0yq+tkmzmMIqGTqJTlKOv3rrSMEqEL9O?=
 =?us-ascii?Q?6c4M1q+QRZVFYWQgUHeVoSMOMhKwRDDOY9gYerG46Cxsk9ZmPbeYmzAdhEu4?=
 =?us-ascii?Q?cPD6q8nxOnKBEEqMhGqYoiZZRUExnge4QHnfqWWhXZMWbIonOKdzj3koMtdx?=
 =?us-ascii?Q?KE1O3UU2rDglNHc8oafBo9qyRvODfa3C9ud/5H/UsHHrfAYII29gftpCVAht?=
 =?us-ascii?Q?Ov03XURNcqs1WeUbf2T+t2a/O+92/ViWCaRb7iPbjhNIXyzFyauAAi1l/weY?=
 =?us-ascii?Q?tZJ5NypetiI0ONeDT0d1sXdYWSzQZpd6MkxQ6UtkCZRucHKgKi7S3jvCsxZc?=
 =?us-ascii?Q?Cj85QCpaVtp97cGEnlUEhIEUShQ6PW0+e45VHNWrmC3R52y1lRHIlmZJEL1W?=
 =?us-ascii?Q?2IfeXKKPaP0/NP2Cs7ZuI99WykSeS4ebyKgbftwwHgdv24GaP5IsQXe0+GDc?=
 =?us-ascii?Q?ibcA3FqB+Ki7mtqIdPmdAbbxwSIDsl8G77DBr7SgWgKvsTZoK4zBRXOqr02v?=
 =?us-ascii?Q?TtLjf75MxgMVNck6uX+/ku2mgDpYOapRz0bmGheIB+9f59ENHkyTBpHoTF8u?=
 =?us-ascii?Q?n9tBs/GbIyfiXE0kU8o+xG2hu1bnm7S9+jSSxyWDEcNOlyTKmQ18ApPFy82Q?=
 =?us-ascii?Q?76yLrQ8OhH0neOIHD9IsMtXwx5mCUASt1agW8JolOMgHK+fBwWZtxt5FTDfy?=
 =?us-ascii?Q?Iwjas0YAZ6Uj7OYpcVd/YnU4KKVTH64wdBHxdxBoOgKCzaidPFvHcv6Q6LZ/?=
 =?us-ascii?Q?Xo8nRR/+YUMLNrqfRuqubg/X51wtlRsRb4tDApGqZ773i/XeTxMtaLxgSF5k?=
 =?us-ascii?Q?0eB8hFc5UoZ9WycCrhnWBBy5pX07TYGlhsda6udgT7Rzu4oIHcPnZm+jjamf?=
 =?us-ascii?Q?WEcenRBwtARFV+VcWdZVs8aZ3IBoXcwpwFvsYiMQZ7iLWVYvoyFP072B5U+H?=
 =?us-ascii?Q?NkakaaPDxlE8qlYr9zqXwAZON/0FS1kZZ0d0XjzEgm4UlR9ayp5BnkE3mWSJ?=
 =?us-ascii?Q?G8oxj3SC/GlNs44RTDwdM8WNmdUq832Xh5GyOVsQkeNEnHNngda++qzoboC3?=
 =?us-ascii?Q?in69gg70BW7YyjokTU0NREM8azHPSdxknIOVhnDnD55G16Z+34mzvloRt4AW?=
 =?us-ascii?Q?JLv0jq0dDx0ZOQp/Eaiai8gwml1IiNYujAmqOXg7FD6TD6Gwy9iwqyhjoI1n?=
 =?us-ascii?Q?odtsnHpmJm6MI/hHrV8iOkUWDzWnWFbilPer0dnj9DHaet0mjLwuPvz7evE+?=
 =?us-ascii?Q?pw3x9yO3Usg9Jv3OWx/FUDF6ekaP1xmUJrkqyVKUuLgjnCkDfzFd13KzOhws?=
 =?us-ascii?Q?iZ5hda66wKCd34X1Xz8GXKXIZYZInp+xLfsbcn8Axx/Du1vMGFiZuZ3XQSNv?=
 =?us-ascii?Q?gu4z+46dZML6qWZwpcnagk0sv5iekJsAZj6tZT0Y5Ebfgw/LRjhI0t9Gqr5a?=
 =?us-ascii?Q?Asvuxot88AVQUR4ybqeI0UV8tvM+nuhAejdMHFEock9qTHBfuePBmEfMZDA0?=
 =?us-ascii?Q?gBj91asaL3T6m7O8RYRoVcD54PqaK4RCBgzRiPTBMwJtPCB2+vY2jukRATJr?=
 =?us-ascii?Q?3NtGpGCp4/RkKoofM2zaJSRzXKx6fo97tqL7O4SHJuVTjCBrgmZBJn90yp0G?=
 =?us-ascii?Q?8QyBJuC53STuJM7NHM9+AEaS9jcQpA8+Gp3JiGtRf4gmbkzLwHUMngB0bEN3?=
 =?us-ascii?Q?dVE5ECWYZejfdIutfSKSWW3/g3/Az1vvq9lSZMOUrenYgWh8NT/E3cj7omQj?=
 =?us-ascii?Q?PsXiuUiWw87zfGAWNGfV3ytRBLEnehLWng0E96vuLiHEiq9zuPQy?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1346b8-f0ee-4ec7-dfc8-08de9aab36b2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 04:55:28.2785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCor4X8ALzkITcaSgvzSySVpbKZ5W0Nm8GbYkxP6iDZ+2is3VxBjiar3h8lTIpoqTM0g+cY/shhEElSZ/rcot4mXFFezABdWQK6yC5cTb4MVY3WL40av9i4kDxkPAIJf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9856
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31277-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86242400457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Bui

> > I have mentioned in previous mail to just move fsi_clk_init(), but why do
> > you need to move it ? It works without any issue without moving function,
> > I guess ?
> 
> I moved fsi_clk_init() below the two functions fsi_clk_set_rate_cpg
> and fsi_clk_set_rate_external because, inside fsi_clk_init(),
> I assign these functions to clock->set_rate. Moving the function was
> necessary to avoid compilation errors.

Ah, OK.
So the patch 1) moves fsi_clk_init() and 2) update it.
It is including many features in 1 patch. Please separate it.

One note here is that /* clock function */ is for all fsi_clk_xxx(),
so don't move it.

> > And why you need to call fsi_clk_init() twice ?
> The FSI controller has two independent ports (Port A and Port B).
> Each port requires its own clock resource initialization and configuration.

Ah, yes indeed.


Thank you for your help !!

Best regards
---
Kuninori Morimoto


Return-Path: <linux-renesas-soc+bounces-33559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kaEpBDCPIGo85AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 22:31:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FE463B216
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 22:31:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=i5o03SPb;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB0C6303FF85
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 20:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E1A3A4F5E;
	Wed,  3 Jun 2026 20:28:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BBD3E4C98;
	Wed,  3 Jun 2026 20:28:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780518531; cv=fail; b=kdlFveq/hEGjcM7PUafxm5quvctGdybnQXYHJyEXU9ucCFPNPnw73Io56hYNirck6zXz4tUP3L/OqoaF+BRXJTBJCpetLdMFui+LjNnZiqYqZdUUhz3FzsKTqEkHQATU7T/783JT3Uf+2nbpAC/5n6Oa/ootdV+53hpf6HeSVZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780518531; c=relaxed/simple;
	bh=kDgR4cCS+yNAQULJic+bAVIFKiOresHNY6U0ScX3XrE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M5uaeEAD59lOpygVmRn/VwapW1YURJsoJCPvckbj0dQ0IVqhGc/G9Y9fMCNgJi9jJPAOBBBEnMa7iG66HXLVUFZ57ZFYpkOyZUPM5Vcp7LziAXa/gQ4lcXe59QUXe3qAyRB13AdffkRsezUn00JJeUuQDK683erGGmTJ2sgRaxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=i5o03SPb; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UY/F0r6wKJd/9HKNzBivNMwTWFnItEWcyRQUXU/utc0+zDHU3XfUlXKwDeUPJBnqjvNTVDj1+EsWqm5LBnMBDiLH5KO5mBPNmrOdYiyhytibSi+58wI60G2ILvj1qAjP8PKvZdT2A5hNpPpZUbR6MFDyCs2BegazBcdO45Hq+bYEBupLO/lNiBiXTkeIHqjGuLje+Th9GnbvjpY82xoHwUNrnSFhAYOGkoePzaISbuOgIm+mlq/1bWvi2HDUkvAsi8eKR7ftdudEso0qjGREoluI13H2l3lPqYygGPnqKGOAmAOqIXi0+HzUCp6h4rc7DSVEKGko21i20kKBmOemvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5Mi6xiNjzbyhVcFFp717zSEJqFJwBhM4YGie70hk1g=;
 b=XsE7U9GNzEWYv1dHjzZCJRXH7wMNPW9k3gyUINpxGOHvrQUJjXe7rs5lkGhyTv9FnFcvvLFwIsO7jDLuiwSW33bqjuVwxRZDJkS8Qeg7H5X8jSDsUe73wLhUf7HmhjmdEnesfhtQ1Pu1LJ0GFzkTwJfOQsIiuhvrd48rw8wSghD7l5qIBV9ut1tn/jpyqeHjgumZoRUx+bfDHnYQEHyl0hYbL2JAtUX/lekCZov5L9oD3yMkqjiBihhq5iVdJuDkhMaHXT7A/OqNZpigOGE8HMcejnIAEK/2e2zW2pPrbBjuYw0/9rLCd4ytCEmk2cyjFCgD2PXV47N6UnKdIaI4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5Mi6xiNjzbyhVcFFp717zSEJqFJwBhM4YGie70hk1g=;
 b=i5o03SPb4BPan1OOIYtyF2GDhiqHoNcGqXTHRC5mheuuTR0gLSVCUR2Btv4kS+Beg8fJaajyEdp1/JM7IIQNtVzC5GLOQWCvIyrTrPQisQh4nMDU/Owjo5olQD6pBtOXhGBLG1Gnnr9kpdvX+TjdwAzWgy0jfWX9Ib0gcq9jyFM=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB7724.jpnprd01.prod.outlook.com (2603:1096:604:1b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 20:28:47 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 20:28:47 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH] ASoC: dt-bindings: sound: renesas,r9a09g047: Fix dma-names list and ports schema
Date: Wed,  3 Jun 2026 20:28:05 +0000
Message-Id: <20260603202805.3530046-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OSZPR01MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ac14f2-6857-4c50-368b-08dec1aeb6c5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	QmG7ftbIWeXJjMPM3De4TtQ+2bo23jIeTCbB5CZwzDM87wV6RCW8IMblRAtO1mCopIe5ZCdUswK5MwI+ceRSceXHYZxHVqEKUhebv1kiOKrVR6r9zcNYk0yQoKljijGbjM+BnMbRuIlnx8Uz6T7KBemk9b5kPYcw3WP9GastWzH09tzN6XFqT+2rQdAcKfhaFYAh9P8cTlvpg+S0j2Vk/k7KkTYIcagVEAe9K9uNsUeejjwXb9BpdDUjFo1eN4PvBJFRche31pKIvqCNfBq2dmAi+cNW23mKuHbm54N78EKNo2J1TA0S+cZKg8u9XTN/pv4I6OTwCAddad0SVtabglqa7naYBAnpvaqeYqGI7rMiJ9Sv8CJb4/6HBGUFj7Y0LLkPnHfTsrrScEdmhyq3b1HebjqMSh/1YqapT+fKStHF0d34CsUX1UEoFZZjaF7qhAevHCvFK8GMkKsxUtPjSDm7FxyffMhoFJKWOMsspEjD4iAVcMDXNdHSU/sxihclhcGHJl5sHzvtCs8p0LGJvlIzuCrgoHOZizMTcKP0d3MlgcGdfJa5mOfWfOMTV+SbjGynlEX1sDvEAbeQq9fo+xvkOS6XS/ShGVSdtAkxp1xyHyyrWqrhoKHYphjU0FgBN+2J6gwJBoy4i513n2pX3MF+nV2Ga+64fhAHZruyf9zQpel9Bue61kC0f9QjJGtpBurPf/QOxiV5aceTTeeNoQYC9ikC8SqBNb4V0rg6dvxFFCHkHTGckTjXTMMR6oz2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6QtaydUCCdv7DEIpHZV6oK1qtM/mSLDnu2qa4tReCm2LRqq39nP4c67bpTm0?=
 =?us-ascii?Q?3ofjxwRkGe+myl/t0QiWAW9UE/Kbck1WRS8j1U6Mk2wd8qAfzFsxUg7m8pzr?=
 =?us-ascii?Q?1ESRF4PeFY5J7WKMPUbb783UwThS+UWkv4bahZO+/WJPpx5fKSpT78V3jCl0?=
 =?us-ascii?Q?NDjmERdA8EwJ9JWU0ObxlDBClPejMfGyMYgWpvRLIf0zmyq6AbUDqYhZQGDc?=
 =?us-ascii?Q?Om1wuB5NqWW5wc1gzyEJlIOhuDsUWjkQxnTZwrOrcM1mOC+IyI77Z0JUKKlq?=
 =?us-ascii?Q?69ST9vFSBSMAkzMAAHXckI1QIFYBPUABAgUkI/EwbSi5rI5gkTimi4QnyOg5?=
 =?us-ascii?Q?IrvWBtXgWeoFT+YJjMkMtaPXDlIso1ErF7BJYXgVcFNKli8F5HxibnzR8Zvr?=
 =?us-ascii?Q?RAk+GnW3Epi19KX+w4bXvczvQZSxrXGcRdRREEzRVcAZqrukAeSn9J9TqS7T?=
 =?us-ascii?Q?zAQ0z6TBADv0Vn/8YwUA8uTcYFa1gs0Og1EweVINKXDpJ7bKKBH4G61NwFJq?=
 =?us-ascii?Q?gGQsQAbDKf69lifXVlc4FcIt9dyIYrxtP4jvMTfxDc4cOf8cwediSnSft9cM?=
 =?us-ascii?Q?mZ9fw/iCkCnb1ZmVrgtCnjmfmYviH6lCKpqEcG6xDs0iHUEaBrrKm+k0fYUK?=
 =?us-ascii?Q?jrH3Z0QqfgEKjDtp/Qdfx47hXULvF4rlshgyN/pWqc84k8/3oxzrNKbe8AwG?=
 =?us-ascii?Q?KdoZqC1+dFSjxXl65k/y/bX0L3HJIF5udhkYQiZzUrnKDNF9eAOKOkuw+hjR?=
 =?us-ascii?Q?CvxHArzOpQyspV4qVVKy+mVtAIrktQyLyFQSQblSaTA4tE9ldSR/PprQ5K06?=
 =?us-ascii?Q?1C+jefFDGUi/kwO9iEaGWpET1fAnaaUbeMvSW/nzL9MNKMPtZe+gsTd3uC0D?=
 =?us-ascii?Q?iLmFlfUE8nrzlhvdnc4ZHsGDZ9OuO3VqARUXOBk2dpMbB+KtNZv0bfrvsrZA?=
 =?us-ascii?Q?hFhTsFjkS9UxMSPSSF6dDYImiIhLv7XEtEEMyIIof6q73jdMuNhSneBz+yxD?=
 =?us-ascii?Q?G6tTyY/hmj3YUB52mMRskHjH5x71vQ+bEgC2Y7QYtJaHcy7NKsyluwyXdVqn?=
 =?us-ascii?Q?HEKEsX+E7tQ+nV0lfcFGwCMwagmtzjaZ15/UYB1VFAgD/76JIg3Rb1+aL7Qv?=
 =?us-ascii?Q?TZuAou4w3iZNGPuMPJe7M9LB8HYTg853Je2jcXUWU9TaFP9pOFDIl0S5k3kk?=
 =?us-ascii?Q?E2lHqP42VJtoNEQ4BKzSw2coH86jBmveb9S/ZkG8PPI+yobuLcW/RgmDlJsi?=
 =?us-ascii?Q?MJr/Q2qkyUHH79puf7Y3winFCKy8GgTE6s2qU5x+lPk46QDTqNogl2uLdMVj?=
 =?us-ascii?Q?6ZEfXSJ12OZjQTOO5ZT+8xCP0o+3/O/VhUVF5G8LtlcgliDZWa/Vb2ghH/41?=
 =?us-ascii?Q?ZGJqbQcrTfyOw4ooynffi3PU00wtxaJhl3/Hy+giNXgcKQVhVFtnw6RpoE+p?=
 =?us-ascii?Q?esmhS4zHPQzyeqyCOjW9M+QapBXCqaB+pLgd0pKwptKs8BVqXJCB+Uasqqrg?=
 =?us-ascii?Q?MUJeITJ57VAl9C9GMKZMT88WYbDK27N5QdPw7qsy+ybsza6Jbi4YpryPvgyl?=
 =?us-ascii?Q?qCN3fgwLRNF8PJH8PMfoBEAMn3mA+3rcgzEOoU6o3XLoryx1hyGxGxbIWba9?=
 =?us-ascii?Q?sTymb5NuRrHIv3G6DIF5rswqjyzctZX8IPhvDjZ4M5t0GQNSAr73VCCR3AtT?=
 =?us-ascii?Q?mCWrRU5TXXQUeXx8FR0YV6bjPcsVTkLn+EVXZCuHKuZlMGz68kfj0WdgSl92?=
 =?us-ascii?Q?/lzwo3HkYGfwp2i3bmKghmBwU86jR8w=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ac14f2-6857-4c50-368b-08dec1aeb6c5
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 20:28:47.1318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpDt/X9zrcO7Q41HFM8OXsWvF8o9Fic7n8qQ6gZkDQEQs+Xq11OVc2xPt16uAPTj7KVwecmzsy0pImnTMcNDoaB0y3l5TAmk21OPjRvM5G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7724
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:john.madieu@gmail.com,m:john.madieu.xa@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-33559-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,vger.kernel.org,gmail.com,bp.renesas.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:from_mime,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54FE463B216

Express the dvc/src/ssiu dma-names as an items list rather than an
allOf-wrapped single schema, and drop the now-redundant maxItems. Fix
the ports container to reference graph.yaml's ports definition instead
of port-base (a ports container is not itself a port), keeping
port-base on the port@N children, and constrain each playback/capture
phandle-array entry to a single phandle.

While at it, drop the unused top-level #address-cells/#size-cells since
no child node uses a unit address and the ports node provides its own,
require interrupts/dmas/dma-names on the src sub-nodes to match the
ssi/ssiu sub-nodes and the driver, pin clocks and resets to their fixed
counts (47 and 14) to match the clock-names/reset-names lists, and put
compatible and reg first in the example.

Fixes: a86fd3c20218 ("ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../sound/renesas,r9a09g047-sound.yaml        | 71 +++++++++++--------
 1 file changed, 43 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
index d7fa16554698..80670019d2f4 100644
--- a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
@@ -42,13 +42,8 @@ properties:
   "#clock-cells":
     const: 0
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
   clocks:
+    minItems: 47
     maxItems: 47
 
   clock-names:
@@ -105,6 +100,7 @@ properties:
     maxItems: 1
 
   resets:
+    minItems: 14
     maxItems: 14
 
   reset-names:
@@ -143,11 +139,12 @@ properties:
               through the list to find a free channel.
 
           dma-names:
-            maxItems: 5
-            allOf:
-              - items:
-                  enum:
-                    - tx
+            items:
+              - const: tx
+              - const: tx
+              - const: tx
+              - const: tx
+              - const: tx
 
         required:
           - dmas
@@ -203,12 +200,22 @@ properties:
               falls through the list to find a free channel.
 
           dma-names:
-            maxItems: 10
-            allOf:
-              - items:
-                  enum:
-                    - tx
-                    - rx
+            items:
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+
+        required:
+          - interrupts
+          - dmas
+          - dma-names
 
   ssiu:
     type: object
@@ -229,12 +236,17 @@ properties:
               falls through the list to find a free channel.
 
           dma-names:
-            maxItems: 10
-            allOf:
-              - items:
-                  enum:
-                    - tx
-                    - rx
+            items:
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
+              - enum: [ tx, rx ]
 
         required:
           - dmas
@@ -261,10 +273,9 @@ properties:
           - interrupts
 
   ports:
-    $ref: audio-graph-port.yaml#/definitions/port-base
-    unevaluatedProperties: false
+    $ref: /schemas/graph.yaml#/properties/ports
     patternProperties:
-      '^port@[0-9a-f]+$':
+      '^port(@[0-9a-f]+)?$':
         $ref: audio-graph-port.yaml#/definitions/port-base
         unevaluatedProperties: false
         properties:
@@ -276,6 +287,8 @@ properties:
             properties:
               playback:
                 $ref: /schemas/types.yaml#/definitions/phandle-array
+                items:
+                  maxItems: 1
                 description:
                   Ordered list of phandles to the in-SoC modules used
                   by this DAI in the playback direction. Each phandle
@@ -285,6 +298,8 @@ properties:
                   from CPU to off-SoC endpoint.
               capture:
                 $ref: /schemas/types.yaml#/definitions/phandle-array
+                items:
+                  maxItems: 1
                 description:
                   Ordered list of phandles to the in-SoC modules used
                   by this DAI in the capture direction. Each phandle
@@ -311,8 +326,6 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     sound@13c00000 {
-      #sound-dai-cells = <1>;
-      #clock-cells = <0>;
       compatible = "renesas,r9a09g047-sound";
       reg = <0x13c00000 0x10000>,
             <0x13c20000 0x10000>,
@@ -320,6 +333,8 @@ examples:
             <0x13c31000 0x1f000>,
             <0x13c50000 0x10000>;
       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
       clocks = <&cpg 245>,
                <&cpg 385>, <&cpg 386>,
                <&cpg 387>, <&cpg 388>,
-- 
2.25.1



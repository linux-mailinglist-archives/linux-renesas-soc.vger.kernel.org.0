Return-Path: <linux-renesas-soc+bounces-30982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJpZG28w1mlZBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:39:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 164663BAB21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DD6A302AF17
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BE43AEF47;
	Wed,  8 Apr 2026 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W/xguq7v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D837F001;
	Wed,  8 Apr 2026 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644745; cv=fail; b=jLcR1LonFGqT0TAakQQlvi027Bb/nR04hse4qEB9B553f0IRYoKMLwmgHQZi7nzt5Tu81R41uQkZ4nBoTKC69ZYb5/no1LHQGihnQNDAcpXDL+3HSW6KQmre3AtudwkUdZO7bUiVu4m6GJ/EI0xjF4tktkzjNyDUWb3pcra6UAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644745; c=relaxed/simple;
	bh=aG3PDDKXOx9LJyJHhOBFwzNoYEwg60YIU3pArhxM2nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V871+qN0lC0u3R7b4wyo0Pqnzwhu5XudQWg1FLEDvWoAT0SlZs4qXZP0eltmepNVB8e3Ie1/JaYBxgUl7bbt2R4EMpvWaO4aWnNDNGTnFa7pOfrtReZTolh0GqsEORrpjz9xvqj6tSpe9OhynYxArHbMyoiog+1D2NHgAEHixcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W/xguq7v; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2/4GeQf4lZobM6yQQ7e8RjHPDTLjTzSJkFK1NiygQHj01NZaY+cQel2RlTB3kethr6pEHTz3CpFXo9hEksY5PfUwi59/7AiiYedr5UD6r9PQcEDB6gyIim955hdsOOHQLMZlU+vGds6Vm3M/apCUFgHukY2PY61Nk7lYXeyLbLM1PdIjI74FNu1pnJDaqjEEoQQAuG3uSRJAJ+JX4bOJboF2bEedP+JDwNHVB77y4roTX/E1CpIrQHpc7CLgmutdDTFHqavC/gVvehpYVL0Fz1oDGTYhczD7540BOI8yy5qiCQWrRaUxZVSNjAsXtOHgO68KAz9pEwOypHqgFLzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlZdl8kUfpg2LHIAOQR1Ee/cEq5eB9nwAXZnTFx09yk=;
 b=PjOpYEIuys/CHndlz1d+K0pQsIzznhYH6ncWO26F5Lw9oklPAVrbQwFDLzssiXOWg6blSnj47e8ofM6qZdBHbvAfgiRg1Z8BPiHQbvrL+XZ2IQZvPxXUyJS3xl9BxXx+HBaGBT/wsJMXZb1oYrXJln/xRceRJEWpJ4WSx2lYhB8daIXai2A9l0Ir8FM6kplYnerwYmbW7JJwuBZwNZkNtbve58NOjWiqLMwhCkK8lZPFswic0fQ5c1WFKUahvZIFRNn0i7VNKSLZ064gdXCb9MkBvkHp3W2ueTYKcIT/ZZ8tJh5TL6TKi+oUJX55dsyF0xQtezpNZa8s3O2e0RVoyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlZdl8kUfpg2LHIAOQR1Ee/cEq5eB9nwAXZnTFx09yk=;
 b=W/xguq7vMZogFccHohiVL3Gh2CpR5EZFB2VY2x06SQCz6+nzuN5m6H+Y8P45Hesfs+HPaF0VOKuYyeb0v+cmCGjiTAC7dBM6enlgEjxK+iFusBRSODcn6RGotQ6PRMTCcTtApEDm6hbgOUR9B4EKClXvrV1JkgTNgxUaBAs5s5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB13668.jpnprd01.prod.outlook.com (2603:1096:604:35d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 10:39:01 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:39:01 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 09/21] dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
Date: Wed,  8 Apr 2026 12:36:54 +0200
Message-ID: <8a3dd4df30a6d950e5f38d46f4d9f396da67aa71.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB13668:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee98040-7b3b-43ff-5d40-08de955b0c2d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 IpDu9e+NP4HGnjUfMnLGg/khkH1CxkVmR25RIymFnxgfvs317cU7O9xSeC7DpWdaqqfY9huLCQsauePAAr/mcygGZI885nlzQ/BqWDQzbVMMVOzaqxu8jcnY1YrGEa2bTlhkOrpZfwvWcY3NUfIIbLLENx08b/Ibn6IoLk7mALOo2l6R4KewjEM8tSZIuwTabjziP6QNq57+hwwEZlUwrzdFtum3ZNCqKunXeBx/I7RYZKW8GW1seiVqOHHDfuXbi2xZoVzYLWIjRjyBWhyjvmV+/+qkgTdJMCvC20qDfTcK7G46I/rLMvZpZfvhViYQn0qUdELHx7xKI2N4M30YdxuNb7oh38af5zGDmBBCWsklgYrxnf8hgxXBg2P4dEXWo0YtahPN/e1tXZRwKB+GCSjHsc9HxT3SW+Fy5FVp4SXRZJbbC61o8gUWaZJP2NX6ZjMZ48IEBQjOPmSxbxs6+j+0qaJ9Y9JgAaDlY15rysuz6DG/8vREtkN9K/4dkiLTcyRIMmZbQNERXGHv7wXBQiIdkD2ntA3hT5joyjP2AUoYMhwz/U4qP6PuW93xzPJBsr8exYEm9VOpx1mf/4nvSEKV+zuVf1yj23kyMOihJN7gklNAxK6m1Crqjq9iSjFbSdFoi61SxXNeNoyJVBgiTLCUV1UtCSkettkjLYfUwvhqMk1g724rPaaoLH1AI87sU+wDxsmjLsSbUOq37bN3yvbR46z/Rlb1emdG/skA+zy6Z7dOPOnEMQMg55VcuWNzHGk/PNXKaruOZA4pfowoCnlRAXuFzVmU9iXaJscNYl4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nvfaXTt36PlWNQvU9gSS6MR0SAaztPatfjSRHaVp66HruJMOIGMhgEl39NnC?=
 =?us-ascii?Q?zRLCtHdIB8Kvy44TDtxfntD9BqZbzHVgLcjpn64vGF4V2SD0nSYobHoqN4oH?=
 =?us-ascii?Q?Qx6woaHSaS6ajBqpYCwDCCyzxBO+BOIC499ZgqZTOY2LIR/GsQHXSPoU8E/p?=
 =?us-ascii?Q?HcpmiG8GziyjSDpgkyz19rQk14Le+qUIu7zXJyI00gszdd+kIxp+5vsQh/gZ?=
 =?us-ascii?Q?FSmbwNoKbvEIrsAa3FCTSm0Qd9CpPpi2vZ4eK+lXMEg59C6XG56mCm5ThrkQ?=
 =?us-ascii?Q?8Epi3sd1aNoJKnb39md1vItxgcd4mELsUS2xbv5IA+rfgYJssMh1qWSRwfFY?=
 =?us-ascii?Q?SFIu3FrrQJlFzFm1cveEpSZJPm0ySjkS279u/JmWnOqSpiBSvKTq0AiOU3O2?=
 =?us-ascii?Q?ugxp+Bjx3IOC4wzERWGZJkvOLh7b2XPmuB8NnwXCv76uj903sO5Dt9ese+33?=
 =?us-ascii?Q?B/i/+mSOZopU7rEAEwEaNxRs+htm4ZrpFJdNe9dAb2cX/DmLpmpY1KYnR2kT?=
 =?us-ascii?Q?WHSBrBdyTWYwpxztI0Yx1gSztViwcLiH7JR5qfSrzt+ad2aetuJmKTQaltZy?=
 =?us-ascii?Q?NYGshpvy/da55effx4hgY4pkqqXSpAL7nFqADeRu1eWEGWWf82mMM8XR+Vhf?=
 =?us-ascii?Q?pOJ2++kCRlb4lIKYtFzZ1kM7tCFQsPwaEdSDfSvB9LFOgVzw/OjDsE+Lg9yG?=
 =?us-ascii?Q?7/XCUjtC8RG23hgKUCeYW4flvG6ttd1rRdLl3kUkphMfHWPg8AGkRVOrXu+y?=
 =?us-ascii?Q?WMhJoPmcs39Ehya792fBcC3MCmO8qLg95szFasVn/hyZXN6nj9qpW70tEppv?=
 =?us-ascii?Q?ZV9IWGxXuQeLh6IQO1UI0Tcb/7LIsAahZtFgo5oLcfA4Uu7vRa7Bb5PULeA4?=
 =?us-ascii?Q?odO5o1qqXnY9EohiYAxW9qoiyaW3wFsGhuAq6aiP15sLQp+6swXloSTrRTTS?=
 =?us-ascii?Q?CIT491NiQtEjmHhPQE8/HSOqE1GnNV7WhAWAIp08ZZnWVMa3LDRdCCjw7RNC?=
 =?us-ascii?Q?cK8U6s0PmMjlTA7Rp8ikuZDGvEKS21l7SUNTC9gxeSVuVuc2/N/k5U+Hrg5M?=
 =?us-ascii?Q?WgsJhv5YcUpnpK8w6abCcrvYZHIIZvwx/fKT1n0oZZ/zrq4J7hNHiw8VzGEy?=
 =?us-ascii?Q?cNRJzlcZn4CN8tbsMvtEonQOBLhP8NmoXxLKVcg0s/8ThjGaMwHpMFQkSYtT?=
 =?us-ascii?Q?wtWSZmvmlFqAJtvrK4yldI+YhS3//O6GqWyrTzukshbQLEZ3JcEVRXJO1EPK?=
 =?us-ascii?Q?5TNvVCNj8lUOdluHZGKY3swES0Ia9gjKHOAtRAU2MVHPrSgy6Z/kDA1K8VLO?=
 =?us-ascii?Q?8c9towX++lu9vpMX6UkppXHccHHIwBWkNl5+TDGPPLCi2pebz1C/H9h7Oo7h?=
 =?us-ascii?Q?2L49I6PQCGly+xGJgGHs6BVqdytJ70ozuycoGsooZctRgw+dVOEhOIHT405k?=
 =?us-ascii?Q?NYakcDW2EOXLYaQ6KPJTdauxiEu1PF/rb3KdGtmgJRq3KqN6rAhJUIk+/yCm?=
 =?us-ascii?Q?odclxRqlEZIVL9tKyZJJaRxyIyL6Qrhq+W4jfwORTREysPMe+l+59kqawzh2?=
 =?us-ascii?Q?+69iF8QCz3ScGkzQI+EhLMpDKBcvYyLspdR6rPAbv4Jd/SXN2p3K/7K5UUGz?=
 =?us-ascii?Q?pxUMmQSWK0qRgNBN1tYT0GWGDtsPMfEWo+meO7F3nvq8dOLxMJ0jnrlDYsxx?=
 =?us-ascii?Q?A3S4Y6aszJttr+i2LGeEA3UVK2xYOPH4IddLU7ad1/LFZpttjjfcU2EsB/0A?=
 =?us-ascii?Q?fj88oKywpeCsl2ETwFPJphUhrYDK9wO8ODdYgGm17HqoXaS63bMD?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee98040-7b3b-43ff-5d40-08de955b0c2d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:39:01.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPWn5NFDn674ECwnlAocCmFQYwOPa4z2BwnDLtEmiAhoJEgobzfjSGBGyJygACzcwM8Sru9L5L/WpxQpFmCktQbjmd9EoIwipnpKSwP+6XuFulEP6GjI5Onzl8Bxuhoz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13668
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30982-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,bp.renesas.com:dkim,bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 164663BAB21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
port@1 in the ports node.

Fixes: 2ef7cb1cea7d ("dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings")
Cc: stable@vger.kernel.org
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - New patch.

 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..5add3b832eab 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -102,6 +102,7 @@ allOf:
           properties:
             port@0:
               description: DPI
+            port@1: false
 
           required:
             - port@0
-- 
2.43.0



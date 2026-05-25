Return-Path: <linux-renesas-soc+bounces-33082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BtYEWktFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:07:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BA95C9A37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC144303F441
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC6137D125;
	Mon, 25 May 2026 11:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kUK+/uB7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7737C928;
	Mon, 25 May 2026 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707106; cv=fail; b=mUdQwHR2tgTB69Mia+gWhjxqKs4zkzBZLXSDGUq3f7j2ISYfDGT0gY4FVoIMUy1U5hsYZhDkjXxKKgBnGrtIPlLsxr3PRZt/XqnM9zS0f4WULsd3ew6QLGTnhZjVLjROrQHMgnA+9AdVcCRnJTu4QNpb4Br4CR9360ea2Pyne1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707106; c=relaxed/simple;
	bh=+nTHoEFiJbOuH/fXdYmMXO15i59QQ1++VeAi+5NLWTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RyeiKow2Z11nmiw4Hjk+JEDHh2uty5bGXID2jqJuTTz31RkxXuYZN+84Yvmzg9T3YvovCf1pSH7WZ0e98RmzGkV/m53G0muzsEd1mCOTbdpBzuSakZQgZhqPfPTXz9hUkqVRIQsjieg/yVqcZzGKFNabpZiB/qm9iCzlOX728F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kUK+/uB7; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgY1PMMHcmZ5JzeWGYDdfxwOQVLRyqcAPbCZeWaXgwnP0TOCTBMkSeR4OquAsmDQaADmvs4cGJo5TRXV7G8mrBIU/kGKQGA6IeUnkOVNlzfNHwpcYJWI2Qgj6lwzFRGxyHqx0Kq94KNI+RZ4fhAV+M74MI1m6FgpppCMcS+PLy+cvp9NIAe3DF4LVBhda+NXp+NZGk4/tuDlNGi1WPdKIlz0IX8AEwfMOfbXlje/ZGZRR3K7cbmYt9PuV0Z/EHSBBLQRQUO1OksFVFNHkqpVYN1jOb8iGl1qEZx4ijnwb7Idb7L8tocRUkEV7jDOWts/XO5EyglfPOmbh2QKQsIa9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN88kXSdCUCoOzPFT58hoEv1sayeDVV6ZBCdUeQhj1I=;
 b=R6xKWgRzVp/KJBZtgNcLgwRuAjgfE6CGYvPlVWZg+KBmPwowYo2PG5ISY7F4xtufzn+jgNSWR2yNlYP4Y0cLhRN6rEMdvy8iDrWkcNivRgsrUM2hfEydrq/BGOjFCbqFmLV6+KnVYwtcLafcMa6PxOgVdNmHwLK4Ts7QPstsyX0oLcS9YwVBZ5KEZXb/G5HOYEYFJwUvbK/6Bmfz4LImjnIoW9DijZuFoXcsekznmabJFRa+rJ/yImnsnTJjEbSJB7W90IBecX4Ug8KnnqyDxMQIs5oBgwntIUvL7EwnvwesGfTk65fDtfae1z0+lJakcNZOMSUBHZkF+pbLuM0M0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN88kXSdCUCoOzPFT58hoEv1sayeDVV6ZBCdUeQhj1I=;
 b=kUK+/uB7wsYK9LwfFzbPJnatvscUYaWT18vA9pmrF9rpUTv+Lw37+bI/tfuptIFAxO7JQ7PP3yR4jEmYnb0+6DnJm5RzdaQcldJiuU+SBuDpgvSvmrHiJARfJerd2/vLQKH+R081oH4l1/ecRMP3RWLSPcWgtIxDWZqdiT6AxtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:05:01 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:05:01 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v7 15/18] ASoC: rsnd: src: Acquire shared SCU clocks for RZ/G3E
Date: Mon, 25 May 2026 11:02:27 +0000
Message-Id: <20260525110230.4014435-16-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0180.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::6) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7e9768-4554-4054-e4c8-08deba4d7793
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n/zmjsVF4SSPO4XXOs/dF8fYw6TkIbW1p3jFizxvbV9eQ/gkrTQyfSnDi98aVpYl4nS8DF4NYPZUIYwQYScJBWZwmqnq451k94CXNf/uu4LD+2ShIC50riXZZ0hzMFBPNO0Qmd4iKoCWfXXUg8F+wKpjCg1Cn31yM28w6Jv5Xpp2YUvRj2Lx6x5lPkkrE2D6WEW90SjG9jZ8w3SOk/L8ZwPzB3isVxmFiMLAzvoao5Y+BI7n9SOJLriRQ1We5/SoC3CRFQLUq2hs//KCooXtjkSMBc8jEm5fE7x+or9r1E/UEyP3MxbhM4P3BaL5WKrfZJQQyNGFsb02Mx7B3L1VR2E7vCvhbURGWJmQN8Ru3ODOxYcNG9ewWVVqDn1zs2ykxfFmaA8gt0Pm5hJbF1LMTI7dQRLsTqJWNmY0W3MZrsBatVlyU7i4R8sxhgsIdD86Esl/UWhHsoveKD3L3BjVsG2MAzPhmkRli7z2rvuiQR2WKmq6VTmTnoX1tvVqeDrirRAJK8/ZG0DS/2v6drPWKnmhIaFRKISHTeAiKbdWCcsxeacvbD6e3RFhAKivfhbkeiR0eJp4KWtttsaCoFXtP72fg23K3IDj2JTLnQ6SaKNnbC8JEeY1bHgkJ8u00wORrzuNjOaPtXIZT0OA2lkOv7CUZcVulhh8NFXV6MJnnpk1GrA8Oxg5LHvg4n2A6Dufjcm4MX69gfHArul+wn4WixqcNC3MAyeNqPu2AqG5zolUUaw5Nr1IpSX4WUplHFVE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NI3EpgXwv389zEAXx9UQppnHKSAmTP8p394mY1qK/hWlw9MymcwAmQsW1qv+?=
 =?us-ascii?Q?ivB4/XR4qzQmrz0AaTyHcSPB6HtkfqaRDzTlZKWrj042+Qid8cpgrthjc69s?=
 =?us-ascii?Q?Ux1J5ELTz5Gtxl7vU0kSrT+6nyQDt5nuXy5MM4+29166sxbthrvbBF6l7mnb?=
 =?us-ascii?Q?9khbJjjSk7leH2mv9aixO+yd1KkdM/kI4qlg8JOFaUFKY8j71wCjB5hebUxI?=
 =?us-ascii?Q?WMSEdJzJMpvj1j7raE0ZU4jOUxHP46odSkztODiLBnWT6fjzVQOX2U9QYcd1?=
 =?us-ascii?Q?cattBEigkN0BxBljpZLoLP4sfGx3+40feJrU6RIgICOpg4IRp6t98pIVlh+l?=
 =?us-ascii?Q?QLirS+mPwRHUdHWlYvNGsNQI4I7rTPiuZJcDHoFNotaZKW7mAq/0d/lzK3tM?=
 =?us-ascii?Q?EAuYA/9jXbjGdSvzK2nHbNewfPr4nr2kD2YnFm0peFJYvsAfbX6G1/uFVoMn?=
 =?us-ascii?Q?sbBuhih+gxYFheqy/3/EsMVjNFFpNMP+MwWOcfOE9bvhrdJ8uOkt7dV9MU8s?=
 =?us-ascii?Q?vkgQ3YsbpAhb8xUs8SnX/JI+aY6BJUWkJiuUX8LOCUYLURYYt5e5xpznagwI?=
 =?us-ascii?Q?woLnnxKOIHozeuFXMDvrMx/T146VSZdYVMvE5itLQkxLTl+wMHdgADfP/wMT?=
 =?us-ascii?Q?it4W4pQ0pBOryoxEjzRmV8RpW2XJtzLTpnUa9C7U1QftIXJGSGiRUbj3b6mQ?=
 =?us-ascii?Q?ejBqK+NVpOrz+fMcsYq4XfeyfWLeEojmuhcQgQhTKLOG6VHcVHd8KwgVzgOg?=
 =?us-ascii?Q?ZhTZMq+4lCbeXk5iXz0rMVwMa6Q1cJxp/Q53VLTpJiLjG0k7q7Ol7iVFP+bd?=
 =?us-ascii?Q?NWXMWuzSRAIUUP67ZmyHB7Zy+31ZXlu5YqdQ7l1M+2crERbtx8a0Q5XqQoeJ?=
 =?us-ascii?Q?rSLUS+xNwAozhQ//qTj+fUHqmvy+k+U79823XkDjDxXrCFO225dMksTyEx/C?=
 =?us-ascii?Q?ot9neyNrk/rBWLWrJQWaFc4+ooxJBsSaq+dwRCnbYuEzYSk2PH6LJL3HDHLV?=
 =?us-ascii?Q?k7sR2v47KQ2OJXsOxdL/O5Z1NNlQI3uwWrk2BRUfVLfHaRxxCr7MKsp4QmM3?=
 =?us-ascii?Q?NNxU+dwuGXjn54m6okjCucL89B7WwFwhnC+gQh8D6dSI6BcaMqWKXC4kguht?=
 =?us-ascii?Q?jrqJ5g/1hI7o+k/7tFjwNGcpl/ornm2EieF0Ir8vxxxPT1bkjMhmArjugDAx?=
 =?us-ascii?Q?+TbuQAhuP9fWLpQmWcjJ1jJyvKXYlkBxqiP5qhKCfwJf3L38NZDoCRI3xR0Q?=
 =?us-ascii?Q?AG2PQ4toH8CfZ+YPC5oCGS5fVy5Z/zCg/0aLgsiKzYqAtWp+ZWXdfQWqFOfw?=
 =?us-ascii?Q?5pFZBJ3dOPDMbKkR5L2yBLDSLEvK8OzccTQAfzXxoMTAm092+ucgZYeuwtat?=
 =?us-ascii?Q?jo5fQIRqD9QOuEKVObuMVyzf3/O2URo8oCOe+RldVNk6jgjekd6Gk5kpRz3K?=
 =?us-ascii?Q?XkE8kCHyN+Eg658UG58GUwnYEW6aRqXIS4JzRrtsITdpMIIVzpmK0rS0Mky0?=
 =?us-ascii?Q?ELljhSvVEQkW2TJOHp/1gmA1Bye4LeL6CKsluBEM5WcJo9BxQbZ0rYTKuBhX?=
 =?us-ascii?Q?+otBiOCh7RMTM44uNH8CFCqm7l2Uk374TJmLl6hLTLJnVLZHAN2KtHRXb2v5?=
 =?us-ascii?Q?vj7AhgRdqB3qOyYFy0pFLUU3aa2Yt6/FcXmXuYjUFn3Omrs3ls49OfS+6T0s?=
 =?us-ascii?Q?l5eMyKLiuUSacaZ8cT29HhIt0dWtiOsojU6dEB2lLUgHeZPO1geiipdg6vwo?=
 =?us-ascii?Q?bZljgTKAo2F1WpUmUma3174Rblgqctc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7e9768-4554-4054-e4c8-08deba4d7793
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:05:01.5576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj9RYzoEhRJZxBozOJrVzLt2WR1dgZXjUe+INH9Gvf5P9YprW0NJMc9SSf3qQAHak0ksjjlrnwcXvhgvhE+Xs81vk1wksFgmXS5EZPcJdJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33082-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B0BA95C9A37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
clock management:

 - scu:        SCU top-level module clock (CPG_CLKON_15.CLK6_ON)
 - scu_x2:     SCU top-level double-rate clock (CPG_CLKON_15.CLK7_ON)
 - scu_supply: SCU register-access / housekeeping clock
               (CPG_CLKON_23.CLK14_ON)

Without every one of them enabled, no SCU register is reachable.

Hold these in a new struct rsnd_src_ctrl and acquire them with
devm_clk_get_optional_enabled(). scu_supply is intentionally left
untouched by the system suspend/resume path added later in the
series, so SCU registers stay reachable across PM transitions.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: New patch. Split out of [PATCH v6 14/16] "ASoC: rsnd: src: Add
    SRC reset and clock support for RZ/G3E" per Kuninori Morimoto's
    request that the SCU clock and the SCU reset be independent
    changes. This patch carries only struct rsnd_src_ctrl and the
    scu / scu_x2 / scu_supply acquisition via
    devm_clk_get_optional_enabled(), so non-RZ/G3E DTs are
    unaffected.

 sound/soc/renesas/rcar/rsnd.h |  1 +
 sound/soc/renesas/rcar/src.c  | 37 +++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 95843a20c43c..7d7da6cecf09 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -698,6 +698,7 @@ struct rsnd_priv {
 	/*
 	 * below value will be filled on rsnd_src_probe()
 	 */
+	void *src_ctrl;
 	void *src;
 	int src_nr;
 
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 43abe13137bf..88ea9aad5cae 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -53,6 +53,14 @@ struct rsnd_src {
 	     ((pos) = (struct rsnd_src *)(priv)->src + i);	\
 	     i++)
 
+struct rsnd_src_ctrl {
+	struct clk *scu;
+	struct clk *scu_x2;
+	struct clk *scu_supply;
+};
+
+#define rsnd_priv_to_src_ctrl(priv) \
+	((struct rsnd_src_ctrl *)(priv)->src_ctrl)
 
 /*
  *		image of SRC (Sampling Rate Converter)
@@ -712,6 +720,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
+	struct rsnd_src_ctrl *src_ctrl;
 	struct rsnd_src *src;
 	struct clk *clk;
 	int i, nr, ret;
@@ -726,6 +735,12 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		goto rsnd_src_probe_done;
 	}
 
+	src_ctrl = devm_kzalloc(dev, sizeof(*src_ctrl), GFP_KERNEL);
+	if (!src_ctrl) {
+		ret = -ENOMEM;
+		goto rsnd_src_probe_done;
+	}
+
 	src	= devm_kcalloc(dev, nr, sizeof(*src), GFP_KERNEL);
 	if (!src) {
 		ret = -ENOMEM;
@@ -734,6 +749,28 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 
 	priv->src_nr	= nr;
 	priv->src	= src;
+	priv->src_ctrl	= src_ctrl;
+
+	src_ctrl->scu = devm_clk_get_optional_enabled(dev, "scu");
+	if (IS_ERR(src_ctrl->scu)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu),
+				    "failed to get scu clock\n");
+		goto rsnd_src_probe_done;
+	}
+
+	src_ctrl->scu_x2 = devm_clk_get_optional_enabled(dev, "scu_x2");
+	if (IS_ERR(src_ctrl->scu_x2)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu_x2),
+				    "failed to get scu_x2 clock\n");
+		goto rsnd_src_probe_done;
+	}
+
+	src_ctrl->scu_supply = devm_clk_get_optional_enabled(dev, "scu_supply");
+	if (IS_ERR(src_ctrl->scu_supply)) {
+		ret = dev_err_probe(dev, PTR_ERR(src_ctrl->scu_supply),
+				    "failed to get scu_supply clock\n");
+		goto rsnd_src_probe_done;
+	}
 
 	i = 0;
 	for_each_child_of_node_scoped(node, np) {
-- 
2.25.1



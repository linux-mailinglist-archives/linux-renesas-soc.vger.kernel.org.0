Return-Path: <linux-renesas-soc+bounces-33081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIwnKjkuFGp7KgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:10:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F95C9B7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 703AE302DF7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A27637D108;
	Mon, 25 May 2026 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RfCJzxyL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746437C928;
	Mon, 25 May 2026 11:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707100; cv=fail; b=GmIyiOWi0bZKLQgy/2fX4bqvrEA5gPxGDH0ljG/ullPj/m0jJtFK0gOc61FdSodr5TVtCyslR6059TtPfdKr9v3jlrbywyapci0kOK//VpXK59tfqcwekKu9jRyQaTkHF21tm9JwydmGzDjf75FXK60OxzJahE0OpWQX3WJmyMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707100; c=relaxed/simple;
	bh=Cgw5CXl+1d4qZZJsdzlce6RI/EXsdKXawAP4/f23p5o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TKlyXAdnUw3nuonKrZAyvuo+Mcd5sInWsLfL/z4v4FNQl7d02hVTONyvuOxJWSPCMjrFSvI98NOupOIHYgoCaJimRcV56ikEJut1TnwdYX9WR6XgDoe4ViSJYfywWuztzkLIfbTZttNvzx/E5UYuSh8bgBF0d7/XJTOByhUNJoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RfCJzxyL; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G34yiK7goXu1RhUWytQwNJyEgGMpvigyIsrgpHNVQHQOomdgFQzwjbUxyodb8asGLtgckLMLOKFNTfSu5ale8SBusi39MG723j6pOmmIJRz6TrWUV6S3HX8Zd/nyJlkC8CUvllpLhieoszw6pqFE0QJimpbGgR1dkAbTJmbQGSLymiyXHtzLOFtVgF68k/gxjXSng54jYfMncjfiSV0Focqb2tDbM1A6w6JF29BdKd7WdDUzRSkLwVjLsPsoly/8N4NYKVxYfe6+RYqIJ5c+TbLodUtXysKSUWcfJVpAglWG9fQQduNXN3V7e7NZBTQjmmOYxGOisPm540ocYrNb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKluPAhUZ2Yv5kCknOJaxeidnpPfN7r1Lr+cTTwAWKc=;
 b=iJhyZaCzYWl6OD70Eqg/wH/uDEvtuB+HHrcFpX5o2V1/AcTUWox+aa8NXdGGV2lV0Z8/Ae0VPGC8eSckttQ3Q0eL+dX8kc4J4aH52U3paLt0DgPxXur2RgOLFIhWbdyIyCRVxb8zosfWQ0ujGtlSLm3D856Hm+3WoN9wzXHMHicRi0lHKcf3UsAT6PVwtSeDoJ6Dx3TQTzaE+2biCBdtrffa1sXByB8LtsoYzEJprMK/daQ51yd0OAa/aYKfRiFPW+eaMwpMZTKu3Q+Ig5Nq/943fSyXFNR+pcQGLzv8c9BVMm4KYupmbaD79Zc1mFycbFNXo2QHCMc7wAoJLYpdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKluPAhUZ2Yv5kCknOJaxeidnpPfN7r1Lr+cTTwAWKc=;
 b=RfCJzxyLd+uhXeaSbsckgj19WzwBltHMwwc7lc5HiHeg+4cM69Yu7Xl+uT49u7yaggqSTCu2Ca8eJVfpzZPH7GqOzip9WNGENJL/hV2b4a58k62WZ3Kq3d7pXWcBmpjfv0q8H03PO/CweKieS0mytUfArnU4jvDcCV2T0+yPEcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:04:55 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:55 +0000
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
Subject: [PATCH v7 14/18] ASoC: rsnd: adg: Look up RZ/G3E clkin under audio-clk{a,b,c,i}
Date: Mon, 25 May 2026 11:02:26 +0000
Message-Id: <20260525110230.4014435-15-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 44372cb5-f0f8-4960-32e6-08deba4d73c9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EHbcchcQDZRbSdmbj+6A6tReg8u49vRoZk8aoWIKex5v22/GpXkFVqgqQdbxbwYSHBm+u/8CziEdvzHJfPsEYYJerUy0+qTOIuFUioF++wCBoDBzUhfzbXlpNQ+zoHnjOWHKLouGb5RYE8CJo3gdM/7XYiU4K9eGmS2ToDnTrNXzxkPJGnOsGy0CbGH5BTFy0DXRitoYZ4+08/rBlS3wR3OVw+CDMUHpm4u+lo8rXIY2CcVdzgPEFsZs3fSN2UOfuLrP10zCzWT0TvIPOGnP49KQrtrHvcu9jPP0TFvQMPjNEwHI43xLcT466IevPWgTjzj8KS1F1zSeGzBWagpwV0Ow76tyk2wjEAuA/4Nmp38zVpk5xidjSVdCrTulxCbYGAnDx5S1bLwXMWFMbuRVjldTZcjORKW5rEqINdxBCVj1SjnZZ/CfrhGzawCv/u3M/VDPTGXBRbSE/Atclyr7VP3G9EJzOPiGtSQ5nZSIE0uqkGeeQ3OjWnM6cAZBAw96H5T0eeLrLcZCYhB5oSl9dOISZPc5w5/kPNLBqUvqkxU0sEtOd3Aq4vHG1IRckbodo1zcaCKBiRjQcCiKmKry3O12850STGwxxyAWLz06ER6HDX0xQoQkJ8mxI5Cz7CO6rEbXf7bpEtEeFiBRPN0HG7ARtP/RIdGgcoUwOSjcbNPgLX4XOZ5zzbhWfJOHYyAdq9EMX6c+wuaQCLBgnws5/DJZl1ItGf80EGICR9hfAe/HVg4RCR9lAs6Es6EcanNs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?694KXahedcKUdVxjGEmydsfF7pnva/Gatocho9L41u5Lk/mtnSa0uGE5qTPT?=
 =?us-ascii?Q?TSbYhInqtkgIwzB5pMQwdbDYjbyhcnPr8ydy40+fmmV9IWcWPIbp45O17UGL?=
 =?us-ascii?Q?DgU49q+Ikyoz59GxtUF6lmp4u3g0oow5VHLa1opWM7kOqSI68NxfRVX36h2a?=
 =?us-ascii?Q?RF3138H42q5YCQ7CpmQwyYhTRZD11Ao2Er97jrqgNjWCcZez6USFiKGeBOom?=
 =?us-ascii?Q?Slhzpqf7A4jCCo1+4Q/8fN3YprCfeVxvd8IloNPqqb/QQsxmo3g2D5ZKIpLg?=
 =?us-ascii?Q?B/9erPXVtlciVibBHhYUWqPSQyVmWmlBFX0BiOtFgRhLHSsRYdrdFit5owJD?=
 =?us-ascii?Q?LRJzit/D99b0xZfd9P3vDn+V2mKiaITwZXx3utmw/KjtXxqj0vW5ppC9E4KP?=
 =?us-ascii?Q?dx0y+g3zRl5o3qfLB8K4y+WWBHmSsOnSAcuq2eZFSSTOGPUZPqgDjGvMNKIJ?=
 =?us-ascii?Q?cz6Ynn7f1fDRQ9rdhgvb7Co6gQEx6wXVDyG81/ZHejzx1fEo2tFbgUY6JJkM?=
 =?us-ascii?Q?O7c3ds9K2ziiSPO8YNwtGEKRaUblJP4C2IyxcCKdyBf7UCa09rCHScfkQtZe?=
 =?us-ascii?Q?mNeu4pVdXAwlhVDsvG+xXqEb2ek5mEdwj7FCIqMTEzCD1T9d9j9soGTxlgXj?=
 =?us-ascii?Q?5p3VPXx4Ir7AptGbeiK8UhGyDrKMq0G0KqAbWEsmWnq2jBe+Qn80HMuHNrUT?=
 =?us-ascii?Q?VxhhdQgdnnBxzXLS0MnFyEAu8AkxNU6IRPoPDRKPhmUlfNinRdDaojIMYH6+?=
 =?us-ascii?Q?6I5iOS3iDBnVFf65G/488U/xwRblhnG2q5aMmZVUF36+oxlNT/8esrrFA+RZ?=
 =?us-ascii?Q?6ZeFqmis3cfrIA/WwJAF8Djmya9wVy+msD5o7sqqXodRA9JY0FunGmcHStVr?=
 =?us-ascii?Q?krQqVrqpA/p65fw7TA5W3gKqzfXsiZdLBEe6Zw4w1cCD77OZqpkBlDABS6j4?=
 =?us-ascii?Q?zM6zSx8IO54OPVj8XRMhW+ypTsqkKjP5ly4cOcH8Vs+3x6hIZdH5jU8oXHaB?=
 =?us-ascii?Q?y+nnSCVV846fePM1GkoHV2+dosrh+R3AUM+LfWJFEDwqJe0i4WNKieH0AkZb?=
 =?us-ascii?Q?QjKo3VuLjvflbCvma+jZAtKNHt7soKFKQhsryQKpRqE3UTfmY0zy1hiYW9kY?=
 =?us-ascii?Q?QOlIID3cbDwOLlrezdMsaxKLhXShagwjEoBVUL+hZFiBakAIcVZYneXVrxlk?=
 =?us-ascii?Q?WzyfQETKQsgCPgRtUkYSioQBhWxOZyUkmyJPfQt/F2cmBIvgpscn8i8mKo5f?=
 =?us-ascii?Q?kNCmdkACcW4PbyvD8qlSM+gDhY+itZTxwtFQsjP7TgYZdNpZo1ac25MNG0N3?=
 =?us-ascii?Q?XQmUF4GXhtvwHHqVXxVYUySdViYRml9WIT273kPbFFoi9rit60CnZMP6Y3mQ?=
 =?us-ascii?Q?uAW70OpKFEVvArFllXB/U2oWKnI9vpb6BNLByUz9xKH3ZThmkoAJVTtAKZl7?=
 =?us-ascii?Q?8v42ZXy7nvyPhi9TEa0IKanVTseHa++CtkZpruHHfZTE4vpmisQ3vWxKwTCv?=
 =?us-ascii?Q?8s73BZVr2nB+YJvBXTM1UCsbajR28FSc7KewbpKr3lDI72TJxpVWKUMAgcHV?=
 =?us-ascii?Q?87knrErbvLzxVyXwogU3leJ678YARyT99FRSIvhI9WqqZPNHQVHyRrJpoy31?=
 =?us-ascii?Q?s56Z1kCCZTYmGQ8oQ3XOITXkF79CfwYfQfZZI085B7SEWp3DJh9QO3J98mmV?=
 =?us-ascii?Q?fe1t/T9i7/pmoK58V8GAPCTRqfMCLDk+h9S7bQLwFCaJYGYkvncof+sk2vzk?=
 =?us-ascii?Q?A3u0J8KG3yjj3JE9faw8Qmn/3jYo4co=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44372cb5-f0f8-4960-32e6-08deba4d73c9
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:55.4259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVazqqF6sNBq0WILmp9zFnIqlAMR1gYBB+XCe7q+FppNYpl02pl6uggYwXw5wS/Am3zF80szzoJPj7PcP9/tyVV0c9+2MqV4ci4NOR7nRRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33081-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 037F95C9B7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The R-Car Sound ADG block has up to four external master-clock inputs
named CLKA, CLKB, CLKC and CLKI by the silicon. On Gen2 R-Car these
come from DT under the legacy names "clk_a", "clk_b", "clk_c", "clk_i"
defined by renesas,rsnd.yaml. Gen4 collapses them to a single "clkin".

The new standalone RZ/G3E sound binding (renesas,r9a09g047-sound.yaml)
uses the standard DT naming convention with a vendor-meaningful prefix
that matches the SoC datasheet pin labels: "audio-clka", "audio-clkb",
"audio-clkc", "audio-clki".

Add a third clkin name table for RZ/G3E and dispatch to it from
rsnd_adg_get_clkin() in the same style as the existing Gen4 branch.
The CLKA/B/C/I enum values, the clkin[] array, and the BRGA/BRGB
derivation are unchanged - only the DT lookup names differ.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: No changes

v6: New patch

 sound/soc/renesas/rcar/adg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 5dce62287d20..483979c24319 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -77,6 +77,13 @@ static const char * const clkin_name_gen2[] = {
 	[CLKI]	= "clk_i",
 };
 
+static const char * const clkin_name_rzg3e[] = {
+	[CLKA]	= "audio-clka",
+	[CLKB]	= "audio-clkb",
+	[CLKC]	= "audio-clkc",
+	[CLKI]	= "audio-clki",
+};
+
 static const char * const clkout_name_gen2[] = {
 	[CLKOUT]  = "audio_clkout",
 	[CLKOUT1] = "audio_clkout1",
@@ -574,6 +581,9 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 	if (rsnd_is_gen4(priv)) {
 		clkin_name = clkin_name_gen4;
 		clkin_size = ARRAY_SIZE(clkin_name_gen4);
+	} else if (rsnd_is_rzg3e(priv)) {
+		clkin_name = clkin_name_rzg3e;
+		clkin_size = ARRAY_SIZE(clkin_name_rzg3e);
 	}
 
 	/*
-- 
2.25.1



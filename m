Return-Path: <linux-renesas-soc+bounces-32511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDvvA1VyA2rH5wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:32:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D0527BD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6585E312016D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB1A39280A;
	Tue, 12 May 2026 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EyuNO7FG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F438D407;
	Tue, 12 May 2026 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610522; cv=fail; b=KVPznrzZ8CnhBZt7TDY5SAC2J1LxLU5GqbEcMoFDVnMDMG7Pc83f4ZYBEG0Hv4o4QcBt/9e03bQ7gf+4RCmQzcYKSmbG49t4zGedvMGRX5LGrdutQpxsOIU68FKJrBH7enWip9QfAbJ9J3paDmmPCmbqI7S+w4XUy5HoXXW+cOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610522; c=relaxed/simple;
	bh=vWLfDO2sQ+4GtBSnk7oxkNJ4Zek0ooHu67H3ZxJcxJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZDl93WCaBD+oyJ6q5oyJ3o055BI/q8TodHN0iSlGh4MCyQXbLJ3L4NFS8JmHqTkyfR6Ltj+Q2kSbmRcqOT/uKEqvJNnDdJLaAt8P+AkR7HXUzRkAgSWLqI1GPTTK4KfI2cl1Iqp83ifRl26WBA0K1Q9JuFm5hRa8I5AqAG3VXF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EyuNO7FG; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkqRiVs8VoEhj9DRXym2uWeHKgp00Lpe87/wMtNxbhyHJEHDur40CIJoqvc1FiHz652nRIO/vqQjPS+j+xZhgzB+gmBJjlfHg81FXln0LGfdOaodgINTT0mi9Y2/OxVHcI1CbkKrHDYF1VzQOQ8oAowdKJl71Acdi6js9zRyo+AKhKA6LRE2XzVuSwhmjpOSTkTHkgkLDdDnGwrkKa7OzDE8pytvyPH6yBRBIAs0G0mfVb7r1bjImrdqan30WZakdA1gYhHsVS8dHqgoO3milX2EmaPxAbnUfuJJTFdRbBZzusG7A38pldEE9kc2l/+VEweO/HzDsSQ2eUVZS8NO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZcYO2o9hQGqVguKl6PDasT2CYH9JKmSntLvjXaKTbc=;
 b=X4BJP+V60dCUmlWsGi6C17JoKGi8K7TyoET8OtavxZprww/KMH9j6AOvwtCDCCUz7+myWFJwRf1YHayvGbTI+PTAGTrZztbkJvBCZbcj6dzPLvu3b7p6VhoJfeny6pke62/lMflIISWztqEHev78kv54/RcfxxSafBk8TLsylUcoQ7i/xCYk1RqbmEZwkD5MRL1kOTgKf+c8c6Fzzi7RbO30PzYoHc6Eij021US5MWGx6zIWzpkMkTCuhHWCY6jHpRpLjqtS8emOt1/MH66fIwRnA5/kLXfYI0s0by/8ag3/lFaGlctgx0vj3KhRuIngZnANVBmAZmqQbB4rwn8/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZcYO2o9hQGqVguKl6PDasT2CYH9JKmSntLvjXaKTbc=;
 b=EyuNO7FGtwked+8K3yarWcoMiw7Agpu8MLXUvQSb5NCe/Upfua9wlDacMtbCPho2bpAImwmbJMepJMoXsJ/+C1DPUdnWpu38fxBAnx0bQyK73fR9TxCHYiKjWA8V8BkgxzRzOAJypYtq/A5M6wxqhc60qBcl2BzG/BPjU1Y1QRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:28:35 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:35 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH v6 08/16] ASoC: rsnd: Add RZ/G3E DMA address calculation support
Date: Tue, 12 May 2026 18:26:23 +0000
Message-Id: <20260512182631.3842065-9-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::17) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYYPR01MB13037:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1c1465-d640-40cf-c246-08deb0544743
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	jMuJQP5qn41BxzvZLctJ5slek1Q1Y+9JVLdDGKxfL+LT/rwwCIUjVmfFG8Hok/DjhxVea2oOpiX8PVfkELXulxx9hvxeXtR+sDOzO1ksnhpb1Ghp0z7J4JLwqSEe1eF3Jr8IwRdvy3bAMHOg+U52zt2n//BaCWav9efzrbxj9qMlUBJRwCFTViOWKbRGDxDUay/vSWPYBkRHTsBk7paDKMHP5IaFn0VlJF037M4cUtRC7haWHhmT4RP78CqhIbyKAagBSVh3vTMVlOqj/wLWmX3XByla0x/U83rwhpnsti+6mUjiW3jA2UltihlG17+Wdgt2vENnno/jD6ULNAvIdbx5pshnhTN7Cx73YZqdg1gwlLXFrp+nYS1OHO46eMAO/UmFXN5fKY0/mq0naQfbcB7nP985bhXMGyxvLqIii9RKpvjjKdw1kicCWO40AlHNN8/SbiravGEgdX4oGVKIJCcnYan8HTJIzI21ijqpdawe5zGq5CJH05YobiA3ZzI6hM+vk9hc6z4R4oAch1DJB9zNQ33kLdV8DVh+s5kVfwGMMptwpN8QFI0d/ckR3XR/1cKEbxxqzu4+G92PvA9dDv8qtwn9GQzbYjEfFuD6liPOjsY3hEfz/zuMtRnw1nyLDh9zPr1DihR0If/sZlikZo98BzGxHSPc2yLxgeWWEoBvFgQJ6R3glZvv30Z7QIjxrjald4ok+Ewpno5UGQtEDCHrIpITZR+6NelMkuWq7VeD3g9FAfE3FuuLF1sobNv2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R+xi/9Dt+lxaNKbb3CQTjCi4Vh3hF0aGlgM89HLg1leBFk7Bk+w9aYWDqr0P?=
 =?us-ascii?Q?rCE7XyRhHoumGNDGWS29TMWaxbV2Uw088SpeRZM/2hyLAmTq1UA91YJihu0P?=
 =?us-ascii?Q?OW+2jPtPiLx0UcpF1OOZg81vL8u0MFwTNgUy+7DmozTzdnk2hBh+68Xokn+H?=
 =?us-ascii?Q?3IPYQO7MTUDAI0iJU2iH+Quhl2T+vIRFP9ixWrb+cp+H81r1w1oatsK4HnUy?=
 =?us-ascii?Q?L0NrRHRshtTaxp/f8hUlSsBCnUJoQvBVFG4FmzD+ScGjkR3dNJ88yc+hDvAp?=
 =?us-ascii?Q?wQSNWhEA/vbfOTSSzxEJgUu0uUu6e8p64XCxhy2sYD1iRvuK5tBtZcJe429n?=
 =?us-ascii?Q?qst5um3ql7jgU42oOXR1GGHA5lRzvM/l7WZUhw+XtJBjrIaexC0Lr0RncclB?=
 =?us-ascii?Q?obOctz79snD+0nssZHyvS1N7QJwGWXC/QpvCv2oOc/TW6+hsAH7/wcEYfPdP?=
 =?us-ascii?Q?I2ZDcXcgiWZUS+lfbyVn6g63Ctz1jXdEeZb0bnL7wvYmI9PXK3QlWfpyv2q8?=
 =?us-ascii?Q?aONokf2mpz8YMqyRB+GN4XFEixFYL4wejMdYLCZu45/AoYaJDZWbRKc8IbcF?=
 =?us-ascii?Q?x0mWoHMkXHWcyjmnakOUiOOdaM4qk9PRRvfBHxRqZ6zK9zC3YbclYbHYfxxv?=
 =?us-ascii?Q?6lhdDqUZiO5I4H+KxW7/1jJZa6DKTIvQwDigvLNwMbpzCOqpK52vKCkmZ/mF?=
 =?us-ascii?Q?PbNqLtz7/IH7mJEhJNc8PxxFrR26PCh14BH5A9yh14PiuBGOWfTIMjkZne7+?=
 =?us-ascii?Q?IfCOQqev4S45ep6mCskRwtfsgnbM/RmAQuZfDTjlQMu6xiHgKU34P/dc8H6j?=
 =?us-ascii?Q?OivkDYJjbmyzMKIs80ZU57/BGiVeiAlYnTdgyzChvoIjzU7a7v/nV5gnSEqS?=
 =?us-ascii?Q?nnDjsfgomKrEf+yNIlz/LcKD9ctryIOojN5ax8RSbj7yLDrm0cbFRjBOg+5Z?=
 =?us-ascii?Q?K3CwRyaUoNtWjCuFZ5qYCpZXe3hIqrUDMGkM0TYL1MSfxX2G9k40RWeUV2XH?=
 =?us-ascii?Q?J5HxHcWT4ZR+LXF/WsK9WhQQ8i9aiFsHWnE7p85t8KhMVi2wFLUX2+zSQTG5?=
 =?us-ascii?Q?3zjJeI0QJx1gWEsN6+Q4QDo3P3ycky0DUtAQUhNwmxKypVsjHK6ph/J5Ex7M?=
 =?us-ascii?Q?cK4N6usgd/A518FSa0KWj0+y4zdI2rmEFAQLB8iuHdCIv5QGeqkrvtQEL9T3?=
 =?us-ascii?Q?QT6kAvD0C0EBQsicgEpyJZdninl806XBj3+1uDtm7MpzsNSD84DdGalru3nt?=
 =?us-ascii?Q?v/fq6CJBkBiwEepqqyQstiJ88aN+wF81M5aNl+8rEfd+FbRJzbXFIafj8eG5?=
 =?us-ascii?Q?nOqTprIpSPkTFoUNL+1sXD7yrILZ/z6j1OOiU1r9k8eoaTtsALj6oDj2BZME?=
 =?us-ascii?Q?vJ4OZilsFBqAHikijgpW0c04IJ0YpS/4iz/4emUeBD/Uq/dpwMcty2GhnZRt?=
 =?us-ascii?Q?HVSm++ssdRs73jHnCuvsLothQu/unKwUC273XJDcCJHx3Dul+tHlIuduOeOk?=
 =?us-ascii?Q?0T4h4XktTxM1CzQTMKiOcad3LtoVwTLTJ1Dt3KYoH1ddmQdKLqo+uU35rkpQ?=
 =?us-ascii?Q?bGYytgkoAQhjFJmPtnvoW9aXVJGT75ATTVQ991/4orCoNhv7TG3IoYkRI00a?=
 =?us-ascii?Q?CaCk6Id7+rmCV4FJmtY/ZDq3E7Asz58AC2JJ6ndRhebBJ4Eau8fSItZy96Eu?=
 =?us-ascii?Q?kiwE20o2gi7v+1X+FuNznvXCrK42h3+DffwKmeht3ykOBO0i8YrmOylE+Kgj?=
 =?us-ascii?Q?797sA5PmzsyWdnPbskR15wsRPfUMUVU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1c1465-d640-40cf-c246-08deb0544743
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:35.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aY4Re0hMhiBC3DwUVl+EBdc2SaqHgU678gDfZQrmhJyghF1LGymGaWh5h9mjK2Cj30B/bh7MHjqTL2cCcrGv3+NzLaD3JmtVg8XLUxb5NSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: 819D0527BD6
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32511-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

RZ/G3E has different DMA register base addresses and offset
calculations compared to R-Car platforms.

Add dedicated rsnd_rzg3e_dma_addr() function with dispatch from
rsnd_dma_addr(), following the existing per-generation pattern.
The function reuses rsnd_dma_addr_lookup() and rsnd_dma_addr_map.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes

v5:
 - Split from v4 patch 06/12 per Kuninori's request.
 - Move G3E DMA address comment block into rsnd_rzg3e_dma_addr()
   per Kuninori's request.

v4:
 - Replace raw [3][2][3] DMA address array with named structs
   rsnd_dma_addr_dir and rsnd_dma_addr_map. Use designated
   initializers in both rsnd_gen2_dma_addr() and
   rsnd_rzg3e_dma_addr().

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/dma.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 24c23cb89390..ede0123d40eb 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -644,6 +644,85 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
 }
 
+/*
+ *	ex) G3E case
+ *	      mod        / DMAC in    / DMAC out   / DMAC PP in / DMAC pp out
+ *	SSI : 0x13C31000 / 0x13C40000 / 0x13C40000
+ *	SSIU: 0x13C31000 / 0x13C40000 / 0x13C40000 / 0xEC400000 / 0xEC400000
+ *	SCU : 0x13C00000 / 0x13C10000 / 0x13C14000 / 0xEC300000 / 0xEC304000
+ *	CMD : 0x13C00000 /            / 0x13C18000                0xEC308000
+ */
+
+/* RZ/G3E DMA address macros */
+#define RDMA_SSI_I_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * i))
+#define RDMA_SSI_O_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * i))
+
+#define RDMA_SSIU_I_N_G3E(addr, i, j)	(addr ##_reg + 0x0000F000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
+#define RDMA_SSIU_O_N_G3E(addr, i, j)	RDMA_SSIU_I_N_G3E(addr, i, j)
+
+#define RDMA_SSIU_I_P_G3E(addr, i, j)	(addr ##_reg + 0xD87CF000 + (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9) * ((j) / 4)))
+#define RDMA_SSIU_O_P_G3E(addr, i, j)	RDMA_SSIU_I_P_G3E(addr, i, j)
+
+#define RDMA_SRC_I_N_G3E(addr, i)	(addr ##_reg + 0x00010000 + (0x400 * i))
+#define RDMA_SRC_O_N_G3E(addr, i)	(addr ##_reg + 0x00014000 + (0x400 * i))
+
+#define RDMA_SRC_I_P_G3E(addr, i)	(addr ##_reg + 0xD8700000 + (0x400 * i))
+#define RDMA_SRC_O_P_G3E(addr, i)	(addr ##_reg + 0xD8704000 + (0x400 * i))
+
+#define RDMA_CMD_O_N_G3E(addr, i)	(addr ##_reg + 0x00018000 + (0x400 * i))
+#define RDMA_CMD_O_P_G3E(addr, i)	(addr ##_reg + 0xD8708000 + (0x400 * i))
+
+static dma_addr_t
+rsnd_rzg3e_dma_addr(struct rsnd_dai_stream *io,
+		    struct rsnd_mod *mod, int is_play, int is_from)
+{
+	struct rsnd_priv *priv = rsnd_io_to_priv(io);
+	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
+	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
+	int id    = rsnd_mod_id(mod);
+	int busif = rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));
+	const struct rsnd_dma_addr_map map = {
+		.src = {
+			.capture = {
+				{ 0,					0 },
+				{ RDMA_SRC_O_N_G3E(src, id),		RDMA_SRC_I_P_G3E(src, id) },
+				{ RDMA_CMD_O_N_G3E(src, id),		RDMA_SRC_I_P_G3E(src, id) },
+			},
+			.playback = {
+				{ 0,					0 },
+				{ RDMA_SRC_O_P_G3E(src, id),		RDMA_SRC_I_N_G3E(src, id) },
+				{ RDMA_CMD_O_P_G3E(src, id),		RDMA_SRC_I_N_G3E(src, id) },
+			},
+		},
+		.ssi = {
+			.capture = {
+				{ RDMA_SSI_O_N_G3E(ssi, id),		0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,		RDMA_SSI_I_N_G3E(ssi, id) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+			},
+		},
+		.ssiu = {
+			.capture = {
+				{ RDMA_SSIU_O_N_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P_G3E(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,		RDMA_SSIU_I_N_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+				{ 0,		RDMA_SSIU_I_P_G3E(ssi, id, busif) },
+			},
+		},
+	};
+
+	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
+}
+
 /*
  *	Gen4 DMA read/write register offset
  *
@@ -690,6 +769,8 @@ static dma_addr_t rsnd_dma_addr(struct rsnd_dai_stream *io,
 		return 0;
 	else if (rsnd_is_gen4(priv))
 		return rsnd_gen4_dma_addr(io, mod, is_play, is_from);
+	else if (rsnd_is_rzg3e(priv))
+		return rsnd_rzg3e_dma_addr(io, mod, is_play, is_from);
 	else
 		return rsnd_gen2_dma_addr(io, mod, is_play, is_from);
 }
-- 
2.25.1



Return-Path: <linux-renesas-soc+bounces-32505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKVUEc52A2pY6AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:51:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E4F5282F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FFFF30D38C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9130B385D77;
	Tue, 12 May 2026 18:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DIRnmYSd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632B3859D3;
	Tue, 12 May 2026 18:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610479; cv=fail; b=YIfcuXTENoi98F30RpASqgDKkk0H1fp/7qUXQvL3Gn/J72IshQ7mfCIRSUf1MN+bmfOQFTrcTajw7Pf1mislwtfj7aPhC3xt3CsKJo5BHIXFgIFY9LSeGQ0ucwtY4CQ0lwHqnaqmWk/hNYaIcsdnDiSaA71lO5rr6++bj8u+Yfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610479; c=relaxed/simple;
	bh=8wPlMTDOPTNZFAAIG2ZqAFwbjZBs2oFJz+qNI+O95TI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X8DLooUrp6DUTsRG3zg/xIacVdwrjbkeEXluDsIoW5+Ynjmj0yrCcqTifTFIn/S4no2Bezf6bWR7iCChnhVkcXm81skSkwzopB48R7NJN+RCao1672FlWgXqDJxWsA3KwcYwiN7RGVgykQTAqYRS5CvitkeIJyTKCnnHXhFaZpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DIRnmYSd; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlIuiP8sF81/Lt4hY8OvJGING9OgssPORQ7m+/5DWIPPeyxtZ7WrHPBV/HCrR0AwrD7ITZKB+E13KvTnDbNVdbigZ3KHaBPBMOSiyJL16nkwo19tGRSLFPQHD/AfepL/+NMEesgiohiuGTcz7IfTDc8vWx3KEHQ54NuvwuTkJOv373nsBulWGr+dI1CRU+2b8D7g4T58b8mUXtqk9KfL7p8Nf1rrVicxBWk8TWA2ol6YTz5GpF6NFX5z17//sBjW02Xig35foFtmjCFEzy7SKQ2r851tXfFQx1LqUhoc5T6/cFgCHPvq7xf45++Gy5jwR5jPjbqXzPaCeEWP9Iaeow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxst0qyXqHPo3SYrtQtKu98/gct6kYJBqyc3ZxFLEEE=;
 b=Hrk4ij1BAorhQqHVd5o4y8k6+x+9fspAj4KWh6qVrE6Zdrw+cyOevXO7tawTrEpWXEBJ/gXmHIswJfTfF5W9Jz5BdrKh5o1ddyeMdtvIl/FSlda+pfetyuhQUcqDGTAV/wcHznhESpeUkQzNOVA6XREpuMaxOKcn9BJtaN3438wG502G/+fcyQWTMlXpQcV50KiocYL/Sr9qgLgjxq8+Pabm/GLeIEL/KT++OZcb/QOn9MmCz+4dGhqDmKz1lOekMNbBBf+HWFDsL05lbUnpx5UHJRrV5Z/yaRXFkDvhxBBuSITPkfA57IAakUIjW8XQDinQ680AmNfwXChdUKQToQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxst0qyXqHPo3SYrtQtKu98/gct6kYJBqyc3ZxFLEEE=;
 b=DIRnmYSdRsb8IKKHtE6YXmdyllrNOWcCy3oaQ0/no91hT3zcPUJ+AgqktmN7srRG3tvipntLhfgKv0zH0octCHwf0iMKqUVECx2lwWB/eh1XIk84M8uhc0tC69pX9V4fUrKLL81Le8F8r5VPZfeW9ntG+ryJY77CqS5pcluSBfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8431.jpnprd01.prod.outlook.com (2603:1096:400:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 18:27:56 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:27:56 +0000
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
Subject: [PATCH v6 02/16] ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
Date: Tue, 12 May 2026 18:26:17 +0000
Message-Id: <20260512182631.3842065-3-john.madieu.xa@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYWPR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad71c35-5429-44c1-56aa-08deb0543015
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|18002099003|22082099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	OAz7TTSc4GRpzziqp+MkTweXRgcElAi+VO69lI+RjQIWm8Fbf1YAEBMVTEi/5hWTVmFu0bwhGmY/PbR7w3lH0bPhPjZWlIlTKCzN+divgFmbi2G6h1J/FgyO4hix28nRR+r1ZZEnvEr5k8k8Q5m/vfW+JmPZ0QAJ70BShx2PXtR/Bgwn6HU+LoGV8psuFe3bE00AVGpOxa03sNYIj7ylgR/ubJ9LjBqhhVhl2NKUit+EVUt+tPtjuTgdnICp7p08aC8AZzG1ngi7oMDjxAH0tQuSQ9gEQTllAdFgTHlw1tOd2WyeNEt53Tx7HC6un9ZclirQ7LnpEytAVvhR9cScy/LRUz0Un0rL7aHU6QM0I7NvC95OnAu+bvt56oC1CsXuzYGNCoHLaoSTY2xJ0miTOkVeAKuTU2EG1g+xeopkiyFGbqgmbiSr+AoP42sVLkmFE7dLbXoUF59pZX3hfIRcEHdDVkyuwBxEEmfy3ojiBXjG+c0J0JtmOfycrXQ7cpCe1QhCOM+MsHkLjv7l0sR7og3VuTkQeX4Bk07Jm2PiZLfe6XzCbwGpTMUOvOwNZggWTOcp7LkmfkuETEU4RWFrrNYQAtdaRR5j9tSil3jGJT4kIG5Ubhibt92/1Lt9rLJrl5ffEiIyNMJPynfRoaLuJpt9c+j5GyhT0OzzUjnI5VC82ianL+e7LgXdhHosDCPYQgdWb6fzR0elJyNPTeblTI2BvCANzAvgswNKeql9M3aKrC4mvP8d4xuKwwEcvEUe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OTkUD86TsiA2C+3vCgWQbuif9x7CRphgOaMVm71xFK84FWvNZsQJPVGhLQhF?=
 =?us-ascii?Q?BwWg5MLJKHvTjyI8PDN/WtEDR8stlc3QY+u2zAEsAWLu37S0ShrQGx66KYtZ?=
 =?us-ascii?Q?Vm0LVsd6PIFUtVc/TqrdCUnYKWOIc74ncqBeo9ilclfopLcq4Rg0SbSGIUa4?=
 =?us-ascii?Q?HeWPyBHGlAV/w9jWO5v/nz4Z8zEGD7bbfOQZUtOPplynPwgluuB7asRwlLzW?=
 =?us-ascii?Q?HnZjLBwlvCMS13wkvefd6HJj+x7hC/MyVd6xdbT6PV0tDbAeFwimd1k2/yKB?=
 =?us-ascii?Q?auS8rD2jknqmMxmG+oDuKKDn1Guui9JPXgOOSq8KkB26+QV3SYiVO5TqmJJK?=
 =?us-ascii?Q?in4SH9Q/jloe8C2nV7LlfTBx18ltb+AuPsIFlRl15Jr1Ohh27A00/GQ24GgT?=
 =?us-ascii?Q?RyY9ny0WeL9i+3F/m0BPjz7iyH44uhRq837zHT60HINNd1X5L8WFRjOnX9HQ?=
 =?us-ascii?Q?FfUa+AFL0KhDbfoE5rnSu6xfmx2E6MMXm6IuGGUHlFColdD9BZ/CBWN/N1L+?=
 =?us-ascii?Q?xlM4U8FtPNl6Irf7UuJ62wdykgs43LmTh6/9flpDjvtILK3X0Xq/7WWXWeyT?=
 =?us-ascii?Q?qUkjOH104zxtPiEZ6qHsrWvSDo+fDIHsA1gRCFYNQq35JDQjW3SVuuq3eWha?=
 =?us-ascii?Q?4lx4Xz/ifFmaPAA8vuvgylb5+Wg6lCaRMHXc9dgrmyxU8GDcdwvNVbSUKwC1?=
 =?us-ascii?Q?byg9YhjCfOThvvKPG/MxYpS8lug97CWRmzYNKUxfLJwxL7YkgvBPcf6g0JVJ?=
 =?us-ascii?Q?wUZcMA8QC58g+ry0fI/hwOliH3gZg0wvU70Vq1Y6xTnIIhs/PTZ+9EvsiRx4?=
 =?us-ascii?Q?X42l/3n1Q3rjfZCSG+stpLdQrDct5ztc/mmYe77lZDzeFAiZJU3eua7aeXZV?=
 =?us-ascii?Q?hEfRn0zRvrY3S+QbYzijgIfc2XgSleq75TQRo0eMVJ7mN/yEXyzIjyZVEMkP?=
 =?us-ascii?Q?gqtZ9FK6TD9iDG0bXHD+BmdMyWHZWU+0fHh/4Xa7qNIXZ42UtuCjVFwhMvPA?=
 =?us-ascii?Q?twmzYUODgWVxWrq7Dvhe6Zw2ydUw28b+WW1sQYRuC8EmdtB09FLSeWHPdL5x?=
 =?us-ascii?Q?PnlpxZxWeU8Y5yZ8rZSAl5jvctltcZUbgU3933rcJHpFrIOLWIrMFs+BIHoQ?=
 =?us-ascii?Q?imsXCt6kXSd/6frTkE3uOH/jwEasQT9IvSfH+YS2vdknXL80Rks+mmtQYc4o?=
 =?us-ascii?Q?hq7acf/yFvev8tMABmDDSIZNVd1h+jFKAz69D69hUZ4ukF+fJc2ycciJBKti?=
 =?us-ascii?Q?FGi4E9NsXgeyzQTo4hm1jvP6WN7owpu51racITKn4fk9CnrSpIGFDxdFhlAh?=
 =?us-ascii?Q?PbwFuBrHusfLMVZzxxCTEte+DAq3aCgq6zKS1P1QiMmN7ODVCR82V2/bl0XR?=
 =?us-ascii?Q?FNt24Tx3bnwLdFaZl6AkOJTNvLAxO9IVmk/GpdVIoXIiMT4p+PBsxeDUXwqb?=
 =?us-ascii?Q?7fjn4sqbThhGQjN7PuoA//MUn96hzQRy8ghPhZsyPq9NiHzWpdovVK3RxD9l?=
 =?us-ascii?Q?J9sN/fOob0qyCsYBUxStRwPjK3bzkhj7GEYqitmF9LNbMy/tQkDr/Q1JWSC/?=
 =?us-ascii?Q?tIXv3Myi1GATx/1Z87i6/3k5RlBIMlLvCP+BKpNMjAZK1pjyc7T6hbau1C6g?=
 =?us-ascii?Q?N9nmeGv/IUlNZLv+O+R27atGklT/lRHeZTA+T/VubDyxPkgMj1Myj0xp1lJN?=
 =?us-ascii?Q?t02g3i3MNcd5ZpsNm7vErCeAwEoMc6Yj6eeYYgIW4SghHOzeuEo7f2BmruMi?=
 =?us-ascii?Q?kGnWu5PEW0AINeDubhgPjqYbuQJ8ROw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad71c35-5429-44c1-56aa-08deb0543015
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:27:56.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnxca2mfveLQeuTJBieZaeWZ/f3CAhE1LLO82M9MmC6w6+4yknksGjo+YhBvK0T57qWyZ5q8ozfvMVYOFBPKXUq5q721U0DBh2iK7AMyazE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431
X-Rspamd-Queue-Id: D8E4F5282F8
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32505-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

RSND_SOC_MASK was defined as (0xFF << 4), spanning bits 4-11. This is
wider than needed since only nibble B (bits 7:4) is used for SoC
identifiers. Narrow it to (0xF << 4) to match the intended single-nibble
allocation and prevent overlap with bits 8-11 which will be used by
upcoming RZ series flags.

No functional change, since the only current user (RSND_SOC_E) fits
within a single nibble.

Fixes: ba164a49f8f7 ("ASoC: rsnd: src: Avoid a potential deadlock")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes

v5:
 - New patch. Extracted as a standalone bug-fix patch per
   Kuninori's request (previously embedded in patch 04/12 of v4).
 - Add Fixes: tag referencing the commit that introduced the mask.

 sound/soc/renesas/rcar/rsnd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 04c70690f7a2..3e666125959b 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -624,7 +624,7 @@ struct rsnd_priv {
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
 #define RSND_GEN4	(4 << 0)
-#define RSND_SOC_MASK	(0xFF << 4)
+#define RSND_SOC_MASK	(0xF << 4)
 #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
 
 	/*
-- 
2.25.1



Return-Path: <linux-renesas-soc+bounces-34575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EVEFJMgCRGoDnQoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 19:54:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3316E70B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 19:54:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=fk9LnqKH;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50A813038A3B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 17:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD33A3DEAE0;
	Tue, 30 Jun 2026 17:54:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D7F3A7F5D;
	Tue, 30 Jun 2026 17:54:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782842053; cv=fail; b=OlzEWRJRhZkAInplI74tadpC4wpb8mRRZiperXAV86KzZvYeoRZMr2tnnKV5kQx5L2TkPHTSSywCJqh+FGEZOGwbEKG9jWRI93Ps4rHwJYBul4KphTEKeKHVWIaPRjX6oNFG1xxIUEXX82htKvvU9Y1d/9m2bEas5bcjCBzW2O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782842053; c=relaxed/simple;
	bh=7gaLN17DSplUYywqtUJQc0EPaQ26/2B20rJchGQmYlI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gWExs3vIX1hgi/xBxegxEQu/l/ACwF3ERxV0NVlUK9nI84bb0Mx2vrwUZ87FL4yz7GfrWBnQkxv7pq5Dgnfto7QgGGANy6v/feQV50R32a9C6qQl6zTF7YH2cVD4dEubcZeIvGw+T8MNiRFd2Vf71jk5PvnHNx8fz5f4yXY3fN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fk9LnqKH; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkqc4ROWd8YPNDsj8WbzR27Fc7ears8gUiX/hfS04p1F1+/HcMKLwhhgVP4DhA90e8117N11k5hCBLx/Osd4O0Zp2hudGH3hc6kp4eKJtK5dWgYUfkOZAKgrHXxLb7vqPwAnEjwKFNHVEEPMWAhbu0CP2DNBQuR3B9FT8fwNm4Xh2spE8Ie6m6pKriR5OWHhUbWEuYqbgmOQV2G1uoqtol+UmGnf8gxN8msv7TuKOh6/Z3O3/ELfTmUd+UoQwizouMCB1fx0VH2bdEb5TMK2OXk3AfneUAYvf4nKqSGjkNjU/bX/bPl4xi46+jZ/lGofuRFlFfAtYIRoCPS/vjIKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7n+aUQkGUBY/9hhSdIlD1jf1KXeIIDuH1aVRh/c2SI=;
 b=w3iclfHCq+qx+WZP2mpBRcNMgNfTLRhtWqKhmrRSITtqjiDwH1vlG4zkeLFA1uKIBBdUfKj1xIdLio4HHlm+KG/Smt0jt/rrnUp/jb49TCITN+dEjRpbfIFbuVKwnfIC+66VDnejcpa3my3uvsLoWy3BIM0BnRrJqMgs2xNKZBmLTivkwlV5d4n3czwx1hM+/AB7A1b/rUpyKwhlOE6xZ4tVpaly8RBkdgWEwhpn7t8xC7SoLT0asTQJe/XEc2RSod4kLkvoJazpgBJTCTTYOWoUXAbjLGAVTzBCDjoeUwk6xT3kAvfCX9DSEaTx+GVLGXvodndXZjtVrDbNxgybHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7n+aUQkGUBY/9hhSdIlD1jf1KXeIIDuH1aVRh/c2SI=;
 b=fk9LnqKHLXfVhYQOfSk8AkLfpUGJRGlnFhcjea+pgAQ+Mzgpx+MOmFm+7irLcPVtUApKnd6f0gCky7EbxpDEQnwlnmP2WYngUTeb4ntUoIywOPkGuDNXicQmfkqEvTxSktXFSv9DJpwesDYXvNgFlohMKVnGFqrkP5XOrzaNXqo=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB6727.jpnprd01.prod.outlook.com (2603:1096:604:111::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 17:54:08 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 17:54:08 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: john.madieu.xa@bp.renesas.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com
Subject: [PATCH] ASoC: rsnd: src: Add missing scu_supply clock to suspend/resume
Date: Tue, 30 Jun 2026 17:53:29 +0000
Message-Id: <20260630175329.4145703-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::32) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OSZPR01MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a406098-7fa8-4d3d-2b92-08ded6d09522
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|23010399003|1800799024|38350700014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	8EpsmAlaXri5vnEZmTOmv52Iya2rBgn0IgC10OMe8wrc42+DBSbpubEQhLptRSMs5y2B+NPF9T/aK/maYg9p0e75pOBPmmNOVs5vUS7kEY1IJpuhRjL8idbHoLq9Pb6dEXosNdVMNnv0D4YQuXecfmzv+5oWzr8ldDmgExBjMQRUvxBo8OjJS8yoMVK/aUpI9pcM2LSaz+2l30Yfv36mcs+Hb8grG5ao2ggqyihx7ROUxeKCkfm4rGsrqLQDOuw6w07HPt6qgrooKkx1WFgdf2Z+bKJorS9vA36BCMe4fTIeq+jYT6pP2cClhBK0dn66cv/3G6KuDcu8QOFUVV5YkEZZ20YGL7C/DAjB85v/VZ48MKfR0yG12E2T+RjUl/Ec0rT9+vsNEhU7cu5duoBXqklXMVLqc/gK3buLi7fhkzhvCYXtuKxEr1yof56aM8QQeScbbh7rHg4a10APNK5JEynfGba8OD2BcL0RdAfYve7/gfoKwWXU/xYopHgNn1qXZkipYeoQWXSCNLCZdsoil3we5P+RLHzMnne+wbRPrp5zm9CZ29StSCrBIuALsi2ebviYDlMpbcfq3HFQGWny5DVIAyqLx2FM8cRX++0WQEqfk0uGZDdqVm9mQeXzuIoXF1XBYYWqqDolUkluwTBI2H0rCFlGqvyTSWDeNCohLsyV6QIx0mlWVITr3bV9PtEVRaUWefX3DAh8EM7wat2P1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(23010399003)(1800799024)(38350700014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ejfph0Zk+yiBD5aW5UM/rpyI+ja/JgrM5FFTDR6BR2I6qLyvQVFRfSM8VHRL?=
 =?us-ascii?Q?el6xV8/+7sV7nxdch5F0mWdY7w4bG/o+jjLJ2Ehvc1/9y9p0acyetRpIhjP1?=
 =?us-ascii?Q?k2s7opkkyNkzlw7epkWT81ahZSWU8VwnauEYTwEm5vcFf6TEuL4b7nS/anUS?=
 =?us-ascii?Q?x5ZmYzvyDe0V4dI+DEMu6n3cX6863Qt/rn5nF54Um42RofM1dGJv3RZWG/GL?=
 =?us-ascii?Q?3Drro5xp+8FVntyDia3bZPv/QvA1Wg+sbkGiBBqwJyAxP8gBiDVK6irVWnOv?=
 =?us-ascii?Q?FKFBw+alWzdm5VV8mHT5lErk22eTTwlwzrKRgJ2HE/IMReNLcAHluDkzBUhu?=
 =?us-ascii?Q?GHlCbv97RjKGeN9o5KiskolBc370D8Xeh7Iio3mAWixF4zXOeaxkfmDw+sG4?=
 =?us-ascii?Q?wYAjgLkDgJ8ZYZpXEaFHQdHrqpPMddcD5IXKs0j6MCxmwDDdKaFFbmxOE3U+?=
 =?us-ascii?Q?EXO5srxo4YQzoTGEZLcPNIzwmjKga1hIWWt+sq6QyqZRZvuZXFjRIKwhFZuG?=
 =?us-ascii?Q?urKYQ/o1Bg91MqKuKWwmF6DpiHGACErQayaNX8bUbBj/ybeU+55U7paaEFUi?=
 =?us-ascii?Q?dJNYVrk+Xltb+dXPwrDNYih28LevZbcnFuphqz/XlfaPLM3IVn28nusFPMYB?=
 =?us-ascii?Q?kRwckUKse3ZFPosseWpSMW7ZqmpthSMfmV0gdInIJH7UvgSv0Ngx+blD/8wu?=
 =?us-ascii?Q?rRe/ORLXfOv6wRnb951ulvd5miDprQFj1SZ3JJbXm0sWq6azPgw9UWbQ40ny?=
 =?us-ascii?Q?5YZrHZse3UPBawl5MjoX1ztlgOCHNkjHqbci7PRcYiSX9AOV8//At3L5WkBf?=
 =?us-ascii?Q?Md4Qzs5DkrLfhDmjLr8SZB/X1PNuCWiciLt1LboeUNVEfhsUFpsQtac4kDHc?=
 =?us-ascii?Q?NYZRCx0uYhFmgZjGamtNZPDqBbn0kUCL7pYEceyMtYLCdhIw4HOVQxdUH6Rq?=
 =?us-ascii?Q?kJnst6yk4jyqgiet1UNI1qpOsM3HdTWoYcQ8XfMWxxueJJX5u/p2te0aJsfv?=
 =?us-ascii?Q?00/s7F7jv21t+d87d/7vxvlLVgBvwUbiTYqPj1Ix/MXCEEpbzbfAbDAQTNvM?=
 =?us-ascii?Q?l8bWZZ3sT5aJQVmA73NAWeUakwz8dDsIy+Kuxy9ITS+gaV25cfMyX/vhzN1s?=
 =?us-ascii?Q?U2RuWqT1oht7TFBb+MTgQefVU+3hpX50e1mNXX2EoVXUZ+FQoWCTkrn2Y+uZ?=
 =?us-ascii?Q?ir9vsvQNYmSiVJdV9hQJpDNgr1VvSw2FvAPl7J3B+8RcqLplHYiGQEzT/kwI?=
 =?us-ascii?Q?fir9KI8yIp1/uUHYEwVYTBvjwwC8fJ8b6LV8yBujpI7A9ZdYFs2NGT5mXAoC?=
 =?us-ascii?Q?0HzZZKprT1M8pkKMYmzFBE4ThY5Mo7wvhuXW3UWXcgEkn2rr36kGpxqZ41Oh?=
 =?us-ascii?Q?ks6JsKM2OCb8ztCY4eF1yHp2F7Q0JBj1C1/fJQUSYQLgqY1Bjt4M/jDELTPR?=
 =?us-ascii?Q?pprfTeuJMm5vSGRvaDEadiPNcBsivV32KkEP72jagTCH4MSL9/6Z3qHnJufD?=
 =?us-ascii?Q?U8CieX0rWvPe6xjZocdpgzeOeHD0Jth7Mv5+/zgxEL10Amt1yGo4JJhq9Qsv?=
 =?us-ascii?Q?ElvIAp2GgVh2o0Ue9LY1b+tzc4aEIdBOhKjxzeU8lvDAvZztdUelrWcRT7F6?=
 =?us-ascii?Q?hqsuVHXXyp5jlkEIRrHBZmzCgyz/t9KxWbvJOkV+xnue67dmtIb2Sh5224pq?=
 =?us-ascii?Q?iPtyqkwVx2W8wP8NqbLzh6U3w1rUY9CTrImqqZSCZwF5WkcUbJ/Q1GYf5pFR?=
 =?us-ascii?Q?M8sl1GD0y9/SXzd4OlR4Ja7TSaFdYpM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a406098-7fa8-4d3d-2b92-08ded6d09522
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:54:08.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NlMKcFKv+0NyT96o25Qkk7Qxkdv1TKqH/z2SDq0tv+YEzQKn2ZxoC+sDKRhaLfJrwXSIqOW03gd3yaHYmtteRu/kC23p2oLx3UyF8TnivE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6727
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34575-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:john.madieu.xa@bp.renesas.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,gmail.com,kernel.org,perex.cz,suse.com,glider.be];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC3316E70B7

scu_supply is enabled alongside scu and scu_x2 during normal SRC
operation, but rsnd_src_suspend() and rsnd_src_resume() only disable
and re-enable scu and scu_x2. The supply clock is left enabled across
a system suspend and its prepare/enable refcount becomes unbalanced
after a suspend/resume cycle.

Disable scu_supply in rsnd_src_suspend() and re-enable it in
rsnd_src_resume() so the SRC clocks are managed consistently across
system PM transitions.

Fixes: ef19ecf042b4 ("ASoC: rsnd: Add system suspend/resume support")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 sound/soc/renesas/rcar/src.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index ac806bdc96d9..2cdb39e898af 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -850,6 +850,7 @@ void rsnd_src_suspend(struct rsnd_priv *priv)

 	clk_disable_unprepare(src_ctrl->scu_x2);
 	clk_disable_unprepare(src_ctrl->scu);
+	clk_disable_unprepare(src_ctrl->scu_supply);
 }

 void rsnd_src_resume(struct rsnd_priv *priv)
@@ -861,6 +862,7 @@ void rsnd_src_resume(struct rsnd_priv *priv)
 	if (!src_ctrl)
 		return;

+	clk_prepare_enable(src_ctrl->scu_supply);
 	clk_prepare_enable(src_ctrl->scu);
 	clk_prepare_enable(src_ctrl->scu_x2);

--
2.25.1



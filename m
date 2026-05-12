Return-Path: <linux-renesas-soc+bounces-32517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DvnKcNyA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:34:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A9527CCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DC973157C4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AAF38D3F2;
	Tue, 12 May 2026 18:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F0+O9Xf1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C03EDE44;
	Tue, 12 May 2026 18:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610557; cv=fail; b=X5S2yO29mxQ+nzUom09bFAe5+k9O+NywCGFyXRn4NODzgLEiRBDEHUvnVlTbFBRzWfIswkVBmG+scxBVn3dPiXByMOUwffnE0Rmth9qntB4GJCtSEKclDxBw25jcMjekKTviDkgow/6Md6vFQBK0My58GClxGIaQyFVC40Bq2T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610557; c=relaxed/simple;
	bh=wg10qjkgYWyPao80TS8Jwwm0XzAQKWYIBw76FGGkGV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sNcekgbq2tsLQcNFJhHMIglZHYed0lvIO9SQft/3crV4Fgoe6kS8brLYAOreRHisrzh1PvJOTHFTYF87aKUEKhk9/g0VBi6xAfiweExeNwW6OeznVDbUFIpfZzGaMVDWryyUWKuCD8SmyZTpSGIS9yDny7ER/jFjaDQOfln/uOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F0+O9Xf1; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGo/oollhSZXw7MfPm/d3CFo3tCOieSINPa0ZpGyRc2GHqwMmux5VhjFD4nwSrOMrtebeoQB83ICDF+w9u37ygKO7DU0egThSCDGJ9nCNli72I/92RT0jlR7H2b1g9UJX1rxlpRU11hO+6Un+gq3SBf0uX/alCpJyrtpsrBodhtt3XmeE0yywvxM0OgujY4CPQtJ4KC04mkJIChjIXTfq2NtVvxUTwvHGjPs+oFzLHq3VYYXe0nNtolt/TxW9mD/p090ZSPzS9KgvXKl+LIfffHNMnPQtPEYJF3YZgSUlizY+KIhc67wi49sr2IGxBQyOwNFtssNZa3ZNhhc+p6QbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hf6phg+uSntd8pqj1cQgIbEjam/8bDaoiLDlLo+CvWw=;
 b=GIDO6SHhIEDIvkgnlqXPuRiAIUWIa/zudpVGlFEPxwMQJG0HQTXTdU5PiyflO5PqbGE8Bp7HHt1n+A/wP4GLMn3BzOh3i4iwDNkcCfrs6aNvKumcRG6WCRMQkCohrbj9NsKQGDJ0h/lmtMsHwODVZa5m1xxGlFjBl19+bxNWTW4khZ8eefZhjkC0traFjl9CAdttPTe2HqFBOdIuBwiKZYxVQ95J5U8reMbCEIqgn+T2/3PLuccr0rMLpb9KiVM3q8091ypgaKnhUn75jVb0Mu8y8FAWNylorYDiBGZXyJd8Uu82Rj6qbBrhTrZTslDN6Bz6jbMv0oqRPZyY6S/Ang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hf6phg+uSntd8pqj1cQgIbEjam/8bDaoiLDlLo+CvWw=;
 b=F0+O9Xf1J8yzQrS6iPJXP1ktSmXmyW2kwipeypKzFrLf0ZFLO5xZeRlFzunhaTbO9TcFFkS6PUcFoT5+axutJq8TpRY3LmNxssoG1gIWKfXR35lRFGX1kycLk3fOSh4VtKDPzRZ3MPoWmNiiRA4IxHKnbPKVRxlmah54dEyib2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:29:14 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:29:14 +0000
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
Subject: [PATCH v6 14/16] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
Date: Tue, 12 May 2026 18:26:29 +0000
Message-Id: <20260512182631.3842065-15-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f0646c8f-284b-4661-be78-08deb0545e5e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	6z7RlEwiY1aQXM1B/MEUA0blqA0wga1dlsWhY0ZIyFg319jaflF+d8pvsRfQ3/MHCLNfvPt8258OwAfj0U4qjud+V/VxItAAuPC/prd4pqKGMebCE9LW3mcvb68PoELveazVBslPsBhqzqOeSR8KbVyqYTccgT6aA8ig3yRtkhw2SvG+wKa4AbGvR1/Fdzo9CwFJIKSAle+7id2tLtWuZ84T9ThR+iGISfWZMTE7ATtflBcUGkLKjUk894XM6lmj+cC336Nl6qdwkpmBdQhC2zv3wsCJyB2QXe7fH4j14Nv0h5eVJd5gSenO+SDpzLqF1PEhddysvSQ6oO+IE+omo31QIrYmzCgaoMr9TGj258FuA18Us0LjW0nCKK74CV9u6QDRrfX09e6baqjCn7tvxqsjxzjDCQPAmhALI+tUSbGSD+mUT+chKE/Jw/oiaNq0pNlJ06xNvo97l7r8QYzEETICLfJhR4RmOJfEBsGAovcRpHVMZyC5TAMUhuauCwkD1AZfbaZ95a/GDTqlz/vIphWs82ge+/o1tbx6Hh4dSanw1B35Q7nmnn3MYRE3koZOo7/BZLj4hgPGOLNuH3xqgSvxHjYOhELEz7u3k9thi5rLostvIPN6itHFg5e5LvR0Ad4xIi2h2BSc7WeqilPNS2qOkhkJAFp2ckh/n+PyzgzYLGCcORwbl9iyJG+pozM/rsZelVTpazOH9ynjaETaOljn8/k11hegVC24yp04JZM3nB3MUhWnjTXlzhD3e+LR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YaO3xlN7tQz++3rRMkOGYkP2l/oZ9UDCJbzmwdn1lHQSDy/aw7mWRXpGtxY5?=
 =?us-ascii?Q?NYUVajP6wRZIZ7fGHDuc1MZgD0y6ESbNm3Hed79HwSwWAYt1SXq5yjBN2LjE?=
 =?us-ascii?Q?HUqPs4ZAKvFE7iNrLYhUtK2BQKtRVzO7+f2mKljIHIZsoBympW6Ov2irHPUR?=
 =?us-ascii?Q?VxQ5L/XlSUp650yTuD4aa4AVy2QsSLBiAGrEjIjQ8dW9gPRvoQphGxMXlfSz?=
 =?us-ascii?Q?o9FNJX7evMS1pCWh8HoEatawr86aUOrqQFs6WIKkq3upMFPBY/aE1mwpH2Ot?=
 =?us-ascii?Q?6/VvrXjP/RlGE4OKs6hZqoRTSkXjZIjSE1vW97rH5Z/7w6Y5oC2/aIkbfKLg?=
 =?us-ascii?Q?D3l778sVKVbC1aCkQcVYd9j6B7tB/V6aNaHUAB3CIzFmp592sfVGEmHN+HDL?=
 =?us-ascii?Q?ih85I0PF49YWY0MkHaLT1fTUlYI4UBJVY4A0SbiQ5vgdpmrr4mspC5Tkc7r8?=
 =?us-ascii?Q?VA2wuPa4JkeE+jAcKJ2lu/9MMKxRZdTh665wa/LYbDO1V/yVxNXmQOZzcIXp?=
 =?us-ascii?Q?D4oFuBuYLu7yIAvcRDl8yp+Wiq3o0zupteYrbWF4av8aWPba9ywviwsAfC8a?=
 =?us-ascii?Q?bcOlahPXjJSNjVKgcOZo1vIh+d33oQPnMMVIpb/e9P2RjcNuu6ccMNjUpw4x?=
 =?us-ascii?Q?6ctGMCKJg1CI5h3B8f1n0ixIkPAhpfvwc/xNN7IghcBNEkxlLVLPXAtpFTTd?=
 =?us-ascii?Q?eMqO0rGCi5DlbLNsJec5sAa+V461/e3yl3HtIt9BXNTPhcfuLfxCy+ImVRyD?=
 =?us-ascii?Q?4ttOkgzFJBIkd9I7KBRXBt/53KXu78GK+MFqXNQ9Of7H51pAi/fCg0UOgqKn?=
 =?us-ascii?Q?maPg36JerEmZPHnJN05FO52SPhd2a2bcy249+I1M5i06iOWbnZOJuNfCGu8e?=
 =?us-ascii?Q?1ulJz+uK6khIY8mQevu2apCEsy7j156c0zl2cRXup2+vcAZx4ushLp9Cg0yO?=
 =?us-ascii?Q?TwEx0lCmSEQXg5LclsA2ZxzzWwYoMcgvScnJfqGNKCve8btcsI19hukfNu8T?=
 =?us-ascii?Q?7H00cyM+2JVyBOfUowB2kFS2KyK2Ret0n1yBxVyqm4cfKFs6/2THyc+jEg+P?=
 =?us-ascii?Q?R+1op/hlEEmV1rh+dghACK2yc6TnZanpKOruT6SSNLLxFedzOMCuGEb+KDID?=
 =?us-ascii?Q?elWtbAMAXxQYS9prw9Q8rjFTO4PhJC8nYl3j8OBN9olxQ5fDGLDl8/2IUxk8?=
 =?us-ascii?Q?jhsQRJGXkHhbzVUt6e9XPsWQAq+UB/H+vZoTWgrw6vcYMQAnLJPLW1Klx4LP?=
 =?us-ascii?Q?38C2ljWxuyIvYZlk9jSgBei223TN7Iqd5jyhfKz4pMQTdED9HgEv9XVtXD92?=
 =?us-ascii?Q?v6vJ/4aWlEDTM9vhS1LvZDPVBHTAE49C+kFjuTPAHB1zxwjg/splHQ3bZLSR?=
 =?us-ascii?Q?mKHIjfBpK8zOIvCElyR3x7tuUsPytLMkLDmyd5Vu9LLmzWJbwuhmgBjR8AsW?=
 =?us-ascii?Q?+ZmXkutBR/gvSfvs4Me5bciCIlnmmIbj1Gu3KnEvglR1zH/f03JCwo/PgWmc?=
 =?us-ascii?Q?2avCvewe7U9fUTvTTo7ZckrbHvPNCs8szKSSGu1lNJGgZ5o7sZnpb63f2dOq?=
 =?us-ascii?Q?cbCKTTVNpt81qZtS030xlktaE1pJXX3S16zKUDFqblK1FhFsLvYI5RaS2Zgr?=
 =?us-ascii?Q?RymwlWuLkFtbrjABsuA7tLgjAYQfPkl7LeFsDjqkDpYhzhv56lf/l6Ejj1pj?=
 =?us-ascii?Q?cg5/s6sMZd55iLWdsak5PjvvwJ9ZAhVlAer91JavxY+2m9l9YFdKKZngDQCL?=
 =?us-ascii?Q?RKovWt6qGIHAbtKjxp2OsGuCyiwLVhA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0646c8f-284b-4661-be78-08deb0545e5e
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:29:14.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q01w+QlbiuzEJbr5GjvybFSJuHyp1vGusMR6fwRkQ6SdGLkJKD3y4kEjWTdlflQ1ZmwWWHQq/EkvCfgXoTF5+NHlNIgim4ir13sYE115vJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: 284A9527CCA
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
	TAGGED_FROM(0.00)[bounces-32517-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
reset and clock management unlike previous R-Car generations:

 - scu: SCU top-level module clock (CPG_CLKON_15.CLK6_ON)
 - scu_x2: SCU top-level double-rate clock (CPG_CLKON_15.CLK7_ON)
 - scu_supply: SCU register-access / housekeeping clock
   (CPG_CLKON_23.CLK14_ON, described by the HW manual as the system
   clock for "function modules excluding SRC0-9, DVC0-1, CTU0-1 and
   MIX0-1 (including the setting registers, etc.)")

Without every one of them enabled, no SCU register is reachable.
Add support for the shared SCU reset controller used by all SRC
modules on the RZ/G3E SoC and manage scu_supply with the same lifetime
as scu and scu_x2. This matches the hardware description and avoids
unnecessary clock toggling.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6:
 - Use devm_clk_get_optional_enabled() for scu_supply so it has
   the same lifetime as scu and scu_x2, and drop the manual
   clk_prepare_enable()/clk_disable_unprepare() in
   rsnd_src_init()/rsnd_src_quit(). This matches the HW
   description ("system clock for function modules excluding
   SRC0-9, DVC0-1, CTU0-1 and MIX0-1") and avoids unnecessary
   clock toggling on each stream open/close.
 - Acquire the per-SRC clock via rsnd_devm_clk_get_indexed() from
   patch 04/16, so both "src-N" and the legacy "src.N" work.
 - Drop the per-module name buffer and RSND_SRC_NAME_SIZE.

v5: No changes

v4:
 - Move shared SCU clocks (scu, scu_x2, scu_supply) from
   rsnd_priv variables into new struct rsnd_src_ctrl, following
   the rsnd_dma_ctrl pattern for shared non-per-instance module
   resources.
 - Keep original declaration order for struct device_node *node.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/rsnd.h |  1 +
 sound/soc/renesas/rcar/src.c  | 50 ++++++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 186468a584fe..bdc4a99394de 100644
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
index 43abe13137bf..0237b5d2e79e 100644
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
@@ -712,6 +720,8 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 {
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
+	struct reset_control *rstc;
+	struct rsnd_src_ctrl *src_ctrl;
 	struct rsnd_src *src;
 	struct clk *clk;
 	int i, nr, ret;
@@ -726,6 +736,12 @@ int rsnd_src_probe(struct rsnd_priv *priv)
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
@@ -734,6 +750,28 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 
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
@@ -754,6 +792,16 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 			goto rsnd_src_probe_done;
 		}
 
+		/*
+		 * RZ/G3E uses a shared SCU reset controller for all SRC modules.
+		 * R-Car platforms typically don't have SRC reset controls.
+		 */
+		rstc = devm_reset_control_get_optional_shared(dev, "scu");
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto rsnd_src_probe_done;
+		}
+
 		clk = rsnd_devm_clk_get_indexed(dev, SRC_NAME, i);
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
@@ -761,7 +809,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(src),
-				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
+				    &rsnd_src_ops, clk, rstc, RSND_MOD_SRC, i);
 		if (ret)
 			goto rsnd_src_probe_done;
 
-- 
2.25.1



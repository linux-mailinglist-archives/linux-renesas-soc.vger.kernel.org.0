Return-Path: <linux-renesas-soc+bounces-33080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEd1DgUuFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:09:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B666A5C9B22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CAB4306031D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DF437D113;
	Mon, 25 May 2026 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vlGFZ/zL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97E8375F82;
	Mon, 25 May 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707093; cv=fail; b=LHSIMmQKcBql0GwO87aGvHPtSMQagj7G+tkJt6+edeqRWO/WCmo99GLSx4wdRQIbXs9pAOZ6WRg1oavdDN8rPzkVcd5rs1zplfn7lrtUuwsxiVbXaQNtFCHgW85RFT6tEcMn+mM1ZzmiWo1JXNExsQCOekYiJeiBd3eGfWjbf0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707093; c=relaxed/simple;
	bh=5OIVlv1JaWsLssoJ9Xk+Y6KfuIxADFXq8rvWumCW6Zs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IFHRG+hMNjQYYvN1/b3KNw8MRN4fW7hjqKQGrCXX5jx0Zqz2Z2WdjtTUf2gSocCywcIAqYbjkovkViMjeJtCnpnVd6ywk0wc+oiC/VWaTz2j93edYhQxLL2ayuNDG8YNsDLRrvXVxCzlMsbO4+t7c3TStXRCvE9FmdNuio/a+oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vlGFZ/zL; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTDkzaEGQDhi+fnZIAJhAaaguBb3PkGh9ZVSOGocJFk+rAHumwyzCamASqt6vAv4tT7L5CPyMaBBR9j0flSWrjB1WqJ3VybM7zTS8bwtPHziaCOs+ORLuH6eHKeIYLC7APqvm+MssbbT8wuc9kiMzjZFYW4rKzUemFKybCx0GcKteUwQ50LBOAMpzPKNHoZpQEfv9p0jkXHGg/aSTjP6trih/3k606edydxTNXLv6cKcUzvETTFZEYZ/RvPT7ELvxQTv+FO7uBsO5jyAp6KIjL99Wc3GRWm+9I6QOdE+WDSa/5GWzMtZUz8/bi7B8MnpZy1MLEvzdnfTMVMKITvl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0VLdrOR/Ln/DGshIajj4FCUBmAz9K/Jcf3sb+f++UQ=;
 b=LL9mchPNFFRI7IX5iBS/xL7MJj0PBzxcV+wPzVWqFpVZVIb5XiaoljzcVZnxne/xsuFPA/BhryhvHizh4qcnMmp3lfwFP5T7n2ZrIbT5h3FXA8t+DlCymS9Knnklm1qSFF+aeTsN41L9Sk9m0iuBpEBaO7MjsocfbuADLFhGVxIwSdsgkiNN9zivA62gNLHPUgytp23OG5SZESb0k6/gFHQmO3joDIGyfLhTLJA/nsVLb+N05FvdYoH63vj5yBl/bocSREVq5b1Fl7w7wI1tVUH9QM7R9yOrW4fg0jbe2xYe2zoDp5TeiupICBRNx22JLtZ4g7z239Wqnbw7KgTYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0VLdrOR/Ln/DGshIajj4FCUBmAz9K/Jcf3sb+f++UQ=;
 b=vlGFZ/zLRGmmyu4ouhr4h2cRaS/yatMFcIDGXk25CgUG3CfRwP1VCftRgNBt1d+J3a6X2ebyFWQl1CeJdvmVfgRpEfVQ5w6+3OUh0uio78y3GcjScIOwPiLLtuQP2Z981ak+FRe+lLIdLuTwguGd3ulFDDrbqy2qLnos8kDyr7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:04:49 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:04:49 +0000
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
Subject: [PATCH v7 13/18] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
Date: Mon, 25 May 2026 11:02:25 +0000
Message-Id: <20260525110230.4014435-14-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b54bee9-8808-4f84-9695-08deba4d6fe5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tyN2amAzwd5smWWB4AnqvXT2SIAhVAwEwXv61SLWmwl7MXdfpkeG3b7KWaZIMeH8Lpmh1625PTglKtifrPYHq6w049L9VZExzPTdMIg6u+E/H9oNhHOCv93NSQZbFU8coLXnhjfMCIzK/qRShg9dRCvgCnYuqFBDzy2k509njHt3O2YW/0NH3sK8YMGX+GaPmIf8S4FTcb2bBH+Vu0pxsloW6ru1BykGTejqrD1QTAg0HzmSNCy9g3tUCJakZuEIhc/AJfgoalnf6Y65ZNKfDVhC8ZvzfJnMRtVnc6/mL4YdmzaQAj/75ixgZU89mKJroYh5C7QbQe4o9loyqmy6SIlFg8SDRPvfxqFvGxNu23LZpYGgreJCT3i33QKAxqZzgNEZFNp4nEjpRWp1ExTIIF+d53w1IdCPstng62sCmeNPvR1cb92Lz3nBoFkmZWLrJUb20oBp5Xz0nqX5tfqprlcfX6ndy8p53zrvO2RKlNBW/FSiAYpYi53ZmfZ72ZlndtkRHJpSsLo1aAr73UkOTc8bmIXQ/r+pY5I2+l82bqXtPreOMKNvilryNu9diHSRaEK+GYvB2+qji5/wHlJA2yLEi8hqqN/VAgjgdvr0LjFrBfFkCHTggvivoGCj9qrh3sGIX10MpM9yXzsVScEV4U2VF9CfBCjQPfCaWGLYRY9FpBsXKA3t//QO+udjkzGmsIkTioOe1bhpADjtt66RgD/Mfvbn26OqgLfos2mW632Z3G7bvC8/SYn6/cbFeMDL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(6133799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?25rPsy0MojLq9KIaWGNBksYgNOpb/fSRAWFSIf1hL4Ue10lAbGkHVg8+CP1t?=
 =?us-ascii?Q?1/PbJyLrWRtUSXbvp6F1IRHExtPPtYsYArtGj0MKyhkwWe76YrCeQ6c+8mn7?=
 =?us-ascii?Q?q+4Hv4EmBgIk8v7p5mVycjRN8eKgIZIj6ihoalmIDIgWt7KqYsD4Aeocjnrb?=
 =?us-ascii?Q?LyT1NR+hde6KeYLiqKXLZYvh2iqKEZsmvoZRfw634QbTiFBkpAIxjIznoAPe?=
 =?us-ascii?Q?mVvk/xp/d1JklS7GXHvF45ZnfVvGepA/AK879okkLOLmD97lmj1mA6xMhqgV?=
 =?us-ascii?Q?JBWpXU4BtlQdsysgcYwoiYgPXWHIA+Cxfs+fWMWRlhCsY9brLtYngnMWyd7t?=
 =?us-ascii?Q?CbIWhCccHBJiltVP0oMzGs/wVAhWybD8qhqL4Gg1Sdg4lOF/2qdqgY0x0DGK?=
 =?us-ascii?Q?BjF615+CJ5lqIc9o/Zn+N2dnvtDQDu6er4gZgMGkagrPG2R+XjmknfVlUTqU?=
 =?us-ascii?Q?tr38ZHkLRQMlMHE/QCeKwSjZ8gI5H8f+doSNBB+Gh5XparjglDUiXSnTx8Ci?=
 =?us-ascii?Q?2y1YSxtG4ZWu8JWz8l+1L/OW8+DQcsdVq6eLF+MeQCbfUgK6lSJWBrmX03c1?=
 =?us-ascii?Q?RWRscoMQShTJ6+Zvp5XV3dKNnPMEweW73l0lEfW+i4zTdys/seFUE9y6QSCg?=
 =?us-ascii?Q?UVfQUFr4qJz2p9z76RmYv9ebxzs1JUGyBFYhdx/RXQpa7Rg893fkogFC+yrH?=
 =?us-ascii?Q?AgqgmImP838Iu7FKfDD50exE4LGcio4FmCb8WCrBlx2MLOGLSlWviKVVLYo5?=
 =?us-ascii?Q?SUAz0+jA/pBY1xJugos+tmVa75HmHADkkLr4GThVEzoL0a8svnfVkNPySBOB?=
 =?us-ascii?Q?R+37DaeIglKjDc5u1Jm12++yEW3q6gONV6yXn2f3uToNqCKdjbTbGh+kx5Z3?=
 =?us-ascii?Q?uT/+NRBsaHXi7PBCAePvcjRo0Neyhp+G3z9WB5rigrUlpgjtg2cADFPTM8VO?=
 =?us-ascii?Q?nBoLrnEjcp75iPR3ur+Egk/lS5DiyGKaEHUOA7QPIltxijFungx7W8hPR+w/?=
 =?us-ascii?Q?RbOD1qQlktrUMiwAyiYueLiw6I+woQLuakQ+FNheZdc3NAMSgX/ZjbZHeHy5?=
 =?us-ascii?Q?JwnA1+6Ao0vLvxg4RzrwCXRBh+4L9N4gDRxM5n4BlNxIsbdKcORMKlSUtXXQ?=
 =?us-ascii?Q?UpgRN2VFmXLU1UtZnF5PMlA7NAP6uAbQLysdWpv6q6zQicWwPd68VLsHkqax?=
 =?us-ascii?Q?fz+KLlWwihNomgA9QrjrlDfQZJUQUyW+uA+YbCTg+cNMHlj2wOYhtMdgzTMx?=
 =?us-ascii?Q?gcedNJqUWs9lsoMv3OOEKJCvzpIzcX4Yn983Mw3U6LS0+Cu8GJrIPFzFI5HJ?=
 =?us-ascii?Q?nnBbH0O8oNh+IF0MVye7n46VK3k51n79iEm92xUyowciqQkPbdN7NgPgwHgL?=
 =?us-ascii?Q?pNqJFiPea9QLbTZt8TT7FNpDNofbB/btRiVyoBqhM8BVNjlpEN3bY1hEVF5a?=
 =?us-ascii?Q?Zrs1eDd7re7mK9RYlpk9xTF2nz09Hw95dLGrpGJbE+2rJJhCg4d0BY6qoxOA?=
 =?us-ascii?Q?36Fthwh8BgskzvOkxMAWq75elrc11EuDPqS7qCJDzZOAl6hzagJK3J33VZuv?=
 =?us-ascii?Q?hnrvq/T8dvnOlWvS72/uK3CvFsmNuRnaU8sk7XGFT4CLbYuN77jKM2UUbDn3?=
 =?us-ascii?Q?pjO5uBqNSZ8Sq+aTJ7Wir5htXJhKYGZdOhOLtFzu2NVwvBh2czT7kXlYZ8pH?=
 =?us-ascii?Q?Q0Mc/Nd/VIZJuW3HqfQ4YkVjNO629FB3Uk1hrAlhUA2XN/qq8P6StKSIPPx5?=
 =?us-ascii?Q?q2aokvGcJSJRFrqmaYJjS2Yk4CfsWYc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b54bee9-8808-4f84-9695-08deba4d6fe5
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:04:48.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwbGZ4cgO9+w0/u/wLKkuVwGjldiinC93pQnOgDr0MMQsR7s+4OX5DlQlrCJYLkuSHpRjkPJxwxm52kIrozUMrgrAounqeKHQdTniep/stQ=
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
	TAGGED_FROM(0.00)[bounces-33080-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: B666A5C9B22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E's ADG module requires explicit clock management for SSI audio
interfaces that differs from R-Car Gen2/Gen3/Gen4:

 - Per-SSI ADG clocks (adg-ssi-N, or adg.ssi.N in legacy bindings)
   for each SSI module
 - A shared SSIF supply clock for the SSI subsystem

These clocks are acquired using optional APIs, making them transparent
to platforms that do not require them.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7:
 - Replace the inline "ret |= clk_prepare(...)" accumulation in
   rsnd_adg_clk_control() with dedicated rsnd_adg_ssi_clk_prepare()
   and rsnd_adg_ssi_clk_unprepare() helpers. The prepare helper
   stops at the first failure and unwinds only the clocks it
   already prepared, instead of unconditionally unpreparing every
   clock (which would underflow the state of any clock that never
   prepared).
 - Track prepared state with a new bool ssi_clk_prepared in
   struct rsnd_adg so prepare and unprepare are idempotent.
 - Preserve the first error from the surrounding for_each_rsnd_clkin
   loop: adopt the SSI-clock helper's return value only when ret was
   still zero, instead of OR-ing error codes together (sashiko-bot).

v6:
 - Rename the per-SSI clock lookup string in code from
   "adg.ssi.%d" to "adg-ssi-%d", matching the new DT binding. The
   clock is RZ/G3E-only and has no legacy dotted form, so the
   indexed helper from patch 04/16 is not needed here.
 - Simplify rsnd_adg_clk_control(): collapse the per-SSI ADG and
   SSIF supply prepare/unprepare path into the accumulating
   "ret |= clk_prepare(...)" style already used for the regular
   clkin loop above, restructured as a single if (enable) / else
   block.
 - Update the in-driver comment to refer to the hyphenated name.

v5: No changes

v4:
 - Move clk_prepare/unprepare for per-SSI ADG and SSIF supply
   clocks into rsnd_adg_clk_control() instead of separate
   prepare/unprepare functions, centralising clock lifecycle
   management.
 - Return proper errors on clk_enable() failure instead of
   dev_warn().
 - Eliminates hw_params prepare leak concern since prepare now
   happens once at probe/resume.

v3: No changes
v2:
 - Split clock handling into prepare/enable phases for atomic
   context safety.

 sound/soc/renesas/rcar/adg.c | 124 ++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 813ad5eabba6..5dce62287d20 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -19,6 +19,9 @@
 #define CLKOUT3	3
 #define CLKOUTMAX 4
 
+/* Maximum SSI count for per-SSI clocks */
+#define ADG_SSI_MAX	10
+
 #define BRGCKR_31	(1 << 31)
 #define BRRx_MASK(x) (0x3FF & x)
 
@@ -34,10 +37,14 @@ struct rsnd_adg {
 	struct clk *adg;
 	struct clk *clkin[CLKINMAX];
 	struct clk *clkout[CLKOUTMAX];
+	/* RZ/G3E: per-SSI ADG clocks (adg-ssi-0 through adg-ssi-9) */
+	struct clk *clk_adg_ssi[ADG_SSI_MAX];
+	struct clk *clk_ssif_supply;
 	struct clk *null_clk;
 	struct clk_onecell_data onecell;
 	struct rsnd_mod mod;
 	int clkin_rate[CLKINMAX];
+	bool ssi_clk_prepared;
 	int clkin_size;
 	int clkout_size;
 	u32 ckr;
@@ -343,8 +350,16 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 
 int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(ssi_mod);
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	int id = rsnd_mod_id(ssi_mod);
+
 	rsnd_adg_set_ssi_clk(ssi_mod, 0);
 
+	/* RZ/G3E: only disable here, unprepare is done in hw_free */
+	clk_disable(adg->clk_adg_ssi[id]);
+	clk_disable(adg->clk_ssif_supply);
+
 	return 0;
 }
 
@@ -354,7 +369,8 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
-	int data;
+	int id = rsnd_mod_id(ssi_mod);
+	int ret, data;
 	u32 ckr = 0;
 
 	data = rsnd_adg_clk_query(priv, rate);
@@ -376,9 +392,63 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
 			adg->brg_rate[ADG_HZ_441]);
 
+	/*
+	 * RZ/G3E: enable per-SSI and supply clocks
+	 */
+	ret = clk_enable(adg->clk_adg_ssi[id]);
+	if (ret) {
+		dev_err(dev, "Cannot enable adg-ssi-%d ADG clock\n", id);
+		return ret;
+	}
+
+	ret = clk_enable(adg->clk_ssif_supply);
+	if (ret) {
+		dev_err(dev, "Cannot enable SSIF supply clock\n");
+		clk_disable(adg->clk_adg_ssi[id]);
+		return ret;
+	}
+
 	return 0;
 }
 
+static int rsnd_adg_ssi_clk_prepare(struct rsnd_adg *adg)
+{
+	int i, ret;
+
+	if (adg->ssi_clk_prepared)
+		return 0;
+
+	for (i = 0; i < ADG_SSI_MAX; i++) {
+		ret = clk_prepare(adg->clk_adg_ssi[i]);
+		if (ret)
+			goto unwind;
+	}
+	ret = clk_prepare(adg->clk_ssif_supply);
+	if (ret)
+		goto unwind;
+
+	adg->ssi_clk_prepared = true;
+	return 0;
+
+unwind:
+	while (i--)
+		clk_unprepare(adg->clk_adg_ssi[i]);
+	return ret;
+}
+
+static void rsnd_adg_ssi_clk_unprepare(struct rsnd_adg *adg)
+{
+	int i;
+
+	if (!adg->ssi_clk_prepared)
+		return;
+	adg->ssi_clk_prepared = false;
+
+	clk_unprepare(adg->clk_ssif_supply);
+	for (i = 0; i < ADG_SSI_MAX; i++)
+		clk_unprepare(adg->clk_adg_ssi[i]);
+}
+
 int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 {
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
@@ -417,6 +487,28 @@ int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 		}
 	}
 
+	/*
+	 * rsnd_adg_clk_enable() might return error (_disable() will not).
+	 * We need to rollback in such case
+	 */
+	/*
+	 * RZ/G3E per-SSI ADG and SSIF supply clocks.
+	 *
+	 * Follow the same style as for_each_rsnd_clkin() above: on enable,
+	 * try to prepare every clock and accumulate the error. On disable,
+	 * unprepare every clock. Absent optional clocks are NULL, for
+	 * which clk_prepare() and clk_unprepare() are no-ops.
+	 */
+	if (enable) {
+		int sub_ret = rsnd_adg_ssi_clk_prepare(adg);
+
+		/* Preserve the first error from the clkin loop above. */
+		if (sub_ret && !ret)
+			ret = sub_ret;
+	} else {
+		rsnd_adg_ssi_clk_unprepare(adg);
+	}
+
 	/*
 	 * rsnd_adg_clk_enable() might return error (_disable() will not).
 	 * We need to rollback in such case
@@ -769,6 +861,31 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 #define rsnd_adg_clk_dbg_info(priv, m)
 #endif
 
+static int rsnd_adg_get_ssi_clks(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	struct device *dev = rsnd_priv_to_dev(priv);
+	char name[16];
+	int i;
+
+	/* SSIF supply clock */
+	adg->clk_ssif_supply = devm_clk_get_optional(dev, "ssif_supply");
+	if (IS_ERR(adg->clk_ssif_supply))
+		return dev_err_probe(dev, PTR_ERR(adg->clk_ssif_supply),
+				     "failed to get ssif_supply clock\n");
+
+	/* Per-SSI ADG clocks (RZ/G3E-only; no legacy dotted form exists) */
+	for (i = 0; i < ADG_SSI_MAX; i++) {
+		snprintf(name, sizeof(name), "adg-ssi-%d", i);
+		adg->clk_adg_ssi[i] = devm_clk_get_optional(dev, name);
+		if (IS_ERR(adg->clk_adg_ssi[i]))
+			return dev_err_probe(dev, PTR_ERR(adg->clk_adg_ssi[i]),
+					     "failed to get %s clock\n", name);
+	}
+
+	return 0;
+}
+
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
 	struct reset_control *rstc;
@@ -798,6 +915,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (ret)
 		return ret;
 
+	/* RZ/G3E-specific: per-SSI ADG and SSIF supply clocks */
+	ret = rsnd_adg_get_ssi_clks(priv);
+	if (ret)
+		return ret;
+
 	ret = rsnd_adg_clk_enable(priv);
 	if (ret)
 		return ret;
-- 
2.25.1



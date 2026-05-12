Return-Path: <linux-renesas-soc+bounces-32506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e7fEJ+dxA2rH5wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:31:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B389527ADD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE63A30CA8F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E2A386557;
	Tue, 12 May 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PeR0Tm3S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A1B356741;
	Tue, 12 May 2026 18:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610487; cv=fail; b=IWUk0NzgKo1PuRmezAmrmQ4jJzSHnMjVyxoThMbr53W/DiFio9cl+x550thlrMzy3xgwEpcOccPvYtOlrm+mv0VR3kqioYFtez+z2WQO1haGvK1T8GnSPRJ7wQ+Hcq1UsMlcy4MxCMXaPy/5v/iqY6oUVpwcipmmTouvrRNup1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610487; c=relaxed/simple;
	bh=M0qHueV/dicJpOMg0Ng2y+a0Qa4B8+3mImYg4UG58+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dC+HLGilyobpm91l5tVszOHJqo9h8+UyUPP6OTE8XgAUQkUe+jwP1erYjMlwJxBoK8ATeD0UnRfc5Y9DpdRc35gjEW2r2P1ZUthaNH3xP1Rr4jRcHWUCL/3rQifBO2xV+H/BJECmXQEt8u5iAefEHOChJ49tCxpRC/u+NbVJQSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PeR0Tm3S; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgCwrlVb3PjrwpaZp3cenZ2/j96vlzt7O8JTdxp8a2Ms4P4R46TvpsO97Q33ZW5u+Sysu+9nMuwDx7vFHKR+/07VsqNEN2P4annsDl98HI7Zl3LAG9MG0RgNXR8oH8ZIjTQ2jab0iD35RU2Xq93QJMNabNULIcy+GORmIt1DQuVPtyZTDlQWko2DTh8zOzAKSJd5b879MRw4zemIAOVXLrWDYcGyRDn0aZGHeGAqSxFEWIpW9/Z51ift5P4AxvvzPy7SHclLLQtUCtYzsDMrzIypjAkyF5u/RPkLMUC5lHUQYY53IjcnZ6FB+di6TBq+FW+3nJoMOkYfApxcGLOAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLgFuXcncg4EnuyW8GxD8DsTQdBQkgsJFSs+3ytCVgA=;
 b=agqxmxTQDeSfQuhbqBXyZrZZBbmVOZkicfSnqSN34+HgrMLf4NcYR2TgC6DEB6Ih9GjsKrpG521tj6GyyO0vVAhDDXQaiZvatmx1901nMbou1PHDNRfPCq/AA8WgrqxKvCMUNnJGjs/r4PHWoEGjG62Ptuglsw0xt/IYvQM8yNlpvbf5urTyA+g5hWYrG3LADX40mYajLEmzJNmaN1BSeiN9TvLP6xeGANR5r4FPuPdIbj+pAkktPDGzDtB6Tfx+VdZQ4IGzptMhDhhYN7IufGn6YQF20O3WKsd4AJE+FfjYeOMtyNQAdbDUGaCTDYr/f8ewS0CySGZag9iYEVKSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLgFuXcncg4EnuyW8GxD8DsTQdBQkgsJFSs+3ytCVgA=;
 b=PeR0Tm3SL6VRDZRWACPV7/G0/l71PneNcW77h2wVhtkdjbZTf+bDtiaW4R18VCTvr5T0bALmoAIUpp4uYdUhE2OcqLA32+NAqQuaa3/fmGjyc/jjNAsbJmXqxSw6iTNBO2eLOj4+1dHPTi7te97sKRp7F0rVpCZN60UF71ISqZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8431.jpnprd01.prod.outlook.com (2603:1096:400:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 18:28:03 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:03 +0000
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
Subject: [PATCH v6 03/16] ASoC: rsnd: Add reset controller support to rsnd_mod
Date: Tue, 12 May 2026 18:26:18 +0000
Message-Id: <20260512182631.3842065-4-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8f21e304-78ee-44db-7601-08deb05433f2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|18002099003|22082099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	/ZcxT5UwVjCW8o3jNxhRcN/mq+tAhCk8sDze3pB/8VhuI8hS7+fmsRciDbVrBND3kunIRG+EAnX+sHmZAJVQisLh0RQYj8S5nLKhX8H/Qytevmtaz/cfJ/sDJ+iZWiQrI2bI8fLHsUro71+sJCNV49bu4JLFh4r9WiV8MlOksZSB2yr76iXP18McdUTIEVsVfvqJyZ8+QmczpIQlsSdTFTyb98kKxrTG2LPkyDNXbdD0a9fWtsOz4kT7R9tpw/Qkq+4GtuLvHWUi0Y7AKeCPf7AVVd2LCTZUE6GiXfLvij9da/j78cdxfdW6cL/N6eCY2FqfyZmqwER40Ew6vdVVWjCfRHdKW9fgtj4Z62FtEWAJEGput/eaE2bfnwwxg5dRex9KDwJnK5QjS4UpGaBjgWuu33zADS7CMuwsGklIgzZhR1jR2qXdpysPZRq1h47/b7iDkNAqg9TL5/SuleF82Ki4TqdKBNW1lO1iu28IygtAZvjMTVTIVELWpac4L6vZvm5n7cPV4IoOG4jZVEAVgjYREwN2sN6lRPUwwpJrP/eMyPQvsplTOJqrpcNAkjIQ1eOnhObuE7isrjwVWrn8UP+SFNx1AnIwdyYd3GXxAjxrflAmagcwxbyNeq2HmhxBZjF2MOAjkFrfn5tnH+Q0oq2O8DaHVQEDQopGEKVHgH8tkcxZKPfU0VOLNrgRB3z/RjiWOyterxEEIaqjTPDUr98s4a69ntgJ7WnFJTJ4pppSvi5AyUS5qnfL7Jntu9MV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AjFhTpjag9HS2qq1/9kHSTfPus8NgjFGUyYaffeyquFWYZuWrPzAEdDAkV5n?=
 =?us-ascii?Q?nEOFby8uGWumu1iK09a+3HqW8lIep+deEZumoWl0HrudjtotSTGGfrzpXcdE?=
 =?us-ascii?Q?wVR318z4Veyf7w7YTMPkDmMSFEi8fR0CSNdhqoTDQ9ypQC1hd4f6Ug31e3B/?=
 =?us-ascii?Q?jpKlpG2YgkZ/NCpUpTDPPjhJuady2Pz81s3Pxm+tkUIz6pB9tQPz7TpNaYqM?=
 =?us-ascii?Q?oO2jUs5Ka+xiWGmTs/JOWICveRAHFuiihJD+bsrC7vW6J9IH+yqVlX174yUa?=
 =?us-ascii?Q?hOGESaZMSqCFo9+Wz9MIIToLNGMTHecEEbNcYaDYxfwclvqAg4A2WsPCAxu5?=
 =?us-ascii?Q?rPDYuwCzRpIE7kmqCFJ4I3ztpPSlmFj4B5spYdJhFULDLMbfeW0PzR++lMdn?=
 =?us-ascii?Q?xGmo16klBa3dnXlhxjauMUYUmT8kqYGC7tXhzRnABu2RjfhuTpSZD7ztjGnE?=
 =?us-ascii?Q?5k44ZcRyFI9caZJWGzdYrCvgJOjbRhWaYGMlQfQlmH+Efj8silxinrZNyyqr?=
 =?us-ascii?Q?v4BAt1c6hALdanaX7Z8ag4Twm53OCfDg92M79rVXN3zt4vEqYtlGxAUncLRb?=
 =?us-ascii?Q?EExmZvzym/X2j3W8PmCesyFbk0z4JF4I6N1hUbCQdV6nOJKn+ayE/8C7qvie?=
 =?us-ascii?Q?hDIfnJ7NgS66T+5Z9xFsknXR9bfYSn8IIjNxAN1xR44eyFHnZg8U5n5XyE9p?=
 =?us-ascii?Q?4R/TVFqbKoyNb0oNb4AT26LAGKW1NbCkbI+MmarBIpYFQoUefROLJVl+G4KV?=
 =?us-ascii?Q?bclqwlOocblI5zlxIZqRqU5tLneaWO5U/KiWnouQV3cqW3im8Enhw1NLKpBG?=
 =?us-ascii?Q?Be5z3WXH9y/P2u0OpNGOOIN8rsrDAFxQNdxTE5HQHR9k9GIG1oa+F//ivw/E?=
 =?us-ascii?Q?/1p60cg6m6CtifCu1WEmyF2v7HlmKpXHIS+5S5mK/LmngEQA9fFEHJYmGkuX?=
 =?us-ascii?Q?BNvKQkz9QVPNsDUYbqN/Xj0MgsXVEPO12GTbVmtO2tnWNU1T2xf5oV6xG2ah?=
 =?us-ascii?Q?rOFfLvpwvW4ozn05TSoy/L+QfDy96iDWHxjVwgx+uxWpEkTQ/lgq1wfxrLDj?=
 =?us-ascii?Q?p1EUZ4I6lVWTrrLMSQ0FomXTy3BfdKOE+ZR+9Yz7LivCkrz0RwEZJ7b/ToDI?=
 =?us-ascii?Q?m3Vc8pZZBdt8vcLx/iyU4WLv6+EM1B7drn75kOvqXimQQ6OtB67nX/up/I9g?=
 =?us-ascii?Q?S7vSs3JgxEFWfeBC60qB1nNU6JuGzNIp8AapwXGXQv4jgt7hAqiE4VOI5M5n?=
 =?us-ascii?Q?xpJAAwDITbsqP4NVkIhu7lsst/Q/xstyc0wK3Ggy5wqgt6X6BTSTdZ2u3Hp2?=
 =?us-ascii?Q?Z3zuNfIQX9jIwM09D73IRydsHWMWd3l/VKUw5ZIDCN6UFaRkGrCa/hWMiSjM?=
 =?us-ascii?Q?NUNlKly2JLrdO8Y/Elkj/4uFgeVslwQhOOr+BY29Pqb/YN/V1IwCBTGng4E4?=
 =?us-ascii?Q?TzZwBsfIA0atG7zyJ4qAs/AmWltm6Aw77p9qg4CeX3iJ7MT9zHuoesXcnJYO?=
 =?us-ascii?Q?Vu9LWVMgrbiRzNAdmuRw7DU5yNII/hY7eTg4U5tMzQUExxr4+ceTRVOpUre0?=
 =?us-ascii?Q?WTGoLEZy0mt4RuBrLw+v8boPT/gGc1/uLhL+y4sbj10vpzFPxbaZlyc8dxEK?=
 =?us-ascii?Q?ZBQ5H96EAAycU8mNquq1Ags7SUSRcUlgec8wsQo6lXI+RO04hbgiZS1MXf10?=
 =?us-ascii?Q?Fu5jgQ6L/wYozWpnYEiOce4hp7ySWW0xSY/MFN5R70TN9H5f09YVoKa0146A?=
 =?us-ascii?Q?B6OF3mXilDNw1pKxVw1O4bFyR8erecc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f21e304-78ee-44db-7601-08deb05433f2
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:03.1301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBXMLGv585lbhviC+pKQDT1NuA1ByFdOWqtZRAfni4Q3g3BD4SVtxVCq4kIuymKNF1Z9hING+V4tIvTT51XGyNzgsszbchL06NPw63LAjBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431
X-Rspamd-Queue-Id: 0B389527ADD
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
	TAGGED_FROM(0.00)[bounces-32506-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

The RZ/G3E SoC requires per-module reset control for the audio subsystem.
Add reset controller support to struct rsnd_mod and update rsnd_mod_init()
to accept and handle a reset_control parameter and mirror it in
rsnd_mod_quit().

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes

v5: No changes

v4:
 - Add reset_control_assert() in rsnd_mod_quit() for symmetry with
   deassert in rsnd_mod_init().

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c  |  2 +-
 sound/soc/renesas/rcar/cmd.c  |  2 +-
 sound/soc/renesas/rcar/core.c | 16 +++++++++++++++-
 sound/soc/renesas/rcar/ctu.c  |  2 +-
 sound/soc/renesas/rcar/dma.c  |  4 ++--
 sound/soc/renesas/rcar/dvc.c  |  2 +-
 sound/soc/renesas/rcar/mix.c  |  2 +-
 sound/soc/renesas/rcar/rsnd.h |  3 +++
 sound/soc/renesas/rcar/src.c  |  2 +-
 sound/soc/renesas/rcar/ssi.c  |  2 +-
 sound/soc/renesas/rcar/ssiu.c |  2 +-
 11 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 8641b73d1f77..0105c60a144e 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -780,7 +780,7 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 		return -ENOMEM;
 
 	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, 0, 0);
+		      NULL, NULL, 0, 0);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/renesas/rcar/cmd.c b/sound/soc/renesas/rcar/cmd.c
index 8d9a1e345a22..13beef389797 100644
--- a/sound/soc/renesas/rcar/cmd.c
+++ b/sound/soc/renesas/rcar/cmd.c
@@ -171,7 +171,7 @@ int rsnd_cmd_probe(struct rsnd_priv *priv)
 
 	for_each_rsnd_cmd(cmd, priv, i) {
 		int ret = rsnd_mod_init(priv, rsnd_mod_get(cmd),
-					&rsnd_cmd_ops, NULL,
+					&rsnd_cmd_ops, NULL, NULL,
 					RSND_MOD_CMD, i);
 		if (ret)
 			return ret;
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 2dc078358612..c3c139a6fc60 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -90,6 +90,7 @@
  *
  */
 
+#include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_graph.h>
 #include "rsnd.h"
@@ -196,18 +197,29 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  struct rsnd_mod *mod,
 		  struct rsnd_mod_ops *ops,
 		  struct clk *clk,
+		  struct reset_control *rstc,
 		  enum rsnd_mod_type type,
 		  int id)
 {
-	int ret = clk_prepare(clk);
+	int ret;
 
+	ret = clk_prepare_enable(clk);
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(rstc);
+	if (ret) {
+		clk_disable_unprepare(clk);
+		return ret;
+	}
+
+	clk_disable(clk);
+
 	mod->id		= id;
 	mod->ops	= ops;
 	mod->type	= type;
 	mod->clk	= clk;
+	mod->rstc	= rstc;
 	mod->priv	= priv;
 
 	return 0;
@@ -217,6 +229,8 @@ void rsnd_mod_quit(struct rsnd_mod *mod)
 {
 	clk_unprepare(mod->clk);
 	mod->clk = NULL;
+	reset_control_assert(mod->rstc);
+	mod->rstc = NULL;
 }
 
 void rsnd_mod_interrupt(struct rsnd_mod *mod,
diff --git a/sound/soc/renesas/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
index bd4c61f9fb3c..81bba6a1af6e 100644
--- a/sound/soc/renesas/rcar/ctu.c
+++ b/sound/soc/renesas/rcar/ctu.c
@@ -360,7 +360,7 @@ int rsnd_ctu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ctu), &rsnd_ctu_ops,
-				    clk, RSND_MOD_CTU, i);
+				    clk, NULL, RSND_MOD_CTU, i);
 		if (ret)
 			goto rsnd_ctu_probe_done;
 
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 2035ce06fe4c..68c859897e68 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -803,7 +803,7 @@ static int rsnd_dma_alloc(struct rsnd_dai_stream *io, struct rsnd_mod *mod,
 
 	*dma_mod = rsnd_mod_get(dma);
 
-	ret = rsnd_mod_init(priv, *dma_mod, ops, NULL,
+	ret = rsnd_mod_init(priv, *dma_mod, ops, NULL, NULL,
 			    type, dma_id);
 	if (ret < 0)
 		return ret;
@@ -879,5 +879,5 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	priv->dma = dmac;
 
 	/* dummy mem mod for debug */
-	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, 0, 0);
+	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, NULL, 0, 0);
 }
diff --git a/sound/soc/renesas/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
index 988cbddbc611..bf7146ceb5f6 100644
--- a/sound/soc/renesas/rcar/dvc.c
+++ b/sound/soc/renesas/rcar/dvc.c
@@ -364,7 +364,7 @@ int rsnd_dvc_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(dvc), &rsnd_dvc_ops,
-				    clk, RSND_MOD_DVC, i);
+				    clk, NULL, RSND_MOD_DVC, i);
 		if (ret)
 			goto rsnd_dvc_probe_done;
 
diff --git a/sound/soc/renesas/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
index aea74e703305..566e9b2a488c 100644
--- a/sound/soc/renesas/rcar/mix.c
+++ b/sound/soc/renesas/rcar/mix.c
@@ -328,7 +328,7 @@ int rsnd_mix_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(mix), &rsnd_mix_ops,
-				    clk, RSND_MOD_MIX, i);
+				    clk, NULL, RSND_MOD_MIX, i);
 		if (ret)
 			goto rsnd_mix_probe_done;
 
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 3e666125959b..3d419b31cf40 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -15,6 +15,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 #include <linux/sh_dma.h>
 #include <linux/workqueue.h>
 #include <sound/soc.h>
@@ -353,6 +354,7 @@ struct rsnd_mod {
 	struct rsnd_mod_ops *ops;
 	struct rsnd_priv *priv;
 	struct clk *clk;
+	struct reset_control *rstc;
 	u32 status;
 };
 /*
@@ -420,6 +422,7 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  struct rsnd_mod *mod,
 		  struct rsnd_mod_ops *ops,
 		  struct clk *clk,
+		  struct reset_control *rstc,
 		  enum rsnd_mod_type type,
 		  int id);
 void rsnd_mod_quit(struct rsnd_mod *mod);
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 6a3dbc84f474..8b58cc20e7a8 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -766,7 +766,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(src),
-				    &rsnd_src_ops, clk, RSND_MOD_SRC, i);
+				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
 		if (ret)
 			goto rsnd_src_probe_done;
 
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index 0420041e282c..c06cebb36170 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1225,7 +1225,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			ops = &rsnd_ssi_dma_ops;
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
-				    RSND_MOD_SSI, i);
+				    NULL, RSND_MOD_SSI, i);
 		if (ret)
 			goto rsnd_ssi_probe_done;
 
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 244fb833292a..0cfa84fe5ea8 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -586,7 +586,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssiu),
-				    ops, NULL, RSND_MOD_SSIU, i);
+				    ops, NULL, NULL, RSND_MOD_SSIU, i);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1



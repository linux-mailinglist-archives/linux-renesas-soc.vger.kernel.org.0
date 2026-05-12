Return-Path: <linux-renesas-soc+bounces-32514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDg/BJByA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:33:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4626527C5A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44063314422E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF4B388E4E;
	Tue, 12 May 2026 18:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UPNpisLQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D653EDE50;
	Tue, 12 May 2026 18:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610538; cv=fail; b=CFdbXx96Unb4mkVmxwRl3gYaGRzNos2HbIZkRijSiF9BcPsg5pPwKl+zyQjQqN1BAgPDIw03T7q1SLeOzQBgb1BNvkfXMkXQlCaXVGjp4RspRVO7qahkTZImQPqOumFe53XG8WYwEa6QwKmDnDYLlGzW+Iu4DUdcc9ceXG0QUIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610538; c=relaxed/simple;
	bh=FuaeLO6QRlUeaWWPmpPtRa0GmO0QAIS/jS2EDYJdrhk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iw0ABzkd5EkdOe4APwBSbHVxaxt15v6qbOyCt09UgS7i1e6qIuWXI9ZWbggHoJCCYECI9DMPmHAYx2zsVEMhCDAS3bcl1LQ1Ogwm8BZkXEfqxAUJWJzpeC9elUP/chIgBHiJMvTfPmh5dcPI0XpP5+rOCdbWlF+urUZSWuCSeN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UPNpisLQ; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysmyGEHuixLN71WVYlcWBIZu0jQ8rXMhCMsZWy9Gw2ux/t9n3hgzCCwRo35UDc/g3ba+EQjAG1L4mzc52+N60k29af9IGsyJoH44gZb9JvltJPNN2U512GN+Ldl2tt/U8W11Ydj5xEzNY3nKxVJZWdtUaIHDSFXef19EdfVaI+WWEHbLyNMh/0Mvb1Dee5p/8flD+setomX4HYCUBrI6i0ARgSkZSIOKhOinvNEsbKyHHQuzY2Q0Gs2TIl4M8MCYs+aT74xwUGEmI3DzF2dkb+UTVG3w1JDZhUZDg0mpMRN870CK8KpeqDoZWWHJAuw+Hai0/YRSMAm1MmAHrOctog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V592+zIRIebmoETSyBi/wpQgx4U1kR6x/DST1LBxq6w=;
 b=pkMdYGivH/dNhUI8g3cnQKn/SJh5uCT+EPbwgEPQT0AvnGQirWYv1EWnffli0PpFP4Dt3KICvTCfes5bLBCmXsqWb4TP+GWrrHz2QKmkxxuIFVBBwCgXzT33FiEC0x3X0N9qJsd3Lq1ZL0R7B0WJGqFcrjLM3USk/9p4g+1In2anuRJZbMzcRgahhN6gGIYtZ8ZlYRBpaqwJ81Pkl8SyANHHxz+H7qkObGFE5UsA1EL0zQB6DSRN8hxpLwc+UJBoIxK4vfBW2qzd4u+ZtGuYzO6qjeDruw10u0A4h8Np0tBwtsvA6jGdWqZy76niTgDTY9f8dX/x8iLMluYiVLfaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V592+zIRIebmoETSyBi/wpQgx4U1kR6x/DST1LBxq6w=;
 b=UPNpisLQ1ZLF0owH/NEfMLz5zvunrEwifIBY7DbCfsvLag1jMdAbvc7t8c8AhzBhi7EgcCr/uRVTc7GXZhYxGgkSy5FH4DvSOHI4sCrxoERFhEbIGKInu+VqYBZNknd3JbC09BMjQuiQpyJN2JTO6d3pv+zrjym3oWxaxrtpjbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:28:54 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:54 +0000
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
Subject: [PATCH v6 11/16] ASoC: rsnd: Add ADG reset support for RZ/G3E
Date: Tue, 12 May 2026 18:26:26 +0000
Message-Id: <20260512182631.3842065-12-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: aee93bf9-b1c9-4136-264e-08deb05452ce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	J8Qzy0Kz/18u3L2A6vpZZjH5X9IhiXKdYaVjKgyYxRp4GQ45ATvIPr/lI5Ki6pJVdpmaHB0ocXKVFjajOUdWVNOrEbRec5WJ8NSGwAUrEntsii5M3cezkuJ+VzRf0lMNfJkgDsk1c3S3eCvP/F8u98xqhGy3uRkUl4L+M9ZInNOxUYCx37HjXEPL5xlZFvOTCauYwYO8VDxovxY/QiAIFFFMpOo/Fj+q+zfFvWsH23zJoH6xTyvt8odUj86M8mKNBpmEeWSZ0T8vgSGMuIz42zQ/PuyzPsIqZOj1ZOVhvfkgvN3G1rfJC5pGuY8eDmPOv7TSTQiPNMTOlhcIELSOY/VVpkrvM+Z4GLxFfPpXtrZuoEbMsU5ihq27tcmDRRDxjvE/uVlc0LDRvvLxmxxphBMyqovAhEkAgiPysK/VBRtV4G00mJ60ZbRkiS9L5x4VBLDGGip/p4itJLsW0jYNbo8IeotPWEFM9FKVy0NTLbKLf6GN1TxSzp5Yhg2r+KiS3nm1NahS2MBUNeGEvNihslzZxejWB6JAKZHC1kIoJnckG7Q6iLYymP3BliouvLlGqQFnwpGjDWMMMS1tTLLOn3CFs+/HwmZJBHErCPIv62HAppLvQXaXr2at9P2YJV6zcA87s8JmwpGvu1Uz6lB5OU1MQfMp4Td2/k5U8UtFIc2cu6m4Las4wTE3cbva7UiL31H0ADJC1Cf28PrbwaP1bx52gyNzcN2+3xq8jOkX/b8qYZagEkYf842F6oiOkOQl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dEInpH+eHbO5SxaEz47j11a4RSmPMsWqMZ9nv8Ifl6eANQ7cOzN085Tpmg2P?=
 =?us-ascii?Q?JicfGOh8yqNn9/iF5C1RMgem3bzY1IDc+Qz7dn/O9/o657wsnjyIIIy5K+tW?=
 =?us-ascii?Q?/a2G6RHznmJ/vYtW4KDuog5SscrytXtQXsrNidh71ehxmyuNJulL4TN1XnmP?=
 =?us-ascii?Q?Nno9LUrqi7Io2pyzbi3sqog/IHTPpAi2yNnauUB7zSER6nSNbFECiUrC5hTr?=
 =?us-ascii?Q?upvlFkdQh4gifO8nE2a4se7JqMdVCHU6cPHwx94BlHKIea7BZXt1W2Kr0Amp?=
 =?us-ascii?Q?fkDmGgVmuT4dJ+sr033pbTgrVkC1qSlRS82u8NkMyvtZ++M+ifzT+mRYvw6v?=
 =?us-ascii?Q?HFGECnkwt+PIcPprkvdXK4irn7+pPq0d+Mwb4cmO+WvKI4EG1fL6+/Pohu8k?=
 =?us-ascii?Q?rDotqqxEu0RNWL/BtBsILpHH9nNfBdJD/Zmsy0ABm6RaAv1Te80/HRtzl5HO?=
 =?us-ascii?Q?0JJ05LBTvQlklFm0wIOEnRwL2y7Pb4tyRh6IxouRk5g7zlU7D8WVTa3H1Y6d?=
 =?us-ascii?Q?IqPchdI2d+UlYymhocAiPKo9HVArMVEVTVYGU0hg/ZtmdXVa9XTMPZXBflDp?=
 =?us-ascii?Q?bygcQqfqWkq3JJvIspA0koncUvj7jD2ZTfa7SfzUk6jHsAuC2peJlbcX9hgU?=
 =?us-ascii?Q?bxAoqYyTd6KOeTTqq1wMfX8hrnIC+BRuiyqteO/kxct+PN/4csklDYj7Yaxc?=
 =?us-ascii?Q?HNGV4H0xZocpKbjkVwjkdxaLZThhkehZECdwrIMpTAQWpbR7mBDQ0oyn1LBt?=
 =?us-ascii?Q?AjMpknDOZFMlGfY25LStoCXqWviBAJE3gjmx9tqgouhpvHa3/qPLrO7uT/OL?=
 =?us-ascii?Q?M8oDl6sjT0nZf13CvKu26nAQAMOFcQs4bn6g6TTpYX8C2RITRDm0QEH6vlRo?=
 =?us-ascii?Q?jba6jjVZQz98E5c8cGwggAYXctG6IbyeeAhoLK4hSOXtOl3S5lYCTgdbjTS5?=
 =?us-ascii?Q?8eymtv6sVpTH/R4tr97+AyCjW8wvGRCiPmPKkhl80OAautFwl8hpYfF5spOq?=
 =?us-ascii?Q?zonPxSwZvdTONX51Q+VJVyVSqCuDQ+2SzhYkOlhVe0gv1C3AyCOf8FVW7N8u?=
 =?us-ascii?Q?qcgRPrIWfaZE1+O8e6MFyumUvrE6i1Z3Xw4WSpT1MBKEfyDY2lc8ZvJLiixc?=
 =?us-ascii?Q?Cd4+Vcp7u0kWkPsP+tV3c/wWk775uq2V9DWqQ8x1XcUoBDg7KBQHeLPKCu+m?=
 =?us-ascii?Q?J7NSENmdt/FgtxT+FSt4IVu1Nor1xvL0J+Hza9t1ItmTr/bbQ0jeipW986L1?=
 =?us-ascii?Q?JrYaApntaaxpfZqVY3UARFxKZmBiahGx2uFz5Wl3nIWP08laps46UGQho9LL?=
 =?us-ascii?Q?GH4M8gazbwDLEOnki49kWeKmklgSgEMBra3U8l6mjoyRjBIfTtiMPWPvdZc7?=
 =?us-ascii?Q?Bx5+NOz6dgOcg9Ay3C8kKK0j9HQgaf2a606DEyZoznas8/mIgFaZPoS7GwZf?=
 =?us-ascii?Q?3eAf74rX3x855Smxbtf/ZgQ7wFatMOpJFzN1CsC4D85Vvb0Valo23M2sesx5?=
 =?us-ascii?Q?BGBkIb25lG2RP9begsHD73sIKJh95+e7rZBjC8uZrEC5Q7Xjbi/9Wj6YJtRy?=
 =?us-ascii?Q?wgXCRmKwwi7ButE5TS7lsphCU+94Q/mCoE2fC5oLm4AwPe4hG0UQf7eNolLu?=
 =?us-ascii?Q?D+9smX475iGuPC5giWjmJeADAj6wX6FBH+7b1kGc7RwyGHIIuDNmjohBVdnG?=
 =?us-ascii?Q?Auwh8beRhVWh5N6Zts037miBL7jPy0DLX4TzBR3SVQ6OmAf0irOG1LpZYHrZ?=
 =?us-ascii?Q?47z1/5fTPiFz78GJ0PHztoIbzMpLQs8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee93bf9-b1c9-4136-264e-08deb05452ce
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:54.8902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Nz0bqLdCQykWaMdUUtVJt+w2UvuaFwgQAFXvH4rl3dlnnHCgh/nZ7KhnhZjS9Q0KckXCwVf7hcWCPKmdK8mKFU2yZl4syC578QsRTU35WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: B4626527C5A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32514-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

RZ/G3E requires the ADG reset line to be deasserted for the audio
subsystem to operate. The ADG module clock is already managed via
rsnd_adg_clk_enable/disable() through adg->adg, so no additional
clock handling is needed.

Add support for the optional "adg" reset control on Renesas RZ/G3E SoC.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes

v5: No changes

v4:
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single
   lines.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 0105c60a144e..813ad5eabba6 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -771,6 +771,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 
 int rsnd_adg_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct rsnd_adg *adg;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	int ret;
@@ -779,8 +780,11 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (!adg)
 		return -ENOMEM;
 
-	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, NULL, 0, 0);
+	rstc = devm_reset_control_get_optional_exclusive(dev, "adg");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get adg reset\n");
+
+	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops, NULL, rstc, 0, 0);
 	if (ret)
 		return ret;
 
-- 
2.25.1



Return-Path: <linux-renesas-soc+bounces-32516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BrcJoByA2rH5wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:33:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF58527C2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2B42301A53A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED713955E5;
	Tue, 12 May 2026 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TTHTb4HY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011023.outbound.protection.outlook.com [52.101.125.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E5E3955DA;
	Tue, 12 May 2026 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610551; cv=fail; b=tvd/dRVwzlRtPB8QHxi3ENRAwzCFUu+1RjYAOhyDks+ShqzefKDxCTcB5VlsW7PHpgjv5divugZ52Gshbne2E8WFzcDpraSkDbCZGRvAZTjV4owugVhmvDecYcuKEbCCVrQGCdJhyv1zb7J+BomAA13Kra51G+EvilpCwyNKj88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610551; c=relaxed/simple;
	bh=m7SiCeXjwG1R6jeQ/slV8nacOLZZdCUor0P8DbNnfZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RmaviM9zUq29r/7A5U85kj8SwCiiCbw3ZFJCpngXOTb4VXHxEkfvyWB0+jakWZHqNu8dLrFZ/a5wibBK3sQuWklqIjyCTweLa1qzfuc0UIUwFh5F1ANMAJQu39+G7wzwaJzZLvLExmAq+OgPGnpYd8/0XuHIhwPuZgiApIBm21o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TTHTb4HY; arc=fail smtp.client-ip=52.101.125.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4y1lX7xVkrzOXgzAICghWtqRUG1pZMVRORxjnOF2ac19yuwddG+rK7c16OqEyufOCoMKZg9zLW9LqT4oAdNR7pfhXOD3HBy588PPamavuBCvWMtlERiQCf7Kdb4tr0suYtHlBi3p1hxpJhaim9JU/eqhu+MssibBM/RMSBgKqOjhKjfwYkVyZxwTX5Y4OfXWlk+sulXzt1w9aiAmFenb4XyPXm94gL+FXLEuHu3pvFLcfho2ol3GLZ+KobmA6XnQRNut4+bbz1tS5QNzsMrfAQoru2a8k/kJFW56OkBjG1bhPoAukgxd1DD8g4BdjvexXiALBx86sJq00+3+Zqfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs+EeBsbkNprIdezQxkUykH4LQafdXVBDmc9fkqcRSc=;
 b=qeixeJ5gZBRMyb7LVNDejDceYO+e5EcFFQ1SdhL6PpqDxBI6SI5tyQwZUDyFcCyham6iqJ488hIBlhSRG80gcGA3jpzZQ0OjyJy1UiWTa1rZws2xxgC/LjBy5JdcEJgyIaeCaQcyYCYbwZhjCQmMQjWJ9D6Z6dQh/xei2Xrt4TUQeBHGZY3nECX2p+ejqV3kIAfdhQI+c3/PITvWRJYjtnLVnhw1f9fWX0zvL3sDVS8ambpSmTsPufFbTbD0RyUqMk84NTQzDJq6HMpLFE2FTny7rf4b+hJ9CA9WG9uK5285Cz+0HUmokWGxSWRVHlLiCtURXPMKxTC4JzpfeQ9TuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rs+EeBsbkNprIdezQxkUykH4LQafdXVBDmc9fkqcRSc=;
 b=TTHTb4HYxpomCsECA/N5Xroxhmq+03kr+jaa1BCvkq+UxNoY5AefVEyjNjtPY6k/GFI97HmWDo2H+W80gHWhxchecBlOAJ/WHOgwcL4DQJ0q2LXPrlfKArGyNmlC1VyXG4mpDIJSVFrjpMaNbH7LYT89tnllQdUkz5+Tny+LJQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:29:07 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:29:07 +0000
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
Subject: [PATCH v6 13/16] ASoC: rsnd: adg: Look up RZ/G3E clkin under audio-clk{a,b,c,i}
Date: Tue, 12 May 2026 18:26:28 +0000
Message-Id: <20260512182631.3842065-14-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: cdb65956-49a0-428b-b4fa-08deb0545a77
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	mfjHtKcHXCyIQrXqSRIvXjh8CztVtILbO1bwOGrM4aXQZweM01+kpBIIufrqwWhsfwjLNyBR1ve+OFQNFlTs5FW9fzW1ImoMsf6Fk6qCl2dlgeoE6ehlXhJ33oNF/Ka7suRPcIDmSRLSvGMq3c6u3tI+mQ09XaZgdqJT2pMIBFlkU91dNcn485b/IlVEoKwx6Eu8X6li6XNsQ8TRwGsnxs36grf+0YrnENcU9yNA8CU98foQI/W1A186g3dFbxwZqjtQh4M2/mLnx852HNE/k29GnflVvTEbxipqiJoD/MTarOwQZQuOpd+eQrY4MAyooch542HzJWnkRYht0lYZZypyU8xN64q08q9ThLY7w5Lw5a0L9yudyLNfOoAGGexXgt7COXSU3CaQjm+VNjFhVZ7nM9c+EYj9eeCFKHCv7SkCF2uoIj7DDrod7ATshVeeGTU5R8MmdadLa3vzWoWXZfrRgUV32y+duJpuXKpNudTIzOg/cUns2mIkKQzdqw+xKtixLrW7cR+xPyNvYpG3Evn9RyO2TQ+u6oRa5VDcHQLObPnCEY7abTSO0LoUly8etU37xaP8GbIdIc0gHhhbe9Af7gOZSdK4wgEiCtZV3tbgqvqroB+jj4jnh6PIbOYAo/yo64/nBLgyKlmvp9X5QyAgqPaMjIl8gkMd15X8lK307wq3wz8MeuXa+JoGuajJi1BKynsPepywzVuHsgiNRUsZxZv2ogDfwAg7EY1a8UAZyaguxUELB7SU+LyqvGkA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S9g+1aO+M9qdnePMy7/SnKqBt9+NAt6SY3uQtIIdxRROvlk3bBua+8xDsZZ0?=
 =?us-ascii?Q?BoyK/lrph0RiHExTkyBVdyPIZqz8D0LP6ZCmc9NjQKxVGX1PBN7BckbWxjaA?=
 =?us-ascii?Q?whZER61PnHcKfaOoUF5hp0Bea7jxc0pzvNcMLfH//CBN+kGOteQqvgulNkJF?=
 =?us-ascii?Q?i4y5iAc6c8YtB4rIFSdOYuoCRKpC7ZrW7YIIH724agUWT6a6ZINiNXgNiJV9?=
 =?us-ascii?Q?P8UjBLRVWXZHgDWBkqSywmhqIHncd0VaqUpIoyIYUpiyVMJiEmv61JwmmUTD?=
 =?us-ascii?Q?2DyIYM6mamVAFHT3ucwctrV9a33O+VVbDvSomBiwtXiKamAf48wpb4NSTaGE?=
 =?us-ascii?Q?ZPvGq7SISwdnd6fm+V3ziPmhUxzmmkENnoqGCbnd9mnkb88QiW5uYFThz8hK?=
 =?us-ascii?Q?3qBZYkbKElY8Azikzchoib1QeMfsJvcI5FI6yN/l6uiZfNSq7OdRmqSidFEm?=
 =?us-ascii?Q?RAXxqADFgnyoyTeXKvchHICgiDj9bwRhhsLJFdP60qgOTmjCyVCKrDi0Aix1?=
 =?us-ascii?Q?GyTvSzB++iCwAT2wFKvOR33OVSAOr+W/gnMRvcgh6y1LtpW3dTI9oG18C2ex?=
 =?us-ascii?Q?f24pvzTB2VxhSmPgWqYRkiHdMufZJLsTTrjmAGbcZPagCLthSYDjDUSRQ3zB?=
 =?us-ascii?Q?z8TueoXCXUIsx2wAO2lPukR0LPU3y1bEvb0sdHST6haJ/IaWANZTLJ+I+iqL?=
 =?us-ascii?Q?2zQKe51tAC/McFP5JEA+bEtrs6OVNiZXTmp9vhg/i4EeUeekV78q/REYbuXr?=
 =?us-ascii?Q?cnXGc3tISj+E8Xat50QZjuYtFBNri0KAtxDMbETj/f0rVPEcgIPd+2IwLart?=
 =?us-ascii?Q?jwv/zz8m5v9mImqZaQZOhz0naxvm5Ar3st2XO7eMjDCzBVlPIKxaR3Ps7ud6?=
 =?us-ascii?Q?iHS6IYnPfuyTmYlYSWIawsAatGtOUpwqvllm3ZxN99asTPrL2YIOnEaogfsS?=
 =?us-ascii?Q?poHIGVoolWv4CCDUk2kS40h8XfaW958OGTU+Q+KtZiE7KyqzhSlF1WAJcaT4?=
 =?us-ascii?Q?aRk6rEJ97mvLq8DEvYnLvN7LfHHYva6IjGI4qmJZp8ZMlufp0WmH8GHVFh88?=
 =?us-ascii?Q?wnOswlsqvt3dIotjXz2P79ijx+PlcZQo+knuriCD1bHdD4RSQ+NHecO8/my+?=
 =?us-ascii?Q?tQimNFNdvDlA7GHbHoEeuUjH3DghQTJeybdbufSrdiR907Gi/+UkgxZn6W10?=
 =?us-ascii?Q?Mbb+UulsvTxMawOIraUisfh+3pLjtU6L9RW14CsrYgrwoVLFPOL2x9ZBExsL?=
 =?us-ascii?Q?Mr0VKsOsiC0oEpxpsILF7iQd2VbRmpvkffhHz/s97BnR2zLAIxl4JvvjNtyo?=
 =?us-ascii?Q?jUKI8tbgbw00Kc3/xMGu7Eb2EToHtP7PJQcarEk4vAFJZK5PqJhZ9k/qatJj?=
 =?us-ascii?Q?4Z48soi1pAREVOECzREG+upQIA4opMxZxijulWi85GKqkwOyfIO/I+byuafF?=
 =?us-ascii?Q?DRDfQKP7ykM28/MOShTvz8PqLMvJycUUFxR5deXVWF3NQiGXkKGjRudNnwU5?=
 =?us-ascii?Q?yV6sYXuf8/NdVTUYfPDi8aW6K+L7KDzMXe2z/9H6bi62Inx0eYcAv48M1aq7?=
 =?us-ascii?Q?ov6FZ2JAlmQOM4/jOlogPFd6m7DavJ/CaapOHkHT+kLTtSZ4sTj9ViiUBxXH?=
 =?us-ascii?Q?UTALIISLKRMcDYEjuTCLXwxGB1YjydfBws+YKp8opmhDexqaddwx2UzsfR8O?=
 =?us-ascii?Q?jy3ug5IAYgWa6xczBsjilW9WyzOJeK5inE1FCJyyjONniNbPU9OkHyblUUQm?=
 =?us-ascii?Q?sBIah4ZWKds2nyJaEmkRrAfyHK/7GTE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb65956-49a0-428b-b4fa-08deb0545a77
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:29:07.7701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bS7HaunhhgHaAjvOSvHOirtd116nEzdguPEM6ejryJ0qIa6Iob+WpgdZLu8PS97KA30wM86Sjqo9FaBUq0wx3b+DsO7sbGMGDbqYYohNp+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: 9FF58527C2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32516-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

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

v6: New patch

 sound/soc/renesas/rcar/adg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index a6d34252dfea..203298b63b76 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -76,6 +76,13 @@ static const char * const clkin_name_gen2[] = {
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
@@ -536,6 +543,9 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
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



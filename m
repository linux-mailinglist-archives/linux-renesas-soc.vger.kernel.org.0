Return-Path: <linux-renesas-soc+bounces-33090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHFiHsouFGqUKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:13:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C6B5C9C83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17C093041A4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27A637CD5F;
	Mon, 25 May 2026 11:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HWqTfO6S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F237DAA0;
	Mon, 25 May 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707246; cv=fail; b=fxuQfrTLLUFXb5K0EZUSydFt91RX/SRvKSnepfCTU5LG6rrfv+N4HSmd/TLoatpu7ggV5CMr+mBAB3Wm2cj6Yo8BC2JKKxdJunYbKDtpLqaZZB1y1i7SUo4JCodj81IJn0E+pqHgVjLrZW81ewDPD5TkFlv+f+86OmspU3+YmIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707246; c=relaxed/simple;
	bh=LujwySV8b1C3iyAmRnv1SOhchnVGpJizeotQML65Aek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r8ck9dsfk950TArMrXwEri3E0CAm1qIoXOmcpEMuGmOie2h2gXvGqgum00wGLO2V8bUrAjfxteV5LUiy9U0vpIDY97QyaglLHioNafz44opdJecTbSzDN//1kKeZ7MDICXLZsrJGR3yuYUMBjrN5DvTTVj1qyLHqC+eJlsYMCfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HWqTfO6S; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mps8z7rEW1V955HpK6Qco+GVOoZ/R8HJGJaYJ7yLdyAdHogvvUWF5s2993clZw+dBHlXAXyJM9QAtdtDrIrB5DeL4ia85B1yn5fVmRSI4JqnjWgS7LGOp+/pOS+rFTkn41Y6tqj8BTmYZ7E8cgpOnNfgMcKsFL/fs2LefacRUl+lYGdT8IatTYoKyA92rV7XmD+MhzlBlwRVdQXKqKVNmDqnbYKBBcw2pVtOXArk4uxJD6QUfSv9JATODpYY6gGGAwJfEuYoqUuaNKWwrIcMt4xAkb0BqeG7XcnSzmZ0YyQamyoUGrAv7/ogo4tayNrp02nlaKCOkJ/QXiHVwaOu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3P+6iU7REzwdehnylasyQ1mnarcnyw3cfd5wvPzNJ0=;
 b=HfQFeu1ym6n+NN4xAi14sCewLvoiWG4qCNzGTAPYi+2kwDgJbbaNYc0bDryPLiMGTqb2SaucZCoH7F8MzCaCOKDd7ViSzufNeLJAxQOvdmzO9PBD0uDCWiYafo4Uxgle2n/c8fejvct+beIZFR+fq3s+LeYOp+FtO40w4x/TXz0TJyofC7/v9rRlpMvKCuwpT2a1oMm7+4qz9wJisGLMZpTiZmPswijFQeBvRqPmnlEmX4uhTaF7xdNFCeEr29u3y/2lO6O8Y4VlgH43Tq8cURX4Zemx6Wy7/EpuqJlK0W0Lu3i+4b4a/fJzCMIm0dYruk91ozT9nRAYxl/dn2VNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3P+6iU7REzwdehnylasyQ1mnarcnyw3cfd5wvPzNJ0=;
 b=HWqTfO6S4EV+sWD/3ciTuYhblD4gUTR3kc3/8Dfe+L9G/bAZoHMBANjAvT5Y2VO7s+R97wYBYjo12QWCiMrkwJerUHnzz48qF3bCY1wN3tJz59iLVZFYZc9ZmYChB1Z0BOaWqqBx1TymdszswmfzjzlghY2Qv5HPRLpLIff3kKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB8484.jpnprd01.prod.outlook.com (2603:1096:604:189::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:21 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:07:21 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: bmasney@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 4/8] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
Date: Mon, 25 May 2026 11:05:59 +0000
Message-Id: <20260525110603.4018170-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::11) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OSZPR01MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 248edf88-d567-4a7d-4c1c-08deba4dcaed
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|11063799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	x28faaMn/VpjhPcAXZIuKoGLbJnA5W4uTL/Vydwnuuu8wHe/5S0h4xj+MKucBbv8tp6cIU+FW43OSMvfdbxoIXE0yPc1rzN5tYh5P8Y3FfyNCrUbvUjDDfaoCsiXRX1KodH5s5GTUJCgpcyB02EMC7rqjHLZRWkchdmgVkU5KIqnxov/MjnBBv+KTnssAJ3CGpW4dz2g+MOOPejhrV1Ohn6IXOYZC6HyOG1S0wHGL5iEwpbbW2dPzPMurNrIsof4jOUYV7ZlE6+ufRPBn/m4cNFsXMdmwi+L3uuzofl3JjFD9MT0dLB5Lw0CAT3gwVIedmTPo8Evn2PYw9iyF4gxVyntnSYa6EtxiBAji93VEQYZfzwRUW1myCCWG3wysWgXsU+kSBPdGKKxebSNA0uOIoWLhQrjbbz2z/lHvgIQiIWpaVJHr43ajuG0Y1jkrQadLqrgX3YbMtW/DVBrA4yAvaHPhtYqqdR7xBzFoiV5Q7qirvIVYxQZ6jR4Y/xwJqOHAAjyWGL0uciCiztwgYkJ5Nx1T9M380k+QaL6TVPsU5jYFyAHaz1E/IZLnAd008Pbd07hlocV7n0NrRJBziuiwZbxB4AV8vREevzaHTO882TbFkigjcua93i2X5YNyB4lhuyGfI1CyC7BAPIuL0+CyhiGK7yyN4SAeP6VQi3MxkShIQZE9QCsT1YQsQftNZT5ulcC1mrLfTrpwWZUhmyTg1enbO2UDhceSLM0VpSsWnpLM3J1DJ/SMTCQkv7p3SgW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(11063799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TUIkn4zrERojt1o+LW8sjYEkS6rjePJ1YGJ99L8hyaAFiLN4G+ohMLhl9rfo?=
 =?us-ascii?Q?G5SQcQnLXyjgTvxvqZQw6y2HcKpXgIgtCA51dqvMTNK5XfPqJt4GtA1JXKm7?=
 =?us-ascii?Q?7kXCgpUhfVSM7ebEsiFxRFC+bNARX3keCKctbvs/MfTTg3Rcd+eMq3w0WN+2?=
 =?us-ascii?Q?WIuXKeu0XZzUdilwJs96d/a9BzFRl2GgaOtvkqEE71vowytNCk37/AD7jkOI?=
 =?us-ascii?Q?arqTZJwRGe7N4gwb9o6bUBbq02lchBzhZE77wyW/SP4W1D7jXVyZVYDPNYh5?=
 =?us-ascii?Q?k0bgwtdp85tcchgTOfG7sj616Slk+l9VUWIPXaIG664KohH2g5pX+lRJGagl?=
 =?us-ascii?Q?3sABTGoFWNf25tCVeZ8+oreTP/HAiD97LLI95Hloe/GimJZPWez3HvvjD2Q8?=
 =?us-ascii?Q?JvYMly1w5k+EpSqgQYIE1/c+PQF8kK7rIZAv0WmrM+4ErpwgnhW7ocvmG4F8?=
 =?us-ascii?Q?t4zu1xZfWEWTA1o/7cvvxrNiX1h9X0tGURUqPr//LWyYYjRbx+/evLnA5knW?=
 =?us-ascii?Q?zqdBMjJV0BdHUU7T5kqvj7u5qLrogH3tS3f1M7E+tmne8zvtKh9Or9d6H/2E?=
 =?us-ascii?Q?4LpC3oWVTOfpn9wuSUhKrnj7bGbYPdiUa35oBVDTOaa/21tqUX+Px2Lnlynp?=
 =?us-ascii?Q?rf+/RIWGMXWGsRkaz5NC1V3wjr+eU3q3T6IhMZl9DhGchlyNlrAWJ8aOH+Ad?=
 =?us-ascii?Q?H/2toLuumNeQ4gJL92ITfPoEe7fMhBMSz7rtiVZSQ3JmxGbSaaQHdFgUVRWt?=
 =?us-ascii?Q?O5UcWZBb6i2OmSTe0ro/SxuzdEAn2Keg0sLIvhxa5GzpmFk0l3s63wEz+kJu?=
 =?us-ascii?Q?wwRVlM9YgYPAb0l49iFNGQRLIEFUF+sCZ0mPyQ/lkNU5w+a7PiRRCtLwdk4l?=
 =?us-ascii?Q?UPMEeOjmYauiPWuQifS8TrXuJWhxHwmIjM2QXvrNHgJSTFcXjqexvVKT5SZM?=
 =?us-ascii?Q?ZmGWN1TZGliOdSBu0vebm2E9a3UjLP9/qCH9N6GTHhW+2mEPMeWtdP82M06k?=
 =?us-ascii?Q?0XVyiRelvQ9b3ayiNouosL5hyLEidnv0gZdNl50n/X7V8lP7v01I4rJdjA4q?=
 =?us-ascii?Q?JSMs+DVk7ok5q7kVCLjuX3UMJ7+VRGeYqS9WIVWdveWfhYULt75SnEORjzIQ?=
 =?us-ascii?Q?DnAfjrWqBKWtHUDdOFxfSSVyU4WgT25P03rIncGf7WumH4o1Mk2ugSFQTAnL?=
 =?us-ascii?Q?kz0mgVkF7SeAI0bww2I52pIsdB9qeltjtpApS+uu8VEaZXSuv4kxzBzw//xI?=
 =?us-ascii?Q?aQZ43JTkR+7bu3WnUVZThCrA5u3WMiRUOiNqXEl1tyCcRwbiXNigtDtS2xUJ?=
 =?us-ascii?Q?8XJP3REAJTFHcdpTq4ye8uOeUihUoZnL80gPVsSOZWRYaNPlJd3aA2PQAKB5?=
 =?us-ascii?Q?BI3ouHXclwO8moRUBBbJokJsABG7pn5Qni3w0kBkBGWQvV31b5uRAV9X+lqR?=
 =?us-ascii?Q?3CU6AgoKPyFaHJ8KZrimIL4uGjs0urzdVieyo7yVZU2EdD8x4bAiBJo++yUC?=
 =?us-ascii?Q?y7At7oJc4yMLTHWEKYkR49Zaw5i+VI2lqUPCZIIjUXm938qbhbNfP8nmtiAA?=
 =?us-ascii?Q?FybLjxAls0FfXcE8uY+UHg2HJFCYC75z6vrUsBDIqV13Y4QgT3icFucKDkns?=
 =?us-ascii?Q?bJ4D0wLRkeg27sKyw0FH+rczfOoHOOb9Co/04+Kf+D5sU5hU2jtzU8AQ/6lf?=
 =?us-ascii?Q?HMpToWvM+NFU8y4AcF9Uj6+k+RjbmPzKjVnYPmS3vh6xcj2nkYpcCmbrtI/H?=
 =?us-ascii?Q?cTwmAwIDKSLOt6GZexx8UzP/8fluE+A=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248edf88-d567-4a7d-4c1c-08deba4dcaed
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:07:21.6248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2jNI2ztKgah4P+lXD5xcBMCf2NreklRcSJY0KPGC4C+bJt4Il2zPRY0KYuZB+lJKHAbdRgUmJbNwgbbtXwig3gxD0IU5wTwcB0hAYfxYzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8484
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33090-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[redhat.com,bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,bp.renesas.com:dkim,0.219.186.0:email,renesas.com:email,0.195.91.184:email,13c00000:email]
X-Rspamd-Queue-Id: C8C6B5C9C83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:

- SSI (Serial Sound Interface) units 0-9
- SSIU (Serial Sound Interface Unit) units 0-27
- SRC (Sample Rate Converter) units 0-9
- CTU (Channel Transfer Unit) units 0-7
- DVC (Digital Volume Control) units 0-1
- MIX (Mixer) units 0-1

Sub-node names follow the new RZ/G3E sound binding: unprefixed
'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
the legacy 'rcar_sound,xxx' R-Car prefix.

Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
with repeated channel names, so that the DMA core can pick the first
available controller.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v4:
 - Rename the indexed clock-names and reset-names from the dotted
   form (ssi.N, src.N, adg.ssi.N, clk_a, clk_b, clk_c, clk_i) to the
   hyphenated form (ssi-N, src-N, adg-ssi-N, audio-clka, audio-clkb,
   audio-clkc, audio-clki), matching the new RZ/G3E sound binding.
 - Rename the sub-nodes from the legacy rcar_sound,{ctu,dvc,mix,src,
   ssi,ssiu} prefix to the unprefixed ctu/dvc/mix/src/ssi/ssiu names
   used by the new RZ/G3E sound binding.
 - Reorder the clocks and resets phandle lists into ascending index
   order and annotate each entry with a per-line comment naming the
   clock / reset.
 - Drop the #sound-dai-cells and #clock-cells explanatory comment
   blocks from the node.
 - Align the continuation lines of the dmas property.
 - Fix the commit message: the node label is snd_rzg3e (v3 referred
   to it as rzg3e_sound), and add a paragraph noting the unprefixed
   sub-node names.

v3: Typo fix in commit description

v2:
 - Remove 2-cells specifier on audio DMA assignment
 - Do not update DMAC #dma-cells anymore

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 476 +++++++++++++++++++++
 1 file changed, 476 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 3e9354b7411c..5d343bc10243 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -912,6 +912,482 @@ rsci9: serial@12803000 {
 			status = "disabled";
 		};
 
+		snd_rzg3e: sound@13c00000 {
+			compatible = "renesas,r9a09g047-sound";
+			reg = <0 0x13c00000 0 0x10000>, /* SCU */
+			      <0 0x13c20000 0 0x10000>, /* ADG */
+			      <0 0x13c30000 0 0x1000>,  /* SSIU */
+			      <0 0x13c31000 0 0x1F000>, /* SSI */
+			      <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
+			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+			clocks = <&cpg CPG_MOD 245>,	/* ssi-all */
+				 <&cpg CPG_MOD 385>,	/* ssi-0 */
+				 <&cpg CPG_MOD 386>,	/* ssi-1 */
+				 <&cpg CPG_MOD 387>,	/* ssi-2 */
+				 <&cpg CPG_MOD 388>,	/* ssi-3 */
+				 <&cpg CPG_MOD 389>,	/* ssi-4 */
+				 <&cpg CPG_MOD 390>,	/* ssi-5 */
+				 <&cpg CPG_MOD 391>,	/* ssi-6 */
+				 <&cpg CPG_MOD 392>,	/* ssi-7 */
+				 <&cpg CPG_MOD 393>,	/* ssi-8 */
+				 <&cpg CPG_MOD 394>,	/* ssi-9 */
+				 <&cpg CPG_MOD 372>,	/* src-0 */
+				 <&cpg CPG_MOD 373>,	/* src-1 */
+				 <&cpg CPG_MOD 374>,	/* src-2 */
+				 <&cpg CPG_MOD 375>,	/* src-3 */
+				 <&cpg CPG_MOD 376>,	/* src-4 */
+				 <&cpg CPG_MOD 377>,	/* src-5 */
+				 <&cpg CPG_MOD 378>,	/* src-6 */
+				 <&cpg CPG_MOD 379>,	/* src-7 */
+				 <&cpg CPG_MOD 380>,	/* src-8 */
+				 <&cpg CPG_MOD 381>,	/* src-9 */
+				 <&cpg CPG_MOD 370>,	/* mix-0 */
+				 <&cpg CPG_MOD 371>,	/* mix-1 */
+				 <&cpg CPG_MOD 370>,	/* ctu-0 */
+				 <&cpg CPG_MOD 371>,	/* ctu-1 */
+				 <&cpg CPG_MOD 368>,	/* dvc-0 */
+				 <&cpg CPG_MOD 369>,	/* dvc-1 */
+				 <&cpg CPG_MOD 251>,	/* audio-clka */
+				 <&cpg CPG_MOD 252>,	/* audio-clkb */
+				 <&cpg CPG_MOD 253>,	/* audio-clkc */
+				 <&cpg CPG_MOD 250>,	/* audio-clki */
+				 <&cpg CPG_MOD 384>,	/* ssif_supply */
+				 <&cpg CPG_MOD 246>,	/* scu */
+				 <&cpg CPG_MOD 247>,	/* scu_x2 */
+				 <&cpg CPG_MOD 382>,	/* scu_supply */
+				 <&cpg CPG_MOD 352>,	/* adg-ssi-0 */
+				 <&cpg CPG_MOD 353>,	/* adg-ssi-1 */
+				 <&cpg CPG_MOD 354>,	/* adg-ssi-2 */
+				 <&cpg CPG_MOD 355>,	/* adg-ssi-3 */
+				 <&cpg CPG_MOD 356>,	/* adg-ssi-4 */
+				 <&cpg CPG_MOD 357>,	/* adg-ssi-5 */
+				 <&cpg CPG_MOD 358>,	/* adg-ssi-6 */
+				 <&cpg CPG_MOD 359>,	/* adg-ssi-7 */
+				 <&cpg CPG_MOD 360>,	/* adg-ssi-8 */
+				 <&cpg CPG_MOD 361>,	/* adg-ssi-9 */
+				 <&cpg CPG_MOD 248>,	/* audmapp */
+				 <&cpg CPG_MOD 249>;	/* adg */
+			clock-names = "ssi-all",
+				      "ssi-0", "ssi-1", "ssi-2",
+				      "ssi-3", "ssi-4", "ssi-5",
+				      "ssi-6", "ssi-7", "ssi-8", "ssi-9",
+				      "src-0", "src-1", "src-2",
+				      "src-3", "src-4", "src-5",
+				      "src-6", "src-7", "src-8", "src-9",
+				      "mix-0", "mix-1",
+				      "ctu-0", "ctu-1",
+				      "dvc-0", "dvc-1",
+				      "audio-clka", "audio-clkb",
+				      "audio-clkc", "audio-clki",
+				      "ssif_supply",
+				      "scu", "scu_x2", "scu_supply",
+				      "adg-ssi-0", "adg-ssi-1",
+				      "adg-ssi-2", "adg-ssi-3",
+				      "adg-ssi-4", "adg-ssi-5",
+				      "adg-ssi-6", "adg-ssi-7",
+				      "adg-ssi-8", "adg-ssi-9",
+				      "audmapp", "adg";
+			power-domains = <&cpg>;
+			resets = <&cpg 225>,	/* ssi-all */
+				 <&cpg 226>, <&cpg 227>, <&cpg 228>,
+				 <&cpg 229>, <&cpg 230>, <&cpg 231>,
+				 <&cpg 232>, <&cpg 233>, <&cpg 234>,
+				 <&cpg 235>,
+				 <&cpg 236>,	/* scu */
+				 <&cpg 238>,	/* adg */
+				 <&cpg 237>;	/* audmapp */
+			reset-names = "ssi-all",
+				      "ssi-0", "ssi-1", "ssi-2",
+				      "ssi-3", "ssi-4", "ssi-5",
+				      "ssi-6", "ssi-7", "ssi-8", "ssi-9",
+				      "scu", "adg", "audmapp";
+			status = "disabled";
+
+			ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
+			dvc {
+				dvc0: dvc-0 {
+					dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
+					       <&dmac2 0x1db3>, <&dmac3 0x1db3>,
+					       <&dmac4 0x1db3>;
+					dma-names = "tx", "tx", "tx", "tx", "tx";
+				};
+				dvc1: dvc-1 {
+					dmas = <&dmac0 0x1db4>, <&dmac1 0x1db4>,
+					       <&dmac2 0x1db4>, <&dmac3 0x1db4>,
+					       <&dmac4 0x1db4>;
+					dma-names = "tx", "tx", "tx", "tx", "tx";
+				};
+			};
+
+			mix {
+				mix0: mix-0 { };
+				mix1: mix-1 { };
+			};
+
+			src {
+				src0: src-0 {
+					interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
+					       <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
+					       <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
+					       <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
+					       <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src1: src-1 {
+					interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da0>, <&dmac0 0x1daa>,
+					       <&dmac1 0x1da0>, <&dmac1 0x1daa>,
+					       <&dmac2 0x1da0>, <&dmac2 0x1daa>,
+					       <&dmac3 0x1da0>, <&dmac3 0x1daa>,
+					       <&dmac4 0x1da0>, <&dmac4 0x1daa>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src2: src-2 {
+					interrupts = <GIC_SPI 904 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da1>, <&dmac0 0x1dab>,
+					       <&dmac1 0x1da1>, <&dmac1 0x1dab>,
+					       <&dmac2 0x1da1>, <&dmac2 0x1dab>,
+					       <&dmac3 0x1da1>, <&dmac3 0x1dab>,
+					       <&dmac4 0x1da1>, <&dmac4 0x1dab>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src3: src-3 {
+					interrupts = <GIC_SPI 905 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da2>, <&dmac0 0x1dac>,
+					       <&dmac1 0x1da2>, <&dmac1 0x1dac>,
+					       <&dmac2 0x1da2>, <&dmac2 0x1dac>,
+					       <&dmac3 0x1da2>, <&dmac3 0x1dac>,
+					       <&dmac4 0x1da2>, <&dmac4 0x1dac>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src4: src-4 {
+					interrupts = <GIC_SPI 906 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da3>, <&dmac0 0x1dad>,
+					       <&dmac1 0x1da3>, <&dmac1 0x1dad>,
+					       <&dmac2 0x1da3>, <&dmac2 0x1dad>,
+					       <&dmac3 0x1da3>, <&dmac3 0x1dad>,
+					       <&dmac4 0x1da3>, <&dmac4 0x1dad>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src5: src-5 {
+					interrupts = <GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da4>, <&dmac0 0x1dae>,
+					       <&dmac1 0x1da4>, <&dmac1 0x1dae>,
+					       <&dmac2 0x1da4>, <&dmac2 0x1dae>,
+					       <&dmac3 0x1da4>, <&dmac3 0x1dae>,
+					       <&dmac4 0x1da4>, <&dmac4 0x1dae>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src6: src-6 {
+					interrupts = <GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da5>, <&dmac0 0x1daf>,
+					       <&dmac1 0x1da5>, <&dmac1 0x1daf>,
+					       <&dmac2 0x1da5>, <&dmac2 0x1daf>,
+					       <&dmac3 0x1da5>, <&dmac3 0x1daf>,
+					       <&dmac4 0x1da5>, <&dmac4 0x1daf>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src7: src-7 {
+					interrupts = <GIC_SPI 909 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da6>, <&dmac0 0x1db0>,
+					       <&dmac1 0x1da6>, <&dmac1 0x1db0>,
+					       <&dmac2 0x1da6>, <&dmac2 0x1db0>,
+					       <&dmac3 0x1da6>, <&dmac3 0x1db0>,
+					       <&dmac4 0x1da6>, <&dmac4 0x1db0>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src8: src-8 {
+					interrupts = <GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da7>, <&dmac0 0x1db1>,
+					       <&dmac1 0x1da7>, <&dmac1 0x1db1>,
+					       <&dmac2 0x1da7>, <&dmac2 0x1db1>,
+					       <&dmac3 0x1da7>, <&dmac3 0x1db1>,
+					       <&dmac4 0x1da7>, <&dmac4 0x1db1>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src9: src-9 {
+					interrupts = <GIC_SPI 911 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da8>, <&dmac0 0x1db2>,
+					       <&dmac1 0x1da8>, <&dmac1 0x1db2>,
+					       <&dmac2 0x1da8>, <&dmac2 0x1db2>,
+					       <&dmac3 0x1da8>, <&dmac3 0x1db2>,
+					       <&dmac4 0x1da8>, <&dmac4 0x1db2>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+			};
+
+			ssi {
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 889 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi1: ssi-1 {
+					interrupts = <GIC_SPI 890 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi2: ssi-2 {
+					interrupts = <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi5: ssi-5 {
+					interrupts = <GIC_SPI 894 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi6: ssi-6 {
+					interrupts = <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi7: ssi-7 {
+					interrupts = <GIC_SPI 896 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi8: ssi-8 {
+					interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi9: ssi-9 {
+					interrupts = <GIC_SPI 898 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+
+			ssiu {
+				ssiu00: ssiu-0 {
+					dmas = <&dmac0 0x1d61>, <&dmac0 0x1d62>,
+					       <&dmac1 0x1d61>, <&dmac1 0x1d62>,
+					       <&dmac2 0x1d61>, <&dmac2 0x1d62>,
+					       <&dmac3 0x1d61>, <&dmac3 0x1d62>,
+					       <&dmac4 0x1d61>, <&dmac4 0x1d62>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu01: ssiu-1 {
+					dmas = <&dmac0 0x1d63>, <&dmac0 0x1d64>,
+					       <&dmac1 0x1d63>, <&dmac1 0x1d64>,
+					       <&dmac2 0x1d63>, <&dmac2 0x1d64>,
+					       <&dmac3 0x1d63>, <&dmac3 0x1d64>,
+					       <&dmac4 0x1d63>, <&dmac4 0x1d64>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu02: ssiu-2 {
+					dmas = <&dmac0 0x1d65>, <&dmac0 0x1d66>,
+					       <&dmac1 0x1d65>, <&dmac1 0x1d66>,
+					       <&dmac2 0x1d65>, <&dmac2 0x1d66>,
+					       <&dmac3 0x1d65>, <&dmac3 0x1d66>,
+					       <&dmac4 0x1d65>, <&dmac4 0x1d66>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu03: ssiu-3 {
+					dmas = <&dmac0 0x1d67>, <&dmac0 0x1d68>,
+					       <&dmac1 0x1d67>, <&dmac1 0x1d68>,
+					       <&dmac2 0x1d67>, <&dmac2 0x1d68>,
+					       <&dmac3 0x1d67>, <&dmac3 0x1d68>,
+					       <&dmac4 0x1d67>, <&dmac4 0x1d68>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu10: ssiu-4 {
+					dmas = <&dmac0 0x1d69>, <&dmac0 0x1d6a>,
+					       <&dmac1 0x1d69>, <&dmac1 0x1d6a>,
+					       <&dmac2 0x1d69>, <&dmac2 0x1d6a>,
+					       <&dmac3 0x1d69>, <&dmac3 0x1d6a>,
+					       <&dmac4 0x1d69>, <&dmac4 0x1d6a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu11: ssiu-5 {
+					dmas = <&dmac0 0x1d6b>, <&dmac0 0x1d6c>,
+					       <&dmac1 0x1d6b>, <&dmac1 0x1d6c>,
+					       <&dmac2 0x1d6b>, <&dmac2 0x1d6c>,
+					       <&dmac3 0x1d6b>, <&dmac3 0x1d6c>,
+					       <&dmac4 0x1d6b>, <&dmac4 0x1d6c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu12: ssiu-6 {
+					dmas = <&dmac0 0x1d6d>, <&dmac0 0x1d6e>,
+					       <&dmac1 0x1d6d>, <&dmac1 0x1d6e>,
+					       <&dmac2 0x1d6d>, <&dmac2 0x1d6e>,
+					       <&dmac3 0x1d6d>, <&dmac3 0x1d6e>,
+					       <&dmac4 0x1d6d>, <&dmac4 0x1d6e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu13: ssiu-7 {
+					dmas = <&dmac0 0x1d6f>, <&dmac0 0x1d70>,
+					       <&dmac1 0x1d6f>, <&dmac1 0x1d70>,
+					       <&dmac2 0x1d6f>, <&dmac2 0x1d70>,
+					       <&dmac3 0x1d6f>, <&dmac3 0x1d70>,
+					       <&dmac4 0x1d6f>, <&dmac4 0x1d70>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu20: ssiu-8 {
+					dmas = <&dmac0 0x1d71>, <&dmac0 0x1d72>,
+					       <&dmac1 0x1d71>, <&dmac1 0x1d72>,
+					       <&dmac2 0x1d71>, <&dmac2 0x1d72>,
+					       <&dmac3 0x1d71>, <&dmac3 0x1d72>,
+					       <&dmac4 0x1d71>, <&dmac4 0x1d72>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu21: ssiu-9 {
+					dmas = <&dmac0 0x1d73>, <&dmac0 0x1d74>,
+					       <&dmac1 0x1d73>, <&dmac1 0x1d74>,
+					       <&dmac2 0x1d73>, <&dmac2 0x1d74>,
+					       <&dmac3 0x1d73>, <&dmac3 0x1d74>,
+					       <&dmac4 0x1d73>, <&dmac4 0x1d74>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu22: ssiu-10 {
+					dmas = <&dmac0 0x1d75>, <&dmac0 0x1d76>,
+					       <&dmac1 0x1d75>, <&dmac1 0x1d76>,
+					       <&dmac2 0x1d75>, <&dmac2 0x1d76>,
+					       <&dmac3 0x1d75>, <&dmac3 0x1d76>,
+					       <&dmac4 0x1d75>, <&dmac4 0x1d76>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu23: ssiu-11 {
+					dmas = <&dmac0 0x1d77>, <&dmac0 0x1d78>,
+					       <&dmac1 0x1d77>, <&dmac1 0x1d78>,
+					       <&dmac2 0x1d77>, <&dmac2 0x1d78>,
+					       <&dmac3 0x1d77>, <&dmac3 0x1d78>,
+					       <&dmac4 0x1d77>, <&dmac4 0x1d78>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu30: ssiu-12 {
+					dmas = <&dmac0 0x1d79>, <&dmac0 0x1d7a>,
+					       <&dmac1 0x1d79>, <&dmac1 0x1d7a>,
+					       <&dmac2 0x1d79>, <&dmac2 0x1d7a>,
+					       <&dmac3 0x1d79>, <&dmac3 0x1d7a>,
+					       <&dmac4 0x1d79>, <&dmac4 0x1d7a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu31: ssiu-13 {
+					dmas = <&dmac0 0x1d7b>, <&dmac0 0x1d7c>,
+					       <&dmac1 0x1d7b>, <&dmac1 0x1d7c>,
+					       <&dmac2 0x1d7b>, <&dmac2 0x1d7c>,
+					       <&dmac3 0x1d7b>, <&dmac3 0x1d7c>,
+					       <&dmac4 0x1d7b>, <&dmac4 0x1d7c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu32: ssiu-14 {
+					dmas = <&dmac0 0x1d7d>, <&dmac0 0x1d7e>,
+					       <&dmac1 0x1d7d>, <&dmac1 0x1d7e>,
+					       <&dmac2 0x1d7d>, <&dmac2 0x1d7e>,
+					       <&dmac3 0x1d7d>, <&dmac3 0x1d7e>,
+					       <&dmac4 0x1d7d>, <&dmac4 0x1d7e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu33: ssiu-15 {
+					dmas = <&dmac0 0x1d7f>, <&dmac0 0x1d80>,
+					       <&dmac1 0x1d7f>, <&dmac1 0x1d80>,
+					       <&dmac2 0x1d7f>, <&dmac2 0x1d80>,
+					       <&dmac3 0x1d7f>, <&dmac3 0x1d80>,
+					       <&dmac4 0x1d7f>, <&dmac4 0x1d80>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu40: ssiu-16 {
+					dmas = <&dmac0 0x1d81>, <&dmac0 0x1d82>,
+					       <&dmac1 0x1d81>, <&dmac1 0x1d82>,
+					       <&dmac2 0x1d81>, <&dmac2 0x1d82>,
+					       <&dmac3 0x1d81>, <&dmac3 0x1d82>,
+					       <&dmac4 0x1d81>, <&dmac4 0x1d82>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu41: ssiu-17 {
+					dmas = <&dmac0 0x1d83>, <&dmac0 0x1d84>,
+					       <&dmac1 0x1d83>, <&dmac1 0x1d84>,
+					       <&dmac2 0x1d83>, <&dmac2 0x1d84>,
+					       <&dmac3 0x1d83>, <&dmac3 0x1d84>,
+					       <&dmac4 0x1d83>, <&dmac4 0x1d84>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu42: ssiu-18 {
+					dmas = <&dmac0 0x1d85>, <&dmac0 0x1d86>,
+					       <&dmac1 0x1d85>, <&dmac1 0x1d86>,
+					       <&dmac2 0x1d85>, <&dmac2 0x1d86>,
+					       <&dmac3 0x1d85>, <&dmac3 0x1d86>,
+					       <&dmac4 0x1d85>, <&dmac4 0x1d86>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu43: ssiu-19 {
+					dmas = <&dmac0 0x1d87>, <&dmac0 0x1d88>,
+					       <&dmac1 0x1d87>, <&dmac1 0x1d88>,
+					       <&dmac2 0x1d87>, <&dmac2 0x1d88>,
+					       <&dmac3 0x1d87>, <&dmac3 0x1d88>,
+					       <&dmac4 0x1d87>, <&dmac4 0x1d88>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu50: ssiu-20 {
+					dmas = <&dmac0 0x1d89>, <&dmac0 0x1d8a>,
+					       <&dmac1 0x1d89>, <&dmac1 0x1d8a>,
+					       <&dmac2 0x1d89>, <&dmac2 0x1d8a>,
+					       <&dmac3 0x1d89>, <&dmac3 0x1d8a>,
+					       <&dmac4 0x1d89>, <&dmac4 0x1d8a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu60: ssiu-21 {
+					dmas = <&dmac0 0x1d8b>, <&dmac0 0x1d8c>,
+					       <&dmac1 0x1d8b>, <&dmac1 0x1d8c>,
+					       <&dmac2 0x1d8b>, <&dmac2 0x1d8c>,
+					       <&dmac3 0x1d8b>, <&dmac3 0x1d8c>,
+					       <&dmac4 0x1d8b>, <&dmac4 0x1d8c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu70: ssiu-22 {
+					dmas = <&dmac0 0x1d8d>, <&dmac0 0x1d8e>,
+					       <&dmac1 0x1d8d>, <&dmac1 0x1d8e>,
+					       <&dmac2 0x1d8d>, <&dmac2 0x1d8e>,
+					       <&dmac3 0x1d8d>, <&dmac3 0x1d8e>,
+					       <&dmac4 0x1d8d>, <&dmac4 0x1d8e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu80: ssiu-23 {
+					dmas = <&dmac0 0x1d8f>, <&dmac0 0x1d90>,
+					       <&dmac1 0x1d8f>, <&dmac1 0x1d90>,
+					       <&dmac2 0x1d8f>, <&dmac2 0x1d90>,
+					       <&dmac3 0x1d8f>, <&dmac3 0x1d90>,
+					       <&dmac4 0x1d8f>, <&dmac4 0x1d90>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu90: ssiu-24 {
+					dmas = <&dmac0 0x1d91>, <&dmac0 0x1d92>,
+					       <&dmac1 0x1d91>, <&dmac1 0x1d92>,
+					       <&dmac2 0x1d91>, <&dmac2 0x1d92>,
+					       <&dmac3 0x1d91>, <&dmac3 0x1d92>,
+					       <&dmac4 0x1d91>, <&dmac4 0x1d92>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu91: ssiu-25 {
+					dmas = <&dmac0 0x1d93>, <&dmac0 0x1d94>,
+					       <&dmac1 0x1d93>, <&dmac1 0x1d94>,
+					       <&dmac2 0x1d93>, <&dmac2 0x1d94>,
+					       <&dmac3 0x1d93>, <&dmac3 0x1d94>,
+					       <&dmac4 0x1d93>, <&dmac4 0x1d94>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu92: ssiu-26 {
+					dmas = <&dmac0 0x1d95>, <&dmac0 0x1d96>,
+					       <&dmac1 0x1d95>, <&dmac1 0x1d96>,
+					       <&dmac2 0x1d95>, <&dmac2 0x1d96>,
+					       <&dmac3 0x1d95>, <&dmac3 0x1d96>,
+					       <&dmac4 0x1d95>, <&dmac4 0x1d96>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu93: ssiu-27 {
+					dmas = <&dmac0 0x1d97>, <&dmac0 0x1d98>,
+					       <&dmac1 0x1d97>, <&dmac1 0x1d98>,
+					       <&dmac2 0x1d97>, <&dmac2 0x1d98>,
+					       <&dmac3 0x1d97>, <&dmac3 0x1d98>,
+					       <&dmac4 0x1d97>, <&dmac4 0x1d98>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+			};
+		};
+
 		wdt1: watchdog@14400000 {
 			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
 			reg = <0 0x14400000 0 0x400>;
-- 
2.25.1



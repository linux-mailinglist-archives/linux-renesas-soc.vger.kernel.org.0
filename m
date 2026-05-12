Return-Path: <linux-renesas-soc+bounces-32512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FFmC2ZyA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:33:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC132527BE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55136312874D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C7538AC7E;
	Tue, 12 May 2026 18:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KCQW6GKk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CE0385D65;
	Tue, 12 May 2026 18:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610529; cv=fail; b=XlaY6B9k7c+cEDvFCijX74TObf+ob6dEOr2H09myAAiM7przbi6aXbwkI1xIOyst4JHvO51FfpvsF8sH0foTCm6Jj8feenh6r1IFupk4gPCBZYckzmn/96aAaZyJzpfiLZ10WDsBdVZN3MNRvoModxJjgqH/aEB5Nl96l5zOXjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610529; c=relaxed/simple;
	bh=hWtk4ZdCtgZEluthWK7MB/VWHDaCRwfLVogswD6wl40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z7IYMjt9rB1THzFzHb3zoVOMOHOTrhf/qJxe36vUS97MfWVRHZrC5wBYk7TEEhfHI5CDYKfLzsNuthb7GYZnOjkYCfExUt7MuZ6NjbmF5K644Vw7Z+miy65Hwc5JEmjHM5oilqmJ0sOhDMP9bL9AX+qpTVaCRqksln8f+nBy9T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KCQW6GKk; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0sf/mJD+ceggEqe9oBAd8dK+4b7OZHXLjMWuh7UDi+kF2gaaP7z1Yeu4Y8cLQsYz9eWOSQpobBT2iAZkhOy/TSNWoGYk6HHlnbwMmv6MPjK/HhrVCnGgQPBnFlV9vWtbZcjsdgGgy1H0WmOMpRyFn29vwRvJbglWQmpFzbjz3YlsOb+Ky5hGPrEMt4cD2Hml06U89ju1jA0begHoG0jcgY0Yo5pLRJIaA+5HSHBPoh/tfAno+ZAiYnE2XqoYdsVQ7NxLePJCTxsnXLbPj/AK2dPx1niZ+wI9lKcZbU4c1tLjg3wPK9jzMvXtgaw4mP7Dfz82XGU6lQwuDUMzXZQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shU7S+9W1PzYYi1Lwpyf+8KX/4mZuUP9/a2Npv5PVUM=;
 b=Nb7iY4P0XiJkk1DJ4sw+FRANAmB+1g5JSp4f1fJEjvhuomuijXDAEfWOte8uw6CGVqYLt5U4qgfUSRleZYjXadydMjVjy6hAp5anadF1XW2g76cQIRuFqzxE1YNA4ap/6LIanqJujnf26Qq1sW31I2kQKYcBkwMIqPP3cHE2BD6fhLPqQd75tef9oaJZvtOZvzL2FWmAUr45lEp2xTz8UhlePUq9zmeDgbZeaL+1MV8hvljUImkBAJkZymk1PWfCTdsp4OGGHsWIUH36hv9DKf2mWZWlmUP8KTZS+Jmzztzo+x4T7PFpj0KMnBK9Qxy73Y/aAV1Un7IX7IWttBe2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shU7S+9W1PzYYi1Lwpyf+8KX/4mZuUP9/a2Npv5PVUM=;
 b=KCQW6GKkoGqmN+7mzOyng6JsLLfRXTSJEhUqP1o6hx/GiFiuefOA/iFGe8ylwNePELi17qCG1Ddl/4jff/Y1WOJQfMrAK/GErPTlZGMYudmkvfMtjau3ed1y2IvbVpRoiT4WCbbdxSbZ4KsDt/HyLx4INwaIquHLjkDmWFlrJV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:28:42 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:42 +0000
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
Subject: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Date: Tue, 12 May 2026 18:26:24 +0000
Message-Id: <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: befb5e4b-170d-4317-dd43-08deb0544b15
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	k/wZd7o/Ipi1sRqLRMqsmkCr0paO7pCtcB+gbtOIZH5yzkFODNmIsm39rJ3B/hhz/UjMKyTCgzaec+gM3Nn9mNR4w5zvxzvYXuNAez1kO86mS6yHmD8jBoI4DLWoGsMbAhSs9SnQpS0FHtZRyZO8v7owZ5nufReimAa4ftxBFy1voy+AxQcpiAGfEA8sqMMu0HBWxqXZrOW9dIPhURCeg4Qv0b57hQS9bShPxv29xyJEJyPPYfQ8CLXQ/xwvopp9tHKpNQsjNffQzBy1nraQJqvHljZByuntwhrCN1W+E7rB4yWNU9Wvba+DmnMRDTNPR0yocgBzTuWK2s8hrvv2xnbbuax3TDmhplNS7Ypm1o8vxEeJZHtWBsMZPjXm72/oL+LbDCzPCrMsf/QV8NfrtuHA0bUOfrKS3DnzXENvvO957RHtqIf5+HMP5kUoPu00dlCpWh8GTTYTQzccN6zL1Q/9M15eYlXXOal6rerxcwuiiCuZvvqjdT8i6zxPx7dFuzLMu05j/VC7KgD2es65sf8cUqGHRBz1PAyThA34RK5P+PP2ay7Mvfz/r/L2ojTwWYAaIUtSKZV1aihOw1wNZCtXRKNpXq3SQducNFgJs6JN5k1La5ljO5cIKMtaEFjdLb7ApSr5+1T8L5orwlaNYRm01ioI6Dga3l0kUGqIsI+t3t9IuoHWwDHx9PzNTZaUC/nsKNorIB/lHEcMo8x87V9u1nGJ154TNkymw+FB1XvySS2TaOjOWxcIz31Y/vc6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAEPvhw1PCvgC7VBUKGCzyy/KDOkaAdAkIlg1JTmxQHbrPhc9H8eaHjdrsee?=
 =?us-ascii?Q?GjDBvTptojMlxhQ6/SjiCxuO1/+h8t2VuZWJcueZGqAl9oZ9c7MW5hB24zhy?=
 =?us-ascii?Q?4OK6hfKFSBWkChfhvs1mTH0FZYXCiOJFaBPMfaoGV0M3wl4g85eQloymNIQF?=
 =?us-ascii?Q?9rl7zDLU7AUJ23lmOy5otybtdykyrri7HSe6zBY48NkVMGIBVStegMPjQkum?=
 =?us-ascii?Q?kZsYghcat9/B4yPhG65k1bQ+92SE6n+bkqXUyAsLLVWOB9am8P2uxUrtzM/S?=
 =?us-ascii?Q?0b08oFQyit7374vXStbkAQEr3uIj8L2bCXtxSo+iNr2mh/Y3USO7v+kNovaw?=
 =?us-ascii?Q?XUNU789FvoV5gKr7M1lUFxYB8LRhcl7bHvWEBxppIt65Pg3T1SEIptqodtYv?=
 =?us-ascii?Q?f8StEG7ocs/DErrM5xkJ3zBCVsnPgkRgp5AwHkuQ+gU42XYRlqXwdLzdvc1U?=
 =?us-ascii?Q?7F9eSxHuy5v+RGcOsOS6g3nm9bu3E5WMbETMMvEAB8hkkTmCw7M5GYs82yhc?=
 =?us-ascii?Q?w1wn3Lr1/n06nK4zzztg6I2rWcaT/ACb1f4mie8Qco/Vs/Ql8BRItUNwyYcl?=
 =?us-ascii?Q?s9Ojl1nK2u63GZzJqN5yn3tP0SCe0mATJ0BtT1U8xKRLQLr3BB76J7TFcIab?=
 =?us-ascii?Q?ck1fARQEGWRlMG0X1focdsV9CxKmuiFMLyoNpRlf98y8R5vI5HazzE7pqrIX?=
 =?us-ascii?Q?RpdjmkDvcMUisBuubk6XQGTImijLM2fdG0DC1jGOYpYJe6SEj3IDEUfwTZ+Y?=
 =?us-ascii?Q?kuGR0ySonQGpHds4aSRWtXxiw6Ok7H1Kyu2fQK0fLJyKWFFTeHFPN66sXVE/?=
 =?us-ascii?Q?fqhF5sKxwYsrGbFlBXnmrCPC0KzJ+tjS2Rrhn37PLLMZrZ7gUuVbOrGd32Rs?=
 =?us-ascii?Q?fF+kk9yNV0xQTXHnt+hwnXJOcZR8YLKycV7VtPa9QwW88ybK/4g8GTfDbRmm?=
 =?us-ascii?Q?6lpzQl4ngrNbex3u9cb274kDBiRjcJ83CkJq06cyAfs7EuTQtKZBdpdJJZD7?=
 =?us-ascii?Q?uUzmgvOGsFb2fZA1Tp3r0NVOK0xMwaURRyKOYKDb7dgxMm1jhtHbJeH6sNKp?=
 =?us-ascii?Q?Tgc4uYnSm/MDu2nq1BNW0Egbk0GhUMBdT69znHal++Mo9IiYGPea4kFjaGtL?=
 =?us-ascii?Q?lidFMtvYPDjZMROqpxrspnzjFiT8tcLj0zyY0SCx12GDBxIhe5LU1vMzSavs?=
 =?us-ascii?Q?4ZaEO+LWRkNowegDXFxOAbCmb0DaDy8JDfxf2U4TOwMwXF4fZ4gOBY1aTtpZ?=
 =?us-ascii?Q?s5e8Ts2wVkLSXevjOQ553g9JWlJG8bX/eViiIFBXuU7BFELRasJ0oWoRLS1D?=
 =?us-ascii?Q?NiTg2CcKn4rm6UWkEGzkfEWGHkNwAngaSe+WcrhIt5x/WFiYtzApczzbD5Fc?=
 =?us-ascii?Q?z03lc5prd9FQil/eypqI3nn9cFtDIzLSOWusRbvCvu23UBgZrTD057iY3QPz?=
 =?us-ascii?Q?N2Y+gqHI9QvtszUpzfGxteXADwRC7stOZJ8VzGxpZ5XynqlHc6mBWrLMRxrA?=
 =?us-ascii?Q?nIkwoaei13coxjW6dFXO/ZdaMHtfze1HF5oD172yydQ/w/ZXvMluxZAkfR+3?=
 =?us-ascii?Q?HVT+z0Fo2QxO2pZ4gGW3tALfVoNbBKQmjfg2znzlh9CnkTsZsTkwfjEbvbwx?=
 =?us-ascii?Q?+7BiX11y518MMKN4Qh0kT9yIAHj+rFBD4g7OSoCUf1erjij5Xx/rj1eKNEtG?=
 =?us-ascii?Q?TO0p9NEEbZfuZE7YwPXrV9c75p3k2wsvc3J3+MP60AXKs5zFsJqVfE/nJ1X6?=
 =?us-ascii?Q?6ZRNyJq9GEM/xapc7rQrwkmHVXgbSWE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: befb5e4b-170d-4317-dd43-08deb0544b15
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:41.9693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcruB0WQxQT75soVLq+PKpL/+AlkLUMRQAenUhiLg7yQsnS/c3CJwOpn6KVim23rf9cW2JRdDsUbjzvG33Zkla0j2xbhJdA8tdsj9UnxqjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: AC132527BE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32512-lists,linux-renesas-soc=lfdr.de];
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

Add support for the SSIU found on the Renesas RZ/G3E SoC, which
provides a different BUSIF layout compared to earlier generations:

 - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
 - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
 - SSI9: 4 BUSIF instances (BUSIF0-3)
 - Total: 28 BUSIFs

RZ/G3E also differs from Gen2/Gen3 implementations in that only two
pairs of BUSIF error-status registers are available instead of four,
and the SSI always operates in BUSIF mode with no PIO fallback.

Rather than scattering SoC-specific checks across functional code,
introduce an extra capability flags in the match data:

 - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
   register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
   and rsnd_ssiu_busif_err_status_clear() to limit register iteration.

Future SoCs sharing these constraints can set the flags without
requiring code changes.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes

v5: No changes

v4:
 - Move busif_status_count from rsnd_priv into new
   struct rsnd_ssiu_ctrl, following the rsnd_dma_ctrl pattern for
   shared non-per-instance module resources.
 - Properly propagate reset control errors via dev_err_probe()
   instead of silencing them.
 - Update changelog to accurately describe rsnd_is_rzg3e() usage
   for SoC-specific register handling.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/core.c |  3 +-
 sound/soc/renesas/rcar/rsnd.h |  2 ++
 sound/soc/renesas/rcar/ssiu.c | 63 +++++++++++++++++++++++++----------
 3 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index fa6a12571198..9022f03c45d6 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -107,7 +107,8 @@ static const struct of_device_id rsnd_of_match[] = {
 	{ .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
 	/* Special Handling */
 	{ .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
-	{ .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
+	{ .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E |
+								RSND_SSIU_BUSIF_STATUS_COUNT_2) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rsnd_of_match);
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index e917aa12fa80..186468a584fe 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -666,6 +666,7 @@ struct rsnd_priv {
 #define RSND_RZ3	(3 << 8)
 #define RSND_RZ_ID_MASK	(0xF << 12) /* nibble D */
 #define RSND_RZG3E	(1 << 12)
+#define RSND_SSIU_BUSIF_STATUS_COUNT_2	BIT(16) /* Only 2 BUSIF error-status register pairs */
 	/*
 	 * below value will be filled on rsnd_gen_probe()
 	 */
@@ -684,6 +685,7 @@ struct rsnd_priv {
 	/*
 	 * below value will be filled on rsnd_ssi_probe()
 	 */
+	void *ssiu_ctrl;
 	void *ssi;
 	int ssi_nr;
 
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 0cfa84fe5ea8..f483389868d2 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -29,31 +29,39 @@ struct rsnd_ssiu {
 	     i++)
 
 /*
- *	SSI	Gen2		Gen3		Gen4
- *	0	BUSIF0-3	BUSIF0-7	BUSIF0-7
- *	1	BUSIF0-3	BUSIF0-7
- *	2	BUSIF0-3	BUSIF0-7
- *	3	BUSIF0		BUSIF0-7
- *	4	BUSIF0		BUSIF0-7
- *	5	BUSIF0		BUSIF0
- *	6	BUSIF0		BUSIF0
- *	7	BUSIF0		BUSIF0
- *	8	BUSIF0		BUSIF0
- *	9	BUSIF0-3	BUSIF0-7
- *	total	22		52		8
+ *	SSI	Gen2		Gen3		Gen4		RZ/G3E
+ *	0	BUSIF0-3	BUSIF0-7	BUSIF0-7	BUSIF0-3
+ *	1	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	2	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	3	BUSIF0		BUSIF0-7			BUSIF0-3
+ *	4	BUSIF0		BUSIF0-7			BUSIF0-3
+ *	5	BUSIF0		BUSIF0				BUSIF0
+ *	6	BUSIF0		BUSIF0				BUSIF0
+ *	7	BUSIF0		BUSIF0				BUSIF0
+ *	8	BUSIF0		BUSIF0				BUSIF0
+ *	9	BUSIF0-3	BUSIF0-7			BUSIF0-3
+ *	total	22		52		8		28
  */
 static const int gen2_id[] = { 0, 4,  8, 12, 13, 14, 15, 16, 17, 18 };
 static const int gen3_id[] = { 0, 8, 16, 24, 32, 40, 41, 42, 43, 44 };
 static const int gen4_id[] = { 0 };
+static const int rzg3e_id[] = { 0, 4, 8, 12, 16, 20, 21, 22, 23, 24 };
+
+struct rsnd_ssiu_ctrl {
+	unsigned int busif_status_count;
+};
+
+#define rsnd_priv_to_ssiu_ctrl(priv) \
+	((struct rsnd_ssiu_ctrl *)(priv)->ssiu_ctrl)
 
 /* enable busif buffer over/under run interrupt. */
 #define rsnd_ssiu_busif_err_irq_enable(mod)  rsnd_ssiu_busif_err_irq_ctrl(mod, 1)
 #define rsnd_ssiu_busif_err_irq_disable(mod) rsnd_ssiu_busif_err_irq_ctrl(mod, 0)
 static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
 	int id = rsnd_mod_id(mod);
 	int shift, offset;
-	int i;
 
 	switch (id) {
 	case 0:
@@ -72,7 +80,7 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 		return;
 	}
 
-	for (i = 0; i < 4; i++) {
+	for (unsigned int i = 0; i < rsnd_priv_to_ssiu_ctrl(priv)->busif_status_count; i++) {
 		enum rsnd_reg reg = SSI_SYS_INT_ENABLE((i * 2) + offset);
 		u32 val = 0xf << (shift * 4);
 		u32 sys_int_enable = rsnd_mod_read(mod, reg);
@@ -87,10 +95,10 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct rsnd_mod *mod, int enable)
 
 bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
 	bool error = false;
 	int id = rsnd_mod_id(mod);
 	int shift, offset;
-	int i;
 
 	switch (id) {
 	case 0:
@@ -109,7 +117,7 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 		goto out;
 	}
 
-	for (i = 0; i < 4; i++) {
+	for (unsigned int i = 0; i < rsnd_priv_to_ssiu_ctrl(priv)->busif_status_count; i++) {
 		u32 reg = SSI_SYS_STATUS(i * 2) + offset;
 		u32 status = rsnd_mod_read(mod, reg);
 		u32 val = 0xf << (shift * 4);
@@ -160,7 +168,8 @@ static int rsnd_ssiu_init(struct rsnd_mod *mod,
 	/*
 	 * SSI_MODE0
 	 */
-	rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
+	if (!rsnd_is_rzg3e(priv))
+		rsnd_mod_bset(mod, SSI_MODE0, (1 << id), !use_busif << id);
 
 	/*
 	 * SSI_MODE1 / SSI_MODE2
@@ -510,6 +519,8 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *node __free(device_node) = rsnd_ssiu_of_node(priv);
+	struct reset_control *rstc;
+	struct rsnd_ssiu_ctrl *ctrl;
 	struct rsnd_ssiu *ssiu;
 	struct rsnd_mod_ops *ops;
 	const int *list = NULL;
@@ -534,8 +545,15 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 	if (!ssiu)
 		return -ENOMEM;
 
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->busif_status_count = rsnd_flags_has(priv, RSND_SSIU_BUSIF_STATUS_COUNT_2) ? 2 : 4;
+
 	priv->ssiu	= ssiu;
 	priv->ssiu_nr	= nr;
+	priv->ssiu_ctrl	= ctrl;
 
 	if (rsnd_is_gen1(priv))
 		ops = &rsnd_ssiu_ops_gen1;
@@ -558,12 +576,21 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		} else if (rsnd_is_gen4(priv)) {
 			list	= gen4_id;
 			nr	= ARRAY_SIZE(gen4_id);
+		} else if (rsnd_is_rzg3e(priv)) {
+			list	= rzg3e_id;
+			nr	= ARRAY_SIZE(rzg3e_id);
 		} else {
 			dev_err(dev, "unknown SSIU\n");
 			return -ENODEV;
 		}
 	}
 
+	/* Acquire shared reset once for all SSIU modules */
+	rstc = devm_reset_control_get_optional_shared(dev, "ssi-all");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc),
+				     "failed to get ssi-all reset\n");
+
 	for_each_rsnd_ssiu(ssiu, priv, i) {
 		int ret;
 
@@ -586,7 +613,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssiu),
-				    ops, NULL, NULL, RSND_MOD_SSIU, i);
+				    ops, NULL, rstc, RSND_MOD_SSIU, i);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1



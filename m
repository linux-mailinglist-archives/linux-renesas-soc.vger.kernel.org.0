Return-Path: <linux-renesas-soc+bounces-33094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEFiMqouFGqUKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:12:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CEA5C9C3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 204C5305F0EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC1A37DE99;
	Mon, 25 May 2026 11:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d+yWKbog"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C74637CD4B;
	Mon, 25 May 2026 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707270; cv=fail; b=mqXXV7axcfzEAtrH6AvTEYfOpFJPNq+0ahjhIx81I7FV8rrD3Nt0DiqODj8wD+oHiymH6gtzHfDDmkS/UxOaYMBgb5gQOilOyx8e9J5cmXakltlC8XD1jQidiGbmcXHHokVvjNcggPzPPIZcHCjN2oSh/3MjSDozjILJ5l92kmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707270; c=relaxed/simple;
	bh=UriHctqUV2NyfFTYLuk8J1GuPRQeKJ+1zi19c1lPcxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Aj+dzi/Im2BJ1Chr0YRCVuQbK6wTRxhVLt2owgnQNN+WTh1Y/DlJnaCQk9Zv1q/8Rg1LywxL7H5liuphTyeNyCuCx9nk1L4JnMMdwJLjdcKOYprfiUnaCViraL48GUSkHk8UX2EeGeNNnVT+o3KVW9HXtcSLX0MiSENyVwyJbCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=d+yWKbog; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lzq9mGV171nHx9tZOYSZptAc6gN43AmrYjyX3yw6SSSNmfGikjVe9bW4OXJddll1FtKiMl/A1IcdPGX7nWU2epil6XTq2IF8pwl3UauKBa9tANL0lSshYEPtYwtgIu4a/5RMqfAjS/IQjZRDrYHtIgrfRLkFcgWJTSm5tC0KLapT4RwiHh9017PQzskyb5fFuV4bgfU0xZ25BhfpUU7sXqI7qeVThkr8cX9xNa+jhvkVhP5akdsZYeH5Hb3ShTXULB/aSjV9WrFncrV3QttqmNwgmnoOCqOdvce8tiKQBeOKkN0l3kK0AWUVxgYUTxS8kw47l5519bAG1XzCDmnynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2oIAzBM8lvykeohWTgsa+zeejkXpubpOeiRrtBWxuM=;
 b=icEgmkOwmIJjqqKBp2V0SiFZhF3Y3vtkAML3DWRKImkicqcSjA8htVZY1GveooJ0pS4CTOAG2nahRIBBfBhjDup0MgyBAVd+Ev4Ykii0AiQvtRVW4yXth6hXUaID9bJ/4vpzEj4MwqHGapNG3ZuAnP5YPorSP4L17iDKIx+8ddfRt0DcJFo2se1atbxvNiBe0/qc1/fILc4qCVqGAgE+FJkLOzh4Zy7q/buMnM5tBXDCB+OfmNn0tj7jt2B3gVbnAeqM4jBNjagIdqVo7BQGvkah63571iu2e3Q11YcmvDiAaQM2kpD4StypHe5dVY2WOKCIhv10X79h6mEC0y+jLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2oIAzBM8lvykeohWTgsa+zeejkXpubpOeiRrtBWxuM=;
 b=d+yWKbogou8lpojPDOai6CaQzJuq0ReZCz5cDU0ND7TSFifNIZJ30FOziqn8y4UWuWf6NK9YsGTrbArcMgX2sQwqDRE9Fl8TRJdcLmjCAQrfaS8Gf3KD5oDLnUHMmLrtKAC47PBKhhjY9Q8313Eqh4qgzY56XdTn2DJbPAm6OW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB8484.jpnprd01.prod.outlook.com (2603:1096:604:189::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:43 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:07:43 +0000
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
Subject: [PATCH v4 8/8] arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec support
Date: Mon, 25 May 2026 11:06:03 +0000
Message-Id: <20260525110603.4018170-9-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1f4634fe-cba9-4388-040e-08deba4dd823
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|11063799006|3023799007|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Fmc7prCBtL0ESJaTEkFf3ctt/Dhice/Nlvviip3npZfrHaOyeZ3uFZT3dgx3hkTq11JM/qX3/RcpxIqnl9ZQe0Vmwt1FbBBWfAE+N+LWQZDofBlusQHMMFkLQo1NeuXMu0yZTY1FQgQF/+495CN6ocyAWvJgSgJIL47MWMq3J+Iif16wl5EJdpabWoxdxABVtQ58dr7YgjAFiIQG8kvJN6Q2r0nSdI0joTsQtlc1IK44pYrimUZ3H/KYF8NVwcoS4CqSvwn980OasUt4cy2LJ1YpUQRIO8sLItslgytFmAUoooAhvQl1M1b52ud/cru2xqHMiJSBMCk8p0nx/RZTzOgLLGDyNdBuiRyXxKX1qkvxy9376T608C7rEebcx0qG5zQrd2JQ9nRRg0TQ/OdEBQW/vcM3wtaXCbLZdk6ERVm3cVWjNEZDxN9rQvMv5qt7TxK5y0E+qNY9KA+jL6WleePIb+AIbw673cdz4rTxBvM5k2KCfDIoGQOjBRHXEU/1tgnk9I7p4rU0avNTOQfSsXbVCDJyY8EJACP1RBxKxm4Vv6RBcQtSoCN7RhzgOYPvGhJu64uVaxR1joN0ygSYKEzbuVXvqyv++SHDMcilqfcu9FJsBsILcTGTzNtJDoc3YoPg6hSQNY9UdG4bZNiJAQRKh5rr1rg5TDhIZAM+HvaOH/2xhSorvHWgJ1CC+6lT/epg2qqqtm8JGkSdF0n2GoAFLCSu5h7AwWTxWIweH2srCYpQEfaIsBMnOeM7cQic
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(11063799006)(3023799007)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fb2y70aZ3MlD4Tci8rgT02EBYgg9I2eo6dZfAY4E+1pZuWe4tjaWt4F8bt+R?=
 =?us-ascii?Q?sccgp40AF9FrQs18vqQT0s/EG1oHEtFJiyWJyAQAEwCUTxDUaBuyH2rFHfDn?=
 =?us-ascii?Q?ZkbF2963VKf26EEHf4C77KmvX/2qYdQQ6SDb/qxvhpb6GcXlUUTQxy+vlnFl?=
 =?us-ascii?Q?DwDdhqc+lx0rEEKXD+fy1dWk+BJD9zTTOEaCrx8PG2s2kDWf5duqoTz5+21g?=
 =?us-ascii?Q?h7D+WV9ReD0ZpA0F52xesvC8CYQalHYUtVVuvvLHJUY7F6tLyQZbg9z0ysz2?=
 =?us-ascii?Q?2r6W/ai0BdacHHtv1VPSOFjejQ4/Mb+JfBSM1uW9Cn2eC/x9kMAUQPexEqKd?=
 =?us-ascii?Q?axQ3A/a+vkm9C/pxbcQjEnTvxVjOzxQg4kBrlDK0gxMSt1TA5r9nwTxuZS/Q?=
 =?us-ascii?Q?Y0l0IDcPOXkIZlmGB5aapA5AITTQiAzuRlLjw2AMcnO78WrtphK6pFdHvPPB?=
 =?us-ascii?Q?MUxlbMQmz1tDxcVFpkJXCB+qQn5B37zMW392Sr7kuLjyLVS8nD0rH+iYtIvz?=
 =?us-ascii?Q?nLznaX2POCJcKatqaJ/zbNyFsAp2ff04plADJrxHdSdM7zbjdYRS8gsZALEg?=
 =?us-ascii?Q?SRQiekKmr+5vOZ4jhVq14vMI8FowVrYGVMTR87poUICQ6nWD1pdTNGknmf4K?=
 =?us-ascii?Q?0s6pINqxdXzqEHI+rRGGH1qMPJyBdUlfiKHoHdJUM+O5K9WssV8ZcGfL4WqV?=
 =?us-ascii?Q?Sd7IsWLd82Hgu/eMYDNUTVVtLMo9bzsvO8SrepxxtFGMgXga/y157ggtyuTy?=
 =?us-ascii?Q?/YcVStN97ag5nlBv8sojK6QrrQemaHv0HAYWF1Mw2zPMODQ/+ZTKb75Mjs55?=
 =?us-ascii?Q?FGDIWfoU5PfS47vdu2euPtbI5MSaCPDIcS2KaQ60GaGVIWPme/bDFOLUJCPa?=
 =?us-ascii?Q?3ByNvjFKQ6zkkLBQJNXF5qKnPfOPBHcd1jm2bsf3D9DejYnE0xD79yKCln1n?=
 =?us-ascii?Q?y2O+5R+6Nrc2zwsu46tE7252UnzMoJrLG/QelR5tD8ptABWn9UM8aabrROLi?=
 =?us-ascii?Q?sZzcecJl0LWZh6HN2+lQXwZIQdNgxm8n1DUw2SUgl+uDV5vN984StRKvy/ow?=
 =?us-ascii?Q?IuboTyRPpYGxYAsfoIM8qcaYVL1gqpWe38xSCTzdrPfGbGMVqjJ/C2thhYPc?=
 =?us-ascii?Q?6I6JBEbAyTxf8KeItsy5UXApx5pN8/dACDoVb1IdVGi/NXIp82acPAhL6hMo?=
 =?us-ascii?Q?HEpoWVJ38D8b+P1bHHB2fVnIf/eAB95rWGjYaWVZWsbGPipv7QlRz5MxCxO+?=
 =?us-ascii?Q?IrTqDYY/Vb21ckuRupCpt8s5t19TzfFVTJPJ6AGq/D5tS5Iy3HbQOzBTM+W3?=
 =?us-ascii?Q?9aDys8mIuwXT3vg/vdMPI2dNW9O75T9+UcGsdvD/toDiR2HXJU2DtEN9WAXd?=
 =?us-ascii?Q?lAlF5Sg14MMA+d4Q3WCqxUJJEz1ka3s51ZQhXw/BulW6wVIYOWWuDa7QmTLG?=
 =?us-ascii?Q?T0lb+cFOaurVAOB47LzaXv58VLxBcKOHem2xnly5iWAneWsNn4bUM7GNb0y2?=
 =?us-ascii?Q?nfzhBSFIh50BJ+ETbF01ZZdzV12g/oT6lSWEKCeZ9/j+D6mQzhU2OGd9NhNv?=
 =?us-ascii?Q?O9ALSWKRvfK0VKf1TZW19Vpupgbb1YXFZcAr0MmFCVzMiG9ceLj3R7D2WcMf?=
 =?us-ascii?Q?Y6kjr2XcgjcKzvmo7sY29qsOqgZV03xvmwYEUFjVd+mtkKXqcDkoRnAUCEha?=
 =?us-ascii?Q?49zFGpp8cUbAkjfF2QJWdGUzxpJlfgiAnf0XWS24oiBVIf4rpQmlFgRxnzFF?=
 =?us-ascii?Q?TRI8GnLiIDIymveEzNyFSJYJRV/FIeQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4634fe-cba9-4388-040e-08deba4dd823
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:07:43.7796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIhqv69Adi1//4HhxlrIMhLlYKBi6Do2e+eAhgVtXpkrrFABH/XyEo5eAB3d4KmG74L2iWNSzE1LfqIvqqRPz3KpkBfCRye2QnC5582aWTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8484
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33094-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1a:email,bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.0:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 40CEA5C9C3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
sound input/output using SSI3/SSI4 where:

 - The codec receives its master clock from the Versa3 clock
   generator present on the SoM
 - SSI4 shares clock pins with SSI3 to provide a separate data
   line for full-duplex audio capture.

Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v4: No changes
v3: No changes
v2: No changes

 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 6372f582a7c4..7defd342294a 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -32,6 +32,37 @@
 #include "rzg3e-smarc-som.dtsi"
 #include "renesas-smarc2.dtsi"
 
+/*
+ * SSI-DA7212
+ *
+ * These commands are required when Playback/Capture
+ *
+ *	amixer -q cset name='Aux Switch' on
+ *	amixer -q cset name='Mixin Left Aux Left Switch' on
+ *	amixer -q cset name='Mixin Right Aux Right Switch' on
+ *	amixer -q cset name='ADC Switch' on
+ *	amixer -q cset name='Mixout Right Mixin Right Switch' off
+ *	amixer -q cset name='Mixout Left Mixin Left Switch' off
+ *	amixer -q cset name='Headphone Volume' 70%
+ *	amixer -q cset name='Headphone Switch' on
+ *	amixer -q cset name='Mixout Left DAC Left Switch' on
+ *	amixer -q cset name='Mixout Right DAC Right Switch' on
+ *	amixer -q cset name='DAC Left Source MUX' 'DAI Input Left'
+ *	amixer -q cset name='DAC Right Source MUX' 'DAI Input Right'
+ *	amixer -q sset 'Mic 1 Amp Source MUX' 'MIC_P'
+ *	amixer -q sset 'Mic 2 Amp Source MUX' 'MIC_P'
+ *	amixer -q sset 'Mixin Left Mic 1' on
+ *	amixer -q sset 'Mixin Right Mic 2' on
+ *	amixer -q sset 'Mic 1' 90% on
+ *	amixer -q sset 'Mic 2' 90% on
+ *	amixer -q sset 'Lineout' 80% on
+ *	amixer -q set "Headphone" 100% on
+ *
+ * When Capture chained with DVC, use this command to amplify sound
+ *	amixer set 'DVC In',0 80%
+ * For playback, use: amixer set 'DVC Out',0 80%
+ */
+
 / {
 	model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
 	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
@@ -55,6 +86,22 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
 	};
+
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "snd-rzg3e";
+
+		dais = <&rsnd_port0>;	/* DA7212 */
+	};
+};
+
+&audio_clkb {
+	clock-frequency = <11289600>;
+};
+
+&audio_clkc {
+	clock-frequency = <12288000>;
 };
 
 &canfd {
@@ -99,6 +146,37 @@ &i2c0 {
 	pinctrl-names = "default";
 };
 
+&i2c1 {
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		#sound-dai-cells = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x1a>;
+
+		clocks = <&versa3 1>;
+		clock-names = "mclk";
+
+		dlg,micbias1-lvl = <2500>;
+		dlg,micbias2-lvl = <2500>;
+		dlg,dmic-data-sel = "lrise_rfall";
+		dlg,dmic-samplephase = "between_clkedge";
+		dlg,dmic-clkrate = <3000000>;
+
+		VDDA-supply = <&reg_1p8v>;
+		VDDSP-supply = <&reg_3p3v>;
+		VDDMIC-supply = <&reg_3p3v>;
+		VDDIO-supply = <&reg_1p8v>;
+
+		port {
+			da7212_endpoint: endpoint {
+				remote-endpoint = <&rsnd_endpoint0>;
+				mclk-fs = <256>;
+			};
+		};
+	};
+};
+
 &keys {
 	pinctrl-0 = <&nmi_pins>;
 	pinctrl-names = "default";
@@ -280,6 +358,42 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&snd_rzg3e {
+	pinctrl-0 = <&sound_clk_pins &sound_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* audio_clkout */
+	#clock-cells = <0>;
+	clock-frequency = <11289600>;
+
+	/* Multi DAI */
+	#sound-dai-cells = <1>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		rsnd_port0: port@0 {
+			reg = <0>;
+			rsnd_endpoint0: endpoint {
+				remote-endpoint = <&da7212_endpoint>;
+
+				dai-format = "i2s";
+				bitclock-master = <&rsnd_endpoint0>;
+				frame-master = <&rsnd_endpoint0>;
+
+				playback = <&ssi3>, <&src1>, <&dvc1>;
+				capture = <&ssi4>, <&src0>, <&dvc0>;
+			};
+		};
+	};
+};
+
+&ssi4 {
+	shared-pin;
+};
+
 &usb3_phy {
 	status = "okay";
 };
-- 
2.25.1



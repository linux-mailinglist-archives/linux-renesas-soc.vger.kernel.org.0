Return-Path: <linux-renesas-soc+bounces-33085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN21Oa0tFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33085-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A425C9AC1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E885304B7F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1501B37DE80;
	Mon, 25 May 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XJe66L2z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010059.outbound.protection.outlook.com [52.101.228.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B0A37D10D;
	Mon, 25 May 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707125; cv=fail; b=E0Ajq6QFqXfYfwsKoPDH7kx17oDll2Vb8rvr6I5MSebk+0isnKRfi4aitoIGpZHDrpZnHCeNgYi23sJ2rXyCZC1VH4YMKaNtzFD890Est+2IGXAMBdbhHXzWJB3fQ1QPC4SNpSW2vDpavG5sTbuVzw4vRMREwnlUlzXHCZd/g1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707125; c=relaxed/simple;
	bh=TbbMzE0df5UGDH1S6EzwU6S+U8h+mZfQVORCxerSaHo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FjYabsBsOrsCAWXts30REOp9rkul5aKPRYVDXaXemAnQ2j+dn267cKgT85FwYt95jz871TErleEhzk1ZYnxepC/81K8oIBSEPagwHcXqo5sduFfsfAzn/7WK57BpW/i4IcX6VzWAOQM2jobfdqfYwZp4K65Tl+BoKp7xbzoDnQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XJe66L2z; arc=fail smtp.client-ip=52.101.228.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFlbSESYBTSSyJfTKGRzEToXqXCJ7CIllx/igfPTWsIk6G3sZzlQ+8DFCHZfAP2Up8PXSacpVtH4y1JUlxLAJSkiH1/Wo5jscAx/DcKA+NiOFiO+u/p/Ggu592PXrx8UGL50gEACX3Ca9Sdo4gcd7Rtq3X7hw2BasqdkeGk+HJB9LBQu/nQw6hV9P0nSS+mL2zV8cWg1n0MWh47OWM4yzuUqBy7Gb3ei/j0T3Ic8T4Y6uZj+etoUf3PwIsS7Z1yKduJOpTrz0yRMDEQpZkYlQr253XtmoPDOU4cLtdVETt9MYRy1aRq6s7N4HFTVLrj4myeFB53RebzGA7DlKJLhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJIdqMa070+ks79q0OP+AIGS7IZ8x6Xb0FBg+wYViVQ=;
 b=DG7Koijyn4J/rxr0xeKV4xELr1OtImxjqUE5Hm6eUnkm9e8UnuDEl31YLyI2e8TAMIYNNfbHNodMjj4YHMvu4NfEd29H/ohfQPjmrFDHZJdfNrGkfLj9Ml+V848yCertqZ1zwtgZxnpa9ap4u6PaLEz4HQgdZXSmPoJoWsj5UoF4llJx8L9AniI74zTcSXLYTuMK06aPsVHZ7Xmh9AZ7HvSxmj22Pq4QPY8V2IxM+s42Cyzp0ZcDGK3MtYFKDzQfsa7CLHxOJDrSg/yMRkeif8Aib0Zs/MLqWBgPp8gzYOn+fL6n4aX6fu3+N2gmuPOK4mdWxlQMD+ifEXFk2lCulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJIdqMa070+ks79q0OP+AIGS7IZ8x6Xb0FBg+wYViVQ=;
 b=XJe66L2z3un8gxX8J0wurv/B2fjgojimelrmN4IRCtxLTPa0eC0Wz8um3oIHASnr5gtzDeJIZCzcnVDFdbQ50swp5f9neS405ddx01AHJRCOOrXzJGUrrMrSqyhjxg8pOHt2SeUZ0avyRNlU6Ve7RT8N18P8IqIsbHjm4NSFEUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:05:20 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:05:20 +0000
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
Subject: [PATCH v7 18/18] ASoC: rsnd: Add system suspend/resume support
Date: Mon, 25 May 2026 11:02:30 +0000
Message-Id: <20260525110230.4014435-19-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: cd1e98a6-2cba-4a0b-873d-08deba4d82b1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	309TwizGbiFDnbvpRJfb+nP5MHkR25w0ZPQCu5TCvuFPdvw4VyNk2YMzIIK7dW6ZIrNuUPtmXI2S77wNAzLGw9p0I89ANQhio9F1w9TLmBS0LrJhevr9PWnlwSDX7xHJoo9hSPetmaYMkxp8hfwhEs+0BTw5zY9rJMvytpjETPFC9vPDu9S1XU6Vh+Jcq8XY33hetY6MqSTvEV0ErJTAjGineiGAb/tSQ16edIUAz38S/J3yDMIVlFHI49xEN+48C6d2+6v2e3wVf9RialU9KnDL2do+hw9WZ47sxuJz5nzOnNPEPZdaV9I5UdBsxWuuQadrvx1HZ3tN8GQThndLwBHeCywU3z6krXnCnX/+kKNmkntxEHtfTmjdr9zywpElF9Qcc3FeL0+ucSSmENdytRXICaPlamBpmE4lGMr8EBO2JtUGd62CvedvlzslWd2Fq2J+usRJAmyfept30NMF3s6TH2Ds+d6RItSU3gzAL/Q7s3xpCm27H4fBfzd8muvLPRrWC61fw/RyPXC3oIh2OaoOpj5tUS6hu6eJv1kdsBbt8s1/ySGG4dmZthLegNPRh+lts12cZbs3lHBW3u8YZ/BoAxeH54A6TskrbKooQSjAiNO9v3YQq24rsnfkpIJBVvXPCO6V/O4BWpVRs/ikaaekVxruP9WEQCirOg535idlrXECtsq/U+juBfpVJW7iGBaFM9KjcyDMuajaMRT5Cp5W5p0TDIBmwAk9OMkZC5GcxAjjg7+H6ygPVZ1Tiw1L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s7+XOw+2+LNWrzLvpP1e6dj/q4aEutroB5VR8938ZAjtLiOsptIgPFXgD0w1?=
 =?us-ascii?Q?YFOCRTMNe3vlQPaI8wTp0j8RS+fH7eHv4WIOcAsWmVgyaUzO3iZhiH81hcc2?=
 =?us-ascii?Q?5wTAnYpeOtahW3tyN+vx3xOwNF5M2Q43o5wfABY2LhNOg669AsidoRRXDQmn?=
 =?us-ascii?Q?PoqwDFAkRi71XsRAxpf2lhTr0VDRfbYcEh4lsyiL7HlUEQ8MFpgygmymcK+w?=
 =?us-ascii?Q?831GFWeN3t0TdrT9x7IbsBJL+UiilmulZ00B5+qJrKzYZ9vfPcN9XL6c6AE/?=
 =?us-ascii?Q?ALy5skyxgwyDlbQwa01duQSE8TwR9wcA9rvfQOjFflK5npyg4e3xXaQKZsFK?=
 =?us-ascii?Q?+QNMnmlU/Gf3n2ji2lY9tFLsJOvfRgR4grkygkiIyoiEsMa0sNRbuS6tkI+U?=
 =?us-ascii?Q?VARoXXQVke6QesfnuEOblwuqrDK7j1g5l1X2TomNx0K2cwGOvsBh8P4zQPKS?=
 =?us-ascii?Q?LxRFNKCk0mbVUPjhcgJTW89NsLSE4R64ez0dxhNW8F4ga5TeBNzV1414wv33?=
 =?us-ascii?Q?UlbSNiVII29Dja5WeZN5VJH7xWPfq5+xlB+mYOgAzogJ8MymxBk0F0K3y7ZV?=
 =?us-ascii?Q?wSJOyj/Ze8as9eck0OGB+6YJvAkMtSGE/puB9V5nSWBXnNkwJTnugvNWVHuw?=
 =?us-ascii?Q?qq8mdWc7gFHszRf+EiXZXxyClh8Z5luanDespf0rHvSGTTC8Mf6CLi+PVsgO?=
 =?us-ascii?Q?vieLBc3fw7rVHQLDCtjFlQi/tFKwh520rzRjCAf3YkFxD4eLQb/67Lr07iPC?=
 =?us-ascii?Q?rnWB0XdMUgM7A7chUq7vGUoCdxYv8dJ8bFDfNhVbz+TrTK8lefJ60kj1NMaO?=
 =?us-ascii?Q?fgrCX2wM0Ay3JSYcB+74RCtYcMsqygJJj5by1XatX2RoIQ0Z/mv12Uh9ZqYb?=
 =?us-ascii?Q?ezJugE1PGvTKjRdaRE+cLZyHMbt6zvjBvnqjNZrKErHqyqtgRaEzxf5c1Jhq?=
 =?us-ascii?Q?bu9Vld2RwDI+XzgcGochOJKSqky5WtXxi1E25jj/zbuNW6A/wCN2G77t+KL4?=
 =?us-ascii?Q?OOp31WsctrpYuHJBXX7ql71VPckCjdxjhsJmeDgBtV/Duinb5TVA809zLCPP?=
 =?us-ascii?Q?B2S3DmecHzIL1R8dg1R9iDH9YKErMN9goVDQPqA+nunR+NkVzYc4LC1LoEus?=
 =?us-ascii?Q?eykm46lSX7nVSdinQvbzmJYH+jGOiFPPNmFzvcI+Fb6ArnRcNR9tfRK+M3/L?=
 =?us-ascii?Q?j2uKH7buK0G0ZwvEPKBsiutC8hSMUubcLLZ+goTnrgj3l4qBjYfyTsOVBP6g?=
 =?us-ascii?Q?eXl+MWeGG8tCj5ddGfP1ZbTVcmkuEqfa3HxwPyyB5pXpoywxxA9Tapcm8hYk?=
 =?us-ascii?Q?vLjbJ8SDQH6aKKI0u45qiEVxdg/Rh/9mimoDZZV47CtXaj9TxNOns+FVeN7d?=
 =?us-ascii?Q?VO2DMCBAKcEmyNAbenPcMBnmm0feTQosQN/i43tniqpHaXkBtkd/PnVxYZJt?=
 =?us-ascii?Q?E2TupHVFsUIkaPVExJeGLre3Sdlt5L12IPhWdHDC0hkBYMNTZPE9gUi/IHiu?=
 =?us-ascii?Q?CRCWcZsfaT+GLLDMLNXxgWPDef0OReFdIQPRKMAmDIYJIdRif+Ite1WHZjer?=
 =?us-ascii?Q?taAH6iqutxpDtp97sTVjrj6Au+RfKAlBG8rw1JceOUoUvCl5Nx9mlMlB5uaX?=
 =?us-ascii?Q?vEJES67RretS44PbtU9dSSbeNZSzg173occHSLo/QBNEKax6vujvt47b/OIa?=
 =?us-ascii?Q?E0VwwtoQveQL05p4e7oTC8aXzeOC67u9yqGeA6Cqrs98e0LWneziO+6meE96?=
 =?us-ascii?Q?kzlVTSgeZ5rC8zCCShM8g+YXKuQZqXs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1e98a6-2cba-4a0b-873d-08deba4d82b1
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:05:20.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcfsMA54kQ22/kuCiK9pmJzA8YrxUkI82nmtcrG7hFosiVLX8MxmoxaseghfBiQPXixRH3sLIqMmQhi+rK875HV1abaMTD6rQyTgKPzZjo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33085-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 93A425C9AC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add system suspend/resume support for the ASoC rsnd driver, required
for RZ/G3E platforms. Distribute the per-module suspend/resume work
across the relevant files (adg.c, ssi.c, ssiu.c, src.c, ctu.c, mix.c,
dvc.c, dma.c) rather than centralising it in core.c.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: No changes

v6:
 - rsnd_dma_suspend()/_resume(): respect the audmapp probe
   ordering. On suspend, assert the reset before disabling the
   clock; on resume, enable the clock before deasserting the
   reset.
 - rsnd_src_suspend()/_resume(): cache src_ctrl in a local and
   add an "if (!src_ctrl) return;" early-out so platforms that
   do not instantiate the SRC subsystem are safe.

v5: No changes

v4:
 - Absorb rsnd_adg_mod_get() helper directly instead of a
   separate preparatory patch.
 - Distribute suspend/resume declarations into their respective
   IP sections in rsnd.h.

v3: No changes
v2:
 - Distribute suspend/resume into per-module files (ssi.c,
   ssiu.c, src.c, ctu.c, mix.c, dvc.c, adg.c, dma.c) instead of
   monolithic loops in core.c, following Morimoto-san's
   architecture suggestion.

 sound/soc/renesas/rcar/adg.c  | 26 +++++++++++++++++++++
 sound/soc/renesas/rcar/core.c | 43 +++++++++++++++++++++++++++++++++--
 sound/soc/renesas/rcar/ctu.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/dma.c  | 22 ++++++++++++++++++
 sound/soc/renesas/rcar/dvc.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/mix.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/rsnd.h | 18 +++++++++++++++
 sound/soc/renesas/rcar/src.c  | 34 +++++++++++++++++++++++++++
 sound/soc/renesas/rcar/ssi.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/ssiu.c | 20 ++++++++++++++++
 10 files changed, 241 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 483979c24319..5479cefb6dbe 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -953,3 +953,29 @@ void rsnd_adg_remove(struct rsnd_priv *priv)
 	/* It should be called after rsnd_adg_clk_disable() */
 	rsnd_adg_null_clk_clean(priv);
 }
+
+static struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+
+	if (!adg)
+		return NULL;
+
+	return rsnd_mod_get(adg);
+}
+
+void rsnd_adg_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_mod *mod = rsnd_adg_mod_get(priv);
+
+	if (mod)
+		rsnd_suspend_clk_reset(mod->clk, mod->rstc);
+}
+
+void rsnd_adg_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_mod *mod = rsnd_adg_mod_get(priv);
+
+	if (mod)
+		rsnd_resume_clk_reset(mod->clk, mod->rstc);
+}
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index fbf7f7236460..9ce56cd84f46 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -962,7 +962,8 @@ static int rsnd_soc_hw_rule_channels(struct snd_pcm_hw_params *params,
 static const struct snd_pcm_hardware rsnd_pcm_hardware = {
 	.info =		SNDRV_PCM_INFO_INTERLEAVED	|
 			SNDRV_PCM_INFO_MMAP		|
-			SNDRV_PCM_INFO_MMAP_VALID,
+			SNDRV_PCM_INFO_MMAP_VALID	|
+			SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= 64 * 1024,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -2159,11 +2160,35 @@ static void rsnd_remove(struct platform_device *pdev)
 		remove_func[i](priv);
 }
 
+void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc)
+{
+	clk_unprepare(clk);
+	reset_control_assert(rstc);
+}
+
+void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc)
+{
+	reset_control_deassert(rstc);
+	clk_prepare(clk);
+}
+
 static int rsnd_suspend(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
+	/*
+	 * Reverse order of probe:
+	 * ADG -> DVC -> MIX -> CTU -> SRC -> SSIU -> SSI -> DMA
+	 */
 	rsnd_adg_clk_disable(priv);
+	rsnd_adg_suspend(priv);
+	rsnd_dvc_suspend(priv);
+	rsnd_mix_suspend(priv);
+	rsnd_ctu_suspend(priv);
+	rsnd_src_suspend(priv);
+	rsnd_ssiu_suspend(priv);
+	rsnd_ssi_suspend(priv);
+	rsnd_dma_suspend(priv);
 
 	return 0;
 }
@@ -2172,7 +2197,21 @@ static int rsnd_resume(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
-	return rsnd_adg_clk_enable(priv);
+	/*
+	 * Same order as probe:
+	 * DMA -> SSI -> SSIU -> SRC -> CTU -> MIX -> DVC -> ADG
+	 */
+	rsnd_dma_resume(priv);
+	rsnd_ssi_resume(priv);
+	rsnd_ssiu_resume(priv);
+	rsnd_src_resume(priv);
+	rsnd_ctu_resume(priv);
+	rsnd_mix_resume(priv);
+	rsnd_dvc_resume(priv);
+	rsnd_adg_resume(priv);
+	rsnd_adg_clk_enable(priv);
+
+	return 0;
 }
 
 static const struct dev_pm_ops rsnd_pm_ops = {
diff --git a/sound/soc/renesas/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
index 293b0eec1ded..7db0fb3612bc 100644
--- a/sound/soc/renesas/rcar/ctu.c
+++ b/sound/soc/renesas/rcar/ctu.c
@@ -378,3 +378,23 @@ void rsnd_ctu_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ctu));
 	}
 }
+
+void rsnd_ctu_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ctu *ctu;
+	int i;
+
+	for_each_rsnd_ctu(ctu, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ctu)->clk,
+				       rsnd_mod_get(ctu)->rstc);
+}
+
+void rsnd_ctu_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ctu *ctu;
+	int i;
+
+	for_each_rsnd_ctu(ctu, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ctu)->clk,
+				      rsnd_mod_get(ctu)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 537b71841f8e..793dd4adbe5c 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -1035,3 +1035,25 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	/* dummy mem mod for debug */
 	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, NULL, 0, 0);
 }
+
+void rsnd_dma_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_dma_ctrl *dmac = rsnd_priv_to_dmac(priv);
+
+	if (dmac) {
+		/* Mirror probe (which enables clk before deasserting reset) */
+		rsnd_suspend_clk_reset(NULL, dmac->audmapp_rstc);
+		clk_disable_unprepare(dmac->audmapp_clk);
+	}
+}
+
+void rsnd_dma_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_dma_ctrl *dmac = rsnd_priv_to_dmac(priv);
+
+	if (dmac) {
+		/* Clock must be stable before reset is deasserted */
+		clk_prepare_enable(dmac->audmapp_clk);
+		rsnd_resume_clk_reset(NULL, dmac->audmapp_rstc);
+	}
+}
diff --git a/sound/soc/renesas/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
index 26f80d542da8..7601dfb0810a 100644
--- a/sound/soc/renesas/rcar/dvc.c
+++ b/sound/soc/renesas/rcar/dvc.c
@@ -381,3 +381,23 @@ void rsnd_dvc_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(dvc));
 	}
 }
+
+void rsnd_dvc_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_dvc *dvc;
+	int i;
+
+	for_each_rsnd_dvc(dvc, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(dvc)->clk,
+				       rsnd_mod_get(dvc)->rstc);
+}
+
+void rsnd_dvc_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_dvc *dvc;
+	int i;
+
+	for_each_rsnd_dvc(dvc, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(dvc)->clk,
+				      rsnd_mod_get(dvc)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
index 9ffa591aa4a4..c4da4c4bedb3 100644
--- a/sound/soc/renesas/rcar/mix.c
+++ b/sound/soc/renesas/rcar/mix.c
@@ -345,3 +345,23 @@ void rsnd_mix_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(mix));
 	}
 }
+
+void rsnd_mix_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_mix *mix;
+	int i;
+
+	for_each_rsnd_mix(mix, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(mix)->clk,
+				       rsnd_mod_get(mix)->rstc);
+}
+
+void rsnd_mix_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_mix *mix;
+	int i;
+
+	for_each_rsnd_mix(mix, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(mix)->clk,
+				      rsnd_mod_get(mix)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index f38bd92d4faf..b480085fb0e7 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -267,6 +267,8 @@ u32 rsnd_get_busif_shift(struct rsnd_dai_stream *io, struct rsnd_mod *mod);
 int rsnd_dma_attach(struct rsnd_dai_stream *io,
 		    struct rsnd_mod *mod, struct rsnd_mod **dma_mod);
 int rsnd_dma_probe(struct rsnd_priv *priv);
+void rsnd_dma_suspend(struct rsnd_priv *priv);
+void rsnd_dma_resume(struct rsnd_priv *priv);
 struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *name,
 					  struct rsnd_mod *mod, char *x);
 
@@ -429,6 +431,8 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  enum rsnd_mod_type type,
 		  int id);
 void rsnd_mod_quit(struct rsnd_mod *mod);
+void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc);
+void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc);
 struct dma_chan *rsnd_mod_dma_req(struct rsnd_dai_stream *io,
 				  struct rsnd_mod *mod);
 void rsnd_mod_interrupt(struct rsnd_mod *mod,
@@ -625,6 +629,8 @@ int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod);
 int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate);
 int rsnd_adg_probe(struct rsnd_priv *priv);
 void rsnd_adg_remove(struct rsnd_priv *priv);
+void rsnd_adg_suspend(struct rsnd_priv *priv);
+void rsnd_adg_resume(struct rsnd_priv *priv);
 int rsnd_adg_set_src_timesel_gen2(struct rsnd_mod *src_mod,
 				  struct rsnd_dai_stream *io,
 				  unsigned int in_rate,
@@ -822,6 +828,8 @@ extern const char * const volume_ramp_rate[];
  */
 int rsnd_ssi_probe(struct rsnd_priv *priv);
 void rsnd_ssi_remove(struct rsnd_priv *priv);
+void rsnd_ssi_suspend(struct rsnd_priv *priv);
+void rsnd_ssi_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_ssi_mod_get(struct rsnd_priv *priv, int id);
 int rsnd_ssi_use_busif(struct rsnd_dai_stream *io);
 u32 rsnd_ssi_multi_secondaries_runtime(struct rsnd_dai_stream *io);
@@ -845,6 +853,8 @@ int rsnd_ssiu_attach(struct rsnd_dai_stream *io,
 		     struct rsnd_mod *mod);
 int rsnd_ssiu_probe(struct rsnd_priv *priv);
 void rsnd_ssiu_remove(struct rsnd_priv *priv);
+void rsnd_ssiu_suspend(struct rsnd_priv *priv);
+void rsnd_ssiu_resume(struct rsnd_priv *priv);
 void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 			     struct device_node *playback,
 			     struct device_node *capture);
@@ -856,6 +866,8 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod);
  */
 int rsnd_src_probe(struct rsnd_priv *priv);
 void rsnd_src_remove(struct rsnd_priv *priv);
+void rsnd_src_suspend(struct rsnd_priv *priv);
+void rsnd_src_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_src_mod_get(struct rsnd_priv *priv, int id);
 
 #define rsnd_src_get_in_rate(priv, io) rsnd_src_get_rate(priv, io, 1)
@@ -875,6 +887,8 @@ unsigned int rsnd_src_get_rate(struct rsnd_priv *priv,
  */
 int rsnd_ctu_probe(struct rsnd_priv *priv);
 void rsnd_ctu_remove(struct rsnd_priv *priv);
+void rsnd_ctu_suspend(struct rsnd_priv *priv);
+void rsnd_ctu_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_ctu_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_CTU)
 #define rsnd_parse_connect_ctu(rdai, playback, capture)			\
@@ -887,6 +901,8 @@ struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *priv, int id);
  */
 int rsnd_mix_probe(struct rsnd_priv *priv);
 void rsnd_mix_remove(struct rsnd_priv *priv);
+void rsnd_mix_suspend(struct rsnd_priv *priv);
+void rsnd_mix_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_mix_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_MIX)
 #define rsnd_parse_connect_mix(rdai, playback, capture)			\
@@ -899,6 +915,8 @@ struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *priv, int id);
  */
 int rsnd_dvc_probe(struct rsnd_priv *priv);
 void rsnd_dvc_remove(struct rsnd_priv *priv);
+void rsnd_dvc_suspend(struct rsnd_priv *priv);
+void rsnd_dvc_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_dvc_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_dvc_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_DVC)
 #define rsnd_parse_connect_dvc(rdai, playback, capture)			\
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index cad15fcc37f2..ac806bdc96d9 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -834,3 +834,37 @@ void rsnd_src_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(src));
 	}
 }
+
+void rsnd_src_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_src_ctrl *src_ctrl = rsnd_priv_to_src_ctrl(priv);
+	struct rsnd_src *src;
+	int i;
+
+	if (!src_ctrl)
+		return;
+
+	for_each_rsnd_src(src, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(src)->clk,
+				       rsnd_mod_get(src)->rstc);
+
+	clk_disable_unprepare(src_ctrl->scu_x2);
+	clk_disable_unprepare(src_ctrl->scu);
+}
+
+void rsnd_src_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_src_ctrl *src_ctrl = rsnd_priv_to_src_ctrl(priv);
+	struct rsnd_src *src;
+	int i;
+
+	if (!src_ctrl)
+		return;
+
+	clk_prepare_enable(src_ctrl->scu);
+	clk_prepare_enable(src_ctrl->scu_x2);
+
+	for_each_rsnd_src(src, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(src)->clk,
+				      rsnd_mod_get(src)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index 007a7c91d470..2fa76a079982 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1257,3 +1257,23 @@ void rsnd_ssi_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ssi));
 	}
 }
+
+void rsnd_ssi_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ssi *ssi;
+	int i;
+
+	for_each_rsnd_ssi(ssi, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ssi)->clk,
+				       rsnd_mod_get(ssi)->rstc);
+}
+
+void rsnd_ssi_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ssi *ssi;
+	int i;
+
+	for_each_rsnd_ssi(ssi, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ssi)->clk,
+				      rsnd_mod_get(ssi)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 7d3d463c21bf..2a8593a5d4a6 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -629,3 +629,23 @@ void rsnd_ssiu_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ssiu));
 	}
 }
+
+void rsnd_ssiu_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ssiu *ssiu;
+	int i;
+
+	for_each_rsnd_ssiu(ssiu, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ssiu)->clk,
+				       rsnd_mod_get(ssiu)->rstc);
+}
+
+void rsnd_ssiu_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ssiu *ssiu;
+	int i;
+
+	for_each_rsnd_ssiu(ssiu, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ssiu)->clk,
+				      rsnd_mod_get(ssiu)->rstc);
+}
-- 
2.25.1



Return-Path: <linux-renesas-soc+bounces-33069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLVFKKYsFGraKQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:04:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 151365C9947
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 611EB3020104
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE733382DC;
	Mon, 25 May 2026 11:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W+gBFM2D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912C1356776;
	Mon, 25 May 2026 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707019; cv=fail; b=dZwOfOHlS5XXJ3wCndf3Zp4hF5qhljxcBUNu3D8e/95bp6nkqBU3RrD9UuHPuy/F/6bAWdS0m0p6CEelbPfbSpY/3shBLacuE8/5Y1knZaXGGAwRmbkmGAqLRx4l5MH2yrcZ2pKodIqLDYA4dA8BYzEMe4K0wSK5Cm1pBVmOkb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707019; c=relaxed/simple;
	bh=QGvvZ+aWam+WfKZe0+eY+AW89jyGw7+rmZn5LV+uQsE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vCf/rNIfbMwBbcs18/zBIf3mnzHN12ioUfhRniR4iy9xzUMZL7feyVNZnNyUwHWO3VZy3TaPx2Yjagncuq8nR9RknG2yRD0mdtI33eapdkCl9BCGFUMu6oPxAQmVACpQbZeSg9FCpzK6qsWUMaV0QHbEPW9yLsFc+OQRyJPp9T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W+gBFM2D; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbznN2ygyyfVPSVaQnWPH3nHNM/0myqqv0QXy4r03oUTazsZtkE3yCqfxdhhiEopHNcPglVc5B8E9fiWfwknqU8dSMuGVFb6CmzMe3ylMWqr9IFwKPX8OL9762DscyADwoFAZD6VSaVj+CaltLdRosu7qXPcKdimwCHhmVE7DM8rYcdMR2eNbV3IdO7E7j2wRLrfgec8XlkKxKvks8qoH+jL6ns+v5DP7xLFSvSl0qjWdbrXbpXbY0CPynAVdjfw34nbipu87LqKPy36OwVAiGjX4e6hwuS/XjwrKlXjIlWvWBH6KxIOp/0B19KzLrPx4X4Cf0spcEuIn9j3JtvH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+N9ZS8kR/AP1K9Uf8CXDlX1wt/gUNDPrB8BAvo6pUg=;
 b=H4f3tWw8isCaIR4RsfWo/OPVfIV/FG8+shG1xq4kaDBAX3+r6C+hUZLrHBlwlTnXvoUsyqzSXxQY9YhQbgLivVYeXPtHnIrRF4UZs/HqBSfPL2TKprC2glbMD83frmV2tGIrKIUsxO+1Jzwatt4XUiLol3+4pX4f07nIJWxQCMcuxj0UHSi7dW+2j48AS29HOHzGe6HULX5aeffPSIDo/u5sgbn0rZiv1MHLx2+CasUSc50Oeb0sVWqTnf7FZo6PcXM/gcyV1vQkjtuqgxJlBXJvxlJx0F09AkoI6GPzmydgKYo9F2MSHJqnOCfOHCRPPTFGTM1mo/zoQGN46JyEZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+N9ZS8kR/AP1K9Uf8CXDlX1wt/gUNDPrB8BAvo6pUg=;
 b=W+gBFM2D0DvIOxybCo0frhM5yEmDQbV/pI1fFSS8NsiGMhuNI0yqkxakXIlhjNsWG21oFt3SHxP6sQoKUDMd9EHm80D2iiuiRVcHc07cBPBRxxPSJ1JAoddh4y4Zhn9JZeFV6Mwb8MSMEZHpIucjhO4tsbmoiftenRt/jNu3+GQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:03:35 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:03:35 +0000
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
Subject: [PATCH v7 02/18] ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
Date: Mon, 25 May 2026 11:02:14 +0000
Message-Id: <20260525110230.4014435-3-john.madieu.xa@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 0469d6bc-4be3-48d0-a316-08deba4d43aa
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|22082099003|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	4HRWYERX0GnE4fnCmzE4MnQQVFCBOlpp14Rp9nJJQal+a5Fsfyj6yqqIMOlhR8uEB4DAhp26dCaqjjM7EcwIE1Q2gd00fHiCObhc7klJ9PXahK7RgwhId0GtnBOazqaxg0+U82mLu6DOldmZ7Sp0QCBt3vL23iYMzPeUoWeyFmtegIFfCGlPkFiZ/abJCsa/9tutfRem1OO8XOHDy1dXFo0nH/BeLUB46Xkxqsj4WF7oKPRv6hQYa83NuTFK3XFPbJsvIjqSRBNMiOotJZPKnrjOQfWrIFPhT13cC4dQgvdquv3p2ltgYkIy4dcv3IJWwlqF/i910spbul8VLZvrGpucMH48mWgIHhfpM2mDz69oHVQp+Q2ue3yDHdYkPC1i6SzbuJpzUkthJhM4UrBsI+3+IKBby+H24ix9nqcuZUvhkaxc0x3IoEGp/un6gsq+OCW4la1EtyeyMCMOzUjQep1TENokqbZTP97YJDiQ5Wg2mXGF6NRo8iGApXSx/0MBEnv7wIGVwRAz0xbbarpjSG7jD+6xNVDVzAFyl7A7gLasiG/ZncUrIGGhyaXaDABRVdAynJBNNzB6HHFKQWeYWjR2cjcaUDeHKYeLm3vNuuQveRuhjduY00l/EISri2zzXy3xIq2uBVrAWTy/cU3W6b3F9Oer2V/QfZ7mixwGldH/4YT/ENTojXLkLefoN/ywJD4wgD+VbQMl/Ss0gR70Jwua13BdB4BRiQHh5y/VorU2ryyZISXcLqBrEsylGs1m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(22082099003)(18002099003)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e3QccDBzJo6ogt/ehyNdEuJdinvZQitqZvEVpCKmvTbZUP23ge1ANqtZo/cP?=
 =?us-ascii?Q?n0o++PiUXpY6C/4nrBjzToVelv8j9RgccrWBlJF49YDoOpUuhUkG3t/Ugd04?=
 =?us-ascii?Q?N2tQCb6FRcVr6iEhhhUiHVqcxerC7ZJlze1s7+g46mAfgEVUmW4j2gOgAGWm?=
 =?us-ascii?Q?jvDFMIlZzMFoAPz/ztcmZjVDfaap7pTrmWXxXsmVSqzm21RxDwnTz1sFg6VO?=
 =?us-ascii?Q?cyfo1JAeJ7ThTIcUSwe7IYETH4u0shHhHJEWDrA2aBgHRA/YgQrdII2Zk4mk?=
 =?us-ascii?Q?Fpo59pbQ8hEgzIv0BgZHZc756v8uf4d1bfAJb/Hejz2Rv3hFAUHq9RvNXMyZ?=
 =?us-ascii?Q?AE1bNCq3T9KMPb8PlBEq4y3oHmvtaiJZv2tjm44QQbkcOvc1P31U9BBGaLw8?=
 =?us-ascii?Q?axYma67z7mLTBQ25qwJYIJ3gMAv3Bc+1O2jA4m+xZLjl+NRbi8JEtgwj6Fkn?=
 =?us-ascii?Q?phVi65YwNYc+Kdf1apToClJ/kN/e0XEN/3u8XyrIcOfSg+EAEac7nm/C5vt3?=
 =?us-ascii?Q?jAC6zVKzeBMLLp1w5umpXL0aDFjpl7RfRis0nvMS4vnaCyZWn79UY2tz7hxm?=
 =?us-ascii?Q?4vdRY53zeNeyijIHDrSZ/V6jMNCWQX/oSdlJmafteaAhMXgzU+STwNIESDpD?=
 =?us-ascii?Q?dYDMt5uWyIaQ+ha4Ka4z+dgwRe74s0esYVLtteaOdi1DM5i5+nLdb4RO0d4S?=
 =?us-ascii?Q?ubuC6i3DWBXGW6/k5fVV+A1h4io9+Yv1ADA7qCbdRJCzIl6E/e9r7XzFBqzx?=
 =?us-ascii?Q?hNbdkWnRxX4EPpsjEx+wDBtOpAaRlf7ctXyDOZy5uiqGLkdSblMgJLjPM6J5?=
 =?us-ascii?Q?H+fZBsWI+IGISD6u5ZNLgHFgeiAEf/yLJCUs8rxyJVWeo2xH6RZkX+XtO7Uu?=
 =?us-ascii?Q?4Zei7I5Rw2pNWxmMSP1rRdVDrRqT7SMzT9e/O7vLh7A9QnfIR/T/fe7Bn7pc?=
 =?us-ascii?Q?bSYc9E7JTgU02SnvhoUx6sR6CGvDAiBwOZg9DKklv4hON/EdrnH1KLKCRxk3?=
 =?us-ascii?Q?aa9gh0+laR5SQYB9kcpvdRNEXXZLVi7t7O4ZHemCrJ/eb6ylEX+5Jb5BshnD?=
 =?us-ascii?Q?RLgAWBVtrXFZZC6fRI2jfWhroREfghIR0DcoALKas/3KO9aUY8KDx+oOh4AP?=
 =?us-ascii?Q?oQofoRG7KxfTV+tsPYQVHkSUmnehZJBPqlHX1yeFl9qiuaI89qyh1IxWBEX0?=
 =?us-ascii?Q?6yjrDIR/H+PuLf8o72JF28wYDCCGP4JMBNOYXvR5bnNIoZA7ucUDWliWVXJR?=
 =?us-ascii?Q?Z81kVnLkJJD1IauzwGTQaM92hWPpg8xDb+1+1YWXZz0p6nfrvQZX3x01D4a0?=
 =?us-ascii?Q?1uVWId4vD5jsSAxaDtjFSPdmBaD4BXHnp00Gl9XxEOewWfANaaWfSdo7nZHt?=
 =?us-ascii?Q?VA3ACwd4EBeXDsW7a3UtE1YEuxmjm387cK64bnkT5Rcnw1iN4JHlYR+AMbGN?=
 =?us-ascii?Q?IT0FVvK6TUnqYrUsPvATwLHct/H4vDIMFdHCvS7xaRN76ZFlJnAo+Kk40VQv?=
 =?us-ascii?Q?lUdTznlt6JEj1T74PWOCeL/FkUVm/DJ/5qmzKJf3uCIGpmB0u7taOQYBDx3d?=
 =?us-ascii?Q?1hmLeEI6hO54QTwiH1PHJ/GPr1HgNw38Mtv5q4Cw4FCxb9s1/kB39UjV0kGC?=
 =?us-ascii?Q?nJXCQUZKJDvAPfeuBCZ1Mw9245jpbua6ERfmqzGybh/N/PYNV5QhyWKNdt77?=
 =?us-ascii?Q?qldMnFFUj6hzBQNhYETGyh170zrIawqx0QksxkauitM61gg1nfWKeclZvfSh?=
 =?us-ascii?Q?DRci4CvEA+7+3jDGGxPA0ivlfj6VQNY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0469d6bc-4be3-48d0-a316-08deba4d43aa
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:03:34.8209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GExo7e3lVNuJqkDeX/yHQtiP//M6x4AQyVHaLbQH4qNRH6VliwOoNFKmGbtEBhKYPcO2QyKihMnQjyPXoeMMusMqrnczDPJYIlXc7yeFNDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6982
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33069-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 151365C9947
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RSND_SOC_MASK was defined as (0xFF << 4), spanning bits 4-11. This is
wider than needed since only nibble B (bits 7:4) is used for SoC
identifiers. Narrow it to (0xF << 4) to match the intended single-nibble
allocation and prevent overlap with bits 8-11 which will be used by
upcoming RZ series flags.

No functional change, since the only current user (RSND_SOC_E) fits
within a single nibble.

Fixes: ba164a49f8f7 ("ASoC: rsnd: src: Avoid a potential deadlock")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: No changes

v6: No changes

v5:
 - New patch. Extracted as a standalone bug-fix patch per
   Kuninori's request (previously embedded in patch 04/12 of v4).
 - Add Fixes: tag referencing the commit that introduced the mask.

 sound/soc/renesas/rcar/rsnd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 04c70690f7a2..3e666125959b 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -624,7 +624,7 @@ struct rsnd_priv {
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
 #define RSND_GEN4	(4 << 0)
-#define RSND_SOC_MASK	(0xFF << 4)
+#define RSND_SOC_MASK	(0xF << 4)
 #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
 
 	/*
-- 
2.25.1



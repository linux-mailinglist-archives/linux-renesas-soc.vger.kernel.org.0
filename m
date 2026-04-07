Return-Path: <linux-renesas-soc+bounces-30943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDt+Jpsl1WnK1AcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:41:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4463B12B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 17:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4494E3059FEB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 15:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4E13C196F;
	Tue,  7 Apr 2026 15:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tg+6U4gw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B0B3C1977;
	Tue,  7 Apr 2026 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576122; cv=fail; b=JZETmJ2rM20i9yhS2nzLMGG9fptX6H11jouCLXedix34UR/88rE1cOdyWhiMhCQ8eVTXE5/aYu3zWzTjhrk/o1avl/Q0O4Mdgp5D4cxIV9aE3ZJphyOAzOcup6Q0FW3ZuqevylHYbG0wM7msTITvpLhRvslk3Dppx1Q0F7frDx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576122; c=relaxed/simple;
	bh=HKH1P7lA/hEozXxrbJmKyPK9npZhbiF9lvo2N3Baalg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=umdocu9Lo9eH1seG5T2bSrnTsJFJQ9uJ9tUShlKbmZSik0JGZO6iS8+XjT4Ry1OLg71jAF6iOL1Q43H0MdnBguIv06zWUX6YMyzCqe4qhdee1QXgCi51NdCFS6t3Ptousj6p0N0gTd8MxKUa3pLNDZ+MHmhZ2CiHYW78ia6y50g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tg+6U4gw; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnuuEpErdeUmYvIxTXvF1oqXoixSpY9pse5FQjXwDEIS+Bm+dR9NgaZJT88mew6BhApC/CjrpCi6feggUjVwj95whcB+H6rottMYW2Db/yAFUj1cHmDK44tVVtkuEhojCzVZZawHIz4hTEH61tKCPrwudUMubx+pwUhYPjmhMPpKxZ3tE2fOCLmKOYuU7E7/MfUhUfK1fYo+ILdO0M+O3+mCp1IRv5GPSxlr8MeTduBjWsT8jDYvOVCItyZ+qVePReQIfU3uOeoYR3sxG+UAPOS2C/IA4HOs0TPVDAYlpQ0Hd3qH0vDT6fOfQpG7RCWWK/lTgBy5WxxLlr2nnP3L3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M17P+7LMiBchKITb7dE4LHYXdVmVHohfMGfiBoNo5Sk=;
 b=G039GgDBqykC1VYeLjromCGw14hxwPL6WnLsJa9kf0S+Jkdq4J3x+ocWwzHUzwySLxOLrlAhMYZKYvlV69pPypDURkSLHLE69obgE+/70o1G9/5LoUOrObuQ4V4tC39oWVOsMP8k5Re1aq2R8Z4AURvmVXgRMja/vY3DxwD1nCOdXhszdy6LBRefRiqKfI2en4Q7xsVyGnGfdup427iWEgxXZUYKFn1vivJFnR+aRUMA0iWVi5ogZtb3ZZIO7FVcnBo9iwy26DyA7GeYFIzjYkf6kGOzexZQkNyKA1/Qhv2azgKLJJrDcnDc+iSpPbF5sUOI7n7a2nxenrG6HQebvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M17P+7LMiBchKITb7dE4LHYXdVmVHohfMGfiBoNo5Sk=;
 b=tg+6U4gwzq5cugKK9BtHLwaboB0UPiMYtVvXmJdyS9Sxu08+x2N3IpkgfUT2dVWsY6fNQu01M0uLMlB6CDTvkNBi8Tk/HO+CHweSJGjtT6CxHPhIjbY5/qmqxtZ7blZIKP8uoQLDc2yoc1dtkFvteuHRWVwVJmPuiIbfTLxurCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11104.jpnprd01.prod.outlook.com (2603:1096:400:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 15:35:12 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Tue, 7 Apr 2026
 15:35:12 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: renesas: Add missing #mux-state-cells to usb2phy-reset nodes
Date: Tue,  7 Apr 2026 17:34:27 +0200
Message-ID: <cover.1775575276.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11104:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ba5c11-8184-424a-5f46-08de94bb4243
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	uaJciqgDGNQlMPbW1VrqDKFkWJObryNDy4eMX7VIIDQo4jy5DKH60Pk8SuYk3tdWQJG79Nku6FOjDuklcBbYUs3DV1xDMTXI1Ga+EqVcwmQ200mYmy/R5PKDNOvSBMZSk6KPcVZwVNRlDzuz1JlCMrQ+ryUP3lxTA2ql68s3smkNpiOokUj2407E3SKF8iJS2mxYfmyGxochcM0K1h/rOgid6lAJah7X8x/08t+Hxr6x9GEr+tjjDmJiBIub8vl5M8HQN2c5PXvrOC+zJzg6CmEC91wlmyHuuqiU5RJRfUrQy/s2JOkDDPwZ89WrMf3cElOCvD765q+yH6jRv4xciRX57AjJ84ybj8pRcxGUXwd0LybvTT/IiCQmyrX2JU4OENBBMfmzqb3ijOwstcQLGmkmeIcrF7NTbK/P3ErPAJBWl2qSomvNwFTTQBc+1r/6+AM5bKNcpTUyjFDIlsdjt1reP82wlx9RyGMD87e/+OyOSMtntfkowiVESUmJACbQ6piIVoISDTb5tLzSIAjYzTrVx/JFI0MH+he7QBZ3O6tsPDB1tTRffbGhOjh4KOkmBxuYHwpscJ76uRggnfCRVr0psRbM0X1TuaAnhRzOJSJX5yploecuupXSmwZ3TUcfcAZp4DsJPVruEAlMgGxQV31/CJEUPHidj5p0nN/OCsux/MhXyfHranxrkwthqg9c4JyWYp3rTj9DeEzpi5JVYPZaguzSP9IxAWr2n9MwKSlaWJaKM/rALJ0hEHySAwNfXd4I3doGJuFRdKoW0GmUhklYR92JATLyKPdMqDjcxqQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B+JHFCRN+xuWWU73lfQjtFTImjUhYP1KtbNFJeOBO0vjfezSsdrBggPbSKBN?=
 =?us-ascii?Q?9p4hjdSy+ZBMHwhrYCgkC/Bt+dczmDP3HBLaF49aK8KWFkgjGjY2uNV3LGQ5?=
 =?us-ascii?Q?ncAJpl3sJGzDI7gTGMaNROXbRFeMAMs/RIJiBGQ7IKFjPA+iEoX7W19LeFwg?=
 =?us-ascii?Q?1jluUF0/zyMpowJEZb9Xiy0xS6m0BTXLaLY1vmRXL+rfHv2pKIXIExtDtmS3?=
 =?us-ascii?Q?ZdKC/RUB78fVEp+gILzZJrn9cgD/ru0wbdBMQswwHTeNQSZbpPFQyZEmcpw9?=
 =?us-ascii?Q?Enilvt1IMoArvJdtjDtOTTxGgZpP6BRa/RFmIXOMqzIUT1sEhAeZNNZPeBv5?=
 =?us-ascii?Q?Fl9KX6e7ofDex4x6mxXyJ+YDcfFY3POEKws8tNpCaKLFtQMIX9rV2uxJkF1Q?=
 =?us-ascii?Q?D9T3ccmleAwl0FMav2Kx8obStFpuMuGwfDJJ6KqggzONDhSn+3d+G0LKsc4u?=
 =?us-ascii?Q?ZHjiWXIOvNx3M8ZEIgjtv8K9UQ2jSqBtxK/KPBJ6NaKOymgMSZLALjW328/K?=
 =?us-ascii?Q?tiQOajBnanNNznndOlnbOAc9jjEZuhveHMJznbJ6ptOm7JqtrfV+mKYaHXVb?=
 =?us-ascii?Q?huFAk9Jw53U6+dxSur49AOAkbEYPEHx2QFfnNUmshOCcvUp56wSzhjUFgW5N?=
 =?us-ascii?Q?oxXmh8BUBGtzt380oxb3VGP3yuVbGpNNwLv+FZfiCODitnxyr+vMSmrhTS4X?=
 =?us-ascii?Q?KExjXy2aVC9onWee1qeMIzb/qwI57oUGB/uxai/iGzRsE39ZUY9b6qhvueeC?=
 =?us-ascii?Q?q9lw7puFuQHBtUYu9Yx1/HMXsDhPN+stw+GTd8OQFOG3V08KkWBwibBh/eqt?=
 =?us-ascii?Q?xKcmQqXIiw9eAoAthAeL+P5ADbrBs6vWme4mfyowiJI9XROkpZ9moN/PtvVc?=
 =?us-ascii?Q?KnCiRLGMMc9oPNJSDgsEvd4UjvhRinocfWTRu+b3deQGGKHqsVtT4xO0Y/uK?=
 =?us-ascii?Q?zZBGmFd4Epqq7BnAsly4apyrG/p+DT1RfWNqsTYwt17Paxj1ZythlEHWNG62?=
 =?us-ascii?Q?J2XmPo+rwnZmzYC0DOj8OeO/nsQviAU8um8NfuOOAiHQqfXEzerH/06WbCag?=
 =?us-ascii?Q?018HHTabQnV81UrbLQimDEmtJtVTCwICsUSDBt8PQVk2DC0HWnm9Nez58Rtt?=
 =?us-ascii?Q?dkRnrWnfmscVSDgaQRFBG9rjSzAAUa6AvS+a3ETgtIKo8nglawoBbSiNHwUE?=
 =?us-ascii?Q?Zc659R88GCfmDGK1Fxt/dqpHabw3BK9KUD/kXMo1GQONUeE6nSHe7u3tCcsv?=
 =?us-ascii?Q?GtXeEIW8X4eSlPt30g/jS4txP0Rd9mEQEUowSSTDqODCHHhyGf5wzePIdwL6?=
 =?us-ascii?Q?cUAyErTR8QyPQoe/9mZ6Ju78NU1OCjrQaalZ93nOOSjz7gC6YL9oW3jiQV49?=
 =?us-ascii?Q?GPqkkev/Y2TwE/+/QVAz8yx8UHUdYW6dTU3YOvrmDDdorUZbmjISQnHL3xw+?=
 =?us-ascii?Q?PczmHYoXya2rX++ppDKQTGBxkfGXedoHJ4S8s3rDb0nt4j38m0YtxhC6wRg3?=
 =?us-ascii?Q?rAM5mFpMK8kCozSc0b0iGXeKKPsCIttIrefETzQF2aPKKZ/ukD8vcIoM0VEQ?=
 =?us-ascii?Q?r6OeQJ8eMwrFMyD8zZ6oB+eHjz1oqG3C02IReVIACcz0j01mp935y6kIdzTN?=
 =?us-ascii?Q?GhilRuAZMQY7iiRlLVVjKwu8OX/uXhyVIP4l+3BP5HUaudstsbnpDNb1w/YS?=
 =?us-ascii?Q?pC2/PqoQSmoxAkSjA7fEATrg7d9v4ledSq8GfcvGih4dkOFfuqlD5CdLTDuj?=
 =?us-ascii?Q?js3dtmHXJbVMEZ7Mq9//n/VSNHaxSxahE7OHnsPBlMoL7EAJNwy7?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ba5c11-8184-424a-5f46-08de94bb4243
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 15:35:12.6259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJZI1Upma9rf/mP+Pq9pTYF/Mei1bwM5zCbcKiTislTJXg5LhAOePdpF5LPLbnHzlWP5Py0NQ66FU3JKew2sj4NJV654/4iXp1zk82JkGNemhGU6EXe7oFbKDAF9aP5z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11104
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
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30943-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.241.139.240:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid,0.241.179.0:email]
X-Rspamd-Queue-Id: DD4463B12B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear All,

The renesas,rzv2h-usb2phy-reset binding schema defines #mux-state-cells as a
required property. Add it to the USB2 PHY reset nodes in the RZ/V2H and RZ/V2N
device trees to fix dtbs_check warnings.

"arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"
"arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: usb21phy-reset@15840000 (renesas,r9a09g057-usb2phy-reset): '#mux-state-cells' is a required property"

Kind Regards,
Tommaso

Tommaso Merciai (2):
  arm64: dts: renesas: r9a09g057: Add #mux-state-cells to
    usb2{0,1}phyrst
  arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.43.0



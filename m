Return-Path: <linux-renesas-soc+bounces-33091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL0eCxEvFGqrKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33091-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:14:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9182D5C9CFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D291D3044726
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C6737DAAC;
	Mon, 25 May 2026 11:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YnjzJ9ua"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB9537D136;
	Mon, 25 May 2026 11:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707251; cv=fail; b=sMW2R2WbpC0MPFnmwYg1ycyErzt8nklPZyNs3c8cRuhfWyD2lysVt/seDLOFrBrkUCQPth3JhjLXuuTKwaLLYRxl+MSa4vBLTi6wv7qJ3Fay+nhMv9EPvBbF1M/67TAeJEVVZ8+DMsxbMEmxXNc9C1itN3t3y86lDUHtJUfJf+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707251; c=relaxed/simple;
	bh=cXzj09b1G27qOnHcC4bYr9s+C3Y6y3KuQv+wlRwgEaE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gI7KWyUfraGxZoquwgoffHWGeAXxIz+UKm/8Ql4zFnbAPISzMY20EG0tCSoTKGjn/aykqn6ybPe/v8Rg7Q4f/6OVQrgSTCJ10cqK8z+NPGSf03tbTiRHg/PYSdV6NGDv4l6Rr2ikushKszzZrrfH+3IzbxRx96SlSeTORm/YtLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YnjzJ9ua; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok7pLyk6e/uXoTpPVkn94tnT9wFicdrNh3G2NoHX+w5+o1oVG0gjl4i4KY+I84UqhqEvBtKMIVm741Ak5dpYokYxErAJmptrX0k+/WVti363QznLcC0jTzSSI7ohLMDzSQDaXtuMUFLyAWFR3iD5EecKTDJchfsQy9c1WesSSUDuXKNgu+jrfBul2UnO48hNEkTT5xQDCP/xWM9KViMHRAxVXrwdow8A7WDXirAEt1gHWBkm/Gjd6OcXPtybArP7y3voAguqzTTBMoFyAU9SHSeWqv7jZtzL7xQ3XjmG7eLSRzTP+01ui4ltAm4TWAYmyRnaGPhitPrA61ybE0g8WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MoO6TfNgLZAbszVd1jtD36G7n40NomBUKjMM3aadiY=;
 b=WDv92FCeNMVuJn4G/qkLBjsLAoVRd4w+L7ehutRDHU6zJn1gBRpyEWfksZoBMo3KGI0L6MqDVBgxlNykA8ZbvJ+j1aebvAZAqCYKNM/gvif16E1QssY06s7d7sPCMjIoYhu16oSDDX016FE1O27zwKWnaWNjIJUmVx/Jt9yL++OXjh1GCAjbkjPRHPJA02wirq/lplvKdiTaeSrVZUYauOb0Kj/lIcGiGy85t01ZR4ELRxeqzx4G3iWuRIbpuBsJblREYyLdK2aeYfMsgUk5+Tw0COH0gTgM47yHs71K2ah/kPN4DK2ubTN8qO6bkCSliVUvHSE3iPUCfxXXVjNbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MoO6TfNgLZAbszVd1jtD36G7n40NomBUKjMM3aadiY=;
 b=YnjzJ9uad6DKQLrn01C1vBHW/89ngx1L5ZfO4EKX/pyztqlaT1ufPvG6KNReeJD0VJg3ZjvJyBKKzOEzPLFn/U5Xj8o83GDnEwkl7/k/VQ5T5sySBd3ZFfaQWnUvlX2o5veq/0CbAAtg8YG/++vQ8Iv5P9yNH/MecXXkweMqp04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB8484.jpnprd01.prod.outlook.com (2603:1096:604:189::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:27 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:07:27 +0000
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
Subject: [PATCH v4 5/8] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
Date: Mon, 25 May 2026 11:06:00 +0000
Message-Id: <20260525110603.4018170-6-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 52028a91-3cfb-4982-068f-08deba4dce3c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|11063799006|3023799007|5023799004|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	8w9W7UCk+hgdaiokYOQkmHt/A8cuBFweqx9rmCaMvuV3n0E7jphd2ZI0sHEuIRK/fOfK5K6UX8o7jT0Ze0cUd64ChaqMnP62mA3ZyMQfRVLmkbQD6qf/+UZ0RqrNO0i4MtiwOGMagAPejfeV3dpmye3EUuEkubldd0C1JdR1uZQlKmagjdtCyNe/GlCVvMOx0vrEtI8H223pcnbt6ZyCrnoaNrw+FOeViRnN9zm/ETfO6ofiyKez/eRTQ0U//4NeDvcoxsz3xFbCzusvV36jPhrwbIaNsfAPabqQwCKbr2DGnPPxdfO3tVcXZEZg+ewU4seKHTy+zBwMxliTI6N+OHXNuBRNnYbc27QNK7tycMrb+yNgsDTjdTd/W7T8vDZ06Xe8wIHDUaIfEQ6i3h0QCc4wzLr1bwruIpP3pWKwqBK9xP1LoQbyLNhSOKsDtofxoaAId3bi91z8Y0Y1jPFMDYVgjKcKV2AWhMohuXGo7joCihY9holHyCDGcE5UyS1fZjvPNtWjnlCWvEQnWgfs2SAN/4xKn9U1flH1de5KuIGIXmTqgd65SzGXd//7zYTRYjV3woB4oybXdNkew1V6dbJ8xzG4DaxVr+ZVUnV2YsiLl1V2bv+rKgiI8fNEDRSlOFSmy5LfGa20QtEAH+oRPDzaT0dQCFfGGs2NAVS8ifdK3dn1lmrMKr9cizP9Kub+LmQfQyDBbZ991p53ki8bCsKOx8/VjWFJKhB+9Z4ji68T6V949aMohDLErQExYsoG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(11063799006)(3023799007)(5023799004)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LvUBkO9UJnGX5g65teEcF1hNpIhhF2Wu+NJTO4SNiDf7nb+kHdOdhoFJcIU+?=
 =?us-ascii?Q?7AVpvIUtxfCpxkyYxNjnQVmirIVR/1CpOIaWBZXb/evMMWZLkA7HAIPLSNAR?=
 =?us-ascii?Q?tU3IPp47gdGBrrOGX/iaaxCRAB2fwXwe8ARKVI9QZHb5usImDA26coFvgTsr?=
 =?us-ascii?Q?NpcPC4zvCeEvv0TE1F83tUWI4nptuHFXtKOycF6bFYuvkliGvI7hCruSpful?=
 =?us-ascii?Q?lO69xki1Ne4s6YiyghMCbrUbI88hQ1PZJ8ui8Di925mOFpCD08oRb5IpMmKK?=
 =?us-ascii?Q?gJG+Tw26R9zQGS/L2A+VnubVNAzsylaZi1BvlbTYMg/ScukSdnyd5ZnnNkp0?=
 =?us-ascii?Q?PQno8V6BAIpZHy58TfI1Tp848cbHYQD8avfD+TbfWWswdDwPOeAnIEVweF9J?=
 =?us-ascii?Q?/jC+0qKiEaoHsrb6835cmp72SuiYXL86B+5PMN9E0jp+smdjoejjViqC9syp?=
 =?us-ascii?Q?QlODUgx7tTa/yYAL19NA9MN7TZLbwG7guDrvidbKL24QSyzldtmWSmKYi8mG?=
 =?us-ascii?Q?jyC+2wE6T9zXPcw8UQGnCzawG6DVwES8BrLOtDs7tfsDReYDy6NXN9YtT2LW?=
 =?us-ascii?Q?cMr31k8bXtD73+yVU+6n4C0U5YxYDBqGxt4S/7wucJLJoZITXWukZiqHoRCU?=
 =?us-ascii?Q?FhMRCIZk9Ln7cqSUHX63FDIk8pahophHKh/TXz9NQuTTPoNaJqEc9xhFsyiT?=
 =?us-ascii?Q?BiWri4+dAdJnMemmgw+1R7rWlelBkq2eYlk+gGnZYTLavBOZjlyAeLmRsK52?=
 =?us-ascii?Q?gim4FyIZdJy6R5AcUtGCXctR12UIEjR7Yg/IKIrN7i1hEX1+8kuiuNTC0/xS?=
 =?us-ascii?Q?ChXAcIpDQRaCxMv6MoJAZUimqHVC6sVbsybpT2NWuLbtRzPMkntwkKOKBNtW?=
 =?us-ascii?Q?NtllvJrEmljwo8s5NWqolVmcSGlv42iUUadjb8Lqd9wx2jqMU/5e7JnB4Zjf?=
 =?us-ascii?Q?xDIFV0LMs14qSviR76admXAR60tbzYfpbWY/ZFiKq/rJCZZ+ABHeJcsNaVwJ?=
 =?us-ascii?Q?3ZzAyJT0sKehCQZ1TH5PsrXUpLo6CUpxdeJyis0r/WxUp1mVnKaJFdJd3P7V?=
 =?us-ascii?Q?y9P6T+XSWKJ3OcIOAYCAL2p475O35RCDs8ZjnJlTlRyR50gdN2pZxZQmg+k/?=
 =?us-ascii?Q?QYwuYct4iy4P+2KoXsjL+/YhE91VTqEiMkDfBKPVm7BihIXvFuirHWtqxzfV?=
 =?us-ascii?Q?LBqzSxvmg+uqD3A0+HZp0qGVJ1ilLg7VDWtAip1T41HCvjmo5LPErw1QShWx?=
 =?us-ascii?Q?44gMj7DeYwUAy2ckvHyQe24gmluAymVndKuu7bKJDcdxiP6p/AmCt4Ulo/CQ?=
 =?us-ascii?Q?6Y7qT0MVa3WChqzWF3+otoJV40l3rJp+1x7MiX5JN+I/GeIv2h97Suonh8oF?=
 =?us-ascii?Q?G++eb5l9TDjn59H2cMYhDeZ+R+Fevvcx+PMc041w6DQT816gyr2WKwNYa2b9?=
 =?us-ascii?Q?SBeCKCTKApO23qi9QBtyv2Tpkv2bWJ/MvWUnwMdn5rwDQsQWA89i0H6VOTJC?=
 =?us-ascii?Q?MwUrak0suiUID6gH9jsD0nBsICc4zKYZKD4HHNn3bAuR4cRCFjBNLxvDqW7M?=
 =?us-ascii?Q?UVGRy1hAngbfT8VRqgdhQuBamWf2YLIta3OZP5R9sJ1vsl4qzImHhgZcKF1Z?=
 =?us-ascii?Q?4z6M7sl/E6Uw6GD8dH2GkScASbjG8UuDW77oGIlAz/job6UjHYfPYXNoR+iG?=
 =?us-ascii?Q?/F7RjtWepsGWTuZA1DKREimdtoQRDOgRFqXoYtsDTGl2E3zRf5i9f7w/8wRb?=
 =?us-ascii?Q?xRUbuj/BABEsa6QroM6K/rvqZ4ubisQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52028a91-3cfb-4982-068f-08deba4dce3c
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:07:27.1317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhFtWi3sqK+KL7HAlEK87Fy1YQx1ROuQ3yJcWQRZ3mpwFu++1KwHSpWcIgHSiceM8khF+SlZRyCV4pXlEec5K0fo/KoKaO3amL/HHvZr47s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8484
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
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[redhat.com,bp.renesas.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33091-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.996];
	DBL_PROHIBIT(0.00)[0.0.0.12:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,0.0.0.68:email]
X-Rspamd-Queue-Id: 9182D5C9CFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Renesas 5P35023 (Versa3) programmable clock generator on the
I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the
audio subsystem.

The Versa3 provides the following audio-related clock outputs:
- Output 0: 24MHz (reference)
- Output 1: 12.288MHz (audio, 48kHz family)
- Output 2: 11.2896MHz (audio, 44.1kHz family)
- Output 3: 12.288MHz (audio)

These clocks are required for the audio codec found on the RZ/G3E SMARC
EVK.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v4: No changes
v3: No changes
v2: No changes

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index d978619155d2..89428c804efb 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -77,6 +77,12 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
@@ -130,6 +136,20 @@ raa215300: pmic@12 {
 
 		interrupts-extended = <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLING>;
 	};
+
+	versa3: clock-generator@68 {
+		compatible = "renesas,5p35023";
+		reg = <0x68>;
+		#clock-cells = <1>;
+		clocks = <&x2>;
+
+		assigned-clocks = <&versa3 0>, <&versa3 1>,
+				  <&versa3 2>, <&versa3 3>,
+				  <&versa3 4>, <&versa3 5>;
+		assigned-clock-rates = <24000000>, <12288000>,
+				       <11289600>, <12288000>,
+				       <25000000>, <25000000>;
+	};
 };
 
 &i3c {
-- 
2.25.1



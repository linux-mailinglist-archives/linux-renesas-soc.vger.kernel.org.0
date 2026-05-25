Return-Path: <linux-renesas-soc+bounces-33087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDU8L/ktFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:09:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F075C9B13
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D3BF3025C56
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C13D37CD57;
	Mon, 25 May 2026 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="V3qLADko"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F1725B085;
	Mon, 25 May 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707230; cv=fail; b=uGmFVcAuwxchaTnsK/HJx+alBo+lL5Egg7y3SShI2rdJ8Zmhp2/qsDfLHMS1O2MBLow6UPJ7tmNCHxhDx2zaycAKzSCy6U2LTKQmRNcFnxWczjE+kxX40Hw7oM7cIokH8nnnsHlPNUnb4smlSkGTInuKh2S6eZtgIql6+v3cjas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707230; c=relaxed/simple;
	bh=0nw7bjniFUeuPCQZYncppYWiUhgKa6N/pY0BedFrpGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TUsva4YTyOodu/Ykcy/npcJXpwp23dMDL2asZs/dRXHL/FttX1T2luAlE8tCVwmOKF1g/OTMgYVOs0yt6ADuGWyS4U0XLZbxPki6usOKBlIUbCpt7AKTJ5hJtid+8fcXPVeoHunjzrSYCDqr9G1Xk6UZwjpvnAqSOTe2P3b6Xjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=V3qLADko; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SB8LCy0lLMysHM4umElGzahlHcsMKYKIrtDKO//tv+WZGFPC8IpRDYLv33V7hoMN1cu0L9FBiIOrtDfMi6BLGxrJeCS5NyY8qYztHVqt1Qfhc82OyoylVsK6VIBDSIAFHBhCAp2d75NEk5tLtj4WBvq+z7OnAS5v0JiS459HSvWqFd3cq9+kEcVY2YoltNp/HJMq4saSIFzgRr3zGQJdBpyFH9jAnBVhMhR5Wml8lC3pC3c/WfBS7ljc0AAeKrEL26iFnC/PG8wSblyh0KfKBsMKI9s7wEzbqaQqym49Q4KIAOYBW2knmjIRzsbXTSzmh7KUy8nCXYd/rwEVi4h8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9/fcPmHakJiJDneQjiwS607N48g2qU+Y1XLa140wSs=;
 b=i+20xagDc1s3vy3rr2zHQjfLODNTn0VKnpISiP73vrgmjCo7K5twwErJOn75RQUGXrc/JiJQzYknnLNRGVn1taRLy6HSwsvhWLHhlPt2uopdOD/h8fOLiQp0MiaoTlQFJ7U2CS92TY6lfrAC1/urHt/9byYLj6up0ji2DBZG6/+OHE9gyJgVPngd9iog2Qhy14QvEvw2xFcRI14IrdTkXmg4DMnTbM+6166qbyUHAKUVLvttbDxnvSHIkK+EpFio+KX8oIb1bXyWn79+howmhRNbdh7Ep8aj03Pp3BhF0AVrZbfYdNMquq+2iiR4LeEy7bqErgYIsiWN5bJQzmcMmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9/fcPmHakJiJDneQjiwS607N48g2qU+Y1XLa140wSs=;
 b=V3qLADkomroyi+iFlUtHJkNJE1n8z75IN/jw4ply74zYqhN/BR+3iYthqM0+2qw/VIIqtuUGPNbCvaPkXCcsnm5kcBo/JCkhcZYZpopvJAo5yCM2YHf/KP2rzUd2ritcDspxsJadiXSXPA+LHhm25/A0yvuQWfTKtzXZHp9l0PQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:05 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:07:05 +0000
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
Subject: [PATCH v4 1/8] dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
Date: Mon, 25 May 2026 11:05:56 +0000
Message-Id: <20260525110603.4018170-2-john.madieu.xa@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: b31f5770-3887-4b4b-9e0d-08deba4dc13a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZnD4Ysi24OBUpEosxNHZOayXa9M6C34xS1i9TypnRLxiFKCCybSY385xKUR9/fp0N3b9GRn7GAI/fkqEe9hmD2+7oEDWqwjcVrPvei4Mr/eI283AA6Q8LF4uqykWYQYAC6FNQhyGWYlVg/r4RgwIyk1DrB2KGpdYgleoLES5BVlzjUGGLK1xQyjLqHD+Xfb6+QyOMKXCrnI91V6z77GSfQsUxajnPMRLDJ2q86/RiWcKs3niEaB7vaSU0urWKGgtjPNuS8jpHrq3akBV+Kk4IG88NeTxrUpXIGauuOKYJJ7nW4It8aRvsLWCfbkNsRjpUe6eGwvEQ2Ze+8nToBopkJy1prIxDRCqyoMcDq8uygJ29hrZUCD/NfuYAsl5ZLkn7x/YfgDlZMuSG7/27Tyex1MhyuBWqwcXtIeLuvVe6bQ7LVOmnYYxZYk7iO1d5uk/IrqzREEepuWoE5YLyKc3QqWFKwgKENy6XuP7sVDUaLQ2P3XJqTU8lHpu8kGTcVNNa+HBdvnwR/er7Kg+1+K9OEo4+3IcWLDgmUW0TTNvTeSv2bojl2OOFWkDnvNFquVJEVfMiE433qI/GU2h998bPn/+A2TX4dcjQvaMHhCpMTLz9mkHfN9VJy5b8ZGrt0DhnlwAmGr/5ZMzvwIGKmKHHwh8Cs3ANjTAvOYpCOV+N0N4l0sV47fvGAumWUYc+mtcEHXJZsFu5JXswgCgBnSiB++Z2r5i1H24NykpWpHNi9X9Dy4ms+CxE5RmsPYWLLBC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r7EBlPzm1wclXN60PTmDggRaGjdt8qJl0FAY6rbX1s3yX46FWJoAWi7ahl8h?=
 =?us-ascii?Q?jEIo/vPop2wLZh6MDpJhwIug4rArfQY5AP6K9yxTKQFFnNxkwYuFTtvdQd+D?=
 =?us-ascii?Q?CXHluHqOtaMOufTh67+wdz4b6zgw0u5uTVO3qM0fKirth6ZmHSHSpUl2OOaM?=
 =?us-ascii?Q?cwcwexAs6xU4OnBrC0QlXuAffJUFsrJOpa22eD+5+5CqrFCOeYmfLcw40QjJ?=
 =?us-ascii?Q?ERIsDe41dXlXISWtYJ4Smed7qpTw1zZqaCZmp2bYcTQJPykrxtktzw876j5V?=
 =?us-ascii?Q?zwIty8HDrIYNptGwtQpZvdXGzWit18WH4Exc8QM1qNLAh+yE16sC4V/rnGjk?=
 =?us-ascii?Q?A2gQe0ijGDaPhyzPAGPgasbGdFDAu1TaL/0uoaKPDEj2F3il1eOG6GfHPUq1?=
 =?us-ascii?Q?lWWUUbTNVoNlWUCfdRt2UyGhuqYulvUZ5DckBxn7el34btOJzJpasLaU4Z1v?=
 =?us-ascii?Q?rSP9KCWMvkcqMqSFAf1t/OGuNlkKv3nqw8TMNgKTqzOjkc+M0FIm5MCTM945?=
 =?us-ascii?Q?1ydnSfVXFPuIKNO/p9Z5VV2uesHflDOADFvjxl3rjDrDg6VUZplDXcZEgYp+?=
 =?us-ascii?Q?Sxps1swHQXsTZb9/0vaFn1Hjh8PqUFb9ILlYL5CgJSJbDhWhJHzuaG+dAH8Z?=
 =?us-ascii?Q?8RT2g82zGtWLxMUOfckanuZwTYOWb7xcASFPifUQgiSDlsPlaNRoRqyeiZt6?=
 =?us-ascii?Q?U62D/CunNouwfntb5a+g0WfNVgmEkQVmAJSYSvSq98uk3oN48mjeOkpJruJ0?=
 =?us-ascii?Q?cN/QOPE9NTLZNdsDRbfbBzOulJhAc5zMtcjS8Iv7tjaKY7NQDlUiZI84CMLT?=
 =?us-ascii?Q?okq+yJiMtsGE6waTgthrZC3ZOvI8NAlKbSMw22GfBSgZoUbL2yFYv/MoOT44?=
 =?us-ascii?Q?wsheQABmNQ9eIqSpCervtTOoMcVgNOzoIW+9G4QDguwnw4/DhQSp9GW7QhUN?=
 =?us-ascii?Q?zKWvxm44rpi95hGywmtP6K3d7xzc6luYezJbaNquEok4lXjoWpimrOfTXOEm?=
 =?us-ascii?Q?UdktXTiCor4d6cxrkz1HxPb2lXwxQW2Cgjvg+aviYJXtkkp2I59lxtr9TxMl?=
 =?us-ascii?Q?9o8DbcqKtO/Aak1VNmNW7AED8QLlvZXoJGKElRLouxG7KWZAUg88DeEYNx+3?=
 =?us-ascii?Q?0DV2nYW5oJanE5mMQKzbJSK7bcfaIKgfwv7uBVRVg07VVSyYmYVjr+gv+0Wx?=
 =?us-ascii?Q?N/WnN3Wq8mls8TBA0x1LhzBglo1TCpKN9Ri0FWU1/wK4P2fEUYQtns9PV0Va?=
 =?us-ascii?Q?4CaF5795R61LndoOzpjRrjPNVs45LzREAZq4SaFNuFuATRwDJW2+0W0JHskT?=
 =?us-ascii?Q?F9DinL7BSORO97Pw2xaCLWyI5SgVmZ0t5JaCA8vQcLcHAs2d5dCYl2vntZfJ?=
 =?us-ascii?Q?5iJ+S1Di8Oi4Ev8Bi2xqh+lfNJGDBJFMWGdOW75hiHFriVfoJgCtUlZIwmui?=
 =?us-ascii?Q?K24p3LHVZUD4S/B1Xq5JU6OxI7knOL9O602jrAkb9ns12iQxr0F4VgaoQnDs?=
 =?us-ascii?Q?HRvx/20AY+6i9UOaO81AaG0zpxhC1zGHixFnOgyt8W/d+0JLt17U0a8j1u7A?=
 =?us-ascii?Q?YAJpFM9HYcQEZHsUGqz/jyy+JChWOHI42wsBWPDpGbTfvwkVBioVZ9ZdG/zb?=
 =?us-ascii?Q?dVJfe1RqpjKxePveModEtliBGFaiqbuTJqLBX437dPJumavuhSB664DL5EC1?=
 =?us-ascii?Q?MucRmKmnJNsVWHViX1UAHQitIVWf92gBUT3rhA9p7AevJo+k+damo/loSmlf?=
 =?us-ascii?Q?eMZe/7Nzj06m6asTmjfKME75HBTrhPM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31f5770-3887-4b4b-9e0d-08deba4dc13a
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:07:05.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sny4bPNKm4se4R1D+Tc2ESz8dW3AV18ru9mL0+Z/tIYDi7sDTLoxlFvkce/SWqrN01L23yAsYtMi3IjGqCjWjjCPUPXpIapv/9HXEqze1VE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33087-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 35F075C9B13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/V2H, RZ/V2N, and RZ/G3E support two optional external audio clock
inputs (AUDIO_CLKB and AUDIO_CLKC) that can be used by the Audio Clock
Generator (ADG) to derive internal audio clocks. The third ADG input
(AUDIO_CLKA) is fed internally by the AUDIO_EXTAL pin and does not need
a separate binding entry.

Update the bindings to allow these optional clocks for all RZ/V2H family
SoCs.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---


Changes:

v4:
 - Drop the AUDIO_CLKA clock input. AUDIO_CLKA is fed internally by
   the AUDIO_EXTAL pin, which the binding already describes, so only
   AUDIO_CLKB and AUDIO_CLKC need new clocks / clock-names entries
   (Geert Uytterhoeven).
 - Reword the commit message accordingly.

v3: No changes
v2: Remove maxItems as it not needed with items lists.
 .../devicetree/bindings/clock/renesas,rzv2h-cpg.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index f261445bf341..dd3e66a4559b 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -26,16 +26,22 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: AUDIO_EXTAL clock input
       - description: RTXIN clock input
       - description: QEXTAL clock input
+      - description: AUDIO_CLKB clock input
+      - description: AUDIO_CLKC clock input
 
   clock-names:
+    minItems: 3
     items:
       - const: audio_extal
       - const: rtxin
       - const: qextal
+      - const: audio_clkb
+      - const: audio_clkc
 
   '#clock-cells':
     description: |
-- 
2.25.1



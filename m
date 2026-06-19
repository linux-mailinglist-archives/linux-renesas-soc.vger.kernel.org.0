Return-Path: <linux-renesas-soc+bounces-34235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id prwWBWEBNWqqlwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:44:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98F6A4AE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:44:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=uGeAzLW1;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 740F23043F9F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 08:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7D33603E8;
	Fri, 19 Jun 2026 08:41:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3F235B63B;
	Fri, 19 Jun 2026 08:41:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858465; cv=fail; b=C53q7yJgc9AT9sJNxb69pMfOP4JMZ2XsHjyGuMueMlMH7N5Wt3kWAnaldbhYTtAO4JibOUn5JpMe3mn8mHqos3+rFyyTj8j0VM7CZK2m1WEWXGU+pbHHPvNtK7zqN7PfIhsoaus4c4saG2Zy0Cur3EAECYejefDqAx/VjIEq7H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858465; c=relaxed/simple;
	bh=ZdIKlJTYotwaWaZNvoQoNhhdP0WxaAxevo5PDURF748=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rIcQnrhPDmLyeahIcFJMLUg1mfRaffMeCT9WZGSASJ9372/Cob5Fo6TFpniF3FLZgM6icmejfYmdiwvIRQmEX/AaBhZx5JTrdBbHcc9Cq1riKOpffyDF5sGBSYnu03OHldb7c90NyD4l59mCGEt+1NJXUG4PRGhAbwo8xTJhxfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uGeAzLW1; arc=fail smtp.client-ip=52.101.125.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIIKptf5IZ9UOQPT6xUcG+jqDrlEw3FqXji4RLZoQgWb/F7/IX0QP6fuGLDxX7XlD0duRyZBoyqBtxRQFmMwXbZUcXO07k7WeWQZqWEL0zmnufxNgFrdmL139d0qztsc/rSpozu1zDfeX9fT1UOOgTMTZXqbGVJld6+IOF+8gDIhLE0p1N7q8Ps+enrcY6YQI62uHOT3mMtTiWvGP6As7LFKHdLpVpJgzMB2mOtekBSsF41ycuqdxDGwnhX2ArddAgH9+BaS9Mf1Ca4tp2NqXIWQ57PE4Rw+ir4j/g/2ScyZXpP/kyDk+M+f1a3ia+8y5WaUE7k+XPPZDuCJ3mqN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eV+XpwarriGng8GzGZfDSu8A7XSEWEhF80kkGdDtjA=;
 b=BvkmUJttaT8gaGjSdURF2JqymdjkQzNrv7y5QiIsMzC1oEkppvSRm31G83Dvu2lUg9Ye4uf8BOQvKg9DZ37zLJALY23CmKuHXcu08GLUQMlko0p7IqpQSqCmndXOOnBWAbx2T+WWN356FLmPHWvCNNg9TmT1JJKpEeRlIdhPTK0exE2pLmWMkW6gQdGL6zukcm5EioFp0mw60U0zmlvUbDe6bpFEJRbZ3pofEibSQuJpiuC/7X5qyKbHSYne/3hIjFOgSGKrRMOm9X28r/IB60FAoyg6nLfDEj5enBcYAo9nlVVpnIKy1nBJ+endA+sAynu0PSpm7sMlZGmfDkVPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eV+XpwarriGng8GzGZfDSu8A7XSEWEhF80kkGdDtjA=;
 b=uGeAzLW1W3+Le9L7uzH95McMdUgcKVrjZRYY3hpwYIp8bSpn+/QTDGGp49oQ6lDexKFru/E5k07lrNLMIx2A6ZW1cg2Ih1LZuIrV3jQzBy6A8ogj7Jr9OSdviurJV9nI0D1a0cEmayWrlEdb5vekB/PIK4uTCiMkPT7LJixCYdM=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB13920.jpnprd01.prod.outlook.com (2603:1096:405:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 08:41:01 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 08:41:01 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 4/4] arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec support
Date: Fri, 19 Jun 2026 08:39:51 +0000
Message-Id: <20260619083951.3777556-5-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::20) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TY4PR01MB13920:EE_
X-MS-Office365-Filtering-Correlation-Id: b714420f-cf53-446d-80aa-08decdde7e00
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|18002099003|22082099003|3023799007|38350700014|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PAcz0zVFsKn+UaLN797/XrRtz+HmGgDmpcAnz1UTyRhLpQy6ivDbQYExISvQ1+7sSedTJnU9UnmQUzROZUZkcNlU4r8HlZF7YpNe6iyzT0B1w3uQUvhTx7yECmsW8e05ILkK3jBtMw8jid/wtShFeRM93aovz0grohk1JXTFyNPzMBJivWLcKvTFub2i2UpW8XfkGDSyODPT3QbfGDjLDuPfV9mLYExBy4cj6jb26RHqzqiI3mk10LOG9emZTIL/5kTBGmW3s4McTjE3yjivP6tuG/nOx89ccErHWksCGihnUmwwWKzHQLGbaotqeVzXne53CQE5DguT0n2JoEjHmP95WPzK2AFVAD+uZDyllhq4EKMU+AOd4uUiQUHNM0dKUDO6vDFcKsLfz97qT1P47o/KHjtJFJJ2Ig84BnU9s8tHFp3R28vx7FBgWJcoojxctOBKaTggaEjKuHAbB5F/OL6O6mfJ4W3/9xm9hDzsTCQqC3mKoPjiibOGJim5s69ak+g46jSjmnyBTPSzed3PlLJtSeKN6GmUzgezk2GOD2UxhIrbo8wFff6TIzrlWW8Cx00OLYi1XPeUdVjrybfRcWoGMmLKgNZEYxLmtM0wIIdMVYMMwi5qpmVm6mTHRloiXiaa791TzccFpkGt7jmlj8nWxVS2ZicKqGrNzmedi/kWCJL7dX3AAtSG05TXt4/ok8B60NMd9d/reUce/C1fK00pqYT382w+beLzW04y9iU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(18002099003)(22082099003)(3023799007)(38350700014)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GjLEo4xhdK1bO83gV5MZFlp1NHGS951fZBUlAm5VGnpblZwUGcsM6gXxI6Bp?=
 =?us-ascii?Q?FcO34UqVrtMZF/4GCVlKEZLjLXOijkkIBKFDKh7xW5GlocKBrGoao6NlxW5A?=
 =?us-ascii?Q?HvyzK84brLmCDgw0xujmOGT+cCQ5sr2XDZ6/AiDk36k4XbJR3A/aLKcdWKM6?=
 =?us-ascii?Q?zu47GXrX6gKv3GPZY3QOsdqqX1FqfCNCIiwHQf8uqpd5Lf1uXhJRWlCOcDwL?=
 =?us-ascii?Q?Pa0JXsIIOwhKBDjqIXMX6jrZgaqk1yho+xocS9fa89cXOynXr+kRL0LrjH1f?=
 =?us-ascii?Q?xCCJuoya0OJ7aPMv5GbbqNu6kJZ17dUZXi/zXUpppXboSWDQKukILE1T6e27?=
 =?us-ascii?Q?RWues6Act8mkLCXRtDwZDFxhqPGo8utmHc1rx5JirKHoClLzcyju9BatLUxt?=
 =?us-ascii?Q?7Zfj7Au/CeICMOYpsOEvDU3fHAr3mKO1lxwO0kgqtkLSX3HIa2JhiqRlx31J?=
 =?us-ascii?Q?bCqaVS9+wICfAaykh5cas1zUbH0JAZpyzfSnBOp9B6vvXmOfMbd0fOZY7VmV?=
 =?us-ascii?Q?cbGWZW0LjJm+hxSaGOyK2VJW6vFmcLKFQxdriaEXB8xY48Rl7OP5gWISKdJd?=
 =?us-ascii?Q?7Vwcr34oTdDObqKQvjSzbE8KmvoppN9sa2pwDz2sL+frRGmuOlb3l2QGkpe3?=
 =?us-ascii?Q?Fi4JkRTZeEbDKRwDPXgBjZysgZ/5OXTMBbHrT9VWfm2Wr7bdmAsgxQX3DTBB?=
 =?us-ascii?Q?/gg0TJblreiMDSN/llIk8mOE2T4nVqzhKfX307G/96iE9U1eP6neR8BlnhoJ?=
 =?us-ascii?Q?boUZLJILxiJfTp1vDtnf0fVtVI0mQimCXUrkerNZZO5pxpUXdM9NndaMT5aZ?=
 =?us-ascii?Q?EGZqdppIRGUa2gFIqagiw1itI2i1khnQewV4upR1TFxyFQup8ZIAfevlQqAP?=
 =?us-ascii?Q?mvJ7EjUEDBMmvNjWmMJQcAZKcK8SZx992UygPxlgkKL3175vECXD6f23tSe4?=
 =?us-ascii?Q?Tuvv4bmYbXkkVkidWBZBUwnzrzeTjV7C7hTS069fwlP97Kzm3cX64kgpHCki?=
 =?us-ascii?Q?lVfZVdGYpS/hzQG77eMyk/k59lNCcQ22Tnq7LSpU7x6RciNyezIXX8wg+Lfp?=
 =?us-ascii?Q?o+9ze+p59r/P1zAskz0+gJdu+U4E0a/BFuJk8pSYLU6SrLDuC/q3cgKO5GYh?=
 =?us-ascii?Q?kh4WGNCBp0RP1VKURHBr5exCfZsDqZxxqu+Rdd/jQG3yAbmqmcejIBokwcYF?=
 =?us-ascii?Q?FhwXFezvkDx6rNaRIO/3adqKAX06csE+Qb93CBEuAKuCbh02VPryaOGYDqGK?=
 =?us-ascii?Q?Q+HAVnFjLrTCcvUzB0DKKgyRy09qCVNfXblPF6Ugl2FcumcnJE8QLJHIcGSU?=
 =?us-ascii?Q?HSYFO2a6doQg+imY7uAIDM0kx3hRRg7MxtYJXbIOmUPku+NvXbS6AVdOZwOv?=
 =?us-ascii?Q?Ra0UoCQ5EdfsRJPJaiJ9Hgji3S2iMoWs9SGqAKYziY+ZL79F1yvJ+4nypDDV?=
 =?us-ascii?Q?vjIRASJ7CL2g7luPecIYJNX7GWP79GI2YUkAPtdScyEkHEOOLSpf/W7PdEUm?=
 =?us-ascii?Q?nMfRdrIJ13B3IWsO5FoKS0QMPeF0LdaWH051ZDJ7PecCegT7hqs3p07JX4z0?=
 =?us-ascii?Q?olj4cX7l5EFBPL+VgKADsAdl8R8f9ycrkG9jsnNLsLd99oS6A+SwLgqtVN6E?=
 =?us-ascii?Q?gXTG/2nQtXZRn/U5xmqlsCHpqAMDsrn4aZlJD1/AoVn2r1JG8XJOHLgpAauH?=
 =?us-ascii?Q?rX1Fkta5lh686W7yFT7QhN0twKjNhp/X2q42BbdNKPsjrLHpzwBZOlR0ec+A?=
 =?us-ascii?Q?2ZlJr44TQ71FfeR3GPhP0cUXS7agQbY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b714420f-cf53-446d-80aa-08decdde7e00
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 08:41:01.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EdU5xguJ5FjLM4XeHKVc5u2d9chlSXZOBFhqp3QBbd2nOwqLIWSTQB09DbB8zCAQSSiQbtIujWIPXsrzKOKpLC5oisdSBNNo5PiZGr+FJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13920
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-34235-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D98F6A4AE5

RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
sound input/output using SSI3/SSI4 where:

 - The codec receives its master clock from the Versa3 clock
   generator present on the SoM
 - SSI4 shares clock pins with SSI3 to provide a separate data
   line for full-duplex audio capture.

Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes.
v5:
 - Drop the unnecessary #address-cells / #size-cells from the
   codec@1a node; the port child has no unit address or reg, and the
   da7212 binding sets unevaluatedProperties: false.

 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 6372f582a7c4..ac525b73c1bb 100644
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
@@ -99,6 +146,35 @@ &i2c0 {
 	pinctrl-names = "default";
 };
 
+&i2c1 {
+	da7212: codec@1a {
+		compatible = "dlg,da7212";
+		#sound-dai-cells = <0>;
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
@@ -280,6 +356,42 @@ &sdhi1 {
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



Return-Path: <linux-renesas-soc+bounces-33795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H50bAJIXKWrwQQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:51:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5D666C91
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:51:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=qIDQ52DI;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 688D63067172
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDA425DB1A;
	Wed, 10 Jun 2026 07:47:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17E40D579;
	Wed, 10 Jun 2026 07:47:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077655; cv=fail; b=V8dfUts3Rg/5JgnsSRhXdP8j0thr+A5Y7hltv2eZhYBxL6l/x6IQREnSrXPfbR0/9z4BV08ZbpNcmEF4UKD5jFW3WRvslKy+ZtGr9GE8v94hAfLuqc3NWyvt9FKIU6vGZ2ptAKTEIgiS2AjUtx3YkzYdk/b5YNv8NpHP/Oqvj3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077655; c=relaxed/simple;
	bh=pW5FjNfF/YDVbZhZTZZUuVXJHfJb65gktU+us2fcjYM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GilRLoTmzXlbzpfcktnVj9BrTiL+4emBFcyBRFJJpo2UpvttyTtkBVU64WbyMNRmqydPeAW4jirTYSy0a7VHmnJOWsVP7+hkeBq5NYPaOQVhz+Z0HL09uWOdeZwJ/k4Hpy8JG7HB1BrlevkULeYuX2LM0FIJ9rnD6quHfjGzD6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qIDQ52DI; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBO15/vjh0TOnjaUsJILNyC6VUblbdp2dliUyEXTaWebAGMuWTRQUTZu8cKXMA2eZp6yEOeZzdjHiBK/RJtS4AomGrmQ6Go8WFtWwXOaRoaceMN89xdpH5rBMNV2quJj7/ie4gj8C8ke31DUtThLi+yJdEV8wrD6/1vbhwgZFZ4RZryCCigTh1MseKEWx0FJR8fD/X6FsZ3gw4WFkYQTnwBP456rEQxvki9tPRLoofrpQlJPLsUnRSprEtuNk4F2pvPh1GIaZFATRdwIeiecCU8ayzSnuPmthsSB8q7TrATFW/vuVIlfjjluBUO+YaiuNrNxPhrM5y7tpC6D/xh3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naDeiy1VUci8vWLlrJoUgx/GIfdCYVW+d1q2MfUQ4vc=;
 b=xQkPde/4+naWFzBA6WNs/W49MU+Z4xNo4Cw4AH9QB7iplK2AuIW/kL8q8GLssVqkvqCgmIsdefIBTwKCCJx4aKHv+w5b0G8DoS2KG0EphnQTp1A/y3/krVbDncF+LHniyim2QiLW7CUQbsZjeQ4RrRTZuHX/b505lBmwT+sHNgWIzfeVWrhTT5lzEx+4l0XazyVI5rSp6uGeKogRwqPyAoy+cOE9lUN1Vf4tCWnXUOvZtO1vlGk9On22muB2QKPRdIoZp1AjyU90r2oSMKxHrR/8rUf4KOcXBY1Ces0Xn0s+rwuYkGxVWFFS5UQ9s3ZlzgS4G8WydTONeX19LUGfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naDeiy1VUci8vWLlrJoUgx/GIfdCYVW+d1q2MfUQ4vc=;
 b=qIDQ52DIvmOaVfd9gMyrzvcXaJfnvg1IAUekGEr4EmqRXglnn4sF9kf0YsizZq7GHUNkHrzliXef2jNrkFxuuQ8ek5nXyLTnvIvE7d7OtM8JrJJxp/CfQd/UcK9ys1OVPKZPf+E9mevnpp4OPdd3usAr3qA3vNnJAhYnemiArmU=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS7PR01MB13812.jpnprd01.prod.outlook.com (2603:1096:604:368::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:47:29 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 07:47:29 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 0/4] [PATCH v5 0/4] arm64: dts: renesas: Add RZ/G3E audio enablement
Date: Wed, 10 Jun 2026 07:46:58 +0000
Message-Id: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS7PR01MB13812:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3c2b61-5b1e-4701-6350-08dec6c485a9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|38350700014|11063799006|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	xdW5V47u3xHG6sa8o8f657GF6+/br4SEaUgO6gQMrH1o1N6FT6MfCBfrqFzDJ6VPY6qR3555BTJ7NnHLzLmDttnShcNmr3LHBL56jO82H5BbNjS0RfQo89MSgfK1C9+ONqRbRRkboSn6eNSUpa2/yM/RpUYHCunz/zMWmT8kDjUNhHZAaOTveGOvX6pr2Mjb/b62zjiuUn086CMQ5kBOWVGtNTcTqvaBxanwFH/9ilwrpYwPrTxhssuB9eGVppUCprPskr9y0l2U1JnCnQ+tjwD6ICKSxpQw1dTvMFZYSDBy7VM3imXPCt80xt87tWqlGbqcUKEOwdc0R3wYL7SY2cmFAVwcJj0Kd8CIWjvLrbNgrUfD08e2RRv9zk98nQ1rCdvWxjc1adb9QaQ5aSHH0vCudaI59FY35yMZqOTDGU6H1PoAvCaBpMmsCOxFFC8bIySSpqTlRPADl+TUI+yV2FcFfzRGAd97+hNlQcYdSJHdUcw/XdCz6qELVvJZJrKk6qvnAimwTNBEWjzO5UyT+fGoL9Xmcnd0J8cgproxjgfujp91aTKthuul3LRQgKc/Ryg/4qvCOHCnEMf8cBabGCRqpVhjcPwPqGF6v5T4vfV6QJUNXMs9YattpzMbQxw+ZFi6owwF8/ipxCacHib8JAr9XoFug5KkGGph7pijXwyuDvQTfRmRmxsARiwsMuEyVC+fYCAZ6mkPZ7e9W7yyOsJnvtMKBXx3HqRB6DW6sHhTShsmEcbtoS4Kte4IxA4T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(38350700014)(11063799006)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6OJ42aMIH7f+AzvDeOwBc0Q5LgJZvvW33QvfhF/0ZdNyLzpK9gsfiwKYJJ6P?=
 =?us-ascii?Q?RzQDB293YnblpTFoAAiQv5eCjaIN6WnCMx2ozsNx8ZKk9QeVi+Bmr0fVuQg+?=
 =?us-ascii?Q?FQ60QbaaSZfGiOty/G6Q/0apDOcDyELImq8jWF+hwBp9sshIQ3fD008VqTFK?=
 =?us-ascii?Q?seL2jkOQC8lfYE+hu9/QSU9g3lRyV3It4fowWT/GTDOKxZLelbiIIVt5Nc60?=
 =?us-ascii?Q?O+BYuiu+thn4up2YN2DIxZ+tH4AZP3KAnQWqG27sHfdoXUfKb942xjAfDMh8?=
 =?us-ascii?Q?JidWuBpFUhH5wCWWcEFbSOSDkgRouURY3i8SsU3lwMOdSR7IJzV4ky5+MGmi?=
 =?us-ascii?Q?KsLP0x3WZMoazplp4Jk6vX9jck81PhoHHFD1R5LJTeOXTuCqf9dFzsF6t8o6?=
 =?us-ascii?Q?iOtFFKsmv/WUKf2Mee2+eh9KU+WN0YJCe76SNAYATKt9pD5unsyQ6J5JaZei?=
 =?us-ascii?Q?oN+SGkR0Pkufyno4hSujHO5qKSUz2AGZw25ygDafk5Yflz5GtrhQlGZYRhKM?=
 =?us-ascii?Q?wCzxeJ8AEXZ3vXSShnQ3z4zwHR/0aTa2cOqmoYwcX5IQFtiPMuGi1ALoiO3O?=
 =?us-ascii?Q?j2n+h9YLIr0QdeMDUS2s05d1VZlebaLSYqD63L0x0p0JpjE7TFxEOIEBFc3d?=
 =?us-ascii?Q?aQBdEnFPDsUA0wl/NnMU7BAEGPWtjrZq8fP+JqoICzqawPNEPErDD/BTThwN?=
 =?us-ascii?Q?cJKSniuO3oMExDIlE3jlNFLQZQp+pUz5gGWlSmya7SvzfauQl9LsnX0qcXLs?=
 =?us-ascii?Q?GbYAwkNcUYwYwFIKzY+mPk4G7pe8ivdRkCcNXPMYq80gD46gFOB47fOSLWMA?=
 =?us-ascii?Q?dxOq3bZc/ZrOMrZXAz07DxUQmYOh/XqOb4w42RQYmTK5b98zK1AXl0ddhPRq?=
 =?us-ascii?Q?rOaZEylfe32020hHi3RsJonCb6cTk3OpiWAqgt68Houq2p5w40o1qONzVWxw?=
 =?us-ascii?Q?HGU0NApxj9p5DY7UUI6UZkf+hvvw1HtrjqZgBN3q2cu+18NcqKtyrrydV4xJ?=
 =?us-ascii?Q?h8+V2nWL8m5HLo8884gKjiLI5jwgNROlYAwdTeNgt7LZXNKR9QbN1gwDISZ7?=
 =?us-ascii?Q?17PR9R0lQGVkFtRiH19MIidhqApRxcV5kwRTVqzeQ8I+mlgDwAvGH4/RmLxP?=
 =?us-ascii?Q?WoaNdoOQSqnHhFIwoet1b1+UUkgY9euvomovrDbK5VhtKVrOxh9kAhFqkxCN?=
 =?us-ascii?Q?MMhYlcD5lX4sE38ImJl7Mib/eZzalqodAQLFpzlx/ekSNmeDZpT+ZDhsmQkm?=
 =?us-ascii?Q?ls68WO+clJoWFM4iI+niQ000m0neEoow1UwbeBGd85+np2XSZ4flKcRuWCLJ?=
 =?us-ascii?Q?F14qh1VhJboDPWIMaEp2CILzqxUrATpJRJmx56t7wEz9kXHhBOUVSq+5opO5?=
 =?us-ascii?Q?68ZoIA7awm+xWhq5v+YLsxGXObPtmwc2YkrAwF2dO9D33jHiKtpQ8Ss36VFJ?=
 =?us-ascii?Q?fNFwjbliHCdZ1uFMwvBHBWQy1Uc659lSXlFhOXpmx/NAW6ZgJlE0+IcLDlfp?=
 =?us-ascii?Q?VHtjChuEhzlHtOzBKGlzScLYCioJVdYeUElp1nsVI/w1uWNPoknFSIPIiIxh?=
 =?us-ascii?Q?fgYE3AZzp/epfv284hpJXv1pJIN4BRGIQVyMZbooIlu5YaRO/FoU5F6NTBnk?=
 =?us-ascii?Q?VZ64b+0zElW7HnS8rLSf9XGZ48sIgLi4mSuwe1KtMoV5G/ZJbfU2DkZ84b1V?=
 =?us-ascii?Q?N5DCawdZxfQvrT3C/wfJrWdG75MZkhLJ02EC7k1N3/dTj85i1ugDhoHCfwVi?=
 =?us-ascii?Q?AZDZMQHpZGc+Mc0UPeanL+5TbjG3zcM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3c2b61-5b1e-4701-6350-08dec6c485a9
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:47:29.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ojU209zcbizFATCN6U7ssQAD/+ut1SbRwiq76VtpX1gK6wn7SNSTOVuOFuqVM2f9+d64Nbk0WUbgycH8en/8n8Xlx6PLhpt17fK7Ua9FXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33795-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FD5D666C91

This is the remainder of the RZ/G3E audio enablement series. In v4, Geert
queued the clock and clock-input groundwork for v7.3, so it is not resent
here:

  - dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
    -> renesas-clk
  - clk: renesas: r9a09g047: Add audio clock and reset support
    -> renesas-clk
  - arm64: dts: renesas: rzv2h: Add audio clock inputs
    -> renesas-devel
  - arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
    -> renesas-devel

This v5 carries only the four patches that were reviewed but not queued.
The sound node in 1/4 references the audio module clocks and resets added
by the queued clk patches, so this series depends on the renesas-clk queue
and is based on renesas-devel for v7.3.

Changes:

v5:
 - Resend only the four patches not queued for v7.3 (the four above are
   dropped from the series).
 - Sound node: hexadecimal module clock/reset numbers, lowercase 0x1f000
   SSI size, SCU reg extended to 0x20000 to cover the SCU DMAC, per-line
   clock/reset comments dropped.
 - Versa3: drop the unconnected DIFF2 output, document DIFF1/Ethernet.
 - Pinmux: hyphenate node names, sort entries by GPIO number.
 - Codec: drop the unnecessary #address-cells/#size-cells on codec@1a
   (sashiko-bot); add Geert's Reviewed-by.

v4:
 - Link to v4 at [1]
 - Sound node: dotted clock/reset names moved to hyphenated form, legacy
   rcar_sound,* sub-nodes renamed to unprefixed ctu/dvc/mix/src/ssi/ssiu,
   clocks/resets reordered ascending, explanatory comment blocks dropped,
   dmas continuation lines aligned, commit message corrected (snd_rzg3e).
 - Versa3, pinmux, codec: no changes.

v3:
 - Sound node: commit description typo fix.
 - Versa3, pinmux, codec: no changes.

v2:
 - Sound node: drop the 2-cells specifier on the audio DMA assignment and
   stop updating DMAC #dma-cells.
 - Versa3, pinmux, codec: no changes.

[1] https://lore.kernel.org/r/20260525110603.4018170-1-john.madieu.xa@bp.renesas.com

John Madieu (4):
  arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
  arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
  arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
  arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec
    support

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 462 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 114 +++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  32 ++
 3 files changed, 608 insertions(+)

-- 
2.25.1



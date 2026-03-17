Return-Path: <linux-renesas-soc+bounces-29536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAmxA3kBuWkxnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:23:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 146442A4B90
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE0DD300E4A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F07738C433;
	Tue, 17 Mar 2026 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="k0k9y3wD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011057.outbound.protection.outlook.com [52.101.70.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51003815E7;
	Tue, 17 Mar 2026 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732210; cv=fail; b=tBCUHAj8ZCSb5zGhvDrb3TRAS73GghOLBKSBD6Z7nDuhOqWafkWe+8c0qpv96VvqOtAklC38APrOsxpazuzTTyEyyvQD62SZh3clIKXi/fCmqc03qWfl48VxE3W9TztJKwlQ2ljB0a57ERoBnuncfLvW4bOXuH9a6cF+Q17V6ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732210; c=relaxed/simple;
	bh=XBB61CGd6BU2k14yiNyfesvH7iRsGKWUTsGQiW1Y8Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O95V5cm5LfiGX+em0VdDcoMPg6JBx64Wl6s9Ynp4LnjcesdQwlOJCS4+yMWGtY3ZJgh5b1W2i63DYoz2MYDUnuBrSTpQ7zQfwb03gwoEPz9dwKWWd7VlnAP8SPIz5qGXuvtF8Q7aWeageOF9T7kXmrMtA7DfWDpzFjxgFbGF/Qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=k0k9y3wD; arc=fail smtp.client-ip=52.101.70.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZIyIyfPhRMrY9h0jEocUI7x34MUIcjpwdvE03B9lpRkUga35e35VnMPA7MJ58C4RmRfPUhTkBokjiYJG5GUJTxbLEHp4mlZb3GwSct82vwvhETMdFZe3euCbZhIcoMHwMaJupaxvhJDm5G+2lDxIhrn1sGlz6r0Yr6WDk5tJcIYKvQWwQx1wyEPTXgva3vIoRM15/rFp+/CXTl7oDaGxAyNCfvyvw0XsffQc/zgs+1uGafYTlCD64lccVra++f8bob7KBnN/BLPxs5rLs2tmnvld7lBrORU9r8BeYMVoRUIUziJXoh/eWzhVf/BHof/V0CkmA2HFW+hnvr8+MHsB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZLPLNDlo80VXp1ghSVP6zc0i73sBy+jzZBBUxabyX0=;
 b=Tx92j5o1Y3AlDK3CC99DignCxoN+XVEUfaSz/v/n6QNYIn5Zv1BVZW2Az/i6qUhpMECiqD/QF7Hhf2JjliMy9ciyS9BsnFPdkyzESXLDOAElRlqbZmKRhiumTJx8G/h1y1KElMSdBlAItC4nQVcVdh7vCV94A+JiTzS27677BXvTMZefSb0szfTXXnaImH5RgsKocS/trzdf2tAHyjb4GNCPk2rFe35Rz0o9X+mNziiuIuKeEMhPgrcKg5xQN9MJmRMQh3BfEtBxmSAvdtaNSwYCv4lTgCsqfoEPzNFJbjhvZ53eibFY5r97QysH4bZoOaPxQbJbG/uWCb2nvEvVmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZLPLNDlo80VXp1ghSVP6zc0i73sBy+jzZBBUxabyX0=;
 b=k0k9y3wDs8hP5o0hn5bzO014eF2gU1kaEQkyXF35MaOa1wnLPlI1MY9Inu3T6MRdAo2jwvP/7AigicCeG9wxy8fdZfNwVssJJoMtKCqfA8bcuwmKn3ZOYftsluRPUs0bqbVT9pTXdoEpZPbytESkfgW9c+bmPK0nWR0OQ1NSwTKM6w6ctTICLkCKu5YBZLcEV4/a02ZbiEG4J4mB1ctgeA+zOG1q1ZaBvVwNVVwVAZQ21e3zREoBnlGFTQEvBbI3OVjg/oXBjCHiGPfLm/oJ0HCxUu2GjKr3dtW0l9aadrnz0P2W8aTtYHrcHEekbg/WenUOTGXZ/TY/VMhEiYeN3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA1PR04MB11262.eurprd04.prod.outlook.com (2603:10a6:102:4eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 07:23:15 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:22:53 +0000
Date: Tue, 17 Mar 2026 15:25:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Support loop control in quirk code
 snippets
Message-ID: <abkB6tnWzxw1AdxH@shlinux89>
References: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be>
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PA1PR04MB11262:EE_
X-MS-Office365-Filtering-Correlation-Id: a9541e37-629d-4dc5-0d15-08de83f60089
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|38350700014|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	0RfgQc7reOCFT0z7gbYqCu24MGqU1o1BLrjrSBG2WuVaLbeh2NDoMupryIar/jTS2RkW/vzQOOmqZFCvJRnTlV3dHNk6V7SlViinuGm58w589b0s1cE7bwvI5Jy+Qwbmxhg1CeRJ3yH6TeI1M9BSAs0yL5vjTSRmjsck+Zy6He3Ne0n6oTcY1/L4n1n19CJF05RHxWb0rVB2LANdkCDrR70jGA+XatjXRSyFJfFrRKj/9z+pNt2QA4s44f9Yojq0qWZMqYYsnjMAioi0P0bGBfIlNpaQf52m/p/3/2nyGF9zLhgnATl+ZcnGr07ArLpeq64sQauZ6K42LFS0lBR239tX875yuXXssavuXgdEOSzCt+9/gXNpRCeGDwYiVWPyuaJm47pqOMRN9uMRXlqpthBS3rPS1R2TIA6BI9BRgjaPCHNpUYVSyW4D4NdGvY4K6C8m3gsCFBAVugg3MzTbqDS9u8ALNOlIev6b0I+uyH1e05ZjE6EI+FwNxKBQvddi2N74VvnEpC6S6LjTQeJNZ0P9BKKeVLrK9bYiP7MtAPF74SkSMfDG1gyY/TRvrWMNjtjo+i7CZUoj7KhTmqKvskRPvqBdGMzIb0yX1H7yaHVS4RcanishzjKkKH/2JH7zyqLM3xiXbwHSi3Azf3ponR69ajn/KttY2NspFurlz3x9F7jqVT4jHd15uFGrwHL1PTSb9erCZMxLgOfP8volhBReMI8o5Mq4U1dzeHCDsnlHfUY141PwTmAW0XM2SQWgLqKDdNNVof/7J+Z/nLCzWgpF4vF9i5PwtTQZe6A84pY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N5Meh65larkaDAj4uoC4euM7Yo7jP45fJekc3w7i0NSycPVlhiP7ZoOv4WOI?=
 =?us-ascii?Q?LY9y5sWyCbOa150RMyB/0vHJ7a+6AwVcR1ehTUYVdHT4kfg6GwSoBTQt4mfX?=
 =?us-ascii?Q?U+Ikmcuf0ht4sWUXXMxNfTmKI4Qm3WmI+5CcG3xF6hjqBRkgkQeph3e8hDJm?=
 =?us-ascii?Q?lbjxAxpbKfVbK40Vu2vALwozZQTawUGtoW/a1FZmfDp5JnwvUpeVSqDtbETQ?=
 =?us-ascii?Q?DdpXDMJke7EJ2msKErrPi4p2pK7qL3SRhdaAQjzFrtG8FKFhRgdWGfYilDuP?=
 =?us-ascii?Q?hvWz9ZAU+UXf2VDHVueGb3JMHlFgsHrDC7SsrBTdXd5i6SuZg+8zEcfbNGch?=
 =?us-ascii?Q?2+DohWKrLJDXtgbrzIvilgfTp29cOoMXRdP4kUGYua7BiAvQbir3OofCTql5?=
 =?us-ascii?Q?KX+0MCK4vuvufUZ4+1lH4mSJ8EQG0CTuLw9/3J6PKJAHLQTHpAdOPaoxsKiU?=
 =?us-ascii?Q?9ZeltCk1r1+VzAgwEQLKt2DOSPrH3PsZ9oVgDMw3pKFAtxlA0OhVV5HNbWex?=
 =?us-ascii?Q?AKE2bMmNoiecsZxHVXnl5kEDYynqUnZ18t4rURyZ+U1Z3LCrbWeA1aZdGAD4?=
 =?us-ascii?Q?PBW+EYSNdDI+IlO1lSbspFFKb33kgTDBN0/qs+yRcRKY/kXOgJUP/JTDKcZO?=
 =?us-ascii?Q?z8yX7keAZ/xsaVhAErvE9atR1LmLJ1rZNrwGWmNvqb9I5pRnh8Oz9EbNoIVm?=
 =?us-ascii?Q?d8fUxMhtR0wwHn9AekKSoimZIRZp9Rq3KjAGajWpe9VXR/Blbrf4loPXbv7d?=
 =?us-ascii?Q?kqlxuJLdgyeSa1IWac1lA06BEOg5ceApb6prD8gm+NRgilRRROkoucQjKNfb?=
 =?us-ascii?Q?jabzU5YTmxvkOxvud8s6pYbe4UISoSRoyGsmObkaFoXc8+FWTMYBcRd9TJSP?=
 =?us-ascii?Q?72QL4BU1wnYimWAmGgjpL9DKP3QnE0Fz407xn2Q3Oy7SkyaXMaknnl6QyzAC?=
 =?us-ascii?Q?jWR7QQNc4I7fkf40sRA3HvbicxXAnf3QuKlHtgbegJF9zkDWNpkM883KDObd?=
 =?us-ascii?Q?BS5IDEykP/q9txwVKfuyyC6RcxXAy2Xw/qwE1lhaOve72mNL1RI/Qw6jSfup?=
 =?us-ascii?Q?aAk6ljSP1lxIW3BRTSUywRnZ7Z7eKqVNzVqVgSvBl6dJkd5nqXlnNhcByKn+?=
 =?us-ascii?Q?4X3eYcvOpKmsZftk7UJMsOFQCmV6xFBcx8dogXDpNLMDKpR/3o/aAnSSOyGs?=
 =?us-ascii?Q?X050pTeEbzVXZM08Qnz4pAUCsYxol56T+aH/PRZ4+Srah+g+BJXxWnE4jHFa?=
 =?us-ascii?Q?JLm7SX2hDC+pMrbtZqmJeOQxoE32cK0rMietp/R2XqHajvS0e7RUv34ugARv?=
 =?us-ascii?Q?3+BETJlBmw/t2+AzvxBZwNmFeACSqahzpFjIQeSEvilvfH8m34HltwzDZpRU?=
 =?us-ascii?Q?XWW/xdtgVICrfGFnTmtw1P6fSaRl0JCzZzp5V2yYamIFJWUwEwmb9EZ3B5tX?=
 =?us-ascii?Q?ZI2WVswwMT+Y0zrCD3IAzPfKcidJAGkt4Ey0y1qQOBdCdjo8r7F0IcEUDZdt?=
 =?us-ascii?Q?5QCx4UW/s7fUZk2iszVmE+MPfPdEhJuDhTU/QxYfz3kVitf3wFOR5Xx1pEa6?=
 =?us-ascii?Q?WAVbCthFfnSNn4tBzuXBSJTogFmJHjdLlAm2JR43xjoX+F8mZoJe5iICT+hI?=
 =?us-ascii?Q?2j38Yy4F8VUhutvohw6IUAJ/oM/9gtJJSJQghPlZykhAsFSGzsbo7hhi+5Vs?=
 =?us-ascii?Q?GZS5Td4tlsuShu/VdPvknn72nW8AKSap6qlQRu72vC77vLZ1mJRvFkVlXgUU?=
 =?us-ascii?Q?CwkoSIPEig=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9541e37-629d-4dc5-0d15-08de83f60089
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:22:53.3284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMdwjMEyfYaZu8+M+eYciyZmYjl0QQ82q6zdmKpnhLowg0l5y3LoLkk3mLFkXOZur+XLk7mCIOkUrGnTT8XF1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11262
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29536-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 146442A4B90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 04:34:40PM +0100, Geert Uytterhoeven wrote:
>Each SCMI firmware quirk contains a code snippet, which handles the
>quirk, and has full access to the surrounding context.  When this
>context is (part of) a loop body, the code snippet may want to use loop
>control statements like "break" and "continue".  Unfortunately the
>SCMI_QUIRK() macro implementation contains a dummy loop, taking
>precedence over any outer loops.  Hence quirk code cannot use loop
>control statements, but has to resort to polluting the surrounding
>context with a label, and use goto.
>
>Fix this by replacing the "do { ... } while (0)" construct in the
>SCMI_QUIRK() implementation by "({ ... })".
>
>Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Peng Fan <peng.fan@nxp.com>


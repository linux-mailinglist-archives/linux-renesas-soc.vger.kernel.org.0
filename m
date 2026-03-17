Return-Path: <linux-renesas-soc+bounces-29540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKPpNNoDuWmEnAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:33:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 969CD2A4DCB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10A8D301EF03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 07:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF792390996;
	Tue, 17 Mar 2026 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OvUAtbIW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F40390213;
	Tue, 17 Mar 2026 07:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773732815; cv=fail; b=Zg7UfAjshDCPUyHVIaZ6o8PvWnR2BO714pEPDBwKBlqjzKFRqQNp76cMFAX2a8rT/3WDRhWFpCqFj3KtmAFAx+lhWaDpIJLW4LqB1SQ+fXgjS+B6iTY095NvTYcauHDRL35a9pkc4PZN2deLhYjpWZLYfHlfbqhHLg6BVY3imfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773732815; c=relaxed/simple;
	bh=DF6dL1WmLCNGepajUwyGs+QlXVris6xfrFc1G2ubN5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z8hRoRW7E7LftD6cde2r3n45G5gp0DR6fcB85xewPpM0dDXDME4cyspI1hyy8o7tP35YUaW+T3o+sAGu8nK3H9nirQzd4wOH84L3VdyJ2BPfuu8CcaIjId6X1KBZyewHp3UBf1CBqd/R4FioOu7qj+v3h063s+KDCrzH6fG/lwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OvUAtbIW; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNVdbBJkN8d0Gt+25hsLjWXUtK4D/X3L3T6jk74Dav83GPyorOWBR6Af3dJ5yGBpXI2CBIzYsHaMuAy3sxsKxsigpkyrWnVuPO1WHIRvBVE0kY9IqNlbxkDyLX+XYhiMNk1VrE1dAxbgf8wIHCchXi2gsNFa6LAUULfKLgcDpIW95EhCqZImhSgBmu4KK/XuPERZfAMcAvEDZEgXM2jFgP9BrXQGoy+5h944VbJ5QrIJ4lT/dL80KSz8PZH63PaAvsOHSwALzERW/Mf+LizlNieSnHz/GODugRpVS2MPkaagmcXrRvgSDL9K2VHj8ZSGrtcNX+mqw/gohBUlhJPpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DF6dL1WmLCNGepajUwyGs+QlXVris6xfrFc1G2ubN5Y=;
 b=wi/v+ZUeUw9qMscsYIcEuIap5nunwzrm0o9ogucgMbUX7ikCncfso2VVi99AxwWmLCaPIvI6HpUDPUxGoCaFhF+e4WIE1g4UFbYV+713iILu7Qsg64rSdTy8OAGmI4kw8hdKYDral1hHZl7xtrAoLKda4gZiHx5ZikZ1tDXtlitrg903JcJck+pI4juNYc5Ystax76REKOqo46ohiL0mnnGFSEYdXGK8xCH5nZ8mg9Zs2114MaMw/7qjrR1NOLR/F+lBllQ5DSoc+b43ZjinDNDn4wFiVxwSPgZ6l4G+l+kTfe8vlPRTtIxfRXYfUQJDqHcZ1dJFKEQl2OAnqEcttA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DF6dL1WmLCNGepajUwyGs+QlXVris6xfrFc1G2ubN5Y=;
 b=OvUAtbIW9Ctptlt2ui07/n+67llDQgEf/6FO3i/qmJC1EffFUBSrYHeMW0pv1Tv3RCAn+yCXFPGFCH/CwPWR0wPHeNYl43KiqVOgjq1pa1M08bf/p/84E2NmRg9nqJpGpxMufstpXtFyYJ9B6kmAT8Mousek8UNwJ6wqpPS2UAiioDNk5mmywfdvlOEMGOaEFGNVytw0fvv+vH0G8V7n7jzv6w8Tdx7aV6cqitjF5uuanuFnJYnWekLD4oh09Xr9CLg4sWCVv1xLxFU38btxlYpoEBE77i2wHg49d/qK9qJtpuHDSAKTbvV2CCY/+tPw0MBkOBTuGQ0mdu8Fhwqdyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVUPR04MB12169.eurprd04.prod.outlook.com (2603:10a6:150:33e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 07:33:29 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::21f6:947a:1f40:18af%4]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 07:32:59 +0000
Date: Tue, 17 Mar 2026 15:35:36 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 10/13] firmware: arm_scmi: Refactor iterators internal
 allocation
Message-ID: <abkESGNemZ82L2bD@shlinux89>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-11-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310184030.3669330-11-cristian.marussi@arm.com>
X-ClientProxiedBy: SI2PR01CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::21) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVUPR04MB12169:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc48ead-6dcc-4fb1-9b33-08de83f76a36
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|38350700014|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	FrTtWxW17S5ghMrf7ScnZTCKIvtqjWs+kUq+G4gV0Y6OU6ycullOEj7UoGdT6XIX/coC7jY+qh8HV9XabcNamPbETa9pNUJZbQ7TtsRrnKh/LAqGK2r375XphMXCNNl9jbdjW1FzJZcUKWaZxjJ9Vs8KFbhypd6UqBpNNUhXbE3nJt4m7ekbIfmcxcFujIjsvVX769Aoj0MnV51VgL6FqJr0H8+h088LeLf0ivUM7NwSN2fGui9nrHk/QC2LwarqT/0wgx3BA1TMcmsFoB4Ujpx4kyBfgTW8ydte1tK60BpOWSx9BOeL7JqqP/ZkKxw8eG9MdGvmI8FS3XnA57AqApFjCsJcL8A94CL1ewXNtq94DmI4n1ob5omvreXXua1tcf1m+0SSZkXEZiuezGle2Yh7J5qGvcyPGWPdYfUA414OWjxyJv3Ar1MO9DPUtbFwrfcciDEbRLR4dFK37zQ209OkYMRcsxbyX25nu13Ko1AuA40BbMW5+bqx4plwPy4iyVCWi/c2NT2yqw9C+HwDtUM8ve/cH911RmKDF7YB6BO8inx3KsmPeBxqieFULY+gphsou0HU1NfrX5Z5fZZsW7gruHy4mc5m+y90kJM1luFCJtEBGPbBJDrXQSWN5nJ7MAamzEy09D2XqTgZz6yb5xi3UGC5c+DWLCEMthRkfepuhjRhxKU9SQ0fFMD0F6KbZriBOZke2GJUaEFp2/dFYqyjU7VfEFJd09sufSw/qpcGP7s1RWf+5x6cqlUZm2s/DYl18LAuB+YjpYk9G7ZErwxYgqpFQB21DuyOwV2o63I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(38350700014)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KQBJ4ha7H+vMPzLyEvtZzqIV+y6JKcE1BaXJemDCCXybl4pXDf3suHYkcznF?=
 =?us-ascii?Q?8vXWT6wvagH8XApQHUQZvUG/C4yYG7eBGXElYmb6BOXdVI7JTKfm/BNufRkp?=
 =?us-ascii?Q?4etcWyr+r9RLTDXiTq0w1xkRbrl6jrZlYOauP5CntO5Kuuxkq0nonSd+Tn8g?=
 =?us-ascii?Q?oogKuSsyoFcHrwgguvP/DmCQleHVXF1QIkL061/kbEl4hMZzlpCm3uFxlLEg?=
 =?us-ascii?Q?hNxwqN2EJcaqMeiPjgTSUh04YMJ19+6BCoKvK878ZC6YbKs75NJpvtbWF0Zk?=
 =?us-ascii?Q?7r7UDtZPWxT4lBhmo5S4jvWh1x8d2fh1CMwJ3LmGT4mD+WsAi0qeags6JDrm?=
 =?us-ascii?Q?z0cB7yV1s0eo6MqOf1DWove2YeOfeHrQ2xr0uS9kvrhcpTDeFVHtYr95zHBK?=
 =?us-ascii?Q?fkqSWFxSlur2czyxZWkYbbskWj2VhKtEc3o5KCuPJfyJCc4Y2V4ph/9no1oq?=
 =?us-ascii?Q?PxMUcFSRQ845NH6a3Y+D68PZuUAC6pqA6LINDe8jn1fNCK7TuFUrOegk0zJT?=
 =?us-ascii?Q?oomOj530MOS+PrTITBV/GRzVhU2A3k4TNF0/L/1CclEun8g8ABUhaQzz2eB1?=
 =?us-ascii?Q?Kg6ZyyYTMY7Z4ckjzB6WsxpMwPaoMGwDHSFLeDcCMZeJbeDRHVk75CDMKUNU?=
 =?us-ascii?Q?Kg821gmKvCRKea6+lFdxHn8o71d/OfftNTdjHBxiQm8L5e8jvfP222ffo63t?=
 =?us-ascii?Q?hX5ceY1Du1JlvtpwyJrAMIom58bDzG1UgDcLLCP/5JXVIaHKn/wxtncXRdWZ?=
 =?us-ascii?Q?Zz9I6wmd08qAF+jPGveWd4ib01IN2VjPpVLDu6eFT9DqkDYw2oupW/VzaqxJ?=
 =?us-ascii?Q?Y6nMhHjCXVWTzh4Ufd6gV9I8N1FckaQe7QxuIT3xt0s8uBs6f7FNxjC4M9JD?=
 =?us-ascii?Q?Tox9s+GaD4sBtVUsz8VHQIPR7UDVlSOl9RKd8PDt/a/lnO1IG3OmozQsKBQu?=
 =?us-ascii?Q?Xdk0c6KFV5xE+b3bW3Cu7Z23ZIikGlYr87NOsNqKNBgP+nHuiRqYPTQjXrcP?=
 =?us-ascii?Q?QX+pikGCycY5X7Gw0U9YO7kpQ8WVXiDd7JLwWFgs0fw5332Ssdi3ucwfI/sZ?=
 =?us-ascii?Q?Hto9hnpSlg41leKqmpm5rADKIX3GlM9LX2csF5xdVMOElvsR8osrWsXInd/r?=
 =?us-ascii?Q?sljCR4BqXANef4INZ7hGzgesO+Fzjh3YnEUCynkvMwyUSm2yR+DBsuf6zaSj?=
 =?us-ascii?Q?bRe446+4xgWiL3Nb3/HurEcYTqlwLZ1kBIqHIK4gIJ79HaNJgbPheKLpVu7D?=
 =?us-ascii?Q?glT8ZdeVCOmN5giTiSv/6UBYipcVJEGJOLNCY4LTcL98uNXuWMzkMJ8Pp7tC?=
 =?us-ascii?Q?kKfCizpDNjxjut4ElHC+6ic+gEb27fcBDB6PNO+nFwdeEDjBEc/ba/0G+JMd?=
 =?us-ascii?Q?4ViemuCxBkXWEhlFy6F6WdGJsPjIDL38Bhk+txr9XMsV2hJ54rMruoPFQ6ix?=
 =?us-ascii?Q?p8/hwBgRitE9WNtbsCIaSBQFbE6j6zbkhZDrnPp5LilNwUdzyODEb3sVy5aA?=
 =?us-ascii?Q?FHKLCs+Mjp8Ox8XTeP5I7Gv5jrkuVfoI5QUaAgEb4GuTZE5gzu9oyKaNnwWx?=
 =?us-ascii?Q?MFnOUU9PZpYAJ9vYS/K1oqKFPXRZpNkG88+X4Sln0lgxYK4P6rJPmwHcN/cf?=
 =?us-ascii?Q?W7Rwu9EWB1EPDHjmeGsKVN6APoFaUEqb7iB2QuvbyBBgIx9SQb+G82Qt+x5e?=
 =?us-ascii?Q?PlO13oNacfyrQmWO3vskhTfk8Ke/8Yn4n6W8H3SBZSdGgF4V/QMQLvTLwIDb?=
 =?us-ascii?Q?+8mXYpErng=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc48ead-6dcc-4fb1-9b33-08de83f76a36
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 07:32:59.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22JXcdfFYCu5kBlbsHwXITUSkMrE3WAbtLKaPHgmKN5dvGlsZDkK8yk/sEU4vurZ7kvQoqr2P0cPHab7/hvfrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12169
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29540-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 969CD2A4DCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 06:40:27PM +0000, Cristian Marussi wrote:
>Use cleanup handlers to manage iterator data structures.
>
>No functional change.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>


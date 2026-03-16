Return-Path: <linux-renesas-soc+bounces-29451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ1rNcqWt2lTTQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 06:36:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D25A294D20
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 06:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA6AD3014BD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 05:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE21E346AFC;
	Mon, 16 Mar 2026 05:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n/Z+6mjf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010053.outbound.protection.outlook.com [52.101.229.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACCE1A23A4;
	Mon, 16 Mar 2026 05:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773639364; cv=fail; b=Xe82mNgf2C47BxTdKlwPwCqQxqbOEydGZLcw6n8Mp/cl40BVmA4LY9huar6Nv3EI2g2YxNm1CNCvXwVWemY3D8IpKxSDTfgY+sATDQPN7GghSegTsQpcDSu33MtlrzZwEneh3m4FlPK/zh7hurylSrtR+dGDs6Dn8YUavwGIg5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773639364; c=relaxed/simple;
	bh=Y7oiUmEBFGDrW2nNqdFOrDMDrnSNu9/9UIE5LLR3c4s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=esiva9tFTxXBRb74bC/ErLvzIEhX5Y6J20fE0uqQQpZNH3Ksjv2bKTquEt3zs0FCucSWSKUnKAyA8FWfsrO3DuFBKmkS5bfQ6c27C2FspqFfFL2ssflnRDKDm8nahEHXYjAnQAP1T0826G1pq3keOepkK+zAMi9tOC9SwaRu83Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n/Z+6mjf; arc=fail smtp.client-ip=52.101.229.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHBSQryurUdFZPeuEHZPyn3a1yzCMQK6THni4EQqkc4L0M4kc7yubqYJZPs7RxiX17DuXbfmLWoep/0avGb4XgwIdVuiI8xIIu4qdmG/T8BgcuauE72q9Pi8IDNC7mYUzpEyu5yiDq8MMA6fyG89XE3doGMNn8vwU34uTORbbS3P1foSDV/2hymMiTlX0YiVHSGYF/tyxkeNIKKXW9v5NpUuoF5EeQWXGpIcOmDKCf9lU0SR6VJjNCvxI1c4trhQ8nUjZuGEMauc5RXQxmFeHzIHSYhj9Gy5w+XWGHl37B9L6MGaPx64WaHJ96iB5EbYTStSMGnCGf+gJfmkGV5OOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ge4nrJFuwhHvVxlQ7oRCIRZgKfMgXHn60q7krysTeR8=;
 b=BuMHt7IWzvxVd5KLRu+4vUWO3+i4JbR+s8Y7YQKFzsi4lAfKJSH1xkkleCVbF7gOk7PmkQEnUvC6vy3ac/xzJdCbxj3WnA2vPNRYxGW2VieQzJSz4+SQdEZ82Opt1l9codcZU3q3PA552lRZGBZO2K+dsvDkN5iiy0wf5aXe0Sr1Qnidk8ytZLZAahWTG8lJO8kL/CJh9+fKt1HMe2JmSPCT7rzdEY0YQe6QMr1fMYfmZTn1CkKFdKwGMyZmtp4wiclZNKbFIHrv0eFM+VwGiOb+Ao0uM8tGEjKQPX5IxelOKsjKqeb3FUPwN23GF4q7y+BLgC6tDxy5kAg3WuUCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ge4nrJFuwhHvVxlQ7oRCIRZgKfMgXHn60q7krysTeR8=;
 b=n/Z+6mjfzSqWNlnZclj7falCBJeT/MGaZc6Bj7b7CeNHojeIKrcre890NWf4NgcemaClvrrovGzjxbkXNJvE437DE+aODw5u9zuxklYP0UqrVHbgu/oRic5yap/MrfXVytzixxxxt6XcuRTH9OUVFrkc4U3ZYDegR0Tt5ohr/2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS7PR01MB11926.jpnprd01.prod.outlook.com (2603:1096:604:23a::9)
 by TY7PR01MB13924.jpnprd01.prod.outlook.com (2603:1096:405:200::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 05:35:38 +0000
Received: from OS7PR01MB11926.jpnprd01.prod.outlook.com
 ([fe80::5dc9:6df2:ec1:ab9b]) by OS7PR01MB11926.jpnprd01.prod.outlook.com
 ([fe80::5dc9:6df2:ec1:ab9b%5]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 05:36:00 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH 2/2] dt-bindings: hwmon: isl68137: Add compatible string for RAA228942 and RAA228943
Date: Mon, 16 Mar 2026 13:35:41 +0800
Message-Id: <20260316053541.3903-2-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0003.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::9) To OS7PR01MB11926.jpnprd01.prod.outlook.com
 (2603:1096:604:23a::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB11926:EE_|TY7PR01MB13924:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8b2fdb-170e-4ed1-011f-08de831de702
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BeBiZTAHppcJANUbaTEJw8WTIzmvv57nt95C9sg359UJ8czAIvsCWCnHWGL7+Av+UNGs/41fXOWi0uziMJ7pUDrLRKwgEgPGsqJnhpbw7SajTHOjPTr16TPr/TfdWTL+8TVAEKag9HzKXgCtVzoVQVbP1GUF7LVvD68/O89aPKq29cWyTLV0jfWrhIk8cqzJEldF1Sr2wL0aX3uaFFEEkChtLgFQvNhLlgiPgJlzBu0FsdhENpteWPywWLrNYf9UNg5w49Q0eRYF/CjWbFh3vPFeycfJMgwCF8BgSRvbrCtvcS/w5X5zSfHG64ZttZBnYoUdmLEVKKgTRn5pzPJrEDUFVh+cnQ0hm0kVPU+8xGK0igldpW9lb1gJmfCdGW+vg1WD/4VD0/d2fFFE4w7Sfd7IZK2eiCQqv6gdh039LKDy449+f1gzuph+FyOIPrTpKkjaJJMfC3Py1K52wucwXyaFuGuhvN4zpw7bLGp79XD4hTUM9B9+c01mNeXf5X30ABNJg74ZhCI4Utw3kjXS52v9FKpXERGMvF843zsEKpdjacc4MUA6xaQJF685LeRtnThGxHYBABGF5ZEHP2BQH1NJjNzjschm/mEaJp8JBX8H4fh4B7P0tN+uF0aDn0OMW7sxFtayKNXZrriQoM6Ajyhhdnsc1sxy3TXOTSUlC4Qk/fKE49gxVZWG5wR9keOxcmEqe7DKykrAK4FXavIeooXegzyr2rq/hIpPfdTx+3adSmvdZ8klLa9A5Mzq6Oux1YRxm4V2mPQlMbtbEOPn4bjc4mxTEBvYNZOfetNVa0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11926.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f0eeQtn0GYZV3Rd2ElUmif6T7uLf2qvAZAaPVXbm9g6XwsVl+p84f2yFsHPx?=
 =?us-ascii?Q?IFrsjcJbEn3yfJ+uopZ6dHlgR9I2fJ2QwQyZOn2NrlwMGtlNbzyyMIISxrP4?=
 =?us-ascii?Q?4VNHQTSbk8XLWq1EgpLeP2SQruUiWmpwGT4TzFdbUI67taByyuji+vAFOIGS?=
 =?us-ascii?Q?dH9XHxlNKP14sJIT/KcK4n1pJy7cCwrIvutN0DFZMYerSqEohKB/smBsdDkf?=
 =?us-ascii?Q?AflbpXS+R03An2ZJumhkIgGWb/dAgf6Ats3mNBzizDw1RLhp5s0Bz9LA4Uh4?=
 =?us-ascii?Q?BnEVFKeU4iGaD/DrwRQQL+Up8LZ1d6Kjs2LFsrj0py/OVmXsrF9xPyRlMxec?=
 =?us-ascii?Q?+oa7dhnWwXZm2nF2SnRNN1XJL9vxaMvmpGPQs1Tl/CYJCaAvgn17uCIhNrMt?=
 =?us-ascii?Q?CewGeFHyrFqlJF4XrWG2gaZNLjyy6jT4PcG/QnggPj79uVhtAZ20r7VlRdD1?=
 =?us-ascii?Q?EpcBxbCNeceYHQxCV1Vj9hHzoBq5vG9a5Vsqo+jtIpV4z8x4SsC4GwsPga+n?=
 =?us-ascii?Q?Bkvaq2dIzCWRcm5tl+PlAYkDuG0zMVMKRt0Zvoj2Flj1wDQs+N2JB/KvctiP?=
 =?us-ascii?Q?Smo+P2//iFpqJuVqqL+lMoogGeFA+DaOaZWlZfgq9EW7D3SaLc/yV/DnE774?=
 =?us-ascii?Q?1K/AgsIFUVTAH/clfC/DjrSXaVTRC40xG27glXzOve7rXzrOHKOf9lWLRELu?=
 =?us-ascii?Q?yBaDhTDRc7q4sY4NXnEwWzyXLQ8nUAuV6nAsBn2djNXvhDVyrmYWzlmqmGf7?=
 =?us-ascii?Q?DmFFdrc497jKWFyEjzW97O64UtG+JSYNQ3AHkCg84aTvHxOSqJ90vdafszMv?=
 =?us-ascii?Q?7PpfOILhCniSKlwYfVEabBhzaxmnEcv0aplpi/eaLjASEQApHgRhqC39TLrL?=
 =?us-ascii?Q?82jwRtpdQIMk0bMckvPS9/seh/yHpZhm5b72Bd7I7hR4XZklqfD48jbcon/S?=
 =?us-ascii?Q?hxzdidvRlHNYw7m1WhKGgV6MeuFHsiVgFUQ0FB/PhhKZl/XBBwFjSyFcR3U2?=
 =?us-ascii?Q?d02CNY/wwuS3xzzrYp28SXPearUxcYbM4HU0pFJ5DDcP+aT03p1+BkcCSTWm?=
 =?us-ascii?Q?fcWCmGnAwUxuUhn/FiLpVjnyLbmAQV5rYVDNGGXYFQtRnLowU2Djcqs+2Yrj?=
 =?us-ascii?Q?f6doH1K/smCj9qxJC9edZJuoyutsnLoVpVjE4JaTqmD+ucSY6Jo79Q4haCyC?=
 =?us-ascii?Q?PQlrdmB8DV09FgIwKv3a+VsnW0nTBtMgshJkRF4BHqXL9Ot2Bhi3hifJD26c?=
 =?us-ascii?Q?DHrQ1F/iaHBXjS9xR3lH1gkjXlVhSDIEKOSdGv8U2zWgFnA0sZTwKfbdqFdL?=
 =?us-ascii?Q?2PVmFlgD74m9dnxsAARgt/m/L+fTP8r4xIOnm+RQnn8V0TOHmn8HQghuThm+?=
 =?us-ascii?Q?VetUQvb5BUm1EV7BMVZOgipi88ysxF6b1jjruocjnzGhStqsK6+dbHsqlC1G?=
 =?us-ascii?Q?FNjW0hRBvC7hFnJk+eZhFpueeKKUb/x6tdSGiqmKgqe4mZ2ssWeAp4KJ9EXf?=
 =?us-ascii?Q?qu8dBvkrTHO5J6ywVl2HujSiYAu1ffmhXMSY6WXgipRvmam/Ue1a/DtUk5aT?=
 =?us-ascii?Q?qOwn/2bz/io3kAZ1OpokMZGB/66nZLso/8gl+NSFrNeomdYI2lNAryU16iY4?=
 =?us-ascii?Q?00Q/SZtRHdqxfgGuU2dUhZXKJS2KO7w37PSRXouTrGy62A77bLPyeiDk3Mon?=
 =?us-ascii?Q?0KUmbOReEO8QV9mdMssOuAZqQIEYQeIPX/0+Invg1N6fvHxRcFzTcnb06I/z?=
 =?us-ascii?Q?QndY+tXmAw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8b2fdb-170e-4ed1-011f-08de831de702
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11926.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:35:58.9501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CbTTi67MtrUogaxwoWtyfw7NjgEvL72ynOaZXoDZHc2DKrKZ9wQnQu97qBXpya+mAwaHTjUDIdmacK+m8ZO4vNlnaE5TNoHyBX0rAygVaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13924
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29451-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D25A294D20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible strings for the Renesas RAA228942 and RAA228943
digital dual-output 16-Phase PWM controllers.

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index ae23a0537..53d07c0ce 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,8 @@ properties:
       - renesas,raa228228
       - renesas,raa228244
       - renesas,raa228246
+      - renesas,raa228942
+      - renesas,raa228943
       - renesas,raa229001
       - renesas,raa229004
       - renesas,raa229621
-- 
2.34.1



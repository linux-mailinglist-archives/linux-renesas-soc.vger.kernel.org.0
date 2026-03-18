Return-Path: <linux-renesas-soc+bounces-29709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GFjEusLuml8QwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 03:20:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD82B528F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 03:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A99503087C43
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 02:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0889227467F;
	Wed, 18 Mar 2026 02:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OzGk+R97"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF9243964;
	Wed, 18 Mar 2026 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773800389; cv=fail; b=lQ1Cm4MGPaSJi6BD2gEjaZ7thVMoZEA/GV6x3t35mIrA7RC1mFCDFq5KQfAIEBP4GiPAobrHjzE3m6fAPsak3L/uAVVpHni/OfMjtzexTGudxAL3U+I7OdbWansGBgoMZYkdFVahvfa3psPxoVLckt8psw9yq+ORQfysaiDeRVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773800389; c=relaxed/simple;
	bh=kTq2L1zvotpEVm/LMhF3X02VQ3h5FgRq7KSG3Aa+8x8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cTpffw31y/Tnn/isR2in4tZRDhoIt6q5jsOpOTBrnT5TfsERS81WR0bZ/ArH1v4wpqGITeV2L8jXg6C5iphrDtg4NbLavlDQuj+8iUQEz53dUW5s5U1eQMy1CX0SyVwClMKhNGqNgnkYWJuM+hy3o1r5nXfWJ6M+XZXIbFHi0Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OzGk+R97; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE+Ui1Y5IttQH8MK1n9C2Iz9QuKGqvUxEnF4xZWpZ1M670P3Vjg2gdhtreALHCFh44xtAKyfLQAKWxOiQcRHbLWHFConfUn7jMq4SXkMJe1qmVScJKp2YEsN2UMu+NLLZCKaJziVMGpwytHXJkr0Lb29GwHhmQA03k/M8FfO37X4heZ2aQQy7JPh2wQ8MDV8WFdIarUlGIFe4v8p4qf4DthRUofdoW4w9Rukx6oS8CdHrdeimCpEZZ6Yv0m1O/FVOmVc6JYqkGR+o7OtB3RXl6fGBl6ySnKruWbplAn5L0J3RD9bJxxM9JZj0i0Cebpu/53wLvMIZwSUwzoqUEpASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n64COyRQuOd5xUVh2Bt8xctGTO7PxtuGi0+Prhgg3ig=;
 b=UIciYjyoITCCpkF4KY5krVl0kWt+bnrG+gX/NZdDFaDs1oq1hqRm1dNRcm5UlTf9B5gFYjCPJhKIXpvUyf7qHnCvnyEmJd4ty8oMsGn9JXsvG/fUHoCRFI3BmGo7cyTdTDebGsXQIvl/avrfBQ05MjJosFK2n4dFLlK9aZKAEPOs5Rl06PLzTiPBvJn09SptSO/jLg37Z84tUQIhEUL13WWkJd0Jvb4+yYqNl3OwEzGFZaAlvoOn5eSx+CM+uiTRw3YJgJ577PSR6L6Ke+MbOSV20BN2R1P3x/LwIjkkb3ZujQL33pYfhvQ1Wp8s/AKgUuLbatX7i89cqhvTKgfHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n64COyRQuOd5xUVh2Bt8xctGTO7PxtuGi0+Prhgg3ig=;
 b=OzGk+R97Zo8Le7qTIPDFidYiub/zidsqgfESF9hTSuShWMZlw37hKi36Rs16vcq0QrBMJ85165hvdq/XM5ZsqofEZj+l2oBiGnMeCwqx3b+qPNaLs6v9eugle019yJw2/tJ0QFY4ZkOMjnBEGhWth05dU3FYv0ldzc0+blRnX7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by OSOPR01MB12456.jpnprd01.prod.outlook.com (2603:1096:604:2d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 18 Mar
 2026 02:19:45 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 02:19:45 +0000
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
	linda.xin.jg@renesas.com,
	tabreztalks@gmail.com,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH v2 1/3] hwmon: (pmbus/isl68137) Remove unused enum chips
Date: Wed, 18 Mar 2026 10:19:19 +0800
Message-Id: <20260318021921.75-2-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318021921.75-1-dawei.liu.jy@renesas.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|OSOPR01MB12456:EE_
X-MS-Office365-Filtering-Correlation-Id: d98eac0f-f5f2-49d7-a0fe-08de8494d25a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	BXx5vyLL2wDa5p5rXhBIb/eX0BPARRdbzMlK8Xf2aCLGmrgt3dGJEavGewzN1T3dHANQJTuookYbJoYmBxAyafY+sjT/wH5nJ5DF/hEpYhKR1Lsu7b/UbEihF8kxNW3AnvIiBHfFO+MXnSzLwAT8xc0t2S5L6w4Brvv4Eap4938aPwzrrtj4R31P5NTLUPtLOQ0gqpo/jWTKti44b3RlxE+/FrKg/20AeoQxPX47yod2jwPokKPZsToVKZcNhmnsJMjcmXP75fWVm12k6+8bMYAGUurumHmQVhBCEBEGE7nRSuYwHG/ATtREEepQl+70BMpBhgGHI7d3btTnKv4wKhkaW3Byk9ZOZwp/9Yw9O6Ueb8MlLeN/hycL4prsf462acwU1aLm5yzOGlDl3EcQb4KcYtGkgXh33DGHlpJdvWX3j8KX85A35E6mn+QgKergu//zOYHq4VosmQhL4CJ3moR2ZKDRJtF47dW4+wfMR4koolyWTwKos8k8GIGHxY44P3QmIpLFeezkBvkH+69NR94o4PH1Oi6k/6hEGEd+pC/dFzmN53RJ5WZG/cf0ZyrgBKKiFf3gMV2JcoKw9coilKomZ0Kwagof/GvPiDg9+lD+dhH4eOAiaVdEjFjRIo1s1vCv3mqcXiOEsqt7uUeuURuKaG4V+jg0Z5xWcWpfJ9LYwu/cWzTOhOCPGm6G+WwUp/Qdg4yn4t7kkSlCieu4VddhC/3Dz8AvGPLDvRyhIBwImwhrEiSoNvnfTg05QxpmIQlAaU1SAHf6HC/KL4qB/WpKrxvY0VNZHV54JruTYsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IYaRdqKdPywkVm7DN6nuZEjIamn14W1ZY5fHYO5YLQQ2tEffnrKpxnDoPlml?=
 =?us-ascii?Q?8ANzmCYI6MXBOy1dlXYabRziV3V0xnlNWXqY3z0tK1Xw/kXsQJKnkLksyKxO?=
 =?us-ascii?Q?/dE+5sxFCbmx48IzGSIcsO9IUjdtEPmf2wqaf8nVraXosUFOCKx8WXCrB5AN?=
 =?us-ascii?Q?XS7f6knqszp+tk3n0G/wGf94ShS1yqBjA5/YJNM1Sf3P4q20jQInMw4JasO7?=
 =?us-ascii?Q?mAjQ+K7hVSjahxMgG41lUgiHwiL7+4ae5dNGzqiPN+w8Uy4thAelsugE3Sxq?=
 =?us-ascii?Q?cEiTd81dRRoF6ibQedLbG6/JtlAi5JeraFSgM1EWZYDceqafBD5BU5hJPFFf?=
 =?us-ascii?Q?1ayZFTU8nUJzzT9oA9pkEdQK1W2CUzLW1VeP0xhOgkb5hCqniiYbALu3Pq/L?=
 =?us-ascii?Q?7uAOgBt9UydS1DdTnBY9lvO4Q48aVHX9B+EfRAdftLsu1nn3DwnyEqjBik+f?=
 =?us-ascii?Q?fZfSUP6nxav+ABLrVYBlZ9vwff3ahGl4/LRKMLRibkEXp4vhYpm1eGpjty1C?=
 =?us-ascii?Q?hHmys02dH04Vyvgpvc12Y31rzu0WQ4cG3qQGDkMIxQ1mkMBrM+wefCyq9p7l?=
 =?us-ascii?Q?R0CXfDpoU0Bh7NJDDMIb4Oh4qHm6YKKIwU6i7R91ORX7M+7E1bmPaW2GscTo?=
 =?us-ascii?Q?66STvAlyCpSbpstmzWgria4LDZBDSPqE6lFVM0er+0r/N3RRDVw1wSelKTZc?=
 =?us-ascii?Q?3YdFPdqP9DJhOuHZKmo2O2u9tmBbBrONUGZlluFj53mjbsYsnYg8B6oDtYS4?=
 =?us-ascii?Q?L4Oj1T+o9SK06wqKEATopT2c+pycGBrP+GHjtoxyr9O4VyrnIxamkXpPfQKP?=
 =?us-ascii?Q?R+ASKx4dkOClR9s3k3abjVVQQuRkV+Cp4usx+CJ8juLYyp54tSC/2WMMh7Cm?=
 =?us-ascii?Q?Nqu1ys/6VTIZn/KXH0VSKxaqlPC7Nb/q7VkTm3yg2PS4IyDbXxzGulcIEZ5R?=
 =?us-ascii?Q?136FL4iinoZo5jKXycoag3PxxA5EEVY9TKr24w8w9hPoBpU+dELdW2ergKoP?=
 =?us-ascii?Q?IFHSkxSOStxXCVMGafthYCSGQPJCtWG/ilwKEKw0bCXnE7MHA0UmW9qVAE1f?=
 =?us-ascii?Q?nqkNCqHtwgBysTkO7TNgtl8jXKqJzrTneyENfA8KpbilDyNRmnaPXtkZVcP9?=
 =?us-ascii?Q?kU0/R53FuEhL2YychkZhCathow+qI+mIonnZ1HGde2hujKf+YR5jk/vg2L4C?=
 =?us-ascii?Q?v0VtLq7N3Siq1LgvYJwlZLQmupOtAIcsWQ0tlzL6WYilfOR2mV2gx6WfY+CU?=
 =?us-ascii?Q?Wrwsr8f4tvakTFup4hzi4tFCpwIsDGv2RmjVMxZ84wSADzt/lCw/ICFlf9Ih?=
 =?us-ascii?Q?UgtREtIBbUHuv5CJhGz10+8EoTrK8Ql3i8iJGTq43ITKUbe4OWyQ8UbJ7XEy?=
 =?us-ascii?Q?84QLqt8U8z8AlwYvOqN/ImPHLVj2gOK74Tk+EXAN7b/b5kf1BRDmL3b0B/x4?=
 =?us-ascii?Q?eI1Vmkxo/g1bdK+AHVOqVwDiZx71GYvNxiFZ2mBVtqD7esW8ouORuCtDWPrI?=
 =?us-ascii?Q?mCQoJo6nlH7vtDawi9Pw1T/3ofrIeF6oRb/1QKCFMJ4nzct5bAb7oASpX1MR?=
 =?us-ascii?Q?ulyJDL1lqH9pNELhtkZbUIU04LV9jhKJ7xnOVS6Ulozc429ydFzu++/WAvSp?=
 =?us-ascii?Q?dKWZmJvIMb2jFMO2XhGuIaTqx3SnkNplu4BR512MbjmLT4a0TDILJkk9Y149?=
 =?us-ascii?Q?b2LXgPyZ2WnHE91isWpIauSBys1H9zkvgNx8JPkxYJe/ep6l06vQon9vkM0x?=
 =?us-ascii?Q?YqPnVnHevg=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98eac0f-f5f2-49d7-a0fe-08de8494d25a
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 02:19:45.5492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WzKl/YMoUHSX4Hl/GRZBfBprCJKri1QmXmYE/QbR4yA+taC4tfrXkfIWblL1fgJr2CaiQggoaEqrLJ3+Zb56/VZ5dUX4VTgQI7xvV3cvdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12456
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
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29709-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEDD82B528F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The enum chips is not used anywhere in the driver. Device matching
relies on the variants enum instead. Remove it to clean up the code.

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 drivers/hwmon/pmbus/isl68137.c | 46 ----------------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 78cff9712..3346afdf3 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -23,52 +23,6 @@
 #define RAA_DMPVR2_READ_VMON	0xc8
 #define MAX_CHANNELS            4
 
-enum chips {
-	isl68137,
-	isl68220,
-	isl68221,
-	isl68222,
-	isl68223,
-	isl68224,
-	isl68225,
-	isl68226,
-	isl68227,
-	isl68229,
-	isl68233,
-	isl68239,
-	isl69222,
-	isl69223,
-	isl69224,
-	isl69225,
-	isl69227,
-	isl69228,
-	isl69234,
-	isl69236,
-	isl69239,
-	isl69242,
-	isl69243,
-	isl69247,
-	isl69248,
-	isl69254,
-	isl69255,
-	isl69256,
-	isl69259,
-	isl69260,
-	isl69268,
-	isl69269,
-	isl69298,
-	raa228000,
-	raa228004,
-	raa228006,
-	raa228228,
-	raa228244,
-	raa228246,
-	raa229001,
-	raa229004,
-	raa229141,
-	raa229621,
-};
-
 enum variants {
 	raa_dmpvr1_2rail,
 	raa_dmpvr2_1rail,
-- 
2.34.1



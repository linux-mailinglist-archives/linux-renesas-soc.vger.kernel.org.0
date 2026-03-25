Return-Path: <linux-renesas-soc+bounces-30208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHmHNhGlw2lhtAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:04:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 553E6321D8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 10:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4FCE309E334
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 09:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2DA34FF6C;
	Wed, 25 Mar 2026 09:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lTSd9gso"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABCA34FF58;
	Wed, 25 Mar 2026 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429387; cv=fail; b=pFt+POvv8ISk0mOPljR2gxBgzMrm01q+mKQ9KtfoZKXt0n00CsrqgrxGdwyN0sNcf6i+sL3BtrQH1Pf6Hi+eaa5Y0BeYrKHlmf3bmOQQ3ZeAQFqMlPpYuM8Or8sO7P6TRBxX/j4jr4iuiz1OYmAY+4OSRkvQetiqiso3FYmchZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429387; c=relaxed/simple;
	bh=lbbzWKeHHT18Gq0sjEN+GDRByraHjlCfwl0acbjJUVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PE1EhYzTMPwvea4sTNYJ9IKY8WWjAjD6mIZJ110sUs4fFaL0DVOQs+4IPJFY/7gcLe9JnXI34/rsjUcv04WYllcOEj2hrenVrpuwjdwO93Jf2tdkpDiu/JtlAwOTnJRx21RYTEO5yV7Ds78SZ0bzvkTq7HPoMhmfBXQaGfohGXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lTSd9gso; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1NjZ3RWvMk+2aw4ZIAUv1upaGgtu6vz7aZFUZPtfVQqNFDQMC5D1FeBxlcN/p9mBkgpvc9hbR83/Z1EFSAP8VujBJ+YLLvmZsdZQX1rQfnuGnLkxAUcTj1GiF/Gnv50rUOaw2oD6omh36V6YFhYRPNvfICQJL2DZlrmbt74Ys42TPhABcXras029lpEsUGiACM8rmaT6JS+wqBvjb3wE6BQt4HhceErKQA8uqbGZ4//PF7sdPGqQES4w3UJI+3dw6QxYDOdv9r++GbMfIZecLAVTMRhoLHOPtOVJO3Zpu8Km3cKImOOCmnE3DijxaWxXsjbU3MWhv/sYzVmfWka+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVp2NU6P3RfgcVJ4NnPU5867NwDURHdPLMvOWMc54xc=;
 b=tjJ6Ne4jNTUCwsrFOCHdhkocAglXH+53alhrD/WQqByyX62JeORY/6nWxCvX3iCbZNhutETCUKIeftyepiKxXcgSQ4m+EIaCoE2srt2ApjeG+hO7suVM71I89F0ISzXxepCBqhuTOG99t+Mx0vGvR2+QZm0mJ6pqUG6OLQZH58GAp/rcvsgk9TeyW9neeuZKw3sz/UooF2enmKRRbtjMLHi9/32OsfJ22YSyHZRWFjvflDD958c/DLip7+bz6wICJbQhWypHeYxgoWwubBVwIi57q0cectrK6ASnlPU8bu3GdkZKHgl7IY28iv4Mi2m1+bYTdusGpon5mfRs18lnGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVp2NU6P3RfgcVJ4NnPU5867NwDURHdPLMvOWMc54xc=;
 b=lTSd9gsotZCMVOFkuxdplWJtMHoNh9aZvDcTzUB7+fQel5FlSE3xQA76o2QseFhqNfQY5npIgjgT8KK8pN8ESIe4MGx9ywh/GaNf24P7h3sWsFszgo0Mo1L8PaO2mdvQ8G0r6dPeMvnrF9dRAbLmVHALe3Z7nXRcGmhv6HKl35o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYRPR01MB15433.jpnprd01.prod.outlook.com (2603:1096:405:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 09:03:03 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 09:03:03 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	Linda Xin <linda.xin.jg@renesas.com>,
	Tabrez Ahmed <tabreztalks@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH v5 2/2] hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and RAA228943
Date: Wed, 25 Mar 2026 17:02:08 +0800
Message-Id: <20260325090208.857-3-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325090208.857-1-dawei.liu.jy@renesas.com>
References: <20260325090208.857-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0027.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::12) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|TYRPR01MB15433:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1ec523-d88d-437d-177c-08de8a4d5246
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A3B8/U4YaSEkS0qF0j671lfd3iHHHJyfeXi4KUfdXegcoSZA1XnyD1Qv15GstkV73c6SlRtVSlL7SXdlpTQLLWjlljMOgXlzwj2exiLUD6JpjAkHl4VZQsuZbWUBryK7KSxxeZhxqEE1ifbbeEFhiEarpXZ1SdP33mIJcaoeHqGyhgodcYXjHnsC1Mv9UA5vvqDlcqH/SDNmDpVNY27GYejOYn31Ul86UEnUS56hVVRIx2sKtqZttQTgXyTwL6kXgUdcyO0gHB3DXd6bJPSkU5W07QfTlswUxQhkDZjF+ooA0uffSmVcr20U3aG7lOnlE8YU8vR4Nm/+Um2tmXVx+ohGWoA2NFk5sifqp8ktMGZdLr+gkJ5gqwHwnYtHt83w4lvJDFuiMjXz98L5B8UN2VneQG4cxnVHcwoyecwbJgjizG79IrScNDMVkG+fykvyVwGQ2rEcu4eFS48OfDrNVuoQfpjYIiTOt+04K5WYS+xAPVcMk5Qm8dcl0c03AAXWgmRJAAC26423OuGcONdb4/SnrDfUQ4mx3ycPYF9MpEQsTi9eplwoKpOMqrqVViXGAZTOxU/ZsDK3hu1e3cV/tBhoZtwJljwY+xw8vrImHoXKXbgZbUaXNxGt+vsAgDzmle6wir9rwsmgy+0vWfu/Thn09K1ZblghJ4rzXuZvJEVOfQxYEm1f6t9+ZYiv87PoRAZ7Po6Beq7NFIRYcpqiK0FRuy3L1kPer/dKst+tx0I/6h3dZSy144e0uv5zJCBw2qkmbC3SwlQdeKvBn/vWcSD6Wec5qS4twUoeat430SA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0GUw9hxu6N+1Jy/sC0sQI4Nz0xRaSpC9EJZTrXCZ6qF6jvQcpZWRYs3Rd3GR?=
 =?us-ascii?Q?A6X3MbgcnkcLBWeEN35Yn318NxR+/dmUQpJxQT/uc2d0NBx52dOWrNJpq//X?=
 =?us-ascii?Q?0+3hAFSC/tAi0He3EAwaYJELPNamQlkdaUzR9246v+vWX+ukBWe5CqsE+0g0?=
 =?us-ascii?Q?eWnLt3q2AdmGoFnC8YpCycw9T9m+XV1E4zeJSRP7tk+tXRJXHCPsLutmp43u?=
 =?us-ascii?Q?sEXW2dl4VEBwKDVy3EP7gQhITfpyYtBI1LZAHqqbpfsGt8rkQ+csTV3oLvVO?=
 =?us-ascii?Q?0vlscPPjtU3gvPa/3HLtzlHtDZO/EiSZBxlJKSufPOaVHw6EQzVsFw9qXjM0?=
 =?us-ascii?Q?aReUyqeurq1jbSVuBk9jfUOzRdA9E2i2v2hFzR78pgv+/Qb+qeU2qD/FvfxG?=
 =?us-ascii?Q?Lmpv9yZqzvcOvbK1NJcVLQLo0+ce936zqCdAGPxohMTZSf4VZRCTE73N16y1?=
 =?us-ascii?Q?U7uEmYlcZOzkg+jw9UKhoBvwxuSR01cTY40mK1Y+PoFDa3ENBgtajv0STBH1?=
 =?us-ascii?Q?t/w7EXyevAvlGV7m8sUjCeLsghPba9zYd/LJyDhrP6egW4VXLeQysq0bD71w?=
 =?us-ascii?Q?OjBVuBvkZdWOii/5anK0QtsKFrOY2kMYxeI4LRdbPtGj79OM03kgmnOUkhPG?=
 =?us-ascii?Q?FplUEozczmvqq5h4ZLWH6rBSEYwsmECCmF0z3yq/s1qAeTHiSQTFF4UY0sPt?=
 =?us-ascii?Q?FnL1jYyhXUY6I9ySPl6cUtON3UYvX+WxwQvZpQ2bmByhgUMaeNqVBfE/+Ssp?=
 =?us-ascii?Q?1lgZQS/IxsVoGvwUkz+3gZrPHmMnC9u4KMbU+WBVM0B5g1wz4hVZjd8iN0SY?=
 =?us-ascii?Q?WMZ1isiH107GJH18KW22phgQfaq3rc+RNc0PoePSkbej1KNTtNsbr8cAFQgb?=
 =?us-ascii?Q?V+wO3pLQngQZ5r3ZpwcssjCuiNZrQ7im/41tB0Hq4G+lUOpKi0YGj/9DLKxn?=
 =?us-ascii?Q?vAw+8xC3R6WAd8IIFqgM9nCEiZFs7G+aARtwic9S2kdqXiQZqbOProp6bNrq?=
 =?us-ascii?Q?aCxci41ep9DLV3iGZcHteK7JGJsaCl3J7YopEiSAOcojK4sWgH/jTcR9g20C?=
 =?us-ascii?Q?FSgPNAou3j+AyoWs1GM7OyRLDiQv5DBZR6bncupeb+EvGtcPXI6GNIJUKpCA?=
 =?us-ascii?Q?fPccpgAsAiZArDFtKNtnTcgAtTHVO06sm6EJE/JY2/BGjc8degO3KSk+gFc4?=
 =?us-ascii?Q?bZDOxfH/pfO3w8M22lQ+JVSQO2SxopWQ42j+fnQTzOL5hGBhXbwG1QZOBDlN?=
 =?us-ascii?Q?054geV+/wRLlRTsu6pzK9rK+sN026LYqAThQT6UjPbxSz4kukNvWbpvIMvkB?=
 =?us-ascii?Q?6JgnB9QuNLV3ScrrpA/W8DmirICzO3d4Nd7sFooUdwDO+IcOCi4dSCNJHLOM?=
 =?us-ascii?Q?7+BUq2/wTA9OFDon43F0CimiuCShSp4/k8RfvTCUIqxyqVjbKW98cqHFfBKR?=
 =?us-ascii?Q?qrDltqmPreODLqyJqUHTOALAcrqtfHNuhYURShhKOgHqfA4zuMF6yZ6PdFTL?=
 =?us-ascii?Q?Si9LqjzegD3qZ9UUuud1GOJPOJ7FF0thqcnNDw60TZfua9Qb/dWF3iilGkHR?=
 =?us-ascii?Q?L9AXuD/+0bJLS05PHOt34c4DvxZ418/Riy6LiB237Lpw5Z69io54K13UxLyC?=
 =?us-ascii?Q?T347aCh5MbYx67MwddeIcAz18DRK0n593dM0eal1IEznVHXCHVytAEFy/zK4?=
 =?us-ascii?Q?eiis/2cI/j4sV98i08riw0499/Y7llxEg5d6kbGUysfgpf4/O0UQKFRL3aUV?=
 =?us-ascii?Q?tuV66moTFA=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1ec523-d88d-437d-177c-08de8a4d5246
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 09:03:03.3116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/bAShVXOvYgLZMUYCwHQPVIaTPBneMrTCa5j01vIyP97MxJO0u54uBAyCDE4QEKzwp75bjmp1oHFl3KK/6uFuSQZKOdmZWnhOOhcIbMugg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15433
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30208-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 553E6321D8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add I2C device IDs for Renesas RAA228942 and RAA228943.

At the Linux PMBus hwmon interface level currently supported by this
driver, these devices are compatible with the existing 2-rail non-TC
controllers, so devicetree will use fallback compatibles and no
dedicated OF match entries are needed.

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
 drivers/hwmon/pmbus/isl68137.c   |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
index e77f582c2..0ce20d091 100644
--- a/Documentation/hwmon/isl68137.rst
+++ b/Documentation/hwmon/isl68137.rst
@@ -394,6 +394,26 @@ Supported chips:
 
       Provided by Renesas upon request and NDA
 
+  * Renesas RAA228942
+
+    Prefix: 'raa228942'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
+  * Renesas RAA228943
+
+    Prefix: 'raa228943'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
   * Renesas RAA229001
 
     Prefix: 'raa229001'
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 3346afdf3..03c9adc0e 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -432,6 +432,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228228", raa_dmpvr2_2rail_nontc},
 	{"raa228244", raa_dmpvr2_2rail_nontc},
 	{"raa228246", raa_dmpvr2_2rail_nontc},
+	{"raa228942", raa_dmpvr2_2rail_nontc},
+	{"raa228943", raa_dmpvr2_2rail_nontc},
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
 	{"raa229141", raa_dmpvr2_2rail_pmbus},
-- 
2.34.1



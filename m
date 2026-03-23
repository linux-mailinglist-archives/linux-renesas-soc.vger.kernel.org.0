Return-Path: <linux-renesas-soc+bounces-30087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFtbMgyywGm5KAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30087-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 04:22:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8902EC2BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 04:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4815300E16E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 03:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A973296BCC;
	Mon, 23 Mar 2026 03:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="htg5/9Qw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCC522D78A;
	Mon, 23 Mar 2026 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236084; cv=fail; b=Y2SzDuiEcR13tTWUYibtFYfcPySzAtXT2ysiyFsA9aXmWBFJFf3HcbceXqvRk3LMRKI/yVYxPNajpYPw8RxUA+xHA7e+xYM6nfYfRz+uKBhxtzGyDuVAFFKyNBKLk5yfPfXOzu1qj+gjyrrtnSbasZtop4lvHuiHEso1TP84beU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236084; c=relaxed/simple;
	bh=tEzqE8nqtdOFMhp7UjT05lm84WZ1quBd99VTPIgCKsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NRyCmGWRo3a66pjnWmYFWVfwV8C1CltKACGwcHVCtLEPLJNADt6m6islLUcrr6jzhBgY30GZQN9Kc1v5tLqR2Xp1j5hA0Zm+Dc5UityaET3G9RpeewFbRVxKYOWG/xJqaxDvW6bGgmiNbyseJIMZuyN8wEptW8E1ZDR3EqgBqTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=htg5/9Qw; arc=fail smtp.client-ip=52.101.229.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8FIe7wKdlF337sO3rdn2Ycc+l/3nwJAdRkLj9Y6kwm1wrjfq7+feXzqKgoVRs/HnmpTFGFCgZLYrTrW9D4O9fcqJakdHnmgAZpUb/UHVubUyEG/3Wkyz5c00Smmkr+umkGRBH+EnsjHoaEuym2YWsnc9csAjfmhQC/Cjf5WBZrbRdVjdhUzs9NVLnzQ8sFymueu+2OrwlOiQ4vBa/tNIhMgUI5OmqbICR5Kwv7fEcRh4Q26c1MoJ4XBnbPTVtbxiD0F2lcdgWBhLMKbVJcjpEQ3/ACmy/bH42PxisP6KhhC3bReIfOJHZ+RhembAC3ArqvVTGGtykJ3M7kwaEyRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXTVTOI5I48dNvDlc1TAs3F5DZsRWrp+X5xGxSdhKj8=;
 b=SU5i3/7pxjm92dxROKb2JBEq1bbrQ5HRfRx5GFU1lJGjoAtw40GapWXrvfd8lxktUojZuDGImQ8a1NcYX8xw4gqumkWfNa8cbE/GsGk6K6EFhjL5H60qDvl0rJb/vsiE6Z1zig5zNvTdGvatSOGqEkJoap7fGM5g24h0E+GEwCHNPZyeTm0dm3ojTkndXu6Xp14ED0EIq92dtqS8RYLlhoa4eBR64kYxNUoi0wrfRrqyi90jyxCJ8NSbYyPMSsHm7TssQdTQ38UaLXUY/mHILyHTkUCq4JDVVn46HqLh96RiYy07FskogotWghgacgxhFuk9Wb5jw9r5KqEOgzsJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXTVTOI5I48dNvDlc1TAs3F5DZsRWrp+X5xGxSdhKj8=;
 b=htg5/9QwFrqQny4Jw7KpYLN3SbX53qLAaB6rlJTbJ86yAlj6AAMJUp8DqLL0cQaHrKa5WkGRMf247TOJ/At3uH7YeEq0nnF+MZBopLV54AtxjIBVajZ5TM7+FErkhnUGJI1T8zevCVqKguy5rWIImJZIT4M5IICWYSl9EtTA75I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYTPR01MB10922.jpnprd01.prod.outlook.com (2603:1096:400:39e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 03:21:05 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 03:21:12 +0000
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
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH 1/2] hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and RAA228943
Date: Mon, 23 Mar 2026 11:20:56 +0800
Message-Id: <20260323032057.953-2-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323032057.953-1-dawei.liu.jy@renesas.com>
References: <20260323032057.953-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0013.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::18) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|TYTPR01MB10922:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0b7189-2e33-4068-1a23-08de888b3c52
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|52116014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	dasxVjHctKVj/1LLi0lwDF1zsGvh2k4vTex77nFmjytQm6+HxFCWoWC9aq8Jx3BdP+naF/3NoRszIEuej++F5hI1NDaHqet5akK4KUqsGP4j3F2woct9E9FVAB2ge8wkGxfCH3aIIf14Co37CFQ0RoBxxjMIlONIS/7npF6qNImZCP5x+uYiPjsBAaUhlca3VxahIQ7mMCKIGQ8KIpQvcC2DNfPQvT5UgzQz+fyXYhsljas5ycizbAVsar1kpLVjr20AUaZQOn/Myp/G07abXYVxVuqvfREuHwjiO/BF8cjOKfRmT48Zs5o1UqpWIgn5X9IW2QwdkGGNvHPcgHbj1K9gVBESH4jeaKwa8e6F1arBI1I71wgb6KOGQ+IWTIZdJrcuLtCd0g5bRZF2JkYUr1brVlScW/uYMRIFMKa+aiejaD28AKv2PiSSlPlfwtPXxFZF9wwFXH0yRQDfQRWFoIUzi/KU+Shker7Se1zU5YlWjqFuSFqXTiV4W9woDy2SG/tMB9pTjQqgD36JezWy09wo3m6Ruqmms85c+GGXLgSnx0eC2oNIB7VCflV8S69AOJRqUdwOVpa6vq8gSH/VIc9R91+9xokMhuPsmgV15cMdQYjScZA/xf4fnYts+NX40ioHeSd6GyLeBm6YLZH6f52T+ULzr2O/wSjy6dXu2UIJTDJx/Ed2xYznpazHsLYCsq1MYJHCvtXshT9p7SIhQ1i3xim1FwYRVrywMsE/zNfZVRzqBAWgIA6vmm3wkax0U6410P3UXUO/2pPv9BB3VdjCPguubsjTVHaU4695V/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(52116014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UncTSKQlPe5iX/qKZVysABcyr3bMYXwj90F282mHViSKMP9xS1RHb+jR7STd?=
 =?us-ascii?Q?nBW10pW+LEz1Ai0UNM0yveahkWb+UL/dGHRjKgK2z9pr1uC537sLvjO42Pb4?=
 =?us-ascii?Q?S2s6DPU+iAaSbbGFsKuM8uKx1hBTl7Nu0i2Nt0Z3bBCLEuGxZKq7IgGN6gYK?=
 =?us-ascii?Q?weGVCF9Kj0kL606VEmWnLgG/naWBtqn6zpq3XKy6cfc1fvGwE5nLrkJei0bY?=
 =?us-ascii?Q?J+NbcwjW/aHekVPAr4H/7BGAoQqjR4ML5MV4n5EsCgxNMgB+V0FZeyUtuata?=
 =?us-ascii?Q?EgErbvYuNMW8uLrHZK5VrMXbUSjdvfeilNCn1qBsK37afS6Hjktf3bR//Dqt?=
 =?us-ascii?Q?2bshf7uxns8qmwNhpGPOF34AWICrEl7TVVhoRZk/Kq/eHrpPgmkGn7xTaeol?=
 =?us-ascii?Q?V19+M2M5nauuGim57c4wMxHW36JJska3AAbgeElRxnpVV6gORqbA7oW7SZQA?=
 =?us-ascii?Q?bTR5DZIUS2Cg+86vhgcL4bDt6o/Cnb2ZKrVN5mQKw6U3du9L0+FbFjrUo7zp?=
 =?us-ascii?Q?tP+Mh3p96tbM6y9OvujJpuZ+3NoDiY0jobNaMWRaHVyBUSfdJ3P/wgjbj12q?=
 =?us-ascii?Q?ZwO6fHR52hXAKeag8zJcjQ4fd0tnZ0XFIjRhB35UkTQVAq5tKQ7CZzVWtEVS?=
 =?us-ascii?Q?0HPnvuvJ45pnYA3UqT2lED0MJIB5uqARcVM2tY87G9Rn+fzQ7mbBZVMbP/1r?=
 =?us-ascii?Q?0ONWZI3FG1QsnJIWj2VyaJIhK4OcRweWrSOSacfdNB1C0bqGWbXIubFCwqD1?=
 =?us-ascii?Q?OvMftx0IskALXkgG7P22cQ8o9TBTxy8GXRi1KfkB6KEJivR3C4C62pigsRMO?=
 =?us-ascii?Q?S3tNt7nM+BAFd10uXsZq00wvu+jtyBUnrHyjfa4qFIPBIW7/IMSTzHITejv4?=
 =?us-ascii?Q?cSGnHPOAg+CmZ9i4lMn7y/JD9MEdv8UmhqzAyPPp6HwgJrkSSlWNX8S928li?=
 =?us-ascii?Q?vVLjgCjYlt4o5Rh0n+fnEnBY9zh9dmPvW1edwrawFXomshIvFRRRXUw6JWqx?=
 =?us-ascii?Q?W0HWM11TNSShAPcLQ6zENMpev4RwPwsD0OeCmcflaJsT6qc2p24X/020jId3?=
 =?us-ascii?Q?Ch+GDmHcjiOT2s/NWmsAk2NzKwZBSyuVaEm/vObBf8ZOhF0cIE7nA801Qg7X?=
 =?us-ascii?Q?Hzv5pPgUffQ+PwTy4xQflDERQw760EgShGIblcpwltT4wbpBgRk548dxyp1i?=
 =?us-ascii?Q?jiKYnCblrg9LZBJcjB3yrMCOCFdaM2usDOv3Pl7oXgtE8zSOd2LCjNxseB1U?=
 =?us-ascii?Q?sxqnsCeqQnySS+MOrmeR0TEbf0fsfuKbSfQIoRV5pJT8zcCykgRwSCUGzLN0?=
 =?us-ascii?Q?IuF1h8Jk1kLu33WLdo+SNsFEPjByCv+PpcExFjtb5XreCoDeXs2wWEq2FELC?=
 =?us-ascii?Q?W5hAf4v02fuppQN/4XRJU3dbsBFDralZLxD6DLmDQgnCJ1k542SrSW9v/RY3?=
 =?us-ascii?Q?DT8vPjWB8gOSiPAZZYdPeL8FqPEKNQWtja0tEWIWYr3ATHpPG6z5bJ62dksR?=
 =?us-ascii?Q?Fn+UHmS7DdquA3ZrKT05NSkmG15fNa462RLfrrrCi6LmIGI9Nk4dQN/AAiWb?=
 =?us-ascii?Q?PECTvUZxWID0CBxomm8uGxrM1+q5pbd68A6DY088p8ZvtXtmBLSYTabIXK/2?=
 =?us-ascii?Q?4moIa7t/xDapFcDZHO/7+XcNiqFkz8KnrRqa5NwtDD4IgmIJYNlEcVeNLRQ/?=
 =?us-ascii?Q?a/1Bb+16bb1OO88tyHuBzNTBQ1Uc5wcf8NeIY3bN+wzacX4AENFAK9fBCZia?=
 =?us-ascii?Q?Kwd9Zujqcw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0b7189-2e33-4068-1a23-08de888b3c52
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 03:21:12.9046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri6Sog2XIlZFpbUGTYiWEbIZ+F74sBLXpix8aesJ26dvro6r0xnWOzLoPCyEOBFIoVpkcd3vCddLnav3Z0+PaXeDSox8FbpYHpcN13m0m0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB10922
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
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30087-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 5F8902EC2BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RAA228942 and RAA228943 are Renesas digital dual-output
16-phase (X+Y <= 16) PWM controllers with 2-rail non-TC
driver configuration. They have different hardware
interfaces and feature sets compared to existing
family members.

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
 drivers/hwmon/pmbus/isl68137.c   |  4 ++++
 2 files changed, 24 insertions(+)

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
index 3346afdf3..e9bb24a2a 100644
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
@@ -483,6 +485,8 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa228244", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa228246", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa228942", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa228943", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
-- 
2.34.1



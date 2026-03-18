Return-Path: <linux-renesas-soc+bounces-29708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGG4OskLuml7QwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 03:19:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB8E2B5247
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 03:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15BB33049702
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 02:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E177E261B9B;
	Wed, 18 Mar 2026 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="A/Pcj4qz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230E57081F;
	Wed, 18 Mar 2026 02:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773800388; cv=fail; b=hjWStPibhEYIIqJCsz6EwKGkgy/JiXvzstJ9VGVK6+Ug3fvfO+9X3qbSblMNMStRY/lbyCzeEUVcdv3+tLwrt1kgoe20mFO3dzdA3IuWWmdqDCmLWwHW3J7PyNPmgZGes7qLjeaCF4GHZinA0GSxLNZuz6T/bVqVMkrpFgah3ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773800388; c=relaxed/simple;
	bh=yKZrP9uwvPkrEly18344qCzL1cHR2Ai/mIukJd6Fo3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NxM5vFlP9XnU96fVg61zKX6tdCr+ca72huFjY5turceqYSBN8gNDjGsxe3aRFQJDFAbXAsACL1RTd70UsY4lQrslMXGIZ8WDf3CuaK1qww9+X7U1BdsVsZ1yh8RSHnrGRw5wY93LbnzZO9SJWdOySovZaY2JUXgsb3aExD1lmD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=A/Pcj4qz; arc=fail smtp.client-ip=52.101.125.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh7xM7zjKBQ40pX6DWn0CuwUTLCwIBFyNEqeXNGNtA8bEVcOz7EPIqTcRH5pUoIuhqhmYQRNRxg+8zcQTFTe9ztazINTZtRoyALWAEXsY8PLeV0Pz0WSjy0IdQ76SejpnKVzyBh8TUYRx1nlDjg6TK6YBKtqycSFvJwrfFfVAfMgZxGD7D1LLbPJi7TTcw5sOme6qLtH3UXtCxWMmf1Xkn9YhPllnsvd9oTb0A5bQb9JMFlXFOZl3mg6+hQi2mmCgZB98xL/gRGwX9nEXPgfpn5S1Hq1TEGDrKPQ5jyngaBM7Nn1NTNm1qCtz8mGtKl08fQA/ucnr0g6TOX4nshHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtI43JiRBnyfpSSaaCGVgTBEnAMX0YJcQWpOxBsF344=;
 b=b2XOHf/5B08q5kxLunIKw37FmOBZJFDpvvu9mJuwAY3Jvou77L6VX2zGW1HIv15JySrqkhe9TrMxfKxE3vGm/JMS313qw8Gt+6OsL6M6f5iwNu+LI9chl+LE+FiMZXBZ1/oFKe4VHTcYhVFI3l0SQUpCE2GqFZGlNaQYkp6BFFYaar1oPh3eGIRMob+9a82IyA4p3g00ph4Dx26riPawn9lk2rOmp+panFnEQeDxpDRKWxtsa74edfTRwKa6V86czOEb/7SaRPTo6zDhUvhoLz0GDvPZgwBmnagKovbBCePhyjA14jxjK8vAhCytktOYBnWxrabPWYc45D0+gYSmqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtI43JiRBnyfpSSaaCGVgTBEnAMX0YJcQWpOxBsF344=;
 b=A/Pcj4qzS2Fs5izdnJ3pxlgznuLNhBCJNErTlzsPW5d7CDji4FArw5q3SzTm1F4rPVU6jbEvYNKMWm+a4A8e/VzZofwhAje0CNJifYO4xzSUvzdCLZS4pwp9R4jQAQqte5rCYQVZBeRyeGysgHg8ZAXOobzkYAzyArD80S3WpIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by TYRPR01MB13423.jpnprd01.prod.outlook.com (2603:1096:405:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 02:19:42 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 02:19:42 +0000
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
Subject: [PATCH v2 0/3] hwmon/pmbus: isl68137: Add RAA228942/RAA228943 support
Date: Wed, 18 Mar 2026 10:19:18 +0800
Message-Id: <20260318021921.75-1-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|TYRPR01MB13423:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9484e7-0454-4a82-989d-08de8494d015
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HHuezURJbcrwCTeIL3LdrJaX+mPQftzivpm/Wn4Iz0pIgDhv6QnmjEHWiQLUYZLU3zgzJjrqQlYkUNvcdGAM5H49uRYozXQkOo2HSqc75FGNacOng8C4hMjPvUhVZL2mdKl9A0zJQVQKfBJOh9D4taiYzEDvL7grIjp7mr0mK76dwaTyFS1kCy9XTOT2zQ7WbIoFJv4aux62E/2s9RrnvttKpIpp4wHFQWN1AWRR4vvUMFRskRXfGLxPQa2+LbhFWc0GzMmr5TUw6PQEliv+0YDXUAhopxzke74HDg4dLpcSkV7GQAwSl4yRqDOJnaPOyRmZFAkaCPkuuZgdfdYrQCN3CX67N1+1U0AS/Ae4oh84MvnXRzFmI1O9ZdskXChSmgmYDmra8yN4p/wFddDkrfOQr2mZydPWZ+wZdyVfHN2WiFd3u+WOvrkEB2KPTCSk3eC1mkUgcWakJNuoml+hxftvFlQVmMmGVktWlZJYhs7MaQUtkHIuulP3jJtgsIMccEOz1+6FT77F1QCcjournyIAPYiM9KkKVKKy5On4npPUQE8F1dldyAgENqR33C5FnmZU+zweLt9FwyOGkAg1Sk/V7h9fn9E6OtWg/945S5qz0vYvVW5uIka0CzAxHyGwxqn33yxStVr0ZROpfBYK/epimIMtggkIG1/9hvusS3vhKDZhsst9lqdbCEocu9ZkAJfnMtwJgb1LZ9pRgud+zWJIjyuh8LKplOk/VaZslSXSNao8yWzr2iYjFbkDfsgvqWKMFTIHMW5FFXByv1oomaCvUwFbgWAfvH+6+XcJLC4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cz2JYgEdw4ZwVjRtS2xkvs6pjmHqT7HPcUQ2mUjhC6gnFg0tvxGw/Wv0hOM6?=
 =?us-ascii?Q?3TAnN0XB0p7mVPPi5kSVX3aNOa7miB4OOewD4Z3lAjycNO3EQSXcJ5xFNT1d?=
 =?us-ascii?Q?ng0tCIatR253rrBi7NWjNvwERBg5MI7wAt/1XguPS8uZgrEcaReAcSKO/8rg?=
 =?us-ascii?Q?oP31uZWbxGBPjeo6H04IcQa3WKWNx9DSrpdxLcDeSIhQalcmNLHuhqrUbIPY?=
 =?us-ascii?Q?cGV78SohtzVwYDkdx2a/tKy5Ab/fX//S8esJq0lcfGPnFYMFnnzFSlvCp4l9?=
 =?us-ascii?Q?klSqyMD7sZCEBnvowPqsxJ0p6n5/UYqujUhVeq0GJjCEbF5hDgRvRY7HvjN0?=
 =?us-ascii?Q?Lta8qPFX0alkPYKFwuOw6e4S9DLw/AiifHEZD9WK2zNUotq4zob19EX9ivCD?=
 =?us-ascii?Q?T72E3mKrrTaOStvV/v11g9/P4x9f9wrgkFcHqr7pk/fSfe+NIz9OjR3LS52i?=
 =?us-ascii?Q?EpzHroVoE+FzDsMHYryCgJABq3i40R3LmO9apkC7Hk261kLoA5KtGJhh/kxn?=
 =?us-ascii?Q?myKWethvlK+V7kBuju/xmPW1O3Ab5vNSgE1RhygY7jRHPB5ORCrFC4VbZYNN?=
 =?us-ascii?Q?8l35RSbIU5TALTUmgXRifoW6CiDCHd0eKk5cnKCQmzhKgsnMEpFhsHzmHVWG?=
 =?us-ascii?Q?8yEmPyPiIX+n1d0IX8pNxmRLuViddCD/8VmwexqM6xBUQSeZVz6YBNL3lrEJ?=
 =?us-ascii?Q?7GYdjBrSz3VyrKnBsKRgnULxHo6W0LGwGDSWO0qTzlrdp87YTJ4U0xralllB?=
 =?us-ascii?Q?/ANQ7uxk8/TBhzRwpy/0X1PHstAKW9+k9J60mNVCo5MSm2f4iIRgU3keBBwk?=
 =?us-ascii?Q?07UbHo7EbMOfPY3nNbFdfAMtEXUtnfbJ8HxqxmkvSKmWG6Pd5q/68clPB41z?=
 =?us-ascii?Q?x6ASmlVd7T+h7Fb0IcexS1rQIwXJFak8vttfP40OK+pvEichSuGp6OhHInxd?=
 =?us-ascii?Q?bnrA/Qyy/G4yBYkXwMOJY7646AgjHdRTfrlb3+UFNYnWayS3UIB4tqs+mEgN?=
 =?us-ascii?Q?8HMn2b2uI/iZfn6YW/nXFFivmmbfAXrGtfD8AHLtJiAEp2HdaOh8RB8GL0tW?=
 =?us-ascii?Q?cvO6VqNMEuz9/1zYW42tXPv32G7SxKEoNFnmZs7O2ZSZ5TsH53rqFRtqGQfg?=
 =?us-ascii?Q?qJLUGXRec0oyQlx03JihUzka5eE1ZNvcu11nGO8m/kRT0NJ3vFc7nxGocJU/?=
 =?us-ascii?Q?ZeyT9p9HRftSy1x/npU6W06jwvs9Xok1HfQbVfOdwoPKieUy0tcKj+cFLra7?=
 =?us-ascii?Q?zp35JMdtgwPXY8+HuPa9Y8SttadvVJl4p1JJ2/NycjAav2X/W2GO0SrkxRhs?=
 =?us-ascii?Q?DJ+QMnaRidgyAAfKMzVxYb13GvVHCWdHNMyLinAfGUz5qP8xvLZcUPNQGmOc?=
 =?us-ascii?Q?oJ5uxmrpKBQ2QxJ9fAxWlvdE7MZbas7i6wrQwIgKb22q2R3jmcQd/vBheCzJ?=
 =?us-ascii?Q?8eJKO6ubWsxwOgbqcONXo1uRfdlsYdHTFvAu+UZItBjX8Z7VXDLhvkgKjzxk?=
 =?us-ascii?Q?CrCRfTEn8kejxHy6A2y0l0rjceZ75yShW7ZOS0zsmEaXu0DTevN2TJrc7i8/?=
 =?us-ascii?Q?v1/w6FeN91dCvqvLF0JuPtw910A4f8ZyRE61FzizDZfBUw1cZ4XKteS3a6AE?=
 =?us-ascii?Q?VrgzCk099guY7Q49rI/vXi4Ltak5W3dDOTWTpNaDC2UxhHyRUXx1v840EuDH?=
 =?us-ascii?Q?WLLKf+N+BdKCC8fqMuSm/kXEzXUhPJtHBKMbIsn1x3+NlVuVAVv/JBS4Pqg0?=
 =?us-ascii?Q?pA26B/Uaww=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9484e7-0454-4a82-989d-08de8494d015
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 02:19:41.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrGPmQgnM7YsK/c/rtkHEowzbO7q+ZIudibHVQfVT14RyB4YB0MYWW1MF7H6m++ZgadqZN+CMdqyWHeEi8OtNgPUbVfsK4i1QDrcCzjwDdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13423
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
	TAGGED_FROM(0.00)[bounces-29708-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 4FB8E2B5247
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Renesas RAA228942 and RAA228943 digital dual-output
16-Phase PWM controllers. Also clean up the unused enum chips.

Changes in v2:
  - Remove entire unused enum chips (suggested by Guenter Roeck)
  - Improve commit message to clarify PMBus command compatibility
    (suggested by Krzysztof Kozlowski)
  - Split enum chips cleanup into separate patch

Dawei Liu (3):
  hwmon: (pmbus/isl68137) Remove unused enum chips
  hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and
    RAA228943
  dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and
    RAA228943

 .../bindings/hwmon/pmbus/isil,isl68137.yaml   |  2 +
 Documentation/hwmon/isl68137.rst              | 20 ++++++++
 drivers/hwmon/pmbus/isl68137.c                | 50 ++-----------------
 3 files changed, 26 insertions(+), 46 deletions(-)

-- 
2.34.1



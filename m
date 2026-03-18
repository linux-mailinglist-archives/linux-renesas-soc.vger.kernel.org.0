Return-Path: <linux-renesas-soc+bounces-29711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECrSETIMuml8QwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29711-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 03:21:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D45ED2B52B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 03:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434DB30F8313
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 02:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF2526D4CA;
	Wed, 18 Mar 2026 02:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BQI/l3xb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77C25A2DD;
	Wed, 18 Mar 2026 02:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773800402; cv=fail; b=C0UEJ2gvW5Fx0JSg4RZG5a9DsVKj7KgtfZ1uJ6xsiTphgyNhcuEHZw3SJQNegLBbyC80yxHjVppMnCY8xYQXEWz1/d7hfOIjC+sXc2O8bLgs/q7M3FGRzAT1xnRWTIj1nALxPqUSwDa5633S4gTCOYvqS39f8LXQ+UnRO6ZEHAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773800402; c=relaxed/simple;
	bh=AGwASvWGSgi1zm53ATch7tFG9SeEToEjGLoCdo+4Eko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LOAK5XyMEi8bub0U8A2eQBuPQFwlxRU3tTEEjUc/ckskoJIZtsS7A+cXJ5+LkcggZdSyB7tQ/JMKBX/HATHCl24W00TkaoNmNgeTEuWMJ+0BWpI5kJQtuijHGXNA3Uty+DUiI/eciu4ceOIb85/0dEeZ4p6DlBs2k+qc8G95P34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BQI/l3xb; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gF94Q/v+XE90KhBOBImh4nhvVj2MgsZj6NMN34aYKGPNq3im9rTp6qonZHcjBXDZ68GJcHHpoZd/gzf++zuL0xtVIEhYlFf9oI9xT2iJof8d1sCyGgbLRLeYFO5Pj7ErdvEN1pF55caSShv5Zc2NUAt2CJCjMMwBMafqrEzvfEBatGqA6AfgFHSsVpGjZYvHmGJ3svgSbiMAHRShM+lg1eGYAcuSLBOkITNOeTt+StfSPIA+sfZgwg6VPxGUvy1sXtlDbJ056j146A+9Rt0k+/9HmKZ9cmKmT5Of+CWEfNuDXpultq1rNCV8hTjGUCYHz0KL8rpcQmX9S4hXAc3nfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9TkicQdrI5onWIVGoLIdDibZ53j+UE/mdRk2bDNBr8=;
 b=Cac4+P/BFEpuUPSai/YrM5uFned0POczRL5Q61nQs+hT6Ne+ALGX49E5TdiLOeQomi2mT+acAPZYYbYopPkfMOXHGCN2z03A6vNM1JGls6TBTi3gig10nsBRiyfzMmUCe8Ts/hAUQVRWcstxIIl6U4of4HvGEUb9xJdkkd7hkFbuAXIC+zrhxwYApvUMD9HtXkyYKy2YO3Z+sxUl3LE/paNOJiARrmBLfqkTzJXuY2rN6ykrIUWYr0/EG/9FJ7lYgc5jarAh7TFDHnNudA1//2XqBKOOaUpFfRkzSUYK5kUc0TIx18iXBTh+aHWoT7b8gtqUxtd7CpjynoDwBfqYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9TkicQdrI5onWIVGoLIdDibZ53j+UE/mdRk2bDNBr8=;
 b=BQI/l3xbwP1vBNye8ywhGTQ83L4p3z1jBDXNhHnU6SfZS83Iag4K0AOBUXtViZhI/VqJFDxCs4gmUzT7E/YWqNcOLPqr2v3EcPq068dM/q7t+gPPc/vOwUscqv0Zc7nDj+CIXZUn/TIr3Bve5buufkQvJYQY0S+Iln4z9Pyyhwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by OSOPR01MB12456.jpnprd01.prod.outlook.com (2603:1096:604:2d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 18 Mar
 2026 02:19:52 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 02:19:52 +0000
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
Subject: [PATCH v2 3/3] dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and RAA228943
Date: Wed, 18 Mar 2026 10:19:21 +0800
Message-Id: <20260318021921.75-4-dawei.liu.jy@renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f1856646-17f1-4fb1-2c4a-08de8494d6ac
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	J3UkWiRs2vLC7pSRRwfWhjwMJ017YyqzEdJPM0DKnY7tg7in/GFDVu4QUvqGf7TMFQEvci5raLCRk944SmK6NBiA58hxyziIzYxawAjxryRc3YsPGICq6GCKUjA/GDh0EgKehHFKtPzjmFsBPNyBOOcwPsUBfa75z7Cpv1Jvn5xbMTkJpr6p/jXZLK5ZzuegGEkJbjspHZ8JGEvWM0Ks2w5E32L9P4gP12avIT4MsuMX/OAsJt25fAyEkc9D4EDZPOgYNJpysRnTngNdqbrv8yk1/Tb21SMJUCIw+8z0/agS9vF5oOALOrxQFoIlVRcRcOD0KwUTrExFN9E3hi7f1T66Dt9nFg11Ec4g7+On4sBRKzDjkwdtQJE5b+MyulKEeJlXxRAqaCV3Cf5a7nOd9vsw4YfWnanSIgcVhg9vbzKZxX1M6+NSuYu+PF2xGYMyikyQE3pMbDxpVytU9UK/FzJj1SyMp4wYZZFziROPIe2R/nv7ghn9gUJjH8gbv3W85l7rPHQ4/T5DrP+tci9S6hqYCzjNctsX/rF8lF2jypeR2ncjleluws9fnpfAIoZGpr+OsIlJU7NoiXQleh2uBqXIeJR2D0TR9qYl8oYo+P8C7VmuXGvEkq1cTzdNLl5WwABtJL5GuViXKjhSBi2E06a7E3qnULEPx/VzEXazHTfM1nihqfupacxSH11jRiMBuh6mWkAtDXNzMtp1Clp/UcsQs+HbeRmuru6ey2gmQYa92tuGpzjvUJnqelFV4rtx0T+abGq3/xrPiV6yiIoobthnrE2wL5iy65O7tGTxAXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H+YBU3/ltGNDjDgcWNvi268ZgtqgJghALY6vUeUqAc5vCHBXHTydg1vvtzQO?=
 =?us-ascii?Q?9KIf+9pfkY6UNdIvDwEeEuT6s+A0gkDOjVX5ZxqZEyz662NPhECnbnVfRE6a?=
 =?us-ascii?Q?AXKolYrgwaBY6ThE2AzcaXfga7Fgkup5BfR54IMwz5MQntiC5PCp/DoI6VNF?=
 =?us-ascii?Q?Z+wyFmQoPB/9I2xF3WHFbiUo96h8Mz3FdMdlfnAlt/6M0ioYBaJQiPpaYdvC?=
 =?us-ascii?Q?CV5lUrrMwDo9wg+1d8ug6Z51xWSJwiScyMZw9npYaVf6IlU0xnSzFEsCRkFr?=
 =?us-ascii?Q?5OMiRkvEMF6y4CZO6z6ynmARofTX3RCh1t+IlhbmX1H9irRtCCOvF6hLNH0a?=
 =?us-ascii?Q?hInmTXi+9bUbJpmGWUODUAH+2sMTRlwq/eCI/t1KRI09RJEyi2e0XTeW78c4?=
 =?us-ascii?Q?6feAKdaWz3VTzVlImkoVLwbwUqzdnfyluUIUNsZUhFMwwt9evp2r/ewlQF6C?=
 =?us-ascii?Q?wZYg2s7SEpvx+5gbg+vxlpkW+bfnVhR1bkQwH8lrxXneIZlk6YabuvIllzev?=
 =?us-ascii?Q?qD5uOaVKuwXYB+28lc85u92nU6qme3mJUvVa0N1YmizD2q8Da8rVax6LYfEN?=
 =?us-ascii?Q?/hZ+WSqrbW5SlCLmIybe+eMJ6myh/UPr10AI1wF8xmvaKwudk6VGbjYLdQ+c?=
 =?us-ascii?Q?C/goAENmOEKjRVv6vuqKp4z9QVsiObvCXWgjx3QiB/Aads4Cp0O399+77+V7?=
 =?us-ascii?Q?Uu/m1ptiuCArsm3aZ83ARhlNmPpKvvcbhQayOr4L2xQBDUJV4JDQ+XTnW0zS?=
 =?us-ascii?Q?KxsilPBEU+CYrm7uO2Yv98xFoJQKA4CYTK1jkw4W7F3i6DQo9/DZaFkUSydY?=
 =?us-ascii?Q?QBB6RSq/mhrnDnBAqf430TQiD33SZ8j94fNUSzn/qXxAPmMiErHGaq7ioQbv?=
 =?us-ascii?Q?s81oMizkwfAKDF9PH5GhrOdvK/JtjEqo0x/DI2YCf+J9gfoOVD41BGoN8rd0?=
 =?us-ascii?Q?IRtQT5hVtoQKmbvhIrL0HNPEYFar688o4WEVSI6G1IPSqWSkA9dfV/x9GDV8?=
 =?us-ascii?Q?1ja2GKlx/kP8Ty0gifTM1sITMfIHVQmk+mnBTy6X413xnBCrkJNTn4z+dFY0?=
 =?us-ascii?Q?oNI1u86tlcP8ngIAyjhHqXBIDgoV7YPRVzHeOL7GDSEua6yG+KIYBwAZCKI+?=
 =?us-ascii?Q?/T3brW5cb1CLql/s3LFSB+S/pZ2doigI2QnE69vxusqtszQ1Yz4dzLMemS1u?=
 =?us-ascii?Q?qqtonOcChQO5WVAk6A6y4DCAoHwAqlfCmEq+9YZQoCdO1TWtAC4ath3kcsYZ?=
 =?us-ascii?Q?TIy+jbRQccQQzGiNfeqg4/HowtnjsHBn46MMBpbvkLWwxl1IWhUSP2Nkmnx6?=
 =?us-ascii?Q?9XDL/rhg20xqZ3cpacWxGM6TBxhMMXwnRpT6k92ynw53yplsC9fo+LVfZO/A?=
 =?us-ascii?Q?7qCshhnNxKspkHXZbsmmgP8MocfGnVhzkOeeXOsPBQZtQKhkexjhtvcYfgD/?=
 =?us-ascii?Q?hUdc5+UPa36eEuMSY+qrGc42GeeTzymuIUJMT9Am3HnQHizlVzyL/lfyHxvt?=
 =?us-ascii?Q?5dodxx7J/hn1hNPTiVdM0yBN1SdMt65Y9GzRSnGTItGwHS0w7xUONV73eVde?=
 =?us-ascii?Q?WhPciS7MDFSw5Nreu6QgKajv4c7ObblXuae+q5tXSUxGeR/Qt6mDDuAiuO15?=
 =?us-ascii?Q?wMbRA1NDkHnSd2jRrFme5bafjvpDqveFx+RIRQ0rD/hERcNkr4R9qdwUCsz3?=
 =?us-ascii?Q?nH+TmPWhmnSPNlXDjfPhkxhRfSJ29ubgU6gqVduM6wDmfOk1ygoTwMEeV5mx?=
 =?us-ascii?Q?uNFFFWgWXw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1856646-17f1-4fb1-2c4a-08de8494d6ac
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 02:19:52.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9zqmGy/UZNlVLF4fgnhOcbrqLR/TzHWnJDjGbDvREEoZ8bSr5n0/zWCXJvfOWCdVxnsu/R+dcRCHHznNxLq++OzObVNX1Fdv8Z3/n1bQ7Sc=
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
	TAGGED_FROM(0.00)[bounces-29711-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: D45ED2B52B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RAA228942 and RAA228943 are Renesas digital dual-output 16-Phase
(X+Y <= 16) PWM controllers. They are PMBus command compatible
with the RAA228228/RAA228244/RAA228246 family and use the same
2-rail non-TC driver configuration.

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



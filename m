Return-Path: <linux-renesas-soc+bounces-30201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEutKuRkw2mrqgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 05:30:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B6331FA73
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 05:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D3FA304EDEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 04:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8B02FF66B;
	Wed, 25 Mar 2026 04:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TU38fqOF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED92EAB6F;
	Wed, 25 Mar 2026 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412278; cv=fail; b=E14bLntYJ87jlGEr94lNGXwGF4c1vccnqe8eL9MVNxl/OaG3CUH55rFlp7M0eHIhAp6TEI7to1bUD1Y6HdbjdtikcqxkSzFTw+ZHM8BgEN7n5inxqFlFu1dxDBOYRbBOMumOqGU86+TfPnIHz3Twn3VVMCaueWQ3sP6CPD3UvDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412278; c=relaxed/simple;
	bh=8ooQmzCwzyeSXRfraFavjzhSTlOV6JmLu+YcJG7hnfs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rDC2PDIxoIA1cnCl+y541Z3LHgDntdselh9LVvjS1Ell7L++fP9xWhCfF9pPdRM2xTTuzn7NHkYr55E9sghNufK/vkPiwtcDtoA8bdShy3EtmAfJ2yhISGiGR7ALu6Bq88/107lJVUWNxuanYpTXZw30oc5oGVeWd2Saa1XHP8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TU38fqOF; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCK12XWcyS4HDEIB5Inm0ggqjRzEgo/1qtntD8GyoiEvljQ/J+K/Rt+XHgWthV9NpIF6KqKzErFyFyr5Gc0tYB81u7EMyC1eHFZYIsJIXLnxaPihdOpGf3sXoKZn9Xa5kZTogHmAlcqd7ZY190qRlWgf/PVjZRRIdVzW5dPS2gN/tHbd/xEd+GiTHBDylEtpUMWm67gzO3pSMxYRJRhT1RMXwjCiA+zCyV3Yb88JXfQylxzcvR9PlQhi4AxFaFuIwCXBB8gQb+vLhxMcnUMJmUI/UIGFApKhUxd4njxod7TlhFQPSeITQK8we3ceyBF5VC5erKJMfY/L4aBlb1UMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbLFRCss687QmsVWUKekgt26ab7unoqf/DXpe/JcCr0=;
 b=C7HmIC26sWk/nrgB4rbRsyRU2kU5cbFsghW/AqBA2WGZghFDnRd3LJZGRl+rTabmSyyFACPMPpFsBvdfOBbdYN9ypXmGQXvwljHtvNV4hwnBZ2PDZcOpaX2BcM0sx3iCtvXZQe5BimRUlNewo+ncfRDEw1iv+UDI69VHwRScadPxwIjfPua6UmiA4D7cro/RYPlnlBpa5ok2c/DKJD7+JIgiCVjxhEfsJkPENkH8efrmC+gY7rnMnz89i21/F5OqEbsqR6N7u/jva2SdTIhqsDZacId/uLAqHZlzPyGPT7vh4MUZxujmeznDC9tcdU89kUsX+6KyD9us5yZOmvaC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbLFRCss687QmsVWUKekgt26ab7unoqf/DXpe/JcCr0=;
 b=TU38fqOFg2Q1q2Rj0bLxYl+fmxKWbaiYlNzDhQ3rZIwITeLta6GR9dCsJGhwL6nmfDUoEBl+OwIzx8S96b9a0MCPNDS2OIHQnSFN7XHtxMa5NCyCRrEEdd8Oq53ukom3vtzA3J5320gs31NX/eGN76LnBw0Q5hf4TxV3nRzqOnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by OSZPR01MB7130.jpnprd01.prod.outlook.com (2603:1096:604:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 04:17:55 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 04:17:54 +0000
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
Subject: [PATCH v4 1/2] dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and RAA228943
Date: Wed, 25 Mar 2026 12:17:27 +0800
Message-Id: <20260325041728.68-2-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325041728.68-1-dawei.liu.jy@renesas.com>
References: <20260325041728.68-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0011.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::17) To TYWPR01MB11935.jpnprd01.prod.outlook.com
 (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|OSZPR01MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c61df6-cfa7-4248-c1eb-08de8a257cd7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3cUEdUeo6N/1ms5W2UZsurJZRmyZ9A06pBlUL+xz6tl0ki88g0aZbV2Ku/gUP5YPCe3mtkZ4xVEq4JXuTHXNJRMC9n97mZPbZvV92/7k3BXYlOKQVxcueJzK7/xz6B4Sifesg5jCQCSSExtSIlpCqj38kSVxa/a0oe6mdQiTLq3vjnYLBdCPhqTupd3YazIir74q+ayHyLldVBJsz3rDQ/aJCYerPwAAqhHmz0ytV77dPtkXKNiWa8er1sd+MHB4WHmZIjrbZMDmtYVTMhzj5EA8C/InIKKs9hwx29Y6VjP2rcKMk2oRZMphnYOelM3tuG2i4K2hbfxej60hFU1ktHy+vIDVK2LFZavkIM6mzKy3n3ih7XsdzSCcTJXdRWAUhhdiFzrKLsxmaB7eOZ3loWTx6y5WgbqiyaElEdy32OIHb+7+y2iYuNc5jJbGt1XqmOM+5UbJn9URaTZTlDXw6E8rjpgYPuP4oUJuhXodvxl3bJfL/2q1ZTTA00bgzEtMGE/rLgKqT7Q9JWc5n9WYwcljJ7NUTeLF5h9x9sVUQheYPv9JeQKPHeIW5g1eg4vrb1SvvJ8m6sWerqpNm7NBq1q5ktvE2zPqM1rGU4ib0CdgpjYIyVLsYTYvppPPfWw2sLvK57RXaUX7mAw5ohSQgi5y0YieaS3kseo890josR9cCXky+jgMH0o7CITUIXuWMsUt2nmIQI4nbOpWi3BqgjDAzNm0HbbSMbXndkoxhVMvB3sZ6oKvhbUiueBn3hvH2SeV4rwqkTHqC4plQlDm7JFN02pc8nD43uhbGuFpeX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PCuNcOfiDYj+VxQ1KFHHwqxCXMuUxeNHG6Cx82G2ilxxBn74aHjkfzJOZBpY?=
 =?us-ascii?Q?qdTr2CWS7+qhN7EW8lCWyeth2lK1ywG2EEn++OTeG/uLx55zuNTfOUD1roRS?=
 =?us-ascii?Q?CNmkSY/l7C2LRwdAeMP/8tUU0427XjzCHDEo6SQT+U15HAw5x6InAk8TPkBz?=
 =?us-ascii?Q?h07xBSYBay8gIr5oJmEyYlpCBNKI/wZuw59020h6cu5tV7CS15WY0KzQLVg+?=
 =?us-ascii?Q?FkEyEMN9jWU3hsFkUxCgOnfT4sB5UMjBqbC51ho3RWFw+zQBGdKxPwTdPZzE?=
 =?us-ascii?Q?E+ne8hHictmholUfvisngVrmLBxQz5jhDFKzuAVNahi5EbwSpUzloo0S6NP8?=
 =?us-ascii?Q?OWvMG0yYvbARysSZ1VaWjFY1YXpSXCdy4FTneadTLeA0JZlmF/Y6mFyCHdxG?=
 =?us-ascii?Q?4zigTNzguDMo2mQGTGib0DqM/vmt452Zfm6bckWWd/tqmSUV2pvjJ2UwJlu0?=
 =?us-ascii?Q?yZdA6nORHzSG2f2bM1JbKiicSngQaCEB89uAszQ4J+TL/+ZDPwojhksx+HIS?=
 =?us-ascii?Q?lV0gjEGMQ5eyOzZKlSzMmfeXovaKx1uEUKcAwnLHhpjNM50kQExGGGgd8XPW?=
 =?us-ascii?Q?V0f+0yjQ4Hp7RWnZZ4iR9AG2HOGoqc5Q7TJ8ZmEYlHhUImVUlYc8OMtrv5c+?=
 =?us-ascii?Q?p8HFhGKTFpTzMJUnghamfIB5H4NsO1ZZgqdGJaB3ntwDeym+krtUN9c6abnb?=
 =?us-ascii?Q?7XRkh7jNnMDKVc80fCUiT8iLAPRdY+1Io6Hza98IWpFzRpSD8eF8d9CvJPYL?=
 =?us-ascii?Q?Saims05yGCDVdm0v8NAf1zPMwIHT7aArZdh79fOdO3ZYoBqhsivDHLcQZJO7?=
 =?us-ascii?Q?b1+SV+r+7oAweeIbhAs5Pgg7KMPKZa5QKYQL10WN/rhe6fbG6Jr+o5e47Ldm?=
 =?us-ascii?Q?uWbsIPs/ILarfI4faQmxk//putUncrcXcWNv13NJXx3v23t1L/gqdMJrLlf0?=
 =?us-ascii?Q?vfoWYotuXeiw7d7joBhJZYdOLK0Yrz1e1udrQOfpbPiAmFh8Ay2GTeVOS/Wc?=
 =?us-ascii?Q?ddEfBqfQDiVKjfn6H6bU5cSuQvBaJvIPP4TpbiUbkN5y/PAhHHFTfxpzN79Q?=
 =?us-ascii?Q?v3k1mow9TawWBaSyU0qiP+t4xtGBL9m4Upvd74Bo1fnCD9F8V+lBNyvHpNuk?=
 =?us-ascii?Q?FcoZuYkTSochcwuJKasRpclCgc/LdFBMu6C7bMZp9Ye7CS0gu8lrLFpiRic6?=
 =?us-ascii?Q?i7ZQbDMiNSCDXdEWLeg+xdegZcxZiHN6g3ryDfHUnDNk+9YIktWX/L/81w0l?=
 =?us-ascii?Q?/Ttif2lzpbIB02nknMHdppamYRT5vGH6DUjg4QboTFb37sQnF6XcVME4zD8b?=
 =?us-ascii?Q?MM7DLPcUFVQQS5luQY/vLE2I7HiR5beRIQzbGcJYOFf9RRJ5UyFZkdjBEvVQ?=
 =?us-ascii?Q?s4gZg5U1jlgL8CqOhrOLjVhwka0Oyv7WejSscFR+kSCmyazKVkVCiJpcq7A1?=
 =?us-ascii?Q?Zouil4586+AigWt+SDIYpzsTWS64C37KRAwLJXv4ZtHyNURakG2PcRl33Pmw?=
 =?us-ascii?Q?w0tYdjU6xnGc6eDOhUA5tpv5Lt3ZCOrsyctn1RQVqWBH4h/ixz9zGqutnBzV?=
 =?us-ascii?Q?8K5A67GthYZqFy8CaidHuJkMBiiMaCq45FuwOefZbRWjGydRXtL6j8Dkt1U9?=
 =?us-ascii?Q?Xx6CXjRRXyMVNzVxjFwhXzINmDE47LHJOV2+JMBqxZu6s5qC0Uc3j2XudHwG?=
 =?us-ascii?Q?Z7ULomdxTW5ZqUUwCtZ7naZhLj7FesKrxD878m6ZTdXYa7gXImVDpKeHxBYL?=
 =?us-ascii?Q?WhNX9RcdYw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c61df6-cfa7-4248-c1eb-08de8a257cd7
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 04:17:54.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RufME0RUUAZUgffA2i/cc12d5epdwRdmInVxJAzv1mF/jRJMJTmP6wplYwGo7Pk1PFik2BZumBo34vBm3FmvubQY/6FZZDarQND6jIFuGV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7130
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30201-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:dkim,renesas.com:email,renesas.com:mid,0.0.0.60:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2B6331FA73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RAA228942 and RAA228943 are Renesas digital dual-output
16-phase (X+Y <= 16) PWM controllers with 2-rail non-TC
driver configuration. At the PMBus hwmon interface level,
they are compatible with existing 2-rail non-TC controllers
and use renesas,raa228244 as fallback compatible

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 103 ++++++++++--------
 1 file changed, 60 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index ae23a0537..05aa667be 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -16,49 +16,56 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - isil,isl68137
-      - renesas,isl68220
-      - renesas,isl68221
-      - renesas,isl68222
-      - renesas,isl68223
-      - renesas,isl68224
-      - renesas,isl68225
-      - renesas,isl68226
-      - renesas,isl68227
-      - renesas,isl68229
-      - renesas,isl68233
-      - renesas,isl68239
-      - renesas,isl69222
-      - renesas,isl69223
-      - renesas,isl69224
-      - renesas,isl69225
-      - renesas,isl69227
-      - renesas,isl69228
-      - renesas,isl69234
-      - renesas,isl69236
-      - renesas,isl69239
-      - renesas,isl69242
-      - renesas,isl69243
-      - renesas,isl69247
-      - renesas,isl69248
-      - renesas,isl69254
-      - renesas,isl69255
-      - renesas,isl69256
-      - renesas,isl69259
-      - isil,isl69260
-      - renesas,isl69268
-      - isil,isl69269
-      - renesas,isl69298
-      - renesas,raa228000
-      - renesas,raa228004
-      - renesas,raa228006
-      - renesas,raa228228
-      - renesas,raa228244
-      - renesas,raa228246
-      - renesas,raa229001
-      - renesas,raa229004
-      - renesas,raa229621
+    oneOf:
+      - enum:
+          - isil,isl68137
+          - renesas,isl68220
+          - renesas,isl68221
+          - renesas,isl68222
+          - renesas,isl68223
+          - renesas,isl68224
+          - renesas,isl68225
+          - renesas,isl68226
+          - renesas,isl68227
+          - renesas,isl68229
+          - renesas,isl68233
+          - renesas,isl68239
+          - renesas,isl69222
+          - renesas,isl69223
+          - renesas,isl69224
+          - renesas,isl69225
+          - renesas,isl69227
+          - renesas,isl69228
+          - renesas,isl69234
+          - renesas,isl69236
+          - renesas,isl69239
+          - renesas,isl69242
+          - renesas,isl69243
+          - renesas,isl69247
+          - renesas,isl69248
+          - renesas,isl69254
+          - renesas,isl69255
+          - renesas,isl69256
+          - renesas,isl69259
+          - isil,isl69260
+          - renesas,isl69268
+          - isil,isl69269
+          - renesas,isl69298
+          - renesas,raa228000
+          - renesas,raa228004
+          - renesas,raa228006
+          - renesas,raa228228
+          - renesas,raa228244
+          - renesas,raa228246
+          - renesas,raa229001
+          - renesas,raa229004
+          - renesas,raa229621
+
+      - items:
+          - enum:
+              - renesas,raa228942
+              - renesas,raa228943
+          - const: renesas,raa228244
 
   reg:
     maxItems: 1
@@ -149,3 +156,13 @@ examples:
         };
       };
     };
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      regulator@60 {
+        compatible = "renesas,raa228942", "renesas,raa228244";
+        reg = <0x60>;
+      };
+    };
-- 
2.34.1



Return-Path: <linux-renesas-soc+bounces-30200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNhPNPhhw2m1qQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 05:18:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE7C31F987
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 05:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A0CC3014C72
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 04:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06E82EA72A;
	Wed, 25 Mar 2026 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hdmNrSFE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9631D130E;
	Wed, 25 Mar 2026 04:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412276; cv=fail; b=jwHawlY4/G8NpMEudIM6AIji0k2KaAdkZkAjo1uu33PNfOoiNVU1Xq3AyCk0/DRf1aQXDhIRExx1UBE+YHiv3WkjHM0FlmA2dnh8wKg2BLJVA4Y7pGsAC+4TwaXdRyNt1r24PQKi5rrbk5cxo9YxjcjCit9Wg10eXA9bVBLCMFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412276; c=relaxed/simple;
	bh=PkD2x7MqauFiDZ9P5c42O/D2+abo0dWO3AEEtrzMIcM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iMosyEtWdu8++T9AJJfCk7sWRXYA2V1CA0sePTXS8hx38OEC6IZWjGftvL75CoixPPvFb05QChAwl9LLnaX6vVF4NZd1Vr2fbyaRDbVXahWiSv9N321cRbQjDDxy6mdi1WRO55SdwMSOa86UTAs5RAyglt+TY/lG68oyLInjG/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hdmNrSFE; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNSQyXlcvv9PSYtVHxaMTv0WHHlpKGwmJxTgERU6U3yc3g/G5T94To7Bs82qsRP+VBwV3M2N2hL9MBfy2w3ATHH3oRyW5nVtHdE0m3Yp75FW44chBVhhUkn2VDhoZEzUyzV1t0rXh4hYhfHzCnE4liQIHH+o0gJKPg1Wky7LqHb6so5bbAW7bqno6xn8kodm5PUMwH0qPxRhjf3pTIuypdoLq9gP1+IWv9BjiRGsuk/UZOv9vwCOKM8WfHfEmiqbReh/3g0OkT6N8P5r8eIQ7QVMuObRU27tZwkQ6Z23YSGSacozOOYCN4QeeKWCYOy0b7w0FocsvWdMIjtfhWUKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvEMHqg5Q+QzE+2ijOYsLf7+sZp0GjnE0S25D99JzFE=;
 b=xGmE5VZyu/0ytnUHhUE7dh3sy47r0Rw7KcgB/xnTV6GJV4qybNSvl/KwCBWHc8cLpQByE/htyNEvxM1gtKIPB1mkAlso2QshUCXLytdlxB9TCJ3Sj/RoDnurCNtjLsH4MPMGwQnhkaiVSdaYNtEllVnzQQegFL+c0mmhM1mIDJ45qu/IEW7qL6t9Bt0/IRJMxTOkK+Zk8VKiKP7bCAIUXV8d9qUT3IGujPqDVFslF95ZamsI1Z6pgh/IldTP1iSmJNUEP2e6CUMqGVn2bG3ncIa0dBUUuoFkLR1AgdJguwWV4Y7ArCwBcaEd8vWhOQwbMfHIIveX5vMSSGeZCwPf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvEMHqg5Q+QzE+2ijOYsLf7+sZp0GjnE0S25D99JzFE=;
 b=hdmNrSFEHTBAedeEJ4OXQBDtzc07yGJ2QfN0WMbQIgIBYEgIGArbXx46h9oA9zwK2EaiEWP+oXN65z2KuYqH3BWAgxt6VviKT0jWponzeUeFHKMPOsV3YHkkQfrmRA3p0Nn1qNX7ZRK8UOmO1ekgK9NJdyM7NTYHAP9nBri97Hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by OSZPR01MB7130.jpnprd01.prod.outlook.com (2603:1096:604:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 04:17:51 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 04:17:51 +0000
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
Subject: [PATCH v4 0/2] hwmon: (pmbus/isl68137) Add support for RAA228942 and RAA228943
Date: Wed, 25 Mar 2026 12:17:26 +0800
Message-Id: <20260325041728.68-1-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 205a4f59-d77d-41e4-1766-08de8a257ac0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v7zPTu1pQRxLM4LfqwJjL7kN928clyCoAhsE6wBmcYc5GYrGI0+PW3OpQOk8lyX8jJVMX3giezSFstyLDuxBirIbPsn0CuaEBwiKOYcpdVpfL2eySH7Y/B3Md+8jZZWLYMWsUTlVOSwker4EcuSQkSXAes7QxtiZX6knXIqDrXuNmNRBH/t/Ww/6vDUoKzIgI2+M767YnDuMml9YAKAARJ5XUupM4VyXBVzK8rIlY0eM6FTInbRgCblchwyyqn48Bk4a4dVuLIqpbupFre58uamQ0yQEZRf7qwMkoURZVyYbMELogo32gSlQmNoUpT7sDMw3hnl2nl2SgmQnbVAlVVNwzGUo7UbXsYU2qSDYfBqpfTES4FOZXoGBRgTyKw9xeCs9Acz7hG5tSRUOfbwvi6Vf7YiKCWoE87D+L8oDxWnkYh4Ee9uJjXNGKV892iFWrIw0GXNqViGjvq7UEQ9NlRpiYI95L9gaciiKTKlJCsukPNsZr8YE4HZx0YYDMJyjsALKQ1UapcdSPp79TDnCb6hWNDoy06BBGx5VOsY7vhJYxMCbRx2oVGzCk1M8PYFu8CvTEBwLDH/9w94otLbbNVEd9cYFewcgAsaD0P9MDl40yFCMrjfjB9/NIK/on3UyXun2RDrfSVP8tG+TPaB7U98fKuVybH2QMJ3zGqWpHdL56X1SujrzcZy7GS/N1xYb7x6iqRzPkYmRfflcc9MAWGCZSPv9PLC4VwYlj663nFGktEkvSNgG7UCulhd5HboJmITjoyene+g8fO6MA3FJiFutIMuEHVr4Tq+SzC1nvLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+bt2Sb7k5f79y9ndeqIxf3ZUWuQdun57pCptgNTB+jneR0QNYogpHEPviow?=
 =?us-ascii?Q?9iPX2Vc8EUM85iP8LPgsa3tGLJDUQuafCJVk4KJOjRLIzBCOALu41N3QrW4f?=
 =?us-ascii?Q?a5vMfQxkrQXwcNeNTMIzwPe2vYxZ06LnLCm/BAH1nEVgTaXFRBlisCiTL+2F?=
 =?us-ascii?Q?RdmNA71O6b+4ETclbmOqAiP3ek207YkIpXmpzxYC6ER2fdZs3SwXKHi173Xi?=
 =?us-ascii?Q?Ve6PbnxHeEt5q1QkHzw7+PUNWBELYiIhOFwTaACc/DeZcECiDlnGjboYj1Hi?=
 =?us-ascii?Q?pYaHY+vHk2N+R5+Yo281FMSXhnsGgK7tk/v1tcIs2LWx71SZiCAQFmsyHiTJ?=
 =?us-ascii?Q?wW1Uu4VZHV+mM/WtlkAMgZMp0wbYVB2m0kr0TNDuaj4OBXT1OiI8eXH9IAxO?=
 =?us-ascii?Q?3MOmfEvlMAftN+84ob/3FV8McfkFKiWAR7xZZnfR/w9p/JopI8PehZte5FhT?=
 =?us-ascii?Q?TLXCHdQ3xYRUAPIw7SMmP4Qjv9/QfmgXVpkXb0SOmosYotBVeKUvFuPnTx5R?=
 =?us-ascii?Q?8+Y/48D/JZSGsZUwv056gQQZ5NBNC9JuygB4ij8RROQ41j7OcmOzhZxSV3b6?=
 =?us-ascii?Q?xk0zKcj49bHqi97TYjDQKujums4GS3itBbsszfk1CgMpOvscy0z1YDCmqmSv?=
 =?us-ascii?Q?pUIV6UHo4Q5xST3rBpbkl4tAqzNzPP1Vl+VN2dC/uNFm1oPwu+y6e9rMhup+?=
 =?us-ascii?Q?H4QQCHTqjVJK9o8AwZuO3Km7RbIY91O3jFu8je2wK/JLlahIdOOXIZYhf5sL?=
 =?us-ascii?Q?Pii/nfm8K5nHevU8DT75hOKHpZDfN4td0D0/VcuLNuFS1BqfMfGtLE5pTlUa?=
 =?us-ascii?Q?Ua4Xzo/09kZy00wLheQpb+7UhciQyNtoMep6uwvQz76UYioVMLP7hxoelB02?=
 =?us-ascii?Q?2ovfoQkMJ4wXKJKRiX5Ot0SZIqAYsYge6KIRSRsBoGW9QSPvu5xH/2dpW85J?=
 =?us-ascii?Q?9t/kv/CCoSmv73n579G1bq7sC0W/QYPp6mWmRy8JTX2OOJUzAMzrCzJm6f/G?=
 =?us-ascii?Q?YtWEOqhYbf8fPPruvrvP5WTwfu9IFuCb6t3PYCHQDoCbHnXiLBcrKj8YrTKQ?=
 =?us-ascii?Q?w8C8Mhflw2gnzBjICWdgtnJbDumAWNcci9FcQGjXoPuYS9DdNX61y/JcV34o?=
 =?us-ascii?Q?GIBT69j3AoiJE95KbweYOueXDNJxuN4GbTI6FH4BANSZ+l/JXv+aRr0xY0nn?=
 =?us-ascii?Q?2cY6437OqvpzUfk3gwN47Nt6711MSa8temg9QRd9aGdZkOTxS2Acba8C15Di?=
 =?us-ascii?Q?iy+dxdN3Zw0mSvhbvapf4mApBueteFE5pR4aPrL+kYI1cMZsXrtZZq5G2eRU?=
 =?us-ascii?Q?dduCvAo11p2l7zvzt+skyqHIgNmhXNq5cwc9GLJ66Nd5g/VEnRWxOwMXwYWe?=
 =?us-ascii?Q?6qEAL/A3FHhWB0EJkxUZiDMJjsKTBwt5if5DBAOeoj21p/l1efPoTBFChIcc?=
 =?us-ascii?Q?SFoQ6Bq0HyrNGq5DSU8u7YBLjSc3Xwi1HniADVsD1u9Z+1xvOq5C2MImzyC4?=
 =?us-ascii?Q?e7BLlTIMhe2/0+jcsFX8xnuvi4RegmSxqx+NAx1EQnUnq0qd76Fq4HvEE0ci?=
 =?us-ascii?Q?CwiwBvV3HVaDE5B+yqpfOcN7kXux5mfs2Tieug6E+LplOyshMyolTgh/dqLi?=
 =?us-ascii?Q?fCyBH5EqG+lt5G5MpiZMbHB4tHFgnJsS4ZJbo+TtOh3LSfrs9aMjTqvFlRRQ?=
 =?us-ascii?Q?QWhaAjqwV5OcGMwzQyBOP/3F49LUs1h7yd6uXNtHzdt1lXqXLj+CntcXQyIS?=
 =?us-ascii?Q?GElsqP6bTA=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205a4f59-d77d-41e4-1766-08de8a257ac0
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 04:17:51.4300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Mz0zrVyfzPEl5rfMCj0zVaMNG1SJrLMPB0wwGGwGXAzkvxF2us8SGdyY5Ph9+DVFSdhDchnmUcWsr8kzxVjWTc7jKB/BzROSXloMlDi9k8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7130
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
	TAGGED_FROM(0.00)[bounces-30200-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:mid]
X-Rspamd-Queue-Id: 7FE7C31F987
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v4:
  - Use fallback compatibles instead of standalone compatible strings
    (suggested by Krzysztof Kozlowski)
  - Reorder patches: dt-bindings first, driver second

Changes in v3:
  - Update commit message to clarify hardware differences
    (suggested by Krzysztof Kozlowski)
  - Drop enum cleanup patch as it has been merged

Changes in v2:
  - Remove entire unused enum chips
    (suggested by Guenter Roeck)
  - Improve commit message to clarify hardware difference
  - Split enum chips cleanup into separate patch

Dawei Liu (2):
  dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and
    RAA228943
  hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and
    RAA228943

 .../bindings/hwmon/pmbus/isil,isl68137.yaml   | 103 ++++++++++--------
 Documentation/hwmon/isl68137.rst              |  20 ++++
 drivers/hwmon/pmbus/isl68137.c                |   2 +
 3 files changed, 82 insertions(+), 43 deletions(-)

-- 
2.34.1



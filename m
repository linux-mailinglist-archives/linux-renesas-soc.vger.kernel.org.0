Return-Path: <linux-renesas-soc+bounces-30447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNAIK1PIxmniOgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:11:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C5348D8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90C9F3020FF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A56833D6E3;
	Fri, 27 Mar 2026 18:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j7rpW6uY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1635F33F8C5;
	Fri, 27 Mar 2026 18:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634995; cv=fail; b=jmYvXTtJSVZCz0vbZd0ZHZhU0yiteXLSqmkSTCyyoQfNefIdrbqE0wmdzOWggVoiaKfEXjAnGMxSjF4Q1uw0f7OcfUUE/mDbN5K1RkrZwlyEGJ4lBPgsKmngpDmVrPC5yUWKyW9zqN3kSxbC1NcOLBgEJyjqBVJiWaGhNDbxo6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634995; c=relaxed/simple;
	bh=rglh0CYuGfQ7+y+wLWE8+2IdyqW6pmomGeUz+rtdLUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TDl55fQQYP2g/DvhbSbXzt/y7zsyNPMUEpn+m4SGP03ueXQvJZaJZsLhBLqNXHU4sTDLgJb/WPERtFhbC4K51h9vAriRlz16FjEeeZXQgXC60k0ohy9NRuk5hLeOVMdcdd9A8fFrNRWdTtMuGZGvR4AlVr8cP81WW89CE3UlzlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=j7rpW6uY; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SirtGduNvuljVsGeFKT5Or9HKDyfArkPip9Uzjegbe1c28gUPYMccvfXoQTN55S8Sz6j5yVwrY4FKOXKj8p+LmetD5WoEol9aGunUgM/psgQgPVy9VnnBVfpHz1SF83OXqNCM3s2RPwxBHeX64Px2Dc0fp2xEenmjy046Wb4x2kFfvoJxtPKdyjPK5ddtql3khPN4pDsqX4G1MIQEuFgFa4rG3lnWSc7W+4a5uJokBpVca1fReX0uduUzIUH7T5TWADQEN1v0yl+AUIAzDUCXdzwdPTjsQmiPPHEiKbkU9stuAW647SuZItXkJcVi7v+cnFOmwAJ/FoPpODDCFDU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro0qxBzAuz6o/8zO6n8HNp8drgzDmZxCi5bDu875mlM=;
 b=jlwSTzP+0p/3yPnrgQMSnqwfoQ/qmAQZKxS8yncjk4YjEeSSdsxDr0j5hvEy3JFxEsjh1FnxgZegT+LlGeo2LVwy+FqzJcvjBC6fK4qEQg69JmxupC5JRHb/Zy41Hpjw07IKLJgrIC/o2/AU2flWpSWo2+n9cLaTqOdKkKDyEvjuKEb+pbvjOgWkWfC4BEriM9WsjWieslIl/daQPkJYMXi7OM/6Dea5NV6IpQb3JFqDOA0EyOr6ElAlfRb6obtmq8mdW5racmbWCOSWfyEldrMjKzo5RUh6dZD8WlTNy+vHnTlM7gpPLjLopqMsEYABYRDPzrJO8E3RtuAR1nE1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro0qxBzAuz6o/8zO6n8HNp8drgzDmZxCi5bDu875mlM=;
 b=j7rpW6uY9vriD+Z3EuhaIY1yqCRvy2AMPJ/Ufdd0/pGZ6RTsTVdRVJ5VN6NyWIl+Rw1G3V3PjoBDZX++KxKKyLNHeTyNv36wCwoi/1t1fKRM4cQu/gWaJfyr2/YH+sEEWgk1xjZvvBJWK3RqAhCw/+BYG7dJDJ5ZdkYShDmvIPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSRPR01MB11662.jpnprd01.prod.outlook.com (2603:1096:604:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:09:51 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 18:09:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	peda@axentia.se,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 2/6] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
Date: Fri, 27 Mar 2026 19:08:49 +0100
Message-ID: <fb2e61883521bf82c7e4b697c203e8b93b9c890a.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::16) To TYWPR01MB11940.jpnprd01.prod.outlook.com
 (2603:1096:400:3fd::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OSRPR01MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5ef91c-3618-46ce-c4d4-08de8c2c0a68
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rUxXN6TSQVF47ak8jTh6wyEC+/cUf7WkxzejWgl3H0QHoMLf5hMmQF92KmChawbOxRN63ciQq9SLP6iEoj8Vo7o3QmZdlSUPRAKeWJS2kzCCkOkaNFK8mm/TZqRhs4Zj8qf3nJUG3alfuCE89U//fd319ulgHG2agSUVzBjfczGYI2Gp7t55wkdwaDpHLffZsPccimRgjhoFxJPLrAy06GhW/L297A9Ca/Z+BADd3XnKTaczjh30K8ipPwxNHgWKmiZXqbL5dDND3VZAaOwPHsgZMWJe7unkNrdJV72O95uEbC6YffgIikjZ3xBl424/jsFNBURJhnXdbLe4UmDmEjkAup3B3v7vsPVj13JnzmCFbYEgdX3oBWk5AKBaba58nMCo2auVJzkSpfNXQD3VeYjyPOvtv1vBfKfSYsNCHpRPaRl3YMbjqBdjCv50x4TkiuGyTRm2ixtnWk1AtGPZJ/xK14jvoAD8BkRjorh7IcKofdJF44xEjZinCMK+E93wBVuAx3Qx4U7c3ibaQf/swRFTrDqWHdkA2eYuySNciRQnfLngYGOobHmX/NuRAovQqpNvXtiftS65Jos8WYZIpvddP2EMKkEbRMt0NH5QMVw751BawPZaPAWuaRyjP0Hf5ukTgcbyeBW944pnR8Lg3tqBHcAkwfi44bF4oEK0ogJZb+qbamVI9PAafrngeE7en5Qssp0Ob+8P6gAhvbTB9I10d9fqXk4ZY9UJ/RWsGdWm4dCEvM3JaAR7YssmZj40M0KNHVIRALzvMQERt1BQP5Y1dleDWVhP4LE9glGkdCg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FpGxzAzEr6Ij2FCQwccjW23es4MDRPV/dLue2r/VKWYlQu2B1an357dvdwIf?=
 =?us-ascii?Q?I+f/7BiOXI11f5M+cJZRA0uAzIN4X5yB8nQoWinroXcU6qhEZMvXuiyy1BSe?=
 =?us-ascii?Q?s8uGNSig0OnEf8xM90gFBMcyqC1t+Ephwz946C/rr+oPF6FXORHOsXveUgiF?=
 =?us-ascii?Q?VjGwrrMwrPQc10MkKCiK+3dwZOXopHvbamkLQttM6J1ryQZdHK9Xs2NNhyLp?=
 =?us-ascii?Q?Lt1DPNfDGbLR0G2nnAD4AcEzoBVmYXCdPheyh92St0iYz+jfFVoiTKHRgACJ?=
 =?us-ascii?Q?HlEgIRGdJPN+XkcN8P/i0+FaCPq6zM2kzFh8WrE9MoeSlQF5V3pUgq1qQ1Cy?=
 =?us-ascii?Q?uqvP56xp2phwSL54POQYjFbZ5h6QZuBexwfuaLi8Mhgu6G8q3hPHQyRhej1W?=
 =?us-ascii?Q?rdzuU5qpUaxJbTnvo3JKFT1N13rop6biqTiy8szWPgYOJe7MwSrYKAoDDztZ?=
 =?us-ascii?Q?BCamz/vfX5Xd3Wo0yZstZ+bcggmFWh/Ot65XyDLBEoUBG81gnw+uRfK1J59r?=
 =?us-ascii?Q?9pn3UZJnOmnBP4+v+eDk3sfPuF9OTuUmL1JbiUlcqiSUBolYkYHKUzzFXs+t?=
 =?us-ascii?Q?4Aiq/YqCZ07l2tzE5NhK6rYkSldxPoI9IFWBmAhJFZnkuQlVo7nxxfadqbyX?=
 =?us-ascii?Q?JKnEFcWBntZsVjqa/IxZmPM/x/lUM6IciXV0yWB836Bdix9XAft0vYT8n5/t?=
 =?us-ascii?Q?zCxibMbQH6TSHP66Pc1pHdltiFqicP+ivTIIVqJkZ70XYS9UqjiogOY7qqFL?=
 =?us-ascii?Q?iBKYFj+jCFwHEal6FLMoPLsaQ5Cjp7FoSl1TtDnL+XzAZWVYdvQ200YGQVy1?=
 =?us-ascii?Q?wTjbl/CxYy6tppiONrgWGENfZXlppfE/r3OzFi+Y2j55X9ZhYwcAW5WIeEzl?=
 =?us-ascii?Q?ZprdeHQAZlraZYNKI6tqtEd9sIHoguelJZH6P91KZDE/XFKK07mEl+P+UYP0?=
 =?us-ascii?Q?qQBwFUwmzoxoMHW8blVuOWdiN4fED3z4G68rDbas3bsKv+hXf/l74k7nWJS8?=
 =?us-ascii?Q?5Y/9Hd7CksJ51uPknUw8zHPlIEg6RW6cYne0LmOnlaVy8R5GRjmnpZQTgUdY?=
 =?us-ascii?Q?ks/SmKOV0tJhnHnihv1QcdbMmmASQZXVV5SrT1NECPMpLtXjmuXnGY4VCPnS?=
 =?us-ascii?Q?DrJC0mXi815vSs9NYxgJplTyys90lsa9KFMTjWuD+ehpmxQznt97604i807h?=
 =?us-ascii?Q?MvqGqtJijhsiHE8P9IUtqeIGRuXlY4pJ7MScV1EgNhC79uMYQ5dpJi/P/m68?=
 =?us-ascii?Q?qDxs6YdyD/QmjinRTDY+3dm2OTnhBqq54qg1kv0KuugYIDRHSa4It/PNckDa?=
 =?us-ascii?Q?uOMP4AKLrrazryFxXsQVJULgS45ycnK1Knl8c81GzqR1oLNhpaJ/rLn0+k3H?=
 =?us-ascii?Q?D1fO6jR+qPPdF6rzykETqC9SV+WA+yI0VAyl29lijubxzd62fWM7gsqUBkqZ?=
 =?us-ascii?Q?bCkC22BVg41bTr1vkKf4wMPO+e8fKxV+8ns5Isnm/O9cdc+zWcvom1Ghx7vK?=
 =?us-ascii?Q?n5XiahX0UrpEbw475gulel1nWd/YQeUgJS/Ebw7QLanLaJ6JB79wM6ClRwV4?=
 =?us-ascii?Q?C/cHA/uncUTOc30cVOamJOJ9L9i+EKOZ3iKaP07hU9vyPhfVCRbCHq3nncPB?=
 =?us-ascii?Q?gRLnjizLCup7DnOfUUR7OGFzKPoBGVVmLjwhyqBlz4fN/zP3JOtjj1qJbu3V?=
 =?us-ascii?Q?MpoSKOXo0DV83dNRSPniqiYumgoqqAATnkJovYOELdCZgJQ1Xcaj7rHcdXV6?=
 =?us-ascii?Q?zj1jcVNJFJl4tQO5Wgi0KjAwZEfJvIrEWtQ06nhntPhyf0UDMG6B?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5ef91c-3618-46ce-c4d4-08de8c2c0a68
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11940.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:09:51.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPDOZyeVdysg00pMspi1hwgw1rNSy12r2XeyaUh2goA8POwPUr8Ye9Sdkz39ArP9SOChyBoiTJgGme2RTjsILBH3kcbAf8/acq2dCVvi4ddlVl99w64EodLcrxkeeUKg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11662
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30447-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linuxfoundation.org,solid-run.com,linaro.org,oss.qualcomm.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 029C5348D8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.

The mux-controller cannot be integrated into the parent USB2PHY node
because the VBUS source selector is part of a separate hardware block,
not the USB2PHY block itself.

This is required to properly configure USB PHY power selection on
RZ/V2H(P) and RZ/G3E SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v8->v9:
 - No changes

v7->v8:
 - No changes

v6->v7:
 - No changes

v5->v6:
 - Collected KKrzysztof tag

v4->v5:
 - No changes

v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - Manipulate mux-controller as an internal node.
 - Improved commit body.

v1->v2:
 - New patch

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c1b800a10b53..7ed0980b9ee1 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -37,6 +37,9 @@ properties:
   '#reset-cells':
     const: 0
 
+  '#mux-state-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +47,7 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
+  - '#mux-state-cells'
 
 additionalProperties: false
 
@@ -58,4 +62,5 @@ examples:
         resets = <&cpg 0xaf>;
         power-domains = <&cpg>;
         #reset-cells = <0>;
+        #mux-state-cells = <1>;
     };
-- 
2.43.0



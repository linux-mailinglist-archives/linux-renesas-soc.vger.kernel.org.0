Return-Path: <linux-renesas-soc+bounces-30451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJNMI8XIxmniOgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:13:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1094B348E25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61D0030B1B2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65522355F22;
	Fri, 27 Mar 2026 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dM7U3xbL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5197340293;
	Fri, 27 Mar 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635023; cv=fail; b=t4S2NPDiIYALOCBnsEPJLoygJDfR3aclYeY3/GN/mUN/xIhEhDB0ZaGwrQ0Y4wIlJ3yoF+N54LEY7t1TSEdY97fBgHYeabnXRz7hBPRxe4BRArrRBxh597tR7QTWqJIqMsMkN86Nigvkth1f6O2nczYJi9GUTm+t9DR0c8bwHO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635023; c=relaxed/simple;
	bh=GEICBCTtJF7Pn6Q+2GOdbuGMx0a0W3CnNuIRjBAw7Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RRftnikFlLXfbshFHppqd6VTfCfozGvQT3T0k4j+Z3pG8LefF1+Fr9fylnNBllvjezJy5oR5nWBpwz/ULJh+4tNT24xewGT6jbA558CCXnXD+sBci5ZNfZ9wsvbDkFX5ReBN0ebCBUUQcf3DjQImj/aqr0joNtX8HNr6e8EAXmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dM7U3xbL; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPoKeB+yCvbEE3ANofBiENXM92MTvxKah29Qz0dxmdICWt+0VRAuRZgi9v0uCogVCNJ7D8qcie2w1hD5mbhWEcxfQ8c2OQYwQLyRnGiK1jdVe9KViV/ZgRpXUyK0okr+LE6WA+sNaSK+C4g7gXDIEwHBuXHF8dwTE+zfsXLfQBJV8xfkUV+I6B189qTmTDMfwNKK5x0xk7FCHSZuJeROYlFdijtTS376nYV5c2pfjC23XLD/lgwUM0MtDhops0tryZwBRIYEqQHa6AjCJRMtDL9IXWapLx7NUkxfV9C7isJx5KdSCwbvOJ/dOvL23hZGHahw/bnrlFGNIi0O5acKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UblEgaPILoKckoOpkp8WuekSGw1PZy4Rqr179I64za8=;
 b=qzcezC+SIo/brcBOEeEXH7vwnpnfQWfPShW+g2VEJN7gp0Wqn3Es2DjiZGhbx1zJmbupRonyyc1E+6b6g4OWfsxXiwW8Z+OwWeK/WMsk+dZipfqgPvy0Tc3LCVLAdnGfo118uMEEDJZyq1n0kDqa7/KIeUPCoP2LYQHmdwmbeF75ZYtFaAoYSxaRM60d1SqJHal47Qo/ipkwCAYrmbhimI8/Z5ganS3jvhZKlXFvi5YKWuMWU1wH5nhRbuAn7ZpUr2nRcYXS4s0aC7n4SDWb/bmkrRdBslrJ95p1zTfACCq+YsIKSB6x2H13Gg6pcqRYmExIl9EKdR6X2hX1HcolHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UblEgaPILoKckoOpkp8WuekSGw1PZy4Rqr179I64za8=;
 b=dM7U3xbLv033f4zU3adZZbhTfFXZi6LTEv4i5T/rB7HQ/u41Me232+4B4zvzTWhReaioLjtYQL2u5x5YukLMNgbQyH2QUTpzB056y679trMXH/cA+RKsBI6dL1K92i/buMr5vOWwKRZ8MuZ71eu5uTf/hE7xrsRPJBOqWLxwbqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSRPR01MB11662.jpnprd01.prod.outlook.com (2603:1096:604:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:10:19 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 18:10:19 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 6/6] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Fri, 27 Mar 2026 19:08:53 +0100
Message-ID: <fbda808d86ee3df3a1eda98de792ca41dada52a5.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ce003ca-93f5-4c61-6d88-08de8c2c1aeb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	l8TRTEGCtLxFP0/o2wFZpI5nJZ1hC38i+aY5SZoGrgW/s1TfZVL8bqPeP9PF+DdYSR9hP3alQoYOY4Pu5lFsdDJzmh2L1T2OvPG3dW4ZUOGmajP8jyl2pwIUi0MGCJT5KN76k5w39kIsTMN0gGv+7wh1nTJ3aGcavUxRV/P0i2tKeiDUIw0TAmXGukIlWbsrY3tcnOLCjlIWliBnUzf93wiBazho4iPflxQMSrl5B78Z+B04ucb0OcMylX8hS2sf2DP9ZODMAWk95iKv6wFpxErzjlDXoC6eHpUIZFEFF11OA9xZPiPI5EKJgMxOikBTw1cpL0YP7+IOZWJ+mRD0DnWpzW/gVdond5aqvC8XVRazD9qcs7moGPRr2zA3Jw2JOu09ZkejMvluyA6rNqOq5lRPr6IiUrHipySG/CoK4HA0fezatgewcis5p4l+WVX/0XSXicdsQKlUtdjjX75ECWIkCnM1PHmEDIX+yVSGozCgA1Pqfw2GoI8WWVA6IIqYHMvgfQjFZEwy8ySmSCXHvN6EIZnnmNLCN7h6GzboCWZlXTcyUS6GLhlhVzVvudTRSksUcAdR6f03ajVFkWLkfJfMO9xwxLSwVuFDnZl3H+1b/rzzuMn4M9YP22g3ZlUI3SFfGmZBlo6VDJPpC2JLOXHBgs+nHo57A6eXp2rs3HW6Q6UMZXr7XsBeXIqwZTfiPPdJL+O72fWprHmrK/D7V4AMXZEtidtotTu2inONntYkvVxZXNUIb3rOONjrDachonajdwPJ49IWt2Ayg1G20k180MDi6CUjrNUyJ7zGEl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8oCo6iOjF0fGwuOf/ePh4KxKz2JKUMLV3Zv59zhKE35B9AtAIGwUowvGJGi6?=
 =?us-ascii?Q?At7wcEZYjs1KNBhd1hV5JqJ8d6WL0vL33PDavq2GxDO0j/JeZfcck2hZzwWD?=
 =?us-ascii?Q?KqOhmiit2pHvCSGfMPffZEKNvJoVOz8Dbx92E2IH2bRYsa/M08fvyV8+BmJH?=
 =?us-ascii?Q?T91SjyzFCls6lzfi5gNrUwR74pfyKfvUBYuN1+dRkllSWgbHD3oo/71YmjsJ?=
 =?us-ascii?Q?50rRnMKhMbSER5WgA0tb1q26uj0sNf7hIAjXE8Sv08puLSuwGZfj59dWB++B?=
 =?us-ascii?Q?erJv6lkQ3c4fm2N0+1ERxoFnRO2GkLbYg0CM6qY4rJdZdGO5EuUuWgSa7ksj?=
 =?us-ascii?Q?f17dpnvyUENl9sf3CoONtRS37mBeF6ddfO1b8JjYPw51tDL2Tp+Kjy4xLRSD?=
 =?us-ascii?Q?OwhEFxziFLVUG5t6Q08I+ImDlKlBE/U+MmDsyG+Ilt3ACWgo24hrDSwUWgHj?=
 =?us-ascii?Q?SLqVjwNk/MNB+CcJicnhbfLkcpU9mtlGNh94PrE1FeX/wMyTEOVy/dtYDEZ7?=
 =?us-ascii?Q?uYqUl3muvDkYj1gVbAH1vjmcViEfKNiqMaqT2gqF+O+RPPdyS+EY8m4vzl+I?=
 =?us-ascii?Q?Uq1uVLm1jLxPHRnjbSX4kkxeGaLI/5XTtXHoAe0YsmMoKPgy1ClBH/HVPmwe?=
 =?us-ascii?Q?c0NAxdE7OEYIRUIpf/OAze17n3DzV+y8RQZLQgQV28lTJYsEMEfnIa91dNXK?=
 =?us-ascii?Q?qMZbw2vLrpkWj9fGpUenAes2culw2JedD1dF6dnUJpjLUtf9ewh1SuHkOdUY?=
 =?us-ascii?Q?CRcaY+7Z+B44B+WIUs21eF4cnS7xxDWTtJMayh/q3swocd4JQcmwF3BiGzy4?=
 =?us-ascii?Q?b8tbtjTNwV0dPxgBL0+JAtBC4kk1527MoyGBl7TlUuWwU+9j0SlMH98nrsQU?=
 =?us-ascii?Q?cfy2bKTEaYuyuzhc/PfXzrGyTjsXAON6r7E2MOiQrs6DIGMkPVJ/JeQPXNJl?=
 =?us-ascii?Q?mUay1jaV37ABReTgLogetjt7G5fZKSU2WC0qolyivcNMrxe9GI5s01RyE0NK?=
 =?us-ascii?Q?L0R8sH6YRh9byh+1uMi/+QA2jEIwUouYE9/buaPtwkNGTFfmhG5zB2qWswLq?=
 =?us-ascii?Q?eWhrJ8n1AFpdJX8s2BDcF0dI9oioCBL0IRkjB+XIussTry5pYDXekKhx71mX?=
 =?us-ascii?Q?OV0S28CL1wp/cC3x//9PLJhlIn3pUv3BdLhIJhx12ita7HOF2Jk/RkipclCo?=
 =?us-ascii?Q?Pab3mifGBM1pSjReg3/GJuYGW9TPJSQSCKHRcMbg1MjVROvGxJBDtsZrPu25?=
 =?us-ascii?Q?BzAsOKfAYc/WOcG3XCDtnvXbQ786ZR7m/ut7m3qbhqMhQaIKGEYrd3JZZjq2?=
 =?us-ascii?Q?yO45mHFyrMQ1wH7DHbDNA+KNtuZ/qOC5ThhllnvWRiG3zOdjr0UjPg/SeMmj?=
 =?us-ascii?Q?VKHsCeIINatak8wFkg1juVYI5201kXLOVpo9hUN4lfWdf0sfiaS2G+Q60diO?=
 =?us-ascii?Q?QmFNs/2ilI5QhHonaODfl9VaM0jYJpjXAP7gXc1WE07Q/dOyGQRI7OzUNhzH?=
 =?us-ascii?Q?m/eYBMlYAtTwKxZa35l73hjvE0DnyNMrSnA/+OvwYRY3XFL6ZreHryLCDmTZ?=
 =?us-ascii?Q?CWBvU7ZuXRJ2ryAsPNx8XWKAODAITjKCIlK6txdDsGDVi0uOvt0FIWsO8S30?=
 =?us-ascii?Q?hJyMHmWWjhPYZCaW9ydWN3syS6N2n6tfBQJFdxzH5WCHI/RNFnPwW5BffoJ2?=
 =?us-ascii?Q?YSQkT+ZDUlz1EbDrvxGujb6UFGL9Pa1+DT4RIFW89eJ61lhP7w9dVjUD8v8Y?=
 =?us-ascii?Q?z041Uzd7EYgRtVTtR65l4n3oFpSAkiGoM/eB174lsn6BvmD1Bi5w?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce003ca-93f5-4c61-6d88-08de8c2c1aeb
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11940.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:10:19.4882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6auUcYfD/W11Qdligp98/4u/yEoJqVhavLoJ9ox4rPB2LCAM3aaOckiXggzwimGQJNHK2lhfI0eGobvc5KxANH78JIKyU4uF6s8FN+TlSmBHsinGlLodhRI9c/smiTEp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11662
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30451-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linuxfoundation.org,solid-run.com,linaro.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,pengutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1094B348E25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering the
rzv2h-usb-vbenctl auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v8->v9:
 - Drop linux/reset/reset_rzv2h_usb2phy.h dependecy as the driver
   is now based on regmap and does not need the reset driver's
   private header, update driver accordingly.
 - Collected PZabel tag.

v7->v8:
 - No changes

v6->v7:
 - No changes

v5->v6:
 - No changes

v4->v5:
 - Update mux_name to "vbenctl" to match the driver name.
 - Updated commit message.

v3->v4:
 - No changes.

v2->v3:
 - Use __devm_auxiliary_device_create() to create the auxiliary device.

v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 35 +++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index c539ca88518f..62b2c3919613 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	select REGMAP_MMIO
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 4014eff0f017..b1b8fa8377dd 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,7 +5,9 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -15,6 +17,8 @@
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 
+static DEFINE_IDA(auxiliary_ids);
+
 struct rzv2h_usb2phy_regval {
 	u16 reg;
 	u16 val;
@@ -99,6 +103,33 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_ida_free(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    const char *mux_name)
+{
+	struct auxiliary_device *adev;
+	int id;
+
+	id = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	adev = __devm_auxiliary_device_create(dev, dev->driver->name,
+					      mux_name, NULL, id);
+	if (!adev) {
+		ida_free(&auxiliary_ids, id);
+		return -ENOMEM;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_ida_free, adev);
+}
+
 static const struct regmap_config rzv2h_usb2phy_reset_regconf = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -166,6 +197,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, "vbenctl");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0



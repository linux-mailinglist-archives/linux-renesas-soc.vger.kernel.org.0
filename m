Return-Path: <linux-renesas-soc+bounces-29288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJEqOf3SsmnrPwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:51:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF291273A4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B56BA30175F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822EF377ED8;
	Thu, 12 Mar 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FUua0++Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111AA36E46C;
	Thu, 12 Mar 2026 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327096; cv=fail; b=qmsCI85NKdjFm1KbGXywnscLoHIpTeFtg4xu+OYcitiImZ6VRQtLBcnvjWiX6KF5dRlV2BwWoZK+5yjO8YGgdNuFR1el1qFgsPIUdo1+ZPoQysD3zKTvyJfIKXlLFB5F3x2byfw7ow0as2/lWEZStIRIFIJFOI5qB5J/6LRygYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327096; c=relaxed/simple;
	bh=oMatOw5mSQO+pkiyJc+SvQOKEiDR3vHIz01Dgy3rIGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G96x0cT3pngq34tpw4ZX5mJfsH8nSEoUIV6CEsqgnzM/ZiQwiLm9HbulXx8iC79yWNbgiXqw1pCwH7uYxaEd62fQv094HQpvSlsa41GQz5+9cd1N8kVxjTXOkfSi1RSaBRVSg/tYcww8sO+sVkT/xqec5YkCizW3iToYDzx8Hfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FUua0++Q; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owCTfnzwktV+sK5t3CSFeyAo7+Fu0ShxDKSGyu1w5HgBfjcwPY4mEpv1DbirbRefSuRM/4El3/UOsIC8ly0m8HqmcbFT8JVmm/SKOToNnmX+vON1I78rH3H81My9jNuLZ0QL0QPks1rspLNSX3xvBn7xJ4ZQq5/jEAI9vkcxBRFDXkYlATINJIcyI4ija0i1gnFMj9x13BpmBCyYvw7Bdy1LnddOdJfKJ7xEZfFYrMyuexQ0bnGeMp4bSeTdUA9juRxpKiRSmKNFxuAfLDcunNaODBEqsFs7MtsV+i/3EJK0854A605Ad5lpbK9ViVmBZImdkzbQMUSohu6g+/SjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHSNwUpG8XkOooc3/yB54+kDHwQ+l3jy5T8xDQtnqXA=;
 b=yNnB/B9ChCIuHAWbWHqCIYVLZpVcJMUUz+pzOUNoHtZxTnyTHwXHsx3J4rxq4oN0VkPY2usunVi/qGwt4VAKYE6owVLTEpP9bWnbSKK1NIGd1v2GcN/mmeRqKIG2tY5LMaKrvaG1CEy5PO9gk4KrifUvN7hqcjA6rRgiS73Ul8rWh0beKygbe0XoydxVn7LnEesiPoqlh27iYiBDKJZTIs0mzBobIxgS3MEYFH2nzlKq3jR6IxVtqiSLTelyqOeDtAFvSkkfMCigo83rcBUYsRwMuxeaTjGNdPQflx1FGOsvKqYJlVvRke6UY9YlE/fCHAnADXWAhgoDvkUTinScig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHSNwUpG8XkOooc3/yB54+kDHwQ+l3jy5T8xDQtnqXA=;
 b=FUua0++QCIKzhqN0AK0XOmylejyuvinsOY/Rr04Ip9rP7HWBk6A9+c4fINojdKqaA5XD85HM9OgZblm8LjqxZSf8Pdao35FSI1in1+LAl4zZinbhMZ3DlerTv4P6rV1KeL/z4WP42GkYuQo8cJUUrGRGO8Fhd6mjK5f97R9Gtfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13770.jpnprd01.prod.outlook.com (2603:1096:405:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 14:51:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 14:51:26 +0000
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 3/5] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY reset
Date: Thu, 12 Mar 2026 15:50:37 +0100
Message-ID: <661d45d9c48696352af2509a24427fcadd4a5f8e.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13770:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d8cc0f-533e-435b-b3bb-08de8046d684
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RYqpK5wE1lX8Uq3Yo/ZG1SO4AMul+hUvpfZcIOn0iDPVlThXeZv2DbUCgfQCKQv/9j12ziQHGFIaJ3dsytpztAFZnefnuGBeV+kepATZgdOLK7Op5T+86e+xWX/zFSdrbyZQDZJQipvikJFqk+LZ3DwoZWVAh2d9uWYLU3GIBsakA665V7+x75WtshDSFQ49jUWVFE+zIYxS73MR0RzmLnclW7rnpPKBDs51xC2TqiMLNG/JsTWVS6yUgR1ITRM3nBYFF8ouUusS/anoS4xwOXvgRnibPP+9GBEqPX+sdLx6IudzHpwMapLsIDLUaMP/FmqAY6U3L77KxyQTJg0VFzrpsKzzc5p4KRf8JMmRKJmltyqLkI3Yr6ozvDsdd3g9ATckFCvACbOCBZeq7+h88IYXw01JbOGPCNDGmSosDhMjWbekNxn1fwuVWyZ2rHRfHRv95r2O+I7AuNrcM41m/agIOX2jj/m/7AJ16A6ZhIiu1vO4uiWdTULtIsedGfd7y+e7nUr+XSXucYftc/r/RWdMNoO0UahPomACJvgJ1d4aQUqMy+uStpyrP7J8QVGyWoo+5jSJMNN0Soi58WnzImg5Idp/7nyqJ4fGyoZTleqbBtL9aeEOhGtKxL47LQSQStrTsDKpcIdv13ZWDdwb4BKRoKdhT75b4h4dgcB/jjIkvx1oNzvTJZDH/BTaIRky9ynoT8Vs+LNhVaUVyHhRh8DHZWxSILtJpj4iENhJHbhzhqK1nK2/bVWpHT7Mqxj5CL4DDY2wL1f7/7a5gBO6tXT5gwizqzHrPEdbz+Sc/aM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tKM9dOGeqz5Bzfp60ahXr1tW+BAuPENPzQrvRSk8Ak/YlFT7OlIj9kUL5afr?=
 =?us-ascii?Q?nqJ1EMErkvoeDBuEWGW53T9pTfKNB3JC0qFuZSsq85Xy0CrvFIwEppLqaUg8?=
 =?us-ascii?Q?mB9GRx1cbWcrvZ0HTf1roCdkWref8dHMXCrXrxqXeAjGOvwixh911uXAkNi3?=
 =?us-ascii?Q?JNmDwRoaF6KhKF9+UCR5GtM1dDuNk7vq7ODcABwTvUN8PUW9LNLDWXNQ3Bfx?=
 =?us-ascii?Q?FD+M90aXDOGlx+eWVP0BB9ZP+RNxQFVwLwbEka3VuOxn3Nk3tFn3tg2E7pwc?=
 =?us-ascii?Q?h4FI2YUSDglgYC7Zq44hDzPA9fSeactzoVRjDLZurpU6/ckaHe/Q9E6sbcaR?=
 =?us-ascii?Q?Uk9CbxG/Djuw+Sg7DmDL7S9/T99m9LNJCArNBwYZ2VsoPa/GOuFiAqaoUTMw?=
 =?us-ascii?Q?BU5t+GzPmTPyQmQ/B1AS8gzen3EdFaS4tEBcysdZgLeDFVXcXm5hvj/bG5o7?=
 =?us-ascii?Q?YCp03Icn8tZXZ7KoBiLbFgWV2SGQKm+CJcRSLGTBd24uP2bf5VPWAZGvqbGD?=
 =?us-ascii?Q?XFAdIoDqQPlNCIDyQiyx3CFspyB027TyoIFYxok/Na2aAMJDjCnOejxW6x2X?=
 =?us-ascii?Q?E7H6H5+Fo2CPpz2aTZvNCg9jv8kDsj2QIpjE8W+aLcN8uzhjvHyb8ZHsc9I3?=
 =?us-ascii?Q?FtJt2wVLropwVssL7tObojsHNVM90w7BA1Mn2TMz6DiDYsnMfani1VtZCE/O?=
 =?us-ascii?Q?JrFpwPhpgv/S5DjWvoIvw368PxuqAcWBfty9A1VxzVAE1duNtbfmQ6G+pxfg?=
 =?us-ascii?Q?eUcVkaADY0da73kRAYkiLxq4uUswJW05dRGqaecqjL1yAeT62IYurPae5P6U?=
 =?us-ascii?Q?IGIozndGAeVIXQv/yWhye4P+0tZNvS8CCqebyHdmf8b3A4spI3vgFEFI/PY3?=
 =?us-ascii?Q?SPEt7n1Iw9U1C/WfQqKTHBHdt4yDalSG07HPv9lERhbDHMrAE+cRJ8T+NELZ?=
 =?us-ascii?Q?occoRCuImAKW4O2kXwwU0ry3XU7FIzMWYB31CfGR64TFw75rHm/BL005p9TS?=
 =?us-ascii?Q?YcXnyo5JnxHO1jBUlN44QEtv1tEw1a0qUgRLzry9AvErawfBNPDmSSmvevX0?=
 =?us-ascii?Q?MjllxL7P/0rdoSlLdV1reHjhvIUgo5/dikB8aQ/F6N7iCT+ZphtuyD1kQK29?=
 =?us-ascii?Q?YVfBc9mxiCWNkck3iXSemQLMM2PX+Sn0LW2BNPiOJox1xICjYPdo3ooW5cYf?=
 =?us-ascii?Q?xznrroU1v3wO8xDAWx3Im+XUeBiMu+idIy26a3vgxwgMtWozuBfkdBuecV6t?=
 =?us-ascii?Q?CI6m8RQ1twPVvF0RUq8Ve4yU2thkS5Ooq7RjodFMPLTdafXBYrU0w8pAfOVv?=
 =?us-ascii?Q?3M3k1ErNJN70F3V1kZlqUAEyXsEKlKXa+2578QPm0ggIf+98EWFTmkZFxWH4?=
 =?us-ascii?Q?FFyIdMBDnTnRq2ffl/74ArVjUCda+J/yBnk3tNUjYdb4sMnxv/TfnA/YTuEE?=
 =?us-ascii?Q?h9zCqbUb1QTp0TGGwkjQhWcIz9wVs2RhPK6IVsbMte7CtlQLncug8EGPWP0R?=
 =?us-ascii?Q?1uBxpurLKK3kROy82JhvqYQCa0ys/gUc81owAykRsXPkdsP6qTULfV+5phXL?=
 =?us-ascii?Q?qV6YNVeo/gt4vt//TK8CtqDnZvP9CwgBXXrgqvwCAp63M2p6J+dorEL1JdNu?=
 =?us-ascii?Q?7H3IUKYZ6g/DRjh858BVxkpbSetxJkd2gnJttV5BxrTPlqZZyI4exEqYiSI3?=
 =?us-ascii?Q?RXriuooskPyRx89adLjdmjpnE1oFt6tyE8cZPpiUrPAiYhOJ5Wpcrz5soCEu?=
 =?us-ascii?Q?s8pzDdSTLk9EEEbgZQGqPs+FGmwtGMr1irSIfOb/oGqXBtyX0YnE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d8cc0f-533e-435b-b3bb-08de8046d684
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:51:26.9419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VAlFwjbt9puoIAN/qqMyoHfTI3YbLw5WueJON2+P55YSWMoT5RcNFEuTXHU3dwULhktZr4wcmI87J8D6GXL+jHNP+YcwOTT/eHnrahlm9lbLW6Il6Rlo8cqxnmBN8tD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13770
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29288-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linaro.org,linuxfoundation.org,solid-run.com,arndb.de,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: AF291273A4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2PHY reset controller is functionally identical to the one
found on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
for this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v7->v8:
 - No changes

v6->v7:
 - No changes

v5->v6:
 - Fixed commit msg

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index 7ed0980b9ee1..66650ef8f772 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,r9a09g056-usb2phy-reset # RZ/V2N
+          - enum:
+              - renesas,r9a09g047-usb2phy-reset # RZ/G3E
+              - renesas,r9a09g056-usb2phy-reset # RZ/V2N
           - const: renesas,r9a09g057-usb2phy-reset
 
       - const: renesas,r9a09g057-usb2phy-reset # RZ/V2H(P)
-- 
2.43.0



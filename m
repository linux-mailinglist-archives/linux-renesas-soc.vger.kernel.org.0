Return-Path: <linux-renesas-soc+bounces-30696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN0xM6s6zWnnawYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:32:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5988637D2CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 17:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA8AE316F988
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 15:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17D9401485;
	Wed,  1 Apr 2026 15:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="r9TSD3z1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7408A472790;
	Wed,  1 Apr 2026 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056622; cv=fail; b=Ztq2kPzsY1JIVQxnPJiVAP+6SJPP0BLvDSeeyqIGTVvsmBL8TjJJlyfUbTvjE5fdrrPAFiLw81+Wnrcudop8W1ZgV0rgYWiV6rhjLGQyHx1gpKyNWScHyIFuzo38pGC8iYcU/TjS8z0pHZasa5tINjsK2xi2vU/W5LUMdHHG4R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056622; c=relaxed/simple;
	bh=OwYZ9xwAYVZGeoz/bcQ+rzjinbWM/BFTklMRynrupqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GaOZeJPGvuqqX0IOFxRPYNeBu347hwEZD/Tp6QspNCjNhAOjGW+cMVyYFHSFYB1TvmbAzQXBxYkIXHltL42GW/aNawDTuSUn3Iwu3ikFxOmuLS6fYMjQZFjQ2q0Gv/ZVwJU3O6iT3Y4VHdu8jQ4CY3h0G2NmkKMFEEhuDv4y+XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=r9TSD3z1; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9/Pnod0hCBOD8tNXw8cS0EdzwdcgcpIb4l7NI4whu7Bvj9BFe8wu7py46fiippNlcVMhRNQb5FOLNbY35U5Jk7wrDP2zwYq3zGh9A7O9qZrQk8qlqHfsQrLEJXzVyrlKKdgdO91SRbD4s+bw+bg3oyKT4wfjCQ+V4Y5g7uEy/08p441npyPysUKuGyVgixcu5jWITLkzHmNmk7Hxq58tTgz/UXrFKTCM4h/0e94zMa2/CECOfB9jfg1CFi9AtrAXzjy21GXwsNB9w0ZYWm2BYIlTGvBSi1nac48pSNqWsvopTbndE/gCcP1sQPV65B3rqk698gbmFQo60+3kKLGhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mXQSU3x4IhW3pyFY0I0mTyyZd7PcERKNgUl/FaKSkQ=;
 b=OI0rhKJNrTfbVF5tN3pVkRPcRUPriWvYX6qMHsHlQLRMtHlUkXnn85BSrIabeaerjw/6Gk3tooFF7eBkj2eHqLZO0AJDCm3BO14YeI7NSx1lhjjeLQpwhC5qjEMND24RDXzMHBCbKpoF/42BhKNWELk8t8seeKRAcdRS0wXXFI7x0NA9ffe2QxRgHJ1sMWKKOyHgEczdWpVSS+zLc/8KEKi6LqTzGZV3qBKn6Qo3jQFtoylWIlFWMHwqARzojwYBR0d1EZhJ69D2WqKigcdDbKgpopLdkcANLUgF/zAvXoYiUCnAO9Rd3L5AiBpbG3QutGhr0YS1dSt9o7XfT1se0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mXQSU3x4IhW3pyFY0I0mTyyZd7PcERKNgUl/FaKSkQ=;
 b=r9TSD3z1k3DCqatj5FYT8rlDDD5i6v91j1IWfccmXoUDG0w3BlkrYkoW9KdHKdlLrDYhAs0Z3oQU7hKIihADUitgi5Wld8ZCjlzVpYgsNAmpASZlhrAlwTiW7dRPX+ieLy51BfLEX9OBWlJhKjAdl/vcfNSocbI7Dh8DKolXxjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS3PR01MB9993.jpnprd01.prod.outlook.com (2603:1096:604:1de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:16:58 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 15:16:58 +0000
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
	Arnd Bergmann <arnd@arndb.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Josua Mayer <josua@solid-run.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v10 3/5] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY reset
Date: Wed,  1 Apr 2026 17:16:09 +0200
Message-ID: <f499b91549a4c0c68fe05fe59eeb795cc516f938.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775047175.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS3PR01MB9993:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecda1e6-5661-48bf-0ec4-08de9001b7bb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9VSAxqus2mc4r90OyxBKGiH+AMEwchrnzo9mBA7sg5kgaUIrAoOdVTfuQtj8IkCE5aj2wKl9LhGYLPmfPxoPcuZbSJ08sr98tZzI7wLcQ13C8XirR5rIus7nOWmkRhU5UorBlRwsXhm0ZR5T0L/w153fwDQuppi+bnFFDJwCVW3j19tDzcS7I7bwKZys+1OW4syzozyKsGfr+iJxCb06sSttnC4759ijja+SBjCGIeyhnmntGSKi83T9ujyW/q8SUk2Pd1g1rVY5438Lrr1fpkSbeoPqHPgE9T7BdY9PnMH2QEQGK2zp/RBYpkgQnCZzyn9ByLkw67NbQ4kxoIxiiyhWvgD4CJkyGT1vKAuhTyzUA1FvKtc+xQSMqFLq58yjN3L8L8XYFOTeDTrU1oNNpskKSqMI09T8mgir5xhmH9YM7ERGfFMc8W9O+xbE3kwko5ev8iZMFHYPBoj09WNxoOF5lenFwr3oKrQzP5rFM7FRdfM7NLlS33JP3LILPWeSKK1a3aGAao8Rxtpd30WeoZg1jpAgMzpRXuums416tL+kXK4oIEmo0Hc2WtrgW13ZQhOkeokupDPApyQYpSMqUYemW2KY94uc0XGPT5kKQMQHPJ32Bnks0hO7uLvo43L/8JkFllHdthwOYYL/Kj+fxT8KHUJ+iCLWm/l/r3Pn3l4REQZ+oYmFLDgyJ2UQ1rKRQ/AyIFem9uzs2XkbfoMeT6WFwMppidC0PKNlPm3qZ+OZ8BAZUCqov6L8sr2EHw9OzXsg8u2Fq5A5ylyC4Jeo8l6bzvSALP2gTWo/dYcJmhg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P51brgDB2tiYiMokgpBXbdG7wXK0A9coNxSmeW6FfO8G45K0G6ciYMsBVaeD?=
 =?us-ascii?Q?lBKn/FaDSx4hHUAeC7IC72h2UnMwgShzpwmuftsxuc30Q/qNXMGu6t1ZU7jE?=
 =?us-ascii?Q?gdeOWxSsxpso8MelH4fN6lkz2P/lBsgNxGFhZSnf1Kt2LBT6KuTsl1B+6gB4?=
 =?us-ascii?Q?JRQsQiJTJZN6UKPMwpEsVWN+HCBx/JiNHukuDMNz/W9SYTXwkwagJMDI60kQ?=
 =?us-ascii?Q?d38Cabz/9lbAxoEbhcvk+Zzc1enTMMXnXTsgOHZNt9S5T7mlgEHsJl+dJ37r?=
 =?us-ascii?Q?fZdTVeSGh20j60dQMulsG/BAG1t8blK/gvTVKdOgxvbOfUHZyDuimUY/tI9R?=
 =?us-ascii?Q?vNnShceiVcfHpol7X3SrXKNMkX6sh18HrQPMQmL5TfLlgBhruD1pvTTzUcSa?=
 =?us-ascii?Q?wqyfAPsW+YSeuveCoc9mXQQiews5WxuzBiRPyAn45NSI7KO0UqPgbVcPumCY?=
 =?us-ascii?Q?k8oefiJbO9vOMnB/XWV7BGy2GVeFwyyQaAWzpP/ZC6p6lrJcoVSwNBBrms5e?=
 =?us-ascii?Q?2brxt1wmvwUxkmCzZFbtp3XnfaJZGtRrKn6v4AmIP6daUc92tQv51Ek59PHq?=
 =?us-ascii?Q?8KEybe35Na+S2By/3u1iJnyLuuJn047AVBEwStrBPhty0DV+UpiHPrfr+XlY?=
 =?us-ascii?Q?+z/XFrDGrg+YZd0dX6MvziukrtSyS5B9ZQ32nWytGk1CSKAANK0kCxSbD2YA?=
 =?us-ascii?Q?KCzS2etfK7bWYOSO0MXOss+iivJpDdCILohdxBGde3t3NbyOVgE0CLyxnyH1?=
 =?us-ascii?Q?1E41rquh0sE+13Jy3Z+mAR+hoK20EYJLZDQKLYSOPvYHmmAFfIu5i+8HwR5t?=
 =?us-ascii?Q?rzx8FZQzdTUh9jT6cbxA47ex8KbqJ7F5PK8wuZCBogoKOKn0Ehh2p0+Zx5tg?=
 =?us-ascii?Q?FExATz8WjDW1SnELQCwwdCSMAlzUMX0Pb/j8Im6LUSl7PVbKpQgBmDnbNIg/?=
 =?us-ascii?Q?eY71LBtwpsL/7PYOnuIUO7NUeUQweXn8I3L+oqAKpULVcJ72wca2J/vWK1A7?=
 =?us-ascii?Q?oCqP8kcqWikcUPPQCaN3mF/oaCcULU/KHi84uxlx0NP7ckdmdWDTl7fGR3iY?=
 =?us-ascii?Q?TnR2ZZO1mSA0dPVVdK/433mK4je47H4zgtPnjc9Xfy1mDwU0DawxQhDByl+l?=
 =?us-ascii?Q?KRW1FIrC6GgOgSe7mAdK6nLyIIOD7HEU9GHzG2StL7hxYSLcHK6KXBDxxzbQ?=
 =?us-ascii?Q?/S69w3sOxk6owf8901qkarg8uozSK6i1xZJ1yqyCjcijjuHIBTqZmtJk4mSP?=
 =?us-ascii?Q?idfQT03VShjcmZSCCbdeVvU7PAR1jUOVEg8prxNB8WMP5U4w576P3eI4i6sx?=
 =?us-ascii?Q?6vhhCuS/0VI7i2O5tgHhtntMfe1WclyyaVUr5ZtlHB1O0BhxtkS9C5da5yO0?=
 =?us-ascii?Q?CZFG3gph9m3aV/aWGIGMFPrHVeSkxwq91p+UKSC6+9jFKoLb0vk4P4KWP/i4?=
 =?us-ascii?Q?GssXGet/Za9JPqux6FTc2G7AvkpzvH0PdXKYwinvXb+5ZLIQwKdjiUhmhiXu?=
 =?us-ascii?Q?ff/VrXQ9NBSBFD+7wPLVXBD1bqvWpIe7yzIfwe+wUbbtGgw658ie2FoF7Psk?=
 =?us-ascii?Q?mZgRI9wVOtl8O2JaYWmthDj84uqxs6GxFupuMBd2fJ64DHV+zc+Zse4S0cHw?=
 =?us-ascii?Q?trjypyG5ZTdySQUHMj7qQkUUoanHejxs3PPHEMuKbMNwMSVm91ZrrPXZZstK?=
 =?us-ascii?Q?6RkFtqVHjVl3Hl+c93WBLNcFELbBycWS19qV8jfig0HOX23eFWbx/OTTTu7l?=
 =?us-ascii?Q?bjXI7CT0LxuvYgeG0dl275vRcXrjfiAUU8BT6NQU0KdHjwFqTzb2?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecda1e6-5661-48bf-0ec4-08de9001b7bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:16:58.6015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9teR2/VKKVcUmfoMecUZYdPITHpGswEFKa+5Uowbe9KoccaPffxa3eyxCddxyqFPPCXZ0t9ikI8KntjLmfWDImesngr7dMQIfnG+WUo1cdH0Jp+7hS0A+zTRmkNKfjlw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9993
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30696-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,arndb.de,linaro.org,solid-run.com,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,microchip.com:email]
X-Rspamd-Queue-Id: 5988637D2CD
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
v9->v10:
 - No changes

v8->v9:
 - No changes

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



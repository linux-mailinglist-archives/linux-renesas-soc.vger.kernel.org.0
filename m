Return-Path: <linux-renesas-soc+bounces-29287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBJPLk3TsmktQAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:53:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FE0273AC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B04993167627
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F780378D74;
	Thu, 12 Mar 2026 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vQvXPyHk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011064.outbound.protection.outlook.com [52.101.125.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F5379EC9;
	Thu, 12 Mar 2026 14:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327089; cv=fail; b=p2zbQgcLcMnpzW7A0rgFZVGMAQqHmeUMLBzLyzXpFAwc5DaJejErLOZbZtka/GjquGGA9QxKpyNwqsAhMdA4iBqQqN+em/MQAByCsbCcPqgA6CESPWAiVlYCb/0cEIiIyEIb9L2a1qSCoeQH31HQJEN5DepjqQ6/eHkKnIAAAlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327089; c=relaxed/simple;
	bh=ch2WaxP3jAm93tbVKyBe5KyBDYUAo0t//TOCXBNUvgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vEfx9rElWxTav5yHooVodgSzV51K+AKfu6dCrEWlTibc1CSHqDJG0JsTh+KU6Y2UgQJzOji+SnoBlrgDiw62wGM7TZQSzeGEU6aNhyI4scv8ZeCm+BRrIAtknYiWgNf8KCZEbeZwTmMnVc2W5dZQ4Bg8E6m/ltkxpOWO1Ro5yw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vQvXPyHk; arc=fail smtp.client-ip=52.101.125.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2ZG1ryl6QHliYwnKjeuJNbzFkV3nlE7TIrMfd+YwMcGTF8AYqtF3em6g6/HnDIXIFuCn00dOYurxf1xLvUwS2WuKtyr6YQtiBVJXY0FDvsz9R6kn33cN7qu9fW8pqaN5KE4eInrsFT6m5qCO+qf0YozijCXuGUmi39wnmIBje0QPhxTeD1r9fJZNAFfFgN0ULjLV/CVUXbk5+ZufuBSAETlCuXhbUZccX5n4JqDbH0vtdtrqXdlRCEPoUHVM3/blYa9tL1ib3Mn4PCB0W2CRZcWXd/WPPo3O7B1SYk672zr9vWTDyE1CpGww16EdkH60ChnLHXVKe136PeEnCtNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lp5NE3mgDzVdTKLW/DVzv4z0lvaHABhlFtBVDP81hc=;
 b=IsLza2a7mVH0H6zLFgrAM/ksJclSPwsfkozZVCSs1nhaBz1/VjbqN81cbRfFCnfXKOJHoabnV6fH1A7YvzbkhHpWAaoeoWMsfpqwbUPX/ZZNosSNs0imuHpiQoDUhe1ywsJ4pmAT79cVhCOHxUQqpB/JIKYy7sUlLoNjNyduSecFHvvUwp0Iy++XRxviN4hUu5OotCv7j0E60nZk5bKVhCUfd0ti8cS7WtfU1YDSUOycB/J0p7aiImU42eMhzQ5EHQBDqMiPhWiiHxutzQlaODkjNwFoEnxYZCfVjguYd7aP7si3+bflnkmoggvjWLS5F5UIjEiwkMCMOTvIoR0fxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lp5NE3mgDzVdTKLW/DVzv4z0lvaHABhlFtBVDP81hc=;
 b=vQvXPyHkhmqr/dN9oHKFmEaVAYThGFBlCv1c3oOiLbcmcM2y52aFJlm+myakYof3n4hv82Z6iecE6A79LN39JM17QPtYHheWiJ+aF6Za892H6sQ5z2eCsamIbw0RV00Z3GHLsoUMretrmOVZgQF5FpylplAO0pGQ1JHQWDVk7eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13770.jpnprd01.prod.outlook.com (2603:1096:405:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 14:51:20 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 14:51:20 +0000
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 2/5] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
Date: Thu, 12 Mar 2026 15:50:36 +0100
Message-ID: <44c5ecc6b976325564aa9cb4fab2913d21677949.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a042d2e0-1c02-497c-2750-08de8046d239
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h6KPhynVaYnl4pBx8ut7yq9dj8p1MgBqqUWK0k0x9YsUwDggXpfifUykb5zLRRE1bgHEN9QXP0MneonyMfzyRQA5k+atCihbzpz3IQ/SYO9Efo+HC0LKoTr3xzUB9Hr0cS+my1QT/+DBv2DAcwDemegypB1Um/d/AE4KNZNNNin59d9rVe71uXAd+opvTFAfXXAdtXb5WuK4qGv8Hn01hU8p/ytqE5UrGvNW7r8XTyukWHvSGClFi4KRdzdgTd9idSSpFXlqfqS6k6q0LfoUAcxbRCg44lhOuXMAi6bV74s94a9WqqrntLK8xKiaONNy6Eeid6eXfomnlyml9KHow/Em0L6/WUj6NCvElemVpyzDkQQgXkNp7gj10oB+r+DTFn4K2yNN7RnP4gtYdh70YifGzTtRDaLnH6VB0ZR/CybR2nIVafPUuesoWRPbkgIpzIRwwkbOySHzpoZHrqWQrKg17kyMcqLXlpt5Wz7WbgB+3apQbS46htPwYvERU0XWteC+k/UgGUJ8BIDKpwQqI6C+u7r39nKwESjB3gp8UPFpWgSVi00AmgAoDZrGZbBKyH0VM0lbOsbf+1ooNNm3cNER1GK7XaK6GwmuCfVs/+1quaV/c/2fdEHjnUfGYSexe1c67CSey4WUKaBrp9fThwYqTsDZcv+k68LuQ8uUOjYR0r+g4+ByMUqcQ3AaUVJ3xom942RO6qEUoiEe4hPxkevjgC3WMxbswSiMpZcxBGacCw9Jt3LsR+D6TwHgS57w/zqpXOsZ1NgAcuEgXXEfosfMWJ/3+tFoewSS5lsnCx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u8ZzDG48OaTarypwU9BYf9wAX7PVKWWMp2zAMh09T0jTPF2bFIY/MJXQvJpS?=
 =?us-ascii?Q?gJKZMtW9qx1IS2xEQSUsUgFINMlETNV+xPkC5TjmfgNAWgpgU5xjn4Kw/rot?=
 =?us-ascii?Q?yZ8LoI+jue2M3oRaugoxFn4QEVCFdxyxJ4pjCjn8hdrq4OTlfT5K4zGxKK18?=
 =?us-ascii?Q?RmIDChXKIqDxDPp7hi1fhWYSQhbmPSNGJ/w8/J0kHqXwlXwtHVVMV501mB1A?=
 =?us-ascii?Q?Zqru6k5e2yhtRPXLbBCAqJubP0Ages2ycu8GyWSr3wIzs2Uk6d7O9hx2nPiq?=
 =?us-ascii?Q?wgYKTE2PIpEODZDVQoshiPSX/e7nJ9Bgvr2zWxTj987iHZC0LIF+gqMlRWCI?=
 =?us-ascii?Q?bJfPJA30klwh8wdT1iSkOXrbazSaTMZEBr4fUHVGl3jA0cMfIoHnsxvtY8xV?=
 =?us-ascii?Q?s4oFZHA4mvq8H1ZhHpd4+sLQOLuQ8vG81UHC4mEz1TPfKX0FZe12fJ0+BCbE?=
 =?us-ascii?Q?kZ/bm+7GBdp+T4v3MHe22oEAMjBxGSVgeUIeHwJVwQFBSuWecQxMHAusoNyY?=
 =?us-ascii?Q?tnMRrGo2ZaSF5hkuIDOEj9CxasIGMIThcIfaMograOt6n9RVLCwuCm+6I8kD?=
 =?us-ascii?Q?+++kOBOXFRkOIrtu5dxpI5wgXLL0cyh6ZZkagBwRmnsdYYNFrjVKJR3/gwNf?=
 =?us-ascii?Q?MNrMAR9WV1Tt+rg1hd+F/brPASp9lr0IcK/XHll4gfOfow87TynWXCn6hV/t?=
 =?us-ascii?Q?9I1lV+ufBZIumdkJ0WgdCndhyeyPADrFbVf3xe+CrNNp/h72oGDe+oBwK5zN?=
 =?us-ascii?Q?X1c26ittzypcQAKRv2Ux8Ic6GUa4gzuH3JwqWc6fctLENF8ULMLgFCcXZkC2?=
 =?us-ascii?Q?HAw4FiVs4iu6gi3/LsmEo3Vuz+VHCcUTVkVrrFDJW503pXWPhaScH2DkE5HW?=
 =?us-ascii?Q?zg4VJMbJQSHm3pG1f0L6BEo429U2fX7tSXoSu9GCPVSFHo2aN6LWRPfwrtX/?=
 =?us-ascii?Q?dGpnY++rNWORJvw4SH0uCT5x2G+WyaGROcDr2o6sqKaG6oQQHSYdq+cjSvII?=
 =?us-ascii?Q?iFQZQjxXC4QFKJS8L9hoUClJXJq2d9Z6qcm9mBnuqj+JfZifJssEmBi4bF2d?=
 =?us-ascii?Q?x+o8h52KQMYeZ5nc53XJlIy2tOOXaBrgeZk1A+QJr4kdMg+CmdIBoG5X5r9M?=
 =?us-ascii?Q?hhGYq6A63SyhuWMlGuRhG1U7llGy3iDKqAP9aJ7lUJpYvR0xBta5PvzOtrDV?=
 =?us-ascii?Q?wODPjd/q5c1Dg6v19TcAv8bK0niWiAoxd3tqlyJbQwdVkr6jMIst8BMetgeo?=
 =?us-ascii?Q?gb4FB8lC69yoKaRbwkecZ4Qf4JOSur8GVSOuBmVE2mDuN70Cm3EK8VGeTcb1?=
 =?us-ascii?Q?SOsoypIUT7jW2qRU4XtP28sCk1iBt8d9lEjuSmgjq8lnAethqSl0wBrjcMpM?=
 =?us-ascii?Q?m6jHNDQWemeMCHR20A/GOg+R2NoiZ8BjBWmnKdHOI2Om2IeB5ne4bXGeeqZb?=
 =?us-ascii?Q?H6095lKspfMaYz/kdd26OQnUAThJzVWz7gKbqYKJoy6ata+qKgEy61+Wz0fB?=
 =?us-ascii?Q?CnLQek3pP9aSnfzm2xEi1F6sR/JQRmPaJWWMAsWtansQAMAOiqw2PB1+dKdj?=
 =?us-ascii?Q?x4w1p30tlRb6hYRCNEMlUYlYR/lhyBuc3hyq1CXgX4Lz2R+0r+QqqTCT2hfW?=
 =?us-ascii?Q?kLGWHagwMj+8F19cCC5HKU/IVRveVn+CZjj90Nj7wAdLliLoNaI6p1p2RpCR?=
 =?us-ascii?Q?Le8Om81rFcxr7yJexZsQo7dccX5llA0yE2BfH5gbwI/mT5V4zFGwSZ2HXcAF?=
 =?us-ascii?Q?kf4a2y43WR4z7hEKGQ6VbmMeV69IJ0+FxX2FUFABOhIk3wWFqWBM?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a042d2e0-1c02-497c-2750-08de8046d239
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:51:19.9480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8SqnwSMxzmGUEA1AY4vAEJXmbQx1H64x/YgifXcuzkOCqWXigJEW2TEJjQ2yvVRw0Gqxfocc5U0slKGE1iPQB63Opur1NtlilYpi8pUB3HkWFc7AnvzkILyRWwNLJWH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13770
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29287-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linaro.org,linuxfoundation.org,solid-run.com,arndb.de,oss.qualcomm.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 27FE0273AC5
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



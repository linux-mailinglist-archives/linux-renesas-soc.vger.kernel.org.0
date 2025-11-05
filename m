Return-Path: <linux-renesas-soc+bounces-24166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D019AC368FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 17:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 834666633CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14A23328E0;
	Wed,  5 Nov 2025 15:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YFSMKGp+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF17D2C3247;
	Wed,  5 Nov 2025 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357300; cv=fail; b=lCD3CbzBe+9Fii1eIOcLRHvBXclkkjsRloNO4GZ3mSu5LWEkh2Nno2qmKaJ5BFfx/KzCU2qegdGXwht5GeN3IqwnOBKhvXgvju6tvnT7dsTqzhXPvLF87dDbIg8y0Us2dd3tAl7JryQT36BZzMIMNdOCfNdbIvxuW55Q+fU1JD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357300; c=relaxed/simple;
	bh=oW83ADRwRC8TZZ6WdatuBEgQWiHWM/eET49E0Jdhk8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UTH0s3L+brsH9qvPMMM+ceu9Axrj+MQFAmZZLxiO4nN+8G3gQWxwXk6GH0qgC69u5tLO9p6LBWgWWVEWr19phDXgpbToWdOuzWU4JaMtLWlh/va7zoFGEUCpbsp0KJ77DjbtqunQGWIeWaL5fMgMvnRtDNtjVQNhjic4SsIN0ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YFSMKGp+; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8mMXlbni7fw9feQzu399kcKoEk+rOx9jbDoPbN8ftOAgDZ1GFZpnABgz7XI4ngTSEwtzHPHTWf5gUncPCRxO0fdVRrTfe3DljdtWYpaEzySzGykR2to6yGRUgSRdlahgjb2Vjx/ia8831BegJ++VpSd+Mvchz5IV7viHi0gTEqPmRJKRo4NHXOkGGq91dKMRb8sFmHYMKnwk69D2J7lMG0mLXstfALv7fg2oFMRveielSp6SqIwE1r3+pmEx+KIchoVi30S0tdxlBLUSMcfNPpjHSksBBf6DcLsptbyPLUEHKimK0gdfpqZg7vSzVUcQKmGiDvuSjXOsjxV83jVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNx26gTAxoUeZIkQGnqPL27XCws41JmPtxczN6MebP0=;
 b=qm3pbuJrPO5LhU9fVU31v5tu9KPhV9K9M+lZ9M1bfPlop4mLjgkz8VHTaVCRXvZyArEqV6izi3MqacCWUxgq+at7XowHEyk9GCIQBQ4uUPg1Y2KOZlQTKFTKO9SzA54L2iw9BWgho0eprM4McST9rCL0mkNfgm3MGMZ9R1SgHPEO+d7KJUXYdvpMk+wig/5JkrFr8YY1XI8vpKLWLbO2U6WRCcmt/62bPfmKH47rID60OmKPuqjxCLOivLhL6NNwDPkhgZ+19he+hLKiycabrb91Zi4liPy6nGlfR4QfRMyVyMSoMcyAZjDjCAo8A2gMFDwsg9dXFHuyhbjUiMLjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNx26gTAxoUeZIkQGnqPL27XCws41JmPtxczN6MebP0=;
 b=YFSMKGp+N9cYeAHDuoRbVS7ZozIjmCANGWwpwosCpAIeLz6YzOZ9ey6IBz/ejk3aT7gC97G+ANyTyapVvGhVGBpizLAsD3wANlR8XMc1VYrx6JrmNE+t7XLgZtjdDfUem9KNcZ5mKlsr1ooTVHTfD/S5CDQg8z0YTpR1okdzGIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:41:36 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:41:36 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 13/21] dt-bindings: reset: Document RZ/G3E USB2PHY reset
Date: Wed,  5 Nov 2025 16:39:09 +0100
Message-ID: <484bbcb009b569d95dabb978ec4ab96e5378ec36.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: ac398a99-5f5f-4a23-e936-08de1c81cdb7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1CGBLteHSe2AZGWgjznUPNSb8GehHJxyyx8TKA/trCNpgbnHA15DE7tnIM0L?=
 =?us-ascii?Q?xPI25lf5fyEWMj5/nPJayESMadFuN7Np8QjradK/x+ugeffzruIzj45SK82z?=
 =?us-ascii?Q?t9F+u5ZtiH7/7l31tkNgiI1ZWzn+Puuo8SSZLwl3LhYZ9FaqaJXojWZlaLt/?=
 =?us-ascii?Q?P1p1KVe3iSxpXPrbxGE7fIUlxI5e+uVwhAzdTc7SRNVj02meiAObS5MjXF1H?=
 =?us-ascii?Q?1wI58ODKBS/IZ3oHHaN+wwIcf+ih+uh7kgvwZAO+V7HGjGu9tQHBI4CRr9Cj?=
 =?us-ascii?Q?7GFNBP7bMwYHZ/lvPTdimKuV5dScFuZO5sUGNJDnMPqqRX96PsgwBYX16aRJ?=
 =?us-ascii?Q?HZG4e0BjaNAQTqSGeqPUKyPwNlMXhbcKeuTM+/gdoQYla5kBrs0CNQhaSH1Q?=
 =?us-ascii?Q?x9dBnBMQ53JLJ45UmCA0wf8fYVzCh9nxLfPbyPQCGP9e4Pq3z6firNtP0VOI?=
 =?us-ascii?Q?kDMELsiNr/4qu8Lc8XrJOj1YSr7f9169s0vDfca0MRZuUNo6h15yfz1b5au3?=
 =?us-ascii?Q?YltdOfbrFio4ncnmLgXFkdMiONr7WW3rABawT8ccOJTUhIKQe3NpELDBO6cP?=
 =?us-ascii?Q?XclwmET7eqS2S+LVPx5XYsnqEefktCP6uo01K3/dhGSO2PrNUDRRRx9Ezv3M?=
 =?us-ascii?Q?F23JZmGSIm5knHAho2ulk3PinUkYfJEyCOpMZulutlV1juFQt/rMurwnGeeI?=
 =?us-ascii?Q?pJbQQPa1JKL2AKBTF7QtdVVPtIAOWb2+D/oeT7FK5m4dEXswRAUq0jN+ZoNf?=
 =?us-ascii?Q?uBQtkGP42svBeXyYeQoR31Jdx3zwlqRLMnvuoQ90vGjLvwl0fE+HqVw3JQYM?=
 =?us-ascii?Q?Yuow+kashJ0sON04CnyI8EzHVFtpU9eEhbuzbUwp3CvVHEjg2StHXLENmYDk?=
 =?us-ascii?Q?bWwL2YMsAYwIKxIc7+e6okhLbUzUnrxSjsQ736JKoVLW2oRJt+fRs8643arf?=
 =?us-ascii?Q?vP9e7VHQYtEDMUY6pT+5NSaC8ryWHy672cZci1BPRj5YzkuhtWzSeGnB96Ps?=
 =?us-ascii?Q?UhKceu3IvPXTsOiBvVx8pHT5tHBSK+vIc4C1PvH5/xqxklxZwUHgdqnotBx1?=
 =?us-ascii?Q?ukADtvDGEkOBaibuigdW2ot5oSs1VzQQR13FQihafo57pAqdlP8Y3gc8GDtB?=
 =?us-ascii?Q?eK2mT5wIIXRJxZssNPLI3wdrDw6k6TL4gh3qNH6EsuAzYM9qTB7DHS/xQCvQ?=
 =?us-ascii?Q?qM4HodvHkUa3LH1sHr1xuPr4Qh4g+G+Up4S5B0hlH7MzLk9UucWXrxTgi5f2?=
 =?us-ascii?Q?HoqEJyuvbea6JB223HMHbTd+hI/PMkxyVBfhGKpjqej3SMfUTKb0CHvvHmO2?=
 =?us-ascii?Q?8ywqUsOdjtUPsNJzdjF4nU3NApw8uGhyq1OCLt2YegVncmJ6MB0tgW4MDmwM?=
 =?us-ascii?Q?mqHMhm+6QVFwvTRqtXe+PJiOEa76LjghTs5iKk0Roai2RXHln6t0VYN92X9t?=
 =?us-ascii?Q?EsgwMmDdXO8QDFaGM8jOKp4YTU3b9aLyjp+lHUbD46nLnNGJ2Je77f6B7j6I?=
 =?us-ascii?Q?3RKs7bjdGeOWl3AOrN3gEdA4lpdKJDBLMsyI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rJYoZ1a3nIKybbqON2fhb6Enp42lGe8kpyAYBNAS4rRuETzT6fsd69i1K67E?=
 =?us-ascii?Q?jyrPgdpy9yw8E596vBrE7KqbDMgfwEei6EFG1869fsj46J2M+1QfcNEZISjB?=
 =?us-ascii?Q?U1vAzvByVvQicP0mxnjXdjZIFd1MDBIqQNADaSh+/L6REfQXZNQtzTKalZSu?=
 =?us-ascii?Q?4sbfgmKxahaVQs+iGdqU+FTyr6eyMUCTrVdY9ELblrlksiHBg/QAvmLtaVOK?=
 =?us-ascii?Q?cK2nVqUviJApEcC0mdwcNU66JGG2iqoln1Wv8L44SuTd7XT61fHr3K7ORtbF?=
 =?us-ascii?Q?QjowTJX//nuceSOuuxecE9kh8SEfZ+NH8mGo76q6LbbzmoQEEzbgKFnvy5I5?=
 =?us-ascii?Q?7N8iKb4nGLjrW5rT6qYz4clGhImPGlTIpcR4r6vCQLS37/dXfHK/5kgi3u7T?=
 =?us-ascii?Q?APneQwZbtR9fSqobhfg/sxe89FliV3ExKducI5wgVXeB/tHrsWtmaY50f6hw?=
 =?us-ascii?Q?UUqMChozz5ZbffYmF9ZJY0lIfSv7CtsoXd+u1lR01PS8YLa9Nw6AyRJ/9+Hd?=
 =?us-ascii?Q?ob87KEpkBnucaC1xurut98IjYmojyXALIshivfhLzV6Kf78W4rxiDQJ5k8Zu?=
 =?us-ascii?Q?KlDONm0qjgjzE6xR6PSVOc8i0/QKOgS/ZIc4ypzDAb9WRBlr06kOdVN2bxDt?=
 =?us-ascii?Q?i+Q3DiBZXMaf98/CsRM7ZbWCovdrnaGi4N/W7CbhRB5Pu+I3n7bmYWW/pSMz?=
 =?us-ascii?Q?ItweDF76fPQYZUD9b1W39AiXo0kUhnkHNbC68e6cQEBA6+uzM2aslSDgD5tk?=
 =?us-ascii?Q?/DC+yBdlp0trPvFhlZfPJQfqr5auTRUCmRHMAwQwhB8z79zHf4MGkv5IsWUP?=
 =?us-ascii?Q?imYiL2tCbXZyx3+JgP6bmYRtJW9BGDBJcA7uSLHABITOqvbYcwy5mJYpEU2f?=
 =?us-ascii?Q?9aGsgEigt/WcDdZFKG64dG6pWhVDfIHG/fmAlkxkN5ag1/rfNmSGT8mZoAgm?=
 =?us-ascii?Q?zu51yUY6M9u99996BOnS2FL8foP0pwyO97ch+a/qytxP2E71hujEeu8ECyO+?=
 =?us-ascii?Q?yyrMJGv0cYhlLTMCUwMM7+kLPUNu2ByvjlMKycZ38gRiILW37QllcK7K+eI7?=
 =?us-ascii?Q?wYWeU3tcALtg0rlNKWfN9VRaq7unJqTUHjF+fklXm87r/3cqGBJ8c3YcaGwg?=
 =?us-ascii?Q?6pmlOJh7g0EQVG5JIdH/rwgeDyrXjCRBWqIvjFYMNGf4x2MiMWt5gPA7BryQ?=
 =?us-ascii?Q?5fIillgTqbC1sa0chd3Kcuwr3pA30YpGrNBaYT6Tp2TCFiC5QTmdn5ltJ5tI?=
 =?us-ascii?Q?8DapymcOLhCqI/lv70fZBt20TZ/gqYTps+ae85EgDwKtUtQ6bO8bKm4A3QlH?=
 =?us-ascii?Q?AarUSNMq29+of74skoNvgcbaeK6lVRp6ltxDgaSna3mM91i83F99TXlT4SMj?=
 =?us-ascii?Q?1NDMNVNd/RL0Tp365TZdXJ8gLZZLr/wzzdLVHA3k+gdRex1pQ/hzlC3Tn719?=
 =?us-ascii?Q?7/mVpQ36IIu3EYrh2uI079oXp2i8fcBQJG3kVilTT7sHqtT7aPOU4WwC0Aq+?=
 =?us-ascii?Q?5AwDc2+oApv7eULIVN4juFaWSG2iWx4sOlDrZNxJuSdwn0AS0VIzjMMFMG0j?=
 =?us-ascii?Q?o3X1btMvO2Ph5YCDJIBCEsqORzvujMcWxup7TK4eVS4LnqkOhpd0J0gbjBDI?=
 =?us-ascii?Q?KbzNtat65zM/7hZjPE4KIO8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac398a99-5f5f-4a23-e936-08de1c81cdb7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:36.4676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh0Fn/AGqXxxPDnMLmEHqXaATL+MYXftFBR/qzL73tfYMUpTDgLbhi3/IE+OetwG+Yfv5gbwvFCvsBHcro0pma32moN+Qm9wnSp2slmwZc00xfPMIkc/QlhNmjnK4WxL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2PHY reset controller is functionally identical to the one
found on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
for this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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



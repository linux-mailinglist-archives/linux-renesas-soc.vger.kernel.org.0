Return-Path: <linux-renesas-soc+bounces-24972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A15FC7A7C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D2CC3A3BD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43688354ACC;
	Fri, 21 Nov 2025 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UFdus9Vd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C434A3CD;
	Fri, 21 Nov 2025 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738104; cv=fail; b=TkeWlImq71deHebymEHg42eLC3fr8uxVkGPyGL3KxfRDQB6RdUH0Kt9yWKiTcATcRzNAMYSkfQml5G43aQRad9cUKgIFU76j8CrEc5YfcoBjcERC5n9SpiKt6LrAEQA1OVF9aRVPKW8vOOFiJxE9hDbG52I78RiYq/dZKs9QBmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738104; c=relaxed/simple;
	bh=UOH/+4sotqnxTwKMIrZYT3iXRxZhSJb41odyeaW0Dco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RzObYQ5sU5HOYgbnRS1C///CIhU0dHZQsST4AVVWDytZj7afrKxs6kye/5l9VpC4P3WKpDp9oucWAbLuDtKoojrVrIC4bdco/Y9mPmsc+nMEO61vyEPyp07Pbf7T6WxifG7BJBc2ZZhsUHALC77fXn9x7nyeDetmV0nrfSGJI40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UFdus9Vd; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8ltAEcx1y9FdZsO5UxUHYBq/6grqy7xQjVqDXLij+i0N1OBUMnkmFtreXf2c4zCyiVSfkFFEJx5p1YveOYyiftpYYUK8cqKHCVr9NxPJAB7/qVWjSKrzB56/HJpEvgxA06toqjyjE3ZHMfX14EZqyC9FFpA0fMG8VyBqVhi0OHbE2TY0T+PMjXSUg1C7lvjzx7/eUxQCIee+tdr7hwrtyBrNYGl+yQ0FkSVragGqMiC2igO2asGT8urf9JLiK4THakQMcJw9wUhkD1Bap2lVMnK7Q41nJSptd1+CLJQ4e4XWCJUCdYFTKxn9bfu9yE92/zt3ZM1oLr+TV9YxUvX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqwzzHMbrAiuW4QHd7lEc7EyM7OiUw5/CIATbS0uUVY=;
 b=FXztklNtAQJYaEPINltJOnvfHEFuYPD0nlBq/EXQnFjOPQoC8YBIBUdNHm6L7IHYeayhDc/t7hfiQIn5bJnezq1eoLTd7um6G0ZXRiY4/qtVoWSFP/ICVhSNC+mTyWlqP/tbt8G4Neu0V+QsrUSRPdd9alzv2LzLypImW6Tvm/R2dgy2tIsf6zL6Y/uOoLWDDdo+MnobLjXuTxXBqCCmnrQsMgJat6OYmL9pvwUq/Qpi2DFnuU/dRtet8cuqoR3Ml7qqHuPRZ+VxfJryrrnD5szeUldcSl1PLRVWudNnZNOCOH0AavmWtg7OyabtqwtA8njKcz69G7gWBa0aFEtt/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqwzzHMbrAiuW4QHd7lEc7EyM7OiUw5/CIATbS0uUVY=;
 b=UFdus9VdWHvi+U1UPN7T+m/YpI80gVCz8KiQFKwBumA82it6nZmzGJSD4q2Rmg/5RLyLtNTNZeNQiwZ2LWP4PTXdrcY/3MfxI+9Rvbu1ghFtfUkSlHn7njeImwFLWUga4PHEfeRVu/+cjDgHfW78cttNuoPH8IxE/P5CYpBbr7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:14:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:14:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 15/22] arm64: dts: renesas: r9a09g057: Add USB2.0 VBUS_SEL mux-controller support
Date: Fri, 21 Nov 2025 16:12:04 +0100
Message-ID: <209e2b99bdf95b889e25b558a1946f09f02b1124.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4ccdb5-9b74-4e02-77f3-08de2910bc2b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q9E3HCxS2oS40+WRsQISWkQAZkLkd197lK58yosCxd7n/pNP9T5RnD5P/JYD?=
 =?us-ascii?Q?L6TuxnG8DS2i8HiFPbRP9z5RrKER1yLIP3rk3gT+SNM2moRJGkkENu+++PNL?=
 =?us-ascii?Q?gM39hhw9FaKCYmsYWXfFidBOw21kAeE/eyNMpSQuWvOEJ9mxJUt8Lq/m5VjC?=
 =?us-ascii?Q?8JjSJk8QFqT18NdTAfF+z2rC0OeCtQ4o6ykUj3gPSmbFatoeXO7Tek6w5RwI?=
 =?us-ascii?Q?bJfDjFUIH2yaKw7dBCkNNcHTBC/ci8EAlBEAC/nASx+owObfY8nzIWiBrY44?=
 =?us-ascii?Q?H3uzUB+mdL48rjvPbfn/1/2Brrec864KdTH+xcRJIS2tvLcxriENFbASqbnU?=
 =?us-ascii?Q?s3R2hVe4Jnp5QFbfaivtgkurGacPiQsMJailzHYVzxLqVt0KcBVmHd7Crroo?=
 =?us-ascii?Q?7q7xFOF/sHi03Q5fFwl1hjPXEyBZLXGuZKQTVyjoSevtZMGvV+C+gxzc+8Mk?=
 =?us-ascii?Q?DBjRl3VwF8d3xzxLUZsu/mGeCJtAnjKzOgZgtVZQf3NIeUFtutxOPQrvLcd5?=
 =?us-ascii?Q?mpQdimMi7i/FSdNeUMyOl1/S1zpcYIqcXOuvytb+2tvDMq6JNbdCjtnGnSZT?=
 =?us-ascii?Q?OKsC1IaBQSgzAiPQcwDUZug4iA98A9KfR0P/x3Kr7DCD63xbznwZXM4NoN6B?=
 =?us-ascii?Q?gtlJKkaL6BrRt3cKATRdOsTIG3Q31O8bYTcMgpvTNBpxGkaEoCqQ5xfXvaiU?=
 =?us-ascii?Q?3UCqy29wP0Al2ub0tX7zPrRsOfDD3XoKf9R92YTgqxAgxdbe5XTQeGKoMIiq?=
 =?us-ascii?Q?pCa9wr6kjWd5AjLEyEOufAfTNAxl35jCipcsC8eb/DDXTX87KMsFWYinUwEZ?=
 =?us-ascii?Q?lKQkVZ5G0STpPwsNMWCKfMdjHbY7LzwTIxo+x27joEOS1ElWh42qi70bNeSO?=
 =?us-ascii?Q?EXDJ3TJJWPY5T7atOJnF+4SwGtMR/zeEbX+0rxZ+eyg+tJHNZxxc1KHHR96c?=
 =?us-ascii?Q?MGAzPNlRX/L3CRIuW9xLa1J8vhA/Dk7qz3JaDiV38OQ8kxG59yBqJ2f75e9R?=
 =?us-ascii?Q?tQ3Uk1cV9t3TJWFqIUUmAbxxq5/1QawCWRzgCyZKz3w64ttgIA+NTBvH5EQR?=
 =?us-ascii?Q?mapq7DH0fB0/XXRFm6DUd93ojemPi/K+Ct95yE5et4E1M9Sx3D53sT/8/PjO?=
 =?us-ascii?Q?CYtTPCnspOkJxJviV1r0b522cJwkZQUWWMrQvpLrIO3Gus2sxvj65CWzcMo9?=
 =?us-ascii?Q?lj40yUo15po3Ic9NOe8r08aQyDeRI7gcczTKaDbrAvwITIlIb6B6qmk399yx?=
 =?us-ascii?Q?SZJBNikeEB8iYcV3g1NWoUn06O85rfAfwn6Tdmwt75YogztE72oKJbGaiZV8?=
 =?us-ascii?Q?PfvOEF/DAg1+iBVNt4e13lHEikMPqukOfOxcqgmBaKgXg0B9onf+yE/MOVit?=
 =?us-ascii?Q?AgFpT3Qyv/YtbzJbiDnOiKt4RlSV3mpHk1roLsFqSu3EPl58Ul6dxUVd9yu8?=
 =?us-ascii?Q?9sSJq5kbzrQl/92AnrLnMyyKm5uLLW1/Vo4GztLelCRjcsDa5StiM4NpY5By?=
 =?us-ascii?Q?aaZ8An/9LEf+CKY+myLRdwNSKfdNWY/2xLG1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mEHgTzuK9/olXBx8lD7IYJ++WaACNqG67aQFKxtG5+Ry+fPffrrfYJdz6ymR?=
 =?us-ascii?Q?2QwPgAzdCdigrqIncgJGDaDuYfRi7nRygYiOpeOqWFH1QJxRMfh/+rX7W/ym?=
 =?us-ascii?Q?myGWVjh97q8F4pcRXUJ8tGNiiVUrJuP3ytuhiTOKBiGadWJ/DpVSUmZQvOhs?=
 =?us-ascii?Q?UVwVQ7PRHUMiyE7XuYdi2WWW6gUnRdIn/kkzAeEzt0x2qNjo5eTO746RdFrj?=
 =?us-ascii?Q?DC8TqCYXI3UaL8ZyQNI9tfLr4EIex9+0+3GVFBJMGriNwRvg622zPThIRv+5?=
 =?us-ascii?Q?UfFBpBdxKOyZ5SqOVJRaHqJ4QZcdPYQVB0TN/ivCEnamGLPPdgoIHKJWWYkJ?=
 =?us-ascii?Q?LThqzGEx9lLzKPZCjqlDYoaq4ua3O92S8zUFq7+GOHc/j/8gAHbEwxfJ5z3J?=
 =?us-ascii?Q?JsXK4YEEUkeZHWk8zB9IGs+ACKJbktopvoKy+RqER7F17hBu4YaPuc+MV8yz?=
 =?us-ascii?Q?G+fZGX5Ym13q6x3AAWhb0T2hLpP5EqubwkutZi5Go9ktxVJ+iBGKHyJ+0AYd?=
 =?us-ascii?Q?cL5JHPVEpX7TzYkiT39D+7qrtB5yAAoe4f6dr9YTHuEWZqVd+bIvwz3O9n1X?=
 =?us-ascii?Q?26XUvL+FnS4O9fJhHTXKc4bk/uSmgg5XyWsBGeu5DwdISfXoSThRXyAodfe8?=
 =?us-ascii?Q?bX9j+SoBg8i8/PauyDBCN0VqSJdfLk7YH3siliadplE2kgAOK3DTCH++8uKZ?=
 =?us-ascii?Q?KgVCD7Ajcz+S14TQ6z/XoiVl+F7bliSSP0eAExhvneh8nuCPb4roCspIfng6?=
 =?us-ascii?Q?sDSl57HYB+C73Sx6RjSzIVAseMj4900f5ITUrQykebDq+3JjN7MCeR7v94Ro?=
 =?us-ascii?Q?FaCiFKo8b7KyXM/7xQHpxQs3uigjFwJDbRcEQ+6FcYERn5XpwpLG3cV+xRtU?=
 =?us-ascii?Q?4IdpT9iDrfvnSZ2ZqYyRv7CVeS6nMR4KhE8F7hYH4gP0aUKXqMgSKmXOguHW?=
 =?us-ascii?Q?ambQaS+stdANdJ8a4dTDdvPGVDtdfwBS2V/yV7JXnFGX4IRJrf2fQLLMDJhJ?=
 =?us-ascii?Q?VvufHEh8lpEOUuc+8vBqADrACbGIvb7QNm5Fp9riHw2G0Mawl7V1CZcRfd/x?=
 =?us-ascii?Q?89z0sz0pPq2m9jnrd7+VVZoxEHqSfxT8vmC6FesgQA3/UoO66nvEFZQS+rZ8?=
 =?us-ascii?Q?oI20xdF+VoLWigZaroRRPrdwYR2iaVFSC60RiO+k9+ubG2/V19WxD8swaPLd?=
 =?us-ascii?Q?Jcd8F8m5RjPs93gwYuYMwYpGK08ztLnF+CriFlp8//09hJRO4T7YpXqnmQyQ?=
 =?us-ascii?Q?fzC8s/y8Ym9w4vbEE0hk8gz08uKx/KH8leiOcrFHN+Fu9yj1Zbb8jo/Mduao?=
 =?us-ascii?Q?QHhFgweyzC7YuZAFX8NXTl1M0L6QL0+u9eKKxRK5j6JdGYPJsl6vIDt2PKYu?=
 =?us-ascii?Q?3OaoUUmF5J26vFZfaKT8K5RMigizHUfyhgox+XcoZdA28CIcXdaQonbdt9PT?=
 =?us-ascii?Q?eOUc3OQDP6wv8s050fjHgC9E3IK6JG8vM1R42vo/Sz/hoKERshrgBj5AMhTN?=
 =?us-ascii?Q?kaAfC4YehcuOkDN6+TRXoPxWsZHkzhVzBVdbw1j2JIdGRZK97dNzRvUbMTHd?=
 =?us-ascii?Q?uGchAB5CzFAESgEzZ3oTiCLIcMAwFWDDPS7XvqrVfpO/6/povjJCQURhUnJu?=
 =?us-ascii?Q?+wh/swvaAVJL7+R5fn34V9E=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4ccdb5-9b74-4e02-77f3-08de2910bc2b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:14:58.9732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3g0P49gOqC0aIBwJMglcey2v6E39tm71TDrPWPy2ENNK7aquHercyVGW+1yRPPmcUJDOGj1Snu0IRhPASL8737lg31POHadnpzo+fvSxXOpCIoEZ1TcMv01kiWmdwlT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Enable control of USB2.0 VBUSEN via the VBUS_SEL bit in the VBENCTL
register. According to the RZ/V2H(P) SoC hardware manual, OTG channels
require VBUS_SEL set, while HOST-only channels require it cleared.

Add `#mux-state-cell` to the usb20phyrst and usb21phyrst reset
nodes to expose them as mux controllers.

Set the required mux-states in usb2_phy0 (OTG: state 1) and usb2_phy1
(HOST: state 0) nodes.

This enables proper VBUSEN management for OTG and HOST-only USB2.0
channels.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - Manipulate the mux controller as an internal node, and update
   commit body accordingly.

v1->v2:
 - New patch

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 4df32d7e9998..b4bbcde33099 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1034,6 +1034,7 @@ usb2_phy0: usb-phy@15800200 {
 			resets = <&usb20phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
 		};
 
@@ -1047,6 +1048,7 @@ usb2_phy1: usb-phy@15810200 {
 			resets = <&usb21phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst 0>;
 			status = "disabled";
 		};
 
@@ -1074,6 +1076,7 @@ usb20phyrst: usb20phy-reset@15830000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
@@ -1084,6 +1087,7 @@ usb21phyrst: usb21phy-reset@15840000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.43.0



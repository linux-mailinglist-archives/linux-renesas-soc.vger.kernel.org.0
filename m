Return-Path: <linux-renesas-soc+bounces-24157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719CC36669
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AC8D634F2FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB36A32ED43;
	Wed,  5 Nov 2025 15:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tbgnTMb4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B582331A4D;
	Wed,  5 Nov 2025 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357233; cv=fail; b=NeyDaaQKbuqaIajA4hlqTBR+4Gvcz8dEVqCGNqBp7LtDDdL/GmyK5LX6TSsp5RXqLfiCGIk682emCkJj+h9hT2ZBz+hWodPf+6PSalPEseuKcubplCG2FJahBFyNlPC8sU6g8c1lsAyqUjdpKL9PR5mduDEMTBiTxZ5sMInUZpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357233; c=relaxed/simple;
	bh=H7FYCZE9my+9RRI/YWotUbw4+NdPAgWuP69juWVkS9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FGu9XamJrktQ31ZCqK1X24XgOvkkgPJui0nlowUdATdi5PTxtW+wctbkbhx+b/a6HktCf/BA6XdX9lDbdZX2MkXgjyinNIcBbrDD61ggkYd8nwj/mML40532Hn+qCk+A0ywGX1wHBocKDIqMEjuCbdQ/4drXvvKy2+p1hB9e0eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tbgnTMb4; arc=fail smtp.client-ip=52.101.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNqxz9JbaKWj8unBf/8ZCaAL8RIe8BaX6VZE+dbhZ9fvqPAN5c8gR9/co6BOx0ztsOquXZAZXc4Au13/zrf6Nr4rgKEO+3z9S0EIJszlijWTD9GjZBmcZ9pW87fZab+0wl4nZboZwByGOX8LlQr31Leo63sRj6elEJPXQNP1mnT3p7ZB2OA5SLcRGPzXTBZypEY+XbBS2fdZYGIWpypRveGH2FzUzs1S6RGmVE+/9p7A6xEM9W4+XvVAtSKhjECVpByCAt8UY3eZ/74btjn7MjGy9peFqQSGkJV00zMZQOfvACmz+zUHkwBWQ/8xyMj4xXjaYNEhAC7rUEK+2zO0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROE2wmcdnyqT70UYvWYAL3r2jm1S9AyotykLWqNWK7I=;
 b=g//O/AC1iOljrgftl1VWrbQ4JXq812yTQ9WP8vpRpSBeCgJvrasoJz0Lh1MjKuE0/wbji7ENxVUGK36+i61j6ZPd22rApKstBQrSpQ3nO5oLqXlEl3BLDhvjuyBU6zB8/GkWgKI6im78gzfrs8eOnmkPkov1BW1zvEiykYbDW6hea9De3wn9yGKhGaUih05dS71PwVfwX+dTetNG7hY9Y1xt4npijbWyAKPDA6tPxFcclrO90wdqiCkZDuzkDbkkdbAkb6tFk+mj9Kn59X9XzLTdDH3gLe0K3C6+fIW2/aU110k3r3Xyvfd9IhfFUYyRBgjhIJW9oyurhJegPF10lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROE2wmcdnyqT70UYvWYAL3r2jm1S9AyotykLWqNWK7I=;
 b=tbgnTMb4pRPI1MfWfgcculPj2GcRXzkcuQnTqTj8sMNi3PWlEEthWAAMPw7xNm5TWdvvPqPtNhhK6DKh+1dAWKksAfh8SAsqtaBR9VqT3yEwML1YshLmTWwHLf5Pt0sb6gagNpq6PFD3S92QYnglXdPAHzlzcbKJy34LhHG8uJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 15:40:29 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:40:28 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
Date: Wed,  5 Nov 2025 16:39:00 +0100
Message-ID: <961741af7d4ec945945164759fe0d78bb3cf4d9d.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: b387b469-c9d0-4f73-916d-08de1c81a577
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UiRYdJz1kYn2NovXmUS6l4EB5JbrFZxUzc8rshRf8R8/EGFSioK8ni+UWdbQ?=
 =?us-ascii?Q?AmC5QMnJdRTpPHtLzqMfESwtaTSX922EblQSfgevmFbrA+d2Kw2eizn0vXfD?=
 =?us-ascii?Q?TsQxYqzB1ucuHMQKiGmStmFJWU3mkO9sVaJvnoPZKq8JxZTlJ1CrYxjEEOKa?=
 =?us-ascii?Q?8Q5QLOFDXdTV1WwMPTlnhpTQdtYKXniNktThFsM5N/TVCDX8eRQTx+dMfEqz?=
 =?us-ascii?Q?ealUGJcw+14ZNM11LOuxYXnPfWLdsCBV3LCZ0dV9kJqb+YI9/KFGpV7I5nSB?=
 =?us-ascii?Q?/CpYMIqUdhVPsumRXnCDQTSOdmOV7BHeHnj4citigBVJbNZjcsV6gl9v5C4E?=
 =?us-ascii?Q?DnUqQFXwGfNTFQcW0TMdj6RK5sxOFw0ZDX3S55/fCkgzCO8Z++TLlnlMi5FC?=
 =?us-ascii?Q?htrX/6JZFDW6hkRrLR0A891Jr1exz3E4eU11XcKgqGvBHqalKrxatNL2ogpn?=
 =?us-ascii?Q?7QgMw3N5e9gMrM180JyjWDKp0j85aTMvHYpOVHRGI8GZTK8DClxaZL3uxaqt?=
 =?us-ascii?Q?M1Q5meF7dnlyRVyXKEjICEdw61RpunqInPWuN4LA9JMicULL+aFmIXbqLPFP?=
 =?us-ascii?Q?IgcpV7Eswy9aU3LkYH3A/9RJVw5IfQ5lqaOXFTGGsK3Uxn+vNjHpfDe2Uf+j?=
 =?us-ascii?Q?UtfFPkbXI3GpwzSME59sGmOxTn8dLvG+tUHNNKrqJTQemo5Ftg8qitAO4OhE?=
 =?us-ascii?Q?HX9RuYo7aUWh2LsLzjcAFUBcqtPLhdgj7kdu8Cs8fglekMmmm1OBNs0ldaKR?=
 =?us-ascii?Q?jnniDoQi++yK0OWAYeQc/BX7KoVn0y2S8P2Sen0iJNlnemQ61yY7fQzxHu2Y?=
 =?us-ascii?Q?h04wr3OSB1walB2abrWGN1o+lcJZ8NvpNgdV+FuTpKDwvjcFkqTrp/tFWHlc?=
 =?us-ascii?Q?LtIsUk6oSAxAh3UHgKGLiTAz1hGaegoGuWSDRc/q1HjzW0rgtwwbPGhMX8Vy?=
 =?us-ascii?Q?o9MwbWr5hqWQjfn0Fjn7o9tEuZ5yjPAO3hUJUnmKmiZuet58buy4t9OLWbeB?=
 =?us-ascii?Q?VfTJn3KTrOF9NwaFfDO2v3E36s/FZsvflJD+BmtxbiSvZaPdPEad6d1aQyzj?=
 =?us-ascii?Q?ksvyUWg4CJbs/vFOScJPznEzsMAwe8xllCjDT6XwKAZ/J44U3ZJkhN7wRvpN?=
 =?us-ascii?Q?C/bOSiCxHoUo+TdHVkNfmlOnFoMNXHjXI0aP2ybFb+2E6pmuls4BN8pTYQiB?=
 =?us-ascii?Q?ReNwDIIAnsTtZmnNo+7hZpENWHfPAM/zWEoQDWfySqtDXchSlZjmqhq264ye?=
 =?us-ascii?Q?NBDafglHkFAqAGgy2FhB3Jfn2jSe6DaUk2eb55j0NMb96CmjSw5K1HiM8wXq?=
 =?us-ascii?Q?hiT5hAgfyEqzBOxTB8MzxpXeHKJH0TBZj1b1Tjk+mmPSwZbVvvizfgrxUNUK?=
 =?us-ascii?Q?YmTKhhZdznzAFxPHMYxRPZU/OXqqABTzhBFPyhnSZkAGRnYNQm1+fFATmmUJ?=
 =?us-ascii?Q?UL0Wqz73cOZUL+/x6LgfWV1l9WldhiQuLjeEQtTS3EEnST6mAoonE2kM2H0B?=
 =?us-ascii?Q?VdfWYrWxDGIEUKbY7y7ccMY0fpxU/NHE/PMF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HVzNxzGB/wT72knOOz/oqD1rEn6h4bCEilhbILLtlMThI6/OO4oBMYZ+xaOl?=
 =?us-ascii?Q?eaoewlzmafq16px3435Ia8+tvP54YfapMCPll2CeNpPLFMWPZeIE5IoBDj2V?=
 =?us-ascii?Q?LZf1k+aaYZjvr6TdocUcRayBmx/uHFigIBnnl+siaDGKqiZwThiEujFgJfjJ?=
 =?us-ascii?Q?byUHb5LlK9onmrxm0YXEYt3wqnjJMfK72yYWRIU2T37ft8ZMwopUKpk60UoF?=
 =?us-ascii?Q?4lkf6eCCYhMTV3r9bkcTMGmoMoVT7RsuUGHKyirxelpRytT2KbMWKpGkRpcr?=
 =?us-ascii?Q?W3Jk4VtQtI2dG1pRabVgoBaozCsl3Y7HcJqojB925DNjg4n0n4cnmrSjcMVf?=
 =?us-ascii?Q?27RisxfWDR5zKA7w3PPVj912LgxuymffxndHCfUEiXVZmbYbx1ACdkPbXxDo?=
 =?us-ascii?Q?Pp8NCpczvHjhUOhxojxoX0D2Egj+qhNqsLWQgYH17q7knrVAXmTUYvVcI01Y?=
 =?us-ascii?Q?VTreSgPoRaA2hdIOMYw+vmYhsvNWnUL/g0SpHtFQCe5R4Qd87kPTLHw0sCi+?=
 =?us-ascii?Q?k57rsVosvB7u+gv+n7jL6bI0ngEw+OxSTGV2IqKIBLmBvCXcoB01/TSm7xXm?=
 =?us-ascii?Q?QgnNQHIR+ZJFU+QDrj7NRSJk4elpm2NiRpnGCa0IcLe+eNubFerqHjx7m/11?=
 =?us-ascii?Q?WTxP2DFmbcn92ZcNFpR4rQez3A/y91ggVekL9kvpKcfmxbi8AGsm6XotT2wR?=
 =?us-ascii?Q?17N9/9sQolBz2aFwzKt2lwAoUlrVkL7n5za+ZGpOG2cKzsPYd1QzRrPy6DBR?=
 =?us-ascii?Q?pOYd5q4D501uu0tYF+/8Y/xPYzqJvNmB9V+//L8fP7L6ubuMuG/jI5cxakVP?=
 =?us-ascii?Q?7cs627+6aC9l5Yrc6wjpDMCP8j0ALRwGjKNW65uzXaETR9I8KvRvuGJLt7Fy?=
 =?us-ascii?Q?R7s3sA/va3/lmuS1BoY3/qujYqAnkWWImx7QrpkOSzg2iFRuzzSNb30OYVvd?=
 =?us-ascii?Q?+9WQzizGbRd6k9GgeH2c1HVKiOmPD7kru5gq7Re6OD5EaXMI2TELk34Ii8+E?=
 =?us-ascii?Q?njZf7eMhPgtTjruhQe06wFaULOozt59VqCYldfK5xc2W7sv3JqMTrrld46LN?=
 =?us-ascii?Q?evIzNpUi+lfSuFMcQmBn2jYg5r3k/cgPbCw7dlaFf9UYKch4jWgHY0uzT1sM?=
 =?us-ascii?Q?IvMazVlhlmkB3eN3ToTBREucCHPPVaPT2RJOHhpKR3jzb9WzUhZ82qVWfkze?=
 =?us-ascii?Q?P77u55cMwQ7BpB4nXkJvU/PhfCtfQaQ7zTDLGxLs5Q3IprMDjl1YwU6vIZ+3?=
 =?us-ascii?Q?+PZeDyQen5Xrk3mYqN7nxYFl7jMKH5OsdaCldJYQGaCRYBnEOpUufYNAYD87?=
 =?us-ascii?Q?fus/h1Peq/RYMPFF9vlWPKQ9cbl7g7PIrRuXuknOOf9xAyQisFxHyiuzdI8Z?=
 =?us-ascii?Q?NSlZbjElfvh5HkSTQDKpEedmCTJtSrx0fya0l9df/k5F2lQ3FIll7iKAI0/i?=
 =?us-ascii?Q?MIdt30JRq9KslSIpuH+0CiJUYbgHwFtWD3DL5suVy+ATAO5ff2fViotA08r/?=
 =?us-ascii?Q?4qXwtUFJA4wepHZkkZiVwTmzHF+JSE2I/vgkcQnUkzJOG7VJxhGi9idZ0g54?=
 =?us-ascii?Q?PoFxH2QI+yZ6zbMIsHRP4BqNiJ9wRS8Nzs1IySpeljCpqTQRmMvfo3/LqUBL?=
 =?us-ascii?Q?pFM4OIL1NbR3P7mhgkYu/wg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b387b469-c9d0-4f73-916d-08de1c81a577
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:40:28.9381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UwlUZtUipVr+716tKAvUsOxggNivyzCQPuCTJgBhsJCZb6EiONMgKuMBRf4MlBPambo6bH3qIgGvVoea/VmljtvclYKOkiUD0n9fSNglwqEFhg9Hnr/bmIOZ/kQUU+j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

Add the '#mux-state-cells' property to the Renesas RZ/V2H(P) USB2PHY
reset binding to support describing the USB VBUS_SEL multiplexer as a
mux-controller.

This is required to properly configure the USB PHY power selection on
RZ/V2H(P), RZ/G3E SoCs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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



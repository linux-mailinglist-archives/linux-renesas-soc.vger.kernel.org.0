Return-Path: <linux-renesas-soc+bounces-25990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEE9CD6390
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2AFA3073919
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98017327C19;
	Mon, 22 Dec 2025 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W2Osz1PT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189C231ED8D;
	Mon, 22 Dec 2025 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411080; cv=fail; b=Mx/ywZTmXq4n0mLMGGHOXut5VZVkC/cjLuuD07eaAYUTIRehe5CrjTUon2uhg1t4itI0vI0+t56hOebiR6H8PcfssZ+H3RiyQd8XCwcnuuBm/mIMjiyE2ek4QIZrPxz1lF5hTfemNyGKMYGdstpWr/GhIlk1s4ogItxlZ3eqShA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411080; c=relaxed/simple;
	bh=9sQqoNmdbfCU0WgnzoLT+XWO6xwO5qJL51O1dIiI9mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eKp6p/S5WyM1OkOW/gBuhdTdHHzqxr/3wq55AC4NLziKbAmFdlzMm9yuECS0JmMc1GOuKL5C6Oy5sk9lev1daiM3kjxQQvmTi8S9NndmFlS+6fsNnKsMvp/YwlmO92Hyg6Fo0UPsJDnsBSqtdMfESLGgCWZONBYKzhsibe0u0hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W2Osz1PT; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiCcu9MXzbbEFrSjO4dC2Kgqt218k9gMGGgZVlPm038HB6r5uRBuE/oTw6b0qIwqLWZCESohe3yi+V1yg9ixCOd3L0JhNuKiTEc0oDK9hsOug3UKqrhfyrHiq00HEBe6vs1EIH64K9bEYKYnEMz6nu69pBG2STU1qAdLcKf7ee5UVrpUng+ypuWT4pXf5TbnydKen1fK+Xy5pL0b4XBaNil1KlsxZRCzS3ji3CaH63LFSL6igrwIfImG6opNCfjRR9JFvT1PccgyCJW0uQyq2S0L2J+I+gdQjR0yQM9BkIrVS5Y9oQhFT9GrvDp2+3XfOZ+MFJGJF0ShmrYu3rZzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPR6zbkIN552Hn4Xmmb21tdF0uDvS0+wUwnTomng83g=;
 b=IJLkF/0JjG+fBovoYKG1iO4NL6CjU+VBDsCWCj9F5zKXWuOMGMzfmARYoXjZ2Un9a9YRxTDFBtSUQwmSOU4HcM3LN5/cceB3JZHrDZ9rlEsdqODLjcHhCCuF2AM0M2FZyPHzUZb2doiTxzVPIp4J9YQdOBMuRb20n6tjbNhzsbSAMXWLTfH4DdR8V6wjb7h7VY3y87KlcdbGzAeHnqAaRGculM62+UE1tYqGnCn4Sj3hcFWyq0GOaL0+taoj7u8lrTmuvBtQRG4RjvKVsTK+Z5gbzxb6ffrSt0L5IfTogVA3p8xLHbic57gbPHdBzr4t4hq5+wosY3MpHlbmkJsfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bPR6zbkIN552Hn4Xmmb21tdF0uDvS0+wUwnTomng83g=;
 b=W2Osz1PTf0ww9SgG0/FQHe3GpbNeo0LUsQezkOgISE8WGK9nXefSMFmqR3JGNl8Ok+e9qiDJb0rvdu8yzMjXAFRh+2geNsaIabs5/RnjhFIpTkQ4kyG5h2XPKrcelZ3xR79xGEK3HfRFrSVjczmTGMRcpJ8qnrmvkJ4UDPvuyYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:44:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:44:35 +0000
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 02/14] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
Date: Mon, 22 Dec 2025 14:43:36 +0100
Message-ID: <0703bf9888c1a259fda505474358ea4b1ac3c7f3.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: 57982c65-798c-4bf5-9ae4-08de41603e74
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vRmr8epHn1D8jXBY+ePScC3WD5D5rZ5bx7+Ata5a4qNsXrwKlG8NvrAhFD88?=
 =?us-ascii?Q?E38w3SMfbyjetK1+fsCHQjuOXhQ34dbhfhbBZS5eVS4vA/f7NWfTkw+oGD0w?=
 =?us-ascii?Q?Hm5QvGLB4apVikIitwrMXSGkpvER13x9zrYtTwE3gyv2NR1C3h/VAfAcpJe8?=
 =?us-ascii?Q?rXmz/N3j6x75VQT+39yfnv5P6R1tQJure+iFM5p9v5DB0wjQIUsvmjclF05x?=
 =?us-ascii?Q?WoLcgidBWfoqkLjOtV+24j9BeJwgLnHjVL+Ddpys/WjsQJBYkjw+P0AioGlw?=
 =?us-ascii?Q?cl0Y/U18F7QcnEIJyIUM9qcDpbebeIjxYGUTBaeYbZZu9v5wBwG6t8ZJdxeB?=
 =?us-ascii?Q?vyfBPBVrwvsrC6bxcyXFfu/hKwZ83/ff3uxkovD7ui1/zH+O14DgbZiMUn2E?=
 =?us-ascii?Q?N8/BjvolN5u5Y5boCTyi9O9yfVh9sDaqsFNjc17ovMSyKBg8G9NY2x5Vr6kc?=
 =?us-ascii?Q?96ixKp8W7emJQDp+kibIjtQq5+YusLhc8JjOXOxkerG7Ko5B2QugSvK1yIaw?=
 =?us-ascii?Q?Wwfezz449GTQzqyU8waHzcYR7gP7T6i0Hnwa+YsRd2/QA4GPgi5WRKivsq1O?=
 =?us-ascii?Q?DyF9HPgiQrE0GipqntK13iAhAeCIsKx9Xn/5qf8xnPNvtWFD4UiiQByJmq2n?=
 =?us-ascii?Q?sa2yXwAkMV5Sw5mU3rpCxIe5exJ2k9qN54NE3Q/fY6WmtwZUlzo0QykxpU3Z?=
 =?us-ascii?Q?kL6oTyp+DpCuhH/j83uiHtAzES/SzRNy+oT4QSEHSk9+cwWgWKr6vTiNG1zS?=
 =?us-ascii?Q?O8Pe8nBM1mQcEO3IqhkhYfsM2syHfwcPXVf3yA2UBBrS5hiTILjmOpqEPS+z?=
 =?us-ascii?Q?Nn8QsfPjiYq85NYzkxCsFKfhXExN/ZECHdM59LkfM9y0WtO1kmZ2iXbbbjzF?=
 =?us-ascii?Q?J3i9m2s0Zx0kt1EqXfXeMASxfZUDEF3eic2DM/0Qt3za2Vt5ZHAp7RD8+S0f?=
 =?us-ascii?Q?GbRL3uCGPggikvUkR3fxK2Q5Nqx5OZGhG4vhBISYb4ARXAizatEQAbFrJne6?=
 =?us-ascii?Q?gbhoVJo/3OOnfiyhulvvOI+GrUZvjlBMssJOT0HZ1wvjJ06YzxaGO3B7Ek1i?=
 =?us-ascii?Q?g1HnQGvEopRLl25s7aQx+qiMaKOxIMA8SWYhoU1DY66cqxoIyDLPZsGwGSSK?=
 =?us-ascii?Q?7mhleNhCjgXIOEv9A78r/tmS3cG0P58NDCLMVCcTjC7qKB5BOFZBVjMpazjt?=
 =?us-ascii?Q?Z/xKm+2QW3F9OYWHf/xVhNz84kzq1xKyXuCj37eexQ9tjeJ+U1KitFIBvIUn?=
 =?us-ascii?Q?YKjMajLPWIiz8CP+WRrXwoysKIrjM/S8vT+NBPgcgmXZ8hL6mEVKQPjKqZBQ?=
 =?us-ascii?Q?EnCwk79GWXDp6hXprgf6IRKwSLfdTzmPxHsc0+2nX128HMcXlGJvMJPsdriw?=
 =?us-ascii?Q?ikotOqEka1Y8pBCRIsN4e54yeONN0+Wu2XmgQ/tw7wJw9RKwbALurrOZuk5j?=
 =?us-ascii?Q?tpXJotUULtQQvNI4xlEZdr7hIUL4n2Q4qapxPWs9Ue3F/cz85n3a+O8ZxCi9?=
 =?us-ascii?Q?bqA9ht7rBV+4Dg+wy28wsL3k9dacM0XQ0zFI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H1Fo4Xgus2Ig3bdUzpXy5dbVDZJmg3/a7lEm/swTcL1RdonMgVdwcKi/PKVM?=
 =?us-ascii?Q?CQf7JEWmMQicfljtXzEGl3ZQ9DWQnF9+cJglsUEsTBo7ZUPZ6DLVc4uuNvks?=
 =?us-ascii?Q?UqRf++CaEMbqsRyeHi0KGa00JyEB5iLYOxo0HYVctgbRg94AfsNqcmkwdFsX?=
 =?us-ascii?Q?tdF+81tq2Ts963Kbm7LDOMS4tqSly0Nm1lkDMiErdE3LvF2guNTQlDhbzCt2?=
 =?us-ascii?Q?daHUPJRlYU/AUMM3e9wuWZMV7F9mQtE0h+C3Ky6uxlNz5fb8A37ZCp7vTLFE?=
 =?us-ascii?Q?PPiLzKVm1xVc6IonPMnUBW7rIboPALceGNBKrIgGAMl+Pk1VHNkGbacsXEci?=
 =?us-ascii?Q?JZNKFA67fpKA3wTFhvIC0oo60zoY2lV263pW5mpr0eL4L4WTQFPL38KZmbP6?=
 =?us-ascii?Q?OWPv8vihdl/cYuYT5L9JcGd5Ltv4y2saw+3hGoSV2Wds2MMPvdA9UIlu8Vuw?=
 =?us-ascii?Q?U+mYBzxNU6zPM1WdSVU66Y0zmwWkDGjTGWQ/QBc5je87lgdXQ3SAO5qC+80F?=
 =?us-ascii?Q?MTRPq0aQ67KuO16eT07vwj/XJuMJ9GSZ5E/2P+ucXzrW3EKbKnbmMwDIXOcz?=
 =?us-ascii?Q?h0oZ6g03XVHUICbccURNJCJhvAIcnQn/s3ledBk2o4ju0N9wQF7LzpmjWqYA?=
 =?us-ascii?Q?AJmoM9JhmOxN0d6R5/FzgxwQtS1Un67BJJZCG8UKd/TVVIxlhrDr27xEJi7+?=
 =?us-ascii?Q?nfvOPPZErFW7dsCnJMxKTDUHFUCei4KX/A9/IW9Q/a4eBpOZBjtKw7cdIXjo?=
 =?us-ascii?Q?m46r1aFyA9vF0gXhUgPKxT0fhGrQKmfxLzILFKApkNRiZkO+76kHzurH9oKS?=
 =?us-ascii?Q?GLeGxUe56b6gsC8MdS/AaROWtw3YEM6DuC0DAOqFSfYm1PpXl+CJnIDy4W5F?=
 =?us-ascii?Q?E7r2aJaCIqp7tszaOIhfVz1vKMyfYitulBTNUk8b+j/PLiN7tN1eWe2azFx9?=
 =?us-ascii?Q?ar9czRyaQ4eB4dx55u/imp/SB8CrSrmOrogGRqcSaJyA+oy1kmWKnADSfOWP?=
 =?us-ascii?Q?urGR/LSsTPtrx1/Wy87jFOCdk9nkHoHxQ2sbMAqf74R4ff7DH3r4nqS7H76P?=
 =?us-ascii?Q?vzsEig491mSuaXMOVts0jf/CgGin/5+xSNP4OAKRPLUqlYSv+JckfJaZFq+8?=
 =?us-ascii?Q?Rv3Q7NrFDMOQIHhTtUwLamkb36WCIRMByZdQwhAgGEeYdKoKfzMIX8n0DEmc?=
 =?us-ascii?Q?ZNnpwqON6Sc6Qoj/YbQMW6OSQ+ebYrsGW3veLOg1tNsfXh5AZbr17n0ztc8K?=
 =?us-ascii?Q?0dW1onTUldfMmn6qgzJdhU8NM6bCE4c7JTG3axPiNwA7ojyeIdDXwYbU9Xkx?=
 =?us-ascii?Q?+VN3Twd7oPSBMtS7Faw+SkN0SLG94wqnwVflVvBI4swt9Xo6uLC64GeoTIka?=
 =?us-ascii?Q?3VfgxyQ84rAu78Qfrn/K18KrkW7RTNCQ5nUqovomcqsgqOl0SGp6rZ7pettA?=
 =?us-ascii?Q?zBWfbMi6iJtj6w2yn5wG8Nx70umwzZP834OtczAt655UL/bCSjZxaEyHCadC?=
 =?us-ascii?Q?GJuztAoGDrnOCjGLCeJHXZn7dyWedsJm29ox739nT029bpPV+oci/1CSLO0V?=
 =?us-ascii?Q?EDi1platarW2vnNkIpdHpVFDQXA2fuBUP3FBUKyp8Utbo04v0lfKPWM/RPOl?=
 =?us-ascii?Q?7NnJXIRvX+IBx7fzrXDHt4WXSHmrZDC2sr94oFqUTcaARIxp4AO1ns1v0epm?=
 =?us-ascii?Q?ZZKQfqwWlT3S1SMQAUdsLCttXTnbZHO0YQaIFFPw+zyoOHD5Eu21C5m+kXWA?=
 =?us-ascii?Q?B6aKPIry8AUb30NXCpVwC9E39miSLG058WKaEKseFx7WjFprUTF/?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57982c65-798c-4bf5-9ae4-08de41603e74
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:44:35.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSa6lZDmDJ9AxO2rWoywr61ekhbxd3icrXtM1T5quQyvHqaVKBLU6hhX/REccjsgm/SzLr38zPe09wZGuWnDsPFo+Dqz8tlPhEGh9FhELd6wgSrXhe5NsS2fi3xk/g99
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
 - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
 - Updated commit msg.

v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig                       | 11 +++
 drivers/mux/Makefile                      |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c           | 97 +++++++++++++++++++++++
 include/linux/reset/reset_rzv2h_usb2phy.h | 11 +++
 4 files changed, 121 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138..3692f3e466a9 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -59,4 +59,15 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_USB_VBENCTL
+	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
+	  RZ/V2H SoCs.
+
 endmenu
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..3bd9b3846835 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
new file mode 100644
index 000000000000..f15d648bd4d6
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbenctl.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbenctl_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
+	.set = mux_rzv2h_usb_vbenctl_set,
+};
+
+static const struct regmap_config rzv2h_usb_vbenctl_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = RZV2H_VBENCTL,
+};
+
+static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
+				       const struct auxiliary_device_id *id)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev = adev->dev.platform_data;
+	struct mux_rzv2h_usb_vbenctl_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = devm_regmap_init_mmio(dev, rdev->base, &rzv2h_usb_vbenctl_regconf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
+	.name		= "vbenctl",
+	.probe		= mux_rzv2h_usb_vbenctl_probe,
+	.id_table	= mux_rzv2h_usb_vbenctl_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/reset/reset_rzv2h_usb2phy.h b/include/linux/reset/reset_rzv2h_usb2phy.h
new file mode 100644
index 000000000000..06247080a66c
--- /dev/null
+++ b/include/linux/reset/reset_rzv2h_usb2phy.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RESET_RZV2H_USB2PHY_H
+#define _RESET_RZV2H_USB2PHY_H
+
+#include <linux/auxiliary_bus.h>
+
+struct reset_rzv2h_usb2phy_adev {
+	void __iomem *base;
+};
+
+#endif
-- 
2.43.0



Return-Path: <linux-renesas-soc+bounces-29286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDmdAfLSsmnrPwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:51:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C83B273A37
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 15:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2E113026A8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A9B377EB6;
	Thu, 12 Mar 2026 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="peOy32VE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4C935B12D;
	Thu, 12 Mar 2026 14:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327086; cv=fail; b=uXYovNGI4di90ZFJzeLKJAeJHAHYKLy9MGB5gTULA6nNIp9DM1sRZ0fuU7CGm83DUM0EoKD1x8Q4XyRBrQviuycn8ocpcLXFmheHARXUt6iX2FnFhlKghrApB4qnXMFI/Ksni/nePjAj15HfUWOoePWLGjwKm08yxfp/nuw4+IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327086; c=relaxed/simple;
	bh=Ab30OY7FCfXpDRcrO20HjcPdw1vJlaXs6A0sTz9BKhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+cNGkygqnzKiSoZeplkFHs+GxJEBENOfsowthebKN20XMc+HSjklg6HvfkY2XjbznFhNTViwVuEYj9qm0qw0tiALVZQdhI0TWBcuW0pOWHlH47ydCf/q+IhlwgSvTOxhW8Prxd6PirrxmOvDOXC7YgyLOdZ0UPXCYxl2yDskjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=peOy32VE; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjQH/Lw4fDj5UCN5W1rESHdy2ZU4ZcQPx7gnIwNGgT3IDQVaqgpw40h0/A1ZbCSVN/98k8JSzOi/MI4hwpj1Z+n0NyBb3GwylOjfzABtIgKFaE8OIUOH+5/xAzx1X1R/RreG470fSTPz5HgAzgHU1IYCbxMy0LlCd3owc1MsEhmVktq1i7sCrR+8XzQlASs7Y3oPiyR9+RiUBgpd0iSIMmGbb3ZPbOWfIhqknDc8Cp82V34U06BN7PzeEG9Vcewckc6TPw/tvavNWGlU+e8gQ0l7MmrxSI6IB7g+yh9/Z6XQXJRwSy38WUZ7+66FUPOAGJDYQUW70W2/H1sWeLL29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QVAG5QRU3iEvN3YobKJO8YV1cAFkZYhvcw5UZb7JuQ=;
 b=q5FB1any15r24lYElydUQaV3z/rleh6PLSS49UcPUfnlG+P6Myyh2ZF0LQyruw2KcWSnNuN13K1pkmnUNkZpHE/3UfsFOfNI2s2jexjNKtTLCWcNC0gF3yHiCm+pj2eTdU8z1D3oq9sJndSJjjFnMqWvCQUGWXpJuoY0FK1F2uvLJ8AXGyAeg9x1iwn1yy8RSn7NtDPGJhgl2BJzkzvWl/SkPhf1ZTAUPPa/ykF8sDEteRNx7g9GmtqwQ3e8gX7NdsxvNli2EAoaReqt9NAl5hpYFzZ9Vv1qQW3bLDFWKl3QQLVGN9Mb7uTWYoTrx4E6z1pob6dIL59wGKcwx8PuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QVAG5QRU3iEvN3YobKJO8YV1cAFkZYhvcw5UZb7JuQ=;
 b=peOy32VEHWnP8XXmF1huNMxya0tkbtqIXhBLrtSqc4WhyDfZmMAl9g2ruKZfltRMB9oVefJ2kX6fnt2UjX2hZ3Hh8/K3/fRqj8CzOtW60kT3pzDsc7W3b9z70yUhy7EOf/55Yg1J1DY68IN5vOkRQxGWLPQugqbvFisNHG4t9I8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13770.jpnprd01.prod.outlook.com (2603:1096:405:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 14:51:12 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 14:51:12 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/5] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
Date: Thu, 12 Mar 2026 15:50:35 +0100
Message-ID: <67a38e592551e1a8ac4f9810fd4cdbab729169db.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a5ec6973-a81f-46fa-4920-08de8046cde8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	44EnpfxaQvuCq0H1KY9t319wTkVnFhEa7wCexyB6itY61+Q484gh0LL/i3kX17ZXBxqQikIxdPse2r4MoH/IUUZQcpmVJTtaSOJvedwZuWt+0YXSkqguOH2gdSc2K9cwbiw90jaz/4CMgC6WdYiZnXSyzAgn2GQ0xoyPsyHuP9j7tK2SDjm570kncG2p/Su1h87M11pmgRSE46KWdSzyKhldDpof2ea0Kx2PHzpOf6Y054qgeFZB+JiHQp9LlLicDkE0ua4zKLiLbVtY2W3G4GcpEFupmgLzC+j40dOeoIK4J2WZUDpfXRiRK4QVVFwDwl9+rdKneZVyzBCAPWfOk5ttcYFUV01fJTMhfLF8e2Yq9DBuSXvE20Ach4QUEnIMcR5btsJL9Sj8lG2/dgDKwloR8m2xRO+3D+uOwfnxyxH3tQsgJgAl25/OQOkNwglFYlUCVl45FEH7dUN0BeoP+KLSwra4k8dsBEAV4wM1OnSWDNF4l83u0ublupQAeX7pPCKfOMCpCHammpwmoaprExUbquUOa0dONATsjVTwcH7IWNvMmR83ZzjZXhShZQK3LQfUqz/SSuPUOxMpEiMHpgunCVznO4kjLheXz9lC49f6gmn6cOax65StFWOKTM2E9uR64Vd55/7sm16CGRgJYN7SyxAL1ddhGSLKXFOqe0q8serY1vmqXzH8r41b5KlVXwX6Z7sskMtnhuR9YZ3feDOsb5+wbtUEyi93dnNaiofbWYn1wMBP1TxX/Q72G5txU5DbMD0GQYigNxx8AjWsfHC+wVZg+K86DGc/R5yaN9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FsgY4fLY8/VpIL3u2o1JGkZdLgvxHXoHdIiTc2tX3sfAkq4SPr39ZtF7iSSw?=
 =?us-ascii?Q?J+ZNIQQiFbcjZl52qK1WMVYVOdbyJuNugcPJjoCg8hln9xT11INiiQiTwFpR?=
 =?us-ascii?Q?0XSrRDRUStRYVG1j4YzoS4hgZbCH2DNurIg6aJRspjMW5GDPzIJyaKuY8kdP?=
 =?us-ascii?Q?RwWQDvRaixgA/65eQ6qiRK5L422VnRfD54/+T1ZvQPU27Okc6JWtetCrcKSC?=
 =?us-ascii?Q?4wpKVkyuKncUW7cUcXz090lyVVFyzB2wtJQFa+zOd3e6tu2rO3eIkY2qpkvU?=
 =?us-ascii?Q?M2/ZyGPjhKi2NkG9N7hCaC9+kXzOS/lHPwsH/CK8SFhDhBuK0/f2F/jwdPfN?=
 =?us-ascii?Q?OXMQvCxmY3FnHKyTbl9QFdMFVeDXDfQvxUA9EReOduqcFnJZQnYTQwuI7tjU?=
 =?us-ascii?Q?XwkedUxMyKnOW14USAuNH8ZITzwLYS83fcZ8ZWvn10pmeVCY3IdvisgCZccL?=
 =?us-ascii?Q?dQqQVlhCzDK/2HCENooOW/TL5etDfGKnIEiUQKd9P9TFN9SkjMbHA/eQ5lh2?=
 =?us-ascii?Q?c771WT8Ye8RcoW8Qui3TmPMDu3fdrYYvf3/R4sgJ0/buK9rn3oy9lcjfsLVS?=
 =?us-ascii?Q?vOjWB6E9gtDpfKJbvUhZJ8DMCBff5/LFdg5oJwbWzOlH3ZI4kfZQEe2+5UH5?=
 =?us-ascii?Q?5/tZefsvgBetl6CruJ6NwhpAY5doI/WpQI1WpqVa5C1ZfBkwcM3Sai/HcCV0?=
 =?us-ascii?Q?0dp6e53455DZ4zNx0F/iJAiscl+O0mYDTWLdUWwNA5Yf0lE2h0ANi5sgpsWs?=
 =?us-ascii?Q?gKIOCzs9cBlAUh9FO6NswctAkYoAucqc10RaoQRxJRtipOs4FFn/sEKhuYYy?=
 =?us-ascii?Q?9zPA+3FXeYQIBh1Yc6F6s7kGP6RJiP1bnbm/7xaDHi3bGmRBflPqfXTMs9k9?=
 =?us-ascii?Q?ecOxubZX7856kCVjiMVE+nJmlyWqLKTYaw0yyPH+aJqf//Xrbx7iiv/+TW7P?=
 =?us-ascii?Q?Rjw506blqEPakOR+KTXuZSM/I4wQpD250vz/MbgbLaDZq9GA3PMgVSAnuCsm?=
 =?us-ascii?Q?7v86UEcpj19zATrrc4qPYpLDd60To+F9QTArJhD1hNLtUFWtt3NqYK5QH+EG?=
 =?us-ascii?Q?E1tw0wI0wdZZrg+uHLHOLpCh07PMphfGy9XrMmneFrgMKNR71ORk6Pw7NPFT?=
 =?us-ascii?Q?BeGJvetBs7u0QieHzfzqb2mZSlfhgziBe3zWARokw9NhldiI1taoU6norS7m?=
 =?us-ascii?Q?50/3xODml3BApH4EA8geCHJMkYEZUnzLqvzBZKfTDReuhSOqPtStLlJJ5vp2?=
 =?us-ascii?Q?tetXK2qvAdgbtaTgFiQjEhwYTU7SOH9g+IEV2ZAogOWsMOgMHhG2GQra+HQ6?=
 =?us-ascii?Q?KDJVta0auYdJpFOVekniJTJgQbUq4VczsGR9wVgjPEcqClACKQurT1rhAclk?=
 =?us-ascii?Q?9stK/hzFPYzsVZ0I62R1qZB24kssC5BohfEAwPVemX41Jn3Qs8un1i0udcDh?=
 =?us-ascii?Q?j5+rZdNCB+jA3OPRffCoLoxO1J0/z/Ue22c6kppqxfqv4m2jTfI+k0xWbOu9?=
 =?us-ascii?Q?jt9Rmad7u18eVN+vxSjoDNoEFjBq+HDlTK1M7H42dSrrbFUORHLwqy59vzUg?=
 =?us-ascii?Q?WtB9verKWjC5NWFWffZOdaSIIA2C05EjgGFmXFP7ktmubkbLIjOunlWR0/uG?=
 =?us-ascii?Q?wmuNMMV17e/KR9Sh7u2O608NgbJYJ0DGCHIVbLDumBtKvIAwkOunPHXvHOo4?=
 =?us-ascii?Q?qbWOnWvpJlQk9fn7sW0xiaXjnn8/WO0fCwKJ727vioIzylJ7CCJQ4LHWXFVd?=
 =?us-ascii?Q?VYiqaoRai6YQYi0BJqhwJ7VBgBlBxZUxCOFwMv3ZxeAdD37zoIik?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ec6973-a81f-46fa-4920-08de8046cde8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:51:12.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzAgPczXL8ykN2Bx8jqE2k9FJBsRq5p2kTYDFUr2z7gH4zh0WCC6PEJ+YvRJmTqOYScCbnqrph6yfPU04vPC2UwJqkeUyq3zCi8dYwLKZ0EbByIoK7ZaHde6AHMUWWyN
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29286-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,axentia.se,pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,gmail.com,linaro.org,linuxfoundation.org,solid-run.com,arndb.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 9C83B273A37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v7->v8:
 - No changes.

v6->v7:
 - No changes.

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
index 6d17dfa25dad..fe00b15ea67a 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -70,6 +70,17 @@ config MUX_MMIO
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
 
 endif # MULTIPLEXER
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



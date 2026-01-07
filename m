Return-Path: <linux-renesas-soc+bounces-26343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD97CFD31C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 11:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A3C13002945
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 10:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FEF22538F;
	Wed,  7 Jan 2026 10:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="miIOHhPb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B623EA95;
	Wed,  7 Jan 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782079; cv=fail; b=qN5BVHRyo+dnL2cML7aCB0+r/+4FTIDT41X1Mb2HkVy4zF581uZ20rwzaXjGqsW5d4ldCSfjyiOcMcBnFv9Nts/h8FPq7AmwlyeIjdU1Gw/fRAxr1HUMme+5RG9ZFdO9BsD0XO+gfgUC2VqJacNS7h4FX43MAXxQprwuwEkXRdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782079; c=relaxed/simple;
	bh=XtWCFR3hLeHYe+cLfNthaU9kYkaK2hL1ONzx/TVLjbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aYbRGZlbcLFGzOGZdUmHSRNSD25oj0todxrSZXvvvjqQXQr+RVAqfVKKzbT7G2esC3GnZXrAhBGYmedv6vajhM8Sx8axfwKo/CPYP9yzXJyYTcV1j8r/Zu4mENfHJuDye+0i5ugP915HH3+KckfkBnd1b48gOZUxL5n2cu3I5ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=miIOHhPb; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQervZ5pVdmzmTOxA1yRqc8kDYHgz0YK22IDOWEXYPjAxJ4N3R836gWk6XrwhhasiwqN9xvfhsvQWiDzoSprsuIaLr41wCB0Aa08Baev5yYncoi89Q6GDXUjLIU6p3wueKZf+MwimxLILmsNRFgxuTYnSsne37r9gUETsjNbUIa/W58FOAfCb3gGqNiOyX74SrNHlz5+IKTW7grh/+7U5fyMDLA0FfmKfCgyxEZJKZ7vPtG41wrrzmNlrj5ndEa1bbTvq4XCtJHCu2wG+D54u4UTTSO2aSUcaBju2c486Z/gr/reHaj/lQg0vOun+Nr36HJTn6f5cSQcZUvER5bUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+W4R8H30RxBeIyVvXGxqCuyy2UEHXz35bFI5dYCpaE=;
 b=Z/dWHsbRCmPUvcVh1E9tmwGc8lU8A1OQz3QHQRaKiOZj50Vb59TBCOLj3aDGcw8kXO7zIUozNQMsmlZWgS9RG3JWtWeJWB7/w9bwjcpXN3iTbTr6Lfs7XHBUHPmyN5ws8rT5ajzLuAswiNqP1nc+e35aNZDpqXi3bcdM+WtkiHRBcgU3QYTuysE4lUSZXPRyrkaL8QcVoZxrX2X2FB+fZLFvOy0HSztLYmg1geprLejXjUTpeZUlhP3tgAPgw9yMrZ3AYl64tF+TUv1V7zXF1OF/oM42ioD9xa3R9u9gmTvsZVSFsMg8IlRzWs805yPyGRpZltzFXpN25FF0S07yPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+W4R8H30RxBeIyVvXGxqCuyy2UEHXz35bFI5dYCpaE=;
 b=miIOHhPbtf+tbRe8uZra4ssjJT+MrSLwS5pX0zYwFs6RYA8xxTySyBOWqNAGgXAGk6qQcEYZ5q9Goi9Qrdr6OXt7Cf/K981cgylSiVyar8rOH5Z8EijnteVtS1LU/u6cnMrIoMZgG9oOqX2bvRfWDQuZDy5V9qPsqlsjd+isWQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13558.jpnprd01.prod.outlook.com (2603:1096:405:18c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Wed, 7 Jan
 2026 10:34:30 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 10:34:25 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
Date: Wed,  7 Jan 2026 11:33:47 +0100
Message-ID: <1286f8600b542da55facf9920fed7c06b2b0e4d5.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0368.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13558:EE_
X-MS-Office365-Filtering-Correlation-Id: 6148a9aa-160c-4b0a-8e73-08de4dd853da
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TyQCpy2G6CnSb9bRdWybaqLvKfMwlOl2QVWnPl2pJcaoZxLB9RifzKENnUkQ?=
 =?us-ascii?Q?qOt/LQtuqpjHYiD6hJlvYzetS81jmEP6FPiHx0J9FgRVnh2+pQMW/5F/W4SC?=
 =?us-ascii?Q?qRyQKN6Gwy2KhBcmm5EU4LetFWuoTM//YRdUPz89acq+LLPor/UKcChnRo/o?=
 =?us-ascii?Q?diAaOCGDWLrdCi9wjhjhg1GFIcklp3oO3BF64KfMN4DkxowUir9bF9ors6j8?=
 =?us-ascii?Q?w0SrLpnh3B2NtBXPgU9Oj8FnXSO0rRBzkAN7Ms40+X822obTg9IsDtr3FZ1E?=
 =?us-ascii?Q?ZzJoEuoScggKrGImk0VqQXEurrSVFsYSyQeb9tklJDHa0PnvVLfT8ig0jUZ2?=
 =?us-ascii?Q?eCzb/LsTrGRhd/z+Gk/4e5y9n4GtZIZn4SbMqW2aMLuh6oMEDJ1p8CH/opvb?=
 =?us-ascii?Q?G58vFbOB0KFl3G6xuMx28kvrFOv/8pmNNPhiz3uOtG08vUGejx8rNkAOccIr?=
 =?us-ascii?Q?a/wBKsG4fc8fQNIHtXmuwXG/Gbi2lInZTIREcPk5LQq1dXMlDhTZC9QZXhy2?=
 =?us-ascii?Q?YC2iYRTmW9c4/W/TZdtwDdbWmXITELbSN+JeYqL5r9YN7jbZTa7x5zdQL3Rp?=
 =?us-ascii?Q?OYTjU56ApHlUEJFitJH3W504qT9LJv4j1cKvVCGuB22YnA8ysXFVDSP4i7F5?=
 =?us-ascii?Q?QE3SuVeNjmrgvpIxWzv+yVaHPV+/yxyBR3h/pqzG8vcd39AjSc3HQhNfHvGe?=
 =?us-ascii?Q?TVG5F2DG/1PYNzYFworG1iLr/2Q7/6AgXjFNxRzzrhVueWPxoUnPoybclf8O?=
 =?us-ascii?Q?kIZ3d8/hx37EFWTAbx+p1TtGT+TRBeUn2f37ENkFhzGqM+yxzBzqo9BGS0ea?=
 =?us-ascii?Q?TcZymCac4NmyDb9yhNLeN3lLq2M6la9P8whcN8EBH6rg/wJWBMj2ZHgYTyOJ?=
 =?us-ascii?Q?alfs8LhKTpRQ+R0xqIVP8XiQ3fp3zcFUN32vS+te1zTpo+1eb0+6vdGh9u59?=
 =?us-ascii?Q?4nRfWCXnghNVodGnHDdCYiXBbhTGDgOPYtcgHfpZir9JLySPd1kRVR17ENY7?=
 =?us-ascii?Q?K4lWPGx5Dk9ddIKA547efwOGqW0muGKTIpC3RRrYk4HJjCaNjwS++/bgSGbz?=
 =?us-ascii?Q?C0DWm/+izpgcrpBuOYa6xqvF5+AezGFltfFQqfCGSWNe5Z3wm3nojiBdwSly?=
 =?us-ascii?Q?dV/CQOpdp094/U5B6UnmXDz8JCSunkIqreNW2r0Lz3jU+eSklhvDY8lVgsPe?=
 =?us-ascii?Q?MBFAamSvu8EvgCMPLlSnQlRmJUfyCqxO+uZzIyHnw9gZFZFL/X/jwrxVh4qZ?=
 =?us-ascii?Q?YnqNWEJdL4i0mKuK1DycbuE3OE5gOLQGicd2EguTRgim3PBi50Z9PhIFWnrW?=
 =?us-ascii?Q?AyKYfYzbuXQ22VwL590UvdFqM8NJpr5LJvgUvljLj5VUBPUuFUvrdS1HioXP?=
 =?us-ascii?Q?PWZ5BCrrEIC4tH6SpiV+hkN1OvrWiUfcL5xTm5SPXOA93ok7ZuKsr2PvuvwS?=
 =?us-ascii?Q?ALwQdS8/QGbIr3oY6Y6EuwDXAsD7QrDRhDM6dEzJSgeB/maThWylFIBbAoAV?=
 =?us-ascii?Q?twUxmJ7KbyGOo7JEKNBrTz2+ZjNeTDecTEi9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YY6EEQhhMjbtnsyNeH3BTuuNCdDxXV0MpvUbFhYRIBgM2zFS3u8Rk/aYwKLY?=
 =?us-ascii?Q?5YFrnVa0e/KOniEVN/izid4beiabOLHi8vD1WQvE88Cq56WGk8wgxQ6ya3XW?=
 =?us-ascii?Q?js7KsHqgR3/LHeyVhXNh+/GPdVoPxyqCJ2QOivdgJFoCm9Q8edSsVehb++zC?=
 =?us-ascii?Q?+yz4OJT2M+yBBQHzTUFVbQ9WDtpjcCPnNK3iJs+Pv2dMaM9faKXOsfyhI0Vy?=
 =?us-ascii?Q?4gByqnlJSsBb9hphfnaeZUcuuJku1AMZwzrECtPL82Kl349J53jOuzJf1tXo?=
 =?us-ascii?Q?PGxQpiVTzkyWHnRoonkbZroPmLMh4B0xz5WreV3dh+6YH1cS1cUZBv6Ri2/j?=
 =?us-ascii?Q?QYnqOuVXnyoyhQFlKoNvjMp2nH8ZystsW6FiPE+P5ctZ9sZHmf/teZYrW6ZE?=
 =?us-ascii?Q?m2t60T7GMVe4NZ1sEtIwHW9Y4qZlDPZC86mf2/eqwE9/kPeU7Bm2Xhlp2dFV?=
 =?us-ascii?Q?RZFbtFloHawuwE8fNYCwx0fmVGK+Ekyi56iAik6Oh6kqGxyd8II+S38SIfs6?=
 =?us-ascii?Q?hiEk+UnMldOf1Tb0t2fY6x9pES8a+ZYtwBoHOwq5vHyPTaMYOSRYWesYbT32?=
 =?us-ascii?Q?R0GY0Yg3dJN9pi7h0BwwTGA8HK3z349sIrNenhdMgocpg2JhUJuf09zL4htC?=
 =?us-ascii?Q?dm6RQF4cTV/nvuZxgGrOuccWwygd1QNsHht+R9o9ZY4p3yVLX2adbvnFjdyo?=
 =?us-ascii?Q?9Yx13gVoCke5LJHQDgkZtoU0Zh/LaI+SXABa2Lb8WrjpyAySwfT8fc+A59hs?=
 =?us-ascii?Q?V/42XRFnWVJlUeoV29XdvWeQkudiZk8REqhdU40ULKwCk5JL3GeZriBCCW4e?=
 =?us-ascii?Q?xNmWJjyIZHQnI+CVkVUMcY3wwbzzj9cEjathSQDBH0xw8P76im6UVfZHA8vF?=
 =?us-ascii?Q?ViFUOfIelGaNuWwZsCdUq03hYkuS9+Y3w/iyORHrItZPPdeMdX596kW/ooY3?=
 =?us-ascii?Q?lz+3O6V62gZwJOR6IALHBC6yvFWAVXcYhwmjccbogmP6lry7O2F3CywqF+Uu?=
 =?us-ascii?Q?s30A1EYc+JT4+D6UxoFYW02rCSTm5nL5jtfP/2fhX6AE4W3Cy3CeFSmNH6Hh?=
 =?us-ascii?Q?P3SyrnePuE/gaZelXEDXQFPpSOi0oRNNlg8zf7O7qwsbgjZP70gHpz6+kmIb?=
 =?us-ascii?Q?SXTXIPmbBQtSn7/9xdukqQLlsimEzAQCgWrSpBf7NRuF2kzPJwBSjMTVnXKN?=
 =?us-ascii?Q?IoNklKmAG8MnBLB77Qtq9w8KFgP3k8BBqSonTJykbvU80/c5JVpIfq1qw/NF?=
 =?us-ascii?Q?SZR2vZ0LSCZ9tplF2bnxFRQ03QVhS957dq2JsBzLhebEshnXyXhwc+u5IPXm?=
 =?us-ascii?Q?J52azbTSSUwQAfCHVb7jIxqrSqn3WwGyyT04qzxqBUvcOLNsFY1f2Y2mgqEM?=
 =?us-ascii?Q?jVHfCL97MacySUBY3vFt27B4hz/6qc0mnEKOH92idTOg7F5BQl/MVV1/IcTH?=
 =?us-ascii?Q?ovrMzDjR9iUFJLTZ19aXPXpyD+iJMJvOqV872boipBdm2/mg0j9cz5re9faG?=
 =?us-ascii?Q?jpNGI+FQMVkXp7t1ifeE+NwhgSGuDXhJ5/0aBMYoeulJxW6CZxieM4lZPzkh?=
 =?us-ascii?Q?HfnpD8tKTb0mUe/aCcMQeqSXZpMedgPYh5tnTZMj7n6UJzHaCaq44Au/f9Xu?=
 =?us-ascii?Q?8jBFQzeIGP3xvtjpmJOovtiokYHmADLIb54CU4EqVEfLSgwK9kmGrBpSMZ3R?=
 =?us-ascii?Q?s62SRKA5rFxswKRMMJ4+sS+u6FKqgsSPcIDn+EyQRy24VpKJzLr//cDA0MnQ?=
 =?us-ascii?Q?jDv8WvX/U2jO6aUzk6emsBG0UX8vLgbdu6XowwxmaRBpgEQC2TUA?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6148a9aa-160c-4b0a-8e73-08de4dd853da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:34:25.2432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5An3OgxcJJxBBAQiMnVWaRG80RYloSglgyF+LjQ5R/Ie8Q0G1lekMPxBG6EXHXh5sSmGO2RgHEfvED4eIWFvdLWLg4yMHGnkir5cpmQj7UxVCsABIi47TfcUGJbHY250
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13558

Replace individual devm_clk_get_enabled() calls with the clk_bulk API
and store the clock handles in the driver's private data structure.

All clocks required by the controller are now acquired and enabled using
devm_clk_bulk_get_all_enabled(), removing the need for per-SoC clock
handling and the renesas_i3c_config data.
The TCLK is accessed via a fixed index in the bulk clock array.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Improved check for clk_bulk_get_all_enabled() failure into
   renesas_i3c_probe().

v3->v4:
 - Collected Biju Das tag.

v2->v3:
 - Added define for TCLK index.
 - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
 - Improved commit body.
 - Dropped unnecessary static const char * const renesas_i3c_clks[].
 - Removed the need for per-SoC clock handling and the renesas_i3c_config data.

v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 46 +++++++++-----------------------
 1 file changed, 13 insertions(+), 33 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 426a418f29b6..bb1d11693ec9 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -198,6 +198,8 @@
 #define RENESAS_I3C_MAX_DEVS	8
 #define I2C_INIT_MSG		-1
 
+#define RENESAS_I3C_TCLK_IDX	1
+
 enum i3c_internal_state {
 	I3C_INTERNAL_STATE_DISABLED,
 	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
@@ -259,7 +261,8 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	struct clk *tclk;
+	struct clk_bulk_data *clks;
+	u8 num_clks;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
 	const char *desc;
 };
 
-struct renesas_i3c_config {
-	unsigned int has_pclkrw:1;
-};
-
 static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
 {
 	u32 data = readl(reg);
@@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->tclk);
+	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
 	if (!rate)
 		return -EINVAL;
 
@@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
 	struct reset_control *reset;
-	struct clk *clk;
-	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
 	int ret, i;
 
-	if (!config)
-		return -ENODATA;
-
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
 	if (!i3c)
 		return -ENOMEM;
@@ -1317,19 +1311,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (IS_ERR(i3c->regs))
 		return PTR_ERR(i3c->regs);
 
-	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	if (config->has_pclkrw) {
-		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
-		if (IS_ERR(clk))
-			return PTR_ERR(clk);
-	}
-
-	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
-	if (IS_ERR(i3c->tclk))
-		return PTR_ERR(i3c->tclk);
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
+	if (ret <= RENESAS_I3C_TCLK_IDX)
+		return dev_err_probe(&pdev->dev, ret < 0 ? ret : -EINVAL,
+				     "Failed to get clocks (need > %d, got %d)\n",
+				     RENESAS_I3C_TCLK_IDX, ret);
+	i3c->num_clks = ret;
 
 	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
 	if (IS_ERR(reset))
@@ -1374,16 +1361,9 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
-static const struct renesas_i3c_config empty_i3c_config = {
-};
-
-static const struct renesas_i3c_config r9a09g047_i3c_config = {
-	.has_pclkrw = 1,
-};
-
 static const struct of_device_id renesas_i3c_of_ids[] = {
-	{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
-	{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
+	{ .compatible = "renesas,r9a08g045-i3c" },
+	{ .compatible = "renesas,r9a09g047-i3c" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
-- 
2.43.0



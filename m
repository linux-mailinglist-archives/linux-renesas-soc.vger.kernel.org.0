Return-Path: <linux-renesas-soc+bounces-30450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLCVCSbKxmn5OgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:19:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F10F348F38
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C23F3064321
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D889372EC3;
	Fri, 27 Mar 2026 18:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fJWFjYg8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD97A35A390;
	Fri, 27 Mar 2026 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635016; cv=fail; b=A3SVU9ebGFdUwFuNnpKakbAM9tquUaiGdu7jje+jq0GskzsqdFgkk7ttCAGj4w78C/ldW9Uayx00eO8hEOM703jqfYjXURqsUgrUFxwCSzm7oABXhOdJm/6Ny1f4ipGBWPqwzgzD6/+Wdh2tichKigKl0L+bM1rrmOLhWqs8K2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635016; c=relaxed/simple;
	bh=ext1Exm+rdMb66mkHxMP0TmXidrTr2A0QttuOXDio+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W0m90ns7zNRiJnElQOso3PxCLJWYecbEheCt0hXLBUq+f31WKoahZv1yzb/ghA+Dw2EwyXzJqFkcG7z4WnT1+t0vbXA5fJRR8VMbtF2V1Oo5yiTGwCxC4jrmVmS5XOJrPMuIin6Q/n4BM+0wtUFUa74N0JS8+2zgFge+UfsHzlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fJWFjYg8; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCgw49KNhRFyiLkvNfmZx2pn4CL5omSpf0gXMlvEQidOJPkCxde+YWzdt5nPGUJHFm9Al36xjn2k8twpG3XWSuynUbxEIFZ/uoT9Nx3J13ZRn7CUuRLWj+9e8Qq528eF2l5HIjQbxxbzX+YMRaf51kzDTGqaKhu0R4+Rgt1xSJm09OunhIVretW95m7RbDBOSeSAOZriY/dDLU6pXJiwYYfdUgHNJ81KJJTZpAj/YFeD/y53J+XQ2bJZIaEiGuBARJgBFNi+OCkj68gH8oToKbAvMatPWOju+1enWzB6vmUlzS9Yj24pfhwLfjQfGJtXlrUiMwF9cwO6imCBslH77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np55NWnOcvO5uOBCpSDbf17OPfrjG8eHCXRC0dlBCjs=;
 b=r3aBYB5noXj0S8MHN64Zi4a+naJqssy6nvGARF0Eaw4IjUEYKA48aNdxKN6dKea1/gDa4JGkQ42xAzJ6XS9Nt3b8cb5nafYqjlxLWwhkYkRwggrGR9rzcJHAZe2FCFYshj0URZ4Qk0vN7Hf1P6TtacKnfkOk6/p0e0oWbOJFQ+zyKcZUd3ROTzjsxwRCLAEOmxJncbCtB0Wo8pVXxEWUpEtjeXt448FUGfjtZv8pA6XW9M6iogyPWgzVzh4IwWMyWglK3luh28+DbWhK3E7uRFw1UQnSUYWwDmS6YigebOAgWD5XOL2kpJauIgbzNtwZ4brN5ZnXrvOdDSsAA2jJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Np55NWnOcvO5uOBCpSDbf17OPfrjG8eHCXRC0dlBCjs=;
 b=fJWFjYg8oExn/pQ1roOeZYjZj3AA/nPIKJ5WxOjjUdYIidtAPjK+AWLyT1lRRKOd1S8DaxUP47sSKRHm2vB62ZKYs1o1OP6McuyMpkOm2DWlpoQMljHAG2GGlpiHHBPRvYG8Ah9XEF6zC3iDrtYC/DTCY/PO+XjzMW/24KV1soo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSRPR01MB11662.jpnprd01.prod.outlook.com (2603:1096:604:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 18:10:12 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9745.024; Fri, 27 Mar 2026
 18:10:12 +0000
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
Subject: [PATCH v9 5/6] reset: rzv2h-usb2phy: Convert to regmap API
Date: Fri, 27 Mar 2026 19:08:52 +0100
Message-ID: <0259040014396ea03d58a87c2ce2a3f9eff2b0b6.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: c66d933b-126b-4211-4b09-08de8c2c16f9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kxugZbTUJndp1li7+h7Qmn07Av2iOd3yX+Zn4feGzekO5bi10VA1f3F8zHpbGL7YlpU5auJGjaHE7quLgBZOnbbWX8VaBrobt/ZgbmLhfzOH3KB+w5HmRLTv7BarRoF5/cB7UGyT7APKLrvBfarNr7Y4oOn3iPEANRMpcbMPKtRpzRoOYYOuL0alr3sgZLIRYi2sLHNCsowsQ1WKRVRRlukGL4n1PNZWjlzZX97k6/epCugxoQRJydFwYgFcygIJgffbXfSbFkngysHmSZtw9zITjQyCogU7ibYOXA+vppZdby0cO7fzUjQPYwjxwAcBS8kyqCLTAmJ3PO3DcmvNg6Wf1tTq7PY8wI0LpiipKS6yGlZAdfHGFoWZozlU/e9ygS7V0JrU5TB4/ebqa3HvweLBvP4dtBWK1w+KjVsSHjYSbE6Z15Z8WTLbef0ma3AeWy9/+IXG1B2QfZTPUe99cBG7pytrm1mxHAqati3F3xqfvauu1HeHTLAk/mw23XWE3qwd82fftOClC9MPvYNxQ+aq4U2XiihKDEFf2Hup41etj/pGhhVkhfdjXNZys/e8rfmnCsRf6C808ILwYU3ZTBXQ0F8tE0OWoUxMjQKVSeSwFw4n2xOKO7q6rkc/cG0kAi8Ad2Zl4TNQi8iWAc3AalDGYPThms2V+dI/Xivk20vMQs7j17VLVEeGZpmgdU5lN72rPrcypnKm9/1BHGTAZ7PSy3FBVaJFKwTrkinXdzxtgeJV7dOYpbecWgDsS8Aqj36EB3g0urBg8EL1UzLDwgahcEFS1T+wWNd7NgPoobc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?661mrK1fAOYV7CDIK9BHhlToBR8FhhvtqdnH9T21Se60jx+fgzsEVtQQzT5D?=
 =?us-ascii?Q?aBzBlp1cNKrGv/0Ikcm7yEVPB5Gs2jjsCavQs3nzgmDuXhW+NUuxD4FRK9X/?=
 =?us-ascii?Q?w/vKJ/9jsnzoKPLIjUGVoV3PGNdrnH+MOE8Sh7uOafxmO1NM1VeINPlqPaH4?=
 =?us-ascii?Q?AGuldGGKbORsypIQSQlkoXyTLFRIOAYQsjx1FVUWC4Y7FwtllTK3HSf4k3U6?=
 =?us-ascii?Q?txMtK+Bd1m8ppcyeYFIpBhbMT/Qi6TdeJxQE5rcyuvylpsJ0MqlijxWc6nBJ?=
 =?us-ascii?Q?OeO+awoTc6cLDidpIe09bPqchmcGUN4AE6x0kmYjvuHWnCJ8yO5vxmrmtqEw?=
 =?us-ascii?Q?ZLDW0+4zffbektkgRqSURHvguVy0+fZHXYdZovqG9UMzoL99h5D+sYFDQkgq?=
 =?us-ascii?Q?Giqq0267py8x5FT+HXwtT8gJ8TK09L9I/KpGETfM5rMkTSImDssvqgr9r/cG?=
 =?us-ascii?Q?c3w32QmGWmgiE1Qmf6WLmCZxi2vhPCRHrF/5Q1qK1OmqT5KWmFthLz+G0wW6?=
 =?us-ascii?Q?xcj0eFYOGv3Z2wBFxbrRfdO5bVLU6eSObVsjOJyCAxzXdaxoPPuUYZh3yq2h?=
 =?us-ascii?Q?2Sd2h6c8tcVQ8QkGGRVrHrWYurxjR2ZFr8nNJhvE0HbbH0i5EmfENP1XolMS?=
 =?us-ascii?Q?YOW3mSUEjR67v3L8asBKpEsY5qRufkaDEb2Yam/KiwS9EM2RcvreOdJtsEuD?=
 =?us-ascii?Q?VU/iMPLhjQh3keT9Muvj/ApwQOD+ENI+qEHG0+z+FCu0lfSGiHrQT30f19C6?=
 =?us-ascii?Q?wYw26LRiREFAVV/EpyVNKi4dFHo6RkmMxiRxw3vczS+rudwrRD8tp8Mg7yYg?=
 =?us-ascii?Q?emlwdpyFoZNamPdd3Wh2zBpcLGUWthvRg+sgv2CCFF520Rmy0ttbeqfrgFK0?=
 =?us-ascii?Q?rQnX7aAFLfbCnR+FJxBURZbe9jeKTrMnd4Lo4DdD03cLVCzXqL8xf3ubL1MY?=
 =?us-ascii?Q?R8/nNzH2UzfaDH7PeoWsNAMDh1O817Nw1sL5NNOwvmgknMMxyBhHKJMYMEky?=
 =?us-ascii?Q?5RkIE03RAUAuTaGU824R258llnPLnXekd9jgthtw17NO7LPZLXVW9lriZa+s?=
 =?us-ascii?Q?SqrE7l/BzqhXrnkjLkCUxODWdnmrLyGxHxNd6egeLqxWOwGKIpiBJE6bbHLv?=
 =?us-ascii?Q?oUORn8RTWeEkFXBNaJnunDrAmWyX0w5tsH/rkjO65KOEAiFcCGrpWSeYvn+k?=
 =?us-ascii?Q?Fli0OfrOD+bKhAiNhQMcEgd19uraGjD7I0a8uzugZMw+15c8VShQASUopuGl?=
 =?us-ascii?Q?Sv/tpm7Rl/qxxnoUVV1XIrVrGIDmiqHCJO9f9qSOSZGGQaLavATMU8olD33m?=
 =?us-ascii?Q?a4gWRh8ROI/tkqETCYk9P0wuFMPxP1N1DhNGGRKk2usM6f/sSCJas20cK8M+?=
 =?us-ascii?Q?TxZPy42B1DVttK0YMzPMc2lBpztBPbR9rn/1eW67x/4zy9PAS8kz28mdSrto?=
 =?us-ascii?Q?WBMxrC2eBdSqCT8/6tC9FzPqvhahpABcYP8iznGOoVth3MJTj8caqlTdMQwn?=
 =?us-ascii?Q?AF5gWfEOlfE2uinE4oziZlhhDj73bKptvXJNByEWw49ZNGC4h46iekZkTWuC?=
 =?us-ascii?Q?cCNfF8SdDP3OH/Pd9CP5rItB6kzDGJWlqwLSP+HfAtS8hGAA9AZ4Lo+2BtI0?=
 =?us-ascii?Q?UgTNNt8gw/YS3WOzFZTNQlDqzpk2zT8Ov1ok+YNRIlgcCcZwy+qo+J8u5e6p?=
 =?us-ascii?Q?KWClJYKKbnaugmS2n0wysmikjWT7wuBsw4vhVy42jEyhGQlOJncoDkXiNKGq?=
 =?us-ascii?Q?D1dnmO1IksxW9E8dLj+fFrXHtqjaSErr6Hx9QbGiZogiB7Gl+jSy?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c66d933b-126b-4211-4b09-08de8c2c16f9
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11940.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:10:12.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XtubncErAQgfIMp20U8U+II+BDFNARpOrWO+oCqsjXnjRH4R4Yr+kr+JzcFktZQAjvlcCW9tbvyYMOEeCIunx6nP+KC1Cv1UYZBBTvWSgDoGacNgd7eh45mBovsyYOr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11662
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30450-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3F10F348F38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace raw MMIO accesses (void __iomem *, readl/writel) with
regmap_read/regmap_write via devm_regmap_init_mmio(). Regmap
provides its own internal locking, so the manual spinlock and
scoped_guard() wrappers are no longer needed.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v8->v9:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 42 ++++++++++++++++-------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5165006be693..c539ca88518f 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select REGMAP_MMIO
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..4014eff0f017 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,13 +5,13 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
-#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
 
@@ -37,10 +37,9 @@ struct rzv2h_usb2phy_reset_of_data {
 
 struct rzv2h_usb2phy_reset_priv {
 	const struct rzv2h_usb2phy_reset_of_data *data;
-	void __iomem *base;
+	struct regmap *regmap;
 	struct device *dev;
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protects register accesses */
 };
 
 static inline struct rzv2h_usb2phy_reset_priv
@@ -55,10 +54,8 @@ static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
-	scoped_guard(spinlock, &priv->lock) {
-		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
-		writel(data->reset_assert_val, priv->base + data->reset_reg);
-	}
+	regmap_write(priv->regmap, data->reset2_reg, data->reset2_acquire_val);
+	regmap_write(priv->regmap, data->reset_reg, data->reset_assert_val);
 
 	usleep_range(11, 20);
 
@@ -71,11 +68,9 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
-	scoped_guard(spinlock, &priv->lock) {
-		writel(data->reset_deassert_val, priv->base + data->reset_reg);
-		writel(data->reset2_release_val, priv->base + data->reset2_reg);
-		writel(data->reset_release_val, priv->base + data->reset_reg);
-	}
+	regmap_write(priv->regmap, data->reset_reg, data->reset_deassert_val);
+	regmap_write(priv->regmap, data->reset2_reg, data->reset2_release_val);
+	regmap_write(priv->regmap, data->reset_reg, data->reset_release_val);
 
 	return 0;
 }
@@ -86,7 +81,7 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	u32 reg;
 
-	reg = readl(priv->base + priv->data->reset_reg);
+	regmap_read(priv->regmap, priv->data->reset_reg, &reg);
 
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
@@ -104,6 +99,12 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static const struct regmap_config rzv2h_usb2phy_reset_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -115,6 +116,7 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	struct rzv2h_usb2phy_reset_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
+	void __iomem *base;
 	int error;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -124,17 +126,19 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	data = of_device_get_match_data(dev);
 	priv->data = data;
 	priv->dev = dev;
-	priv->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &rzv2h_usb2phy_reset_regconf);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
 
 	rstc = devm_reset_control_get_shared_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc),
 				     "failed to get deasserted reset\n");
 
-	spin_lock_init(&priv->lock);
-
 	error = devm_pm_runtime_enable(dev);
 	if (error)
 		return dev_err_probe(dev, error, "Failed to enable pm_runtime\n");
@@ -149,7 +153,7 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, error, "unable to register cleanup action\n");
 
 	for (unsigned int i = 0; i < data->init_val_count; i++)
-		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
+		regmap_write(priv->regmap, data->init_vals[i].reg, data->init_vals[i].val);
 
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
-- 
2.43.0



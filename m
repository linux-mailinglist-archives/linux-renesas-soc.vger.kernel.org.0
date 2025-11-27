Return-Path: <linux-renesas-soc+bounces-25260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A6C8E290
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8270C3A9C29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE7D331A4C;
	Thu, 27 Nov 2025 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lg8QHFPQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5ED3328E7;
	Thu, 27 Nov 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244345; cv=fail; b=ZcE8n24uhCNi2NjyLeRUA5Xy3ufb7jlaO/DsdYX7/7rkIu4sk+7Bau8XV5cFTbYH9LUZDJE8oDtdVf6zfVhBx6TeaZE3jTXXC65JFusxDIyILbEokgRFQeVKa7anRma0YV6X9IIJbqad5myaEsK1lx9cH8T1raqPmhUQIARyCIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244345; c=relaxed/simple;
	bh=Sysgc2HWJGTU71iJQWaMTdWB8UBaGzymihCKztlmKC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j7IR36V575sj1o6MUwDvVmZP7SOyf+SzQ55Y23ZtlIRu+W8m3WyI4q4VGNdnCl9+RG4DKbdO8Ef63l7dGvagw6yv9hwU4EcXe9KWjDsFKcw+tCNMEwM5f1gQOHNpzcl8tw/wxV4PiApN5/B8D6E+usBqP7u8jT1c5J0PRX6MaWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lg8QHFPQ; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0hdLWO8yJFN5fV0AOVQxt4u/7sye36O889+9Pffwvn++D+8eqFUxqOFEyJOOZzMz8Tnb7uC0FczgUXOyWsuqVPTgSeweuI5rBA5RZcZ2YMB3pDFefw5wGGqyT8+Gov9XJ8a/rVdzztJgxweQciFDxrFW/QZ+jLpJPEPGoXCouUiz0sFgukTN21qDICjgYTLZXy0cnynL7cdfIkLctm13Aj99sJ7gKGberqWReEKhKHoCfrTzLbuZibc82ChyuvByJyVqeNm4xCtZ6usDFWELiHwwHyS+AyCr46tjTBVFfmlZtloqkrZ7D3gRyK+va93PoqxKrofbGcIVYGMmY/itA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep2+YYj3by71txjS0w1sFeHAz/j7jq5TgmQR9MseNuI=;
 b=P58WqxiQtkPUfgnmDvLy9Iz7jtoUvT9ELGoz56/ShpEiG4H5fYyAiZHZskkETOEpkHs+3PiQmUGfKipPvqjMGv8KO6FMCpRL+1hs2+TwDAd/VtlKdenvkDlSvt5c6uM+quhRKZ76TJucdzLl4xjf4CotwrpHKXqcmvEPNEK1wVXiqqBLyzA5yKemF/LS/U4fSEGle0LgtMAyvbwK0XC2z0lEyak0GWu/HioKY68NFKeB02L88P3cuGrTNZKcCdX64PAUpoNJnmbKIsQBftBzI7r77CVQvesBln3vIbjU7anqc6wBDM6ZVhaK/Kz/+842Bcj5Ovr2kaco2NItuo4XCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ep2+YYj3by71txjS0w1sFeHAz/j7jq5TgmQR9MseNuI=;
 b=lg8QHFPQ6j9/tL4l9rsNvDUabyvT0e6RKzZsKijjkYKjEYaVEbiZ6uU205CjLZLEJJFsukSpHOoa2owA3wblYn/NXbzaljKjeFWJZFI0NSWM864IOxhdavNZvJbwi1WkEODECBhU9JcugNTciTICS7xPAXLCHUcL/lrsC0yKUp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:52:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:52:21 +0000
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
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 20/22] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS support
Date: Thu, 27 Nov 2025 12:48:47 +0100
Message-ID: <9034dc677fddab945e2a95977dd5d6c06fcafcfc.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: 92543f79-397c-4b17-6b94-08de2dab6bf4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z5Qi9m6V3o8gcVOb0VclyFONJsc0/DYVcqvFumzAjVNwu9euvLoOFQemkXQK?=
 =?us-ascii?Q?DePOUdaYSxircVgkqIYv11e3UobGqD6/qspk2RiLuzJmQrrSHqoEleR2nWIp?=
 =?us-ascii?Q?4l6NGMlitC3x8TKF3gwAQJKnyBrmJgcnasC+hoTmvUghu9aDrlmCFd8YIul1?=
 =?us-ascii?Q?RbFYtKI18sfA7YtLnef4q/mD8cdEuN8cfJd3XI65UxUiW0ExS5UTMZ7tx0xD?=
 =?us-ascii?Q?4f10yA+mG303I1mG9MAdadXaO+UPZQgJa4qJHiajDDXk8Q8AwEUC/AtAchBY?=
 =?us-ascii?Q?mGKGIPyzYS3Ca4TcXKI2Webvk3D7+hayesP6XXBr9Q91dENBD7uL5zuXrN8h?=
 =?us-ascii?Q?1IgO6zIj4K97ID4Gyb2hTOxPwbZmH+BEEShslxf05YazotCsrrbRoymzIx05?=
 =?us-ascii?Q?tH/AZFpWwC1AuWy7C9iBSSQ4G+grFGT5GmFSN3n8tFIiY+eJpZO1IPO4rMhN?=
 =?us-ascii?Q?x4B2QIHZFceYPg+v/1fNjIeleMikKgGbxazG70KTrv3MJ6hbyQ0dvu3ToEqW?=
 =?us-ascii?Q?/XZ5eZIdaSJKSBrrkzRmxwBSPBiqkFmP3W23MDaP2hj4mdcJiFM5tfogaD3a?=
 =?us-ascii?Q?eWhmgk2fr/GJORzeQspGSrhuOBGo1e4y0PrLlqRKbnH59SDs73sHT7NmNKbe?=
 =?us-ascii?Q?Yf5uURsShhRiiEagilUhWFPjqEIWqyswlE+cAIpIES/GpSZK+9bw3HWBgT18?=
 =?us-ascii?Q?82qbCAtUMzYvw7pDfmoY/h6e0O0E1K4N/UlJatmxzE+1hAfweZTbd7LSbdOH?=
 =?us-ascii?Q?HNyYwVZ/omGGNNMkatk+ZcRQMYtlxhhQy7y8GiY5ToMumnpSfxk+6R3FDWNT?=
 =?us-ascii?Q?v28pDLYEJFk2lIWVwyxdNjuiDlaCohwBzUAZoAIIb8ZIV586KcR5zTUPb934?=
 =?us-ascii?Q?3xItBHyOqas0iKr6xZZWToXZfY1ot8oVif3Yh7yd4pldMbkmD68Ri4K+88Qb?=
 =?us-ascii?Q?yVmuOqEKbwcW9pHCTHakAPxEMNaUU7eee+L7FV9CDaiqeFx8gxcGj3jDif51?=
 =?us-ascii?Q?29YSry97kencwWuSn/f1oo5MNs1IbRJ9+6o2y2+E+LmU6C8h4QDjp7wpOoQV?=
 =?us-ascii?Q?JHl3tvc7nEfBkr78D+n4ZnLpD8Jh5iZKS7xJYmNN8QU9HgiaCUTB94thiqE4?=
 =?us-ascii?Q?ohC7+UupgrBEVwOT8NnyyAfkpQY04nvMc8rP/uvEOHBR6sWQL0ZnMMGEH9nG?=
 =?us-ascii?Q?soTqG/T4b6M2Ry6k6dIHlMrOMBDb7L1qGOLw5P48Oz7Z15BbAUI8dhi27qCF?=
 =?us-ascii?Q?6AMdv8h4hYB94o5yN8K3+qxjq9raYXeM83JL2mkUxSSbTKmCdqY3aGJPssNO?=
 =?us-ascii?Q?H2ToNkYp9TfNiKjK/6QG9LOhHpTfnJP7FUeaETpBxtKq3YffI9bEtAWh+N7A?=
 =?us-ascii?Q?mpkyTWvmxirr0ZB62n4HgDE4Xxu5WXmeVcwhKyv/YAD0YrjI/s9tzoyt1V+G?=
 =?us-ascii?Q?zRlSX0loTwywMOrWJanMXHT9QdLWFbnipAV7tyOlzJb0DHqoqpTqQzS8jcn3?=
 =?us-ascii?Q?wgjcebK7wwYlvIeBJTTjQZDgndGeV5KqyliY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qVFzGTi0mOGnLTl8pnWR+PN0SapIKhqhbm3T9l25T44VpCqYoOUHvH8wVaUC?=
 =?us-ascii?Q?dCGCh2r4sxBi1FgzO6hTCDMbOXRwYG1wXmxAODcLaBQU8Qq6WxeHt7QvIi6B?=
 =?us-ascii?Q?/TzwM7rCFfkpgvbSPbq+Wfg6jvSG5NC65sMQLug1Y5CMmpKEPfeopkxsGb9n?=
 =?us-ascii?Q?v9xOYEKUMSXelOLcfVHU5JyB5l1S9VSPuTOCRj9FpYzwxl4ioDiZ6jsS1RLH?=
 =?us-ascii?Q?1q6cZ2dxIXAVZSlPTbcju7Co2e+nTI60Sfh+Xq6uX4WXF55Oa4lQGa1OVDW4?=
 =?us-ascii?Q?5B9HpBJ+jWRrLK7d5dmhBnYzZ/SVsM7BApb63Zvfc53WjNeB5B+m+OBz8SYi?=
 =?us-ascii?Q?jGFOTWG24O3QbTvMTQIPuTX0GJUTBDT5ovoCW/WDVtEYU/TsC+I8XOMVf7Hk?=
 =?us-ascii?Q?HpBBOGRBL/sZ5XdKc+GoQXZ6rRyFA8/yT3rAPVk1LR8Z2DfyzOkASLWdg53/?=
 =?us-ascii?Q?p8/jC9fz7Q8Ae/aaEzvWdafLfX9gSYoQYpxUIcFsz9Q67yZho/j42jvUCF9x?=
 =?us-ascii?Q?V8oMIvr1GBpS/mS+qtpPH9CkisEY8gpOSccwUejScfUk+xiTBdD6rO4ereq8?=
 =?us-ascii?Q?pjGLIkdaf1QYUJqVnF5t+8NlZXmks5u0MMsnI94DeDWnctsjvAB6nOWbSlaA?=
 =?us-ascii?Q?SppsXWZowjOFy15eJgPC17bZ+yxEmsdi0izc+vA/P+HcXDhRgtLN1UJ47AET?=
 =?us-ascii?Q?ir7TF/W+YSl/oFq5cxZqUb9ppZBhYnBOZT5lvcBz531kYgRxGRv3wPm6MyL4?=
 =?us-ascii?Q?JLvJ3KKI3hMS3yFYvv7YI3ax8BeBZYVOwt1s8LW+stx2iHC+TukIPBWd1jgg?=
 =?us-ascii?Q?GWPwii8PK/ybW01/ZLMB+roIUdeOKp3W1+JwYto+N5A1ueGniBuxzV4p1ZqS?=
 =?us-ascii?Q?+1Uf4gcRNMH0Npr6UUvcw4GQTly577tgPGCqV5S0Y1IVPQSpvnQVmxrzokgv?=
 =?us-ascii?Q?3nw+alyJETxrD/pHDo0n8MxPRITQkIwMD/Q08pnDlMTQ50nfAWzF2PicwB4Q?=
 =?us-ascii?Q?5/CSBnRobVCUF3loDfPiggE9rWSRu6YGFzYQFo4+GnTgg2WRvk8bcllsHrmc?=
 =?us-ascii?Q?xnsn8goVkxzT03nbxuWjvNJq1hV0FdrBg3xt7Jlx0C8CmT33d1XUbK5+4Ajf?=
 =?us-ascii?Q?FpUeUGGMj87TpUFfsf3CswQfEMcX/wvk8IunDSUDgSB835n+Z9Ww2rFsefSi?=
 =?us-ascii?Q?n47Sk/sK3vqITT6OZgg4cjQ/k1VTTAnDZDbB7pDVGl02X+mDKjJBV5C6Ae0S?=
 =?us-ascii?Q?1sn1u066uL5ZIpcoqAFe5izgRGHhm4F2BSHBk6Lwsx3k0js2ayM0GovUy5Da?=
 =?us-ascii?Q?fiAED4ImCBhZL4DZhALafWtB3rPnwuiUpF2GNvIdGUt05KphTKI7XXC4/bQN?=
 =?us-ascii?Q?3CLHTemI4sQRNdcDAzUHc7LeggKMa6LfIttkODE9uu3VHx1JdNfFe7L+9Q66?=
 =?us-ascii?Q?pK6v/UDYg18syfewG0UzfB02cF7T/d4lAaEwbGLVY8Se86MHi+QlC0qhHSoj?=
 =?us-ascii?Q?B3oJ0Lntoz1tIz4A2z+dgj+LO9TYPN2C18ti4dtC8DRo9QOIgpAc3YLFVkjY?=
 =?us-ascii?Q?OF6OzXfokUuCMgO62bB1rp4vI22zXfOjTz+ui6uQAXlwJySRG/BXaRz/IPzg?=
 =?us-ascii?Q?30okb/53y3u0yn8xZDlT+ZA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92543f79-397c-4b17-6b94-08de2dab6bf4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:52:21.0340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWod3FEQa5Bx3S/URAno746AynB56im4mkCA9ae2OOvbCAp/cKjxAQO1JlTsIgVV/jybWw8MD+s8KzTfjAK5erN/IOZGis4r87f9o3YXl36K1JMTF2cFmDbZAnr5LsUZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g057h44-rzv2h-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 445fce156f73..eeeb5a0be6b6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -440,6 +440,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0



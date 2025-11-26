Return-Path: <linux-renesas-soc+bounces-25202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE07C8A3CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AFAF8356E2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 14:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF79304BBD;
	Wed, 26 Nov 2025 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="u7A9KpHC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D853043D2;
	Wed, 26 Nov 2025 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764166278; cv=fail; b=oUl3kfOWgWltcwoJuUXDbu8UIoARuwu9mwvF6nvSsnlkjqN4qgCtukXLQhq+PfSFBNalebNQA+UsYe7DUo775tvrQVkJ8P2aNZ4/Ng5IH+QIJsQVbvVUXHFvVuMF/PgJXMrbYYQfzpUegEJx3LMX4Ct/DEo7hpmrZ0z1rJ4NkSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764166278; c=relaxed/simple;
	bh=/TWcJVxSjz20QlUuaF7czKmmFqAE5WQhsgcGx+fS508=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YzcS/Dgcuze7r1EH0tV/XYkz15YXKMFKF/77FlX6JG/zx9j+OPTGuxHfzrcRQPk/85vYPAtAIPzuvb5lWkBRpHM0A+ahQNsAV8LQqZQHv0OED2GVflCkZHCrjxZAuMA4vE1EDZuu6dWLQkYCatFS+zBP3/66en1+SOSJMFujauE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=u7A9KpHC; arc=fail smtp.client-ip=40.107.74.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYpNz+kFAQFcJ7qHEHjdSjZMt8X7DWtVydc/CAtOevqQVrJIn+zNPJl69OwCdpjTjcP4BOvfnobyWqHLI7G2kj1sVSgugL9SgRnA78WfPUnWqMWTnuee4YPqcpDLa6/NobdEcKsGJVBaw/E2GD5sFjkDkLT2uj967/pLaAxkJhp3Xg3yQun8Xae1DtX+R6mnYSWTOpvjYNxmFEoUUpyLpnprOETDIAP5Ps2OorB+fqyStnLjfjb9Tu9j3CHxZtIUfLYG3IRVVZU6dTTMlp+NR7kyzDtJLJFYwYnHvOwlZL+k4gbX1jf8Ql3S0jxI4yZPjis0OwwbvcFsbZy3wc4Bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3z7NZ40OM+El+o3XNo45yeoTF0Vq9cCPWPmkCmkMb4=;
 b=JFdrJGgmLsYME7Q+wdroXYntE6WHx3MrFm2LSc6zgIk3CSDpJkSMIZar/iWDMK4ECv37gn+RNug7fJtdLTcVtHOHpqO/W2mV7W9JKJyWJwu/YxRg8F0Jl99Lr/z7WZOJEi7PcYD8JISZgFG2X8/SRtiz4Q2p4ZZsexmM7EyDEMfuooyglKOBellH6HqHB0mlL/ns2HDXru8wBYFo+Gd7dSGr5/vv3Yt6vXBaE+jZXmGCrGoFlunAPktWy9l7Sj9TgLzig9/P+96iWCyS1GUM7UBn2vOjm0ZEKMPK3X/Wh8bRI7LWdHEUaaUsZvpdxL/lD1Cv0LGkWH9S42HeODlZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3z7NZ40OM+El+o3XNo45yeoTF0Vq9cCPWPmkCmkMb4=;
 b=u7A9KpHCvsfoV5+WiEyEdawFFMg3fDRJ9qmwyA/Bjnyg8TSWwTEBTkWn9Xku7zHTBDmo9Bb9o5UTiRo1hbNmG1+DBwPsAApB9kmfn+coBfSiJ3B3fkMFr1WgM1k0U0GeggB4CsivAb2SDQA41/+n0W0fsHvjP6+DeMy6vexSCrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:11:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:11:13 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 20/22] arm64: dts: renesas: r9a09g047: Add vspd1 node
Date: Wed, 26 Nov 2025 15:07:32 +0100
Message-ID: <554850e7cc0ed99ea2a0d47840fbd249d17faf6d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12821:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d82bc4-4899-4c6a-e97d-08de2cf5a833
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?oj1VNkMiqgsZC4V4XPf9m2Ss6MVHJ9UcPoC3sM10yp5RO0ex51FJHy08fzV4?=
 =?us-ascii?Q?PjDYytpm13G1GgndDUYS56LyE3FXdxAfl50SwXL6Ke+zQbUdpS23wctht50f?=
 =?us-ascii?Q?XhjvpY0VMTXDQGFUqqNLxTLmxq/8Q6HrbmtLWKqlYDbeAZodQFQWIkCDG/CI?=
 =?us-ascii?Q?NXnRrpYhkwhrAixazt8z2snJH0CfbbIkrpKXJWTumoOpGFTDekijZupIK22K?=
 =?us-ascii?Q?xGm1b3P2BKh/zJVkQjgnwnwhd3/qufkO1aSSfyTnVC2Yzh61Ov3rnDUFwSb8?=
 =?us-ascii?Q?fUXWasYtlokI0Dyx0Eh8GDw8E3pLFBfw6jL4lSO3CjLtAuqQgIoH6J9Y1K+Z?=
 =?us-ascii?Q?rwbSux1RmSs1zSPPy4uODz0BPY3xZkpf1oTQPMAxDe/sOl+XzRBPfHmCX5bs?=
 =?us-ascii?Q?eThsKpaYbzlFh8eVzbDOxPOlmEQ2S8aXhnaOPXsj95XngDHTX6dNJ89NiJMZ?=
 =?us-ascii?Q?vV5+fvRuQCm/rDjrSHEimPOZc7lgGDH+/y8VNEgim9HyaZgfVZzS0XyykGP1?=
 =?us-ascii?Q?+mFdA3LPbDJruOQbgabNa+ohnVWLzx3m/l3wFqw7/rLNO9f2WeJieZrA002S?=
 =?us-ascii?Q?nxrUZnMJj/nN0ShJoqygMkZRveixczVDNw+tXESXDqKsRa2kLGxbKF6fSUQ5?=
 =?us-ascii?Q?uHoKc5nAPuxoD4IP7qdZFdp059EhY1gZy8OKJjpcIKMXnis5QbakvZDSXh4U?=
 =?us-ascii?Q?o2SAfWy7hDdv3HKJeMGhiJOemY/xcKsbPSSTRGjgQ5ik0Uev58SdKvzYLMa3?=
 =?us-ascii?Q?KcqZRDpz+5QVpmqgZYPHz7chq19/lPVXZJI9CswwachoZGswpHnPASNqkd/a?=
 =?us-ascii?Q?l8Ah+5NZObFeymuqLCv+526a49MaieUI2I3z6eBIQN/rBSKQ5+Jlaj2cTHZH?=
 =?us-ascii?Q?L6N0N0CXQNDavVBpNnwWWIvW0I0rl4lOUrkVPfWCoQq+wJVSYny/V+bVSn24?=
 =?us-ascii?Q?ah2lVSsj0Q9Rh4zJXRA6YyXQxwC9ZHWyuyijRzgajZN1mp5GT973CGinpMpb?=
 =?us-ascii?Q?VUBoLRzBEC9c+3uF4Bj0lg3G+30iHWBtAUV81actlX1gd1pBtAKuWS/ETxAX?=
 =?us-ascii?Q?01nFv5DsnnVOoVql2gTaoxpxV9Xe3g6jYKLtXbvuXR6MgFSfcQL2HRZVXIUt?=
 =?us-ascii?Q?hblj3mFBSqIGfWppIii0ur9hJbt99fCojDuGb+njGl2s443AbbWe1ZvAxCkR?=
 =?us-ascii?Q?6dk9/+oy9Qs5uUlep52u+PQfRj4gAdnWrZXNndVnpjEHDJviiP0fR4+47NYJ?=
 =?us-ascii?Q?CA8qtQflYE/GTcg85UDxzyxMtSl1altPloLiJHxHn5tYKl0mgtwzDa2KnOmq?=
 =?us-ascii?Q?5EBcHtO8E8MlumW8++kDIkvWSw5GY0u8d2VR7VRVHyPmya7X9HWXhw+ARGJg?=
 =?us-ascii?Q?+pxgF9sYeikKbJeTHA/XLSx3qnqQRx6+KrV1zaBbsMUzq3bu0fskOeVPrlN3?=
 =?us-ascii?Q?xn/9Io+VpsQxbv+4etY/QXwBr2xY0cWjXQLZlUj0ky+VurbKfw3j2EJNt0dG?=
 =?us-ascii?Q?IyFBToHJRtyZgXuC2ccHcEb8aREllJ+oAt6n?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Oprsw2K7Hh17ntebmbVLS3HZHeN7uAB9rB6SiNSKhc0YBSkOo8vUtt2VR55l?=
 =?us-ascii?Q?vFzz3534aidE7IezblKne07IvLTdfLf/O9QGjFaonE6kpeO78T5ITInQmbXp?=
 =?us-ascii?Q?5Wt6kkluLnzHyyXO3em8AzaG6Z6ERWa94HnlEPpcZFyn+MhAJgGOFdkaP2IU?=
 =?us-ascii?Q?QEcYmKsHoIXVOtLB847RQI6W98CccWXXQwkOLSZL5ZFEjPomHAtcTamAcRSR?=
 =?us-ascii?Q?xOBnUvSvGc/CrmMCXhK9huuNlLVy95IrnN8VykJkZHSnDyKmI9/PEXLPOVSd?=
 =?us-ascii?Q?jIEv3tzn6M7AVYp8nMCf+sFi+PrKAMpN4UWRr+laGP4w+ONbQwu0E7n/72oJ?=
 =?us-ascii?Q?8h6oHCTANb6+vhA2PwtfPOJkZ64wpK7557fnJwhpvfSF6FTVnG4yuNKJd43O?=
 =?us-ascii?Q?CqTWsd1Ol2g603mIsEbTVxBdytotZLnH8Hk0tvAgShm+fcvk1DqJs9GISAEJ?=
 =?us-ascii?Q?DF6xznh/KkD9pV2cLklJIr8sZkUCm41YnAqm0t5vwonqr9Z1yrx8elcAvy3O?=
 =?us-ascii?Q?Avzim/r/horwlDDzjZyYSkzBAybwbJs5vHGd1aFlcgF5bisau6jdAIrAB92k?=
 =?us-ascii?Q?xSFiMtiY9Nzpq9zh1ve7qpCFGrZpV1IJB4zY89n0W6Uu2xWq07zVZ9MKgkSS?=
 =?us-ascii?Q?aTWoDu/TP5bafhvEGo46kPPLkjTy1Fv6TjbtUXXjG0byA18Fa8iTNQfvXY2F?=
 =?us-ascii?Q?lJ6pZ9DgHNjnUY1Gt950E25BNzmQPrCR69DFh++Syqh0QysT+V9QSP5oIeXK?=
 =?us-ascii?Q?taH6oAEz/gIGUpsnuX2NVm042gxbgYdzV/WJ8n/N99QAg0J+szvG551g3NlG?=
 =?us-ascii?Q?//4JbUurFWnwUCQ728CE2IfnmuRWTKnnE4ROn1rDieApg1hQenzFdrvJ6+BV?=
 =?us-ascii?Q?Ejc5CTl1O95W1auXIU2hwlb8HYgagCg8uB7UcCsPFqBy09PjTaTJ3aIm5SEu?=
 =?us-ascii?Q?Sp9kHoDc6f/WQYzq0kp3nLMT7SNfL9RQYNfKQbdsfzc3Ad1UC/8SIK8jYghN?=
 =?us-ascii?Q?dP4srolYBRbmBD2F+Qi9VLED4W6gJRmPMIGsfEBO1e0IQOkh5L7mk7ln5A6E?=
 =?us-ascii?Q?qXhc/qoGhL/Vo0K+/tgXvXiUFEAX6EXVjniEztd6uTT45SgUjWIrRY1OGwuf?=
 =?us-ascii?Q?CJG3GsRIuE4o6fhN5NJqyD9BaRPCwMcFm8+Vdne6J3gWmZWwIkEo7Ae9K8/A?=
 =?us-ascii?Q?UbaufjlxBO4+fne0GUmNbqxljA3AFljYlxFRZ/eXuff+sjPW3aaceph9XLfp?=
 =?us-ascii?Q?IKo5mvpoGVLrH4UwXJL9kX2AgRx4YkqsPM8QtJUvJU8XuOdNH14APleLcEap?=
 =?us-ascii?Q?7BbrrjGosvkRU5E0bJbuPWvpjOFcGYmDTk/yvKPC1714xG2/o672Coh/G1fJ?=
 =?us-ascii?Q?sg6xD+XfDQSfkaweIoZDfJumJJ0ZKIo3T8BLO2oxHDe63bxYZwScksHh8Ub6?=
 =?us-ascii?Q?YmRIqnkp1YGmQPe1uVdCiLDJfnp01TuwVhYIQwPf0dzX3PI+ymKg/UwBBnvz?=
 =?us-ascii?Q?offrDPPIWzPSZ0N/kbMz6h5czxcW4Cp0YQsWBWKd6FK67/xlqMtiI5AOWAI5?=
 =?us-ascii?Q?qOmBLiA9qIdV9CCy8d56UItTGpJsJTzWqcIbrAC5Zy4iZIj9FElLcq4zyjC5?=
 =?us-ascii?Q?an356vacyC4sbd1qrWM++Mg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d82bc4-4899-4c6a-e97d-08de2cf5a833
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:11:13.6879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY5/huR1cF8byCEtkJtzA5uXJtZrvNwHfpoXRnkZoR2f19Yp344y+rfS+KSrSrMzkYFogj/t+FSXz4M/cAJnVmCMrb8x90Eyh85Pu2uk6rNO8BQXrt4/H8KatSMo62ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12821

Add vspd1 node to RZ/G3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index fe96b412cafd..11f7a3c98e74 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1219,6 +1219,20 @@ fcpvd1: fcp@164a0000 {
 			resets = <&cpg 0x11e>;
 			power-domains = <&cpg>;
 		};
+
+		vspd1: vsp@164b0000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x164b0000 0 0x10000>;
+			interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd1>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0



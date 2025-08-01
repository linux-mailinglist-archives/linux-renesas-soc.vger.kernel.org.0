Return-Path: <linux-renesas-soc+bounces-19827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F639B17E8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1B5B5812BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 08:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD141D5CD7;
	Fri,  1 Aug 2025 08:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rJ9dpJEG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A14714F70;
	Fri,  1 Aug 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754038135; cv=fail; b=Geh9eWkkx9In5N6KLHzn2lMpnh0UPogLoVcjvnxlePbTiiEOl1Itv+0+QeQE1t2x458XimyfIX7HMma9sg+67yUs/VyIcLWhvgRjBYs5SkMzZ0hzdURx/18FPGEPTqe+xclUwgRzb1l1j4YKNp6mS9hWtj1spJ5VnCTyV9XTypY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754038135; c=relaxed/simple;
	bh=hF9f7sOMe1tjgxSXNSwCwkSoEDA+U9KjWkwsliwh+EE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WWKaZdk9rYCeyRzk9fODoZB64j+QnvLZpZAyy9mM/+V59WCbcoYTd/43mKfcZM4C8UwfSxk5Y2mG69+9kSjK1MS05DLKo3VGgcUK+uWZPBftKbyfBfnrHVJzp8zFNhwtMi9eAwuFhOO+Djm6bUY0EFh3HQDA2oCPqNLCeI5x+W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rJ9dpJEG; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sa0fVXxDey+CK+1yg3V+sKES6XTayT86TB+U/pvPFz6hhLmFT8dB0weU4Fe8QeQiG7Mwh3u7cKhAnY0wED8fzju2njzoqXWckj0DK2x/YcXlX/cEWhG2CijK3lo66smRqXs4o+0G6n+IpR4T48vWHQKTCVPbAKX9WOO2gWRsnuMC21j54TEot64b08Oor09BLrZ/JhiHRp48RvEmLe1CFidk9bo/eIzJS+uqgSXEDjBBR+DQaF1z7u9bOHNxL94UOs7Dml9Xy9tSL85v8wNnA/1or9ghuqfBfvMs7CheAtl9wYwP9aZtuSL/3xU6ZjWk7RnIxgkSZXYsSW2K9sRjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylWv8gV4IidHzciCN1pxB8op6Rzy/o/KK+DjaWc3Ntw=;
 b=MIGV0ThV+uc3WbcgbVwoEuG06/AiAoY/NJESCqu36LLIKXGxxJeIqFk5B414O4+tMXT074EeGL6QR24ZZiKynH/PFGxXRafYu0R9yyIrq5g7W3VCI8bTozItXDOR0+QNLQU+6ImpvwhW73v8QwLpNLm7V2RuHiDyCnFzQRRKe3pI890Ih+KRnmY6XujWL5W8KL+z3RZ7g0lZI2oBL21YMIpaptHDuHzYB2imgHy7inFG85MLQ9ki7ix/YGyAgOsRKpr6MiYtG1od+YdXVj7higGLB8CIK+wTBhxc251dr8+yLD27Er2OdxYNDBWVa0ftVxzuAPmivAqSQp4yOoriww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylWv8gV4IidHzciCN1pxB8op6Rzy/o/KK+DjaWc3Ntw=;
 b=rJ9dpJEGW9MAARqq+6FkannxAbpxXYjuWDjM7bQJce0iX2syGv362k4CMWmAwswEPxEVoeyqtn0lNurGpyqlxwizeIaeTVbpzmBxO3JLBOWVmB87FzucUJfaFAMRawfxN9toKnDwrFPKMU3D66TUyCPOnr84FIC8fnPAYiw1TJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com (2603:1096:604:10b::10)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 08:48:47 +0000
Received: from OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0]) by OS3PR01MB6657.jpnprd01.prod.outlook.com
 ([fe80::8575:e22a:3c44:76f0%5]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 08:48:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add DMAC support to the RZ/G3E
Date: Fri,  1 Aug 2025 10:48:20 +0200
Message-ID: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MRXP264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::21) To OS3PR01MB6657.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB6657:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: b281d2dc-39cd-412a-7062-08ddd0d83a40
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c1pgpSKf7U9alIOeByq5xtAabf+AGN/HA8tCnvIuNYC0I3Kxp9b8z0KO1NQl?=
 =?us-ascii?Q?uLrVDtZdaUWegbNuEEOu427diw7bfo4MZWgvjCoXUMsCVD34WmOxKc39Zi+4?=
 =?us-ascii?Q?Ntz2BVNQlHqCJ89Lt9Kvi87M119y3nX1YQiIADiJ7FU0BYbSm14IPJtA74+V?=
 =?us-ascii?Q?b4t2O7X2jyh4GdyTLsjtQsyUkBmE0jUjrRBiLiTC/Ppn8PpyLg8smX8twqkV?=
 =?us-ascii?Q?ryJuo1dyDUTF+8NDF8NK1CFwmtuZx3pepRiJP/5ha8FMkXkHM2z721c0UIvp?=
 =?us-ascii?Q?Cop6jlzbEdehnkpNO4gh2ogI2gZvXpG0nfgFxNYOIyWWG26/EIe3c4zd9Gck?=
 =?us-ascii?Q?XF8eibEMbEjRFfote5hRxJr4RTwVu7vy89lOCbW6fKH0do+dWWL4i+NGYKYZ?=
 =?us-ascii?Q?h+meBaec4wdZPWkZ9uRB7OPc6qXNW7zRcwh+hLKlIJSYfEjVbGr6guj8aIkC?=
 =?us-ascii?Q?EYeeHeRWbYNUXEmPdAY8EuRVtgcuH1zxdnO+CJRRzBGaidV/V49TIJm1Kei/?=
 =?us-ascii?Q?Fb3gYjJplOT2O7wZD6U6BwYLTn2/+9+8YUGyk4YtIRV23y8bcXu2RVN93guS?=
 =?us-ascii?Q?4ctxvEW2rfP19xvu0gTLX/2Hp3W55rZrscHGZHCZiX1BuPqCa+pbC//K8LTa?=
 =?us-ascii?Q?83pkh3WeH/ZkhoG1r2W2vDw0M41siUb4VrrIF17At9P4xmcIyfyCr6Lj8Xh9?=
 =?us-ascii?Q?Tm7t7G7SUw/kXhR3dHbJr36Fh2nNMlCcuQVxb+D7N+RTqTvm6Ww765BTWmkV?=
 =?us-ascii?Q?MEPHNCKvoB3wbyx1y4D6B5Ds9A8n8LUl6WDTX2PBnhXnY8+e7T5bJ8OdURLv?=
 =?us-ascii?Q?+67b+GQ7vxMI0gLZNxXmE7z9NYgSiBTl3LffBdXj5C3z0QiBriJA+NXTc12z?=
 =?us-ascii?Q?cZYXbwg/aUO5zoZojmxpcO5Nil/V891JUUBWEZiQjFfhs/L74FFLpPQQgEpW?=
 =?us-ascii?Q?xEpUNZQotroVlMbRM0yuuHNxrJ+ZEB7KHmf8HfOARSLxcNIyFdhLVGVw2VEb?=
 =?us-ascii?Q?sFP2Bb7W+fNiVyzibbwG3L9+Gp+FNGZCWZihojJEem0Jk5YTJJQDZs9HgaCA?=
 =?us-ascii?Q?Npoz3jKwZDWU8XGFOirBNnrlUMSbWvcW4J+eXzuD+BfU/OpjRokD74OnhYlT?=
 =?us-ascii?Q?j9iBXCxEeR5IrmWfEz9TkTuVze4jI3i/ENDJyx4EfhLOOinuf6e1AwCS/T94?=
 =?us-ascii?Q?JRwC6jBJhJHFVOJmFnyPXZ9uA1HzZuL42cvXWS3KY/vhaZDyarqQlMNBNBkj?=
 =?us-ascii?Q?Xo0OTImtCHd5gezaZG1UxCxmpsNRrCZ/yuAg87aDlmfuSmH+67wNBoMvRr81?=
 =?us-ascii?Q?sou9Cxv06y2uHw7btFc5EOz1kkmZBkRiNub6y0hKpeIThm9LF5vfrZS5jAAp?=
 =?us-ascii?Q?Qnq5Km3V/crYHsBobqB6sODjp80KIfeQjFTAjJO1gF8N8J8VDiWZxMjJ+myc?=
 =?us-ascii?Q?XpS0YYGfFuY4+/x4zR/+QbBJGfh1ySUL86uhtquQ11C2hV+aBv2iGA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6657.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ocyXtSmaJVNbC4BFYvOR8rJSixeA+HT7yXEvLqorWQKjrFr+lRgFT3Ydw4Ns?=
 =?us-ascii?Q?5rXD4yNwc3Nbu+qPYA6ppTZCFnR351X+ZZ1qmg6CGgqn/z9ZaWwjeyCuzzax?=
 =?us-ascii?Q?ewHQ55yaimiKip2H5AJ4JSryHfQC0BpNQX12RICS8q+2gulYN1AF9UStcK+c?=
 =?us-ascii?Q?3tLVI6Ciw6y1B6bSn32nrRq+o6FDYAD1M3T3QcmyTLXuaeSFud2iKVwAhE6V?=
 =?us-ascii?Q?+5Ez5rqlUXUAFAymOyVjupnMWbLRmqlsMbhLD9hluIGrzq4kEE7WHPs4vCXx?=
 =?us-ascii?Q?E3tIDUlS+XMciv7+GLZgKibv+KQk8bRSk8YyZTAq7YHG1HTlTIRlKVeMOq2/?=
 =?us-ascii?Q?7h4hEK8qPk8gf97winxTBPbMCY++OjSrq7IiNZCTCOyMJ2FhqrpRxev73kwN?=
 =?us-ascii?Q?IUBs/S5iEix+Av17IJplTdhrWLMDBY/PIY099rawR4oespsmdHK9FrI/C2rs?=
 =?us-ascii?Q?SoeMC+oXUUjDu3tMEvJtKARJz6jj2au3bYbM2HxLqPEuRjdHrphV24cEM6GT?=
 =?us-ascii?Q?UrqMT9gSfZSgsxHm9Eb+AQdy3R3lKXU7YbLf7bgc2rHUJALZ5PMc1N1UdZnI?=
 =?us-ascii?Q?WeVPW487zJZqFnWOLIzwn+gpaOIf6uPFk6YUNE004Ethw/uXd9vxA5K/N4W0?=
 =?us-ascii?Q?8zQgFZ/dsy2tnxrsYKU241XiiTJa9m1ZHYIrt38D8IP/12U5Y1OxwhlBHQBu?=
 =?us-ascii?Q?AVYYtO4iZYYLUFczOKjTZ9Iy0nR2DXt7F8/l9B9qno8HNDNRt5TYeUVBcIkc?=
 =?us-ascii?Q?HUG+myzn5unPHn42GJWIKB6oK89I5EO1ce+CpQzuCx1Z1S32vMIKL8eUWBb7?=
 =?us-ascii?Q?25KxE/xwEf3Bm6XqUvVOqkg1k+2XxAp9qgDXKC39UdWbPDgZtVvkuEe3e/as?=
 =?us-ascii?Q?RwkZkSTNPo5amqC3SgqmACGYEL1HYZ8ijT2MEe1Aj3JVEQouuNm/6FN0+1SI?=
 =?us-ascii?Q?oFAMF9pCkwHV5mLqoS5j+cQMUDgOqZ35vPdg6+m/COVAsrZq67H6RqGUXFuk?=
 =?us-ascii?Q?KfZGPKjrl8K3dF6TqrpIupTjvPBMoK7R67Y/vAjhRS3NQC4gLJynEkPQLBpm?=
 =?us-ascii?Q?qCJ5rqnnAKWi7VNB2SLbMJBh+4XdRBS0SrJtSf9rw5iuvnreDkXJ32EIpqJ5?=
 =?us-ascii?Q?SsTR0wv+vFc4NOpXwwv8xuV8pmokCQlV9x3ilVEIwwim7D+ioxxK/qtONrbw?=
 =?us-ascii?Q?PY+h66TvPusLM4H4yT2+apmPP/OZKBKu8zIjTuTxhByGcr4fmUP4m0IWI8oA?=
 =?us-ascii?Q?siUKVzAm7kELmE83IFh0wiH5sOOHgOBvRvAQHsr2Qzmv41zmtW2iD625Unte?=
 =?us-ascii?Q?3V+dKsHhbcghhmqaWT72WUs7Wxpcmc71QgNf9EYdwjH892M+r9mkEreP69AZ?=
 =?us-ascii?Q?d7pItJ+0LFwi+O1vT2J9rU4cxowtrXo79b/lwg6N3ZvmletuLrurF3gqltnV?=
 =?us-ascii?Q?7JXzBv6XZJXXcEbfSbkHS12nnuHA9O6siU44l93q7nB1Lzbe5cJOoFcO9rSo?=
 =?us-ascii?Q?6ByFUioH5HSb5XuYhdJw00QZUwoVsXlWp26OXHff8g+acZ6QfzdVze2X4J9m?=
 =?us-ascii?Q?MzDburcrMWtcIH2ICeuhe9+eeahDWRLDNT0QaAvO19efU+chZuPkmOJPrIv1?=
 =?us-ascii?Q?yGk9KZp+Me1DAFLodlOBBaE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b281d2dc-39cd-412a-7062-08ddd0d83a40
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6657.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 08:48:47.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bcnPjP4CcY/WPu1aX0YmWnrSsQ4wmdL1/vcmRp4qH8e0i9/8mcp4tvmI7DEoDmeRC34Fp+eO0KQ8mixtqeEly0KsYRcX62bLa8BjokEcHACJf+iG2DcfAz7amrXYCsy/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Dear All,

This series adds DMAC support to the Renesas RZ/G3E SoC.

Thanks & Regards,
Tommaso

Tommaso Merciai (3):
  clk: renesas: r9a09g047: Add entries for the DMACs
  dt-bindings: dma: rz-dmac: Document RZ/G3E family of SoCs
  arm64: dts: renesas: r9a09g047: Add DMAC nodes

 .../bindings/dma/renesas,rz-dmac.yaml         |   5 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 170 ++++++++++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  19 ++
 3 files changed, 194 insertions(+)

-- 
2.43.0



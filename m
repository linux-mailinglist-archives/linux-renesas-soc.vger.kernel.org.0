Return-Path: <linux-renesas-soc+bounces-22536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB886BB1CE1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 614D54A80CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4DA31195B;
	Wed,  1 Oct 2025 21:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="stpcKLxN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011063.outbound.protection.outlook.com [40.107.74.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3353C271A7C;
	Wed,  1 Oct 2025 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354074; cv=fail; b=KXUnh0m7m77tJyEpwZGSQpnH9RgPmD8kcJPUH8aDtJzpQZwAda5IaDtcoOxxscznxWEFBvGyfz8yZjiIHEUFZM0Im+bqnaORBJv45yhDZPgaLdQVsCxAQhIgM0oTUBZMXM4hFtMeuWH4Iq5MdKUuuRt71NRmNlodFVygoxJt8Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354074; c=relaxed/simple;
	bh=oA5k1a55ShMjD+mIxJymTjqKh7xWiyRoUnUD6/jyd/A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pmDHs87bOIArWZcPztxDMyiaB1cd9W9tcpGGeFadOMSMi1Aw8hwIRZROTecBuX2ttrR+VboGlzLyFIcUKnM4h7ZAjv+MYHXHNTxfmHDyXaa+coU68zlByAOdpAw8RwU/7V7z/MyPMcuLyCCVGou2cWCTShO5nT6AVbn9oGFeDOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=stpcKLxN; arc=fail smtp.client-ip=40.107.74.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFNbzQ8IkpIQRovp9nuJ35dcI6tWKC0/kd5wg710OpfAmwgaLcSVDz5gx9ePKHAHwqS3QRcHe+/zZ0F0aFIeDBBG5OZOTWX+cM5Hy66TfDqVnis+Gnrmc+6U/+cI4DjGSQsC8LUF3n4uLPdROJOqd3qbndrLJpBxwgm1FiPCU+Q7T2BvRRvkMzQLcj55mEHDNbjHCwrX0+OYOjYe3bDu6ryIAIU6vq+1+U96ii/y3j/4y8zzscB3DGVXN4ZXPzKMZglDx2OzKRJFLhNucc5RI99Ba1Tdy8/Zhg/LCV9w9Ts3Xrlm8ljJMW5ZKUXNgqjrOWgDMNHqiq6hRvshZcqLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67iIu+O2CTJ/+KeoQij+C+IhEgCLRxdQCFKXs5Cyar8=;
 b=g2a6T8FVS9gQkcNMWgXSOLjBZjw7l8X5UAhvtS6QGxO7Teuv/hjShZDaStb2iWibnOjAPJ7E3AJq1GjbZuzipSyznbYpMfwSJJepvTXAZCyD3brSgrh4lUl2gHVprD8H9WhxOkBDYY08GWTd6VFYM8Q3Oo1mR7SBm32MSSnAVYol+V/pq0hd8aKUtjlCNNvZ1BWO16/GIxy+1iwCAGKAsZ6rYmicv9/kpJl2LZ4k8pahRZCfBDwB4povp80jlJL1eDQrVlcpNOKPExDFzk5/ZhLSjV7U/ymLBdNNY1fgTe9BjTas4VkXrTaq83HBvg3u3zq+q+VrqoHqnVjFyDJSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67iIu+O2CTJ/+KeoQij+C+IhEgCLRxdQCFKXs5Cyar8=;
 b=stpcKLxNmrpVlEyd/I7RNiJIMJKLlCZkFYbMFcOAfNx8+CliBiCNzfioDKgbBpQZcaMXFBuZwJJDIzzk8OUmNjjPLSEwVIsY9FiqIhn7ZUHIy6LytMUXe9I+nQyrFYzYmNGwrBdqhV/Dx/HjjAhdwZFg1JlRp0kGE3bUaHq0GWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:27:47 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:27:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/18] Add USB2.0 support for RZ/G3E
Date: Wed,  1 Oct 2025 23:26:44 +0200
Message-ID: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 8183e2d9-fac2-4a88-099d-08de01315d68
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B8oI9OQcQFv6Fh1Texg/Y0FC9ygJfeujzkhSjCHRmKrkgMDSPhUP9hs/KcTX?=
 =?us-ascii?Q?R4QA3PCFCfkHeSWto3mN4iL8p5YwVr9CIIUxk4mWB+LtMFymhYf2gyw+msuJ?=
 =?us-ascii?Q?3uJ0Ad/9d3+ykI97Kh3i0dM04NTylEYenJgsfIXQetI0nDtl/bGOrCNaED4G?=
 =?us-ascii?Q?C5ZPI7k6GGxA9OqbFQNSoYivnWvpPSvRhxmkejlB0ol2/Q1HEC8M9wsZO1hB?=
 =?us-ascii?Q?aaXtvphD5mbkcuySSerMSwX4e8HeGSTO8D6lKEgknNxGwDM+75QiLFEB1Y41?=
 =?us-ascii?Q?frl2zUdj4PYpWohymCWyORW1UpgfPiuxTFzp9174hWq7pyvvlvwduFXvaNPT?=
 =?us-ascii?Q?6c/PkCV5km0XClnxh3EuQk0mtgZFY+SL78j7w3g1+rWvoIL5SJOYp9eHnTbA?=
 =?us-ascii?Q?HNHd1YQDsXoXpRX1lsELAVYfUbAqZRapYKv9o6Nhgq/HjwXGu/2SH+V8I4jK?=
 =?us-ascii?Q?5DTfI0/hE9v4nlsFVuWcMWF1aQOFBQKclwb90uXU+YSAK+InBcPn9HXYu8T5?=
 =?us-ascii?Q?xrD4/9AWKgdtPeWaVgKIHlolwcVDGpGYqbNy4K0hH7AREx2Brx642H/pAiOA?=
 =?us-ascii?Q?39gN1kV6zbCJEy3x4I+gcnkLFdQkBBRv4naTLbkYKsi5n+KpmFxfznIrV6ST?=
 =?us-ascii?Q?VMRp5W0F8j7UQfSKZ16itG6hRSdHgcUA+CjGxWtRWu4ATTYlHM6JrZHUfEkO?=
 =?us-ascii?Q?Pki5i+Ba1LoyAeBPpQ/ygBIXx0vTCpqDFcDRifNaqh3w+ljQ/E8kquvuRFe3?=
 =?us-ascii?Q?URmc5X9vq1nxZG1Ui61eacLPYBYOMydPQIp69sLWkw13EmKwQMu2cwsY2AIL?=
 =?us-ascii?Q?v201RlnS+DyI0p/C2nedQwQP2FCBnypIsWKr00TzqBSOHpKxx5k3c3O12ex1?=
 =?us-ascii?Q?DhnIoWzg+28FvPmzamZrILqhbcKvAECuYaOHj3CBMqh89hWpIvxOirB92OJN?=
 =?us-ascii?Q?/6jIJA9J4XhT9C6+vnGwJk0FEA7jKJ+HDuKf08teMxxLG9mSQomG7a+3a6Mf?=
 =?us-ascii?Q?jJD8O8CEjR4FEPBcEDuYcM50pxoeF54YfQvYRNtvtIDFywFjaR2vFALSvkZU?=
 =?us-ascii?Q?4ofChX1buz509/rvzXLR3pzHndbKrU+6P1gZ8gfD+B+3NUnrCy2WGdiaKG4g?=
 =?us-ascii?Q?GW4UzeuhcYAm2k8K85sVZG3fN44PwLcKkUoipvCTJeIKOFCUqeCau0V2FVCw?=
 =?us-ascii?Q?hFsx3+uOsydYf7cKqp8VfUfXgZ36frALJ6K/t4qWWH7JASBDwUICtIx9cPdQ?=
 =?us-ascii?Q?3DF643PuRC6qH65yZ+gZTjzTqO+h/FJsna53+2WzGDznzfzuCvBMSnWjr6K4?=
 =?us-ascii?Q?vkvwV8YQCt3RafXJWaV65LQG5e6PpekxI2BxJg+ENB4OjzSP9V/QxDW7dqbn?=
 =?us-ascii?Q?3M+JkmD6kJp+M9fbYgPvw0LxxJi1WPX9N2p7IJLSEob1pijNFgVCzzi22E+d?=
 =?us-ascii?Q?M2ggKX9htm8YdZf6XstSDlW8cINY4S9hkKHZrb3So1LJkbyMSjI5/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w66IFyuwHbxSkTjnRmRfu0zeDNAYpw9fJKU301x/S6qCNYGpJdz0AUMAkSRV?=
 =?us-ascii?Q?nfZLKJvHRfo8SNaiY15C7txGiTP9UTnTKREC8wryu84QcJTmsC+sN3dKE5YP?=
 =?us-ascii?Q?0zI9G/R7vhTEQHQ2ZhDOLsX7euucVnZlzx7C0wOAzPy8miylHjnNFYYYHCZz?=
 =?us-ascii?Q?zqFEtoxOvBfPpyB4p3Rb/w9Ro5jC+KxEOJoh504JbKA5+FFPIfj/odboqEIV?=
 =?us-ascii?Q?5pHgSbMUzJ5mz0u5penPmTZzDNdegNMHVmloMXGaxqL1rDQJNkPS/v2aT0tQ?=
 =?us-ascii?Q?0IEubUQMzuXkWmO+YGk1YR9Jix0Fl4v+0vRqikvK/xi4WiYFksP9YuIrS5OL?=
 =?us-ascii?Q?pQTgqLVusmCq4AnZkwI/rBx8igwO9PY9gTXM5oEIXaTBSToaa41VzwHII/AK?=
 =?us-ascii?Q?9diRTG9BnRo8aXXkyJT2GusggGsi9AYsmKTYOK3b8enj/PeG1gL9FwRVFwvE?=
 =?us-ascii?Q?gmyhNJFSnU6M0srnNfQX6rg39GbvpWwhkWbyvFC89+o+8Z2VtNbmZizUueMq?=
 =?us-ascii?Q?03tNVD/LE1iWpXLXJwfLvPYb80VTZ+Ynj1hwTvBytsL4o+QZmKfioXttAbC6?=
 =?us-ascii?Q?Aj0YenogmXmTumUg6fCb0U9hkSlDqCCKdP4FsYVtNN/9xRJDEXe3gmznCm6r?=
 =?us-ascii?Q?gd3593E2eqH51SG36czoGNbWRfeMuAkFMlDnUxxU0yUL12jlOXUnCgVzu0Yj?=
 =?us-ascii?Q?YQu7dMrwak5/YhX+zCrif9JIqMO/c2/0/8rnJO5K+O1qm0eSkNvyqDBsm/WZ?=
 =?us-ascii?Q?eXKxWzzWd6zz0BJCGwNnhNOrfcrPRsQ6yIvMuzF9CFiHRHiI5kiB7e7JO/kF?=
 =?us-ascii?Q?Y6dfCEU6M71ETmK+s/0mEd88nCKOh+dmQeOH+qM7MxwPmZPBqDUzuFbjLt5a?=
 =?us-ascii?Q?WxMDSYHx7s3lI/KpvY8z8WJyVI2kDYv1sXtYakvoMV+9EuUQPFdcM27iGoj/?=
 =?us-ascii?Q?2rqlauaNejJyOfHEINFC4Abx7iLJRb/l8j5HwSDuyfRTcXj96/d/QKal2UdA?=
 =?us-ascii?Q?cZuOK7ZMDuBtjMBC/4nEcthwvKD9/J2M8m2fKsu0fPNIu2j1/RfqZuqZ9isL?=
 =?us-ascii?Q?4oiBL2i0Z3IJF0UFDMmHXdTIYCTpGotiTzBWYZoHq17Dijotk0Nc+n6Knbk6?=
 =?us-ascii?Q?NETWp9uNL5ytx2ffognPt+6vza2LiIRoqpdbcghGNQFCz6HnhpWMJgyv8O45?=
 =?us-ascii?Q?5CDjY0OubElQ9rQRjKOu6I7r7WmSISVAlc+RTjpXXBCIO2jnJctOrLcQKC5n?=
 =?us-ascii?Q?lL3aVTlouN8q7CAfS9W0bPcC03yXDi8S943fvzRlhVmqJFc1wgTNOZVLRDpA?=
 =?us-ascii?Q?J942K5PASB+HcfIwykd5wmSs7Bz1ZzQUQmPq/TeowQBAQAso5Lde4SxUr4DA?=
 =?us-ascii?Q?J4hw6DlYcghdSkRRB6TrqPMf1QHRUPLZiBk8d+2BjEIsPC1Hm435dB+SZNCx?=
 =?us-ascii?Q?78kuIpOvR59IAgQF5UF44yijn+7Tx37BukQ3IaH7/v9S0kQtOwEr/DQGooY3?=
 =?us-ascii?Q?AajLLf6cbyKE6socPhIouf4y2IuJzgXkKD7VhXhU/ggoJ5tM8ZpIEAkhPnP/?=
 =?us-ascii?Q?WeYOOm331SEr95sokjHPS30sRpGvYdDw357h7zzGt/kBX/hB6d6v2Vi5u9oE?=
 =?us-ascii?Q?cnyHdgDcEifjenr2J7Ehxzg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8183e2d9-fac2-4a88-099d-08de01315d68
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:27:47.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uk9hcvRpS8dU7wC/YxT4bJXEMq18PopkRWyIXXhIDZtz/hXiSVuynlauLZVCkZbVuZOPObw7B7OjoEI7gEzafVCK2G/eV9ZVn8MpSFGFuKTkq+SqYnMb1vmrfDuVaTCP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 (RZ/G3E)
SoC and enables it on the RZ/G3E SMARC II board.
The RZ/G3E USB2.0 IP is identical to that used in the RZ/V2H (R9A09G057),
so the existing support has been extended accordingly.

The series applies on top of [1] and [2] and includes driver cleanups,
VBUS/OTG handling fixes, regulator improvements, clock/reset additions,
and device tree updates for RZ/G3E, RZ/V2H, and RZ/V2N SoCs and boards.

Thanks & Regards,
Tommaso

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1001788
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1006104

Tommaso Merciai (18):
  phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
  phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
  reset: rzv2h-usb2phy: Simplify pm_runtime driver handling
  reset: rzv2h-usb2phy: Set VBENCTL register for OTG mode
  dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
  phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
  regulator: devres: Disable exclusive regulator before releasing
  dt-bindings: clock: renesas,r9a09g047-cpg: Add USB2 PHY core clocks
  clk: renesas: r9a09g047: Add clock and reset entries for USB2
  dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
  dt-bindings: reset: Document RZ/G3E USB2PHY reset
  arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator
    node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS
    support
  arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator
    node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS
    support
  arm64: dts: renesas: r9a09g047: Add USB2.0 support
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |  10 +-
 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   4 +-
 .../bindings/usb/renesas,usbhs.yaml           |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 122 +++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 +++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   6 +
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   5 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   6 +
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   5 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  23 ++
 drivers/clk/renesas/r9a09g047-cpg.c           |  18 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 199 +++++++++++++-----
 drivers/regulator/devres.c                    |   8 +-
 drivers/reset/reset-rzv2h-usb2phy.c           | 105 ++++++---
 .../dt-bindings/clock/renesas,r9a09g047-cpg.h |   2 +
 15 files changed, 478 insertions(+), 85 deletions(-)

-- 
2.43.0



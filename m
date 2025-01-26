Return-Path: <linux-renesas-soc+bounces-12525-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0945A1CD8A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 19:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312CB3A767F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 18:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28A48632B;
	Sun, 26 Jan 2025 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nesKgdCo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ABE78F39;
	Sun, 26 Jan 2025 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737917905; cv=fail; b=GLh4QsS/XAhY9wadm1VGPiQl4BPBPi5YcvxyCIRKerzYtByxm9kmHg+/P05a68wcnZqI5ms9lyGzqVwrUFx3QzwcMWRg1pH99SwMOvjAxDNdC5tEW8BZ+BuMUlfFujJM6AfwpzL8w5h/6giY5oP68YhlG8kyZf4A3X5yOVLpurs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737917905; c=relaxed/simple;
	bh=s5elpEoyY2OrU+Tc1UqUgHroCg75bWp1FL7Xm0Q1PBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ao8d8EjoFe3ZyLFScRmoD95pIUjgZAsmuqBTROpVaR1DLpPblbyRIQ9SspOrj6tYL1pm4pxcq7cJxdOX3/iQJs/LRXVrMU+fzRuceLvwIYbSXDMWHLZRt6HIF0F25a3TacltfSXEsAFlnbv8PgcMyQudfie0j7FvsYkJxbMi3PQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nesKgdCo; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQ2bUBXSEcEdaXiDfEtSUwv7chuPBSoyf2IZ2oh8gKjtmjTmDPmyo0uP/YgunuUPOUGjIbR9Q6orlfuOGhgmnRdQUI49XBfzO3qkrao9BFHv2hKt/s6BYF28oer8ykuk8daAb8btAgDwVe3Y8JIKs2pxY4tryZRAyKkSWn1dkDxwJ7EixBQ7FgFvHutEKXTi+u1KfHdIAMz3Peq/JHiI8Uh+MOiMXzeQo4IObgojDcRCOGLjFhkGsGpwDCr9KRaEOCztyvsq+tncDQxt6pnWucLMW1lpadowIs5I06PE5n8hZA2Nq3N18Xj40WYjOcrvDl/zSMxc6Gt+2DMJHDss0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PviBI3dg1NihXI8Rcd8tFRprOkd09lNx42hUS3gpv/o=;
 b=IJzs9ccNkygleZWYf/AFXg1NrokMVUuofS7Qcsk1HQruqmeJmzZkYA83FfLMh4ayQAiLg+mJiqTPs886Rgiv2Aiw7jh90T/I2XC9G9YFnr6b21zCnQwlMiljuQO000mbKvxo5kPa8DbyK7D78m4IOvKHjPnSixSzE5yJXLz67VBU60zoC3dlm2fDiTUDwryJZIxmdP28gR+PS+8XrNqWMqfwGoOJ29yF4WIDZGVrDX7J6vMK1oHppo0KIzXVgUOd3d4JxXu6DAok+BjFh82pwsC5CTqc/hrysa1YaOjRCHzYgJSeiWAD6iPl8LS+o0noLn5noviCTYqrTWPcNX6p1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PviBI3dg1NihXI8Rcd8tFRprOkd09lNx42hUS3gpv/o=;
 b=nesKgdCoPkSbZq992IqmUoFzbIIAxWSQzP5pxLSsTiLuO8v80aMKMN+e/uOsUWBXe7nMh4vRP3mxxkLInkBZ6zoWL7S0GyywxzoWP/NRWsACJYJLZVAJ6qH+G9/JdAG2xvtnjun3uXWco3xv1Sj1mlSZTWH6VXmNcAa46sCmAL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB12308.jpnprd01.prod.outlook.com (2603:1096:604:2e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Sun, 26 Jan
 2025 18:58:16 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8377.021; Sun, 26 Jan 2025
 18:58:07 +0000
Date: Sun, 26 Jan 2025 19:57:47 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E
 support
Message-ID: <Z5aFq11W/Qgz3Qp9@tom-desktop>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126134616.37334-2-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::9) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB12308:EE_
X-MS-Office365-Filtering-Correlation-Id: c4aa8bd2-2fb9-4ece-5967-08dd3e3b5f02
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6rs1XhTDIupybOI6eZz+wsAdkQ6tDE46KtgfzcB9ZQqucyx7bH5XiKxspltq?=
 =?us-ascii?Q?zPCoLClhZKVHNm2FMSFZRzUxTViedTEhGyWve8xJf/0hSTVGCVMB3s12UiKa?=
 =?us-ascii?Q?8gUVncgKHLdl9CjIrDj3/tuPbN7luJBFCxmmuUMJsZSCODb0NPdomW4g8ZsF?=
 =?us-ascii?Q?FxO+9wPUsNco9IJ6mDkVdasojlJHFvcRIa8ReL0ViOp/9M+UajbJfswtOfME?=
 =?us-ascii?Q?hsTrlvg8v1F5+9xBeOaLnhqhqr0af7tIfLm2f2sOh47vh6cIm0gmaXA70SKB?=
 =?us-ascii?Q?8Q7aPvkZg+cltuuWDS+YPM+Zi+aUP8vRGPWPTxMPvyO7VZnSTf9VAaBeLpWw?=
 =?us-ascii?Q?3O8BMQsYcFH3L13ijaHqyHrnlf0bFqQkeal7Gn04H4aMIq19OYBkRFqTNk49?=
 =?us-ascii?Q?y1QDwCkiMWhR2HO6h+9sAKOYgSG+QlpxQ7dasoGSQylrlbT+GXA27rQ9XgBF?=
 =?us-ascii?Q?q5jP/fAj3Uod0lYditHCxG0/p8+SSM4KWyAZBjirdzxBse8UQcSUTkYVywX7?=
 =?us-ascii?Q?wJHobnchrcRObTeu/gF4pfVy6420Np+jfsMgGXKWEkwWfcSCHJuiSR4OSzQo?=
 =?us-ascii?Q?enblcN4oo4A6lkX3XMg0s/NZo+asbB7pMYr08SAIfe+MQSZCbPc2WCKTeAuN?=
 =?us-ascii?Q?d+8xRXYrvD2owFsooefcJSn11Y1od9iWDTCOSPbxFMCfHvZ9L8Xz+bK26SNX?=
 =?us-ascii?Q?TUMExRDNK9RGNgmaVXlGuzF/aMp6wFh7IzYmLWSF/2jW28tVTS4qLmEo0g7n?=
 =?us-ascii?Q?EzVVPBvEWGCYRqkv5Zt2nCGP+AWezEaj1PN+GwMDkoGkOxEBbufjgtynWYXK?=
 =?us-ascii?Q?676b8XD8fQoGVfDxUCPkWbtiyUm1Ni86vu+3AJQ36NdS8+4ERlncot6b+9yO?=
 =?us-ascii?Q?GVik76s5ePKPE5d/kvP49k+IVOyU/svcngaIqP8FqMyMk0AgGa4UrIP2521U?=
 =?us-ascii?Q?uS2j3i7j+pcCP7ukU6qvVVFyQvaRZ8pwAZ+BdWTv6B17K/ab6jZgiuvmr516?=
 =?us-ascii?Q?Cvs2xAxA8z5QVAamnncRx0SbLTQiMFE9j7WFJtB46mYBE1NxwByVt/NgKund?=
 =?us-ascii?Q?9hWsL1ur2by3tH2tiffXln/ughQwShfBjs2P3lSHvBK9KZA6M4J327FJq+/Y?=
 =?us-ascii?Q?ygJdTYUahq3LYeUkf4zNtKH3IQ4zx4BE6XHJX+uRMMNUxHQAQXed+h+2MGip?=
 =?us-ascii?Q?Xn1A4JgHZAG+bnhpVE/VcUI3q9j7YaeF+P0GoFEtENRV9GEWi0J+ytAKl2pS?=
 =?us-ascii?Q?SL2coxIoqHHjIip9pqb3mLryQU8xnI0TA8h8NwLB/OGg4Kzw+AR+xquYNHS4?=
 =?us-ascii?Q?l/nwGpFVU4pEsUjGQBUL4oKnj9IVYlsF4/3f+f57QV/Gs2sDnDYUsuClbs36?=
 =?us-ascii?Q?0KhazJur+3E7mU7Cq74GixQDJQxxeKA+O4JUx4fA1JqXUlavEiCqFuMigMNl?=
 =?us-ascii?Q?pfez/6mWBNktOvkzQlg1iTWfOdSMdlkU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g4yF+tXhL+xVpsYuDZVTlnL1iYUJY3gT8qJU947WVhK48sSii6hMygq10kab?=
 =?us-ascii?Q?yzcEAFrOpHn1pkBRkKpSm+b6O1BFqZnr9RkdAojhPBNF7fdSUP+daJFHU8aZ?=
 =?us-ascii?Q?CgwSFZlbKquAw3RrTUC3MTJMMHm7yFVzHjjSbS5Q3y4ZdPSrC+ezRHN1Nu2A?=
 =?us-ascii?Q?Z00uAdxLg5OBP18gDQVLmNK2Y9ntY2BZTsSZ6FtZ/4d4aKR8wfZJlEes0cRj?=
 =?us-ascii?Q?QcgQkQR9aKywvxfeIRYXNNLNOF8mb6bXdF+6Mru3z+5TfsJn3qHJWYrH3gcz?=
 =?us-ascii?Q?22ui14FkLC49mmgs7PhZQkEJWqTRP1Ysg41Xrzhfahcvpkz84p9MiAiTygBN?=
 =?us-ascii?Q?NKnJBLzpMyi180x0T+NSZDYF5Xtx2Ovdrcz7EGts8zOrq/o8s4wY7EMV6fcb?=
 =?us-ascii?Q?XvmGyMrnVCHp6Z98Gjk/7XBUit3kxmC2PzeACECN+XTvcUgYwolQ1MjbAw/G?=
 =?us-ascii?Q?3hpzb6cZ78ojijhaph5Nc2eCIDtvJl8g/wR39aWyVu9AdwCImZeuJQpiHm/H?=
 =?us-ascii?Q?NfX6uc7momdfpyyddo0vaJOqYcG1uw+JCyxXTSrR2e0+Kibay7HdSDibjLYc?=
 =?us-ascii?Q?ekDNDcsHr+Gj2jaZKy0ZBPzt9RJnSFyc7yKZRr6BM3KV61lBFhAFyF5A9/Iv?=
 =?us-ascii?Q?aWv7pboMm7vMis04zEWJF0V59xxmrI0gr9emGWg+z0N8fBXz7EOiSm5iprgX?=
 =?us-ascii?Q?3gG4/AN3QSrh/eCyEG0e421O4nhZSTd6m9uxtwwtXhFe5+CRlRV9437X59+F?=
 =?us-ascii?Q?ABTZjkqlWKiopXVnp3blVAV/q+sj7A7d25cDuz4dGrpiB/k0jABNaNK+oHZk?=
 =?us-ascii?Q?C2UwYw5OTpOFD2EF7wei8xkDBGJni4+AG8/JFqCPpFnX8VeGJ1a1nglaEV9v?=
 =?us-ascii?Q?sYi/AmFIB23KsIfLrDOmAJa818V7ZEZYAw3MkQWF4OVM2J1AMLW1T8Izw2HN?=
 =?us-ascii?Q?DOHv/OV0o9A5QUMlq130gBdYclg3Rt/o93JYVyO8tJtEkA9db72XQTckdkB6?=
 =?us-ascii?Q?0GwQZy5rbqQnbQFEo+1vVZLD29BYWxwpeuAcvBI8q8hO/LlIJg/qxhiRw19l?=
 =?us-ascii?Q?xCdkebNEmFie6mNWU1nrhJqGOk1okQZFnDpLMSsElEBaS2V/45xgJvKomN/M?=
 =?us-ascii?Q?lTpKIsiRgg12/L0ojKyYlTPIRKGzaR9L8qkXAWnJci47Wz34lGC8zvMHssoI?=
 =?us-ascii?Q?fHnpF7CcavhlT0EBfnqzyfKBZGTd2IoGpQE53npGGivteJKJEHPeiiorI0/b?=
 =?us-ascii?Q?J9JTI0l6QWx3L89KQWX1BYnqYvarnWhgWcrUzOxs3svvB+Z4+7lQMRqfCm/2?=
 =?us-ascii?Q?b1WsnMPtmvddgR5ZnXhZkwvXtA/h1rF8vJdKEAWo+rgPM+9TnlstYMTOYymg?=
 =?us-ascii?Q?avuqji7O5fi04581gUT8gkAXkL5bSgfefTNdR7Fm3YQ2fty9eIk6yGaW8PWN?=
 =?us-ascii?Q?4Rj56LdEoENSb1bmbQagIkbt9kgY/EL8LfE3UnEEGuRt6CAcZoGCxTR3ZB4M?=
 =?us-ascii?Q?WHe6Q4s32/z/XNZIPXNFrP4xm1GV4dALQv8+gIsz6ytOhEjcnAMnlNS35DWe?=
 =?us-ascii?Q?TZngl5VYFxglsrBTlPeJoMmcp8QTnYKtjvJ4mjn+DyMo4KX0IaCMF4ELFkcD?=
 =?us-ascii?Q?JwdQXmBSyLkEZ7GE7IX4rIo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4aa8bd2-2fb9-4ece-5967-08dd3e3b5f02
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2025 18:58:07.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REEdthrWFEGfbbS7oKHaunWGmS29aNZXZ0rgMp37kgoPN+98R4dk8+agiZ5OVYoMiVCb02l/L8Hws5evwjqvMckEh+U7eef3x7GQlozircpg2iS9D0uW5Miy7Vws8eRY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12308

Hi Biju,

Thanks for the patch.

On Sun, Jan 26, 2025 at 01:46:03PM +0000, Biju Das wrote:
> The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
> of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
> use SD_STATUS register to control voltage and power enable (internal
> regulator).
> 
> For SD1 and SD2 channel we can either use gpio regulator or internal
> regulator (using SD_STATUS register) for voltage switching.
> 
> Document RZ/G3E SDHI IP support.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index af378b9ff3f4..ef3acf0f58e0 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -68,6 +68,9 @@ properties:
>                - renesas,sdhi-r9a08g045 # RZ/G3S
>                - renesas,sdhi-r9a09g011 # RZ/V2M
>            - const: renesas,rzg2l-sdhi
> +      - items:
> +          - const: renesas,sdhi-r9a09g047 # RZ/G3E
> +          - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
>  
>    reg:
>      maxItems: 1
> @@ -124,6 +127,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - renesas,sdhi-r9a09g047
>                - renesas,sdhi-r9a09g057
>                - renesas,rzg2l-sdhi
>      then:
> @@ -211,6 +215,22 @@ allOf:
>          sectioned off to be run by a separate second clock source to allow
>          the main core clock to be turned off to save power.
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a09g047
> +    then:
> +      properties:
> +        vqmmc-regulator:
> +          type: object
> +          description: VQMMC SD regulator
> +          $ref: /schemas/regulator/regulator.yaml#
> +          unevaluatedProperties: false
> +
> +      required:
> +        - vqmmc-regulator
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.43.0
> 

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>


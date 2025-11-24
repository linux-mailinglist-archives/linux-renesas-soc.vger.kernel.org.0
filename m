Return-Path: <linux-renesas-soc+bounces-25049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B1DC7F71E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 09:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CE271347777
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 08:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871E22F25FB;
	Mon, 24 Nov 2025 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HiVrMarc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FE2F25E2;
	Mon, 24 Nov 2025 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763974689; cv=fail; b=uvNJSBe0c3h+gK4g45Ho/aJBg105SecfV2ImzKImGimfngwZYhdF/I9cuk6flwDLJ1+V4PZrawqFwLN/5tDxFPN6AwmcR7r9Vo8eEWnIOs4UaelHIrN3h6NCuY14/tgGt7WRiO1BF4UkhM+ddVNJbzjCc7as6RO2d/5WmXYaGO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763974689; c=relaxed/simple;
	bh=Hg36jZ85RdcdLUnFtfTNe0UC+vGoby81kOu11tpcd1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J/PNGX4cjSJxmtva7vIBH9rY8kw2+f6j6wzOifhLf00mt2sW3GwZimUq0YcxMTOr8ycSdhPoMp1Yhc6iYSbjBiHRCC7exgHJdg/9MpmCP33E3Sz+wQ7hqTsHtXBaw8D57wq6OT06sfW1ZV7JzLdiEMSbW982xOabZ4CfN4cvGN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HiVrMarc; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pn9G9IIbmxgvgaR6OVWYYICo4dynr08xoVwuxpet72dH0yRCioZdRAxKMdrENxQ62MbXO+RX/jMONegGmYhKOChGmceK7wxIiQmgg2pnrey+EtQ40dSdHk8+7BI5JySkl9GsyiR5yJXK+W3Lk8n5t2nUVwKxwomVxxwLoXaatLpk8uAjyPx+MfVkbVZRlryjzZoWyO1iWtj9l6iUWZHPBVBA6jYCqm6ztzr1DWScmjyRR/N6bZJoulhxErnbx3/4cl08YccMCd8XcKbP9xAP4hqAvfeRzvvZv6Z1uI/bGYTHU0ACsngLbhaBROL4qbUvB24uL2vzhn1+FuD05SN18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K06fVmgxiMYulFeTaANbCcJ+yRJJBgLGQON3ambDzkg=;
 b=dd6IVndfNQBCsJ76tKw5UtiT4p4J0OZ6jWQRjmoqf8M+FsvTLhKQlP1wuRpJ0CN0n8fvU8IU+PnsbWqjuZX2+DK6PhCeqILfTCPrG5XGXtUgnLbaVYZRxsCRnhSrkkvYwe2k5I/2WMLvCQpZK/Rjy7Kn+sRNTcB7VifwGDOndR8CTY1xZ0tl/lvsJQECnOkLe9tn/9B5nq/MuOghUHeomJfUXyQs8PanOubPWp13Zl58BxBLZl2T1Em0Dojmj+MVvC7AxlevEzfOS53VBeSFQ9n+M9MzXwel7lPgjrVAu3It1oZeF3uBDw3+MXCOgomiejq2VfCl8q41TRWCiSEx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K06fVmgxiMYulFeTaANbCcJ+yRJJBgLGQON3ambDzkg=;
 b=HiVrMarc6K2CiBRBIrQbg7E9peYNOoT6FQhRHA3MUguLODnyC19ormP8Uxt0EegeUqoCgYHSKxZHZ2KAzXA0C6GaQyvzKEQ+JTlRtJojYC9CT4Pz6E27EpQtN4z/7A+TIe7iMWlHwvqkBkLBMTaettW+OvD02z10d3hHEPpD008=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6558.jpnprd01.prod.outlook.com (2603:1096:400:ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.9; Mon, 24 Nov
 2025 08:58:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Mon, 24 Nov 2025
 08:58:03 +0000
Date: Mon, 24 Nov 2025 09:57:49 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 01/22] dt-bindings: mux: Remove nodename pattern
 constraints
Message-ID: <aSQeDSJqDjK42-y4@tom-desktop>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
 <cb7c28ccf3a1b136e793b48720f816de7d5f75b2.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
 <20251121-spring-slot-ec9fb6887565@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-spring-slot-ec9fb6887565@spud>
X-ClientProxiedBy: FR2P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 726c1cfc-0941-44e1-b4d6-08de2b379392
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FEcgxb0d0QMkdZ/a0GhfaQmWa8Nll4hkoDSZrPX6yECkhLR8gskHYWqdgC7T?=
 =?us-ascii?Q?q9nKMZvEnKkXFKZolgQ/DK64HsShHEREzru+ffgvxF4qqZsDMrdJl/T3l7J6?=
 =?us-ascii?Q?cVg04gzAMLAbCoDwpOKVhaV6Ay6undNRUghR5LV5FCPN/QP3uMXnW6vYM/Ra?=
 =?us-ascii?Q?5EoSphFLSgJNqmA5xNftt2I0BxncgA2iB6pbSCASTO6Uv6AaDFsxo1JPVvJP?=
 =?us-ascii?Q?2oiKjY4d5pU4TtKITI4avEebvVa53sRydDCKNV8Oawyl8pLx1aVFOKqys8tn?=
 =?us-ascii?Q?e2PO+s5JFEGavzO8UV0LOSEIUex0LyIDHJcKlUfk7+26PxafTc55Jfm/KwYi?=
 =?us-ascii?Q?WJLmiaIQ3eAZudnQxNz+3v0dr9ceUMkTcLUxKzDDRKWxpn38QMW9wdrZ3CWc?=
 =?us-ascii?Q?R9OaxwQPbYDWViEqDNdE/07gnsfUrUxA7rj9WKS499TU+O/ia2QLQNk+azQU?=
 =?us-ascii?Q?u9jOA0kt3q+uZFL/oBeiJO6aPHegP9mHfV/tmkRm0yu5vHBXKCDbE9zyIdRL?=
 =?us-ascii?Q?3m4NugsoTQHx8l1UFEtdh+K3CaFDug1BVMFu3n9eG4nR7mptuFGM+nJtpgv/?=
 =?us-ascii?Q?CD0Dh5kLDzDasSPBI+vTO8Ae6DYpGzb3YNG35h9DNz7V5QXEYhHxJQvBCw01?=
 =?us-ascii?Q?m9+WhJdegL82JDTHFmf/uLAZBy+8KtNE7p9+pVQzhMx9aBvNxcV0NdAySK/6?=
 =?us-ascii?Q?Ou4hO5uHnzIvsXVM9w5zC1HV7f/kxqq+CE+12F5Dmt6JWYJ3S+KV0FcZG9uS?=
 =?us-ascii?Q?m0wxzgfsCpLn4ZXF9pFy06xXocNbqiGP0toyYdSL/wCbCQZdw/lxQbh4Q8/V?=
 =?us-ascii?Q?0axQM007gzy6hn+vcLUyhHY414ajAv85+BeDAaBYuIgryvot+A/aGxmOwZPZ?=
 =?us-ascii?Q?dJHtax2h+duZZuPxmaOGoIKAK7UiwA6h64CMoPDmdVOZQJGYHl2KvAGs5HTX?=
 =?us-ascii?Q?co23Wuxv0r4K0Kr2ceeaH7QP23EEIfe/zzM9bFnWT7Al4pDxgKZHC/8TL3Pu?=
 =?us-ascii?Q?JqRyKgvIWwmRG0HL2e1LVwYBgIOgdjTjbvj3sjM6h4LAEQHH3HQgW328/qbK?=
 =?us-ascii?Q?23EFve8fSCXWaSK5dpGgr38BgvZEnK6hd0xBmJRpwLCqfj8/lOlfjhAy2wCK?=
 =?us-ascii?Q?ilroXNcF9C5BJt/luUprBo6n1kDwysmmcOXAON7wQ5B4vPUPHKuEcSHIqdZJ?=
 =?us-ascii?Q?esfszb0v0kv4tDPYevkoPcwzGTR8voCT7cAsdyGsTpGDZ5Q7+PIZojYIp44z?=
 =?us-ascii?Q?EYzAhBwuB/k4p7xZUwMHi5zMnrYIo/7jwm3zi73i3pN9Tpgm/obZWuKaDkbY?=
 =?us-ascii?Q?TydvrBmW3I5B/MbIid+rY+BgdMpObZMXNegnFTxuvodTOK85ide8WkrZPDh1?=
 =?us-ascii?Q?BJW+lNUkeO80BCT7+IcoiLTtfAff84bBCoQ5afRWk9gj9TYmVYFrxmGS3lV7?=
 =?us-ascii?Q?p/64u/8u9bVjVgIULklGRJz3nXCDIw8hfxzIFb7fra9iJltuvih7KAC73M+s?=
 =?us-ascii?Q?dNG/HeMn4WFWo3aUg9aON8veLuJoTZ2ktSw7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TQJJFAWduw6r8hyvVX9PcQVK3vrNm8Wf7Jhk/ojt5cdVr+IMAyoF7aBmOydr?=
 =?us-ascii?Q?X0HaT8XCHvDu9xOz0o+ZTRsxCebb9AFAvVhXrtz2JRLtxbWIug3rh3ic5f+R?=
 =?us-ascii?Q?SNNiQLzBzXyi5658cLhu7fASYeIwaOsIGysBExNKw8HLAS8rtQrS7Ot9vbik?=
 =?us-ascii?Q?3kpe4/N56OhkRh0ho94SGTd/qlFhzbR8llxxtA7iKPwVVXmeLvQIlLnhrFba?=
 =?us-ascii?Q?8Lo8y6ovl7FCfjp3g7WfhAJCVsPNilbKBGVc29rpfSmkE5ywBbiSmeeKQClA?=
 =?us-ascii?Q?TLZzyyDvk1Eo7BnlwihLzWEIrQiQeRq5JOYqseqheJlyY110C8RB1Qx0XkMI?=
 =?us-ascii?Q?W22FCnUzXbzT1QFCbhGV9pq1gkGhnBNNKwHrVSbBnNN005FqOkDgaTb5na5G?=
 =?us-ascii?Q?CAnv6eOi56G8wK+G9R/ojbrbJpU/tmc1C4Cj1h3qc50qbS1QMsY5BxJFC0t6?=
 =?us-ascii?Q?yCx8gNK5SARJmeSJ3VD+XhYXEh2ew+LdLR+dX4TDENjteZZ5REYngmvJfUG3?=
 =?us-ascii?Q?kDy3lgcSVXUi762mSsnoHvPuA8YF7RaABlVuPxmy/x3jD6rG2hAEg8oUwEEJ?=
 =?us-ascii?Q?TJ62AHUchpnPrSXiJHW+BZDpcpfBOnvJ/Q4JBEX2IbHFAN/X1RwtumdTEUxr?=
 =?us-ascii?Q?d2MsIlWLip7ZLj2oPhb0t7q1zzRbDD4Ne2dIvQ90lVivR9JcsW6G+QHy9yX+?=
 =?us-ascii?Q?5Fm3+dOsXrXGixGWejx/oaX1HlwxbvrBg2Le2OX2khl7jKs4zLYggbloVZ8V?=
 =?us-ascii?Q?IEP1y2/PDUjTyDa7aDW0w8rPFaHtZsROvw9fWPa734pnqPJoQNJELry6ppHP?=
 =?us-ascii?Q?jKQTmjNmhbkFjMTKgQgMhBCRY8idzEQlYfeco93BAv9rnp1EKsGypqPglV7P?=
 =?us-ascii?Q?1J6CMdFuQxlZhWYBsDuIYZhGv/eZEyZvFaZQ2PbpkYbLi9eTLw8FzhY3X2KA?=
 =?us-ascii?Q?aKdAPe1cZPBiScCccSoejU3Uh9Q26FpPCxxoUO7eNF8SPxMO+jz40DYe7e9k?=
 =?us-ascii?Q?cr8CsIftzCtglR6KW2xKjuPgnbNmMt/fgjqyun44fu9OIrgWoDCca+7r9y7V?=
 =?us-ascii?Q?iQsZgcQPQU2AphbcCYMOeruM5rgfKALHQExo14yEl5+FVQJMUFcrDSUgU97U?=
 =?us-ascii?Q?vX0LtW8JF0mMQxEAlRuIZUaPjbD3+O5fX+DlHqMqwgtDsal2gZ4ef7x5j8V8?=
 =?us-ascii?Q?aCxSzBo2yknYDCVf3HiKcPb86A0vTWC65wa9Vs1B8n/uVpthvmPPYlE+Agor?=
 =?us-ascii?Q?c6E3nKZsmMedidzOu482xDrMVi2fcsdtnSuhGJIotixSW8pSpg5zeosC5l0B?=
 =?us-ascii?Q?G+vvlNeGaNx87ImN7L1jKT3LlTqdqLp+ZmM18lXjNeraF5NmJMJmVYgeHfFk?=
 =?us-ascii?Q?y9n4lpbR0YYDBWEC9uYWyQ5+cnVT3zz1gBBGeDwUAORBK6wdf1rV0XMeobDA?=
 =?us-ascii?Q?RiuTplQ/gyO3QaipnsERoxLooNt4w1mAS5nm3l8S47F7X3jR56URJyQzwV+q?=
 =?us-ascii?Q?snSuIWXDm4vnKIe6Dzrr5Rof6gnYsAfgV1mVnOFk9NAkOHeh+Onl/RE6MT5Z?=
 =?us-ascii?Q?lOayRDOjot0LbTXYP0g9h9YPdEey72GLtbErzSr25w0J0WeERmSE1OyIA3Cl?=
 =?us-ascii?Q?3nW6CEZiyAbgERB2+F94jRU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726c1cfc-0941-44e1-b4d6-08de2b379392
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 08:58:03.5383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNttD1jaYWGhPm3K9hjvRzf4FeGayCZANjisAlj4PswYKNTMZH4Hj7jwSfq8Utq/6ddDIgL5SAHY9PYQYTyF80LrqMppyYJAoXF76jbTF1+dbOFCWnEkFmS1AKW0ODml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6558

Hi Conor,
Thank you for your review!

On Fri, Nov 21, 2025 at 06:24:03PM +0000, Conor Dooley wrote:
> On Fri, Nov 21, 2025 at 04:11:50PM +0100, Tommaso Merciai wrote:
> > The nodename pattern in  created an unnecessary restriction that forced
> > all mux nodes to be named with the 'mux-controller' prefix.
> > This prevented valid use cases where mux functionality is part of other
> > hardware blocks that should use more specific naming conventions.
> > 
> > Remove the $nodename pattern constraints from both the 'select' keyword
> > and the properties section of the mux-controller schema.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Funnily enough, there's another patch that I saw today that hit this
> same thing:
> https://lore.kernel.org/all/176373269741.263545.10849918874919174841.robh@kernel.org/

:)

> 
> > ---
> > v3->v4:
> >  - New patch.
> > 
> >  Documentation/devicetree/bindings/mux/mux-controller.yaml | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mux/mux-controller.yaml b/Documentation/devicetree/bindings/mux/mux-controller.yaml
> > index 78340bbe4df6..6defb9da10f7 100644
> > --- a/Documentation/devicetree/bindings/mux/mux-controller.yaml
> > +++ b/Documentation/devicetree/bindings/mux/mux-controller.yaml
> > @@ -63,18 +63,12 @@ description: |
> >  
> >  select:
> >    anyOf:
> > -    - properties:
> > -        $nodename:
> > -          pattern: '^mux-controller'
> >      - required:
> >          - '#mux-control-cells'
> >      - required:
> >          - '#mux-state-cells'
> >  
> 
> >  properties:
> > -  $nodename:
> > -    pattern: '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> 
> I need to apologise, I told you to delete the wrong thing in my DM
> earlier. Only deleting this part was actually required, deleting the
> select portion doesn't really do anything for your problem.
> What you've done is probably fine though, since anything actually acting
> as a mux-controller will have the cells properties.

No worries! :)
Thank you for your review/hint!

> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
> 
> > -
> >    '#mux-control-cells':
> >      enum: [ 0, 1 ]
> >  
> > -- 
> > 2.43.0
> > 

Thanks & Regards,
Tommaso




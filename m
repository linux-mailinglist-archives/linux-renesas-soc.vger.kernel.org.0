Return-Path: <linux-renesas-soc+bounces-24335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ACEC41024
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 18:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B1C1891E68
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 17:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AFE2BE658;
	Fri,  7 Nov 2025 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Gj2HM1Fr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047D2261581;
	Fri,  7 Nov 2025 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762535968; cv=fail; b=das2Z6rRwoXkOJAPddYWcwC/znJf23tG4q2f3+vY0g8KZdC8riIc7ZcWcIACN02P9t9bqZ5HbGAqdTtXhZxy/gZ6yqLMSSbfomVjA3+HXzAADlv0x3Y3Qk5J+8WiV15Np0YzHSRWLWKnu5ay+l8Iwph4OpzuSKA6j8FdfJbS+p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762535968; c=relaxed/simple;
	bh=31ozhILpejwflkWDS0XN2ja+rK1UkFA33T6Fb3xKqEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dwa4vYE4VAoAqLZgKg9nPWSpqnpegKlt27etY1i4yiNBvyfQveoM5Sj1ZyFeAAORc61yUPkvL7r/7NlhFABEL9741ISXyKwJFvLJ1A1rK53RpNJOZzrPN0jgBYPdy75HkVztoExdX7qSXlZ1/B/Z3WzGXgjVkVJNZY2CkaxJ95s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Gj2HM1Fr; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+7xN5waqRYWpkPjO9tL/DNEcPJFwoa7TcVILrepv279FBd4nlg2J04cgacKT5exEEufAez5YenpzZnjGNiZ/pJitAJEwAM2wmA9hJSX1P1sbzkw0vgbchCbvzBYn2hXv9zf7xzqtPrlSUaJ4OEXM9m7F7TVNKq5MMW0LIupo3+J22nIgL9Z/fu6qAq78kugb4tPastTRh2gNFV23qv1uCOncU6B61Ky5rFMH9Vleu44ptt6PJOBWgA+kz0Ekpb6C5zCxrgNe4J31ZnqM5H1TFagXBIVXSpK4SCMQFMr+32CHaEW4wxXN82UyQRZqvSK8kdjYhSBNDRIbSYklIfGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYg2Sho4TeRs85pMUl/NAPub9THw+uEAe6tDijaQZ10=;
 b=o/KgLRrvH8TuE0RUi/iOUyra5nxDgi+zFv4X26HtjMiB91+IIau2ZAzihhzQnlnucNXRWx/7XLlfm6YP4kubD29NfK4XcFRqYpRDLzmIZ46r0mjVwSKSrcGtXD8RczHCNJeCDrS2X4+yGQ09rhGS2/oy7xioRk7+5+GbYfo5d4M0HDAsN9uVkaJnAYEI3uZj0VEv/jx3cXA4/c8j/aaZgXKbdA9lDi7Q2at+p9nZJiS8FVhEuX+7ktiqANGFY9Jc5MMINJmiKQoTbihqzE3vqXmEIdr2g+zO6VEzf1STAJYIhMeGMgev5SwskLXwSwLxUqBnuCXGGwFQ4giNKGzkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYg2Sho4TeRs85pMUl/NAPub9THw+uEAe6tDijaQZ10=;
 b=Gj2HM1FrBClJKDtUfZU2OhcD/12NuUtQI1dD1y96KOHnZK2v/MNzZw30UbwM3cqWqMJYfg13IOao6mvqp73al+H1pYtCV8P6TwpFxU8eznoPh10wZ3ZtuGCYDL3NtQtK72yl41ODm8+Qby2TFCismxdbFafPwhSelaUA8Qkzifs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OSRPR01MB11662.jpnprd01.prod.outlook.com (2603:1096:604:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.10; Fri, 7 Nov
 2025 17:19:20 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::1de5:890d:9c69:172%4]) with mapi id 15.20.9320.008; Fri, 7 Nov 2025
 17:19:14 +0000
Date: Fri, 7 Nov 2025 18:18:49 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	tomm.merciai@gmail.com, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy: Add
 '#mux-state-cells' property
Message-ID: <aQ4p-XS_8ImhRRKN@tom-desktop>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
 <961741af7d4ec945945164759fe0d78bb3cf4d9d.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
 <176236298431.1342996.14167666722083112438.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176236298431.1342996.14167666722083112438.robh@kernel.org>
X-ClientProxiedBy: FR4P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::16) To OS7PR01MB11955.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OSRPR01MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddc129e-59a9-46e9-f196-08de1e21c5df
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wit8OHFYwBptDlOO+/ljn1mXpRlVmlgrKrU9f1G3P6OgXIhguHuF+y7Yricb?=
 =?us-ascii?Q?cjZq3CWnRVAI/gj0cqndnyuL9j9Ahw3CVSrdpVm8LkNFwPQWcOYsvybbsaEA?=
 =?us-ascii?Q?SM+ChhRp6g7fuuvVfreb9jXtBv4TlOrL5fH38wJN63vXGEjJDyyPWT/zn0Rr?=
 =?us-ascii?Q?NOePoi6gt/VLgx6mZB540D+CrN5p+vQUKnU6Cr+yBAqcZsaJUyjO9/GDM7Zz?=
 =?us-ascii?Q?jDYJk2RFh0vt9yGRq/jtnQ+W2tRDGTXBu89WjOBpyRxqjDzaNOI4aHfRa1iX?=
 =?us-ascii?Q?XDjcUei2pLyq8BSLQ9iLi/8y9SeSLfCBPOIeM739HevJWQDxfHe+gqjcUWQy?=
 =?us-ascii?Q?yRCXZLxPCYrZZVVY1twhP9jY++pabwu+tZ6lHPLEDlZtsub8tiUBW/wtWuzM?=
 =?us-ascii?Q?mIk+MIfyOG+PCKZV1VxEeBn0ZnNkqo9zm19boytFgvxHkcidrQfPEeUx6g4o?=
 =?us-ascii?Q?UTe9hMueb+TBDNW5U/aUMyFHo/4uAwfTo6pO+kPDEq5ykspHA6EGpv9hFdvt?=
 =?us-ascii?Q?JT0mYL+GKQcnE0/DyrXFXc3+Zn+FlsxZcP1J8RLqjbbstXQDcQX5z4BT+nUD?=
 =?us-ascii?Q?g8ZIjaSQwgOzTtLYoJIS2D8ptjmMZTlv9OdS4zOqAQw5MPBVRGdVeRQHl7XG?=
 =?us-ascii?Q?gjRmYvu0MqeKU20ub0awCKyTQPsUue4jbcDzMOM51tdAW2N7Ey5QCDqHqIHt?=
 =?us-ascii?Q?QFKL7H1La2kND9gTqG+sdt96o33wJ9EV0+AhE10JxlddrgZMxok117pN5Vsj?=
 =?us-ascii?Q?enhynqzOe16+b8Arj7+aHxA92FIFsGhByjk9Q2Z3E/aLGpsQYo+L1ZVZlCIA?=
 =?us-ascii?Q?Bo4A8+7Zb1MSFeXk7JaTsIK2p6MQSApiLaOXAEC0yugFR7BrgE3SqaphsC9N?=
 =?us-ascii?Q?KYw/YjhIa/7mLFtTXiP6gUY2TLGvU6+3J/MG/mvrB8emIpyzPUd1ZSBXnE/P?=
 =?us-ascii?Q?7htYceMV2bqRGmxaF5dzeqshYorzNEhuJKQKfaWb7u7+m1KUT3sFoEjpfRJf?=
 =?us-ascii?Q?Wz9c97XheyucG5soE7Ijet4AoL1d4+gIybM2uZbsXqaKwQXqM7gYHed7gD3U?=
 =?us-ascii?Q?TV80dADsXOeuK2MaAclFzMNietm1As8UR2MSImO6esBsqaGbI9Emr2GK+IDS?=
 =?us-ascii?Q?6GZ7QmrvjYw6TOyQM1zB9eo4P1a9AS6xVYv8DEYWW8Lk4C9QVNnMV6A6e4p3?=
 =?us-ascii?Q?khol3et08N+2fnpze4m8lpU54tQD1qFps+m+BiHwacNdzMxqyho/Qca7hHaD?=
 =?us-ascii?Q?+zTexK8KNKbasfQCCE0/UsxeGv2uRdIuIAXS50OX5EGJyLWFz8UxMIML4IhK?=
 =?us-ascii?Q?DMESy7N/mKzQBzBDlQaxjlhz+DtLo6mY8sn51zG2AQdWjg00Mj0+12scszxJ?=
 =?us-ascii?Q?nbttgLiZ+YOSF0/oe6f9h8v/ObC0uw/2MyrZ7kcNRYXBleoba0gnlJ8WsPvY?=
 =?us-ascii?Q?1mVvV5O6BYQ3icm447i+RB2xRFW30yLADeqlXoALy4Y1VfySlTR9/w99ImYj?=
 =?us-ascii?Q?Ltnse8kDwm5JXjHYXU8lm1LR0jIHRRwkEWQF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zjWLMgFPPFHj8FRG+tH7me7LAlve3XRijzt+Vx8WWidKjsRXvh7T8WX2g/Ko?=
 =?us-ascii?Q?nk1ZlPJPw53faPcId44z6PE1I1rNqaw+qXY3+pkphavXy1zwzouIPRJZZrDE?=
 =?us-ascii?Q?EZcYoLWVayIamsY9Ka+CJ7MTd6hnGuusKLqakyylk1HZlIlvUCzeER9bi4Fd?=
 =?us-ascii?Q?0wl5lKVHTvtp5DVGHjF3tnOLJRBK1wm+j8GsCuDiBs6qdYmw+MbUxRS5IDFg?=
 =?us-ascii?Q?D1eOK6r+osyhX6nS2nvq0819hcOve4X/m/bxlQ/lik39NqgBb7Ly/AEZB0hF?=
 =?us-ascii?Q?DA+wo1uon0HTiKf9bXT0wJs29Axeq0d3JkLEP5YMZGGvgfSr8CHqo6KwFjzI?=
 =?us-ascii?Q?59Pic29gI9QS4NJGkOBSD7T+Er35DsbIuN/cioH6ZlWOqyxvshmtzofI5qMe?=
 =?us-ascii?Q?C9irzTR5aLN78mIaRPpYmOyF+CRA8ldFHzzfiSENer2IxVC7lYI8BS9rJRFG?=
 =?us-ascii?Q?FZJB+sDF1cZJ4HIptY4EdVt0oIiGYrfC9YXGzRcuXhUOKM+DSw5/zGqM91Ba?=
 =?us-ascii?Q?JC3LjaBfwzMPo8sPoZLGv7ldN4dHVgGOLi4QW1YZnngUzQPfPrifeL5q9VFS?=
 =?us-ascii?Q?cxggC+rmsElbdiZfrv3C9eGmKx6KxBlQjtKaoBTYLBnkW0+DfSJTXDp7VBxc?=
 =?us-ascii?Q?0G2QvCIEDQBxWxbgY/V8CMhFW5K7v8xCzqvlwPS+3D+W13b8lzm9oXakOq9p?=
 =?us-ascii?Q?2vJm1dtRUWNf8IazAOFQAMItVqsfTH3ZSQH18XkNRysCUYe84GCBW4h8sbOW?=
 =?us-ascii?Q?orC693I+OWKF6mWlkaTv4twdkYrZXLsuMmzGYIAomxYkcrFi4ZT+BQn/rypO?=
 =?us-ascii?Q?kuuWnEFYNEr69hRa5fZbPsVclPR39FhhWYaUqjaXfCDC94Ih5kvzNbfqS6e6?=
 =?us-ascii?Q?ysOS/eP6qzLmdoo/RfQLRZ09h/iCpbpShTCcwcC5kvltqn0FC/om+kGPAUPh?=
 =?us-ascii?Q?ESFII7TaxRNuAyGEM+sJHnofjY8SOAGjs2DH3PPEnbkc398IMO5v9ekcawOh?=
 =?us-ascii?Q?cCkKYy9NcMFu74109POhqaLfPlAUmzPCgEe2uOjB+lf8qfQZa9sxeBjnzW/i?=
 =?us-ascii?Q?IEgVQhmIe55PTFT8oaVBKH2ybloXOtPGpzYZ8fI4LLGOELndY2hmlWMdxCQF?=
 =?us-ascii?Q?pLm7dV0Q47xkizGzVbUiOq6Tj8KZQ3atf/tatWtjxCR4BL8Jy1C9l5GFTN9r?=
 =?us-ascii?Q?nfHrzOhQMAanvVlY556yDmff3SHhI7K15rts9P1EnhqwUWkxbyzttC6cur3K?=
 =?us-ascii?Q?XsM/MmgJ6BDb/PRuDEEcbXX/LUGH2QkeP+dJGdFmKbWCI3zpyfDT8hr+46TC?=
 =?us-ascii?Q?uLN9ODX54p6uhM/LWJChLEQsYOjw3O010Uq/rY2RKOiOFxdIKkThGlk2rTXE?=
 =?us-ascii?Q?cf3wunByTddk+tc1/EW7JckrKfdPmL77z1LAgUfzz9OKe+5zpxlLmC/B4oEo?=
 =?us-ascii?Q?s4azHVuLkP4DuN2NrNZuEMjv83Damdnf1Yx53s2d6+E4c090MLjhQLuX2fuc?=
 =?us-ascii?Q?xucX/aTX3hrAOk+HlObHCNKY7BI1d153RKRWDFdw09EgJgzQtJtegR5KSpjg?=
 =?us-ascii?Q?CHz71plqzq1ePpLSQxFe6bfsfZ847tkN/OTsAZrre6RSHi+2y3sSXsoHGT9s?=
 =?us-ascii?Q?gT6HoJp0tjB3bpHw/P3Wj7Q=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddc129e-59a9-46e9-f196-08de1e21c5df
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11955.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:19:14.2727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVOT0PgunIu4+43UmBcsXIRHBDvcT29H019cy4OvaOIksRBDSHQvJyxaIBaBIoqTC8z/Zleut9mlThahdyK0ypWB6uclp43WLLLF8t+tQNrWwq+Gw4D4z0+i9+WxrRSc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11662

Hi Rob,

On Wed, Nov 05, 2025 at 11:16:24AM -0600, Rob Herring (Arm) wrote:
> 
> On Wed, 05 Nov 2025 16:39:00 +0100, Tommaso Merciai wrote:
> > Add the '#mux-state-cells' property to the Renesas RZ/V2H(P) USB2PHY
> > reset binding to support describing the USB VBUS_SEL multiplexer as a
> > mux-controller.
> > 
> > This is required to properly configure the USB PHY power selection on
> > RZ/V2H(P), RZ/G3E SoCs.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v1->v2:
> >  - New patch
> > 
> >  .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.example.dtb: reset-controller@15830000 (renesas,r9a09g057-usb2phy-reset): $nodename:0: 'reset-controller@15830000' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml

In v3 I will model mux controller as internal for the reset-controller:

	reset-controller@15830000 {
		compatible = "renesas,r9a09g057-usb2phy-reset";
	        reg = <0x15830000 0x10000>;
		clocks = <&cpg CPG_MOD 0xb6>;
	        resets = <&cpg 0xaf>;
		power-domains = <&cpg>;
	        #reset-cells = <0>;

		mux-controller {
	          #mux-state-cells = <1>;
		};
	};


Thanks & Regards,
Tommaso

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/961741af7d4ec945945164759fe0d78bb3cf4d9d.1762354366.git.tommaso.merciai.xr@bp.renesas.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


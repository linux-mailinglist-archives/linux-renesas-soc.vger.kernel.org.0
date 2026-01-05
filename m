Return-Path: <linux-renesas-soc+bounces-26285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18738CF33CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 12:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7E4E3091F5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 11:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BE333E344;
	Mon,  5 Jan 2026 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QicaBh1h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDE733DEF5;
	Mon,  5 Jan 2026 11:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611735; cv=fail; b=f6G4ziTVayBFmsQ5R6bCqA8kxDD6TjG7hLEhGL+WwrYOjbU1TGu951wmnQFfBd5BbwB+oLfdR+RtIV9iTGFaiAXgNZhnEfhw5aloS+NIDYh46lG9eHKB3WVWu9oc/qyLG9t4NmPIA6MjrpiUSHuKHrYJit8U4PrBxQy28o0/uR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611735; c=relaxed/simple;
	bh=spFvRxbnl2e+j+1UVs/BQhTGnzK5MTHYj2m2pwrr7i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PgWTm3SCcOaeLsXrUiCAcwprfL4LSX5yGTsu8FQ87T7tLC6UbN3xLP7c2LnaA50Joj1JLoArvzgqOA0SMTjKWSG+Bu4TVNtW8AaAeuocXTFpJ6Txv+l5RRXG/b+/w9q9d01m64dsjBMqvMNTulZafUfv04S9KCigm7n3HJICgNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QicaBh1h; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9pJRNRqvKZ0pCEyXe//BvtFde87bkvtidgm7hRAOiJcfyAB8oGq8YbaFr4MbMLvQdUR7KO4LVVfM9a82ejxLV4jGyz1ctLoat3VCdbUC9hUd4lpw7oE7tgvAgHkCN0mfV9Vv9sk4V2aQ9Byv6ghd2jHBC6Xo0ceKnto96rFR4J9oDd6Fp71VSXBTjQn0O3kcxak7ag7pnGL92brakbRAu9Ok3lkaL7BPhdfDAP8yArFCKtDSI8AGn75/WhvNdzWkAqcgiYPPNLuLxOFLOVd4MrF/i1peXPYiQj5K8jVlu6Vyh9V1ztHQ7aZWDAsCFa+caEIoQ8AGdLIG4v9MchUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAG3tQ+q08q4gh4qWj+onpRtyWJVtliQZQxp/t5FH1k=;
 b=raMgLiCCI3JR6H0CfjpYcu8CvA2a6J4QouYMhM3gLVWyYFxjb89XF/sR67DUzfsnIvq9qfpn1TCL9dswgEGmu81usTHND4yjRx14lhUArYdTRhBMl1z61KrYmGvuEDLjk7h/S6g2NjFXY0g4rXye6+Qo93BXDeO19n9lZcP/LeSxa0eneiuNz679oHHHIorD6K2GqmuqOckpNYzHMSnoy6vB46sIDwpi5nCkKYcP/9hQRWobT4FfEjFih0hIhUgm2u4oZxPeYQkNe2Kii3ZY7/6FwruZGaukvsNcWYQoaxndFZp4UmLfybY5nRihW31k9MKTdz5xelr+nLv1xHia2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAG3tQ+q08q4gh4qWj+onpRtyWJVtliQZQxp/t5FH1k=;
 b=QicaBh1hQ4GUUs3AN9C4pUoa97PhrbfS/M9KsH1uhrQsnnYTH/rSmn9N3C/zc2Rz6fta6HwLX8ugtWuTrkr2yx4g32A6Ynhuw6oKrUvoGDw0t4sOtitDkZJNN38BEfgtbZxTjIXBDlopXI9fWtn671fykZRNDsmrKl7HcHxnkS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13922.jpnprd01.prod.outlook.com (2603:1096:405:1f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 11:15:29 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 11:15:29 +0000
Date: Mon, 5 Jan 2026 12:15:11 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] i3c: renesas: Store clock rate and reset controls
 in struct renesas_i3c
Message-ID: <aVudPxqhS2ipX0kL@tom-desktop>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <9c36f4107b257409a513fd6095fac3635411ef7d.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346F08CE5CFDFD010A58C9D8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346F08CE5CFDFD010A58C9D8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB13922:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af7f739-4680-45c0-07b5-08de4c4bbbb7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CfmIbPyOcfCxcUBn5nrclF58DGTf2l7//oHTiNS1SyK58scUufXe7gKb9Lj4?=
 =?us-ascii?Q?wfTDbFdtFo1Fk3oOxA+mDYQHde1IaRcGa7RavH+uUOQTGzxjzRuEqv/1u0EP?=
 =?us-ascii?Q?Wqw48TFyDiliI7ij8wYqmpaTTGfMcIlYUNqLSfPMEby+LbHwqPLHJ7EW0C9r?=
 =?us-ascii?Q?DGs6fphVgUCIIsQAFHNFNpu4XqJC/Wkb9GaY9ZL2FcXd+h1dx/xXwG8+P10/?=
 =?us-ascii?Q?ozpKm0agM3o4ZRKpnFKz+AIIHE1gsr5ahJfkyhyDHKyVHqrT+JhjAmOzrbgp?=
 =?us-ascii?Q?6o6MqVGXa96VpQ3jX4EZsX1AICwfI0fTVO8mvs40mze5Oa8R63uI94GLlb6W?=
 =?us-ascii?Q?1kSsbC3lu52oVoAfZAgYeuRUeRUaNX0Os4XkDutaNTxgRtqm8UePhorN6yeS?=
 =?us-ascii?Q?OHFSLl6Zf/5EdNrEVeqF86hFYAovCAl8g7r5tFO0CTybJg2iyasq5HT4r1O7?=
 =?us-ascii?Q?IX2b36aw490BlQRs6F53HvSmvCDBgPfwWH5g1DmeKIQ0HZqFJw5nFyXRcWNM?=
 =?us-ascii?Q?Eato1CjBlwUYrSP0fFr0JLPklp4iOYiiF51p47F64rx/xnNOLnR0CeoWQk9r?=
 =?us-ascii?Q?vDeXlj29VgXX5rlFCxL0Vq5I2eFXlBulLIZ3AnFktf5tkZ+FMPt2lvgIz/2I?=
 =?us-ascii?Q?GufuApjSVyqPnjofbO+BygKUrTimxxwisb9rXliUHp0WKi/+1r+WDQd8ptR/?=
 =?us-ascii?Q?1X2mdm07yeT0I+BClsxcNMUECRt4rzqX1tlE+g8aKH0AcUU/PYAs+jOI4Vyz?=
 =?us-ascii?Q?IEwpIZdEIHd57Yn7r3dq2jw0rOzbvgEIjCOO6FCfDyVEI3Ch+JCdjYkQVvbR?=
 =?us-ascii?Q?SiiKAbeis0Uh6agzzSBCPJt8c7+Q5NV57ynTjZ8MtMQTpGFhkoU2CKvU/3of?=
 =?us-ascii?Q?vj4oQUDtEAySpqVKtlFLsPC/PSBf+gdso6LTOlobF1eTiaX/skTP2DpNvLR6?=
 =?us-ascii?Q?KhGi8OpPSrrFJx8qG0eOblhd1LG8Yl3p27W0/P2POnJmsad6akZrJgKNgQ79?=
 =?us-ascii?Q?ovmJiL018OKSCk59fm/u+eswoizxbQVj1zsnMbHDOa4PgyHt01gsFoS1RCpJ?=
 =?us-ascii?Q?xvf4ZeGa330TWE1teCXVI6+wKYsnEmpOhOf50ycZaLjfdcW6zVr06XF+zb1c?=
 =?us-ascii?Q?DAHvnoQq3AFC9nyCfk1rhPczx961/9stM5RATPK9J8jRqnviLrr4g7QQ9L+h?=
 =?us-ascii?Q?ovjTzGsAMw7eNyVg5PaUTSfkex0H6A0L8K2m5gVmb16/1P2zKSFIfpZ+N0H2?=
 =?us-ascii?Q?DOov0NxwxbBh6v889ji6A6XbyIxxHwNlnOtGTdLnYrR9Ws9vYGFLcNF+6Pok?=
 =?us-ascii?Q?s3xLv8oOHpZ4jJ9OErlPu5Kl93T/IUyr1towZmy1d77XO+iDHezHJF3kfHGm?=
 =?us-ascii?Q?gR+SgntRbWROWNNl/8T9HAA5F5csHTJPKECtx2uFPpp0h6thrPjhuSeVIDE/?=
 =?us-ascii?Q?BVIn+ow1BVhbknzMK+Jgf68T2wMJfQGaEOrFyYErlPNw/2SfEA8ycoIGOImN?=
 =?us-ascii?Q?x36WB7KO+J+a4erAwiE4JD2TnHnOZCgvLKUm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LHG5jeIpnBkuXlwEx7AWsRLWxGNmj/hu+YwVZdL4cUGNwLlwwyv0tHNaOkTS?=
 =?us-ascii?Q?bQmhujat+BjFrGJrKp2NBfTXOhiUAOdeZB1v4xLrqdC1dkualO8GX2TzWz/r?=
 =?us-ascii?Q?B1neSQAuW4ZfDu3HSJxy2S6Pjo4AmHqkNx7/pPwtxQ4fyTARV6BFwHVvrxFw?=
 =?us-ascii?Q?O2XMOux2EIz1mxvWaxuf4ZHOuOmtr6n3CGiA9fe7Cg4Q06AwEOWhXjmwapUN?=
 =?us-ascii?Q?XxMl8U3r7+YkcDOr+ugBySvk/5oABbA8pBQ+bgVmn0kGKN9ZAlGisGDZkYwl?=
 =?us-ascii?Q?v4yhDisC6Xxo3wYok1/Jexe7td56HPrig3TMYShXyHTiJ2ei8k31WUaE8yyX?=
 =?us-ascii?Q?SRicvD9XkvYFRXkmyIVjxClFrGcqwmRbcndiRfO/pHN1u2NGng66M72TVm6T?=
 =?us-ascii?Q?hRx1Xe7wDViST71R8BHHhWyzI3VtTxomrqFEnNJ2OY1EQ8pPlaI3fn1MZFbi?=
 =?us-ascii?Q?SmKiSdyWOTiC1ctCXUkpK1Ox2DTt0xiR5Wdw6VU1Poxo7MfaHDpEriOqP8uu?=
 =?us-ascii?Q?MsnoIRsmjBy+1hXBN3OdBSXGXXwEThtC81evlcauH8Peik/eRQWDB7aTzkqO?=
 =?us-ascii?Q?cUka8KBqqk8ueeUIqP3jd1yhGoLTf9KmbCpTwB6kE3QX345w9T6hY4tOwBRc?=
 =?us-ascii?Q?LkqgukcBRs3l6KQTUk3BaAe79y3H9CLwVwraLrDtHHlkwLejL0+E2iZqUoXf?=
 =?us-ascii?Q?dxXectcdAjYTl4nYo+ejAjbdfYthwJnPo8iq9FIHcMbmx8Urpel6mzAQcBEV?=
 =?us-ascii?Q?wiBiLV0w+1JbG84scrMhQ8+8Agx2M5a+UEj7GLSRTkJzfPCjVQGUiHZ7SrIW?=
 =?us-ascii?Q?MVJPDAj+p2fo3NeE5btsG5AYI74d0EfGu54+hwLmS3K73tg6q95MUIqEOMYn?=
 =?us-ascii?Q?wkIwQQeFeqQmSaSIDOVV+4iav2Kda9gJmx3zKyfca29BbPWaMk+j7sGVeTjn?=
 =?us-ascii?Q?kBWjDW+vFW2coEKabTt+eHCFsYIDsZ5H3aDuzYTX+TSEeLyPVfPtkfqBEiXN?=
 =?us-ascii?Q?xKen/4Tgg/9MTen++S2PqD+DCO1FbB6zH+0oRxcTiggrgTHqhRjOXv04sb2I?=
 =?us-ascii?Q?IPIi3LqlM4DFRJBTiP3IbzPqQUyB2UEAYypG2ouMpXh5rPxEvrGs2cVDaye7?=
 =?us-ascii?Q?40KQM0xgISGSe89SQI5thANZ5HnmNO8t9xr0H8H4IdYLHZZhKJcdaxip4+9t?=
 =?us-ascii?Q?cv9/QKL5kwDwsFDHIOnKnnkdbpUhhp0Ex9BfELkcZl1WIWvT8GQ3KbSmHxYb?=
 =?us-ascii?Q?ZkwuEXvGux0sNqLitVl9DUBonbJDzxyExkynK+6/cahq0ui40/H1lqSDxawM?=
 =?us-ascii?Q?I+qxui8lJuiIAAVmv06J5YRhNKm2YpdwfMc5o1aLYKBFeP+TaVNhGn1muafX?=
 =?us-ascii?Q?TbbEgcLL+uHBoA/81lxomEZikiZrLb8Cn9NAPJOQ8gzpr/6AX8ThVe/wZ2NU?=
 =?us-ascii?Q?HNbgbYzpKdpKpsbxT0xRxdrj+wtnknRsZJsjulcmVyV8wo1VqfxuJpJHr9oU?=
 =?us-ascii?Q?stzF6tWmzUOkur+aw7R08PbGMUNDdwyDdVzAHXBZlb5TW7GG1aBM/iL7bnRB?=
 =?us-ascii?Q?I7bFWQsSnEZrgi/vJmtv3L1pey79lH2XDnL0Of472vp6G0UVDatngGlwKCyW?=
 =?us-ascii?Q?Dy26tGPltY7PffM5grE5B65H8tfvRdWIb8QAubavF+fzToM2yThuGXm44OIX?=
 =?us-ascii?Q?Xmk8v8mq3OGC3MeXlVkuYHU7URr3ZLRDp1QiZ0RPOHclBJelKxaEJs7bgpjG?=
 =?us-ascii?Q?m+55+2+9X1W7n6q9aDdO6+7F0JAgBgE+xbVQglLFAWz+hJXR7Htm?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af7f739-4680-45c0-07b5-08de4c4bbbb7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:15:29.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVeCoeb7N4nnfxClBxTtUN5DGB/mkDCwvVs0p1tUUzUdKfxDkBQ0G4FBnSco6WTlTGdg+7fLWqBqH9jeccQI7QTPrVS3ezbR4y7I7g377TMMf7FmxRNZMjtQUCgYMvl8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13922

Hi Biju,
Thanks for your review.

On Mon, Jan 05, 2026 at 10:53:29AM +0000, Biju Das wrote:
> Hi Tommaso Merciai,
> 
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 05 January 2026 10:50
> > Subject: [PATCH v4 2/4] i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
> > 
> > Update the struct renesas_i3c to store the clock rate, presetn and tresetn handlers. Replace local
> > usage of the clock rate and reset controls with these structure fields.
> > 
> > Simplify the code and prepare the driver for upcoming suspend/resume support.
> > 
> > No functional change intended.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v3->v4:
> >  - No changes.
> > 
> > v2->v3:
> >  - Collected FLi tag.
> >  - Improved commit body.
> > 
> > v1->v2:
> >  - New patch.
> > 
> >  drivers/i3c/master/renesas-i3c.c | 39 ++++++++++++++++----------------
> >  1 file changed, 20 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index 1b8f4be9ad67..7359f71f78dd 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -258,11 +258,14 @@ struct renesas_i3c {
> >  	u32 free_pos;
> >  	u32 i2c_STDBR;
> >  	u32 i3c_STDBR;
> > +	unsigned long rate;
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> >  	struct clk_bulk_data *clks;
> >  	u8 num_clks;
> > +	struct reset_control *presetn;
> > +	struct reset_control *tresetn;
> 
> Can this be above num_clks to avoid padding?

Ack. Thanks.

Kind Regards,
Tommaso

> 
> Cheers,
> Biju
> 
> >  };
> > 
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -482,22 +485,21 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  	struct i3c_bus *bus = i3c_master_get_bus(m);
> >  	struct i3c_device_info info = {};
> >  	struct i2c_timings t;
> > -	unsigned long rate;
> >  	u32 double_SBR, val;
> >  	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
> >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> >  	int ret;
> > 
> > -	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> > -	if (!rate)
> > +	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> > +	if (!i3c->rate)
> >  		return -EINVAL;
> > 
> >  	ret = renesas_i3c_reset(i3c);
> >  	if (ret)
> >  		return ret;
> > 
> > -	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
> > -	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
> > +	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
> > +	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
> > 
> >  	i2c_parse_fw_timings(&m->dev, &t, true);
> > 
> > @@ -510,7 +512,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
> >  		else
> >  			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
> > -						     NSEC_PER_SEC / rate);
> > +						     NSEC_PER_SEC / i3c->rate);
> >  		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
> > 
> >  		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F) @@ -518,7 +520,7 @@ static int
> > renesas_i3c_bus_init(struct i3c_master_controller *m)
> > 
> >  		i2c_total_ticks /= 2;
> >  		i3c_total_ticks /= 2;
> > -		rate /= 2;
> > +		i3c->rate /= 2;
> >  	}
> > 
> >  	/* SCL clock period calculation in Open-drain mode */ @@ -539,8 +541,8 @@ static int
> > renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  			STDBR_SBRLP(pp_low_ticks) |
> >  			STDBR_SBRHP(pp_high_ticks);
> > 
> > -	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
> > -	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
> > +	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
> > +	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
> >  	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
> >  			STDBR_SBRLO(double_SBR, od_low_ticks) |
> >  			STDBR_SBRHO(double_SBR, od_high_ticks) | @@ -591,13 +593,13 @@ static int
> > renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
> > 
> >  	/* Bus condition timing */
> > -	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
> > +	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC /
> > +i3c->rate);
> >  	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
> > 
> > -	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
> > +	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
> >  	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
> > 
> > -	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
> > +	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
> >  	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
> > 
> >  	ret = i3c_master_get_free_addr(m, 0);
> > @@ -1300,7 +1302,6 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {  static int
> > renesas_i3c_probe(struct platform_device *pdev)  {
> >  	struct renesas_i3c *i3c;
> > -	struct reset_control *reset;
> >  	int ret, i;
> > 
> >  	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL); @@ -1317,14 +1318,14 @@ static int
> > renesas_i3c_probe(struct platform_device *pdev)
> > 
> >  	i3c->num_clks = ret;
> > 
> > -	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> > -	if (IS_ERR(reset))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> > +	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
> > +	if (IS_ERR(i3c->tresetn))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
> >  				     "Error: missing tresetn ctrl\n");
> > 
> > -	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> > -	if (IS_ERR(reset))
> > -		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
> > +	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
> > +	if (IS_ERR(i3c->presetn))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
> >  				     "Error: missing presetn ctrl\n");
> > 
> >  	spin_lock_init(&i3c->xferqueue.lock);
> > --
> > 2.43.0
> 


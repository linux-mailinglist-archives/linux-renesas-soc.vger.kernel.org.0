Return-Path: <linux-renesas-soc+bounces-33307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O8DAH+VGGoMlQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 21:20:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF45F6FCD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 21:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE5CA303F7DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 19:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CB1327C00;
	Thu, 28 May 2026 19:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TYrX0nCe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9F34107D;
	Thu, 28 May 2026 19:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995616; cv=fail; b=TrPVwUoIYge6NbsT1cS3ivHFK0L+Ix6/IzS9gG6sz7ZU2A18L4NcgJUVJPuJMdYB8VBqiw0N83fKqPQfWs1+TUyshOyVq4lkBr+vG1vzeIZ0ULxf7MuJcK/kBR+eonIklgRHGcEOUnPteYW8COcrxUiL1yu7zmay5XJn5QUCD0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995616; c=relaxed/simple;
	bh=x3GbsAnj7sWTcu5T4MKeuGOaZgnUIl4HmQ1BaIgwkmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TU5fNVHjfKIGo+z6+C3DmIathmfMiT2mLUTVHzMx2wYi22f2YJDe5v45GDc5t/yiZ/d46BvA+cdzS03/4QgHxvNOpF6MpGDT9hyVqkzy8CZVfnzyDk00H/GYDzL8zmeJoiH2wQt/3ZAiYhUX39EoX35Eb/e0SiUN0iZp6Q0DtN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TYrX0nCe; arc=fail smtp.client-ip=52.101.66.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y59A1EPqnFV1sBVna/qDsqwGdP+q19oplR3xaxPnrFu2f26UG3vQdMvxv++t70ROmbNCe43cNUCv/lu/4mU2QOcQD+I2Az2PERWX5OvqHhJZMup0ZmQaVhTb/4kll+QjR5pID9+Naq35v4kYE0tHA9HFWTstd38YVfTOw3JkdaSzca/7uHj/fBwAr7wmzvVdTN+NUND/eG8HVSCo0w22zK+9V3MK83nAxVWNowWKKtX606WTGW2x6JPyrq4q0Hr0u/JLRHzdkh/6jH7wNxeoot3eD+qL5dDb+Sjh6dMtzKakQbIWLUWrBd8FB+jCg9j74kLj712DVo1564fphIISZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GObU5hniJSHGbGjwsqBZEjC8xNhjOEKHkTGTs7y4tco=;
 b=VrrdgPCwyx/tJTppGqhP9zN8CK0a+h7/vURJtY4Xo60GgnTPV1Oh+CcxtoJBNBxSyExtQqRkHjUN3gHJdl9smsT/wKOdHMBqfGPJslCHAvhRZfu42LTlLcvC2/hjCU/siCD8h+sIExOugcK2dyRRdws61hStf94DUzJZ/v60KfJWPWUiiggdhDlVB/HT9Fhuvkj12TkWp8OVRoi/tiw3SNQyyXtv/MiJAyZFIlXVQoD3+4PUfPx0gE3SrtjUQrT1nC8/CO2u3pajwg83gTpa9oSbjNtrcm2b/0JdYc3BeuS2r8PkXHKVam7Ra2BEFjjTRGEKQXsmigBea9cXbqfxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GObU5hniJSHGbGjwsqBZEjC8xNhjOEKHkTGTs7y4tco=;
 b=TYrX0nCeOoFz74kgSRNyENVjIiTvbHBpXojELHR4DljG+7bDXaAl1ZmsnzHrrgsNq7hLpdFv0WnePizXlg2vXDthfObWoJ7P7SruGFudmJKDFXx5UPoC6NGSK7iengmeV/pXB1DmkOWmI/zQgDeU6kybfp/L9FZnTGSa40IIA4k4imWGVe+LLa9mgF5CUqcU/+8WlQN61QnAGD0CYhut8gDLyM4rPx6gSewJCeVqOOxMI8uVQodg9jjWZv6uueuChb1yfTOznwCYiQ+ttpup1hgJu4iJC/Yr8ER5kbp7xKkGt9PyOYd4+EQUspj2N8el/SWjVL7cxvuHbIt4fXtNww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9007.eurprd04.prod.outlook.com (2603:10a6:102:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 28 May
 2026 19:13:32 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 19:13:32 +0000
Date: Thu, 28 May 2026 15:13:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 03/17] i3c: renesas: Restore STDBR and EXTBR registers on
 resume
Message-ID: <ahiT1YkbWNz9y4mH@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-4-claudiu.beznea@kernel.org>
 <ahCqF-OHFbV9b5ul@lizhi-Precision-Tower-5810>
 <560f3365-8a22-477b-ae3d-61e8f4103e83@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <560f3365-8a22-477b-ae3d-61e8f4103e83@kernel.org>
X-ClientProxiedBy: SA0PR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:806:d2::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: fa34eb1d-8e75-4b95-f8dc-08debced3539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|11063799006|38350700014|6133799003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	k6Fsh47EpymGXX2trh/u3Tkf9wUTHXlG+6m8hxxYpDnOYQRVR1Dm7WjafXMjxTW/PUig6KJcCVgOeBQbAsWUZFqgn4f/8GLbW4xtrPzrnh6yA2U30KwuSXE40HRbRQEzcRqzSM1USzc9yfEpS34FdNM0TRO+2BnWPB+dPBV/kbm4xfTyzYPuNijm0tdty7Grmav5TsQH3PkX26gEbqimllRxpZbEF0XVn6LV5u3Qvb30djyxr4Z/onboZET3TEAwFPPdyoVHLr2MwdLC7AJSzSPzK1Lg+0f+400HQAGtw6sMYAwDP4MPcQm1szUEcL/kHCI+Bl5gAxoMAnv/jqVjv+u4nsN4/eNoKPJ/Bk2doZ8Ec4XJ5wOsSeVnWA5SGJmEhet8+C2AbTKOLwgi+3F7Wd8BN7WXtoeUtp9YRtwpZCuC0sqEJqNVbYIGR0lAaKmFdFimyqs47E/xyeP+fqaW2OSbqvGvtTQPcBHE/1H4mjCavqUtIX20jL8BX+zTkEwW9+B+cCdHj+UaGstTF6+vUxqyIxZbdoINSsBJ7u/+dIROvnfGgdHE4Y9Ru0tkQ9+pgEQJbS/BqM3OnihvI3KsJUYwQgUck4YcbX+p7y3rfbw7ky2ALVXL6g0OTPANTEIEv5OC8JYTp5H+E8HFV/78jIBnXU8BNQxQbo8e2gDAVOxdryyNtq9Nm7RUskFTBpNYEx4lrQJuSxWulftyiUllSyRUrw6pXUy8IrwcVyxApXzU9vaRufB1lC9/jxEUTxcc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(11063799006)(38350700014)(6133799003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlVCS1JvRmhZWlMwNnJENXVhS041TUh3eVo3dWRqZE8wV1d3OENaTUJWamgx?=
 =?utf-8?B?WHZzRWpYSERzRHJ6bkdNQlNDYXZtMWZaeldIY2xZc0V4cStuM0ZCMVl3Rlhq?=
 =?utf-8?B?aDZsNXdhYUloeGdzcVlRdGNWZit0Wjd3YXZnaVJOSGx0YVVGaUxkb2lQZjg5?=
 =?utf-8?B?Y2E2a0NUbFFrdURiUXhnekwzZ0xzVmg0MkoweUlwQ2k3T0VvUnlaSVlhOTZK?=
 =?utf-8?B?N24rSFFLSHN2Ylk0TGFFQk5wWE04WWJTL2pGQVBTcFBmMXE3UmFuN21mZTBl?=
 =?utf-8?B?NFZlejVKdXRtcEw1MEVyNDRtUUR2WW4zSUxiY1dmWmhnQVZZZEJwTkZlbWVX?=
 =?utf-8?B?U0lFN3hQK096VElpWW5aRXA0QlBnNGJvd1V6Nk5yOUZ6aFJoVGtmU0ZyVnRr?=
 =?utf-8?B?bTViQ0I2aThkRFNlREEwWnBZdHVmR3I0ZHVDZ1dOTCtxdFV3dGcrU0Y3NTVp?=
 =?utf-8?B?ZUhINitJVFY5dDN3OENTSmh3ZE5TTURPRUEyeUl6SWgwUnVHZ0ZZMDUzRVc1?=
 =?utf-8?B?bjRXM1lLbHQ2UVJoS0lnS1JlaHJZdXdmQWNQblgydDlGaDBxbktDUXFJdkZq?=
 =?utf-8?B?ci84VDQxREk5cnBleHhTVElkQ0UwSit2bFpDelBhNHZuSGR4dmNING9jVjFJ?=
 =?utf-8?B?VDVzNDM3RktSaWZYNit0c3M4NldHY2FZUnNlbW1aRnNPTFB0ZEp2WUFTQVpM?=
 =?utf-8?B?SXg0ZTQwRTJwdTZoUGY3VHk1WXZIVHJBSisrUlgrZmh0TXMxTlA2MStESDZ4?=
 =?utf-8?B?T01JKzRTYTJTQzRiMTViZ014bk00bXFUQjU1V0djNnVrZXhtK2hpWnhGYm5U?=
 =?utf-8?B?SnZvNk9ZV1htdmNlNkVvb01nU0w1bXRwcVRad2M1ZU01dG1VTG9KYlpVTDJq?=
 =?utf-8?B?TnlKRnJKNUpITzdSVmNZcnZ5RWNqd1pwU2k3SGJrajYvbDZtNmQ5ZE9YcGsy?=
 =?utf-8?B?ZlIrSk9NTEZMWmVLRkJiMW1LeWZzL1NBdXpUY1Y5dDVGejNGbGJKRkVoaWho?=
 =?utf-8?B?N25aVW5HVWJNYTNlZ2xMekJNQkE2alduSlpZdUpLWCtzRmZEcWJkd0tUdkc5?=
 =?utf-8?B?WDFYNW5vUG93eTVEZVIyNHMvK3BFTitzUWszNEVyQjZnalN2L24vVC9xUitl?=
 =?utf-8?B?VDk3RmViSEZyTWpmVFdGc0kybVI5Q0FNNFBZOGxQRDBMNkZxZWttS05uYW9w?=
 =?utf-8?B?eHZiN0c5MUU0a0RFZWVSdnNibis5QkNKdUJGNjZ1WmR2UkxGK1dRUXIzcy9Y?=
 =?utf-8?B?bUFtanBic05WNEN5L3pVc0pGZjZobWRxUk1TV2dQcERGNlM4c2YwNDQ5elZ0?=
 =?utf-8?B?RmZ0WGJsVzJ0b1djbWRJbXVjTlZzQ1NoL2R0V2ZjeFF0UFhuZ2tDNkF4NW0y?=
 =?utf-8?B?d1dkV0hweWhwd0RxSnhZR0w1bm1HOUlEUGlMc09tOWNYaW1YcStUMkxIeHZk?=
 =?utf-8?B?NTN4Snd1dmthOXpYakdYd3RpSm0yQVFCK09SVTg1eXpnZThCd3RxNGNPZU1P?=
 =?utf-8?B?aXJ0WTd3TElmMm5qM2FncktNcjNyY3lEajVpdDhjbWV4OEkwYWRiQWk5UFFz?=
 =?utf-8?B?SUxHY09ENFJhQXBJR0d3dTBxb3pyKzV5WXZuTUNMTHZ0QUkwZ1R5UGMwZUtr?=
 =?utf-8?B?SWJQdnE0OXVyeElURU54S0Y0aHFyR3J1SjZPMVNJMEdiQTc5QmZDMUl5alZW?=
 =?utf-8?B?ekUrUkg0YUlmKzJYQklVUExULzdNTXk4MTJSUFBFb0ZvR29rdnF2N3R2MHhx?=
 =?utf-8?B?dGxIWWw1Wm13QU5ESDNEbTZONHZzRkdxTU1saSs5VGo1SGlIclMwc0pPa25S?=
 =?utf-8?B?UUhDOEhwVHhGbGFma1Z4cTBRcEhrb1gwSHhuWXhuQy9OeE5SeEE4R0d2N0Zw?=
 =?utf-8?B?YWRDMmVMR3JvQllsY0l3dVhWY0JtZEdvckN2emxlekdaSGk5VS9Cc0oydURQ?=
 =?utf-8?B?dGNld281aTNyRkpSNFc4UG9pSkV0M1VEemo2bXozVi9hWFZIY0p4ZHpKMGhM?=
 =?utf-8?B?R04ySnF1MjJsZm9xQ29CYVNwMVV6MlFFb1o5RU1ZaGhhN2svZjRNMlVUcDNx?=
 =?utf-8?B?WDFKWG51dVVXaEtkNHpKc0tYV2x1MGJpWUtPbEJOT240eXE2cEhMblRZWWJq?=
 =?utf-8?B?cjJpRU55cXFZblgvNGlFWnM0QVlJMTFzRUNWWFVzOWlOTFJzekJTdi9FbGdi?=
 =?utf-8?B?OEdDSVI5Um9IS1R3bThZdVFVUy9MUHZTL3B3RnUzWGxoWmgrN1FyOGxPd2d4?=
 =?utf-8?B?OXVWNGlQL28rRW1lcXlCa1EwSkpNcFk1Sm9ia1pJd3pGbloyVTd6UjJLbkpO?=
 =?utf-8?Q?Ex+3/VgqOcOnOAbKuz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa34eb1d-8e75-4b95-f8dc-08debced3539
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 19:13:32.0727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBuDT/nzANppOWPTy5D/aHKAwDcfrA6JLAvS0NRsYWQPFDc1UNzb2LHzvnembMh2z82vuEJJ4pqZmHXQXOGl0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9007
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33307-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 38DF45F6FCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 11:29:46AM +0300, Claudiu Beznea wrote:
> Hi, Frank,
>
> On 5/22/26 22:10, Frank Li wrote:
> > On Fri, May 22, 2026 at 01:18:01PM +0300, Claudiu Beznea wrote:
> > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > > The Renesas RZ/G3S supports a power saving state where power to the most
> > > SoC componentes (including I3C) is lost.
> > >
> > > The STDBR and EXTBR are configured in initialization phase though the
> > > struct i3c_master_controller_ops::bus_init. Set them on resume function
> > > as well to keep the same state of the controller after a suspend with
> > > power loss and a similar initialization sequence as in bus_init.
> > >
> > > Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > ---
> > >   drivers/i3c/master/renesas-i3c.c | 10 ++++++----
> > >   1 file changed, 6 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > > index 1917549cf6d5..6c23f956ad2a 100644
> > > --- a/drivers/i3c/master/renesas-i3c.c
> > > +++ b/drivers/i3c/master/renesas-i3c.c
> > > @@ -260,6 +260,7 @@ struct renesas_i3c {
> > >   	u32 dyn_addr;
> > >   	u32 i2c_STDBR;
> > >   	u32 i3c_STDBR;
> > > +	u32 extbr;
> >
> > can you keep consisent with above 2 register, use upcase EXTBR,
>
> Using upper case for this will mislead the compiler. There is already a
> macro defined for EXTBR:

That's fine.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> #define EXTBR                   0x78
>
> Defining this member as:
>
> u32 EXTBR;
>
> will make the compiler try to replace the EXTBR in "i3c->EXTBR" at
> preprocessing time:
>
>   CC [M]  drivers/i3c/master/renesas-i3c.o
> ../drivers/i3c/master/renesas-i3c.c:65:17: error: expected identifier or ‘(’
> before numeric constant
>    65 | #define EXTBR   0x78
>       |                 ^~~~
> ../drivers/i3c/master/renesas-i3c.c:263:6: note: in expansion of macro ‘EXTBR’
>   263 |  u32 EXTBR;
>       |      ^~~~~
> ../drivers/i3c/master/renesas-i3c.c: In function ‘renesas_i3c_bus_init’:
> ../drivers/i3c/master/renesas-i3c.c:65:17: error: expected identifier before
> numeric constant
>    65 | #define EXTBR   0x78
>       |                 ^~~~
> ../drivers/i3c/master/renesas-i3c.c:611:7: note: in expansion of macro ‘EXTBR’
>   611 |  i3c->EXTBR = EXTBR_EBRLO(od_low_ticks) | EXTBR_EBRHO(od_high_ticks) |
>       |       ^~~~~
> ../drivers/i3c/master/renesas-i3c.c:65:17: error: expected identifier before
> numeric constant
>    65 | #define EXTBR   0x78
>       |                 ^~~~
> ../drivers/i3c/master/renesas-i3c.c:613:40: note: in expansion of macro ‘EXTBR’
>   613 |  renesas_writel(i3c->regs, EXTBR, i3c->EXTBR);
>       |                                        ^~~~~
> ../drivers/i3c/master/renesas-i3c.c: In function ‘renesas_i3c_resume_noirq’:
> ../drivers/i3c/master/renesas-i3c.c:65:17: error: expected identifier before
> numeric constant
>    65 | #define EXTBR   0x78
>       |                 ^~~~
> ../drivers/i3c/master/renesas-i3c.c:1451:40: note: in expansion of macro ‘EXTBR’
>  1451 |  renesas_writel(i3c->regs, EXTBR, i3c->EXTBR);
>       |                                        ^~~~~
>
> The register contains both i3c and i2c specific fields. I'm not sure using
> i2c_i3c_EXTBR is the best way to go forward for this or just keeping it as
> is.
>
> --
> Thank you,
> Claudiu
>


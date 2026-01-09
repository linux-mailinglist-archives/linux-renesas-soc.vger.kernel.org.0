Return-Path: <linux-renesas-soc+bounces-26534-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A9D0AF8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 16:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56F1D30CE4CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 15:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D40248881;
	Fri,  9 Jan 2026 15:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RjcDI86n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010029.outbound.protection.outlook.com [52.101.229.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC175284674;
	Fri,  9 Jan 2026 15:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972807; cv=fail; b=joY6Ch6JAa7McguaNwUFvSGKqVDAD5YbuTNkziRGRe+BslTKCMGjGPiYTfofKfRm6++aWTat3SWghvS8DQupn1GQ47kPq+VkYIPyZiUbnCDslMRFWHrQjsbSgMprDRKVL28PXohgbKou6B1amnIRedk6VpMzCql+pnJdszhSI5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972807; c=relaxed/simple;
	bh=5ATSDnxAFrLvzv7SAmNeiMgZlBckdqBvGlpHBaaqLbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BHa9M2o8u44Ty5390AWrrtQjvqk3HovouzXo++qKN89NuBiA96tDAeMgexGFkJ0R3s3CBZHDr1iftde4VFSYJUk0WFwujpb1sKlp2/rsibiR9qIYAVc1FBbfDpCJpOF4IYGMQTqKDjVpgsKeGxQTClkcRTxJCzipq2a74KXl9Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RjcDI86n; arc=fail smtp.client-ip=52.101.229.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiYMFdNaoW913cuZHPeP5spSL4hrfY3BIpKNT2EFRxPrIJgKugb+ORv74/jXVzpdTTpWbIJyM+oAX2mOdp8ZsctpmubX1RZ1yKZem98rj2ZxGqHHXFlvcyFQVERYo5wzdxKD6aobqP3RLj35oIzeNX+pmwsYXeMJ9ZOmXlIeT2pDawF9d8pnZ5U+0GvDb96g8uqpSaHnNL7edt7j7eFNaRcFANK58kLXzw8+MY8vQ6TtpzIG8KOgRNE/zoXXhamGBU8WddSPjmXxi9MHAB0Pvk0tbRx2xH3Qhzq/CmRZDXntooWRst9N/cY+XKMHQ3L1kKxL54dMEXkA05eYa23LGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkdlSrc8i+6KznvVvIF7TmPZ14GbHfVPBRtH6OWMgJ4=;
 b=ygVA+JOeCiY0Tvh/dUQeV+EX6fjdlVkc2JU+MlOxnQSVyNEsUKlFbj8VYOUXZs1SVuljBL6DZRRmLEDXCQ5btK1zfBJt0D/OMxJixpLjkl9sSNEg1yslcLmh83VLzjRx6Ow6KX7ct74vpofE9eX5+aqvePPJqt+TimjRMheNo0uXgsRawfkPkqVNJfJMpnLTPRhyleM0CBxHKLWoWaAfg4/+azVFLYq+nCFPNKkxAt+TgwltHbAV15YwYpHnSAxN2nFfMI1ynC4YCLKFCTmC5buHJkotEyxUSGOCX0SGH3zvbfbhTbWP/h6qz+ckgWuwRpkYhBLsyHIh8m0ReecmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkdlSrc8i+6KznvVvIF7TmPZ14GbHfVPBRtH6OWMgJ4=;
 b=RjcDI86ncEMocbJQRPBR3K2FNbrfAh51lutckZ66WWU/rD9l+L0KpHsSw2TYz3N5KDuXzi1S8EwnMMNSAKVCwKl1WYo+qSRtY8ioALO38vKkqCyLBv+vnl/dUc3Dct42TVIlzWHDUL+mev4tWmLJLDIZaE0E81o0FPbeoGqi7/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB16986.jpnprd01.prod.outlook.com (2603:1096:405:334::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 15:33:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 15:33:19 +0000
Date: Fri, 9 Jan 2026 16:32:59 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v6 00/14] Add USB2.0 support for RZ/G3E
Message-ID: <aWEfq9Yr6wxIy5kH@tom-desktop>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB16986:EE_
X-MS-Office365-Filtering-Correlation-Id: bbe58cc5-ff59-4788-f78d-08de4f946a17
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zGcPAHFRCjwSea1j3TJM3XbWsnUf4BY0cy22hfKp+udU6A9BOZMR+KgOc/i8?=
 =?us-ascii?Q?WmfRzZvGD6ar4zrfrWGHRmraa7q5oa04DJfMraiEvQHP4aRE5yhunil0qk+0?=
 =?us-ascii?Q?cifSUrAdFcZKtOe7sKAJwzhN6PzjUSAwDt4VTEz1WXiEVPqeOXWqz9LQLE+k?=
 =?us-ascii?Q?hw5itjVLfvtxb9INKFlZ9c3k2eLqsA4pjU78TD3S2lk2QJb2NPj+oxOLFe0t?=
 =?us-ascii?Q?920CQ33Izv/LnDbM9XWJdRiJlF8IiBZv8Lg525Ez/ee7oeBx8KTOtxQT29qX?=
 =?us-ascii?Q?NqRTfR2Pg7hCh9Xwyw4gz4CJdBoXU959ulUHpoLqSRKbGtcaEb7cbBEDPy6a?=
 =?us-ascii?Q?i+cJ98VTU4OeIQ4UB7OKXx45LOGStzhIM5tI+ZZbjMq4ki195pimTuHfGrGB?=
 =?us-ascii?Q?TAZ8J+Mj4x8p49x46OnPqBq7vajbPmiIa/vGCIa3gBvsSczDhqLPlOJqYN/V?=
 =?us-ascii?Q?cHCg5sZIJkdgo5WjDElj+elzTCgk2RyAwvSSJym7or2JN3ZDvcj/NuwJy5XO?=
 =?us-ascii?Q?FC6vN5LRo3gJTh2GciMFtBIU4fOvpibfB+8Z/IIwhhPbwyWUUqoVQFcQh242?=
 =?us-ascii?Q?iC8gk5LO+qpCrU+R7YWNnyTuvsFNObgmB8RkzIowjG1APvoBeiYVmB2DlJa6?=
 =?us-ascii?Q?t2P/4U+96bQpKyhX5h6VvhrlhPePeXHg7e9XSsnVSMmHPFcHbeb/8lW8QWJP?=
 =?us-ascii?Q?7P+ApLnsljcZDo1ZQHlrbb5AKdp8AlQkveT9worfz3NnK5J98prsObmUVy4b?=
 =?us-ascii?Q?5T+QSAfCxHyKj6ilPaiVoNgAqZFBnL3wY41lIjr0GZkFC4lfJrecxhzbqK1J?=
 =?us-ascii?Q?hKtAumugo9H4AQY1gpy/4m0DqB+eiOK5isU2XG7m2jnXGW2yz/sOSCgyQvyB?=
 =?us-ascii?Q?uEaTHL59BOx+Y7HLMrxPfURZAh2ARD2G/qMJrT94PwN7e6NkKYFxe0P+DWRm?=
 =?us-ascii?Q?Dpb+bYiLgunuy50UEsigt1iDgaTsL4gqUdya3MWMomgyWGyhl5tWjmzdhcuG?=
 =?us-ascii?Q?n6kAAqZ2wRkG2Tf5FXjL1DAOC4ZTFlj/IOe0EQmlbKyphQnUMnXbTnsTRv5k?=
 =?us-ascii?Q?rrr4zGZq2No1+K507oOpkxOeBokyi4M9Sa5lYyUtoj3zKhSsvMCOrmFRMo7m?=
 =?us-ascii?Q?6w+qP0SJWZu3EAVgGMcEoWH8ZnK+S/6/DwmTU9qFhopW871apLSntcsjpbIr?=
 =?us-ascii?Q?rr0MWVlne2j0xgPA1EKzDb/VfX5sqz8aJ2JGASN0io800+dLKLRD/35ncUIR?=
 =?us-ascii?Q?pCNglAcAqMs/U15qv7GuTINTQfxL+9bzRB2kl+FTAwb+y+BgMuQV/H4qJhP9?=
 =?us-ascii?Q?pLtFH3PRPDn2K5dzMi+eF3gKDBvtIVVz5jorV7ywNJ5KB4zasvcsOzShFmEB?=
 =?us-ascii?Q?StcMzSPPEgQiaNouIe6+jJYNZdtJdQRIpjHYrQJEYovA7VZ1tJEvGtx/3ZK8?=
 =?us-ascii?Q?A9VpfM88U0WCg8X7Xi+MRuTMsRJbhUdU+2J8Mh8uvKMXgSqoC0B1QL8oPj90?=
 =?us-ascii?Q?sNwy08C3h7KTtj9P92begPszVh0vEKjW76Tc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kZrt9uaVX29tRt27LdviayzoAVGnNz6SEqFyk1kwOp4BNjGMzkC8sgrisJb3?=
 =?us-ascii?Q?xH0HLL4qRJjwpnEPcTmRTFc2sEL9+EgveW7X/PJfzELPDP7Fs2OWYz2CUEUm?=
 =?us-ascii?Q?20vJoLPq6Tto32X4865CBxm/LrVyzy9sGF5NWjOqCQzQtOIt+0EJYFvl3KQJ?=
 =?us-ascii?Q?u9ZmDljf5T20Q4I2YbUzm2oRFRPqqSle9Jc31PDgkXee6nkc3CjmK6L3wL1V?=
 =?us-ascii?Q?DOwNWwxIO9F1xOFbBS7D5wBOzoGab7LbMx3Tyjf2LuG1UCwTycgacofS07sT?=
 =?us-ascii?Q?ekvJ75e7WwZEIU9Q3ozT+LQkQIc+3EI3ehh025c66P1ZD3LxPzm2bYuYwBvc?=
 =?us-ascii?Q?i1KQPSfobpUvhp0fghuaUWlGGF7GmCy7V4y6WGmcMBVmC+JfhuZGVuC3CO0u?=
 =?us-ascii?Q?5JKZlJzHoxUgyaieBN6e31HypJoWLoTQEySIyX/z6yFgRkOU8oDYbituu/jz?=
 =?us-ascii?Q?W8C2XozV+TOKuyVbvb2FjA3U0kGe3uZCdoDs6JcZd8Pmpji0vV/Da6UzA17W?=
 =?us-ascii?Q?upvk/lyxxfrHyQdoICha1MbvHpSsZAa0WDTMrvhMrZ+Dcx04vbVCFeWHC7jF?=
 =?us-ascii?Q?w6U5AXQw+413eVV7Nmi3KrJFTwnEquU0leN2/wRqvCy2zOzuUnAQZ7o9D+xd?=
 =?us-ascii?Q?tYtSccrcy6BwNggmr0l3h79H+MmG2Y7SyGRmPCQgI7PtHRJkcdwGh06FuE8Y?=
 =?us-ascii?Q?MYFAr+EY/3YfEjovHDP5GADess8ZEdXrhXbFxnUZYtrzQx8gv+yjp+gQ0zPv?=
 =?us-ascii?Q?WiHHBMY9zUh+hWkJz8M/EA62etudB2aELCEz0qchtxHlRo9HyDfeYs+2U5/X?=
 =?us-ascii?Q?NWVCEbDVwFw2FwFqr4KXIarjN1ujSKg8ow++8ZVLqAzOD4TiRR9NUxYSGKLk?=
 =?us-ascii?Q?xO69jMfV5C+OivIQ75VN5m9W44vtw+xHC8BZq4q3qrHIhNeKcBBUEgy7YQaJ?=
 =?us-ascii?Q?e9tXLRVuF3Bn51AJpxRtmNQplBz8kFYkUyXADRCiMVujheEg+JkqXpzGZMGG?=
 =?us-ascii?Q?C+6BfkWC261qD8GFpzLsb68LWYKP+4Gsl57oF6jHFKi8NKH21zfKIh92MXas?=
 =?us-ascii?Q?VDOqnEI+VcVSsD/XAwaPky+f6YnSnGDQF8I45P77De2YMB0l5lJPzcXY36Bl?=
 =?us-ascii?Q?S1HgSsIdYGjd5GdDAUsXVvElbWyMagDseTRl0vc9KvOt2WqFmODyrofHEeEI?=
 =?us-ascii?Q?V/PkpQC7pYsYeh/Zg+2PwB+4SbbYuNF9NbupAd9FX9LrsNfX+nNoH/O/BlFZ?=
 =?us-ascii?Q?J7XOORNkDEDSwd+slXhirLrtxnwf2lIGuEo1gVneU/VyL+RQzXg7a+A90VoX?=
 =?us-ascii?Q?kkKAoec2isG4sDy8yFhBUue7pAujliBCUsNBPwGqeeZscLrLM3MzRfiaJnho?=
 =?us-ascii?Q?SlGPyH6B687LIrKWjG/SrUB+amWEEtecFF0bNohAL/QHbirsrxoybmWBkk4x?=
 =?us-ascii?Q?OOj9WIgF+TCU0hzyGqac1pptdd+LZRZNVfgZTM3W+NQGFjtYIcfxmkZcl3MW?=
 =?us-ascii?Q?TeuF4nHhG1SB1ub5g9BYfdMrfgxIpKxPIkdWrCYgOwsZMERfqxblemHiSuJC?=
 =?us-ascii?Q?Cb49Vx5mhx8Tc7enzmtTsGSSxj479zqRhYdK88m3VanhPhGcDanEHsVpRH2Y?=
 =?us-ascii?Q?07Mn7gn7/8p0+himRfeQi3UFjRPh7pgmfPJt5AvoKjjGGxJw0YY7JEdh0mfu?=
 =?us-ascii?Q?AWD+cYqcAaL6VAq7f0BTwb3dL/TuxQ0prpLfKuC1boxws6qpPGyZPubnTlmi?=
 =?us-ascii?Q?zzVZ4E9lsDJCkwi5a2YFVOqmkMEq+lPVJz85B7Lbb1A86nYMw2EB?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe58cc5-ff59-4788-f78d-08de4f946a17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:33:19.0410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uI0zd6xEBl7mqTl6eEFobgrvcadlsBQI0/r2DOlW1tlHyLznDKM4hcc2XLNli72/UxrkTpoJiONVXactarXKfvkeHvdPj6lNsW6duEbtcB2oK3sWmfKch/6OiI+RJKK8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB16986

Dear All,

A gentle ping on this patch series.

Thanks & Regards,
Tommaso

On Mon, Dec 22, 2025 at 02:43:34PM +0100, Tommaso Merciai wrote:
> Dear All,
> 
> This patch series adds USB2.0 support for the Renesas
> RZ/G3E (a.k.a R9A09G047) R9A09G047 SoC.
> 
> RZ/G3E has USB2.0 IP that is identical to the one's found into
> the RZ/V2H SoC (R9A09G057).
> 
> Merge strategy, if any:
> 
> - patches 1-2/14 can go through the MUX tree
> - patches 3-6/14 can go through the Reset tree
> - patches 7-13/14 can go through the PHY tree
> - patches 14-14/14 can go through the USB tree
> 
> Note:
>  - Reset driver (reset-rzv2h-usb2phy.c)
>    has build dependency on Mux header file
>    (reset_rzv2h_usb2phy.h).
> 
> Thanks & Regards,
> Tommaso
> 
> v5->v6:
>  - Rebased on top of next-20251219
>  - Re-arranged series order per subsystem patches.
>  - Patch: 3/14: Collected tag.
>  - Patch: 4/14: Fixed commit message.
>  - Split from dts patches will send separate series.
>  - Added merge strategy in cover letter.
> 
> v4->v5:
>  - Rebased on top of next-20251127
>  - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
>  - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
>    Makefile, Kconfig, function names accordingly.
>    Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
>    Updated commit msg.
>  - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
>    Updated commit message.
>  - Patch 11/22: Fixed if statement for mux_state error check.
> 
> v3->v4:
>  - Rebased on top of next-20251121
>  - Added patch 01/22 to remove nodename pattern from mux-controller schema.
>  - Switch back to v2 implementation for mux controller in patches
>    5/22, 15/22, 16/22, 21/22.
>  - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
>  - Removed mux_chip->dev.of_node not needed in patch 06/22.
>  - Collected CDooley tag in patch 09/22.
>  - Added missing select MULTIPLEXER into Kconfig in patch 11/22.
> 
> v2->v3:
>  - Rebased on top of next-20251110 + [1] + [2]
>  - Add missing Cc: stable@vger.kernel.org in patch 03/21
>  - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
>    Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
>    from rzv2h_usb2phy_reset_probe().
>  - Patch 04/21: Manipulate mux-controller as an internal node.
>    Improved commit body.
>  - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
>    then update the aux driver accordingly.
>  - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
>  - Patch 08/21: Improved commit body and mux-states description.
>  - Patch 14/21: Manipulate the mux controller as an internal node,
>    and update commit body accordingly.
>  - Patch 15/21: Manipulate the mux controller as an internal node,
>    and update commit body accordingly.
>  - Patch 20/21: Manipulate the mux controller as an internal node.
> 
> v1->v2:
>  - Rebased on top of next-20251103 + [1] + [2]
>  - Reworked series to use mux-state for controlling VBUS_SEL
>    as suggested by PZabel added also mux bindings documentation
>    on phy and rst side.
>  - Collected Conor Dooley tags
>  - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
>    rzv2h_usb2phy_reset_probe()
> 
> Tommaso Merciai (14):
>   dt-bindings: mux: Remove nodename pattern constraints
>   mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
>   dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
>     property
>   dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY
>     reset
>   reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
>     lifetime
>   reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
>   dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
>   dt-bindings: phy: renesas,usb2-phy: Document mux-states property
>   dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
>   phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
>   phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
>   phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
>   phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
>   dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
> 
>  .../bindings/mux/mux-controller.yaml          |   6 -
>  .../bindings/phy/renesas,usb2-phy.yaml        |  15 +-
>  .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
>  .../bindings/usb/renesas,usbhs.yaml           |   1 +
>  drivers/mux/Kconfig                           |  11 +
>  drivers/mux/Makefile                          |   2 +
>  drivers/mux/rzv2h-usb-vbenctl.c               |  97 +++++++
>  drivers/phy/renesas/Kconfig                   |   1 +
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 261 ++++++++++++++----
>  drivers/reset/Kconfig                         |   1 +
>  drivers/reset/reset-rzv2h-usb2phy.c           | 108 +++++---
>  include/linux/reset/reset_rzv2h_usb2phy.h     |  11 +
>  12 files changed, 420 insertions(+), 103 deletions(-)
>  create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
>  create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h
> 
> -- 
> 2.43.0
> 


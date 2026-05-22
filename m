Return-Path: <linux-renesas-soc+bounces-33034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGl4FkurEGrKcAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:15:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C540E5B94EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D832300E5C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B24B370D58;
	Fri, 22 May 2026 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XCiWhJDO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011017.outbound.protection.outlook.com [52.101.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21059224AF9;
	Fri, 22 May 2026 19:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477318; cv=fail; b=cnys2RIZ4YkhNjM1NcCEvzXJlP6A00f+zzPXUTf4ocoF0evuHCBIFaiyxL6EQCerxYzkgt0QDS3T4K7Ef5gh6o4hsXfKLMMh9W4lyF9bcRn/iJJ4IkDvzHLoBLF/SFDEfvwc+uXpan510aXBuTex2MFf/71UXIvx/8YxvMA3Sc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477318; c=relaxed/simple;
	bh=sQImKfkNGjof9mDktmwgAp76ZetGqxDGqO69nrxsNh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LwtbidHug8/zi5VHbJJTN8xeUT1r+ZgdgG8HSqWB4RTlRBFvVeLdjpOfkC6CGE+BWUlTs4+uidUi69SZDEdewEXRCWETnnZFV71Kb4e44a0SwdyKBuwFZ8S7xl5Rd1/oCbq+HhL0x2vk1TJCjlqt2w/ue0QS+4VmSyluWYZMI1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XCiWhJDO; arc=fail smtp.client-ip=52.101.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYa7nau7GKThjbgsyqjEwOqMQOGZZHzEaEFOAqIJlgiH0neurIPbn0CCloh8VEtm97HJb2cC5c4azHJW7SUhti03MUguzzaE0aJiwcxmhRS1F4obKAZ774KeCGAVqWcO6Nsa8zkvCnX20L+S6sbfBvAes7A59VTqkGbaDPmfytJHSSYKwLCbCiK0Vz4joET1FwGbn6sYZ4j8mMaBnz11ccq1umIeN6/Vd5fYCaSiWOGMp34zcFkF8Ex3AgMXywpVqkeMt0q1EIe9IxxIQnJ0aMsq2Q/nLpLOWEoj4KPB63/jDlwh+yzN+9UwX5xhANMFICNoQfxeVHRrHORy/EteHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+K/GJJhSDpStK0aFk8SgPr/IfhBCHsucA7d4Xf74g1w=;
 b=hUXtX/ySiNS8UOSyL3EfKBINtkWC66zX0WTdR+Iekfk/7jcIq9xSkwVBVPy9xqzLOErk0GFWGh2FPnp0BCLwIGqmOP78phJlQ7T/8VOLJUzir0Pa4C08dHZKA2Z6lGgefCY4lCl8o8VFa+lvk4OMVGxyXPGzX/XDP1mrybDm7DQgZKovyt3IXsRKhSwYD71Sz3FZy/3QuOPmUjfx3yPQn3SlwyyXCV0ygcjxEHhfbktRnEHgaqfGkMyIM9cx07GeSXbC/Wxxhteno9MS4R0A+BIlM2jcJUEpVciV/ZId4eoqjHKngaIlF6FwOREtUo1UNFFcLdnN8fJRtjxxYPhjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+K/GJJhSDpStK0aFk8SgPr/IfhBCHsucA7d4Xf74g1w=;
 b=XCiWhJDOmvnlBfSExL4jNksdyv+xZ0DDFryqdMJhO5oyrCcf6cqLb30uJ6kuLG++RsZkNdMagNRQExbueHgLu4YtZeLmWo0Ol9MTr6mCkB07Sl87PCktWqAuVWlkgKpGCfuO0RMhJOn5jIf4LyOEDFcBhu6TzwlC/a/HSuotfEINQaXxaNxrlW/6eMFY+5Dgm7mdarEOtMZPc/4/5AUx0HzuUR78nuYXFKpQXfwHNNJBgLb4MieBxRzhX1DrL9NESQOFcAxbHwsj8nG7v8iooClc42R97jFb1TJdA8vc8+d7ohGt5Hz4MdDftuY4Ztx6hnYyKUY7HESxVwKDNZCOQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10300.eurprd04.prod.outlook.com (2603:10a6:800:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:15:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:15:13 +0000
Date: Fri, 22 May 2026 15:15:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 06/17] i3c: renesas: Reset the controller on resume
Message-ID: <ahCrOed9QpKR5ZRF@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-7-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-7-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH7PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:510:174::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10300:EE_
X-MS-Office365-Filtering-Correlation-Id: e52b4ce1-9e03-4eb6-afaa-08deb8367306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|11063799006|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3MuY3bgLCY41KYZj9laL5FQ1zcx238bMo8YMXTgULPiwJBZtI0soagSP1PKHoZ6mfPTw0yplQEmLjlLPMV6eyUjzIKDzRELBnKYeWcBLLlpofvcc9WA1sD0pdXyN2r53DrNJu8d+GxXpBTFZlvmti+43qSEHNeUNTh/A0DaDa9qu3iDYMabnpYjik7F8f5SmLlQWQ8VGeSFHj4GuIhFu6QVI/aNYu44dZBjLAyUOPFgBEEV7ChvvtqkGE+IRQKdhtddqfodPBao5zt/zjjTERT8maTJ3NCu+xt4icMDkz60A4vGA+LPh10MAFtpZo863xUCfVCXng2DV3tkTsXN5Lo7/HWn3bDADK0gO1gpB5QAeUofSjATdhsb2JJXP6w9HbetnxtSZnVAFxN2XvcaQHapBGT4/H8M/+Rvw9lFLqNBCyI9WrGowKiHhcXTFY+hH9NBZDso6p7k/fB/3V46YQeIKUzelaZW7pBEhTe0froccEcvdSUZ2SS/utLafzZE09pLYHmYa0TTrQY6jA5bMPTWCzVkOVh9KrB6cGEFgl5hTwnBtSzyQ3JCJmtoYOX99oMDjlS6EISGUSfKpkYzBFcepXOeQLvPfcihqPvHL9oFpkRf5SDfDFo3wsbH7/+3XXtkZaajCBa3rrVFwFBbKr/i7oKKj60XTmYm6jdvFDU/KSG97lYThy6IDX9Z2fqcZsi3OZY83Ob3lq5PrNB4m76Mu0hXW9iSFWq5Ls+30t+7yOfJP9gdDHn2RwoBqrpPZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(11063799006)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D1HEQVcymqD4DTDTZrOjiABuZClhPoPoCAU+16jzJbhSaqEUnSAtD/w7kW1V?=
 =?us-ascii?Q?phWiIWyRcCuL1DM/MpeLWk8HOL8A/gjmmn8oUjawM8CF/roP+ZpVOageUzsl?=
 =?us-ascii?Q?vKlCJPtrE2qM9oneyQikI5UVD2b48mrtMgCOAe6lQV5bMi15v2Q9FSy/7tvP?=
 =?us-ascii?Q?h99LwLCg2SWAlAxxYVXS+R7kzAFTUysm++dIrBCg4xhWciQePJMdS3+9TN7N?=
 =?us-ascii?Q?AeRTJDLFEab5hUkN0pOsUa1GSqE0+dUCL3jQwh2V5scJ6vr6QOdb0euskEJn?=
 =?us-ascii?Q?yYkpyASYZXZJ8SWwVBQNzUUL0DfSzXzhwCRk1wLDmMJ4CdNrd8A4wa5ZGO3U?=
 =?us-ascii?Q?WOH+GF8GP60B+YiirrmB3F4E9m78PRaWOJgFGuYrG3behaP7mqhvxXIgwqz+?=
 =?us-ascii?Q?0IY+VcDAZSSkxLdB5K1eXD819aoF/stuYTNsLGUlirxO8OXKNtPx8utt6Fm4?=
 =?us-ascii?Q?mTysZwZXtsA9a2HSl4vp2hnuqkF3x/lSYKdZFpfXIv6iZoXnlg3Bzu0gGNJr?=
 =?us-ascii?Q?W/3n2uRgDjLDQM6uFun5muP03t2UMr7CHNojbjI7B5x3BOlxp+sq4F2eNGxK?=
 =?us-ascii?Q?+XqNpGhhqCaag/66L8YrSoLd2P3rx+0IazbLr8s40opWN1IZNZ+MYe7f/Oiy?=
 =?us-ascii?Q?uiIuloIIYKr+uHXk7uuDHQuT+1exmOOSSVb+kDO/cQQX7v6VdljWeY7/kyAj?=
 =?us-ascii?Q?qUvTGIPhwBIizH/w41zX00yP8/r7nQaMoD9N/Jhtcwhz1B3qVxE8Zu2+eNU4?=
 =?us-ascii?Q?vatsloVcHjnHWxX8IMId9t/1d3APk149g1rlzpIbNl6EEmG812p66rEYwaLu?=
 =?us-ascii?Q?PChzEdIoHFxxS3BrCkTrguGhDag22D9H9WvcwcIm16BSlgplc4WNG+HxtPl/?=
 =?us-ascii?Q?MbQQg5MffwTuNMU7AzZYl31IR8PEVAjKr2WOXvu5hpllA/UcH+BK+X/QNXXV?=
 =?us-ascii?Q?HSk0kAfHsMjnsAc+HoQnAtXhTJZUpuPB7Cpci38hXzoxMFHsLuplnqg8A5Yg?=
 =?us-ascii?Q?NHFDQCCdK86hKv1eW8eB9XjbtiCG6x2B75kceFIstp+2XQz6XGBOPb82CGHU?=
 =?us-ascii?Q?1ISsXJZiiElCvrxAbs8oiUpHa3FhnJ3+mTXTxQtLyhnLy9et+IVIeOMgaTQD?=
 =?us-ascii?Q?NLhfaLvH5j8BRI/iIpriRkJWzroJoqe8VGgX+mkVX6Hx2oz20ZaOY1dnAx5s?=
 =?us-ascii?Q?TcSEay9tJR6jFdjouvafYdjsU1L1UFvq7NDtGPujwbvnKD6NXXj+p6DPo6Tm?=
 =?us-ascii?Q?pEGJ9J/CTDzm6j3vgdPlNxWVP4Cbxu6p1Cq50OQeYpkWX7jyvaeqi4rctiMW?=
 =?us-ascii?Q?CAzTBdshtDxWeXwz/7pHvvgP7Fe6eKsWwXoJRoedgfzd0/hKUmZkuBiu9DnY?=
 =?us-ascii?Q?dQQu8PyIqjg9T6FozFVZZI824V/aXm0szqLechiVKQSt9yKAln/BhJcn4gpg?=
 =?us-ascii?Q?mlkVntHHXIhPra5Z416RPQU/OPjz68vpEDuU7vUSMarLE/k2fr0kJd/wzUe9?=
 =?us-ascii?Q?NNrbKbtTYB14zskacLN8C60mYhlaHXRoNGI4ikcaFQIg/U/uSnzMFEXWxBAn?=
 =?us-ascii?Q?eFHxo/91Cv9ug1yoDO6KhjRii45iUY4ZFVVMsDAtIq62t6pSXSHvyzkkTWll?=
 =?us-ascii?Q?AXjhwLlkmAhYPe4FoHzcQHZzDNpBYhesSHvC2bPTzkpMfFo18ipQSX4HKWyQ?=
 =?us-ascii?Q?aDw5wB/qWXVPXkVtlyjLm4aD6kKnOJAHsr1I2DGt/n30IHip?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52b4ce1-9e03-4eb6-afaa-08deb8367306
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:15:13.2246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpI3qJ8+ffxCZIrlU5BFFtP5HVmhgH/aB9ZK1wsDyaLa6UttYLWIVeA4JK5cjmzHj2CoUzSfVtcfBBlC6jb4kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10300
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33034-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: C540E5B94EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:04PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Reset the controller on resume after enabling the clocks to follow the
> same sequence as in probe and avoid potential ordering related failures.
>
> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

Can you move these similar stuff to one helper function to avoid duplicate
efforts later?

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/renesas-i3c.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 5174a390d668..2f3c6ddf75c0 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -1464,6 +1464,10 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>  	if (ret)
>  		goto err_presetn;
>
> +	ret = renesas_i3c_reset(i3c);
> +	if (ret)
> +		goto err_clks_disable;
> +
>  	/* Re-store I3C registers value. */
>  	renesas_writel(i3c->regs, STDBR, i3c->i3c_STDBR);
>  	renesas_writel(i3c->regs, EXTBR, i3c->extbr);
> @@ -1483,6 +1487,8 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>
>  	return 0;
>
> +err_clks_disable:
> +	clk_bulk_disable(i3c->num_clks, i3c->clks);
>  err_presetn:
>  	reset_control_assert(i3c->presetn);
>  err_tresetn:
> --
> 2.43.0
>


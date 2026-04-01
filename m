Return-Path: <linux-renesas-soc+bounces-30686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJD7EDv1zGl9YQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 12:36:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF0F3789AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 12:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE83730BE6E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 10:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504253F23BE;
	Wed,  1 Apr 2026 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Y3JIdxVI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692583F0744;
	Wed,  1 Apr 2026 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039162; cv=fail; b=SbjPlTYOyDjqJNZTRq8kPCIR7FH0dIvmAw1w066SHn8iKiMF7DYjQ22eyutWFElCdHNHmfxFlD1eFhyW4A5u/1Yw0j2RA4fnYw7AHGzpOACD14imvyd/xkZqHMhu7IKtqB/SxfLrxjeChrR5Vqa38OvfJxdgvA7dr8mR5NixYmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039162; c=relaxed/simple;
	bh=gQSnU5mJDabxLQawujuv3r4iHj+pI5T+KHLDEjEQn6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qx0MgRnHdfErOots+LXXk1U6v3HWUBrIXr1Ut42jwXppxizPWv90r+nY1OBFmjZHfu5RKmXtHqZi9ACnqdsjPsoj5vca0+b92XfPVhhbDKDY2PZqL17CnsAWJvYFHbcNa8OFsRWgmoIkM0597I3xBtecSPs2dElsg5BDfu0hycQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Y3JIdxVI; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvE2bzyCgQ94ibvGTk/ZOUbaZj2nJSeXrgn79SMfw55axg2JlqQ+hn5zxxVEpMG05hxIMaCjmqW+am6Mo8x5Tq/g51bMIKxz0BANBzdve0/KhzK/WVDtHTlhynXIp88x90g4Zj8VT5uTJv9ZJx5by8T/WJA/71vrY/EfO/qXtI67AWsOPAEJDf5sCw560daCfSWmOlcsiGEaQyKINkVm9NyiZnfe4xnN8YlT5Zusl3VpKZrzDn7drzW7g4ifIrMSzGzukmtrbg6A1er+jH/d4nGRPHKF2nBJnaAyIQnnLaabbP+ZZJFFHr1vtv1gnfKok3+2Pq0gL2wpHMv5p0xLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikuXQ2VSrUHdvt1y9k1R5uoTk8EntH3iQsSlBjTdQO0=;
 b=MaKLxhLxDS2D12ofRnXN9r18BEGMSOxOOXQ4jhFelI4OfWsPknmGKNQpq348ULEN0rfU3mptnhUFJsyx42LjO51ahhoX8zR2bRsQ/FD7pHJrePzMs1/dQcFczrA/yN4xLpsM/UDNWnmhCf9M4oD6P3t7c+yPSDzoMNwq4MLNfv1I7PWG2337F3fKQHj5VnWsU8J7AU0/kBrpGdv3yMuVkReufYu17668hUNnTVvq9BsTW2oESycoCyqRDbfB/jGDjqwblQMnQhfWVY8fr2dwR26x+aXxb+5oiwk3N/hPXGVKtziDy8Dk8TuiKME72hmMfrdy1plJ+RAMSz0CFKfoLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikuXQ2VSrUHdvt1y9k1R5uoTk8EntH3iQsSlBjTdQO0=;
 b=Y3JIdxVIP50uqmyg8qsPOLxn2lodnX9AhKXIWHSE1pQDFMb5DmCKdItBNp0ZFgD/T6KN+5ffQuQdK2HOZPSJIFv81AYDa5ln5WnIQk11zVSwx9L5HVdhfmn1TYNyLzKWF3gzD7EJUyA+SUtyBOix5iUQlZpRtUw0OWe8AzfKP3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB12304.jpnprd01.prod.outlook.com (2603:1096:405:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 10:25:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 10:25:57 +0000
Date: Wed, 1 Apr 2026 12:25:36 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: tomm.merciai@gmail.com, peda@axentia.se,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Josua Mayer <josua@solid-run.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 5/6] reset: rzv2h-usb2phy: Convert to regmap API
Message-ID: <aczyoGDHe_PtwUzj@tom-desktop>
References: <cover.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
 <0259040014396ea03d58a87c2ce2a3f9eff2b0b6.1774601289.git.tommaso.merciai.xr@bp.renesas.com>
 <283a6336658045be8906ee219620c994e85c7fb8.camel@pengutronix.de>
 <aczRo8HVUFqXKfG_@tom-desktop>
 <0bad9579a953cc069e17a7075a45c9eb9c7a6d8d.camel@pengutronix.de>
 <aczhCMdmi9cpkGkM@tom-desktop>
 <7b5c5300921c9d7c931389400cdf6fb2b74ae3ea.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b5c5300921c9d7c931389400cdf6fb2b74ae3ea.camel@pengutronix.de>
X-ClientProxiedBy: ZR2P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::10) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB12304:EE_
X-MS-Office365-Filtering-Correlation-Id: 57c05e3f-3f9f-4875-cc96-08de8fd90fb4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|56012099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pK1UUA8G5IByoLm1oghYb5ZzHI6l2b1tz9yAUR0fGcuETyRUsCi1BhVTJArfFJlpGUVyLUOGaM0J+8Fc9ulsP2qbvi6GF19kUWrF5nRbOE5EMAeRcdy7AbqtdQv8bqV5X5UMvhjcVA9vGi4YBnq7g5x8N3Xkfaryu5HswIQn2QG+ZrFvF1IAEwPBtoNw6J31FRZk796kxDe68KFoOXdG3E+ZpTXbSid1Rh4HEbolEZ5sVXlync8GtN2BcoBdWLFBmY8WUdLZGQOTiUty7jcWpUTSoStSO3BBC9bnNBTOx6QpwrSyah0RNaUXhEpDlw/Wlv/V9ku1yvwx6agY07nnYAcpzJsX27Da3KtLgivK9oXDL5ds1JrOo9KIGwMaPMjJ5iaySk0Wen1mZYZbXOmDbMIBWAn0p238Wl1obu8Bf7F9tEwbrGaSTpJxodScfgo9vOq8e6BNWsAAkI3sNZvcDpB1f/ZxgpH0JGMcl5Z+tZmEeTGcMDe3zqJGn088SJKAJ9cUR30tPe6aDl4K3wsSh5VDQCgX9GI4bsmvwPimVdbs/YD3RyIfM3XqLvC/o6sz63pV/bTCFUVobnsCpKqwgPDBpViprdVWBGSq/QbbWIi74TJCGLfepkCtgVRty1lilS+nH+wpCUtsj3VrbKdPnv7DSl0mOHSQgd0ERXLAxj2iC5zKcT1pGtVhrofsfqUs+1si/ErrlYjsKpTbIiWZk3oiX2yEROjDSSXN4Tht21Tk1Qjeg2icezAbkr7H+nvYgX0vA2iVdEAkp+Xnj4PWgyDK7TJGiSRixkUE0rvWUqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(56012099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rkZOw5JjvAuVeA8hKAJlSJPIoId6qEKrKXSEIoAEReFvThu3au4LphSvUeym?=
 =?us-ascii?Q?V3sSsqe9AJJFTpQhwxFM3sA7EF2qbn51IP5nzcgdZ9xUr/K75m9W9qRmiTSu?=
 =?us-ascii?Q?VZAQIu8igOhyExYfEHplrKQE1VwdK6tqP4H+e/95vTayHzUcty6+SAdXLpRV?=
 =?us-ascii?Q?q4PQ7TLGy2BTMXfe6ymo4PF4PGCHFrgBkFpDtcywwc+8Dcw9TXNSTWVHvcu/?=
 =?us-ascii?Q?95xk8pg6zGUtcDZaHWO5rwoRAUCVaFvSYj/2lwxV3GvsPrwtdItoZtV0WQp6?=
 =?us-ascii?Q?5BSNw3jOvC5VN1pUrXQl8GpXQ4+32DN6fCAJtbqifrGsO2uKaiUNxq9g6n2b?=
 =?us-ascii?Q?QmwL7PJqsWKF6bSZU2T21CrG5rFmWaNFjqotHyQShqYVEZ5tUePzxBcX520e?=
 =?us-ascii?Q?8uPucOPYDnUlzexcUZ1/3PSOL2suME3Pja8x9bv2tZTincP0LSu6HN2YfK0C?=
 =?us-ascii?Q?EymhtIp42fo3YZlSBvN4dg8MI2JN6fPpbGr35kUaizUZYrIFyqeKTqwLpksO?=
 =?us-ascii?Q?nFFuQgHyTUDFzuwNp714szclKBpWvBb0v42753itJeyccS/GclzBg2Fg+YtL?=
 =?us-ascii?Q?JM23grX5cMg+JTz+x2XJY+x2xSewLS3mB2FDosTfzjwQ2uZpMt8dEcEfDgc8?=
 =?us-ascii?Q?grRPIkq8aN+NdNOODe+6exndbUNtTcTH+XAWLEhabbCBSNcwkqSueZisDals?=
 =?us-ascii?Q?LbxeC8wwzCoyhPmFFqt1l1v7bAtvjRtfXFHd8VAoM0Aqvofedixc33qMskgU?=
 =?us-ascii?Q?Zpc1hlZbt9rqdENWPx0hY2yVSeWuva39nHAEHbitqJtk4St/wSIJTfmBfDsy?=
 =?us-ascii?Q?PYG83ZcKSMik/FnrRfqirMwe+I21aW+AdUGISkgFlx8Gt8GTz869W5xmq8D+?=
 =?us-ascii?Q?hKoBlClBtsVPtdRFY9IcIsJ110y+VXL0T9+x+UTf1rtQJMAqoE33cK5ZXnkr?=
 =?us-ascii?Q?0sdwOjO7AtVvXhmj6UPAqbjLhxVkLnQFTk1Xr2y/jG0FRrTSyoTqQAfu9TeU?=
 =?us-ascii?Q?JJo4ZVcpi2Q/VqDs6H2i6OMCIr872Sn08TNOt0x3GfKeq9QulrlpicjCU6+n?=
 =?us-ascii?Q?HwBT3XGrjmRZSjHvbmamao9asBusVzQSNOhw7IV/A8Ipq+twRVKq24tvPY1T?=
 =?us-ascii?Q?ll0xj3d6s6389qArxTd9/YQMdJ+HvKli+aFsPYCyjooCPMgdLduAvlrgsOPW?=
 =?us-ascii?Q?S8B2bKSvcX+16zMXElU1wflrWs9kseDRqbYHdSxt0GSepi68lhiUT3oEom0R?=
 =?us-ascii?Q?ud2HOIsZ+HtlM+fs0mK8bROcnc00/Bp/Bp64nsGAe5WH/oAZ4ZnxuQkJcYkE?=
 =?us-ascii?Q?zznVczpu6Y0EMb1IjXrqJp7Ks1guZIEIyyu6aiSIfNlBeUxcdqcPZw6DRm8J?=
 =?us-ascii?Q?a+dZSrl5AStoZna5IYKIp8gXJnMLhEJd/Fckpk66FG5kbDn3S+HOYEbF+U24?=
 =?us-ascii?Q?Vb3fkzRCur8vyqr3LG6wXLlHfm6k7UPlpTKBauuQeFQXT96ddbAuxHpKC699?=
 =?us-ascii?Q?rjGwJ0QYFs5ZAQOjghgaZ2ywWVI2W+j1liY0Ma7ZK6SGRPpHeKs//ulG3x5/?=
 =?us-ascii?Q?1D2eXX4fFIsypTEilg8hKtd49AFs3zdMmalTqVCy12CEuXEhba+rwwlEuegw?=
 =?us-ascii?Q?Sa8qX7KAeziuHKQFLknSNNMKpkcQSXItoyl2ZZ/ufwWJnGbNnG5CdSM7doS/?=
 =?us-ascii?Q?cpdpQvWymydmk6yPLYQWMLyEwauGMdI5dkN/3W8sykvldfW4TXytiNymj09y?=
 =?us-ascii?Q?4pTSw685eUDYGUs5LLrz5m5mkJmZQOZknq0BXvzBIdDQ/nGwGZwF?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c05e3f-3f9f-4875-cc96-08de8fd90fb4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 10:25:57.1051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I75i9x/7TzbX7cFZRsdwPStJRUeORCrfXXn4rIP06rsfFnSnwbdirOy8Ia8JT2htkZyhEpVYpGUKc9FKUmzHKxvdizwpFCNyNPDvvki9A1hnouziSPK1ji3+i3Wh9n3i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12304
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30686-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,axentia.se,vger.kernel.org,bp.renesas.com,renesas.com,kernel.org,glider.be,linuxfoundation.org,solid-run.com,linaro.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFF0F3789AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Philipp,
Thanks for your comments.

On Wed, Apr 01, 2026 at 11:25:52AM +0200, Philipp Zabel wrote:
> On Mi, 2026-04-01 at 11:10 +0200, Tommaso Merciai wrote:
> [...]
> > 
> > Then we can have:
> > 
> > static const struct reg_sequence rzv2h_init_seq[] = {
> > 	{ .reg = 0xc10, .def = 0x67c },
> > 	{ .reg = 0xc14, .def = 0x01f },
> > 	{ .reg = 0x600, .def = 0x909 },
> > };
> > 
> > static const struct reg_sequence rzv2h_assert_seq[] = {
> > 	{ .reg = 0xb04, .def = 0x303 },
> > 	{ .reg = 0x000, .def = 0x206, .delay_us = 20 },
> 
> This will call fsleep(20), which maps to usleep_range(20, 25).
> Please comment on why the delay is changed in the commit message.

Ouch, thanks.

Reference Manual says:
 - This reset must be asserted for more than 10us.

Then I think the right choiche would be:
	
	.delay_us = 11

This will call fsleep(11) which maps usleep_range(11, 13)
Please correct me if I'm wrong.

Thanks,
Tommaso


> 
> regards
> Philipp


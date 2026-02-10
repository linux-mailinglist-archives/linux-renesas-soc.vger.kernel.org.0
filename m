Return-Path: <linux-renesas-soc+bounces-28142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFIKFTNVi2k1UAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28142-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 16:56:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C4B11CD39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 16:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27D9A30480DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 15:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A526E385EDA;
	Tue, 10 Feb 2026 15:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="sOLERmMw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021112.outbound.protection.outlook.com [52.101.125.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F5F38553D;
	Tue, 10 Feb 2026 15:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738977; cv=fail; b=Qlc1ec0+uxT25c9moWOIyqnMr4yweFNDxCiXHRvabbcsCzFoanvKMrbihbzYo9COucn0Ku7ebKPBVbDiJiBgBwiykIJOTB6/P2i2HI+6ccKBvVwiLVhPEnFFLQsRsNOTacZsf1uNvpBhC9eX31/t3SdecGOS20LZ2A1wyOZkZXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738977; c=relaxed/simple;
	bh=33eYvaubv4rbprzGccx8V1bUTRPD0UmPsqXxkFxJ9vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dNeXByQz+X4IqfSKA5hXeUT+487TOJv8OlbkXSFOZfopPCvjYF4I0TAt9DyISTUTKMr0/uALSvmVkb4saRzQMdL3MrPrwzOnk1fF3cGrJwXjQQevkuuM/ckib4wJaHkK5cIKN04TS7LlHQeF5KzsBBGgZxNW0uW5hsjlbNlk74U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=sOLERmMw; arc=fail smtp.client-ip=52.101.125.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAmfghAW4t4jEwXmJSWLI7x2jr8U0sHvIvOA0VN+3TRaPc6TgKylEZpEZv4mSIMcD9Q8C0KuFD5/OJ13Oof9y+iNFqHLO5tyBSZVal6K/90dR6pYeSwjjyxvkMyNTDSBar+rrgpKJv4bfC0z5vtW/kCtmwnmcvFXIhWdDrLkE3Kx6AcnrjlXzwuw8jY//68g9yB/sYZfkb/yLvyhHX83xh8ZLRNOzWFajAtolcBKaY6QsQbeXTk3RFqrXawxl0JRbt7YpUVM7XKzSo57sxOKfzuu5t/Q18rcGYqadHiBWscZf3mBXiUOoioHdEnELfdPR30fKvH+rqASKxxHK6jUtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCtwLVBamWu20MSaY//BpkL2qAFYuHWENZUYn1Ec5WM=;
 b=OgsZjuzkSHFR7DFcEFl8zbMRufnD/LZhQKee4StsZiBsw0xxrjr5qclSpwCcrck6SKZwBsY7Lw6kh1wNIVMA7tMNbQUbL4EofmpiaRCcXJFHBbifQMfM9wN2JhZ+j8BtOWsFnyGgjb0BP15TdgQ35SzuAalIXE390rL91DSJaYPKSNMlCtmlc9FJjq42RSvLUp9lZ41mQ8jwNQUng+11g99yLdBqsSt50eENoLi2tzq9wQBYVBFAVme3SgTZqO1mV24Mncpil4uU1izH+w/LjM2Wn3P2Q0UZN3pZng1UYHIAY0Ba/6lOPgMZiAvrkjsHTwDmo1h1hUBKp4ol9V7xUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCtwLVBamWu20MSaY//BpkL2qAFYuHWENZUYn1Ec5WM=;
 b=sOLERmMwqv4QLHsxhJ+H0FXlmGFMop454oOr0NhS+xVRjUmVippdSNFkbfkWaMJVbvDRaKcg8mIrDOHkv9XpRVTEwA6iLWD8fFO+SgbyPd+fH4DjtdjWFhUPgZxOikXE2TgngB4f8T5/JgzF7aXdFWcn0lrIDiq5gmsS6LFtmxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7327.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:352::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Tue, 10 Feb
 2026 15:56:13 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 15:56:13 +0000
Date: Wed, 11 Feb 2026 00:56:12 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Niklas Cassel <cassel@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, geert+renesas@glider.be, magnus.damm@gmail.com
Subject: Re: [PATCH] PCI: dwc: rcar-gen4-ep: Program Resizable BARs and drop
 1MiB BAR limit
Message-ID: <3etnjc6pw2cpuvbdyl3q7rwkng2enxf63gtmpwk5oukeojwwtk@57o7h24egwfx>
References: <20251023072217.901888-1-den@valinux.co.jp>
 <aYsHjNL_c0Z30-KH@ryzen>
 <5kxesjz73i7gpaffna56buhqwmmqrukuyyg4lnlrmbylmmd2qy@756mchjaouz3>
 <aYtPzCDH7ZEucnjH@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYtPzCDH7ZEucnjH@ryzen>
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: da41fa48-19b7-4ed9-f129-08de68bcea75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d3Sr05PLXkzbjoTY/Jd9vwJTgRuwY9m6t5p0RgbTv5BUVRrtlmweSChcJmVP?=
 =?us-ascii?Q?g32HuNSFzCnQ3UkkRGopNLtG92tsZ6fVUpqSMKriJLflpm7w8Vhfbu2xpWKN?=
 =?us-ascii?Q?G4TdEyToCMO1rSxWxO4/PODcRBCPoldRRuwUnNxOdbgAZVPowCKFe2erHmeo?=
 =?us-ascii?Q?n8iCsdjH0ZSCZEZnjC6NZw68ViIcF2V6ssVZV0vAPFTPyVFsMyYJi85mKxKA?=
 =?us-ascii?Q?s7azo5SAy9mz81/k+PIfGTK0Zk0mjMwNX6CK1pUvjqKMjFVZRyB0u8HafEkk?=
 =?us-ascii?Q?JQqR9n7qoHv06qffuy8osFXczGfbIJpIwhiYz9J9XNzP0uTb0g1PIgBlvUCM?=
 =?us-ascii?Q?EH0ZQ+mJ/sVbTZ0a5HDfhDW6J+CvrmpQjfH/pK+cwkaWMypt68rAtyGJEh73?=
 =?us-ascii?Q?NrQK9ab01As1jmnCfwnQVbHkAIVWMwsJHLSSnGSBxphAf04tjIJ/NaRBrWFa?=
 =?us-ascii?Q?yMvU++kErMLTTlZs8mlJTbuiCg+3FmTlfXO+qSNtDh9ozwDYfO9s/mMducxv?=
 =?us-ascii?Q?6KAXwD5yRxImqwMr6Irg8QyFq4Q/UDUxhPm9sTafpbWfoz9HbSEO+z7X5sfG?=
 =?us-ascii?Q?LzzvkI4sZe81QAdM2K3e4UyABLrXjYUOLKCeuKtjiVHDB2lFbXVlXdh+amWK?=
 =?us-ascii?Q?xdcXfb363NOEUGttyIRI6RCQEiUV0DjxHIIyyAYCVB4oMOa7bwlyu7H+q2Tz?=
 =?us-ascii?Q?T8iVTEbpYUvGmS0/CRxk2jkbNUHzYn4RUvXC/Mmced/kz3MQqI9x7LcQNvxK?=
 =?us-ascii?Q?mUeR3a7oBUMF2t65QRgJC3ki8XVNXO6n/fkws4ImHwm0tEiuaQzt5KJH9Tt4?=
 =?us-ascii?Q?H9cJFY0kpjmWKg/Q3Rosk42yVBSS+tiiuUrlwBSwb33W0ifF8g11Y7L7oiJM?=
 =?us-ascii?Q?e3wtV4C9RPOn+AyrU+mdxvo2OFmb2X0a/vjBq2+rh9oR3QhvcIt25SBbQTVQ?=
 =?us-ascii?Q?DepxIrrmAk5C23fd3B5glynYbvTPOr9SnPqRq3J4W75TXSvLPA7CbvxzgI5M?=
 =?us-ascii?Q?xf+epnxSe92GsYVZOvuco1MRX8gWr9XxmhqukLCB7MkldMTnF9gz6FL0gVJd?=
 =?us-ascii?Q?cE7OYiz6vxtAgRtjSYlBmV4CSs0PzsmmG+2q1osDR4MO9sTFJ38UWHgRo+E0?=
 =?us-ascii?Q?5NhykcO1RuOrgraFuBLEeiDTxNwWLDF/JAmIbD8wXmPM0tkHFWnRf2GzxZxh?=
 =?us-ascii?Q?J7GoOrjTd40GLUX6b7WjLanG6ORdQ+5YBHECK9/bDQv1fA8Okf/pr3PIVBjt?=
 =?us-ascii?Q?isTEYHYfHWNfrpISqH57RKFXFbWbZz9PPYEftiUH6+MCyi8yRq2KkZrgPtzC?=
 =?us-ascii?Q?VQWBNEjVYiCryX5PtXOsiVDH9s3jgrM05/xnP7w23qbvQX6fIjewF/S4cbfA?=
 =?us-ascii?Q?cTaCFCTq/GJxogNcP/odI/dqNa8b7RaFCn1905eipzeIXWJ5FaVqAMTbrx7z?=
 =?us-ascii?Q?HQLiIlVnjEvwNRn5KjSvCnrPNBJDaAK/zAF/+IrBaHYpOij5aT0pT6Fw2geq?=
 =?us-ascii?Q?IHfoBJjl+PR+4hSzSeIyX/RVjBmfy5NA2GSteVwYsTf3pOvTr/wxiYdWAImf?=
 =?us-ascii?Q?qMaX13zDxEfjA3z4Cyk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?58NsXTpk51bGR0h59coVino5QFHr9glrIX86IMUKXctzEe+RzXKA4TwaM4lp?=
 =?us-ascii?Q?JUA2Md3Svc0vAuV6J98NrURAfJt99i+Gnw5spkuiMzcdfznN2SpR4nt0p0WT?=
 =?us-ascii?Q?/NyleGPVH2BXXEnB6cQoLa6MRTdfzbedtnKaD+RwsGSc0f+B3ETEm4xrFBWh?=
 =?us-ascii?Q?kJhJTMb+/KPCSXqwMb7v61c7FwAbeeIkPzI1a12sq9b8zw1KgzHhHc16nMmH?=
 =?us-ascii?Q?zG/uhmB87UCNQ/Xck6m+Z7k5wZRWo4yEXNwX+YO1n52PggKSpsw+uXqS4SKV?=
 =?us-ascii?Q?Nm20XwJ5BLPiX4gQwGRmQzirgCyjG8UqIkVT4XVpkbjbV+mI9ObINUvhY14g?=
 =?us-ascii?Q?z2RisgoVc4feM0u5McRSYVpujCOmxGnLHrpmCHEJGIBdhX9XhfRc6ktSRfZK?=
 =?us-ascii?Q?v5W82GC3PHDRil91c6SNuhMVlounh5y5gXB6nZT+1ieqwHQaGyk1r5fwM8GR?=
 =?us-ascii?Q?m781MIKxYEPdmmMfSkz4xdp4R9UeG5bmOUTM9eCekq+WSts72IZgXtysZXWZ?=
 =?us-ascii?Q?Vh2RQGU+Iefr6Qe3J5qJBIs/dqrsyB1yygZoGS3puulkikQbe862nhAnltig?=
 =?us-ascii?Q?SPLVpq3bByBItckZvUlALz/GvQ5bAEASj9t0SxAWx/ikbAgdbc56BM5fbXcd?=
 =?us-ascii?Q?1m7IKvfC+FumOkev1mzjcn9bsBYIFJYYileEcLrrSDQJh1qbl7GWsya46Hjz?=
 =?us-ascii?Q?29uXY17Z/VhZKlbe7k//BxWBlho7dc3XiaBnUBMznWnoIWYiRXpHuvO8AU2J?=
 =?us-ascii?Q?YC4G8Sn0+LXD9Av1dvL3kC8GW8h9c/aiMLpbo7Us0a5W+SCw93o8U76/MCat?=
 =?us-ascii?Q?pJEjLv1YQPsn92LKP1to+dFvnHSEA6A1l+dBqv1W0Ove5+5SB+QTmvSC9zC9?=
 =?us-ascii?Q?RQyxw3kYbpN9r1GFuIeYU3qVMarlBW2kY/1wcKf8mkJ+zYC/j19kH9lRVrCw?=
 =?us-ascii?Q?HIiLx/xhLiydPKejHB8AybFWq5OJXEjTwgY1JHVXX1W/TqtufjQu9LkHZtde?=
 =?us-ascii?Q?nrLsd1vkO0pbdIpGyNauWV5pu4DISiQoP9RdZDLz6A/d1qAM3NOqWfOOBnpL?=
 =?us-ascii?Q?sKnNuQoNv7iHqcx9+7dQHZxNsT3Ff8crsPi59Fl3VIUTe7B2mB/AK/OhZtYL?=
 =?us-ascii?Q?aHBYQe6ZJFD6zUk7NVkeW28vIsCcotU3UkkvQoG5mJvzluOep/zvXITSjW8W?=
 =?us-ascii?Q?JCeAjVf+HQKVJ8f2sVNrUKWmGuHWOKw9Pb+nYUmVqfIQB6XZvQ1cA63/XQcH?=
 =?us-ascii?Q?fMQ3VGRTt2CUDO22Spc82bQoXDqaISUJmsX39LxPEYSJpCwE7dqo60aLgpVK?=
 =?us-ascii?Q?JnS0z6P2cezDS9ATxzez1lTBvliATFfuIF+wLZz5fvrzUQ7YAHcbEzuw01+k?=
 =?us-ascii?Q?49nPRdC/ivkxETIbeoNOQzpijmjrKX6W7QxMEoim6gYGBocrU1ymUSd1lFCx?=
 =?us-ascii?Q?xMVbG3iwS2+i84YtOUoio8vf0qpuYK2IOLYh6mhja0qI0JU08ikPPdWgUf2P?=
 =?us-ascii?Q?TQtLpC5xh3WxaqWUHcMiG1/fUkLy4ZhD2jAl8vNvP1fG13ZNmMtcBx0DrZzo?=
 =?us-ascii?Q?kBrLyZD/p36lxNOROslzRtHlS3qwmaOUkA5NpYrWtIvlzk0rf5+mHpK6ljWu?=
 =?us-ascii?Q?kpMyCkkph+KB3w9U6XlW6vWdbdkLT+rDUYHwKXAkzeZJijcxmz8BWDudnwe7?=
 =?us-ascii?Q?8Y7yTq9wn2o1uhLQSk0QjZobW5RWxAzSOMj6p+uxyxSqRiBpizP3FWgVmiLW?=
 =?us-ascii?Q?Lg87hUgtCiDIDUyJgHYHdNflayOy92QVPyfAOFd2Go20HKv1Pjqw?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: da41fa48-19b7-4ed9-f129-08de68bcea75
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:56:13.0419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYQU71oPmhEYNikH8u4uCxc/TpufaZwxOcHJUFQNcTFkGk4UX3O1n1ijqa39wtj7aoHQCPxmQ+rUXjBIcP+zhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7327
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28142-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,kernel.org,google.com,glider.be];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2C4B11CD39
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 04:33:32PM +0100, Niklas Cassel wrote:
> On Wed, Feb 11, 2026 at 12:31:21AM +0900, Koichiro Den wrote:
> > On Tue, Feb 10, 2026 at 11:25:16AM +0100, Niklas Cassel wrote:
> > > On Thu, Oct 23, 2025 at 04:22:17PM +0900, Koichiro Den wrote:
> > > > R-Car Gen4 (S4) exposes BAR0 and BAR2 as Resizable BARs. Program them
> > > > accordingly by using dw_pcie_ep_set_bar_resizable() instead of the
> > > > programmable BAR path.
> > > > 
> > > > Before this change the driver left the Resizable BAR capability
> > > > untouched and only wrote the BAR register, so the RC enumerated BAR0/2
> > > > as 1 MiB regardless of the size requested by the endpoint function. For
> > > > example, configuring a 2 MiB window for pci-epf-vntb still produced:
> > > > 
> > > >   ntb_hw_epf 0000:01:00.0: \
> > > >   Size:0x0000000000200000 is greater than the MW size 0x0000000000100000
> > > > 
> > > > Program the Resizable BAR control so the RC sees the requested size and
> > > > ntb_transport can use larger memory windows.
> > > > 
> > > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > index 80778917d2dd..dbad741b8286 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > > @@ -421,7 +421,9 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > > >  
> > > >  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > > >  	.msi_capable = true,
> > > > +	.bar[BAR_0] = { .type = BAR_RESIZABLE, },
> > > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > > +	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> > > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > >  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
> > > >  	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > > -- 
> > > > 2.48.1
> > > > 
> > > 
> > > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > > 
> > > Considering that this patch has not been picked up yet,
> > > perhaps resend it using [PATCH RESEND].
> > 
> > Thanks for the Reviewed-by. As almost four months have passed, in hindsight the
> > commit message sounds a bit too awkward now..
> > I'd like to update it to at least remove ntb-specific wording and make it more
> > compact and concise, like this:
> > 
> >   PCI: dwc: rcar-gen4-ep: Mark BAR0 and BAR2 as Resizable BARs
> > 
> >   R-Car Gen4 (S4) implements the PCIe Resizable BAR capability for BAR0 and
> >   BAR2. Advertise them as BAR_RESIZABLE so EPF-requested BAR sizes are
> >   reflected to the host.
> > 
> > If this looks good to you, would it be okay for me to keep the Reviewed-by
> > tag? There will be no code changes, only this commit message rewording in
> > the RESEND.
> 
> Looks good to me, and you can keep the R-b tag, but if you update the
> commit message, then you should probably send it as V2.

Will do, thanks for the confirmation.

Koichiro

> 
> 
> Kind regards,
> Niklas


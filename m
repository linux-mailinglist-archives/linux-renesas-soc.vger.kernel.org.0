Return-Path: <linux-renesas-soc+bounces-32502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOARNTVhA2r65QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 19:19:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D426525AFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 19:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CD88300645F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0F63D5C22;
	Tue, 12 May 2026 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XcJz08u1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625823D5C29;
	Tue, 12 May 2026 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606388; cv=fail; b=BB6CgvaFNAkTMH+SEPP+b9SPSwwLniVQKVbNK7/MyfxqUeoh/dJ9l+L3GRcwVnbHiHYhsIDikEudONg0sttW/RoEQ5Z00uhVoiHKxy6C5skGgeBX5LU/kOkkxc6/2fGeRK28bltauWne55bbB12WjIJBh8dj8ucZSgtJjTmcWC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606388; c=relaxed/simple;
	bh=/MdWfa6SZtBUwehd3P8YJ0VRrT52jHOA6DGWDYHikJg=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cpRKy0sroauxXUmPFn2APYSQ2S0LG3VA05bmQ8qAa+30Coh9plMb2xJDm0TFOC7RPzGpoSHcT1eJgiECNRrlD3iAU3U4Z6f2ZjoaFAErbWyi0cOwF0cUzaqM5j1j/I0X3ctio1ULKNcYGfq2zm5jur/zVvPOn2wzh2S9VdW3nyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XcJz08u1; arc=fail smtp.client-ip=40.107.200.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0NNxBv9VAjlbtdrsNK0rYPJ24M1wRHh6gWeQfBxdb3oqc6SBmQgMusno69qOiXsDaPB8CqKM8lqCd70O2y/YinXvz1IKXqaWQ49RKbDJ71MizHd7Y08KmnFlyCje+HaCLiYDfD7UBLb4JUgSn5iR487gZay4GkrBs9bTTJZ90vEyyBFf04Ju+tIru3bbJXoo2YcrFrWpHm8VWbE18VUN3PP7V4qIc2Or8W4XxT2WplWxHK/PthV1EBKMkVHHHGAV2EpQk592143P9aMDJ4vrCb2bl4Lsc7C0UYRz93YXrd0d/lAc/C4gUDNMYxtNGW/hsxlF68fZ9U/+AjutO928A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cy+7exeeIfq5FKQxMtjAscZFi7SvMoUT7upvgBBofQk=;
 b=t59MwtuauLiijw/taTyG6P/I/Xg270OR7/I7keWrVECY0Q13wMuZ1QitlRZPpZN8xuFTntLeXRm2YyGsaReGms6znJwIAi8KPZ262avbCO3M6zeeO66vudstTtpux85WSnRNeTpVq4lzjCHbOZIBu3tqwJ1pyE6xGrWmI5UTUQzWExqpy/xK1xluYRC/GCKZzef4/f6HA0Mv7XUfcPGy+Qf5/k+sVpJ2w2SNlLkPUUIAxAQSe9cwvGBpCYR0w4hDoEARme0gLXsHSEVm+tBkKYTm2Mt1wDm3YZwGJiNOKjXr66JBKItKwnhJr1tV3xjmEuqsPn8Tw1gIaW9tXHcWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cy+7exeeIfq5FKQxMtjAscZFi7SvMoUT7upvgBBofQk=;
 b=XcJz08u1tiSwrJaxsitOGV32Hr17XCtEAZpecShYlbMLVVRCCC9lY6ruh4Wulpc+RcXbdIXwiHvxbhRlt3rAXgwCgaP6UlqtrBOllW/YYgzsAc5hIi36BpO1pbPTw+98JX3G60Cxgm6ZA+4JIH5LATj3nG1UvI+jud09PAmKkTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.19; Tue, 12 May 2026 17:19:39 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 17:19:39 +0000
Message-ID: <cb737dc0-ffcc-40a1-ae8c-0a19714d0dc8@amd.com>
Date: Tue, 12 May 2026 10:19:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] remoteproc: add helper for optional ELF resource
 tables
To: "Shah, Tanmay" <tanmay.shah@amd.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
 <9e3a88d9-1679-43ae-a96b-62a29bd45d9d@amd.com>
 <DM4PR12MB6448B1E51D58F3F8B11171F683392@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB6448B1E51D58F3F8B11171F683392@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
 To DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|PH0PR12MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: c02c406e-28c3-47ef-f1a8-08deb04aa5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	XElNRuEe7gjXYrAU5oG0Q9GwSW7B7JY1ko/Bn0waUOB74ccm2/eKjhqPK/lAN4o0t7SOIYEqV4QS2U9YlLAtv5RPIbc7YYuBeVjX3CMgomwiGT2l54SjC7FOpwUqjHCSHfgoQjSCL6uuZUEC6Q2PbuGGlk+czd3wAAzsCmhhCu08QdNWZrwRQwl0iGE9Z4Bin+6UKjslbJI6dVd7F87uHnsHou6zU7hjW8fO9IuxUD2fTNoSE1YJ0t9Bm5klH9gbhgr+FpKTywzGX+cjN4baADscNSdz6gMH8g0xDmnKemhUBkIgn367cyMVf/WoCw44vhInBAd6fvumbVWo2Er//dEpos09nm1rAciuKjurheQ1RKmXezaJ6mcdBp4R7U928XcF/Lsp8cHgmqRYjrHm7QYGNMibV3mg8U5ed0FCnkEANz9mmCmXVvvDxyaTj1f3FpJW4TnCfI5UdhPSLRSv1QL42zFybD57thdY/gmbtQ6tPMsHHt3JdZ4vwVBFmFks3TS8Z+s1DCQFxam82rAst4A3KZshrkd9QVc3YrWSKSFx/Toe16e7AfFkSuh1er86Ra02ekJFz3kKzyjkIeA8PstpsaJ+3Hai//20heFDxnKr/y00CZqXwBGNHSCagiIFS9qmRW1Wgb0/UzpZkZwnxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHl2bWpRclhEZHkzbTEyeVRVaS92VjZnMVZSbzlTZEVJcFJMMVlja1dkN1lF?=
 =?utf-8?B?WklURjF3NTE3RGd0MWtLeEI5djI1b3VHbG5xSTFQUFB3NHR3d29VMTNiQXht?=
 =?utf-8?B?M2RhSkswYXRCaENOeitZOGQzUFpVNkRCOWNyK3lCVG14eTVnMUpOamE3aXZY?=
 =?utf-8?B?MGQxeUFVYjZCYjBCRURBY1RhMWZXYllRdExBYzJTTkU5ZkRxWC9wR3kwOGFi?=
 =?utf-8?B?VG04SVZsR2dRK2Y0RHd2MnppaVFnb2NNSnBZcU9lK1VqbVRtZkZ5SDVTSW1m?=
 =?utf-8?B?R0ppdWVrSjJmcFVDTFp5eklObktXMllMTy85VDRuVCsxbElPK1NFei9PMWl2?=
 =?utf-8?B?UW1XUlpocDFmQnFhOEtJV2JqS00zdEtZMTZidFdwUGhtOTZxWDRNRkZhSjdS?=
 =?utf-8?B?Z1JsVE9oQUVlWWl0TG5DRVpyVUdxcHJWb05NZ1g2cWtXMy9Kbk5lcHI3L1JC?=
 =?utf-8?B?S1RhZnlEV0RkQXNwM01XMFVINlJlcVJnVk9GKzhNMG5qYXhCVXJlamVKcnRL?=
 =?utf-8?B?QW4ySVhjcjN6WlFuS1RlYzRJTmVZMlRJT28waHdRL3ZlVi9PK0JranNKYXYy?=
 =?utf-8?B?THZGV1o4emVXbEt4UTlqQUVvUjI5SEl1RDJMYnR0dGphNEM2UGtDNGRJK0JJ?=
 =?utf-8?B?VkMwNGl0ZXhrNmRhbUQ5TlovYzVtQWNxbTFvY2dwU1BNZVpYLzhBdXJQbU9m?=
 =?utf-8?B?bTNkU28zM1IwMWhRblNSQzU5WE9LcGEwazRwRjJ3Q1BrMVVsd05uWEZTQzVS?=
 =?utf-8?B?Q1Q3Sm5Kc21HdHBDMnVSZzhUNC9RbURCRmpWd1dwaWExdXRTK3NVbEZNMmN1?=
 =?utf-8?B?QnZ5RGV3aDgyb3p6VW5sbnlsZ1JQNy96UUo2UEpQSjl5ZXV2SzN2dGZHQVJ3?=
 =?utf-8?B?a1lmNTVBUTIxRGI3cEcxUFNXRDg0RXQxV3EzQi9NY1h1ekVkdEw4WFhJRmtq?=
 =?utf-8?B?RmdPMXA4bTVIZ3QyOCtad3M2UHd5L1paei9HeXlpWElTRkdteVZKRG40NDlM?=
 =?utf-8?B?ZzRTWFllT0FlT3hGTXhsQ0tXWGo2ZEFDSnlhQWEzRFFwUGttZnVRQmNRVnVy?=
 =?utf-8?B?ZFFwNExrcUtPM3dUV3gyclRYcVhRbEtyNFp2cSs1TzBTbStsNnN5dWQzR3pS?=
 =?utf-8?B?VU56b2phK0s1QnZYSzlqMzJINFJYR0hsV0dyQVB5eGVRRU5WQUU2YXdteTcy?=
 =?utf-8?B?RDM2YzA0alZYb0w4SGd4cTQwemp3eGMvY0VFTnFnUnYwYi9CaVpxclorMkp3?=
 =?utf-8?B?TjlvbHY4bU9reDhxWnlvTUdJaTBRdWNHS0wzemJnTUEyMFdCcUJ3MkMrRTgv?=
 =?utf-8?B?VjFuRVVUZnJIRlJSN1RPdjJXRjJUNkdOSU51Wk9TQ0tvQjNzMjlyZmp5UUZV?=
 =?utf-8?B?dUJkQk1UdnZyZk5ZUS9DWWRQVUo2YmpXeFl0ZHF4bk5JUnVac254QjF1c001?=
 =?utf-8?B?RDZnNHA5aEtWeXE3SkJHcmVqOHdZQzB2YlFNK1Y2Nk9ON3pudVBDY3gxcWhj?=
 =?utf-8?B?cklCb0FXQmlQL1k3d25wdWkrTGRFcFIvSVhBQkwwTHNRNGFkN3gvZVJaSzd3?=
 =?utf-8?B?UXRNbCtEeURtcE5LeU5CRnJYRmFqTmwxUW1lUVoyOXF3bEpGQlJ0bU5DTzdN?=
 =?utf-8?B?RGZzQWNzVktFYzlaalEwVWJ2UjVoNTV3eHBSdUdSZyttejh4eFNxNzJDbkEv?=
 =?utf-8?B?ZzJvL0g2ZCtXeDhDK3F2a3MrZmVDeTMxR0JtVXJGTHFoWjZMeXZkeDR5SVhR?=
 =?utf-8?B?ZlVESTk3VnRMSzJWNTlFUlUwV1JnT0hWNkVVME0vaHFJZnZoeFhpM2YwalJ2?=
 =?utf-8?B?OXVaenJyY29jTHNMcDFPck9CNkFIMUNJclI3cUlsdjFRVXNQejVmRWJ6L1Nz?=
 =?utf-8?B?NEhLaWpoSXB2dUd3OEorUFZKSVhEWklMZ0VTQlpTc3ZkdGU3STQyTzFUWmZW?=
 =?utf-8?B?WCtWaGI2TzJpZ3RzVHppb1M0V2djR0JuWHNYeHdvb3JYcElrWngyYStFRWtD?=
 =?utf-8?B?ZDhFRFNjaVVHNmN5V3REdnZzcmtUK3JtUmtWYThvRDBzM24xQnk4ckdZR3Av?=
 =?utf-8?B?YjBtbzRiVFpOUFk1Uy9FZWJaQTZWcTdnZWM2aExBNlRhcllOVFN3K3dvV1pV?=
 =?utf-8?B?VXVEanl4Q21rNFdGV1hOS3FkdXJraUUyWFBiN3k2STZ1aVJkQ1RUV0lCcmtn?=
 =?utf-8?B?WVhiSFArYm9FMXhYQXN5blRyQVBNU3pneUdYa0oxRXJ0eGlHVDJlb0NvOTVv?=
 =?utf-8?B?N0ZxV1BYUFNkSnUwL1FQcUlNcjlZazBHY1YxS3pvdEhrYk9jWWRsWVc0YXc1?=
 =?utf-8?B?NmpvWW53WEZzb2NMeUdueGlmZHhURnVUcVROb3A3d3N5R21iOU9yQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02c406e-28c3-47ef-f1a8-08deb04aa5c0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:19:38.9582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yYRULqp1VlqE8l+RvoIZLcKoM5UG0P5RLG5jExPOlnK6ew8+8Yaw0FSo96f7ou3yTHct6PsCN/BscT0F7Z2Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932
X-Rspamd-Queue-Id: 7D426525AFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[bounces-32502-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blevinsk@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Daniel, Arnaud, Tanmay,

Please see my reply below

On 5/12/26 10:04 AM, Levinsky, Ben wrote:
> AMD General
> 
> 
> 
> 
> *From: *Shah, Tanmay <tanmays@amd.com>
> *Date: *Tuesday, May 12, 2026 at 7:53 AM
> *To: *Daniel Baluta <daniel.baluta@oss.nxp.com>; Levinsky, Ben 
> <ben.levinsky@amd.com>; Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier 
> <mathieu.poirier@linaro.org>; linux-remoteproc@vger.kernel.org <linux- 
> remoteproc@vger.kernel.org>
> *Cc: *Frank Li <Frank.Li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; 
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam 
> <festevam@gmail.com>; Geert Uytterhoeven <geert+renesas@glider.be>; Magnus Damm 
> <magnus.damm@gmail.com>; Patrice Chotard <patrice.chotard@foss.st.com>; Maxime 
> Coquelin <mcoquelin.stm32@gmail.com>; Alexandre Torgue 
> <alexandre.torgue@foss.st.com>; imx@lists.linux.dev <imx@lists.linux.dev>; 
> linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; 
> linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-renesas- 
> soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>; linux-stm32@st-md- 
> mailman.stormreply.com <linux-stm32@st-md-mailman.stormreply.com>; Shah, Tanmay 
> <tanmay.shah@amd.com>
> *Subject: *Re: [PATCH 3/4] remoteproc: add helper for optional ELF resource tables
> 
> 
> 
> On 5/12/2026 2:55 AM, Daniel Baluta wrote:
>  > On 5/12/26 00:18, Ben Levinsky wrote:
>  >> [You don't often get email from ben.levinsky@amd.com. Learn why this is 
> important at https://aka.ms/LearnAboutSenderIdentification <https://aka.ms/ 
> LearnAboutSenderIdentification> ]
>  >>
>  >> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
>  >> drivers that treat a missing ELF resource table as optional. The helper
>  >> returns success on -EINVAL and propagates other failures unchanged.
>  >>
>  >> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>  >> ---
>  >>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>  >>  1 file changed, 12 insertions(+)
>  >>
>  >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/ 
> remoteproc_internal.h
>  >> index 3724a47a9748..dff87e468837 100644
>  >> --- a/drivers/remoteproc/remoteproc_internal.h
>  >> +++ b/drivers/remoteproc/remoteproc_internal.h
>  >> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc 
> *rproc,
>  >>         return 0;
>  >>  }
>  >>
>  >> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
>  >> +                                                   const struct firmware *fw)
>  >> +{
>  >> +       int ret;
>  >> +
>  >> +       ret = rproc_elf_load_rsc_table(rproc, fw);
>  >> +       if (ret == -EINVAL)
>  >> +               dev_dbg(&rproc->dev, "no resource table found\n");
>  >
>  > You are changing loglevel here. Initial drivers use dev_info or dev_warn. At 
> least I'm used
>  > with seeing this messages in the logs.
>  >
>  > So, what do you think on adding at least dev_info to this instead of dev_dbg?
>  >
> 
> Actually can we leave that choice to the platform driver ? There are
> many use cases where the remoteproc subsystem is used to load and start
> the remote core and the firmware doesn't have the resource table. We
> don't want to make info level log for such use cases, as the resource
> table is not expected in the first place there.

Thanks for the feedback.

I agree the helper should not impose a common log level. Some platforms intentionally run firmware without a resource table, so forcing a shared dev_info/dev_warn message from the helper would add
noise in those cases.

I'll rework this in v2 so the helper only handles the return-value behavior, while platform drivers keep control over whether the missing-table case is logged and at what level.

Thanks,
Ben

> 
>  >> +
>  >> +       return ret == -EINVAL ? 0 : ret;
>  >> +}
>  >> +
>  >>  static inline int rproc_prepare_device(struct rproc *rproc)
>  >>  {
>  >>         if (rproc->ops->prepare)
>  >> --
>  >> 2.34.1
>  >>
>  >>
>  >
> 



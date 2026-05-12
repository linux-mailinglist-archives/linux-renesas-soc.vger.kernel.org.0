Return-Path: <linux-renesas-soc+bounces-32500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EPRGnVhA2oq5gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 19:20:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C11525B81
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 19:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 855383052E41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366BB3A48D5;
	Tue, 12 May 2026 17:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qu1pNOWc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012003.outbound.protection.outlook.com [40.93.195.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212C274B3B;
	Tue, 12 May 2026 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606112; cv=fail; b=iONkmqTVwrB6koxoUJgiUGULqI4EgIT9EdD4SNRGaCp4jnOVdFxtdQJ+PhZqf9K893QSuZoZnWrsOPTmdHkP52gdVX6bW9deYU/GWZs4g2y5dgfvpLhxJfu06qZp0fn27qaMgFgGDjfmTpI/4MEk4h31ZjiLp1clyFxdPfb4Ezw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606112; c=relaxed/simple;
	bh=/HfTr+g1ITx2ftbX84e2IC86pIYqs4pd0SunBS8o3PM=;
	h=Message-ID:Date:Subject:To:References:Cc:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VyMI1/10pJKrzXQR9cBPalXtmt+P4z6RYHDe4zlCYG7d06+S2MzCFAh2Tx4MBhYBoBuwgsepPWTW3lvP8z9GqU67MHhXBwy6tk2B+aOrll79qjSxxZinIth74/t2zTsh9Ym5QurOpVa07/ITlMdxiiB1oMv7CG/nxTuJVDHq0RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qu1pNOWc; arc=fail smtp.client-ip=40.93.195.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqNcPd9k3oy4oJEJz38SX7iB6gcrG0XqeP3EvnzzxRHxkwQjAye2ZdcM1leXOJHwt3sNkGoF/F7dUiubM0dYvdXhQ/ecF76LFTAZh63prhi34fLvfO9kZZpwh1Q239kztAp6YIZF4rEV7FnYE9E4gk00pi9/5RNL5bBXXUzqcFjL3Dt4oXMV0ful2bd8JAhXH3daKEjvdvDD52DYDsgwn3+vHgDHL5UHmijliZuMDt+CDQ7Gb0QeyMWwyIUTySyGbXeaQc0G3h54V68zVXTkN4mc7bIC3ipBH9I/GuVwTsbXiX7a1Iid+PJV/btWCQzpLI0YuGQT2v4yJ7qnoSZcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/AoDDE4OkeBe3CLgRzPTmw7mPNw+go0G7XwVsvZMOc=;
 b=HT7naAsgG5G+WknTUR071zXKebOL1Ulu8frc23roogfsgrZg8BS+E6vkkAGcj4td5w012ieVr7GXprXABecvcocDCCOGEbYwVp6vEkpWDNfsSw+9+a4gJstgMKiPr1MriWRrFIU1Zr2ILaNXeeks4YS//CIHHqW0/5iHrh7n7Ct4oFL9z5G43/zxvcKgwp5v3+ejSnL8t+FKCxrw10wJzjkz5bQrs3eyDv8haVWcPwPK7bUZXTKJEGOAbGXgRjuG5/OM+W2YDH1SkBzheWjilVyh5ZVZ06wb2wHcQuMS9uJHTwTA/BwpQPr6+mNBiNNZagxbs6uD+El2PTg5/cv4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/AoDDE4OkeBe3CLgRzPTmw7mPNw+go0G7XwVsvZMOc=;
 b=qu1pNOWciw+wRz8jBcHEjoUSf0IOJjZj/0fHoukohZX1vDhqWWERQyzEPURkUhhaBvfuhUrSi7oZPSXVaDr8WDRiASAsC4t72s6Mlx3DzA0XfzLLld7nTwUGaNtT6xTirKgbLBo5x4sU9sV1Ck+mvLwGK22xtVUhvsOtLN326Ec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Tue, 12 May 2026 17:15:04 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 17:15:04 +0000
Message-ID: <986f9f97-e990-4a61-bd25-d32f6cdea325@amd.com>
Date: Tue, 12 May 2026 10:15:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] remoteproc: add common wc-ioremap carveout callbacks
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-2-ben.levinsky@amd.com>
 <bd083464-a5a2-4994-ad88-ddf42d2c765e@foss.st.com>
 <DM4PR12MB64482037D67096393D4668CE83392@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "Shah, Tanmay" <tanmay.shah@amd.com>
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB64482037D67096393D4668CE83392@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:334::19) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: bc538916-cac6-4473-ccc6-08deb04a023f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kUdizuQVqc09KA0KefFz7G1t49sTZJScKOrTzJo3Qns+nG4FLOeXKSGzE0JXByv8Ef4Y0XSVv7LEb6jpKMnNGNcjqUMy575Nus0Ue/JyP5JqxzmR9mvxlaLoX/dIO6ILrSVNFJCorqwsqhQiVTjoVSvgaojw3cfyAF08Gu7h+Yd1N6CNNyBwlYl13T1PTHlVQLDuPKfMfW/DZkjTQiH5b7ySLj9jOKiUl/iQeqSl966gu/xC/zs8RvCGP9LQtQ6JWgaNyUOrNbeslhzzCwovRoEyVkSfD9gdmdIYEmrpT7zKNdl0MPLth0VuCPPYuzlSe/zF6RrtPvkASNV0B3YdtFL6vQ9TqjhLBZPAZxQ3VMxlMFnTr9sDSXxsXkn/HF2aiibLEIHLg0K4G5Cal9Ju+8eJBAB12/ZD9afL5K7GwGjJJsiC6cMPy65U1pNktuZ3hUuRjk3cVJWWxTbZS1GMa8mfthkl7OvGGE6c+Ovg7/blE6zRMlKku2it2Nhj/0oFrx1YpbE2/A+KdZgd3xDfZGEl2w366RQj2/c/MOF1sUqVg/NqbXO8f0qrCUPQrVEF4V4IqELDcWBUKxpu0LdWOXYUD98PKYg0QpGiuZ8m78HJlpedjv/HslYdVXuytSL8s2IIrzujuSC8k0A6Feg+JoxauGA7VmXM1Z5YwvuxG7EU4ZQLz05M+CGQC7SZn8sH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1hrNVRRdzd5Q3grRWhENTVCMGJ6REhsa0NycmhoaGpBZWpJMjRUYTM1OExt?=
 =?utf-8?B?NFl5VFk3NFdHclpJK0p2b1dRK01FWE1KYnFDVFBIRFlhSFY5QlA0bHN1NDU5?=
 =?utf-8?B?RzBBU0tscWFMSFdEOXpQNHF6N29RWnFOVTY0SFdpSUFpRVo4Z1VmNDdoakEx?=
 =?utf-8?B?c29BV2oyUVgvRjlqL0pmM3J4WnR5eWVYRk14NW4vbXdJbzdSN3UzaFNjVjFZ?=
 =?utf-8?B?anUrL1VPcmJrTXV4ekpQakxnNmc5bWJjQWlGQVptV1F3WUl3d3FuLzdWLzNX?=
 =?utf-8?B?cEhqbnJNelloTDdFbGZTSGhYSzRyaUhyL29uL01MS1BEeFR3V2Mya1dUd25i?=
 =?utf-8?B?RExkbVRWM1VOKzNRMmsvMHNKVDJ0dzNMMHJESDc0U2NuTzBBck5jY21wNFdT?=
 =?utf-8?B?QkxJNWVFUmhvdmNsQjB5Q3lHdnV0UHpUdnVLUnVhZzNKcDM0Vk1NeVNJVmFa?=
 =?utf-8?B?cm4wVjdOMU5Ja3hPdyt2RXZHTmNPUmRudXVCSEt1R3IyRUlIV2NGaFl5bERZ?=
 =?utf-8?B?TVJOMkF4MFp1OUttYWNXQ3NSMXd1Vm9mekJ3dzh5Ync4amI1WHBmWUFKQ1ZP?=
 =?utf-8?B?UkVPQ3BadnpIZ1FpdlJDTGE4Z1BGVUdSMHZ1ZU5qTjczRUFFKzF1N1gydnZr?=
 =?utf-8?B?Ni84N2NOeEhPQ2x6cVRtbnBadHp2QjVJQWZNdGQvMzV4aWh3NFFjcElFOGdl?=
 =?utf-8?B?VE5NbldzQXMzK1NYRGxISERHV0dzSkJnWDFSV0NDUVhxQ1VQTzVnSmp1anU1?=
 =?utf-8?B?bGl4MzhKK3lvRGdhMkh1SDlPR1FWSk1xaGZwQ0lYa0VPREgvZ0JjL2R4RFFR?=
 =?utf-8?B?dm15aXJSaUp1S2RwMUNSckQ3Tm9KRWlhblBnek16S2tTQ2xrWDdDVG9OZWpu?=
 =?utf-8?B?enIxQlF6QXc1WmRGRDRxbEQvYTdTMjZsRmhHWU5TaDZza1JXY0pTSzhON3lV?=
 =?utf-8?B?ZXovRitWUzFBZWRma3hNRHNYNHUyendWeTZYWTJ2Y2VUUitFZHFtbVNjeEtJ?=
 =?utf-8?B?MHphUDRVYVhzYzBFaVRZSmFmNVRvQzJDRVFqUUtDbkJQOXl5VzRCNjR3RE5X?=
 =?utf-8?B?cUZNOWUxTENtVkd0eDRrZHBkRU1oMytXbG5menN4ejh1NVFzYkVuZmJCMWJP?=
 =?utf-8?B?YXlIVGpqdjVPWVBDMU43N1F2ZmxaWXR2ZjJxUGlpYjc0dVd1bWQwWXRDTEFZ?=
 =?utf-8?B?ampRRkQ3RUJDMFF6T1JwdXVPVDFxdSt1d2F5VDJoajhiTGRESVlhL0hwd3VD?=
 =?utf-8?B?b1R6NUJKdFRveWViWnJwYXIzQmRNZW1uWVEwcTJzTllYQ21Tb29UN1hrc0Rw?=
 =?utf-8?B?cTlxQ0Fnd3kveTlxV0luUGRwUnRzSlhRS05uWW1STkZzTzJWTU44NVI5c1JP?=
 =?utf-8?B?ZktkUXI2SXo5bE5HMFZnWDJ5a0NKU2V4YjA1VU4xYkVpM0RoM0RmYVB6SmZi?=
 =?utf-8?B?a1M0SE5QVWJ1N3U0QXZRV3dhb1NyQlIvLzNkU3Jjdjg2TmhOclVmT1lXVzVh?=
 =?utf-8?B?VUwveDVjZExzL091ejF0ekgvZVZkcVAva2p6TkVKZ0FZZkNDSUVkUmJQNzNz?=
 =?utf-8?B?RDhhRnFiRmgxY2EzRmhVbHVrZEZkREIxRE1iWlFTQ2tMUzU0TjZBT3RLQ3Q1?=
 =?utf-8?B?OE5VT3lNQVQ1Q2VJZ0hTQytBUldRQVZEZ1BvYlF4T2lybUdFWkVIUS9kSTJV?=
 =?utf-8?B?dCtDQUhGMGh6S3cyaHFSdnE2V0dYL2Rhd2RRUXA1WlRXVy9LSUp3UTZHUVQ0?=
 =?utf-8?B?VG5wRkRjSk8xcyswK1luWHdNMkhEQlF5Z3RPQ0lJRngvVlZ4OG8xVUVoRzNP?=
 =?utf-8?B?OVFPaU51cTEyVlJPUm1KeVRYWHJleGh3d1RRNVducTUxUUlNSk9MRStSaWV3?=
 =?utf-8?B?YW5JclFRaGM5NTUxL29QRUEzT01qTWJySFRnWVFHMW4yUHkyZnZmMHNHcWJR?=
 =?utf-8?B?czd3YkVWUTZSK1ppM3VBWUVHdjVnMzhsbW9nOUNKdmN1OE1DSFZQRmJZcFNQ?=
 =?utf-8?B?cXprQjdWZGswMFc5OU5oY2ZQZWQ4U3p5ek11UkZLYlROQlRUUDd4YkE4ZklJ?=
 =?utf-8?B?bGxuUGhIM3pTV2M5dW5OUVFaQVg2REk2MHJGK0pxcFg4enN5bHI0VnZseXFR?=
 =?utf-8?B?aklMdklSZXhsWkJKNDQ5RkJHQUVMeE5nSE9oRjVPdzhkVVUxbHZ0VmVrWk8v?=
 =?utf-8?B?LzE1dUwvYjdJYjMyUVNSN0xNQVJBRDVNOGl4SGt2YUNZdjkyNGc5QnpzdXo2?=
 =?utf-8?B?aHY0Z1JZWm0zcUpPMS92QzFLd0l6WUE0VVdibnlzSkZ1THJ5akFiVzg1VzEy?=
 =?utf-8?B?TnBKOElsRUVUTS9KNE1BUjhXTFBDVVY4Uk1sa0kzYmZMR1NYakRUQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc538916-cac6-4473-ccc6-08deb04a023f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:15:04.6948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FguomXZaUmeL2pVsbvhw3ESKKszKE8w4HIgjLA80KwhY/xsT8iqSg/X1Qe8S4lyUeyyl3Wpjz8rKv8mIyAQ+IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
X-Rspamd-Queue-Id: D0C11525B81
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32500-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blevinsk@amd.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


Hi Arnaud, Geert,

See my replies below

On 5/12/26 10:03 AM, Levinsky, Ben wrote:
> AMD General
> 
> 
> 
> 
> *From: *Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> *Date: *Tuesday, May 12, 2026 at 2:45 AM
> *To: *Levinsky, Ben <ben.levinsky@amd.com>; Bjorn Andersson 
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; linux- 
> remoteproc@vger.kernel.org <linux-remoteproc@vger.kernel.org>
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
> *Subject: *Re: [PATCH 1/4] remoteproc: add common wc-ioremap carveout callbacks
> 
> 
> 
> On 5/11/26 23:18, Ben Levinsky wrote:
>  > Several remoteproc drivers open-code the same ioremap_wc() and
>  > iounmap() callbacks for carveout mappings. Add subsystem-private
>  > helpers in remoteproc_internal.h so those drivers can share the same
>  > implementation.
>  >
>  > Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>  > ---
>  >   drivers/remoteproc/remoteproc_internal.h | 26 +++++++++++++++++++++++-
>  >   1 file changed, 25 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/ 
> remoteproc_internal.h
>  > index 0a5e15744b1d..3724a47a9748 100644
>  > --- a/drivers/remoteproc/remoteproc_internal.h
>  > +++ b/drivers/remoteproc/remoteproc_internal.h
>  > @@ -12,8 +12,9 @@
>  >   #ifndef REMOTEPROC_INTERNAL_H
>  >   #define REMOTEPROC_INTERNAL_H
>  >
>  > -#include <linux/irqreturn.h>
>  >   #include <linux/firmware.h>
>  > +#include <linux/io.h>
>  > +#include <linux/irqreturn.h>
>  >
>  >   struct rproc;
>  >
>  > @@ -122,6 +123,29 @@ rproc_find_carveout_by_name(struct rproc *rproc, const 
> char *name, ...);
>  >   void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
>  >   void rproc_remove_rvdev(struct rproc_vdev *rvdev);
>  >
>  > +static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
>  > +                                          struct rproc_mem_entry *mem)
>  > +{
>  > +     void __iomem *va;
>  > +
>  > +     va = ioremap_wc(mem->dma, mem->len);
>  > +     if (!va)
>  > +             return -ENOMEM;
> 
> Could you add error message here to help for debug
> 
> +               dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> +                       &mem->dma, mem->len);
>  > +
>  > +     mem->va = (__force void *)va;
>  > +     mem->is_iomem = true;

Hi Geert,

Thanks for the review and the Reviewed-by for 4/4.

Here there is a real behavioral impact from not setting mem->is_iomem for carveouts backed by ioremap_wc(). In that case rproc_da_to_va() reports the region as normal memory, so the ELF load and
coredump paths can end up using memcpy/memset/memcpy_fromio incorrectly instead of the io accessors.

Given Arnaud's feedback, I'll split that out from the helper cleanup and explain it explicitly in a separate patch in v2.

Thanks,
Ben

> 
> HHere, you set mem->is_iomem, but this is not done in platform drivers.
> 
> It seems better to add this in a separate commit after patch 2/4, with
> an explanation of why it needs to be set.
> 
> Regards,
> Arnaud

Hi Arnaud,

Thanks for the review.

Agreed on both points. I'll add the missing map-failure error message in v2.

For mem->is_iomem, I agree it should not be folded into this cleanup patch without its own justification. I'll keep the helper conversion behavior-neutral here and split
it into a separate patch with an explanation of the impact on the remoteproc load/coredump paths.

Thanks,
Ben

> 
>  > +
>  > +     return 0;
>  > +}
>  > +
>  > +static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>  > +                                       struct rproc_mem_entry *mem)
>  > +{
>  > +     iounmap((__force __iomem void *)mem->va);
>  > +
>  > +     return 0;
>  > +}
>  > +
>  >   static inline int rproc_prepare_device(struct rproc *rproc)
>  >   {
>  >        if (rproc->ops->prepare)
> 



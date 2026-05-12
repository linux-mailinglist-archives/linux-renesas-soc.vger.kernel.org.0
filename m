Return-Path: <linux-renesas-soc+bounces-32454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBb3BCncAmrJyAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:52:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1063A51C375
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 09:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0C9D300C391
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 07:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1CC47DF80;
	Tue, 12 May 2026 07:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c1zayC0N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A1E38C41B;
	Tue, 12 May 2026 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572322; cv=fail; b=Jb8A3iOwmRjV9PaUQAEHhX2sdZ0GTEKbqHyQzWOjfj5Ot0IlOgbU8y0ldF5ceZ+dzdYcd8n7wflH/mAYFGwqW6wMIPDvKC25Fe81gDRWsj9jWwUbfJJ3HyvrwUbxsrIrbnAf6iTKABgL7Fcf2wMMCVI9aYiF6D6u981nOF0COGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572322; c=relaxed/simple;
	bh=hOe2gvUVxbl7JIL8RujkDO7AgnWqTWOUcqHo+4PLLjo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VodiWLKMge/pa+WgZrE+4+HLTJot25En5meiBKlmFlWvvZkGQpFyUfr+U5MkWTEHh1SRo3ysQrJkvVA0LqrtlGNDMnLIrx9TcvBkl/urggLXee8g462ekQmxnzV7qVKar8S1voeXMKPHfsf1PvVpQhfCItnFILG0SylUmcFHxV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c1zayC0N; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iF/bRAtajzPxorOF5jIBfedc6bGGFgErChqIymV8eIXHjOjpYGjCFa0g8/saiQzA8h49rVmskKFb5SLOzZGbgTYaX2086gW/XuO1IbRxrtOy9v0sp40V/xHHT/QNIBIRRHO6ZLL5tRVHj05aBVwUdHFRc4DYRDQiuUdbbvjQngmazZ9GnnnlCcbyqIybfIqVbUOC9a6RPANFIJr76c1u50reLxFjj2xC59nv5H3R6dyyhlPKXeyKrpXcXb3i4/hCe5sA+WQqol1hFNDqGHlmWbz6se56SUW63uN0oR/UxeV6T4niq9fCAp/XSpTuNr0YYtR5xghIsMqvF6lTIIxX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMvu5EjGOwDd4XIX3LguYmjawm56TkgujV3fupHpXpY=;
 b=YwBXojLt0yBfy8UuenfyXVs1tmFlYnSaRKuv0vyqihTJk8mJNg13/yYkPF7gMhFXyODCq+M5ByVGOtaw3LVLfVpPf4+qZ0ObGF7bln+3kiD2X741Ysk/qhVVmrYkKEVYG2gJdSFbn+C9e077z8IbrRQOmkX2Qpj4wyZuQbvi2dmU/BspyNHm2CBYnbMbXiIRBQb/mbUxADciOdQ/aQuVSLjblD+caqNh6GBe5VIrzEgNS0Y0nJx6kSLaQgLPO7bmfx6P9Cj3XJvF+GZS63RD0i8A8yzDnITlZPgIc6UyHNT5wyAL2Xp2Ajfr33i9J0FB/fKDue/usfEoJK5ASqyf4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMvu5EjGOwDd4XIX3LguYmjawm56TkgujV3fupHpXpY=;
 b=c1zayC0NriAyTekDrAN1y1mqVAwmeoBaYwDN6yXhBNC1MadThu5vRWUSfmlnNaVvWP84tZ6baTbAPY2vKsrqAGrBLSOymmMKgGTeulu38AslKFy4fZNqj7avwE+gtyatoF3EdutlEQWi4X1JPbR1SQLXVVvPGyOq23tRYtYHY50HBp6P/dwX0vykWxcI6smnEaONdrvRtb56lAvnnZ4lmjGaAYjRvi1Pw3EsRLYTO+Wv8YXyXYiUMg0PIJxCwuvMZxNBk7x576d2k4O9oqw/N7smdnqHElsiTtCxyavChyhUm+Qq5WvLZJVz9VaanN6ujajT7nX94CDEt3T837DbnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 12 May
 2026 07:51:56 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 07:51:56 +0000
Message-ID: <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
Date: Tue, 12 May 2026 10:55:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] remoteproc: add helper for optional ELF resource
 tables
To: Ben Levinsky <ben.levinsky@amd.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-remoteproc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 tanmay.shah@amd.com
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260511211841.284809-4-ben.levinsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DB9PR04MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 167eb3e2-3e78-4d26-140c-08deaffb56a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|22082099003|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CMtEh16atBLwEK6H4IciK0iL6Z2nlAHp8UBvM8vkU0g8sRrTvHoOeBDlgosYvVudQJBdAyiCUk6CeqTqVVrNmEJCZhrB3OcLx98+9ZvL8dpQOKMTBOoUyLy4omC3OwntgUbMi4/h+ZnLr2JjJM8oB3V9JvkSUeshOoa8Aj2F29LXevMJdFIcngtchrWnzwFeV5K/4KbepFbXQVEPMtumTtZfmAUOAKQaX1d0BnG0hDEqYHVU5SzuTnhu4EwF3jjfnug9LvEGw8LSBn335q/UTd/o7yr3dYT5MsD28wtW8+kJG9xC94DZnRpxeI/9Tdh7Jo6yjbQR4DKYNsXDK/sMGhasXnsr98u3W0onBfpyg8L6SjBQA+Q8BrWRIWSdVXVo+8nyWmqMJUZmP+fhoKwZMBe86xv/hiZTnIYfRh8IKiPdvITYNLP4zIQLu1j2anuK2kgiB0c/2mJGmY6tZKiwN9BZBni2RLQ994PlW8HjFsgyMEgz03+YN73H6071ckjntQXAls3pHLGqcxEy0gMtk3Ts11ly5ngql+dg4f6WEMsHCuJ8elQEPVX2HZ1lDo0dAO89DOQWLr5TDqVd8M1V+YuKsltBTIFIXvoe2OgmZzlUT4t9zUa6Y8Lm3M1f5JmLXxs2CR0QkKcsGxuQpOAYzutAj/iKsT7wGCsR3Nt3X5ZFZtBwTmizL8iin6bqd7Tx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(22082099003)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVRLZkg1QUVNMWV3Zk5FV1doMlVZQkNnQWsrV0pjMTJlU1NsekpTTXFHcWJy?=
 =?utf-8?B?TXdmaWdpY292Y0Q3WFVGU2lGTTduelFPZGhkV1JhUEFLbDRkWW5ZVDdkZ3J0?=
 =?utf-8?B?dzVMb3V2VzJ4UlkySnFxKzlSTk9URzBiTU5kRERDTEd6SStnVmI3cGRwbzFh?=
 =?utf-8?B?NzFQWVVIMk55dzBpZ0NzMXlFOXFYSkxnRDBxWlNZWnRmZGRDOTltMHU4MkZE?=
 =?utf-8?B?bkxoWCtuU3dOZnd6cmpWR04yOGdyeC95Yk8zMWJTLzZGRG1Tc3lUWnM4c0ZB?=
 =?utf-8?B?Z2l1RGx4VHp4aDdjRDVDYVN0YmJTYWRLdDR1TlVJaFRsT3lzZDVibWozSDlq?=
 =?utf-8?B?OThDcTZlbm53bFJQcUwzQjBqVDlNcUJqZ2ExRkxac3l0OUc4dHhzSWk2eHIr?=
 =?utf-8?B?azlsWUYyZ2daSGwzRFhzcXFqY2Rab0J6dWZxRlk2T0lXellSbGgvRXQ1cWRN?=
 =?utf-8?B?UzNUcEVlUk9vZWtRcDFkRlJONGtNbXZLek82R3NlN1pZVnZnOEdubVcrYWkv?=
 =?utf-8?B?ang3c21pMVVnRUJIcnQzcUpWV3JKbUFkRkhuT3F5bm5vYlJ3cEFQdGg2R2lU?=
 =?utf-8?B?aEl0NUN6aVZGNStsSlFoaDBtL01FaTJ4RGo1NGpwOFc5S1Jqb0hCdnVOVVRY?=
 =?utf-8?B?UmtIeXhVUWNwVFlxbzFwS1lUKzV4S3U0VHBCMlRnb1R3RUhiMEZIRitCczNk?=
 =?utf-8?B?VHQwREV4WWJvOXlYMG9YUE04Y0RPRE0raksrcFBYNndCeC9mZjBPRTFsazZP?=
 =?utf-8?B?L2QvWXBhd1hscUxuWmYvV0VIUkh3TUY1a0NTWFhUcDJNTXhGcHVIR2pOZjZ0?=
 =?utf-8?B?NTVyMmFuVVF5NjFMQnpuUkRDMDZCL0YwOTJCbUFmUG9IdEYvT081TXU3eVMz?=
 =?utf-8?B?YW5LRXJVaVk3Z1c2eFFVRm9QSTdmUzBoMWtTZHZjVWsrRWhNSElkRDhSWmV4?=
 =?utf-8?B?ZEEzVGNiVzdEYmF5bnhSVFhFeHIraERBd0pmeG0zSmJKekVxK0JleHFXdHRn?=
 =?utf-8?B?Q2QxZEdoVjY4V0s0bzBWUlQrZXdmQ2NhMDRsMzlEZ0FzRmZEcVB0VEswcnMw?=
 =?utf-8?B?Yjk4Z2lVTVJsWG1UdU5Bb1BITnhpcEtZQjRxNGVBVlZVb25nQWFBdEZlektv?=
 =?utf-8?B?S2NYOGc1ZWZaQjkvUW1YWTJ4czRoeUk0Y3ZUR1hoUlM4ZXRLT2kxRzNwckho?=
 =?utf-8?B?YlAzYmYxWHYxS3hYOXZ0Nm1adTA2azFUL3MwdW5RQ29QTFRVckdFd3UvTjdD?=
 =?utf-8?B?VHFPcXNrTklITlQ3NEUyamhhSkRCMDB6MWV6K3N5Ylo5RStydi94UTdoSjB6?=
 =?utf-8?B?cmowckREREdGZTMvSTRUUWM4L2NHdDVZQnhhYjhncEhpNDQ3V0VUK2pxbEFT?=
 =?utf-8?B?VEtEMDI0am5Ic1pscVJhVi85Y1FZclMrY0RCR1JPUlBQVWNlUWpaYUVCUU1j?=
 =?utf-8?B?d3NjOWJvT2dEa1A1QkNRNE92Q0RnV2h2SGtibmtmWFRMN3NnZDdwNWRteW1Z?=
 =?utf-8?B?Q1I4TGw5VHpZWjY5bzkra3h3NjhLYTRIK0dsb3R2UTVwcHNEemxybHloVTFt?=
 =?utf-8?B?YW9mZHc3VG5HcHZGeVdpRnAzQ1ByVFhHYWtxVzFMckFWbkFFSjVSRmczSUFZ?=
 =?utf-8?B?RWlja0JEOFVHamJjNXBaNG9oUGJ6aGR0cU5QSDcxZ3EvMFM1KzYzVjVoSVNP?=
 =?utf-8?B?WjlQL0N0U3VHM1lZdDdBT3kwbGdnSDEwY3QxNDdkako1WTRTUWs3RmZ0d2hx?=
 =?utf-8?B?R2Z2QldXdTNkdGVWaXkraU5LamxQbjF3WmpMc0YwMWEzanc3b0JvSWlMZUFG?=
 =?utf-8?B?VTczcCtoVG8yT2l2ZEpaS2c2SFJBeTNvWXd1bUFydkFyZHJWTDhPMTQ3a3k5?=
 =?utf-8?B?VUo4OHVOK3NMa3FkNXhPcGRkR2lMRDUxKytqV3VNeGJwVDdRWmx3ajdIVlVG?=
 =?utf-8?B?cSsxdE5lRWJvZHY0WDZva2F4K1pmYVhPYThBeWVobWZxK2tYL1NYdFNNbHBu?=
 =?utf-8?B?NUdYeVJnVUhLUndVUXBsRGxvNDdjQUZDei9ld3AxRzNpREFoak13alNHLzVD?=
 =?utf-8?B?Mm5DWHYycE50dlM4a0U0Q3pwUTFuRk0vWWU3RS85aUN1dEd1b0Y3bVZ3VmFR?=
 =?utf-8?B?L0o3a2FGcVBQdXd0eXdRNlhUMzU2ZFpZcmxPQklKNVR6dnM0MGNTRnc4ZzVw?=
 =?utf-8?B?MUpKZzlPbW9SbnRhQ3FuZEdWcTZsaGFWSXNUY2NsaHYzZnNycERPeVFMZTRi?=
 =?utf-8?B?emxsNG5hZlEyaVNjbys3TXBtMjdHS1RRV2t6OERLMXZOekQvUkdaL1dCTmdF?=
 =?utf-8?B?SHhiVHArK2JXNlIweCtlK285S1FmczdSQkpXM3VRa25ZbzdiOVZHdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167eb3e2-3e78-4d26-140c-08deaffb56a5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:51:56.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkuCrXjuroAL6Gnjbmn2lUvwqib9R7u7b3MksM2PoS9NSFo6VCwa+jVwQqDpv6C5+im/liuDwej1DVeGa/6HAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074
X-Rspamd-Queue-Id: 1063A51C375
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32454-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,aka.ms:url,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

On 5/12/26 00:18, Ben Levinsky wrote:
> [You don't often get email from ben.levinsky@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
> drivers that treat a missing ELF resource table as optional. The helper
> returns success on -EINVAL and propagates other failures unchanged.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 3724a47a9748..dff87e468837 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>         return 0;
>  }
> 
> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
> +                                                   const struct firmware *fw)
> +{
> +       int ret;
> +
> +       ret = rproc_elf_load_rsc_table(rproc, fw);
> +       if (ret == -EINVAL)
> +               dev_dbg(&rproc->dev, "no resource table found\n");

You are changing loglevel here. Initial drivers use dev_info or dev_warn. At least I'm used
with seeing this messages in the logs. 

So, what do you think on adding at least dev_info to this instead of dev_dbg?

> +
> +       return ret == -EINVAL ? 0 : ret;
> +}
> +
>  static inline int rproc_prepare_device(struct rproc *rproc)
>  {
>         if (rproc->ops->prepare)
> --
> 2.34.1
> 
> 



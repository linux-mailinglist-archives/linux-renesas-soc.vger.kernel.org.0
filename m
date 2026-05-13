Return-Path: <linux-renesas-soc+bounces-32557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBo0BuoZBGp4DwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 08:27:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C7752E13E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 08:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 20CB13036401
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 06:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5C03D34B5;
	Wed, 13 May 2026 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kWXa3WQp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3A3AFAF5;
	Wed, 13 May 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778653668; cv=fail; b=PBJFy3nlgLt7YLRi5gbyu7pEATXSprI1mwoirkV47RUDtJBy2g+1PhNhX8n4vnxxX9vyux+ubXXd2khOFO2viuFIFnUzEg65D5Q7aeM/+lZQgyCHajjW9NHWQoo/d3alqVq62ggrXbkLU9xXOYoCyZDZuCIB+gjOv5dzJlODUIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778653668; c=relaxed/simple;
	bh=pkyGv/3nZd0uz1SPjqYQdJRrIDvjuOkQ+9ScUepqGWI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TExRKFzl4VcaNEbFNFb0Dhl5jtFFEr68y4GEbbFcoUIM9WBO91/s9IfcYchhdtyF7Uc2DQnueA+LwrWjH9p7MTYSgbiU/yXocqhwDo7nYqTtEYyTO6opb8DOjPSWJk9LA2XBY2m4NjjXX88EgsygK26YWPAU7JmksYvWs+bhhbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kWXa3WQp; arc=fail smtp.client-ip=52.101.65.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwGUvHBXKGYoEhYE0fmDbS2RCdiXzp86+M1THcmnbkC2i8w5p69Vkf2vg7QmQbC7haLQrJIj57xWYQYH0G5RO32VOuakKyCdbff4cISy6cD3JXbU+ORQcycWav1NcnNurqATbSUwcQLF+qjb3D4LDHSj3w6AqvPAT8DWP29KxPqtfGTuijOSl15Ph7BAPOoGDw2L2jdCrc8J+VrJ4VlVA8+9XozggPGwkipZJvfRC8XvtKQ2X/6oPi8tPlz9wgYJSS+mFgR2Zdjv/dHnpxOrQEpeHuiBHloH3CkdstC1iN1MIe/EjSqx/L8j98+1JpBG3F4NWY92jcAGNlmPEZv+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J80QfQDkMBEJElE7VsvGgWOfTV4inxrtLIVS9WrKCSQ=;
 b=shLOo0dlxUavgNgZex8Bpz8O+DOt7HKSx8F1r3q2a+kL6UlwEjKgM9enQt7D9iXKbCHTSCfTOhEY0k1lCXAcRPxb/42jYOFvXydhNmkzn2SGDSYX0B3tlegATzZzkIeOomW9TVk6trKQq/+vrwXnrrtMa0Ql/qwxpkaVDe+TvV4tgZLV/4nehExs2FA8wksjHOJjbKAXdgewZ1EjsFqcYTxN8LS6l/g8a/FlwpR6bjo5LjueGG7CmRazLA9hC3Pq0dXA1d2y+yI76kekQ1KNyR3rkNphMVhuBsrze7i/JN43vz7G/mMeFzjf6O9vedUlP/DQm5Lbmm0Q+gD9wTDEFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J80QfQDkMBEJElE7VsvGgWOfTV4inxrtLIVS9WrKCSQ=;
 b=kWXa3WQpoHqHi6CDVDhUQh+HjJzySNcBlHzE0b/8jcv9kc4V/+wZHGcdNwj4q6/01zdOZEyreQSozAtQDLTpWeXzFZbEl4R4GRkT+WnGcPNfLx7XtFo2WyQLV5MKn74NiLfqw9DFHpzmYubUcEFWd4xXuTqVLC+H/XeWUunXjJ3DN7gxaIhluQaX3kZVxH04c1aGCCWCm+32g7WBh2F3p6MjKhH910AyqkGVKXs3t7aImqhus+79jowMDS565edK34PxwXI574D/NCw8riowo6fak6q369jyZh25PURJAsHXzCN6YZqSv5vrDq1q3RFoj7jvpK8CXjsJwnO284KxbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAXPR04MB9668.eurprd04.prod.outlook.com (2603:10a6:102:243::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Wed, 13 May
 2026 06:27:42 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 06:27:41 +0000
Message-ID: <3b1c5579-a9de-4955-ad3c-df3f8c1860f4@oss.nxp.com>
Date: Wed, 13 May 2026 09:30:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] remoteproc: add helper for optional ELF resource
 tables
To: tanmay.shah@amd.com, Ben Levinsky <ben.levinsky@amd.com>,
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
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
 <9e3a88d9-1679-43ae-a96b-62a29bd45d9d@amd.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <9e3a88d9-1679-43ae-a96b-62a29bd45d9d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::7) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PAXPR04MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d447fef-cecb-4607-d46a-08deb0b8bc86
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	qIjv4+9lAOJxjodOP1VquSqIumo2bhnjDSGbVKvIdmGq70x57Y8ngZjDavyOG9Z0s5NqO4UBW/Rs0gy9F+MBcFNt4I2BQzb2olyGbUpUJO+xOaqKONNsbGTvQaMztrsOzxfheB3NgAnvc9c+P+oTA3qDVCyxCZw8HV7w6JKR76fr0sGhey2y4fUgkgxF1DsUrRf1FqWljf6dqIeuCLJOzsUEXD9jQ1CsnipeMkW2mJN/TeWX4aNmw7uT4MSTNgPeXMaoyhptA+1E0YLRpLhrgu+i8+94ZJShRcdOjE3sMf20bmbpBJAYiJhDuWij7E6nxdRq6JTFt1JJWpv89ZBEWK+OaCfvJ4KfNmf1MPNOpYU1OLSa7ilCE5SxDOsF95zCW1vlE8LAUH5CYTPOyFRm8vyW9+jIynpwdbnr1LIaH5L+ca2ab1TgoLGkkCXVZg50J15Wszt2YahPTyju9LU2tWtXesP6zoovGUBqd2p16qVPHZsXrU/Q7qwwF1Xi0SBlXX5nhb08t+sENAUy5ISUPI/o3K9z9EBmWlU4XzZCaVwZW1yi+ZPikBrETAJsMiq1xGSTaspWVLZLA5D1R/ncA2XM9CT2jVAYfZlESP4m+LKw7e3AlgarHcwf1Os9rtBsmme2gsWsQMd3pVoa6OkjUgEQXPxGelt9+aRLA/0ir7YT8FbLXNB4tFw/K+LMsdQY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE9OcWNUaGR6bFFtdTVmZzA1U1FySXQ0OFAvdko0WnJsa0J1OFJoU0ZLTndZ?=
 =?utf-8?B?T1pJMGNQVmJKUWxjOFY1S0ljR1gyWDFzQ2xhN1ZmeXFLc3JyU01DQWhGa08r?=
 =?utf-8?B?TWRjb25yMnlWZk5QR1NNc3pqQVp5emdiZy9rU2E3d2NEc3FPcGsrT2tjYUwy?=
 =?utf-8?B?OW5KTzZrM2xjVVZIcGlOTFlJMnJ2OEFUOFVFMlg5d3RGNGsrZmt5TTRMRldq?=
 =?utf-8?B?c1pTSkFicTk4SDNyUU9TL0wzRk84RVhqME54R3I0a0Yrc3QxcTREUmdhendu?=
 =?utf-8?B?cmpDY3RiQmJKQXJIb3hRRnVZbGdGZ3pqZitiMDZ3c3Q1djkxWFd3cEc2SEU5?=
 =?utf-8?B?SGs0UHl6c0dXbzExbnBjRjh4YlRRK09FL0tRMWRPMHBOL2tMZnowWklrZUxj?=
 =?utf-8?B?Y2lyS0lFOGh4WGhhRThSZERFcmxMZm1rU3V6SDU4U29EYmFuYzNNT2NxbU9K?=
 =?utf-8?B?TURkeWZNVS9JTWp2c2p0M0JFMU5Qd01TSXZOWVd0aXZlclVNck5RaTZRUzlD?=
 =?utf-8?B?czJ4SWpqWVhBVkh2MlVQcC9HWEM1OHp2Y2pHWk96UTVCMGg4aVJhT2RXNENq?=
 =?utf-8?B?b1ZMdkVYL2pnM0JyK011eXk1MGo1bE40RmhjN3o5UDhoRERlRkhvRGZnWFZq?=
 =?utf-8?B?N1JlRVBrQjZ5djZoYmZPcUE0SFZvaVdyN1hwT0x1MldBWEpiaXV2MVZPL3E2?=
 =?utf-8?B?RXM5RWZCNWx0WDdMYnl6c0JZNDlJUDdtL3hJRTJDWUppZCtaOTRNemhZWVRB?=
 =?utf-8?B?Vko1cTQ4NnpwbCtEL3IyN3grWVViRE12TFJEdC84alJRY05JcllIamFJQys1?=
 =?utf-8?B?RjJuOW1SNnRmVC9qUmx4VHhLVGJrTFljWDRUTGVnbDFvZXYwakdhejB4akQy?=
 =?utf-8?B?VWNnckFFUVJMSnlhV3ZobjlWV09KV0dWSkRlNEtpOWpTRmV0c3lQUDY4LzMw?=
 =?utf-8?B?bWhLSVJVN0VXZmV3SGxURkR2Ykp1VnhadWJpNi9EK0VXNVlvTU5iZDJUMU9r?=
 =?utf-8?B?OE9YcWNkYmhIZVU3MVlIamQ1LzRUcU9jQ0loM0RHdjJxZXRZWGNDbWN3VlU4?=
 =?utf-8?B?a3M3dFVCNkg2Z3hTQ29lTmxDU09CTFdjaW5PdXFQQzJ4dlpYK0ltb2VEK1J4?=
 =?utf-8?B?akNUNGFEakJzNDBlWUNDWmxBSk5OVlRRVEdTaUdQN2h6S2J1ZkllK0VwRENQ?=
 =?utf-8?B?RkRWbjg4YStQM1A5SHoycVVOMmdoMkxveXR3Y2dhRDAxbnBTNjVDZmtCYWFs?=
 =?utf-8?B?V3V0S2FKVEZ0MFIxUi95NzVoT3Y0Sm1ONHUrTDU4NXZVQzZ1TmdlY0tVYWQ2?=
 =?utf-8?B?QlRUWmhaNmpjbGQwUksxN1RSUEVxb2NCUmFkTTRCWFhWdGZIbjl0aHVuNngr?=
 =?utf-8?B?V0laR2JvN2l5OWlhTXNiNU1XYysvbVYvcTdTdXRnOXd4Y21TeHRWNUZDb0xi?=
 =?utf-8?B?UUNGRUJvMGJSN0RLTS9YZW8wKzFUZjFLZWswbHJBQUU1VkFsZUNtSm9odVdE?=
 =?utf-8?B?QklyV1NvR0NNa1VOeUtoSUZ0S1kvSElsRFd2SmRNb3VBbHo0c2lxSnVsanJO?=
 =?utf-8?B?L3htTFlRN2pxY29yQ0xHREFtUUNoSklnRW95enF4YkpOVVNXY3NkWU1ZK29s?=
 =?utf-8?B?WUxDK0c1Y29PdG5VMGpJcEFKaDRJcU4rSGJlV0ZaR2tVN3B2cUpwcko3YkRz?=
 =?utf-8?B?Ym5rbEJ5N29rSVJQNm5BM3FJMXBNWFNiWkorUm1GZndFREhQTHpqczZmU0JV?=
 =?utf-8?B?bHh3MytHTHdZaWZCanV5YXhVNmhreXplNUpwMmxnejBTeGFaSTNoVXZZL1ZD?=
 =?utf-8?B?NlpCZVNKZjYveUlqVHpFczEvZ1RKZzFBamQ2Y3FSTzJ1d1B1dm1KUGRnL09K?=
 =?utf-8?B?Q1p0QmRIRWhsWnlxYk1Ydld1aWxCMXFVSk9ROTUzamczODY2RWlJL09JUHk1?=
 =?utf-8?B?SmFKazk4SU9FcEd1V0V3N2FpcjZMbkxCWXV4d1RRS2NJWGxtOTQ2TkJpRkhq?=
 =?utf-8?B?VEp2ZHF0ZjQzdTJlZnc1ZUdxUUtkWGx2ejFjRFpaZkEvOVdXbUZJb3oveEJB?=
 =?utf-8?B?aHQ4OFRFdUo0VE53V1V6a2l6NjBMN0FKR2dIblVQUFROTytHSWo1bFI1d05a?=
 =?utf-8?B?Ny9wSG5kZTREVFNGQ0IyU29FQUFabllENkFQL2VkRUk4aWtudlhYVlIrYWVW?=
 =?utf-8?B?elBzcjM2ay9qY00rZklFTEM3cHdJTUdUSDc5bHM3L0RKcHNuUnBmdWRHdmxR?=
 =?utf-8?B?Ykc2VTB1YjNVT1hPeVpvWmRiS2VTbnN0MDZKQ2VCaGZROWVURE0zQWQ3UW5h?=
 =?utf-8?B?amhGTU1YK20yeTdwbEZLektwN01heCtTR0h3K0lUc1Fkb2ZScTJiQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d447fef-cecb-4607-d46a-08deb0b8bc86
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 06:27:41.8582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ze3WeO+jJfc3mOuvZiDvAUjardt/AyoaKmQfRytBX3fTaOIujDrpZPuAS0YbzaxgRUWMFSx1LrOebjccrK2JRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9668
X-Rspamd-Queue-Id: 16C7752E13E
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
	TAGGED_FROM(0.00)[bounces-32557-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,gmail.com,glider.be,foss.st.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Action: no action

On 5/12/26 17:53, Shah, Tanmay wrote:
> 
> 
> On 5/12/2026 2:55 AM, Daniel Baluta wrote:
>> On 5/12/26 00:18, Ben Levinsky wrote:
>>> [You don't often get email from ben.levinsky@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Add a small helper around rproc_elf_load_rsc_table() for remoteproc
>>> drivers that treat a missing ELF resource table as optional. The helper
>>> returns success on -EINVAL and propagates other failures unchanged.
>>>
>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>> ---
>>>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>> index 3724a47a9748..dff87e468837 100644
>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>> @@ -146,6 +146,18 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
>>>         return 0;
>>>  }
>>>
>>> +static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
>>> +                                                   const struct firmware *fw)
>>> +{
>>> +       int ret;
>>> +
>>> +       ret = rproc_elf_load_rsc_table(rproc, fw);
>>> +       if (ret == -EINVAL)
>>> +               dev_dbg(&rproc->dev, "no resource table found\n");
>>
>> You are changing loglevel here. Initial drivers use dev_info or dev_warn. At least I'm used
>> with seeing this messages in the logs. 
>>
>> So, what do you think on adding at least dev_info to this instead of dev_dbg?
>>
> 
> Actually can we leave that choice to the platform driver ? There are
> many use cases where the remoteproc subsystem is used to load and start
> the remote core and the firmware doesn't have the resource table. We
> don't want to make info level log for such use cases, as the resource
> table is not expected in the first place there.

Agree, this is the best way to go.



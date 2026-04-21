Return-Path: <linux-renesas-soc+bounces-31455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PSuDhOP52m89wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 16:52:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8133143C541
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 16:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 984B630914F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7863D9045;
	Tue, 21 Apr 2026 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vBITIcoz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D13D890F;
	Tue, 21 Apr 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782722; cv=fail; b=t/ZoZ2NSG/shk77uOt9MHEFxYOMzit1SM6IfbzP14ccqhLkQ3jk9jVrErVNPrrMRjLZvHcvoreTPDRZSn11aNLHMxw2WXCP/7WOXkUANP3Y1jPN4q/t1ZFTe6oora/tf7VWPFAqDU/pnaCUPt4dBvfK1nhibn9GiYpUqGuaueck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782722; c=relaxed/simple;
	bh=JaSwPZ9r6eznOTlyB21obxdwFG5aYklEQ1XY0qW7wKU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iIjYSpC29HGMBrkfhoCuo6S5n4yonID8QnzqqqKegKUs2SYjMIS8n2HWwzE2BX1BH8zCkgdyES1Y9D8aBy4ij/bhv8vorgRouiA/5D4qkbTj2KZAlorVH972q3c6OuzDZyw3h+W0vrMJWn6JRaxP29Ja1OCJUuzFYIuWbdloDZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vBITIcoz; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWaR0mS+mt5hS/UYIcUOpxjRc/waWM6vMOLffRcNi2wuAbZzxPxi7V55xe0ganJJDHnjpyw65fLmAc2eL7p6Q8eRq28uhKQ5SlttpRc5nm2mDZL3Wlh2KcQhynu++Zusd8GBI2twOdsLRiLiB9gHOTSfoMiTqZOqQS8DUyCf0gETsl0qz2x2kX9eRUNT0dMoBsPTrhCYXXt6gFVb3TgFIluPyCVp/QATUprij1kr8bblpaq1TZQr/A3use1vJmN4rPvo5tOlBLYqEqEEfXWvaHlLZOSWvikkWPH6UH8p0nKlOpT1Wlj/KDHbN6gUS+US49WjOdtIZNyWAvHj+7RAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p36BlOxj5LchPl7mdjFyIzWOOnkMSftMUlvU98uUXyU=;
 b=zGkuj70fFicc9PPatDVshbB93hubq/cWaX34/he6UzD06oCr6/H+FR3urcFj0UuP+R4HjGHC20wfNpf5nY4M5F3Iwfv2Qd/lexOV+Y23Bvc3H+L6EaOA7RhhT3BD45V23Yj4oy0/+5dk77So4TZGOM/eiXn+mBxKfMsKja7Wi1t02lwM8b8Ob428zGJGk/4PmVvF66LS5o/q6TkZnHMMZ3Iga9uuJqnXxoi/5ZR4NCxfheBFXzbUyoLeWYmMBwMAIuE4XLBTNB9g6usHSIay2DfkzxDhPLl4s56hzvaj4yxwKlDIBl0l6lRZ+9ouLytmWpDHBkRoDp2fOodEOboZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p36BlOxj5LchPl7mdjFyIzWOOnkMSftMUlvU98uUXyU=;
 b=vBITIcoz/Ci89eyDD5HvJOl5UREsI/x7uUwRgKOI+tu8urRTCl0S5TZFEpMvFzAnBfdgV4Wx4S2PjcFIprhJfLzerJsdYEsNSDCsZG/Jw27d9/3dCNyW2RW0erE2KXEB3mB97JwS/pfNEqWJj9g/qQxVwGWmYPoGSEJFkigXMmEeurb1P0AQou3yjPR4hLjYxEjwLhooIGItF4J9eseIY6mk62ZoXJ9ifQSjQy2zLnpmcied6qOeeuLr8buc/YmtTKEFYFYiWAPCl6HQOxB+RUYsaoejx2pRAXd771jsfDoI6YN2981OS4ogGTuqMJF5IQuWUZEmhVrYvBopZD6QQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Tue, 21 Apr
 2026 14:45:17 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9818.023; Tue, 21 Apr 2026
 14:45:17 +0000
Message-ID: <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
Date: Tue, 21 Apr 2026 17:48:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, linux-renesas-soc@vger.kernel.org
References: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: b772e764-9042-4b19-de4d-08de9fb49aa7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u4GHRodEKFeL84vERIZjFR8z+6qVSPBvVGbdm0DrLeNQ3Pv5A16nLMPewpNAOo3apvLztA/LKhGjARy0QgCbyEIuyimsAtEx1P8rOCvcUEtP0DGI9eRONWdfud/l07RQngfqqJwz0/LmwNjczteKELOWZAt7ixgOv3G4rlCQBZcMOitl7XVkumYWoICGtd9ThkxZS3IGeyiitOXgHU/O9ltzSbuLTe6jiHxcUpml/w8/3zZdjSu2iT7up6a41HE6n/uA0lyRm/MN13G+xDmJnZjaWvikY6YnTI06GloqvpkdyQ7nhmobe063fwjj+fIpUL3uYju2EKg+1ehxMUywkop4JAkxAldgbHPv2e6bMaVRpKdBAOyzmsq2M7/vfjmP8MXVv48jcA9YNJJ/gFQJR4ygU4aFMAHVRPdVcZ06bvTL7Jvo/hRSGypN9MU+Tu7IPtb9bP1cF9+tc79HorOigLj7NDisMjPloQEyt0VDC5lXQX0qumuW0yPD18xNMipgtPsXgjNV1rptvxtdaCU+9xALDN+G44apVRVk6XcdK3PGbhb51Gw2POWj/MGeLX2ZMx7y7Z9LVfo9Lh/K/vBAxv5xix3z72dn95GyRntDpqNFwS3hAVmnYO52gJjk3VVIUD2fMEzNz7NR2Iz7ueDu+LNMO0BCChsj2jL2MH65cGC4bCFaalOAvJEbVO//f0d1Y41h5XgN4cxMi+VbzfKTe511Z2g12rdMW1j37+TcRw5tv7dKqztzdwfpGMif/vmthM8MePuQvFIZfCk/86qWAA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cURGanY5V2dhemJKNUdCdEhudmJQdVI4Y1lTcmtLbzBWRUx2blI2NTFRMjMv?=
 =?utf-8?B?ckpCWkxiZHliZnAvV1d3ckJkRTV0MWMxTmJZbUVoeDVwUkkvUEd3amtpUnJ3?=
 =?utf-8?B?ckw3dHYrenZmY2o4Wnc1a08ySWVzNFQ0ejJGajRsL1o1NXltbUVLM0RoTWIz?=
 =?utf-8?B?K1FDOUorTmE1REh1SXVTbkhhdi9zaUliYVBEWkNUVFRzSGo0VlVpS0M4ek56?=
 =?utf-8?B?VjE2RHZ3ck0zV1AyTUpzMUw0UHpkQ28renJBQ0Nsc3dnOUdYT0MzcHViWG9H?=
 =?utf-8?B?QTJhb201a0gwM0R4bjhQSDdZYXZ6Sktkd2l0N3J2dklHUlNaZVp4Qy9acVBC?=
 =?utf-8?B?L3NSZmVZbzJmbnlVSmRXbEhXUWxiYUIzQTB2dUsvTWh0a0JoT1VwS2NucFNr?=
 =?utf-8?B?cm5XN09WV0dtc2dVZk1adW43REtCOERhTytEa21tZE52MlB5dmJ1U3dtbE5L?=
 =?utf-8?B?cnpCdnRxaU15bVUrTXVJUk5qZ2NKWnQ2U3gyNUJOMDQ2SUprakQ0SkVNQmtQ?=
 =?utf-8?B?QjdReG45SUNPTlBkSGc1V3dQNzE2OVV3VXVUb0NwaUtsUDVwNVRlZ3VKUFF0?=
 =?utf-8?B?ZVd3eEpZOVMrRFhzOG8wMUhNWkkwKzdtVHpqMnM3MW1xcUo5Ujk3L2ZNRzQw?=
 =?utf-8?B?MXYzNmN4Zlp3TUdCRUQ0QmhOWDN5YXF6RnlQWWRpMDF2cnFHd01mYkxHWm1m?=
 =?utf-8?B?OWxWWUVCWFNRWFRmd0EvaDZUSGVZL0R2TnNzUDN0ZHhLVzBVZjNjQ0lEZ3pO?=
 =?utf-8?B?UnEwb3hsL203c0gyRlR4OEtEdXlnNUw0R09hMFhOY253b1Y1dGw1Y3Z5WHlu?=
 =?utf-8?B?WVRtalZlaGN5NStVazJVVTBaZ09VZTgxNnU4ZWlUNjNZQ2wzOVhleWEycng3?=
 =?utf-8?B?MXk5SXl3QkxJcW9VTWZZdlFaUzk1TkFCcUVqbTI1NHlPc2ZKeHZDMGZRQkls?=
 =?utf-8?B?U3RZeGcySDd4c0NFWXJZYlEvWWRaeUJreUFiY0lSWmp2NjBoamxmb3dZVUxC?=
 =?utf-8?B?M2FPaVg2VWtoelY0eDhLQ3p5eTBuUUZxU0ZFa1ByK3Q5U3VnSW9VUjlxQ1o3?=
 =?utf-8?B?a3ZNQkUwK0VUNkRudWdYcUR6VUNvdmJNTFMyeENZSGhHRTRtQzRTME54TWx2?=
 =?utf-8?B?bUNkU0ZvNzFrWUhnY2lobHhpSHBvWk5Xek9FZDRrTTVIT1p2ajB2dG9pSWFG?=
 =?utf-8?B?QzVrczBqa3ZYaTczVUxPZDl3eUFTTVI2UXNLRG5EZWtnZCtlVGsvNEo0bUlE?=
 =?utf-8?B?YndyQzljdDBvbUMxcEY0NmlvSkxnSnV1Zi9lT1hscW82T0IydzhJU3J5elcx?=
 =?utf-8?B?ckl2U1hNeUgwTzl1T1BVWUl3QUF1QWF3dnp2RERKTG5BeXlya0xpOWVZNFky?=
 =?utf-8?B?bTIrTjBGWTRzUEZlTDNaekg2VmVSOTlXZVFKZmZZa0hhRU10QW1rWjlBUHhh?=
 =?utf-8?B?RWZ4QTBwUlhQZmpHVktlSjV5QTVCd1lzK21JTlJsWkRNaFIxUnFyRitQRUk0?=
 =?utf-8?B?a3QzNlhFa3Nwc3BnTllrZ0NTQURjS0oxL1ROQjNNZHNsZDhXbDF6b0c5NTZY?=
 =?utf-8?B?NTJqNjZhZEdVWUdnRFQ2aG0zUkluS1dRdW53dzBVZmUxa1JKdjhXOUpUL0U2?=
 =?utf-8?B?QUo0SUNrYXdNbUpHTTdRdVhxWVVNVVBXT2xXUzdnY2JlaVA2dm5Edm40YXA3?=
 =?utf-8?B?aFNiY2F2UG5wV3BrNmtmekY5SlJmdUpiL1VTd2M5L1M1eWpkaVpGbGVqUkp4?=
 =?utf-8?B?MTZlZmVrbWk0SHo3YVZFdW1CWVV4bm5LSW5Tc210RitEalVnN0ZiSTg2dUFT?=
 =?utf-8?B?ZVpSNHBTMXFiOXJndVYxWGx2azdzOHBXN1hhMVFoVzFnOTQrejhRVUh4VnZS?=
 =?utf-8?B?VW1FcklwZGlZcEQzNGRtMHA2RU5jRUl1cTVkWlg2a1JhRVVTTnN2cFNCZzZR?=
 =?utf-8?B?WURXeVY3UmtHVHVVaWM4VlhneDN5YlJPWmszSjBMdXM1dGZENjFpVWFIbFY2?=
 =?utf-8?B?UGNZdFB2cjhKckpoZXBZVURKeTUyOUY4MXNiSHBIdWUwbHl0dnMxVm1CVkpr?=
 =?utf-8?B?bFBOMkJ5cHBuRE9RbWtGbmQxZW43dWZCWjNieUFzQjdYWHhUem5nR2xGV2ZQ?=
 =?utf-8?B?Kzl3aDBNd3dvckVTQSt2d21wNmwzSjZCci9vR2trNk1HRGpMNjFneFZWa0VF?=
 =?utf-8?B?ZmxlNUQ0WUIxaUNFL00xa1RoNk1hM1E2N01ueVYvUlgrUTlzOGZ3ZTcrc2Qr?=
 =?utf-8?B?dGNjMG9SWVhUcENxNWJsUVlZbVFEenovNkpuT1IrRGc5dVJteHpueG94RjN5?=
 =?utf-8?B?RGpsME50ZjhZanJNd3UwNTNtZWZ2MWl4TzN3UldSNXhYeU1GSEw3UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b772e764-9042-4b19-de4d-08de9fb49aa7
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 14:45:17.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvbuy5/kToFgIcquiwELOSI8xUT+NC40f9uMJQrtaqa+dwamudBncznUPIXxA8ycXqp45nldvfjtxD9FgZNErg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31455-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ew.tq-group.com,kernel.org,nxp.com,pengutronix.de,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8133143C541
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[..]

> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux_cma: linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0 0x28000000>;
> +			alloc-ranges = <0 0x80000000 0 0x80000000>;
> +			linux,cma-default;
> +		};
> +
> +		vpu_boot: vpu_boot@a0000000 {

Should this be memory@a0000000 ?



Return-Path: <linux-renesas-soc+bounces-31139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gESTEc3+2Gl3kwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 15:44:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5E3D8412
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 15:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3CF53006976
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 13:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE05331717E;
	Fri, 10 Apr 2026 13:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="C8g4PHCD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3E2C3251;
	Fri, 10 Apr 2026 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827321; cv=fail; b=uCAEa7WG5ZoVaiDhU2lLH9eAqRp90z13M0i+j1oSnIRdmisgmMa6WCtkOpJ7u4LJzdwy6OV/MI+6pfm0eMDo99XP7CtXT/BPxGCXEHWVUTuiEnNaXsMpP1Wjf2/YyOvZaEXELZ8oAwWRhwUNwD5Utqb6hXrd7DNKEi0mDTEeNg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827321; c=relaxed/simple;
	bh=BjvjMb/eya1wgaDsZk5ikvUKtzWa/WZ34CQHZfPMMpU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Axd3NhohNlA296nXRzJf07mImgqeXFXW5J0tPl4ypqR9qqFPXCq30WUyHUgAbM0LA/fcYJQSLUlP+LEzYe5NhQGogjZBhy25yWJriRP9pjNFf5qKJbxOVFiS6QYg+feYbF9wDk0KxF5pj4UrPLXYPumo6jOxAS9URRp18dCd1Dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=C8g4PHCD; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hppLmtC1yK/Umn6jS4L2aJ/gCCm8TQ8k0CMnb6ozY1Ao9xIU2KN72XtuWzKoJjXxpOkiDHuCNIlcYaFa57RaeLnmpvaMBC/u7QbJLyM/JdSFJ55uL75u8GsDOKHRelbBHNtNaDvR86X1PY+hLZ6CRVa6MFEvDyJS+lujgO8xNS7JF1qRh3N1wca6MYg+Hw7W7UqINCFbZZEdCFwgLUYOd2L4aK7DXNoBD7Qb5Y017hG4lX7PQ7BcTZ43kFyH/+Mg8YzEvcDDNjW+wP2wXsupOD6LbfvvR6w8J76opQqJOAqoNMHkJ5GAF2dSdU3hSrJRw0uAq5MxhP8ah3ejtP2M5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K27zfRWDwDnXfUEQnQw02XhWyuzo/5sUEU7ZvQidkVQ=;
 b=cx2JjmzqcYfWSYmNZOzC6QNL2qbrnvia7jdLChuKYCBHW74Q7KnYpiKnA2Q+vOpoTC1VDaOMIlwyJl/pxeaqZdBOzPZwl6B0LxfEFzRoXze3F0WrKR4FHdCm9g9dzX+oV/iJ6VtQ6JvndIJPtKK8336JFYLBBcCne6azFmGzHm9thC28CnjYVO+jwL45XewaiTttzAR8cVrvEFAjZKLpjQK+S6mjDtvXwK3WD7QGnfPL0XB0mfeMvC7xIH87p7HerYaYnjqPDUV6hmbQtYgjRDeC3xXQJ4/j8KMvZIXEFJPI+KhHS6tWTFey1XZ+xskS8MzIn/G6a7Tpr+YNlpS3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K27zfRWDwDnXfUEQnQw02XhWyuzo/5sUEU7ZvQidkVQ=;
 b=C8g4PHCDJGKB0p+Mm/HcdFIUH9fF+V6jKra7dji1rCZeJvUUKz3VsjFuH6cXJm1KmZzKQMzNPbMux0xwmbWNQH/OL7OT1WqfS0ULm4qP6fBw01wiU2ISRBDS9uIkPv1EAxnYPvoPABnJMYVRuNLlfCypwBuxUuo5sjsJfpHN7jQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB14468.jpnprd01.prod.outlook.com (2603:1096:604:3a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 13:21:56 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 13:21:56 +0000
Message-ID: <191a4bc7-f19e-4771-b70d-e54dd5506799@bp.renesas.com>
Date: Fri, 10 Apr 2026 15:21:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/21] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408122436.GH1928916@killaraus.ideasonboard.com>
 <dafdbdcf-98db-473c-8122-296af1922e6c@bp.renesas.com>
 <20260408141638.GA1965119@killaraus.ideasonboard.com>
 <87a18664-d19e-4434-8f92-1c7ce4f3a131@bp.renesas.com>
 <20260408150053.GC1965119@killaraus.ideasonboard.com>
 <61f294e8-f9ae-4868-8dba-60250279ef21@bp.renesas.com>
 <20260409132420.GD2634584@killaraus.ideasonboard.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260409132420.GD2634584@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB14468:EE_
X-MS-Office365-Filtering-Correlation-Id: bec918c6-faf2-442a-6c63-08de9704236f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 SRixY4wKqCn5UtufNpP/SOIOcDQ0wQ4Crm8AtSRtxNWi4kzl+sgJTSp5i7To5Yy2jM1c7u7UIws4CBNs1HKv/AhRyEnnEagLIBk6A3tmNCQA/eKED1V5h7s3ARQgRBFBqgpQ8WcgSC/5oRZ0EA1JuCoA1G6Wi1Apqm/JzS2LRumIwnJNA38WPWCTHQ+scA+5kt8s8npt0iySGd1x/Lv1FEQE1zLJ6+Z0DGOTy5QBnGsmNkPQc82qLnA0/Dh4JK3QJlFOLGBy1BZdT6K41+9UWh+UpYGEKWRZfLdMsA8mwTz4sSjuoeaUJbYxA35UUFP6cqBXk7tpYY+lljLXy3qOiIkbOagAzvwmjs2jvBWcLo4kabEkPjn8LSqONCxXFpk72e+iCxikNHSIUYxY3Q4nhaPcAPZCOcHnTW48L1WiB3zAPy1nDm13HHXkCXQaiNh3B2h9f0SWa02q5MeBIAdRiojZoBy4VU6k2OPnXYub7Z9uDklhoQqmqFT1RZUsFeBsv5NKFzoEWzgoFM2XsFoMptAJJ3h+N60H2LRMchnnNFkg37XpJZYO6vYwEKxacBnsItvt2yN2Wu4KR658VFFlDgCMDh38mzh2ia6E1RG/oJiEtUBnoc5BdfPSJzRGVdfUQPTCLON/Utkg2hCTaB0iQOz2V7o1LZ+gCXqYQ8t16eDcXzAl2XGT2r7kuUWcUQnE9V/sjeL1n8HXbsNwA5flBZsMiEAcQhOd3wamP1HYOjE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TzVDdWhLSm4xV2ZDenZsVU9pZC9uRm8zR2cyR0dZYkpBcTFsMjEwRFNDNWJ5?=
 =?utf-8?B?aEF3U2dnY2RvUEZnb0ROWWlmamV2WWplWmJZT2Y5bmIrVk8ydks4blUwa01q?=
 =?utf-8?B?bldtUnpreHFkaTJPVmQvWGVRb2t2UCtMbWd1blloTC9NNWQxYll5TjdCVUQ1?=
 =?utf-8?B?c0RnVXl1K05odXZOMi9kaHZqWTllRk9UNUZoS1JMV0huRlB3ajRjNzlJQ21x?=
 =?utf-8?B?N3pRQmRZK252SkIxbkR6cS9sckRoY2hVS1dKNzRQUUFVR3FpZCtlOGR3bTM1?=
 =?utf-8?B?VXRzajZQQkFTMmFCdHg3MFVVNVBQSEZtMEZreStDVkU1VWNNT2NCakZCSDI1?=
 =?utf-8?B?QnZ6cldGNkJOOXhlWGhhR0RNUGhDWktkUkZQNFNtQndWK2kvTTZPaWdiVDBt?=
 =?utf-8?B?RjROZ1dDUm1rcC93WFROOEs4M2t0REhFYXFpamJhd2VZb3B1djlZeWQrNis2?=
 =?utf-8?B?VTlYdHBXY2pHZ1ZyU2lIQVVGYzFOc0ltNFdKaDNhL1BHbHFSU1hKY0tyWUkz?=
 =?utf-8?B?QkExSU40bVB0bWNEdzByQWdOdm1CQmR5ZnVjbkxGSVozbGN1SFRDdm9pYzZE?=
 =?utf-8?B?WldyYjk4ZzNvUFdMcDRlbm5aWEo0M0RRNEpVVW82VHB6REN0bkQrNlMvVGZq?=
 =?utf-8?B?SFVpektoNmlhcUw0eTExVTdYS3h6MndNdzdmSHpEZFdUaE9UNXdJTHJST1dW?=
 =?utf-8?B?c2x0ZU9qQ2VockZmeEJrbHpaTEQzUlV2WkFnOGdGcHl1d3UvdTJKYmtEMFVS?=
 =?utf-8?B?eWRPZGYycktjVm1UaHkzZjlnalNUM1E5TW1zYVhqY2Urb0xpbkdFVnNNMjVw?=
 =?utf-8?B?QWViTDdrcUNYQjNOTkNtNkdScGdjN01zaGxCeWRtU3QzbVpkZzlXSXBWcHRs?=
 =?utf-8?B?eWc4bVJVeFpMaFd5VTE1M0xzTU4vczhRL0ZTKy9tcmxQeXkweGJ1eTVPZWFh?=
 =?utf-8?B?SG1veSthTk9ETndaNlRQWEZwbjVtT1NDVlF6RmlmU1FheTMyRFd4Y1VQRnNo?=
 =?utf-8?B?MDNWcVdtSkpmZGM5cHRDbzA2Vlh1UVlqdlY2MWxTbGdVMFdsa0tWQ21ya3h6?=
 =?utf-8?B?dEoyak1IRThOaGVjZ1NmMzAzR2NqUVRxZC9RMDkzb0lYN3ZWQnBra2JuL1pa?=
 =?utf-8?B?cnNmbEFvRGR5bVpsYkRkeWt2S2Z4LzVmTDNydzBBeStsZ3lhNkVKWDlsTGNN?=
 =?utf-8?B?ajc4NStVNjBheE14NFRmT2xPUHRrU21sVmVTVEVnZFZ6M0FadGI4NjRSNDM5?=
 =?utf-8?B?K2VxYnlVbE9mRm5MZzNhQU5uQ1NOMk5aaFdYYkpYUDhYQitweG93cHNkRWJv?=
 =?utf-8?B?aGNCVGc3eDZZZzI4ZlpnU3hyZGxscld1cXg0QS9DQ1NRMFE3YUhNc0tVSkcz?=
 =?utf-8?B?YU1NcFUvTmtCSkExaGpha3JyRHNxWXJhMC9PNmpZVlVmeE04Nm0xa0VCK1pu?=
 =?utf-8?B?M3JrN2grTVFvdkx2SjZSMjJXUTJXTlBjdGUwMmFsbnNhaGpXL3N1NlJQV1BP?=
 =?utf-8?B?VjE2ZUFIK2I2V0ZHeXhDVW5QaGhlRlJDL1crTFZUR3MwdFd6QmFvR1VET21j?=
 =?utf-8?B?bTZUUHNHZEhVQkZqWTBIblRRZnYzUXZScEJxcFBJK3RSa2dVWUVIS0o1TEpa?=
 =?utf-8?B?dnFrQ3htdDRtVWhIRVdJY0NtSlUzWjZlWEs4aEQ0T0tHWVk3VGJZcWhQeFd5?=
 =?utf-8?B?TGVYUjNJVUg0SGpuK3pubUpSKzlFK3lKWkhzZ3hZZmxERTkzRXlxWnBoV3do?=
 =?utf-8?B?cGhLZHhMc050bVhoNmI0WUU5K0l0azF6Zk1HYTgrb2NGNjM0MDZrd0FGaG43?=
 =?utf-8?B?cEFuQkVMZmFsWnNnTnJQUWxCdEZBSzB3ank2ZC9HYStlVjE3VEVNRmhCcEJF?=
 =?utf-8?B?WnNUUlpNZmVGSnRLNXFJNDd2aUhkcVBJSTlLRHY3YVRvOXY4TjFDckpLeW5y?=
 =?utf-8?B?MzdWVytXM05STXBTQ2pGT2hHRzd3ekNDWlRsaUd3MDR6cWlabEZpM1E5ZWhQ?=
 =?utf-8?B?Sm9WV0tQa0p2Qkw0UjYyNEVpUm1ndlFkRlowTXAzNkpweTUzbkMxVithNkx0?=
 =?utf-8?B?WnFDaXU5UngycjZHWWY1RnRaWENVdU5DYlFYMW42Q2h5QWtPVGRHZUt1TDN5?=
 =?utf-8?B?alg3QkZLZlFDVWFSNFF6OE5HeVJ4dVkyOUJGNkhDOHQ1L1d1bE9xWE0rS256?=
 =?utf-8?B?RnV0TFpHcW9RNnVBMG55blFGMC9NcksrWUVVSitVVTB5WXFXQU13azdrZkFU?=
 =?utf-8?B?Y1U1Z2VwS1JKZTFUdFJUQzNaSStKVXMxRHJ3OUk0cHFEQy9oa2FWT3YrOWpv?=
 =?utf-8?B?VUx1UnVGbDhaVWZtczVBZGJSMmg1dCtrM2xGcHAvQnlJSkFBQUgrVnYwVjV4?=
 =?utf-8?Q?dtPPnlJCleymmXg66nKOwba3aEUcTMDO1+oeg?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec918c6-faf2-442a-6c63-08de9704236f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 13:21:56.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRX8EIv+PicaG0+RYzFmAYW5jG9VyU6/jlffAxP3hwMsA+mCp6XqLHo5d+BFLMFsakCXAInW71zvNkGisegUZqVcIoPWASmisyMVCdgX/IXNxJoayehqUyQWQxA8QMuY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14468
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31139-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[bp.renesas.com:s=selector1];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_SPAM(0.00)[0.161];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9DD5E3D8412
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On 4/9/26 15:24, Laurent Pinchart wrote:
> On Thu, Apr 09, 2026 at 01:15:18PM +0200, Tommaso Merciai wrote:
>> On 4/8/26 17:00, Laurent Pinchart wrote:
>>> On Wed, Apr 08, 2026 at 04:44:48PM +0200, Tommaso Merciai wrote:
>>>> On 4/8/26 16:16, Laurent Pinchart wrote:
>>>>> On Wed, Apr 08, 2026 at 04:02:14PM +0200, Tommaso Merciai wrote:
>>>>>> On 4/8/26 14:24, Laurent Pinchart wrote:
>>>>>>> On Wed, Apr 08, 2026 at 12:36:55PM +0200, Tommaso Merciai wrote:
>>>>>>>> The RZ/G3E SoC has 2 LCD controllers (LCDC), each containing a Frame
>>>>>>>> Compression Processor (FCPVD), a Video Signal Processor (VSPD), and a
>>>>>>>> Display Unit (DU).
>>>>>>>>
>>>>>>>>      - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>>>>>>>>      - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>>>>>>>>
>>>>>>>> Add a new SoC-specific compatible string 'renesas,r9a09g047-du'.
>>>>>>>>
>>>>>>>> Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" to
>>>>>>>> allow up to four output ports, and explicitly disable port@2 and port@3
>>>>>>>> for existing SoCs that do not expose them.
>>>>>>>>
>>>>>>>> Describe the four output ports of the RZ/G3E DU:
>>>>>>>>
>>>>>>>>      - port@0: DSI (available on both LCDC instances)
>>>>>>>>      - port@1: DPAD / parallel RGB (LCDC1 only)
>>>>>>>>      - port@2: LVDS channel 0 (LCDC0 only)
>>>>>>>>      - port@3: LVDS channel 1 (available on both LCDC instances)
>>>>>>>>
>>>>>>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>>>>>>>> ---
>>>>>>>> v5->v6:
>>>>>>>>      - Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" and
>>>>>>>>        explicitly disable port@2 and port@3 for existing SoCs that do not expose
>>>>>>>>        them.
>>>>>>>>      - Reworked ports numbering + improved/fixed ports descriptions in the
>>>>>>>>        bindings documentation.
>>>>>>>>      - Improved commit body.
>>>>>>>>
>>>>>>>> v4->v5:
>>>>>>>>      - Dropped renesas,id property and updated bindings
>>>>>>>>        accordingly.
>>>>>>>>
>>>>>>>> v2->v3:
>>>>>>>>      - No changes.
>>>>>>>>
>>>>>>>> v2->v3:
>>>>>>>>      - No changes.
>>>>>>>>
>>>>>>>> v1->v2:
>>>>>>>>      - Use single compatible string instead of multiple compatible strings
>>>>>>>>        for the two DU instances, leveraging a 'renesas,id' property to
>>>>>>>>        differentiate between DU0 and DU1.
>>>>>>>>      - Updated commit message accordingly.
>>>>>>>>
>>>>>>>>      .../bindings/display/renesas,rzg2l-du.yaml    | 30 ++++++++++++++++++-
>>>>>>>>      1 file changed, 29 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>>>>>> index 5add3b832eab..32da0b5ec88c 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>>>>>>>> @@ -20,6 +20,7 @@ properties:
>>>>>>>>            - enum:
>>>>>>>>                - renesas,r9a07g043u-du # RZ/G2UL
>>>>>>>>                - renesas,r9a07g044-du # RZ/G2{L,LC}
>>>>>>>> +          - renesas,r9a09g047-du # RZ/G3E
>>>>>>>>                - renesas,r9a09g057-du # RZ/V2H(P)
>>>>>>>>            - items:
>>>>>>>>                - enum:
>>>>>>>> @@ -61,7 +62,7 @@ properties:
>>>>>>>>            model-dependent. Each port shall have a single endpoint.
>>>>>>>>      
>>>>>>>>          patternProperties:
>>>>>>>> -      "^port@[0-1]$":
>>>>>>>> +      "^port@[0-3]$":
>>>>>>>>              $ref: /schemas/graph.yaml#/properties/port
>>>>>>>>              unevaluatedProperties: false
>>>>>>>>      
>>>>>>>> @@ -103,6 +104,8 @@ allOf:
>>>>>>>>                  port@0:
>>>>>>>>                    description: DPI
>>>>>>>>                  port@1: false
>>>>>>>> +            port@2: false
>>>>>>>> +            port@3: false
>>>>>>>>      
>>>>>>>>                required:
>>>>>>>>                  - port@0
>>>>>>>> @@ -119,6 +122,8 @@ allOf:
>>>>>>>>                    description: DSI
>>>>>>>>                  port@1:
>>>>>>>>                    description: DPI
>>>>>>>> +            port@2: false
>>>>>>>> +            port@3: false
>>>>>>>>      
>>>>>>>>                required:
>>>>>>>>                  - port@0
>>>>>>>> @@ -135,9 +140,32 @@ allOf:
>>>>>>>>                  port@0:
>>>>>>>>                    description: DSI
>>>>>>>>                  port@1: false
>>>>>>>> +            port@2: false
>>>>>>>> +            port@3: false
>>>>>>>>      
>>>>>>>>                required:
>>>>>>>>                  - port@0
>>>>>>>> +  - if:
>>>>>>>> +      properties:
>>>>>>>> +        compatible:
>>>>>>>> +          contains:
>>>>>>>> +            const: renesas,r9a09g047-du
>>>>>>>> +    then:
>>>>>>>> +      properties:
>>>>>>>> +        ports:
>>>>>>>> +          properties:
>>>>>>>> +            port@0:
>>>>>>>> +              description: DSI
>>>>>>>> +            port@1:
>>>>>>>> +              description: DPAD
>>>>>>>> +            port@2:
>>>>>>>> +              description: LVDS, Channel 0
>>>>>>>> +            port@3:
>>>>>>>> +              description: LVDS, Channel 1
>>>>>>>> +
>>>>>>>> +          required:
>>>>>>>> +            - port@0
>>>>>>>> +            - port@3
>>>>>>>
>>>>>>> Why are ports 1 and 2 not required ?
>>>>>>
>>>>>> About this we had a similar discussion on v5[0]
>>>>>> We are using the same compatible and:
>>>>>>
>>>>>> - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>>>>>> |
>>>>>> --> then has:
>>>>>> 	port@0
>>>>>> 	port@2
>>>>>> 	port@3
>>>>>> 	
>>>>>>
>>>>>>      - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
>>>>>> |
>>>>>> --> then has:
>>>>>> 	port@0
>>>>>> 	port@1
>>>>>> 	port@3
>>>>>
>>>>> Ah yes, I forget there are two LCDC instances with different output
>>>>> configurations.
>>>>>
>>>>> Something still looks a bit weird to me though. For LCDC1, which
>>>>> supports a single LVDS channel, you use the port described as the second
>>>>> LVDS channel. Is there a reason not to use port@2 ?
>>>>
>>>> 9.11 Low Voltage Differential Signaling (LVDS)
>>>> 9.11.1.2 Block Diagram
>>>> Figure 9.11-1 shows a block diagram of LVDS.
>>>>
>>>> LCDC1 is connected to LVDS, Channel 1
>>>> For this reason I'm using port@3.
>>>
>>> Re-reading that, I think I've misinterpreted the hardware architecture.
>>> Doesn't the DU have a single output, that is connected the multiple
>>> encoders (LVDS and DSI for LCDC0 and LVDS, DSI and DPI for LCDC1) ? It
>>> seems modelling it with a single port and multiple endpoints would
>>> better match the device.
>>>
>>> For LVDS in particular, I see a single LVDS encoder with two channels,
>>> so there should not be two LVDS output ports in the DU. The two ports
>>> should be on the output of the LVDS device.
>>
>> You are suggesting the following dt architecture:
>>
>> du0: display@16460000 {
>> 	compatible = "renesas,r9a09g047-du";
>> 	reg = <0 0x16460000 0 0x10000>;
>> 	interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
>> 	clocks = <&cpg CPG_MOD 0xed>,
>> 			<&cpg CPG_MOD 0xee>,
>> 			<&cpg CPG_MOD 0xef>;
>> 	clock-names = "aclk", "pclk", "vclk";
>> 	power-domains = <&cpg>;
>> 	resets = <&cpg 0xdc>;
>> 	renesas,vsps = <&vspd0 0>;
>> 	status = "disabled";
>>
>> 	port {
>> 		du0_out_dsi: endpoint@0 {
>> 			reg = <0>;
>> 		};
>>
>> 		du0_out_lvds0: endpoint@2 {
>> 			reg = <2>;
>> 		};
>>
>> 		du0_out_lvds1: endpoint@3 {
>> 			reg = <3>;
>> 		};
>> 	}
>> };
>>
>> du1: display@16490000 {
>> 	compatible = "renesas,r9a09g047-du";
>> 	reg = <0 0x16490000 0 0x10000>;
>> 	interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
>> 	clocks = <&cpg CPG_MOD 0x1a8>,
>> 			<&cpg CPG_MOD 0x1a9>,
>> 			<&cpg CPG_MOD 0x1aa>;
>> 	clock-names = "aclk", "pclk", "vclk";
>> 	power-domains = <&cpg>;
>> 	resets = <&cpg 0x11e>;
>> 	renesas,vsps = <&vspd1 0>;
>> 	status = "disabled";
>>
>> 	port {
>> 		du1_out_dsi: endpoint@0 {
>> 			reg = <0>;
>> 		};
>>
>> 		du1_out_rgb: endpoint@1 {
>> 			reg = <1>;
>> 		};
>>
>> 		du1_out_lvds1: endpoint@3 {
>> 			reg = <3>;
>> 		};
>> 	}
>> };
>>
>>
>> Please correct me if I'm wrong.
> 
> That's right. It would match the hardware, or at least my understanding
> of the hardware based on the documentation. As far as I can tell, each
> DU has a single 24-bit output port connected to multiple encoders.

Thanks for the clarification.

I want to make sure I understand the intended architecture correctly,
because I see a potential conflict between your feedback on the two patches.

For [1], you confirmed the two separate DU nodes (DU0 and DU1) with the
single-port/multi-endpoint model. That maps to two separate platform 
devices, which means two separate DRM devices.

For [2], you suggested:

"you can have one DRM device that covers two LCDCs, with one CRTC each,
both connected to the same DSI encoder. Userspace then selects which
CRTC drives which connector."

Please correct me if I'm wrong but to me these two appear to be 
incompatible. With two separate DRM devices,the DSI encoder and its 
connector can only belong to one of them. Userspace cannot select 
between CRTCs across two DRM devices.

To support the single-DRM-device model you describe, both DU0 and DU1 
would need to be managed by a single driver instance, similar to R-Car 
DU which aggregate multiple LCDC channels into one DRM device.

Using a single DRM device that spawn 2 crtc (1 du dt node ) this use 
case can be tested with the following cmds:

	modetest -M rzg2l-du -s 58@55:800x600-56.25@XR24
	modetest -M rzg2l-du -s 58@56:800x600-56.25@XR24

Could you clarify which architecture is the intended direction?

Option A: Two separate DRM devices (2 DU dt nodes, current approach),
           with the DSI input selected via DT configuration.
           The dynamic vclk selection I implemented still applies,
           but runtime CRTC switching from userspace is not possible.

Option B: A single DRM device aggregating both DU instances (1 DU dt node),
           with two CRTCs both connected to the DSI encoder.


[1] 
https://patchwork.kernel.org/project/linux-renesas-soc/patch/8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com/
[2] 
https://patchwork.kernel.org/project/linux-renesas-soc/patch/9e0f64dd5e1efb0d27219416121c91a19da96ebd.1775636898.git.tommaso.merciai.xr@bp.renesas.com/

Kind Regards,
Tommaso

> 
>>>>>> Then port@1 is required for DU1 but not for DU0.
>>>>>> Same port@2 is required for DU0 but not for DU1.
>>>>>>
>>>>>> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com/
>>>>>>
>>>>>>>>
>>>>>>>>      examples:
>>>>>>>>        # RZ/G2L DU
> 



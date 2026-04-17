Return-Path: <linux-renesas-soc+bounces-31347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL1OO/rN4WmTyQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 08:06:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 449284173F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 08:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87D813007AE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 06:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2085F2D73A0;
	Fri, 17 Apr 2026 06:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jhxGXTr/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330EE1AAE17;
	Fri, 17 Apr 2026 06:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776405829; cv=fail; b=bqtsDfaV1RYg5wnGawJdhdfLnVgJeDsP3YK617qP33XyuCYzFubQQUoCDC3IvO2dN5vpSvRypi/QTQUHmifltEUjNqmu4c67AJGRJrD46Cnq/TsFLNS1oP2T6057Xp71Tkc3ModDWYW6/qEiubY7hAOAm7Clas3QEquhmRo6uSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776405829; c=relaxed/simple;
	bh=POTLdjJibjGg5mw+sCSvDHdayc0sfCotmyXRAKiOolo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f/bpKcevabs163riKxhknryY9P2RAbm73NXb5nZIJ4WPtrFAfOvTCH+LA4hjMpwPEJoiavyPHN0pp2qpySfGorsXW/yk/ppldpJBeBhWOhSCXvSiEnEcQ0f01Kf92ErG7wk8RF/fIuM+aNM3UpktF5MlvFKT7KyRRJtulQJ3MVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jhxGXTr/; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rloHPfzrmlKaBlrrhV97GK2+QapaujROKNhSyJdqp84AZCV5X4I3mPELqCexwZYqDHzlYNavrZtdwpjpLtrw00VqJu8ChHkv1Sa6wfakFcVyiZMKsRK0KfX2gnKCkCJITzv8yOSM9CHMmsONxUSUuVTSZWxjF0JY579VyGawwoax7GJtHqZNbL6pht4URCO+jqvtLhwDUiFqR4MFAlh3wyuEhiEIhsj+XvYTtCQycQlobDFb1PbUSxJlUHXk0jCHzGAxQW/gxhuZiM5EqN7gxXYRU2PmB+W6bcbD72m8urAZ6IlBYG1bdQE97fGHEWbJKSfbgv8JCGxF+aXNVzlLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtEeuqJ09mb1mbo4xQN9Gjr2vF+Bo6wWPzLMTNpoK84=;
 b=dZBzJ1/wfyXxH5RPStBJVIxPtbasZOp3XksoPxdCyGM2t+/SxEeNss7eGUb8e5m1qW1EJ2bboAhJIzd2YOPlIJnelPPf5C4024osd+LZVVurt3rZ2berWbM1iDSstulpY0YU/Qh8B8Sp+mx9teWPd5ktpNtJGDpfZW6sKdykKUx1/Z+r6RXkBVluAB+xjVOLx08P68Pd4O6pqOykDpETI8+MiiG5kijK+qj2+Se778FlF5SuuHqsD4MR2i1/Yicnrbk2dm5kTFj6x0u36m6SdGRpAwyDhXeWTrbCuj+yaShyuozY06ASTAZJE3uuBPxdYd1VR1OTl626zSFZ/7nKRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtEeuqJ09mb1mbo4xQN9Gjr2vF+Bo6wWPzLMTNpoK84=;
 b=jhxGXTr/aMcJGNaOknqeeZDZA5YNR2CDPZmgBIgWsNK2a8hOiKpDrGyyv/TGjo7yAB3GUAQhgLjWU8mqHBaqGfP0//qe37CvdWVHxCAWbEP1Kvt7mZReYs6SS5VJSCn0gPcI2xgx/1cLYmEH90mvszJLaFOfqgmKmjDtbn1tZFjWDttXAEsIvCMqqxKYb0+4yOiApNTEnBetSxUO9LagUFzGMUUOIi0YzBBwMRzWG/0/DHmF757jszXoLL3085hQshBZ+AKipQTsvtyzv9GfCu5Y227IW4cqisoVIgB3rjbKH20zw+tp9JLTSY+sNgFqEN4HBEhJC0FIToAaKucjoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19)
 by VI1PR04MB7056.eurprd04.prod.outlook.com (2603:10a6:800:12c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 06:03:43 +0000
Received: from AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4]) by AM8PR04MB7940.eurprd04.prod.outlook.com
 ([fe80::1fa8:cc0b:b501:6bc4%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 06:03:43 +0000
Message-ID: <00e2f34a-c488-4a61-bb87-0f0431990c3f@nxp.com>
Date: Fri, 17 Apr 2026 14:05:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Add suspend/resume support
To: Biju <biju.das.au@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
References: <20260416082928.169347-1-biju.das.jz@bp.renesas.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260416082928.169347-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::6) To AM8PR04MB7940.eurprd04.prod.outlook.com
 (2603:10a6:20b:240::19)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7940:EE_|VI1PR04MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bca4e1-df44-4348-c6ed-08de9c471413
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 D9cpNytAeVtVhnAMBMfz4rkVE4juOrry5NLDzFiiVY8HYbCg7Kuau41FIRnx3qQHnOAoN42Yun5BuDg8FCeaS4L+I+pwrdxEs9DBdi4Vl29T8ftgOUNQ1VFKc6saNQUI2UcBFyxngFHI7MTfTYQL1cDTwJKIeIrwQayklWF5mP0NBV3TWRdxSu4FcaI954/UCOZuNfLKts4x0pFPJ7ckUhoqabZ0Q3mJLHxDBsAcZpS41l0NnI0yDAw1JPa8zRraKmtRfqvYJjeDrQxahQ39k4vjyjwlxcQMNAPjR+TLKKTH/llcoL81kwwjPafjBlnPh/Ehft0KNDTQC5uod81zAwM3C/VKQwnre9vzsILPfuffZpO7EMIFILL/J/RkdZNnYAJr/dlmM+JlU/CnV5NPO7MDNhMUSi3p+DLJcKuwNhIOe3rhOFC++Qj/dKzR9az+/YBvtxa1Lr98IF3BDppurxxKEPO484InFIfPKG3hWUgK6ZESD+SzwHIOoYcWWlO08l+nILCen7KiyFnzX3YCL22aLbUx8+LFqS7qSSV3Urz6CoK63ydcutWSwi5Iz/zb55bIK5xTCoCTorFZKlZm2kH4viDTomDsPnwplqioNpsnA1ARIoY95ss8tDoBDTjR2ufTcG7p0z8Uz4qkFkqmSi8QYM39Vq3KnXVlz3jtb6akiL9khMuef7hTQs83VwSw97zhphHk4/Pdj5AkphYBBtLY+TnHFk5JbNVKpxshQCU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7940.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UFFSRTBRMnJqTGR2Sy9xemZiNDErRUp0V3ZGVWF6ZTBCTHcrUVFiV2hMS0dJ?=
 =?utf-8?B?U3BmQldDc2dralhWNnlHbE9mRGNzWTJEYkVzL3NzVGxlUm9PMmJuQnJUTjdm?=
 =?utf-8?B?UExaQ2F6b1drNjgxc2dlaTZ6SENqUTIra3Jsb0FUQWpsY1dEcFBRRXpDTVFs?=
 =?utf-8?B?UGJXMFVqME5PNXI3RXNpTkpoT1N0M0R4bDdabzFiSXRETFJNQXp3TE84YllE?=
 =?utf-8?B?SEdDZnpIem1iT2dRVXNzNW9kK3lGRmZWSnhnZFN6eW4zeVN5L1NlY3lnREFp?=
 =?utf-8?B?RjJxVzhSTkdyRkQxNmx4Q0pCZ0lKNUdTaVFqdXV2d2lhbEYzSVVrS1RGdjZN?=
 =?utf-8?B?MllNa0l5YXByWTVhK0RxbkNOR2JndDhGK21kTUcra2hnSGovWGdmMEgzY2lj?=
 =?utf-8?B?TG9veW5UbmpuUHc1N2VJNDZDNVhNejdLemdpR3hGZnhYYm45VlE4a2QvclRT?=
 =?utf-8?B?LzkrZFZMZ0RIcWlxTFdoaFhHUy92UThuWHhaS3lPdDdiK3g3R1BxcHMvSlBH?=
 =?utf-8?B?aktmTjdNZEUvOE5XM1NFRG5rYkR4azgrc1VJVVArYldEelBlS3piZjlJU0Zi?=
 =?utf-8?B?QnVzVklaN0RrNTNhTG40akRvdmxxcGRzLzhvemFUbFUrd0pDZ2NOaklaTk04?=
 =?utf-8?B?T0NjV1BWamxrTWlOejVMMC9kQXl3Y0ZBVUN1ZXFvZ0FZbFQvU0wzSS82RHVR?=
 =?utf-8?B?N0JXSmtoYXFIUmtva0g4cncybkVkRWxlVHM4dXhrVFRGTVNEckdROEVkZVQv?=
 =?utf-8?B?V04xM281S2dJTmJXOUQ5VlI5NFdDSjZXV2xLNWxkbDJySGNidXhZMkRQczJ0?=
 =?utf-8?B?dE9mWW9ZSlpEaGY3TGlVUWUyZFZxSmNMZnZ5WWRtbE40R2lBRjJUekg4Sjlx?=
 =?utf-8?B?VEZhTDVuU0YwRDRVbVVycTFMREF2Skpjazh0UUV6ZFFQcS8xaUtLNnF3a01B?=
 =?utf-8?B?MEtGTXU4Q3dYYndwY1laUGJDOTBFWExDeWFoV3Y2cjkvVXduYWRBWm9vSzlI?=
 =?utf-8?B?SlpQSU1GeVkxdHcyYUFyRTk2S0w4aUt5eDA2V2lhb213OVNHQW1zSXp4T0gy?=
 =?utf-8?B?MUZuU1Q5bmtodmxaalljWXBaNUJYQk1hMktEWG4zYzkwTXlCWnhZOVZSY3Iz?=
 =?utf-8?B?NXBoeWRwQzJxK2JBSVlKY2hTemNsOHd0dVM5V2x6WHQ3aFppVDdMcGJTajJu?=
 =?utf-8?B?b1JHckgvYjVtNHZ6cDc3alA4RE1SNTRvVnp6MFJPUXZDMkYxeXNySWVmQUtK?=
 =?utf-8?B?U3Izb2pQTmlUNlBHK1IvcUlBQittMXpFd3UxZlFPbktXT2VodDNVNVhUaFlQ?=
 =?utf-8?B?TC9Rc0Z5MTNmR09qSGpZWUtoN0g1OXNTR3oxMXYzQmJNbTJtWDhCaUVUM0Qx?=
 =?utf-8?B?NWZBVk00bm9HeXZGWnN1OWd2NHJ1c2V4MDJvZHJMQ2t5ZU9ic0FpNUpKTE9N?=
 =?utf-8?B?QXFjUmVLUGFFczh5VjY1cG5MOElVTkl5eVhDdUJtdGNBQmRPSWJqWUJxM3BE?=
 =?utf-8?B?NnNMNFdtVXVmL0JTZ21xUFB6YlFpOWtEK1l5WklQL0JFT3VGQlM2UzlQb2dE?=
 =?utf-8?B?OUxFNW1CYTBvRGlGZ0NrMlNrelBMZkdCV2FGSGh2Z1FQQ2VFMlFNYmJxODAr?=
 =?utf-8?B?cTJRamhQTkptQXNEYUlDblBON0Jta3ExKzdvak11Q3lYZVBXRVVGV1ZORlVO?=
 =?utf-8?B?bXEvZ0szT0szc3ViaEZMM043VThqaEcvbXVnM1FsTExxdU1FMFI2ckNYTGMr?=
 =?utf-8?B?UVcvQzNLQ0lMU3BaSUpmVFFaSlBVL0NFMDB1blRnR0RmK1dhcFcyRXdvemRQ?=
 =?utf-8?B?N1dYdE1UcmlqeHVDMTdUeVA5K3RvNmdSeHY3RXVJdGlRVlZCWmMyV3lGdCta?=
 =?utf-8?B?eW9XUnU4MSsyZmRYRlZoZUZSRGp2YmFpaVVyR2UzS09YM0d0MHZQS1JveGpr?=
 =?utf-8?B?YVZXMVprb1FTaC9KUTNuMmlVNmk5Tm1ZNTc3SHRxdURHVnlieFAyVXVmRkFy?=
 =?utf-8?B?b1orRGUvblFZRHQwdjJLbmV2MXBYeFdnZWo4aGQwQm1sblZsekN5TGJlcSs0?=
 =?utf-8?B?bVA4SitxVFFaR1BCYTA0bHFhMjVBa21sdzhnd0E2YWFoSytsS2dyNnNob3c1?=
 =?utf-8?B?VHlaeEgyNzlKSytmTXh6cmJTbXdDSy9Qb2lOQ0hBTlRlTUM3R3MvZlI3RTVO?=
 =?utf-8?B?cU9XdnRYdHdvQjdkaGRtU1l6WGJIaWNzTGNaMGdZSzF0Ui8zKzBIS1hUdWVQ?=
 =?utf-8?B?enRYS2xQdHQwK2gyUWd5YXZmblR5UGt3OEpwcnRSNUJkZUdQYlErQU13YkJU?=
 =?utf-8?B?YjNOK09tOE1rc0RsSHdTWU1LRExOaDRkZ2lBbzJkYkRsMkRXeHVtdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bca4e1-df44-4348-c6ed-08de9c471413
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7940.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 06:03:43.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PQlsXI3uDeaOEBRLGmk8v7oSUc13tCz7xsO3nADhwqdjIQvrD5iC4a7ewUuA2YQFV77WORdb4RgHSchFy5ZZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7056
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31347-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 449284173F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Thu, Apr 16, 2026 at 09:29:25AM +0100, Biju wrote:
> [You don't often get email from biju.das.au@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> On the RZ/G3L SMARC EVK using PSCI, suspend to RAM powers down the ITE
> IT6263 chip. The display controller driver's system PM callbacks invoke
> drm_mode_config_helper_{suspend,resume}, which in turn call the bridge's
> atomic_{disable,enable} callbacks can handle suspend/resume for the
> bridge without dedicated PM ops.
> 
> Introduce it6263_bridge_init() and it6263_bridge_uninit() helpers to
> consolidate power sequencing, hardware reset, I2C address setup, and
> LVDS/HDMI configuration. These replace the open-coded init sequence in
> probe() and are hooked into atomic_enable/atomic_disable respectively,
> guarded by a powered flag to avoid redundant re-initialisation.
> 
> Switch from devm_regulator_bulk_get_enable() to devm_regulator_bulk_get()
> so that regulators can be explicitly enabled and disabled across power
> cycles. Move reset_gpio and regulator state into the it6263 struct so they
> are accessible beyond probe time.
> 
> Add a remove() callback to cleanly power down the bridge on driver unbind
> via it6263_bridge_uninit().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped system PM callbacks instead using bridge's
>    atomic_{disable,enable} callbacks to handle suspend/resume.
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 88 ++++++++++++++++++++++++-----
>  1 file changed, 73 insertions(+), 15 deletions(-)

"suspend/resume" in subject makes people think that this patch probably
adds runtime PM or system PM support.  To avoid this, can you change the
subject to something like:
"drm/bridge: ite-it6263: Support power cycle in runtime"
?

> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index 4f3ebb7af4d4..1954bb11f7f4 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -200,9 +200,13 @@ struct it6263 {
>         struct regmap *lvds_regmap;
>         struct drm_bridge bridge;
>         struct drm_bridge *next_bridge;
> +       struct gpio_desc *reset_gpio;
> +       struct regulator_bulk_data *supplies;

I would move it6263_supplies[] on top of struct it6263 definition and use
'struct regulator_bulk_data supplies[ARRAY_SIZE(it6263_supplies)];' here,
so that you may drop devm_kcalloc() for the supplies array in probe.

> +       unsigned int num_supplies;

The above new supplies array has a known size, so this can be dropped and
you may get the number of supplies via ARRAY_SIZE(it->supplies).

>         int lvds_data_mapping;
>         bool lvds_dual_link;
>         bool lvds_link12_swap;
> +       bool powered;
>  };
> 
>  static inline struct it6263 *bridge_to_it6263(struct drm_bridge *bridge)
> @@ -578,6 +582,41 @@ static int it6263_read_edid(void *data, u8 *buf, unsigned int block, size_t len)
>         return 0;
>  }
> 
> +static int it6263_bridge_init(struct it6263 *it)
> +{
> +       int ret;
> +
> +       ret = regulator_bulk_enable(it->num_supplies, it->supplies);
> +       if (ret) {
> +               dev_err(it->dev, "failed to enable power supplies\n");
> +               return ret;
> +       }
> +
> +       it6263_hw_reset(it->reset_gpio);
> +
> +       ret = it6263_lvds_set_i2c_addr(it);
> +       if (ret) {
> +               dev_err(it->dev, "failed to set I2C addr\n");
> +               regulator_bulk_disable(it->num_supplies, it->supplies);

I know that you call it6263_bridge_init() in probe, probably because you
want to enable the regulators for hotplug detect after probe(it6263_detect()
reads register HDMI_REG_SYS_STATUS to do the detection).  However, an idea[1]
is to wrap the register read operation with regulator_bulk_enable() and
regulator_bulk_disable() in it6263_detect() so that you may drop
it6263_bridge_init() from probe.  With that,  it6263_bridge_init() is now
only called from atomic_enable, which means that the initialization code
can be open-coded and the initialization is supposed to be successful(due
to the "atomic" nature) hence no need to do the regulator disablement
bailout(error message in dmesg is sufficient).

> +               return ret;
> +       }
> +
> +       it6263_lvds_config(it);
> +       it6263_hdmi_config(it);
> +
> +       it->powered = true;

If you drop it6263_bridge_init() from probe, I think 'powered' flag can be
dropped too.

> +
> +       return 0;
> +}
> +
> +static int it6263_bridge_uninit(struct it6263 *it)
> +{
> +       regulator_bulk_disable(it->num_supplies, it->supplies);
> +       it->powered = false;
> +
> +       return 0;
> +}
> +
>  static void it6263_bridge_atomic_disable(struct drm_bridge *bridge,
>                                          struct drm_atomic_state *state)
>  {
> @@ -587,6 +626,8 @@ static void it6263_bridge_atomic_disable(struct drm_bridge *bridge,
>         regmap_write(it->hdmi_regmap, HDMI_REG_PKT_GENERAL_CTRL, 0);
>         regmap_write(it->hdmi_regmap, HDMI_REG_AFE_DRV_CTRL,
>                      AFE_DRV_RST | AFE_DRV_PWD);
> +
> +       it6263_bridge_uninit(it);

Well, this could effectively disable the regulators and hotplug detection
won't work then.   So, again, the above idea[1] helps.

>  }
> 
>  static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
> @@ -603,6 +644,9 @@ static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
>         bool pclk_high;
>         int i, ret;
> 
> +       if (!it->powered)
> +               it6263_bridge_init(it);
> +
>         connector = drm_atomic_get_new_connector_for_encoder(state,
>                                                              bridge->encoder);
>         crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> @@ -840,7 +884,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
>  static int it6263_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
> -       struct gpio_desc *reset_gpio;
>         struct it6263 *it;
>         int ret;
> 
> @@ -858,13 +901,21 @@ static int it6263_probe(struct i2c_client *client)
>                 return dev_err_probe(dev, PTR_ERR(it->hdmi_regmap),
>                                      "failed to init I2C regmap for HDMI\n");
> 
> -       reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> -       if (IS_ERR(reset_gpio))
> -               return dev_err_probe(dev, PTR_ERR(reset_gpio),
> +       it->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(it->reset_gpio))
> +               return dev_err_probe(dev, PTR_ERR(it->reset_gpio),
>                                      "failed to get reset gpio\n");
> 
> -       ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(it6263_supplies),
> -                                            it6263_supplies);
> +       it->num_supplies = ARRAY_SIZE(it6263_supplies);
> +       it->supplies = devm_kcalloc(dev, it->num_supplies,
> +                                   sizeof(*it->supplies), GFP_KERNEL);
> +       if (!it->supplies)
> +               return -ENOMEM;
> +
> +       for (unsigned int i = 0; i < it->num_supplies; i++)

Nit: I would define i together with the other local variables at the beginning
of this function.

> +               it->supplies[i].supply = it6263_supplies[i];
> +
> +       ret = devm_regulator_bulk_get(dev, it->num_supplies, it->supplies);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to get power supplies\n");
> 
> @@ -872,12 +923,6 @@ static int it6263_probe(struct i2c_client *client)
>         if (ret)
>                 return ret;
> 
> -       it6263_hw_reset(reset_gpio);
> -
> -       ret = it6263_lvds_set_i2c_addr(it);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "failed to set I2C addr\n");
> -
>         it->lvds_i2c = devm_i2c_new_dummy_device(dev, client->adapter,
>                                                  LVDS_INPUT_CTRL_I2C_ADDR);
>         if (IS_ERR(it->lvds_i2c))
> @@ -890,8 +935,9 @@ static int it6263_probe(struct i2c_client *client)
>                 return dev_err_probe(dev, PTR_ERR(it->lvds_regmap),
>                                      "failed to init I2C regmap for LVDS\n");
> 
> -       it6263_lvds_config(it);
> -       it6263_hdmi_config(it);
> +       ret = it6263_bridge_init(it);
> +       if (ret)
> +               return ret;
> 
>         i2c_set_clientdata(client, it);
> 
> @@ -903,7 +949,18 @@ static int it6263_probe(struct i2c_client *client)
>         it->bridge.vendor = "ITE";
>         it->bridge.product = "IT6263";
> 
> -       return devm_drm_bridge_add(dev, &it->bridge);
> +       ret = devm_drm_bridge_add(dev, &it->bridge);
> +       if (ret)
> +               it6263_bridge_uninit(it);
> +
> +       return ret;
> +}
> +
> +static void it6263_remove(struct i2c_client *i2c)
> +{
> +       struct it6263 *it = i2c_get_clientdata(i2c);
> +
> +       it6263_bridge_uninit(it);
>  }
> 
>  static const struct of_device_id it6263_of_match[] = {
> @@ -920,6 +977,7 @@ MODULE_DEVICE_TABLE(i2c, it6263_i2c_ids);
> 
>  static struct i2c_driver it6263_driver = {
>         .probe = it6263_probe,
> +       .remove = it6263_remove,
>         .driver = {
>                 .name = "it6263",
>                 .of_match_table = it6263_of_match,
> --
> 2.43.0
> 

-- 
Regards,
Liu Ying


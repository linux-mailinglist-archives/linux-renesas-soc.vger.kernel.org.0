Return-Path: <linux-renesas-soc+bounces-29630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GkjLyqDuWmxHAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:36:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 628402AE1CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 17:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C543A3019C8C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 16:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDB93793DC;
	Tue, 17 Mar 2026 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ry/yiKn+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010013.outbound.protection.outlook.com [52.101.229.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870272222AA;
	Tue, 17 Mar 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765416; cv=fail; b=mMP7q/P2rzi5YvRNP6Fdeb+aig0BlUoiHOv1885qS/SVPFPBTi2SwHE4BtzSdJSO80QQY++E8eoY70eUxQhQ/u/9LcnaZnTC/JUhxoyGT1v3MuIqCFU4OszLIYQwIi60tI6FzPYoj/3aE4GbrYrXtt9InvPeraFhRFghZaGUbpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765416; c=relaxed/simple;
	bh=Pun1jNwOcjfqOl1RYagGeiMsF6Hf25QzHBOEWvB+ASw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fcM1n3+LJmIPFaUOWc3SzgPgczB38GkRr2662DCJprw0F2k8jZCRKGAAfKJN83iYbAnBc5xBlZEttE7Q66O/D6zypgJS4P3f5HKbxg0znOiPuTL/s2M3lNrdTDsbxzY13kN+6INEN6HOtwydho+krjctRT5ENEmyOor/6l0Nl+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ry/yiKn+; arc=fail smtp.client-ip=52.101.229.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/KCBmKYx2JWD/545pMsRsSHzpQYVDBUqGF8FZZbQvdMmAOViGl0l9e0Pn5WMW0ccsN58s8HhZb6lCxsZxMasshXC6kmdRFcgEUfv6fCRqQC0eB16kvkOlS3ir2jZ7O7Pi7/GNWZBQenAcaMi/Yq6o24wKIkHoIRZsJ6lnmbPgUoqr2aWSPBjhFIW8Gj+dXTzszE6zdhYcruoTPk6Hcxgnj84dAx3fQECNIl19uznoxuH5YSTMnhwn+M6ypr2wInfI+lFa9Yo3xltvIvB7H7fPT6F+nmsZwiaEModd45LKP4emmaEPxY56pxDHvySjLcXH2evQPXK7hln3Y2bO6p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zkIre+yIAFGGXcxfDeC2NIzPZg4Y2Ua1/fHjGrnEoE=;
 b=eQ/PfKwMpAl5Cjnb3lyd7CMrq0R3SOaDd77L+i+8Bkniy/B4+7TBU3kwWkfJDLg3lDtmheIF7C6abf6uRGtruaVHT2/lKMjjyiKTjXkOCxxxdSk8uMOD8pe++aGN8ekZ81U1WNv7KvPI6GwyQbkuu1J6haxkQgpTogYq8n5K2eml8prDPtAUnKKYtugbV6jyJy441d47nTjpYWWYmTfn2GhVxU3AbOpTJRpDRGveGAG+5yC8r3QyIGvKMnwy4clfDu8ySY7dwTcr560cWAMDdC+8um4c2X/BmSPBwm7PTwVUXpgDTeSLvxV/UMVvoaC1aBnuQH93FZISirJV7RtikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zkIre+yIAFGGXcxfDeC2NIzPZg4Y2Ua1/fHjGrnEoE=;
 b=Ry/yiKn+SI4y58sPlQSRxAjYL3l4eFwV6cpmp2mFnmQviQfaNJy05hc8cMnpPE+re4A4X+v5f9HU/KqZzekGwtEJ8Q6KtEhJx43JZPqVP+fa2C6tpURyyqCt0ydIdHMxGkNND+Kp4QJBgVajfndl/ukOGdBnaAGbL8DK2HaLr6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB11102.jpnprd01.prod.outlook.com (2603:1096:400:3d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:36:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9700.024; Tue, 17 Mar 2026
 16:36:50 +0000
Message-ID: <16328d5e-da46-42d2-8863-07a098363133@bp.renesas.com>
Date: Tue, 17 Mar 2026 17:36:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on
 sequence
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Brandt <Chris.Brandt@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260317123610.329630-1-biju.das.jz@bp.renesas.com>
 <20260317123610.329630-3-biju.das.jz@bp.renesas.com>
 <abl7ovx8e7zToQfp@tom-desktop>
 <TY3PR01MB11346D6653F7D175B4625C0348641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <TY3PR01MB11346D6653F7D175B4625C0348641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0289.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB11102:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bb8ae1-08c4-48e1-6b78-08de844363e4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3H2Vlg23sfC/sFdnzplWB3FyHb6HaanLDpQH4pPvaOetSp1TsPoi+Y4yOSpurAeBG5ubIIqk//f9g+bU2J++PINJ+fx1EihYKbj06MiQAH5tqAtxNlGZAqH3HZnTSXRLhQ23+X7VAJyIP8NoA34lIbJcpWhTAmL6gNNSNmB7pCQK8g4+qzlH+a3Vpy2iqaHvd/QUH+YqmRrMYhxuHFcg6RcLaRKYjoILoyN9GTWTLzUzvEjtv+i7V/ResLzTM2lZuj127qF7Wdym7eyNmxxN0WJVPhbLBPnfiTE6AAvSCZmdaPIRW8+9skw5V2jerVV/ClbIB4QWs9KTwpqL2wUaZXqQRMAaZcFEVExt1PvoboOXuRMLq5BJb0il7gk7SyU9i7t2avbusbq+0ijutsLIyrEOuxRZxWRttAeSFWmNe5HFeRALQ+W8IHJ2uIrxX2McE0NYX66WQRR6LXg2ORW5qT/d72BW6Jg1KG3W6SV7WWhyvErBsikOWeWtcFeQmwHONFPo5SaaI3euFJiYaYSL+jSrP0sfc1aAd4nnOq6vICIVFgGgWc1mXVs4DgpJ4o3m6YayybDrxUWHg77JYN+dK7+aSRmChKhjIKyagKii76AmcsdIkI6fBfofndy6XsyE/Ugcl40yXy0UYNCXCsHv6Hfjg1cm+fH4MTbytoWsCCtW44TTvszHAiVSQtdi+dS8gsiTPYXMGB4MaOLWIdN+LNJgU62UKccj0UOw/E0Xfw0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dG1HOHlQTkdXK0JCN0xETGM4QVZmNUFwbUttNFlLQVZ2VEcxanNmb0pWVXY3?=
 =?utf-8?B?STEyRnJEWk1NY1FZbVYyaS9mdU5iTXgxMmwyZXp3VWdiN21ZdTF1cWRhVUZm?=
 =?utf-8?B?RXhvODRFajhnRTAzblFQeDFaSGIxenVlNS9OTHBPUzV3c0ZaRk5ralZUSHVZ?=
 =?utf-8?B?MTdLV1ZvQk9sNkZEY093VWhzVlRaTHlCWXBYbithemNNdDBES3VBMitUWVdm?=
 =?utf-8?B?dEpQeThMNWJSSFpMU0tXUm5ZYWN3eXRSdGZkWUw1WFJlNXovM3o0WFUzdFUw?=
 =?utf-8?B?RFA0SnEzdlFqb0IyQmRFM1NsT0ZwZ2hiT2tBVFIvcUkzcmxHc1FIRlExYXQ0?=
 =?utf-8?B?MktlOGI0MnVLYTk0blgrNEE1cTdac2l2VDV2WDVNOW9BV0dkM2JFaW1HTzZm?=
 =?utf-8?B?VE14MEJTOU5OOG01czJEclo4ZzgwOUxuZTFDU0RxQW9PNlNpUjR6NEt2bHZB?=
 =?utf-8?B?TWJkZENpNnp6R0dlMVFOT3hiTDZZa0V2VG5FN0FhLzBPd1E4aUxiM0lRZXZH?=
 =?utf-8?B?d0dQQnNWa0V0NzZFSENWWWF6REFuaERhUCtNb3hhSjZFSHo2eEkvNHloWGh0?=
 =?utf-8?B?ZTExV0JWdkdzTTg1YUQ1QmZ3bkJMdG53V0R6VHFWc2lMTEl1ZW5LWHlJY1R2?=
 =?utf-8?B?V0QxUkxGZ3AraG1tb2wyYlJTakZnU0t3NUlzYXVwUktwMk5KbEdvb01QRWFG?=
 =?utf-8?B?SitmM3hpRmc3NGU3UlpHdmtLN01EOFRvb2wxSGZaazd0SFc4S25YSjF5VEpj?=
 =?utf-8?B?NFY5dEtrSG1aenY5Vjk3Y2xWQklhMk82Y1FXdzYrZlNuK0xmelhBK1VWV0hi?=
 =?utf-8?B?TlZhVjljTmxiNzlJUHFLWmUza0V2SzhwUUlUWE93OFRzanRqcnIyL3NIS3hq?=
 =?utf-8?B?TFl4OXBQTnlBUzdLakdoRDk0NEVZNEMyVG9GN0pNUHZ3ckFNR1lCOWtVdGZU?=
 =?utf-8?B?SVBQN2lzUUVvUlYrUDd4QU9WWUhUNkZaVzZaOWhpOERJUGZqTlh6YVJibG11?=
 =?utf-8?B?RUZXZU5xNnMxendibVBmTGc5OTluSStlaXBQQ2Z0UFRpTkdrd21uWENwUmVF?=
 =?utf-8?B?R1R0TmkxSGtpYS95a2k4N2FiMnQwTmtHTTFJZ2liWWpLekRYN1BNMG9JUWZ1?=
 =?utf-8?B?eThFMGJ4cFd5bWJUQ3ViV0FjZXZ0WEF3K2lZU0E3Qm11ZExOOTlzaDZTOWUy?=
 =?utf-8?B?T3lqdkcvOFllOVNUZTJzUXorWG1IWklyN3dYLzIzVlB5R3ZGQmh0ZUE1czBC?=
 =?utf-8?B?d3Fad2Z0R0xMak5EK2ZSVlRKcHZUakd0SnkyL0Z0bmN2MlZoVm5mMGhQOWh0?=
 =?utf-8?B?cTJIUmFKbytpRXJ6TkhDeXBGRlBFeDlCK2VBZSszN25rT2oyRERKMFpHY2to?=
 =?utf-8?B?UFRKY0pnNTIxRm1lOEpySDVQZHNYeFJXVnVpcElzcXM4U0V4cDhwTDAzNGRp?=
 =?utf-8?B?aDNWdnArY2k3d0x2b2Y1ODZHR3k0amhyVVpoc3dGZ1pjVkY2cUx6eTM3YXdW?=
 =?utf-8?B?eVV3UG42MVNwdWNaWHlYMjYzWmJjM3NwaVRDVHA2RE0xSmNaVlV4dzBsSFJG?=
 =?utf-8?B?VjNQOFhTWEordTMyYzNEc1BCYjlNMDZsVE5GaTNyZzZjZms4ZXcyUTdoVDBT?=
 =?utf-8?B?T1dudEc2dHRGcHNKb2lUSDNwSTV3dndBU0d1YXlqdXZEc2h1S1FKTUFhbVN1?=
 =?utf-8?B?dTJqQlVOamhUSUowbDArZDZrbE9sbllnMzE2REdFeTVycmxuQWw4MDJPQ0RJ?=
 =?utf-8?B?dnByTGZQb0lvUjY5S1RMenFKWm5LV0VtSE5JNTk5TUEwWXltek9tdnZYMkdW?=
 =?utf-8?B?NXlGc25ZbkJSRjlUa3IrL1lXZUZKVFN5VUxPb1RJNHNMczBtRm1VcUNXUFcy?=
 =?utf-8?B?aEtMdzY3RHg2MEhYV0dKUDhNazJuS2E4Rlo5RDZFWlVzOXpPLzFObGRscDFB?=
 =?utf-8?B?VWF0aW9vTzNmRmg5VEhnVUNwN0RiNElpZEdYK1Q2L0VYWVR4N0lzMzY5cCsr?=
 =?utf-8?B?KzhOVWxuYzVMM3dlM0FoM2RvSkF6VjIxNlRNd3dyb2VGc2E0bENCdDRzUC9I?=
 =?utf-8?B?KzRqdlo0RVE0ZE5yVVFiMllaQytFRUw1a0JybkdCM2YrN2pqU3VNS0dXTSs3?=
 =?utf-8?B?eVBEQzRWOTNyb3JaZTBYa05PTG9mWUVxcEFNSDVHTW9OY3cyelltS2svaUtK?=
 =?utf-8?B?VEN0RmxucTJnWWh5RFl5RHl4N3R0YytQZlU0bFh3ckZONGNzWVpKYW50NENF?=
 =?utf-8?B?T3ZGUkFITmEvZTFjMWxNZlBIRm9DQXViVk9ObXJwalBPU0xadTJXdDU2QlVz?=
 =?utf-8?B?NDQ2dHNBSXI3SEpIMnMrSWdPaGVObHJHSDRzTW1ncDBpZXNTaFZpLzluckI0?=
 =?utf-8?Q?4Y+6KogbiJrhMYQzVCHhgDayDBOFg4Rpv9jGm?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bb8ae1-08c4-48e1-6b78-08de844363e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:36:50.7649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYKvt6ri6MK63Et2g+56j2wRngoKHTJiOifIT1h48NGICghwYpAKbZl6qtvCu8ht/M2nx2Gck2Zjul9/9moZVk5K+FaqguuIA95iEUBo1AvEF59iuTiprGgrlVFAjuGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11102
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29630-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,glider.be,renesas.com,hugovil.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 628402AE1CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,
Thanks for your comments.

On 3/17/26 17:16, Biju Das wrote:
> Hi Tommaso Merciai,
> 
>> -----Original Message-----
>> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> Sent: 17 March 2026 16:05
>> Subject: Re: [PATCH 2/2] drm: renesas: rzg2l_mipi_dsi: Fix the power-on sequence
>>
>> Hi Biju,
>> Thanks for your patch.
>>
>> On Tue, Mar 17, 2026 at 12:36:01PM +0000, Biju wrote:
>>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>>
>>> Move reset_control_deassert() and reset_control_assert() from
>>> rzg2l_mipi_dsi_dphy_init()/rzg2l_mipi_dsi_dphy_exit() to
>>> atomic_pre_enable() and atomic_post_disable() respectively, and move
>>> rzg2l_mipi_dsi_set_display_timing() from atomic_pre_enable() to
>>> atomic_enable(), to align with the power-on sequence described in
>>> Figure 34.5 of section "34.4.2.1 Reset" of the RZ/G2L hardware manual
>>> Rev.1.50 May 2025.
>>>
>>> According to the hardware manual, LINK registers must be written
>>> before deasserting CMN_RSTB, and the 1ms delay is retained in
>>> atomic_pre_enable() after the deassert.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>>   .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 +++++++++++--------
>>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>> b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>> index e53b48e4de56..9053ce037b75 100644
>>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>>> @@ -484,7 +484,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>>>   	u32 dphytim1;
>>>   	u32 dphytim2;
>>>   	u32 dphytim3;
>>> -	int ret;
>>>
>>>   	/* All DSI global operation timings are set with recommended setting */
>>>   	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) { @@
>>> -524,12 +523,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>>>   	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
>>>   	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
>>>
>>> -	ret = reset_control_deassert(dsi->rstc);
>>> -	if (ret < 0)
>>> -		return ret;
>>> -
>>> -	fsleep(1000);
>>> -
>>>   	return 0;
>>>   }
>>>
>>> @@ -541,8 +534,6 @@ static void rzg2l_mipi_dsi_dphy_exit(struct
>>> rzg2l_mipi_dsi *dsi)
>>>
>>>   	dphyctrl0 &= ~(DSIDPHYCTRL0_EN_LDO1200 | DSIDPHYCTRL0_EN_BGR);
>>>   	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYCTRL0, dphyctrl0);
>>> -
>>> -	reset_control_assert(dsi->rstc);
>>>   }
>>>
>>>   static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned
>>> long mode_freq, @@ -1030,24 +1021,37 @@ static void rzg2l_mipi_dsi_atomic_pre_enable(struct
>> drm_bridge *bridge,
>>>   	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>>>   	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>>>   	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
>>> -
>>>   	ret = rzg2l_mipi_dsi_startup(dsi, mode);
>>>   	if (ret < 0)
>>>   		return;
>>>
>>> -	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
>>> +	ret = reset_control_deassert(dsi->rstc);
>>> +	if (ret < 0)
>>> +		return;
>>> +
>>> +	if (dsi->rstc)
>>> +		fsleep(1000);
>>
>> What about?
>>
>> 	if (dsi->rstc) {
>> 	    ret = reset_control_deassert(dsi->rstc);
>> 	    if (ret < 0)
>> 		return;
>>
>> 	    fsleep(1000);
>> 	}
> 
> OK.
> 
>>
>>
>>>   }
>>>
>>>   static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>>>   					 struct drm_atomic_state *state)  {
>>>   	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
>>> +	const struct drm_display_mode *mode;
>>> +	struct drm_connector *connector;
>>> +	struct drm_crtc *crtc;
>>>   	int ret;
>>>
>>>   	ret = rzg2l_mipi_dsi_start_hs_clock(dsi);
>>>   	if (ret < 0)
>>>   		goto err_stop;
>>>
>>> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>>> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>>> +	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
>>> +
>>> +	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
>>> +
>>
>> Manual/Patch says that LINK registers must be written before deasserting CMN_RSTB:
> 
> NOT ALL.
> 
> Only these link registers.
> 
> − TXSETR
> − ULPSSETR
> − DSISETR
> − CLSTPTSETR
> − LPTRNSTSETR
> 
>>
>>    atomic_pre_enable():
>> 	  startup()                  (F) PHY timing regs + LINK
>> 	  set_display_timing()       (F) writing VICH1* (LINK regs)
> 
> This is not F. This is after starting HS CLK.
> 
>> 	  reset_control_deassert()   (G)
>> 	  fsleep(1000)               (H)
>>
>> Before this series we have:
>>
>>    atomic_pre_enable():
>>      startup()
>>        dphy_init()
>>          write DSIDPHYTIMx         (F) PHY timing regs
>>          reset_control_deassert()  (G) deassert CMN_RSTB
>>          udelay(1)                 (H)
>>      set_display_timing()          (F) writing VICH1* (LINK regs)
> 
> This is not F. This is after starting HS CLK.
> 
>>
>>
>> Moving set_display_timing() here you are setting LINK regs after
>> reset_control_deassert() and the sequence will be:
>>
>>   atomic_pre_enable():
>> 	 startup()		  (F) PHY timing regs + LINK
>> 	 reset_control_deassert() (G) CMN_RSTB deassert
>> 	 fsleep(1000)             (H) wait 1ms
>>
>>   atomic_enable():
>> 	 start_hs_clock()
>> 	 set_display_timing()     (F) writing VICH1* (LINK regs)
> 
> This is not F. It is after starting HSCLK and it is as per hardware manual.
> 
>> 	 start_video()
>>
>> I think to provide the right sequence we need to just move
>>
>> 	reset_control_deassert(dsi->rstc);
>>
>>  From rzg2l_mipi_dsi_dphy_init() to rzg2l_mipi_dsi_atomic_pre_enable()
>> just after rzg2l_mipi_dsi_set_display_timing() call.
>>
>>
>>>   	ret = rzg2l_mipi_dsi_start_video(dsi);
>>>   	if (ret < 0)
>>>   		goto err_stop_clock;
>>> @@ -1074,6 +1078,7 @@ static void
>>> rzg2l_mipi_dsi_atomic_post_disable(struct drm_bridge *bridge,  {
>>>   	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
>>>
>>> +	reset_control_assert(dsi->rstc);
>>>   	rzg2l_mipi_dsii_stop(dsi);
>>
>> rzg2l_mipi_dsi_stop() is writing DSIDPHYCTRL0 reg via dphy_exit().
>> I think the right order should be:
>>
>> 	rzg2l_mipi_dsii_stop(dsi);
>> 	reset_control_assert(dsi->rstc);
> 
> .atomic_pre_enable()
> 
> dsi_start()
> reset_deassert()-->G
> 
> .atomic_post_disbale()
> 
> Just opposite of atomic_pre_enable()
> reset_assert()-->G
> dsi_stop()


You're right, please ignore me on this part.

I missed that the hardware manual only requires 
TXSETR/ULPSSETR/DSISETR/CLSTPTSETR/LPTRNSTSETR to be written before 
deasserting CMN_RSTB.

The placement of set_display_timing() in atomic_enable() is correct.

Meanwhile I've tested the series on RZ/G3E EVK.
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> 
> 
> Cheers,
> Biju





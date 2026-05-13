Return-Path: <linux-renesas-soc+bounces-32608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEe7AiIDBWopRgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 01:02:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11A53BBC0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 01:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 938953019BAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 23:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ABC39A7E5;
	Wed, 13 May 2026 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="I14xdwLS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E633451CE;
	Wed, 13 May 2026 23:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713373; cv=fail; b=l59rw356tdD22aekD9kGsaadU7tgntc+yhhc2yv9LQSpNr1CIFi1vAN2R6iunvvrM4Ac7t+w9jqf+4glJzvcB0Q0epOMKb4PBK8J1RHDnoP38ia9el6furJwtbIOuJum5P61ML9aWYbX55zhbQCWmL0XmObFr+suMhfFgZ7vRbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713373; c=relaxed/simple;
	bh=BlTmb7Dwby0nzSreFVSzwh36QRCppQO6CLsjerCJfwI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fNCqIm9Rn6onT7wcIJQTw9JLLyn+giOTp2JrMHOOkEfaF/+9oktiNIXp2+ufvgB0NfaLPWEv9goGKOOHSCjoSGzxJJDuM0Qkgl/yPCKaodUvZZ88zYdWM6OnEgiFYP0f3sseUqZsTRzxSQPXN2hONpE0exNu8Yj/wPSIlKn4JFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=I14xdwLS; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxcg9K/2kngDyEjWz8MuwTDjalG+d2qS1EFfeJJbv4xOiYaDMyUVJ7ANCq9xaE93ighg8QPG0FDzIfxKdqdpSHJ+CATe2treRjBKb39he1xBUjt2ccmKc4+zlLCyHSqGumJ3i4WTZ6+7WOnvVyQEFkoRzSDIZew+xN8G2U+a2R53VfG+YhE8Ng2dKozjKQRtmIGuEZ/Momc9nlLp7bGGoPD+egldYlT9c+bkndNMIPuJnIEKzQqx4S/ekzJo/AFGFu8BJkJirhMX2Wk3pukAIWaylX+4QeU1RF7SKo/svYfpnECvVCq5dyaHK7fkU8UJtBIYcwCCmtnfz3dKsqX7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5yFCNXmSusGovMtRWAQBki+SFrrDtzksDN5aAUliII=;
 b=bhgrcg9l37qkkMzjDplWDjjfwdzzvvnjHkry/CEwb2EbPYcNhg1V0IJX/3TPMwKj22LGMI1HhHif5CKh8XlxWPpyvwY5WCN0W4qlnDyApKTHdwqGVHfOEEjNnyJIxqfC6GWJ7ZZJOgcGzDYS9QZHxexpBPVDM+35dHAcIRk8PDGRMDvhO2r+gXVyjTNKkiE/cUM7Mmd4qdc7I5IGjpa0DptxlbAmENUNlcmhlszV1pz21I0YR8LRtWcQAr4bE+3qEjyMaPY7js22r9XDsF+pVE8xrGpUFKmN6B20SOuVeT5V7qotOci0vRJ8hoowePlV009oNTjwLOEqimu13FzeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5yFCNXmSusGovMtRWAQBki+SFrrDtzksDN5aAUliII=;
 b=I14xdwLSj9uRUSiJkqel7YSR+/iLWcA3033dKVpyTe9QMrgBLKfcdTSeeukLhSMRGGcpaja5zdMBL8Q55IofV8j8IbppiGjN4WOXV8wrKFztt+LGD2SO405xJIdCyV5Hu7klSn8X3GkASZWR2I6OPqnXk0gW1ITts2rz+/2fej4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10178.jpnprd01.prod.outlook.com (2603:1096:400:1e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:02:48 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 23:02:48 +0000
Message-ID: <87a4u29alk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	"Rob\
 Herring" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor\
 Dooley" <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai
	<tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm
	<magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das
	<biju.das.jz@bp.renesas.com>,
	"john.madieu@gmail.com"
	<john.madieu@gmail.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
In-Reply-To: <TY6PR01MB173774589216B8FAA085623C4FF062@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
	<20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
	<874ikc6taa.wl-kuninori.morimoto.gx@renesas.com>
	<TY6PR01MB173774589216B8FAA085623C4FF062@TY6PR01MB17377.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 23:02:48 +0000
X-ClientProxiedBy: TYCPR01CA0204.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10178:EE_
X-MS-Office365-Filtering-Correlation-Id: c56b263c-771c-4a00-06ce-08deb143c063
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|11063799003|18002099003|22082099003|56012099003|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	aftMobaTiPIBxSn1lDx8dhBv5bkz/OlEb9f9q0Y7a0fwli7P92XziZddA3c5Ob/ra7TtS3NNgnePMRCmphp9Ub14eAiPoEQcxj8FVjc1MpdSHm79huEWwmlgqVzfv5YPbexfveZGECXYkdsvaisVPcfyg4RUrYFqOISziVyguE0caisI7d5HhB5SvSmG72PdGMpYR1s3RjMX+X/1gK5R2MDg2INbf9q2T39orgaBRUWupY1SAK4iTBaWNkba3BnxIZcRpoAWwyM5Miqx4NS9VOyXI5r3Jcd3Kpm9OHFB+3Qho8+HaACJlFIxhdoj8Zcsypipv4qXI7zYkM1MWcQ6RBFQdgzvahpGP+cwYWUJjeBgm1PBzM3fVxleaOJE1cLlYfUlJpdslKSjUEM2eN6BIOEsVkeo9cPbT0k4OKc3spTe50nCYlafPJCz//vkdPpc7tr/4otfV3SnZo3C5VlnlwnfrBrstvAmME2ts0x32UIHKAjRG9zXF48cZZTA/HUWPetjPieubhC88rO3BMhhTLLoatcnVGREodLsmv3X/C8MVT+d3KffNm69KP8LlaJQ5gfTVl6XeDZ2TqxqMiifmr3vGqlhQXKpinDSNJvMOv+w/phUwfWn1dzN7hRTY9Tf1b0Ron8u/X5joXWJBe3WIg/qVTEvolVu/9iGKi5SRZsw6m9sFbvGduBwqu5CIaUoM/2gGDMYOJ/5gCOlam95oiJlPW8/cRIhs3AH0UYpiK7w7ctRxJ3bfTp7EAMp254f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(11063799003)(18002099003)(22082099003)(56012099003)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6stucCrlrYG1yhZB0r9SvyeV2mseYidG3S9iaWqG6TzYWJBvZqlmnee4kCFT?=
 =?us-ascii?Q?KHnQnU3L8N5JOZXa9foRbTxjDcBlAzRRuWyFFkEGkR2fyde9lAs4SfjHkfVM?=
 =?us-ascii?Q?niUab6g3KDfmLn42eOUgU7NdfD7wSYN/x6KcJneOPoZESDZJ6R7F6sbw/q0P?=
 =?us-ascii?Q?vQIO6iHuhqBmfJthhA7zmiaZ8kFwwo68jQz8vojXjc4BPWKRbbhvJKOuaxpw?=
 =?us-ascii?Q?nloMtX5qlmW3lLnpKjwru8zMCSsh7crtgH0FVWSTWEfOZQn/YuUbw8QBVCXE?=
 =?us-ascii?Q?cnCzV49ziJqioJ9i2KLKMyueTf1MA2FAluYzjjOAL1JWmf1nLu6pk9nWEtjK?=
 =?us-ascii?Q?A+RQi27ElJgSuOjT7MchqIH5TsDh/lBfnMgzfHqrcoNAEFhJfHpZeDsUwGCC?=
 =?us-ascii?Q?mtIiXDGQ58ArLRnY95c/Pm/Hj6/R74WiquTfA4Jb4KWdLV1TidZ1Bq6V2Y41?=
 =?us-ascii?Q?3lu2cj+0A/UsJ3Z+FlF6vldvXrezXt2HZf42GT3snuSpXyxtK1VuzYFyqN/k?=
 =?us-ascii?Q?P5vRbXJ8SNY/J2KzvO/hRhmZqEtv4y0TDqoF7JKHpYn5ksQMJmaZ0L178Cyb?=
 =?us-ascii?Q?ewsWN5jwWsjzrRBKW0m0xKWRcCPGn/OH7vhhSSTwOIszksX5ZlFGqYvsVJyY?=
 =?us-ascii?Q?ZcRSiaEIzPZkunWuvYSALWqWAPMiNh9rS36E1I5yv8QRLUXdFZI6X6lZ2D7+?=
 =?us-ascii?Q?hguKC1kb1Elb+iNROOFmVyWml++QTeV+ZiFFD5LAJs7qpa0bTdBel2s5Cw4b?=
 =?us-ascii?Q?rhamtbWegA1Bzclhv5PlqWUqmVAhFbfhDzWPY0QzBK4Hig+3ng00r6s3hRbi?=
 =?us-ascii?Q?BbWOlrYkAQk5xD4V3l6JROKNO43lZzDGUK5ZYc0cgfsN+6utv4xQ+jRb5z+B?=
 =?us-ascii?Q?sqGJRLi13bdBDk759GuuUKFUaFjqhCNtNY0G8TV3TszzhHwv9LqK6BiDhuEu?=
 =?us-ascii?Q?umkOW4hz/BWXBNoDFszeTDc3fFbIN/PcGNyT4HhKLQi17Xu7qcw04Jq0SsgN?=
 =?us-ascii?Q?WOlfc/lovd5uyaMPc9+a6zAdPXNOsSNNXEfcBVbdxMdhdNhuGYgXAXgSLzyg?=
 =?us-ascii?Q?b+pIu6Cgiz8XFWHeCQXY5ZlOU7NJIR/v4EGbDCwopNGyKTNOWbnt/+051f1M?=
 =?us-ascii?Q?EPyujBA6AvDPN7cWz6C/dTxi8PoVWWnbXh6TlGMcqMQBLd7Rnl0YFUGmMt+r?=
 =?us-ascii?Q?eKjdp3wp/gKJqorkdi/hHZ1d/vdzXazPKUUFHBgUAwQGD0YlAurEZ5huX7S9?=
 =?us-ascii?Q?S/tIq0MMTSbcHFXRXGKyEXBzPKJ8nBtb5g1mTiOHTGGSdGtdX33I5vH7Cu6k?=
 =?us-ascii?Q?x4M9XCTvPMf6LvPqgu8X49DXTmJK0AEUxusBGqLBrrqqVginbhP9h4CEKUhH?=
 =?us-ascii?Q?zReUHbKbMUvY9aBH0Zt0sMvCxRR3yMJZEsBZ6ZFa2Pf0KkpBRHkBAeKwZ0vU?=
 =?us-ascii?Q?+r8sBvMqKcXyv0l9exW6YbCgOXRUCZmXayyy4ihlfbLLTqJ4UQJGTNkqkgoa?=
 =?us-ascii?Q?M2/0dSJiR5ZiB/KQuZF20L53JysjVza1E9mDmbn8bZWV4BlgkMDMDyx4ORrS?=
 =?us-ascii?Q?zMZW/GIPbcRroHOsMclHj3yfN6Nkeg1rqXtkCu7gCF3Cq+6gc/YRRDxsgXWv?=
 =?us-ascii?Q?KGWsJn7Py5ASfHa+NrjS1wUNp6T9hT7vy1ETPfqSc3LByoSasYuOJuTQqfFe?=
 =?us-ascii?Q?EMHlM1UN6QLyv47xNlW8ne4C6dJu78U1d+TOPDl9iY/7C/Luy8Cv2Hb87WjO?=
 =?us-ascii?Q?qge9r1qblM8cXpxiYIpWLSs21UcmOT5I24E1lr37F5fTGEFvbck1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56b263c-771c-4a00-06ce-08deb143c063
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:02:48.3275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yp8EBhHM5TnE5kNfkX8tdz7HLj2nYuzc24TUZgPAOA1MuW/tr8iNwRHDEnkJCs0Af2XC7fVRcp33yo4MVeOWgb2SxfXQAkiw0iz8uwV1LfleXKbJ3/elAaWcp8KP6sHK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10178
X-Rspamd-Queue-Id: 7B11A53BBC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32608-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:mid,renesas.com:dkim]
X-Rspamd-Action: no action


Hi John

> > 	- adding busif_status_count
> > 	- adding rag3e_id
> > 	- adding rstc
(snip)
>   09a/N: ASoC: rsnd: ssiu: Add shared SSI reset controller support
>          - just the devm_reset_control_get_optional_shared("ssi-all") in
>            rsnd_ssiu_probe() and passing it to rsnd_mod_init().
>          - No-op for non-RZ/G3E DTs.
> 
>   09b/N: ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support
>          - introduces struct rsnd_ssiu_ctrl with busif_status_count and
>            parametrises the loops in rsnd_ssiu_busif_err_irq_ctrl() and
>            rsnd_ssiu_busif_err_status_clear().
>          - adds the rzg3e_id[] BUSIF index table and the SSI_MODE0 guard.
>          - sets RSND_SSIU_BUSIF_STATUS_COUNT_2 in the r9a09g047 match data.
> 
> I am keeping busif_status_count and rzg3e_id together because they are
> both keyed on RZ/G3E and form one feature ("RZ/G3E SSIU BUSIF layout").
> Splitting them would leave an intermediate state where the BUSIF index
> table and the error-status loop bound disagree on the SoC. Please let me
> know if you would prefer them as two separate patches anyway, then I
> will do a three-way split with the busif_status_count refactor placed
> first as a no-behavior-change preparation.

I have no objection if some of them are related.

Thank you for your help !!

Best regards
---
Kuninori Morimoto


Return-Path: <linux-renesas-soc+bounces-15532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F6A7F050
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 00:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8316417AC9B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 22:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3809C22370C;
	Mon,  7 Apr 2025 22:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OmSGe2KF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA10118E743;
	Mon,  7 Apr 2025 22:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744064953; cv=fail; b=DBZQvDlDF34UqQ1l5UOac5hmTPWF1u8ISnykY6EA/yhQ0/CD27mrNP1zrgWue0LtOILBHxLBntpxdNxCctard+kl0WhM2jUNgZnzX5tqV/EOE/kIowfMMncXi99O1cZ3Ach+QuaQ4KZ0DCGwDoShZfGln+c4osah96qKbcQAzbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744064953; c=relaxed/simple;
	bh=rMjTSh4f2cgpP++tzm1C1enfn019BHDQMJ2RnC9i1vw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LLy6qznScYANlhisI0MjMayCEEmdjcQ2LCnnK+fStKI7Xfu3NvxSRV0PT5YxqIn9sTpsOD/g3+3Iyw/J2BPCvXNqv9Z1NbSX1WTfXRkNoxct1ae4d8+XpWGT+8l5a6QlraUaY1QOoR2w7EF6lN08skTaRg0fGQWn//04ZC2ksOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OmSGe2KF; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vadH6s1lL6CZBrTlQiUqmQgU2cwDqrHp8uhd7R3wXxOcfObGo7uaC6bFi5arYRDm1WRxgo9sqoEX/mkiKdy3GNsPJ2HA1rbVOZ8mkU55O06JzuYNX4kjvOEDwqn/VQFNQnOk6MzaZYCgLrLRXqE6LRxyDXEdv1v2gUVLpApr6XsNuGPewwZdPJ7JYcOQ3ub2DKYZ8mnaN2pULjH1zry+mMlZwm2LvJeI+5AB/7d453nDWHvsNtKkry3REzU8n/f/bhvnUJhojMiQSlhQiEnQ/aCI0APEApOjH6Wfrb7gil+t6sKjJOeDhYcXiAbhlde13zkzXONR2GOqJuKLsUhDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHk7gqKDEmhHE7+RPXqOfd/yL0710I4E5zuc6vN4GaU=;
 b=wYHXvAcRQqYCxkxPx/+f20CAR0A5/VHpOKd6Nguiu8hAR2zHC0WXEtNteod8yQP/t/OUiZhrh/X72P23ndoirANSzzXn8HeL3Eq7g1e4dBssBl8zRs81Ns7rY/Vo/0YWlrRFTuBX7pZlF60M3kEb+JzUMoH85+vSCQrEfmUn3nbGJMWYo0ht+NMD9BFvR5T4K8X+15WNQXk0Zv/cYgSMiMJJ17M3Q4CGImg1iy0ULT2s6JDaf2pf3MMFeau0AoKE/TqpZJqCx+PXr7q2ZZh2rvjTuXak8S1zn0g+XDsgts7hmohtgu4Wu292F1jdk4ghH9lJt6TIXI63R/2NxRYcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHk7gqKDEmhHE7+RPXqOfd/yL0710I4E5zuc6vN4GaU=;
 b=OmSGe2KFxiz/Vk0ZefYp9ytR4IuXXUPgBxtUttR6wob3R9HDKQVfDpCDljs56vJs4NHzZvHs/G1Czc49opJu+DhkOfrK7AMXLHapZr9bUZfdtHZDMmUgf8LGGNh3+lLthvyzMFCQM9yCj697FnZ6oASWOOQVJLTebqvbO64UpSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8553.jpnprd01.prod.outlook.com
 (2603:1096:604:198::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 22:29:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 22:29:03 +0000
Message-ID: <87cydnobbl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/3] usb: renesas_usbhs: Correct function references in comment
In-Reply-To: <20250407105002.107181-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250407105002.107181-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 7 Apr 2025 22:29:03 +0000
X-ClientProxiedBy: TYCP286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 82aeac72-778e-46d9-4b48-08dd762399b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C3WYHXq0C5PPZzR6Bz1Oz8yoVs84zakYi/kWrZGtuB21hG0D3Npry1hlDtv/?=
 =?us-ascii?Q?RSFIT74nZGL80rftO39sgDd7YgJfZ8NuGotEPjL1po2jaV6DysZeGOZIMmyH?=
 =?us-ascii?Q?lRk2MEOqL2skzaZQT7YtUBZKcJMdV+zo4cGVEyeW/wAXOJMoXB7443fzPxCC?=
 =?us-ascii?Q?fSb26P+AaBdF/HjRLeLYp7NNjFFeP6t49PTpTAHKT9gBV3GOijyLrUBXuiLo?=
 =?us-ascii?Q?diupmP4T8dTnGvyJY/YTrY20dvZbpQTP8CaLOrNmRt0DmpQ5j8kppMstByoe?=
 =?us-ascii?Q?b1IBg1n5KQ4B9aLAJKLvYfweVCabd332bIVuvBfeV+40ACqiak3cMMRudeRf?=
 =?us-ascii?Q?4Cues/HB1Ag4C/VY8I62kTS/bPf276w/zczWUfki8mQYhfXunA9I2jb4rCkI?=
 =?us-ascii?Q?CChXjT+BLc4bNmVTM5I49evoWP/WVIOAhIFzIxcvpw702KAB+x5Jhe56elbl?=
 =?us-ascii?Q?c0EH+a4FeuTUQvKIGht7cube0aiIWoL/ZX6psWvw/0w9GikOEvZcK8wJzaGn?=
 =?us-ascii?Q?BB9BrEwS+iubwk1OuneRXL2hqwZNh+HMEAExDEzw5aQWphfNYT43HgNcjB3O?=
 =?us-ascii?Q?mgKxwp++QwDHYOmIBo1jtZ/NEBvXQDwfdrIDBv8VhAiTWyQX7Qfoqy0FI7Tf?=
 =?us-ascii?Q?RIlHzsywKqwRW89B656G8nwehYSySLTGHCqYK/vU7yWT74WKyM4Kr7/la7p8?=
 =?us-ascii?Q?/zQIobZQT1c7fKpxR2XZ3rfpkNqpUFi4ajto0bPjQ4h/n7OcGBt0K8UYhq87?=
 =?us-ascii?Q?w13S/MhV5b5cUUUvAjrdyKTmJDc0tF31B95Lp8s7SZqWdeiec+JLzE3uoG33?=
 =?us-ascii?Q?inaStgvXfaksjOYXxiw/KOZtWWACZDB7IXIBlhgRKgTNny+a6P/nGAWsktpx?=
 =?us-ascii?Q?4xdoBM09peo4s7OB1XmqftOSY5w1UPaDeaNxXLlygJASR/4qU6vF+6V6ArEe?=
 =?us-ascii?Q?4npnOLe5vJgHsnoYtsUSvveqh2tfL8/Ou0r4Fs+VqERi0L70B7I6XZYgjs/B?=
 =?us-ascii?Q?MLMxEffMyV//9pLH2IvbIzQVlG/6k6j9XwgM4Kvi6mE7U/fOwSNCXWoTDDzI?=
 =?us-ascii?Q?0BQ88ADmXknJsATzMvYeszu3EFdf7mWEfg26EhF1evGo/DqMCd1RNpQoDiRB?=
 =?us-ascii?Q?BxZA8E4JnKV6OndcMeetYse/ZHFHR4kMXfq591Sd8psZE+bjgC/4Fq0fvMj9?=
 =?us-ascii?Q?GHW3tDhYPI5jy7thlWZthNL0V+7nRHeeSX4XGSo7w2G9fTwqsj49lxP+xfqz?=
 =?us-ascii?Q?rArUBRIDriMIer0KssX58ttWVw3jyLtefouo/tMEdAAQ+zd8oYa4EXg0jx1n?=
 =?us-ascii?Q?qtHfYsvwn3l622w7BmjuKejXz0dgrOmht4QRmXeJYPJaWEfyQWAhjEtPhZOE?=
 =?us-ascii?Q?QuVFLd76Sc9isUZIGTIvqo9UNPvIUVel4pMgonsjhzf1EHYfkqG0AExfbsEZ?=
 =?us-ascii?Q?y4t9zlI4jNiTpil5SajhwP83vHXOJ7+X2T798uHbrHcRLWfV34lkpw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c7qDZdt1wkK7rjNFqcB0qXhYQV56IZ+OXKT+oiLoqpoiU1azJOfiwvAtEayH?=
 =?us-ascii?Q?YL9Osn1oREB02fhKKwnvTJ2lXjgM1uqAmx1C8QPBrmz6NvWGUWG8NdRNVC2W?=
 =?us-ascii?Q?lZbeRcSVsL6jqdKU9/D11hYnD1znSDGOycHs9ytCUM1ukQWVf8s5S/0TW+pI?=
 =?us-ascii?Q?isZzvQpGczeGsmlE7dy3PDMnPOHW54XqTow1SJPWc0NRN8jDVjrVXfqGhipj?=
 =?us-ascii?Q?jxCKm+QXaY7hwGl9KV0fDpUVek4HbzkG/s7b5RDWcZDPUjJyil/O336tbTfh?=
 =?us-ascii?Q?oVbn40wzqOKz4W50fPqztWiaCTgguJAK3E0z8Mxf95HcEleYA2pUeg60V+0C?=
 =?us-ascii?Q?llkrL3UIntwvba5BFZmtxI56AKbiTcOwh2Va0fqUPtm5/kTaE/WmiWuymAni?=
 =?us-ascii?Q?eu3vtLtTk0mBoKVIhc2po8g+Dhi/9pNQJ/ykeyZGZBIgGJdtcsdfOgLKhzUM?=
 =?us-ascii?Q?XiUCkBFyWxi0WYk+xdYmY8B0acNciFCCgi3FGsq0QHIHBlQ6nEKdkOjqUt2w?=
 =?us-ascii?Q?NWsQQ41vWCAk1YhCCSxlsQ0MfgsOjKN4yKDv2OmANqYgoYJGhyFaWmgHX9pE?=
 =?us-ascii?Q?Y8sckiuymHTf3ItEix8vPqEF00Z5h+E+lVuSwIh28hZz6cVnCgDpvpcI1uMm?=
 =?us-ascii?Q?vHeI5t3gngr03DP0y2YaMbWac5E8OaY/lDrr7RxEYDSZlURzKlf96vieaRvc?=
 =?us-ascii?Q?OQcByxwaWGGZZ22jRNNEbUhoG9CrC9RJ4Yj27MAT9Oz+EmjcNgLe7yjLEXon?=
 =?us-ascii?Q?3JUM4Me+XxSn+XZmby3Fv5KSxYIViyKWhY8E8/Cm8fW/8BGT5sgn80y7ua8W?=
 =?us-ascii?Q?nk6Xp0XlTmc9/DeNk9vzek8nLfBaWn/eMa7YCacT5nYht5NBmFdAdl0eMJUh?=
 =?us-ascii?Q?X1vUXQHJ9NNaS4XHG64IeLnF0DbIVig6x76juXmh0indJVtbPe1TrnYULacK?=
 =?us-ascii?Q?CH0vyovON/h5EThqqhofKJTQwd4TsJuThdrLkUZEYcnz5qRPUJeFQq68zf15?=
 =?us-ascii?Q?u1KxmzMhdPk/0myLyyW7LH1NVet8D+9A/J/ovhD6AvU+nO70NiRiRs7Fav2J?=
 =?us-ascii?Q?tVg26aNMzhCp1I7bK+sd1C4aRvULOvsvdFdb2v4YENBgRzdX164L6+NJ3GFn?=
 =?us-ascii?Q?nEwPNXpoLl9xOJYAsSto4aIhyt8DKL2GYSCTckuzeEBXqLyoA5S93f6wSh7B?=
 =?us-ascii?Q?nHo6u1l0I4Gai4h2RLds6nzv5x9PU5gR2XlIdwg1tESBOX1GO4qNgUsTN8Cl?=
 =?us-ascii?Q?xa6IKwhpvCdJrfFphgGGfUTkrV2dWL4tyQOwF+RTXQl7miMyph0fCqxMiUmp?=
 =?us-ascii?Q?D2srTt8MimoQSFy5/Nx69qp3wQSRnJ9cou3heTTBCI+TivTHue+mcIvkRpff?=
 =?us-ascii?Q?qHm8tztyhj6kVwnKJkf0c41fMU163HwE2dKxh6Tc3CdRHY4zYMQU9AqzqQTk?=
 =?us-ascii?Q?1zm973XJ5R2o//TxRQV3hWIOvUFnEOVu1bNnD7n1yFSUkTUdS7g708CDC9wb?=
 =?us-ascii?Q?pu2zlx4g5vp3TEAcxCg8PRMPs4sMJpMWfRpN4Fz+LQwbirIZ3nT7SaPXFl2O?=
 =?us-ascii?Q?14ZusJjH0flaBZp6tHC0KFCfsfQ2g4Jaq4BOZjOIB3RO00Z5EbSdC8fZpRtD?=
 =?us-ascii?Q?EQ1LzTy+hKgzE/kauQMNM7g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82aeac72-778e-46d9-4b48-08dd762399b5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 22:29:03.2277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBiVJVnTTY2Nt5mwEEIhAhKTb2nR14slKncEXSbVnCCykWfBTfeDY6r3gdVzDhECdLFexebSUJM2fwpWMFNfz7XRKErj7EtKj36aDbvAFB9dmx1YB3w3SXleolN18pFP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8553


Hi

> Update the comment to reference `usbhs_mod_probe()` instead of
> `usbhs_mod_init()`, and replace `dev_set_drvdata()` with
> `platform_set_drvdata()`, as these are the correct functions used
> in this context.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto


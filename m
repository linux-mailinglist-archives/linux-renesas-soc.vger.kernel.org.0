Return-Path: <linux-renesas-soc+bounces-28079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJE0AFXtiWlpEQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 15:21:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 128911102BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 15:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EEBD301C117
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 14:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F323637AA65;
	Mon,  9 Feb 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="A+fRms12"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841B28312F;
	Mon,  9 Feb 2026 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646862; cv=fail; b=CrYVieEuGUHFeSAW82jP92C8iEMPuF9n0+fOxpgfVlkMosGcqQtvXdzDEcBO6GYoGAjsSsn0ftvz1IVKGwLA+86mZj3pDDFE0xk+Pi9c/aG03+7CTPyZV/2apVuLONxq0BjtKfD4agnwkn1xM/Ev9z+Ctif4u4eZnf14ScsKN3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646862; c=relaxed/simple;
	bh=vez+y8WH114nKc8+WpwWcSxo0LTdyPdzorNMdwBAEwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jutWW9UwolP2Tw99j1bJMMrZ2rOJGgB20KWk5SK/xDqxMrC/25y4joMBtIwur6vLRuPooPUqyWFmrAjbPOROS/j+Vya0YgiRKzCOUbeGZx8yZLDgfXKf5yzKok5gKrj4TJxRRKXMqd+aZ9xw4HIGrvYwGFPeKDm4SZRLbDKzcZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=A+fRms12; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fweyGwymuKr4OPVxmfjlWAx+GnASK0xdBDeTZ0Y9hmV160r6Rkm8oDvHahnXkIdNkCacYqaRB1dDrE3siJnlRYiE2oGfGE7qAhIe+Pgp0E/RDWEKL8w1JF57rmOsDeN9BHvaPMQCh23vXcrEh3FCSCB7rakMUN69UvFHPYFeBmrZlPbZV9NEGvo+CKWNeUUax1Cav7k4i4NZYVCPE7s59XEdek0ZZMvidz6OXYuIWlbrLF87hJahXiwFOwPZWGD77JSbVV8gwxVFP2QMPsM+LEmf3Eolhm1vtHSd5aKaYv2sojms6CMTzifQ50SKSF1lXXlAKFWHzK/onWga5rlBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsQcn1DxXaGK23UmFqhSnfntbk6tJ1qmrwLzpDt/dfA=;
 b=KnHxHBFWNPIzJw5qca3dKAAS3nSxAubDPWi2ICjj82FI18o6mmjtDDdi1SZMZ+YJYTKfLhyFuGM/FnmeGXxSnu1fPrWn7pxMpJu/Bx8Aqj0JPu2UnaG3I6bR9QDhb21u3rWk8zaETaf4urrb/roMMDxQrihemjSDF2VglcfuLBHPTuEEgE7K38ZggIO7ofIgd1ZslQcMP4aMAQZ03Vo1cqhxtA5JCN44m3e/b2Vm77S7OI9xvD5DborvpyfrCn8tfz2e2+R8W14wpKpQGBVknD0gRwZajjIQGndpQr2L84ucJa2fHYq6uiZ040rkQSjWfKLPBLyuM20ckRJ9Yuqv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsQcn1DxXaGK23UmFqhSnfntbk6tJ1qmrwLzpDt/dfA=;
 b=A+fRms12MZCqn8oKEA3p+aRsFlM4uS8ucNqfrt7cuWc9UDkN4sin85+LwpYMf0EKEYvOGHd6bT9HE8k6TxNmJM6FGHz+MfmXpaSjUdKpb7Z05GQGbBI3NWR4hZWCb6dn4G3t2k8cZ4gXpoO1z/ZGpeYrzJAd9uI7QEuwfDWQ3VY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16215.jpnprd01.prod.outlook.com (2603:1096:604:3ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 14:20:58 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:20:57 +0000
Date: Mon, 9 Feb 2026 15:20:40 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, p.zabel@pengutronix.de, peda@axentia.se
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] Add USB2.0 support for RZ/G3E
Message-ID: <aYntOLSFDxZTH2YY@tom-desktop>
References: <cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769703480.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16215:EE_
X-MS-Office365-Filtering-Correlation-Id: 1482e02f-370c-41e3-efa8-08de67e67148
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+ROoZ+ItyEkUG8dRwmq5RpcT2ldj5jMcIrAl6Rgy/2TX/ok1nvkyIfkZcj4D?=
 =?us-ascii?Q?Yzu4/UPNTMMVPW+sFeYGlGyWp0+IyG00hBXeVEJsFvXgEC1M/+RyQPhg35hV?=
 =?us-ascii?Q?DdNSHQobbEJBINxN3PbtTNSBxn1olSfS35tE7In2gKx2/6AU75+whIAu6QAW?=
 =?us-ascii?Q?gtdGxwFiXrDxE0S9Amxq1+NFSPs+Vkr4n/5wCrMw3z04opUmKDQDo+DbIyFS?=
 =?us-ascii?Q?T8rmO9/UhfvICiKu8GlIZEtDiCIkKqX3IzdPmSLw8hrDq7y67HTH8KFm5jgw?=
 =?us-ascii?Q?GIMdz2/xVldO2t2jQuT/0TZryawAACsoAOchChtDJa1hyeNDq/qqTDVyGzpU?=
 =?us-ascii?Q?rbvF6QAggdST1jyFSKskj0TVPLrXklOFQ9umZn4TrOmwuXL1tMEXI4YlmlX4?=
 =?us-ascii?Q?Df9/ItPNwOQLY32lkWudnG8Sqnng1jBXxAbPbAehG90l8C13T37NrQh2Z6Hw?=
 =?us-ascii?Q?YqxacnAAHHoBAMMn5QdZskKW9FOAlBXxkXDy15JeIqBonZNCqzvoWLvq2DRo?=
 =?us-ascii?Q?MZJvNdk+VqOatV26mf6ScT80x509OF1nYcgDEtnjOogUp3bJ8i/Jwp2Kmn4Q?=
 =?us-ascii?Q?dFWYPXYQanOMVksadKSQ67NV7sN6a/yE/UpNMoDfwYyBfAA1zH+aRz71Oxkf?=
 =?us-ascii?Q?xr+mM57qK1OGkSzZO8PFu8XFfQLVNFuhZ6mlrRPJrWMQJRJmB2rOtmx38PMh?=
 =?us-ascii?Q?cuyWPoZoak2YeDOfSukGdcCiMw2L2ziMnAv/NvyEqlOnxyO+Fac0B34p7zWy?=
 =?us-ascii?Q?k/lSR7HFj4BzZLvu9TBxHKQItOah5KeDIvCou8CYkYmNPBeKL6qwaiNxbA7Y?=
 =?us-ascii?Q?5UTfVDdVCIAsU7MXuukE0huoL6Kx/u+Y5XBn/myHovvdP9nPjOtwo0OJjIPV?=
 =?us-ascii?Q?YTB/B7dRNogEupYdAP3oHFCUFr0jHJGn6Q+ZD5HTBt+OaF8tayLabWAh5vNv?=
 =?us-ascii?Q?3fxanO2v3TFoz210mcBZcIEPcA5vK++hecy+wv8EiuelubyZ8EkKHF/l7ntl?=
 =?us-ascii?Q?Drw8AFO41Fs4GIc4kkPWZbiN/RH5/C3L8wUWWk8gaSGNYMJzxL8aubMdvjIV?=
 =?us-ascii?Q?iBdyTqbqIMTy1ru/HEmHOswPO5ByP4FlB2ZkDM4xLwYmFhQhejh+iEuMwyiJ?=
 =?us-ascii?Q?FeA2AviRtKUeNhZBlvj66ndPYUYTEP61hjtH/WhAueggQ1FVajlo0L5+7mnQ?=
 =?us-ascii?Q?GY0BGTtjblVdzJF0Ax5/ePeK4f6Y3EoMkmN/0f4SxV1yrnjivHZRAbRYAvvK?=
 =?us-ascii?Q?SUz2sp2UlJETkNuuBnAtJbswury7Ie2KqE8p8giX4IwX0E+UM/Wy8MOGfLHI?=
 =?us-ascii?Q?yvzoHjAIHdoJg3ur4gZN8iyH1j2ppwHn0aWONSdgAlZvpWwcxd8zu9ivQU7G?=
 =?us-ascii?Q?g+dysaHNdLiQ/E/XAgJoWfPh7nMMRP15OrORt9thwvuf2MJ3RLO/5UGNG4R5?=
 =?us-ascii?Q?JeDsAP6x9Jbk17dfovL59Hr0JpI+4vnXmsMCQ5eafH1a7JrqJNr/Odv/296e?=
 =?us-ascii?Q?P5GhGvUmeCbGJ6iNGVOf0CDO/eHd0Mak1cLriftljH9/pEK9ygjt0yGR1jZB?=
 =?us-ascii?Q?Aiq5hDaJ9LDSXR9cuGrFL+CpI6BoQ+1sYwR2a7Eu1AVkO3KdHpQvvWRs5Cm1?=
 =?us-ascii?Q?XISrtEVQXMvC4SrcxjlI4NM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GCTu1p9FZVrcwvi3qRaXGkMrMKIFyshIIPiU2b7aqV2vdr6bVVae5IYh5n9m?=
 =?us-ascii?Q?g8T/V20SyHPr2Dyz1rwNVGXZNQI/m86YFW4QZ+V1j+FMo4FMGCF7f/QpC/Mh?=
 =?us-ascii?Q?+AXQsLm38Ksn3J+iwMiGXv2qmqOOwLmsbeSqmO6Leqf5SuqKnejWWPZO3Rbq?=
 =?us-ascii?Q?TAD7iO7pF2LyFL0PZ0KdtiaNXT0MWjo1Spm3ZXbhuwjk9aI4Jh6TiotXkMFd?=
 =?us-ascii?Q?QrQPsBJSC//L7671JlphzmI6rhFwlNju6NBBRCmeCTXZOs0MKKUThryGvSSd?=
 =?us-ascii?Q?ny/SWmhIjSmA2+P+fC/Dj7WRJqb5HGJL3h4Hqc0gYXlIZNdKnxhmOmvJfY8R?=
 =?us-ascii?Q?ZcvNA/w55kPSA+9ckmfFuYlEhlH+yGceLuR29JOkfoQrX5qCX9RMqvS9L53N?=
 =?us-ascii?Q?PeloTct7Tkot5+S7BbHMWcnf1VYLAvz3xH+zGz5yZpNHSb9yUT3Q5500RT2F?=
 =?us-ascii?Q?RvIr1PzrzJi8JFKo9WWbIGAZDiSqFZP9LJCnWHXO6pwlX+uVQVVHxpZZNHpR?=
 =?us-ascii?Q?l/oeZVqOPKwY75ycb+de2d9ap0ruekr94hPRJzQLDVp1YEPqL+qL3311IPiB?=
 =?us-ascii?Q?3tdz4mDUuxDhvXPAmIkPwTDw0HtWyfbabXkYEG0ddZbQzXaavF0htE4cr1rO?=
 =?us-ascii?Q?Sp6Hbol98W+d71bXO9S3/99P6ufa7JThhRbIDlON5pHJCAgjDHAo0lJyOhrG?=
 =?us-ascii?Q?mkTJgxSHzYBOoZsO7Lkk/U4+kNmFPZ924p1/9WV0eyk6QjLGA4j/3q0vzE4y?=
 =?us-ascii?Q?DEOG2ttZCIXIWX76QldfKYmDPXeOHyTcy6/1fZ3na9My5eEcx2tocoDhMCB1?=
 =?us-ascii?Q?ZRTOUkPMYVfHhyjHMUv/ThGFEOyze8YVw345ltN0L9db5HimRKynOpLKDpDL?=
 =?us-ascii?Q?pEeFUtyM0Um8QGqkTqg4hvneMFAdvS7twvN+7dwNjd1yf6gEF8TC9mro/Rbe?=
 =?us-ascii?Q?fX8LMtRlPpFohtdogwn8lo3fhdf2rjk8mE2zBV5TjKp5hfNeHhVCHoHv4xvG?=
 =?us-ascii?Q?VFI2UYdKV27Ga4bGofBM60jAFCe+zhxXhlXuQAr3oApPjkSlswcYEOJHITOO?=
 =?us-ascii?Q?gmoDBXjOBs6S8zaZYnGQBeLbNFcVRjh5lKwRd8Rw7Vji+lQMbQAGXk/L2lr4?=
 =?us-ascii?Q?+b/wSv+Q6lm3z22RyM/ChgB72BiZbupwIjVUfgZcYbUItMSbARH1f7xi6weB?=
 =?us-ascii?Q?Toy6KhHfG1yoH5RkzNol/YIHx1+w+pc7GKmWZ1oPZbA5ENvbOEqz+M+t3kfV?=
 =?us-ascii?Q?EolmMdk/oCYaQTdEeplmKKMkc32AvRLdF6FBoU7WpR2uWdSKGaD2SxD8ppZI?=
 =?us-ascii?Q?uHaDfOA09v+WM7o7Yvp3766CAS/2H+p15Vzd5SRUXUSbdlYaQA/eFTTqrq/f?=
 =?us-ascii?Q?3pJv4XxDSFW5RJpcO8RYW0f+0uYxvE78DLIIoWhjthhHyzPoKYzni0TIMQtI?=
 =?us-ascii?Q?qP4W+QVxS+wBigZmvJh6xoxe5Q4jouP6u4+NfXUQ7WOEG2nHjzutu5/VNK3T?=
 =?us-ascii?Q?t3P4bOV8CxFTAwkQoSFPjrDzFY1qR3RPAK9hTICvS4LK7WQtaV2kTh+aMSCp?=
 =?us-ascii?Q?Cb/vLtgX0Sbno0pYMCtZvzoirqs/YWG27OE4Y7R5XFWYrcttjoQKJwuq7hrB?=
 =?us-ascii?Q?mMPD+kbzHhVlPKEm2HB9igTIHtuPOHmKMzcxikJmT7RcacLrKisOiHatuUhN?=
 =?us-ascii?Q?UH0KihA7A4vQuUCMwQbESTo/IabN4OYxZIfz0pBKGhxXg0tB/Q7qYs4QA60d?=
 =?us-ascii?Q?dG4kWOwF6MiuGMqYO6OCfCbjecCGv5jpIPdQ5RHX5uJZWgsn6P1p?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1482e02f-370c-41e3-efa8-08de67e67148
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:20:57.7828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZGLrGAEqUcVXSS4Vf3T1EWIgdq1xbRbQBIEzfjsH5aBMd6MPf22pTaMc7WYaEum2gGTeASLnsb1KE7mpSX4rWVIwGASrDzqy1XnEUow4oNWrGDr9d4Rt1tsKoba9nX6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16215
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28079-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,axentia.se];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 128911102BA
X-Rspamd-Action: no action


On Thu, Jan 29, 2026 at 05:48:47PM +0100, Tommaso Merciai wrote:
> Dear All,
> 
> This series adds support for the Renesas RZ/V2H USB VBENCTL VBUS_SEL mux,
> which is required to properly manage the USB2.0 VBUS line.
> 
> Splitting the series [0] into per subsystem series for easy merging.
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1035721&archive=both
> 
> Thanks & Regards,
> Tommaso

Hi Peter, Philipp,

A polite reminder for this series.

Thanks & Regards,
Tommaso

> 
> v6->v7:
>  - Rebased on top of next-20260128
>  - Splitted series into per subsystem series, no changes.
> 
> v5->v6:
>  - Rebased on top of next-20251219
>  - Re-arranged series order per subsystem patches.
>  - Patch: 3/14: Collected tag.
>  - Patch: 4/14: Fixed commit message.
>  - Split from dts patches will send separate series.
>  - Added merge strategy in cover letter.
> 
> v4->v5:
>  - Rebased on top of next-20251127
>  - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
>  - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
>    Makefile, Kconfig, function names accordingly.
>    Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
>    Updated commit msg.
>  - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
>    Updated commit message.
>  - Patch 11/22: Fixed if statement for mux_state error check.
> 
> v3->v4:
>  - Rebased on top of next-20251121
>  - Added patch 01/22 to remove nodename pattern from mux-controller schema.
>  - Switch back to v2 implementation for mux controller in patches
>    5/22, 15/22, 16/22, 21/22.
>  - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
>  - Removed mux_chip->dev.of_node not needed in patch 06/22.
>  - Collected CDooley tag in patch 09/22.
>  - Added missing select MULTIPLEXER into Kconfig in patch 11/22.
> 
> v2->v3:
>  - Rebased on top of next-20251110 + [1] + [2]
>  - Add missing Cc: stable@vger.kernel.org in patch 03/21
>  - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
>    Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
>    from rzv2h_usb2phy_reset_probe().
>  - Patch 04/21: Manipulate mux-controller as an internal node.
>    Improved commit body.
>  - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
>    then update the aux driver accordingly.
>  - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
>  - Patch 08/21: Improved commit body and mux-states description.
>  - Patch 14/21: Manipulate the mux controller as an internal node,
>    and update commit body accordingly.
>  - Patch 15/21: Manipulate the mux controller as an internal node,
>    and update commit body accordingly.
>  - Patch 20/21: Manipulate the mux controller as an internal node.
> 
> v1->v2:
>  - Rebased on top of next-20251103 + [1] + [2]
>  - Reworked series to use mux-state for controlling VBUS_SEL
>    as suggested by PZabel added also mux bindings documentation
>    on phy and rst side.
>  - Collected Conor Dooley tags
>  - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
>    rzv2h_usb2phy_reset_probe()
> 
> Tommaso Merciai (2):
>   dt-bindings: mux: Remove nodename pattern constraints
>   mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
> 
>  .../bindings/mux/mux-controller.yaml          |  6 --
>  drivers/mux/Kconfig                           | 11 +++
>  drivers/mux/Makefile                          |  2 +
>  drivers/mux/rzv2h-usb-vbenctl.c               | 97 +++++++++++++++++++
>  include/linux/reset/reset_rzv2h_usb2phy.h     | 11 +++
>  5 files changed, 121 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
>  create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h
> 
> -- 
> 2.43.0
> 


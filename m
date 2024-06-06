Return-Path: <linux-renesas-soc+bounces-5911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E848FE343
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 11:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DA5F1C25F2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 09:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3836178383;
	Thu,  6 Jun 2024 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BM1pyvW7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2060.outbound.protection.outlook.com [40.107.114.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302F154420;
	Thu,  6 Jun 2024 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667005; cv=fail; b=XgwwMx5JmEvyUrn1zo4RcA0QFCEtA+FmZk6s8XaievhH/nhsjWk8bsj0KSLW87CZN7iajbNV9WfdCqw9XF86mFjs8ErSwagAU31fbVGM2DBgpTSvWyPxA/PEGBccN9h7tK9mRgAjlZSSIw7A+M04SiB4bkNWFRFEOh1+CY9Q6kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667005; c=relaxed/simple;
	bh=ZbIkVUgd/Rg5gczu8sY+CaWlGoELKxeSltpR3pc0iuo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kli/3PCoNAG1kObLMUVFF5ZbEZOgJlyxm7AebSNSpXCRVHt73RW0JawWB8ug29F8cD7NZLHDD9FDpVL+ovpQuzjpvEVwPynDCrVF9gs/LEzg+XlOyMVU3ljjcms5eTo+Fr3AVPgwEAxYcEOmGfj+8t3I1t1c55DNymp5SqjQns8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BM1pyvW7; arc=fail smtp.client-ip=40.107.114.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fw07eAJT8ZyIjfTF5aOZcN9+onrnOzn5Jx2tiYdgPPolM24Ep3WmAFa7rEpUqCphGAoVqIYGZQ0v+z02/oUi/GV3BtSz7J2qkIz3QJKSuzKAQ6W9rRdGftU9VMVOIBngIKoDNv70B5rmymczSElQ3z5ae43crnbJyLIqK+dy0nK5q9TZtEk0GgPnaoZDyyzzQ5WO+Hqs+Q0jtvpCFwzvvqSfPvzKNkmvksR8XP88HIuVazqRqF2jommSk/uVKrp6L3DE7lnWtuw1vdjHYB+dYdBQJPsEjkThOx6Y6JRe6U7UHC/m7lTuWalSPwV6QR8HRhr9FC5/1lcYArl2PkZ5Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbIkVUgd/Rg5gczu8sY+CaWlGoELKxeSltpR3pc0iuo=;
 b=JnP2BvhsYz6qY1Ly43Kns1BUtiXRtDkpBcjrMebRaM35uRmTAmtJih3gw7wOU2Kr9PIHcTYnl8ZvlKC8YTbx+zz3JCi7iJ9M1KSNAnJKE4oH2K6BfqqSITjc/T8fw7cgTkM6Bad0HllHNagL6k7Y5grcZINGjJFQdK81nGDhv6mQ6zP/lTbFqkkELs8jJw7VMn3AMCKTU1D913GMdrS+zgEySqq368TE1EkDPzlv2ZcSNKXHjkZBDudKuar9OJ87xpFsObDFw9DZZa2wGVIcsSWDHdNkE0MSLMKh8hc87n4WhPC/xFMfrupdDJdTcNgqt+TCfbo09vgnP1WZLtNYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbIkVUgd/Rg5gczu8sY+CaWlGoELKxeSltpR3pc0iuo=;
 b=BM1pyvW7go3eLF3m4W3TLPN6Ngdtx6p//Mzg3ulP5QoEnMN6+Er7asBOlE2+E97KScBuhOC/EoE5x683aMt+9AGI95uJNfuwUm1+Sy2a6sI/tccxIzTFDt9SO3W9OwyvOpCbRAVGZ0wvndzbOudaZeSgQ7Vm7h0d5XNorThS6Rs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8781.jpnprd01.prod.outlook.com (2603:1096:604:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 09:43:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 09:43:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Topic: [RFC PATCH 4/4] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Index: AQHatxz0mhzMiwcEyEGyJWqnXXuc/7G6d+owgAAEWgCAAABWEA==
Date: Thu, 6 Jun 2024 09:43:19 +0000
Message-ID:
 <TY3PR01MB113468DD4C215E58B4499BAAA86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113464449FACE8364BF667CBB86FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tXLsfTvuCWDqiFkWbe=C2Coo8KF4GchbHPzOG+RTiChw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tXLsfTvuCWDqiFkWbe=C2Coo8KF4GchbHPzOG+RTiChw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8781:EE_
x-ms-office365-filtering-correlation-id: 8a46101f-1309-4071-e24a-08dc860d1928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|1800799015|366007|7416005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?VSt3cGk5TERYcTVLZDREbGlyNnZkVFBScXdRZTE1ckgrcTV0TjFMQW12T1ds?=
 =?utf-8?B?SjZ6bmNvS3pzNGpCVmV4YTIwWTVvb2d2a2xIQXdWS1dJR2pYTEVlTm13K2tS?=
 =?utf-8?B?TjUwUnZGb3RqcklzdzN6blVrWkkyL2FlL3dEM3doVjFYSGVaaFhQN2MzZk9a?=
 =?utf-8?B?TVh0K25mdmNWL2ZZMWFwUGlOVUdCMGcvV0NYbk91M1B4aFo2MXQvWW1VMjFF?=
 =?utf-8?B?TjhPZzB3L3Bta3FlTXRqTHRRWktUbUlCZktsVHNXaWV0aitCemR2b1NickN3?=
 =?utf-8?B?RUFyRDdmalBubVRrcVFKclZPaUNsRzdwRkVIZk9JRTdaa3dwcEROcDZrSmFX?=
 =?utf-8?B?QnllNzhqZEJKU0NZTVZPVTYxM2dJOTYzd2JXSHNib0ZlcjF2VFJuTzFZWGlM?=
 =?utf-8?B?dGZqa2tzNVlkRUtPUm5wQWZuRTNuK3ZPMHZWVDlOUmJuSFgyVnVQc0FpVEcy?=
 =?utf-8?B?aFU0SklSWjh0S2hEYTJpMW5PT2hYM0pEcmNHenl5bVFLdDI2KzhpVmxvcDJD?=
 =?utf-8?B?bW1Ec0N4U3JBWGZEbEZYbFY0YTU3TFRLMzd5NkltbnVQNm1xUXFvcjNsSDNp?=
 =?utf-8?B?SHFtRmJlNDlXYXJSV0hkVGRBMkRnYytMSm5ROEJWSjhITjZMemVmeWFBMy9t?=
 =?utf-8?B?T3ZvVHN2TE8rZ2c0UmtRTEtDZE94MDRBbHJndndPVVErbVNFWFZ5KzJtbDNn?=
 =?utf-8?B?RCtha1g1ZzlVL1Q0dlhrbFNuRC8xSUtuUWRNWVllTnk0dlFuU0IxSGNQUVlO?=
 =?utf-8?B?OVM4TnFoOGwxMFNSZVNhYytRcTgwbXl4RGFGM25kaE4wakd2enRUWE1kb0du?=
 =?utf-8?B?ck1IN3RUMDNzVUxTZ2JVKzhJVmFoMGNUMFUvUkhqMkFuSldWalliQ2dqUE1B?=
 =?utf-8?B?WUh1b0NZc0NHOUZHOC9SVTBOem1QNWh4eFJKYVMvUTVEdEhvZVdyVWw4S1Z6?=
 =?utf-8?B?akdZNy9UNU9KN29iVysyMGNqOGJRVmFlWjNNeXhISFBHUS9kVW1LUjJvQUVR?=
 =?utf-8?B?MjNJaTN4emZlZ0NYZUhiRWRITkoxVTAxWGl5SHFUUjFhQk1NeG84cHpHQ0xR?=
 =?utf-8?B?bjArS2psNlMvYnMzR2RYaTB5c0FqOGJ1enprcGZDcVpPMFR4ekNqcTNSN2lC?=
 =?utf-8?B?cEJqYnl1cWN6am82NjY1WGhDZkI2RXVWN1djRmJxV2FEUHpyOGYyeXdtT3hP?=
 =?utf-8?B?dnRSN1lqUGxVeHVLTjkzRFhNa25nT2dPQTg5MkdGeGptR0VyWW41eEJFT0N6?=
 =?utf-8?B?cjBoWlRVWHhqTnNIUVk5MFlPZnA3LzZ0UFdVQ2REWWNRZ3lvVFNVWHYwK3hr?=
 =?utf-8?B?aWNvTjR6OS80ZUZQUW5VNGZRTkxqazgrMTdkcmRxVGNqbFZ2THU1cGtSVXVj?=
 =?utf-8?B?YXdINUlySnEreHJvNkhGODY4V05XS1JRam4wUldPeE9rSlFkUlpmcjRFK1NE?=
 =?utf-8?B?UjI1YU9vNUFSZ0NBMG13QTBTenhuMVNtVmVDNjZUTnJWQ3R1b2JSZXJOQ2JO?=
 =?utf-8?B?Zk5TaFJhOFpFL3ZnZHJnKy9MSFZSMU1rNlFOQTArRlVpajFsV1d6ektqT1Fv?=
 =?utf-8?B?T09RM1VUS3pLQTM4WXAzbWFHUG5qT0hsZzI4N1R2S21wbGtPU0hOaVY1cHhS?=
 =?utf-8?B?UmlHd05CL0x5Tk44WVdQeVgzOTJwQmRQalNMSUJJbzFZOWZWd1RmSnE1R0hT?=
 =?utf-8?B?azJueUdOWDBvN253em0rS0RqOUZ0SCsvbzB1eXJseGZvL2FiNDNGdmVmNXht?=
 =?utf-8?B?VEphRnAraFNOaXB3bzNJUWhMem5Sb1dCcWFJeWhTRWU3enUxdDVoT04wVEs1?=
 =?utf-8?Q?dwcwbXOSO2D9NoK9Lba0yQ+LFp1mI0VMrGPzg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUdsL01GVUpReXhaK2RmZ2tXU1d0NDZ6UFE1cHoyVi81MUJEUy9rSjgwdzB3?=
 =?utf-8?B?cnNRdHFuNzRVTGJTUnplcHRCczFYZkg1UVUzcHB1bS9TRUdxNm1selIyQVZw?=
 =?utf-8?B?anM3bGhhY1N4cllkMTI2bWk5R2IvUUM5NVVDcnR0eElhb1dMd0xFMmRvZEgz?=
 =?utf-8?B?cTZmeVBvY3Nxdjc4bG5VUFliZ2MybWlSRHo0Z0lhMGZLOU42M3Jzd0twOC9D?=
 =?utf-8?B?Zk5pMVlveU1WRVV1YUNDMkpHTDBiRThOZ1k4QVVSZkg0TDN1cFJpSnVXODdr?=
 =?utf-8?B?R0gxeUtWSVJpUWFRaTN2NTFQUG1WUVN6VVRmdXhEM3JmdkZ2cTJCL2NrVkdw?=
 =?utf-8?B?VWhvMldKcHFqNjk5eiswNGU5VEQ2WjE1U01CZFM2QmJPTTVjeTgyZkVyZ0xh?=
 =?utf-8?B?QWdJSzVGNUxVeDRqS3h3VmRtZ2NqTlhadWN4QTNRSUxmaU8zSmx0NzNCQkRo?=
 =?utf-8?B?bmFjYzFKckpEc095WmlvOTk3Mk5VMitJcTBkWWxtek8vMk1VblJuWHBhVTZB?=
 =?utf-8?B?N1R4K1RYcm1zaUlkcWVCb3lHeTJieUFTMkJSMWc1aUlLblp5MXk2WmdzQlh3?=
 =?utf-8?B?eWl6alJncmxIYU5GZFZiWlMyNXhVZzNTRWF2d2lkTmc3VkpiUjd6OExsdUh3?=
 =?utf-8?B?ZFdrcVZyMGRLYkt3K0pBaUloM0VGUTNaSVVTSm9NbFdkN2dpZllXZVRKWW52?=
 =?utf-8?B?L0JlMWhLM25vTVBLUFFOMXdKWG53MGJBdUcrYUlDaUl2Q0NyWWoydFc3S1h5?=
 =?utf-8?B?Umx2QTJGWlRPcTZRUVQxLzhmM2ZHRy80cEVYMlZ1L1hBMjc0ZGt2anlnQnA5?=
 =?utf-8?B?dDVCemZ4L3NRaG45dkVpSFBDMVdhei9FZVRTOGsyVWJ5M0J2S0FENFVpWk9O?=
 =?utf-8?B?L2h4ZTNncUdDSU9kd21KSzM3M21vYjFGM2F0cUZldFF3ZUthTlJDdkI4bVky?=
 =?utf-8?B?ZnIxVTY5THkvTTRqS0JWVU40YWk2L3RJOFIxdUtrcVRiNk01djdrcDFDYVg4?=
 =?utf-8?B?NTNKaFdlSU9GM3JNUTQ0NHlWQzF3ZjlIeFVBL2pOam9CZ3p4SE8zbEUrcVEz?=
 =?utf-8?B?bmtHa3Z6NjNDVVJiUGJRMmh5MFRJaEJNcloxbzBVV1g4R0xxVzZIVWFBTzB5?=
 =?utf-8?B?Z0dJL0NUUkpWVUJYNGxyTklFK2I5Y05PbGdLcmVSNkZUVUxQOVFCcHdvSlpR?=
 =?utf-8?B?T2RnSUZRaTlNc3hhK2VyV1JQWHB1MGFGUTA4clR4RUFPbFBnUmNGVUVrYmli?=
 =?utf-8?B?TG02N3N2TlRyRmVBbTBZazBYcUdJUVBwbjhHNHZQV2VDd3ZhN0xiTjhWSzhp?=
 =?utf-8?B?OFhwR2gwTXQwVFJGWmZ3UVZ0OU1CeG9NQWx1N0hvMFUyYVY1dWkxbU5rdDZk?=
 =?utf-8?B?Q05scGJ6cHJNMTUzakZGKytjU1hKN1VvK3UzMUd5ZFdYTUV4L1hiN0tsSDNX?=
 =?utf-8?B?enFiSmFkeHRUdDB6UTI4QnliYm9ubDcvZ3pmL2EveC9BL3JPcVpSTXNNZkF1?=
 =?utf-8?B?emRVc3ExaTRrd25aaEp2MWxwOGFxYlF6UlVoUWVXVnVqeDhPRjBCZGZzZ1Uw?=
 =?utf-8?B?dTJsYjh3bHpYcTNTanhZalorOFNDOWFBQlhrOTB3Z3QzaklscC91MHdyc1Bj?=
 =?utf-8?B?L0lJa2ZxdnVxSjNaNVpzcDBiS2hpOWo2VllmeE1ZNm1JUXFMc2ttSjhvMndh?=
 =?utf-8?B?YlpnZWgwSUptbUZkTitZcXcxQTBGanhqSytCL3owRDN0bDJFMXpCblE0bEQ2?=
 =?utf-8?B?S0tNb0N5UHNoNklZL2k1V0UvdHFzb0IvLzcvbXlIV1FsQnFCWmpBUVN1K2hR?=
 =?utf-8?B?MnRIVkVESm13TlBqN1FFT21RNXNtUWU1K1B4V3pubVFJTWpzU0JKTk5heHZ0?=
 =?utf-8?B?MHpydm9WRGJGOXR5ZUFMMTZtb3lneWkxZHg3ZHBvVllaaHY5MWtUQlZCMEw2?=
 =?utf-8?B?SmErZnRValdPVUdqUUthdWc4NzhtdGZoQldHNlk2WkNOdzJqR3d2dHNjYW9T?=
 =?utf-8?B?OUk4bXdGWkxqUUVVc1IxUWIvcy9IZnZBVVRsVUNwWkhaQ25VdzFMY2FkU2Zx?=
 =?utf-8?B?NThPaFprNG51cjhQeTlxejJ0VHNCQXZCbmE4eXJ3NlNiNFFRa1JmUkJ0RE9L?=
 =?utf-8?B?b2tRYlRHNEZpYkkzNUtLcDVmQmoyQVdEVGJKM0ZUY3pqTjMwR3kvYjN3NE81?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a46101f-1309-4071-e24a-08dc860d1928
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 09:43:19.4308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1qZjWO8IQjQDc4yEAPjIu3xdc06ZYnOQeuhaaZOLTsWY7g1lJWULkUDV2wB068+Dsut4c1RRpGcsAQNZLyVwQpnMz3HjxWATw6fQijvzNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8781

SGkgUHJhYmhha2FyLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
TGFkLCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgSnVuZSA2LCAyMDI0IDEwOjM4IEFNDQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDQv
NF0gbW1jOiByZW5lc2FzX3NkaGk6IEFkZCBzdXBwb3J0IGZvciBSWi9WMkgoUCkgU29DDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KPiANCj4gT24gVGh1
LCBKdW4gNiwgMjAyNCBhdCAxMDozMuKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBQcmFiaGFrYXIsDQo+ID4NCj4gPiBUaGFua3Mg
Zm9yIHRoZSBmZWVkYmFjay4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+IEZyb206IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4g
PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgNSwgMjAyNCA4OjUwIEFNDQo+ID4gPiBTdWJqZWN0OiBb
UkZDIFBBVENIIDQvNF0gbW1jOiByZW5lc2FzX3NkaGk6IEFkZCBzdXBwb3J0IGZvcg0KPiA+ID4g
UlovVjJIKFApIFNvQw0KPiA+ID4NCj4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGUgU0RISS9l
TU1DIElQcyBmb3VuZCBpbiB0aGUgUlovVjJIKFApIChhLmsuYS4gcjlhMDlnMDU3KSBhcmUgdmVy
eQ0KPiA+ID4gc2ltaWxhciB0byB0aG9zZSBmb3VuZCBpbiBSLSBDYXIgR2VuMy4gSG93ZXZlciwg
dGhleSBhcmUgbm90DQo+ID4gPiBpZGVudGljYWwsIG5lY2Vzc2l0YXRpbmcgYW4gU29DLXNwZWNp
ZmljIGNvbXBhdGlibGUgc3RyaW5nIGZvciBmaW5lLXR1bmluZyBkcml2ZXIgc3VwcG9ydC4NCj4g
PiA+DQo+ID4gPiBLZXkgZmVhdHVyZXMgb2YgdGhlIFJaL1YySChQKSBTREhJL2VNTUMgSVBzIGlu
Y2x1ZGU6DQo+ID4gPiAtIFZvbHRhZ2UgbGV2ZWwgY29udHJvbCB2aWEgdGhlIElPVlMgYml0Lg0K
PiA+ID4gLSBQV0VOIHBpbiBzdXBwb3J0IHZpYSBTRF9TVEFUVVMgcmVnaXN0ZXIuDQo+ID4gPiAt
IExhY2sgb2YgSFM0MDAgc3VwcG9ydC4NCj4gPiA+IC0gRml4ZWQgYWRkcmVzcyBtb2RlIG9wZXJh
dGlvbi4NCj4gPiA+DQo+ID4gPiBzZF9pb3ZzIGFuZCBzZF9wd2VuIHF1aXJrcyBhcmUgaW50cm9k
dWNlZCBmb3IgU29DcyBzdXBwb3J0aW5nIHRoaXMNCj4gPiA+IGJpdCB0byBoYW5kbGUgdm9sdGFn
ZSBsZXZlbCBjb250cm9sIGFuZCBwb3dlciBlbmFibGUgdmlhIFNEX1NUQVRVUyByZWdpc3Rlci4N
Cj4gPiA+DQo+ID4gPiByZWd1bGF0b3Igc3VwcG9ydCBpcyBhZGRlZCB0byBjb250cm9sIHRoZSB2
b2xhdGFnZSBsZXZlbHMgb2YgU0QgcGlucw0KPiA+ID4gdmlhIHNkX2lvdnMgYml0IGluIFNEX1NU
QVRVUyByZWdpc3Rlci4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2Fy
DQo+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
LS0tDQo+ID4gPiAgZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGkuaCAgICAgICAgICAgICAg
IHwgIDcgKysNCj4gPiA+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3JlLmMgICAg
ICAgICAgfCA2NyArKysrKysrKysrKysrKysrKy0tDQo+ID4gPiAgZHJpdmVycy9tbWMvaG9zdC9y
ZW5lc2FzX3NkaGlfaW50ZXJuYWxfZG1hYy5jIHwgNDUgKysrKysrKysrKysrKw0KPiA+ID4gIGRy
aXZlcnMvbW1jL2hvc3QvdG1pb19tbWMuaCAgICAgICAgICAgICAgICAgICB8ICA0ICsrDQo+ID4g
PiAgNCBmaWxlcyBjaGFuZ2VkLCAxMTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4g
PiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGkuaA0K
PiA+ID4gYi9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaS5oIGluZGV4DQo+ID4gPiA1ODZm
OTRkNGRiZmQuLjllZjRmZGY0NDI4MCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hv
c3QvcmVuZXNhc19zZGhpLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19z
ZGhpLmgNCj4gPiA+IEBAIC0xMSw2ICsxMSw4IEBADQo+ID4gPg0KPiA+ID4gICNpbmNsdWRlIDxs
aW51eC9kbWFlbmdpbmUuaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+DQo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiA+ID4gKyNpbmNsdWRlIDxs
aW51eC9yZWd1bGF0b3IvZHJpdmVyLmg+DQo+ID4gPiAgI2luY2x1ZGUgInRtaW9fbW1jLmgiDQo+
ID4gPg0KPiA+ID4gIHN0cnVjdCByZW5lc2FzX3NkaGlfc2NjIHsNCj4gPiA+IEBAIC00OSw2ICs1
MSwxMSBAQCBzdHJ1Y3QgcmVuZXNhc19zZGhpX3F1aXJrcyB7DQo+ID4gPiAgICAgICBib29sIG1h
bnVhbF90YXBfY29ycmVjdGlvbjsNCj4gPiA+ICAgICAgIGJvb2wgb2xkX2luZm8xX2xheW91dDsN
Cj4gPiA+ICAgICAgIHUzMiBoczQwMF9iYWRfdGFwczsNCj4gPiA+ICsgICAgIGJvb2wgc2RfaW92
czsNCj4gPiA+ICsgICAgIGJvb2wgc2RfcHdlbjsNCj4gPiA+ICsgICAgIHN0cnVjdCByZWd1bGF0
b3JfZGVzYyAqcmRlc2M7DQo+ID4gPiArICAgICBjb25zdCBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyAq
cmRlc2NfcmVnbWFwX2NvbmZpZzsNCj4gPiA+ICsgICAgIHVuc2lnbmVkIGludCByZGVzY19vZmZz
ZXQ7DQo+ID4gPiAgICAgICBjb25zdCB1OCAoKmhzNDAwX2NhbGliX3RhYmxlKVtTREhJX0NBTElC
X1RBQkxFX01BWF07DQo+ID4gPiAgfTsNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+ID4gPiBiL2RyaXZlcnMvbW1jL2hvc3Qv
cmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+ID4gaW5kZXggMTJmNGZhYWFmNGVlLi4yZWVlYTk1MTNh
MjMgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3Jl
LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+
ID4gQEAgLTI0OCw2ICsyNDgsMTkgQEAgc3RhdGljIGludCByZW5lc2FzX3NkaGlfY2FyZF9idXN5
KHN0cnVjdCBtbWNfaG9zdCAqbW1jKQ0KPiA+ID4gICAgICAgICAgICAgICAgVE1JT19TVEFUX0RB
VDApOw0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiArc3RhdGljIHZvaWQgcmVuZXNhc19zZGhpX3Nk
X3N0YXR1c19wd2VuKHN0cnVjdCB0bWlvX21tY19ob3N0ICpob3N0LA0KPiA+ID4gK2Jvb2wgb24p
IHsNCj4gPiA+ICsgICAgIHUzMiBzZF9zdGF0dXM7DQo+ID4gPiArDQo+ID4gPiArICAgICBzZF9j
dHJsX3JlYWQzMl9yZXAoaG9zdCwgQ1RMX1NEX1NUQVRVUywgJnNkX3N0YXR1cywgMSk7DQo+ID4g
PiArICAgICBpZiAob24pDQo+ID4gPiArICAgICAgICAgICAgIHNkX3N0YXR1cyB8PSAgU0RfU1RB
VFVTX1BXRU47DQo+ID4gPiArICAgICBlbHNlDQo+ID4gPiArICAgICAgICAgICAgIHNkX3N0YXR1
cyAmPSAgflNEX1NUQVRVU19QV0VOOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgc2RfY3RybF93cml0
ZTMyKGhvc3QsIENUTF9TRF9TVEFUVVMsIHNkX3N0YXR1cyk7IH0NCj4gPiA+ICsNCj4gPg0KPiA+
IE1heSBiZSB1c2UgcmVndWxhdG9yX3NldF92b2x0YWdlKCkgdG8gc2V0IHRoaXM/Pw0KPiA+DQo+
IFRoaXMgaXMgdGhlIFBXRU4gYml0IHdoaWNoIGlzIG5vdCBtb2RlbGxlZCBhcyBhIHJlZ3VsYXRv
ciwgd2UgY2Fubm90IHVzZSByZWd1bGF0b3Jfc2V0X3ZvbHRhZ2UoKSB0bw0KPiBzZXQgdGhpcyBi
aXQuDQoNClNvLCB0aGVyZSBtYXkgYmUgYSByYWNlIGJldHdlZW4gcmVndWxhdG9yIGRyaXZlciBh
bmQgdGhpcyBiaXQ/Pw0KDQo+IA0KPiA+ID4gIHN0YXRpYyBpbnQgcmVuZXNhc19zZGhpX3N0YXJ0
X3NpZ25hbF92b2x0YWdlX3N3aXRjaChzdHJ1Y3QgbW1jX2hvc3QgKm1tYywNCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG1tY19p
b3MNCj4gPiA+ICppb3MpICB7IEBAIC01ODcsNiArNjAwLDkgQEAgc3RhdGljIHZvaWQgcmVuZXNh
c19zZGhpX3Jlc2V0KHN0cnVjdA0KPiA+ID4gdG1pb19tbWNfaG9zdCAqaG9zdCwgYm9vbCBwcmVz
ZXJ2ZSkNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxz
ZSwgcHJpdi0+cnN0Yyk7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgLyogQXQgbGVhc3Qg
U0RISV9WRVJfR0VOMl9TRFI1MCBuZWVkcyBtYW51YWwgcmVsZWFzZSBvZiByZXNldCAqLw0KPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgIHNkX2N0cmxfd3JpdGUxNihob3N0LCBDVExfUkVTRVRf
U0QsIDB4MDAwMSk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKHNkaGlfaGFzX3F1
aXJrKHByaXYsIHNkX3B3ZW4pKQ0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVuZXNhc19zZGhpX3NkX3N0YXR1c19wd2VuKGhvc3QsDQo+ID4gPiArIHRydWUpOw0KPiA+ID4g
Kw0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHByaXYtPm5lZWRzX2FkanVzdF9oczQwMCA9
IGZhbHNlOw0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIHJlbmVzYXNfc2RoaV9zZXRfY2xv
Y2soaG9zdCwgaG9zdC0+Y2xrX2NhY2hlKTsNCj4gPiA+DQo+ID4gPiBAQCAtOTA0LDYgKzkyMCwz
NCBAQCBzdGF0aWMgdm9pZCByZW5lc2FzX3NkaGlfZW5hYmxlX2RtYShzdHJ1Y3QgdG1pb19tbWNf
aG9zdCAqaG9zdCwgYm9vbA0KPiBlbmFibGUpDQo+ID4gPiAgICAgICByZW5lc2FzX3NkaGlfc2Ri
dWZfd2lkdGgoaG9zdCwgZW5hYmxlID8gd2lkdGggOiAxNik7ICB9DQo+ID4gPg0KPiA+ID4gK3N0
YXRpYyBpbnQgcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWNfcmVnaXN0ZXJfcmVndWxhdG9yKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHJlbmVzYXNfc2Ro
aV9xdWlya3MNCj4gKnF1aXJrcykgew0KPiA+ID4gKyAgICAgc3RydWN0IHRtaW9fbW1jX2hvc3Qg
Kmhvc3QgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiA+ICsgICAgIHN0cnVjdCBy
ZW5lc2FzX3NkaGkgKnByaXYgPSBob3N0X3RvX3ByaXYoaG9zdCk7DQo+ID4gPiArICAgICBzdHJ1
Y3QgcmVndWxhdG9yX2NvbmZpZyByY2ZnID0gew0KPiA+ID4gKyAgICAgICAgICAgICAuZGV2ID0g
JnBkZXYtPmRldiwNCj4gPiA+ICsgICAgICAgICAgICAgLmRyaXZlcl9kYXRhID0gcHJpdiwNCj4g
PiA+ICsgICAgIH07DQo+ID4gPiArICAgICBzdHJ1Y3QgcmVndWxhdG9yX2RldiAqcmRldjsNCj4g
PiA+ICsgICAgIGNvbnN0IGNoYXIgKmRldm5hbWU7DQo+ID4gPiArDQo+ID4gPiArICAgICBkZXZu
YW1lID0gZGV2bV9rYXNwcmludGYoJnBkZXYtPmRldiwgR0ZQX0tFUk5FTCwgIiVzLXZxbW1jLXJl
Z3VsYXRvciIsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X25hbWUo
JnBkZXYtPmRldikpOw0KPiA+ID4gKyAgICAgaWYgKCFkZXZuYW1lKQ0KPiA+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgIHF1aXJrcy0+cmRlc2Mt
Pm5hbWUgPSBkZXZuYW1lOw0KPiA+ID4gKyAgICAgcmNmZy5yZWdtYXAgPSBkZXZtX3JlZ21hcF9p
bml0X21taW8oJnBkZXYtPmRldiwgaG9zdC0+Y3RsICsNCj4gPiA+ICsgcXVpcmtzLT5yZGVzY19v
ZmZzZXQsDQo+ID4NCj4gPiBUaGlzIGlzIChDVExfU0RfU1RBVFVTIDw8IDIpICwgc28gdGhlIHZh
cmlhYmxlIGNhbiBiZSBkcm9wcGVkIGZyb20gcXVpcmtzLg0KPiA+DQo+IHJkZXNjX29mZnNldCBp
cyBhZGRlZCB0byBtYWtlIGNvZGUgZ2VuZXJpYywgdGhhdCBpcyBpbiBmdXR1cmUgaWYgdGhlcmUg
aXMgYSBuZXcgY2hpcCB3aXRoIGENCj4gZGlmZmVyZW50IG9mZnNldCB3aGljaCBzdXBwb3J0cyBJ
T1ZTIHdlIGNhbiBqdXN0IHBhc3MgdGhlIG9mZnNldCBmb3IgaXQuDQoNCkN1cnJlbnRseSB0aGVy
ZSBpcyBubyBjb25zdW1lciBmb3IgaXQsIHNvIGl0IGNhbiBzYXZlIG1lbW9yeS4gV2hlbiBhIGZ1
dHVyZSBjaGlwIGNvbWVzDQp3ZSBjYW4gYnJpbmcgYmFjayB0aGlzIHZhcmlhYmxlPz8NCg0KQ2hl
ZXJzLA0KQmlqdQ0K


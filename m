Return-Path: <linux-renesas-soc+bounces-14355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC6A609FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 08:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0346A8813F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 07:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0012F18950A;
	Fri, 14 Mar 2025 07:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Cp6+1BCv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78361624F1;
	Fri, 14 Mar 2025 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741936721; cv=fail; b=TQLa3ErtrUZxo8kR9nnSixr2L049govNRd4Dd1fM0kJHPcPJcMjQN/JjMGr7du80mrTgCoxpzHu5rNQKVJX/JdRZPRTjTjJnAav20/rOIzVbMbV4zwK4N2QtEqQQmQIDuAhzxMHPNUHS9Sx0xFnti6J6Uk0eaz/hDdbqe9mPmb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741936721; c=relaxed/simple;
	bh=TqTUXElQ06zMiLIsyF3VArtQMvj2cR290pNecITWJ5E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f8zdai2QbTYD0XnY8cB0Smj+KxTnZbwwLpMICI1e1d23K6H15R5el/mBbMZnpu6VMxGPcfMcLIaPRGmKR8SZJ3zv6aP7we/6j8e21dnQ6iwOBfT2CLHZi4RuYgodX54AhIBCHjFMc3yahOtpWJrNsD94gd+vnwZKIALdLbknHak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Cp6+1BCv; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+VGB6mjD3p01lEmfL2oKpPZjbzG5bMZaZ1QzbhErK/KAkyG4QlJKsqFPPp/cEza04I0qI7Grq9c9MU9FVcos7uK7iwZmUDlwdpDDv+P8Hy11PUajQMloNwhJxN5dsZRsoY+PvLV4rmrriC+UQvErMK1+Gdmg62AhcY8nG+HVkR4IK4PWHOrYQ8isVuXOrhG+gdiYecuxXHEocgS4lsVucutxhn+62sJRIZIc/jwK4WrvDj4wMXrBlea2V0o0F9dKM3xAbREzYPtu3w+0MAq9HntSYneXxHobV/3sJYrhMwgIi/3hky4EvhJIpVtEoxMqm5tUUJ/2/dXVyoRIr4Fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqTUXElQ06zMiLIsyF3VArtQMvj2cR290pNecITWJ5E=;
 b=a1ZWACQtWC0B7d9WDqvzZpjx2BmIBi5rU2SnDIB+ODkXPwp1VsSJai4AScc8hAH5Qxb0JB+zg+B7tI6cujn1qSPRQaR34VjbG3300pmp7JppJYoL++pn4cEopI3zoxTbxxpO3VnqPqkCJkO/IvDj9kw/GDMJaRX9TnF349yiSnqePP+6GXs+1PjPmSObYGHtp3x3qbj78t6Ty9ij0mlzlKzPldp1gKxUxb8W1GvlrGS03Bc7ep0p33lmIIsiKttmStBU7IZago6Uovs+3SudpMPZPE+76ahRK8jU6WB8P1ZTVeEqEmkyxiClKaYyMl9FMYpz/mP5uHQi0tRDslO/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqTUXElQ06zMiLIsyF3VArtQMvj2cR290pNecITWJ5E=;
 b=Cp6+1BCvauVGGd1bjgeWuupUz6qYfs4X6mHheUekfVJZPfOG1X5apusIpU//rzmFGj9QGHEcqfcAg40/Qa+86HDK2vEbMPmX+732bU6ZoAmFmBkiWFKzsic4USkXYIsck++mZpuuZzzPmPf316HFAAmuODnndAijMNg6zBPAH8U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB6697.jpnprd01.prod.outlook.com (2603:1096:400:c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 07:18:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 07:18:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Topic: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled
 clock
Thread-Index: AQHbjCwSQtFnS5HRQ0O4YyzU/N2JT7NlMPsAgAC1N4CAANHqAIAAiUfQgAsHYUA=
Date: Fri, 14 Mar 2025 07:18:33 +0000
Message-ID:
 <TY3PR01MB11346D2881A8CC9C3019C978386D22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
 <20250303110433.76576-2-biju.das.jz@bp.renesas.com>
 <1347ee4d678ce81c33917b3802601aee.sboyd@kernel.org>
 <TY3PR01MB11346C31C2533FD074D87BBD286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <98c8c1eab30fc333974bd1ad88791356.sboyd@kernel.org>
 <TY3PR01MB113469E04E10E3D14FB3F69F186D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113469E04E10E3D14FB3F69F186D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB6697:EE_
x-ms-office365-filtering-correlation-id: 1c96f045-6d99-4ad4-86a4-08dd62c86e3a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YmtNNUpFQTl5U0gvSWNiclVESzFEVEV0cXVmcGdSMDNId2UzdURuQjBtUnBu?=
 =?utf-8?B?RDJ2bW5IR3VrRzFnbUMvYi9uSEVkcC9oNndXVzI0MUZRQmZpV3BuOTdBdHBB?=
 =?utf-8?B?UU9LN1Bpem9nUU9WRzZmZDhTTGUwZWRFSDV0YzhSWmNiQS9ORDRrK3RvUEhl?=
 =?utf-8?B?OERMS0d2YjRESHljNlgxNCt5U1BLMmxTRGp2WkVERnBXL0VtMjZtODBlSUsv?=
 =?utf-8?B?QXdLNGM5M3FIaytuOWt3NzlpRVlvREVkeFlLbW5RbHdzNkxqdHJhS0FrZ1Bp?=
 =?utf-8?B?ek9mMGQ0TVgzbWI0dXo0cTlrRDhOK2pqQWQzZ1FUU2F2YWhCS3VGcTI0WS9Y?=
 =?utf-8?B?MTlRcHByZ2k5TGZIWUZINDFmcTBzMkxtdnVWU0VqRUdITERCaFhtRmZzT25t?=
 =?utf-8?B?a2RncXVhTGVhd1I1UDZxdlNXVmcwcE14ZmRCODQ4QlYwUVliVGl1N3dtd1ha?=
 =?utf-8?B?NE5vSlBSYS93YlpOeG9icGdkMys2eGdEdFVlNGgwWGZNUHhBREdWUnh3MWRn?=
 =?utf-8?B?VlJsMmpoWEo5YVhWSlRkaGx2V01FNXBCbmNDNyt2SStuZHhWRFRrSmlmcFFC?=
 =?utf-8?B?N241QzJVWkJlR096RzU3Ylcxby9nRzZESGo1MWo2Q3BnNkw4YjNMSkloWGlz?=
 =?utf-8?B?V0doSGx1UFY1RjFCKy9UQm4rU3F6Y1R2R0IzcDlGaDBrbStFMFlvQlVPMjFH?=
 =?utf-8?B?WkQxOHNMQ1pjRWJteWNHbVorbXprUmhQTzN2WXpETllvMjBCNkNlRkN4aDlK?=
 =?utf-8?B?TGRCZDdqR2NJeDJxazdwWkduV25sb21kb00zSTI5MmJ2aVB0TzRGRFZHR1pl?=
 =?utf-8?B?Y0JtOWpBNWNka201NkVrVC9IMHpjM1p6RVhNR1gxR3I2UjFocG5pVVhMUXFx?=
 =?utf-8?B?eVFkUFFqbjRNdjV2YWU0UStkTEU5NXNjZEdUTC9xaHJlTE9pMEFxdUEzenR3?=
 =?utf-8?B?MWdnMTJXSVpUeXJCVVkyZXhFU2FNQUdVLzdZL21DSFlzT2RweWhoeGVaZ2dw?=
 =?utf-8?B?Yi9hbFRoQy9EQnpjdVg2anBmY0JCbUtZeU9EWjFYd3ozb21taGpIRWpjQ0VE?=
 =?utf-8?B?VkJUN3A1N2RvcjVFcnd1TDBMVDQ0MmRJUm05UW1RVjZlbi9vUS8yM3BUQnd6?=
 =?utf-8?B?eGJyUXlKYWZ4bWtzc1pUbU5rc3FlRWRyUXhTRXhsT3E4cHhiYzZsVUNOY2FY?=
 =?utf-8?B?bW5za3Zha3RZUFZ4dlNxaTNZNWw0U3N3T3JOR2ZGMnJuQ1lLZEFNUmlUNXR6?=
 =?utf-8?B?TythK1dKbnNpM0I5Q2FIR3FsZ3ViVkxVeUo3dWRUcWxNbzhBSkJRajAxNFds?=
 =?utf-8?B?Y2VFcGpmcmxpMFZzWkxFRkw3Zml2M2hTQWJkMHJuM0JiSHFIMW5RRWZiQmVs?=
 =?utf-8?B?STRicG1EKzU2bC85OHpsVVJCeG42U0FTM2k0RjlLNGR0NElid2JvTmk2NHZz?=
 =?utf-8?B?bCtPcEp5WittL1BMdksyZ3BqOVlGVzVENzYvVUV6WlEyTkNXM2NZZDZUbCtl?=
 =?utf-8?B?ZFBsU3Y1MURJc0wzSU15L0RFZnRIYzg1QUR6ME5ic20rWHBhUWt4TG9MVDlX?=
 =?utf-8?B?d0M4UUdNM0tyTnJvUjk4Z1FPRnFpdFBRYjFhOW5abklMclRqdDNUSjFWd2Vp?=
 =?utf-8?B?OWRhb1BzNVpaRDhVeURha3VHTVFOOEdJNklBZ2s3ZmU4ZjVyY25QTWNnaElI?=
 =?utf-8?B?M010eDZlWVV2WmdKZTVFRy9HRlJvTXM0bnpSWlR4eUx0YjdObXlBSmlwOHow?=
 =?utf-8?B?b1ZFQVVySWpYWWRCV29zZHNPRE11QVUrTEJ0a3RTZUJkVy96QjN0VGdGd2gx?=
 =?utf-8?B?NytpcURObDV3QW5mZytjQXhzN05OUlNNRGt3c001ay8rdC9tZVhNZkZYWUhI?=
 =?utf-8?B?bWVnTWRYU1VOU1Y5ek1lNHl0Z282clRxT2dKeG4zN3kyYmptbGExNnk2S0tI?=
 =?utf-8?Q?6ICqvN/iL/PfddQl178FTsB/1fFC4Dtg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OCtjeEVUYVJBTGluclpaRWtIQTNjWVRFU1hFMmFkV0xkY0pwZFFEM2Y0WHFT?=
 =?utf-8?B?ZmMrOWM4eldEWXZhbzUzUjJCWDJCdmhyRGpZSDN1NVpGOWs1c3ZuUEZJbVRJ?=
 =?utf-8?B?a2Z1T1hzemJxTkZsTWxISmxUQVE1c2JYdUpNMTN3OGRnbXhrU3B3MWtQeTJv?=
 =?utf-8?B?K29HWTl4dlRsajNMamo3V0JEdEtPYTdyZ3dQRW5SaGNON0p5dExIZFlNbGNM?=
 =?utf-8?B?anpqQnVUVEh6aG0xV2xWS0JaT29laUFRMmswKzZ6NlhpRXVsOUxIa0d4SUJz?=
 =?utf-8?B?YThzRWE3cS8zMjZQSUNhMjU0SDRGMUs0WjBTRUw2VzYvcEpuMThSOFY2VmZ3?=
 =?utf-8?B?cVJGNFh2cmRUbjJpc090NjFhYTVxeDlwZE1iUWZNbjM0bTdXLzMvR3RLbmgw?=
 =?utf-8?B?R1BtSTBFVG1wdjZQNW9XR2M3cDZEdFNvaDUyVi9YeVF5TWkraWtYamRqM2pu?=
 =?utf-8?B?TGI2L05scXZ2UkJhRlpVK3UveW0xcTZzNi9rSUdoRHpqaEI3WHYxSnNWNTVS?=
 =?utf-8?B?TGNGNWI2djJiZTc3ckxCVTk1NHgxc3JaRXpUVlZBb1RIVUdISUR2Rll5YmRZ?=
 =?utf-8?B?cDBINkJPOVVtUXlHQUpySjUweVhpaDJHYkFPblJLSmozbDBMWHZzRVpJUTEv?=
 =?utf-8?B?T21rZXU3M2xZRXF6VWxWVTJJVkQrNnFNRFUzdTVUeXc5UDB1SlhEa0JLYXJ6?=
 =?utf-8?B?WHZsRzlyRHM0TndiTlFISDluMTVqNTl6ckpjeDV5QUEvL20ydWpZSU0xNS9K?=
 =?utf-8?B?WDFNVi9ESE92cGp0d0prV0NWekFYSEdFUTlhM21ZajVNSjRja0dFN01pN2dx?=
 =?utf-8?B?Z0NpMlpVNnB6TDRIL2tIMFp1Z1MrT2piaUlNUjBiVVJUZk83dXRCUVNRMEFu?=
 =?utf-8?B?T3pGdlN4TnBzZ2kxK2FHcnVSZVBteWFiaTI0YnFYV3RwaEZQbU16UHpUY1d4?=
 =?utf-8?B?TWcwRUVhM2llaXhPTUhneGZ1T1JKb0VzYW5VMjNMNy9jclA3c2xOZGFILzV2?=
 =?utf-8?B?WjJHeFYyQUE3YzZOVGxibHM1TEZRTzlRUnhCUnR1QUhrNEFPU3g5anErT2c3?=
 =?utf-8?B?QU5EamRhY01ORWx3M25XRnlud0FXQlNaZGx6S3RZS3hPb2Urc3cxZWEvQWFr?=
 =?utf-8?B?aFpYN0lQWDA3eDcrOUlwdUFkOWxXZDAzNHRELzhDdTl4OG9CZlJ0Q1lqdnJN?=
 =?utf-8?B?VCt6Q1h4b0c4RktOUWxsc1VLV1FIdDZWdnA1OTAwdkRjblFwYW50aDJLN0pD?=
 =?utf-8?B?WUQ3N3ZKYzhBWHFZSm13Qi80TkxXeWc0YkgxOWl5Z3Y1VFpFMkxUTmRXQzBI?=
 =?utf-8?B?YVBaR3NiNmYxemlEMHE3Q0pJT0JhckRVTkhlUW1QVWVyY2M5a0JEZGRmd1JR?=
 =?utf-8?B?Q0tNUEMvbE54YnRkZTAzR21vTy9GNzNJRTlaL2RKYW8zbmVPaUIxNnFIVlRT?=
 =?utf-8?B?TnI1RTRFTHhlRmJaTm9jN3dFeVlSTkk4MFRmc3VnOUZGbEtid2EwOVBJVFhE?=
 =?utf-8?B?YTRIcmZnZ3NDYjg0ZFhGTjd5RnUrRnhXUmh6cUpoQ0swdXl5a1Uzd1NNRk9x?=
 =?utf-8?B?cFpaNTNnRUtaZGN3eGxNUUhNWlBYU1FCNlhSSXNCUDRLdVpwd01BWWM3dkNU?=
 =?utf-8?B?bFNwNEc1NVdTaUl6bHBKUk9QazErL1REVWJ2QzgvZXMxT1pDZWpEOENIbFpt?=
 =?utf-8?B?Q0h1WUZINUdqRENRWTNtTVRuWE5DYkY2ZGJrNFR0TUJwTHoralRmSHlwQ2lQ?=
 =?utf-8?B?endHS2ZRVTQ2ZGFzWDR0MTNwTEpiODd4bStrRC9MVDJrTU1FKzc3d0djb2xQ?=
 =?utf-8?B?SEN1THhBazBEeWxUQnZic2tGSDMyZ2MxeGd2Zm4zZXpvSVpwckVaZkhKcmdL?=
 =?utf-8?B?RXhJVElEUVJlQzFiUW8zZTR0Y0pKdmd2aVNlNUFNWiszaVFOWGVwdUZqTkhm?=
 =?utf-8?B?K3BJTm5HSnhKSCs0ZFZkcmppUTNiYTNGaFphc0Nqc2tBai9DelN2TGs0bGJG?=
 =?utf-8?B?aVdLTU85NEwweXBJWm85VUt0d01yWFRHWWFiNXBRMmNWY2hzbElOMzlCMStK?=
 =?utf-8?B?NlhJNGtBQ0pOaG16VENXUEtXSFNCeW9CaUJaOWhrZXhsQS9WbmhaNzRmZ29M?=
 =?utf-8?B?YzdIVDhYcDNua2pTc3ViVEFlbHhlZUdVeWp2VzQvZW9rSERpcGlVKzZUa25R?=
 =?utf-8?B?Qmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c96f045-6d99-4ad4-86a4-08dd62c86e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 07:18:33.8435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUX+NFVgy1/taaJ8kLtGvcSmZUXadfZSRNRAzRQToXIxKVFCKBcO+UWXyYlkYYRAugt/Trb5Q5G9gEb+cQTwF+66wsj+FawqLpD0dFaUt8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6697

SGkgU3RlcGhlbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCaWp1
IERhcw0KPiBTZW50OiAwNyBNYXJjaCAyMDI1IDA3OjAyDQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0gg
MS80XSBjbGs6IHJlbmVzYXM6IHJ6djJoLWNwZzogQWRkIHN1cHBvcnQgZm9yIGNvdXBsZWQgY2xv
Y2sNCj4gDQo+IEhpIFN0ZXBoZW4sDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gRnJvbTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPg0KPiA+IFNlbnQ6IDA2
IE1hcmNoIDIwMjUgMjI6MzcNCj4gPiBTdWJqZWN0OiBSRTogW1BBVENIIDEvNF0gY2xrOiByZW5l
c2FzOiByenYyaC1jcGc6IEFkZCBzdXBwb3J0IGZvcg0KPiA+IGNvdXBsZWQgY2xvY2sNCj4gPg0K
PiA+IFF1b3RpbmcgQmlqdSBEYXMgKDIwMjUtMDMtMDYgMDI6MTA6NTApDQo+ID4gPiA+IEZyb206
IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4gUXVvdGluZyBCaWp1IERhcyAoMjAyNS0w
My0wMw0KPiA+ID4gPiAwMzowNDoxOSkNCj4gPiA+ID4gPiBUaGUgc3BpIGFuZCBzcGl4MiBjbGsg
c2hhcmUgc2FtZSBiaXQgZm9yIGNsb2NrIGdhdGluZy4gQWRkDQo+ID4gPiA+ID4gc3VwcG9ydCBm
b3IgY291cGxlZCBjbG9jayB3aXRoIGNoZWNraW5nIHRoZSBtb25pdG9yIGJpdCBmb3IgYm90aCB0
aGUgY2xvY2tzLg0KPiA+ID4gPg0KPiA+ID4gPiBDb3VsZCB5b3UgYWRkIGFuIGludGVybWVkaWF0
ZSBwYXJlbnQgY2xrIG9mIGJvdGggc3BpIGFuZCBzcGl4Mg0KPiA+ID4gPiB0aGF0IG9ubHkgaGFu
ZGxlcyB0aGUgZW5hYmxlIGJpdCBmb3IgY2xvY2sgZ2F0aW5nPyBUaGVuIHRoZSBlbmFibGUNCj4g
PiA+ID4gY291bnQgaGFuZGxpbmcgd291bGQgYmUgaW4gdGhlIGNvcmUNCj4gPiBjbGsgY29kZS4N
Cj4gPiA+DQo+ID4gPiBUaGUgcGFyZW50IGNsb2NrIHJhdGUgb2Ygc3BpIGFuZCBzcGl4MiBhcmUg
ZGlmZmVyZW50LiBJZiB3ZSB1c2UgYW4NCj4gPiA+IGludGVybWVkaWF0ZSBwYXJlbnQgY2xrLCBX
aGF0IGNsayByYXRlIHRoZSBwYXJlbnQgd2lsbCB1c2U/Pw0KPiA+DQo+ID4gQWxyaWdodCwgZ290
IGl0LiBEb2VzIHRoZSBjb25zdW1lciBjYXJlIGFib3V0IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIHR3byBjbGtzIGZvciB0aGUgZ2F0aW5nDQo+IHBhcnQ/DQo+IA0KPiBBbHRob3VnaCBnYXRp
bmcgYml0IGlzIHNhbWUsIGZvciBzb21lIHJlYXNvbiB0aGVpciBtb25pdG9yIGJpdCBpcyBkaWZm
ZXJlbnQuIFNvLCB0byBjb25maXJtIGNsayBvbg0KPiBzdGF0dXMgd2UgbmVlZCB0byBjaGVjayBy
ZXNwZWN0aXZlIG1vbml0b3IgYml0cy4gUGFyYWxsZWxseSwgSSB3aWxsIGNoZWNrIHdpdGggaGFy
ZHdhcmUgdGVhbSwgZG9lcyBpdA0KPiBuZWVkIHRvIG1vbml0b3IgYm90aCB0aGVzZSBiaXRzPz8N
Cg0KQWNjb3JkaW5nIHRvIGhhcmR3YXJlIHRlYW0sIHRoZSBzcGl4MiBjbG9jayBpcyB0d2ljZSB0
aGUgZnJlcXVlbmN5IG9mIHRoZSBzcGkgY2xvY2ssIGFuZCB0aGUgY2xvY2sgT04vT0ZGDQpwZXJp
b2QgZGlzcGxheWVkIGZvciBlYWNoIGJpdCBpbiB0aGUgbW9uaXRvciByZWdpc3RlciB2YXJpZXMg
c2xpZ2h0bHkgZHVlIHRvIHRoZSBkaWZmZXJlbmNlIGluIGZyZXF1ZW5jeS4NCg0KU28gdG8gY2hl
Y2sgdGhlIHN0YXR1cyBhZnRlciBjaGFuZ2luZyB0aGUgY2xvY2sgT04vT0ZGIHJlZ2lzdGVyIHNl
dHRpbmcsDQpwbGVhc2UgY2hlY2sgdGhlIHR3byBtb25pdG9yIHJlZ2lzdGVyIGJpdHMgdG9nZXRo
ZXINCg0KDQpDaGVlcnMsDQpCaWp1DQo=


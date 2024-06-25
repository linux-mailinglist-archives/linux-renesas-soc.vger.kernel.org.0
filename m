Return-Path: <linux-renesas-soc+bounces-6723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74300916387
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 11:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8E4C1F240BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 09:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43A1149E06;
	Tue, 25 Jun 2024 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="I27ibyai"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2077.outbound.protection.outlook.com [40.107.113.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6CC1465A8;
	Tue, 25 Jun 2024 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719308871; cv=fail; b=sGO/8a2ryNXsRUcu8y04mMA2J/JFj6RBwV5S3KJKzwe8YXllvSwt8V3OuzqhbbiFVExNKYu2iLWgDdysFhpQ5D3g3GbB0V63404jz+/Ge8tZ4XQYT016m+VPYQTyu7E/ZxPDGf9017/9ALGdLZsSnbGfGGOyXZtkvL/iyvUrxDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719308871; c=relaxed/simple;
	bh=TAvUJ33d0nNmxvJkaZamyxZyA006uGWP9Qo66VHj3ts=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MZj1MZhosS9Rp2gMr4vnn9lp2bNzpnzx3Qf0fqNqDVVsYpKCCQesTwsli0RNmwcWgYoGb+gTfNxnu4KAaVSMtWQdLDqATk9PpIkP/wKLv0uITufrn6M3BSum5A6ZkXsiIGqeK3Lz/wAO9HXLNMuoNMLV9uF4u4AWENqdkVnhI+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=I27ibyai; arc=fail smtp.client-ip=40.107.113.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTexXkQvFNCfyxhzDQMZmMtkSoaTYVRIHtjbeWoPUKiR5oxu4efwvNgd+8LLg2k4M1nDNmjLsmXfjB8EjQ2/igTjTgRSdaa7+2XKTnYUQoY7qV0zg4eFAuBj7qB87yVXl8DyTx+aK7f9YCi7MH7Ckh1Hkyq9nLKX3nAE4xZVDEYvPq7/q7xuCVNINRKLshluKt/s9JUa55om/8GmkWsEi/RVNifZIfzJ8APY3MSTyBmBTalmc3U9bbdEiU9y2ng0aZOWcN8XSghjQG78yWr07/vDYDVOoJac8OdCMHZaL/OU81SjkvGJBep5qQXpSkJNonB6VCXxIEBCsD4XcLSaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAvUJ33d0nNmxvJkaZamyxZyA006uGWP9Qo66VHj3ts=;
 b=XcB9Xs8ZzqkM9jepSndblY3h0RZsd3RZGrP/1D63n24e/erXSgPd/T/GYPohSa3G9WNisDcsnO04yL7srD+TiXoqW3Lu3MWXUVjH67EDcrO3hzNBe2QfTrT9CDGjUwQ6EMQHSrjmc6hyaacPfcxmgOWcMYzOzqkvB946ji3rDJV/EDZgY5i1D9FFAKCDMWqAZGaR2TosjBzRolffbQlJZ6xureJ+5cVISzhmxX06YncfKU9SzLtbD6tnYVFh6r0SQPHgcGELROK//EjLz06cVYQHhhkGR7T3e7DG7WeNcgbhx5p8dSpIwOyEvT8UpFsLTIa7LY3F6AaAdAmPzIxt6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAvUJ33d0nNmxvJkaZamyxZyA006uGWP9Qo66VHj3ts=;
 b=I27ibyai1n5dVm5W3wDlQ9ZYdMXNsU4h8nVPl0+uPBU0xx2apgmgGglv3a511TOM40ClgCbgxlx2JqI7E/dmElMZy/aF4AarXKjkWscGisI1jLykTpBcRju3Tu132sccP3pRv9+GdpE5LuqioUiUuLOGE1HFEmff6T4GVjweLds=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYBPR01MB5421.jpnprd01.prod.outlook.com (2603:1096:404:802e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 09:47:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 09:47:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P)
 support
Thread-Topic: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document
 RZ/V2H(P) support
Thread-Index: AQHaxkvO0A4lnvx4zE2BuJf82/SVDbHYMlwwgAACfACAAAXAkA==
Date: Tue, 25 Jun 2024 09:47:44 +0000
Message-ID:
 <TY3PR01MB11346179D6B17BE023E6C33E886D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346BEEDB2125402E8A489E086D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vJdUCY4xBwm56C2A3w-gYOWo3MtoMMMfdcDwwsQWY4Gg@mail.gmail.com>
In-Reply-To:
 <CA+V-a8vJdUCY4xBwm56C2A3w-gYOWo3MtoMMMfdcDwwsQWY4Gg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYBPR01MB5421:EE_
x-ms-office365-filtering-correlation-id: 27656141-d0b6-4632-31fc-08dc94fbdcbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|376011|7416011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?ck1vOEFHc1VKdzRnR2JQVFk0bTJKODhHMEZVYVZablVtN0JDYUJXUk1OMGMz?=
 =?utf-8?B?QzdVZDJjakhkZVZ2bnFiMmpHdDI1OHBCeEp3OFNSM211ME9NRXZnV3VNdFZE?=
 =?utf-8?B?YWswL2IwZ0JvMlFQOTdCcEk0SlRyMkxOcy9iZnBHMk84dlg0bURMQ2NTM2dW?=
 =?utf-8?B?T0tZOWJycm8wdE9nQmovaTJIYTRmV0MzejZwVjJNZTNVcW1zdXJ5T3JZZUdv?=
 =?utf-8?B?RmZDcDdwb0dyMnY3MHZza2xVSnZzRXBsaEc3SUVsNFhTb0ZSMURqVytRZHd5?=
 =?utf-8?B?b2loU2c4cEJsNlovaHFOdnplS1ZLb0lzOWo4WGNlbVpxemllbkdIUUhkTks5?=
 =?utf-8?B?M3lYL2k1OGdQNUk5c1dqdjMwdG5TbmtwNjhFNnNWQVY4RnhpcXFWYkpzLzls?=
 =?utf-8?B?OEdNZnpVdWNuWW5Dc3Zqak1qaXZJODhxVkhTUFQxYVVPUGpiT3pxZUg4VFBk?=
 =?utf-8?B?TVllV2dOdnFGTTB5TXgxL1dLR1ZqNXg1V3NhNEN3c3lDOVhaVFZCYWdzam13?=
 =?utf-8?B?TFVTb0QvZHBTZDVpUkdmM0pyQmN6S0JrZ0U2M3JkNCtZV2RvTUg4eG1MS3kx?=
 =?utf-8?B?N2s2VDh4bEc4Zk0wUHh2ZEJwWDRucDczQld2Vm1xWjF1SWp6aVRTQ0VOUm8w?=
 =?utf-8?B?Mlo5cWRINWN6MFhOdWM0eHQzcWN6ZGltRTVBeFVXaUxqWktVYzROMXlhVUhz?=
 =?utf-8?B?TVF4bi85UjREUFZES0FjL3MrRkp2QmZFVHgzS0ZuNnRkMElPazZjUTg1UG1h?=
 =?utf-8?B?eEJLWThVZUJXUFZ0M2phdUhzMjNUbFFPM3doYWh5T2N6TXMybi8xVkN6c0Nu?=
 =?utf-8?B?dm51SEk1NHM5TEMrcFptLzNiRXVpODJ1ZmlyTDFDQ0NGakQrT2NTZ2JYR0FL?=
 =?utf-8?B?RWdDV0FFSlFlNXMvS3RCbENlOXRRSTdMSTdURllLSm9NRFhpWTA4RDRnTWFp?=
 =?utf-8?B?N1hYTHB2Z1FFR2VIM1M2UGN2Nm95RmJqNzNXZVY2Y201UTZ1cGwwSHRkN2pk?=
 =?utf-8?B?RW5HWmlJVjJFamVVQmFhWjFJZ0M3S2pPQ0FsbFhLNmh1Y2tRV0JXSTllK1Bv?=
 =?utf-8?B?YjRNMlRTZEo0dHZVNkw1Q0NRU3RhajdOQ1A1REVoTjJxbDFsa0ZVQXQxcHpS?=
 =?utf-8?B?NkJoTXVvcUFsUTk5ZVlkMDIvRGI3VnMvM2gvR3pGTHhvQndGUUNNODBBa0VV?=
 =?utf-8?B?MGxGMU9PL3JubThFTWd1dWEzQUNxU08wc1pNT2Fvcy9MTjdCL3ZMSWp2a2dR?=
 =?utf-8?B?cjBPU3B3dnNhVUVzTXlYb2szNjhyWjUrVUJveCtUQ0RPMU1GZHRLV3M5OUJa?=
 =?utf-8?B?TTRWMUlnVGU0M0xBZk9vQU9JUVpMd0U2ODNQYTZIdUJIUG4waWJOaVhQVFZE?=
 =?utf-8?B?aHJwVy9qdm9JVTc5V2hGMWFTbmNRRGI5emF6RzhZR2h1dUN1Z1pEaWprTEo3?=
 =?utf-8?B?Wi9jQkR3WWMyQkZEeWxDMjVCdFhkVXVxNG5odmdQdGV2VmRmUHp1ZVQzTXNh?=
 =?utf-8?B?ekE5amcwUnNqVWpwWkQyenkwa0lPWUk2K0tiOC9JWWsrc2VVeDZzVDlqN040?=
 =?utf-8?B?L3gwdnFkSm9ibkszMjZGSHJKcUQvSkdScDlhbkVZTnlFUlN1S2RUcVJnTzlu?=
 =?utf-8?B?OWQvcnhUc1VRaWZjL24vTzdFbGpRNmRVSG5Lb0JCcjNWazR3L1huaW5NWUo4?=
 =?utf-8?B?RVEzV3hLckp0bThrd0VLTEZ5NUp2QWZaVjRZVUVpZ2UvejNkUWZEYUUvTkhR?=
 =?utf-8?B?U095c2pnTFcrK3NqN25DWkF0ZnhPTlNKRXE1OHkwSUZNKzlZb21xLzFTaE5Q?=
 =?utf-8?Q?nyhWduin04xh9o/vsJjLjGERSV1q8E1uCLC1M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MU8yZzMreFBwd1ZlRmM2OGZ1dXZSNzR4S3l6eXo0YmdNTm5iTkUzakpNTHpJ?=
 =?utf-8?B?R2JNTzB4V1NSQVI1d2xKY3pnZTdhOXd2bTdLUFlROTg2LzNuK0FRdFpxYWZH?=
 =?utf-8?B?T3c2Z3R1eElrbGdreXJLMzR1Z21wS0ZVblV3RFdnUWU2dGc1UTlRTTNJaE9a?=
 =?utf-8?B?SUtlQUR2QVIrRjRXWDJub3lMYUIrNjZZWWZHVXcwZ0E5N0JUYlpIWFpKZjQ1?=
 =?utf-8?B?cG80eGRQRWxnbjN0QjhMNzNVVmd6OFlIZndIaTdHaEFTbEhRZFZRZHZUMTJU?=
 =?utf-8?B?SEh1VjZmdGZEMWFadTBRQ3JNL1ZVdy9qcnYyUE5KREJ0b0Q0eHVqQnFwK0Nn?=
 =?utf-8?B?T3djbVc4RG9IVElyQ2Z2UHc4MjVSKzc2RktWWUtzUTV2cEhrK0xEQjlvS1Fs?=
 =?utf-8?B?azRsZHpjVzVlMTJjUGJlRjlhRXlFSmJEblFnUzZscDh2QXdpMnFoVktoMjZm?=
 =?utf-8?B?N21VSjFHejZhN3N0ZWp5c2dFUndLWURGVUhidmYwd21DRGREM2ZuMGZXRjM0?=
 =?utf-8?B?YkpjRjBJTVkyY0VtdU9CQU9lQVpJZnJMM2FyQ1RKajQvYktMeXNhck9qNlhw?=
 =?utf-8?B?NDNEYmI1WE5mYkQ3L1hLeEUxMXFLQ3BkZ3NnSk96OVNNaThDSlZyUjFxS0hp?=
 =?utf-8?B?TWZYTEE4a2gwVnpWNGZtQlpjZGE5dmZqQ1d3SU9RRGVXYnZKTzlnaTdxUUJ4?=
 =?utf-8?B?OU1neUt2aE9VKzZOTVJJVmdUa1lzUU9ZKzB5LzBvMU9vR1IyaFlTSmFuUXda?=
 =?utf-8?B?ci80cWdxMEhXTnZWZk1Mblg0aTU4RlUxN3RwR1pRZTlnbHkwUU9vb29wRU1V?=
 =?utf-8?B?b0FFTTVvNk8zVkJ0N1JSZ0pPcTl2dUM3Z0hpVE13bkxlK2U1cGRDYU8rbk9G?=
 =?utf-8?B?eWtpM0grTWMyS01FdGhuYW9RbVJiQTBZNXhUeEU2QnNBaUt0cjRTL3puSkdp?=
 =?utf-8?B?OEZhTTJWYVNXK0Z1amJvS1NoRk9wNDh4UHpkQnVXRDVHRkpFN1Z0LzRCNUF1?=
 =?utf-8?B?dC9kcVpRRXFoaGh5eXFNSzdhSW1kNHROblZwY2FmbkcwcW9rdUppenA2clRy?=
 =?utf-8?B?eVRkNHdSa1lEMkxUMElVV1ZzdmFtdjRzaWRaVTIrdGdHVmE2OHhmclNZaTN4?=
 =?utf-8?B?RWo5SXliQ1l1andwL3N5WHFqREJhakpaRXZRUHZZdkxxYURURG4xeTdCbk8x?=
 =?utf-8?B?UmtzY0JFY3paU3ZSRG9xUWtEblp4UUMxMk5xcEoySlA3NkJIRDVMYmUrNWk5?=
 =?utf-8?B?ZE80cXY4VVFyem8xVmlQL0Zka1RkOW84RUpYN01RQ1FtenpUZUlFOU9TcFVY?=
 =?utf-8?B?MU5UbWRGMExRNHBCUGtQTXhwOEltNTVKWHNwcEZhNWJGaGZTR2o2M0Z4ZFZB?=
 =?utf-8?B?R004MWNJSmtiODJQay9XbGlOb3kwbE1Jc2VVTzVOZlBrdVIvbCtUWlhJSzZU?=
 =?utf-8?B?YXM4Uk1ZOFFEM251b0cyM3FwaElBT0NpMTJMUnNFSGROV3FsS2hUOE0wcVV2?=
 =?utf-8?B?MDh4TzB0Wjh4WVc5eDZIMERRdXdGdmlYMW1XQWZjc0JjN0hyaysyTXJOSkhh?=
 =?utf-8?B?WHE0ZG9oczFEZGRCb2JmTnMvRi9HelhhSk5QQUNkd1dMUndLMGxQQkU4M1Q0?=
 =?utf-8?B?ZWZYUjVXc3ZaVkZGS0ttdTJoZ0ZsSGJsRWtteVE2K2dGc0VMK0k3NHZmc2ZE?=
 =?utf-8?B?ZnZaSUFDNXVDbWdaZVBEeWlKR1dyS2hVVFZXdTAvTXhvSnhwLzMwdDB5R0dn?=
 =?utf-8?B?czk4aVprdTBRanZ0dHphaGlvRXBWMm5BaHMwWGtZSGJzU3VFem56clVHTmZh?=
 =?utf-8?B?YnBaTUtTT25CTFpoNjd2MzIwNEhpVWg0UVJuM3czRDh6d2pCOENrR1RISHlV?=
 =?utf-8?B?aXJESXdHYmJFY1dWc1JvTURYZ2dqNzhBUDFOMmEzN3d6UTMvUXFtdm1YN1JU?=
 =?utf-8?B?b1oxNTY0NGRWL3BxWHpHM0JUSUtXTnE0eEJJdElRa0cxdG5HLzRkUUM3YzJD?=
 =?utf-8?B?LytiQU9RaEtXS3BRK0p4VnlET3AzRmF3c1NtbHg1b0VQK2RTS2VBdlIrVld6?=
 =?utf-8?B?S01tWE0xc1hIN3FjcWNxRzM1U052OHp0NWRoNWhkbjVrUXlpaVk4N0NhVU5q?=
 =?utf-8?B?UUNhaVdJNm0xc1VMOUFxWVdhZy9PT05JRXljVmJ3ZFRJd3FyaDRPVjVOaDFi?=
 =?utf-8?B?NWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 27656141-d0b6-4632-31fc-08dc94fbdcbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 09:47:44.0625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KznknDaZe9Wcrr8hF9y3kEk9ZPzGgYYgywbDancILOFRB0JImbY9j4WINBaOprJI6ELd5ff3s9s5EHGH+gW+Kp8vHj42KJyUObGat62Cdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5421

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGFkLCBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDI1LCAy
MDI0IDEwOjE5IEFNDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IENjOiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz47IFdvbGZyYW0gU2Fu
ZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+OyBHZWVydA0KPiBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERv
b2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFp
bC5jb20+Ow0KPiBsaW51eC1tbWNAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy0NCj4g
c29jQHZnZXIua2VybmVsLm9yZzsgRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpA
cmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzNdIGR0
LWJpbmRpbmdzOiBtbWM6IHJlbmVzYXMsc2RoaTogRG9jdW1lbnQgUlovVjJIKFApIHN1cHBvcnQN
Cj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCAxMDoxMuKAr0FN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBI
aSBQcmFiaGFrYXIsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
PiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gU2Vu
dDogTW9uZGF5LCBKdW5lIDI0LCAyMDI0IDQ6MzIgUE0NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2
MyAxLzNdIGR0LWJpbmRpbmdzOiBtbWM6IHJlbmVzYXMsc2RoaTogRG9jdW1lbnQNCj4gPiA+IFJa
L1YySChQKSBzdXBwb3J0DQo+ID4gPg0KPiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhh
a2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+IFRoZSBTRC9N
TUMgYmxvY2sgb24gdGhlIFJaL1YySChQKSAoIlI5QTA5RzA1NyIpIFNvQyBpcyBzaW1pbGFyIHRv
DQo+ID4gPiB0aGF0IG9mIHRoZSBSLUNhciBHZW4zLCBidXQgaXQgaGFzIHNvbWUgZGlmZmVyZW5j
ZXM6DQo+ID4gPiAtIEhTNDAwIGlzIG5vdCBzdXBwb3J0ZWQuDQo+ID4gPiAtIEl0IHN1cHBvcnRz
IHRoZSBTRF9JT1ZTIGJpdCB0byBjb250cm9sIHRoZSBJTyB2b2x0YWdlIGxldmVsLg0KPiA+ID4g
LSBJdCBzdXBwb3J0cyBmaXhlZCBhZGRyZXNzIG1vZGUuDQo+ID4gPg0KPiA+ID4gVG8gYWNjb21t
b2RhdGUgdGhlc2UgZGlmZmVyZW5jZXMsIGEgU29DLXNwZWNpZmljICdyZW5lc2FzLHNkaGktcjlh
MDlnMDU3Jw0KPiA+ID4gY29tcGF0aWJsZSBzdHJpbmcgaXMgYWRkZWQuDQo+ID4gPg0KPiA+ID4g
QSAndnFtbWMtcmVndWxhdG9yJyBvYmplY3QgaXMgaW50cm9kdWNlZCB0byBoYW5kbGUgdGhlIHBv
d2VyIGVuYWJsZQ0KPiA+ID4gKFBXRU4pIGFuZCB2b2x0YWdlIGxldmVsIHN3aXRjaGluZyBmb3Ig
dGhlIFNEL01NQy4NCj4gPiA+DQo+ID4gPiBBZGRpdGlvbmFsbHksIHRoZSAncmVuZXNhcyxzZGhp
LXVzZS1pbnRlcm5hbC1yZWd1bGF0b3InIGZsYWcgaXMNCj4gPiA+IGludHJvZHVjZWQgdG8gaW5k
aWNhdGUgdGhhdCBhbiBpbnRlcm5hbCByZWd1bGF0b3IgaXMgdXNlZCBpbnN0ZWFkIG9mDQo+ID4g
PiBhIEdQSU8tY29udHJvbGxlZCByZWd1bGF0b3IuIFRoaXMgZmxhZyB3aWxsIGhlbHAgY29uZmln
dXJlIHRoZQ0KPiA+ID4gaW50ZXJuYWwgcmVndWxhdG9yIGFuZCBhdm9pZCBzcGVjaWFsIGhhbmRs
aW5nIHdoZW4gR1BJTyBpcyB1c2VkIGZvciB2b2x0YWdlIHJlZ3VsYXRpb24gaW5zdGVhZA0KPiBv
ZiB0aGUgU0RfKElPVlMvUFdFTikgcGlucy4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBM
YWQgUHJhYmhha2FyDQo+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPg0KPiA+ID4gLS0tDQo+ID4gPiB2Mi0+djMNCj4gPiA+IC0gUmVuYW1lZCB2cW1tYy1yOWEw
OWcwNTctcmVndWxhdG9yIG9iamVjdCB0byB2cW1tYy1yZWd1bGF0b3INCj4gPiA+IC0gQWRkZWQg
cmVndWxhdG9yLWNvbXBhdGlibGUgcHJvcGVydHkgZm9yIHZxbW1jLXJlZ3VsYXRvcg0KPiA+ID4g
LSBBZGRlZCAncmVuZXNhcyxzZGhpLXVzZS1pbnRlcm5hbC1yZWd1bGF0b3InIHByb3BlcnR5DQo+
ID4gPg0KPiA+ID4gdjEtPnYyDQo+ID4gPiAtIE1vdmVkIHZxbW1jIG9iamVjdCBpbiB0aGUgaWYg
YmxvY2sNCj4gPiA+IC0gVXBkYXRlZCBjb21taXQgbWVzc2FnZQ0KPiA+ID4gLS0tDQo+ID4gPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVzYXMsc2RoaS55YW1sIHwgMzANCj4gPiA+
ICsrKysrKysrKysrKysrKysrKy0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVzYXMsc2RoaS55YW1sDQo+ID4gPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4g
PiA+IGluZGV4IDNkMGU2MWU1OTg1Ni4uMjA3Njk0MzRhNDIyIDEwMDY0NA0KPiA+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2FzLHNkaGkueWFtbA0K
PiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9yZW5lc2Fz
LHNkaGkueWFtbA0KPiA+ID4gQEAgLTE4LDYgKzE4LDcgQEAgcHJvcGVydGllczoNCj4gPiA+ICAg
ICAgICAgICAgLSByZW5lc2FzLHNkaGktcjdzOTIxMCAjIFNILU1vYmlsZSBBRzUNCj4gPiA+ICAg
ICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzNhNCAjIFItTW9iaWxlIEFQRTYNCj4gPiA+ICAg
ICAgICAgICAgLSByZW5lc2FzLHNkaGktcjhhNzc0MCAjIFItTW9iaWxlIEExDQo+ID4gPiArICAg
ICAgICAgIC0gcmVuZXNhcyxzZGhpLXI5YTA5ZzA1NyAjIFJaL1YySChQKQ0KPiA+ID4gICAgICAg
ICAgICAtIHJlbmVzYXMsc2RoaS1zaDczYTAgICMgUi1Nb2JpbGUgQVBFNg0KPiA+ID4gICAgICAg
IC0gaXRlbXM6DQo+ID4gPiAgICAgICAgICAgIC0gZW51bToNCj4gPiA+IEBAIC0xMTgsNyArMTE5
LDkgQEAgYWxsT2Y6DQo+ID4gPiAgICAgICAgcHJvcGVydGllczoNCj4gPiA+ICAgICAgICAgIGNv
bXBhdGlibGU6DQo+ID4gPiAgICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ID4gLSAgICAgICAgICAg
IGNvbnN0OiByZW5lc2FzLHJ6ZzJsLXNkaGkNCj4gPiA+ICsgICAgICAgICAgICBlbnVtOg0KPiA+
ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHNkaGktcjlhMDlnMDU3DQo+ID4gPiArICAgICAg
ICAgICAgICAtIHJlbmVzYXMscnpnMmwtc2RoaQ0KPiA+ID4gICAgICB0aGVuOg0KPiA+ID4gICAg
ICAgIHByb3BlcnRpZXM6DQo+ID4gPiAgICAgICAgICBjbG9ja3M6DQo+ID4gPiBAQCAtMjA0LDYg
KzIwNywzMSBAQCBhbGxPZjoNCj4gPiA+ICAgICAgICAgIHNlY3Rpb25lZCBvZmYgdG8gYmUgcnVu
IGJ5IGEgc2VwYXJhdGUgc2Vjb25kIGNsb2NrIHNvdXJjZSB0byBhbGxvdw0KPiA+ID4gICAgICAg
ICAgdGhlIG1haW4gY29yZSBjbG9jayB0byBiZSB0dXJuZWQgb2ZmIHRvIHNhdmUgcG93ZXIuDQo+
ID4gPg0KPiA+ID4gKyAgLSBpZjoNCj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gKyAg
ICAgICAgY29tcGF0aWJsZToNCj4gPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gPiArICAg
ICAgICAgICAgY29uc3Q6IHJlbmVzYXMsc2RoaS1yOWEwOWcwNTcNCj4gPiA+ICsgICAgdGhlbjoN
Cj4gPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gKyAgICAgICAgcmVuZXNhcyxzZGhpLXVz
ZS1pbnRlcm5hbC1yZWd1bGF0b3I6DQo+ID4gPiArICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcNCj4gPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246
DQo+ID4gPiArICAgICAgICAgICAgRmxhZyB0byBpbmRpY2F0ZSBpbnRlcm5hbCByZWd1bGF0b3Ig
aXMgYmVpbmcgdXNlZCBpbnN0ZWFkIG9mIEdQSU8gcmVndWxhdG9yLg0KPiA+ID4gKw0KPiA+ID4g
KyAgICAgICAgdnFtbWMtcmVndWxhdG9yOg0KPiA+ID4gKyAgICAgICAgICB0eXBlOiBvYmplY3QN
Cj4gPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246IFZRTU1DIFNEIHJlZ3VsYXRvcg0KPiA+ID4g
KyAgICAgICAgICAkcmVmOiAvc2NoZW1hcy9yZWd1bGF0b3IvcmVndWxhdG9yLnlhbWwjDQo+ID4g
PiArICAgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiA+ICsNCj4gPiA+
ICsgICAgICAgICAgcHJvcGVydGllczoNCj4gPiA+ICsgICAgICAgICAgICByZWd1bGF0b3ItY29t
cGF0aWJsZToNCj4gPiA+ICsgICAgICAgICAgICAgIHBhdHRlcm46ICJednFtbWMtcjlhMDlnMDU3
LXJlZ3VsYXRvciINCj4gPiA+ICsNCj4gPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiA+ICsgICAg
ICAgIC0gdnFtbWMtcmVndWxhdG9yDQo+ID4NCj4gPiBNYXliZSB3ZSBjYW4gZHJvcCByZXF1aXJl
ZCB0byBtYWtlIGl0IG9wdGlvbmFsLCBzbyB0aGF0IG9uZSBoYXMgdGhlDQo+ID4gb3B0aW9uIHRv
IHNlbGVjdCBiZXR3ZWVuIHsgdnFtbWMtcmVndWxhdG9yLCBncGlvIHJlZ3VsYXRvcn0/Pw0KPiA+
DQo+IEkgdGhpbmsgbWFraW5nIHRoZSByZWd1bGF0b3Igbm9kZSBvcHRpb25hbCBpc24ndCBjb3Jy
ZWN0IGhlcmUgYXMgdGhpcyBpbnRlcm5hbCByZWd1bGF0b3IgaXMgYWx3YXlzDQo+IHByZXNlbnQg
aW4gdGhlIFNvQyBhbmQgdGhpcyBoYXMgdG8gYmUgZGVzY3JpYmVkIGluIHRoZSBEVCBubyBtYXR0
ZXIgaWYgaXQncyBiZWluZyB1c2VkIG9yIG5vdC4NCg0KQWdyZWVkLCBidXQgdXNlciBjYW4gbWFr
ZSBpdCBvcHRpb25hbCBieSBzZXR0aW5nIHBpbm11eCBhcyBncGlvIGFuZCANCnRoZSBpbnRlcm5h
bCByZWd1bGF0b3IgaXMgdmFsaWQgb25seSBpZiB3ZSBtYWtlIGl0IGFzIGEgZnVuY3Rpb24uDQoN
CkZyb20sIFNvQyBwb2ludCB2cW1tYy1yZWd1bGF0b3IgaXMgYWx3YXlzIGF2YWlsYWJsZS4gU28s
IGl0IG5lZWRzIHRvIGJlIGRlc2NyaWJlZA0KYXMgYWJvdmUuIEJ1dCByZXF1aXJlZCBwcm9wZXJ0
eSBhbmQgZGlzYWJsZWQgaW4gdGhlIG5vZGUgc29tZXdoYXQgY29uZnVzaW5nPz8NCg0KQ2hlZXJz
LA0KQmlqdQ0K


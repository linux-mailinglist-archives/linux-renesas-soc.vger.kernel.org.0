Return-Path: <linux-renesas-soc+bounces-8774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B3D96EA8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54D8280D45
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9CF15B111;
	Fri,  6 Sep 2024 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HTuw0yoc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87FD15AAD3;
	Fri,  6 Sep 2024 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604117; cv=fail; b=UObTPRZafUF/3UXaFwdkRhvvSPRQep3pTg56svBdOhgCKv72uSIjY65bD4E9fARNqIcuvC25aGWNuapNRX3zgXynNvp6m5+ATb6nL6aDevaFB14OEMEpQJletWPJPFD4bdLBGgVlxJvPoW34i+HsfXLNZv6+zfqnSeciAOJhPoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604117; c=relaxed/simple;
	bh=lLHbo4RhqbpyTFK2derG+NOAnRVRL4XlIISQU6S14Ac=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yd9g2khUlDjYpLkzCZ+ZwfqBVSwcpOpOfAlGTmQdqPsKBYYW6IX5OMfC2dqy+n1a5zI/sY5egQayQZBGmyKlfiojJlgdEfqIQkFl0okD0bj1plbw66u8ta8FZ8sj95e86n5Bss0iZMJlucudZ6TSgsexwdkEE0w5I7p/QtBMYko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HTuw0yoc; arc=fail smtp.client-ip=52.101.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Of1pWnHeBt8w9gT/A0ruOyFDE/zAjMKyxiewKeQXzhOl2vhKp+J3q0dx4Ci/OoU4CBgFkygS7kXfWyzj0HIijUrk7soySqA6Q1gscphErtE6rVKwsc1yC6ycbsxxpQWnYHYm+o0IAmiedCUkjmekX71aLk+kXkIVXhjejPCwq6HanUz8W9LOgIvW4+CPeBqvUCfdojpVwt8KbTJ+I4vpDwjcSGrbicTGXmoL6x4oEX11CMyvgIOea+kUZvyG39pYwmJsfo6MwG6J7PHHkWYpHq+2LlK65S2chUS2ZSeKvCAwMfXn+QNoDonAEm2wpXI+40nSK9/hQSFgLHSNRBMaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLHbo4RhqbpyTFK2derG+NOAnRVRL4XlIISQU6S14Ac=;
 b=eMWcrQHIUOw/G94vgBDHhOH1yLWg5vm/+6YfL6O9wlJZMiVlzSUd7kxyljepaISmj42DwzpZkW6gIiA9gjZcXLj7nlO9l/2VyarUnqVRmZ9DSJyENLyyyHqaPeO6j0Lk/E+vZTFilZB00TfGeSNpjv6KhW19ekRrPNiIwodPeFpYgj5KL4G4rsvNlv2u4CesgpaKkYR6DAggy4GHaUyVX//1HayiKaYQeCq1nvoffSf5stjX+tOTx3xKtx4cmOaHxBXj3dBYYjrFb7ADeHGKWDGompfuDS/3PCBfT4N4eJDuHsMLqojaQAC7T17wxy0K7uMkKSL0NNT7KNMrWecAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLHbo4RhqbpyTFK2derG+NOAnRVRL4XlIISQU6S14Ac=;
 b=HTuw0yoc3X14WffB7A8skZqhiWbDH6ooXZ1zprvTlWSFnLSOqQ/uS1YHyscAH4I4AU67VmKRItA56KcETSWXJEyAMOaJRkmj991bA3f2mWIlVRdRaSmNkDg6iaPuFsQyICnJoLkGFE+I35x+IEcNbmJuqFAO8zkQ76TNBeONa4A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9725.jpnprd01.prod.outlook.com (2603:1096:400:230::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 06:28:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 06:28:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, "patrick@stwcx.xyz"
	<patrick@stwcx.xyz>, =?utf-8?B?Q2Fyc3RlbiBTcGllw58=?=
	<mail@carsten-spiess.de>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jonathan Corbet
	<corbet@lwn.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 2/3] dt-bindings: hwmon: add renesas,isl28022
Thread-Topic: [PATCH v6 2/3] dt-bindings: hwmon: add renesas,isl28022
Thread-Index: AQHbACRUYdVUnbOtCESczpQ2lt6GSbJKSpEA
Date: Fri, 6 Sep 2024 06:28:29 +0000
Message-ID:
 <TY3PR01MB1134628415A55815B09AC0E38869E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240906061421.9392-1-Delphine_CC_Chiu@wiwynn.com>
 <20240906061421.9392-3-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906061421.9392-3-Delphine_CC_Chiu@wiwynn.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9725:EE_
x-ms-office365-filtering-correlation-id: cd40b0b1-180e-4cc4-2bf6-08dcce3d1f38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?MW1qZWVtVFRnbUEzZ1BrL3Fta3VoaStVRmttN0M3dnIvalVrUVBsZmRTR0Vj?=
 =?utf-8?B?RDJnOURKeVdaQWJjY2RFV3czTXg3UVU2cUFFek52aVFyQ1c1ajZaRmE4YWhI?=
 =?utf-8?B?YWRIL29RdWV2YnN4NVQzV1p5TDlpN0lkYzJwdWY3citXQkpreFJJYlgvUUx3?=
 =?utf-8?B?QkdvUkFJU1RDZGFuMGlGTHE0M1hoTDNNblF3bUN0SzJQaHhSWlRpU2lhNU1p?=
 =?utf-8?B?V1E3TEc5bjRxd09sUmkrZVdrSU5RNnVYS202SkRRbkdZWVB0czBiYzJsb0J5?=
 =?utf-8?B?QXpzYWNRRkpWZ1c4M1VZbG1FSE9vNWdIVXhLd1dxSnhlaUpSUll4MmgwZVQ4?=
 =?utf-8?B?SjZYOW95SUpDdWVqOU50V0tHdFFMNlVxSGp5Q1J3aEEzcDhmQlRUZENKenlv?=
 =?utf-8?B?TElXRDhwWkprRXhGOXBSd1p5M3FrRmozMGp4bW16U2RuYUVoRks3eWFZZVJV?=
 =?utf-8?B?dXRyUEVLTzV0bWNzRW9EWTZmOHR2YWM1a2treVhGVWhselRYbnFWdUFkb081?=
 =?utf-8?B?MkU0QkVDdy85eWRlRVVZOFFEMGxHb1VNSy9vNzhvMW1yaXE2bDk3L2N2S3kx?=
 =?utf-8?B?cjFUYjVjNTYwYjM5NjhZanIrYS9mS0U3b3ZqZjVnNStHdGhudzFGSGVoVkNK?=
 =?utf-8?B?R2dHSUtJQklENmpiWWZBeW9IalVxKzBPLzU1b3hTNEg0UmRsSEl5Y21GYmNt?=
 =?utf-8?B?MHkxbzJTNnJGZGJhVzRrTUJWbGY4d21WeVQ5c0FweWNLbS9nRzBGanZQVTZj?=
 =?utf-8?B?eVFWTDRxN3VCWWZZcHhpN1l0S2doZmV3eFhGVEh3SXVZSGZlM3I4bzZ5R2o2?=
 =?utf-8?B?dEhnaVA3NE41RWQxZ2NZMTlQQll1U0lWclpDRUlwdStpYXM1VzR2MDVkZ0wx?=
 =?utf-8?B?M3pwVU9OODJaZHowaHFaRDQ1UjhOZzQyVFZpa0dLWWJUYjBPSmltdHlMejdh?=
 =?utf-8?B?V0hYem95Vmh3ZXZyeXBWOW04Y1hRR3pNWW5GQnQzcmlVUG1jMkpUbG9LUWMv?=
 =?utf-8?B?UEtrSzZHNS9XM2JNNjljSUgwdDRsSjlUaXFqQnJTc28rYzlHVm1FTmZYQVFq?=
 =?utf-8?B?TW5UZ2RFT1BQYjdWMW0vTzZXMVpDLzdWUXhqSlVRMW52ZnQxOHJLTFRMeEdw?=
 =?utf-8?B?TlhSV092UWRvMndra0daSWlCK2l2cjFCL2Jvck16VTdhM1hwdFZlMy9SUUtz?=
 =?utf-8?B?VllkQmswSUVMYkNwYi9mNlV6YnNFZCsrUEtVQkZTYjFCYktmUi96UStROTFQ?=
 =?utf-8?B?eExsTUlkdlZGUG9DL2JGeFVobm1lTlAxdWZTOUJpdUZ6c1pOdSszRU9jTmJV?=
 =?utf-8?B?NXlIa3dwdEtsM1B5NitNWGVDSzZPMlM5RmJuL3ZBL1VhRnlRb0IzdVpGMnR6?=
 =?utf-8?B?MmIyc0ZOd29jN1RaNU9xZ2MxZHMyQjN1TlY3bjF0MzA5ZXJ1SFFZV0kzVzJT?=
 =?utf-8?B?VjdsOEhjOVlQUUVZYkNOM0xOMWFnSFNTV21NWGk3YUZHVTBXSEhCc1U2YzM2?=
 =?utf-8?B?UEFibllIT0llQXhTOGJ1UEl6eU10WDVDUDhmdW1pZ1NPRmhlaTJVK0JvbExV?=
 =?utf-8?B?MnQ2emFDYUZWckx3czVXeHNKMThtaVdyUGJMVmZXaVRtY3E5K1JET2FkMWc2?=
 =?utf-8?B?aVJFN3lIemVTdjZJQjRFMTBnTWNEdENXTmt2S2RqbUx2cHBwR1VDYmFlNG9m?=
 =?utf-8?B?ZFdNMDMvR2cycTBiNkxGcGUxS0RVVGlCUHZRNW1UM2NMZ1JDdWxKNjk4dDNz?=
 =?utf-8?B?SnJPNUQ4NE1PZFcycGp6R1ZNWWVFNkpXcEU5WUE4NzNTKzF4MEtsYks4VHFx?=
 =?utf-8?Q?ZdOJb1Pq9qKXAWBvs1AkaZtivhkOSV5wiua0Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azB6Vnk3RlU3QmJWZXZJSXBsaHQwU3BCNkZpeHZVVzBJN1kwK1MvS2M1V0w2?=
 =?utf-8?B?TE8vb0ppTGd5UWt1M1ZQWTVNaWpZWDBiWUN6WnIzbmdDTHhiUTNZdzlWRkdV?=
 =?utf-8?B?UGxWMDlESUV5Q2cwM3lTd2hwd1F3dElFQzZiU3J5SzlHZVdMRmxjWEEzd0RW?=
 =?utf-8?B?VVg2WlRCajBacDNzUlNjMWxnVCtSRzRZRUxiK2hSMmZCdWNyU1B5UmNEOUNT?=
 =?utf-8?B?RDRrUE1ZbEVJdFJZQm1zN0hRdHF1VWYvK3RxdE1hbWFoQ3hET1JTTyt3bGVa?=
 =?utf-8?B?bEMzcDV5d21NcmVBZWN6M2xuNCtteE1UTmFNdDdscUJUOUg5TmdvVGdWZWJx?=
 =?utf-8?B?MGNObm0rbGw1aWlzV3VXUktzSFRIMFlrTWhuRjFzeCs4SW5RYlBpSFc1QnRr?=
 =?utf-8?B?WGFtYXErZ0lDMkYvYXJUM2s5YVBNalRjc1IxYVVMWVlObjBTTXVocG1GTER6?=
 =?utf-8?B?bHpuZDZWU3RkNytSQkpPTnp0U2h2QzhoQTBsREtBVXJYYzNza1BIZDQwSmNC?=
 =?utf-8?B?b1VjSjVjMWVzaHpsVU9Ycy9BaGV1VEQrbFE2WnJXRUZYa0tVaUhweFNHbFEy?=
 =?utf-8?B?NTVUNGZzdUhWQzFIR1ZRcE1XbU51K3BiUTgyWWlrU1VENEZwSWlGcSs2d0lk?=
 =?utf-8?B?V0ZWdC9OODBBYlNLRFNKVVZGNU9hbDdyTXk5VnViNjgyeGFmZW9YQmtXWVJ1?=
 =?utf-8?B?WGdkRTMwbUJxV1Y2WFVHT2hpN2oxNk94VkNzcVdNWGN1V2VHU0RqWDk4TCtF?=
 =?utf-8?B?Q20zeFg0NE8vZmJmVElmRGp4NnFQaS9RbHltT08relRsUGhnMXgvajNxMUh5?=
 =?utf-8?B?VHVZM2JLZGVsa2lWd2hYODVVenlERWRUZ3l4Rlc2UWlJYitvRmgxQlNFNCtC?=
 =?utf-8?B?bnRjeXlTUmp2aEdZY083eW9qRUg4NmFJMmFUaHIxdUVUeU5BaUFyVzRQQ1VJ?=
 =?utf-8?B?bkx4Z1d6QlQ4enExYUZiMERIL2JJTURKYWlLVUNzU2JSL2kwTnMzR3k4dnlM?=
 =?utf-8?B?QmMrbkxCbjhidEl0TFBPYlhzQis0a09VN1d4cUFHTlJTbk1KVTMrdGgwOEhh?=
 =?utf-8?B?a3Mxb2czb0lUeENMdDJ5N21sME9HVTJPaFlsMU9TS2FBVVgvUTVUMkFZRlds?=
 =?utf-8?B?NEU0TGpoVEFUMjNFQkxQUlRLcUc3ZHYzaGJvd2JUL1d5TGFqZWFzbUpVNzVW?=
 =?utf-8?B?R2tnUmFlbC9MT29ldlhvNFEvVEh4YjZnRk9zdDBXMW41VmpOQVFCbGVvNlNO?=
 =?utf-8?B?Tzd1Q2plc2txMzdGcUxEaTh4cnpOQTFSWWI4bHF4a1JyR2xtVEFZUjZJMFZa?=
 =?utf-8?B?d1kydjc0ZkNnZXVRZnpteWZ4OUM0MzFhcTF5Zml3dm9MWGhQTnFBYVhtaCs4?=
 =?utf-8?B?b01PMkJmQXk4SDdiNmw0L0pKV243c3BkTm1JYlFMeTlRMFVXeUZwWFlnTTZk?=
 =?utf-8?B?N0szZFlibnVHVnQ1ckdSQU1DNS9DZHBLbmFaNUg5TWFoK1l2QnowWE9pcmdt?=
 =?utf-8?B?QXROd3hjOU1kazQrTkJxTjI5YjJpSDRIcDh0VHZSTjdpNlAvT09FV2xLMnBw?=
 =?utf-8?B?RWNTMUZhQVpHQkFoMTVnMGdOdDYxdDJDM3RaeTBCOTU4SERjNXRvcFloRTQ2?=
 =?utf-8?B?Zk4ra3ZGeWNxcUM2YWVNcnR5VE05QmxDS0JkM2JBdktDVTlhL1h3MFZURERU?=
 =?utf-8?B?TWdFczRCUUd1cjRXOVYydUdkMjk4WmtobTBZUmkyVTc4MmRmWW1Yc0w4Z0ww?=
 =?utf-8?B?WFpmUFFxUlRWRW9iUElibXZweE5Xemp4emg2Vkx4cGlmVTFrKzVVcHZNc1JF?=
 =?utf-8?B?TkpqVGFwRk9qc0cydDlmYnJRNGVuejFYeDdYSUVrUm92blV5aVNHRWQ4Qnow?=
 =?utf-8?B?aEIvYmxSNDBPMldMc0d2NnduNzJMVDc3VWgxL0Y3OUdQRHpsclo0TGdFeXhV?=
 =?utf-8?B?WFBIbGZ5WUFUZlpFV2l2Nm8vUCtZTGxscGlNUTE2SytZZkJ1Zm1jQ2xiK0ZT?=
 =?utf-8?B?R1lMUStTNTJoSDZOc1AveFYxLzM4RVlYNHhLSTliNkcwVGVoVkhZU21MYWxr?=
 =?utf-8?B?RHg1Qmx2TWNUZFlJS3luQ25XWE9JR1hMOG9TWVVTOTJja3ZzUGk4RHd0aHh0?=
 =?utf-8?B?TE5TTmYyMTZReVF3bDk2aW9LcjdxYSttODdiZVZ6akU5Y2JjanhxM1ZkenAr?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cd40b0b1-180e-4cc4-2bf6-08dcce3d1f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 06:28:29.1787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YkhMz3I7KMV7cLHxncnCipn0jIM+qqqCYtIvU7ARTGFJizhy5o6oKgG0KLi2mi5sCG9OGW7idl5h0a+UQpA9+urIXxEy9DoheQam6LtkV2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9725

SGkgRGVscGhpbmUgQ0MgQ2hpdSwNCg0KSSBndWVzcyBiaW5kaW5nIHNob3VsZCBiZSBmaXJzdCBw
YXRjaCwgb3RoZXJ3aXNlIHlvdSBnZXQgdW5kb2N1bWVudGVkIHdhcm5pbmdzIGZvciBkcml2ZXIg
cGF0Y2gNCmFzIGl0IGlzIHRoZSBmaXJzdCBwYXRjaC4gVGhlbiB5b3UgY291bGQgbW92ZSBNQUlO
VEFJTkVSUyBmcm9tIHRoaXMgcGF0Y2ggdG8gZHJpdmVyIHBhdGNoDQoNCkFsc28sIGl0IGlzIG1p
c3NpbmcgeW91ciBTb0IuDQoNCkNoZWVycywNCkJpanUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBEZWxwaGluZSBDQyBDaGl1IDxEZWxwaGluZV9DQ19DaGl1QHdpd3lu
bi5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDYsIDIwMjQgNzoxNCBBTQ0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjYgMi8zXSBkdC1iaW5kaW5nczogaHdtb246IGFkZCByZW5lc2FzLGlzbDI4
MDIyDQo+IA0KPiBGcm9tOiBDYXJzdGVuIFNwaWXDnyA8bWFpbEBjYXJzdGVuLXNwaWVzcy5kZT4N
Cj4gDQo+IEFkZCBkdC1iaW5kaW5ncyBmb3IgUmVuZXNhcyBJU0wyODAyMiBwb3dlciBtb25pdG9y
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2Fyc3RlbiBTcGllw58gPG1haWxAY2Fyc3Rlbi1zcGll
c3MuZGU+DQo+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgLi4uL2JpbmRpbmdzL2h3bW9uL3JlbmVzYXMs
aXNsMjgwMjIueWFtbCAgICAgIHwgNjQgKysrKysrKysrKysrKysrKysrKw0KPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA2NSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3JlbmVzYXMsaXNsMjgwMjIueWFtbA0KPiAN
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9y
ZW5lc2FzLGlzbDI4MDIyLnlhbWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaHdtb24vcmVuZXNhcyxpc2wyODAyMi55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uZGQ4MmE4MGU0MTE1DQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL3JlbmVzYXMsaXNsMjgw
MjIueWFtbA0KPiBAQCAtMCwwICsxLDY0IEBADQo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2h3bW9uL3JlbmVzYXMsaXNsMjgwMjIueWFtbCMN
Cj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iw0KPiArDQo+ICt0aXRsZTogUmVuZXNhcyBJU0wyODAyMiBwb3dlciBtb25pdG9yDQo+ICsNCj4g
K21haW50YWluZXJzOg0KPiArICAtIENhcnN0ZW4gU3BpZcOfIDxtYWlsQGNhcnN0ZW4tc3BpZXNz
LmRlPg0KPiArDQo+ICtkZXNjcmlwdGlvbjogfA0KPiArICBUaGUgSVNMMjgwMjIgaXMgYSBwb3dl
ciBtb25pdG9yIHdpdGggSTJDIGludGVyZmFjZS4gVGhlIGRldmljZQ0KPiArbW9uaXRvcnMNCj4g
KyAgdm9sdGFnZSwgY3VycmVudCB2aWEgc2h1bnQgcmVzaXN0b3IgYW5kIGNhbGN1bGF0ZWQgcG93
ZXIuDQo+ICsNCj4gKyAgRGF0YXNoZWV0czoNCj4gKyAgICBodHRwczovL3d3dy5yZW5lc2FzLmNv
bS91cy9lbi93d3cvZG9jL2RhdGFzaGVldC9pc2wyODAyMi5wZGYNCj4gKw0KPiArcHJvcGVydGll
czoNCj4gKyAgY29tcGF0aWJsZToNCj4gKyAgICBjb25zdDogcmVuZXNhcyxpc2wyODAyMg0KPiAr
DQo+ICsgIHJlZzoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgIHNodW50LXJlc2lzdG9y
LW1pY3JvLW9obXM6DQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICBTaHVudCByZXNpc3Rv
ciB2YWx1ZSBpbiBtaWNyby1PaG0NCj4gKyAgICBtaW5pbXVtOiA4MDANCj4gKyAgICBkZWZhdWx0
OiAxMDAwMA0KPiArDQo+ICsgIHJlbmVzYXMsc2h1bnQtcmFuZ2UtbWljcm92b2x0Og0KPiArICAg
IGRlc2NyaXB0aW9uOg0KPiArICAgICAgTWF4aW1hbCBzaHVudCB2b2x0YWdlIHJhbmdlIG9mICsv
LSA0MCBtViwgODAgbVYsIDE2MCBtViBvciAzMjAgbVYNCj4gKyAgICBkZWZhdWx0OiAzMjAwMDAN
Cj4gKyAgICBlbnVtOiBbNDAwMDAsIDgwMDAwLCAxNjAwMDAsIDMyMDAwMF0NCj4gKw0KPiArICBy
ZW5lc2FzLGF2ZXJhZ2Utc2FtcGxlczoNCj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIE51
bWJlciBvZiBzYW1wbGVzIHRvIGJlIHVzZWQgdG8gcmVwb3J0IHZvbHRhZ2UsIGN1cnJlbnQgYW5k
IHBvd2VyIHZhbHVlcy4NCj4gKyAgICBkZWZhdWx0OiAxDQo+ICsgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ICsgICAgZW51bTogWzEsIDIsIDQsIDgs
IDE2LCAzMiwgNjQsIDEyOF0NCj4gKw0KPiArcmVxdWlyZWQ6DQo+ICsgIC0gY29tcGF0aWJsZQ0K
PiArICAtIHJlZw0KPiArDQo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gKw0KPiAr
ZXhhbXBsZXM6DQo+ICsgIC0gfA0KPiArICAgIGkyYyB7DQo+ICsgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Ow0KPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKw0KPiArICAgICAg
ICBwb3dlci1tb25pdG9yQDQwIHsNCj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNh
cyxpc2wyODAyMiI7DQo+ICsgICAgICAgICAgICByZWcgPSA8MHg0MD47DQo+ICsgICAgICAgICAg
ICBzaHVudC1yZXNpc3Rvci1taWNyby1vaG1zID0gPDgwMDA+Ow0KPiArICAgICAgICAgICAgcmVu
ZXNhcyxzaHVudC1yYW5nZS1taWNyb3ZvbHQgPSA8NDAwMDA+Ow0KPiArICAgICAgICAgICAgcmVu
ZXNhcyxhdmVyYWdlLXNhbXBsZXMgPSA8MTI4PjsNCj4gKyAgICAgICAgfTsNCj4gKyAgICB9Ow0K
PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCBkMzkxOTll
ZDUxZGEuLmQ1ODA5Y2YxODFmZiAxMDA2NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIv
TUFJTlRBSU5FUlMNCj4gQEAgLTExOTM2LDYgKzExOTM2LDcgQEAgSVNMMjgwMjIgSEFSRFdBUkUg
TU9OSVRPUklORyBEUklWRVINCj4gIE06CUNhcnN0ZW4gU3BpZcOfIDxtYWlsQGNhcnN0ZW4tc3Bp
ZXNzLmRlPg0KPiAgTDoJbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnDQo+ICBTOglNYWludGFp
bmVkDQo+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vcmVuZXNh
cyxpc2wyODAyMi55YW1sDQo+ICBGOglEb2N1bWVudGF0aW9uL2h3bW9uL2lzbDI4MDIyLnJzdA0K
PiAgRjoJZHJpdmVycy9od21vbi9pc2wyODAyMi5jDQo+IA0KPiAtLQ0KPiAyLjI1LjENCj4gDQoN
Cg==


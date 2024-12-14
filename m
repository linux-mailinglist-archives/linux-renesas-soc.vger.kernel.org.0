Return-Path: <linux-renesas-soc+bounces-11331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ADE9F1C80
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 05:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0A28169874
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Dec 2024 04:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9B62745E;
	Sat, 14 Dec 2024 04:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Fa+39CEs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E01168B1;
	Sat, 14 Dec 2024 04:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734149159; cv=fail; b=hkEBXaGfAThY+sjiFPV/TW1Mf3eNAynp5gHQXn+2IzTxA9xi/ltJnjIrVKiMQk9dsfF+SzXzLcr+7B7gdmFqv261PKEzvedWlqo8GjQfgiy7JK+x1YwucLWKGIWmupK+NdtiKp8Wh/EbkHnxWN+dxHbsc0HRwvSVWZdVj9UwDCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734149159; c=relaxed/simple;
	bh=gX20dNuToE3ocpzjaXYrksLq1A6POLfCdkdiq8tS5b0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D9Mbmi0mgrvhgUzI8snDr9U3uuJ+lcG8UerWfkdPoQ/J1M5EQMD7Rvh1LJnnBnSRGi5i0LT7zZasWvl3sV/BO6e93zjBqjDQB7o5kyk1QA0jBp6C17bot67mlCq34+7HvtWmucElJdMKfnMrZuoqpX404deraro5yGOwumS18Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Fa+39CEs; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK5w972NMDwW/+FOH7gZtMRRp7UywDAnJTiCFC5t41lZe846uhyeEZSVUgX91AZgtf1Pp6zGZjP3HP7EoW0bvMB3dROVTO7TvKkXp4PvoQBwASmTYOE15IL7A8GkALN4htVE5nVuPGQvaUU2RpL2HOWPz51+xpGl4V/kfNFazLlKAvd524ZRuh83TpTJxGwmEt5Btbdlc3viglOlyCYZqDcPuNcWB+6EQOWwwL0b9ALQ+wYoQlnYGWMWEFB/oC/NQ6BN+ePWe6eyoz35EBb/+pcK1IZab3gR/cfa+8jsrn/wwEsK1sxNHAzLY6hBEOOp6ROfkx+bW+BWDkQEj7yDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX20dNuToE3ocpzjaXYrksLq1A6POLfCdkdiq8tS5b0=;
 b=sVmoYu1bkp3Pty0q+4A0p6xMlc50Z5/ne5036+Zu9ployjScMhhGudvqkAyccNTYZel9MkXgg7E7UNpG0tnVuiyLmfgah106m5rZ3ikCSek7YfdYJ3NHEyB7jxw8f++1zzNt9QTyst/DHSyp+c1nQjU/TMPvZgddvGaoR37BtNUbbanQv3HiwsU1j+wYLWS32EVKPjO2UEP0nkOZn0VKZZwgn5RtxZGzlG9xz3ao/S9QRuB1e756coTbLgJq31RqVR+jaROcUrPlr9wHUDqjg3f28PEy8vF8t+CAzs3taHHzQcqVfVVtIAhvqqZ87/x9RsWa1h+qwGfMrEcPeNJSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX20dNuToE3ocpzjaXYrksLq1A6POLfCdkdiq8tS5b0=;
 b=Fa+39CEsuuTzr0qTnru9ggBf+uynj0fB036mGM1X0c3H8fAGKQONXp175BmrPxPnyYRqm6+ngcZbNU01I33VIqPMlvE7OjPr1JoRr4e1MBz5P4K4oA0tdaULMewERvp/fpfxGi9IlM/ICeUFg8OqSDJZW8lDVqvPIn0eCNxETVs=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by OSCPR01MB13347.jpnprd01.prod.outlook.com (2603:1096:604:330::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Sat, 14 Dec
 2024 04:05:52 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%4]) with mapi id 15.20.8251.015; Sat, 14 Dec 2024
 04:05:42 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 2/5] dt-bindings: soc: renesas: Document Renesas RZ/G3E
 SoC variants
Thread-Topic: [PATCH 2/5] dt-bindings: soc: renesas: Document Renesas RZ/G3E
 SoC variants
Thread-Index: AQHbSCWEOEdiAqsI0EOBGWNNcUzYerLkYYOAgADHmwA=
Date: Sat, 14 Dec 2024 04:05:42 +0000
Message-ID:
 <OSBPR01MB27759F205DA898A86A7AB50BFF392@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-3-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXAy=1bo2o1rbO-Z0EVD6LPNbR5N6zTH4+agA4Q=V6gXg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXAy=1bo2o1rbO-Z0EVD6LPNbR5N6zTH4+agA4Q=V6gXg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|OSCPR01MB13347:EE_
x-ms-office365-filtering-correlation-id: a2f5b9f9-ec54-44cd-f8ff-08dd1bf493e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2dRMERaNkRFM3hmTG1xM1VBaHhVZlVWUklETzhzc2laWUMvWnNJL0N3UzdO?=
 =?utf-8?B?dDdsMDJzTDZmLzNMbGNMd3g2R3phNG9abWtKTmpHZHZINFhna1ZwS1FYUE9I?=
 =?utf-8?B?dE16Wm1vZFBadWdDWEpNWkw1Mk9qbXhnbjl4Mk9rb1JIM2UrWmNsVnBvN3o2?=
 =?utf-8?B?d2VNdTU3UTZzTFVPUG8yc1JqWC9XNE1CUmVvVEowUVgrZEhSYmxWSlpIcVN4?=
 =?utf-8?B?S3FNWWRMb2JKRVcrVVBtMlg1eHYyN2RRRURNeDFzZ1pob24xQ2ZZRllXUEFC?=
 =?utf-8?B?aGVienVnb1FsUVpsRm9FMXZJKzlQRWM2SWg1YUZJai9pbXYxbFNXVi81cThS?=
 =?utf-8?B?N0FIMnJ4aS8yYXRXckErSlFnK0xxYXJmUmNyd01TbTRlZG9uV3RQT2FZMmxj?=
 =?utf-8?B?VHJKODBhd1BweDZ5OHFtVVM0SUJKRjJ6QXFJZkFmeWpuR1dSVEoxcVlYQWdP?=
 =?utf-8?B?OHQ4T2x3dy9vc0wvaHIxc3UyY0JybFRtaXRGLzRvWEJhM0w2c1ZBT1ZUU1dC?=
 =?utf-8?B?MFZIK2VOQlpjSlkyNWhqbU1yOUh4TnZPU2RGSzFXMkY5eHV4cDRLUlJCV3hP?=
 =?utf-8?B?aTY3eWdKRm5OcTZtUEFveVUxQWN3OFE3K052dkcvWDlWY3VuOHliWHRYdVNn?=
 =?utf-8?B?Y3QxbXMxa2ZWWTFxV1owMlVzenZIeUhJZHJYVnM0RU9GbVpIbmJzWW1lSFJB?=
 =?utf-8?B?bjFNWlNRVjFTZWVBM0RTZ3krOVVmZGZPVThtdDQwUUM2NVRkL2Z4bzczd1A1?=
 =?utf-8?B?T29zWHY0aDEvMFFudzhrRExDd0lvWWxPVTU2VGtOdGRrMGorVUhxR3RWMUhT?=
 =?utf-8?B?WW9Hak5KeTFBS001a1Rsd3Q4VytqOWx6RUtlR3Y4UGtiV2N0dThTOFpjU055?=
 =?utf-8?B?dHpGZnE5WVRvTnNKa2JGTVJDUktZbnA3blFpSU0wVjg1Y2QrbURjaHMzcUt0?=
 =?utf-8?B?SWZuK1Jhd0dkVURwSGhFTVo5QTYvbitvTm1OQ2ROdUlqMTV6K1c3U201NmNQ?=
 =?utf-8?B?NkIxMHhOUjhJbnFTRi9TaFVISWN6QU5vZXFONlVxMjdyNEluZUVITkJxdmcz?=
 =?utf-8?B?d2sxcExQMlNocjBlZHJkOEtBZU4wNkVEOWN0LzY3eGwyN3lGcnVuSVd6cVNo?=
 =?utf-8?B?eXNYa20yTkxEMjIrenNmcmxiL0padnFxL2ZNNEhQblpuWVJLZCtEaEE0dWxD?=
 =?utf-8?B?VkZQRzJ6VzdiTXplTFRRN0lVN2dydkR1ZU9EWkpIcURWZnB0WkhyMzNhWlEw?=
 =?utf-8?B?L2VUbGVMQzlsdjFlaTluWU5yZzF2c2tRbURabGJUMmRjVnRnRGVrNUVBSmoz?=
 =?utf-8?B?UFFhQTZUYlp0Wm93UUxXeUlHL3dMbkRXeWwyb0tmZU9ROEFUSVQ3M3RrZE1L?=
 =?utf-8?B?M0lLOU9ud2dhZlhkZWsxS09aUTJUZlpQRHZYZjZNbnB3UzRtWmhzQ0s1UFU2?=
 =?utf-8?B?WFZjcXhDMFNyalhVWlNJVzgrckdjdjFBTS9LNXYrdGRzOGlDa2tOMDE1OVRu?=
 =?utf-8?B?czQ2WkJOakdiYWs3Q1c5V3ZpMU5YWk1tYUozMGpUZWFnOENRL00zbHdoNUlW?=
 =?utf-8?B?WlBJcHhhVDRQTklsNE1WNDdmb3c0cW1QUGg4T2xDaExvazRJOUdxbENXQXJK?=
 =?utf-8?B?WGpEWGx5aTN3TUhIZVowN2lWelpqSEpIV0hUZFV6S1VieVUxNHY3RHEwWHZN?=
 =?utf-8?B?enFuVjNZSC81MFdtNmJGZ2RHcGptZ29qU2IwUFIyWU1nY0FHR1pTMHIyaEVG?=
 =?utf-8?B?bXkrWDFsbS9ta0w2SXRMYmFSc2V0bktldWViMElrRUFBV0w5UGRnbWljZFJ3?=
 =?utf-8?B?MkhDN1hXcy9sYS9TK1MzYnBWM2VYOU9mcGRZNzR4NFB5SjJabE0yVC9sZXlG?=
 =?utf-8?B?VG1xRzZsTDBvVytRRG1nbFlDRytobDVlT01vKytsNzAva3c9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3Rwb0MwQzl5Y2JYQkRKdnhKQjZEc090ckZ2SUdnSmR0dHp6QVhraWphTUdv?=
 =?utf-8?B?ajd4TWtHTGo3OW5nSlR5RXlBQWxJVWVCY0xTcFR6bTRNZ0dDZjhjTGFLVFZx?=
 =?utf-8?B?NFNBQkppMndvaFVOaUR3bFZrKyt5SkUzZTdqWktzVDZNTEIvN0V2Yy9YQ1VL?=
 =?utf-8?B?UVFzOGlDbktvYzdDZDNKWHFOZ2tkV3VsVzlvYi8zbWlSN3p1RW42WGkvYThU?=
 =?utf-8?B?dE9oZ3dQNHBkSkhINDhLaW9oZTI1b29zUUhEaW9ac013WnVraVlYUHBlVisz?=
 =?utf-8?B?R0VDWCsvWmtQemVCMEZ0eGxBQnJCM01wSENTR3NrRFZneFVpYkZGTXExVUcz?=
 =?utf-8?B?N3REeHJHUTdia3VMUnpTT25oSXN3VWUrU295L1lYQzFSMU9lZGdoLzhKdklo?=
 =?utf-8?B?N2p2KytnUVR0T0YwdE1XdFg3OE9KZ3lwaW1URTFzRUdlQW5BcnUybTJMMnRz?=
 =?utf-8?B?cDAvYlEzYkIwdHI5a0llbFk1cDRpVWlwQzdmNzJsQlpKeTMra0orOGNYMGhN?=
 =?utf-8?B?U0JtekhkKy9Nc2FzSFBrcGx2b0szTHltbS9UZVRmQzBwZVZ3YTlrSm9BbHkw?=
 =?utf-8?B?REVneklBSmM3UXRoWGl1T2s0TmN4M2RaWmlEdTdpVE8vbTdZd0J2RG1kcDQ0?=
 =?utf-8?B?SmJVU3J3YndSWTNPSGM0QnBIUCszVnBOdVRYSGphaVAzVW9yMDBvYUczSEV6?=
 =?utf-8?B?MC9pbnJWUWJJUE5nSUpScW5nbHpDamZERlpBSUF0QWQzWnZsUFQ1djAxMUtE?=
 =?utf-8?B?Rkc0dlM0cC9VeE12TkpzZkFkWW56N0ZHM3JKQW1YWk1NaVhCUk1JZENDT1Y0?=
 =?utf-8?B?NCs3Vms0QnJBeDFwL3kzcDE0RGJialNoR1Q0endFOVE0U1hyQUJKd3JMeElp?=
 =?utf-8?B?R0c4aFNJYkUyWXpPbXpMMmhmakhyVkV5NUNCZDBPNlpZRjZHeDZWbzhDUkk4?=
 =?utf-8?B?ejBkTEh2RUZGNEtBVDJXcGkrVE1NRm5qaTFlQlhpQTgyZ1JtdUdTTFptQnJ3?=
 =?utf-8?B?RTFRK2xCOHFtdmdqakRMRVBDTmZCQkJaeUlMNHZpQ2lyVFkwdkJma3gvNys0?=
 =?utf-8?B?V1drQ2JqQTF0aytvOEVCcHhLY0VGMXl3S2NuSW4wYkFFcDczWEFrYUhzaHln?=
 =?utf-8?B?QUVST096enYyQlFSWWZ6R0JHRGVJVVVVMmhDSUNpL3Jya0N0YUxzb3NJVDMy?=
 =?utf-8?B?VmR0cndQcXlrUGlIeW0yc1hITXhlUTAzUUZCamRnMENKQ0ZrZlpucDFNNWxs?=
 =?utf-8?B?Rmtia0VUZW1hcjI1ZkIyM1ZNVURPSGxYaDE5cUNWYStHOFozaGNRblE5MFRa?=
 =?utf-8?B?bkFSbDgzd2NVL0VSbCsxRndNZm1nMSt6VDZnMHBWMTVzQ09kUVY2UUhRcE9H?=
 =?utf-8?B?WDlNbzcwRWlSZnRrcjN4L3hHWkRzTjRpWlhZRWxZcXhzRkJNWWhlL1J6endm?=
 =?utf-8?B?TmZOYlM1L2k3QlI4Vi9neUhaNTNUK296Zy9DM2dub1U2SWpLbDlrRVRPN0Q5?=
 =?utf-8?B?RFBxenFWdjFDMFQ1VlhsK0ladVFXOWQ5Q29aMkJ6WGcvWDBUeGJXYXJ5RzFC?=
 =?utf-8?B?MlFSUlozY29ZYnMwVEZXY1ZRZmY1Zkd3em4vRjJUZzdwMWlUY05uelFvM1BX?=
 =?utf-8?B?c01zbW1ybjYyZkVXcEt1SHdhWWJwZ3hKZ1dKSmsyeXpIcFdLS25YTGNJdXRE?=
 =?utf-8?B?Qm4ray9kclB6YWVvQWJpYTZhWGpQVVJzZDFqbFV4WTNoWVpNK09zcTJqTVlY?=
 =?utf-8?B?NGNJdHVPdUZlb1B2akRYVTUwdU11S285SWlDOFZVU3hmWStrVXBNTDlnREFk?=
 =?utf-8?B?djEwUVVDWjV1ZlVhUy94dXVhc3k1NG1GVC9KdzYvQVRRQ3F1MnFNQWx2YUVE?=
 =?utf-8?B?b2hOQnkrbUlMdjI0bjBsSUtVYnRJWFFja2ZiMjRtU1Q2Qk0vN2g1cGloelNZ?=
 =?utf-8?B?MkcybW5qcXhrUUYySGYzajRrcGJRNThGSW9jRHNneTF3NXQ5Nk5mT25xNjBl?=
 =?utf-8?B?WEcxQkRhNlNBVUVLQmk1cktSWEcvNWJId2JKMmlBWUhsTytQdE1ZTHU4a0Zm?=
 =?utf-8?B?L1ZYbUszb21mTUExTnFhZXlsS0F0Rm5acmpJSFFsNFNNNnFmM054djBiYUNQ?=
 =?utf-8?B?amd0VlZhS2JhWURzdU84dWZ0VWt6UktaZXZrK0UyL2pUKzB2SUcwR2FIbmRG?=
 =?utf-8?B?QkE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f5b9f9-ec54-44cd-f8ff-08dd1bf493e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2024 04:05:42.3840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3oqZR/yknRsTRixl53jumHppZQ9yv2RAeQnO5z5ynnTH67f5fL/dr7rilT8h0yhvwy10iSlRAVE2Ms9LnLqD4R4neGkrJe7vaUZSxTxq3N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13347

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJlciAxMywg
MjAyNCA1OjA2IFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi81XSBkdC1iaW5kaW5nczogc29j
OiByZW5lc2FzOiBEb2N1bWVudCBSZW5lc2FzDQo+IFJaL0czRSBTb0MgdmFyaWFudHMNCj4gDQo+
IE9uIEZyaSwgRGVjIDYsIDIwMjQgYXQgMTA6MjbigK9QTSBKb2huIE1hZGlldQ0KPiA8am9obi5t
YWRpZXUueGFAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IERvY3VtZW50IFJaL0czRSAoUjlB
MDlHMDQ3KSBTb0MgdmFyaWFudHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIE1hZGll
dSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBXaXRoIHRoZSBzdWJqZWN0
IGFuZCBkZXNjcmlwdGlvbiBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQoNCkhpIEdlZXJ0LA0KDQpXaWxsIGJl
IGZpeGVkIGluIHYyLg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IA0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg==


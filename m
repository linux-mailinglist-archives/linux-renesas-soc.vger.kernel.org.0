Return-Path: <linux-renesas-soc+bounces-8548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF9966102
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 13:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 601C11F26304
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 11:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADC9195FD1;
	Fri, 30 Aug 2024 11:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IpsYyUnq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704619995A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725018609; cv=fail; b=T9F+TVzsYWPV1qIY6Zb/+KDQ+S3Rgig/zkL/K9l9s244QKvZmJoF4Hp1/eOL18WYHmkj1V4bPUsldR01sA0jyTomGJdUmS92hRUaAjpMloq6A+p79P1AuVVMfqseSCo1DJBt51j1lxlCoeDIduysDl+fv2buUrI9bJAUiyRX4QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725018609; c=relaxed/simple;
	bh=aCfTiQSucV+wc4oRMaIMr6jt0GNCZXL/K16r2gZpmaw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u7uYqezuk6goav91/SbmUxCCmkRpB9RF2lU/rmuoF8ABbrGPh+MtgqgXr11ZhUBDZrM4dWNAQq5gXPNh4R+HleJvHxDuyYoUEyr+4xo1qYr30cnv9K95ed5TA64SFjSU9Q64mCENPelqj3XkINXj+phueiR/9SpRT7Bw0HphdmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IpsYyUnq; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAdum7gQBZHsNXuNUvI3C8AaE3fCPMh3X9w6z02MWPO8Z4xP5A+xrh3l1f4pw1YmZQGAuM2YNT1dO30LMiJxxaqtNgSoT/0Fid1QYIUboyJ65BsNXS3xzE3zbya8Ywiiv0S33pBoUoxJ47yYW6XjWAV90Y98KFT+SJ4FkZK6OZjyBp3xSVhMOqocIj21BmGja+oYDxmJbG+/lGr8lcuG6Xp0KmQiT2m/78/i8UW1giA6g+GerwGdhXLdbBI5UyGNfkIQ9+xFoSu7vMNxIB7ZwH1BC71BQKUXBKjwsNpDsZUxRE+Ws6Qs3ekyJIVDMxlhXeaXe/wvElnOOhvEFY3PVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCfTiQSucV+wc4oRMaIMr6jt0GNCZXL/K16r2gZpmaw=;
 b=N1/MQJijoFWHFIiiWbiMhc2okGM3HBcNuSpdGJUbQPjZ/6w3kVnxxlx/nFZFTJ6bnb/1ULbwvURf2Kkw9ge+/q1HHApYMA7tLIbvPBUpzqXwI505Emb4x0jrtlrrQLCBNduaiu2OHcz4/T1NYy0kBrqv4v/OMASN0/WZspEPVGkY4w9nDK1TjWuAUonxO3ElFUygKZ0U4a2FZHDsHVIzD+wDlD8LsJV3cGG7dq0vS3ewC3z37rO25bce1A66p7jsJ3JqP9Y8gYpgiKnQJnNvz0bwsuALQgz6LEZeoBzJSnUJiTmv+IOTpmtu5EANTtvZT7tan3K7J/cZ3F57PrvJ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCfTiQSucV+wc4oRMaIMr6jt0GNCZXL/K16r2gZpmaw=;
 b=IpsYyUnqy5LyBKtUHwHb0uUBnEAPYBaPvYbPs3D7g9cVYSvtiTz49TqRvDinZA8bnVoSKFThY2/c72j8AjjBlqadov+UFo9AhPRYjdO229vdQwpFBE6rQJrC0irBYOSArqVbZTHvgdmvgXPT5JtFkdswgHvstNuS95XWL4uBGMI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5401.jpnprd01.prod.outlook.com (2603:1096:404:803e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 11:49:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 11:49:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Walle <michael@walle.cc>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/3] memory: renesas-rpc-if: Use Hi-Z state as the default
 setting for IOVF pins
Thread-Topic: [PATCH 1/3] memory: renesas-rpc-if: Use Hi-Z state as the
 default setting for IOVF pins
Thread-Index: AQHazVmLhgheZUDUAkmjmnC+TVu0p7I9O9tAgAK9RQCAAADYgIAAEJUA
Date: Fri, 30 Aug 2024 11:49:57 +0000
Message-ID:
 <TY3PR01MB11346043460373DEE6DB5C5E786972@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240703145851.204306-1-biju.das.jz@bp.renesas.com>
 <20240703145851.204306-2-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346E69DB7142AE991ED461F86952@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <54695a5a-efbf-47b1-9485-c536656a4078@kernel.org>
 <ffd6067e-652e-470d-9061-e0efccc24e08@kernel.org>
In-Reply-To: <ffd6067e-652e-470d-9061-e0efccc24e08@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5401:EE_
x-ms-office365-filtering-correlation-id: 34fa2ade-db62-476e-dcc9-08dcc8e9df5a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S0orVTQyL2lwQnFXUzgyUWtiN2ppSUcyMHpVdDRKTjFrandRbmFERjlKS0NQ?=
 =?utf-8?B?VFBCOGU3dHl6VlVnOUJMa09jU1lpTExZcWo0Ny84MkhVeDExU2JiU29NdnhE?=
 =?utf-8?B?bHFWNFVHTEhsTEJaTTJiOFo3ZUNtdnYxdEczY2tqYWk4eDlIOW1hUHo1ZW16?=
 =?utf-8?B?Y3BoUkxWczI3V1ZQRGQwK1kzcW1EZi9FSEhpSFpFUWFxYlNjaTBDcGZubmFj?=
 =?utf-8?B?V3pFMVM5a2dHL0o5c3BOWjVmMk05TjNXSzVVcVBxd0RxcGRiZ3ZicnVtdWgx?=
 =?utf-8?B?Z0ZDelZPZERJSklsdU1VTHNEdFNrVUtvZ2NqN0RLblVrbHZkbTVPalQ1ZEVC?=
 =?utf-8?B?TGp1bXp6Q1RKTnRwaHB0TEpFRUJ0dkE0bWdmV2NMTUJ1Q0dmREliREJHZFRW?=
 =?utf-8?B?RnkxOHd2bUJDWnFFWVZZcVlzQnJrZU9IaFo5WnlXeVBhRGY4T2JWV0pWQ0RG?=
 =?utf-8?B?N0lxV2tuWlRxRlk4eDRqSDNtenRIeXBWTkdoZkZxWGZ5ckphaVpDVzVTRE5x?=
 =?utf-8?B?L1FnV0IvZGpnODdkN3orcXd2Tkl5cFVPVmdIZDd5YWlUM2ZCMG1BTm1yN0o2?=
 =?utf-8?B?QzBFc2pVZUpLUHlxc0ErcVZBalh6anVKVXNJYmdUVUZOVlhwUUpldFBDcmF3?=
 =?utf-8?B?dU9FN2pMdlhFdDA0QkF6Tzh2T2RsMStQTVNLNmtvd2Y3eE92SXFlcDduazZK?=
 =?utf-8?B?UDNBL2U1MzN5Vm5BSmcrK3RvdmFlb2lMYmpXLzJCNHBYNStiRVFvU0hBV29G?=
 =?utf-8?B?RGsvRGZuSlVEanl5N0tMR2I0Lyt2TU5NcXBUZkNlYW5TSHo2cXNDSVNMaUZZ?=
 =?utf-8?B?MGM0TERmSWQ5bEhxSUw4RTNKbzhZRjhYdTRib0JGMUpPaUZhYkJnSWhBWkpq?=
 =?utf-8?B?ZE40dTZJZGZmcVNDWExqaHN4Z2NBcit4UWpFdzJYSHkrSlVCRmx3NitxTHZz?=
 =?utf-8?B?ZWhQMkwzQ1NsTUVDRHhKbzFIYWVObGpXNXQxR1BuaFIvTG8vMWdkd1ZxeGZG?=
 =?utf-8?B?aklGNzN2Y3BuRERMdis5M0FPRnh3VUFqVjVQR01OUlp3dGFpYUlZeHdPV1k3?=
 =?utf-8?B?d0MwWU1LdzdsK0s2N3RrQzExak0xa3UyUC9lRGJnaVlrcWJjeHNkYXJ6M0Jp?=
 =?utf-8?B?Z2hxQVRBaWdXaHRPWDlGS25Va1haK1c1MGlhakUxUDR4bEpTeHpvay90d3Jw?=
 =?utf-8?B?OUtkUG9JYVl1dW5jNkxlaUNJZ0ZxWUtKQW5nbVZPck5LdHpRZGFQR2FIeVpN?=
 =?utf-8?B?OVJNdDRDQzJTNTdXUkpWYUJtZ1JybE15VmFxa1BCNHIybVdtNCs3ZEE2dWtW?=
 =?utf-8?B?RHlGTnBTMkZ0VGtxWURiRHdrM2JmSlBjUWpIcHp2MkJIRFdMbEFXcWNrWjNh?=
 =?utf-8?B?YnJvOUtDUkQ1V0x3b0xuYXFtTGdVZ2xOTmRUcmJtZTJBUWJsMFRNUE5JT2NV?=
 =?utf-8?B?Y2VOcFhlUUIySTRJZFBKVS9zelF3RkJtbzBhRGV2WkNDdnRuV3E3TGNkYkla?=
 =?utf-8?B?NUVaSFlMRFJCZzhKUFoxSGVMRHk1ZzMwZ3JIUFFjT3ZTWGp3aDVWR3NxRFZo?=
 =?utf-8?B?ZE0wMTYwaDdocWZVTFc4cUNEWElxbWFKbUkyWjZOUVhPYWxRRFVOR3BFbVY3?=
 =?utf-8?B?Zy9mdUs5KzUyWU50OERUKzkrZjlzUmtkYmFQaUF4TmF4N1hwbFF6amlRZUI5?=
 =?utf-8?B?M2dYbVA5YkI3NWx3czlMQXNRdS9oNnRtUVpIMnRCeEtFOTBsb0pMYlNjdmtI?=
 =?utf-8?B?am5KT0xVNmlmVG81Z2tNODFKUXlGcFY2Q29MRFJjYVpuZk9Ocnd0YjAyaVov?=
 =?utf-8?B?MU53d3JxcnNRaytFRGszS1B2MmFVU2w3NTFZbVdjb2NMRmszd2JENTcxZnlH?=
 =?utf-8?B?M1k3ZXVsZkRucDV6NDZjMHd3eHVwUC9VVTVuL2RrWHhjSEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TGlYNXVuZFdGVTd5c21XdENvaXBMK04vRmp5U2JJekNybmdnOUhJNjZXZE1q?=
 =?utf-8?B?TElGaHBXQlZvU2pRb0xaYTUyWS81bjByWjZZSzVEVEE3b2xlSlIwZkhoQW9l?=
 =?utf-8?B?cDY1UVVvSUJDZXh1NWFmTTRReDN5bm4raEoveEFhZU5ZRkFoY0dDT2VDQXFq?=
 =?utf-8?B?NzJET28wMWhyRzZJdFp5MEs3QmhDM1d6aHlxdHY4d0NpSWpudnBjc3VDUDZo?=
 =?utf-8?B?ajdXSVVKRkdQN0xUbGhPZHp2MFcveU5Uakd0TnlCM29LZEJjL1cyalJwelZQ?=
 =?utf-8?B?SEVRdm42U1NRZG1CNkdoN2pZYmNyVWxjekJIZEhSaGVvc2MrMEIwdXlhcGwr?=
 =?utf-8?B?cmdJOWVJYlF6N3BUdHA3VVRTdEFPamxFMTB4QkRaeWllT25iTWlYU3lyTzBi?=
 =?utf-8?B?bjBpR1k1cEY4QUFaeXBFdGRVbE52UWVaSFh1UVh4ZEhqUXNJN1c2UDI1MUoy?=
 =?utf-8?B?OHU4blBiSkNSTDhzWGMrVC9IeDBNK2lzNC93L1p5dWw0TUlubkROR2MrUHpO?=
 =?utf-8?B?TGQ1ZnYxU2diaCtnY1dNT1ZGQXNqSjNNdWhoaHBvakplUGFBRE1KbG5KS2Iw?=
 =?utf-8?B?VFk0aFZnNTk2YUlPd0kxUGFDblc1dS9UYWs5Qk5KdUdudXJPQjE4Y1NHWU9w?=
 =?utf-8?B?Vm1GWi9ad1p3MzR2VGdKbWhUeFpwbzU2QkdleUJrTGltWjkvcUlPcUNGcmZs?=
 =?utf-8?B?T2lydXV3RnRWSjZ6TDZjNFVweHY1aWRiTjN0N2RVakZSdzhZd3NwWkgrSHFU?=
 =?utf-8?B?RTAwVGhCUm1YcHUvNnB3UnpRQnFSSmtEMHdQWHo4M2hhelg2YzVzS013QlZm?=
 =?utf-8?B?Rlp1YXdTS3MrMWpJME1IVGY5Z0hVVVdSRGppdzdRa2NXcTQxWDhRRGpBblVR?=
 =?utf-8?B?OXgwTVdUK3A5NVlGSGFOZHlnZm0vQXpUWFkxRkc2QVE4VHJyb0ZoQkdGR2JQ?=
 =?utf-8?B?QXZxcVM2dURyOTVFNVdUQ0M3Lzc5dWlDdG9DZCtaTkhBbzhFQmhuQ1BRWWcr?=
 =?utf-8?B?L0xya1JuQURudkFZa0N6VUhSVlJRdlAwVmZZLzZ5SklxblNLMGN1VXpzUVJz?=
 =?utf-8?B?a3hRYVJqWE0vZXR5Yys5Q3FEZGIvZjkxRGRYV0xoM0ZhUThqbHVFUWJpSURS?=
 =?utf-8?B?aHI4ajlkS2RJM2VmOFM0VzFUc3c4VkNIaDg1RHFhYlhPNmpJSmhVa3dmQzNM?=
 =?utf-8?B?YUduVUhnTGpoV2NDRnFVR1pNMVRXWGRwR1hiTnVxazF5TDlrUlUrVmxhalRG?=
 =?utf-8?B?aHJZenhMWDk1NlFvcWIza0ZsaEJCdGVXaVBTSFM4SEt5dmdHdTZ4Qlg5cmtQ?=
 =?utf-8?B?RGF1bHNRM0k0dW9YSTJGaUFkRitMYkdLM3RNK1U4Q3diTko5MHV1d0ptUEtJ?=
 =?utf-8?B?ZmVNV0pGT3RDRG9LSXFYeitnNjU1ekJ4dTNWTVdMOThpVm9qOGFxWGFQdmpp?=
 =?utf-8?B?clVXY3ozcXl4SG5DMDVTS1NPZDI0YnplOXA1bElQQWZCOFBLL3BtclVCZTFI?=
 =?utf-8?B?S3BoZlppT1A5UFFNZGtwVDg5Mk5ZcjFWUFpFTVhiMWFOZWhWdlB3cUtlSUhU?=
 =?utf-8?B?M0xFa2IxVzVSelgwR3VLb3RPcFM0YVNicXlTTi9nOHFXdE4zN3J6THRJUHJm?=
 =?utf-8?B?dzY2SHN1b1p2Yjg5VFB2V2VSWVQ4QTl3RkovQzY1bmljeVVPYXFqVXRLSFUv?=
 =?utf-8?B?aWxVWjVqNlJGZ05ReTRqbm9UUVMyZ2dQa2JWbEVkckdFc1J3cnp5WG1NQUlF?=
 =?utf-8?B?SlhwUnVBaXJHQkJjY09teGxpT0Fhek1acnJlT205RUxYT2xZMkVyc3FBZitS?=
 =?utf-8?B?b2FsUjFyTjFpUkQxRDNCN1dWTU1SZEltL1BvRjU3UWEzZVU2ZWFPTXJVUDJk?=
 =?utf-8?B?cUNYdzNtWkIvNHdSRXdneGpNU1hpOEZaQVg1WDE3RFBiVU11UGRIZWlvUTRD?=
 =?utf-8?B?bnpRY0FTTi8zYVdaTlZYS0V0OHVOaUc1Y0tOWUpRRUdBTDJYN1FCcW9uMkcz?=
 =?utf-8?B?eHVpcFYvd1BZMlEyRjI5V0d5dW9TM1BWamVTNXpveDZTT3NPcUJsZDhUNk1U?=
 =?utf-8?B?NUJxUzdYUFFOYzk1U09TbERLVHhLVVZSNTlCS3hKOEs3aU4xRnVnQ0doZERz?=
 =?utf-8?B?TWhOUUZRMWxRYXVxdyttamo5a0NGd29aZE5FWGZmemNrSXdBRnQrZG1CalRG?=
 =?utf-8?B?c3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fa2ade-db62-476e-dcc9-08dcc8e9df5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 11:49:57.9799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /S3RA9LyZ/e01LN6P8c+kxIM585a5QfKnWWyto01THhUJDCui2gjwfw5mSw8rDlAl3UDCFWetMI44AC2bZ0QiXpDRMSvA5Hti7t6TDTeEbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5401

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAzMCwgMjAyNCAxMTo1MCBB
TQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvM10gbWVtb3J5OiByZW5lc2FzLXJwYy1pZjogVXNl
IEhpLVogc3RhdGUgYXMgdGhlIGRlZmF1bHQgc2V0dGluZyBmb3IgSU9WRiBwaW5zDQo+IA0KPiBP
biAzMC8wOC8yMDI0IDEyOjQ2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+IE9uIDI4
LzA4LzIwMjQgMTk6MDIsIEJpanUgRGFzIHdyb3RlOg0KPiA+PiBIaSBLcnp5c3p0b2YgS296bG93
c2tpLCBNaWNoYWVsLA0KPiA+Pg0KPiA+PiBHZW50bGUgcGluZy4gQXJlIHlvdSBoYXBweSB3aXRo
IHRoaXMgcGF0Y2g/IG9yIGRvIHlvdSBoYXZlIGRpZmZlcmVudCBvcGluaW9uPw0KPiA+Pg0KPiA+
PiBUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIFJGQyBkaXNjdXNzaW9uIFsxXQ0KPiA+Pg0KPiA+PiBb
MV0gUkZDOg0KPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvYzliMGNmZmJiMTU2NmE3
ZDM4ZjIyNTFhYzdjODg4M2FAd2FsbGUuY2MNCj4gPj4gLw0KPiA+DQo+ID4gc29ycnksIEkgZG9u
J3QgaGF2ZSB0aGlzIHBhdGNoIGluIHRoZSBpbmJveCAoYW55dGhpbmcgb2xkZXIgdGhhbiAxDQo+
ID4gbW9udGggZGlzYXBwZWFycykuIEV2ZW4gaWYgaXQgcmVhY2hlZCBtZSwgaXQgd2FzIGFuIHJl
cGx5IHRvIHVucmVsYXRlZA0KPiA+IHBhdGNoc2V0LCBzbyBpdCBjb3VsZCBoYXZlIGJlZW4gYXBw
bGllZC4gQW5kIHByb2JhYmx5IC0gZHVlIHRvIGJlaW5nDQo+IA0KPiAic28gaXQgY291bGQgaGF2
ZSBub3QgYmVlbiBhcHBsaWVkLiINCj4gDQo+ID4gaW5zaWRlIG90aGVyIHRocmVhZCAtIGdvdCBp
bW1lZGlhdGVseSBkaXNjYXJkZWQuDQo+ID4NCj4gPiBEbyBub3QgYXR0YWNoICh0aHJlYWQpIHlv
dXIgcGF0Y2hzZXRzIHRvIHNvbWUgb3RoZXIgdGhyZWFkcyAodW5yZWxhdGVkDQo+ID4gb3Igb2xk
ZXIgdmVyc2lvbnMpLiBUaGlzIGJ1cmllcyB0aGVtIGRlZXAgaW4gdGhlIG1haWxib3ggYW5kIG1p
Z2h0DQo+ID4gaW50ZXJmZXJlIHdpdGggYXBwbHlpbmcgZW50aXJlIHNldHMuDQo+ID4NCj4gPiBQ
bGVhc2UgcmVzZW5kLg0KPiANCj4gTWF5YmUgdGhlIHRocmVhZGluZyB3YXMgY29ycmVjdCwgYnV0
IEkgbWlzc2VkIGl0IGJlY2F1c2Ugb2YgbXkgRFQgZmlsdGVycy4gSSBkb24ndCBrbm93LiBTb3Jy
eSBmb3INCj4gdGhhdCwgcGxlYXNlIHJlc2VuZC4NCg0KDQpTdXJlLiBXaWxsIHJlc2VuZC4NCg0K
Q2hlZXJzLA0KQmlqdQ0K


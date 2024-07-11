Return-Path: <linux-renesas-soc+bounces-7279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1D92EB18
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 16:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA1841C214E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 14:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBB71684A8;
	Thu, 11 Jul 2024 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="COhgSA1Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010010.outbound.protection.outlook.com [52.101.229.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833F12C549;
	Thu, 11 Jul 2024 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720709886; cv=fail; b=rvxvPEOkEuZ0rWcE/rnQ00RSoQKWRY133jto3xW0rXNQWXDka6K62aNcd6JrNWQZlCDcUuA2E7FbvSqFxM0937rv1CUXnv27revBoiP6Ak4L09tt0FeFW4PXqC2B8BBnu8ezpcFbpw64oP7Z4+JsiIsY7KI89+XcPD4hxdPMF7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720709886; c=relaxed/simple;
	bh=n76kMFbfTQZkSCgMsUWXOMitvJm5m9e2fI9yA+32LV4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZBnyTwjCh3TpynyYboD2YXLhH8cKEFLWHJL/igodMQwbOvaL3JgEheTrIzr0FJTikKwHuQXA808B5pWkKh7HvY8FRJXQE9CkM0GNG3cMwKJWCpIuzei8RvCQIXgGE1uDFGJtcfOaOlewMOnHeywO6sO6LL+Um0PoMNKFwe5tCCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=COhgSA1Z; arc=fail smtp.client-ip=52.101.229.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lezxvTYWKKU+TF0l9n8XjguIuDE2I0wcYgoNcR7wc5RV8gLs3MYNlirxEh5tAzBtCx8XC8ztF+0T79I8RaBKR2pCwZ7avVI0GZryqjq8+mqhuajCcPfg99J2wxSLDuKHzmcA+xo1hnzcDkVPG36p59pxoTk9W77aAJ7/nc0fJIwjb+i4c7JiLFR95hFK9s+R4wFwOfpTbW0ECcloLIhHJ1dKOIkqpmi4wXCx3wvDW/E6QQ2vN1ymozAvsgMVX4OevRppG/C5azSR+bkoiURNvTf8dYBFicIfKff6CdV6hA6jfMChAW++dXSbRdmxWkGybhENK6o2w0Sdfg1hmEbSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n76kMFbfTQZkSCgMsUWXOMitvJm5m9e2fI9yA+32LV4=;
 b=w2PrApxXjsWvk5rW76Nv7MkiUBbs+cldWwYo+/6gJdYO85oowEqWiVzh6vA+Nr5xX0FGP4KwK6iTkzsgG39ppyEOsoAMHtq/0aVXEz4ck5AeawO8qjAbLFidPaljCE9yx4nxJFtzp1pLVk78iZVPYHJvi7/p0P+TcpOp4uYa4G0X2J4jnluVyxSOtMRX5IUy7rSawGgER7ZmGgWx9rsVGw55d6iZ+4TQlRvGpuOfO0S4tWLDAin3JwL+DvSCr5hDQzC4L+Qf1SEKwgdupW9HK304Cw33eCRMQ51o9g7H7+K1C2qvUQQrzcIWGFaQK8udg5wl2amEpqwjEODfMYJP2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n76kMFbfTQZkSCgMsUWXOMitvJm5m9e2fI9yA+32LV4=;
 b=COhgSA1ZoHrUPNo8TR/t9jFi8GfRw2FzFUhaXV0NUKTlpJUQA0L7hpwS/6O4VwMO9ClscjZ0gFEGVzPwSZufA+1PI81EDnJoYmXchAp3gcxhMzf+WxXOycn0A9cMtTicTM/+H6JAseSufbdiw+5K5xBWunojNS1hHimBTF63hlU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11095.jpnprd01.prod.outlook.com (2603:1096:400:3c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 14:57:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 14:57:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 4/6] regulator: Add Renesas RZ/G2L USB VBUS regulator
 driver
Thread-Topic: [PATCH v4 4/6] regulator: Add Renesas RZ/G2L USB VBUS regulator
 driver
Thread-Index: AQHav9uQUUPekDrm4EOwlYUI+Y4oS7HxwLcAgAACXWA=
Date: Thu, 11 Jul 2024 14:57:58 +0000
Message-ID:
 <TY3PR01MB1134692D0F5D291398FCE5F1086A52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
 <20240616105402.45211-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdX5ayWbLEEa6nAipECVB6H9eCpRg21pu3zYrTdiER0F+Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdX5ayWbLEEa6nAipECVB6H9eCpRg21pu3zYrTdiER0F+Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11095:EE_
x-ms-office365-filtering-correlation-id: dbbbcf99-9d21-4c6e-2367-08dca1b9da58
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z04wdzdGYWUrelFXcnFkOEdpMmRTeFFqb3EybmUxQWUwMkd2VDRMcWZrMWlj?=
 =?utf-8?B?NG5LM0doZ2ZEKytBZzhEdFVOTEdHVklES0xZMVZHNzFSdUZtRzNveHFhQ2hz?=
 =?utf-8?B?bmg4VVFLcmEwcmNJelZQMnFBWDQyVGJVWEx0VnFQVjE4dldsVVhiUlBGTVl3?=
 =?utf-8?B?ZXVIR1NXbFpmelptZExwcHkxa2dYV05XZVduRnBVUlVwZ1FhTUV3elBpZDkw?=
 =?utf-8?B?NVdVRmVrQVJRWVF4RkFYRitUQkVIKytnRXpRUWI2RXgwc0REeFFsemtwODVZ?=
 =?utf-8?B?cnpTTlFDUk50UmRJYmpQTDVIZHdNSVYvVVpXSkwrM3VNcEpTTytsdjdHOGtt?=
 =?utf-8?B?MFhid0tobm0ra1BkS0VpNndRTWVwMmcvSVppM29jVnl3bEJVczFQaCs5S3ll?=
 =?utf-8?B?RXVFNGdaWndLbnZtRmhKYXhjVEsyVDU0Y0lrYS80YjhTVEt2SlkwdjE4STVj?=
 =?utf-8?B?bUo2RVEzQ3RqeThYMXpJbHZqSmRsQS9EQWxDUUxGQVFFTXNJdFJGcmJhcUxx?=
 =?utf-8?B?S1VWQk12U1AzRGg0OUZiUWdGdzdHQkdibEJEZHJ6dGRSaWZCa0NKT0xRYkdB?=
 =?utf-8?B?bitYazRVUVNRS3pIcnYra3BFSjQ2RlVOREdXOXMwR1ZwRWoxSzVIcEpRckds?=
 =?utf-8?B?OHoraG94M09hT3EzbW1TZ2FLcnJlcEl4RGtzT3lsUUdSVzd0cjBVWkIvck5G?=
 =?utf-8?B?RGwySXJRYkF3bjVma2EyTi9BZWFxQTd5bXh4TlNGZ1AxQ0JleXd1NzBLcENp?=
 =?utf-8?B?L2JIamlMc05VTTFtSkhWVlJmaEgrNDFxUXlIaHpPa2QxT3NSOExydlNOQW1N?=
 =?utf-8?B?bXI2QUxodVRtc1QwOEZDQSthUEI2d3gwaXBjcTBrZkloMTh5NkhzTzlVNmRO?=
 =?utf-8?B?WkovN0JCQmRsVWdOckdKYk5adzdISEpDOUYxcnBiaFFmSFRrc3l3bi81VG94?=
 =?utf-8?B?Wm5VT3pFSFJ2QzJVUHZJZ0hKMFJtaXJsNElxa09IVFhyT0NjNkVKaDVETnRE?=
 =?utf-8?B?T29TSnlTTnVlaFpNcC9tZ0c4S1BPdHBobVJsZ3Vtekd0UDVhclRmVXI2ODZs?=
 =?utf-8?B?SHFwZXdBcm5adEJzM01nYkphbjVuRUppWnBwWW9OT1A3Vy9CbFdkclZFVzdi?=
 =?utf-8?B?eDY5STNtMkx0d0c3MFJwc1VXMjUzVUdlWFNsQUU1MjcrZE5kdXFOSkhCaHpX?=
 =?utf-8?B?emR3aGZnYUZDZlRLbUxMSmtqRjN0NjZ0MW1ldGp4MGMyQUlxYnNIRjdrcUtw?=
 =?utf-8?B?ejVsb25EYWNGaTB6cDA1Z3Vad3JVdjNYa1Y4NFA3c0ZtbWQyU3o2Y2RPbytU?=
 =?utf-8?B?UG13NUpyYjRzZXQ3UjNOVjdnZVFCL2h4cElUVktGZWN0aEd3TFQ2dmhBQWVp?=
 =?utf-8?B?RmdjVkw0SGdtRGZEZWhza3ZJM1RCRXNqOFVNNlpwY2M1UXFSSllBL2V2OHVD?=
 =?utf-8?B?czJpQVEza2pGUVJZZ25Bdk9TQzNsRVRaSE9IU2NRNW5QQ1FwWENJbXVFdG5m?=
 =?utf-8?B?VkhiSUVFK1ZoWE1WYndXeEhQeDFiaFVDaW1vVEl5Zkx2dDV1c2dEdDdZbm9q?=
 =?utf-8?B?WlA1WXR0MSt1b0dGYVRFTFE4RTB0dE16RXpXQ2JHUzYyVlo3cGc5Z2ljZjVF?=
 =?utf-8?B?YnNkSU1jVnhRNVNrZ3h5UXB5RUVLeC81RStzNUY0R1poVjVXWi9QYkgxYU9h?=
 =?utf-8?B?WXB5cmNXZzByVnJVazUrTkVpWjY3d2JXWjV1SkN4WG0wVFA4RjJQako4Uzdm?=
 =?utf-8?B?ZGp0US9tYUlvSnk5emx4dzFISS9wZzR1bm1TWUJZSFZCQXB5aEg3eGI0UkhJ?=
 =?utf-8?B?bHRqb2Z1UmxkQlR1QWhKL0taazJubVpRcjhwYzFsOXFCZmhiWE5kcENXcVpm?=
 =?utf-8?B?SVlkemp1VlAwS3RvOEpJb1ovY3FkdlNBNWRhOTZCK0RQZlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEhYN2xHNlFrOHUzS0lYdndob1Q2ak5GcmFBZ1Y1djd2RjhPMGRkWXU3NzZv?=
 =?utf-8?B?SXZqR2orekh5RklMMG5RSENBbm5TL09SRzdDN1U5bG56SG8vRHpGZ2JzUjFu?=
 =?utf-8?B?REtHcTZJZmQ2UnpwcWF0ZVVlemFja3pmZ2ROWUdnelIzZXhVL3dGZVc3YVZC?=
 =?utf-8?B?MzMvenhrRm9vbnZRcjBDWkN4L0lqa1R3aDA3bnhzZzFNYWFvSDY5N2tReExk?=
 =?utf-8?B?bHdCWE0vTysrOVNScjN3djVGQXU1V0E0K3dJN3JyejJXRktlUEJ1SU1PeHZC?=
 =?utf-8?B?dnoxa1hYRVBqVG1YeVBRS21Pb1ZJcnRVVHNjNEl1a1RLc0ZQNitLS3UvSTlS?=
 =?utf-8?B?V0kwa1U4UVMyYU5IKzhPMnpCVDNCV2xWQUtqZURJZGhSN1JmRU8wTysyQ29n?=
 =?utf-8?B?VlFOdnVNR1hKdHpPNXk2cSs2d1Y2K0lxYS8zQWFpc3BXNVNVWlhMSlliTEtp?=
 =?utf-8?B?MEVLWXBqT0JwRm1IMHBIOTVqa0RJbjZtNWdyOHh3cElvZTNucDNxaW1ZR2pQ?=
 =?utf-8?B?bFE1RzlodXFJRTQ2S0gxelA4N2hYeS9rdHZTVlR3SklHZDFjWXBpS2FtdkZI?=
 =?utf-8?B?ajVXL093R3k5b2Q5RVFKZ21CZ0RWcXdPSHdLU2xEODI1bDhxdWptUEE2dDVo?=
 =?utf-8?B?YTFTSVNNNytjK1Q4aHVZdGJBSGFRbEpoZ1J4ZXNaYlExc2dYNE52bFVMQW9G?=
 =?utf-8?B?UU0xMnZuK2toZER1VU9INlQrdnQwVWtEcTU5UW4vZDlQZmYzT0xKMVJ0ZEk1?=
 =?utf-8?B?bjhWbFVnTHo3TDVZTUdhNTJVYjEzN1B1UlR6SlF2R3NmOWpIaHlXZ3Z6QVNT?=
 =?utf-8?B?MXN4aVM2OXJyalJHcG1SWVBqNXE5eTRxUW8zVnhOWFA3QlhnMnhrVnBSZnc0?=
 =?utf-8?B?dTRwbG5vSjgrUVBmaDlaTDI4UTBqQWZHem9wWjNLUE41emFjQWZLVFArc1FO?=
 =?utf-8?B?S3JSRmp4emJYSmo5dnBCd08xU2JFdGFsU1E1UjIxQ1NUR210eTQvQ0Q4SlVo?=
 =?utf-8?B?bm5BVXRSUE5PaUZ1Zmh0ZXR3TElvWE54OEN5bVE5R3VzekNjQUErR05zWFNV?=
 =?utf-8?B?SE5sWUQxSWdGaTdPYXVJUHhWS29VK0JNVVBJSkVjNTcyUEgzZkpVQkRiQ1Uz?=
 =?utf-8?B?S09XWkJjaHhGNTVKN2dqQWtHOGtkSzdUSXhvZ3JidG9hSmtQWG9oNDF6NlFz?=
 =?utf-8?B?dmlCdW5qTnplTkZkVm5lZ1ZYNmhiS05PU3cyMzM3M3ErdzdrdVZESDBtY3lU?=
 =?utf-8?B?OU81YjU3Q21haDl1TmRja2tXeENsMTU0cDdvc3pnSHMrRVd3enkwZkFsYzRx?=
 =?utf-8?B?cWJWaVF2ZzZkUjJRYWY1YjdXZmRlWHE5MStGYzFBa2ZQbE9LQmY3MkpvYWhp?=
 =?utf-8?B?RWpVUllWVzJaOGFmbWFnL2ZBYjdkWDk0SStZYmVEYUpiQ1JlOTlzTWtsR29w?=
 =?utf-8?B?d3BhVUNPN281SHl0ZU1hVVQzT2VIZ1dVYm9mSGJaWXk0bDB0SnRiUlU5M1Zs?=
 =?utf-8?B?QS9uWlBNYkpORDdsMVVyak9lQVJqWW5hR244WFYrRG5helVNTkVScVpNS0RF?=
 =?utf-8?B?MnVHTTNxQ2xJbXBxUVZYdzJyYnk3Q0drZkloTTZBMittcTh4MGhNdHNqZnhH?=
 =?utf-8?B?MHhaSlFZYmN6UHp5TUFyUEVocDEwS0kwMWFCZ0pxbUpRSE5IWFRkWWRkU1ow?=
 =?utf-8?B?RWRCaHVrMnJLNTk3eWpvWjhieU4wNGZjcldScDJ4VUNRcVVNdHU4R1JtcUI3?=
 =?utf-8?B?TXhYZ1ZRMnFqS2cxMWxVemxzUk44eEVHTXV4T25NRHhrbWs2QnlYNXhkVU9Y?=
 =?utf-8?B?czNKL2Znc0pWZjg1VVFHSWRQTlAvYkFFZGFGNUdjZVo5L1g2MGFwQXJDNmdK?=
 =?utf-8?B?WU1mYUZzbTFHWk5DeU51REswZTdCc0ticnlLSk51TXBMRVRyQlovVld1UGxw?=
 =?utf-8?B?VlVxZkp1Z1FPWmlIOERFKzZ0Rit4QVJ2V0dSUUZPaTM2UU5pYUhPQWpOekpu?=
 =?utf-8?B?dXFLdU12cE4yeDBKVjZmTjdLOWVGUVZldmx4N3ZDU0VXb1I4UVFnOS9hTTRy?=
 =?utf-8?B?YTJaQk5YaUpib3IvZWNMb3BkRHl3N25tRDBSVmpvUnd0RE44eGRkRytSZkU0?=
 =?utf-8?Q?phtIMu4zesKzmGhClouiIDylH?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbbcf99-9d21-4c6e-2367-08dca1b9da58
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 14:57:58.3454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1PAMQQo6A+Aa+wWCK9a6jKe0mpi0nbNTEfbkWAJyZ7eY8vMW0zofIerzYDREKrdd0jX2qn0/O7pSmyulxWfKvoh+7ErluPngBQ30rToMcsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11095

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDExLCAyMDI0IDM6NDAgUE0NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NCA0LzZdIHJlZ3VsYXRvcjogQWRkIFJlbmVzYXMgUlovRzJMIFVTQiBW
QlVTIHJlZ3VsYXRvciBkcml2ZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4sIEp1biAx
NiwgMjAyNCBhdCAxMjo1NOKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4gd3JvdGU6DQo+ID4gQXMgcGVyIHRoZSBSWi9HMkwgSFcgbWFudWFsLCBWQlVTRU4gY2FuIGJl
IGNvbnRyb2xsZWQgYnkgdGhlIFZCT1VUIGJpdA0KPiA+IG9mIHRoZSBWQlVTIENvbnRyb2wgUmVn
aXN0ZXIuIFRoaXMgcmVnaXN0ZXIgaXMgbWFwcGVkIGluIHRoZSByZXNldA0KPiA+IGZyYW1ld29y
ay4gVGhlIHJlc2V0IGRyaXZlciBleHBvc2UgdGhpcyByZWdpc3RlciBhcyByZWdtYXAgYW5kDQo+
ID4gaW5zdGFudGlhdGVzIHRoaXMgZHJpdmVyLiBUaGUgY29uc3VtZXIgd2lsbCB1c2UgdGhlIHJl
Z3VsYXRvciBBUEkgdG8NCj4gPiBjb250cm9sIHRoZSBWQk9VVCBiaXQgYXMgdGhlIGNvbnRyb2wg
bmVlZCB0byBiZSBkb25lIGluIHRoZSBhdG9taWMgY29udGV4dC4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCA4NGZiZDYxOTg3NjYzMzZmDQo+
ICgicmVndWxhdG9yOiBBZGQgUmVuZXNhcyBSWi9HMkwgVVNCIFZCVVMgcmVndWxhdG9yIGRyaXZl
ciIpIGluIHJlZ3VsYXRvci9mb3ItbmV4dC4NCg0KT0suDQoNCj4gDQo+ID4gLS0tIGEvZHJpdmVy
cy9yZWd1bGF0b3IvS2NvbmZpZw0KPiA+ICsrKyBiL2RyaXZlcnMvcmVndWxhdG9yL0tjb25maWcN
Cj4gPiBAQCAtMTYzNCw2ICsxNjM0LDE1IEBAIGNvbmZpZyBSRUdVTEFUT1JfVU5JUEhJRVINCj4g
PiAgICAgICAgIGhlbHANCj4gPiAgICAgICAgICAgU3VwcG9ydCBmb3IgcmVndWxhdG9ycyBpbXBs
ZW1lbnRlZCBvbiBTb2Npb25leHQgVW5pUGhpZXIgU29Dcy4NCj4gPg0KPiA+ICtjb25maWcgUkVH
VUxBVE9SX1JaRzJMX1ZCQ1RSTA0KPiA+ICsgICAgICAgdHJpc3RhdGUgIlJlbmVzYXMgUlovRzJM
IFVTQiBWQlVTIHJlZ3VsYXRvciBkcml2ZXIiDQo+ID4gKyAgICAgICBkZXBlbmRzIG9uIEFSQ0hf
UlpHMkwgfHwgQ09NUElMRV9URVNUDQo+ID4gKyAgICAgICBkZXBlbmRzIG9uIE9GDQo+ID4gKyAg
ICAgICBzZWxlY3QgUkVHTUFQX01NSU8NCj4gPiArICAgICAgIGRlZmF1bHQgQVJDSF9SWkcyTA0K
PiANCj4gQXMgdGhlICJyemcybC11c2ItdmJ1cy1yZWd1bGF0b3IiIHBsYXRmb3JtIGRldmljZSBp
cyBvbmx5IGNyZWF0ZWQgYnkgZHJpdmVycy9yZXNldC9yZXNldC1yemcybC0NCj4gdXNicGh5LWN0
cmwuYywgcGVyaGFwcyB0aGlzIHNob3VsZCBiZSBtYWRlIHN0cmljdGVyIGJ5IHVzaW5nICJkZWZh
dWx0IFJFU0VUX1JaRzJMX1VTQlBIWV9DVFJMIj8NCg0KT0suDQo+IA0KPiBBbHRlcm5hdGl2ZWx5
LCBSRVNFVF9SWkcyTF9VU0JQSFlfQ1RSTCBjb3VsZCBzZWxlY3QgUkVTRVRfUlpHMkxfVVNCUEhZ
X0NUUkwgaWYgUkVHVUxBVE9SLiAgQ2FuDQo+IFJFU0VUX1JaRzJMX1VTQlBIWV9DVFJMIHdvcmsg
d2l0aG91dCBSRUdVTEFUT1JfUlpHMkxfVkJDVFJMPyAgSWYgbm90LCBSRVNFVF9SWkcyTF9VU0JQ
SFlfQ1RSTCBzaG91bGQNCj4gZGVwZW5kIG9uIFJFR1VMQVRPUiwgdG9vLg0KDQpZZXMsIGZyb20g
ZnVuY3Rpb25hbGl0eSBwb2ludCBpdCB3b3JrcyBmb3IgYm90aCBob3N0IGFuZCBkZXZpY2UgbW9k
ZSB3aXRob3V0IFJFR1VMQVRPUl9SWkcyTF9WQkNUUkwuDQpGcm9tIHNwZWNpZmljYXRpb24gcG9p
bnQsIHNvbWUgY3VzdG9tZXJzIHJlcG9ydGVkIG9uIGRldmljZSBtb2RlLCBWQlVTIGlzIHNob3dp
bmcgNVYuDQpTbywgYnkgYWRkaW5nIHZidXMgcmVndWxhdG9yLCBJIGFtIGNvbnRyb2xsaW5nIHRo
aXMgdm9sdGFnZSBhbmQgZm9yY2luZyB0byAwIGZvciBkZXZpY2UgbW9kZQ0KYW5kIDVWIGZvciBo
b3N0IG1vZGUuDQoNClBsZWFzZSBzaGFyZSB5b3VyIGlucHV0IGhvdyB0byBwcm9jZWVkLg0KDQpD
aGVlcnMsDQpCaWp1DQoNCg0K


Return-Path: <linux-renesas-soc+bounces-13209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C01BDA38145
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 12:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E39A3AD3B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165DC218838;
	Mon, 17 Feb 2025 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cl8fy3nj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39408BE8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Feb 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739790164; cv=fail; b=QfqYXaCcjgpgJBJE+e5qwB+qddxxZhzYa5nJ8Y2Vh911fV4/mFA/NQDFN5DscpfChcMmZzIy5WEwP0/bKQiKPMm+mGrBMBhW1HddlMSRVmVfVLGVCTV5+B0M7yuymCjI6lVyrbUJCCZ/tO+yZPaxXzsSI5j//UMpLLx3+ygasbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739790164; c=relaxed/simple;
	bh=v4iZt3JGA9XraA3fPUkZiSzWI5aVevte0NRgFZJ5O4g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=apoPEq4oBQE1rh8H2hEdvLKfRCZTMiPOOFA0kpxUwGfyTejHYnMnqqO7wKp4ocSBq7uR7HDuxWv/vQiUnz5B3Sotyh9UMT9/Y6y2nzYSJZpvCjw/OdxJPPwVGxvJj8vRrxmtHG1BcCFIqc4OZ1xlA9BPZ+c9XqjNvcdzqr1pmKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cl8fy3nj; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+HaZ3bVm+s5AeAjz6GdDOCy4ab4eV++0DGonyM6s+xfjDOIWJQnBXTc8dksurojpwppxoxwftQ9f0icpBLXROJ0wy6gkUr3Aj6DvMTyKhVnOxC+GRByULTRmTNR55jVh3RJCV7qnQp6jDitIpAha0j1WXwH+8hZXV5o2EG8XMiDZ8WQzpo7Ukcne5Vmho5K0dU6ATzvKFACeQOT5ri+kvlRLfyxQ6GIa5cJ7+Iju3RoysO0fGZ6rm/TT0/5DfjFAzroKMpC0hZp/sXbn7AEhP2xCFom3E6CciHHyX4BvGlx0QuptjyvluEwbGlaDLoBLW56xDvHUHs1sknvCti3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4iZt3JGA9XraA3fPUkZiSzWI5aVevte0NRgFZJ5O4g=;
 b=xNiBsReocvVi5tKH3x1FsKg7v3EEg/vXC8d8qtzM6dny6x+4JQD/jKawg++Ffq2IN8YU9C3m1yOg/CeF4Z63nyrMiMSa9P0PNepIdx0OCsMYQjvR20Y+AwsgcgKpILXKfgZ4YlDyru+4cChhF/ETcmY3slFcKS7iRJuvjMSK7mb13vBH6tt8MDVGfBWLETmxDcSsdvrzMu4ceI/8AQwXZ3yJrvKxGm3TemlH2DxezDC91AR9aMBTQHh10x8/p9Ywvlf0nngGviTDLoPi+zbuwQ6OiK04kUkBpUF1aenjEDL5L/pYYsqa0azotQAbx213Q+eOIvTjw6qDFilGRObv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4iZt3JGA9XraA3fPUkZiSzWI5aVevte0NRgFZJ5O4g=;
 b=cl8fy3njCPXJBLE9locFrqg9KoL3+gs2xGTTUvcDXxF1OHh8nImJNdvKkVlyZlYy59cuERC54f8YvM0nC15nlxiTqJ3aTbqVndFXDwUJ5Mt27X1JRz8MOfjOI5bNTtuyNw58M8OL2Z5KXYbRmAMpQ6jC5DNhUscVcblNkdy8vFE=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB10660.jpnprd01.prod.outlook.com (2603:1096:400:2a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 11:02:38 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 11:02:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Topic: [PATCH v5 10/12] irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
Thread-Index: AQHbfT8Y3I1B7eINBUqE9x3mj8SpN7NLQhkwgAAV+wCAAALH4A==
Date: Mon, 17 Feb 2025 11:02:38 +0000
Message-ID:
 <TYCPR01MB1133241DF620FA6D88965C76E86FB2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
 <20250212111231.143277-11-biju.das.jz@bp.renesas.com>
 <TY3PR01MB11346A06D40667624E88E4E1E86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVfORkBnP-Ygz8WFv-bpXv4mFHw33Z97AiOBRV0G8sv5A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVfORkBnP-Ygz8WFv-bpXv4mFHw33Z97AiOBRV0G8sv5A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB10660:EE_
x-ms-office365-filtering-correlation-id: b27c6acf-78c0-432a-a777-08dd4f429777
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZGFZMVRWdER6N3ZNVUZPT3Eyc0RiWVVjaUpnWk4xZnhIRDZGSkxOcmFON1FC?=
 =?utf-8?B?RTkzNzlwQnJZdldhd2RtakdrSERQMkNBOHRJMG1VRTFjWTVDZ1h4VmE0TVEx?=
 =?utf-8?B?cC9zYmhYL20xRW9uZmJ1M3pkRXd0bnU4ZDJWTkZ1TklPSjhpeUZNbGlncWtx?=
 =?utf-8?B?MENmZGNvd2NhUEd3STA1MmlDc1FQdEtaeng5dGt5YVNWMXN2V3Q0N1VvY1NB?=
 =?utf-8?B?TlpWOEVyVG1LdXdtZW9VejMxU0xEaGVJWHpkWWJwMTNobk9HMTRsVXJCWFRh?=
 =?utf-8?B?NHNQOURQWjIwTGJRbWxHUmE0emU5ZzZ3VENLM2VYSkNoYWNnd0NRN21jelpI?=
 =?utf-8?B?N1VsUjhmWnBTcHJuWFNyUWlQbUVaaU9qUDlKYy80TEN1bTNPMlM5RW5uZnlL?=
 =?utf-8?B?b1BFUDI3NnVyUnQ5V3pwcXlyeFZmenpJcEpva280Q2daQ1A1MEdId1Y1bnFa?=
 =?utf-8?B?RHdNenZJNUZNT29EemtNTjNtVVljSUoveHY3cWUvVzQvYVhDRmY4Zmt0aTQ2?=
 =?utf-8?B?L1V6NHZZZXVsV3Z1OXpWek5tUnRRVm1TZ0lXV0xGN0l1eHlaMzNlWU5pZnhS?=
 =?utf-8?B?QlhMME5kZmpIeWhKZjNVcy9WckU3TkluKzM0UGdkQU9HWEJxaHZFNHB3SW1J?=
 =?utf-8?B?MlViK1ZUNzVwUUVWellJbDRUN3VDWWNzK2Jvc1JxZnhaclkwN3hFMGFhNmpU?=
 =?utf-8?B?ZHhhaFgxQk03eFlvcURuTFM1MUI1K2JTVHp4VVZ6OS9LcERxTEhYWHF1MkR5?=
 =?utf-8?B?a3kvZVp4VXRTMGZ0a3hsNWcxZXI1U2s0YXl1eFRISUtGN0FaSFRaeFhXTUhw?=
 =?utf-8?B?S1VmRHpBdVFBaHhSbkpORGtRUnlzaHZiVnp1czRma2lPd0FMK25XSGFTcFpl?=
 =?utf-8?B?elhLa0w2djg0eGl5YXRlcDZsbGs5cGY5MU8vandoMmJCSDhaajlmanNEYWR5?=
 =?utf-8?B?akZJWGFMcnpxV2VOZlFmNDBJcEpENkhxQmhNby9LTUtHZXZuYVE1MDhvZ05j?=
 =?utf-8?B?Mno0Tk9HQjRZZ052TWVqcnpGZnlOZDk5MDJqeFVydkNNU0VOemZVdC9MbWN4?=
 =?utf-8?B?WHhOZjUyc0V2czYyVTFNRW92ZkpGMTVoZ3NuSWUyb0FBbmk1MU9TZVVtbVk2?=
 =?utf-8?B?RFd6RS9IYjBIR2tsamRNZk53Ykw4UmlYb2JER0xuY1kvWGUvRnh1Um56V0tR?=
 =?utf-8?B?ampUcmVjKy9rME81cWl1UlhSSFdkeS91NEY4dnFVSUIxa21kemJaQzljdmF4?=
 =?utf-8?B?MjhJU08ydmRZRW5WTmpKNVFzNmlLVFVFT3p6VUdaNCszVFlGbWRBTDhoMWpk?=
 =?utf-8?B?UkdJWk5nUHhiYStZekFmY2ZrQnpLcEo5MnhqRmRTSkw3MnIrZGlMbjVtSEVm?=
 =?utf-8?B?cVV0NjQ0emQyUy83eW1yenBtaDhlSi9sTFVtaXZqcHdYNVZIM0dwRW9aUEQr?=
 =?utf-8?B?TzlhUDh6RUQzRXpMcDdtZlFGUm10Mk5pU0dBb24wWHdMMEdVRnR4K2tmUDJ0?=
 =?utf-8?B?UTlIbE4wQkF4bC9TcTIzR0ZGY1NObk1jTzB5bzhkU3VGbG5qcWFBc2xWNmhG?=
 =?utf-8?B?bTcrSzY1WXBxVUxUL3g3VUVtbjFpbmZORVp6SEErc2tiQ2VKb1NVUnZ3YVBH?=
 =?utf-8?B?eTFaQVRqSjR3S2dsbEp2Zk5WdGhsMTFDSkpLcFhZQjQwYjhUZ0FBWU5WM2dM?=
 =?utf-8?B?VXU3VE16VEZUOWVuSHlQUmpDVTB6UitDTUwrNUhxQVF4SEIrd3YxcW5VMExK?=
 =?utf-8?B?dk5PUU91aGFPcTNTMEFrTlpCWlJJM1hWMjVmazBnRmdIakNHVWhFK3hmejB2?=
 =?utf-8?B?bWlpZVphcW5jWEZhNk40QjFtNzNxU2N0bHltVFZsdjdDNEFHRUJjYnNRZzZp?=
 =?utf-8?B?U2kybmRGdGoyTzVtajdmbHJyWjk4bHJKTUkxWkYyb3lyak1DSjQxVDhKRDhr?=
 =?utf-8?Q?UYTbdP2FvLlp3t8CL27saCOv4lM13zrR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yk11dHRNR1JBVy9UeFFiK2ZnVEtpbWR6MUtlSFQrbWNNZ1FXRk9uNTNHdzBj?=
 =?utf-8?B?YjdtL0hqNDFCNHBkaXhhakIrMFpOaVBHa2YwMWtOdHdiRk1aa1FrL2VvMEVC?=
 =?utf-8?B?WmFTa0RHVEhBT3dOY1RHVmVqNWluWFdBcDAwVy83OGdiOVVSL1lNZXFDZ0Jt?=
 =?utf-8?B?aE5JYVI0TVZnek54UG1SaEZ2L0FmYXd3MFF0VWVTSHRlZ1h5SldRSDFhSjVV?=
 =?utf-8?B?ckR1dGFSa2xXeG5za05DRHhPRHNraS90a0F6R2YweWtZQ1RlT2Zja1RPeEg0?=
 =?utf-8?B?dmZTRkNmMmxnMk10UzVHYkJmaTNNMkdCc0d0RDZrZnFkUVl0RlJSU2wxWk5M?=
 =?utf-8?B?RG54cjhETTIzOW9sSTA2T3FMWUxHSU83MzBXMnJuelFFSGlwUWxzczJOc3U2?=
 =?utf-8?B?V2VsU2R2NzhpVzZZdHIxWlBqbDU5ejlMb2VyWlU1NWtLeVpZaWV4bFlSaCtP?=
 =?utf-8?B?bnF2eE5CelZWSmQ2U09wTzN3anM0WFRqUURZd0QzVnI2ZExvQlg3ZXU0VDQx?=
 =?utf-8?B?OGI2Wi9QbE96ZTZvRWNycnpsMFlBbGNqQnBhQVJtUWJpcmxGcDdBcXd4T2U1?=
 =?utf-8?B?dC9zMUxZUEdMU1lpRDVFTnh0SS9GTGtxelQ4TkJLdTU3aFdZZ3Nic0dQZHlt?=
 =?utf-8?B?Rlg1ZjNYM2Y1czhWbHZEVDA4WSs3cWRicFBlelpxd3lrWWRvSEUreTRSclYy?=
 =?utf-8?B?L0RwWG1TTDhUcHptdTZFQ1p5eHJ1NzQrd1J0Ympxb1dZZmVGbTczWTdBS0Yz?=
 =?utf-8?B?MHlEM3N5WklVTHJpRUJ3TGRQU0hSWWFYLzJuRWpMaEFKMlpBNGNGeVNpT3JV?=
 =?utf-8?B?MEo4ci95WkZXT2tvYzFZQ3dyQWFTSkh1Q05kNnRIb0JvRXFocGo3RlBWYXdl?=
 =?utf-8?B?eFdmcTBubk93VThLWU1XMEczSGVvUzlWWjVzd2p0K3dqdERGclgxMjE1azRm?=
 =?utf-8?B?N2tLQVBra1EzZkQ0Vll5dXJMTjZBNnJxS3lyb2hEd2k0MFEwSE5pbm1hS0lE?=
 =?utf-8?B?UHVGKzBIUHpGbTRKZjVhUjNXSHVVNkpZdnM3VTIzbUhJT2xNVnQ1Nng1dHlY?=
 =?utf-8?B?aTljejNoZXIrTmN4bWlxcFJueWR4dGQyS1ZOeCtxZGxHTytobmZEYlZiSkls?=
 =?utf-8?B?VGxaR3dzU3lObGk0S0FidC9QUlNiU0t1NnV1cU14OFUwekFvM0lSa0luMVpz?=
 =?utf-8?B?cnNMU2FzOXZTWTRtSDZaNXFVR0MzeHV1NHg0aGtXcDBWM2xmVkVka1pxK3VK?=
 =?utf-8?B?YTBSOXcvV1pHM3NiTFVBTWh3Zzh2bko4SFBoa3BrWTNKdXpua0pKRGZDL3Qy?=
 =?utf-8?B?VUVyTnF5ZE11UEs1Y2JpbXg4VXl1NlJWVzJrcVlrNFBaZVgwZDVjQzlNZjBO?=
 =?utf-8?B?dkZvYXJHSEh1U1JVZ0ZNV3RDV1dUOC9oNElRaEs2M25VdGdpdmNQTkxQck41?=
 =?utf-8?B?TURhMlYwbXQ1NnE0SXVLamt0VlcwdFFFV3JFV3hYeHp2c2Z5S1VZdmRkaEZy?=
 =?utf-8?B?Y3lvMmJSUUtRMWRUTDg1S1p5bmRPUUFvUVJmVXRwc0V1SGFWRVlsRS9ZOXRx?=
 =?utf-8?B?WEVWVW5uaURlZWxTSTFySFRJeWhOMndqSGdIKzFIeEVXWWRYZkRqQXlRbVFT?=
 =?utf-8?B?Tks2emcyRzZReFVFNExWeFVPaWxtRmNCRTFSejhuRElDK1dScHc1L1FmektH?=
 =?utf-8?B?Y3VZayt2WkQxQTFHdHNlZXM3MXNSS3BXTVN1bmlVYnRBdjNlN3pkQVRMR3BD?=
 =?utf-8?B?T2tackU2ZDJzbkwwYWU4OXp3SVljajN3eVM1dVlxbXo1cVFnaGFqb2h4VUlL?=
 =?utf-8?B?dTFvOVMwL0FjSTBhemJhV1BWTFpJTlVBUFNsMUNRYnZkUUhoNkNXS0pzekVI?=
 =?utf-8?B?QmRha2pxTnhVUVB0Sk5weUIwRko1cmNjbWJTM1A0dHE2N1E0T2VEQmNDdUpU?=
 =?utf-8?B?VktZZ2FxWEZBanlSVnZZc0REUUZnMFpQNWJrNnFzZ3JWVG9Vblkyb0tHWCtq?=
 =?utf-8?B?TFV3OVRuWGJvS1c5elZFZVdHQ0U4QlRYYjVKeWpwbG4vd0M3WUx5TjZ0UEsw?=
 =?utf-8?B?ZStXVVVzZFpIQVB0cW9qaGlXaTNtY2tGakVUMytFOVRrM2V6d0xad1k4cnZZ?=
 =?utf-8?B?RWVQSHA0NHQ4SUowSnQ1cVVyVm1pd3A4ME1HZnBzeUt1YjNodVhKazNCZXhy?=
 =?utf-8?B?REE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27c6acf-78c0-432a-a777-08dd4f429777
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 11:02:38.3543
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w4AJulPs/XrmIu6KTWFCXN0NSzhqF6el3MohiVysNN/S9OnOxHdjm52ULV75PFA1nuBFdvj+6qBBTqv5MXy/FRLYcY/UCXy76W7OuQztXyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10660

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjUgMTA6NDcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NSAxMC8xMl0gaXJxY2hpcC9yZW5lc2FzLXJ6djJoOiBEcm9wIFRTU1JfVElFTiBtYWNy
bw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgMTcgRmViIDIwMjUgYXQgMTA6MzYsIEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+IA0KPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IFNlbnQ6IDEyIEZlYnJ1YXJ5IDIwMjUgMTE6MTINCj4g
PiA+IFN1YmplY3Q6IFtQQVRDSCB2NSAxMC8xMl0gaXJxY2hpcC9yZW5lc2FzLXJ6djJoOiBEcm9w
IFRTU1JfVElFTg0KPiA+ID4gbWFjcm8NCj4gPiA+DQo+ID4gPiBPbiBSWi9HM0UsIFRJRU4gYml0
IHBvc2l0aW9uIGlzIGF0IDE1IGNvbXBhcmVkIHRvIDcgb24gUlovVjJILiBUaGUNCj4gPiA+IG1h
Y3JvDQo+ID4gPiBJQ1VfVFNTUl9USUVOKG4pIGNhbiBiZSByZXBsYWNlZCB3aXRoIHRoZSBpbmxp
bmUgbG9naWMNCj4gPiA+IEJJVChmaWVsZF93aWR0aCAtIDEpIDw8IChuICogZmllbGR3aWR0aCkg
Zm9yIHN1cHBvcnRpbmcgYm90aCBTb0NzLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gdjQt
PnY1Og0KPiA+ID4gICogU2hvcnRlbmVkIHRzc3IgY2FsY3VsYXRpb24gaW4gcnp2MmhfdGludF9p
cnFfZW5kaXNhYmxlKCkuDQo+ID4gPiAgKiBBZGRlZCB0c3NyX3NoaWZ0X2ZhY3RvciB2YXJpYWJs
ZSBmb3Igb3B0aW1pemluZyB0aGUgY2FsY3VsYXRpb24NCj4gPiA+ICAgIGluIHJ6djJoX3RpbnRf
c2V0X3R5cGUoKSBhcyB0aGUgbmV4dCBwYXRjaCB1c2VzIHRoZSBzYW1lIGZhY3Rvci4NCj4gPiA+
IHY0Og0KPiA+ID4gICogTmV3IHBhdGNoDQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL2lycWNo
aXAvaXJxLXJlbmVzYXMtcnp2MmguYyB8IDkgKysrKystLS0tDQo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiA+IGIvZHJpdmVy
cy9pcnFjaGlwL2lycS1yZW5lc2FzLXJ6djJoLmMNCj4gPiA+IGluZGV4IDk4YTZhN2NkMzYxMS4u
MzYzNTU5N2FlNGMxIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yZW5l
c2FzLXJ6djJoLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yenYy
aC5jDQo+ID4gPiBAQCAtNjYsNyArNjYsNiBAQA0KPiA+ID4NCj4gPiA+ICAjZGVmaW5lIElDVV9U
U1NSX1RTU0VMX1BSRVAodHNzZWwsIG4pICAgICAgICAgICAgICAgICgodHNzZWwpIDw8ICgobikg
KiA4KSkNCj4gPiA+ICAjZGVmaW5lIElDVV9UU1NSX1RTU0VMX01BU0sobikgICAgICAgICAgICAg
ICAgICAgICAgIElDVV9UU1NSX1RTU0VMX1BSRVAoMHg3RiwgbikNCj4gPiA+IC0jZGVmaW5lIElD
VV9UU1NSX1RJRU4obikgICAgICAgICAgICAgICAgICAgICAoQklUKDcpIDw8ICgobikgKiA4KSkN
Cj4gPg0KPiA+DQo+ID4gUGxlYXNlIGxldCBtZSBrbm93LCBpbnN0ZWFkIEkgc2hvdWxkIHJldGFp
biB0aGlzIG1hY3JvIHdpdGhbMV0gYW5kIHNlZSBjaGFuZ2VzIGJlbG93IGlubGluZWQ/Pw0KPiAN
Cj4gV2hhdCBkb2VzIFsxXSByZWZlciB0bz8NCg0KT29wcyBbMV0gcmVmZXJzIHRvDQoNClsxXQ0K
DQojZGVmaW5lIElDVV9UU1NSX1RJRU4obWFzaywgbiwgc2hpZnQpICgobWFzaykgPDwgKChuKSAq
IChzaGlmdCkpKQ0KDQoNCj4gDQo+ID4gI2RlZmluZSBJQ1VfVFNTUl9USUVOKG1hc2ssIG4sIHNo
aWZ0KSAoKG1hc2spIDw8ICgobikgKiAoc2hpZnQpKSkNCj4gDQo+IElzbid0ICJtYXNrIiBhbHdh
eXMgIkJJVChzaGlmdCAtMSkiPw0KDQpUaGF0IGlzIGNvcnJlY3QuDQoNCj4gDQo+ICJzaGlmdCIg
aXMgbm90IHRoZSBzaGlmdCB2YWx1ZSAodGhhdCBpcyAibiAqIHNoaWZ0IiksIGJ1dCB0aGUgZmll
bGQgd2lkdGguDQoNCk9rLCBHb29kIHBvaW50LCBub3cgaXQgY2FuIGJlIHNob3J0ZW5lZCBhcyAN
CiANCiNkZWZpbmUgSUNVX1RTU1JfVElFTihmaWVsZF93aWR0aCwgbikgKEJJVCgoZmllbGRfd2lk
dGgpIC0gMSkgPDwgKChuKSAqIChmaWVsZF93aWR0aCkgLSAxKSkNCg0KDQo+IA0KPiA+ID4gICNk
ZWZpbmUgSUNVX1RJVFNSX0sodGludF9ucikgICAgICAgICAgICAgICAgICgodGludF9ucikgLyAx
NikNCj4gPiA+ICAjZGVmaW5lIElDVV9USVRTUl9USVRTRUxfTih0aW50X25yKSAgICAgICAgICAo
KHRpbnRfbnIpICUgMTYpDQo+ID4gPiBAQCAtMTUzLDkgKzE1Miw5IEBAIHN0YXRpYyB2b2lkIHJ6
djJoX3RpbnRfaXJxX2VuZGlzYWJsZShzdHJ1Y3QgaXJxX2RhdGEgKmQsIGJvb2wgZW5hYmxlKQ0K
PiA+ID4gICAgICAgZ3VhcmQocmF3X3NwaW5sb2NrKSgmcHJpdi0+bG9jayk7DQo+ID4gPiAgICAg
ICB0c3NyID0gcmVhZGxfcmVsYXhlZChwcml2LT5iYXNlICsgcHJpdi0+aW5mby0+dF9vZmZzICsg
SUNVX1RTU1IoaykpOw0KPiA+ID4gICAgICAgaWYgKGVuYWJsZSkNCj4gPiA+IC0gICAgICAgICAg
ICAgdHNzciB8PSBJQ1VfVFNTUl9USUVOKHRzc2VsX24pOw0KPiA+ID4gKyAgICAgICAgICAgICB0
c3NyIHw9IEJJVCgodHNzZWxfbiArIDEpICogcHJpdi0+aW5mby0+ZmllbGRfd2lkdGggLQ0KPiA+
ID4gKyAxKTsNCj4gPiAgICAgICAgICAgICAgICAgdHNzciB8PSBJQ1VfVFNTUl9USUVOKHByaXYt
PmluZm8tPmZpZWxkX3dpZHRoIC0gMSwNCj4gPiB0c3NlbF9uLCBwcml2LT5pbmZvLT5maWVsZF93
aWR0aCk7DQo+IA0KPiBNaXNzaW5nIEJJVCgpPw0KDQpPSywgbm93IGNvcnJlY3RlZCBhcyANCg0K
SUNVX1RTU1JfVElFTihwcml2LT5pbmZvLT5maWVsZF93aWR0aCwgdHNzZWxfbik7DQoNCkNoZWVy
cywNCkJpanUNCg==


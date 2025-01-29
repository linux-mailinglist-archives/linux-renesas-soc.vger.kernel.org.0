Return-Path: <linux-renesas-soc+bounces-12700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B975FA2208A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 155053A5C01
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 15:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8171A1DD0C7;
	Wed, 29 Jan 2025 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Y/hGu+Fp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754FA1DE2B6;
	Wed, 29 Jan 2025 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165081; cv=fail; b=Xy+3NuoG112aiGpB1uCYKEg8qcq6BkmZ62YWErZJo7erKf9XPALB3+5CyTQFbFYDBXihYDyOpHAJO1uAMnH+1hy5ieNCoV7sIMN+MfmE/izFNgvJc8cUgcJvO4Vwvp1+uLpzga1BOWp7ZTHqXB5UZCvh0RxEwc6djTxlp+odIHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165081; c=relaxed/simple;
	bh=MAODDnUfoXiFVkcvWBieuhBLjwQnXIwndTeMwb/XuGc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SbZHfJeWr037tRN6Dsr2pNdZmSc8GJseeH9Hu7YaxLdeKvzxgvUD8LrWwwP+VNP57FMNwmtZkwxb9bHIZ5/yDitVBxqfaII78PMxTOE3XAleL5RPcWEngIcaKZkLuQdnqiVITZwlGeihSSi9S3aieg2+C/1sSGcUcR5pSR6zieg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Y/hGu+Fp; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntYDi+YmZT1YmIYPCh8msb9Tz85G1Nh5B5x1wD5vaPPYr4+mNjsU/Tb3Xf3KffdrGU0S9JslTGCZElLYfI48DFf/1/oQJlMG0nEIVbMAdRJy5nCmOrTUc8H2TCXgiXiljrY/ZXqegcsH4n05HEL0Cu1XzI45tNdhotxxDMwUeRQFBi8fTAYzUuCwjX49iFxz6Kh5qSi7oljgMOsaEtJsD5tZQyNbLFWhTPjixTXqQkqwxmgWadXZfs1JX1MJr1V/FNTuUnhsAwwMc+B4NVSfiEvrRX+S616ZhS18rJlzxRzz7P8BbC8H1qAhCXyoAqOOY03xphaml4uCVWW2c/9MKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAODDnUfoXiFVkcvWBieuhBLjwQnXIwndTeMwb/XuGc=;
 b=RRnIXI4CUi2HEBGnHPZKXyqdawQe1aBcGFrPupcRpceY7yOP/+PUwcxfTzLoyBb7CoKu/h8J4h0UQ+kPOuup6P4wqN3CBHw62tzoGaaIbrCH2msZeNasDVRr+P9QdAuHcxwH8nHw2NKg6h18KaI12oWw+wCEY1hFrksI44gmlTiLc1dJKIO3rhzxOPlrxcIAEVGa5QWvUZfTtiEujmiM/bXW5ORSjFT1mcO7Ba6UsrGXNPoL3Hvz4kWUfsNbvLYUL851Kz+z8EKwIO1tmjv8KjsD+zeZn+uJ4a7/flNL43bzhVI0yNCjuq2RLQyljyRbKdMptdBmr1JEGKiiv69jdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAODDnUfoXiFVkcvWBieuhBLjwQnXIwndTeMwb/XuGc=;
 b=Y/hGu+FpuXnVejdi98LR4qSURePLqbMdhOPCcBTE4DpTHwzI8yzov+T9G80HVmi7+Db6nHmr6NZzzw/GOp2eO2cpR3MpCE56BEdoQqfXlaQtX6YdSF9XCZ4nL7TCdvuAlF1W+PqBoqGeE1WcWNSgUV3BpjKQQqXShwnnuzY0y9I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9938.jpnprd01.prod.outlook.com (2603:1096:400:232::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 15:37:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 15:37:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
Thread-Topic: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2
 nodes
Thread-Index: AQHbb/jAShwKhSxihEelcI6XMh61NbMsENmAgAAAeBCAAB71AIABtisA
Date: Wed, 29 Jan 2025 15:37:54 +0000
Message-ID:
 <TY3PR01MB11346CBE984619BAF31B530F886EE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdX+S7t+Z0ZbT7zTgmPFqHnSZWAYcZ4cJzzE3u+j2-9ZAA@mail.gmail.com>
 <TY3PR01MB11346016CB4B1414521B66F1F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUsb_NdEAjD9r+BgPxG5vRhJUVK3AbWQNmgmfj_3pj6hQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUsb_NdEAjD9r+BgPxG5vRhJUVK3AbWQNmgmfj_3pj6hQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9938:EE_
x-ms-office365-filtering-correlation-id: 5cdff8a0-4216-462f-5c88-08dd407ae5e9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NUlYQXJSejhzNWNUWDhPN2sweHVIdEE2b01rankzU0h4RjViRlFHSGZLRXhP?=
 =?utf-8?B?dVNhNGsyNDBVYk5NR2tyS0RQLzY2R0NEQURYQUY1eVFuNTdYeExlbUpVTjAw?=
 =?utf-8?B?TkVYd1VkQlprNzZCVCtUVVhrbzVuOFJXZ1RzVWRDK2FxNmpkUTJkSGZTMXg5?=
 =?utf-8?B?S2d6dTFUN3QzSFBsQVI1azI1YUpHZzhhak5QQmNKRExHelg1clpSaFdyZWV0?=
 =?utf-8?B?K055TGNIa2tLaC84WnZZZzB4ZVp3TGpKaGN5OUVNY2kra2FiTVFSMWQ5SzZt?=
 =?utf-8?B?NlhsRzR2aGlndi9wU2EzR3gyQUFqVHcyZUY2MEVlNm03ejBnK1I5STVRcUth?=
 =?utf-8?B?WjNNZkJWRmdGdW5qSlloSThGcHIvcWw3dHNUaVNQUnRNRjlXbTREWTBrRWxI?=
 =?utf-8?B?YUkrSGgrZWRZalAxejNFbUpodG5ncnRLbFNiZFlsdHpoZ1VnMlNDR2YzQ3d1?=
 =?utf-8?B?akNtNE9NaHZKZ3BPSkdyL2pRMlMzRUhTSnMwZzFYNDE2MU5KZWQvK0lFVG50?=
 =?utf-8?B?MGk3emlsZmxKWWdkY1F4N1VCRnFXRFNvNFdDS3B2UXM1Znc2SEtLMnQ1TkxK?=
 =?utf-8?B?RldLMWdVeGQwZVFVV1JuR0tWVjZQbU1XTjRhNExZVkp2MEVQaUVzVCtROGhY?=
 =?utf-8?B?VWd3OWw2TUorekxiTVlZZHRENElSUmhucnpEQVNoclJwdlVhTG9FbmtvU0Zl?=
 =?utf-8?B?NTRoR3NBZmljaGpRMXRkeTNNeURKZHQyVjdIdmFlVUJGMmpvOVk2OUlrSnQv?=
 =?utf-8?B?KytSVmtBMzl6dUY2ZzNTcGtZQS9WN05ueVBhclE5V20zbEJCMnRjM0g1ei9o?=
 =?utf-8?B?cUN6Y3M2Rnh3MnZLZE5uRjhxTC9oTnRwRGM3dCtaeno0Z25VRmsxRnRvOTJw?=
 =?utf-8?B?Mys5ZGNoQUg5NUlOcWo1WHlvQ3lvajJGeGdwbVhsVmlFZis1MXIwaXRBMEFM?=
 =?utf-8?B?bXh5L0YyTnVNN1lrSG9pNGxXYnJtUlk4QmRaSlFyaU9LU1dtYXBGVE1xVDgr?=
 =?utf-8?B?RDNndDFMQjR1cDJtdFdPUU1CVVh5WkZiZmtiMjdINzNpN1JudzlTMDI3MEZK?=
 =?utf-8?B?R2tQbGlrRzhYU01hYVFNQmRyWXN2UzFZaGY0TGtITWlIQ01wUTNWaVpkclBU?=
 =?utf-8?B?YUo5MGlwY0ZRcFhJWFZObysrLzNOVDU3TXg5WXlnaHRFdzcreGJINnMvR2tD?=
 =?utf-8?B?c0JodXN1clNPWmd3OUVEc0NjbjJVblo4VFV2R1JGTHVaTmora3FtWndkYUp2?=
 =?utf-8?B?QWlLSGh2cENtY0oydVg2MEpYSGNhMVFCT25FSXFqY0ZHZjJpQlNrNmFwdEVt?=
 =?utf-8?B?Nm96Uy9wRUdleG9TWlZvS2o3V2N1Zkw1eWlVSlg4bS9ldmpkRnRZenR0c2lM?=
 =?utf-8?B?ZVdzVFh5MitFbEVNTDBXclZtb1Rlby9vTVkrd2ErSDNkL1FWaVgyTnpwT0V6?=
 =?utf-8?B?MVBpZHZLaG1LQUhJNUFLcmV5di9RdUxWNWpkTVVONFB0ZXpWQ3pvcjJvYUk0?=
 =?utf-8?B?ODZEYUZaRUYzNlRveFZKT3hLRkIyWE5xZEdXYVhLTWpHMFBnVU1DUkhDaDh0?=
 =?utf-8?B?WnFCa1hndDdSeG90TlBlY0tXZEkrRVl6ZjhyQjBNTUdyaFVDekRVL3ZCUHU3?=
 =?utf-8?B?MXNHd0x2WHF4M2IrKzl6STl0Z3ZHQ0JhTUVvcjVHclVNNHdWTGNsbFB3ZEY4?=
 =?utf-8?B?OTd2OGpDNlR2L1JZUlJQL0FBMzZEL2V6VDJTWjJabWdDa3dDdU5VWThpdzhz?=
 =?utf-8?B?eGN1VGlRRnRpekhvVENHUUw2YUVuekF3a0tmREM4RVo1cGRDeDNGUnhrS0VS?=
 =?utf-8?B?TERxOW9VM1cxajBBa1l3b1krNnR5ZXA5MS9EWTEvVUxiTmsvNmpVZ0hpSWNx?=
 =?utf-8?B?QkJhNTFqY1VXdWxrWjg1RHpCQ00ybXFBc0h3ZzhLZXlSaVBERnorcGFLbEYw?=
 =?utf-8?Q?rcdDz8Fw7qcVDo8yZ4t85vn8gR0Co/Hd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1g4RUpZcFVUNlBOTjJ2bU9acnZPNEVSQTZhSEZBTC9qTy9sVlAxdXZITElR?=
 =?utf-8?B?QldBU1lZR3ozaklHQlFMcVhYelAwQ0lOSFI5RmNwZjBIYnh6L1pld3F5R1d0?=
 =?utf-8?B?OGRtSCt1TUE2TTVtMzBCM3lscjdlYzZzcVcvN2FWQnZ4M1UxdjBPYmNVcnAr?=
 =?utf-8?B?SHB5MUhUVGxTSEVDYzRRQ2QvbkVwaEdxQUdNUWFqb1dBMENjdkplUXJmWWk1?=
 =?utf-8?B?dzdQZHN3TDV0M3ppbGpITGlMRjBRK0xENTFvVFV4aURjbS9GVUI0dzJLOXAx?=
 =?utf-8?B?V3ZmL3htVWZRODI1UEw4cEJtT0pVQmVlYlJuMjQ2NkpCR3JtRFphSllwM1VP?=
 =?utf-8?B?V1dWV25TSCtGTE03TDdweTlYZko4bE1MbVhWTGxrUlcxOHhSOUVjMlJTOTRH?=
 =?utf-8?B?M0ZackRmT2licnExclc4ZGgrRkN3eXZzNk1QdUl1WTBiSWVCUDlSbEdXNGRD?=
 =?utf-8?B?S0Z0U1pCUnRlT0JWeHRod05uY1haeG9mb2xacnNCTERNYnUxUlFTTURZOEtB?=
 =?utf-8?B?ZUNpdWpkUjg5dFpLSXVtYS8veU5DUEpITEhxbDU4d0t0N09QcEtpOFpJSXVJ?=
 =?utf-8?B?c2thY093VzdZbzV0ZVdCa1NZVWhKTjZlWGJocGc0V0x3enZQM0QrbjA3dFJ5?=
 =?utf-8?B?RWJNWDZmUnlOTFdOMVdIbUl2MjhVU1BBUngxN1MwalFvbFpxYkdPTGRmeEhQ?=
 =?utf-8?B?NENkMWJRQXZqZ3dhV0Q5QklSMHB4UURGRDJJNzZDcmtBTlU0NjFvaGsyd25H?=
 =?utf-8?B?ejZxQUszN3ZWbFB6MU9UUjUxamRaQU9JUzN3dkpuWTByWVh4bXhwYVdTL2x5?=
 =?utf-8?B?K2htWWF1YzlGWThTbG8rUFdNSE1CV2pZUjlmcW1NRXVnVnR3MnZ3MEw2REFh?=
 =?utf-8?B?am9NRW1NcEp2MXRvVUkxVEY0MkY2dTFzTHJhWitEVUNSWnJaMlZSVmRZOExW?=
 =?utf-8?B?aTF3L2dJZXppejRuYnRpZVZ1a0dzNEU2NldadmkzWVIwQnRzZGVoVUZjWkxr?=
 =?utf-8?B?Q1Nwd25IcmwvNE43enVZTzhRL3c1WEplbUxhY0ZkbHJkWmZCVThFWWVyckw1?=
 =?utf-8?B?M01JUCthMjl3bU81SG5OYjdMN0hLU21VbGNGVWRkN0t4WENhRkRaZUNJVG5y?=
 =?utf-8?B?eFRqWGN5WW5XNGJKN0RaUTZ5Z3BwODcxZnJyejU3TEk1TmN6U2tqMmtrNjhO?=
 =?utf-8?B?d1BIYlBaSUJONEZZNS8vQ2FieVc2Vy9EYlF3bDRud1p2MnNPaTExRllLbUpC?=
 =?utf-8?B?bW5WZHBHZ3laZXUvdkhvaE5MR1cxd255MFZVNlZuZjJSZjRFU3FpeEU1ZGs2?=
 =?utf-8?B?UWI1WnNPRHQzMTdPRDNYYVpSQkJ1NjZram54YmtkbTYvSXVRWmo2cUdJRW1I?=
 =?utf-8?B?NDZGUFY1RkZjcUMyNEhIZTFMNW1OaWU4bU41K0tnWWd5SG9xUTQ5aHJxS29X?=
 =?utf-8?B?eTJNZXhMQ05yaTVMR3N5TW9qb0hBdWJxTEFYWjFjQkZKcEUyMGxGV0pPL3B6?=
 =?utf-8?B?UFFkYjVXZzc4WHlDSE9qbWVLZlNSN2lvWWEyNjIzdHJZSU55RzlTYndjNGM4?=
 =?utf-8?B?RHlKcWxMb1NRRWpKRy9KRFIxaEwzcjhlbHJJOE5qR2QzSU40Um04K0k3MllB?=
 =?utf-8?B?QjYyUUd5clJxdnZ5RVFyZE5KY3lWd0FnZW9UMTR3U2tpWnFzT2MrMTZCMGRl?=
 =?utf-8?B?TWtiMlJGdlNEZ25jTmlYdHBUZVd4ZWwvT2RhdTExRlJTN2ZOQ3NIZVcyOEZ1?=
 =?utf-8?B?emlMZWVXUjFGTitSOVdoMGdXL2c5ZHVPeUhiWFRPTTI1WTRYVy9waTBRTllu?=
 =?utf-8?B?UlJXbkZNSmhLancyZGVVUW5uTDZOTDBiZ2NrM2o0SHRCUFFlWXZ4MTM2WnJT?=
 =?utf-8?B?Q2tGelZGbzN2Y1Nyb0NGTER4V2I4RmZSQUF2c1BSRHdBK2prWmJKdHNvdkVi?=
 =?utf-8?B?c1hTNHloZkRBb0E5ZU80aXp5Smt2d05WYk4zUVlyamlPSFlHMkNpblJFcDZ0?=
 =?utf-8?B?alY4bElic0dGcXBuTnVQMG1kYkNIMHFYenAwZnhFYWJNSGlYZ3ZZT2Rmd3lD?=
 =?utf-8?B?Vjh5M2RGTzBIekIvZTdMblRGbHZYaXNwZXJmN2FDOTRMRC9vek1vZTlTWTd2?=
 =?utf-8?B?SG1kT2h6b3FOYWpycjU5eEJOdzROVHNLVEd2ZTdydHNkc0xKbWJiL0lBYjcr?=
 =?utf-8?B?Rmc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdff8a0-4216-462f-5c88-08dd407ae5e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 15:37:54.3500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6yb7EurRkz1Jc9rzESdfBnb6UXG/BdsKRCDAhdCROXmZuqpRlHpZDzIZMqoLdApTraS63vGvCAnftQ1uMrBpUsini7O4PlJWN97+GqnF8F8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9938

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxMzoyNg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDUvN10gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQgU0RISTAtU0RISTIg
bm9kZXMNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDI4IEphbiAyMDI1IGF0IDEzOjEx
LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiBTZW50OiAyOCBKYW51YXJ5IDIwMjUgMTE6MzMN
Cj4gPiBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
PjsNCj4gPiA+IGJpanUuZGFzLmF1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+DQo+ID4gPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDUvN10gYXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQN
Cj4gPiA+IFNESEkwLVNESEkyIG5vZGVzDQo+ID4gPg0KPiA+ID4gT24gU3VuLCAyNiBKYW4gMjAy
NSBhdCAxNDo0NiwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToN
Cj4gPiA+ID4gQWRkIFNESEkwLVNESEkyIG5vZGVzIHRvIFJaL0czRSAoIlI5QTA5RzA0NyIpIFNv
QyBEVFNJLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5
ZzA0Ny5kdHNpDQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEw
OWcwNDcuZHRzaQ0KPiA+ID4gPiBAQCAtNTE4LDYgKzUxOCw2MyBAQCBnaWM6IGludGVycnVwdC1j
b250cm9sbGVyQDE0OTAwMDAwIHsNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0LWNvbnRyb2xsZXI7DQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGludGVy
cnVwdHMgPSA8R0lDX1BQSSA5IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+ID4gPiA+ICAgICAgICAg
ICAgICAgICB9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBzZGhpMDogbW1j
QDE1YzAwMDAwICB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAicmVuZXNhcyxzZGhpLXI5YTA5ZzA0NyIsICJyZW5lc2FzLHNkaGktcjlhMDlnMDU3IjsNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDE1YzAwMDAwIDAgMHgx
MDAwMD47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lD
X1NQSSA3MzUgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MzYgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgMHhh
Mz4sIDwmY3BnIENQR19NT0QgMHhhNT4sDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwmY3BnIENQR19NT0QgMHhhND4sIDwmY3BnIENQR19NT0QgMHhhNj47DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiY2xraCIs
ICJjZCIsICJhY2xrIjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0g
PCZjcGcgMHhhNz47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFp
bnMgPSA8JmNwZz47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJk
aXNhYmxlZCI7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdnFt
bWNfc2RoaTA6IHZxbW1jLXJlZ3VsYXRvciB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiU0RISTAtVlFNTUMiOw0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4
MDAwMDA+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICB9Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgc2RoaTE6IG1tY0AxNWMxMDAwMCB7DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxzZGhpLXI5YTA5ZzA0NyIsICJyZW5l
c2FzLHNkaGktcjlhMDlnMDU3IjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4MCAweDE1YzEwMDAwIDAgMHgxMDAwMD47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA3MzcgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3Mzgg
SVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNs
b2NrcyA9IDwmY3BnIENQR19NT0QgMHhhNz4sIDwmY3BnIENQR19NT0QgMHhhOT4sDQo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0QgMHhhOD4sIDwm
Y3BnIENQR19NT0QgMHhhYT47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
LW5hbWVzID0gImNvcmUiLCAiY2xraCIsICJjZCIsICJhY2xrIjsNCj4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgMHhhOD47DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JmNwZz47DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgdnFtbWNfc2RoaTE6IHZxbW1jLXJlZ3VsYXRvciB7DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiU0RI
STEtVlFNTUMiOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3Vs
YXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Ow0KPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAg
fTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAgc2RoaTI6IG1tY0AxNWMyMDAw
MCB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNh
cyxzZGhpLXI5YTA5ZzA0NyIsICJyZW5lc2FzLHNkaGktcjlhMDlnMDU3IjsNCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDE1YzIwMDAwIDAgMHgxMDAwMD47DQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA3Mzkg
SVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8R0lDX1NQSSA3NDAgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgMHhhYj4sIDwmY3Bn
IENQR19NT0QgMHhhZD4sDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwmY3BnIENQR19NT0QgMHhhYz4sIDwmY3BnIENQR19NT0QgMHhhZT47DQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUiLCAiY2xraCIsICJjZCIsICJh
Y2xrIjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgMHhh
OT47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JmNw
Zz47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdnFtbWNfc2RoaTI6
IHZxbW1jLXJlZ3VsYXRvciB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVndWxhdG9yLW5hbWUgPSAiU0RISTItVlFNTUMiOw0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDE4MDAwMDA+Ow0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1tYXgtbWlj
cm92b2x0ID0gPDMzMDAwMDA+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0K
PiA+ID4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4gICAgICAgICB9Ow0KPiA+ID4gPg0K
PiA+ID4gPiAgICAgICAgIHRpbWVyIHsNCj4gPiA+DQo+ID4gPiBTaG91bGRuJ3QgdGhlIHZxbW1j
LXJlZ3VsYXRvciBzdWJub2RlcyBiZSBhZGRlZCBpbiB0aGUgYm9hcmQgRFRTLA0KPiA+ID4gd2hl
biBuZWVkZWQgKGkuZS4gYXQgbGVhc3QgZm9yIFNESElbMTJdKT8gT3IgZG8geW91IGV4cGVjdCB0
aGUgYm9hcmQgRFRTIHRvIC9kZWxldGUtbm9kZS8gdGhlbQ0KPiB3aGVuIHRoZXkgYXJlIG5vdCBu
ZWVkZWQ/DQo+ID4NCj4gPiBJIGFncmVlLg0KPiA+DQo+ID4gSSBoYXZlIHByb3ZpZGVkIGFuIGV4
YW1wbGUgaW4gbmV4dCBwYXRjaCB1c2luZyAvZGVsZXRlLW5vZGUvIHRvIHVzZSBncGlvLXJlZ3Vs
YXRvci4NCj4gDQo+IEFoLCBteSBmYXVsdCB0cnlpbmcgdG8gZ2V0IG15IHJldmlld3Mgb3V0IHNv
b25lciByYXRoZXIgdGhhbiBsYXRlciA7LSkNCj4gDQo+ID4gSSBhbSBvayBmb3IgbW92aW5nIGl0
IHRvIHRoZSBib2FyZCBEVFMgYXMgd2VsbC4gV2hlbiBJIHNlbnQgcGF0Y2gsIEkNCj4gPiBhbSBu
b3Qgc3VyZSB3aGljaCBpcyB0aGUgYmVzdCBpbiB0ZXJtcyBvZiB1c2VyIHBvaW50IG9mIHZpZXc/
DQo+ID4NCj4gPiBOb3cgSSBnb3QgdGhlIGFuc3dlciB0byBtb3ZlIHZxbW1jLXJlZ3VsYXRvciBz
dWJub2RlcyB0byBhZGQgaW4gdGhlDQo+ID4gYm9hcmQgRFRTIGZvciBhdGxlYXN0IFNESElbMTJd
LiBJIHdpbGwgYWRkcmVzcyB0aGlzIGluIG5leHQgdmVyc2lvbi4NCj4gPg0KPiA+IEV2ZW4gZm9y
IFNESEkwIGZpeCB0eXBlLCBpZiB3ZSBwbGFuIHRvIHVzZSBmaXhlZCByZWd1bGF0b3IgZm9yIGVN
TUM/DQo+ID4NCj4gPiA+DQo+ID4gPiBJcyBpdCBwb3NzaWJsZSB0aGF0IFNESEkwIGRvZXMgbm90
IG5lZWQgdGhlIHJlZ3VsYXRvciBjb250cm9sLCBlLmcuDQo+ID4gPiBpbiBjYXNlIG9mIGEgZml4
ZWQgdm9sdGFnZT8NCj4gPg0KPiA+IFllcywgZm9yIGVNTUMoZml4ZWQgY2FzZSkgaXQgaXMgbm90
IG5lZWRlZC4NCj4gDQo+IFVwb24gc2Vjb25kIHRob3VnaHQ6IGFzIHRoZSBpbnRlcm5hbCByZWd1
bGF0b3IgaXMgYWx3YXlzIHByZXNlbnQsIHdoYXQgYWJvdXQgc2V0dGluZyBpdHMgc3RhdHVzIHRv
DQo+IGRpc2FibGVkIGluIHRoZSBTb0MgLmR0c2ksIGFuZCBjaGFuZ2luZyBpdCB0byBva2F5IGlu
IHRoZSBib2FyZCBEVFMgd2hlbiBuZWVkZWQsIGxpa2UgZG9uZSBmb3Igb3RoZXINCj4gY29tcG9u
ZW50cz8NCg0KQWdyZWVkLiBBcGFydCBmcm9tIHRoYXQsIEkgYW0gcGxhbm5pbmcgdGhlIGJlbG93
IGNoYW5nZXMgZm9yIFYyOg0KDQpTRDAgZml4ZWQgdm9sdGFnZShlTU1DKTogZml4ZWQgcmVndWxh
dG9yIGJhc2VkIG9uIFNvTSBTY2hlbWF0aWNzLg0KU0QyIDogSW50ZXJuYWwgcmVndWxhdG9yLg0K
DQpUaGVyZSB3aWxsIGJlIGEgbmV3IHBhdGNoIGZvciBzdXBwb3J0aW5nIFNEMCBub24gZml4ZWQg
dm9sdGFnZShTRDApIHVzaW5nIA0KaW50ZXJuYWwgcmVndWxhdG9yLg0KDQpDaGVlcnMsDQpCaWp1
DQo=


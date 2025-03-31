Return-Path: <linux-renesas-soc+bounces-15216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A75DAA76D82
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 21:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C27FA18888A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 19:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB92F9461;
	Mon, 31 Mar 2025 19:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uyViu9Mt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011502114
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 19:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743449591; cv=fail; b=a74x1ra/XlO3N55Pl5i3VGODU0OeOq0eQCJK94JGYL1sm38tC8PFnDcX/O30szOEkjSeDmwmeN6VsfW3bqx/Tp1vpOmfoE/6GXuf621ktweRMMeQUSAv9k8LT91Ze73FT0sT1a2IBo4EdIgoroFZvWA7ipJRTVZFfFKjxu0/aRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743449591; c=relaxed/simple;
	bh=fNeOWE2vCOKnXJDHimTLKgInUdcbxO8ukj3YviVcARw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mPSevLRkW1rEMuAkpPTeqGUXdMhp5s1AnVGGm0raAjAiCmx/mWdGDsObCwBmI8d+JIMi3kLqkgeFInoLtQhL8sLb1b+n9GQ5+RN2qdIC6zTNckvV09sI4IozKTct+hLK4LIzM4574z1Eb1FEHKDYTNF9N2LWdbreiGHI2ZaVEAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uyViu9Mt; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ccwe/ZvUggwwnjj5jxC8b6ukVTFhDZN/Ci7Ob6iwla7RzfMPVI7CiL1OX3pwTwFrJKFBU/ar8txxYOWkiSdqnhG0eccEdKqO0+qcx+tCgNJYe+5SGEoWNJZDGvaeMH/vtFYTK/7Y1ZdKBeOvE4irFOebDbCvjWYRWD+a+dZYQUTd3umqWVb2rxB/amHLiBj1vGEPegnd5VHuzI9e+GsWWohGRxnkcVBGR5LsOVvD0mV53OEmggfWHeuoWsCpFhSq56uMmoi6WAyUnj/tr+Ij9zMCdrkFOyWY/gooFECOiUwm4ZuWkHyRddYOaeEunhaO4/yM75paq1Ay7JJAQnJdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNeOWE2vCOKnXJDHimTLKgInUdcbxO8ukj3YviVcARw=;
 b=v2HZAEk0EQyxbQWpO/A6XGu0FeVJMPbRXhRSz9cHWTFmHP7BRJa0E/z7Ihj9UQzKTyKGI0zpEaY9jxZDyNlm+YAVMl0uiV2/2OoZlrLeT5EI87waLJ/YKk5Gw2vZyVdoJUSrk2G0EP9t6mtktuWkw8x9Esp//fSK9hnFHjFoJA9SFvdMOjxDTy7lv9/Y+GXuiVON1kBPeH9TzSO5/bA60iopHG7938PzFBrQKV9Ktqf/Gzd+5v6DlCkXoiYLP5JJ5P9taPkbrthDvcy1xNu0Tj95Gwzh9YWEwnCHch8Jr2jsQy+vEy+SyYwXDsW2OQS4V13AJuMhe66dgh7TyxWdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNeOWE2vCOKnXJDHimTLKgInUdcbxO8ukj3YviVcARw=;
 b=uyViu9MtkROV0vtCLak2BoafM2hDp0XkgM8PGBlOPrlouJc1lwSVKhhXfBNhcrhlRleIlfzVHL5uJuMMe5rb96ffiyAc197W21orrJJXjZ0Hw63qI7oX8K5iQae8jEjZ8pAzG9CqMFNN38mknZRhGdSEETO/ptXYhpckEM80eCA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10024.jpnprd01.prod.outlook.com (2603:1096:604:1df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.35; Mon, 31 Mar
 2025 19:33:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 19:33:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/9] memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro
 error
Thread-Topic: [PATCH v3 2/9] memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro
 error
Thread-Index: AQHbknnaXsvblwZIBUmPpJEgJ6xZbLONRWcAgAB5kgA=
Date: Mon, 31 Mar 2025 19:33:01 +0000
Message-ID:
 <TY3PR01MB11346446AC852D908FF83671F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXiGZAy4thzWq3JYDi9F=0DASnEbAk6S-+hDY8Gcs_jMQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXiGZAy4thzWq3JYDi9F=0DASnEbAk6S-+hDY8Gcs_jMQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10024:EE_
x-ms-office365-filtering-correlation-id: bea0f8be-cb5e-43ed-f391-08dd708ad9ae
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?UjhjdjFaVGQzV2lkRXEza3REVEQ1UWxXRjk3Q1d0ZGdVZ2ErS3dyNUpYU2Vm?=
 =?utf-8?B?bnpIZW5TWHZJWlVmT1NBVENWOVlpOGxBbjEvTm5SWVRlU2c0bzNmd2p1dzFT?=
 =?utf-8?B?MFY4VW1aMGtKYlVwVHVYS2VBaGNFVFVodHVRL3RtNzNSWHBmQnZnUGlKV0Ri?=
 =?utf-8?B?cTdjcnZqZDJqMkd6SG5tZ21PaGVyTVIxb3FqUXdpaHZ1bWhucFpwOTBsWFFa?=
 =?utf-8?B?RlY1QzEyV2xtTTNKekorNEtXQUdKQ1NpZEN0ZFpOTFdNRUZJY1N4WTloRDY4?=
 =?utf-8?B?M3hlOGZtVlg1b2pMdHBRNDdoNUZaTkQ2WGEzV0VsdWJjcTlOR1A5VlhOU2Fk?=
 =?utf-8?B?L2c4bXdQVmovNzJ5Um5nM3B1d1cwcEZSczA0ZDI5QUU3V2dzckw4UlFPR1Bl?=
 =?utf-8?B?RFlhNXArRTBBaDYvbzJGLzRiWUJzWkQ0dTcra0pnb3JuRlFiVFJLTzFnOFRj?=
 =?utf-8?B?Ry9YTDJYSHZXTnl3RHcvL09mNUQxMFZ0Zkl3aThRZit1LzNFQWEvZzNWc1Rp?=
 =?utf-8?B?UWZWWUtxMjAxRkVoNXpmQUsxcytsanNPc2VUbW5uWTlWSVJDN1M4Q1RZUlVZ?=
 =?utf-8?B?ZStPT1NXeDlnVnRUR2daT0d1TDhHRHdOVGNIbll3bHhVcFYyQTZFVGtNS2Np?=
 =?utf-8?B?azF0blJHRWVHMkc0dXBBcWo0TEN2OUJmWEFjYngyelZsaUY5RlJoQXJLeDZB?=
 =?utf-8?B?YW8yVDJhQmoxc1dyQjVaLzdrcXk0UmZ1QU4yNVJSbWFyWGZ5TituYlVjdVhI?=
 =?utf-8?B?dk5NVzBKSktGdit2NDhpNVhXNWRsWUlKb3lUZ3Y0dDhvVTdDSkcvZVYyOEhs?=
 =?utf-8?B?eExNZHhRSXJYdmducG1IMEkyV2lySUJlZy8xU242TGFSb09rMG5CVlVxQWJD?=
 =?utf-8?B?dXc4alJ1YkRtZTlXSkhERG5tcTZIQVhBaGQzdExCWk85TnpLdFhHSFVhYjZx?=
 =?utf-8?B?dm1sMDhhQ0xmU0E4ZFZteDVjSlNZeVpHUWV3K0ZjYWtIV2pQRmNHNjgzR3B2?=
 =?utf-8?B?VkwzeXlBd3paUG1IODJVUnlvbFVzRlpmbHJEM0d1MnRSbGlVTGRsTDl2Ujll?=
 =?utf-8?B?NVdENXp2K2tEU3dHWFpCTVZaQ1EwQzE4RER5S3JLR2NUUDB1QTJKWG80RGR5?=
 =?utf-8?B?aGV5RTV1THN4dnFxSDUvNEgvS0ZSTCtwdWZWSUtVWHV4RTdscGk1OUcyd0JT?=
 =?utf-8?B?NFdPaHN3TmgyWmFmYXJVTW5obmhqZVJzanlxSWgyQlYxQW1WT1VhZUFRNXVr?=
 =?utf-8?B?ZEIxRmxnZEtJY1FxbkFyQ0xXT3lQZWoyTEtQSzdTRFFnZnJFQnk0QWx3d2Rq?=
 =?utf-8?B?UkpOaldhbjdVR0FSNWF6ZlRUeVR0dksySkc2aCtCNURsa2trQzhGaFdzRVUr?=
 =?utf-8?B?cnR4RTljblhianZ6Vnc0NzErenJNcjluUlhSZXlFcGhEYXB6SlFPNVJQL0Fv?=
 =?utf-8?B?NkpyTkY0bDBzaXNpRkQzVVN5a0FhN2gwQy8zU0k1RWxneDJWT1BQVVduaDVZ?=
 =?utf-8?B?TlRhbnBORTVSTThENncrK2pmR2pBS25CU1F2OXZNQWw4RDBVczVONndna2da?=
 =?utf-8?B?Y1hFSFNqM05GZUxKeTJIblF2RUJDQU05bWh3WHNxbkJpYnVwemptTkxlT3Bh?=
 =?utf-8?B?YWVqVWhyYUNtNFMyNi9CSzFQYlVDRUNKd2swUkZoU1VJeGJtNzI2dmtPNDBC?=
 =?utf-8?B?M3hvTFJLY3RaUjJuNm5kcHlCSmFSOVkrTzB6RkdnK203bjlNMnlmK2hGcStI?=
 =?utf-8?B?N0NLcWpTMzB6VWwrMlphTjdQV1BOeitkcDJTNjF1YU9ORlk0TFl0cmpuTHlz?=
 =?utf-8?B?NXJHY01wVWk3bDFPMTQyamUvRTdVLzEvN1o1YkZoMitZNnR4TVE4cm5pRTZV?=
 =?utf-8?B?aDJxalQzK0svYUx3ZFFkZDdvQlF5MkJOa0gvSnE1ZGpSd25QUnNtQXkwQnZG?=
 =?utf-8?Q?6P41pE49q0SUa2mPE56YTuQ7AqpUG1ln?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTF3UGxYeUYwUUltS2NDbkFtelJmK1pzM1dMczMzRWNUM0h6aE9EenFMSWhy?=
 =?utf-8?B?MGd3SksrNmtKZHQ1YVBjMGIvWVZBMGF1bHdVYUkxOXRFRzRORlFHSWxoZGNm?=
 =?utf-8?B?cndkdThjaE9WNGdURGJWOFVjNVQ0bmlXMmIyQWp5STNmSmx1MUY5OEVYaFE1?=
 =?utf-8?B?ZmxPcS9CeXRNemxRSTdSN25saWNFVUpNaGpMd2szZ3A2RDlwMkp0UDlEMzF2?=
 =?utf-8?B?U3J6YkR3MFBhLzliZ2phS0V1YzRCanVSNVNtOVZRYmFNUDlDR1RkQlc1aDJJ?=
 =?utf-8?B?QU5xejZjbHZvZmU1ZC9Ld3V4N3BTWm1tSlFHanNkNkszTmNNWTlQSjc5eVAr?=
 =?utf-8?B?WGFvbUJKcUpZdCs2eVp1cEdyTU9UMGlobnhnNko4ZkFiUTlYc0F2Y2s2K3FS?=
 =?utf-8?B?RDVRY2RrNFY2NzA0dzZDOFVWQkpLZHJEZXMrT3BHaHVHVVlFYW5ROFpEZjR1?=
 =?utf-8?B?VGJXT0xqK0JVM0FNQWQ3ZGxFeGZMUnVWcTkxZGtCVU11Z2ViZW1ySm16ZnRS?=
 =?utf-8?B?Q2VHR1VyMEhQTEU3aGxYOS9pNElQMzVvaVdUcS81M0lYYVRiZm45SzBjcFFv?=
 =?utf-8?B?RzlYWkRLSnlLSmNkbDdJTUNNZlQxRHdPMzh0T0JreHNyRjl5cnBYYWxoaHFT?=
 =?utf-8?B?aEtkMFU1dDJOajIrcEtqNWNyeWRqYTE1U2hoSGhXN2JHSEZ3SnF3bXNydGRB?=
 =?utf-8?B?bFpxNGVCUmNCejFZaHFjbU8vUlFTVWhwRXIzbHBkOFV6NXVuSkUwZ09QUU1x?=
 =?utf-8?B?SGtScXBoRTdKYWFRRWhVU0c1Ti9CSUJUK0FRcGQxSFJLVDhPQlhMb1dTRUpZ?=
 =?utf-8?B?R0hPZE11K3ZhVm9xN3FZRmppc21JTmN2ZzhnTkZDR0JJOE5KdTV6MlZnSDFQ?=
 =?utf-8?B?WXRXOGErR0ZqWVZTaTB0dTdvTm0xQ1p2ci93TG9qeEZCWmJySnMxUDM1TktM?=
 =?utf-8?B?WG00M3NLaHZiSzdLOElLN3BHR2wyYldtdkVLM2dtK05mSWoyOVYrUlloVFdo?=
 =?utf-8?B?RGhrVGM5d2dPaEdJekJDU1V0QUxsUVFFTFZza0JDSksxY0J3MjUzWWFpU3hF?=
 =?utf-8?B?akJhcVh2T0VZSit1MmVScjBhcFd3M0NXR3lCKy9PNFFJRzhjMWE0QWJXeVU1?=
 =?utf-8?B?UE1qcTZuTndJVm4rV2ZuRCt1UVlUQkhERmNhSlVYQjdHVjdrWkJyeDgxRkZ3?=
 =?utf-8?B?ZnBldWo4UHBZT0JZLzNGa1B1ZTNiclBDN2F4Unh1Yk9nUFVMaE53ODFQRFdX?=
 =?utf-8?B?TW1xaTZZTTNkZVJDRE9sZ1czeHNJdWdhUlNuOHNpSlYrVzZtR1U5ZHRPbHoy?=
 =?utf-8?B?MTlvYzRtZ0F5QXltOVZQdGpjaTRNcWFhYXR6RmFMbE1HZHBIbHZqK0dIV2x0?=
 =?utf-8?B?Ny94ZkJMV3lkc2EyOVd5UWdMNVIzVVJHRWFtVnozUm9tNWdObWY3ZXFWNnl6?=
 =?utf-8?B?RUdMVm95Rkh2a2tPSHdtRnM5RlZ1L3o1dXRzS2lzSGIwd3dUcTgvQkFCT1lG?=
 =?utf-8?B?Qmo0d0t2eTByN2lXN0xKazUzMGI0cXJra25wTWFPTUNXczFwcHRyNUtrbGll?=
 =?utf-8?B?ZGVlRFR5VTIwcHNGNWxaS1hIV1hXRUJ0czRUeUdsZUQxTGV5d21jSEdWbVFs?=
 =?utf-8?B?NnU5YkZSczFDbWxIR3UwbnJnOFd2a3grOUkzRWk0L2U1cmJyUXdzWjUwWVd4?=
 =?utf-8?B?TEFkUWtjNk5BWm9TMTJzVkxDcTg3cFlTOW5hTU02UHh6RzR3RVhqOGVDd0l1?=
 =?utf-8?B?Q1J0anR4SG1lbTZjQzJXOWE2b1Y4MlZ0QlZialNQK3k1YjZsUDBmRWZHdHJ1?=
 =?utf-8?B?a2V4TDBvWmdrbW9adVRUUGZ1QWNkbHp1Z2gxU3VFV1krL3BaRWdZYWtxelRS?=
 =?utf-8?B?VmNwUlJZeHg1TkZ3L0o2emNOOGZSTzdUL3p1MUZpcjd6OUFqK2tKeVVvQTZh?=
 =?utf-8?B?bnNUNFh6WDVVWnEzaHBIYzBPZi81L0JTdTF3T0YrTHRkZ0dKOVlGTDlPUkZ6?=
 =?utf-8?B?TXRkeWxFVWhyaEZSWFZZc3hpdFhqOUhob3pkb1VLL3IwWXk3ZUdVTU5xR00w?=
 =?utf-8?B?NC9hbHhVd3lLSlUxNmZicWxDaFpGVFdPYkVMaUhvcTNhUUVtT0h1SFFyVlhi?=
 =?utf-8?B?cWpyelkvTjhvME84NWV2T0xOTDBUL0xoTGkxUXpQNVIrL3Axa1hzYUo0OVhn?=
 =?utf-8?B?MkE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bea0f8be-cb5e-43ed-f391-08dd708ad9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 19:33:01.6029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ZFU5fTP/W3EQerGQBa1pkbIrI0/iA+/r3F4Ye3XfnSC/7MLX5auffK0DZroS2N6mDXPgE1qnjSU3p1QDSONeV1lTuo7BugbOwhuVATbf7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10024

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDMxIE1hcmNoIDIwMjUgMTM6MDUNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAyLzldIG1lbW9yeTogcmVuZXNhcy1ycGMtaWY6IEZpeCBSUENJRl9EUkVOUl9DREIgbWFj
cm8gZXJyb3INCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUdWUsIDExIE1hciAyMDI1IGF0IDEy
OjM2LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEZp
eCB0aGUgYmVsb3cgbWFjcm8gZXJyb3IgZm91bmQgd2hpbGUgbW92aW5nIHRoZSByZWcgZGVmaW5p
dGlvbnMgdG8NCj4gPiByZW5lc2FzLXJwYy1pZi1yZWdzLmggaW4gdGhlIGxhdGVyIHBhdGNoLg0K
PiA+DQo+ID4gRVJST1I6IE1hY3JvcyB3aXRoIGNvbXBsZXggdmFsdWVzIHNob3VsZCBiZSBlbmNs
b3NlZCBpbiBwYXJlbnRoZXNlcw0KPiA+ICNkZWZpbmUgUlBDSUZfRFJFTlJfQ0RCKG8pICAgICAg
KHUzMikoKCgobykgJiAweDMpIDw8IDMwKSkNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9tZW1vcnkvcmVuZXNhcy1ycGMtaWYuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvbWVtb3J5L3JlbmVzYXMtcnBjLWlmLmMNCj4gPiBAQCAtNTYsNyArNTYs
NyBAQA0KPiA+ICAjZGVmaW5lIFJQQ0lGX0RST1BSICAgICAgICAgICAgMHgwMDE4ICAvKiBSL1cg
Ki8NCj4gPg0KPiA+ICAjZGVmaW5lIFJQQ0lGX0RSRU5SICAgICAgICAgICAgMHgwMDFDICAvKiBS
L1cgKi8NCj4gPiAtI2RlZmluZSBSUENJRl9EUkVOUl9DREIobykgICAgICh1MzIpKCgoKG8pICYg
MHgzKSA8PCAzMCkpDQo+ID4gKyNkZWZpbmUgUlBDSUZfRFJFTlJfQ0RCKG8pICAgICAoKCh1MzIp
KChvKSAmIDB4MykgPDwgMzApKQ0KPiANCj4gVGhlIG1vc3Qtb3V0ZXIgc2V0cyBvZiBwYXJlbnRo
ZXNlcyBhcmUgZHVwbGljYXRlZC4NCj4gDQo+IEFsdGhvdWdoIGNhc3RzIGhhdmUgYSBoaWdoZXIg
cHJlY2VkZW5jZSB0aGFuIGJpdHdpc2Ugc2hpZnRzLCB0aGUgb3JpZ2luYWwgaW50ZW50aW9uIHdh
cyBwcm9iYWJseQ0KPiAiKCgodTMyKSgobykgJiAweDMpKSA8PCAzMCkiLg0KDQpPSywgd2lsbCBm
aXggdGhpcy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICAjZGVmaW5lIFJQQ0lGX0RSRU5S
X09DREIobykgICAgKCgobykgJiAweDMpIDw8IDI4KQ0KPiA+ICAjZGVmaW5lIFJQQ0lGX0RSRU5S
X0FEQihvKSAgICAgKCgobykgJiAweDMpIDw8IDI0KQ0KPiA+ICAjZGVmaW5lIFJQQ0lGX0RSRU5S
X09QREIobykgICAgKCgobykgJiAweDMpIDw8IDIwKQ0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcg
dG8NCj4gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcw0K


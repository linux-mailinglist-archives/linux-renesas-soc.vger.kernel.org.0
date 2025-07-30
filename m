Return-Path: <linux-renesas-soc+bounces-19781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B317B16266
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 16:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB8B4E176D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jul 2025 14:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B512D97A3;
	Wed, 30 Jul 2025 14:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QDQ4gArj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B92E290D81;
	Wed, 30 Jul 2025 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753884761; cv=fail; b=C2PDMZjMF9Ti4QWXUfnHqJAoiQmeQP3RaZaY1v5TqifaYTz8sQ3Gkvk5I5vSdQUGss94hh0tosBj1FQSGD/qRLgv9RND9AMSeRoScAzHgVNC3Jkl1r3X12ZZccflszqtkaTozwekgDTD478hiQItHS333KvZ9hYyPGZWmIVfFdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753884761; c=relaxed/simple;
	bh=g75FyPhLxFIgYX25u9sSlFT9NTUzAgn+M8LZTR2CWNQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D67tQHzYHp8BE8ZWVczALnPgK8Tpd1t5K9RT6Ie/rrXDWVV+rcSLAAVfTnAwaxq/xNNiL7H8HAEE988A1y6ybedpL404eju551HyEFJ9z39PCebIXvLwF2li6J5S9Bws+YEKX9MyhUeKPAtJJAZr9HepKeY6KD8Qz/xUcjenD3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QDQ4gArj; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNoebKusFkI74blGYwlAeyldbUf7rrQ5FLeWeandXNdPyVoXc+PjbLlV7XN344CFgWNRFl5MeK8opw7tqvoMLbJnPtgjH7nLFz9iS0AMOIjdSYoLf0wAGQKC0XlaTUMOj59j4rFR45glXEbNtTwd+M7VszAgTVnM+fqetZieO9jn9cJUuh3tXZcpJNxb0qEIRgCzzymKlEiC4Y0trdFoTTWoYUfe/V5z633/Sa+uo4lScYB+3Z0zwofqhiXzbFS1rh1J8rDZXCcgesMqVtOWCnGJu0sg2nQUzcs3TbeQqeH4R/YeZkjGvlHIkvSy8Z4JvqcHHCdESzZ9yl+Bb209vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g75FyPhLxFIgYX25u9sSlFT9NTUzAgn+M8LZTR2CWNQ=;
 b=vCsd729ecpSQNTid229HWvjokO42OtscogHPn23BQZfgz1Ct1pp22KLTCFEXxHbhbo2v3pA32ahLzu8+vkWl4HTH1zKK21VcjTAoPt4K0Cn38jjpylq8YsRweLJOB5AyhLCoiBBT3YkTf2ekpEsm6HoherjpH3tuE5btQwDNdEOX+6xFuGZqmpq/sc7N2E07tzWEKEzgFpF7dmaBXYdlniddjrmudFePsxoFCgwNyN7MOvriceXcH1XqJpIuvlzWMmvwA9eFuOqlAvEGtsjW5H1sOiwm9MqeL0172Zte2sSK3K/zAr0MhS0Da9UBifW0NHKg9VvS0+cF+eThL2Vqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g75FyPhLxFIgYX25u9sSlFT9NTUzAgn+M8LZTR2CWNQ=;
 b=QDQ4gArjX6oBb+GXo3R1SA+DcZ0QEajNIM4ukJbE3qBqYDJ5D7BcMDUpZ9PwZfLVF/vtuUcNESzU3TAt76cqZJvJIn6DEnHyP7nam7/TgwxbUkMdVagqVVHnDrp/vJpVpv5VIOC/tHlnT9MVng+pGZR27Xhg8eUkrwfOpYvoGpI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7359.jpnprd01.prod.outlook.com (2603:1096:604:149::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 14:12:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 14:12:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
CC: kernel test robot <lkp@intel.com>, biju.das.au <biju.das.au@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Topic: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
Thread-Index: AQHb/xCTiDIH7i0tZU6d0LnXFP+CfbRKN9KAgAAvfYCAAE4sAIAAA/Gw
Date: Wed, 30 Jul 2025 14:12:27 +0000
Message-ID:
 <TY3PR01MB11346C0622E61F19C38B2AB238624A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250727160731.106312-2-biju.das.jz@bp.renesas.com>
 <202507301421.AmWhOZBk-lkp@intel.com> <aInjE-sduVbBRmJx@shikoro>
 <CAMuHMdUHog6rehPFu9t99N0F-69sr1fQGWmX1sBR40=kDvD=Bg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUHog6rehPFu9t99N0F-69sr1fQGWmX1sBR40=kDvD=Bg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7359:EE_
x-ms-office365-filtering-correlation-id: 668434dc-1ddc-49f2-cc0b-08ddcf731d42
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dEMrZ2x0bEsvdGJ2UnJmczBDSFk2Y1RoOVBwb2NjN2w4b2l5cHRnWXN1aEFS?=
 =?utf-8?B?SXZURnBCam1JZnd4ZmdnOU8wNFdYNnl1RjRVaFRUZm5RMVJTRktqV1J1d21i?=
 =?utf-8?B?Qk45bXI0d2p2c2tZbDU1WGJYZ2E4c0ZqbWErOVJkOEt0Vlp0VnpTeVdxQXFU?=
 =?utf-8?B?Y2NTQnYwcDhmOElIL1g0Y0pWbmhGYTdwR212VHh1bUUxVkZoMEtBRWdaK3ND?=
 =?utf-8?B?TzIreXdkS2IzcnFyUWhvTEwwdjBKU0RQUkdScVZxM05xS0dvTXB4NDlTRElr?=
 =?utf-8?B?d3RwL3hONUNOcXVFVWs3ZnlaajYyZkg3Z0F0a2lyYmpiam16dlpQYmZ6Z3Y5?=
 =?utf-8?B?dm5xSGRxNHVaRXBvN25vUkVHQnBlVk0yV3dDRzJ4TGlya0IwYXRCOW1NMDRz?=
 =?utf-8?B?c0huZUJhcUhpV2RaRmlkd3Vac0xOOEpQSitEcGZLbElNdEQzZGE1WFhHWkE4?=
 =?utf-8?B?TCtjaTRiOVVKRTZZSDUvZGxmUkNmR3JaTFM5Sm5KSlpNSWFFbit5WjVpdU5a?=
 =?utf-8?B?aTVORmJ5QXVYeEkvNTQrMXlDVHd6bGNCQURFWEVrNG1LSVl2N1hQVFRXWjVy?=
 =?utf-8?B?VE11anFma1p1TXorc1ZuNU9SdVVabDRlMHV0djhnL2VoN1RkUFdIMFcvNHYw?=
 =?utf-8?B?M2piUHgxcUhBUStaaWdKbEQybnRHUWdISENGN1NReFVxRHJhNHRqMmR0NHUr?=
 =?utf-8?B?dGxobW1TeXNjcUM4aDFCeWU1RHFrL0FqZ00rS1d0dGYzVzRrOVlYMGg3YVhN?=
 =?utf-8?B?TTlCMjhXMlhzWmxXZ2l1YWNLUVFRMVZwdU5wWEtGblh2REJLWm9CSmdmOEhW?=
 =?utf-8?B?eUkrWlBRckt2UjExUVFKd3BiakNiZUxucjdhSVZmMTVxK25SVC9kbE9JdVVo?=
 =?utf-8?B?YXZMdlVGQmYzL0RNcTdmOGplUW9nazAzTGd0eEZXUlVKRjQ3WWZTVXppQnVH?=
 =?utf-8?B?SXhZbmtuQzFvSXBWTzRqYUNqU0tkd1RFNzNJaVVOWG8rWDhBVDYyRXZZY0NG?=
 =?utf-8?B?S1grcSsxNEtuTWdBMlp3bDczbnVxemdadmZnSjdIV2RtNENHUFNqSVNrWUhC?=
 =?utf-8?B?N1ZlQnMwNW9kc0g5U1dxdzdsODl1YmVTNEpxRG5saGFYZlVPVThSSGc5T0py?=
 =?utf-8?B?Qjd1SllzWnhxR1lqN1cxbUlMRjJSUHpCRm5VWXpNRS9oYjIzSTVQWFlac2Jz?=
 =?utf-8?B?cEV4ajJodURwUWc2WUZLTGlXeTkrNTJPQUhYVlRnNXJBVU9TaEMyRDZ1b3FC?=
 =?utf-8?B?R3ZEVlp1OWpINEg4b1lESnIySmZSQ05qOGF1WWdBVFk2Qmx3ZHd3cXhJNUF6?=
 =?utf-8?B?cjhYZm5hVElBL2Q3L2tkOHpHL0F3cnowY1p5YmtubE1TOWdLd1dUNlJhSnR5?=
 =?utf-8?B?WmtiUkMyUFU1U3JzMENtSFNYV3RCRkg3djNxeENiL3dVeEJ6OEtPYkxRRTZT?=
 =?utf-8?B?UGpDejBCbCs4ckJvL2NsWFNKa0lJckZsNWJ6bG5QZVdTWlEzQ2tQWDdlVzdj?=
 =?utf-8?B?eXBKOXNPOFpGNlhqQ2NPV0RQSjJhQnUxaVEySE1veWcyb3lycEQxZUtHNE5M?=
 =?utf-8?B?QTNSeHljaUtYOGxaL1JSb3A0RS91dW5keW9xSVpqazl3SnFGbTBLREt2eisy?=
 =?utf-8?B?V0Fzb3pSa3QweElvV1lLcUc3Qjd6RmJSVWhacnc5UzlzbnA5b2NETjlPK1kv?=
 =?utf-8?B?YkR0UDBZMTVvRG9XQ3lRUHZHUTBYM1oyRDFDbk9kZVRIQ2RMbmVkbWU4R3ZK?=
 =?utf-8?B?cWF3Zy9mZ2tsbHhZcTdYeU51M2M5b3YvSForNEhmb2NVOGk1ZHpGQzVCbXBR?=
 =?utf-8?B?TlUwVDRRQVFzUGZtT2hnY0srQzhHQWw3YlQ3T1hMeVd5WHBjdHlDU05pZzJ0?=
 =?utf-8?B?WWZmdVZwSWFCaXY2L3crSVkzaUZxTUZlMnZRTEl6TmZJY2c5Q2lma2VwaHp3?=
 =?utf-8?B?b2Y2TW8zcEJRazBRWFJKQmlvU3AxVnorWGFrbGwybW42d1B0N0ZXUzBCOWJ4?=
 =?utf-8?B?U2dQZ0xYbzRnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHRnTnV0dkdjK3lHSWs5S3JvM0pFRk9YcTlXL24zS2dmbHM3a3NqQVhNOVlR?=
 =?utf-8?B?V3M3MEp6V1VOMHAyM3RHVDVwSktLQ0plK1VtN211TjErV3dRZ3NWNXk3OG9y?=
 =?utf-8?B?REt4ajVFdEtxTTJyRnVwTkhVbzB3Qk9IOE81MC9RVWpBM0JtTzVkb0ZuWTRV?=
 =?utf-8?B?RHU3UFFYRHBOeExjMkVsbHBpc3U5RlViaDJNKzVLTXZtTFZHSWdIWjF0MDV4?=
 =?utf-8?B?ZjdIOEVjdVpyaUZpaFYyVFEwOTJIZ0FiQitXS1ZTb1cxbWRHR2I4c0p5VkpY?=
 =?utf-8?B?WkFmWjY0SFJ6MFE3aHJoZGhIR1dFZXNRWVlnVk9ETEtGd3JWcTZzWnAvenc4?=
 =?utf-8?B?bjJDUlQyekhTT1orZnU1eTM5UW1ncGpleFM1WXdkWmlKNncwNkdub0pNQlhm?=
 =?utf-8?B?M1lhQU1qdEV4VDVYRWZlM2RTUjJVWWo3eFZ3RGtBaUFzdytSZVg0cjU5Sjkv?=
 =?utf-8?B?Z2ZXeUtYWjRKQUZ1bUxZZy9Zc2JkTlV2STQvTlZIVFkrSnhWWk9kcjNaUVQv?=
 =?utf-8?B?L3ovYnFXaUdlbC9LanduRyt5TjJaSFhHNndGS0hnNW9NZkkxUElwMVJVdGk5?=
 =?utf-8?B?WmVweTE5a2JHUFVVS2tYbU85TmdXWFdKN2wxMDlOc2dzR2l4VGxud1QzMFIr?=
 =?utf-8?B?NEFqRVplRFFvTG1VYThVSjVSSnBjZk8waDRqMmlzcnNwdEZkZUxjYk9QU2xq?=
 =?utf-8?B?U3BCYW41YkY3WWRMR1FqeHJGc0VCeTJTV1J1TjladU5lTXlsUkJjTFZHdHVV?=
 =?utf-8?B?QUVOVVc0TXRTd2pJTEFqbjhJejlpZm1EeGtZWDZaOWZHWkJGVWc4L0VyVWNU?=
 =?utf-8?B?blgyZi96NWliQ29XTkQ1TytpeGd6OEtPcWEvaDBZU2pQc3BqMWVXaWRRVndr?=
 =?utf-8?B?OFhUSVpPSFNrRVBSSTJYbXY5TEFlQzFiUW4xM1JSU1c3WHZWMmh6VTdZTmk1?=
 =?utf-8?B?UzZ5NmtoUTdPWTBtdnR3aEM4TG5sWklJeHB0TW92UjRTb1JlOXg1aUZFNjlI?=
 =?utf-8?B?M2N2YWhYT2k5alRCWnc5VnNTRnV6NjlKd0xkMlE1QmRkVnVNVVhkRVV2b0hS?=
 =?utf-8?B?R0R0TVZVa1FQZHJ3MldGVGZzZisvMWVCeXU5Z1F0WDh6L3F5SmFYOHhkWXVD?=
 =?utf-8?B?VHM1QzlVd2l4Rlg3L3grUmRNdVV5a21nSE54SGtjUHNBQi9wVjF5aTlLZXdl?=
 =?utf-8?B?TUl6K1JMejRtNVV0OEhHSDFMc0NJby9XWWI1UEl0L2IweFUwWndBaHUxeXcz?=
 =?utf-8?B?V0RuM2lzTU5mR3lncFhGUzdSUmxKUTI0aEJkbkRLYldFNmtXQjRTQnVXQktU?=
 =?utf-8?B?eGs1TC9ZRnVjWjFHRUtNOVRxSkNITVptVWkrWG8zUlMrMDhXVlV1aXZ1Tnhm?=
 =?utf-8?B?TVJtemtOQmFxRENkYnhleUY4SVAxb0hycXRHTkt0UzB1dEZEYlBHL1ZmOXBE?=
 =?utf-8?B?bVFSdTV5cXpkYnhOM3QxNDJKUkRSSk1xVWJBWHBOeFBMK014V2NnTksxMmVt?=
 =?utf-8?B?YVQxTy9hNzNWZFJheVBuMmtPamRmWXFJRzh6L3BPOHdnTE1sQkRWWG4rSE9q?=
 =?utf-8?B?TGxhM1BnK2ZEdndScnZoSzJyMUY4RUI3c2FqNFFTMFEyaURnMk4vemtHazFC?=
 =?utf-8?B?ZTZrcE5Ca2w5bEFWTDdsNG4zQ0JrZVNOSVplZW03YlFYV1NiaDZZSTEwZFg5?=
 =?utf-8?B?NjdBb1p1QzhLdVdsOE1RanNBVWJxeEpsWXd5SzFabkJlMS81NTkzdG5iTEZM?=
 =?utf-8?B?U3NPNU5kYU9pcURQLzJKckNRUzdselJzMGYvbjZQSDZFYk5LTmhiYXNEYnVE?=
 =?utf-8?B?aG5pTkZEMmZKYVlpMkx1L0tLRlVISEo3bm9pdTJLYlRaZHIxOUhySjg0bUR5?=
 =?utf-8?B?UjNNMVpsWmc3aFhoUFYzQllNNjdRY21xU0x6dGJMRVlaVFBlWGNXYnpDRGQr?=
 =?utf-8?B?MkJDUDB0YmlXeHA5eGxnSFhDbHJJRFkwalFUd0tzY0sxTDBxcnZmckl5NXR6?=
 =?utf-8?B?Y0ZjYVYySjh5djU4SDNJalY3V1FVazVtSEhMWnRmUmwwYWFWN3c5WjlmVTdI?=
 =?utf-8?B?OTBjbHJjVlR5dTFKemo2MWt0WFVvbGVnallscEJ3WVk4ODF0TnJEYUYzcmRP?=
 =?utf-8?B?YWdDQlhQcGlnNU5rL3FmdXBpeDhsOVltcDEyYkxoZTc3cnhxWS9LRW52UHc4?=
 =?utf-8?B?NUE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 668434dc-1ddc-49f2-cc0b-08ddcf731d42
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 14:12:27.5028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+sq1SzroAGPcs0fikSdYR1sCE2mjmzt6naB+FWxbyZeOJRqG78CU1D8wGZyFuXXAqNTbHeFZLF/yuRl4mLK9bviNo7BYHiCoet5JcL40OQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7359

SGkgR2VlcnQvV29sZnJhbSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAzMCBK
dWx5IDIwMjUgMTQ6NTcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIG1tYzogdG1pbzog
QWRkIDY0LWJpdCByZWFkL3dyaXRlIHN1cHBvcnQgZm9yIFNEX0JVRjAgaW4gcG9sbGluZyBtb2Rl
DQo+IA0KPiBIaSBXb2xmcmFtLA0KPiANCj4gT24gV2VkLCAzMCBKdWwgMjAyNSBhdCAxMToxNywg
V29sZnJhbSBTYW5nIDx3c2EtZGV2QHNhbmctZW5naW5lZXJpbmcuY29tPiB3cm90ZToNCj4gPiA+
ICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL21tYy9ob3N0L3VuaXBoaWVyLXNkLmM6
MjE6DQo+ID4gPiA+PiBkcml2ZXJzL21tYy9ob3N0L3RtaW9fbW1jLmg6MjQ5OjI6IGVycm9yOiBj
YWxsIHRvIHVuZGVjbGFyZWQNCj4gPiA+ID4+IGZ1bmN0aW9uICdpb3JlYWQ2NF9yZXAnOyBJU08g
Qzk5IGFuZCBsYXRlciBkbyBub3Qgc3VwcG9ydA0KPiA+ID4gPj4gaW1wbGljaXQgZnVuY3Rpb24g
ZGVjbGFyYXRpb25zIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiA+ID4gICAg
ICAyNDkgfCAgICAgICAgIGlvcmVhZDY0X3JlcChob3N0LT5jdGwgKyAoYWRkciA8PCBob3N0LT5i
dXNfc2hpZnQpLCBidWYsIGNvdW50KTsNCj4gPiA+ICAgICAgICAgIHwgICAgICAgICBeDQo+ID4g
PiA+PiBkcml2ZXJzL21tYy9ob3N0L3RtaW9fbW1jLmg6MjU1OjI6IGVycm9yOiBjYWxsIHRvIHVu
ZGVjbGFyZWQNCj4gPiA+ID4+IGZ1bmN0aW9uICdpb3dyaXRlNjRfcmVwJzsgSVNPIEM5OSBhbmQg
bGF0ZXIgZG8gbm90IHN1cHBvcnQNCj4gPiA+ID4+IGltcGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0
aW9ucyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4gPiA+ICAgICAgMjU1IHwg
ICAgICAgICBpb3dyaXRlNjRfcmVwKGhvc3QtPmN0bCArIChhZGRyIDw8IGhvc3QtPmJ1c19zaGlm
dCksIGJ1ZiwgY291bnQpOw0KPiA+ID4gICAgICAgICAgfCAgICAgICAgIF4NCj4gPg0KPiA+IFNp
Z2gsIHRoZW4gdGhlIGd1YXJkIHNlZW1zIHRvIGJlIEFSTTY0IGFmdGVyIGFsbCA6KA0KPiANCj4g
aW9yZWFkNjRfcmVwKCkgaXMgZGVmaW5lZCBpbiBpbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgsIGFu
ZCBwb3dlcnBjIGRvZXMgaW5jbHVkZSB0aGF0Lg0KPiANCj4gUGVyaGFwcyBkcml2ZXJzL21tYy9o
b3N0L3RtaW9fbW1jLmggc2hvdWxkIGp1c3QgaW5jbHVkZSA8bGludXgvaW8uaD4/DQoNClRoaXMg
ZG9lcyBub3QgZml4IHRoZSBpc3N1ZS4NCg0KDQpiaWp1QGJpanU6fi9sa3AtdGVzdHMkIENPTVBJ
TEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWNsYW5nLTIxIH4vbGtwLXRlc3Rz
L2tidWlsZC9tYWtlLmNyb3NzIFc9MSBPPWJ1aWxkX2RpciBBUkNIPXBvd2VycGMgU0hFTEw9L2Jp
bi9iYXNoIGRyaXZlcnMvbW1jLw0KQ29tcGlsZXIgd2lsbCBiZSBpbnN0YWxsZWQgaW4gL2hvbWUv
YmlqdS8wZGF5DQpQQVRIPS9ob21lL2JpanUvMGRheS9sbHZtLTIxLjEuMC1yYzIteDg2XzY0L2Jp
bjovaG9tZS9iaWp1Ly5sb2NhbC9iaW46L3Vzci9sb2NhbC9zYmluOi91c3IvbG9jYWwvYmluOi91
c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluOi91c3IvZ2FtZXM6L3Vzci9sb2NhbC9nYW1lczov
c25hcC9iaW4NCm1ha2UgLS1rZWVwLWdvaW5nIENPTkZJR19PRl9BTExfRFRCUz15IENPTkZJR19E
VEM9eSBMTFZNPTEgQ1JPU1NfQ09NUElMRT1wb3dlcnBjNjQtbGludXgtIC0tam9icz02NCBLQ0ZM
QUdTPSAtV25vLWVycm9yPXJldHVybi10eXBlIC1XcmV0dXJuLXR5cGUgLWZ1bnNpZ25lZC1jaGFy
IC1XdW5kZWYgVz0xIE89YnVpbGRfZGlyIEFSQ0g9cG93ZXJwYyBTSEVMTD0vYmluL2Jhc2ggZHJp
dmVycy9tbWMvDQptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL2JpanUvbGtwLXRl
c3RzL2J1aWxkX2RpcicNCiAgR0VOICAgICBNYWtlZmlsZQ0KICBDQUxMICAgIC4uL3NjcmlwdHMv
Y2hlY2tzeXNjYWxscy5zaA0KICBDQyBbTV0gIGRyaXZlcnMvbW1jL2hvc3QvdG1pb19tbWNfY29y
ZS5vDQogIENDIFtNXSAgZHJpdmVycy9tbWMvaG9zdC91bmlwaGllci1zZC5vDQpJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gLi4vZHJpdmVycy9tbWMvaG9zdC91bmlwaGllci1zZC5jOjIxOg0KLi4vZHJp
dmVycy9tbWMvaG9zdC90bWlvX21tYy5oOjI1MDoyOiBlcnJvcjogY2FsbCB0byB1bmRlY2xhcmVk
IGZ1bmN0aW9uICdpb3JlYWQ2NF9yZXAnOyBJU08gQzk5IGFuZCBsYXRlciBkbyBub3Qgc3VwcG9y
dCBpbXBsaWNpdCBmdW5jdGlvbiBkZWNsYXJhdGlvbnMNCiAgICAgIFstV2ltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQ0KICAyNTAgfCAgICAgICAgIGlvcmVhZDY0X3JlcChob3N0LT5jdGwg
KyAoYWRkciA8PCBob3N0LT5idXNfc2hpZnQpLCBidWYsIGNvdW50KTsNCg0KQ2hlZXJzLA0KQmlq
dQ0K


Return-Path: <linux-renesas-soc+bounces-4901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7F8B1BFC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 09:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B48A2286862
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 07:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED013D388;
	Thu, 25 Apr 2024 07:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gGnd/0cu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2073.outbound.protection.outlook.com [40.107.113.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248076CDAC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 07:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714030505; cv=fail; b=LFBFTWXk/WsJX7CjYu9bI5JH7RKXygHlUW1yHXkUpi1c4j8oKzvtSs3T0+zvDVKD25RLPJJdFjYtI9EaTf+mXtYBoQ4rrzMvo+gyAl/tC1fnu45xbmWHTIF+ONcmowV8EbX64DMMKl7BFGgibzpMRKEpdjGMBCmykJMha/MUl6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714030505; c=relaxed/simple;
	bh=Pt3f8+cV4j5WA68QKaEtqAOhaYRDCZbeOkKcA9+6LCE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XOyelQyOYi44AzcK3FrYKw2vEXMu9m8a68ISnBZKxXy0tDSjbc79RUTrvwBAr6mB4c6z73DTADx0/ccX11jh1VT5uTzZ2T1z2IJ9640J23l7wqMn9TxZlpj3CEIo88jTL9tmNyiNDhPpNYbfxGALYswFvU6pfoEBPrD7lNDvWHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gGnd/0cu; arc=fail smtp.client-ip=40.107.113.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AY4hTIHG0XR6IRT+HKnpBGr70eoOCkKOn8G5QvFFgPXDmZhkyZBtGOvuP84uUZhBkgyz76f1z+VrgFrHKTB0b7qjV14uA5Q/pvSuk1RY9YH5h9kDBL2VG9/yBv0cHNx/KtRp43qJndhQsTR1CHzAufgEnl8qDt89KawQnewd5uAjJHNN/cZiPrPRuZl48G6uK42KdWe4fFpIAT4ekGxou5MEZP2NRPFFtsZwuwq1h9hZ5FDq0zFch1mZjPDEjNL+d2GKHomU4+TIVQ2gW7RiMPHSlVx2NUChIu+pvSxTCVIQrhCl3R7YLcW5dTDWS6z/02cFMfyPvdjGBN8gSToCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt3f8+cV4j5WA68QKaEtqAOhaYRDCZbeOkKcA9+6LCE=;
 b=DHE9TsYDgE5muHPnQ1K3PfKEBnClhQhN9uoMQms7JnicSsrizXKnqcmCERO5ZvgxfJHgxud/5mpDitcDduksI3DG30ohOrbfSzs/WLBpg2do+8QnSL+JfmOIBfxYnE0YewjggKP2lbZgA7DuQIsH65Yqlgx/PXX2LJJg/EhPb7kObC4mdpF2iraqixxYyq76EUVSUpStvZ6+7HErlfGrvTWOxZ8S3QztbZx9K9Ckt4TcgqoDxxn7641FITeJyjwJ6O/FtErDZcCd3/xCL3jsfGC6R5jrvoTAi3tomjQw5nHzEHej3vXHlsD0TrFbIgTOUVSJ7iOJ4JIKiGc9LJ1CHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt3f8+cV4j5WA68QKaEtqAOhaYRDCZbeOkKcA9+6LCE=;
 b=gGnd/0cuj/Muq5vRlY44fIhxnD8qolhOZGfwNdDwHcfeQ/I6LIMCqZfKc4uEPazmIm+1WifYR9nDjdAQ3GkKaaWWucl0BPxXgjQM53D5zIr8szTDfO6ZQhLXG3PEFWPm+GaAtwIDfE8z1GBHYfQXJCRhM4b7fhhR4FgWZ51JrS4=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYCPR01MB10412.jpnprd01.prod.outlook.com (2603:1096:400:244::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 07:34:58 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::11c0:4ed:1ee4:d774]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::11c0:4ed:1ee4:d774%5]) with mapi id 15.20.7519.023; Thu, 25 Apr 2024
 07:34:57 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add PCIe Host and
 Endpoint nodes
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add PCIe Host and
 Endpoint nodes
Thread-Index: AQHaawfmK57cBBiUXUysGRhVg/db/rE3WLgAgEGTbwCAAAGLgA==
Date: Thu, 25 Apr 2024 07:34:57 +0000
Message-ID:
 <TYCPR01MB1104036FAC0CB1C53095178A0D8172@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com>
 <20240229120741.2553702-2-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXWsnukKDjfQ4oHsXOVPiF+18odkURGP+9BWp4XN1DU0A@mail.gmail.com>
 <CAMuHMdXGTT9+c_MZpo1jSGD+HHd_Vxr-FAgWmd3EtDMQLm0Odw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXGTT9+c_MZpo1jSGD+HHd_Vxr-FAgWmd3EtDMQLm0Odw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYCPR01MB10412:EE_
x-ms-office365-filtering-correlation-id: c9d9d208-6629-4a94-92c9-08dc64fa3540
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXMvV2FXTW55T0dzY0FmbHY4VEJ4U2FadUZyMEtZVEpMcEhNQ2M4VXpKR1cw?=
 =?utf-8?B?Ym02cDBucHk3OXVkUFNnekUyZ3lmVDRXU0RPOEh1ZWRFT1hCZWp3enhvOVov?=
 =?utf-8?B?TU9mc24vTUJhM1RWcWtCaE1kR2hnSjZuMEJzcmtGWmtvbFFpQTA4ZDMzS1VR?=
 =?utf-8?B?RjFDMUxMUVNHbHhKbHlIR1ZCbVdXNlBPbHNnRVo5c1MzTkNuQmR6ejJ2YzdD?=
 =?utf-8?B?RytwSmNjTXZVM2F6aWZhaWZSTElheEFldkdXa0lxRkpRQ25teXZmWnNFbGZy?=
 =?utf-8?B?Z2s3akpsVThaWjRwNElZNTRMdk1XaFJQZHNpTGJ1SU1lZlFpOVJReEgxKyti?=
 =?utf-8?B?ZmZRVFFEZStQSDkvUzQyN1FRSzZlekJObUVYS2xJaGNldFdjd3VRMG1lZVRa?=
 =?utf-8?B?UG9HQm9vd3Nvb1k1SGxTNzZabGwvNTBMK20zWGM1V1FEc0JsOFg4Nk90a2NO?=
 =?utf-8?B?TVhicnhLWTF5eWdLckg3b2tHOUZWK1JqT2NzR3hnUXJDT0x6QzN5K3M1MWxH?=
 =?utf-8?B?eUI4NHdpSnZGcTllMEJTSCtJVW15c0trNzVLTDIrZFdHVjM1bGFYRUltdUtO?=
 =?utf-8?B?VWJLMjhyK0RkRUU1QXgzc0VpdDNzeTZqcGtlV2p2alcxcThtajMzWlhpaXVZ?=
 =?utf-8?B?MEEwS1FQYVIwYUlWdVFHczFwV1p1RkJPMGw3YWpIZXVyY0xXSUxKOFhSZWY5?=
 =?utf-8?B?VW5jc24wRk81eUlvM2Vjb01oaTlMejArNWFpWnRsdWRDU0d4YUhKamZuTC9I?=
 =?utf-8?B?ZnNLZFhSNCtGOTV1WmlFdzhlSWJ2T3NaRVJXUzF4VjU1aTdzUjlERG9pSEdI?=
 =?utf-8?B?RWY2Y2pxbUhwRFFxSzlrMDViMktxdTNMR3RHbk5lNFNNckxmYnNuRU5QbE1h?=
 =?utf-8?B?OTJtNlZ6dkdIbWZZY3BTa2d2VGNyQXpVZVJDeFYxblhUK0pkRUpWVFVGcE96?=
 =?utf-8?B?dkk5M3BNQlErTm5pRUdIdjRXMjlvQndqKzVGMmpMQzZLcjRLZVlxRnBrdkxG?=
 =?utf-8?B?VDVUek15Q1FEY2MvOFpQajhaL1pLVDViWXptbzdmOVJFd0cyT0pka24xd3Iy?=
 =?utf-8?B?VlVoMlkwc0hPNEtLV3I3dWQrSklIZW1yS2hGRk5LQ05FU2RnOEVRd3BQYUg1?=
 =?utf-8?B?T2VjbGxPbEpsMkpSaEJsalg3ZHJ5Tmdld09QbXdxVVN0Q1VrWWpHV3ViRWFt?=
 =?utf-8?B?WlJhRXlPd3VRTEZ4UGhyR1FKa2FRMVRRWG0wYi8vZDlPN1BFSi9ETzdzakdV?=
 =?utf-8?B?cHN5QWx5akFrVFBOSWl2VzB6ZUI2Vm1WSVNreGZkclFCQ3U2YUdHMktuNDdQ?=
 =?utf-8?B?SkFNUXhkV0VYa0QyVWc3NGRmdzJ4WldFL0Jid2hWQ2gvM29IT1VMdmtLbkFu?=
 =?utf-8?B?NDZwUEUxS09QNEFUNTBmSnVZbE5tbzRxZm5NWHlDOHdrbjNydUt4d1BpdFJm?=
 =?utf-8?B?QmdpZVV2VzZFUlU1M0JQVWRIYTVyWk5MRFk1QUIyOGx5MEpGU1laazBESFRL?=
 =?utf-8?B?NGFGR3FhcTdXR1VET21rVVM4MmRnMCs2aW04MWVaL3hDNEhQbnE3UTJKZHdy?=
 =?utf-8?B?Rkt6T2JZQzlubzVyOXQwRUN1OFpFSkxtY3RlamFCYUpmWkc3eFhTck9XVG9J?=
 =?utf-8?B?SC9nRzFQUlgydDZaY2U3eWFhaGZNUGVKYlhzK0dLQXNCTzFSWk03UUk2Q3Fi?=
 =?utf-8?B?YUl1N0t4cjJhaDk3a0VsMUVrMlBUclJtRllsWWtsdUtyM1FaVkdvcU5laVhW?=
 =?utf-8?B?RjBDRHUvazFPUGlQY1oyVmN5N2lScFZsUWdBMWE2b2VWdnZvandaZ0JWaHBH?=
 =?utf-8?B?RXE3UlorY0U1STR0eXJoUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmIzL1FFNUtZa245SVZLQXpZMVlGSkQwZHJHak9zWmJ0UCtpV3ZPcXVEczQz?=
 =?utf-8?B?S3BaeUVOTHgrSVpvT0R4VERYcld5WElOeWdLY1pNSzB4dVlXdFF5WnNkdkxW?=
 =?utf-8?B?eUlBOG83Y0pQZ2Zic1hiUExJU0NmdER1amwwZmt4RXZMUTk1USsvTlB3UzdM?=
 =?utf-8?B?cDBoTnVYSHB4eVFoY29ZeVYvNG56VmFKMkJPaXVkamNUYjYrdVdkUG5Xc0hK?=
 =?utf-8?B?L2trZm85S2t0M3ZmMGlnUDJHdGZRRnVMcjFicUNKSzV3TE1VREJUN2dZK3Bt?=
 =?utf-8?B?ekZaWU1ZVUhYUTAxZG9FVHJNWG9ySytsczF1WVIzeVAwcEFndjhKczRwelM2?=
 =?utf-8?B?aHo2VHp2ZW83Wk9xSXM1OXhRUmh2bHdudTBQOGNGV3hhTGpDWUNEY1VYOVAw?=
 =?utf-8?B?bDBaN0hsVlhkcHFZVFo4QVMrMSs2eHBRZVdObEdHTm14ZVZhS01ycDNLdVZx?=
 =?utf-8?B?UXNtaWhab25qRWUyMmtrd3ArbWlXNmNBeklhbnZNNEFIWTF6bzBoZ2xRWnFy?=
 =?utf-8?B?MnAreG5YTTZ1dlRKOXNEV1k4ZkcrSy9uUWVTV3NQUnZCNXZSRXRRaUN6V1Yx?=
 =?utf-8?B?S0preVM5K0ZsaVQ5Um94OFB6WHhBcWtRQTFtYzhJNEM0Y0JjaEpUVlNDZFhn?=
 =?utf-8?B?UXNTR0ZxUk81MzVFWktHWlFQMzhZelNUQkgvSUlsTm1WZjBscy9FNTRpYnlv?=
 =?utf-8?B?c1RmYWpCWFQrTkVRdGVzNXcyNWxBUWEzTk9OMmN5TER6QVJuMVcrZUk5dHpM?=
 =?utf-8?B?dXRPUlFhL2cvYnRjNFFuUlRXajhmdzlZRTdNNTlrd2lWWFJoSnBCQVptM0Nk?=
 =?utf-8?B?cFVPYldSQ0JoaVdCNndlMG80TjZVR1BYc2t5Vlo0MVJKK0tZUkVQenlTT3NZ?=
 =?utf-8?B?Zjk2SE0yZTNVQStBR1NSb0IxNmgwZ002bWc5eExGWG8xeTJqYXhFWERoRklJ?=
 =?utf-8?B?Mjh3OFpnMVowdWVBUkhBQXNubDhFZExSWmpPbzN2Q281My83Z09HZmd6NW9r?=
 =?utf-8?B?QTFrSktQVkJNM3NWTFlaN2IyMi84OGFSb0hocGhYTmgwZkozWUhNYzZnNXlI?=
 =?utf-8?B?OUYzVE5JMGFWTlZpOG41bHQwdlpreGxpWlJ5YVZ2ZTZCMDlzbkF3WjVSb21T?=
 =?utf-8?B?UFQwNWhweENncUg1RU0wd1Fja1ppQXpIQXNqRjBOVWZiaUNZRnV2djZ3U3gy?=
 =?utf-8?B?RHJWdkxoR1ZxWFhjRThUTTJtMGhPT1ZFS2MxRHVabTl4S2tLRmNNM3FLU0lK?=
 =?utf-8?B?S28wQkxSaHFnVHVlMW1lMm5DNzRwL0RWMGRpd2psSHR5VUdkbWJVQ2ZoVk9N?=
 =?utf-8?B?bldaeFJEbjRoQUpIbHVPK0lxYmpaQUhLZklrWGVlZUpOUWhhMEpmeVFhRm5z?=
 =?utf-8?B?MEp1eUZtUVpZejRoYm8zRkxqK1hzcmJuY28vVUZWMVZwT294R0dKOEVPcjZ3?=
 =?utf-8?B?czBNdEhDZkozSTlFK01QSmYxK0JGK09mSFdqbXpIajMvM0dQQ0lMZ1UvK05W?=
 =?utf-8?B?djdtaHloVWhPYVpmK3lrTmxtNG85NHR2ekhuY0dOQ0ZYTThBa3JrYUVZWkVk?=
 =?utf-8?B?NVU5Q1RKb214TzJqS0QxN1JuTUltNnR0WmtTV0ovMVhnYmVudm1ucmtBTG0v?=
 =?utf-8?B?QUYwQWoyb29wZ0IrWWNnNmFOM2t1VGNBZ0NreFhFUDhHbUwyMlBBa0NDZkp6?=
 =?utf-8?B?VnlROElPTnFiTkd3OS8rSkNCRHhmSWFHVmFyZ1diTHdmb2xzTnVuZldBSlZ2?=
 =?utf-8?B?ZUlMbWpZb25HQ21JMWdVeVRENk1oVWk3MUU5TDFyRE9lemFGTHdST1FJM3JR?=
 =?utf-8?B?Ni9RZWlQUGtLVU9QTHZaNXRKdVFUZy9mUmowejI4MlpXSnd1Um0wakpIL2Z4?=
 =?utf-8?B?VjRGRG9jbGtIOXAxQWwrTHVKM1BRYUJLeTR2emwwUndyblZoMlFUbklMTHh6?=
 =?utf-8?B?d0RrUHQwT3ZPejZGeGtWemZyVVgxbGJTVGZIT0IvS3QrWUZOL1pldW8vMitH?=
 =?utf-8?B?Nm5nY3lEWGhTSWU3L2hobUltVlh4Uks1alhHQjQvZFRZRmhRVGlZTjg1NjFV?=
 =?utf-8?B?M2U0OUhXcDR6MzJ2bFpOcEM1Ry9uMlYzWTJqWEdETWd3dWlJbDVlUE1rUGE1?=
 =?utf-8?B?bTJVc3dicHB5T3N5YXRYc0M1RlRqVFljVEpSbHBGV0hBcTRvNWNSOGdocndV?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d9d208-6629-4a94-92c9-08dc64fa3540
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 07:34:57.7749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M40Tb9qEXuQ1f4pb68BGTYkgQHrbMTtWkGuhXBxMv4CVI+T3wxDDHyMlLiVWqQ+rinBhD9Np38E3MG46ngZ/c6kSzN2Lra0RGDBac4v6EJ/KFLhuJECmRziCkCdz6GFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10412

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIEFwcmlsIDI1LCAyMDI0IDQ6MjEgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgMjo1NuKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPiA+IE9uIFRodSwgRmViIDI5LCAyMDI0IGF0IDE6
MDfigK9QTSBZb3NoaWhpcm8gU2hpbW9kYQ0KPiA+IDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBBZGQgUENJZSBIb3N0IGFuZCBFbmRwb2ludCBub2RlcyBm
b3IgUi1DYXIgVjRIIChSOEE3NzlHMCkuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9z
aGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiANCj4g
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlnMC5kdHNpDQo+ID4g
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZzAuZHRzaQ0KPiA+ID4g
QEAgLTcyMyw2ICs3MzcsMTI2IEBAIGhzY2lmMzogc2VyaWFsQGU2NmEwMDAwIHsNCj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiAgICAgICAg
ICAgICAgICAgfTsNCj4gPiA+DQo+ID4gPiArICAgICAgICAgICAgICAgcGNpZWMwOiBwY2llQGU2
NWQwMDAwIHsNCj4gDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbWFw
ID0gPDAgMCAwIDEgJmdpYyBHSUNfU1BJIDQxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAwIDAgMiAmZ2ljIEdJ
Q19TUEkgNDE2IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwwIDAgMCAzICZnaWMgR0lDX1NQSSA0MTYgSVJRX1RZUEVf
TEVWRUxfSElHSD4sDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPDAgMCAwIDQgJmdpYyBHSUNfU1BJIDQxNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPg0K
PiA+IHMvNDE2LzQ0OSBmb3IgYWxsIGZvdXIgbGluZXMuDQo+ID4NCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHNucHMsZW5hYmxlLWNkbS1jaGVjazsNCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiArICAgICAgICAgICAgICAgfTsN
Cj4gPiA+ICsNCj4gPiA+ICsgICAgICAgICAgICAgICBwY2llYzE6IHBjaWVAZTY1ZDgwMDAgew0K
PiANCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1tYXAgPSA8MCAwIDAg
MSAmZ2ljIEdJQ19TUEkgNDIzIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwwIDAgMCAyICZnaWMgR0lDX1NQSSA0MjMg
SVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPDAgMCAwIDMgJmdpYyBHSUNfU1BJIDQyMyBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAwIDAg
NCAmZ2ljIEdJQ19TUEkgNDIzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+DQo+ID4gcy80MjMv
NDU2IGZvciBhbGwgZm91ciBsaW5lcy4NCj4gPg0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgc25wcyxlbmFibGUtY2RtLWNoZWNrOw0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
c3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiANCj4gRG8g
eW91IGZvcmVzZWUgbW9yZSBjaGFuZ2VzLCBhbmQgcGxhbiB0byByZXBvc3QsIG9yIGNhbiBJIGZp
eCB0aGUNCj4gaW50ZXJydXB0IG51bWJlcnMgd2hpbGUgYXBwbHlpbmcgdGhpcyBzZXJpZXM/DQoN
ClRoYW5rIHlvdSBmb3IgYXNraW5nIG1lIGFib3V0IHRoaXMuIEkgaW50ZW5kZWQgdG8gcmVwb3N0
IGEgZml4ZWQgcGF0Y2ggYWZ0ZXIgUENJZSBwYXRjaCBzZXJpZXMNCndhcyBtZXJnZWQgaW50byBQ
Q0kgc3Vic3lzdGVtLiBPdGhlcndpc2UsIGR0YnNfY2hlY2sgd2lsbCBkZXRlY3QgbWlzc2luZyB0
aGUgY29tcGF0aWJsZQ0KInJlbmVzYXMscjhhNzc5ZzAtcGNpZSIgaW4gdGhlIGR0LWJpbmRpbmcg
ZG9jLiBCdXQsIGl0J3MgdW5kZXIgcmV2aWV3IG5vdyBbMV0uDQoNClsxXSBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcGNpL2xpc3QvP3Nlcmllcz04NDQ1MTINCg0K
QmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBUaGFuayB5b3UhDQo+IA0KPiBH
cntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+
IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K


Return-Path: <linux-renesas-soc+bounces-15198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE8A76AD2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B522B165838
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164F62185B1;
	Mon, 31 Mar 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oOBQYVh1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011019.outbound.protection.outlook.com [52.101.125.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B993BBC9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434767; cv=fail; b=GlAzw02Z8zarqfYtNibhakOYvanlGYopcoGcAtWYzGxJfEifTRkpaYe8MEQwQPA40B10Iqhz1jwC6FXo5ykp4vIISvE1dHcXM6/rt0dTi2PVQVMf/QDJhRNPAybKEtZlF2xV1r+eTFV5khDwohDSsYIlU+BKPMkaiZVv8DQa4FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434767; c=relaxed/simple;
	bh=ZMgjXZnht0ImHnHRqdc3nA3WcVq2+IerM6WPcxiOON8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hrAV7c67SysGhKLD3SXELJPe24qunb9GvfjiiQrqAfffmkjC3hyho96hexK9lNsCbFPZU2FJpI3Qw62CO3IkVnJoOFVkrb2Svu9XOhZsREEXoWZ5O/tLpqJh5HZ18XHnIQIsevEUuEvAlI71JQfwwV39BO29s9GaQekVpYknsaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oOBQYVh1; arc=fail smtp.client-ip=52.101.125.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6Sr/lalMDY5RCiDFHpKV1Ui0+oTcEQacPd17HdqeMGCmPkq4ClhD43Zv+b0CYqC2o9QL91DmWokJfSw7IiDSQBRXn+XMoK68NLnPEMOw5a0qo8Ef4qjkTBC8nL2K6pUcXIZY+rq1XThgfgTePWg7e1AXXuGvp5MKxD1NzeC8kTg/CT4kRfwtZVC3czvNVyMB5MJkEEs1ibjCXUv69IpRbhjSUsOMRQGFRUsysbTNNt6LOfywqb1Q3KO9IHCvINOql5MY5hwkgt0gZK9ut5PCHpjDB8tSoWbc3/dEsFz4LZMS23Pox8VaI3MT1oJ830Cp5MAWqggLHS+g/Porda0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMgjXZnht0ImHnHRqdc3nA3WcVq2+IerM6WPcxiOON8=;
 b=WFdCgm6cOFq4Y9bL+2AfroVXyCsViqR61koks07aNzNrVXiCDlzxW9OqRXjeH6MhT9bXZfoCni5SVioQ/Dsrb+x8JOBBBmjWoFvJsU1+GaVGF4GG8ZsvWUYiwuDwSgAEqn5eWtF1ZH/SPeb9B/2sc77mgefT9isUOChE5y5ehMww5C0/lhpSsKZiEt7SHjnle1kYDPLCqTwJBS3ZWnMjeiriHF6nyG7x3xZQYpMpYh1L3ILn5zUjLXGnt6Yu/GeQooK56T5g9EnQJkRyB81HrUknMqUgAHniHos2T+pby1BBFM5WnBQGuWF7sI24/WPREkcJCFmrn+V58AVQeMs+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMgjXZnht0ImHnHRqdc3nA3WcVq2+IerM6WPcxiOON8=;
 b=oOBQYVh1MM6RJ4pBvuGLCMn36hy46YpDpZo/RjPkHOoj84iFSl09P0+fbHI7m25xQAQ1F76zw6IGUZYMTh0xPehIZ2sUtHd5341nJ0U7vr7USTIhe9jXa90P21Pmtuh/zTofKBjjIIAvlgS47y4iIMWmABf4MdhFAmZD317nEOQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11177.jpnprd01.prod.outlook.com (2603:1096:400:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 31 Mar
 2025 15:26:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 15:25:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Prabhakar <prabhakar.csengg@gmail.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs by
 default when ARCH_RENESAS is set
Thread-Topic: [PATCH RFC INTERNAL v2 1/4] soc: renesas: Kconfig: Enable SoCs
 by default when ARCH_RENESAS is set
Thread-Index: AQHbn08iM6VwmqpspkW3kmRobnuFALOIIghggAU/kYCAAAG5cA==
Date: Mon, 31 Mar 2025 15:25:53 +0000
Message-ID:
 <TY3PR01MB1134616BE4AEEE7C252BCB2DE86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250327193318.344444-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11332B9F7292BEFFA29547F2586A02@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdXyb=iKoRBicAf4J8a3Zk=ciRNTtB_+k60xjciReMuv5Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXyb=iKoRBicAf4J8a3Zk=ciRNTtB_+k60xjciReMuv5Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11177:EE_
x-ms-office365-filtering-correlation-id: 8ff3b612-6c57-4eb3-f09e-08dd7068536a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MTVQd3IzU1lubFpmOE9uMlNoUjVpeGNNWDRsODh5dnhMRkNYbzFiTEpNczRX?=
 =?utf-8?B?WGJiWWU5Rk42VjRkNGdsbUYzNUpsSUh5aEJiNjlDc2J5OW5vK0d5TG44UU1k?=
 =?utf-8?B?OVhIMmpqbHVsalFCZngzWVNPdVNYU1Z2azFlU1ppVlNFaGx1YjJaM2JvY0p2?=
 =?utf-8?B?UFNob0NDUnRwWXFYdW0ySGZwYlBFakJLM0tObys1am1lS3VvWXJTR3B1Ukxa?=
 =?utf-8?B?UEI4VStNeTg5WlNSUFgyUDd4aExTbyt2Z3RPWnBiMk9QMXNOL2JzcDltbHZv?=
 =?utf-8?B?Smd0dWFERXNIaUUxbnozZkJkNFM4QTZnanhyQmppV3VNMmpzY0d3UlV6aEtW?=
 =?utf-8?B?MHJxQ01RaUtHVDJiRE5LdzRldWRJRHhQNHYyYlpkYjBaUnNDZXFNVUVUZm8r?=
 =?utf-8?B?a0dRUGxyUTFBN3BUZmZReUh6azFka1BZT3V5QUg1dkhtcTdqTERnUWR2WmZ2?=
 =?utf-8?B?aVNmb2pzSHkvbzFVeWlCS3RJNzlpdGU0TkxSek9VQkFobk5vdTZpaFJqVWl0?=
 =?utf-8?B?M3o3VlcxY2NOT004QjRXMmtIY0dTeXR1V1lLampGTnF5TkV1K3VpbklKTlE0?=
 =?utf-8?B?eEw4QzVtVytPMHVjL2ZwVWxFV0NOR0RWNUxqSXJ6dE5DWU1XaFN0YjdTS2xO?=
 =?utf-8?B?emczK0NjRkNQWVlNMndKRTlsQytxc0p4UGVzTjdEV0lVS0tDNTUzV21WTDBV?=
 =?utf-8?B?SUZWb1AraUNJM0hXQTRqb05CbDhhRFFsdlA3SjdldUdhT2ZtWnpqKzlJbmhV?=
 =?utf-8?B?S29QRE5yT01teUNhaWZMNC9PSVUrYk5QTHdLWUE2Y0xheVZQM2VKVzZhL1pv?=
 =?utf-8?B?K3FLazIvNCtuTXE4ckcwaTVTUXFMSDJ1V3BhQTVGVnBpKzJVTlhxdkpuRGZO?=
 =?utf-8?B?R3dETkZpR0Q3S00reXJBdXYvZDdiQk9GK0I3TWx3MVE3d29hWkt1NHlYNjdG?=
 =?utf-8?B?b1luOVBGVDFKaWNWbHYxcnoxRWdqOXFVR281QVhPSkhLOU9qbTFpRmVxZjhP?=
 =?utf-8?B?eVErZ3Vqd3B5elVxQ29ZdHFKTHhvbXRESUNyTkEwZkJIekdVT1JZVmNZSTNa?=
 =?utf-8?B?S0RIRU9tWitnSENORGIrYlRJN0p6TmFtOXYxQmVRc2h2VjRkYldtSkpBOEty?=
 =?utf-8?B?K0xadVRwT3JOWGdIbWE5MHFTblhwTDBvR3JQeDA0NVhjNElDY3pVbXZOVnls?=
 =?utf-8?B?SzJlTnlSR3ZwNnhPOTU0cmRVWVl6M0MrRGE5NjB6a2RpUStBVTU0QjlqeFd4?=
 =?utf-8?B?ZjJ4VkdXdEhxcUFYMmdIeVpEQ0l3cHJVNXBxVDh5OEk4QTdkWXVsSUR2TXQ1?=
 =?utf-8?B?OFV2Y3RTT0ZoRlJicDZYT3N1UDFuc1FPK242YVlIeENPYnowVHQ3YVRTYmNy?=
 =?utf-8?B?c1JjTVJLT1I2SlcyU0ZTZ1lBKzViUmtwSllzSDJtT0wwdEJxcVF5MVg5NnRP?=
 =?utf-8?B?bXJsL0NsTnpHbHo3bW8rRDMzcUptVlJvOTBFU3BiRUhKc0ZVcFlwNGhZeURl?=
 =?utf-8?B?S1ZpdWVNdWFJU0l6VUQvRXRMZEVRTzExWCtZQmZLdGxLeDdpYmNVNmRvQzVG?=
 =?utf-8?B?ZGhHNHlianF3MWJ4R1p5UWY1TGYwTmdOT2JnbVBiUzhoSEc1bmE2WGF4SXRm?=
 =?utf-8?B?a2xYMDhWRGtkTTVxaU0ydVBNbXhvakx0TUN3V2tWdkVMVEh6cHlxSEpyb1Yr?=
 =?utf-8?B?ekdaeVh5bkNYa2lOa1V3MDNFMmJKYS93Q1NIYUpDV1Z6Y3lqN3R0Y3VZS2Ja?=
 =?utf-8?B?TzJHVnJQbWE2RUtVVEtRT2p4QkV2RnRvc1liYmdBRlZZT243aThmYTZVSFZ4?=
 =?utf-8?B?amVOODRZL2hmWC9GZXdzRUFaVjd4cGg4d3J0NTJOK00vUEtEY1FLQ1FHNnY2?=
 =?utf-8?B?bjNUS0VabU53RUdxeVhXaVRjWDNYWldTZlZSdGlOR2cxcjRZemVaMUwxTVJ3?=
 =?utf-8?Q?tnJCHnb9h2k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEhlb0p3azdROW5sU1RjcjBLT2hZRkJmNFZrT000aC84VEZVU3JzV05NQXFh?=
 =?utf-8?B?WWNhTDk3UUVPNWwzYmk1amZaMUluUHZEWmczNlYxdjVtbG82aUt2WW5OaU0z?=
 =?utf-8?B?bnVkS2c1MUg2OE45NUFZQmFUYmVJcWl2bnZSa210bXdZcHJIRDV4S2tpQnpp?=
 =?utf-8?B?VHdYQ3gvOTNpYm84aHZQamRmMllvUS90ZzltZFZDRVc2WW84S1lQcDYxZ1dB?=
 =?utf-8?B?OTV5bkRBeFluTGhLSFVrNDBUbXIrRXA1T3V2UGNTUmhSNXYydU83TEdFcGRV?=
 =?utf-8?B?cmwzV3lxdXUyNysxa0hvdmNzU3llSXZrMFhSQzhwYm5iVVdLc0VsSk8rZGlo?=
 =?utf-8?B?bExja296dGcyT1F0Vk91WlR2VVBPZVpmNG96d3YyU3ZXeDZEYklDVTFnUEtZ?=
 =?utf-8?B?RGdJZlNMVG5ybVpMdEhUSzBHZFprLzNkRXhFajU4RHhJSi80bmxLc212Q1M1?=
 =?utf-8?B?QW5xV1YxYmV0L1g2cEN1Zndjc3JoTDE1UW5VZXRLZS9rdzB5THNkNjV5RFVZ?=
 =?utf-8?B?ekhxTG55VzVQYkVzSm9QajlBRzB2aXVuUzV4UFhMczZ4SUVMc1R2elJ2NFJW?=
 =?utf-8?B?dG5NS0I0THE5dXc4Wnh0NjM5N2FjRk5ERC9LcHFjTW9Xamhwd3NwSmxQSFZh?=
 =?utf-8?B?eXY2eTFCL2d2WFdRWTQ0VnBRbTRXMGZhVklPV1ZKdW9GZnBCdUc2YnR5TDJq?=
 =?utf-8?B?RC9nMnJJODd0UUNnWlQ1czlaRVg3NXZhL2xwYThMdENlV1RveVpWdldlaG9T?=
 =?utf-8?B?cGpCbHdVejJrNFdNSHBEOWU5TXRueVZ5ZjdHR3BETVEyb2hudWVIUzcvbUdu?=
 =?utf-8?B?bkc1aU5WSUJTU3kvMW0wcmx5Tzh3TEZqYWRuK2NRNEdhVzRPY0g0TVpsWG1r?=
 =?utf-8?B?R24vbWUyRXlvZ3p5eDlQeXd3NTFGN2hZZjM5RW4zMU1WSXhRT1dqNks2V2pN?=
 =?utf-8?B?S25hdWZQbXhlTVZvMTQwZnFFd0w2UzJWYVdGU2xzdUlWSGJ2NDRFQXZYMHpY?=
 =?utf-8?B?ZTNSRmpMcm5yOE0zUGJab1dMVkhtdFp1MUVMWjZOa1dvQm9YenNKOHFZVmI4?=
 =?utf-8?B?TXptUkgvUFpXcGxqbi9uSm5BeU12em0zNWJvQ2d4M3V5Z2xxSUJWbmVVOWM0?=
 =?utf-8?B?T2Y4THg0UlJDS25PRm9DZkhPdTFDOGF6eEgzSDlXbE1lR2pHUnlKR0FHQU1I?=
 =?utf-8?B?UFNVcXJEb21Vd1pTUkhJY2NkaEIyL1BrZUNZS3MvRUFuUDByVkRFV3gydDBJ?=
 =?utf-8?B?SzlNN211RWxxVVZEN0Q2U3dqbDhXNWxvY21NNHQxU1MxUEZYVm9vUk9hNGlG?=
 =?utf-8?B?azlGd3ROREVzWCtBUFBUMWhIMEFBNWVRaHkwZGVXU0hXb3hFWWdCMkh0THVu?=
 =?utf-8?B?M2FGVW1VWjlrVlp5elNnRm5FZzRJVS80dHJoTkhOZ2swbWpwNnBaY0hHdDVa?=
 =?utf-8?B?RHMrdzFzeGozaEgwWnBNS2loOURaU1V5STV2clhZYmRFd0ZuS1Bua0F2ZlFH?=
 =?utf-8?B?QnlVNzdHblRjZ1dEakY2a3BETGVGNklRS3hXMzhLaGJlRVhENjhqb3lzbG5F?=
 =?utf-8?B?VnBrRC9rSm1tT0g3KzB5SEtpU20yWmhkaEFNSkRsYnZXVnlzUWpxeGs2dmJ0?=
 =?utf-8?B?Sm9sdVhmSGQ0eGE5aU91V1NXZDZrY3piU2FJdFBkN2JCNCtyWlAvWU1xN3dD?=
 =?utf-8?B?RFJqelRFaFFSd2tUSEM2KzZEMjl5OTlJaWozRVRBQTdjRlJTVElHajIyempp?=
 =?utf-8?B?UVNuQlg5TEpnOVFmRmdyNTB0cFkrdXlzVE5zYVNCTmtSZWtzVWF1UzdCSEMv?=
 =?utf-8?B?T1ZGQlRtbHdpU1graHVQMTZxWEpPSnNZeHNYNndEdVVsQWN5aU5QMWtPMndk?=
 =?utf-8?B?QytSRWcybjlkTUI2MEU5aGRVTmY2VGExeEhZU2s0U1BLZEZveVRHQ1N6bUNk?=
 =?utf-8?B?clgyV1JtRUxtSVo3ZTZSbWJQaW11UjVGRjQwQlQ1bzkzQlQwcVpzQnNVTzAy?=
 =?utf-8?B?YVBtTzN5Qkt1VjF6TExuaXQwTjZmaTlvREtMZVB4a2JnUElVakZZN3p1dFY5?=
 =?utf-8?B?Z094d2p5NEpvSWlhQkJ1U0ZPRXNQTld3M250SmFrei95MlVDN1JmZUF3WXI4?=
 =?utf-8?B?enZ1TmxyQ0JKUm1XR3U2YUx5dGNOdlE0UERrSHhwUTk2YjVvV2lXMWlCYVlI?=
 =?utf-8?B?MHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff3b612-6c57-4eb3-f09e-08dd7068536a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 15:25:53.4655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ROvcmyXXLP+xCd27vHOSn897Zpjogq7HghECaTfbJXPrKvb9UiTVf7pbNifo1k0y7c2I7e/Wo2tBylXGiEam2HnbyMkp3NIDv27GW5TEnQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11177

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMzEgTWFyY2ggMjAy
NSAxNjoxOA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyBJTlRFUk5BTCB2MiAxLzRdIHNvYzog
cmVuZXNhczogS2NvbmZpZzogRW5hYmxlIFNvQ3MgYnkgZGVmYXVsdCB3aGVuDQo+IEFSQ0hfUkVO
RVNBUyBpcyBzZXQNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIDI4IE1hciAyMDI1IGF0
IDA4OjE1LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4NCj4gPiA+IEVuYWJsZSB2YXJpb3VzIFJlbmVzYXMgU29DcyBieSBkZWZh
dWx0IHdoZW4gQVJDSF9SRU5FU0FTIGlzIHNlbGVjdGVkLg0KPiA+ID4gQWRkaW5nIGRlZmF1bHQg
eSBpZiBBUkNIX1JFTkVTQVMgdG8gdGhlIHJlbGV2YW50IGNvbmZpZ3VyYXRpb25zDQo+ID4gPiBy
ZW1vdmVzIHRoZSBuZWVkIHRvIG1hbnVhbGx5IGVuYWJsZSBpbmRpdmlkdWFsIFNvQ3MgaW4gZGVm
Y29uZmlnIGZpbGVzLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIN
Cj4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+
IENhbiB3ZSBhZGQgdGhpcyBjaGFuZ2VzIHRvIG5ld2VyIGRldmljZXMgZm9yIGVnOlJaL1QySCwg
UlovVjJOPw0KPiA+DQo+ID4gU28gdGhhdCBwcmV2aW91cyBkZXZpY2VzLCB0aGV5IGRvbid0IG5l
ZWQgdG8gcGF0Y2ggdGhpcyBmaWxlOg0KPiA+DQo+ID4gMSkgSWYgdGhleSB3YW50IHRvIGRvIGEg
c3RhbmRhbG9uZSBidWlsZCBmb3IgSW1hZ2Ugc2l6ZSBvcHRpbWl6YXRpb24sDQo+ID4ganVzdCBy
ZW1vdmUgdGhlIHVud2FudGVkIFNvQ3MgZnJvbSBkZWZjb25maWcuDQo+ID4NCj4gPiAyKSBEZWJ1
ZyBzb21lIGlzc3Vlcywgc29tZSBwZW9wbGUganVzdCB1c2UgZGVmY29uZmlnIGZyb20NCj4gPiAg
ICBkaWZmZXJlbnQga2VybmVsIHZlcnNpb24gdG8gdHJ5IGl0IG91dC4NCj4gDQo+IFdoaWxlIGRl
ZmNvbmZpZyBmaWxlcyBuZWVkIGFuIHVwZGF0ZSwgY29uZmlnIGZpbGVzIGRvIG5vdDoNCj4gcnVu
bmluZyAibWFrZSBvbGRjb25maWciIGRvZXMgbm90IGVuYWJsZSBzdXBwb3J0IGZvciBleHRyYSBT
b0NzLg0KDQpUaGFua3MgZm9yIHRoZSBpbmZvLiBJIGhhdmVuJ3QgdXNlZCBvbGRjb25maWcgbXVj
aC4NCg0KQ2hlZXJzLA0KQmlqdQ0K


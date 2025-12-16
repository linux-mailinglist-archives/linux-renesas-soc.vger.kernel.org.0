Return-Path: <linux-renesas-soc+bounces-25792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E7CC34EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 14:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2655E30D0F29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Dec 2025 13:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F07736D4EE;
	Tue, 16 Dec 2025 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Fq86zaXh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19136D4E4;
	Tue, 16 Dec 2025 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765888019; cv=fail; b=YSOsOXl4AgDbDkHWcAWXpISknpMVriMD4DDCpFtMc6RtppVZQv3AbO7sasljLutjbK+IwZ2QBqb8avj5fqy0ViDIHSPlC3C96HXlQAJDwq6y+MpMpwwqGr6BNDXEj8WZ8Qs3F7W35etxNtw893tarhFUtuUVoma9yQ5B47idHUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765888019; c=relaxed/simple;
	bh=wI5APhHC7wBYunajAJNT+MRdzQIT8aJ2EYgGHbiAOXA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k8VZUZ6ck/YstyMWA9faeS3CyjT4VEWS1sG7TCC4T2Ok7TKXQsFlBln+isEsXjcDRBZmaQgA7L0NL6Th+WiVjp3IM0B3832ctqQwt+hbaovR73cwWpy1SGujChG+Ch5b4MZWhaHL/uC2uvHcNX8wXRyDcjyRu+eepRTU5+lPc5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Fq86zaXh; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWopdSJtDLYp2VfrHZQ8jw3NFyP68aZQ1Z8SuYiZdja2D7Pr8zwYmoViufoKCI8yjponS9jX7eFslUIPCG6fss2DDUqj7qYaAO0ttyQab7xba/QDcPu6E/SEdLQr15HjI3GJyzDdxUMVFR8rwS1cfqzR/5lddxN2twFgFMx4u4kRtks+HOxJVi6CIqoXFuQpStZVfJnIHlLWO31VML7MIs/z2Bj7A2WKWeWtXy396s7WqKvX44P0/rqhMRNNiz2eSpZVvNNx73+pi3JpGhcxL8rRcvkMv4W13kMGngvlIOQ2dVn7NyswA8TH5cvg5PjqEMlZeYiG9yYgWhzvdlL7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wI5APhHC7wBYunajAJNT+MRdzQIT8aJ2EYgGHbiAOXA=;
 b=O5Ib0AHjrKsGYxBYHuOQl9m4Y6IFu/jBFuL/vsrHwrXyY9LzyNn/myhqBOY1QZBu0BxVsxBTHCE8xCWbDikRiq6DUFZDbTcG4BNi8tIVolJ3PYdXO92qVds2/DNlqJZn/5l84XEDmAYf+bI6KGBh38vDaWL5WdaizzcRwkJMdTkMZdfDwWp/i8WZNNIPX78tHn9YaghA+9jbwvHWr7s5Fn1ZSFNdGvt3HhSEJnylwONYW5ks0WYuWx+7HoDCVG7to/V7m/V2IKtDc6XBSgdnCYpMQhnkYRKf0mBPQX4uaDwKe7IP0JcJ3UG+ZCF4Eb+4l0nbb/G1QLMQccWRCQ1p/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wI5APhHC7wBYunajAJNT+MRdzQIT8aJ2EYgGHbiAOXA=;
 b=Fq86zaXhlyRAflD2EUMfWLsZmCwJcieajaBGfil90hzTkJO1na9KdPoggGLeBJTXijQ4Z3/NVEmcHi3eSUFzrFmynAF9Jy2PxJOURs/xSv+fOj961p0G3I9TigZualRS6AgAXnZB6rRb3XVxMWI7B5vGjmSeTPXx9hVSKKGfwAk=
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com (2603:1096:405:1a6::6)
 by TYYPR01MB8046.jpnprd01.prod.outlook.com (2603:1096:400:f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 12:26:52 +0000
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29]) by TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29%7]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 12:26:52 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller
 (ICU) driver
Thread-Topic: [PATCH v2 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller
 (ICU) driver
Thread-Index: AQHcYrXo3jQpoW43Zkew8CkKV+1oH7UkPjcAgAAJppA=
Date: Tue, 16 Dec 2025 12:26:52 +0000
Message-ID:
 <TYYPR01MB139550D01768B025E402B683D85AAA@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251201112933.488801-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251201112933.488801-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdWY7QLfag8szj24Oo8ghfZn84msRHREAvrB_A2inA7WrA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWY7QLfag8szj24Oo8ghfZn84msRHREAvrB_A2inA7WrA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13955:EE_|TYYPR01MB8046:EE_
x-ms-office365-filtering-correlation-id: 7ae9ee77-7ddf-41a8-51c7-08de3c9e64b7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UiswbnRQRGhwVThYeSt2ejJNQTMybFZuTjJMWFNYUHZDSk5VTmdPN0gzUTk5?=
 =?utf-8?B?RWhCRVpQejl5RzFtUlk1K0VVVXUraTFtVGtqWjBjMXBCazFkWTd1dnJiTVls?=
 =?utf-8?B?cjFrdkYyV0l5Y2xDOUtJL2s3UFpXaUNRanZESGxlRnFUSVE0V0o4ZWhXRFlD?=
 =?utf-8?B?RE1PbndmeHlUK290YlhmODNWUE9CY2VOVFUxMFFNeDV0QW9OTzdaRjZ2dVRL?=
 =?utf-8?B?Vk1ucFhlQkZqbmJwNCtUSzhrMFhkMFZpQjU5QWlrVFF0cnBKODRMclRHVFFP?=
 =?utf-8?B?NmdsbUc1TXBhLzJKSXFoOHdZRkhTbUdMN080Vm5Jb25KMEp0NERtbkNjWGJn?=
 =?utf-8?B?U2hnL0ZjMXNhT3hTdFZCVzJraExSOW1BSzVGNWlWYloxWmF6S3NuRytqSy85?=
 =?utf-8?B?TGhPS05idGN1TmhYZWtNMUFrWGtONnV6L1kxRUZ4YTRRTWdyLy9lNkxXRVRQ?=
 =?utf-8?B?NWZiRU5yVC8xaDZ0dkEwQ0oxZVM2blVWSExhWmpGMm84V1ZMZVRxNW1SS2Vl?=
 =?utf-8?B?U0ZGbU1lUjRvQ0xmSDc2Y3laZ3kyeENIY1NQdmhuVVI4ZHR4YXdXbW9FWmNi?=
 =?utf-8?B?ODRkMk1jamhFUUFYTnZOZ0ZjNjFYOUxMenowN2EwTElVaWZmRUtrQ0phdDhZ?=
 =?utf-8?B?RTAzMmN2TkNJRDRhdkErRTBEUUlhSUJJYkpua25TN1h2bmlUWnZydkQzczRK?=
 =?utf-8?B?K3RvVEsvUXVIdzNkeENrNHBjdndlLzMxcWpSbCs2dnV3Qjd1Z3pUWTVMM3NT?=
 =?utf-8?B?Qjg2cEJQSkUwRHlSWkVaTEFkc2ZRWU5EQ1c0aE9BMFlGUVpVZkUzQW1MRlNS?=
 =?utf-8?B?K1pmNE1ndWpGdkdWSmR6YzFXbG1qZVIvVk93ZzhTV3F6OEIzcHpkalNvWjI2?=
 =?utf-8?B?UmNwMXlMN1hoU1RpZXVJUG5aRXJYYS9Wem1oL3dmdGZwTWl4MkFpN3d6UHZD?=
 =?utf-8?B?cXgxM0ZHZW9OWkxWMlUzczVkVGRiRFZuMzVVVmdPOXVtY3BpdzJhZkp5dTJ4?=
 =?utf-8?B?ME45dnBFUHJCMGFOZGUwSHhmM1pBU1lqNVMycDlhUTd6ald1bTdoeXRMTlF1?=
 =?utf-8?B?U0YwZkVPMHBuSUE2THcxQmlSU1NndGRVbmQ1MGV0QmZjTlhBMVdDaldWR0FY?=
 =?utf-8?B?MHIxN3lCQlpYcXl3Szh1LzdHQUxGMm9yWkU0S0R4cHY4amFudU40WVRiRXdP?=
 =?utf-8?B?MGxRREFBMXpNQ0UvVERKWTlSaWZsWDdLV2tZa216TEFCbEJrZW9IcDFYckZM?=
 =?utf-8?B?Mktwem55ZzRjcGo5R1NyTnNmL1dnTnlmNWR1cTVqUXRGcFhSdFdYL2FTOGZ4?=
 =?utf-8?B?YVI5cEptb0VlRjd0WlRVTjQwUXMzYkVEUG9ndnhlNzVaVjRFcWRUc3NSZXdJ?=
 =?utf-8?B?c3Azdm9WVFdCdVRja1FpenBhTDIxZWEzOE1yazJpTG5seWIxNFFCRWkxUFJ1?=
 =?utf-8?B?Smx0bTlIOTRuZThhZ3dEVGdnc0loTjlmMlgzR2RTeDNlN1Y1V21va0lkRE1T?=
 =?utf-8?B?K2VTc1M5Y2lTNmlkZEt1eDNzdGtEbUpXU1o3RG9pano2N2ZOdlVhQnkrd1RX?=
 =?utf-8?B?Z0dpdmo3aDRNS2ErbXNtRWFZL2xYbjBtT25OeG1hc21RT08xSzFPcTgrekxY?=
 =?utf-8?B?cW9vQVM4Q3h1MkJ0dTlZa3pVRUJmL09DMW5wTTlwZ2FwRWJQbkdUdWR1SVlL?=
 =?utf-8?B?czA3QVBZb214Nm1lVHVlWE4wanFZTnBkUFdGOWtRME1janIveUM5Q1BCazVW?=
 =?utf-8?B?RlFKNHFhNXJmN2RsN2VlUXJVVG1JaTdtK2loYVUrRmt5WUlub1lPdW9oSEhn?=
 =?utf-8?B?cHIySnVWY3NvTWZzKzBXMUxDNmc1L0pGNmRuVXpPM0hWM0xaYzlwQ2h4VUlL?=
 =?utf-8?B?YnF6QU9ObG0wY0wxRHBIY1pVV2xMUzIrbHJaYnVwSGVmOWdkUWZYMGRiSGdS?=
 =?utf-8?B?RVFnN24rOU82aVBxc1pGQUJYRVhrSWFKZ290LzVSYkhDWFNORWFZR3RyWncv?=
 =?utf-8?B?WUlSbmRBTzR2MWhuUWE0aFI3ejFDZkcvdTRmV0M2MGoxcTNuU3dpRnZ1YXFs?=
 =?utf-8?Q?4u5y6D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13955.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmVQYm1Da0FmVmVWOC9uWUxsdnNLMzl6TG5uOG1DYnFBNXVyWGVxcEZqdUdn?=
 =?utf-8?B?SUE4VDRpNkRFLzZ6Wkc5UER4MFVXRDRUUXZxRlRtLzBOR3BOdisxdUxaRHlH?=
 =?utf-8?B?bEdUVGRES0QwN2FqRFpqMmFiQU9LYlUxRVhLUkhxZktkUy9jd2RhOEdnZ0o0?=
 =?utf-8?B?c3FSRjJuSFdUT2VDb1ZBaTRJQVN3aEJZYXlpK21ESjdFUVlZY1RvQ3pGQ3hC?=
 =?utf-8?B?VFlPMVQ5QU9yaHlEV1NscEFPR2dpc2U3SHljblV0RUhqZklHN2I3TVpTbkFC?=
 =?utf-8?B?ZXorNEhDZWVPbVloUUxScFZlMmt2dE5OaVBaUWxQK3lrckJia05lRDJXZitJ?=
 =?utf-8?B?QWs5TXp2V2pLc1RQVklsaysyN2YrUjA0ZGlpZitRZ2U1SXZxRmxwaFhwcUVo?=
 =?utf-8?B?WjR4Z0FpdHFjQUtZQ1lYU1hoc2JucVhIRFNjL0FTRXgyVUlWeEg2bHgrTUtk?=
 =?utf-8?B?QVM2TmJWVzU1ekZpV040QWxTQ1VCNHNsS1FEaEovaWdKaElka1g5TlhGMnow?=
 =?utf-8?B?aWZqeUUrUXNmRUloU25TMVhYODl3MGEzZFhwSmhIRERpYmp6ZmlCQ0N4TW9I?=
 =?utf-8?B?R2d1UXJlSTl0cG94MUk4d3B4eFlmcVBxRCtseVErcko1RFYvS1RwRHkreVVF?=
 =?utf-8?B?eW11aHVIcysrNGZpNFpFaTFQR3FUaklOMnJTTnFHaVVqYjUycEt1ZWFtL3V5?=
 =?utf-8?B?ejZiNGpidmVLVkZJRExnQ2xwK043VElvMkxoaURYMzU4ZzFJOWN5TWgrMS9T?=
 =?utf-8?B?dkc3T2p6UnEwYXlJN3paMlFzdUU5WXliTmNzVzI5WWJ0K3FTT0pYUzVaakdv?=
 =?utf-8?B?MytkWXg4Sy9NbVFvRDVtOW5Yb1p4VW5SQkttQ3RmTjZXdERCdURFOG9Cd3BT?=
 =?utf-8?B?VmtIMENaRC8yZ2IzODRTaVVOakg1WEJFeTJVSUxQU2tsd1ZyZ3VGYWtZZ3Ex?=
 =?utf-8?B?Vy93TXhXWWpKMXBlN041bTRyQ0d2eG5BOXVxUWNTSEI4SUtISGsvTlRyMXc0?=
 =?utf-8?B?VVhtK1pmQmlhc0x6VkRLT1hzUUhLSHBUQkUyaUl0MHI0RnZybWhoSUJzRWZj?=
 =?utf-8?B?cFhoV2RISFNaS2puRFppeWVsR01qZEgzY082QVByZ0NSTUd3Z2l1RGJoblNw?=
 =?utf-8?B?QnJXQm9xejBiYlRNNUZYcHVINFA5dkM4d2szaUdzcHFtUGRZaGVSNTdXSVM4?=
 =?utf-8?B?QjN4TTAvaEZ4WHUrZE15OWpjbjBVeTBOWGVPRzAxd2hGZk0rVVFLUlFFMlk1?=
 =?utf-8?B?WTdNQjQ5Q0xzUlRwdUtvQW96SnY1OVY5U0NUWmtqeHhHd2F6cEJrVENqSzBY?=
 =?utf-8?B?UzI4RldaRGh4c2xxR1pXdmQ0RGNzNHNKZGJ2a1JhK0h5TmJHNTBuRjhuVGdy?=
 =?utf-8?B?YXN0SllJN3JERnVFVlNzUkhDNGFDam01OE9FdFVDUk05NUZ0TmxGSlhnVFla?=
 =?utf-8?B?T3B1eXV6d2daL1BST3ZvZGRpMTV4QldFNVNHb3RtWlhMTGE5dVVJOW5qT0JB?=
 =?utf-8?B?UDNQTER0WXFxYmVkdk0yYVFmNmNxSGJkSnFLR2ovdUV1T0xuZ3dvZmU3aWhC?=
 =?utf-8?B?Z0VwQlRrWm1QRUJUTVlicW9jMHRDbDVwOUNlSFhXbkxxYmdHWWNOdGRQT091?=
 =?utf-8?B?bXdlODB2U2tEUUxVWlpMV255WU9sbmdDTHdPbkhWcE0rYzFzNi94MmVKR3ow?=
 =?utf-8?B?d2FPdmNOOVI0SEkyaWswYWxQR3hyVEFnYmtzZzFVc0lMOU54NEVhU09Eclo2?=
 =?utf-8?B?c3dMQU9aUzR3YWd3cEhodlhHVmgrQ2kyWW44WTdyRlRrckxtdXBqaHBYUUVm?=
 =?utf-8?B?cHdrZ3RVRVozWHhoN3RieHJaMllUcXpWRXhZQ0lIbzhJVG42WE13RGVVTHly?=
 =?utf-8?B?NWJJVXA5YXhLRHoxM0hQNGdpWktxZjk0alg3aXRyZXdVYldJWnFXREx0ejNE?=
 =?utf-8?B?eUY1MUFTNmcwTGVkOEgzVXQ3RmdzU0IyUFpXNFhKdmtoS3RHbXhISUMxN1hS?=
 =?utf-8?B?VWI1dXBYOE9STWVtRkFFbFlSQWp4NnlKdS9HU1pxNW8rTzlKMGs0MlpvZEpn?=
 =?utf-8?B?alRvV1hObTBvR3Jad1dEWGIrVHlYSXc5QVNPOTl3NlZ6TGZURzNDY1k5VnNW?=
 =?utf-8?B?NTBwc3VpU1dtN0N4bEVkREhLaWs4UDNMRXV1VmN5N0EveStuZ2NjS2xWZXNY?=
 =?utf-8?Q?BkwVVwqnJiP3KFy9Jurw1P8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13955.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae9ee77-7ddf-41a8-51c7-08de3c9e64b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 12:26:52.4994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7LfvBITkwccZP+fPr9hKVeCmnc29Rl80kgTur7BCygHRyQJ9BmUkv22HEz+pba/rSzTH7IHMBEAUC201Q8POltJN70W34WKsmcz8ImdgI3++OzpUZgcopIXY88N01DLa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8046

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAxNiwgMjAy
NSAxOjQ4IFBNDQo+IFRvOiBDb3NtaW4tR2FicmllbCBUYW5pc2xhdiA8Y29zbWluLWdhYnJpZWwu
dGFuaXNsYXYueGFAcmVuZXNhcy5jb20+DQo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296
bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtl
cm5lbC5vcmc+OyBtYWdudXMuZGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgbGludXgtDQo+
IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAy
LzRdIGlycWNoaXA6IGFkZCBSWi97VDJILE4ySH0gSW50ZXJydXB0IENvbnRyb2xsZXIgKElDVSkg
ZHJpdmVyDQo+IA0KPiBIaSBDb3NtaW4sDQo+IA0KPiBPbiBNb24sIDEgRGVjIDIwMjUgYXQgMTI6
MzAsIENvc21pbiBUYW5pc2xhdg0KPiA8Y29zbWluLWdhYnJpZWwudGFuaXNsYXYueGFAcmVuZXNh
cy5jb20+IHdyb3RlOg0KPiA+IFRoZSBSZW5lc2FzIFJaL1QySCAoUjlBMDlHMDc3KSBhbmQgUmVu
ZXNhcyBSWi9OMkggKFI5QTA5RzA4NykgU29DcyBoYXZlDQo+ID4gYW4gSW50ZXJydXB0IENvbnRy
b2xsZXIgKElDVSkgdGhhdCBzdXBwb3J0cyBpbnRlcnJ1cHRzIGZyb20gZXh0ZXJuYWwNCj4gPiBw
aW5zIElSUTAgdG8gSVJRMTUsIGFuZCBTRUksIGFuZCBzb2Z0d2FyZS10cmlnZ2VyZWQgaW50ZXJy
dXB0cyBJTlRDUFUwDQo+ID4gdG8gSU5UQ1BVMTUuDQo+ID4NCj4gPiBJTlRDUFUwIHRvIElOVENQ
VTEzLCBJUlEwIHRvIElSUTEzIGFyZSBub24tc2FmZXR5IGludGVycnVwdHMsIHdoaWxlDQo+ID4g
SU5UQ1BVMTQsIElOVENQVTE1LCBJUlExNCwgSVJRMTUgYW5kIFNFSSBhcmUgc2FmZXR5IGludGVy
cnVwdHMsIGFuZCBhcmUNCj4gPiBleHBvc2VkIHZpYSBhIHNlcGFyYXRlIHJlZ2lzdGVyIHNwYWNl
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ29zbWluIFRhbmlzbGF2IDxjb3NtaW4tZ2Ficmll
bC50YW5pc2xhdi54YUByZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwg
d2hpY2ggaXMgbm93IGNvbW1pdCAxM2U3YjMzMDViNjQ3Y2Y1DQo+ICgiaXJxY2hpcDogQWRkIFJa
L3tUMkgsTjJIfSBJbnRlcnJ1cHQgQ29udHJvbGxlciAoSUNVKSBkcml2ZXIiKQ0KPiBpbiBpcnFj
aGlwL2lycS9kcml2ZXJzLg0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25m
aWcNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcNCj4gPiBAQCAtNDIzLDYg
KzQyMyw3IEBAIGNvbmZpZyBBUkNIX1I5QTA5RzA1Nw0KPiA+ICBjb25maWcgQVJDSF9SOUEwOUcw
NzcNCj4gPiAgICAgICAgIGJvb2wgIkFSTTY0IFBsYXRmb3JtIHN1cHBvcnQgZm9yIFI5QTA5RzA3
NyAoUlovVDJIKSINCj4gPiAgICAgICAgIGRlZmF1bHQgeSBpZiBBUkNIX1JFTkVTQVMNCj4gPiAr
ICAgICAgIHNlbGVjdCBSRU5FU0FTX1JaVDJIX0lDVQ0KPiA+ICAgICAgICAgaGVscA0KPiA+ICAg
ICAgICAgICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgdGhlIFJlbmVzYXMgUlovVDJIIFNvQyB2
YXJpYW50cy4NCj4gPg0KPiANCj4gVGhpcyBjaGFuZ2Ugc2hvdWxkIGhhdmUgYmVlbiBhIHNlcGFy
YXRlIHBhdGNoLCB0byBiZSByb3V0ZWQgdGhyb3VnaCB0aGUNCj4gcmVuZXNhcy1kZXZlbCB0cmVl
LiAgSW4gYWRkaXRpb24sIHlvdSBmb3Jnb3QgdG8gYWRkIHRoZSBzYW1lIHNlbGVjdCB0byB0aGUN
Cj4gQVJDSF9SOUEwOUcwODcgZW50cnkgYmVsb3cuDQo+IA0KDQpNeSBiYWQsIEkgZGlkIG5vdCB0
aGluayBhYm91dCB0aGF0LiBJcyB0aGVyZSBhbnl0aGluZyBJIHNob3VsZCBiZSBkb2luZyBub3cN
CnRvIGZpeCB0aGUgc2l0dWF0aW9uPyBPciBpcyBpdCBqdXN0IHNvbWV0aGluZyB0byBrZWVwIGlu
IG1pbmQgZm9yIGZ1dHVyZQ0KcGF0Y2hlcz8NCg0KSSB3aWxsIHN1Ym1pdCBhbm90aGVyIHBhdGNo
IHRvIGFkZCB0aGUgc2VsZWN0IHRvIEFSQ0hfUjlBMDlHMDg3Lg0KDQo+IEdye29ldGplLGVldGlu
Z31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQo=


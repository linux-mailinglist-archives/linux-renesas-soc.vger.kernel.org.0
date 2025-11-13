Return-Path: <linux-renesas-soc+bounces-24600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D8C59CF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 20:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4801635485D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 19:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D295E31B810;
	Thu, 13 Nov 2025 19:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GlZN3jbB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010066.outbound.protection.outlook.com [52.101.229.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A57931AF15;
	Thu, 13 Nov 2025 19:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062876; cv=fail; b=ZBVrU/C3VYaTZEjEpLINw+9ldQ8PT//DQNhF3aOCSlgQwSAULLb1EVfEEkIefKHqv4++kgIhJcclOgGlSvb+rx6CMxz47d/E5xirRzevjdouHHIRWJoOjINRoB2TvW6r9h2t/yF7bLQk/qRCsmwwKVukqtN7Ou+Ttjzxlbb0+Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062876; c=relaxed/simple;
	bh=lmCQCscu0h7GpsAuQvvv2WhQ6fq4p3JK1CtYuBPm0v0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iJ+fRA0xGgAn8blPlwDODvIUtiVlNappNKDnk+6EyKks0pjrV8GMx+YQKDJINAiLUB1GNX9zlR1xtOSMDs6MMwlQjDGByTvjquiyPmPwR+Z0MlIt1PfDhM98o3G+D/g0wYrUvsGRKhBCywSDUf5D46+eeg41TZaNursZzhvdMgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GlZN3jbB; arc=fail smtp.client-ip=52.101.229.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiOx/37UjViwT3pYNYjVJ3dTHLd9sfv2eAcwB/2FeYSs/HWYGXiZGkkAk32ZI45dNu/5tGNcEUtfvqHTdpQHjEhDyzRHTLl0oeXf2N3sd/4c/EntlyiwDcebCX1NUL8hXGJ4KEQtysOBRUK6+bsYW1hCD825TF2oHdtXbpAMf/cb2nVGUFrYePu41yJkttJxiW48tliPY2bW5OTNTMjCeJscRtyYyOmdygPVTanxGAjfCjKozSRAZEIClB85ndntKms50ENOOX0EBjS10KfmkyJWYiy8jIkJQNiCm9TzKRHlfC5pyJhd2Kjr17SOgt9+q4rjEG9trjmct884/TxLHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmCQCscu0h7GpsAuQvvv2WhQ6fq4p3JK1CtYuBPm0v0=;
 b=MdeoeWy/IGfKcQTT1TR0jSgc+gEKKC/DSKhsGoyTkGu66Z0XDRfrSEntn3l7w+sBGiR+GvGUipVPfUeRg+Jkl23XLeGZL2wPLxJDmoM3a4WVQYZ8o/ZWBOf0zDsH18mpjixTQiI9kYk7Z4KnhNBQ9i3ed8lst0AdQ39zJuNXZzCWIvG8E6NtuLc/Tm6SBN3MB8/cuOOuDgD1PpshEiS4gnaAhTyP4FDIYw9ZoHwYhO5Uq4UQDcXvkOq/6pH2LSSsLySyaCIxchO+rmPdCtg90JAxsS7Fxa3V97HuXbVyAQV8UAe5slCD85NTNcNysFi56+/O42Dfqowt8+wioLPvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmCQCscu0h7GpsAuQvvv2WhQ6fq4p3JK1CtYuBPm0v0=;
 b=GlZN3jbBzgY8HfvIer38a6MgH3tvTIiQJ9+eTByAB+fyZqi5vmfciJ5SaJF6Rd7wJ8itCkKSADyb1iT6airhDUOjE5uV+lSOCj3RkpdvtkntKcwVUGpGF1derUyLB/58suIp1AHg0vywrxwjmgnYD4obUWXnJCNWXUSBymajNmg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15762.jpnprd01.prod.outlook.com (2603:1096:405:288::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:41:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 19:41:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 01/19] clk: renesas: r9a09g047: Add RSCI clocks/resets
Thread-Topic: [PATCH 01/19] clk: renesas: r9a09g047: Add RSCI clocks/resets
Thread-Index: AQHcR1jc0b4dsXLFYkmOqi7OqVOp9rTxBZKAgAAUnUCAAAF0gIAAAG3Q
Date: Thu, 13 Nov 2025 19:41:08 +0000
Message-ID:
 <TY3PR01MB113460742DF12C5FDDAEFD9D486CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
 <TY3PR01MB11346CB74E94956AC93A9471C86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUxyg=ky8MhRVhsFBpkEGfZ+TxmAZTbt0V=BvARz1Q2Kg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUxyg=ky8MhRVhsFBpkEGfZ+TxmAZTbt0V=BvARz1Q2Kg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15762:EE_
x-ms-office365-filtering-correlation-id: 46b46468-7d7c-490b-5211-08de22ec97a8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2hOVFRFekVnV0hmWmNnYzdRL3NrZ3FiNkNBNS9HNi9wMDFBYUVEOWMxQy9o?=
 =?utf-8?B?eDJqcW5pZGFGbnNPalJtd0RvQVlOVnFKemNEYkY0bU1aQzd1ZnRqUGY2dHdQ?=
 =?utf-8?B?b3ZaYmNoZjdnNHpKbHhkUFY2RjE4b3dVVXFGaHhteHZQdmY4YmNYZDlMbWxr?=
 =?utf-8?B?a3dyRzd0czh1b2UrdG8vL3IweHJKUHltSFVIbkdqZkVKTU4xU1V1NW13cENM?=
 =?utf-8?B?eHpTRnh2UXhsVUNqajhhZFJJcVJVc2I3Tm9qcUlHZlAzZGtIMzlsTmZyam4v?=
 =?utf-8?B?c0ZZakhrNlpYTFkvaVhUUUpITERyOHZGb1FaSE1iMlhUMklpK05Gc1A5SFk5?=
 =?utf-8?B?ZVNpeXhVQ1lyc1IzUlJveFBZN2RucUNQZXkzV0FjMzlFZjZaTWNqUklLZlh2?=
 =?utf-8?B?cnZUL1Bidk9MWkl0NFpnSWc4blVoeE1EZHVSR2licmlZTW1hcktKdksrcEhS?=
 =?utf-8?B?UXo0UVVldUFEN3BCQjYvRmp4M1cxa0REZ0ZsajYyR0pudEtFQ3RxVTljQ0dh?=
 =?utf-8?B?eFVOandJeHJSOW5hanVYSVJtWFZ2K0ZGZnNKMS9lb1h0a0VwWWF4V3NVUzNJ?=
 =?utf-8?B?bDB3TytvcUpwSFg4K1prRSt4YmFlYmxIVjRyd0dkL2hvZDdSM1pKZmpTb0NV?=
 =?utf-8?B?VDFjOW1uYTE4bHBNdVNuWEMwTEV0SCtDWC9ZdnhiQ3lLcisyWThlNzRMT1VJ?=
 =?utf-8?B?S3lzMXlqaVJlaXpYQmY4blQ1eGxaakhkbXZhVklKNmtuQXpKUy9NTFJ1WHNr?=
 =?utf-8?B?anExajF6VGtTQWk3THV2U0pWUndraXlZRjZmN3hRVHJYdFpVTDN3ZHhnZzRM?=
 =?utf-8?B?QVFQZkluV3AweFdiamdHOC95U0grMklCZ1psakpqemE2ZEJIVzVhc0lnNDVl?=
 =?utf-8?B?MHMzb2RqY2xydWhZVUlkVEQ3ZGt6eDN0RFJvK3ZzTzdLb2IvZDVlS21YQXdt?=
 =?utf-8?B?UUEzK2FXYkhDc0M0N0V2UWFMcy9vSytBak85VnlZL2kyRGpVbjNRWlk4RG1B?=
 =?utf-8?B?VEJxTXU2a3Z4OVFMMkM3UXF6dUFtTTZleW1sbkxYaElRRzJCWmdkSDQvNEJv?=
 =?utf-8?B?cUhvTm9ocXU2clNtNlBCRVVxbUdQK2h0blZrOEMwd1pTcWRNRVBFTi9NSDZH?=
 =?utf-8?B?U0o3SitJTXRFZHUzQkpVSFVKd3hoZXlpZ1VJTWhUWHVMcmNCVmd6blMzdnV1?=
 =?utf-8?B?bnVLUFFxdWVzR1BrRkFIQVZmQlhIbWdWN3JLK09yTnlyTHc2TDFoWFIrSkcw?=
 =?utf-8?B?cUhEL0pDT1FRV0orTC8vcGNQR3daN2hId0o3VG9SVjN4SDRscjJPMUxtcita?=
 =?utf-8?B?TkFGWU5GSFlOcldXcGhpQUZ4RE5sWHN4RzJITUJHVXlUMi9udHBrc20xN0tH?=
 =?utf-8?B?dVo0S2wzVE5Lc3hlOTVlRUJIVldpU3pucVdycGhLc0dUdS9jZ1NpRTh0V3po?=
 =?utf-8?B?Y0RhNS9mTDdrM0VzdkthWGw2VmZiV21hSW9aSUwwY3dvRzh3Sm5xWTU2bE1R?=
 =?utf-8?B?SEVaSFV1Vzh3VVNOR1I2VkVSYnhMN2NuZW54cU00OWsxQlBPTVRRVDZieWtp?=
 =?utf-8?B?eFBtZUxaTEZ6QmFxQ3NzZE5WNGJjN0V6SWk2QnExUXVkKzlwV0R2ajNkU0tR?=
 =?utf-8?B?OThYMTNNYWhaaENUTWRKa0ViSEx1TDYyb005TXRIL1R2cXplQS8xRWo4N2hG?=
 =?utf-8?B?VTRQS29uemp0dWpHdHcrTDF0aFZMVmlVUjZLNVV2ZlB3T3h6QUNvU1ZEVXpN?=
 =?utf-8?B?ZFlOMFV0bE1pcTBUQTVNbW8yK0ZOV0JzSDFFZUU0dTVyVXpnRjA1VFdialkw?=
 =?utf-8?B?MU91VFJvZllBRnh5NDYzLzBnUTRwY2NkZ1czbXBjcEhRWk40MEloaGNFRjQv?=
 =?utf-8?B?V0ZoRDd6MkJJdWNHMGdVSGtvajZjbEpkM1RXaXp1bEZsYXhNbUxldWh6aElO?=
 =?utf-8?B?SW8zeTZlNERxWDdmeWJ4TWFEMFlpK3VsNklaWVdtVkRWK1pqaklQdmFBWUZC?=
 =?utf-8?B?SnUwTEdLbk5wNzdyMFlJelY1STlaTDFYMHY5UTdtdlpZSzllYkNJTFNZbjU3?=
 =?utf-8?Q?uyH2bu?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1JZaVI5L1YrNktTVGxuZGFYQSs2NFBaaDRSQ2RGNkY4aEdNY0ZEZmFtQWI3?=
 =?utf-8?B?L1lhbGRmQ29TWkhOVDA0OFBsM2J4czc0UlFVTHM1RGlzMi83UnArVXlqSTVR?=
 =?utf-8?B?Y0hySCtJZFlyZ0kvUENCazhjazd5RU5QZnZUbnVjZmJ5YlhaZWtjUkRadFMr?=
 =?utf-8?B?QWhFT3ArdTZVYXE2UTZRd2ltM1EvNjhTZUdlL0dFMlR4TUxYYjNZaWVBcjJF?=
 =?utf-8?B?UmVleVljbjZrc0JWRFZjL2pXK2dtSVdWNlYrbVdSUWZwT2pEL0xYRHB2N0Rl?=
 =?utf-8?B?RFU3VEFscUFvOHZUVXZhSE9mVkFkSkVsT0hOeTNRR0RoZHlsa01VWjNsVy8z?=
 =?utf-8?B?QjBueGtWaEJmN1lVWDhrNGFqWERZcEpDTHZPaGZJcnpNdFdqdGl2R3lhcXg0?=
 =?utf-8?B?SVM0Q3Q4OVpZL2prczd2UTMrakhqbk94c0RIdWFPNDM2Z3hYSEMzelA3R2Nn?=
 =?utf-8?B?bVpWRVZyL2IxWDdtQ3pCbnkxS25WMERqYlZjcHptVFQveUtUbkN2MWh4TW8v?=
 =?utf-8?B?UUhBQ0dSdVFFSmk1aFVyV1BLdUJyaWlNQjFLWjZ6V29kRTZiTWdxRzYxdFcw?=
 =?utf-8?B?dUd0cnNHV1JDYU84U2ZGdmVYWVB4MkVxMHJxbThybXowU1I3RG95SElvZlph?=
 =?utf-8?B?Uk9DaCtJajFRa0Q3SmVrRTE0Q2YyREl6ai8rdEhnVjhCcldjSjJzMm5EWnVF?=
 =?utf-8?B?THlMQ2g4UEVSa2JqYTFHVGtBMHcyRDVXQXloQ2V1cDZRNEl0blpxVXFCTC9E?=
 =?utf-8?B?K2Y1ck5Sc09uUlVJVWhXVHYxcHc2Vm9jSWtob1ZsRm9paUQ1UnFpdmxnZlVU?=
 =?utf-8?B?cmdISEd3d2k1a1hMSC9BcCtmaEFFUzM4eXI4NUszSzRBODVEeVpqeXNFQXBR?=
 =?utf-8?B?dWVIWDhIb2JXNU0wQVNLeGozUlFZOXVKcVVwRkRlcVNLbCtJajl3aCt1UytE?=
 =?utf-8?B?RDlaMkJFS3pjdU5RUUF6ZVB3dCttcXJ6azBYODduSEE1OWFGWkVaOXFsZ2Fx?=
 =?utf-8?B?VWl3TnJrTTRwSUZMQmtUNmR4NEpJV3hjTG1KS1YvOWxwYXFWWXhSMlBKMEdL?=
 =?utf-8?B?em9OSnkwcEs5bCtjcmd6dGEvdlZVQXk3dDdjYXM4NWRwZUpuWmI5ZVI3Z243?=
 =?utf-8?B?S25NZmZERDZ6cUk1eGlCbmJ4UjBsYllSbDdodFQwUWtubDlPamRnaUtreUox?=
 =?utf-8?B?bHViOGttemxROWxMaGx6eHNpdUhxZmx2VURjVkxrQzVqT3JCZlNwWmRYdWhB?=
 =?utf-8?B?a0NDRXhvRXhwSGVkRkpKcmpxTlhMVndRTjF6bnl3TFFuMFVhNUZDTFJFWWRp?=
 =?utf-8?B?YUU2RXdYcGFNWmxmNWorTXU2YW5tRFRYZkx1bHNvQ3NBNXB6WGJMYXU4bEFT?=
 =?utf-8?B?Zkw3WGlxSVJCenNUenJSVUJQc0U4c0pJK1hNcjQ1Q0hOR0lFdi9CRFdVUkFO?=
 =?utf-8?B?K3Yra2ZMY1NqT3p2S0lHYWpQZWh3M3N6aStoZXZwdVl4aldyR251REtxSGov?=
 =?utf-8?B?ZWdXNUtwUE50OVB6Mld6a2g3Rm5WUmFQbVQyUVMybDNTbUdlQU5VbCtZRzQy?=
 =?utf-8?B?Syt0VGJwd2FXb0NoRHVCUnF4V043QWl6K2tZUEhoaElvdEc4NXA2YmZ6Nm1a?=
 =?utf-8?B?bmozZHFrQjB0VUxTVjRCMFhoN29aelFLN2NNUmptMmZzMmgxVm41TS9JY2Nj?=
 =?utf-8?B?ZmZnSVA4OElRQzZsMTlpRFNGenJaOGVzTUtKVlJWQ2JtYzU3SVh5TDF3QmpW?=
 =?utf-8?B?d2RyNnQ0cXdyOWdZbVFJQWgwRmxlUjNybU9ROEVxL1VpNUtUU3hjYWRLQUVk?=
 =?utf-8?B?b2ZDaGgwUkFNUmVFUVd1Tkw0d292NjlIUUpiK25jSEE2QVpKMzh2MFFwem1q?=
 =?utf-8?B?amJQaXBJTXZiaU51aVg4d1VkbUFIWUFNWTVlTzhFM1Jxb2pYSUthdExaMGhD?=
 =?utf-8?B?OUcwdTZJT1BkMEVZbGVYdUFoVU5qR2ZibzB5Zm5UcU03engweEtybmNMR0dT?=
 =?utf-8?B?VTlTWnJ0QnFMNkdBdEg3QjlMMlFoNjJXZm0rUXZIQ0RtclVqZ2hFUk5UVUtF?=
 =?utf-8?B?cWVQMU1xYWgwMXQ1VlpKVWsrdVpTNU5IZjhwMFVHMWZzcVVMVnQ1T3VJQm1w?=
 =?utf-8?B?Uk14R2RwSk43VUR0UFRwRDJSVWo3MU9raGNHSWVmcXVYcXZpUmpQNjJUNC9O?=
 =?utf-8?B?NGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b46468-7d7c-490b-5211-08de22ec97a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 19:41:08.4629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rL9Uv7ydP9c3iHSE0savYZAHAAEs2EnO44Mk4SV0iShKEj2s7C3Gpq4X2ZmIQZI+3wUscZHcnne+oacuCGrRx34X68abBSjACUTZUeWIDZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15762

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxMyBOb3ZlbWJlciAyMDI1IDE5OjM5DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDEvMTldIGNsazogcmVuZXNhczogcjlhMDlnMDQ3OiBBZGQg
UlNDSSBjbG9ja3MvcmVzZXRzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCAxMyBOb3Yg
MjAyNSBhdCAyMDozNSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IE9uIE1vbiwgMjcgT2N0IDIwMjUNCj4gPiA+IGF0IDE2OjQ2LCBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBBZGQgUlNDSSBjbG9jayBhbmQgcmVz
ZXQgZW50cmllcy4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4NCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9j
bGsvcmVuZXNhcy9yOWEwOWcwNDctY3BnLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yOWEwOWcwNDctY3BnLmMNCj4gPiA+ID4gQEAgLTIxOCw2ICsyMjQsMTA2IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgcnp2MmhfbW9kX2NsayByOWEwOWcwNDdfbW9kX2Nsa3NbXSBfX2luaXRj
b25zdCA9IHsNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQlVTX01TVE9QKDUsIEJJVCgxMykpKSwNCj4gPiA+ID4gICAgICAgICBERUZfTU9E
KCJ3ZHRfM19jbGtfbG9jbyIsICAgICAgICAgICAgICAgQ0xLX1FFWFRBTCwgNSwgMiwgMiwgMTgs
DQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEJVU19NU1RPUCg1LA0KPiA+ID4gPiBCSVQoMTMpKSksDQo+ID4gPiA+ICsgICAgICAgREVGX01P
RCgicnNjaTBfcGNsayIsICAgICAgICAgICAgICAgICAgIENMS19QTExDTTMzX0RJVjE2LCA1LCAx
MywgMiwgMjksDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJVU19NU1RPUCgxMSwgQklUKDMpKSksDQo+ID4gPiA+ICsgICAgICAgREVGX01P
RCgicnNjaTBfdGNsayIsICAgICAgICAgICAgICAgICAgIENMS19QTExDTTMzX0RJVjE2LCA1LCAx
NCwgMiwgMzAsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJVU19NU1RPUCgxMSwNCj4gPiA+ID4gKyBCSVQoMykpKSwNCj4gPiA+DQo+ID4g
PiBBY2NvcmRpbmcgdG8gYm90aCB0aGUgY2xvY2sgbGlzdCBhbmQgdGhlIGNsb2NrIHN5c3RlbSBk
aWFncmFtLCB0aGUNCj4gPiA+IHBhcmVudCBjbG9jayBvZiByc2NpTl9wY2xrIGFuZCByc2NpTl90
Y2xrIGlzIENMS19QTExDTE5fRElWMTY/DQo+ID4NCj4gPiBUaGFua3MsIHlvdSBhcmUgY29ycmVj
dCwgSSB3aWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+IFRoYW5rcyBmb3IgY29u
ZmlybWluZyENCj4gSSB3aWxsIGZpeCBpdCB3aGlsZSBhcHBseWluZywgaS5lLiB3aWxsIHF1ZXVl
IGluIHJlbmVzYXMtY2xrIGZvciB2Ni4xOS4NCg0KVGhhbmsgeW91IGZvciB0YWtpbmcgY2FyZSBv
ZiBpdC4NCg0KQ2hlZXJzLA0KQmlqdQ0K


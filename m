Return-Path: <linux-renesas-soc+bounces-13942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BDFA4D42A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 07:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EACA3AE025
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 06:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB9F1F5836;
	Tue,  4 Mar 2025 06:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gd0IJKWH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5B1F582D;
	Tue,  4 Mar 2025 06:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741071530; cv=fail; b=uqTNnngTIPP1Rn0yuvCnTXIQqHc07ME8b3qu2mrmVNlOryzV9daQmTd7eF52cOmXzG7hVzTqDsl462xBRIZ0ghhjchupanwKQHu7FSk9B6mIjAv9Rjq4dLYYNbq1AmgXNzKOUjLRGa6Kz825OIPRBOCUma+BexUCJVyteOQP7lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741071530; c=relaxed/simple;
	bh=MLnVie9IQVxsCEi7Qo8cvnhxz1SUILAFnC81e9kQmZE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YmcR3IYPpXittHYCvmPTIaV9YnSIOgx+mg+9adlDIFvunS5JjH+L0JNArCIFayNtvRxPN4zgD7sfvXw6aVNv88d2g50rfFpGjTFVoOH9tO5U/6241E9mkw6/rGyvEcar8z6N+qiRMUJM9PX+sBA2q1c3JogISk4OH9GIq4DvZrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gd0IJKWH; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9I7+AhW9GBn0Sk29ME6AEH8Tv9T5g7FthcZmzgRiAhnEePcopboJWcMmHtl/kcac3rei+q7yOZFPX6I+XXx869C8DHJ0Puwkz9gPsWF4/EBXz9H87FHj9Mc3ZfaH5bcMG1sjReZ+/PFn1vUJVOpvE4XNXZ3ksJ4ZiQSwHwYf1h0VMh0AGfrTRl4aAhex5X33weV2AEbCHQvvWaDGkt+5etlU7bCWU9NGC98bjnDZ0dDARD9kkbrV3ebDWBd1C1wvPNrJ5+HWOTVTChELJsDCj7aJXeS8fMGEZbdDfd4DHEpIoFsI8LQ0EBobw/XH0QZBcPkwjEij6CwGq2JqPxSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLnVie9IQVxsCEi7Qo8cvnhxz1SUILAFnC81e9kQmZE=;
 b=UgfWriadvSWDnDv1wKoQneqBiQ21FbjllgQhkaq3ypfwmr2JQoceQj5lFPJ2rXVWQOLOdzZPF0pheHTevuvcFFKAwk00+iaS8ZE54qoeMWV6V58Rq4NJg6+F2JzCOh5gD2gVJmQmDlVDvBEn3DIqjqwp7sP9X80klUBA8s1lfEKLkQeP8WvmVOgSDsjMcmqllnV84Ht2+rVeDlFs1vBuG7xcnY7+dUXk8xlFkmDJED3wrgdgDiNoUrlQVa34KuZEp6K9sPzNUth7R137ypyumwuNTPXw+eW+3dHieMRd8LBT/mwlm5/V2yyjwZq+wAPINbvdfcr54pacnvQ/SqangQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLnVie9IQVxsCEi7Qo8cvnhxz1SUILAFnC81e9kQmZE=;
 b=gd0IJKWHgjqhLbJA0jdGft046/pdGX0jQgHQOPvd0s8SuTNjj6JbTc6emFcwrFeKasbBd5ZW3fQ0NHCnbCkBudWiV6c+zmEn5DcWdY4Vpzxep92nGD0wHnYrjTqGvHSZ4xJ+H+hEiXKjK3ZgodIFmPSnTPQvRVCWxhH1A7nYrvI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10007.jpnprd01.prod.outlook.com (2603:1096:400:1eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 06:58:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 06:58:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Thread-Topic: [PATCH 3/3] net: stmmac: Add DWMAC glue layer for Renesas GBETH
Thread-Index: AQHbi5+G4twUHAYTu0i8PGx7wsGe2LNhRQUbgAFGp3A=
Date: Tue, 4 Mar 2025 06:58:44 +0000
Message-ID:
 <TY3PR01MB113468803E298C5FA6FB6712886C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250302181808.728734-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z8SydsdDsZfdrdbE@shell.armlinux.org.uk>
 <CA+V-a8vCB7nP=tsv4UkOwODSs-9hiG-PxN6cpihfvwjq2itAHg@mail.gmail.com>
 <Z8TRQX2eaNzXOzV0@shell.armlinux.org.uk>
 <CA+V-a8vykhxqP30iTwN6yrqDgT8YRVE_MadjiTFp653rHVqMNg@mail.gmail.com>
 <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
In-Reply-To: <Z8WQJQo5kW9QV-wV@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10007:EE_
x-ms-office365-filtering-correlation-id: 975a0324-7996-4e73-9b82-08dd5aea0125
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a2NWMVlFdHF2VnBBcEVIelVNUEZ6VWRDeG1KNjBacDZocTNOMnlGZFNGZmR4?=
 =?utf-8?B?V3V2TGFwSlowdmk0RVBQaVVEckNZV2VEcTBUMnViV1lpWXhIWEVPN2h2TVo4?=
 =?utf-8?B?UUM2eUNCZWJ1T3FrQTAwM3lmV29DUFRDb2FINXZpckFFNEJDZ3JnbktPTDdC?=
 =?utf-8?B?akc5blZjcU5HV24wQ2hEQjQxUXQ2cUd1aTdlckxqOEFJaGdSVmQvQ0FTWnUw?=
 =?utf-8?B?RUoxaEROdHFyQWRRQjl5Rlc3RnpualNhTnM5STF6TkEwRTRKcU9tYVI0TDNP?=
 =?utf-8?B?Qm1Qb0hISEtHbWNBMm1jeU10eDdxcVFGMThlSUNpRjFocTg3TnFmMWxWd1gv?=
 =?utf-8?B?K3U2TGMrb2h4cjExZzRFUHVDQTN5YlR0NFFWM2JxWThBTkN0V0VxMUhVRmtK?=
 =?utf-8?B?YkNWMy81UXlFOTEvTFNOM05oMkg2R09pNnBNWWJ5ckhtYmR2a3lsNHk0TE4y?=
 =?utf-8?B?b0FwaUN1TjBadm4vakpITUxDVlN1bTRoc1Q0dkVSczE2aVdyeUcwWld1Yit1?=
 =?utf-8?B?dFZLZHZvcURmOHh3cFZ3YjQyajI1M3hxSnR6dHB3U014by9JQ0RhbUVDTjlm?=
 =?utf-8?B?eUtuVmJrNTNZYlNYcmF2UGNXekNBNWhhNWNWditvYnlrdGRaUzFyVnliUC91?=
 =?utf-8?B?QnQvUWRyOFNJV2ZKWmFxSjB3SmYyaXBTbFN2ME4wNU5TRHRSWUZCTUgrSjFk?=
 =?utf-8?B?Z2FmUnVOQ2JNYTdQVFdYZWJhVFI3bS9iWSsrUExvSXVFOTZMazU5eFg4OXli?=
 =?utf-8?B?T1NHV3VPaG11bytlQ1d1ak9KWndlQmduc21hRW1Ubi9yT3F2Umlvd2hLUWV5?=
 =?utf-8?B?ckx5c013VDFKUlFGNW9uUkNvUDljWi9ueTlvT0NhMmM0YXowQTRXQWZPWlQz?=
 =?utf-8?B?UUdqbTFHSjg3VDBXdVRQRDNEbmdNakxqUlorYW50ZVNWeG1KUzZZL0E3elBC?=
 =?utf-8?B?ZlBnYk5vWEFoZGh3a05teEtSTEpMZUF0YzhEMHI3MnBDRWZuSW82SVBqUXpr?=
 =?utf-8?B?ZUdWMlYwcENWbGo4UXZTUXRWNTVTMTdsb01uUllnR2FENnVSd0ZlMFlUOS84?=
 =?utf-8?B?bGtZeW0xcytZWlBFTTcrZEp0NElGanNvWU5xL3pYdE1xTDBEcWdCemdTWEdY?=
 =?utf-8?B?MmtqQ2x0cmJOV01FYXorM0Y4ZFIvdGdLV2p0aXRkMElTK1lmdkFZU3RMK0lN?=
 =?utf-8?B?Z0RsWk9yWktaVk1yOUNmbGlJWVI4aE8yd2dEV1RlUG9OQjUxNUd5ZXQwRnlG?=
 =?utf-8?B?L2tkdG4wMk4rZVNyaDdLd2RhbGhiNkVCaXhyZFJrTS9kWmZ0QUdTU0tPWDdt?=
 =?utf-8?B?TFliWG5NQWdjck10V3dKSkRSNEdSOGE3enhuMHlWYThOZW45VGVOQ0Fvc3Rt?=
 =?utf-8?B?dk9FbUlDU3dIRnVNQWtnWjNpY1ZJTldTYUNDcHk5UmtQcEdqOENyR3NsU2xj?=
 =?utf-8?B?SnJnVFp1SXcrakVMeE0rM3pDbS9ISGlIWkRHOXBxMnBLSEF4SFpFN0ZpWFR2?=
 =?utf-8?B?VUJvR3JTQVh3OFFHZDFoNzBwYzVXY1RHMmJKaEszeTI2YThiR1huN3pKanY1?=
 =?utf-8?B?ZTdGTkxMYjg5TGdUek82OGpXeGtmYXZWcENVVWxsVGJCckVEVkN1ZG5IeGUz?=
 =?utf-8?B?czZZWWdNZ3JFWlZZYUh1V3pra1V1VUdpWFd5eEg0SWx5cHhoRkY0d3B2QUNi?=
 =?utf-8?B?YUtVY25DU0VoMzZwZVdDd3FWakVGVFZYVS93VzYyb3hucE4rMStjeFRON3pr?=
 =?utf-8?B?a0x5Qk1tWXdPRlI2cTJSTWEyZUFadWoyWjNlM3hjWjhQR0FRRmNuTzhQQmEw?=
 =?utf-8?B?WGtYVFFpYzkzSlVTU3hzdnhqMU04YkY5aDE3Ui9YL0hHemhkb2d1MUNodEs3?=
 =?utf-8?B?WkhhbTR4RkJJa004UmE0dVdYdDU3a2hmc3o1cGNHaGlvK2UvWG9ta2dkdXhu?=
 =?utf-8?Q?BKFnHvtl5TBdP8Q2GiRX3pTi330CRkLe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlNBYVNubTJTYWR5ZUJOdzFzTGxwOEV6WlhJSlRIMDVOUjRocjY4eGNySzFq?=
 =?utf-8?B?ZzZnZWhmZ1lRbTBJWG1SREFyZzY4MS95Q1cwc0d1OTE0b1JGSFFNMytWNTZi?=
 =?utf-8?B?ZUJNNDJpaVJHTHRzQTBzcXpaUE1HNHJMVldrVXVHL2k1NUxId0lQUysraEh1?=
 =?utf-8?B?MW1ma2RwZzlKYitRUWNvTmlvUG1mTmtlRjFJR2tjYTc4andrN2NselVJaXNl?=
 =?utf-8?B?UW1uUmZHcWFEQjhENit4SVZuU2hRN3YvbkRuaUM1b0JmSlNwV05vNDZYU1ZI?=
 =?utf-8?B?d1dyczFFNk9RL2REdjNtd2liS1VMdHVvZnhpaHZPeGxKOHFtZEVYNVpRejcx?=
 =?utf-8?B?VDcvL2tWRzdETHd6d09yM1RqcmVyOVdTcExtcnBoL1oySFBGM1B4cS9hVVhq?=
 =?utf-8?B?elY5NUhLMVIrVENHekpDYkd5dGNCN1ExeTAxQXVoeVZRN1ovY0JtNEVEREdV?=
 =?utf-8?B?elRaVzZVMmVyWG8ralV4RjlQVThUZUkydGJaUktGaXZZbVBKR0xMclZFTWU1?=
 =?utf-8?B?R2dYcjZzT1VhNmg4VFVLekdmM1dqYzhURGxiRkZoK1h1R2VxNFJLc0FZajE1?=
 =?utf-8?B?QTR1QnlsQUxRUmFVK0VxMzVScVU1TFhEdG1pMHBnQnVRM3NvaFlyV0NzUFZH?=
 =?utf-8?B?ODZ5SFZKWGphQXdERFlHYXJnZGRQZWZ2Um5UNlhBRElkWFJtNG9PTE1DQjJ2?=
 =?utf-8?B?aGZ2UDJxNGNQMU5yYnRmYjVXWk1hRU1YK3RMaHAxM2lUa0ExeTJCVWVoNnhU?=
 =?utf-8?B?SXRDSnpqWUNET05ZMmdMalJUUUw3bXVLbWJ1U1lxdG5ldXR2dXd1elcvMGlx?=
 =?utf-8?B?cHdNWmdNWEJJYkdVQVREL1FKTWxlT1JSMzhxT1paMmd0Y0tRVVZQMk8rdXJw?=
 =?utf-8?B?dFZUUENtYXFSWS8yanJERmQ2am9ZVHJlNmJ1OWt2cU4xTG1Pcjh4OWZDcXdV?=
 =?utf-8?B?RVNWV1RPdHlOU2dJRkRvQUhlRWFMRjlWSVcrZG95bS9EU3FiMVZzMC9ES3p2?=
 =?utf-8?B?K0lyQlNuWkdJYkV1V3JvVVg5N1VLdW0yR0RQOGE4Y1luc3AvMzVKRnRhYTlO?=
 =?utf-8?B?VmlpWURYQ01CSnBoZEUrLzI4MHNsaFVSOG1rTkpGU2hOdTJ2S3Vac2xFOXVt?=
 =?utf-8?B?S25HaDE1bzl0UGJKYWNIS3NabGVvTEhjbVluRC92em1IcHFlOGY3TUpvZXRH?=
 =?utf-8?B?MDFHK1RPR1MwZnVJUlNFMEI5bERNcDlrY1RIbFZrc0ttRXRKY0VneDAySStT?=
 =?utf-8?B?dGZ6RXRqV2E5Q0MrMEQwbTR4Rks3VkJDSEdCTklmS3RHRysvMUZ5R1FBcVVI?=
 =?utf-8?B?MEZvbjRiOExybmRwMEprZHBXZ0pOZXZBSVAzRlFsYWpwWWM0V3A1b3AzeDBP?=
 =?utf-8?B?cmFyQ0pQNlFUYVZzN29NM01LdzF4R0dxelU1bDFBaGVIaXhFRnZmMk9yeFpH?=
 =?utf-8?B?WmpMVUorVkpJSGlTZXhFaTI1bHNDNFllQVE3bmdIcnBNNTBNSExxT0cvRDhS?=
 =?utf-8?B?S09pU0lQWEdYQ3gvME1lL3FLMGhqWEdkMGxWZVo3V2RWWDRVUC90OVY1bUJi?=
 =?utf-8?B?MUt4RHgxVHBtS3Q0RTZ4NDdaNU41Nk5BOWdqQU15UkdoS2NySVUyeVFZa3Vl?=
 =?utf-8?B?QmFjMlpWb1MxT2pnNFFGaUlCeVlOUUZrUkZhTHgxcVk5ZEhyZlpOU2FSbGJ2?=
 =?utf-8?B?b2pqRGpvMmVCLzhkK1RiWUtvOStYenU5Y3NyU0ptcDlOSW5Bekw2M0xXb2RR?=
 =?utf-8?B?S3dqRXN0YlZCcXJwVFVLU21vZVVscURDLzRQN1hHT21OMWUybU9IU3prTUI1?=
 =?utf-8?B?N3A1eWNndkU0bVFMR3FaNjVPbVg3akJYSlBlZWw5MTUwdlVSTk9KaE1uNkwv?=
 =?utf-8?B?MkZBR0k5dSs0LzVIMklINkl5STBzWXZiVW9zRkVzMGJ0cXMvK0lEanVNQTFG?=
 =?utf-8?B?R21NTVF3a0liczJyV3JMblNBTmRRZ050c1psbUFZTzFsTVMwd3RYVkxJU0hr?=
 =?utf-8?B?bTRFcVN3SFBkZjJramlTb2JxVk54dFVFNDQ1R0F0RVFxQ2xFRDMzWWpWbFpZ?=
 =?utf-8?B?R1p3NVMrRkhFL1FLcjhyRzJLSCtzWFpTQUpUdmEwSmpyUVp6SjV1d2RlKzFV?=
 =?utf-8?B?dFl1WXYvUFpRWVBCZ2kvVlZxcFFiU1A5VnE5RkJxTXdyZk1odDZTVjhpTHlP?=
 =?utf-8?B?RXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 975a0324-7996-4e73-9b82-08dd5aea0125
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 06:58:44.4175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: reKYLQf/fJ4t5uJVKTAS9l6o3kzL6L6W2SUojLYEB0bUrMGZj0b15lJTHxiVQD+SM0jPbGb/4AS3ul7GpJIoPmQ6Y/o2gZR9jHnq9c0/lSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10007

SGkgUnVzc2VsIGtpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
UnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+DQo+IFNlbnQ6IDAzIE1hcmNoIDIw
MjUgMTE6MTkNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAzLzNdIG5ldDogc3RtbWFjOiBBZGQgRFdN
QUMgZ2x1ZSBsYXllciBmb3IgUmVuZXNhcyBHQkVUSA0KPiANCj4gT24gU3VuLCBNYXIgMDIsIDIw
MjUgYXQgMTA6MDI6MTVQTSArMDAwMCwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6DQo+ID4gSGkgUnVz
c2VsbCwNCj4gPg0KPiA+IE9uIFN1biwgTWFyIDIsIDIwMjUgYXQgOTo0NOKAr1BNIFJ1c3NlbGwg
S2luZyAoT3JhY2xlKQ0KPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOg0KPiA+ID4N
Cj4gPiA+IE9uIFN1biwgTWFyIDAyLCAyMDI1IGF0IDA5OjIwOjQ5UE0gKzAwMDAsIExhZCwgUHJh
Ymhha2FyIHdyb3RlOg0KPiA+ID4gPiBIaSBSdXNzZWxsLA0KPiA+ID4gPiA+IFdoYXQgaXMgdGhl
IHJlYXNvbiBmb3Igc2V0dGluZyB0aGlzIGZsYWc/IElmIGl0J3MgYmVjYXVzZSBvZg0KPiA+ID4g
PiA+IHN1c3BlbmQvIHJlc3VtZSBmYWlsdXJlcywgZG9lcyBteSAibmV0OiBzdG1tYWM6IGZpeCBy
ZXN1bWUNCj4gPiA+ID4gPiBmYWlsdXJlcyBkdWUgdG8gUlggY2xvY2siIHNlcmllcyBzb2x2ZSB0
aGlzIGZvciB5b3Ugd2l0aG91dCByZXF1aXJpbmcgdGhpcyBmbGFnPw0KPiA+ID4gPiA+DQo+ID4g
PiA+IEl2ZSBzZXQgdGhpcyBmbGFnIGJhc2VkIG9uIHRoZSBjb25maWd1cmF0aW9uIHN1cHBvcnRl
ZCBieSB0aGlzIElQLg0KPiA+ID4gPiBVbmZvcnR1bmF0ZWx5IHRoZSBwbGF0Zm9ybSB3aGljaCBJ
IGFtIHdvcmtpbmcgb24gZG9lc24ndCBzdXBwb3J0DQo+ID4gPiA+IHMyciB5ZXQgc28gSSBjYW5u
b3QgdGVzdCBzdXNwZW5kL3Jlc3VtZSBwYXRoIHlldC4gQnV0IEkgZG8gc2VlIGFuDQo+ID4gPiA+
IGlzc3VlIHdoZW4gSSB1bmxvYWQgYW5kIGxvYWQganVzdCB0aGUgZ2x1ZSBtb2R1bGUgdGhlIERN
QSByZXNldCBmYWlscy4NCj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHRoYXQgZmVlZGJhY2sgLSB0
aGF0J3MgYSBzY2VuYXJpbyBJIGhhZG4ndCBjb25zaWRlcmVkLg0KPiA+ID4NCj4gPiA+IEkgd2Fz
IHRyeWluZyB0byBhdm9pZCBoYXZpbmcgdG8gZGlzYWJsZSBMUEkgUlggY2xvY2stc3RvcCBvbiBz
dXNwZW5kDQo+ID4gPiBieSBlbnN1cmluZyB0aGF0IGl0IHdhcyBlbmFibGVkIGF0IHJlc3VtZSB0
aW1lLiBJIHRoaW5rIHRoYXQncw0KPiA+ID4gdmFsaWQsIGJ1dCB5b3UndmUgYnJvdWdodCB1cCBh
bm90aGVyIHNpbWlsYXIgc2NlbmFyaW86DQo+ID4gPg0KPiA+ID4gLSBkZXZpY2UgaXMgYnJvdWdo
dCB1cCwgY29uZmlndXJlcyBSWCBjbG9jayBzdG9wDQo+ID4gPiAtIGxpbmtzIHdpdGggbWVkaWEs
IG5lZ290aWF0ZXMgRUVFDQo+ID4gPiAtIGRyaXZlciBpcyB1bmxvYWRlZCwgbGluayBkb2Vzbid0
IGdvIGRvd24sIGJ1dCBkdWUgdG8gbm8gdHJhZmZpYyBnb2VzDQo+ID4gPiAgIGludG8gaWRsZSwg
c28gUlggY2xvY2sgaXMgc3RvcHBlZA0KPiA+ID4gLSBkcml2ZXIgcmVsb2FkZWQsIFJYIGNsb2Nr
IHN0aWxsIHN0b3BwZWQsIHJlc2V0IGZhaWxzDQo+ID4gPg0KPiA+ID4gSSB3b3VsZCBsaWtlIHRv
IHNvbHZlIHRoYXQgc28gd2UgY2FuIGdldCB0aGUgcG93ZXIgc2F2aW5ncyBmcm9tDQo+ID4gPiBz
dG9wcGluZyB0aGUgY2xvY2ssIGJ1dCBzdGlsbCBoYXZlIHJlc2V0IHdvcmsgd2hlbiBuZWNlc3Nh
cnkuDQo+ID4gPg0KPiA+IEkgd291bGQgYmUgaGFwcHkgdG8gdGVzdCB0aGUgcGF0Y2hlcyA7KQ0K
PiA+DQo+ID4gPiBJJ20gZ3Vlc3NpbmcgdGhhdCB0aGUgIkRNQSByZXNldCBmYWlscyIgcmVmZXJz
IHRvIHRoaXMgcGF0aDoNCj4gPiA+DQo+ID4gPiBzdG1tYWNfb3BlbigpIC0+IF9fc3RtbWFjX29w
ZW4oKSAtPiBzdG1tYWNfaHdfc2V0dXAoKSAtPg0KPiA+ID4gc3RtbWFjX2luaXRfZG1hX2VuZ2lu
ZSgpIC0+IHN0bW1hY19yZXNldCgpID8NCj4gPiA+DQo+ID4gWWVzLg0KPiA+DQo+ID4gPiBJbiBv
dGhlciB3b3Jkcywgd2hlbiB0aGUgZGV2aWNlIGlzIGJlaW5nIGJyb3VnaHQgYmFjayB1cA0KPiA+
ID4gYWRtaW5zaXRyYXRpdmVseT8NCj4gPiA+DQo+ID4gPiBXaGF0IGhhcHBlbnMgaWYgeW91IChy
ZXBsYWNlICRpZik6DQo+ID4gPg0KPiA+ID4gIyBpcCBsaSBzZXQgZGV2ICRpZiBkb3duDQo+ID4g
PiAjIGlwIGxpIHNldCBkZXYgJGlmIHVwDQo+ID4gPg0KPiA+ID4gRG9lcyB0aGF0IGFsc28gZmFp
bCB3aXRob3V0IFNUTU1BQ19GTEFHX1JYX0NMS19SVU5TX0lOX0xQSSBzZXQ/DQo+ID4gPg0KPiA+
IExvZ3Mgd2l0aG91dCBTVE1NQUNfRkxBR19SWF9DTEtfUlVOU19JTl9MUEkgZmxhZyBzZXQ6DQo+
ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gPiByb290QHJ6djJoLWV2ay1hbHBoYTp+IyBpcCBsaSBzZXQgZGV2IGV0aDEg
ZG93bg0KPiA+IFsgICAzMy42MDY1NDldIHJlbmVzYXMtZ2JldGggMTVjNDAwMDAuZXRoZXJuZXQg
ZXRoMTogTGluayBpcyBEb3duDQo+ID4gcm9vdEByenYyaC1ldmstYWxwaGE6fiMNCj4gPiByb290
QHJ6djJoLWV2ay1hbHBoYTp+IyBpcCBsaSBzZXQgZGV2IGV0aDAgZG93bg0KPiA+IFsgICAzNy4z
NTY5OTJdIHJlbmVzYXMtZ2JldGggMTVjMzAwMDAuZXRoZXJuZXQgZXRoMDogTGluayBpcyBEb3du
DQo+ID4gcm9vdEByenYyaC1ldmstYWxwaGE6fiMNCj4gPiByb290QHJ6djJoLWV2ay1hbHBoYTp+
IyBpcCBsaSBzZXQgZGV2IGV0aDEgdXANCj4gPiBbICAgNDMuOTc0ODAzXSByZW5lc2FzLWdiZXRo
IDE1YzQwMDAwLmV0aGVybmV0IGV0aDE6IFJlZ2lzdGVyDQo+ID4gTUVNX1RZUEVfUEFHRV9QT09M
IFJ4US0wDQo+ID4gWyAgIDQzLjk4MzE4OV0gcmVuZXNhcy1nYmV0aCAxNWM0MDAwMC5ldGhlcm5l
dCBldGgxOiBSZWdpc3Rlcg0KPiA+IE1FTV9UWVBFX1BBR0VfUE9PTCBSeFEtMQ0KPiA+IFsgICA0
My45OTExNTVdIHJlbmVzYXMtZ2JldGggMTVjNDAwMDAuZXRoZXJuZXQgZXRoMTogUmVnaXN0ZXIN
Cj4gPiBNRU1fVFlQRV9QQUdFX1BPT0wgUnhRLTINCj4gPiBbICAgNDMuOTk5MTI4XSByZW5lc2Fz
LWdiZXRoIDE1YzQwMDAwLmV0aGVybmV0IGV0aDE6IFJlZ2lzdGVyDQo+ID4gTUVNX1RZUEVfUEFH
RV9QT09MIFJ4US0zDQo+ID4gWyAgIDQ0LjA3MjA3OV0gcmVuZXNhcy1nYmV0aCAxNWM0MDAwMC5l
dGhlcm5ldCBldGgxOiBQSFkgW3N0bW1hYy0xOjAwXQ0KPiA+IGRyaXZlciBbTWljcm9jaGlwIEtT
WjkxMzEgR2lnYWJpdCBQSFldIChpcnE9UE9MTCkNCj4gPiBbICAgNDQuMDk0NjA1XSBkd21hYzQ6
IE1hc3RlciBBWEkgcGVyZm9ybXMgZml4ZWQgYnVyc3QgbGVuZ3RoDQo+ID4gWyAgIDQ0LjEwMDEz
OF0gcmVuZXNhcy1nYmV0aCAxNWM0MDAwMC5ldGhlcm5ldCBldGgxOiBObyBTYWZldHkNCj4gPiBG
ZWF0dXJlcyBzdXBwb3J0IGZvdW5kDQo+ID4gWyAgIDQ0LjEwNzc0OF0gcmVuZXNhcy1nYmV0aCAx
NWM0MDAwMC5ldGhlcm5ldCBldGgxOiBJRUVFIDE1ODgtMjAwOA0KPiA+IEFkdmFuY2VkIFRpbWVz
dGFtcCBzdXBwb3J0ZWQNCj4gPiBbICAgNDQuMTE2NzI1XSByZW5lc2FzLWdiZXRoIDE1YzQwMDAw
LmV0aGVybmV0IGV0aDE6IHJlZ2lzdGVyZWQgUFRQIGNsb2NrDQo+ID4gWyAgIDQ0LjEyMzM1Ml0g
cmVuZXNhcy1nYmV0aCAxNWM0MDAwMC5ldGhlcm5ldCBldGgxOiBjb25maWd1cmluZyBmb3INCj4g
PiBwaHkvcmdtaWktaWQgbGluayBtb2RlDQo+ID4gcm9vdEByenYyaC1ldmstYWxwaGE6fiMNCj4g
PiByb290QHJ6djJoLWV2ay1hbHBoYTp+IyBpcCBsaSBzZXQgZGV2IGV0aDFbICAgNDcuMjA3NzYx
XSByZW5lc2FzLWdiZXRoDQo+ID4gMTVjNDAwMDAuZXRoZXJuZXQgZXRoMTogTGluayBpcyBVcCAt
IDFHYnBzL0Z1bGwgLSBmbG93IGNvbnRyb2wgb2ZmIF5DDQo+ID4gcm9vdEByenYyaC1ldmstYWxw
aGE6fiMgXkMgcm9vdEByenYyaC1ldmstYWxwaGE6fiMgaXAgbGkgc2V0IGRldiBldGgwDQo+ID4g
dXANCj4gPiBbICAgNTUuNjM2NzIyXSByZW5lc2FzLWdiZXRoIDE1YzMwMDAwLmV0aGVybmV0IGV0
aDA6IFJlZ2lzdGVyDQo+ID4gTUVNX1RZUEVfUEFHRV9QT09MIFJ4US0wDQo+ID4gWyAgIDU1LjY0
NTEzOV0gcmVuZXNhcy1nYmV0aCAxNWMzMDAwMC5ldGhlcm5ldCBldGgwOiBSZWdpc3Rlcg0KPiA+
IE1FTV9UWVBFX1BBR0VfUE9PTCBSeFEtMQ0KPiA+IFsgICA1NS42NTMxMTFdIHJlbmVzYXMtZ2Jl
dGggMTVjMzAwMDAuZXRoZXJuZXQgZXRoMDogUmVnaXN0ZXINCj4gPiBNRU1fVFlQRV9QQUdFX1BP
T0wgUnhRLTINCj4gPiBbICAgNTUuNjYxMDczXSByZW5lc2FzLWdiZXRoIDE1YzMwMDAwLmV0aGVy
bmV0IGV0aDA6IFJlZ2lzdGVyDQo+ID4gTUVNX1RZUEVfUEFHRV9QT09MIFJ4US0zDQo+ID4gWyAg
IDU1LjczMjA4N10gcmVuZXNhcy1nYmV0aCAxNWMzMDAwMC5ldGhlcm5ldCBldGgwOiBQSFkgW3N0
bW1hYy0wOjAwXQ0KPiA+IGRyaXZlciBbTWljcm9jaGlwIEtTWjkxMzEgR2lnYWJpdCBQSFldIChp
cnE9UE9MTCkNCj4gPiBbICAgNTUuNzU0NjEyXSBkd21hYzQ6IE1hc3RlciBBWEkgcGVyZm9ybXMg
Zml4ZWQgYnVyc3QgbGVuZ3RoDQo+ID4gWyAgIDU1Ljc2MDE0M10gcmVuZXNhcy1nYmV0aCAxNWMz
MDAwMC5ldGhlcm5ldCBldGgwOiBObyBTYWZldHkNCj4gPiBGZWF0dXJlcyBzdXBwb3J0IGZvdW5k
DQo+ID4gWyAgIDU1Ljc2Nzc0MF0gcmVuZXNhcy1nYmV0aCAxNWMzMDAwMC5ldGhlcm5ldCBldGgw
OiBJRUVFIDE1ODgtMjAwOA0KPiA+IEFkdmFuY2VkIFRpbWVzdGFtcCBzdXBwb3J0ZWQNCj4gPiBb
ICAgNTUuNzc2NzA1XSByZW5lc2FzLWdiZXRoIDE1YzMwMDAwLmV0aGVybmV0IGV0aDA6IHJlZ2lz
dGVyZWQgUFRQIGNsb2NrDQo+ID4gWyAgIDU1Ljc4MzMzM10gcmVuZXNhcy1nYmV0aCAxNWMzMDAw
MC5ldGhlcm5ldCBldGgwOiBjb25maWd1cmluZyBmb3INCj4gPiBwaHkvcmdtaWktaWQgbGluayBt
b2RlDQo+ID4gcm9vdEByenYyaC1ldmstYWxwaGE6fiMNCj4gPiByb290QHJ6djJoLWV2ay1hbHBo
YTp+IyBbICAgNTguODU1ODQ0XSByZW5lc2FzLWdiZXRoIDE1YzMwMDAwLmV0aGVybmV0DQo+ID4g
ZXRoMDogdHhfY2xrX3N0b3A9MQ0KPiA+IFsgICA1OC44NjE5ODldIHJlbmVzYXMtZ2JldGggMTVj
MzAwMDAuZXRoZXJuZXQgZXRoMDogTGluayBpcyBVcCAtDQo+ID4gMUdicHMvRnVsbCAtIGZsb3cg
Y29udHJvbCByeC90eA0KPiA+DQo+ID4gcm9vdEByenYyaC1ldmstYWxwaGE6fiMNCj4gPiByb290
QHJ6djJoLWV2ay1hbHBoYTp+Iw0KPiA+DQo+ID4gTG9ncyB3aXRoIFNUTU1BQ19GTEFHX1JYX0NM
S19SVU5TX0lOX0xQSSBmbGFnIHNldDoNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IHJvb3RAcnp2MmgtZXZrLWFs
cGhhOn4jIGlwIGxpIHNldCBkZXYgZXRoMSBkb3duDQo+ID4gWyAgIDMwLjA1Mzc5MF0gcmVuZXNh
cy1nYmV0aCAxNWM0MDAwMC5ldGhlcm5ldCBldGgxOiBMaW5rIGlzIERvd24NCj4gPiByb290QHJ6
djJoLWV2ay1hbHBoYTp+IyBpcCBsaSBzZXQgZGV2IGV0aDAgZG93bg0KPiA+IFsgICAzNS4zNjY5
MzVdIHJlbmVzYXMtZ2JldGggMTVjMzAwMDAuZXRoZXJuZXQgZXRoMDogTGluayBpcyBEb3duDQo+
ID4gcm9vdEByenYyaC1ldmstYWxwaGE6fiMgaXAgbGkgc2V0IGRldiBldGgxIHVwDQo+ID4gWyAg
IDQwLjQ0ODU2M10gcmVuZXNhcy1nYmV0aCAxNWM0MDAwMC5ldGhlcm5ldCBldGgxOiBSZWdpc3Rl
cg0KPiA+IE1FTV9UWVBFX1BBR0VfUE9PTCBSeFEtMA0KPiA+IFsgICA0MC40NTY3MjVdIHJlbmVz
YXMtZ2JldGggMTVjNDAwMDAuZXRoZXJuZXQgZXRoMTogUmVnaXN0ZXINCj4gPiBNRU1fVFlQRV9Q
QUdFX1BPT0wgUnhRLTENCj4gPiBbICAgNDAuNDY0ODkzXSByZW5lc2FzLWdiZXRoIDE1YzQwMDAw
LmV0aGVybmV0IGV0aDE6IFJlZ2lzdGVyDQo+ID4gTUVNX1RZUEVfUEFHRV9QT09MIFJ4US0yDQo+
ID4gWyAgIDQwLjQ3Mjg0MF0gcmVuZXNhcy1nYmV0aCAxNWM0MDAwMC5ldGhlcm5ldCBldGgxOiBS
ZWdpc3Rlcg0KPiA+IE1FTV9UWVBFX1BBR0VfUE9PTCBSeFEtMw0KPiA+IFsgICA0MC41NDM4OTVd
IHJlbmVzYXMtZ2JldGggMTVjNDAwMDAuZXRoZXJuZXQgZXRoMTogUEhZIFtzdG1tYWMtMTowMF0N
Cj4gPiBkcml2ZXIgW01pY3JvY2hpcCBLU1o5MTMxIEdpZ2FiaXQgUEhZXSAoaXJxPVBPTEwpDQo+
ID4gWyAgIDQwLjU2NjQxOV0gZHdtYWM0OiBNYXN0ZXIgQVhJIHBlcmZvcm1zIGZpeGVkIGJ1cnN0
IGxlbmd0aA0KPiA+IFsgICA0MC41NzE5NDldIHJlbmVzYXMtZ2JldGggMTVjNDAwMDAuZXRoZXJu
ZXQgZXRoMTogTm8gU2FmZXR5DQo+ID4gRmVhdHVyZXMgc3VwcG9ydCBmb3VuZA0KPiA+IFsgICA0
MC41Nzk1NTBdIHJlbmVzYXMtZ2JldGggMTVjNDAwMDAuZXRoZXJuZXQgZXRoMTogSUVFRSAxNTg4
LTIwMDgNCj4gPiBBZHZhbmNlZCBUaW1lc3RhbXAgc3VwcG9ydGVkDQo+ID4gWyAgIDQwLjU4ODUw
NV0gcmVuZXNhcy1nYmV0aCAxNWM0MDAwMC5ldGhlcm5ldCBldGgxOiByZWdpc3RlcmVkIFBUUCBj
bG9jaw0KPiA+IFsgICA0MC41OTUxMzVdIHJlbmVzYXMtZ2JldGggMTVjNDAwMDAuZXRoZXJuZXQg
ZXRoMTogY29uZmlndXJpbmcgZm9yDQo+ID4gcGh5L3JnbWlpLWlkIGxpbmsgbW9kZQ0KPiA+IHJv
b3RAcnp2MmgtZXZrLWFscGhhOn4jDQo+ID4gcm9vdEByenYyaC1ldmstYWxwaGE6fiMgWyAgIDQz
LjY4NzU1MV0gcmVuZXNhcy1nYmV0aCAxNWM0MDAwMC5ldGhlcm5ldA0KPiA+IGV0aDE6IExpbmsg
aXMgVXAgLSAxR2Jwcy9GdWxsIC0gZmxvdyBjb250cm9sIG9mZg0KPiA+DQo+ID4gcm9vdEByenYy
aC1ldmstYWxwaGE6fiMgaXAgbGkgc2V0IGRldiBldGgwIHVwDQo+ID4gWyAgIDQ5LjY0NDQ3OV0g
cmVuZXNhcy1nYmV0aCAxNWMzMDAwMC5ldGhlcm5ldCBldGgwOiBSZWdpc3Rlcg0KPiA+IE1FTV9U
WVBFX1BBR0VfUE9PTCBSeFEtMA0KPiA+IFsgICA0OS42NTI3MTldIHJlbmVzYXMtZ2JldGggMTVj
MzAwMDAuZXRoZXJuZXQgZXRoMDogUmVnaXN0ZXINCj4gPiBNRU1fVFlQRV9QQUdFX1BPT0wgUnhR
LTENCj4gPiBbICAgNDkuNjYwNjgxXSByZW5lc2FzLWdiZXRoIDE1YzMwMDAwLmV0aGVybmV0IGV0
aDA6IFJlZ2lzdGVyDQo+ID4gTUVNX1RZUEVfUEFHRV9QT09MIFJ4US0yDQo+ID4gWyAgIDQ5LjY2
OTA1OV0gcmVuZXNhcy1nYmV0aCAxNWMzMDAwMC5ldGhlcm5ldCBldGgwOiBSZWdpc3Rlcg0KPiA+
IE1FTV9UWVBFX1BBR0VfUE9PTCBSeFEtMw0KPiA+IFsgICA0OS43NDAwMTFdIHJlbmVzYXMtZ2Jl
dGggMTVjMzAwMDAuZXRoZXJuZXQgZXRoMDogUEhZIFtzdG1tYWMtMDowMF0NCj4gPiBkcml2ZXIg
W01pY3JvY2hpcCBLU1o5MTMxIEdpZ2FiaXQgUEhZXSAoaXJxPVBPTEwpDQo+ID4gWyAgIDQ5Ljc2
MjUxOF0gZHdtYWM0OiBNYXN0ZXIgQVhJIHBlcmZvcm1zIGZpeGVkIGJ1cnN0IGxlbmd0aA0KPiA+
IFsgICA0OS43NjgwNTddIHJlbmVzYXMtZ2JldGggMTVjMzAwMDAuZXRoZXJuZXQgZXRoMDogTm8g
U2FmZXR5DQo+ID4gRmVhdHVyZXMgc3VwcG9ydCBmb3VuZA0KPiA+IFsgICA0OS43NzU2NTVdIHJl
bmVzYXMtZ2JldGggMTVjMzAwMDAuZXRoZXJuZXQgZXRoMDogSUVFRSAxNTg4LTIwMDgNCj4gPiBB
ZHZhbmNlZCBUaW1lc3RhbXAgc3VwcG9ydGVkDQo+ID4gWyAgIDQ5Ljc4NDYwOV0gcmVuZXNhcy1n
YmV0aCAxNWMzMDAwMC5ldGhlcm5ldCBldGgwOiByZWdpc3RlcmVkIFBUUCBjbG9jaw0KPiA+IFsg
ICA0OS43OTEyMzZdIHJlbmVzYXMtZ2JldGggMTVjMzAwMDAuZXRoZXJuZXQgZXRoMDogY29uZmln
dXJpbmcgZm9yDQo+ID4gcGh5L3JnbWlpLWlkIGxpbmsgbW9kZQ0KPiA+IHJvb3RAcnp2MmgtZXZr
LWFscGhhOn4jDQo+ID4gcm9vdEByenYyaC1ldmstYWxwaGE6fiMgWyAgIDUyLjg3MTYzNV0gcmVu
ZXNhcy1nYmV0aCAxNWMzMDAwMC5ldGhlcm5ldA0KPiA+IGV0aDA6IHR4X2Nsa19zdG9wPTENCj4g
PiBbICAgNTIuODc3Nzc3XSByZW5lc2FzLWdiZXRoIDE1YzMwMDAwLmV0aGVybmV0IGV0aDA6IExp
bmsgaXMgVXAgLQ0KPiA+IDFHYnBzL0Z1bGwgLSBmbG93IGNvbnRyb2wgcngvdHgNCj4gDQpkb3du
L3VwcGluZyB0aGUgaW50ZXJmYWNlIGJ1dCBpdCBzZWVtcyB5b3UgZ2V0IGRpZmZlcmVudCBiZWhh
dmlvdXIuDQo+IA0KPiBJJ2QgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSB0aGF0IGlzLCBiZWNhdXNl
IGF0IHRoZSBtb21lbnQgSSdtIHdvbmRlcmluZyB3aGV0aGVyIG15IHBhdGNoZXMgdGhhdA0KPiBh
ZGRyZXNzIHRoZSBzdXNwZW5kL3Jlc3VtZSBuZWVkIGZ1cnRoZXIgd29yayBiZWZvcmUgSSBzZW5k
IHRoZW0gLSBidXQgaW4gb3JkZXIgdG8gYXNzZXNzIHRoYXQsIEkgbmVlZA0KPiB0byB3b3JrIG91
dCB3aHkgeW91ciBpc3N1ZSBvbmx5IHNlZW1zIHRvIG9jY3VyIGluIHRoZSBtb2R1bGUgcmVtb3Zh
bC9pbnNlcnRpb24gYW5kIG5vdCBkb3duL3VwIGFzIHdlbGwNCj4gYXMgSSdkIGV4cGVjdC4NCg0K
RllJLCBXaXRoIGxpbnV4IG5leHQsIE9uIFJaL0czRSBTb0Mgd2hpY2ggaGFzIHNpbWlsYXIgSVAg
YXMgUlovVjJILCBldGhlcm5ldCB3b3JrcyBkdXJpbmcgc3VzcGVuZCBlbnRyeS9leGl0DQpFdmVu
IHRob3VnaCBTVFIgaXMgbm90IGZ1bGx5IGZ1bmN0aW9uYWwgeWV0Lg0KDQpJIGhhdmUgaW50ZWdy
YXRlZCBLRVlfU0xFRVAgYnV0dG9uIG9uIFJaL0czRS4gT24gcHJlc3NpbmcgdGhlIGJ1dHRvbiwg
SSBjYW4gc2VlIHRoZSBldGhlcm5ldCBsaW5rIGdvZXMgZG93biBkdXJpbmcNCnN1c3BlbmQgZW50
cnkgYW5kIGxpbmsgdXAgaGFwcGVucyBkdXJpbmcgc3VzcGVuZCBleGl0Lg0KDQpJIHdpbGwgdGVz
dCB5b3VyIHN1c3BlbmQvcmVzdW1lIHBhdGNoIHNvb24gd2l0aCBuZXQtbmV4dC4NCg0KQ2hlZXJz
LA0KQmlqdSANCg==


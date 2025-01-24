Return-Path: <linux-renesas-soc+bounces-12484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE40A1BC3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 19:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C2853AD61C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 18:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0267219A8B;
	Fri, 24 Jan 2025 18:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Uqb0R8QM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDD0158DC6;
	Fri, 24 Jan 2025 18:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737743776; cv=fail; b=NX1kJ0kvvEUvPPOln3XEdfvc2XEJF0UEhqQ+zGvbhiRUdnQV0pygm+kuKI6s5khDA8YjvxanuOoU5TU+P56SzChkdTNMbfaQ9VB2Ag3jeCfmSrdqK6pnsPThdLAnsVXb6pEQa6d74LXfqC0mAnXDGTYCI5jzpu9Z0hdBMIsRzvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737743776; c=relaxed/simple;
	bh=aW4sXHaQnGfJSMYZQqTe05ZB+DpXGHQnEY/5FogwqOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L1iXcXNBsrS95Gp6vohdazwNLNuC+tflsV888CRWRkc1DGmzpzgbnUYSz0497RrddTb1Zs8fas5BsBY558StdUblHbD/N+c6RQ8Z5xJZjj37ezIbkI/rVSVK+iBwsfnBZqjQ6qRDHh728KwAMkQaylgLbtmai/gyPwFuAULHD+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Uqb0R8QM; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yu6K7VhNlqnpqo2hLleg8O3vpfTMzO0nUSCIkf0Y/IDfLrJs+aqi0jahKVyR7pxxJpGTrbp2KAG7RTZVTMTXu1voQrz9U6JfKzAiWH7rPp4PAej29qwwm6knS/vVuIYNxBzF9BCGxy0bB9vvfjYQMpwPb36dRurbb6Ioqwv/02bxgMCgy/I1QkHvGYnxyUuvLeOc02F32s+bKeSfI1XrAE89bnGRy+gnfImm36Br9Us00Gnyu8TC6cLzEwXlFXIE0DKi968LmT4Bu0AM1qR9bIzmCSdauMIA+lNqrRq8N3mzz1TfrEcQq8prn0Fw+OwP5jW0HsOCuOVZchE4+yHdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aW4sXHaQnGfJSMYZQqTe05ZB+DpXGHQnEY/5FogwqOA=;
 b=ax3DZVJIBtpGFRxphsmBjn9w9ftCqCEZUTOjMvnfiawhKp9Wjo8fGvfS4Hw113bKKTpR9wjcSim1GXz5NY2ECl17xuhn07naJjzamfo1SAS/Kb0HPP80nsOA8mW5m3Hratl9Lz0stAyHUsOAqYIzv1ShpZ4QpJQH2S6IUYn7Rl0qcEBBHwRiN/TshAPKlF4yfm07N+yBY1OLZDyCmlCrybWE5SdBvHRxFfqN5WhNJNuPkDWQYHJS/G/4eE2/9jJJ/23kotNt3xw/PWlcgMJV+tFpRrYNl/WJFS4Saz2Ux2yEs9S8iAg2XxgwHWeTL039Q8FV9+IpNc0rONzmtID6DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aW4sXHaQnGfJSMYZQqTe05ZB+DpXGHQnEY/5FogwqOA=;
 b=Uqb0R8QMyEQfj1R+32FehzF59x+SiZIO/qk0z1+lmDd/6DTafDz84nxPS5bSs4kvO3z7fY09VClcAeYjUweSjEjQNk4sd1vspOyQJuGopatNah1Lh2mvUgelm+eJrP/iw2jtioudrxa1wNk0EmZerQdf3vR+164EAfvSndv9suY=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TY3PR01MB11873.jpnprd01.prod.outlook.com (2603:1096:400:404::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 18:36:11 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 18:36:11 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "magnus.damm@gmail.com"
	<magnus.damm@gmail.com>
Subject: RE: [PATCH v4 8/9] arm64: dts: renesas: r9a09g047: Add sys node
Thread-Topic: [PATCH v4 8/9] arm64: dts: renesas: r9a09g047: Add sys node
Thread-Index: AQHbbbkbPFMLnwYhN0OV0rbXULDJDLMl/AWAgABF0MA=
Date: Fri, 24 Jan 2025 18:36:11 +0000
Message-ID:
 <OSBPR01MB2775EB56E49E06B0002878BBFFE32@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
 <20250123170508.13578-9-john.madieu.xa@bp.renesas.com>
 <CAMuHMdV1X+wg-oTbv-kXhTjE4exznCYm2-W+HnmVcBLCXVyGBw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV1X+wg-oTbv-kXhTjE4exznCYm2-W+HnmVcBLCXVyGBw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TY3PR01MB11873:EE_
x-ms-office365-filtering-correlation-id: 2a16e5e6-caa0-4998-5421-08dd3ca5f9b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R09rNWVrb3lUQ00rc3ZPNG9uZHh6Q3EveEFFQ0hNZW1uQ1grdWJ3VjJsSkIy?=
 =?utf-8?B?WkN0TWlrRzloTkF4c3BRNldibWdTWU5xK05LNmFaWmVLakFEbFhpamc0bkdh?=
 =?utf-8?B?d3YzOHJidDhEZVF1QUZ0aTMxaWRyYTBVa3lsMmxVVGtVOWRwQWtOdWdiTlV4?=
 =?utf-8?B?R3M1UHBjSitMVW16R09mTEVYK0VJTFBLQTFzTlJRV3N1cHZxSzE4Mkg1QlRW?=
 =?utf-8?B?ZllhSUhQcThpVEhIb0N0TVFIZi9SUG9rOXRaRjZpVnk3Z1pKVFY0SG1PZGRH?=
 =?utf-8?B?bTVEWlVhOU5wMjFjNGtLbFc0Ny9NSDl6SitJRXpGb3ZISk9NenRKSytPekQy?=
 =?utf-8?B?NEhUNG9YRUZUV1VENEc3ODdjaXViYnR4TEcxb2JGcFNIOEJ0VHZxQ2RLa01L?=
 =?utf-8?B?ZHR6NmtBZHAvY2ErSmNGdGM0aTVXQVZsek5vQVdSVGg2NHVMR2kvQ2dSQS83?=
 =?utf-8?B?UUJkcVp2SUw5QkFWQnBZa3B3UmdNZjduWmxJekFvTmNkU2lCaEE4U0JXdy83?=
 =?utf-8?B?QTJoSWdycGFtVUJreG1ZVE13VnJFRTc5emdRVGk5dE52TzdNSzl4U01mZ1R4?=
 =?utf-8?B?ZEJNVHB0ZEtOK0oyRGNRQ0IzU0tBSkpaL3VVSFY3KzBoMm05QjhRUk9XdUZN?=
 =?utf-8?B?aUNUNWtiNWVTQTB0dWR1K29BSkxicGJ0MUplTGhwRm1IZnErUTN3VENuVW83?=
 =?utf-8?B?SHcwQTRweW1Zb3M2MkxMZkZMcm4zckpTVGE2REduRStJUHZ5amJKaGxwMGFB?=
 =?utf-8?B?R3MzK0dkM2hGeStaYldELzZuTmxLTy9KM3k1Ny85Tm12ejJITjlmNVdjM2tN?=
 =?utf-8?B?MkdzdElIOXZkK1ZEUzhxLzhZZElKVlBXL0M4QTAzM3F0Z0xiYlVSUlpOUUVV?=
 =?utf-8?B?c051b2N4TGpHck9YTWVNeDZkK3hFM1dUM1UyR0VoaStqejJKS3gwSHU4UFV3?=
 =?utf-8?B?eXVrWkZKZlFyc3BoaHFtVzhRVHdPN05rdVVMNFJIeXhVYXlEbjFpMXlyMjhB?=
 =?utf-8?B?a1dUQkd0b05QbDRSV2hDRmw5OTBaRjIzUHlVSFFYQjN3YWlNMzRRZ0RGb3Jp?=
 =?utf-8?B?T3g2MEFleU1meWJaMjg0UEtKbktQZ0dsKzhBT0JXVzExTkxRcFJDeGpvZWpJ?=
 =?utf-8?B?N3BCL2FmT0RmU1JsRGl6ZzEwVkV5V2JwSnYrUUNydi84ZG1meElKbWtBWDJ5?=
 =?utf-8?B?UU9mQXdOWDQ5b1U1SEw0TXFPNEhBWXVML1RybnRmQkZqUkUwbEVqakJueHNT?=
 =?utf-8?B?VndLRnNUVnRqQmVKZ2dvNENreWJFMFQyOUJSUVJFcXEwdVM0cXN5LzZ5eWlz?=
 =?utf-8?B?WWNPL0pkN2paU0FiWVVSR1lHTU53clR4SjgzYVpQbHV0Q1kzOGdERERua2Ns?=
 =?utf-8?B?TktIRGZSWHlhYUtSUkVIcHR0cWNtamhacmNFMDVzTGNvUUlJOGNweWpKNy9l?=
 =?utf-8?B?Q0FCbWtmWWttOVZvUWFPaW9DQmNzRFNpZjZKblZYWVhrNTBwWGxjUG40YnE0?=
 =?utf-8?B?V3daMG5oMEwxdzYvM1RSalpzakd6MTFGNEljWHNaTmlwbmpldk94WDhQOEJT?=
 =?utf-8?B?RVlKZlZjTGhnMldFRlN5a1R2djlMeEFWaXBCVWhzTStjRFZ5VExBVFFHak9n?=
 =?utf-8?B?Yld4S2F3bzdNUXR3bjhpWWxyZFdncjJzNW9FRXBQQlNRZHlsTlY4QzkxM0lP?=
 =?utf-8?B?Smg4NTFMaXo1T1JYSmFpVkEyQzZSOTdZWE1Sc2QreVJuV0h0eFdWbEJoem9Z?=
 =?utf-8?B?WDd0SFVNRlhIQXNkRHlldzBCdW1xMzhER3VtWFluaDJQcmxScVY2ZnZiZGpm?=
 =?utf-8?B?RzMrcGkwU3l4OGx6dldmNjRwVlhjRGxMcFEwV1JsWlJuVW13bXE2dDhEZW1o?=
 =?utf-8?B?WVd3TmhRQjVNcDhIRTdONE9KRFBCRzdLTGNzSmlXdnNLL3ZLdWxKSW93eWNa?=
 =?utf-8?Q?NAdmWcOm0/DEPTNA6SXGVwJd+xPJlwUC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0dqZi9VMG9iRkpXTzVlKzRuWE9kc2E2UjNDM1hHd2MvZmIrUzR0YjE1eHFz?=
 =?utf-8?B?M2J3bjB3OVZoZVRjMmdxWVdzR1N2TkVlS25IZUdLRGY3Ym1kbDE5N2hIK2dy?=
 =?utf-8?B?M1BXK01VSmNRU2NQZVBaNDVsOXZQUE1QQ2RyR1cxS0JBZ3lxVFNXcVlRRFdB?=
 =?utf-8?B?aVl1REZOV3NIQ3UweTVlMERqTzJONDBrZjBMNTVlczVvby9laXJpRk91U1dj?=
 =?utf-8?B?THZVc0V2dnpzSUtuTTdkM244U21pSmJUR2daRW0zYTlHc3VwRmVWUmJyK1lO?=
 =?utf-8?B?dzJWYjZraEIzbkR5WlgvZ0p4Wk9ZWHpqeTNGU2pGVzltd1ZmWXAwU2hVVlBt?=
 =?utf-8?B?a2Rma3RWVS9wOUFwMlFKc2Q2SmZGOVZMNGxmZ0tpMlhiand2NVN2SzU4OGZO?=
 =?utf-8?B?MXlJQnQwUUZkaDl5enRZMHF2TWVxZTlidWp5V0U4MWRhdEFvK0d5Vm9SaXlp?=
 =?utf-8?B?alRCQUMzQmNjVXBCdHpjS0xGdnl5Q1BMVmNRWEpaenE1RjhQR0Rya1Q3L2Mr?=
 =?utf-8?B?RituU0pRbU9BRGZOSlFGYko3K0lXZktnOURVYWdkMThjRDFHdFgzOGFQZFZk?=
 =?utf-8?B?eWNGSkdTNWh6TFFVVUhqUmhBK2FMY2xpcFVvVzVsOUFiUTdNa2lGbmR5ZHlP?=
 =?utf-8?B?SnhJNG4ySkVaR2FSK3VrbjVmeE1xcWZ0d2N4Y042cWorTmZPRU5ZWXZ0Ty9p?=
 =?utf-8?B?TnNxby8wZW1oMys2YUdvS3B1VnpPbWFmZE05NWtKaWVqNitmM2tKRDQwV1cy?=
 =?utf-8?B?OStCR1FLRG56OHRZbTE1c1RxcEQvaHVhS3M3WWRBRFZtT2NpWnhudnkvYjhu?=
 =?utf-8?B?Q1hybWdaUmMreGQ5Tm9TWTNjRTZpYkNWS0doTFI5bU4wUFRBaUlqczNpdVFo?=
 =?utf-8?B?WHEzRnZxcXE0VkpySkp1YVJUSGNEdFRUcFFrOC9kYVpCUlNIV3kybGJOUi9U?=
 =?utf-8?B?RU1TVjVkQ1pkL0tGZGcyRzdwVVpEd0o2VnFsWTdqQnl3VzdZekRqcUMxTUtu?=
 =?utf-8?B?b1lDNnRTUjJVVXFBOGJIUlNmS0hyTUc2TzNHT21DUXkwQ3l3ZDg2TkkvWTUx?=
 =?utf-8?B?UTBYN2p2aTFBaUVlN05HOEd5Z1huRExtZ0tGQTJwTlhaZ1pGK216NXZkYjla?=
 =?utf-8?B?blZiazQweEMzZTJIM2JQcjJraHA3OUtFV2hOSXpONnpPdGhuK0lZUFl4MUtp?=
 =?utf-8?B?R1NsTkhlbXFDbjBNT2llRGREVXRMQ28vTUlRbW9QY2ZCSXdBN2REUENKU1k1?=
 =?utf-8?B?RXZOL1ByclpTek9mbGVOOGphZFlCYXBjeVBjVkpIdlhVaUVDVi9uREQvWmg4?=
 =?utf-8?B?Wk1XdWRoOHEzUHhTRGQ4OU5QdERCOEF1RW9mRGZuMThITlpZQXhrR3B1L1k1?=
 =?utf-8?B?eUpIQmc3d3RLTzZYRWhBL1FUS1UrNjQyb29pR1h5eGxtMi9RTlNCS2o0RWdB?=
 =?utf-8?B?WVlYZjZlYVlYM0JrTVBCWS9HT3FxM2ZzL2NyamoxVENYak9XZUk4Yk9KaE5U?=
 =?utf-8?B?aDFIQStwd3grUitFWERDejVOSkU3ajVMMzBhb0RNV1NINFZPL1FSWmwrTWdo?=
 =?utf-8?B?cm9XOE15WDhpY3IwMUhuSVZZUjVjQ1Z3TUdEeHZQWmRJRXRtRWpKVGxCOTVM?=
 =?utf-8?B?NHhQYTUxait5QzRpd2c5YTM5QzVuV1ZTMWs4Rk5mbkx6RmMvZ2FubDRkWm92?=
 =?utf-8?B?eUU4M1BoTmZ6enpwK3lHd2tQa05SQmRkQmdEQkg5MjIxcXNISStnSm9LSTA0?=
 =?utf-8?B?ekZvWTJsQ2xxYzdHZ3F6RjZzQVd5UlpiMDgvSkpPN21lNzlBWldDZk5CMTRs?=
 =?utf-8?B?cTlWbUx5b0dRSmcyRzU3Z0hPak4zUGhNSXF2V3hXVVEzMWdkbXRzWjc2Sng4?=
 =?utf-8?B?bSs4WUJVdk9WTzB4d1ZtR0lRV3ByWGFCcU9mVG9ZY2Nwem1sZ0VtS1BkMkc4?=
 =?utf-8?B?TFgxSFpRZjJ3UThZbkVpQ0RzUXh5ZlJZeHR5RTY2VWlSVS90MTRabVk3VUNE?=
 =?utf-8?B?UFBDUDFXMXRlMW12YmhJNzhkOEZJaDVwUUplSG5PSmNncjNvOVRmeVYrcFh4?=
 =?utf-8?B?TytaUUQ5UWNzaFltTmhDdGcyckxCSlhxOWpMdWVPcGIvZVllR2pMdEE3QWtP?=
 =?utf-8?B?c3FrZmtuV3h4OHZON2NYNzFzRFF4ZER3bVNvdlJ3UmxsL04zVUl6cWR3dVZ3?=
 =?utf-8?B?VXc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a16e5e6-caa0-4998-5421-08dd3ca5f9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 18:36:11.2828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uu93h6kBDvQ22/HIxXQRVCLvjIwjnq64DW0EJuQRCH57rrgc0HV1vGZlZ0d9QSyw6qqC2GhME39JUCIO0kpP8MKAGSL8AkIs1AZ9jfaxHO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11873

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI0LCAy
MDI1IDM6MjUgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA4LzldIGFybTY0OiBkdHM6IHJl
bmVzYXM6IHI5YTA5ZzA0NzogQWRkIHN5cyBub2RlDQo+IA0KDQpIaSBHZWVydCwNCg0KVGhhbmtz
IGZvciB5b3VyIHJldmlldy4NCg0KPiBIaSBKb2huLA0KPiANCj4gT24gVGh1LCBKYW4gMjMsIDIw
MjUgYXQgNjowNuKAr1BNIEpvaG4gTWFkaWV1DQo+IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4gQWRkIHN5c3RlbSBjb250cm9sbGVyIG5vZGUgdG8gUlovRzNFIChS
OUEwOUcwNDcpIFNvQyBEVFNJLCBhcyBpdCBpcw0KPiA+IGFsc28gcmVxdWlyZWQgZm9yIFNvQyBp
ZGVudGlmaWNhdGlvbg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBNYWRpZXUgPGpvaG4u
bWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0K
PiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3LmR0c2kN
Cj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3LmR0c2kNCj4g
PiBAQCAtMTYyLDYgKzE2MiwxMyBAQCBjcGc6IGNsb2NrLWNvbnRyb2xsZXJAMTA0MjAwMDAgew0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICNwb3dlci1kb21haW4tY2VsbHMgPSA8MD47DQo+
ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiArICAgICAgICAgICAgICAgc3lzOiBzeXN0
ZW0tY29udHJvbGxlckAxMDQzMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA5ZzA0Ny1zeXMiOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwwIDB4MTA0MzAwMDAgMCAweDEwMDAwPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfQ09SRSBSOUEwOUcwNDdfU1lTXzBfUENMSz47
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjcGcgMHgzMD47DQo+ID4g
KyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICAgICAgICAgICAgICAgICBvc3RtMDogdGlt
ZXJAMTE4MDAwMDAgew0KPiANCj4gVGhlIHBhdGNoIGFkZGluZyB0aGUgT1NUTSBub2RlIGhhc24n
dCBiZWVuIGFwcGxpZWQgb3IgZXZlbiBzdWJtaXR0ZWQgeWV0DQo+IDstKSAgQnV0IEkgY2FuIGhh
bmRsZS4uLg0KDQpUaGFua3MgZm9yIGhhbmRsaW5nIHRoaXMuDQoNCj4gDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA5ZzA0Ny1vc3RtIiwNCj4g
InJlbmVzYXMsb3N0bSI7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAw
eDExODAwMDAwIDB4MCAweDEwMDA+Ow0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZQ0KPiBpbiByZW5l
c2FzLWRldmVsIGZvciB2Ni4xNS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCg0KUmVnYXJkcywNCkpvaG4NCg==


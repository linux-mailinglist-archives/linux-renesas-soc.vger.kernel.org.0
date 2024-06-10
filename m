Return-Path: <linux-renesas-soc+bounces-6000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D85902110
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 982DF286888
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 12:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C6D38DEC;
	Mon, 10 Jun 2024 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PeM+CWuL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2059.outbound.protection.outlook.com [40.107.114.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954FD4AEC8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 12:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718020842; cv=fail; b=mll+2VcqMWhDm80v+XjH+VGkvyKf0Fk54Q4zUS6/xoymhwbyi1D0cEGxlgyTWKBEQXEpo5caSePMesBP0QZQYt2KJzK6jJ8nZtms0kCQzvwzQCY87K91FHgiWiRh2jH09B9Zmq4gP1iyM4/x3//F93LoViffXoj3KhuupPMHSr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718020842; c=relaxed/simple;
	bh=jQfRUItjUp6w7CrxxA+qTDdzx4PQaxMLe2DaG0+Y/kg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mYMAsy2UcjMLjTytoIjlE8QddaWKZXRHEi4ezOGLcFpsXZsPsXEl0cNB70ixCTNtdGylSxkaAFHYiXL5cA3ikNRvsfv6LVbGM80vZ+oIfO4+cgOUgf66EHNcWnRUXaiLPARxC3MHD32PZN1bMf9uZu4M4GKT9Q1cVwIQZtzG3vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PeM+CWuL; arc=fail smtp.client-ip=40.107.114.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzU9sZMtC5UTi4qUK1uCUBt0lGn2+E+CNM6MibMikm3kLFnEj6Pl8mruFH3dbLI1FKdiPGrlAnUdi+bFBQcxaDA/Xtd7k5S85K/Gl71ZSjrDRRMtx/PmPiwQXHDfaodK5DS9/OCXZtpcDmhE6bgc50IV/M2lttwkXWKtEwkMIqbPR4qNXDxa7PzYWaONijMnlqotXpgxmr9OntZwotkW4oy7sfi5g12vwOtEixBWAjwoGhMnQXyANvCW2unABraVFfKqTtYhr3Tc0ph6QGdgC1EAglzFm8LFLByOeAK7NwO1mlLzh78PSYZjiRq/BvfbWc4FKIj+OcN4yfzTQqsSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQfRUItjUp6w7CrxxA+qTDdzx4PQaxMLe2DaG0+Y/kg=;
 b=cNhnX2FtZcHr8qb5WKee15uZdXqE9Kc7zCSCEery7fr3imkzSbvIbm+YJVHW3ixJ3YdzTGj1B2ok3Cy8f7gncnHZZXHiCQmCnReWZMLDthaoMk/WuvSAkT8H3C1JOxbjAWoxlbq0rZbKfBNwSCFT0aia7Uf5Qq8UWpNe/SCDJMlH1mkkZ8jQneKB73swEftHKzcQBoeVIYNyvTdA/V2O+B2XaXoSbHL2NnJ3TZGTpAQ3peUKo304PyJwRNK402XLe81uEqXh7YPaeygK+Ak9aL8ktpYKqKMbQ+U3QlsvjRCYYPdDmEDCelyuO3rrKyha5acCVaMHiaHr7J/Kn/qDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQfRUItjUp6w7CrxxA+qTDdzx4PQaxMLe2DaG0+Y/kg=;
 b=PeM+CWuL3yux7BiMkM7bx0dW9OQfR8wQVFnsTGeat1AfcyU4wEexgoCmtVJ4uDt/rlNq7fdpE5/Au/yHk6d2SVHtMmk3GVrdnxSlaSznZBKMTgy9PrrUZhZe0epJ2yo359QBJCAIjT58IgvkFKsezlZppJnAfNuKL/0iMXsGHDE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10326.jpnprd01.prod.outlook.com (2603:1096:604:1fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 12:00:35 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 12:00:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] reset: rzg2l-usbphy-ctrl: Move reset_deassert after
 devm_*()
Thread-Topic: [PATCH] reset: rzg2l-usbphy-ctrl: Move reset_deassert after
 devm_*()
Thread-Index: AQHauqnpXCwe8/8aYkunXBQS5b5EkrHA3LWAgAAHQAA=
Date: Mon, 10 Jun 2024 12:00:34 +0000
Message-ID:
 <TY3PR01MB113467988BA719B39A6B1749486C62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240609201622.87166-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW-UCbiz6bEZmSVHy67PA_z0p7v4U=ROSpva7nZ+YqPsA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW-UCbiz6bEZmSVHy67PA_z0p7v4U=ROSpva7nZ+YqPsA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10326:EE_
x-ms-office365-filtering-correlation-id: acc276dd-86b2-47f3-527e-08dc8944ef8d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?VlFodHNiSldDSEErT1Rad29nWFNnaHIzN0owUHRFcE4rUUtMN2tQYnBVZHRT?=
 =?utf-8?B?SHUySG1VcklyRlZJZitidm9BRitzTjZuZUhaR0JyR3JTSnhUcHMrdXJGOFV0?=
 =?utf-8?B?SWxYNUlHWnVXbGRTZkFtK0VLdTNSTXNyZzM1R25FOTY5N3pNaFBJaUR6VWxI?=
 =?utf-8?B?eEptQzVTRnBiUW94K2sxdVVrSVU5cjkwM3phb2JqRXVmWjJyZ0EzdG1JcE50?=
 =?utf-8?B?L1dVdzlNTkdPdHdUTFl3STg5Z0tjUmNXS09WSW9IUU84ZDYzRk5HQkx4YWZv?=
 =?utf-8?B?L3RtUlBkM3I2OVArYmh1MFp6dHhwZEJ0eTVOSGpiRnlwa1BhNTZ5NnczWHdy?=
 =?utf-8?B?dFJyclJSSVNlbVFGeUZDMDMxamw2dzRyMnp0TWJ0bW5aQzVEekF6ZkNmd2c3?=
 =?utf-8?B?a29WeGNrMjJxa3JRbk1pUDdudm80bWNITXJYZERJTzNxeVFsc1pXa05SQllU?=
 =?utf-8?B?b3RWZnFLcWhDOVBGZHNCVzB3ckU3OW1rNmk5SDVhTmZGeFVVWDJzNU9ZM0NB?=
 =?utf-8?B?cGsyWHpNRUlkY3o0Q3NYTDUxU09VL245T2t4Slk5V0R4a2VKajBuYkdqT1BB?=
 =?utf-8?B?dklRcGNVdkx6dklCNk5Kbnk0ODR1dnh5cWF1YjNHVmVGQnE4aVd1SmFTVmVJ?=
 =?utf-8?B?TFdsNTgvNUlVRXdLeTlrTStkMThJTUdmMnM3MmNVcnJHNlhGbGdlOHo2OERp?=
 =?utf-8?B?Nit4QzdyTHdtWURZOEpUdEllQ1lZZnRPN00zQ1JwNTVFbHhWbU1XbFVKbDdw?=
 =?utf-8?B?OFh0dU1McFhFSGszUGVUM3p6clJrUENEcWpDNW5KVEc0enNCL2xMNGJYeFNl?=
 =?utf-8?B?d3J2UHVUTUJHV04ybFA0MUduZStJRnNLczduckF2QVV0NHBqeS9GS2hVU0tC?=
 =?utf-8?B?T3JWcGdPd0ZqNG5IdWlTdUFzQmhFa3JqMEd3OXJYUGJmYzNMcThwVElxT0NJ?=
 =?utf-8?B?alhJb2VsNW4rUlhRS2dnT2hYRXRWT0tIcnBBdmo2c2h1aEt5N1kvL25JWU5T?=
 =?utf-8?B?cWNGa1IxdFRjdGJ4c09kRlNBVjc1TE5aekFoRWxXZ3VOY1BqRWN3U0lta3J0?=
 =?utf-8?B?QVNwU01RbUtTVUpLcFIwclF6bkVLd0lSSGFEbFhqTlFSdk1pL0R2aHgvSTA3?=
 =?utf-8?B?RVdhWXdnQlpqb09vbUtMUVVkWGFSWXVnTjV1NzBzcnMzalhtcHFaeVlQVDdo?=
 =?utf-8?B?cVZESG14endKbWNGTFRkRXg0REpULzhwdkI0eVhOaDdYVjA4UWp6Y1l1UDZo?=
 =?utf-8?B?SFVLd3JYRWJUdjh4YXpuOTFjTW45Ui9Sam9iU2w0clJGbi9GQ3J6UWwvdkow?=
 =?utf-8?B?S0M2bDkxTDg3NjNtbm40RFRicWgxN3FOVGRBdWJFUEpSY25FUGVjbnVLeS9F?=
 =?utf-8?B?L1ZXZEt4bGwwMEdsQ2YrL1hFZUM0czkzdUhVclVHMGhWVWVoMlFuS3pCQ1V3?=
 =?utf-8?B?VEZic2xMd2szdnpmenczbS8zQWJxUG1CTzdFdmdMUVZkODVSRUNEbEg5SExK?=
 =?utf-8?B?YXErNi9nRnlVdmlZQzNPRXdSTUZjNUw3eFJDdzVmQ0J4T0ZVREM1NmRKbVI4?=
 =?utf-8?B?TEpQZXYzQ0E1WCszU2duRXg2dGJoU0N4L0c3a2FiM0Y2ZzJySVlDKzFEekhq?=
 =?utf-8?B?bjM5Q0twZHIrL0NscW94Rml1SUszQ0x2QlBoV255TTg3TG5VU1A5WVZpZHI2?=
 =?utf-8?B?eDkrM0N6eXMzOUVQbTg2a0lMeDdWcmxsMTBERlBySEU2dUVZbUtHNkZOQWtY?=
 =?utf-8?B?V0hZN2ZjR1ViYWt1dUdNeWFpVndrVVVBYTV6UzNDSjRjQmdwQWFXcmpMV1Ns?=
 =?utf-8?Q?+sUxR6rpZDXCitrLBF7vfgtEv4iKGpKc2ERHw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NEFqcE9nUVZwYjNLVXNsbmZsbSt5STUxMlY1eXg4RWZEV1RFNTRiTlF3RWtJ?=
 =?utf-8?B?dVFtSy9OelB3V1QrSjhmK3pvVkFia3FXZWJTTzJjYTY1UmdodWJqbUZmSUNt?=
 =?utf-8?B?VFJ4L29XUVBCYmltNVJqQXV1OWVWeUFKZElXTjhiTUxsQ0wwcTRZejZ0d29h?=
 =?utf-8?B?ZWV4Q3NFc1R3dWJoV1BnOUlpMllUUUFveXV6dVZ3SnRrUmYzMzVHRUhpSXBH?=
 =?utf-8?B?elVDWUxVV3p2T1NURWRoWi9SQXhpMGJoS3cyT0NPbU5SbXprWTM2NnE2cFpz?=
 =?utf-8?B?cWJDdFBHTTFRNjg0ekc3QWlRRFNLUW5qaFdrb215OXNYNlc1K2VKMTBhR3NI?=
 =?utf-8?B?dmk0d21oQi9xT0h2WExZMzRvbHZMUnJacHR0Y00zcWIwaTdoNVY1WWpjK1pE?=
 =?utf-8?B?M215YnAwQXduVXdWaGxmSTV5UEJXYnlZTHBjbm9TNURBTU1FWTNpQWZwRmF6?=
 =?utf-8?B?UGhmVVBjVC9LMTRLMnRpVGpRWk5hMFBKVUQ1YS9GYXhOQ09lK2pjTTcxQTJv?=
 =?utf-8?B?TWZTNG55NitKZjdPUVpBbjErRSt0S1VDV3BSR2JrTERpU1RBZmRxNDNUYmIw?=
 =?utf-8?B?M2d5ZnF3VTBSVlhvcnVPTlg4WkUyQjNEWkk4aDJBTDAyZGduWnU4YVhmVG1H?=
 =?utf-8?B?Z1VNY05qbTlGTG5nT0kydmh6U0UyMkVaODdUVjFJQjg2TW9LTW5tWXJsbjFm?=
 =?utf-8?B?NVk5b08vUXRIb2Y1SXVTeERFSEh5MEFaNnJ3T21PS3hPZnpQNFphNHhUNFFm?=
 =?utf-8?B?QVg0czBZbjltRDRWMWZ2ek5PSWNvL2l6Z3lqamNHV3gzRTV1OG1PRlh2RURT?=
 =?utf-8?B?U3YweGhZMnpWNEdjMUNUWkQ5QzhGL0lkZGFiQmNKeFZYbldzMlNTWExmOUgr?=
 =?utf-8?B?aERZUVY0RVBBb2VjQnI0Z0pGaHhEeDNXMDBFemZGMm5JbCtDelV0U3FYTlla?=
 =?utf-8?B?MkhSNi9MZUVJTVkvQ2JBblBzak9JTnJhYkduSCtad3dTR2d2enFwVk9ja2J5?=
 =?utf-8?B?UGFXN0FPRlQxdkFaeVhmOEI5STNXMmYwSHVRYUF2blJwOEs5d1NjM0c1U2N5?=
 =?utf-8?B?M1V2ZmtWdUpBd016S1lCczNNV3JpT2VnQWF0clRieC8rbVd1akYvcnlITU5Y?=
 =?utf-8?B?b2I5Z1l5UkRrQkhIOFFSSFBCRiszVUcwZnR2OEprcUsrbW9ubjNoTWJ1N2pj?=
 =?utf-8?B?Ti96VTJ0U0JLdGlkdVV0bzNNYWIzQ1I1bTVxUGx1RlNVYTQ3U1VrUW1oQlBT?=
 =?utf-8?B?enV5WXdlQU9RcURNL3hrZHorYWZ0RlhjMUFwcTU1WTVLOHVhWWh4c2JnZVd3?=
 =?utf-8?B?R2FHSFljTFFjNDBCNStUTXAzSmhsYXVmUC9jbUJKV3d2YnM1d3hiZUxaNWwx?=
 =?utf-8?B?WVhIRkdQSWVUZTd0T1dUZUIxM09OWXcrZ0NDaVllMlRXcnVERmFBZHRrbzJR?=
 =?utf-8?B?a003bXp2UEV5V2VITFpBcXJaRWQxWnVJUDh3alAvMXl2QmJZZGtCUzJLaWlq?=
 =?utf-8?B?dmJOZTZzWkRpeVZ3TTJhY3RWa2E3OGErT2xobTJuVlhYKzFNdXpVM2xyeDk2?=
 =?utf-8?B?TEozOEVlTk1nOWw1T2MzUTNPZWlkMmhpVTBIeEFTb2xFd1hqcldlVDRVMFBX?=
 =?utf-8?B?SXJNRjdzVE90djRTMXZ2YnpvbzRmQi85YUFlclFuOGNsTU9acHRrM3BXcXl1?=
 =?utf-8?B?dTZuTDJ4WTdUOUJIZ3RmVjdmSFA2d1F5NnVrSko4RUoxVUppcmFIK1E4UUhJ?=
 =?utf-8?B?Wm9TUGliSndTUUI0aXhFQVlmNFpwMEYzRFZIWnZ5VFRaVzU0YmgyaXdFcDZo?=
 =?utf-8?B?d00zaEU2ZnAyVVZFYWNtV09IMkcvSTZuUjU3eXJELzNnVXlVblRhVnZFTVFG?=
 =?utf-8?B?VDVvakVFalYzbEM2ZjdnaHc3WS83RTZaK1NhVXUzYVhUWmtYa0tWMXlsUDRh?=
 =?utf-8?B?Vlo0azJXcU9RMmViYzRPcGN1NTRBdlpJN1NQWU1Qam1OQnBXTWx3cEpoczM4?=
 =?utf-8?B?QzdLUUkwampmN25Hd2R2VHZBQnJocVNpQk0vZ2ZNMU5VUWVtQXFWcUtVN1VF?=
 =?utf-8?B?R3dGaUdTR3JFK3ZMWTdscmZRcTlabFQyVXN4eW1MYnlWV1FHdnY3eWJYbmtV?=
 =?utf-8?B?M3U0UG9XVFN2eFZIbFdxUW9LV3ZERFA0WGFiQ0ZmUDhjb1ZFVEFkakVwVHFl?=
 =?utf-8?B?b2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: acc276dd-86b2-47f3-527e-08dc8944ef8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 12:00:34.9532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQ6g4ZWeWivx/B74JfZ5WcYwLRcl+iQE+SwjrMXYKY47CzZJw0w7XxfoG5UoPVl1Qm0fGMfTMAxe7TJ8jAFtRDyeOlyofPtfTrMMwknrOrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10326

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAxMCwgMjAyNCAxMjoyNiBQTQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIXSByZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IE1vdmUgcmVzZXRfZGVhc3Nl
cnQgYWZ0ZXIgZGV2bV8qKCkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+IA0KPiBPbiBTdW4sIEp1biA5LCAyMDI0IGF0IDEwOjE24oCvUE0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBNb3ZlIHJlc2V0X2NvbnRy
b2xfZGVhc3NlcnQgYWZ0ZXIgZGV2bV9yZXNldF9jb250cm9sbGVyX3JlZ2lzdGVyKCkgdG8NCj4g
PiBzaW1wbGlmeSB0aGUgZXJyb3IgcGF0aCBpbiBwcm9iZSgpLg0KPiANCj4gV2hlcmUncyB0aGUg
c2ltcGxpZmljYXRpb24/DQo+IE9oLCB0aGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSB0aGF0IHRo
ZSByZXNldCBpcyBub3QgcmUtYXNzZXJ0ZWQgaW4gY2FzZQ0KPiBkZXZtX3Jlc2V0X2NvbnRyb2xs
ZXJfcmVnaXN0ZXIoKSBmYWlscz8gUGxlYXNlIHNheSBzby4NCg0KT0suDQoNCj4gDQo+ID4gV2hp
bGUgYXQgaXQsIGRyb3AgdGhlIGJsYW5rIGxpbmUgYmVmb3JlIGRldm1fcmVzZXRfY29udHJvbGxl
cl9yZWdpc3RlcigpLg0KPiANCj4gSSdkIHJhdGhlciBrZWVwIHRoYXQgYmxhbmsgbGluZS4NCg0K
T0suDQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXJ6ZzJsLXVzYnBo
eS1jdHJsLmMgfCA5ICsrKystLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzZXQv
cmVzZXQtcnpnMmwtdXNicGh5LWN0cmwuYw0KPiA+IGIvZHJpdmVycy9yZXNldC9yZXNldC1yemcy
bC11c2JwaHktY3RybC5jDQo+ID4gaW5kZXggOGY2ZmJkOTc4NTkxLi45M2M2NWE1NzY4NmQgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9yZXNldC9yZXNldC1yemcybC11c2JwaHktY3RybC5jDQo+
ID4gKysrIGIvZHJpdmVycy9yZXNldC9yZXNldC1yemcybC11c2JwaHktY3RybC5jDQo+ID4gQEAg
LTEyMSwyMCArMTIxLDE5IEBAIHN0YXRpYyBpbnQgcnpnMmxfdXNicGh5X2N0cmxfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHByaXYtPnJzdGMpLA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGdldCByZXNldFxuIik7DQo+ID4NCj4g
PiAtICAgICAgIGVycm9yID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChwcml2LT5yc3RjKTsNCj4g
PiAtICAgICAgIGlmIChlcnJvcikNCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIGVycm9yOw0K
PiA+IC0NCj4gPiAgICAgICAgIHByaXYtPnJjZGV2Lm9wcyA9ICZyemcybF91c2JwaHlfY3RybF9y
ZXNldF9vcHM7DQo+ID4gICAgICAgICBwcml2LT5yY2Rldi5vZl9yZXNldF9uX2NlbGxzID0gMTsN
Cj4gPiAgICAgICAgIHByaXYtPnJjZGV2Lm5yX3Jlc2V0cyA9IE5VTV9QT1JUUzsNCj4gPiAgICAg
ICAgIHByaXYtPnJjZGV2Lm9mX25vZGUgPSBkZXYtPm9mX25vZGU7DQo+ID4gICAgICAgICBwcml2
LT5yY2Rldi5kZXYgPSBkZXY7DQo+ID4gLQ0KPiA+ICAgICAgICAgZXJyb3IgPSBkZXZtX3Jlc2V0
X2NvbnRyb2xsZXJfcmVnaXN0ZXIoZGV2LCAmcHJpdi0+cmNkZXYpOw0KPiANCj4gQXMgc29vbiBh
cyB0aGUgcmVzZXQgY29udHJvbGxlciBpcyByZWdpc3RlcmVkLCBpdCBjb3VsZCBiZSB1c2VkIGJ5
IGEgcmVzZXQgY29uc3VtZXIsIHJpZ2h0Pw0KDQpUaGF0IGlzIGNvcnJlY3QuDQoNCj4gVW5mb3J0
dW5hdGVseSBhbGwgaGFyZHdhcmUgc2V0dXAgaXMgb25seSBkb25lIGFmdGVyIHRoaXMgcmVnaXN0
cmF0aW9uLCBzbyBJIHRoaW5rIHRoZSByZWdpc3RyYXRpb24NCj4gc2hvdWxkIGJlIG1vdmVkIHRv
IHRoZSBlbmQgb2YgdGhlIGZ1bmN0aW9uLg0KDQpPSy4gSSB3aWxsIG1vdmUgdGhpcyB0byB0aGUg
dmVyeSBlbmQsIGFmdGVyIHB1dHRpbmcgcGxsIGFuZCBwaHkgaW50byByZXNldCBzdGF0ZS4NCg0K
QWxzbywgSSBhbSBwbGFubmluZyB0byByZXBsYWNlIHBtX3J1bnRpbWVfZW5hYmxlKCksIHBtX3J1
bnRpbWVfcmVzdW1lX2FuZF9nZXQoKQ0Kd2l0aCBkZXZtX2Nsa19lbmFibGVkKCkgdG8gc2ltcGxp
ZnkgdGhlIHByb2JlKCkvcmVtb3ZlKCkgYXMgc2VwYXJhdGUgcGF0Y2guDQpJIGd1ZXNzIGl0IGlz
IG9rIHRvIHlvdT8/DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgICAgICAgIGlmIChlcnJv
cikNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGVycm9yOw0KPiA+DQo+ID4gKyAgICAgICBl
cnJvciA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocHJpdi0+cnN0Yyk7DQo+ID4gKyAgICAgICBp
ZiAoZXJyb3IpDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnJvcjsNCj4gPiArDQo+ID4g
ICAgICAgICBzcGluX2xvY2tfaW5pdCgmcHJpdi0+bG9jayk7DQo+ID4gICAgICAgICBkZXZfc2V0
X2RydmRhdGEoZGV2LCBwcml2KTsNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0bw0KPiBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=


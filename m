Return-Path: <linux-renesas-soc+bounces-15124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA4A76334
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 11:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11781167C6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 09:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B31A1DA61B;
	Mon, 31 Mar 2025 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GUfQSKWU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8F86250;
	Mon, 31 Mar 2025 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413608; cv=fail; b=sqwPtssKAA1+iAz8kb/Uzpd/3bR7s2T+Rmp7CE8ByArGgEW06RZ1L5nZsBbfa06OJKCwSQVsbqfWBZbFCf4nAWWgOswuwBbkJnT67hBnp94Uc1SPGWmKA9jiftOU4O5HAc6BRSCXV3ymLOTCXTfie6LaK7J+OurH5IAlJK2MAPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413608; c=relaxed/simple;
	bh=HRq4hhR5By7tgk89hrX4un1s6MNi84pGFCFtKqKhXbs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o6q9zcNzKGOwgwS4xSD2syU5GnyAFtW0GILwMJyVzuDTgmcsDEIjXXoMwbn18RNNEMjqwFbUl718g6SPVVsWohviUVvmSez7RJo+vae8nNQxIyZ7+PqV+f67WL6cR4SBNFCJxiIlZwcnEM3Ba4b2k3o1uVFu/tlje8ssDZcW//I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GUfQSKWU; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xI5q6DNnFGLaxB2JnlkG1p2VVspU7/38IFNR4z2yBpD9DBqUE2Ld0tJkk+r8Q06uEwYPtoD8BsdhgjcftZO9GknnF2fFGa4DjMcVST1c/WoNyriUjhqjeeAjewhJtKTg/LXYta9HuwQcclohjGg/3dwUhjJ9U2MLWSMGqlmA4WfCdgXdIPfzTjeguYfobn207wpg79Y9ufEMZYX+YqTZpGcNYm3QhadvrOszVTHeH0t81GdlynNsazq9UzR0apKj986JE9BIx1j5nBkvZXGT2dHm70jU1E9ytvcOM7MWcYCKlPaugZ4Z6dBxNma1+H7Wk6JtlZJI8Dd9IqLxDv9s1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRq4hhR5By7tgk89hrX4un1s6MNi84pGFCFtKqKhXbs=;
 b=Rc4lsTfheoG5k2dVQZP1ATVAS/It25ig8FSrSFIMqkFEF8L+qZOMazRgv8wWouCVF89tNhVzBPIX45sl+1dPskUZk0bOigbq1BLrK7XwZK5JaFmlcUD6i0Vff0pvleL0hbdlxsSaLAir3RPHuSOanwc8vrMHh6HRQgAVz3vmkz74BV57tEVcVBdJAHH3qyp/wmMiy4YU8QCbXzjFBObMMkd6jUgDQfMF1m6BiTccIeSAi4CshAvTdjnSHQC2Jjt3mRG3PEP86Fj2mn4tmXrsqbOf8t0AkpKYez/3buqvhib2rLgnjngwK2hVg/L3Sim1ljLsJ0kuOg3yruiCvxt9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRq4hhR5By7tgk89hrX4un1s6MNi84pGFCFtKqKhXbs=;
 b=GUfQSKWUKWQl5shbABUobXKIkTt4KSN8zn8SAPxgJhSFZqBAyrbHN4FWPbUJ1OfcPumdV1wBkAXY2RzgjInzEhrlkbue+9SYy0bBwJICXJv6oCLsZrJ2uL8P6zqCtoxu2YkplWp8VlHJTcPHMLFBP6qyvhNujpI6daAAuG1b464=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY7PR01MB14309.jpnprd01.prod.outlook.com (2603:1096:405:247::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 09:33:21 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 09:33:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter
	<adrian.hunter@intel.com>, Victor Shih <victor.shih@genesyslogic.com.tw>, Ben
 Chuang <ben.chuang@genesyslogic.com.tw>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sergey Khimich
	<serghox@gmail.com>, Shan-Chun Hung <shanchun1218@gmail.com>, Peter Robinson
	<pbrobinson@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH v2] mmc: host: Kconfig: Fix undefined reference to
 rdev_get_drvdata()
Thread-Topic: [PATCH v2] mmc: host: Kconfig: Fix undefined reference to
 rdev_get_drvdata()
Thread-Index: AQHboICu2V+70NUfOkqliJAZjXeBUbOM+u2AgAADZGA=
Date: Mon, 31 Mar 2025 09:33:21 +0000
Message-ID:
 <TYCPR01MB11332CCDE13638A37ABCF76F086AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250329080036.49170-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW8zfxixBA6Ahe2JVtNnwYroEXpmSCR94C9fohFCpSPzQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW8zfxixBA6Ahe2JVtNnwYroEXpmSCR94C9fohFCpSPzQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY7PR01MB14309:EE_
x-ms-office365-filtering-correlation-id: d9380ac1-06d9-4c3f-65f3-08dd703713b7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?emtjQlIrb0xmM0hESlEwWGZ3TEJ2eFlKN25rcXU5OHl5OUcyYzI5Z2Z1c0ZF?=
 =?utf-8?B?M3lPa01tTUlSMjlQenBxNzRwZWhSOVRqQXhmY3VJYzdKRGRkVkI1ZXN5ZDR4?=
 =?utf-8?B?NlZHcDQ3ZW1JVDJtb2lvQUdQV2FVbDFReHlzM0REK2JmbzhIN0ZoZGtrTWRu?=
 =?utf-8?B?dDAvZjYyeGtlL1Y5Y3hSR2M3MmcrOUR4OUExeFhzZW1rWGZtYlFhTEt6V0wy?=
 =?utf-8?B?aGpmMG82Mk1XY25YeG44Yy9oUVd3Um9oV2h6WFo1ZXVBbG1rcWNLRllJamZ6?=
 =?utf-8?B?NzJtTk12eTdoc2cyV2x1OExWRGNLWEFaOFRUOVQrVTBkQU92bHpkNlFYQ2Fx?=
 =?utf-8?B?KzdpL2RTdVdrZ2F6bDBsVlUzM0JlVldEeGJGN2E4YU5mUk9YQW5Ja2hNWUFP?=
 =?utf-8?B?VE56V1p6UHA4ZkRVYXNzdWdWR3c2T0JQdkVHR1BYeTRvWXJvMnJ0RURyYmNz?=
 =?utf-8?B?K0c1bG1EbFA0T3gzWWltNzBidHQydlZzWUJZV3J2S1N5dUxoNG1MRSt2Tlds?=
 =?utf-8?B?RFZLc3BTMWxhaW0wWnF2aHNWU1VodkFaZ3FxTk5LV2tJTFFBSWNSZnRSUEhW?=
 =?utf-8?B?Y2w1clhMMnV0TU83MjNOZXE2d0R6N2Z4OHdRcTc4UU55RFJUaGhxVGZ5WldX?=
 =?utf-8?B?UzZhMmxMYWdCUnVUN0M3YVdTV1ZWUldwaTZ0aEhGNUp2cmlxVDV0TUdHWFdk?=
 =?utf-8?B?NExxWWZESWhBZmZ1ZjZMV29GUjI0RzRxOHN6c0xyVFl4UVJsQUVLdEpFQ2sv?=
 =?utf-8?B?LzZ3ZmpRVWVxQ0JmNVErY21yT0NRMExpNWN5UkFvZkNEYmhSaXAzdkhHTWVk?=
 =?utf-8?B?MExwZ2RqMG9nUlVHVERrMHBzSHdwbEV4eEwzNkUyM0xvMlNINlZ5OXJseTk5?=
 =?utf-8?B?U21wb1IwbXN5eFJjemFGMllWc0VxYitqYjM1dUdpYTNpblJVYkptN2dHbjlU?=
 =?utf-8?B?QkVNSnZ2Nmlwa0ZSTUQ0TWFVN2R4eXk3NW4rSmVSa1hOcllOZWI0c3U5ck51?=
 =?utf-8?B?bUUzSWJsYnBEREJuaWVyZnB0dm9ubHRJNkx0YU9sdStvVWRSekdVY1lDY25s?=
 =?utf-8?B?Ky9PdlFyWWZ0NHM4SFZ3NHlLd3BnWDdHZDJpdFoxL2NsM1dGRXgxUjNyOVR4?=
 =?utf-8?B?ZjdYOVYvZXI4NEFzcytQRmNkaEN6SHRwa1ZZSG9lYVQ1elN1Z1cvSC9NUW5G?=
 =?utf-8?B?cThNcUpwQmlCR082Z1FBektTVHdMd1BpUW9vWnkwVlFZODBSeHFSZlNuSzAw?=
 =?utf-8?B?QlVhVjlrNjFhY0wyUThSdFlON2lrU05jNStON3NzdkRqT3dUb0kzOGdkRGlT?=
 =?utf-8?B?RW1IaGpXWnQ3RUhlTDVPWTQ4NGY3WXZkc29wZ3B6SXY4dVNWMm4xNC9KQ2F5?=
 =?utf-8?B?aSsvMG1ITlhLcm9wd21SMXBFbFhsSU53WWg5MlhsQjRJc1RveTdST2ZLYmhI?=
 =?utf-8?B?TGtVb1JHSUxqMGlhQlJiZEVoQnlpTnloZ3FnUURBaGdmL0pOWlBHNlZpbmRO?=
 =?utf-8?B?WmZpK3g3Zk9uVXBDSzZyNG44bVlZVkhYd2RXTHNweSsrRm5IWFV5UTJhTWE1?=
 =?utf-8?B?TXNEeWtsSXczNzZzMDkxellPWDRianNDNE14amVyaGFJMTRLdEJwbHk5UWo2?=
 =?utf-8?B?c2xZOE1aWklKbjNtaGZ5K0JNOEFlRFVyZGttK1EvZUdpdktWeFJ2RFFPejl1?=
 =?utf-8?B?RDgxUHVleVJ1YTNGL0ttRkhad212L09SbTVkQUFwYnVTckR5Q2tZdEZpbi85?=
 =?utf-8?B?M3FvMFZKZk5QK1dlcFhlMGJkVGtxSWt0NVp1a1FYaVdNNzZoSzJMWm4vb2Jk?=
 =?utf-8?B?MjZGbmVaVXhUaVgzYU5ZYnN6b0JCU1ludlVFKzhOT0RLU1dpTm54MzhxTjJm?=
 =?utf-8?B?eHNoeGd4TnlPdGtjemFKZmtJVUlYSDlMWGNDdktTMUk1c3JkSktSd3ZmSy9H?=
 =?utf-8?B?b1cwMC9aT3dxRkFKUzF1eTFWQkp1bkFaQzdNOE8xMm5vc3RSdVZnWlVvTXVH?=
 =?utf-8?B?Ymt1WXR1bGR3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c201aCtSZVZhNVVVTDB4bGZvR0NMOWZLQVIvRUh6cFNtNkpUVE1zaEdQb3cv?=
 =?utf-8?B?dFZ2eTEvVlpyVFQ4bDc4dG55amxnNHQ2RzhINGxxVWlMekF3TG1WNDNWK0Q4?=
 =?utf-8?B?TC8zMnduOTlCcWdEWU92d0xjRnpnSmZiNTM1VUZEaVBDeExvK0JNcVV5bzFI?=
 =?utf-8?B?TENINUdVM1hCMjZhdmdGaWtrTCtzQ1VLQkVrYVNaVEh2bVhMZ01jdjBaQUls?=
 =?utf-8?B?OWRkcklUUDBWb1p2OVRwUXJTazIwMzdqSkdUdFVKejRrblJqSDVyL21wV1Q1?=
 =?utf-8?B?ZDJmQ29DRTZiU05JcEIzTVJ1MmxneExhUUc3ZjhDdW93S3l2Sjd6dHNVNzhM?=
 =?utf-8?B?ZmRiZWdoQmVYOXFXM24vemh1enFCdlVEdFIrYzFCL3hOUlArRjMyR3YyV2NR?=
 =?utf-8?B?c1hqNU9uNFNuRzZxaWhSRUFLS2p2K2lXTDQ1Vjk1dUFzY2JPYm5tWGk1cHJn?=
 =?utf-8?B?VzN3Q2RUMDBwNmR3YkFJQ0pySkFwMytzS1p0QVQ1OGJCR2xNbm16OVVxbkNQ?=
 =?utf-8?B?cTIzUkRXNDZrdmloZjloNDZ3c29wV2g4Y05KQzFWVUNrWUtHcTRJZnJLTjFl?=
 =?utf-8?B?aW5KY3VLRmRWRlgwdEVvdE1OaDJMZ1RWeWFSU1pmbVBqei9SbFN4QVVCdCtP?=
 =?utf-8?B?VXdiN2w2aXdVZFAyZDRWa1BBejk2S0RubFZ5NUZrY0hkNE4wNTdXSEgrcDNp?=
 =?utf-8?B?cGFqRmhxOERQRWdxZzZwekx5dVJBeGxHcEY5NG5xZUh2MEk0Z1lmek5jUkR6?=
 =?utf-8?B?MDJoTTFwMmFUVUhUMWllUk4rZmZrQnBMQ050b1c2M1AwcEYzQUdxS2haTTF0?=
 =?utf-8?B?Y0s1TkVqNHdOUlhLUVd3UG5DOXNXSlh3WmMwcVVlb3ErL0F3eGdNQWNlUWxr?=
 =?utf-8?B?QWhScHhqQXVnWVk4Mm5YcWtTRys1L2pjY3lLcGpoUWQzMHREMTFJWlREVS81?=
 =?utf-8?B?TlVpeHUxVEhWK21uRXBYYWlPQStEU2hTUkxBTWthaXc1M2E5VmNxMDJWMlNz?=
 =?utf-8?B?MDJFMFBpNHJIaXI3ZGdoMmdXaUM5aHMyNVU1dWVQT0FVa2RLdWh1NUx5b0E5?=
 =?utf-8?B?M0x3QWxJeFhnV2pya1VMWmZoNUVOa1Y1a3NsV0NDcWpYMXgvY2I0YnJyM01q?=
 =?utf-8?B?WjZuc0tZMkE5ZEZOS1gwbTVET0ZDQnhzWW82SmJBVHQyT1pXa05EZmMzUDVB?=
 =?utf-8?B?NzhVZGp1WDlFbzNjSFJncXFvZnVsako3Z2N6RTI2ZjN1MVpodGkrVjVid05X?=
 =?utf-8?B?V0lUMDV6WVNObmhDRFZxcklxekZOZnNnU1F4by9sbEhZN3RDOVp0eU94dmEy?=
 =?utf-8?B?UmNRT1pRUVY2Mi90amxzZGIyUDZoTUUraFRvL1VkeUNFc0p0SndLcE0vbFhK?=
 =?utf-8?B?c3hrb3dFNkdVU0hjT3luM0xrWG1OWWZPdnpNekJCUGIzRk9aVjRKdEdKVUtW?=
 =?utf-8?B?YTRtWWhwKzdTVEF3cXV1Y3dCQVNzdlNaL29mV0w3UkFaWXlWeFgvY2JCZ01R?=
 =?utf-8?B?ci9NTTJkQ0k0UFBES3Z4RXRMTzlqYjBDeHlHam1QOTZYV3AwWUZwSXhGR1ow?=
 =?utf-8?B?NFo2cDdNYkNkT0hXOHBDVG1wQm1KOW4xSkxrRUpOdDNtdlBOTjdLdWVuT2kr?=
 =?utf-8?B?REMzckhiNmxYdkZrL2JuK241YUM4V3FRcGcwRFhYSC8yTWZvbW1CVUpucXdO?=
 =?utf-8?B?NUNBenV4ZWtLZXAvbHB3MWpmazN4NnR4OFAwazVzVnJNbkNqUzdKSkVFRWlI?=
 =?utf-8?B?SktSQmU2b3pjT1NXK21ONWVERWN5T3F5NGp4Wi9oM0s2U1BMUUdOVnQ2bFBi?=
 =?utf-8?B?M0xiQVgrSHJVZ1lQQUUvZGlqWjVDd0NiR0t3eUZYRnNXd04xcDRHQ1hMYWJ5?=
 =?utf-8?B?cSs2VnZ6UWVkcloyOU9FOVpQN0ptTzZLaitnNWl5VmcrbWxWRmQ5YzY4cncr?=
 =?utf-8?B?Z3c1UGpKaEM2OWZtM1krdW5tKytMUXFHRDE5TVJiYnVSQUQ3ZGFmWlFoTWZD?=
 =?utf-8?B?LzBKR0k1a3dTaTZjdkJoQldVNFVkRFVTUGllOTZtK1lsalFSWmsvbDBDZTlF?=
 =?utf-8?B?dEJOZFd2bzlFOTRtYVI0c2R1KzBiUnZEMEV5bTBCaFhsVThHa1lYVWw5eTg5?=
 =?utf-8?B?MlN3MGNwd200aXlTK2JUNzRmSkp0QjNYK2dWZWFueVh6ODZHZ0U3VE9ZYURq?=
 =?utf-8?B?M3c9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9380ac1-06d9-4c3f-65f3-08dd703713b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 09:33:21.2746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXZLQyHR1w3zj1wq5YPdDZ6u8cyX+p8Wa//q8OEmLCiQal8oEusKBPfrAimMMRO5JMorYk1CNgxtkoEErf560NmhO+le1vvyslNym4OS9P8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14309

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDMxIE1hcmNoIDIwMjUgMTA6MTkNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2Ml0gbW1jOiBob3N0OiBLY29uZmlnOiBGaXggdW5kZWZpbmVkIHJlZmVyZW5jZSB0byByZGV2
X2dldF9kcnZkYXRhKCkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTYXQsIDI5IE1hciAyMDI1
IGF0IDA5OjAwLCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0K
PiA+IFRoZSBkcml2ZXIgbm8gbG9uZ2VyIGJ1aWxkcyB3aGVuIHJlZ3VsYXRvciBzdXBwb3J0IGlz
IHVuYXZhaWxhYmxlLiBGaXgNCj4gPiB0aGUgYnVpbGQgZXJyb3IgdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byByZGV2X2dldF9kcnZkYXRhKCkgYnkgc2VsZWN0aW5nDQo+ID4gdGhlIFJFR1VMQVRPUiBp
biBjb25maWcgTU1DX1NESEkuDQo+ID4NCj4gPiBGaXhlczogZmFlODBhOTlkYzAzICgibW1jOiBy
ZW5lc2FzX3NkaGk6IEFkZCBzdXBwb3J0IGZvciBSWi9HM0UgU29DIikNCj4gPiBSZXBvcnRlZC1i
eToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gQ2xvc2VzOg0KPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTAzMjkwNTU0LnpBU1FUNzBR
LWxrcEBpbnRlbC4NCj4gPiBjb20vDQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBBZGRl
ZCAnaWYgQVJDSF9SRU5FU0FTJyB0byBsZWF2ZSBTVVBFUkggb3V0DQo+ID4gLS0tDQo+ID4gIGRy
aXZlcnMvbW1jL2hvc3QvS2NvbmZpZyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L0tjb25maWcg
Yi9kcml2ZXJzL21tYy9ob3N0L0tjb25maWcgaW5kZXgNCj4gPiA2ODI0MTMxYjY5YjEuLmY2MmU0
MzZiMWQ0ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L0tjb25maWcNCj4gPiAr
KysgYi9kcml2ZXJzL21tYy9ob3N0L0tjb25maWcNCj4gPiBAQCAtNjkyLDYgKzY5Miw3IEBAIGNv
bmZpZyBNTUNfU0RISQ0KPiA+ICAgICAgICAgdHJpc3RhdGUgIlJlbmVzYXMgU0RISSBTRC9TRElP
IGNvbnRyb2xsZXIgc3VwcG9ydCINCj4gPiAgICAgICAgIGRlcGVuZHMgb24gU1VQRVJIIHx8IEFS
Q0hfUkVORVNBUyB8fCBDT01QSUxFX1RFU1QNCj4gPiAgICAgICAgIHNlbGVjdCBNTUNfVE1JT19D
T1JFDQo+ID4gKyAgICAgICBzZWxlY3QgUkVHVUxBVE9SIGlmIEFSQ0hfUkVORVNBUw0KPiANCj4g
UmVnYXJkbGVzcyBvZiBBcm5kJ3MgY29tbWVudCwgbWFraW5nIHRoZSBzZWxlY3Qgb3B0aW9uYWwg
bWVhbnMgdGhlIGJ1aWxkIGNhbiBzdGlsbCBicmVhayB3aGVuIGNvbXBpbGUtDQo+IHRlc3Rpbmcg
b24gYSBub24tUmVuZWFzIHBsYXRmb3JtLg0KDQpBZ3JlZWQuIExvb2tzIEFybmQgcG9zdCBhbm90
aGVyIHBhdGNoWzFdIHRvIGF2b2lkIHRoaXMgaXNzdWUuDQoNClsxXQ0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjUwMzI5MTY0MTQ1LjMxOTQyODQtMS1hcm5kQGtlcm5lbC5vcmcvDQoN
CkNoZWVycywNCkJpanUNCg0K


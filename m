Return-Path: <linux-renesas-soc+bounces-19030-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87891AF15A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 14:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CBBB1893B05
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 12:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5531626FD99;
	Wed,  2 Jul 2025 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lnWreAxZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02F926E707;
	Wed,  2 Jul 2025 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459292; cv=fail; b=jnQN1Kpv5xcq+jAikKUIGrtiR/EBS6UV6r+8IVjDtNcRFJqU5qiMChDCtWNzBLt2AXYf/uxAViZhdz9626GYfK7U+mNhNT4EMHiEcDIa0JgSRxJGiFwAVrsMECA9F19cQnaAZNCMD4wAlxdKRLnK6O/zHg99AL/Gk5jRTXYDY2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459292; c=relaxed/simple;
	bh=xZe2hcu2PPw/FIVzYbHDXbLK4ItbZFIUGl/bONptORU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pIKB7tqsH73NrMksyos5SKH4yudXkZuWHfvSgZjOTh1ndqhxBtbSxHxnWQKORYmTTlx7mkR1x0hZtKNXvaWF08a8rhpClWxes/htfszQWP9eNYEjPYlzzHpT+viOGe21enwgffGTSzwGjUxJos6DICVNWxIb/phMXZLMnRALYWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lnWreAxZ; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xExg3rwMCmKImP12ipUeF6Fcvxqw9FIuu7VbwtOpuh1Kw8RN4q9phjhFkp2BLLVqfaL7NGksaA3G2KjAkSmUVEXq4kTLouHcuGWUiHf3pQ4MpYq2HCz5N3BupXzc82wuI3oHLMZ6Iur/hw46fK3oMW1vWc91JE60VwGv+D5V57uEA7mmXsFhJPh/WIUgS8A32iMGt4CVISllEjlD0/a9aahEmPVTacW4gI+0YZ8JHsbmKWCsG7wZ1gP5B2ro8glDX6wBoPxxFTIY/sw1mmrRsYAU1KgD4hmYuNlh//RWCZ7CLcjspx1BJ0uXlj1TIJ39pZwbSQ+/+DeF5Dq2vTJcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZe2hcu2PPw/FIVzYbHDXbLK4ItbZFIUGl/bONptORU=;
 b=afxecn8Qr0l46tLJBJXHHC6jElNE//18hjcCfVuI1hYP08eYg8ME3KtS2gw5Zzp0Pjbo3RizlI270vnWKk757fONkgBaYXcXyhjatcGHFjFd/cwKhamE5cNHD4CZGUyHfWOFLVLR0yJ+vCXqBTdJiCqFGKc7rEw8SNZeqrJvtoyLxqrFbCxGEYB4jQBeXv9MnrspNoPX8cTusSMmRFde19jmDOgW9cTw9By5juib+4rt9vZnrWlMpA0B0wjpMbsnY1YQBoBS4UaZ9Ol/1RYFguaKJVOl9n8WIN39fQXq2WdDlRFE4kWRhzy2Ro86EpxG/Rft3vnIs1o6krXhTtkMsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZe2hcu2PPw/FIVzYbHDXbLK4ItbZFIUGl/bONptORU=;
 b=lnWreAxZ+dq7NqMwpzLK67s4IGST0GRNMsbW2JkHLjBgA7pH6ABV/shyA8dlSHmCPcvMR8XEf2lTHgooAa2BPCA2VT3qYcKec1QpKsfgaK4yCv0hnT/q7GhQmJmFIftEypSHxLpAR1GgJS9uEk6NN5MDQjCCYTXWCw0IHu3sID4=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by OSCPR01MB13329.jpnprd01.prod.outlook.com (2603:1096:604:352::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 12:28:05 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%3]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 12:28:05 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v4 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Topic: [PATCH v4 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Index: AQHb6uxPdpC1mbmW10ejOY4vmVdOG7Qeil8AgAA4dMA=
Date: Wed, 2 Jul 2025 12:28:05 +0000
Message-ID:
 <OSCPR01MB14647F33648B9BD6CC70AF9FEFF40A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250702005706.1200059-1-john.madieu.xa@bp.renesas.com>
 <20250702005706.1200059-5-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWzGLQwmGep9L0A9bzp5mYybA00W=S2cZnGH0tbMJvzEw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWzGLQwmGep9L0A9bzp5mYybA00W=S2cZnGH0tbMJvzEw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|OSCPR01MB13329:EE_
x-ms-office365-filtering-correlation-id: 253fd7a9-94b5-41ed-e6a1-08ddb963e534
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SG1WT3Q4M1RyM1p2aUIzU3pER0g2UnhmeDlEM3drczJjeEdUUmQxWTk1cWlM?=
 =?utf-8?B?MFFKeXl5aUhFSHQrbDJHNjhuVmZrVGRvSWZ5YkpxVGFpcUJoMGxya3JQUE5o?=
 =?utf-8?B?ZHQ2dlZ4RmhBelhaYmtYVGM2cXZNcUcrUGZRcjRFKzEwV3dKVDhGck1sT1l3?=
 =?utf-8?B?KzZZVCtvSzZuaE9mcnFBMVZNdUtSVGt3YW5nVE5uTVowcUZKMG52dlpwN1Rz?=
 =?utf-8?B?UXArZmdLSWZ6V3BRNVB2c29PMDhrNGhJNFJzamphUnpMMm42d0Y4K01yNVFT?=
 =?utf-8?B?ZWpleFFxMThqUmFSWUNDL3E5eW1TS2hxTFRBaHpJVmh4ME1EWW10ZVoza29G?=
 =?utf-8?B?aHZUdUpiWmYrd0l3RC9WaEJnZWNVQzFrc2V2eXAza1Q0blk2R1RlMDZiclE0?=
 =?utf-8?B?cHRVeFBWRG1YYlZQS1IzbGJSTEpwQWptb0JnWFJ0VE5NdU53bDBKaXNIbnFr?=
 =?utf-8?B?NmFKZTd4ZjJMUHdDMW0zanRNMEVCckdQemtVci9OQitMcHc2Zis2Y3pKRDcw?=
 =?utf-8?B?RmVlNWpoV1FzWERpZkg0OW9rdXVNbk4wRkpmOU5Qa2lzMGhMRzF1R3FCSURL?=
 =?utf-8?B?a05KTS9kcTNFc0s3WUsxTktmbHk0bzdhTWFaOVpmN1J5UGE3ZS9nbXBOZzNU?=
 =?utf-8?B?MmFRVTgvK21wOEU2MlRPTUtPTWFoc3RueXJIQWhaRUJuYy9CRjU0UzZxYVp1?=
 =?utf-8?B?OXYxcVhoOHdZWHgrTjZySUVSc0x2ODNxNzZMbzlZQWxPeVZQY3pyMGY3OThG?=
 =?utf-8?B?aHgrNmZOYVBLUndVdnliNExkMXJxcTVPNC9RcjVzWlZpcXZlaXdwSlZGUndw?=
 =?utf-8?B?RDRFRXBFRlNrbXFuNkZTUEJqTWNsN0xJd2xleVlxZGhZOU9KSGwrVVR0VFVE?=
 =?utf-8?B?WVhHUzBnYzlNeTk4d1Vkc1FyUlVyYStPVkRmVUtVUkVubldXVDBycUFaQlFX?=
 =?utf-8?B?dkNXdnVQajZCc3dEQSs0a0hUa212MWVpWElFaHdJWmhTaGthWDZxUVhuWlRT?=
 =?utf-8?B?dGg4QTdiOFlpcjZTRm1lNGdWRU5nRVVEdnd6QTNuR3BIbys3c3UvVmU0Rmg2?=
 =?utf-8?B?MFErdXBiTEtJMVRFRjRMbjU5cEY3ZmRRTVhodkxIaXBUUzZSZWx4ODV6K0hD?=
 =?utf-8?B?Tm5rSjNybk9aejBEQ1VYazRiOWxQQ042c3Z3NEQ5U05ENHZVZko2MVhKTWJN?=
 =?utf-8?B?WGdlU0lzVzdaRFEyRC83QW5QZ29xdDY3VFFVYVYxNldXeWR0Smk1eWVQUXBH?=
 =?utf-8?B?UzM3bHNudGpLZG5wVklzWFBMNm5VQk1JdGRIUmdEcTdlcFVzdjdyblJIWGM0?=
 =?utf-8?B?NEx2MmpPdUtjUEhXeFJSMytqVHNZK0o3TUc4Q1h2bnhRTjc3VDQ2bUU4UjlF?=
 =?utf-8?B?TERaRDBUYWJpd2JmWmdOUzlSME5Pdm10Rk5DZG5nUzBFS2gxcXNLVVRNSmJv?=
 =?utf-8?B?N1U1V1VZSWdmYU9HVnZ4bDhvYmtmSmYvbDdkTi9wZVU3OTVZVjhEbWhiVFVD?=
 =?utf-8?B?V2M4ZW5PUFdLeDlwbm5tSXhOKzNqQ3FYM1d6dWx6ZWRsclR4UVI3aEd4Ly9P?=
 =?utf-8?B?MGJMVWlvUWxFbUtYWTIzMU52clcrTFhhL0pJcWlnTlE3akVwWUZpQlYwTkpz?=
 =?utf-8?B?N3UrcEtueUtRRkNGdnovd29ZUEZiM0d3ZjE2VktNVThqTlVjLzg0N0VFRkl0?=
 =?utf-8?B?SFRiYUJNNTZDTmxQUGY3L28yYWhQemFTaTlwOExqZlEzTnoyNDVLZlVYcVE0?=
 =?utf-8?B?ajB0V0hLWWRzNnhON3ZzTW5yaHVuK2tXMjdJM3oraHFwdFZVd1hRU1c1NXZv?=
 =?utf-8?B?bE85eG9rQWIzTnZjYitlVDk4QTdYV0F5TGRFWEtSYmVaVzRNQ09aVWJjTlNQ?=
 =?utf-8?B?NnVWYXZWRkhTQWJaZHR1ZytiZmxESXArT21CT3hjc1UyLzFIZTZMaFNwRGJG?=
 =?utf-8?B?YUZvQlNudGRCNFg1KzJIL3BmRWdWNDVoRENpRlNZN3NOSTBlMkhtM016SjEr?=
 =?utf-8?B?RWpuY1ZvTlZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NHhhYTlZaWlXQmtEL2lzdGVCTzZWNlRXc08rcC9iWnZEYzk4dEFQWlFxK0pS?=
 =?utf-8?B?LzM0MU4zbEIrZGE0QVNwLzczc3lBcjdXSlA0dWJHQmQxMTd5V2ltaTVHblRF?=
 =?utf-8?B?SlNLL1g1S2JjSFUvZ3REZDYyMmo3QUFHblppQWhPV0NpV2JScHZmbDFZa2hD?=
 =?utf-8?B?STJlbG0xTnVQdVZ2UnN5R2hIaGRpV3JUK1pQZlNZTWQ1RkN1TTB4ZFhGOHJH?=
 =?utf-8?B?WXBpTGNSekJHdy9DcDNrSnlGQnl2cFU4b0xKQmFHTkRCeFoxc081TXkvL1FG?=
 =?utf-8?B?Q1hOak9VZDErVUZuRlhZVUJtaWtZekNTYWxDeTIzSmVrS2lvWEZTZkVlWFdz?=
 =?utf-8?B?R1hZcVdFRmlkRy9uTWNOWXZzanFLeUZiaW9PTWFhRm4yc01INUV3c3l2T2Qr?=
 =?utf-8?B?WE9pa01BeHh2QmxyYzltYVhZaHk0d2pmd1U0KzJ4ZC9rNVRibU0zU0czbkQ5?=
 =?utf-8?B?bEVDb1ZIOVZDdHJISmpTcUwxdXBjS0FLb04rbGhYeE1OVEhnVXQ5d2UzNytC?=
 =?utf-8?B?ZjNHV211ODQ1WFE3cklHZGRiYzF3RW1XUHlSOHZpK29YendUNHZBcERCbERH?=
 =?utf-8?B?dkVxUGQwM1VCQUJaT2ZXczhDaWdVZXU0YzlrL1Z6amxqWnRNM2VNWUx4UWdv?=
 =?utf-8?B?bm8xanpQS3ViU1VadDM1YytvdjV4NWFHU3dhK2RZYjhPREZZdFRjZllTakVV?=
 =?utf-8?B?eWl4VjZORmQ0K1ZLb3MvMEpiRmRDamc5SFhGbFBHYmVETEo4STROeGU2d3J6?=
 =?utf-8?B?N2pmTU15UEcwVFhaZkRWcTVaU0x4RnZsdzV4RzJkVlJ3bW9HNlFWcFJGUG5Z?=
 =?utf-8?B?Q1lGMzhvR05UdXd4N1lBaDR1cjZkSUVlRFZwdDVhZnBJZ1NQZGlKN3FUWHRj?=
 =?utf-8?B?UkpCL1hhTjNiZEw4YTRXT29lMjJmUTFJT2ZRN3o3aXVUaU1ncDFVRnVYVnNh?=
 =?utf-8?B?WmdxbHk1eTZWQTI2dHNLcmdqKzNXSC9DR1dMK1huaXBjdDhZWjFSeVBvaElk?=
 =?utf-8?B?WktldW4zNjJ3R0ZNQzl0TWFOSmZFOWNLS3ZqR2s2ZjJtYTJtd083TkZRSFRy?=
 =?utf-8?B?aEM3RHJKOXVodVBrRTZOQi96QiszNUZNZnk2b2RXUks0ckt5Q2dPaE9rV2tS?=
 =?utf-8?B?SGY2eXJuOGJuNGdkZlJ2TnNYbzUzWVRMUERRcktMMStVZjdZTzluSUVJVWxv?=
 =?utf-8?B?UmpxQ3dDUXp6RHJ3TldvM1RiYXQrWkNoRjVQV3EzSExpRmprTVJGSjc0dXVD?=
 =?utf-8?B?UkttWHk1eWIwM0FFbHgrblZqZ2Y5U2ZYbldQcTRNRXVWck9rZUZ5ZGhabHRO?=
 =?utf-8?B?anBmYlErcFJXSEtXaGxSVS8zNDBQVEpkMTlUVldCSG90Ulh1aHhCWEZBMEFh?=
 =?utf-8?B?MW44dEhWL0hkZVRYbUM2WTY2aUZ1cFhlVHZ3cUVTZ1ZpZFNucWFyUnhRb0ZG?=
 =?utf-8?B?VmVYZ3QwQUQrbFdKak1nL2s3YzhiR1dBcHdPRVZwakZTM0RUYXl6Y290OTFm?=
 =?utf-8?B?SXp1NUo2eU1HbWI5QWg3bVBLSGJtNmZLeUlvNmhNNFRsMzdQMk1oVlkwbkJZ?=
 =?utf-8?B?MzFaTmp6SmpnUFlUMm1rNCtUTys4OHJOcktIY3lkQTMwTHdrc2lscTFrZVJ4?=
 =?utf-8?B?WDlHNDJmMXVoWlpDc25sa2J6TUw4TzhPQUlxNUJJcG5idVhhMkNNZ0ZzeVpM?=
 =?utf-8?B?T0pyTVpaa0pzbVZHL1FzcFF1VjB0cjg0N1IyUUVSckU0UXc5eG1ScmNEd1hT?=
 =?utf-8?B?TU5JY0swbVFHMU1MNlg2VmFldHN6QmZna082aG8xVW1pS1gzKzdTUUlObWNp?=
 =?utf-8?B?WE1saFhCV3k4ekg2OVRqZ0Fha2xLemg4dGdYZ0ZneDh6UzFvdkxNN01oYjU1?=
 =?utf-8?B?OG5uSWZ3dHFOcWREOFZKOXFvcnhCcjF3MWNCeHNSNmt6TktOaHZLSTJjTkU3?=
 =?utf-8?B?N3Y4NWpPc01aYTR4Tm1FQ2M5a0ZaMUZvVlFCL0oyWDdSa2VhQnhRRHlYWHJV?=
 =?utf-8?B?bHdLeFZHODhzOTJreERIeGFTUzh1NGovejNpVkl4ZjJrajkrVlZlRFIweG9S?=
 =?utf-8?B?KzVuZ1p1U3BFZGxkZGg4OER0U1ZCa3pZdnY3T3pHRklNR3hMTmpKYUZpSm9j?=
 =?utf-8?B?YWs2S0hVK2VkUStiUXFnNkt3eGkxTzUrci81dHNVT24zbEtSbEQ3cytwUE9K?=
 =?utf-8?B?Zmc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14647.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 253fd7a9-94b5-41ed-e6a1-08ddb963e534
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 12:28:05.4452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vFSbyzcKNcSIfpo03yQ9lEZXtwizMGaRDOnuJRId6AL3jL3jXfA0zErn3sa1YunsSvbAJ6Iiauvl73tc0eFJweo7DW4tbhQVkSbouAznB0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13329

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDIsIDIwMjUgMTE6MDMgQU0NCj4gVG86IEpv
aG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NCA0LzRdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJ6ZzNlLXNtYXJjLXNvbTogRW5h
YmxlDQo+IGV0aHswLTF9IChHQkVUSCkgaW50ZXJmYWNlcw0KPiANCj4gSGkgSm9obiwNCj4gDQo+
IE9uIFdlZCwgMiBKdWwgMjAyNSBhdCAwMjo1NywgSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1Lnhh
QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBFbmFibGUgdGhlIEdpZ2FiaXQgRXRoZXJu
ZXQgSW50ZXJmYWNlcyAoR0JFVEgpIHBvcHVsYXRlZCBvbiB0aGUgUlovRzNFDQo+ID4gU01BUkMg
RVZLDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFA
YnAucmVuZXNhcy5jb20+DQo+IA0KPiA+IHY0Og0KPiA+ICAtIFVwZGF0ZSBwaW5tdXggdG8gYWRk
IE9FTiBzdXBwb3J0DQo+ID4gIC0gRHJvcHMgVGIgYW5kIFJiIHRhZ3MgaW5pdGlhbGx5IGNvbGxl
Y3RlZA0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kNCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kNCj4gPiAgJnBpbmN0
cmwgew0KPiA+ICsgICAgICAgZXRoMF9waW5zOiBldGgwIHsNCj4gPiArICAgICAgICAgICAgICAg
Y2xrMCB7DQo+IA0KPiBObyBuZWVkIGZvciB0aGUgMCAuLi4NCj4gDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcGlubXV4ID0gPFJaRzNFX1BPUlRfUElOTVVYKEIsIDEsIDEpPjsgLyogVFhD
ICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0LWVuYWJsZTsNCj4gPiArICAg
ICAgICAgICAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGN0cmwwIHsNCj4gDQo+
IC4uLiBzdWZmaXhlcy4uLg0KPiANCj4gPiArICAgICAgIGV0aDFfcGluczogZXRoMSB7DQo+ID4g
KyAgICAgICAgICAgICAgIGNsazEgew0KPiANCj4gLi4uIG9yIHRoZSAxLi4uDQo+IA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxSWkczRV9QT1JUX1BJTk1VWChFLCAxLCAx
KT47IC8qIFRYQyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIG91dHB1dC1lbmFibGU7
DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBjdHJs
MSB7DQo+IA0KPiAuLi4gc3VmZml4ZXMuDQo+IA0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZSBpbg0K
PiByZW5lc2FzLWRldmVsIGZvciB2Ni4xNyB3aXRoIHRoZSBhYm92ZSBmaXhlZC4NCg0KVGhhbmtz
IGZvciB0YWtpbmcgY2FyZSBvZiB0aGF0Lg0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KDQpSZWdhcmRzLA0KSm9obg0K
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4gdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K


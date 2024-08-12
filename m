Return-Path: <linux-renesas-soc+bounces-7814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E8C94EEA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 15:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0DE6B22CFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 13:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D324A17B43F;
	Mon, 12 Aug 2024 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gFienXuz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEB716DEAD;
	Mon, 12 Aug 2024 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723470483; cv=fail; b=k80XTrGfqBM9PXdTypHtoLCks0EX78tnQPawM5Y89zBTXyRfUIjiwk/K01fttzGeCKDsH8Xo5HlR4DcJKAeOybxKfzgHyLw8u3rglLxT15TP1b2F+VLgn++/XpGXzBzlgyU/JzDoV1RpBY3AGKZJFMPAIwjz7VoZfCIDZKAxWPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723470483; c=relaxed/simple;
	bh=P0hkg4+rPgQb7zRqXiB61gfPgNtm2I18nKeYezuGY/o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fRcNaxz46W8weTialGeJzfNdzjMBVQDXC7CNr7buissnUh9lT0aUPehAQEETRfGqd+IPE1Pf/p3N7CRboqayrZ3Dt1KCacx7mK0I6O5EqZLYTgXAyHYsPvkaH+KCE3d11lTpqh+XJ64YkidTh37FUyAbfEppu6Yh7an649SFn74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gFienXuz; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da+JB17nfy/3PbsB0B1ROufCZ95AQqXhhmCrA+zs+dKyfC0mVyWqflt2Oy9F2vdjO9lz+fYnlYrJpyZnJxfzeHYotW+MHeQPi4wlgMwqBCXbo+KqRK7iiLrMJxwu7doMDvFQXjQKmjAXkFJqN50eiNZRZiiaEbw4Be1uELsAjSF5xlZHl4T8t4eq8gufF9cbIqxa93ot/dRF30E3QJfAX788ElSQnHCo7p7M7rVXfKNIONCOgj/HkuELl8EqCyW3Uqde58NuyV+TzzpssVonoDLmWU+v6ifPuxmb5tJ0Ps4CayQaDDv4EwwLcfPwHzz4wGzRrjTLKhnjil5Q0+WVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0hkg4+rPgQb7zRqXiB61gfPgNtm2I18nKeYezuGY/o=;
 b=QrKyqTjtV/SA8oer4Z6284UswFdOAyz4yYc8sansJE66I/dPR5PuFCaiu+25Gz/1De+/hbUpRQxsFOMc4jRZZ/dBEm6Wx8mEeGfy36sn7zADJjj6/cZYWBoXRVxpyIYnsJikb9OQYtJ6ygGMm0Dam/FRP2umN83WXvyaBM2Nea6r9fyPgZQQ26sV0v56epJwHxNFZgVFD0GbJx6dD+xKmNhZK8hJS5XGp4MvfKDp+tGb6VMw2KD9KkeoDeRtx4LmHnakq4nNaRp+mC5X2Xh9ioAhuUCB1QN6Xhs/TQUgQ/obw1kLrdEy1bYz4Cs5RCZ/++IHK1DwhuMpteEJm1er5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0hkg4+rPgQb7zRqXiB61gfPgNtm2I18nKeYezuGY/o=;
 b=gFienXuzVTWf0hbV1mKEPkB1713qs4nlurrH8SsQlW0fNpTk3n8RYqpESH00EX/iWs2vH3/UEcIooip0vpoyA9+cITQ/Wi1FPZ95Ky1qmWWwxTerFZxRP/j2tfJfz8GgWfloZANtpQ9ptRC6EUE1qH4m9Icn/DtNAdJoTx4SIic=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12882.jpnprd01.prod.outlook.com (2603:1096:604:33c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 12 Aug
 2024 13:47:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 13:47:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
Thread-Topic: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
Thread-Index: AQHa7DAXCupFvrqDHkWsJaJo6V49crIjPC6wgAAcCgCAAAxjMIAAKU2AgAAVu4A=
Date: Mon, 12 Aug 2024 13:47:56 +0000
Message-ID:
 <TY3PR01MB113464E844351470FA4C5423886852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113466DE7061B60485B3BE97986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vioGija2x=eoqn1jZbMpK8PAeLzXQZP52hQn976BKisw@mail.gmail.com>
 <TY3PR01MB1134680204C824F1B567B21B986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8toz3xpKSyBj39L-M0iOkbgTRse5jPTocspBrmDzZLUzQ@mail.gmail.com>
In-Reply-To:
 <CA+V-a8toz3xpKSyBj39L-M0iOkbgTRse5jPTocspBrmDzZLUzQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12882:EE_
x-ms-office365-filtering-correlation-id: a8790e71-39df-4213-969a-08dcbad55ecc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SmoxaEhUZzh4ZHdCcHhBQ2RPaVFqTThHTDBoWkE0eHdkeVd4ekM5NUtNMlRL?=
 =?utf-8?B?M0xiVCtwSm5laDFNUGNmZ3JGMUJ5MFdVQ0RlNzZPY2M5cEpBRWxscFUwZWtm?=
 =?utf-8?B?VDVrc3htZVpCejJEOVV2c0Z4cEZGdWdJUjlFek1oMzNmd0VEN2VuL0d6Y2ZV?=
 =?utf-8?B?WnJYSHNsS29oMVYyZDZkRFhDSWU1eWJzUDYycjdLOFdiZ0VSMm9jaGJSZXRF?=
 =?utf-8?B?U3pmUm8wTEFuMW5YM1I0OW1kZ3pmRGl6dDh6cVdMa1VDdnhuMkZGUmMrdkdW?=
 =?utf-8?B?TVJxVlRDTU9IMDNuMitZT3huaEtUOGZUL3FScVZ6Y2hJOHpmWTBacWJFWTdZ?=
 =?utf-8?B?d1hBYS9idlZoWktTdklDUWJVcnd2RjFnVkZNSXhYVzJoNGhFOTljL1UzYVF2?=
 =?utf-8?B?QW1wL0U0ZFJtVTZtMWVTUFMyN3RNbE0wbHovb2t6aitjbERwY2JwK2tuaUZv?=
 =?utf-8?B?YUMwVmx6M3l2K2gxbDdWWll5bDJkYm15LzhaTXJ0Nzc4Z3Vqcmw2M21CL0k2?=
 =?utf-8?B?ZnNKRUV2TUFTWGZHQ20zdTNpKzd1UytaTkdnSFQ0cEpCbUJ6RnQ3MDA3eklw?=
 =?utf-8?B?Z3FMUGxkVTNIN0w4MzkwSE9oMzFBVjZkNEdiQ3N2amVTc3JwREx3am8yeFFq?=
 =?utf-8?B?Qy85Z01KczRYME9BRFhnNUFnQlUyWDJPYkNRNTNkbWpoZ2xwMEdJZThZYTh6?=
 =?utf-8?B?N1lLRGFhOW1UMUlIaU5RcGVCSmxIKzJkMFlWV3lNN1l2amJ0WlVSOXN0MDYw?=
 =?utf-8?B?R2xmZCtOeVNZZDBweFhNQkJjRDdJRXJ5RUFRbjZVc3ZtNjNicXdnVkxHYjAx?=
 =?utf-8?B?OWVvcnhLOVp6NVhocVJ4ekw0ZkJuYUhzRWVOQnBRdmRJYW1Na2dFZ055M3NK?=
 =?utf-8?B?SS9xZHJEdTBuaENoWG16b1Y5d05ESzhmUzVtZDFwWEZRUjFtcm5obVR3anF2?=
 =?utf-8?B?VDRveXIxcTE2VFdXK3ROR3JocEFBWnBMdnlTNWZ0eUtDRjVWeU1ZTUx4c1d3?=
 =?utf-8?B?bGdkaXBHa0hmeU5DZEZ3S3B3cmRqRzJyTnJUYUJNdTg4b2dOcndMV3lzbDBp?=
 =?utf-8?B?OWJMaUF0OTlRYUM4cHBMaHRhU2hGM2dIc2xndzJNanY5czZscC8xSWcvYlFJ?=
 =?utf-8?B?N0N6SmEzT2w3ZEVmMzhiL294RkxhZjJoYU5ZU01ZbFJvT21pb3FyMzlSSVJU?=
 =?utf-8?B?RThxUkQwVVQ5d21kK2RyYTRMN0VtTGtteDl4MW5PVVpDaTZHWVJjVHR6UnRT?=
 =?utf-8?B?MFkxSlg0MW5DOUppQjgrYzlJajFzL1hvSnU1QjN4MGY0a3B0RU0zSW8zb3Jq?=
 =?utf-8?B?TlRKQXZjWTBSWk14bnZrc2U2b20zZVhUYnh6RUdEQ3NGajhlS0hjenRPN0tU?=
 =?utf-8?B?Y1c3NXduRVI3eDM2anF6NTBrSHBoc1A1VHZ2RkxpVnB5ZkJaNTVicHpnenlR?=
 =?utf-8?B?TjRJTERocUwyUlJ4MDVmak9la2dWKzdQNVZHT3A3ck1hSVlZK2VmRjZsMnZK?=
 =?utf-8?B?TDZRTkMwYm0xQitzVElYOGdjdVQwSzBWcDMxeVhpWU9DRnRsQVBuNnFPdEhT?=
 =?utf-8?B?dlJHZlVQL3AvblJXZFA0TGk3S1MzS1NNUXMzczJCNklKWG5PbXNUTWgyRjlV?=
 =?utf-8?B?cGdVVlNqNXUrUVRWQURnbUkzZ2Y4T1drUUVIcWJSQ2FIQ2JvYU5hRU92NFYz?=
 =?utf-8?B?OWI4NWRleEVLS0lnaENFL0w2M3RLdTc0NlVwUjE5bUlWc2ZwaEVuTkV5Yzdz?=
 =?utf-8?B?T011dEpJUkVsRGdHdTFDeXgremtIcks0YnJiMEhaVWM2eGQ4aHpPdWJSWUF0?=
 =?utf-8?Q?r5A8t/0zCJaKar25fP9wSIA6ivfVX+r4FbZBc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVV4Uzl5MVRUSnRQMXRUVjJnTnduZWhYWjdxZnIwZkdNWU03QjJiT0pHeGM5?=
 =?utf-8?B?Ukx4ZStHQ3VaQ3BMVFg1cllreDBjYytsSE9FY3JaWG5zWG9zOUlEemVxdjdQ?=
 =?utf-8?B?dUh4SUMxWFpLanVPQ2c0Y0RBUEJVNnpsbUN4S21HUkg1Rmw3bVNRbFBORldj?=
 =?utf-8?B?RWlxejFjZEovQUZYeXJydFZCc0RxNTJ0L3V6TlVmYlkwSWhxb1dpbGNWY0hF?=
 =?utf-8?B?cnUrN3RBVlQ5bUNsZXBqaDRTWERndlJIQlNJRUVRVWpIOXRoQ0JBcXFEclRi?=
 =?utf-8?B?YS9BdGhOTFpqOVZFTzI4dlZXTXhMWjIvWFA0K2ZJaTQ1SlJqQUIrV25wSXFa?=
 =?utf-8?B?dEVxdFp0ZlhDSmY5L0dRWWdlMnROeE1FNWtRbHROMitkYmFwcTFhZ2dPZ3BM?=
 =?utf-8?B?TS9iRDhVaktVN2QyYTVsdUNpS0FxeXpIaHNYU20yZnd6RHZuckJ2eUVHVmEy?=
 =?utf-8?B?TTd6V0JYV3Z4ZHZLTXhDcXlGNXN4QzFnWUxMQURrdjUxV0NndDFQWUZRbHo5?=
 =?utf-8?B?TFpWc2dyR3hRR1ZGTmwrWFFqRW5XZENRZ0pMZnRWZkk5WGpQWHROaXJ0Szk2?=
 =?utf-8?B?UElnNFFOOEFUZGJQS1lNd0RDQURLUWc2QkMzVUxKc1dvUTVaN0w4WkdjMkxK?=
 =?utf-8?B?M0VOVUphVXJYNjFxMVRrNFlZZ1FIS1JQamFzU1Fqc2FkZzdXSUxUdzBCQWov?=
 =?utf-8?B?bml1NGRBSUFjRFNaUVE1TlVveTdwb2h2L2Fkd0Yzay9yN0hTRW9KMXZEenNl?=
 =?utf-8?B?eEFleW9RdXE3VFFOZm9VeWRJdlo4eXV6K2M2WGhtQTJwVnY4OFBrWTJkSlhj?=
 =?utf-8?B?VXYvZVRPREdMRTdPTVJZdWo0cytxK2U0bVNnSlp6S1FyNlczYkxRTlNTcGQ1?=
 =?utf-8?B?TWhRT0RKd2lyaDNuR1BLT0JuaHowZmp5ZkxwQktMN2xneTV1eVZMTU9zOEQ2?=
 =?utf-8?B?Q1BLdzFsR1NLd3lmV0ZlMHhnTnFVKzNaKzNqczFnSmRVV29NbnBqTXE4Z1ox?=
 =?utf-8?B?T1hKMEhuSU8yQ1Q0UXZBamxtWGp5SjljbVFtcXpkcTRqcDVFbXZDdWdHbkdh?=
 =?utf-8?B?YWQraXEreEhYUXI3SHkwWks0QUYvUGg4RmlkekNyaE1vVXFSOGJrYS9Tc2VB?=
 =?utf-8?B?ZVRnTElzd0JjZTYyeit1NzlJRVBzOWZZeDFDcFBWV0lCSzBXeDVlcDhWUERW?=
 =?utf-8?B?V0duZEVNS3ExMXB4VUVuOTMzM0d0VXB4U09VOU1UWUVGZVNOQU0xNmpxUUFI?=
 =?utf-8?B?dEhycHFLVHU3UFdDMlRuTDE2Slk1NmRGYkhURTlnUEhlSVVoRnNIeWlXdTRT?=
 =?utf-8?B?aHZMcjJydnBLWmxkNVpGWmJzaHZTUXBTTmRUUnMzbGV0MDhoU1FmN1lNU1dX?=
 =?utf-8?B?OVJEYVNjSVFmd3RuVlRnTHp5amg4cHpaczExTUlGQ0VoNzBSSE9yU2ExYVpJ?=
 =?utf-8?B?THIzeWovQ3RhTTMwci9RZUIvV1lKck1qc3dnamQwbWdHS29pY3dna1FkYmhY?=
 =?utf-8?B?M09WeWtwZHJTTzhhY0ZtR000NElpMm9KMEFuVjF3VFE3Q0dkelNsQ0dvdDFs?=
 =?utf-8?B?ZHpuamp1VUVTeEJqYmpBWDBNWTREbnpvRDVhV09leVAxZGdHSmgzMFowOHVq?=
 =?utf-8?B?dXgrSzVJSUJxejNUN3NzTENQTzd6a1poZjBFeTJmSkh5OW8wWC9kbE8vU2V0?=
 =?utf-8?B?NDQvT3I4QlV1UkY1VE5pVldFSnZVbkx2dmQ0Wk1nL0VoRUtYbVMya1lycWJY?=
 =?utf-8?B?N09QNmVRQUNjNHdUYjJRdW52SFE0a2lIRFErRTVrYnRJUlpxbktIN0RIc21G?=
 =?utf-8?B?SHNJYnFRbCtwQ3UvVThNZUVSUjAwVE5hdERWM3hpL3REWlVBeVo2N3BpbU5j?=
 =?utf-8?B?VlIrdEZrYy9JQUpIQUZrYTRyb2t5d1k2NWZJTWZrZGtFTkpDSUxnZWdjdE41?=
 =?utf-8?B?QXRwei9hbk13KzJ1WjRyTjlqaDdsVk9ZVksyMUFuNkNxQ0ZJRXdvN1c2U1J6?=
 =?utf-8?B?UzRxVXdza3M0bVo1RnI2NkJhRDkwRi9rbmxDK2w0RjMwMTVaNHJoRUJKWkI1?=
 =?utf-8?B?YkpVdzhONWp5UE8xdjdBWVUrYytQTHdvUDVTeUozTWJ4YWxaM0g5cHlNZHNp?=
 =?utf-8?B?ZEdJd2lNbVBmNmFlLzROWGJJZ2NCTXVpWDVsSVBaUlpHajdCTEs2YXhNYkE1?=
 =?utf-8?B?Znc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a8790e71-39df-4213-969a-08dcbad55ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 13:47:56.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZm04RwdnwTvj6TCMzEAul2WtXRV0hch9qXTHVmqBx3jsw/+weTUAKB9p+XvJANk1jh3UOxINwBbMbd3JGjSRDe6/Get/Vmap+votFeaOyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12882

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5
LCBBdWd1c3QgMTIsIDIwMjQgMToyOSBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDcvOF0g
YXJtNjQ6IGR0czogcmVuZXNhczogcjlhMDlnMDU3aDQ0LWdwLWV2azogRW5hYmxlIE9TVE0sIEky
QywgYW5kIFNESEkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBNb24sIEF1ZyAxMiwgMjAyNCBh
dCAxMTowMuKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPiBIaSBQcmFiaGFrYXIsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPiBGcm9tOiBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFp
bC5jb20+DQo+ID4gPiBTZW50OiBNb25kYXksIEF1Z3VzdCAxMiwgMjAyNCAxMDoxNiBBTQ0KPiA+
ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA3LzhdIGFybTY0OiBkdHM6IHJlbmVzYXM6DQo+ID4g
PiByOWEwOWcwNTdoNDQtZ3AtZXZrOiBFbmFibGUgT1NUTSwgSTJDLCBhbmQgU0RISQ0KPiA+ID4N
Cj4gPiA+IEhpIEJpanUsDQo+ID4gPg0KPiA+ID4gT24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgODo0
MOKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4g
PiA+DQo+ID4gPiA+IEhpIFByYWJoYWthciwNCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB0
aGUgcGF0Y2guDQo+ID4gPiA+DQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0K
PiA+ID4gPiA+IFNlbnQ6IFN1bmRheSwgQXVndXN0IDExLCAyMDI0IDk6NTAgUE0NCj4gPiA+ID4g
PiBTdWJqZWN0OiBbUEFUQ0ggdjIgNy84XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOWcwNTdo
NDQtZ3AtZXZrOg0KPiA+ID4gPiA+IEVuYWJsZSBPU1RNLCBJMkMsIGFuZCBTREhJDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQu
cmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBFbmFibGUgT1NUTTAtT1NU
TTcsIFJJSUN7MCwxLDIsMyw2LDcsOH0sIGFuZCBTREhJMSAoYXZhaWxhYmxlIG9uDQo+ID4gPiA+
ID4gdGhlDQo+ID4gPiA+ID4gU0QyDQo+ID4gPiA+ID4gY29ubmVjdG9yKSBvbiB0aGUgUlovVjJI
IEdQLUVWSyBwbGF0Zm9ybS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExh
ZCBQcmFiaGFrYXINCj4gPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVz
YXMuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IHYxLT52Mg0KPiA+ID4gPiA+IC0gTmV3
IHBhdGNoDQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gIC4uLi9ib290L2R0cy9yZW5lc2FzL3I5
YTA5ZzA1N2g0NC1ncC1ldmsuZHRzICB8IDE5MQ0KPiA+ID4gPiA+ICsrKysrKysrKysrKysrKysr
Kw0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkxIGluc2VydGlvbnMoKykNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlh
MDlnMDU3aDQ0LWdwLWV2ay5kdHMNCj4gPiA+ID4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOWEwOWcwNTdoNDQtZ3AtZXZrLmR0cw0KPiA+ID4gPiA+IGluZGV4IDU5M2M0ODE4MTI0
OC4uMTFjMTNjODVkMjc4IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvcmVuZXNhcy9yOWEwOWcwNTdoNDQtZ3AtZXZrLmR0cw0KPiA+ID4gPiA+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNTdoNDQtZ3AtZXZrLmR0cw0KPiA+ID4gPiA+
IEBAIC03LDYgKzcsOCBAQA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gIC9kdHMtdjEvOw0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3J6ZzJsLXBpbmN0
cmwuaD4NCj4gPiA+ID4gPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KPiA+
ID4gPiA+ICAjaW5jbHVkZSAicjlhMDlnMDU3LmR0c2kiDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAg
LyB7DQo+ID4gPiA+ID4gQEAgLTE0LDYgKzE2LDE0IEBAIC8gew0KPiA+ID4gPiA+ICAgICAgIGNv
bXBhdGlibGUgPSAicmVuZXNhcyxncC1ldmsiLCAicmVuZXNhcyxyOWEwOWcwNTdoNDQiLA0KPiA+
ID4gPiA+ICJyZW5lc2FzLHI5YTA5ZzA1NyI7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgICAgICBh
bGlhc2VzIHsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIGkyYzAgPSAmaTJjMDsNCj4gPiA+ID4g
PiArICAgICAgICAgICAgIGkyYzEgPSAmaTJjMTsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIGky
YzIgPSAmaTJjMjsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIGkyYzMgPSAmaTJjMzsNCj4gPiA+
ID4gPiArICAgICAgICAgICAgIGkyYzYgPSAmaTJjNjsNCj4gPiA+ID4gPiArICAgICAgICAgICAg
IGkyYzcgPSAmaTJjNzsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIGkyYzggPSAmaTJjODsNCj4g
PiA+ID4gPiArICAgICAgICAgICAgIG1tYzEgPSAmc2RoaTE7DQo+ID4gPiA+ID4gICAgICAgICAg
ICAgICBzZXJpYWwwID0gJnNjaWY7DQo+ID4gPiA+ID4gICAgICAgfTsNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IEBAIC0zMiwxNyArNDIsMTg2IEBAIG1lbW9yeUAyNDAwMDAwMDAgew0KPiA+ID4gPiA+
ICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCj4gPiA+ID4gPiAgICAgICAg
ICAgICAgIHJlZyA9IDwweDIgMHg0MDAwMDAwMCAweDIgMHgwMDAwMDAwMD47DQo+ID4gPiA+ID4g
ICAgICAgfTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgcmVnXzNwM3Y6IHJlZ3VsYXRv
cjEgew0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4
ZWQiOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1l
ID0gImZpeGVkLTMuM1YiOw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1t
aWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gPiA+ID4gKyAgICAgICAgICAgICByZWd1bGF0b3It
bWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIHJlZ3Vs
YXRvci1ib290LW9uOw0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1v
bjsNCj4gPiA+ID4gPiArICAgICB9Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgICB2cW1t
Y19zZGhpMTogcmVndWxhdG9yLXZjY3Etc2RoaTEgew0KPiA+ID4gPiA+ICsgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZ3BpbyI7DQo+ID4gPiA+ID4gKyAgICAgICAgICAgICBy
ZWd1bGF0b3ItbmFtZSA9ICJTREhJMSBWY2NRIjsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIGdw
aW9zID0gPCZwaW5jdHJsIFJaRzJMX0dQSU8oMTAsIDIpIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiA+
ID4gPiA+ICsgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47
DQo+ID4gPiA+ID4gKyAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAw
MDAwPjsNCj4gPiA+ID4gPiArICAgICAgICAgICAgIGdwaW9zLXN0YXRlcyA9IDwwPjsNCj4gPiA+
ID4gPiArICAgICAgICAgICAgIHN0YXRlcyA9IDwzMzAwMDAwIDA+LCA8MTgwMDAwMCAxPjsNCj4g
PiA+ID4gPiArICAgICB9Ow0KPiA+ID4gPiA+ICB9Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gICZh
dWRpb19leHRhbF9jbGsgew0KPiA+ID4gPiA+ICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyMjU3
OTIwMD47ICB9Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gKyZpMmMwIHsNCj4gPiA+ID4gPiArICAg
ICBwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47DQo+ID4gPiA+ID4gKyAgICAgcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgc3RhdHVzID0gIm9r
YXkiOw0KPiA+ID4gPiA+ICt9Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4NCj4gPiA+ID4gY2xvY2st
ZnJlcXVlbmN5ID0gPDEwMDAwMD47IGluIFNvQyBkdHNpbQ0KPiA+ID4gPg0KPiA+ID4gPiBXaHkg
ZnJlcXVlbmN5IHNldCB0byAxMDBrSHogZm9yIGFsbCB0aGUgaTJjIG5vZGVzIGV2ZW4gdGhvdWdo
IFNvQw0KPiA+ID4gPiBzdXBwb3J0cyBUcmFuc2ZlciByYXRlIHVwIHRvIDFNSHo/IElzIGl0IGJv
YXJkIGxpbWl0YXRpb24gcmVzdHJpY3RpbmcgdG8gMTAwa0h6Pw0KPiA+ID4gPg0KPiA+ID4gVGhp
cyBpcyBkdWUgdG8gZHJpdmVyIGxpbWl0YXRpb24sIG9uY2UgZHJpdmVyIHN1cHBvcnQgZm9yIEZN
KyBnZXRzDQo+ID4gPiBhY2NlcHRlZCBbMF0gSSBwbGFuIHRvIHVwZGF0ZSB0aGUgZGVmYXVsdCBm
cmVxdWVuY3kgdG8gIU1IeiBpbiBTb0MgRFRTSS4NCj4gPg0KPiA+IElmIHRoZXJlIG9zIG5vIGJv
YXJkIGxpbWl0YXRpb24sIHBsZWFzZSB1cGRhdGUgdG8gNDAwa0h6LCB0aGF0IGlzIHRoZSBuZXh0
IGJlc3QgZnJlcXVlbmN5Lg0KPiA+DQo+IEknbGwgbGV0IEdlZXJ0IHRha2UgYSBjYWxsIG9uIHRo
aXMgYXMgYW55d2F5IHRoZSBvbmNlIHRoZSBwYXRjaCBbMF0gd2lsbCBiZSBtZXJnZWQgd2Ugd2ls
bCB1cGRhdGUNCj4gZnJlcXVlbmN5IHRvIDFNSHouDQoNCk9LLiBQbGVhc2UgbWFrZSBzdXJlIHlv
dSBkb24ndCBzZXQgMU1IeiBmb3Igc29tZSBkZXZpY2VzIGxpa2UgT1Y1NjQ1IHdoaWNoIGhhcyBh
IG1heCB0cmFuc2ZlciBzcGVlZCA0MDBrSHouDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiA+
IFswXQ0KPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJl
bmVzYXMtc29jL3BhdGNoLzIwMjQwNzENCj4gPiA+IDExMTUyMDcuMjg0MzEzMy05LQ0KPiA+ID4g
Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20vDQo+ID4gPg0KPiBDaGVlcnMsDQo+IFBy
YWJoYWthcg0K


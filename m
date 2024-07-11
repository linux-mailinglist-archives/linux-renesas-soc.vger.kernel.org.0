Return-Path: <linux-renesas-soc+bounces-7250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9879B92E365
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 11:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0161F23B40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 09:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706B1155726;
	Thu, 11 Jul 2024 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="alRhklhA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB1BE6F;
	Thu, 11 Jul 2024 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720689998; cv=fail; b=B65VbU1CHPJdr5K891PAr7rGTc/jd4VflWLHt30hyFVRw4AWQHJXobgxJbkwtgV9Uz8y29HqUUm8auvoWO/MmChVu2j5KaWSQa4ZoVj/zdWhbel2RFbPq1LfIz7z56a3Ld74DHYHf3yxn6M4NicZwewQ+F0VpOTQDh2+6MBUrFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720689998; c=relaxed/simple;
	bh=JERDp4dIBlS8moMhGqNGmrc0tBY7z2itr2kznkZTBYs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cj599K9VT10xVN3345EHSMcumajnMnWfEYp0bwDouUU4iCA3uDBDBx/fguNc9Ue5VbLVmEs3vrHT77ZGFz9wgPGK+f0fIxdWbgFgjpoKknUKWLNrgjrzLGEhxt2uLxcMOxzpTCA+AZ+EjNFfMDK29y5roOOZlCWZmlWqhO7P5h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=alRhklhA; arc=fail smtp.client-ip=52.101.125.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwbXdp8oCjzcRX9oMuQaviz7PzRvahvyEyz3JWg3JWiBzzv0/OJShD/ko1DQapXCsFd4jJyFs2pQSWm8+/S4Et/AerU8AFiOk6Tqe31K61YhAF+8e+OpSIeRNs8/jO7iiaLKpeRCk1OUFuYmUbC29FJBjxrzHaaO6EMWWsjLMFX6bJagu5VQrhAEd33aPDZhO9UVTcYv/OTb/S1IhpKq4VNUAAMC2gbHJITaZHBBN0PdT7ZjTzbWP89frWb58VysqlBM0AG4Z43/+PoJlb1WkTOHla1TI9A+sQ3qGHW9ty5BfkqTJdSiUetyXNZAfTpj6Ys47gFjlvFV6xodQ0ru6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JERDp4dIBlS8moMhGqNGmrc0tBY7z2itr2kznkZTBYs=;
 b=Rh/JZAwJW2jOzrw3HM4J57zY3eeK9GpJdxYHtuXbMNJytgIbBnhB3R32E2w7RRjyIzDBXblmqWiHwjpqT9+x7HLMfs5dvfhyzaOb/gKOh5TTH9Gmblky2ALbOBrXEocCbT8ycXFaM33w3w1CjE38N9ekLZuzagvJC5PKQln2vCclibfhY2kMiHnKhhOE+JlbPBWaatGDqCaTiinfL01PK6f24u5+Vg4Yc8Y0sG+bYQJQxTi3jdwIftte9Uz9sZ8MTO393IZejioPykSRMy6cYC4j1Ilh5z6sEEFZ/jFAWmDJbv7tRqJPl8/UXh1bjNLlrFuCTWnW5Q6OCpAVM3DGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JERDp4dIBlS8moMhGqNGmrc0tBY7z2itr2kznkZTBYs=;
 b=alRhklhAR50b53X6oJuNM1iNtMVKZLlY9FCcFyScAUSxw/uzVBWMCVKu9LFwtM3uNU4BRyA6Lyax1VEoSWKWgzrZ4CnbwXbdHeTOCsLCfM9gBAKN9fPVxd5jDshXTAGmFWBM5POtS6EEPUhISkBu6mye62tflNpnBGVhC9sxqWU=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYWPR01MB10918.jpnprd01.prod.outlook.com (2603:1096:400:391::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.21; Thu, 11 Jul
 2024 09:26:32 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 09:26:32 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 00/14] clk: renesas: rcar-gen4: Fractional PLL
 improvements
Thread-Topic: [PATCH 00/14] clk: renesas: rcar-gen4: Fractional PLL
 improvements
Thread-Index: AQHa0sqYjZpe90dDGU+x52ogoYdJy7HxMlDAgAACtQCAAA3HYA==
Date: Thu, 11 Jul 2024 09:26:32 +0000
Message-ID:
 <TYCPR01MB11040379105FE67A3B7152B32D8A52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <cover.1720616233.git.geert+renesas@glider.be>
 <TYCPR01MB110400CA4023266B96C8077DFD8A52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <CAMuHMdUC6JAZrR_rroy_87m9=hxTHQU-A9Hqzm95QSk+LKfD5g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUC6JAZrR_rroy_87m9=hxTHQU-A9Hqzm95QSk+LKfD5g@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYWPR01MB10918:EE_
x-ms-office365-filtering-correlation-id: e33d676d-f94e-4c13-2a66-08dca18b8d3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?azVRaEZQb2J2bytXcmZKeE5yV00vbEY5bU9rMFJaSGtoeURnOFA2emtJclE1?=
 =?utf-8?B?dXJxYVVORmxETnJKVHVqNGZib2FHY04rajYvQkRIbWFaY2pYSGZkN1NOamlF?=
 =?utf-8?B?S0Fxamp2eFVxK3l4Ymp2TkFKTXhld3NZZ3lhc05kTjZsaEdBcURUenh5WnRK?=
 =?utf-8?B?Y1I2c1gxcjdIb0NhZ2tHNTJkL21ORktUQlpGTDBRRUgrQ3hOYWswdXJmSmVF?=
 =?utf-8?B?YW5zU1AydXhHdFJRL2ZFcEhwL3JkZUI4TENscVB6bmM0aE1YbCtoRENELzha?=
 =?utf-8?B?WDdaM2JTZ1hzZnl1NGVLMWo2S2oxMnV4bEdqTXZ0cVdDamp3TTkvaGtKVS8w?=
 =?utf-8?B?dnJaSVRzK0RCUThScVlBTjJKcnFkbFdKM0EybUJvOGQzVWxSRFhpYUpMK1JL?=
 =?utf-8?B?c0FlblN5OEEzTmZDVHc1WDFTMzdjek5maWk3VmQ5SytOdnJIUmp3U1dIYjhE?=
 =?utf-8?B?K3JHbW5wRTFxb0t6Q3hKWVMvcTE1QzZVVEZxalN1WFhVNkg0ak9Xa2pmb1hD?=
 =?utf-8?B?S1gzZS95QU9ZckJxbkZadlBhakdQVWRiTktBdmNMaWhkQUpUOUgrNjZDOXdF?=
 =?utf-8?B?SmNXNml5ZjMvWlV4M0JkcmwvWUhabEZtZVMzTXRjRzhoS3QvUWVpcTJ4SVJY?=
 =?utf-8?B?VUxhQkxIUFNlckd5UWZpb2Nmczlmc2lwby9XN0RVd2lmcXJmTTltZWtaM1cy?=
 =?utf-8?B?cHJNK29RbVRjTEJLTUNqQ1JlaWlseU5uQ09Ma2Q5bEJ0SWJ0RlBIb2NJUHNN?=
 =?utf-8?B?UmErejlpRERRKy9qaG1xRDBFTDI0VnQ2VllsQllIazhmK1hQbUIyQjlsOE8r?=
 =?utf-8?B?VEVaVlYwRmdsLzdRM1FMcXpUVGtrNDZqbm41cHM3VXYramwxVmhqN215Snov?=
 =?utf-8?B?cjNMTFB6S1RSQTRsV1U5emF2UkU4Y1RRRkJtVTVqclNNdVYyR204SGFvaTRp?=
 =?utf-8?B?QlFpV2s4VEJPZnVsc1ZyQzlueVJlTnNpTXZDaDJoZWYxYXV1eTNmOTJWZUw2?=
 =?utf-8?B?c095b1lEWXAyV3lOcTBEZEcwbG9KbUtuSCtCanJVWEJPVUVGSG43bzlXUUc4?=
 =?utf-8?B?ZzdvUlNjRFlFb1ZQd2tOR3ZxdUF4MEJXejY0allxejNkUkFoTW5UUnBUSHJ1?=
 =?utf-8?B?NEV5akE3RWFWRk9GQTEzcXNabG5aQjNWajdac1JOWi8xTEc0Q0tpbWErWWVh?=
 =?utf-8?B?ekM2MU5qMDBvUldUbUhZWXFRVGxWTmtIMVlDTGxKT3JYU3hCMDA2ZVdPYVJj?=
 =?utf-8?B?b0JjNVEvdU02dHhaa25qQzJWVDh0UTB1TjFBb3pra1NTNXd2V3dQcWNVcEVY?=
 =?utf-8?B?SE5ZNEZWOHZUVnNXYmpiM3J1cGI5YlVqY3dWM0J6dGcxdDk5cEMxaVc1T2d5?=
 =?utf-8?B?Y0pGeWpTank2aUVLSmwwOXVUZFpCTmwya2dEcFRVKzFMb2M2OWtkM1hOQkFN?=
 =?utf-8?B?TUxMUUQ4WWQ4T05VcG5ZVFVwUkw4aWVHMERwd3BqWHkvWUNVdDc5Qk56OTZM?=
 =?utf-8?B?cXVYay9FcklZcktURjF3L2Q1NCtHU0VUdlFTc3JMalBlVGxhR0dmOWRwSndY?=
 =?utf-8?B?T3RFM09TRzVQQkthZTZjTU9LL1pONW85eTFxTUFWL3V3UGNpSWtOSktGKzh1?=
 =?utf-8?B?L2hFMmp2RkVvbFBLdERaU3doa1VMdk1nUGhzaEwva2lzR0hpeE0xK0VRVkdv?=
 =?utf-8?B?Z0dPREdqbk1pdFVzNG5GMk9pc043M3pWTkFVOWYwWlZCRW5sTjU1RWVVYnZ4?=
 =?utf-8?B?Z05taFBxcWRibVJNNDZ2RE1kaHE5cXRkcWl1b2xndDZuUlVMdVhIOXA1RTRR?=
 =?utf-8?B?b3I4VzVKMUwwRHNMd0c4VUxQR3hkRVFRT3ZqWlNaRHdpNDQzSkJQWWFtaWYw?=
 =?utf-8?B?WlN4dGp5NGlDNHowbmwxL0lwRnJGUlVKaFp3Umh4NjBiWHc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MG9FbFBMcHlablE5RSs3Sy9pcklwZXREeTZYTG1xQTZrS2sxYkVEY0xtV1VT?=
 =?utf-8?B?NUZoN0dCazU3SnAzZW5qZEVYYm1WRXRTcjB4VjJPTnloVXJDZkp1ai8reC9n?=
 =?utf-8?B?QnRybWF0dWwxdDgwWGZHWjdHWUd1bVY5VGhDTDlOMzNtY2JGaldGMlhDSW5I?=
 =?utf-8?B?UHppNWkzTkV1aGw0RzUwWVZHd2FmYStCbFZFSnZscStqOGpkdmYvVE85VE9h?=
 =?utf-8?B?NWZNaURPR1RQOUJoMFpmOFVLL2JFWVFCMm5KUVRrY3B6UUZiTGNJaDlDZlIy?=
 =?utf-8?B?T1lqenpTTC9xMkUzdnZyWlFhdFg4MVhCOTdVREdocjRlQnZaczJCQnRNREla?=
 =?utf-8?B?Z0FCaTlJNlJBOUNkb2dtMzh0M2lObWRybkRKR1hEc1JvNTRLM1hDdkV1cjVK?=
 =?utf-8?B?UmJrMW5PU1lDY0dicG9wTklpZWhSQnlKM2RORlBvU1dwYW90WFpFb2lWUXND?=
 =?utf-8?B?TjJhUStOY2lFaTA1UGFsVWZMVFJodG9NaU96UjBlZHFDempNYlpLWlpMb0JR?=
 =?utf-8?B?SXpLS1Iya05LZlRRejNWNzJBWERVdk44QTNiWFc0Y0ZTU2JGSXlCelNaMHFT?=
 =?utf-8?B?YUFCZVJtbVFqaWt1R1RMc3FIUS9JTW5MaDlMSmw5V05hSnY1Z2xZQnEvaE5R?=
 =?utf-8?B?MzZ2TFlKOFNGRGVhcEpXcHV5NzlRSjBOYktybkdab3I0V0FMRXZwdTdsT2hL?=
 =?utf-8?B?aEFwS0YxeFFzd25sTkt0RlB6WENNZnl6Q0JZVTl1RVhvQmwxNHpNbSsrb2NO?=
 =?utf-8?B?WEN6M2xSZzA0R0F5NEo1VjAyZkJteVluanJoSUxlTUdzYXRmWVc4eXdsUURN?=
 =?utf-8?B?TEI1bkdsWFk2a0VWY1krNzZHeVZoMktLLzdwdTE0TFl4RFRmb3B0eXl5Qmd6?=
 =?utf-8?B?V2ZPYVBFV3hnamQzeVVvRXJRZmJzVkI2elRjVWh5aEdLdDBXOUZDZzE5ck1X?=
 =?utf-8?B?bS9EUUtYRlVkdStETFE3NzdVbFBCS3NZdUx2T2QxeGpDejVhZnFSZ0ExYWdM?=
 =?utf-8?B?ejJhNEJPbS9mWUJ2L1RhQTBuL2p2N0dyckhSZkFzdm1BMnNUZkJVbzR5S1cx?=
 =?utf-8?B?UlgxcXMxS0N3SVFLQ25XTk1McDh0MkVEQzRrdEVPaHU5bnBIWDM3RXRXZ2I4?=
 =?utf-8?B?WXJsNWhWVERYSWR6T0RWaTUyUGZ4SlBST3hYdmZPby9pZzBJcWt5Z0krRGli?=
 =?utf-8?B?bnl6bGNaSTB5a2d6T3Fsc1MvaFYyUWNXeGpYcXVSenpNRVg5WG5FVTkxTXJl?=
 =?utf-8?B?NXB2YkxqQ2x4YU1TU3ErQkFiS2crTTJETWVneDJTd2lHcjFjZVB3dkYyL016?=
 =?utf-8?B?R3RTbG9JemZDa1ozYWlNZTJRUlVMYitYVGg0djJBdllqb21xMXpXQ3RmQnFh?=
 =?utf-8?B?TGxmcGFDZ3VLZ0JXWVlRYXpTd2ZhK1NZUzB0eEttc2xFU3BvM1Z2WnRDQVEx?=
 =?utf-8?B?dHdwVThTZE1EWWtqOWJqL2ZsZGRJOE1KcUY0RkdZV29YaEpodkhoTGNLb0Fo?=
 =?utf-8?B?V25LVVJEVXJsZzZYZ3ZwbXRJWW9TVHBvbXBpMldZSGQyNW9XMU1NT2hlZ1Vh?=
 =?utf-8?B?UTErVG1Ca0JGRzZlb3dQYVFJNk1xM3NrczlqbVUvZzhsTjlQVFdKc2U1VnFr?=
 =?utf-8?B?SytiUnd2R2VlN0N1a2ZpV0FPSWlZY0NJeHdWQjlPSzhXNVYxcFlHSEcyNHh5?=
 =?utf-8?B?dU1GVHdnblhzaUgzSCtZVklxVEpiK2UzWmNxeGg1RzZ0MnFudCtMQ2orbGtK?=
 =?utf-8?B?d2t2VFZvVFpvTDVwTFJBaDJ6WnBPZWRWKzdaakhRNG8zYlpCZXN2Y1RSVStp?=
 =?utf-8?B?M2VuWGdxZklYdE50Q2pCNlo3dVVrK0oxVTdidVZZb2Y1UUYrWFdrVGVpcWZm?=
 =?utf-8?B?bEhrQzNBWWlnbHczcDYycUxjTDdBaDNWWW1zNE5PZlJIVEdNUHUxcThtMzI1?=
 =?utf-8?B?d1VmaTJNR09wQjdBSTRFMnZpM0JycEtRYXdtczBqcFZZSlZLR0lvdko4cWpZ?=
 =?utf-8?B?VjJqQ2ozNGZKZXJYZEtVdVVveDluZmQ5MWV0MUNLcWVBSUlLd0dDK21GRWxP?=
 =?utf-8?B?c1dyS1F0Q0RiQzlYUGlxR29xQmt5SGY2TmFxWlJ3aWNZN28zcUlBM3Q0MVlF?=
 =?utf-8?B?M1ZJK1N0K2JEalFzZzhXazJqVmNQRjI4dlczSjQvbFhLQzFtUEljWkUvU2Q0?=
 =?utf-8?B?Q3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e33d676d-f94e-4c13-2a66-08dca18b8d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 09:26:32.1787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIkuL4pLqAYmZGh+h3IgfDKSZ/TeTpUClRUovGqB7gogMnCEU3U44KGMF6JJ8ljLJ+wgx26Apcrx6/HkdZV75sUHfa0wqsVcqwYr2u8e9pdc0ZJm4TtTKrba3NdHYYi3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10918

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIEp1bHkgMTEsIDIwMjQgNTozNiBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0KPiBP
biBUaHUsIEp1bCAxMSwgMjAyNCBhdCAxMDoyOeKAr0FNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4sIFNlbnQ6IFdlZG5lc2RheSwgSnVseSAxMCwgMjAyNCAxMDoxMSBQTQ0K
PiA+ID4gQ3VycmVudGx5LCBhbG1vc3QgYWxsIFBMTHMgb24gUi1DYXIgR2VuNCBTb0NzIGFyZSBt
b2RlbGxlZCBhcyBmaXhlZA0KPiA+ID4gZGl2aWRlciBjbG9ja3MsIGJhc2VkIG9uIHRoZSBzdGF0
ZSBvZiB0aGUgbW9kZSBwaW5zLiAgVGhlIG9ubHkgZXhjZXB0aW9uDQo+ID4gPiBpcyBQTEwyIG9u
IFItQ2FyIFY0SCwgd2hpY2ggdXNlcyBhIGN1c3RvbSBjbG9jayBkcml2ZXIgdG8gc3VwcG9ydCBI
aWdoDQo+ID4gPiBQZXJmb3JtYW5jZSBtb2RlIG9uIHRoZSBDb3J0ZXgtQTc2IENQVSBjb3Jlcy4N
Cj4gPiA+DQo+ID4gPiBIb3dldmVyLCB0aGUgYm9vdCBsb2FkZXIgc3RhY2sgbWF5IGhhdmUgY2hh
bmdlZCB0aGUgYWN0dWFsIFBMTA0KPiA+ID4gY29uZmlndXJhdGlvbiBmcm9tIHRoZSBkZWZhdWx0
LCBsZWFkaW5nIHRvIGluY29ycmVjdCBjbG9jayBmcmVxdWVuY2llcy4NCj4gPiA+IEEgdHlwaWNh
bCBzeW1wdG9uIGlzIGEgQ1BVIGNvcmUgcnVubmluZyBtdWNoIHNsb3dlciB0aGFuIHJlcG9ydGVk
IGJ5DQo+ID4gPiBMaW51eC4NCj4gPiA+DQo+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBlbmhhbmNl
cyBQTEwgc3VwcG9ydCBvbiBSLUNhciBHZW40IHN1cHBvcnQgYnkNCj4gPiA+IG9idGFpbmluZyB0
aGUgYWN0dWFsIFBMTCBjb25maWd1cmF0aW9uIGZyb20gdGhlIGhhcmR3YXJlLiAgQXMgdGhlc2Ug
UExMcw0KPiA+ID4gY2FuIGJlIGNvbmZpZ3VyZWQgZm9yIGZyYWN0aW9uYWwgbXVsdGlwbGljYXRp
b24sIGFuIG9sZCBwYXRjaCB0byBhZGQNCj4gPiA+IHN1cHBvcnQgZnJhY3Rpb25hbCBtdWx0aXBs
aWNhdGlvbiBpcyByZXZpdmVkLCB0b28uICBPZiBjb3Vyc2Ugc29tZQ0KPiA+ID4gY2xlYW51cHMg
YXJlIGluY2x1ZGVkLCB0b28uDQo+ID4NCj4gPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaGVzISBJ
IHJldmlld2VkIGFsbCBwYXRjaGVzIGFuZCBpdCBzZWVtcyBnb29kLg0KPiA+ICMgSSBzZW50IGEg
bml0IGNvbW1lbnQgb24gdGhlIHBhdGNoIDQvMTQgdGhvdWdoLg0KPiA+DQo+ID4gU28sDQo+ID4N
Cj4gPiBSZXZpZXdlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVo
QHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmsgeW91IQ0KPiANCj4gPiA+IE5vdGUgdGhhdCBzdHJ1
Y3QgcmNhcl9nZW40X2NwZ19wbGxfY29uZmlnIHN0aWxsIGNvbnRhaW5zIHRoZSBkZWZhdWx0DQo+
ID4gPiBtdWx0aXBsaWVycyBhbmQgZGl2aWRlcnMgZm9yIFBMTDEvMi8zLzQvNiwgd2hpbGUgdGhl
eSBhcmUgbm8gbG9uZ2VyDQo+ID4gPiB1c2VkLiBQcm9iYWJseSB0aGV5IHNob3VsZCBiZSByZW1v
dmVkLCB0b28uICBPciBkbyB5b3UgdGhpbmsgd2Ugc2hvdWxkDQo+ID4gPiByZXRhaW4gdGhlbSBm
b3IgZG9jdW1lbnRhdGlvbiBwdXJwb3Nlcz4NCj4gPg0KPiA+IEkgdGhpbmsgdGhhdCByZXRhaW5p
bmcgdGhlbSBpcyBnb29kIGZvciB0aGUgZG9jdW1lbnRhdGlvbiBwdXJwb3Nlcy4NCj4gDQo+IEFu
b3RoZXIgb3B0aW9uIGlzIHRvIHJlbW92ZSB0aGUgbWVtYmVycywgYnV0IGtlZXAgdGhlIHZhbHVl
cw0KPiBpbiB0aGUgY29tbWVudHMgYWJvdmUgdGhlIFNvQy1zcGVjaWZpYyBpbnN0YW5jZXMuDQoN
Ckl0IHNvdW5kcyBnb29kIHRvIG1lLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9k
YQ0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=


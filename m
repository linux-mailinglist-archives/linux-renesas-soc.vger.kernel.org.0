Return-Path: <linux-renesas-soc+bounces-27905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJp3GrR9g2mHnwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 18:11:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7740EEADE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 18:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EA7F3004236
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 17:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EED4340298;
	Wed,  4 Feb 2026 17:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CWGxwq95"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070C2319615;
	Wed,  4 Feb 2026 17:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770225072; cv=fail; b=IaTY+MyPcqGh7L1ymaIWFDGKXRpqgkKEFDN47+5Fp/h4VBlCApXpv7qLbocEHmnJR6jpTOF/RPOfQyoMh8kql72omK0sdpQBMpLa0iIi6YaXl8xu/E9wpnrBG+VuVqVNqdS1uiBT+Ve6GdkaAdpCRfXWKvFoFjajSWU2gp3ajxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770225072; c=relaxed/simple;
	bh=JNwkpYwwpyTOMvdH7p2A4VWPlWFB4ITxInjymWYJkCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QT/D8VWVqbOFPYC4h8jBpmh0px4/eTKEUPOLZlFs3wzQQmguf4x1aktQT46VdFo9wvWP1wmi77LSmcP35/4XSvV+p7bYmXCbNhY2BuaPty45g4Px5GWEEYM1hOQ/ZdTErQ+vaf2dq9xupZE8mOgQa7caWUSR57jmv2oyhlaPSdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CWGxwq95; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYa404TKMCA8o3845B2v5CKAf+BspSyY9qgd6vt5OP62ZuIMRKTNdxeRF9eJTS+xTUBKmC/GvsjNsmYK0YObPJbpQfluMc/zus+3LhwI4KJPdgRgD1FYuXFPUlrIoM45vaZyxFy6oIoHiahN0s8SxXyC/wGYrK0glRtXu9/77aCMkwLZrmyOOfCA5uXFdjferj4e5POAOQ1lqQMENfwQCJ3UEqZ0fxQEO3LCY/yhGbss4IJgq4ah9Gj8V/+y4UvZpvTrnUUdvHMjJjFLCTLyh/K7DOQe5wEwxlPk5Ph9cXlQXYJExRVU8zAHMT+nimrbgCGOvPqdhZ4Y2zQOntasug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNwkpYwwpyTOMvdH7p2A4VWPlWFB4ITxInjymWYJkCg=;
 b=BnWrCFHBmj+4MVumdrATKSM5iSnNiVOmhg7LaNL4ayr/rJOQln4j46kw7EOi0bNaUVyVFysHXlC0Htqr5Y84GR1O5M1xmPzYWwhMXMAnMDAijjPhqzjpS2UpmdDfZQToi6EGRTlG4rJvFML/oo56TFeQ43Oqrk1YqOd+fbGRjllCPCJ3Z4s6b5cg/sw/GuQqGPcesqsKQW8OVIvWNLYP940mIacpwxsMxhrpyRDx5uwaA8BufG6uheIBo0ugkNJaG0eYi77gzioMq1KHvsu3cdS/mlm42vDAzDi55F2M9CJMud76O+7WHaiy3NR+mVZmPPWrAVcCHPKUPlgH+JXk0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNwkpYwwpyTOMvdH7p2A4VWPlWFB4ITxInjymWYJkCg=;
 b=CWGxwq95ydu0sRV2c9BXlHc6N8/TcEa/luK+L+JrQYqD0xbE8Gl5FN8NGFlCH+EQX5BSJKJ/rfTMs5JAgLmPxPeKduU2OWkJCupn5V87D7H62FD5Z1r4oAKRxHt8zK4fGez7CNMexdfOr+bZ5CFceNz4MjYCOpp71w4aamGAf5Q=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB15639.jpnprd01.prod.outlook.com (2603:1096:604:3bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 17:11:06 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 17:11:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: RE: [PATCH 1/8] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Thread-Topic: [PATCH 1/8] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Thread-Index: AQHcleHVhKVd/CaNL0eJZXLRtNmxN7VyqEcAgAAd6NA=
Date: Wed, 4 Feb 2026 17:11:06 +0000
Message-ID:
 <TYCPR01MB11332433AEC60539CE48CFDEE8698A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260204142320.103184-1-biju.das.jz@bp.renesas.com>
 <20260204142320.103184-2-biju.das.jz@bp.renesas.com>
 <177021852663.2044780.8530228995216202645.robh@kernel.org>
In-Reply-To: <177021852663.2044780.8530228995216202645.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB15639:EE_
x-ms-office365-filtering-correlation-id: fcb0f1c8-533a-40d0-4087-08de64106265
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVQxMDRSKzR3Rk43Q25abHR6T1VUK2ROS28vT2piME9SUWp3VjYvRG05K0JW?=
 =?utf-8?B?UWlUVjBCa1BVVVJwOGo5ajdaSERtdnRCU2kwZDQ5R1dTaUdZMVhwRExYbkd4?=
 =?utf-8?B?bVF3VVNteTA4VGdxYXJDS3Ezd0pwM1VMRUlMZ1ZNOXFUWjhXcE9mU0RNUE04?=
 =?utf-8?B?YUs5SG1XV3FqczZGM1lhdFBsczN1Z25Ya1lCU1NtSDlDakJWMTNrVm1Tdjh3?=
 =?utf-8?B?azVvS2dveUd5VjdyV0NRcnZHWFNpSXFsUDMwRSt6TkljVzhZd09ibXhzTU5s?=
 =?utf-8?B?NkV5MEtoNm9Bcnc2SUorZENBR0lGd09TcEJUaElpQUdUbEtPa0l5TEdMdVZH?=
 =?utf-8?B?Y3NLTFZQREpvcW5kZXhORVVXMDhhNkxqZ1RkVkx0aytJSmMzemc4Y2ZGSjdK?=
 =?utf-8?B?blZOSjRzWmlxL3dFMzlkUXltWE5rSVlBYll2Y3psYzIzVWs2VlpaYXBPeEs0?=
 =?utf-8?B?NU4wTS85aEtibjkxZ3cwZWJhSGFmenFpeXlyaEw2MW1ybXRsbVdIUUh6VERD?=
 =?utf-8?B?QUNOVklmTVQwcSs0LzMxUzM4aUtFeHRjbFR0NUR2b3lTbWRWc0VWenV0eHZK?=
 =?utf-8?B?dzFMd0taQlhBZHlDWUpLV2wzQ2NCTXY5Ri93aWhYdDUzZkR6dE83OFQ4OXBZ?=
 =?utf-8?B?ekNzTStEOHBRNWtMMTVlREpRSElEMllXSDcwZlZZeXVwckJUUm1xRHpHcFhT?=
 =?utf-8?B?OStqYzhxZ2NyN0w3RTN4bTdZbWNJaDdpZVhFWnE3UDFSZ2hmUllmSm9FVUZw?=
 =?utf-8?B?WDQyVGN0NnFpY29la1hJZ3FYcmxKYlpkV2kyNUV6MlpiYTdFUmIxM2cwNTY2?=
 =?utf-8?B?cjNMNHpjVExFQjZ5azJudmdSS1NjekNZZlJVclhodDZsS0E2MGJDaWlPSnI5?=
 =?utf-8?B?bStCWWxWYisrbWNDei9SbGh3Zy8yQzlJbE1YbjhmL0FYcEovZWZEQmc4QWhS?=
 =?utf-8?B?eFBKOTJqeFNqZmszNGJOTVgzWlY0Wk5IRGlPS25COEJyQ2hPbXNvZmJMWEth?=
 =?utf-8?B?YjhhTXloa0VFUHpkUFBSZEt6OXJhS1dQSHVUeCtYRjJqQ000R2hLYkNwUDgr?=
 =?utf-8?B?cStUOFpnWXdiUWhZNHgwdHE0bElnN2g4cWdPUEVCYS9vbXFFUk03MjV6OU5I?=
 =?utf-8?B?Y1J0eUJ4MXpXR1JMcHQveWhPRlphZXp6anNzOSszWXZkbmhYVmk1N0FSZVhJ?=
 =?utf-8?B?VjF6UWRDNDV2VnF5QlhkbGxZc05kZzBWTElJNGZTUEVmd040ZVNJNmZwT005?=
 =?utf-8?B?Q3loaUlPUUZUNmY0R0ZqajFKWUlXWUMvcTdkVHBvZGI4bDdGL1Y1N2pScWE3?=
 =?utf-8?B?MVJmOWdLS1FNay93Wnp4c0JkRE5tTkdOU3FoRWx4NjhhWEdMOTdpY2Z0bUky?=
 =?utf-8?B?cDJISXRpVTdKR25nSGV6YkplK3F5Ty95LzJydUpXSHJ3Z1Fyd1J6SnRNZ1JS?=
 =?utf-8?B?ZTBOeVJBUEg4K09EN2FGNGNIelM0U2ZBNCtCTithWkx1MFRKWTFxY2FGZzBY?=
 =?utf-8?B?dURmYTN2RW5VRktySUpjaVNIMk1kMnNOZ2U5eURyL1JUTS9CL21rUGxTMEZn?=
 =?utf-8?B?TXdhSStjd2tuSSs3V0VrbXFNUkZROUVRa3Q2RFl3c1NkdjJFNVlJSzFrNXVL?=
 =?utf-8?B?SWMwK1pSa3pLaUtyeXFxSU9QcjVOU0QvZkhPZEtKUWhPV0FHM3l3dVd0L0xm?=
 =?utf-8?B?dnVhU1ZuSlZnNjlkcjhkTW1zK01UTmVGMmhmUUk5endQWk9XNzdqaUpHaDFk?=
 =?utf-8?B?NnJVU2FNQUl0cG5GT2x2cVBwVXB5cFBTQngvNVZBYkVxc2JPck5sZElKWUFE?=
 =?utf-8?B?Nm1PVUFWRGR0YloxNlFvWWlRQUlDQkRIUkgvRjU1dmZjeDE3WVlrdklzY0E0?=
 =?utf-8?B?WkxWNld2bWJQVE55OHlZam8zeXh1ZnprMjMxcHdjTnRnUElpRGp2V2lPY1lB?=
 =?utf-8?B?c3llR3V0b1JvUGFGT1BFTGJwTnFsSGtrcFVOWjBoM3NrbUFpdnduMk5EOGFD?=
 =?utf-8?B?MjBxbFpmVXZDaXVxU2lBeS85NWIwVUo4cDF3R2NIeUtPYkp1TVlQNUFBZjVz?=
 =?utf-8?B?aS9kcWNrVlprUWVwR3VWeDRsQkJPUkhMSENvV0k4VFhyRnNoaG1TaHlSYmpY?=
 =?utf-8?B?NktpR0wvQStFZjh6RURBek9zWVZkZWYzRXFEWVlkbUlyY1F6T1B3NkFuRk9U?=
 =?utf-8?Q?DW+9nP7XW+Vh1G3iIbNPrYI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkkrVEpHaUVaellaTUdJSTdEN2huTjV2VUFBSldFaDg0aTBBbHpLdjF6bE5Z?=
 =?utf-8?B?UWZCdlJBbHJaYndVNk1vbmVGanBzVEFIWGo4NnJWZHFPZGpGcGk0WTU3dGJG?=
 =?utf-8?B?QkxTR3hIZkVwYVV0dEJUcW5vYkcvRmJUZDcrb2pmNVdCa1dkWmUxTkw3Wk9v?=
 =?utf-8?B?V2xQcHBCSTkvREhmYnQvN0JvM05rZWVlTGZ5ZmczcFhDYktoa1lLY2ZUVUFx?=
 =?utf-8?B?eTlrRFA2dlliL0xmR2JoVEdMeHIyWXdMbFNwR2ZMR1BEbDdQQ3ZMNGtwek1r?=
 =?utf-8?B?c3Z0azQ5Y2lld2VzS3FVdmxRc1E5UE9lZjNNRERMK3Q0eGRjckxBSDFLZkVU?=
 =?utf-8?B?S21GNUZvQlVTNmk0QkxrZHVwTGU0bUh3ZTJya0U5WGdzRkUzYkxqU2J4MCtY?=
 =?utf-8?B?VTBCR0w0ZTVWVVllcHNzRGllR3ZheDJ1OU5LcWszRW5XNlIzQytTUCsvWmlH?=
 =?utf-8?B?NC95T2NVbjFxQXRJbU81SzFjQUFTa1J5bU42OWlWaGZjeHI1NHN2WVNuOFpG?=
 =?utf-8?B?OVVYOFFYb3ZHWllFaEYxcUJGYmMwNmlTc2s3aEFVaHljS3FXRndnUk5yYUVL?=
 =?utf-8?B?NFlCY1ZhL0FqUERFdFdlbThHM05TWjVVRU5KVTBiQWpBMzBLRUMwS256SVdt?=
 =?utf-8?B?U0xFcGFFa2VoU3ZkNGliRWZGUHluY3ZXVEU1TmUvUVVRNnhvMkM5VkJGckxw?=
 =?utf-8?B?UTk5azJnUEkrTXptYXFKQmlweFRRVzloS3RPOUhoby9XWStvZDBqWWVTanBr?=
 =?utf-8?B?ZzBuVi80T05SUXBBTnB2MDB4cUs2Y3VHQnJZWVdUNWNXWkFiaTVZRDlOQTE0?=
 =?utf-8?B?NDhiSkl5WGM4MDZOOU9KY1BWNlAxOVdiY0ZnMGM3Y1NFenNsNVJwNUNKdEtV?=
 =?utf-8?B?aDc2Ni93MUoxOTYvZDg4M3JnWitkRWpQVDlaUTNjZWo4NlI2eUMycUVlYjY2?=
 =?utf-8?B?bXIwRkRPeE5ub1BtUU5OSGpUOTJuek9HYVpCMkhzZjRvTEVtbGtpc3QwVytU?=
 =?utf-8?B?NnNQdEJFVGZOVnZZb2N3YmlPWTQ0ZENKYjRhSytOUDB2YlBGaDQ2RU16VWpU?=
 =?utf-8?B?SSt6ejE2M0Nta3I4Q2xMTitrOHdMTzJKaCtLRGNzV2dxRE93cE1XaVNxSkZW?=
 =?utf-8?B?UTlPN2NlelJONTRRaEt5VkVXMS9PTkI2SW9YbWpVdU00V3gvSEZvYUkxbHdQ?=
 =?utf-8?B?eWF1VE53R3M1UmFTQ0NDZ1dqWVVqTm15SGMyUCtBSDF4dDQzWjNrejF3LzZw?=
 =?utf-8?B?WFBWWWxjQmRaRG5lSzJ6YVpOcStVeldFSTBJY0Z6SzFBNllSaGhKQ1Vvb0kv?=
 =?utf-8?B?eHZEZGo1TitvTktJKzNpQjdCaW5NQ012NldjSnZ1WGg2K3Z2UXJoUkJTVW1m?=
 =?utf-8?B?SXJtMklUR3NTVExlS2VvRWJkSENQN1U1MDRLVTY1NzhkNmNabEhSaENFTjdu?=
 =?utf-8?B?dEVCZzF5Q1hmY0VjcVcwc1NaNUg1dk56Y3Z4MG0yVVcxYWpoeS9ianVuUGYw?=
 =?utf-8?B?MUdhZytTYTlCRDZDRTZKTCtDSVp4QmkxZDZBUENFbjM1YmxUQks4emFaa3Rx?=
 =?utf-8?B?UzhzNnlKeGRXdE9GQk1CRGdrdnRGZVBuQmlsb01hSm5rUDIvQkFtUjNpWDE2?=
 =?utf-8?B?cjA1enBFSjdvUGpzM003c1Exem1yQkJza2dnTU90N1hLelovbDdzUHpvc0Zs?=
 =?utf-8?B?Sy8yWXcxVUFUWENZM0d1TW9yN3NLcWNEbW0yMng5N0s5amRLYWkyaFRqNnhM?=
 =?utf-8?B?Nmd2NnBRVFBiV1laRlVMNm9aNnNCRTIzbEZ6RUxLSkxLVDNQeExudklFc0c5?=
 =?utf-8?B?dUlkUm9sc1VlbSswd3BqUmM0bXpMZE1hQWt0VXVvZlRXZ1dFbFZaSk80NTN3?=
 =?utf-8?B?M2kxV0IyaXZoUjh5SElFUlZzTDFLS1JqRWdzbWpxRmRwdktRY0VYWmh4MTMz?=
 =?utf-8?B?elFNbWRnZGhNNmMxTHNlc2hMT1V5MU9YTndFTWQrTHM3R3IrQmxoWTY0d0Vw?=
 =?utf-8?B?YllQMzRNT01odDhwZHVXQ2dYQURjQ0RPU282K0VmbnRJa0cyU2dJaUpRMzdV?=
 =?utf-8?B?QUU4YVFBbDhYdmFJRFNQKzUyUjNLakNFMkp3algvQWQ3UUNrWXhvN3hHY2pE?=
 =?utf-8?B?TjZsNllESk42bmdjSUpJQzBUSDR2TlRFUmRxSnkyaGhzdlhqbWI0a1NDdWYy?=
 =?utf-8?B?TDdmQTFTd0NVa0VXN2FyNDI0SFF0LzRvUldvYWhFMGJaY3Nnc0JQeHVGYXVw?=
 =?utf-8?B?WE00QUNObHhxKzNhQVFhT043RDh6MVZZb0tlQ3FKQVBsY05qcG9vcjhFZnEr?=
 =?utf-8?B?c0NVTTlURE1pRlJVSlRnNnhwRit2OGMwOHBySStoZFhidWllVHNTUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb0f1c8-533a-40d0-4087-08de64106265
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 17:11:06.6124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r15ydsknTdS3jp+XdokNAAhhX9Y1EULHRL40Ah0ZAU7lIOAs+eaZpFaKnzboV+rZQI/W5CcFHVYf5V7bj1OHRcb1ag4BvIS19568Jvl8Gk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15639
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27905-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,vger.kernel.org,gmail.com,bp.renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 7740EEADE4
X-Rspamd-Action: no action

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPg0K
PiBTZW50OiAwNCBGZWJydWFyeSAyMDI2IDE1OjIyDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS84
XSBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IHJlbmVzYXMscnpnMmwtaXJxYzog
RG9jdW1lbnQgUlovRzNMIFNvQw0KPiANCj4gDQo+IE9uIFdlZCwgMDQgRmViIDIwMjYgMTQ6MjM6
MDkgKzAwMDAsIEJpanUgd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gRG9jdW1lbnQgUlovRzNMIChSOUEwOEcwNDYpIElSUUMg
YmluZGluZ3MuIFRoZSBJUlFDIGJsb2NrIG9uIFJaL0czTA0KPiA+IFNvQyBpcyBhbG1vc3QgaWRl
bnRpY2FsIHRvIG9uZSBmb3VuZCBvbiB0aGUgUlovRzNTIFNvQyB3aXRoIHRoZQ0KPiA+IGRpZmZl
cmVuY2UgbGlrZSBpdCBzdXBwb3J0IG1vcmUgRXh0ZXJuYWwgSVJRcywgR1BUIEVycm9yIEludGVy
cnVwdHMNCj4gPiBhbmQgYWxzbyBoYXMgYWRkaXRpb25hbCByZWdpc3RlcnMgZm9yIEdQVC9NVFUg
SVJRIHNlbGVjdGlvbiwgc2hhcmVkDQo+ID4gSVJRIHNlbGVjdGlvbiBiZXR3ZWVuIGV4dGVybmFs
IElSUSBhbmQgVElOVC4gSGVuY2UgbmV3IGdlbmVyaWMNCj4gPiBjb21wYXRpYmxlIHN0cmluZyAi
cmVuZXNhcyxyOWEwOGcwNDYtaXJxYyIgaXMgYWRkZWQgZm9yIFJaL0czTCBTb0MuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
ID4gLS0tDQo+ID4gIC4uLi9yZW5lc2FzLHJ6ZzJsLWlycWMueWFtbCAgICAgICAgICAgICAgICAg
ICB8IDY2ICsrKysrKysrKysrKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMg
cnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KPiANCj4geWFt
bGxpbnQgd2FybmluZ3MvZXJyb3JzOg0KPiANCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9y
czoNCj4gL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LQ0KPiBjb250cm9sbGVyL3JlbmVzYXMscnpn
MmwtaXJxYy5leGFtcGxlLmR0YjogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTEwYTAwMDAgKHJlbmVz
YXMscjlhMDdnMDQ0LWlycWMpOg0KPiBpbnRlcnJ1cHQtbmFtZXM6OTogJ2lycTgnIHdhcyBleHBl
Y3RlZA0KPiAJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9p
bnRlcnJ1cHQtY29udHJvbGxlci9yZW5lc2FzLHJ6ZzJsLWlycWMueWFtbA0KPiAvYnVpbGRzL3Jv
YmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9pbnRlcnJ1cHQtDQo+IGNvbnRyb2xsZXIvcmVuZXNhcyxyemcybC1pcnFjLmV4YW1wbGUu
ZHRiOiBpbnRlcnJ1cHQtY29udHJvbGxlckAxMTBhMDAwMCAocmVuZXNhcyxyOWEwN2cwNDQtaXJx
Yyk6DQo+IGludGVycnVwdC1uYW1lczoxMDogJ2lycTknIHdhcyBleHBlY3RlZA0KDQpJIHdpbGwg
Y2hhbmdlIGl0IHRvIHBhdHRlcm4gZm9yIGZpeGluZyB0aGVzZSBlcnJvcnMNCg0KICAgaW50ZXJy
dXB0LW5hbWVzOg0KICAgICBtaW5JdGVtczogNDUNCisgICAgbWF4SXRlbXM6IDYxDQorICAgICAg
b25lT2Y6DQorICAgICAgICAtIGRlc2NyaXB0aW9uOiBOTUkgaW50ZXJydXB0DQorICAgICAgICAg
IGNvbnN0OiBubWkNCisgICAgICAgIC0gZGVzY3JpcHRpb246IEV4dGVybmFsIElSUSBpbnRlcnJ1
cHQNCisgICAgICAgICAgcGF0dGVybjogJ15pcnEoWzAtOV18MVswLTVdKSQnDQorICAgICAgICAt
IGRlc2NyaXB0aW9uOiBHUElPIGludGVycnVwdA0KKyAgICAgICAgICBwYXR0ZXJuOiAnXnRpbnQo
WzAtOV18MVswLTldfDJbMC05XXwzWzAtMV0pJCcNCisgICAgICAgIC0gZGVzY3JpcHRpb246IEJ1
cyBlcnJvciBpbnRlcnJ1cHQNCisgICAgICAgICAgY29uc3Q6IGJ1cy1lcnINCisgICAgICAgIC0g
ZGVzY3JpcHRpb246IEVDQ1JBTTAgb3IgY29tYmluZWQgRUNDUkFNMC8xIDFiaXQgZXJyb3IgaW50
ZXJydXB0DQorICAgICAgICAgIGNvbnN0OiBlYzd0aWUxLTANCisgICAgICAgIC0gZGVzY3JpcHRp
b246IEVDQ1JBTTAgb3IgY29tYmluZWQgRUNDUkFNMC8xIDJiaXQgZXJyb3IgaW50ZXJydXB0DQor
ICAgICAgICAgIGNvbnN0OiBlYzd0aWUyLTANCisgICAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JB
TTAgb3IgY29tYmluZWQgRUNDUkFNMC8xIGVycm9yIG92ZXJmbG93IGludGVycnVwdA0KKyAgICAg
ICAgICBjb25zdDogZWM3dGlvdmYtMA0KKyAgICAgICAgLSBkZXNjcmlwdGlvbjogRUNDUkFNMSAx
Yml0IGVycm9yIGludGVycnVwdA0KKyAgICAgICAgICBjb25zdDogZWM3dGllMS0xDQorICAgICAg
ICAtIGRlc2NyaXB0aW9uOiBFQ0NSQU0xIDJiaXQgZXJyb3IgaW50ZXJydXB0DQorICAgICAgICAg
IGNvbnN0OiBlYzd0aWUyLTENCisgICAgICAgIC0gZGVzY3JpcHRpb246IEVDQ1JBTTEgZXJyb3Ig
b3ZlcmZsb3cgaW50ZXJydXB0DQorICAgICAgICAgIGNvbnN0OiBlYzd0aW92Zi0xDQorICAgICAg
ICAtIGRlc2NyaXB0aW9uOiBJbnRlZ3JhdGVkIEdQVCBFcnJvciBpbnRlcnJ1cHQNCisgICAgICAg
ICAgcGF0dGVybjogJ15vdmZ1bmZbMC03XSQnDQoNCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=


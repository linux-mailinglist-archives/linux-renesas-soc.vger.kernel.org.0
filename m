Return-Path: <linux-renesas-soc+bounces-32582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJpzFoeaBGqILwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 17:36:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D80CA536448
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 17:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCDC5308A5AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 15:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4993648BD31;
	Wed, 13 May 2026 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZVDA0saa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF0348A2C7;
	Wed, 13 May 2026 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686212; cv=fail; b=XHpNQHaGBYYCekJIWGblg7xEKFu7bsmC+RA+3aDpEpmG7ymAoOXZ2SBYzY3v0tHvpHXqYiTNNQFhf6j4n+fiG95W4wjdKFtsf9m5kTGJezdCchv0UDgwGmgrH5jikgq+y8Wc2tmPQZZ6zjmMRLDtun3yw0QLwwQ4ZNd7iTZyhoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686212; c=relaxed/simple;
	bh=MOQNV53J8xOg2NXLo/1GNydjWRjpLdRWAKSlGg3Ajno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VkVuXt+PzqcxUygBHDMiUPz9xMAUO+lgPAvaFJM3fMlRjde4VWWlqt5KWuVTthQiUqcqkJoBatLw4sUpUrQAJ3Ln07CTc0zJMfRKBRI38C4Z5YZPaSXfT2bks/d3MbNkdKHZ5aI00qZ3Cfcz/raakXWKdgL7sutWQGTJe2zQiaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZVDA0saa; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAY9sDWgiruUszxiSx8khyzZokcCNo/rtzXqwJGKXdbx+zRvMH5+JYK7dJQUo/msmU+x00Ax8S4xmXEIAtR/YAi/HJBFlnjKC99+j1oTwHoe98Pxb7zM12P/Yif+RX8318JHWBidovgs3H8YCQd7bAV4E04CCcgvOu8wMj64/61N2dsMo85hoPq9jhz3LodOAZBr93TnUADlsYeQh5NlTaDpfgy/PAgO6jKTEDqDVPwOQgKR3BjRZFy7EBSSlZjhh11tukZUPyWtZcggNWZG0d1ZcbIs6UMiDVpxJkT3b7770M4ae6P95PBdG2I+GeZndSWiHuWfculiqm/LpLUsNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOQNV53J8xOg2NXLo/1GNydjWRjpLdRWAKSlGg3Ajno=;
 b=XJ/hwUaruJIaBZ8foEfgibH5O61wb+AOR1waYiohyjiy3LeOAgoy2nt0m2/ZIO5UutAAlejc9S5KhSpUMXFveskZdtqGN5w/vxuvKyY1AxI0Ux67TtVF+iCeibv5Y+7Dr+bVyIpJtmLGOwIHOYxPU6jF8j1QT2YMJpACPKlZY2Dfhl3irkFsrueFMgHNGYm83UMtWOrhR8PLen5UPrQbp8Db/bYywyHGgLSS1fi5zA/APqVkuoK9tc2A6waAO1yONbhitZKD8YWSG1sYON+yN9zvRPLVZ3DhDh8cd1frs38qTNi0geLAYlkK4nLsIzuSBekFjUaZCUaCTgS+5oyuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOQNV53J8xOg2NXLo/1GNydjWRjpLdRWAKSlGg3Ajno=;
 b=ZVDA0saav5KjzEF24t1jMQD6KU4mi0rtq7viFb5HbYouROrKq5gkqxGNKdIM9qGtUXfyxPZR9Bn0+6uf3B1dZfnN+Mtp1YYF99vBm7CEu4LR8vzRq2QfW38iGv0h/RopMBSjPxwZwEgOrqqXyNbRokB7iguEA65Ckz03C3Rud/w=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB8880.jpnprd01.prod.outlook.com (2603:1096:604:15c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 15:30:06 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 15:30:06 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Thread-Topic: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Thread-Index: AQHc4j0oIH83bihPlEaJPgVZpBc2XbYLtPoAgABg6VA=
Date: Wed, 13 May 2026 15:30:06 +0000
Message-ID:
 <TY6PR01MB17377B80138CB0F0A13218764FF062@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
 <20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWx84+=UMB_zPgRgqAWWO4qmTkOkUEQLzhJ8UD4zLFx7Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWx84+=UMB_zPgRgqAWWO4qmTkOkUEQLzhJ8UD4zLFx7Q@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSZPR01MB8880:EE_
x-ms-office365-filtering-correlation-id: 924372b8-e71e-4741-4fff-08deb1048298
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|11063799003|3023799003|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 gog6ajYBb24EcQF2PA6OZPv+GBoCYEiJuP7UcnivshIOlYOJ69mHwDOxA68dCZg4fVxmpgQ33dHNo74inTQ7KrvlzFecoehG0toa0I7z3mZmuYX7ACZtzggLzlonvlPfQOzv524sun3c5+ZMx+WRK1M29uWfvGRbFY8Ua+VL07hSAHd06z+IB1m/wMt9z1yJOLmMGBSaQWLRCIb4xgSOvMHPU/OeBZUJRuDf+/G5Zd0lNXu1XuJk3kdu6hGpsFaiklMARnGIJh+LLUM7IH6UnHpJRg43IOyNK8yqcQdygMxshlc4kDQscDhDYGU3xvppX4A/ZkSWjkfWdZ9Ol20b2KyYL2KUoqC4Ftlz62KaoXvDQQGoDuJChMj8t2FXpwhfKnfAuoj3LqizmZTd532oYajskH3Q6YEnfz6mpoA4bVqUV3oddq5iNyEPOwLkTwLITKAVtwPOA6oar8ZeM+s6zHMQMaguotQX1XqJlmOCaRqy+BiMuJ/8c7zYL+W7qTin9u0TS4o4dMi9DK6XMv2UU/8QXkfUgEB5VOe8mTNM3FhS2VI4/wB87vd6/PssK/dmP7TAOmojSww8NGih6OYsCs98qRl11Ytgy/fVo0jaiFjE3ndyjBA1dBeKSCmLknifbi6ZvJCmEUNwi4BFNU93HfAqouVUqXnL66e1kt00ovOWtfmYXa2kFZz0yEZBzdOKEtM9p2IdNGbh+MjELtmcNdUS1GNi3J1MSfe44dyPUM0k0jtbPsdvTZbBDxSmP6rR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nmo1OFdSM0p6RW1KcmtpOWZidWhXTzZVV2hUVTA1ZVh1RGxianluM09PUWZC?=
 =?utf-8?B?UnpBRjVlVmZMdmRVQUVoSmRUaGg2Rkg0djhXMUJGMXJ2WHFDbFJ0WGwyM25q?=
 =?utf-8?B?QU02aFJ2Nng1ckVnSjNScXY3cFR5dXlTQjR0S05xVjVDOFhpWmRMYk5ia1BQ?=
 =?utf-8?B?M2wrbHBZVVRSOVNnVFZVeFRLcitZcGZ2NWRmNEhKQkY1TU14NHRDOGN1ZWF4?=
 =?utf-8?B?RE5PaVM5SUtkd01qd2FXNjBBU0JRNWlaWlAzR0QwY1ZzR1dmeUJKUHpVbTlt?=
 =?utf-8?B?V1RKdVBrN3ZGYnRINm9GUWJmWFNOelcrekRNdmd5cFhGS2FjK0psN1R5VXhE?=
 =?utf-8?B?UjFPR0ViMlFva09CWHJsWUZtSGZIbW1Ba2JXRjZscFIvSmpRdTFLdWkwRWVT?=
 =?utf-8?B?ek8ybjBCQmp5TlNPVE0xWG1Vak9QS20yMEhGUGQ5ejhKREYrdEcwaURNT0Nv?=
 =?utf-8?B?a3Nua2JGUEpYL281SG03aEhJOUhHN0F0a0J3NWdIL3g2bGVyKzN6N0VoNDly?=
 =?utf-8?B?a3o1YjUwMjVhL2JXWmNPMXZENGRUMHNFR3dSMkNDWDhHenNLOHFwYWsveWNJ?=
 =?utf-8?B?NzcrYTJFSGxSS3dYOGZSM05zUUIvRWxFNXRhRFpxNFBIcnc1djZjTDFqcE9a?=
 =?utf-8?B?dEdaTklCdFR2cnBLVGU0bklaaDRyZnc4elgrN1ZuU1h5UmxENEVTYjcyMDBG?=
 =?utf-8?B?QTYzQjVzd2Fvcy9PdnlrYUx4dFVHL3dPcE5kdDZPeG5xdllMRmtMd1dLUFlt?=
 =?utf-8?B?L2dCUG1aUWJQU0ZidERwS2JHNHZSSkFwS0NlT2x0NXVZUDRYbFZKRFFuYVJZ?=
 =?utf-8?B?eVE2SHVCMUVDd1lRSVJoRDBjVDdjZGRDaXVOa2FCNEFjcU9GdlNNVVNONFRI?=
 =?utf-8?B?VlJhaHBZMC9UY2hWb2hsT2FoNXpEOUllVVc1NFlzdnZiRjJ1SUJBU0pmNjhx?=
 =?utf-8?B?QzZNL0hlNkNnYTdTODd5aUxFVDNPQ09iTGM0a2t6eWY0UlNTT1pheENwQXZV?=
 =?utf-8?B?SXNRYUw5UHd2aFR0ZGl2ejlYRGNoR05yaFQ2bVU4VnlwaEU2V1l2Yk53b2tW?=
 =?utf-8?B?VGN2V0loWlI0dG1YbzdCRmlWV0ZNMXNQYk1icVJRZVlvNkppcW9tMXhBMnlT?=
 =?utf-8?B?dTAvekxvUVdnd216dGxqUlA4QkkycG1LWFBxV1NUQkl2S08xMWdmUTJucGY2?=
 =?utf-8?B?VXhia282bTFwelRxYzA4NHNiTC9sU2NSL05INTIvY0J2eWl1TDVFYjdsVlVL?=
 =?utf-8?B?QTFYczlyR3FvYW9TbzFBZDFkY1kvaWM3VytLanFtNUo4cDg0bzFjU2N4NG5k?=
 =?utf-8?B?YVZsWWNwSXpGUnNjTnVOL04wbER1dFZuaFdRSzFIaWJFbHBMd1l5RjBnSUxS?=
 =?utf-8?B?aUt2VEJpWkZTbnY1dE1EV1UvYmNDOCtCZjVHU01sWHJPc1l0QXFTMGxNUSsr?=
 =?utf-8?B?cUY0Vysra2gzaXJSekViWFo3MzVtVEZ5WnRjYnNMV244UCtpcjFnbUlObHhO?=
 =?utf-8?B?cXRaNHByL3dSbUExMWlnR2daNDZIWnB5d0hGL3pvd3EyTnEyeVMydDV1bkpj?=
 =?utf-8?B?Skl2a3dHb0xnUHhMSE5pdWVkcURqYit0WjNSNW9oc0ZDSVdGaVlHbnlnVGM0?=
 =?utf-8?B?c2w2TGJZU25FVkJ0aDRMNmdPS2lYODF3YXlmM25LRWJ0N0VZL3ZrWmZ1a0pG?=
 =?utf-8?B?Z0k2VE9DNHVhZnRXODZXTGx3YUptbGRNK2J6MWhoZTRkSXhwamN5QlRiUHhX?=
 =?utf-8?B?UnRyUFNRd04xQ2lKeDhXUU1PU1ZQZlFHMm15VzdxNFp3dm1qVTcrRzE1bDJP?=
 =?utf-8?B?R1VON0VHWmFweGZ1THNxR3NkNXJVcFJrSEtVakVYek5zTUR2dDBtKy9obHVs?=
 =?utf-8?B?eUdHNzJwdHJ0bmpSN2p0NEM5aVNaWUNKLzQ1SmQ2NDZ1QXhnZmNENXVhc1JE?=
 =?utf-8?B?L3gwa0U2RGlkRi9xdnhyNVNhcWFzQW8yNHRMbXZnWHdLNXRFMy9RRG1PSDdO?=
 =?utf-8?B?TWJwMnBCYnVqRzhJRmRWeURYWjlpUGdRYkVqb3kwV0ZGWGFSODFZUU5ENmFy?=
 =?utf-8?B?SlVrU0NKM3l1SjZJN0JMTkRBSjdMY0VYK0x6MzhTbUNYalplVUdsMUpVUHFq?=
 =?utf-8?B?NVg3YkVXYjNPU2FkQmtPR3I0SnBxWlpCT3dQbnRPWGt5U0JFUGd3aFFsdElp?=
 =?utf-8?B?UmpHWm1Kb0JWMDFRMk45a2tEbHRLOURBT0xIYlpvNzEzRDlvN1lMY0NzYXhC?=
 =?utf-8?B?SXVyMmsrYmdLTVgySENwT0hjTlVtS3U0MkJPcUE5enlkZEVXM01sc1VNT3pR?=
 =?utf-8?B?eHppTEI5UWpjSFNadVBzWEJWNHNWS1hhUDVQQTE4TTFRZ1FmS1RIdWdENFNV?=
 =?utf-8?Q?AqW26GhXIVbp1EiY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924372b8-e71e-4741-4fff-08deb1048298
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 15:30:06.1707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCnBhEfWrO6yvWQ5GggkKXnAXn8hqybCbX8E3Pig4JYzkYYT/1YhM3W5gu/b7KoISBCqzYXcKfDZpHVEMokCyFQeuZ24cqU3emZeLNVgv+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8880
X-Rspamd-Queue-Id: D80CA536448
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32582-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.984];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogTWl0dHdvY2gsIDEzLiBNYWkgMjAyNiAxMTo0Mg0KPiBUbzogSm9obiBN
YWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIHY2IDA5LzE2XSBBU29DOiByc25kOiBzc3VpOiBBZGQgUlovRzNFIFNTSVUgQlVTSUYNCj4g
c3VwcG9ydA0KPiANCj4gSGkgSm9obiwNCj4gDQo+IE9uIFR1ZSwgMTIgTWF5IDIwMjYgYXQgMjA6
MjgsIEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6
DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBTU0lVIGZvdW5kIG9uIHRoZSBSZW5lc2FzIFJaL0cz
RSBTb0MsIHdoaWNoDQo+ID4gcHJvdmlkZXMgYSBkaWZmZXJlbnQgQlVTSUYgbGF5b3V0IGNvbXBh
cmVkIHRvIGVhcmxpZXIgZ2VuZXJhdGlvbnM6DQo+ID4NCj4gPiAgLSBTU0kwLVNTSTQ6IDQgQlVT
SUYgaW5zdGFuY2VzIGVhY2ggKEJVU0lGMC0zKQ0KPiA+ICAtIFNTSTUtU1NJODogMSBCVVNJRiBp
bnN0YW5jZSBlYWNoIChCVVNJRjAgb25seSkNCj4gPiAgLSBTU0k5OiA0IEJVU0lGIGluc3RhbmNl
cyAoQlVTSUYwLTMpDQo+ID4gIC0gVG90YWw6IDI4IEJVU0lGcw0KPiA+DQo+ID4gUlovRzNFIGFs
c28gZGlmZmVycyBmcm9tIEdlbjIvR2VuMyBpbXBsZW1lbnRhdGlvbnMgaW4gdGhhdCBvbmx5IHR3
bw0KPiA+IHBhaXJzIG9mIEJVU0lGIGVycm9yLXN0YXR1cyByZWdpc3RlcnMgYXJlIGF2YWlsYWJs
ZSBpbnN0ZWFkIG9mIGZvdXIsDQo+ID4gYW5kIHRoZSBTU0kgYWx3YXlzIG9wZXJhdGVzIGluIEJV
U0lGIG1vZGUgd2l0aCBubyBQSU8gZmFsbGJhY2suDQo+ID4NCj4gPiBSYXRoZXIgdGhhbiBzY2F0
dGVyaW5nIFNvQy1zcGVjaWZpYyBjaGVja3MgYWNyb3NzIGZ1bmN0aW9uYWwgY29kZSwNCj4gPiBp
bnRyb2R1Y2UgYW4gZXh0cmEgY2FwYWJpbGl0eSBmbGFncyBpbiB0aGUgbWF0Y2ggZGF0YToNCj4g
Pg0KPiA+ICAtIFJTTkRfU1NJVV9CVVNJRl9TVEFUVVNfQ09VTlRfMjogb25seSB0d28gQlVTSUYg
ZXJyb3Itc3RhdHVzDQo+ID4gICAgcmVnaXN0ZXIgcGFpcnMgYXJlIHByZXNlbnQuIFVzZWQgaW4g
cnNuZF9zc2l1X2J1c2lmX2Vycl9pcnFfY3RybCgpDQo+ID4gICAgYW5kIHJzbmRfc3NpdV9idXNp
Zl9lcnJfc3RhdHVzX2NsZWFyKCkgdG8gbGltaXQgcmVnaXN0ZXIgaXRlcmF0aW9uLg0KPiA+DQo+
ID4gRnV0dXJlIFNvQ3Mgc2hhcmluZyB0aGVzZSBjb25zdHJhaW50cyBjYW4gc2V0IHRoZSBmbGFn
cyB3aXRob3V0DQo+ID4gcmVxdWlyaW5nIGNvZGUgY2hhbmdlcy4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gDQo+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvc291bmQvc29jL3JlbmVzYXMv
cmNhci9jb3JlLmMNCj4gPiArKysgYi9zb3VuZC9zb2MvcmVuZXNhcy9yY2FyL2NvcmUuYw0KPiA+
IEBAIC0xMDcsNyArMTA3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnNu
ZF9vZl9tYXRjaFtdID0gew0KPiA+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJj
YXJfc291bmQtZ2VuNCIsIC5kYXRhID0gKHZvaWQNCj4gKilSU05EX0dFTjQgfSwNCj4gPiAgICAg
ICAgIC8qIFNwZWNpYWwgSGFuZGxpbmcgKi8NCj4gPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
cmVuZXNhcyxyY2FyX3NvdW5kLXI4YTc3OTkwIiwgLmRhdGEgPSAodm9pZA0KPiAqKShSU05EX0dF
TjMgfCBSU05EX1NPQ19FKSB9LA0KPiA+IC0gICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LHI5YTA5ZzA0Ny1zb3VuZCIsIC5kYXRhID0gKHZvaWQNCj4gKikoUlNORF9SWjMgfCBSU05EX1Ja
RzNFKSB9LA0KPiA+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA5ZzA0Ny1z
b3VuZCIsIC5kYXRhID0gKHZvaWQNCj4gKikoUlNORF9SWjMgfCBSU05EX1JaRzNFIHwNCj4gPiAr
DQo+ID4gKyBSU05EX1NTSVVfQlVTSUZfU1RBVFVTX0NPVU5UXzIpIH0sDQo+IA0KPiBOaXQ6IHBs
ZWFzZSBzcGxpdCB0aGUgbGluZSBhZnRlciB0aGUgY29tbWEgaW5zdGVhZCBvZiBhZnRlciB0aGUg
cGlwZQ0KPiBjaGFyYWN0ZXIuDQoNCk5vdGVkLiBXaWxsIHRha2UgY2FyZSBvZiBpdCBpbiB2Ny4N
Cg0KUmVnYXJkcywNCkpvaG4NCg==


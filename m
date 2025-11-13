Return-Path: <linux-renesas-soc+bounces-24548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF61C56E0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 11:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAE693B0B2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 10:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA922E0412;
	Thu, 13 Nov 2025 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="v7uEArIl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB52D5C6C;
	Thu, 13 Nov 2025 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030120; cv=fail; b=sPpmV/vRCYLpfGq/RhIjOHFfxQF4yrEEAHvn0RgQ6563gSUpgJFd8w3g5W1msP3cpa+rysRn0ODtWdalObftDe5wS5pIm+E8q7DnkHJCTFQXfr9K0p55DIcaaNryuL3jLEXdkE+n78yju1dgCRyY2NUDuZtjIk9GX/h4lS9NFXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030120; c=relaxed/simple;
	bh=tZrycwOwZLbSs8yPM2aEjWSB+yKNFcu9X/UHEP682hM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G8HY8yjsvwjzOVpiPQIU2IcUKwkZOczPwHTYOTw1zArWNTSoEv0KxLLE/XpO7q+Lf8GMLLjxH47SQhnKq8ejrz2Xy9mqEtQLdUHl3LAqIwbBcy7gwf5ktY3EbsxWqbsbBnnIqA7KRtwWdHFXIA81VcfcZoj/KYas8j4w1QUcm/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=v7uEArIl; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFbgB2oJ1MZD8yrN5Vx05jpuqQOXxD8Bzrm8J4juGoRyOnOjw0K0vFpK8B883ueld04ZZu9QgC8poiovhcFKNWla/s6zZO9WYy06iop1Qrpuo7YNyHFFwSzJuCey8Qh88a7oRa+GaQw4K0fZoh9hQNa2dBA6fSqCG1OYdRSQevfUuk1g8TfLidviwTI00nnWDQrvBsm/cN4SaU6K9odD6AANX1LIuC18Lo0V6Rs2Ko5kxB5jg5L8USa2m7Dl8NbyDTw4YCfFdivaktMmO/1Y0PYwwzLHrBxJfhwO07l/816YIIbUy3OTed5jjeuI7zQwY79ZPipJPBGQIkF+Amq4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZrycwOwZLbSs8yPM2aEjWSB+yKNFcu9X/UHEP682hM=;
 b=RbQW+TXgFS776kCGmgSHW6a1I7yjjQuRLugp2mrd5dQjkgdxZMFJERzexlr5uBkHDilEa5MRPbvNNS5/dTy7oNilJyTG52dH84W1+etbJ6EYXQpp36avb7yue2FKWKQRfYw28CxMMJWWDrCWO2EQZfOK2RtBf/lhsT7qrS9o3Rwqj9jpquZbl85QbIzuhXRKlqQRPtQ7D+pMKnlvvcIm6LSv1q+U5zUqqQQrmRH9U/rircFbxw0kewfeqtwTetlRDOc+BpMH5rYh5OYvL8PpPX2EaesidGCESh+T0RNPbac7YJ+jt5e8dJjn7i1muiguXAUVo/FhITJ+k+C+NTh6sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZrycwOwZLbSs8yPM2aEjWSB+yKNFcu9X/UHEP682hM=;
 b=v7uEArIlyG3zbLtoSMru0Crq05Y6QSmwcG6CTkwJa/CWH5llPriQ7Z+lHtxDOspeMrDkppWGmGtn+C9WG2VZkdVfAEHeIjQgvOsQ+Hsm0U2FxXNubEywe5l5+BKuuEgBG386JiAys4SSP2SPGq4Yc8X80xTzSo3PY8W0a5lIVlQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11984.jpnprd01.prod.outlook.com (2603:1096:400:40d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 10:35:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 10:35:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "stable@kernel.org"
	<stable@kernel.org>, Tony Tang <Tony.tang.ks@renesas.com>
Subject: RE: [PATCH v2 1/2] ASoC: renesas: rz-ssi: Fix channel swap issue in
 full duplex mode
Thread-Topic: [PATCH v2 1/2] ASoC: renesas: rz-ssi: Fix channel swap issue in
 full duplex mode
Thread-Index: AQHcVHckwfLOlIAJlkuxtPCF8tcndbTwTFgAgAAcsiA=
Date: Thu, 13 Nov 2025 10:35:15 +0000
Message-ID:
 <TY3PR01MB11346A1636E5E6755AD94006986CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251113082551.99595-1-biju.das.jz@bp.renesas.com>
 <20251113082551.99595-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdUdiczsrB8H57VjPbcaWWS22HmUvc_iU3rs84qHAsfB6A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUdiczsrB8H57VjPbcaWWS22HmUvc_iU3rs84qHAsfB6A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11984:EE_
x-ms-office365-filtering-correlation-id: 51317225-e027-4157-db42-08de22a05551
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cjRtS1pOaTc2cXY3aG03MUN2VnhWdXJ4MDB3RFZjMVE1bHZCSk9HSDVKeGdI?=
 =?utf-8?B?Z0NCa3hBeVJteG5jeW9JZVFXZXFBYnBncytRYWRvUUg2RzdiZUs0Y1BXUFJI?=
 =?utf-8?B?dk4xQmprT0VsUmR3WXp5RUdVeXNBbkRITXMrMFlvMmdwbFdFZG9jTTB5aEVO?=
 =?utf-8?B?bnFsSm1vTGNFcWNxakd2YTRNTk9BU3JlVmdTYWZBSzhRSnB6NWJXd0MxM29v?=
 =?utf-8?B?Q3BSU21sTnBkQ1BTazUzM0dlRHVVQkFQSUlOaFJsTUUvdEpYZmtFUERVelpj?=
 =?utf-8?B?a0tkVzR1UVhRWVBUN09IdStTQTRRL2NoaEF5MTBOVVNZL0NwcjU1UURCNlgr?=
 =?utf-8?B?VUNIUmRPZzNmcHVDTkZ3aCthK1lBNTdidEV5ZGdIejZ3QTB3dTNVVncxUFJa?=
 =?utf-8?B?c0Z0dG8vdjJjVlI1dXpJcjVtd3FETnRiYnZSOXdRb3BHWG85MWVIUU5jUXUy?=
 =?utf-8?B?MFc5TkIzbVhBNHl2MjNhOFN6VDFCNnVaL3V6WDY5NWxNWEo5azRWUlQ2UmNB?=
 =?utf-8?B?N1BsY0xwSTlDWjVZOWNNdmNJdkp2MWR4S2x3Z2ZTY0Q4ZTNJbyt3STJ2bGZJ?=
 =?utf-8?B?Wjg2bG9jNWx4NHd1cUNPaGczQWdLbnR4OVgxL3VyRTBtQ1E1QldrbVZmQnR3?=
 =?utf-8?B?TGxnSmNKYzNRNEdnWEVaM0cxNm1RMXduRkdDSGovcGxTVi9CRWc4WEw3MmZF?=
 =?utf-8?B?NWZsL01jMWUrOVFJdy9OdDB2VjJ1Mzk5eHdPaWNsb29YeEZUeDk0WWhtc0pH?=
 =?utf-8?B?TDB2TXZsWmdwM3dRMUxyRVhYSW9paUpQSjV0SHRsUWx5ZjVDcWc1M01PdXBJ?=
 =?utf-8?B?TWJaYXF6ZGxpU3NiazdzMFUxVjJwaWxFZUVVVUExbFN4RHNxQzEwRkpSalMy?=
 =?utf-8?B?WjRUc09VMDlCcVJVRzJEK00yZHVQc04wWk1KUDVlSCtRSzd4UTFnQk1hcHhJ?=
 =?utf-8?B?TEY5OGdSLzdYd0QyNVM1RG4vWWQxVUZ6QUc4bkN5Y1J4L1BRdzlHN0JhMk44?=
 =?utf-8?B?bVp5UHZGUCtOdzdtVDIyYjVJQnhaYzRja1F3T1ZibFJDTHY0UHI5azJEUHVX?=
 =?utf-8?B?ZkFVeDA0WFQ4ZElGYm1vQVh0QUQyaFhUYUpwb01nVi95MytlVVAyOXJ5R0VL?=
 =?utf-8?B?djNpYitXekhoWmE1aElvUUF0WVJoN01VblgxUHkrL1hiSGdrNUZmMDBBam1u?=
 =?utf-8?B?SEJ0MW1UM0NWOENLZGdyRUxueHZUbWMyakJIcjZTUFcxR3E1TDM4Z1l0aXMx?=
 =?utf-8?B?eHhqS01xU1UydkY1QmV0VXA3UDh3MjdpL2ppcytjYitraDMrNEFQVkpXWXJh?=
 =?utf-8?B?VS9DUEVIRTE0YXMzeXVOaGk0NXMzSE9BTWo5amNWZnpxRkZUdDFBcXBpNXpX?=
 =?utf-8?B?LzdFUUNocnVENStIOVNnOS9EeC9EUTBCdVRIRHdxMlVEczh4cEt2TjZHbTg0?=
 =?utf-8?B?NkFqdG5TeFNDQmxhbDNmUDA0THpHQzNBYkcyVUZiTmo1OVpxNXhLcHluaVdN?=
 =?utf-8?B?bTY0Z1NFVDc3RG5QUTJCU0VUTm5tMkhMb1duQ0pIQnVEU2prUzhWRTAybHp5?=
 =?utf-8?B?SnBhTnV1YXVHZWJMZmpvNUk0dysxM3dBY1NnMlQwNzVnSDdqYm93Y1lJWWYw?=
 =?utf-8?B?eklOMmIxRTc4cjlEcFp3RHRFQjQ0N1VBOXRBeG1zZWl5QVN2Sk5Dek4zS1JQ?=
 =?utf-8?B?ODdlYmlLWFJOdkZjSVJoUWtSbjI1WGRLdW85L2srZ1hCYkxtWU1JajJjTGxR?=
 =?utf-8?B?U0tHUUxudmxPQWVxZko1aDJ2QmJ4V2UxajMxVjBUbVdUVjRHdUU2ckl4TWhK?=
 =?utf-8?B?aWVITlN2WCtxOG5vWUN2RTJEVFIvQUhpYkJuUEtFWFlWa0RSR2VGMmcxRCth?=
 =?utf-8?B?eEJKNEI3L2tPSDFVUXNpZURCZnV4RXUrby9UdWQxd2U3YW42b0JjSkE4WWNx?=
 =?utf-8?B?MmZVMnZWUmtORDFIUFpsRUJHRVYwK1NUeUh3SlBpM2Z1RFZZdEZicm8wVzlB?=
 =?utf-8?B?N1FYTjQvV1lxZDhtRG1oQmdQZE9IRFM5VnNkM2VsSmdaaFpIdjVuOFFpR2lY?=
 =?utf-8?Q?sKfSFc?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3oyU1c5R0Z1b3BUbnVmZmRyQkFiRHRlRHREdFZQTmtXRWdLK2xueXZKWU41?=
 =?utf-8?B?NE54MDhzaTZIMGZ0Y3ljM3p5T3F4RURWaUhoUmNhdFpDNEttWmE5NHhDZFda?=
 =?utf-8?B?dHVPZFM0V3gwN09pNy82VzJ6THFCNGR5by8vZ2EzUEREWTdEb3RCeitzalN2?=
 =?utf-8?B?ekhFcGhsa1orODExdUNETXYzQjByUjRIR09yR1ZQTkNFbTlqRExoTFc0R25D?=
 =?utf-8?B?WFI1S0llNmVOZmNsNnljS2VSYkNPNmhEc05LUnUwcmsya1FHT3BLeFRCZGtS?=
 =?utf-8?B?cklXK3Q3MnlubkdKaENHT0IwWVUrTUdranFKaEM3UmZkVExNcTVwcGZlVldC?=
 =?utf-8?B?ZjIwblh3Nmt2S3NZMjBTL1Q0RVp1eHZ2R3NsOU9RV2lwMU0wdEhiU3g3U0ZD?=
 =?utf-8?B?QmVqYWFKYk5jRitJYW9sb1dvT2lnYTRjcUp1WGhMcnF6KzJqa0drMms2WlJh?=
 =?utf-8?B?cG5EY0J4WXNIY0NCbDZzL01yeGRtYkZtSXdnMWJ4Wm53aUdWMGMyTFltMGtN?=
 =?utf-8?B?dlBLQStvc3p3ZVdVQVl3MEI1T2xTaHNGR0w0RWZZY0FKWjJGblZZdXhKVklF?=
 =?utf-8?B?b2dPUzhvZ2FsQnBkeWplYkt0eDhyWlJvK2lhc29rWmpBVnhlQUtuQXNtUEJs?=
 =?utf-8?B?SWJHN2JRdldXVVd6TWRBQ0EzS1dxMk05NFVtcUxub3JMSFZBbWllRjFJUStq?=
 =?utf-8?B?TGdWRDlCNGdQckY2Qlh1SDd1cWxPQVZmNUgvVGdzZ2k0UHdsYjF4YUVSbmxV?=
 =?utf-8?B?M1J1bU5QeFprWUZwRWh5b0praENoQlVZdWVLKzIwU2Vteld0dGpjUDhRV3dw?=
 =?utf-8?B?V2kwMnJSaFJTQWFNVkU4ODliTFhSWmpheElFUDBKOHVaZUt4a0pTSk9ma21p?=
 =?utf-8?B?dlRBU1dsVXR2WjF3UUkzSzlpSDYyTkJrRVdPaGhJTlJPd2N6QTB6K1RYWndp?=
 =?utf-8?B?TSsvOTFFaGpvQkwzTGh3RytnUlMwZ293NjUzOWt5cEljR2FtMUJLWEc2VVo0?=
 =?utf-8?B?TytVT1JKTllYc3h0QW1PMjhCM2ViYlNFZTJVQUFaVWR1UVBuQTZIZFpGd1FY?=
 =?utf-8?B?NkxpZXRNMnVxWG1GamxDbGtZbm5xalA1N3MvY24rNERJYnF5NjhEVmE5VlF0?=
 =?utf-8?B?WnZ3NTVQUG5Uc1lFdHkzWkF0cUFqbjNiODF2RzZaWEM1ODBZVjBXZmtjVmxH?=
 =?utf-8?B?N05saVZjYytOOHhmY0Y1RGNjejVocnlnYWtzRG5LVERFT1ljektUcGo5d3Yz?=
 =?utf-8?B?Mk1BSDcxSzdaeGZzTHRLd0g1RnJRUUlSdHBPNndrbWdPSjFOc09EL0hhd1V4?=
 =?utf-8?B?KzFOdTFnblpNYmtSb3dNL3NiTzZFZTdodkVDL05haSt5Zy9XMnh1SjJJV1BH?=
 =?utf-8?B?NW93RzBoN2JCYzNnMk8ycHF1K2ttRGtDVmYySVlIc2JqampwSjhoRHk4WExH?=
 =?utf-8?B?T3F6S3lLU1dqUDZoWFhxS05JaS90SXJLZ1hRcXA5c3lXWno2djQxMkV2Uk9x?=
 =?utf-8?B?SjJKTkVDZTVQdWNOMWw5R0JQdHQza0tEbmVoMFpJcGRhM1hTS3BHWExLUkNH?=
 =?utf-8?B?Vy9VanZWeTY3VEZNZ3l3UVdmNmJNNkFrMG0ybTJIaXFFUVp6RlAxcU1oak1u?=
 =?utf-8?B?NlpudlpTaXlFZTdBQlVKTU92OXBYS0FqMnVGQnFGMUxsRURRVHorVjRGM2c3?=
 =?utf-8?B?VzFKc2FQWGMyVzU5c291NURCRnBYRlNuemRLV292Q1lOWkFsQW1RWlpxT3Rp?=
 =?utf-8?B?ajlpSkJGY0NkWXJhRzVXNEdrcFN2VkoyZTh0T1lmM3o1RTFuSUFnd0RpNDVs?=
 =?utf-8?B?UWh4YmkrY1d0SVprMlVMNCtvOHQvSUdRTUx6L3NmR29WZVhlTkI4TXpoK0Ex?=
 =?utf-8?B?RzJBUWRCWG9iNHNYMzY3a21Tb1NKY2hkTHFsTWVaY3RaczFqTW1BR3BvK1NO?=
 =?utf-8?B?NXgrR1lLcHRzTHBBSXFSWm5paXlYeWRZMGJ6czRSMFNpMmlpYmJnWm85cU90?=
 =?utf-8?B?anp4SEd2czBvNHdBM0RLUFcwL21PcWNBRHJXUVpiWlNMQnV1bVFJT014WFNz?=
 =?utf-8?B?eEZzOFNWWWZhN2hPSEprTG9ybmtkTzAzUW1PWmh0cFRtbTJVb1RUNVMwcE9L?=
 =?utf-8?B?U2dKOFRVK2w0U0FCdkwwY2VrOWpBRzJNV0U1QTNGVXJmaUUxVVc2ZW9ta0ky?=
 =?utf-8?B?bFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 51317225-e027-4157-db42-08de22a05551
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 10:35:15.4097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zeyt2fdOoZAepgXe/ZNxueQF3Vft6dzNxnjs+RXTZqzXBnRbMGG9c2OTPj/C0YBkgMavXFF87B+QAQ+Go31WO6F4n080wbtDB1Gv0Pv42Vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11984

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEzIE5vdmVtYmVyIDIwMjUgMDg6NTENCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAxLzJdIEFTb0M6IHJlbmVzYXM6IHJ6LXNzaTogRml4IGNoYW5uZWwgc3dhcCBpc3N1
ZSBpbiBmdWxsIGR1cGxleCBtb2RlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCAxMyBO
b3YgMjAyNSBhdCAwOToyNSwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4g
PiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBU
aGUgZnVsbCBkdXBsZXggYXVkaW8gc3RhcnRzIHdpdGggaGFsZiBkdXBsZXggbW9kZSBhbmQgdGhl
biBzd2l0Y2ggdG8NCj4gPiBmdWxsIGR1cGxleCBtb2RlIChhbm90aGVyIEZJRk8gcmVzZXQpIHdo
ZW4gYm90aCBwbGF5YmFjay9jYXB0dXJlDQo+ID4gc3RyZWFtcyBhdmFpbGFibGUgbGVhZGluZyB0
byByYW5kb20gYXVkaW8gbGVmdC9yaWdodCBjaGFubmVsIHN3YXANCj4gPiBpc3N1ZS4gRml4IHRo
aXMgY2hhbm5lbCBzd2FwIGlzc3VlIGJ5IGRldGVjdGluZyB0aGUgZnVsbCBkdXBsZXgNCj4gPiBj
b25kaXRpb24gYnkgcG9wdWxhdGluZyBzdHJ1Y3QgZHVwIHZhcmlhYmxlIGluIHN0YXJ0dXAoKSBj
YWxsYmFjayBhbmQNCj4gPiBzeW5jaHJvbml6ZSBzdGFydGluZyBib3RoIHRoZSBwbGF5IGFuZCBj
YXB0dXJlIGF0IHRoZSBzYW1lIHRpbWUgaW4NCj4gPiByel9zc2lfc3RhcnQoKS4NCj4gPg0KPiA+
IENjOiBzdGFibGVAa2VybmVsLm9yZw0KPiA+IEZpeGVzOiA0ZjhjZDA1YTQzMDUgKCJBU29DOiBz
aDogcnotc3NpOiBBZGQgZnVsbCBkdXBsZXggc3VwcG9ydCIpDQo+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBUb255IFRhbmcgPHRvbnkudGFuZy5rc0ByZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBUb255IFRhbmcgPHRvbnkudGFuZy5rc0ByZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTog
S3VuaW5vcmkgTW9yaW1vdG8gPGt1bmlub3JpLm1vcmltb3RvLmd4QHJlbmVzYXMuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4g
DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvc291bmQvc29jL3JlbmVz
YXMvcnotc3NpLmMNCj4gPiArKysgYi9zb3VuZC9zb2MvcmVuZXNhcy9yei1zc2kuYw0KPiA+IEBA
IC0zNzQsMTIgKzM3OSwxOCBAQCBzdGF0aWMgaW50IHJ6X3NzaV9zdGFydChzdHJ1Y3Qgcnpfc3Np
X3ByaXYgKnNzaSwgc3RydWN0IHJ6X3NzaV9zdHJlYW0gKnN0cm0pDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgU1NJU1JfUlVJUlEpLCAwKTsNCj4gPg0KPiA+ICAgICAgICAgc3Ry
bS0+cnVubmluZyA9IDE7DQo+ID4gLSAgICAgICBpZiAoaXNfZnVsbF9kdXBsZXgpDQo+ID4gLSAg
ICAgICAgICAgICAgIHNzaWNyIHw9IFNTSUNSX1RFTiB8IFNTSUNSX1JFTjsNCj4gPiAtICAgICAg
IGVsc2UNCj4gPiArICAgICAgIGlmIChpc19mdWxsX2R1cGxleCkgew0KPiA+ICsgICAgICAgICAg
ICAgICBpZiAoc3NpLT5kdXAub25lX3N0cmVhbV90cmlnZ2VyZWQpIHsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBzc2ljciB8PSBTU0lDUl9URU4gfCBTU0lDUl9SRU47DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcnpfc3NpX3JlZ193cml0ZWwoc3NpLCBTU0lDUiwgc3NpY3IpOw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNzaS0+ZHVwLm9uZV9zdHJlYW1fdHJpZ2dlcmVk
ID0gZmFsc2U7DQo+ID4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgc3NpLT5kdXAub25lX3N0cmVhbV90cmlnZ2VyZWQgPSB0cnVlOw0KPiA+ICsg
ICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICB9IGVsc2Ugew0KPiA+ICAgICAgICAgICAgICAg
ICBzc2ljciB8PSBpc19wbGF5ID8gU1NJQ1JfVEVOIDogU1NJQ1JfUkVOOw0KPiA+IC0NCj4gPiAt
ICAgICAgIHJ6X3NzaV9yZWdfd3JpdGVsKHNzaSwgU1NJQ1IsIHNzaWNyKTsNCj4gPiArICAgICAg
ICAgICAgICAgcnpfc3NpX3JlZ193cml0ZWwoc3NpLCBTU0lDUiwgc3NpY3IpOw0KPiA+ICsgICAg
ICAgfQ0KPiANCj4gWW91IGNhbiByZWR1Y2UgaW5kZW50YXRpb24gYnkgcmVzdHJ1Y3R1cmluZyB0
aGUgdGVzdHM6DQo+IA0KPiAgICAgaWYgKCFpc19mdWxsX2R1cGxleCkgew0KPiAgICAgICAgICAg
ICAuLi4NCj4gICAgIH0gZWxzZSBpZiAoc3NpLT5kdXAub25lX3N0cmVhbV90cmlnZ2VyZWQpIHsN
Cj4gICAgICAgICAgICAgLi4uDQo+ICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAuLi4NCj4g
ICAgfQ0KDQpBZ3JlZWQsIHdpbGwgdXBkYXRlIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0K
QmlqdQ0K


Return-Path: <linux-renesas-soc+bounces-27146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLkgAhThb2n8RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:09:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD454B0E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D8C76AE2DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB4933C1BF;
	Tue, 20 Jan 2026 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="brkKhgPQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD146AF16;
	Tue, 20 Jan 2026 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768936147; cv=fail; b=nL1drVnEVRQqmzgxsc9qfWlblyuDBLyl0/3piH5zTsuVlZiFvaeCC7brPegLN6BlSvDEkrvoFBwpcLl65jvzLFQvYFGLAEzz6HArAl59YToJwto5eIS25OuJbYwYlQ7lFtTmWukzc5ilJhp97P4KKF+Vn5wfgtk/8csnru510+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768936147; c=relaxed/simple;
	bh=sVUs6JU/aBNoj5+jA+9r4/ut8DPs+Ue+BoJm5uG6pug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZOvvaZQsQJsu/HNN0MGqHIWKFs27xwb/mSM1zBrvTdhn/H+sgYW1SaapyXCSv5+2oqIPMatrTt6GMdF9Mm3sFM1HgxXdYuMyqOX9X26CWPaoVlDcKIBhGA/KHTN7GiTrUZlOnZHNFoWDfl4/3yRWa7Oim98kw0iLiMV4EF+q6GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=brkKhgPQ; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRoOvi1k/g2NWQfz2PGuG2JbHkM7GW5R1Cyls4f5GWmP37mg1Ol6m7FL/7vJP0neaYcuU1Szfxr75cZ1OcvIz/hvJwl04SqjrJaHFCDePbLPtc3V7X+rBcEt/9X1nqe+GTCZKEvYF/dUx/sedjtCMJRKAPvgHtUFMJxb9XD5ugegFcXKZUpWeXX5pVmYBGlph8JU8MImZiFm/fqUPI4RsQRi8oZukcyMLKv0lGA7MGR/EDWhtM/NclT4ZDH6AHDdwCjkGUduH+2dvPNOwNy1IxY4dymp/O82D1LaI+sJ7OCLsV3behauFgydSxmnl0inLXMKZyvvwhxS1u4v8226lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVUs6JU/aBNoj5+jA+9r4/ut8DPs+Ue+BoJm5uG6pug=;
 b=RK7DYBqTZNX7wZ9tEXPtrlD9pam0YotfTikpnYcId0xf16ZwF86qHqQV9udsBmihgfSGyUTIpKFMHZKUM4TrnFHt6IyfuuBm4xx4rWlo8H1c6PlDvUNf1AYYutrBe3U1vxemCdpyOAG27rZvnGuVymfND3F3Gl5TfWNfGL7b3nJaSRCnqXoj+UeDToUlY8whpbELKKyrIunRASN0hU5c5t8OH+S/fArcf/VFDT6HVJ5dKVGfNsszEwMKTSGeJHWLc3m+9E4p7ZDC0csxRujDIWpOjtWictsQkH44W+qT7uGmj2msMKqk9RsnidIPFjzDzdf8v23IUnl08scH2GV/fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVUs6JU/aBNoj5+jA+9r4/ut8DPs+Ue+BoJm5uG6pug=;
 b=brkKhgPQUc5PHFAmaE3UPZBMWKmGGMk2ran7RH1hAGcQf0P6tnVlHQLB2MdAbUNPBvIXnR624p5zfkXGpGtgTwWwKQ9yeG2RqxUr1ferlzgJI4j1i+K42cr/iVb8WgzkwKaAg4e+JdL3HLUgPx5r1Oj+mEGE7WUq3eYikfJpIqw=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB17801.jpnprd01.prod.outlook.com (2603:1096:405:34b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 19:08:57 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 19:08:53 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off
 clocks
Thread-Topic: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off
 clocks
Thread-Index: AQHchWt8/8Xcc6HpdkiYg0CMgbNe6bVa6hMAgACLVYA=
Date: Tue, 20 Jan 2026 19:08:53 +0000
Message-ID:
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-4-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB17801:EE_
x-ms-office365-filtering-correlation-id: 51323c8d-68e0-4704-1bba-08de58575a78
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmdvdnUyOEovbEFhbldRQXUwVW1adU5WOEdZRzgxMFNTN1FSRk0xclBMSUlw?=
 =?utf-8?B?RXNZUWgxWXd2d2F2dmxycEJyV2hLd2hlY0NPakpHbHprM3ArTlgrejVJazJt?=
 =?utf-8?B?Z2NaMDNZaXdEOXZXZE1DMFBISGxNd3d5VUtqVUErQ3cxUEsxSnIrNEdSWkxQ?=
 =?utf-8?B?M21LZkEzRVMxN05YTklwVjN1WWdhVkN5ZGdMUndkUzhLdG5LN25QSUo0S2gz?=
 =?utf-8?B?Smw1S2M0K0dhZ00rVXZ6UEJvcjVHZlJPOE9vZWhBYUpWOFhLU0R2TWdMdndO?=
 =?utf-8?B?bVlDOWU4MkNpUkQ1OUpRSnBIdDhEMFVHS2VZZWdlSGVmOWVuMTdWSUpaUG5F?=
 =?utf-8?B?T1gvSXJiK3FnM1VaMHpPUWpjSndOZDBGcnVicmZ3OUNzK1RrMWthRWRSa0J0?=
 =?utf-8?B?VTV4T2tqYlVRYTAvemlhSVVhM2hHOGpqMkFHRmsyWVdTanM1cTFtWllhS3hl?=
 =?utf-8?B?T1RGdUtYR3B1VnNkNm0rRUVmWkU1UW43ZXpiejIvanF2K3p5YkpENjh2T1Q5?=
 =?utf-8?B?djVOZnQ1WW4vSXI5VTFuTy9yakE0ejFkdTNmb01PM0UrQjNJMW9aamljek5l?=
 =?utf-8?B?UDNVMDVsSU94WVYzVDVMUXh2YkFzRWFPdVh6QmQybWJ0Y0Y1UVUreVhwd2V4?=
 =?utf-8?B?eFA3NG1XalRxMmo1bXdsZURaSFgrWVgvQzAzSmJNcHF3aEVKcys3OXVhVjcz?=
 =?utf-8?B?emtmdzZwelZLMEc5N2hOcVppRk5KZTFMdGVsTS9Xb3pSUFlCQkl1UzRZMEVr?=
 =?utf-8?B?c0dVbHFOSy80QzFaeEVDRDBZVDFLeTBVQWJoUVhZUXZjL1JzamVMRFdGak94?=
 =?utf-8?B?aWdJcDdCMGNiTDk2MGQ0WVZ4dkdpOUdoMDlPRlRkeTdPOG5uUjd1NGR4Vng4?=
 =?utf-8?B?SWsyMW5XTGJSbEc4cGM2amZocnZ2azBRNitoMm5MSDBlcWZpR1NaTk1BSC9a?=
 =?utf-8?B?bCt3Z0FIQ2ZGNndWT2hDU0Vod2w0dGt1SGVtVC9rRlJ2OUswdzJCc0RDQWFs?=
 =?utf-8?B?ZW5SRUVUVDl3UVZ0a2ZRQzVhRE8vc1ZmV2VUQlNBckRoMi8xdkVjMSs3WTBV?=
 =?utf-8?B?MmtUSlVEd0NBTmIzWWhMcmM0R2J3UDJoc2E0aVR4YmJDMXNmZ3FOUWNucDBq?=
 =?utf-8?B?VVdacTRCNGpqanp4WVE2VlpFS01uQkFsQ2tieTdnczJvVEtNYVlsQU05cGty?=
 =?utf-8?B?Z25xaGJsU203WGhRMUo2THFNV2Z6UUFqdFFZK1p1RE10QzBNSlhsanJVQjJR?=
 =?utf-8?B?SXZrbUtmOXNMQTlnQ1A1QWNwSVllV0F2U1pWSWsyeEtWM3pNNWNpQ0d0S2dl?=
 =?utf-8?B?MTJjb01hd3pQcFpMN0FKMUlJVEZvNXVnRlB0VCtqaHoyVE5HUXRSL2tJaEJH?=
 =?utf-8?B?clBjTnRGMURLN0lId3lTME91bjlLbmsvbWtnUVlIc0NlZy9FbU9Tb1lkbWZF?=
 =?utf-8?B?RnRXeTh3MnhyVXVQenUzc29WTnZWMjcyNi9qNTFMNnFqTkNGdFNhR0NHSDBn?=
 =?utf-8?B?T29VZitRVm43SnV4b2NlWTFJR0lxcGFWYzJiTHJITUh0eDJHVFJoRW5SM2pJ?=
 =?utf-8?B?eGp1dHAxVDUweGF4OCtSYktTRVdkbGtSM3RYWTlaWmlRa2pBdWtyYmdydXNJ?=
 =?utf-8?B?Z3hReTdmU1luNHdJQVdUSU1CaDg1RmJHVlk2b0xhNkduV1E3dWpFckU3c0JL?=
 =?utf-8?B?RUhrRlBnUUpjaEl4cXhrU3hLc0FMOE9VT3ZMN3I2cTJZV2dJUXduNWU0UGRQ?=
 =?utf-8?B?dWZwMVVvYkpFUVgrbEZOSmFmQzJmZnY3aGpPQisyVVNyRlFtM0p0Q0gvNEtm?=
 =?utf-8?B?Q0tPbW41MU1CaGFBRHlROWtEUVVzU3hQNUtqTm9aS3M4MlprWjk2NEJkblB5?=
 =?utf-8?B?N3RZaDBhMWVGUmpXeWNnb3RVQjV2bUNWbVo4MEFMcXpUVjhjZmJ6NWY3c3Ju?=
 =?utf-8?B?MnpsSzJBNzQyUHNkdmhQUk4zeHRKN2tiSTFWOE5GMFVFVkVENVkxcmhIeGwr?=
 =?utf-8?B?cStFdXZkeGI0YVZEZU94eDRSbVAzaDVRTm92UDEzSWhGcUtxdmM3aHB5TGZG?=
 =?utf-8?B?TEVEajJBQ2d4MFAxdGVjTVFtRlFwS3orSDZMdHluV3ZKUXczdnpMMW1raEQz?=
 =?utf-8?B?M0YzaW93WDJPYkFJM0c0UUorQ2tYSisvVDVxZGRZMGNoZnNmNXE3WURnMmt1?=
 =?utf-8?Q?J5gEw0hfk1G2RxbqCce7OoQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3NzNGgzbmFMQWVOWlZJbGRKQ2M4Qm82U2x3SWxpVHZEVGVDMjhFTmV4YlZr?=
 =?utf-8?B?RUx0blBnUFNVSjJRUkRxRjFUNFlnMHVMeVJIN3VlWVNRalFvY2xZR2EyTVBi?=
 =?utf-8?B?ZE4wME1pN0h2aE8vcGJ0MHpSWEp3Q3AzS2pERFJZWCtJSFkxZEx4dktvTXl0?=
 =?utf-8?B?Tzh1Ti9Cd0VMRWtqVyt4eTAvSXBnVUVobjNNTHV5SVhpRHpSWmNtVDFURGFR?=
 =?utf-8?B?dFM1UndDSWVNZkpjVExtek13R1B5MGxYclYzY1FNOU1kYjhpVHROVHcwZ1Bh?=
 =?utf-8?B?VGx4NXhuZ1JYdDJBaEVXQXpBUFMzMjc0WWhTbDZETFlNZnYrRmtNbWI4dnIv?=
 =?utf-8?B?T0lsZWFnbnNyNFUraWE3ZVRlMnR1QUw2MzZYL0M4blhTVzZKSkdhQVA2NkRK?=
 =?utf-8?B?QllQbUlWajRjL3l0c2RqTDg1anRwYm9XeUdzWmxTV2E1WkY4eWdRV2FaTm9o?=
 =?utf-8?B?UHdGVTJzUmErQVNxQ3ljYWxKeXpWOElla1N2WXY3a0lEc3B5bXJJcHdNZ29D?=
 =?utf-8?B?WXl4T2p1Sk51MTdQQ2VRRGZYZy9JNmwyQ1gxOERDMCtRUU5YdDQvWWZQNnlG?=
 =?utf-8?B?elB4QVpISXlFMjdWTy9PbWovSy9NWENHMkJIWk9Zb04xQU5FbE9zTUVOcWox?=
 =?utf-8?B?UzBhdERoTG1sTXNWbmxrWmFGbFRqbm90NEpua2U0M0w5N2NrN2pHa0s0UWJj?=
 =?utf-8?B?UTJmSWIxWmp1ODcxTHlhY3NIVWJFcjdYcFVVTWFrUEIwUzlIZWdSVVpsNTd0?=
 =?utf-8?B?czJYZlRZRFpkZ1NGTmZTdUhCSmJMQ2RBZjYyT29QZ0xZZ2JYSXFkRE5OWkJm?=
 =?utf-8?B?WGM1aE5Ha0FldkhqUElXWkc4MkZYVTJlN1VPV0ZIOGtGOFpIU05EZXdUdzRh?=
 =?utf-8?B?N1dBbFRXWldUN0VJeUdJSkhJQXVNdnFvOW8wLyt0S0QweGhsSnZiNkFjVEV4?=
 =?utf-8?B?UXFkeTVqWC9hbVlrL0NUeEJxVTkrNndmaC9qQis2LzdzRm01ZmhNMG80YTZZ?=
 =?utf-8?B?TlZ0OFdxM3pWZTMvTDMyZS9teWloc2lOdVRYM1FIMTNPclFmYVQzS1NvR3JR?=
 =?utf-8?B?SmRjUFlhc3lQTlUxcTBwdEljbHgyZmtsRmVrOTBneFRPcllBRmxFVGMzelBG?=
 =?utf-8?B?RlcrMFNyTEVBN2J4Y0VIZmN5ZnZKak5qTkc5WWUvTER1UEU3WG5VUldxRDRx?=
 =?utf-8?B?RUxqTmdpWjhBdUgwSWRDSXBBS1VDUnp5elRHaURxK1h5dkNpRms3cHcxNkFP?=
 =?utf-8?B?WXlpQWp4NWsxcWNqcUsvOUM1Tlpkbnk0NHFxRjM1NkM1cFlyQktmUFR2Ryth?=
 =?utf-8?B?U0htc1hzR0JOVUVPYkQxU09ucHhhZlVTS0dpT21zTjhLaEJ6SEJ0dzdQRTFp?=
 =?utf-8?B?QTBvVnpoTzJDNHlVVmZwbGF6K1k4b2wvLyt6MEh2ZUhyT0l0T2FUN1drRkY5?=
 =?utf-8?B?RjFMaUpqR1VyUjRWbCtLZ21KblovVW95Sm5DemFxVGRaZUNXVnZsek9RZ25C?=
 =?utf-8?B?VytCemwxZzkyM0VXUDBsZ2J2VVQ4Q0FRMWNLeE8xTUpQbEhkRUdIN3JKS2FP?=
 =?utf-8?B?VUZvYjBnQm5peCtvWXlCc2Nicmx0bDBxVXN3b0ZPVzRKdFVhc3NVelRiVlNz?=
 =?utf-8?B?emJzbllQNnZOd3N3d0VZWkJqWGI5ZmR0bzR5cURKV2VRRkRzdUpkcUlRUWVP?=
 =?utf-8?B?d0dEOEJLbXZlcGY5WmR6Q216cWpVbHdFbE03SVpvbmRBbjRDMERWQmo4bUdW?=
 =?utf-8?B?TlpXamwyYkJUOGp4SEFXbjZ2T0RaYU5PbUtCYVpCUDlhM2lpbTA5VXNWNGgr?=
 =?utf-8?B?bUpGNnRZdnprL043VTB5Q0lwMm9OYi84SDdCbk9uNGd5L3hFU0VQQTlHaWI3?=
 =?utf-8?B?VGFNakdKcG9UK1MwRDdvZE5leXJhSmNaRzZGOTRlVW1ycGRRTEVSaEZwdzk5?=
 =?utf-8?B?RnFRMmhUbVB1WUZ5NFE5c09iV016NnJMS25QUURPYjZ2YkoyL081a0cwRVVu?=
 =?utf-8?B?OE5yMTRQTVZqZFk0UjlwNUFlcVFtR0RHcW0yNklHNkYvZ0JFYnRObnJJeUd1?=
 =?utf-8?B?dGRNallLT1ovVkdFRnRCK29tb1NIS2dwSlJNMjJCKysvTnRqQUNsNmVLdnZT?=
 =?utf-8?B?VUFBNGxvSWY1ZlpUWDd2Q2lBWGFsTWRBVE9MRHIxUU1uV2hFQ1p6UnNvcUlI?=
 =?utf-8?B?c2Z4UnVZMCt6L1lXdzFXejRNMHdCNEh3SWJlNERYYXpUR0E5Q2JLL0p3Y1dt?=
 =?utf-8?B?Zkx3Vkd2YVNGUXo5dXBmQllsQkR1eEg2S3pTQmxyNy9xVGhBTzQ2Sm1Zc2hu?=
 =?utf-8?B?d25KZDZyd0pOVkJNY3Vkc045UFJ3TURzT3dvcktCTjh1NmpNeFVrZURRKytR?=
 =?utf-8?Q?QfbLCoewTjKc1W8k=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 51323c8d-68e0-4704-1bba-08de58575a78
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 19:08:53.5786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7gO0Tv6M9WkE5sXWFMwdTRBAs1nK27BTsFw2r5O1tXiex5ilONt0xKfMYKkgyGTSIUXMlk7UKXYyiiWaxozV8MvH0Yd0+Bo+hL3mO2WSWGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17801
X-Spamd-Result: default: False [2.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27146-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,glider.be:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 6CD454B0E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsu
b3JnPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIwLCAyMDI2IDExOjUwIEFNDQo+IFRvOiBK
b2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMDMvMTZdIGNsazogcmVuZXNhczogcnp2MmgtY3BnOiBBZGQgc3VwcG9ydCBmb3IN
Cj4gaW5pdF9vZmYgY2xvY2tzDQo+IA0KPiBIaSBKb2huLA0KPiANCj4gT24gV2VkLCAxNCBKYW4g
MjAyNiBhdCAxNjozNiwgSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29t
Pg0KPiB3cm90ZToNCj4gPiBTb21lIHBlcmlwaGVyYWxzIG1heSBiZSBsZWZ0IGVuYWJsZWQgYnkg
dGhlIGJvb3Rsb2FkZXIgYnV0IHNob3VsZCBiZQ0KPiA+IGV4cGxpY2l0bHkgZGlzYWJsZWQgYnkg
dGhlIGtlcm5lbCB0byBlbnN1cmUgYSBrbm93biBpbml0aWFsIHN0YXRlLg0KPiA+IFRoaXMgaXMg
cGFydGljdWxhcmx5IGltcG9ydGFudCBmb3IgUENJZSB3aGljaCByZXF1aXJlcyBwcm9wZXINCj4g
PiBpbml0aWFsaXphdGlvbiBzZXF1ZW5jaW5nLg0KPiA+DQo+ID4gQWRkIG5ldyBtYWNyb3MgREVG
X01PRF9JTklUX09GRigpIHRvIGRlY2xhcmUgbW9kdWxlIGNsb2NrcyB0aGF0IHNob3VsZA0KPiA+
IGJlIHR1cm5lZCBvZmYgZHVyaW5nIENQRyBwcm9iZSBpZiBmb3VuZCBpbiB0aGUgb3Bwb3NpdGUg
c3RhdGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUu
eGFAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBM
R1RNLCBzbw0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4NCj4gDQo+IEhvd2V2ZXIsIEkgYW0gc3RpbGwgd29uZGVyaW5nIGlmIHRoZXJl
IGFyZSBhbnkgcG9zc2libGUgYmFkIHNpZGUgZWZmZWN0cw0KPiBvZiBkaXNhYmxpbmcgdGhlIFBD
SWUgY2xvY2tzLCBlLmcuIHdoZW4gUENJZSBpcyBpbiB1c2UgKG5ldHdvcmsgY2FyZCwgU0FUQQ0K
PiBjYXJkLCAuLi4pPw0KDQpJJ2xsIHRlc3QgYW5kIGxldCB5b3Uga25vdy4NCg0KUmVnYXJkcywN
CkpvaG4NCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3Mg
bG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4g
DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=


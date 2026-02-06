Return-Path: <linux-renesas-soc+bounces-27972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMQ5L86thWkRFAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 10:01:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4B4FBC0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 10:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 84B0A30215B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 09:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCBB352C4D;
	Fri,  6 Feb 2026 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F27b5LhN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7BA2848A8;
	Fri,  6 Feb 2026 09:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368454; cv=fail; b=NiRyRvaKw9ckF8SJCUs2IRKzK0lzlEVsX7dwQc7aLRCJLhTMAjcoOxxDo4W5fXlLMC1YkGXZWiLrP7+sIQgB71bioHDg4lXEXUvRcPMe3mwlPwqjySZzxb23s6CW2pojQb3HbPRgzaXKuKRNeLC7EuwNsLRXokOdly47nymLDCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368454; c=relaxed/simple;
	bh=TGt2kDJqn5hgxizNGGNucqfTTLIbgrINxuYpCWn1SR0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zyqnq/EWor7OY6Ut1vwTZGcKiwZJAW9GKhIK0z/WF9qcd3gcspCuNCZZaGgorD0QYL+orRu5/SmqOzsffNwbw2StSEcrwF1+8piN+5XTaFyICE/taNerDVvol4e8N3hUiti7Hm5pJ7s/754OQTB6SsL9zcCp0Ou6ocZwR9KUcPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F27b5LhN; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6ABanymrgMdr2kx0v+qw1GRz6Nx8krYGZ9/18nWzYGXNtOEKVYkc6xummVV/ICcHMosih/RXC6r0Z+2i2vshTVYHSn1prUySI6h0nXDLZEVtQECT5yK5H83LOTvk5s4o1GRDMPYX1Qxs9bg0y7xZVlaZ87gz6GY2yK1x4KZKxoLwWJoVDzf4gIFXn30V4kYTTYueetesNA/Ar0i4WO772D85jQc9CoICU+ICpJFUxM2O8FjCcMfQelkvJgNjQYvhycIY6Knv0hBijtrHQotDPDLjPBQ0+WPf27oYThZpKH1dqhUiqYbcrWA+4vIdQoD1lGm3NClIosKU0V5rli6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGt2kDJqn5hgxizNGGNucqfTTLIbgrINxuYpCWn1SR0=;
 b=Eh9l1ZI3GR7Be2dQER9wx/PrSUpAmv8n0FkjukmG0kwQgznOy5AAPVOSJZJ+UR2GxbmQBmSmMwLO/sG5zw/PKMEcRxUMpZh//QO/LEOhF5GEJTg+MoHk0/4g2Sa3A2cEZ3fz2vNBEBYix6RGmvRtAaU1WlqJg9RHA8ad38i8ikAStX3KXKBPtfE6y9jTuIJ/K/wI8o9FDuTKg3tsTvmZi/qamxY+E45VWLv1JKTnaDXtKvaaKyyWKXKNRS0SjegUEbV6jTakdljZcpPGTCvFGuXBCIZ4kpUz1wEuxFnpGXhw+2rWcZyA2sJJ8x/RTYamOx8WbMN1g0bncX5u7Kqljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGt2kDJqn5hgxizNGGNucqfTTLIbgrINxuYpCWn1SR0=;
 b=F27b5LhNWNm7rCWS7VeIDjcmZULIWPqKIfIckRKxAPThkQqNFKQYcDw2nYNC550/T971VGQTjTqjLG0tXeurqIuf6PdNQNc3LtAMq0GYvX3GFTYQ1cPPXLFUT3pHNhrrJ5ZEjD0abB850erFQrrehHFFp3yQyqDe4CsH+eSMF+o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB11412.jpnprd01.prod.outlook.com (2603:1096:400:371::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 09:00:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 09:00:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Thread-Topic: [PATCH v2 2/9] dt-bindings: interrupt-controller:
 renesas,rzg2l-irqc: Document RZ/G3L SoC
Thread-Index: AQHclgEDcbAVpLyUFU23SDB8GOyYlrV0HZqAgAFEHSA=
Date: Fri, 6 Feb 2026 09:00:49 +0000
Message-ID:
 <TY3PR01MB113468BD2EF1FDF310EC3B3CF8666A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260204180632.249139-1-biju.das.jz@bp.renesas.com>
 <20260204180632.249139-3-biju.das.jz@bp.renesas.com>
 <20260205-polar-gifted-lionfish-ef8a8d@quoll>
In-Reply-To: <20260205-polar-gifted-lionfish-ef8a8d@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB11412:EE_
x-ms-office365-filtering-correlation-id: 01dc8baa-378a-46ec-7dba-08de655e3961
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bm54NmRWZWNDMExoeEhkNVY0dmdiUDZMbGRBTGZKdnQxbDZQUHJZbzlQT0ll?=
 =?utf-8?B?dTJ2OXVxM092SGIrZEdZV1ViaWI5MHgzbFMveUFQYUM4dzVZUzU4QVAyNzFa?=
 =?utf-8?B?YXpWdzNXekVDeW9rR1BhZklFM1FXL0cvTjNuV0x5MnVaclpZUE9KVDZ1V0Zx?=
 =?utf-8?B?NEpWNzhJcXlFZkQ1cjBVakIzSW9ObmxJNkp1ckR0eDNWUG9JVURQT3VhbDdC?=
 =?utf-8?B?aTlWMEhQeUJoQW14ZEVYczVKME1jUVo3bk50Y2V6aVFlaFRveFpLSEMraHMw?=
 =?utf-8?B?amx5ZlJhVEZ1ODBUeUwvWHI0QlBRNTlnNUtDVG9nZnZjZkY0aTg1bGViQStD?=
 =?utf-8?B?d09SemplQ0VUV2o0bEdHNHZidFdzcVFDRHh3N1ljQ25ObDduUzh3OFhhd0hB?=
 =?utf-8?B?SnpRYVk4cVQ2REJWRkRjMkh1TmZtV0lOSnoxVHNFaXdwWXJPR3ZRd2xWaldz?=
 =?utf-8?B?NW9kRUVIbFdkcGR1OUtxSVNNRm9zclFnY25rNENjM3o0YjdFWktJYkg3SExE?=
 =?utf-8?B?QVZRaHlPN1BNbS9NL2ZpZTFueEkzbDZ6Tis4aE1QWWYxR20xcS9lZGlMYWtX?=
 =?utf-8?B?STFGN09tZlpLMm10VngwNEsvd0lUZkhjR1NSTXRVN05RZ1I1SXI3cmJ5Wm1m?=
 =?utf-8?B?OGk4eFdZWkcvbmp3dkVabU5qekFTd2NUMUROeW12RmpEWk0rSkw4ckZaMTBw?=
 =?utf-8?B?ZGdtWG1qOEFabks0ZlVERkhNTHZaL2VpME42YjVPQ1ppZ0VtNWt0akw1b0p6?=
 =?utf-8?B?NU9XVk1vUExlZjRSWGVPR25BTDluYVExWDZ6cXBsNGhlQWlqemw1Q3pQN21T?=
 =?utf-8?B?dlhGVjkzUkNDYXVhTHBlUmROVEFCVmJHd1NPNXN0Mnc5cnpLUGYwSVJ4M0tz?=
 =?utf-8?B?aW9zRlRPRVhWQTlGeWpqSkllYkdWMTIwb1lCR21YK2hCY1JzdFJnRHNBckdU?=
 =?utf-8?B?eVZGUGFKOU1GUWExNmFLWHRjTHpNUFIyUFY0bXdmV21MUWhrT0hlRU9HUU1Z?=
 =?utf-8?B?UFdUUGttby9vWVNjeUlNU1FVZ25JWFZBY0Nsc3U0S3dGeDR6VGd6ZlpBL2li?=
 =?utf-8?B?RTdXZUxNL1I3czZ2TEJCRXBmN1hqdWwrTlorWmt0dDNEb2xHK2pCN2RkNVJY?=
 =?utf-8?B?Z1IyNFZlUHllZEwvVkFOTDY3K3RaUUxWNGNXZVJEeDhibGxnVEpubjMwYWNj?=
 =?utf-8?B?b3JVRS9wQnEzQ3B6MFVvTktIR1Ewa0JOY1NyTS9PRmR6VDFOUnQ0US8wMit0?=
 =?utf-8?B?WUo0VjM0aitJMmcxK1ZOZU4zNXJmL09uSkdqWmgxRlUzQVlKWmxVV2NMNnhn?=
 =?utf-8?B?MnVVUGV3WFg1aDhKaHBhMGF5SlVUZFBFU1BQOWdaMWtHb0VMQ25BRXhBWWRG?=
 =?utf-8?B?MDc1UkVlOENXKzRmd3IvMjlsSmE1cTlRRmplMCtUYWVvZnUxOVM5bW5PM3dm?=
 =?utf-8?B?OGZhaEJsTUxMM1JZaXowajQzWXhuWW55b1hhenRWQUorakpYMzQwRjF5VUxH?=
 =?utf-8?B?YlhnSG1CUzZpQzJlSStQRkdGVThOYmZsVlVuUGs1RDRmU3VWWFJvSlJjNTF3?=
 =?utf-8?B?K2E0S1Q2UWcwZnlKUHoxRWltQWdFOXVBeGtVUktRSzgwWnRjajhpVzFpWTBQ?=
 =?utf-8?B?Q0VCSFdwL2QyUWR5VVNjQk03RWQ0V1FrYmRpWndpMy9CNzZRbHFKTW5adDdM?=
 =?utf-8?B?STdxZDNLcDZiTkFRWG1XUXZwdVRzS0U5dmtibCtUU0lHblIrTlRYZFlJZkQ4?=
 =?utf-8?B?VTI1YzNqU0diRk1VaEpvTlBIV3ZxaXZLSEdYZmtCektNR3g0TUw3d2EybXNt?=
 =?utf-8?B?elZ4SXR2S1ZZaG9neG80WmtIcXNvNmhDckhZWXphaEIra1hDVGZkN2c1ZFov?=
 =?utf-8?B?YnplQlN6ZTltYmpzWGZmbUZROHdYSDEyc3dmZmwyc0RmQWdmZHozc3FDdTRH?=
 =?utf-8?B?REdxcExOMDJ4c010SERWVHJCdXMvZkVjbVV0RkRZT1g2SVN3eUtNTXNSQUtX?=
 =?utf-8?B?eHE2SWRwaFYwd3RtQi9LdkplQUxPSE9QeTFuS0N5TW1KYk1NTTBURHluOFhv?=
 =?utf-8?B?ejhqZU9jNis1SGp4cjQvRU9wQk12YU9scGxuaXFlb0I0YWo1TGdnaW8rTmxz?=
 =?utf-8?B?TG1TQnI4U2RsbTZkVnpUbXRnRWlRSU45bGJVa3ozOTNZOFM4dkdEVFNxOG5M?=
 =?utf-8?Q?0y2xgMAwsGUkh3LEKYUu6qs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTMxQVpxT1JSM2xzS05ORmZWWElna1VWT3RjRVJLc1pmN3FNNDI1VCtsazU0?=
 =?utf-8?B?RGxTeGNXTUlxVUUvcDhkcmJ5WmZScXIwOVl4Ymljem9oZXVhVkE2VFQ5TDMy?=
 =?utf-8?B?QlViSi82WWdXRUJ0WGl0cElCL0VjTURBVmttRWkzUUw0ajNGRDBZMmtoQlhK?=
 =?utf-8?B?TUpXNi9mZkFUUWViQzJWcWw5NXJGSmJLSW1hVDVJVG1LMHYxZlcramUyVTdk?=
 =?utf-8?B?WGNTTmN4Ly90NTNsTFRHelJoK0QvdGlpUHhHRHQ3QVFYQzZLNURrOWs2RmZ6?=
 =?utf-8?B?MnJIWFRmb3lVNFI2NityeUliNktoQk8zSEZRWDVuTkVxTUZHR21Jd2gxSW1M?=
 =?utf-8?B?NkkvREM4OXlvWXJ6VmNvQ2hJRzYwNEZ2eElVNWppNFhsc29jYk1aeGNiNjUv?=
 =?utf-8?B?UWRtR1hhZ21sUyttZzNQd3FxcHFjcUNQMnRIOUFTUGtsOTE1L1ViYVhabXR2?=
 =?utf-8?B?NGZxWTlCYXFkb04vNnBKSXlvVExMSzczTitCekhIY21HRmhjcW5ZR0VPTVZD?=
 =?utf-8?B?c08vWWY0cDI5ZUJBdCtGT0lNVEh1YUoxTjVxaFQ4cHZjQStoWHZodGR4UWR5?=
 =?utf-8?B?V3E4ZkdPZkI3azRQVVVzZHFiNmdiZGF5L1E3MjhxS01XQ1hON3NxbDRhQmg3?=
 =?utf-8?B?WkZNL0N4Y0xRTkpWSUtwQnRjTDZSK3d2OGlwVHNSZlVoMnk3TVNTSW9KVzNM?=
 =?utf-8?B?ZzZaSzhWYTByTlFSOEtPVkxkU3BiT3R2S3EvcjQ1MXh2cVRHOGNBMnlWV3hw?=
 =?utf-8?B?SGFOTnFQRHltZGhDUlNvd1JKRkMvTHZ6dkQwTHpXWHFEUFRYdnRoeU4rdlBj?=
 =?utf-8?B?MDNBeVhjNUl2ZklKYTlBWCtPTVNoL2FWZTVyZjlDcmdBYWNwTmVIelo3ajRS?=
 =?utf-8?B?bjJ2UVUwS3RKQVFiVk5GaFc4VWwrM1FxeXpja0hWM3UwRVVpVUlHdVFmazg5?=
 =?utf-8?B?OSs2SXNibkhHRjY0NkxyZDc4WDRTaHN1NU1FVXpKWm5NNklMZGRyOE9XUFh1?=
 =?utf-8?B?aU9HUEh6M1paUUNjaDlUVERMTmRyQjRQdEYzam81bUtYRG1FRXd6WnFvVmlB?=
 =?utf-8?B?cDB3OEsrTjRiTVJhR1BIcmtUc3ZQZnlIcTBTOC9tWDIzWWl2ckpieFBPMzQ4?=
 =?utf-8?B?VzlnQVhmZk9lU0p0aTdiRTBUcW9hQWQwK01zN3JPUWNWVGJCUmZtVm90bmpq?=
 =?utf-8?B?eTEwT0VxY3VOeGRrcUlRS2kwcjMxT09sTEljTWtEN2ZyTFdqUmxzWWNoZEMx?=
 =?utf-8?B?eDVNV0xBZnp4bFZuZFU1Ymxpa2o3S0d6aCtpdGdrSFBqMEFVN2w1T3NKTzQv?=
 =?utf-8?B?QnFSSE4zS3NNd3EzVXRjT2tYdVpTK2JMaFVYTU8yQ3BoNllwc2Z2YkdUN09W?=
 =?utf-8?B?b3JPN0VKU1VpbnQ0OU1WUU41anYwZXZGM0Z2WDhmMlArUTdIK1p6aSt4b1gr?=
 =?utf-8?B?WW5UNDMzWG4zT3dxTnk0bW1hSUN3cmc3N0JibHg0UUVIcWxoS1RBc24rZG5h?=
 =?utf-8?B?Zmw5QTF0SnhrN1J4TDJ5SmRTcmJpUHkwYkp3YnlWQ2tzSHkwSjFXVUplU1Vj?=
 =?utf-8?B?WVlrbTRvbStqakRURU9sU3ZLK3N6QjBlN0ZUY2tBSjNTb3J4Q01zT0dwNTgz?=
 =?utf-8?B?NjdCTlhndHpPMUFuNlBpZ3NyOVBPWnJMemRLSHc3WW1YUnY1TEF5V0lmOXM5?=
 =?utf-8?B?bGdsTHUwOUJ0KzV0Z3YxVEVyNXpFdWZLRk9KVkVmN29ROTRTWDdCVlNwUWtI?=
 =?utf-8?B?NEJ2SGh2cEFhWTZ3MHQxUC9JOWdQUDVXQi9HN05JRWsybURHbkJUZVRWNzdV?=
 =?utf-8?B?SUswTXpobDhTcGVjRDlHcmd1SUpJSjhEQzBuUisxWmJHZXo2UjVPb1BWTldV?=
 =?utf-8?B?OUwvWHNoOGRwM3J3b3NrZ2NLb1ljNHc4REpiYXlybVlqcDdReXR3VGdrVDl0?=
 =?utf-8?B?VkMzandROVpmbFZiVGI5c1JSUzAyeFZuQnRJQ09pYkdoT2FJcG5Yd3ZKRnhS?=
 =?utf-8?B?bDNxckkraVFkZjRjSm1Uck56Zk9aZGlseGVJdC9uc3lJNTI4bWJFenhMck1q?=
 =?utf-8?B?d2FYVVFTbGFHKytMSVlLZFNudlU3RlhJcUJmcitaR2FSdUxXb1VoVHdCQVMz?=
 =?utf-8?B?MEhXbTYwbWYzOUR2dGF3VC9ZZG1YVE43UmRBZ2lyckJDdXIrd0JJa0Z3OFNK?=
 =?utf-8?B?NXJQSTlieUg0RkhKWWFkOU10UXdWbzdzZG9RWDhRN1ZRbkNFZnhlMXl2aTh1?=
 =?utf-8?B?YVVtZnlHMzNORFpkbVdKMEliSzhpNXc3UDZVTTBodFZOU3pSR1dpTnA5NVpz?=
 =?utf-8?B?dURBcndSWjZJZzFpT2FSanM3S0tHbWZwbUNMUHpWSWNPVit6bThuQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dc8baa-378a-46ec-7dba-08de655e3961
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 09:00:49.6373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5RZFn+kOB2eENEIW7EwI80/M3OEL2rk0j/Dw0emKArUF8VfqqGGtArxUnEGOzD+Aq/9BxqJMr6Q9ngEyIMLFD0l69B02Lk8KE51ReRfYreE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11412
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27972-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[bp.renesas.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: AD4B4FBC0F
X-Rspamd-Action: no action

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwNSBGZWJydWFyeSAyMDI2IDEzOjM5DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMi85XSBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6
IHJlbmVzYXMscnpnMmwtaXJxYzogRG9jdW1lbnQgUlovRzNMIFNvQw0KPiANCj4gT24gV2VkLCBG
ZWIgMDQsIDIwMjYgYXQgMDY6MDY6MThQTSArMDAwMCwgQmlqdSB3cm90ZToNCj4gPiBGcm9tOiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBEb2N1bWVudCBS
Wi9HM0wgKFI5QTA4RzA0NikgSVJRQyBiaW5kaW5ncy4gVGhlIElSUUMgYmxvY2sgb24gUlovRzNM
DQo+ID4gU29DIGlzIGFsbW9zdCBpZGVudGljYWwgdG8gb25lIGZvdW5kIG9uIHRoZSBSWi9HM1Mg
U29DIHdpdGggdGhlDQo+ID4gZGlmZmVyZW5jZSBsaWtlIGl0IHN1cHBvcnQgbW9yZSBFeHRlcm5h
bCBJUlFzLCBHUFQgRXJyb3IgSW50ZXJydXB0cw0KPiA+IGFuZCBhbHNvIGhhcyBhZGRpdGlvbmFs
IHJlZ2lzdGVycyBmb3IgR1BUL01UVSBJUlEgc2VsZWN0aW9uLCBzaGFyZWQNCj4gPiBJUlEgc2Vs
ZWN0aW9uIGJldHdlZW4gZXh0ZXJuYWwgSVJRIGFuZCBUSU5ULiBIZW5jZSBuZXcgZ2VuZXJpYw0K
PiA+IGNvbXBhdGlibGUgc3RyaW5nICJyZW5lc2FzLHI5YTA4ZzA0Ni1pcnFjIiBpcyBhZGRlZCBm
b3IgUlovRzNMIFNvQy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6DQo+ID4gICogU2ltcGxp
ZmllZCB0aGUgYmluZGluZyB1c2luZyBwYXR0ZXJuDQo+ID4gLS0tDQo+ID4gIC4uLi9yZW5lc2Fz
LHJ6ZzJsLWlycWMueWFtbCAgICAgICAgICAgICAgICAgICB8IDQyICsrKysrKysrKysrKysrKy0t
LS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmVuZXNhcyxyemcybA0KPiA+IC1pcnFjLnlhbWwN
Cj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9yZW5lc2FzLHJ6ZzJsDQo+ID4gLWlycWMueWFtbCBpbmRleCBhMGI1N2Q4MDg2MzkuLjMx
MTc0MTEyMmIwNSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yZW5lc2FzLHJ6ZzJsDQo+ID4gLWlycWMu
eWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9yZW5lc2FzLHINCj4gPiArKysgemcybC1pcnFjLnlhbWwNCj4gPiBAQCAt
MzAsNyArMzAsMTAgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgICAgICAtIHJlbmVzYXMs
cjlhMDhnMDQ1LWlycWMgICAgICMgUlovRzNTDQo+ID4gICAgICAgICAgICAtIGNvbnN0OiByZW5l
c2FzLHJ6ZzJsLWlycWMNCj4gPg0KPiA+IC0gICAgICAtIGNvbnN0OiByZW5lc2FzLHI5YTA3ZzA0
M2YtaXJxYyAgICAgIyBSWi9GaXZlDQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+IA0KPiBEcm9wIGl0
ZW1zLiBUaGUgcG9pbnQgd2FzIHRvIHNpbXBsaWZ5LCBzbyBqdXN0IGVudW0uDQoNCkFncmVlZC4N
Cg0KPiANCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVz
YXMscjlhMDdnMDQzZi1pcnFjICAgICMgUlovRml2ZQ0KPiA+ICsgICAgICAgICAgICAgIC0gcmVu
ZXNhcyxyOWEwOGcwNDYtaXJxYyAgICAgIyBSWi9HM0wNCj4gPg0KPiA+ICAgICcjaW50ZXJydXB0
LWNlbGxzJzoNCj4gPiAgICAgIGRlc2NyaXB0aW9uOiBUaGUgZmlyc3QgY2VsbCBzaG91bGQgY29u
dGFpbiBhIG1hY3JvDQo+ID4gUlpHMkxfe05NSSxJUlFYfSBpbmNsdWRlZCBpbiB0aGUgQEAgLTQ4
LDE3ICs1MSwxNyBAQCBwcm9wZXJ0aWVzOg0KPiA+DQo+ID4gICAgaW50ZXJydXB0czoNCj4gPiAg
ICAgIG1pbkl0ZW1zOiA0NQ0KPiA+IC0gICAgbWF4SXRlbXM6IDQ4DQo+ID4gKyAgICBtYXhJdGVt
czogNjENCj4gPg0KPiA+ICAgIGludGVycnVwdC1uYW1lczoNCj4gPiAgICAgIG1pbkl0ZW1zOiA0
NQ0KPiA+IC0gICAgbWF4SXRlbXM6IDQ4DQo+ID4gKyAgICBtYXhJdGVtczogNjENCj4gPiAgICAg
IGl0ZW1zOg0KPiA+ICAgICAgICBvbmVPZjoNCj4gPiAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBO
TUkgaW50ZXJydXB0DQo+ID4gICAgICAgICAgICBjb25zdDogbm1pDQo+ID4gICAgICAgICAgLSBk
ZXNjcmlwdGlvbjogRXh0ZXJuYWwgSVJRIGludGVycnVwdA0KPiA+IC0gICAgICAgICAgcGF0dGVy
bjogJ15pcnEoWzAtN10pJCcNCj4gPiArICAgICAgICAgIHBhdHRlcm46ICdeaXJxKFswLTldfDFb
MC01XSkkJw0KPiA+ICAgICAgICAgIC0gZGVzY3JpcHRpb246IEdQSU8gaW50ZXJydXB0DQo+ID4g
ICAgICAgICAgICBwYXR0ZXJuOiAnXnRpbnQoWzAtOV18MVswLTldfDJbMC05XXwzWzAtMV0pJCcN
Cj4gPiAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBCdXMgZXJyb3IgaW50ZXJydXB0IEBAIC03NSw2
ICs3OCw4IEBADQo+ID4gcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgIGNvbnN0OiBlYzd0aWUy
LTENCj4gPiAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBFQ0NSQU0xIGVycm9yIG92ZXJmbG93IGlu
dGVycnVwdA0KPiA+ICAgICAgICAgICAgY29uc3Q6IGVjN3Rpb3ZmLTENCj4gPiArICAgICAgICAt
IGRlc2NyaXB0aW9uOiBJbnRlZ3JhdGVkIEdQVCBFcnJvciBpbnRlcnJ1cHQNCj4gPiArICAgICAg
ICAgIHBhdHRlcm46ICdeb3ZmdW5mKFswLTddKSQnDQo+ID4NCj4gPiAgICBjbG9ja3M6DQo+ID4g
ICAgICBtYXhJdGVtczogMg0KPiA+IEBAIC0xMDYsNiArMTExLDIyIEBAIHJlcXVpcmVkOg0KPiA+
ICBhbGxPZjoNCj4gPiAgICAtICRyZWY6IC9zY2hlbWFzL2ludGVycnVwdC1jb250cm9sbGVyLnlh
bWwjDQo+ID4NCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAg
ICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAgICAgICAg
ICAgZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDQzZi1pcnFjDQo+
ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA3ZzA0M3UtaXJxYw0KPiA+ICsgICAgICAg
ICAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDQtaXJxYw0KPiA+ICsgICAgICAgICAgICAgIC0gcmVu
ZXNhcyxyOWEwN2cwNTQtaXJxYw0KPiA+ICsgICAgdGhlbjoNCj4gPiArICAgICAgcHJvcGVydGll
czoNCj4gPiArICAgICAgICBpbnRlcnJ1cHRzOg0KPiANCj4gTWlzc2luZyBtaW5pdGVtcy4gUHJl
dmlvdXNseSBpdCB3YXMgbm90IDQ1LCB3YXMgaXQ/DQoNCldpbGwgYWRkIG1heEl0ZW1zOiA0OCBh
cyB3ZWxsLg0KDQo+IA0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDQ4DQo+ID4gKyAgICAgICAg
aW50ZXJydXB0LW5hbWVzOg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDQ4DQo+ID4gKw0KPiA+
ICAgIC0gaWY6DQo+ID4gICAgICAgIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgY29tcGF0aWJs
ZToNCj4gPiBAQCAtMTE4LDEyICsxMzksMTkgQEAgYWxsT2Y6DQo+ID4gICAgICAgICAgICBtYXhJ
dGVtczogNDUNCj4gPiAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXM6DQo+ID4gICAgICAgICAgICBt
YXhJdGVtczogNDUNCj4gPiAtICAgIGVsc2U6DQo+ID4gKw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAg
ICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAg
IGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0g
cmVuZXNhcyxyOWEwOGcwNDYtaXJxYw0KPiA+ICsgICAgdGhlbjoNCj4gPiAgICAgICAgcHJvcGVy
dGllczoNCj4gPiAgICAgICAgICBpbnRlcnJ1cHRzOg0KPiA+IC0gICAgICAgICAgbWluSXRlbXM6
IDQ4DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczogNjENCj4gDQo+IG1pbkl0ZW1zIGluc3RlYWQu
IEp1c3QgbGlrZSBpdCB3YXMgaW4gdGhlIG9sZCBjb2RlLg0KDQpBZ3JlZWQuIFdpbGwgc2VuZCBW
MyB3aXRoIHRoZXNlIGNoYW5nZXMuDQoNCkNoZWVycywNCkJpanUNCg==


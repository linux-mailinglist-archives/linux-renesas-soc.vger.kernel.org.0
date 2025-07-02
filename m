Return-Path: <linux-renesas-soc+bounces-19013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9A0AF0E12
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 10:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 891FE3ABD2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 08:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC3A235061;
	Wed,  2 Jul 2025 08:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QKsvrBTV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97671DFE20;
	Wed,  2 Jul 2025 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445047; cv=fail; b=X/i32yR1yfPdQmnMWYcvbrTauZnMJKKm4vgskTqtH4NI7L2yBwnlqef+KKjuzYGelRy1cejL+jczvUeNa2xg8hlWU5WayFehb111AMIV1LZQEGgYS50SEalBQDBa8QThMTXO82FmAfISaf5onTVhfdkqE7DVXRtn2N+BKWoA1nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445047; c=relaxed/simple;
	bh=NMLcsX5gxFaS8YJVS2KOALPgFAhEeT5Zln7lxb0qjD0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=THxhIwuz7iSNPdXLCrTkKFUK9t5/GU/lRAKQWG4c55pBazbv4SNyCH67IDhgaLRg9+saf5NOh1y5nOaL3IZBzwmNCSPlZqJOImSfx4BnoAwS+ElhJA0Fc8HOZaNnu5STsv7yxj74Wy9YT+b68+X8gzg4aJvgOTCpEextq3wniLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QKsvrBTV; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm7yNfmvwG3Nedgv/7jnpfcNj8vFAeJVQrCUGI93MT8Q6CAbuVlbVxtbYecc7SQI7Y7xPVe2nlJ2D5c/bA9/D7qArgQv0hsqd3b2zC2gIY/Ln/hFOQ/nPsSIRXXxwCBuY/Z5PfV/hYWiyMd3eIFxoykhs+Ot7SnjT36Kxw9s4JH4sxpOKhrIGvtI4GB2B4zXEVy8BtxOoxzobcaSN2g9HMVo1CnvVzZuJ2o5izfXFgnWo8l3xLE49QZPZqcGA6sfL9CWGxmSJUosGwL7qtDuoGW9hi0Sc/NrtC2GdZMo1oueVKKhLCsX5syU3W1c9UrkWokQq0GgfNul4U0sivMgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMLcsX5gxFaS8YJVS2KOALPgFAhEeT5Zln7lxb0qjD0=;
 b=PwKhUQcCk7PAZxUkZWwEgsQ9lCMswep+iy4/wMmuINMWx3b87nWOgLWHXqhLFPALnMt6VKWPoWWBMZteGM7hB4u3QypOIzjYdW2AVJXrbYjsWdpP0mGlYIUN2kHI8sEcz3R3z3kNWrhuPS4rhVBmbeunYSiSk+nUVxgSRR9h+ceNKUQcrCvFtF5rAmIwLpZLB9Dfs+OAX3wjFRC473dJX/u/W+TPVeTIli6hGNiG4vTyVQK3shkyij+L1S7FUmb4dRuy/4fHWo5L62W06RwtX/NmTmMIOkQOuh7wm3f2nx7kRZcLtVLUE3/Q+WslrQJqyUzycB/Y7V/1SOAPsMJJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMLcsX5gxFaS8YJVS2KOALPgFAhEeT5Zln7lxb0qjD0=;
 b=QKsvrBTVIRJLcAic7thQpC+RvMxy7vdPXfe43RcL3rhyMCyTY9Vz/OmmUPluqkzf8WtchPVoDXyMWUdxsdHjGDWEOGNKuVgjGKYlAHI2QjNV8RP0bMl0oGmh+mvFeUIeO15n9gr8N8BoH5kwi7RukjX0KbeP384ew6Lw43TBTDA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB12064.jpnprd01.prod.outlook.com (2603:1096:604:263::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 2 Jul
 2025 08:30:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 08:30:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Topic: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys
Thread-Index:
 AQHbrVNDGj8C8kQeE0eZE1bPrrwQPbPEGWSAgFmCYRCAAAYYgIAALWkwgAAGyqCAAQ1TAIAADD5AgAAMhWA=
Date: Wed, 2 Jul 2025 08:30:41 +0000
Message-ID:
 <TY3PR01MB113465906ADFA0E0248FE47108640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250414153818.214811-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUjtG-EcrpbDO2y8M=GQeV=5i4qODp=VZqymipeCneXhQ@mail.gmail.com>
 <TY3PR01MB11346205BCA481EA7B740A3028641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVNCRGMmgBT2Ow4Af0CTf1iiS=AwhsLnZMFFy40tLYS0Q@mail.gmail.com>
 <TY3PR01MB113462A4490760D5C6C59FF968641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346C70FFD599B85A790B8278641A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWCq7eQ0Fpq6oMFP-n_yZZV8TB2WXV3SgjhW3Wne77CxA@mail.gmail.com>
 <TY3PR01MB1134678E0033ED967A79B4F558640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB1134678E0033ED967A79B4F558640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB12064:EE_
x-ms-office365-filtering-correlation-id: 3a3eb5e0-e0ce-4f3f-746c-08ddb942bafc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z2Y2aGtaTkZCT09SQTlMTG16MmtvMmt3TXV0dGFhMDlVbldBa2ZSOHI5cWY3?=
 =?utf-8?B?WUZpWE94LzNQZlFrQ1V0WXZOejlKN3RnZ2ZzUjM4ZHgrbGlPMDk3SFdxUEFG?=
 =?utf-8?B?S1N6YUkvSm5JWDBxcXdkdWdQbm1aNjN1VVRPd2U5a2x3YXF4elI2RkEzWWZU?=
 =?utf-8?B?V2ZTZlVGMTJjRlNJaGUrQXJqc3ZZUDkyOG1aKzVMT2x4aGRYaEw0SHgvQlBJ?=
 =?utf-8?B?RVRNSG1xbS9yOFAzWGdPTTlCZnQ3bk5wV3NybDEzQlN5dlJ2Mm1YVi92bWtr?=
 =?utf-8?B?OStrYWRVTG1QTUhOcXV0RHN3dHlsYzFrb1hJc3laMUhQd2ZybXFvaDR2L0tn?=
 =?utf-8?B?OWV6L1UrZGZzbHNKRS9Gb2Z5aDFpVC9HSDZhOG5sNStjMXVadWlrU0hJdTlQ?=
 =?utf-8?B?K2RKRHJhWjZVL0VidGlDZmRkMVFwVG9pajNwcFJ6QnpVU1QvUzVyTW9yQ3FE?=
 =?utf-8?B?T09Id3dqMjdBU2ZPemdYWW5iTjNnMzJaS3FzR1FtRnRucUhxKzhUQ3d5OEtx?=
 =?utf-8?B?dzJ0RWIvTG01dGJzOXozWlJDL3hDVlRnb0liWjltdDFwSmpwRDlwT1gzNzNn?=
 =?utf-8?B?aEVGMkhBRjhtQkp2am1BdVVoVEJZNUlxWjcvdGdGLzVMMk1pcUhjNnJrK0FT?=
 =?utf-8?B?UEJvWjI5b1MzOHZWbEVoUWpLNFNUSUdDUEhsMnBoaHhhdUpuc2NtdU5TMHBr?=
 =?utf-8?B?YktpbHk3SVRDdzVXMWZsUjhScVVIN1FIdDE0UWVYRlRkT09YUkI2TWJGRVBC?=
 =?utf-8?B?RHd1WWJML0VxUjVYWnhVb3hKZE15ZktYc0xaejljdUpVRHcxc1JFYlQzNGdD?=
 =?utf-8?B?eTBvc2o5RnFhdzRaMUltS3ZJQlVtOGozWVZRLzMwRE4yTXV0Q1M3SnlOZWNj?=
 =?utf-8?B?bjZEYmFrZmNSMGpZYm05cEppQzQ3NGRuYXJ2RXdYZ21KQUJoaEExM01BbWdK?=
 =?utf-8?B?R0c3QjJaQlFJRURsbFlkRVB0V1FYMjg0ZjdrSnlzd2NidlZ3V09NdUp1NW4x?=
 =?utf-8?B?Y0paSWZIZ3M1dUJsZU1ib0U5SzdvbXlKekpUbm1XMWsyamVlUEV6VjVlcldH?=
 =?utf-8?B?TGZnTWIvcU1rTEZoTVU2K0lScUZNa0Y0dHNPNFd6T3YyWXl4NkhySHNuS1R2?=
 =?utf-8?B?RkFyU3NNWVh4VjFZdlg1bkd0VXZSS0U1L3VQdk0waUJ0TllRSW9aVk1BQlBD?=
 =?utf-8?B?SVNVN3dYaS91ekV0UEd2OWsxVnY3V1B4THYvMHJhQ2ZNWE1ENS9DemtjeTZt?=
 =?utf-8?B?L09VQVZVVWUvblQrL3dFTDRTaUFBVnVkMStUMHRsLzVKeUkydmtYSTVNejZV?=
 =?utf-8?B?eGduWDBDVW9yOW9IWTFwUCtyVndvRUtiQlhZTGVkTUdtL0lhZ3dxR0RVVWQ4?=
 =?utf-8?B?azcrVXkxSEd5WVVvQ29kNlZ1ZXlXcXVnVEovTGQzeVlLYU5jQ2xkcnRkQngy?=
 =?utf-8?B?SGdxd0JMaXp5V09xRzNLNlVlY3RzSzZjTWEybXNod0M0N1VYQ2dUSlBYcUQ3?=
 =?utf-8?B?MDgxRm50L29WT3ZXdm02WWszM0dIRzcwQm4raUIwTjVXWWRPVC9uUjl2M1Ez?=
 =?utf-8?B?N1ptblorS05rUHRzVEpuSTBTN1oxRnlLOWlsVTVrNlM2SHowblpHYWd0c3Ba?=
 =?utf-8?B?R3dNL29ZQkdNd3U5MDZlM0IvNktsQ0RTeU5ndWVwOGdlanEwdTFCcDlzbExB?=
 =?utf-8?B?UjZ1S3hxVVY3QW51RFV2SHJmR1drK2cvZ3hzbm1pdkdpMC8ybnhOOGJuRDcv?=
 =?utf-8?B?blpxTHg4anA5KzJveUMwTzhhQW43MUZnUVcxcmpkZGJYTHN0V1pGN2ZuQnZO?=
 =?utf-8?B?UkNOdjlVS0tWUWVtQmY0Ymp5OSt4SElWRTZHejJMMk5wbTRjZ2JrZjVnbWEz?=
 =?utf-8?B?SFhiNXBnUGdiWmYyZGFyQTZFbkNzMUozL0tDaEtwWXl3WEdWU0NqWXZqWk41?=
 =?utf-8?Q?9YJBrY4uAqI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a2psek94RHBoV003UkhjK2J1dU5ncURPTGpoRHBsOFNMeEt0RFlLOTJzNDcy?=
 =?utf-8?B?Vnc1MjNCR0NzbXVxcTRrWjFpb1VlKzVOTU9xSXkvTyt2dG1vTm4vMTZNaUtz?=
 =?utf-8?B?azlkZ2lvVUJnUkZ2OWM0VmhHam9FQXVBeWxYTzJUWjRPU1I0blc1VThtSWRB?=
 =?utf-8?B?WW5mdkZTNHVOdEoycTRoVXNRR2V4TUJTL0hKa3VHWjM0Vnh0SEdWR3RpU2dV?=
 =?utf-8?B?YUF1ZlBIdHk4L1hybHlWa2lISmc3R3U5Y00yaXpaek8xRnhGT0FQUVAzbFcv?=
 =?utf-8?B?MzhyWlh4VWlUQUwyQ3ZORm5GdWU1R25PMmcwZDRLQnYxUThNZDRNbHNzQWdI?=
 =?utf-8?B?bXhtRnI5QmtKVFZoMzAxOVJOc1V3ekRUQ1VZTkJFbmE1MzhRRGgyTzBRQ2lQ?=
 =?utf-8?B?VVJlL2IwRzJUeGdSdjBWRUl3ME5uNE13RWtQNERlWCttbGFvTnIzczR3YWQ1?=
 =?utf-8?B?VlIyKzh1T29VeXVVcUsvbmlFK0wvSXNjb0xwamNKM1VoZ014MVFwU05FQmJS?=
 =?utf-8?B?MlUxNHA2MjFtWk1GS2VhakNIbVVMK0NJMXhWY2pFOU55dW9ZRDA2WFkrUm1k?=
 =?utf-8?B?L25ma0xBVHJ1N05CODJ3VjFJcU9VYmpJa0hUbjMzVnJjZHB3eFdvaGlVU0tF?=
 =?utf-8?B?NzBIczJZK1ZzWWV3N1E2aU1aRHBjb1BxbmRYNUJKREpHb3NzdjZHMHZ6bERZ?=
 =?utf-8?B?RVd2WmFYY1M5SXN1WWtmeTdURE90UTFSLzRPbVRkV01aNDlUZmZadEdUL3Fj?=
 =?utf-8?B?Q002RCtEWWJvN3NMSWdxbWF5RlJ5S2dONEExcm9NR2ZaeFVoZkp4dzBOb3Fz?=
 =?utf-8?B?M0crd0FoK1poOUpybHBrc1hqWHNVTnBMWkYvdmErUEFYUFQza3RISEdndFNR?=
 =?utf-8?B?dm9SbnNNbmVqd3RhU1p2SjlaZkJiOSt2ZlFydUZwUnpHYmp3VnVXajN1ck5i?=
 =?utf-8?B?MDIrc1g0VjdPY2JBOEZnOVpNWEd5QTBIN1ZjWjFtY25lK2FudDFFUFphMUIv?=
 =?utf-8?B?WWNFVkwyb2loLzZtM1VkUVgzR3RIbTZGRnUweDBHcmxVWWRvVGlGZ3cvenRz?=
 =?utf-8?B?Vmk0bXFiR2xpT1Y4NGkxSnJ2SjIvbDAzTWVCcDIzeGdwb3piNzg4N2NPRURE?=
 =?utf-8?B?NmpkSVpia0RXb2FIVVh4d1ZQRHNFZTRySnJuRFNBcmlFUkJZVmtseTNGT28v?=
 =?utf-8?B?TGNnYjBoQ0dpSk81Y3JrRmNJNWErNUFqUGwxUk1oNzgwdFNPQTV0OTFGVnlJ?=
 =?utf-8?B?M3F2c3R0MGtSNS8zcms2dXJzUVlhY252RU0wWm1Wa2J2cGpBTmF3aFJuOUk1?=
 =?utf-8?B?clROTkRDQnk3KzhFRytxeGhaZkV5NmlVV1dqN2k5MDZDazZoRnNNNXQyS3dn?=
 =?utf-8?B?TXNiVTZvTCtWcy9QMXpNWE9GejhLUWRXS3pZUWpITE8wQUlHNFUvOHlLcXB1?=
 =?utf-8?B?REcxSnhYNHNVMjFDaHlIWXBQZlhENmljVUhNbmJFWTZOTi9LcTB1Q3pvQnJv?=
 =?utf-8?B?aEJrM1NJRXlsK3hsdTRhMWpBZ1pTZVgvSUlBUUZjQ1JzWmVlL2ljQ2hOQlN2?=
 =?utf-8?B?RGhsZC9mOWE5REttMGdLQmZ5eXVPb3JHVUo3THR5VE1lLzhXSmw5OWFSMzFK?=
 =?utf-8?B?cGh5ZW5XcTRhaGRpMEN0eUVTbm1PazZ1L1BLZCtyRjFOd29NbUp5VlNzejZk?=
 =?utf-8?B?MGVMYytPTlhhbTlEMEJDc2hrbzY1NjVHNkJCOHVNaGFtWWRlZ2F4V25qNnJa?=
 =?utf-8?B?RXhRNDVlTXkvYm5sRmNkRkdsM3pLWVVFSnNGRkpMSURHSGR5QlZLaG1HZWUw?=
 =?utf-8?B?NVlQU0JvRXpMS2ludk5IcG43YmRMZVE2ekxGNnVuazVmYkl0TVhHd1FDbmNk?=
 =?utf-8?B?SFFjdVVUYXdNZi9tMWlha3dCMHNiQVlPSjRzdTNIUlorbnUwblNvL0dVQTJo?=
 =?utf-8?B?cFZTZUtVdjRNVkhFaURLa2cxNG5senEzdXNVWkp4T1BqR21SSmRpaTdoclZO?=
 =?utf-8?B?SWR3QlU3YnBFcHhYRmZvSU9ueENhbS9peTdvT3VyZTZzZXV2ZVlWei9Hck1O?=
 =?utf-8?B?TGRHWHZORkU1ZXhhQjFWMmR3a2hlYTgrR0o4YXM5Tm5KYk9MazRnVExibDk3?=
 =?utf-8?B?YkMvNzdWR09aMWMxY1FIL1NjQnJCN1NwMzA3RmRETVQrdmZBNUYxcjd6NTFW?=
 =?utf-8?B?a0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3eb5e0-e0ce-4f3f-746c-08ddb942bafc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 08:30:41.1975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T/Ve7Mh4kwC82K9mhsQATCTaSMzwOCBbrOWhxMiEMfHOJP6TLtjDdLmClU8zAR4QzUxAT69j+Dzhg7pkhZttbGVNI9B7LvekahZ/iIJeGpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12064

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMgPGJpanUu
ZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBTZW50OiAwMiBKdWx5IDIwMjUgMDk6MjcNCj4gVG86
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IENjOiBNYWdudXMg
RGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERv
b2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVs
Lm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IFByYWJoYWthciBNYWhhZGV2IExh
ZCA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPjsNCj4gYmlqdS5kYXMu
YXUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gYXJtNjQ6
IGR0czogcmVuZXNhczogcjlhMDlnMDQ3ZTU3LXNtYXJjOiBBZGQgZ3BpbyBrZXlzDQo+IA0KPiBI
aSBHZWVydCwNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+IFNlbnQ6IDAyIEp1
bHkgMjAyNSAwODowMQ0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBkdHM6IHJlbmVz
YXM6IHI5YTA5ZzA0N2U1Ny1zbWFyYzogQWRkIGdwaW8NCj4gPiBrZXlzDQo+ID4NCj4gPiBIaSBC
aWp1LA0KPiA+DQo+ID4gT24gVHVlLCAxIEp1bCAyMDI1IGF0IDE2OjU5LCBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBCaWp1IERhcw0K
PiA+ID4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IE9uIFR1ZSwgMSBKdWwNCj4gPiA+ID4gPiAyMDI1IGF0IDEzOjQwLCBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBGcm9tOiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBNb24sIDE0DQo+ID4gPiA+ID4g
PiA+IEFwcg0KPiA+ID4gPiA+ID4gPiAyMDI1IGF0IDE3OjM4LCBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IFJaL0czRSBTTUFSQyBF
VksgIGhhcyAzIHVzZXIgYnV0dG9ucyBjYWxsZWQgVVNFUl9TVzEsDQo+ID4gPiA+ID4gPiA+ID4g
VVNFUl9TVzIgYW5kIFVTRVJfU1czLiBBZGQgYSBEVCBub2RlIGluIGRldmljZSB0cmVlIHRvDQo+
ID4gPiA+ID4gPiA+ID4gaW5zdGFudGlhdGUgdGhlIGdwaW8ta2V5cyBkcml2ZXIgZm9yIHRoZXNl
IGJ1dHRvbnMuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcmVuZXNhcy1zbWFy
YzIuZHRzaQ0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4gPiA+ID4gPiA+ID4gQEAgLTEyLDggKzEyLDEzIEBA
DQo+ID4gPiA+ID4gPiA+ID4gICAqIFNXX1NESU9fTTJFOg0KPiA+ID4gPiA+ID4gPiA+ICAgKiAg
ICAgMCAtIFNNQVJDIFNESU8gc2lnbmFsIGlzIGNvbm5lY3RlZCB0byB1U0QxDQo+ID4gPiA+ID4g
PiA+ID4gICAqICAgICAxIC0gU01BUkMgU0RJTyBzaWduYWwgaXMgY29ubmVjdGVkIHRvIE0uMiBL
ZXkgRSBjb25uZWN0b3INCj4gPiA+ID4gPiA+ID4gPiArICoNCj4gPiA+ID4gPiA+ID4gPiArICog
R1BJTyBrZXlzIGFyZSBlbmFibGVkIGJ5IGRlZmF1bHQuIFVzZSBQTU9EX0dQSU8gbWFjcm9zDQo+
ID4gPiA+ID4gPiA+ID4gKyB0byBkaXNhYmxlIHRoZW0NCj4gPiA+ID4gPiA+ID4gPiArICogaWYg
bmVlZGVkLg0KPiA+ID4gPiA+ID4gPiA+ICAgKi8NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQuaD4NCj4gPiA+ID4gPiA+
ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gIC8gew0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgbW9k
ZWwgPSAiUmVuZXNhcyBSWiBTTUFSQyBDYXJyaWVyLUlJIEJvYXJkIjsNCj4gPiA+ID4gPiA+ID4g
PiAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxzbWFyYzItZXZrIjsgQEAgLTI3LDYgKzMy
LDMxDQo+ID4gPiA+ID4gPiA+ID4gQEAgYWxpYXNlcyB7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgIHNlcmlhbDMgPSAmc2NpZjA7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgIG1tYzEgPSAmc2RoaTE7DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICB9Ow0KPiA+ID4gPiA+
ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIGtleXM6IGtleXMgew0KPiA+ID4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8ta2V5cyI7DQo+ID4gPiA+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBrZXktMSB7DQo+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9
IDwmcGluY3RybA0KPiA+ID4gPiA+ID4gPiA+ICsgS0VZXzFfR1BJTyBJUlFfVFlQRV9FREdFX0ZB
TExJTkc+Ow0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTbyB5b3UgYXJlIHVzaW5nIHRo
ZW0gYXMgaW50ZXJydXB0cy4gRG9uJ3QgeW91IG5lZWQgdG8NCj4gPiA+ID4gPiA+ID4gY29uZmln
dXJlIHBpbiBjb250cm9sIGZvciB0aGF0IChmdW5jdGlvbiAxNSA9IElSUTE0KT8NCj4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiBUaGUgc2FtZSBwaW4gY2FuIGJlIGNvbmZpZ3VyZWQgYXMgVElOVCBv
ciBJUlExNSwgY3VycmVudGx5IGl0IGlzIGNvbmZpZ3VyZWQgYXMgVElOVCBJUlEuDQo+ID4gPiA+
ID4gPiBJcyBpdCBvaz8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9LLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+IEFsdGVybmF0aXZlbHksIGNhbid0IHlvdSB1c2UgdGhlbSBhcyBncGlvcyB3aXRo
IGludGVycnVwdCBmYWNpbGl0aWVzPw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IGludGVycnVw
dHMtZXh0ZW5kZWQgPSA8JnBpbmN0cmwgS0VZXzFfR1BJTw0KPiA+ID4gPiA+ID4gSVJRX1RZUEVf
RURHRV9GQUxMSU5HPjsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGUgVElOVCBJUlEgd2ls
bCBwcm92aWRlIHRoZSBzYW1lIHJpZ2h0PyBBbSBJIG1pc3NpbmcgYW55dGhpbmcgaGVyZT8NCj4g
PiA+ID4gPg0KPiA+ID4gPiA+IFdoZW4geW91IHVzZSBpbnRlcnJ1cHRzIGRpcmVjdGx5LCB0aGUg
c3lzdGVtIHdpbGwgZGV0ZWN0IG9ubHkNCj4gPiA+ID4gPiBrZXkgcHJlc3NlcywgYW5kIGZha2Ug
KHRpbWVyLWJhc2VkKSBrZXkgcmVsZWFzZXMuDQo+ID4gPiA+ID4gV2hlbiB5b3UgdXNlIEdQSU9z
IHdpdGggaW50ZXJydXB0LWNhcGFiaWxpdHksIHRoZSBzeXN0ZW0gY2FuDQo+ID4gPiA+ID4gZGV0
ZWN0IGJvdGgga2V5IHByZXNzZXMgYW5kDQo+ID4gcmVsZWFzZXMuDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBTZWUgYWxzbyBjb21taXQgY2FiMzUxMWVhN2EwYjFmYyAoIkFSTTogZHRzOiBtYXJ6ZW46
IEFkZCBzbGlkZSBzd2l0Y2hlcyIpLg0KPiA+ID4gPg0KPiA+ID4gPiBBcyBwZXIgWzFdLCBmb3Ig
R1BJT3Mgd2l0aCBpbnRlcnJ1cHQtY2FwYWJpbGl0eSwgSVJRIGNvbnRyb2xsZXIgbmVlZHMgdG8g
c3VwcG9ydCBib3RoIGVkZ2VzLg0KPiA+ID4gPiBCdXQgVElOVCBzdXBwb3J0cyBSaXNpbmcgb3Ig
RmFsbGluZyBlZGdlLCBidXQgbm90IGJvdGguIFNvLCB3ZSBjYW5ub3QgdXNlIHRoaXMuDQo+ID4g
PiA+DQo+ID4gPiA+IFRoYXQgaXMgdGhlIHJlYXNvbiB1c2luZyBpbnRlcnJ1cHQgZGlyZWN0bHku
DQo+ID4gPiA+DQo+ID4gPiA+IFsxXQ0KPiA+ID4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ni4xNi1yYzQvc291cmNlL2RyaXZlcnMvaW5wdXQva2UNCj4gPiA+ID4geWINCj4g
PiA+ID4gb2FyZC9ncGlvX2tleXMuYyNMOTgwDQo+ID4gPg0KPiA+ID4gVGhpcyBpcyB0aGUgZXJy
b3IgbWVzc2FnZSBJIGdldCBpZiBzZXQgZ3BpbyB3aXRoIGlycSBjYXBhYmlsaXR5DQo+ID4gPg0K
PiA+ID4gWyAgICAyLjE5MTgxOV0gZ2VuaXJxOiBTZXR0aW5nIHRyaWdnZXIgbW9kZSAzIGZvciBp
cnEgNTEgZmFpbGVkIChyemcybF9ncGlvX2lycV9zZXRfdHlwZSsweDAvMHgxNCkNCj4gPiA+IFsg
ICAgMi4yMDQxNjhdIGdwaW8ta2V5cyBrZXlzOiBVbmFibGUgdG8gY2xhaW0gaXJxIDUxOyBlcnJv
ciAtMjINCj4gPiA+IFsgICAgMi4yMTAwMThdIGdwaW8ta2V5cyBrZXlzOiBwcm9iZSB3aXRoIGRy
aXZlciBncGlvLWtleXMgZmFpbGVkIHdpdGggZXJyb3IgLTIyDQo+ID4NCj4gPiBTbyBpbnRlcnJ1
cHRzID0gPC4uLj4gaXQgc2hhbGwgYmUuLi4NCj4gDQo+IE9LLg0KDQpJIHdpbGwgYmUgc2VuZGlu
ZyBuZXh0IHZlcnNpb24gd2l0aCBzdXBwb3J0IGdvdCBLRVlfU0xFRVAuIFdoZW4gdXNlciBwcmVz
c2VzDQpTTEVFUCBidXR0b24sIHN5c3RlbSBlbnRlcnMgaW50byBTVFIgc3RhdGUgYW5kIHdha2Ug
dXAgaXMgZG9uZSBieSBQT1dFUiBidXR0b24uDQoNCkNoZWVycywNCkJpanUNCg==


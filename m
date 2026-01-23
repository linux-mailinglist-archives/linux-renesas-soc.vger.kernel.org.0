Return-Path: <linux-renesas-soc+bounces-27321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFpbAPFbc2l3vAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 12:30:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0B75052
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 12:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4D753074A73
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 11:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D4C32E154;
	Fri, 23 Jan 2026 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qv9PvxIr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4148133B6D3;
	Fri, 23 Jan 2026 11:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167778; cv=fail; b=gT86xZyyNL2Ug0+Xn4FsZ97KXn/O+/dJLOKKgqdsvVFdbeeEVy0QLgkKpIaXOCF+IpMpWb0CX6Fu36KO3J3ScK5hBUPetEnmcS11lMrfsw7DWiQrmLVVrrE+r1/UIRE2wE1dH2sJHUmeQsucGcLxkQy3mR5X7X2zPDAp072sggE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167778; c=relaxed/simple;
	bh=H0DXfd40QruUohPXkMd4Sy/G2NFKMlDuQkcUr/vbfMI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T5o2IKu0gZh2hlxqXiZcL/jsTq2e1VxqqzesqQ51uMnS5WmMvolMg8ykWVohcBs/jIz+D/3nuYFndeg/6+48sFugr7SWXd4F3owxK4e2GzqOilBj5c5d/ZOjb7+zCROK8zjxeClqqnpxV6cbnqE1J7axb5O78EmV+CYmy83GGWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qv9PvxIr; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpHpwM+zxuVHVRhUdPiFRBaRCiCMFhajbOPRC5LrqIs3Gsl3o8iXiXHHgY9sootno1ioRhFeUnQkq6jbBlO3S3J1A3Dj/KufJg1u76Iilfn15ENV5HmkWq2t0ExXO9rJJvdSt05Uc47yoV+XHKCjnymyIEJfYLvy7dNL7HDnR0luMkb92StUPzQJJxnWrhd44cb5J5ZRqm9CevGgfttxh4z/jHoC6jCenPpgqBPm4vTmnEs93nqDS34Gp52+HbArV7xU++oLRgi9cLDELfllSG5cpFpA9dJtO25++8vg5JDhApRz9zsHjUg+i9xtSB7HobCwchzXlu2BC94fdlxCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0DXfd40QruUohPXkMd4Sy/G2NFKMlDuQkcUr/vbfMI=;
 b=hHvRRZvav1o/xEDb0Ap91ObzgjaWi8k34yiYqOB2/uNhr/JV3Y5PhSwH9BazprNb5NP5w3u7ameV22J6E03fRBuwk/FCq7q7quRhnEY7c/Hpz/JeRcwLAJ2E4zyeT9kt3k8K2IIL5uzBlxUbt2ZqeTHK2SP6i8LOkomO6Yy2das+cnAeeDxlCOd0LYcL4e60KspbvKYMW8qRInSMeOQH3f39qqDXdGEML6d64hCTpW3wCdoYg9v1MBoGu0KWTAk+n5a3+LNuHTPEafv5Simtau/W1GU7H/Ug6G2vNvsI1CWEYoH/QFCl991+Y6pWvwt3EidjXxnFG0JThXYGbwdYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0DXfd40QruUohPXkMd4Sy/G2NFKMlDuQkcUr/vbfMI=;
 b=qv9PvxIrqU6MWkhBmhIt8UOcJCpACJoDf8gGYnS81qoNFMlQt9QDwSN5qW1RmBMXPELNIFCgDY6BrxwHcNbpKLzRQm9MKaJ/MxYlr7rlntnbNiKIbgj08keM4spR6fO0umd7I8RISG2KdpVj12wvviUynGrgnd1hAmRRZKK3QV4=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB7752.jpnprd01.prod.outlook.com (2603:1096:400:181::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 11:29:31 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 11:29:30 +0000
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
Thread-Index: AQHchWt8/8Xcc6HpdkiYg0CMgbNe6bVa6hMAgACLVYCAAvSbMIAAA6yAgAE7e9A=
Date: Fri, 23 Jan 2026 11:29:30 +0000
Message-ID:
 <TY6PR01MB173770856BD4044A79150F6E8FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-4-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYCPR01MB7752:EE_
x-ms-office365-filtering-correlation-id: 3c0b1896-eace-41d2-1b03-08de5a72ac84
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V28yZGVWb2s5alI5TEtIc3Y2VzhVSTk0RW5QTk1yMjd1UzlGdStjQ0V5UUNw?=
 =?utf-8?B?VVllNW1SS1EvVC9sVEpJak1meU9tSjBTL0JDTkNjSExjNGJHcHNGRW9BajlN?=
 =?utf-8?B?OXhHTnd5QlAvdzFUOVZJWW9pazFXMXNvVG1TZmR5aE5NTEZpVjN4WENmUVhK?=
 =?utf-8?B?bE54SkVmUTQ2YW8rdlFZWWhBTXRpdEtCM1ZpYzRBQktSd1lReXNndUU5azly?=
 =?utf-8?B?TnY5NUV4NmJVeCtqQlpWUVhYU2dhRnY5bnU2UXFkbitSYkdQbVZPc01qZzBS?=
 =?utf-8?B?TEc3Y3hiRFpjVE1TbUJvL1N4SXNWWXhqQjZhSUs4Ymx2MndRL2xDVVhWcTV2?=
 =?utf-8?B?b1IvSlgrZGRPSkJjdXBSZ2JDMWVleHVYaWZyN3hHS0c3RGR3UFBzZlVYRGxW?=
 =?utf-8?B?YnIrOVRiMkVyUnBXanUxK3FaVXJKRW0wMWNuUDVpalc2NjcxZDlkY2JMamsw?=
 =?utf-8?B?dUIwcy9oYU41THlSMHMyWXIxaDJvTzZ6dVFpRVVXSWpKWFRPcDU5T1VpWXhH?=
 =?utf-8?B?MnI1NWlFVGdJTzM3RlZURmV5dDNlVkNvbG53dmhlZEhFbUpPRk1hOUFKUGtw?=
 =?utf-8?B?cmh2akpxd2hSY2dxLzZqVVBwUVM2RStEVWlESUpZK2ErY0h4VVd1NzNHZ0Zs?=
 =?utf-8?B?bStTWlYyZGFycW9PQTVKelZFV2xHQTZZbnlneFE2cThkcnJaY2RneW84YVo4?=
 =?utf-8?B?RHY4SW16UlJEcFpLN215T3AwdHduMDJRZlZoR2R3am12YkEvOUVHOUF1SjRv?=
 =?utf-8?B?WW12N1RGSytISFI4VXBidFdsT3lZbll3cStVSlR2ZngvWU8vcm9IUTlKRGkz?=
 =?utf-8?B?aWxtNnhYOEJjY0VhL1VqaUtxMlJXMUliczBRdVBaTFc2QmpSQXVnYThCSXlF?=
 =?utf-8?B?UmM1MmNVeGhIM3VYKzJXMXBqT2RtTHFQUDBYWjVhWEpwUk56aUxac2JtMHF1?=
 =?utf-8?B?anpwU0FlYmlGZEd1WmhTTWVzWkJYUFdMd3poRktZU2ZmTkxvZ2FCT2VnOVNN?=
 =?utf-8?B?dzBZNk1GamFPN09FMFpueS9OYTNXZlF0Uk1JaUYzekQ3ZUZPMCtQMXlGUFBH?=
 =?utf-8?B?dGRMcVV0K1dLT1BNUktlMkV0NmJNeDZJakFQS1MyUlh0SHFOZWNhWmRwSG80?=
 =?utf-8?B?anVSSTdGTE82YWlMWE1JMXFHYnIyYUQrbVpBc1ZTOU5jQmhYUTAyczBXTFhM?=
 =?utf-8?B?bGxqNkUwQ3p3dU93ZlQzRk9oUGhuazQ1byt3dForY0JUdFRSUjU5MXFiajcz?=
 =?utf-8?B?ZEZUNnI3UmordWU1b1RoZTV1YXJ4MG9Za2kwMGpVb0hET2dmeFNRSlp3d3E2?=
 =?utf-8?B?QVRtTWNha1dLYktWMTRWK0RhRnVHTEovdUxvTkZjWEE4WjVmRFdjTUErV0NZ?=
 =?utf-8?B?Q1RpOTZwb0Y3VnNQMzlVc0VBOExJQytiQlRtUkpyOUtLWEFQS1pTVk03TzAx?=
 =?utf-8?B?dlVtcEl1QzlzbXNqeE1BeXoydDFJSE1Ua3NGMTloaitwOXpCVUFhRU1PcHk2?=
 =?utf-8?B?QkRCeWVjTDIrUXF4N0doNDBRbk1QOFNDNG9PcUhOYmZsSXpCZEQrUTYyUm5V?=
 =?utf-8?B?cEVjUVk3cGlMOTFhbktQTmFTTFdMM3FOUUVCN0ZxdXZNYjMwRnd2bmNNWUto?=
 =?utf-8?B?a0poM0VyZWpWbVRxaXRBSEtJbEpZS1RmNUtOQ1Jnai8rOFZ0R28rMDlnRlpG?=
 =?utf-8?B?T1NTM2tnUzk2OGExN2F5TE5Xd0ZTRkxhSU51M3dYcmd4VWt6dVRiQWswV1Nq?=
 =?utf-8?B?MFVVVDNaaERDTCtVMHlpUmV5V2JoWFZUbTVDZk14dGRROWE4TExJRlJoWXlM?=
 =?utf-8?B?cnZMb3FkS0kreVdma3RDSFNIQWovSkh5b3B3RlNVajRma1ZtYXBFS2M3dXJJ?=
 =?utf-8?B?YndjR2Q2ZGdKUWNqWFNwVmpIMnI3SDFwZ3pMUnBzQnNZbEdiQ25oQmNMOHFE?=
 =?utf-8?B?aXJEMlBLVUk2ckMzdmowWGhGT2VSL1ZiRDJHNURSdFhXSFo1SHRBTTRkdWlz?=
 =?utf-8?B?MDBqRUhvR014d0kvZ0lHYndqM3cwK2gybFhRdmZWT3o4NnpHZWhGTWlLeWkz?=
 =?utf-8?B?VWkxNjVTQzlsRkI2V2oraCtzQ1lxVWJCWWd0UG1rZWFiZnhLUThzY2oyaURJ?=
 =?utf-8?B?YmVHcEJ3dnhyQUdRdnFFUWVSZk4yZWhzbmdTajA0TDEzSVJKOUU0NlRzNTFG?=
 =?utf-8?Q?8lzb0t70k/7SY8pZc4UvnA0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dVZSVDJxK3c0L2g1TzBNakFvRDN0OXUvTmxMR0dsOU4yWkRnMnJ5NEgyUzR4?=
 =?utf-8?B?QU9GdnA3T05JeW5YbDdUaUJuaUx0dkRnZ2VLeDZrSUlzMk00NnVnZThDcGN1?=
 =?utf-8?B?d2ZjcmliMTloSi8rMXNpbHhIWUJHd3EyY29tV1UwbWZFZTZYR05JdGp1WDdI?=
 =?utf-8?B?eXNIV3ptTDRYamJpczJReXllSkVBaUpITFJvOHczaUtXcFBrWjhUSFgrdGhZ?=
 =?utf-8?B?V2w4ckdJcVREZUF2ZFBFenFqczA5emtvUmRIaFBmcXZwcnl2eGZ1S2xqMjZT?=
 =?utf-8?B?Z1crSHJXV05JZjQ4UUZLM3VSMG9iNGJiS1ZnbTVkQzRxcitxL2dadkMrcHB4?=
 =?utf-8?B?US8vaDRrYjJkRmgzYU9zV3F4dWgwQlZ4RzZ1bkVIYXkrVjlGWVUwSmVFYkpo?=
 =?utf-8?B?Z0RDUFNreEIvLzdLakZEQWh1VGxkMHBGUzNrRTdKR1BnbHl5bVFXOElmTzJu?=
 =?utf-8?B?Z2JRV0c2WUhuQjZSL2F2MlF0SngzZGpzRG0yc1VCWFJpb05JL0IwVWtYL0ZM?=
 =?utf-8?B?VUw4NS9DYjU0Mno3V3gyMVJMQWdIRFRDN3F3UDRCWEwyazd3N2kwWGNPbjVz?=
 =?utf-8?B?TTQvS0FZd1Iwb3lORE5pMUR5NzNxbUowTjR6aFFHNVErcnBBMjEwUFdxSjFw?=
 =?utf-8?B?TjNSUmlxRW8zbjhRZVF5czUzamJWdkcwNjU5S3BXcGtkMkFzM090VGI0em5k?=
 =?utf-8?B?UjFTRERKa3MvWndHU2dZY3VmcjA2OXJpU21Vd2htWnRveVNYMWpXWDN3QmZO?=
 =?utf-8?B?Vm5iSVFyNkZZR0tIYlZMSzEwYWhHVW1CamovdTBCM3RoRTMwUjFzVEI3Yks3?=
 =?utf-8?B?bmdwL1FacFZlazNtQVltUlNneUJYQTdPNlEvNWFvZzA2L2NmUEZNckJlQktB?=
 =?utf-8?B?dEExTVZrWUJLK3ppRGRVMGFYRzhCYmNaWjhwWmFZUDltL29RVERLVzlzV2gr?=
 =?utf-8?B?YWhUV2I5Q1JScVByR0ZWUW05NDVUTkJBZkhneG9CMDRnTGRjckl6bWUwT0J6?=
 =?utf-8?B?NEFvOUUxRzZ4TkZlRzloNEFVYXVnUTBXQ2VaRlBha0J0UjYzQ3p0K2J1T0Ft?=
 =?utf-8?B?MlJGZlh1czBOSnpnSXpvS2hGRmprU2txdGFvbVVTdWQ1N0I5S2V5eEtBbW45?=
 =?utf-8?B?VHFRU2FSMGEreEN0ZlhwSGFrV2ZuQXc1S29rQWgycW42Z1lQQTlZMmRCamtH?=
 =?utf-8?B?NTk0WGV5anZtNzZhY1dmQlJvWGVSejA2dkk4aUVHOGJnV0drZ2piK3h6ZFIz?=
 =?utf-8?B?aVdHZUtKZ1pFVjQ2dDVmeVUvUlBuQnl4QkJ0MSs3OWlJZzlpeUhDMldzcFVH?=
 =?utf-8?B?aXp1dDBtMjRqOWdUaTBIajhGSmM5V2d2TmlQc0FObWJWbmxSTGJPM0c2Y1ll?=
 =?utf-8?B?eWRKMGFQZ0ZZa2pGc0g5ZTNLOTN4TXd6ZURPSUN2M1U3cFVQTmlzd2x6MUx3?=
 =?utf-8?B?VWV3eUorNytHcVJxTTZZVTJ5TUIrakNGamd0SCtKZlhhUHcwakp5WnRscE1o?=
 =?utf-8?B?RFNRck9mem05aVZQZERGUFZBWEdUUC9QRVplNWFNN2RpM21vTkt4SEhFMHkz?=
 =?utf-8?B?cHBGeHZiS0daRjBjMmhMNUIrUE5GbnBpbWRUdEo4ZGl4THpYOVA2V285Z3g5?=
 =?utf-8?B?VnhrRGVxbFlIOUpDcjl5T0JBZ2RtYWhaR21LVkpLcjVReUlSQ2dCTHQxWUNz?=
 =?utf-8?B?Q2pIUDkyZzBDSDZXTVF4MUVVdWJnT3lxNEpXSUVHVXZUMnQ4YXZJbUV4SGky?=
 =?utf-8?B?OFJ2d0Z4SkkxcnFUUnpoaDFoYkZJQUZoK3ZSWTBKN1hhbWp0MjR5S0FsRm0v?=
 =?utf-8?B?LzhDSzFHejRjYTlEcEFINjMyc3NhVHpiL21Jc2RMZ1JXT0NpMzFINGdGZGxU?=
 =?utf-8?B?bFVrL29NZTUrK2lpQjFRNEN6bGZQUTh2UXpmR1ZRNXJ2aVRHRzEvVDlCek1w?=
 =?utf-8?B?aWVMTVpWa1NBZlIySDR0MXF0WFZBRnVjV3FxN3pTY1FOLy95OUpCTEU2a1NG?=
 =?utf-8?B?WHd2RnNmK2ZVL0xWN1ZrcytLNThicW14U3hML01md0labEJ1Z1p4OWc4Zi8z?=
 =?utf-8?B?cWJORnY5N3RKaXRvcXdsNWRxSXd1eVJZeHNTMUF0RFZacVg0U2xPbC8zb29k?=
 =?utf-8?B?THM1cDhaTnJlNzF5QXowcVdHWXYxSlg0NnZtMVBmdnhlZ3JPQ0J2Wk9KMWcr?=
 =?utf-8?B?ZmdtQlRlaFpWSXhYR1dSL1JGOUZjeFhHbVR0SlJ5QWs4OGh5QktsbDNRRkx4?=
 =?utf-8?B?R2V5eE5IcW02eDIxZWlPNkI3OWtKQkV2MVdZcDZ6VHdzVTBPZjZrWWxPZmtV?=
 =?utf-8?B?MXRoNWk5dU9lcGlVSS9GbkZoNFpHYjdyWTJJMmdyVjZJSWd1ZnZ2NlRlNjR3?=
 =?utf-8?Q?XLnA8jQSPTBo1Jg4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c0b1896-eace-41d2-1b03-08de5a72ac84
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 11:29:30.0214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+DWlW9VeEyyNkSUUXb9ylLHDAoXcvsj5Ne+y971RGTcdDCDAQBROETjGupsaOhLSuL6/M4zHO2XoOnolaYC0M4sCLYafqJ4DAEhsyjfehY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7752
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27321-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,m68k.org:url,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,linux-m68k.org:email,linux:email]
X-Rspamd-Queue-Id: 98E0B75052
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEph
bnVhcnkgMjIsIDIwMjYgNToyOSBQTQ0KPiBUbzogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1Lnhh
QGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAzLzE2XSBjbGs6IHJlbmVz
YXM6IHJ6djJoLWNwZzogQWRkIHN1cHBvcnQgZm9yDQo+IGluaXRfb2ZmIGNsb2Nrcw0KPiANCj4g
SGkgSm9obiwNCj4gDQo+IE9uIFRodSwgMjIgSmFuIDIwMjYgYXQgMTc6MjEsIEpvaG4gTWFkaWV1
IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiBGcm9tOiBK
b2huIE1hZGlldQ0KPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPiBPbiBXZWQsIDE0IEphbg0KPiA+ID4gPiAyMDI2IGF0IDE2OjM2LCBKb2huIE1h
ZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IHdyb3RlOg0KPiA+
ID4gPiA+IFNvbWUgcGVyaXBoZXJhbHMgbWF5IGJlIGxlZnQgZW5hYmxlZCBieSB0aGUgYm9vdGxv
YWRlciBidXQNCj4gPiA+ID4gPiBzaG91bGQgYmUgZXhwbGljaXRseSBkaXNhYmxlZCBieSB0aGUg
a2VybmVsIHRvIGVuc3VyZSBhIGtub3duDQo+IGluaXRpYWwgc3RhdGUuDQo+ID4gPiA+ID4gVGhp
cyBpcyBwYXJ0aWN1bGFybHkgaW1wb3J0YW50IGZvciBQQ0llIHdoaWNoIHJlcXVpcmVzIHByb3Bl
cg0KPiA+ID4gPiA+IGluaXRpYWxpemF0aW9uIHNlcXVlbmNpbmcuDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBBZGQgbmV3IG1hY3JvcyBERUZfTU9EX0lOSVRfT0ZGKCkgdG8gZGVjbGFyZSBtb2R1bGUg
Y2xvY2tzIHRoYXQNCj4gPiA+ID4gPiBzaG91bGQgYmUgdHVybmVkIG9mZiBkdXJpbmcgQ1BHIHBy
b2JlIGlmIGZvdW5kIGluIHRoZSBvcHBvc2l0ZQ0KPiBzdGF0ZS4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2Fz
LmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4gPg0K
PiA+ID4gPiBMR1RNLCBzbw0KPiA+ID4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+ID4NCj4gPiA+ID4gSG93ZXZlciwgSSBh
bSBzdGlsbCB3b25kZXJpbmcgaWYgdGhlcmUgYXJlIGFueSBwb3NzaWJsZSBiYWQgc2lkZQ0KPiA+
ID4gPiBlZmZlY3RzIG9mIGRpc2FibGluZyB0aGUgUENJZSBjbG9ja3MsIGUuZy4gd2hlbiBQQ0ll
IGlzIGluIHVzZQ0KPiA+ID4gPiAobmV0d29yayBjYXJkLCBTQVRBIGNhcmQsIC4uLik/DQo+ID4g
Pg0KPiA+ID4gSSdsbCB0ZXN0IGFuZCBsZXQgeW91IGtub3cuDQo+ID4NCj4gPiBJIGZpbmFsbHkg
ZGlkIHRoZSB0ZXN0LCBkaXNhYmxpbmcgdGhlIFBDSWUgY2xvY2tzIHdoaWxlIGEgV2lGaSBtb2R1
bGUNCj4gPiBjb25uZWN0ZWQgd2FzIHBlcmZvcm1pbmcgcGluZ3MuIFN5c3RlbSBnb3Qgc3R1Y2ss
IHVudXNhYmxlIHVudGlsIG5leHQNCj4gPiByZWJvb3QuDQo+ID4NCj4gPiBXYXMgdGhhdCB0aGUg
a2luZCBvZiB0ZXN0IHlvdSB3ZXJlIGV4cGVjdGluZyBvciBkaWQgeW91IGhhdmUgYQ0KPiA+IHNw
ZWNpZmljIHNjZW5hcmlvIHlvdSBjYW4gc2hhcmUuDQo+IA0KPiBOb3QgcmVhbGx5LiBJIHdhcyB0
aGlua2luZyBhYm91dCBhIHNjZW5hcmlvIHdoZXJlIHRoZSBib290bG9hZGVyIHdvdWxkDQo+IGNv
bmZpZ3VyZSBhbmQgdXNlIHRoZSBQQ0llIGRldmljZSwgdGhlbiB0cmFuc2ZlciBjb250cm9sIHRv
IExpbnV4Lg0KPiANCg0KSSBjYW4ndCBhbnN3ZXIgdG8gdGhpcyBleGFjdCBzY2VuYXJpbyByaWdo
dCBub3cuDQoNClRoZSBpZGVhIG9mIHRoZXNlIGluaXRfb2ZmIHdhcyBmcm9tIHRoZSBQQ0llIGhv
c3QgSFcgbWFudWFsLA0KRXhwbGljaXRseSByZXF1aXJpbmcgdHVuaW5nIHRoZSBjbG9jayBvZmYg
YW5kIGFzc2VydGluZyB0aGUgcmVzZXQNCmFzIHBhcnQgb2YgaXRzIHN0ZXBzLCB3aGlsZSB0aGlz
IGlzIG5vdCB0aGUgY2FzZSBmb3Igb3RoZXIgSVBzLg0KDQpSZWdhcmRzLA0KSm9obg0KDQo+IEdy
e29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4g
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K


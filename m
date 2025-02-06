Return-Path: <linux-renesas-soc+bounces-12898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE34A2A63A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 11:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D7AC1681B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2025 10:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8535A22756B;
	Thu,  6 Feb 2025 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NtTn23Cw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACE318B03;
	Thu,  6 Feb 2025 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838556; cv=fail; b=Hw2f+3sCbBbiJPZL8Q8jEDmNIhrd8ScL8jaDuIRvJyS22i+4fQOGL4uDHTfs8jwI37XZjW/cChedGb1noTz7EJMhhpV2XTkffRP8gMQf1EWXKqO+pcvnn/VMWr3GdY4Bc+b97aqw4XbCxrliM9ImbNHW3lvZWF3DXttrCKYjoFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838556; c=relaxed/simple;
	bh=c+PyRjvxJUak9+KDDdt5b/HblMPGRUwcpnMeHUO6OwQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pn2xdFWzACC6V7Dx5kYiqoOp3tENlbPCgKmVYCxPnenCfYo6FbUh2TDFgupMpUX/9wOad4f2jck19VXUWXjuezTVHIB8jCkUDKiX2Fgimy6w/G5qSDCOfFyXlrvghWJZuUDrPOk2wTRCyLe+m38a6Utq08TTEjWbSHlEomtJNEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NtTn23Cw; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQG7hAZtSzFdmDmoBVSxNFkWgF3BHXhclowzT183gN1nfCESA2/LWmb7r3B2Y+PhJNPzbZ9MjpbiOTGSvGUkkT5d+zj01fq2XiNUlTNVTRnc8PntFD61UhNyEMPFIZ47j0WZWjD9JQybIA3ENV/tZ/ZwBZUXANJvk451ldePKg+gmGMOC4/6tgTlSkfBOTJAxsGOy5zruczxQ4B9lcigzz01AxaTf+c/tuQ4SQWA9m0bJoMecE2ykeVZ3ullPPZzpTdHAnQhGxkl5vD7WnRYKkgAtS5tQilftr9CUw9WCqpvX1d0NVDo+eU8+FXmqGWnIMKNj0tvYb8AMu1RCkPvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+PyRjvxJUak9+KDDdt5b/HblMPGRUwcpnMeHUO6OwQ=;
 b=FfPu1otBPoYvnUltTGXAiK0SHVnm/jTAP/gclpKDrxnf7J4Siz21/oCiXQOoZxJudLS3grJ+561ez2Pmd8xrCortoTUmUK1/+RUu56gTNqTs0xCET+iH0MbzMZvw+B4MvKxPlPUecJv+5NkG6lxsplfdOwrQuGYbStSq9NSjsHhCWMUyqU+BuzWAadBwCC6l1bfFNmeD8NepsOX07dzAxIbHn+kbkEXKcd5NjTBywhikyq28oR1ufcTFvI1V6env/JmhzbSKryniugj1webCagxXtfFT8X7+Esjq7CEd+tizJ/kgIhQ/8abnp/Ud76BXtMQD0HngR5HNr1H5xblJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+PyRjvxJUak9+KDDdt5b/HblMPGRUwcpnMeHUO6OwQ=;
 b=NtTn23Cw2PKZ3hgQ8XhTH5XYmTCvaker1s/n8foKG5NYpvTArOw0/IPrBL5aQNWfpZCESg9RA4vZKSD85LFuCGJ9ucKkt04HH4bLbyOL/vLq8h7ouFH9YatislNHgWs+Z+x2EWmwwmYmRYXrXjVtXtL561Phl46Y/1XH8NUTeY8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7217.jpnprd01.prod.outlook.com (2603:1096:400:e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 10:42:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 10:42:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
Thread-Topic: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
Thread-Index: AQHbc9NZt47Owzw5Y066V6psYn6TL7M6A3qAgAAcOgA=
Date: Thu, 6 Feb 2025 10:42:28 +0000
Message-ID:
 <TY3PR01MB113467621113B0F94DE51AA4C86F62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250131112849.120078-1-biju.das.jz@bp.renesas.com>
 <20250131112849.120078-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdU1PFgdvMBrQrgdwmeNutM6arxZtzdE1rnrwWKtWvPVhg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU1PFgdvMBrQrgdwmeNutM6arxZtzdE1rnrwWKtWvPVhg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7217:EE_
x-ms-office365-filtering-correlation-id: 6b50985f-5617-41e8-836f-08dd469af400
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L25IWm9yY2FVVEM1TFY0QkhpQWdwWXJZT2RBN1Zja20rQzlad3dIQnZsWU5B?=
 =?utf-8?B?NUhObE84NGc1cXAvTnQ4Wlg3bm53dzhNODVwWm9WNWROWlZCV3Vrek9kbWFP?=
 =?utf-8?B?Wk9TQVN2aG8yaWhqcDU5NHphS1RmZFBaSGdPY1VKaEdaQjlMS2dMUFhtMXRv?=
 =?utf-8?B?NDhjNHFsdTJFeUJPeGpQZWF1ekNPVVllWTV2R2h2cFZBd0ZIRm43Mk1NTkNR?=
 =?utf-8?B?REU5TmwvcnlwNDFmTXNwQTBSVkNndWdrSEIrbElEcE1pU0JHamxOOFZMVUlr?=
 =?utf-8?B?MVlqd2hMQTZTbmJwd2RJZG9nNzZ6clNGRkUweklnbDdPSFpzdS9SQVpESEFG?=
 =?utf-8?B?WlNDZ1BFcG5hTGozdjBHdytVTGoySWRWZmQ5elh0QytubEVlczRyOVdBaWEy?=
 =?utf-8?B?aHRiKzZxZ28xZ250VTdZSjRHOG9KTkorN0FOUGNCVGh5ckdSa0JOK2JDTHJG?=
 =?utf-8?B?clVza2xURmVIU3RoRGt0ekM5cXlPdXFEMzhxVDBTekJWTk1GN0xHT3FZM0Vj?=
 =?utf-8?B?YjJNK0dkeWMxQjBxVjcySVpGZ3Nkekprby9pcnc5RFllQjFBelFzZzU4KzNt?=
 =?utf-8?B?a1FrYkg1TldJVTI0akd4ZUdhZ281ZHBwSittNFN5eFIrc3lMSDIwUklSZWF3?=
 =?utf-8?B?N3RlOHp5YlJXZGczbFhGazc2Rm5ObGpMYno3cTFaVlpOM284Vk45L0ZySEZ6?=
 =?utf-8?B?ekFLT0ZSSjIwaXZaQUx2ejFuVWF2NE93VHNPNmp6cEZDS2xxK3ZJa3BrQUZi?=
 =?utf-8?B?dHJOdHJVTlZYVi94OXVIZFMyaTE3cWRkL04xK3NoWjdhMElhZkUzYzBWMVh1?=
 =?utf-8?B?SUNEa0lNdUVGUUlvRmZab0dMVmtPdktWNnpESGszbW5OSXFhOTBrbGZRLzZt?=
 =?utf-8?B?d0g5RmQ4THpjSmMzREQ1OEpNVDJRZDlPNG5TUFFKMVloeS9CUU9Zbm9hUkNn?=
 =?utf-8?B?bTVOUUdjMi8yRko4U1Byektudm5FTUNTZ25MWlhSWlF4VVJIVlFUeE00S0hl?=
 =?utf-8?B?QTVSN21vTklIWUJ1N0NaNnV3WDZZZWVJTUhZeHNqNURwbUhSeGVTSDdRRWZX?=
 =?utf-8?B?blI1akVhQ09yNVJMWWExL0k4V1NobEVPSzdWZjhad2kvK3NJRTR5a1dGZEtq?=
 =?utf-8?B?OHZNejd5QWE2VTM2bXEwWU5lbEhpQVNoblRSS3BUWGFxZm9nbWthdHR4WWwv?=
 =?utf-8?B?N3NOZGJYd1E4R0t4Ylc0K0dGVGp3K0FxaUlvRjlGTW5VZC9TSjN4d0IyYVhy?=
 =?utf-8?B?dmJSYnMwVC9zRHN4bC9vaUtRZCtGZFliNnBJeTg2ZTRUMmJEandVOUZncXVL?=
 =?utf-8?B?N0NtaHNpTEcxVTZVcTNZaEpiU1Z1ZW5TSElISXlSSGxFZEkxZksvQ21WZkIr?=
 =?utf-8?B?bFNGYkJ4VDlRQVRZOUJ5d2JVa0M4SmMyVXRQTmk1NHlEZ1VFaHJGK3QvMVZw?=
 =?utf-8?B?N1BxTDl0RDcyc0lZdm1ESUNrSzgya0c3bXZVZnZBVkhac2haYjU4UmU1MWhw?=
 =?utf-8?B?ZGJac0thaXNqZkQrQ1F6aStBSHVXSFk3aWtTMzFGZE9zZ2RWWXZvRldzeEZw?=
 =?utf-8?B?TVlGSUNkemN5NjRHdCs4bVJVY2xCUDhhSmRKVzVkeGl1MTR2WFNqaXVPNzZB?=
 =?utf-8?B?WVpDTHhDY0hsdVBpZzUvY3BPK2JaMlRmd0xicHVHUEljMjFaTS9JbzVqUHNl?=
 =?utf-8?B?N3R2ck5HYnRDc2JrN2oxSmQwM1I5Zyt2TEltd1dnN2FtL0FYRUZ2NHdpeXBw?=
 =?utf-8?B?aWVzd1dIbVNoNHpVLzZSQ3MraUlIdjBDVlBURW1yTmdCSkNZS1JUNTRYZkxU?=
 =?utf-8?B?VEFUajd2cnZaNEw2RlNBNDFWM0xlbGwweFQ1RHhVQjRKT0ZNNG1ubXp2dWZ0?=
 =?utf-8?B?SDhPQXlUa2dkc25ZYUVCeHhTZTIrdCtFVUplQzhhc0FBanozVXFGVlMwaUNY?=
 =?utf-8?Q?mIZZE0f7H0wLl+Ah5R1G6B8qOnfMNDAI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlZtY1doTFh5WGhkOFpHNjVyM3BYR2YrRWhTWHRLVUtZT3JLNGVHNiszTFBE?=
 =?utf-8?B?dklRNitkMXg5RGJBb3ZKcHZzMVpKQkRWSlNJVnpXMENlQlBHN0VkT2ZoYnhB?=
 =?utf-8?B?QXBYTzYxNUlUTFFNZXpZd3NmQU1FUjljWExQNXNWc0FYT210c0RDNys3S1Q4?=
 =?utf-8?B?R3dyemZISEFPY0Q3ejJ0VWxZZU8zQ09Ralp4SlA2ZVJnWVFQbStVYk0yY2VO?=
 =?utf-8?B?L1BtYW1oOUFsc1lQVkRDcXRJTFYySVoyOWk5cE5QWWU1RVBOY0x5K3QwR0FG?=
 =?utf-8?B?WGc1YXNtcjRMZUR5aUxGSFBWd29XZ1h6MzVDQmR2V1BNVFRFL1FTVmMrbE5x?=
 =?utf-8?B?NVYrcTJ3OHA3bWZkN1ZoZFZHVUwzV3R6V295MjhmSWJUWFpUME1SckE2UjFD?=
 =?utf-8?B?eHVhSUk3d2ZiUm9PZEl2WExiS3JxWUNFUHFRTDlkc3RPSlhlMW9VVEh0TkFO?=
 =?utf-8?B?S2xtUzd6Wk9CWGwyQ2FSbkxBWmw2QlZnUEZoaTloVVNQR2FUUVcwakRzNS9i?=
 =?utf-8?B?eVlBaG11T3ZjUGFENWFTeklacmZlcW5tL1hOcnB5c3RxUkhCazRjNFhJNkRX?=
 =?utf-8?B?RGNWSDAvUWx1UVp6L2l6S3ZxcTByOC9JbURqbnZ1eEgra3ZGWThtYUZidEtD?=
 =?utf-8?B?WVFtdTRwVnBsS0dESWFFU3hKcFJ1a1JTU1I1RDFnK2p4YVJjelVUaHMyYzUx?=
 =?utf-8?B?REtSZ0g0WWRueHpBYUFIditTTm9va01oSjZFSkhWVlBHRjlSS0xoUGlTeDND?=
 =?utf-8?B?d3JQWVJ2SmV2Nms1QnFoaUhWMXFuTUVtM0pEOVBtbGd6TjJwZEN5ekxaMFlw?=
 =?utf-8?B?QmFmQWtya3BSTU1JRHI2VmpiTU1oYlBJME1pNFJpTjQzdHZzZFc4S0VhNFlz?=
 =?utf-8?B?OWY4RlJtY1hJU2JUbzBrYTJaQTVsWXk3b3FHNWZQV3ZmTm9uYlgzNWhHelFC?=
 =?utf-8?B?SnN4eS9kaGlUeGVzcE91VElFTE1IZy9BUXQrdGtkR3RXMm92Vm0wK3FQNTk1?=
 =?utf-8?B?U2UydVdSRE5WMG9mVGx0WDBnV1NuV1JkMmd4T25BeHJOaStkU0xyR3BwZEJH?=
 =?utf-8?B?by9Iek5tWnVSTC82cWpiS2VVd25wYlNHUXo3eExMNmFWc04wNkdRbGRpRmd0?=
 =?utf-8?B?TUlIWitrWEIxRlUxeHU3NThvMnJNQkx1S3Z1NnBURlJIeVcwa25NbkFiTUxp?=
 =?utf-8?B?Qytpb2ZXZ3IzTkhuSmF0dGFzZVVJU1poZ0t6aXNZVzVPWkpkQlk4bUhjZWhM?=
 =?utf-8?B?S2xhcXp1dG5WUFB6Qnd2Zjg0N0ZwNmQwbHZwOVZPUjdVT3plZE5zZUd5cTUx?=
 =?utf-8?B?cUlLcE8ycnBnb25PeVlQZTdZMzFXd1BVL0JFckU0Q3lJUERmZHNFcHZoTXBJ?=
 =?utf-8?B?VW9hZ1V6OEE4N1JObDFsVHIyb0NpbzFtL0drRk9XOFUzaHdZcTcvd3pqVjdk?=
 =?utf-8?B?MXFSQXJ2N3REd1VwOCs0TGlnTlVrWmRqTTRzY2RaTHcxc0VVWG1NN3g5Vzli?=
 =?utf-8?B?NWV6blhORmIzMUpYc1E3K2ljdVU3K2k5ekxBQWRQaDVBUDNLa01pMzcvdUV5?=
 =?utf-8?B?OTNydEozZHVkRHRweElocGxpMHVkSEdBYmFvdkM2dERicFFZbHVScC80ejJj?=
 =?utf-8?B?UzVHS21oSWY1SzU3SWx3Y0VCRmRVazh2ZDVvRkw1WEZTNkJEOFowRmVnQkVC?=
 =?utf-8?B?ZE1YRDB4VS9WNVczTXFyWVdhVCtuQ1J3ZUltUlpQdGhraEw1a2ZpaUpJOUJy?=
 =?utf-8?B?Sk5aNmJQUWpTSjZ4alZiWjk4Z05pbnAzUUlEWmRtRmQyQjBldldXbk4xS1Rm?=
 =?utf-8?B?RW96SGsvV1pkcy9MU1lpdlVrTk9uQ3E3TUFGMDBkWkZxVk5zb0s1bVFFcWlD?=
 =?utf-8?B?dzUxWmo4WVVYbE1MQkNMdk9lZVIzaE5BcEJwbGx2MnU2bGc5cXJza1VBR2tv?=
 =?utf-8?B?V08vcmhpSy9kOU01djJ1ZHBpY1VLOCtkb1lBdnVMOG11aHFpLzJENGFJWVBM?=
 =?utf-8?B?SVY5MTU1ek1WL0VEeU9YakhwUk5uNnBIOURUS3J6NzhOdmlhV3pmZlRpdFhz?=
 =?utf-8?B?QThyeUhwQnFGOW13bitzTDJvY1pZT1BBaXVPWTE1R1A5eFpSRWRwdk1FUkpy?=
 =?utf-8?B?VTR1SUx1RCtLQkhxUHp6Rkw2czMzZVVMbUtlWU1xdUE0R3Vncng4VXlxSG8z?=
 =?utf-8?B?dHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b50985f-5617-41e8-836f-08dd469af400
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 10:42:28.8699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XChCT8m6hFX1ONk4+B6PiMG+KqvPHLjGlh63D8eIE4FGxKhrWRxawXewWHW8SbkYH8M1fduh6B4ajfQkokcrhmqbWh6x1gMQUOKNpA0zcKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7217

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjUgMDk6MDANCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiA1LzhdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA1NzogQWRkIHN1cHBvcnQg
Zm9yIGVuYWJsaW5nIFNESEkgaW50ZXJuYWwNCj4gcmVndWxhdG9yDQo+IA0KPiBIaSBCaWp1LA0K
PiANCj4gT24gRnJpLCAzMSBKYW4gMjAyNSBhdCAxMjoyOSwgQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBBZGQgc3VwcG9ydCBmb3IgZW5hYmxpbmcgU0RI
SSBpbnRlcm5hbCByZWd1bGF0b3IsIGJ5IG92ZXJyaWRpbmcgdGhlDQo+ID4gc3RhdHVzIG9uIHRo
ZSBib2FyZCBEVFMsIHdoZW4gbmVlZGVkLg0KPiA+DQo+ID4gV2hpbGUgYXQgaXQsIHJlbmFtZSB0
aGUgZ3BpbyByZWd1bGF0b3IgbGFiZWwNCj4gPiB2cW1tY19zZGhpMS0+dnFtbWNfc2RoaTFfZ3Bp
byB0byBhdm9pZCBjb25mbGljdHMgd2l0aCBpbnRlcm5hbCByZWd1bGF0b3Igbm9kZSBuYW1lcy4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1Ny5kdHNpDQo+ID4gQEAgLTYwMiw2ICs2MDIsMTMg
QEAgc2RoaTA6IG1tY0AxNWMwMDAwMCAgew0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
c2V0cyA9IDwmY3BnIDB4YTc+Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRv
bWFpbnMgPSA8JmNwZz47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRp
c2FibGVkIjsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdnFtbWNfc2RoaTA6
IHZxbW1jLXJlZ3VsYXRvciB7DQo+IA0KPiBzZGhpMF92cW1tYw0KDQpPSy4NCg0KPiANCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gIlNESEkwLVZR
TU1DIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4t
bWljcm92b2x0ID0gPDE4MDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIH07DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4NCj4gPiAgICAgICAg
ICAgICAgICAgc2RoaTE6IG1tY0AxNWMxMDAwMCB7DQo+ID4gQEAgLTYxNSw2ICs2MjIsMTMgQEAg
c2RoaTE6IG1tY0AxNWMxMDAwMCB7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRz
ID0gPCZjcGcgMHhhOD47DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlu
cyA9IDwmY3BnPjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJs
ZWQiOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB2cW1tY19zZGhpMTogdnFt
bWMtcmVndWxhdG9yIHsNCj4gDQo+IHNkaGkxX3ZxbW1jDQoNCk9LLg0KDQo+IA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiU0RISTEtVlFNTUMi
Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNy
b3ZvbHQgPSA8MTgwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgfTsNCj4gPiAgICAgICAgICAgICAgICAgfTsNCj4gPg0KPiA+ICAgICAgICAgICAg
ICAgICBzZGhpMjogbW1jQDE1YzIwMDAwIHsNCj4gPiBAQCAtNjI4LDYgKzY0MiwxMyBAQCBzZGhp
MjogbW1jQDE1YzIwMDAwIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8
JmNwZyAweGE5PjsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5zID0g
PCZjcGc+Ow0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZxbW1jX3NkaGkyOiB2cW1tYy1y
ZWd1bGF0b3Igew0KPiANCj4gc2RoaTJfdnFtbWMNCk9LLg0KPiANCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gIlNESEkyLVZRTU1DIjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0g
PDE4MDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9y
LW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IH07DQo+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4gICAgICAgICB9Ow0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNTdoNDQtcnp2Mmgt
ZXZrLmR0cw0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1y
enYyaC1ldmsuZHRzDQo+ID4gaW5kZXggMGI3MDVjOTg3YjZjLi4xZWNlYTM4NzJlOTQgMTAwNjQ0
DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0NC1yenYy
aC1ldmsuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1
N2g0NC1yenYyaC1ldmsuZHRzDQo+ID4gQEAgLTUzLDcgKzUzLDcgQEAgcmVnXzNwM3Y6IHJlZ3Vs
YXRvcjEgew0KPiA+ICAgICAgICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOw0KPiA+ICAg
ICAgICAgfTsNCj4gPg0KPiA+IC0gICAgICAgdnFtbWNfc2RoaTE6IHJlZ3VsYXRvci12Y2NxLXNk
aGkxIHsNCj4gPiArICAgICAgIHZxbW1jX3NkaGkxX2dwaW86IHJlZ3VsYXRvci12Y2NxLXNkaGkx
IHsNCj4gPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZ3BpbyI7DQo+
ID4gICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gIlNESEkxIFZjY1EiOw0KPiA+ICAg
ICAgICAgICAgICAgICBncGlvcyA9IDwmcGluY3RybCBSWlYySF9HUElPKEEsIDIpIEdQSU9fQUNU
SVZFX0hJR0g+Ow0KPiA+IEBAIC0yNDQsNyArMjQ0LDcgQEAgJnNkaGkxIHsNCj4gPiAgICAgICAg
IHBpbmN0cmwtMSA9IDwmc2RoaTFfcGlucz47DQo+ID4gICAgICAgICBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiLCAic3RhdGVfdWhzIjsNCj4gPiAgICAgICAgIHZtbWMtc3VwcGx5ID0gPCZyZWdf
M3Azdj47DQo+ID4gLSAgICAgICB2cW1tYy1zdXBwbHkgPSA8JnZxbW1jX3NkaGkxPjsNCj4gPiAr
ICAgICAgIHZxbW1jLXN1cHBseSA9IDwmdnFtbWNfc2RoaTFfZ3Bpbz47DQo+ID4gICAgICAgICBi
dXMtd2lkdGggPSA8ND47DQo+ID4gICAgICAgICBzZC11aHMtc2RyNTA7DQo+ID4gICAgICAgICBz
ZC11aHMtc2RyMTA0Ow0KPiANCj4gQW5kIHRoZW4gdGhlcmUgaXMgKGEpIG5vIG5lZWQgdG8gY2hh
bmdlIHRoZSBuYW1lcyBoZXJlLCBhbmQgKGIpIG5vIGJ1aWxkIGZhaWx1cmUgaW4NCj4gYXJjaC9h
cm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA1N2g0OC1rYWtpcC5kdHMuDQoNCkFncmVlZC4g
V2lsbCBmaXggdGhpcyBpbiBuZXh0IHZlcnNpb24uDQoNCkNoZWVycywNCkJpanUNCg==


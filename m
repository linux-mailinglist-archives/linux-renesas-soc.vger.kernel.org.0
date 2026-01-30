Return-Path: <linux-renesas-soc+bounces-27736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PNVAAwUfWnCQAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 21:26:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF0BE683
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 21:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EBE53003EDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 20:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B99350A38;
	Fri, 30 Jan 2026 20:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uOGY5MhB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD7324EF8C;
	Fri, 30 Jan 2026 20:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804779; cv=fail; b=MHOgZz0Rg9PoVrGCMpywCprPOpSd+9IiGwGWNwFbu8VTYqTem1LrD/Mxv2LXaOlJiOsm+HnA1dxK+DIOJmJe40+4pmzTxYWe65b/+gWQEdH99W2cHgSpK2BEww2p007tYNOhU3q0ZYYleiY1j2ZfCWLba59IzrFPjBb+0NajJ4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804779; c=relaxed/simple;
	bh=N9cR9PggBiEovbPayNedRxqoyiDcUVm/51lcL4cQVUM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=REe2w/RNXNQ1YPjmXa7T/T6g0VTB49fy40/42TAx9xYmfMGoJ0OYIh9JOUj7w+npkYm9k5HCT0/ccTXZgnsk7AWXzna7Iu7w4+IIeBU9h79DoFzgLtgDqy4K7Ob7Qs/JgFxhuE1CelE6xXo3WYASXPeRDSh6Po+DrEHQNQOe6RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uOGY5MhB; arc=fail smtp.client-ip=52.101.228.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uq7yGOkBXfGho1e7Iv3hUnOOZrTvmoKCOotXSSo+nVikio+jeoU8Rp14B1m4+U6zxN9vb5BNsXqGzpCJaS/PIypK7n6Ou5JDW4tWXWDUQtPKUXZya6S11jRNn9v8SY/zc8BmXSXS21dxe5EEtYr38Q8RX0a9hQVXUcnADuIn9SFkSYAxmY/2SAVbT5uEiTMPFgYfKsGZtMuONi39FIHokVfJRCOHME1v/H4tKEh2yW7VafmlvKQJWycot8m9EsBZSqM8io+ze5/2FIHEod3RsE27xdNGiB86LUXK5AcjZAXtwX/PSnxwrgEfOKtZzDrAeGbr0Oa8MSvXvcBHz9kMKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9cR9PggBiEovbPayNedRxqoyiDcUVm/51lcL4cQVUM=;
 b=tsT9cB+viREjN1sgeJDea8908Wf1+CcD7BWWxQL3qhC7czCFfmxecw94mFUIE1VtQ6U8DWSwS8x5v+QdSIytLqYAHMqeP8K4F5ZTL52er/HyDHv1VWtUzl7bV0wxK3G6X7CZmi4XljjXQ8gg2dnnZYMX7R79LlStVq01dmxn4kqVfKmXQYOP4mBY6+0JSb+sLjth8Z1IIEC8BJkasXi59QIPKn0vLduZQmbyGXWkaYSR6IRkHrwLF8xTrgrRguAhOxS7Rb+eAPqUzAfxm+K+xLSFwqpdzEjaSfM1xF22t3OBc84uA2x1jPQsxiJmgqNmM4T7p68gq8v0DMPfZWuYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9cR9PggBiEovbPayNedRxqoyiDcUVm/51lcL4cQVUM=;
 b=uOGY5MhBq1AyXdEJybi7DnTziB+d42KRJGLkBwAdGKT9c52h1WmDZKinzy2kcb52zTQNDQpX6yjuxM/MHGmk3gBGrgiVTdn+jUytRT0DBLraSwqYAibLN2/X20PRzyA3aHVGOcaLzehWcjxqDwXNnHU+dQ1fFiLSjPMtl648wlE=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB9633.jpnprd01.prod.outlook.com (2603:1096:604:1d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 30 Jan
 2026 20:26:14 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 20:26:14 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v4 10/15] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
Thread-Topic: [PATCH v4 10/15] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
Thread-Index: AQHckWg9J6VICMEdj0C+MpHZFoewFbVqvU8AgAAUZICAAFhT8A==
Date: Fri, 30 Jan 2026 20:26:14 +0000
Message-ID:
 <TY6PR01MB1737734A4B0B4A26E2AC9B595FF9FA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-11-john.madieu.xa@bp.renesas.com>
 <e53b50e2-72dc-47c3-be52-cefa593dd30a@tuxon.dev>
 <CAMuHMdXiQeMgJhs9QvEcBNeGRf85Fi0w-WODyaGBDrOdZeSgPg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXiQeMgJhs9QvEcBNeGRf85Fi0w-WODyaGBDrOdZeSgPg@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSZPR01MB9633:EE_
x-ms-office365-filtering-correlation-id: 5f03d0d3-71df-4b7e-8a31-08de603dd0d0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RGRTNk9tbnZMWnJ4VEllanlSWGlhK0ZiWld3b21xVUtKSXJjaXdDUTgwckw0?=
 =?utf-8?B?TTFxeUFMNExOTGtKME16b2lHeEdLZ0Z1dkpxZ1c0alUycVY3Q1VvN041N0hv?=
 =?utf-8?B?NWNVR2wrbkdVU3NlNzRpN2Z5MUhML3hJUFpvbHppYk5CZzBRNVFjNXNMNmRK?=
 =?utf-8?B?amdQM25vc2VXby9vZVV5VjR1TjJUeDNnSFFzKzR5WWEyYmpwejlkamVybDAy?=
 =?utf-8?B?NThPU0NsK01vbUsrOXhIbk4wbHg4WDdiUEVxYkdjRXVCSjBzbVVkeE1PQzA2?=
 =?utf-8?B?QUVXbjJyNTdhTjgwa2pabkx0UjlrenppUWdkczBDcm5halU4cnU0a1p0QVZC?=
 =?utf-8?B?TjY0WE9rb1Y0N0hQazZkNmlPMGJaUXprWmNIaUgwNGNMZWNoc1VXU29iNXVw?=
 =?utf-8?B?cUFNNVE5TWs4ZmVlTml0a2VoY1dEOFA2UTdveXQzNUxUa0VpVkNvRGdMVzhz?=
 =?utf-8?B?dGRtVkdycDdqV3NuQ2RvSHdqdGlEYk1xV0k5Q0pUcXh3VWUwSWxJVTVuZVVz?=
 =?utf-8?B?SnJIcWFWcE00S2w4Mm4rNHBGVXUxTExJU0FacGhCaFFRZFpKeUhZYUp6ZGJN?=
 =?utf-8?B?ZG0vTnJLRTliYStJYWx4RkphMnhvMkhSWEdHRjlQNGdkL2VyVjYwQUdzTUZP?=
 =?utf-8?B?VGpXQUlDYTFwSUU1TGhRYzlnVDZqbUhlZE4wZDVESnp3ZVVHZi90RUR5WHZ3?=
 =?utf-8?B?aFRaa2xtL3R4OTJDMERDejJrcnFUS2RyS0xxYXEzWTU2SFZiaURSTDg1dy81?=
 =?utf-8?B?aFVKQXVud2ZPcSsrSjE4dGRieUx4a3o5Tk9RYUxha1d5SUx2TWpnbFllU2Vt?=
 =?utf-8?B?NThsLzRuMlY4QjdTbWtPRnBhUzZiMnpTWnpmYUE0SXRPNkxSZ1ZSdnR2TGRa?=
 =?utf-8?B?bmNJbjlCd0JlOG1sWXNLWlJhN3NqeTRxTGttMGEwTUhCLzd6Rmx6R0MyeWdl?=
 =?utf-8?B?d051bVJkb3Z3cE9pM1VBVlpVbFNKeGZsZEhCTE4weVc2V2dzM1RtU054ZHY3?=
 =?utf-8?B?dkxEV0NVeTVnaEQvUFU1a28yMERJVkZ5bnNqZDVEL0dCSFBFZ056U25lWWN6?=
 =?utf-8?B?THZvNmVsS0hodkp3MmxzWDFNVmFkNk9zRzJ1QUJKNGlocjJyN1VyeDZXOVlp?=
 =?utf-8?B?cUtsSEk1TlNDWXoyQ01BdDM3RUtCcndKOTd6MFZ5KzJTK0tlT2tsNFNhWHpP?=
 =?utf-8?B?VHdKRVE2cnp3c2tkZUdIMlJPcEJadnFIUmxJZzVjYnV5aG0vZ0RiTWtuSTIv?=
 =?utf-8?B?SlJVaE40TWo4UzRZR09Ocld0SGY3UkllUGE5SEk5VThzeU8rM3lIaVZ3am11?=
 =?utf-8?B?eDEvdysxWTdyVDZPSG5tbDMxdHJCNTh3eXZ2OVJjeC9sbkNRSFdSR3VHeDFY?=
 =?utf-8?B?Mi9ZRjlSTHpGalV2bWh5M05vUVVoWnJ3aDBCaGh5MmFCZVhSVXhwcnVrRGR0?=
 =?utf-8?B?ZU0rQkFocnNoYjYxZmNXblhjN2QrLzNmRVdWcUpla2NIbVQ5WFl6ak5hamta?=
 =?utf-8?B?a3Zwekhvd1dRbC9uK29WejhnUGRjTm4wNU1TaSswRVZGYlVvY0lieXV3MUxX?=
 =?utf-8?B?YjRCSjY2L2VPN1ZNTGU0L3RZNWh1QkFKanlZd1ExTXBIejE1YTk3Tlo5L091?=
 =?utf-8?B?VFRVOVN0RlFXV1oxdXprdXRWL0kyNXVBa240RWY5Vm1Sb0JFMUZhQVR6UGdp?=
 =?utf-8?B?RSsxakMzSm52K2cva05yVkVEaVN0Z1hiaXVzVS92TkZpNnB3ckswQ1RIZ0ti?=
 =?utf-8?B?MmdDb2VpMEhqL1RuNGFDY3lCNzdEL2ZvbEJNYjJIK2liZ3NzNitmMWE1RmJu?=
 =?utf-8?B?WFBsZUtxeW5OazdRaTBlT1VUMWlQZ0hCdGJ4akxMMzJ1MHZocjJHQUtPMmRj?=
 =?utf-8?B?V25hY1VITjJUNS9Eb3J3ZFRXaSs5aGJUL2YyM2FSSGpYRVN5d2xiNEdyM0JM?=
 =?utf-8?B?NFhsbW5KaXcxbnhVSEJ2QVdSTjh6ZCs3SVVTOUFMeVdKc1J4cW9ZcXJXNk95?=
 =?utf-8?B?elVpN1RhbkhHYVFTeDJkU0pLc1lkVlZwY2tDUk00Yi9qN0N1UVNFN0xaUi9n?=
 =?utf-8?B?RGNkV1VqMFQrWERnQTRjck1ORFk2TzEzcjhWdW5RRk9USDJzTEg2OHZiZnUx?=
 =?utf-8?B?UkJjUzhtSS9kWGxjRkRkWEdtaWFodWE5dW5MT3RsVFpsYkxLZzBndkEwWTA5?=
 =?utf-8?Q?HIG9HedQmtGd6i7Y4F9RENo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjFGZ25OZ1kvMGFWRFpPNXdCdi9PaWU0UTl1d2xaem9PSjRvNnZvR0RNSFdH?=
 =?utf-8?B?K1J4TDdaUUN6akdrcXovclBnUmJDaHNzQVpzUnAyK3UvTnUyd3p3SDY0UmMz?=
 =?utf-8?B?UHd4dmFtTWYwblhSampQWC9kMVRJR1NBVkJvZFFXaEttcEtMMXA3c3MxYUVF?=
 =?utf-8?B?TS9lRTB4alNGYTluTmZVSE5uMnFzUzllUm1qa2FySHl6T3kwaHRRalNOcHhD?=
 =?utf-8?B?QVBCSzdLVlBNRWhQZFpmNWRVcHVRWnlpa2wrZlZNMmVPK24vOFZ1TXFqYXhM?=
 =?utf-8?B?NzZUVXdsVXp3OTNtd0w2L2xYVXFwV21XZi9zRUFtNEpTQ1c5cWIwRC9JdEsy?=
 =?utf-8?B?MEMxdExZbkRBU2h1L1o4MVVmUWtac0hnbTNyZnI2YVI0RndFVDAzL1ZzYTlY?=
 =?utf-8?B?SkxFckZjNHplaGdrRVRialZtbllnTy9PZzdYNGJNOXVpSzVibnBxcVVNSGYw?=
 =?utf-8?B?TWc5cFpjTGlYOWRITExCNGhYZjBFNWV3Tlo2THRTRUlpeFdjbFozUnBFaTdN?=
 =?utf-8?B?R2ZrOEo2c1VsaEdqTmliK003eE82dU9rQ0FOQVFTdXJieGFmajRSNmZ4bmRz?=
 =?utf-8?B?KzZJNlRLYUFYTXlqVURWN1djRG9ZSmI5cFFHdmVEdjRjUFRRaFZZd1FRaU85?=
 =?utf-8?B?UmpxZTBWWmFxZEFXN2JoYzY4RExpRE9Yamw4d3lMZmlxbDhCOXJRWWt0MDlw?=
 =?utf-8?B?NW5OVDJUMXZ6eGtNZHhnTHdlem1aTzAyNGNRWVU5R0lHSWcvVzRnUGhLbUtG?=
 =?utf-8?B?NHhoSUgzZ2d2S21oSE83Z29Wd0NTc0RweFYyc005Ny8vMVkxTzR0SmFDOTR2?=
 =?utf-8?B?ZE0rU1o4WXptNWlmTXlUNkdaMS90NFFrVlFZaFBnb0JUbURhTjJvWFdJblZl?=
 =?utf-8?B?OFNvY1BDUEJZVGxiKytJQktCNkdIeHBHSHlPVFptZldtYlhwUG53OHRacGV0?=
 =?utf-8?B?TXV3bjU5czlzS2NVUVhrT202NWNsN05ZNW55QkhRVEYyZEMxK0N2UlRaMzJQ?=
 =?utf-8?B?K3pDdmFEY2lqS0VNMUhTY0xNOFBTVlRRMXNIV3J4amVyMENKcExzUkZsY2pG?=
 =?utf-8?B?WGl3UWF1MUNyWkpNOVYveGFTcStrL3ZIQVluOUlRaWJTcmZCa2UwUlIwZFlV?=
 =?utf-8?B?MzdoenRCY05WRTNZbitNbHQ2ZFJZMXhLN05Sb2tXS2ExSThOVjlrc0tpL0FZ?=
 =?utf-8?B?UUNsM1grUGhodUVrbVQvb2Q1NVdHWG9RYlpEdXVGMGI3aFBGY1pxZGs5ZHhu?=
 =?utf-8?B?QkZoYXBtWVpkUVp3N0JOMVdXOXhCYUxmTWxEaGdmS1Z0N3drcFhLell1Tmt0?=
 =?utf-8?B?SHJNc2lGUUZUVjhhZ2JZcnowWWdCS2h0UXpmVUdFZE5QbW1URnNkMFU3L2lE?=
 =?utf-8?B?a3JwUk5wMUhFRTJIYVI1ZUpnS2xUVXUwOElKcFJuNzBCQzdzY1B2RE5JYnB6?=
 =?utf-8?B?QmxCU2wwUWdKZ2tXTFNSVEtVcjRxQkdZRWtpaEh2NCsrajlyOEIxSE5NL2pq?=
 =?utf-8?B?YlRuOW43ZWNGTWRLM3hUdWYycEVrL2VwWjFWZ2pDR1c3VkdBWGg2S1ZFVHNk?=
 =?utf-8?B?UFdwNEFVOWxXaFdRL2tpTUpCVVh1SnFMaHNFQjlwWENxaUtYZVF0eUJoYkV1?=
 =?utf-8?B?blUyZ20zYzhhcjVnWFVpUXhOYlF0MzIzZ0JPalg3SllpS1g3ZzFuMEJ5a1JL?=
 =?utf-8?B?T1Vvd1dpV0o2czVNVU90SXAwM1JIQ1huRkUrY3ZDREwrTUNTR2ZmeVJ4STd6?=
 =?utf-8?B?d1VaWDJKdVFLSXE2RkNGWThFRTN5Q3o4dzU1QVJnekNKeUdmOVRPVkVFdVJO?=
 =?utf-8?B?ZFMvVk9uYXVGbnM0Z0ZkbjZFQlpDQTBnWDZkZEJCRGxZRllzamhYK3hnU2lO?=
 =?utf-8?B?ekltc3Y5SndjeU16ekM4RXh0VGppUlRIdDV3ODhBaGlVc1hWSmRmZjZQakN5?=
 =?utf-8?B?M3ZRcGw5QXVWbTNpd3RIa0tYRk5ucEVjazJqWWVKK2hpcHk0Y0Fjd0Z6TlI2?=
 =?utf-8?B?bWl1ZTkxby96UFhMdUE5bW13aFIyZitTUzZYT0JDaEk5MDRLb2QrS1c1ZjBa?=
 =?utf-8?B?VFRzaVExSlRiRXVHSk1jMEJncUhPTkpZSHVYdE9jUzZ2bEllMUVLM0xHdnVP?=
 =?utf-8?B?dEU0WHltdFdXV2srSWY0TDYzTDV4aGJLb29pK1Rzd20xdG1SU3N4SXBOamoz?=
 =?utf-8?B?a3ZPTXYxWlo0MDJoWHp4MGZZRHZvTVVPNHA1a0dNcGdmWlovRCtOU3F1UlJ2?=
 =?utf-8?B?dFF3Nlp2MTJGMlhjcWFPK3JRZFpIcVB4QmlHQUd6cWpvMStoUHcxZnZOR01M?=
 =?utf-8?B?UHVmWGF2cHZpMTJIaVZIdnowY1RjREp4TG84cFhrSCtvY285YWEwekZiTHAw?=
 =?utf-8?Q?6HgL6xXbPs8iHgX4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f03d0d3-71df-4b7e-8a31-08de603dd0d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 20:26:14.5203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8f8RGMG25I7wqqMZyG/R5cDrivs4QakX9fZRICcNsVZv4QvDVkqzVpRXNh4692QiAizCvjNivhWj1HvsZpvcVemtzJ88qjFyhbgdFL8YbZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9633
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27736-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,linux:email,bp.renesas.com:dkim,renesas.com:email,tuxon.dev:email,glider.be:email,linux-m68k.org:email,m68k.org:url]
X-Rspamd-Queue-Id: 57EF0BE683
X-Rspamd-Action: no action

SGkgR2VlcnQsIENsYXVkaXUsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMzAsIDIwMjYgNDowOCBQTQ0K
PiBUbzogQ2xhdWRpdS5CZXpuZWEgPGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gQ2M6IEpv
aG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT47IENsYXVkaXUgQmV6bmVh
DQo+IDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT47IGxwaWVyYWxpc2lAa2VybmVs
Lm9yZzsNCj4ga3dpbGN6eW5za2lAa2VybmVsLm9yZzsgbWFuaUBrZXJuZWwub3JnOyBnZWVydCty
ZW5lc2FzQGdsaWRlci5iZTsNCj4ga3J6aytkdEBrZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7
IGJoZWxnYWFzQGdvb2dsZS5jb207DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IG1hZ251cy5kYW1t
IDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBCaWp1IERhcw0KPiA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+OyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5lc2FzLQ0KPiBz
b2NAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+
IGNsa0B2Z2VyLmtlcm5lbC5vcmc7IGpvaG4ubWFkaWV1QGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY0IDEwLzE1XSBQQ0k6IHJ6ZzNzLWhvc3Q6IEV4cGxpY2l0bHkgc2V0IGNsYXNz
IGNvZGUNCj4gZm9yIFJaL0czRSBjb21wYXRpYmlsaXR5DQo+IA0KPiBPbiBGcmksIDMwIEphbiAy
MDI2IGF0IDE0OjU1LCBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0K
PiB3cm90ZToNCj4gPiBPbiAxLzI5LzI2IDIzOjQxLCBKb2huIE1hZGlldSB3cm90ZToNCj4gPiA+
IFByb2dyYW0gdGhlIGNsYXNzIGNvZGUgcmVnaXN0ZXIgZXhwbGljaXRseSBkdXJpbmcgUENJZSBj
b25maWd1cmF0aW9uDQo+ID4gPiBpbml0aWFsaXphdGlvbi4gUlovRzNFIHJlcXVpcmVzIHRoaXMg
cmVnaXN0ZXIgdG8gYmUgc2V0LCB3aGlsZQ0KPiA+ID4gUlovRzNTIGhhcyB0aGVzZSB2YWx1ZXMg
YXMgaGFyZHdhcmUgZGVmYXVsdHMuDQo+ID4gPg0KPiA+ID4gVGhpcyBjb25maWd1cmF0aW9uIGlz
IGhhcm1sZXNzIGZvciBSWi9HM1Mgd2hlcmUgdGhlc2UgbWF0Y2ggdGhlDQo+ID4gPiBoYXJkd2Fy
ZSBkZWZhdWx0cywgYW5kIG5lY2Vzc2FyeSBmb3IgUlovRzNFIHRvIHByb3Blcmx5IGlkZW50aWZ5
IHRoZQ0KPiA+ID4gZGV2aWNlIGFzIGEgUENJIGJyaWRnZS4NCj4gPiA+DQo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IA0K
PiA+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYw0KPiA+
ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJ6ZzNzLWhvc3QuYw0KPiA+ID4g
QEAgLTEwNTQsNiArMTA1NCw3IEBAIHN0YXRpYyBpbnQgcnpnM3NfcGNpZV9zZXRfbWF4X2xpbmtf
c3BlZWQoc3RydWN0DQo+IHJ6ZzNzX3BjaWVfaG9zdCAqaG9zdCkNCj4gPiA+ICAgc3RhdGljIGlu
dCByemczc19wY2llX2NvbmZpZ19pbml0KHN0cnVjdCByemczc19wY2llX2hvc3QgKmhvc3QpDQo+
ID4gPiAgIHsNCj4gPiA+ICAgICAgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSA9DQo+
ID4gPiBwY2lfaG9zdF9icmlkZ2VfZnJvbV9wcml2KGhvc3QpOw0KPiA+ID4gKyAgICAgdTMyIG1h
c2sgPSBHRU5NQVNLKDMxLCA4KTsNCj4gPiA+ICAgICAgIHN0cnVjdCByZXNvdXJjZV9lbnRyeSAq
ZnQ7DQo+ID4gPiAgICAgICBzdHJ1Y3QgcmVzb3VyY2UgKmJ1czsNCj4gPiA+ICAgICAgIHU4IHN1
Ym9yZGluYXRlX2J1czsNCj4gPiA+IEBAIC0xMDc3LDYgKzEwNzgsMTMgQEAgc3RhdGljIGludCBy
emczc19wY2llX2NvbmZpZ19pbml0KHN0cnVjdA0KPiByemczc19wY2llX2hvc3QgKmhvc3QpDQo+
ID4gPiAgICAgICB3cml0ZWxfcmVsYXhlZCgweGZmZmZmZmZmLCBob3N0LT5wY2llICsNCj4gUlpH
M1NfUENJX0NGR19CQVJNU0swMEwpOw0KPiA+ID4gICAgICAgd3JpdGVsX3JlbGF4ZWQoMHhmZmZm
ZmZmZiwgaG9zdC0+cGNpZSArDQo+ID4gPiBSWkczU19QQ0lfQ0ZHX0JBUk1TSzAwVSk7DQo+ID4g
Pg0KPiA+ID4gKyAgICAgLyoNCj4gPiA+ICsgICAgICAqIEV4cGxpY2l0bHkgcHJvZ3JhbSBjbGFz
cyBjb2RlLiBSWi9HM0UgcmVxdWlyZXMgdGhpcw0KPiBjb25maWd1cmF0aW9uLg0KPiA+ID4gKyAg
ICAgICogSGFybWxlc3MgZm9yIFJaL0czUyB3aGVyZSB0aGlzIG1hdGNoZXMgdGhlIGhhcmR3YXJl
IGRlZmF1bHQuDQo+ID4gPiArICAgICAgKi8NCj4gPiA+ICsgICAgIHJ6ZzNzX3BjaWVfdXBkYXRl
X2JpdHMoaG9zdC0+cGNpZSwgUENJX0NMQVNTX1JFVklTSU9OLCBtYXNrLA0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKG1hc2ssDQo+ID4gPiArIFBDSV9DTEFT
U19CUklER0VfUENJX05PUk1BTCkpOw0KPiA+DQo+ID4gQWNjb3JkaW5nIHRvIGtlcm5lbCB0ZXN0
IHJvYm90IHJlcG9ydCBvbiB2MSB0aGlzIHRocm93cyBhIGNvbXBpbGF0aW9uDQo+IHdhcm5pbmc6
DQo+IA0KPiBZZWFoLCBpbiBjYXNlIG9mIGEgbm9uLWNvbnN0IG1hc2ssIHlvdSBtdXN0IHVzZSBm
aWVsZF9wcmVwKCkgaW5zdGVhZC4NCj4gDQoNClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQu
IFdpbGwgdXNlIGZpZWxkX3ByZXAoKQ0KaW4gdjUuDQoNClJlZ2FyZHMsDQpKb2huDQoNCj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAxMTUyMTA0LnBWOXVNUzc2LWxrcEBpbnRl
bC5jb20vDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiAN
Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==


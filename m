Return-Path: <linux-renesas-soc+bounces-15935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E2A887F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 18:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5CB170CB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E1C27587A;
	Mon, 14 Apr 2025 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wTd8jtl7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842121991B2;
	Mon, 14 Apr 2025 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646651; cv=fail; b=CNOaf0ONa5hasNZQ3R8aUs6qS8zzbfiTYmtA8FebAKID05G1DK47oyhjBAtDDdvEsLhFuSjFvcW8f45tuWNNJ2jv7dIk2onep8EhzQRz0cIAwQPirPUMZQiaBSW4WXIFuayFgxGPeK0ETtRA/3RtRdBB0SQlel54SBNcIOOrd7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646651; c=relaxed/simple;
	bh=O9CG8STbUS/EJiBJ9NBRLaxo4pafaUTFzGlDk89IW+w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UrfbQqVW5nX2fcznqs6iAP+PW1zGevY2k5y078S/vuFQOKnUiE57+qQ1RyEmx0JEIqxchuV4LuCMFADy+wmDmpwbrrRE8xCC+ut6i8X/c/ES7HoTWfLMFmLrYN3WWvQBy+g+4tuFwd++/xcRvGPU1Lq07yNw/HrUo5eHph4M/2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wTd8jtl7; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wh5eZSTim9ZHTvrqRAu6mY20Dnis5eGrFG2Hwaj5pHVulCsxHi52pvn1/Lf+6KjUuDJO4NL+lSYTdrSMhzkrVrLTbKSv40HoSJW3VjikemSAIS7aAQNPdoKbd4M7UE6AjwVc/ksR69iUrN3F81rRq1meGWbd3FLA4uIE9kuGUUkWAfo6lgiKq0BYAQOwX9gyp8JfVx2/Zh6yOuAkErxx6QcmNLfQB5Syn4xW2ba7mANX1Xf7KR500gvrn16niuCHuU60u7uRlSywO/vjTeE7vwM3WUgUxSYFhk9WsDy66ztJJ704plR2cJvnZgpfQaZzNqVVmiNHDIxd4zg3wyvhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9CG8STbUS/EJiBJ9NBRLaxo4pafaUTFzGlDk89IW+w=;
 b=B0qZvN3IFtzQBxp8SkhRZniYZ2vXAjVrMgx42tZ1CbDB3Ma17orA7KX0MJQ2albwvyDsUhVoowL9csIal3F1Hc4ro7O92BakS0pe9uCXbCEg/o+wxCmcSkgXD5DFyUu55B9RpcvZiqJMx5FpqpZq78F5zvX/TD9Q3LhtrCYWCD/3EVUbCLlfA/63Y+geTSVbdFoxSb/asktD7DSFaPbuXBZuXpYZUP5G2KD7p9bLBme2aH2VvDvB/rOJRKizw1P09+Uyps/ol3BBSakHbGJDqDxxBS5Fa0Pd4txzBmZGM3lSS/on17+abH6sczUNMvz24Xo0omIW8rJEksBZo55/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9CG8STbUS/EJiBJ9NBRLaxo4pafaUTFzGlDk89IW+w=;
 b=wTd8jtl7qjPVo4n91ffCBBCCLoryMHKOCbv/o/bgY+5MLx0HwmZe8Wamg/WTWNvk8ZMlNPPjBnOESQpICrCbMqBO4WDXXl29gk+gY11zXFXeF3MsYBApSt2w98zEFi1OC8OyfOUaN8BqeYZutm2Jo0y9JLqTha9TtKy6oSLW8gc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 16:04:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 16:04:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CAN Transceiver
Thread-Topic: [PATCH v2 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 CAN Transceiver
Thread-Index: AQHbmbb0mSE+Pf8OQ0mEbMyt91KQRrOjdF6AgAAC4GA=
Date: Mon, 14 Apr 2025 16:04:00 +0000
Message-ID:
 <TY3PR01MB113460657E91226377615A51C86B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250320164121.193857-1-biju.das.jz@bp.renesas.com>
 <20250320164121.193857-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWSTbVwOzTtTV8DRayvgor52=KwErzhOv2iPJkMy4BXbQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWSTbVwOzTtTV8DRayvgor52=KwErzhOv2iPJkMy4BXbQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB14284:EE_
x-ms-office365-filtering-correlation-id: 965af3db-8495-4d1f-1abf-08dd7b6df84d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VWhzTngzY3FLZy9zN3ZSd3ZlZi9pcFVsYWUxcXdablJRUVc4emlNeUd4Uk01?=
 =?utf-8?B?UUQveWNCVFBBU1BGWWt5Z3VRa0d1N1NsR3Z3Y1AyeVBHTHRDdC9KYVlVM2pQ?=
 =?utf-8?B?UVBvUWZKTzVldnBKMjlobHh6UUZPbmRoT1ZmWG9rUTMxbUxMNjh0d29KOXBn?=
 =?utf-8?B?YkVIQXZJVUszcG5DNHlRL0dia0JrcTkyYUJMOVhIdXpiaTZBY21KUHBrRnF0?=
 =?utf-8?B?WkJKM0orSUNlL09xUkFyZDRncjcwblpqcnlOdERySGIvMzFaMFB6M0ZYbHJl?=
 =?utf-8?B?TGFxdzcza2V5QlBwMjlQL0lVQ1k1Y0U3QU1jelJ5czhzb2psd2hIMlAxS0Ri?=
 =?utf-8?B?SWs4M2lWSFEvRUdyeW5XVmZGY0Y3SEc4REd5dWMyNENyYXlEd1JoUGgvOVpz?=
 =?utf-8?B?WEh4ZVpXNThzc1hMZ2hOMGFLcG1ad1Q2MExmc3BWeUh0cVVwOExKaTNPMG9Q?=
 =?utf-8?B?dEtJV1ZCaklIeG9BL0JZTkk0UEZ4ZHdnaWFyOWk1WWRKMjNlQlZKaXFoN29P?=
 =?utf-8?B?eVVqTlhpZ2htVXBESFFxY21uQTVCTjZ6ZjZlL3ZRd3VJaGoycVFGeWptZ2hX?=
 =?utf-8?B?ejBSY25ydllOMnN6Zmd5cVVTSzZJb2hxK0NjVmFnMFczd3RIdHZMWXo4UDBI?=
 =?utf-8?B?ZjdvSkk3OWk4ZFBqbjJ4TWdFdDRHUTVNREZ5MzZENmFERXFJR0NzVDF6SHdH?=
 =?utf-8?B?UkJHR3RLZFB5Q0pUdm4zR0Z2QkEvOWU2Wm1aOWlCckNnYU9zTmFndi92OWRl?=
 =?utf-8?B?NElTQkZTZXk3NXh4VWo1MjZEWWxaVUF6aTZ5ZEdLNHdXR1FQckltZVRIOEl0?=
 =?utf-8?B?NENqUFBnZ1gxRlJ3aHRKSm80dDFWdFdvSWNBN25oSGFNRFN1a1pqcTg0S0Za?=
 =?utf-8?B?LzYwUTEvMUVGUnQrcjBTN21zc0I2WUMzTEFrWnMrTXF2dkxYQUlrVkZJbTBS?=
 =?utf-8?B?TEhHSVBiVU1JS1JDNUNyd1h4N1J2LzJ1aGNKTksrZnl6VWZXRk1HWndXUURN?=
 =?utf-8?B?UkozUnVyN2szM1pXcmJXY2s2Vi9FaUZ5UDNsVzFWcjlxNUV4eHU0ZUxwV3dF?=
 =?utf-8?B?bVB0bVhCWWkyNGRLdE1IWXV6dDRJMiszM0x2eDVZR1dhQTMzQ0xwd01ERHRz?=
 =?utf-8?B?elFvVjBXUEdFOWRSUVRQdjNQM3JEaHBXSVBzczRiWk9SNm1BUlVnRS9JMWJ4?=
 =?utf-8?B?QnVwdjlxQWZyeHY2Q3pZczlMVExaK2xMOFViaDAzeldKMDZzV0NkSU9teklF?=
 =?utf-8?B?VVhoNVAxQTNjYmhvQmNaUUxVamMyVkdxdGgyYkpBbnQ1N3lDQVloMmppUzlw?=
 =?utf-8?B?TmhZdUpGZ3JHaU5hL3dzSWVSZXVzNTh1MDRpdUh3anJxL3lHRUNDL25DazFY?=
 =?utf-8?B?ZVZzbzNiN0t6U3NUZFIzMWxjV2IwakZRWTl0blJJWTBqMmY3OUZyOUlVN2hj?=
 =?utf-8?B?dFlQNXhOM0k1MEJ4WE5xaWYxd1NxUDdOUXF3WUhLTlRhSGpObmdzTVQyYjUw?=
 =?utf-8?B?aEpLaTRCRjRUZFpEYXVzUzk0RVhMT3hNUVFxb0RxQXlCZVhmYm9GbUFEcGRR?=
 =?utf-8?B?M2NyZHV5R1FBc1ZMdDdHcld0djJyQWpELyt1WWdib2V1R1VmcDFuQ3diWDMw?=
 =?utf-8?B?VmlYQWYvSnZpUGpqRlFmdzRHKzJBazlKdEszaFE5RGpIUjUxbURsa0w2bUUx?=
 =?utf-8?B?N3VKKzlOWStwck5GSTVhRU1mS092YlZhcTB4b016bEQwZEt4cUZSNFUzcGlI?=
 =?utf-8?B?Wm13a280NGJaK2hrWEpicmZVUE10clo4QXIwd1BlNzA5R2Rjakoxdnd2VjRh?=
 =?utf-8?B?UHV6R3p0eG0zbWh6LzMxZXRneUR3ZFpWb2xNRW1MdlNRT3JKZWV6MnlidzlF?=
 =?utf-8?B?Y081b043S0JYTU5kdjVLREhRdEVLN2NjdkRaNy82RU1VODZJMGcrTUhxRjM2?=
 =?utf-8?B?UmI4WlNIU0dpZWVnLytEYk5Ia2VBTlZrZGZMSXlOVW4rbUpGbWRsNkF3UmE3?=
 =?utf-8?B?dWRsaGZQVEVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlNzOWNhZ0NlR0NLRzREVDJiQTFBRG9SS1I4allBcWp0RVVvMXpnSEtldUht?=
 =?utf-8?B?dGNKb3pXQnFsRlJuTjE2VFh4UHdkNmJBdjZlZDJGV0h4UkFreGVDUUVlUmJw?=
 =?utf-8?B?b0NOOTNxZU10STlZY1NrTkphMllsQnFqTDg2WHg3TkthSHhuSlhsUWtRRnFH?=
 =?utf-8?B?RHdqQTFqbmJhWk0xRWdLa3JMZ29jTG9XYTgzNy9SUzg3UXlWY2Q4QkdYSndO?=
 =?utf-8?B?WWdXNjBYdlRFNXZhVm9rOC96VzYwS2JLYjMwYjA4QWJ6Vi9iRkNyTHNDY2pP?=
 =?utf-8?B?YXF3aU1NM1RhTE5sMTA5T0FvbXZxSi80ZHI2b2RIcXR2Zzh0Z3o2V0RJWEda?=
 =?utf-8?B?dHh2c1hwT3B5bm80ZmdoV08vYUx5V3c0bXozalI0NksrMSt6MG4wVVNRRzIx?=
 =?utf-8?B?SElpVEd2bzkyTDlFRHRBZjdRY0ZWM3E5V3NNUXg4cVB3RzBKeVZ5Rmk5Nzdx?=
 =?utf-8?B?WHhwR0o3WFlxanBoSkJncytLUnBtdFZrYnR5b0ZPaUwvNjR2c3pSYVhhUENO?=
 =?utf-8?B?ZXlHVGtzSE0wRjBhVmprYmZTd2UxamJlRUk1cktTZWd1V1NMaFErbmJ0UTdh?=
 =?utf-8?B?bHlhbjdZY2UwaWI2SENja3FTbmJzbXZZTFVUTnpMb0l3cU9oUmNrRnlnVkpr?=
 =?utf-8?B?bm80bmJ5d3FFT2ZaWVVURTg2Qi9hcXRicGxNNmJyd1c2SmFVdDRwQWxYbi9h?=
 =?utf-8?B?YVZ1cktvRkVwRUp4ejFMcGpBZThsNW9ZK25IeVJvQXVYR2lKZU1RV1JhYlJ4?=
 =?utf-8?B?Q3RadWtCaEVpYnlRVjA4T3pyL0JHSHNQNFRER2pxTnJiT3c2cjE2d3N5ZjR2?=
 =?utf-8?B?aG10cmRna1czYzVOSUlpZjJWLzFvaEFSamE0elJ2R25TOUxSNUY5MlVyRG5r?=
 =?utf-8?B?YXd3akVENnpqeWZKeDRIcEpmeVFsanI3SUlVSldzQ1F2SHFGblA3Szk1Q0J1?=
 =?utf-8?B?VEJuWHJ2MWU0R0lHMWErZkxjZjYyUG85RWFDalp3b1V1bHU4V1hnUDNBWUJT?=
 =?utf-8?B?YnFlQTA5R0wxTHVZbzNWalRQTy9OL2pWYUNrUTJBM2ljNGdqSFJ1c0ZMais5?=
 =?utf-8?B?UlBSNDErK3JMTExSQjVsYUJKcEVXUTducnJGWXJNa002NlV3Y2ErNHNjMGtK?=
 =?utf-8?B?UkhDaGZ5dHRkUWl5L3dFMnFkMURNd282NmhJVHFDVE1GN2JMTEJqU2xwdVlv?=
 =?utf-8?B?VDNIRFZFUXRxRksvS0JQMlZGMjFyR25HeHphamZKS1QyS2VNblVLWmplWWFQ?=
 =?utf-8?B?Uko1blhzRHBSTFN6RXV2TXZQRFJSYWJ5M1RsRHM2QkVpMVB1bGNxVmxSNjBF?=
 =?utf-8?B?aXBtLzAwR29qVVRNQ3l2aGxVbFozaUhzcTF2U2s4dkpRS1NRVnlUZVEycWw0?=
 =?utf-8?B?RHhjazNSWFZyQ2hKeGZqSFY3Y3VCd0ZhMm9TWTRTN1EzQ2FOTXd2REpOQ0dX?=
 =?utf-8?B?TFhzL21rdVg3MzV2RzVtZmlxRng2cFZKa3VNMzdEeVJCdHhNUitQaFVpWmxR?=
 =?utf-8?B?NzRFaW5JMk5yNSs0MUJCYjNZR0lKcENoYkt4V3ZHRlNFT0hPajBlSy83aXpJ?=
 =?utf-8?B?a3ZzM3gxczlTZzBLSjJlRGpMSS9US2R5NWhJN3duUm54Y2doeU9uZWU0MUxo?=
 =?utf-8?B?UnU5RzRsdittbjF5ZHdCdHFmVEpja0MvQU5TaHU4R0ZLU3hQM2Z4NDM4SU53?=
 =?utf-8?B?V2lacVlBRmZiMld5L2laaHAxTWlBdGhnbjcrcC9RbGxwZFZQY01DNkJyTWtF?=
 =?utf-8?B?VGhSaGtxN2lLS2lDdXpYU0cySVBEOEVGWVBtWjJxblV1Q3Z3VlR6RFJWcmpw?=
 =?utf-8?B?azVnU2NweHlUT3dLQ3ZHMTVhUEdyazVkRmUzelJFUkEyTDVweHRxQ1BmdUxD?=
 =?utf-8?B?c0M5aml3TmtGZk5SZEZOOXZaMjVIWExacW9PczZVTzd6WWpkV3diUm9qRzJN?=
 =?utf-8?B?NEM3WmJrWUJ1d1JOMm5od0pPdmNwWmd6bUFnOUNSZGo1MUFQdzVscTIycWNZ?=
 =?utf-8?B?djJQKzR3MU1QSlNaUDZkWnBySGxtbW90ZllCaVlkZnM0L2JXRjE2R0hHSWdE?=
 =?utf-8?B?Q3V3dWFrNTJOcGxwUTk2MnhlckZtbGwraXI4ZjIyV01LRmRsQ3JvWGtwRjF6?=
 =?utf-8?B?ZWY5cWNDd2FFTlQ2YUtlTVdyUVRTRU95T04yR1M3NU1lTjhFVW43eHBoeW5l?=
 =?utf-8?B?UlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 965af3db-8495-4d1f-1abf-08dd7b6df84d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 16:04:00.3431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMROmylbr7gFxw+FjktuuSU1NO/mPSVomj6QDYyo+3sbR8Lb/L1tysm6Jt1iX7wBKiwWuOb+kZ9eES2IDW6rIOJqd45UvdfkoTR4y0kS1pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14284

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IEFwcmlsIDIwMjUgMTY6NDMNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAzLzNdIGFybTY0OiBkdHM6IHJlbmVzYXM6IHI5YTA5ZzA0N2U1Ny1zbWFyYzogRW5hYmxl
IENBTiBUcmFuc2NlaXZlcg0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgMjAgTWFyIDIw
MjUgYXQgMTc6NDEsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6
DQo+ID4gRW5hYmxlIFRDQU4xMDQ2Vi1RMSBDQU4gVHJhbnNjZWl2ZXIgcG9wdWxhdGVkIG9uIFJa
L0czRSBTTUFSQyBFVksgYnkNCj4gPiBtb2RlbGxpbmcgaXQgYXMgdHdvIGluc3RhbmNlcyBvZiB0
Y2FuMTA0Mi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MS0+djI6DQo+ID4gICogUmVwbGFjZWQgR1BJ
TyBob2cgd2l0aCBDQU4gVHJhbnNjZWl2ZXIuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUh
DQo+IA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOWEwOWcwNDdlNTct
c21hcmMuZHRzDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA0
N2U1Ny1zbWFyYy5kdHMNCj4gPiBAQCAtOCw2ICs4LDggQEANCj4gPiAgL2R0cy12MS87DQo+ID4N
Cj4gPiAgLyogU3dpdGNoIHNlbGVjdGlvbiBzZXR0aW5ncyAqLw0KPiA+ICsjZGVmaW5lIFNXX0dQ
SU84X0NBTjBfU1RCICAgICAgMA0KPiA+ICsjZGVmaW5lIFNXX0dQSU85X0NBTjFfU1RCICAgICAg
MA0KPiA+ICAjZGVmaW5lIFNXX0xDRF9FTiAgICAgICAgICAgICAgMA0KPiA+ICAjZGVmaW5lIFNX
X1BETV9FTiAgICAgICAgICAgICAgMA0KPiA+ICAjZGVmaW5lIFNXX1NEMF9ERVZfU0VMICAgICAg
ICAgMA0KPiA+IEBAIC00MiwxNiArNDQsMzYgQEAgJmNhbmZkIHsNCj4gPiAgI2lmICghU1dfUERN
X0VOKQ0KPiA+ICAgICAgICAgY2hhbm5lbDEgew0KPiA+ICAgICAgICAgICAgICAgICBzdGF0dXMg
PSAib2theSI7DQo+ID4gKyNpZiAoIVNXX0xDRF9FTikgJiYgKFNXX0dQSU85X0NBTjFfU1RCKQ0K
PiA+ICsgICAgICAgICAgICAgICBwaHlzID0gPCZjYW5fdHJhbnNjZWl2ZXIxPjsgI2VuZGlmDQo+
ID4gICAgICAgICB9Ow0KPiA+ICAjZW5kaWYNCj4gDQo+IERvIHlvdSBuZWVkIHRoZXNlIHR3byBs
ZXZlbHMgb2YgI2lmZGVmcz8gIElmIENBTi1GRCBkb2Vzbid0IHdvcmsgd2l0aG91dCB0aGUgdHJh
bnNjZWl2ZXJzLCB3b3VsZG4ndA0KPiB5b3UganVzdCBuZWVkIGEgc2luZ2xlICNpZmRlZiB3aXRo
IHRoZSBsb2dpY2FsIEFORCBvZiBhbGwgY29uZGl0aW9ucyBhYm92ZSBhcm91bmQgdGhlIGNoYW5u
ZWwxDQo+IHN1Ym5vZGU/DQoNCkJ5IGRlZmF1bHQsIHRoZSBzd2l0Y2ggaXMgc2V0IHRvIEdQSU84
X1BNT0QsIHNvLCBDQU5fU1RCIHB1bGxlZCBsb3cgYW5kIHRoZSB0cmFuc2NlaXZlciBkcml2ZXIN
CmlzIG5vdCB1c2VkLg0KDQpJZiBhbnkgc3lzdGVtKGZvciBlZzogbG93IHBvd2VyIGRlc2lnbikg
d2FudCB0byBtYWtlIHVzZSBvZiBTVEIsIHRoZW4gY2hhbmdlIHRoZSBTVw0KYW5kIG1hY3JvIGFu
ZCB0aGVuIG1ha2UgdXNlIG9mIHRyYW5zY2VpdmVyIGRyaXZlci4NCg0KPiANCj4gQW0gSSBtaXNz
aW5nIHNvbWV0aGluZz8NCj4gDQo+ID4NCj4gPiAgI2lmICghU1dfTENEX0VOKQ0KPiA+ICAgICAg
ICAgY2hhbm5lbDQgew0KPiA+ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4g
KyNpZiAoU1dfR1BJTzhfQ0FOMF9TVEIpDQo+ID4gKyAgICAgICAgICAgICAgIHBoeXMgPSA8JmNh
bl90cmFuc2NlaXZlcjA+OyAjZW5kaWYNCj4gDQo+IFNhbWUgZm9yIHRoZSBzZWNvbmQgY2hhbm5l
bC4NCj4gDQo+IA0KPiA+ICAgICAgICAgfTsNCj4gPiAgI2VuZGlmDQo+ID4gIH07DQo+ID4NCj4g
PiArI2lmICghU1dfTENEX0VOKSAmJiAoU1dfR1BJTzhfQ0FOMF9TVEIpDQo+IA0KPiBSZWxhdGVk
LCBkb2Vzbid0IHRoaXMgbmVlZCAhU1dfUERNX0VOLCB0b28/DQoNClNXX1BETV9FTiBpcyBvbmx5
IHVzZWQgZm9yIE1VWCBiZXR3ZWVuIENBTjEgUngvVHggYW5kIFBETS4gSXQgaXMgbm90IHJlbGF0
ZWQNCnRvIENBTjAgUngvVHguDQoNCkNoZWVycywNCkJpanUNCg==


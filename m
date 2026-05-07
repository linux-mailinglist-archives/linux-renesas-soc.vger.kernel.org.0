Return-Path: <linux-renesas-soc+bounces-32238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ3mLPeC/GkcQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:17:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DFD4E819B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06DA4302B3AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AE03EDAD0;
	Thu,  7 May 2026 12:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gqn5je8y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551153B530F;
	Thu,  7 May 2026 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778156159; cv=fail; b=kgoNBDvjOt+YCiWg8HxG8Bqvvl3lZKZijhJv4Wviu8iA+aSSK2d+sG4+eMYMtNYvDb07Y4fw1uY4W53JlFJj/lobbgMVwXa4hSQ290yrocyoidRdIXvTOnzFZBhqvOIUFtg+5YVE4qhLZ2YfRMBhQ6xSVI0B0Egy1yZTbUxsl10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778156159; c=relaxed/simple;
	bh=+qhxGmw9RcnUjpKDBuJzYEjh2wgNYEnf5g/zMBz5DpM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KxwNn4c6jmU1DgE/tRCNAzSR9te8vKQje8Wt/+FfU4AX75ruggWJ+u1qULcY+zMeZUNOCHRxTEs8pxOGkPhSvmbC9IUwjIPuD5V1tPB7C8N1V8cN/mbKD13IadAT+c/wnBw65Zy3AcmhTL+Z7TYhD9lXiYEYKPjghQ0bHvBLEdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gqn5je8y; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwVkI2mUDRdoL/VXdSODqp6Q4NjZ6KsG8ev1HZkvqPIlHG9p8nVMjKu/5UZpaKRt3EzItdajvGa/KVkdAe4rzlai0Y24BeizUp8U4iTv+eTaLHpYa1VevMo0jQt1BYkkqAKx48dbsaiX8iicLChQ7k+2vStR3cnoIIEJOr6evMxs8HtMEjzCWBKSQJNJIfMh9UoiZdwJligTF3dqDH2v6+iqzPATe0syokymcfE+iMdvPlVcyIxIMFteR/rzoILjy28Gr6HGbePNEmZa2PRHCBMiOfhkG701F5GOouX7unUgg5wd9/dzrzDfMNBO34QgxdigtxQKnavggMeVJAOwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qhxGmw9RcnUjpKDBuJzYEjh2wgNYEnf5g/zMBz5DpM=;
 b=DcFoBeXOwFil5SiCsUeFXy4TIFBLDhDP/Wzdav//vj5P58AOM7ejEZBkDvwZB30L9Lgbg1u7kyObrnH9dORsFl9XnQVIQGcbxBExUgjoNQHisN7CX96qnqWMWfmuxAwVRk/93Nv0WE9n/uvRrxRwHgCf3wrEWMg2Y3b/Ntout3aa89Hp/bOd1NTySflg3kZARamn7/CitshN8x2141tvkRgpjjZXsrxVpJS1y60ku3tcLPs4ln2kP97VdzpVovruFsKu2z9E32ipN5UlPJGaTm2nIopP5JLcnWUJikIWyPn9HHszSBdTl80K1kWMxzemsfDF+WH9Yo4c/si5REC6Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qhxGmw9RcnUjpKDBuJzYEjh2wgNYEnf5g/zMBz5DpM=;
 b=gqn5je8ymvUiYkxCPm8Jtm0CSwl+1ub4bca+L8Sk2/PwpAHKazGZEhc9fbS7KiY2uNF8EASLWrQAdkt+Dy0x3jreEi6S2FWJbR6Ml2xttZTdNzHviWv8Hoo2coySjkrE4ijbA91V4iquVUmFwlMfLoTgQHvVEttbZwkEfreLdx8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13232.jpnprd01.prod.outlook.com (2603:1096:405:115::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 12:15:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 12:15:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 6/6] arm64: dts: renesas: rzg3l-smarc-som: Enable eth1
 (GBETH1) interface
Thread-Topic: [PATCH v3 6/6] arm64: dts: renesas: rzg3l-smarc-som: Enable eth1
 (GBETH1) interface
Thread-Index: AQHc2KBoaL1qSyLOkUGOmryTQqmLhLYCgXcAgAADb0A=
Date: Thu, 7 May 2026 12:15:55 +0000
Message-ID:
 <TY3PR01MB11346E862956ADD071B9B1480863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
 <20260430125342.439755-7-biju.das.jz@bp.renesas.com>
 <CAMuHMdV9_UQ7ucnxGZ4GJFbzsVZOvewG=VtwsBj2XwkRJPQa3A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV9_UQ7ucnxGZ4GJFbzsVZOvewG=VtwsBj2XwkRJPQa3A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13232:EE_
x-ms-office365-filtering-correlation-id: 55b127f4-91ed-4719-e56e-08deac3263e9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|3023799003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 umpnAJsk29m6LMwizt9cySy4HGO0vdphs0wXC510EN0U/qljA52MKP2GaMh5N+3QKSuEAHeF/dvxn0Th5qVC8SnY28CD8N65XRh0Z3s5+a3MZhU31zdryI7zHC3LYgPfNN+idbj/UCUlL1sZE+0524VtCcFQZA33Ueq51q8Zh9Z8H9cg8bm4CtGbhwnwT77qV1XsIBGo7vl1cyKgMrTb09pogNs6AkolNSFNPC2fDJJiNIWtuodF9piOjn5E02ZO4jHfUHEN8D2AHC264byE4LbgxR5A9YY/AWgGnmnTzBUDR1NrL/gFWmiL991c8MtlUP1/efL6Rc5vmeH2WnSit9rrjWiK8BpU4pHu8C4wKOuYLv1ioDk6VlS4W/yUi+hiYMhxWG2CX/6/qoryqldQSWRBUhBYJt17zMNU6W9Yz3cByYSIId2zyLTm2yxT5Ol0pacVb/Ru/qs3iubw/KPCxumAJFBs/Fim2sJw4e0jA8eqPp9Zj/35Gdnfu4irCao4y2Dji6Jaoy7zIfLFW7VSsJjxcRKTNzWMlJpI7gkdIe9b0CXgJXghcUA7pQFeXwxwNuWxaW4cRm2oEq2j7LNvWEQmKW8FQHL/WaRFeNkWss5xj+q9bxaJx5YuYeKGjiReK86ctAlr0U0orfB7LxhjattaYcaM/JcwYsA8AL8XH6JGMBOHS31wTP2LN1WcHxyOhzEb1huRRu0jFosMyqDwyL7Yt0Rx2RC3xKAmgwwwQe/qRlhTxSQVHngpxyo62/yk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(3023799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3RoNjBJbzhoVG5wbDluYy9CZEp2VDQxemd4ems1RTRhTnc1MUorelNLdVd3?=
 =?utf-8?B?c1o5TlVxbldXU084Smc4Z2U2K0x5cEtqS2grYlB5Y3phUFJkQ2JrZkNQUERh?=
 =?utf-8?B?eHFMaVpRTXI5eGY1dlU4Qnh6cEUwQzVkZEFvbzcvZmpsQWZ6bWpnb0U2SGFr?=
 =?utf-8?B?cVYvd01RSlhnTXhoVW50N29kUDVnOXRHcVR2amtoWkc2SEo2U2hJMUhKU2xz?=
 =?utf-8?B?cmFvUmY2aEp4R3luQ0RlaXVCSUl3b1F4OVk2M0gwM2JQS2R4OEwweTZjUnpX?=
 =?utf-8?B?N2lyZEg0dE5mb2JwWFJBcmUwUkhwbzJmSXEzbDg5MS9jUDhyZzYxaVNBUFhY?=
 =?utf-8?B?Q05QQm50WWgrV1M0SzhMbEt2MkR4T0I3UnJHaVd1aTNWUklFM2I1YVN2am01?=
 =?utf-8?B?VmVPa0hTY0JlTkgrSjRmVGI1bGw0bHQvcjloRGZxUnowNTJLRlhNVy9zRVhz?=
 =?utf-8?B?NWRxQlpOY2lmb0lxUW5Tcy91MnI5ckUweEdsMDZHdTk4dWdRS1RhZnFvSEpH?=
 =?utf-8?B?d3pWWXdTUHhITUJvK0FhSms1N29BWkV5NU4zQnZpTzcvKy93RXhGTE5DR3Av?=
 =?utf-8?B?eVArM3VleStpZ1ZEZkhNbC9RVncwWG8wWFFIcnlaeDU0MkdYblBUNlM3TmNw?=
 =?utf-8?B?WVZzSG9FSTZEbm9OaXZjdWN3dUdmTTJQaWhlcG53czh6eUZjZzhnYkg5UG9i?=
 =?utf-8?B?T2gvWmlmSUhmRWtOVGxGM1NRQlJQcEthd1VwNlpuV2hEdXhpaFRnajBuM3Fr?=
 =?utf-8?B?eU9LV2VYMmlBSDhGdWZzRGVQdVcrWVFiNWxTY05qNmUxWXhldDF2UHIvWm16?=
 =?utf-8?B?RTNvcm1scWIvWWJaOFd4cW9HUXBDUTRLWHVFZlFsY2JXc2YzVEtBb0pLUXp2?=
 =?utf-8?B?Y3RjRHlBL1dpWFpZTGlPSlZMTEs4MVlTRGs4SHpsZFFFaTkyUUZZT0lnWEJm?=
 =?utf-8?B?NUFxc0Q4dDZRRHhsYzV1c3JFaUk0a2JSQjZZWjVPaXlXaUNYblU2T2lVYWpS?=
 =?utf-8?B?YWt5MlV3TTRVMHdYblVQeVQvWjVXUk9IVzY2QUhiZnN0c0hsU1padzJoc0Va?=
 =?utf-8?B?anZKK3RKalgvVldiM1NwbmJBbnRycm9FM0s1TmFmcUcvNEZwSXcxKzZ4aUhW?=
 =?utf-8?B?ME9rY0RKWDhPUTgxVWhQNXNKSFFSTUpNTXk1RURWc0d4a2NSN1hoQU1lTnNB?=
 =?utf-8?B?STlEZ1JCOGRxVGsrdmZSVG5rZ1ZhNGE3RSt5UlAxQWZVZStIUFFObXd0MVpN?=
 =?utf-8?B?M3B2K3BBNDZoWUdWeVBldDdXZVdJeksyVUVRMjRlYzgyVldEdmhqRzh1aTBl?=
 =?utf-8?B?blR2aUtpMXZRaU5JZmI1K1VKa2orcjd4cnYvc2dpTm5mNHJDTHdOOFBpNUp2?=
 =?utf-8?B?Vm84NXBMbmpPcG05YnlvMmdtN3VWc3lNOXpseVpITkJ1ZDdFdngvN1JIWjV2?=
 =?utf-8?B?TFpqa01xZkpqc2FCd25JVmdyZnZ6dFV0Z0E3NUg3TS8yK21GNEZ4WFJhZUtq?=
 =?utf-8?B?NUlQenp5TktiOGpBTi9zTDhURmVsaFBPejIyVzBiVTJPTEtaWndoalozU0s4?=
 =?utf-8?B?U3J6SXhGWC9BYTliT0duZS9NQnlOUTNNSXQ1QVM3MWZoM080bGNiVlZjcm5X?=
 =?utf-8?B?M1pPZktOc0ZPUVpnNUk5c1J2cXhFK29pbDlxR1BFNFRXdUF2ZjNaNWZoY0lm?=
 =?utf-8?B?bXR1MUE1RkJxZE0zT2lvNlJuWTkzaE44VHFESW1TQTNzZFZGSXdSSTlDZXp3?=
 =?utf-8?B?WnppOFpCNEZOdDZDSHpLeHhkQ084eHZIWkxhQnFrNEh2ekpHRXFPMDRLWjl4?=
 =?utf-8?B?cDgrOHlkYnZkT0NuTVVXZDdMQTZmYUdPOEp6OEJvRDhUSEYveXRQeHRhd0hX?=
 =?utf-8?B?bHpQZDFNaExQOC9WVFlxdHVTVCsrSW0xdzNEK05iVHZRdlJ4eFJnNTRIYVJV?=
 =?utf-8?B?V2ZHU1VxaXJuZWxxTkR5dlEydTVpWS92Z3FyR2xxZlBZTW05TUJ1TDZjZTFW?=
 =?utf-8?B?Qkc0Tm5NK1duRW9wYncwaTlFYWhXVnE4clVONUlWb1BLVk9KSHdGU3I4eGdv?=
 =?utf-8?B?aC9jc1QrQjMrSzZad0tDcmp0QndjTzN2ZmUyQ1FzNko2NDFJd3BYZU0xN1RY?=
 =?utf-8?B?U2MrTWpEVFBHZ25CbXUyTjRISTZsZnlOL09kMC80ZWVRRFlyT2xIdWhtTXo4?=
 =?utf-8?B?MHhQbVBKeGxFS2lydkFPcko5Y3dXR3NnTHNLWSt4NWh2dVlURmxvTldpaTRy?=
 =?utf-8?B?WTVxNDB1YjYyQjRlcHlnYTRwb0dsOGFYcHdOZmQwcUV4enUvZFhtSUxVSGxy?=
 =?utf-8?B?Q2k0alVkNmNjV0MyS3RCUXRydVFqWUZ1K2lHbFRnSmhnWGIwcFlGQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b127f4-91ed-4719-e56e-08deac3263e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 12:15:55.7642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+CrP/Dqvo0rxmk4ZsqCd1OLMiEiVLh3F/KiNtrtngpOa32AfqzQAo/HfTToiiVOUA2aGsJ49hJCvSaQgS//RE2EDsOcJikr2HQlLmnogYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13232
X-Rspamd-Queue-Id: 11DFD4E819B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32238-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA3IE1heSAyMDI2IDEzOjAyDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgNi82XSBhcm02NDogZHRzOiByZW5lc2FzOiByemczbC1zbWFyYy1zb206IEVuYWJsZSBldGgx
IChHQkVUSDEpIGludGVyZmFjZQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgMzAgQXBy
IDIwMjYgYXQgMTQ6NTMsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4g
RnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gRW5h
YmxlIHRoZSBHaWdhYml0IEV0aGVybmV0IEludGVyZmFjZSAoR0JFVEgxKSBwb3B1bGF0ZWQgb24g
dGhlIFJaL0czTA0KPiA+IFNNQVJDIEVWSy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6DQo+
ID4gICogRHJvcHBlZCBldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiBmcm9tIG1kaW8xIGRldmlj
ZSBub2RlLg0KPiA+ICAqIEZpeGVkIHR5cG8gdHhkdi1za2V3LXBzZWMgLT4gdHhlbi1za2V3LXBz
ZWMuDQo+ID4gICogQWRkZWQgaG90cGx1ZyBzdXBwb3J0Lg0KPiANCj4gVGhhbmtzIGZvciB0aGUg
dXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2wt
c21hcmMtc29tLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpn
M2wtc21hcmMtc29tLmR0c2kNCj4gPiBAQCAtODMsNCArMTE3LDMxIEBAIGN0cmwgew0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvd2VyLXNvdXJjZSA9IDwxODAwPjsNCj4g
PiAgICAgICAgICAgICAgICAgfTsNCj4gPiAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAg
ZXRoMV9waW5zOiBldGgxIHsNCj4gPiArICAgICAgICAgICAgICAgdHhjIHsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBwaW5tdXggPSA8UlpHM0xfUE9SVF9QSU5NVVgoRSwgMSwgMSk+OyAg
LyogRVRIMV9UWENfUkVGX0NMSyAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBvd2Vy
LXNvdXJjZSA9IDwxODAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBvdXRwdXQtZW5h
YmxlOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1w
ID0gPDUyMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAg
ICAgICAgY3RybCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPFJaRzNM
X1BPUlRfUElOTVVYKEQsIDEsIDEpPiwgLyogTURDICovDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgPFJaRzNMX1BPUlRfUElOTVVYKEQsIDAsIDEpPiwgLyogTURJTyAqLw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJTk1VWChG
LCAyLCAxNSk+LCAvKiBQSFlfSU5UUiAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDxSWkczTF9QT1JUX1BJTk1VWChGLCAxLCAxKT4sIC8qIFJYRDMgKi8NCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoRiwgMCwgMSk+
LCAvKiBSWEQyICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNM
X1BPUlRfUElOTVVYKEUsIDcsIDEpPiwgLyogUlhEMSAqLw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJTk1VWChFLCA2LCAxKT4sIC8qIFJYRDANCj4g
PiArICovDQo+IA0KPiBJIHdpbGwgc29ydCBpbiBhc2NlbmRpbmcgb3JkZXIgd2hpbGUgYXBwbHlp
bmcuDQoNCk9LLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxS
WkczTF9QT1JUX1BJTk1VWChFLCAwLCAxKT4sIC8qIFJYQyAqLw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJTk1VWChELCAyLCAxKT4sIC8qIFJYX0NU
TCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczTF9QT1JUX1BJ
Tk1VWChFLCA1LCAxKT4sIC8qIFRYRDMgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8UlpHM0xfUE9SVF9QSU5NVVgoRSwgNCwgMSk+LCAvKiBUWEQyICovDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNMX1BPUlRfUElOTVVYKEUsIDMsIDEp
PiwgLyogVFhEMSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxSWkcz
TF9QT1JUX1BJTk1VWChFLCAyLCAxKT4sIC8qIFRYRDANCj4gPiArICovDQo+IA0KPiBMaWtld2lz
ZS4NCg0KVGhhbmtzLCBmb3IgdGFraW5nIGNhcmUgb2YgaXQuDQoNCkNoZWVycywNCkJpanUNCg0K
PiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0xfUE9SVF9QSU5N
VVgoRCwgMywgMSk+OyAvKiBUWF9DVEwgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwb3dlci1zb3VyY2UgPSA8MTgwMD47DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+
ID4gKyAgICAgICB9Ow0KPiA+ICB9Ow0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2Fz
LWRldmVsIGZvciB2Ny4yLg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
Zw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvDQo+IGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==


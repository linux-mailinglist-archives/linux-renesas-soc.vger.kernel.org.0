Return-Path: <linux-renesas-soc+bounces-18517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C701FADFC8F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 06:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769B63A2603
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 04:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F84623BF9E;
	Thu, 19 Jun 2025 04:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GqPINLRN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4744223CB;
	Thu, 19 Jun 2025 04:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750307657; cv=fail; b=PAqLizG3ybXJKRNNtqyt9BMRpuHaU/T8ZBAV/dXeYKWcqXGo7Yknu/vrK4PLv+UY6LGy5brM4NvNw+oskaU2lzOdxppqh4r3J2pU3rPV7d5SU9A6INEK2xuBH1r4fj6Tra/7aMfGIVypO0LNGyg1cm6KgNegHweI8zBSspTUla0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750307657; c=relaxed/simple;
	bh=dSsf6qdCQkvFYbmqraEN4w+ZfBMO1LHWs0bmTc+9gj0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sXNfPEeV6X88XCCSnAMGKbaI7WLeSwsVEPmNlRkOGjPkKH4eyRNbtJ6hq1UC6fXR3QKahSmxyaleHLQoxdT5qvNpiMWPsl81DuACed2r8th1LCO9AFY+KV6KizKBBNEr44Aml8vrRtHjggds9viC6/Noi06pp/Ci5km9WQQntjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GqPINLRN; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNw/Jpf6nJdu/BRqtsL/8Ew1OYRZMVSI4UlI7C7bW4H/vZy51++D7QJlnn8+xUAY5BKWZyxS16t9ojKV8ZhsVASHtAM6cIvLypv+YM2/BGZz6HrCqKUdhccEknJDYP1jML8WvL3JtNIFFDaZg8F8ZLge/MnaPAheZv3uwBepnqmhZr/XaJwmaq+oxvBaOeQexEU1OydYVnMk1Vj3WgeGJvlceXDNDQmUoLbqbxuUk+naDl6EaRPgDbqwVjuWM7H0XNtOWySUAf4EKQAzz9rds3eYRTKtqhlxfFwx/FTT2S3DYX/5yEmuLyV34W+rL3w+LIwXaxaTuJjnSDhoSZqNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSsf6qdCQkvFYbmqraEN4w+ZfBMO1LHWs0bmTc+9gj0=;
 b=CR1Xi1qP2rlag9Rl1KI9Opvz+Pl1RdPCAAajNGV+QvOeQ36tYooEaWoHZXLNi/fIYbsG9TiYn2DxmmKYjLG/xBb3n5ZjJzWvS6sEV+DxYAbIU0DR9UW8FZaTeOUZyYJfipKyJuP5HJxBG/ACKdNdt50JMEcvKzDlJCuKRedpBvQAlwsXRb1SrAEFOLtVA9UKo0ZxSpvU4Vq+g/IZU81AgRle1rRrxc1LI7hFVsLObcPJ74uAE25tOQX8gJjdnFjGWAugnraK1fOkncP1XM59/vNHtkgLgI7y3F9zytvLCc/fNY2dYbBZcSYTepA0bdTYo8uWE/Xe3ipDE9z68AjpDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSsf6qdCQkvFYbmqraEN4w+ZfBMO1LHWs0bmTc+9gj0=;
 b=GqPINLRNxB7zIkK+ovgkEsEw+rVigdafojZeqFQAdIev/di/w30+ycAnGwtUFClWZ0DMjaW1TGsH1yCvqvsdAvhHLP/x6GuktmV/rGTBLttJm4h70SNh98F1tRV3v6Ba0byiVVaQxWS9tPEhFcOqg7lE8aHAMR5trQnT5nsDz4Y=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by TY7PR01MB14777.jpnprd01.prod.outlook.com (2603:1096:405:250::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 04:34:10 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%3]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 04:34:10 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
Thread-Topic: [PATCH v2 1/3] clk: renesas: r9a09g047: Add clock and reset
 signals for the GBETH IPs
Thread-Index: AQHb2phboDZyiLKsokiwgzrZBKxi67QHfvSAgAEqcJCAACJOgIABJVeg
Date: Thu, 19 Jun 2025 04:34:10 +0000
Message-ID:
 <OSCPR01MB1464715327B4DDE8622B9B510FF7DA@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-2-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXE-C4FAXOfzQv8xfgFytwpqkARDORGLkosZtCsjK8nmg@mail.gmail.com>
 <OSCPR01MB14647EFA0DA38119F00DF1D50FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <CAMuHMdWnz3VUeFaJBEgLc0F_gGkdm679H4YqFFuRAEVFKZd8OA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWnz3VUeFaJBEgLc0F_gGkdm679H4YqFFuRAEVFKZd8OA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|TY7PR01MB14777:EE_
x-ms-office365-filtering-correlation-id: 7b253295-ddd3-4c3d-8d66-08ddaeea8924
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?YlhWTVFvbHZkTzZ0WTZCd0pDVXc2YzV1U3NGbDIxMk0yWUtwZVdUbk9TR1Q3?=
 =?utf-8?B?ZFVjaVZBWm1pQ2lYUHBIU21ZbDE4VlNHTlIzZXNtVVQvVnZJNmFOYjd0NVlr?=
 =?utf-8?B?TmhXK2lZQXY3bEZyalBtQmxCb3QyL0IzWXYzN2xYNmtCTVFlS25kZWRmaHph?=
 =?utf-8?B?SFhIT2RZT2lXeTIwRDdYVllQOXBuSTQ0MzdqTDQ0UlFaL1ovbjRzZEtSOW1B?=
 =?utf-8?B?NDI2TUQyN3RTaHdpTlY5czEwOCtSV2VKd3REUUFEalRaeE9RZ2hOSkZKOXFm?=
 =?utf-8?B?c01OYkZwVUtnWVhqdWZBcXo1eVFaejgxbjFOSzU1M0FESmtkRmNZM2dML1hB?=
 =?utf-8?B?S21qRUNQZFhwWjJCOXNjS2xGYXVUZEtoU1FVZHloYjExN0xuaFg3a1pRa0cv?=
 =?utf-8?B?OEdUMmZMcTFXOUVmOWZURllVdmpxbGZ2SUZkSXVSMmRFSkV3MUZPRG9KblFY?=
 =?utf-8?B?ZHlGVDFLYWdDdnU2L1Bienp2bkgwQmJiWmwrdGt0b0xYU3dBQ1NSdHlBdjRG?=
 =?utf-8?B?N29oYXk2UGI4Slc3MlBUSzE5cDUxRXl1V0NzQ2tnZkMwYzZuMXY0dGF1aWtl?=
 =?utf-8?B?QmNkeTQvOEpaSFlSekNwcDNvQ0FrRUxKeUE0NmFMN0lqckMxRWlRNEJaYzdk?=
 =?utf-8?B?N0ZSRmFCeFRFUHE2bWlJSG5MaHB0RFFkZjZ1bWNCc3hnbFFnT2tHOUNHTWtz?=
 =?utf-8?B?WXU4MlBVVndyTUx1WVVRN1dkVlR2eTF2amk0VjZNUzZVclcvZjU5VEN1aDZo?=
 =?utf-8?B?UEE0RkJtSDB0cTFWc0NTeFpBZEZpMTBiNFlpS3lRZnBuM1ZzM2dLeWhOMms3?=
 =?utf-8?B?TldkNHc2eGFqa3VUNFdSU1JjU2swTkdyWVdlRDZqM2t3ZU0xaTJMSm1qVWZX?=
 =?utf-8?B?aXZvdHVZSXhnazEyWXpBM2lJV3NpWTlQd1FETWt1SmtxR0I4SXV2cm5DYWky?=
 =?utf-8?B?Tm5SR0R0cUZhSDNnai9RdVdhZFNLendVOEVnSGo5K0o0YjNzeERyY1JFek9G?=
 =?utf-8?B?czJTUXNwUEdJMXJaR1dQblhhSjM2SURJbXBJaE5oQjVuYm9ZbVBXek51T2h4?=
 =?utf-8?B?N28xVXYxWWdmT3YrUVNwYlFTb3FQUlVCVElRUHdUd2liblJNWUppQmZNYUNY?=
 =?utf-8?B?d1BxZTNtV2VnbzVKL2lZc2twaFM4Umx1M0o3NTlEZEQxWm9aNlBhNTR2RVhW?=
 =?utf-8?B?YmI0S29WMkUxUTI1QWtZdFlFNC9tVnlPeDhKNE05Z1NpRlpKanpvTlBkV2Q1?=
 =?utf-8?B?QXZvamVsQmpCZjFPajAvQWM0LzVJcExTaE54SHZEQjRnRFUzQkFvQXZ0blNs?=
 =?utf-8?B?Z1V3OG9KVjNXYnEzN2RmMHE4TTQyNndEdVdQa1VlcVFkL0FTbzllbi93ZWt6?=
 =?utf-8?B?eTlRZTZxaUpoaDZPNjFjUGRURFFqRGpXeGpuS1crMmtsQ3R3WngveTRJdndG?=
 =?utf-8?B?TWFwYVYvVGVIRzYxb2lyeUtoRW9VSlkzNHhaekcxVjVJZ0hCN05wZkdVcmV1?=
 =?utf-8?B?enozb0R2eENKM0RGbmJ5Smdqb0N1RjRCUGZ2SFNvN2pxdFNPeVJyTjFnVFYz?=
 =?utf-8?B?blNmUWkrYXFLRUlDY3h5LzJEYUJEYU50b1JreUFjVTN4cFNWN1VmbW1UdkdG?=
 =?utf-8?B?bDdkdlF6NysyVXBzYnA3ZGpZQTgrZnhNc1Ixem1mRGI3eTE2Q0hnWFZoWURy?=
 =?utf-8?B?K1N4eStjTUx2bHBEY1NnNGo2OVhLOXQ3K2hLVnZ2TnhwZlZBNFZoTCt2ZWly?=
 =?utf-8?B?R2p3bXNQSjBqUVEzZzQ3bXlxbm84RGtZQmJ1NDNTRjR3dmEweEwrcEQvdXpr?=
 =?utf-8?B?VDlWbzFPbnZtRVpwaWVzQUp3LzN0bzFUMDZMS2VOT2h2MU9Ga04xM0cvNHQw?=
 =?utf-8?B?dEpXYWRzL2lkeG5xSXdaL0xBS1g2ajdtNmorL3doSVVxdXFzL3RPNDZlSi8y?=
 =?utf-8?B?NDlyci9PMUVCcUppUzJmdm5oTi90WUU0VXR2RFlZakY3a2E3WHVacjBTTGNG?=
 =?utf-8?Q?6kfvuLCtRqIB02oIsU7C2fV/4Fyqpg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2tsNC9XUThMWURTbzFFYkVHaGdjSWtNeEVyZERvRWxOVTNBZzV6TkE5bE0z?=
 =?utf-8?B?OXN2LzNuakEzNlM2Z1lvSXQrQW82VkcxeHFGNnZrQkZzK1YwcGpLRHg5QTRZ?=
 =?utf-8?B?V2M4Ykt0TlhoZXV2V2pEMUtqaVRXcXF3WXRFc1BUdlZtcHlweVhyTlRPbVc4?=
 =?utf-8?B?QXE0WmpiMUU3SVloTld6dlZvU25Hb29zSElOOG5jMjJFZmhZV1VSek9hSkZr?=
 =?utf-8?B?NHR0YkcvdU5NWXc5WGhlai9lQ0h6T2FRVU15S0cxTjlqOUtDcWNFcEJSTzBj?=
 =?utf-8?B?SnNaeWhVT1UzNXlPMS9jQUJzbWdWdHpUVFhmTUZhV3dxaXRMYVZWQkt6a3FK?=
 =?utf-8?B?S1hONDE1RlR0ZThIWDAxa2VhR1hXcHZnaXJ6QkUvcGJ5T0wzMmxqaUF6eTVD?=
 =?utf-8?B?ako5WUh1YlhUTGRSVzhHd0tpVzNlQkx4ZmRrVE81SmZ6dkxxMWp0MHBJYnlP?=
 =?utf-8?B?K3l0N0xxZmlGY0gzeDhtbEpGcWRHaTc5N2VIblU1aWNCWVprQk8zZjhuTitB?=
 =?utf-8?B?UGR3TVVjdTNKTDkveXhBeHN4OUdkSGlnZFRZaDZaTU9xNWJ4dHNOcTdhb09a?=
 =?utf-8?B?bHZ3YkFhTUxad1hUblVWNTN2U1huWXNHOE5rY0JXc0d3TG5vUFVybzRRVzBH?=
 =?utf-8?B?Q1A2aGRPUHJscHhrVGVzaUZjMGU2NUp0NjdRUG9qRDZYbWhMSHhXd3BOUVd0?=
 =?utf-8?B?cW5hUVV5clJMWSs1b0hGdkEyWVRTbkgyeEo4STRVYUo0T1F3TVZveHB0RUFh?=
 =?utf-8?B?Z1Q1ZHVUL0NvMXdic3diSU1RWDhiekYwekRwVTZUVVpCTTdZOEl1Uzl4b05C?=
 =?utf-8?B?SHhJRGFNN1l6R3JyMVZKZzVsdjRoandyRG9rS0RaNDQ5ZGlCQktmaDBuUXpn?=
 =?utf-8?B?YzB0VTU1ZHFhdW5CTFBKV1FPZXNQRW4xZ29wWFJBWGNrZG04V3RCaU96MGNH?=
 =?utf-8?B?ejJ0NmlpaFRzUE9JQTJFaTVwbGE0YlA2S1M4U2dTMUp2dk5pUmwweGRpSSt2?=
 =?utf-8?B?ZTRxMFJwR0J1SEM4cXZpSnY2Z2NtNG5tVUNnTEJSUXB2bm0yU0M4K0ozNUxD?=
 =?utf-8?B?aC9USUhuaFJJRlRmZlg0dzhqUjdPaE5sS21DWDlZTHEwWklzNTN5REM4N3Np?=
 =?utf-8?B?YUpsZ2haQzQrS2crZUJIQU1DQW9ta3BzRnhkbnZCK2ZCR0MyVUZiYUoxMG9Z?=
 =?utf-8?B?VWJXU2s5UkxmSzl0cGdLK29ncUIvU24yZnRYNHNIQlY5bEg4N3NmaTh4K0JZ?=
 =?utf-8?B?cVJHV1VRdGxRWU0rZkJnVVdLdWdSVWd6allwd0xraVdEMzRIcTFoWlhVVXg1?=
 =?utf-8?B?bW03R3VqRmEyOXlFOVhvZisrK2hHakRyVEFOK0cvdm5HTGpEMFMvQ2xXSFE3?=
 =?utf-8?B?U2FJVzBoNEhHTnBnNjYwMjh2MUozdFlFYndzMFRYSGJPendldmg3em55b2tP?=
 =?utf-8?B?R1djLzVMdWYvc1ZQKzdPRlRCRHZ2Ym12WHp6Y0FEOCtmUE1aclhyN3pIQkNr?=
 =?utf-8?B?TmNkWmVWd08zdkxMN0REb1NaMHhMcTdEdFBoNHFENWdYeUpRQXVUWUE0QTlj?=
 =?utf-8?B?M1FQQ0c5OTBIRi9BUGZ1Q1MrRGhCajlTbHR0MFBJY1dBbVBvd25CRGRMWXdN?=
 =?utf-8?B?cm4xME14OHBpMTVBM0EvZ3V5dk5VNlA1ZTdFUUpVQkZ3OEhFYjd0akN5TDRK?=
 =?utf-8?B?UTNPV0s5LzU5c2tjODJBVHREMFNscXUzdnA5K0pVNmhRNEExdmdzM2lDSWRB?=
 =?utf-8?B?dElDT0IvYUhyMW1rYXNhZXVuTTJnZlVsZXBWRW1LYjhSdG1GWnM0OHhnK2NN?=
 =?utf-8?B?Mk5JclN5OWdhLzlmcGNVd1lUSXltenRzazhaQzJOQ21idDNoQk5hVldSc3VY?=
 =?utf-8?B?UitHYk02VStFTkc4UDFIVW91Z0ZhTXVHdGh2MHN0a2V2RzN5TnVTY25oWEY3?=
 =?utf-8?B?VXVvN0hTSTh0emVlUm9EbSt3NXp6ZWx6Z1h3RVFsRStrcEZPNkMyMGdNMXBN?=
 =?utf-8?B?V3o3M0FZMElSbTBYeEZWbTRqUGc4TVJBZUtqNXdlVFh3bUxWS01kTm1HTlBO?=
 =?utf-8?B?bVNJQWY1UmlVZWhFMThQSnpuQ1ZWTERlRUlicmsrMGhzQnVXNHBqVkY4YkhS?=
 =?utf-8?B?M3JwSlNPVHJVNDdjT1h3SzNRR1RVSUtiUTNhUGpPdVBuMkN5WXlQQUtuT2JX?=
 =?utf-8?B?Y0E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14647.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b253295-ddd3-4c3d-8d66-08ddaeea8924
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 04:34:10.2732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yk/hL1qHMHiTl0GbuaSEA+RVVKGnTVgkT2MgjzcrOv3xcS+PrEBs/AZ4rh5FR1niUyrqnXZaR0vFsUcF/KcajHci0GEfwivDy+sn5jFd1ro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14777

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBK
dW5lIDE4LCAyMDI1IDE6MDIgUE0NCj4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBi
cC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzNdIGNsazogcmVuZXNh
czogcjlhMDlnMDQ3OiBBZGQgY2xvY2sgYW5kIHJlc2V0DQo+IHNpZ25hbHMgZm9yIHRoZSBHQkVU
SCBJUHMNCj4gDQo+IEhpIEpvaG4sDQo+IA0KPiBPbiBXZWQsIDE4IEp1biAyMDI1IGF0IDEyOjA0
LCBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24g
V2VkLCAxMSBKdW4gMjAyNQ0KPiA+ID4gYXQgMTE6MDIsIEpvaG4gTWFkaWV1IDxqb2huLm1hZGll
dS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBBZGQgY2xvY2sgYW5k
IHJlc2V0IGVudHJpZXMgZm9yIHRoZSBHaWdhYml0IEV0aGVybmV0IEludGVyZmFjZXMNCj4gPiA+
ID4gKEdCRVRIDQo+ID4gPiA+IDAtMSkgSVBzIGZvdW5kIG9uIHRoZSBSWi9HM0UgU29DLiBUaGlz
IGluY2x1ZGVzIHZhcmlvdXMgUExMcywNCj4gPiA+ID4gZGl2aWRlcnMsIGFuZCBtdXggY2xvY2tz
IG5lZWRlZCBieSB0aGVzZSB0d28gR0JFVEggSVBzLg0KPiA+ID4gPg0KPiA+ID4gPiBSZXZpZXdl
ZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiBUZXN0
ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4NCj4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPiA+DQo+ID4gPiA+IC0tLSBh
L2RyaXZlcnMvY2xrL3JlbmVzYXMvcjlhMDlnMDQ3LWNwZy5jDQo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvY2xrL3JlbmVzYXMvcjlhMDlnMDQ3LWNwZy5jDQo+IA0KPiA+ID4gPiBAQCAtMjE0LDYgKzI1
MiwzMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ6djJoX21vZF9jbGsNCj4gPiA+IHI5YTA5ZzA0
N19tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0gew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCVVNfTVNUT1AoOCwNCj4gQklUKDQpKSksDQo+
ID4gPiA+ICAgICAgICAgREVGX01PRCgic2RoaV8yX2FjbGsiLA0KPiBDTEtfUExMRFRZX0FDUFVf
RElWNCwNCj4gPiA+IDEwLCAxNCwgNSwgMTQsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJVU19NU1RPUCg4LA0KPiA+ID4gPiBCSVQoNCkp
KSwNCj4gPiA+ID4gKyAgICAgICBERUZfTU9EKCJnYmV0aF8wX2Nsa190eF9pIiwNCj4gQ0xLX1NN
VVgyX0dCRTBfVFhDTEssDQo+ID4gPiAxMSwgOCwgNSwgMjQsDQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJVU19NU1RPUCg4LA0KPiBCSVQo
NSkpKSwNCj4gPiA+ID4gKyAgICAgICBERUZfTU9EKCJnYmV0aF8wX2Nsa19yeF9pIiwNCj4gQ0xL
X1NNVVgyX0dCRTBfUlhDTEssDQo+ID4gPiAxMSwgOSwgNSwgMjUsDQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJVU19NU1RPUCg4LA0KPiBC
SVQoNSkpKSwNCj4gPiA+ID4gKyAgICAgICBERUZfTU9EKCJnYmV0aF8wX2Nsa190eF8xODBfaSIs
DQo+IENMS19TTVVYMl9HQkUwX1RYQ0xLLA0KPiA+ID4gMTEsIDEwLCA1LCAyNiwNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQlVTX01TVE9Q
KDgsDQo+IEJJVCg1KSkpLA0KPiA+ID4gPiArICAgICAgIERFRl9NT0QoImdiZXRoXzBfY2xrX3J4
XzE4MF9pIiwNCj4gQ0xLX1NNVVgyX0dCRTBfUlhDTEssDQo+ID4gPiAxMSwgMTEsIDUsIDI3LA0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBC
VVNfTVNUT1AoOCwNCj4gQklUKDUpKSksDQo+ID4gPiA+ICsgICAgICAgREVGX01PRCgiZ2JldGhf
MF9hY2xrX2Nzcl9pIiwgICAgICAgICAgIENMS19QTExEVFlfRElWOCwgMTEsDQo+IDEyLA0KPiA+
ID4gNSwgMjgsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJVU19NU1RPUCg4LA0KPiBCSVQoNSkpKSwNCj4gPiA+ID4gKyAgICAgICBERUZf
TU9EKCJnYmV0aF8wX2FjbGtfaSIsICAgICAgICAgICAgICAgQ0xLX1BMTERUWV9ESVY4LCAxMSwN
Cj4gMTMsDQo+ID4gPiA1LCAyOSwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQlVTX01TVE9QKDgsDQo+IEJJVCg1KSkpLA0KPiA+ID4gPiAr
ICAgICAgIERFRl9NT0QoImdiZXRoXzFfY2xrX3R4X2kiLA0KPiBDTEtfU01VWDJfR0JFMV9UWENM
SywNCj4gPiA+IDExLCAxNCwgNSwgMzAsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEJVU19NU1RPUCg4LA0KPiBCSVQoNikpKSwNCj4gPiA+
ID4gKyAgICAgICBERUZfTU9EKCJnYmV0aF8xX2Nsa19yeF9pIiwNCj4gQ0xLX1NNVVgyX0dCRTFf
UlhDTEssDQo+ID4gPiAxMSwgMTUsIDUsIDMxLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCVVNfTVNUT1AoOCwNCj4gQklUKDYpKSksDQo+
ID4gPiA+ICsgICAgICAgREVGX01PRCgiZ2JldGhfMV9jbGtfdHhfMTgwX2kiLA0KPiBDTEtfU01V
WDJfR0JFMV9UWENMSywNCj4gPiA+IDEyLCAwLCA2LCAwLA0KPiA+ID4NCj4gPiA+IHNjcmlwdHMv
Y2hlY2twYXRjaC5wbCBzYXlzOg0KPiA+ID4NCj4gPiA+ICAgICBXQVJOSU5HOiBwbGVhc2UsIG5v
IHNwYWNlIGJlZm9yZSB0YWJzDQo+ID4gPg0KPiA+DQo+ID4gTm90ZWQuDQo+ID4NCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQlVTX01TVE9Q
KDgsDQo+IEJJVCg2KSkpLA0KPiA+ID4gPiArICAgICAgIERFRl9NT0QoImdiZXRoXzFfY2xrX3J4
XzE4MF9pIiwNCj4gQ0xLX1NNVVgyX0dCRTFfUlhDTEssDQo+ID4gPiAxMiwgMSwgNiwgMSwNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQlVT
X01TVE9QKDgsDQo+IEJJVCg2KSkpLA0KPiA+ID4gPiArICAgICAgIERFRl9NT0QoImdiZXRoXzFf
YWNsa19jc3JfaSIsICAgICAgICAgICBDTEtfUExMRFRZX0RJVjgsIDEyLA0KPiAyLA0KPiA+ID4g
NiwgMiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQlVTX01TVE9QKDgsDQo+IEJJVCg2KSkpLA0KPiA+ID4gPiArICAgICAgIERFRl9NT0Qo
ImdiZXRoXzFfYWNsa19pIiwgICAgICAgICAgICAgICBDTEtfUExMRFRZX0RJVjgsIDEyLA0KPiAz
LA0KPiA+ID4gNiwgMywNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQlVTX01TVE9QKDgsDQo+ID4gPiA+ICsgQklUKDYpKSksDQo+ID4gPg0K
PiA+ID4gU2hvdWxkbid0IGFsbCBvZiB0aGVzZSB1c2UgREVGX01PRF9NVVhfRVhURVJOQUwoKSBp
bnN0ZWFkIG9mDQo+ID4gPiBERUZfTU9EKCksIGxpa2Ugb24gUlovVjJIIGFuZCBSWi9WMk4/DQo+
ID4gPg0KPiA+DQo+ID4gRG8gd2UgcmVhbGx5IG5lZWQgdG8gdXNlIERFRl9NT0RfTVVYX0VYVEVS
TkFMPyBVbmxpa2UgZm9yIHRoZSBSWi9WMkgsDQo+ID4gT24gRzNFLCB1bmJpbmQvYmluZCB3b3Jr
cyB3aXRoIERFRl9NT0QuIEkgY2FuIGhvd2V2ZXIgc3dpdGNoIHRvDQo+ID4gREVGX01PRF9NVVhf
RVhURVJOQUwgZm9yIGNvbnNpc3RlbmN5IGlmIHJlcXVpcmVkLg0KPiA+DQo+ID4gUGxlYXNlIGxl
dCBtZSBrbm93Lg0KPiANCj4gRG9lcyB0aGF0IG1lYW4gdGhlIG1vbml0b3IgYml0cyBvbiBSWi9H
M0UgZG8gcmVmbGVjdCB0aGUgY29ycmVjdCBzdGF0ZSBvZg0KPiBleHRlcm5hbCBjbG9ja3M/IElm
IHllcywgdGhlbiBERUZfTU9EKCkgaXMgZmluZS4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0K
PiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCkNoZWNrZWQgREVGX01P
RCgpIGFuZCBoYWQgZXhwZWN0ZWQgcmVzdWx0LiBJJ2xsIHRoZW4gaXQgYW5kIHNlbmQgdjMuDQoN
Cj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCg0KUmVnYXJkcywNCkpvaG4NCg0K
PiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==


Return-Path: <linux-renesas-soc+bounces-12667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32008A20BBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C38A1623E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 14:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CF61A8F79;
	Tue, 28 Jan 2025 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vr25NlUB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700EF1A23BD;
	Tue, 28 Jan 2025 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073266; cv=fail; b=K59mef3DnwjqKPD710AXs7+g5i5hhIDJl4JVqKnOm0S3+0/kteB8xEx0T+0cYGyc4ahGUNSNSNTSu/uFgrHOaa1XEytpz48tWEy7Exe81psGwLP/KOyW8PzBtaD5gYoMUztFATFWMkHfO8FqQDm0aKro9tg5LQsoT0dwnkLhp5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073266; c=relaxed/simple;
	bh=J4IvrSlJ34ORntW35OD2FwdVt9mk0ejpLkltyjHh9u0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=awnhGVdesWQcniH+V6OBUZhYM0cJ2hsqy0B8AHN+jf5srygC8l02828IgAvWOuqqc33hgEVqPzjHNpyUygasxRqQw8XoMmH2lbRPAqzQvvN2pnk9TR4FMUiHPRZonp9pLHl8RlDgcqP6GniMS8559jbwWcppcL10Xk+KcvZ6ZLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vr25NlUB; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+Up4KgJZSiKxWIAtO0edbldSeNiedjUTbP7Paoob1XowK+NqC4dMZFTbjB0OBgCHxjTTo58XabjnI+kEQaHu5lSLTA//8ejR2uljGhPSoBEl7AxXxf9dFg9nH2EDUVyIjDpKO6AKMVxD0V2YqOsPlsKh2TRirer51szKQm0WuXZHDVMBgWMCTuB4YsiyCLVSL4cgXWfd4eWdaR+OvzJnA4lxiZ3Krw7KdUe8SNk9EUrKUiJ+z+wmtTnlk7XYoZjcUV+ozFr+7Vx6JTquH5tTyy9JtacnTPjdx6TkhPwAYmxO/PaxkYx2Q+50xNLqu3iEwgfidLg/VU7EuL6MnJ3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4IvrSlJ34ORntW35OD2FwdVt9mk0ejpLkltyjHh9u0=;
 b=YqJ3q+8YHGIVDeRCPzLAkE5uk+1PHDy9MInlRCWIJZLKhnfYAxFispUaaIXQsPBsXxRyU8twbHpoQ/dKUo55BGNR7v06hTr+EkCf2swQlZlP97+UbOcmXEOWJ5kRK2VrGxn+t3nM+HHCFpkfJTRMF2peeVfx4JWK4pzgAXSBGEehHh9ml35/wFE+UlvluKo8wllRQ3l2rlay5pg99JC8YZp4tlp8tJ/RvoSUxtHes0QWe9PvSdEnCGgdlyxz8MAW4tC3pgwY2spAReTJrD3yOxlsDw1xqfnaAwiIuQ301gxBHU53VO1KzCPtIi9DsnD0Gnh6FOlJW97bIEaujCHijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4IvrSlJ34ORntW35OD2FwdVt9mk0ejpLkltyjHh9u0=;
 b=vr25NlUBubvH71zcgNazdnDyzWwAr8A8Hk+woLCPsIifBm+nx11bwJbIL8gQm7AY557kymlR06VT4QZUuCzZajHAIiAoQB58os0f8vSEfJzg9+0HnllkK3/x07h3+zS6KYpn31EIOiMiUlE8MDHvHVhsSZGtumbtyExMMF8xwy4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11318.jpnprd01.prod.outlook.com (2603:1096:400:3c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 14:07:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 14:07:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
Thread-Topic: [PATCH 5/7] arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2
 nodes
Thread-Index: AQHbb/jAShwKhSxihEelcI6XMh61NbMsENmAgAAAeBCAAB71AIAAC5rg
Date: Tue, 28 Jan 2025 14:07:40 +0000
Message-ID:
 <TY3PR01MB11346C11B94718B67312FCE5586EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250126134616.37334-1-biju.das.jz@bp.renesas.com>
 <20250126134616.37334-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdX+S7t+Z0ZbT7zTgmPFqHnSZWAYcZ4cJzzE3u+j2-9ZAA@mail.gmail.com>
 <TY3PR01MB11346016CB4B1414521B66F1F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUsb_NdEAjD9r+BgPxG5vRhJUVK3AbWQNmgmfj_3pj6hQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUsb_NdEAjD9r+BgPxG5vRhJUVK3AbWQNmgmfj_3pj6hQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11318:EE_
x-ms-office365-filtering-correlation-id: 1c63c180-2b8b-44f1-776f-08dd3fa5204f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGttRXdBejNZVUpNVGtXVTYveXpSWGNTMjJ4TEpRb2VoSy8xU3hmb2pYeW9y?=
 =?utf-8?B?bStLTDY2RzZ5dkIwczFzZjNFZ2NJMFZyN0ZncGVZd0RpZXoyK2pKOTJmMUhy?=
 =?utf-8?B?VHNUYTVzS2M3L01ROFdOR1ZMb0pheU8yeGNFbHJkNnMxRG13MTMwckNiN3VU?=
 =?utf-8?B?R1ZGY0xQbXVNYTYxUFJjQmdrVGY4LzdKT2RqSHRUMjMxODdUSUtuQTlqV1dn?=
 =?utf-8?B?eDkzdWR6U3dLNUREKzFtaWhGVSs4T3ZmcHQ5RDRmQ3YxVTI1bFlVUDh2VXpD?=
 =?utf-8?B?NFZjcTlQM25XVldTcXRkQWMvSnljODdPcEhpK01hSGpOMFRTWndzN1k2bVpF?=
 =?utf-8?B?UmhuRmp5K3E5M1JaUFZESzdHaEtUZGc3NDFYYlhqS1E1VHNmTHhhVTd0cW5w?=
 =?utf-8?B?K3YzQ24rUjBNY1FFTXUvanV0Ly9RWGpKK3NrVGNtcFhucmltRm0zU1JtaFhO?=
 =?utf-8?B?STl6MDBKb2RNV2F6ZXhjSkFpMGMvU0V5YjlxRytiWk5ZaWVGbUpMSk9SRGdW?=
 =?utf-8?B?VnpxQ1VYaitUd3pNa0NMeGhyK3QvZ0JUVjFWSmF6OFJoRzNEZkxOZUpRN2dX?=
 =?utf-8?B?STAwbm1QTjFKaVpYaEtnRmY3VGs4LzBrcUNuZlBEN01CVjJ3emNPbXhzcy8x?=
 =?utf-8?B?c3lqbGhodmcyeGZwRXhvcUpONlhJRm1xTW4xZVp5MCs3VWF0cU4yVVlCd1VL?=
 =?utf-8?B?Z2YxWkhNRjZsdHJmYnl4b290YTJ3dTBtRUMyamoxMWZZejhDZ1VHWEZOTFlo?=
 =?utf-8?B?TU9vU1JJV0NZQVpEYTRhZHF0VjduWWxCU28wUTdLM2owanUzeFJBRjVoZWRY?=
 =?utf-8?B?NmNVbUhQREdyZDcwcitMN1NmZDA2YzZ4NUNJWnRDOVhPdGZQVUxQTHo4QWhp?=
 =?utf-8?B?QTUwU21teUJpNW9WeXlCWDh5QVJOcFJ3UFV6TDVJOTRQYmhWMUVRUGsxQzZO?=
 =?utf-8?B?b0pyQUNmZzNsbDNSMW5MYUZtWWhuNVNGWVpDSmZhZ1JkUU9UVExqUGlXMHFq?=
 =?utf-8?B?MjhXNnY2R1JodzE0YjBnLzVsZG9ybm1mUW9hOVZXWVA4OVZndXo3ajNCY09Y?=
 =?utf-8?B?aGp5MUVDQTJQdmlRTzdtTXMrTWxjdy9hL3FlQU1tYlN3TG1vS1BBc1lUck9T?=
 =?utf-8?B?enVDNlArTFRIRXhLVy9mUXZPTGUvMExWbHNRQit4NlZxVjJWcjEyRStEdkVh?=
 =?utf-8?B?OHZZekUzRTZ5SGNMVnIzeEhIYVk4M1RqOGs3SmdxWHlFdi8vejlGTy9TTzJ2?=
 =?utf-8?B?YU9HcUIzdDRoc3dQUWpWU2RlYkdwWjRWZkNrb0h5NE9ad0J0T2lIOURlb2k1?=
 =?utf-8?B?elhla0twWTJHZVZRUjlVa3h3L1dpL2FDUW9ocGFwcGt2R2tSNlhQZGovVzd6?=
 =?utf-8?B?WEdvQ1YzdGsrMG1Xc0tYR09XVjFhVmJwMFhzdDJrVFJEeU5SVUpWWUtONFpJ?=
 =?utf-8?B?ZEVJZ0c2MU55bjdnUGFBVzIrZ0xrK2doeXhVbmlka0JXN1dpNmhmdzBDZkd0?=
 =?utf-8?B?THM4Q0tEV1l6YWlSbzJMZHFza0dxRXdqOHJ6VEpySmIvT3QrcFNac0pMU1R0?=
 =?utf-8?B?ekJMR1dlQnhSUkFndzdHMHdBR3dLWmt2Zjdoa2I5M3VrNlRGazhMZjY3ZkE4?=
 =?utf-8?B?T0J0SFk4K1FHTHIwa2RsYTk5VStxK3NFaVJZYmh3Rk9VSFcwOEdLZmJYcVYx?=
 =?utf-8?B?dENiMnJmZUcyQThZcDNTcWIxeC9ZWEMzMUs3UmNhTTNRMlJ2L2gycUp0Y0pm?=
 =?utf-8?B?amM2ODRkQ1VVaXJCVWE2dlozZjg4Uy9ZbmcrWFhjUllOdlc4NW52R2lCUVpw?=
 =?utf-8?B?cUFOajRlSWlURFVKTjFZSndoWGpkN281NWRSVlY1VHppYVhteWVUK0t3aXZQ?=
 =?utf-8?B?UE9QNnR3Mm5mOWVLR0NrTEFMcHhOeGdZMllwTHlvMGhYL0ZPbE81UC80U1Bm?=
 =?utf-8?Q?bISThwmf71az+BzA2/8n/ve0atIKAYNN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkJ0YUtTcFNNVXo2TUxDWEprUXJxQk12NXMrYVpJMTNEWDRhUnJXdTBMcjIw?=
 =?utf-8?B?QzEyL29VZWM0eUpHQWxDRHdzVVRQR0o4VFI3SCtmTm0wVDhzVFAvUGxBNEFj?=
 =?utf-8?B?Nk8rRy92SHNTN05rZUlxTEc1eFZuZjVmcWNoNFRWSVpMTXdxOHpSMU1rNTBq?=
 =?utf-8?B?K0ZtN3dyREZzd0xBMTIyVDF3Y2NFNUpic2c5K1J5MUxROEUrcFREQktOdWkz?=
 =?utf-8?B?c1p2NkZoU0crOXR6S2IvUU45aXVHc2MvVkRPeCtLOHZlOXhqNEpkV0I1L1Fn?=
 =?utf-8?B?UG9mejJNWFl0M0I3ckFEN2VTMmZ3MnpMSkdmZzdjd0c2WHZLMExkcldMVDJK?=
 =?utf-8?B?bXROUEVDYlVrZWVQWWU4dG5FTERjV3dwSTBmampLV3JaUDIrS2NSRWVtdVJs?=
 =?utf-8?B?TDByTFUrbjVKSW5vRFRNYWlRQzkrWVdTQlhFYkVBUGQ1TWhtSENlWTJPS1VP?=
 =?utf-8?B?OVk4c01CTkZGcVhnUElKNGM3c3RPd29UelVsS013dEU4N0E2eTViVmJnL2FK?=
 =?utf-8?B?TENRUlR2b3lnMHlIWG9DS3VwZDcwVitnQUF0YzMvUzc5WUVtVml5UzQvcXFi?=
 =?utf-8?B?dlkybDFxeE1SZDJSRDlEanF5dDVhT1krRjZvWjFYdW1XQXNwMlBBTmNoenVl?=
 =?utf-8?B?RDVIcUJrdmRKQnRISUhTV3IvRWJ3anhuN216cFZPVVpSMkkvdi81Zk9uQ1ZL?=
 =?utf-8?B?a3N2bDFCdGQ2RVEyUktSS3YxenBpU0JhdVlrWVVpQ2NpbXhuRURYNmluV0Ez?=
 =?utf-8?B?UjJrdFlYTWg3TFFISndDcGhhcXFPUDVHRkxXNXVZMXljeTViRWN0N0tvc2JZ?=
 =?utf-8?B?S09wYWdyQWJGK2dyMDBmSkVyVHJ2Zm1qRlQxdGhOekdYOXozNmtCNnJtZHh0?=
 =?utf-8?B?QTlZdVR0U1JsdGZML050YjFIWlRraVo4VmlPV0QvaDVMZ3hDMGxvdDRCeDFD?=
 =?utf-8?B?UllnaXdrOFFWZHA5NDNvNjc3OC83Z0xWMml1NE5sbStGM0hRejc3N3ZQQWxl?=
 =?utf-8?B?WHdmZHh5Tm9CRTQzQUU3V285bHpUbk12NmJ0SHZXTERRTHNUU2padE0xQlBZ?=
 =?utf-8?B?VWxIRnhST3RvcVlZWklFR1U0dVFHWEQ4ckZTMGVJbmc2R0VRVk9ubFBpK2ZG?=
 =?utf-8?B?QiszbGpnTS9xRFQybjh2TUMyZTR5SHcvZlMxSW96ZFMwWFFNM204dnRXSUc5?=
 =?utf-8?B?MjJFVUt0cWxsRXpWUnJ3YlBGYXpYRU5VcVVhVWp2QlZFVjRVRndPa1BySVQz?=
 =?utf-8?B?ZG5UbklkRFNNeFJyQm1LYjRzeXJ4aFpWOW8zSXpEYWFiZklnajZYOUh4YzRO?=
 =?utf-8?B?dGhMUHZtY1cxTHplRHdUT1Q0M2VkUngwSTFRNVE3TEhydlFVK0JodWg4Q0pW?=
 =?utf-8?B?YXVkK0ptNWoxNlo4UGFTemM4cjYyMnZTZDZmZVo2M2ZsVzBuL09QRFoweTZ4?=
 =?utf-8?B?MXI4ekpsSDNhelBQenJrRmhSd3ROTkp4dVRvQU5zUDR2SmYxQUZvOGlWTHp5?=
 =?utf-8?B?dXpSckNWeWV2Tk9yTzI0dGZWRWF6aUxBWVMzVEovR2hEd0tlak9GdW1NbHFw?=
 =?utf-8?B?TVYxaTVISTdsK3JRQ0dXZXpzd0N0bDBWdVh6a0wrK2c0OVd3dTJNN1g0OXI2?=
 =?utf-8?B?QW9hS2JScGMwSFZ5NlZjUFpZalBqRWU2TUxob3FleitDMDRxalNnZ0pOdkNB?=
 =?utf-8?B?ZVpmejFSK0lpZmlVb3VnT1AzZ292S2lDcVNzcjJaREM2dXZEeUt5UTBLazli?=
 =?utf-8?B?emVHb2QyNVMzL3Rmc0U4M3lSY3I1RVpkNXY1QlpyNDlyOUlKai85eW5pdjFu?=
 =?utf-8?B?MVlUc3RkY1Y2cDYzYjJMRWx5NVByNDB1QUFtZUFjN05SYW45bnNGT0FPb3pK?=
 =?utf-8?B?Tng4RUQ2NVF2SlRSU1lYUnVxNGlUcHd2L0ttWUVlMElVZkswdWVVcWlTWnpx?=
 =?utf-8?B?eEpPdm5abkUraktiandpL2F2WS9NeXhxQmZLN3d4MXRKZzQzRWl3SEtYMml3?=
 =?utf-8?B?YXdZT2ljcC8rTDM3MkU1SW03WUVxcUZFRnZ0ZzdOQU9mREswOHJ1YnBDc1BC?=
 =?utf-8?B?WnQvbk9PYWxpTk1Rd1ovNm5zcUdIbDVLWkdaT2NTUUNIOVdOM1RFdjhYaldS?=
 =?utf-8?B?SzU0VGl4M2M5U2cyWkVRdnFnN2d4YXNrM0JKcUFhS0VzamEvQUdaQzZPVnZo?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c63c180-2b8b-44f1-776f-08dd3fa5204f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 14:07:40.0141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVE2/Lh9dyiIY6zEnPRsGuEfYQW3kCqPbvVb7lMeZVRNcXWAr6Icx5ywX9Dn2ltoi7tqxGg3IKcCQ/MuDv9KA0dW+D4LFLZoTEYU7/0rtfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11318

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjggSmFudWFyeSAy
MDI1IDEzOjI2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS83XSBhcm02NDogZHRzOiByZW5lc2Fz
OiByOWEwOWcwNDc6IEFkZCBTREhJMC1TREhJMiBub2Rlcw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
IE9uIFR1ZSwgMjggSmFuIDIwMjUgYXQgMTM6MTEsIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiA+
IFNlbnQ6IDI4IEphbnVhcnkgMjAyNSAxMTozMw0KPiA+IE1haGFkZXYgTGFkIDxwcmFiaGFrYXIu
bWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Ow0KPiA+ID4gYmlqdS5kYXMuYXUgPGJpanUu
ZGFzLmF1QGdtYWlsLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS83XSBhcm02NDog
ZHRzOiByZW5lc2FzOiByOWEwOWcwNDc6IEFkZA0KPiA+ID4gU0RISTAtU0RISTIgbm9kZXMNCj4g
PiA+DQo+ID4gPiBPbiBTdW4sIDI2IEphbiAyMDI1IGF0IDE0OjQ2LCBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBBZGQgU0RISTAtU0RISTIgbm9k
ZXMgdG8gUlovRzNFICgiUjlBMDlHMDQ3IikgU29DIERUU0kuDQo+ID4gPiA+DQo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+
DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPg0KPiA+ID4gPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3LmR0c2kNCj4gPiA+ID4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA0Ny5kdHNpDQo+ID4gPiA+IEBAIC01MTgs
NiArNTE4LDYzIEBAIGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTQ5MDAwMDAgew0KPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfUFBJIDkgSVJRX1RZUEVf
TEVWRUxfTE9XPjsNCj4gPiA+ID4gICAgICAgICAgICAgICAgIH07DQo+ID4gPiA+ICsNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgIHNkaGkwOiBtbWNAMTVjMDAwMDAgIHsNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHNkaGktcjlhMDlnMDQ3Iiwg
InJlbmVzYXMsc2RoaS1yOWEwOWcwNTciOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MHgwIDB4MTVjMDAwMDAgMCAweDEwMDAwPjsNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDczNSBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJ
IDczNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPCZjcGcgQ1BHX01PRCAweGEzPiwgPCZjcGcgQ1BHX01PRCAweGE1PiwNCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAweGE0
PiwgPCZjcGcgQ1BHX01PRCAweGE2PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y2xvY2stbmFtZXMgPSAiY29yZSIsICJjbGtoIiwgImNkIiwgImFjbGsiOw0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyAweGE3PjsNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmY3BnPjsNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICB2cW1tY19zZGhpMDogdnFtbWMtcmVndWxhdG9yIHsN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9
ICJTREhJMC1WUU1NQyI7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gPiA+ICsgICAgICAgICAg
ICAgICB9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBzZGhpMTogbW1jQDE1
YzEwMDAwIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJy
ZW5lc2FzLHNkaGktcjlhMDlnMDQ3IiwgInJlbmVzYXMsc2RoaS1yOWEwOWcwNTciOw0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4MTVjMTAwMDAgMCAweDEwMDAw
PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDczNyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDxHSUNfU1BJIDczOCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BHX01PRCAweGE3Piwg
PCZjcGcgQ1BHX01PRCAweGE5PiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPCZjcGcgQ1BHX01PRCAweGE4PiwgPCZjcGcgQ1BHX01PRCAweGFhPjsNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiY29yZSIsICJjbGtoIiwgImNk
IiwgImFjbGsiOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNw
ZyAweGE4PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmY3BnPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2Fi
bGVkIjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICB2cW1tY19z
ZGhpMTogdnFtbWMtcmVndWxhdG9yIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJTREhJMS1WUU1NQyI7DQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAw
MD47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1h
eC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IH07DQo+ID4gPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICBzZGhpMjogbW1jQDE1YzIwMDAwIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHNkaGktcjlhMDlnMDQ3IiwgInJlbmVzYXMs
c2RoaS1yOWEwOWcwNTciOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MHgwIDB4MTVjMjAwMDAgMCAweDEwMDAwPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDczOSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDc0MCBJUlFf
VFlQRV9MRVZFTF9ISUdIPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tz
ID0gPCZjcGcgQ1BHX01PRCAweGFiPiwgPCZjcGcgQ1BHX01PRCAweGFkPiwNCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRCAweGFjPiwgPCZjcGcg
Q1BHX01PRCAweGFlPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFt
ZXMgPSAiY29yZSIsICJjbGtoIiwgImNkIiwgImFjbGsiOw0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXNldHMgPSA8JmNwZyAweGE5PjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmY3BnPjsNCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICB2cW1tY19zZGhpMjogdnFtbWMtcmVndWxhdG9yIHsNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJTREhJMi1W
UU1NQyI7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9y
LW1pbi1taWNyb3ZvbHQgPSA8MTgwMDAwMD47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47DQo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ID4gPiA+ICsgICAgICAgICAgICAgICB9Ow0K
PiA+ID4gPiAgICAgICAgIH07DQo+ID4gPiA+DQo+ID4gPiA+ICAgICAgICAgdGltZXIgew0KPiA+
ID4NCj4gPiA+IFNob3VsZG4ndCB0aGUgdnFtbWMtcmVndWxhdG9yIHN1Ym5vZGVzIGJlIGFkZGVk
IGluIHRoZSBib2FyZCBEVFMsDQo+ID4gPiB3aGVuIG5lZWRlZCAoaS5lLiBhdCBsZWFzdCBmb3Ig
U0RISVsxMl0pPyBPciBkbyB5b3UgZXhwZWN0IHRoZSBib2FyZCBEVFMgdG8gL2RlbGV0ZS1ub2Rl
LyB0aGVtDQo+IHdoZW4gdGhleSBhcmUgbm90IG5lZWRlZD8NCj4gPg0KPiA+IEkgYWdyZWUuDQo+
ID4NCj4gPiBJIGhhdmUgcHJvdmlkZWQgYW4gZXhhbXBsZSBpbiBuZXh0IHBhdGNoIHVzaW5nIC9k
ZWxldGUtbm9kZS8gdG8gdXNlIGdwaW8tcmVndWxhdG9yLg0KPiANCj4gQWgsIG15IGZhdWx0IHRy
eWluZyB0byBnZXQgbXkgcmV2aWV3cyBvdXQgc29vbmVyIHJhdGhlciB0aGFuIGxhdGVyIDstKQ0K
PiANCj4gPiBJIGFtIG9rIGZvciBtb3ZpbmcgaXQgdG8gdGhlIGJvYXJkIERUUyBhcyB3ZWxsLiBX
aGVuIEkgc2VudCBwYXRjaCwgSQ0KPiA+IGFtIG5vdCBzdXJlIHdoaWNoIGlzIHRoZSBiZXN0IGlu
IHRlcm1zIG9mIHVzZXIgcG9pbnQgb2Ygdmlldz8NCj4gPg0KPiA+IE5vdyBJIGdvdCB0aGUgYW5z
d2VyIHRvIG1vdmUgdnFtbWMtcmVndWxhdG9yIHN1Ym5vZGVzIHRvIGFkZCBpbiB0aGUNCj4gPiBi
b2FyZCBEVFMgZm9yIGF0bGVhc3QgU0RISVsxMl0uIEkgd2lsbCBhZGRyZXNzIHRoaXMgaW4gbmV4
dCB2ZXJzaW9uLg0KPiA+DQo+ID4gRXZlbiBmb3IgU0RISTAgZml4IHR5cGUsIGlmIHdlIHBsYW4g
dG8gdXNlIGZpeGVkIHJlZ3VsYXRvciBmb3IgZU1NQz8NCj4gPg0KPiA+ID4NCj4gPiA+IElzIGl0
IHBvc3NpYmxlIHRoYXQgU0RISTAgZG9lcyBub3QgbmVlZCB0aGUgcmVndWxhdG9yIGNvbnRyb2ws
IGUuZy4NCj4gPiA+IGluIGNhc2Ugb2YgYSBmaXhlZCB2b2x0YWdlPw0KPiA+DQo+ID4gWWVzLCBm
b3IgZU1NQyhmaXhlZCBjYXNlKSBpdCBpcyBub3QgbmVlZGVkLg0KPiANCj4gVXBvbiBzZWNvbmQg
dGhvdWdodDogYXMgdGhlIGludGVybmFsIHJlZ3VsYXRvciBpcyBhbHdheXMgcHJlc2VudCwgd2hh
dCBhYm91dCBzZXR0aW5nIGl0cyBzdGF0dXMgdG8NCj4gZGlzYWJsZWQgaW4gdGhlIFNvQyAuZHRz
aSwgYW5kIGNoYW5naW5nIGl0IHRvIG9rYXkgaW4gdGhlIGJvYXJkIERUUyB3aGVuIG5lZWRlZCwg
bGlrZSBkb25lIGZvciBvdGhlcg0KPiBjb21wb25lbnRzPw0KDQpPSyBmb3IgbWUuDQoNCkNoZWVy
cywNCkJpanUNCg==


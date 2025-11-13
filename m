Return-Path: <linux-renesas-soc+bounces-24561-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901DC57DC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B3BAD4E58DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791592727E3;
	Thu, 13 Nov 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oFKaq9cV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC012264C8;
	Thu, 13 Nov 2025 14:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043057; cv=fail; b=TzqvXy9FXJHTJIXSXhx9MmXlMdlwB2AFIQ8uaJpcHycB8OKPx/2ztG2pdqTFSdtGThSUDad+5Bg6o6nI6Dd4kZcqX+8XlICs5HklxIq9O9DczfV2pgBhxSwzk64ecG8WbiZRBY93Xbt6vH6NfoXNdYCWCSr2pT2avwVp99yBCRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043057; c=relaxed/simple;
	bh=6BwpEg8P2PukvBlUmnc7feBXxIp6sdxneAE2onKS+tw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZUCwsWZrEmTev8tCq1JD6R+xKlTujAeFeQ88hzZvvM1b/tB60zBjKZtjf3Kwj8oVIgVR0OT+L++qyALwmbFFSfe0OXCncL7Cc5Zsa/flImSJvbz90hPkzZl7pTa6TC5Jig4Fs3DovSU4dMrarptS0arc2ZLcofWVPgslEMJMXK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oFKaq9cV; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lb9uNxVwAvjGeKBRcELGIsJdFmo8xF8Bpc7pjJvGQEZQPCA1owymdeN/7i7G+ITNmOgg0KSrweytQlcpEqqnVGIRr3hPzDOT5Q8Iy1X8RqajH0fcLLHmhxqZ9QE92BkPTkjxemL27covEQTfZNfFXikoYZmFv1eldnOEViU1Nq03/fvMGUILWtlUvCeHRcHwnekS2Q3LgFfrZUpi3wlsUIrS4lHCz/IiBe/0LXKCEDKashBPMfvcmFs5CF6rwiqVaXB2mEHsDxfltT0D4doDzfmaZUYj8+kK3XW24yTFgBVitkos9Wgjc/5bhImHEXAbygDq+xcjvAEF6fjzzYGvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BwpEg8P2PukvBlUmnc7feBXxIp6sdxneAE2onKS+tw=;
 b=CBqiJakxE/zbBrpV/Dz0iDw68YddVH07h38/Tc45dsJKzSkLeHekSzraubI0UXUYeRyJEAq567LZYhIYCSQdfl6Oma4YHOI1bD3OQMM83LPiDuL+ZJQjeLekx4GmsWioKCHmJoysIR1nowsylAG2ZfFAuxUUCfiXFficQPQGoBQwr5nhkRnxaeJ3TG5CqjOZxo/q1nPUz9wOIjYT0dTOw50TOnSD3WuWXUM5t2nf+VXP7becashDHcSoY5LJiazcCBpUODeBa+hVUKRMVky3LRZcjNm3sjGnCyOE4ImQDODJNU8zifjL5NPjXw1CBm7gr7vk+3Zl/bVGMsSBC/wMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BwpEg8P2PukvBlUmnc7feBXxIp6sdxneAE2onKS+tw=;
 b=oFKaq9cVhV+9YgXBWRa/XePhkmOWaq8EkboZadfUuukni2wHY4CvxSOq75o6SmvCUgGbHAhh5V5zu1zRmCK0yksMjyyFnY284SKe2DOzHNPQksfxbGC1syVVw9q3SpJNlFMCx/FxkdwElHBIfuMieHgD0NhnXDdmSKianJ8lOHg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9745.jpnprd01.prod.outlook.com (2603:1096:400:22e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 14:10:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 14:10:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Claudiu
 Beznea <claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"stable@kernel.org" <stable@kernel.org>
Subject: RE: [PATCH v2 2/2] serial: sh-sci: Fix deadlock during RSCI FIFO
 overrun error
Thread-Topic: [PATCH v2 2/2] serial: sh-sci: Fix deadlock during RSCI FIFO
 overrun error
Thread-Index: AQHcSKz6x6/03p0lEUik9cHgoii7BrTl6coAgArQ+5A=
Date: Thu, 13 Nov 2025 14:10:49 +0000
Message-ID:
 <TY3PR01MB1134641A7641EF0C0F0086C9E86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251029082101.92156-1-biju.das.jz@bp.renesas.com>
 <20251029082101.92156-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUXimjkB_Cz=ac43RhOGF2Lf1ypLK1sLwk=ONXf7kdhQQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUXimjkB_Cz=ac43RhOGF2Lf1ypLK1sLwk=ONXf7kdhQQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9745:EE_
x-ms-office365-filtering-correlation-id: 983e01ef-392c-4fc0-3843-08de22be729d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZzZ0SDUwL0o3UWhMcGt5b0dVRld1d3F3M09hSjVuMnc5ZVZMUHk1MXdRTE5F?=
 =?utf-8?B?SWdmTTNLTmNnMjJmQmdBWHBOY00zeGhoRGJaNWNpeHhnOHpzTlNDY2RGMHE1?=
 =?utf-8?B?TzdSajZ4QjVsbXoxQkI2TENvcmE2NjlxVmlrV2NRdi9wOUxFODhUVU1tdC9S?=
 =?utf-8?B?RVNmcjI4SUNINFlBUGx1UmlnNWVDdVE5YnFxWUQ2T0w1R2l1S1pqb1l1TUpl?=
 =?utf-8?B?YXVJam9XMG1ya2hxN1J5bjFzNmFPV3c4RGJSUDNLUTNPdE5MMHN0SEg2Sjd2?=
 =?utf-8?B?OGZQb3FjTCtmNW93UXJlak1FM1BzUXVwY3hIa2F2T2V2TGp5RFVaUnQxL1hO?=
 =?utf-8?B?TWRCLzhrQkpRN0dtSm9QeXhhNndIZndjbjQwRGkyNDVMa1RPNU9oY0xJNUhu?=
 =?utf-8?B?VXJUazRwVUdxcmNCazhRdkFkU2FxSW1aaVg3SFlPQ05TR3I0bFgrRTkvSmty?=
 =?utf-8?B?RUM2WHNERGU0OC9FZUtqK0taUUt1cDFDS0o2cEJQdU85aFZBZUNnWmlTcWlM?=
 =?utf-8?B?LzVFR3Z4V3R2bWtwWWZYSURnZEdJTFJNbjYrc1ZtUFFtdG1ZRVRIbmxWR3B4?=
 =?utf-8?B?aUFDYXJNU2dVNUdLb1YzKzA3UjdOb2xnekZhSTdielhtUnlwNW8xcDhkOFA5?=
 =?utf-8?B?cVk4cThJRlNLUGlPcytiTnZieWlpL3dFNHB4ZlRQZmdHLzBhbTVaVjNndllN?=
 =?utf-8?B?dk92YW5nY21xNGxhQVFaRzUwNUFGQkV4WTM3Y0MwS1Jwell0VndQVWJTZStn?=
 =?utf-8?B?cTB4TUpzNGcxTkt5TThleG94OEJpc29nSkZaUC9pK1ZpNnlNVHNvYzlqWVRL?=
 =?utf-8?B?RHdSdURneVErWGNleHhHVHAzQnZ2b3htcWo5VVdBTis1dE5vZTlMSk5hSTVp?=
 =?utf-8?B?S2dINEp3S0dXbm1YTnBUaGFuSWE2VjRYckhFWXJXZ250WEsxcXo3OWZEcVAw?=
 =?utf-8?B?dTRGaHVwOVJXSzVOK1lqYXVWN09QaUUwOXVZbTRnUjREa3JDeVBBZ2hPK3ZZ?=
 =?utf-8?B?a1dwaHRKTXJzR2xabHBqQ0Q0WHV3VCtwSnlwa2VYSUVDTGFDQ1NhQ3FDTWh6?=
 =?utf-8?B?emlpdnRhN1hySS83NS9NVk9nVzJsRXlQbURoaWVmaTlML2plcWFGeXdzM1Vk?=
 =?utf-8?B?U0RWYkIyTzY2LzYwYVNpaTFuNko4bVpQbWd6QWdINVBRUGxHK09RMklZYmtC?=
 =?utf-8?B?d2JheGlMTjhoN2lIcmxIUXhtMUFYWXNCcUxrUnF2SmhtbU1tYWI1c1N4aDI4?=
 =?utf-8?B?OVJMYVh5QmUvZHBhQmIyd0wzcGo3MXlmTVp4TnBqU211TktHZlY5OXhXVWUx?=
 =?utf-8?B?MUVNam0zbENhNldtTjJjem1tOFNHaFhKRHh6a3YvQ2F4UktDRXJUcTlGcVVt?=
 =?utf-8?B?REtPU0NlME5JS3ZaQlRGUk9TdDFienNwcm5oajR1RzlXN3F4QkFYbmZJYjda?=
 =?utf-8?B?Vk8zOTRDems2ekNXd1lEVHZlYThxaUtiM3FjT3RPY2dvbzhBdTBzemM4U2V3?=
 =?utf-8?B?emt3anUyc3l5eFRHb3ROTkQvR2FLTUw3dEFLanFiQlZDNjlUKzlvZ3RRbWtr?=
 =?utf-8?B?eldENGIvckpmampudzRQZ2w3QS9jT0R4REtPMDFsdXN0NFI2SGpvbllwZlE0?=
 =?utf-8?B?ZmhkLzVrVmk1Um1yaVg1MlhKOGEzRDZFejR5ZysvYXozeGJzenZxYWZQb253?=
 =?utf-8?B?d01HdTMvRXoxVlg1N1Q1YXBnT1B4ZkwrWDJLM0EvZHNmTjQyemRTVG83VXNX?=
 =?utf-8?B?Y0k4UHNEVUJDWXdXbUxwSWNraTFYTjRSSVd4MUFjR2dlM0xxZzlKSi94Lytl?=
 =?utf-8?B?SmFLKzhtUG13L1NkVWtjYUNRL2JPQ0NrZ25nRHI2aExPRUYrUjZEUWwxRTRS?=
 =?utf-8?B?NndrYmZzRk4vSnBWekpiQTFuM0FmcHNXalNITGxLeDNiS05QUkI2N1EwWjNs?=
 =?utf-8?B?SkZTWGVSZWVodHJvVEcxQUNuVXBNZFdpVEFaQ2xYRDgxQ21paFVGSVlSS3RF?=
 =?utf-8?B?bXZvTXlWVTZ4Rm5BdHI3Zm5HZTlPbHNGYTNjdHEwZXdpc2YrSVJUVW0yUTJ1?=
 =?utf-8?Q?yK+Xf3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWYzbVlSRkVWYW1FbUtJNDBhRWFqeUZRdlZsKzEzY0xrT0pmL2NkR01oZlF1?=
 =?utf-8?B?RngweGg0WmJyNEFoVnJ4NlV1aGExYU1yeTE4bHhRQUlSeVhyc3I2UDdXZDFD?=
 =?utf-8?B?NXdESTJ2eTNoNDJSV1dLTkJuWmtUMExmQ2tMNzlwSXJ5UzEyK0swYUdOZjQ3?=
 =?utf-8?B?VGU1aU84NHBDTWhnL2NLNVl0TUlxR3pUSUpJaXhGWnM1dHozWFBxeGEyTnhX?=
 =?utf-8?B?VXlDY0ZoTWROTU5ZTHNyN3F3VjlGL3BDRjZMY0pGSS93aWgwdThMdVFWdUpY?=
 =?utf-8?B?MUFMQWw1b2JkYkJPQy9nenVBYVZlaDVQazZxOG9IeU9zQVlpS0ZGRkl5MG14?=
 =?utf-8?B?cldhdFdwWUtXUEdOdVRmS3BhdE9yNnRSaHpDeXpjdDVIYk1Jc0w4eksxQTV0?=
 =?utf-8?B?cWdaM21INXV3T2NvRE56dlBLYVIxS25nSURQbWdRWWZFcXFCNjZ5UVRzRXhP?=
 =?utf-8?B?MTZUd1hsUXV5N0dYT1FjczFYOEthVGFpVG83WTRXSHR3QmRiR1VzbEVyYmdS?=
 =?utf-8?B?UWREOG9vRE90VTZFbytCa3lhWXNkME9FeDlqL3ZxM3YzTVQzT05tVDB1R2tq?=
 =?utf-8?B?amEwQm4ycmpjdXN1ZGRUbCtSMDFsY0RqVjN0eW1wTHo0a01sN0w4c2FKRGVM?=
 =?utf-8?B?MXlUMGc2VHYyNmJENDlQY3hMd3hweXNzRjBEVXRhU2VkVkozNVhPWHJCRndG?=
 =?utf-8?B?ejdqS3ZsWTl5TEdlT1lKTGl5UGN5RUNSelJMTjFWekloaHdPUXhQU1pvbkFT?=
 =?utf-8?B?MzRSZVNET3g2dzVFT0R5RW1xVG8vOTVHNkNJZnR2WmlzZGxibkFQNGl0SXRj?=
 =?utf-8?B?ZDlVZEpMenU4b203U3ZNVEUvSGxtVEdCTDJzOWY2VC9MeVl2dy9rbGhkRlc1?=
 =?utf-8?B?UWpQT1hOV2FQeS8wYTY2R1VhVWRLclU3bWdVWkpaT0dOMk5pNm4vTE15RUJY?=
 =?utf-8?B?aWtuNUJxZWhPQi8zbjNtVXlPTzByK0FwOWFYQitobkFWdnJxb2krcVVLQTl4?=
 =?utf-8?B?MUxlOXZ3RGlURlNQUW5HcEp3KzFYTWFkVmxlT3J6Ti9vSXg4TUYxTUgweXkx?=
 =?utf-8?B?WkNxWnpiRVpZVlIxWFJMNmdkN1EvaHZ3dlZGUERzeEVJanZDUUtkL2VQTzdk?=
 =?utf-8?B?cHAyd1k1eFRIbE1RaUMrN3BlaEdZSjhLbzh5UE9xMldZS0VWcjlZVmkwT2p1?=
 =?utf-8?B?ZU85QWw3L0h3OTZ3d25tR2dQZDhSQW9TREp4cDZqdFpNSUxkc2ptbW5ncW1Z?=
 =?utf-8?B?OG9Ia1NQUEJ6dWhMYVFxblB0UGZCM3lpdFZoZExLbDFaZTZZVXRJRUdnekpB?=
 =?utf-8?B?VmQyUFpZNVhtRjFWQXJvOEpJR2VTQ01oRWpzVzgwUDh5VFJJbTJteEZzYlJM?=
 =?utf-8?B?Zll0QTFwWGF1Z0xWT2dxSmVTWG9OUlcyVVJ5VXExZW1McHJkNjlnczNzL0tJ?=
 =?utf-8?B?ZmpIOXdxdytzVGhVRG5EcGlBZVZMNFlqWExiZVFQTkNjOUZSbGsxSC9aMzBv?=
 =?utf-8?B?Yy9HY0V0VE1zUTZlL3dLTjF4b2hiZFBiQ1I2RlFnTjh1M2dueTNZM0QydStG?=
 =?utf-8?B?Q3kwdExqR2NyU0RsUEhaZnYxVmRwNTN5TjBNZWIzV2luc2ptK2RyaDdlWjVh?=
 =?utf-8?B?OUtGNmZkVUx6Uk5BeVF4WU5OYm9HOGx6WlNhQ1VGL082Q2xlOVJ3VXZobUtR?=
 =?utf-8?B?ZW1PQlo5MHZ4ejR3S20wRDdSdUhNZE5tS2tKWkkzR09HM01uVFo3dG91YnAz?=
 =?utf-8?B?UXdSZHRMVFBDTzRIeFZpNC9LWEhsM0FXWjd2QzFpbE5abUcxdzVxRFNidjFq?=
 =?utf-8?B?YWxiQ2gveHI0RG0zaHZiQnZmMVdua1hITlNjTGk3Ym5GWGFhd2c2c0xFZ0FH?=
 =?utf-8?B?Q2Vmb3dDSjFZV21WeHZPTFdwbGFoMFAxQWtPRWxLYTh1SzFMKzVoUEZ0WGhP?=
 =?utf-8?B?L1VTT0hhUzhnS2lhUDFmQ2xwb2h6OUtKUUlTRHNKRkRRbG92WlhGU29YOFBm?=
 =?utf-8?B?SERMRTZCeTgrVVh5eEMvMzZ0SDdsNUFDMVF2dXZHcU4wTTBiL0xoTnFPUnZq?=
 =?utf-8?B?NHFnRG95eGNBQS9BZXF1QnB1K2pQNVZZMDRxQUdJMG5nNEk1MHA5YkN2Vitx?=
 =?utf-8?B?eDJhay84QTNVcE1YaEx6TGdrWFZTTGpLU1VPaFhSL2tLbjh2Myt0NHpYNVVp?=
 =?utf-8?B?bHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 983e01ef-392c-4fc0-3843-08de22be729d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 14:10:49.4636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWzGUAG3mOHs6tPVggjkZCKS6jhs+yzwy9AqEZasHnpZj4mOq4JLKjBKVYbmUxkg9NGEO+pgtXNySpgEkpF9fGEkJOAtlKb341NVOX/mcLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9745

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA2IE5vdmVtYmVyIDIwMjUgMTY6NTENCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAyLzJdIHNlcmlhbDogc2gtc2NpOiBGaXggZGVhZGxvY2sgZHVyaW5nIFJTQ0kgRklG
TyBvdmVycnVuIGVycm9yDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCAyOSBPY3QgMjAy
NSBhdCAwOToyMSwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9t
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBPbiBSU0NJ
IElQLCBhIGRlYWRsb2NrIG9jY3VycyBkdXJpbmcgYSBGSUZPIG92ZXJydW4gZXJyb3IsIGFzIGl0
IHVzZXMNCj4gPiBhIGRpZmZlcmVudCByZWdpc3RlciB0byBjbGVhciB0aGUgRklGTyBvdmVycnVu
IGVycm9yIHN0YXR1cy4NCj4gPg0KPiA+IENjOiBzdGFibGVAa2VybmVsLm9yZw0KPiA+IEZpeGVz
OiAwNjY2ZTNmZTk1YWIgKCJzZXJpYWw6IHNoLXNjaTogQWRkIHN1cHBvcnQgZm9yIFJaL1QySCBT
Q0kiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVy
cy90dHkvc2VyaWFsL3JzY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9yc2NpLmMN
Cj4gPiBAQCAtNDE0LDYgKzQxNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2NpX3BvcnRfcGFy
YW1zX2JpdHMgcnNjaV9wb3J0X3BhcmFtX2JpdHMgPSB7DQo+ID4gICAgICAgICAucnh0eF9lbmFi
bGUgPSBDQ1IwX1JFIHwgQ0NSMF9URSwNCj4gPiAgICAgICAgIC50ZV9jbGVhciA9IENDUjBfVEUg
fCBDQ1IwX1RFSUUsDQo+ID4gICAgICAgICAucG9sbF9zZW50X2JpdHMgPSBDU1JfVERSRSB8IENT
Ul9URU5ELA0KPiA+ICsgICAgICAgLm92ZXJydW5fY2xyID0gQ0ZDTFJfT1JFUkMsDQo+ID4gIH07
DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzY2lfcG9ydF9wYXJhbXMgcnNjaV9wb3J0
X3BhcmFtcyA9IHsgZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS1j
b21tb24uaA0KPiA+IGIvZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS1jb21tb24uaA0KPiA+IGlu
ZGV4IGUzYzAyOGRmMTRmMS4uYmNkYjQxZGRjMTVkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
dHR5L3NlcmlhbC9zaC1zY2ktY29tbW9uLmgNCj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwv
c2gtc2NpLWNvbW1vbi5oDQo+ID4gQEAgLTUxLDYgKzUxLDcgQEAgc3RydWN0IHNjaV9wb3J0X3Bh
cmFtc19iaXRzIHsNCj4gPiAgICAgICAgIHVuc2lnbmVkIGludCByeHR4X2VuYWJsZTsNCj4gPiAg
ICAgICAgIHVuc2lnbmVkIGludCB0ZV9jbGVhcjsNCj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBw
b2xsX3NlbnRfYml0czsNCj4gPiArICAgICAgIHVuc2lnbmVkIGludCBvdmVycnVuX2NscjsNCj4g
DQo+IEkgZG9uJ3QgcmVhbGx5IHNlZSBhIG5lZWQgdG8gYWRkIHRoaXMgZmllbGQsIGFzIHRoZXJl
IGFyZSB0d28gYWx0ZXJuYXRpdmVzLi4uDQoNCk9LLg0KDQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4g
IHN0cnVjdCBzY2lfY29tbW9uX3JlZ3Mgew0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9z
ZXJpYWwvc2gtc2NpLmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4gPiBpbmRleCA2
MmJiNjJiODJjYmUuLmIzMzg5NGQwMjczYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9z
ZXJpYWwvc2gtc2NpLmMNCj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMNCj4g
PiBAQCAtMTAyNCw4ICsxMDI0LDEyIEBAIHN0YXRpYyBpbnQgc2NpX2hhbmRsZV9maWZvX292ZXJy
dW4oc3RydWN0DQo+ID4gdWFydF9wb3J0ICpwb3J0KQ0KPiA+DQo+ID4gICAgICAgICBzdGF0dXMg
PSBzLT5vcHMtPnJlYWRfcmVnKHBvcnQsIHMtPnBhcmFtcy0+b3ZlcnJ1bl9yZWcpOw0KPiA+ICAg
ICAgICAgaWYgKHN0YXR1cyAmIHMtPnBhcmFtcy0+b3ZlcnJ1bl9tYXNrKSB7DQo+ID4gLSAgICAg
ICAgICAgICAgIHN0YXR1cyAmPSB+cy0+cGFyYW1zLT5vdmVycnVuX21hc2s7DQo+ID4gLSAgICAg
ICAgICAgICAgIHMtPm9wcy0+d3JpdGVfcmVnKHBvcnQsIHMtPnBhcmFtcy0+b3ZlcnJ1bl9yZWcs
IHN0YXR1cyk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChzLT50eXBlID09IFNDSV9QT1JUX1JT
Q0kpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzLT5vcHMtPmNsZWFyX1NDeFNSKHBv
cnQsDQo+ID4gKyBzLT5wYXJhbXMtPnBhcmFtX2JpdHMtPm92ZXJydW5fY2xyKTsNCj4gDQo+IDEu
IFlvdSBjYW4ganVzdCB1c2UgQ0ZDTFJfT1JFUkMgZGlyZWN0bHkgaGVyZSwgDQoNClRoaXMgbWVh
bnMsIEkgbmVlZCB0byBtb3ZlIHRoZSBtYWNybyBDRkNMUl9PUkVSQyBmb3IgcnNjaS5jLT5zaC1z
Y2kuYy4NCg0KMi4gQWxsIG9mIHRoZSBDRkNMUl8qQyBjbGVhcmluZyBiaXRzIG1hdGNoIHRoZQ0K
PiBjb3JyZXNwb25kaW5nIENTUl8qDQo+ICAgIHN0YXR1cyBiaXRzLCBzbyB5b3UgY291bGQgZG8g
d2l0aG91dCB0aGUgZm9ybWVyLCBhbmQgdGh1cyB1c2UNCj4gICAgcGFyYW1zLT5vdmVycnVuX21h
c2sgaGVyZSwgdG9vLg0KDQpPSywgSSB3aWxsIHB1dCBhIGNvbW1lbnQgbGlrZSBhYm92ZSBhbmQg
dXNlIHBhcmFtcy0+b3ZlcnJ1bl9tYXNrIGhlcmUuDQoNCg0KPiANCj4gPiArICAgICAgICAgICAg
ICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgJj0gfnMtPnBh
cmFtcy0+b3ZlcnJ1bl9tYXNrOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHMtPm9wcy0+
d3JpdGVfcmVnKHBvcnQsIHMtPnBhcmFtcy0+b3ZlcnJ1bl9yZWcsIHN0YXR1cyk7DQo+ID4gKyAg
ICAgICAgICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAgICAgICAgICBwb3J0LT5pY291bnQub3Zl
cnJ1bisrOw0KPiA+DQo+IA0KPiBCVFcsIGhvdyBpcyB0aGlzIHJlbGF0ZWQgdG8gIltQQVRDSF0g
dHR5OiBzZXJpYWw6IHNoLXNjaTogZml4IFJTQ0kgRklGTyBvdmVycnVuIGhhbmRsaW5nIiBbMV0s
IHdoaWNoDQo+IGlzIGFscmVhZHkgYXBwbGllZCAoYW5kIHdoaWNoIEkgc3RpbGwgZG9uJ3QgZnVs
bHkgdW5kZXJzdGFuZCB0aGUgYmlnIHBpY3R1cmUgYmVoaW5kLiBJJ2xsIHJlcGx5DQo+IHRoZXJl
KT8NCg0KRm9yIG1lIGl0IGlzIGEgc3VycHJpc2UsIGZvciBkZWFkbG9jayBkaWQgbm90IGhhcHBl
biBpbiB0aGF0IGluc3RhbmNlLCBhcyB0aGUgb3ZlcnJ1biBlcnJvciBwYXRoDQpuZXZlciBjbGVh
ciB0aGUgaW50ZXJydXB0Lg0KDQpDaGVlcnMsDQpCaWp1DQoNCg==


Return-Path: <linux-renesas-soc+bounces-20611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D685B2A042
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C77617C7DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51BE2765E9;
	Mon, 18 Aug 2025 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Evfy+CS7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7D2319845;
	Mon, 18 Aug 2025 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516276; cv=fail; b=oOLo5GWeOXN9BLevBEb8KpLuEQARiItDaG5K8uPtPEfioWRYNDBFGpTI5pdXcO95zAz7V62KxjQwLk3gb6JMAzphGDNbwVopS/oqikWK+915Kpz7N5t1OfimV9II+qZfDNOmlz71JinDDBePU0xJ+3gdrWWSonIgHSW3yA+GRfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516276; c=relaxed/simple;
	bh=9p7fN4rGpGDRjfkUD+Mtw+bsDE9I0bZTEhmMOG4IZHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FNTGmg4tRk3d6PrDA4QkNnOfof/tGSDXMdJwJ/2Dh02PRKBSHpT9CCRwa7ZVXRgpUolHDVMoaAo1xJJwG/poEHHyqjMTdPZMVZ0b48yDIcNNB9DV4Sn96+T6YR9Bhj65KPmWRFkOiCOuM+vrH5+0ItUzYYu48xYMhR2BOtkf0Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Evfy+CS7; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdjzLJW6/PzCqQ8K+vj20YvPfvxtNG4iZrFYZleqOuatB1czsLOyMs3bLA7cFPf3+s9v7gnBO0AFn7H00/ZJdzsRVSG3l1Uy5MjZZFYnyDpnbZeMeRzRvefLn4WbkQNgzTdE6i10RUiJpB2WLGC/A+WI5rUMHrf93tGCgO7rgCjdxE7SQfnNCrm0b8ruJAHJsWHaCy1x2KQMvqcSqQBw14lQ1GI8kP1NY60xSZSGXvVHgVLDwNn+1lR6C7DWm67qIvgsNT/1BM2X2nP74hjDsAY7IFP3BQXLcUqr4uKE8+pJe6HbaQaxO+k9rVQxZrT7ImyNuisiD97ZRCPO5ONL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p7fN4rGpGDRjfkUD+Mtw+bsDE9I0bZTEhmMOG4IZHQ=;
 b=kq/n/ggIall02x+a90u8nKeDHGxMsFyYWU8ik8TpSuDIg9c+e+Yt45JGw1ik8zuSrDoWKUV+8Gn2NVdPx1wMyvqGBqYvlz4/DN1XsQTafjMoXh1Rd6AN3IdE1FLUAvpdtXzzNRfH8wExK+scgc4xpEyZcP/tlnrd29TwO8L+dWhJMUyLIV6OhwevwJ3o06VHDupqs+IETnJrzvWMhCtSaSr6T50zsiUbA2zcVcg+1CW+xurV5/lSsxrtJ+kB+mz1AbjqLDL0mlnRc0WXXnnWmOzsEMTxFH68eEdmE/srPD/ocBe25VLOhii7Y2uLJ5t3lF5MGbSh9k9J4UAQ5QyiQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p7fN4rGpGDRjfkUD+Mtw+bsDE9I0bZTEhmMOG4IZHQ=;
 b=Evfy+CS7quBhShl69Sp4yU03thadBsByrYQdUMjDV3m3IVbSV7iHgqOQxMkE4NcrMHTA9bKkxJP4OSB7/FdGAnWUohC1dHXutQSOZH2Cut1s7bIyYynTI6LpmsQ/w0G2ZEYDGS8b4KuD2QmGqkz1bnoocuJb230ESE1Yp86vWuE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14354.jpnprd01.prod.outlook.com (2603:1096:405:237::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 11:24:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 11:24:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: wsa+renesas <wsa+renesas@sang-engineering.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
Thread-Topic: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
Thread-Index: AQHb6TXbfHLMvzblLkub8satum1rp7RojDKAgAAGGCA=
Date: Mon, 18 Aug 2025 11:24:29 +0000
Message-ID:
 <TY3PR01MB113468226A18AAA136A3389A98631A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWwuK8zKm+j4KEZaGcABSaNmmy7CKUFa+8r0t43obYTEg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWwuK8zKm+j4KEZaGcABSaNmmy7CKUFa+8r0t43obYTEg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14354:EE_
x-ms-office365-filtering-correlation-id: 50b17afc-353a-494f-ca24-08ddde49cc70
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TlJYQjhSRlJrYjFNcFRHMUFKQUF0cUFyNGVGbXlZcUNIdEFPVituWERRTXds?=
 =?utf-8?B?YUZHNTdBVDE5Yko0N2ExZUh6U2p0ZDM3ZDZ4UEtFQXlMTGlZNlJWMlFLUFlt?=
 =?utf-8?B?QU9OdVhvM3BmTnNUeVZxVXNqR05vZlJRTU1Zdnp5dDYzQm5qRXR6TnAwZ1Iw?=
 =?utf-8?B?TS80T0lQbUtMbG96S0FjVTRpWlpYVGxKUnI3cVprclM4YytNZ0RpYkF3cmI2?=
 =?utf-8?B?V2JuQiszenF6SHFxY2x1QXlPNkxQVGcreDZ4M0cxbWwyS1ROa1ROd0c5cUF0?=
 =?utf-8?B?UXlaN01uTURpQ3dvbTNvU3FPQmt0aHlOMThLU3RYVEU4UXp2azdnVkR2Ny93?=
 =?utf-8?B?ZmU3VTF5TUo0eFdYRFJDY3dpYUVnLzVhM2xyUnVlcmtIQlhhNDhWaTlHRSsy?=
 =?utf-8?B?ajhzbFJpdGtZM2hHSHBLNGwvckp4a3FkM2JweWE5eEdGTkczUVFKSnlkSVZr?=
 =?utf-8?B?TWgrUngvOGJMN01IbDdZM0hDRHd1cE5GS2lCZHk2TFBqdHpUZm9oZGJVNUZ2?=
 =?utf-8?B?TkpWbEVnejUwbUZ2Zm9DMUxFZVFMRXpmTXlVNGh0dmFUS0ZHbGVwc0gxdHJl?=
 =?utf-8?B?S0U1SEtLbG8wL1pDQzJPdUdtSG5UdU9RN29XYmladlR3RUpaOUllQnpIR1E4?=
 =?utf-8?B?a29nemZjK2xjOUNmcnlEMk1EMmFWMGJlblBsUmZFUHViZmlOMlFFZldtMzdD?=
 =?utf-8?B?OUErNStNSlNOblB5QmhOZjJBd1JZMDQwb1cydjNyV1RLZHFDQ2FQOGZ1Rm1M?=
 =?utf-8?B?Yk1jRGdVemVQdkRnZlp5SXlvYi9NYS91Rk5TOTh0TTd2ZXZQako1WDZHbEFJ?=
 =?utf-8?B?ZldybFVrOGxDK2JBblRkQlA0ZnEyOEFrdTdUZlBzR2RtM3dqUjlPNThMOEM1?=
 =?utf-8?B?ZTdRRm9iK1pmRW80UUNydHo1Ui9PV1ZDTkk2d2VTbXpVNk43Sy9YSFFBVTJY?=
 =?utf-8?B?RVowQ3kzSHNraTJ1MXAxMGpPa0dRaTNZeTVjUEVFSkdxTWFiNmpwZEN6Mlhr?=
 =?utf-8?B?M1NkNUVaeUdGbTBXZEZ5eFpTODA1T2s2UXhXQTlXalZuSVROUGIxSG44d0Nh?=
 =?utf-8?B?bTZFSlU5aDFKR1R2Z3RyK2UvYVU5a0VDaitBL25GaVowaWtXRGhLMmdzdWgr?=
 =?utf-8?B?MFFxa01Va2VHL2hNek5vWFJiVVNzM0tyNndRZ3lUZ01yNkUrZ0Jya1EzRDFD?=
 =?utf-8?B?WW9OWitVa0FKeWZxUjk4RWk4RFB0dU9kbmplZnB6WTF6TTFBMzRHa1A1dzVj?=
 =?utf-8?B?RTdNSWVYZzcxNEh5UjRjOVVablMvemdPUWFqTkNpbDBqWENHWEtzNmJ5M25n?=
 =?utf-8?B?RUh4NnhxTkM2emJwNkN3Vjl2NmlBS0hZbGdraEFHb3RTSlRDWHpxa1dMUUFZ?=
 =?utf-8?B?a1B1V2xMNnRHa0svMzRTUXpXR0ZvdXVwU05KM3FWTStxRXZHR1FLV1FLa3JQ?=
 =?utf-8?B?NFliYzdXRlRxWGc2d213bmI0Rkx3alRXQ1Q2UkFKWk1nbjhFc2p2U0huRzE1?=
 =?utf-8?B?N2FqSUkxMC9sWWNhWVplc05iM1J2Tk9aTXJoRFp4b2JwRVZ0Tzd3YmxPazFE?=
 =?utf-8?B?cXhmN3o3UlM0WHEyeVZTNUNJQ1haeVFta1UxYUE1UkUwTW1saEcwQkhydkd0?=
 =?utf-8?B?OTJsY0dwUlBJbllEdGlkOXBtL2d4bG9UeUl4WWZXMDVja2plTUtoL2M2ZXRD?=
 =?utf-8?B?QTNRYnY4TWwxNDF1b0RNRHB6T1JZWkF1NEtUdS9CcEE5S3UwUExPWEp6M0NG?=
 =?utf-8?B?N0RDdE8zNkloUm1zdGdMb3JOV2EzTUdLeStCdEF2UWxzN2l4MjNtemMvSk1y?=
 =?utf-8?B?RFYwckpBN0VkdFViWGFFZlQ2NndUdlNPbHNFblNVRnFUOEFTKy8xQzNrSnJx?=
 =?utf-8?B?MHdDL2tST3RGNXpMU1N3MWlHNzRsbVlnZHBBN05LdmRvQlpYMHgyME96WkhI?=
 =?utf-8?B?enB5RFRqOUI5OVJlemVrUDFJbjlISXF0YnRJaTl3UGF3ZXQ0K2lYTEpsR0Er?=
 =?utf-8?Q?yk8Y8xgGanmUbijSf7ml8WAYuykoxI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NGw1blBhaGlJNE9OYjFycndaQXpMcXJuTVo3elN3NUlRVkJTUElscmFlRkc2?=
 =?utf-8?B?VThuaDJiTWhzR1hzOHFSRTk4a09JR0k1R3d1eWsramxSdHkvNWkwalBnQ1Rk?=
 =?utf-8?B?RDB5cFhORU92aXViRnZLZC9mS1oyeXVubDVMa3ZhSkRsbmRkdkhsNjRFMFJK?=
 =?utf-8?B?eUlLSlQyUGVxZGM5ekhvL1o1bHFtb2VseDJHcVE0NzFzRmFCbVJQL2lIbE9P?=
 =?utf-8?B?Y3JNOUEyMXVNUkZYWFhtMjZ4SkhiNHRQa3pLSnZiYlNHMWlZTU9QaFFjWXNk?=
 =?utf-8?B?bmIrWnQ0YjQ4U3hmRnkxZG5EVmwwU0RCeU9qWFZqR3ZhcFFlK29aMGxNTjZ1?=
 =?utf-8?B?SHA5Rlc3UFBEb0YzR1RLaERhcjNmVzlZUHQ1Z1dUZ0JDSHVjaHVuSUMrbGdL?=
 =?utf-8?B?a3lKeEJxaTNmQzZ1bmNLb1Z0d2FaWDIyclZKY0N0cVRWREVuczF1eVJkY3VF?=
 =?utf-8?B?RkptbmVHTmhGK1B1NHNPdjFvQWZ5QjBOb1BLa0ExcjlsSlpnOGZLZHpKRHVH?=
 =?utf-8?B?b2FzRTdMRm8yNmEyMUdzMXNsSDJwQXpSdm83SHBVSkJRRG9nTDlML1kvQzA5?=
 =?utf-8?B?Zlh2bkpTRHRxc01rRUtCYWRXYnd1SzFUN1M4ek5jemRoRXl5ZjdGdEs4WDVY?=
 =?utf-8?B?OS9OT1d5OG1rVVFScUcrZkg5Uy9Yc09rNVFPdE4rOHgwdmx3eEtDaXdZeHdy?=
 =?utf-8?B?cUxMUVp1YWM2Ylg1YVliZEtrUEtPSW11VXJ0NnhQQkk0aVgwUTIrZERSbzA5?=
 =?utf-8?B?VXBUZkIvSDBlRlpDNXN2TDIxSUtVRU9PUHBxUEVQKzJpQnRQL0YrS3JuZExJ?=
 =?utf-8?B?c2djT2ZkWEFzZm9DQ3RZcHpwTmtMSXBpM0Y1TEJwajFRZkVkdHIzOFJXa01S?=
 =?utf-8?B?aU90cTFoQXRRa1JSU2Q3MXlBamN5ZU5UejJxOFYxblA5TmJzOWFrWVhOdnda?=
 =?utf-8?B?YzJHaUx4TVJibm1JcHE5V3JCanlubGt6OEFWQVVpQnNxcXpOc3dWWEptVzNP?=
 =?utf-8?B?cHpmL2dOQzBhSjJtajZVSVdIUHBGWjZ0VjR3aFo1ckF6Ni9aUWp6bWorRnlN?=
 =?utf-8?B?NFZuMTZjVWk4dTVHYVYxQmZURVRWditlOStPYkg4dVhUdkhlcHdleW9YUG9i?=
 =?utf-8?B?YzVvSlF5b3puOENQTU5hVDlwcnc5Q01lb2trd3hNUTBtUUl2ZytkaW0yMDhR?=
 =?utf-8?B?VFJ3bHIvZCtCcmdwY0Y3eml5T0JBWWVzb2IvaDFndzYvY0lUVWxKZFVSU0tr?=
 =?utf-8?B?TDQxelBFWkNXd1hLU1B3UE9wMExFZmFvSnlvUkZINW1GMXBmKzJCM0FyeVhU?=
 =?utf-8?B?ZTVhbE9DaVJYSU4ya2s3NUcrY1FjUkxaZTNXbWZIVTF2QVJJa0JWQmlsN3BW?=
 =?utf-8?B?T0Vab3M0RjEwa1ZrSEM4d3NWejY0dmNNYUFGL3RJbFRwbDFTRTFwN0V4a1FL?=
 =?utf-8?B?b3pJU1JLWVhnQitzSWRyQXByLzh3NUoyUTE4dEdVM09CSXU5MDYyZGNnNTB1?=
 =?utf-8?B?QklYdksrUmF5NmlLZStUelBKY2xJcm9CdGI5VnY3ZWUrdSt1MnQzbUM0bUU2?=
 =?utf-8?B?NGp0TXNsNXNxbFRaQjA0K1UzWEFOcThxbzVOYzNkUWY2MUh0VVNsTXNUbjJK?=
 =?utf-8?B?WkZuV2xOT053cUZEazR3M0M0L1dkekFQVGQxams5TlBaYjFia0g3dGxyT3Vo?=
 =?utf-8?B?WjhsMi9QWldLVEZGRFBOTmtTTG5MM3VNbUZCUXJLRythUUhkandJZXhSRWFi?=
 =?utf-8?B?WDhidVQ1YkZ3SFR3VzdWTVp6N25QS2JJOXNYdUdDYUdqcFBXZ2VoM3MwZ2hI?=
 =?utf-8?B?a1RldUtNYzJGbEcxN1Y4cUhDaGpkZVMwN0o5ZnorTHJzNDBLVjNYY2M1cTFu?=
 =?utf-8?B?R1l6YUtPZnpjOGFHZGZqRmZMcm92QXkxSFprQ3l6SllROGpPckxjcmxzTktK?=
 =?utf-8?B?MFRtTHd4MjNoQ2t1V1R4Vm1uQ2x2R3BCQS9xdUFBWjJ6UWVlRWd3aHRxY2I1?=
 =?utf-8?B?K0NZMHRoY3hnalhsZVJ6bGlncGdFM25HMFArOW9EVkxWY2pIeENaZTB2by9J?=
 =?utf-8?B?RVpMdEFWYVVCNW1lNWMrMjlJZFJaUWNGbUx2VXZhRk01UG44OW9rRSthREtW?=
 =?utf-8?B?TE12amxqYS8rc2FYaVgyZTc2TGdoVnIzbFByZTFjRU02dGQrVGttZ2NlNHVr?=
 =?utf-8?B?VVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b17afc-353a-494f-ca24-08ddde49cc70
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 11:24:29.9989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZyPU4ldyeP8X8n8mH822qKokPOXmQjNpHS4v4cigH59HPymnzLnoJEdzrqZmR8ezfU+a9I4qxeKaCLtinOntRg/3nWxg3JD5bEhN03C8qfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14354

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE4IEF1Z3VzdCAyMDI1IDEyOjAwDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggUkZUXSBtbWM6IGhvc3Q6IHJlbmVzYXNfc2RoaTogRml4IHRoZSBhY3R1YWwgY2xvY2sNCj4g
DQo+IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4sIDI5IEp1biAyMDI1IGF0IDIyOjM5LCBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFdyb25nIGFjdHVhbCBj
bG9jayByZXBvcnRlZCwgaWYgdGhlIFNEIGNsb2NrIGRpdmlzaW9uIHJhdGlvIGlzIG90aGVyDQo+
ID4gdGhhbiAxOjEoYml0cyBESVZbNzowXSBpbiBTRF9DTEtfQ1RSTCBhcmUgc2V0IHRvIDExMTEx
MTExKS4NCj4gPg0KPiA+IE9uIGhpZ2ggc3BlZWQgbW9kZSwgY2F0IC9zeXMva2VybmVsL2RlYnVn
L21tYzEvaW9zIFdpdGhvdXQgdGhlIHBhdGNoOg0KPiA+IGNsb2NrOiAgICAgICAgICA1MDAwMDAw
MCBIeg0KPiA+IGFjdHVhbCBjbG9jazogICAyMDAwMDAwMDAgSHoNCj4gPg0KPiA+IEFmdGVyIHRo
ZSBmaXg6DQo+ID4gY2xvY2s6ICAgICAgICAgIDUwMDAwMDAwIEh6DQo+ID4gYWN0dWFsIGNsb2Nr
OiAgIDUwMDAwMDAwIEh6DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0K
PiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+IEBAIC0yMjIsNyArMjIy
LDExIEBAIHN0YXRpYyB2b2lkIHJlbmVzYXNfc2RoaV9zZXRfY2xvY2soc3RydWN0IHRtaW9fbW1j
X2hvc3QgKmhvc3QsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY2xrICY9IH4weGZmOw0K
PiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gLSAgICAgICBzZF9jdHJsX3dyaXRlMTYoaG9zdCwgQ1RM
X1NEX0NBUkRfQ0xLX0NUTCwgY2xrICYgQ0xLX0NUTF9ESVZfTUFTSyk7DQo+ID4gKyAgICAgICBj
bG9jayA9IGNsayAmIENMS19DVExfRElWX01BU0s7DQo+ID4gKyAgICAgICBpZiAoY2xvY2sgIT0g
MHhmZikNCj4gDQo+IFBlcmhhcHMgQ0xLX0NUTF9ESVZfTUFTSz8NCg0KSSB3aWxsIHNlbmQgYSBu
ZXcgcGF0Y2ggZm9yIHJlcGxhY2luZyBtYWdpYyBudW1iZXIgd2l0aCB0aGUgDQpDTEtfQ1RMX0RJ
Vl9NQVNLIG1hY3JvIGFzIHRoaXMgcGF0Y2ggaXMgYXBwbGllZCB0byBtbWMvbmV4dC4NCg0KQ2hl
ZXJzLA0KQmlqdQ0KDQoNCg==


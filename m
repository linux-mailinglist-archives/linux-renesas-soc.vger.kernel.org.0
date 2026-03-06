Return-Path: <linux-renesas-soc+bounces-28918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNi/ASOaqmkxUQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 10:10:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCFD21DA76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 10:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CD6F300DCD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 09:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020802D5924;
	Fri,  6 Mar 2026 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="niLJCs3i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C27158DA3;
	Fri,  6 Mar 2026 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788254; cv=fail; b=pvwkIYN3Q9Bk6lWnLoKwhVdQOdKtOSGz+kLFW2y4Od3ixauvU8+dlKprTVzhyQ3zOE/7j+junzUqspKxuo34noLgwTpUiWy6YJmloEjtv94LkoCs1dh+mqOLw8SJU21ELKtsY3+5thN3KqTG5ZPY5weHCgfDDZvpr1DyFShxc0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788254; c=relaxed/simple;
	bh=V1/1FIGlmDHdlZmrhp4CjZ5eu7K51GlygC0tJVpaO6o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D4LlG7fjoSpKih1Ebs8VyxHHdk1wNXkmIb/KQngmoBRmvbWOPibCK0jhOmTgmwhDnbGtM4kHvfVVqW+L2tkCmumzrVliQkORXMcc6do/+F+NPZhve5OR1LOeaXd4Dpkzmd0w4ndDyRjpisK+viMLbLp+Nx2jYcRk+CDtRGkBE8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=niLJCs3i; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU0OxB/Y3C8YYmRaRrZaxO7zZp5m4UAzj7EoBLgfHoQ9mBkhf+ll5dJGhPg5aArerBXPcpJRJ2zhqwFcQEQua7jXQLjINMA0/DrabnYInrj8DzDHxMqxrBBQ7gf5lJq0J4UPv2jMeLovCxDSHgOAVxSi7dyFsDtI+89H3o6xQE1ncy7N1wbu84S5pSTXmqUnkudgORYFIKUDDCV63bbLbs1tPnKghAfWQx5CzHXvn2Wi4890Wp4Nii2WxDCh5W555dAowpLivAp+/aEAAAOVwsfkrlCVJKL1PlegGa490CvT3VVtonR99z1EgETZLXwRi3L+ohdo3vjKv/xKTbopTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1/1FIGlmDHdlZmrhp4CjZ5eu7K51GlygC0tJVpaO6o=;
 b=XNOD3sS4fvlS580fCO615iHRY7NvQmjwSA+iRi4APpk4dx3lhk7gDILEd2BuJ7K+PfYbvHQd2hM9i8mKNW4Em6USoaCjUv3UnU3nolzP9wJPb8+4OENkn8zGECzkuoi6cKxLtYHlyc3gRgLZlX4tnxnAi3gZW2d049Pt2DbOAXm3BG93sUkO+zXQB38T1o+Fr2FZ0ht2wjz72XkLoyMfsupYwJV4fbdUTRLHmi5i/HOpBdABp5XdKRhB/GcfSa93NwXUC+DqZNS1Q9Wlr58nJDrJnRdCGYk73LcKI9Fm29BTgQckyDBsIAL4fEKEoqj1nAClyplzKJlFINHOfH653g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1/1FIGlmDHdlZmrhp4CjZ5eu7K51GlygC0tJVpaO6o=;
 b=niLJCs3iF6WIGpkprkxrgQqKp8Pa6zZQIm+4QXQpUpWGD75YeR1dWE9R6dkkgGjO4tER9+rmTt+AyiJ0yUWmnRtXE4ad/y7D6WcY++0F9tRbJ8Z4vBoga9nVf6WoRo9k7JOgRJVDbhd60ATg+rFs96O3DjmBzKLMjG9OGDIlpJE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB15436.jpnprd01.prod.outlook.com (2603:1096:604:3b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:10:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 09:10:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, magnus.damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Topic: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for
 RZ/G3L SoC
Thread-Index: AQHclPgnKnK+tkYa1Ua6JHvG2H9MT7WgNeCAgAAhRMCAAQuWgIAAASDw
Date: Fri, 6 Mar 2026 09:10:43 +0000
Message-ID:
 <TY3PR01MB113468A1F5D5BA474644D2BFF867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
 <TY3PR01MB11346EEC0D9D7391EEE7ED27C867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdV_WiB8graMNeJRVbNZczDetd+fA_4yxt5MV-h7Htzoeg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV_WiB8graMNeJRVbNZczDetd+fA_4yxt5MV-h7Htzoeg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB15436:EE_
x-ms-office365-filtering-correlation-id: 92421690-50f1-431e-d732-08de7b603ed0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 94LYP3fnpmibminCWg1NFZrKRZ0jCU9pNej7hcZT8kJLDLyNiiTClu7h51iCqIcBF/e9c2gxF2qkGFwgoL4SEAWAT1s/FtmQCTsqNrE/QTVd4WzaNer1pkmeakbaxXnWDWXW8a0F9fwdwD1xHnqj9jC+XnaTQSs7//GORtCBP3fFXT1/c9ucnE/mEH7Kv/Oc1gvZZJuwOT8OgQKdy/6zKedx5l5Sw+kRx7Kv7j2WF59pemQ4ZS76Xxtc4ktQ7W/Cv+5HBqVFc1Y4eHZ+kF42qXOp5kS7AHkcY6el0MjklTfVZZrxAgLEaYvOZ68TKEoS8axvlwXVRYiwwNsIrYSTV5WLVQwyxZ9m1VkgwFGd11tHPMmxjvTqJftnCJRRd8XMxzWCSq6F7IdqsTEfSylKX6OUMraeV+gXvPjEt2XZK9hd48jcna0GNU4QFV6So15su+17d9EQ3dJRbO6Jj8ZxgE/C9drHUWc+m1VskpO6qXi/aw8YcJEFPWgOq6oJl1Y32jvxJd8LMtt/9UflhHqmObZJ8ij/JhGey15F88XuV/PR3NA2Rn3nlWftfRFRcbZhqkqjigXE4fzaMD27gnVsSwi0Ozebprt+nlwYBchwKkRiKU/pHyCFEF5zcu9Ltlo4ha8w31KNDSG0zLu5sEna9Dc4XlbUqHc8xoyozFUx5R/vwjdzst3pz/o+1RCvFDO8UAuxJL7i7auGmwlpG196vJSbB/7hVVk1Xr3+uwQA0AfKzZWf2SFe3DTsU1GNwQtvsUSXhi4+51aEqhHp2QhxprzzscMatevclgzv1dvhxuY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Zllaai9scHhFdXR6V01XV2syTURKM1FBd0EwTTgwT283ejFkZTBteDVwMWRw?=
 =?utf-8?B?SXhzZHpsazl0RHZyZWZPZnJ1ekpSWGxtRVdKWC9qVFc5d3VHN3R3Ulk0c1NH?=
 =?utf-8?B?UEg0c2pvNEpZOVZ0UmdPc0xVZkl4UFRwcEEvU3FnaEZSQ0JNUDY0TFMvQUZj?=
 =?utf-8?B?bHh1MFREcHJBYWUyZnJkMVFVUFNmcmdwQk5scFJOV3V6VTUyUERQSkxPNzBN?=
 =?utf-8?B?cjRMblZKME1BRCsrM3gzanFjZ2oyRGdDOVhWNXdQclNEZU1JeFhHREliQzBM?=
 =?utf-8?B?UU40YWJzTml4OHpuSHBxOW5OU0xQQmlaSEdYZnpsMHJydVpIaHJUMmVLV2h6?=
 =?utf-8?B?c29SaGhkNXA4TGYzMGt1QVJDWSsrK1daVVAxSytSalhkYk80Snd6ampoVUFs?=
 =?utf-8?B?TU5MNHcxeHJtN3QzdDdqaHBMVTRodzRJNGVZU3dOR1RrZ2lzUStUUExZVE5h?=
 =?utf-8?B?K2Q0aStrS2JRZnFxck5pSExqR3N1WFdiT0pFY0dpS0RhaUFTVytuY0FBUHpw?=
 =?utf-8?B?ZHNLUnZVTmVrYis1bjZvaG1BeWlKV0RGTGdFayszVmx6ak1oOU04bEVDY0p0?=
 =?utf-8?B?bHdBU203NDUrRWFEQVJVdEVRaVJKTzdqWm5RNzhYS1N6bEtJQ3JNeWJKd3BH?=
 =?utf-8?B?djh6QzN6a0VrMmJrQWRCSDlVMTZpeGl6b2N6L1J6VEJ2RW8rd25qb2czcDVY?=
 =?utf-8?B?VHhiMkZ3ZlBCNko3d2JGL3V2VG83VHRrWkVmN28yR2JqZTRZS3VaOXdDbERB?=
 =?utf-8?B?NFJJZC80ekZ2Mm01VUkwcFFmaVZ4Y1M1RTdQR3pGMS9pWGFIRElEZ2szK2M1?=
 =?utf-8?B?UnF0YngyQTdvTmJZZ1ozckFldlUrQ2RicGpmdFBqenVhWEZ4MHMrSDlPTllC?=
 =?utf-8?B?WEhGeUl4czlMMTV2blhrTDQzQ2lSVWZmNE01aCt2cnVwejFlbnFodzEwNG16?=
 =?utf-8?B?ZFExUGZZUkRrRFNueHNNM1ZMWjhnVnFUdXZnQ3hqUi8wWGtsRDFzK1I5NHdY?=
 =?utf-8?B?RzVkeTErT0JMRHV6K2pUQmxHM29icFVGRzQwbDJEdCtzSWh6SmNSa0ZRL080?=
 =?utf-8?B?MWJwUHZuZGpwWWJpNG9yVzA0aWhuT3RFV2NDVytZSDgvUHJBRGRJQUVubURF?=
 =?utf-8?B?ZHRrVW5YV2xlc2hyUzd5QmNBaE45K1AxNndqUjQ5VTdPZllBVVpuZXdOalFE?=
 =?utf-8?B?VEE2bmRkMWtBUUlxdHpBNzBSVS9iRTJFalJxbm1oUllvNm5pZC9CL0RhWXM5?=
 =?utf-8?B?VVRGdCtQdFFxTjFOOE5QK0tOMkt4Si96bDNRRXdBNXkyMWw5amhqTnNITXp5?=
 =?utf-8?B?bjF5S0lpOTBCQ3h5UlEvNEpSTVBSRXpaRlNCZjd4TkZyOXZjUTNSbWl3R3pp?=
 =?utf-8?B?RmpxWlVSSklFN1FzdlhUWnB5M09xcTdTZjZTNmZOZy9VN3ZJbXR0WkpvREV0?=
 =?utf-8?B?eWhJbmFVb1d4TWlvVlRVekVRYmZsR2loZ0JyR3hSNzNobzhQRGZTN0x3Q1Zm?=
 =?utf-8?B?R0FGalkxY3JHOHpqeDdNQkN4emVHVDF3ZFBrMHVoWmtBOHVtRVllZ0UvaFVw?=
 =?utf-8?B?Y1hoSCtvVW1QN1c0Wk5UYjVhMVdmcnhmSDRUWXlMdGIwNllxTEIxY2ZDS0JC?=
 =?utf-8?B?VkJzcnZ6ZS85UDVVbk0vY2VFR1Rub0wwbXFSOVVwNmZFMkpFaFVKcHk5VkVJ?=
 =?utf-8?B?Z1I4eTZUd2pFbVJyc0FZS3JkeXFtUlF4UHpHaEFVMHJmRitzT0JyZ3VSK2hR?=
 =?utf-8?B?SjQ2U2pjNlkxYTB4SU5TS0k4SVVmc1ZqTzZHbGxBaE05RW9TbEs0NGgzSnBP?=
 =?utf-8?B?U1IyeEk4Ykk2aUNpRTJwc2xBOUxTNy93RlVTeENxejkxZ2p2TTFaTXFJVVlQ?=
 =?utf-8?B?WElXa2s3LzBzR09hODFxZEtoNUdBZDYxMFIxbjVJY1o3clJFdXdMcDY0NFY3?=
 =?utf-8?B?eVdxK0Q3RmF3QkFpcnpKS1drZ0hqWDdoT0NCK3p5NE1JYVJqUmNIYVZETlNu?=
 =?utf-8?B?ZHFROTBpQWkrbXNWSHEwcEZyNzdTdXRBNVhHcURONGQvZm9Nd1c4Z01tY3NV?=
 =?utf-8?B?ZURtRlU1S0g0dXBtblZUQVJCSUJteG5CVHFYL3JZZjRseld3VzNQOWRaOU5a?=
 =?utf-8?B?MHpIRzdjNU44UnUzSVhSc1BseXN3UzhURlBlbkIzQlNFNlppSjJzK2RwSlF2?=
 =?utf-8?B?aTZZUG80V1Y3QTlnbjB6bVpMdS8rVXJTWm0xWXhJSno1NG9DUS9jdjNLWGh0?=
 =?utf-8?B?WE9PYWVzeWtQRTBtckdOUUYrUFFTMFIvbTJscWtKd1hPUGVTTkdOV05hVFVy?=
 =?utf-8?B?TWJ5bktOMVF0YXQ2Z3NuNzdJWjlRWFJFL2dud2NOSDNtckZkRjh2UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 92421690-50f1-431e-d732-08de7b603ed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 09:10:43.3533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffRpFXsgo6nsC9oqjXMYXium1UcGPnSUzxwNBbSnJCj1Mf0zTSCTJRsTG81EHFSl/nyPVFLQBS8jW2KOU4UGBGBCQXT2pMf0jSRynZcwZ3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15436
X-Rspamd-Queue-Id: BCCFD21DA76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28918-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,0.180.91.224:email,bp.renesas.com:dkim]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMDYgTWFyY2ggMjAyNiAwODo1MQ0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYzIDA3LzEwXSBhcm02NDogZHRzOiByZW5lc2FzOiBBZGQgaW5pdGlhbCBEVFNJIGZvciBSWi9H
M0wgU29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCA1IE1hciAyMDI2IGF0IDE3OjU4
LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJv
bTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gVHVlLCAzIEZl
YiAyMDI2DQo+ID4gPiBhdCAxMTozMCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90
ZToNCj4gPiA+ID4gQWRkIHRoZSBpbml0aWFsIERUU0kgZm9yIHRoZSBSWi9HM0wgU29DLg0KPiA+
ID4gPiBUaGUgZmlsZXMgaW4gdGhpcyBjb21taXQgaGF2ZSB0aGUgZm9sbG93aW5nIG1lYW5pbmc6
DQo+ID4gPiA+ICAgLSByOWEwOGcwNDYuZHRzaTogICAgUlovRzNMIGZhbWlseSBTb0MgY29tbW9u
IHBhcnRzDQo+ID4gPiA+ICAgLSByOWEwOGcwNDZsNDguZHRzaTogUlovRzNMIFIwQTA4RzA0Nkx7
NDYsNDh9IFNvQyBzcGVjaWZpYyBwYXJ0cw0KPiA+ID4gPg0KPiA+ID4gPiBBZGRlZCBwbGFjZSBo
b2xkZXJzIHRvIHJldXNlIHRoZSBjb2RlIGZvciBSZW5lc2FzIFNNQVJDIElJIGNhcnJpZXINCj4g
PiA+ID4gYm9hcmQuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4g
PiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Ni5kdHNpDQo+
ID0NCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGRtYWM6IGRtYS1jb250cm9sbGVyQDExODIwMDAw
IHsNCj4gPiA+DQo+ID4gPiBVbnVzZWQuIFN1cmVseSB5b3UgY2FuIHdpcmUgdXAgc2NpZjA/DQo+
ID4NCj4gPiBZZXMsIGJ1dCBJIGRvbid0IGdldCBsb2dpbiBwcm9tcHQsIGFzIFNDSUYwIGludGVy
cnVwdHMgaGF2ZSBkZXBlbmRlbmN5DQo+ID4gb24gRE1BIHJlc2V0L2Nsb2NrcyB0byByb3V0ZSB0
aGUgaW50ZXJydXB0cyB0byBDUFUuDQo+IA0KPiBBaGEgOy0pDQo+IA0KPiBTbyB5b3UgbmVlZCB0
byBlbmFibGUgdGhlIERNQSBjbG9jayBhbmQgZGVhc3NlcnQgdGhlIERNQSByZXNldCBpbiB0aGUg
Y2xvY2svcmVzZXQgZHJpdmVyLCBhbmQgbWFyaw0KPiB0aGVtIGNyaXRpY2FsLg0KDQpGb3IgQ0xL
LCBhbHJlYWR5IGZyYW1ld29yayBpcyBwcm92aWRpbmcgY3JpdGljYWwgY2xvY2sgc3VwcG9ydCwg
d2hpY2ggdHVybnMgb24gdGhlIGNsayBhdCB0aGUgc3RhcnQuDQpCdXQgZm9yIHJlc2V0IHRoZXJl
IGlzIG5vIHN1cHBvcnQgZm9yIGNyaXRpY2FsIHJlc2V0IGluIHRoZSByZXNldCBmcmFtZXdvcmsu
DQoNCnlvdSBtZWFuIGhhbmRsZSB0aGlzIGluIFNvQyBzcGVjaWZpYyBkcml2ZXIgZm9yIERNQSBk
ZWFzc2VydCBsaWtlWzFdDQpERUZfUlNUX0lOSVRfREVBU1NFUlRFRCBkdXJpbmcgYm9vdD8/DQoN
Ck9yDQoNCkNyZWF0ZSBhIGNyaXRpY2FsIHJlc2V0IHRhYmxlIGluIHRoZSBTb0Mgc3BlY2lmaWMg
ZHJpdmVyIGxpa2UgY2xrDQphbmQgZXhwbGljaXRseSBkZWFzc2VydCB0aGUgcmVzZXRzIGluIENQ
RyBjb3JlIGRyaXZlciBkdXJpbmcgcHJvYmU/Pw0KDQoNCk5vdGU6DQpGb3IgU3VzcGVuZCB0byBS
QU0sIG1hcmtpbmcgY3JpdGljYWwgY2xvY2svY3JpdGljYWwgcmVzZXQgd29uJ3Qgc29sdmUgdGhl
IGlzc3VlDQphcyB3ZSBuZWVkIHRvIGV4cGxpY2l0bHkgdHVybiBvbiBETUEgQ0xLL2Rlc3NlcnQg
cmVzZXQgZm9yIHJvdXRpbmcgU0NJRjAgaXJxIHRvIENQVS4NCg0KWzFdDQpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yZW5lc2FzLXNvYy8yMDI2MDIxMDExMzA0MS4xMzg0MzAtNC1qb2hu
Lm1hZGlldS54YUBicC5yZW5lc2FzLmNvbS8NCg0KDQpDaGVlcnMsDQpCaWp1DQoNCg==


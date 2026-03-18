Return-Path: <linux-renesas-soc+bounces-29806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WClbKBflummdcwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:47:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0252A2C08E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 18:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82AC63363921
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 17:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3502233EB10;
	Wed, 18 Mar 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PEAkgVUT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C6285CB6;
	Wed, 18 Mar 2026 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853602; cv=fail; b=mt7bdeX3GW1LjFEqizYn8UmoJW209MICRVlPMpN4PiFZYAty02yksOA7VEfxZ8jD3MiTMZuyDXwu0t9mQTsmkpnC7bUuC6v1iyBTcxPsceeGaDRU9hTLR+4nETPSk6TAPfF/fa7YB2Zwziz9Kzo4vWe+VLqKX6uLyHEXPFf4tIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853602; c=relaxed/simple;
	bh=esB9awtG9NNWFkLt07g4mCdpBMGr37glj9VAJDoisTw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P/heSxlGNfObvE8M7S1ufXGw573FHdbj1pYU8eimezW7WgB8DMQUMQ063BWMZ2qqkEHLVWbRKGPWIxJu7FW1SQBTsbWMStuHatC4f9OqjL0WQbKN0ymuPBNTPpwZtvzyUcIn3Hk5/EFG0piq28512sio0EMAWSkQt9lZM4OiS4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PEAkgVUT; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McMms/lGYFjEURfAXxh2io0jFaBVvGR2d88T184FMUeGuNzAlPMzOF3KvuMMAqQgoE3j8Z5hNK5jpklccQcvD3sAWChifAE9y/IE/eajPkhocPNoykCouSWGZEqpH6I9yOaHTcRq8XfQIsNpP87bvtxGbgEm9jDl9SRFkHsRmQcL+kbOlIqjlBdNm1LeKf27M0xM9J52rAdtamRct41wg4c5UMres0FK+CUluFzHIdC67bkmgMdQ7T8YnT4eq3AsybMGF1s2I2DU4FjtYBc+9kXib//jAraOTvuD4UMtEpOVfUqopw9Rjy2bfm9JoOZCcSFgdGTvf8wz0PSqeJoNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esB9awtG9NNWFkLt07g4mCdpBMGr37glj9VAJDoisTw=;
 b=UT1dCEMKEWfL4fAMHBHRXMIH+hJ5x5f97OIKYfPHkfKKzpGsPNN8uNvIc63xN/UNph+Hq1qkvJ56iecGNBn7a1bTmSHjXZtIOMwJys1Lt9ozuI1QfqXKEBB5kJPOmewLsOXHsebfaLJPZTcXnW/dgU5nuCGdM1jf19pWZRZvEoNSNN3zAFYmxvpKf4Kis9QkJL9wxfQSoYtvuFxz8hCRMojJspuPdoiBG+3XwQn+Uld7fGCe8lOJBZvqbvoffvoQ35L+krUqNSpLerHZcd2JOBw1hWFf0mwn6g/8wirjAkeSjTDWx+pj2I09poHhnzitXgVneLQDVIa4L2ynFzPS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esB9awtG9NNWFkLt07g4mCdpBMGr37glj9VAJDoisTw=;
 b=PEAkgVUTwmuU3KL3JggnCp85sf5dN93WXJU3GlDINrObOnIZJuELh+x8uzfJld06PW5g9hlVEjaO/XSoiWwoZm5ysSyxd7L1+GvyIGd7H0m7eTKMW+48eRpEy13/mFSoVQ0U1UWM2poHihqUwN86OFO5mwNyWkxi0oDClBDHeLg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14538.jpnprd01.prod.outlook.com (2603:1096:405:239::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:06:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 17:06:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module
 clocks during resume
Thread-Topic: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
Thread-Index: AQHctrMYtlGbS36aJ0+606OUdEOA3bW0YOUAgAADf4CAACCOoA==
Date: Wed, 18 Mar 2026 17:06:38 +0000
Message-ID:
 <TY3PR01MB113462B4D62B13F22516EBDED864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
 <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14538:EE_
x-ms-office365-filtering-correlation-id: ecc4ea27-40e0-4773-8249-08de8510b7b0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 eHGkWYjAEQ/E/blEX/E8kkiwhhUb0aPWuDBOR4qJkskyEuaSsqutZajeu5RqgeDd3Zj+eLwZxc0RChlfUsNqGDbOLtLXwqdTHbowq0UrT73Cd4LTeRAskU8v47Xt0BjX9LNEu2+Ifx1aGnO+q0OWqcaOv4+UdFuMbh90fnbv55AXfK/MTawMs33B6f69YJZeQu4lxeBXFbk1hf+ujRMWuP1VyHaZZzJrohmI3gh3sdEXiXjp4i+qbiXlQ3C/I62r657jURiD46nO1WexZAGZh/nZWuxGM0eTp77aeyC9BS+qohHuflnLLkVIi95vvNDoL1Nf+KY33EG3l0yrqNw2t1lA3uzfnLHnDDHMv64fs/5jBLCgcuUV9ndBcoHLhonj5yEsGv480ZF9reDlfzy9p6/vX0nFdqcqh9tU7qWgWKuAB7xVfVRbxgQUIhclXoExxGP9bjKDEbw8CWx38EYxX0SunoAWYRr6QUiksuNoEL7RGrm2qTpRdcbrZn1keqxRnPvGE2DbnLXds2/79zeBgpvzJWVVaufisbCIkCcABOAAkW2OWsgG9u+6INJcGFrxRStC6azwB9F5gXQzEJBzAxPJM9gu+ti6H7UhfQ4SNSaFsa1DbCfqtQOCS0hnE0e/TyH7LBvBEw1TTc1I5EQhbMDAiup1fsFIQMbwpGtjhTTQF8mrWpSFWkwzvKZhq46lz2cprBrF660WtlxCDQH0+tvGYlp9PfPDK3pHcxGfuUHyIOTZ32qGTez59OL/YbUhF6I0Ebc+bneOQg86vTbULAOyPWz+lYmqnyaryM9UFF0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlUxb29EeUdpUXQ1cklFZ0lsa2xPZ2MvT1J3VDNwR3RqekxhVGlvb0F5UVJM?=
 =?utf-8?B?MFkxdWk1d0c0K2NJUXMxVEQ4ejFPTzJISERueUJ5cTRKQTFnSyttVXFZSUFt?=
 =?utf-8?B?dXgwYnRWWGwyQkgrcTFubXF3elVta0FYSU1uMFdidDl2VHNuVm5iT1BvK2xx?=
 =?utf-8?B?azhVYWZDclVyMlFEbHdEVHhQWjUvWVVXTWJlc0Y3Z1c1M25mL05uUkQvdHVn?=
 =?utf-8?B?SldtT1VCSUd0WXhmaml4R0Mrb0ZlTXZhcDlubGF3U3J5VkJSVWI2a1ZBcGU3?=
 =?utf-8?B?SjVZRk1OMkFrbmVzRVRVdHAxNjVSMGsrMDdlSzZjZVMybHhKeTY0bllqTjBa?=
 =?utf-8?B?UTFacEFHczNtcVhNcVNLUDJQRDI0NlA3NEc5R2dtOVF5UUkrT3lkWEI0aGda?=
 =?utf-8?B?VE1jSU13WUJXNjRJYUQ1UFRkU3V2d2tuc2lud3ZtV2MxdGZ4SWVTb1loWGF0?=
 =?utf-8?B?VEkwR0JNS1EyUng0NmRyMmdValcyVlJzUk82WlJ3VHpsM3JyTWhRM21UeXNJ?=
 =?utf-8?B?NHAvL3FFSzFuNmUzWmF4V21FWlhOa0NQNE56dUhUMnJPZW1MN2lWdGNJUVR3?=
 =?utf-8?B?RE1hQUZXSEZ5b2p3MVdLL3VEdWRtcnlNL0d4RlNQN1U0ejNDZDIxa1NVcTJ0?=
 =?utf-8?B?dWlGSG9QdHc4ZFhnV3FRZlo4cGZKeERlMkpvNXZNQkd4d0lXRGtmMUdOWEZy?=
 =?utf-8?B?bUZreXhBQzBZVkE0QjVMRVRSVU1QTy81NGxTWkE5Q0dmaHhpcVBBZ0ZOTjlK?=
 =?utf-8?B?ZXdHVldTM1pOTGUzd2toZjNxQTVNckx5Y0UwOHZleXphdDBDaDhrZUlBWHpo?=
 =?utf-8?B?cTVqU1FsL2pheW44dzQwUitjYjhNV3gyOVdtWEpLSk8wTWdPeW1Nelk0WCt5?=
 =?utf-8?B?NGR5M1c2a3AxWDRpd2FRbEFhcEhOSnZ6bm9rT1l2WWU1aUdKYldoUzFLQnNK?=
 =?utf-8?B?dEw3NS9EeWt1emxQdmxuV2lDOURkYVZsVDdsQnFnQmRIRkVCdk5pWWt1SzBB?=
 =?utf-8?B?bFhjU21VUUl5YUNBUkZ4L3BvSUJyNUloUnlKZ1lSVFk3ZUZxMGIwU2w5djV6?=
 =?utf-8?B?TXM5elN3L0paWFpZZER4WElGODBNZ3dzTUpQeUY0NGpEVWtPdWhzclpMNzNS?=
 =?utf-8?B?R08xcWV3aGhjTHFETzJ3OFIrdSt2bDFmb2RseFYvdlFKVEpZRlVnRWM2QnFl?=
 =?utf-8?B?ck0zTVFMS1cvSG1ERG5EbnJqVkZrSEk2ckZVWHdlMnpNejR4NkNqeFpMT29Z?=
 =?utf-8?B?U1NXTEVRSDJrSW85TlVVK1JyaTAvZ2tUYTIrRzdwZUNMRUZEa1lBczFhb1pY?=
 =?utf-8?B?aThzY0wvVVdRWW05RUVQQ29QWjIyRGFkaThQZWJGU0xrU3pQTUhMbDUyR0N2?=
 =?utf-8?B?d2J3VXY0eUZnWmpQUi9OOFZRRDVIYTA4VGlqWTVGSXhPUy90ZUtWeUdSbGdY?=
 =?utf-8?B?TVJoaVRGcjA3emU3Z1VVa2RiUis5aGwrT2krQVhZN3ZSNUROV00wcVBudWpJ?=
 =?utf-8?B?ZENJMEpIYnNxUnVUeWRqUzRoZXVhUjhBd2tndnZ4cGlwSjVKSHA2SFByUThj?=
 =?utf-8?B?OTBMbDRaMm5MbFRFc3pDeGpacU1tWHd1cEJJcGdiMDhnN2FwN0M1SmVOdXl5?=
 =?utf-8?B?cFFFRVJ3ZTBDM1lxeHNsR3h6bnJxY1Rscmx0RUxOMDZ0amlYUFc5UWJpWk1o?=
 =?utf-8?B?am0waVNVcGNqYjROejczNWpSZGNBamg3WDR4VisvSjNUK3VzZXBla2hSMDJ2?=
 =?utf-8?B?aTlLQWdObjgvaU9aZWlOMTY0ZlhCdWhBZkdFUkgwV2g3eHpna1pFN2lrWk5I?=
 =?utf-8?B?RjJrUmdvSWdiR0RmZ3N6a1VsS0ovSFhNbitrV2FZU29kUUh3aktiU0tyWS83?=
 =?utf-8?B?ZU51ekZhZnRmTUNaN3RuUWRVZEQwMjRQUUdaclg3V0JHRlhoVjRnZzdEUVcw?=
 =?utf-8?B?eC9RMm41UDVtSTNSQTBrWTVjbC9xZEJqakpYVUMzS3JrdEl4MnpReVVqQTJp?=
 =?utf-8?B?SGNuWW1EdCtmRG5RN2JJQVlXL203bjFsVWNZWEltVjBaNjR6cGR1ZlJvM1k0?=
 =?utf-8?B?NWp2dEZEelpQM01tSkI5Tm9LMzF4MitoNkpwclUrWnRXeDQzYjZRNE1FaVQr?=
 =?utf-8?B?MXNvN1djN3BDYjVvMHM3TlgyVDdOTjB3SDRnRWZwWWRxWC9nd3ZBOElVY3NM?=
 =?utf-8?B?YUFneERLREU0L09PQVRIMExqSmNiVURaV2swZDJkemI1TDlGcU8xOFRZRys3?=
 =?utf-8?B?RzZtZm5UZ1VRRnI3T0FjWmgrVGVLK211UEpXTGxlRXU5YlM3bFZidEh0aVRJ?=
 =?utf-8?B?bGtuVGdVVHhIbGFsSVFGN0tvcld5UXJ4WDdDaFBXQ1k1QjE4UUc2dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc4ea27-40e0-4773-8249-08de8510b7b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 17:06:38.0570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HBS2o8d3fBea5+7LyPlcgltQykayZ/5d4abl+0I2ucCLAClnAm9j6sdC+Ybote9sJyG8wsR9om2hOTXaUB4Y0Z3yUNHus/3de7qG9GLYXjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14538
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29806-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.965];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 0252A2C08E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE4IE1hcmNoIDIwMjYgMTU6MDcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSA0LzldIGNsazogcmVuZXNhczogcnpnMmwtY3BnOiBSZS1lbmFibGUgY3JpdGljYWwgbW9k
dWxlIGNsb2NrcyBkdXJpbmcgcmVzdW1lDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCAx
OCBNYXIgMjAyNiBhdCAxNTo1NCwgR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4gd3JvdGU6DQo+ID4gT24gV2VkLCAxOCBNYXIgMjAyNiBhdCAwOTo0MiwgQmlqdSA8Ymlq
dS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBBZnRlciBhIHN1c3BlbmQvcmVzdW1l
IGN5Y2xlLCBjcml0aWNhbCBtb2R1bGUgY2xvY2tzIG1heSBiZSBsZWZ0DQo+ID4gPiBkaXNhYmxl
ZCBhcyB0aGUgaGFyZHdhcmUgc3RhdGUgaXMgbm90IGF1dG9tYXRpY2FsbHkgcmVzdG9yZWQuIFVu
bGlrZQ0KPiA+ID4gcmVndWxhciBjbG9ja3Mgd2hpY2ggYXJlIHJlLWVuYWJsZWQgYnkgdGhlaXIg
cmVzcGVjdGl2ZSBkcml2ZXJzLA0KPiA+ID4gY3JpdGljYWwgY2xvY2tzDQo+ID4gPiAoQ0xLX0lT
X0NSSVRJQ0FMKSBoYXZlIG5vIG93bmluZyBkcml2ZXIgdG8gcmVzdG9yZSB0aGVtLCBzbyB0aGUg
Q1BHDQo+ID4gPiBkcml2ZXIgbXVzdCB0YWtlIHJlc3BvbnNpYmlsaXR5IGZvciByZS1lbmFibGlu
ZyB0aGVtIG9uIHJlc3VtZS4NCj4gPiA+DQo+ID4gPiBJbnRyb2R1Y2Ugc3RydWN0IHJ6ZzJsX2Ny
aXRfY2xrX2h3IHRvIHRyYWNrIGNyaXRpY2FsIG1vZHVsZSBjbG9jaw0KPiA+ID4gaGFyZHdhcmUg
ZW50cmllcyBpbiBhIHNpbmdseS1saW5rZWQgbGlzdCBhbmNob3JlZCBhdA0KPiA+ID4gY3JpdF9j
bGtfaHdfaGVhZCBpbiByemcybF9jcGdfcHJpdi4gUG9wdWxhdGUgdGhlIGxpc3QgZHVyaW5nIG1v
ZHVsZQ0KPiA+ID4gY2xvY2sgcmVnaXN0cmF0aW9uIGJ5IGNoZWNraW5nIGZvciB0aGUgQ0xLX0lT
X0NSSVRJQ0FMIGZsYWcgYWZ0ZXIgY2xrX2h3X3JlZ2lzdGVyKCkgc3VjY2VlZHMuDQo+ID4gPg0K
PiA+ID4gT24gcmVzdW1lLCB3YWxrIHRoZSBsaXN0IGFuZCByZS1lbmFibGUgYW55IGNyaXRpY2Fs
IG1vZHVsZSBjbG9jaw0KPiA+ID4gdGhhdCBpcyBmb3VuZCB0byBiZSBkaXNhYmxlZCwgYmVmb3Jl
IGRlYXNzZXJ0aW5nIGNyaXRpY2FsIHJlc2V0cywNCj4gPiA+IGVuc3VyaW5nIHRoZSBjb3JyZWN0
IGNsb2NrLWJlZm9yZS1yZXNldCByZXN0b3JlIG9yZGVyaW5nLg0KPiA+ID4NCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+
IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPg0KPiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVu
ZXNhcy9yemcybC1jcGcuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1j
cGcuYw0KPiA+ID4gQEAgLTEzMCw2ICsxMzAsMTIgQEAgc3RydWN0IGRpdl9od19kYXRhIHsNCj4g
PiA+ICAgICAgICAgdTMyIHdpZHRoOw0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4gKy8qIENyaXRp
Y2FsIGNsayBsaXN0ICAqLw0KPiA+ID4gK3N0cnVjdCByemcybF9jcml0X2Nsa19odyB7DQo+ID4g
PiArICAgICAgIHN0cnVjdCBjbGtfaHcgKmh3Ow0KPiA+ID4gKyAgICAgICBzdHJ1Y3QgcnpnMmxf
Y3JpdF9jbGtfaHcgKm5leHQ7IH07DQo+ID4gPiArDQo+ID4gPiAgI2RlZmluZSB0b19kaXZfaHdf
ZGF0YShfaHcpICAgIGNvbnRhaW5lcl9vZihfaHcsIHN0cnVjdCBkaXZfaHdfZGF0YSwgaHdfZGF0
YSkNCj4gPiA+DQo+ID4gPiAgc3RydWN0IHJ6ZzJsX3BsbDVfcGFyYW0gew0KPiA+ID4gQEAgLTE2
OCw2ICsxNzQsNyBAQCBzdHJ1Y3QgcnpnMmxfcGxsNV9tdXhfZHNpX2Rpdl9wYXJhbSB7DQo+ID4g
PiAgICogQGluZm86IFBvaW50ZXIgdG8gcGxhdGZvcm0gZGF0YQ0KPiA+ID4gICAqIEBnZW5wZDog
UE0gZG9tYWluDQo+ID4gPiAgICogQG11eF9kc2lfZGl2X3BhcmFtczogcGxsNSBtdXggYW5kIGRz
aSBkaXYgcGFyYW1ldGVycw0KPiA+ID4gKyAqIEBjcml0X2Nsa19od19oZWFkOiBIZWFkIG9mIHRo
ZSBsaW5rZWQgbGlzdCBjcml0aWNhbCBjbGsgZW50cmllcw0KPiA+ID4gICAqLw0KPiA+ID4gIHN0
cnVjdCByemcybF9jcGdfcHJpdiB7DQo+ID4gPiAgICAgICAgIHN0cnVjdCByZXNldF9jb250cm9s
bGVyX2RldiByY2RldjsgQEAgLTE4Niw4ICsxOTMsMjYgQEANCj4gPiA+IHN0cnVjdCByemcybF9j
cGdfcHJpdiB7DQo+ID4gPiAgICAgICAgIHN0cnVjdCBnZW5lcmljX3BtX2RvbWFpbiBnZW5wZDsN
Cj4gPiA+DQo+ID4gPiAgICAgICAgIHN0cnVjdCByemcybF9wbGw1X211eF9kc2lfZGl2X3BhcmFt
IG11eF9kc2lfZGl2X3BhcmFtczsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJs
X2NyaXRfY2xrX2h3ICpjcml0X2Nsa19od19oZWFkOw0KPiA+ID4gIH07DQo+ID4gPg0KPiA+ID4g
K3N0YXRpYyBpbnQgcnpnMmxfY3BnX2FkZF9jcml0X2Nsa19od19lbnRyeShzdHJ1Y3QgcnpnMmxf
Y3BnX3ByaXYgKnByaXYsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGNsa19odyAqaHcpIHsNCj4gPiA+ICsgICAgICAgc3RydWN0IHJ6ZzJs
X2NyaXRfY2xrX2h3ICpub2RlOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBub2RlID0gZGV2bV9r
emFsbG9jKHByaXYtPmRldiwgc2l6ZW9mKCpub2RlKSwgR0ZQX0tFUk5FTCk7DQo+ID4NCj4gPiBU
aGlzIGVuZHMgdXAgYWxsb2NhdGluZyBxdWl0ZSBzb21lIG1lbW9yeSB0byBzdG9yZSBqdXN0IGEg
c2luZ2xlDQo+ID4gY2xrX2h3IHBvaW50ZXIuICAgQWx0ZXJuYXRpdmVseSwgeW91IGNvdWxkIHVz
ZSBhbiBhcnJheSBhbmQgc2l6ZSwNCj4gPiBhbmQgZ3JvdyB0aGF0IHVzaW5nIGRldm1fa3JlYWxs
b2MoKS4NCj4gDQo+IFVwb24gc2Vjb25kIHRob3VnaHQsIHlvdSBhbHJlYWR5IGtub3cgaG93IG1h
bnkgdGhlcmUgYXJlIHVwZnJvbnQsIHRoYW5rcyB0bw0KPiByemcybF9jcGdfaW5mby5udW1fY3Jp
dF9tb2RfY2xrcz8gWW91IGV2ZW4gYWxyZWFkeSBoYXZlIGFuIGFycmF5IChidXQgaXQncyBfX2lu
aXRjb25zdCkuDQo+IA0KPiA+IEFub3RoZXIgYWx0ZXJuYXRpdmUgd291bGQgYmUgc2F2aW5nIGFu
ZCByZXN0b3JpbmcgYWxsIGNsb2NrcyBkdXJpbmcNCj4gPiBzdXNwZW5kL3Jlc3VtZSwgbGlrZSBy
ZW5lc2FzLWNwZy1tc3NyLmMgZG9lcy4NCj4gDQo+IEFub3RoZXIgYWx0ZXJuYXRpdmU6IHJ6ZzJs
X21vZF9jbG9ja19pbml0X21zdG9wKCkgYWxyZWFkeSBpdGVyYXRlcyBvdmVyIGFsbCBtb2R1bGUg
Y2xvY2tzIGR1cmluZw0KPiByZXN1bWUsIHNvIGl0IGNvdWxkIGJlIG1vZGlmaWVkIHRvIGFsc28g
Zm9yY2UtZW5hYmxlIGFsbCBjcml0aWNhbCBtb2R1bGUgY2xvY2tzLg0KDQpMb29rcyB0aGlzIGlz
IHNpbXBsZS4gSSB3aWxsIHNlbmQgbmV4dCB2ZXJzaW9uIGJhc2VkIG9uIHRoaXMNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMgYi9kcml2ZXJzL2Nsay9yZW5l
c2FzL3J6ZzJsLWNwZy5jDQppbmRleCBmOWU0YWY3ZjQ5ZDAuLmVlYWZiZmUzYzcyNSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCisrKyBiL2RyaXZlcnMvY2xr
L3JlbmVzYXMvcnpnMmwtY3BnLmMNCkBAIC0xNjAxLDggKzE2MDEsMTEgQEAgc3RhdGljIHZvaWQg
cnpnMmxfbW9kX2Nsb2NrX2luaXRfbXN0b3Aoc3RydWN0IHJ6ZzJsX2NwZ19wcml2ICpwcml2KQ0K
IAkJICogbW9kdWxlIGlzIGluIGludmFsaWQgSFcgc3RhdGUuDQogCQkgKi8NCiAJCXNjb3BlZF9n
dWFyZChzcGlubG9ja19pcnFzYXZlLCAmcHJpdi0+cm13X2xvY2spIHsNCi0JCQlpZiAoIXJ6ZzJs
X21vZF9jbG9ja19pc19lbmFibGVkKCZjbGstPmh3KSkNCisJCQlpZiAoIXJ6ZzJsX21vZF9jbG9j
a19pc19lbmFibGVkKCZjbGstPmh3KSkgew0KKwkJCQlpZiAoY2xrX2h3X2dldF9mbGFncygmY2xr
LT5odykgJiBDTEtfSVNfQ1JJVElDQUwpDQorCQkJCQlyemcybF9tb2RfY2xvY2tfZW5kaXNhYmxl
KCZjbGstPmh3LCB0cnVlKTsNCiAJCQkJcnpnMmxfbW9kX2Nsb2NrX21vZHVsZV9zZXRfc3RhdGUo
Y2xrLCB0cnVlKTsNCisJCQl9DQogCQl9DQogCX0NCiB9DQoNCkNoZWVycywNCkJpanUNCg==


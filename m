Return-Path: <linux-renesas-soc+bounces-31217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LQeTF/IC3GlhLAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 22:39:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3A3E5E5F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 22:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A5C630056F2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 20:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33E63559F2;
	Sun, 12 Apr 2026 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="Dfi3Irgz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9942D8793;
	Sun, 12 Apr 2026 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776026350; cv=fail; b=QcHFLlcPKR/aKnw5Xg5epSy0NNdY8l82SDjtQheBCcrr3R5tRbpA4CXMjVvm4JDfx7bDte7JjYy4553SbCIHyRDZiX3WFmBJNN59pQE03Vz2HFVAaU7nCf0zRCW65bNdJf+epShHzDcr6cCEe9TWtDtWFzkKC0MToMNVRnQ4Y3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776026350; c=relaxed/simple;
	bh=wXlU6MA84Y4IaG52o0YzqOoEQg9luHp9Qigf3dgifYs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tUvuEZzlHp8jfJonXlZc8pg0NPHHSURKXKmV/92ey4iQbg1l5Jl1QYbGWujF7KVhwzXRCtOD+YTaVke5tAigLbtPGf1CzZxvazbDgf4/mRHY371tgDKkrfeo3dMRF7kFi0GKH4V/lqRjYeSFGmHXBGkCGkA6rbeG3Jy7HPUhktY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=Dfi3Irgz; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CKUAZu1754555;
	Sun, 12 Apr 2026 13:38:39 -0700
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020078.outbound.protection.outlook.com [52.101.85.78])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4dfntf1rcm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 12 Apr 2026 13:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUNno+cf//SyeV/dL1jJH3lLem6hguXt0vYlwvcwxN6GjEKKjKP9JJSIJe04HhNzkbHEmqmpo1UwPHxPy7oYjviJqml87DER+BpGiuSevgSuoFUQwWdQ7Gibe2vecnLr0FvG6qm3WbQr2fbEh+Ksm5GDEl7QgfPxHMovSQnfBOrK3uAYV324My45RyJh4lOXrJ4oDj2jBjoQkAvq6qHjwAUB6CR+DOmbyBE/edH+RbUAU/gBE0FNgMAsEM5GTMXv73WGOAg7f0kIPSSXnzIH1gkF1b9RVBagzCGbDCXoYYu4fkvAC2UYtxtCQJ0+7wUDgV9ArcmeGHEVXBeZmoi0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXlU6MA84Y4IaG52o0YzqOoEQg9luHp9Qigf3dgifYs=;
 b=WOOy8Ys2+YUvNKp7/l6AAbZcnDs6VeAjgLGqSgUHJ2cXHGftQdqZJZqOklR+r4WmtOfaiYqJMG9uBI10jmSk6PZ5bP6Yyco0I3PR+9ehglGejdNj90q3lKwGxjYa4yIlI4dA33N55RDg7ZCeNuW1BicRsuWYLnTOn6wfy4aAgzGyoPPDTHbEqMYzbLzJfEfS8UIo3SkNW1DfJb7TzrUy4QI05XGF+SgE9fqqm93oe4eG8gDzatwJX9yoxM3PL4y473xzPsP1XUGauVhchZSQgKXnHAt/G51x3Eb3CtufaZZPQ3qJHB92YXGxOpC1KanvRmtWgaBJQ1VMmoX+kvMl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXlU6MA84Y4IaG52o0YzqOoEQg9luHp9Qigf3dgifYs=;
 b=Dfi3IrgzbMN5HCLkfZFoe1Ui8c5pyPrIPIStxMKJJYtJpG1vot8EjC5JUHJzPm5CFTnIV64H6ibUCHvaG9ASDZhNAWsgsSfRij1EbbB66XjPML4oqoCNooh+Jwa70ue3mET69KMmjLDZkLyDuwWeaTl5kmu+1IiCt0ueq9IOtvs=
Received: from BYAPR18MB3735.namprd18.prod.outlook.com (2603:10b6:a02:ca::16)
 by SA1PR18MB4712.namprd18.prod.outlook.com (2603:10b6:806:1db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Sun, 12 Apr
 2026 20:38:35 +0000
Received: from BYAPR18MB3735.namprd18.prod.outlook.com
 ([fe80::448e:bd83:47c:f8b3]) by BYAPR18MB3735.namprd18.prod.outlook.com
 ([fe80::448e:bd83:47c:f8b3%4]) with mapi id 15.20.9769.046; Sun, 12 Apr 2026
 20:38:35 +0000
From: Sai Krishna Gajula <saikrishnag@marvell.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
	<niklas.soderlund+renesas@ragnatech.se>,
        Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo
 Abeni <pabeni@redhat.com>,
        Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven
	<geert@linux-m68k.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net] net: ethernet: ravb: Do not check URAM suspension
 when WoL is active
Thread-Topic: [PATCH net] net: ethernet: ravb: Do not check URAM suspension
 when WoL is active
Thread-Index: AQHcyrxVprPJcRWM/0aYlvTBOvHW/w==
Date: Sun, 12 Apr 2026 20:38:34 +0000
Message-ID:
 <BYAPR18MB3735B83C5015BC4BCEAAF18BA0272@BYAPR18MB3735.namprd18.prod.outlook.com>
References: <20260412173213.3179426-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260412173213.3179426-1-niklas.soderlund+renesas@ragnatech.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR18MB3735:EE_|SA1PR18MB4712:EE_
x-ms-office365-filtering-correlation-id: deb51ed0-f6c8-4cb1-ffad-08de98d377e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 duqcit5BopTABjG6ITkmQuQ8qb0wl1s7eeEh2uuoI5I7RI5LyrjtDiO0rZa3I53hsOq+AXXpNzxpInE1x3NLSdNfb7ZKuTFIo2LnSk0NaJCndiTMIth6+1Sg8/yKYbkW7vYT7FwI+c+W52h+vwNuMTtv19rdQLWL7BUU3fnZPhaMu93HiVK2C/lRbTNEiGfxP8NfHzNZagcWqKjudffZNgcoTXKcyL/QSWLugOdyCENmBuEePm263OQBFvy49F9+SS9yAFAZCz8cCnMjSZpCzcAH77BpcsM5fGrKHXoleA70ODDXrwj1NDb9iZB6IkeoZHrVRpzWghppC3xsQvPMgM6YB+SoPmTrB3U7hlPYlapsqzc78OZoUvBnzqGrynprW1ok7BTMVWapmcqms7B3BCXEFwDArixSYlYe87Wvm4WOhNAtjtATk0AtXjWwbXhj2vF+axIAvZrdUS6HDnyCi3QwE3iKhryfmdZHzhXlXTk4wuoO3CXnGJf4W/VB58Z30Dfe9EhKi1Cqa2ZJEjEluWhC2w08HAFQnY9sOYS+x5SVOK8TfK8OGufe+y490YCjWB+b2yp5MK/yh2oGS0xX06hKEUntKaEU1GmF2OWtJZXz6rXUuPcTsyZP5Svof0hy/76Dys4upDPghpQqOD7rTP4zTBHblC2PyQM/iaIP8fHnoqQ2KJOPhIds5TO1XV+p4EzKRPpJVZ4YO0mz3iZUReGryd6F0z3CIFwS7LbzOn4qs0vIYQeG+gl+y0nQNTrX4/fkD2pcwJRt0VZU5AWsQK0VP1RXAXGboOfBScY87+ZEDXnr3XX71GEhzgKbVN2K
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB3735.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YTdrN2lRaDg3OFI5dTZzdGozYUFXU1NIdVJPcXlRNlJxcDBqVkoxeHdkelZk?=
 =?utf-8?B?TjN1Szd0SGpQSFR6V25vNkY1OWhmcTMvUUN4amgzYWtOYjF5OTgveVZDYUd1?=
 =?utf-8?B?RmxkVXdPek9iT0FhamNkMm5VOFFSZkdFdVozVmVWVHkyNGFYNEkvaU1wTDZZ?=
 =?utf-8?B?M1UvYnZDVU9DelQ1amUxQ0QvUE05MUpZWjViMjB0WG5lNnpDSVdkWjJaQ0Fj?=
 =?utf-8?B?UDU3bWM3OWJEUEg2eTZycm5FNDh0MGk2NVVVK0VNRlNNeUN5UnliRk5SK2or?=
 =?utf-8?B?WmtrMTZyZE5VUUd6VGF0ZDBuVitveWtab0Y1aG1jNlhpbHBkL00rKzU0NVkw?=
 =?utf-8?B?aFhIN1ZrNndIRWhjSnJ1dzV4djBsSVNpZHNzUThjOWZldjZVR2Z3ZXNFQXNq?=
 =?utf-8?B?WVhOTEJpSk82UWZSd09SNTFVVndqQ0dVMzBIL1FhaXZEMEZOdnRkNzhZN1Z0?=
 =?utf-8?B?dVZucmg2TWo0clFhcHB4eE5wYlJkSko5bDZGL0NHenhKK0JOY2M4dlN3ZDlV?=
 =?utf-8?B?SGRieGcrSEZHZndSMkR5MjRBd2s3NVhwb3I0WWFDUmFuRmlQQTY1Q1dXZmds?=
 =?utf-8?B?S2JVQncwU1hvdWtmVGdlbWhjL2pYMHRFZVJoMlhmR0dCdmRXczBTZ2tWQ0lU?=
 =?utf-8?B?TVFPVTVLUWdqZFM2SE0wcXBxd0tzSDVLZFp2ZnFuMkYrUEQxSXg2b0grelc5?=
 =?utf-8?B?L1BsaUhLdTZLMjQ2UWUyM0NBeFZ3WThHTUhWbGw5KzhIaGFuS2p3ejNDRDRk?=
 =?utf-8?B?dDBiOG1YYkpRVEp4SDRUZjdmWGRWeDZpdWlEK1Z5UVhrRTJVUVZieG50R3E3?=
 =?utf-8?B?Y1ZtN0dKbGxPTXlIUlJ1TWNGUmxXdzY3eDJzRHk0dmFHWVlmMWJZdERjNS9B?=
 =?utf-8?B?bDFNdFl2ZWRET0N6UExrdzQ4bVdoTTlhQlE4SE9ycnoxTi9INS9RZlVyZTQ0?=
 =?utf-8?B?MnNsQVVHVTUvZ2dRTDFMS3c2a1l2d1R3N3M3dG9XMkVGU0ZEaktCdVAyYm9n?=
 =?utf-8?B?eW1HdWV6Tk1JRi83MVRGWHlubWVqenVwN2FyeEtGMm1WN2JPc0FFYTE2Yndm?=
 =?utf-8?B?Wm1EMm9KTUVVQXUwcWVUaDdmSis3MnB6cytYK3IwclB5MVpDWUZVYVJTS1Zq?=
 =?utf-8?B?bkI4bktrMmo1NjFIbEdBQkZhUkc2NEFPWlVjWGpCUHZtOHNFMjRtam9GeFZI?=
 =?utf-8?B?VXZxTFVpTDBOblhBU2RRdldzM2lVOUozZnVPZU1pNmQ2c1dlc2RjK1FZYk5W?=
 =?utf-8?B?ay9CSFdteDJEOG8rOEtzc0duQ3ZvU3FUVWx0cVFzL2UyMTZFUGZjYnlRMGxK?=
 =?utf-8?B?YzJzU3RhdVJjUlJKeXVXeE5uV2U0QXhhUzJpTDVrVkNONDNNNmxTTlFhMTEw?=
 =?utf-8?B?bTF4bGZzSElSbkVBcHhtV3JsZkZKSGkwd1NDZk5rV2xqaFpJdjNvVHBjSlJN?=
 =?utf-8?B?dFRlRWhyL2NDRzlHQWRqd2dGeHhEL1VHejBVZzZETThsbW9XZTlYSmpWdEwx?=
 =?utf-8?B?QmF1YXM2QmU0R3RPeXYrYmNqRmxrVkZNT1lUVXowYnhJVUxEM3FIN1JJZFRH?=
 =?utf-8?B?Y0p1aFFHeVlXeG9BS0hQODJIa2s4YU82Q2hpbDRLSWthL216RURvdFh3UGdW?=
 =?utf-8?B?dzVudHpIUWt6VGhIM1dueU5XSTZvT0tnYTU2NHIzTTU0ZGU5MHV3elpDNE1n?=
 =?utf-8?B?RkU5OWQ2WmVzYkxOWHpGZFk0REVIeWZyVFdNUDl0UjZBYjZ1bWErSjczL2I5?=
 =?utf-8?B?TEJZbUh3OWFwMXRaVnVha29aWkp2UENyTDRMSGNvM1hjTFlPVlJ3QnUrTG9I?=
 =?utf-8?B?QU9vMzEzdHA0a21pTWhRYXpJOG9BL3ZoMXVoaFZhaU1rVGxqRG9xUGw2SDJq?=
 =?utf-8?B?UGpHeTJlQXA5TFhOWTdCSG9pcytKVE5ZM0F3SjVRbE1sekdxWmdsazY2K3ox?=
 =?utf-8?B?UjBTUXJGSHZJWkVOUUI3UDFiT0xiZWIrSGVLbCs2WVE0TzlVM1BnT2d6Q2Rs?=
 =?utf-8?B?MXJIanlVRWZDL00yUDVDTTE0VmFYZmFnMW9kZGVIRWU4SllmelZDd1NzMUQy?=
 =?utf-8?B?S0VzOForVmp0U2drdDRlZkx2WHlFUE9jVnQ3MWRNV1dXM2ZvNjFJZUVOY1g5?=
 =?utf-8?B?N2RWZWVzSm5ESHRIcVZaUnA3bzZRQXZYVk0rTXNqNDFIbWlSQklVUGpoUFFN?=
 =?utf-8?B?KzM0eTBKUzFXNWJ5WDYyK3VBYWFXQ29jc1d6dWpEc24wclhzbkU2UTZ0NXAx?=
 =?utf-8?B?dUZLbW4xSE9xeUx4Z09Wc2pmRzVzK1B4dk1hUyt3RUxWQmNvRUR5UFlRRExY?=
 =?utf-8?B?SVlqcHNMS2RCNVlseXd6bS9MOVNlT0ZjNU9HR1dyQkNLYWw2VldvUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	LTKcqgFbl2XWagByC5u9xo33sELDRlX3O3Hnt69Msa4bzzz0hJvcfS9UCdO6aJWjd/moa/GFLt0VnTsgGJ9U1QcqrQzkui3FAWaxIVLo+DmqCttSSPg+Jv2TQ3BDsBIvslB5jL4JkF0XWIqyJjmfNCwjt2JitjgXdevmTz5+D2TMyzHXYTR9r9lnn5k4w+P8ngIF6k1ucc31BFUIrOjpe3eGOZ/C8WX6OBe7vCNJRzqPZBpOL0lcYYEtvpwuu8lntHgxB0DyW4ZbUH4Wf7EVylyFP2ZH52C/T0a3d+L9w2JbxYGe7mrrleWzPqk8qEcRh+Gz51LG/U3AS3rAA0jlZQ==
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB3735.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb51ed0-f6c8-4cb1-ffad-08de98d377e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2026 20:38:34.9735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uA9RfDKJU7Zzi8KxPVjDB1bV58m+hUAeubQQRTCkl1vO1BMN04ShDwc1fNymdwECYU7lAG+mo8BPHyNNmWQL2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB4712
X-Authority-Analysis: v=2.4 cv=N9IZ0W9B c=1 sm=1 tr=0 ts=69dc02cf cx=c_pps
 a=CrvRUVoOWFViJQNMqJwZMw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=tlFearZbGdjt9DqA:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=-AAbraWEqlQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22 a=QXcCYyLzdtTjyudCfB6f:22
 a=RpNjiQI2AAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=yC-0_ovQAAAA:8 a=rY7OnaOMAAAA:8 a=tBb2bbeoAAAA:8
 a=M5GUcnROAAAA:8 a=RrG2Z-ecvVdzHmHNArYA:9 a=QEXdDO2ut3YA:10
 a=y1Q9-5lHfBjTkpIzbSAN:22 a=1ritWaTQIlNmyNCqN9QH:22 a=Oj-tNtZlA1e06AYgeCfH:22
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDIwMyBTYWx0ZWRfXx8wEx7pT87dM
 rf4tgUPcVXkrXKyWtEY/GgXR/YWupM56bl/G3W+6cPvwCYih9lBSQzDmOHDEmcc0Iq4sQHaWyYs
 5PB0eUhMEOxbWKq6LiMYaGfvKTJULZM5m4ex+T1dteRjvMFajoPNy4LZXywCmDxnYBr7rnn+0rw
 O0WUNlIQTGlTcxfMFtAzPgNjEPj+Sa7IyEbJBIWBsfL20pexzD3sMm2bsMH1HsfCgWt2T0kGRWs
 HLJfaZ2p7OsOqd3y5fkx+JYEdXj6JKv3VWW02bS6JzG+O9fhdYaPhbjKXGilTU98YmWB7JpDjkr
 CVOTUK1+wrOwWkTgqQrvNard9Wct7hHUdjTSECq1Ws3sFjbbo6l3j4Bd2Iy1IkKYjskgJ0EY8Zr
 W3X6VxmkOM/6OUHhW5bRqwVotn8yf4gKZDS3qsNydNg7xd57xYzsR/YSQuuYpMyuWKKAGDvmzXm
 mH3v2bb6qoc5EU1+AAQ==
X-Proofpoint-GUID: YRk_0AjP-7mItDEo6S1ecAUDZeNWGOyk
X-Proofpoint-ORIG-GUID: YRk_0AjP-7mItDEo6S1ecAUDZeNWGOyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_05,2026-04-09_02,2025-10-01_01
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[marvell.com,none];
	R_DKIM_ALLOW(-0.20)[marvell.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31217-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[marvell.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[saikrishnag@marvell.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[proofpoint.com];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86D3A3E5E5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWtsYXMgU8O2ZGVybHVuZCA8
bmlrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25hdGVjaC5zZT4NCj4gU2VudDogU3VuZGF5LCBB
cHJpbCAxMiwgMjAyNiAxMTowMiBQTQ0KPiBUbzogUGF1bCBCYXJrZXIgPHBhdWxAcGJhcmtlci5k
ZXY+OyBBbmRyZXcgTHVubg0KPiA8YW5kcmV3K25ldGRldkBsdW5uLmNoPjsgRGF2aWQgUy4gTWls
bGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0PjsgRXJpYw0KPiBEdW1hemV0IDxlZHVtYXpldEBnb29n
bGUuY29tPjsgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz47IFBhb2xvDQo+IEFiZW5p
IDxwYWJlbmlAcmVkaGF0LmNvbT47IFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3NoaWhpcm8uc2hp
bW9kYS51aEByZW5lc2FzLmNvbT47IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtDQo+
IG02OGsub3JnPjsgbmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgtcmVuZXNhcy1zb2NAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZCty
ZW5lc2FzQHJhZ25hdGVjaC5zZT4NCj4gU3ViamVjdDogW1BBVENIIG5ldF0gbmV0OiBldGhlcm5l
dDogcmF2YjogRG8gbm90IGNoZWNrIFVSQU0NCj4gc3VzcGVuc2lvbiB3aGVuIFdvTCBpcyBhY3Rp
dmUNCj4gDQo+IFdoZW4gdXBkYXRpbmcgdGhlIGRyaXZlciB0byBtYXRjaCBsYXRlc3QgZGF0YXNo
ZWV0IHRvIHN1c3BlbmQgYWNjZXNzIHRvDQo+IFVSQU0gd2hlbiBzdXNwZW5kaW5nIERNQSB0cmFu
c2ZlcnMgYSBjb3JuZXItY2FzZSB3YXMgbWlzc2VkLCBVUkFNDQo+IGFjY2VzcyB3aWxsIG5vdCBi
ZSBzdXNwZW5kZWQgaWYgV29MIGlzIGVuYWJsZWQuIFRoaXMgbGVhZCB0byB0aGUgZXJyb3INCj4g
bWVzc2FnZSAoY29ycmVjdGx5KSBiZWluZyB0cmlnZ2VyZWQNCj4gV2hlbiB1cGRhdGluZyB0aGUg
ZHJpdmVyIHRvIG1hdGNoIGxhdGVzdCBkYXRhc2hlZXQgdG8gc3VzcGVuZCBhY2Nlc3MgdG8NCj4g
VVJBTSB3aGVuIHN1c3BlbmRpbmcgRE1BIHRyYW5zZmVycyBhIGNvcm5lci1jYXNlIHdhcyBtaXNz
ZWQsIFVSQU0NCj4gYWNjZXNzIHdpbGwgbm90IGJlIHN1c3BlbmRlZCBpZiBXb0wgaXMgZW5hYmxl
ZC4gVGhpcyBsZWFkIHRvIHRoZSBlcnJvcg0KPiBtZXNzYWdlDQo+IChjb3JyZWN0bHkpIGJlaW5n
IHRyaWdnZXJlZCBhcyBVUkFNIGFjY2VzcyBpcyBub3Qgc3VzcGVuZGVkIGV2ZW4gdGhvIGl0J3MN
Cj4gcmVxdWVzdGVkIGFzIHBhcnQgb2Ygc3RvcHBpbmcgRE1BLg0KPiANCj4gQXZvaWQgY2hlY2tp
bmcgaWYgVVJBTSBhY2Nlc3MgaXMgc3VzcGVuZGVkIGFuZCBwcmludGluZyB0aGUgZXJyb3IgbWVz
c2FnZSBpZg0KPiBXb0wgaXMgZW5hYmxlZCB3aGVuIHdlIHN1c3BlbmQgdGhlIHN5c3RlbSwgYXMg
d2Uga25vdyBpdCB3aWxsIG5vdCBiZS4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBDbG9zZXM6IGh0dHBzOi8vdXJsZGVmZW5z
ZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0NCj4gM0FfX2xvcmUua2VybmVsLm9yZ19h
bGxfQ0FNdUhNZFdualYtDQo+IDI1M0RIR0UxbzA4ekxoVWZUZ09TZW5lNWZZeDFKNUdHMTBtQi0y
NTJCVG9xOHFnLQ0KPiA0MG1haWwuZ21haWwuY29tXyZkPUR3SURhUSZjPW5LaldlYzJiNlIwbU95
UGF6N3h0ZlEmcj1jM01zZ3JSLQ0KPiBVLUhGaG1GZDZSNE1XUlpHLThRZWlrSm41UGtqcU1UcEJT
ZyZtPXpjTmIwRkw3MHllYkVIbUw5LQ0KPiBTYjJ3MDVKN054b2RLUzZtNU9fZHBVeFRaVllfNXdi
cGQtDQo+IFBsczV5UG1GTWE0RCZzPXVuU21JbjNOMDRlQXlFZnVGbTdBREloQ2tja2VjQ1FMMmhH
enBnZUVkUWMmZT0NCj4gRml4ZXM6IDM1M2Q4ZTc5ODliNiAoIm5ldDogZXRoZXJuZXQ6IHJhdmI6
IFN1c3BlbmQgYW5kIHJlc3VtZSB0aGUNCj4gdHJhbnNtaXNzaW9uIGZsb3ciKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25h
dGVjaC5zZT4NCj4gLS0tDQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFp
bi5jIHwgOSArKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVu
ZXNhcy9yYXZiX21haW4uYw0KPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9t
YWluLmMNCj4gaW5kZXggMWRiZmFkYjJhODgxLi41Zjg4NzMzMDk0ZDAgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmMNCj4gKysrIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9yYXZiX21haW4uYw0KPiBAQCAtMTEwOCw5ICsxMTA4LDEy
IEBAIHN0YXRpYyBpbnQgcmF2Yl9zdG9wX2RtYShzdHJ1Y3QgbmV0X2RldmljZSAqbmRldikNCj4g
DQo+ICAJLyogUmVxdWVzdCBmb3IgdHJhbnNtaXNzaW9uIHN1c3BlbnNpb24gKi8NCj4gIAlyYXZi
X21vZGlmeShuZGV2LCBDQ0MsIENDQ19EVFNSLCBDQ0NfRFRTUik7DQo+IC0JZXJyb3IgPSByYXZi
X3dhaXQobmRldiwgQ1NSLCBDU1JfRFRTLCBDU1JfRFRTKTsNCj4gLQlpZiAoZXJyb3IpDQo+IC0J
CW5ldGRldl9lcnIobmRldiwgImZhaWxlZCB0byBzdG9wIEFYSSBCVVNcbiIpOw0KPiArCS8qIEFj
Y2VzcyB0byBVUkFNIHdpbGwgbm90IGJlIHN1c3BlbmRlZCBpZiBXb0wgaXMgZW5hYmxlZC4gKi8N
Cj4gKwlpZiAoIXByaXYtPndvbF9lbmFibGVkKSB7DQo+ICsJCWVycm9yID0gcmF2Yl93YWl0KG5k
ZXYsIENTUiwgQ1NSX0RUUywgQ1NSX0RUUyk7DQo+ICsJCWlmIChlcnJvcikNCj4gKwkJCW5ldGRl
dl9lcnIobmRldiwgImZhaWxlZCB0byBzdG9wIEFYSSBCVVNcbiIpOw0KPiArCX0NCj4gDQo+ICAJ
LyogU3RvcCBBVkItRE1BQyBwcm9jZXNzICovDQo+ICAJcmV0dXJuIHJhdmJfc2V0X29wbW9kZShu
ZGV2LCBDQ0NfT1BDX0NPTkZJRyk7DQo+IC0tDQo+IDIuNTMuMA0KPiANClJldmlld2VkLWJ5OiBT
YWkgS3Jpc2huYSA8c2Fpa3Jpc2huYWdAbWFydmVsbC5jb20+DQo=


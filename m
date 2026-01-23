Return-Path: <linux-renesas-soc+bounces-27356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB6/EnWHc2krxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:36:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C310677256
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A06113016D0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059A723FC41;
	Fri, 23 Jan 2026 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AbzWCjT9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E871FE47C;
	Fri, 23 Jan 2026 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178994; cv=fail; b=ibv4KlDTVhw6uxCxxsNomYHD6afg864M6gxPLB/IcC92y4Fa3CnHLfNtvQ7qGyqCEqmePXTi/pl28y3in04dL5F+O7sEvau3Xq0s4RQcVDwZXldx4YLCFRSmPApq6ocC+GFZ5/ZMtDPIRlmVCxJ2cFzFm5hZ0H9OhbM3oLR0WXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178994; c=relaxed/simple;
	bh=05quoX1gafl08WFRxy3rJrAPvc8iTAtL4APGyTYhMqQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q19if0R7UCIjqSCrUAs8dTWvrz87Cjjc3msJaw8xsgbc7Z/WVMJjgTbOHM+u9MIX8VJhrLUkt2RweGPVDbmVV3JgoLtk2pI7hkMJlFeMQBZ7PL6k+ifgVyqDDAAe/b3E2G5bEb7+CyyZg1FZaShgvLVmjuH1XPHk+Mjg6ye7/BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AbzWCjT9; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJFRwmTkFcYC0UKr8TBqc1v8AGSwKp67pROyNclYs0FtT01poH/XUfau/hnbxGQHWNfQnfG71kPq8WBYLWAZIR2wR9nOrSHffWUYtnUumapcdIT9D8VvsxbdW767vFfuE6+c3PhUnDn0dOalg9Oc8HZFqvRcu5i+kLggZsQ57eqK0DoeBjBiGuHBwUlkGlmhc9Z4K4kcCtTXqXeRoMjZTzcSPDeEwvXTPBxnADLrBl+yq1WJ5pciF4WkP2gpSnre7NmtFKGV4qbsNyxbuW61m6pywyW5KZVPZl7xOVOhMdOXPAeiZu1eX/ShSAUGyr8GaWNRuKnLxcF6iesfgyAylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05quoX1gafl08WFRxy3rJrAPvc8iTAtL4APGyTYhMqQ=;
 b=X96dPbnA6TTUte3QFa2V2mIetK5bmEuwrx8xLEHEVTNF6Hvb9WacYhBhh9zQmnF9W8CwDudE2YSGk72t4wxxICM3EejbFN0W6rrY7aQ5GyPSPMK7WanaPPCtsafn9DnyPhEjBRHPtdE70zXgnA8llE0aFCKEauxkZSKJG0aGWrwXg85Rk6nlzXR+hdwhPtnz5XYFbKB8IMLA8+Yv6KCtyNL8Fz7nvxAlPmCRVAxSGNujaN+xmaIseiD9pqM3/LTezveaAHVJh2u4IKv4zr56Vk3ZLPbi8WiVxyXYCrNU3e8AWyglwVO+MRkkgEspN+ByzdY6liWZd8JQJdgJBWhprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05quoX1gafl08WFRxy3rJrAPvc8iTAtL4APGyTYhMqQ=;
 b=AbzWCjT9iWBNBfL9IQ1y0M861ARqLC+D6PndFx6AMBVHY16Fi7v56/zSACOdWP+EwFwPmc4r+siWM7MvDepK2u/aKUWyd0A0ao9XnhMA3g+pERXKYV+RjzM3N8gf2ro9VE32Untuc40w4m44vcRfavGHfVTNfgVfMIZ7a5jnJA8=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB15779.jpnprd01.prod.outlook.com (2603:1096:405:2ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 14:36:28 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 14:36:28 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v2 05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix
 typo in interrupt-names
Thread-Topic: [PATCH v2 05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie:
 Fix typo in interrupt-names
Thread-Index: AQHcjHDSyJ17zsozAUq+/POr4l/lsLVfzR+AgAADXDA=
Date: Fri, 23 Jan 2026 14:36:28 +0000
Message-ID:
 <TY6PR01MB1737723CA0F7E6EE485654BEDFF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-6-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWxNbJaDhpOsJRCkDWvqqu4e63Z+cMRndFA6F+McdbuRg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWxNbJaDhpOsJRCkDWvqqu4e63Z+cMRndFA6F+McdbuRg@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY4PR01MB15779:EE_
x-ms-office365-filtering-correlation-id: fde9085c-0ef1-4052-8862-08de5a8ccb30
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZWMwNWdoWmk0Q1hnMTZLMWhGbHdRek5oU3VCOHkydHVPQmx2RUVRNzdSM1M0?=
 =?utf-8?B?dHhNWXo2aVNva091eHlwT0htZnRHOVpGYXo0cE9uVmtSTnh4N29kMmdFQldW?=
 =?utf-8?B?MDRmMWlqamh0Z0pSYzh0eTUvZHFqOTJCemoxdmdoSUt0enVtT21hUDNjNERs?=
 =?utf-8?B?OUFiSldNWm4rcGQ1bHQzQnBTYjlBSlplYkZ3cG5nRDErZDJESis2RGVpa0hF?=
 =?utf-8?B?ZGQ1RHVSaVZTTk9vZlFDaFBEdkxhdjhwdHNxclFUWHBZNSszOFBMcTFFanJK?=
 =?utf-8?B?aEJIaXF3TUZPeUxiL3FOeHNjRHBKd0pvZnlvRmpha3IwSU1CVytVMEhudFBW?=
 =?utf-8?B?RTdYR0JNa2NEbzRobmE5MGEyWE1pekdvRDgvaUQ3ODM4bEtjOHRBVGsyQXVv?=
 =?utf-8?B?UGtKVkR2TGRYcHN6dFJPNTFGNUtnZW5GQ3JXT3VVTmdHeUhsS2J0aHhGUnBV?=
 =?utf-8?B?RHlZZ0V2U200ZXZzdGpxWE5YTzhlYllrb0RJRVB1dkkxUnUxcEN6bDIyTEtM?=
 =?utf-8?B?WGpMN0IzZ2wxSDBWUHZKMkRsbzFWK2I0RUY3QjRuQ0w2akM2ZWd5SFBSOXpH?=
 =?utf-8?B?K1NteDVrbU1rVmo0YnA5NDJFSC9LL1VBM3A4RllrSEtXY2haQ1JyUW8yWGhY?=
 =?utf-8?B?TkE0dTdORzNZVS9YSStrS2k0aHNOcGV4QjAwMEFOUmZ5YVAybmZsNjliVTlP?=
 =?utf-8?B?TjhJdnZpTGxkbkNRa3E1VFBHdGlzdTFNVFRlaFl3MUFSVGs1cElpNXBJV3dx?=
 =?utf-8?B?akY5bWVVNWMyTmpkM3pnajJuSXN5RnlnVjZSRWRiNEtlZUpETzVlYXdVNjVz?=
 =?utf-8?B?SmtQYU8zZHRNUUpSbU9mMlVhdEI0em5wbStQU2Zwd01GSVVwZU11N2hYVkJV?=
 =?utf-8?B?Um1aUWExc3NpckpKZ1NtclFjNTkwSkhLVVU5Q0xEOGhncU04TWRoY0RkSmkv?=
 =?utf-8?B?aFRidDFvMlREWjZacDZVczZlMkhsdnQ5NnN0dXhlUFlFdzc1TE9hSXNiRmdp?=
 =?utf-8?B?aFJacHhSc1BtYkpwamJJMFpKbXJLVzhidVZuZmE0RzUwNTdtQ2lFWHJzVXkv?=
 =?utf-8?B?TVducHNHckNYMWV2ODRINjZDdEJIV0dPWEp5U0dOTTFLOWdXM3VHZ0lNTFEy?=
 =?utf-8?B?UjBuZ0V0NVlxaUZ5bXprWmpGQ3FaUlhVbGRqVXRDWjlpU29xa2VVcTgxRUpJ?=
 =?utf-8?B?bWV5T1c0ckh1a1hURStPT3BKOW5BT2FVaHJNWEVZd3d6TTEyc1E3Wkd1dGVv?=
 =?utf-8?B?ZVNVQUdqN2NIWWtpRWVzUENwakVtNk02QW1Kc1ZzeHNNSmI1azhRWFZsWmR1?=
 =?utf-8?B?Q2treVlmTXhER2QrTWFnTXFkL1FCbXJrdmdhTVBtQm1mdWFMbHhsaGpsZE9p?=
 =?utf-8?B?bHkyVFN1bkNmbllPVTBWVGxOTnEwSWF4c3VPZjlDSjFVbzk3LzJZSjhZbXlv?=
 =?utf-8?B?WVR5V2dNYlpNeUVidEJBUFVPRGZrWThMTW1lemF0Z2FvRW05dkhvb1FQaW1x?=
 =?utf-8?B?U2dxS2l4QWlLMnMrdTl4czNZVmNTTjNnLzdRS0c0R1NFb2wrZUxyUEhhQ1JM?=
 =?utf-8?B?eFJWanEzazFoRHBCMkRqTjlNNFk4Z1NGNTFKRlg1RUh5RitsZ0o3WWh1R2Fy?=
 =?utf-8?B?M0tLb29qMlcxdWcxdUw3WmpzMmx6SUc5aEx2Y242OTNPVENKREREMi9WZDgv?=
 =?utf-8?B?QWFHeWxmZDkyd0h5a1VkTEdCQm9HRTVtS1lwWUdGQUlPNlVVelZYTkNURVhq?=
 =?utf-8?B?SzE0a3VsOWVDNzh1T2xZaG9WTkZVUjZLeWNObVljUm54Y0FvSEY4VHlnUzI1?=
 =?utf-8?B?QlRtQWVIYjF1THFXZmc1VUZBSXk1ZFBkS09vVGF1UEhUWk9ZVnF2MndXTCtV?=
 =?utf-8?B?Q2tqR0ZlNWdsaHhDY1V1dzVMQzFKSHdZR0UrOEhDVkZoT1hKUjQ3c1QvL2pL?=
 =?utf-8?B?VFdMZXk2YmYvV2Q3NHd4MW55TG1wQ1JieEtKK1JMRVQrVzhsaHdTZksrN0pP?=
 =?utf-8?B?Y2l4OExPcjZ1NzRiNDNEWldqQTdmWit5YkdrV2QxY1VMdEtNcWlaNWVPZUQv?=
 =?utf-8?B?L0g0YU1YOWZDWWRFMHNPMHNpNmEraVJJenlLc09DdUFOdzRlT2diMVFlTW45?=
 =?utf-8?B?dURqT2ZRWVoweDFVektOSmRGM2wzVzhOd0hGeWNMQ3lBU2cvMW1SckxYcldv?=
 =?utf-8?Q?RkfYuSZaphckIzydPYDz7No=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THJxNm5DQUY4alpvOVYxa1NidWNNbjVwTHEvU080NVdoTDNWZG5NWnpqbW9r?=
 =?utf-8?B?TkVUa1Bpbkw2dkZZaDJrZFlubHk2SlN2djU4NkhzcmpIZnN4QmRJM0R3ajY5?=
 =?utf-8?B?dUs5S1I0K29GeFV6a2d1Yk92L3BPWWxIcm9OYmx1MXEyRU1TQ0NQV1NZYnNy?=
 =?utf-8?B?aGNlZHdRWkZHeEVPVkV5cTVpQU1RSGVMNlFCSktrSVJCKzNMWENoRitibW9a?=
 =?utf-8?B?bjNnb3QzUHdJbHJSaEdlekw2Z0I3QWtzQU8yaEFDaWNmS29IRkJFZTNpRnNV?=
 =?utf-8?B?QUxjVmI1OXp1bnNCTUdzM2lrbnVlQThUbEMvc2Q5alprYkU5K1l5SC82ZEdi?=
 =?utf-8?B?OUxsb0tlcjBIaDUxczlRZXlGYlRvYW9LTnlOUVZXREk0ZnJvTGh3V1g2Qzdx?=
 =?utf-8?B?L2trR09WdWZhOWNPd1ZZbW5JdjZucEJzSzZxU1Z6TGVwNzNmVjVRWGxYRDNU?=
 =?utf-8?B?RmJwNFhOYzI0aERvcUJxTlROY01lMm5XKzY2NjJSSm42Qk9UdlJxYndIZmE3?=
 =?utf-8?B?RXh0eXZvWm1kdXBKSFVucE5EdGtpYURNQ3U1cEhtamtDZzBQT29NV1B0MzYx?=
 =?utf-8?B?MjdoQjJtbUp5Vk9xeDhFYkVTTEkzRDg2eUUxMmJpRnNCN0lWNitaSjZMN0VY?=
 =?utf-8?B?SFJ5NXQwRDlzZkcydFU4cStlTnZMTCszakNEbzNzaCt2dmh3QUxpY2tuWm1T?=
 =?utf-8?B?RFoxeHNmU2lFdWQ4ZXlOaFN5blBvdUZiUWpYdm5wNE1xWUNHRjNkMGlPY2tm?=
 =?utf-8?B?UGk3OHFUbTFHTlFhclZVNUl3THZMV0VVNW9oVkF2aG0reVhWZGZYalpxY2pK?=
 =?utf-8?B?ekxJNUs3UHFqRDZaQVFucHNYQ3REQndSR01BOGJBWW1lcFdNN1dmQk5vTzAz?=
 =?utf-8?B?Zm14eHF5WGdJVDdhRHlvWnc2Qy9NK1NWWkFERW5vQld6Qkx3SUFyL29IVFdv?=
 =?utf-8?B?NVdnYU85b2o4MjFKamozRUl3SytXOTkyTFl3NDMrWllieFpjSUxpa21oeTVM?=
 =?utf-8?B?MTF0STRJQVd1WEFkYU0zbWhvNStuTzM2UnBZWG1IOE9rZTE1ZXEwNVFLeTdp?=
 =?utf-8?B?eWNKQXBDZ3I1OERZT0RjOUhFQ081L2dKa1E2cjNTNWgrdis5ZnRKTHBIY1N1?=
 =?utf-8?B?Y3BqUU1BWUJsUGVmZFhYL0Nud2R2NXJoMjhMOWFyQWVHZmxGK1Q0em5uUWJP?=
 =?utf-8?B?L3Vaa0t3ZVpncXlscEx3dy9NQk4yc2FrS3daQlpGWXRHMlpJUkVob0IyNHJy?=
 =?utf-8?B?azl4MXJOSzd4am9UWDEvL21pVThEN3VIemNYYVFpQlhKeGsxNlNZc0NiWFV1?=
 =?utf-8?B?V3pITFpRcU9EVk1YeDlpUi9rSzlUbU1EeFdVUTNsWitDTjhldm40MWR5SURW?=
 =?utf-8?B?bXBuRFlSTlJvNGtGcFNqOHBzZnMrV2tGa2FLSE5zNVQxMTdMaW1UKzE5MFJP?=
 =?utf-8?B?VTNISndkOVRWS3ZNVjdtSzB6eWZrOEE4bjI3VDdnT2ZWQS9PYkZWK1BPcjBI?=
 =?utf-8?B?dm9SUGFMYm1CNHhUV0o0SUREUUUwcG5qdGJscFEvYWdwM2pEQ0Y4bmtOWnlG?=
 =?utf-8?B?VkYyak9xdS9odXEvZUlxOFZoSHFmTTNoRmRHbU0xQUxBMEVmRDJIY2grMlM0?=
 =?utf-8?B?NldQL0VwV0hoN295Q3ZhM1lsK2ltOTl1MWo1WElGWTBrQ3BRT1g4RFVjU0F4?=
 =?utf-8?B?MTdMZUN0OGwzdjlyTXNUWDMzWEp0a0VJSEpxSkhOY05oSFI4cXFNZHVwY0FU?=
 =?utf-8?B?eTBva0IzRVdLeExLVElRZnFlL0E5bCtQZGgydjFHSzhMVW1jZ3dsRXpvU28x?=
 =?utf-8?B?QzZPbHVFdFd2SHVxbUFLT0xBeDQrbURuaXFHV1RVRXBNbWNFa2hlVXBCdm9r?=
 =?utf-8?B?T3orNCtxN2NqYjBCNXlIeVEvUTZCWkIzYzZxMktxN1NMUXVaOXhVNGtqdUlq?=
 =?utf-8?B?eVp2MWIyQ3h3QmFZekVkYVBNV1ZiaWRoNzg1UnY4OUdYN2lqdXJYaXN1RVNF?=
 =?utf-8?B?am1nK0pSbStLaE1qTm1LQ3BpdlcrdlRYYUxmcTZHbnRtQmZrYjFiNi9TRlpt?=
 =?utf-8?B?bWFmSlJ4S2FMZDEwV0R5OEpra1NLOHBidmtKMXQxU1l1a09QaEM5M0JCdlRs?=
 =?utf-8?B?b0hmVEN1bWZYQkRneGMzK0dLdGpkYmx0R2NnMjVmWm5xb3BmYVE0TkdvaTMr?=
 =?utf-8?B?VHpNc3lhRVlxMmVPSmcrMHNyQkV3aGlmOWV3aFcvSlJOdmhtRWhESnYrb3ND?=
 =?utf-8?B?NCs1QStSSkdlYUZJZUVTRWszSUJMWFNSNXpxY1hYT28wREhyY1ZyU0VPNG0y?=
 =?utf-8?B?S05sT1E2dE1kODdIZElaakVaZyt3MEtGMDFJTDdhZyszU0ZycHhTNXdBZnFR?=
 =?utf-8?Q?mqzkvvZxdZlfpJZ4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fde9085c-0ef1-4052-8862-08de5a8ccb30
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 14:36:28.3452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wGV5ZcZWr0dw3yzQCKlEdf3E0fnnrZid/XofKc3wf8nDQAbGbKM7ldFUHfJOh1Cty5Y/oJMN4yKsAM3oibyB1DfAjgxWQcoPsZ4L4oZFJW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15779
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27356-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,bp.renesas.com:dkim,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,m68k.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: C310677256
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMjMsIDIwMjYgMzoxNyBQTQ0KPiBUbzog
Sm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDA1LzE1XSBkdC1iaW5kaW5nczogUENJOiByZW5lc2FzLHI5YTA4ZzA0NXMz
My1wY2llOg0KPiBGaXggdHlwbyBpbiBpbnRlcnJ1cHQtbmFtZXMNCj4gDQo+IEhpIEpvaG4sDQo+
IA0KPiBPbiBGcmksIDIzIEphbiAyMDI2IGF0IDE1OjAxLCBKb2huIE1hZGlldSA8am9obi5tYWRp
ZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEZpeCBhIHR5cG8gaW4gdGhlIGlu
dGVycnVwdC1uYW1lcyBwcm9wZXJ0eSBkZXNjcmlwdGlvbjogInNlcl9jb3IiDQo+ID4gc2hvdWxk
IGJlICJzZXJyX2NvciIgKFN5c3RlbSBFcnJvciBDb3JyZWN0YWJsZSkuDQo+ID4NCj4gPiBGaXhl
czogZTc1MzRlNzkwNTU3ICgiZHQtYmluZGluZ3M6IFBDSTogcmVuZXNhcyxyOWEwOGcwNDVzMzMt
cGNpZToNCj4gPiBEb2N1bWVudCBSWi9HM0UgU29DIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9y
IHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLQ0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BjaS9yZW5lc2FzLHI5YTA4ZzA0NS1wY2llLnlhbWwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3JlbmVzYXMscjlhMDhnMDQ1LXBjaWUu
eWFtDQo+ID4gKysrIGwNCj4gPiBAQCAtNDIsNyArNDIsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAg
IGludGVycnVwdC1uYW1lczoNCj4gPiAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAtIGRlc2NyaXB0
aW9uOiBzZXJyDQo+ID4gLSAgICAgIC0gZGVzY3JpcHRpb246IHNlcl9jb3INCj4gPiArICAgICAg
LSBkZXNjcmlwdGlvbjogc2Vycl9jb3INCj4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjogc2Vycl9u
b25mYXRhbA0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBzZXJyX2ZhdGFsDQo+ID4gICAgICAg
IC0gZGVzY3JpcHRpb246IGF4aV9lcnINCj4gDQo+IE5pY2UgY2F0Y2ghDQo+IA0KPiBMb29rcyBs
aWtlIHRoZSBEVFMgaXMgYWN0dWFsbHkgY29ycmVjdC4gU28gd2h5IHdhc24ndCB0aGlzIGNhdWdo
dCBiZWZvcmUNCj4gYnkgIm1ha2UgZHRic19jaGVjayI/DQo+IA0KPiA8ZHJhbWF0aWNhbCBzaWxl
bmNlPg0KPiANCj4gQmVjYXVzZSAiZGVzY3JpcHRpb24iIHNob3VsZCBoYXZlIGJlZW4gImNvbnN0
Ii4NCg0KSW5kZWVkLg0KDQo+IFRoZSBzYW1lIGlzIHRydWUgZm9yIGNsb2NrLW5hbWVzIGFuZCBy
ZXNldC1uYW1lcy4NCj4gU28gcGxlYXNlIGZpeCBhbGwgb2YgdGhlc2UsIHRvZ2V0aGVyIHdpdGgg
dGhlIHR5cG8uDQoNClRoZSBuZXh0IHBhdGNoICg2LzE1KSBkb2N1bWVudGluZyBSWi9HM0UgUENJ
ZSBzdXBwb3J0IGRvZXMgdGhlDQpjaGFuZ2VzLCBhbGwgb2YgdGhlc2UgYmVpbmcgY29uc3QgdGhl
cmUuIEknbGwgc2ltcGx5IHNxdWFzaCBib3RoDQpwYXRjaGVzIGluIHYzIGlmIHlvdSBhcmUgb2sg
d2l0aCBpdC4NCg0KUmVnYXJkcywNCkpvaG4NCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQo=


Return-Path: <linux-renesas-soc+bounces-28340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zGfVFicgmGkiAwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 09:49:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49F165EA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 09:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34AE23009B0A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 08:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA56730FC3D;
	Fri, 20 Feb 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Kcrw1sJu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F57478;
	Fri, 20 Feb 2026 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771577379; cv=fail; b=u1yemPYiy41wfAY9o7Sq3QG9ridkEw6GFR/SBT+lBlVpQMwi99NUzXdjwAgxAqropYAkWogyWENiDgv//4vqJA65Q28xA3eo4nuSX6nuGc7BtWdVKmJmuXFFclhCoFIzjIf32Kia03xWpBUQ2HgBKUn1oIQGmVlvLqaEYbUWHCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771577379; c=relaxed/simple;
	bh=CfmQjUTXAWOyF9X7OZphdxDOQG0Sc/y6kihRXTAzwFQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G5ElG24TnrSQDAhUMiF8W5T3ouZDi2ze93y9ygOX3FTRdr5MUOAiXLy+IEiE8wsDwr6WDByFQSlArYtUqArwES/6RTDHvg991Tz89/LltNWpejMdEC+Djz3M2+azr4PK3Ec5gSEBmvbcSICrmRI8Rr6THeEVcemAScUMYy3o5Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Kcrw1sJu; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9EwQf8OZqKVbSJgWk8U70j0+zx/MpN7m1HiSDCqjMMvvCbuj/VI2KkfzRrQm9wPF9gF2JT9TkOAFh6+brNhXscnEEfW2cfbdw0sCZlmnu0BKw85XhSc+w/8jAeMM4nM2T7StywnBm23nhDeimTFWYMjzmB2/tU0feB7en768H9gU6Wc7XMkGWqNq/1K3p3QRgIpD8lwN9ZOsP5VrdKcGNlViR4h6dCVjdHZSG9Xch/koKYI05o59S8VLn6gzm8EtpcDERUYwYCTVVKFz5DbwQYunIhayn7E8eDNKDm0pcCOGqL8Fbw2HlyqoPuAl2bynZk2ea3BKYgsMw/97+DmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJa8CwMPnxC6EnciR063awFpwT53L00XmrK4isfLqjY=;
 b=oDHRFqbavt0Y8uPSK8LXPQ+pNgkKAEKhcEJtS9EG1+XuJPhx4bcSJWgxRU8dYr2EL9To0No3z2r4MmyX5oGt0kz+Oi5ijgve+En6W7tvIV2fWjGPNFhT4/s1WPeqwIwcru9ZBOi3O5DRY3OtPMaM4lKk/XDEF1RXXyKBGqmJkJQR5BgVBHp9o2CO4xrsVX65HwzvfjiHOrr8smk6QdikJrR07ye/vJud0fufxwxPvWHUiqnAFvHptLWUfIImpLC+d2hIgIApsRDNuRhWqmwN0jkxCpc6skUqNqMnWiWskBRAuTXVbUYH5D3Ew6NLO6NldWOAobCvQYkPsf3xotn3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJa8CwMPnxC6EnciR063awFpwT53L00XmrK4isfLqjY=;
 b=Kcrw1sJum2/O4G+rqD7bWmTG8vxdtPc1ALXWwDHrp5QyJ9L+HatAEh+Xa76leNVz6e2rerpsyIkPCoNZSy3DxsJzvE4IwL2XVjtGBv1XQUfs/pi61Iz+OkrOiYRLujq43GbfYvnUpR1cuo4hiDgYIsMS3nc2GLtCDalW3xCrQYY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9968.jpnprd01.prod.outlook.com (2603:1096:400:1e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:49:33 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:49:28 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH v6 11/16] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
Thread-Topic: [PATCH v6 11/16] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
Thread-Index: AQHcofBJvNN0wGXl1EqGa6QLahk2abWLRwyw
Date: Fri, 20 Feb 2026 08:49:28 +0000
Message-ID:
 <TY3PR01MB113465A6DF24308C10019193B8668A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-12-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260219223542.6364-12-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9968:EE_
x-ms-office365-filtering-correlation-id: da8a7fd7-f9a6-4424-1949-08de705cf534
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?roEJYdPc3s6FT0JwoYOBLdSB720xEtwCITDkUQ7jjtmeQiVETKALKZhRErEt?=
 =?us-ascii?Q?v0qSaiby2Plip8+alctT8AdTxYuDufwIiSl4YL3OBnWSXav1GD7jHTcNpdEi?=
 =?us-ascii?Q?qmMOGeZN4XGTj5BE+YgbFg7YqWgIvsqPEqR9gv4Zjc5BolpGK9m3Xvd/R8fo?=
 =?us-ascii?Q?V74wopzGVKlDacZAVqxNQIay6pax6AmWOvvEwmYDtAtKfq3uNTlWLal5zbSm?=
 =?us-ascii?Q?mLMRq/E6DpNpl9ZQlFr5492pzS5swTy26wfpSuVRDEve6A6uOEiRSTHrbKL3?=
 =?us-ascii?Q?AX2RwhTmlAY/kMJcm1GZvI5WvdFGTtfU/xaaeDlgN2F+5G21uPS1AQ+taID4?=
 =?us-ascii?Q?2hUWBokJmzyg85H/c6dcPh4bIpbt8sIVFaBxLa5rWutNtPnlGqYnv4xXQVRe?=
 =?us-ascii?Q?fV50Gqo0Ip/W7r6A+1ARQgOmhH+IVDHvGLx1vBO5IKsi1T9/YpBJcAMYUzPi?=
 =?us-ascii?Q?1Mw9HFlsSco6ajbDrG2k3gW+cCu8KGJfLFqVcE2XMNvvlE03hdFt6uNqTrWg?=
 =?us-ascii?Q?IKSoRABm7Zlfshy6NoktXJ9Mv7NsvtNC/SA1gw2gVrjB4Rg285MNrnzxCOk/?=
 =?us-ascii?Q?VeYW7QG+j7YUm5rq1dwEVoYUdEVsPT5rHRqtfcM/ZX2QGI93/SAKcgs4ktxM?=
 =?us-ascii?Q?889t7wWDPkg5JCIhjt/AUucMNnVylW1WDF7fCmINv2HhLuhjV71S1G0fC2L0?=
 =?us-ascii?Q?gsBaNh8LboiCM51s1vi5cK0WZxv9c66xlYsUPq5kqWYpxaNTu3O0MYSbigza?=
 =?us-ascii?Q?KhkA+3xTBtWj/spyXlNz1X4lEL2a2VRAsEEyjeS8jvxycrWwJl/2NJBrMODk?=
 =?us-ascii?Q?h4xTznJbMi7QmdesqiKJ7U8Pis+98rcriMwJl2uM6rcHQ4YDQCEsC82bxt9W?=
 =?us-ascii?Q?bBHOSTSZcS5n06dl56xMsNMuY/OZPUBsjizaDYrNREJNivBS4wH/jYtvg9bQ?=
 =?us-ascii?Q?eIVv688VAn/s1WgJk5DHh89Ft6EidEnt4JJCuxlHSJqX0h9hWtb3SdJc15uV?=
 =?us-ascii?Q?E0NfeLwoFCWRr7dQsqTEQipqhXJ2Cr5H+6IiSj/Md/PwLclZppYkM4fJzclM?=
 =?us-ascii?Q?mr7zBfLDy7gFi7mreww7iFWUmfYSjSo83TdMtmqRA9wO92hlFloVeGTixstt?=
 =?us-ascii?Q?i7aLtsuhiYDp1O7p/54qcbvHHNMqNDkMb3ygArggpLaGroIt2smcYM+z9wRd?=
 =?us-ascii?Q?w2qNG1HLaLWjYNR29dmWzlQPJho/AO8/LJBzutD1AxshkgFEcxypkTUAyWBj?=
 =?us-ascii?Q?Cvw7Pa6riPqy6x+HyC02K2W5tkVN/iin/j4wn4AUbwyAd01eiXxesoPDMpS+?=
 =?us-ascii?Q?Wb4Qlskf6haq6VhWYprM4AJjt+SqKfd5VUSYY+tKwx6CxJJzznS1nrJfQ5Xl?=
 =?us-ascii?Q?LGTT3K6uj/gP2jgM0CJmJK4dbRC1RHID7Lj6MUurmQk9FG6dolqDD3TCD62F?=
 =?us-ascii?Q?CgyDVZ6gPn5FVJqeUPv1u8IHzs7c4sCCdShxzGXkfiH2Tbhm57jLN9F9gOoq?=
 =?us-ascii?Q?+o3fSdbvEPYufKZFTvmEefF5YTPCf/81xf3lpxSjCot1KehtrECmOq9isXWZ?=
 =?us-ascii?Q?bQKjuXlgHp/XvLHspjppXpBAPbUhqrMHeQIppb28P7oLg5wR9z70j2E+RXhI?=
 =?us-ascii?Q?dwezuRDmFS/HlwFq+egkA9o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eq5CdOUlR+jOk0w235F1o+CessuYTTk7VmZX2IY13rLOPBwUrXpr7RvAEvIc?=
 =?us-ascii?Q?hjjtrXhbXlcwbZ+JnuRVACCmRXhB2dZ4vH3UJP5gzLa6LoHqV8X11bvHqTMz?=
 =?us-ascii?Q?X7WfA2aCLkyOH6KSF9Xhf2JzhaIJwd4fp1qU4n0dqJpw93TGSylXLLxXf1BJ?=
 =?us-ascii?Q?NN05MNLfWwi/6bfTc8/y7QxdauYVEsz3Yu4GlMptLFrYj65KEWCGpqe3luOm?=
 =?us-ascii?Q?Uxyt9sEkWhIDoRsuHfuMOZVAyKzplSaHYUckW5LJdA2+FOwp0080D2HveQA/?=
 =?us-ascii?Q?MixgaSqY/5UbRlUlN2rxTSK+/ULjP4gUdfvWnLWGwWEpNujNs+meS9AMSn83?=
 =?us-ascii?Q?uF7db9VFW1NFCpU3BYSQ6eLjH/ha9GSzHIPgnc+zCNZLYWoQir5BBjiZHmxx?=
 =?us-ascii?Q?VraAT7jeRVjaao+n+bPZotdb+UmNWjI+3eQqPeQEimO4ejZzTNdoNgWMT3mU?=
 =?us-ascii?Q?ztgO38bNiaHm0Gl37Aso+OOUhdllkUoSKKq5yeMQ9qUsZSSlXJDoEsPBoRiI?=
 =?us-ascii?Q?BcXbA6KwHGQaYFf0hfgz9J6yHZKFSPiEWeEA3hBcIk4ZpLNp5YDCrFfu5Mi7?=
 =?us-ascii?Q?4OJxC6DaOf0O1+ywD8DDotM5mHOcqH0Z1G4OQ8W4pNzXxz49mgEvAo96oobs?=
 =?us-ascii?Q?wbrH0Ixh2kcu7Cx6d0mhA3BCjewLCbGX0+LVUnd17kVj2RMt1eE/dhEs/T+/?=
 =?us-ascii?Q?MiS1Q/1R4oq18c6q5Vs6PGC3G2u2jjk9jzxFk/VDt2BbVjwfRKUsIvJ+7WkB?=
 =?us-ascii?Q?Z17vCR6aPbwUWRKYVcYKJMbWhtKOfNyV82sAXIVtiFkD+5WIhSKbjYMMV8xN?=
 =?us-ascii?Q?FuyU3E6WKxj9W4TRanFKtgtr55sXsegXY0lf1+W9XOeab7Yx6iJkYeAHJFWT?=
 =?us-ascii?Q?TXVl0e1yhwijlZivL/G3nHy6avTgIMRVRDP2hRe9uRxDhV7Vre4ytqeMAgHH?=
 =?us-ascii?Q?0ndMwbY/LljYAhv8Rd4BIRZi2MH60YAmJWvXskXKtNuHaDYKfPIBbo6gPQsY?=
 =?us-ascii?Q?aF8+FKIb5A2K6gjsNvyo0cKOw7m1iONfLlCp9Qi60tbAFGEYOGZ9HaPGBXZw?=
 =?us-ascii?Q?zCVWC6V8udka+L/GiIl6ShIYil5mooGUHj58vEKreP0ACiMwAHgN60eww493?=
 =?us-ascii?Q?oFC/atWxCsofN5pkVTwRm79QlDZjCU7Rct2NelFmVHgheyoeMD6tazlPAmbL?=
 =?us-ascii?Q?O53+pab2Ipam5aki6cF3SKLkmzPiRjsJw2nYDpKtsQ8yCIIAJCemTMcxPjmh?=
 =?us-ascii?Q?YQsiqYeue7LGOlk07v/yGrVveYORBi3Q8SWOhidMrIN4qZQY5Neub00wDOoz?=
 =?us-ascii?Q?TSdEvLnJ/agz4sg+np5/v0bYFDQZKQakHEdkLG+cBhmSwmdVamh3jfo7PI9z?=
 =?us-ascii?Q?y2O6hEXGwM+LQxG8Zmk+Bb7ia0M1NEe1dvBJk6ON86I1Vtk3huxP0Ep9bbRd?=
 =?us-ascii?Q?bwsCD7aw1Hyi+DtTxJlEKMciAdGiixcLdnzZERxZ9nQBpJIiUFXldVhWe+TM?=
 =?us-ascii?Q?9amS2mRD9P02DESf6yZ/lsilcpH/WzMQFVn0f4kmQGfjkl8L2rkoh5wRx/WR?=
 =?us-ascii?Q?NSIy52HhM+PEcwVYsukh5gwjUD4GqfwNIgSi0LXLDBbdlkIEE6xYGGUhOrGX?=
 =?us-ascii?Q?8bo81A5vQhhT3jMntvxDJ939Y1US/777VAz/4HF8mVt2nh/TyXS5pfkTX9xh?=
 =?us-ascii?Q?WCurp5f8pd0gVp1Dw4UMhR7Bc601zrnRn4ide3eVE1TOhAw3j2S2Yq0NR5kH?=
 =?us-ascii?Q?TQbxzLS+kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8a7fd7-f9a6-4424-1949-08de705cf534
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 08:49:28.5599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hk2xRdFirmhDnFQZYqhhypmolGBdt9O2ubc0sveuWSId8iqdSalJVFesfK7DxbGnEbg4HDJJWoFyB8kI83VE5BQpN0RaK2ga9zWYNhzGDjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9968
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28340-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: DA49F165EA9
X-Rspamd-Action: no action

Hi John Madieu,

Thanks for the patch

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 19 February 2026 22:36
> Subject: [PATCH v6 11/16] PCI: rzg3s-host: Explicitly set class code for =
RZ/G3E compatibility
>=20
> Program the class code register explicitly during PCIe configuration init=
ialization. RZ/G3E requires
> this register to be set, while RZ/G3S has these values as hardware defaul=
ts.
>=20
> This configuration is harmless for RZ/G3S where these match the hardware =
defaults, and necessary for
> RZ/G3E to properly identify the device as a PCI bridge.
>=20
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Changes:
>=20
> v6: Collected Rb tag from Claudiu
> v5:
>  - Used field_prep for non-constant mask to fix test robot warnings
>=20
> v4: No changes
> v3: No changes
> v2: No changes
>=20
>  drivers/pci/controller/pcie-rzg3s-host.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index c66532a3dae0..f7c23a56da5f 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1065,6 +1065,7 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg=
3s_pcie_host *host)  static
> int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)  {
>  	struct pci_host_bridge *bridge =3D pci_host_bridge_from_priv(host);
> +	u32 mask =3D GENMASK(31, 8);
>  	struct resource_entry *ft;
>  	struct resource *bus;
>  	u8 subordinate_bus;
> @@ -1088,6 +1089,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pci=
e_host *host)
>  	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
>  	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
>=20
> +	/*
> +	 * Explicitly program class code. RZ/G3E requires this configuration.
> +	 * Harmless for RZ/G3S where this matches the hardware default.
> +	 */
> +	rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,

If it is RZ/G3E register specific, Maybe better to define this mask at top =
level??

Cheers,
Biju

> +			       field_prep(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));
> +
>  	/* Disable access control to the CFGU */
>  	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
>=20
> --
> 2.25.1



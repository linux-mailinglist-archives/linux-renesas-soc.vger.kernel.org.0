Return-Path: <linux-renesas-soc+bounces-29910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD/vEaMLvGkArgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:43:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F82CD149
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 15:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55151300766E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3BD3D75CC;
	Thu, 19 Mar 2026 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kJ8/KIsa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011017.outbound.protection.outlook.com [40.107.74.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E243D75AD;
	Thu, 19 Mar 2026 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931130; cv=fail; b=JLY2AvMokOWCaesiGtK5hr+bqz183fw/xhbquiMX48rNCMKGa/83pTXC9QqFYI5w8JgNJAtLil2SrrRSHE4SyIaRy662djOcodSjEF3N/ndgBu9vZbkTzvAM5QdkS5dLxWnknDh7inoQKrvlDlNrCeNTTNr3co3XLQlXdIQZgfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931130; c=relaxed/simple;
	bh=bFIsA0dYwKbIdTzkoGQSu6yxS2YIYeKTm+cQqbN0nXQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LpNN39e5o+f2+2L1bWnWbONrC6gBZ3g0x7ZZO6CmsBzvImf6mVKTwRURIH3NbSodXqhhPABdpsRH9TfqYv4oW8hU6Nbf2g7J1xnx3ig1o779eV3ZS5UgwawnHIAAclQrPhX3tzj4qNMsytgDAKum1S+ghlOZtpEMF/y8oiWcHxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kJ8/KIsa; arc=fail smtp.client-ip=40.107.74.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jin4dolESn1n+QRt1BJ0VVbRg+ZPSflsQ9cXb7R2+Go53/Py2F0SPjpfWNmm54m0Fxck32Ty2G/Saciuyd/pYF5z57qE44gTD00pg8yNEotdVL/9QqbIOiXHTwq7JpVy9tDCZOqXW3MsdBK8cN07l5W8/9crhwvFQCnnG8nyixlKpJORBXPAEUaojaq0Rtoyx0TMDnMjkXolzMmvzplM9KX+FI9Q3E0mDXbrTbMknrdLo0GIItjQaHOeOLlq/z/ngPRQU2kBNyoy7j8k09whu2O4dCsnRXfm7GBBDCdyln+mhk3AeQ8yPidn8n/ZgzQWo3xEMKy4SNUwMUvglrsVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tn1TED3v86MFByBeO/sk2bimek49UQKMMkerwqdljHQ=;
 b=qbX9xHBoUZMnTloTowyJXeS4/+k1cE+UdJBlolKlOaNFPBWrae9+iCdmXmGJnNIlo02G8VL+7w4UJGGlPpGfqUZ8pE2WqIa6Perm/J02C+/Z4LQodu3o+e5/5B55CfbFykKCVu2qw+7seXgoMlqOn5jyA6yYulqH9Fga3XkEIms9VMPAdFm+EZ3zSUky7ei3plPkSKggiABKLaph6Rgtd6bNLG2JyxYsmCWQ24RaBoX6hnJ1IEemb+UnnO/8zPrwXJBEfSqb6Bs9prU0vuUUAZkrURktbiMlPBjt1uifpgvUmZWi2JeFLpRuamJMnFBG7IlWHhc517zYJ51sXr4Zwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn1TED3v86MFByBeO/sk2bimek49UQKMMkerwqdljHQ=;
 b=kJ8/KIsa2p2XU1aOiKvxhxnOu5FD/VMlc4S4n0OLjcVWVd6F0Dahn6Q0Ukd9PPKpcAHmV7W79lsWoIXADlF7bxmJp+IluIYMoAVi1PT4meEsCyp3VRPVftPd0/xdT7vBo4sA1rR6mrhyFbKmDBR1vHgy7BNtYX51hW6eHGPW9rc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14313.jpnprd01.prod.outlook.com (2603:1096:604:3a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:38:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 14:38:37 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit
	<hkallweit1@gmail.com>, niklas.soderlund <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Paul Barker
	<paul@pbarker.dev>, Neil Armstrong <neil.armstrong@linaro.org>, Florian
 Fainelli <f.fainelli@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Sergei Shtylyov
	<sergei.shtylyov@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next] dt-bindings: net: Remove redundant
 ethernet-phy-ieee802.3-c22 fallback
Thread-Topic: [PATCH net-next] dt-bindings: net: Remove redundant
 ethernet-phy-ieee802.3-c22 fallback
Thread-Index: AQHcsuozh9PACT5Ea0q94VPQdAmwoLW1Aj2AgADyMaA=
Date: Thu, 19 Mar 2026 14:38:37 +0000
Message-ID:
 <TY3PR01MB1134654258041DDB93CF81573864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260313130623.297712-1-biju.das.jz@bp.renesas.com>
 <20260318170503.316285a7@kernel.org>
In-Reply-To: <20260318170503.316285a7@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14313:EE_
x-ms-office365-filtering-correlation-id: 2a0b5301-38f2-42d8-95a2-08de85c534ca
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 mhYJgx5qRz5BFm5FcBTH3Xewa2YwOIMLwOvsugwU9k+AKk8RmWoO4ACbH2LeCcWOxiAvv9TaMGkfKMTbS8iWQixTyIktWpmhau5/ZIVhQJMQF9VOf/KwKH5HV0q7atl5Rj9gmKgKoYqXEokFlNk9xc4Hb4QS4Sxd0qFjm6Dhypww3+UWVYTxx/pGx16/Q4HfScdlgW21uQ3I3NbOQYp7Kd83eRggVBdIiuxOVjQohOxQX0pXJ7IBu5w+5VxCd9wnS4EezJ8B8DIEuTvB5l7OP6hGqnEnA4kfw4KcZizJE3SaOoAUvE42Jd+Pakd8qUELxQrAjRiPI5NYOevpNWJifMwO3sQTRL67az3lp3cTipxTWWfLKWECrruHmaZ8rpp9rF6BlmbLm4hmVk7wN53jLqh6kOkLn9KNlpPayqT9psvl7B4tliHCjtUZr8T1fklMmrQU9ZWQqsdFVOXiiVG77hMVIQUJavG57sqWtOD4KZZgOtXe8Nt3Qhf+14EHYRHUca47QZ6YarIhznjSETfVQ4u7UDgVNwTjMrLQDIcLRiOivnQMHGAJYkYjN2qMGIfdFu1Iuo1SA+2F0MFJj3qTPIhQ94pxTPvfpEeeBDgcUEGdm4EiTYFpoJv7fT1+8HgTI6U3SfWHDAWzJtOZP7CQZ1LAYJzXHC+q0c2ukdVT8nFl7goK1Egtjjvn0lvPQCtIKOu4ktjWc46qLG1vWj09sznMuAEcgOF/UtboPVXm1r5mWAh2uHTbFtfF/iKuII8tm2vNKnSj7r6AUmmCJS3Bc4D1TKcjBsIs0xWpamjQDAE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qr6NL9Cg9cUnVqy4GKs4j/P7Jvwi9fwMweUSQQuhvfM5nAgaoGP8HrY1QDA3?=
 =?us-ascii?Q?lZEqVxHFC5y69z16+szKnp82erv8GRt2DkcXiYLHjiB8e5G/ES2ici7KoHyu?=
 =?us-ascii?Q?gBiqMhOewZ6gpdR+ROCMLmGRolL3z0aMtrEoSa0XdXv1eT+bM2hOQNtjCfjm?=
 =?us-ascii?Q?O+OgFr7TbjOw84gbDPFYHBczDQPvPqiK/beLaSL8KTl9hx5+A3cPSplPpo9M?=
 =?us-ascii?Q?F3lWgiqcFrsn2x25Ww8trO7EohfzirfJT/YWSIxLmd0Zk+5krbZr0hlcef4w?=
 =?us-ascii?Q?Zw+fux0YzKZNRTELgTQMT+v9OchPcL3zstaRldYFAN3nGO/dMlR9L5acrNS8?=
 =?us-ascii?Q?51+VHX4L+JSxAWV2Q3Td9qsWpe7bNOPzd1EbC5gprKar6/nsBqGHgb02Azdy?=
 =?us-ascii?Q?TlXN9qhAb28LV839ew6gm+UaQvmt5y94AS0DcXsB87KncTzut+uKsHYTJ4K0?=
 =?us-ascii?Q?kZdj08tqfEnTlMfr9oB9Ykbt89oAkbWDZfon61uACAx2k2kiiWqVZHlNqcAK?=
 =?us-ascii?Q?Xxwt4L1PR+OTr9SIDS7KPdhDDRvL70ppjEUEFAM5vPL/jMRA+d0Pi/HBr5OO?=
 =?us-ascii?Q?xjPoBrR5y6Mtwxo2lrxjW31uLxWe/qmlPbQ/rx0R/cSCOOV8Qp6X66ucDNVc?=
 =?us-ascii?Q?HURbcNdbZ0uNOESnX0wW21X5W7b8EOG4xlMN8Bb44cgbvD1XfvfXPNKSx96K?=
 =?us-ascii?Q?OqV+ezDXBQz9iY0oXPeS4ZtOa7BEjcE1PI2m0/NPqosERgobg2fbGcLzA23X?=
 =?us-ascii?Q?lAdlzf3oRoDxfKxP7JcUHOpGR57xX0qrfdv7YLGQMZ6OzwXYpw/6J77LQEWS?=
 =?us-ascii?Q?cj+fC4yaExc2mMqZFUYOFLfDOauNhq0xd/UteC1UVIdO4/IsCteBtrbLgCnz?=
 =?us-ascii?Q?H68WGF1mDjN2RDYonefscL6DtDr/8j6Qrw3nfvhLz9Tp4greY/Ld9IHd4WYv?=
 =?us-ascii?Q?NGx+OxH7DHza5Ni/BSExNzsguxqxJATobiD8hiIJt4Bi40AF8nR+Ge1aGgyw?=
 =?us-ascii?Q?XjSMWD1fzP9cfSiRjf0TkdvT/Imi9RRdZumNwE5T0L8uyb61QfEUOnEdNNHr?=
 =?us-ascii?Q?KlacQZF8CF9rji/QLstpVcfzb8W2wLqh5KQM9Ggk7Hx0SNom1uA2mi3OJaFb?=
 =?us-ascii?Q?01MHlc7LRZOKvzuoI7/yEDv8so3vuciJ/aJ1rxI4+DRqM7ZIXh41asDKdGN4?=
 =?us-ascii?Q?WV/Brxgp/TUwUdzTL4BdpFX4MiqsRYH5Ce3xGFIlm9mC3iskJq2Vuxe6Miwk?=
 =?us-ascii?Q?uyOKXeIoOrBFm+Q14JAdlaJ63DZ5Ul4DQEH6EOf9vLa0Z7ThjUbdr2mCnd8+?=
 =?us-ascii?Q?QKu1WiK3akv4vcagBC18Q6L+7CHYUV4qwpTdIrgnUjkKLVmuJkMXs9azwuh6?=
 =?us-ascii?Q?caCN155+3kaYLbDsRPQcIq2l5f745YcBsI6rxD2vltYNF7oRFEfiF8EnuCtD?=
 =?us-ascii?Q?KmOkcogs6BdS35zuDrU4scZqXlb/L1SzerQB87QVqt/oS3tVjD+qQf2OvqR+?=
 =?us-ascii?Q?38ow8ONXIJh0FGGbj5JDdgYbBMu6lmJMUBGscWqi3fR4UE0GMRAhlNnwM9Yu?=
 =?us-ascii?Q?u6xPUkEGXrNIR9NgHpwtNPHwOvi6j/noKeHYpSNpWrM95BdrCiJicAXs5NrN?=
 =?us-ascii?Q?2L1+QsTSAPyFDSmz+dfGiDArN8B4BOsVId/MjXKUQZwEMrTcrV+MC29jBrb5?=
 =?us-ascii?Q?TJvYqvqKd3z8UB5BmF1uz/F2/reA9d9gRrbaw9VG++m8a2w9m6pAd0FZuAKG?=
 =?us-ascii?Q?Rlz6aPu20Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0b5301-38f2-42d8-95a2-08de85c534ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 14:38:37.3821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKo4wsAuezqowHUEo9GMMmaQxWr9SZvW4xKR0xKReXYwuyCSu8nQoV/8fKcqAt4mzG8VFvOSi2TErHnEd/cd6+ogV2RDiSTQGra618XtMr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14313
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29910-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,redhat.com,kernel.org,gmail.com,ragnatech.se,glider.be,armlinux.org.uk,pbarker.dev,linaro.org,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	NEURAL_HAM(-0.00)[-0.914];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: EB5F82CD149
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jakub Kicinski,

Thanks for the feedback.

> -----Original Message-----
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: 19 March 2026 00:05
> Subject: Re: [PATCH net-next] dt-bindings: net: Remove redundant ethernet=
-phy-ieee802.3-c22 fallback
>=20
> On Fri, 13 Mar 2026 13:06:21 +0000 Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Drop the ethernet-phy-ieee802.3-c22 compatible string from ethernet
> > PHY bindings and their examples. The c22 fallback is implicitly
> > assumed for PHY ID-based compatible strings and does not need to be
> > stated explicitly, unlike c45 which requires opt-in.
> >
> > Remove the c22 pattern from the ethernet-phy.yaml schema and update
> > examples in amlogic,g12a-mdio-mux, mscc-phy-vsc8531, renesas,ether,
> > and renesas,etheravb bindings accordingly.
>=20
> Maybe a noob question but why are you not updating all the other ones?
>=20
> $ git grep --files-with-matches 'ethernet-phy-ieee802.3-c22' -- \
> 	Documentation/devicetree/bindings/net/ | \
> 	wc -l
> 16

The other files have only 'compatible =3D "ethernet-phy-ieee802.3-c22"'

Whereas this patch removes the fallback pattern based on
Rob's suggestion [1]

compatible =3D "ethernet-phy-id0022.1622",                    =20
		 "ethernet-phy-ieee802.3-c22";=20


Please let me know, should I drop all 'ethernet-phy-ieee802.3-c22' compatib=
les?=20

[1] https://lore.kernel.org/all/CAL_JsqJK3brXxSeD-U42PBCeHoxUhWJYho3ZWj__t5=
C1LL-n-Q@mail.gmail.com/

Cheers,
Biju





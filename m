Return-Path: <linux-renesas-soc+bounces-31073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TjZ2OPp812m7OwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:18:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A563C9170
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 12:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EA7E3003EAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 10:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4B13ACF0B;
	Thu,  9 Apr 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ErYar8KJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6968B337BA6;
	Thu,  9 Apr 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729601; cv=fail; b=cQZtFr1WfAc3p6t92BfOaWig4/8xrNVyTD/SZy+a0FeBFvSaU4JpIr0p5MnCorhjugyaM9DlB6PEteJx6SkbqnjI+pLQpszTG1jRKKbGinJtTr8yNe2fFuvJJjhcksM4iz6WVjcHdWvfJB8L8+TUVh8gJqwqLLXAXKWV8fC+oeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729601; c=relaxed/simple;
	bh=QZdsK0oX5mpk6vZQCv1MVOiy9eU4af20Ncvp25uREGw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TLpVOl2BivxHsQcaNoBhz/8qWa2G6laDvGVmiCB/U+kIO+uG8JFsTzxJZGFf2Y+5XaAZKY6re3IF3pXhJfnYv94niMIYd7GAH1IR1DLN8ReMdK0tT3zmsY6iYraOaGOaibd6QW5r7VzhPNXz8Xv/3K6cEwP3OrcWoc9R/8DSnDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ErYar8KJ; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzJJe5unkpiv1ItXgxSuZRQXyNKZBVnCi4blDB9rMAA2BtwQAZPaKlPtDia5Jb+q84LD/K/PRQmGrND2hgNjMuXaE2dipQwWPULu7PYzugzwrMHnrqMw7zouPB8mk29s907GKaFPt+pqydxUM+5un2hprgCW+xvw1hpB99dY0tjsF0z/MeG3+XEFxX4U0jdHP6lwM/lw/NZTGAJxjEEKAg6QRf93wyOnVhz3Q+TI3ydYx9qHBPlelSWU88szD3TtkVN21WdxKHGI+mhLvSXBGBRhUN9E/LXDZRc4IAl+oJgYU4l8//GnTztzz97Nz7iK8wLylniYWk8Wn/rGGodsIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+nIqQj2EM8RzOyJkAQQd4xlLe52wbyx1IDp5XqRkxo=;
 b=tNzOwFajfcMOFaB8TZ6CHQ2czTtXeWjpi7nK2V6XKKGSuEp7CsP2PUjwnTv5i1M/oZ9pwl21chpKQmbsmqU8anoPAbuT8nnbD11KW4z7F705XvgS6Gg7NLECB2SwlIMxudlotl0UwjhfIBKUNbhFnPwOq1DP6D3MjoPdB6u9VopFbC9lhk7YkD+N9QybOs7Hh0F0eLvf9kQqlLtIX8JymHhznvq3lWILqmRyzmF8uqDNsWxsmvPgANPVF321xqtaMsObQHZcvJAsxRHBeWItlM2cgxADqSLaYiE3rOdqgxnoD0TS0XF0SPcpwCZbDhueK4hiS22tEiRg36B0hAF0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+nIqQj2EM8RzOyJkAQQd4xlLe52wbyx1IDp5XqRkxo=;
 b=ErYar8KJ+dn3QRJPwlL79ZNvGq5V/a+dgAPRSNtQDMKtgAFm/WmEVfEOksaciNwpeaZMzk+Wc9jxQFQmw29+qQbxpBv8A5PRuCl57RUmm7guMtu/Y41G1DuHnxou0HPeqduI3YqWVFLA8DzRmEelsgnOuL5i8ofCRmqXlTtBMf8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11697.jpnprd01.prod.outlook.com (2603:1096:604:230::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 10:13:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 10:13:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: RE: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Topic: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Index: AQHcyAc7ZyEBHUmX/kuuIfqJuejTO7XWgYEQ
Date: Thu, 9 Apr 2026 10:13:10 +0000
Message-ID:
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11697:EE_
x-ms-office365-filtering-correlation-id: af2af58e-ea24-471a-86a8-08de96209a2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 L8UrO4v4uBzotOKnaAbo7fSlKVjn7Q7q24M1lernPocYXQhT6aue6UZzond1Jj+seZxgv2rBCOfhti/I/dy2OHfmlGekZf4JNL29h6otRAX1KkbPqPtz3X5OZpOJcx7wVSOYBaToHgzbxSgiQMoGhU0iLs1TfsQCp8qJOC1+iEP759hSF/Tuzfl4LeM2klr+2PWuIUYABLnCmEsXr3782A1SKzoE3MWT+JApODEZMPxx22YXKMlHLMzZDcFcdmaEJwH+/jel6/KtCtVKICttf7ZZthfdMBfiavBpmHAS9s4RiSyByALBgvxf5cdWZ4qmtxGfp6fL10Wb5CrlvI82e7J3cD5li7rpqG1G75iJTfT4Pdusp7aiC4zize923cYTypMPFpF+QRB+cLTxla5ZMebOdjdzldj0a4onYuHbHtQGmFrzL+sYtKJD6FJ8/wjoxpoci4ls9rqFRuQIKS5R3nCAJ9D2vHX7Pwh8gIfDrZk0uf6j+wyKO9EIsLtMWGJT1aV++h+M3Wa8VHkcACgkYTvs3Ev8WaK0tz8lCzdst2zp6pWAS3HJMIuOmVIRYJHPyBA9hf8gWcbbbeHe5rzd5vjd/s1TcRbXEL+vHd5VkHff04hg/jv3y6qK1gqqjWKuIoiuTfRfrBWjNvD+3fFZf6fNaU5jwtbpSdcjMpXAgimXVKksz8T2LZTKUeE4S79wmHVl5OhV4UPv6Th3wVTgnzs1ouFi233ZKAVEMjbA9y+bSO37vI/E682D+AwgzMS2G2DZJntLM2MoBmzVYw3NltRPFR0EhxP6lMEZyRJcXBo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0353DKyIGsrKPnvNdTVkknxij55gmlSdQWdpM1HdAYzGcqNEMgiM5MtXbW?=
 =?iso-8859-1?Q?d9WbzjsXtf3EiTtjJaP+xF9++wmmsYEgXtrmaVwD40g6JT8GsQLZkOoNEM?=
 =?iso-8859-1?Q?bajtK3C5FjvRpK/LJiYnMa2aRTBxqMRqjM6ep8tRHY7WbIFihQi4n9m2to?=
 =?iso-8859-1?Q?uVBV1wUBsM0kPHvVJe5vGA4P5ZcUPPykx6dGHKFbsmP3kX7gp6XYKPZXE4?=
 =?iso-8859-1?Q?mX2JHPcjKzR2KpZ+YeNGS97hdHr7Jza0KhF3uYfmlbcofBBf7VmU0KewJp?=
 =?iso-8859-1?Q?qjLsp6mUQDoNaLSnPK8gtgwMYuoxVWRk96X3r4SFJcDXkKl+qwMDebKFpA?=
 =?iso-8859-1?Q?oK0sudwV09GkcV5ahWyMY4/qaY9IvWMc1nifBjeMUjSMJjxgRqkOh7MgG0?=
 =?iso-8859-1?Q?y0hcAwDzN5p2Fo3TeM4RwWKZ5wkt+9ennN+hNC/wxI9ENU50h68BIkNUgr?=
 =?iso-8859-1?Q?tO2691HBwrVhm3I+EC93jhDmKSZkFRyprP5iQ/1HAyUmUpoTHhOVZbi7aM?=
 =?iso-8859-1?Q?vuuhjRWIYTO1PqTF67hCMWwp/OLDZBbuLI0J8DSeTWjWHC28vgcrfINlBO?=
 =?iso-8859-1?Q?sEhVzcgDx/pSQDPUeWFQAQPx5zdW9koqaEKg149K6JVS0xgotfY0B7zWHz?=
 =?iso-8859-1?Q?3AoAeUey/AeHVvUeGehcKy8iRpXEH92OfTTtnwFhPDDJHviL99j/FdUGsY?=
 =?iso-8859-1?Q?ZWixf/TR4SfwV0cRSXu2SFonCL+JCClXjXgEVjO62wJNBapcR8ZxrHb1ZO?=
 =?iso-8859-1?Q?mgkVMgQ87a1tgBMSagzQ1ZP8C7iw6tZuBdKwC2/kwlMqE1EZLA8y231Fr4?=
 =?iso-8859-1?Q?Bfsss52dR1gbAKIw/BFtD/3YvKlLdHw1fQGc4QFQVGfPbBzG11aqf5zAHW?=
 =?iso-8859-1?Q?DcGqQf8OVoRetF6JFGJc9Tsg6WpZ7YZ6X7hPrnuf+rPO4sXkg5TwqTXYGv?=
 =?iso-8859-1?Q?urTyxIeZDoFVZGCP+UbE6s09Vde8ZeSAUm65dlvaEbOVH+y5ir68Ld/gTy?=
 =?iso-8859-1?Q?hIvmvPTY0pIg+/ayW3AngbjiD87iMa8gnSFk88rGfLxONjes+peYtN5LD7?=
 =?iso-8859-1?Q?/b4pRe05vEWm4xybqw1DmsJyX3h4g2zZZ+WdKD2Vkj81WR62RA1btAqHy3?=
 =?iso-8859-1?Q?NNDPcSsj7wSo8URmX3tRUDvjD5MMCbtYnHFeoiimIVVIQU0QlQmDMYM+xs?=
 =?iso-8859-1?Q?Who4Mw80s58l5saaTSLINQbCfnAM/GWN5u7NkpSbPTkcN0wxwwCNEzKjzv?=
 =?iso-8859-1?Q?AxvEIiZb0RBspGNLlZHFHPDi3bWIW8RXO/ufm5fcMcKvaPf0dFB8rnhjvy?=
 =?iso-8859-1?Q?56+XUfT+F7fdkwai59W0z8qM3q7L79Ehybg8kG0LRBMoZ6EbmFy7CP5IPT?=
 =?iso-8859-1?Q?DFlLsDlpxsWt6ehjuW/mRhbJIc1Q69mBF0WqjRobzA6vJ4n4esJThR24hy?=
 =?iso-8859-1?Q?VQwb197uHeqih0/5qRhMgQo8VEEFAKM4aMpaqp2LYg71OWJIzZ3If7Hlec?=
 =?iso-8859-1?Q?UtmAgehjZiNeh1teTZFhTOc2dm/X2cRT2Hv5PoL83XJjVqhoKUJvT/P5Ru?=
 =?iso-8859-1?Q?DA+AYf/y+qYqQwi1Um6Jc1Nwn0pmzfGDSbzzgJJAfyYUpP4exdbl5LMxpN?=
 =?iso-8859-1?Q?wU4Ehw5LquEBPGU1WT2djULc7nVhqkDHl32ccZH1rGbpERel7NG6U3BoQM?=
 =?iso-8859-1?Q?BOxr5y2+puO5keqFL47Ssi6yxt9QVLKFxubzs/954nd0Tcmqny+Mp2oyG1?=
 =?iso-8859-1?Q?q9q/ZRvChjIzp2r13bs1/OA/+yGGTr2vc5VscEB9RXYqAON4iNwLfN4jqU?=
 =?iso-8859-1?Q?nwzUbszM3Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af2af58e-ea24-471a-86a8-08de96209a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 10:13:10.2243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0qXkcRKGWVUUPMKin5LLZJ1h+Rq3yc3Z2mtJ6BXs/QNfkye5lNy9Q4jbzTMBbfqUXqgUGyhBQCqmmR35WAbPBTJ8JbSYdr/9J6G4pwwG1R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11697
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31073-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42A563C9170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ovidu,

Thanks for the patch.

> -----Original Message-----
> From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Sent: 09 April 2026 10:57
> Subject: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
>=20
> ksz9131_resume() was added to restore RGMII delays on resume for platform=
s where the PHY loses power
> during suspend to RAM. However, for s2idle, the PHY stays in Software Pow=
er-Down (SPD) during resume.
> In that case,
> ksz9131_config_rgmii_delay() accesses MMD registers before kszphy_resume(=
) clears BMCR_PDOWN. The
> KSZ9131 datasheet states that during SPD, access to the MMD registers is =
restricted:
>=20
>   - Only access to the standard registers (0 through 31) is supported.
>   - Access to MMD address spaces other than MMD address space 1 is
>     possible if the spd_clock_gate_override bit is set.
>   - Access to MMD address space 1 is not possible.
>=20
> Additionally, only RGMII delays were restored, while other settings from =
ksz9131_config_init() were
> not.
>=20
> Now that the preceding commit ("net: phylink: call phy_init_hw() in phyli=
nk resume path") performs a
> phy_init_hw() during phylink resume,
> ksz9131_resume() is no longer needed.
>=20
> Remove it and use kszphy_resume() directly.

How to avoid code duplication in this case?

For eg: phy_init_hw() makes the phy out of SPD state

and kszphy_resume() unconditionally makes the phy out of SPD state again.
      =AC kszphy_generic_resume
         =AC genphy_resume

Cheers,
Biju

>=20
> Fixes: f25a7eaa897f ("net: phy: micrel: Add ksz9131_resume()")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
>  drivers/net/phy/micrel.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c index 2a=
a1dedd21b8..f2513109865a
> 100644
> --- a/drivers/net/phy/micrel.c
> +++ b/drivers/net/phy/micrel.c
> @@ -6014,14 +6014,6 @@ static int lan8841_suspend(struct phy_device *phyd=
ev)
>  	return kszphy_generic_suspend(phydev);  }
>=20
> -static int ksz9131_resume(struct phy_device *phydev) -{
> -	if (phydev->suspended && phy_interface_is_rgmii(phydev))
> -		ksz9131_config_rgmii_delay(phydev);
> -
> -	return kszphy_resume(phydev);
> -}
> -
>  #define LAN8842_PTP_GPIO_NUM 16
>=20
>  static int lan8842_ptp_probe_once(struct phy_device *phydev) @@ -6929,7 =
+6921,7 @@ static struct
> phy_driver ksphy_driver[] =3D {
>  	.get_strings	=3D kszphy_get_strings,
>  	.get_stats	=3D kszphy_get_stats,
>  	.suspend	=3D kszphy_suspend,
> -	.resume		=3D ksz9131_resume,
> +	.resume		=3D kszphy_resume,
>  	.cable_test_start	=3D ksz9x31_cable_test_start,
>  	.cable_test_get_status	=3D ksz9x31_cable_test_get_status,
>  	.get_features	=3D ksz9477_get_features,
> --
> 2.34.1



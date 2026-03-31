Return-Path: <linux-renesas-soc+bounces-30631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPrTBHmHy2kuIwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:36:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6133663DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC306300E3E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 08:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403233CB2E0;
	Tue, 31 Mar 2026 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mZLoQdbm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42626298CA3;
	Tue, 31 Mar 2026 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945961; cv=fail; b=APUOOw0VqGHr1u9y7xXGkrHVVEGEzx0So3WWYWUXAQAbLGth+CwqUNECzBpMMR439dop2iLg58ZY4qgxm4vS+CElC4hzh/RpjEToMDnz6bCW1wNBLTAPqoyrw/DZn4NxtQQszV9fAWWb3rfME6yRcioTDKPIH9JyOVbGzbz32Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945961; c=relaxed/simple;
	bh=MByUdKgq01YtCs0o13sbaW3gW3+oIR8JwGkOHgZAup8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aXolBh5e7wgwCY5JvL2U2tXKchUw8PS/EipW82PJbkX1IsUCqBE90csuLFmYnXs6HyW1p5VMbphS48IeeVQ55y1Kzl+MY5h4snClfQpIdcOKGwkP3z0ZkANcO+RJc/nzgh90f8drQCxnHI2/VGuysq5+rgtziZI+GmGAzuLw8Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mZLoQdbm; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBV2WWPOAfsUlQOxqnswDrSqSQsnqXT9gxnSGEpEsFUkvPs0nrXrf/sHdfZOZiu6bIugC8GBCJugk5YFW82GLxo0vKO8GLBzbfTBT6DZJpFFIsOngzhDm6UQLbkvA72JyvfRXCk8M1aBlo/NBgRTzOA3EsltgdD1h7nFGpvXbrQN6IKpk94aw+5iEt3QXj5JY+0RVeXx/nRgmKJsMpgwypYAmbfygMoVjCCs/6m7xekBAOwlC8mKzz8cT8Xd/pH0UYCPDgWOgDcRKnEhHwCw6jVENXMD4A00XPLppEzMVX5VOfBp7sNRlEaCEvErjXhPWjvbveq7wwG1+aF1dLPVOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gSS5fWob/8WElJ+PPyRfjy8q431RY+kaJu9uZdpei8=;
 b=k74bi+XMbTYRsLBgfVg0Xk2jml9y9p7nzkLdXSDBIwE+5/coTLCY7OSVVWZ/TeTWwrp76D0H/Rg0sI6r184YBD8aL9Bid3pxJjWuSYFdB0ySsxCk2E0aY6haYk0ciu31VBePx/9C8EsYeEVs1tsqx2Do3d2cbza5EpX66zOAjD/Jt3SEWG0fTBzxmWT2FFdTCT1IROLsmPtP1dns0nuimhN5vrTdMizO5p8t6bOYYa2xVKmbElcSUlJUQrBBvNJoL6Ox4lSTAPXAYaHv50c/ygnVsIRQ9nLrOKA6lNkhltSAVoFBZYFyaeN+DrNpM5/LNzTMVSJr01vDX6SCnSe1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gSS5fWob/8WElJ+PPyRfjy8q431RY+kaJu9uZdpei8=;
 b=mZLoQdbmEvMURGyOhk9GaB6geYbKUZBvNOUVCXfywNrnCpI93p0jCM1+D8RI5BKiJm0kyhJtdFNNBXUzQg50/WqAmCAKTMPZwfsTDiGgDtXyAco0af6ZAGE6DjdP3XFNFCNccg4NseXDrTE61D59Gd/Sho39AwlL+pwl6XiXv/A=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TYXPR01MB15741.jpnprd01.prod.outlook.com (2603:1096:405:29d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 08:32:35 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::655d:9c47:4499:eb3a%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 08:32:35 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
CC: kernel test robot <lkp@intel.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aware
 switching
Thread-Topic: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aware
 switching
Thread-Index: AQHcvcOxXIAGYdaK3Uq+oriZ6kMYRbXF/AIAgAIxHfCAACM+AIAABbjg
Date: Tue, 31 Mar 2026 08:32:35 +0000
Message-ID:
 <TY4PR01MB1428256171207D756B9CD42608253A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20260327-rswitch_add_vlans-v2-13-d7f4358ca57a@renesas.com>
 <202603300436.ryIgiB0z-lkp@intel.com>
 <TY4PR01MB142828994B921A75367AEC5368253A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <b52623fe930b5c398f21d97f7069274a@tipi-net.de>
In-Reply-To: <b52623fe930b5c398f21d97f7069274a@tipi-net.de>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TYXPR01MB15741:EE_
x-ms-office365-filtering-correlation-id: 11199828-3061-496c-a906-08de8f000f55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021|18092099006|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 PkqXyFgRhMk5wFmzKb47GrxjAXgvG476lgsqz5ZyMZfSX+1/ZKSyRS9w+9gk+8nocSjTs2+qcXSlKqlywA8a8TwQSJDF2vVKdu/qKczLJ8Tcv+goNfbH6Fvi7XjepYX7mMhhs/7Z+xgUJ7jzeMvTNFzMUtIWrvDGAoSo6mdFcu3dzwgmJkl+qxIUkf2hWqFD4n0lJdzeYKHD2LlhxnQVICxodPSz00C2wPg0yyRcOm7FvM0phjs824qXqCXvfEvLVs2im93WdaWw9eRlKObdpYIaJD4beOjDUhMn83/gNOpion3JUWCiAcl9q6S0aIYGeNOaSGx4su6xKDIs3vNUpvV7RTCCQ7cIRZ7xUOmEWpQGdMA6Upl39yA3rs3zbZyiGu7gzbwHJEP8iK+vdJjLXAMCn1AqR4fQda3kfchmYiICDWS18Z8M5S85ELjHheBa5cwFjuoiTPW24duLJtJSkscgMxLOsJt/oPUUZfs+rKBbpIyhBcQ3m1HqvoUKXXC9a9oQzV+2cwYbdiZmhFM9ZG8J1euT67AQx4VYd8/KSwnOz7X8aZTXEl2HUIYgdP3Larfd1JGmV1KKVzjAdWRzBj2Eik5P1U0jg+0OqQPWcuW50XHWEewXOofRvlJAx65FA8sxiXxq3elUOxmAQXywouupJYV6rRaGEj4ChjBv0FoTTNPtoKF20fyXtGjsnIYyIp4RuF9cbofoPGmie1vFMLhf82xHJ36jUUd4PlBHg/jeSBvznv7aQEfNK+vFkSNY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021)(18092099006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uNxtzUuWU1T5My+6C0xXoCCJk/x/naVMWrxI9kSAn9MvuG90OCPSOFU+54ED?=
 =?us-ascii?Q?Z2/FSfiMOdVpc3WY7MNwKW55Ds7bR3UC/z8Mo1MUdYZcFwTUeaWExGKJvTlY?=
 =?us-ascii?Q?hkWB6jp+bsJ9YDjrnciNvMj3PzVN36WDrFiKpvEYw5dafbDCv3M3wrVSikS/?=
 =?us-ascii?Q?phm71CJyw3YDmYfodAyY1Y1QXBcskgUlyM4TJpXyzvSOGjcIW/ZNTlPpFKmM?=
 =?us-ascii?Q?j3l3CHERJJ4dYlZeL31o3R30fS5HRlhyS9EDnFE7t8gsKbHxSYQ7EvzT6UgJ?=
 =?us-ascii?Q?0FhMuoqLvKdBIVbPoV83v/nHxcFDs+vcIqFSRKQF8UT+fLXh3EoR2Gcqs3DU?=
 =?us-ascii?Q?wHsh32te1ZOYln3xN9ck5uIX+rcyKOIZXSuH2DfZVut7py7NMXwUdyyj0+SE?=
 =?us-ascii?Q?wSV93KLVfnMJqm3x+lynBBXY/svnIsYixgLK8Bbk468OZrxKwbmLKKSSnh6n?=
 =?us-ascii?Q?Z0qGSkVxqQVWdlIJlZwozmo7bfdBF4vLeWDOciLzgkRBgTJkbTalsSUS45Pa?=
 =?us-ascii?Q?Ps1CudgHF8WS7I01/8hD2+InJ+rPnJoM2m9Q+7kvdvsaKG9OB16b1j3thkgI?=
 =?us-ascii?Q?XXCIlUP0ZtcL08DXdKVts6yRStcuub597oCGYY+XpQaEORUZW2wkVVcMOwtG?=
 =?us-ascii?Q?7KeCB/29ilxEEGzWZ5QY6daAZLn+FC0+hIix9OcS7MhQBdFJL3g4rRECpZJN?=
 =?us-ascii?Q?t05gA1ilcAbj+kcCT8u5pQJOSDlWNzP5xtVm+NoXADDrCiCL+dKwz1nQVLi2?=
 =?us-ascii?Q?mYswnzlL/ug++Onw9GSwIUQHFm+bVtkeZvIrSgHI9NL2uqVUMQyNw6LYuFcJ?=
 =?us-ascii?Q?vhtIBCa/AQLwiZdF6p7YI6TVwdhUDttXS/PKOA4NWDzc9zNoCTHnAK6EtKro?=
 =?us-ascii?Q?CllxxgjTmHfvKnfhixao4a6WeN/dJdPXGSikJY3Mdr+OftNf3YS+SSWXd19b?=
 =?us-ascii?Q?a9ybMeorUQ66tyriIrFwJ7s1MBhjdP+F1UJRwvfrazOgfIa1dOLGXAgpNz59?=
 =?us-ascii?Q?iWeIHJz2qo0b1A3TGFegXwiSyrobamqpf1eXN8Hu6hFF0gt2TJRTftsv+rKJ?=
 =?us-ascii?Q?snURGJuXJuXmkmG/BMMgh/p0jelnMgss5TRFX6GFJRCHU+EQ9pKR4f5HegJ7?=
 =?us-ascii?Q?CI1d6QBPHsN2K7ME3YIpqJHSm1nZLe/UTlemyKmVRXClVTzwZtwQNidnj6TT?=
 =?us-ascii?Q?xOiJoVGhf0JmRtodl9qDTJZGDVQs4gTOGztGZnHEa4w8LZEAwQtC3j9J5iMw?=
 =?us-ascii?Q?EKr87+Cs8ZyFrZ9S1YErByddWUZ3Wziz7fc4k71hVeFjfiPMqR0kvxcK77Yr?=
 =?us-ascii?Q?he8OGmT+SqOolcML0pAgy5XsQX8astr8gDUST5hd4RlXaQVxaIcJ5xI66BRx?=
 =?us-ascii?Q?kAjvs15L4H+jd6C2R/2uSxRo4FgxAhibr+8Bu4Bo4DxvXhF0xvyZ4JNoAuuR?=
 =?us-ascii?Q?w0tncFRlFRkXtBgaI4XxqK6HFn/HuBuNHzx1Gau7Qhg8DuZFqe/FvULBYb3l?=
 =?us-ascii?Q?6RIMWE3EA4myheEyzIVEcNtOQeE4X08KfxBUodhOiPmfmhn+OnWDPCnUBsKr?=
 =?us-ascii?Q?vlz/c90dVB3XCGVx0nHsEVxrTqZsDHI5MI9VEUqzt5x4OkZ9/dkL0r5er1D2?=
 =?us-ascii?Q?fZqCTtKU5m6ijyRxSrQjNtgIUOo2n7jX5IOXZZO3TkJL+uol1/pwYbpzfL24?=
 =?us-ascii?Q?vePAB1hVpeoADgfRz08B/LMUEC252VKGwc0m57TAwZmvqi4EKBtwC3NSVo+E?=
 =?us-ascii?Q?5x7ess41Ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11199828-3061-496c-a906-08de8f000f55
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 08:32:35.2218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOJChyUpNYTmOcToklOIzGu9s/eSoELm1CRNt9pkI4RtGLN04ZlqgeUeUC3yX5vbSMMMDfVojs0CMN6TqHt+tX5HrNAA+Sob3gIx4wdFhnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15741
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30631-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B6133663DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Nicolai,

> -----Original Message-----
> From: Nicolai Buchwitz <nb@tipi-net.de>
> Sent: Tuesday, March 31, 2026 10:11 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: kernel test robot <lkp@intel.com>; Yoshihiro Shimoda <yoshihiro.shimo=
da.uh@renesas.com>; Andrew
> Lunn <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft.net>; Eric=
 Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pab=
eni@redhat.com>; oe-kbuild-
> all@lists.linux.dev; netdev@vger.kernel.org; linux-renesas-soc@vger.kerne=
l.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aw=
are switching
>
> [You don't often get email from nb@tipi-net.de. Learn why this is importa=
nt at
> https://aka.ms/LearnAboutSenderIdentification ]
>
> On 31.3.2026 08:10, Michael Dege wrote:
> > Hello,
> >
> > Who can kindly help me with this?
> >
> >> -----Original Message-----
> >> From: kernel test robot <lkp@intel.com>
> >> Sent: Sunday, March 29, 2026 10:37 PM
> >> To: Michael Dege <michael.dege@renesas.com>; Yoshihiro Shimoda
> >> <yoshihiro.shimoda.uh@renesas.com>;
> >> Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller
> >> <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> >> Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>
> >> Cc: oe-kbuild-all@lists.linux.dev; netdev@vger.kernel.org;
> >> linux-renesas-soc@vger.kernel.org; linux- kernel@vger.kernel.org;
> >> Michael Dege <michael.dege@renesas.com>
> >> Subject: Re: [PATCH net-next v2 13/13] net: renesas: rswitch: add
> >> vlan aware switching
> >>
> >> Hi Michael,
> >>
> >> kernel test robot noticed the following build errors:
> >>
> >> [auto build test ERROR on 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681]
> >>
> >> url:    https://github.com/intel-lab-
> &data=3D05%7C02%7Cmichael.dege%40renesas.com%7Cfd3cfc20b42f44b7452608de8e=
fd1ba2%7C53d82571da1947e49cb462
> 5a166a4a2a%7C0%7C0%7C639105414993315978%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0e=
U1hcGkiOnRydWUsIlYiOiIwLjAuMD
> AwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=
=3DWF5AVcAPSM1aIXYlaRwHrpyy8ES2
> 6RVDjv5bs20HHbc%3D&reserved=3D0
> >> lkp%2Flinux%2Fcommits%2FMichael-Dege%2Fnet-renesas-rswitch-improve-po
> >> rt-change-mode-
> >> functions%2F20260329-
> >> 154812&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15=
b
> >> 4f08de8dd3108a%7C53d82571da1947e4
> >> 9cb4625a166a4a2a%7C0%7C0%7C639104134822998103%7CUnknown%7CTWFpbGZsb3d
> >> 8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> >> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7
> >> C%7C&sdata=3DuP5U8NPFi2wo7VJDRGZ%2B
> >> ubwH50bZDvNuapBP0t76lL0%3D&reserved=3D0
> >> base:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> >> patch link:
> >> https://lor/
> >> e.kernel.org%2Fr%2F20260327-&data=3D05%7C02%7Cmichael.dege%40renesas.c=
o
> >> m%7Cfd3cfc20b42f44b7452608de8efd1ba2%7C53d82571da1947e49cb4625a166a4a
> >> 2a%7C0%7C0%7C639105414993365890%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hc
> >> GkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj
> >> oyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DpJlcsWcDiTvQNvNLB5FDg7JntAXrA3FXqXLGUG=
a
> >> 7igU%3D&reserved=3D0
> >> rswitch_add_vlans-v2-13-
> >> d7f4358ca57a%2540renesas.com&data=3D05%7C02%7Cmichael.dege%40renesas.c=
o
> >> m%7C27cab84d6f7640e15b4f08de8dd31
> >> 08a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823016624%7
> >> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU
> >> 1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld
> >> UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> >> 2QTz%2BFk8tDeHuE2Ac5ddl8tJ2mFSrm9l9mGnnLDsdW4%3D&reserved=3D0
> >> patch subject: [PATCH net-next v2 13/13] net: renesas: rswitch: add
> >> vlan aware switching
> >> config: arm64-defconfig
> >> (https://do/
> >> wnload.01.org%2F0day-&data=3D05%7C02%7Cmichael.dege%40renesas.com%7Cfd=
3
> >> cfc20b42f44b7452608de8efd1ba2%7C53d82571da1947e49cb4625a166a4a2a%7C0%
> >> 7C0%7C639105414993392563%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
> >> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D
> >> %3D%7C0%7C%7C%7C&sdata=3D%2Fy7UsHBCbBPCJ41ZF2vP9GN72sLQ9EPi4LqDqo%2BTY=
%
> >> 2B8%3D&reserved=3D0
> >> ci%2Farchive%2F20260330%2F202603300436.ryIgiB0z-
> >> lkp%40intel.com%2Fconfig&data=3D05%7C02%7Cmichael.dege%40renesas.com%7=
C
> >> 27cab84d6f7640e15b4f08de8dd3108a%
> >> 7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823028947%7CUnk
> >> nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcG
> >> kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo
> >> yfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dvhwu
> >> KaGAF4bhfSTb1VhDnII4SXsKbZ0zEPRt8ma49aM%3D&reserved=3D0)
> >> compiler: aarch64-linux-gcc (GCC) 15.2.0 reproduce (this is a W=3D1
> >> build):
> >> (https://do/
> >> wnload.01.org%2F0day-&data=3D05%7C02%7Cmichael.dege%40renesas.com%7Cfd=
3
> >> cfc20b42f44b7452608de8efd1ba2%7C53d82571da1947e49cb4625a166a4a2a%7C0%
> >> 7C0%7C639105414993417213%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
> >> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D
> >> %3D%7C0%7C%7C%7C&sdata=3DZl1LMDlreP06%2B7A3qL6tVNFStkTVmyTXO465fM76wlI=
%
> >> 3D&reserved=3D0
> >> ci%2Farchive%2F20260330%2F202603300436.ryIgiB0z-
> >> lkp%40intel.com%2Freproduce&data=3D05%7C02%7Cmichael.dege%40renesas.co=
m
> >> %7C27cab84d6f7640e15b4f08de8dd310
> >> 8a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823040554%7C
> >> Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1
> >> hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldU
> >> IjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DY
> >> TddyGPjtxfccjUPlLwizqOqUHOuiRxPxMqoNaHWW%2Bk%3D&reserved=3D0)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new
> >> version of the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes:
> >> | https://lore/
> >> |
> >> .kernel.org%2Foe-kbuild-all%2F202603300436.ryIgiB0z-lkp%40intel.com%2
> >> F
> >> |
> >> &data=3D05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7640e15b4f08d=
e
> >> 8
> >> |
> >> dd3108a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6391041348230521
> >> 9
> >> |
> >> 2%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCI
> >> s
> >> |
> >> IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D=
4
> >> B
> >> | 1hVOdPuyjze1HZCUi2v3gamNPgyeYcmx5NNzrDFjw%3D&reserved=3D0
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>    aarch64-linux-ld: Unexpected GOT/PLT entries detected!
> >>    aarch64-linux-ld: Unexpected run-time procedure linkages detected!
> >>    aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.o: in
> >> function
> >> `rswitch_port_obj_do_add_gwca':
> >> >> drivers/net/ethernet/renesas/rswitch_l2.c:443:(.text+0x11e0):
> >> >> undefined reference to
> >> `br_vlan_enabled'
> >>    aarch64-linux-ld: drivers/net/ethernet/renesas/rswitch_l2.o: in
> >> function `rswitch_port_obj_do_add':
> >>    drivers/net/ethernet/renesas/rswitch_l2.c:412:(.text+0x135c):
> >> undefined reference to
> >> `br_vlan_enabled'
> >> >> aarch64-linux-ld:
> >> >> drivers/net/ethernet/renesas/rswitch_l2.c:423:(.text+0x13bc):
> >> >> undefined reference
> >> to `br_vlan_enabled'
> >>
> >>
> >> vim +443 drivers/net/ethernet/renesas/rswitch_l2.c
> >>
> >>    402
> >>    403        static int rswitch_port_obj_do_add(struct net_device
> >> *ndev,
> >>    404                                           struct
> >> switchdev_obj_port_vlan *p_vlan)
> >>    405        {
> >>    406                struct rswitch_device *rdev =3D netdev_priv(ndev=
);
> >>    407                struct rswitch_private *priv =3D rdev->priv;
> >>    408                struct rswitch_etha *etha =3D rdev->etha;
> >>    409                int err;
> >>    410
> >>    411                /* Set Rswitch VLAN mode */
> >>    412                iowrite32(br_vlan_enabled(rdev->brdev) ?
> >> FIELD_PREP(FWGC_SVM, C_TAG) : 0,
> >>    413                          priv->addr + FWGC);
> >>    414
> >>    415                err =3D rswitch_write_vlan_table(priv,
> >> p_vlan->vid, etha->index);
> >>    416                if (err < 0)
> >>    417                        return err;
> >>    418
> >>    419                /* If the default vlan for this port has been
> >> set, don't overwrite it. */
> >>    420                if (ioread32(etha->addr + EAVCC))
> >>    421                        return NOTIFY_DONE;
> >>    422
> >>  > 423                if (br_vlan_enabled(rdev->brdev))
> >>    424                        rswitch_modify(priv->addr,
> >> FWPC0(etha->index), 0, FWPC0_VLANSA | FWPC0_VLANRU);
> >>    425
> >>    426                rswitch_modify(priv->addr,
> >> FWPC2(AGENT_INDEX_GWCA),
> >>    427                               FIELD_PREP(FWPC2_LTWFW,
> >> BIT(etha->index)),
> >>    428                               0);
> >>    429
> >>    430                return rswitch_port_set_vlan_tag(etha, p_vlan,
> >> false);
> >>    431        }
> >>    432
> >>    433        static int rswitch_port_obj_do_add_gwca(struct
> >> net_device *ndev,
> >>    434                                                struct
> >> rswitch_private *priv,
> >>    435                                                struct
> >> switchdev_obj_port_vlan *p_vlan)
> >>    436        {
> >>    437                int err;
> >>    438
> >>    439                if (!(p_vlan->flags & BRIDGE_VLAN_INFO_BRENTRY))
> >>    440                        return NOTIFY_DONE;
> >>    441
> >>    442                /* Set Rswitch VLAN mode */
> >>  > 443                iowrite32(br_vlan_enabled(ndev) ?
> >> FIELD_PREP(FWGC_SVM, C_TAG) : 0, priv->addr + FWGC);
> >>    444
> >>    445                err =3D rswitch_write_vlan_table(priv,
> >> p_vlan->vid, AGENT_INDEX_GWCA);
> >>    446                if (err < 0)
> >>    447                        return err;
> >>    448
> >>    449                /* If the default vlan for this port has been
> >> set, don't overwrite it. */
> >>    450                if (ioread32(priv->addr + GWVCC))
> >>    451                        return NOTIFY_DONE;
> >>    452
> >>    453                return rswitch_gwca_set_vlan_tag(priv, p_vlan,
> >> false);
> >>    454        }
> >>    455
> >>
> >
> > The function br_vlan_enabled() is exported from br_vlan.c and the
> > header file is if_bridge.h. Can anyone give me a hint what might be
> > wrong?
>
> Looking at the other switchdev drivers, I'd suspect that `RENESAS_ETHER_S=
WITCH` is missing `depends on
> BRIDGE || BRIDGE=3Dn`, which guards br_vlan_enabled().
>
> Nicolai
>

Thank you! That totally make sense.

Best regards,

Michael

> >
> > Thank you and best regards,
> >
> > Michael
> >
> >> --
> >> 0-DAY CI Kernel Test Service
> >> https://git/
> >> hub.com%2Fintel%2Flkp-&data=3D05%7C02%7Cmichael.dege%40renesas.com%7Cf=
d
> >> 3cfc20b42f44b7452608de8efd1ba2%7C53d82571da1947e49cb4625a166a4a2a%7C0
> >> %7C0%7C639105414993443101%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnR
> >> ydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3
> >> D%3D%7C0%7C%7C%7C&sdata=3DcUW%2B21BNNUlQA2fJLTBIDnQqyEMOztUdkUoC2bkmIv=
Q
> >> %3D&reserved=3D0
> >> tests%2Fwiki&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C27cab84d6f7=
6
> >> 40e15b4f08de8dd3108a%7C53d82571da
> >> 1947e49cb4625a166a4a2a%7C0%7C0%7C639104134823063970%7CUnknown%7CTWFpb
> >> GZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl
> >> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C
> >> 0%7C%7C%7C&sdata=3DwG2VKo2Ln60Ld4KV
> >> 8wHTcxRyskg0hzu0dZSVMg4v73g%3D&reserved=3D0


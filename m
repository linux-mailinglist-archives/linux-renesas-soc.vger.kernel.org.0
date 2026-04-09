Return-Path: <linux-renesas-soc+bounces-31083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKDaOBiV12mGPwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:01:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C46A33CA007
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 14:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26F9D30491AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 11:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1638D3C343F;
	Thu,  9 Apr 2026 11:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="v9WZNM0R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8783C3C3442;
	Thu,  9 Apr 2026 11:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735891; cv=fail; b=WZ7x8ZK7cvb0qj94YiQIua0GS3xIT0ctEIXt+xckbc3Txur0Z0SoCvG8nCvn46b6ltjE+3Vny2XbjloeX0pwIPwKMoLjDbPev5G4/QT+5ZAM68M0ykWc/AS2Giq2xwC6UAje6TCYnIVDKS9gXkPvVI/cFaNrORuHSWCLIRm/Zxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735891; c=relaxed/simple;
	bh=raEFdJUlspvyiHEpltFBs+8ntHqoeN9JIwRllCnMeUo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eBlX+gSYyrNY1R5mpdhdSJsqjcKrL8Uq4zoejN044fglTVULVE2G1rL7ILZktuOeggHZj251x0rbn0u23DJ4PYxqQgixWM8KmWaGHsvmv1i5c70G5kUg5+OIfgX/Noz8FpK7sPHlY7EbW+skpFJ6LJO6kf4WJ/K87HbFiKx/Do8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=v9WZNM0R; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYjcb6OjB9+U0n9H7JPc6kI67NYYQwAY3CjGxGjoqqHzSpYQJ+E2W+hwIej9irTtnbOaahdr6Bjzyv92Jhxn8zvodGAnJQv0vh5nQj49MmeRgRK990zPQcYKi/QVrkwf8yLBMe4/dX2tXxxVjrfOjkxGO1T93w+z0N9fK1+glXoKcn8TUblYimEIVDi1p23uy+W1ogBIHfblq+zssxBcd9gyAV8v6+xq0YLQ2KvAsRnfqgjTBarClyfITSnjsPvj3vuf1enVIdPxTl4QKUsQAksz5XNbIdzh/EWKEeLqcmpuZSYRj6x4E60jlJMcecGrU19QbfQiyTod0H9CDDgwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raEFdJUlspvyiHEpltFBs+8ntHqoeN9JIwRllCnMeUo=;
 b=jtMF3iM8bEUjOCaCe1iDNOSMipFdprYFHT9sRDvRbFCN8q4cHCGdaySVloKvdVz0sKdg3l6oiBS4pcE3BsDeeOTCrBwMTRAJunC/ydfbtHdLbrZQ+PnasmIq80k2sHM0cvMit7nro+Y7pTBuoP/OFTkX4yDkugTVuw4m9lAaCGyz55oCafrBXhrI/YSZry6Z1mgGEEEz+3szK0haoD+m/Dic9s7OwLT07RuLRHzSJ8h1mG/jo5UBPXi2fR22M3QX1uwTfcr16xq3lIYaFy+g2vModatauv5T95NYwdWwgUd5Bkqu2JadDzfA4eWGHJUil1uOgYGc5axYv7mYn/W5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raEFdJUlspvyiHEpltFBs+8ntHqoeN9JIwRllCnMeUo=;
 b=v9WZNM0R7BBhiVEZCT305RrQ4IE4sfeMjzxGku/fAxZt1CFYGn2x5Th2dWwPw6LPkWTSFAh/fUXL6vYvFGJQ+TgGXCM3unPxwRApnwS+xGssnChdkENDFEmjMG7pmyKd2TlH46eO4cJrwhmMt752y6oyK4Ai3ipKfVfPAWAuQxk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10268.jpnprd01.prod.outlook.com (2603:1096:400:1dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 11:58:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 11:58:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Russell King <linux@armlinux.org.uk>
CC: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Topic: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Thread-Index:
 AQHcyAc7ZyEBHUmX/kuuIfqJuejTO7XWgYEQgAAF+QCAAAVdkIAABJKAgAAAOdCAAAbQAIAABkPw
Date: Thu, 9 Apr 2026 11:58:04 +0000
Message-ID:
 <TY3PR01MB11346DC74FBC1043C9C0A27D186582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
 <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
 <TY3PR01MB11346A0F047F1F7296B8F4FCA86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <add_krK3MC1-SSsV@shell.armlinux.org.uk>
 <TY3PR01MB113465B215559404D0FBD04AE86582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adeH5y5TiZdaK94d@shell.armlinux.org.uk>
 <TY3PR01MB11346732465160FFE9DCAADD686582@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <adeNzh3eu9PSdEas@shell.armlinux.org.uk>
In-Reply-To: <adeNzh3eu9PSdEas@shell.armlinux.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10268:EE_
x-ms-office365-filtering-correlation-id: 4f9ba222-6357-46f2-97af-08de962f41e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 yCM9jd5O6Ga3tMr0a0ztomFwn4HGIrwr/0QtB6VdZocg7niTl5zqEOii7c2dx2y4siq+niKtuL3NzPiOwCcy7mwqA7/3u878v50DdPF8ijKSsaPSPy5p/hS03bfzbZC7rBY6FSUg1XbJgR59qJlOSGFBu7Gij8y00FxCr92NLwoApIBuckp+AbnuGjIMhJqdKutnN8lFPPocrqPGzJ+bQ4VE326hOmPQ6Zp7+yOx6t0NCmwtmW8fOwH3DoGoB9U4L1itSQ8gVYTTnujCtU/XRyS6MAba47uGCh+D+rxYKGS3hKIoLqNXZLS9pmMaTm/XbrxzmWrfTtyp4oqIvRnQW2xMcEi/0cGsz4RQLRirOu5norfnvjY2Abl8J/AymOtiJT+kLpgotANC36BmChqnCLc6DdeXcGi8vcgtfSs0/Y9OyTO6g0SsZXn5WFcf/OgdLNuzRyd0bXZCugJJvrlutsYWiKx4PeVF7+3O508CPKKqCTKzfHyIj/IL97+L9k6wduSPyiZvpO44TlaCBsuDRZW9Kkyu8QuaOXejzWqbYmXFyf+gnkkboEGyIZMNJlLdgJE+NRspRLirtJqIv7ivZjuhQ8dWfcGNRKeUqtL52bhPpFGRbvehDx/Z3dsWfyhTG0FZTwum5zSQX5ZEzv3rDQfgICkZnorqSxxlRkAfoB5nlNO8JJgmHO7g0R7uvawEB+TLhtKeUiodzjom7mpIGlKOdQ5qtuwgkc0yVJaQe30+y0rDeA+b/8hzybVANQHUbCpluOY8wozEMVCgSAo09MYhCXtPs3S3LWDH24OEbx0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wZCV/Da0EBeRwi70yR8A8txZcsHhAd80YbtrDLZOYMs/Rrv9NxMN8K5MhA7y?=
 =?us-ascii?Q?fi4IEckIZ8S5+D4tl50nWB43QYkgkWb3XG1SiGIOEpQWHqLU9U271VkyjEL9?=
 =?us-ascii?Q?94nfjH4VrEqeyvIES2i0LJesLkdklIwXSTSdP/pzcu9J1QhYXkWq5wkb+il3?=
 =?us-ascii?Q?om6AxQqTUYczn5nCcxp3xuqVfAe5Q+AP6FbTEy/MFOgcfwY0xoUa4MT5JBYg?=
 =?us-ascii?Q?xk08lRZflV90+D3k/6x3r00scqBpsySyNLQzk2aRVZESKJPDRB7yYzKuWuQj?=
 =?us-ascii?Q?l7ayiJuAvjJowZaoLZJxO63QfDtIvIX7EqrQn++jbPtrkQ6KpOjQW29g0Cfl?=
 =?us-ascii?Q?3dt5KyDZLbpOlJtlwmD3oElJCFrXH3T95D1WiKQnLnK3Y3Q35/MUwjykkMfi?=
 =?us-ascii?Q?E3UiAbz+b48PfdQFtrWVgWarRlEphyai0pU/n5u6d/pSqV+CKVq/2ZvEouoL?=
 =?us-ascii?Q?qrKUd5W9KufTDtMdPrss6iLAOuinPUQiLdIf85tiV87H/InXzj86zzY0RFJo?=
 =?us-ascii?Q?K0ITRtchw9M/lg04hOM/b3An/knL0iUdpuiBE+nloxBHJuC0wD8qqmmyg1Up?=
 =?us-ascii?Q?MYtuYFqiRZik6heyx1NwWcyfgKDWAWRrvVIQzbzBryQcELki1rDlouZGnYHn?=
 =?us-ascii?Q?Np7kd6+snKtZ5jXkS4zLwc5xxjxmJbxSXBpDCSw2Ik45fF+A+PqkbeF0A8a+?=
 =?us-ascii?Q?R2H3W/PLc+Schl32URqP/O+yXjDuoYQUX+dGKMSGzlEeoTx5S7bH1nt4Rewz?=
 =?us-ascii?Q?h8ZbgtvCsTR5SclATpkPd/ZRitjfe7TXHnQisOer3z1zr9lkFYdMwy50bygB?=
 =?us-ascii?Q?b1ydClQA1keAq4hpncyzKwu3hdWnzJyUz7GgHDqzkANXs4b98HDvTOSSX2TM?=
 =?us-ascii?Q?ou1tA1XaSha6yWY3ICOu3cTvN5TpTUl/O0jSijakcTLtdEa5mQhQCFly7Y0R?=
 =?us-ascii?Q?vNUTIg8k05eaoI0gmCzmwt+Q1TLfgVCHBevZ7Jh8Evsk7Vvhq+zYARuKzkUz?=
 =?us-ascii?Q?SR1id/YlXhcHIddMxrUu8E2+MOX7SSPhFhtHHbzWjCcYUWclURWcHh29ieIS?=
 =?us-ascii?Q?eMD9Zeti+XuO2pRpqQVjgj/MN1xoFqF0HVlE2EHDj+9XCtXSDLD1O4p6/jV+?=
 =?us-ascii?Q?zR0dhcBR2jyvTelnsACKHA4HrZLC5TYhstoOX98O9m5r0u27R2Bmn0okX1Ga?=
 =?us-ascii?Q?Blcs91C7apwPWd/ftBpydgY9n2KMSDBcYbxTd/5oPSEuXpGXKc59R2bu7Wy3?=
 =?us-ascii?Q?jXmLnwG0QQ9QJ2Ur0nSvqRBmQR2uCepkS+JKd6DfoPsgZ47wp+gs96oIlI1P?=
 =?us-ascii?Q?IS9cXHmSvXT42fxuV90W3DNtB2vW1wyl2JwNqjpx/XkAmDLTdiHveOu+4A/M?=
 =?us-ascii?Q?w0guAKIEqHgKZMHIQPLl6gaia+BHf+Rk2UDmZKe2hNmsi4scXtk4Tf00j0fi?=
 =?us-ascii?Q?UkmzPiw9TjOxNdSAoxeDHMzPAEdDMqoi55mDyvRBBcFlDH+ymZB3dIjJxzbV?=
 =?us-ascii?Q?EyAuFZToHLjDzJOR8oYMJWIMAgLXbKI1MED39fsXKshLiiKpszoCsX9q0D0D?=
 =?us-ascii?Q?5GV6niXV1UlPqOxiB4b27HscSaYHS/ebQsYtm5DUtIfpAt6twXjAPexvLX+y?=
 =?us-ascii?Q?J8IgoLmyc72Q5fVc13dZI+YsuSXIOCymLDK3RdmHQNXq0x0/1qCQqeuKHZ5S?=
 =?us-ascii?Q?CY0yS+SEffo8K6CZ7bMOnGeiQKYjzjRNKpkWUOg6TIRmgrGM3zRlsP10CUJc?=
 =?us-ascii?Q?BuI6FnHoGg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9ba222-6357-46f2-97af-08de962f41e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 11:58:04.6349
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5RP/EGO3nUlLYvWh6IO1ZXWFgYWC1bJDrE4qE9JsqkwR1rZ1NfuNYzejSnVSw7W7NbnAHNiRBbfEwHJ+0E2f5VpKoZWCRj4bVOahGbLsqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10268
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31083-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[bp.renesas.com:query timed out,armlinux.org.uk:query timed out];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[linux.armlinux.org.uk:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: C46A33CA007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Russell King,

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: 09 April 2026 12:30
> Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
>=20
> On Thu, Apr 09, 2026 at 11:19:43AM +0000, Biju Das wrote:
> > Hi Russell King,
> >
> > > -----Original Message-----
> > > From: Russell King <linux@armlinux.org.uk>
> > > Sent: 09 April 2026 12:05
> > > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove
> > > ksz9131_resume()
> > >
> > > On Thu, Apr 09, 2026 at 10:52:35AM +0000, Biju Das wrote:
> > > > Hi Russell King,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > -----Original Message-----
> > > > > From: Russell King <linux@armlinux.org.uk>
> > > > > Sent: 09 April 2026 11:30
> > > > > Subject: Re: [PATCH net v2 2/2] net: phy: micrel: remove
> > > > > ksz9131_resume()
> > > > >
> > > > > phy_init_hw() will also call drv->config_intr(), so that doesn't =
need to be done either.
> > > > >
> > > > > It will also call drv->config_init(), which will call kszphy_conf=
ig_reset().
> > > > >
> > > > > So most of kszphy_resume() becomes unnecessary. I think the only
> > > > > thing that remains would be the call to kszphy_enable_clk() -
> > > > > and is it fine to call that after
> > > phy_init_hw() ?
> > > >
> > > > It just needs kszphy_enable_clk() and phydev->drv->config_intr()
> > > > to enable PHY interrupts for suspend-to-RAM to work on RZ/G3E SMARC=
 EVK.
> > >
> > > I think you mean WoL rather than suspend-to-RAM, although I don't
> > > see anything in micrel.c that hints that WoL is supported, so please =
explain why and how the PHY
> interrupt impacts suspend-to-RAM.
> >
> > This is not WoL. During Suspend-to-RAM, the DDR goes into retention
> > mode while the CPU, SoC, and PHY power is cut off.
> >
> > During resume, TF-A detects WARM_RESET, brings DDR out of retention,
> > and jumps to the PSCI resume path.
> >
> > >
> > > Note that a particular interrupt should not wake the system unless
> > > enable_irq_wake() has been called for that specific interrupt.
> >
> > If PHY interrupts are not configured during resume, no link interrupt i=
s received and the message:
> > "renesas-gbeth 11c30000.ethernet end0: Link is Up - 1Gbps/Full - flow c=
ontrol rx/tx"
> > is not seen, as shown in [1].
>=20
> ... and why does that happen? Is it because the PHY has lost its interrup=
t configuration and that needs
> to be reprogrammed?

Yes, but phy_init_hw() reconfigures the PHY interrupt during resume.
This is due to phydev->interrupts =3D PHY_INTERRUPT_DISABLED; in the suspen=
d path, as you mentioned below.

>=20
> If you don't disable the PHY interrupt in the suspend path, then will the=
 call to drv->config_intr()
> via phy_init_hw() before
> phy_resume() be sufficient?

Yes, I confirm that if the PHY interrupt is not disabled in the suspend pat=
h, the call to
drv->config_intr() via phy_init_hw() before phy_resume() would be sufficien=
t.

Cheers,
Biju


